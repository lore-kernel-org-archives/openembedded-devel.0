Received: from mail2.matrix-vision.com ([85.214.244.251])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michael.jones@matrix-vision.de>) id 1Q0WRJ-0001ZK-K0
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Mar 2011 10:57:56 +0100
Received: from mail2.matrix-vision.com (localhost [127.0.0.1])
	by mail2.matrix-vision.com (Postfix) with ESMTP id 45FA641432;
	Fri, 18 Mar 2011 10:49:25 +0100 (CET)
Received: from erinome (g2.matrix-vision.com [80.152.136.245])
	by mail2.matrix-vision.com (Postfix) with ESMTPA id EF21F41429;
	Fri, 18 Mar 2011 10:49:24 +0100 (CET)
Received: from erinome (localhost [127.0.0.1])
	by erinome (Postfix) with ESMTP id 6CC1C6F8A;
	Fri, 18 Mar 2011 10:49:24 +0100 (CET)
Received: by erinome (Postfix, from userid 108)
	id 5F2256F9C; Fri, 18 Mar 2011 10:49:24 +0100 (CET)
Received: from [192.168.65.46] (host65-46.intern.matrix-vision.de
	[192.168.65.46]) by erinome (Postfix) with ESMTPA id 4BB606F8A;
	Fri, 18 Mar 2011 10:49:24 +0100 (CET)
Message-ID: <4D832AA4.1020701@matrix-vision.de>
Date: Fri, 18 Mar 2011 10:49:24 +0100
From: Michael Jones <michael.jones@matrix-vision.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.12) Gecko/20101029 Lightning/1.0b2 Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org, 
 koen@dominion.thruhere.net
X-MV-Disclaimer: true (erinome)
X-AV-Checked: ClamAV using ClamSMTP (erinome)
X-AV-Checked: ClamAV using ClamSMTP (mail2)
Subject: staging & using kernel headers
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Mar 2011 09:58:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello Koen & co.,

I recently bumped into a problem with recipes ti-dmai and gstreamer-ti
when they included the kernel headers.  These headers were staged by
kernel.bbclass sysroot_stage_all_append() with a lot of manual copying
and manipulating links and such, rather than using 'oe_runmake
headers_install'.  Back in October Koen explained this
(http://article.gmane.org/gmane.comp.handhelds.openembedded/37772) is
because some recipes use private kernel API.  The result of this with my
2.6.38 kernel is that I get a warning-turned-error from linux/types.h
that "Attempt to use kernel headers from user space".

ti-dmai_svn.bb hacks this (self-admittedly) by defining
_EXPORTED_HEADERS_ (commit d0184be13b4879e, also from Koen).  I had to
modify the recipe to enable the define to actually get passed as a
compile option.  For gstreamer-ti, there was no such hack in place, but
it was needed for the same reason.

I would think it is a common requirement for recipes to include kernel
headers, and this warning has been around since 2.6.32.  I got around it
with gstreamer-ti by installing the headers with headers_install into a
subdir of the headers directory set up currently by kernel.bbclass, and
pointing the gstreamer-ti recipe at that, but I'm not sure if there's a
better way.

If there are some recipes that need internal kernel sources staged for
them, then it seems to me that we need both sets of kernel headers: one
exported to userspace (with headers_install) and one that is not.
Right?  Can we agree on a standard place/manner for this?

Below is my patch to get gstreamer-ti working, for illustration.

-Michael

From 71b3762ad5f6e7a8553a6b780296f7e994513f0b Mon Sep 17 00:00:00 2001
From: Michael Jones <michael.jones@matrix-vision.de>
Date: Thu, 17 Mar 2011 17:23:53 +0100
Subject: [PATCH] install kernel headers exported for userspace

kernel.bbclass already copies and manipulates kernel headers into
sysroot, but it doesn't export them properly using "make headers_install"
which leads to a compiler error/warning in linux/types.h:

"Attempt to use kernel headers from user space, see
http://kernelnewbies.org/KernelHeaders"

---
 classes/kernel.bbclass      |    5 +++++
 recipes/ti/gstreamer-ti.inc |    2 +-
 2 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
index 422bcd7..6b46d51 100644
--- a/classes/kernel.bbclass
+++ b/classes/kernel.bbclass
@@ -210,6 +210,11 @@ sysroot_stage_all_append() {
 	[ -e Module.symvers ] && install -m 0644 Module.symvers $kerneldir/
 
 	cp -fR scripts $kerneldir/
+
+	# install kernel headers in the proper manner to export them
+	# for userspace programs
+	userspace_hdrs=${kerneldir}/userspace
+	oe_runmake headers_install INSTALL_HDR_PATH=${userspace_hdrs} ARCH=${ARCH}
 }
 
 kernel_do_configure() {
diff --git a/recipes/ti/gstreamer-ti.inc b/recipes/ti/gstreamer-ti.inc
index 905e192..04d990f 100644
--- a/recipes/ti/gstreamer-ti.inc
+++ b/recipes/ti/gstreamer-ti.inc
@@ -72,7 +72,7 @@ CPPFLAGS_append = " -DPlatform_${PLATFORM}"
 export ENCODE_COMBO    = "${installdir}/ti-codecs-server/encodeCombo.x64P"
 export DECODE_COMBO    = "${installdir}/ti-codecs-server/decodeCombo.x64P"
 # Makefile also expects to be able to find the kernel headers from the envirionment
-export LINUXKERNEL_INSTALL_DIR = "${STAGING_KERNEL_DIR}"
+export LINUXKERNEL_INSTALL_DIR = "${STAGING_KERNEL_DIR}/userspace"
 
 do_configure_prepend() {
 	# PSP kernel is based on older DSS. we need to replace linux/omapfb.h with mach/omapfb.h
-- 
1.7.4.1


MATRIX VISION GmbH, Talstrasse 16, DE-71570 Oppenweiler
Registergericht: Amtsgericht Stuttgart, HRB 271090
Geschaeftsfuehrer: Gerhard Thullner, Werner Armingeon, Uwe Furtner



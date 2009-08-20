Received: from [63.81.120.158] (helo=gateway-1237.mvista.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <clarson@mvista.com>) id 1MdyYN-0003jS-H2
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Aug 2009 05:43:10 +0200
Received: from localhost.localdomain (foul.az.mvista.com [10.50.1.75])
	by hermes.mvista.com (Postfix) with ESMTP
	id AB0A91B7A0; Wed, 19 Aug 2009 20:25:50 -0700 (PDT)
From: Chris Larson <clarson@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Aug 2009 20:24:36 -0700
Message-Id: <1250738680-20274-5-git-send-email-clarson@mvista.com>
X-Mailer: git-send-email 1.6.0
In-Reply-To: <1250738680-20274-4-git-send-email-clarson@mvista.com>
References: <1250738680-20274-1-git-send-email-clarson@mvista.com>
	<1250738680-20274-2-git-send-email-clarson@mvista.com>
	<1250738680-20274-3-git-send-email-clarson@mvista.com>
	<1250738680-20274-4-git-send-email-clarson@mvista.com>
Subject: [PATCH] kernel.bbclass: Install & package symvers as /boot/Module.symvers-<ver>.
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
X-List-Received-Date: Thu, 20 Aug 2009 03:43:14 -0000

Signed-off-by: Chris Larson <clarson@mvista.com>
---
 classes/kernel.bbclass |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
index 2947d4d..a8b2b0d 100644
--- a/classes/kernel.bbclass
+++ b/classes/kernel.bbclass
@@ -179,6 +179,7 @@ kernel_do_install() {
 	install -m 0644 System.map ${D}/boot/System.map-${KERNEL_VERSION}
 	install -m 0644 .config ${D}/boot/config-${KERNEL_VERSION}
 	install -m 0644 vmlinux ${D}/boot/vmlinux-${KERNEL_VERSION}
+	[ -e Module.symvers ] && install -m 0644 Module.symvers ${D}/boot/Module.symvers-${KERNEL_VERSION}
 	install -d ${D}/etc/modutils
 	if [ "${KERNEL_MAJOR_VERSION}" = "2.6" ]; then
 		install -d ${D}/etc/modprobe.d
@@ -229,7 +230,7 @@ EXPORT_FUNCTIONS do_compile do_install do_stage do_configure
 PACKAGES = "kernel kernel-base kernel-image kernel-dev kernel-vmlinux"
 FILES = ""
 FILES_kernel-image = "/boot/${KERNEL_IMAGETYPE}*"
-FILES_kernel-dev = "/boot/System.map* /boot/config*"
+FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers* /boot/config*"
 FILES_kernel-vmlinux = "/boot/vmlinux*"
 RDEPENDS_kernel = "kernel-base"
 RRECOMMENDS_kernel-module-hostap-cs += '${@base_version_less_or_equal("KERNEL_VERSION", "2.6.17", "", "apm-wifi-suspendfix", d)}'
-- 
1.6.0




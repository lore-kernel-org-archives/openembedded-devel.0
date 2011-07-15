Received: from 75-148-42-21-colorado.hfc.comcastbusiness.net ([75.148.42.21]
	helo=judge.camp.se-eng.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ray.danks@se-eng.com>) id 1Qhlrj-0005sD-4E
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Jul 2011 19:07:52 +0200
Received: from localhost (localhost [127.0.0.1])
	by judge.camp.se-eng.com (Postfix) with ESMTP id C705920C9F53;
	Fri, 15 Jul 2011 10:55:09 -0600 (MDT)
X-Virus-Scanned: amavisd-new at camp.se-eng.com
Received: from judge.camp.se-eng.com ([127.0.0.1])
	by localhost (judge.camp.se-eng.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id cry2GGNt2vhh; Fri, 15 Jul 2011 10:55:08 -0600 (MDT)
Received: from [172.20.202.150] (beast.camp.se-eng.com [172.20.202.150])
	by judge.camp.se-eng.com (Postfix) with ESMTPSA id E590220C9F52;
	Fri, 15 Jul 2011 10:55:08 -0600 (MDT)
Message-ID: <4E20710B.6060906@se-eng.com>
Date: Fri, 15 Jul 2011 10:55:39 -0600
From: Raymond Danks <ray.danks@se-eng.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Cc: coreboot@coreboot.org
Subject: [PATCH 1/2] Add mkelfimage and support for generating kernel+initrd ELF payloads to OpenEmbedded
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
X-List-Received-Date: Fri, 15 Jul 2011 17:07:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On x86, and ELF image file may be stored as a coreboot payload.  This 
image file may be a kernel or a kernel+initrd.

Documentation on this has been started on the coreboot wiki:
http://www.coreboot.org/Mkelfimage

We have seen success using the mkelfimage utility to construct a 
kernel+initrd image using the micro-image OpenEmbedded image as an initrd.
http://www.se-eng.com/wiki/index.php/Open_Embedded_Setup

The first patch contains the meta files for the mkelfimage utility in 
OpenEmbedded.
---
  recipes/mkelfimage/files/no-stack-protector.patch |   11 +++++++++++
  recipes/mkelfimage/mkelfimage-native_git.bb       |   11 +++++++++++
  recipes/mkelfimage/mkelfimage.inc                 |    3 +++
  recipes/mkelfimage/mkelfimage_git.bb              |   17 +++++++++++++++++
  4 files changed, 42 insertions(+), 0 deletions(-)
  create mode 100644 recipes/mkelfimage/files/no-stack-protector.patch
  create mode 100644 recipes/mkelfimage/mkelfimage-native_git.bb
  create mode 100644 recipes/mkelfimage/mkelfimage.inc
  create mode 100644 recipes/mkelfimage/mkelfimage_git.bb

diff --git a/recipes/mkelfimage/files/no-stack-protector.patch 
b/recipes/mkelfimage/files/no-stack-protector.patch
new file mode 100644
index 0000000..135de8d
--- /dev/null
+++ b/recipes/mkelfimage/files/no-stack-protector.patch
@@ -0,0 +1,11 @@
+--- mkelfImage/Makefile.orig    2011-06-17 15:20:46.816870941 -0600
++++ mkelfImage/Makefile    2011-06-17 15:20:59.619382362 -0600
+@@ -14,7 +14,7 @@
+ pkglibdir = $(libdir)/$(PACKAGE)
+ pkgincludedir = $(includedir)/$(PACKAGE)
+
+-CPPFLAGS=-DVERSION='"$(VERSION)"' -DRELEASE_DATE='"$(RELEASE_DATE)"' 
-I include
++CPPFLAGS=-fno-stack-protector -DVERSION='"$(VERSION)"' 
-DRELEASE_DATE='"$(RELEASE_DATE)"' -I include $(CFLAGS) $(LDFLAGS)
+ HOST_CPPFLAGS=$(CPPFLAGS)
+ I386_CPPFLAGS=$(CPPFLAGS) -I arch/i386/include
+ IA64_CPPFLAGS=$(CPPFLAGS) -I arch/ia64/include
diff --git a/recipes/mkelfimage/mkelfimage-native_git.bb 
b/recipes/mkelfimage/mkelfimage-native_git.bb
new file mode 100644
index 0000000..e2f251e
--- /dev/null
+++ b/recipes/mkelfimage/mkelfimage-native_git.bb
@@ -0,0 +1,11 @@
+require mkelfimage_${PV}.bb
+inherit native
+
+do_stage () {
+    install -m 0755 objdir/sbin/mkelfImage ${STAGING_BINDIR}/
+}
+
+do_install () {
+    :
+}
+
diff --git a/recipes/mkelfimage/mkelfimage.inc 
b/recipes/mkelfimage/mkelfimage.inc
new file mode 100644
index 0000000..e06ed67
--- /dev/null
+++ b/recipes/mkelfimage/mkelfimage.inc
@@ -0,0 +1,3 @@
+LICENSE = "GPLv2"
+DESCRIPTION = "A utility to create ELF boot images from Linux kernel 
images"
+SECTION = "console/utils"
diff --git a/recipes/mkelfimage/mkelfimage_git.bb 
b/recipes/mkelfimage/mkelfimage_git.bb
new file mode 100644
index 0000000..7855f58
--- /dev/null
+++ b/recipes/mkelfimage/mkelfimage_git.bb
@@ -0,0 +1,17 @@
+require mkelfimage.inc
+
+SRCREV = "c045b4cc458a62dbb1dd99ae6a9343e52d1fe1e0"
+PV = "1.0.0+gitr${SRCPV}"
+PR = "r1"
+
+S = "${WORKDIR}/git/util/mkelfImage"
+
+SRC_URI = 
"git://review.coreboot.org/p/coreboot;protocol=http;branch=master \
+       file://no-stack-protector.patch"
+
+DEFAULT_PREFERENCE = "1"
+
+inherit autotools
+
+SRC_URI[md5sum] = "719b22bdd34431203f9349250c67c5e3"
+SRC_URI[sha256sum] = 
"9186e6e7302f38c1f77b763f0f14843fabc873ac7c81ede8ee094a47055668b5"
-- 
1.7.0.4




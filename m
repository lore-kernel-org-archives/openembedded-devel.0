Received: from 75-148-42-21-colorado.hfc.comcastbusiness.net ([75.148.42.21]
	helo=judge.camp.se-eng.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raymondd@se-eng.com>) id 1Qhrdn-0007cz-Kq
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Jul 2011 01:17:52 +0200
Received: from localhost (localhost [127.0.0.1])
	by judge.camp.se-eng.com (Postfix) with ESMTP id A3E0620C9488
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jul 2011 17:04:24 -0600 (MDT)
X-Virus-Scanned: amavisd-new at camp.se-eng.com
Received: from judge.camp.se-eng.com ([127.0.0.1])
	by localhost (judge.camp.se-eng.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id CVIKoX8zUn2B; Fri, 15 Jul 2011 17:04:23 -0600 (MDT)
Received: from beast (beast.camp.se-eng.com [172.20.202.150])
	by judge.camp.se-eng.com (Postfix) with ESMTP id 6F63C20C9473;
	Fri, 15 Jul 2011 17:04:23 -0600 (MDT)
Received: by beast (Postfix, from userid 1000)
	id D5DB12C959; Fri, 15 Jul 2011 17:04:54 -0600 (MDT)
From: Raymond Danks <ray.danks@se-eng.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Jul 2011 17:04:37 -0600
Message-Id: <1310771078-18629-1-git-send-email-ray.danks@se-eng.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <4E20710B.6060906@se-eng.com>
References: <4E20710B.6060906@se-eng.com>
Subject: [PATCH 1/2 v2] mkelfimage: Add version c045b4cc from Git (initial recipe)
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
X-List-Received-Date: Fri, 15 Jul 2011 23:17:52 -0000

On x86, and ELF image file may be stored as a coreboot payload.  This image file may be a kernel or a kernel+initrd.

Documentation on this has been started on the coreboot wiki:
http://www.coreboot.org/Mkelfimage

We have seen success using the mkelfimage utility to construct a kernel+initrd image using the micro-image OpenEmbedded image as an initrd.
http://www.se-eng.com/wiki/index.php/Open_Embedded_Setup

Build tested using Ubuntu 10.04 x86_64-linux targeting i686-oe-linux using a one-off of the i686-generic.conf machine targeting a 4MB flash part.

Signed-off-by: Raymond Danks <ray.danks@se-eng.com>
---
v2:
 * Updated meta files to adhere to StyleGuide
   - No need for separate target and native .bb files anymore.
   - Remove .inc
 * Document no-stack-protector.patch
 * Update commit summary and log.
 * Add Signed-off-by

 recipes/mkelfimage/files/no-stack-protector.patch |   17 +++++++++++++++++
 recipes/mkelfimage/mkelfimage_git.bb              |   18 ++++++++++++++++++
 2 files changed, 35 insertions(+), 0 deletions(-)
 create mode 100644 recipes/mkelfimage/files/no-stack-protector.patch
 create mode 100644 recipes/mkelfimage/mkelfimage_git.bb

diff --git a/recipes/mkelfimage/files/no-stack-protector.patch b/recipes/mkelfimage/files/no-stack-protector.patch
new file mode 100644
index 0000000..f81bf16
--- /dev/null
+++ b/recipes/mkelfimage/files/no-stack-protector.patch
@@ -0,0 +1,17 @@
+Gcc 4.1 comes with an SSP https://wiki.ubuntu.com/GccSsp
+
+This is disabled to work around '__stack_chk_fail' symbol not found failures in the mkelfimage build.
+
+http://www.coreboot.org/FAQ/Obsolete#How_do_I_fix_stack_chk_fail_errors.3F
+
+--- mkelfImage/Makefile.orig	2011-06-17 15:20:46.816870941 -0600
++++ mkelfImage/Makefile	2011-06-17 15:20:59.619382362 -0600
+@@ -14,7 +14,7 @@
+ pkglibdir = $(libdir)/$(PACKAGE)
+ pkgincludedir = $(includedir)/$(PACKAGE)
+ 
+-CPPFLAGS=-DVERSION='"$(VERSION)"' -DRELEASE_DATE='"$(RELEASE_DATE)"' -I include
++CPPFLAGS=-fno-stack-protector -DVERSION='"$(VERSION)"' -DRELEASE_DATE='"$(RELEASE_DATE)"' -I include $(CFLAGS) $(LDFLAGS)
+ HOST_CPPFLAGS=$(CPPFLAGS)
+ I386_CPPFLAGS=$(CPPFLAGS) -I arch/i386/include
+ IA64_CPPFLAGS=$(CPPFLAGS) -I arch/ia64/include
diff --git a/recipes/mkelfimage/mkelfimage_git.bb b/recipes/mkelfimage/mkelfimage_git.bb
new file mode 100644
index 0000000..2184f81
--- /dev/null
+++ b/recipes/mkelfimage/mkelfimage_git.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "A utility to create ELF boot images from Linux kernel images"
+HOMEPAGE = "http://www.coreboot.org/Mkelfimage"
+SECTION = "devel"
+LICENSE = "GPLv2"
+
+SRCREV = "c045b4cc458a62dbb1dd99ae6a9343e52d1fe1e0"
+PV = "1.0.0+gitr${SRCPV}"
+PR = "r0"
+
+SRC_URI = "git://review.coreboot.org/p/coreboot;protocol=http;branch=master \
+	   file://no-stack-protector.patch"
+
+S = "${WORKDIR}/git/util/mkelfImage"
+
+inherit autotools
+
+NATIVE_INSTALL_WORKS = "1"
+BBCLASSEXTEND = "native"
-- 
1.7.0.4




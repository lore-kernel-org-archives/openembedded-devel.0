Return-Path: <stefan.wiehler@missinglinkelectronics.com>
X-Greylist: delayed 377 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 29 Nov 2018 09:33:15 UTC
Received: from smtp.missinglinkelectronics.com
	(smtp.missinglinkelectronics.com [94.130.14.54])
	by mail.openembedded.org (Postfix) with ESMTP id 84BD46C49B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Nov 2018 09:33:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp.missinglinkelectronics.com (Postfix) with ESMTP id BB49FE0177
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Nov 2018 10:26:59 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at missinglinkelectronics.com
Received: from smtp.missinglinkelectronics.com ([127.0.0.1])
	by localhost (mail.missinglinkelectronics.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id TLIC7NJP2uvi; Thu, 29 Nov 2018 10:26:59 +0100 (CET)
Received: from napf-xenial1.mle (p578c5bfe.dip0.t-ipconnect.de [87.140.91.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested) (Authenticated sender: stefan)
	by smtp.missinglinkelectronics.com (Postfix) with ESMTPSA id 4C56FE0031;
	Thu, 29 Nov 2018 10:26:59 +0100 (CET)
From: Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Nov 2018 10:26:33 +0100
Message-Id: <1543483593-134191-1-git-send-email-stefan.wiehler@missinglinkelectronics.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] read-edid: Upgrade to 3.0.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Nov 2018 09:33:16 -0000

Signed-off-by: Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>
---
 meta-oe/licenses/read-edid                         | 17 +++++++++++++
 .../0001-Do-not-install-license-file.patch         | 17 +++++++++++++
 ...emove-check-for-x86.h-we-don-t-build-get-.patch | 28 ----------------------
 .../recipes-support/read-edid/read-edid_2.0.0.bb   | 23 ------------------
 .../recipes-support/read-edid/read-edid_3.0.2.bb   | 20 ++++++++++++++++
 5 files changed, 54 insertions(+), 51 deletions(-)
 create mode 100644 meta-oe/licenses/read-edid
 create mode 100644 meta-oe/recipes-support/read-edid/read-edid/0001-Do-not-install-license-file.patch
 delete mode 100644 meta-oe/recipes-support/read-edid/read-edid/0001-configure-remove-check-for-x86.h-we-don-t-build-get-.patch
 delete mode 100644 meta-oe/recipes-support/read-edid/read-edid_2.0.0.bb
 create mode 100644 meta-oe/recipes-support/read-edid/read-edid_3.0.2.bb

diff --git a/meta-oe/licenses/read-edid b/meta-oe/licenses/read-edid
new file mode 100644
index 0000000..2eb2c60
--- /dev/null
+++ b/meta-oe/licenses/read-edid
@@ -0,0 +1,17 @@
+
+ * This is an unofficial license. Let's call it BSD-like, with these terms:
+ *   * You are free to use this software for any purpose. I cannot guarantee
+ *     anything about this software or its fitness for any purpose. I will
+ *     offer support for this software as long as I am capable of doing so,
+ *     but this should not be interpreted as a support contract of any kind.
+ *
+ *   * You are free to modify, distribute, etc. this code under the strict
+ *     condition that you email me, Matthew Kern <pyrophobicman@gmail.com>, a
+ *     brief message on what you're doing. Nothing will be rejected, this is
+ *     simply to keep tabs on my work, and maybe we can share ideas on EDIDs.
+ *
+ *   * (C)opyright 2008-2014 Matthew Kern
+ *
+ *   Please see AUTHORS for a list of the people who made this software
+ *   possible. All of the current code is a rewrite of my own work, but
+ *   I am still indebted to those guys for a ton of the ideas.
diff --git a/meta-oe/recipes-support/read-edid/read-edid/0001-Do-not-install-license-file.patch b/meta-oe/recipes-support/read-edid/read-edid/0001-Do-not-install-license-file.patch
new file mode 100644
index 0000000..a9b9476
--- /dev/null
+++ b/meta-oe/recipes-support/read-edid/read-edid/0001-Do-not-install-license-file.patch
@@ -0,0 +1,17 @@
+Do not install license file
+
+File name is incorrect as well; must be LICENSE instead of COPYING.
+
+Upstream-Status: Submitted [pyrophobicman@gmail.com]
+
+Signed-off-by: Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>
+
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -13,5 +13,5 @@
+ add_subdirectory (parse-edid)
+ 
+ INSTALL(FILES get-edid.1 DESTINATION share/man/man1)
+-INSTALL(FILES AUTHORS ChangeLog COPYING README DESTINATION
++INSTALL(FILES AUTHORS ChangeLog README DESTINATION
+ 	share/doc/read-edid)
diff --git a/meta-oe/recipes-support/read-edid/read-edid/0001-configure-remove-check-for-x86.h-we-don-t-build-get-.patch b/meta-oe/recipes-support/read-edid/read-edid/0001-configure-remove-check-for-x86.h-we-don-t-build-get-.patch
deleted file mode 100644
index 4408002..0000000
--- a/meta-oe/recipes-support/read-edid/read-edid/0001-configure-remove-check-for-x86.h-we-don-t-build-get-.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From eb7590cc2cdd5c35403af4567d8524e017010f1c Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Sat, 11 May 2013 07:58:17 +0200
-Subject: [PATCH] configure: remove check for x86.h, we don't build get-edid
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
-
-Upstream-status: Inappropriate [OE specific]
----
- configure.in | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/configure.in b/configure.in
-index ac85a21..f53e904 100644
---- a/configure.in
-+++ b/configure.in
-@@ -8,8 +8,6 @@ dnl Checks for programs
- 
- AC_PROG_CC
- 
--AC_CHECK_HEADER([libx86.h], [], [AC_MSG_ERROR([libx86.h not found])])
--
- dnl Simple, huh?
- 
- AC_OUTPUT([Makefile])
--- 
-1.8.1.4
-
diff --git a/meta-oe/recipes-support/read-edid/read-edid_2.0.0.bb b/meta-oe/recipes-support/read-edid/read-edid_2.0.0.bb
deleted file mode 100644
index b002906..0000000
--- a/meta-oe/recipes-support/read-edid/read-edid_2.0.0.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-DESCRIPTION = "read-edid elucidates various very useful informations from a conforming PnP monitor"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d0bf70fa1ef81fe4741ec0e6231dadfd"
-
-SRC_URI = "http://polypux.org/projects/read-edid/read-edid-${PV}.tar.gz \
-           file://0001-configure-remove-check-for-x86.h-we-don-t-build-get-.patch"
-
-SRC_URI[md5sum] = "586e7fa1167773b27f4e505edc93274b"
-SRC_URI[sha256sum] = "246ec14ec509e09ac26fe6862b120481b2cc881e2f142ba40886d6eec15e77e8"
-
-inherit autotools
-
-do_compile() {
-    oe_runmake parse-edid
-}
-
-do_install() {
-    install -d ${D}${bindir}
-    install -m 0755 parse-edid ${D}${bindir}
-}
-
-PACKAGES =+ "parse-edid"
-FILES_parse-edid = "${bindir}/parse-edid"
diff --git a/meta-oe/recipes-support/read-edid/read-edid_3.0.2.bb b/meta-oe/recipes-support/read-edid/read-edid_3.0.2.bb
new file mode 100644
index 0000000..e4c2cad
--- /dev/null
+++ b/meta-oe/recipes-support/read-edid/read-edid_3.0.2.bb
@@ -0,0 +1,20 @@
+SUMMARY = "A pair of tools for reading the EDID from a monitor"
+DESCRIPTION = "read-edid is a set of two tools - get-edid, which gets the raw \
+               EDID information from the monitor, and parse-edid, which turns \
+	       the raw binary information into a xorg.conf-compatible monitor \
+	       section."
+AUTHOR = "Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>"
+HOMEPAGE = "http://www.polypux.org/projects/read-edid/"
+SECTION = "console/utils"
+LICENSE = "read-edid"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=292c42e2aedc4af636636bf7af0e2b26"
+
+SRC_URI = "http://polypux.org/projects/read-edid/read-edid-${PV}.tar.gz \
+           file://0001-Do-not-install-license-file.patch \
+	   "
+SRC_URI[md5sum] = "016546e438bf6c98739ff74061df9854"
+SRC_URI[sha256sum] = "c7c6d8440f5b90f98e276829271ccea5b2ff5a3413df8a0f87ec09f834af186f"
+
+EXTRA_OECMAKE = "-DCLASSICBUILD=OFF"
+
+inherit cmake
-- 
2.7.4



Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <woglinde@rhein.zuhause.netz>) id 1OcFHR-0001O1-Qg
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Jul 2010 12:15:02 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 8FF0811000B0;
	Fri, 23 Jul 2010 12:07:34 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 67B6E110009F;
	Fri, 23 Jul 2010 12:07:32 +0200 (CEST)
Received: from rhein.familie-heinold.de (g225145064.adsl.alicedsl.de
	[92.225.145.64]) by mail.familie-heinold.de (Postfix) with ESMTPA;
	Fri, 23 Jul 2010 12:07:32 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 223673C0E9; Fri, 23 Jul 2010 12:07:21 +0200 (CEST)
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Jul 2010 12:06:51 +0200
Message-Id: <1279879611-28171-2-git-send-email-heinold@inf.fu-berlin.de>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1279879611-28171-1-git-send-email-heinold@inf.fu-berlin.de>
References: <1279879611-28171-1-git-send-email-heinold@inf.fu-berlin.de>
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 85.214.48.103
X-SA-Exim-Mail-From: woglinde@rhein.zuhause.netz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] libpng: update to version 1.2.44 because of CVE-2010-1205 and convert to BBCLASSEXTENDED
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
X-List-Received-Date: Fri, 23 Jul 2010 10:15:02 -0000

---
 recipes/libpng/libpng-native.inc       |    5 -----
 recipes/libpng/libpng-native_1.2.37.bb |    6 ------
 recipes/libpng/libpng-native_1.2.40.bb |    9 ---------
 recipes/libpng/libpng-native_1.2.41.bb |    6 ------
 recipes/libpng/libpng-native_1.2.42.bb |    6 ------
 recipes/libpng/libpng.inc              |    6 +++++-
 recipes/libpng/libpng_1.2.37.bb        |    8 --------
 recipes/libpng/libpng_1.2.40.bb        |    8 --------
 recipes/libpng/libpng_1.2.41.bb        |    8 --------
 recipes/libpng/libpng_1.2.42.bb        |    8 --------
 recipes/libpng/libpng_1.2.44.bb        |    8 ++++++++
 11 files changed, 13 insertions(+), 65 deletions(-)
 delete mode 100644 recipes/libpng/libpng-native.inc
 delete mode 100644 recipes/libpng/libpng-native_1.2.37.bb
 delete mode 100644 recipes/libpng/libpng-native_1.2.40.bb
 delete mode 100644 recipes/libpng/libpng-native_1.2.41.bb
 delete mode 100644 recipes/libpng/libpng-native_1.2.42.bb
 delete mode 100644 recipes/libpng/libpng_1.2.37.bb
 delete mode 100644 recipes/libpng/libpng_1.2.40.bb
 delete mode 100644 recipes/libpng/libpng_1.2.41.bb
 delete mode 100644 recipes/libpng/libpng_1.2.42.bb
 create mode 100644 recipes/libpng/libpng_1.2.44.bb

diff --git a/recipes/libpng/libpng-native.inc b/recipes/libpng/libpng-native.inc
deleted file mode 100644
index a515346..0000000
--- a/recipes/libpng/libpng-native.inc
+++ /dev/null
@@ -1,5 +0,0 @@
-inherit native
-
-DEPENDS = "zlib-native"
-
-INHIBIT_NATIVE_STAGE_INSTALL = "1"
diff --git a/recipes/libpng/libpng-native_1.2.37.bb b/recipes/libpng/libpng-native_1.2.37.bb
deleted file mode 100644
index 3c36b52..0000000
--- a/recipes/libpng/libpng-native_1.2.37.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require libpng_${PV}.bb
-require libpng-native.inc
-
-PR = "r1"
-
-FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/libpng-${PV}"
diff --git a/recipes/libpng/libpng-native_1.2.40.bb b/recipes/libpng/libpng-native_1.2.40.bb
deleted file mode 100644
index 6f0222d..0000000
--- a/recipes/libpng/libpng-native_1.2.40.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require libpng_${PV}.bb
-require libpng-native.inc
-
-PR = "r1"
-
-FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/libpng-${PV}"
-
-SRC_URI[tarball.md5sum] = "29bbd1c3cbe54b04bfc2bda43067ccb5"
-SRC_URI[tarball.sha256sum] = "a6197352ad5b79a9a1ce0dd59f5e737cfbf909e0f3c5f64631cf0d93549e4e40"
diff --git a/recipes/libpng/libpng-native_1.2.41.bb b/recipes/libpng/libpng-native_1.2.41.bb
deleted file mode 100644
index 3c36b52..0000000
--- a/recipes/libpng/libpng-native_1.2.41.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require libpng_${PV}.bb
-require libpng-native.inc
-
-PR = "r1"
-
-FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/libpng-${PV}"
diff --git a/recipes/libpng/libpng-native_1.2.42.bb b/recipes/libpng/libpng-native_1.2.42.bb
deleted file mode 100644
index 3c36b52..0000000
--- a/recipes/libpng/libpng-native_1.2.42.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require libpng_${PV}.bb
-require libpng-native.inc
-
-PR = "r1"
-
-FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/libpng-${PV}"
diff --git a/recipes/libpng/libpng.inc b/recipes/libpng/libpng.inc
index fc1feb8..0053071 100644
--- a/recipes/libpng/libpng.inc
+++ b/recipes/libpng/libpng.inc
@@ -3,11 +3,14 @@ HOMEPAGE = "http://www.libpng.org/"
 LICENSE = "libpng"
 SECTION = "libs"
 PRIORITY = "required"
+
 DEPENDS = "zlib"
 
 INC_PR = "r2"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/libpng/libpng-${PV}.tar.bz2;name=tarball"
+BBCLASSEXTEND = "native"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/libpng/libpng-${PV}.tar.bz2;name=libpng"
 S = "${WORKDIR}/libpng-${PV}"
 
 inherit autotools pkgconfig binconfig
@@ -19,3 +22,4 @@ FILES_libpng12 = "${libdir}/libpng12.so.*"
 FILES_${PN}-dev = "${includedir} ${libdir}/lib*.so ${libdir}/*.la \
 		${libdir}/*.a ${libdir}/pkgconfig \
 		${datadir}/aclocal ${bindir} ${sbindir}"
+
diff --git a/recipes/libpng/libpng_1.2.37.bb b/recipes/libpng/libpng_1.2.37.bb
deleted file mode 100644
index 950ebb4..0000000
--- a/recipes/libpng/libpng_1.2.37.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require libpng.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI += "file://makefile_fix.patch"
-
-SRC_URI[tarball.md5sum] = "6d1ee0888dbb711214943cb19c294b49"
-SRC_URI[tarball.sha256sum] = "682960b55527b54bada90e959c2d42679444a1db43677c77eb645a29645f86d1"
diff --git a/recipes/libpng/libpng_1.2.40.bb b/recipes/libpng/libpng_1.2.40.bb
deleted file mode 100644
index 80d87bc..0000000
--- a/recipes/libpng/libpng_1.2.40.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require libpng.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI += "file://makefile_fix.patch"
-
-SRC_URI[tarball.md5sum] = "29bbd1c3cbe54b04bfc2bda43067ccb5"
-SRC_URI[tarball.sha256sum] = "a6197352ad5b79a9a1ce0dd59f5e737cfbf909e0f3c5f64631cf0d93549e4e40"
diff --git a/recipes/libpng/libpng_1.2.41.bb b/recipes/libpng/libpng_1.2.41.bb
deleted file mode 100644
index 2389915..0000000
--- a/recipes/libpng/libpng_1.2.41.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require libpng.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI += "file://makefile_fix.patch"
-
-SRC_URI[tarball.md5sum] = "2faa7f8d81e6a35beb991cb75edbf056"
-SRC_URI[tarball.sha256sum] = "a172c5afe4668a31eb090d14be7fc2811a9fec8568a785badd30280f47a27e00"
diff --git a/recipes/libpng/libpng_1.2.42.bb b/recipes/libpng/libpng_1.2.42.bb
deleted file mode 100644
index d37f7e3..0000000
--- a/recipes/libpng/libpng_1.2.42.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require libpng.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI += "file://makefile_fix.patch"
-
-SRC_URI[tarball.md5sum] = "9a5cbe9798927fdf528f3186a8840ebe"
-SRC_URI[tarball.sha256sum] = "a044c4632a236bbf99527da81977577929a173c1f7f68a70a81ea2ea7cffa6a7"
diff --git a/recipes/libpng/libpng_1.2.44.bb b/recipes/libpng/libpng_1.2.44.bb
new file mode 100644
index 0000000..4ba7b20
--- /dev/null
+++ b/recipes/libpng/libpng_1.2.44.bb
@@ -0,0 +1,8 @@
+require libpng.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://makefile_fix.patch"
+
+SRC_URI[libpng.md5sum] = "e3ac7879d62ad166a6f0c7441390d12b"
+SRC_URI[libpng.sha256sum] = "b9ab20f1c2c3bf6c4448fd9bd8a4a8905b918114d5fada56c97bb758a17b7215"
-- 
1.7.1



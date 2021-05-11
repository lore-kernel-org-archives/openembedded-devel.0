Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.10068.1620722940806827570
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 May 2021 01:49:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: hongxu.jia@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 14B8mvuY032327
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 11 May 2021 01:48:57 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Tue, 11 May 2021 01:48:57 -0700
Received: from ala-lpggp7.wrs.com (147.11.105.171) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.4 via Frontend Transport; Tue, 11 May 2021 01:48:57 -0700
From: "hongxu" <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] cdrkit: add nativesdk support
Date: Tue, 11 May 2021 01:48:57 -0700
Message-ID: <20210511084857.124127-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

- Fix an absolute path symlink issue, replace with a relative link

- Fix installed-vs-shipped QA Issue of nativesdk package
  ...
  |ERROR: nativesdk-cdrkit-1.1.11-r0 do_package: QA Issue: nativesdk-cdrkit:
   Files/directories were installed but not shipped in any package:
  |  /opt/windriver/wrlinux-graphics/21.18/sysroots/x86_64-wrlinuxsdk-linux/usr/sbin/netscsid
  ...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../cdrkit/cdrkit_1.1.11.bb                   |  7 +++--
 ...nstall-netscsid-to-bin-for-nativesdk.patch | 28 +++++++++++++++++++
 2 files changed, 33 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-multimedia/cdrkit/files/0001-install-netscsid-to-bin-for-nativesdk.patch

diff --git a/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb b/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
index 3344821fa..54d396343 100644
--- a/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
+++ b/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
@@ -12,6 +12,9 @@ SRC_URI = "${DEBIAN_MIRROR}/main/c/${BPN}/${BPN}_${PV}.orig.tar.gz \
            file://0002-Do-not-use-rcmd-on-build-with-musl.patch \
            file://0001-genisoimage-Add-missing-extern-definition.patch \
            "
+SRC_URI_append_class-nativesdk = " \
+           file://0001-install-netscsid-to-bin-for-nativesdk.patch \
+"
 SRC_URI[md5sum] = "efe08e2f3ca478486037b053acd512e9"
 SRC_URI[sha256sum] = "d1c030756ecc182defee9fe885638c1785d35a2c2a297b4604c0e0dcc78e47da"
 
@@ -51,7 +54,7 @@ FILES_wodim = " \
 "
 
 do_install_append() {
-    ln -sf ${bindir}/genisoimage ${D}${bindir}/mkisofs
+    ln -sf --relative ${D}${bindir}/genisoimage ${D}${bindir}/mkisofs
 }
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-oe/recipes-multimedia/cdrkit/files/0001-install-netscsid-to-bin-for-nativesdk.patch b/meta-oe/recipes-multimedia/cdrkit/files/0001-install-netscsid-to-bin-for-nativesdk.patch
new file mode 100644
index 000000000..fdf1563b3
--- /dev/null
+++ b/meta-oe/recipes-multimedia/cdrkit/files/0001-install-netscsid-to-bin-for-nativesdk.patch
@@ -0,0 +1,28 @@
+From 6b698b7c1045d279fe24818d45c67d9884d5fd81 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 7 May 2021 15:10:04 +0800
+Subject: [PATCH] install netscsid to bin for nativesdk
+
+For Yocto, the nativesdk does not have sbin dir, use bin to relpace
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ netscsid/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/netscsid/CMakeLists.txt b/netscsid/CMakeLists.txt
+index f6bddf1..cf23312 100644
+--- a/netscsid/CMakeLists.txt
++++ b/netscsid/CMakeLists.txt
+@@ -9,5 +9,5 @@ ADD_EXECUTABLE (netscsid netscsid.c)
+ #SET_SOURCE_FILES_PROPERTIES(netscsid.c )
+ TARGET_LINK_LIBRARIES(netscsid ${EXTRA_LIBS} )
+ #SET_TARGET_PROPERTIES(netscsid PROPERTIES  SKIP_BUILD_RPATH TRUE)
+-INSTALL(TARGETS netscsid DESTINATION sbin)
++INSTALL(TARGETS netscsid DESTINATION bin)
+ 
+-- 
+2.27.0
+
-- 
2.27.0


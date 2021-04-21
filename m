Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.8693.1618988505652207429
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Apr 2021 00:01:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: qi.chen@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 13L71iS5005297
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Apr 2021 00:01:44 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Wed, 21 Apr 2021 00:01:44 -0700
Received: from ala-lpggp7.wrs.com (147.11.105.171) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.4 via Frontend Transport; Wed, 21 Apr 2021 00:01:43 -0700
From: "Chen Qi" <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][PATCH V2] tigervnc: upgrade to 1.11.0
Date: Wed, 21 Apr 2021 00:01:43 -0700
Message-ID: <20210421070143.71415-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Upgrade to latest stable version.

The 1.10 branch is not maitained any more, it stops update in 2019.
The 1.11 branch has fix for CVE-2020-26117, which is a high risk CVE.
https://nvd.nist.gov/vuln/detail/CVE-2020-26117

Some changes in this new version are as below.
1) 'bash' is added to RDEPENDS as /usr/libexec/vncsession-start requires it.
2) DEPENDS on libpam and requires 'pam' distro feature.
   This is because upstream has made 'pam' mandatory in the following commit.
   """
   commit d80817f101d1b3f1a9b1c5ec268f28fffa2d75f9
   Author: Pierre Ossman <ossman@cendio.se>
   Date:   Wed Jul 11 15:49:46 2018 +0200

       Make PAM mandatory

       It is present on all UNIX systems anyway, so let's simplify things.
       We will need it for more proper session startup anyway.
   """

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...002-do-not-build-tests-sub-directory.patch | 21 +++++------
 ...vnc-add-fPIC-option-to-COMPILE_FLAGS.patch | 36 +++++++------------
 ...{tigervnc_1.10.1.bb => tigervnc_1.11.0.bb} | 13 ++++---
 3 files changed, 32 insertions(+), 38 deletions(-)
 rename meta-oe/recipes-graphics/tigervnc/{tigervnc_1.10.1.bb => tigervnc_1.11.0.bb} (89%)

diff --git a/meta-oe/recipes-graphics/tigervnc/files/0002-do-not-build-tests-sub-directory.patch b/meta-oe/recipes-graphics/tigervnc/files/0002-do-not-build-tests-sub-directory.patch
index 4e875ba82..5a42e67d0 100644
--- a/meta-oe/recipes-graphics/tigervnc/files/0002-do-not-build-tests-sub-directory.patch
+++ b/meta-oe/recipes-graphics/tigervnc/files/0002-do-not-build-tests-sub-directory.patch
@@ -1,29 +1,30 @@
-From c3460d63f0b6cd50b9a64265f420f0439e12a1d5 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Tue, 25 Apr 2017 01:36:44 -0400
-Subject: [PATCH 2/4] do not build tests sub directory
+From 076d0e12a7be6cd2108e4ca0dcde1cb658918fa5 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Mon, 19 Apr 2021 23:02:45 -0700
+Subject: [PATCH] do not build tests sub directory
 
-Upstream-Status: Inappropriate [oe specific]
+Upstream-Status: Inappropriate [OE Specific]
 
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+Signed-off-by: Hongxu Jia <Hongxu.Jia@windriver.com>
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 ---
  CMakeLists.txt | 3 ---
  1 file changed, 3 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 94ec2ef..fb72a00 100644
+index 7bf99441..bda80598 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -300,9 +300,6 @@ if(BUILD_VIEWER)
+@@ -304,9 +304,6 @@ if(BUILD_VIEWER)
    add_subdirectory(media)
  endif()
  
 -add_subdirectory(tests)
 -
 -
- include(cmake/BuildPackages.cmake)
+ add_subdirectory(release)
  
  # uninstall
 -- 
-2.7.4
+2.30.2
 
diff --git a/meta-oe/recipes-graphics/tigervnc/files/0004-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch b/meta-oe/recipes-graphics/tigervnc/files/0004-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch
index 97b0a388a..5f14665b8 100644
--- a/meta-oe/recipes-graphics/tigervnc/files/0004-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch
+++ b/meta-oe/recipes-graphics/tigervnc/files/0004-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch
@@ -1,44 +1,34 @@
-From 9563b69640227da2220ee0c39077afb736cc96d1 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Thu, 20 Jul 2017 17:12:17 +0800
-Subject: [PATCH 4/4] tigervnc: add fPIC option to COMPILE_FLAGS
+From 7f8acd59bb2e54f9be25a98dd71534700a9e355a Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Mon, 19 Apr 2021 23:14:28 -0700
+Subject: [PATCH] tigervnc: add fPIC option to COMPILE_FLAGS
 
-The static libraries in Xregion/network/rdr/rfb were linked by shared
+The static libraries in network/rdr/rfb were linked by shared
 library libvnc.so, so we should add fPIC option to COMPILE_FLAGS to fix
 relocation issue.
 
 Upstream-Status: Pending
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 ---
- common/Xregion/CMakeLists.txt | 1 +
  common/network/CMakeLists.txt | 1 +
  common/rdr/CMakeLists.txt     | 1 +
  common/rfb/CMakeLists.txt     | 1 +
- 4 files changed, 4 insertions(+)
+ 3 files changed, 3 insertions(+)
 
-diff --git a/common/Xregion/CMakeLists.txt b/common/Xregion/CMakeLists.txt
-index 40ca97e..9411328 100644
---- a/common/Xregion/CMakeLists.txt
-+++ b/common/Xregion/CMakeLists.txt
-@@ -3,4 +3,5 @@ add_library(Xregion STATIC
- 
- if(UNIX)
-   libtool_create_control_file(Xregion)
-+  set_target_properties(Xregion PROPERTIES COMPILE_FLAGS -fPIC)
- endif()
 diff --git a/common/network/CMakeLists.txt b/common/network/CMakeLists.txt
-index b624c8e..6c06ec9 100644
+index d00ca452..e84e0290 100644
 --- a/common/network/CMakeLists.txt
 +++ b/common/network/CMakeLists.txt
-@@ -9,4 +9,5 @@ endif()
+@@ -16,4 +16,5 @@ endif()
  
  if(UNIX)
    libtool_create_control_file(network)
 +  set_target_properties(network PROPERTIES COMPILE_FLAGS -fPIC)
  endif()
 diff --git a/common/rdr/CMakeLists.txt b/common/rdr/CMakeLists.txt
-index 989ba2f..20f6489 100644
+index 989ba2f4..20f6489d 100644
 --- a/common/rdr/CMakeLists.txt
 +++ b/common/rdr/CMakeLists.txt
 @@ -27,4 +27,5 @@ target_link_libraries(rdr ${RDR_LIBRARIES})
@@ -48,15 +38,15 @@ index 989ba2f..20f6489 100644
 +  set_target_properties(rdr PROPERTIES COMPILE_FLAGS -fPIC)
  endif()
 diff --git a/common/rfb/CMakeLists.txt b/common/rfb/CMakeLists.txt
-index 5047e5e..88838ab 100644
+index fc5a37bf..7f5ce131 100644
 --- a/common/rfb/CMakeLists.txt
 +++ b/common/rfb/CMakeLists.txt
-@@ -98,4 +98,5 @@ target_link_libraries(rfb ${RFB_LIBRARIES})
+@@ -99,4 +99,5 @@ target_link_libraries(rfb ${RFB_LIBRARIES})
  
  if(UNIX)
    libtool_create_control_file(rfb)
 +  set_target_properties(rfb PROPERTIES COMPILE_FLAGS -fPIC)
  endif()
 -- 
-2.7.4
+2.30.2
 
diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.10.1.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
similarity index 89%
rename from meta-oe/recipes-graphics/tigervnc/tigervnc_1.10.1.bb
rename to meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
index f97c2b2d6..ce6c59bc3 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.10.1.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
@@ -2,22 +2,22 @@ DESCRIPTION = "TigerVNC remote display system"
 HOMEPAGE = "http://www.tigervnc.com/"
 LICENSE = "GPLv2+"
 SECTION = "x11/utils"
-DEPENDS = "xserver-xorg gnutls jpeg libxtst gettext-native fltk"
-RDEPENDS_${PN} = "coreutils hicolor-icon-theme perl"
+DEPENDS = "xserver-xorg gnutls jpeg libxtst gettext-native fltk libpam"
+RDEPENDS_${PN} = "coreutils hicolor-icon-theme perl bash"
 
 LIC_FILES_CHKSUM = "file://LICENCE.TXT;md5=75b02c2872421380bbd47781d2bd75d3"
 
 S = "${WORKDIR}/git"
 
 inherit features_check
-REQUIRED_DISTRO_FEATURES = "x11"
+REQUIRED_DISTRO_FEATURES = "x11 pam"
 
 inherit autotools cmake
 B = "${S}"
 
-SRCREV = "4739493b635372bd40a34640a719f79fa90e4dba"
+SRCREV = "540bfc3278e396321124d4b18a798ac2bc18b6ca"
 
-SRC_URI = "git://github.com/TigerVNC/tigervnc.git;branch=1.10-branch \
+SRC_URI = "git://github.com/TigerVNC/tigervnc.git;branch=1.11-branch \
            file://0002-do-not-build-tests-sub-directory.patch \
            file://0003-add-missing-dynamic-library-to-FLTK_LIBRARIES.patch \
            file://0004-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch \
@@ -83,6 +83,8 @@ EXTRA_OECONF = "--disable-xorg --disable-xnest --disable-xvfb --disable-dmx \
         --disable-xwayland \
 "
 
+EXTRA_OECMAKE += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '-DCMAKE_INSTALL_UNITDIR=/lib/systemd/system', '-DINSTALL_SYSTEMD_UNITS=OFF', d)}"
+
 do_configure_append () {
     olddir=`pwd`
     cd ${XSERVER_SOURCE_DIR}
@@ -125,6 +127,7 @@ do_install_append() {
 FILES_${PN} += " \
     ${libdir}/xorg/modules/extensions \
     ${datadir}/icons \
+    ${systemd_unitdir} \
 "
 
 FILES_${PN}-dbg += "${libdir}/xorg/modules/extensions/.debug"
-- 
2.30.2


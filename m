Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web11.9285.1619078393896386042
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Apr 2021 00:59:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=rYP+wcOp;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1619078391; i=@fujitsu.com;
	bh=0EF8MnZWbD/g2WhnoBps4gmNjDnuDLgYHAjAl0sAGQM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=rYP+wcOpObt9EwGPhUK6ZIMjMUxLuj44kwE/T8lfMwWHLdxyX7+yJ3kWSuSdqBvXD
	 EnMPqcjQ4z3+a5bpEzgQfqaCvTYw+yFTAOvy8ESMv9padIXFhxyw5d8p8r8Zw8ZAsA
	 sk9fvczvSzwtX6SHDnvWq0NuUj2xlCmblTmPQZSLVSYuUx8xtMaTmiaTx4oGVvfZpx
	 X+5mckyJGr2gYa8TKcR+eS1zKPXgSwk+uDkuZoRPdTYZvwEvvAS0S+3uP2R46+kwN8
	 CZY991UI7orUo0Hfr8sHanlzzMUlX5nOUGxkxo+rcbpuhZZeuGL3RKTTRydbjdGWIx
	 8mCnaEoYBzhaQ==
Received: from [100.112.192.143] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-1.aws.symcld.net id 9D/94-53635-7FC21806; Thu, 22 Apr 2021 07:59:51 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMIsWRWlGSWpSXmKPExsViZ8MRqvtdpzH
  B4O9aUYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPmxL9sBcc1KrpaVjM2MM5W6WLk4hASmM0k
  sX/XAVYI5zijxN+/l9m6GDk52ATUJKbfusEKYosI6Essnb2HGcRmFlCRePG7h72LkYNDWMBJY
  us2D5Awi4CqxJ5Jp1lAbF4BR4kbrVfAbAkBBYkpD98zQ8QFJU7OfMICMUZC4uCLF8wQNYoSsy
  83Q9VXSnSuX8A4gZF3FpKWWUhaFjAyrWK0SCrKTM8oyU3MzNE1NDDQNTQ00jW0NNU1NDXUS6z
  STdRLLdUtTy0u0QVyy4v1iitzk3NS9PJSSzYxAsMrpeDw9B2M/W8+6B1ilORgUhLlXcjXmCDE
  l5SfUpmRWJwRX1Sak1p8iFGGg0NJgveFFlBOsCg1PbUiLTMHGOowaQkOHiURXnuQNG9xQWJuc
  WY6ROoUoy7H5evzFjELseTl56VKifOuBikSACnKKM2DGwGLu0uMslLCvIwMDAxCPAWpRbmZJa
  jyrxjFORiVhHnltYGm8GTmlcBtegV0BBPQEdpTakGOKElESEk1MEmYMqyLYkre9jbg+hI767/
  BndtaHmjdXpag7c4uuFNhrumDjg+TEvezJG2/sUXivIaNIsNdzaD/e9883jXvx4LENOH3h/0s
  vTk/Bb3o3Zax2/HaQtblp97fsOYv+/rGe9KjymZHDeYE//u9Qauke2MMNpfp2949fPuJ0KP7f
  /U22pxif/T+a+HkN8sPtkznUZbVPKVuOlOpQOiP1UHJ0HqTV1O4NrO9qT4QLvH6PdNc74P8PR
  LG+plLxZdw7z77ZJLZjpuT79/zyl1gGsNyWPM64yrXg5PP/hZ1fMOcoq8uOCUmlp/PxXRB4Yf
  Phq5nW7JSX+w9wvumYmdFoqdT+EN9ezOemZFOHNyb3XL/HFNiKc5INNRiLipOBACid4YINgMA
  AA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-33.tower-265.messagelabs.com!1619078390!281557!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6407 invoked from network); 22 Apr 2021 07:59:51 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-33.tower-265.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 22 Apr 2021 07:59:51 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13M7xoXL009618
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 22 Apr 2021 08:59:50 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 22 Apr 2021 08:59:49 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] tigervnc: upgrade 1.10.1 -> 1.11.0
Date: Thu, 22 Apr 2021 15:59:41 +0800
Message-ID: <1619078381-5712-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

refresh the following patches:
0002-do-not-build-tests-sub-directory.patch
0004-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...002-do-not-build-tests-sub-directory.patch | 15 ++++++------
 ...vnc-add-fPIC-option-to-COMPILE_FLAGS.patch | 23 +++++--------------
 ...{tigervnc_1.10.1.bb => tigervnc_1.11.0.bb} |  7 +++---
 3 files changed, 17 insertions(+), 28 deletions(-)
 rename meta-oe/recipes-graphics/tigervnc/{tigervnc_1.10.1.bb => tigervnc_1.11.0.bb} (94%)

diff --git a/meta-oe/recipes-graphics/tigervnc/files/0002-do-not-build-tests-sub-directory.patch b/meta-oe/recipes-graphics/tigervnc/files/0002-do-not-build-tests-sub-directory.patch
index 4e875ba82..c4ca36622 100644
--- a/meta-oe/recipes-graphics/tigervnc/files/0002-do-not-build-tests-sub-directory.patch
+++ b/meta-oe/recipes-graphics/tigervnc/files/0002-do-not-build-tests-sub-directory.patch
@@ -7,23 +7,22 @@ Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
- CMakeLists.txt | 3 ---
- 1 file changed, 3 deletions(-)
+ CMakeLists.txt | 2 --
+ 1 file changed, 2 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 94ec2ef..fb72a00 100644
+index 7bf9944..b9d1b65 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -300,9 +300,6 @@ if(BUILD_VIEWER)
+@@ -304,8 +304,6 @@ if(BUILD_VIEWER)
    add_subdirectory(media)
  endif()
  
 -add_subdirectory(tests)
 -
--
- include(cmake/BuildPackages.cmake)
  
- # uninstall
+ add_subdirectory(release)
+ 
 -- 
-2.7.4
+2.25.1
 
diff --git a/meta-oe/recipes-graphics/tigervnc/files/0004-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch b/meta-oe/recipes-graphics/tigervnc/files/0004-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch
index 97b0a388a..3cbf0f21a 100644
--- a/meta-oe/recipes-graphics/tigervnc/files/0004-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch
+++ b/meta-oe/recipes-graphics/tigervnc/files/0004-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch
@@ -11,27 +11,16 @@ Upstream-Status: Pending
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
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
+index d00ca45..e84e029 100644
 --- a/common/network/CMakeLists.txt
 +++ b/common/network/CMakeLists.txt
-@@ -9,4 +9,5 @@ endif()
+@@ -16,4 +16,5 @@ endif()
  
  if(UNIX)
    libtool_create_control_file(network)
@@ -48,15 +37,15 @@ index 989ba2f..20f6489 100644
 +  set_target_properties(rdr PROPERTIES COMPILE_FLAGS -fPIC)
  endif()
 diff --git a/common/rfb/CMakeLists.txt b/common/rfb/CMakeLists.txt
-index 5047e5e..88838ab 100644
+index fc5a37b..7f5ce13 100644
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
+2.25.1
 
diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.10.1.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
similarity index 94%
rename from meta-oe/recipes-graphics/tigervnc/tigervnc_1.10.1.bb
rename to meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
index f97c2b2d6..1be9e35dd 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.10.1.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.tigervnc.com/"
 LICENSE = "GPLv2+"
 SECTION = "x11/utils"
 DEPENDS = "xserver-xorg gnutls jpeg libxtst gettext-native fltk"
-RDEPENDS_${PN} = "coreutils hicolor-icon-theme perl"
+RDEPENDS_${PN} = "coreutils hicolor-icon-theme perl bash"
 
 LIC_FILES_CHKSUM = "file://LICENCE.TXT;md5=75b02c2872421380bbd47781d2bd75d3"
 
@@ -15,9 +15,9 @@ REQUIRED_DISTRO_FEATURES = "x11"
 inherit autotools cmake
 B = "${S}"
 
-SRCREV = "4739493b635372bd40a34640a719f79fa90e4dba"
+SRCREV = "540bfc3278e396321124d4b18a798ac2bc18b6ca"
 
-SRC_URI = "git://github.com/TigerVNC/tigervnc.git;branch=1.10-branch \
+SRC_URI = "git://github.com/TigerVNC/tigervnc.git;branch=1.11-branch \
            file://0002-do-not-build-tests-sub-directory.patch \
            file://0003-add-missing-dynamic-library-to-FLTK_LIBRARIES.patch \
            file://0004-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch \
@@ -125,6 +125,7 @@ do_install_append() {
 FILES_${PN} += " \
     ${libdir}/xorg/modules/extensions \
     ${datadir}/icons \
+    ${libdir}/systemd/system/vncserver@.service \
 "
 
 FILES_${PN}-dbg += "${libdir}/xorg/modules/extensions/.debug"
-- 
2.25.1


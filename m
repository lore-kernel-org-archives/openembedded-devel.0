Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web12.4950.1619259113332641200
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Apr 2021 03:11:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gemp8mHs;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id p17so541266plf.12
        for <openembedded-devel@lists.openembedded.org>; Sat, 24 Apr 2021 03:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=1np6gR2FQA+wV3VTb0heKVN5v0Cj21hKSXortkRevBo=;
        b=gemp8mHs34j+TqizeVoggRR5Wd7r30s39vDaPKOqnTo3lUu4GlybPmya/a+y+Z33rQ
         zX4kdSzYk61fna7jHPeNxiZuz7fMG8ZKUsvoGwb7HzTdYtWMKBz5dZ0JqfzZqVlxW63E
         eULk6csPIgH34xEv1bHxKc6DAGB7z0KesUZcXm6U5Igey0/BXMOm9GcLPsPptxbcExQN
         3CJluApfRNe1Q9rsuL5oE916WcxZRrsYFcoRLGHASxftcFomwQK3mPxeg8tq/DOTfXOC
         ABGoQZauiaZOcYebckHqUlTSLH3M4pi1/4H9F+5dXWG2CZ20Rud6x2UjhzQq3Am4jDR2
         eJEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=1np6gR2FQA+wV3VTb0heKVN5v0Cj21hKSXortkRevBo=;
        b=h+R0zDkYmbgrAQsPI7JYKfs3jKdIVVVpvIhEi6RHydZjgnLvHye2DcWBXIu9Hw3U+q
         UbAxv7f6fGCKpDrPwWx+3QfVBvPpB2o+rqxyKRbkA7VG9SvHqSTUycthpDvypUbjF3nn
         lI4oGNAXY0sQUaOKeZRG8QM+H9NZvNpHCUSMvdRY/xs9CGPKFcKzn1VgLMEODHzgUlcp
         s0myqrHNtmgyR4KB9z7rSjNIXFZXs5xBj/SNrLTVNzzlKHi6zZ2h945fHdIRqb5D/r4k
         dD+Ma/dCziPIvzOXQev4H/jA9gACQslnK72tvVQiF1AyFhEA9400vU7T4LiBixpGfz3Q
         6KOg==
X-Gm-Message-State: AOAM531zsZmHQD36fSgiGTRJ7DbrNQynCMwwXAtg8H12s29vveyYocka
	MAUH4WCVoxPBDY/ho9toznaikMGshE43Eg==
X-Google-Smtp-Source: ABdhPJz55y3MNGxc2yaiAp7+kdtZHjn7eWd6FAGMEPaVPPjReLQFxA55xjGrvw0F7dbqmAVYjQFv+A==
X-Received: by 2002:a17:902:7689:b029:eb:3d5f:ae58 with SMTP id m9-20020a1709027689b02900eb3d5fae58mr7934054pll.39.1619259112548;
        Sat, 24 Apr 2021 03:11:52 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:9c11:697b:fdac:256e])
        by smtp.gmail.com with ESMTPSA id h17sm1033173pfr.97.2021.04.24.03.11.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 03:11:52 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 3/6] tigervnc: upgrade to 1.11.0
Date: Sat, 24 Apr 2021 03:11:44 -0700
Message-Id: <63bcddbd85be0bb155de8be26af24f9c97677992.1619258978.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1619258978.git.akuster808@gmail.com>
References: <cover.1619258978.git.akuster808@gmail.com>

From: Chen Qi <Qi.Chen@windriver.com>

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
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...002-do-not-build-tests-sub-directory.patch | 21 +++++------
 ...vnc-add-fPIC-option-to-COMPILE_FLAGS.patch | 36 +++++++------------
 ...{tigervnc_1.10.1.bb => tigervnc_1.11.0.bb} | 13 ++++---
 3 files changed, 32 insertions(+), 38 deletions(-)
 rename meta-oe/recipes-graphics/tigervnc/{tigervnc_1.10.1.bb => tigervnc_1.11.0.bb} (89%)

diff --git a/meta-oe/recipes-graphics/tigervnc/files/0002-do-not-build-tests-sub-directory.patch b/meta-oe/recipes-graphics/tigervnc/files/0002-do-not-build-tests-sub-directory.patch
index 4e875ba82b..5a42e67d06 100644
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
index 97b0a388a2..5f14665b8d 100644
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
index f97c2b2d6c..ce6c59bc39 100644
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
2.17.1


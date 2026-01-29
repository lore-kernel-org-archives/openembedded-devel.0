Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D26ABD358E7
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 09:05:55 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11332.1769677550746876011
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Jan 2026 01:05:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Okf9bY6O;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769677549; x=1801213549;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JcCXZRpu0cyEziz/5xKdBnhHsWJG534aPmb191DPc24=;
  b=Okf9bY6OY6AwsOHa2iLpn1f8cmBLmyOzSNbUH7cfCc0TyvO5Rc66TqcH
   tWPtoxA5eQiGLPXsx18NIDyDLKQPifrF/JZEb8JXBT9gvy6yhWeg1OVZd
   /1UB1BMPZmhZFvhK7qhwCClcJQpB4zHnL53AmkFQQ9OWMSl1t2wiq2Vf6
   mx4b9urNlbrjNCWHOFpgDyiaD2Z9hNgeeHPr6kg8bjmwNHUa9gXRnPP1W
   74Ub9TWZ3Rf/NQoWfCEudbuOwuT64bXqlKZlWKLWeNVpFw2erLfpBn203
   dMy5B7qXwgFycyR/N59Vk+HRV4/L+ZjbPUUt6iuX8Ub+wI0pQ2U9ZiKXn
   Q==;
X-CSE-ConnectionGUID: g4cKoTAOQFiqvKG/6fQSFw==
X-CSE-MsgGUID: ivtkBxKRRHqkYGP6CzHGXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="227121061"
X-IronPort-AV: E=Sophos;i="6.21,260,1763391600"; 
   d="scan'208";a="227121061"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([51.138.80.169])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 18:05:47 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 0A57881DA
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Jan 2026 09:05:49 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id B01B81809AFA
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Jan 2026 09:05:48 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 6D3D7404339
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Jan 2026 09:05:46 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] tigervnc: upgrade 1.15.0 -> 1.16.0
Date: Thu, 29 Jan 2026 17:05:43 +0800
Message-ID: <20260129090543.9383-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 29 Jan 2026 09:05:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123985

1.ChangeLog
  https://github.com/TigerVNC/tigervnc/releases/tag/v1.16.0

2.Update 0002-add-missing-dynamic-library-to-FLTK_LIBRARIES.patch for 1.16.0

3.Update xorg-server to 21.1.21

4.Fix do_install error

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...add-missing-dynamic-library-to-FLTK_LIBRARIES.patch |  9 ++++++---
 .../{tigervnc_1.15.0.bb => tigervnc_1.16.0.bb}         | 10 +++++-----
 2 files changed, 11 insertions(+), 8 deletions(-)
 rename meta-oe/recipes-graphics/tigervnc/{tigervnc_1.15.0.bb => tigervnc_1.16.0.bb} (93%)

diff --git a/meta-oe/recipes-graphics/tigervnc/files/0002-add-missing-dynamic-library-to-FLTK_LIBRARIES.patch b/meta-oe/recipes-graphics/tigervnc/files/0002-add-missing-dynamic-library-to-FLTK_LIBRARIES.patch
index 101adaa82f..924b950c59 100644
--- a/meta-oe/recipes-graphics/tigervnc/files/0002-add-missing-dynamic-library-to-FLTK_LIBRARIES.patch
+++ b/meta-oe/recipes-graphics/tigervnc/files/0002-add-missing-dynamic-library-to-FLTK_LIBRARIES.patch
@@ -6,16 +6,19 @@ Subject: [PATCH] add missing dynamic library to FLTK_LIBRARIES
 Upstream-Status: Pending
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+Update for 1.16.0
+Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
 ---
  CMakeLists.txt | 2 ++
  1 file changed, 2 insertions(+)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 80c2762c..eb581600 100644
+index a5981938..dd13d0df 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -315,6 +315,8 @@ if(BUILD_VIEWER)
-   set(CMAKE_REQUIRED_LIBRARIES)
+   endif()
  endif()
  
 +set(FLTK_LIBRARIES ${FLTK_LIBRARIES} -lm -ldl -lpng -ljpeg)
@@ -24,5 +27,5 @@ index 80c2762c..eb581600 100644
  trioption(ENABLE_GNUTLS "Enable protocol encryption and advanced authentication")
  if(ENABLE_GNUTLS)
 -- 
-2.25.1
+2.43.0
 
diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.0.bb
similarity index 93%
rename from meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb
rename to meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.0.bb
index efc166dfa6..a5413a9108 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.0.bb
@@ -16,9 +16,9 @@ REQUIRED_DISTRO_FEATURES = "x11 pam"
 # out-of-tree builds.
 B = "${S}"
 
-SRCREV = "8bdf8734ce12c8ed3c232496fc8a4ccdb04636b8"
+SRCREV = "dc50022844dfad0a0e195d54b8499fcf242fff0c"
 
-SRC_URI = "git://github.com/TigerVNC/tigervnc.git;branch=1.15-branch;protocol=https \
+SRC_URI = "git://github.com/TigerVNC/tigervnc.git;branch=1.16-branch;protocol=https \
            file://0001-do-not-build-tests-sub-directory.patch \
            file://0002-add-missing-dynamic-library-to-FLTK_LIBRARIES.patch \
            file://0003-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch \
@@ -26,10 +26,10 @@ SRC_URI = "git://github.com/TigerVNC/tigervnc.git;branch=1.15-branch;protocol=ht
 
 # Keep sync with xorg-server in oe-core
 XORG_PN ?= "xorg-server"
-XORG_PV ?= "21.1.18"
+XORG_PV ?= "21.1.21"
 SRC_URI += "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${XORG_PV}.tar.xz;name=xorg"
 XORG_S = "${UNPACKDIR}/${XORG_PN}-${XORG_PV}"
-SRC_URI[xorg.sha256sum] = "c878d1930d87725d4a5bf498c24f4be8130d5b2646a9fd0f2994deff90116352"
+SRC_URI[xorg.sha256sum] = "c0cbe5545b3f645bae6024b830d1d1154a956350683a4e52b2fff5b0fa1ab519"
 
 # It is the directory containing the Xorg source for the
 # machine on which you are building TigerVNC.
@@ -85,7 +85,7 @@ do_compile:append () {
 }
 
 do_install:append() {
-    oe_runmake -C ${B}/hw/vnc 'DESTDIR=${D}' install
+    oe_runmake 'TIGERVNC_BUILDDIR=${B}' -C ${B}/hw/vnc 'DESTDIR=${D}' install
 }
 
 FILES:${PN} += " \
-- 
2.43.0



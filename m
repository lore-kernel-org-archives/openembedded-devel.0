Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79C2DC63703
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:46 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web12.8172.1648870004667837718
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Apr 2022 20:26:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: liezhi.yang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 2323QggI014676
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 1 Apr 2022 20:26:42 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 1 Apr 2022 20:26:42 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Fri, 1 Apr 2022 20:26:42 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] wxwidgets: Fix checking for PACKAGECONFIG and
 DISTRO_FEATURES
Date: Fri, 1 Apr 2022 20:26:42 -0700
Message-ID: <20220402032642.107153-1-liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96342

The PACKAGECONFIG depends on DISTRO_FEATURES, not DISTRO_FEATURES depends on
PACKAGECONFIG. And the REQUIRED_DISTRO_FEATURES is not needed since it can work
with gtk or x11.

Fixed when x11 is not in DISTRO_FEATURES:
$ bitbake wxwidgets
ERROR: Nothing PROVIDES 'wxwidgets'
wxwidgets was skipped: missing required distro feature 'x11' (not in DISTRO_FEATURES)

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
index f9349b02a..b10742eac 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
@@ -10,10 +10,7 @@ LICENSE = "WXwindows"
 LIC_FILES_CHKSUM = "file://docs/licence.txt;md5=981f50a934828620b08f44d75db557c6"
 
 inherit ${@bb.utils.contains('PACKAGECONFIG', 'qt', 'cmake_qt5', 'cmake', d)}
-inherit features_check lib_package binconfig pkgconfig
-
-# All toolkit-configs except 'no_gui' require x11 explicitly (see toolkit.cmake)
-REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG', 'no_gui', '', 'x11', d)}"
+inherit lib_package binconfig pkgconfig
 
 DEPENDS += " \
     jpeg \
@@ -46,7 +43,11 @@ EXTRA_OECMAKE:append:libc-musl = " \
     -DHAVE_LOCALE_T=OFF \
 "
 
-PACKAGECONFIG ?= "gtk ${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)}"
+# All toolkit-configs except 'no_gui' require x11 explicitly (see toolkit.cmake)
+PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk', 'no_gui', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)} \
+"
+
 PACKAGECONFIG:remove:class-native = "opengl"
 
 # Note on toolkit-PACKAGECONFIGs: select exactly one of 'no_gui' / 'gtk' / 'qt'
-- 
2.31.1



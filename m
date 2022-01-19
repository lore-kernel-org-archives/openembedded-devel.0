Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59026C433EF
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 01:46:37 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web08.887.1642556779503321039
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jan 2022 17:46:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=WPaihvwV;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1642556777; i=@fujitsu.com;
	bh=ocnF4ynvexf9Bxx/P8ErqW2dA1Az9bQDB7k6PnuNuJM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=WPaihvwVysIod3mnOR4fBRFpcGHHr7trFOsSJv4EDjVHaBd7hpxLr2dkZ71aIJbRM
	 9aTky90I4aJBsAOjFza3HCI7RbBNDBWhBYitP6hhhUBhZPCTU+yi3uhj85MwUZZVc4
	 lGPSUlwdoEkpYUDq55YjwgwzQcyUbB90qcxJxV8QIac1hFiTOryyAj4UXcY/q2kP+R
	 hLC8IVGidIWmG8GUKUo9o73lSCnEjgQNQXNO92+MYXAv0030RPPb2ltHEmvAqNAX+3
	 HeklFsxV54dMpbSLvO2PwaNIxmtN4jrAKg+LLv+CAgjo3Qip1NGOMOafcTeNYd57xr
	 +kw4jvIxt9bjA==
Received: from [100.115.32.207] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-2.aws.ess.symcld.net id 5A/43-28974-96D67E16;
 Wed, 19 Jan 2022 01:46:17 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJIsWRWlGSWpSXmKPExsViZ8MxRTcj93m
  iwdZmDYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaOr7yZLwRnZiivti1kaGA9IdTFycQgJzGSS
  eLC4ixnCOcEocXLKatYuRk4ONgE1iem3boDZIgL6Ektn72EGsZkFVCRe/O5hB7GFBVwltpxcy
  AJiswioSnTeP8XWxcjBwSvgJDFndgBIWEJAQWLKw/dgrbwCghInZz5hgRgjIXHwxQtmiBpFid
  mXm1kg7AqJWbPamCYw8s5C0jILScsCRqZVjFZJRZnpGSW5iZk5uoYGBrqGhqa6xpa6pkZ6iVW
  6iXqppbrlqcUlukBuebFeanGxXnFlbnJOil5easkmRmCIpRSrm+xg7F75U+8QoyQHk5Ior2j8
  80QhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKErysOUA5waLU9NSKtMwcYLjDpCU4eJREeJ9mAaV5i
  wsSc4sz0yFSpxgVpcR5O7OBEgIgiYzSPLg2WIxdYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqC
  TMextkCk9mXgnc9FdAi5mAFvc/ewayuCQRISXVwBS33XnBMYe53zX7P5keeH7h34KIJTwmiQX
  dd75+D21wsp/17ZCz1VUvnsdfgyZZnuNbqu4hKiBz1eKv/bPEjY7MmtdqOb7s3nZjy9W8P4ej
  +M96e6nqtK03Fo8Rcwi40Xpmi+CEvqmNkoKMU1+I/Hc48aVrstJbUQc9rn3LojeI6G0U/a97/
  qPz9xdthj2eJ6Sttb14/8pGrrxv1ll+WsT70IQKEd22c++TPqvFaq74fNfkkSTjp8xp9UX8Py
  P9OlTjf0fmfAvfrvLkU+lu7TNdAXreefof0rwDvOpVRYX/3P3nto9V48COq733H86dtdJeo+y
  J7J/3AuFO3TVGsyc7CSvGtVclJBx6echATYmlOCPRUIu5qDgRAB3lai4sAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-565.messagelabs.com!1642556776!69533!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25603 invoked from network); 19 Jan 2022 01:46:16 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-17.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 19 Jan 2022 01:46:16 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 20J1kGHw025504
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Jan 2022 01:46:16 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Wed, 19 Jan 2022 01:46:14 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libsdl2-ttf: upgrade 2.0.15 -> 2.0.18
Date: Wed, 19 Jan 2022 09:46:05 +0800
Message-ID: <1642556766-18315-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Jan 2022 01:46:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94928

refresh automake_foreign.patch

License-Update: year updated to 2022.

Changelog:
=========
-Added TTF_GetFreeTypeVersion() and TTF_GetHarfBuzzVersion()
-Added support for Signed Distance Field rendering with TTF_SetFontSDF() and
 TTF_GetFontSDF()
-Added optional DPI-scaling of fonts, with the following new functions:
 TTF_OpenFontDPI()
 TTF_OpenFontIndexDPI()
 TTF_OpenFontDPIRW()
 TTF_OpenFontIndexDPIRW()
 TTF_SetFontSizeDPI()
-Added 32-bit character support with:
 TTF_GlyphIsProvided32()
 TTF_GlyphMetrics32()
 TTF_RenderGlyph32_Solid()
 TTF_RenderGlyph32_Shaded()
 TTF_RenderGlyph32_Blended()
 TTF_GetFontKerningSizeGlyphs32()
-Added functions to set direction and script when using Harfbuzz:
 TTF_SetDirection()
 TTF_SetScript()
-Added extended API for text measurement:
 TTF_MeasureText()
 TTF_MeasureUTF8()
 TTF_MeasureUNICODE()
-Added TTF_SetFontSize() to set font size dynamically
-Added 'Shaded' and 'Solid' text wrapped functions:
 TTF_RenderText_Solid_Wrapped()
 TTF_RenderUTF8_Solid_Wrapped()
 TTF_RenderUNICODE_Solid_Wrapped()
 TTF_RenderText_Shaded_Wrapped()
 TTF_RenderUTF8_Shaded_Wrapped()
 TTF_RenderUNICODE_Shaded_Wrapped()
-Added TTF_HINTING_LIGHT_SUBPIXEL for better results at small text sizes at a
 performance cost

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsdl/libsdl2-ttf/automake_foreign.patch        |  6 +++---
 .../{libsdl2-ttf_2.0.15.bb => libsdl2-ttf_2.0.18.bb} | 12 +++++-------
 2 files changed, 8 insertions(+), 10 deletions(-)
 rename meta-oe/recipes-graphics/libsdl/{libsdl2-ttf_2.0.15.bb => libsdl2-ttf_2.0.18.bb} (60%)

diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-ttf/automake_foreign.patch b/meta-oe/recipes-graphics/libsdl/libsdl2-ttf/automake_foreign.patch
index 871e6e94e..962c11979 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl2-ttf/automake_foreign.patch
+++ b/meta-oe/recipes-graphics/libsdl/libsdl2-ttf/automake_foreign.patch
@@ -1,4 +1,4 @@
-From f9c4ad3a171d676e3818b8f6897f325ccf0b2203 Mon Sep 17 00:00:00 2001
+From 6ec375eaafc43a2b3c30a0e0e49447d231d81a67 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 9 May 2017 00:57:10 -0700
 
@@ -7,10 +7,10 @@ Date: Tue, 9 May 2017 00:57:10 -0700
  1 file changed, 2 insertions(+)
 
 diff --git a/Makefile.am b/Makefile.am
-index 8166d91..8e05e49 100644
+index 8568dd2..5efc91e 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -2,6 +2,8 @@
+@@ -3,6 +3,8 @@ ACLOCAL_AMFLAGS = -I acinclude
  
  lib_LTLIBRARIES = libSDL2_ttf.la
  
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.0.15.bb b/meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.0.18.bb
similarity index 60%
rename from meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.0.15.bb
rename to meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.0.18.bb
index 0fd9916e9..513b41144 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.0.15.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.0.18.bb
@@ -2,14 +2,12 @@ SUMMARY = "Simple DirectMedia Layer truetype font library"
 SECTION = "libs"
 DEPENDS = "virtual/libsdl2 freetype virtual/libgl"
 LICENSE = "Zlib"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=4bb27d550fdafcd8f8e4fb8cbb2775ef"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=e98cfd01ca78f683e9d035795810ce87"
 
-SRC_URI = " \
-    http://www.libsdl.org/projects/SDL_ttf/release/SDL2_ttf-${PV}.tar.gz \
-    file://automake_foreign.patch \
-"
-SRC_URI[md5sum] = "04fe06ff7623d7bdcb704e82f5f88391"
-SRC_URI[sha256sum] = "a9eceb1ad88c1f1545cd7bd28e7cbc0b2c14191d40238f531a15b01b1b22cd33"
+SRC_URI = "http://www.libsdl.org/projects/SDL_ttf/release/SDL2_ttf-${PV}.tar.gz \
+           file://automake_foreign.patch \
+           "
+SRC_URI[sha256sum] = "7234eb8883514e019e7747c703e4a774575b18d435c22a4a29d068cb768a2251"
 
 S = "${WORKDIR}/SDL2_ttf-${PV}"
 
-- 
2.25.1



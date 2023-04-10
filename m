Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4CC0C77B61
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 08:28:28 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.39449.1681115306469916646
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Apr 2023 01:28:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=MKtobM/i;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681115304; i=@fujitsu.com;
	bh=7O5iLmUlOFJ1sjTSxk6lRNaNuFEGPPYS1A1Q3Wy8N90=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=MKtobM/idxLCn1t0RSyv7eZd8YEdd2Q4ng69gxqfIDhdYb6K9MTfRVnr1mOBorjqH
	 ldD4cdbltKnDDlQMxGFxZEdntdMEpoVT2w3ozeBuh27CkPbWRXTm+rwq8I+sTR8nvD
	 RyjZDgsdPe/+S/xqIjf0IQ+TrniSvRyVkr8PfGxwZWI4/t3G1LIor14JDN71ERE9CY
	 VYVjp9MDHgAsGFc4sr9Qi5R80ibXGgH/RPiBQ5RwbKWDglDMV3e6OUovVGVwTeEShL
	 d/PUvy6zWeqPaSVs0lotQhG48YWOMxQm2sYAfU4gnRb8VEwaM+Gf9+Ne5RnTa2+lze
	 D+Cp4RuhBOgqg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8MxSXfFCeM
  Ugz++FhcPL2V2YPQ4t3EFYwBjFGtmXlJ+RQJrxtmWP8wFW6QrnnVeYmlg7JfoYuTiEBJ4wijR
  0neCEcK5ziQx6e0WFghnD6PE0WlLmLoYOTnYBKQkbtz/zwZiiwjoSyydvYcZxGYWUJF48buHH
  cQWFnCWaJ78GMxmEVCV6Jl5DWgQBwevgJPE7Fd8IGEJAQWJKQ/fg7VyApUvu3aCFcQWAipZ/v
  oRI4jNKyAocXLmExaI8RISB1+8YIboVZSYfbmZBcKukGicfogJwlaTuHpuE/MERsFZSNpnIWl
  fwMi0itGsOLWoLLVI19BCL6koMz2jJDcxM0cvsUo3US+1VLc8tbhE10gvsbxYL7W4WK+4Mjc5
  J0UvL7VkEyMwdFOKlT/sYFza91fvEKMkB5OSKG8Xl3GKEF9SfkplRmJxRnxRaU5q8SFGGQ4OJ
  QnehQeAcoJFqempFWmZOcA4gklLcPAoifBWHANK8xYXJOYWZ6ZDpE4xKkqJ8/aCJARAEhmleX
  BtsNi9xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYd9thoCk8mXklcNNfAS1mAlrM5WIAsrg
  kESEl1cBUteJQDbuOe8DCpzcOlgiIaazlEPozs6TBZv7uuZcuhprfkygIX2F56dyKFUfWnPr0
  6Zix582t6p8+3K77Hv36R5/cvrkfBJxPx6y6nWb3VOuKjgjnw08bsm9MqlZ8XxP6pYGBXb7nv
  aJ86hGZo6VbGG6ffMAXsTj8lFO9yA3tyG9ck7TWFRgJXH3aGuussbnUWKh41YJz3w8vfHjv9+
  6CYw160pmbLl78F7rL4xjLvF/cGg8enfyveZo3+Hbf4/wfK04U8FTt/Mso+Nk9hqnH5FnGHt6
  G0tlKkz2bG/qDnxwp7Hhx2YThzbalDMrbW15NEDa71b3tjPJb+6szJ/kL8Zw8qpDMKsh8wvLP
  Tm6Vm0osxRmJhlrMRcWJAAbYw5BYAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-565.messagelabs.com!1681115303!288110!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17028 invoked from network); 10 Apr 2023 08:28:24 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-21.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2023 08:28:24 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id B37B510032B
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 09:28:23 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id A73E7100323
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 09:28:23 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 10 Apr 2023 09:28:22 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] poppler: upgrade 23.03.0 -> 23.04.0
Date: Mon, 10 Apr 2023 16:27:43 +0800
Message-ID: <1681115263-24378-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681115263-24378-1-git-send-email-wangmy@fujitsu.com>
References: <1681115263-24378-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 08:28:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102014

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
core:
 * Fix memory issue when signing fails. Issue #1372
 * Internal improvements of signature related code
 * CairoOutputDev: improve type3 font rendering
 * Fix memory leak in GlobalParams::findSystemFontFileForFamilyAndStyle

utils:
 * pdftocairo: Fix crash in some special situations
 * pdfsig: allow holes in -dump signature list
 * pdfsig: Support --help

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../poppler/0001-cmake-Do-not-use-isystem.patch        | 10 ++++------
 .../poppler/{poppler_23.03.0.bb => poppler_23.04.0.bb} |  2 +-
 2 files changed, 5 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-support/poppler/{poppler_23.03.0.bb => poppler_23.04.0.bb} (96%)

diff --git a/meta-oe/recipes-support/poppler/poppler/0001-cmake-Do-not-use-isystem.patch b/meta-oe/recipes-support/poppler/poppler/0001-cmake-Do-not-use-isystem.patch
index 44a22963a..b4e3fb05e 100644
--- a/meta-oe/recipes-support/poppler/poppler/0001-cmake-Do-not-use-isystem.patch
+++ b/meta-oe/recipes-support/poppler/poppler/0001-cmake-Do-not-use-isystem.patch
@@ -1,4 +1,4 @@
-From 51a2a1e4d8ca4040a6a7eac398cb704da35f39e5 Mon Sep 17 00:00:00 2001
+From 04686340c4cd375a17d60d31bf6943367cc33214 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 21 Jan 2023 03:09:08 -0800
 Subject: [PATCH] cmake: Do not use -isystem
@@ -28,6 +28,7 @@ but instead of prepending, it will append to system headers and the
 issue is addressed
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  CMakeLists.txt         |  4 ++--
  glib/CMakeLists.txt    |  4 ++--
@@ -38,7 +39,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  6 files changed, 16 insertions(+), 16 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 4768ac8..cdc014d 100644
+index c6c757c..5f1c540 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -603,10 +603,10 @@ add_library(poppler ${poppler_SRCS})
@@ -53,7 +54,7 @@ index 4768ac8..cdc014d 100644
 +  target_include_directories(poppler  PRIVATE ${LCMS2_INCLUDE_DIR})
  endif()
  generate_export_header(poppler BASE_NAME poppler-private EXPORT_FILE_NAME "${CMAKE_CURRENT_BINARY_DIR}/poppler_private_export.h")
- set_target_properties(poppler PROPERTIES VERSION 126.0.0 SOVERSION 126)
+ set_target_properties(poppler PROPERTIES VERSION 127.0.0 SOVERSION 127)
 diff --git a/glib/CMakeLists.txt b/glib/CMakeLists.txt
 index 52e8687..08ab39a 100644
 --- a/glib/CMakeLists.txt
@@ -187,6 +188,3 @@ index 1c3ebcb..bc1840a 100644
  endif()
  install(TARGETS pdftops DESTINATION bin)
  install(FILES pdftops.1 DESTINATION ${CMAKE_INSTALL_MANDIR}/man1)
--- 
-2.39.1
-
diff --git a/meta-oe/recipes-support/poppler/poppler_23.03.0.bb b/meta-oe/recipes-support/poppler/poppler_23.04.0.bb
similarity index 96%
rename from meta-oe/recipes-support/poppler/poppler_23.03.0.bb
rename to meta-oe/recipes-support/poppler/poppler_23.04.0.bb
index 165e155ec..19bdce4d8 100644
--- a/meta-oe/recipes-support/poppler/poppler_23.03.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_23.04.0.bb
@@ -8,7 +8,7 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://basename-include.patch \
            file://0001-cmake-Do-not-use-isystem.patch \
            "
-SRC_URI[sha256sum] = "b04148bf849c1965ada7eff6be4685130e3a18a84e0cce73bf9bc472ec32f2b4"
+SRC_URI[sha256sum] = "b6d893dc7dcd4138b9e9df59a13c59695e50e80dc5c2cacee0674670693951a1"
 
 DEPENDS = "fontconfig zlib cairo lcms glib-2.0"
 
-- 
2.34.1



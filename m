Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 733C0D4337F
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 08:02:22 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8287.1765526538253811908
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Dec 2025 00:02:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hGhVse/+;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7b89c1ce9easo1139550b3a.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 00:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765526537; x=1766131337; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k6Jo66qYPOurdKc2v0L7UC3kedlHymXcBtVFX/7JdQ8=;
        b=hGhVse/+PBuy/dYnOG+NRwQYVxhoaXToxkOxpsaB9FGw9hGhiITokzI2xg/UNf9JI4
         dY14bbDnwRXWoNE4KigU/xL2yWrKAqCXWyKO5yKMRl451yf2CcKXMQFRoubDqjyULIPy
         ENNhp4pRbAdGYOw0UDQoSCjZuOK3EizO3AN2XGaF9W3Uw9T/zodceDcuGvDHAz0BXfsZ
         rCoSNXVCHj5RzTgIloCBCpG4g9gLDK+mwchhmXTcQD6s1PX3vGZVtEN+4j8bjbqJplR+
         O02mahPv3azWHCZkBKVQAHJkNTgWDUTMMpjFTsw32liDGY9jVlrvhTC/DfEi5w8rSpYN
         4m7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765526537; x=1766131337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k6Jo66qYPOurdKc2v0L7UC3kedlHymXcBtVFX/7JdQ8=;
        b=kTBA7pV2lGogCRv7hZBah5AMqN1kM9HU4AbCQIWdpBGsqdLmz5moB++9zMs6z3n0Z4
         LXd+9DBj/uKysr63xXbaAhkAoJW0tNmHXYVrLj77K1A1nK4UIfnSWmMHGlQA1YouoW8E
         59nJgQcmw/el1lTFZsseclxd4aenPmsLyzQOilotkxr81+QuIG9Wwq4BfcACBw6WuZyB
         LNUFJhWdQntYNnQm3SnCI/94CkGc1C4fJr8ltRSo4HlUXyL0DOABBEwWY6s3R3Ygx+55
         an/0oTxgOXU2zpNB2x4W0ZYcxBBh8H4oHz0B6lOX5h25Ye+uhG5ricVyov5FWQKJaM6A
         y/LA==
X-Gm-Message-State: AOJu0YwIx7lNiS9/9JYBbUsSN+n8hBJ+dOlK6NbJdWu4GP0Mey+lEKeH
	C1UaUoYIEBxSAByNiLoJWhhk2L4KkRhwiPUT4up334ju3k6aqCrGJ+m86Kl7AQ==
X-Gm-Gg: AY/fxX6n2TCkDVvxbpXsf5+T94ZPa7vv5v8/PLnCvL//fzl81aWuTQvdXIUhe7YVZPV
	AL4305fsDEp4T0c0oM74ithLOKyDzvSlpzCViI9v2Tca81SOiLVryCMChjnOtRz3Ae1eZpXMCSl
	qBxXZcJVp+F/CgnlsfvVZyGie3rnsPTBLRLmuxzVpXuPCjZITZozyH5mlfvcXpWB0hKSy3OyWHI
	8FbDxHI2mkQir0q06xYR4VR0d68VtTKWJoJXagYfp6KH81kkeZHMTSipYhJagb9yU4FBX0QhtxT
	utUMumPbRVX/V/tYRTkrXcc01ppUMhWQKcyOR6S3eo5smCBZh+RdKqWv4/959XxJTJPgfBzS4++
	ROv3ys4LL5TOPIAL7Qd8DSqZbScfrV4jJyW4chEApExQBuvbPMX/8KgYMSGAK1sO98PZJLPzVeJ
	dv71WNOdBWo/k1eV6yWJj72y0=
X-Google-Smtp-Source: AGHT+IEM/TMIwlasUO1mq2ygbv5+cjHntloCLgpl4VDEWDFNDSz8p1ZHlhLwdUaHYCEXOuO6xekjYQ==
X-Received: by 2002:a05:6a00:1d22:b0:7e8:4471:ae5f with SMTP id d2e1a72fcca58-7f6694aa2a4mr1332243b3a.43.1765526537248;
        Fri, 12 Dec 2025 00:02:17 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c5093c4bsm4494882b3a.48.2025.12.12.00.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 00:02:16 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][whinlatter][PATCH 5/8] gupnp-av: upgrade 0.14.1 -> 0.14.4
Date: Fri, 12 Dec 2025 13:31:48 +0530
Message-ID: <20251212080151.3711461-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251212080151.3711461-1-ankur.tyagi85@gmail.com>
References: <20251212080151.3711461-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 08:02:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122593

From: Gyorgy Sarvari <skandigraun@gmail.com>

Drop patch that is included in this release.

Changelog:
0.14.4:
- Move documentation to gi-docgen
0.14.3:
- CI fixes
0.14.2:
- xml: Fix compatibility with libxml2 2.12.x
- Add missing array annotation
- build: Fix Requires: line of pkg-config file
- Loosen restriction on dc:date verification

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit b8d9e45b6912800c0d78f3cc6b53160cec79f28c)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../0001-all-Drop-xmlRecoverMemory.patch      | 44 -------------------
 ...{gupnp-av_0.14.1.bb => gupnp-av_0.14.4.bb} |  8 ++--
 2 files changed, 3 insertions(+), 49 deletions(-)
 delete mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp-av/0001-all-Drop-xmlRecoverMemory.patch
 rename meta-multimedia/recipes-connectivity/gupnp/{gupnp-av_0.14.1.bb => gupnp-av_0.14.4.bb} (51%)

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-av/0001-all-Drop-xmlRecoverMemory.patch b/meta-multimedia/recipes-connectivity/gupnp/gupnp-av/0001-all-Drop-xmlRecoverMemory.patch
deleted file mode 100644
index 92b52ad98a..0000000000
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp-av/0001-all-Drop-xmlRecoverMemory.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From d99f71a4a52da7582d5e26992a1ab303b280d28a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 30 Jun 2023 03:23:12 -0700
-Subject: [PATCH] Drop xmlRecoverMemory
-
-newer libxml has deprecated xmlRecoverMemory therefore replace it with xmlReadMemory
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gupnp/-/commit/80e68995b745a5900eaaa1d0c424d3a9d354e42d]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- gupnp-didl-lite-parser.c    | 2 +-
- gupnp-feature-list-parser.c | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/gupnp-didl-lite-parser.c b/gupnp-didl-lite-parser.c
-index 3a5727f..840d718 100644
---- a/libgupnp-av/gupnp-didl-lite-parser.c
-+++ b/libgupnp-av/gupnp-didl-lite-parser.c
-@@ -230,7 +230,7 @@ gupnp_didl_lite_parser_parse_didl_recursive (GUPnPDIDLLiteParser *parser,
-         GUPnPAVXMLDoc *xml_doc = NULL;
-         gboolean       result;
- 
--        doc = xmlRecoverMemory (didl, strlen (didl));
-+        doc = xmlReadMemory (didl, strlen (didl), NULL, NULL, XML_PARSE_NONET | XML_PARSE_RECOVER);
-         if (doc == NULL) {
-                 g_set_error (error,
-                              G_MARKUP_ERROR,
-diff --git a/gupnp-feature-list-parser.c b/gupnp-feature-list-parser.c
-index 16208b5..f804fe7 100644
---- a/libgupnp-av/gupnp-feature-list-parser.c
-+++ b/libgupnp-av/gupnp-feature-list-parser.c
-@@ -114,7 +114,7 @@ gupnp_feature_list_parser_parse_text
-         xmlNode      *element;
-         GList        *feature_list = NULL;
- 
--        doc = xmlRecoverMemory (text, strlen (text));
-+        doc = xmlReadMemory (text, strlen (text), NULL, NULL, XML_PARSE_NONET | XML_PARSE_RECOVER);
-         if (doc == NULL) {
-                 g_set_error (error,
-                              G_MARKUP_ERROR,
--- 
-2.41.0
-
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.14.1.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.14.4.bb
similarity index 51%
rename from meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.14.1.bb
rename to meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.14.4.bb
index 2a5c0808ee..21f0449762 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.14.1.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.14.4.bb
@@ -6,9 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 DEPENDS = "gupnp"
 
-inherit meson pkgconfig gobject-introspection vala
+inherit gi-docgen meson pkgconfig gobject-introspection vala
 
-SRC_URI = "${GNOME_MIRROR}/${BPN}/0.14/${BPN}-${PV}.tar.xz \
-           file://0001-all-Drop-xmlRecoverMemory.patch \
-          "
-SRC_URI[sha256sum] = "b79ce0cc4b0c66d9c54bc22183a10e5709a0011d2af272025948efcab33a3e4f"
+SRC_URI = "${GNOME_MIRROR}/${BPN}/0.14/${BPN}-${PV}.tar.xz"
+SRC_URI[sha256sum] = "21d974b3275cb5dcf5b8aa1d9a3fc80e7edca706935f6fbd004c79787138f8c7"


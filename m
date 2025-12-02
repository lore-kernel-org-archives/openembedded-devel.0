Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D37FD12671
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 20:44:22 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3366.1764708253969338176
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Dec 2025 12:44:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NLmShcuG;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-477770019e4so50118005e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 Dec 2025 12:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764708252; x=1765313052; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bq1e0MQ6b/sCqJ+tOP22UcXmOODbnHEcgOnZQCta53U=;
        b=NLmShcuG2lASh5eW6jQRJC25vHkLJplKJWQ7ygpqRQ4FosvqsUL02h+57dT7sABZLJ
         Azq4742yX4YfM2xu8bfjBae8VH20QP7Qqwe/cVlIhCvUYExE5pXz68oC7BxM6LsGblvj
         ZIOtD97HFejmM4YpA8XOZ0PeMClb7vN46zqAM++aOUe+e23BxUzbFdoVpR/NYa3tFHrf
         K8+ysAVa+yqJE9lfJ4MPOXjIDdQtVn8SlVo3dgJD4uMssZ0zZ1H1xN6ycqVWxZN716yO
         RHtYGNarhrnSu0OGWTB8Erc1jeOlbsq9iBLFacxKoyr9sVyfM6xCwFY6uHfCOOnMshU2
         U3sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764708252; x=1765313052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bq1e0MQ6b/sCqJ+tOP22UcXmOODbnHEcgOnZQCta53U=;
        b=qzsWL8kcjR83eHYm9uw3Z4/ilI9xJFF3jAcpwV9P/nLeoZGOfFxnBHKtgLZTkpPlnB
         pppV4CKpxPnsA6JgKkSz6eAwmfSnUp9X5KFINm/0cXLQRxMvzOb92TdaxbQYti9EMRwH
         sw4Os5KKfMNRuTDI7ROPKim5licw++cCCQzTtcI9UQMlRig9gOaTEJcF+QcqxIz9rfDZ
         hJRjwqu6P4b2uCRo/LTQ0CmN/pZwTqBG1Wswi+bOq/TxIo9t6Adi6CHzAdskHycuo9j2
         9Plcb4NjZu9L5/Hg9rnmu/tdfkAhS860OMbIFs8gjxN0Ed+uxkujv+JM54ta003kuOv5
         cBgQ==
X-Gm-Message-State: AOJu0YxyzdlJAzbIGOoX7sBOawmMtfxHjx+5dLJ1U6V7SrvWdNO7f5JR
	sXzHil8XULw863HyS4g077iGQz6C14LV0BZv8ua/Sg2w6BS6mzvu78HH5AWmYA==
X-Gm-Gg: ASbGncurlSN5h9rwnJ8F9HuKS6+svC/Xjbfac2izXou3eISKOdxRLdCeLQvNIFbNu3/
	wjY6C/cixr+Vi8/m+wr7aBkAFAbshpaQViZZlBWGcr62KMSHUxYdPq0AL3LGgINaqZCkEhAQQPC
	42k+9mfUaNZbdBoST6PLUCwkPuiO+wsKjlbjSLZyNXr3PnxgWjqfk6pA8TU/6SNBv/7BTMhp6Dk
	YvPX2Afox6zKg5yyRcvuDPJcKqLV0N/taKAwgxPfMbwHtqTCYTJpugBdF9fRfQFOSJY3IZ46oVx
	TRYinUvVHK6VCQmzkaqfortpaLF8bDjxQlz5GxQlMNywsHOy662AY3E89gpKZp1TRpvaxOZzYsk
	Xu58dF/CMjY9kis5fpLWY4V0mMutY/ECZgGvWuKGFSJLM5EK1IkCZpwjrhg/rA7isT5g2g57y30
	pKssUxN8wF1q+jDR9ai5Q=
X-Google-Smtp-Source: AGHT+IErFvbz1CEKb7L2FUvfr+FoT4jiIlWejU/VWVM7jV3LU9Osh1qIDR9cHXribOWNEU7zYXu/+w==
X-Received: by 2002:a05:600c:3587:b0:471:131f:85aa with SMTP id 5b1f17b1804b1-47904aecfd9mr317227985e9.13.1764708252264;
        Tue, 02 Dec 2025 12:44:12 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4792a7971c7sm8383295e9.2.2025.12.02.12.44.11
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 12:44:11 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 5/6] gupnp-av: upgrade 0.14.1 -> 0.14.4
Date: Tue,  2 Dec 2025 21:44:06 +0100
Message-ID: <20251202204407.3755450-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251202204407.3755450-1-skandigraun@gmail.com>
References: <20251202204407.3755450-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Dec 2025 20:44:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122270

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


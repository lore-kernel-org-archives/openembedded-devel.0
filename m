Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 476FBE9273C
	for <webhook@archiver.kernel.org>; Mon, 29 Dec 2025 14:52:03 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44422.1767019915674836575
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Dec 2025 06:51:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P5lo1+a6;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-432755545fcso1724593f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 06:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767019914; x=1767624714; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xa1rqYHIOxBg4laOne1ItmzSsFH3TJt95+5UW/NsE7g=;
        b=P5lo1+a6cK7PpbkW1qgWueFc7pof4Ha8MwykWSM1UmS4I7fnwXMwswaWkkPOfn0Z3I
         c2oz5z2TrmQ82N3RK3JDGruVRZ5uENIRf8jEadHR1r4WqU4V+yTlazD2D+Ru7qVsvTtR
         RgY+J/QRv87pN1Hp7jfpAVzoNwAG+Jif/fCQ8tgwGPF7X2/enBXLRhosUybs8bUmfBJX
         dVnbSnY01kDaCr75UOMnws7M17mwIBBzr4Nislk57rAQpG5GoCFfm7POhIIQlNpjpxMX
         hFB8nioKnMi4K+7xZfXK9fIB1/RJ+9+AA+BXhLJHt4ajP2EG6Z0qxKToZrS/QramlkWR
         okDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767019914; x=1767624714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xa1rqYHIOxBg4laOne1ItmzSsFH3TJt95+5UW/NsE7g=;
        b=oDT2WH+5yTmafZ12Wll6wQ0LGuaGvDEMsw3hRyvK5G9V87MSnd3A00U/andjMti7tR
         8x0TpSS+3w/qKB0f7ObBQKLJ6DwxqRtSeNPjLFeJ/Ah4apXNDVy+Tj0TDgrDMkLv5wD1
         xVtniIj4DxAFuukcA4hgbrsiFt+BxVa13G2rNySbV/iVXdz24ZctroiCw/QMHsCYICZT
         isjD89ueoyzTJfTBJHHHg2hGtrLR9IBEctRCDZJolz46zTnqnyu+zk++gF9g3hI1r0wP
         X3JH1XianULorK2EXEGGC5zTY0ltxHmQDqufuDAarPksuwDVmHU1B39VE1hAfXHZhHvZ
         KuLg==
X-Gm-Message-State: AOJu0YyURAo2aTka9xViqVP7p4qXLzpSTOOfznVenxIBPBOIJ/V0k9ty
	v9sPBhsFW2Q2D+dNtMkVikMAHnkEbGiWNBPHy3s4ZBpsnKjrssV3wES3lIXs+g==
X-Gm-Gg: AY/fxX6RE9Qh9Jo4iSx6Ws/+XLpy/DK/QsAW1vtSUb+5BFlOkPI7p2JFTE4J+CkXSZa
	VkLSEPLMfMHFaZbAhIqoRnHftezYcN642epirDJJBrXHc53KPl+QxLJrsF6HY04sm9mLEGmsE9y
	9sqXq/NpUHe8L1cL6kM/0PFdHuE/pFTidaVYPUbpZANeIozFBgYsQiNiQb/qJmg5refkIu364L8
	Gavn56ZOLHKX6WFUdkdTPc8MIiq6D1UIvd34bdb3+lpYfWWmyckgI3Hjr3XGeYRxbPd41KSR9A6
	xtMT5Vs6yUZOWpBBaHd9BCrRrNHpbh1BSGxRBilMjnnrEj9lbABkpXYN9BOQAX12Z2yiP76AhPr
	Vwvqqf35be4zIBT6UrEY+8UwykaAaPCwQDN0D2fgBP43MONCjiOqc6GLl++MlEX83bHHlGUfnY6
	VMOJhYx+YF
X-Google-Smtp-Source: AGHT+IFpbkRYmy3w9lRG8D5KuyTb3q2Dsms+5HEeyd1UyPK8HWgp605JSsDRYCSG3DUYYFw6c0VN8g==
X-Received: by 2002:a05:6000:2583:b0:431:53:1f49 with SMTP id ffacd0b85a97d-4324e4f69d4mr29982433f8f.41.1767019913901;
        Mon, 29 Dec 2025 06:51:53 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1af20sm59449884f8f.2.2025.12.29.06.51.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 06:51:53 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 02/11] c-ares: upgrade 1.34.5 -> 1.34.6
Date: Mon, 29 Dec 2025 15:51:43 +0100
Message-ID: <20251229145152.489068-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229145152.489068-1-skandigraun@gmail.com>
References: <20251229145152.489068-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 14:52:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122981

From: Jason Schonberg <schonm@gmail.com>

Drop memory leak patch which has already been included in this new version.

The new version also includes a fix for CVE 2025-62408.

Changelog: https://github.com/c-ares/c-ares/releases/tag/v1.34.6

Signed-off-by: Jason Schonberg <schonm@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 996768e0800a008e06d6c8d305f443198d4df847)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../c-ares/0001-ares_uri-memory-leak.patch    | 21 -------------------
 .../{c-ares_1.34.5.bb => c-ares_1.34.6.bb}    |  3 +--
 2 files changed, 1 insertion(+), 23 deletions(-)
 delete mode 100644 meta-oe/recipes-support/c-ares/c-ares/0001-ares_uri-memory-leak.patch
 rename meta-oe/recipes-support/c-ares/{c-ares_1.34.5.bb => c-ares_1.34.6.bb} (87%)

diff --git a/meta-oe/recipes-support/c-ares/c-ares/0001-ares_uri-memory-leak.patch b/meta-oe/recipes-support/c-ares/c-ares/0001-ares_uri-memory-leak.patch
deleted file mode 100644
index 4d08651be1..0000000000
--- a/meta-oe/recipes-support/c-ares/c-ares/0001-ares_uri-memory-leak.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-fix memory leak in ares_uri (#1012)
-Dynamic memory, referenced by 'outpath', is allocated at ares_uri.c:527
-by calling function 'ares_buf_create' and lost at ares_uri.c:536.
-
-Signed-off-by: Felix The Cat (@F3lixTheCat)
-
---
-
-Upstream-Status: Backport [https://github.com/c-ares/c-ares/commit/ee2a1c3eff3c8164b09123005f4b49c571788b59]
-
---- a/src/lib/util/ares_uri.c	2025-08-10 15:59:17.501710307 -0400
-+++ b/src/lib/util/ares_uri.c	2025-08-10 16:00:35.867494819 -0400
-@@ -533,7 +533,7 @@
-   status = ares_buf_split_str_array(inpath, (const unsigned char *)"/", 1,
-                                     ARES_BUF_SPLIT_TRIM, 0, &arr);
-   if (status != ARES_SUCCESS) {
--    return NULL;
-+    goto done;
-   }
- 
-   for (i = 0; i < (ares_ssize_t)ares_array_len(arr); i++) {
diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.34.5.bb b/meta-oe/recipes-support/c-ares/c-ares_1.34.6.bb
similarity index 87%
rename from meta-oe/recipes-support/c-ares/c-ares_1.34.5.bb
rename to meta-oe/recipes-support/c-ares/c-ares_1.34.6.bb
index b434886311..c9c54a9fa0 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.34.5.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.34.6.bb
@@ -6,9 +6,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=d3e72a10e08191f2ca1be3f3228d78f3"
 
 SRC_URI = "https://github.com/c-ares/c-ares/releases/download/v${PV}/${BPN}-${PV}.tar.gz \
-           file://0001-ares_uri-memory-leak.patch \
            file://run-ptest"
-SRC_URI[sha256sum] = "7d935790e9af081c25c495fd13c2cfcda4792983418e96358ef6e7320ee06346"
+SRC_URI[sha256sum] = "912dd7cc3b3e8a79c52fd7fb9c0f4ecf0aaa73e45efda880266a2d6e26b84ef5"
 
 PACKAGECONFIG ?= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 PACKAGECONFIG[manpages] = ""


Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CD54CCA476
	for <webhook@archiver.kernel.org>; Sat, 11 Oct 2025 14:08:03 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.468.1760191674901470815
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Oct 2025 07:07:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dhkbCkCk;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-634b774f135so4844057a12.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Oct 2025 07:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760191673; x=1760796473; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=J6Z7vpxizd5xwHygqeF0nQUKB6oX36SQxbl4CiaNApM=;
        b=dhkbCkCk/L9RG0+se23aNghx+0lDb4f4qHAD330IbcRsadgdiRsBzQ+C6AeOB/RBbE
         ZZb1r2wu4WH2MWguuiL/RJXvfbAV6dPVVp9613vOlon/NSaWEsBLLwaSwEfGBB+2rMym
         vSUUY2Jc+xbOETAZIqj5+cUxZu1zf9Hft9iCCQhnviRGjGMUaKdWH5JihtKxVgvBHj9x
         3tkEd4yRy0/V9nIN0W5G/srmRke34jREhggz/uH8/mvEIkZNmwUIoHv65hg6X9BvpAPI
         MaucAuJT4C4S7dW9KYGJu4DjUs9C3hMOMWdjA3riAJIufY4kxp+rJu4rq57eBet9gd4B
         VoVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760191673; x=1760796473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J6Z7vpxizd5xwHygqeF0nQUKB6oX36SQxbl4CiaNApM=;
        b=iwWy1Pgnyz9/hMolMSqbMJWzspSH0tdCTXHts/JFRp5mtvvibi9P1qrkyuyD0oRyix
         xPzqtBm1GyA30hsX5u0Sj5OpbSJo39uL3jdRQNBmWDLXKNCIyFXloLjFMzPWDsFJTg2Q
         +jhTxmY0EUA8YkAdLhoYtLiZC/PZ4IBSPnUbRU/pxPclWknMhibasejpxbrppcb2IfrM
         TWB7LvmXLMY8GlmgfCupwI6TpM22zetqcJqqWp/GM10Odihg5zQDTQiJ3XdHC5nRE+RI
         2ciAEX8eVv98auGUvzfxYmKRGHJ2KMAehiSgnldIhdI9kkC04vJExk3opaPKBz5VCh9e
         qRmA==
X-Gm-Message-State: AOJu0Yxp/AXrS1U27XEn37sx43zpYbDf8yzpNXqvgfSMkfE8RCv9H3nv
	2TjgDlL8CCaB+AzUzj0/uYOPS5zfSyNm1cYMYbKuivnau7zoG1dDv19wGbvv0A==
X-Gm-Gg: ASbGncuGz9eTxRkYxmdVylRxIYlWe+0dnVrRhbrqaxvsRqj9BIXV1c9tko0E/UezGli
	UmbA46jNUtlNP4gXUjc7qPw2MH2UL+Gs39HLCuV1LaJdXUoBmc5F8TWWpmyNnmqju5C7Ec/qjyk
	MlFwSGgUrYX1n6WTwD1NI9tw5YmhG3iKoWuIvLm5pTDiSnPLX0Gzs3EBPHhyLAbI1vg9RBb3D6O
	SBTANJihBwsV1Zhg36NEfHl8lLVFdLGNffKPi+lf9Qxh3ekBgfMgfIfWRBd/5YKBO8MN/ZzJbxy
	Z9GgCvaLO+pxXViLGbli1Ti8tXaQKcPVlvODpzrytaxy4jU9gitYwYXBNVYDQoKH72yIlJxUhM0
	V/x7NOseXp1B7OUX7Js3caS4yV/D5aiKQmHMnjcCR6/m5uUegXw==
X-Google-Smtp-Source: AGHT+IHIAp2Paiphyu+z5iF4nRvcejuLLQEdY3DMme2buSwmoVhZil0j3XOmEPpWcIinLl6SjfmfZQ==
X-Received: by 2002:a05:6402:2712:b0:639:710b:6957 with SMTP id 4fb4d7f45d1cf-639d5c502c1mr14619987a12.27.1760191673055;
        Sat, 11 Oct 2025 07:07:53 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a52b0f358sm4826399a12.10.2025.10.11.07.07.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 07:07:51 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH] freerdp: Upgrade 2.11.2 -> 2.11.7
Date: Sat, 11 Oct 2025 16:07:50 +0200
Message-ID: <20251011140750.2629987-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Oct 2025 14:08:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120496

From: Khem Raj <raj.khem@gmail.com>

Partially backport a fix to build with gcc-14

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 4b14dacf555167e792a469fb6de7b35c0b6a884a)

This bugfix update also contains fixes for the following vulnerabilities:

CVE-2024-22211, CVE-2024-32039, CVE-2024-32040, CVE-2024-32041,
CVE-2024-32458, CVE-2024-32459, CVE-2024-32460

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../0001-Fixed-compilation-warnings.patch     | 27 +++++++++++++++++++
 .../{freerdp_2.11.2.bb => freerdp_2.11.7.bb}  |  3 ++-
 2 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/0001-Fixed-compilation-warnings.patch
 rename meta-oe/recipes-support/freerdp/{freerdp_2.11.2.bb => freerdp_2.11.7.bb} (96%)

diff --git a/meta-oe/recipes-support/freerdp/freerdp/0001-Fixed-compilation-warnings.patch b/meta-oe/recipes-support/freerdp/freerdp/0001-Fixed-compilation-warnings.patch
new file mode 100644
index 0000000000..7fae2703f8
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp/0001-Fixed-compilation-warnings.patch
@@ -0,0 +1,27 @@
+From 75fa1fa5bd5ef2350390564245fd0984209ac092 Mon Sep 17 00:00:00 2001
+From: akallabeth <akallabeth@posteo.net>
+Date: Mon, 4 Jul 2022 14:34:46 +0200
+Subject: [PATCH] Fixed compilation warnings
+
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/2da280b8a1748052b70b3f5a1ef0d8e932c33adc]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ client/X11/xf_graphics.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/client/X11/xf_graphics.c b/client/X11/xf_graphics.c
+index 5aa1fd48b..fe81e0ed9 100644
+--- a/client/X11/xf_graphics.c
++++ b/client/X11/xf_graphics.c
+@@ -438,7 +438,7 @@ static BOOL xf_Pointer_New(rdpContext* context, rdpPointer* pointer)
+ 
+ #endif
+ fail:
+-	WLog_DBG(TAG, "%s: %ld", __func__, rc ? pointer : -1);
++	WLog_DBG(TAG, "%s: %p", __func__, rc ? pointer : NULL);
+ 	return rc;
+ }
+ 
+-- 
+2.45.0
+
diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.11.2.bb b/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
similarity index 96%
rename from meta-oe/recipes-support/freerdp/freerdp_2.11.2.bb
rename to meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
index 8de0e39ad7..37a28bfecf 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.11.2.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
@@ -13,9 +13,10 @@ inherit pkgconfig cmake gitpkgv
 PE = "1"
 PKGV = "${GITPKGVTAG}"
 
-SRCREV = "a38c1be9eee39a9bc22b511fffe96e63fdf8ebe7"
+SRCREV = "7f6cc93c21d7f0faad6daacca06f494f29ce882c"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=stable-2.0;protocol=https \
            file://winpr-makecert-Build-with-install-RPATH.patch \
+           file://0001-Fixed-compilation-warnings.patch \
            file://0001-Fix-const-qualifier-error.patch \
            file://0002-Do-not-install-tools-a-CMake-targets.patch \
            "


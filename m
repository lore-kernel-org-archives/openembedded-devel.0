Return-Path: <toertel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41352C433F5
	for <webhook@archiver.kernel.org>; Thu, 10 Feb 2022 18:45:03 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web12.14701.1644518702391232373
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Feb 2022 10:45:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fRFegDai;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: toertel@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id cn6so12471400edb.5
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Feb 2022 10:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z2HKtFd9Z+8gs352tGa5QWjBEuIY6v/QvgNApIyq15A=;
        b=fRFegDaiqVfZlYZsgFXf0aX19iKTK7qGBVvh9KPVar1BHkdArB+2ICcSx11Mit5Jvx
         RNRjzGFWvC9SIwksPUe+a1QfGsicqzRsaUPIhBoy4OqqRli2ZpiJY8V/Mge5VWm59qn8
         i1x56JitbwCzI8ZMCuEkcPdn8hPAhODzocFnO2dxA+vPq0/uGDM2F1qwQ5JiejlEL1XP
         fC8lni9YUZpd1NuqP+l8qKNR4VDBa43mZ3B0qSo6Td4FLAMEx4JViVPbT0UKghXbJWb+
         a8Q/jpdihTrvkr51WDLn4Z0cJth1Owjh/P8HbFJvQUD3GVf09/vpCWupYQ3JahghzVl+
         5MaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z2HKtFd9Z+8gs352tGa5QWjBEuIY6v/QvgNApIyq15A=;
        b=US8MAqYhy/uXQyojm1MJbZU4vODaxyXzO8rCw4jLCwVc054LxcdeAAVEIyeHgp9IF0
         lWuc257oWM2BkAV6r7qqrIJp1IdNK3cjALLHafB1ocWs2ANmcCw0bZMia/W/v5gpAvZO
         NlxusgWDUVGA1PR0W8TKkmWo/WFfkqylrz5kkxUGkyBqhUqg0VYvvXJDdOJ9hvIz5EZB
         NFcPXGV9/tnV+buVbQSMDjm4fuFUNxGY4tea55XQ9m9AZ5WFybRfuG6LfwsYapbOGxg0
         jIY0AQ+6uuToAW20MDc64osIncKxW7JhpNED8q1ubewSSzVxgp31DA/JrOnNITo8E1m1
         HXiw==
X-Gm-Message-State: AOAM5312dDmuU00LVXqKwEvdExYcJ+/iAhWOUyTyUQdlGhRKZJi6gHbF
	fEeluW+VcdRHhor2LBqzVCSjfC2DaDA=
X-Google-Smtp-Source: 
 ABdhPJx/NzQ82uXlwD7tYpTNOK4zQXkoGy/FCekRmUPwhp8Y1o+Peh2IASOcJP3GMJAy5LpOwj1b6w==
X-Received: by 2002:a05:6402:2993:: with SMTP id
 eq19mr9625244edb.233.1644518700297;
        Thu, 10 Feb 2022 10:45:00 -0800 (PST)
Received: from gigabyte.fritz.box
 (p200300cfaf2c770035492c6e3294d749.dip0.t-ipconnect.de.
 [2003:cf:af2c:7700:3549:2c6e:3294:d749])
        by smtp.gmail.com with ESMTPSA id
 q4sm7264276ejb.109.2022.02.10.10.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Feb 2022 10:44:59 -0800 (PST)
From: Mark Jonas <toertel@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Mark Jonas <toertel@gmail.com>
Subject: [meta-networkig][PATCH] mbedtls: Upgrade to 2.28.0
Date: Thu, 10 Feb 2022 19:44:56 +0100
Message-Id: <20220210184456.2053637-1-toertel@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Feb 2022 18:45:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95293

Mbed TLS 2.28 is a long-time support branch. It will be supported with
bug-fixes and security fixes until end of 2024.

https://github.com/ARMmbed/mbedtls/releases/tag/v2.28.0

Signed-off-by: Mark Jonas <toertel@gmail.com>
---
 ...sl_tls-Increase-size-of-padbuf-to-64.patch | 34 -------------------
 .../{mbedtls_2.26.0.bb => mbedtls_2.28.0.bb}  |  5 ++-
 2 files changed, 2 insertions(+), 37 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-ssl_tls-Increase-size-of-padbuf-to-64.patch
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_2.26.0.bb => mbedtls_2.28.0.bb} (92%)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-ssl_tls-Increase-size-of-padbuf-to-64.patch b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-ssl_tls-Increase-size-of-padbuf-to-64.patch
deleted file mode 100644
index f3ba04f51..000000000
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-ssl_tls-Increase-size-of-padbuf-to-64.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From c3d7321d59e959b357a7d3d69782d9105f3d04aa Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 1 Mar 2021 21:04:57 -0800
-Subject: [PATCH] ssl_tls: Increase size of padbuf to 64
-
-This fixes warnings with gcc11
-
-git/library/ssl_tls.c: In function 'ssl_calc_finished_tls_sha384':
-git/library/ssl_tls.c:3267:5: error: 'mbedtls_sha512_finish_ret' accessing 64 bytes in a region of size 48 [-Werror=stringop-overflow=]
- 3267 |     finish( &sha512, padbuf );
-      |     ^~~~~~~~~~~~~~~~~~~~~~~~~
-git/library/ssl_tls.c:3267:5: note: referencing argument 2 of type 'unsigned char *'
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- library/ssl_tls.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/library/ssl_tls.c b/library/ssl_tls.c
-index a1a5859f0..4c98a4104 100644
---- a/library/ssl_tls.c
-+++ b/library/ssl_tls.c
-@@ -3205,7 +3205,7 @@ static void ssl_calc_finished_tls_sha384(
- {
-     int len = 12;
-     const char *sender;
--    unsigned char padbuf[48];
-+    unsigned char padbuf[64];
- #if defined(MBEDTLS_USE_PSA_CRYPTO)
-     size_t hash_size;
-     psa_hash_operation_t sha384_psa = PSA_HASH_OPERATION_INIT;
--- 
-2.30.1
-
diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.26.0.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.0.bb
similarity index 92%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_2.26.0.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.0.bb
index b62ed04ce..d4a9c7bf8 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.26.0.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.0.bb
@@ -23,9 +23,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SECTION = "libs"
 
 S = "${WORKDIR}/git"
-SRCREV = "e483a77c85e1f9c1dd2eb1c5a8f552d2617fe400"
-SRC_URI = "git://github.com/ARMmbed/mbedtls.git;protocol=https;branch=development"
-SRC_URI += "file://0001-ssl_tls-Increase-size-of-padbuf-to-64.patch"
+SRCREV = "8b3f26a5ac38d4fdccbc5c5366229f3e01dafcc0"
+SRC_URI = "git://github.com/ARMmbed/mbedtls.git;protocol=https;branch=mbedtls-2.28"
 
 inherit cmake
 
-- 
2.25.1



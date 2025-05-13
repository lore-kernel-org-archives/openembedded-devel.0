Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D506AC3ABDC
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 20:04:14 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web10.85722.1747166649974623103
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 May 2025 13:04:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OJY482l2;
 spf=pass (domain: gmail.com, ip: 209.85.219.171, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e732386e4b7so6154451276.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 May 2025 13:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747166649; x=1747771449; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1QRBPWPYY/w/aX8pVZpeu7H+PD8EujJNetIyopyhj7k=;
        b=OJY482l2tO8qIBChZgVEju1EZDwggZxxcSKCLOjyVlkt8iGKjJ0wW4Da4JWTZph68C
         6ktbIhp9BEY4ifgvmyz/mZH2i/HfN36mFxgtxOAD9CzH0fQSeb7nmf2KwTDKMTAJoGiA
         lslLfbn2o/2YwYhNXaWnzJE0hdThkXdiQYBx/cB+loBm+2DDVeo9T4HvsTGkllifEDVe
         Sd2VGQxqOtx4YVJBvKxO2f/fDY41aNmvnyX8gd1H7llhJqgg9VPuURdM9wi1upS0nzAb
         Yo8jH20S6rZzcBD4O4KiMku2N+Qg9LfTrF2/e9oe+b7faRT5Mjc1gagB38PyZxK2rxrI
         NZDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747166649; x=1747771449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1QRBPWPYY/w/aX8pVZpeu7H+PD8EujJNetIyopyhj7k=;
        b=hP0V+5BOBpFngpGonbxiw2z0BqGcxR087V7bccFdsxEwYA7/MZwzD8z3KxBX3cGgpW
         8DxCmPqKd6xj9G8mFlJ6iwwJNtsaDOMt2GVzSnxuyt/3esIJA/vKdDKKODu9eNIRTgBj
         z8b0Fqsu+ozfOlILX+MfU5QZ1V6Gn4i5u1Hb6mf6gXw0CcQEE4ue+ayLVMEu4QekzWRB
         gionNEk+OAAjkLGVzGy14VsQuF5SBxByfFrh3CyTqbET1lhHuJgpjREGM5wshZlAI0KL
         xfihJYs5RAE5n+TzOI3jqNEN2Th1/8SyppN2yusyab4IBw1P0FSiL1wuKoLfwsg8yFZ5
         g8Ug==
X-Gm-Message-State: AOJu0YwG4Kiew7sMCOGTsSRY6SCyaYkpf5BxeMfzYhdedLcTBL08ia6b
	Of8CXZfD0pZt2S18J28l0/1AZH/y3ra4o7rWAeuseL+pULcy8EUCTpTDf8o6
X-Gm-Gg: ASbGncsRt8h3n6NViqD76Eu6LR2B8SU1EX6bqJd56nMcwoNnu55xy+aQ7XJao7rfIaS
	0xSqh4To2wAvNX+DVsbhRAe8BxtpSh/Hw9BHMbNRWAELzKXQ2UuS1ew97knA1zug2Ag5lMU8Tep
	K4lH+JrTXBHkP0ISJBuULp9zNzJ88DiQu3HsbEl2uyrEtdGFMKQzqY7I285Rw1DXzEHaEn0BX+i
	/HsGFQpWC40KRE+ziZ/ElAaYxmwRo4Q5+whF5unwSo7LWQS3JYyoZ3w01g2GzpbSdhvxBMrX8D2
	i+gqX+LFcEYYTUJddFs4YK8rC8Z1JzvYuRDnuS+HwYXZGuVfPhUj6uK4x3qW9zQuqg==
X-Google-Smtp-Source: AGHT+IEtJj35C//MKpXYTn8KxP83lIRxwcdYfoj9qGcMaefkLXYjar5kkOXKCKZdWTQo5s8LyQitXQ==
X-Received: by 2002:a05:6902:e0f:b0:e7b:2ff5:6bb8 with SMTP id 3f1490d57ef6-e7b3d5e678dmr875896276.43.1747166649013;
        Tue, 13 May 2025 13:04:09 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:6ade:98e4:ba03:461d])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e7ab5fb741asm1513944276.21.2025.05.13.13.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 13:04:08 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][walnascar][PATCH 4/5] php: upgrade 8.4.5 -> 8.4.6
Date: Tue, 13 May 2025 14:04:05 -0600
Message-ID: <20250513200406.26830-4-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250513200406.26830-1-akuster808@gmail.com>
References: <20250513200406.26830-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 May 2025 20:04:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117404

From: Wang Mingyu <wangmy@fujitsu.com>

0003-iconv-fix-detection.patch
refreshed for 8.4.6

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 250084b15e7b7bd6a4d9faeb3d1db6551504830a)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../php/php/0003-iconv-fix-detection.patch            | 11 ++++-------
 .../php/{php_8.4.5.bb => php_8.4.6.bb}                |  2 +-
 2 files changed, 5 insertions(+), 8 deletions(-)
 rename meta-oe/recipes-devtools/php/{php_8.4.5.bb => php_8.4.6.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php/0003-iconv-fix-detection.patch b/meta-oe/recipes-devtools/php/php/0003-iconv-fix-detection.patch
index 46505cd329..745bc2140d 100644
--- a/meta-oe/recipes-devtools/php/php/0003-iconv-fix-detection.patch
+++ b/meta-oe/recipes-devtools/php/php/0003-iconv-fix-detection.patch
@@ -1,7 +1,7 @@
-From 35ac74fce1a60025f8d126783b8aa7014eefdf53 Mon Sep 17 00:00:00 2001
+From d9fc6b314cefe010a0deb6e591719cfb0ff226a5 Mon Sep 17 00:00:00 2001
 From: Claude Bing <cbing@cybernetics.com>
 Date: Tue, 9 Nov 2021 13:10:33 -0500
-Subject: [PATCH 3/5] iconv: fix detection
+Subject: [PATCH] iconv: fix detection
 
 Upstream-Status: Pending
 
@@ -20,10 +20,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/build/php.m4 b/build/php.m4
-index e45b22b76..1bd3ccceb 100644
+index d8a5cbf0..aee21924 100644
 --- a/build/php.m4
 +++ b/build/php.m4
-@@ -1820,7 +1820,8 @@ AC_DEFUN([PHP_SETUP_ICONV], [
+@@ -1829,7 +1829,8 @@ AC_DEFUN([PHP_SETUP_ICONV], [
      [Define to 1 if you have the 'libiconv' function.])
  
    dnl Check libc first if no path is provided in --with-iconv.
@@ -33,6 +33,3 @@ index e45b22b76..1bd3ccceb 100644
      dnl Reset LIBS temporarily as it may have already been included -liconv in.
      LIBS_save=$LIBS
      LIBS=
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-devtools/php/php_8.4.5.bb b/meta-oe/recipes-devtools/php/php_8.4.6.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.4.5.bb
rename to meta-oe/recipes-devtools/php/php_8.4.6.bb
index cf4b756b85..5629a3dd3d 100644
--- a/meta-oe/recipes-devtools/php/php_8.4.5.bb
+++ b/meta-oe/recipes-devtools/php/php_8.4.6.bb
@@ -29,7 +29,7 @@ SRC_URI:append:class-target = " \
 
 S = "${WORKDIR}/php-${PV}"
 
-SRC_URI[sha256sum] = "9378c78887d0cd7462fc5c17f2de30c852f20f79d28795e2573fe3250d39436e"
+SRC_URI[sha256sum] = "9cf2734509b603f6589617ab52a9712a03e0fe059951cddd2d4623df4bf7c6c6"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_PHP"
 CVE_STATUS_PHP[status] = "fixed-version: The name of this product is exactly the same as github.com/emlog/emlog. CVE can be safely ignored."
-- 
2.43.0



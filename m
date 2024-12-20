Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E364E7718A
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 07:43:00 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.147802.1734680573971796410
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Dec 2024 23:42:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=ZOWl8n85;
 spf=pass (domain: mvista.com, ip: 209.85.210.178, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-725f4025e25so1345585b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Dec 2024 23:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1734680573; x=1735285373; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fsVchWNWSYwBp3z7os3KP2XwolBCmT/0ybynvVsviaw=;
        b=ZOWl8n85X6z/sRuxvr4XiR74EkBki17f9xX3PAndUw7El1bcrdhHpWcOdimkofiAzk
         nKd45MDEsIphryC2KRQ9TO6R9hA39pmJOQdt9Vxr0WI7mLGxVwQysd2kbtKoK2mI/edV
         xpnIiB8pn4M/nce/L19i/8iJVnMpBQqIPrpwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734680573; x=1735285373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fsVchWNWSYwBp3z7os3KP2XwolBCmT/0ybynvVsviaw=;
        b=vhOUCQc4FXJVyzU/mIo1l4RXFP2kvPV7RqP+wTXZlfaQVNw1UB3kCppuyYkU36cl79
         TIrkTO8frIZnnS9+i8exaGut4P+Rc7HRBL8U59SWX3naF4Y8/EFHVxrZJgKJRxmysZdZ
         1rwnVM4ZnkW00AYOAD/halis2szlKQXAtI+/CF/YxFkhtoGXw96uxn2nWYR0mwjXfa0b
         PUk8kw2o1rZR0khdz8sDsLV16Jpit7G+wBKLzzhkJy94H0O6IQUnVdV2H/m1fZ5Ud/Zo
         9zuA+EsIkRJeiGP+RHt9AwQmZz+Qg4vNygXMgP9bp4uxvnh1Ms3BGQfN9o0FjOMCR+dE
         lo3Q==
X-Gm-Message-State: AOJu0YxjZlQ7CvVoHZtkoQevL1emRj/9pQoVYrbS5oujQKt4SCeZqzYR
	GbKN41oRi0Dre8su98QlpImR3yfrBUWyPp7wMCnMQwCN8xzdBMb82ksXiYDNgUj88B17kZAG0RF
	Nqc0=
X-Gm-Gg: ASbGncuV+bgAUlOTB15bFBeAauYMc1sz+bQb85B06OmCgEfSMYVkagoqvOTWwcNevqR
	XIi5pcY7VU8YptL0aNxAFPBPGLvYW82EgUzd3D0DwtjXBjybfwGDQzfd9IYk9nqFJ5FnVrWtrQf
	R9k4m+Uhx2fLqdc+kOBsgxTwO6Jp8WiVLcW8J1joKMcd10VGKyKb6WVwsRej6vHveCyOMW2N1of
	QX0b9iOjEmL5vCFs1hN71Ze0uPPPNqff8Z+dsnlJu0hG9y3S6f2JLbMtXr/UIQkaUiMiS0=
X-Google-Smtp-Source: AGHT+IH3bOGTGD1TTF9BFEtkcwOJr7D7VAlufMtCjsAXfspthVsr2MVzAr5bqS3VsFSgx1FOBmJJhA==
X-Received: by 2002:a05:6a00:414a:b0:727:3fd5:b530 with SMTP id d2e1a72fcca58-72abde0f264mr2381054b3a.15.1734680572817;
        Thu, 19 Dec 2024 23:42:52 -0800 (PST)
Received: from MVIN00020.mvista.com ([2401:4900:882f:7af7:716c:47cc:4544:7388])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dc5absm2571648b3a.127.2024.12.19.23.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 23:42:52 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-oe][master][PATCH] php: upgrade 8.2.20 -> 8.2.26
Date: Fri, 20 Dec 2024 13:12:41 +0530
Message-Id: <20241220074241.1346260-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Dec 2024 07:43:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114431

From: Vijay Anusuri <vanusuri@mvista.com>

Includes fix for CVE-2024-8925, CVE-2024-8926, CVE-2024-8927,
CVE-2024-9026, CVE-2024-8929, CVE-2024-11236, CVE-2024-11234 and
CVE-2024-11233

Changelog:
https://www.php.net/ChangeLog-8.php#8.2.26

Refresh 0001-ext-opcache-config.m4-enable-opcache.patch to new version

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../php/0001-ext-opcache-config.m4-enable-opcache.patch    | 7 +++++--
 .../recipes-devtools/php/{php_8.2.20.bb => php_8.2.26.bb}  | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/php/{php_8.2.20.bb => php_8.2.26.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php/0001-ext-opcache-config.m4-enable-opcache.patch b/meta-oe/recipes-devtools/php/php/0001-ext-opcache-config.m4-enable-opcache.patch
index c743697469..783717a185 100644
--- a/meta-oe/recipes-devtools/php/php/0001-ext-opcache-config.m4-enable-opcache.patch
+++ b/meta-oe/recipes-devtools/php/php/0001-ext-opcache-config.m4-enable-opcache.patch
@@ -23,6 +23,9 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 
 update patch to version 8.2.18
 Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+
+update patch to version 8.2.26
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
 ---
  ext/opcache/config.m4 | 204 ++----------------------------------------
  1 file changed, 8 insertions(+), 196 deletions(-)
@@ -247,8 +250,8 @@ index 6bf07ad3..5d645b86 100644
 +  have_shm_mmap_posix=yes
 +  PHP_CHECK_LIBRARY(rt, shm_unlink, [PHP_ADD_LIBRARY(rt,1,OPCACHE_SHARED_LIBADD)])
  
-   PHP_NEW_EXTENSION(opcache,
- 	ZendAccelerator.c \
+   AX_CHECK_COMPILE_FLAG([-Wno-implicit-fallthrough],
+     [PHP_OPCACHE_CFLAGS="$PHP_OPCACHE_CFLAGS -Wno-implicit-fallthrough"],,
 -- 
 2.40.0
 
diff --git a/meta-oe/recipes-devtools/php/php_8.2.20.bb b/meta-oe/recipes-devtools/php/php_8.2.26.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.2.20.bb
rename to meta-oe/recipes-devtools/php/php_8.2.26.bb
index f306b16931..f5e57ab36a 100644
--- a/meta-oe/recipes-devtools/php/php_8.2.20.bb
+++ b/meta-oe/recipes-devtools/php/php_8.2.26.bb
@@ -34,7 +34,7 @@ SRC_URI:append:class-target = " \
           "
 
 S = "${WORKDIR}/php-${PV}"
-SRC_URI[sha256sum] = "5dec6fa61c7b9c47aa1d76666be651f2642ed2bcf6cd8638c57e3571ce2aac61"
+SRC_URI[sha256sum] = "be57c347d451c905bcb4336832a864d9928dd0e20989b872705fea0ba6476c6b"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_PHP"
 CVE_STATUS_PHP[status] = "fixed-version: The name of this product is exactly the same as github.com/emlog/emlog. CVE can be safely ignored."
-- 
2.25.1



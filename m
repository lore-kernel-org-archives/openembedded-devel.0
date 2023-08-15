Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CC49C001E0
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 19:26:54 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.143263.1692127612775491101
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Aug 2023 12:26:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ClrAPc4b;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-686fc0d3c92so3879216b3a.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 15 Aug 2023 12:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692127612; x=1692732412;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iUfQ8Gj+ClczE85MlObdtFGFe+WqR7vx4pFePJo+Iik=;
        b=ClrAPc4bqgQPRNtxeZ/fBzGrO7Ad5eyDxVzqskHXva40LRY/fs5q25pXzMHVCd3/P1
         eBpfo81y9H3S4hBlpUv5fCxT53sgTfMhGW/yu0mY3Nr6sgqb2Zzx3eGHweXfE7N2dY29
         LDblxNzQZcX/0ZePxAc8uAOnDau11m+URVlA2QC54RKtX7rkIwf5btWToWdu7C++exC+
         YImO9J5c8XJKlo3G1FMGgpxFT8pBQFr7W/QBjJrBQi34Z4KEn5SpAey1eD1aQqUOV47G
         JEwYE4vm6Ekti5dV1tMow7of8KHgmKEe6p+jLf0edK+QycDTS5VDBdMFIaCvO/Qabcip
         /MVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692127612; x=1692732412;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iUfQ8Gj+ClczE85MlObdtFGFe+WqR7vx4pFePJo+Iik=;
        b=dbVfHsnQ5VJIcNtcTQtCzr2gD/IJurJ/OHx3fj3EjTMGia+y56k/3GgCfk4I0Puy3p
         8D2S0zlckdgSx7bMWcAjv32w8GDj2EDVS71yr00C3pd/j95z+9nd4QK8MsLPgBoQUI9V
         4KHtsZsZRrIJP4oGEh642eWkc8ip/yRUgindVAen0kXCJHMfEd7EV/VMAOtITEa8ZNO/
         19X03Fq7QQIM4T3DYfhzMsbqkQHVJ/3LKFVPO8h8Q+xZ0cEWSSGGt+QmdlJpX1FS15pz
         Ke0V4S7U5N6IjfTBZIXAtLSYFvUDegfWGzWRiT76m4h/psMZiA+0nVb6tuLxURjtprYV
         vnjg==
X-Gm-Message-State: AOJu0YwQJwHCDfIfjHZNcGkj/xKeDQL4puww25cPvkKqGxDaX0LGEClw
	EK1k5HBfAQJY+RgG+n8QwlE3IHJbE4g=
X-Google-Smtp-Source: AGHT+IHjFRwXbNYjY6nOk7D2S5iJ8RU5Pgg0wrXEVbeEltxKOVV2cqDDF/jdIjKXY3M9TwyKmdHlrw==
X-Received: by 2002:a05:6a21:3d8a:b0:13f:8855:d5a0 with SMTP id bj10-20020a056a213d8a00b0013f8855d5a0mr11624559pzc.50.1692127611857;
        Tue, 15 Aug 2023 12:26:51 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::ed55])
        by smtp.gmail.com with ESMTPSA id bu29-20020a63295d000000b005501b24b1c9sm1849506pgb.62.2023.08.15.12.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 12:26:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Nicolas Marguet <nicolas.marguet@windriver.com>
Subject: [meta-oe][PATCH] librelp: Fix function prototypes in tests
Date: Tue, 15 Aug 2023 12:26:48 -0700
Message-ID: <20230815192648.3315835-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Aug 2023 19:26:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104366

Helps fix issues found with clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Nicolas Marguet <nicolas.marguet@windriver.com>
---
 .../0001-tests-Fix-callback-prototype.patch   | 49 +++++++++++++++++++
 .../rsyslog/librelp_1.11.0.bb                 |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta-oe/recipes-extended/rsyslog/librelp/0001-tests-Fix-callback-prototype.patch

diff --git a/meta-oe/recipes-extended/rsyslog/librelp/0001-tests-Fix-callback-prototype.patch b/meta-oe/recipes-extended/rsyslog/librelp/0001-tests-Fix-callback-prototype.patch
new file mode 100644
index 0000000000..ba081926e1
--- /dev/null
+++ b/meta-oe/recipes-extended/rsyslog/librelp/0001-tests-Fix-callback-prototype.patch
@@ -0,0 +1,49 @@
+From 2a7e26510cf9276b7e640ca8282cc1c5e46075d0 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 15 Aug 2023 11:59:40 -0700
+Subject: [PATCH] tests: Fix callback prototype
+
+clang errors about it
+
+| ../../git/tests/receive.c:71:34: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
+|    71 | hdlr_enable(int sig, void (*hdlr)())
+|       |                                  ^
+|       |                                   void
+| 1 error generated.
+
+Upstream-Status: Submitted [https://github.com/rsyslog/librelp/pull/260]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tests/receive.c | 2 +-
+ tests/send.c    | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/tests/receive.c b/tests/receive.c
+index f376cb4..c12e911 100644
+--- a/tests/receive.c
++++ b/tests/receive.c
+@@ -68,7 +68,7 @@ doSleep(int iSeconds, const int iuSeconds)
+ }
+ 
+ static void
+-hdlr_enable(int sig, void (*hdlr)())
++hdlr_enable(int sig, void (*hdlr)(const int))
+ {
+ 	struct sigaction sigAct;
+ 	memset(&sigAct, 0, sizeof (sigAct));
+diff --git a/tests/send.c b/tests/send.c
+index d7e90f0..1b1df4f 100644
+--- a/tests/send.c
++++ b/tests/send.c
+@@ -57,7 +57,7 @@ struct usrdata { /* used for testing user pointer pass-back */
+ struct usrdata *userdata = NULL;
+ 
+ static void
+-hdlr_enable(int sig, void (*hdlr)())
++hdlr_enable(int sig, void (*hdlr)(const int))
+ {
+ 	struct sigaction sigAct;
+ 	memset(&sigAct, 0, sizeof (sigAct));
+-- 
+2.41.0
+
diff --git a/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb b/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
index cbbc31b7d1..eebfece3f2 100644
--- a/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
@@ -8,6 +8,7 @@ DEPENDS = "gmp nettle libidn zlib gnutls openssl"
 
 SRC_URI = "git://github.com/rsyslog/librelp.git;protocol=https;branch=stable \
            file://0001-Fix-function-inline-errors-in-debug-optimization-Og.patch \
+           file://0001-tests-Fix-callback-prototype.patch \
            file://run-ptest \
 "
 
-- 
2.41.0



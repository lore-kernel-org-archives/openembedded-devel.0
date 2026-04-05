Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B73BE88D96
	for <webhook@archiver.kernel.org>; Sun,  5 Apr 2026 12:49:47 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34596.1775393380380411567
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Apr 2026 05:49:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Jlthf+z2;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c757a9251faso957699a12.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2026 05:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775393379; x=1775998179; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mUzaJAB7eAv47mYcHr5XLRdkmFVNOSR213DT0dJMN0A=;
        b=Jlthf+z2zAU/ydz1UJ6a/v8SJSQjYQSnKpvuSMd+gKM+veTHN7A9r0G+nT/HZ11PWc
         CiODQMcZxZ/W2Z1FJmubRhTpNnN0w83U57cvStydYK0eLujmdXgnlWp+oK5b+PUq9uXn
         sL4HOSrZp+PSvgjYStVM1UQxIA+qpCt2366mIm3JPr9Gi0nL2IW1eA8eG1Psm8di7zw0
         9c5UM9W5/3rSZBaz09PckEOsPUga4PDSDQDwK18t1kr1Is36DH66CBrNr30ZGlEzWiwN
         9uOPnZULFit5Xrcdm1ACFQd2ao0HYWn9z/P9fpfyW9tPL23c0fKjo4IxovWQBngv6CQj
         ccJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775393379; x=1775998179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mUzaJAB7eAv47mYcHr5XLRdkmFVNOSR213DT0dJMN0A=;
        b=ZIjkeNBWcHZZWmgaqpmh1n4M+mUUCFQFQebhAUfHUPsj09iowX99TXkxADQSe+/AVX
         SUKMdMM5WJ3Q1Suyh7BUK3RlDytfepRvcuw4am7vFNwFfKPE2LczS7sptcQFXmp/5YBs
         g7BRpNQHVYQiEWeI3HOkWo2OarWkpkTKcg2Hb6L9vMkA1qRqkJFQujxY3PQJ/3NJq4/x
         WLEim78ieZh/K1EzARHw7JtFjY7mnHe2vadlD1grCtogCZdIkPePjawwct/srOM3KkBT
         vpSmNRXEtTyBUewqCVPMYqLugNJrYRmfsad5KIN+aXcure9O7At9vwfeX6eKf/mTx+MP
         TOXw==
X-Gm-Message-State: AOJu0Yw3uBJihn3kD1zdEPWp23XBRkMLsuj+4BqBrf1LWKO7MWchTqT1
	l7lEgOmG7sS6aiLNZ6v9kKsS8wZOW8qqL+G6yQu0arskzh8+DiNokGxQ6pax65f88Sk=
X-Gm-Gg: AeBDietojMpI/2XD2LqM8qxXAKuZuLTcGoafNHMjGey71XLKZam+S+uBsqOeZzT1bMR
	XVT67UN9DmIj7EWfYhNGZa6j/cTyPiY8xCpYK79kW4WnfjV4cIWM+qSMxQFAe/6btIf8cNJpVcS
	Db/8q0URp6GllZQ45mTz+JFIMUxoJFwxVbfiSY1DUTfQT6evWtNjBYEUsQoZZB/QuHdeqH6niAt
	+73Bdc/fxaxTVe4AOOiZCcXJxCDbD08CxglgkVVGunlAF2hcW9YHaO22ja8yu+w8GC+s6F9uIKc
	L+aybCdYmVk0Urf6VLPQBGZs8hNHTBsrgk+BV43rjbS7KACbK8Xhl1ZafPb4yJjFTBPjPGhB4aC
	lrZAj9YD4Sa5E3bJIOENmQnz34x9AkjlNKQ5jlpyMHnm4pPYSirgN1rsbMMKt7Jr0cgUfO/WOQ0
	O6M0P13MUzvWkTYkeycyP60A31T9JOrZ932q4=
X-Received: by 2002:a17:903:384c:b0:2b2:65db:8c5f with SMTP id d9443c01a7336-2b28176a464mr92488295ad.27.1775393379543;
        Sun, 05 Apr 2026 05:49:39 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27477736dsm106828025ad.24.2026.04.05.05.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 05:49:39 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][whinlatter][PATCH 5/14] wolfssl: patch CVE-2026-3230
Date: Mon,  6 Apr 2026 00:49:07 +1200
Message-ID: <20260405124916.2881008-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260405124916.2881008-1-ankur.tyagi85@gmail.com>
References: <20260405124916.2881008-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2026 12:49:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126004

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-3230

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../wolfssl/files/CVE-2026-3230.patch         | 69 +++++++++++++++++++
 .../wolfssl/wolfssl_5.8.0.bb                  |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-3230.patch

diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-3230.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-3230.patch
new file mode 100644
index 0000000000..4d03dfdf75
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-3230.patch
@@ -0,0 +1,69 @@
+From 015a4cec9f19221c79dbbeef3a92cf297d633a65 Mon Sep 17 00:00:00 2001
+From: Juliusz Sosinowicz <juliusz@wolfssl.com>
+Date: Mon, 9 Feb 2026 17:14:24 +0100
+Subject: [PATCH] Add check for KeyShare in ServerHello
+
+Fixes ZD21171
+
+CVE: CVE-2026-3230
+Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/f798a585d9dc57f7c42a90e693d8f0aa8a241e52]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/tls.c          | 2 ++
+ src/tls13.c        | 3 ++-
+ tests/api.c        | 2 +-
+ wolfssl/internal.h | 1 +
+ 4 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/src/tls.c b/src/tls.c
+index 4f57ea938..8552e8daf 100644
+--- a/src/tls.c
++++ b/src/tls.c
+@@ -9774,6 +9774,8 @@ int TLSX_KeyShare_Parse(WOLFSSL* ssl, const byte* input, word16 length,
+         if (length < OPAQUE16_LEN)
+             return BUFFER_ERROR;
+ 
++        ssl->options.shSentKeyShare = 1;
++
+         /* The data is the named group the server wants to use. */
+         ato16(input, &group);
+ 
+diff --git a/src/tls13.c b/src/tls13.c
+index 6efe44640..538cde030 100644
+--- a/src/tls13.c
++++ b/src/tls13.c
+@@ -5590,7 +5590,8 @@ int DoTls13ServerHello(WOLFSSL* ssl, const byte* input, word32* inOutIdx,
+     #if defined(HAVE_SESSION_TICKET) || !defined(NO_PSK)
+             ssl->options.pskNegotiated == 0 &&
+     #endif
+-            ssl->session->namedGroup == 0) {
++            (ssl->session->namedGroup == 0 ||
++             ssl->options.shSentKeyShare == 0)) {
+             return EXT_MISSING;
+         }
+ 
+diff --git a/tests/api.c b/tests/api.c
+index 9dc92e84a..1abb7f836 100644
+--- a/tests/api.c
++++ b/tests/api.c
+@@ -64055,7 +64055,7 @@ static int test_TLSX_CA_NAMES_bad_extension(void)
+ 
+         ExpectIntEQ(wolfSSL_connect(ssl_c), -1);
+ #ifndef WOLFSSL_DISABLE_EARLY_SANITY_CHECKS
+-        ExpectIntEQ(wolfSSL_get_error(ssl_c, -1), WC_NO_ERR_TRACE(OUT_OF_ORDER_E));
++        ExpectIntEQ(wolfSSL_get_error(ssl_c, -1), WC_NO_ERR_TRACE(EXT_MISSING));
+ #else
+         ExpectIntEQ(wolfSSL_get_error(ssl_c, -1), WC_NO_ERR_TRACE(BUFFER_ERROR));
+ #endif
+diff --git a/wolfssl/internal.h b/wolfssl/internal.h
+index dd191fb1a..c89ab5931 100644
+--- a/wolfssl/internal.h
++++ b/wolfssl/internal.h
+@@ -5107,6 +5107,7 @@ struct Options {
+ #if defined(HAVE_DANE)
+     word16            useDANE:1;
+ #endif /* HAVE_DANE */
++    word16            shSentKeyShare:1;   /* SH sent with key share */
+     word16            disableRead:1;
+ #ifdef WOLFSSL_DTLS
+     byte              haveMcast;          /* using multicast ? */
diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
index 7c46c01ff0..bec2764ad1 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
@@ -33,6 +33,7 @@ SRC_URI = " \
     file://CVE-2026-3229-1.patch \
     file://CVE-2026-3229-2.patch \
     file://CVE-2026-3229-3.patch \
+    file://CVE-2026-3230.patch \
 "
 
 SRCREV = "b077c81eb635392e694ccedbab8b644297ec0285"


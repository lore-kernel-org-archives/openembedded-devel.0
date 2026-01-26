Return-Path: <frederikbraendstrup@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61E0DCF65DF
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 11:13:06 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17858.1769425984677569278
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jan 2026 03:13:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LIK9CSPT;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: frederikbraendstrup@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b8715a4d9fdso537686966b.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 03:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769425983; x=1770030783; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P2gvPklaBFeOGaG9/xrrKxNjeTYFkgchcYoLeEpIsOo=;
        b=LIK9CSPTNtyI4ND616y2xxtd/0Ip+ITFx3dkGPww8K0OmsEB4L7P0Zc5vMDrHJRebX
         YjjvyptI4GQF5iD8cYzBCSqLp/U5BNZOehqmDOjiZWzZObOgVQabau1UyddmJyEVLDLw
         AWVbPGahsC9kYukx5XsMyTrU995bpNUVawccfP95i+h1G6t4h2ucRoZx40L+IGug4PYl
         /xMJzKVzD/UvGKBcCbMX6SQXU7uYaWq/cDWi5DNxIRmPr2ERthIJMVmye+/coMHmo2hO
         BzKcF3HMGocaxuVJW61BSyyPxFprBuvpHaNEGAfR75pcH/KAjwtZ8s49mfYw/w+grNJa
         tA5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769425983; x=1770030783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P2gvPklaBFeOGaG9/xrrKxNjeTYFkgchcYoLeEpIsOo=;
        b=vQirrkTpVXjKm3O5IChB5MsGgvwslaB/ze+GdC5QDjGRB6N5qYH2bV1TelveW7hTKT
         XvrZE0a48/SJaAgqtLRqZpzuWKVsoycYNENat/w0rdNW47x2zBj1lLf2054cBnQJyctd
         uMIzErAUQkY3WccYDuU1HL10e+p7+nOt6K4mchFyTnbHLm3EdqIyus/CckiyVnWDqUGk
         eEL6yRta8SJLwd8SggFPiwctNt+K9hXAeJ+NFZDNhiV1LRXcYXVHIkPirloSfom5ApsW
         7s5u4RyigCGBenUYVL/coOw9lJVokte53TNDwjFfI1eQQ1x+cY15Il004nCymu0Do2o/
         MS8A==
X-Gm-Message-State: AOJu0YwDCm79EVtXjD9EYsFRtFQAg7WXmgo7mv3WY+KUozxzSyAJU17F
	EOZqLjCrObny4uvakYqLL1jxmmyOuAUoD5+qLwbOPxKw8TZHsGXujCy5FRbl/Vj/
X-Gm-Gg: AZuq6aJg6M5C87/CJBuNOIMICWDKZXoTRLFfZRDaI/koMH2qCzoUQGDVJysXk/8EbFF
	hU4HzFIC2jtRNvora9df9FzIL5yukvG2wgBFSRO/Rk33t2lcUZTX2P84SeiVbZLlhWrYy68ilZW
	UOXfQ7eJ1vwxNOVSwSb4HwoFk3z5FJABzzN7Qeyvc3bwGYbY8IEs0R7TWBR8fsxXFzxJkwJCEZW
	t9Sav9sPk74i/jxU/TjLNkm1dOl32YPQKYgprwnJY09w6EXMtGR/ETUeoalTF0idldxQ3TnmrEF
	CqwkTGrMxqv5sXK/QMTbwx9wMdqTYRDHs6a6SgHL+qc6Jz++2iwqkkOFpLNB6/9dHmOVGKEztj2
	RaBvKJctPoSC9K4ScUmO72jOWeYxD5G4FDodeumBLCGs9L3IVG/lXn+vsDj5iN1cRx4SZ41DCjF
	5KqCPcPXaMvVmZswRp/3YBZ61jPYkhvShP93d7lvNcIT5fViU1SQgQHoJG97gmSXhD
X-Received: by 2002:a17:906:7315:b0:b87:65c5:602f with SMTP id a640c23a62f3a-b8d2e714766mr279616066b.34.1769425982585;
        Mon, 26 Jan 2026 03:13:02 -0800 (PST)
Received: from ws.taila4487.ts.net (77.241.136.110.bredband.3.dk. [77.241.136.110])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6584b92b5efsm5104307a12.18.2026.01.26.03.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 03:13:02 -0800 (PST)
From: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
Subject: [meta-oe][PATCH v3] liboauth2: Add recipe at 2.2.0
Date: Mon, 26 Jan 2026 12:12:48 +0100
Message-ID: <20260126111248.640805-1-frederikbraendstrup@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260125102742.1827360-2-frederikbraendstrup@gmail.com>
References: <20260125102742.1827360-2-frederikbraendstrup@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 11:13:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123867

V3 adds fixes for building with clang

---
 ..._easy_setopt-takes-a-long-not-an-int.patch | 33 +++++++++++++++++++
 .../liboauth2/liboauth2_2.2.0.bb              | 23 +++++++++++++
 2 files changed, 56 insertions(+)
 create mode 100644 meta-oe/recipes-support/liboauth2/liboauth2/0001-fix-clang-curl_easy_setopt-takes-a-long-not-an-int.patch
 create mode 100644 meta-oe/recipes-support/liboauth2/liboauth2_2.2.0.bb

diff --git a/meta-oe/recipes-support/liboauth2/liboauth2/0001-fix-clang-curl_easy_setopt-takes-a-long-not-an-int.patch b/meta-oe/recipes-support/liboauth2/liboauth2/0001-fix-clang-curl_easy_setopt-takes-a-long-not-an-int.patch
new file mode 100644
index 0000000000..bdb4a0f108
--- /dev/null
+++ b/meta-oe/recipes-support/liboauth2/liboauth2/0001-fix-clang-curl_easy_setopt-takes-a-long-not-an-int.patch
@@ -0,0 +1,33 @@
+From a9f28a44b9b387ef28904e24ca05d28562fdcc45 Mon Sep 17 00:00:00 2001
+From: Frede Hoey Braendstrup <frede@vokalo.io>
+Date: Mon, 26 Jan 2026 11:07:24 +0100
+Subject: [PATCH] fix(clang): curl_easy_setopt takes a long not an int
+
+Signed-off-by: Frede Hoey Braendstrup <frede@vokalo.io>
+Upstream-status: Backport https://github.com/OpenIDC/liboauth2/pull/69
+---
+ src/http.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/http.c b/src/http.c
+index ab7a25a..bc242ed 100644
+--- a/src/http.c
++++ b/src/http.c
+@@ -1024,7 +1024,7 @@ bool oauth2_http_call(oauth2_log_t *log, const char *url, const char *data,
+ 	curl_easy_setopt(curl, CURLOPT_MAXREDIRS, 5L);
+ 
+ 	if (ctx)
+-		curl_easy_setopt(curl, CURLOPT_TIMEOUT, ctx->timeout);
++		curl_easy_setopt(curl, CURLOPT_TIMEOUT, (long)ctx->timeout);
+ 
+ 	curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION,
+ 			 oauth2_http_curl_buf_write);
+@@ -1092,7 +1092,7 @@ bool oauth2_http_call(oauth2_log_t *log, const char *url, const char *data,
+ 
+ 	if (data != NULL) {
+ 		curl_easy_setopt(curl, CURLOPT_POSTFIELDS, data);
+-		curl_easy_setopt(curl, CURLOPT_POST, 1);
++		curl_easy_setopt(curl, CURLOPT_POST, 1L);
+ 	}
+ 
+ 	if (ctx)
diff --git a/meta-oe/recipes-support/liboauth2/liboauth2_2.2.0.bb b/meta-oe/recipes-support/liboauth2/liboauth2_2.2.0.bb
new file mode 100644
index 0000000000..718208aa2e
--- /dev/null
+++ b/meta-oe/recipes-support/liboauth2/liboauth2_2.2.0.bb
@@ -0,0 +1,23 @@
+SUMMARY = "OAuth 2.x and OpenID Connect C library"
+HOMEPAGE = "https://github.com/OpenIDC/liboauth2"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
+
+SRC_URI = " \
+    git://github.com/OpenIDC/liboauth2;protocol=https;branch=master;tag=v${PV} \
+    file://0001-fix-clang-curl_easy_setopt-takes-a-long-not-an-int.patch \
+    "
+
+PV = "2.2.0"
+SRCREV = "12571b6d6568c2db7d5f080f60ecb55795c0db19"
+
+DEPENDS = "libpcre2 jansson curl openssl cjose"
+
+inherit pkgconfig autotools-brokensep
+
+PACKAGECONFIG ??= "memcache redis jq apache"
+PACKAGECONFIG[memcache] = "--with-memcache,--without-memcache,libmemcached"
+PACKAGECONFIG[redis] = "--with-redis,--without-redis,hiredis"
+PACKAGECONFIG[jq] = "--with-jq,--without-jq,jq"
+PACKAGECONFIG[apache] = "--with-apache,--without-apache,apache2"
+
-- 
2.52.0



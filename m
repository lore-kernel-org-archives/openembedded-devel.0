Return-Path: <frederikbraendstrup@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C65A5CF65E9
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 12:13:06 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18192.1769429584871469657
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jan 2026 04:13:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aC+bZcsr;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: frederikbraendstrup@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b8715a4d9fdso545172066b.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 04:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769429583; x=1770034383; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I75yzZlIntgcP/2XFe9KycIkdNySW6YvDClnLG2mi8o=;
        b=aC+bZcsrhnH22S3BWDhT2KzdxtTsq8PWZ5l5AmAOGoUBqZFF21NO5qTqvqA+qDC2VV
         Cg2ONmfiHeiyWz+Va6EDPM0BX8HSop8Q1trULnFV9F7pclYuoYdLkusRk1YroYInHHV3
         5gZHkBz2HLqRbBGGY2YdINm1FGXjOMOp7RRYwczUo1pSvPeXli4BrThwjIwFIzJFQz9t
         rWxrNBKj5jzkg0ecB78lEit++K0TlGq+V367Nzg8ca9x14lE9CSR8NFF6cF6tpdiWT4P
         X8t+nfc6jyQoUWxACExXK2RkkQFR5gy6szDmYlfuNRpseQxV0qR/VGwQcADK3NzphedP
         rCdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769429583; x=1770034383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I75yzZlIntgcP/2XFe9KycIkdNySW6YvDClnLG2mi8o=;
        b=V5vYx6Mk+WRcs1ato4zEIKKczkXJw7BcV+Nwjo00a5lUVm4FQYfg3d9W+FyU2lhlTj
         S1S9gihf9uPe9VVMFGKIFpvmapl56iqL+KLwvy+ZHSON/Ie7JMSYekNzcnbr1sBqnDCF
         XQrcOMorKVFRhiaR7Z70yuPua7qVZzLcnOAACZITPI4/dL4YhXXcKgmpUctT1Yd7dSMp
         C5knjk4k7DVZ2uhNLnzJHA3oDBu1apQhTg5LFzKxNut+nHB6neFGnSM40tL04SZt+keY
         LfpH9Vr08i0PB//L6Z08SlPvuYpl9TMbRwcfNYUjoczpYhBNjXFS6gwbmnY1GiOkNm8s
         tHvw==
X-Gm-Message-State: AOJu0YyrdLWe2ykbsID+ow656WHXY0V2IV/brLekYQfhluHz1Z4NHd8m
	n5x9NqvkhSXn88aWc91/c4ndlO1xDoNAvxzcgfTnQOaoFvM94RgN+LH5UMCFxjAH
X-Gm-Gg: AZuq6aL4BNkVspXlXMbNvX218GZQCkFqj3RNAGEsGhvVZE4Jvua7qCjIcY31SyWjgV/
	qZPT/+LKA96SC0Qbq/YKGCoroc4dzNpjhU6ajCl4BOkfEYZjKLT6iPPONjtMdsMvgCsaqMtmwlw
	K6K0lEVE0ffoBvQk28Ew/c52cfZls0Dwp4hkYajXOWX7E+YdNlW96v5NEPyb4tAYJGSRxrgN6ij
	fjKSThIFPQJxnjb1fxFjNmtHDH55Yuni/YeZ/pmIOHB6SufxPh92fj0SCAJOWKSTt7Ebx0YAAVv
	Rfinp//OpQ9vCBuF1Xdjuyie2i8ySiAcsmkTReJgBx6/pnEKF11aIXu+3oNrpaIao03Qk7toFvM
	r9heGfg2L7KsBdC7ZK5R7+INFXA8eDwBr/tXx/Fj/lov9y/PMO33KOvrFa7ebIdZrMjigxiOAoY
	VlMtMqSBKBuAIJ9tgKuqMDTVNXsbqgBlSeSRp3YJvz5R4MZhLJ58Y8PIg6AFOQKoKe
X-Received: by 2002:a17:907:3f0f:b0:b88:5c68:ece2 with SMTP id a640c23a62f3a-b8d20d838c7mr274532066b.22.1769429582924;
        Mon, 26 Jan 2026 04:13:02 -0800 (PST)
Received: from ws.taila4487.ts.net (77.241.136.110.bredband.3.dk. [77.241.136.110])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b6fc498sm622829266b.39.2026.01.26.04.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 04:13:02 -0800 (PST)
From: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
Subject: [meta-oe][PATCH v4] liboauth2: Add recipe at 2.2.0
Date: Mon, 26 Jan 2026 13:12:37 +0100
Message-ID: <20260126121236.1304966-2-frederikbraendstrup@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <188E438EFF05B728.3837557@lists.openembedded.org>
References: <188E438EFF05B728.3837557@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 12:13:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123874

V3: adds fixes for building with clang

V4: removes default PACKAGECONFIG used for testing builds

Signed-off-by: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
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
index 0000000000..31d7aec69d
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
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[memcache] = "--with-memcache,--without-memcache,libmemcached"
+PACKAGECONFIG[redis] = "--with-redis,--without-redis,hiredis"
+PACKAGECONFIG[jq] = "--with-jq,--without-jq,jq"
+PACKAGECONFIG[apache] = "--with-apache,--without-apache,apache2"
+
-- 
2.52.0



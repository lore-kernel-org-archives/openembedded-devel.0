Return-Path: <frederikbraendstrup@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AD63C88E41
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 08:15:45 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5995.1769501743379037220
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jan 2026 00:15:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e+Dee1Cx;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: frederikbraendstrup@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-658381b28e8so7193396a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 00:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769501742; x=1770106542; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mtwSxhouci4IlbnddsN/A7S+6rUgC2wM9mMFTrXbg+o=;
        b=e+Dee1Cx+/KBXbstztO13/1Gz3/B3zRluhfoHcihvMAo02EpvJPkd7CVnmizNsNlRO
         1t2ABHiZzGMk9GZyltIEk9/fszemwIO0xhBYwUpEPRjreqw6gSNY7DK50k+IHrdwx+Ua
         NTCa0U0pPcb6qbCsdcHbDXvGcbx+ns0XgjoV7RL8A4R28QoXvhVleWXy2vpubYoc7aOK
         eXZNKCfVmCI/WQVSscf4jywq4kIUjWLrYXklLZMAzCCDsmnZfjKlyJ3jmRvSlzXB6XGQ
         rA3Xx6NKbEZrFEO+BY6TQtMIBYCCx5WA4tdpTTSooRJpX+pWfmkCxnCYHUxV55NOdP34
         p0Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769501742; x=1770106542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mtwSxhouci4IlbnddsN/A7S+6rUgC2wM9mMFTrXbg+o=;
        b=cGW+M94owIhoPsxUOK2ctyFSX1TQ8jAmi+iGVzMj9CgwNsxO1aCOmoVmPMZF/ybSvM
         3rY96+CgPTJYyAhDna67kwjmn1IOuAwWFa/DcdM4sCpbLIXxCryKNB+ZeTJftYhhYhZN
         ahBrYutwpiHgasNQbRsKjAbEHARPuUdSfLm/n7k0ukS9d3NKEZ2CNWGPamRXzi1vSH7i
         jNtZJ4jI3wkoMYO2G/3msSx5XDKm0Uo5U+auoGnF2OMxPr5A8B8d/HkpU3+7AREDe4qT
         7+KG+y/75PXdqrP6I133LJ/a4h1/2vAxUg0uEMHjmfRRcltzjpeERP6DeY8qFWV7Y9bz
         mrcA==
X-Gm-Message-State: AOJu0YzzC/Gc4d7GBdFWthGpP927+2O1boCySI3uDeIfuX5JTNF99mp3
	SiXcAQwvKLnSGTrl9qxNji8vHuysl3zL1ytcxpsxiycjWOLzllViwSroh1e78Gf9
X-Gm-Gg: AZuq6aJu3/3Ugh2DH+Cj6LK4C+29x0HFYC/YL/BnTweidbqA9HdZOzPnXBdIl8y58Ei
	RPum8+cxp0lat00zqGNySVjCOr1YV2vNju28kK7HxOGfGgRISZrZ0PS0GbQAxPNVZsbaFD3C9Gm
	6DG4SuOqhraZQDsN62PmWvZ+sixWmeL5n7Dnuq1EXYEYeAW+oL+8YqbhxhIHXNUQfIh+M3QvP3u
	JgbouhQG//Oa8FT6+EETgCwPZP+pImYDD8tLtICwWfW8wXwNPuFr4IUD6/VZLxy7+eKJj5nNcBq
	4PEvxHeORDf1MBe5clU79RcdvV66LUyNCL3J2hWSPOIm62ZAXMdPclqTGUM1G+GxZpNrOsHtK6/
	pTuy2CgBeffx2mDW5WdKhuXxp+uKxRHGRfYDKTJ6Y9f9FPcF4p3kirlbII0eH1SBGguDfLAdyeG
	TOT0gasJDDuQsy+/tYXsMcOaxnb5Nb07zwGqwwYzGSI65uaXsI3Uf7tK6kXLrwE8OP
X-Received: by 2002:a17:907:3da1:b0:b87:115c:4a30 with SMTP id a640c23a62f3a-b8dab1a5a63mr82980466b.16.1769501741315;
        Tue, 27 Jan 2026 00:15:41 -0800 (PST)
Received: from ws.taila4487.ts.net (77.241.136.110.bredband.3.dk. [77.241.136.110])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658abcf999csm23658a12.2.2026.01.27.00.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 00:15:40 -0800 (PST)
From: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
Subject: [PATCH v5] liboauth2: Add recipe at 2.2.0
Date: Tue, 27 Jan 2026 09:14:59 +0100
Message-ID: <20260127081458.1520825-2-frederikbraendstrup@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <CAMKF1spENDOL3q_ftgBfO5+i_44D5m2gg7FLUgQp8CeRYY6Dkg@mail.gmail.com>
References: <CAMKF1spENDOL3q_ftgBfO5+i_44D5m2gg7FLUgQp8CeRYY6Dkg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 08:15:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123912

V3: adds fixes for building with clang

V4: removes default PACKAGECONFIG used for testing builds

V5: fixes Upstream-Status in patch

Signed-off-by: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
---
 ..._easy_setopt-takes-a-long-not-an-int.patch | 33 +++++++++++++++++++
 .../liboauth2/liboauth2_2.2.0.bb              | 23 +++++++++++++
 2 files changed, 56 insertions(+)
 create mode 100644 meta-oe/recipes-support/liboauth2/liboauth2/0001-fix-clang-curl_easy_setopt-takes-a-long-not-an-int.patch
 create mode 100644 meta-oe/recipes-support/liboauth2/liboauth2_2.2.0.bb

diff --git a/meta-oe/recipes-support/liboauth2/liboauth2/0001-fix-clang-curl_easy_setopt-takes-a-long-not-an-int.patch b/meta-oe/recipes-support/liboauth2/liboauth2/0001-fix-clang-curl_easy_setopt-takes-a-long-not-an-int.patch
new file mode 100644
index 0000000000..75da04a3a0
--- /dev/null
+++ b/meta-oe/recipes-support/liboauth2/liboauth2/0001-fix-clang-curl_easy_setopt-takes-a-long-not-an-int.patch
@@ -0,0 +1,33 @@
+From a9f28a44b9b387ef28904e24ca05d28562fdcc45 Mon Sep 17 00:00:00 2001
+From: Frede Hoey Braendstrup <frede@vokalo.io>
+Date: Mon, 26 Jan 2026 11:07:24 +0100
+Subject: [PATCH] fix(clang): curl_easy_setopt takes a long not an int
+
+Signed-off-by: Frede Hoey Braendstrup <frede@vokalo.io>
+Upstream-Status: Backport [https://github.com/OpenIDC/liboauth2/pull/69]
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



Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EF8EC56201
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 19:40:31 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24803.1785872430725379783
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2026 12:40:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=sKtgbxsC;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ced3386430so2609925ad.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 12:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785872430; x=1786477230; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q+BuTo6uc45x3b5DNGLNxX96keyNWfCSJ98d8qqXC58=;
        b=sKtgbxsC3h6OsBBOFjdIfHnCM20PCJvNV+emtM0grmjaxiS4c/GsEqIJK2rdCgxx4S
         ok237+HAPxy4/R78g0IeizXFSuaH1PSU+bX8JRoVXnG1Wl4klpmTRdDk0snGrtGJERf+
         0mXEU0g2s5IPAGndxGs7TJL/A6e1pCyM5EAGQuOJySejK5BsKEqFr5Xi/tvh/w3+dcfc
         ux0m8J1yIRs8b/bKew0xl0rTH6Y6vuDscrSQHfy5cXn7JjlsPAbP06eoYhJwu6xMrq3z
         2AzLfaPor4urUDkzk9qb18/iVvgz7VoO72UIDTlPR/u7Afljagdu9y77JUYnxB31m0XO
         V4kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785872430; x=1786477230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q+BuTo6uc45x3b5DNGLNxX96keyNWfCSJ98d8qqXC58=;
        b=gv1ahAqBA2mLPxG0DAJfePS/hkopbcihtqMupsYySwUQsgSUvRY3HxUawLKN1uG1kb
         hO7DqKigBPitWeJbs9+C/G+GCY9HRR/uDEAXNhzXk2a1NNyJvS7gyaU3WAmL6z1J9bbQ
         j1r9Uu4pxD5BFuJuN4ahy1swyTNP/FdO6UPrHEBwqobAU1wGGFIk6oHsBwv7ALEZ0gHX
         Mn299H4xNat8St3ylx7SYigeJi75DfQ8ZDyn6cuJYV6RKSbN5MFF+yC+g9l6nHKRPG0j
         z7QuB8OgPp8Ke+HTCnIIbxt1GjuM4pcWM2SepyO8HNyM9bmajyNCECBXn+Q9AkFx6J2Y
         /3DA==
X-Gm-Message-State: AOJu0YwscQ4Cr9QgpWWA+QNGRGwQImWVV7MvpliVGgETq22m0hxIEr8I
	d7eAnfs75OjcSnREh3DQqxtoHMIk/tvzbkHHJWGRao52yQ2qnUvm6whYYrYd81sf
X-Gm-Gg: AR+sD111VOTFup/7ZTqkKFouC3Dlwk9YB7QS7Y0RkTCCN6BFVlFEv119XBLGo/u71a2
	EHOKHdd1SA88c8jc0WrLHNctYpQwgor+bbElwR2P7rvi3qdi5Pw0DFjYNeYTTMJTNo4X5RyHP+v
	e8P04dHgO2AQn2u3icWSvMd9WoUivrmNHCjauIV95DTMQBseC9Jpq0AnxbIXFp7qKCVzVTfOFh5
	Vk8WsLK7vKKrwgZAdOxdZUvbQaTv0KyxQdhnS02Ko4pSf9pbBX6Oj1MYiJt3V6eVShBTXp9O83K
	X9shXKm4cOcTHTUk1rhgc+sTcnslG6bKQajcPv9xgOMkKqpPTDmHyQIVHBp+SsVudCBfu5J4XzW
	GQmIBTHxPLlvroK2CIY3S8PV4n/5Rt5RxgMiKp44Z10Z3ColRlmdpOAKostEBqPuR57zwyDLlsJ
	RDbKLyRe8mYIpxi4WGFOT/4zwOB2tdearXP3n74tjVeOF69Srxya8I6L+ikBIgC5RI4mmIKqk7K
	Q==
X-Received: by 2002:a05:6a20:be8f:b0:3c3:7427:5ed8 with SMTP id adf61e73a8af0-3cb85dcc9d8mr1161946637.8.1785872429911;
        Tue, 04 Aug 2026 12:40:29 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673b7f4sm8156417eec.17.2026.08.04.12.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 12:40:29 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [oe][meta-oe][wrynose][PATCH 8/36] liboauth2: upgarde 2.2.0 -> 2.3.0
Date: Wed,  5 Aug 2026 07:39:35 +1200
Message-ID: <20260804194003.3158916-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
References: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 19:40:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128755

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Dropped patches that are part of this version.

Release Notes:
https://github.com/OpenIDC/liboauth2/releases/tag/v2.3.0

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 5500c1148a05deea60979d1d363d25ad2dbc9c2b)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...rage-linker-flag-behind-CODE_COVERAG.patch | 33 -------------------
 ..._easy_setopt-takes-a-long-not-an-int.patch | 33 -------------------
 .../0002-Fix-use-of-strchr-with-new-GCC.patch | 33 -------------------
 ...{liboauth2_2.2.0.bb => liboauth2_2.3.0.bb} |  8 ++---
 4 files changed, 2 insertions(+), 105 deletions(-)
 delete mode 100644 meta-oe/recipes-support/liboauth2/liboauth2/0001-build-guard-coverage-linker-flag-behind-CODE_COVERAG.patch
 delete mode 100644 meta-oe/recipes-support/liboauth2/liboauth2/0001-fix-clang-curl_easy_setopt-takes-a-long-not-an-int.patch
 delete mode 100644 meta-oe/recipes-support/liboauth2/liboauth2/0002-Fix-use-of-strchr-with-new-GCC.patch
 rename meta-oe/recipes-support/liboauth2/{liboauth2_2.2.0.bb => liboauth2_2.3.0.bb} (71%)

diff --git a/meta-oe/recipes-support/liboauth2/liboauth2/0001-build-guard-coverage-linker-flag-behind-CODE_COVERAG.patch b/meta-oe/recipes-support/liboauth2/liboauth2/0001-build-guard-coverage-linker-flag-behind-CODE_COVERAG.patch
deleted file mode 100644
index f234cbd50b..0000000000
--- a/meta-oe/recipes-support/liboauth2/liboauth2/0001-build-guard-coverage-linker-flag-behind-CODE_COVERAG.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 7c70315f7f6b4305d761804fb03f8f90ad7572eb Mon Sep 17 00:00:00 2001
-From: Khem Raj <khem.raj@oss.qualcomm.com>
-Date: Fri, 17 Apr 2026 14:01:46 -0700
-Subject: [PATCH] build: guard --coverage linker flag behind
- CODE_COVERAGE_ENABLED
-
-AM_LDFLAGS passes --coverage to the linker unconditionally,
-it causes coverage instrumentation to be enabled even when
-configured with --disable-code-coverage. Wrap it in the
-automake conditional provided by AX_CODE_COVERAGE.
-
-Upstream-Status: Submitted [https://github.com/OpenIDC/liboauth2/pull/74]
-Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
----
- Makefile.am | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index a079dcc..a3f991d 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -8,7 +8,10 @@ EXTRA_DIST = autogen.sh ChangeLog README.md LICENSE
-
- AM_CPPFLAGS = -Wall -Werror -Wno-error=deprecated-declarations -I${srcdir}/include -I${srcdir}/src @JANSSON_CFLAGS@ @OPENSSL_CFLAGS@
- AM_CPPFLAGS += $(CODE_COVERAGE_CPPFLAGS) $(CODE_COVERAGE_CFLAGS)
--AM_LDFLAGS = --coverage
-+AM_LDFLAGS =
-+if CODE_COVERAGE_ENABLED
-+AM_LDFLAGS += --coverage
-+endif
-
- LDADD = @JANSSON_LIBS@ @OPENSSL_LIBS@
- LDADD += $(CODE_COVERAGE_LIBS)
diff --git a/meta-oe/recipes-support/liboauth2/liboauth2/0001-fix-clang-curl_easy_setopt-takes-a-long-not-an-int.patch b/meta-oe/recipes-support/liboauth2/liboauth2/0001-fix-clang-curl_easy_setopt-takes-a-long-not-an-int.patch
deleted file mode 100644
index 75da04a3a0..0000000000
--- a/meta-oe/recipes-support/liboauth2/liboauth2/0001-fix-clang-curl_easy_setopt-takes-a-long-not-an-int.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From a9f28a44b9b387ef28904e24ca05d28562fdcc45 Mon Sep 17 00:00:00 2001
-From: Frede Hoey Braendstrup <frede@vokalo.io>
-Date: Mon, 26 Jan 2026 11:07:24 +0100
-Subject: [PATCH] fix(clang): curl_easy_setopt takes a long not an int
-
-Signed-off-by: Frede Hoey Braendstrup <frede@vokalo.io>
-Upstream-Status: Backport [https://github.com/OpenIDC/liboauth2/pull/69]
----
- src/http.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/http.c b/src/http.c
-index ab7a25a..bc242ed 100644
---- a/src/http.c
-+++ b/src/http.c
-@@ -1024,7 +1024,7 @@ bool oauth2_http_call(oauth2_log_t *log, const char *url, const char *data,
- 	curl_easy_setopt(curl, CURLOPT_MAXREDIRS, 5L);
- 
- 	if (ctx)
--		curl_easy_setopt(curl, CURLOPT_TIMEOUT, ctx->timeout);
-+		curl_easy_setopt(curl, CURLOPT_TIMEOUT, (long)ctx->timeout);
- 
- 	curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION,
- 			 oauth2_http_curl_buf_write);
-@@ -1092,7 +1092,7 @@ bool oauth2_http_call(oauth2_log_t *log, const char *url, const char *data,
- 
- 	if (data != NULL) {
- 		curl_easy_setopt(curl, CURLOPT_POSTFIELDS, data);
--		curl_easy_setopt(curl, CURLOPT_POST, 1);
-+		curl_easy_setopt(curl, CURLOPT_POST, 1L);
- 	}
- 
- 	if (ctx)
diff --git a/meta-oe/recipes-support/liboauth2/liboauth2/0002-Fix-use-of-strchr-with-new-GCC.patch b/meta-oe/recipes-support/liboauth2/liboauth2/0002-Fix-use-of-strchr-with-new-GCC.patch
deleted file mode 100644
index 65340e806a..0000000000
--- a/meta-oe/recipes-support/liboauth2/liboauth2/0002-Fix-use-of-strchr-with-new-GCC.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 0dcba079907d559550ee8d9a201d26203bb8aebd Mon Sep 17 00:00:00 2001
-From: Alexander Bokovoy <abokovoy@redhat.com>
-Date: Wed, 7 Jan 2026 11:41:37 +0200
-Subject: [PATCH] Fix use of strchr with new GCC
-
-According to C specification, 7.28.5.1, strchr() is a generic function
-and its string argument's type is promoted to the result. So if it is
-const char*, the result will be const char* as well.
-
-gcc in Fedora Rawhide (15.2.1 20251111 or later) implements this
-conformance, resulting in a compilation fail with
--Werror=discarded-qualifiers.
-
-Signed-off-by: Alexander Bokovoy <abokovoy@redhat.com>
-Upstream-Status: Backport [https://github.com/OpenIDC/liboauth2/commit/0dcba079907d559550ee8d9a201d26203bb8aebd]
-Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
----
- src/jose.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/jose.c b/src/jose.c
-index fbaf661..a3441c8 100644
---- a/src/jose.c
-+++ b/src/jose.c
-@@ -993,7 +993,7 @@ char *oauth2_jose_jwt_header_peek(oauth2_log_t *log,
- {
- 	char *input = NULL, *result = NULL;
- 	json_t *json = NULL;
--	char *p = NULL;
-+	const char *p = NULL;
- 	size_t result_len;
- 	char *rv = NULL;
- 
diff --git a/meta-oe/recipes-support/liboauth2/liboauth2_2.2.0.bb b/meta-oe/recipes-support/liboauth2/liboauth2_2.3.0.bb
similarity index 71%
rename from meta-oe/recipes-support/liboauth2/liboauth2_2.2.0.bb
rename to meta-oe/recipes-support/liboauth2/liboauth2_2.3.0.bb
index 83825c69a5..0f82165ab4 100644
--- a/meta-oe/recipes-support/liboauth2/liboauth2_2.2.0.bb
+++ b/meta-oe/recipes-support/liboauth2/liboauth2_2.3.0.bb
@@ -4,13 +4,9 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
 
 SRC_URI = " \
-    git://github.com/OpenIDC/liboauth2;protocol=https;branch=master;tag=v${PV} \
-    file://0001-fix-clang-curl_easy_setopt-takes-a-long-not-an-int.patch \
-    file://0002-Fix-use-of-strchr-with-new-GCC.patch \
-    file://0001-build-guard-coverage-linker-flag-behind-CODE_COVERAG.patch \
-    "
+    git://github.com/OpenIDC/liboauth2;protocol=https;branch=master;tag=v${PV}"
 
-SRCREV = "12571b6d6568c2db7d5f080f60ecb55795c0db19"
+SRCREV = "5aeae56ab2c0ae1ff1c70bc13e0628b134ece70c"
 
 DEPENDS = "libpcre2 jansson curl openssl cjose"
 


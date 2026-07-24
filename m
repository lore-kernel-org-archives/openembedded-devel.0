Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC2BFC531F9
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 02:14:56 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11438.1784859295768342587
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jul 2026 19:14:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BuiDVB9U;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso1034920a91.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Jul 2026 19:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784859295; x=1785464095; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=crlZl0DKm7j9G/9rivLXrIhIOpHUpXkWvGMKpk13M3M=;
        b=BuiDVB9UW6FM/yaOv0y68TFoCbIkp65XQKH6X3oTX1osOnJuN1nxD44ZFcTF+UNz0n
         zscuUdakI/qm7d52wt0cewODuZJQv8JuqDs04JPtCfliZwJe8P4RumlkVy2eo9FLcOeM
         rUNU3w2pY9K0JaHWBW4feRKG/m9/kzo80xZXVMwVR/Le3ib8IXm1ujnZnPLLvoGmY44R
         s5NjXCo0VEpNjvuDnSRw1NygIvlaDK1KVhhyezkp26dmdkxfo1k3RfGL281XM0Hq2IXo
         8zf5sL3is33TSldwfwR9P5dBtAa8y7gQoJrkewRc44cJCc+D5V+KWA9hcxkzrrQ/0CXv
         RZPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784859295; x=1785464095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=crlZl0DKm7j9G/9rivLXrIhIOpHUpXkWvGMKpk13M3M=;
        b=BOa94wxtWeYokYjH2ziwpMWFJXSTQbgA/BerAxKWRe+aNQyytHpbTSPpcsBec7Id7w
         TO23zlXQHEP66h17IelOlALY2GixihexFHPahzU4L9DAPcSskCiF6j7n32hRpQabMOJe
         aiksZYa4KY09GdaDyKIWO9BzfdOsS+oVTdeQuwuoeUZUQfRVTc9EdQ68E5KgvqKvQums
         7RtPFEGxb+hFVog+P8UyN+Wnm0WMtnadcFufoDYu4y2fyF4kpp1K2v7YFdjHCJ8bW/9P
         FPI5oDSLOwO3UFjaLCWCHf75KY8ty4jk5CzY8NjYDoJbJy+qfm/eYMiTyAVC+dTt32/a
         EGIA==
X-Gm-Message-State: AOJu0YzJadIbhmr1mJqjOh3S320SY7yd1xpliHkSuUB4kkGTOBF+/g0M
	XkQ3rusfy97ERYCfgZasH9P2+et6a2u8HT0wlaXwmII/XreOOPuAtbADsCDxGOVJ
X-Gm-Gg: AR+sD10/xKFAZu9hbutWNExDPOSFXdgRDFoGPOo6UpLrEucCIVIcRa0inlPcQuvD0N8
	szbSTNb3EfDZ5FhqlW3myNqMDV0Hm9iZT0jFWZOxoMe2pXKMqOvOGx/Tixc2pBeJpY/uqqAA6vm
	SX2/LfhM7GkkmmJGtGAa1ffn0Q3sMIFqvAMteeTO8HN6l5uU8JXASyHa8p94PiHR5H/SQWr89iU
	IKbXDG/kSPbf7s/4tOpzS30YQ/9rwZIFcHOOY3C4svM/Bx8ECyIOkfxmykj86I1oHzRX7vexJu3
	7hS1PAl+3Udm3ZhJDu1AwQhIqktdW98nVqN0bd0qZyEhRfgUZdQenTM/olSEE/3NSHS+I4I97+7
	2HaRB4ZZu0Ww0g3e6Poe2d3a2JsDSVIaw+Ypa0XmLPghzAE5eLZK0r6iiYvSQdRudQTP8KeoFVI
	JpB+XDx9CnrlCLBCmQWmhB2ay8tA==
X-Received: by 2002:a17:90b:184c:b0:37f:9ce1:735a with SMTP id 98e67ed59e1d1-38ec658e892mr5825626a91.27.1784859295079;
        Thu, 23 Jul 2026 19:14:55 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d1300401fsm26824794c88.3.2026.07.23.19.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 19:14:54 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 13/13] liboauth2: upgarde 2.2.0 -> 2.3.0
Date: Fri, 24 Jul 2026 14:14:07 +1200
Message-ID: <20260724021407.2840261-13-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724021407.2840261-1-ankur.tyagi85@gmail.com>
References: <20260724021407.2840261-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Jul 2026 02:14:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128435

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Dropped patches that are part of this version.

Release Notes:
https://github.com/OpenIDC/liboauth2/releases/tag/v2.3.0

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
 


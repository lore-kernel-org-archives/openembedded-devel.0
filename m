Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10220.1795752838009982331
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:13:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=yoQWD7Gk;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-386cf1041cdso4398880eec.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795752837; x=1796357637; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TqZsn3dbJ3lX3ZKMIb9cY5JtnSKeeQbNxS8+fh8Z1NY=;
        b=yoQWD7Gk2CJTa8E1wlmfsuMyDbEjE33xpO4mzEmCZD4PBdrHk67vCTViCAp3AWpbXP
         v7nhoY4MbUcg/GDGqMGiphhyZl0tkBHah6ZOlAUtdv2croCVNlA1R9m+SyjSmWfaZNvC
         UnfXqFy1pkfD5y1xz5Sb/dbFXkUQaZnfERm9dqUCb+7IZXwreCkm9d/9t9UHQIw0l6Ud
         wK5FeGpqx+tvRbZ6a6eMsP4NCYoaxW+R0QqbwjrPkRI3kLtnX7Z9wvi1zai0SomkHG1u
         u0b2Z59EpUI7whthts4v0bOn6bvLnWrGtoJ+n912YkqKQG9bHkFV3OoseORdD8EJbkXr
         5QBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795752837; x=1796357637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TqZsn3dbJ3lX3ZKMIb9cY5JtnSKeeQbNxS8+fh8Z1NY=;
        b=rltPTgvxRkq/HCvpTodDNgv27sNI7dZoS5IvKEMzIul8vFE2cGvJvbAqUEfIEHqM8m
         kPW/AZYbIZxZVXJ7UZgKUDHjVNURDrKB0pjQIzALXQC0rrpD78kR77OxNhbnFgWs0R9q
         NT7aSQabskVhRlnZagzEyHMr3ce2N0aIeCpSuiIOnjxvPwDEPsQUBWdxPzQf2lOL5yik
         +zdkTgXwEqxL7QVzPEsSbnVCGxCPTOZjs0Vt5r7r6d4x92u5f+tVXTXDc71MhPAL8MMT
         fYOuwhjpDGuwB589KrlOYiFgWT1NDlbm3ySwprxUtpWJwMppg10zKU7NuUAt7In0iVhI
         GsTg==
X-Gm-Message-State: APuU4Z92gbWKQJn+4/oD6TXWcLpabqjWlms6O36kiZoSIPzW6m8PdI4+
	4DEx6TOf09NN0JTzQWB5ZY7x9B03ezDed+GrKldlR0+s8ksOxeJPIl+wECb5FO7k
X-Gm-Gg: AZFdTZfM2RUrFX4BT3mf4/iz8FpyXxMbFdVLmYnSBs4lRml+ij/ORgFVPFK3nK8Q9J4
	BG59TSAFnkaRa3cJUsPd1bXk9iiSBpnW6uaVy2aLZ0lIrpztfl8sX+yzpHTmFYouIT78IK1JIxu
	sHplH9W99F7e0yLO1pBaPn35BHteWJl0CIxs1LhafsPqJ2GmqK0a7ZBlaSiZ2ZwzQoZCQe/1Cbe
	1haRD/7yRKb9DP2h5mPYsf372UasZ3wWRvCwKQqcBJYDCpb+nSsZCV8aCcxYGWCG1v7E7ZS2vsN
	gq+/TP8PLaJpTVjAy2hYDgz5utQRpatnNzv1DfLanblwhehDvPiTmsN6meh75tUdITdYvdu2/Y3
	Luad/6BXLWZIQpIhmrFqdqwxoMtNo+266e+xNIYUmnYW/tptrPPgpX6hzxd88XrtCSwwPQngEpN
	SpUUWvT5HEEDvJSbE4j3Q707UEwYBE5Y4T0H+WEFrx2lcBU+uzbcCHjjy2UvsUhvi8PE/IxBuv7
	e1MWt+x72Wuxkr3HtyA8Y7PHtbEaLy5JKcl6lCZMq3I+DfcgRTi+SkmUaCU4b/7yETI8RNxYSGb
	+zUoxCNqkATLrhD4HGpqrLU07iwZd0nQkX53wRAj1fWVqm4Es93IoMwosfvPk0hf5iqXZWeDHAz
	mkg9xgoyUbN0FO3MSKs51g7t64PlvxZlW/p//K+23VEtTZLEC3+4zx/fs8O5PDq5pKAjaDkUnmy
	qgmU1eIt07L/6ZdigXphbRqKkSU9KuBj/uTsqSnJrQ6Db6iEiQa7aUbzS0YYItdIg+7riHWBlI2
	jOSIEJ7LjU3oTLHotjltftY93qcDSd220tJLuf7+HZ/R0BVofRW/yERoN6inDcJ3KjXxjbtyjgT
	S6PK
X-Received: by 2002:a05:7301:6187:10b0:386:a193:7eeb with SMTP id 5a478bee46e88-386a1938b8dmr18553385eec.30.1795752837307;
        Thu, 26 Nov 2026 20:13:57 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm70674179eec.6.2026.11.26.20.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:13:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 35/39] safec: upgrade 3.9.1 -> 3.16
Date: Thu, 26 Nov 2026 20:13:39 -0800
Message-ID: <20261127041343.1772294-7-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041343.1772294-1-khem.raj@oss.qualcomm.com>
References: <20261127041343.1772294-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:14:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133205
Content-Type: text/plain; charset="utf-8"

- 3.12 splits _chk and _uchk at compile-time, calling the fast
  unchecked worker when all arguments are known valid, and inlines more
  mem/str functions.
- Security: 3.15 fixes writes past dmax in wcstombs_s, mbstowcs_s,
  wcsrtombs_s and mbsrtowcs_s, and several other memory safety bugs in
  the wchar, wcsfc_s, wcsnorm_compose_s and strcmpfld_s functions.
- 3.15 also makes qsort_s, ctime_s, asctime_s and swprintf_s thread-safe
  and fixes stpcpy_s/stpncpy_s return values and printf/scanf issues.
- 3.16 adds Windows MSVC support in cmake, an optional cache flush for
  memset_s/memzero_s (--enable-cache-flush) and fixes the ARM barrier.

Drop the vsnprintf_s buffer size patch, as upstream now allocates the
extra byte.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...snprintf_s-Increase-Buffer-Size-by-1.patch | 41 -------------------
 .../safec/{safec_3.9.1.bb => safec_3.16.bb}   |  6 +--
 2 files changed, 2 insertions(+), 45 deletions(-)
 delete mode 100644 meta-oe/recipes-core/safec/safec/0001-vsnprintf_s-Increase-Buffer-Size-by-1.patch
 rename meta-oe/recipes-core/safec/{safec_3.9.1.bb => safec_3.16.bb} (84%)

diff --git a/meta-oe/recipes-core/safec/safec/0001-vsnprintf_s-Increase-Buffer-Size-by-1.patch b/meta-oe/recipes-core/safec/safec/0001-vsnprintf_s-Increase-Buffer-Size-by-1.patch
deleted file mode 100644
index 5617aeb368..0000000000
--- a/meta-oe/recipes-core/safec/safec/0001-vsnprintf_s-Increase-Buffer-Size-by-1.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From dca9a17c75c7442060c08fdced4e4b0c8d2babae Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 13 Aug 2025 20:23:48 -0700
-Subject: [PATCH] vsnprintf_s: Increase Buffer Size by 1
-
-It is a buffer overflow warning that GCC 15.2 is catching.
-The issue is that it's trying to write to `buf[len++]` when len could
-potentially be 31, which would write to buf[31] in a buffer of size 32
-(valid indices 0-31), but the len++ post-increment means it could
-theoretically write beyond the buffer bounds.
-
-Fixes
-
-../../sources/safec-3.9.1/src/str/vsnprintf_s.c: In function 'safec_ftoa.isra':
-../../sources/safec-3.9.1/src/str/vsnprintf_s.c:523:24: error: writing 32 bytes into a region of size 31 [-Werror=stringop-overflow=]
-  523 |             buf[len++] = '0';
-      |             ~~~~~~~~~~~^~~~~
-../../sources/safec-3.9.1/src/str/vsnprintf_s.c:394:10: note: at offset [1, 32] into destination object 'buf' of size 32
-  394 |     char buf[PRINTF_FTOA_BUFFER_SIZE];
-      |          ^~~
-cc1: all warnings being treated as errors
-
-Upstream-Status: Submitted [https://github.com/rurban/safeclib/pull/148]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/str/vsnprintf_s.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/str/vsnprintf_s.c b/src/str/vsnprintf_s.c
-index fa53ab42..0b62c3cb 100644
---- a/src/str/vsnprintf_s.c
-+++ b/src/str/vsnprintf_s.c
-@@ -391,7 +391,7 @@ static size_t safec_ftoa(out_fct_type out, const char *funcname, char *buffer,
-                          size_t idx, size_t maxlen, double value,
-                          unsigned int prec, unsigned int width,
-                          unsigned int flags) {
--    char buf[PRINTF_FTOA_BUFFER_SIZE];
-+    char buf[PRINTF_FTOA_BUFFER_SIZE + 1]; // Add extra byte for safety
-     size_t len = 0U, off = 0U;
-     double tmp;
-     double diff = 0.0;
diff --git a/meta-oe/recipes-core/safec/safec_3.9.1.bb b/meta-oe/recipes-core/safec/safec_3.16.bb
similarity index 84%
rename from meta-oe/recipes-core/safec/safec_3.9.1.bb
rename to meta-oe/recipes-core/safec/safec_3.16.bb
index 1e14875e48..2c628241e6 100644
--- a/meta-oe/recipes-core/safec/safec_3.9.1.bb
+++ b/meta-oe/recipes-core/safec/safec_3.16.bb
@@ -6,10 +6,8 @@ SECTION = "lib"
 
 inherit autotools pkgconfig
 
-SRCREV = "39a0a819f80853498e48a6e601a446a122b64aaa"
-SRC_URI = "git://github.com/rurban/safeclib.git;branch=master;protocol=https;tag=v${PV} \
-           file://0001-vsnprintf_s-Increase-Buffer-Size-by-1.patch \
-		  "
+SRCREV = "3a2487e8ad2fbb7be4e5e14043e91a86879a0ab5"
+SRC_URI = "git://github.com/rurban/safeclib.git;branch=master;protocol=https;tag=v${PV}"
 UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+\.\d+(\.\d+)?)$"
 
 # arm-yoe-linux-gnueabi-clang: error: argument unused during compilation: '-mretpoline' [-Werror,-Wunused-command-line-argument]

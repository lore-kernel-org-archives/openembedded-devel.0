Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8717DCA0ED1
	for <webhook@archiver.kernel.org>; Thu, 14 Aug 2025 03:37:49 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.14810.1755142667002452810
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Aug 2025 20:37:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OuEGKiaN;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b4716fa7706so318160a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 13 Aug 2025 20:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755142666; x=1755747466; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vHPhUeE7+NXc0ejF3/mhoZmgJ+XUFY54+YX3A37Fp1Y=;
        b=OuEGKiaNYACYrcRaqjMiPXYPsUh3L2N+sRJnBCTIbsR5Bg27H8F/taWwseKCjTS1OZ
         VoyGeud/erSsCTicPDalzZ36CMyl6eoE5kJP46Xf9kPYGtx3EYGHsxavexObXjy/sLW9
         NS4Yo+8Kd8CtmZcWmpfe+rQWzEUKfSgxzzWksMrwstpqDmUR7YO87vhcO1GZ7SXiauw4
         tdYb0d/Q0pcPQCxIjA1oAcTBNYSlxwZux+KhFDv0IxFLMvDTKRyKEi/+ZKfK0sfMVH85
         VlxZfLiTER2+sLqy92u+HhZXjmHrop4+2HXYaRg5c4OvtRPq2x00ZV2mmvkzf+WYm7u1
         xEng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755142666; x=1755747466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vHPhUeE7+NXc0ejF3/mhoZmgJ+XUFY54+YX3A37Fp1Y=;
        b=utf/Qnb4tCUpk0ge0ojKig2SPYtjrllr7HegtA1pWjodUf7VNnFUVXp6tudTo5TyzA
         7ocXmfivHznmWgLlgz9lJNsdlryA4XDK7Iq0E+wgHE7fS7R+TeyBdX67Nr0nHEjonykE
         vwYs3aBT9TXojKshP8apLZnTl/RzXqYw8Lk276hER/4ZsBPvRFJ3deD+9vpl+ZWjEwwr
         1ZpjHimhtHUr9/a8JU/RKWqEckDKIlullHzyeBZzxl3/BrAHkDlzPDKW6dvxmKAVkAgB
         uczk1yyFjcSUQBTecAcl/7xRVPCA7o8ozJQegfdDAyIzK3EryPew5GeeIgtT7UaqHSbT
         bk4Q==
X-Gm-Message-State: AOJu0YwL7SNpYpWRwO4fFs7E73zVQGcnECzFkSUnWP+O40l8AXajcTd3
	PePSFHmttEAQXE6tCYQmRfqbv3ksdeZL2M0HyR+j+EmqPK6xAAP7Ig8pBgLA55gr
X-Gm-Gg: ASbGncvSlFYhRJ2sMtb8lq3EBo/hv8EW/K4pH5Xv24/sbPbhMwI23SrUbiQejNmpQLQ
	HGf/CcVFxnQjDd6ezDASuBvCCzzK1OBDv2TyEnp7oL6P3xntpcsatYjmyZ0hYNAAq5tAQgoo303
	k9HatLuwtOM1ogom4m4wGXpbJuv44/GlyG06/0ludeuODlWZAuPl3lraPvg2Ql4+4SHOEjVtkUO
	V+22EiwJNa+Cmaf9Pw14LEbwAm/fabXj9m3u4vYMEbtCg5YT4CBIOf5WPAQlfgNtHQZct5KzhLB
	I9BibmlGMcn+FvHh8Z7zwmpKxToEsxvCxs7+pCl+S1EDey62zmtnRqhKFZaCWgNgS6+E5/iy5Lp
	DeTtKUFOAYZdfDafc2Zin2aOpcqeKiH4=
X-Google-Smtp-Source: AGHT+IFZ5NVSYagy4h7YWTWzIh4QAJn/V/CZlCK1KcSYclc0T7C3jEURANBCLMvVOOcuNRR1l2B3EA==
X-Received: by 2002:a17:902:cf10:b0:240:1ec4:61fe with SMTP id d9443c01a7336-2445868e42bmr20889545ad.28.1755142665788;
        Wed, 13 Aug 2025 20:37:45 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1f21c65sm341892015ad.73.2025.08.13.20.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 20:37:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] safec: Upgrade to 3.9.1
Date: Wed, 13 Aug 2025 20:37:42 -0700
Message-ID: <20250814033742.1711651-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250814033742.1711651-1-raj.khem@gmail.com>
References: <20250814033742.1711651-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Aug 2025 03:37:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118928

Drop patch since its fixed by [1] in 3.9.1
Add a patch to fix new warning seen with gcc 15.2

[1] https://github.com/rurban/safeclib/issues/125

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...strpbrk_s-Remove-unused-variable-len.patch | 42 -------------------
 ...snprintf_s-Increase-Buffer-Size-by-1.patch | 41 ++++++++++++++++++
 .../safec/{safec_3.7.1.bb => safec_3.9.1.bb}  |  8 ++--
 3 files changed, 45 insertions(+), 46 deletions(-)
 delete mode 100644 meta-oe/recipes-core/safec/safec/0001-strpbrk_s-Remove-unused-variable-len.patch
 create mode 100644 meta-oe/recipes-core/safec/safec/0001-vsnprintf_s-Increase-Buffer-Size-by-1.patch
 rename meta-oe/recipes-core/safec/{safec_3.7.1.bb => safec_3.9.1.bb} (83%)

diff --git a/meta-oe/recipes-core/safec/safec/0001-strpbrk_s-Remove-unused-variable-len.patch b/meta-oe/recipes-core/safec/safec/0001-strpbrk_s-Remove-unused-variable-len.patch
deleted file mode 100644
index 4fd36ab8ab..0000000000
--- a/meta-oe/recipes-core/safec/safec/0001-strpbrk_s-Remove-unused-variable-len.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From b1d7cc6495c541cdd99399b4d1a835997376dcbf Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 22 Aug 2022 23:42:33 -0700
-Subject: [PATCH] strpbrk_s: Remove unused variable len
-
-Fixes
-error: variable 'len' set but not used [-Werror,-Wunused-but-set-variable]
-
-Upstream-Status: Submitted [https://github.com/rurban/safeclib/pull/123]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/extstr/strpbrk_s.c | 3 ---
- 1 file changed, 3 deletions(-)
-
-diff --git a/src/extstr/strpbrk_s.c b/src/extstr/strpbrk_s.c
-index 5bb7a0f8..2cf8a8be 100644
---- a/src/extstr/strpbrk_s.c
-+++ b/src/extstr/strpbrk_s.c
-@@ -79,7 +79,6 @@ EXPORT errno_t _strpbrk_s_chk(char *dest, rsize_t dmax, char *src, rsize_t slen,
- #endif
- {
-     char *ps;
--    rsize_t len;
- 
-     CHK_SRC_NULL("strpbrk_s", firstp)
-     *firstp = NULL;
-@@ -121,7 +120,6 @@ EXPORT errno_t _strpbrk_s_chk(char *dest, rsize_t dmax, char *src, rsize_t slen,
-     while (*dest && dmax) {
- 
-         ps = src;
--        len = slen;
-         while (*ps) {
- 
-             /* check for a match with the substring */
-@@ -130,7 +128,6 @@ EXPORT errno_t _strpbrk_s_chk(char *dest, rsize_t dmax, char *src, rsize_t slen,
-                 return RCNEGATE(EOK);
-             }
-             ps++;
--            len--;
-         }
-         dest++;
-         dmax--;
diff --git a/meta-oe/recipes-core/safec/safec/0001-vsnprintf_s-Increase-Buffer-Size-by-1.patch b/meta-oe/recipes-core/safec/safec/0001-vsnprintf_s-Increase-Buffer-Size-by-1.patch
new file mode 100644
index 0000000000..5617aeb368
--- /dev/null
+++ b/meta-oe/recipes-core/safec/safec/0001-vsnprintf_s-Increase-Buffer-Size-by-1.patch
@@ -0,0 +1,41 @@
+From dca9a17c75c7442060c08fdced4e4b0c8d2babae Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 13 Aug 2025 20:23:48 -0700
+Subject: [PATCH] vsnprintf_s: Increase Buffer Size by 1
+
+It is a buffer overflow warning that GCC 15.2 is catching.
+The issue is that it's trying to write to `buf[len++]` when len could
+potentially be 31, which would write to buf[31] in a buffer of size 32
+(valid indices 0-31), but the len++ post-increment means it could
+theoretically write beyond the buffer bounds.
+
+Fixes
+
+../../sources/safec-3.9.1/src/str/vsnprintf_s.c: In function 'safec_ftoa.isra':
+../../sources/safec-3.9.1/src/str/vsnprintf_s.c:523:24: error: writing 32 bytes into a region of size 31 [-Werror=stringop-overflow=]
+  523 |             buf[len++] = '0';
+      |             ~~~~~~~~~~~^~~~~
+../../sources/safec-3.9.1/src/str/vsnprintf_s.c:394:10: note: at offset [1, 32] into destination object 'buf' of size 32
+  394 |     char buf[PRINTF_FTOA_BUFFER_SIZE];
+      |          ^~~
+cc1: all warnings being treated as errors
+
+Upstream-Status: Submitted [https://github.com/rurban/safeclib/pull/148]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/str/vsnprintf_s.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/str/vsnprintf_s.c b/src/str/vsnprintf_s.c
+index fa53ab42..0b62c3cb 100644
+--- a/src/str/vsnprintf_s.c
++++ b/src/str/vsnprintf_s.c
+@@ -391,7 +391,7 @@ static size_t safec_ftoa(out_fct_type out, const char *funcname, char *buffer,
+                          size_t idx, size_t maxlen, double value,
+                          unsigned int prec, unsigned int width,
+                          unsigned int flags) {
+-    char buf[PRINTF_FTOA_BUFFER_SIZE];
++    char buf[PRINTF_FTOA_BUFFER_SIZE + 1]; // Add extra byte for safety
+     size_t len = 0U, off = 0U;
+     double tmp;
+     double diff = 0.0;
diff --git a/meta-oe/recipes-core/safec/safec_3.7.1.bb b/meta-oe/recipes-core/safec/safec_3.9.1.bb
similarity index 83%
rename from meta-oe/recipes-core/safec/safec_3.7.1.bb
rename to meta-oe/recipes-core/safec/safec_3.9.1.bb
index 4de58f5d63..3635476d1c 100644
--- a/meta-oe/recipes-core/safec/safec_3.7.1.bb
+++ b/meta-oe/recipes-core/safec/safec_3.9.1.bb
@@ -6,10 +6,10 @@ SECTION = "lib"
 
 inherit autotools pkgconfig
 
-SRCREV = "f9add9245b97c7bda6e28cceb0ee37fb7e254fd8"
-SRC_URI = "git://github.com/rurban/safeclib.git;branch=master;protocol=https \
-           file://0001-strpbrk_s-Remove-unused-variable-len.patch \
-           "
+SRCREV = "39a0a819f80853498e48a6e601a446a122b64aaa"
+SRC_URI = "git://github.com/rurban/safeclib.git;branch=master;protocol=https;tag=v${PV} \
+           file://0001-vsnprintf_s-Increase-Buffer-Size-by-1.patch \
+		  "
 # arm-yoe-linux-gnueabi-clang: error: argument unused during compilation: '-mretpoline' [-Werror,-Wunused-command-line-argument]
 # arm-yoe-linux-gnueabi-clang: error: argument unused during compilation: '-fstack-clash-protection' [-Werror,-Wunused-command-line-argument]
 TUNE_CCARGS:append:toolchain-clang = " -Qunused-arguments"


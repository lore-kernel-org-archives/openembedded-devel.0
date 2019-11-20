Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
	[209.85.216.46])
	by mail.openembedded.org (Postfix) with ESMTP id BAA547C9C5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2019 21:50:23 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id a16so405181pjs.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2019 13:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=j32Pg0sEMbXlvZeWB38v6UD931dXRGGFOoKFRXDuA9E=;
	b=fAYXJnziRyR1pXuPYcv1ZESs8Lw8ZVqFXbGtXzn7KM/vFQCFPDIAQKAFxiU5d7dH2F
	3zLEaG7wAZ+l2LzUZF7vmap0lS3DpJ8P+aZTSJnKeeh1BT4Lpcip3h/ghLkuVCWyAgRQ
	71iXx2mbQSJ/DNdrSJyd3LRnjTTRhgTHoGz8IBM22s+KTRX8MDrsRkkq2BgxV3bF+yVR
	BBVueOGlOeRBs1eQeQgOPOrZL7txs4Ft52Lkfr91olc+GH+rzLwhbVEAYMelFBVX538R
	qJ74+YTqkpe9Q8qGrGZA7L968V6B8RR8SIjE0/kkyA+DGYzcE20PfRyBXCEQdCq9c4xS
	o6KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=j32Pg0sEMbXlvZeWB38v6UD931dXRGGFOoKFRXDuA9E=;
	b=hCJnbGp83nTHKvDwB47Myqd8EwLpIH3/jA9c8v6cZAbyo0jQEx38441QDds1pa4Cir
	B/Mts2tuK81tHGJPloVymXgnPhEWggOWoO8o9IctXxMmrG/CRphGt3v3v65YudVVz/Sk
	zFjv6izMOCdUPzE4FnEWLIe9JxYbOYLmy1iJCMga3OvzgP35LwwdJQyHWSbF2yQpIqR/
	3y08qdut10hTyPjxdxeLO4CTtINo6CKNf7mrALoX2Eimw6W7rKQbBknW729xEoDoZQV/
	1pxodDhiKUTzuPJI0o3YPH3WM+H8ayAP/Mo/wULsHuRLC7a/ANZu/qX7yKQ9V3GA/WCm
	JI9A==
X-Gm-Message-State: APjAAAUfsjzMAsS6bcv5q36dNfggp37I9gc8C9sgg/XxEJEw08zFdPie
	wI6YYmWL94g5W4twJGNxKh9k5OTc4/8=
X-Google-Smtp-Source: APXvYqxEvovDKvnorpV7jKY5vJ5N28D4GD/pNVfka+Z+ARgN4isRtnTVOCzfkt54GbkLHNkwBsc+2A==
X-Received: by 2002:a17:90a:8a11:: with SMTP id
	w17mr6785805pjn.136.1574286624014; 
	Wed, 20 Nov 2019 13:50:24 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::d61])
	by smtp.gmail.com with ESMTPSA id
	k84sm349105pfd.157.2019.11.20.13.50.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 20 Nov 2019 13:50:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Nov 2019 13:50:09 -0800
Message-Id: <20191120215009.1723062-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH V2] libkcapi: Update patch to upstream submitted one
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Nov 2019 21:50:23 -0000
Content-Transfer-Encoding: 8bit

Use builtin_bswap32 with clang if available

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Use builtin_bswap32 with clang if available

 ...uiltin_bswap32-on-Clang-if-supported.patch | 32 +++++++++++++++++++
 .../0001-kcapi-kdf-Move-code-to-fix.patch     | 24 +++++++-------
 .../recipes-crypto/libkcapi/libkcapi_git.bb   |  1 +
 3 files changed, 46 insertions(+), 11 deletions(-)
 create mode 100644 meta-oe/recipes-crypto/libkcapi/libkcapi/0001-Use-__builtin_bswap32-on-Clang-if-supported.patch

diff --git a/meta-oe/recipes-crypto/libkcapi/libkcapi/0001-Use-__builtin_bswap32-on-Clang-if-supported.patch b/meta-oe/recipes-crypto/libkcapi/libkcapi/0001-Use-__builtin_bswap32-on-Clang-if-supported.patch
new file mode 100644
index 0000000000..83b16f2e2f
--- /dev/null
+++ b/meta-oe/recipes-crypto/libkcapi/libkcapi/0001-Use-__builtin_bswap32-on-Clang-if-supported.patch
@@ -0,0 +1,32 @@
+From 36637cd802fac9402be76f2a9358a26b7f6aa530 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 20 Nov 2019 13:41:39 -0800
+Subject: [PATCH] Use __builtin_bswap32 on Clang if supported
+
+clang pretends to be gcc 4.2.1 so GCC_VERSION macro will decide that
+__builtin_bswap32 is not supported on clang, whereas in reality it might
+so its better to add a check for enquiring clang if it supports
+__builtin_bswap32 or not
+
+Upstream-Status: Submitted [https://github.com/smuellerDD/libkcapi/pull/83]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/kcapi-kdf.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/kcapi-kdf.c b/lib/kcapi-kdf.c
+index 9e53a0b..428ecaf 100644
+--- a/lib/kcapi-kdf.c
++++ b/lib/kcapi-kdf.c
+@@ -57,7 +57,7 @@
+ #define GCC_VERSION (__GNUC__ * 10000		\
+ 		     + __GNUC_MINOR__ * 100	\
+ 		     + __GNUC_PATCHLEVEL__)
+-#if GCC_VERSION >= 40400
++#if GCC_VERSION >= 40400 || (defined(__clang__) && __has_builtin(__builtin_bswap32))
+ # define __HAVE_BUILTIN_BSWAP32__
+ #endif
+ 
+-- 
+2.24.0
+
diff --git a/meta-oe/recipes-crypto/libkcapi/libkcapi/0001-kcapi-kdf-Move-code-to-fix.patch b/meta-oe/recipes-crypto/libkcapi/libkcapi/0001-kcapi-kdf-Move-code-to-fix.patch
index 3dd7ea7f9b..7ed9caf096 100644
--- a/meta-oe/recipes-crypto/libkcapi/libkcapi/0001-kcapi-kdf-Move-code-to-fix.patch
+++ b/meta-oe/recipes-crypto/libkcapi/libkcapi/0001-kcapi-kdf-Move-code-to-fix.patch
@@ -1,4 +1,4 @@
-From 00c1654e368f728b213c4e3782045d54098edb25 Mon Sep 17 00:00:00 2001
+From 8f961521add49278b48c9721fc53e05ee3543b74 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 16 Nov 2019 23:03:51 -0800
 Subject: [PATCH] kcapi-kdf: Move code to fix
@@ -6,13 +6,14 @@ Subject: [PATCH] kcapi-kdf: Move code to fix
 Fixes clang build
 unused function '_bswap32' [-Werror,-Wunused-function]
 
+Upstream-Status: Submitted [https://github.com/smuellerDD/libkcapi/pull/83]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- lib/kcapi-kdf.c | 36 ++++++++++++++++--------------------
- 1 file changed, 16 insertions(+), 20 deletions(-)
+ lib/kcapi-kdf.c | 37 +++++++++++++++++--------------------
+ 1 file changed, 17 insertions(+), 20 deletions(-)
 
 diff --git a/lib/kcapi-kdf.c b/lib/kcapi-kdf.c
-index ea39846..8e4a636 100644
+index ea39846..9e53a0b 100644
 --- a/lib/kcapi-kdf.c
 +++ b/lib/kcapi-kdf.c
 @@ -54,6 +54,20 @@
@@ -26,17 +27,17 @@ index ea39846..8e4a636 100644
 +# define __HAVE_BUILTIN_BSWAP32__
 +#endif
 +
-+#ifdef __HAVE_BUILTIN_BSWAP32__
-+# define be_bswap32(x) (uint32_t)__builtin_bswap32((uint32_t)(x))
 +/* Endian dependent byte swap operations.  */
-+#elif  __BYTE_ORDER__ ==  __ORDER_BIG_ENDIAN__
++#if  __BYTE_ORDER__ ==  __ORDER_BIG_ENDIAN__
 +# define be_bswap32(x) ((uint32_t)(x))
 +#elif __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
-+
++# ifdef __HAVE_BUILTIN_BSWAP32__
++#  define be_bswap32(x) (uint32_t)__builtin_bswap32((uint32_t)(x))
++# else
  static inline uint32_t rol32(uint32_t x, int n)
  {
  	return ( (x << (n&(32-1))) | (x >> ((32-n)&(32-1))) );
-@@ -68,27 +82,9 @@ static inline uint32_t _bswap32(uint32_t x)
+@@ -68,27 +82,10 @@ static inline uint32_t _bswap32(uint32_t x)
  {
  	return ((rol32(x, 8) & 0x00ff00ffL) | (ror32(x, 8) & 0xff00ff00L));
  }
@@ -59,10 +60,11 @@ index ea39846..8e4a636 100644
 -# define be_bswap32(x) ((uint32_t)(x))
 -#elif __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
 -# define be_bswap32(x) _swap32(x)
-+# define be_bswap32(x) _bswap32(x)
++#  define be_bswap32(x) _bswap32(x)
++# endif
  #else
 -#error "Endianess not defined"
-+# error "Neither builtin_bswap32 nor endianess defined"
++# error "endianess not defined"
  #endif
  
  DSO_PUBLIC
diff --git a/meta-oe/recipes-crypto/libkcapi/libkcapi_git.bb b/meta-oe/recipes-crypto/libkcapi/libkcapi_git.bb
index aa438e5859..4e217a351d 100644
--- a/meta-oe/recipes-crypto/libkcapi/libkcapi_git.bb
+++ b/meta-oe/recipes-crypto/libkcapi/libkcapi_git.bb
@@ -11,6 +11,7 @@ PV = "1.1.5"
 SRC_URI = " \
     git://github.com/smuellerDD/libkcapi.git \
     file://0001-kcapi-kdf-Move-code-to-fix.patch \
+    file://0001-Use-__builtin_bswap32-on-Clang-if-supported.patch \
 "
 
 inherit autotools
-- 
2.24.0



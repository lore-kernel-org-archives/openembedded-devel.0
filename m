Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.7888.1595675595565919643
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Jul 2020 04:13:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=a0P/y2Dx;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.170, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f170.google.com with SMTP id r19so12445658ljn.12
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Jul 2020 04:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aAb90OYmpxXsELC5pwv++GvjtxRCUX147bkTO5XkqEQ=;
        b=a0P/y2Dxs9wRzBCqM3jrWJYv6hlkHCiGaSS7RMpyUSPokLy+W3K0aHI9bHlQKyYqbk
         00L4Q2w2pqLgJ8YvxESKoJxfUPu+e6tsxWUq8mLvm4wyWciAb21BU8MXsp7MLQAyIIwt
         qnlS95HwiSFe7zWdfe5BfQR42LbnTC5it8oHeVAZmXrmL6YSrGMSlhtbkOWRmNu6l+Hr
         kXS+aMaiRbj4cZr0Yx47cDusTG6++pTHrMg4zCX/44RYCvTeDJ+aOK44nRBJ6YkQkQSB
         FxUuWLPoSLxRX9qnJqhEm6Mx7un2MHIIZQ8u8Eg6JAcem7unrWuocgnaonWxiAZnp0cM
         ckUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aAb90OYmpxXsELC5pwv++GvjtxRCUX147bkTO5XkqEQ=;
        b=LBOmZnC4ilcjhZqshR6a3M/Q7AFN8BNkCFBmjSNzBQFKKbPgjBVAzM8Buus0cII7UG
         CLnjP4AZqLDlNs5iXk8rJrgNmt1fFVAlLWkijO0WHDwiuHs+yJ4+eGsx6tN4M3bxWPil
         CoHaj8niE7tEd9/lcY1iUwUCDQgH6OGlJUKVUXx3R2ZvwuYZeIhALpMhMrUkCc+6QZAa
         ualpzstpfcDcVWTYjJ6oD9qJ0a/oHuS2J3+juix/mYMRqWFyrM+oqF9yYBPb1IKkMIKf
         P0moH03NuZgZ+LCNjZVXkSKbLlBv6A70ixijPpJPmEYw+IBRLNzG6kyU6nRNBkUkagbB
         QzAg==
X-Gm-Message-State: AOAM530ZCb1rCs1NZPonhJJ7l7r9abzRBmOrVOuNz+yjRFLp8dbg/F3J
	mhRve1SbyGASr8sgRkO1giOBL/RE0qA=
X-Google-Smtp-Source: ABdhPJxBHLzOgy8YeDdxaNk4NXxiloNYf4jMDNvpQ3uggM/SUkLh1ADPbaRLDLYXXkjNsw4MYc4xzg==
X-Received: by 2002:a2e:b4d8:: with SMTP id r24mr6157634ljm.19.1595675593041;
        Sat, 25 Jul 2020 04:13:13 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id l4sm946178ljc.83.2020.07.25.04.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2020 04:13:12 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] libkcapi: update to 1.2.0
Date: Sat, 25 Jul 2020 13:13:10 +0200
Message-Id: <20200725111310.2169049-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed patches were upstreamed.

License checksum changed due to modified copyright years
(see @8397f0f7c45264a).

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...uiltin_bswap32-on-Clang-if-supported.patch | 39 ----------
 .../0001-kcapi-kdf-Move-code-to-fix.patch     | 73 -------------------
 .../{libkcapi_git.bb => libkcapi_1.2.0.bb}    | 11 +--
 3 files changed, 3 insertions(+), 120 deletions(-)
 delete mode 100644 meta-oe/recipes-crypto/libkcapi/libkcapi/0001-Use-__builtin_bswap32-on-Clang-if-supported.patch
 delete mode 100644 meta-oe/recipes-crypto/libkcapi/libkcapi/0001-kcapi-kdf-Move-code-to-fix.patch
 rename meta-oe/recipes-crypto/libkcapi/{libkcapi_git.bb => libkcapi_1.2.0.bb} (72%)

diff --git a/meta-oe/recipes-crypto/libkcapi/libkcapi/0001-Use-__builtin_bswap32-on-Clang-if-supported.patch b/meta-oe/recipes-crypto/libkcapi/libkcapi/0001-Use-__builtin_bswap32-on-Clang-if-supported.patch
deleted file mode 100644
index e713665ab3..0000000000
--- a/meta-oe/recipes-crypto/libkcapi/libkcapi/0001-Use-__builtin_bswap32-on-Clang-if-supported.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 7b5dd67fee58f9f54c8a676abe2131776c0a3c52 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 20 Nov 2019 13:41:39 -0800
-Subject: [PATCH] Use __builtin_bswap32 on Clang if supported
-
-clang pretends to be gcc 4.2.1 so GCC_VERSION macro will decide that
-__builtin_bswap32 is not supported on clang, whereas in reality it might
-so its better to add a check for enquiring clang if it supports
-__builtin_bswap32 or not
-
-Upstream-Status: Submitted [https://github.com/smuellerDD/libkcapi/pull/83]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lib/kcapi-kdf.c | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/lib/kcapi-kdf.c b/lib/kcapi-kdf.c
-index 9e53a0b..f32fbe9 100644
---- a/lib/kcapi-kdf.c
-+++ b/lib/kcapi-kdf.c
-@@ -54,10 +54,14 @@
- #include "kcapi.h"
- #include "internal.h"
- 
-+#ifndef __has_builtin
-+# define __has_builtin(x) 0
-+#endif
-+
- #define GCC_VERSION (__GNUC__ * 10000		\
- 		     + __GNUC_MINOR__ * 100	\
- 		     + __GNUC_PATCHLEVEL__)
--#if GCC_VERSION >= 40400
-+#if GCC_VERSION >= 40400 || (defined(__clang__) && __has_builtin(__builtin_bswap32))
- # define __HAVE_BUILTIN_BSWAP32__
- #endif
- 
--- 
-2.24.0
-
diff --git a/meta-oe/recipes-crypto/libkcapi/libkcapi/0001-kcapi-kdf-Move-code-to-fix.patch b/meta-oe/recipes-crypto/libkcapi/libkcapi/0001-kcapi-kdf-Move-code-to-fix.patch
deleted file mode 100644
index 7ed9caf096..0000000000
--- a/meta-oe/recipes-crypto/libkcapi/libkcapi/0001-kcapi-kdf-Move-code-to-fix.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From 8f961521add49278b48c9721fc53e05ee3543b74 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 16 Nov 2019 23:03:51 -0800
-Subject: [PATCH] kcapi-kdf: Move code to fix
-
-Fixes clang build
-unused function '_bswap32' [-Werror,-Wunused-function]
-
-Upstream-Status: Submitted [https://github.com/smuellerDD/libkcapi/pull/83]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lib/kcapi-kdf.c | 37 +++++++++++++++++--------------------
- 1 file changed, 17 insertions(+), 20 deletions(-)
-
-diff --git a/lib/kcapi-kdf.c b/lib/kcapi-kdf.c
-index ea39846..9e53a0b 100644
---- a/lib/kcapi-kdf.c
-+++ b/lib/kcapi-kdf.c
-@@ -54,6 +54,20 @@
- #include "kcapi.h"
- #include "internal.h"
- 
-+#define GCC_VERSION (__GNUC__ * 10000		\
-+		     + __GNUC_MINOR__ * 100	\
-+		     + __GNUC_PATCHLEVEL__)
-+#if GCC_VERSION >= 40400
-+# define __HAVE_BUILTIN_BSWAP32__
-+#endif
-+
-+/* Endian dependent byte swap operations.  */
-+#if  __BYTE_ORDER__ ==  __ORDER_BIG_ENDIAN__
-+# define be_bswap32(x) ((uint32_t)(x))
-+#elif __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
-+# ifdef __HAVE_BUILTIN_BSWAP32__
-+#  define be_bswap32(x) (uint32_t)__builtin_bswap32((uint32_t)(x))
-+# else
- static inline uint32_t rol32(uint32_t x, int n)
- {
- 	return ( (x << (n&(32-1))) | (x >> ((32-n)&(32-1))) );
-@@ -68,27 +82,10 @@ static inline uint32_t _bswap32(uint32_t x)
- {
- 	return ((rol32(x, 8) & 0x00ff00ffL) | (ror32(x, 8) & 0xff00ff00L));
- }
--
--#define GCC_VERSION (__GNUC__ * 10000		\
--		     + __GNUC_MINOR__ * 100	\
--		     + __GNUC_PATCHLEVEL__)
--#if GCC_VERSION >= 40400
--# define __HAVE_BUILTIN_BSWAP32__
--#endif
--
--#ifdef __HAVE_BUILTIN_BSWAP32__
--# define _swap32(x) (uint32_t)__builtin_bswap32((uint32_t)(x))
--#else
--# define _swap32(x) _bswap32(x)
--#endif
--
--/* Endian dependent byte swap operations.  */
--#if __BYTE_ORDER__ ==  __ORDER_BIG_ENDIAN__
--# define be_bswap32(x) ((uint32_t)(x))
--#elif __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
--# define be_bswap32(x) _swap32(x)
-+#  define be_bswap32(x) _bswap32(x)
-+# endif
- #else
--#error "Endianess not defined"
-+# error "endianess not defined"
- #endif
- 
- DSO_PUBLIC
--- 
-2.24.0
-
diff --git a/meta-oe/recipes-crypto/libkcapi/libkcapi_git.bb b/meta-oe/recipes-crypto/libkcapi/libkcapi_1.2.0.bb
similarity index 72%
rename from meta-oe/recipes-crypto/libkcapi/libkcapi_git.bb
rename to meta-oe/recipes-crypto/libkcapi/libkcapi_1.2.0.bb
index 4e217a351d..b478e4c580 100644
--- a/meta-oe/recipes-crypto/libkcapi/libkcapi_git.bb
+++ b/meta-oe/recipes-crypto/libkcapi/libkcapi_1.2.0.bb
@@ -1,18 +1,13 @@
 SUMMARY = "Linux Kernel Crypto API User Space Interface Library"
 HOMEPAGE = "http://www.chronox.de/libkcapi.html"
 LICENSE = "BSD | GPL-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=14d5a68b28755c04ebdba226e888b157"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c78be93ed8d1637f2a3f4a83ff9d5f54"
 
 DEPENDS = "libtool"
 
 S = "${WORKDIR}/git"
-SRCREV = "5649050d201856bf06c8738b5d2aa1710c86ac2f"
-PV = "1.1.5"
-SRC_URI = " \
-    git://github.com/smuellerDD/libkcapi.git \
-    file://0001-kcapi-kdf-Move-code-to-fix.patch \
-    file://0001-Use-__builtin_bswap32-on-Clang-if-supported.patch \
-"
+SRCREV = "8397f0f7c45264a3b9aff5a1f9119df25eeb4c60"
+SRC_URI = "git://github.com/smuellerDD/libkcapi.git"
 
 inherit autotools
 
-- 
2.25.1


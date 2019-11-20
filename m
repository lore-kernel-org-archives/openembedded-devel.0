Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id F36DC7F7DD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2019 21:26:07 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id 15so373450pgh.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2019 13:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=AWk50x/wDaFcqGPidrcbGMhg6OBx+Y9luU+GaZUJkaY=;
	b=X9CMRsCirouko8e39GaAphUWM9WQjWAXrsV3nrHiwqKOVW8NEwHQFArNOluH0oK7ZX
	KyXgfHMz0/6chv2F1kdEvYkUGIlahg+mp4DTY8aj3dbzvOx8bxAnc00XdDU1MQduGZum
	d/jBh1J06cF1K0+KF8THWI5u7XLYG6YI5OSuV/RU2kvcUE/Uz6tGCMCk9+nyXfRl4Wue
	RL2aunK2i0r5GBlvjMUXcAZTD2QXqEjNXmO5aWGMrT2eq2HGlPh+wMB0sfIRH52oxNqj
	DOFZA9qyKnTgVblkj5MOx90Vu+LLM2SjiyAc9ukfN84uB3zQut6vLAMWPpixSbuMK4tV
	vWxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=AWk50x/wDaFcqGPidrcbGMhg6OBx+Y9luU+GaZUJkaY=;
	b=EuInomM4FCehNuQ5Vz2dCQ7cEsAmJElnsHcXjyfoyBFEUNpVBffz33JBmshwwN40rn
	GSz2fMvOCQZeAj7zZFqCbwXYslyzlxhCw52/cOFzlJsbklB2WLgxo93CrgQDDIBDZvCb
	2KdDP9li5AyYNtG7Rh1bO8TK6fjx1Nrk8fwlAi3EZ1Ea5ytA/L3DX6l8hvSuYOYj9L9G
	+IwVI07m0SuwZAjNxUD8Id2b3TUo2X77iMqzS6zH6AllQtCVsPdjlsnRUnuik0UqtJHi
	0Na5iPuK+/fxCNONfNCAPf2lmzSHQCrOvpH4Lwdpy8VOJy4JJ2fst7k7Yico5SPoLRDZ
	izdw==
X-Gm-Message-State: APjAAAU5/N2i9UdfilgzUUZv78n0QjyKxApJBv9Oi4EmpBn99sFixTyV
	e6WoU/LuawoppV6iHpKiNZLxPUmDV/M=
X-Google-Smtp-Source: APXvYqy7zPYzb13+25v7jcIL4Y5lNHkNw6hXJfQnmqACwmnw+faB4k9nx3WR9qVkiE8YQMSd+moS4w==
X-Received: by 2002:a65:6249:: with SMTP id q9mr5749955pgv.340.1574285168234; 
	Wed, 20 Nov 2019 13:26:08 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::d61])
	by smtp.gmail.com with ESMTPSA id
	w138sm340135pfc.68.2019.11.20.13.26.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 20 Nov 2019 13:26:07 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Nov 2019 13:25:56 -0800
Message-Id: <20191120212556.1443911-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] libkcapi: Update patch to upstream submitted one
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
X-List-Received-Date: Wed, 20 Nov 2019 21:26:08 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-kcapi-kdf-Move-code-to-fix.patch     | 24 ++++++++++---------
 1 file changed, 13 insertions(+), 11 deletions(-)

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
-- 
2.24.0



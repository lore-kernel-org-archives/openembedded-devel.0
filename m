Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
	[209.85.216.50])
	by mail.openembedded.org (Postfix) with ESMTP id 9E7447F699
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Nov 2019 05:04:06 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id f7so1117495pjw.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Nov 2019 21:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=jS7eOaMY19S2i32JPKviCii1qq3euas8FzD2sxosSFM=;
	b=j52i5Q8Sfq4pcv6YE7N35vGist/D/S0ZHJ52MB5Myce0IdfO4UgJjHevF0i2NhoJxP
	4vbSg3f98+EzyClCBd4y2txso5sihiJOJiAh/p8CELvASq9Hfu6SBTSoWUxRsNi0hp6w
	bSlorqTIXb6Y/Kn40XCFXcOqUicUwwtrIIT+wzFg+XPwhK2bx+es2sZnCoddhR5Wx2k2
	CHVdPW1uyNXDmzOH9AeJbehsH4aXEf6I/jZMOPHxJUuUDvMzKJmIQx+vIVKJ+z7GI0M4
	HFoBv81Dna+G9C+GCaRPDe0AzgZj5EjfMe91jsuEU70wcbYhS9585iFQf/0lsqC5G6P7
	KuKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=jS7eOaMY19S2i32JPKviCii1qq3euas8FzD2sxosSFM=;
	b=WVJ/oYdySA6k9X5iJUumDYrZYWIK0GwEMF5dCceMWlNAHVSSNCHx8WixHyYEInKPNR
	8GFZ1dXHDzqmOkwQGY1nLYmplOswVJ2UaDIS2nDbU6q31/MdauXxgctraiv/SJESmxIb
	nFfJlAFedjIGfbnGuvSKxALa4nPzXCpeS+rHDDyGZOGO3/1pv5OwiDK6aqaYB+ZUtdtM
	vrgp2R64RQtUIxb12mE5xnLATvZEXE2fQqjH+tuXmhR+TRLozqN1nUIiA1ktR2Z1e2W5
	I7DOfmpD/a7uVw3kX7MOvDVI2wuJa4GtvqTyT3yQtW9RBQddIwqElfPs2OdMhsgLc2bV
	Nj8Q==
X-Gm-Message-State: APjAAAWXMlmTC3wvGLgVduhw/Tch7FwcbqIpcCuyOjLDIo32Zd8owAuF
	rvfSjKje3jLNcy2z5jwBqktZ2Jnywkc=
X-Google-Smtp-Source: APXvYqxXAFtL7qgpZN2ZwNeHPtlGW0e3EsqbOcLDUvJ2NxYmP+KREPDWCxCOwxDJt08tKzsdU5bJyQ==
X-Received: by 2002:a17:90a:ae01:: with SMTP id
	t1mr37438041pjq.32.1574053447061; 
	Sun, 17 Nov 2019 21:04:07 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::30e8])
	by smtp.gmail.com with ESMTPSA id
	y6sm16881131pfm.12.2019.11.17.21.04.06
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 17 Nov 2019 21:04:06 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Nov 2019 21:03:49 -0800
Message-Id: <20191118050352.1379153-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191118050352.1379153-1-raj.khem@gmail.com>
References: <20191118050352.1379153-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/5] libkcapi: Move static inline functions where used
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
X-List-Received-Date: Mon, 18 Nov 2019 05:04:06 -0000
Content-Transfer-Encoding: 8bit

Clang warns about unused functions on some arches e.g. mips
unused function '_bswap32' [-Werror,-Wunused-function]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-kcapi-kdf-Move-code-to-fix.patch     | 67 +++++++++++++++++++
 .../recipes-crypto/libkcapi/libkcapi_git.bb   |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta-oe/recipes-crypto/libkcapi/libkcapi/0001-kcapi-kdf-Move-code-to-fix.patch

diff --git a/meta-oe/recipes-crypto/libkcapi/libkcapi/0001-kcapi-kdf-Move-code-to-fix.patch b/meta-oe/recipes-crypto/libkcapi/libkcapi/0001-kcapi-kdf-Move-code-to-fix.patch
new file mode 100644
index 0000000000..3801207ed9
--- /dev/null
+++ b/meta-oe/recipes-crypto/libkcapi/libkcapi/0001-kcapi-kdf-Move-code-to-fix.patch
@@ -0,0 +1,67 @@
+From bf6c816ef61240a1dbbbf6f2a7b2a5ad5f846461 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 16 Nov 2019 23:03:51 -0800
+Subject: [PATCH] kcapi-kdf: Move code to fix
+
+Fixes clang build
+unused function '_bswap32' [-Werror,-Wunused-function]
+
+Upstream-Status: Submitted [https://github.com/smuellerDD/libkcapi/pull/83]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/kcapi-kdf.c | 32 +++++++++++++++++---------------
+ 1 file changed, 17 insertions(+), 15 deletions(-)
+
+diff --git a/lib/kcapi-kdf.c b/lib/kcapi-kdf.c
+index ea39846..49c2d88 100644
+--- a/lib/kcapi-kdf.c
++++ b/lib/kcapi-kdf.c
+@@ -54,21 +54,6 @@
+ #include "kcapi.h"
+ #include "internal.h"
+ 
+-static inline uint32_t rol32(uint32_t x, int n)
+-{
+-	return ( (x << (n&(32-1))) | (x >> ((32-n)&(32-1))) );
+-}
+-
+-static inline uint32_t ror32(uint32_t x, int n)
+-{
+-	return ( (x >> (n&(32-1))) | (x << ((32-n)&(32-1))) );
+-}
+-
+-static inline uint32_t _bswap32(uint32_t x)
+-{
+-	return ((rol32(x, 8) & 0x00ff00ffL) | (ror32(x, 8) & 0xff00ff00L));
+-}
+-
+ #define GCC_VERSION (__GNUC__ * 10000		\
+ 		     + __GNUC_MINOR__ * 100	\
+ 		     + __GNUC_PATCHLEVEL__)
+@@ -86,6 +71,23 @@ static inline uint32_t _bswap32(uint32_t x)
+ #if __BYTE_ORDER__ ==  __ORDER_BIG_ENDIAN__
+ # define be_bswap32(x) ((uint32_t)(x))
+ #elif __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
++
++static inline uint32_t rol32(uint32_t x, int n)
++{
++	return ( (x << (n&(32-1))) | (x >> ((32-n)&(32-1))) );
++}
++
++static inline uint32_t ror32(uint32_t x, int n)
++{
++	return ( (x >> (n&(32-1))) | (x << ((32-n)&(32-1))) );
++}
++
++
++static inline uint32_t _bswap32(uint32_t x)
++{
++	return ((rol32(x, 8) & 0x00ff00ffL) | (ror32(x, 8) & 0xff00ff00L));
++}
++
+ # define be_bswap32(x) _swap32(x)
+ #else
+ #error "Endianess not defined"
+-- 
+2.24.0
+
diff --git a/meta-oe/recipes-crypto/libkcapi/libkcapi_git.bb b/meta-oe/recipes-crypto/libkcapi/libkcapi_git.bb
index 799070972a..aa438e5859 100644
--- a/meta-oe/recipes-crypto/libkcapi/libkcapi_git.bb
+++ b/meta-oe/recipes-crypto/libkcapi/libkcapi_git.bb
@@ -10,6 +10,7 @@ SRCREV = "5649050d201856bf06c8738b5d2aa1710c86ac2f"
 PV = "1.1.5"
 SRC_URI = " \
     git://github.com/smuellerDD/libkcapi.git \
+    file://0001-kcapi-kdf-Move-code-to-fix.patch \
 "
 
 inherit autotools
-- 
2.24.0



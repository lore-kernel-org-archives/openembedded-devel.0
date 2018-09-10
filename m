Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id 5FA3279819
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Sep 2018 06:55:48 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id b12-v6so9269471plr.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Sep 2018 23:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gC0JsvdMUfHVRLP22Vy+XIv4A+h4HSA8WOieLphQj24=;
	b=sRTa92hCXfAgWgz0Yg+U5mo34bCDXLJ2m3uyqm0egl1xttN8KatYHmxw2fcs9m2s9t
	aI/3XlQn/egdggE6+Y86ta01JYbaUB5Nn+TKJWhFMwgViGzqDgxeycYEyE4i/7c7rUcc
	utvd3kjkV5+H6nToAbDx4N2+jb04wcmLouYLC+gScdVpHiA7PY9cUNe+uB8cW9Dz2jvD
	rJo+kyMheJmgyN69ztkb+vvJoI0YxD3SDrI4DuncnLPDSrJu6dl8tEHlOXUwTocs1KQh
	ku80E5t1NEUswlaXm8h9TCjlF0B6hu4IUu7LfVv2z0vTxG2uat6johsQG+x6UIWLS/YU
	zrpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=gC0JsvdMUfHVRLP22Vy+XIv4A+h4HSA8WOieLphQj24=;
	b=BIyESz83mZi9L/zbjaSHd/2GaYWsCp+U+rafjKjFIeYUZ1JFJwUxAsfQheV2qZmgcG
	+BMEd5l5+xgcBp2GnrVdNm0JUvTwzMF0P0bRbYLMpjRNtEE3eiijmOI/LOiWfTvY2vQx
	fQlSmXp6YXk1ekHFBJNDQVKT//+1HFqQSA6T4+Z+9m/wdoA1zxB/w6OmK9ZpSiuargPQ
	c02tCTpY8AdHbEYwsrJnYzyZA/QJx/QHsQgot8O5TzS2kbrHGIZ+phUJuyLYGYAW/NBa
	ZxIfCYovGhYTEmWVABoW+feQPn4i8FNP59MUhAppToLnUZp458w6ihV+qkuaNpmr7+ll
	V75g==
X-Gm-Message-State: APzg51Ax25FD0E7nNtmmWrKQiAFtBH4WhbpGFYbAkk1ciEcX4FH70RdB
	Fapveh8SaRphydNvp9wHG0i8qA5u
X-Google-Smtp-Source: ANB0VdZa25dTUTI2XZFjjh8ja/GKAf3P4d6g7ucayY8p3cRu+n7+y6LU6KXT51BTGecMeMuVyFVVBg==
X-Received: by 2002:a17:902:9a83:: with SMTP id
	w3-v6mr20669725plp.75.1536562548919; 
	Sun, 09 Sep 2018 23:55:48 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::2887])
	by smtp.gmail.com with ESMTPSA id
	b3-v6sm29610816pgm.74.2018.09.09.23.55.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 09 Sep 2018 23:55:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Sep 2018 23:55:37 -0700
Message-Id: <20180910065537.18612-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180910065537.18612-1-raj.khem@gmail.com>
References: <20180910065537.18612-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] opencv: Fix build on big-endian systems
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
X-List-Received-Date: Mon, 10 Sep 2018 06:55:48 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...001-Add-missing-multi-line-separator.patch | 36 +++++++++++++++++++
 .../recipes-support/opencv/opencv_3.4.3.bb    |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-oe/recipes-support/opencv/opencv/0001-Add-missing-multi-line-separator.patch

diff --git a/meta-oe/recipes-support/opencv/opencv/0001-Add-missing-multi-line-separator.patch b/meta-oe/recipes-support/opencv/opencv/0001-Add-missing-multi-line-separator.patch
new file mode 100644
index 0000000000..513597b8c2
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv/0001-Add-missing-multi-line-separator.patch
@@ -0,0 +1,36 @@
+From 60857229aab13ccc426572a43ab891409bb76ea4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 9 Sep 2018 22:52:55 -0700
+Subject: [PATCH] Add missing multi-line separator
+
+Otherwise this fails to build ( found on mips )
+
+Fixes
+contrib/modules/surface_matching/src/hash_murmur86.hpp:97:15: error:
+expected constructor, destructor, or type conversion before '(' token
+     && defined(__GNUC__) && (__GNUC__>4 || (__GNUC__==4 &&
+__GNUC_MINOR__>=3))
+               ^
+
+Upstream-Status: Submitted [https://github.com/opencv/opencv_contrib/pull/1764]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ modules/surface_matching/src/hash_murmur86.hpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/modules/surface_matching/src/hash_murmur86.hpp b/modules/surface_matching/src/hash_murmur86.hpp
+index 1edf6bf4..0477d37e 100644
+--- a/modules/surface_matching/src/hash_murmur86.hpp
++++ b/modules/surface_matching/src/hash_murmur86.hpp
+@@ -93,7 +93,7 @@ void hashMurmurx86 ( const void * key, const int len, const uint seed, void * ou
+ /* Now find best way we can to READ_UINT32 */
+ #ifndef WORDS_BIGENDIAN
+ # define READ_UINT32(ptr)   (*((uint32_t*)(ptr)))
+-#elif defined(WORDS_BIGENDIAN)
++#elif defined(WORDS_BIGENDIAN) \
+     && defined(__GNUC__) && (__GNUC__>4 || (__GNUC__==4 && __GNUC_MINOR__>=3))
+ # define READ_UINT32(ptr)   (__builtin_bswap32(*((uint32_t*)(ptr))))
+ #endif
+-- 
+2.18.0
+
diff --git a/meta-oe/recipes-support/opencv/opencv_3.4.3.bb b/meta-oe/recipes-support/opencv/opencv_3.4.3.bb
index 5591481b7d..403146e7cd 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.4.3.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.4.3.bb
@@ -46,6 +46,7 @@ SRC_URI = "git://github.com/opencv/opencv.git;name=opencv \
     https://github.com/tiny-dnn/tiny-dnn/archive/v1.0.0a3.tar.gz;destsuffix=git/3rdparty/tinydnn/tiny-dnn-1.0.0a3;name=tinydnn;unpack=false \
     file://0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch \
     file://uselocalxfeatures.patch;patchdir=../contrib/ \
+    file://0001-Add-missing-multi-line-separator.patch;patchdir=../contrib/ \
     file://0002-Make-opencv-ts-create-share-library-intead-of-static.patch \
     file://0003-To-fix-errors-as-following.patch \
     file://fixpkgconfig.patch \
-- 
2.18.0



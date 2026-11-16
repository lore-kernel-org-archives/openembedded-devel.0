Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34334.1794851717138813568
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:55:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=LfynKTRm;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36f8cdd30beso6022165eec.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851716; x=1795456516; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8A3RxjtVxbpRcxNRHtEtz8h0MhFectEuoooo0NuBo4I=;
        b=LfynKTRmas5tlzIW2fwIUfmnIiTFntaE3DtXDB1x7VZwteekOqKr6HGFRRd/BFgLF2
         2fvcq9p4Z0Q8OipHJakkeY8ofCOBaCErUvx+MdsKjYI3hMhT8b5F/b4BSu4zC4PoGqqp
         0863USqReMfCviJB1CxD3NCIkpFfPBo34mSIIsZ6xET7c19plcS1eONu309hV6+fnglB
         XvYwylwSrYFJcXZjjvzJEw0ordDY32M1TdZpSkausnbVH/4rR1dRSw34PiUVy+O+MoOX
         eAPPLo36xxiuIYh7JPnBKG72h8IYPp2OSIKEufbnBd0xx8RyGPC/NabQ09efMg+X2h0Z
         e8xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851716; x=1795456516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8A3RxjtVxbpRcxNRHtEtz8h0MhFectEuoooo0NuBo4I=;
        b=iHrqHIQCtN2SjJTQpEjc01upRw+Kzg+UPGmsuTAXSsIq/YJnPdfUdTwyhHOmj71MbF
         KggYBA4yN5c2dqVQGAGHDiop0mVsOnXkf+TCWli/b9iP5p6nNdwuQC+nZPudfYrF32M8
         O9/+Ax3JwDXgInHthAU6jNDBoAgBtRSGgu8YtXdIqs+NRiOotlQiQFnG4r/Xp3LWI6iA
         4H0c9LElKfMVjSrWNLLmINcGOTnuVEKJpcvaZGumra+T4ZMcInoYSBs6hI4CqZSGLumt
         AcosVCQyY1QUQaarRD3V+TC62afkSVk6ZnbNb262g+B1bjb2X6A5W9AJkaw42s6G2Jif
         N8+Q==
X-Gm-Message-State: APuU4Z+Q56PCYY+UkIQSXV9BdSgNVqGvejPP53C2Frn2xNQBkEmfjnun
	kkJMBY9rBzK6id8jV1mGXmTSAQD6bBsdKuBkVOnsfH6Xto9hllW2Rf056PCstpge
X-Gm-Gg: AZFdTZdk7hQSiIN8dGdtPQ04JgmkPbMiKcZ1x/Z0jEUSwtl/RpJbP3vshWo034PsN9h
	h0sW5Id3a6eNPD92/bfteGW492uicoNjITnCl35mEKRBFvhnmTOd06bixkJwWQJTXpTB5ERT9Ci
	X/5ZmVWKIdD70+HakEo2mJJC3WHY60LDf6uxyTctXz0cjOPFapZLr8N6YVf/J3elYm6Fs6qRaBx
	2z+kvqJdKRJhAi8Fq+X/UhnUxDpe7hpZ9obp6UkT0P5y2+S4Oh8uuW6gDWerkJM+6gSYWX6SZMj
	UKsk2hp2JKJoEghK+clyNdj0SOxdfurNtk3pmEL4gIS0bS8Usv6rBvF4t+Y7At9Y1alpE+0Avff
	zYiry2Foph5Ai/gcHGk7vdgJipPR79u7VdueQ1xQBquNst+6NMxoNZcLb2g2Wx/t4e//d0e5PCn
	+bzVSUJvHjJhtY3uhWiN9M1VqUgpMdf9YjjVPPeOppoFbkV/ResnmIpP2Si3U5eM+sE8ON/m6ez
	xnzigifpX3722vKdYoKZt4cTLPnuFEH7DqGEk6WHN0SA9gFJxr6V2NmC/K721QTTI49fqAKFtrU
	umgT2wQG/DMwODURoT3ql71pmbH28oyv/hhqLSx/HYy8zvhCvoMFNMX2MxkfR6VKXHz2m2dFXR2
	0yztp60tdZ4wOo183wSLhCLtUTFH3a0aGvf9RIDO/WXxRL8JsAoYTOJ9bZDNEUh+Lpixb1xKjwk
	DGikz58d9Q/YUlB6vn5c29QFx96eeCNv5BLtlKvLGX8rNxJs29XvmvKGrLG3S+k7im4GPiaPIGq
	+dx7vHqlUV2J0fa2mlF3jKDy8wPbeTxcuK1QD/1ARfvjY9FLt72MG57OlImvHPSjUl/aKoTbKri
	HJy6
X-Received: by 2002:a05:7300:e78c:b0:381:7ee:d351 with SMTP id 5a478bee46e88-38107eed442mr273308eec.15.1794851716195;
        Mon, 16 Nov 2026 09:55:16 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:55:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 051/105] python3-matplotlib: upgrade 3.10.8 -> 3.11.2
Date: Mon, 16 Nov 2026 09:53:03 -0800
Message-ID: <20261116175359.342679-51-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:55:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132507
Content-Type: text/plain; charset="utf-8"

Matplotlib now bundles libraqm via meson subprojects; build against the
libraqm recipe with -Dsystem-libraqm=true and drop the patch that
disabled the subproject downloads (system freetype/qhull/libraqm need no
wraps).

Changes:
- Text and font processing overhauled using libraqm/HarfBuzz (complex
  text layout). libraqm is bundled and fetched as a meson subproject
  unless -Dsystem-libraqm=true; offline builds need it supplied.
- BREAKING: Python >= 3.11 (was 3.10), NumPy >= 1.25 (was 1.23),
  Pillow >= 9 (was 8), fonttools >= 4.28.2; build requires
  meson-python >= 0.13.2 (!= 0.17.*) and setuptools_scm < 10.
- Improvements to 3D Axes, performance, new accessible color sequences
  and flexible figure management; see upstream API change notes.
- 3.11.1/3.11.2 fix tight layout, 3D axis, PDF/PS font embedding and
  hexbin clipping, GIF skew, Qt/WebAgg HiDPI and Cairo glyph bugs.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...external-dependency-tarballs-via-mes.patch | 47 -------------------
 ...3.10.8.bb => python3-matplotlib_3.11.2.bb} |  6 +--
 2 files changed, 3 insertions(+), 50 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-matplotlib/0001-Do-not-download-external-dependency-tarballs-via-mes.patch
 rename meta-python/recipes-devtools/python/{python3-matplotlib_3.10.8.bb => python3-matplotlib_3.11.2.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-matplotlib/0001-Do-not-download-external-dependency-tarballs-via-mes.patch b/meta-python/recipes-devtools/python/python3-matplotlib/0001-Do-not-download-external-dependency-tarballs-via-mes.patch
deleted file mode 100644
index 144bfac185..0000000000
--- a/meta-python/recipes-devtools/python/python3-matplotlib/0001-Do-not-download-external-dependency-tarballs-via-mes.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From a6b0bc129de493f57bf79005c48a8d4ca0df68c2 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 9 Apr 2025 17:34:55 -0700
-Subject: [PATCH] Do not download external dependency tarballs via meson
-
-They are fetched by bitbake fetcher already
-
-Upstream-Status: Inappropriate [ OE-Specific ]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- subprojects/freetype-2.6.1.wrap | 7 +------
- subprojects/qhull.wrap          | 9 ++-------
- 2 files changed, 3 insertions(+), 13 deletions(-)
-
-diff --git a/subprojects/freetype-2.6.1.wrap b/subprojects/freetype-2.6.1.wrap
-index 763362b..74ecb13 100644
---- a/subprojects/freetype-2.6.1.wrap
-+++ b/subprojects/freetype-2.6.1.wrap
-@@ -1,10 +1,5 @@
- [wrap-file]
--source_url = https://download.savannah.gnu.org/releases/freetype/freetype-old/freetype-2.6.1.tar.gz
--source_fallback_url = https://downloads.sourceforge.net/project/freetype/freetype2/2.6.1/freetype-2.6.1.tar.gz
--source_filename = freetype-2.6.1.tar.gz
--source_hash = 0a3c7dfbda6da1e8fce29232e8e96d987ababbbf71ebc8c75659e4132c367014
--
--patch_directory = freetype-2.6.1-meson
-+directory = freetype-2.6.1
- 
- [provide]
- freetype-2.6.1 = freetype_dep
-diff --git a/subprojects/qhull.wrap b/subprojects/qhull.wrap
-index c52b07d..30b6904 100644
---- a/subprojects/qhull.wrap
-+++ b/subprojects/qhull.wrap
-@@ -1,9 +1,4 @@
- [wrap-file]
--# Also bump the cache key in `.circleci/config.yml`.
--# Also update the docs in `docs/devel/dependencies.rst`.
--directory = qhull-8.0.2
--source_url = https://github.com/qhull/qhull/archive/v8.0.2/qhull-8.0.2.tar.gz
--source_filename = qhull-8.0.2.tgz
--source_hash = 8774e9a12c70b0180b95d6b0b563c5aa4bea8d5960c15e18ae3b6d2521d64f8b
-+directory = qhull-2020.2
- 
--patch_directory = qhull-8.0.2
-+patch_directory = qhull-2020.2
diff --git a/meta-python/recipes-devtools/python/python3-matplotlib_3.10.8.bb b/meta-python/recipes-devtools/python/python3-matplotlib_3.11.2.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-matplotlib_3.10.8.bb
rename to meta-python/recipes-devtools/python/python3-matplotlib_3.11.2.bb
index 8489b91402..80f2853fbd 100644
--- a/meta-python/recipes-devtools/python/python3-matplotlib_3.10.8.bb
+++ b/meta-python/recipes-devtools/python/python3-matplotlib_3.11.2.bb
@@ -14,19 +14,19 @@ DEPENDS = "\
     python3-setuptools-scm-native \
     freetype \
     libpng \
+    libraqm \
     python3-pybind11 \
     qhull \
 "
 
 SRC_URI += "file://run-ptest \
-            file://0001-Do-not-download-external-dependency-tarballs-via-mes.patch \
             file://0001-Change-types-for-width-height-to-match-definitions-i.patch \
             "
-SRC_URI[sha256sum] = "2299372c19d56bcd35cf05a2738308758d32b9eaed2371898d8f5bd33f084aa3"
+SRC_URI[sha256sum] = "cec596316640f2b394b8f0daa0ea61a8eae82d017b620b9f202befb972a59ea4"
 
 inherit pypi pkgconfig python3targetconfig meson ptest-python-pytest
 
-EXTRA_OEMESON += "-Dsystem-freetype=true -Dsystem-qhull=true"
+EXTRA_OEMESON += "-Dsystem-freetype=true -Dsystem-libraqm=true -Dsystem-qhull=true"
 
 # LTO with clang needs lld
 LDFLAGS:append:toolchain-clang = " -fuse-ld=lld"

Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id DF9B079710
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Sep 2018 06:57:38 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id j25-v6so806295wmc.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Sep 2018 23:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=iAQ4xhyWITIRbzsG4JWC/SAHO6MiKiIT0rgCbFm6sj4=;
	b=ErBE1qOLlUTuVMGplOu+zraqiFg7Mixxp9RGnrxb3SwTOZcQv/pyHYwPly9y1zeMkz
	frmeEQ+e3b3PKOWkMPki0LM/zzk2tLIcqzCCXjtWgOcHiGt5yhjxkmF2MxBzso/ljhP7
	kpd/UBjAHzCg1seULgsrbwecMUxHmc81+ouwLB6GhVuclEwN0ROwA9oMSh40mXrShSyr
	LD8d1MU5R4uPgQ2/+sWAxBDWuvCqaZEqgBZOGGMRR2u2c2REq2tHcbw59jSNpAWq4s6p
	s2ZI4h5zhzKVjUMI5/G5rOLd6HLhnQL904oyco6N1Vyazco7ssTf8Z0XwliYevL5Z4VB
	ucEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=iAQ4xhyWITIRbzsG4JWC/SAHO6MiKiIT0rgCbFm6sj4=;
	b=dIun9gqT2nrGg271hZ81BooRbj0aopcnLF0/cf5xAjSlDLKfrbjnsQwmVGufcL207S
	/L5Xh7uUHhmsGM92aIdmw6PJ8hKU696rmkFz0YfXk70qlFgKhwFoje2JL+IqExAJejff
	bCpVaFpIVgZP1hCHmbMfajhW1WFEuV9NrPtHsivdYuVlvxgwqQgGGCQThEqwhBn56lzE
	lwi+kwz4OwmTXz4tNDIzUg7VufAXv12WbXf2w8gc+jOY9g50i8tceag1NVqsyGVWw9Qp
	yY2BYGP1rqwRxPlZsxVb6MBk/UPzweFlG5A86ye+Nng+RmLNGlKllAYftHemgN0rH5zV
	qqNg==
X-Gm-Message-State: APzg51BVlREk4ETKdQJUXqB1P+Fyd2z4ip9Rh2RzEs9KsRkiFZ+Op+eB
	fU51gNn6i4TIGTAQiDjLL0KQDILm
X-Google-Smtp-Source: ANB0VdaU87N4xuvbUijEXaGBx+JVh2J0Mi9MB+lmtSYN4lmIF6vzaxWQe68nsd9t/j927WhxEbdlhw==
X-Received: by 2002:a1c:dc1:: with SMTP id
	184-v6mr4449524wmn.145.1536821859294; 
	Wed, 12 Sep 2018 23:57:39 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	u65-v6sm4486035wmd.31.2018.09.12.23.57.38
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 12 Sep 2018 23:57:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Sep 2018 06:57:37 +0000
Message-Id: <20180913065737.280-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][PATCH] spice: cleanup leftover patch from upgrade to 0.13.90
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
X-List-Received-Date: Thu, 13 Sep 2018 06:57:39 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...d-allow-separated-src-and-build-dirs.patch | 33 -------------------
 .../recipes-support/spice/spice_git.bb        |  4 ---
 2 files changed, 37 deletions(-)
 delete mode 100644 meta-networking/recipes-support/spice/spice/0001-build-allow-separated-src-and-build-dirs.patch

diff --git a/meta-networking/recipes-support/spice/spice/0001-build-allow-separated-src-and-build-dirs.patch b/meta-networking/recipes-support/spice/spice/0001-build-allow-separated-src-and-build-dirs.patch
deleted file mode 100644
index 8d246cc7f3..0000000000
--- a/meta-networking/recipes-support/spice/spice/0001-build-allow-separated-src-and-build-dirs.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 812a1a099cc48edcf1280fc329bf5330237f3cc2 Mon Sep 17 00:00:00 2001
-From: Mark Asselstine <mark.asselstine@windriver.com>
-Date: Thu, 1 May 2014 12:09:16 -0400
-Subject: [PATCH] build: allow separated src and build dirs
-
-We need to expland the list of include dirs to include the build dir since
-generated files will be created there instead of in the src dir.
-
-We also don't want to force using $srcdir for generated files as this will
-allow them to be created in the build dir. We account for the slight
-deviation in the generated files with expanded include paths.
-
-Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 483dbfdf..7d990aaa 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -138,7 +138,7 @@ dnl =========================================================================
- dnl Check deps
- 
- AC_CONFIG_SUBDIRS([spice-common])
--COMMON_CFLAGS='-I ${top_srcdir}/spice-common/ -I ${top_builddir}/spice-common/'
-+COMMON_CFLAGS='-I ${top_srcdir}/spice-common/ -I ${top_srcdir}/spice-common/common/ -I ${top_srcdir}/spice-common/spice-protocol/ -I ${top_builddir}/spice-common/'
- COMMON_CFLAGS="$COMMON_CFLAGS -DG_LOG_DOMAIN=\\\"Spice\\\""
- AC_SUBST(COMMON_CFLAGS)
- 
--- 
-2.14.1
-
diff --git a/meta-networking/recipes-support/spice/spice_git.bb b/meta-networking/recipes-support/spice/spice_git.bb
index c7e4b03292..1ad46c2c31 100644
--- a/meta-networking/recipes-support/spice/spice_git.bb
+++ b/meta-networking/recipes-support/spice/spice_git.bb
@@ -27,10 +27,6 @@ SRC_URI = " \
     file://0001-spice-fix-compile-fail-problem.patch \
 "
 
-FOO = "\
-    file://0001-build-allow-separated-src-and-build-dirs.patch \
-"
-
 S = "${WORKDIR}/git"
 
 inherit autotools gettext pythonnative python-dir pkgconfig
-- 
2.17.1



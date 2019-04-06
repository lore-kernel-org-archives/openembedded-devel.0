Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id AC4F26079F
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  6 Apr 2019 23:59:33 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id p6so5103813pgh.9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Apr 2019 16:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=HRWHf3AQi2m0NUgyzMp5qjtJ9e2IrGrNPT82pbV2/Fc=;
	b=rWhQ09Qu+ovHhaFoaF5zjxbj1l6EyGoVvKdvn22bPxyF2EktY53Q+IFxeS5kf7boBn
	j+yQ1SemR3TyCLPFgz7mPrMwRcvRsneHl8OJeW4H9MLHEsM5QuZ/EFkBFLELgP3P3aPQ
	t22HM8lHf7T97/Ep70FmxbGstcULqXQDshIJuqQaMfF6mN4CuLsLQG0zhaKgwPoMdwkC
	cYaaRXMX9NyzazBBUUhzEBKH1zvNnO/CR1VwVNe5VlmqOvMHYNv+4tO0FQIhcXxro6pN
	hOsVBYe/MxrPgocGerPhKSqYnXuifUILroXMsWeTnI+WibDzZyK3wboN4brmeQ9MjeKU
	qTSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=HRWHf3AQi2m0NUgyzMp5qjtJ9e2IrGrNPT82pbV2/Fc=;
	b=Ar0TUQ501j84e4X1mMxAISei+qR80viPVE0uvt7lCbJhlyf+wD8E5wvXZiLGaF4szE
	OnAt4AUJaq7PrOweRd3vynDkivos2rRTOlOZWZt8rHc9HqobmQ6O+AWAv00rayPIwC+I
	nJWb158RiBvd9wEiyGa3uE788yML6u2k/8InlWHwze9DSUbyTphIGzQQzV2VByptSHwt
	zxiO26GLoEekYTUyJyaqc3Ncuy7iN71c7mvX1hGgTSqXJxNHAfld76EecI2EEBWOU6xn
	lwj/uwfsqn5cL8eu5glRZCFBOIHAQRLxx3xpxGhG+xizGQJztGIILavA0qDComcXD6Ur
	9epA==
X-Gm-Message-State: APjAAAX8oyMI0qTx1va1RWi8LLepyV+02fBzDIv9MnfFMQNDV8BEU6LR
	/zfPcAhvsBpCuavvnGtiyO7df/QdT0M=
X-Google-Smtp-Source: APXvYqzfQxD9Owqg7CTqBl7NP+22035ePjvXYGTz2VC2iB1mjLWs2P3n5GTugwhfaHpgpby1iazARg==
X-Received: by 2002:a65:4844:: with SMTP id i4mr20339781pgs.347.1554595173377; 
	Sat, 06 Apr 2019 16:59:33 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::8ec8])
	by smtp.gmail.com with ESMTPSA id
	b2sm29786874pfo.150.2019.04.06.16.59.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 06 Apr 2019 16:59:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  6 Apr 2019 16:59:25 -0700
Message-Id: <20190406235925.34206-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] alsa-oss: Upgrade to 1.1.8
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
X-List-Received-Date: Sat, 06 Apr 2019 23:59:33 -0000
Content-Transfer-Encoding: 8bit

OE-core has upgraded alsa-lib to 1.1.8 as well so we need to be in sysnc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../alsa/alsa-oss/libio.patch                 | 32 ++++++++++++-------
 .../{alsa-oss_1.1.6.bb => alsa-oss_1.1.8.bb}  |  4 +--
 2 files changed, 23 insertions(+), 13 deletions(-)
 rename meta-oe/recipes-multimedia/alsa/{alsa-oss_1.1.6.bb => alsa-oss_1.1.8.bb} (90%)

diff --git a/meta-oe/recipes-multimedia/alsa/alsa-oss/libio.patch b/meta-oe/recipes-multimedia/alsa/alsa-oss/libio.patch
index 5299945e19..835b266014 100644
--- a/meta-oe/recipes-multimedia/alsa/alsa-oss/libio.patch
+++ b/meta-oe/recipes-multimedia/alsa/alsa-oss/libio.patch
@@ -1,18 +1,28 @@
-Index: alsa-oss-1.0.28/alsa/stdioemu.c
-===================================================================
---- alsa-oss-1.0.28.orig/alsa/stdioemu.c
-+++ alsa-oss-1.0.28/alsa/stdioemu.c
+From 54b1c2e27bf81f94c727b4923d4ed592110e2796 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Sun, 29 May 2011 21:05:15 +0200
+
+---
+ alsa/stdioemu.c | 8 +++++++-
+ configure.ac    | 6 ++++++
+ 2 files changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/alsa/stdioemu.c b/alsa/stdioemu.c
+index f7f9ab5..b673fe3 100644
+--- a/alsa/stdioemu.c
++++ b/alsa/stdioemu.c
 @@ -37,7 +37,9 @@
  #endif
  
  #include <stdio.h>
+-
 +#ifdef HAVE_LIBIO_H
- #include <libio.h>
++#include <libio.h>
 +#endif
- 
  struct fd_cookie {
  	int fd;
-@@ -99,7 +101,11 @@ static FILE *fake_fopen(const char *path
+ };
+@@ -98,7 +100,11 @@ static FILE *fake_fopen(const char *path, const char *mode, int flags)
  
  	if (open_mode && fdc->fd > 0) {
  		result = fopencookie (fdc,"w", fns);
@@ -24,10 +34,10 @@ Index: alsa-oss-1.0.28/alsa/stdioemu.c
  	}
  	return result;
  }
-Index: alsa-oss-1.0.28/configure.ac
-===================================================================
---- alsa-oss-1.0.28.orig/configure.ac
-+++ alsa-oss-1.0.28/configure.ac
+diff --git a/configure.ac b/configure.ac
+index 583b95f..60a1025 100644
+--- a/configure.ac
++++ b/configure.ac
 @@ -35,6 +35,12 @@ if test "$with_aoss" = "yes"; then
    LIBS="$OLD_LIBS"
  fi
diff --git a/meta-oe/recipes-multimedia/alsa/alsa-oss_1.1.6.bb b/meta-oe/recipes-multimedia/alsa/alsa-oss_1.1.8.bb
similarity index 90%
rename from meta-oe/recipes-multimedia/alsa/alsa-oss_1.1.6.bb
rename to meta-oe/recipes-multimedia/alsa/alsa-oss_1.1.8.bb
index 6c2176f79c..46ab503169 100644
--- a/meta-oe/recipes-multimedia/alsa/alsa-oss_1.1.6.bb
+++ b/meta-oe/recipes-multimedia/alsa/alsa-oss_1.1.8.bb
@@ -30,8 +30,8 @@ DEPENDS = "alsa-lib"
 SRC_URI = "ftp://ftp.alsa-project.org/pub/oss-lib/alsa-oss-${PV}.tar.bz2 \
     file://libio.patch \
 "
-SRC_URI[md5sum] = "fc845cafc4444193510ab1865c7350b8"
-SRC_URI[sha256sum] = "c3d3f743e61f05ff95c5cba3b06bc9c91ff86c37495f1d19dab844e6b90845ea"
+SRC_URI[md5sum] = "9ec4bb783fdce19032aace086d65d874"
+SRC_URI[sha256sum] = "64adcef5927e848d2e024e64c4bf85b6f395964d9974ec61905ae4cb8d35d68e"
 
 inherit autotools
 
-- 
2.21.0



Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D47DC25B74
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 18:10:38 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.3089.1716315028163201691
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 May 2024 11:10:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f84/WHYm;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1ee38966529so774265ad.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 11:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716315027; x=1716919827; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S90XyFejNHJ2N0qgSC012XAl7AylnrJIKFqUMfJ/aYw=;
        b=f84/WHYmn3ann1T5NBY01oGf/z+GUnFmUCChrENJ/tqJJgmXF3qrQm0hLCtG86kYpH
         VRK+RhOkZUv2SKLnj3s4r2LHTXfKh4RqMdnmnd5wiHRC4baeGOSGbVYezlMOwEgQovp6
         uUsH3ys+02Fk6jc/e0VSEs1Pjlxk/tSqiT3B0ebl8sHKWx6+hCZEoLfsfoiljjghRzZu
         Hz4Q1dPC4XKNlc+SgbIABJ6u+EV2x16KTAKSEpFMs4UWEly6Rj0eA2b4v/Hk474dAEvT
         sWeqoR4SqwLzCK9c8wPV03es2o2MpTCtkuxsdlk6MrN+uKGy9qKOQ0xOz0HV+MDnX+f3
         gKsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716315027; x=1716919827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S90XyFejNHJ2N0qgSC012XAl7AylnrJIKFqUMfJ/aYw=;
        b=ZUIBBA7HGJ8Gr4AAN7LK1jdHeBGT5PNo7DKOpce3+5YKudFBmOzYyjKHS+l4JG1oMr
         o/Oe0J+s2gPwo/tRDlVvJ68v2OSwW2AIy9ooeMNXyBGWxgM0gQkOL05aovbfmagfSivk
         Xr7Tgw+Lm38kmZNIhc2rKyNsRYvCV436H0sbPAPWV2QNfd5jReghptXrSOOUfKVteOmM
         z4ic24XCmpLd3U1XGzj+nAzMcnUu6GRIQf2BR2bEKq/7c2x4BVSuJlWUfue8IySabzyQ
         UeE6vgYqxMIPDOREu9ku7t5cx8CHyHEssabbGEuQAAArsVgnIqUUa79JwExByPkvA+uO
         3xOQ==
X-Gm-Message-State: AOJu0YyobvMoj2UndyuysFrnxMJ/SGzqVTfMeJzF7Th9ThWXpc3v1tqA
	qM0W1SoLfnsZGrqrVHYBlg2xnvByCH8l9ajJ0BaM33zJsrTXMPyRqNF68qzXa20=
X-Google-Smtp-Source: AGHT+IHGxm5/cyyltckswnjBSgjJvIMoEJHBNPTl69O8P/AdD9vAZS8ozh268DxHFhPkzch9cQ6Gtg==
X-Received: by 2002:a17:903:41c7:b0:1f3:3b0:61a7 with SMTP id d9443c01a7336-1f303b06359mr79610925ad.12.1716315027269;
        Tue, 21 May 2024 11:10:27 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::e8eb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c136354sm224799075ad.244.2024.05.21.11.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 11:10:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][ 01/22] libsdl: Fix build with musl
Date: Tue, 21 May 2024 11:10:02 -0700
Message-ID: <20240521181024.426176-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 18:10:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110450

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...iconv-use-portable-across-glibc-musl.patch | 52 +++++++++++++++++++
 .../recipes-graphics/libsdl/libsdl_1.2.15.bb  |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/0001-stdlib-Make-iconv-use-portable-across-glibc-musl.patch

diff --git a/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/0001-stdlib-Make-iconv-use-portable-across-glibc-musl.patch b/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/0001-stdlib-Make-iconv-use-portable-across-glibc-musl.patch
new file mode 100644
index 0000000000..2007766f74
--- /dev/null
+++ b/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/0001-stdlib-Make-iconv-use-portable-across-glibc-musl.patch
@@ -0,0 +1,52 @@
+From 6c35fc94ca30a4d0662479f7ef8a704d97aa7352 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 18 May 2024 18:13:30 -0700
+Subject: [PATCH] stdlib: Make iconv use portable across glibc/musl
+
+This is a backport from libsdl2
+
+Upstream-Status: Backport [https://github.com/libsdl-org/SDL/blob/main/src/stdlib/SDL_iconv.c#L49C1-L51C1]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/stdlib/SDL_iconv.c | 19 ++++---------------
+ 1 file changed, 4 insertions(+), 15 deletions(-)
+
+diff --git a/src/stdlib/SDL_iconv.c b/src/stdlib/SDL_iconv.c
+index fa56a99..087b6ec 100644
+--- a/src/stdlib/SDL_iconv.c
++++ b/src/stdlib/SDL_iconv.c
+@@ -28,27 +28,16 @@
+ 
+ #ifdef HAVE_ICONV
+ 
+-/* Depending on which standard the iconv() was implemented with,
+-   iconv() may or may not use const char ** for the inbuf param.
+-   If we get this wrong, it's just a warning, so no big deal.
+-*/
+-#if defined(_XGP6) || \
+-    defined(__GLIBC__) && ((__GLIBC__ > 2) || (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 2))
+-#define ICONV_INBUF_NONCONST
+-#endif
+-
+ #include <errno.h>
+ 
+ size_t SDL_iconv(SDL_iconv_t cd,
+                  const char **inbuf, size_t *inbytesleft,
+                  char **outbuf, size_t *outbytesleft)
+ {
+-	size_t retCode;
+-#ifdef ICONV_INBUF_NONCONST
+-	retCode = iconv(cd, (char **)inbuf, inbytesleft, outbuf, outbytesleft);
+-#else
+-	retCode = iconv(cd, inbuf, inbytesleft, outbuf, outbytesleft);
+-#endif
++  /* iconv's second parameter may or may not be `const char const *` depending on the
++     C runtime's whims. Casting to void * seems to make everyone happy, though. */
++
++	const size_t retCode = iconv((iconv_t)((uintptr_t)cd), (void *)inbuf, inbytesleft, outbuf, outbytesleft);
+ 	if ( retCode == (size_t)-1 ) {
+ 		switch(errno) {
+ 		    case E2BIG:
+-- 
+2.45.1
+
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb
index 4fc4679f7f..1f436c6d7f 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb
@@ -15,6 +15,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL-${PV}.tar.gz \
            file://libsdl-1.2.15-xdata32.patch \
            file://pkgconfig.patch \
            file://0001-build-Pass-tag-CC-explictly-when-using-libtool.patch \
+           file://0001-stdlib-Make-iconv-use-portable-across-glibc-musl.patch \
            file://CVE-2019-7577.patch \
            file://CVE-2019-7574.patch \
            file://CVE-2019-7572.patch \
-- 
2.45.1



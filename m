Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84320F433F2
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 05:51:19 +0000 (UTC)
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7043.1776318675711739869
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Apr 2026 22:51:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=e8q/U63m;
 spf=pass (domain: gmail.com, ip: 74.125.82.44, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-12732165d1eso18899249c88.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 22:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776318675; x=1776923475; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QUHa0DCJMDLkePljflevxor/Lg1xiALNfBGt5XZdZ1s=;
        b=e8q/U63mNnwfnwWE7UYgekGAzM3gT7RXsoHP+ZL4H7BgyHA+XlQEk1R9qEL/WggjW1
         +YZaCiieYWtWwmTT8VRHiyR3jY6XtiwVUGJWJ4/ZiiGVJ7rJfGzPp7lRtRRJk6PAIjlu
         E/7S+L8I++4cr8/Q8i2JRu0k9TTJ5N5T9GEng47VJSvP70tHFPmulI2WA+c8FZbd/hCl
         bU/UEx7uU+Lp8eg+7htAGZnVS1oZS+RUgitsxKF/prC2ceTT/1QijXyLVFEseB5ZU8/2
         Nhyaulxjn/G7pvgGy+206fNBpEJeMloTE3I8M98zfuL4lFznZwmN9Vg7GeFPWUtJhW0p
         rHPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776318675; x=1776923475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QUHa0DCJMDLkePljflevxor/Lg1xiALNfBGt5XZdZ1s=;
        b=dowNT9K9i5uJmB76r6p1fusNDDzccwD5I+pqIWTwHFK4v0qXMmYiDlcf1RyPhT+9yw
         7VtH+ZGmJFzgc6javbA3Z4vKIDYakkefdwsGrkC2gdyO8OHY8FOTO4o7dSIrxIr1St3u
         nqkfrhR30U97gCvzhueEhBPQ7kumMkNynWaVB9wcnZ21vGePUf8ywFS+CdLru/KWB79w
         5f8smvtX3EXxd/K+vKLyusvslsrc2dV0a86g/k/VGZY41gouhXAhWqcdKUHgmezIHrHI
         mJygrGqEx3+diWMKywWT13wlvMnUAcRhjpDQ92Gt24uZ/HcVOS3gouJfdSPz5DGWkm+b
         gZ2A==
X-Gm-Message-State: AOJu0YxSB8HAeoyhmlrYIb/h337fZUXcU047vruxvjDqGSmexGZW1J2R
	sgThAu+0MqCPudIaVjBliKlqF0B1egwYMyTwfzMgkoCOxk7lx9gBCZgs9qnRZAsR
X-Gm-Gg: AeBDietuB6qDE/ZUShNiDYDk98KvAAshCHMGBrpJbKsOV9oAOY5+ogfJwNlmfAGcrS+
	cL5m4CmlcYcCVp2pbPy8dPBzAVJdjTSAfeBJGYPxm8yvp3RKVwIZxgaeXMLU+xzxWdcMJTtpMoO
	v8inZCS8M1ZxgfSUGBWOjSWj++44mxBLcl1PVwAI7c4Ior4G+pa+8ihoR5c+qQMDKlyY729PP1h
	pPJN+lgCp11484xMWItGoLwTiW6Jugqx9GmYmcFh5e6NyGXXgPRIAcDWWIykaXdULiZdHUHX1g4
	N4pWA37uY+vXxulVj89jpbl3jtUghGu/3hkjWjZD38v3a/fC6ply6hFk7rUvASud20gnpaehsvS
	WFFV2Egj0I16bsJKFWr+GNRVZwTCas/liPTxXJOQSJyIm55wfgKr373LjHYncI1amWhWp0ruAu2
	4w3NiSEoGTHaqzM9d6QxJlCh5cnC6zwtohPjfFAxYC0m7WVuL4jJHEW+gRNMJeoyL3wx98/G81f
	QYsteCfn8wP/BAGUdXmODq9mwB4YCjhe9h1X3OAOS16xVM6+UIKPnWl1q6YQN37XHFXojleYAM2
	QdV0Ny4ONZ7vd372wy15Wo/ozGP/8vqPT3VpswYVxSkYb0MlH3VUObA8qIDvVQ==
X-Received: by 2002:a05:7022:e1b:b0:128:cf75:42a3 with SMTP id a92af1059eb24-12c34ecba65mr12930173c88.21.1776318674732;
        Wed, 15 Apr 2026 22:51:14 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c5e61db6bsm4810182c88.1.2026.04.15.22.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 22:51:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 12/18] ruli: Delete -ansi and -pedantic from compiler commandline
Date: Wed, 15 Apr 2026 22:50:52 -0700
Message-ID: <20260416055058.792189-12-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260416055058.792189-1-khem.raj@oss.qualcomm.com>
References: <20260416055058.792189-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 05:51:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126391

The build fails because ruli is compiled with -ansi
(which implies C89/C90), but glibc's memchr macro
uses _Generic, a C11 feature. Clang treats this as
an error via -Werror,-Wc11-extensions.

Fixes build with glibc 2.43+

| ruli_conf.c:86:12: error: '_Generic' is a C11 extension [-Werror,-Wc11-extensions]
|    86 |       if (!memchr(inbuf, '\0', LOAD_SEARCH_LIST_INBUFSZ))
|       |            ^

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ake-space-for-flags-from-environment.patch | 25 +++++++++++--------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/meta-networking/recipes-support/ruli/files/0001-Make-space-for-flags-from-environment.patch b/meta-networking/recipes-support/ruli/files/0001-Make-space-for-flags-from-environment.patch
index c3ca07a390..739d7f797e 100644
--- a/meta-networking/recipes-support/ruli/files/0001-Make-space-for-flags-from-environment.patch
+++ b/meta-networking/recipes-support/ruli/files/0001-Make-space-for-flags-from-environment.patch
@@ -12,8 +12,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  src/Makefile    |  8 ++++----
  2 files changed, 14 insertions(+), 14 deletions(-)

-diff --git a/sample/Makefile b/sample/Makefile
-index 15cafd9..d83641f 100644
 --- a/sample/Makefile
 +++ b/sample/Makefile
 @@ -35,9 +35,9 @@ ifeq ($(PLATFORM),SunOS)
@@ -50,13 +48,23 @@ index 15cafd9..d83641f 100644

  %.o: %.c
  	$(CC) $(ARCH) $(CPPFLAGS) $(CFLAGS) -c $<
-diff --git a/src/Makefile b/src/Makefile
-index 9b56b5e..39a5ea1 100644
 --- a/src/Makefile
 +++ b/src/Makefile
-@@ -45,7 +45,7 @@ endif
+@@ -2,7 +2,7 @@
+ # $Id: Makefile,v 1.57 2005/06/13 16:34:53 evertonm Exp $
+ #

- WARN = -pedantic -ansi -Wshadow -Wpointer-arith -Wcast-qual \
+-#DEBUG += -DRULI_SRV_DEBUG
++#DEBUG += -DRULI_SRV_DEBUG
+ #DEBUG += -DRULI_HOST_DEBUG
+ #DEBUG += -DRULI_RES_DEBUG
+ #DEBUG += -DRULI_TXT_COMPARE_DEBUG
+@@ -43,9 +43,9 @@ ifeq ($(PLATFORM),SunOS)
+ DEFINE_SOLARIS = -D_RULI_SOLARIS_
+ endif
+
+-WARN = -pedantic -ansi -Wshadow -Wpointer-arith -Wcast-qual \
++WARN = -Wshadow -Wpointer-arith -Wcast-qual \
  	-Wcast-align -Wwrite-strings -Wredundant-decls
 -CC = gcc
 +CC ?= gcc
@@ -72,7 +80,7 @@ index 9b56b5e..39a5ea1 100644
  LIBOBJ = ruli_isaac.o ruli_mem.o ruli_rand.o ruli_util.o ruli_list.o \
  	ruli_addr.o ruli_sock.o ruli_txt.o ruli_msg.o ruli_fsm.o \
  	ruli_res.o ruli_parse.o ruli_host.o ruli_srv.o ruli_conf.o \
-@@ -66,7 +66,7 @@ LIBOBJ = ruli_isaac.o ruli_mem.o ruli_rand.o ruli_util.o ruli_list.o \
+@@ -66,7 +66,7 @@ LIBOBJ = ruli_isaac.o ruli_mem.o ruli_ra
  	ruli_getaddrinfo.o
  SHAREDOBJ = $(LIBOBJ:%.o=%.os)
  SONAME = libruli.so.4
@@ -90,6 +98,3 @@ index 9b56b5e..39a5ea1 100644
  	@echo
  	@echo "REMINDER:"
  	@echo "Add $(INSTALL_LIB_DIR) to your dynamic loader path:"
---
-2.24.0
-


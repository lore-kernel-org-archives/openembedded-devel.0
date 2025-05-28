Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3C10C5AE59
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 06:39:15 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.9943.1748414353177420080
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 May 2025 23:39:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Pb3GwFmD;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a366843fa6so2576796f8f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 May 2025 23:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1748414351; x=1749019151; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NKxNOAZ1+3OmKdyrH3H0SaoCwUsDXtTzqBtD/rBuoio=;
        b=Pb3GwFmDQhKuQ+KAZ8ggC33K9iDEJQ0HohV2oI6piY7Ay5iY6TCOvzCyA+fCfPZTSZ
         TVDAXV7DBWZrIbCLokPRZG60heP/hl4+QjwfegqBZ0eImA82FcUOz5KiDBZZ9e+RUykM
         880NBVO1SEWHJqiOYtPvp7TTrc9bqox+Px37Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748414351; x=1749019151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NKxNOAZ1+3OmKdyrH3H0SaoCwUsDXtTzqBtD/rBuoio=;
        b=G+LoJUdZqDKHC4E2hrFXGJoaPMZupRT35WX0XpYgahfsZ03iqemHadgNDOOT5rlpha
         RwLBS7h/k8CWvIpkrQOdCTFNWohLimi9kBLwwegeDTd3aH0WHiEliTbWfu8SeO12b6JB
         8G8VQCQhYML3UxoPWtxDwxW/Wb5qUyROknNfK6NgTrIgdKibLkhnd3kj6MuRUL3p2xY7
         1ihmq2Jpr+5WWDgBknF0OfXQK4SjZdKtSguorVmqs4sDOb/xIQ+uKqYLWFDTjNrh4LEa
         Zisw7Kg3e8ApFsDc1sB1hzkNGWZ+Ow7gEzxeFcgupzUoCDSfHCvDM+DShQRnLgEk2oxU
         v5vg==
X-Gm-Message-State: AOJu0Yyzx7Xb0SSDGaBdrT7WVBSa5fXAcIq4Zi/cNLK/ojWzo4Bub2Wh
	5JedlOzK/tk4xIv4+32cMhgfgvmlKXcztN4PMQ9BSPnctPQo1KNoJfOM7Qt0C7WBHJ5T5CxQmoi
	9IVbjygA=
X-Gm-Gg: ASbGncsXcc2o0S2L4dMar/PpoIPpIxlWVkImKo0PE4YH3/TSBL673YO/kZEXmA7cQ1y
	TTWW3nSA0FhFF0HPKH2EYgsNJhr54cfZBvN/euIK3iac1WhkTJcv+m2VkNMpzh9lmUpq3QQp58n
	5A+gq3n+V65+H3gsxFoGidA1X0hgbJ1EGP/wl2UFMrRABy1LHsa+ybiVa6e6Bg7MIo/3n0SdVW8
	BgCoOmcBiLlEXweHMgwuf6ENN5K0lj/LOTR53YpBqvzo+jK7WxnfMgdYAm32ToWpLPDRhnPgNYk
	zJqHmDXpKWBx7CMiYO7CbO5/lSYUZJ1Hr2ugUbUYDn/lEt7LLh5tKydvg0/prrQtkAHcqHYiiyR
	P8AH7UhJ0J5aqEXEa0ZkB//wEEVJrVRJGBK1CDfT36IbNrqNP9fz7fmvtCyY=
X-Google-Smtp-Source: AGHT+IGUJZK/2uA+2YnRyqIY75IxwJpLjbPpTG74agrGdTNX+IsYTwBAKvpm/MffWjRsugoLibzjKg==
X-Received: by 2002:a05:6000:1787:b0:3a4:dff9:e6b4 with SMTP id ffacd0b85a97d-3a4dff9ea5bmr5460210f8f.33.1748414351094;
        Tue, 27 May 2025 23:39:11 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local (2a02-8440-3341-d0de-cc12-e4a0-83a6-f88a.rev.sfr.net. [2a02:8440:3341:d0de:cc12:e4a0:83a6:f88a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4eac7e09bsm601968f8f.36.2025.05.27.23.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 23:39:10 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	=?UTF-8?q?K=C3=A9l=C3=A9fa=20San=C3=A9?= <kelefa.sane@smile.fr>
Subject: [meta-oe][PATCH v2] pcp: fix race condition build error
Date: Wed, 28 May 2025 08:38:44 +0200
Message-Id: <20250528063844.1648583-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 May 2025 06:39:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117644

From: Yoann Congal <yoann.congal@smile.fr>

Extend and submit the existing patch fixing makefile parallelism:
> Some QA binaries include localconfig.h but there is no explicit dependencies
> between the binary build and the localconfig.h generation.
> On heavily loaded systems, this can result in the binary being built
> before localconf.h and a compilation error, e.g:
> | username.c:8:10: fatal error: localconfig.h: No such file or directory
> |     8 | #include "localconfig.h"
> |       |          ^~~~~~~~~~~~~~~
> | compilation terminated.
>
> Fix this by adding the missing Makefile rule dependency between the
> binary (or its pre-link .o) and localconfig.h.

AB frequenctly lost the race condition due to (I suppose) its high CPU
count and load[0].

[0]: https://autobuilder.yoctoproject.org/valkyrie/#/builders/87/builds/44/steps/32/logs/stdio
     (line 131)

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Reviewed-by: Kéléfa Sané <kelefa.sane@smile.fr>
---
v1->v2:
* Reviewed-by: Kéléfa Sané <kelefa.sane@smile.fr>
* Upstream-status updated following merge
---
 .../pcp/pcp/fix_parallel_make.patch           | 116 ++++++++++++++++--
 1 file changed, 108 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-support/pcp/pcp/fix_parallel_make.patch b/meta-oe/recipes-support/pcp/pcp/fix_parallel_make.patch
index 9cb649a594..7bc045949b 100644
--- a/meta-oe/recipes-support/pcp/pcp/fix_parallel_make.patch
+++ b/meta-oe/recipes-support/pcp/pcp/fix_parallel_make.patch
@@ -1,13 +1,113 @@
-Upstream-Status: Pending
+From 92add24ccfc7e643349a1c091957595ce25a9915 Mon Sep 17 00:00:00 2001
+From: Yoann Congal <yoann.congal@smile.fr>
+Date: Tue, 27 May 2025 08:45:36 +0200
+Subject: [PATCH] QA: cleanup localconfig.h build dependencies
 
+Some QA binaries include localconfig.h but there is no explicit dependencies
+between the binary build and the localconfig.h generation.
+On heavily loaded systems, this can result in the binary being built
+before localconf.h and a compilation error, e.g:
+| username.c:8:10: fatal error: localconfig.h: No such file or directory
+|     8 | #include "localconfig.h"
+|       |          ^~~~~~~~~~~~~~~
+| compilation terminated.
+
+This can be reproduced by adding "sleep 30" at the start of the
+localconfig.h generation rule.
+
+Fix this by adding the missing Makefile rule dependency between the
+binary (or its pre-link .o) and localconfig.h.
+
+Also remove an un-needed scale.o->localconfig.h dependency.
+
+Upstream-Status: Backport [https://github.com/performancecopilot/pcp/commit/8de7bbb06703f224b72fe0994acde3189b742fd2]
+Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
+---
+ qa/src/GNUlocaldefs | 22 +++++++++++-----------
+ 1 file changed, 11 insertions(+), 11 deletions(-)
+
+diff --git a/qa/src/GNUlocaldefs b/qa/src/GNUlocaldefs
+index f83826068..e47fbfd72 100644
 --- a/qa/src/GNUlocaldefs
 +++ b/qa/src/GNUlocaldefs
-@@ -728,7 +728,7 @@ scale.o:	localconfig.h
+@@ -299,7 +299,7 @@ diowr:	diowr.c
+ 	rm -f $@
+ 	$(CCF) $(CDEFS) -o $@ diowr.c
+ 
+-endian:	endian.c
++endian:	endian.c localconfig.h
+ 	rm -f $@
+ 	$(CCF) $(CDEFS) -o $@ endian.c
+ 
+@@ -331,15 +331,15 @@ exercise:	exercise.c
+ 	rm -f $@
+ 	$(CCF) $(CDEFS) -o $@ exercise.c $(LDLIBS)
+ 
+-chkacc1:	chkacc1.c
++chkacc1:	chkacc1.c localconfig.h
+ 	rm -f $@
+ 	$(CCF) $(CDEFS) -o $@ chkacc1.c $(LDLIBS)
+ 
+-chkacc2:	chkacc2.c
++chkacc2:	chkacc2.c localconfig.h
+ 	rm -f $@
+ 	$(CCF) $(CDEFS) -o $@ chkacc2.c $(LDLIBS)
+ 
+-chkacc3:	chkacc3.c
++chkacc3:	chkacc3.c localconfig.h
+ 	rm -f $@
+ 	$(CCF) $(CDEFS) -o $@ chkacc3.c $(LDLIBS)
+ 
+@@ -489,7 +489,7 @@ pmdashutdown:	pmdashutdown.c
+ 	rm -f $@
+ 	$(CCF) $(CDEFS) -o $@ $@.c $(LDLIBS) -lpcp_pmda
+ 
+-dumb_pmda: dumb_pmda.c
++dumb_pmda: dumb_pmda.c localconfig.h
+ 	$(CCF) $(LCDEFS) $(LCOPTS) -o $@ $@.c $(LDLIBS) -lpcp_pmda
+ 
+ pmdacache: pmdacache.c
+@@ -633,7 +633,7 @@ else
+ 	$(CCF) $(CDEFS) -o $@ $@.c $(LIB_FOR_PTHREADS) $(LDLIBS)
+ endif
+ 
+-multithread2:	multithread2.c
++multithread2:	multithread2.c localconfig.h
+ 	rm -f $@
+ 	$(CCF) $(CDEFS) -o $@ $@.c $(LIB_FOR_PTHREADS) $(LDLIBS)
+ 
+@@ -786,7 +786,6 @@ $(NVIDIAQALIB):	nvidia-ml.o
+ endif
+ 
+ arch_maxfd.o:	localconfig.h
+-scale.o:	localconfig.h
+ 
  779246.o:	libpcp.h
  aggrstore.o:	libpcp.h
- badmmv.o:	libpcp.h
--chkacc1.o:	libpcp.h
-+chkacc1.o:	libpcp.h localconfig.h
- chkacc2.o:	libpcp.h
- chkacc3.o:	libpcp.h
- chkacc4.o:	libpcp.h
+@@ -847,14 +846,14 @@ multithread14.o:	libpcp.h
+ nameall.o:	libpcp.h
+ parsehostattrs.o:	libpcp.h
+ parsehostspec.o:	libpcp.h
+-pdubufbounds.o:	libpcp.h
+-pducheck.o:	libpcp.h
++pdubufbounds.o:	libpcp.h localconfig.h
++pducheck.o:	libpcp.h localconfig.h
+ pducrash.o:	libpcp.h
+-pdu-server.o:	libpcp.h
++pdu-server.o:	libpcp.h localconfig.h
+ pmcdgone.o:	libpcp.h
+ pmlcmacro.o:	libpcp.h
+ pmnsinarchives.o:	libpcp.h
+-pmnsunload.o:	libpcp.h
++pmnsunload.o:	libpcp.h localconfig.h
+ proc_test.o:	libpcp.h
+ qa_libpcp_compat.o:	libpcp.h
+ qa_timezone.o:	libpcp.h
+@@ -874,6 +873,7 @@ torture_pmns.o:	libpcp.h
+ tztest.o:	libpcp.h
+ unpack.o:	libpcp.h
+ unpickargs.o:	libpcp.h
++username.o:	localconfig.h
+ xarch.o:	libpcp.h
+ xlog.o:	libpcp.h
+ xmktime.o:	libpcp.h


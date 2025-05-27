Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48E2CC5B543
	for <webhook@archiver.kernel.org>; Tue, 27 May 2025 09:57:58 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.48310.1748339874262893834
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 May 2025 02:57:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=muTJXnxP;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cfe574976so24803805e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 May 2025 02:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1748339872; x=1748944672; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UixbV6Da91tapY6PAslb8oaCB4kFBD/Qy3v+8/8HF3w=;
        b=muTJXnxPJNdW07xy+OavWc6bcwxeLuRUegyNkCGyosqb65y5bvDUlrnt+a8uVfE88e
         4SkZ3xZskyM5hY/9FUcAcoYimYtYaMwqxzzF10dWVaSF9ynY7D5yzA3ITDu47J5sAQ7X
         JbuwU0J1Nir/zmi0MVqcHB9VnyY9HH286k9gY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748339872; x=1748944672;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UixbV6Da91tapY6PAslb8oaCB4kFBD/Qy3v+8/8HF3w=;
        b=h5od29oCl5dw3uptOqgBKZvskOW9/3nBBZLjxlxxagXgGSA4Y8A/tZaljnHwN9my7s
         tHd3rmz6S8aDKee/Efr+jieRshm9r3f4+UuRZr4k3aiqLqhiFY0fSx1/RlQjYbSeu8UT
         0SQtfFnWMEicLFY0FPgrLjOk9/4aq5Z/ZZCbmUWuj8f6OaKwG0XThK7dq+I3a5z0yCjD
         T42uca7sOxzjZfmvTOIyvJ9a9QnWvZ8Tjw25T+gO3Je6qdqKOh6sNxPrSGn0+1UPV+aJ
         c9b/t3LaLUGiugfTjfcdqtqOzuGqw5M2t0zKrwMkbEZlEjrHUJKorX1pvhMtofMjrR5N
         U8SA==
X-Gm-Message-State: AOJu0YweQxGlBPmcb916fNgobrcfAvrjjFUen4N5/haq0HHrT8jjZnbb
	cnpUHY/aTfEYflXyGMRgSWhYoUCPG70zIgQy7ykmw92ND1Y0tiveSsDMtrNnOY6RxmrtqISxGJO
	BSj/gxfc=
X-Gm-Gg: ASbGncuUT37uNZjPJ5EVxZSWYDm77ynxB2SWA2hG99tZ4o9x+HXUn90DmwSlUJrjpCC
	FH69PHtANJg14Mp/BBgRlA3D2JtTOuJYfxxxz/MkpdwVWeTd7iBS7ilINIOfZvhECsYvLmXFVwc
	WvZ0gIP0gw2/+OF15gnuF8XTy2pOdVnJZ3Shf3ghLKnplrD6cNBhQLH8UTBrRJV7wIJ+TO7iYaW
	Mv3OsLEUdqTP7NlRslFdbHaLHKkoQCnLdT6NTch3XRLKIcez9gY+y4S7cbeeFsxI+BKo/5+g4mT
	y6bfWyPJGk0/PwZQL/ikASnp+0SNfLcyfh6UOkFNnzFCPQgj0GJSw9YXgensy9H0P+CiJbJiRwL
	LULcqFWPrSHhvWzvRSM8NCDHHdLdyPd36YTtJVkrG0myaw2yLKktVPRIhXDs=
X-Google-Smtp-Source: AGHT+IHDH65IS/wrqVQAtrHlIKbcNErRke4z3N+StoNl9h1fLfiFZFPKAjv1SjGaKvMdClcOGuZ57g==
X-Received: by 2002:a05:600c:4e4b:b0:442:d9fc:7de with SMTP id 5b1f17b1804b1-44c92d364c2mr99830025e9.22.1748339872394;
        Tue, 27 May 2025 02:57:52 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.home (2a01cb001331aa0017b58d8bf04048c3.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:17b5:8d8b:f040:48c3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f3dd99f9sm265276305e9.40.2025.05.27.02.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 02:57:52 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][PATCH] pcp: fix race condition build error
Date: Tue, 27 May 2025 11:57:32 +0200
Message-Id: <20250527095732.1491355-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 May 2025 09:57:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117633

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
---
 .../pcp/pcp/fix_parallel_make.patch           | 118 ++++++++++++++++--
 1 file changed, 110 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-support/pcp/pcp/fix_parallel_make.patch b/meta-oe/recipes-support/pcp/pcp/fix_parallel_make.patch
index 9cb649a594..9680e29944 100644
--- a/meta-oe/recipes-support/pcp/pcp/fix_parallel_make.patch
+++ b/meta-oe/recipes-support/pcp/pcp/fix_parallel_make.patch
@@ -1,13 +1,115 @@
-Upstream-Status: Pending
+From 92add24ccfc7e643349a1c091957595ce25a9915 Mon Sep 17 00:00:00 2001
+From: Yoann Congal <yoann.congal@smile.fr>
+Date: Tue, 27 May 2025 08:45:36 +0200
+Subject: [PATCH] QA: cleanup localconfig.h build dependencies
 
+From: Yoann Congal <yoann.congal@smile.fr>
+
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
+Upstream-Status: Submitted [https://github.com/performancecopilot/pcp/pull/2213]
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


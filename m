Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01BA7C678DB
	for <webhook@archiver.kernel.org>; Sun,  5 Mar 2023 22:34:30 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.19967.1678055664239086541
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Mar 2023 14:34:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PDw3Q8Oo;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id x34so8033119pjj.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Mar 2023 14:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678055663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ee1WuYHA3vvvZ8725wa64JWCQNQ1f4ROjPD1wx2tvdg=;
        b=PDw3Q8OoyWXact/B+bTlMbYQd6H5JqTYHKmM58xE3416fmjbdFGtolO0PyLCuxP3U5
         LK3Ksl6bMkVtfwYvKAUyh7QDMODnFrjucHrp38xgEgv3TFs2vTe5mt1730jm5GApN2BC
         UgBsLdOdpEH59prylk+TnMykHdlfI8a7DDOxhfkOvmA9LOSyk8hspsEq+V8UOP3jCyRJ
         ff1t9YQIOHQy0oFXAQHIzhQlHEJzqT48ufcSSZuV4lKaRfE5F2oZ9HFSbIL/AQlkOliE
         XGvTCsow4Z71Bk+4EEgTL5lTi7ey6r0W3MNGEkp89gko/NB8J+4WRhqhbwtz6KOVhCs3
         E+cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678055663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ee1WuYHA3vvvZ8725wa64JWCQNQ1f4ROjPD1wx2tvdg=;
        b=G7x7un1pKaPo+IxeQgpeeCQpA9IrAhXZ4Hs2Nba+OLkFVBbxVOFy6qPRrdiPD2phKY
         tLKT38+vks2GnsdYH1DqsjO9cuj9LsZyf3uup87s3QJhoIO+gtF68T/EL76jraNQnpi/
         EYOUHhVCdlz3JaAUYxgqxeM/B4G1qaC00N+2sYcaiXJC2l+VhLqs4bMQxd+lU5x16olv
         4t+kTVcGEW8Is35ioygw47liEX9NTfexLK84EL7Qwei7FRAF+br+/4cpnmnbEpyrfnFQ
         IMoFnNBguxjX6m3tjvXts+h5Yo4T9xmPubsMzGnsJEr/n5LWcJOFspVZJMkv31VADAFZ
         9X+w==
X-Gm-Message-State: AO0yUKXQra8RZbo2HqYJveT3dRnlTDimGYjpJHuu7q8MzFXXXpmoaXUs
	xo2MFXxVIZixwWh4EIShPVfn21JJ+Qw=
X-Google-Smtp-Source: AK7set9Hp9dhs8/b7ahpw+8geFUc1RVsZ4iKmtE1puLbf2IU67vca0VvQWrOUgtPhxddanqjJ6Bv9A==
X-Received: by 2002:a17:902:8683:b0:19b:107b:698e with SMTP id g3-20020a170902868300b0019b107b698emr7730833plo.14.1678055663238;
        Sun, 05 Mar 2023 14:34:23 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::c80d])
        by smtp.gmail.com with ESMTPSA id ks3-20020a170903084300b0019c901c207dsm5207269plb.177.2023.03.05.14.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Mar 2023 14:34:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] libx86-1: Fix build on 32bit x86
Date: Sun,  5 Mar 2023 14:34:19 -0800
Message-Id: <20230305223420.2324783-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Mar 2023 22:34:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101388

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...efine-CARD32-as-uint-as-it-is-32-bit.patch | 20 +++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-extended/libx86-1/libx86-1.1/0001-Define-CARD32-as-uint-as-it-is-32-bit.patch b/meta-oe/recipes-extended/libx86-1/libx86-1.1/0001-Define-CARD32-as-uint-as-it-is-32-bit.patch
index cc4ee7eefb..aef521bc5d 100644
--- a/meta-oe/recipes-extended/libx86-1/libx86-1.1/0001-Define-CARD32-as-uint-as-it-is-32-bit.patch
+++ b/meta-oe/recipes-extended/libx86-1/libx86-1.1/0001-Define-CARD32-as-uint-as-it-is-32-bit.patch
@@ -3,7 +3,8 @@ From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 2 Mar 2023 18:47:40 -0800
 Subject: [PATCH] Define CARD32 as uint as it is 32-bit
 
-long can be 64bit on LP64 systems
+long can be 64bit on LP64 systems and none of systems we support need int < 32-bits
+therefore use NUM32 to be int always if the system is linux
 
 Fixes build with clang-16
 thunk.c:147:3: error: incompatible function pointer types initializing 'x86emuu32 (*)(X86EMU_pioAddr)' (aka 'unsigned int (*)(unsigned short)') with an expression of type 'unsigned long (*)(unsigned short)' [-Wincompatible-function-pointer-types]
@@ -16,8 +17,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  x86emu/include/xf86int10.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/x86emu/include/xf86int10.h b/x86emu/include/xf86int10.h
-index 9c131dd..acd5114 100644
 --- a/x86emu/include/xf86int10.h
 +++ b/x86emu/include/xf86int10.h
 @@ -18,7 +18,7 @@
@@ -29,6 +28,15 @@ index 9c131dd..acd5114 100644
  #define pointer void *
  #define IOADDRESS void *
  #define Bool int
--- 
-2.39.2
-
+--- a/x86emu/include/types.h
++++ b/x86emu/include/types.h
+@@ -77,7 +77,8 @@
+     defined(__s390x__) || \
+     (defined(__hppa__) && defined(__LP64)) || \
+     defined(__amd64__) || defined(amd64) || \
+-    (defined(__sgi) && (_MIPS_SZLONG == 64))
++    (defined(__sgi) && (_MIPS_SZLONG == 64)) || \
++    defined(__linux__)
+ #define NUM32 int
+ #else
+ #define NUM32 long
-- 
2.39.2



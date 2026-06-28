Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AF77C44502
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:11:55 +0000 (UTC)
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14720.1782634309578625282
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:11:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dxgZDamr;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-30eac9abd79so818729eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634309; x=1783239109; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LlJmnkelhF4q9kptIVjhPgqzFoGWTxGtKrHeQH4raDM=;
        b=dxgZDamrVVr/v8Fj3qNFHbCTqv942ULwkEQwBzQDazd37rf4M9+bOJgISvrrrAav2N
         Tlo6j6AQWXJ8nvzd1Z43Zdju9PDTyNl+q4imCDQyHKJOk97d112c/Z1s7tAA4BMxB/c5
         +n1sxowYmnNugFTZcUrYn2mGe/QjknMuOxD2Xmg2EDCz6TWm5YSSOnFNJsbPZugc2dZw
         1N59j+tDIlXTOUVqj1VsXZxB1jtZIyzbVRcWA3T3SII3bHN5fVPlHW4bOv40e2Q1xT1r
         Z3OkVdSDbo3i8wtaeQeJWj7BIu6353pcsPfjhkTyexdZpGrHQ2nHLJRKrZZYsnAdGNrQ
         Xeig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634309; x=1783239109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LlJmnkelhF4q9kptIVjhPgqzFoGWTxGtKrHeQH4raDM=;
        b=jL66h1EJFKcmlK1V5/4HBNQskLhVj/XQogaHJhoGz/PyNyALPUb6Bd2e67o0cOQa2I
         0mVg63HA6SBoAl/B57ucNBXpAXXFpihWtGUQg+eK5B2zaYGBmMv50K7u+yC2WMwugyz0
         buJ96Y4hpfMNYnGok10a1sFju0HcTmoMNRM5Bjo8wYYJFAgM2vrImauFSp+o8no7k7jm
         0ywSpp9Fyc6p2Or+3fnZxYLBs8hxoPSXEElTa6erRznzpqVh7gtjax/mjMWlFbGgOSFt
         YBjYrsIVwgyey9IB7Y4HK+Mmr4hdBk8xAvtLR9VFwJfzhugoDLyfL60Bjrrj91dxOaUe
         gz3A==
X-Gm-Message-State: AOJu0YwYia9AH6LB74HuWzsrZyeapfv1if3PWgY7HwP8BJ/a1mXhG5vK
	ARtPeM7mJx5uy2vumYNX0eZr7B9vzbgEcGUtfYSAz1s87ghkv9Di8O8bSrI+N4oecBWFOA==
X-Gm-Gg: AfdE7cmYkwHu3CdOzygoMKVpiTWOONI9ImT40NTaRnlMT33sLpU4suJpEOTfot4adp9
	4/xNP0i9qi3w7dS+AvGkMxUb3BBMOJPGxyQ+V7ox+sILyAKRprN2UQ2HYNsrMw10nli9URbfeT5
	hq0hVv4U66HfM8x6K0TwJzTlJVD2sdA++dp1RxtcctZdBHCn/WFh2bStUTkIl3xutQq0pRYMd4u
	9/DRPxVJa/rMkbvo1Lic6t89nu6jENi67dTeWhmnONaazw2KQVsGEjx6a/X3aSUTBaGHT1N0FoY
	1q2fZX30q3fzpCj12OGVAfGFDR7TMppcHEMPrw88nJ1Ul9ywLQcvB77uRxMOwgQOBzWp2IqiAIh
	GbRnJQLOVhdkbz/L/CGAFS5v35L7quLI5gMvCsCfL9Mb6w+99qrlJFP68RgaGeNth1iHj0Ketek
	akIuLF7APZmpfCrqw6fTIRVTCvtrVqy7mUCwmQCYjvM4OKqGdhWKVD1PO0qZqgCu9B2qK0YV4em
	o4S/T9rHN3A8mcuoHconS1MD22v0AGECXI6ljyUiFkcQSOtgAXcPi2kOVPCRb1aX+GEhrlrONUX
	mq3gektylqDG5PUJINJACL9lZzaz+g==
X-Received: by 2002:a05:7300:818e:b0:30c:ab97:d7aa with SMTP id 5a478bee46e88-30cab97dc3amr6294797eec.36.1782634308843;
        Sun, 28 Jun 2026 01:11:48 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:11:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 025/128] libldb: upgrade 2.8.2 -> 2.9.2
Date: Sun, 28 Jun 2026 01:09:36 -0700
Message-ID: <20260628081122.178348-25-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:11:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127835

Forward-port the configure-options patch to 2.9.2.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...b-Add-configure-options-for-packages.patch | 46 +++++++++++++------
 .../{libldb_2.8.2.bb => libldb_2.9.2.bb}      |  2 +-
 2 files changed, 34 insertions(+), 14 deletions(-)
 rename meta-networking/recipes-support/libldb/{libldb_2.8.2.bb => libldb_2.9.2.bb} (97%)

diff --git a/meta-networking/recipes-support/libldb/libldb/0002-ldb-Add-configure-options-for-packages.patch b/meta-networking/recipes-support/libldb/libldb/0002-ldb-Add-configure-options-for-packages.patch
index 15e093fd68..60bb6f1c8d 100644
--- a/meta-networking/recipes-support/libldb/libldb/0002-ldb-Add-configure-options-for-packages.patch
+++ b/meta-networking/recipes-support/libldb/libldb/0002-ldb-Add-configure-options-for-packages.patch
@@ -23,15 +23,15 @@ Rebase to 2.8.0
 Remove libaio option
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
 ---
- lib/replace/wscript | 80 +++++++++++++++++++++++++++++++++------------
- wscript             |  8 +++++
- 2 files changed, 68 insertions(+), 20 deletions(-)
+ lib/replace/wscript | 100 +++++++++++++++++++++++++++++-------------
+ wscript             |   8 +++
+ 2 files changed, 78 insertions(+), 30 deletions(-)
 
 diff --git a/lib/replace/wscript b/lib/replace/wscript
 index 37d7759..d0d6bb0 100644
 --- a/lib/replace/wscript
 +++ b/lib/replace/wscript
-@@ -25,6 +25,34 @@ def options(opt):
+@@ -25,6 +25,34 @@
      opt.PRIVATE_EXTENSION_DEFAULT('')
      opt.RECURSE('buildtools/wafsamba')
  
@@ -66,7 +66,7 @@ index 37d7759..d0d6bb0 100644
  @Utils.run_once
  def configure(conf):
      conf.RECURSE('buildtools/wafsamba')
-@@ -38,12 +66,22 @@ def configure(conf):
+@@ -38,12 +66,22 @@
      conf.DEFINE('HAVE_LIBREPLACE', 1)
      conf.DEFINE('LIBREPLACE_NETWORK_CHECKS', 1)
  
@@ -93,7 +93,7 @@ index 37d7759..d0d6bb0 100644
      conf.CHECK_HEADERS('sys/fcntl.h sys/filio.h sys/filsys.h sys/fs/s5param.h')
      conf.CHECK_HEADERS('sys/id.h sys/ioctl.h sys/ipc.h sys/mman.h sys/mode.h sys/ndir.h sys/priv.h')
      conf.CHECK_HEADERS('sys/resource.h sys/security.h sys/shm.h sys/statfs.h sys/statvfs.h sys/termio.h')
-@@ -113,8 +151,9 @@ def configure(conf):
+@@ -113,8 +151,9 @@
      conf.CHECK_HEADERS('sys/fileio.h sys/filesys.h sys/dustat.h sys/sysmacros.h')
      conf.CHECK_HEADERS('xfs/libxfs.h netgroup.h')
  
@@ -105,7 +105,7 @@ index 37d7759..d0d6bb0 100644
      conf.CHECK_HEADERS('nss_common.h nsswitch.h ns_api.h')
      conf.CHECK_HEADERS('sys/extattr.h sys/ea.h sys/proplist.h sys/cdefs.h')
      conf.CHECK_HEADERS('utmp.h utmpx.h lastlog.h')
-@@ -443,20 +482,21 @@ def configure(conf):
+@@ -443,31 +482,32 @@
  
      strlcpy_in_bsd = False
  
@@ -114,28 +114,49 @@ index 37d7759..d0d6bb0 100644
 -        if conf.CHECK_FUNCS_IN('strlcpy strlcat', 'bsd', headers='bsd/string.h',
 -                               checklibc=True):
 -            strlcpy_in_bsd = True
+-    elif conf.env.enable_fuzzing:
+-        # Just to complicate it more, some versions of Honggfuzz have
+-        # got strlcpy and strlcat in libc, but not in <string.h>
+-        # (unless it is there coincidentally, on a BSD). Therefore we
+-        # can't use CHECK_FUNCS alone to decide whether to add the
+-        # headers to replace.h.
+-        #
+-        # As this is only known to happen on a fuzzing compiler, we'll
+-        # skip the check when not in fuzzing mode.
+-        conf.CHECK_HEADERS('bsd/string.h')
+-
 -    if not conf.CHECK_FUNCS('getpeereid'):
 -        conf.CHECK_FUNCS_IN('getpeereid', 'bsd', headers='sys/types.h bsd/unistd.h')
 -    if not conf.CHECK_FUNCS_IN('setproctitle', 'setproctitle', headers='setproctitle.h'):
 -        conf.CHECK_FUNCS_IN('setproctitle', 'bsd', headers='sys/types.h bsd/unistd.h')
 -    if not conf.CHECK_FUNCS('setproctitle_init'):
 -        conf.CHECK_FUNCS_IN('setproctitle_init', 'bsd', headers='sys/types.h bsd/unistd.h')
--
--    if not conf.CHECK_FUNCS('closefrom'):
--        conf.CHECK_FUNCS_IN('closefrom', 'bsd', headers='bsd/unistd.h')
 +    if Options.options.enable_libbsd:
 +        # libbsd on some platforms provides strlcpy and strlcat
 +        if not conf.CHECK_FUNCS('strlcpy strlcat'):
 +            if conf.CHECK_FUNCS_IN('strlcpy strlcat', 'bsd', headers='bsd/string.h',
 +                                   checklibc=True):
 +                strlcpy_in_bsd = True
++        elif conf.env.enable_fuzzing:
++            # Just to complicate it more, some versions of Honggfuzz have
++            # got strlcpy and strlcat in libc, but not in <string.h>
++            # (unless it is there coincidentally, on a BSD). Therefore we
++            # can't use CHECK_FUNCS alone to decide whether to add the
++            # headers to replace.h.
++            #
++            # As this is only known to happen on a fuzzing compiler, we'll
++            # skip the check when not in fuzzing mode.
++            conf.CHECK_HEADERS('bsd/string.h')
++
 +        if not conf.CHECK_FUNCS('getpeereid'):
 +            conf.CHECK_FUNCS_IN('getpeereid', 'bsd', headers='sys/types.h bsd/unistd.h')
 +        if not conf.CHECK_FUNCS_IN('setproctitle', 'setproctitle', headers='setproctitle.h'):
 +            conf.CHECK_FUNCS_IN('setproctitle', 'bsd', headers='sys/types.h bsd/unistd.h')
 +        if not conf.CHECK_FUNCS('setproctitle_init'):
 +            conf.CHECK_FUNCS_IN('setproctitle_init', 'bsd', headers='sys/types.h bsd/unistd.h')
-+
+ 
+-    if not conf.CHECK_FUNCS('closefrom'):
+-        conf.CHECK_FUNCS_IN('closefrom', 'bsd', headers='bsd/unistd.h')
 +        if not conf.CHECK_FUNCS('closefrom'):
 +            conf.CHECK_FUNCS_IN('closefrom', 'bsd', headers='bsd/unistd.h')
  
@@ -145,7 +166,7 @@ diff --git a/wscript b/wscript
 index ed5d45f..6bb0b37 100644
 --- a/wscript
 +++ b/wscript
-@@ -40,6 +40,14 @@ def options(opt):
+@@ -39,6 +39,14 @@
                     help='disable new LMDB backend for LDB',
                     action='store_true', dest='without_ldb_lmdb', default=False)
  
@@ -162,4 +183,3 @@ index ed5d45f..6bb0b37 100644
      conf.RECURSE('lib/tdb')
 -- 
 2.25.1
-
diff --git a/meta-networking/recipes-support/libldb/libldb_2.8.2.bb b/meta-networking/recipes-support/libldb/libldb_2.9.2.bb
similarity index 97%
rename from meta-networking/recipes-support/libldb/libldb_2.8.2.bb
rename to meta-networking/recipes-support/libldb/libldb_2.9.2.bb
index 016b649cd9..c473c15fff 100644
--- a/meta-networking/recipes-support/libldb/libldb_2.8.2.bb
+++ b/meta-networking/recipes-support/libldb/libldb_2.9.2.bb
@@ -35,7 +35,7 @@ LIC_FILES_CHKSUM = "file://pyldb.h;endline=24;md5=dfbd238cecad76957f7f860fbe9ada
                     file://man/ldb.3.xml;beginline=261;endline=262;md5=137f9fd61040c1505d1aa1019663fd08 \
                     file://tools/ldbdump.c;endline=19;md5=a7d4fc5d1f75676b49df491575a86a42"
 
-SRC_URI[sha256sum] = "0e9aeb657aedbd048b1c0de4afe5b01a8dd33c24a6adb8361a0829374a2fc016"
+SRC_URI[sha256sum] = "d155884002c79dbb1c3d8642f8b1013f2e520b3aeefd6e96412adec5b8d6cbc0"
 
 inherit pkgconfig waf-samba ptest
 


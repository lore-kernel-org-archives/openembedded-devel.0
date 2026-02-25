Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BA0DFCEEBE
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 19:16:45 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.53187.1772046995979278449
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Feb 2026 11:16:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kym+o4fc;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48374014a77so913345e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 11:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772046994; x=1772651794; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=thWCXkkrCunxbJgHYzkABHzCvbMQZUTGgZ/L7M0F3NE=;
        b=kym+o4fcVOjpTldLzXwLyZnCy/MUXGGmw8CvSBGdWJh2OhGHr3wRG++KsLMSCi63bz
         YiJKJstsl87wwLAJgZf3XVhh+BH3PUmnnXCzEgtd4gq43mzqFEVElPEcwQY4xwt/aEqV
         pNEBo1A2WK+WOYXhmzzzXAjOBjtMq/OqI8IptfzEZnzIR8pIxLubOuXUEn2TgErSc6Oq
         yzzYWm+GQbZ0DAua679Nc2rwIZIkkJcoctCyFvwRWA+dHNnGxyeH4OfNxl4xl3YeyDvr
         2aG7G3JytZRQZ0Txrhz/N/xqnEeGL1m+2oRhYwYwJ9suT/utZ62R8TaIdKBt1WBdJ2zN
         U6lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772046994; x=1772651794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=thWCXkkrCunxbJgHYzkABHzCvbMQZUTGgZ/L7M0F3NE=;
        b=ucsBapvmLT3RrfO5yJ7EYADxzp9NKQwyapbNbmy7/JeOhRfFCZ/5OK3hOBoThCMdtQ
         3B11m7yTsmOnPERvxEsWozqJrJVY+PxxlQYiUeFZH/9qvC5B+XqTMYiZTzk8vUKVkBLx
         IsQYP3QiqJCsH0xW68u8CmFlOnl5/otW4rWsVrP8aO61gfejiWApcZ3v8QW2/5F2nKyO
         bid9TTltuNyiAaazZ+s0B/et6u+hsahNPZGx2C+WRahineF18a975E302xUUr+1LZXDX
         C88F5KUuj8qxqPj5bD2pwTXzfRddXQqmlXK9AjI+uDyD3r3q+slSkPmFpZWpuwJouaZB
         KHbg==
X-Gm-Message-State: AOJu0Yzx+a6CZHgETXOrZitlrWk9ehqTXGbbzvK0/gP+3tf6nVBk7rUq
	Axcneho6kD5SpwfmIFjPKaX3dfdHsUZcQgIe+Nsm3DyIhGarN0HGIrMFcQrj9w==
X-Gm-Gg: ATEYQzxJ2boapHWAgy247m6mD9HE46TcP2QLbxWmETPpRBY1moAk953tAoZwatBnLcK
	dxpbuYMhyC64ioqtk1Ii3YcvaIhIsb6uteTDYB9gTUHK5nzZja/w94z5hKbl9k3n3Uxoc7J1jGm
	igDUFSjWj0WlXYi4ZsnFVtDVt54+iRpfFjxGoXI3HARmRYmuV6BPm6v1xmpQFyvHMXsFQVPynH8
	6NvnK/4t8Ou+ZU+AQjx+chxYImjE0s6UDIC4SBlWjscqByRhdnyGFtUIXmaIv+a0cH0nelTRour
	Ha+/F2sxO8nGNCBDDuJ/tTJZ78zmjv6zgQJmWJ24qNrp+QIBn3huQWx/CTm6vRZNfBP5nrEgWo3
	281WNAKYWb/prl0/ouun2vax93rQ6o6B3KkEjKHBpUq6FLECgkTaVbfQu9//prMPFcwukG459g7
	dFd0+WcnbGh264I+eo5/m9
X-Received: by 2002:a05:600c:620c:b0:483:43d8:8d68 with SMTP id 5b1f17b1804b1-483a95f8988mr268885115e9.28.1772046994127;
        Wed, 25 Feb 2026 11:16:34 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfb296bfsm23804925e9.0.2026.02.25.11.16.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 11:16:33 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-filesystems][PATCH 2/2] owfs: upgrade 3.2p3 -> 3.2p4
Date: Wed, 25 Feb 2026 20:16:32 +0100
Message-ID: <20260225191632.648394-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260225191632.648394-1-skandigraun@gmail.com>
References: <20260225191632.648394-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 19:16:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124660

Drop patch that's included in this release.

Changelog:
v3.2p4 is mainly a bugfix & cleanup release.

Enhancements
    Add support for InfernoEmbedded soft-devices (GH-21)

Bug fixes
    Fix bug (GH-55) related to split packet (GH-64)
    Fix copy paste bug (474f06d)
    Add \r to Http header to satisfy RFC2616 specification (GH-20)

Maintenance
    build system cleanup (GH-72, GH-27, GH-16)
    Fix missing files in source distribution (GH-70, GH-69)
    Fix compilation with GCC10 (GH-62)

Minor fixes
    Fix typos (GH-43 GH-23)

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../owfs/0001-Add-build-rule-for-README.patch |  6 +--
 .../0001-Fix-compilation-with-GCC10.patch     | 44 -------------------
 .../owfs/{owfs_3.2p3.bb => owfs_3.2p4.bb}     |  7 ++-
 3 files changed, 6 insertions(+), 51 deletions(-)
 delete mode 100644 meta-filesystems/recipes-filesystems/owfs/owfs/0001-Fix-compilation-with-GCC10.patch
 rename meta-filesystems/recipes-filesystems/owfs/{owfs_3.2p3.bb => owfs_3.2p4.bb} (96%)

diff --git a/meta-filesystems/recipes-filesystems/owfs/owfs/0001-Add-build-rule-for-README.patch b/meta-filesystems/recipes-filesystems/owfs/owfs/0001-Add-build-rule-for-README.patch
index 870d0ef056..229c58f1d0 100644
--- a/meta-filesystems/recipes-filesystems/owfs/owfs/0001-Add-build-rule-for-README.patch
+++ b/meta-filesystems/recipes-filesystems/owfs/owfs/0001-Add-build-rule-for-README.patch
@@ -17,11 +17,11 @@ diff --git a/Makefile.am b/Makefile.am
 index e0c4ad6..0449321 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -35,3 +35,4 @@ rpmcvs: preparerpm
+@@ -30,3 +30,5 @@ rpm: preparerpm
+ rpmcvs: preparerpm
  	@LN_S@ -f `pwd`/@PACKAGE@-@VERSION@.tar.gz ${RPMDIR}/SOURCES/@PACKAGE@-@VERSION@_cvs_`date +"%Y%m%d"`.tar.gz
  	cd ${RPMDIR}/SPECS && @RPMBUILD@ -ba @PACKAGE@.spec --define 'cvs 1'
- 
++
 +README: README.md
 -- 
 2.7.4
-
diff --git a/meta-filesystems/recipes-filesystems/owfs/owfs/0001-Fix-compilation-with-GCC10.patch b/meta-filesystems/recipes-filesystems/owfs/owfs/0001-Fix-compilation-with-GCC10.patch
deleted file mode 100644
index 6426ecb247..0000000000
--- a/meta-filesystems/recipes-filesystems/owfs/owfs/0001-Fix-compilation-with-GCC10.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From a812202d22a2861318b8e39f1cd74cd222f8e76f Mon Sep 17 00:00:00 2001
-From: "Azamat H. Hackimov" <azamat.hackimov@gmail.com>
-Date: Tue, 9 Jun 2020 11:30:38 +0300
-Subject: [PATCH] Fix compilation with GCC10
-
-Fixed compilation with -fno-common, which enabled in GCC 10 by default.
-See https://bugs.gentoo.org/707438.
-
-Upstream-Status: Backport [https://github.com/owfs/owfs/pull/62]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- module/owserver/src/c/owserver.c       | 2 ++
- module/owserver/src/include/owserver.h | 2 +-
- 2 files changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/module/owserver/src/c/owserver.c b/module/owserver/src/c/owserver.c
-index db29988e..2ed29161 100644
---- a/module/owserver/src/c/owserver.c
-+++ b/module/owserver/src/c/owserver.c
-@@ -36,6 +36,8 @@
- 
- #include "owserver.h"
- 
-+pthread_mutex_t persistence_mutex ;
-+
- /* --- Prototypes ------------ */
- static void SetupAntiloop(int argc, char **argv);
- 
-diff --git a/module/owserver/src/include/owserver.h b/module/owserver/src/include/owserver.h
-index 8be582f0..a257ed02 100644
---- a/module/owserver/src/include/owserver.h
-+++ b/module/owserver/src/include/owserver.h
-@@ -18,7 +18,7 @@
- #include "ow.h"
- #include "ow_connection.h"
- 
--pthread_mutex_t persistence_mutex ;
-+extern pthread_mutex_t persistence_mutex ;
- #define PERSISTENCELOCK    _MUTEX_LOCK(   persistence_mutex ) ;
- #define PERSISTENCEUNLOCK  _MUTEX_UNLOCK( persistence_mutex ) ;
- 
--- 
-2.28.0
-
diff --git a/meta-filesystems/recipes-filesystems/owfs/owfs_3.2p3.bb b/meta-filesystems/recipes-filesystems/owfs/owfs_3.2p4.bb
similarity index 96%
rename from meta-filesystems/recipes-filesystems/owfs/owfs_3.2p3.bb
rename to meta-filesystems/recipes-filesystems/owfs/owfs_3.2p4.bb
index 890c8aecc0..94379939de 100644
--- a/meta-filesystems/recipes-filesystems/owfs/owfs_3.2p3.bb
+++ b/meta-filesystems/recipes-filesystems/owfs/owfs_3.2p4.bb
@@ -8,11 +8,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=628b867016631792781a8735a04760e5 \
                     file://COPYING.LIB;md5=9021b7435efdd9fb22beef8291134099"
 
 DEPENDS = "fuse virtual/libusb0"
-# v3.2p3
-SRCREV = "3744375dfaa350e31c9b360eb1e1a517bbeb5c47"
-SRC_URI = "git://github.com/owfs/owfs;branch=master;protocol=https \
+
+SRCREV = "c68deb1fc6d30fcc5eabe0a0d9c9dc2ca54e455a"
+SRC_URI = "git://github.com/owfs/owfs;branch=master;protocol=https;tag=v${PV} \
            file://0001-Add-build-rule-for-README.patch \
-           file://0001-Fix-compilation-with-GCC10.patch \
            file://owhttpd \
            file://owserver \
            "


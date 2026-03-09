Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B24E5FCA19C
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 22:14:19 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26895.1773094453598969197
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Mar 2026 15:14:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O1PViBJI;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-358d80f60ccso6569301a91.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 15:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773094453; x=1773699253; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7HYjFNn4MHHbo7k1/8AXiFyizfjEbO9WglKCP/JCirE=;
        b=O1PViBJIS6WYvw/j7SKB62lww1f4be+8VrQQLyf7FipPABYVgpDBQxX/89qbkJJclX
         YNJ/gwm1AoNu9O9N2Y6wxS2juSnsDAlyM8W23WjX/G5koNphlYOFtprLymIncwgDRDMB
         TtGuv2qIATjoFAVd32kZ9+38jeZE0qGM086NPYfO2CihQAbDHac439pmD4tqUaYXWLF1
         RiSd4NcpeFNpckZ4HcKS3yKd7iu6eySQmdQa3Nqa25EaVGz/KEvJpZhAFkM2DU2y9BKu
         Tn3JUBf7S85v7zmObiKoygaE4pGv5+Pp+//DeneG37rdIs161P8FEtQL/hCs0Jpv9Znq
         R48w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773094453; x=1773699253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7HYjFNn4MHHbo7k1/8AXiFyizfjEbO9WglKCP/JCirE=;
        b=CsWHkQ8iHi5iaItjsayTLwWKyRNj1tCSfDhXS1lv33/LeFMrWNShBXHn18b0YEzIW8
         X7sPbQWl8umhc5GaF1yXhpiuS6F+IDjhsGX71f39d13Sdo3RXcbeyW5tXYsrQuLU7vay
         fSHAZIc8lpC+xncDnbbloZGjgrNAHz1hqGlsvg/NVPUJoJDwuxT2gCWO1X6tpQ6Zk3oQ
         SSl9sGfi0O0QXS9WKqrcMJ/32ijK4L48kWSjk5ijc/PYzdrAsX47D+paV134Wq0rtcMP
         OWzqYJV5EP+fs+YNSRKMqM4KCmTPlTat5YMz78GtdSICKTlMn2JoqlWnYP7AXmTkDTWL
         JEDg==
X-Gm-Message-State: AOJu0YyyiKxQe5N1Y6vs8sAre54B48C6Ir45O2sEwXM3ymoAkOs2P8KA
	aRrCg2qbIqx11G0TDjYZwL63a7AMsbTKpZ4X7JFsoQveiMYjCUIk1Oz0elilVw==
X-Gm-Gg: ATEYQzya2DxC00YTMkBw+kJy/WqXVSaNyUnC7vNGtNWQ8RG78RJE2xKmBVo1kuKPHyp
	J4CY26nJ+a08Dgkk+o4YL02G3ohtg+gzBgJEW/vir+VXl+YuToq64VbuRRYnNrs7uo5yLhlBoQS
	PE9kNyjp5qIJMd07ymOCxXVflzqOs01mq+U2tFUHRBBEFvCVbNoS5f5y8vT/k4aPWN9OBaRTL8q
	GuoqAXBLwIievgS4qwXjfwHLuaoVjTn4ekoJYCtdkcqyAXmX0ngzy711Fvjixui22/W+2h+2ibJ
	qsHY/zVAQT4ICad6/vHXxQzhFDhK1BFXFT5OYfW9Cdry8tN35F8GdTCdtKdbAFqiZa4vwJBeoeP
	c6BEupXGUOvm5kK9oh4hqvbKlybRHKEiY3+zOh1nU0vU4Hfa6AzmyNXGJPplbQ39rWpXAsyzybo
	C6mURMptV7jQe0aE/aCPNuXegc115moI7PLu0=
X-Received: by 2002:a17:90b:3e45:b0:354:9b3f:710b with SMTP id 98e67ed59e1d1-359be32bc30mr10862534a91.19.1773094452790;
        Mon, 09 Mar 2026 15:14:12 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.26])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359bbc060d7sm5991413a91.2.2026.03.09.15.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 15:14:12 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-filesystem][whinlatter][PATCH 3/4] owfs: upgrade 3.2p3 -> 3.2p4
Date: Tue, 10 Mar 2026 11:13:53 +1300
Message-ID: <20260309221354.1058134-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309221354.1058134-1-ankur.tyagi85@gmail.com>
References: <20260309221354.1058134-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 22:14:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125010

From: Gyorgy Sarvari <skandigraun@gmail.com>

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
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 58259850fe6302a752548e910198fa080b49ea66)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
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


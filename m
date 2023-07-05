Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D520BC3DA41
	for <webhook@archiver.kernel.org>; Wed,  5 Jul 2023 17:26:04 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.1025.1688577957449091557
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Jul 2023 10:25:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=M8XW+u5f;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6686a05bc66so3715433b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Jul 2023 10:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688577957; x=1691169957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QC7hbcs07AKHmuD0sTMbukeieO5HcVa3onaJxCJWWDM=;
        b=M8XW+u5fcNKFOxcDZegLkTt2x/5Rmhqm1A7HgE2Jb/N1rINtAy0I6xcS2c9YaYvAP9
         fPlp5oBIqgDJ13J0kkir1ZPg++zpKcNRBvVqN+G4OysUxxNUtR5R6OR2IoZk3bqeX9vy
         I2WMG+cqBtkg/ph2e93n/22Tk5jieQGRDsqqRxzl+7igDLYQNQbzpMJ+gWDWUXOcp9i8
         9X4JBqJbLVz8Nm5Vv4zckTxBNnAQEbk1Poyzmnb0D1MKHVCiP8ukk028B9uHLEDBhcEc
         vuuhSwKtiUP45AMEP4+O5HsLiu/37SWg9XKH0bmFCgxm+QCwcXiaBmzgp600XglX5Vfn
         qn0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688577957; x=1691169957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QC7hbcs07AKHmuD0sTMbukeieO5HcVa3onaJxCJWWDM=;
        b=N2f/SYcF/0QMcgKJhAkQh5M2PL65c3QRpC02sJaWPag+9w5oky8tgfqdMgvwBgx/I8
         GwDXr6r5aIgnxveHHil3Ylivc2xLpoGpC3F3t1uWx+ZOSeO8cdl+Kzi7gwhgN20Jpk+h
         UnDtE9Qrpx1NdrQJotdl6uyibUb70hRq1IK5oFiNJzR3wovk3nHpV6Yluhq3eq8y0Pc4
         3hmY3I3u1vkhr8lrG0dTF66/vjMkmcWSJh+0jJn5x7fsquzVZVnT9MU2hQtpOP1lXDrx
         PxLOVyFBpHT8Vx6sDbS+F1MTk6PvHSG4hzeAEqsQY5BpT1b+tfEXyb6Ygl9H8K2N/j/g
         ItDg==
X-Gm-Message-State: ABy/qLZ8lKkhPvsJZCKoDjOt+toiD18T1w7m/FPEuqgC1Uh8bBz5VTzZ
	L9GNIDtC2EbnKOjh1LDoqOJ88AvfNT8=
X-Google-Smtp-Source: APBJJlFAmwwmMDUMIYCOUU+7IZYZ02VbZhdt27niCvRCT9bZCIaInKQBj0V9hm7oqVvGhuwa7fp/uQ==
X-Received: by 2002:a05:6a20:7f93:b0:12f:46ef:a76f with SMTP id d19-20020a056a207f9300b0012f46efa76fmr4832242pzj.41.1688577956545;
        Wed, 05 Jul 2023 10:25:56 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::81d4])
        by smtp.gmail.com with ESMTPSA id w6-20020aa78586000000b0067b384d5955sm13869174pfn.26.2023.07.05.10.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 10:25:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/4] pcp: Fix build race
Date: Wed,  5 Jul 2023 10:25:50 -0700
Message-ID: <20230705172550.3371930-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230705172550.3371930-1-raj.khem@gmail.com>
References: <20230705172550.3371930-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Jul 2023 17:26:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103671

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/pcp/pcp.inc           |  1 +
 ...ndency-order-of-header-and-sourcefil.patch | 36 +++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 meta-oe/recipes-support/pcp/pcp/0001-htop-Change-dependency-order-of-header-and-sourcefil.patch

diff --git a/meta-oe/recipes-support/pcp/pcp.inc b/meta-oe/recipes-support/pcp/pcp.inc
index 276be7ffaa..b2d6e130b4 100644
--- a/meta-oe/recipes-support/pcp/pcp.inc
+++ b/meta-oe/recipes-support/pcp/pcp.inc
@@ -9,6 +9,7 @@ COMPATIBLE_HOST:libc-musl = "null"
 
 SRC_URI = "https://performancecopilot.jfrog.io/artifactory/pcp-source-release/${BP}.src.tar.gz \
            file://0001-configure-Limit-the-header-search-to-sysroot.patch \
+           file://0001-htop-Change-dependency-order-of-header-and-sourcefil.patch \
            file://config.linux \
 	   "
 SRC_URI[sha256sum] = "dacf92ba195f1f2ea8f40bf0c455d2cd2456273a1e30dcc3ee5b5bfd099a99ee"
diff --git a/meta-oe/recipes-support/pcp/pcp/0001-htop-Change-dependency-order-of-header-and-sourcefil.patch b/meta-oe/recipes-support/pcp/pcp/0001-htop-Change-dependency-order-of-header-and-sourcefil.patch
new file mode 100644
index 0000000000..009dfe2d04
--- /dev/null
+++ b/meta-oe/recipes-support/pcp/pcp/0001-htop-Change-dependency-order-of-header-and-sourcefil.patch
@@ -0,0 +1,36 @@
+From c123980d6bf1bc2bf93ee0dd0d7f8fee3d4ddc96 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 5 Jul 2023 08:45:14 -0700
+Subject: [PATCH] htop: Change dependency order of header and sourcefiles
+
+Fixes build race
+| pcp/Platform.h:29:10: fatal error: DiskIOMeter.h: No such file or directory
+|    29 | #include "DiskIOMeter.h"
+|       |          ^~~~~~~~~~~~~~~
+| compilation terminated.
+| make[3]: *** [<builtin>: pcp-htop.o] Error 1
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/pcp/htop/GNUmakefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/pcp/htop/GNUmakefile b/src/pcp/htop/GNUmakefile
+index 6b7c0c5..5153c63 100644
+--- a/src/pcp/htop/GNUmakefile
++++ b/src/pcp/htop/GNUmakefile
+@@ -186,8 +186,8 @@ CFGMETERS = $(patsubst %,pcp/meters/%,$(METERS))
+ CFGCOLUMNS = $(patsubst %,pcp/columns/%,$(COLUMNS))
+ 
+ CFGXFILES = $(CFGMETERS) $(CFGCOLUMNS)
+-TOPXFILES = $(TOPCFILES) $(TOPHFILES) $(DOCFILES)
+-SUBXFILES = $(SUBCFILES) $(SUBHFILES)
++TOPXFILES = $(TOPHFILES) $(TOPCFILES) $(DOCFILES)
++SUBXFILES = $(SUBHFILES) $(SUBCFILES)
+ CFILES = $(TOPCFILES) $(SUBCFILES)
+ HFILES = $(TOPHFILES) $(SUBHFILES)
+ LDIRT = $(TOPXFILES) $(SUBXFILES) $(CFGXFILES) \
+-- 
+2.41.0
+
-- 
2.41.0



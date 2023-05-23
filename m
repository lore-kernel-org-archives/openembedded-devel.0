Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 650F1C7EE29
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 22:06:43 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.16584.1684879602034952416
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 May 2023 15:06:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=lvC3lyMv;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1ae8ecb4f9aso1548095ad.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 May 2023 15:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684879601; x=1687471601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0T2BnoOIMiR4xuM/l9GbLMA/oAzZTSo7MDLmg5EdlnA=;
        b=lvC3lyMvX9zjuV9mp2vUHUDiVinodto4xmb85/qmhH0ekLLzwCfcRWWJAqG5YIUJeH
         nRjawCTQFus3pxjyQFObgIF+yOEl7FC7JAVDhAwFcovmbosLJES/e3rjeK+tJCDvW/m2
         h0mqZ3n7Pat/46Ng3+xI4WqN0E2J/io6+Ju7jEC6uxadPhbVLAvbeClmVl5fTZvXmfN8
         j4aLknOIBAm/dJqISOC9But8IR4D+nBy4jektS5lZbSKkyKPdV+1UZuzSwJ63odh2QTR
         vwudk/+76p0m+AM/VjDTgGvw7hxSi72/vve0eq9cYwZw93H8I09xgvx/KqITr4hhQpmS
         pbyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684879601; x=1687471601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0T2BnoOIMiR4xuM/l9GbLMA/oAzZTSo7MDLmg5EdlnA=;
        b=iQLFFtAVBmob0tnlgw7zMkbbsyJtkPFDXkJW6A1rhnsSjm4OiK/8/kv922xipfNOtN
         4ATzpOc7fDBak4OSHWQoBNKgmDsqw+sfyMewH8zbpA2TRNPJ4bu7kztGEcS3nnWbADHL
         HPfLC/XG5m/0AzNLOg/FTdhtXa30GEs6XOORIkVh4v4zTpZ2Py4IaNkQRMvaKpudErHc
         ahgAwIZtjs16SIKqIrCYQfJys5y5ZCRTjZqgSr2Y77KX/S1zXZKDMLS6aGxAH5mWeRVI
         v8qFDD4jCC0EPPmyXLfw2Dj9L7kQJz5rcelxmF9UGzFBaZC4ABAxzcd1FWFyDHzW3Oqv
         e+Bg==
X-Gm-Message-State: AC+VfDy/fnqFD1x4pCCEz9lP1EpOUd8txmZFb+GtAsabYi4ETtesI+qV
	fkHLIIerUC1NnHjWY/p21y8i+YUsavc=
X-Google-Smtp-Source: ACHHUZ5oy7en6yyhQp15vDnvbxJLK0h+Cq6N387GDwuYsMwQ7D7g3QHoBgbfZwCzle9JKE9xuavInQ==
X-Received: by 2002:a17:902:cec3:b0:1ae:8bd9:e015 with SMTP id d3-20020a170902cec300b001ae8bd9e015mr15363156plg.5.1684879601034;
        Tue, 23 May 2023 15:06:41 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::c675])
        by smtp.gmail.com with ESMTPSA id l12-20020a170902d34c00b001aaea39043dsm7238191plk.41.2023.05.23.15.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 15:06:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH v2 3/3] uml-utilities: Fix references to TMPDIR
Date: Tue, 23 May 2023 15:06:37 -0700
Message-Id: <20230523220637.946337-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230523220637.946337-1-raj.khem@gmail.com>
References: <20230523220637.946337-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 May 2023 22:06:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102748

Pass CFLAGS from environment

Fixes
WARNING: uml-utilities-20040406-r1 do_package_qa: QA Issue: File /usr/lib/uml/.debug/port-helper in package uml-utilities-dbg contains reference to TMPDIR

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-cow.c-Replace-stat64-with-stat.patch |  34 +++++
 ...ppend-to-CFLAGS-instead-of-re-assign.patch | 122 ++++++++++++++++++
 .../uml-utilities/uml-utilities_20040406.bb   |   2 +
 3 files changed, 158 insertions(+)
 create mode 100644 meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/0001-cow.c-Replace-stat64-with-stat.patch
 create mode 100644 meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/0001-makefiles-Append-to-CFLAGS-instead-of-re-assign.patch

diff --git a/meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/0001-cow.c-Replace-stat64-with-stat.patch b/meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/0001-cow.c-Replace-stat64-with-stat.patch
new file mode 100644
index 0000000000..348d7ce104
--- /dev/null
+++ b/meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/0001-cow.c-Replace-stat64-with-stat.patch
@@ -0,0 +1,34 @@
+From c4f85268da6c30b0aec3d9a0e951b2088887cff4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 22 May 2023 18:35:37 -0700
+Subject: [PATCH] cow.c: Replace stat64 with stat
+
+LFS64 is deprecated in latest musl and this fails to build
+therefore switch to using stat API which is same as stat64 these days
+
+Upstream-Status: Inappropriate [No upstream]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ moo/cow.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+--- a/moo/cow.c
++++ b/moo/cow.c
+@@ -161,7 +161,7 @@ int write_cow_header(char *cow_file, int
+ 		     int sectorsize, int alignment, long long *size)
+ {
+         struct cow_header_v3 *header;
+-	struct stat64 buf;
++	struct stat buf;
+ 	int err;
+ 
+ 	err = cow_seek_file(fd, 0);
+@@ -192,7 +192,7 @@ int write_cow_header(char *cow_file, int
+ 		      backing_file))
+ 		goto out_free;
+ 
+-	err = stat64(header->backing_file, &buf);
++	err = stat(header->backing_file, &buf);
+ 	if(err < 0){
+ 		cow_printf("Stat of backing file '%s' failed, errno = %d\n",
+ 			   header->backing_file, errno);
diff --git a/meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/0001-makefiles-Append-to-CFLAGS-instead-of-re-assign.patch b/meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/0001-makefiles-Append-to-CFLAGS-instead-of-re-assign.patch
new file mode 100644
index 0000000000..1962e84c7e
--- /dev/null
+++ b/meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/0001-makefiles-Append-to-CFLAGS-instead-of-re-assign.patch
@@ -0,0 +1,122 @@
+From ac72fffe639d564f59ec1e1eafde83980acef1b5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 23 May 2023 14:40:31 -0700
+Subject: [PATCH] makefiles: Append to CFLAGS instead of re-assign
+
+This helps in inserting yocto provided CFLAGS from build environment
+
+Upstream-Status: Inappropriate [No upstream]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ jailtest/Makefile    | 2 +-
+ mconsole/Makefile    | 2 +-
+ moo/Makefile         | 2 +-
+ port-helper/Makefile | 2 +-
+ tunctl/Makefile      | 2 +-
+ uml_net/Makefile     | 2 +-
+ uml_router/Makefile  | 2 +-
+ watchdog/Makefile    | 2 +-
+ 8 files changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/jailtest/Makefile b/jailtest/Makefile
+index 610ca1a..025fca9 100644
+--- a/jailtest/Makefile
++++ b/jailtest/Makefile
+@@ -1,6 +1,6 @@
+ OBJS = jailtest.o
+ BIN = jailtest
+-CFLAGS = -g -Wall
++CFLAGS += -g -Wall
+ 
+ BIN_DIR ?= /usr/bin
+ 
+diff --git a/mconsole/Makefile b/mconsole/Makefile
+index 9818d8a..74a2560 100644
+--- a/mconsole/Makefile
++++ b/mconsole/Makefile
+@@ -1,6 +1,6 @@
+ BIN = uml_mconsole
+ OBJS = $(BIN).o
+-CFLAGS = -g -Wall
++CFLAGS += -g -Wall
+ 
+ BIN_DIR ?= /usr/bin
+ 
+diff --git a/moo/Makefile b/moo/Makefile
+index 6cdb591..60d300d 100644
+--- a/moo/Makefile
++++ b/moo/Makefile
+@@ -3,7 +3,7 @@ BIN = uml_moo uml_mkcow
+ uml_moo_OBJS = uml_moo.o cow.o
+ uml_mkcow_OBJS = uml_mkcow.o cow.o
+ 
+-CFLAGS = -g -Wall -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE
++CFLAGS += -g -Wall -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE
+ 
+ BIN_DIR ?= /usr/bin
+ 
+diff --git a/port-helper/Makefile b/port-helper/Makefile
+index 8e33bdf..8b695f3 100644
+--- a/port-helper/Makefile
++++ b/port-helper/Makefile
+@@ -1,6 +1,6 @@
+ OBJS = port-helper.o
+ BIN = port-helper
+-CFLAGS = -g -Wall
++CFLAGS += -g -Wall
+ 
+ LIB_DIR ?= /usr/lib/uml
+ 
+diff --git a/tunctl/Makefile b/tunctl/Makefile
+index 743bfea..a39ad2b 100644
+--- a/tunctl/Makefile
++++ b/tunctl/Makefile
+@@ -1,6 +1,6 @@
+ OBJS = tunctl.o
+ BIN = tunctl
+-CFLAGS = -g -Wall
++CFLAGS += -g -Wall
+ 
+ BIN_DIR ?= /usr/bin
+ 
+diff --git a/uml_net/Makefile b/uml_net/Makefile
+index 36efec6..2e1ad0e 100644
+--- a/uml_net/Makefile
++++ b/uml_net/Makefile
+@@ -1,7 +1,7 @@
+ TUNTAP = $(shell [ -e /usr/include/linux/if_tun.h ] && echo -DTUNTAP)
+ 
+ BIN = uml_net
+-CFLAGS = -g -Wall $(TUNTAP)
++CFLAGS += -g -Wall $(TUNTAP)
+ 
+ BIN_DIR ?= /usr/bin
+ 
+diff --git a/uml_router/Makefile b/uml_router/Makefile
+index b7b5401..e399ea5 100644
+--- a/uml_router/Makefile
++++ b/uml_router/Makefile
+@@ -2,7 +2,7 @@ TUNTAP = $(shell [ -e /usr/include/linux/if_tun.h ] && echo -DTUNTAP)
+ 
+ OBJS = hash.o port.o uml_switch.o 
+ BIN = uml_switch
+-CFLAGS = -g -Wall $(TUNTAP)
++CFLAGS += -g -Wall $(TUNTAP)
+ 
+ BIN_DIR ?= /usr/bin
+ 
+diff --git a/watchdog/Makefile b/watchdog/Makefile
+index c26fd9f..5178cc6 100644
+--- a/watchdog/Makefile
++++ b/watchdog/Makefile
+@@ -1,6 +1,6 @@
+ BIN = uml_watchdog
+ OBJS = $(BIN).o
+-CFLAGS = -g -Wall
++CFLAGS += -g -Wall
+ 
+ BIN_DIR ?= /usr/bin
+ 
+-- 
+2.40.1
+
diff --git a/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb b/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb
index 35ae5f777d..54bc1b21f1 100644
--- a/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb
+++ b/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb
@@ -8,6 +8,8 @@ SRC_URI = "http://downloads.sourceforge.net/project/user-mode-linux/tools/1/uml_
            file://unstrip.patch \
            file://0001-include-required-system-header-files-for-fd_set-and-.patch \
            file://0001-Add-missing-standard-headers-for-str-and-exit-APIs.patch \
+           file://0001-cow.c-Replace-stat64-with-stat.patch \
+           file://0001-makefiles-Append-to-CFLAGS-instead-of-re-assign.patch \
            "
 SRC_URI[md5sum] = "2c1ccd9efacbfb39e42d482b89b2550a"
 SRC_URI[sha256sum] = "4f179b1db021ef15ac7e9b2eed57c525db127a754c574f591c367460cded9f41"
-- 
2.40.1



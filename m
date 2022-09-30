Return-Path: <beniaminsandu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C261C4332F
	for <webhook@archiver.kernel.org>; Fri, 30 Sep 2022 14:30:19 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web12.6252.1664548213877590470
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Sep 2022 07:30:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=g02m8IQZ;
 spf=pass (domain: gmail.com, ip: 209.85.167.44,
 mailfrom: beniaminsandu@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id j16so7172041lfg.1
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Sep 2022 07:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=IrPtROcgPjEr8DANfTrtIcRNTD2wLRJKgXYgQLbmg8M=;
        b=g02m8IQZdnHrDJXzu5AjQ2vaYNybJqPmksgfcti7sbLu7AhhLble8EcdJSQW0XZsMk
         W3kVB08s72vY8HaTMvCQGmzrcD8d78A1DRxAocKpRMvrcO651iImlbPgL+X5xiLIz8cu
         FntcBbePiziuHQuzZRE8riloljtTACqd9D5WmJ+rUYzW4Eex036GvxeVrLCp1SFa+d0m
         Ii4nflcP8oavZQM2fq9oSf9k2oh7W1leZfVfPY5b2YM6HrZOEYQ1TJmMtZXOnbPfscsk
         rle/K5bwFWv8SsRElyNDacZJ8S4OtX5W0W1tRH3gKyzF6782YYF+vra/dwQe1BD8Pvm0
         4DKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=IrPtROcgPjEr8DANfTrtIcRNTD2wLRJKgXYgQLbmg8M=;
        b=nfMhXvyZl+n66E9smXdncxlLOPv6rUpp2VaoV7NZt4V613eMLMXQ4w7shiY1Chrv8E
         hrF1mhOMLYDukysW9ImkTvNJKcr/T5YQOKHMzBw6IoglnoSKKoI5QnS4+XHIizDZHyZ3
         BwSuNRetkkz5YmGK3g0LoFJAz4a14VCH33h1vn+tAyYnaGw9tug39VilGTTQbCEtODWe
         L0WMXOwmBUo8VgxRSbgn1tMPFnuEk9W3exevazelIenjh0BnF/+K7+WOjzpyzDBbJrtd
         N/Xcj5uTnXSFoJdI73kqqsGWyTaopZP7CCk0hIJ0s3XEafQCuhGmsV3Ws8ESXmjOSYZ3
         vntg==
X-Gm-Message-State: ACrzQf3USKvzbrbK/O59uK5Y/WuGVfPPnY5lcHMRu0B/3/RMDAvon20S
	ccFYUHCYDPOGSS7BJelGa7htueo5SiahXrwq
X-Google-Smtp-Source: 
 AMsMyM7d/4/X9pNn1gqJ3yPZ2ZVoIKUeMAnU8U3TFzSQ3xE4MOWTDnofb0wUaKYTHVJzZ8cOIf6ZNQ==
X-Received: by 2002:a05:6512:1309:b0:492:e273:d800 with SMTP id
 x9-20020a056512130900b00492e273d800mr3298577lfu.93.1664548210758;
        Fri, 30 Sep 2022 07:30:10 -0700 (PDT)
Received: from localhost.localdomain (c80-216-73-242.bredband.tele2.se.
 [80.216.73.242])
        by smtp.gmail.com with ESMTPSA id
 o12-20020a056512230c00b00494a27500c1sm307125lfu.163.2022.09.30.07.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 07:30:10 -0700 (PDT)
From: Beniamin Sandu <beniaminsandu@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Beniamin Sandu <beniaminsandu@gmail.com>
Subject: [meta-oe][PATCH] libnet: update to v1.2 release
Date: Fri, 30 Sep 2022 16:29:57 +0200
Message-Id: <20220930142957.1394549-1-beniaminsandu@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 Sep 2022 14:30:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99025

The previous recipe was building a release candidate from
2014. Switch to the official git repo which is currently
maintained and use the v1.2 release instead.

The extra patch fixes build on musl.

Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
---
 ...sl-libc-remove-support-for-glibc-2.1.patch | 58 -------------------
 ...64_t-instead-of-__int64_t-for-mingw-.patch | 31 ++++++++++
 .../libnet/libnet_1.2-rc3.bb                  | 24 --------
 .../recipes-connectivity/libnet/libnet_1.2.bb | 19 ++++++
 4 files changed, 50 insertions(+), 82 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/libnet/libnet/0001-Support-musl-libc-remove-support-for-glibc-2.1.patch
 create mode 100644 meta-oe/recipes-connectivity/libnet/libnet/0001-Use-standard-int64_t-instead-of-__int64_t-for-mingw-.patch
 delete mode 100644 meta-oe/recipes-connectivity/libnet/libnet_1.2-rc3.bb
 create mode 100644 meta-oe/recipes-connectivity/libnet/libnet_1.2.bb

diff --git a/meta-oe/recipes-connectivity/libnet/libnet/0001-Support-musl-libc-remove-support-for-glibc-2.1.patch b/meta-oe/recipes-connectivity/libnet/libnet/0001-Support-musl-libc-remove-support-for-glibc-2.1.patch
deleted file mode 100644
index 98008dba9..000000000
--- a/meta-oe/recipes-connectivity/libnet/libnet/0001-Support-musl-libc-remove-support-for-glibc-2.1.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From ffd7fab744a9ad2893169a8fb6244074604d5d0d Mon Sep 17 00:00:00 2001
-From: rofl0r <retnyg@gmx.net>
-Date: Tue, 12 Aug 2014 21:51:39 +0200
-Subject: [PATCH] Support musl libc, remove support for glibc < 2.1
-
-Upstream-Status: Backport
-
-The workarounds for glibc < 2.1 (was released february 1999) break the
-build with musl libc.
-
-It is very unlikely that 2.0 or earlier is still in use, and if so,
-1) that's a big security hole
-2) code wouldnt compile anyway since noone tested build in the last decade
-3) user of it wouldn't expect anyway to get bleeding edge sw built on it,
-   so he would just use the latest version that works for him.
-
-Closes #52
-
-Signed-off-by: rofl0r <retnyg@gmx.net>
-Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
----
- libnet/src/libnet_link_linux.c | 11 -----------
- 1 file changed, 11 deletions(-)
-
-diff --git a/src/libnet_link_linux.c b/src/libnet_link_linux.c
-index 054458d..3c6df3c 100644
---- a/src/libnet_link_linux.c
-+++ b/src/libnet_link_linux.c
-@@ -30,26 +30,15 @@
- #include <sys/time.h>
- 
- #include <net/if.h>
--#if (__GLIBC__)
- #include <netinet/if_ether.h>
- #include <net/if_arp.h>
--#else
--#include <linux/if_arp.h>
--#include <linux/if_ether.h>
--#endif
- 
- #if (HAVE_PACKET_SOCKET)
- #ifndef SOL_PACKET
- #define SOL_PACKET 263
- #endif  /* SOL_PACKET */
--#if __GLIBC__ >= 2 && __GLIBC_MINOR >= 1
- #include <netpacket/packet.h>
- #include <net/ethernet.h>     /* the L2 protocols */
--#else
--#include <asm/types.h>
--#include <linux/if_packet.h>
--#include <linux/if_ether.h>   /* The L2 protocols */
--#endif
- #endif  /* HAVE_PACKET_SOCKET */
- 
- #include "../include/libnet.h"
--- 
-1.9.1
-
diff --git a/meta-oe/recipes-connectivity/libnet/libnet/0001-Use-standard-int64_t-instead-of-__int64_t-for-mingw-.patch b/meta-oe/recipes-connectivity/libnet/libnet/0001-Use-standard-int64_t-instead-of-__int64_t-for-mingw-.patch
new file mode 100644
index 000000000..f1c607dd8
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libnet/libnet/0001-Use-standard-int64_t-instead-of-__int64_t-for-mingw-.patch
@@ -0,0 +1,31 @@
+From a1659e261888bdbed51803132d52d9a6c6803c8a Mon Sep 17 00:00:00 2001
+From: Joachim Nilsson <troglobit@gmail.com>
+Date: Sat, 19 Oct 2019 12:26:26 +0200
+Subject: [PATCH] Use standard int64_t instead of __int64_t for mingw cross
+ build
+
+Signed-off-by: Joachim Nilsson <troglobit@gmail.com>
+---
+ include/libnet/libnet-structures.h | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/include/libnet/libnet-structures.h b/include/libnet/libnet-structures.h
+index 6084caa..34fffc6 100644
+--- a/include/libnet/libnet-structures.h
++++ b/include/libnet/libnet-structures.h
+@@ -49,9 +49,9 @@ struct libnet_port_list_chain
+ /* libnet statistics structure */
+ struct libnet_stats
+ {
+-    __int64_t packets_sent;               /* packets sent */
+-    __int64_t packet_errors;              /* packets errors */
+-    __int64_t bytes_written;              /* bytes written */
++    int64_t packets_sent;               /* packets sent */
++    int64_t packet_errors;              /* packets errors */
++    int64_t bytes_written;              /* bytes written */
+ };
+ 
+ 
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-connectivity/libnet/libnet_1.2-rc3.bb b/meta-oe/recipes-connectivity/libnet/libnet_1.2-rc3.bb
deleted file mode 100644
index 785abf66d..000000000
--- a/meta-oe/recipes-connectivity/libnet/libnet_1.2-rc3.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-SUMMARY = "A packet dissection and creation library"
-# libnet at packetfactory.net is dead
-HOMEPAGE = "https://github.com/sam-github/libnet"
-SECTION = "libs"
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://doc/COPYING;md5=3ec839e00408b484d33b472a86b7c266"
-DEPENDS = "libpcap"
-# There are major API changes beween libnet v1.0 and libnet v1.1
-PROVIDES = "libnet-1.2rc2"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/libnet-dev/${BPN}-${PV}.tar.gz \
-           file://0001-Support-musl-libc-remove-support-for-glibc-2.1.patch \
-          "
-
-SRC_URI[md5sum] = "f051e6e5bdecddb90f77c701c2ca1804"
-SRC_URI[sha256sum] = "72c380785ad44183005e654b47cc12485ee0228d7fa6b0a87109ff7614be4a63"
-
-UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/libnet-dev/files/"
-UPSTREAM_CHECK_REGEX = "libnet-(?P<pver>\d+(\.\d+)+-*[a-z]*\d*)\.tar"
-
-S = "${WORKDIR}/${BPN}-${PV}"
-
-inherit autotools binconfig
-
diff --git a/meta-oe/recipes-connectivity/libnet/libnet_1.2.bb b/meta-oe/recipes-connectivity/libnet/libnet_1.2.bb
new file mode 100644
index 000000000..a996f9404
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libnet/libnet_1.2.bb
@@ -0,0 +1,19 @@
+SUMMARY = "A packet dissection and creation library"
+HOMEPAGE = "https://github.com/libnet/libnet"
+
+SECTION = "libs"
+
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=07f291bf6e78efa05cec668cf6a09acc"
+
+DEPENDS = "libpcap"
+
+SRC_URI = "git://github.com/libnet/libnet.git;protocol=https;branch=master \
+	file://0001-Use-standard-int64_t-instead-of-__int64_t-for-mingw-.patch"
+
+SRC_URI[sha256sum] = "1e9e9054d688b059bcbaf878d8c4fbf69bfc0c9386cd4e7779fbb53339050d2e"
+SRCREV = "deeeeaeb84f8bc5d2299913d4ccf53d0d4c26966"
+
+S = "${WORKDIR}/git"
+
+inherit autotools binconfig
-- 
2.25.1



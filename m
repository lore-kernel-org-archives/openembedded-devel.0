Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7679FC433EF
	for <webhook@archiver.kernel.org>; Wed, 16 Feb 2022 20:36:18 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web08.932.1645043777228584011
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Feb 2022 12:36:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oYDcp7Vy;
 spf=pass (domain: gmail.com, ip: 209.85.218.47,
 mailfrom: jan.vermaete@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id lw4so1868356ejb.12
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Feb 2022 12:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6axvJuab+ifKY7prcA3vQcqil7eWuoOuq7H7VYBCz6c=;
        b=oYDcp7VyXPcxnNyI6qiLhXqMvo/lmt/hMn+ptRhL0PnEKMbRct4XCLW4ZH7lHSnuak
         mWZUGegLlXYHLEcgD7rqpERY7N8pTxBdDpPNHgyqktSs/V4oeq48muRwYN4FwnxUOeCW
         A8EnnudERifen3Vv/jJK+kEY9LTJz858mol2hqbDY8hSg0T8/sbPnapkT86Cxo0KJ78/
         wILqlXd1/Ppc+WaU5wpCkboCqpyVPjCFn5ckbs13oqcq2QT0g5ui3ddAg3IfL9ryiJHk
         vTd9uwK+JlnzQGKaPYnr4A0nn+9nyY05LKBbUUx/W0w3xo80jMehDf58uqc0Klmg4DaF
         39xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6axvJuab+ifKY7prcA3vQcqil7eWuoOuq7H7VYBCz6c=;
        b=XWDq3pzkwv7SUy70jrYp7io6RGJ3O6FQA3bBE7mQ9sbehP0cu5UJTF41ZQyIV30PVZ
         fVoZb6Qq3XfuSic5/h4PoZkssU8QSlYdOgOEiFmpNyQv3k2Ull+ZSCrZE2B0zVKuNcfy
         yBUGleY4ZL67vSQY1W0Iulx812qlJtgvGOIrxcZESL4s2x7KOZoKxAHZoL0EqSyykd8t
         Ys11reT3NexZuBgU1o8Ph20JaKspZ+JeMFA8jL+Nb7KEwHWUgYk4y3bErhqo+t95MrJB
         xnC+PBV+vDnMJFnUNlgmbyrsfRk7DMNrHzJkGmiYh9FI2noqkZaJ2SHoiiKj9j4besrP
         kgAg==
X-Gm-Message-State: AOAM530lQQEF8I8YedqOf2l7Fx73VgQODhejKvhH9twzn3xQp9u9oCZm
	Go7Ms+jAUedBdK/qDOtYz0xr6UMr8cc=
X-Google-Smtp-Source: 
 ABdhPJxjxcxzHT3EQXtZu3qQKRxRVqU+71UCT7NYl8o5GJzuqhwNFb0RvNGyy0Ymxhu4Nc8xpoP5YA==
X-Received: by 2002:a17:907:72c3:b0:6ce:5256:1125 with SMTP id
 du3-20020a17090772c300b006ce52561125mr3631726ejc.697.1645043775249;
        Wed, 16 Feb 2022 12:36:15 -0800 (PST)
Received: from localhost.localdomain (78-20-160-86.access.telenet.be.
 [78.20.160.86])
        by smtp.googlemail.com with ESMTPSA id
 18sm299814ejj.1.2022.02.16.12.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 12:36:14 -0800 (PST)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-webserver][PATCH] netdata: version bump 1.33.0 -> 1.33.1
Date: Wed, 16 Feb 2022 21:36:02 +0100
Message-Id: <20220216203602.3938-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Feb 2022 20:36:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95347

https can now be enabled (default) or disabled.
The lz4 patch is now in this release.

Package size increase of 2%

Tested on RaspberryPi4-64

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 ...on-Bug-fix-12043-lz4.h-compilation-e.patch | 26 -------------------
 .../{netdata_1.33.0.bb => netdata_1.33.1.bb}  | 12 ++++-----
 2 files changed, 5 insertions(+), 33 deletions(-)
 delete mode 100644 meta-webserver/recipes-webadmin/netdata/netdata/0001-Stream-Compression-Bug-fix-12043-lz4.h-compilation-e.patch
 rename meta-webserver/recipes-webadmin/netdata/{netdata_1.33.0.bb => netdata_1.33.1.bb} (88%)

diff --git a/meta-webserver/recipes-webadmin/netdata/netdata/0001-Stream-Compression-Bug-fix-12043-lz4.h-compilation-e.patch b/meta-webserver/recipes-webadmin/netdata/netdata/0001-Stream-Compression-Bug-fix-12043-lz4.h-compilation-e.patch
deleted file mode 100644
index c699f956d..000000000
--- a/meta-webserver/recipes-webadmin/netdata/netdata/0001-Stream-Compression-Bug-fix-12043-lz4.h-compilation-e.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 85e59be1c656b946a1fcd19404cb0df6095e7dfb Mon Sep 17 00:00:00 2001
-From: odynik <odynik.ee@gmail.com>
-Date: Fri, 28 Jan 2022 12:15:41 +0200
-Subject: [PATCH 1/4] [Stream Compression] - Bug fix #12043 - lz4.h compilation
- error - compile from source (#12049)
-
----
- streaming/compression.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/streaming/compression.c b/streaming/compression.c
-index 917f05bd6..93810aaed 100644
---- a/streaming/compression.c
-+++ b/streaming/compression.c
-@@ -1,7 +1,7 @@
- #include "rrdpush.h"
--#include "lz4.h"
- 
- #ifdef ENABLE_COMPRESSION
-+#include "lz4.h"
- 
- #define LZ4_MAX_MSG_SIZE 0x4000
- #define LZ4_STREAM_BUFFER_SIZE (0x10000 + LZ4_MAX_MSG_SIZE)
--- 
-2.25.1
-
diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_1.33.0.bb b/meta-webserver/recipes-webadmin/netdata/netdata_1.33.1.bb
similarity index 88%
rename from meta-webserver/recipes-webadmin/netdata/netdata_1.33.0.bb
rename to meta-webserver/recipes-webadmin/netdata/netdata_1.33.1.bb
index 8b6432cec..2004670f6 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata_1.33.0.bb
+++ b/meta-webserver/recipes-webadmin/netdata/netdata_1.33.1.bb
@@ -5,13 +5,10 @@ DESCRIPTION = "Netdata is high-fidelity infrastructure monitoring and troublesho
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fc9b848046ef54b5eaee6071947abd24"
 
-DEPENDS += "libuv openssl util-linux zlib"
+DEPENDS += "libuv util-linux zlib"
 
-SRC_URI = "\
-           https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BPN}-v${PV}.tar.gz \
-           file://0001-Stream-Compression-Bug-fix-12043-lz4.h-compilation-e.patch \
-"
-SRC_URI[sha256sum] = "d167d4b2d8529119fa4047ae40d22833dac9d360a6ed07c314ba313807c027eb"
+SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BPN}-v${PV}.tar.gz"
+SRC_URI[sha256sum] = "20ba8695d87187787b27128ac3aab9b09aa29ca6b508c48542e0f7d50ec9322b"
 
 # default netdata.conf for netdata configuration
 SRC_URI += "file://netdata.conf"
@@ -43,8 +40,9 @@ SYSTEMD_AUTO_ENABLE:${PN} = "enable"
 USERADD_PACKAGES = "${PN}"
 USERADD_PARAM:${PN} = "--system --no-create-home --home-dir ${localstatedir}/run/netdata --user-group netdata"
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "https"
 PACKAGECONFIG[compression] = "--enable-compression, --disable-compression, lz4"
+PACKAGECONFIG[https] = "--enable-https, --disable-https, openssl"
 
 # ebpf doesn't compile (or detect) the cross compilation well
 EXTRA_OECONF += "--disable-ebpf"
-- 
2.25.1



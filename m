Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FC59C433F5
	for <webhook@archiver.kernel.org>; Sun, 30 Jan 2022 18:09:53 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web12.21593.1643566192191251837
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Jan 2022 10:09:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NOibXQgX;
 spf=pass (domain: gmail.com, ip: 209.85.218.50,
 mailfrom: jan.vermaete@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id h7so35972844ejf.1
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Jan 2022 10:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4zQog3SFIjDY3as3hq2MDYshBq4eD+U9lIX0ZA90OGU=;
        b=NOibXQgXK6QqUjPJV0otp87eNcB2QxuJXgdW/kJb+p8KqpWnj4tRtjXBoICxibwvo+
         YbueY/9mNdHWBoGy94bBtGCGNO2t3sXn7yDQuxRinOG/6sPew1t5/l1EiVoBJu1iPJvo
         AkiaTbxb3Tvb/rnq4roxsRKjEcD1JDynd4V8ejhseKQIqAsq313Ugi2b/GF5j9RcV35j
         WlHUXGo7EtS1+SIkn7LW0Z3HQ43uBxnuv36pXTaEP5yWkulJ0bdD+o4NEbWUV98wbgNt
         8GQitqdpzcGqnKA53IHRinw/mr9HjHE6t4WCp2B/1Jij8iNamqWVpmvp9kQFbJUnmhqz
         XxEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4zQog3SFIjDY3as3hq2MDYshBq4eD+U9lIX0ZA90OGU=;
        b=rlL9hEgoDCDIRDEUJt8nY9L0zdrQWqI2stoabL2ySni32B5aH1PBeaFwUDtkVQF7qz
         mVSypUaG6ivzJRCbSMD+ksAqkXE/V7KZ/TvIIz5ghIdqXolgFF2pJHDHCgnrKgS8tevF
         VkH2cFAXrJvrToKfLNaQnfnEz06DsJEe2Q0eJBs3k++tDvjOPa2589UbhRj2Iw29vOUh
         lZ9iEkQXMaYunbMuIPW4SF7jheKjcaHojowRKq71rDWLoU/Ybqpeb+mTfeZCwjY5l3X1
         KkLV0p15qPQsTcJLXQKsTG/vlJfeVcz/Wi2L3bm0TGhI6GEna1Sy4ZFnTtJZE9Mq2SbS
         fRbQ==
X-Gm-Message-State: AOAM532NPhEej17KkjUyhUPM5RRDlKhxWCz5+7nJw1PSo65ALUYPAVLq
	zgCDxIhK23ewG8E5tqcOWzYDDRFYxPY=
X-Google-Smtp-Source: 
 ABdhPJypm23kBmu4RgIwMYdqij3t5gbxSgyyX6se+oz0hhhi5cyuf0eZpIDnf5YNYlhodTtv7fpx2g==
X-Received: by 2002:a17:907:16a9:: with SMTP id
 hc41mr15106863ejc.289.1643566190312;
        Sun, 30 Jan 2022 10:09:50 -0800 (PST)
Received: from localhost.localdomain (78-20-160-86.access.telenet.be.
 [78.20.160.86])
        by smtp.googlemail.com with ESMTPSA id
 bs4sm11868333edb.84.2022.01.30.10.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jan 2022 10:09:49 -0800 (PST)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-webserver][PATCH] netdata: upgrade 1.32.1 -> 1.33.0
Date: Sun, 30 Jan 2022 19:09:34 +0100
Message-Id: <20220130180934.3872-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Jan 2022 18:09:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95179

Added the packageconfig to compress the data with lz4.
But disabled it by default.

Patch added to have it working without compression enabled.

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 ...on-Bug-fix-12043-lz4.h-compilation-e.patch | 26 +++++++++++++++++++
 .../{netdata_1.32.1.bb => netdata_1.33.0.bb}  | 12 ++++++---
 2 files changed, 35 insertions(+), 3 deletions(-)
 create mode 100644 meta-webserver/recipes-webadmin/netdata/netdata/0001-Stream-Compression-Bug-fix-12043-lz4.h-compilation-e.patch
 rename meta-webserver/recipes-webadmin/netdata/{netdata_1.32.1.bb => netdata_1.33.0.bb} (86%)

diff --git a/meta-webserver/recipes-webadmin/netdata/netdata/0001-Stream-Compression-Bug-fix-12043-lz4.h-compilation-e.patch b/meta-webserver/recipes-webadmin/netdata/netdata/0001-Stream-Compression-Bug-fix-12043-lz4.h-compilation-e.patch
new file mode 100644
index 000000000..c699f956d
--- /dev/null
+++ b/meta-webserver/recipes-webadmin/netdata/netdata/0001-Stream-Compression-Bug-fix-12043-lz4.h-compilation-e.patch
@@ -0,0 +1,26 @@
+From 85e59be1c656b946a1fcd19404cb0df6095e7dfb Mon Sep 17 00:00:00 2001
+From: odynik <odynik.ee@gmail.com>
+Date: Fri, 28 Jan 2022 12:15:41 +0200
+Subject: [PATCH 1/4] [Stream Compression] - Bug fix #12043 - lz4.h compilation
+ error - compile from source (#12049)
+
+---
+ streaming/compression.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/streaming/compression.c b/streaming/compression.c
+index 917f05bd6..93810aaed 100644
+--- a/streaming/compression.c
++++ b/streaming/compression.c
+@@ -1,7 +1,7 @@
+ #include "rrdpush.h"
+-#include "lz4.h"
+ 
+ #ifdef ENABLE_COMPRESSION
++#include "lz4.h"
+ 
+ #define LZ4_MAX_MSG_SIZE 0x4000
+ #define LZ4_STREAM_BUFFER_SIZE (0x10000 + LZ4_MAX_MSG_SIZE)
+-- 
+2.25.1
+
diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_1.32.1.bb b/meta-webserver/recipes-webadmin/netdata/netdata_1.33.0.bb
similarity index 86%
rename from meta-webserver/recipes-webadmin/netdata/netdata_1.32.1.bb
rename to meta-webserver/recipes-webadmin/netdata/netdata_1.33.0.bb
index dbce1c432..8b6432cec 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata_1.32.1.bb
+++ b/meta-webserver/recipes-webadmin/netdata/netdata_1.33.0.bb
@@ -5,10 +5,13 @@ DESCRIPTION = "Netdata is high-fidelity infrastructure monitoring and troublesho
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fc9b848046ef54b5eaee6071947abd24"
 
-DEPENDS += "libuv openssl util-linux zlib "
+DEPENDS += "libuv openssl util-linux zlib"
 
-SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BPN}-v${PV}.tar.gz"
-SRC_URI[sha256sum] = "ac406513e86ad24976a66146702aeac960e43908abc51d70e4a073905275d13e"
+SRC_URI = "\
+           https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BPN}-v${PV}.tar.gz \
+           file://0001-Stream-Compression-Bug-fix-12043-lz4.h-compilation-e.patch \
+"
+SRC_URI[sha256sum] = "d167d4b2d8529119fa4047ae40d22833dac9d360a6ed07c314ba313807c027eb"
 
 # default netdata.conf for netdata configuration
 SRC_URI += "file://netdata.conf"
@@ -40,6 +43,9 @@ SYSTEMD_AUTO_ENABLE:${PN} = "enable"
 USERADD_PACKAGES = "${PN}"
 USERADD_PARAM:${PN} = "--system --no-create-home --home-dir ${localstatedir}/run/netdata --user-group netdata"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[compression] = "--enable-compression, --disable-compression, lz4"
+
 # ebpf doesn't compile (or detect) the cross compilation well
 EXTRA_OECONF += "--disable-ebpf"
 
-- 
2.25.1



Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05B36C433F5
	for <webhook@archiver.kernel.org>; Tue, 30 Nov 2021 02:26:01 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.71342.1638239160404503652
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Nov 2021 18:26:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=W8hijXKe;
 spf=pass (domain: gmail.com, ip: 209.85.214.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id k4so13692625plx.8
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Nov 2021 18:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3H336W5eASwrmrInoRU4Qm2dYgD5HM5gAoOP86iMYyc=;
        b=W8hijXKeoBeRcLnGnAClg0Qb60ITUTpIdXlVY+FxfkMY+SEB9zk5V7WcjyMrQvddAg
         50EqgZovHMugFU1RO8Hs+1XjhVL67+t0DjJbi/1zg0hn+2Dvw9no3Qz2LL0+DBLf2ovK
         PFqrFGprVA7YXad6sK3XjYQPQYteo057PKzKVY2baCDu9MQtx2zKSBVpuD6i7xpvK+Bm
         QIlh2Ubb5B/90p9x+iaG0ervEfQ5rXdduiOR7cP4bGzM5+jQX9dtgNEXXQg6A1V/HdL6
         WsQZGkXnF4ah+H6aqsrAP19jHUdHY7iA6X/ZKp5yHKU9Lz7kAlh4Nxj5n93Y+NGgdt30
         dMpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3H336W5eASwrmrInoRU4Qm2dYgD5HM5gAoOP86iMYyc=;
        b=20Yc/Zt+oYjwxPVkNp2OVnqKasdA73WZZ9GLOd3BejNIFMfOlYHrR2xHEqAg4oVn17
         5QueMzaEpi99mVsN4a/kLy+3MnyR7NAXVn3LJRRGYwYHUOU/NBTQ9UK18S82MMuUNKWn
         WccgJ42IH4vqDSI9V1te11GmPPpkJAP9C2h6k39dCRi/vg1tEtE33Ia5K0R1eMjh8WHx
         Kpf9tkpMA7IX8Y4niMpBh7hqtP6NYDZMVo3rDzIFC8E69r87xS4WnzGuFx7A4keKnm5N
         ZycMEcidDtBJRsKZmQ6cmnXgpB97/jwCMNBJNtEg9qu0lASoj3tgRrn4PSsMhY/4Z8aq
         QhQg==
X-Gm-Message-State: AOAM531Tv7LLlrE86LiXmoYUIrM/gSy9bDrVCHaQ+8hN4DlRsMx2l/e4
	uRKkuWu2ov2q4zXIyihmnexhpkQh534zSg==
X-Google-Smtp-Source: 
 ABdhPJx3cdsMZrYJMhAxp50FbX0aDVW2fMrMii6epvj1fLjYtlBma+dNjibxPdSj9d/5KAs8HnYkjA==
X-Received: by 2002:a17:90a:e506:: with SMTP id
 t6mr2350435pjy.9.1638239159459;
        Mon, 29 Nov 2021 18:25:59 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ce68])
        by smtp.gmail.com with ESMTPSA id
 q5sm20304529pfu.66.2021.11.29.18.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 18:25:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] influxdb: Upgrade to 1.8.10
Date: Mon, 29 Nov 2021 18:25:56 -0800
Message-Id: <20211130022556.2903431-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Nov 2021 02:26:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94143

Changes are here [1]

License-Update: Updated copyright info [2]

Fix sh interpreter path

[1] https://dl.influxdata.com/platform/nightlies/1.8/CHANGELOG.md
[2] https://github.com/influxdata/influxdb/commit/809ac4f0d5280a2391ed1af84e2a331d37525913#diff-c693279643b8cd5d248172d9c22cb7cf4ed163a3c98c8a3f69c2717edd3eacb7

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...se-env-to-deduce-sh-interpreter-path.patch | 23 +++++++++++++++++++
 ...{influxdb_1.7.10.bb => influxdb_1.8.10.bb} |  9 ++++----
 2 files changed, 28 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-dbs/influxdb/influxdb/0001-ci-Use-env-to-deduce-sh-interpreter-path.patch
 rename meta-oe/recipes-dbs/influxdb/{influxdb_1.7.10.bb => influxdb_1.8.10.bb} (83%)

diff --git a/meta-oe/recipes-dbs/influxdb/influxdb/0001-ci-Use-env-to-deduce-sh-interpreter-path.patch b/meta-oe/recipes-dbs/influxdb/influxdb/0001-ci-Use-env-to-deduce-sh-interpreter-path.patch
new file mode 100644
index 0000000000..4c4d65a5c0
--- /dev/null
+++ b/meta-oe/recipes-dbs/influxdb/influxdb/0001-ci-Use-env-to-deduce-sh-interpreter-path.patch
@@ -0,0 +1,23 @@
+From be6c7051c1ca5daf84066e0c8411c507eb168362 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 29 Nov 2021 18:16:18 -0800
+Subject: [PATCH] ci: Use env to deduce sh interpreter path
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ scripts/ci/run_perftest.sh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/scripts/ci/run_perftest.sh b/scripts/ci/run_perftest.sh
+index e86ed1c9b0..53f65f34c4 100755
+--- a/scripts/ci/run_perftest.sh
++++ b/scripts/ci/run_perftest.sh
+@@ -1,4 +1,4 @@
+-#!/usr/bin/sh -ex
++#!/usr/bin/env sh -ex
+ 
+ # Install Telegraf
+ wget -qO- https://repos.influxdata.com/influxdb.key | apt-key add -
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-dbs/influxdb/influxdb_1.7.10.bb b/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
similarity index 83%
rename from meta-oe/recipes-dbs/influxdb/influxdb_1.7.10.bb
rename to meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
index fa360b8d1d..1f206807cf 100644
--- a/meta-oe/recipes-dbs/influxdb/influxdb_1.7.10.bb
+++ b/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "InfluxDB is a time series database designed to handle high write
 HOMEPAGE = "https://www.influxdata.com/products/influxdb-overview/"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=ba8146ad9cc2a128209983265136e06a"
+LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=f39a8d10930fb37bd59adabb3b9d0bd6"
 
 FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
 
@@ -17,16 +17,17 @@ GO_INSTALL = "\
 "
 
 SRC_URI = "\
-    git://${GO_IMPORT};protocol=https;branch=1.7;destsuffix=${BPN}-${PV}/src/${GO_IMPORT} \
+    git://${GO_IMPORT};protocol=https;branch=1.8;destsuffix=${BPN}-${PV}/src/${GO_IMPORT} \
+    file://0001-ci-Use-env-to-deduce-sh-interpreter-path.patch;patchdir=src/${GO_IMPORT} \
     file://influxdb \
     file://influxdb.conf \
 "
 
 SRC_URI:append:mipsarch = " file://0001-patch-term-module-for-mips-ispeed-ospeed-termios-abs.patch;patchdir=src/${GO_IMPORT}"
 
-SRCREV = "c958f436b2e538a88a7815aad721c7774a0b8f63"
+SRCREV = "688e697c51fd5353725da078555adbeff0363d01"
 
-inherit go-mod systemd update-rc.d useradd
+inherit go-mod pkgconfig systemd update-rc.d useradd
 
 USERADD_PACKAGES = "${PN}"
 USERADD_PARAM:${PN} = "--system -d /var/lib/influxdb -m -s /bin/nologin influxdb"
-- 
2.34.1



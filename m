Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16A35C433EF
	for <webhook@archiver.kernel.org>; Tue, 30 Nov 2021 02:53:27 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.70928.1638240806501376146
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Nov 2021 18:53:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=e8oZ23xa;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id
 o6-20020a17090a0a0600b001a64b9a11aeso15875916pjo.3
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Nov 2021 18:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O5ftu0htTAkUIx5PlHNFRnUWEWf/uzJT3D5dDpZ4On0=;
        b=e8oZ23xavadP+UJUI72SCwcs86SMTeUSijDY2rF1R8qYaGZinj5kJmrtndYMv+/L5O
         XYyj1IKSANg2yXjMY8TUblGVJ5F7wwf3zPOgFE/kK8HVG/9jwqkuJGfu9Wf+0xKJDFmn
         ItpIqRWWs1yPK7oMjvKZTHfpa/Ss9QHdpr1LZg0UfMFQZIvVKjGbyaGlim+EuCWqF1Dq
         kEOF13IYiOL74TgxgCRP1vQBmt5oRRC66rUEsnQUBSRFYOjUyh4Z5bcV5hfJ4fyzWAz0
         tR/8GPuBOsPz5jn9aHdoEH+FOTz1km21jJxhf2k2R1VCPn8+2g2CZPQmKUAaOULFuAFZ
         CKvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O5ftu0htTAkUIx5PlHNFRnUWEWf/uzJT3D5dDpZ4On0=;
        b=H0QQ5WDV1bo3P3yGg233eF54iF9uD1shVWu02Raxt6KKYQAGgjoWj/RunymxdvTBm5
         5KTi4BMomyePDzYQDea0S12ppHgs09+qCnJHq65cOObgf/aTfEStW62QrZWJkP7er2R5
         6PEZQkQHG/kpS7NKdo1wQQp+TIrYqEoKpuzNiMBgfsJ3WzBSJfLSF6R5wa0aRcNf1Crj
         OpatyiY9Fah0NNyUY1qWHKdeWqmDDkSb2Yn9Pzl+g7vEOCx6bDIHHwSrHz7SL0ACuE5P
         Wyqp9Y6nzVzzXJfB1xxOfk55WGYO2VCsJULhUNLpgoXubJuM78K0XQOTEX/oZwXbVhBx
         ApSQ==
X-Gm-Message-State: AOAM533w7rPmh1NAzhx2wvaEj1fvwr2wTa3OA2ngk9ClwzDfw155MP3P
	+Y1Lu6Lhuh5sUFXRfe2E4GSFfjW+Wt+kTg==
X-Google-Smtp-Source: 
 ABdhPJzzQMza1mRBehzDjAzbpE6sAnuT5vbcN/0JSpY6HCAIBs9RjyOX4XJFupNq8WDAnoBiFlL8vQ==
X-Received: by 2002:a17:90b:1e49:: with SMTP id
 pi9mr2595048pjb.232.1638240805687;
        Mon, 29 Nov 2021 18:53:25 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ce68])
        by smtp.gmail.com with ESMTPSA id
 bt2sm597069pjb.57.2021.11.29.18.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 18:53:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH v2] influxdb: Upgrade to 1.8.10
Date: Mon, 29 Nov 2021 18:53:23 -0800
Message-Id: <20211130025323.3019868-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Nov 2021 02:53:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94146

Changes are here [1]

License-Update: Updated copyright info [2]

Fix sh interpreter path

[1] https://dl.influxdata.com/platform/nightlies/1.8/CHANGELOG.md
[2] https://github.com/influxdata/influxdb/commit/809ac4f0d5280a2391ed1af84e2a331d37525913#diff-c693279643b8cd5d248172d9c22cb7cf4ed163a3c98c8a3f69c2717edd3eacb7

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Use sed'ing instead of patching since packaging still catches
    files under .pc dir created by quilt

 .../influxdb/{influxdb_1.7.10.bb => influxdb_1.8.10.bb}  | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-dbs/influxdb/{influxdb_1.7.10.bb => influxdb_1.8.10.bb} (84%)

diff --git a/meta-oe/recipes-dbs/influxdb/influxdb_1.7.10.bb b/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
similarity index 84%
rename from meta-oe/recipes-dbs/influxdb/influxdb_1.7.10.bb
rename to meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
index fa360b8d1d..55c2c41eef 100644
--- a/meta-oe/recipes-dbs/influxdb/influxdb_1.7.10.bb
+++ b/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "InfluxDB is a time series database designed to handle high write
 HOMEPAGE = "https://www.influxdata.com/products/influxdb-overview/"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=ba8146ad9cc2a128209983265136e06a"
+LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=f39a8d10930fb37bd59adabb3b9d0bd6"
 
 FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
 
@@ -17,16 +17,16 @@ GO_INSTALL = "\
 "
 
 SRC_URI = "\
-    git://${GO_IMPORT};protocol=https;branch=1.7;destsuffix=${BPN}-${PV}/src/${GO_IMPORT} \
+    git://${GO_IMPORT};protocol=https;branch=1.8;destsuffix=${BPN}-${PV}/src/${GO_IMPORT} \
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
@@ -35,6 +35,7 @@ do_install:prepend() {
     rm ${B}/src/${GO_IMPORT}/build.py
     rm ${B}/src/${GO_IMPORT}/build.sh
     rm ${B}/src/${GO_IMPORT}/Dockerfile*
+    sed -i -e "s#usr/bin/sh#bin/sh#g" ${B}/src/${GO_IMPORT}/scripts/ci/run_perftest.sh
 }
 
 do_install:append() {
-- 
2.34.1



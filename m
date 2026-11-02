Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3490.1793581325768002818
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Nov 2026 17:02:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=WAUuJu3d;
 spf=pass (domain: gmail.com, ip: 74.125.82.179, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3514b90bb89so5042023eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 01 Nov 2026 17:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793581325; x=1794186125; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IQ8VxRCBBuaCeoA8s911bpCLv8wXmVa9y9EVfPO8kVY=;
        b=WAUuJu3dIZDxgyIMa0zwZDgrY0JzEfDiDUsqMIveBCBz+d4OWFE5JwayvT7D/eGXXx
         /k8oX5bDf7R3vwds9AAwcptuq/GHE9r0xYCUYrDgSvBkq1AXhH4sl635x8X9mrYE1UUW
         rE3RLkTW5mb4MauQywUSAb54VmkkynNOq49w5e6oLG05A+2yCEa7DKkJ/HuLUvfhcC6v
         b/LXguiYZbuaJPk/1jWw7ZjaK9dAXawuBsGKVPtdk0AptNx8nTu8JLPDmB9Yobs4fl+l
         9xHLOsTRY35k6dc2w9mnj08yract9jCgPuXYoH/Lep0YC+dckT1i/+fB85mfvDsXMa9g
         24tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793581325; x=1794186125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IQ8VxRCBBuaCeoA8s911bpCLv8wXmVa9y9EVfPO8kVY=;
        b=LsdQfn46qBAOSmsgOJlYBigLuLKgYEhDdruMpz7sUNw6cwgWdeXe6ITon3AiIwYMMo
         1A+m8pdmkCJ5qwkf8repcSlS2iSKZQlMTVFSPcicc+qV1obRVFVcR728pGypMEBu2PR6
         OswM2Zjz386cT95LHPozbDuVKcg+EIRgK/EF6QdwiKxzlmgXAMbA6TVj1HpXDbVu5Qrk
         +/MC8bS8lr6z4pQYZPiRB6W97UjI8N8l4IAX40p/kus0lXB9aAtHSKfbc+KIUywBSwvh
         DQCa2MkOwKyqL+dCXmAsHTMhvNC2WKbBm5s8MuzxtvVYCyoYZfMwlNDyZFGUGfcMDSH9
         FwLQ==
X-Gm-Message-State: AFq9FYImG4kVkeg9nF9gS7SQif0I6IDaRHCzo/B3OpErvLlwXMhAszcQ
	9bCkXvLAcS8B9jdZQMi2oR/iqu3ciwsQKTOKAK6T7CZTzeNXWGHysrErFeBXmjqyDQI=
X-Gm-Gg: AYBFou0hvBPLWiy3XJ2sK3M0K1I2jQUdyt2kwJ/brc5GdcuouIgxYQs3oQLtCPF/LP1
	pfBj+JyAAkkGXse2Rb+sFPlhinaBMIRJHl6Bq7CMFyZVKrnG1x/GDpWnTMyWJbMFPAUQOxzydXX
	3yO2Vgv1RcEPvp3TVu6LmrRjGUF6h2a59Wd40ErOzRsye9ReVUVQDBxMlk6fbmi+bR1HQ95mn9+
	eTRvYYRUS55Y0+kUIGH8c8ZqTHGIi2Wp37ighnEKbnI6c3IlBpi+vuGys0G5+2pX+gWyWAYCbRE
	XjinTLaQinTKSFPqScCxBnU1p8mCw62g/qOxCvxWkA7IAipoG4ellDNk1SrF8xEfDqUU4jqfZVr
	VUqpn6s+ortyRnFaO6MQyXblIUIUX7C+WWVhl/8YSulIU7LEN9fE3RreTsf/qEXN6w2k5GlNi3J
	mWGlGlOBB8FjUUHzoQlknWw/GhGngmrrNYJ5I4ULx84HHhs4WNJ30/IAyc1zSfKiTHDLmAkGPJc
	e2YmSQ4x77/VIaSmi+enKBZ8/DpzOrQlumTeEwfd+1RtulkZgBsIrpkrFlrqHwrRBrS2rgFaB87
	fxoeGTbffUqrSOqFHiskPxjgLTvXAMlXyLYA0OsUvVNAB40nMgzgK3OIHVk4OnOIVjd8LvJFyJ+
	//xk8KScNOTz/A1Q+toNi7tgH+9TXDIMVy2suFD5BWq/Bwtrscmx7cf85QTYdBWeZbgM08r+TN8
	78gIwRh0M6g6pFHA3MML8spomgz/uNe1THi+OzYIbKZ1X+HrA9u0i8nFjCKsB74e19NBbUSH0m3
	rAHoAQSEoUGT9h9HLQikcgwa/Y7S7chr1g5iKW8pxf10MEzGJBZAUdWKDRgn/8KZCzedru3F+HK
	2DtU
X-Received: by 2002:a05:7022:5f15:b0:16a:f5cd:365 with SMTP id a92af1059eb24-1b009604eb1mr6450475c88.5.1793581324808;
        Sun, 01 Nov 2026 17:02:04 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1a9e2ed3sm27691306c88.19.2026.11.01.17.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 17:02:04 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH] influxdb: Do not package upstream CI files
Date: Sun,  1 Nov 2026 17:02:01 -0800
Message-ID: <20261102010201.2798255-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 02 Nov 2026 01:02:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131735
Content-Type: text/plain; charset="utf-8"

.circleci and scripts/ci are upstream's tooling for its AWS Ubuntu test
runners. They hardcode /home/ubuntu, which trips the buildpaths QA check
on build hosts whose HOME has the same path:

  File .../influxdb/.circleci/config.yml in package influxdb-dev contains
  a reference to the build host HOME directory.

Remove them before do_install instead of setting OEQA_BUILDPATHS_SKIP,
as they are of no use in influxdb-dev and a skip would also hide real
leaks. run_perftest.sh goes with them, so drop the sed fixing its shebang.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb b/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
index 4ce8e3681c..7c553b647c 100644
--- a/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
+++ b/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
@@ -37,8 +37,7 @@ do_install:prepend() {
     test -e ${B}/src/${GO_IMPORT}/build.py && rm ${B}/src/${GO_IMPORT}/build.py
     test -e ${B}/src/${GO_IMPORT}/build.sh && rm ${B}/src/${GO_IMPORT}/build.sh
     rm -rf ${B}/src/${GO_IMPORT}/Dockerfile*
-
-    sed -i -e "s#usr/bin/sh#bin/sh#g" ${B}/src/${GO_IMPORT}/scripts/ci/run_perftest.sh
+    rm -rf ${B}/src/${GO_IMPORT}/.circleci ${B}/src/${GO_IMPORT}/scripts/ci
 }

 do_install:append() {

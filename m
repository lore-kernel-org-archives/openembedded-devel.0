Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D929CC3065D
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 18:20:03 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.585.1719849608599403118
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jul 2024 09:00:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U2XhvmhP;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: semc.2042@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2c9357a2647so1481378a91.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jul 2024 09:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719849608; x=1720454408; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2CMBvZ3zfPsSBe1FvJvgYMk2wOeycTFy85uxsm077WI=;
        b=U2XhvmhPpLCSCM1G65s/YHIb61IJLbItLFuPndio7tfrTjpP6NnH7FxojIcjLgHGlH
         CG2HV8yuvavJE001Biag9ZN0HRx6Rk7/mSPGHISkPqU/fr2BCaD8DYZCN/GvT9Cdsdve
         FY1UHmJ/0EnRO1JapW/41wNRV+oDTOIUxQlvmZc4DM8vRRCG34fZC9zyZp9U7fAOyCAp
         4odceaYw8yTnBSiO/mxoUDvBMgXgDxds9j6bmaWGFR0olE7kjEETvDy6KQjgK7Gn45bU
         Su0q/p3J10EZFAe5rvDP+bKc9sUFmWFipM04LB2WCknons4iGZAGAOEdYNBNYXBnButH
         wVZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719849608; x=1720454408;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2CMBvZ3zfPsSBe1FvJvgYMk2wOeycTFy85uxsm077WI=;
        b=rukxHQadt3xfb8BZV2ngLraXLkQCZWZiXwxxEsEA5ILz4fnapaiqYltaYXFDTeS6DB
         n8/YKswRxyV9fI2iV49Ajc5cdco7iXqysGXrh9IatHc3ZywCP7UCNM8Sv6lsQEXDGgIx
         2OF5hVZ8BkKQ3kTCO8A0m+PcxGDt+4EP9Ktk7vDbYbBnFuCfbuw/vrrUqLZuRMyVc/PK
         4F4OBxp4Q5/J+3cJEYLbnXTg8BhaEafShMs62LZoIE7YInkL4K0DHakehoUnLiN19eIC
         oApEHP4LwqA6qUrRGIIhpBkMQ7wQ9OczOdlPCr8XbXej/Ig++VI0RksBcf+/Ju0+b0MJ
         80Zg==
X-Gm-Message-State: AOJu0Yw3I4dHL33OSd6dgCMXUbTVNOzzNm+fEG8MWcp3d4g4OVlVdkLK
	OH1gD+j6XEdYM+3hKHCVrRO7H0xPwo5qGFKWvWpn6FRuFKaGie/hdgDLuA==
X-Google-Smtp-Source: AGHT+IFb+z5mc/H0a1YBugeDcwp6iw+trszGYc1iHSQTdNRkNRf1p8Ri38XUfpJWrWGeS5hwSkgDIQ==
X-Received: by 2002:a17:90a:3e82:b0:2c3:e8b:e0f8 with SMTP id 98e67ed59e1d1-2c93d719abemr3064667a91.20.1719849607727;
        Mon, 01 Jul 2024 09:00:07 -0700 (PDT)
Received: from L-16522.kpit.com ([49.207.233.105])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c91ce5469dsm6977785a91.23.2024.07.01.09.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 09:00:07 -0700 (PDT)
From: "rajmohan r" <semc.2042@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	semc.2042@gmail.com
Cc: ranjitsinh.rathod@kpit.com
Subject: [meta-networking][PATCH] unbound: Add ptest for unbound
Date: Mon,  1 Jul 2024 21:29:57 +0530
Message-Id: <20240701155957.596288-1-semc.2042@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Jul 2024 18:20:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111206

Adapt the compile 'test' phony target from Makefile and deploy as
ptest for unbound.
All test are successful on a trial and took around >9min and <10min.
Duration of ptest execution was 587 seconds on an average.

Signed-off-by: rajmohan r <semc.2042@gmail.com>
---
 .../recipes-support/unbound/unbound/run-ptest | 17 ++++++++++++++
 .../recipes-support/unbound/unbound_1.20.0.bb | 23 +++++++++++++++++--
 2 files changed, 38 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-support/unbound/unbound/run-ptest

diff --git a/meta-networking/recipes-support/unbound/unbound/run-ptest b/meta-networking/recipes-support/unbound/unbound/run-ptest
new file mode 100644
index 000000000..433a687c6
--- /dev/null
+++ b/meta-networking/recipes-support/unbound/unbound/run-ptest
@@ -0,0 +1,17 @@
+#!/bin/sh
+
+cd tests || exit 1
+retVal=0
+./unittest
+./testbound -s
+for x in ./testdata/*.rpl; do
+	output="$(./testbound -p $x -o -vvvvv 2>&1)"
+        if test $? -eq 0; then
+                echo "$x :Pass"
+        else
+                echo "$output"
+                echo "$x :Fail"
+                retVal=1
+        fi
+done
+exit $retVal
diff --git a/meta-networking/recipes-support/unbound/unbound_1.20.0.bb b/meta-networking/recipes-support/unbound/unbound_1.20.0.bb
index fe0111f59..cb4ac04dd 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.20.0.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.20.0.bb
@@ -9,10 +9,12 @@ SECTION = "net"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5308494bc0590c0cb036afd781d78f06"
 
-SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=branch-1.20.0"
+SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=branch-1.20.0 \
+           file://run-ptest \
+          "
 SRCREV = "b9525c5fd47ba481a29b90109017d2253beb105d"
 
-inherit autotools pkgconfig systemd update-rc.d
+inherit autotools pkgconfig systemd update-rc.d ptest
 
 DEPENDS = "openssl libtool-native bison-native expat"
 RDEPENDS:${PN} = "bash openssl-bin daemonize"
@@ -32,6 +34,10 @@ do_configure:append() {
 	sed -i -e 's#${RECIPE_SYSROOT}##g' ${B}/config.h
 }
 
+do_compile:append() {
+        oe_runmake tests
+}
+
 do_install:append() {
 	install -d ${D}${systemd_unitdir}/system
 	install -m 0644 ${B}/contrib/unbound.service ${D}${systemd_unitdir}/system
@@ -40,6 +46,19 @@ do_install:append() {
 	install -m 0755 ${S}/contrib/unbound.init_yocto ${D}${sysconfdir}/init.d/unbound
 }
 
+do_install_ptest() {
+        install -d ${D}${PTEST_PATH}/tests
+        install -d ${D}${PTEST_PATH}/tests/testdata
+
+        install -m 0544 ${B}/unittest ${D}${PTEST_PATH}/tests/
+        install -m 0544 ${B}/testbound ${D}${PTEST_PATH}/tests/
+        install -m 0664 ${S}/testdata/test_signatures* ${D}${PTEST_PATH}/tests/
+        install -m 0664 ${S}/testdata/test_sigs* ${D}${PTEST_PATH}/tests/
+        install -m 0664 ${S}/testdata/test_ds* ${D}${PTEST_PATH}/tests/
+        install -m 0664 ${S}/testdata/test_nsec3_hash* ${D}${PTEST_PATH}/tests/
+        install -m 0644 ${S}/testdata/*.rpl ${D}/${PTEST_PATH}/tests/testdata/
+}
+
 SYSTEMD_SERVICE:${PN} = "${BPN}.service"
 
 INITSCRIPT_NAME = "unbound"
-- 
2.34.1



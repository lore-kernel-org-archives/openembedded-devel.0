Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3274EB64DA
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 14:47:01 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.20415.1686840415048334313
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jun 2023 07:46:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=OuTUtzQR;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-54f87d5f1abso2777827a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 07:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686840414; x=1689432414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HMtVZed5m3HCybE2V53TWfcGZHKYkUo212iAhAN1Tj8=;
        b=OuTUtzQR/kAzt86kyGaiiVPXe7LjrWTqReAH2bKmfWie7DT/Y4+oHH5LrlMpI3hPqG
         99R6RrPTp9QHtkq47OBoyEjrhi+xSWyirEe74PSU8/89t+ORJLnpwrnnr2L1f1EjN5Bk
         OJSFrNRMnum4bBeUVpc5qcLC05rB5SEcvV7qFikCKK+CxHsKV1lsDHI3p+p5aK4rZYYE
         mkXnF7HR/hFxxkt0tv+rDTA+KEpmXMso7kA8p3eynuHulT0aJ/kVRjwlcMcUj+5vfpWk
         dHPmDfNm8lRnZawI7CmG2WAQZnWzuiLgMZdCdSpw4L8PIT700vvTJMSSAfdjClETUBks
         F0YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686840414; x=1689432414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HMtVZed5m3HCybE2V53TWfcGZHKYkUo212iAhAN1Tj8=;
        b=VRDvCm1xMMEV/cBmcujD9ho+pougbAIQCftQkp4fwin57dzNFk+hMa2mZ5yMcDToKL
         +ZbDbwEEbyQCDUIU3VTledxYQbi2ekf/KIr7z1EtZzv+V9gkBUMBgcOhY5Ihx/p+55h3
         L5S1KpF8U4O+tCC++rHkAS31mdEfv4PRzO7104hnhCyRf4GpzJsywe2OnyQlqpBmYa1Y
         nE0gosWv0DnNi523VeuyFp8TsewApnmURejkC1lxrq3iSvM11KZWOPg+IXwyEIv6jDQQ
         2rDDofD6nHNCDmPZ+c30TINyE500+MXCRyCZSDPVC23ThIDpntxyoVvC2NCSvFnGLSpg
         FUTw==
X-Gm-Message-State: AC+VfDz5Y/GfnUJh2zW75rYKyzJYa77xmn1eSjyKXgY2XPrspaPGhDmg
	rk3iecBtsxkQmF8YHJsNsDtErKCvC9Q=
X-Google-Smtp-Source: ACHHUZ7pe7OSrC+mM2yarXlvGf9ZcDvEt28G/F2Ft4X/zuY79YhWppYGkFaAV44SyCD2lK+QKWsnZg==
X-Received: by 2002:a17:90a:b00d:b0:25e:8d74:76f3 with SMTP id x13-20020a17090ab00d00b0025e8d7476f3mr2055516pjq.29.1686840413936;
        Thu, 15 Jun 2023 07:46:53 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::eb87])
        by smtp.gmail.com with ESMTPSA id g3-20020a17090a3c8300b0024e33c69ee5sm12802504pjc.5.2023.06.15.07.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 07:46:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] influxdb: Upgrade to 2.7.1 release
Date: Thu, 15 Jun 2023 07:46:50 -0700
Message-ID: <20230615144650.613381-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 14:47:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103307

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...1.2-xxhash-to-fix-build-with-go-1.17.patch | 39 -------------------
 ...e-for-mips-ispeed-ospeed-termios-abs.patch | 17 ++++----
 .../{influxdb_1.8.10.bb => influxdb_2.7.1.bb} |  7 ++--
 3 files changed, 11 insertions(+), 52 deletions(-)
 delete mode 100644 meta-oe/recipes-dbs/influxdb/influxdb/0001-Use-v2.1.2-xxhash-to-fix-build-with-go-1.17.patch
 rename meta-oe/recipes-dbs/influxdb/{influxdb_1.8.10.bb => influxdb_2.7.1.bb} (87%)

diff --git a/meta-oe/recipes-dbs/influxdb/influxdb/0001-Use-v2.1.2-xxhash-to-fix-build-with-go-1.17.patch b/meta-oe/recipes-dbs/influxdb/influxdb/0001-Use-v2.1.2-xxhash-to-fix-build-with-go-1.17.patch
deleted file mode 100644
index e31c7be1ec..0000000000
--- a/meta-oe/recipes-dbs/influxdb/influxdb/0001-Use-v2.1.2-xxhash-to-fix-build-with-go-1.17.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 4ca405e9763fd0ba747ef00edd30648b66992fbb Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 30 Nov 2021 15:14:39 -0800
-Subject: [PATCH] Use v2.1.2 xxhash to fix build with go 1.17
-
-Fixes
-| # github.com/cespare/xxhash
-| asm: xxhash_amd64.s:120: when dynamic linking, R15 is clobbered by a global variable access and is used here: 000
-92 (/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/influxdb/1.8.10-r0/build/pkg/mod/github.com/cespare/xxhash@
-v1.1.0/xxhash_amd64.s:120)        ADDQ    R15, AX
-| asm: assembly failed
-
-Upstream-Status: Backport [https://github.com/cespare/xxhash/commit/e7a6b52374f7e2abfb8abb27249d53a1997b09a7]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- go.mod | 3 ++-
- go.sum | 2 ++
- 2 files changed, 4 insertions(+), 1 deletion(-)
-
---- a/go.mod
-+++ b/go.mod
-@@ -55,3 +55,5 @@ require (
- 	gonum.org/v1/gonum v0.6.0 // indirect
- 	google.golang.org/grpc v1.26.0
- )
-+
-+replace github.com/cespare/xxhash => github.com/kraj/xxhash v1.1.1-0.20211201014032-8254a11eab56
---- a/go.sum
-+++ b/go.sum
-@@ -188,6 +188,8 @@ github.com/kr/pretty v0.1.0/go.mod h1:dA
- github.com/kr/pty v1.1.1/go.mod h1:pFQYn66WHrOpPYNljwOMqo10TkYh1fy3cYio2l3bCsQ=
- github.com/kr/text v0.1.0 h1:45sCR5RtlFHMR4UwH9sdQ5TC8v0qDQCHnXt+kaKSTVE=
- github.com/kr/text v0.1.0/go.mod h1:4Jbv+DJW3UT/LiOwJeYQe1efqtUx/iVham/4vfdArNI=
-+github.com/kraj/xxhash v1.1.1-0.20211201014032-8254a11eab56 h1:hCQ0jTkNInQ7PpNeGlSV9s+QMi6nUyyMuz37Bg3TduE=
-+github.com/kraj/xxhash v1.1.1-0.20211201014032-8254a11eab56/go.mod h1:XrSqR1VqqWfGrhpAt58auRo0WTKS1nRRg3ghfAqPWnc=
- github.com/lib/pq v1.0.0 h1:X5PMW56eZitiTeO7tKzZxFCSpbFZJtkMMooicw2us9A=
- github.com/lib/pq v1.0.0/go.mod h1:5WUZQaWbwv1U+lTReE5YruASi9Al49XbQIvNi/34Woo=
- github.com/mattn/go-colorable v0.0.9 h1:UVL0vNpWh04HeJXV0KLcaT7r06gOH2l4OW6ddYRUIY4=
diff --git a/meta-oe/recipes-dbs/influxdb/influxdb/0001-patch-term-module-for-mips-ispeed-ospeed-termios-abs.patch b/meta-oe/recipes-dbs/influxdb/influxdb/0001-patch-term-module-for-mips-ispeed-ospeed-termios-abs.patch
index b05fd3666b..55382b4636 100644
--- a/meta-oe/recipes-dbs/influxdb/influxdb/0001-patch-term-module-for-mips-ispeed-ospeed-termios-abs.patch
+++ b/meta-oe/recipes-dbs/influxdb/influxdb/0001-patch-term-module-for-mips-ispeed-ospeed-termios-abs.patch
@@ -12,20 +12,19 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 --- a/go.mod
 +++ b/go.mod
-@@ -56,4 +56,5 @@ require (
- 	google.golang.org/grpc v1.26.0
+@@ -223,3 +223,4 @@ require (
  )
  
+ replace github.com/nats-io/nats-streaming-server v0.11.2 => github.com/influxdata/nats-streaming-server v0.11.3-0.20201112040610-c277f7560803
 +replace github.com/pkg/term => github.com/kraj/term v0.0.0-20210111231523-7c42fcb0e627
- replace github.com/cespare/xxhash => github.com/kraj/xxhash v1.1.1-0.20211201014032-8254a11eab56
 --- a/go.sum
 +++ b/go.sum
-@@ -188,6 +188,8 @@ github.com/kr/pretty v0.1.0/go.mod h1:dA
- github.com/kr/pty v1.1.1/go.mod h1:pFQYn66WHrOpPYNljwOMqo10TkYh1fy3cYio2l3bCsQ=
- github.com/kr/text v0.1.0 h1:45sCR5RtlFHMR4UwH9sdQ5TC8v0qDQCHnXt+kaKSTVE=
+@@ -610,6 +610,8 @@ github.com/kr/pty v1.1.1/go.mod h1:pFQYn
  github.com/kr/text v0.1.0/go.mod h1:4Jbv+DJW3UT/LiOwJeYQe1efqtUx/iVham/4vfdArNI=
+ github.com/kr/text v0.2.0 h1:5Nx0Ya0ZqY2ygV366QzturHI13Jq95ApcVaJBhpS+AY=
+ github.com/kr/text v0.2.0/go.mod h1:eLer722TekiGuMkidMxC/pM04lWEeraHUUmBw8l2grE=
 +github.com/kraj/term v0.0.0-20210111231523-7c42fcb0e627 h1:3/XXm86KqrOZEJvEmFlzl3NTFA99n5Pd/cSXl60LmuA=
 +github.com/kraj/term v0.0.0-20210111231523-7c42fcb0e627/go.mod h1:BYR4E+NOQrH+NhXE71KuBNmyR1lQ+yDvP+O3IIHO5bM=
- github.com/kraj/xxhash v1.1.1-0.20211201014032-8254a11eab56 h1:hCQ0jTkNInQ7PpNeGlSV9s+QMi6nUyyMuz37Bg3TduE=
- github.com/kraj/xxhash v1.1.1-0.20211201014032-8254a11eab56/go.mod h1:XrSqR1VqqWfGrhpAt58auRo0WTKS1nRRg3ghfAqPWnc=
- github.com/lib/pq v1.0.0 h1:X5PMW56eZitiTeO7tKzZxFCSpbFZJtkMMooicw2us9A=
+ github.com/labstack/echo/v4 v4.2.1/go.mod h1:AA49e0DZ8kk5jTOOCKNuPR6oTnBS0dYiM4FW1e6jwpg=
+ github.com/labstack/gommon v0.3.0/go.mod h1:MULnywXg0yavhxWKc+lOruYdAhDwPK9wf0OL7NoOu+k=
+ github.com/lann/builder v0.0.0-20180802200727-47ae307949d0 h1:SOEGU9fKiNWd/HOJuq6+3iTQz8KNCLtVX6idSoTLdUw=
diff --git a/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb b/meta-oe/recipes-dbs/influxdb/influxdb_2.7.1.bb
similarity index 87%
rename from meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
rename to meta-oe/recipes-dbs/influxdb/influxdb_2.7.1.bb
index 50995c09b6..b29b9b8898 100644
--- a/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
+++ b/meta-oe/recipes-dbs/influxdb/influxdb_2.7.1.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "InfluxDB is a time series database designed to handle high write
 HOMEPAGE = "https://www.influxdata.com/products/influxdb-overview/"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=f39a8d10930fb37bd59adabb3b9d0bd6"
+LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=86f93342918318318c795b9999bd8131"
 
 RDEPENDS:${PN} = "bash"
 RDEPENDS:${PN}-dev = "bash"
@@ -15,15 +15,14 @@ GO_INSTALL = "\
 "
 
 SRC_URI = "\
-    git://${GO_IMPORT};protocol=https;branch=1.8;destsuffix=${BPN}-${PV}/src/${GO_IMPORT} \
-    file://0001-Use-v2.1.2-xxhash-to-fix-build-with-go-1.17.patch;patchdir=src/${GO_IMPORT} \
+    git://${GO_IMPORT};protocol=https;branch=2.7;destsuffix=${BPN}-${PV}/src/${GO_IMPORT} \
     file://influxdb \
     file://influxdb.conf \
 "
 
 SRC_URI:append:mipsarch = " file://0001-patch-term-module-for-mips-ispeed-ospeed-termios-abs.patch;patchdir=src/${GO_IMPORT}"
 
-SRCREV = "688e697c51fd5353725da078555adbeff0363d01"
+SRCREV = "407fa622e9a0a48516dacc7564f7ba59c8307da9"
 
 inherit go-mod pkgconfig systemd update-rc.d useradd
 
-- 
2.41.0



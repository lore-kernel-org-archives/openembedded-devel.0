Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B39D3C7115C
	for <webhook@archiver.kernel.org>; Sat, 21 Jun 2025 09:49:32 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.4458.1750499366499800629
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Jun 2025 02:49:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IW3RLkmz;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-32b855b468bso23979391fa.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Jun 2025 02:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750499364; x=1751104164; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LtUznABCM2Vh43mpA0cfklf75WsFeGRbVQ3FHq2GUbI=;
        b=IW3RLkmzCfESj2Jd2Doqd03dfhjinHsb/Lj+B1k3/eGg5UycmQmFIZXsgPXFRcehsi
         rG4+K2DFYdHoucQR+xQK7vawyEgZa0A9iZt6AwqStBo2hIGUS+ftx7b5OEW3Agkp6FhC
         lz2BvBHiSV7gsZeyJSfJROgdCfCucvQSeV7aw4hU/V1M4G6fT6+5Kr62qijln3xyrV7u
         1j8gj53o58lNYjBk4eC00/iFLoiMxoODVFnIhSsYRIMbYZMfLoelG4Lhor7x7gN2xxXY
         xv7sg7lcz7jtp9POJPq8E5fuHozrJG276tqvyWq7t6x2VWVR9qkAEVbYyxEvFuCqqpry
         BGPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750499364; x=1751104164;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LtUznABCM2Vh43mpA0cfklf75WsFeGRbVQ3FHq2GUbI=;
        b=VBFy2aMdKB/ht8tVBeuYnO+vgShvB1+x58VtdfvQO9iY2fg3TYDSMI8+7iaOk+AFGK
         0L5qA4loHw69Tya4CZKzy2Z6jRbubJ9HlnU7Xx6eW10kmMo14jFn5/i9T0oYeM9DGQKY
         S/pwaBEN/pcD7nxL9xnhgL4T7B6L2Jlvb+t/eKKX30P/6hWDFrcG690Vl2aEuV71z3FK
         bVjJBcGBlBpiubfKtTdPtJ9rDMtsv+jcFrQtv03axW1NjlUsfI0BYzgsnNQg8xMZR7EN
         ssOGE7eSUqaCTmi1IPJ2d9yNkM544lQstqqWCdGTwgXSKiVNUpDrwtFSEdeo0ZkIZ9BZ
         Ecng==
X-Gm-Message-State: AOJu0Ywj1FmqZ7s4iFH5XpgdNmzpDsrWKSJwHXK6En12VODGPRhAqzlA
	E1ugFyUNNqYS8UizJWQ+vTxGpEaR8AnySUEmdeKLpHw9the+ESMZ6xILfkDKHGHJ
X-Gm-Gg: ASbGncsyWY1ZP0cW/qNjvSyeiqRCpH8sAHTwJGQTDmEi4/ZOgkpjpRtyqYGbzA8F1uy
	7mW70m8YiOn5TqIQFSC9VKuYHsIWeFE3pm0Qmn7nfnCkYKFnCj43XSgAM9mVdiCI+wDOAiRhVD5
	XxuaxF5/NjLMwUuQssi9Q1zZ2ATVzkG7fHGQCnP2sjfuBjsFcl+BYz8Kt/+l18JMIu/2XXBSCXy
	BV+9XsBfKKs1HhqxUzLsgj31MpSWg2+s1V0JbWG0Mvxmii1zJUaeoI2vk+PwxpuH+NVn+0WMvgH
	f5GhX9nAgJkbyNLrc8LrKA5j7QeEw28a/PzswMedmmclaJbxMXgGBUr1Sq5QfJXKhPmdukqFmre
	mzct0JLzPn8Dikg==
X-Google-Smtp-Source: AGHT+IGT3v3fSlU+w4eRQD7s+fWbFs88HJNjOkL8hWb3KBejKqoWJ0EsgRiiRqCwYMV4rfesJhy/2w==
X-Received: by 2002:a2e:a007:0:b0:32b:59d1:7ec8 with SMTP id 38308e7fff4ca-32b9908ca0cmr13570191fa.36.1750499363953;
        Sat, 21 Jun 2025 02:49:23 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.153])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b97f59492sm5900951fa.5.2025.06.21.02.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 02:49:23 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] influxdb: remove S in recipes that fetch from git via setting BB_GIT_DEFAULT_DESTSUFFIX
Date: Sat, 21 Jun 2025 12:49:15 +0300
Message-ID: <20250621094915.1474527-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Jun 2025 09:49:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117993

Removing all the S = ${WORKDIR}/git assignments works because BB_GIT_DEFAULT_DESTSUFFIX
is set to match S from bitbake.conf (which itself is set to match typical tarball
releases).

ERROR: influxdb-1.8.10-r0 do_unpack: Recipes that set S = "${WORKDIR}/git" or S = "${UNPACKDIR}/git" should remove that assignment, as S set by bitbake.conf in oe-core now works.

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb b/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
index 2ad68d679a..cc305f6e8d 100644
--- a/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
+++ b/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=f39a8d10930fb37bd59adabb
 require ${BPN}-licenses.inc
 
 SRC_URI = "\
-    git://${GO_IMPORT};protocol=https;branch=1.8;destsuffix=git/src/${GO_IMPORT} \
+    git://${GO_IMPORT};protocol=https;branch=1.8;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/src/${GO_IMPORT} \
     file://0001-Use-v2.1.2-xxhash-to-fix-build-with-go-1.17.patch;patchdir=src/${GO_IMPORT} \
     file://0001-patch-term-module-for-mips-ispeed-ospeed-termios-abs.patch;patchdir=src/${GO_IMPORT} \
     file://influxdb \
@@ -16,8 +16,6 @@ require ${BPN}-go-mods.inc
 
 SRCREV = "688e697c51fd5353725da078555adbeff0363d01"
 
-S = "${WORKDIR}/git"
-
 GO_IMPORT = "github.com/influxdata/influxdb"
 GO_INSTALL = "\
     ${GO_IMPORT}/cmd/influx \
-- 
2.43.0



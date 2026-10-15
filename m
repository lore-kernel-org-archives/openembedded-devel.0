Return-Path: <rsangam@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78586CC6B33
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 10:19:58 +0000 (UTC)
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36135.1792059593640680715
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2026 03:19:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=YzHZS6qj;
 spf=pass (domain: mvista.com, ip: 74.125.82.178, mailfrom: rsangam@mvista.com)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-35aa0cf7c40so5189364eec.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 03:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1792059593; x=1792664393; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zA91h3PF2vhkvha+iTnutBa5ae+Wyg3BL+gCEOx/YOQ=;
        b=YzHZS6qjVBZcPLJSgzZZRC5dPmop4PZqmc5q0dk7+rJB4RN9iRn55YdwudRnbMFs3W
         Jh5sJxGwLB2Ebp8EOpwIExIDNeMQCnI0T8aTnmWfAB9EIYBQyrVwXpjTTR5uSX0OhI09
         eJFFrb5R0oAyCFYiEVQqI9k65zs16P8oeY2VY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792059593; x=1792664393;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zA91h3PF2vhkvha+iTnutBa5ae+Wyg3BL+gCEOx/YOQ=;
        b=CR/oAPF3pan/EQhJE6xMIihS69BeWUp+S7Nr1wc3Q9KeyRviBQGR5BRUi8uMe+t36U
         UWJi3KDY1V+gxtUmP4flsIdyvpc65d+NmVoALoMdg6rrEZB1dLObzfYN14jxYoZr4+BN
         Wki9CS9OJWGddZcjZBhpD+jV4UddMgq4cqmuxnVZTGRivLuwqy86LajALK/NF0JCF5Be
         p7f1XGC+umRi+X463u0wQwhBmzNaXunazl2zKMKI4hzwYVkEalycBwk8/r+OpToaYax8
         IdFfpg8Al4lcdLje6r7btRoED5kYUJIWuWsKnZvq/RYO6DGHYb+oMjr1aycu+veZuF5F
         KBBA==
X-Gm-Message-State: AFq9FYJU81JAhFOhk1gkwd2aYd0AloQ//iHjhzbsCD9VD4ITvbhD4QCQ
	h+vXWh15Vfs8gFNA90PSV7KS2sBXtKrnzdN1kDBzfAhmR2/5GAip40o6O6B2hnmqIVWeoaGZPuw
	b14fJYmk=
X-Gm-Gg: AYBFou18zEWzHiLcr9e8pDUKDxX4KvKilnE7pAR14zpKvMnzlTITsXExncMnbM41RKY
	oTqVCyemI+sT3tUQ7hnTPckNdyuKkSI0TIKXreIRmYTIbkc45iz2G1BTHN+GKrz8vqnakt4WMV8
	F3UKQLyzRdTdrXU2PoIk7SDSqHZFSvyVmGhJ/S7zwqu5PHZmMKw86A0QS/d3Q33K9gI2roIMJIA
	Nil1Ju1rYYE4NbNnaq/4g+UKHF4rzwHzjrscfTAvj21/s0RbotbPmdG//e9axcKS7hE0jJeC5Lz
	iwY9iidhFueO4WupFW4gVhQ/gGJr+a1e/OvFn5YaR+bTtfJC1kEjUPbTjc1ibGiQ4Y3vJsDqSeJ
	FTxiA77oFhWHyHbs+gQHQoa7GNQ0hL7BjkNR3inSIz2vUdOK8PVtaYURiI6qj3cPyLEJpbwCUrO
	gtSBCxwFYyi/BI9mrT6mSojvjNDhbrIEhEB8PBajIwqaQNRB9GthoqBUGTNWrjPl7r46lxF4Fwg
	T2Djg==
X-Received: by 2002:a05:693c:8095:b0:341:4f3:8f84 with SMTP id 5a478bee46e88-3537dfc602emr26121224eec.13.1792059592868;
        Thu, 15 Oct 2026 03:19:52 -0700 (PDT)
Received: from MVIN00040.mvista.com ([49.207.223.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-358de54fe47sm47225901eec.31.2026.10.15.03.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 03:19:52 -0700 (PDT)
From: Rohini Sangam <rsangam@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Rohini Sangam <rsangam@mvista.com>
Subject: [meta-oe][scarthgap][PATCH] nodejs: Security fix for CVE-2026-48617
Date: Thu, 15 Oct 2026 15:49:34 +0530
Message-Id: <20261015101934.30126-1-rsangam@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 10:19:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131005

Pick patch from [1] also mentioned at Debian tracker in [2]

[1] https://github.com/nodejs/node/commit/2f62693801a12bc8a485b3b7da3239ac522f607d
[2] https://security-tracker.debian.org/tracker/CVE-2026-48617

Signed-off-by: Rohini Sangam <rsangam@mvista.com>
---
 .../nodejs/nodejs/CVE-2026-48617.patch        | 118 ++++++++++++++++++
 .../recipes-devtools/nodejs/nodejs_20.20.2.bb |   1 +
 2 files changed, 119 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/CVE-2026-48617.patch

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2026-48617.patch b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2026-48617.patch
new file mode 100644
index 0000000000..ec3bf7e615
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2026-48617.patch
@@ -0,0 +1,118 @@
+From 2f62693801a12bc8a485b3b7da3239ac522f607d Mon Sep 17 00:00:00 2001
+From: RafaelGSS <rafael.nunu@hotmail.com>
+Date: Mon, 11 May 2026 18:25:16 -0300
+Subject: [PATCH] permission: handle process.chdir on writereport
+
+Signed-off-by: RafaelGSS <rafael.nunu@hotmail.com>
+PR-URL: https://github.com/nodejs-private/node-private/pull/870
+Reviewed-By: Antoine du Hamel <duhamelantoine1995@gmail.com>
+Refs: https://hackerone.com/reports/3625987
+
+CVE: CVE-2026-48617
+Upstream-Status: Backport [https://github.com/nodejs/node/commit/2f62693801a12bc8a485b3b7da3239ac522f607d]
+
+Signed-off-by: Rohini Sangam <rsangam@mvista.com>
+---
+ lib/internal/process/report.js                | 13 ++++++
+ .../test-permission-fs-write-report.js        | 42 +++++++++++++++++++
+ 2 files changed, 55 insertions(+)
+
+diff --git a/lib/internal/process/report.js b/lib/internal/process/report.js
+index 1639142d..7adaeacc 100644
+--- a/lib/internal/process/report.js
++++ b/lib/internal/process/report.js
+@@ -1,8 +1,10 @@
+ 'use strict';
+ const {
++  ERR_ACCESS_DENIED,
+   ERR_SYNTHETIC,
+ } = require('internal/errors').codes;
+ const { getValidatedPath } = require('internal/fs/utils');
++const permission = require('internal/process/permission');
+ const {
+   validateBoolean,
+   validateObject,
+@@ -23,6 +25,17 @@ const report = {
+       file = getValidatedPath(file);
+     }
+ 
++    if (permission.isEnabled()) {
++      const resource = file ?? process.cwd();
++      if (!permission.has('fs.write', resource)) {
++        throw new ERR_ACCESS_DENIED(
++          'Access to this API has been restricted',
++          'FileSystemWrite',
++          resource,
++        );
++      }
++    }
++
+     if (err === undefined) {
+       err = new ERR_SYNTHETIC();
+     } else {
+diff --git a/test/parallel/test-permission-fs-write-report.js b/test/parallel/test-permission-fs-write-report.js
+index c8f6673d..f51b86b3 100644
+--- a/test/parallel/test-permission-fs-write-report.js
++++ b/test/parallel/test-permission-fs-write-report.js
+@@ -1,12 +1,28 @@
+ // Flags: --experimental-permission --allow-fs-read=*
+ 'use strict';
+ 
++const { spawnSyncAndExitWithoutError } = require('../common/child_process');
++
+ const common = require('../common');
+ common.skipIfWorker();
+ if (!common.hasCrypto)
+   common.skip('no crypto');
+ 
++// We need to define the flags dynamically to account for the `NODE_TEST_DIR` env var.
++if (!process.permission) {
++  spawnSyncAndExitWithoutError(process.execPath, [
++    '--permission',
++    '--allow-fs-read=*', `--allow-fs-write=${process.env.NODE_TEST_DIR || './test'}/.tmp.*`, '--allow-child-process',
++    __filename,
++  ]);
++  return;
++}
++
+ const assert = require('assert');
++const path = require('path');
++const tmpdir = require('../common/tmpdir');
++
++tmpdir.refresh();
+ 
+ {
+   assert.throws(() => {
+@@ -27,3 +43,29 @@ const assert = require('assert');
+     resource: process.cwd(),
+   }));
+ }
++
++{
++  const reportPath = path.join(tmpdir.path, 'report.json');
++  spawnSyncAndExitWithoutError(
++    process.execPath,
++    [
++      '--permission',
++      '--allow-fs-read=*',
++      `--allow-fs-write=${tmpdir.path}/*`,
++      '-e',
++      `process.report.writeReport(${JSON.stringify(reportPath)})`,
++    ]
++  );
++}
++
++spawnSyncAndExitWithoutError(
++  process.execPath,
++ [
++    '--permission',
++    '--allow-fs-read=*',
++    `--allow-fs-write=${tmpdir.path}`,
++    '-e',
++    'process.report.writeReport()',
++  ],
++  { cwd: tmpdir.path }
++);
+-- 
+2.44.4
+
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_20.20.2.bb b/meta-oe/recipes-devtools/nodejs/nodejs_20.20.2.bb
index aa6189da60..4badec2135 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_20.20.2.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_20.20.2.bb
@@ -26,6 +26,7 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://libatomic.patch \
            file://0001-Revert-stop-using-deprecated-ares_query.patch \
            file://run-ptest \
+           file://CVE-2026-48617.patch \
            "
 SRC_URI:append:class-target = " \
            file://0001-Using-native-binaries.patch \
-- 
2.34.1



Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FC84C3600C
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 11:18:48 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.52])
 by mx.groups.io with SMTP id smtpd.web10.19690.1742987923368530784
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Mar 2025 04:18:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.52, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgeamrelo01.lge.com) (156.147.1.125)
	by 156.147.23.52 with ESMTP; 26 Mar 2025 20:18:40 +0900
X-Original-SENDERIP: 156.147.1.125
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.121.109)
	by 156.147.1.125 with ESMTP; 26 Mar 2025 20:18:40 +0900
X-Original-SENDERIP: 10.177.121.109
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-devel@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [meta-oe][PATCH 1/2] crash: upgrade 8.0.5 -> 8.0.6
Date: Wed, 26 Mar 2025 20:18:38 +0900
Message-Id: <20250326111839.1206834-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Mar 2025 11:18:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116293

From: "mark.yang" <mark.yang@lge.com>

ChangeLog:
https://crash-utility.github.io/changelog/ChangeLog-8.0.6.txt

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 ...sh-cross-canadian_8.0.5.bb => crash-cross-canadian_8.0.6.bb} | 0
 meta-oe/recipes-kernel/crash/crash.inc                          | 2 +-
 meta-oe/recipes-kernel/crash/{crash_8.0.5.bb => crash_8.0.6.bb} | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-kernel/crash/{crash-cross-canadian_8.0.5.bb => crash-cross-canadian_8.0.6.bb} (100%)
 rename meta-oe/recipes-kernel/crash/{crash_8.0.5.bb => crash_8.0.6.bb} (100%)

diff --git a/meta-oe/recipes-kernel/crash/crash-cross-canadian_8.0.5.bb b/meta-oe/recipes-kernel/crash/crash-cross-canadian_8.0.6.bb
similarity index 100%
rename from meta-oe/recipes-kernel/crash/crash-cross-canadian_8.0.5.bb
rename to meta-oe/recipes-kernel/crash/crash-cross-canadian_8.0.6.bb
diff --git a/meta-oe/recipes-kernel/crash/crash.inc b/meta-oe/recipes-kernel/crash/crash.inc
index cab4e178b9..3d712592df 100644
--- a/meta-oe/recipes-kernel/crash/crash.inc
+++ b/meta-oe/recipes-kernel/crash/crash.inc
@@ -24,7 +24,7 @@ SRC_URI = "git://github.com/crash-utility/${BPN}.git;branch=master;protocol=http
            file://gdb_build_jobs_and_not_write_crash_target.patch \
            file://0001-symbol-fix-S-cannot-work-with-kaslr-detection.patch \
            "
-SRCREV = "ceacceef7d13134d327719a624cfafed99e90f8a"
+SRCREV = "f13853cef53f5c5463a51021edbc81977e2b1405"
 
 SRC_URI[gdb.sha256sum] = "b33ad58d687487a821ec8d878daab0f716be60d0936f2e3ac5cf08419ce70350"
 
diff --git a/meta-oe/recipes-kernel/crash/crash_8.0.5.bb b/meta-oe/recipes-kernel/crash/crash_8.0.6.bb
similarity index 100%
rename from meta-oe/recipes-kernel/crash/crash_8.0.5.bb
rename to meta-oe/recipes-kernel/crash/crash_8.0.6.bb
-- 
2.34.1



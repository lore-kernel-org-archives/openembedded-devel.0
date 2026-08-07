Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A580C5AC7C
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 09:30:51 +0000 (UTC)
Received: from lgeamrelo13.lge.com (lgeamrelo13.lge.com [156.147.23.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39156.1786095043991718242
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Aug 2026 02:30:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.53, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgemrelse7q.lge.com) (156.147.1.151)
	by 156.147.23.53 with ESMTP; 7 Aug 2026 18:30:41 +0900
X-Original-SENDERIP: 156.147.1.151
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.127.86)
	by 156.147.1.151 with ESMTP; 7 Aug 2026 18:30:41 +0900
X-Original-SENDERIP: 10.177.127.86
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-devel@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [meta-oe][PATCH] bpftool: start builds from a clean build dir
Date: Fri,  7 Aug 2026 18:30:19 +0900
Message-ID: <20260807093018.2108683-2-mark.yang@lge.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Aug 2026 09:30:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128865

From: "mark.yang" <mark.yang@lge.com>

Nothing cleans ${B} between rebuilds and the kernel makefiles cache
their feature detection results there, so a sysroot-only change (say
binutils leaving DEPENDS) skips the relink and packages a stale
binary that still links libbfd.

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 meta-oe/recipes-kernel/bpftool/bpftool.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-kernel/bpftool/bpftool.bb b/meta-oe/recipes-kernel/bpftool/bpftool.bb
index 66e48cfd84..419be18d99 100644
--- a/meta-oe/recipes-kernel/bpftool/bpftool.bb
+++ b/meta-oe/recipes-kernel/bpftool/bpftool.bb
@@ -26,6 +26,8 @@ SECURITY_CFLAGS = ""
 
 do_configure[depends] += "virtual/kernel:do_shared_workdir"
 
+do_configure[cleandirs] = "${B}"
+
 COMPATIBLE_HOST = "(x86_64|aarch64|riscv64).*-linux"
 
 do_compile() {


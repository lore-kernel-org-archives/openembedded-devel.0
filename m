Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94D2FCDB466
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 09:01:46 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7224.1782378099414473771
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2026 02:01:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fZvavpEv;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782378099; x=1813914099;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=npTnBhT8QSIFeQe3wQU86GkNkqJ8Ly5yckkaGfavPP0=;
  b=fZvavpEvKewcH2fRM3F3Nlf0U4gS+fCX3FHCe7V7c/w4QORfXtA4d06y
   89mPIg/f4mYM8E7AHmNRYNZlzNziNpnnx/xryk6eC+KDIuMWj20QmStr3
   qaU8s/PAopVZyCaN/muGTWtzo1x6VnFChnd/Yhk9bXPborQH8d1i3nGw3
   TBAT04lA4wp6nIRdBroB3AXp05CEiJBVslYGmYf8O/5OhrTgXopOuMYEc
   sJKP1CKXMrC0eNX11VTXz7rp753TtLVJ/0weVIqMzOHLFm+BfbrnP/s9B
   ZtrgAKGcyXoDVBxRYIS2TDLfpqp1m61ljQyPcg827jOoCrnUbNYYp3D7T
   g==;
X-CSE-ConnectionGUID: B6GJqDZWQuCyrWutPH9JOg==
X-CSE-MsgGUID: ZBUVq+dyTOayoluqWxeR0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="224184746"
X-IronPort-AV: E=Sophos;i="6.24,224,1774278000"; 
   d="scan'208";a="224184746"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 18:01:37 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 727DA8204C4
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:01:37 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 2B1CB8320D6
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:01:37 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 36F511017328;
	Thu, 25 Jun 2026 09:01:34 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/47] haveged: upgrade 1.9.22 -> 1.9.24
Date: Thu, 25 Jun 2026 17:00:44 +0800
Message-ID: <20260625090127.1563-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260625090127.1563-1-wangmy@fujitsu.com>
References: <20260625090127.1563-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:01:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127736

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Add --no-command / -C flag to disable command mode at runtime
- Disable command mode in haveged.service and haveged-once.service
- Enable PrivateNetwork=true and remove ReadWritePaths=/dev/shm in service files
- Add PractRand example to man page
- Use O_EXCL with sem_open to prevent semaphore pre-planting attacks [pyllyukko]
- Recover stale semaphores after SIGKILL by unlinking and retrying
- Add sem_close before sem_unlink for proper cleanup ordering
- Fix compilation when NO_COMMAND_MODE is defined
- Fix out-of-bounds memory access in safein()/safeout() on socket errors
- Reject command socket connections from different user namespaces
- Use O_NOFOLLOW for PID file to prevent symlink attacks
- Open random device with O_CLOEXEC to prevent fd leak across execv
- Restrict semaphore permissions from 0644 to 0600

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../haveged/{haveged_1.9.22.bb => haveged_1.9.24.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/haveged/{haveged_1.9.22.bb => haveged_1.9.24.bb} (94%)

diff --git a/meta-oe/recipes-extended/haveged/haveged_1.9.22.bb b/meta-oe/recipes-extended/haveged/haveged_1.9.24.bb
similarity index 94%
rename from meta-oe/recipes-extended/haveged/haveged_1.9.22.bb
rename to meta-oe/recipes-extended/haveged/haveged_1.9.24.bb
index 281fe1c2c9..68c8d2bdb2 100644
--- a/meta-oe/recipes-extended/haveged/haveged_1.9.22.bb
+++ b/meta-oe/recipes-extended/haveged/haveged_1.9.24.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://www.issihosts.com/haveged/index.html"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRCREV = "21bad00a09233855fbea14ac062bc72b5eabc9a6"
+SRCREV = "b52433d9234863050d52358f4a6cea86fbfb8e52"
 SRC_URI = "git://github.com/jirka-h/haveged.git;branch=master;protocol=https;tag=v${PV} \
 "
 
-- 
2.43.0



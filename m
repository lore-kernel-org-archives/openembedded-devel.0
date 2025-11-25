Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE29ACFD315
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 08:52:57 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13005.1764060774973221077
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Nov 2025 00:52:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TmhM8CRx;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1764060775; x=1795596775;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+7Yxzk6HhEdE4SaSS5au4gTZBjtKqo5KV0xt5AzxMlM=;
  b=TmhM8CRx0O36EiBa4n0HAHMAWBH6uB4E88OsEtRLmDFqKxd8Skwh2C7k
   1QN9ATm6BDWkRf6JuEfROHLYpbN7Z8o8HgKYiAxAu/laeWXcgr0vZ7y6l
   CPGz2FfSKJ/SoAiRXidrP3Ic3EvVO6hWLfZnNCphB6GmbYHnKsDDEqnSM
   tKrBRh9/tFwDN/cUIal9nuzOKbALmikhCSmHcnTNbEOXtXla74ON/4eWh
   PtJidPtRD9WjYPQSVaqCmuctebuX8cPaEDCREP8jpw7BQ+yIvybqParWP
   HJ53YMg5KBEvakafwdSUO8BUfjxjRwITrrZu3wdzEwu3EzTQZ4Qq1FJrS
   g==;
X-CSE-ConnectionGUID: J1/wWGQlQcyxI+Qgz5mNVQ==
X-CSE-MsgGUID: Zw/LGg5DQh65mB67lgNalw==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="207754412"
X-IronPort-AV: E=Sophos;i="6.20,225,1758553200"; 
   d="scan'208";a="207754412"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 17:52:52 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id E24C0C0041B
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 08:52:51 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 9DD49C01191
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 08:52:51 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 9127218004F0
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 08:52:49 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] lvm2: upgrade 2.03.36 -> 2.03.37
Date: Tue, 25 Nov 2025 16:52:23 +0800
Message-ID: <20251125085223.3312-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 08:52:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122023

Changelog:
Mostly bugfix release, with most focus on dmeventd, persitent reservations,
lvmdevices, and improvement in tests.

* Improvements in dmeventd thread safety, shutdown times and more.
* Many fixes and improvements for persistent reservations.
* Support output in list mode for all lvmconfig --typeconfig types with --list.
* Fix deadlock in lvmdbusd on SIGINT in lvm shell mode.
* And many more.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 09ee410614..ccefa206b6 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -18,8 +18,8 @@ SRC_URI = "git://sourceware.org/git/lvm2.git;branch=main \
            file://0001-include-libgen.h-for-basename.patch \
            "
 
-SRCREV = "c8b7a765cbd731af32964adaf921f9e19d56a048"
-PV = "2.03.36"
+SRCREV = "d34fc799fd86538756ba56b37e1ab56ab1b75d13"
+PV = "2.03.37"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\_\d+)+)"
 
-- 
2.43.0



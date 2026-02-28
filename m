Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB0B6FEE4DC
	for <webhook@archiver.kernel.org>; Sat, 28 Feb 2026 09:02:28 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.115991.1772269338844547670
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Feb 2026 01:02:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TwKe4b4b;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772269337; x=1803805337;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=WiCPischPhRbCzS53s8dJxnSD5L5B9lVWJ4TwNsiYzY=;
  b=TwKe4b4bxPCDwnW9lotVOVi/O11s/ZqMX2Um1dG1lNeKFW6+um5cka8N
   JwEOrNl4pNOYZWxWHnDgXUQOQVml41scc4upmenGRAvD2Rm4TbmdL/Bgq
   HToPwnLAmw1TSUTrHaPUEsh/WPlkhE3YSqM1CzcjfmYBBrI+u+bIuNaTO
   t/vftWP0l0Oye286+TZ0m6u971phQWXsU+qUa1DN9SuRxweJk5llizWvF
   IEMgrQAg7WhzVQLLyiscSInVKQHO3QouTU0Hc7GDPw2BAOVziBu9cwU9T
   ZWvihaUoPxnTmWxrAfVtxmoCITdTx3dN5OvEYV7bby9QGaOWnCXrLWi7d
   g==;
X-CSE-ConnectionGUID: QTWUNirVQ6y7kjWA2TnNIg==
X-CSE-MsgGUID: Jsm9R571T2ap61DBhg570A==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="218821761"
X-IronPort-AV: E=Sophos;i="6.21,315,1763391600"; 
   d="scan'208";a="218821761"
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 5BBCB21F7
	for <openembedded-devel@lists.openembedded.org>; Sat, 28 Feb 2026 09:02:17 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 118EE100596B
	for <openembedded-devel@lists.openembedded.org>; Sat, 28 Feb 2026 09:02:17 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.128.218])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id C7992101C92A
	for <openembedded-devel@lists.openembedded.org>; Sat, 28 Feb 2026 09:02:14 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH] python3-uefi-firmware: upgrade 1.12  -> 1.13
Date: Sat, 28 Feb 2026 17:02:04 +0800
Message-ID: <20260228090204.3587-7-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260228090204.3587-1-liuyd.fnst@fujitsu.com>
References: <20260228090204.3587-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 28 Feb 2026 09:02:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124776

Changelog:
  https://github.com/theopolis/uefi-firmware-parser/releases/tag/v1.13

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...3-uefi-firmware_1.12.bb => python3-uefi-firmware_1.13.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-uefi-firmware_1.12.bb => python3-uefi-firmware_1.13.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-uefi-firmware_1.12.bb b/meta-python/recipes-devtools/python/python3-uefi-firmware_1.13.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-uefi-firmware_1.12.bb
rename to meta-python/recipes-devtools/python/python3-uefi-firmware_1.13.bb
index 09732fc865..7fe92e31f2 100644
--- a/meta-python/recipes-devtools/python/python3-uefi-firmware_1.12.bb
+++ b/meta-python/recipes-devtools/python/python3-uefi-firmware_1.13.bb
@@ -7,10 +7,9 @@ HOMEPAGE = "https://github.com/theopolis/uefi-firmware-parser"
 LICENSE = "BSD-2-Clause & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://setup.py;md5=5a59066a8676f17262ef7e691f8ef253"
 
-SRC_URI = "git://github.com/theopolis/uefi-firmware-parser;protocol=https;branch=master"
-
-SRCREV = "0c5fb74bcecc0e5c80625c38130fe948c2a3656e"
+SRC_URI = "git://github.com/theopolis/uefi-firmware-parser;protocol=https;branch=master;tag=v${PV}"
 
+SRCREV = "6d7cf5f0672c577028462ec175fec9fda95cc5f0"
 
 inherit setuptools3
 
-- 
2.43.0



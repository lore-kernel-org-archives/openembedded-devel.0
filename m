Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 651C5C83F1B
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 09:07:17 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.56129.1751879228940391649
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jul 2025 02:07:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=It92ODT+;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751879233; x=1783415233;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jUWfxGUPooZgD1TKejuN/aNcuxKpF66403HqTKejnyU=;
  b=It92ODT+6DqGlfGKtLiMUKXVsJ7eYgk2+HUPCYVyc1hvXQvdXowOG5Ym
   gk6Ckob0C1MLEPV7jNsS+57cTDj6gzVMVfdQc8O2TkTJqiAC65MzM1HUX
   dTnr0njZC9tm5ZUurdapjf18SpbYNPZjz8VILPiSY3ZT4wowRjaDpdeVQ
   gDyr4z86e3gmpTZHmv7lNeLsRSryaG+YJH1lfcsgnLcHrXTmCGOymrQpt
   1qD1fqo+KKL86tA6NXFU1bu/nmlop0MLuk/94VH1MoFl2+XaZFYaLtGON
   fZQGbsP7tIvMSWcWQFDuColtF2p+MMhscpyosNJwsGd7lLIv9gaee2SeU
   w==;
X-CSE-ConnectionGUID: 9kX3EaA6QN+GZ8pzqkhvPA==
X-CSE-MsgGUID: X7BfBH6YSoy7+fOScHpRSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="205437834"
X-IronPort-AV: E=Sophos;i="6.16,293,1744038000"; 
   d="scan'208";a="205437834"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 18:07:13 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id F2D58C000AB
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:12 +0000 (UTC)
Received: from yto-m1.gw.nic.fujitsu.com (yto-m1.gw.nic.fujitsu.com [10.128.47.162])
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTP id 768F1C02F1A
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:12 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id C3895261519
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 18:07:10 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5310E1A000B;
	Mon,  7 Jul 2025 17:07:10 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 12/35] libdivecomputer: upgrade 0.8.0 -> 0.9.0
Date: Mon,  7 Jul 2025 17:06:32 +0800
Message-ID: <20250707090656.1216-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250707090656.1216-1-wangmy@fujitsu.com>
References: <20250707090656.1216-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 09:07:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118255

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-extended/libdivecomputer/libdivecomputer_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-extended/libdivecomputer/libdivecomputer_git.bb b/meta-oe/recipes-extended/libdivecomputer/libdivecomputer_git.bb
index 9f4b2a19d0..7e6caa1dc2 100644
--- a/meta-oe/recipes-extended/libdivecomputer/libdivecomputer_git.bb
+++ b/meta-oe/recipes-extended/libdivecomputer/libdivecomputer_git.bb
@@ -8,10 +8,10 @@ DEPENDS = "libusb1"
 
 inherit autotools pkgconfig
 
-PV = "0.8.0"
+PV = "0.9.0"
 
-SRCREV = "db9371cf9f38b5a3b2f6e4fae3f92eb052d2d929"
-SRC_URI = "git://github.com/libdivecomputer/libdivecomputer.git;protocol=https;branch=master \
+SRCREV = "25b8fed709106dc693baad13eb47297abba46d98"
+SRC_URI = "git://github.com/libdivecomputer/libdivecomputer.git;protocol=https;branch=master;tag=v${PV} \
           "
 
 
-- 
2.43.0



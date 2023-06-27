Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDDB1EB64D9
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 07:14:24 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.7501.1687850054807051387
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jun 2023 00:14:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="101771666"
X-IronPort-AV: E=Sophos;i="6.01,161,1684767600"; 
   d="scan'208";a="101771666"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 16:14:12 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3BDB9C68E4
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 16:14:10 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7328DD3F1D
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 16:14:09 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 77D3F88918;
	Tue, 27 Jun 2023 16:14:08 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] cppzmq: upgrade 4.9.0 -> 4.10.0
Date: Tue, 27 Jun 2023 15:12:00 +0800
Message-Id: <1687849939-19941-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27716.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27716.005
X-TMASE-Result: 10-1.315500-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrtOtXYgbXjdfozDhGeQC9EjNV
	+wj8Pzk/jMeR830In2wRco09tSinXce3wV6A2hch8t4fUUGeErTBOVz0Jwcxl6vCrG0TnfVU2d8
	mtRIRsUOBkESMI05d4qHvyg1ZsxTfW2EXohiB6dqeAiCmPx4NwGmRqNBHmBveafSbrzwSjfwqtq
	5d3cxkNX992fQUJeuIgSDQQXqPupP/PVu5E9m8t1Y1Vsf12toDSYL0NZbaJ0o4+ouGs13GVWyEo
	YoQpTxsZymXcHApK8X7P0rDbzpVk44g39jQjFhNU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 07:14:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103595

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 message_t::rebuild with string argument, like the constructor #579
 Add DRAFT socket options for libzmq 4.3.2-4 #594
 Add function for adding file descriptor to poller_t #595
 Fix noexcept warnings #581
 Disambiguation from other max functions #578

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
index 1dbdc3e46a..0e1ad9af56 100644
--- a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
+++ b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
@@ -4,8 +4,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=db174eaf7b55a34a7c89551197f66e94"
 DEPENDS = "zeromq"
 
-SRCREV = "d67b6352b87a238775cd17e4376b980d07fa7939"
-PV = "4.9.0"
+SRCREV = "c94c20743ed7d4aa37835a5c46567ab0790d4acc"
+PV = "4.10.0"
 
 SRC_URI = "git://github.com/zeromq/cppzmq.git;branch=master;protocol=https"
 
-- 
2.34.1



Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29E0BC48260
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 08:34:09 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.37043.1708331642239885422
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 00:34:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=sxSZuwnN;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: c-shilwant@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41J8XxND090940;
	Mon, 19 Feb 2024 02:33:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1708331639;
	bh=pouRLFH2Y5SHeEPDXP+D/37NqHxSBpE0zNzplndVfz0=;
	h=From:To:CC:Subject:Date;
	b=sxSZuwnNh6C72eRLvGirey7vjjIKBs8Ub3IEVSNCYwfvXKDR5jMLPZFzS+QWZGPER
	 6WATCECgryk5fF/2zgpODLEnTUqMpaKYUOCNzQhmU6Bwjjo7q2Ya/opDlgyU3rx5wB
	 RGDkwg/BVkoQFxRGptz9oiPLWBeNQsNeT5iAfVqQ=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41J8XxFP053092
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 19 Feb 2024 02:33:59 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 19
 Feb 2024 02:33:58 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 19 Feb 2024 02:33:58 -0600
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41J8Xw6t098496;
	Mon, 19 Feb 2024 02:33:58 -0600
From: Chirag Shilwant <c-shilwant@ti.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Gyan Gupta <g-gupta@ti.com>, Khasim <khasim@ti.com>,
        Ryan
	<reatmon@ti.com>, Denys <denis@denix.org>
Subject: [meta-oe][kirkstone][PATCH] meta-oe: kernel-selftest: Add few more testcases
Date: Mon, 19 Feb 2024 14:03:50 +0530
Message-ID: <20240219083350.1149745-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 08:34:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108845

- This commit will build and install following testcases under /usr/kernel-selftest of filesystem,
    * ptp
    * timers

- Backporting the commit from master 02806ed4c16d7e6f80653baec71be071d4e8f9c0

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
index 3d97ea096..ab76fe262 100644
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
@@ -44,6 +44,8 @@ S = "${WORKDIR}/${BP}"
 TEST_LIST = "\
     ${@bb.utils.filter('PACKAGECONFIG', 'bpf firmware vm', d)} \
     rtc \
+    ptp \
+    timers \
 "
 
 EXTRA_OEMAKE = '\
-- 
2.34.1



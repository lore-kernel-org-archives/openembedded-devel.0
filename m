Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0068CCF9E0
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 09:01:26 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.7042.1761642079068377577
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 02:01:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OTSzBnIi;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761642079; x=1793178079;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=///bpnXyJw4Glysibcolk/A+gvwkhiHz8sCDm0KBVXc=;
  b=OTSzBnIiDT0XIMWqadv7Rt2Y9HNhh03Dly6DDNPff4+fNh/ZjkyN03jE
   pTwpTx5pOn1TdPxLX7PmcxXZkMMwhQ5rmxMGgZOV0ca1ZLE4tVna4aWBf
   pTQV9k2ABwuvNUXdrQgjwBKU1u338YrMujaxUNrn1GSAwffDPyrM7Tmw2
   QzDN8T+NqLRgDDZmQzCKetvOJ/Ff908A8zKZkzyDeJDrMms8mhJ+7HYjX
   P17s9e2iNbmmEnEyO1GNHHamTbeXY6cnJFjsBgp+jJw/R1xBLAOMgZ9xh
   Ec2yFUqfrTSFdj+kebXH5Na+Rp3crECmECklSoQNnqCu1cwAk1176O4tk
   g==;
X-CSE-ConnectionGUID: ltYA78KFQKaRNiDcSEr5GA==
X-CSE-MsgGUID: CbBCrQrsRu2VpM6499viHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="217391525"
X-IronPort-AV: E=Sophos;i="6.19,261,1754924400"; 
   d="scan'208";a="217391525"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([51.138.80.169])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 18:01:17 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 3F263140B
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 09:01:17 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id EAFE51800E84
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 09:01:16 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 5FF64405527;
	Tue, 28 Oct 2025 09:01:14 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [PATCH 3/5] add local boards
Date: Tue, 28 Oct 2025 17:00:34 +0800
Message-ID: <20251028090037.143-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251028090037.143-1-wangmy@fujitsu.com>
References: <20251028090037.143-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 09:01:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121070

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../scripts/boards/myboard_arm.board                             | 1 +
 .../scripts/boards/myboard_x86.board                             | 1 +
 2 files changed, 2 insertions(+)
 rename myboard_arm.board => fuego-core-ubinux/scripts/boards/myboard_arm.board (98%)
 rename myboard_x86.board => fuego-core-ubinux/scripts/boards/myboard_x86.board (98%)

diff --git a/myboard_arm.board b/fuego-core-ubinux/scripts/boards/myboard_arm.board
similarity index 98%
rename from myboard_arm.board
rename to fuego-core-ubinux/scripts/boards/myboard_arm.board
index 77eb5a5..08e54f0 100644
--- a/myboard_arm.board
+++ b/fuego-core-ubinux/scripts/boards/myboard_arm.board
@@ -5,6 +5,7 @@ IPADDR="192.168.246.59"
 SRV_IP="192.168.246.2"
 SRV_PORT="8090"
 LOGIN="root"
+TOOLCHAIN="aarch64"
 BOARD_TESTDIR="/home/a"
 PASSWORD="goodluck"
 #SSH_KEY="path/to/id_rsa"
diff --git a/myboard_x86.board b/fuego-core-ubinux/scripts/boards/myboard_x86.board
similarity index 98%
rename from myboard_x86.board
rename to fuego-core-ubinux/scripts/boards/myboard_x86.board
index fc5cca9..dcabc50 100644
--- a/myboard_x86.board
+++ b/fuego-core-ubinux/scripts/boards/myboard_x86.board
@@ -5,6 +5,7 @@ IPADDR="192.168.246.61"
 SRV_IP="192.168.246.2"
 SRV_PORT="8090"
 LOGIN="root"
+TOOLCHAIN="x86_64"
 BOARD_TESTDIR="/home/a"
 PASSWORD="goodluck"
 #SSH_KEY="path/to/id_rsa"
-- 
2.34.1



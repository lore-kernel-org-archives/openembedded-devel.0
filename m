Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EA77C54739
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 08:47:08 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.2886.1722934020635546610
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 01:47:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FhCenRbM;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722934021; x=1754470021;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=dpiCc9w2wcyi+qDVopVP3nJa+jClG4JQ56AuydvR8/c=;
  b=FhCenRbMZfaUj98DT8U8b6WnSOuST00r6McS+rSDDpLv7+d8vx9XxoJp
   k1a6GAE3WVT2WXn5Ez4xZir0+FV2tPTBc+Ph5ufMgiF++Tc96u4z5wWKi
   7Wbdcjtzdn1de6EbUGBCktozjiYfZkiErnkM+E7r+I2GeNulLbobKW1Wg
   L9RGf3ecKRABSNLhkVu/+5DzjS44fdOEYc2f3JJV3tjU2oLEZ7yhP93Te
   oVx5f8zEy1EgqQMqFeVwjF7fyk1F/vHqiVJhsKq8XhxP5nh+GyCa4QlHM
   GZqDnncZSOajGmCUKn14HqSPUAPHW+Nt30KmvMWmO+H1TwDuRzd6N0nLn
   A==;
X-CSE-ConnectionGUID: w0sDr4X9TSGNZKRNFNcdZQ==
X-CSE-MsgGUID: zkY+LrvdTUKc28L+x1l3Sg==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="169912622"
X-IronPort-AV: E=Sophos;i="6.09,267,1716217200"; 
   d="scan'208";a="169912622"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 17:46:59 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 81E1AD4255
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:56 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id CB806D7465
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 67C3D20076D14
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:55 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 147221A0002;
	Tue,  6 Aug 2024 16:46:55 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 26/60] networkmanager: upgrade 1.48.4 -> 1.48.6
Date: Tue,  6 Aug 2024 16:46:00 +0800
Message-Id: <1722933994-32549-26-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
References: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28578.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28578.006
X-TMASE-Result: 10-0.218600-10.000000
X-TMASE-MatchedRID: V7gFd1X8+4Wjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmKN5v0jh1hv25cFdomgH0lnFEUknJ/kEl5lVdRvgpNpe/oLR4+zsDTtvG0
	VHndRxgLzO1G6yOdi49Hwic4b/7mBzp+6AUT27P0Bc9NuNscFp/ntZaJGu81HTaNABJ9SY/nldM
	wtgdQN3FtUA4ORBg6hEPvowe5r7JLyDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgAQ4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 08:47:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111544

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{networkmanager_1.48.4.bb => networkmanager_1.48.6.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.48.4.bb => networkmanager_1.48.6.bb} (99%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.48.4.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.48.6.bb
similarity index 99%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager_1.48.4.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager_1.48.6.bb
index 8573a7327..215f5a424 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.48.4.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.48.6.bb
@@ -44,7 +44,7 @@ SRC_URI = " \
 "
 SRC_URI:append:libc-musl = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' file://0001-linker-scripts-Do-not-export-_IO_stdin_used.patch', '', d)}"
 
-SRC_URI[sha256sum] = "f25f35fe2ea1a473f7d184ccc72c8d4adc9705926fe4f3a7a3c8549941f56b03"
+SRC_URI[sha256sum] = "e65c496e06631a4977c795c0f248598c39c340e5635d7cf54ec3072acc998995"
 
 S = "${WORKDIR}/NetworkManager-${PV}"
 
-- 
2.34.1



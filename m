Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 795E5CF64A1
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 07:43:38 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.48950.1727682213183132178
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Sep 2024 00:43:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tlMmFBfP;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727682213; x=1759218213;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Od5aBavdknSO9iKMs6h5mnCy2zH1gpw82yowDiajbhw=;
  b=tlMmFBfPmhck1UE8u7wPZ+c0+SsLN9D2TSSCLMXbX3YaYbpcRGNLv2PW
   BihP6jwu+68QybHtxPpy02ja16MJxGBBlZIpnAQLyrY3/OhZmZ1Tyosrt
   Bs1j2dGxXMRaYViKPW1X42f5D1Pr6igLSBuHAyD2XHT+yKN9SofL4G5bi
   vkmEzHjnIXrlEuTNX0pqgbVGZSBnj0aA1BPMbg4oPObcn1Tcx5RIvWDZB
   /D5HIhSC3pLYvXxs97faevu+ohdgalwM3zFd/poNrgaY5GQsii5xKKSyI
   Qc5uScK3JjShaaM3GVVZnSI2vmRLIckR4waWbTx1VRMaBCPX+fOIXxgNr
   g==;
X-CSE-ConnectionGUID: pinLUophR6CwJlqxNI92cA==
X-CSE-MsgGUID: nS4m54vuSouy18bP631mFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="154116602"
X-IronPort-AV: E=Sophos;i="6.11,165,1725289200"; 
   d="scan'208";a="154116602"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 16:43:30 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id BA65CD8017
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:28 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 07A34D774C
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9D04D20076D01
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:27 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4FB7A1A01E9;
	Mon, 30 Sep 2024 15:43:27 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/40] btop: upgrade 1.3.2 -> 1.4.0
Date: Mon, 30 Sep 2024 15:42:27 +0800
Message-Id: <1727682185-12664-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
References: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28696.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28696.005
X-TMASE-Result: 10--1.239700-10.000000
X-TMASE-MatchedRID: Sudfee3ORQqjz0nOeth/yUIIxwDaU5mr2I8NUKi360ZGQgIVrmBL5BZa
	DvoiUT/MYrNerzYja9Fh7TJQr1CJcz09o8PhVkSdsOf0cO2IYtes4IQYg+G3CL5/tqn0MloNKJa
	9kszJz6v/0XMJYfpi/dCI+SHeKBba3EiJ/EZdfj7ece0aRiX9Wo5A6wTicMJ0nhD4vcFcha5j8i
	9T/sSpPH242cwruAod6BN0wJ/bhLZ0G/DGh028bPx0ykrbAxjCchr4pBLGIvAH8UzOewTxw78FH
	rw7frluf146W0iUu2uIPZUBJxmPiaqoNk0mVBa9aDCzqDR7DPaCjFOVaqYalZsoi2XrUn/Jn6Kd
	MrRsL14qtq5d3cxkNbLskvV3i7tytvoArXYs6GbZUl4gxTxdXyokahPvsmSOtFh7jGGSDxueTMN
	Tf0RaZmJ67romRY4f9dvzwxfIGMrkL/B5XSScT1LvHqPi046FU8mdcvbI1h2S6jzjuXTm0MTMzI
	CazP4UehYtaVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 07:43:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112562

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- NetBSD Support
- Intel GPU support
- Added warnings when toggling boxes and terminal size is to small
- Fix missing core percentages
- Various fixes for drawing GPU related information
- fix divide 0 error when caculating disk usage percentage
- fix io_graph_speeds parsing
- V1 of Phoenix Night theme
- Fixed missing CPU core temps when too small to show core temp graphs
- Fixed missing IO graphs in IO mode
- fix zero temp
- Fix comments (parsing) in theme files
- Add regex filtering
- Fix typo in file existences check for voltage_now
- Show time in days when remaining battery exceeds an estimation of 24h
- (AMD Gpu) fix pwr_usage not being defined correctly during rsmi collection
- macOS: fix crash if there exists a uid not associated with any user
- Fix rsmi device name buffer size
- Add gruvbox_light theme
- Create man page for btop in Markdown
- Include metadata in binary version output 'btop --version'
- collect: Fix reading of battery power draw on Linux

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/btop/{btop_1.3.2.bb => btop_1.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/btop/{btop_1.3.2.bb => btop_1.4.0.bb} (93%)

diff --git a/meta-oe/recipes-support/btop/btop_1.3.2.bb b/meta-oe/recipes-support/btop/btop_1.4.0.bb
similarity index 93%
rename from meta-oe/recipes-support/btop/btop_1.3.2.bb
rename to meta-oe/recipes-support/btop/btop_1.4.0.bb
index c473bf0a3..adfb2418b 100644
--- a/meta-oe/recipes-support/btop/btop_1.3.2.bb
+++ b/meta-oe/recipes-support/btop/btop_1.4.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SECTION = "console/utils"
 
 SRC_URI = "git://github.com/aristocratos/btop.git;protocol=https;branch=main"
-SRCREV = "fd2a2acdad6fbaad76846cb5e802cf2ae022d670"
+SRCREV = "6c0cedd8912785f0f353af389e72a0ffc69984a2"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1



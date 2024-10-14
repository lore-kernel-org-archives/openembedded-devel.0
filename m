Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DBDFCFC503
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 08:56:03 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.50333.1728896160077214616
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 01:56:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fOzaskBp;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728896161; x=1760432161;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=8FAvZzzjWqT1vBzS3hcFhvJz0IuACZ/gUoDVke/OPyY=;
  b=fOzaskBptCDEsDoIambxQvd3lgTORDbhDmRWcwcOGA6jduZH2wq91cxk
   T+9vX4jsC6na8784mI2eyrKuwRlgxMge8BNvmAdVFLNNX77McPITVlHiP
   fAs9a1pJIJK3TnIKZA/1A9UFDdaDcShSapvzIfqgnl8ncCpDBVSTQrCua
   zDevBl+LPE/AODi5/xCYYCVIwpVRzs2q1CIjqg9DoZ2l+vIjifPXmSYFv
   gXLzsJPLOw+PlDNvokYiPV1YDE1+DzPFdWIv9TusNt+ll5lCwEBY/SrXK
   cjIFkZ/YW50qOU5OzvZviJ8sdOax57s+vJYTLoZotbyNJgyF0h9EP/+T3
   w==;
X-CSE-ConnectionGUID: 7sXylbrhQuyQfRwMrHuMbQ==
X-CSE-MsgGUID: xzLsO+pfQFGQux3yf3eYjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="164671115"
X-IronPort-AV: E=Sophos;i="6.11,202,1725289200"; 
   d="scan'208";a="164671115"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 17:55:58 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9B4B0D29E1
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:55:56 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id E1149D7755
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:55:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 82CAD20071A2A
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:55:55 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2FC7C1A01E9;
	Mon, 14 Oct 2024 16:55:55 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 13/54] python3-aiohappyeyeballs: upgrade 2.4.2 -> 2.4.3
Date: Mon, 14 Oct 2024 16:54:34 +0800
Message-Id: <1728896115-2944-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
References: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28730.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28730.006
X-TMASE-Result: 10--2.073000-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mr2FA7wK9mP9cfyMkN7e89A1Dg
	Qi40AwSj4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat054xHfiujuTbed1vZ
	7s3YIVDKbepuhA18xJLao0Zou4ee+HxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w4X0W
	NfrxesspihDCHMa7QOl0xBBN0959PTGtkp6jmeYPPZcq6ORJAM50gYyWI8xFFL8aU9yMgHF7v5+
	tWvIH6Cvuj0U3MjTcuCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 08:56:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112865

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Rewrite staggered_race to be race safe
- Re-raise runtimeerror when uvloop raises runtimeerror during connect

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...happyeyeballs_2.4.2.bb => python3-aiohappyeyeballs_2.4.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohappyeyeballs_2.4.2.bb => python3-aiohappyeyeballs_2.4.3.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.4.2.bb b/meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.4.3.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.4.2.bb
rename to meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.4.3.bb
index ce2572f95..e06bd7178 100644
--- a/meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.4.3.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/aio-libs/aiohappyeyeballs"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fcf6b249c2641540219a727f35d8d2c2"
 
-SRC_URI[sha256sum] = "4ca893e6c5c1f5bf3888b04cb5a3bee24995398efef6e0b9f747b5e89d84fd74"
+SRC_URI[sha256sum] = "75cf88a15106a5002a8eb1dab212525c00d1f4c0fa96e551c9fbe6f09a621586"
 
 inherit pypi python_poetry_core
 
-- 
2.34.1



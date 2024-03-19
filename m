Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A968C54E60
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 05:46:36 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.8217.1710827195728056563
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 22:46:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YS1Mlpod;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710827195; x=1742363195;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=1pomoZQ2u3j32h7OBxOM3ZioS8U5LH+14H7rkZttGaA=;
  b=YS1MlpoddD7BTbMEkNBFEF/O45BCp4EOkWNZvS/IfJQgK0BMTzUk4g1h
   pqMPWVRRDYGlrjtmKaUA39Cq/cBzcq7hY8lh7+hyzEBwohcy0hqwUSTFY
   lrDLYxPhD8aEDWjhHdS0LKqNueXGS31uFLJhJSeK8eBEZ0Cii7YfNL52O
   /dNuJc4QU8mPCSul27c+zzGWpCXve0EietI6ksrZobSsPVHO1VN/O897u
   ClwoTphQQHR2gaCdpTf5HgAJ/C9Bw2yeOOwTIRyinJBYOtwn25nnYd5rC
   U8Rr+1xFV+WF/zQTBlLEdtlfXwEMtDYAJuEiBXFrAWqICPw8fpAmQfzFA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="152144830"
X-IronPort-AV: E=Sophos;i="6.07,136,1708354800"; 
   d="scan'208";a="152144830"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 14:46:33 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 64CF810A309
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:31 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9F603D65CF
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:30 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 371B622880A
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:30 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D612F1A006B;
	Tue, 19 Mar 2024 13:46:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 22/50] python3-blivetgui: upgrade 2.4.2 -> 2.5.0
Date: Tue, 19 Mar 2024 13:45:11 +0800
Message-Id: <1710827139-30056-22-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
References: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28260.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28260.005
X-TMASE-Result: 10-2.419300-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mr+KgiyLtJrSDGsuYyb68ajE89
	3SeL1XuD4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2RV17CFfZYAB1vZ
	7s3YIVDKa7IVNHJKd7gwxXcerFDp6W2EXohiB6dqeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNZluYBobWQBo+SR/lpHa8F3UhxJ7f0txBH+kvYC0BJW7km/7ZIFQ/03zBSvBxe5oYKu8J
	zR7dSshFfX6qIM6cvG55k3fdPF8ETKgHg/t0KH2U8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 05:46:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109438

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/storaged-project/blivet-gui/releases/tag/2.5.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-blivetgui_2.4.2.bb => python3-blivetgui_2.5.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/python-blivet/{python3-blivetgui_2.4.2.bb => python3-blivetgui_2.5.0.bb} (92%)

diff --git a/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.4.2.bb b/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.5.0.bb
similarity index 92%
rename from meta-python/recipes-extended/python-blivet/python3-blivetgui_2.4.2.bb
rename to meta-python/recipes-extended/python-blivet/python3-blivetgui_2.5.0.bb
index 7c30f5630..124f36c6e 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.4.2.bb
+++ b/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.5.0.bb
@@ -6,7 +6,7 @@ SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/storaged-project/blivet-gui.git;branch=main;protocol=https"
-SRCREV = "9b6a83a7aef546ddacafcc656984c9bbed67a8ec"
+SRCREV = "626b44610a30ad26734dd20642538caab5a9178a"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1



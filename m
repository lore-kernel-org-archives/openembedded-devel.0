Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64103CFC507
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 08:56:24 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.50350.1728896177590258803
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 01:56:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qZeCUK3e;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728896177; x=1760432177;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=qXeHj5oqMdF4UronD7DXD2OTRVs4JSTBYjqrzaZlo0M=;
  b=qZeCUK3ejQ+BiX5EL/tdsm/6xff070+V1gjuOrac9g7mkuU3FJtuOQ7y
   ka/4jK93s6UtxUpJWqZsQVx3IRM7yjVyqbCbEhI+aJcSge7E6UCz7Iv9J
   q77ux2gg6+NOrMPqsh79tB64oxYlP1NtkAwDfDG7fLTL+7V0ZrKXWtaTg
   eGgWRFkwT14Lgvmpa8I0we8qOHEUihF7FOE5N/orrwdp12kF0TBfALkwM
   e0VT46CGP/1U8X6yvPmFjfo+LOj2bC+4+dYC+UXzyIorCvyiMjluKMH1c
   E5vMK2ZBCGCC4DkWIdCu8DsO/JK9DZtLQRSwT4mErFCOd4/dQ/9rBuFew
   A==;
X-CSE-ConnectionGUID: MbnqaJgARdmogy0LK4Tkng==
X-CSE-MsgGUID: YeFrq34xSpiUzhhLnVSryQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="155575571"
X-IronPort-AV: E=Sophos;i="6.11,202,1725289200"; 
   d="scan'208";a="155575571"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 17:56:15 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 68FCACD6DC
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:13 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id AFCE5D50B2
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:12 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 428B220071A00
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:12 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E30161A000A;
	Mon, 14 Oct 2024 16:56:11 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 48/54] python3-yarl: upgrade 1.14.0 -> 1.15.1
Date: Mon, 14 Oct 2024 16:55:09 +0800
Message-Id: <1728896115-2944-48-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
References: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28730.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28730.006
X-TMASE-Result: 10--4.675300-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrSExHL6o3BeBf0yVReoVM7b4z
	fTpGjdba1B/umY5n9DINyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0JwcxlwV9fM+V9jt7U9a
	6zfLFA1bss9r//dw7twYUFsN5WfiFtPmTjXcK+VOeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNcxAi4RI9VWmWtkY/eZnFsw+wr6qxZ4F4xNGHYYUgC8hU1qp+5Wy4/tycu+MLlcZBVoPQ
	w7kQfrU+elWno0FBx0DoWUsJUYP0IByMfv2BEtbU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 08:56:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112900

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Improved performance of calling :py:meth:~yarl.URL.build
- Improved performance of all :class:~yarl.URL methods that create
  new :class:~yarl.URL objects
- Improved performance of :class:~yarl.URL methods that modify the network
  location

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-yarl_1.14.0.bb => python3-yarl_1.15.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-yarl_1.14.0.bb => python3-yarl_1.15.1.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-yarl_1.14.0.bb b/meta-python/recipes-devtools/python/python3-yarl_1.15.1.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-yarl_1.14.0.bb
rename to meta-python/recipes-devtools/python/python3-yarl_1.15.1.bb
index 7c41edc6f..0a15b2e34 100644
--- a/meta-python/recipes-devtools/python/python3-yarl_1.14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-yarl_1.15.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/aio-libs/yarl/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "88c7d9d58aab0724b979ab5617330acb1c7030b79379c8138c1c8c94e121d1b3"
+SRC_URI[sha256sum] = "02e1c9e36528de270c22c06aac6a5a1de8cc870fafefb5e90e5b35cb8985d0b2"
 
 SRC_URI += "file://run-ptest"
 
-- 
2.34.1



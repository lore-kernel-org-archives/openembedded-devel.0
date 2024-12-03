Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2689E69EB5
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 00:16:59 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.8202.1733185014942937146
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Dec 2024 16:16:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HKYrII34;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1733185015; x=1764721015;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=kf2n+vNAc5Ywkys8/4eqboI1hNIssCE70k8y3idyZ2A=;
  b=HKYrII3484kApToS8v1H7xnDSGgEX+gMUmZtI3b2Iaxrw1qiiMW8M+r1
   QijXTw2bm44urlLBikd9UrrrDiWD2XsqJw+A3Pv05i4p81RfrjaGksXXM
   CoCqxbmO3H2zjACnZwCqm8JCr5Uh9Z9RlEzJW3XcSEBjDofPnDbo/th3r
   qvFEWG5QNxocdMaVAFqHrKnylDsvifppleB89I1ITmBFmYn/OvAJ2gn4e
   N0UEVXLdzJBI77NRffITgy92kD4o5G5PpWF1vrSunMhQcnIh7S3M1j5rQ
   ApqJr+dlpKzD41wxHEXeNpGbhqKW1FraNLrNvKNrYSqnJ5PhpCiC2gmHC
   w==;
X-CSE-ConnectionGUID: RgztvS+4Qb62rFilff2WWQ==
X-CSE-MsgGUID: J7Dtr788RFGj9lVCFX0wIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="181550250"
X-IronPort-AV: E=Sophos;i="6.12,203,1728918000"; 
   d="scan'208";a="181550250"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 09:16:53 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id B5AA7E60A5
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:50 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8EA05D4BC2
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:50 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 292C46CB26
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:50 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BD13E1A0003;
	Tue,  3 Dec 2024 08:16:49 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 08/34] libnvme: upgrade 1.11 -> 1.11.1
Date: Tue,  3 Dec 2024 08:16:13 +0800
Message-Id: <1733184999-27041-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
References: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28834.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28834.003
X-TMASE-Result: 10--0.337600-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yRvMKxHA9efNJ4cwIYL6KueU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNuce7gFxhKa2YkAyCbA7KV6B5jk2TXXjFcPJ
	wtFCyaEPi8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFMYDbnW94Sv2eIsAKAIc4mPGE2
	r1nwe2W4SnYIy3K7rVi8pnA28f1o8gsi0bdNgkqmitMPiKwhDdsUztEW97KdmEMc57ev9hOex9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Dec 2024 00:16:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114149

From: Wang Mingyu <wangmy@fujitsu.com>

Bugfix:
 connect-all fails when CONFIG_NVME_TCP_TLS and CONFIG_NVME_HOST_AUTH are not enable

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../libnvme/{libnvme_1.11.bb => libnvme_1.11.1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libnvme/{libnvme_1.11.bb => libnvme_1.11.1.bb} (94%)

diff --git a/meta-oe/recipes-support/libnvme/libnvme_1.11.bb b/meta-oe/recipes-support/libnvme/libnvme_1.11.1.bb
similarity index 94%
rename from meta-oe/recipes-support/libnvme/libnvme_1.11.bb
rename to meta-oe/recipes-support/libnvme/libnvme_1.11.1.bb
index 05336d2a3a..bf66099ddf 100644
--- a/meta-oe/recipes-support/libnvme/libnvme_1.11.bb
+++ b/meta-oe/recipes-support/libnvme/libnvme_1.11.1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://ccan/licenses/CC0;md5=c17af43b05840255a6fedc5eda9d56cc \
                     file://ccan/licenses/BSD-MIT;md5=838c366f69b72c5df05c96dff79b35f2"
 DEPENDS = "json-c"
-SRCREV = "2b3cb1746451f58583408a25857ca897d18cd4ca"
+SRCREV = "cec9feaeb03da8046d14bb395f592c601cf2ae5f"
 
 SRC_URI = "git://github.com/linux-nvme/libnvme;protocol=https;branch=master"
 
-- 
2.34.1



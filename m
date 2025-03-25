Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A58EC369A0
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 09:02:30 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.61532.1742893341583636729
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Mar 2025 02:02:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=iE1gozKQ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742893342; x=1774429342;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=8CVLu6M0XXidgCtznpMl/uYYdHXufj6nlByDcAltvcg=;
  b=iE1gozKQYO8jHQohX8GYRxpPes1kdNq0K9rRMrSDUdv97omQ79sZS3ye
   0Ov2PDqFvn70bATusbvRk07MPUVy7uqVl/pkstURiJatqkNgjSgSoYqpa
   ar9P8zw+M782vUIBv8g8fihs3yzBcHxEItaDYaBBwKFTSJ7HmXwtwGOwa
   +1yom6M6J54d92CMjtnfOeMTNNkU2D7j0Sh7H4WJgM80CtLfwbFapEvlO
   /ljrIg8umAMiVhgBwWzJgCJAXImFLrph2M0QkM45aFqDylN0X8QBV8qHn
   8Tq16RxMgWE8no/BnoKb2AIAfMwXbOV9ufvcXVntB9wW4mqqFPKEzaycS
   A==;
X-CSE-ConnectionGUID: RHOiysS6Q5W5eEOtQTUS+Q==
X-CSE-MsgGUID: qO6xPvLFRxyNR4ZK1W057g==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="194166798"
X-IronPort-AV: E=Sophos;i="6.14,274,1736780400"; 
   d="scan'208";a="194166798"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 18:02:20 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1DB3FBB186
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:17 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id CE027D50BA
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:16 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8F1141A00A2;
	Tue, 25 Mar 2025 17:02:16 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 26/45] python3-grpcio-channelz: upgrade 1.70.0 -> 1.71.0
Date: Tue, 25 Mar 2025 17:01:33 +0800
Message-Id: <1742893312-3809-26-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
References: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 09:02:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116252

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...cio-channelz_1.70.0.bb => python3-grpcio-channelz_1.71.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-channelz_1.70.0.bb => python3-grpcio-channelz_1.71.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.70.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.71.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-grpcio-channelz_1.70.0.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-channelz_1.71.0.bb
index 225048250e..a103867ab0 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.70.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.71.0.bb
@@ -11,7 +11,7 @@ DEPENDS += "python3-grpcio"
 PYPI_PACKAGE = "grpcio_channelz"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI[sha256sum] = "79334e27f6d9bfbfc536adfa2a4108a1ac048a4d052158f1cc1df6cc359e748a"
+SRC_URI[sha256sum] = "2f6b661dee6b43ff76f38fd4fa17949f3847ea82e515d6e6f21f4fcfe046ecf2"
 
 RDEPENDS:${PN} = "python3-grpcio"
 
-- 
2.43.0



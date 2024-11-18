Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BC88D44011
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 09:30:16 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.37262.1731922208496625584
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Nov 2024 01:30:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cOJH3s68;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731922209; x=1763458209;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=CFh1Q68LlUk6gi6ptXVMluMifnkTdvOAJSXfnuznQZo=;
  b=cOJH3s682Jb7vmMXZcq4wVCU0nQlcDj4i0n2T6foJpwxwOO0m++H7Gux
   71tpy6V1nPq9uEMBJZpDZOyZl7kokXUbbxqwCdsU3PvlswTs8jvde3xLI
   vHGb921RHivTf9k00MeKMmxNyUrpenra1hPTSANwFBSFia4lWiQtnGjrk
   VzcP3L9yNMS+W22dZgRhAGhry2SMEqArB16VCzeaPcgLx3EnNT5ZZlZl4
   96qYqQdvPoSnySNHLGKjg8ofRCQ2PnxrN/H2Tqw59bXDbAAArXTYF9jVd
   FcLZBt0UQSouds89oKPdW60p3byhO1Y2A1BjpbEwC+aENOh8c4Q/Wb+mT
   A==;
X-CSE-ConnectionGUID: N/zMKOp4SluvAKid6KqULw==
X-CSE-MsgGUID: e/22qCKnSC6aE2vtkC7l8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="180826429"
X-IronPort-AV: E=Sophos;i="6.12,163,1728918000"; 
   d="scan'208";a="180826429"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 18:30:07 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 10E23D4C2B
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:05 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9F7E6D8BAD
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:04 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2631821FD4B
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:04 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C9CBD1A000B;
	Mon, 18 Nov 2024 17:30:03 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/32] hwdata: upgrade 0.388 -> 0.389
Date: Mon, 18 Nov 2024 17:29:27 +0800
Message-Id: <1731922195-5266-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731922195-5266-1-git-send-email-wangmy@fujitsu.com>
References: <1731922195-5266-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28804.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28804.006
X-TMASE-Result: 10-0.501200-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yQPZZctd3P4Bchr4pBLGIvAH8UzOewTxw+z9
	H+EUMUMlIvrftAIhWmIOYgThO+DmX+DLvvVL3eB4tw+xHnsmQjMQhNjZQYyI3LRPJs/q8vyUrBh
	yv2DtHP/i8zVgXoAltr8hWd4lAsFlC24oEZ6SpSmcfuxsiY4QFNdYmsqKYM+Jrf07h1eVWm4JaJ
	OpjFFD0L8E9GuDSd02IhflbUa2vo3gwPs68jx7QU9dDv2sfwS31PYTvDhzZE3GhyJmGEyytux9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 09:30:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113870

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/hwdata/{hwdata_0.388.bb => hwdata_0.389.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/hwdata/{hwdata_0.388.bb => hwdata_0.389.bb} (91%)

diff --git a/meta-oe/recipes-support/hwdata/hwdata_0.388.bb b/meta-oe/recipes-support/hwdata/hwdata_0.389.bb
similarity index 91%
rename from meta-oe/recipes-support/hwdata/hwdata_0.388.bb
rename to meta-oe/recipes-support/hwdata/hwdata_0.389.bb
index 63fcfb22b..7479813f7 100644
--- a/meta-oe/recipes-support/hwdata/hwdata_0.388.bb
+++ b/meta-oe/recipes-support/hwdata/hwdata_0.389.bb
@@ -5,7 +5,7 @@ SECTION = "System/Base"
 LICENSE = "GPL-2.0-or-later | XFree86-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
-SRCREV = "f25185c1814901bf85383693e0dd73bf1d8fe1a1"
+SRCREV = "5313a12eb992a354c17fc895c1d69c8c42b09a06"
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.34.1



Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB785E77196
	for <webhook@archiver.kernel.org>; Mon, 30 Dec 2024 07:30:49 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.58737.1735543844307724593
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Dec 2024 23:30:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=msSzga2I;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735543844; x=1767079844;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=tUxXoexf4IG+jkRqUuivUIHpSHvYS7qdA86azuEkZJ0=;
  b=msSzga2IoMmz7q1qHPQjqQEh9jBnNLTeIiD7372WKeWl+RzJotBvw6X9
   YlM01590CR4/xKqVR+YAZpVIdu/5HUb+LK5Fjx+0vP+0qnn1lLkg4kRVN
   nZmZamMbcx28f5hWD9JgZELKsvXLVPnw9+S6nf+ExVSkugVVxhyliyI/1
   NIKxRrDpNnFkrW9eeinNZGu218knxqNi6N7hrw5xlv8Roew/Ya+KfKr5Y
   xD8OJk8S/vqTFcikghCLVD+NAyY0zRMH98Zo7I1tse1SWkpXaIJFMiQPO
   FAetSRYIPCfz7LcoLl5Zvf61o+53Hbqk5/4L+0IdAOkjqReuRVncOrtbg
   w==;
X-CSE-ConnectionGUID: 1qg7H9NGT6ONErhAQaPSEA==
X-CSE-MsgGUID: 1/LcBjOXSMKg4qPoVHJw8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="184471575"
X-IronPort-AV: E=Sophos;i="6.12,275,1728918000"; 
   d="scan'208";a="184471575"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 16:30:42 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 31FC0DBB80
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 16:30:40 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 07A9CD753E
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 16:30:40 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id A004020074EB1
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 16:30:39 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4AE111A0003;
	Mon, 30 Dec 2024 15:30:39 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/18] doxygen: upgrade 1.12.0 -> 1.13.0
Date: Mon, 30 Dec 2024 15:30:20 +0800
Message-Id: <1735543836-2512-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735543836-2512-1-git-send-email-wangmy@fujitsu.com>
References: <1735543836-2512-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28890.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28890.005
X-TMASE-Result: 10-0.085200-10.000000
X-TMASE-MatchedRID: V7gFd1X8+4Wjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmLHBvqhRdA8sjcpdZ3fQiLdFEUknJ/kEl5q8/xv2Um1avoLR4+zsDTtB00
	/kkeBTwAtZ1u2YJ3nkF2P/YSfEjw/lQJ06ZwMaYghRbf+9/E7LQO8+u1Nhks4LwPdT31MsnyY0A
	A1DqDDGER8s2TkNqCqVXUzueSsIIDyDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgAQ4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 07:30:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114581

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../doxygen/{doxygen_1.12.0.bb => doxygen_1.13.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/doxygen/{doxygen_1.12.0.bb => doxygen_1.13.0.bb} (92%)

diff --git a/meta-oe/recipes-devtools/doxygen/doxygen_1.12.0.bb b/meta-oe/recipes-devtools/doxygen/doxygen_1.13.0.bb
similarity index 92%
rename from meta-oe/recipes-devtools/doxygen/doxygen_1.12.0.bb
rename to meta-oe/recipes-devtools/doxygen/doxygen_1.13.0.bb
index 11ea116afc..81cae42fd6 100644
--- a/meta-oe/recipes-devtools/doxygen/doxygen_1.12.0.bb
+++ b/meta-oe/recipes-devtools/doxygen/doxygen_1.13.0.bb
@@ -10,7 +10,7 @@ SRC_URI = "\
     git://github.com/doxygen/doxygen.git;branch=master;protocol=https \
 "
 
-SRCREV = "c73f5d30f9e8b1df5ba15a1d064ff2067cbb8267"
+SRCREV = "3fc9e7f98b8d1156ec627cd3ee6f23984bf4e1b1"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0



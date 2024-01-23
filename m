Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3544C46CD2
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 01:17:24 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.904.1705972642778250510
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jan 2024 17:17:23 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="146937575"
X-IronPort-AV: E=Sophos;i="6.05,212,1701097200"; 
   d="scan'208";a="146937575"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 10:17:21 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7160AA3124
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:17:18 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id AFAF412698
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:17:17 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3C1CF2007B706
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:17:17 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D9FBF1A006A;
	Tue, 23 Jan 2024 09:17:16 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libyang: upgrade 2.1.128 -> 2.1.148
Date: Tue, 23 Jan 2024 09:15:23 +0800
Message-Id: <1705972523-25012-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28136.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28136.003
X-TMASE-Result: 10--1.308600-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZaDCzqDR7DPZr2qJoNIuCjZm3OIVSf4P5Ksm
	10TThDCLtAdDE/EtBJIAy6p60ZV62To3UJuRLIoTdB/CxWTRRu+rAZ8KTspSzYWSrI1gUsqlNC7
	q6OMJN8YRM1XPutljOg2ZQht63S0SOiUQCj38WBdGocUcKK8qp9Qdd/FHzaysbngbaOWSHvtDDL
	w16A7mpiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 01:17:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108392

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libyang/{libyang_2.1.128.bb => libyang_2.1.148.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/libyang/{libyang_2.1.128.bb => libyang_2.1.148.bb} (96%)

diff --git a/meta-oe/recipes-extended/libyang/libyang_2.1.128.bb b/meta-oe/recipes-extended/libyang/libyang_2.1.148.bb
similarity index 96%
rename from meta-oe/recipes-extended/libyang/libyang_2.1.128.bb
rename to meta-oe/recipes-extended/libyang/libyang_2.1.148.bb
index 55dbb8202..0eff3247c 100644
--- a/meta-oe/recipes-extended/libyang/libyang_2.1.128.bb
+++ b/meta-oe/recipes-extended/libyang/libyang_2.1.148.bb
@@ -6,7 +6,7 @@ LICENSE = "BSD-3-Clause"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f3916d7d8d42a6508d0ea418cfff10ad"
 
-SRCREV = "7e5ea21030fe6632b6faad30c0de8d9669503773"
+SRCREV = "fc4dbd923e044006c93df020590a1e5a8656c09e"
 
 SRC_URI = "git://github.com/CESNET/libyang.git;branch=master;protocol=https \
            file://0001-test_context-skip-test-case-test_searchdirs.patch \
-- 
2.34.1



Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8659C25B7B
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 09:10:40 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.10790.1715677837424028993
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 May 2024 02:10:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bTamjrX3;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1715677837; x=1747213837;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Wmh9w7rvSAYVHPV6NzzF9oU7EERK64CkzBSHNyteLI0=;
  b=bTamjrX3vI2JHSwk0JTssQNimh4uJa9A4uwt0qjx10WxEHv6hcxhbvMa
   bYDP7h/XyQi1TTScTr2rbcrs++ztkT7Z7xMlkO6gk9KFupza1Xthm9NRQ
   vIH5qgS6p3kypP17fH3szxKa+OaZeYc4XmmCzoDoJmlZAgNa7yIh7qs3f
   SbMPjGQ2XIa2HBa927bRZHJxAvpLlHfrZsrJVPyvNm6CpXsynANHq7xv6
   cECzRAsL8H9IuCrQmeulsm7YaxFCOsUqXDIWmUXlAqHO4itgPLomDIuyW
   iSooVRXObEekYhcmHvveRHHJYeGDZu1VQ4ZxbBVQs/RB5TdtIXsNJjqd+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="146230425"
X-IronPort-AV: E=Sophos;i="6.08,159,1712588400"; 
   d="scan'208";a="146230425"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 18:10:35 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7045AD63C7
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:33 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9F80ED9469
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:32 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3DEC620076D15
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:32 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DEE851A000B;
	Tue, 14 May 2024 17:10:31 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 22/44] python3-gmqtt: upgrade 0.6.14 -> 0.6.16
Date: Tue, 14 May 2024 17:09:55 +0800
Message-Id: <1715677817-2223-22-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
References: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28384.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28384.006
X-TMASE-Result: 10-0.935500-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrPYWAASIMdr82/UwdvFG5Itnq
	JQncEKKr4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat054xHfiujuTbed1vZ
	7s3YIVDJ6eUBjjG/BIC5rYfHE0OO95UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO19R4
	Ss0oUmJ+iFN32LlQNMZi3JDLJ/qEodPm5O/e/tzYPsWvjIxg5AYnQfRPgJ1UTqmOSxqV6k9lewA
	EuZ0FyTAuIp1kn3oS17Va/UOrUG5/IMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 09:10:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110369

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Make some acknowledgment logs debug level

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-gmqtt_0.6.14.bb => python3-gmqtt_0.6.16.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gmqtt_0.6.14.bb => python3-gmqtt_0.6.16.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-gmqtt_0.6.14.bb b/meta-python/recipes-devtools/python/python3-gmqtt_0.6.16.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-gmqtt_0.6.14.bb
rename to meta-python/recipes-devtools/python/python3-gmqtt_0.6.16.bb
index 5d8a3ba51..20cdee80f 100644
--- a/meta-python/recipes-devtools/python/python3-gmqtt_0.6.14.bb
+++ b/meta-python/recipes-devtools/python/python3-gmqtt_0.6.16.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/wialon/gmqtt"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=903f1792621a3b35ee546da75d139177"
 
-SRC_URI[sha256sum] = "45b0f7794247455b9163155eeedf41c86e303c72b79056bf65d33038b17443a3"
+SRC_URI[sha256sum] = "ddd1fdc1c6ae604e74377cf70e99f067e579c03c1c71a6acd494e199e93b7fa4"
 
 inherit pypi setuptools3
 
-- 
2.34.1



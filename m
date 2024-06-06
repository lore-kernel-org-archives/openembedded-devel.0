Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FE48C27C6F
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 09:07:11 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.9755.1717664829082033342
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jun 2024 02:07:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fE8e7x9z;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1717664828; x=1749200828;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=8vARPMJV9EB7reG6FUqVFPfbvC9pIx5FM6ZtgL5SPd8=;
  b=fE8e7x9zQLtDUDuI6posIVDoczU2znl6/C3W6VlSpjx31HqW/0O5bryS
   nmRugYrtZu+I6E1WX3na2+OE6qR1Q1h3WQA6EX25BjBaM3FGSsETA3HYG
   H+Ft9flH1kjOfkapB8azoP6Uwzg5wT0g2g5p8bFpUcVqbRcVlSr1ZKTBy
   cMg1c80cUMHPqWvjtKJnPkkm1q+yUZf+hNNI68z3qKc5zfa9SXMYRSNXz
   m/vAD31n5RZDzq6Hj7//vMwaLO7uZrd535H8DggxoZlQar2IFgDSO/YAH
   MGXMsq5OlsQU8+buA05UMw7k4pzcjQ/sUN8LKOo1DMo51fwQ7e+98o0QB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="141040312"
X-IronPort-AV: E=Sophos;i="6.08,218,1712588400"; 
   d="scan'208";a="141040312"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 18:07:06 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 23EF5D29E6
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:07:05 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 721FFBF3D9
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:07:04 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 06FCE20081323
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:07:04 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A8C571A000A;
	Thu,  6 Jun 2024 17:07:03 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 29/36] monit: upgrade 5.33.0 -> 5.34.0
Date: Thu,  6 Jun 2024 17:06:28 +0800
Message-Id: <1717664795-13902-29-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
References: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28434.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28434.006
X-TMASE-Result: 10--2.307800-10.000000
X-TMASE-MatchedRID: V7gFd1X8+4Wjz0nOeth/yQPZZctd3P4Bchr4pBLGIvAH8UzOewTxw+z9
	H+EUMUMlIvrftAIhWmK1HBmfgmqIV5cFdomgH0lnFEUknJ/kEl6YwzE9E8g5OfoLR4+zsDTtF/a
	6QWbgQ22Whj5Ut2H7tHBCF0npS2AOl5wbC1B9+s5j4RseNTnU1UqPso9A5wxghXLEjr7GVoyqUG
	hGeAdLCqjCcXp6u/LElz7ots9BEdryDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgAQ4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Jun 2024 09:07:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110737

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/monit/{monit_5.33.0.bb => monit_5.34.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/monit/{monit_5.33.0.bb => monit_5.34.0.bb} (94%)

diff --git a/meta-oe/recipes-support/monit/monit_5.33.0.bb b/meta-oe/recipes-support/monit/monit_5.34.0.bb
similarity index 94%
rename from meta-oe/recipes-support/monit/monit_5.33.0.bb
rename to meta-oe/recipes-support/monit/monit_5.34.0.bb
index 9d7b35838..7c3869789 100644
--- a/meta-oe/recipes-support/monit/monit_5.33.0.bb
+++ b/meta-oe/recipes-support/monit/monit_5.34.0.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
 	file://monitrc \
 "
 
-SRC_URI[sha256sum] = "1ace889c0183473a9d70160df6533bb6e1338dc1354f5928507803e1e2a863b5"
+SRC_URI[sha256sum] = "37f514cd8973bbce104cb8517ff3fc504052a083703eee0d0e873db26b919820"
 
 DEPENDS = "zlib bison-native libnsl2 flex-native openssl virtual/crypt"
 
-- 
2.34.1



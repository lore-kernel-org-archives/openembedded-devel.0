Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09F61C5475B
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 08:44:58 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.7763.1709714694325658050
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Mar 2024 00:44:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=EhU5aN6O;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709714695; x=1741250695;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=GgyeOEvmIS/nTSeZA/x4JbYIwJU0kktjbReEZrQ8AqQ=;
  b=EhU5aN6Od8dqaDqvrONZcE5ft7LJNH2qG7OLWH2xb7AUvkZjZOIRTE5l
   TBI9tGriNrpcAcTJ9jfRY8Nw6dizJFJhtFv5IV17GamlQQP03s4a0AbQM
   dqsbGCNusu9g0bKrKIr3QF/1P0RrJNXTYJiYW2xyRs06lYySPqx+lVlUl
   60rjGbRCMl0vL/DGxZVHFJrLWJJAzi7gAtek0EFSFVBBX3+L2YgDTIgy3
   KRHZtAdEe6fEvdmtTnE2+lgn9iWvATOv+P/PBd9Wqw/3UC+VMm/xxvQGE
   vgAzHsY1ZTLMKOd/2LHx92ftt4X0WHZnoTB09QAF3Y7261WQc1AZvF5ny
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="151387354"
X-IronPort-AV: E=Sophos;i="6.06,207,1705330800"; 
   d="scan'208";a="151387354"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 17:44:53 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2877DC6909
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:44:50 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 64004D5603
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:44:49 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id EB2EA41189
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:44:48 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9AB8C1A006A;
	Wed,  6 Mar 2024 16:44:48 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 25/26] smarty: upgrade 4.3.4 -> 4.4.1
Date: Wed,  6 Mar 2024 16:43:27 +0800
Message-Id: <1709714608-19296-25-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709714608-19296-1-git-send-email-wangmy@fujitsu.com>
References: <1709714608-19296-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28234.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28234.006
X-TMASE-Result: 10-2.699500-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrrOCEGIPhtwj5V4X/65Dwb+Mb
	uVzdyYYavAdlz3zxr6aysMXN8ch2JgE4dbnyjMJa/HTKStsDGMLBOVz0Jwcxl7SwC3zqzycUIY6
	e+Xi1ah+xfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSz7cZjxGyb6mZgpW
	neb7pQca15rwwtGLR2Cq6CctCmwQ/PcB2/33Cl3fnjJbZ9USKlCJL/OoAg0GE/EGxFwNMHw5Mep
	1UqNawjiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Mar 2024 08:44:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109165

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fixed internal release-tooling
- Using the '|implode', '|json_encode' and '|substr' modifiers does not generate
 a deprecation warning anymore as they will continue to be supported in v5
- PHP8.3 support
- Incorrect compilation of expressions when escape_html=true

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/smarty/{smarty_4.3.4.bb => smarty_4.4.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/smarty/{smarty_4.3.4.bb => smarty_4.4.1.bb} (94%)

diff --git a/meta-oe/recipes-support/smarty/smarty_4.3.4.bb b/meta-oe/recipes-support/smarty/smarty_4.4.1.bb
similarity index 94%
rename from meta-oe/recipes-support/smarty/smarty_4.3.4.bb
rename to meta-oe/recipes-support/smarty/smarty_4.4.1.bb
index 960d0665d..1caa4cd1b 100644
--- a/meta-oe/recipes-support/smarty/smarty_4.3.4.bb
+++ b/meta-oe/recipes-support/smarty/smarty_4.4.1.bb
@@ -9,7 +9,7 @@ DEPENDS += "php"
 
 SRC_URI = "git://github.com/smarty-php/smarty.git;protocol=https;branch=support/4.3"
 
-SRCREV = "3931d8f54b8f7a4ffab538582d34d4397ba8daa5"
+SRCREV = "f4152e9b814ae2369b6e4935c05e1e0c3654318d"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1



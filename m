Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B13ABC54E5D
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 05:46:36 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.8214.1710827187939866147
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 22:46:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Zmi6g8Ts;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710827187; x=1742363187;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=P9wnnqk/8ObROhkGTiLPsAvJBm1k81/Anw/1CWNgbTw=;
  b=Zmi6g8Tspi0AAVcEtUz0/rWF5Ysuw+YlVXDKOHn261BomIv2Ve9ENxfp
   rY/R2xxP9wlJdkA+CO0R335myETn1D2CJL+QvWMQa4bF5dUKINXI5smQK
   fd8V9iDZp+QAwPhk5NLJ+vm2wQwwc8ZdD5V+0e9Odu62g4AcElMx2e4GW
   q3HiTXGUm4wWs/wNWr7+2DaCFSKJCez8ICPDoFVRWXnRwJqmG1G1MzJKc
   JbRIHFHMG3ohgyt3eeImtmTY/yAZMB8AqR4Y//pH9kTAcM7AZxrUwfY7h
   Su9N/j3y3QYuxjLhZxfkbXgYeF7Xb/wMPBDQRpiXdXvEnDla9P6paqZwe
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="131483919"
X-IronPort-AV: E=Sophos;i="6.07,136,1708354800"; 
   d="scan'208";a="131483919"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 14:46:25 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 57067D3EB4
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:23 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9368F672D9
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:22 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 28C002009325C
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:22 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C6C841A006B;
	Tue, 19 Mar 2024 13:46:21 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 18/50] python3-apiflask: upgrade 2.1.0 -> 2.1.1
Date: Tue, 19 Mar 2024 13:45:07 +0800
Message-Id: <1710827139-30056-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
References: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28260.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28260.005
X-TMASE-Result: 10--5.133000-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrGiQ8GIEGP3/ozDhGeQC9EqF2
	RIEczdLBEFRfkXUcAJlhH0p/D9gem7BAQLqGlKivP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW7v0LMVKXbDRXk48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIfiAqrjYtFiSueN
	GYJD7Ba4ifJU0Ii7Dr9VP4+Ngo/vE1D162u5aH9H7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 05:46:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109435

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Reuse the File, Config field, and file-related validators from flask-marshmallow
-Add support for a --quiet option to the flask spec command
-Fix the flask spec command for validators operating on complex data types

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-apiflask_2.1.0.bb => python3-apiflask_2.1.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-apiflask_2.1.0.bb => python3-apiflask_2.1.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-apiflask_2.1.0.bb b/meta-python/recipes-devtools/python/python3-apiflask_2.1.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-apiflask_2.1.0.bb
rename to meta-python/recipes-devtools/python/python3-apiflask_2.1.1.bb
index 5bffa2291..94f2e37a8 100644
--- a/meta-python/recipes-devtools/python/python3-apiflask_2.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-apiflask_2.1.1.bb
@@ -7,7 +7,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "APIFlask"
 
-SRC_URI[sha256sum] = "e7616d902d446eb9e1c67d1d8a34691b437f9da4fe7a3b4d49c91ba88c85ee2a"
+SRC_URI[sha256sum] = "88db5a539cc155e35d9636d99b434d00ca6c0b23e7c87c8321ec9dc980535366"
 
 RDEPENDS:${PN} += "\
     python3-flask \
-- 
2.34.1



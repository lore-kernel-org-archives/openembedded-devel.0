Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78FE5EDE9B0
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 09:03:43 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.18594.1725959008382244695
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Sep 2024 02:03:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VqDYOMht;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1725959014; x=1757495014;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=PFbMN/qpnn6LllPchMoUw4exXCdCZVXv5UOyZhLo9JY=;
  b=VqDYOMht1n19DKyse4B6iytYND5q2D7xqcOPAl8WAslr1CSo3E2Atyj1
   MAv7FU6A+HxbGNWarZaR9V/HTLlTgqiyln+SWdjHjIUgj0cV2Xpdw1qaT
   EFlLPc9aAXAura1ypchMguI0sV2VrCX0BRr5ycXd3ne1swIATS+4xeWUl
   Dzwtvh2/8bY68byq9ANmol3CofCiKGVwy3EuktDVcpfHHShUCcgqT+Yh6
   CcyVy6jGysvpfKc23+BDVLSKB9KEUWRCwXRs0+HzLSIFSm39CzusKtNZF
   SrfawbVQ+nKFqVjYXHSLru4tUIWFGSguRCpgCFJ+1PcY9S7rjQItaR3xT
   g==;
X-CSE-ConnectionGUID: akcS9gGRRXSHHr54SMMmZQ==
X-CSE-MsgGUID: R8Ey3FvQSrG1FLmbPw56Xg==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="160627413"
X-IronPort-AV: E=Sophos;i="6.10,216,1719846000"; 
   d="scan'208";a="160627413"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 18:03:32 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 961CF16B906
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:30 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id CDAFFD3F07
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 207106BE52
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:29 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C84511A000B;
	Tue, 10 Sep 2024 17:03:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 28/42] python3-pymisp: upgrade 2.4.196 -> 2.4.197
Date: Tue, 10 Sep 2024 17:02:56 +0800
Message-Id: <1725958990-5719-28-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
References: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28654.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28654.006
X-TMASE-Result: 10--1.261200-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrTfK5j0EZbys8DTfVRLTQzJgU
	Ly4zAbFBi8en/jNx6M0Nyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0JwcxlwV9fM+V9jt75wM
	PMqdPNSyBkESMI05d4lzjFhM9hn+YXHEPHmpuRH0URSScn+QSXmVV1G+Ck2l7+gtHj7OwNO1FwN
	IqCPogbW6QG0vCyMklBbhkK25eZSo0Nep/0Ut9yYCt3vVZQuHOLTUHIubmjk2HItlNx78ys5Upf
	9LT/FbcaleQzstpo3a7hOf5SYiRGvIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 09:03:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112213

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  fix: Avoid printing huge log when a request fails

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymisp_2.4.196.bb => python3-pymisp_2.4.197.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.196.bb => python3-pymisp_2.4.197.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.196.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.197.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.196.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.197.bb
index 44640f178..f20716026 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.196.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.197.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/MISP/PyMISP"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
-SRC_URI[sha256sum] = "86620b0b77b51eb5d08dcb2c1705ab0ce36813e35f48a488067266f565005dc9"
+SRC_URI[sha256sum] = "840881779d1762803e9329ae5129a88abb0e6110afb43c9e3e6e3877e5931a6c"
 
 inherit python_poetry_core pypi
 
-- 
2.34.1



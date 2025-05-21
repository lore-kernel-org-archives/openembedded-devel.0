Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7899C54FB3
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 09:00:05 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.6713.1747817996313122889
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 May 2025 02:00:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hDAr9X6w;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747818002; x=1779354002;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=7E6FWhPwtYJJD0rlTiEKyMv05tvHH2Jtq6tRqxh/vJs=;
  b=hDAr9X6wxtt6dBIE+s0/bg/epV50AH6tCg2FgY2EWb81zFUPGml8K5pd
   I0eBaWr+LPx/Fr6ZVbvd2HZYgYG3wEXSlbuvlv0poJx58L7JDNuYEx5ig
   za6zu3HTLZncueAStirTVSY050suqttn7jSi44Uf6xFEVpSRTwKvZxyXH
   12fdm6fuxw3kYE9PWUm8xL4uGcZyFlVDJ4xNTO5YI7w6kSHT/KHIt+IP7
   gG6o86reRl77d4qcdQKY/RCompPONTWe4PDIOrPIDfVgr1xALr5asWL2h
   +/gxZVl7NDllpdm2ORubjOsIP5bRGFw/fN9kxBgZle2JoqKoyObXVmf1j
   Q==;
X-CSE-ConnectionGUID: I3IN2mp/TEKrsYp4izNq1g==
X-CSE-MsgGUID: BdPm3YIXT8OTq/O4niBz+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="188581271"
X-IronPort-AV: E=Sophos;i="6.15,303,1739804400"; 
   d="scan'208";a="188581271"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 18:00:01 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id D6C56D4C44
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:58 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8EFAAD52D2
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:58 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 245D81A0078;
	Wed, 21 May 2025 16:59:58 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 29/43] python3-pyroute2: upgrade 0.9.1 -> 0.9.2
Date: Wed, 21 May 2025 16:59:18 +0800
Message-Id: <1747817972-28874-29-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
References: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 09:00:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117554

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- iproute: basic Darwin support
- nftables: asynchronous API
- plan9: Inode class context manager API
- plan9: support call on read
- code: provide again .epid

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pyroute2_0.9.1.bb => python3-pyroute2_0.9.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyroute2_0.9.1.bb => python3-pyroute2_0.9.2.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-pyroute2_0.9.1.bb b/meta-python/recipes-devtools/python/python3-pyroute2_0.9.2.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-pyroute2_0.9.1.bb
rename to meta-python/recipes-devtools/python/python3-pyroute2_0.9.2.bb
index cd4ab341b3..0b47b1219d 100644
--- a/meta-python/recipes-devtools/python/python3-pyroute2_0.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyroute2_0.9.2.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=dccbff78d7d79ae7e53953d43445c6e6 \
                     file://LICENSE.GPL-2.0-or-later;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://LICENSE.Apache-2.0;md5=34281e312165f843a2b7d1f114fe65ce"
 
-SRC_URI[sha256sum] = "5934612ad87a334a2ab3da97090979b46d713427deebfbd34c586dc60a1fd3d5"
+SRC_URI[sha256sum] = "aea3c0e1b46f48295edb29caaba3ceb6415bdcb975cba3f1489ffcc3198e0ce3"
 
 inherit python_setuptools_build_meta pypi ptest-python-pytest
 
-- 
2.43.0



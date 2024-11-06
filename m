Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A577D29F85
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 06:31:23 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.40131.1730874676482827245
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 22:31:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GaRkINyI;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1730874681; x=1762410681;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=uik7G/jzcA5IOQy/semnIblPhwv+hMPEhvMci0YNRyY=;
  b=GaRkINyI9uTBhd7UmsZ2zCf4zn1jvVXgD2+cRvxWualFbE2WseN2dt+8
   /vKeHcTVHqAgJCTvkpr3R807RKHjEzDyaT/DTzpPXWnuYkNiZntRSQe+q
   Tu8xO/+TfP/luUIUE3jjtm90qyXDmzDXHMxEV+O8/FGogyQ0wQfenBVOT
   IzJegwzuDyG6qagfFy84hlLGtzcf8qmy+fq//Mc/onUEdHEbs4QbbB25a
   9c79WlZp6T3tIj8n/0kBnegaIjIu1kpW1c7U04YHi2v5EUnguxEBdVDUV
   9DaAV72lVwz5UpnNFzjderTT8VYCkO850wZATHQcSLxyejBU+hTQxrYAn
   g==;
X-CSE-ConnectionGUID: xo/sXy8JTlO3Xby1UBn58w==
X-CSE-MsgGUID: Xc/cIltJROOvnQtTEJg6cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="179498420"
X-IronPort-AV: E=Sophos;i="6.11,262,1725289200"; 
   d="scan'208";a="179498420"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 15:31:20 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 05581CA1E1
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:19 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3A400D748C
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:18 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C3A2920071A01
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:17 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 719AE1A000A;
	Wed,  6 Nov 2024 14:31:17 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 22/46] python3-flask-wtf: upgrade 1.2.1 -> 1.2.2
Date: Wed,  6 Nov 2024 14:30:36 +0800
Message-Id: <1730874660-2364-22-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
References: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28778.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28778.005
X-TMASE-Result: 10-5.474100-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mr5MBc083IM4TYtI9v6sY+PgaJ
	tyubfODEX3/ATCt8A7oNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl5GUF3NhJu3iqbs
	+nJ/tFJGBkESMI05d4g1UuEJlsPFUXSJ4c3nT+QeeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNeuPHKr2YX23W8uyBU0v37qFM68dNEj7ARbjuCTB558ThalLV7p31B1/gRif+1xFO7P0j
	WksheLpMflgW8yq9tbctcYxPvf0XVgpWCbva+Mm
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 06:31:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113706

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Move the project to the pallets-eco organization.
- Stop support for Python 3.8. Start support for Python 3.13.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-flask-wtf_1.2.1.bb => python3-flask-wtf_1.2.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-flask-wtf_1.2.1.bb => python3-flask-wtf_1.2.2.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-wtf_1.2.1.bb b/meta-python/recipes-devtools/python/python3-flask-wtf_1.2.2.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-flask-wtf_1.2.1.bb
rename to meta-python/recipes-devtools/python/python3-flask-wtf_1.2.2.bb
index 509be463f..ecdcd23d4 100644
--- a/meta-python/recipes-devtools/python/python3-flask-wtf_1.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-wtf_1.2.2.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Simple integration of Flask and WTForms."
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=d98d089889e14b227732d45dac3aacc4"
 
-SRC_URI[sha256sum] = "8bb269eb9bb46b87e7c8233d7e7debdf1f8b74bf90cc1789988c29b37a97b695"
+SRC_URI[sha256sum] = "79d2ee1e436cf570bccb7d916533fa18757a2f18c290accffab1b9a0b684666b"
 
 PYPI_PACKAGE = "flask_wtf"
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/Flask-WTF"
-- 
2.34.1



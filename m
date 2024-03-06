Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9BE3C54E5C
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 08:44:17 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.7731.1709714653459719454
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Mar 2024 00:44:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=iG2VkAJ0;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709714653; x=1741250653;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=LcuBSUX0ljOQ6nhZXAIwnWgnZ76orNMouvlzYTEl5f0=;
  b=iG2VkAJ0vjYkjKTaQGVW/YSOnj9DGDHXezccbA32d/Lys6Xr0tR7/VLn
   P8uCHEEw7K2Ph11p3LUJ3uW9meErQUngIKOO8nYffWxNs0ScDckHJpWxq
   dKNuCSTFFf23eyHtzV9xPq2B3SfG78JE2jkaxiuzYXoXiAuAIajUTLTLa
   4QFaURlCX2R/uBu849AtJFoABVoyfTuZ4jQUe/kDLq2vwjGgLZmIMYY+0
   A8n6GV/A26tFSjVdQkOSSPiQ4u2TPIpyQNf99ZRyAL7XKUaZcxQ3hRp0f
   MO86qG5HJ2XnNBM4/GAC1tbowOb8OmZlUWqtmniaUZzyRP7PRH/+V2V3u
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="151429236"
X-IronPort-AV: E=Sophos;i="6.06,207,1705330800"; 
   d="scan'208";a="151429236"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 17:44:11 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 27904EB45E
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:44:09 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 57BCECCA78
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:44:08 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id E29B32008FF86
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:44:07 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8F3351A006A;
	Wed,  6 Mar 2024 16:44:07 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 15/26] python3-eventlet: upgrade 0.35.1 -> 0.35.2
Date: Wed,  6 Mar 2024 16:43:17 +0800
Message-Id: <1709714608-19296-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709714608-19296-1-git-send-email-wangmy@fujitsu.com>
References: <1709714608-19296-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28234.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28234.006
X-TMASE-Result: 10--1.193600-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyv2QIAF58kgvJJZ
	ItVQSHqtDJGN6EeAAQr8urUkrmTIErJnubzpMcGEatGCGdi/nWpUENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmifnzmcpBzOru5x7uAXGEprQFA6pSxaDHmgW6bY8SOq3WjxY
	yRBa/qJXcsDK2xBHh7jaPj0W1qn0TGVuWouVipcjXNpCzmiYk+pNRl0UAPJURN2bPkEOyslrc1o
	bdICN4OUSWQ+JH+/DamC0/Nt2q1Fp3ILKzdYUDaUpSWQYdEkcDr2ZlD6rQjgP6/2/nZkihaOgB/
	fz3EXdcVKT0eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Mar 2024 08:44:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109155

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* [fix] Fix tool.setuptools/packages list
* [security] Dnspython 2.6.1 - Address DoS via the Tudoor mechanism (CVE-2023-29483)
* [doc] add asyncio into the doc hub page
* [clean] clean obsolete python 2 code from the ssl module
* [fix] Add get_server_info to db_pool.py
* [fix] wsgi: Handle Timeouts from applications
* [fix] shrinks window before connecting

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-eventlet_0.35.1.bb => python3-eventlet_0.35.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-eventlet_0.35.1.bb => python3-eventlet_0.35.2.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-eventlet_0.35.1.bb b/meta-python/recipes-devtools/python/python3-eventlet_0.35.2.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-eventlet_0.35.1.bb
rename to meta-python/recipes-devtools/python/python3-eventlet_0.35.2.bb
index eb7f76b09..4db2e6fa4 100644
--- a/meta-python/recipes-devtools/python/python3-eventlet_0.35.1.bb
+++ b/meta-python/recipes-devtools/python/python3-eventlet_0.35.2.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=56472ad6de4caf50e05332a34b66e778"
 
-SRC_URI[sha256sum] = "3b2eede94d64538cb894eec50302a881e056ed7e057f0e24fb45b28a19d6b2e8"
+SRC_URI[sha256sum] = "8d1263e20b7f816a046ac60e1d272f9e5bc503f7a34d9adc789f8a85b14fa57d"
 
 inherit pypi setuptools3
 
-- 
2.34.1



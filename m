Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C808C07E8F
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 01:41:39 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.2752.1713318084653750276
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 18:41:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pi+tZl7i;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713318094; x=1744854094;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=r7TmTasXYjXryWPS9fA8VHCWWZW/OiTVKiPHz92s4DI=;
  b=pi+tZl7i8hg8G/3xT7FeIUHhMr3BH4ddSh8PVi5ZPjGdooZQFp/m5S+j
   C5tWnGv0OBkZo5+kkplEPVY1KHMW/J4ZdeUM9YX7qSm248TCfnx0VwYu0
   KJE17S10OD+jMPOG/OOeXkN5yIng9mWj4xLcyfihgtL2npFsCJHcvPjXu
   YfEY0OmtYZRINOTkUdFfMJv5J0IFI8OhnuOx7Eu8t/AaG7MGyy1VH19CL
   IOVcGYwvXqm1E8dgzu3vYXL6IZ3hdwYHGFn+wxi50cxmEFlwnlopGyDNl
   FTC4kLIxUocmvwWOtraQls+1lK4kV/hMUZ+Udla8BoEsP42ZkGzNiJYmN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="155837362"
X-IronPort-AV: E=Sophos;i="6.07,207,1708354800"; 
   d="scan'208";a="155837362"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 10:41:32 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id CE0E1D2A02
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:29 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 05E991531E2
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 90193200932D3
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:28 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3C2861A0002;
	Wed, 17 Apr 2024 09:41:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 22/49] python3-execnet: upgrade 2.0.2 -> 2.1.1
Date: Wed, 17 Apr 2024 09:40:34 +0800
Message-Id: <1713318061-17128-22-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
References: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28326.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28326.004
X-TMASE-Result: 10--1.143600-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrrOCEGIPhtwhhR1Y/uhfqyMhv
	bSbu8/QdVvJ5vkc3ul/KAfnQTo5A0biFauzzzswuIGmn4OlOtCMYR+gKWoGXzpTx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q0TMSg6oABUs1XgGeVUh3WdmyiLZetSf8mfop
	0ytGwvXiq2rl3dzGQ1zr7ahpxSNX3koqFQMYdWRr5qZC1rzyIknnOVpZ6wo5aI9qWCs2CzZNVfx
	2UmPM+/2eYe4mii+Y/n55xDDrTfu/qGxRBUwqmRmW1z9vWl8eZTyZ1y9sjWHZLqPOO5dObQxMzM
	gJrM/hR6Fi1pV3LGbw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 01:41:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110007

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Fixed regression in 2.1.0 where the strconfig argument to load/loads is ignored
-Added main_thread_only execmodel which is derived from the thread execmodel and
 only executes remote_exec calls in the main thread.
-The library is now typed and the typing is exposed to type-checkers.
-Re-exported Gateway, Channel, DumpError and LoadError from execnet. The constructors are private.
-Fixed GatewayBase.join() timeout argument getting ignored.
-Removed support for Python 3.7.
-Added official support for Python 3.12.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-execnet_2.0.2.bb => python3-execnet_2.1.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-execnet_2.0.2.bb => python3-execnet_2.1.1.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-execnet_2.0.2.bb b/meta-python/recipes-devtools/python/python3-execnet_2.1.1.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-execnet_2.0.2.bb
rename to meta-python/recipes-devtools/python/python3-execnet_2.1.1.bb
index 78a15d357..94c1a228e 100644
--- a/meta-python/recipes-devtools/python/python3-execnet_2.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-execnet_2.1.1.bb
@@ -13,7 +13,7 @@ DEPENDS += "\
 
 SRC_URI += "file://run-ptest \
            "
-SRC_URI[sha256sum] = "cc59bc4423742fd71ad227122eb0dd44db51efb3dc4095b45ac9a08c770096af"
+SRC_URI[sha256sum] = "5189b52c6121c24feae288166ab41b32549c7e2348652736540b9e6e7d4e72e3"
 
 inherit ptest pypi python_hatchling
 
-- 
2.34.1



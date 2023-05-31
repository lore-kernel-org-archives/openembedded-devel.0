Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9DABC7EE2F
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 07:40:50 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.8605.1685518841175940890
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 00:40:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="118834791"
X-IronPort-AV: E=Sophos;i="6.00,205,1681138800"; 
   d="scan'208";a="118834791"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 16:40:41 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 281ABDDC66
	for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 16:40:39 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3D946BD9AE
	for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 16:40:38 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id B910D68957;
	Wed, 31 May 2023 16:40:37 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-coverage: upgrade 7.2.6 -> 7.2.7
Date: Wed, 31 May 2023 15:40:07 +0800
Message-Id: <1685518820-20028-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1685518820-20028-1-git-send-email-wangmy@fujitsu.com>
References: <1685518820-20028-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27662.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27662.006
X-TMASE-Result: 10--5.242300-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvRnp8Qx+pp6xZa
	DvoiUT/M1MYKm62iwBsUcIBSRgKXg2HZHUGvnBShQ0Xm0pWWLkrAHwIGoBwm5ZTx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q2dVNZaI2n6/6fsLRmAbkUuKXqmmYTGpxiUg5
	UD6AlF0rF9uGobEuT7gDLqnrRlXrbIDt27MLDp0t0H8LFZNFG7bkV4e2xSge71eur55RdM0R/fH
	xIQBkyIy+oLOqFMdkC3sl8+1abwhWA7bUFBqh2V
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 07:40:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102913

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- Fix: reverted a change from 6.4.3 that helped Cython, but also increased the
  size of data files when using dynamic contexts, as described in the now-fixed
  issue 1586. The problem is now avoided due to a recent change (issue 1538).
- Wheels are now provided for CPython 3.12.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-coverage_7.2.6.bb => python3-coverage_7.2.7.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_7.2.6.bb => python3-coverage_7.2.7.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_7.2.6.bb b/meta-python/recipes-devtools/python/python3-coverage_7.2.7.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-coverage_7.2.6.bb
rename to meta-python/recipes-devtools/python/python3-coverage_7.2.7.bb
index b13384cd2..f625996ba 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_7.2.6.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_7.2.7.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "2025f913f2edb0272ef15d00b1f335ff8908c921c8eb2013536fcaf61f5a683d"
+SRC_URI[sha256sum] = "924d94291ca674905fe9481f12294eb11f2d3d3fd1adb20314ba89e94f44ed59"
 
 inherit pypi setuptools3
 
-- 
2.34.1



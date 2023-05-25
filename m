Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84FE3C7EE31
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 06:58:17 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.6214.1684997896249523782
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 23:58:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="97288480"
X-IronPort-AV: E=Sophos;i="6.00,190,1681138800"; 
   d="scan'208";a="97288480"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 15:58:14 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1B2ABE852C
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:58:12 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 52365D9682
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:58:11 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id D0F222008FFB0;
	Thu, 25 May 2023 15:58:10 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-xlsxwriter: upgrade 3.1.0 -> 3.1.1
Date: Thu, 25 May 2023 14:58:01 +0800
Message-Id: <1684997886-2137-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1684997886-2137-1-git-send-email-wangmy@fujitsu.com>
References: <1684997886-2137-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27648.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27648.005
X-TMASE-Result: 10--1.597300-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqxOaDdl7pggvbqT
	orL333BQZ2d8cSqs38wNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl/qzSYnI5VS9npt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFImhK/aV89T/RFcY+P/GKO6Yxw
	ypvRMfi4jEZc9aS7IbHTgGSf5yfD3ZY89Ju0TDq0oXrCNN5h3NPhE5J+2g8b+8/pTL/cKxzex9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 06:58:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102833

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Add support for new Excel dynamic functions added in 2023.
* Added support for adding a color to the 'invert_if_negative' chart option.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-xlsxwriter_3.1.0.bb => python3-xlsxwriter_3.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xlsxwriter_3.1.0.bb => python3-xlsxwriter_3.1.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-xlsxwriter_3.1.0.bb b/meta-python/recipes-devtools/python/python3-xlsxwriter_3.1.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-xlsxwriter_3.1.0.bb
rename to meta-python/recipes-devtools/python/python3-xlsxwriter_3.1.1.bb
index d556e8b6d..ff3a62281 100644
--- a/meta-python/recipes-devtools/python/python3-xlsxwriter_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-xlsxwriter_3.1.1.bb
@@ -16,6 +16,6 @@ RDEPENDS:${PN} += " \
 	python3-io \
 "
 
-SRC_URI[sha256sum] = "02913b50b74c00f165933d5da3e3a02cab4204cb4932722a1b342c5c71034122"
+SRC_URI[sha256sum] = "03459ee76f664470c4c63a8977cab624fb259d0fc1faac64dc9cc6f3cc08f945"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1



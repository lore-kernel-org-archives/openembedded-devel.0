Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ABD2C531DB
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 08:47:07 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.2883.1722934017677000776
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 01:47:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=EjsORsnz;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722934022; x=1754470022;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=87imAE3HXjMR1yOBuHNbtW8G+S36Yy7/HtFOFa4C7KU=;
  b=EjsORsnzkgzRFy1KQI+Pz9fojppyS5McdtTDT+M3diwq66sIW+G2Emwc
   XfZhkqNYcUzHw74tULA03n5L4s5Bcdmj4n5cu+Vb+n7IVrx5avtmO0945
   4qjddiDwIVZqXz9G3/BTa0m/g5RUeg+xbxXPPJCEdOBQNjtbXDrVHLcNb
   vzwpbJJXvlAkPcnSMzESzW43hznOXM9RvoXRbGNb4RgVMZSOBl72BkxsG
   7wV1WY0G99C0wqnzQW3/mCyEXsq31loXsMKZ9uqAwpZY/8c0YDvbLi3Yr
   eQUiVEuqTJtVbR6HhQb97lDBjhHsNjnbDSEdHhcU8klQBis3BCvQQuSds
   w==;
X-CSE-ConnectionGUID: aomXl33bRVuXo8kjoGjLAw==
X-CSE-MsgGUID: 8gY6YHjbRBeOeGVcdkAQWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="169165591"
X-IronPort-AV: E=Sophos;i="6.09,267,1716217200"; 
   d="scan'208";a="169165591"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 17:47:01 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 96446C68E4
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:58 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id E4B52CFBC0
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:57 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 805E220076D12
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:57 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4BC461A000C;
	Tue,  6 Aug 2024 16:46:57 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 36/60] python3-croniter: upgrade 2.0.5 -> 3.0.3
Date: Tue,  6 Aug 2024 16:46:10 +0800
Message-Id: <1722933994-32549-36-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
References: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28578.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28578.006
X-TMASE-Result: 10-1.001800-10.000000
X-TMASE-MatchedRID: uzDfqB7OXkqjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZngIgpj8eDcBpkajQR5gb3mn0m688Eo38Kra
	uXd3MZDVp7XU1MyoMDPPDS1ZKq/i0nz9qzhxrbsrfagWFf3lT6PID3S7BulgrzABr+qH4ynkFIp
	JbjwXxAuYOnqbXxJBJjlSdXE5STOZiW2eA9nSDIFPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWL
	WlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 08:47:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111553

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-croniter_2.0.5.bb => python3-croniter_3.0.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-croniter_2.0.5.bb => python3-croniter_3.0.3.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-croniter_2.0.5.bb b/meta-python/recipes-devtools/python/python3-croniter_3.0.3.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-croniter_2.0.5.bb
rename to meta-python/recipes-devtools/python/python3-croniter_3.0.3.bb
index 01ee04840..b0cda74f4 100644
--- a/meta-python/recipes-devtools/python/python3-croniter_2.0.5.bb
+++ b/meta-python/recipes-devtools/python/python3-croniter_3.0.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b8ee59850b882cbf623188489ea748e2"
 
 PYPI_PACKAGE = "croniter"
 
-SRC_URI[sha256sum] = "f1f8ca0af64212fbe99b1bee125ee5a1b53a9c1b433968d8bca8817b79d237f3"
+SRC_URI[sha256sum] = "34117ec1741f10a7bd0ec3ad7d8f0eb8fa457a2feb9be32e6a2250e158957668"
 
 inherit pypi setuptools3
 
-- 
2.34.1



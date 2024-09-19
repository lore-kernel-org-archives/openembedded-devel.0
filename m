Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70DE1CE8D46
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 03:32:49 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.11284.1726716762802514062
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Sep 2024 20:32:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PBzwxwJY;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1726716764; x=1758252764;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=/77RUCnsa85uvWt6UqP+Bx8eFYMyUhsshk+W09JXObw=;
  b=PBzwxwJYXwBBhTAcbgcPQx8uTKgwBvxrthkU7CDtM/KF1YnM9ouuOJJ/
   Gsm7VlQCqV/BsFBJwqSVRV4eqHXHNkUMNafCUUSoTSl9tteoELR4JpI1T
   1rldN5fRkMOA6LiH75sNucLPXWBAYaPWOWcQyLlC5KulmziYwXdA3iFa6
   njuy7Jp9Bge9tgkDf/1fAcfFQlEF87DsiCjQgehONz+P1WAvLo054zaZw
   WlJKOofShc7aZwuhr1jjSGpfsZZ8KMheGGlDumrhrdk1hBuQkHknvJ2Qf
   08E2OsHmTPWEORMhjSK1CExjxVeSF18TYItxLxaRe22Yg+EIgc24eBwAy
   Q==;
X-CSE-ConnectionGUID: P+PcMCkFTYSSmXgJBP089A==
X-CSE-MsgGUID: W597WrBsTNOuaMzqHy2ztw==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="153125225"
X-IronPort-AV: E=Sophos;i="6.10,240,1719846000"; 
   d="scan'208";a="153125225"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 12:32:38 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 01B1FC68E2
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:36 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 498ABD9681
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:35 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id CB04B20086EB0
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:34 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 70EF41A01E9;
	Thu, 19 Sep 2024 11:32:34 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 18/28] python3-pyproject-api: upgrade 1.7.1 -> 1.7.2
Date: Thu, 19 Sep 2024 11:32:03 +0800
Message-Id: <1726716733-14548-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1726716733-14548-1-git-send-email-wangmy@fujitsu.com>
References: <1726716733-14548-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28672.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28672.004
X-TMASE-Result: 10-1.473700-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yUIIxwDaU5mrVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJorNUVnqixiMOuce7gFxhKa2YkAyCbA7KV5soi2XrUn/J8m+
	hzBStantdY+ZoWiLImydET58jp62SmTMiM6je5dXliVdSnR9S8Z7a30oZa/z8e11gmeBzKYUzFx
	9xLg3IDLLPsfDv5trMVUj4fUeWd3VeMEIZQPIAIDDGD24/TKeRS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 03:32:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112389

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Improve the CI

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-pyproject-api_1.7.1.bb => python3-pyproject-api_1.7.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyproject-api_1.7.1.bb => python3-pyproject-api_1.7.2.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-pyproject-api_1.7.1.bb b/meta-python/recipes-devtools/python/python3-pyproject-api_1.7.2.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-pyproject-api_1.7.1.bb
rename to meta-python/recipes-devtools/python/python3-pyproject-api_1.7.2.bb
index fd9bea480..ee8949add 100644
--- a/meta-python/recipes-devtools/python/python3-pyproject-api_1.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyproject-api_1.7.2.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://pyproject-api.readthedocs.io"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11610a9d8fd95649cf8159be12b98cb7"
 
-SRC_URI[sha256sum] = "7ebc6cd10710f89f4cf2a2731710a98abce37ebff19427116ff2174c9236a827"
+SRC_URI[sha256sum] = "dc5b0e0f6e291a4f22b46e182c9c6d4915c62b1f089b8de1b73f2d06ae453593"
 
 PYPI_PACKAGE = "pyproject_api"
 
-- 
2.34.1



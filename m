Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5BECE77188
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 09:27:30 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.30509.1735032445057522136
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 01:27:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MS/D/0BL;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735032449; x=1766568449;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=2nM0HvPcU9Khy2OH4E683mEqnquJ+Z4u0LfPrR+uH8Q=;
  b=MS/D/0BLx8NkGmdwck2J8UqTqARUggBtdNRrzPWzn/ed1D1lun5JLhJu
   08wdM7k5+TYADQcE6WdBpxlc2aoM81gtOXjmMZrwYotQI9ntXgHSK3y9i
   8phDv51jLlkgWmnF6A4URXE+IDO+MsmuUNFdtTZ2Xcb/+IJHy5rqXfbow
   cv0xqoxj49Nb/mOike7rh7VKfKTzQASzjC2kp1dMc/TyRKwoynxpqDW9y
   oIlpainK6GffnfcOnIkAZVBNDDX9hBEFSCS+GtSpQMLlQSOgOW3Kpi82l
   3aA6glGmDbyyv3um6qGPCmXiuXhO8EH5pWufTfs250dVh7YLFGO1Gfet3
   A==;
X-CSE-ConnectionGUID: y1v5kymGR4O4FXngV7mlsw==
X-CSE-MsgGUID: rg3WKGt7RLmx4h+al+ECGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="163714080"
X-IronPort-AV: E=Sophos;i="6.12,259,1728918000"; 
   d="scan'208";a="163714080"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 18:27:27 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id A33F3D6EA1
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:25 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 78AC2D39ED
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:25 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 051A420071A3A
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:25 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A32761A006C;
	Tue, 24 Dec 2024 17:27:24 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 48/67] python3-pyproject-api: upgrade 1.7.2 -> 1.8.0
Date: Tue, 24 Dec 2024 17:26:42 +0800
Message-Id: <1735032421-13513-48-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
References: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28878.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28878.006
X-TMASE-Result: 10-2.245600-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJorNUVnqixiMOuce7gFxhKa2YkAyCbA7KV1yqn5M9p8suo8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXJYrhiOlrTtoelPrm+xcRefjoeMO1v+iy5egp
	P0/GPCXxEw5/8Lh7VInZGroHVxmW2fvqRcCiHwaWABOHY4s1DbDhQLh6/+l/r+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 09:27:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114522

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 really drop python<3 support

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-pyproject-api_1.7.2.bb => python3-pyproject-api_1.8.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyproject-api_1.7.2.bb => python3-pyproject-api_1.8.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-pyproject-api_1.7.2.bb b/meta-python/recipes-devtools/python/python3-pyproject-api_1.8.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-pyproject-api_1.7.2.bb
rename to meta-python/recipes-devtools/python/python3-pyproject-api_1.8.0.bb
index 13dbd6b600..ddbddbea84 100644
--- a/meta-python/recipes-devtools/python/python3-pyproject-api_1.7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyproject-api_1.8.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://pyproject-api.readthedocs.io"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11610a9d8fd95649cf8159be12b98cb7"
 
-SRC_URI[sha256sum] = "dc5b0e0f6e291a4f22b46e182c9c6d4915c62b1f089b8de1b73f2d06ae453593"
+SRC_URI[sha256sum] = "77b8049f2feb5d33eefcc21b57f1e279636277a8ac8ad6b5871037b243778496"
 
 PYPI_PACKAGE = "pyproject_api"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.43.0



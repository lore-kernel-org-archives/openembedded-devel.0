Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AE7CC46CD2
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 01:56:05 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.1699.1705974958914458076
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jan 2024 17:55:59 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="146419860"
X-IronPort-AV: E=Sophos;i="6.05,212,1701097200"; 
   d="scan'208";a="146419860"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 10:55:57 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 8E98AC14A1
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:55:54 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id B89BAD5602
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:55:48 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 45D656B4C1
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:55:38 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CF1EC1A006A;
	Tue, 23 Jan 2024 09:55:37 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pychromecast: upgrade 13.0.8 -> 13.1.0
Date: Tue, 23 Jan 2024 09:55:06 +0800
Message-Id: <1705974906-26243-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28136.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28136.004
X-TMASE-Result: 10--11.639500-10.000000
X-TMASE-MatchedRID: xNkyGzs1zQGjz0nOeth/yUIIxwDaU5mrOactXQNn35KdzY3Ic3tCtMhm
	fp+W2l0LYBReCvOLjNnUS7DkJnVeMA/ijdWq03SWzmwpmAFt7kVN8rmPQRlvK8ENsgPgjeDhj2g
	Cf0Vp726ndn/LfNMv31NeoZ3iCephTweK12oEGfsD2WXLXdz+AdXLiEcLf+DIsrDwfHQQaK1yp+
	gwY/4LBCL637QCIVpiAH/xyJs7whhFjW2X28b8BjsKXyzHgcEbrixttRG+E/OBbptjxI6rdaPFj
	JEFr+olKE0Je8DR/D6No+PRbWqfRDsAVzN+Ov/s1dO3evnn66BmwOh6EBaNXSeRQTbjpQ5PbmIT
	d1gHKGawx9I84mBaOw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 01:56:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108420

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Increase homeassistant lovelace connect timeout and make it configurable
-Add support for NRK TV and NRK Radio apps
-Change logged precision of volume from 1 to 2
-Create ShakaPlayer Controller
-Add date for removal of deprecated discovery functions
-Mark discover_chromecasts as deprecated
-Update README.rst
-Fix known_hosts for older chromecasts
-Fix SSLContext settings
-Update README.rst to reflect refactoring of cast.device to cast.cast_info
-Fix deprecated call to ssl.SSLContext without specifying protocol 

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-pychromecast_13.0.8.bb => python3-pychromecast_13.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pychromecast_13.0.8.bb => python3-pychromecast_13.1.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_13.0.8.bb b/meta-python/recipes-devtools/python/python3-pychromecast_13.1.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pychromecast_13.0.8.bb
rename to meta-python/recipes-devtools/python/python3-pychromecast_13.1.0.bb
index dff1876c3..feae3174a 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_13.0.8.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_13.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/balloob/pychromecast"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
 
-SRC_URI[sha256sum] = "e4b7523db137f8de05eedcc6154113b68532848629442b448c2334fac966a447"
+SRC_URI[sha256sum] = "08e61a8b54bd2119d3c9ab1ec0136d3d8563aa97e0a3b57841588b9be60c2676"
 
 PYPI_PACKAGE = "PyChromecast"
 
-- 
2.34.1



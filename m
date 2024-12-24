Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 629EAC02185
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 09:27:31 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.30363.1735032444358993975
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 01:27:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fcFi80In;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735032445; x=1766568445;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=5yAInYKUL4w8QC4uc8MpP3tE0AXmQIXTuzMZo00kN4U=;
  b=fcFi80InxoyLuN1I2v9cq1us52PRISi2/8WqqovdTJIdl1ovdTCKruNC
   xFDn9LdahJ3ZYSEqjGpW4Kqam2Kk0bCkcBjaiztHdHl1tuXRhjZh11fPJ
   8ueXxKypKc9+bKHFvyLat3kR6EVgfh9yuDhDeQ7TdPsL6E6KYoqu+xaxV
   gdtAYb2bRw1HG2BRg8bYr7Nb0pjJaduy1D0us7UEhAKPl0GPR14OIXO6Y
   4O+m763PLj04Sieo+aBvTtft58jjFoczeSFgQRw4K18WdCIzbn7+DgMNZ
   pIC/y/LlD41bdzgyjIJo8C2D7tNoEnbck+SvKGLdPa93vDpGTWas22KKp
   w==;
X-CSE-ConnectionGUID: RYP9ZFWbSBe6QeM2J/+jZA==
X-CSE-MsgGUID: nH+Cl1qfRZazgAXQhlC0WQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="184746894"
X-IronPort-AV: E=Sophos;i="6.12,259,1728918000"; 
   d="scan'208";a="184746894"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 18:27:22 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 95DB4D4C2B
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:20 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 66A6ED5B40
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:20 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id EA74220071A3A
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:19 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 938EF1A006C;
	Tue, 24 Dec 2024 17:27:19 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 27/67] python3-google-api-python-client: upgrade 2.135.0 -> 2.136.0
Date: Tue, 24 Dec 2024 17:26:21 +0800
Message-Id: <1735032421-13513-27-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
References: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28878.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28878.006
X-TMASE-Result: 10--1.378900-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4B+INzkPGTt0cH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJorNUVnqixiMOgyKXAUOPYkQQhNjZQYyI3AdVRmAIzhtAo8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXK0KvJLLSMoyHF133VM4U/Gqe83v7tTN8tZHu
	ZG9kNIn3/NWNSukyiy9+PN47m3FopEmzUIaJKv1///bAqxouaRjxgaSA5eEjP+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 09:27:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114500

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...t_2.135.0.bb => python3-google-api-python-client_2.136.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.135.0.bb => python3-google-api-python-client_2.136.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.135.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.136.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.135.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.136.0.bb
index 2b48456031..629f1b9e23 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.135.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.136.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "b552a28123ed95493035698db80e8ed78c9106a8b422e63a175150b9b55b704e"
+SRC_URI[sha256sum] = "161c722c8864e7ed39393e2b7eea76ef4e1c933a6a59f9d7c70409b6635f225d"
 
 inherit pypi setuptools3
 
-- 
2.43.0



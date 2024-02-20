Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A42F5C54791
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 08:55:03 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.9331.1708419298479997520
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Feb 2024 00:54:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rdNaWzhH;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1708419299; x=1739955299;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=gLImwFZLm9dhjwNyL4xbKTqvIBUzVgSm0pCeMortWiE=;
  b=rdNaWzhHxHUDQFXSfVphURSqJD5a51N01bfGvjK3X1hRhDsVmtV1cPEr
   rTvMszIBkoHWSNoKpvIetpacSdJzXHpUhdaz/LjggHsHkC+DHCFE3J6/P
   W//nIR7Rc2o8x7UnOV2EN8NpPoPkYcQPYv0paqD3BcP/+3pYnrJ3iuWRj
   fIRNb9VPdVfn7fnmMcML/qOZ+QtmypeROlrDaqiU+JCWKpICCNqjH23zY
   4Y9zIr0uTioN7ANwhYxwvLYhr7cyuKUQa4zE2R8Lf8gaOzUohvsM2fn6G
   XjWrZY/2yFSZ3YHgGEkHj5yj9w8nlxNQKNj86MF7Ae7JbesdprmaKwn1q
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="149742986"
X-IronPort-AV: E=Sophos;i="6.06,172,1705330800"; 
   d="scan'208";a="149742986"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 17:54:56 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id D9E902E8B80
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:53 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 258F2F314C
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:53 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id A278F200A7CFE
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:52 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 51D161A006B;
	Tue, 20 Feb 2024 16:54:52 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 08/26] python3-google-auth: upgrade 2.27.0 -> 2.28.0
Date: Tue, 20 Feb 2024 16:54:23 +0800
Message-Id: <1708419281-26047-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1708419281-26047-1-git-send-email-wangmy@fujitsu.com>
References: <1708419281-26047-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28202.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28202.006
X-TMASE-Result: 10--4.052800-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrcV3n4J/0zUMyiHqxwIX2MSIG
	mHyXttjuOxmmd++ze7DCmUj96YjOlwSSMyiuqBkeP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW5tMXimGWsZZAYUFsN5WfiFOwTo9ZXISSzdCok3ibXlQX0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqt741/mxzB6IF0XSiiho7m/KTeei35qyIYeAO61mU8oqBzdKj7LQbok8XTP
	edoFxspbdsDxhdJk8W36LafHLaWNZ8jsxjBlXaVHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 08:55:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108928

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Adding universe domain support for downscroped credentials
-Change log level to debug for return_none_for_not_found_error
-Make requests import conditional for gce universe domain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-google-auth_2.27.0.bb => python3-google-auth_2.28.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.27.0.bb => python3-google-auth_2.28.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.27.0.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.28.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.27.0.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.28.0.bb
index 45098e662..468cae5bf 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.27.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.28.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "e863a56ccc2d8efa83df7a80272601e43487fa9a728a376205c86c26aaefa821"
+SRC_URI[sha256sum] = "3cfc1b6e4e64797584fb53fc9bd0b7afa9b7c0dba2004fa7dcc9349e58cc3195"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-asyncio \
-- 
2.34.1



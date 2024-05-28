Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9C32C41513
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 01:50:28 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.12871.1716861020662716707
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 May 2024 18:50:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jKltQss/;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716861020; x=1748397020;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Xt0VvC9NHjKqj6xDxtDdYcbhQfGQgyzZeYdSuMVF2GU=;
  b=jKltQss/SwZW+g3o242KzBKDPn1xfhrQ3rw9Gb3HTtDtIeO3ut5LcQ+Z
   4SuNqzWMBgS71i1sK5V7g90nZMzRnZqdOKYetQybf98qZauKDcRISkJqE
   3MYF5/rf94FJpiUwFrVBoNcgNM6+HwFRoglWx4ak7JssrUSPdmf/678fL
   gKWawKzpoxPaj7RfYLn40LurtAZn2LTm/sTmbBDCTfPrtspOBWFDTvyow
   5V6g4QfljU9fbRfYlU4GxYGQEAnucq1fsMhogmThta1fSyv3RmcKuamUu
   pbNFxqkxF7LuhAUpU86zSlIrp0dINKy6oZAp+t+QFlzpt2fUj8k8ghevG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="139576160"
X-IronPort-AV: E=Sophos;i="6.08,194,1712588400"; 
   d="scan'208";a="139576160"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 10:50:18 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 218B7CA1ED
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:50:16 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1323FD73CB
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:50:15 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id A435D2007FADB
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:50:14 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 50CE41A000A;
	Tue, 28 May 2024 09:50:14 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 26/40] python3-regex: upgrade 2024.5.10 -> 2024.5.15
Date: Tue, 28 May 2024 09:48:07 +0800
Message-Id: <1716860901-863-26-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
References: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28414.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28414.004
X-TMASE-Result: 10-1.001800-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/ySrLqyE6Ur/jVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJopGZilTi8ctSOwpfLMeBwRuuLG21Eb4T84Fum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXIhWukUmcQH7lPNtTCvoMSW8F26LR6uS6DZwS
	dNd7CfKbJpG1fMRDoiu0WPkUEmnC2ITOCtswDUSGb5WMX36TDRO0srE4Y3hp/+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 01:50:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110561

From: Wang Mingyu <wangmy@fujitsu.com>

Fix bug:
 hangs with fuzzy and optionals

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-regex_2024.5.10.bb => python3-regex_2024.5.15.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-regex_2024.5.10.bb => python3-regex_2024.5.15.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-regex_2024.5.10.bb b/meta-python/recipes-devtools/python/python3-regex_2024.5.15.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-regex_2024.5.10.bb
rename to meta-python/recipes-devtools/python/python3-regex_2024.5.15.bb
index a1878f9b3..9d356553b 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2024.5.10.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2024.5.15.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7b5751ddd6b643203c31ff873051d069"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "304e7e2418146ae4d0ef0e9ffa28f881f7874b45b4994cc2279b21b6e7ae50c8"
+SRC_URI[sha256sum] = "d3ee02d9e5f482cc8309134a91eeaacbdd2261ba111b0fef3748eeb4913e6a2c"
 
 RDEPENDS:${PN} += " \
 	python3-stringold \
-- 
2.34.1



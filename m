Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70469C3601A
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 09:12:10 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.47782.1743412322116653525
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 02:12:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=E2hPS+XX;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1743412323; x=1774948323;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ZKqvKDNc0bgiDLkcJEAwLrM6oEYuJJRcrV0B54JGOPU=;
  b=E2hPS+XXE5lc6p47UZpgcmVlcgxBXzDG3v+7ttMLoGufuto8V2X5nqVI
   GYMBkVuilOHEp4ALcm3aIJ66A90mKLEuz/yz/nbDXsD6ey5U0tMyyP+ut
   qEWum50IwQuPigfvU6lTa7/KGYLFDr6xGM3G6AFMnAe8/kcA4HfnbUFG9
   a92I4dXlAGcdc+CWbsPXqjvCa8m2Ls5N9a45y8B9RceuoCF/rrV59ATxx
   kOEzfvsq/wsRKt5qz3MtaMNPj0nPjUGgaoEsyMeEjGnsUi05fG2I3DfdQ
   ktfycbpPrX9DKxG4r2v7sAtwPpI/o01TFrb0eQoCkbIem1D+g9WmMLmhg
   Q==;
X-CSE-ConnectionGUID: 81BABT1STYSivdVr13QtwQ==
X-CSE-MsgGUID: RNAtcthqTQ2JFPebRLh0yA==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="173852157"
X-IronPort-AV: E=Sophos;i="6.14,290,1736780400"; 
   d="scan'208";a="173852157"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 18:12:01 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6FC6596749
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 18:11:59 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2E5BF13EF2
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 18:11:59 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E2D741A0078;
	Mon, 31 Mar 2025 17:11:58 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/26] python3-prettytable: upgrade 3.15.1 -> 3.16.0
Date: Mon, 31 Mar 2025 17:11:39 +0800
Message-Id: <1743412308-21887-20-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1743412308-21887-1-git-send-email-wangmy@fujitsu.com>
References: <1743412308-21887-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 09:12:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116415

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-prettytable_3.15.1.bb => python3-prettytable_3.16.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-prettytable_3.15.1.bb => python3-prettytable_3.16.0.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-prettytable_3.15.1.bb b/meta-python/recipes-devtools/python/python3-prettytable_3.16.0.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-prettytable_3.15.1.bb
rename to meta-python/recipes-devtools/python/python3-prettytable_3.16.0.bb
index f5ed6564df..abb13bb890 100644
--- a/meta-python/recipes-devtools/python/python3-prettytable_3.15.1.bb
+++ b/meta-python/recipes-devtools/python/python3-prettytable_3.16.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://code.google.com/p/prettytable"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c9a6829fcd174d9535b46211917c7671"
 
-SRC_URI[sha256sum] = "f0edb38060cb9161b2417939bfd5cd9877da73388fb19d1e8bf7987e8558896e"
+SRC_URI[sha256sum] = "3c64b31719d961bf69c9a7e03d0c1e477320906a98da63952bc6698d6164ff57"
 
 inherit pypi ptest-python-pytest python_hatchling
 
-- 
2.43.0



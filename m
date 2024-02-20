Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BE98C54787
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 08:55:03 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.9333.1708419300914984711
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Feb 2024 00:55:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=lLs1MiB0;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1708419300; x=1739955300;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=7BQ52VoWQemlbY44NDxVbraqYzpU7B4v9I3sfepMp0s=;
  b=lLs1MiB02LdUyV8zEOpNKmzrjVVuOGN1sHZ6PJLaOnOU9lvBggBEMLtf
   XOA5e/WAj1GsGX4BKXryyNjeArsJUiQEYgCDPf/6ZB1tGNb4iixML0l/y
   XWkafUPWUEibIQ1jDfg6BctUuVR+021iVnZiY2CC835BsyBe5cC94DX9/
   rfLYCVg5IkRu+BcizGTAjvvR+c+2tnvbiD+UdWLC2z+finZ+WAsxfU8R7
   yWIOM7TiA14LaO9ndbPzzJeELmKl7OUqBrxStiIhYBiOKK78/1YHj2+mq
   /D6L5RakjrUSgMHuQdIiUj59v65EXtsHVoK6CReBtKXMbZZAK/DS5o7IF
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="150171703"
X-IronPort-AV: E=Sophos;i="6.06,172,1705330800"; 
   d="scan'208";a="150171703"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 17:54:58 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 4BB35D4801
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:56 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 86192D52F5
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0BE2D200A7683
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:55 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AB6AA1A00A0;
	Tue, 20 Feb 2024 16:54:54 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 13/26] python3-polyline: upgrade 2.0.1 -> 2.0.2
Date: Tue, 20 Feb 2024 16:54:28 +0800
Message-Id: <1708419281-26047-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1708419281-26047-1-git-send-email-wangmy@fujitsu.com>
References: <1708419281-26047-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28202.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28202.006
X-TMASE-Result: 10-1.621100-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGEWNbZfbxvwGOwpfLMeBwRuuLG21Eb4T84Fum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXKlG+QxTXnndEc0rKrdmRv7sYy1qR4xpX3l11
	USVvEABxKRE0oBCJ07gf1+oYLw0vcokkkSrty/nDMmjn/bEXasWHZjhM9jlAH+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 08:55:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108934

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-polyline_2.0.1.bb => python3-polyline_2.0.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-polyline_2.0.1.bb => python3-polyline_2.0.2.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-polyline_2.0.1.bb b/meta-python/recipes-devtools/python/python3-polyline_2.0.2.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-polyline_2.0.1.bb
rename to meta-python/recipes-devtools/python/python3-polyline_2.0.2.bb
index 4abe167f7..00cb51be4 100644
--- a/meta-python/recipes-devtools/python/python3-polyline_2.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-polyline_2.0.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/frederickjansen/polyline"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1fb8d1dc685695195bb3c1e48adfef48"
 
-SRC_URI[sha256sum] = "74cb5cea098dddf09d1a5a1f17af9184d371cbf3e9723de0194e530ec39ca1f6"
+SRC_URI[sha256sum] = "10541e759c5fd51f746ee304e9af94744089a4055b6257b293b3afd1df64e369"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.34.1



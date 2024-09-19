Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90032CE8D49
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 03:32:49 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.11432.1726716764600114575
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Sep 2024 20:32:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UD0inVtT;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1726716765; x=1758252765;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=o4qUS7TeS1pXFsZ2Y2wj1TQKktd2dJnhm04vfOa9k9A=;
  b=UD0inVtTA9mRyPfnw+21e9nlhqlDCvyi5mfG1xL5lMWOPnqy5g0EUS5x
   VjhFax+a1c7peA2vhFYS+tueLlC9yIBbNCJsMbXjeFmN+pfi4YF/L2jtU
   lNb/AcR8ccv/nVhOltbpRpU0vY/mO6b8iLQm2EILhuF/HSYYt1ql8VOpJ
   xiCdNC+lGDxjIBrvYl2WC7tc63sczczqzTrWRLoP2jYHjdsDSA/PD3RG0
   3+DrhQflDpXb9MbcFL2C2VRAVFTd+hh8ycV56gb0KsPR0mTEZcdQ5UaM8
   E45QW0owjuYnm8p7M1CNsY2vFtueuU9sxyoP5bRIoqPd/0iy8SmYh99TA
   A==;
X-CSE-ConnectionGUID: /ay0L4CuTiK6YaavWOeYjQ==
X-CSE-MsgGUID: 0HfSX8zeSMWgUR6RguyBDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="153125235"
X-IronPort-AV: E=Sophos;i="6.10,240,1719846000"; 
   d="scan'208";a="153125235"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 12:32:40 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id D48C2C9447
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:37 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1A2B21035A
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:37 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id A441420086EB0
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:36 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 50F191A000A;
	Thu, 19 Sep 2024 11:32:36 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 22/28] python3-robotframework: upgrade 7.0.1 -> 7.1
Date: Thu, 19 Sep 2024 11:32:07 +0800
Message-Id: <1726716733-14548-22-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1726716733-14548-1-git-send-email-wangmy@fujitsu.com>
References: <1726716733-14548-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28672.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28672.004
X-TMASE-Result: 10-0.532500-10.000000
X-TMASE-MatchedRID: uzDfqB7OXkqjz0nOeth/yUIIxwDaU5mrBgA+oehWZhGU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNngIgpj8eDcBpkajQR5gb3lQwtQm7iV5jKra
	uXd3MZDX9avo0zESw3W7DTVGvVIr+pEdvXo4HiarxJy52X4uqvorjkJf5UeVX0LId6iPU/mRtvV
	yM0VozuMkk7RGXieT5X9CdiyufEl+qBBhtzPlTslPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWL
	WlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 03:32:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112390

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/robotframework/robotframework/blob/master/doc/releasenotes/rf-7.1.rst

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-robotframework_7.0.1.bb => python3-robotframework_7.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-robotframework_7.0.1.bb => python3-robotframework_7.1.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-robotframework_7.0.1.bb b/meta-python/recipes-devtools/python/python3-robotframework_7.1.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-robotframework_7.0.1.bb
rename to meta-python/recipes-devtools/python/python3-robotframework_7.1.bb
index 9e81e8e7b..979aba681 100644
--- a/meta-python/recipes-devtools/python/python3-robotframework_7.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-robotframework_7.1.bb
@@ -13,7 +13,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE_EXT = "zip"
 
-SRC_URI[sha256sum] = "58d01b84cd7eccea69f2dbe13cbcbff1299e551168d3b88c25617b0c9d6ddc75"
+SRC_URI[sha256sum] = "34796d387e182b36f05d82f3bbc802bd6a30192ebf1e03c76d2086d0d04faaff"
 
 RDEPENDS:${PN} += " \
     python3-shell \
-- 
2.34.1



Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 688A4CA1019
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 09:04:00 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.8060.1756890231178671326
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 02:03:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XpOsEFk+;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1756890237; x=1788426237;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PmjLQVRYDs9jPBOzeuuPBppQBTSKpw7DE1FNbE2ETPo=;
  b=XpOsEFk+E7A1XlvlRZuxuUGQM4JcxtN2OCTRLZA0eOuiqM1plwdQ++uO
   TrQ92oZ8UxYqHXm562GOxGZaWIJb/noVFKVQ0ZuoaogIaZqktLimfsybD
   llwSbjaE6A+VWtXI32K74NGCyP9PzKRXLBmH2r2pOHNkKWBKypY27YWNY
   0G6Yk9RiCCWRckNk5iahiSHVhC9hdYKCOH7K91EvuX2/DUvOQ6g7hgLgu
   UOrGWOuweoHSyOLjcFxX94fRrtVlJm0kzpDRO0Unh80xYH2ZVjZ39EpPn
   u9zt8mfkxcZawCcbZC8g6MnaNIyOTFKLhllskYf3Ad1y7JCXI5RCcSa+8
   Q==;
X-CSE-ConnectionGUID: f8DhMXqUR6eADzwJDgt46Q==
X-CSE-MsgGUID: aeF2sovBQZeTbuMRwEUmOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="210834805"
X-IronPort-AV: E=Sophos;i="6.18,233,1751209200"; 
   d="scan'208";a="210834805"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.128])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 18:03:57 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 4B4D9820718
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:56 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 0C44F182FD5A
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:56 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTPS id 1F2D714076A1
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:54 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4255A1A007E;
	Wed,  3 Sep 2025 17:03:51 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 44/56] python3-pymysql: upgrade 1.1.1 -> 1.1.2
Date: Wed,  3 Sep 2025 17:03:05 +0800
Message-ID: <20250903090317.2002-44-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250903090317.2002-1-wangmy@fujitsu.com>
References: <20250903090317.2002-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 09:04:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119240

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymysql_1.1.1.bb => python3-pymysql_1.1.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymysql_1.1.1.bb => python3-pymysql_1.1.2.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pymysql_1.1.1.bb b/meta-python/recipes-devtools/python/python3-pymysql_1.1.2.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pymysql_1.1.1.bb
rename to meta-python/recipes-devtools/python/python3-pymysql_1.1.2.bb
index 1c2618c813..183467f5dd 100644
--- a/meta-python/recipes-devtools/python/python3-pymysql_1.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pymysql_1.1.2.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://pymysql.readthedocs.io"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=528175c84163bb800d23ad835c7fa0fc"
 
-SRC_URI[sha256sum] = "e127611aaf2b417403c60bf4dc570124aeb4a57f5f37b8e95ae399a42f904cd0"
+SRC_URI[sha256sum] = "4961d3e165614ae65014e361811a724e2044ad3ea3739de9903ae7c21f539f03"
 
 PYPI_PACKAGE = "pymysql"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.43.0



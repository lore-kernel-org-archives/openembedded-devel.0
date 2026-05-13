Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DAD1CD37B6
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 04:16:38 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.203.1778645796591924550
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 21:16:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WviDw9Wr;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1778645796; x=1810181796;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qzfw6M+Zk9jqqMvSxl1OX9I05oGLissCYk5aAWNS9uE=;
  b=WviDw9Wr70ZzfKuJZ0A15acv00CISvfauLaTA7Lhh/a3espaB9nzPEE5
   w93YiDbuYN2A5+mCoLPzsf2NMUTfG7e5Pz6ogdvbVlQpxZny8W0wJMvo2
   3/JenUNNBxbqTPifXlUDzeBIcYhXE3+GDqvqYkS8I1tbyKOvjii3cXIjV
   lkwlxoHu2UKY+y3gTUPBVVYvaN8BuDwM1AqehJCRi5fOUICx9LAw/XebU
   tvxhAxSIPYUSUh1d5u7M1w8cfCmJQEWtNrsn3uqFT91sknZNIWggT3NGh
   zjx45OFlgBAIqygcanRTtpnoe4O7tnUTqW2OVwHqlguLzdfUDF4hn4BfH
   A==;
X-CSE-ConnectionGUID: GoccY8WZQ9q4rkaSXralbQ==
X-CSE-MsgGUID: +NeFW2/3SO+fz382JLd7Dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="240267049"
X-IronPort-AV: E=Sophos;i="6.23,232,1770562800"; 
   d="scan'208";a="240267049"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:16:35 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id E3A6E82073D
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:16:34 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 9C852861270
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:16:34 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 133D2101905E;
	Wed, 13 May 2026 04:16:31 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 37/56] python3-pymysql: upgrade 1.1.2 -> 1.1.3
Date: Wed, 13 May 2026 12:16:06 +0800
Message-ID: <20260513041626.412-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260513041626.412-1-wangmy@fujitsu.com>
References: <20260513041626.412-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:16:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126923

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fix Cursor.callproc() didn't escape procedure name.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymysql_1.1.2.bb => python3-pymysql_1.1.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymysql_1.1.2.bb => python3-pymysql_1.1.3.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pymysql_1.1.2.bb b/meta-python/recipes-devtools/python/python3-pymysql_1.1.3.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pymysql_1.1.2.bb
rename to meta-python/recipes-devtools/python/python3-pymysql_1.1.3.bb
index 183467f5dd..6239028fe9 100644
--- a/meta-python/recipes-devtools/python/python3-pymysql_1.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pymysql_1.1.3.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://pymysql.readthedocs.io"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=528175c84163bb800d23ad835c7fa0fc"
 
-SRC_URI[sha256sum] = "4961d3e165614ae65014e361811a724e2044ad3ea3739de9903ae7c21f539f03"
+SRC_URI[sha256sum] = "e70ebf2047a4edf6138cf79c68ad418ef620af65900aa585c5e8bfc95044d43a"
 
 PYPI_PACKAGE = "pymysql"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.43.0



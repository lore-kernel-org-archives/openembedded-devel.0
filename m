Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 466F5CD6E45
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 09:49:23 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16954.1779875357575017003
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2026 02:49:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SIy4g9lY;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779875357; x=1811411357;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kHTOJZA+7fNAlZilQcUY3/R50+nBXphagiUoMq/YZgw=;
  b=SIy4g9lY58rk9kqBwU8gOZ4fkDA9gQ5CXRAdkQpbJrtL0RG4GAF1WxLo
   6ES4+6TwcPbH/hXD+wUwgV5qlui8sR4eYpzCLhsp7n8P0BE+3LVTqvU77
   tOoae0NZJDz/lqLkYE84yUHachhaFu2axwwstz6Eny8SiQ8lN8B6+6VBQ
   dHgHaZ5chPoZ0BNvED3xtRTEGEnAQ19LFZjG5jrzqk5eXcdlzTRiAedy1
   ZkFtZ3lNxaFw5LSqKV3zaWOlYzCzdyqve3jvoarT6POQHf36oDAAcVg55
   7RnidXU8WLZ1A5PifqNahbMGP9T7PkcRal/4yYO0z0w/HnLx5O2lKPdmO
   g==;
X-CSE-ConnectionGUID: Rb+3MUMnROewf69rR7J6Fw==
X-CSE-MsgGUID: czfaxJclQkWSaX1u0Sw6vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="230008226"
X-IronPort-AV: E=Sophos;i="6.24,171,1774278000"; 
   d="scan'208";a="230008226"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 18:49:16 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 0E5E8C00541
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:16 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id BA7208319F1
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:15 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id BDE9082A2D8;
	Wed, 27 May 2026 09:49:13 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 35/56] python3-pymysql: upgrade 1.1.3 -> 1.2.0
Date: Wed, 27 May 2026 17:47:44 +0800
Message-ID: <20260527094805.2039-35-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260527094805.2039-1-wangmy@fujitsu.com>
References: <20260527094805.2039-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127242

From: Wang Mingyu <wangmy@fujitsu.com>

Breaking changes
================
- Connection.ping() change the default to not reconnect and deprecate reconnect
  argument. Create a new connection if you want to reconnect.
- Error classes in Cursor class are removed.
- connect() arguments db and passwd now emit DeprecationWarning. Use database
  and password instead.
- Reorganize TLS connection behavior.
- PyMySQL uses TLS by default when server supports it. Use ssl_disabled=True to
  prohibit SSL.
- When ssl_verify_cert=True, ssl_verify_identity=True, an ssl.SSLContext is
  passed, or when any other SSL option is configured, the connection requires
  SSL and raises OperationalError (CR_SSL_CONNECTION_ERROR) if the server doesn't
  support it.

Other changes
==============
- Support MySQL 8 row/column alias syntax in executemany INSERT regex.
- Expose SQLSTATE on MySQL protocol exceptions without changing exception
  formatting.
- Reject non-finite decimal.Decimal query parameters
- Connection.set_charset(charset) now emits DeprecationWarning.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymysql_1.1.3.bb => python3-pymysql_1.2.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymysql_1.1.3.bb => python3-pymysql_1.2.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pymysql_1.1.3.bb b/meta-python/recipes-devtools/python/python3-pymysql_1.2.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pymysql_1.1.3.bb
rename to meta-python/recipes-devtools/python/python3-pymysql_1.2.0.bb
index 6239028fe9..190c80d88f 100644
--- a/meta-python/recipes-devtools/python/python3-pymysql_1.1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pymysql_1.2.0.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://pymysql.readthedocs.io"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=528175c84163bb800d23ad835c7fa0fc"
 
-SRC_URI[sha256sum] = "e70ebf2047a4edf6138cf79c68ad418ef620af65900aa585c5e8bfc95044d43a"
+SRC_URI[sha256sum] = "6c7b17ca686988104d7426c27895b455cdeea3e9d3ceb1270f0c3704fead8c33"
 
 PYPI_PACKAGE = "pymysql"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.43.0



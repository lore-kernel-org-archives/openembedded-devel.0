Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2A43CD37B6
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 04:20:38 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.247.1778646037626010317
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 21:20:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=iZWUTKJ0;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1778646037; x=1810182037;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=96RY9zxz9L7VSXxK2yYHedRbVx7s7jdF6JODJfBRNo8=;
  b=iZWUTKJ0+hwztNpQDARPHrAgDHRAxEXp52HM1vTEj7vTi5waUtoX0sb1
   EYjur5KRck1HbKDstG5cv5jpt0lqMBn0viCDHPo05JdR6WuB6/cX3Putg
   Nq8X0jAaW2cB5WgSZcaiRelL5TiAZ1SVCDj3M83U7PQH5Bq0OtJshJwUT
   VSucSE8OZHp+PplppZkRvZRFdBG9KpBeGMcITxbME3Iz/xUL99bYVMBU8
   Aa+sywo96AcKSiC9q3ajgoWtk55I3xovwRdnw8UdoRaDdasj1JVux+6CJ
   O5/VM7UkMcCXwNVnKn0jMe8L3eIF0v9cXFImD5vUwc30PkWABkQroRSRQ
   g==;
X-CSE-ConnectionGUID: gwyw47j1Rl+vyXQpNqNRLQ==
X-CSE-MsgGUID: nrGQTPqdTFq/Z8Dd1+T0YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="240268003"
X-IronPort-AV: E=Sophos;i="6.23,232,1770562800"; 
   d="scan'208";a="240268003"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:20:36 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 142184071C2
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:20:06 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id B43CF1009E11
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:20:05 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 3AD681400243;
	Wed, 13 May 2026 04:20:02 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 45/56] python3-types-psutil: upgrade 7.2.2.20260408 -> 7.2.2.20260508
Date: Wed, 13 May 2026 12:19:41 +0800
Message-ID: <20260513041952.450-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260513041952.450-1-wangmy@fujitsu.com>
References: <20260513041952.450-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:20:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126935

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...7.2.2.20260408.bb => python3-types-psutil_7.2.2.20260508.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-types-psutil_7.2.2.20260408.bb => python3-types-psutil_7.2.2.20260508.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-types-psutil_7.2.2.20260408.bb b/meta-python/recipes-devtools/python/python3-types-psutil_7.2.2.20260508.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-types-psutil_7.2.2.20260408.bb
rename to meta-python/recipes-devtools/python/python3-types-psutil_7.2.2.20260508.bb
index 88fff6c83d..c36047fe42 100644
--- a/meta-python/recipes-devtools/python/python3-types-psutil_7.2.2.20260408.bb
+++ b/meta-python/recipes-devtools/python/python3-types-psutil_7.2.2.20260508.bb
@@ -8,7 +8,7 @@ UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "e8053450685965b8cd52afb62569073d00ea9967ae78bb45dff5f606847f97f2"
+SRC_URI[sha256sum] = "8cfd8339f5e898570f80486423e65d87558d89d0181bf723d20ac5e778fe218e"
 
 BBCLASSEXTEND = "native"
 
-- 
2.43.0



Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84EBFE75442
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 09:14:40 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.117312.1766567672130729594
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Dec 2025 01:14:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gO4d8wdK;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1766567675; x=1798103675;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aYj0aBDhRvGi1EUEN/xmT8wy0TpggfNApNemGxu+XDM=;
  b=gO4d8wdKxLw1+myEolT2EJjlUuOGxE3zbL9sPM02HLIyxdf9+R8BvNnw
   sDFrIQrUUUNZmbc/lA2xmY5v7kgTKqYaID+hWUZDmAT4ibMfygzRAmVF0
   lViE2MkIxpEY4XvpnYp56rJ9DP1IOZQtlUsNHC4Th+K4+8ETGT8KV4AGQ
   NPfLzwRo1JGeSgxPQbxOM3FaRiwUaEjsj1zg94ByOBadAvRt8Wvyrv8vR
   g8vlr2koZZgNVdjkVxoQirWIRhjA+M2QxiYapYH2yv52VQrzXLMqqeVaS
   e1wtSc2j1jGhH3x8bV0Eb6gIEQBT11YDUhlqpxI/CjOP+ZUnX4eM0GbbZ
   Q==;
X-CSE-ConnectionGUID: iXGZYJVQTl2sxn5CB+8WVQ==
X-CSE-MsgGUID: B2ZgCjirREaR3OyiSvNUBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="223750218"
X-IronPort-AV: E=Sophos;i="6.21,173,1763391600"; 
   d="scan'208";a="223750218"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 18:14:35 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 75C3B1000340
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:14:34 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 27349100086D
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:14:34 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.254])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 72D5220000D9;
	Wed, 24 Dec 2025 09:14:31 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/28] python3-pikepdf: upgrade 10.0.2 -> 10.0.3
Date: Wed, 24 Dec 2025 17:12:57 +0800
Message-ID: <20251224091304.974-21-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251224091304.974-1-wangmy@fujitsu.com>
References: <20251224091304.974-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:14:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122871

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pikepdf_10.0.2.bb => python3-pikepdf_10.0.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pikepdf_10.0.2.bb => python3-pikepdf_10.0.3.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-pikepdf_10.0.2.bb b/meta-python/recipes-devtools/python/python3-pikepdf_10.0.3.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-pikepdf_10.0.2.bb
rename to meta-python/recipes-devtools/python/python3-pikepdf_10.0.3.bb
index 4821e273d8..f047969033 100644
--- a/meta-python/recipes-devtools/python/python3-pikepdf_10.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pikepdf_10.0.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pikepdf/pikepdf"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9741c346eef56131163e13b9db1241b3"
 
-SRC_URI[sha256sum] = "7c85a2526253e35575edb2e28cdc740d004be4b7c5fda954f0e721ee1c423a52"
+SRC_URI[sha256sum] = "ff12a044d79e342eff6bc8b27dfd4c24b395943052169bb43eea4a23a4100e56"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0



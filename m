Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7994BCAC5A4
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 09:42:13 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.15420.1758015723034496813
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Sep 2025 02:42:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=C/aLzck4;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758015729; x=1789551729;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=J2p3k/ebw8/XoVtKXXcPlolWk/OTf3VemR6hxFARHMw=;
  b=C/aLzck4g48H1Arw84T+PmifSSSzAhEaE5YV3EXrrBpQbWaIpWva9LuA
   eoLvw7XdBund/YWUKIzgfV0KhtWhf8Rmig+9jagXnSUI0u2Pc+j0RCd4H
   cEY41BfX119eOtRkVuCYk+xJq/Xu82E6DvtTo6shq6Hj7K4LOPEdVygg4
   D57UV/NYusuOvHP4azLITpTB3l4bizdbwC+A0W78l2zdTsC5wzWmdbtC7
   M/NfiNF8XX8MX/3MW3uL39J5s4AsdGMnLGWu2mLxpoEV1xFgA7JXOVEGb
   kR2/bjlOoGOapxZahtvGihGCL3rrRza/h67IbFwXfUhh6sRUUMUPFoGW/
   w==;
X-CSE-ConnectionGUID: b3uEpY9PSvq4ImTv1H4CBg==
X-CSE-MsgGUID: PaQZhj7cTSOY8DfYuNrH9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="212934958"
X-IronPort-AV: E=Sophos;i="6.18,268,1751209200"; 
   d="scan'208";a="212934958"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 18:42:08 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id D13BB1C00081
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:07 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 917E61000392
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:07 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTPS id 9F79F20012FF;
	Tue, 16 Sep 2025 09:42:05 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 21E4D1A008F;
	Tue, 16 Sep 2025 17:42:02 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/42] python3-executing: upgrade 2.2.0 -> 2.2.1
Date: Tue, 16 Sep 2025 17:41:31 +0800
Message-ID: <20250916094152.1479-21-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250916094152.1479-1-wangmy@fujitsu.com>
References: <20250916094152.1479-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119442

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-executing_2.2.0.bb => python3-executing_2.2.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-executing_2.2.0.bb => python3-executing_2.2.1.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-executing_2.2.0.bb b/meta-python/recipes-devtools/python/python3-executing_2.2.1.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-executing_2.2.0.bb
rename to meta-python/recipes-devtools/python/python3-executing_2.2.1.bb
index 2941f6f0ee..2bac5e8486 100644
--- a/meta-python/recipes-devtools/python/python3-executing_2.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-executing_2.2.1.bb
@@ -6,4 +6,4 @@ DEPENDS = "python3-setuptools-scm-native"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "5d108c028108fe2551d1a7b2e8b713341e2cb4fc0aa7dcf966fa4327a5226755"
+SRC_URI[sha256sum] = "3632cc370565f6648cc328b32435bd120a1e4ebb20c77e3fdde9a13cd1e533c4"
-- 
2.43.0



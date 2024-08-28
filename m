Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E9F2C5479B
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 08:26:02 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.8726.1724833556868318284
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Aug 2024 01:25:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jA/EPvRx;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724833557; x=1756369557;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=6ObHNt1pPCJpbTzO7LmGQwwHPcSS3zOdbOOLl8tiCK8=;
  b=jA/EPvRxAHtKV3u6YnaVA7RZmxONmZgUb2M80j09Sw/NNl1BAKpNB7LZ
   01eYf516f48IYgqyQ44m7m/M+/P2grLHrCWDteJkZw85eaugmmGppOn1y
   0tmDP3LVugHc3PK0HJlbSbEF4QNFjUHkARCukmEoIq5excYSA1j1QXjaG
   6vgb5cJcg0ZKEbERUvJpk5MAZRckS4NrQHxArvfo+sFnsnvs9j643WkpK
   jtP4OHVs6KgUbRTz2f61CiAZR8oAkmtv3gW36pGIx5rQCnR7bVDDhhIiu
   oj80RN77yrr/pxphc5ikBUHoBU+Jp014qQy6SE5kxWEBUg5bfji7zoA7+
   w==;
X-CSE-ConnectionGUID: fpvIf83TQsOrbNKibXmgiw==
X-CSE-MsgGUID: rGHDBTMtRTiCcj6/r7PmWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="173926807"
X-IronPort-AV: E=Sophos;i="6.10,182,1719846000"; 
   d="scan'208";a="173926807"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 17:25:54 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 47416C68E1
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:52 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 880A2D3F0E
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:51 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0CE3B6BCF0
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:51 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A4E521A0002;
	Wed, 28 Aug 2024 16:25:50 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 34/46] python3-pyzstd: upgrade 0.16.0 -> 0.16.1
Date: Wed, 28 Aug 2024 16:25:12 +0800
Message-Id: <1724833525-2162-33-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
References: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28624.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28624.006
X-TMASE-Result: 10-0.854400-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yUIIxwDaU5mrVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJopGZilTi8ctSOwpfLMeBwRt9LQinZ4QefCP/VFuTOXUTPvB
	STRncWKuOhzOa6g8Krd1MVoJaoOSmIM5W4uasKzFGoFZPBfO8wc3TzP9iu3AHVE1+WdKxHmAtIx
	KIlNmDm1e4FTJSkKKav9hHRblZTTaXYxYdL9iigh0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 08:26:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112011

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Compatibility with Python 3.13

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pyzstd_0.16.0.bb => python3-pyzstd_0.16.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyzstd_0.16.0.bb => python3-pyzstd_0.16.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-pyzstd_0.16.0.bb b/meta-python/recipes-devtools/python/python3-pyzstd_0.16.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-pyzstd_0.16.0.bb
rename to meta-python/recipes-devtools/python/python3-pyzstd_0.16.1.bb
index 77459c1c5..a4aae4aca 100644
--- a/meta-python/recipes-devtools/python/python3-pyzstd_0.16.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyzstd_0.16.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=aedb5a2679cd1552fb61c181ef974b9e"
 
 PYPI_PACKAGE = "pyzstd"
 
-SRC_URI[sha256sum] = "fd43a0ae38ae15223fb1057729001829c3336e90f4acf04cf12ebdec33346658"
+SRC_URI[sha256sum] = "ed50c08233878c155c73ab2622e115cd9e46c0f1c2e2ddd76f2e7ca24933f195"
 
 inherit pypi setuptools3
 
-- 
2.34.1



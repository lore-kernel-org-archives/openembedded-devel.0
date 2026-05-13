Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 737DFCD37AC
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 04:11:48 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.145.1778645501621090848
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 21:11:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nC1jkcbD;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1778645502; x=1810181502;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QFYDhqrlGWgVVH+NmZ9RWvxFAQJcfv8KGihDKECiNz4=;
  b=nC1jkcbDCCV6KjHSkW+UZG+TJ9Re7Lml6DRZKanHIuEAClbnZSw2IenG
   MMgWjvzsPNh35CQCLYRIEPL9GcKdI/9y206zi5VRwy1/J8bJzXlPaMd5V
   IS7R2QF791ZXM5VvCKaKOt0pg8ORlmjrL0ZPvKhwAbESn78/1dBrNxNvm
   TUSPV8brHVk05zFvvOlmBJ5m+yBVeHiYniqNKePxwCKU5ILefTIndZYnx
   763NjUonAHJkmUvtEYnp8AbPA8JRIAzgitR2To/rHAoj9yJwXo2rtRLWk
   N5fh/IFJKaS8BNaVwQXzTD+sglWm8F+7jpGdN2/31LloJyip3a1uhBEGu
   g==;
X-CSE-ConnectionGUID: gg06/y+kQ5KR5/SplitmkA==
X-CSE-MsgGUID: qwfrY63/Tv+2bk3XsoBIVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="240257598"
X-IronPort-AV: E=Sophos;i="6.23,232,1770562800"; 
   d="scan'208";a="240257598"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:11:40 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id DAB2A42A325
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:10:39 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 893141C0095E
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:10:39 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 13F751400254;
	Wed, 13 May 2026 04:10:36 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 29/56] python3-jedi: upgrade 0.19.2 -> 0.20.0
Date: Wed, 13 May 2026 12:05:28 +0800
Message-ID: <20260513040555.377-29-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260513040555.377-1-wangmy@fujitsu.com>
References: <20260513040555.377-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:11:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126919

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Python 3.14 support
- Removed support for Python 3.8 and 3.9
- Upgraded Typeshed
- Better support for Final/ClassVar
- __new__ is now also recognized as a signature and TypeVar inference
- Support for Self
- Support for TypeAlias, generics for type[...] and tuple[...]

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-jedi_0.19.2.bb => python3-jedi_0.20.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-jedi_0.19.2.bb => python3-jedi_0.20.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-jedi_0.19.2.bb b/meta-python/recipes-devtools/python/python3-jedi_0.20.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-jedi_0.19.2.bb
rename to meta-python/recipes-devtools/python/python3-jedi_0.20.0.bb
index 1a150c38db..857009948f 100644
--- a/meta-python/recipes-devtools/python/python3-jedi_0.19.2.bb
+++ b/meta-python/recipes-devtools/python/python3-jedi_0.20.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5ed06eebfcb244cd66ebf6cef9c23ab4"
 
 PYPI_PACKAGE = "jedi"
 
-SRC_URI[sha256sum] = "4770dc3de41bde3966b02eb84fbcf557fb33cce26ad23da12c742fb50ecb11f0"
+SRC_URI[sha256sum] = "c3f4ccbd276696f4b19c54618d4fb18f9fc24b0aef02acf704b23f487daa1011"
 
 RDEPENDS:${PN} = " \
 	python3-parso \
-- 
2.43.0



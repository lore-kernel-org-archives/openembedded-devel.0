Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8212210A3D74
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:57:54 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45663.1774526272712580717
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:57:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cC6/kcji;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774526273; x=1806062273;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ti8By9cOZ5E10RCHqUcFLblsJ4bsJOmftzao/jrAwMc=;
  b=cC6/kcjiGs+lUL5IYuWK0tSDB+IlOlUCuEBxXAfzrxJZJeWoL2opDhXV
   9AIKEvd61PZlwZPacXGmj1ZccWpUUywQNDXY6Hfl0CvuaBgRMeiaKe8RG
   bwyC0MzVInK5yZJEbtQVQOFLXzGQO1eyemySFpKd9RpF0sLquVfC7qI1j
   dyXgDIGujhyr3edtZ7DvndHz+H5hTCLMeR0SAc6axRjYYnODBQGNh1H3O
   oeOsB1TxWPpcMn8bLlaPhqLlkAlqVjSIM78RQ2Sa99mdIkQCwJVK4kck6
   kkW1TqOGk5ujacNaDl7gFWTruU6FNZfS18qbORC0KznKWDPNFB2XW+oPD
   w==;
X-CSE-ConnectionGUID: sYykvFjfSKOwTbTBgjAldg==
X-CSE-MsgGUID: rYThl3PeStCOkhdzVtbFlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="234718895"
X-IronPort-AV: E=Sophos;i="6.23,142,1770562800"; 
   d="scan'208";a="234718895"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 20:57:51 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 2B8BB1002B82
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:51 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id D8D0614003C1
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:50 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 79DD81807148;
	Thu, 26 Mar 2026 11:57:48 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 44/63] python3-pikepdf: upgrade 10.3.0 -> 10.5.1
Date: Thu, 26 Mar 2026 19:56:14 +0800
Message-ID: <20260326115634.1199-44-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260326115634.1199-1-wangmy@fujitsu.com>
References: <20260326115634.1199-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125699

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pikepdf_10.3.0.bb => python3-pikepdf_10.5.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pikepdf_10.3.0.bb => python3-pikepdf_10.5.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-pikepdf_10.3.0.bb b/meta-python/recipes-devtools/python/python3-pikepdf_10.5.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-pikepdf_10.3.0.bb
rename to meta-python/recipes-devtools/python/python3-pikepdf_10.5.1.bb
index b633cb9488..289a702e06 100644
--- a/meta-python/recipes-devtools/python/python3-pikepdf_10.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pikepdf_10.5.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pikepdf/pikepdf"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9741c346eef56131163e13b9db1241b3"
 
-SRC_URI[sha256sum] = "e2a64a5f1ebf8c411193126b9eeff7faf5739a40bce7441e579531422469fbb1"
+SRC_URI[sha256sum] = "ffa6c7d0b77deb3af9735e0b0cae177c897431e10d342bb171b62e5527a622b7"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0



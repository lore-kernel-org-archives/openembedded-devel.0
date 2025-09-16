Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7FD4CAC5AC
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 09:42:13 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.15419.1758015722736300041
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Sep 2025 02:42:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=E2fyIwbM;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758015732; x=1789551732;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=J8HaQwfRIyMiUB3vosnFzlRY5lvQHQz6J3MJS3igIrU=;
  b=E2fyIwbMniKE0ty4EOL+7STgX2Ov/O5asM+APZkLYpE1HxRiVbWDy2u+
   XsgcKSU/NIajouxulVKBNNEuyTG514AbVLfSnaRSbjDso/3tlksJGEuso
   gnqOClBZvlnbt+BF/ojm96PBRRZeUbkcN8R8oESt8keqkDPft8ztgOiNZ
   C4PUy24T0qmqBluxi1VtNUrIKwbkCY8S3J2UbnJy0rey2Nc+Boin/dKiO
   NhGl0LHTtENcfuvDa0lZ5FTWVsNQOWElECUj4LQt4JSG8DHOmSbtsYoOm
   ebnj4iaWxsmat4VchbIkQZm89LTntAiXIuO+sLcj7se9dIFzuXaaS6Y/T
   Q==;
X-CSE-ConnectionGUID: F78LbURsQiucrXeg62S4Cg==
X-CSE-MsgGUID: X7j+22hCRw6/3u6gjXahHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="201479441"
X-IronPort-AV: E=Sophos;i="6.18,268,1751209200"; 
   d="scan'208";a="201479441"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 18:42:11 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id B31DD146E
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:11 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 6E5521C0015F
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:11 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTPS id D839E2003495;
	Tue, 16 Sep 2025 09:42:09 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5CCBA1A008B;
	Tue, 16 Sep 2025 17:42:06 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 33/42] python3-trio: upgrade 0.30.0 -> 0.31.0
Date: Tue, 16 Sep 2025 17:41:43 +0800
Message-ID: <20250916094152.1479-33-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250916094152.1479-1-wangmy@fujitsu.com>
References: <20250916094152.1479-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119453

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-trio_0.30.0.bb => python3-trio_0.31.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-trio_0.30.0.bb => python3-trio_0.31.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-trio_0.30.0.bb b/meta-python/recipes-devtools/python/python3-trio_0.31.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-trio_0.30.0.bb
rename to meta-python/recipes-devtools/python/python3-trio_0.31.0.bb
index 2013891074..799f6190c3 100644
--- a/meta-python/recipes-devtools/python/python3-trio_0.30.0.bb
+++ b/meta-python/recipes-devtools/python/python3-trio_0.31.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=447ea202d14d2aee40d8a2c26c865da9 \
                     file://LICENSE.APACHE2;md5=3b83ef96387f14655fc854ddc3c6bd57 \
                     file://LICENSE.MIT;md5=5f229c828e5a6f0a2ce90c7d3c054721"
 
-SRC_URI[sha256sum] = "0781c857c0c81f8f51e0089929a26b5bb63d57f927728a5586f7e36171f064df"
+SRC_URI[sha256sum] = "f71d551ccaa79d0cb73017a33ef3264fde8335728eb4c6391451fe5d253a9d5b"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0



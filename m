Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11FF3C43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 09:22:40 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17241.1782811350041665195
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2026 02:22:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Pb9zUrAP;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782811350; x=1814347350;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2aCC/QMi3ufpTYjN2X/dPGcLtg6qDkzJOreabOCO4pQ=;
  b=Pb9zUrAPoOzIa5aIa2sN5wh3ab3HN2MEkfapKyc/vW9uJmn3yBPv29JU
   SRrTvbQXweyP5jJZTKiv06vLw6kDagNo/vYk02XobIkVHcIBRLd4gSLfy
   wi3J7y8qYDn+QMpDcQ9UIjQ2EtBoH5CuP4tkP3oFBR/5p+L4P9fxX3Zmy
   6nHZPoImBhwIuFMkVk+I/D3PTwZx2qFQWx99e9yrjHPU3oP+ArrFiHXQx
   EQ1eb89Sj1EbHLiSR9PMcbGiybkvIcRa0EH7j5+X4avE9K75f2MMQle00
   Rm2GRQ+lT9u1YYy3zJaqF7w/96MIP84WXVSbb4yn7Oa72nOztP3ELXDRt
   A==;
X-CSE-ConnectionGUID: nVswj3i9QgG2p+QtXNX+Sg==
X-CSE-MsgGUID: 28k33m18Q+OEK8KpxCqH7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="245262309"
X-IronPort-AV: E=Sophos;i="6.24,233,1774278000"; 
   d="scan'208";a="245262309"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 18:22:28 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 71D061000377
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:28 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 2C1091804141
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:28 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 4DF2A826FEE;
	Tue, 30 Jun 2026 09:22:26 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 12/37] python3-alembic: upgrade 1.18.4 -> 1.18.5
Date: Tue, 30 Jun 2026 17:21:40 +0800
Message-ID: <20260630092206.322-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260630092206.322-1-wangmy@fujitsu.com>
References: <20260630092206.322-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127954

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-alembic_1.18.4.bb => python3-alembic_1.18.5.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.18.4.bb => python3-alembic_1.18.5.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.18.4.bb b/meta-python/recipes-devtools/python/python3-alembic_1.18.5.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-alembic_1.18.4.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.18.5.bb
index 92c8a019e1..359108de7b 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.18.4.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.18.5.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ff111c41e8748bbfa45e8ba92347b681"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "cb6e1fd84b6174ab8dbb2329f86d631ba9559dd78df550b57804d607672cedbc"
+SRC_URI[sha256sum] = "1554982221dd17e9a749b53902407578eb305e453f71999e8c7f0a48389fff8e"
 
 RDEPENDS:${PN} += "\
     python3-dateutil \
-- 
2.43.0



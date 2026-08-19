Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12F96C5DF88
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:36:01 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3258.1787132144375481651
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:35:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tBcWT0wg;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132154; x=1818668154;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2R5K8N1Js4RJdrRPBIPX+EVZk1EXFFN6t1TMiO5ntzE=;
  b=tBcWT0wggO3EQghKT93fcBTQ8p/mqUhPrufsnnmQCTuUdrvFViO8VC52
   4yLhHkKVJYPBRUhoqUcZdaVYLfQclQ+pcpV22RtgS+mHRC1TE3yQV0Yui
   JT759SOi33E7fnrdTcta+4PvTg22IFllyKbKVxtJlhtnLei+yOeR2nMyn
   nrUsyLgS6Pem06oz64SG50wt/71ssIRlXUB4BTvqIPWR4JK9S/RtqrE+R
   70I3DGPku2fyfqY7BKLOaMduJTP3dfvTidzZcCyxsNylR7XJd/jdYuUH8
   cYavWxgjg7cDUXREWl+awAKaNIzsdsamftMEjJhg0KA/1bfW7/AgkLPrM
   g==;
X-CSE-ConnectionGUID: n6LawRcuQkGm9U8uTXmz9A==
X-CSE-MsgGUID: 3Yn9M/SPQRWlz5xYTFinNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="255507812"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="255507812"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:35:53 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id D11001C000EA
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:35:49 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 81F091000104
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:35:49 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 713A61801C0A;
	Wed, 19 Aug 2026 09:35:47 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/70] python3-alembic: upgrade 1.18.5 -> 1.19.1
Date: Wed, 19 Aug 2026 17:34:21 +0800
Message-ID: <20260819093514.1101-17-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129287

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-alembic_1.18.5.bb => python3-alembic_1.19.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.18.5.bb => python3-alembic_1.19.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.18.5.bb b/meta-python/recipes-devtools/python/python3-alembic_1.19.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-alembic_1.18.5.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.19.1.bb
index 359108de7b..ae0ee99743 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.18.5.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.19.1.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ff111c41e8748bbfa45e8ba92347b681"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "1554982221dd17e9a749b53902407578eb305e453f71999e8c7f0a48389fff8e"
+SRC_URI[sha256sum] = "e0fca0518118c78acc493e31bcb5402f190057aaf6df8b5b95ce94c4789cf648"
 
 RDEPENDS:${PN} += "\
     python3-dateutil \
-- 
2.43.0



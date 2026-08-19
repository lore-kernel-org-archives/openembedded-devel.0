Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A36EC5DF86
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:37:13 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3370.1787132222868875560
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:37:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=J7fHFIcr;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132223; x=1818668223;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EEkjM7jQWRjwkWt62T0MXEmTrYucaOjX5+/2X5M96fc=;
  b=J7fHFIcr4iVjhNrTtJUAnpS5tqTGAlE11tSa+7PcsAw40IdjqOcPH2Aq
   wtT79NW0yyeIIks06ASna3KJ9/DGtkJp9MQeZjcBHL0G95dajbqebIHJQ
   61lv6405O6Asj0t3wPNKatSOhj7gmtp1Wmzt/TAJNx1gCxlpEhZlkAL0o
   tmj6jqY1t+EcDpwzyG8UP//AN0Jqm/wRkFfKhIn127dbVLNH2k34BtKNE
   qCIbndCmLSykLowetze4IJrRkmGLkTK51nhp8MBk3A2GAIzDQP/i++Ca0
   y2xEQWleJavWmby+t4nwE1y5NkD6sx8cqI0k4Tw2ttoU0ro0WW44ipHz1
   g==;
X-CSE-ConnectionGUID: Jbk5ewqlQ9a5tVi+X5/woQ==
X-CSE-MsgGUID: 0esckHujRy2WmC1Q0o8x0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="251882338"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="251882338"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:37:01 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 2548DC020DD
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:37:01 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id D1B61181ED48
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:37:00 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id D7B271801C0A;
	Wed, 19 Aug 2026 09:36:58 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 57/70] python3-sqlparse: upgrade 0.5.5 -> 0.6.0
Date: Wed, 19 Aug 2026 17:35:01 +0800
Message-ID: <20260819093514.1101-57-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:37:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129327

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-sqlparse_0.5.5.bb => python3-sqlparse_0.6.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlparse_0.5.5.bb => python3-sqlparse_0.6.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlparse_0.5.5.bb b/meta-python/recipes-devtools/python/python3-sqlparse_0.6.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-sqlparse_0.5.5.bb
rename to meta-python/recipes-devtools/python/python3-sqlparse_0.6.0.bb
index 03c032c49e..df196dfa36 100644
--- a/meta-python/recipes-devtools/python/python3-sqlparse_0.5.5.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlparse_0.6.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2b136f573f5386001ea3b7b9016222fc"
 
-SRC_URI[sha256sum] = "e20d4a9b0b8585fdf63b10d30066c7c94c5d7a7ec47c889a2d83a3caa93ff28e"
+SRC_URI[sha256sum] = "113c35c75365ab9cc9c7231d68c6428fb11c085fc8e9eb1ad659b7ddbf6cd2b9"
 
 CVE_PRODUCT = "sqlparse"
 
-- 
2.43.0



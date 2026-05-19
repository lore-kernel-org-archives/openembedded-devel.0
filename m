Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21FB7CD5BA3
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 11:40:03 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19313.1779190799018444950
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2026 04:39:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qFe1cos9;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779190799; x=1810726799;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tBTxiMOnhH2NZyZr5VOvh2gHnk6JToOziR6dN6ks4Ts=;
  b=qFe1cos9oFvCLUmXvc1kt2mVXVuXC3CKpc3giKRSVYsJP2tothRvgZgy
   uIpiHBlA55DsWvYg4j2TXLAp/08vV5dF9S/UUqqRr7TchZk0uRWXHZQ07
   RzScMNpqa+LDxceDQ8DaaCd7zlx6k60euxk6dLAwlLRy+XdL4mea8Zokc
   UifdT9rAbvASDtM8mkc8XyN4ELegdFUhem5qhBUhvpJ73bKOevAm7bNp1
   L36Wi77D2RBelRAELj7sImPk7qloEZPcIzzHRNOZHCWiUuGQf4LISyc5+
   oyuE3FnyQsP2vcSzWu4oznEQ8qVyNdBH4MM5iqkYUIUdqWQI7zol6rglK
   Q==;
X-CSE-ConnectionGUID: itFvra2/R36pwdbcjV6qXg==
X-CSE-MsgGUID: zWmiObszT82j9HAM1yPV7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="241116965"
X-IronPort-AV: E=Sophos;i="6.23,243,1770562800"; 
   d="scan'208";a="241116965"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 20:39:57 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 328481C1C71F
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:39:57 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id DFEEEC06BE9
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:39:56 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 8334A405ECF;
	Tue, 19 May 2026 11:39:54 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 15/38] python3-flask-jwt-extended: upgrade 4.7.3 -> 4.7.4
Date: Tue, 19 May 2026 19:38:58 +0800
Message-ID: <20260519113921.655-15-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260519113921.655-1-wangmy@fujitsu.com>
References: <20260519113921.655-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:40:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127077

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  setup.py: bump PyJWT floor to >=2.11.0 to match the actual runtime requirement

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...wt-extended_4.7.3.bb => python3-flask-jwt-extended_4.7.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-flask-jwt-extended_4.7.3.bb => python3-flask-jwt-extended_4.7.4.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-jwt-extended_4.7.3.bb b/meta-python/recipes-devtools/python/python3-flask-jwt-extended_4.7.4.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-flask-jwt-extended_4.7.3.bb
rename to meta-python/recipes-devtools/python/python3-flask-jwt-extended_4.7.4.bb
index 31d54504d3..de6231ac31 100644
--- a/meta-python/recipes-devtools/python/python3-flask-jwt-extended_4.7.3.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-jwt-extended_4.7.4.bb
@@ -8,7 +8,7 @@ inherit pypi setuptools3
 PYPI_PACKAGE = "flask_jwt_extended"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI[sha256sum] = "a8318a3d983d1f360724b901889f1947ffee418e2a3950b48e99c70923b6615e"
+SRC_URI[sha256sum] = "78fd0f460317facf3a0084a6457ffaf2f1dda9eefbd576f94cea35b0eadd5531"
 
 RDEPENDS:${PN} += "\
     python3-werkzeug \
-- 
2.43.0



Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 350BCF531ED
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 10:40:51 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15994.1776163247102285001
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2026 03:40:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cGLNZbGv;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776163247; x=1807699247;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=C+KtWmDtszWd0sVPMAwB9HoX08Zq/YlSfwZ/1p8S3vo=;
  b=cGLNZbGvOfdgpDNuwd0g7dklgLQ1fA0wdxKZ5x2ZoOyhmz9yVS3BhBQW
   jC/ZShHseDf0q91u6RjUCARIVVZW3TdoY2JAiDk1u208uvf+miXG9+FOv
   2jfYS0bcueOuEAXs4QJvKz8ItXveZc9DIvhtJUsFLfsgAi24Ep52XtSxq
   Otx5rIZWuJ27YX8wP/3ekYvzwtxi8SE1mTbtX3dpyqfqv9W7ZC4lfvjNh
   j1DObZI+DhUj5hCoAYAYLHyGhiMHV6zG8sT/85cxVqcZSbtbuvp3gM0jK
   J6F2MDFKvmpAnftyQslLim1BMSRZy7XXT0Jzh8nXlqIb/Qc0r6Bc8Guwk
   w==;
X-CSE-ConnectionGUID: 8bsjbPsJSfCvmdZo1Z8IZQ==
X-CSE-MsgGUID: d4D/Gy7dTo+Vmjj85yhM6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="215917448"
X-IronPort-AV: E=Sophos;i="6.23,179,1770562800"; 
   d="scan'208";a="215917448"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 19:40:45 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id A84D3C0009E
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:40:45 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 60391C00334
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:40:45 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id DB69114001D5;
	Tue, 14 Apr 2026 10:40:42 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 30/32] python3-zopeinterface: upgrade 8.2 -> 8.3
Date: Tue, 14 Apr 2026 18:38:43 +0800
Message-ID: <20260414103845.1728-30-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260414103845.1728-1-wangmy@fujitsu.com>
References: <20260414103845.1728-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:40:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126334

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-zopeinterface_8.2.bb => python3-zopeinterface_8.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zopeinterface_8.2.bb => python3-zopeinterface_8.3.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-zopeinterface_8.2.bb b/meta-python/recipes-devtools/python/python3-zopeinterface_8.3.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-zopeinterface_8.2.bb
rename to meta-python/recipes-devtools/python/python3-zopeinterface_8.3.bb
index 690c2d26aa..2dc586a3ab 100644
--- a/meta-python/recipes-devtools/python/python3-zopeinterface_8.2.bb
+++ b/meta-python/recipes-devtools/python/python3-zopeinterface_8.3.bb
@@ -6,7 +6,7 @@ PYPI_PACKAGE = "zope_interface"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_setuptools_build_meta
-SRC_URI[sha256sum] = "afb20c371a601d261b4f6edb53c3c418c249db1a9717b0baafc9a9bb39ba1224"
+SRC_URI[sha256sum] = "e1a9de7d0b5b5c249a73b91aebf4598ce05e334303af6aa94865893283e9ff10"
 PACKAGES =. "${PN}-test "
 
 RPROVIDES:${PN} += "zope-interfaces"
-- 
2.43.0



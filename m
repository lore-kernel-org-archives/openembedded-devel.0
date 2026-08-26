Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EA95C61DCB
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:10:05 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7656.1787731795829312531
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:09:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FisYXJZ6;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787731799; x=1819267799;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mMEEgEmYmrTELg8aoWuLAo4EtDQ7LmyZHq/zH2YGF+g=;
  b=FisYXJZ6B6EtB11FfTAOzmyNlTIMQ5qyx2UyKNw3Ku/Um0YOhjikJpUm
   PGw4zu6NdiVzi3oYo3kISr5mwkf7McQNiaGlF1XPsjUrAY3Ju8ko6rWIF
   +irkPlMN2rO6emTS8dayXFQ0dd4TfljR/OuT2TImg9/yFMbP4rL39ecdd
   Xbngzy/sGteg9VL0BxDgHD7vIwzJl7jkxcd2TYWM1aFmH/d1qmnFkvjCw
   +sMbZu2xgHjfz9Xsf6632QIHafk/iEcgAZQW/MMncPOMCeJFvM/x6iSHh
   WmM3Gx6vqtXBfh5e3al9ZJ6ARwrrfGCos7UOOrilOfcaHNVX7MuaBD2Pl
   w==;
X-CSE-ConnectionGUID: /wrHQ0RJQ++OkCWwNSeTew==
X-CSE-MsgGUID: TjPnZHAjTU6Z6eI9IQFisg==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="231590017"
X-IronPort-AV: E=Sophos;i="6.25,244,1779116400"; 
   d="scan'208";a="231590017"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 17:09:57 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 11C6110000CF
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 08:09:54 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (unknown [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id BC5C5C02195
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 08:09:53 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id C073114000B3;
	Wed, 26 Aug 2026 08:09:51 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 14/23] python3-gunicorn: upgrade 26.0.0 -> 26.1.0
Date: Wed, 26 Aug 2026 16:09:17 +0800
Message-ID: <20260826080926.989-14-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260826080926.989-1-wangmy@fujitsu.com>
References: <20260826080926.989-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 08:10:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129506

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-gunicorn_26.0.0.bb => python3-gunicorn_26.1.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gunicorn_26.0.0.bb => python3-gunicorn_26.1.0.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-gunicorn_26.0.0.bb b/meta-python/recipes-devtools/python/python3-gunicorn_26.1.0.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-gunicorn_26.0.0.bb
rename to meta-python/recipes-devtools/python/python3-gunicorn_26.1.0.bb
index 575e8a66e1..2f27264192 100644
--- a/meta-python/recipes-devtools/python/python3-gunicorn_26.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gunicorn_26.1.0.bb
@@ -3,7 +3,7 @@ SUMMARY = "WSGI HTTP Server for UNIX"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5dc9171ccd8fcbd7827c850148b3ca98"
 
-SRC_URI[sha256sum] = "ca9346f85e3a4aeeb64d491045c16b9a35647abd37ea15efe53080eb8b090baf"
+SRC_URI[sha256sum] = "1413d777bf99d31ebeb08acd354b01f1ecc44db0aa7b811ae7b86c669232e4f7"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.43.0



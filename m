Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69A4ACD37B6
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 04:10:48 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.124.1778645436935718757
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 21:10:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WQ6qdN+A;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1778645442; x=1810181442;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZNMDElCYt7XLLPa2p7wnOTBdL5LFKUh4XiOf6/d8ml4=;
  b=WQ6qdN+AR1rtPq/0Rdk2xozg152U464wAImokJ04YfQzkWFSbDJi7OzH
   aU2+15mWidw+f3+eLAt8fu66WPUxMG7REJzASupdfVDb9ZRA9QkpklbGD
   H0eOnAn0ddGQRmHl1gC9C48vT2hNEZs0ZOhSvHlOvG3fgHbEKNbyQnmPL
   MOOWWiwvSJSazImbofbVg2okVAAB18jgXURvWgzQ39b4/H7gjLoNZAbVI
   CLcF5+qgmceEc+aBiLzVU2WW7rUlwtQ4bb1rlZ++OdDyNXpRELBzStU9x
   VZmolSjz6J8VHy/xPgSpmpCS5HeZoO8MMu2FJ87JXpsCSHXrzNGdzC/c5
   g==;
X-CSE-ConnectionGUID: 67YB8qjoSSKrDx5Ff3cZ4w==
X-CSE-MsgGUID: 3gya5aD+TkOWeQrqNPcG4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="228214099"
X-IronPort-AV: E=Sophos;i="6.23,232,1770562800"; 
   d="scan'208";a="228214099"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:10:41 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id A14611002BB0
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:10:41 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 5A02D1401222
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:10:41 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id F243014000AF;
	Wed, 13 May 2026 04:10:38 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 30/56] python3-matplotlib-inline: upgrade 0.2.1 -> 0.2.2
Date: Wed, 13 May 2026 12:05:29 +0800
Message-ID: <20260513040555.377-30-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260513040555.377-1-wangmy@fujitsu.com>
References: <20260513040555.377-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:10:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126912

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...otlib-inline_0.2.1.bb => python3-matplotlib-inline_0.2.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-matplotlib-inline_0.2.1.bb => python3-matplotlib-inline_0.2.2.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-matplotlib-inline_0.2.1.bb b/meta-python/recipes-devtools/python/python3-matplotlib-inline_0.2.2.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-matplotlib-inline_0.2.1.bb
rename to meta-python/recipes-devtools/python/python3-matplotlib-inline_0.2.2.bb
index b236802f20..ee98ae4b40 100644
--- a/meta-python/recipes-devtools/python/python3-matplotlib-inline_0.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-matplotlib-inline_0.2.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/matplotlib-inline/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d4692a0eb42ca54892399db2cb35e61e"
 
-SRC_URI[sha256sum] = "e1ee949c340d771fc39e241ea75683deb94762c8fa5f2927ec57c83c4dffa9fe"
+SRC_URI[sha256sum] = "72f3fe8fce36b70d4a5b612f899090cd0401deddc4ea90e1572b9f4bfb058c79"
 
 PYPI_PACKAGE = "matplotlib_inline"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.43.0



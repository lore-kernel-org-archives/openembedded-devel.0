Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F13B5C44500
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 09:22:50 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17242.1782811354103276966
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2026 02:22:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IiVHjgB5;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782811362; x=1814347362;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aTnygtmm0CioRSg5RLQEYB9hPdQHvleKMzPzgbb//AQ=;
  b=IiVHjgB5bgA2/m9ecZSXZzjFiT4Fc73N2bKkEg3IIgP6AFYL8wGHo/wx
   AB4C2RvGmfI56SsQuJJGtoel7rGfAq2GxjLqqtbo79U51sVmN+/8QbNwZ
   FMXGHOrPv0YW/65yFTE5yNBnSI2LQGl7p21VGhCWWEc6S8DwTnXBsTn6C
   RSyyXiML29kNkLc1bDJRcCWwycwbPUD0e+cCwd8vcqwDoxxvC/m7lL2le
   jgtYsLLyFFT9OOYEPILuQjNQWOSb9qoRhXiALbEq/x50q5+0hiZVrLKGO
   ehpmld6sCvK/kuDl+S6ptxw7SxsBBQX6XNxUfQp6yCieuuG3SKSOxX2G2
   w==;
X-CSE-ConnectionGUID: e8T2EoB0REqzsHq7OI9BcQ==
X-CSE-MsgGUID: JMqSvEruS7uoazrOs1/RRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="233776233"
X-IronPort-AV: E=Sophos;i="6.24,233,1774278000"; 
   d="scan'208";a="233776233"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 18:22:41 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id C2D68484
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:41 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 7A48FC09355
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:41 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id A63C5826FFA;
	Tue, 30 Jun 2026 09:22:39 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 20/37] python3-greenlet: upgrade 3.5.2 -> 3.5.3
Date: Tue, 30 Jun 2026 17:21:48 +0800
Message-ID: <20260630092206.322-20-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260630092206.322-1-wangmy@fujitsu.com>
References: <20260630092206.322-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127962

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  Fix a crash on free-threaded builds when multiple greenlets were holding a critical section on an object and the GIL for the thread was dropped.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-greenlet_3.5.2.bb => python3-greenlet_3.5.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-greenlet_3.5.2.bb => python3-greenlet_3.5.3.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-greenlet_3.5.2.bb b/meta-python/recipes-devtools/python/python3-greenlet_3.5.3.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-greenlet_3.5.2.bb
rename to meta-python/recipes-devtools/python/python3-greenlet_3.5.3.bb
index 6ea765817e..a83f260946 100644
--- a/meta-python/recipes-devtools/python/python3-greenlet_3.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-greenlet_3.5.3.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT & PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e95668d68e4329085c7ab3535e6a7aee \
                     file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
 
-SRC_URI[sha256sum] = "c1b906220d83c140361cdd12eef970fb5881a168b98ee58a43786426173da14c"
+SRC_URI[sha256sum] = "a61efc018fd3eb317eeca31aba90ee9e7f26f22884a79b6c6ec715bf71bb62f1"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0



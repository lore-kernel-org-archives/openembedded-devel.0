Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92F47C43602
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 09:22:50 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17257.1782811368121412514
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2026 02:22:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UhTVQuIS;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782811368; x=1814347368;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=URStOe5AHlFl+FsnK5iRt4aF32BbhLNIhaHirFIReic=;
  b=UhTVQuISEN6VOmEL8Q9ph2qDSiViDlIqj5IOM2tofVEmatg2eTZOfitR
   7P/A6ij6HJFoL3gwaXNyLYD5dujw8bveI8SylwST07cBtsoBkR3mbIx/k
   eyJMVwzb48Vi2gsU3GTE/YN+lkiADQcMikW2r360MvM/M7sGQEdeizCTQ
   xpxIW0p88CdAskSYg4jzeGpVPxkr9rkkMYTQybz9MOqwYfzEmRJdWrYtc
   C0nEkT7p8RiK+uj8eVxI5FdDbpUrJ4tvkKMn9OJQvuen5Y2fXD/WrNARA
   dRnW7fKAr8tfDOfidUDf3M6DLpluIAwWZwKzle52VQalHS8dRlyryXuS8
   g==;
X-CSE-ConnectionGUID: 23l89mM8RrWWDetxCVhEbg==
X-CSE-MsgGUID: 6Bh3tyBxQfyn6GX/tyq7GA==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="243961065"
X-IronPort-AV: E=Sophos;i="6.24,233,1774278000"; 
   d="scan'208";a="243961065"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 18:22:46 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 9092A42A307
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:46 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 470B11809AFA
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:46 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 6657B82DDC0;
	Tue, 30 Jun 2026 09:22:44 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 23/37] python3-ipython: upgrade 9.14.1 -> 9.15.0
Date: Tue, 30 Jun 2026 17:21:51 +0800
Message-ID: <20260630092206.322-23-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260630092206.322-1-wangmy@fujitsu.com>
References: <20260630092206.322-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127965

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-ipython_9.14.1.bb => python3-ipython_9.15.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_9.14.1.bb => python3-ipython_9.15.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_9.14.1.bb b/meta-python/recipes-devtools/python/python3-ipython_9.15.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-ipython_9.14.1.bb
rename to meta-python/recipes-devtools/python/python3-ipython_9.15.0.bb
index 044e284f37..589f0a584f 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_9.14.1.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_9.15.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://ipython.org"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
 
-SRC_URI[sha256sum] = "f913bf74df06d458e46ced84ca506c23797590d594b236fe60b14df213291e7b"
+SRC_URI[sha256sum] = "da2819ce2aa83135257df830660b1176d986c3d2876db24df01974fa955b2756"
 
 RDEPENDS:${PN} = "\
     python3-setuptools \
-- 
2.43.0



Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 809A6EDB7E9
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 10:13:13 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.77946.1775556792837571242
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Apr 2026 03:13:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=iUNZTMdQ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775556793; x=1807092793;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=AbuwP6In6LwwwN5Nd7dpE3vrkiHRC+El579BgiPGOMA=;
  b=iUNZTMdQ6Sjll3D5cpOVSEh1uqq31jNBvI9wAy7b02J4K3ONvFA6+NOl
   mCnaeX/ZyF9rM6YPyxE5/4/jFGgdHhUasnPQPq4Bma6tXSifbxBroXm0q
   YvDnAh6+PMbYh+2d6JtTEGXRaIR6GIj0NT02+HFJp7qNNDkBtC4VDm7YV
   Dt42OnfUVj7U5AuZ9HLSYcAgZcxEJQqsjsJieiQr5VRK4FRtAD+S6+pa0
   vUNR+vBcjO2op+4pymFsmE+H+NLhGlPtbWz2QYz3yamlCuO2/CWpb4lIq
   O57ZltczwNxpnc0MJnSz5FzndG9EaHAwzNCh+SxIpM6fDM7xqQTGZEmCm
   w==;
X-CSE-ConnectionGUID: BBLRdRbnSr6TeTYrZ1rspg==
X-CSE-MsgGUID: SE0Dl4btTLKEDYU9PmYS+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="236084034"
X-IronPort-AV: E=Sophos;i="6.23,165,1770562800"; 
   d="scan'208";a="236084034"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 19:13:11 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 2C80F1002BA6
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Apr 2026 10:13:11 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id D7B85C00897
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Apr 2026 10:13:10 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 963B6821728
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Apr 2026 10:13:08 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH] python3-croniter: upgrade 6.0.0 -> 6.2.2
Date: Tue,  7 Apr 2026 18:12:50 +0800
Message-ID: <20260407101250.21249-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Apr 2026 10:13:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126085

Changelog:
  https://github.com/pallets-eco/croniter/blob/main/CHANGELOG.rst

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../{python3-croniter_6.0.0.bb => python3-croniter_6.2.2.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-croniter_6.0.0.bb => python3-croniter_6.2.2.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-croniter_6.0.0.bb b/meta-python/recipes-devtools/python/python3-croniter_6.2.2.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-croniter_6.0.0.bb
rename to meta-python/recipes-devtools/python/python3-croniter_6.2.2.bb
index 201074e1e3..d217161d7d 100644
--- a/meta-python/recipes-devtools/python/python3-croniter_6.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-croniter_6.2.2.bb
@@ -5,9 +5,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b8ee59850b882cbf623188489ea748e2"
 
 PYPI_PACKAGE = "croniter"
 
-SRC_URI[sha256sum] = "37c504b313956114a983ece2c2b07790b1f1094fe9d81cc94739214748255577"
+SRC_URI[sha256sum] = "ba60832a5ec8e12e51b8691c3309a113d1cf6526bdf1a48150ce8ec7a532d0ab"
 
-inherit pypi setuptools3
+inherit pypi python_hatchling
 
 RDEPENDS:${PN} += " \
 	python3-dateutil \
-- 
2.43.0



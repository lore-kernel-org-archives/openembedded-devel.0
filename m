Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B228FF60F7
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 09:26:59 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15933.1774949217421463987
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Mar 2026 02:26:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jt8/NRR0;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774949218; x=1806485218;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=m1Aef+uO4ifTo2qd/KmAbsUdOwIqh1P7geS7jYDthbM=;
  b=jt8/NRR0fzcoDaS72woi7R8hVIplc36+HkIUCHB4g/WKcE2a4JFcc99i
   U0B73dgxpJvfSsOEUXCtGKq1tI4PEcEWdeKpmZswxANPubIHRtSgjwuyp
   816/yXgcwX0qJmU5SUPsvZ3niQ+T64MvBMrnE7qSt19i9bqJm0S7LBiFj
   jmVMxw2y6uBhdqiBS2Zf7xNW9VCweos0AQ68l/JjcG+5FjqUiSDsykx0r
   vt+VfVxIuwXtjPrVhqY4E6a1CZRglnIYxsKivFbZuJTxlhPPhC2ctPEcc
   6fql5TaxRqjaCc7zdnBMQ/pOY/r8mi2iwPUYiZHKOXLnQXrh7m2seboAw
   Q==;
X-CSE-ConnectionGUID: dTKh8+JyQbK2FpsCo7SnTw==
X-CSE-MsgGUID: zPbhZJvkTiip8VviBt4FjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="234713388"
X-IronPort-AV: E=Sophos;i="6.23,151,1770562800"; 
   d="scan'208";a="234713388"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 18:26:56 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 910D68203DD
	for <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2026 09:26:55 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 4B87C144C158
	for <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2026 09:26:55 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 2643B1800C10
	for <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2026 09:26:52 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] glibmm-2.68: upgrade 2.86.0 -> 2.88.0
Date: Tue, 31 Mar 2026 17:26:49 +0800
Message-ID: <20260331092649.12429-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2026 09:26:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125881

NEWS:
  https://gitlab.gnome.org/GNOME/glibmm/-/blob/2.88.0/NEWS

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../glib-2.0/{glibmm-2.68_2.86.0.bb => glibmm-2.68_2.88.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/glib-2.0/{glibmm-2.68_2.86.0.bb => glibmm-2.68_2.88.0.bb} (90%)

diff --git a/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.86.0.bb b/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.88.0.bb
similarity index 90%
rename from meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.86.0.bb
rename to meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.88.0.bb
index b0c83f7eba..94995ef284 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.86.0.bb
+++ b/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.88.0.bb
@@ -12,7 +12,7 @@ inherit gnomebase
 
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
-SRC_URI[archive.sha256sum] = "39c0e9f6da046d679390774efdb9ad564436236736dc2f7825e614b2d4087826"
+SRC_URI[archive.sha256sum] = "a6549da3a6c43de83b8717dae5413c57a60d92f6ecc624615c612d0bb0ad0fe2"
 
 S = "${UNPACKDIR}/${GNOMEBN}-${PV}"
 
-- 
2.43.0



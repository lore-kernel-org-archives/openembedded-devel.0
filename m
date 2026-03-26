Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFB8A10A1E98
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:57:12 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46411.1774526228175921692
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:57:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sKNM32ON;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774526228; x=1806062228;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JLHKiKaaB3cyVuBS3mpHuHLTT7qBEzZBBWCh2khyhio=;
  b=sKNM32ON1vBBsuu08ThWuyZT6D2TYftL/nZGYvkzi/+AYMu637fzQLuE
   cEkHKvtbDNI98kSSYUjsdeEs3Mj/dLWVrO3t+o2eY718jqyZlhtLTBksX
   HPhqoqXTna+xiknmHSIb4yxxux4Et98MRoPslLyH1Kq4P7HdOzKFbX12E
   3HTXb0MGHI6Bv1/PyT0j76shpmEogYZIxcQ52VfcOoNd/b7b8/iNw1Af8
   yUQmfPmnLB9gCf183v5GJz6ZlSPllN8BRRoxP8h16hYqELUmGMtmngdkS
   EV2Sodmqn8OY4iRIxJHtUdQGzqDtaKhGsziyQAs4gTBu6jHkjp5iYAmg8
   w==;
X-CSE-ConnectionGUID: unG2D2XRStWvqeprnRZPcw==
X-CSE-MsgGUID: 8zowFpFiQ7SMnrRpgXO29A==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="235420855"
X-IronPort-AV: E=Sophos;i="6.23,142,1770562800"; 
   d="scan'208";a="235420855"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 20:57:06 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 9F9CD82008F
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:06 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 5B95F1410CBE
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:06 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 0699E180715C;
	Thu, 26 Mar 2026 11:57:03 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 16/63] graphviz: upgrade 14.1.3 -> 14.1.4
Date: Thu, 26 Mar 2026 19:55:46 +0800
Message-ID: <20260326115634.1199-16-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260326115634.1199-1-wangmy@fujitsu.com>
References: <20260326115634.1199-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125671

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Enable ascii plugin to be built using autotools.
- Processing 'concentrate=true' graphs no longer crashes Graphviz. Processing of
  'concentrate=true' graphs still often errors out.

License_Update: Change Eclipse Public License from version 1.0 to 2.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../graphviz/{graphviz_14.1.3.bb => graphviz_14.1.4.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/graphviz/{graphviz_14.1.3.bb => graphviz_14.1.4.bb} (95%)

diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_14.1.3.bb b/meta-oe/recipes-graphics/graphviz/graphviz_14.1.4.bb
similarity index 95%
rename from meta-oe/recipes-graphics/graphviz/graphviz_14.1.3.bb
rename to meta-oe/recipes-graphics/graphviz/graphviz_14.1.4.bb
index d885dc43ac..8711eba7bc 100644
--- a/meta-oe/recipes-graphics/graphviz/graphviz_14.1.3.bb
+++ b/meta-oe/recipes-graphics/graphviz/graphviz_14.1.4.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Graph Visualization Tools"
 HOMEPAGE = "http://www.graphviz.org"
 LICENSE = "EPL-1.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=9109f5fc16cf963fb3cdd32781b3ce04"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d9fc0efef5228704e7f5b37f27192723"
 
 DEPENDS = " \
     bison-native \
@@ -23,7 +23,7 @@ SRC_URI = "https://gitlab.com/api/v4/projects/4207231/packages/generic/${BPN}-re
 SRC_URI:append:class-nativesdk = "\
            file://graphviz-setup.sh \
 "
-SRC_URI[sha256sum] = "fe76529477c22c0cf833ec5a35b430cf710f4705afc465d86292bf13560be584"
+SRC_URI[sha256sum] = "043877c0857d8d46067cd2f18809d54fc876c399f0ecd438f60ea7f4d8037451"
 
 UPSTREAM_CHECK_URI = "https://graphviz.org/download/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.43.0



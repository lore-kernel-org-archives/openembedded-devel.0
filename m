Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2742AC55822
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 05:17:55 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10297.1785820672368296495
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2026 22:17:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sJrhPNy5;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785820672; x=1817356672;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AmfHfoKAAcSTTSwzymq1TcCg+xrMVyGpYehcu2RcsPA=;
  b=sJrhPNy5+K8LtQzgFoG6r4qdQK1Ftbo3JATNUTRT0k5AO/eRtcqMCq4j
   b5te85aRFGNq1vzZGa3WfWd4mk7IYBDCwXIXJluSuJzJgFWj0xWaEBu9g
   WL7ZL7fqQkZRt8Vfu3REvRzIvDWQ/MMlJwkH7Y6jpNclP7I5w9C2i0Zbq
   Hgkye4a5XN/uUSAlT5NMC38sbgzBldkvbCzIMwJ/KYvM7+ojxhBQpJOcn
   lSVTF3zlroefEhfUL8FsG6uevLIATzOVmLDwlum6BY362n6qG0KT2Qx3D
   vN2Tg+Dhrnad5bdMIseNuIKmuRxJ9HqUe2D4gHLnbvfV8//DihGJOS8HB
   w==;
X-CSE-ConnectionGUID: NjAhMVLgSg2lqZ4NLp0Faw==
X-CSE-MsgGUID: 1USgDOpHQzWsi2rrpMPVvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="235804043"
X-IronPort-AV: E=Sophos;i="6.25,203,1779116400"; 
   d="scan'208";a="235804043"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 14:17:50 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 6FC428203E5
	for <openembedded-devel@lists.openembedded.org>; Tue,  4 Aug 2026 05:17:50 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 2781B18000C3
	for <openembedded-devel@lists.openembedded.org>; Tue,  4 Aug 2026 05:17:50 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 6F4001800B35;
	Tue,  4 Aug 2026 05:17:48 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 05/28] nanomsg: upgrade 1.2.2 -> 1.2.4
Date: Tue,  4 Aug 2026 13:17:03 +0800
Message-ID: <20260804051726.1489-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260804051726.1489-1-wangmy@fujitsu.com>
References: <20260804051726.1489-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 05:17:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128710

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nanomsg/{nanomsg_1.2.2.bb => nanomsg_1.2.4.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/nanomsg/{nanomsg_1.2.2.bb => nanomsg_1.2.4.bb} (94%)

diff --git a/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.2.bb b/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.4.bb
similarity index 94%
rename from meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.2.bb
rename to meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.4.bb
index f291326c80..95b81869b5 100644
--- a/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.2.bb
+++ b/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.4.bb
@@ -9,11 +9,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=587b3fd7fd291e418ff4d2b8f3904755"
 
 SECTION = "libs/networking"
 
-SRC_URI = "git://github.com/nanomsg/nanomsg.git;protocol=https;branch=master \
+SRC_URI = "git://github.com/nanomsg/nanomsg.git;protocol=https;branch=master;tag=${PV} \
            file://run-ptest \
           "
 
-SRCREV = "ccd7f20c1b756f7041598383baffcdc326246db7"
+SRCREV = "e6d0b8ddfc780eb89f8f6ef305e92c19e76bed6b"
 
 inherit cmake pkgconfig ptest
 
-- 
2.43.0



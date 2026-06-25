Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEF6ECDE002
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 09:01:46 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7225.1782378102392819022
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2026 02:01:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=iUl9QPp5;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782378102; x=1813914102;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WFamD1QCNbWq8vnErSK145iAh2oqA5Y4t2JbKmcYP2U=;
  b=iUl9QPp56qr2Y1cMj3U1r5mp9W/fEJivEVuaYFQ/dpudi9Egr3wry+qq
   wOnecPB1sPPWdUKK1Hde4Cjb6JYfL6rI2nYbGIifNS00utJanlSn6SrYN
   E+J/jltYDLV3PVwGbz3PsKTtzWbG2vtVpAbawxQxgr2Ed4hRLYURqVhv1
   o81Dkc/lzeWW7F/xfmfewh1FP1EHpaeCvzoeI0k+tKSlgX+2QYaJcHUox
   8oCiFtp3QNnpj04spWy/kYzplpDd0GKtuINgM+qYXadAaNbtPg10XdyI2
   gzTh71XvJuuteea+BvrblhBWm8DSAIy1oB9Jh/6+zMM0IWzcM0puCec8o
   Q==;
X-CSE-ConnectionGUID: OfhqKZznSEmUk6Wx702w8A==
X-CSE-MsgGUID: 8jopjp2lQDKTz5HYTXrrlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="245302327"
X-IronPort-AV: E=Sophos;i="6.24,224,1774278000"; 
   d="scan'208";a="245302327"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 18:01:41 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 94E891000169
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:01:40 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 45613C03F66
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:01:40 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 60355101732C;
	Thu, 25 Jun 2026 09:01:38 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 06/47] libdbi-perl: upgrade 1.648 -> 1.649
Date: Thu, 25 Jun 2026 17:00:46 +0800
Message-ID: <20260625090127.1563-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260625090127.1563-1-wangmy@fujitsu.com>
References: <20260625090127.1563-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:01:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127738

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../perl/{libdbi-perl_1.648.bb => libdbi-perl_1.649.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/perl/{libdbi-perl_1.648.bb => libdbi-perl_1.649.bb} (95%)

diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl_1.648.bb b/meta-oe/recipes-devtools/perl/libdbi-perl_1.649.bb
similarity index 95%
rename from meta-oe/recipes-devtools/perl/libdbi-perl_1.648.bb
rename to meta-oe/recipes-devtools/perl/libdbi-perl_1.649.bb
index 603c3b3cd2..c25d5d63a6 100644
--- a/meta-oe/recipes-devtools/perl/libdbi-perl_1.648.bb
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl_1.649.bb
@@ -10,7 +10,7 @@ LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1a1138dff61f77bbc3d8782caba6758d"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/H/HM/HMBRAND/DBI-${PV}.tgz"
-SRC_URI[sha256sum] = "ef266aad6010ce2eabb7e465ebd73ca3020bc58150f6989bd89c2b8f9bac6a86"
+SRC_URI[sha256sum] = "98897cdd06adae70e5516042e47ca08d623db2139fc58fd95cde208adf85c697"
 
 S = "${UNPACKDIR}/DBI-${PV}"
 
-- 
2.43.0



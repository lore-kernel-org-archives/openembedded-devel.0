Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C442CD582E
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 10:29:24 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3057.1767781750884519406
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 02:29:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rZaCazpu;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767781755; x=1799317755;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xQHwz9xKoPVtqbc1knf3aI5OWsOJxbZwXaapqJqvY90=;
  b=rZaCazpuobKv7r8SxQv8rE2o24Ne00PX18Kg9D3U3H74/3W+n639IlwI
   QdipTw/Lk/XmwuNixnQ3KEbZ4iNj+l7WDRwSGJgoz6+N3f7ETra0YNHtI
   m5wxeUkYwTb0Ot+2C1ZPxCWzbNtN3ZF2JMtzVzg6ZoVHlpu5X5JOwsVMx
   oQ7enVQ/shp5x7t8YYEnI5YfGADbJpRVbVMOZkhTwUR9cYBV3TjaqFgxj
   GHFlNDxpB35uBbeA8NXZE6NJFnEUoaBWBfmRvUqSKcaJWizUe19IC5iYC
   0e3H6aYs6pvwgorjvs48pWsW3rtpZvJAHoQ+j3JQ7I3pdAWEyYDtMsVve
   Q==;
X-CSE-ConnectionGUID: N3eOp8nASgeh6kl+WI+G0w==
X-CSE-MsgGUID: Pcse8pQeQ7+U28Xs5+8PQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="225054566"
X-IronPort-AV: E=Sophos;i="6.21,207,1763391600"; 
   d="scan'208";a="225054566"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([51.138.80.169])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 19:29:14 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 4DBF4304E
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Jan 2026 10:29:13 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 09FDC180416C
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Jan 2026 10:29:13 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 3F2C182173A;
	Wed,  7 Jan 2026 10:29:09 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 06/24] libdbd-sqlite-perl: upgrade 1.76 -> 1.78
Date: Wed,  7 Jan 2026 18:28:37 +0800
Message-ID: <20260107102855.228-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260107102855.228-1-wangmy@fujitsu.com>
References: <20260107102855.228-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 10:29:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123204

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libdbd-sqlite-perl_1.76.bb => libdbd-sqlite-perl_1.78.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libdb/{libdbd-sqlite-perl_1.76.bb => libdbd-sqlite-perl_1.78.bb} (94%)

diff --git a/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.76.bb b/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.78.bb
similarity index 94%
rename from meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.76.bb
rename to meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.78.bb
index 8d9db19a3c..1fbf2ef277 100644
--- a/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.76.bb
+++ b/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.78.bb
@@ -14,7 +14,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/I/IS/ISHIGAKI/DBD-SQLite-${PV}.tar.gz \
            file://sqlite-perl-test.pl \
 "
 
-SRC_URI[sha256sum] = "0a33a7a935be63371071dbe600cfaefa67cd971b67580a917bbf6ebaf723c584"
+SRC_URI[sha256sum] = "efbad7794bafaa4e7476c07445a33bbfe1040e380baa3395a02635eebe3859d5"
 
 UPSTREAM_CHECK_REGEX = "DBD\-SQLite\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
-- 
2.43.0



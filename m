Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8662FC590A
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 07:57:18 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.65916.1772092636816430036
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Feb 2026 23:57:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sCc9OCPX;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772092635; x=1803628635;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cgZhQNJ0WOJ2HTbsIqaFdH7FfaWHicBbnz235DiQPlM=;
  b=sCc9OCPXjJnowfpHsltDK2BPHRo5IXtmoSA793tFsb6viZXGLC/bV3hC
   TpofWWTvAeiLT9P6lhfDjF/mrmEZpUpE7KI4GkcB/Br5JdwXKmFt3Vy5G
   DGPHvhrtMZHMRN3nYJDIjJzO+fgJRiWKayVl9jPs03/Hr+z+ANv9KxRdw
   tILSo5otwqSgaNKvag78WSf/dGXplaUKSG9FzEStn8VJoaGSLcZ2gHeCT
   HsXNJoLOAQj+aNAuKFx9iuZv3v6XOFtlyYR+538Nr6lZX7VeKzRjqkEX0
   c6QsbM+A/hVThQraPtzFN7OC8StLqN1+96Ism6kaEi3Ez9He3jyjBCSei
   Q==;
X-CSE-ConnectionGUID: Ua9S5PaBRJiwB0R7hoWSJA==
X-CSE-MsgGUID: FR2ugt08STKXKKmSQfvp5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="231127941"
X-IronPort-AV: E=Sophos;i="6.21,311,1763391600"; 
   d="scan'208";a="231127941"
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.fujitsu.com (Postfix) with ESMTPS id EEB8D42A335
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Feb 2026 07:57:14 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 9D6F7C021BD
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Feb 2026 07:57:14 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.167.241])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 23CC61405F70
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Feb 2026 07:57:08 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] atop: upgrade 2.12.0 -> 2.12.1
Date: Thu, 26 Feb 2026 15:57:04 +0800
Message-ID: <20260226075705.2932-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Feb 2026 07:57:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124665

Version 2.12.1
  Bug solution: tests during append of existing raw log are less strict now.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 meta-oe/recipes-support/atop/{atop_2.12.0.bb => atop_2.12.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/atop/{atop_2.12.0.bb => atop_2.12.1.bb} (96%)

diff --git a/meta-oe/recipes-support/atop/atop_2.12.0.bb b/meta-oe/recipes-support/atop/atop_2.12.1.bb
similarity index 96%
rename from meta-oe/recipes-support/atop/atop_2.12.0.bb
rename to meta-oe/recipes-support/atop/atop_2.12.1.bb
index 348493245b..4ca74edbaf 100644
--- a/meta-oe/recipes-support/atop/atop_2.12.0.bb
+++ b/meta-oe/recipes-support/atop/atop_2.12.1.bb
@@ -22,7 +22,7 @@ SRC_URI = "http://www.atoptool.nl/download/${BP}.tar.gz \
            file://fix-permissions.patch \
            file://sysvinit-implement-status.patch \
            "
-SRC_URI[sha256sum] = "0d09ecc90c14e6ef41c22e3c57c142c3e4fb9cf3c94379077a33c961d5343086"
+SRC_URI[sha256sum] = "4fdbe67c5dfaf89405639e18599f4eae77978073ffa54f3c78c368ab54bd12f6"
 
 UPSTREAM_CHECK_URI = "https://atoptool.nl/downloadatop.php"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+).tar"
-- 
2.43.0



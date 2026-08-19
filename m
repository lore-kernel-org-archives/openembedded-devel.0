Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F5DFC5DF86
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:35:40 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3276.1787132130327445985
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:35:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=oAcNolOQ;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132130; x=1818668130;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8OLULUO6qtvYb0sJXZq90MMV40WYgQ1Fanlka2/Xa5U=;
  b=oAcNolOQMvgIgMSh2p03N6rB5TUZohz5n3CTbhiKLQPxSmenPJElTNFh
   7N5ale8528klx2t1BwmNRFqHwL32AJdeLpwLWMiGBTDrlZJLmS+XizDap
   8yT0DhMwreh3/EYWaCEUZAmj6HmfcgAC1baO5XJOCOInhbd5/rvVDWmFU
   h+gwvA4gqa/CbPAMhUs9y6YZi6xmLZuU0NhSBr6FGYYI8p6PZVRBmYOjR
   f85VnXQ8fpBkJmPf0dPKmSnMt4kAeWsbJ3U49HeKGDyrP9n+ugHJIhXMj
   AgAyPbqnq02ErISN1HCf1FbVGTiR5vhEUJZf5ePrOvIssL3Q1OgwALhNs
   g==;
X-CSE-ConnectionGUID: Qtg6lkD5Qe2EMHgoz7IA1A==
X-CSE-MsgGUID: hjz3dLaITJ2lYs2nUyR9BA==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="239330756"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="239330756"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:35:28 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 85DA9CA44
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:35:28 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 31A351C00285
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:35:28 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 2A9A81801C20;
	Wed, 19 Aug 2026 09:35:25 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 05/70] ctags: upgrade 6.2.20260802.0 -> 6.2.20260816.0
Date: Wed, 19 Aug 2026 17:34:09 +0800
Message-ID: <20260819093514.1101-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:35:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129275

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.2.20260802.0.bb => ctags_6.2.20260816.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.2.20260802.0.bb => ctags_6.2.20260816.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.2.20260802.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.2.20260816.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.2.20260802.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.2.20260816.0.bb
index dff13380bf..c7cff997b2 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.2.20260802.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.2.20260816.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "069715e146372ce5513e1d51bff5543fc1e55150"
+SRCREV = "8495a124e859685a21fdf575b83955ce8e7c48f2"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https;tag=p${PV}"
 
 
-- 
2.43.0



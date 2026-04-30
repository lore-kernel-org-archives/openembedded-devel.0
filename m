Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAA1ACD13DE
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 10:50:18 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17452.1777546214865337242
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:50:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nlkdPJTl;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1777546215; x=1809082215;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=642Nhl6rbciyt5NtpB5D474A0NApneVyoBX8jtrD4BQ=;
  b=nlkdPJTlVCBuTVrGKXkhyta65NJin1ZNS/blMNfNUKWthtpaeHI3+PdL
   ZTId61a+IjxVVxS+283tBHj9sot/kOE4QCz6zktinjrmd7StiiNfiirZq
   E3o1QB0izjvCVgKI1svTAv80Z6GUA1YeC6925OOucqGY2w4H33JFPdVlv
   WNi9YLj9Pn3o0/qTpqO8dUUYPxaUTY81aUlv9k7BqfSdeZ19g2aZuOn4j
   yikOjEliixtTSugIEZc3Djqo9yaRfQl0Ovu+M0OSt1Vhgo1ORVfiAyth7
   3qgHqmeXxedfD6V7e/+kCdZwMTuL1szhkcm0dSZGoDYTMzsvFoUqucejk
   Q==;
X-CSE-ConnectionGUID: 51e/D12jRASuPdKX7KSTRw==
X-CSE-MsgGUID: +gbUrc0fQuGcV9KQSRZArA==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="238566096"
X-IronPort-AV: E=Sophos;i="6.23,207,1770562800"; 
   d="scan'208";a="238566096"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 19:50:13 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 5094D1002BB5
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:13 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 0BCB8C00777
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:13 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 9D4C4180113C;
	Thu, 30 Apr 2026 10:50:10 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 28/64] python3-asyncinotify: upgrade 4.4.2 -> 4.4.4
Date: Thu, 30 Apr 2026 18:48:47 +0800
Message-ID: <20260430104924.1106-28-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260430104924.1106-1-wangmy@fujitsu.com>
References: <20260430104924.1106-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126697

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-asyncinotify_4.4.2.bb => python3-asyncinotify_4.4.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-asyncinotify_4.4.2.bb => python3-asyncinotify_4.4.4.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-asyncinotify_4.4.2.bb b/meta-python/recipes-devtools/python/python3-asyncinotify_4.4.4.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-asyncinotify_4.4.2.bb
rename to meta-python/recipes-devtools/python/python3-asyncinotify_4.4.4.bb
index bdda38734d..f2f868e972 100644
--- a/meta-python/recipes-devtools/python/python3-asyncinotify_4.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-asyncinotify_4.4.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://gitlab.com/Taywee/asyncinotify"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f75d2927d3c1ed2414ef72048f5ad640"
 
-SRC_URI[sha256sum] = "52ad97aa5332dd78592ab9c64171f2953447d98f9170b9bd440c5d19b17d0416"
+SRC_URI[sha256sum] = "a8afc92bec6666807ca50524156fca22655325cba6e2b51d842b8ec0d399c708"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0



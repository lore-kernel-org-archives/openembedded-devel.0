Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0835CCD190
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 09:21:28 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.10962.1760433680904667142
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 02:21:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=lfAfjtpH;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1760433681; x=1791969681;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=N/G+BuQWZZLv8aRKMRnFmIq59KLjUs6ZFq5Yb4nAMiU=;
  b=lfAfjtpH6wv1Jsxrd2vLeRQYTWEj30JYi+down1iF0zCDITsVFIEGc2e
   bgQ1WKN1RALXWXXKcwbZfB8sEAA9zZqVPW9K3fcBWU60EVxuTRsKT/KXw
   Fbm6grsJjjdRuhz4AuSOUbtRCgzQgw+UDvZrOIQnMlHIaK4m83/ILDvrZ
   DQQ584Bb6itlHrx5+3JSI/d2QOwZkwC2j9SwkwSrJVMkkIKTVJwKNdKzf
   +EPTFosf8S7KyncWxgKf/1ViGO5ay1IdMSiMvUUo+yjJXT98JuoHAQcFK
   jmePpFdDbasGNHZ3m58zUo2XkySGbChv9S8ZxI+mVeplULzdlx2wmNgN0
   g==;
X-CSE-ConnectionGUID: 9uxgNIbsRZ6Y/O/0oaUihA==
X-CSE-MsgGUID: eF3nkFeXTG2RHvGyVFddDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="215839031"
X-IronPort-AV: E=Sophos;i="6.19,227,1754924400"; 
   d="scan'208";a="215839031"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 18:21:19 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 55102820701
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:21:19 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 112F314003B2
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:21:19 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 7D73F101BB7E;
	Tue, 14 Oct 2025 09:21:16 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 43/44] spdlog: upgrade 1.15.3 -> 1.16.0
Date: Tue, 14 Oct 2025 17:19:26 +0800
Message-ID: <20251014091927.493-43-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251014091927.493-1-wangmy@fujitsu.com>
References: <20251014091927.493-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:21:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120600

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../spdlog/{spdlog_1.15.3.bb => spdlog_1.16.0.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/spdlog/{spdlog_1.15.3.bb => spdlog_1.16.0.bb} (91%)

diff --git a/meta-oe/recipes-support/spdlog/spdlog_1.15.3.bb b/meta-oe/recipes-support/spdlog/spdlog_1.16.0.bb
similarity index 91%
rename from meta-oe/recipes-support/spdlog/spdlog_1.15.3.bb
rename to meta-oe/recipes-support/spdlog/spdlog_1.16.0.bb
index d03f01d3a8..7efa65697f 100644
--- a/meta-oe/recipes-support/spdlog/spdlog_1.15.3.bb
+++ b/meta-oe/recipes-support/spdlog/spdlog_1.16.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/gabime/spdlog/wiki"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9573510928429ad0cbe5ba4de77546e9"
 
-SRCREV = "6fa36017cfd5731d617e1a934f0e5ea9c4445b13"
+SRCREV = "486b55554f11c9cccc913e11a87085b2a91f706f"
 SRC_URI = "git://github.com/gabime/spdlog.git;protocol=https;branch=v1.x;tag=v${PV}"
 
 DEPENDS += "fmt"
-- 
2.43.0



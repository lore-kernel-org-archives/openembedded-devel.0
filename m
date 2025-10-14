Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3CC3CCD187
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 09:21:28 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.10959.1760433679079137790
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 02:21:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LXa2L6mt;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1760433679; x=1791969679;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ug94TVnIiljkQIudUt6PQNZtakAOYK9U5DU+6cydnrs=;
  b=LXa2L6mt1MAPDS0ewjVVVbE02OLnMeSbSyZT3M/Ibhg7ZLYnj1de9ETF
   D23x2szcU2FbnPD1ItCqAVWc/57iEB+TNHZjFeOwP7ipgN3Qzl3NSvr+o
   Gs4QFIFVBA6VzQ4EuJhPWwecQomb8AEJ0udswHeWGl3FPaHcJIQBfWGN5
   Zys46hvePHr9Kd0wg1PFpLsldgkyUbOpIS6AAbJJfwqQat0ok0q4zX3Uh
   sCwnQaHNYCY3+9DLHfXdnCqoGu3km7s251pWth5BpDDznr1Te4fnGjCoK
   NRDdOHfqQrGxpeKF1Q8dlr86kAMlRQ0fIvvjtMdt5ABvd4F25Y7T7GELc
   Q==;
X-CSE-ConnectionGUID: ornmk+u+SG214rw89guCCg==
X-CSE-MsgGUID: NG42AdG1QdGsCvab+c30qA==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="194722709"
X-IronPort-AV: E=Sophos;i="6.19,227,1754924400"; 
   d="scan'208";a="194722709"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 18:21:17 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 7E68BC01584
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:21:17 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 3A62514003B2
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:21:17 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id A950A101BB7B;
	Tue, 14 Oct 2025 09:21:14 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 42/44] sip: upgrade 6.12.0 -> 6.13.1
Date: Tue, 14 Oct 2025 17:19:25 +0800
Message-ID: <20251014091927.493-42-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251014091927.493-1-wangmy@fujitsu.com>
References: <20251014091927.493-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:21:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120599

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/sip/{sip_6.12.0.bb => sip_6.13.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/sip/{sip_6.12.0.bb => sip_6.13.1.bb} (87%)

diff --git a/meta-oe/recipes-devtools/sip/sip_6.12.0.bb b/meta-oe/recipes-devtools/sip/sip_6.13.1.bb
similarity index 87%
rename from meta-oe/recipes-devtools/sip/sip_6.12.0.bb
rename to meta-oe/recipes-devtools/sip/sip_6.13.1.bb
index 20e705f1a6..1f7c3e9afd 100644
--- a/meta-oe/recipes-devtools/sip/sip_6.12.0.bb
+++ b/meta-oe/recipes-devtools/sip/sip_6.13.1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=236276327275fdb261636fb40b18d88d"
 inherit pypi python_setuptools_build_meta python3native
 
 PYPI_PACKAGE = "sip"
-SRC_URI[sha256sum] = "083ced94f85315493231119a63970b2ba42b1d38b38e730a70e02a99191a89c6"
+SRC_URI[sha256sum] = "d065b74eca996f29f1f0831ad321efaecf9906759b09466edc45349df7be6cd0"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.43.0



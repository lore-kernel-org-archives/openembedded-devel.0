Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BABEC43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 09:22:50 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16868.1782811369638600450
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2026 02:22:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Z4vjg9WL;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782811370; x=1814347370;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KRKe9dv3q/dk2j1fcwyp4776LjLpnmqZKAszeBkKqqI=;
  b=Z4vjg9WL+87fGhrDZ1teFRMj4hn4KKfRRaNZKmjk+I/bh/IcjhdVXzEi
   wJY6UKHPTc8XkN5ibeTkcRpOOOyzUKNw9k1XlFHeiPNJrLN+/gtD4p7c7
   7M/gavvJib4bFqobLQRoFs3fjg8ks3VZ9fGz/fw9IF1uRcPwnSzwE2wEK
   z370tiCwaOrobDM31+gMc3wPcPGyj2xpPpBDAULPfXhls1i8PjlQsjF/K
   rnG09u6Je9w826E8AL+Wd7bzpHxuto208NMkoZBY0tjqmJwBiI7IPx3Vp
   QPBaxK2KAmAB1yZ47zt1zPufSREw+/UlZRQwNffFPvwPtFRmxczzZ3tOq
   A==;
X-CSE-ConnectionGUID: 7Zl4igY1SjahqkZ//c4q6Q==
X-CSE-MsgGUID: wifJsE0oQMangyVbHt4d9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="249218242"
X-IronPort-AV: E=Sophos;i="6.24,233,1774278000"; 
   d="scan'208";a="249218242"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 18:22:48 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 1D13042A307
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:48 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id C82D41804141
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:47 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id F2A24826FEE;
	Tue, 30 Jun 2026 09:22:45 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 24/37] python3-mlcommons-loadgen: upgrade 6.0.14 -> 6.0.15
Date: Tue, 30 Jun 2026 17:21:52 +0800
Message-ID: <20260630092206.322-24-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260630092206.322-1-wangmy@fujitsu.com>
References: <20260630092206.322-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127966

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ns-loadgen_6.0.14.bb => python3-mlcommons-loadgen_6.0.15.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python3-mlcommons-loadgen/{python3-mlcommons-loadgen_6.0.14.bb => python3-mlcommons-loadgen_6.0.15.bb} (91%)

diff --git a/meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_6.0.14.bb b/meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_6.0.15.bb
similarity index 91%
rename from meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_6.0.14.bb
rename to meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_6.0.15.bb
index 3299f25080..9a9e777658 100644
--- a/meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_6.0.14.bb
+++ b/meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_6.0.15.bb
@@ -21,7 +21,7 @@ SRC_URI += " \
 PYPI_PACKAGE = "mlcommons_loadgen"
 UPSTREAM_CHECK_PYPI_PACKAGE = "mlcommons_loadgen"
 
-SRC_URI[sha256sum] = "9a56e361b4614938acdb6a601cc9c57ce551809f831023401bbac6dd7eb00970"
+SRC_URI[sha256sum] = "5b5c5c0545526a767c35a5f295a7680e9380b5a08bcea058422c61bc9f608fb5"
 
 # Because the pyproject.toml contains invalid requirements.
 INSANE_SKIP += "pep517-backend"
-- 
2.43.0



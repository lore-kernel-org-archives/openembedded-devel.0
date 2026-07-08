Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 306BDC44507
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 09:46:13 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4732.1783503971678613665
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jul 2026 02:46:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=awrHUVy+;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1783503971; x=1815039971;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=B3nPpl+Bwe5PYxd1eDcXmJ5E8H7gRuVj9QLbwia7uDE=;
  b=awrHUVy+X6n4xqYzcZ7pfIiWGRNehPl+FVekz6JOCY+as76WBFHUM5v7
   yqtA1jFetUO8od1UwCmWa1FIVS6Tzpt+YCmyQpRiHKxyv+d/+TacByVLN
   WY2hg0D3ciGVfBkDOhyp8pvp8Y3561CUuYFsaU1ZcBqgcwKgLzerU1QR6
   aP2SK7GlFyvvB2dq4iGr1UCBVpcfJ1X5fj3g2lCWIyB+UvybbEZUX7fUm
   IRuywR3sxd8iDw8DpAWtPuJyQrSavLZsuZzAtUajoBJY7eM0UCNXN6JML
   PJNGcA3OOPDwW86iO16CCpbn+/Mn1x9JkaA13F3ntuxTCGCE+82VC2LgG
   g==;
X-CSE-ConnectionGUID: CvudrG8gS4+AWLQeceyvtA==
X-CSE-MsgGUID: mDjw/xTzTbWKRCaFrS4wVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="246699943"
X-IronPort-AV: E=Sophos;i="6.25,153,1779116400"; 
   d="scan'208";a="246699943"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 18:46:10 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 14B3E42A313
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:46:10 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id B7236100D22F
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:46:09 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id C9B521801131;
	Wed,  8 Jul 2026 09:46:07 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 35/37] upower: upgrade 1.91.2 -> 1.91.3
Date: Wed,  8 Jul 2026 17:44:45 +0800
Message-ID: <20260708094508.2060-35-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260708094508.2060-1-wangmy@fujitsu.com>
References: <20260708094508.2060-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Jul 2026 09:46:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128106

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../upower/{upower_1.91.2.bb => upower_1.91.3.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/upower/{upower_1.91.2.bb => upower_1.91.3.bb} (95%)

diff --git a/meta-oe/recipes-support/upower/upower_1.91.2.bb b/meta-oe/recipes-support/upower/upower_1.91.3.bb
similarity index 95%
rename from meta-oe/recipes-support/upower/upower_1.91.2.bb
rename to meta-oe/recipes-support/upower/upower_1.91.3.bb
index d6505974e9..8213c5e15f 100644
--- a/meta-oe/recipes-support/upower/upower_1.91.2.bb
+++ b/meta-oe/recipes-support/upower/upower_1.91.3.bb
@@ -13,7 +13,7 @@ DEPENDS = " \
 "
 
 SRC_URI = "https://gitlab.freedesktop.org/${BPN}/${BPN}/-/archive/v${PV}/${BPN}-v${PV}.tar.bz2"
-SRC_URI[sha256sum] = "f07f19b78a43a5053973d95a2fe96a12ede270b8db232b2e2c4ac4186fb42539"
+SRC_URI[sha256sum] = "12227b3dcd34c5097bbda25984b192ea0bd5e11dce479358d9ef70415a38e4b6"
 S = "${UNPACKDIR}/${BPN}-v${PV}"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/${BPN}/${BPN}/-/tags"
-- 
2.43.0



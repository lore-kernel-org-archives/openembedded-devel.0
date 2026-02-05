Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D26EE8B394
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 05:16:58 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14236.1770268613674459674
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 21:16:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=paAKeAIb;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770268614; x=1801804614;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=n53PW+ZuWZg42+vz/phdnIHDiEatXacExUqsbRZ5ugk=;
  b=paAKeAIbVttUve1UxWkfNfygcSLi0k6dfsB+splX3Pd3XBJLA7PVEsex
   I45ArhgKu32nhvwIEVEZ7LQU50LtVULsHgbojNmhjTDyUXPZkSD+Eztah
   S864Wsao5I5AWi65hYBjgDMnPmNvPe8MBikpAWqhrU2JDGvBXl1QmdS++
   7qR/m5DfqPIG64FfLNwZjAshrg3Yts6xcMKJMiJLOSoCKjT3LtOFiWnLe
   vS99tlLIafCOZp1zkKD0rLRG66m1dhdryHmXUYD3ue1C4HcDMIZa6xb4L
   9WWnvah1qV9CPnoOlrvRV074LUKL0xJyYhCKBPfooYx+5RZKg5Y6Fyusr
   A==;
X-CSE-ConnectionGUID: unR3yjo/TaCGD27U3UOE1w==
X-CSE-MsgGUID: 7ZGkvUeXRjmy1HNZkDbQAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="228554749"
X-IronPort-AV: E=Sophos;i="6.21,274,1763391600"; 
   d="scan'208";a="228554749"
Received: from unknown (HELO mail.fujitsu.com) ([51.138.80.169])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 14:16:52 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.fujitsu.com (Postfix) with ESMTPS id 10F906751
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Feb 2026 05:16:52 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id B4AA01C002E1
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Feb 2026 05:16:51 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 21A2F20000C1;
	Thu,  5 Feb 2026 05:16:48 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 24/24] xorgxrdp: upgrade 0.10.4 -> 0.10.5
Date: Thu,  5 Feb 2026 13:14:34 +0800
Message-ID: <20260205051435.1366-24-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260205051435.1366-1-wangmy@fujitsu.com>
References: <20260205051435.1366-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 05:16:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124176

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fix bug in Chrome pointer detection
- CI: Update FreeBSD xrdp dependency

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-xrdp/{xorgxrdp_0.10.4.bb => xorgxrdp_0.10.5.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/xorg-xrdp/{xorgxrdp_0.10.4.bb => xorgxrdp_0.10.5.bb} (94%)

diff --git a/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.10.4.bb b/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.10.5.bb
similarity index 94%
rename from meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.10.4.bb
rename to meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.10.5.bb
index f111c4eed9..225de422e6 100644
--- a/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.10.4.bb
+++ b/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.10.5.bb
@@ -12,7 +12,7 @@ REQUIRED_DISTRO_FEATURES = "x11 pam"
 
 SRC_URI = "git://github.com/neutrinolabs/xorgxrdp.git;branch=v0.10;protocol=https;tag=v${PV}"
 
-SRCREV = "2b1f913f4aa6b88d63d9ce9302c61cb0e39483f6"
+SRCREV = "c2d3cbafebe00be3221f985c06ef6b97f1c63790"
 
 FILES:${PN} += "${libdir}/xorg/modules/*"
 FILES:${PN}-staticdev += " \
-- 
2.43.0



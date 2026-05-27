Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3F38CD6E45
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 09:48:41 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16927.1779875312736448436
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2026 02:48:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HTR5QbGO;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779875312; x=1811411312;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oVojqO0H9e9nPnGuK62xdXxDeIM5nUAlnmSW0AjcP3E=;
  b=HTR5QbGOEupiwyj0LCzWLnF4w0VrANWaGqsVqDxCAl3ct75o7O/GcPZW
   5474zFgB3Tb+jQfqtgk/Zew3NX3mPjAbNQFGT9Zh2jVYG0bmmU6d4ny4l
   uUSwRRu6lmbco7hrklLKS4ZHNF6wtELctXATlGK6cDc2ZXRSbNxvpx74h
   gbg+0Z9HrMhN0EHkgiEsmsSD+k4hIOZnNkpPNbWAlBsNEGBpiLWjR4pc6
   ljLPLY/B/0bbd3Fhy8XxR0E49Cu61IL32sZjSOZrS5KYoUF92qJ5TWHDT
   xwZY6k0JSxUb0B30FyDVCeD3UdLwxIQSHikDrXAGfde3GA57nYdcNBrq3
   Q==;
X-CSE-ConnectionGUID: AhZWnNJPQ3SfV1r1UBx1Ew==
X-CSE-MsgGUID: RM3kd59aQqyWS/uoZxvLRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="245264177"
X-IronPort-AV: E=Sophos;i="6.24,171,1774278000"; 
   d="scan'208";a="245264177"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 18:48:31 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 010B31C1C725
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:48:31 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id A868B18591D0
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:48:30 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 9F69482A2C9;
	Wed, 27 May 2026 09:48:28 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 07/56] libdevmapper,lvm2: upgrade 2.03.40 -> 2.03.41,2.03.40 -> 2.03.41
Date: Wed, 27 May 2026 17:47:16 +0800
Message-ID: <20260527094805.2039-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260527094805.2039-1-wangmy@fujitsu.com>
References: <20260527094805.2039-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:48:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127214

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index e0319d77be..675c33cedd 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -18,8 +18,8 @@ SRC_URI = "git://sourceware.org/git/lvm2.git;branch=main;tag=${PV_TAG} \
            file://0001-include-libgen.h-for-basename.patch \
            "
 
-SRCREV = "c48a3842714858d2de16c341b249be4a073f3325"
-PV = "2.03.40"
+SRCREV = "539014d16099ee8d46318b49e9014332e2dc7ef3"
+PV = "2.03.41"
 PV_TAG = "v${@d.getVar('PV').replace('.', '_')}"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\_\d+)+)"
-- 
2.43.0



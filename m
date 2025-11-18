Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A751ACCD19A
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 09:09:18 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8405.1763456949034386068
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 01:09:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=oUNNi3rm;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1763456949; x=1794992949;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NtxISMWDEmP7PnwrAuj/84tSqkJoGIqj2TtHHz4JEbk=;
  b=oUNNi3rmMCr3ctoDlx+6Fu9QabD1fBB2kOhUZtNV43jDp5aoVQo3azCl
   zsfrVKdrF524jdqMQ7jBAXVFarNoBnxYsDIk9ng7MnJWCMZmEpGexjcbQ
   acRh6QXM5lP92BjiTk7H+bXNKFn19dqQLuSYs/ecwKDrxpocz2Z8y+q7J
   AYVGJP9LkQL9RyuY1nmLAdYXifDaaY9jY11ep3JdBGDnPOPag6x//+Y+6
   AHzCH3sKsb7tAf67HWctWlN5OuK5x8jj87gij0jjt6OwQSuP0rYCOKt71
   JkcjyJX3rECOUHE0n5F43TORuGKlMaat9DAXMl3nu9uBsF7Z0Qcw4hUFw
   A==;
X-CSE-ConnectionGUID: p/1lrcevQdqyEFfv8VCX+w==
X-CSE-MsgGUID: 5hTZu8eqRfK7n7SbQwRr2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="208179075"
X-IronPort-AV: E=Sophos;i="6.19,314,1754924400"; 
   d="scan'208";a="208179075"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 18:09:07 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 97E8E42A32E
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:07 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 4C274C02E45
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:07 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id B68F614002E5;
	Tue, 18 Nov 2025 09:09:04 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 09/29] nbdkit: upgrade 1.45.12 -> 1.45.14
Date: Tue, 18 Nov 2025 17:08:26 +0800
Message-ID: <20251118090846.1484-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251118090846.1484-1-wangmy@fujitsu.com>
References: <20251118090846.1484-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121820

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nbdkit/{nbdkit_1.45.12.bb => nbdkit_1.45.14.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/nbdkit/{nbdkit_1.45.12.bb => nbdkit_1.45.14.bb} (96%)

diff --git a/meta-networking/recipes-support/nbdkit/nbdkit_1.45.12.bb b/meta-networking/recipes-support/nbdkit/nbdkit_1.45.14.bb
similarity index 96%
rename from meta-networking/recipes-support/nbdkit/nbdkit_1.45.12.bb
rename to meta-networking/recipes-support/nbdkit/nbdkit_1.45.14.bb
index 23a7281536..c64857387f 100644
--- a/meta-networking/recipes-support/nbdkit/nbdkit_1.45.12.bb
+++ b/meta-networking/recipes-support/nbdkit/nbdkit_1.45.14.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=26250adec854bc317493f6fb98efe049"
 SRC_URI = "git://gitlab.com/nbdkit/nbdkit.git;protocol=https;branch=master;tag=v${PV} \
            file://0002-plugins-Avoid-absolute-buildpaths-in-binaries.patch \
            "
-SRCREV = "77182705215dc6f319cfa8eb3500861fbbb9d271"
+SRCREV = "0492849383c2093dae738f171158b45a6d1d62fc"
 
 
 DEPENDS = "curl xz e2fsprogs zlib"
-- 
2.43.0



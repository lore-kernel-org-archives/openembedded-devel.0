Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29131103E31E
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 10:53:17 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18525.1773312794926996961
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 03:53:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hXDqR84m;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773312795; x=1804848795;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2gO3kXIuCpmD4Yjup7ZUPEqlKg6g+UILOSA6B+HQLW4=;
  b=hXDqR84mzluOGOiEiN4za+3zDsl8miCQObZDgAFYq/7W26WGWd5X/wgT
   2swJAgTir0ynKusiu7GhlwGbcpTkWOjXTwFfL/MVm/Jx7PNe68ezRlH9D
   G4jFZ+59f63rcMoeem7/4wrf9/38GZyV/LbKhU3Om3SZJWCkCvuUR7by9
   A48P7jmjyNsfgSxEaQTNh3SzAjlGj3FdMkaPPsS54wSSCYNkQcjNTt0ne
   3sj3hRfxOd7INGYBoykvQPWnfeEy8LsHqZB/KlPJ6OFGEsHCotsurFoYL
   OmTu85f+nXJz/2slCVrvsPOOGnsu4UpozDXs/+EiEomLi40I4WeYeXWV9
   g==;
X-CSE-ConnectionGUID: UhuF7vrXSN2nIRdr3XczKA==
X-CSE-MsgGUID: /AMu0wVORBKyR44+NdSbQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="211824347"
X-IronPort-AV: E=Sophos;i="6.23,116,1770562800"; 
   d="scan'208";a="211824347"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 19:53:13 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 70F165C0B
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:13 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 247F21009E1B
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:13 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 431A818005B4;
	Thu, 12 Mar 2026 10:53:09 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 22/64] nbdkit: upgrade 1.47.3 -> 1.47.5
Date: Thu, 12 Mar 2026 18:51:38 +0800
Message-ID: <20260312105220.1856-22-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260312105220.1856-1-wangmy@fujitsu.com>
References: <20260312105220.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125122

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nbdkit/{nbdkit_1.47.3.bb => nbdkit_1.47.5.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/nbdkit/{nbdkit_1.47.3.bb => nbdkit_1.47.5.bb} (96%)

diff --git a/meta-networking/recipes-support/nbdkit/nbdkit_1.47.3.bb b/meta-networking/recipes-support/nbdkit/nbdkit_1.47.5.bb
similarity index 96%
rename from meta-networking/recipes-support/nbdkit/nbdkit_1.47.3.bb
rename to meta-networking/recipes-support/nbdkit/nbdkit_1.47.5.bb
index e1da2d3288..5ec440fc18 100644
--- a/meta-networking/recipes-support/nbdkit/nbdkit_1.47.3.bb
+++ b/meta-networking/recipes-support/nbdkit/nbdkit_1.47.5.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=26250adec854bc317493f6fb98efe049"
 SRC_URI = "git://gitlab.com/nbdkit/nbdkit.git;protocol=https;branch=master;tag=v${PV} \
            file://0002-plugins-Avoid-absolute-buildpaths-in-binaries.patch \
            "
-SRCREV = "49a3178b52509a8a8fd0e5a1c49846bba24e3eac"
+SRCREV = "131372494a384a2ee21b97ec9375b7a55636a417"
 
 
 DEPENDS = "curl xz e2fsprogs zlib"
-- 
2.43.0



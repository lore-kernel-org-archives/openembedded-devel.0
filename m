Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2C68103E316
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 10:53:06 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18518.1773312782336806875
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 03:53:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SMXrOSK7;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773312782; x=1804848782;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FvKvg1C1x0avP8TgQpeVdr7J7/T0dFbQWdkyxSpZCWM=;
  b=SMXrOSK7c/vRW1Radm3ApwgqOrce3UqRjVzMQpJANPkFOdF4fDCxcvjy
   PKnzZvXrQKa1i2cj/MMl+WxNqjTyT4G0xBPE1m6EvcArBhAO1VexPZUNR
   A3ygowhWSw0wn4vFiGm1283hOEWP0Cd5OFMVdb1/A41DSh4Sla+LvnERb
   aBziqbRfyae2/JgTwaInfhboh337/LBDlYEjJbowzqh2ACguuLqi8W4eB
   CWjdWj5oaqBTFM5vdrXWmm5LngmF9kSDhHnSJ7cMzXO1b6F5eBHYMoPM7
   EXplzgpy+MHy+VzBEjCbMijgTyD7zmFg+s1t81ZyU2Jo5wS9VB3uZZX9M
   w==;
X-CSE-ConnectionGUID: Kae60Ch4T5SeLeLXXL3Ulw==
X-CSE-MsgGUID: opsuIXDdTqibpnEgci5cYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="211989655"
X-IronPort-AV: E=Sophos;i="6.23,116,1770562800"; 
   d="scan'208";a="211989655"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 19:53:00 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 9D096C00347
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:00 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 4FA0E1809C28
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:00 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 51EB718005BE;
	Thu, 12 Mar 2026 10:52:56 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 16/64] libio-compress-perl: upgrade 2.217 -> 2.218
Date: Thu, 12 Mar 2026 18:51:32 +0800
Message-ID: <20260312105220.1856-16-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260312105220.1856-1-wangmy@fujitsu.com>
References: <20260312105220.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125116

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ibio-compress-perl_2.217.bb => libio-compress-perl_2.218.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libio/{libio-compress-perl_2.217.bb => libio-compress-perl_2.218.bb} (93%)

diff --git a/meta-perl/recipes-perl/libio/libio-compress-perl_2.217.bb b/meta-perl/recipes-perl/libio/libio-compress-perl_2.218.bb
similarity index 93%
rename from meta-perl/recipes-perl/libio/libio-compress-perl_2.217.bb
rename to meta-perl/recipes-perl/libio/libio-compress-perl_2.218.bb
index 3b9784d1dd..027788ce69 100644
--- a/meta-perl/recipes-perl/libio/libio-compress-perl_2.217.bb
+++ b/meta-perl/recipes-perl/libio/libio-compress-perl_2.218.bb
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=a05fdd79b87a410b617
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/P/PM/PMQS/IO-Compress-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "4d075e04eeef3c451f5e7f572ebd695738bad033e8cd32cf519c68edb3f39dc7"
+SRC_URI[sha256sum] = "596bd413513b5151af645eef1a718470e0ac9c2233135a0428eb1ffc2995d95f"
 
 S = "${UNPACKDIR}/IO-Compress-${PV}"
 
-- 
2.43.0



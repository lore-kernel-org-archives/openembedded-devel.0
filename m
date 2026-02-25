Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FCD3EFD22F
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 09:38:21 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42048.1772012296931061437
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Feb 2026 01:38:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=X5uLLk5L;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772012297; x=1803548297;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3ZgxJ9X8zqOiuZsQHfTbBck77XIn31Rx5Yy7FcZqDFk=;
  b=X5uLLk5LrWraNJLPsGp/dJDxrlFgFVu9OTWbw0gSlMkVpV2F2Ibrtjoh
   khNUsaqnCpRtHv2VqZA0yYVWdJuEqhInlPjw9lYpqdv9jhqJnrAjKZ6MB
   ZJTDAW/CqshBpp7beTyCPvYpyXa5Z3R1zMMRPWMkSBlPEBqKsBx/XE0W1
   A4dvgCuEGBwHbGFw0nNUNWgoadla8a18kE+5x6vSxek/tDNkJy/RoJgVJ
   cziqDXEMcxCMbFi/xFqyM/coqSN1sr56cP9jh4gF5JN4L1+cLWBF8jq4M
   LqRaYbf++uui4hOCnxBo4k1+L5d0FHQcdvdmjzPapDVAq+WqgEpQ213cZ
   w==;
X-CSE-ConnectionGUID: OftoM1+hQBeC3I92/MDqwA==
X-CSE-MsgGUID: psYPQjlnRR+XIHGxX6UdYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="219620591"
X-IronPort-AV: E=Sophos;i="6.21,310,1763391600"; 
   d="scan'208";a="219620591"
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.fujitsu.com (Postfix) with ESMTPS id 816C14071C2
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:38:15 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 300491C0094B
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:38:15 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 5EC21101BB42;
	Wed, 25 Feb 2026 09:38:12 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 20/33] mctp: upgrade 2.4 -> 2.5
Date: Wed, 25 Feb 2026 17:37:14 +0800
Message-ID: <20260225093727.1284-20-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260225093727.1284-1-wangmy@fujitsu.com>
References: <20260225093727.1284-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:38:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124632

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/mctp/{mctp_2.4.bb => mctp_2.5.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/mctp/{mctp_2.4.bb => mctp_2.5.bb} (96%)

diff --git a/meta-networking/recipes-support/mctp/mctp_2.4.bb b/meta-networking/recipes-support/mctp/mctp_2.5.bb
similarity index 96%
rename from meta-networking/recipes-support/mctp/mctp_2.4.bb
rename to meta-networking/recipes-support/mctp/mctp_2.5.bb
index 27750d4bfd..a8787d3f2b 100644
--- a/meta-networking/recipes-support/mctp/mctp_2.4.bb
+++ b/meta-networking/recipes-support/mctp/mctp_2.5.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-only"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4cc91856b08b094b4f406a29dc61db21"
 
-SRCREV = "8b019a3e4d335c7d31099762762dfee2e4705d37"
+SRCREV = "07c7a5d526f686da89bc9ae9cad917e46652b272"
 
 SRC_URI = "git://github.com/CodeConstruct/mctp;branch=main;protocol=https;tag=v${PV}"
 
-- 
2.43.0



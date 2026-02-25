Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86682EFD237
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 09:38:41 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41959.1772012311979353921
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Feb 2026 01:38:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nBmo1f40;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772012311; x=1803548311;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Uttm4ZjJLZ3cz9DYpn1rmzxA3lu6M53SnJNq0QoWVS0=;
  b=nBmo1f404+A94Lo+Mv2i09D7980fyvmtuBgAqcyJbVTZdrmb54sp4rYo
   gUW6idZMvHRdjQbdcmDomYG6almZVNsni+pDtNXtog/S5Veixy4bg8Pop
   RDPI+U5txx1sAQvT3GowwglsS6o3DS0x4XqygeWRtzoLIZSfmiBEkFKdp
   3lKqtuEIHi8i6GJNTzrK3AWXOJtPLBAbgwYUjKftfqbjVVn1BfnZZT1wh
   IqwSsINX4xyVy4xca9xzQZeduWGGSbAWfRg0lwxN7rHyewR5L3agUQzyI
   ghd+x74htYPF/3yWaA3R/1t+1Lnh7CMemT6ESKpF0L03tF6P7d1QuyiXj
   Q==;
X-CSE-ConnectionGUID: ThRo6o25SKepSD/eGYXQ/w==
X-CSE-MsgGUID: VQ3PhcS/Stao+4+yOPELeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="235192661"
X-IronPort-AV: E=Sophos;i="6.21,310,1763391600"; 
   d="scan'208";a="235192661"
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.fujitsu.com (Postfix) with ESMTPS id 911EB1C000A4
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:38:30 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 460BF10003A2
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:38:30 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 6E5D2101BB76;
	Wed, 25 Feb 2026 09:38:27 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 27/33] pcsc-tools: upgrade 1.7.3 -> 1.7.4
Date: Wed, 25 Feb 2026 17:37:21 +0800
Message-ID: <20260225093727.1284-27-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260225093727.1284-1-wangmy@fujitsu.com>
References: <20260225093727.1284-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:38:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124639

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- 282 new ATRs
- pcsc_scan: display what the program expect from the user

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../pcsc-tools/{pcsc-tools_1.7.3.bb => pcsc-tools_1.7.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/pcsc-tools/{pcsc-tools_1.7.3.bb => pcsc-tools_1.7.4.bb} (92%)

diff --git a/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.7.3.bb b/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.7.4.bb
similarity index 92%
rename from meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.7.3.bb
rename to meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.7.4.bb
index 5aecc2df89..2a003cbb46 100644
--- a/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.7.3.bb
+++ b/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.7.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRC_URI = "git://github.com/LudovicRousseau/pcsc-tools;protocol=https;branch=master;tag=${PV}"
 
-SRCREV = "12f62c67650e1bfb491c18242a75fa61993c4cb8"
+SRCREV = "52c6a3fda367d2badf618a2e0b8f9e59a02f16ff"
 
 inherit autotools pkgconfig
 
-- 
2.43.0



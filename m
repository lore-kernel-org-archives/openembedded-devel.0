Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03DCAC44501
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 09:45:31 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4897.1783503917836852504
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jul 2026 02:45:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=uGZCNFIM;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1783503923; x=1815039923;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5UntgLzlUm9OFljvWuu7lTGiFhFyf567/ek9NcQQwT8=;
  b=uGZCNFIMndmByZRow+R8GaL/u5uDvdc1uKfsMY7SpgjnoxGT2HT/tYyQ
   KQxeNKf9ZtyX/IKoFexVzX1nuvl/ZgYdqdKCnei6gSnedDLFe/2X8Huc4
   GqznxmRenUCOmUxI2tsjfQKLs+lRuRZ5HEIW//SwQ4VTdm7g4STwnnVIW
   76R70b3OieYXAEcBuvoopGTF7FgGd8cIn9PClz0yGfX8X1HVpJfnUKdd8
   ImP34PFp5daJoQ2SQLd+0oEbsEK58RXbGDj/2fSXUMaa3Vm+Q50ITf9T6
   QQYLVxT5iHI3ojQ3h4+6vmCbAc53N2J/kwYd098aXEO4Gq3W83wWK2mIv
   A==;
X-CSE-ConnectionGUID: 3zVl5sfvTl23T6ZNVhCmgg==
X-CSE-MsgGUID: 56TulBzxQZOc1Pnp6SwgRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="234654550"
X-IronPort-AV: E=Sophos;i="6.25,153,1779116400"; 
   d="scan'208";a="234654550"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 18:45:22 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id AB3FBC006F5
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:45:22 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 606E8C01816
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:45:22 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 8B34C1801131;
	Wed,  8 Jul 2026 09:45:20 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 05/37] imagemagick: upgrade 7.1.2-26 -> 7.1.2-27
Date: Wed,  8 Jul 2026 17:44:15 +0800
Message-ID: <20260708094508.2060-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260708094508.2060-1-wangmy@fujitsu.com>
References: <20260708094508.2060-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Jul 2026 09:45:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128076

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{imagemagick_7.1.2-26.bb => imagemagick_7.1.2-27.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.2-26.bb => imagemagick_7.1.2-27.bb} (99%)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-26.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-27.bb
similarity index 99%
rename from meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-26.bb
rename to meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-27.bb
index fa4a6dfef8..cfdff227db 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-26.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-27.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://imagemagick-ptest.sh \
 "
 
-SRCREV = "38ba210c5e5a660013d632a3d33c431e658befcc"
+SRCREV = "b661ac969aa3a0d326690f95830aab246569f090"
 
 inherit autotools pkgconfig update-alternatives ptest
 export ac_cv_sys_file_offset_bits = "64"
-- 
2.43.0



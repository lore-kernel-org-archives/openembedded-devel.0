Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07B33C53219
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 06:06:59 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5625.1785218817334174294
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jul 2026 23:06:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OOmnewnO;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785218817; x=1816754817;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=efLijKoKkkaVdh4/5jt1hlE5bt5zNBt3Uv0pN5XbRrQ=;
  b=OOmnewnOfQZ5MDS1Z9PANj0T/8lqiXdAJSUFCS6C5SBZ0VTt+MiGihDM
   AWU6xSXk7MfjsGeA1IE9igR9hQOGdaF9H2U/glY2u5ZRn2TjTMkrdzcGc
   shIwnrenYTqaTGS+ttxtnggrmUQtiiiNK9s5LXMKdeEsaK4MC8NNd7JxH
   IeGAwoRNIJUWZani1ta0/ARJpXAWLgHkRM/1z4i9WkgtzYLbYohGdFpXo
   T9y9iqUrxFF0xVQvAG3M3koaN/1yVpB1FXOhEB9yJrFqdS9T+2aQQjEb2
   Zu7ahKKfnMmpPxmWFOhAIVhy5dot7+N4J1gT3xYeKVSSg//N6StWkw7E7
   A==;
X-CSE-ConnectionGUID: tTpMJo+iTLyM714qRPp7WQ==
X-CSE-MsgGUID: ei2xWXNYTS6/m7TDjN3A/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="248832164"
X-IronPort-AV: E=Sophos;i="6.25,189,1779116400"; 
   d="scan'208";a="248832164"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 15:06:55 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 4B4B6E479
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:06:55 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id F1CC21804147
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:06:54 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 432D110005EF
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:06:53 +0000 (UTC)
From: Wang Mingyu <wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] imagemagick: upgrade 7.1.2-27 -> 7.1.2-28
Date: Tue, 28 Jul 2026 14:06:18 +0800
Message-ID: <20260728060645.819-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728060645.819-1-wangmy@fujitsu.com>
References: <20260728060645.819-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:06:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128476

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{imagemagick_7.1.2-27.bb => imagemagick_7.1.2-28.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.2-27.bb => imagemagick_7.1.2-28.bb} (99%)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-27.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-28.bb
similarity index 99%
rename from meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-27.bb
rename to meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-28.bb
index cfdff227db..7fd34dc54c 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-27.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-28.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://imagemagick-ptest.sh \
 "
 
-SRCREV = "b661ac969aa3a0d326690f95830aab246569f090"
+SRCREV = "c2068fb3394af17fb9e3a78c712af2ca67141836"
 
 inherit autotools pkgconfig update-alternatives ptest
 export ac_cv_sys_file_offset_bits = "64"
-- 
2.43.0



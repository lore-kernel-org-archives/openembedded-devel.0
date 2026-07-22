Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7886AC44539
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 10:23:49 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44606.1784715820056900261
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2026 03:23:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gLbIvbrW;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784715821; x=1816251821;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wg3tpzRq8hApLH/njV9COS1R+Q7ANaqhURBMp2b17TY=;
  b=gLbIvbrWKsBIWZywYGdoVzIDV1OJhoxK6pwd7AUDosM3GQRlOmF89XTu
   /lxayDnOCjIj1vy33bSuZ1ScSx8Jbwe8lpGbOyhwbHNgSN9pSe4xbUk34
   Ksg4qDlR8Eb1maqylZXa/nKwD6waE2LQ4d7NFJquKX8dOhVNrY0oX5d8c
   Nwb7TBijpoYffWseWRw1WcZ/kOeyAZg+cYX+RKpnAab0PCw8ByKdZZmaP
   ifQt3/2aaiUEu5//BCSm9cKeqgSNwZJlQzm2kI0Wqypd2/8bRbrj22VnU
   XDSQ4ZZ+tEjDps0ctGGHtEZJxz2GPam7DPoM+aH/lR59w9l5mzGj/ufrO
   Q==;
X-CSE-ConnectionGUID: KGzE691rQh2u9NNP7fbWZQ==
X-CSE-MsgGUID: w7TWZAe1SMSy9DW+8YOzYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="248228207"
X-IronPort-AV: E=Sophos;i="6.25,178,1779116400"; 
   d="scan'208";a="248228207"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 19:23:40 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id E84305527
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:23:39 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (unknown [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 927A9C0387A
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:23:39 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 967A74028B3;
	Wed, 22 Jul 2026 10:23:37 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 07/37] libraw: upgrade 0.22.1 -> 0.22.2
Date: Wed, 22 Jul 2026 18:22:50 +0800
Message-ID: <20260722102320.1019-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260722102320.1019-1-wangmy@fujitsu.com>
References: <20260722102320.1019-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:23:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128377

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libraw/{libraw_0.22.1.bb => libraw_0.22.2.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libraw/{libraw_0.22.1.bb => libraw_0.22.2.bb} (92%)

diff --git a/meta-oe/recipes-support/libraw/libraw_0.22.1.bb b/meta-oe/recipes-support/libraw/libraw_0.22.2.bb
similarity index 92%
rename from meta-oe/recipes-support/libraw/libraw_0.22.1.bb
rename to meta-oe/recipes-support/libraw/libraw_0.22.2.bb
index e134d93cbd..2db0c14a61 100644
--- a/meta-oe/recipes-support/libraw/libraw_0.22.1.bb
+++ b/meta-oe/recipes-support/libraw/libraw_0.22.2.bb
@@ -3,7 +3,7 @@ LICENSE = "CDDL-1.0 OR LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=1d66195044cfbe4327c055d1c9c1a229"
 
 SRC_URI = "git://github.com/LibRaw/LibRaw.git;branch=0.22-stable;protocol=https;tag=${PV}"
-SRCREV = "b860248a89d9082b8e0a1e202e516f46af9adb29"
+SRCREV = "b93f6e45c194f5df9b02a43b1af9a54b4f41f33f"
 
 inherit autotools pkgconfig
 
-- 
2.43.0



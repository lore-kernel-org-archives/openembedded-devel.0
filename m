Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A000CD37B6
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 04:09:08 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.100.1778645338534792891
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 21:08:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tOp+kJfS;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1778645338; x=1810181338;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=N1hS5KBEQw7LrAPrpo52n6FupzfpP6TSFx7qArJjnZU=;
  b=tOp+kJfS73qtvMLDVik41zDwzupq53rCdbB9uZUlbzv9jIn1c2Tdi6gM
   z4nro3GG8BVZcVXTG4Gx8yaA92r2q1C6D4yKpKOashMzmj63EZ+ki817d
   mvhnwcxd/Jy2e1ZWjDKdK/4R2+WEBizuYukum0loeEaZRSkTdFweH4ZGi
   843LEGXBmkPQmPNc8ceOfoCr3M6c/+oIL8yBKzwKzPqdttiLrqedKASxt
   en/WQdh6i4w1K+Ce3UVi1sqEJAhmlIhvDvjbV3vYn/E/I4R/M363+lLrO
   oeil+m2fSVvOpTPSqOh5LigBgvqqwVKXaTc9FVv0aU/Q5A1OyTwmaiRwL
   Q==;
X-CSE-ConnectionGUID: knFgyviuQaeE0hp4jMaTlQ==
X-CSE-MsgGUID: 9SDO/15yQ6m6ioqxpsdC0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="240265152"
X-IronPort-AV: E=Sophos;i="6.23,232,1770562800"; 
   d="scan'208";a="240265152"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:08:57 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id F1A7C5C2C
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:07:56 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 9CEDD1005957
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:07:56 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 15134140008B;
	Wed, 13 May 2026 04:07:53 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 11/56] libcgi-perl: upgrade 4.71 -> 4.72
Date: Wed, 13 May 2026 12:05:10 +0800
Message-ID: <20260513040555.377-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260513040555.377-1-wangmy@fujitsu.com>
References: <20260513040555.377-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:09:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126899

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
     - fix regression due to edge case bug introduced in 4.71

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libcgi/{libcgi-perl_4.71.bb => libcgi-perl_4.72.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libcgi/{libcgi-perl_4.71.bb => libcgi-perl_4.72.bb} (93%)

diff --git a/meta-perl/recipes-perl/libcgi/libcgi-perl_4.71.bb b/meta-perl/recipes-perl/libcgi/libcgi-perl_4.72.bb
similarity index 93%
rename from meta-perl/recipes-perl/libcgi/libcgi-perl_4.71.bb
rename to meta-perl/recipes-perl/libcgi/libcgi-perl_4.72.bb
index 8e44e1ffb0..7d6508e9a4 100644
--- a/meta-perl/recipes-perl/libcgi/libcgi-perl_4.71.bb
+++ b/meta-perl/recipes-perl/libcgi/libcgi-perl_4.72.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=415fc49abed2728f9480cd32c8d67beb"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEEJO/CGI-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "9da85b30d9404d183da7ca7aedb83702cb07ed73c3078bf6f36c87f1e8a0196a"
+SRC_URI[sha256sum] = "babc1ca72db188083a1c3812debe88c4473b943b1f7c662281cd57c580a8bdd9"
 
 S = "${UNPACKDIR}/CGI-${PV}"
 
-- 
2.43.0



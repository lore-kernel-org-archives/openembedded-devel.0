Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21191CAC5BE
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 09:00:56 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.8317.1758704441632466881
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 02:00:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=V+AQCpkZ;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758704442; x=1790240442;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Osc3awNCBvJTt/AakNpqEUOzt1tjRCGSna40BTwKrq8=;
  b=V+AQCpkZfu0cQyf0Hs6FR4ScmfV1gWIYYdVK8xHAsvPA+jJQBqaY/Lsh
   w8qt1KovjfwAA/Sa5cQCO0TOkyBBDR6S3NhZT03pUbkb8Bza4Vrxp/fmQ
   Tte36jPXfts8+e154J5Bv0TJ4E3PDggUGGqTuNooJrPq9hSgrZslveRQj
   ZrZlD6/hLTctaQSyID+d/X2QYp8hGBaeGf0V146GoMVuWxjwhAsxzdP5D
   h7rezk1NGGFj/qYydOyqOlS/+On2RZfJnzdb0fgEN84dY6gN9IwlrG6Tj
   BlpK/Y+N3esL8twUby8A31814Om1vUq744GDqySJ+1kYO6CmmzQU4CGDF
   A==;
X-CSE-ConnectionGUID: 77WhJKZJRkmJkZvO6P7sJA==
X-CSE-MsgGUID: cVT29GbmSyKwbqnywTQyGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="201172413"
X-IronPort-AV: E=Sophos;i="6.18,290,1751209200"; 
   d="scan'208";a="201172413"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 18:00:41 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 1171E42A320
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:41 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id BEA44C01EEE
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:40 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTPS id 381E920010A7;
	Wed, 24 Sep 2025 09:00:39 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DD5FC1A0069;
	Wed, 24 Sep 2025 17:00:35 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 11/29] liburi-perl: upgrade 5.32 -> 5.34
Date: Wed, 24 Sep 2025 17:00:11 +0800
Message-ID: <20250924090029.1786-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250924090029.1786-1-wangmy@fujitsu.com>
References: <20250924090029.1786-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119772

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../liburi/{liburi-perl_5.32.bb => liburi-perl_5.34.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/liburi/{liburi-perl_5.32.bb => liburi-perl_5.34.bb} (94%)

diff --git a/meta-perl/recipes-perl/liburi/liburi-perl_5.32.bb b/meta-perl/recipes-perl/liburi/liburi-perl_5.34.bb
similarity index 94%
rename from meta-perl/recipes-perl/liburi/liburi-perl_5.32.bb
rename to meta-perl/recipes-perl/liburi/liburi-perl_5.34.bb
index 7c42a7e4a4..7aeb234dfd 100644
--- a/meta-perl/recipes-perl/liburi/liburi-perl_5.32.bb
+++ b/meta-perl/recipes-perl/liburi/liburi-perl_5.34.bb
@@ -12,7 +12,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/O/OA/OALDERS/URI-${PV}.tar.gz \
            file://0001-Skip-TODO-test-cases-that-fail.patch \
            "
 
-SRC_URI[sha256sum] = "9632067d34e14e0dae2da94631c4f25a387fcc48d06fa29330e8b3c04c4e913d"
+SRC_URI[sha256sum] = "de64c779a212ff1821896c5ca2bb69e74767d2674cee411e777deea7a22604a8"
 
 S = "${UNPACKDIR}/URI-${PV}"
 
-- 
2.43.0



Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7EB9CD6E44
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 09:48:41 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16929.1779875317228347347
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2026 02:48:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mi/O4RML;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779875317; x=1811411317;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=l1K3L/7HOzndfXr0e7jHouyU6Q0fMW6GnMR1XaL8sLk=;
  b=mi/O4RMLGzjLq8AAoGBXeKKCNzpEjrFY4nchJvkeHlecKdP2ivEyIby+
   qI8BvswVfpCOKIRCRrKj2mLLtDks9O5ttB2F4gCV2DH5GopHISYhSJpjY
   oVzrURzmwE4clfFXrEnavaW7mfQnFFM1XofrXs934E3lR9wmmwh9riUwg
   Ttyw9Jd1v7lQ4W1IusIwjS/lxSPC1E2JrBbZGk2y3AI39fRq0Yd3SwLiN
   /uyyjztEUVq7fLy2p+snkNOnxe3zEPbUPy/4ko5+CZdjOY6BiDGB/i1AW
   QTMu8qMDWo0rGffS5jypdeKOINjIYAanUlFJhqD163w7JzZwpwB5k4dje
   w==;
X-CSE-ConnectionGUID: T9tazAopRN+Bus/5ptX4pA==
X-CSE-MsgGUID: PAkB4OhfRMWt+5skiG7WAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="241434757"
X-IronPort-AV: E=Sophos;i="6.24,171,1774278000"; 
   d="scan'208";a="241434757"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 18:48:35 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id B3BC08203D2
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:48:35 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 6C6AE14003C3
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:48:35 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 737B782A2CC;
	Wed, 27 May 2026 09:48:33 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 10/56] libio-compress-perl: upgrade 2.219 -> 2.220
Date: Wed, 27 May 2026 17:47:19 +0800
Message-ID: <20260527094805.2039-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260527094805.2039-1-wangmy@fujitsu.com>
References: <20260527094805.2039-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:48:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127217

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* remove use of eval in globmapper. #73
* Update zipdetails to version 4.006.
* Fix typo in fastForward #72
* Fix issue with "rawdeflate` option in AnyInflate.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ibio-compress-perl_2.219.bb => libio-compress-perl_2.220.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libio/{libio-compress-perl_2.219.bb => libio-compress-perl_2.220.bb} (93%)

diff --git a/meta-perl/recipes-perl/libio/libio-compress-perl_2.219.bb b/meta-perl/recipes-perl/libio/libio-compress-perl_2.220.bb
similarity index 93%
rename from meta-perl/recipes-perl/libio/libio-compress-perl_2.219.bb
rename to meta-perl/recipes-perl/libio/libio-compress-perl_2.220.bb
index ef05e69460..05c8dd2e82 100644
--- a/meta-perl/recipes-perl/libio/libio-compress-perl_2.219.bb
+++ b/meta-perl/recipes-perl/libio/libio-compress-perl_2.220.bb
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=a05fdd79b87a410b617
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/P/PM/PMQS/IO-Compress-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "d3f509c4ec2f75d3ea6621b96aef61329a23711c11efb2222c837db1370433e9"
+SRC_URI[sha256sum] = "9d96ea291f2c54ef367c7396b857d93ba1ac1c4b2f1bce13ed8a3e5f3eebb627"
 
 S = "${UNPACKDIR}/IO-Compress-${PV}"
 
-- 
2.43.0



Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14E5AC5DF88
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:37:24 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3376.1787132239354054172
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:37:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=JJMLktIS;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132243; x=1818668243;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=M54GHp17krn9GjbI4O8H92baXQjJxnjC5/oZW82Gm20=;
  b=JJMLktISQSlqIbT1OacFgpVOTjwvsBIfgiBzp5Yn2L9v2+WzGOnRQC5d
   GDYyfA3mtBZ5/UxJJ3lZNI4Iu2nj85OPVxRdQiZDIpx+67QOgENUqcM4F
   vwWPeiXofoVpUkoNXwux36lYcnoB7dCQwzV3hOS6lFoGA+57XRq2Qkm/0
   5Ysi38lUay3bqJGfb4AC1wVes8yTvcps2lB9EC0aFJ8q+QoJZWFn+LRdd
   5xEQy19aj/zqkKFtfyZ1S8yUxIgFFUFZ0nDKUiZlMc68kAubBs1oEyK5C
   Ws7IsdlFFQw42TCI/egwKhY653leMex4yY2lfjk4EoYWdrA7eGnBqp51r
   Q==;
X-CSE-ConnectionGUID: UJ+gz5LNQYuyNI+GgOcj4g==
X-CSE-MsgGUID: pCgz6V6KT72PGjerJbCgWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="230759555"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="230759555"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:37:21 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id B43FE1C000EA
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:37:17 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 5FC301C00953
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:37:17 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 510FE1801C0A;
	Wed, 19 Aug 2026 09:37:15 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 66/70] qpdf: upgrade 12.3.2 -> 12.4.0
Date: Wed, 19 Aug 2026 17:35:10 +0800
Message-ID: <20260819093514.1101-66-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:37:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129336

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-printing/qpdf/{qpdf_12.3.2.bb => qpdf_12.4.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-printing/qpdf/{qpdf_12.3.2.bb => qpdf_12.4.0.bb} (94%)

diff --git a/meta-oe/recipes-printing/qpdf/qpdf_12.3.2.bb b/meta-oe/recipes-printing/qpdf/qpdf_12.4.0.bb
similarity index 94%
rename from meta-oe/recipes-printing/qpdf/qpdf_12.3.2.bb
rename to meta-oe/recipes-printing/qpdf/qpdf_12.4.0.bb
index 68fb0d4f6b..d8aa58caa0 100644
--- a/meta-oe/recipes-printing/qpdf/qpdf_12.3.2.bb
+++ b/meta-oe/recipes-printing/qpdf/qpdf_12.4.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 DEPENDS = "zlib jpeg ${@bb.utils.contains('PACKAGECONFIG', 'gnutls', 'gnutls', 'openssl', d)}"
 
 SRC_URI = "git://github.com/qpdf/qpdf.git;protocol=https;branch=main;tag=v${PV}"
-SRCREV = "a898bb3a7289d1d05789d6d3f0d5dd534943a8da"
+SRCREV = "babad179ce5db9a21635c8d1ac17baa59637eada"
 
 inherit cmake pkgconfig gettext
 
-- 
2.43.0



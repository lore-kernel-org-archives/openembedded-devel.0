Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53DD9EFD22D
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 09:38:21 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42048.1772012296931061437
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Feb 2026 01:38:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OYNym5yy;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772012300; x=1803548300;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NO+xZmGy6qBRlsjK4aVZaNvQA3kwdPuwaBw4vbITMtY=;
  b=OYNym5yyjnDq9UjuSpqgijCmfWma/Ns5OYVA1hstIQpmgg0A16SJJDZP
   0zUvMwGFwZzE8Q28TVPiXKHGxKugWmHGscGzRuiqKOfAfYCbR3G1ajnvD
   U+Qx4d4OGxmiBlSIDsdDvRps5zXbPYp7N5m2ypCttMJFm4oIlv4PkwSY8
   hdHOV88tt9YEcFe13XVK+f8vhZyemeZiT0OFK0AVovAXoNQx4igw1KoUX
   KHyhEr0TXkz1C5RzlSdl5CWDoUU77hUqMoWsdIo5ch5XyiEpmeT5VPFUw
   GkFZdRX5vodourQrMxDIWGPCvBOZYFsIH3jNs2E5+33szNvGtechZVjtQ
   A==;
X-CSE-ConnectionGUID: HgZRcVqzTeCPIxG2ykVHLA==
X-CSE-MsgGUID: +9NQT4gVTI+fm23K4/+SUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="219620596"
X-IronPort-AV: E=Sophos;i="6.21,310,1763391600"; 
   d="scan'208";a="219620596"
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.fujitsu.com (Postfix) with ESMTPS id D85374071C9
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:38:19 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 87AD81C00133
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:38:19 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id B01CC101BB7D;
	Wed, 25 Feb 2026 09:38:16 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 22/33] mpich: upgrade 4.3.2 -> 5.0.0
Date: Wed, 25 Feb 2026 17:37:16 +0800
Message-ID: <20260225093727.1284-22-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260225093727.1284-1-wangmy@fujitsu.com>
References: <20260225093727.1284-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:38:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124634

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-devtools/mpich/{mpich_4.3.2.bb => mpich_5.0.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/mpich/{mpich_4.3.2.bb => mpich_5.0.0.bb} (96%)

diff --git a/meta-oe/recipes-devtools/mpich/mpich_4.3.2.bb b/meta-oe/recipes-devtools/mpich/mpich_5.0.0.bb
similarity index 96%
rename from meta-oe/recipes-devtools/mpich/mpich_4.3.2.bb
rename to meta-oe/recipes-devtools/mpich/mpich_5.0.0.bb
index f1ac212023..505fc6f92b 100644
--- a/meta-oe/recipes-devtools/mpich/mpich_4.3.2.bb
+++ b/meta-oe/recipes-devtools/mpich/mpich_5.0.0.bb
@@ -6,7 +6,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=3a296dfb961b957b0e8adf67d8478d3d"
 
 SRC_URI = "http://www.mpich.org/static/downloads/${PV}/mpich-${PV}.tar.gz"
-SRC_URI[sha256sum] = "47d774587a7156a53752218c811c852e70ac44db9c502dc3f399b4cb817e3818"
+SRC_URI[sha256sum] = "e9350e32224283e95311f22134f36c98e3cd1c665d17fae20a6cc92ed3cffe11"
 
 RDEPENDS:${PN} += "bash perl libxml2"
 
-- 
2.43.0



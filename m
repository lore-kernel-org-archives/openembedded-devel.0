Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA846CD8CBD
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 10:29:51 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.76239.1781000988815912912
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 03:29:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tyASAZQY;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781000989; x=1812536989;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nF53qmIS3WroKMFI5QVgR/NIUl7mo6brcCxl7g3aWHo=;
  b=tyASAZQYIzdzEucFY31swR7lfTZhKAvZUi4j6C8+IiOtMGAXNJxqeAyc
   GooWcb0NOm3rafwhGnJDHlwdnIUZMTkCp3EbHZdPqLU80lVTXWZ+CBqfK
   2noT53kunpNgytYySzpykd3cXE9LF1cHQzQfPcIFJvAdwkJsHwwzHNb7Z
   MBwseXB8E8ysB3dAfZLy/RYi6zAWlSpbZTEYds7wVv1CcBEJVHp93tFJ6
   kqlbS/fbeQ9q+IjIaTzloYEO2AkHqxSayy8B19k7jhZqsLGDHBhBdwQda
   Xxdp1/OOffHFNFblV4vxWgYmCnXJePShEINXKIcJAyOj3Bt8448zX6cWx
   w==;
X-CSE-ConnectionGUID: 29SYu3ABSBSjWoa2f4ONow==
X-CSE-MsgGUID: poHM3MYXQZqH7WDT3tYHVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="242941900"
X-IronPort-AV: E=Sophos;i="6.24,196,1774278000"; 
   d="scan'208";a="242941900"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 19:29:47 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 5F2C91C1C72F
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2026 10:29:47 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 14FFB860542
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2026 10:29:47 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 39D5A10003CE;
	Tue,  9 Jun 2026 10:29:44 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 09/30] libdbi-perl: upgrade 1.647 -> 1.648
Date: Tue,  9 Jun 2026 18:28:52 +0800
Message-ID: <20260609102913.2204-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260609102913.2204-1-wangmy@fujitsu.com>
References: <20260609102913.2204-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 10:29:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127463

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2026.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../perl/{libdbi-perl_1.647.bb => libdbi-perl_1.648.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/perl/{libdbi-perl_1.647.bb => libdbi-perl_1.648.bb} (91%)

diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb b/meta-oe/recipes-devtools/perl/libdbi-perl_1.648.bb
similarity index 91%
rename from meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb
rename to meta-oe/recipes-devtools/perl/libdbi-perl_1.648.bb
index 00f8181065..603c3b3cd2 100644
--- a/meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl_1.648.bb
@@ -7,10 +7,10 @@ database interface independent of the actual database being used. \
 HOMEPAGE = "https://metacpan.org/dist/DBI"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=65f65488c774efe1da488e36ad6c4a36"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1a1138dff61f77bbc3d8782caba6758d"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/H/HM/HMBRAND/DBI-${PV}.tgz"
-SRC_URI[sha256sum] = "0df16af8e5b3225a68b7b592ab531004ddb35a9682b50300ce50174ad867d9aa"
+SRC_URI[sha256sum] = "ef266aad6010ce2eabb7e465ebd73ca3020bc58150f6989bd89c2b8f9bac6a86"
 
 S = "${UNPACKDIR}/DBI-${PV}"
 
-- 
2.43.0



Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEB1CEA796F
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 05:15:17 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14211.1770268507815043586
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 21:15:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LLv8K4Yl;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770268508; x=1801804508;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8WQsn5xnE6V0GOsIuP19lXfjue9W9gW/vzwWgdfIsLk=;
  b=LLv8K4YlCH66i8WYyVIyASMnkJrSc8hJoo0a0ei9f0SCon9qz+PUFLEJ
   0znqYpYS6dLBnZeXsCnmQzx6e11rdCPjPDLWIW1mjl9HUrbJzWXxCZusL
   oxtKacUYq9NseEg3HQ/GW+nqtM668iQ3QdjIG3ltebegjvyjsI8352r4V
   m4VUaMznW1c90wOrHZHeqMPwVmnszlS+ax8AtikxCyLPHUEp+I7de7kqo
   Pnak2tZepouXxfZ51DqiwdcyvG6wvk3crCcVKmrdi0v7z1hp5kSK+GuPL
   0V3wDa9/FU8azAN1J0fIvmgWciVbaU0DzqxilRpCUYOzW6Lk80lEgrxk8
   w==;
X-CSE-ConnectionGUID: mJ/D5b17SVOD1bBQqlZ/NA==
X-CSE-MsgGUID: OFpmCTTHRbadUdRSt6hsrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="216026305"
X-IronPort-AV: E=Sophos;i="6.21,274,1763391600"; 
   d="scan'208";a="216026305"
Received: from unknown (HELO mail.fujitsu.com) ([51.138.80.169])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 14:15:06 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.fujitsu.com (Postfix) with ESMTPS id 084BC1000374
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Feb 2026 05:15:06 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 9F867C06D7D
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Feb 2026 05:15:05 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 0DDAC20000C2;
	Thu,  5 Feb 2026 05:15:02 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 04/24] libcompress-raw-bzip2-perl: upgrade 2.214 -> 2.217
Date: Thu,  5 Feb 2026 13:14:14 +0800
Message-ID: <20260205051435.1366-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260205051435.1366-1-wangmy@fujitsu.com>
References: <20260205051435.1366-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 05:15:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124156

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2026

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...zip2-perl_2.214.bb => libcompress-raw-bzip2-perl_2.217.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libcompress/{libcompress-raw-bzip2-perl_2.214.bb => libcompress-raw-bzip2-perl_2.217.bb} (79%)

diff --git a/meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.214.bb b/meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.217.bb
similarity index 79%
rename from meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.214.bb
rename to meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.217.bb
index b0feb40b71..ae2cdb7f59 100644
--- a/meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.214.bb
+++ b/meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.217.bb
@@ -5,11 +5,11 @@ HOMEPAGE = "https://metacpan.org/release/Compress-Raw-Bzip2"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
-LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=d9968e06481ca195215d0f29ba557f98"
+LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=7b6eb3b7380815648e5067943ed15621"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/P/PM/PMQS/Compress-Raw-Bzip2-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "b0810a4d6e1a402892840564e6589e6ecd39cb87561bc556f171b78e900079cb"
+SRC_URI[sha256sum] = "aa80f52473b8ca3368e8f83496fac1b2a25d27723506b94c4ea6c861fce961f8"
 
 DEPENDS += "bzip2"
 
-- 
2.43.0



Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B83B1EA7972
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 05:15:17 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14213.1770268510919085105
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 21:15:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rY5+QyX/;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770268511; x=1801804511;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zs0K/AhoAm1/No+4cpYYaIuVAuEb5DSEMqggsctxHMM=;
  b=rY5+QyX/MxsWdEPXkWnd+Bl61i7i/36K3EIOSmVUSZV/pbfPEggd3omD
   3YFrcj32uLtxY+iHrnapgigCRaGjFuj6IHBIzoBGNp7QCOnAlEL87g2nq
   Jm2HZCyNOIFt9rht5WupRD4WG2ekRjSfISrhtGnMTqHr54pIqdO6LuiJK
   P89BkyJGBnGaH3T6WwiyB2DCy0ScQyWgNtwYMMARtwW0LyqR5x9s1vjGZ
   3wSRYhYOQGkRvAW/nKJBalV+TA71Fqre0G4l2eXM2wWAJ6mBKPGBJNkwd
   yAsyiV5SPU/rPoxkKBid2FvUeZTWIXgteBIheLCGlw9NXaEwHfa3vdXCL
   Q==;
X-CSE-ConnectionGUID: QhEGtJfCQsafe9tnbmuY7Q==
X-CSE-MsgGUID: CvaHS5RySMGFNzGsupYEkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="229249947"
X-IronPort-AV: E=Sophos;i="6.21,274,1763391600"; 
   d="scan'208";a="229249947"
Received: from unknown (HELO mail.fujitsu.com) ([20.61.8.234])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 14:15:09 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.fujitsu.com (Postfix) with ESMTPS id 5F9EA3FD7
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Feb 2026 05:15:09 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 17667C02E5D
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Feb 2026 05:15:09 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 8714020000C7;
	Thu,  5 Feb 2026 05:15:06 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 06/24] libcompress-raw-zlib-perl: upgrade 2.214 -> 2.217
Date: Thu,  5 Feb 2026 13:14:16 +0800
Message-ID: <20260205051435.1366-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260205051435.1366-1-wangmy@fujitsu.com>
References: <20260205051435.1366-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 05:15:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124158

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2026

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-zlib-perl_2.214.bb => libcompress-raw-zlib-perl_2.217.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libcompress/{libcompress-raw-zlib-perl_2.214.bb => libcompress-raw-zlib-perl_2.217.bb} (78%)

diff --git a/meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.214.bb b/meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.217.bb
similarity index 78%
rename from meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.214.bb
rename to meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.217.bb
index b4de5d499a..a95fbed30d 100644
--- a/meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.214.bb
+++ b/meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.217.bb
@@ -6,11 +6,11 @@ HOMEPAGE = "https://metacpan.org/release/Compress-Raw-Zlib"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
-LIC_FILES_CHKSUM = "file://README;beginline=8;endline=17;md5=a57e80ea8cb4e0305995c08035c77138"
+LIC_FILES_CHKSUM = "file://README;beginline=8;endline=17;md5=000093d18bfdd0ac3594d80b6e055cec"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/P/PM/PMQS/Compress-Raw-Zlib-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "5eea0c05c7b01dc93b620f04c89176eefb5002586ca0bebae3b8c2e70920e62e"
+SRC_URI[sha256sum] = "48309aa25f126365a3c14f49b4e90da56d29d3c00506c7e7c3b724f6df0684c8"
 
 DEPENDS += "zlib"
 
-- 
2.43.0



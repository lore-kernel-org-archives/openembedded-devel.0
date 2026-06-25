Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEE31CDB47F
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 09:01:36 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7223.1782378094534315168
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2026 02:01:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sznISVKH;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782378094; x=1813914094;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=sBGMPPvdwNw/e/8RHI1F1WCv+vx9jZ1StKrdLTNoK7w=;
  b=sznISVKH+J9ic3Pb7wFfUeonIuINAbBOA4gnq9WTsCGoPqTduAedNBWw
   2c9znsRlG1iNttc8csDtdKgPdz7Wkx6PfafwlJC2e7iSVJcr5eAKf9AaM
   GgDZIU2t51iTLVb2DkA+o+CiJFsBnKkL/LfXqty/MjFGId/A7+5AjVAcg
   zJgODAUO4kIwFURYSm0zlh78+M1aNaD+IpW4v6t+HO4gmCufZ71FQsYLc
   wO6Kk0Q6vJh1yN/wRftZFlZmR/2HsKuCTbzanCep6EW4r7MeXDgurDVIS
   O7jQrAB5J2GTjzGLIzOuFlWL3SR7PiiN3Q9I3kASKhSRUlkXbZW/9ocg5
   w==;
X-CSE-ConnectionGUID: k5Xs+K0RTMuqZmLTVX6sQA==
X-CSE-MsgGUID: NBK+bHyhRWaZVKfv50uxiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="244743075"
X-IronPort-AV: E=Sophos;i="6.24,224,1774278000"; 
   d="scan'208";a="244743075"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 18:01:32 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id A3BCF406EC7
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:01:32 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 58AB618ABD3D
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:01:32 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 69EC0101732D;
	Thu, 25 Jun 2026 09:01:30 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 01/47] ctags: upgrade 6.2.20260607.0 -> 6.2.20260621.0
Date: Thu, 25 Jun 2026 17:00:41 +0800
Message-ID: <20260625090127.1563-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:01:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127733

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.2.20260607.0.bb => ctags_6.2.20260621.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.2.20260607.0.bb => ctags_6.2.20260621.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.2.20260607.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.2.20260621.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.2.20260607.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.2.20260621.0.bb
index 0d0604239a..208e3e6ac4 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.2.20260607.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.2.20260621.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "0361a1da51a9cb680732451ab0c35c41bc914bda"
+SRCREV = "7cef08003487e3c87cb727f112c5bff793751ef8"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https;tag=p${PV}"
 
 
-- 
2.43.0



Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B84DFF8875
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 10:49:36 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17424.1777546172057976680
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:49:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PK7aDdvg;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1777546172; x=1809082172;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=aQgkI9LKpjuRPqeP0/SzZiIZHKKjP7idim3+JKcn/Ic=;
  b=PK7aDdvg9fQnokV/spXK5kNkaJkYZi916S97ypdtjPA2lMhKUImK7hyv
   QXb5ITkdsQUOl3NIQ73gEymEnzWsFFfOEyCWqgVX+2qB5zAqfCIjyyYOq
   628/I8yXVUegZNP5JVOivgXn/Ft0d/oyUZ8HHopvmxJwmXRv8BlQUlyhd
   hpxPLYNqXD93+kCPqPHuuiRFjnwCCniNDHKKYDBVghr/K6RLBEBjl0KPR
   h8fTMCjFnQhYyF81BqIcMPcpjjIH+lwcS96Ix3pvNAjLmoC6T1SWPkfUY
   Y8fApWNVzFdN+e1XbPSi/bDMr4QHrrmo2zdSx4f0b1rZNFAJ4PH3182H+
   A==;
X-CSE-ConnectionGUID: +HEcxOH8SA+d3Iawr4nmyg==
X-CSE-MsgGUID: FFsVSy8nQN2ACgmgfypEAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="238552622"
X-IronPort-AV: E=Sophos;i="6.23,207,1770562800"; 
   d="scan'208";a="238552622"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 19:49:30 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 1BEE81002B86
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:49:30 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id C962018002CD
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:49:29 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 557641801130;
	Thu, 30 Apr 2026 10:49:27 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 01/64] 7zip: upgrade 26.00 -> 26.01
Date: Thu, 30 Apr 2026 18:48:20 +0800
Message-ID: <20260430104924.1106-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:49:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126671

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- linux version of 7-Zip can use huge pages (2 MB pages). It can increase
  compression speed for 10% for 7z/xz/LZMA/LZMA2 compression.
- new -spo[d|c|r] switch specifies the path generation mode for the output
  directory for archive extraction. The output directory path is generated from
  the path specified in the -o{dir_path} switch and the name of the archive being
  unpacked.
- some bugs were fixed.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-extended/7zip/{7zip_26.00.bb => 7zip_26.01.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/7zip/{7zip_26.00.bb => 7zip_26.01.bb} (98%)

diff --git a/meta-oe/recipes-extended/7zip/7zip_26.00.bb b/meta-oe/recipes-extended/7zip/7zip_26.01.bb
similarity index 98%
rename from meta-oe/recipes-extended/7zip/7zip_26.00.bb
rename to meta-oe/recipes-extended/7zip/7zip_26.01.bb
index 85219b5052..a3e124518a 100644
--- a/meta-oe/recipes-extended/7zip/7zip_26.00.bb
+++ b/meta-oe/recipes-extended/7zip/7zip_26.01.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/ip7z/7zip.git;protocol=https;branch=main;tag=${PV} \
            file://0001-Remove-treating-warning-as-errors.patch \
            file://7z_wrapper.sh \
            "
-SRCREV = "839151eaaad24771892afaae6bac690e31e58384"
+SRCREV = "8c63d71ff886bda90c86db28466287f977374237"
 
 UPSTREAM_CHECK_URI = "https://github.com/ip7z/7zip/releases/latest"
 
-- 
2.43.0



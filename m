Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87F1FEA3C33
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 10:33:50 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.128828.1775730825970570989
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 03:33:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PDvQ7dku;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775730826; x=1807266826;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uPo25GYgrY81Mcrtlqj4FwzGxKkKXy1U8l94/M7Y5ds=;
  b=PDvQ7dkuWh3ZzSiMwFhsCI7WB+rmITfOucGptw4ECw5ATQX1978H5QRD
   2Dlp5dGnNWAppMYQph9xgN9Qxwl8MQfGh/D7r4vRlJoZTSKWx/1P8ac3d
   9lrgJD5Wc2XDj5ixJtLXAkxYm89Vr76eEqWJriNPNfFK8KB97LTWHvFSF
   g061wN+2JIUZHuStRgiPx3KmfmGYbh5wQPCTgbMrtSZA/RgQPuwvQODMM
   TNwIBjAHR/WbZa80ikpjrycm2Ck72CmlyQ306LLS19xDmHS7Ab215SB1c
   Tes8szhjU/VylwLtiHQl3wsTMzDIwGTqyNPXkGytYIEy2aC2XHCbIKTk0
   g==;
X-CSE-ConnectionGUID: KC3UT0KZTyew0x9JTbu6aA==
X-CSE-MsgGUID: h2FlSafXSkurZj1WRAGaQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="215190626"
X-IronPort-AV: E=Sophos;i="6.23,169,1770562800"; 
   d="scan'208";a="215190626"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 19:33:44 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 645541C06200
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:33:44 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 1B1FA1800252
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:33:44 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id A353F404950;
	Thu,  9 Apr 2026 10:33:41 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 13/37] mstpd: upgrade 0.1.1 -> 0.2.0
Date: Thu,  9 Apr 2026 18:31:59 +0800
Message-ID: <20260409103223.1574-13-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260409103223.1574-1-wangmy@fujitsu.com>
References: <20260409103223.1574-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 10:33:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126162

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- README.md: update IRC channel location
- ctl_socket_server: require root for changing configuration
- mstp: validate admin port path costs
- mstp: do not allow changing Bridge Hello Time
- mstp: do not overflow calculated root path costs
- mstp: increase maxHops limit to 100
- README.md: add packaging status
- README.md: update FID/MSTI limits
- README.md: clarify IVL/SVL and MSTI support in linux
- packet: set socket priority to TC_PRIO_CONTROL
- TCSM: fix infinite recursion for MSTI per-tree ports

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../networking/{mstpd_0.1.1.bb => mstpd_0.2.0.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/networking/{mstpd_0.1.1.bb => mstpd_0.2.0.bb} (94%)

diff --git a/meta-oe/recipes-extended/networking/mstpd_0.1.1.bb b/meta-oe/recipes-extended/networking/mstpd_0.2.0.bb
similarity index 94%
rename from meta-oe/recipes-extended/networking/mstpd_0.1.1.bb
rename to meta-oe/recipes-extended/networking/mstpd_0.2.0.bb
index 3ac4d5b1fe..0d60111554 100644
--- a/meta-oe/recipes-extended/networking/mstpd_0.1.1.bb
+++ b/meta-oe/recipes-extended/networking/mstpd_0.2.0.bb
@@ -6,7 +6,7 @@ SRC_URI = " \
     file://bridge-stp \
     file://mstpd.service \
 "
-SRCREV = "d7dd987b101f277bfef8ac71de7c1d962a424e8e"
+SRCREV = "8995e5d11ee89f2251734e34cea711bb5a5bb911"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+){2,})"
 
-- 
2.43.0



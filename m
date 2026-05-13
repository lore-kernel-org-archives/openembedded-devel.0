Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A010ACD37B6
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 04:20:48 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.247.1778646037626010317
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 21:20:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=j/krZjeX;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1778646042; x=1810182042;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OG03dFGQykZ56L+iZ9VII2VO2a/DAwkeLqIJuxq1uy4=;
  b=j/krZjeXiUSaUXMt+FuAXweep1l9s//YXl+JZk28EfRinTb1wuy1b3Nl
   zG4CLHOs2FijKiyvHYYeFIrdS57iBd9RVIusenMGDHJ9b5OPfWAu6ALkk
   ebQaj26dMHuOmgqe9ncDCLPEA1wiYQFBuZYsCBLT5xMiGy9AinH96a8T4
   uRNa7hvMohcnmsIXxrW0DKx5EEhqCALoKck8zv9RQkVePR5/ZfmGxGiLV
   DFOn6EelgUHka0nemyjGx5aD8mPU+VwXxL4PdUjEx3LDmkDWJMhlK5MYa
   CBWDnjbD2uwpdT1c7AKewi0Ik6DFAU8Oi1zueWocA4XVbzJwJyAZw8dBN
   A==;
X-CSE-ConnectionGUID: vePnxNkZRnKv8HSoEESBDw==
X-CSE-MsgGUID: 7Z/JfqD6QrOpe9Wbdu6yrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="240268019"
X-IronPort-AV: E=Sophos;i="6.23,232,1770562800"; 
   d="scan'208";a="240268019"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:20:41 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 4552D8204C4
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:20:41 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id EFC8DC02F1A
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:20:40 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 8E27814001F2;
	Wed, 13 May 2026 04:20:38 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 53/56] wireshark: upgrade 4.6.4 -> 4.6.5
Date: Wed, 13 May 2026 12:19:49 +0800
Message-ID: <20260513041952.450-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260513041952.450-1-wangmy@fujitsu.com>
References: <20260513041952.450-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:20:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126936

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../wireshark/{wireshark_4.6.4.bb => wireshark_4.6.5.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_4.6.4.bb => wireshark_4.6.5.bb} (97%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_4.6.4.bb b/meta-networking/recipes-support/wireshark/wireshark_4.6.5.bb
similarity index 97%
rename from meta-networking/recipes-support/wireshark/wireshark_4.6.4.bb
rename to meta-networking/recipes-support/wireshark/wireshark_4.6.5.bb
index 7ecad4eda8..7b19fccc52 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_4.6.4.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_4.6.5.bb
@@ -31,7 +31,7 @@ SRC_URI:append:class-native = " file://0001-don-t-look-for-iconv.h-for-native-bu
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src/all-versions"
 
-SRC_URI[sha256sum] = "fbeab3d85c6c8a5763c8d9b7fe20b5c69ca9f9e7f2b824bedc73135bdca332e2"
+SRC_URI[sha256sum] = "b5322538b20fa3e0bf004be83c534a42937d442be3f960d01b4e1f0db6c50386"
 
 PE = "1"
 
-- 
2.43.0



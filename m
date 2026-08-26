Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9D4DC61DC7
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:09:43 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7614.1787731777855403404
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:09:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZJQyToT0;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787731778; x=1819267778;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=n74bMKyRe0ufWHfdp4ziu7DHf/ZHaR3Jl3N72HIWUdU=;
  b=ZJQyToT0qKuZTla8aDVOIIbgvku1CPF8jwrtGVabLMEmwR0+j6yVzR1J
   MI2Dsve8iAZRGAqbcngan/CGvkceFyxt+BUC7AjiQBKLJzZ0C6v9ddJO+
   1Zm6t0E7d/mUayBxvaoy9tsimQpEegU9uowOQcY3Wz6JK2g637wTS3iQU
   Y5rES7w/xc68D7jiZP7JN2LbfHg/Dz/CaFsOIO+MzuCY/gcHZeSxT4B0C
   Z0qffR91bmwVE9FRjv0gZ4nDGZu2kM2jxEeu3jCnRxmmJbtgJrw1ttILk
   UeYaWBAiWPO5AhLli+8JV02ZxAEzMc0w8gXA8x6Uvpm4jXmVWc5BHAczC
   w==;
X-CSE-ConnectionGUID: zLz2jsA5Ry+g+hg4rRSnBA==
X-CSE-MsgGUID: gi6xqneDS8Kak3jn9FTpbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="252189102"
X-IronPort-AV: E=Sophos;i="6.25,244,1779116400"; 
   d="scan'208";a="252189102"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 17:09:36 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 05BFA1C1C701
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 08:09:36 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (unknown [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id B3BF81401208
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 08:09:35 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id CFA7D14000B3;
	Wed, 26 Aug 2026 08:09:33 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/23] faad2: upgrade 2.11.2 -> 2.11.3
Date: Wed, 26 Aug 2026 16:09:06 +0800
Message-ID: <20260826080926.989-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260826080926.989-1-wangmy@fujitsu.com>
References: <20260826080926.989-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 08:09:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129495

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../faad2/{faad2_2.11.2.bb => faad2_2.11.3.bb}              | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-multimedia/faad2/{faad2_2.11.2.bb => faad2_2.11.3.bb} (81%)

diff --git a/meta-oe/recipes-multimedia/faad2/faad2_2.11.2.bb b/meta-oe/recipes-multimedia/faad2/faad2_2.11.3.bb
similarity index 81%
rename from meta-oe/recipes-multimedia/faad2/faad2_2.11.2.bb
rename to meta-oe/recipes-multimedia/faad2/faad2_2.11.3.bb
index 83fcaa248d..8dd09439f7 100644
--- a/meta-oe/recipes-multimedia/faad2/faad2_2.11.2.bb
+++ b/meta-oe/recipes-multimedia/faad2/faad2_2.11.3.bb
@@ -7,10 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=381c8cbe277a7bc1ee2ae6083a04c958"
 
 LICENSE_FLAGS = "commercial"
 
-PV .= "+git"
-
-SRC_URI = "git://github.com/knik0/faad2.git;branch=master;protocol=https"
-SRCREV = "673a22a3c7c33e96e2ff7aae7c4d2bc190dfbf92"
+SRC_URI = "git://github.com/knik0/faad2.git;branch=master;protocol=https;tag=${PV}"
+SRCREV = "6918ebb51b8f7e86278da15884bd7114e4b9661e"
 
 
 inherit cmake
-- 
2.43.0



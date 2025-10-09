Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCF8CCCA471
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 06:08:44 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.5579.1759990123709387554
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Oct 2025 23:08:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=JY7P0yGg;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1759990123; x=1791526123;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vb+Pzo7QfuzJPLzSr/mYFH2R9bsSunTD2bbRdC1SpQQ=;
  b=JY7P0yGgX1vKYXjHYHuOTwgyvZPVW0ik574Qh5b5crTtd20GGSfRtxYA
   +2LIZEf46wNf+YAtAx5O6h5lp70jN7j/YUynVieTjSkv209GaIdNqp+LS
   gjcuWjWNIa/d/5IahMjpmP60PKV+ovUFfQQiVOOGSMzevQlvshNshZrU6
   DSd/M8oqT8mP7LfnORDOPH99t+EFTzwzj8unnIBiaTdP3cAYqhangyD42
   Nxk31NkhMHmqPQZEA8tPHi+TEEpAnsBUDa5X0lKmFAuTBxwwfh2TalYXk
   c4JXtwV2n7ui8YGPnjLrAvCNtla7lFSEEfu6wyA0DkzdP7brZRAbflbvm
   g==;
X-CSE-ConnectionGUID: nvLfLDwdQNarP8OKnnjHpw==
X-CSE-MsgGUID: Jih062jjRN6beQYEeUYZ0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="194297238"
X-IronPort-AV: E=Sophos;i="6.19,215,1754924400"; 
   d="scan'208";a="194297238"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 15:08:41 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 0916DC000B7
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Oct 2025 06:08:42 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id BD9A01401272
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Oct 2025 06:08:41 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 65938100310A;
	Thu,  9 Oct 2025 06:08:39 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 14/22] python3-grpcio-tools: upgrade 1.75.0 -> 1.75.1
Date: Thu,  9 Oct 2025 14:08:01 +0800
Message-ID: <20251009060809.445-14-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251009060809.445-1-wangmy@fujitsu.com>
References: <20251009060809.445-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 06:08:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120411

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-grpcio-tools_1.75.0.bb => python3-grpcio-tools_1.75.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-tools_1.75.0.bb => python3-grpcio-tools_1.75.1.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.75.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.75.1.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-grpcio-tools_1.75.0.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-tools_1.75.1.bb
index 7e5d9c5512..7627356ec9 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.75.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.75.1.bb
@@ -15,7 +15,7 @@ DEPENDS += "python3-grpcio"
 SRC_URI += "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch \
             file://0001-protobuf-Disable-musttail-attribute-on-mips.patch \
             "
-SRC_URI[sha256sum] = "eb5e4025034d92da3c81fd5e3468c33d5ae7571b07a72c385b5ec1746658573f"
+SRC_URI[sha256sum] = "bb78960cf3d58941e1fec70cbdaccf255918beed13c34112a6915a6d8facebd1"
 
 RDEPENDS:${PN} = "python3-grpcio"
 
-- 
2.43.0



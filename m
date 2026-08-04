Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D302DC55822
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 05:19:45 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10176.1785820778759162413
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2026 22:19:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CsmZ247H;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785820779; x=1817356779;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5SuP124xUcUslYkP/793JiUPqA2s1rqqAQVkCAJSkBM=;
  b=CsmZ247HZduVbNdDZU8+UQKReCjeiKY/uOP+roDoD7KPXXb2j85CrbJ3
   q14zPp7fLXd8oX0FoCwmWa9rYu2fZLT7DttAoVcZV2TKlZsP90kwgaEz7
   HA1IblUFDwJd9elo02h/S8cqZCSlZg5TPJyHc89C2XNdqz6gmPTd4sIwP
   2MUSZ7qvbAWSICJvcqs78MCrc/MJEX0aboXXoo3Hg8qjgQfdKC3z9Xm1F
   Rnh4/x/7TcRzDFMyUJxrKsf/HB6pFlJa/mDqd3D5HJR1jupHdz1V+jNQn
   1I05wfVjT2A2pMxXu++JRG56xYFig9yEeW9d/pe38KqQTIUkxkMtIv9i0
   Q==;
X-CSE-ConnectionGUID: 9fKzKsKvSHie7is1/HDOOw==
X-CSE-MsgGUID: KmtvjunAQ0ae8JuU7HvaAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="249096147"
X-IronPort-AV: E=Sophos;i="6.25,203,1779116400"; 
   d="scan'208";a="249096147"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 14:19:39 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 4AA0342A337
	for <openembedded-devel@lists.openembedded.org>; Tue,  4 Aug 2026 05:19:39 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id F2D611C002F5
	for <openembedded-devel@lists.openembedded.org>; Tue,  4 Aug 2026 05:19:38 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 1415E1800122;
	Tue,  4 Aug 2026 05:19:36 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 28/28] zchunk: upgrade 1.5.3 -> 1.5.4
Date: Tue,  4 Aug 2026 13:17:26 +0800
Message-ID: <20260804051726.1489-28-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260804051726.1489-1-wangmy@fujitsu.com>
References: <20260804051726.1489-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 05:19:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128733

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/zchunk/{zchunk_1.5.3.bb => zchunk_1.5.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/zchunk/{zchunk_1.5.3.bb => zchunk_1.5.4.bb} (92%)

diff --git a/meta-oe/recipes-support/zchunk/zchunk_1.5.3.bb b/meta-oe/recipes-support/zchunk/zchunk_1.5.4.bb
similarity index 92%
rename from meta-oe/recipes-support/zchunk/zchunk_1.5.3.bb
rename to meta-oe/recipes-support/zchunk/zchunk_1.5.4.bb
index fc5a55d192..9d587debfd 100644
--- a/meta-oe/recipes-support/zchunk/zchunk_1.5.3.bb
+++ b/meta-oe/recipes-support/zchunk/zchunk_1.5.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=daf6e68539f564601a5a5869c31e5242"
 
 SRC_URI = "git://github.com/zchunk/zchunk.git;protocol=https;nobranch=1;tag=${PV}"
 
-SRCREV = "366cf22e725fc273abe0e082c707753cce76c453"
+SRCREV = "99e51afa38c723e7c25834c2c3b305d20ef55d04"
 
 DEPENDS = "zstd"
 DEPENDS:append:libc-musl = " argp-standalone"
-- 
2.43.0



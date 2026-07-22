Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E15FC4453D
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 10:23:49 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44781.1784715824767039872
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2026 03:23:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pvPOqqNx;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784715825; x=1816251825;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=I43D2HfZqcb2ZhEjfEUjMrNkXnJJOgURhIWX02Bvbzs=;
  b=pvPOqqNxHMpcamkMo5tbIRBf0tdDDRVhcqgi91xDKvu4BAX1h04E+aRO
   IWcibdReW5y41PsvP0DRSta5E6lkZ04eQNXHGfu+dLK6gws1ns9wga+gE
   Gg+dFB2LWB7gxeGtzgqf4oekHom11K/oTnOcErGGn9ggiiGblJPZDx1Y0
   d9zAG3WuQ2UIbA9QvZdM4WLl7K6dMetTU2LK2dJ2u+3RnsajYukeBdoPt
   Wg2Yzvc5fKdYnktv+ZxzPstx+fXLszNP4hJbQ+Os/ukAYmLaQ/tH8o9jk
   FimPkwNz1uq0EQ+j2+CNgRcjfBbUEkCUodaCf7fBcEuQ5HHpKU5MkMag9
   w==;
X-CSE-ConnectionGUID: ed2Z4JoASMKkklohb9ZTxQ==
X-CSE-MsgGUID: GbleC5SiSESfVqSTPnCrLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="247687238"
X-IronPort-AV: E=Sophos;i="6.25,178,1779116400"; 
   d="scan'208";a="247687238"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 19:23:43 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 1366282008F
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:23:43 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (unknown [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id BDD3E8D65F7
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:23:42 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id C62D4405987;
	Wed, 22 Jul 2026 10:23:40 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 09/37] mcelog: upgrade 211 -> 212
Date: Wed, 22 Jul 2026 18:22:52 +0800
Message-ID: <20260722102320.1019-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260722102320.1019-1-wangmy@fujitsu.com>
References: <20260722102320.1019-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:23:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128379

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/mcelog/{mcelog_211.bb => mcelog_212.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/mcelog/{mcelog_211.bb => mcelog_212.bb} (96%)

diff --git a/meta-oe/recipes-support/mcelog/mcelog_211.bb b/meta-oe/recipes-support/mcelog/mcelog_212.bb
similarity index 96%
rename from meta-oe/recipes-support/mcelog/mcelog_211.bb
rename to meta-oe/recipes-support/mcelog/mcelog_212.bb
index 803554bd06..2a6b4accb3 100644
--- a/meta-oe/recipes-support/mcelog/mcelog_211.bb
+++ b/meta-oe/recipes-support/mcelog/mcelog_212.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/utils/cpu/mce/mcelog.git;protocol=http;;
            file://run-ptest \
            "
 
-SRCREV = "fe4ac4f11ef7b793b6f4c9dcb0f3fdb410a194a2"
+SRCREV = "9edf489aec70c6b3de56878d1fb613e2465c8ca6"
 
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-- 
2.43.0



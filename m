Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90A64D1CDC6
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 07:02:19 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2027.1765263735791890849
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Dec 2025 23:02:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FfXsaJBB;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1765263735; x=1796799735;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Ef2yGo0KqCijuUKmNkCo5JADl5fnbODGxZ2z4kTVbgc=;
  b=FfXsaJBBCDDCOA4SIha3L135b4XCC5Nj9+ctVxJ/nYYWl0XREFUgQ0bX
   esrbS2XRu3lVmJuUqmfvpNGEzfV7uAHReHQROWHxajqGl0Y2edK5BZWBC
   np5zAwFfaEyvcsXxR0Tj/JyqyzQSFbY8nYGW6Fv6IzfrHfDz8w3k6U1al
   wwiGH3EnQXU83hADiftZbmvxpe4Jw2ix2IXzbAU+QUgVt7qvTa2SAcF7h
   iQ7bmeuO3rTeoLj1MzQcr3dQhfP2hF93sxmJmLevZnZbkzBjg5O5hls2w
   E2rz284deV8q0hNv3EF2zyeWmYU8q5GSRj5hZR7UFnK5n6qAB3+FK966L
   Q==;
X-CSE-ConnectionGUID: Usoz6A+nSXOuJirukS9mYw==
X-CSE-MsgGUID: OKutLehcSfuqzaHpSVn5PQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="209929787"
X-IronPort-AV: E=Sophos;i="6.20,260,1758553200"; 
   d="scan'208";a="209929787"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.128])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 16:02:13 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id D0EA21C1C721
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 07:02:13 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 8A72E18002C6
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 07:02:13 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 542D7826FE6
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 07:02:11 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH 1/3] liblognorm: upgrade 2.0.7 -> 2.0.8
Date: Tue,  9 Dec 2025 15:02:03 +0800
Message-ID: <20251209070203.22455-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 07:02:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122399

Change log
==========
Version 2.0.8, 2025-12-04
- fix potential segfault on some platforms
  Thanks to Julian Thomas for a fix
- fix memory leak when a custom type in rules does not match
  Thanks to Meric Sentunali for the fix and Julian Thomas for alerting
  me of the missing merge.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../liblognorm/{liblognorm_2.0.7.bb => liblognorm_2.0.8.bb}    | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-extended/liblognorm/{liblognorm_2.0.7.bb => liblognorm_2.0.8.bb} (95%)

diff --git a/meta-oe/recipes-extended/liblognorm/liblognorm_2.0.7.bb b/meta-oe/recipes-extended/liblognorm/liblognorm_2.0.8.bb
similarity index 95%
rename from meta-oe/recipes-extended/liblognorm/liblognorm_2.0.7.bb
rename to meta-oe/recipes-extended/liblognorm/liblognorm_2.0.8.bb
index 6de22d392f..6c68b515e9 100644
--- a/meta-oe/recipes-extended/liblognorm/liblognorm_2.0.7.bb
+++ b/meta-oe/recipes-extended/liblognorm/liblognorm_2.0.8.bb
@@ -11,8 +11,7 @@ DEPENDS = "libfastjson libestr"
 SRC_URI = "git://github.com/rsyslog/liblognorm;branch=stable;protocol=https;tag=v${PV} \
            file://0001-Add-asprintf-to-autoconf-function-check-macro.patch \
            "
-SRCREV = "3761794fc0d3b0a9fbfe4daa14a545063f48ce6e"
-
+SRCREV = "33ec4b061ad0a6e5508e679e150ce6422ef6be30"
 
 inherit autotools pkgconfig
 
-- 
2.43.0



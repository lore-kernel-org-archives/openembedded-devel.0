Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1C78E6B27C
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 06:11:31 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.96113.1766470289619930946
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Dec 2025 22:11:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=P/RHkoiR;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1766470288; x=1798006288;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=d3Q1jZLAnrGZVzWFzECUYh7E9NzMqJ+5W0b2vPCwtm8=;
  b=P/RHkoiR2JbmVAw71QVrXMY6F2pb8VJowWAujNch6qacU1Q/VuCqMcB2
   p12G2pwLmxwez8qLSYFt1pswC6YCiGCvQpoWGPqtiTVFVcWQ4wZagiH4H
   5F57t8AZ5oIt6s0HoxzJKBJjewL+kUpRqv21G4f/5LkGTeDgFyQAWl0nu
   VosBDLUY5BzbNVABJ6sX+1m6cs9EIJLzIAmhHiCk3AX8Kw1BcR1TJWDfT
   2RNzrx+ntLDNsd76aRSBN97j99TVt+pX0zC1iWSTLKU+tt/5IfX+bn0lo
   ksryqC8KC5Pwd2PghesoosMMDF3iQcxzuHEmGey7N8F3eB/ueroBwuzy1
   A==;
X-CSE-ConnectionGUID: 9b1NgPK9TT2On2R+Xg8x6w==
X-CSE-MsgGUID: TJBDGcX7S3aqdoQ/qSQdtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="223621747"
X-IronPort-AV: E=Sophos;i="6.21,170,1763391600"; 
   d="scan'208";a="223621747"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 15:11:27 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id CE138C00357
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 06:11:27 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 8B1991801FDE
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 06:11:27 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 6BF1610005B2
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 06:11:25 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH 5/7] polkit: upgrade 126 -> 127
Date: Tue, 23 Dec 2025 14:10:40 +0800
Message-ID: <20251223061043.659-5-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251223061043.659-1-liuyd.fnst@fujitsu.com>
References: <20251223061043.659-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 06:11:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122821

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../polkit/{polkit_126.bb => polkit_127.bb}                 | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/polkit/{polkit_126.bb => polkit_127.bb} (92%)

diff --git a/meta-oe/recipes-extended/polkit/polkit_126.bb b/meta-oe/recipes-extended/polkit/polkit_127.bb
similarity index 92%
rename from meta-oe/recipes-extended/polkit/polkit_126.bb
rename to meta-oe/recipes-extended/polkit/polkit_127.bb
index 0438c4e464..40eca9f9ee 100644
--- a/meta-oe/recipes-extended/polkit/polkit_126.bb
+++ b/meta-oe/recipes-extended/polkit/polkit_127.bb
@@ -5,9 +5,9 @@ LICENSE = "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=155db86cdbafa7532b41f390409283eb"
 BUGTRACKER = "https://github.com/polkit-org/polkit/issues"
 
-SRC_URI = "git://github.com/polkit-org/polkit.git;protocol=https;branch=main"
+SRC_URI = "git://github.com/polkit-org/polkit.git;protocol=https;branch=main;tag=${PV}"
 
-SRCREV = "d627b0d1e1108563658dabe3fb8d2a065e64df10"
+SRCREV = "9e4894c969eecf26a3ba762f4f7a268aa0fb3e51"
 
 DEPENDS = "expat glib-2.0 duktape"
 
@@ -62,4 +62,6 @@ FILES:${PN} += " \
 	${nonarch_libdir}/tmpfiles.d \
 	${nonarch_libdir}/polkit-1 \
 	${datadir} \
+	${systemd_unitdir}/system/polkit-agent-helper.socket \
+	${systemd_unitdir}/system/polkit-agent-helper@.service \
 "
-- 
2.43.0



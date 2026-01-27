Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDF39D13C1B
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 02:19:13 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.698.1769480345638821913
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jan 2026 18:19:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Va0Tx5l9;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769480345; x=1801016345;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JQOTuO0ay3jnbmCyrV9Ard99D6kHJ3/2lAgXKSOjMtU=;
  b=Va0Tx5l9jcvb8CAxvrboTOuiw++L4jcV0RqZcV22Gc3tmdtJh51Av4IU
   f6iUw961KPN2dv6+juzKX8KeOunCu+mPPuRkGf9qzWwBG5psXCAhSMUno
   stqKNPKGO70tpB6mrVqvM/gZCQO/klYeI8vv+4w+O1wB9mbxHIipM60qz
   +bJWT/fWQde7bEOwpbhJ9dwyoDDEidpQ7t9H7w5JznVGMO0CBpUNfwiAJ
   pg4Uf8ZBDd5WpwFkpHH1RsGsadpT4m9yw1C6D+ldO8ziDF2XKVAig2W3U
   Y/XJ6TW5nCr5zW/nFZoBV5QWf2dPc5C3tECk4OqV6N2tVsU8LXUanIJcn
   w==;
X-CSE-ConnectionGUID: Sdg4jLHuQHi13t9PIDqHbA==
X-CSE-MsgGUID: DZS81quwTfm6ahcrnB//qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="214613994"
X-IronPort-AV: E=Sophos;i="6.21,256,1763391600"; 
   d="scan'208";a="214613994"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 11:19:04 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id DBAC61002BB0
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 02:19:03 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 93516140062E
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 02:19:03 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 3BE9D180011D
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 02:19:00 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-networking][PATCH v2] openl2tp: Fix do_package_qa Issue
Date: Tue, 27 Jan 2026 10:18:45 +0800
Message-ID: <20260127021845.5464-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 02:19:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123894

Fix following issue when using customized kernel without kernel-module-l2tp-ppp enabled.
ERROR: openl2tp-1.8-r0 do_package_qa: QA Issue: openl2tp-ptest rdepends on kernel-module-l2tp-ppp, but it isn't a build dependency? [build-deps]

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
index 4e5b45891d..1d11d374fc 100644
--- a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
@@ -96,4 +96,5 @@ do_install_ptest () {
 }
 
 RDEPENDS:${PN} = "ppp ppp-l2tp bash"
-RDEPENDS:${PN}-ptest += "rpcbind kernel-module-l2tp-ppp procps-ps tcl"
+RDEPENDS:${PN}-ptest += "rpcbind procps-ps tcl"
+RRECOMMENDS:${PN}-ptest = "kernel-module-l2tp-ppp"
-- 
2.43.0



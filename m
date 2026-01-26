Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B99BC88E5A
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 07:16:44 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14859.1769411797501362565
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Jan 2026 23:16:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=I6d+K+1Y;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769411796; x=1800947796;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=V8iobVgI6rTbyoJRLS4jRO6TlCL2bA8glbZvxYyutSM=;
  b=I6d+K+1YIQbef3/n3L3zh8gFzzr2sySQLkZ8mwq7sc5+zVVsGmGb33xz
   OB/QWWJIjWCd+8xKdE02vszL4qluAKNluc2geD1tL8y+pCGZ0PwQmMHvn
   6OkZo51cRlTvKPNdE31tHgo/BxCkVaGfehPszE30Z7HGJ5FeUJQE6wHGs
   btS2kgn1qF13mv7a4gBcS+n8yLn0Ajh2fQLnTf+uiXnTU7Qrmi4UrJ6yY
   nw0HimWzfxYH78cnMq5vqAolg8C+TN8TJxKQVFPZDoZQxfWLq8KYY3qsp
   YpwuP1c2PSvzXF3oC+DdQKvyXnHVpCiKnNlzog5AZ+eKUoYWHKDPRt/vB
   Q==;
X-CSE-ConnectionGUID: /9mdb9LCTL6eMbhwqlGmpw==
X-CSE-MsgGUID: rPqR+85HQKqVIjdJbGrqOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="231144974"
X-IronPort-AV: E=Sophos;i="6.21,254,1763391600"; 
   d="scan'208";a="231144974"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.128])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 16:16:34 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 99B5F8203C7
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 07:16:35 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 51706C00549
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 07:16:35 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id EFD9E1800D59
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 07:16:32 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-networking][PATCH] openl2tp: Fix do_package_qa Issue
Date: Mon, 26 Jan 2026 15:16:27 +0800
Message-ID: <20260126071627.4466-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 07:16:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123859

Fix following issue when using customized kernel without kernel-module-l2tp-ppp enabled.
ERROR: openl2tp-1.8-r0 do_package_qa: QA Issue: openl2tp-ptest rdepends on kernel-module-l2tp-ppp, but it isn't a build dependency? [build-deps]

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
index 4e5b45891d..ac9dece2f9 100644
--- a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
@@ -97,3 +97,5 @@ do_install_ptest () {
 
 RDEPENDS:${PN} = "ppp ppp-l2tp bash"
 RDEPENDS:${PN}-ptest += "rpcbind kernel-module-l2tp-ppp procps-ps tcl"
+
+INSANE_SKIP:${PN}-ptest += "build-deps"
-- 
2.43.0



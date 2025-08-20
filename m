Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37EDECA0FEF
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 08:40:10 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.15252.1755679202311401295
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Aug 2025 01:40:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=p8ZRSsGr;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1755679202; x=1787215202;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=i8MbdU2kHoRWFmZROSOARWqEMUrL0/yxnQ9wvajIZyc=;
  b=p8ZRSsGrY7QtqMrKmGD+QnkwMUGLtW54VxcQmvCmXLfJ+hxgel7n1vxT
   bHniHrWySBOtxV/v0HFCnDEt7RbjhuZsd5zIJ9kTVI2d/5/fpzDsfJpCV
   P08Dy3qYLT9P2POSJJ9DGIatMTQDaTl74lvkcgSPZf6hcQ9vGW08hu6xR
   uDxHLM22bmVNmws5eGVZtajhsu7lQ0mC/wp17DH/tP39orqyGk2sG35o3
   xtdE2pIPd6QInNkox1buNYsyQrtv/DyOYFtY9YQWXlrEX8Wn/3vI0qDgB
   Tts45ci8TkKJ5BowGCy+xaIp7KTY53nUabWoSIkVcPxidSd83cMY8RoHJ
   Q==;
X-CSE-ConnectionGUID: IDtYkGgERFi7OkA+vRfuIQ==
X-CSE-MsgGUID: oNSTtwqYQC+2Wps7bxFmEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="197995205"
X-IronPort-AV: E=Sophos;i="6.17,302,1747666800"; 
   d="scan'208";a="197995205"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 17:40:00 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 91F7242A315
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:00 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 4E31F1C06BE2
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:00 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTPS id 492612000289
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:39:58 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 44AF91A0069;
	Wed, 20 Aug 2025 16:39:55 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 06/26] icewm: upgrade 3.8.1 -> 3.8.2
Date: Wed, 20 Aug 2025 16:39:25 +0800
Message-ID: <20250820083945.802-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250820083945.802-1-wangmy@fujitsu.com>
References: <20250820083945.802-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119019

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Use foldspaces to remove extraneous spaces.
- Also minimize fullscreen windows when clicking on a task button. Document
  the minimization feature of task buttons and the Ctrl modifier.
- Fix for keeping a menu inside the screen area.
- Fixes for adjusting the workarea when moving/sizing a do-not-cover window
- Fix to resize maximized windows when workarea grows and fix to recompute
  the workarea when a dock exits
- Don't synchronize with icewm after _NET_WORKAREA changes as it slows icewm
  down.
- Fix typo
- When the workarea changes, adjust the positions of all desktop icons.
- Drop excessive use of square brackets around double quotes.
- Improve the abstractions for the doNotCover computation inside
  updateWorkAreaInner.
- Add new "switchmenu" and "print" actions to icesh to use icesh in a
  "switchkey" definition in the "keys" file.
- Make the -Z filter work on non-Linux.
- Add mlterm for OpenBSD.
- Explain Dock layer.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-extended/icewm/{icewm_3.8.1.bb => icewm_3.8.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/icewm/{icewm_3.8.1.bb => icewm_3.8.2.bb} (94%)

diff --git a/meta-oe/recipes-extended/icewm/icewm_3.8.1.bb b/meta-oe/recipes-extended/icewm/icewm_3.8.2.bb
similarity index 94%
rename from meta-oe/recipes-extended/icewm/icewm_3.8.1.bb
rename to meta-oe/recipes-extended/icewm/icewm_3.8.2.bb
index 597ff3f083..ad92b7b294 100644
--- a/meta-oe/recipes-extended/icewm/icewm_3.8.1.bb
+++ b/meta-oe/recipes-extended/icewm/icewm_3.8.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4a26952467ef79a7efca4a9cf52d417b"
 SRC_URI = "https://github.com/ice-wm/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.lz \
            file://0001-configure.ac-skip-running-test-program-when-cross-co.patch \
            "
-SRC_URI[sha256sum] = "3c525512b1e4f4cf7999a4687f1b82311d7448d8c174780b5efd3b8aafbfb4a2"
+SRC_URI[sha256sum] = "c64b1b7c8ee262a3c4796be57349a3198998564d70ed26f11e724e1b73d48394"
 
 UPSTREAM_CHECK_URI = "https://github.com/ice-wm/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.43.0



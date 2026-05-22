Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20296CD5BB0
	for <webhook@archiver.kernel.org>; Fri, 22 May 2026 09:06:44 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13034.1779440802620648950
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 May 2026 02:06:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=A/UpAFac;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779440802; x=1810976802;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=KGqNk6tS1J8c2c4GJBOnFvjJUj0Hts58Tjbnt6bowH0=;
  b=A/UpAFac/qJuKAjhedcukMo9MM0UHB2yhS1QupKxGa2kg6DcJjSrPXU4
   /Cm7vGwkm/94TT3uBWnCESV/oyAsI82ogvi68SVQL9M0jqu6nTr20dh17
   tlfWZ4Gi1jVdpNKsq1l1iZGraLIfHbdO4fTiQlJzLDoI3CE+GoOJyS6Sw
   toeJ0HaK+IuwtGPBO1NxkBU5dqNhUq2I6QQemqETyNBlHieJekNlCQqWG
   xre2+ltrhXe57lVn0eC1JUUo+yQSrhTHeUXcRUG4B3bPABMaDUrzwIjp3
   eyX8sHCYJFABwZ3Ictj65cFW9G+4jmdpczdtZHL3WzKR2Ogf/qqJPq3QP
   Q==;
X-CSE-ConnectionGUID: XB95bQ+tRay/E2nAD0ZkMw==
X-CSE-MsgGUID: nI96mU9GR6iiWQeGm3jWoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="228860070"
X-IronPort-AV: E=Sophos;i="6.24,162,1774278000"; 
   d="scan'208";a="228860070"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 18:06:41 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id EA0A9C006E3
	for <openembedded-devel@lists.openembedded.org>; Fri, 22 May 2026 09:06:40 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id A4079822C06
	for <openembedded-devel@lists.openembedded.org>; Fri, 22 May 2026 09:06:40 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 4B68910071B2;
	Fri, 22 May 2026 09:06:38 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] tigervnc: Fix do_configure Error
Date: Fri, 22 May 2026 17:06:34 +0800
Message-ID: <20260522090634.469-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 May 2026 09:06:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127146

From: Wang Mingyu <wangmy@fujitsu.com>

update version of xorg-xserver according to oe-core
WARNING: tigervnc-1.16.2-r0 do_configure: TigerVNC xorg-server version (21.1.21) is different from oe-core's xorg-xserver version (21.1.22)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.2.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.2.bb
index c9b0cd2404..a35ab2e3da 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.2.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.2.bb
@@ -26,10 +26,10 @@ SRC_URI = "git://github.com/TigerVNC/tigervnc.git;branch=1.16-branch;protocol=ht
 
 # Keep sync with xorg-server in oe-core
 XORG_PN ?= "xorg-server"
-XORG_PV ?= "21.1.21"
+XORG_PV ?= "21.1.22"
 SRC_URI += "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${XORG_PV}.tar.xz;name=xorg"
 XORG_S = "${UNPACKDIR}/${XORG_PN}-${XORG_PV}"
-SRC_URI[xorg.sha256sum] = "c0cbe5545b3f645bae6024b830d1d1154a956350683a4e52b2fff5b0fa1ab519"
+SRC_URI[xorg.sha256sum] = "1a242c8917c49ba29ccc1f6021613d8a2b9805dd0d271a66ae9d09f4b0bb06b3"
 
 # It is the directory containing the Xorg source for the
 # machine on which you are building TigerVNC.
-- 
2.43.0



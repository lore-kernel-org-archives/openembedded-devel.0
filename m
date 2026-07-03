Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB1ADC43458
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 07:35:47 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.88196.1783064137256469755
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jul 2026 00:35:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RocAUb/s;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1783064139; x=1814600139;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/B7CqyjcKWR7IVW5Fer/uzYjrDny1NGnz30ujhwaMjY=;
  b=RocAUb/s8GycQB0LRCBMmuuNcKORfEiqYKWfFrXfPnikQVPZ+rPCSrv6
   nFQVTGHNPREgF9sBY2FE3V+8iidrDZ9ni3eSt1LOxBLW1WQVbiy5UZxKL
   dK0Y5PLLfZ2U/4ckrEVS6EcJSxZdHNAipR467/pkdJnJaoH+XqdWN393u
   IQMDuiGmmYSNV3THW5+SoFTSDjNpX0IAvm+Agl8x9Q3ZKEbwYVk/ZCr27
   L6KIZnw41lW5fTemx9+Y3IUnCnhtnXPX9T8G4kgdll8gZQv/SXCpg1na3
   7pKZLa2G4Y/v1vnZihnnqiZtiBoocWZo4f04H7iH5//Mm58/qOejcjPWL
   w==;
X-CSE-ConnectionGUID: pF/V1bAQTwalRd2iRowLFg==
X-CSE-MsgGUID: cD66DUx+T56AXBegSILVZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="249619302"
X-IronPort-AV: E=Sophos;i="6.25,145,1779116400"; 
   d="scan'208";a="249619302"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 16:35:37 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 698118204C2
	for <openembedded-devel@lists.openembedded.org>; Fri,  3 Jul 2026 07:35:35 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 2329D18002CA
	for <openembedded-devel@lists.openembedded.org>; Fri,  3 Jul 2026 07:35:35 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 3AE73100714B;
	Fri,  3 Jul 2026 07:35:32 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] tigervnc: Fix do_configure Error
Date: Fri,  3 Jul 2026 15:35:29 +0800
Message-ID: <20260703073529.1979-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Jul 2026 07:35:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128005

From: Wang Mingyu <wangmy@fujitsu.com>

update version of xorg-xserver according to oe-core
WARNING: tigervnc-1.16.2-r0 do_configure: TigerVNC xorg-server version (21.1.22) is different from oe-core's xorg-xserver version (21.1.23)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.2.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.2.bb
index 4964a441c8..bbe0f5c5af 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.2.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.2.bb
@@ -26,10 +26,10 @@ SRC_URI = "git://github.com/TigerVNC/tigervnc.git;branch=master;protocol=https \
 
 # Keep sync with xorg-server in oe-core
 XORG_PN ?= "xorg-server"
-XORG_PV ?= "21.1.22"
+XORG_PV ?= "21.1.23"
 SRC_URI += "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${XORG_PV}.tar.xz;name=xorg"
 XORG_S = "${UNPACKDIR}/${XORG_PN}-${XORG_PV}"
-SRC_URI[xorg.sha256sum] = "1a242c8917c49ba29ccc1f6021613d8a2b9805dd0d271a66ae9d09f4b0bb06b3"
+SRC_URI[xorg.sha256sum] = "e39832e5617dadaf072fdf9f0e19e5d2e1c2a13607ac280bac1aba9f8fe14634"
 
 # It is the directory containing the Xorg source for the
 # machine on which you are building TigerVNC.
-- 
2.43.0



Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0BB6EA796F
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 05:15:07 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14283.1770268501107063590
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 21:15:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MiMKe069;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770268501; x=1801804501;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BtHLuXFomSe9IJi4RlEnQaOEDQ0gkUex/Q1u9afgp/k=;
  b=MiMKe069lm31jcoTngivpZobVz4bIC1N1AJVVlbxm16BNUvDbVHyBIoA
   mio97pp3FM6ghsOKNRsa/7Us0DhBRet8CKPkU3fkTCoKahdfUvupQJDuS
   +kjGshTHJmg9qHwwF0JbwJOH1RTuV3j5dOwo50C1P0OysB9jRQ7xyTDMd
   SjOwCZ57kohIrJDBSRULBqdpSGdU5Wi9QrEoumkxy4MazkkhkewRZ9bbT
   gnfLZfeE8YZLFol60DDk12N0vMOHemtB8TKw99m9xzsCPjLoTOQiy+MJ+
   gu0Lc4XS962MIWMe6x9lqePkYtFc6U2evv0tSnf0BWNR1VxWZkkiBy6xG
   w==;
X-CSE-ConnectionGUID: c1E50Lk/QFGtekvm4yhaGg==
X-CSE-MsgGUID: q3YPucJ0ToymuhnKTa5q0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="207583692"
X-IronPort-AV: E=Sophos;i="6.21,274,1763391600"; 
   d="scan'208";a="207583692"
Received: from unknown (HELO mail.fujitsu.com) ([20.61.8.234])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 14:14:59 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.fujitsu.com (Postfix) with ESMTPS id 4EAC01000373
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Feb 2026 05:14:59 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 04D441007118
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Feb 2026 05:14:59 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 66EB020000C1;
	Thu,  5 Feb 2026 05:14:56 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 01/24] gparted: upgrade 1.7.0 -> 1.8.0
Date: Thu,  5 Feb 2026 13:14:11 +0800
Message-ID: <20260205051435.1366-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 05:15:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124153

From: Wang Mingyu <wangmy@fujitsu.com>

Key changes
=============
  * Fix crash due to not checking for failure to load icon
  * Fix hangs setting FAT label when matches a root folder entry
  * Erase file system signatures before all FileSystem copies

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gparted/{gparted_1.7.0.bb => gparted_1.8.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-extended/gparted/{gparted_1.7.0.bb => gparted_1.8.0.bb} (93%)

diff --git a/meta-gnome/recipes-extended/gparted/gparted_1.7.0.bb b/meta-gnome/recipes-extended/gparted/gparted_1.8.0.bb
similarity index 93%
rename from meta-gnome/recipes-extended/gparted/gparted_1.7.0.bb
rename to meta-gnome/recipes-extended/gparted/gparted_1.8.0.bb
index ec221a140f..dec9ea01ae 100644
--- a/meta-gnome/recipes-extended/gparted/gparted_1.7.0.bb
+++ b/meta-gnome/recipes-extended/gparted/gparted_1.8.0.bb
@@ -11,7 +11,7 @@ SRC_URI = " \
     ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${BPN}-${PV}/${BPN}-${PV}.tar.gz \
     ${@bb.utils.contains('DISTRO_FEATURES', 'polkit', 'file://0001-Install-polkit-action-unconditionally-executable-pke.patch', '', d)} \
 "
-SRC_URI[sha256sum] = "84ae3b9973e443a2175f07aa0dc2aceeadb1501e0f8953cec83b0ec3347b7d52"
+SRC_URI[sha256sum] = "f584ed4be7fd09c2cf6a784778a8540970d985f0ac8e5a7bd0628528a3ab5609"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/gparted/files/gparted/"
 UPSTREAM_CHECK_REGEX = "gparted-(?P<pver>\d+\.(\d+)+(\.\d+)+)"
-- 
2.43.0



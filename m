Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DC91D3E798
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 06:31:13 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.40017.1730874669307463858
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 22:31:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mzCHBOlS;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1730874669; x=1762410669;
  h=from:to:cc:subject:date:message-id;
  bh=97oPi4llmL7ZyvDOfW+C/KPyHCojUZFfB6wx7IoJSwA=;
  b=mzCHBOlSOgaRTnBAazNLsLb/WSh2KT87gKyQ8RmZXDGly+ggR7xQdn8G
   wJuRIcOEzbNL2KFSw04TNfNr4JiZJNhHPqUh7Ij/qy0lapMzfTqlWMqyR
   tcRGyd4jJB7YV7y73k5afPYz1x6sTRXas8jy2VkoaEyZcdpseihPs+zLl
   kjmF700Mi57JY/5He2L3qcTEigsHWI7Nbz4jgAzO2WkIplASdylsgUd2O
   14l1mYAi2/ASwCVUjfvsZPymOlM2ydkqwR/fQW/1D34BS+IoiI21OR9tj
   emDJ+CtYkMubQbwGJrq9o3IL7RYHSIDsq3M8YJgL8Ow4LylKgn349QcTR
   Q==;
X-CSE-ConnectionGUID: 8jpoErzpRh+BMnQqN0+uYQ==
X-CSE-MsgGUID: vcV1r6vNTYuPIp3MEw+mWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="167635970"
X-IronPort-AV: E=Sophos;i="6.11,262,1725289200"; 
   d="scan'208";a="167635970"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 15:31:07 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id EE29ACC142
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:04 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3197EBF3EF
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:04 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id B8FAB20071A01
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:03 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 45BE71A000A;
	Wed,  6 Nov 2024 14:31:03 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 01/46] babl: upgrade 0.1.108 -> 0.1.110
Date: Wed,  6 Nov 2024 14:30:15 +0800
Message-Id: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28778.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28778.005
X-TMASE-Result: 10-1.214700-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrG24YVeuZGmPR1Qg9nsVYMtlQ
	tUFiiij6kjISQZdTp9+ysMXN8ch2JgE4dbnyjMJa/HTKStsDGMLBOVz0Jwcxl0fyM5VfgjG2VxH
	qSBgT+wsNUccATRyd1J7nIUt1j4g8j2hRzH1UwuAURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO0Nst
	CXmf87HKaimT+RiP1AFvA92X9tDjbaaH9W6GLQ+PvoVtBLmG3vGwMu99OUhLdjyAAt4HurOAPuG
	GsT3OI1ZXCpV3ASy/Q/ssKgfZ9JAPIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 06:31:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113686

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fixes to alpha componet in HCY, HSL, HSV and YCbCr models.
- Use same CIE Lab conversion for start/end as rest with SIMD.
- Remove reliance on set rounding mode.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-gimp/babl/{babl_0.1.108.bb => babl_0.1.110.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gimp/babl/{babl_0.1.108.bb => babl_0.1.110.bb} (84%)

diff --git a/meta-gnome/recipes-gimp/babl/babl_0.1.108.bb b/meta-gnome/recipes-gimp/babl/babl_0.1.110.bb
similarity index 84%
rename from meta-gnome/recipes-gimp/babl/babl_0.1.108.bb
rename to meta-gnome/recipes-gimp/babl/babl_0.1.110.bb
index e0685f781..a15419c4a 100644
--- a/meta-gnome/recipes-gimp/babl/babl_0.1.108.bb
+++ b/meta-gnome/recipes-gimp/babl/babl_0.1.110.bb
@@ -10,7 +10,7 @@ inherit setuptools3 gnomebase gobject-introspection vala
 DEPENDS += "lcms"
 
 SRC_URI = "https://download.gimp.org/pub/${BPN}/0.1/${BP}.tar.xz"
-SRC_URI[sha256sum] = "26defe9deaab7ac4d0e076cab49c2a0d6ebd0df0c31fd209925a5f07edee1475"
+SRC_URI[sha256sum] = "bf47be7540d6275389f66431ef03064df5376315e243d0bab448c6aa713f5743"
 
 FILES:${PN} += "${libdir}/${BPN}-${@gnome_verdir("${PV}")}"
 
-- 
2.34.1



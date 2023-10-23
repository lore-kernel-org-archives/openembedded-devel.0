Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23C60C00A8F
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 23:32:25 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.136280.1698103938183104435
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 16:32:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="137283782"
X-IronPort-AV: E=Sophos;i="6.03,246,1694703600"; 
   d="scan'208";a="137283782"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 08:32:17 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 99F3FDDC78
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Oct 2023 08:32:13 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id C91D5D5D50
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Oct 2023 08:32:12 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1FD0B2005A580;
	Tue, 24 Oct 2023 08:32:12 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-semver: upgrade 3.0.1 -> 3.0.2
Date: Tue, 24 Oct 2023 07:31:59 +0800
Message-Id: <1698103919-31568-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27954.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27954.003
X-TMASE-Result: 10--1.840300-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrTfK5j0EZbytf0yVReoVM7f4Q
	R/7oUDJy4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat054xHfiujuTbed1vZ
	7s3YIVDJ6eUBjjG/BIC5rYfHE0OO95UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO2mZ3
	96Gt5HhVRP35RSloIr54OqqFv2Ld3O2rTygA/RIqHuNrsfyFTjktKC3WAHVKsVjdUmf+qBKNpkc
	DllDsRSzBJR6kgqxE9bm4ORPbITaPIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 23:32:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105692

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
PR #418: Replace OrderedDict with dict.
PR #426: Fix replace() method to use the derived class of an instance instead of Version class.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-semver_3.0.1.bb => python3-semver_3.0.2.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-semver_3.0.1.bb => python3-semver_3.0.2.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-semver_3.0.1.bb b/meta-python/recipes-devtools/python/python3-semver_3.0.2.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-semver_3.0.1.bb
rename to meta-python/recipes-devtools/python/python3-semver_3.0.2.bb
index 2d85d789c7..f90ea0c9dc 100644
--- a/meta-python/recipes-devtools/python/python3-semver_3.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-semver_3.0.2.bb
@@ -4,8 +4,7 @@ BUGTRACKER = "https://github.com/python-semver/python-semver"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=d9da679db3bdce30a1b4328d5c474f98"
 
-SRC_URI[md5sum] = "b7502c12ce325ffffeab694fed52f6f5"
-SRC_URI[sha256sum] = "9ec78c5447883c67b97f98c3b6212796708191d22e4ad30f4570f840171cbce1"
+SRC_URI[sha256sum] = "6253adb39c70f6e51afed2fa7152bcd414c411286088fb4b9effb133885ab4cc"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.34.1



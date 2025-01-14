Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08620C0218E
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 08:29:13 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.40063.1736843345148134031
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jan 2025 00:29:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=F0PvLb8s;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736843345; x=1768379345;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=VVhELtUeSWs1Z82xftNrgdAL+lyC3UVWGmgAHoenZQg=;
  b=F0PvLb8sbTOcfPopj9g/rUQT2zPoYWm1Xp45JUvoKR/57mD3N9y/DlSO
   58v8tnKIVyhtXVVf+Co7rL3IfWu8UE4EL+ZkwdnRypOW3euH5xVCyTwPl
   SqwOxAaUj9uMtqLjos+x33hZCcY/oi3q3D/tZl2FqxOeCfLlSu1yumb5m
   SSU4sYWHmC4yglnM0mwEBqQb3fPAdo1zgiNd2GUq4vktRxO/HK4OUYarV
   NuozrypYtAykcQMnftHlAgln21XEmgGT4b/PKxykFBV/R+Ymx3ogN1AFf
   FkdfamS83ROrrV8iCVYzw4eX/1a65yyAXFH+hOqgFQptnJcZH6oo4XghQ
   g==;
X-CSE-ConnectionGUID: RGNEH+2wTZ6VDhgU5RV4Lw==
X-CSE-MsgGUID: qcOgIy5zR6+4BJKbwF0nMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="165408968"
X-IronPort-AV: E=Sophos;i="6.12,313,1728918000"; 
   d="scan'208";a="165408968"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 17:29:03 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id E2873DE679
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:00 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id BB7AABF4BC
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:00 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4FAEB6B5DB
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:00 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id F22481A000B;
	Tue, 14 Jan 2025 16:28:59 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 06/30] iniparser: upgrade 4.2.4 -> 4.2.5
Date: Tue, 14 Jan 2025 16:28:25 +0800
Message-Id: <1736843329-4131-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1736843329-4131-1-git-send-email-wangmy@fujitsu.com>
References: <1736843329-4131-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28922.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28922.006
X-TMASE-Result: 10-5.760100-10.000000
X-TMASE-MatchedRID: +qH7TW9/Rkejz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvLe/vEwLULpNb5
	DJLIuMyDqhFfSSgWfh0k8on6OCeYxkABqHcElQzsCtzGvPCy/m6ZmLDnd2pI33y/Hx1AgJrrV8u
	Vka6dpKO3IAm6OhmFjcA03P8DYBHDdgynGfPk5sq5bvv/Lz3qyOTAXNPNyDOEob0wM+LZfRK+qc
	W0zo2r8vu0HEWlaGvJxiiH+oQX+1WhhjsqgSuNbxF4zyLyne+A+KgiyLtJrSBgDeovr2terpFjQ
	nJ9F0Di835cqE5FoUWAMuqetGVetnyef22ep6XYsjvNV98mpPPdN5XnYl8DpTqScEckz0Smq/VJ
	oBmK+IOvyk58NVdxpO5GVcEd1I+a6TTAFIruGzVBNIv7g/VxhckrLtN+0ugCd3LBtkt1Je0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 08:29:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114850

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix stack buffer overflow in iniparser dump functions (#175)
- Update doxygen main page, merge it with README and use it as new main page
- Explain how to build documentation as it not build per default
- Stylize the name iniParser as it used to be done
- Mention CMake options to prevent them from being overlooked
- Add build instructions for MinGW
- Replace outdated installation instructions by link to README sections
- Remove section numbers from README
- add DESCRIPTION, HOMEPAGE_URL and LANGUAGES in cmake project()
- Fix MSVC build issues

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../iniparser/{iniparser_4.2.4.bb => iniparser_4.2.5.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/iniparser/{iniparser_4.2.4.bb => iniparser_4.2.5.bb} (91%)

diff --git a/meta-oe/recipes-support/iniparser/iniparser_4.2.4.bb b/meta-oe/recipes-support/iniparser/iniparser_4.2.5.bb
similarity index 91%
rename from meta-oe/recipes-support/iniparser/iniparser_4.2.4.bb
rename to meta-oe/recipes-support/iniparser/iniparser_4.2.5.bb
index aeac9c30ba..dd2c97ed04 100644
--- a/meta-oe/recipes-support/iniparser/iniparser_4.2.4.bb
+++ b/meta-oe/recipes-support/iniparser/iniparser_4.2.5.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://gitlab.com/iniparser/iniparser"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8474d3b745f77e203f1fc82fb0bb7678"
 SRCBRANCH = "main"
-SRCREV = "4e5d1cc10215ce328c61bb5fd7839746e47375f9"
+SRCREV = "19e0ad6c37440ba52313e10c6e148dfb9ab417f6"
 
 SRC_URI = "git://gitlab.com/iniparser/iniparser.git;protocol=https;branch=${SRCBRANCH}"
 S = "${WORKDIR}/git"
-- 
2.43.0



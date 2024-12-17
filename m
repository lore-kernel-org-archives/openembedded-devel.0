Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B152E77189
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 09:01:56 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.77391.1734426114187451494
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Dec 2024 01:01:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pOOMkQnU;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1734426114; x=1765962114;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=NDrmvrZm/ndEeEDO8jMKQ989XJ6jtBTPno3PJOo2cH4=;
  b=pOOMkQnU38uTRcEoEizj2VmAqafUFQPRgwKtDPl0B5aHQNL2/RVwmsvq
   5mbYSwe2AHH43/OOttyVnDpQLUoypK1SgMyqgIDiDLxf9+vyk3LHL6kXu
   syEPyJ47ulU9BC+ATe3eteR5zBj1NdoScuZWSOfZL8q9ndUQjtStr6mQL
   rEfvtgCm30AboWKWvwKKl6n/nzoETBIvZBU+RmfxBnie6ZGYhZrX04LXI
   zLXDS0yCFAUr2MJ+zcetCMCoG9SsC2+36ewGjS3Tl7/YJa9CyhV6Ea8Vx
   uS2stS7qL9g+QkBuircxuOsYEGp357PRQt5jGQfz1PoTor9jTUkqmFXrF
   g==;
X-CSE-ConnectionGUID: KIz3vH2DQZuCVQsMwLHb/g==
X-CSE-MsgGUID: jolnQkysT46NEvrUnrjkUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="162907789"
X-IronPort-AV: E=Sophos;i="6.12,241,1728918000"; 
   d="scan'208";a="162907789"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 18:01:51 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id EAED1DBB80
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 18:01:49 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id BAB4BBF4B5
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 18:01:49 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4C5886B5DE
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 18:01:49 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E917E1A000B;
	Tue, 17 Dec 2024 17:01:48 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 05/17] libp11: update 0.4.12 -> 0.4.13
Date: Tue, 17 Dec 2024 17:01:24 +0800
Message-Id: <1734426096-18300-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1734426096-18300-1-git-send-email-wangmy@fujitsu.com>
References: <1734426096-18300-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28864.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28864.006
X-TMASE-Result: 10--7.687000-10.000000
X-TMASE-MatchedRID: UJ6veyNP8i9PImw1y5q7/Do39wOA02LhQRlUSJjs8Z8H4DTIEE89jHZX
	sEsONi+6e3M/yhx36J/YnvwuHYT0llauxX/4AlrJSCtgxgcsrMontGeqbHuvm4EBeX0uQ+npGnn
	tem/mx4m0E5U0RtwY29nDfPQJCmqgowve/cNZOwwD2WXLXdz+AQmWvXEqQTm5pKG9GN+fhxTr5/
	zvfXByhQgvGgJhnjup6l71yjwYOQZlYwkarmHZPhF4zyLyne+ANte7AWpKXSu1eX0jEQ9c6hIPP
	xEfbhaQLHIj5fmYf3N3TaF7+lCZvnuK0oT3XHU2Nm/L/g1WpIubQfYveSNCClgLks93sG9tnG9d
	GjrHhg+CLKsVcKTRRiuCG6amdB+Zf0iF5TZPPO9oMLOoNHsM9uEpCHUsKYYGXE5Co/aUb2CjxYy
	RBa/qJShNCXvA0fw+A/nNPR3f3dw7AFczfjr/7LloKohBgUhu+DdHiIYiTkIS6/q2rR4EGVwBBe
	5ZARpg/bgpS7AJOvI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 09:01:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114355

From: Wang Mingyu <wangmy@cn.fujitsu.com>

0001-detect-correct-openssl-3.x.patch
removed since it's included in 0.4.13

Changelog:
=========
- Increased maximum PIN length
- Fixed several memory leaks
- Don't include libp11.rc VERSIONINFO into pkcs11
- Reimplement CI with GitHub Actions
- Improved tests
- Added static ENGINE (libpkcas11.a) build
- Added a workaround broken foreign key handling in OpenSSL
  3.0.12-3.0.13, 3.1.4-3.1.5, 3.2.0-3.2.1
- Added a workaround for conflicting atexit() callbacks
- Always login with PIN If FORCE_LOGIN is specified in openssl config
- Added OAEP support to RSA_private_decrypt
- Added PKCS11_enumerate_*_ext functions
- Fixed non-null-terminated label padding
- Fixed several object management issues
- Deferred libp11 initialization until needed

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../0001-detect-correct-openssl-3.x.patch     | 28 -------------------
 .../{libp11_0.4.12.bb => libp11_0.4.13.bb}    |  6 ++--
 2 files changed, 2 insertions(+), 32 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libp11/files/0001-detect-correct-openssl-3.x.patch
 rename meta-oe/recipes-support/libp11/{libp11_0.4.12.bb => libp11_0.4.13.bb} (87%)

diff --git a/meta-oe/recipes-support/libp11/files/0001-detect-correct-openssl-3.x.patch b/meta-oe/recipes-support/libp11/files/0001-detect-correct-openssl-3.x.patch
deleted file mode 100644
index aa61e9d979..0000000000
--- a/meta-oe/recipes-support/libp11/files/0001-detect-correct-openssl-3.x.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 74497e0fa5b69b15790d6697e1ebce13af842d4c Mon Sep 17 00:00:00 2001
-From: Mike Gilbert <floppym@gentoo.org>
-Date: Thu, 13 Jul 2023 13:52:54 -0400
-Subject: [PATCH] configure: treat all openssl-3.x releases the same
-
-OpenSSL's soversion will not change for any 3.x minor release.
-
-https://www.openssl.org/policies/general/versioning-policy.html
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Upstream-Status: Backport [https://github.com/OpenSC/libp11/commit/74497e0fa5b69b15790d6697e1ebce13af842d4c.patch]
-Signed-off-by: Sana Kazi <sanakazi720@gmail.com>
-
-diff --git a/configure.ac b/configure.ac
-index b96979d9..c344e84a 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -33,7 +33,7 @@ AC_C_BIGENDIAN
- # issues with applications linking to new openssl, old libp11, and vice versa
- case "`$PKG_CONFIG --modversion --silence-errors libcrypto || \
- 	$PKG_CONFIG --modversion openssl`" in
--	3.0.*) # Predicted engines directory prefix for OpenSSL 3.x
-+	3.*) # Predicted engines directory prefix for OpenSSL 3.x
- 	    LIBP11_LT_OLDEST="3"
- 	    debian_ssl_prefix="openssl-3.0.0";;
- 	1.1.*) # Predicted engines directory prefix for OpenSSL 1.1.x
diff --git a/meta-oe/recipes-support/libp11/libp11_0.4.12.bb b/meta-oe/recipes-support/libp11/libp11_0.4.13.bb
similarity index 87%
rename from meta-oe/recipes-support/libp11/libp11_0.4.12.bb
rename to meta-oe/recipes-support/libp11/libp11_0.4.13.bb
index cc4a138e2d..74c70df180 100644
--- a/meta-oe/recipes-support/libp11/libp11_0.4.12.bb
+++ b/meta-oe/recipes-support/libp11/libp11_0.4.13.bb
@@ -9,11 +9,9 @@ LICENSE = "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fad9b3332be894bab9bc501572864b29"
 DEPENDS = "libtool openssl"
 
-SRC_URI = "git://github.com/OpenSC/libp11.git;branch=master;protocol=https \
-    file://0001-detect-correct-openssl-3.x.patch \
-"
+SRC_URI = "git://github.com/OpenSC/libp11.git;branch=master;protocol=https"
 
-SRCREV = "53d65dc48cf436694f7edcfc805414e608e8a2bf"
+SRCREV = "6d669183c7b241ce47ecce28744837ad92814f5c"
 
 UPSTREAM_CHECK_GITTAGREGEX = "libp11-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.43.0



Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96325D29FA9
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 06:33:04 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.40154.1730874775709442830
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 22:32:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dLofLA/t;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1730874776; x=1762410776;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Dz0YQdoY3SuEypk8KcNyqwoZw6ZS7uu4y81Qn5kkxTc=;
  b=dLofLA/t3EeZc5yFaNXxScQP9oJ1LXoa8yYXmkaUdaU8BnMNSVUjqpSd
   ofGXRYvuRzzHb7+xOFMM0vL2ObrK+q6/vggY7Uoj1GOE2UYqzXhgYUTNn
   FG8R0sRa+O+jQNqvCSAVZv+1m1wgBQfqjoKjceUqbDOYXnHIuhZM42+zJ
   XDLJzdgftXvVpiaZ9wVbb9UlVHCIplIz6otglt6C0rh29YdKtnbndl9M8
   eIQB7gLTxoGsLDCiCflL3vETHTUbZ/Pv2qAUuY6vpsUnAIJSDBoDnSF6j
   D77IBllPspgh48a0QjIyhVpyXV6bDqdI7fybPqQXVlIzSvLA1Z62LUg1H
   w==;
X-CSE-ConnectionGUID: tmsacsYtQ024K+Kf0YjI1g==
X-CSE-MsgGUID: N6pKeXVbRaae78xx14jlqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="181534216"
X-IronPort-AV: E=Sophos;i="6.11,262,1725289200"; 
   d="scan'208";a="181534216"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 15:32:55 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 856EBC684A
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:32:52 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id B6649D3F0A
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:32:51 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3D33A6B5E7
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:32:51 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E02A01A000A;
	Wed,  6 Nov 2024 14:32:50 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 45/46] ttf-abyssinica: upgrade 2.201 -> 2.300
Date: Wed,  6 Nov 2024 14:30:59 +0800
Message-Id: <1730874660-2364-45-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
References: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28778.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28778.005
X-TMASE-Result: 10-1.884900-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yblu+/8vPerIVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTjhVAkZR7rH/hDDq/XyZmS/7QU2czuUN71Wx2uUbPLcQtuqs6BbPJ2AN6i+va16uBoa
	RMwn0B/fIfQzSjbIo6guinfgZ2xrHhKtME2+Ce8lXLxs5IwzrsH0tCKdnhB58hYfw868k05b3PD
	iXO/tFSY6HM5rqDwqtRnW1XtaLOIJlADQZHAP9qdiR0CfsSAMoMAGLoo0lfz2r/xgrnl9Em9qTF
	5p6D1+s7mloyx8FqO3DsRpsIFIpKYK3aLZbRl5AHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 06:33:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113730

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:
 Copyright url changed
 FAQ url changed

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{ttf-abyssinica_2.201.bb => ttf-abyssinica_2.300.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/ttf-fonts/{ttf-abyssinica_2.201.bb => ttf-abyssinica_2.300.bb} (71%)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-abyssinica_2.201.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-abyssinica_2.300.bb
similarity index 71%
rename from meta-oe/recipes-graphics/ttf-fonts/ttf-abyssinica_2.201.bb
rename to meta-oe/recipes-graphics/ttf-fonts/ttf-abyssinica_2.300.bb
index 1253cf883..beb2cf2ff 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-abyssinica_2.201.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-abyssinica_2.300.bb
@@ -3,7 +3,7 @@ require ttf.inc
 SUMMARY = "Ethiopia and Eritrea (Amharic) font - TTF Edition"
 HOMEPAGE = "http://software.sil.org/abyssinica/"
 LICENSE = "OFL-1.1"
-LIC_FILES_CHKSUM = "file://OFL.txt;md5=347eaa34fdf555aaf6b2144a5ccca45b"
+LIC_FILES_CHKSUM = "file://OFL.txt;md5=6c56db018aa8803f8aff326829e3ce32"
 
 SRCNAME = "AbyssinicaSIL"
 SRC_URI = "http://software.sil.org/downloads/r/abyssinica/${SRCNAME}-${PV}.zip"
@@ -11,7 +11,7 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 UPSTREAM_CHECK_URI = "https://software.sil.org/abyssinica/download/"
 
-SRC_URI[sha256sum] = "961259a1d9ace083f737eb1e55cec40c9a56f4855866d7474bf212d2a4366ab8"
+SRC_URI[sha256sum] = "725e6cd58be6495e0e53f367608db36d9f818498bccba739d742892c5a3d8151"
 
 FONT_PACKAGES = "${PN}"
 FILES:${PN} = "${datadir}"
-- 
2.34.1



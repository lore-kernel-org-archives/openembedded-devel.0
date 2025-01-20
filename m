Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41EB4C02192
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 08:14:21 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.32741.1737360857036511562
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jan 2025 00:14:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fmejIo77;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1737360857; x=1768896857;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=OfI/fIiU0P4TAvfuZ0RSO1ROeFq8QZ3c3AgbgHVrLuY=;
  b=fmejIo77O5UVq9HIeZpWxkDZVignn/wP0D4tirevmk39cur/3C6TbZ7y
   o43Tb+3lUFKWEtuXEAQ3T+/DxR/Eo6f11oPUYukEeCjIiDXTnoyq46ZUl
   zakjdpWrHTbCO5z/MphPnzD50AsR2hoMsTjoRNg4jBNDn1Oe78vPtqiiM
   nDAuMFYjcs1x5BXBcmHMByRkvnFwsoDej9BYc0EPKHcQ+fkQ3gaIIoAM2
   fl0ZhdcpkQPlTXGr9S44v7Pi5W14/FoHrYJ0bszdEZ6ooyOk0/30LlPzX
   +VD51E2PIrhxP6EfQC41bU4NTQOpg6wCYnD2onRsGcFkNeQCywwr6FOJL
   Q==;
X-CSE-ConnectionGUID: UgN/33LHTI+hyde9GyjaNQ==
X-CSE-MsgGUID: ljo8/dexQPuCHSBzl0cJKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="175491029"
X-IronPort-AV: E=Sophos;i="6.13,218,1732546800"; 
   d="scan'208";a="175491029"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 17:14:14 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id BFA7ED4814
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:12 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 93FFDBF3EF
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:12 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2EF2720071A22
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:12 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D1D901A0071;
	Mon, 20 Jan 2025 16:14:11 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/32] dialog: upgrade 1.3-20240619 -> 1.3-20250116
Date: Mon, 20 Jan 2025 16:13:38 +0800
Message-Id: <1737360846-4824-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1737360846-4824-1-git-send-email-wangmy@fujitsu.com>
References: <1737360846-4824-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28934.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28934.006
X-TMASE-Result: 10-5.226000-10.000000
X-TMASE-MatchedRID: QR1SVCCbVGSjz0nOeth/yUIIxwDaU5mrXs5nqGvDCfNYvmOtXa0QtsAo
	6b+EBkLgeYnXOghZwC4xfzRy6VohedFMBnmJRh/J9QPBN24tSRxN8rmPQRlvK8iCh8yBqE+tyPZ
	WszY8usAHfklSbQowAA3KvrUy7pE6bRev5+PfDD/y3h9RQZ4StME5XPQnBzGXtLALfOrPJxTSn0
	NplHOg3WUVI5FRUTheNuheCzl0IIiVwSrFT4gy2fSG/+sPtZVkfS0Ip2eEHnwj/1Rbkzl1EwuTL
	po5HEc1joczmuoPCq2ZkyuNNh/CsHW6ICg7x+J+qQ0YmQo/MAK+OaowV2rvCVKHtfMHHJxhefZV
	ff3lHKzKWnkH/7wVmu4bBioyv/wSyrcroaUsC1d+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 08:14:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114966

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- modify dialog-config.in to allow for include-subdirectory.
- update configure script macros for changes made with Cdk.
- use $ LIB_ROOTNAME, e.g., set by --with-libname, in generating
  *-config and ".pc" files
- further improvements to matching output from *-config and ".pc"
  improve gen-pkgconfig.in to mark the screen library, e.g., ncurses,
  as "Required" and filter the cflags/libs from required packages out
  of the ".pc" file, because pkg-config will add those automatically.
- fix some gcc15 strict compiler warnings
- configure script fixes for compiler warnings
- update config.guess, config.sub

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../dialog/{dialog_1.3-20240619.bb => dialog_1.3-20250116.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/dialog/{dialog_1.3-20240619.bb => dialog_1.3-20250116.bb} (92%)

diff --git a/meta-oe/recipes-extended/dialog/dialog_1.3-20240619.bb b/meta-oe/recipes-extended/dialog/dialog_1.3-20250116.bb
similarity index 92%
rename from meta-oe/recipes-extended/dialog/dialog_1.3-20240619.bb
rename to meta-oe/recipes-extended/dialog/dialog_1.3-20250116.bb
index 0fccce5e86..bc6621de1d 100644
--- a/meta-oe/recipes-extended/dialog/dialog_1.3-20240619.bb
+++ b/meta-oe/recipes-extended/dialog/dialog_1.3-20250116.bb
@@ -9,7 +9,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
 SRC_URI = "https://invisible-mirror.net/archives/${BPN}/${BP}.tgz"
-SRC_URI[sha256sum] = "5d8c4318963db3fd383525340276e0e05ee3dea9a6686c20779f5433b199547d"
+SRC_URI[sha256sum] = "68406329827b783d0a8959cc20a94c6e1791ac861a27f854e06e9020541816dd"
 
 # hardcoded here for use in dialog-static recipe
 S = "${WORKDIR}/dialog-${PV}"
-- 
2.43.0



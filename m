Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A15E2CFC509
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 08:56:03 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.50484.1728896158777209774
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 01:55:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WMIIrWHC;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728896158; x=1760432158;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Cc24Pg6IhO79VODHToi4Dptdtwn+9a32o2IeftYdo6M=;
  b=WMIIrWHCWDG2XT2yJ94PyERzyUHMqUTKshagXBaxpivN6S3iSZ2dkZeY
   GtsaQtR+l8PgWXItzNFIU3n7SBNfSl4TFSf/vlddpDqWtMR+KKpyNZ3jK
   6uUvYNTBzxBIohMSA7K3NnDOYd0nWx+IoEnDLOrYJfQkZcp+bp8tgmdEW
   LS4NYsYJyNg41k2/376KFoPWHMSOb6cA+HIZxoclLNPa/jZ+BSh0UBaxB
   Iv0u1COzv+2xtVfZ4Pgu5RgAmJLjaQZs//l0WDlJCBUkQIEQkcRBG45eI
   rHYWvOCi7IrNfaPff4+Vyj3HpDeFmoaqoliwGVft5Bqijd4p5j0xJRYBz
   Q==;
X-CSE-ConnectionGUID: uESUnJbtT7SIXzOPrNFt+A==
X-CSE-MsgGUID: 45gsnD2iRA6MZv1oMNiJzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="155575557"
X-IronPort-AV: E=Sophos;i="6.11,202,1725289200"; 
   d="scan'208";a="155575557"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 17:55:56 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id D4B65D6473
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:55:54 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 18F30D4BD2
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:55:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id A948E6B4E5
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:55:53 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 537E81A000A;
	Mon, 14 Oct 2024 16:55:53 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 05/54] gtkwave: upgrade 3.3.120 -> 3.3.121
Date: Mon, 14 Oct 2024 16:54:26 +0800
Message-Id: <1728896115-2944-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
References: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28730.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28730.006
X-TMASE-Result: 10-6.686400-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mr2I8NUKi360ZcvdqWtCoykh/8
	AjnXlbL5Jqoc7O2QzGMNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl7SwC3zqzycUeVs
	0skyEaS2BkESMI05d4rhX/lUQGcewuEVa2AYyQQmeAiCmPx4NwGmRqNBHmBveeFIQTy0Zb4bfaY
	87m2dqx3nN0DN7HnFmzXqD8i35PIBorkstPwssvHFPm/NRW3bkENYXd+r5I6sx0BWNByqYMYiej
	c70Nm2yw64pbGUB0fSx/FGYD3XaPSjP8s20qB/k
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 08:56:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112853

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- FST loader for windows and warnings fixes.
- Clang warning fixes in fstapi.c on dynamic arrays.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gtkwave/{gtkwave_3.3.120.bb => gtkwave_3.3.121.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/gtkwave/{gtkwave_3.3.120.bb => gtkwave_3.3.121.bb} (94%)

diff --git a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.120.bb b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.121.bb
similarity index 94%
rename from meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.120.bb
rename to meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.121.bb
index b7807c885..c0777c331 100644
--- a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.120.bb
+++ b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.121.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=75859989545e37968a99b631ef42722e"
 
 SRC_URI = "http://gtkwave.sourceforge.net/gtkwave-gtk3-${PV}.tar.gz"
-SRC_URI[sha256sum] = "5da94863fb2e5d88cc019e2bfdc676022398113894b585d864e11ca8341b24d8"
+SRC_URI[sha256sum] = "54aa45788d6d52afb659c3aef335aafde0ef2c8990a7770f8eaa64e57f227346"
 S = "${WORKDIR}/${BPN}-gtk3-${PV}"
 
 DEPENDS = " \
-- 
2.34.1



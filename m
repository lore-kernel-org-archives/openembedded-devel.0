Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83D3FE69EA6
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 00:16:59 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.8201.1733185013588391052
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Dec 2024 16:16:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=neAI2Zbr;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1733185013; x=1764721013;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=h4uIIrIL3AnqJyfgwqHnUU9bosKARDl1Q7Jr1/EtoXQ=;
  b=neAI2ZbrKEvMqOdGadM16xo9IFLmXOTXySsN8mdZPRAvW16FOwQcV4Sf
   ii91zVvdSq+g/TMpD6RZLNzSvALnTGrWj+qT3d/bNBPZgTtz6P0C5NZVs
   Jop2wAlW/WKdTouDSEL121eAxdx+yPuRYeemiFKrbeLGqIOSxgDj4Cxtn
   RMUih67m+DTlOIPdCJjg7UBM8pWO4usliDc6UOf69BqT8Lcu1eNnKscK4
   t1tI1+kFVbdi3kOs4k2CDQTMbUsPoXSwlOSs5SuexhtCyW14p3un2BvvC
   eeilvdgIhPFYSA14LuxtOjTO2K/iSpIwnTzxmEVkWvqxZ3dPbSsucbkXx
   g==;
X-CSE-ConnectionGUID: jyDCIhPbTCSZDEY+RB9nuw==
X-CSE-MsgGUID: benKjTMtQmefZg69KLyATA==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="182588480"
X-IronPort-AV: E=Sophos;i="6.12,203,1728918000"; 
   d="scan'208";a="182588480"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 09:16:51 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 39765C2264
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:49 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0A36FD8B6E
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:49 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 90D556CB26
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:48 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 31C891A0003;
	Tue,  3 Dec 2024 08:16:48 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-filesystems] [PATCH 06/34] exfatprogs: upgrade 1.2.5 -> 1.2.6
Date: Tue,  3 Dec 2024 08:16:11 +0800
Message-Id: <1733184999-27041-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
References: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28834.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28834.003
X-TMASE-Result: 10--7.165200-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/yd9JA2lmQRNUF4r8H5YrEqyH4I6QZJ07ke6R
	R4lImIVinK0E4bVZnFa0DGUgRcYjUuo7bV31UxoOKiJEqUFWRgjYUDvAr2Y/11P24yVRBdIcvqn
	FtM6Nq/L7tBxFpWhrycYoh/qEF/tVoYY7KoErjW8ReM8i8p3vgPNYQxCOihTNYA3qL69rXq7Sn0
	NplHOg3cntDIKQv0aIAFFvfoi/CJWmWOD8X0TFhHV7tdtvoibafS0Ip2eEHnz3IzXlXlpamPoLR
	4+zsDTt9Ss5ONHRGPU7U3vpq2AY2Vi3DiS7KGZHaX8YPkzSieuT/xRINz9+zw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Dec 2024 00:16:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114147

From: Wang Mingyu <wangmy@fujitsu.com>

CHANGES :
 * exfatprogs: replace obsolete autoconf and libtool
   macros.
 * mkfs.exfat: prefer the physical block size over
   the logical block size for the exFAT sector size.
 * mkfs.exfat: add notes about the format of the volume
   GUID to the man page.
 * mkfs.exfat: fix an incorrect calculation of the number
   of used clusters.

BUG FIXES :
 * exfatlabel: fix an user input error when setting
   a volume serial or label.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../exfatprogs/{exfatprogs_1.2.5.bb => exfatprogs_1.2.6.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-utils/exfatprogs/{exfatprogs_1.2.5.bb => exfatprogs_1.2.6.bb} (91%)

diff --git a/meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.2.5.bb b/meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.2.6.bb
similarity index 91%
rename from meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.2.5.bb
rename to meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.2.6.bb
index c3ae8b8381..39411b4cee 100644
--- a/meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.2.5.bb
+++ b/meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.2.6.bb
@@ -12,7 +12,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "f27160dcc1ddd17c96cd41a6ceef7037adc2796ab5c5633d3d85cf532c3ee2f0"
+SRC_URI[sha256sum] = "89d05b7a9537f2413079b724ec8d02d7a2e291c29c52e7256303e9456200fb0f"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "${BPN}-(?P<pver>\d+(\.\d+)+)"
-- 
2.34.1



Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A668C04FF8
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 01:41:28 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.2749.1713318083119429968
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 18:41:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dFSbEAB0;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713318083; x=1744854083;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=vVrMKy7KUtPgoBZxleqSBZSxUZjyzmqCKfupZ/oXoXg=;
  b=dFSbEAB0b8G0jFwzE5FzIW4QN1c24BFF0ZAsx5Ynctqqh7W1tc7cUnD1
   QF4v1iquWPDw7YDN7nIy9Lq6lksGVsw9wI4r8huC8i0GQXWPjuqN0sz+R
   QF1THX3ny3UvABZ7JkJHRKCKUn/qGE8tgyUl1b0QXVeC6LA7fs5tzP5CW
   WPyA9wRS86BW58kLBM6B+2DA142zly0hLbkxoIuR1dlZee2TBiLMt+c45
   jF0P/mUPP2Z38iqUvMI9BlkCsBOX2XlOqUB9M22j3S+NC4rqrSXu9HEQO
   UwND1Tgy0d/PyGxEEM1AJio4RogH42o2RSapjOw8VH5fdf5hYIese8ND4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="156073643"
X-IronPort-AV: E=Sophos;i="6.07,207,1708354800"; 
   d="scan'208";a="156073643"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 10:41:20 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 733BFD4806
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:18 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id A3D736E03B
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:17 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 28EB96B5E9
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:17 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CAA1D1A0002;
	Wed, 17 Apr 2024 09:41:16 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 05/49] file-roller: upgrade 44.0 -> 44.1
Date: Wed, 17 Apr 2024 09:40:17 +0800
Message-Id: <1713318061-17128-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
References: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28326.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28326.004
X-TMASE-Result: 10--4.574500-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrKQNhMboqZlpzdNwWZQOzPIrq
	nYTxkVFKSUQWNWP9oCyF4fbT8lKbywjt4l5TmF6fzYK5U+QI3O56AgcdfYvhjJTx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q1ZNYSHk3Zr0cF6LYOqbPfhoHmOTZNdeMWem2
	vw+cenKeLzNWBegCW24nmFeyfGnuMLbigRnpKlKZx+7GyJjhAUocEXj3YejTJud6Ze4czNvlMfb
	z80gE4bqFF8n/JrtRuCefO4LIi9c2eAenB6Gu0B/bLptLETOk1l4Yl3dPJPjPanPDsECLHa7H2f
	VekOqwmYL1KImKhq1ZuOe7yPCBvAf2OJxbAVgHQ+kK598Yf3Mg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 01:41:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109991

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* New archive dialog: allow to choose a location without changing name
* Fixed adding multiple files on a 'drop' event
* Show the options dialog when adding files in batch mode
* Appdata: Add 44.0 release

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../file-roller/{file-roller_44.0.bb => file-roller_44.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/file-roller/{file-roller_44.0.bb => file-roller_44.1.bb} (95%)

diff --git a/meta-gnome/recipes-gnome/file-roller/file-roller_44.0.bb b/meta-gnome/recipes-gnome/file-roller/file-roller_44.1.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/file-roller/file-roller_44.0.bb
rename to meta-gnome/recipes-gnome/file-roller/file-roller_44.1.bb
index 3daa1b570..30760387f 100644
--- a/meta-gnome/recipes-gnome/file-roller/file-roller_44.0.bb
+++ b/meta-gnome/recipes-gnome/file-roller/file-roller_44.1.bb
@@ -22,7 +22,7 @@ REQUIRED_DISTRO_FEATURES = "opengl"
 EXTRA_OEMESON += "-Dintrospection=enabled"
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/file-roller.git;protocol=https;branch=master"
-SRCREV = "f1c7714cf4c8989b9f3fa4c611887c29cf6df343"
+SRCREV = "299e86c77d8fe600ee6658357e209b15c674397e"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= ""
-- 
2.34.1



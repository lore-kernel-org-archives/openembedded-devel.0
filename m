Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9356BC52D73
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 09:03:06 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.33826.1721034177807152453
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jul 2024 02:02:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Oh+P/7Lc;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1721034178; x=1752570178;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=VFhnJm2p98TFEOcvXGkF/QBZXpjMpkGHpE5PJPdOfJo=;
  b=Oh+P/7LcJ28HIb9GWcuWZObylV5wlE7r8AbWVCdvw56u7hX5V6k3pVNM
   RzE9h3IZMdxPF1zOQoVlKyTGn1712FgfJivDKcBbqMFI4hp99CU0wOEYn
   +j4HmKsKicIphM0bC24CtSMcrFCASAuG8pp/zp6Da2lvLCuRPl7209rgC
   PavZJt6rT+7KwIPjIuSDnkW54N2bXFbrfE0S1v6zP5YX7FKPo3Ov2pVFr
   yAyFCNXuydE3zaxy0RRntWqsuj/zkkwaABoOhF12jW1nn6HGtxzX6iUM1
   FvthJdmrByofyRfPsyC8PYUjsLd02XTosc3UXFw/dk3qgIf07uEm7fm9G
   Q==;
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="168833502"
X-IronPort-AV: E=Sophos;i="6.09,209,1716217200"; 
   d="scan'208";a="168833502"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 18:02:56 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2D131D8012
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:53 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6F912D4C1E
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:52 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0006A20071A38
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:51 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9E2711A000A;
	Mon, 15 Jul 2024 17:02:51 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 04/38] gnome-keyring: upgrade 46.1 -> 46.2
Date: Mon, 15 Jul 2024 17:01:57 +0800
Message-Id: <1721034151-540-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
References: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28530.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28530.006
X-TMASE-Result: 10-0.436100-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrmZiw53dqSN+EmxOjZ1LZ2Xw6
	H06bMgiv82jJesNrruFVF51vxLbfWe1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQ9v/
	ESKTjvdBMg8WZSy71MFFxcTP+15E+vUxpsK1XD0s6N/cDgNNi4X0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqtR8s1YuQHS1tP4/hAObDiufJpK+XNrTGNc6xG0yGWXopGMenoPXXrIMGRZ
	k7qe0EajVTaGuQR/7eSxbfkvznQ0Ril94mGdEMYHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 09:03:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111325

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
* Don't use 'bool' as variable name
* autogoo: replace AC_HELP_STRING with AS_HELP_STRING
* Default "automatically unlock" checkbox to false
* build: Fix distcheck with systemd unit
* rpc-layer: Fix undefined reference to g_strlcpy
* Updated translations

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gnome-keyring_46.1.bb => gnome-keyring_46.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-keyring/{gnome-keyring_46.1.bb => gnome-keyring_46.2.bb} (94%)

diff --git a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_46.1.bb b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_46.2.bb
similarity index 94%
rename from meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_46.1.bb
rename to meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_46.2.bb
index 8df3710e6..e17319908 100644
--- a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_46.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_46.2.bb
@@ -22,7 +22,7 @@ inherit gnomebase gsettings features_check gettext
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-SRC_URI[archive.sha256sum] = "b1d3ae9132ff2f8b3f25a190790892968e3d0acf952a487e40f644a8550ce3f6"
+SRC_URI[archive.sha256sum] = "bf26c966b8a8b7f3285ecc8bb3e467b9c20f9535b94dc451c9c559ddcff61925"
 SRC_URI += " \
     file://0001-Set-paths-to-ssh-agent-and-ssh-add-by-configure-opti.patch \
     file://musl.patch \
-- 
2.34.1



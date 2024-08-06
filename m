Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C520C54732
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 08:47:08 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.2882.1722934016964852790
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 01:46:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SfmJRNKQ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722934018; x=1754470018;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=O6jKmASOdlXVUSzUgA0FzBceyNKZ4azPqF+uaMm83t8=;
  b=SfmJRNKQnPjRpAQToc/1xD1YU4AyoLYTeLs112QpzA6KR+ShQkG0P+z3
   sQALTueDzB2pUuKd/DcPKJP0DzUL8VwfghWrlsZeQs60H78YWaAnh60C9
   gaIv7go0PmS5oKTMOeND8oLD4FftDfdqsl64LJhAAOFVc+MnNHxmCbSNX
   mb78++YchslBP0HV+IVdDAkazrvboHWw5KQxMdqrftp+8TKL++yWyE+UU
   RsvubPaOXEcV8JXOe0pY6EPVEES1Aju7FY9KnEAIFJDiZp2I9LzYpGfsB
   xwpHLCT6PSxVrPEjNv3AasHUqE3bZaSoZsQfd77mhImEtYw3nvNljL1xp
   g==;
X-CSE-ConnectionGUID: F5tfyQJ0RcqkiVLN7MnTCg==
X-CSE-MsgGUID: e936fMnsS7exPyHlnnCDcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="149361398"
X-IronPort-AV: E=Sophos;i="6.09,267,1716217200"; 
   d="scan'208";a="149361398"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 17:46:55 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id B906BD424F
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:52 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 09E96BF3E6
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:52 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id A0990401B2
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:51 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4B8951A000C;
	Tue,  6 Aug 2024 16:46:51 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 09/60] gnome-bluetooth: upgrade 46.0 -> 46.1
Date: Tue,  6 Aug 2024 16:45:43 +0800
Message-Id: <1722933994-32549-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
References: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28578.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28578.006
X-TMASE-Result: 10-0.459500-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmI/dksnGuGmFQkbnmLrKdcc0NA+DE6YXwTdKRNjzo2IOEBl2WTrgZIjo8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXJyLExTjCutOPjJoNWXblpY7n5xbMx+psfe4S
	1zuiN3jf0veHAaCxg1xdSsJ18Bmi/xLG56pa8jiy2TXkTi3QmJRypyKkszvNb+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 08:47:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111530

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gnome-bluetooth_46.0.bb => gnome-bluetooth_46.1.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-bluetooth/{gnome-bluetooth_46.0.bb => gnome-bluetooth_46.1.bb} (91%)

diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_46.0.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_46.1.bb
similarity index 91%
rename from meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_46.0.bb
rename to meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_46.1.bb
index 1b29e52c7..980ff3678 100644
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_46.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_46.1.bb
@@ -25,7 +25,7 @@ inherit features_check gnomebase gtk-icon-cache gtk-doc gobject-introspection
 
 REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
-SRC_URI[archive.sha256sum] = "13fe1e75f317acdbdf5e80c9029d2e0632d60a9ccf72a43ae36eb7545021fbef"
+SRC_URI[archive.sha256sum] = "56c44a17034598e9607458afae1be75f3de5efdf0e62355f09ba58fc7bc312ac"
 
 BT_PULSE_PACKS = " \
     pulseaudio-lib-bluez5-util \
-- 
2.34.1



Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A3D9EDE9A3
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 09:03:32 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.18332.1725959004898524334
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Sep 2024 02:03:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dKqD4gtA;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1725959005; x=1757495005;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=J69VCBfZ07w9I7MIIrEG0p/dmKnRvzy4v8qHN7W8TVU=;
  b=dKqD4gtAop8UCtL+TdAI73OVZqFCaXTYhqJbnLwOS+uw/aIrjDyTjf3C
   L7YYF4ysWssgs9trf7IR2A74cHROTug8Tf5DgDnQA8LqQwjEEaNBr/3jl
   RBIdtpF+ZEsrtuQh8hQ4TSHI4pWvNcIFWX+K79BrHCjU/JJ8ma1Q+UP1i
   QdeU5Inpf8LoNi3azDCA5ZP2j3fRKho9KlheIZHUiNpT7S6KrAn4gc+vT
   7xDGOJuuwfGM3Sk/YnwrA5ZCJsoQSkhH0btITHahg9qyp6ovMWuZLtMkK
   d2lkTwecL6YXHc/X8OjpKCyf/gnd0CqNKXj4LmN70xJvz1QTkeIj4MKPP
   w==;
X-CSE-ConnectionGUID: BHsDDXv2S8uDTgr8Ml5v3Q==
X-CSE-MsgGUID: YnjxU6S9TWOTM8QVTpeRCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="173254616"
X-IronPort-AV: E=Sophos;i="6.10,216,1719846000"; 
   d="scan'208";a="173254616"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 18:03:23 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 770BAC68E6
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:20 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id B89FAD50E4
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:19 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 51993200894B0
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:19 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 025F01A000B;
	Tue, 10 Sep 2024 17:03:18 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 05/42] gnome-autoar: upgrade 0.4.4 -> 0.4.5
Date: Tue, 10 Sep 2024 17:02:33 +0800
Message-Id: <1725958990-5719-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
References: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28654.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28654.006
X-TMASE-Result: 10-1.324000-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrnv1LjgVCGOLk6Qbi+9i6D5Px
	/USAEAKi1jypNY0wtabndYB3YWhBWB2P280ZiGmRP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW5tMXimGWsZZPtO3MfgW4DDDrWW+YTCqzGvToW2jJ66NsF6LYOqbPfhmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibJ0RPnyOnrZJxS+pme2B+nXHnnZrTsB+Ur+WmJRGJ/C58yL5e46e0e1FdO
	frfbQ0ldTkqKZijC2NTCe7vNTknIuGGbDSY0v7WUnHC1BrTSCtLv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 09:03:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112193

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* mime-types: Add tar variant of bzip2
* extractor: Fix source string leak

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gnome-autoar_0.4.4.bb => gnome-autoar_0.4.5.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-autoar/{gnome-autoar_0.4.4.bb => gnome-autoar_0.4.5.bb} (81%)

diff --git a/meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.4.4.bb b/meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.4.5.bb
similarity index 81%
rename from meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.4.4.bb
rename to meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.4.5.bb
index 8d602eee4..d7325888d 100644
--- a/meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.4.4.bb
+++ b/meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.4.5.bb
@@ -13,7 +13,7 @@ GTKDOC_MESON_OPTION = "gtk_doc"
 
 inherit gnomebase gobject-introspection gtk-doc vala
 
-SRC_URI[archive.sha256sum] = "c0afbe333bcf3cb1441a1f574cc8ec7b1b8197779145d4edeee2896fdacfc3c2"
+SRC_URI[archive.sha256sum] = "838c5306fc38bfaa2f23abe24262f4bf15771e3303fb5dcb74f5b9c7a615dabe"
 
 do_compile:prepend() {
     export GIR_EXTRA_LIBS_PATH="${B}/gnome-autoar/.libs"
-- 
2.34.1



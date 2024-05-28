Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38F60C25B74
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 01:51:09 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.12891.1716861059984494203
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 May 2024 18:51:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=U7mI2alc;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716861060; x=1748397060;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=WsmNYnGg1LoSC0s8PnDlp36Qt1/FNbW9usMoyhNZfBw=;
  b=U7mI2alcQPTQn+BuXprgchlhUL9mbeJ1vwkH0vnTxlkIcLxXA9t7wx2b
   sh2P3GIBIiAyZylNxbORJyzpNnRnj032rw6wmvjouJHrJyd8XabwnsIqe
   FIgAUJ+A6K8k9Fnyu7XSwOxOlLLjYKXianUAKR3Yfiu60Pc1w91d+1kk0
   11hGeLb5O3S2tYUDkxyrs39gvUFjzJhu13kq84Og5l6vA1npMYiY4mRgt
   plJz9FavvjezaL4k5O786/7bq3eUj1yc/MY3nmumeGUoHJ7fsoKvfNFdq
   Z3Ipcmp6MQJ9rviH9P/TJOhRQLJ2q3YwEGHW9gy0x70o8puE3y44HGIMd
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="160605247"
X-IronPort-AV: E=Sophos;i="6.08,194,1712588400"; 
   d="scan'208";a="160605247"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 10:50:57 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 584B7C68E6
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:50:55 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9813CCF7F7
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:50:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 327842007FADB
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:50:54 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D45D61A000A;
	Tue, 28 May 2024 09:50:53 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 38/40] webkitgtk3: upgrade 2.44.1 -> 2.44.2
Date: Tue, 28 May 2024 09:48:19 +0800
Message-Id: <1716860901-863-38-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
References: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28414.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28414.004
X-TMASE-Result: 10-6.364500-10.000000
X-TMASE-MatchedRID: 6IstDyeExSCjz0nOeth/yUIIxwDaU5mrTh6+hMTeY7l+iSxt9FvgrYY+
	d4I4WCpEoAYe40TtUyBJeguEQWhG1veCv1PcqE/eTPsVRSNcbWMnhzAhgvoq53Ea7quPFSpQkh/
	Y9I1eJwkWm/gAtjCd7AtBs9pjRrPR+bUSFRCX8dOfrLSY2RbRpFQQ0EgzIoPRB/FMznsE8cPu/Q
	yUVIt+aU0NCZDxtvO/5p98cjyQCaKzVFZ6osYjDisIuzCLc2mNIF9l7eKb2JFXGTbsQqHbkknsT
	6E3eIgW8YMGIR6ZqjXvBF8yXwES9eVHGbcDbAq6FEUknJ/kEl7dB/CxWTRRu4as+d5/8j56aM7H
	xMtBlKdvWDScJSsz5/WxLmjfsXjCZ3uXpsOv5UWFrR4swUd072FMu1EHsmKsSm1ZSps6ssXu4vQ
	tP68NmgAP6oFsNHjn
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 01:51:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110573

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Make gamepads visible on axis movements, and not only on button presses.
- Disable the gst-libav AAC decoder.
- Make user scripts and style sheets visible in the Web Inspector.
- Use the geolocation portal where available, with the existing geoclue
  as fallback if the portal is not usable.
- Use the printing portal when running sandboxed.
- Use the file transfer portal for drag and drop when running sandboxed.
- Avoid notifying an empty cursor rectangle to input methods.
- Remove empty bar shown in detached inspector windows.
- Consider keycode when activating application accelerators.
- Fix the build with ENABLE_WEBAUDIO disabled.
- Fix several crashes and rendering issues.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../webkitgtk/{webkitgtk3_2.44.1.bb => webkitgtk3_2.44.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/webkitgtk/{webkitgtk3_2.44.1.bb => webkitgtk3_2.44.2.bb} (99%)

diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.1.bb b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.2.bb
similarity index 99%
rename from meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.1.bb
rename to meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.2.bb
index fc96d5dc3..31480b8d8 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.1.bb
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.2.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz \
            file://0001-LowLevelInterpreter.cpp-339-21-error-t6-was-not-decl.patch \
            file://30e1d5e22213fdaca2a29ec3400c927d710a37a8.patch \
            "
-SRC_URI[sha256sum] = "425b1459b0f04d0600c78d1abb5e7edfa3c060a420f8b231e9a6a2d5d29c5561"
+SRC_URI[sha256sum] = "523f42c8ff24832add17631f6eaafe8f9303afe316ef1a7e1844b952a7f7521b"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 
-- 
2.34.1



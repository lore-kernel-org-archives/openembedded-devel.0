Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D7D1CFC50F
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 08:56:24 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.50499.1728896178293143703
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 01:56:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RrspWjzl;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728896178; x=1760432178;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=GUhd40JtmnPRxhnY1TT4jpHzCYWynpRrTTXajTegoF4=;
  b=RrspWjzlR5TQdMSC8KmCMUfFeftih1gFk9KSr44TQuyya157n9lencWy
   1GGUE7iMdoB5jrG/L+SxALsjK5lW9wGDB/QvV7ejYFdVeN+wRzz0HCdqy
   cYdpYkC4F+JzCOr/+ZWV6YVGDBt9o9ESW9FB+GQzfR8V5sopRm5/unowu
   3GBPUgCABkRN/uXXlqxjVt1TfYRxP9VMOJDSiQoBbsEB4xjy90w04Vrwo
   00oHXlG3dfyNLJVpE2k66S6IG5bMarigL7uHLrMZnVZRvPzAGfxYh0SDu
   Ywwquw3mUAk9hEF7VNZvi16gyETCG5Im3kjFnJX7OEUIppeyBgq7+8trh
   A==;
X-CSE-ConnectionGUID: /EAzgtmaTGyhNLdDNP+rug==
X-CSE-MsgGUID: Xst/Gif6SPKykJCgGUM8aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="176874708"
X-IronPort-AV: E=Sophos;i="6.11,202,1725289200"; 
   d="scan'208";a="176874708"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 17:56:15 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8FA6DC68E2
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:13 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id D2AEFD5006
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:12 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5BEE920071A2B
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:12 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 272381A01ED;
	Mon, 14 Oct 2024 16:56:12 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 49/54] remmina: upgrade 1.4.35 -> 1.4.36
Date: Mon, 14 Oct 2024 16:55:10 +0800
Message-Id: <1728896115-2944-49-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
References: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28730.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28730.006
X-TMASE-Result: 10--12.951300-10.000000
X-TMASE-MatchedRID: vQr1bp/0ccWjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvhA4WtAM986UOY
	7DHe6/HHNhwu9kPLr+ifcOT/2EBpntFMBnmJRh/JoS0guoV6SZcxXH/dlhvLv5M31359BsaWvhK
	HQLTKimwvedJgS+/yapXBiw7NP4CJPYXq8jNCcaMdZEkR8Y/meYGzTdEevOMz8NPJFuJ/+VarBs
	keRv5B8KIs7beQWo8vq7yuN8LGY8l3ngPq8ksjbZ2DhvquP+ryYIOxzvM9rTbl90JVB3jyCpbXm
	oug+1t+E3gCBEPTWD3XO/rGYdkZJA+oIVzzhjImxDiakrJ+SpkKW68eInZ/hcj0QMA/92m2u8/l
	vGittlSh9bMmqe83MUDhv5XHnrFk79SLQXyG7tAD2WXLXdz+AdXLiEcLf+DIsrDwfHQQaK1yp+g
	wY/4LBCL637QCIVpixwb6oUXQPLI3KXWd30Ii3RRFJJyf5BJe3QfwsVk0UbtuRXh7bFKB7nW8zq
	v0aLb3VWSzWHu4P/yGnhUHLamZ8/yaCQ4yylI4WClYJu9r4yY=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 08:56:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112901

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Fix crash with keyboard-interactive SSH auth
* Prevent empty remmina_file_name in remmina.pref
* rdp/rdp-plugin: Fix faulty color depth check
* Fix typos
* Usbredirect on connect
* Add global RDP options to set FreeRDP auth filter
* Use universal /bin/sh shebang in remmina-rile-wrapper(1)
* Added back in line that was accidentally removed before merge
* Do not initialize rdp_auth_filter
* Add proxy field for SPICE connections
* add a conditional check for darwin and NetBSD
* Make more obvious to user that Remmina may not be able to exec certain
  commands when run in a sandbox (snap or flatpak)
* Handle GotFrameBufferUpdate on its own thread to prevent freeze
* Enable horitical scroll on RDP plugin.
* Add timeout option to handle VNC disconnects
* Fix bug where option to send clipboard as keystrokes did not appear
* Add ability to send a key combination when RDP connection is idle
* Do not prompt user for credentials if they have already been entered
* Add null check to prevent segfault
* Move the idle timer into rf_context to make it session-specific.
* Limit connection name on rcw tab to reasonable length
* Update several dependencies
* Add user prompt for gateway messages
* Add reconnect button to rcw
* Changed to put call to a message accept panel in the RemminaPluginService struct
* Removed unused, commented code
* Allow floating toolbar to be drag and dropped to more locations on the screen
* Fixed some compile warnings causing issues with GCC 14.2.1
* Update ssh error to not show outdated message

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../remmina/{remmina_1.4.35.bb => remmina_1.4.36.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/remmina/{remmina_1.4.35.bb => remmina_1.4.36.bb} (96%)

diff --git a/meta-oe/recipes-support/remmina/remmina_1.4.35.bb b/meta-oe/recipes-support/remmina/remmina_1.4.36.bb
similarity index 96%
rename from meta-oe/recipes-support/remmina/remmina_1.4.35.bb
rename to meta-oe/recipes-support/remmina/remmina_1.4.36.bb
index 0cad52df3..62e7d5811 100644
--- a/meta-oe/recipes-support/remmina/remmina_1.4.35.bb
+++ b/meta-oe/recipes-support/remmina/remmina_1.4.36.bb
@@ -25,7 +25,7 @@ DEPENDS = " \
 DEPENDS:append:libc-musl = " libexecinfo"
 LDFLAGS:append:libc-musl = " -lexecinfo"
 
-SRCREV = "2a455eadd6462457d08c2d066c5c245e0dee3bf9"
+SRCREV = "17cf7956b9f925fa788083a2db8d5e669f86bfaf"
 SRC_URI = "git://gitlab.com/Remmina/Remmina;protocol=https;branch=master"
 S = "${WORKDIR}/git"
 
-- 
2.34.1



Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42DCCC77B73
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 08:41:38 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.17420.1684744895925989571
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 May 2023 01:41:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Lc2hyWQH;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: thomas.perrot@bootlin.com)
Received: (Authenticated sender: thomas.perrot@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 31A9F20015;
	Mon, 22 May 2023 08:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1684744893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0KiFB504ZTjDh0gPm9OtZnTdfY8uCyT+fAf8HCCobJI=;
	b=Lc2hyWQHw5vq04pWeedc93XqMd3x9GqdQY85vxrZNvW8zsHdPLP4NxXV0D0Bcq6Mj1sZyi
	nn9ZkubIsR0Qlo1qJW2KhDJ3XTDDvsiiWY2r1OXaPTa/xyE3S4PYqwzN1Lv3s2FkIsWcDd
	hvZ5RIacftHekjlVnJLOZhAdgd8MzrHKKLCkFjrzp7bqPlKa9ineooCvWVaeVYQhOJSpJW
	feNZqpNMEgUcqY8eWaMmcdPb65mBuxVudws7M7EhML4O0gW45p231J4IQQWPl5vzYDVExI
	GVS06AruanJSrBbz8ZUc8qTBp28zQIyVDafNVPViCW7rspR4XiNHmggmfYy3Vw==
From: thomas.perrot@bootlin.com
To: openembedded-devel@lists.openembedded.org
Cc: Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [meta-networking][PATCH] networkmanager: Turn ppp support into a packageconfig option
Date: Mon, 22 May 2023 10:40:38 +0200
Message-Id: <20230522084038.315926-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 May 2023 08:41:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102698

From: Thomas Perrot <thomas.perrot@bootlin.com>

Enable it only if ppp is in distro features

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 .../networkmanager/networkmanager_1.42.6.bb                     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.42.6.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.42.6.bb
index 31687a30b91a..b52a47540f6d 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.42.6.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.42.6.bb
@@ -73,7 +73,7 @@ do_compile:prepend() {
 PACKAGECONFIG ??= "readline nss ifupdown dnsmasq nmcli vala \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', bb.utils.contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d), d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez5', '', d)} \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'wifi polkit', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'wifi polkit ppp', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux audit', '', d)} \
 "
 
-- 
2.40.1



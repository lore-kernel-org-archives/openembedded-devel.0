Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id CDBE37C1DD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jan 2019 16:26:34 +0000 (UTC)
Received: from linuxdev2.toradex.int (unknown [46.140.72.82])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 56D335C217E;
	Thu, 17 Jan 2019 17:26:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1547742395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:content-type:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=upQhekNKX4sbyai7+DZZsLoc2ZrR+e+/CReNx7BGjnE=;
	b=BQlVObcc74yvq9FHJXROZn8Rad0tX9V5DA01wxbuN5LLEiwnsMSeEnmce9i3M1+KHevuDR
	XMOzKrmtfk++l/KKgwzsI18ZNGeZdgLKTkgn7wQ8uH2XjgShZUmxRGOAANIFKH9NzmFekH
	vesUeE5hXr7czcyWujbt+KDTZ6ce3ys=
From: Stefan Agner <stefan@agner.ch>
To: raj.khem@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Thu, 17 Jan 2019 17:26:26 +0100
Message-Id: <20190117162629.47677-2-stefan@agner.ch>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20190117162629.47677-1-stefan@agner.ch>
References: <20190117162629.47677-1-stefan@agner.ch>
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [PATCH 2/5] networkmanager: introduce polkit package config
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Jan 2019 16:26:35 -0000

From: Stefan Agner <stefan.agner@toradex.com>

Currently polkit is enabled if systemd is in package config. Those
two things are orthogonal: NetworkManager can be used with systemd
and without polkit just fine.

Introduce a new polkit package config and enable it depending on
whether polkit is in DISTRO_FEATURES.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 .../recipes-connectivity/networkmanager/networkmanager_1.14.4.bb   | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.14.4.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.14.4.bb
index 870a52814..f1826c68e 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.14.4.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.14.4.bb
@@ -16,7 +16,6 @@ DEPENDS = " \
     util-linux \
     libndp \
     libnewt \
-    polkit \
     jansson \
     curl \
 "
@@ -69,13 +68,13 @@ do_compile_prepend() {
 PACKAGECONFIG ??= "nss ifupdown dhclient dnsmasq \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', bb.utils.contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d), d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ}', '', d)} \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'wifi', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'wifi polkit', d)} \
 "
 PACKAGECONFIG[systemd] = " \
-    --with-systemdsystemunitdir=${systemd_unitdir}/system --with-session-tracking=systemd --enable-polkit, \
+    --with-systemdsystemunitdir=${systemd_unitdir}/system --with-session-tracking=systemd, \
     --without-systemdsystemunitdir, \
-    polkit \
 "
+PACKAGECONFIG[polkit] = "--enable-polkit --enable-polkit-agent,--disable-polkit --disable-polkit-agent,polkit"
 PACKAGECONFIG[bluez5] = "--enable-bluez5-dun,--disable-bluez5-dun,bluez5"
 # consolekit is not picked by shlibs, so add it to RDEPENDS too
 PACKAGECONFIG[consolekit] = "--with-session-tracking=consolekit,,consolekit,consolekit"
-- 
2.13.6



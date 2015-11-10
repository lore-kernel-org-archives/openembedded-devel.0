Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 245DB77103
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 21:50:06 +0000 (UTC)
Received: by wmww144 with SMTP id w144so136527392wmw.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 13:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=R0jT0pQatX5gJ3E1A273toJBeXwvCK7dl3sP5m0gQq4=;
	b=wOIDLUDiKR0qjWVA+t51+UyLYsYqmIfzcXxh9OodB0jfzgv3x81GphYB/OO3Rrc7RZ
	NzySGZG+twm6rsz9Hj28o51FAB4bo21kacKsBceHjOX9FlABIxQe/UCBkreHzPeBNk8g
	rik2KoL+3xBppX6Br18yq4Irpr5HjEV6R4rIsum3PiazxafL5x5i7ZoU985FmSBe3WVF
	4M9IkyJgyYWn+ws9eR1k5C3dqmc7BmXCds7RLywCMp85Q/yJu6lnMpgnfQMphdNEWtxG
	ruBMdiud4VEfgW8GykZeJH3rh/Czviylw7zsg6CDDUMwLbPmruegZrouMiovaLfmfiHm
	Ep+A==
X-Received: by 10.28.211.143 with SMTP id k137mr7496818wmg.49.1447192206912;
	Tue, 10 Nov 2015 13:50:06 -0800 (PST)
Received: from chl500346.lan.ffah.ch (c-82-192-248-24.customer.ggaweb.ch.
	[82.192.248.24]) by smtp.gmail.com with ESMTPSA id
	ej10sm4763171wjd.32.2015.11.10.13.50.06
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Nov 2015 13:50:06 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Nov 2015 22:49:15 +0100
Message-Id: <1447192164-9399-9-git-send-email-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <1447192164-9399-1-git-send-email-adrian.freihofer@gmail.com>
References: <1447192164-9399-1-git-send-email-adrian.freihofer@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 08/17] networkmanager: add fedora bugfix patches
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Nov 2015 21:50:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
---
 ...ix-parse-commandline-options-into-correct.patch |  35 +++++
 ...-vpn-connection-fix-unsetting-the-gateway.patch |  30 ++++
 ...tion-set-the-MTU-for-the-VPN-IP-interface.patch |  54 +++++++
 ...t-reset-NM_UNMANAGED_DEFAULT-when-platfor.patch |  33 +++++
 .../0007-nmcli-crash-vlan-priorities.patch         |  35 +++++
 .../0008-nmtui-fix-crash-in-secret-agent.patch     |  88 +++++++++++
 .../rh1175446-vpn-secondaries-connections.patch    |  57 ++++++++
 .../rh1261428-ipv6-ignore-auto-dns.patch           |  37 +++++
 .../rh1263185-nmcli-con-add-generic.patch          |  44 ++++++
 .../rh1263959-modem-supported-ip-families.patch    |  62 ++++++++
 .../rh1264676-fix-crash-on-device-removal.patch    |  80 ++++++++++
 .../rh1265993-nmcli-allow-ipv6-ppp-for-wwan.patch  |  46 ++++++
 ...rh1266003-fix-crash-on-bss-proxy-acquired.patch |  48 ++++++
 .../rh1272974-fix-s390-ctc-detection.patch         |  57 ++++++++
 .../rh1277693-vpn-service-timer.patch              | 161 +++++++++++++++++++++
 .../networkmanager/networkmanager_1.0.6.bb         |  15 ++
 16 files changed, 882 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/0003-config-bugfix-parse-commandline-options-into-correct.patch
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/0004-vpn-connection-fix-unsetting-the-gateway.patch
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/0005-vpn-connection-set-the-MTU-for-the-VPN-IP-interface.patch
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/0006-device-don-t-reset-NM_UNMANAGED_DEFAULT-when-platfor.patch
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/0007-nmcli-crash-vlan-priorities.patch
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/0008-nmtui-fix-crash-in-secret-agent.patch
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/rh1175446-vpn-secondaries-connections.patch
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/rh1261428-ipv6-ignore-auto-dns.patch
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/rh1263185-nmcli-con-add-generic.patch
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/rh1263959-modem-supported-ip-families.patch
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/rh1264676-fix-crash-on-device-removal.patch
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/rh1265993-nmcli-allow-ipv6-ppp-for-wwan.patch
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/rh1266003-fix-crash-on-bss-proxy-acquired.patch
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/rh1272974-fix-s390-ctc-detection.patch
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/rh1277693-vpn-service-timer.patch

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager/0003-config-bugfix-parse-commandline-options-into-correct.patch b/meta-oe/recipes-connectivity/networkmanager/networkmanager/0003-config-bugfix-parse-commandline-options-into-correct.patch
new file mode 100644
index 0000000..0457c8d
--- /dev/null
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager/0003-config-bugfix-parse-commandline-options-into-correct.patch
@@ -0,0 +1,35 @@
+From 8a22a98157f7f6773f3d1f295419569c6c880a47 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
+Date: Thu, 27 Aug 2015 22:18:55 +0200
+Subject: [PATCH] config: bugfix: parse commandline options into correct object
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Config related commandline options should be parsed into a function argument but
+were instead parsed into an object with local scope. As a result none of them
+had any impact.
+
+Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
+
+Fixes: b4ad7434a87c165a77b615accbe1868a9df9221b
+
+https://mail.gnome.org/archives/networkmanager-list/2015-August/msg00033.html
+---
+ src/main.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/src/main.c b/src/main.c
+index 495262e..a9bc479 100644
+--- a/src/main.c
++++ b/src/main.c
+@@ -246,7 +246,6 @@ do_early_setup (int *argc, char **argv[], NMConfigCmdLineOptions *config_cli)
+ 		{NULL}
+ 	};
+ 
+-	config_cli = nm_config_cmd_line_options_new ();
+ 	if (!nm_main_utils_early_setup ("NetworkManager",
+ 	                                argc,
+ 	                                argv,
+-- 
+2.4.3
diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager/0004-vpn-connection-fix-unsetting-the-gateway.patch b/meta-oe/recipes-connectivity/networkmanager/networkmanager/0004-vpn-connection-fix-unsetting-the-gateway.patch
new file mode 100644
index 0000000..abd0739
--- /dev/null
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager/0004-vpn-connection-fix-unsetting-the-gateway.patch
@@ -0,0 +1,30 @@
+From 15e4ee69dfeec8dd3670da262c11306de7488156 Mon Sep 17 00:00:00 2001
+From: Lubomir Rintel <lkundrak@v3.sk>
+Date: Wed, 2 Sep 2015 19:19:18 +0200
+Subject: [PATCH 3/4] vpn-connection: fix unsetting the gateway
+
+Addresses the clash between the two commits which would cause the parent device
+gateway to be overwritten with 0.0.0.0 upon route-based VPN activation:
+
+Fixes: 063677101ab7d43a9aa94c70eb1ca3a201269043
+Fixes: 1465c1d3260712fbe2fd0c78c7a1fcf0fb8ce753
+(cherry picked from commit da2ae8ce4e6cb03931454d7d6fa94866b03f6be2)
+---
+ src/vpn-manager/nm-vpn-connection.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/vpn-manager/nm-vpn-connection.c b/src/vpn-manager/nm-vpn-connection.c
+index c34155e..f0e6149 100644
+--- a/src/vpn-manager/nm-vpn-connection.c
++++ b/src/vpn-manager/nm-vpn-connection.c
+@@ -933,7 +933,7 @@ apply_parent_device_config (NMVpnConnection *connection)
+ 		 * default route. */
+ 		if (vpn4_parent_config) {
+ 			nm_ip4_config_merge (vpn4_parent_config, priv->ip4_config, NM_IP_CONFIG_MERGE_DEFAULT);
+-			nm_ip4_config_set_gateway (vpn4_parent_config, 0);
++			nm_ip4_config_unset_gateway (vpn4_parent_config);
+ 		}
+ 		if (vpn6_parent_config) {
+ 			nm_ip6_config_merge (vpn6_parent_config, priv->ip6_config, NM_IP_CONFIG_MERGE_DEFAULT);
+-- 
+2.4.3
diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager/0005-vpn-connection-set-the-MTU-for-the-VPN-IP-interface.patch b/meta-oe/recipes-connectivity/networkmanager/networkmanager/0005-vpn-connection-set-the-MTU-for-the-VPN-IP-interface.patch
new file mode 100644
index 0000000..c4ad977
--- /dev/null
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager/0005-vpn-connection-set-the-MTU-for-the-VPN-IP-interface.patch
@@ -0,0 +1,54 @@
+From e5508e6d74a9ab9c0559dd854ec6c7b015e7a603 Mon Sep 17 00:00:00 2001
+From: Lubomir Rintel <lkundrak@v3.sk>
+Date: Mon, 28 Sep 2015 20:57:09 +0200
+Subject: [PATCH] vpn-connection: set the MTU for the VPN IP interface
+
+The 9b79e6c73 commit moved setting of the MTU from IP4Config to NMDevice, but
+VPN connections don't have a NMDevice instance (yet). Set the MTU also from the
+VPN connection. Also, copying of the MTU to the IP4Config is no longer needed
+as the ip4_config_commit no longer sets the MTU.
+
+Fixes: 9b79e6c732ffb2fb105647c1465070d36a6cc180
+
+https://bugzilla.gnome.org/show_bug.cgi?id=754781
+---
+ src/vpn-manager/nm-vpn-connection.c | 10 +++-------
+ 1 file changed, 3 insertions(+), 7 deletions(-)
+
+diff --git a/src/vpn-manager/nm-vpn-connection.c b/src/vpn-manager/nm-vpn-connection.c
+index f0e6149..e2d3103 100644
+--- a/src/vpn-manager/nm-vpn-connection.c
++++ b/src/vpn-manager/nm-vpn-connection.c
+@@ -980,6 +980,9 @@ nm_vpn_connection_apply_config (NMVpnConnection *connection)
+ 			                           TRUE))
+ 				return FALSE;
+ 		}
++
++		if (priv->mtu && priv->mtu != nm_platform_link_get_mtu (NM_PLATFORM_GET, priv->ip_ifindex))
++			nm_platform_link_set_mtu (NM_PLATFORM_GET, priv->ip_ifindex, priv->mtu);
+ 	}
+ 
+ 	apply_parent_device_config (connection);
+@@ -1149,10 +1152,6 @@ process_generic_config (NMVpnConnection *connection,
+ 		}
+ 	}
+ 
+-	/* MTU; this is a per-connection value, though NM's API treats it
+-	 * like it's IP4-specific. So we store it for now and retrieve it
+-	 * later in ip4_config_get.
+-	 */
+ 	priv->mtu = 0;
+ 	val = (GValue *) g_hash_table_lookup (config_hash, NM_VPN_PLUGIN_CONFIG_MTU);
+ 	if (val) {
+@@ -1328,9 +1327,6 @@ nm_vpn_connection_ip4_config_get (DBusGProxy *proxy,
+ 	if (val)
+ 		nm_ip4_config_set_mss (config, g_value_get_uint (val));
+ 
+-	if (priv->mtu)
+-		nm_ip4_config_set_mtu (config, priv->mtu, NM_IP_CONFIG_SOURCE_VPN);
+-
+ 	val = (GValue *) g_hash_table_lookup (config_hash, NM_VPN_PLUGIN_IP4_CONFIG_DOMAIN);
+ 	if (val)
+ 		nm_ip4_config_add_domain (config, g_value_get_string (val));
+-- 
+2.5.0
diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager/0006-device-don-t-reset-NM_UNMANAGED_DEFAULT-when-platfor.patch b/meta-oe/recipes-connectivity/networkmanager/networkmanager/0006-device-don-t-reset-NM_UNMANAGED_DEFAULT-when-platfor.patch
new file mode 100644
index 0000000..74c08bd
--- /dev/null
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager/0006-device-don-t-reset-NM_UNMANAGED_DEFAULT-when-platfor.patch
@@ -0,0 +1,33 @@
+From e10a8f1f375c9ff669a14674e14f9789b2f321b6 Mon Sep 17 00:00:00 2001
+From: Lubomir Rintel <lkundrak@v3.sk>
+Date: Wed, 2 Sep 2015 19:39:00 +0200
+Subject: [PATCH 4/4] device: don't reset NM_UNMANAGED_DEFAULT when platform
+ doesn't override this
+
+This would cause the ip_vti0 generic device (that appears upon insertion of
+ip_vti module during libreswan ipsec stack init) to go managed and brought UP.
+Without addresses assigned the device would cause all the VPN traffic to
+disappear in the oblivion.
+
+(cherry picked from commit 1c46ddf196b1e87782049e8f9ee3ada93e0dc85b)
+---
+ src/devices/nm-device.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/devices/nm-device.c b/src/devices/nm-device.c
+index 5889582..b4e9252 100644
+--- a/src/devices/nm-device.c
++++ b/src/devices/nm-device.c
+@@ -1158,8 +1158,8 @@ nm_device_finish_init (NMDevice *self)
+ 			 * Currently it can happen that NM deletes 127.0.0.1 address. */
+ 			nm_device_set_initial_unmanaged_flag (self, NM_UNMANAGED_DEFAULT, TRUE);
+ 		} else if (priv->platform_link_initialized || (priv->is_nm_owned && nm_device_is_software (self))) {
+-			nm_platform_link_get_unmanaged (NM_PLATFORM_GET, priv->ifindex, &platform_unmanaged);
+-			nm_device_set_initial_unmanaged_flag (self, NM_UNMANAGED_DEFAULT, platform_unmanaged);
++			if (nm_platform_link_get_unmanaged (NM_PLATFORM_GET, priv->ifindex, &platform_unmanaged))
++				nm_device_set_initial_unmanaged_flag (self, NM_UNMANAGED_DEFAULT, platform_unmanaged);
+ 		} else {
+ 			/* Hardware and externally-created software links stay unmanaged
+ 			 * until they are fully initialized by the platform. NM created
+-- 
+2.4.3
diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager/0007-nmcli-crash-vlan-priorities.patch b/meta-oe/recipes-connectivity/networkmanager/networkmanager/0007-nmcli-crash-vlan-priorities.patch
new file mode 100644
index 0000000..cfaa04d
--- /dev/null
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager/0007-nmcli-crash-vlan-priorities.patch
@@ -0,0 +1,35 @@
+From 7cfd6fc64185bebb09274107d64e65df748b149e Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Ji=C5=99=C3=AD=20Klime=C5=A1?= <jklimes@redhat.com>
+Date: Tue, 1 Sep 2015 16:06:54 +0200
+Subject: [PATCH] libnm-core: fix a crash in priority_strv_to_maplist()
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+strv can be NULL.
+
+Reproducer:
+$ nmcli con mod my-vlan vlan.ingress 1:5
+
+(cherry picked from commit 71c8c2e5872d2c6b15e24d37d3c000c11d0eba07)
+Signed-off-by: Jiří Klimeš <jklimes@redhat.com>
+---
+ libnm-core/nm-setting-vlan.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libnm-core/nm-setting-vlan.c b/libnm-core/nm-setting-vlan.c
+index 859eb13..cbc85b3 100644
+--- a/libnm-core/nm-setting-vlan.c
++++ b/libnm-core/nm-setting-vlan.c
+@@ -565,7 +565,7 @@ priority_strv_to_maplist (NMVlanPriorityMap map, char **strv)
+ 	GSList *list = NULL;
+ 	int i;
+ 
+-	for (i = 0; strv[i]; i++) {
++	for (i = 0; strv && strv[i]; i++) {
+ 		PriorityMap *item;
+ 
+ 		item = priority_map_new_from_str (map, strv[i]);
+-- 
+2.1.0
+
diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager/0008-nmtui-fix-crash-in-secret-agent.patch b/meta-oe/recipes-connectivity/networkmanager/networkmanager/0008-nmtui-fix-crash-in-secret-agent.patch
new file mode 100644
index 0000000..411a6a3
--- /dev/null
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager/0008-nmtui-fix-crash-in-secret-agent.patch
@@ -0,0 +1,88 @@
+From 269a4483be917fcc7ba66bcf061f75e76df0c6c7 Mon Sep 17 00:00:00 2001
+From: Thomas Haller <thaller@redhat.com>
+Date: Wed, 30 Sep 2015 17:25:49 +0200
+Subject: [PATCH] tui: fix crash during activation when failed to create
+ secret-agent
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+NetworkManager only allows one 'client:user-id' to register as secret
+agent. Thus, when starting nmtui in two terminals, creating the secret
+agent can fail.
+
+This can lead to a crash.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=755883
+(cherry picked from commit b861900d45da588f4239be418c3e1f62505cbde1)
+Signed-off-by: Jiří Klimeš <jklimes@redhat.com>
+---
+ clients/tui/nmtui-connect.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/clients/tui/nmtui-connect.c b/clients/tui/nmtui-connect.c
+index 438915d..5eabbc8 100644
+--- a/clients/tui/nmtui-connect.c
++++ b/clients/tui/nmtui-connect.c
+@@ -132,7 +132,7 @@ activate_connection (NMConnection *connection,
+                      NMObject     *specific_object)
+ {
+ 	NmtNewtForm *form;
+-	NMSecretAgentOld *agent;
++	gs_unref_object NMSecretAgentOld *agent = NULL;
+ 	NmtNewtWidget *label;
+ 	NmtSyncOp op;
+ 	const char *specific_object_path;
+@@ -188,7 +188,7 @@ activate_connection (NMConnection *connection,
+ 		goto done;
+ 	}
+ 
+-	if (!connection) {
++	if (agent && !connection) {
+ 		connection = NM_CONNECTION (nm_active_connection_get_connection (ac));
+ 		if (connection) {
+ 			nm_secret_agent_simple_enable (NM_SECRET_AGENT_SIMPLE (agent),
+@@ -220,8 +220,8 @@ activate_connection (NMConnection *connection,
+ 		nmt_newt_form_quit (form);
+ 	g_object_unref (form);
+ 
+-	nm_secret_agent_old_unregister (agent, NULL, NULL);
+-	g_object_unref (agent);
++	if (agent)
++		nm_secret_agent_old_unregister (agent, NULL, NULL);
+ }
+ 
+ static void
+-- 
+2.1.0
+
+From e88161172e2d675783027a839b50488cc75fbf6f Mon Sep 17 00:00:00 2001
+From: Lubomir Rintel <lkundrak@v3.sk>
+Date: Wed, 30 Sep 2015 19:37:10 +0200
+Subject: [PATCH] tui: add a missing include to fix build
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes: 269a4483be917fcc7ba66bcf061f75e76df0c6c7
+Signed-off-by: Jiří Klimeš <jklimes@redhat.com>
+---
+ clients/tui/nmtui-connect.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/clients/tui/nmtui-connect.c b/clients/tui/nmtui-connect.c
+index 5eabbc8..cacb0b4 100644
+--- a/clients/tui/nmtui-connect.c
++++ b/clients/tui/nmtui-connect.c
+@@ -30,6 +30,8 @@
+ 
+ #include <glib/gi18n-lib.h>
+ 
++#include "gsystem-local-alloc.h"
++
+ #include "nmt-newt.h"
+ 
+ #include "nmtui.h"
+-- 
+2.1.0
+
diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager/rh1175446-vpn-secondaries-connections.patch b/meta-oe/recipes-connectivity/networkmanager/networkmanager/rh1175446-vpn-secondaries-connections.patch
new file mode 100644
index 0000000..1c2112e
--- /dev/null
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager/rh1175446-vpn-secondaries-connections.patch
@@ -0,0 +1,57 @@
+From 112f3f8aca99d96bf94d724769e563cc44e5a4c9 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Ji=C5=99=C3=AD=20Klime=C5=A1?= <jklimes@redhat.com>
+Date: Wed, 4 Nov 2015 15:48:28 +0100
+Subject: [PATCH] policy: fix looping through list while removing elements (rh
+ #1175446)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+When g_slist_remove() was called, iter2 became invalid and accessing it
+could cause a crash. The same was true for iter.
+Fix the problem by getting the next list item before an element removal.
+
+See a similar fix in bluez
+http://git.kernel.org/cgit/bluetooth/bluez.git/commit/?id=be8c5be809875ba449a10ca29f5244f0231f6b63
+
+https://bugzilla.redhat.com/show_bug.cgi?id=1175446
+https://bugzilla.redhat.com/show_bug.cgi?id=1277247
+
+(cherry picked from commit b9da3d93207e46de895fd07cfe9de1edfa79efef)
+Signed-off-by: Jiří Klimeš <jklimes@redhat.com>
+---
+ src/nm-policy.c | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/src/nm-policy.c b/src/nm-policy.c
+index 8a573c8..1be5c4a 100644
+--- a/src/nm-policy.c
++++ b/src/nm-policy.c
+@@ -754,17 +754,21 @@ process_secondaries (NMPolicy *policy,
+                      gboolean connected)
+ {
+ 	NMPolicyPrivate *priv = NM_POLICY_GET_PRIVATE (policy);
+-	GSList *iter, *iter2;
++	GSList *iter, *iter2, *next, *next2;
+ 
+ 	/* Loop through devices waiting for secondary connections to activate */
+-	for (iter = priv->pending_secondaries; iter; iter = g_slist_next (iter)) {
++	for (iter = priv->pending_secondaries; iter; iter = next) {
+ 		PendingSecondaryData *secondary_data = (PendingSecondaryData *) iter->data;
+ 		NMDevice *item_device = secondary_data->device;
+ 
++		next = g_slist_next (iter);
++
+ 		/* Look for 'active' in each device's secondary connections list */
+-		for (iter2 = secondary_data->secondaries; iter2; iter2 = g_slist_next (iter2)) {
++		for (iter2 = secondary_data->secondaries; iter2; iter2 = next2) {
+ 			NMActiveConnection *secondary_active = NM_ACTIVE_CONNECTION (iter2->data);
+ 
++			next2 = g_slist_next (iter2);
++
+ 			if (active != secondary_active)
+ 				continue;
+ 
+-- 
+2.1.0
+
diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager/rh1261428-ipv6-ignore-auto-dns.patch b/meta-oe/recipes-connectivity/networkmanager/networkmanager/rh1261428-ipv6-ignore-auto-dns.patch
new file mode 100644
index 0000000..6f0f774
--- /dev/null
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager/rh1261428-ipv6-ignore-auto-dns.patch
@@ -0,0 +1,37 @@
+From 8de6ee4ebad93cd1f552c666183a4fac76274aa5 Mon Sep 17 00:00:00 2001
+From: Thomas Haller <thaller@redhat.com>
+Date: Wed, 9 Sep 2015 12:59:01 +0200
+Subject: [PATCH] core: fix handling ignore-auto-dns for IPv6 nameservers
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+https://bugzilla.redhat.com/show_bug.cgi?id=1261428
+
+Fixes: f7a8962dd47099425438ee484e02f40e18b6ee79
+(cherry picked from commit e0fe47b74e92e9614717a3d918eed3fc0bc6b2ea)
+Signed-off-by: Jiří Klimeš <jklimes@redhat.com>
+---
+ src/nm-ip6-config.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/nm-ip6-config.c b/src/nm-ip6-config.c
+index 9647268..ef25623 100644
+--- a/src/nm-ip6-config.c
++++ b/src/nm-ip6-config.c
+@@ -635,8 +635,10 @@ nm_ip6_config_merge (NMIP6Config *dst, const NMIP6Config *src, NMIPConfigMergeFl
+ 		nm_ip6_config_add_address (dst, nm_ip6_config_get_address (src, i));
+ 
+ 	/* nameservers */
+-	for (i = 0; i < nm_ip6_config_get_num_nameservers (src); i++)
+-		nm_ip6_config_add_nameserver (dst, nm_ip6_config_get_nameserver (src, i));
++	if (!NM_FLAGS_HAS (merge_flags, NM_IP_CONFIG_MERGE_NO_DNS)) {
++		for (i = 0; i < nm_ip6_config_get_num_nameservers (src); i++)
++			nm_ip6_config_add_nameserver (dst, nm_ip6_config_get_nameserver (src, i));
++	}
+ 
+ 	/* default gateway */
+ 	if (nm_ip6_config_get_gateway (src))
+-- 
+2.1.0
+
diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager/rh1263185-nmcli-con-add-generic.patch b/meta-oe/recipes-connectivity/networkmanager/networkmanager/rh1263185-nmcli-con-add-generic.patch
new file mode 100644
index 0000000..d954e2a
--- /dev/null
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager/rh1263185-nmcli-con-add-generic.patch
@@ -0,0 +1,44 @@
+From b46ed879198e911521373391c27982034699dfe5 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Ji=C5=99=C3=AD=20Klime=C5=A1?= <jklimes@redhat.com>
+Date: Tue, 10 Feb 2015 15:33:35 +0100
+Subject: [PATCH] nmcli: allow adding 'generic' connections via nmcli
+ connection add
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+'nmcli connection edit' already allows adding and editing generic connections
+(added by 2a2af5825a6db62e7a88bb249cf7876551ed7fa3).
+
+(cherry picked from commit 0ff9b75387b7ac2fd0235b23699990834426c467)
+Signed-off-by: Jiří Klimeš <jklimes@redhat.com>
+---
+ clients/cli/connections.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/clients/cli/connections.c b/clients/cli/connections.c
+index 8d138bd..3c95c03 100644
+--- a/clients/cli/connections.c
++++ b/clients/cli/connections.c
+@@ -4006,6 +4006,7 @@ complete_connection_by_type (NMConnection *connection,
+                              GError **error)
+ {
+ 	NMSettingConnection *s_con;
++	NMSettingGeneric *s_generic;
+ 	NMSettingWired *s_wired;
+ 	NMSettingInfiniband *s_infiniband;
+ 	NMSettingWireless *s_wifi;
+@@ -5232,6 +5233,10 @@ cleanup_olpc:
+ 		if (!success)
+ 			return FALSE;
+ 
++	} else if (!strcmp (con_type, NM_SETTING_GENERIC_SETTING_NAME)) {
++		/* Add 'generic' setting */
++		s_generic = (NMSettingGeneric *) nm_setting_generic_new ();
++		nm_connection_add_setting (connection, NM_SETTING (s_generic));
+ 	} else {
+ 		g_set_error (error, NMCLI_ERROR, NMC_RESULT_ERROR_USER_INPUT,
+ 		             _("Error: '%s' is not a valid connection type."),
+-- 
+2.1.0
+
diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager/rh1263959-modem-supported-ip-families.patch b/meta-oe/recipes-connectivity/networkmanager/networkmanager/rh1263959-modem-supported-ip-families.patch
new file mode 100644
index 0000000..45a42f2
--- /dev/null
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager/rh1263959-modem-supported-ip-families.patch
@@ -0,0 +1,62 @@
+From a0ffb5ad19dbc1a8aa95f72f79c604527bd8c83e Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Ji=C5=99=C3=AD=20Klime=C5=A1?= <jklimes@redhat.com>
+Date: Tue, 22 Sep 2015 18:42:40 +0200
+Subject: [PATCH] modem-broadband: update modem's supported-ip-families (rh
+ #1263959)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+If SIM in a modem is locked, ModemManager can't initialize SupportedIpFamilies
+and NetworkManager will set the property to 0. ModemManager then updates the
+property after the modem is unlocked, but NetworkManager did not watch changes
+to the property. And that resulted in a connection failure:
+(ttyUSB1): Failed to connect 'O2 Internet': Connection requested IPv4 but IPv4 is unsuported by the modem.
+(ttyUSB1): device state change: prepare -> failed (reason 'modem-init-failed') [40 120 28]
+
+https://bugzilla.redhat.com/show_bug.cgi?id=1263959
+
+(cherry picked from commit eecb4c46cc35c43c12e84e530b3be50374baa792)
+Signed-off-by: Jiří Klimeš <jklimes@redhat.com>
+---
+ src/devices/wwan/nm-modem-broadband.c | 17 +++++++++++++++++
+ 1 file changed, 17 insertions(+)
+
+diff --git a/src/devices/wwan/nm-modem-broadband.c b/src/devices/wwan/nm-modem-broadband.c
+index 4bb72fd..ec4f4a2 100644
+--- a/src/devices/wwan/nm-modem-broadband.c
++++ b/src/devices/wwan/nm-modem-broadband.c
+@@ -1146,6 +1146,19 @@ sim_changed (MMModem *modem, GParamSpec *pspec, gpointer user_data)
+ }
+ 
+ static void
++supported_ip_families_changed (MMModem *modem, GParamSpec *pspec, gpointer user_data)
++{
++	NMModemBroadband *self = NM_MODEM_BROADBAND (user_data);
++
++	g_return_if_fail (modem == self->priv->modem_iface);
++
++	g_object_set (G_OBJECT (self),
++	              NM_MODEM_IP_TYPES,
++	              mm_ip_family_to_nm (mm_modem_get_supported_ip_families (modem)),
++	              NULL);
++}
++
++static void
+ nm_modem_broadband_init (NMModemBroadband *self)
+ {
+ 	self->priv = G_TYPE_INSTANCE_GET_PRIVATE (self,
+@@ -1176,6 +1189,10 @@ set_property (GObject *object,
+ 		                  G_CALLBACK (sim_changed),
+ 		                  self);
+ 		sim_changed (self->priv->modem_iface, NULL, self);
++		g_signal_connect (self->priv->modem_iface,
++		                  "notify::supported-ip-families",
++		                  G_CALLBACK (supported_ip_families_changed),
++		                  self);
+ 
+ 		/* Note: don't grab the Simple iface here; the Modem interface is the
+ 		 * only one assumed to be always valid and available */
+-- 
+2.1.0
+
diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager/rh1264676-fix-crash-on-device-removal.patch b/meta-oe/recipes-connectivity/networkmanager/networkmanager/rh1264676-fix-crash-on-device-removal.patch
new file mode 100644
index 0000000..bcd9a52
--- /dev/null
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager/rh1264676-fix-crash-on-device-removal.patch
@@ -0,0 +1,80 @@
+From 117fd7ef515a60cf36acce970b21915f51f1074d Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Ji=C5=99=C3=AD=20Klime=C5=A1?= <jklimes@redhat.com>
+Date: Mon, 21 Sep 2015 14:30:02 +0200
+Subject: [PATCH 1/2] manager: disconnect signal handlers on 'settings' in
+ dispose() (rh #1264676)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Otherwise a crash can occur when shutting down.
+
+https://bugzilla.redhat.com/show_bug.cgi?id=1264676
+
+(cherry picked from commit dd8c3ef3a005613b5a28dd084bdae54dffa203fd)
+Signed-off-by: Jiří Klimeš <jklimes@redhat.com>
+---
+ src/nm-manager.c | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/src/nm-manager.c b/src/nm-manager.c
+index d91a0d7..7589053 100644
+--- a/src/nm-manager.c
++++ b/src/nm-manager.c
+@@ -5115,7 +5115,16 @@ dispose (GObject *object)
+ 		g_clear_object (&priv->policy);
+ 	}
+ 
+-	g_clear_object (&priv->settings);
++	if (priv->settings) {
++		g_signal_handlers_disconnect_by_func (priv->settings, settings_startup_complete_changed, manager);
++		g_signal_handlers_disconnect_by_func (priv->settings, system_unmanaged_devices_changed_cb, manager);
++		g_signal_handlers_disconnect_by_func (priv->settings, system_hostname_changed_cb, manager);
++		g_signal_handlers_disconnect_by_func (priv->settings, connection_added, manager);
++		g_signal_handlers_disconnect_by_func (priv->settings, connection_changed, manager);
++		g_signal_handlers_disconnect_by_func (priv->settings, connection_removed, manager);
++		g_clear_object (&priv->settings);
++	}
++
+ 	g_free (priv->state_file);
+ 	g_clear_object (&priv->vpn_manager);
+ 
+-- 
+2.1.0
+
+
+From b010870d8477c24e2846df4eeda81acdd00000e4 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Ji=C5=99=C3=AD=20Klime=C5=A1?= <jklimes@redhat.com>
+Date: Mon, 21 Sep 2015 14:38:25 +0200
+Subject: [PATCH 2/2] manager: cleanup NMRfkillManager in dispose()
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes: b15fb8641e26eb63c2d83d9dcc9510705086e2f2
+
+(cherry picked from commit 85d7dc1a0fe15996f4194d28378e9738b53c99c4)
+Signed-off-by: Jiří Klimeš <jklimes@redhat.com>
+---
+ src/nm-manager.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/nm-manager.c b/src/nm-manager.c
+index 7589053..40e8321 100644
+--- a/src/nm-manager.c
++++ b/src/nm-manager.c
+@@ -5152,6 +5152,11 @@ dispose (GObject *object)
+ 		g_clear_object (&priv->fw_monitor);
+ 	}
+ 
++	if (priv->rfkill_mgr) {
++		g_signal_handlers_disconnect_by_func (priv->rfkill_mgr, rfkill_manager_rfkill_changed_cb, manager);
++		g_clear_object (&priv->rfkill_mgr);
++	}
++
+ 	nm_device_factory_manager_for_each_factory (_deinit_device_factory, manager);
+ 	
+ 	if (priv->timestamp_update_id) {
+-- 
+2.1.0
+
diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager/rh1265993-nmcli-allow-ipv6-ppp-for-wwan.patch b/meta-oe/recipes-connectivity/networkmanager/networkmanager/rh1265993-nmcli-allow-ipv6-ppp-for-wwan.patch
new file mode 100644
index 0000000..159657b
--- /dev/null
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager/rh1265993-nmcli-allow-ipv6-ppp-for-wwan.patch
@@ -0,0 +1,46 @@
+From 1b253ee722b524c4ea4f34bf227672386fa83ade Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Ji=C5=99=C3=AD=20Klime=C5=A1?= <jklimes@redhat.com>
+Date: Fri, 25 Sep 2015 15:42:00 +0200
+Subject: [PATCH] cli: allow 'ipv6' and 'ppp' settings for GSM and CDMA
+ connections (rh #1265993)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Otherwise the settings cannot be changed.
+
+https://bugzilla.redhat.com/show_bug.cgi?id=1265993
+
+(cherry picked from commit ecf084935590a86558e1cafe66f3faebbf2c5925)
+Signed-off-by: Jiří Klimeš <jklimes@redhat.com>
+---
+ clients/cli/connections.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/clients/cli/connections.c b/clients/cli/connections.c
+index b6614ae..85b1c7d 100644
+--- a/clients/cli/connections.c
++++ b/clients/cli/connections.c
+@@ -2475,7 +2475,9 @@ static const NameItem nmc_gsm_settings [] = {
+ 	{ NM_SETTING_CONNECTION_SETTING_NAME, NULL,       NULL, TRUE  },
+ 	{ NM_SETTING_GSM_SETTING_NAME,        NULL,       NULL, TRUE  },
+ 	{ NM_SETTING_SERIAL_SETTING_NAME,     NULL,       NULL, FALSE },
++	{ NM_SETTING_PPP_SETTING_NAME,        NULL,       NULL, FALSE },
+ 	{ NM_SETTING_IP4_CONFIG_SETTING_NAME, NULL,       NULL, FALSE },
++	{ NM_SETTING_IP6_CONFIG_SETTING_NAME, NULL,       NULL, FALSE },
+ 	{ NULL, NULL, NULL, FALSE }
+ };
+ 
+@@ -2483,7 +2485,9 @@ static const NameItem nmc_cdma_settings [] = {
+ 	{ NM_SETTING_CONNECTION_SETTING_NAME, NULL,       NULL, TRUE  },
+ 	{ NM_SETTING_CDMA_SETTING_NAME,       NULL,       NULL, TRUE  },
+ 	{ NM_SETTING_SERIAL_SETTING_NAME,     NULL,       NULL, FALSE },
++	{ NM_SETTING_PPP_SETTING_NAME,        NULL,       NULL, FALSE },
+ 	{ NM_SETTING_IP4_CONFIG_SETTING_NAME, NULL,       NULL, FALSE },
++	{ NM_SETTING_IP6_CONFIG_SETTING_NAME, NULL,       NULL, FALSE },
+ 	{ NULL, NULL, NULL, FALSE }
+ };
+ 
+-- 
+2.1.0
+
diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager/rh1266003-fix-crash-on-bss-proxy-acquired.patch b/meta-oe/recipes-connectivity/networkmanager/networkmanager/rh1266003-fix-crash-on-bss-proxy-acquired.patch
new file mode 100644
index 0000000..9f02406
--- /dev/null
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager/rh1266003-fix-crash-on-bss-proxy-acquired.patch
@@ -0,0 +1,48 @@
+From 9736327b2616861dfec181e88f908a18b22d781c Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Ji=C5=99=C3=AD=20Klime=C5=A1?= <jklimes@redhat.com>
+Date: Thu, 7 May 2015 11:27:26 +0200
+Subject: [PATCH] wifi: fix a crash in on_bss_proxy_acquired() (rh #1266003)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+g_dbus_proxy_get_cached_property_names() function can return NULL.
+
+ Program received signal SIGSEGV, Segmentation fault.
+ on_bss_proxy_acquired (proxy=0x7fffe4003880 [GDBusProxy], result=0x895490, user_data=<optimized out>) at supplicant-manager/nm-supplicant-interface.c:159
+ 159		while (*iter) {
+ (gdb) bt
+ #0  0x000000000048fac7 in on_bss_proxy_acquired (proxy=0x7fffe4003880 [GDBusProxy], result=0x895490, user_data=<optimized out>)
+     at supplicant-manager/nm-supplicant-interface.c:159
+ #1  0x0000003bf84728b7 in g_simple_async_result_complete (simple=0x895490 [GSimpleAsyncResult]) at gsimpleasyncresult.c:763
+ #2  0x0000003bf8472919 in complete_in_idle_cb (data=<optimized out>) at gsimpleasyncresult.c:775
+ #3  0x0000003bf5c497fb in g_main_context_dispatch (context=0x7d6420) at gmain.c:3111
+ #4  0x0000003bf5c497fb in g_main_context_dispatch (context=context@entry=0x7d6420) at gmain.c:3710
+ #5  0x0000003bf5c49b98 in g_main_context_iterate (context=0x7d6420, block=block@entry=1, dispatch=dispatch@entry=1, self=<optimized out>) at gmain.c:3781
+ #6  0x0000003bf5c49ec2 in g_main_loop_run (loop=0x7d64e0) at gmain.c:3975
+ #7  0x00000000004349d6 in main (argc=1, argv=0x7fffffffe598) at main.c:486
+
+https://bugzilla.redhat.com/show_bug.cgi?id=1266003
+
+(cherry picked from commit 33527341b1e35034a4f1736df4bc98f8ac8418ab)
+Signed-off-by: Jiří Klimeš <jklimes@redhat.com>
+---
+ src/supplicant-manager/nm-supplicant-interface.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/supplicant-manager/nm-supplicant-interface.c b/src/supplicant-manager/nm-supplicant-interface.c
+index 66bab2e..08b850a 100644
+--- a/src/supplicant-manager/nm-supplicant-interface.c
++++ b/src/supplicant-manager/nm-supplicant-interface.c
+@@ -154,7 +154,7 @@ on_bss_proxy_acquired (GDBusProxy *proxy, GAsyncResult *result, gpointer user_da
+ 	g_variant_builder_init (&builder, G_VARIANT_TYPE ("a{sv}"));
+ 
+ 	iter = properties = g_dbus_proxy_get_cached_property_names (proxy);
+-	while (*iter) {
++	while (iter && *iter) {
+ 		GVariant *copy = g_dbus_proxy_get_cached_property (proxy, *iter);
+ 
+ 		g_variant_builder_add (&builder, "{sv}", *iter++, copy);
+-- 
+2.1.0
+
diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager/rh1272974-fix-s390-ctc-detection.patch b/meta-oe/recipes-connectivity/networkmanager/networkmanager/rh1272974-fix-s390-ctc-detection.patch
new file mode 100644
index 0000000..59e2c44
--- /dev/null
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager/rh1272974-fix-s390-ctc-detection.patch
@@ -0,0 +1,57 @@
+From 2a8c93e940c3fdc5bb710f9fd1ec037e51524ed9 Mon Sep 17 00:00:00 2001
+From: Thomas Haller <thaller@redhat.com>
+Date: Fri, 16 Oct 2015 11:52:30 +0200
+Subject: [PATCH] platform: fix link-detection for s390 CTC-type devices
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Commit 02c6a9334335d3ef32c6cc8fafc6cea235c80ffc (rh#1212118)
+introduced detection of CTC devices based on the driver name.
+
+That was broken a while ago while refactoring.
+
+Related: https://bugzilla.redhat.com/show_bug.cgi?id=1212118
+https://bugzilla.redhat.com/show_bug.cgi?id=1272974
+
+Fixes: ddaea22332907c05222cbec1e1b4365689fbda9f
+(cherry picked from commit 8a6afe92c18dfefa91d057518be00b0127720fa5)
+Signed-off-by: Jiří Klimeš <jklimes@redhat.com>
+---
+ src/platform/nm-linux-platform.c | 16 ++++++++--------
+ 1 file changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/src/platform/nm-linux-platform.c b/src/platform/nm-linux-platform.c
+index 94103c5..0eaa8cb 100644
+--- a/src/platform/nm-linux-platform.c
++++ b/src/platform/nm-linux-platform.c
+@@ -947,18 +947,18 @@ link_extract_type (NMPlatform *platform, struct rtnl_link *rtnllink, gboolean *c
+ 		gs_free char *anycast_mask = NULL;
+ 		gs_free char *devtype = NULL;
+ 
+-		if (arptype == 256) {
+-			/* Some s390 CTC-type devices report 256 for the encapsulation type
+-			 * for some reason, but we need to call them Ethernet.
+-			 */
+-			if (!g_strcmp0 (driver, "ctcm"))
+-				return NM_LINK_TYPE_ETHERNET;
+-		}
+-
+ 		/* Fallback OVS detection for kernel <= 3.16 */
+ 		if (nmp_utils_ethtool_get_driver_info (ifname, &driver, NULL, NULL)) {
+ 			if (!g_strcmp0 (driver, "openvswitch"))
+ 				return NM_LINK_TYPE_OPENVSWITCH;
++
++			if (arptype == 256) {
++				/* Some s390 CTC-type devices report 256 for the encapsulation type
++				 * for some reason, but we need to call them Ethernet.
++				 */
++				if (!g_strcmp0 (driver, "ctcm"))
++					return NM_LINK_TYPE_ETHERNET;
++			}
+ 		}
+ 
+ 		sysfs_path = g_strdup_printf ("/sys/class/net/%s", ifname);
+-- 
+2.1.0
+
diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager/rh1277693-vpn-service-timer.patch b/meta-oe/recipes-connectivity/networkmanager/networkmanager/rh1277693-vpn-service-timer.patch
new file mode 100644
index 0000000..b787a8d
--- /dev/null
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager/rh1277693-vpn-service-timer.patch
@@ -0,0 +1,161 @@
+From f7617511bb94bbae2dbf99231a7d6be29575aa4d Mon Sep 17 00:00:00 2001
+From: Lubomir Rintel <lkundrak@v3.sk>
+Date: Thu, 1 Oct 2015 17:17:52 +0200
+Subject: [PATCH] nm-vpn-service-plugin: increase the quit timer
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+We now (since 3272ff6 libnm/libnm-glib: don't quit in the middle of asking for
+secrets) always hook on the quit timer when NM asks the plugin if it needs
+secrets. The timer is 20 seconds, which seems too short.
+
+Let's make it three minutes. Don't bother adding another timer or using a
+distinct timeout: it does no harm for the plugin to remain unused for three
+minutes on a bus.
+
+Another option would be to completely unhook it; however the plugin wouldn't
+learn if the user cancelled the NM's secrets request and would remain unused
+on the bus forever.
+
+(cherry picked from commit b1512221bc29f24b86d464dc5117439c366fd299)
+Signed-off-by: Jiří Klimeš <jklimes@redhat.com>
+---
+ libnm-glib/nm-vpn-plugin.c | 2 +-
+ libnm/nm-vpn-plugin-old.c  | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libnm-glib/nm-vpn-plugin.c b/libnm-glib/nm-vpn-plugin.c
+index f40ea80..a9c4a1f 100644
+--- a/libnm-glib/nm-vpn-plugin.c
++++ b/libnm-glib/nm-vpn-plugin.c
+@@ -69,7 +69,7 @@ static gboolean impl_vpn_plugin_set_failure (NMVPNPlugin *plugin,
+ 
+ #include "nm-vpn-plugin-glue.h"
+ 
+-#define NM_VPN_PLUGIN_QUIT_TIMER    20
++#define NM_VPN_PLUGIN_QUIT_TIMER    180
+ 
+ G_DEFINE_ABSTRACT_TYPE (NMVPNPlugin, nm_vpn_plugin, G_TYPE_OBJECT)
+ 
+diff --git a/libnm/nm-vpn-plugin-old.c b/libnm/nm-vpn-plugin-old.c
+index 24d8e40..deaa07d 100644
+--- a/libnm/nm-vpn-plugin-old.c
++++ b/libnm/nm-vpn-plugin-old.c
+@@ -44,7 +44,7 @@
+ 
+ #include "nmdbus-vpn-plugin.h"
+ 
+-#define NM_VPN_PLUGIN_OLD_QUIT_TIMER    20
++#define NM_VPN_PLUGIN_OLD_QUIT_TIMER    180
+ 
+ static void nm_vpn_plugin_old_initable_iface_init (GInitableIface *iface);
+ 
+-- 
+2.1.0
+
+From 0a95f003a9b0cad71d8fcb88562f4050881e0ace Mon Sep 17 00:00:00 2001
+From: Lubomir Rintel <lkundrak@v3.sk>
+Date: Tue, 20 Oct 2015 19:41:19 +0200
+Subject: [PATCH] agent-manager: cancel secrets requests on an error
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+It might be that the user didn't supply the secrets in time and the dbus call
+timed out. The agent should now hide the secrets dialog and we must let it know.
+
+https://bugzilla.redhat.com/show_bug.cgi?id=1272023
+(cherry picked from commit 5d1cac81a0bcc66b891bc38f1a2cc4b84d47f08b)
+Signed-off-by: Jiří Klimeš <jklimes@redhat.com>
+---
+ src/settings/nm-agent-manager.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/settings/nm-agent-manager.c b/src/settings/nm-agent-manager.c
+index 8dcda06..d59173a 100644
+--- a/src/settings/nm-agent-manager.c
++++ b/src/settings/nm-agent-manager.c
+@@ -816,6 +816,9 @@ get_done_cb (NMSecretAgent *agent,
+ 			req_complete_error (parent, error);
+ 			g_error_free (error);
+ 		} else {
++			/* Tell the failed agent we're no longer interested. */
++			nm_secret_agent_cancel_secrets (parent->current, parent->current_call_id);
++
+ 			/* Try the next agent */
+ 			request_next_agent (parent);
+ 		}
+-- 
+2.1.0
+
+From 24195884cd953966776074cb6d8df6bf01641845 Mon Sep 17 00:00:00 2001
+From: Lubomir Rintel <lkundrak@v3.sk>
+Date: Thu, 22 Oct 2015 14:27:45 +0200
+Subject: [PATCH] libnm-glib,vpn-plugin: remove old connect timer when adding
+ new one
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+If the plugin didn't succeed connecting once, don't let the old timer fire
+during a subsequent connection.
+
+https://bugzilla.redhat.com/show_bug.cgi?id=1271973
+(cherry picked from commit 842889bc5b588d191aa2c2cbcb73452ac8971cf5)
+Signed-off-by: Jiří Klimeš <jklimes@redhat.com>
+---
+ libnm-glib/nm-vpn-plugin.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libnm-glib/nm-vpn-plugin.c b/libnm-glib/nm-vpn-plugin.c
+index a9c4a1f..4350e60 100644
+--- a/libnm-glib/nm-vpn-plugin.c
++++ b/libnm-glib/nm-vpn-plugin.c
+@@ -426,6 +426,7 @@ connect_timer_start (NMVPNPlugin *plugin)
+ {
+ 	NMVPNPluginPrivate *priv = NM_VPN_PLUGIN_GET_PRIVATE (plugin);
+ 
++	nm_clear_g_source (&priv->connect_timer);
+ 	priv->connect_timer = g_timeout_add_seconds (60, connect_timer_expired, plugin);
+ }
+ 
+-- 
+2.1.0
+
+From 8c8e88ae2882ee544e9058729f046e66642ca2c7 Mon Sep 17 00:00:00 2001
+From: Lubomir Rintel <lkundrak@v3.sk>
+Date: Wed, 4 Nov 2015 14:28:01 +0100
+Subject: [PATCH] agent-manager: don't try to cancel requests that already
+ finished
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes: 5d1cac81a0bcc66b891bc38f1a2cc4b84d47f08b
+(cherry picked from commit f5585022787a57275687c7a1ec0ed3eaccaf5001)
+Signed-off-by: Jiří Klimeš <jklimes@redhat.com>
+---
+ src/settings/nm-agent-manager.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/settings/nm-agent-manager.c b/src/settings/nm-agent-manager.c
+index d59173a..0ca8ce8 100644
+--- a/src/settings/nm-agent-manager.c
++++ b/src/settings/nm-agent-manager.c
+@@ -816,8 +816,10 @@ get_done_cb (NMSecretAgent *agent,
+ 			req_complete_error (parent, error);
+ 			g_error_free (error);
+ 		} else {
+-			/* Tell the failed agent we're no longer interested. */
+-			nm_secret_agent_cancel_secrets (parent->current, parent->current_call_id);
++			if (parent->current_call_id) {
++				/* Tell the failed agent we're no longer interested. */
++				nm_secret_agent_cancel_secrets (parent->current, parent->current_call_id);
++			}
+ 
+ 			/* Try the next agent */
+ 			request_next_agent (parent);
+-- 
+2.1.0
+
diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
index 3d3f63e..294a666 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
@@ -14,6 +14,21 @@ SRC_URI = " \
     ${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkManager-${PV}.tar.xz \
     file://0001-don-t-try-to-run-sbin-dhclient-to-get-the-version-nu.patch \
     file://0002-add-pkg-config-for-libgcrypt.patch \
+    file://0003-config-bugfix-parse-commandline-options-into-correct.patch \
+    file://0004-vpn-connection-fix-unsetting-the-gateway.patch \
+    file://0005-vpn-connection-set-the-MTU-for-the-VPN-IP-interface.patch \
+    file://0006-device-don-t-reset-NM_UNMANAGED_DEFAULT-when-platfor.patch \
+    file://0007-nmcli-crash-vlan-priorities.patch \
+    file://0008-nmtui-fix-crash-in-secret-agent.patch \
+    file://rh1175446-vpn-secondaries-connections.patch \
+    file://rh1261428-ipv6-ignore-auto-dns.patch \
+    file://rh1263185-nmcli-con-add-generic.patch \
+    file://rh1263959-modem-supported-ip-families.patch \
+    file://rh1264676-fix-crash-on-device-removal.patch \
+    file://rh1265993-nmcli-allow-ipv6-ppp-for-wwan.patch \
+    file://rh1266003-fix-crash-on-bss-proxy-acquired.patch \
+    file://rh1272974-fix-s390-ctc-detection.patch \
+    file://rh1277693-vpn-service-timer.patch \
 "
 
 SRC_URI[md5sum] = "00f5f9ec69725a9f9b99366853c6f73e"
-- 
2.4.3



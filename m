Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id C9C1060132
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2016 10:10:04 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id f206so245726064wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2016 02:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gze3tbykgRP3Aif/SzO1IVoymZMTXj2LcrJCMQXcQ0A=;
	b=WZxloEAF+Uu5SXt+CW4qjbHcYQEWDy13P7eCiCIIIjLOyo9iqWvxb7xgtp9SCTDL6u
	ZC2qgcpcmamgf1fkqYddN2S09tzbVXtnRjDy9zy8MBNkYZ2ScVe0la8okOUTrzOG6Esk
	qLW4E5VHewPQFXPEwlgC//97N/SGm3Hn5MNKCn6UyROMMX2Q40MWmqso28CQDwYEjPiH
	LLMW5x9DaSKhoqU7WfjrZNyUkABAHUcQTFWvLUip3/OKMlszD1ajn+5TyTzCpMrFeDGn
	ue7SC/Kd/fDw6l9/XFgnLLYZ4PWKJofpR9sE7WbWWON9K3bY2L4x8DLElzu/8h965n/g
	6IIA==
X-Received: by 10.194.133.102 with SMTP id pb6mr7530236wjb.12.1452593404685;
	Tue, 12 Jan 2016 02:10:04 -0800 (PST)
Received: from chl500346.neratec.local (mail.neratec.com. [46.140.151.2])
	by smtp.gmail.com with ESMTPSA id
	k130sm3090286wmg.6.2016.01.12.02.10.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Jan 2016 02:10:04 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Jan 2016 11:09:53 +0100
Message-Id: <1452593395-19468-3-git-send-email-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1452593395-19468-1-git-send-email-adrian.freihofer@gmail.com>
References: <1452593395-19468-1-git-send-email-adrian.freihofer@gmail.com>
Subject: [meta-oe][PATCHv2 2/4] networkmanager: add patches
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
X-List-Received-Date: Tue, 12 Jan 2016 10:10:05 -0000

Apply three bug fix patches from NM git.

Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
---
 ...ilure-to-configure-routes-due-to-wrong-de.patch | 54 ++++++++++++++++++++++
 ...-clear-ppp_watch_id-upon-pppd-termination.patch | 29 ++++++++++++
 ...date-ip_iface-only-if-IP-interface-exists.patch | 45 ++++++++++++++++++
 .../networkmanager/networkmanager_1.0.10.bb        |  3 ++
 4 files changed, 131 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/0003-core-fix-failure-to-configure-routes-due-to-wrong-de.patch
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/0004-ppp-manager-clear-ppp_watch_id-upon-pppd-termination.patch
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/0005-device-update-ip_iface-only-if-IP-interface-exists.patch

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager/0003-core-fix-failure-to-configure-routes-due-to-wrong-de.patch b/meta-oe/recipes-connectivity/networkmanager/networkmanager/0003-core-fix-failure-to-configure-routes-due-to-wrong-de.patch
new file mode 100644
index 0000000..5da536e
--- /dev/null
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager/0003-core-fix-failure-to-configure-routes-due-to-wrong-de.patch
@@ -0,0 +1,54 @@
+From 11aa07ed939193e85516c287a57dee1837242972 Mon Sep 17 00:00:00 2001
+From: Thomas Haller <thaller@redhat.com>
+Date: Mon, 4 Jan 2016 18:54:26 +0100
+Subject: [PATCH 1/7] core: fix failure to configure routes due to wrong
+ device-route for IPv4 peer-addresses
+
+As in the case of a OpenVPN connection, we might add an address like:
+  10.8.0.58/32 ptp 10.8.0.57
+
+In this case, kernel would automatically add a device-route like:
+  10.8.0.57/32 via 0.0.0.0 dev 32 metric 0 mss 0 src rtprot-kernel scope link pref-src 10.8.0.58
+
+nm_ip4_config_commit() checks all IP addresses to figure out
+the present device-routes. Then the routes are synced by NMRouteManager.
+Due to a bug, we would not consider the peer-address, but the local-address
+and configure a route 10.8.0.58/32, instead of 10.8.0.57/32.
+
+That stays mostly unnoticed, because usually the peer and the local-address are
+in the same subnet, so that there is no difference (/32 is an example of the
+peer-address being in a different subnet).
+
+It also seems that due to a bug fixed by df4e5357521 this issue didn't surface.
+Probably because we would not notice the 10.8.0.57/32 right away and thus
+nm_route_manager_ip4_route_sync() would not wrongly delete it.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=759892
+
+https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=809195
+https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=809494
+https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=809526
+https://bugs.archlinux.org/task/47535
+https://bugzilla.redhat.com/show_bug.cgi?id=1294309
+https://mail.gnome.org/archives/networkmanager-list/2015-December/msg00059.html
+---
+ src/nm-ip4-config.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/nm-ip4-config.c b/src/nm-ip4-config.c
+index f625d35..61e29af 100644
+--- a/src/nm-ip4-config.c
++++ b/src/nm-ip4-config.c
+@@ -298,7 +298,8 @@ nm_ip4_config_commit (const NMIP4Config *config, int ifindex, gboolean routes_fu
+ 
+ 				route.ifindex = ifindex;
+ 				route.source = NM_IP_CONFIG_SOURCE_KERNEL;
+-				route.network = nm_utils_ip4_address_clear_host_address (addr->address, addr->plen);
++				route.network = nm_utils_ip4_address_clear_host_address (addr->peer_address ? : addr->address,
++				                                                         addr->plen);
+ 				route.plen = addr->plen;
+ 				route.pref_src = addr->address;
+ 				route.metric = default_route_metric;
+-- 
+2.5.0
+
diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager/0004-ppp-manager-clear-ppp_watch_id-upon-pppd-termination.patch b/meta-oe/recipes-connectivity/networkmanager/networkmanager/0004-ppp-manager-clear-ppp_watch_id-upon-pppd-termination.patch
new file mode 100644
index 0000000..41f2882
--- /dev/null
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager/0004-ppp-manager-clear-ppp_watch_id-upon-pppd-termination.patch
@@ -0,0 +1,29 @@
+From 8204c2a1968f757599c5ebec9a85efaacb0e522a Mon Sep 17 00:00:00 2001
+From: Beniamino Galvani <bgalvani@redhat.com>
+Date: Mon, 4 Jan 2016 14:18:02 +0100
+Subject: [PATCH 2/7] ppp-manager: clear @ppp_watch_id upon pppd termination
+
+Set @ppp_watch_id to zero upon pppd termination, otherwise the call to
+g_source_remove(priv->ppp_watch_id) in dispose() could trigger a failed
+assertion.
+
+(cherry picked from commit 5f93f0101538db39efe0f9ea2316e63bff953bf0)
+---
+ src/ppp-manager/nm-ppp-manager.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/ppp-manager/nm-ppp-manager.c b/src/ppp-manager/nm-ppp-manager.c
+index d27b262..85ca9c5 100644
+--- a/src/ppp-manager/nm-ppp-manager.c
++++ b/src/ppp-manager/nm-ppp-manager.c
+@@ -828,6 +828,7 @@ ppp_watch_cb (GPid pid, gint status, gpointer user_data)
+ 
+ 	nm_log_dbg (LOGD_PPP, "pppd pid %d cleaned up", priv->pid);
+ 	priv->pid = 0;
++	priv->ppp_watch_id = 0;
+ 	g_signal_emit (manager, signals[STATE_CHANGED], 0, NM_PPP_STATUS_DEAD);
+ }
+ 
+-- 
+2.5.0
+
diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager/0005-device-update-ip_iface-only-if-IP-interface-exists.patch b/meta-oe/recipes-connectivity/networkmanager/networkmanager/0005-device-update-ip_iface-only-if-IP-interface-exists.patch
new file mode 100644
index 0000000..05c2dca
--- /dev/null
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager/0005-device-update-ip_iface-only-if-IP-interface-exists.patch
@@ -0,0 +1,45 @@
+From cbcb848e6d4f4e8c4aa11c80f1f3dbb7fb2d397e Mon Sep 17 00:00:00 2001
+From: Beniamino Galvani <bgalvani@redhat.com>
+Date: Mon, 4 Jan 2016 14:22:01 +0100
+Subject: [PATCH 3/7] device: update @ip_iface only if IP interface exists
+
+If @ip_ifindex is zero, the IP interface has disappeared and
+there's no point in updating @ip_iface.
+
+Actually, unconditionally updating @ip_iface is dangerous because it
+breaks the assumption used by other functions (as
+nm_device_get_ip_ifindex()) that a non-NULL @ip_iface implies a valid
+@ip_ifindex. This was causing the scary failure:
+
+  devices/nm-device.c:666:get_ip_iface_identifier: assertion failed: (ifindex)
+
+https://bugzilla.redhat.com/show_bug.cgi?id=1268617
+(cherry picked from commit ed536998f9530698ff3082fc5587dbeb7d3a594f)
+---
+ src/devices/nm-device.c | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/src/devices/nm-device.c b/src/devices/nm-device.c
+index bb39ca5..4413e92 100644
+--- a/src/devices/nm-device.c
++++ b/src/devices/nm-device.c
+@@ -1526,12 +1526,13 @@ device_ip_link_changed (NMDevice *self)
+ {
+ 	NMDevicePrivate *priv = NM_DEVICE_GET_PRIVATE (self);
+ 	const NMPlatformLink *pllink;
+-	int ip_ifindex;
+ 
+ 	priv->device_ip_link_changed_id = 0;
+ 
+-	ip_ifindex = nm_device_get_ip_ifindex (self);
+-	pllink = nm_platform_link_get (NM_PLATFORM_GET, ip_ifindex);
++	if (!priv->ip_ifindex)
++		return G_SOURCE_REMOVE;
++
++	pllink = nm_platform_link_get (NM_PLATFORM_GET, priv->ip_ifindex);
+ 	if (!pllink)
+ 		return G_SOURCE_REMOVE;
+ 
+-- 
+2.5.0
+
diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb
index 81ce953..6126ed7 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb
@@ -15,6 +15,9 @@ SRC_URI = " \
     ${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkManager-${PV}.tar.xz \
     file://0001-don-t-try-to-run-sbin-dhclient-to-get-the-version-nu.patch \
     file://0002-add-pkg-config-for-libgcrypt.patch \
+    file://0003-core-fix-failure-to-configure-routes-due-to-wrong-de.patch \
+    file://0004-ppp-manager-clear-ppp_watch_id-upon-pppd-termination.patch \
+    file://0005-device-update-ip_iface-only-if-IP-interface-exists.patch \
 "
 SRC_URI[md5sum] = "a8f54460a4708efd840358f32d0968fd"
 SRC_URI[sha256sum] = "1bcfce8441dfd9f432a100d06b54f3831a2275cccc3b74b1b4c09a011e179fbc"
-- 
2.5.0



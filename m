Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8686873180
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jan 2016 22:45:05 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id b14so19404758wmb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jan 2016 14:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=zpys3CGGkkZEfbJZu14/SZG67KlfKd39XQV3wo1rMxw=;
	b=GrZ3yEorpR950i9eKOtS0g8z6nnFYs8DUCHgdm1dgM5JcIhUKQl7jJvZwJN2DU/RuN
	wZeQS5q/TDMNQHc2HXhOP0aPoEzTqgjn1qq8oP8eET/9UQKJro0QNQITgrFR1HQ7RBB5
	TEI+PiLBSWJqGLPOszjbi4xz7NWLbaen5XmYaqRX6kcjCfFqwxqJcQlPPqzNvPPBCpXM
	WZIVShk7CxZMwVHug/wz3z/+8eodDOOn3Qj6I5O93kEBUBZgzYDrHw6b9lFvS9GLrnGS
	prco0g5t9VK6Jg+72vDDB/FlW0qM4bKvJD4OHXz/D8gy24HrE79lvnGYrxvL1FaaePGs
	hvSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=zpys3CGGkkZEfbJZu14/SZG67KlfKd39XQV3wo1rMxw=;
	b=mHey+fQThQJzcu19puzgu/KjjVdOt4zGToZ10HVEi6r9lyvFeXCbgVDY6j2z66uh52
	lx1Qsb8qC/Wf9Uf1gggGbwveehvOB/kwyIh8nmBRcjS2yDdcdEZMLo/MXP5p9RuWd7MQ
	uf7s2wj9TxB2mUwR9neJ/XeNLnhTeSTjOYpaAGbP1ib3Nra4TkjwSo/gQoLjL53Bz2i6
	cSbqR8UkN+e2d7AkwnoAyLx1wDuPtDPkAP9Aea2JUkUrOTcI+Zh4PEg+A8/lW9r5Bd+7
	sBYP8+a1DTRpla5VpvZkNvZ4j6tYZU+Qjjik23nfMu4ELFN+jDgEMq/lS96Y3TUERBZ6
	9+xQ==
X-Gm-Message-State: ALoCoQk3zMI9WRN9PcvlCDaOZLIUG/63FCXH7hDl3bPS7RSsK4Ud80LR7KmJMtK2UcdEfCyLdI11xj/MiHBBdnA1dgXuWTPLow==
X-Received: by 10.194.175.170 with SMTP id cb10mr31538968wjc.36.1453157106092; 
	Mon, 18 Jan 2016 14:45:06 -0800 (PST)
Received: from wsadrian.local (c-82-192-248-24.customer.ggaweb.ch.
	[82.192.248.24]) by smtp.gmail.com with ESMTPSA id
	df10sm25734738wjb.44.2016.01.18.14.45.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Jan 2016 14:45:05 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Jan 2016 23:44:06 +0100
Message-Id: <1453157047-6614-3-git-send-email-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1453157047-6614-1-git-send-email-adrian.freihofer@gmail.com>
References: <1453157047-6614-1-git-send-email-adrian.freihofer@gmail.com>
Subject: [meta-oe][PATCH v4 2/3] networkmanager: add patches
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
X-List-Received-Date: Mon, 18 Jan 2016 22:45:05 -0000

- Apply three bug fix patches from NM git.
- Apply a patch to fix a bug in the header files breaking gnome-panel build.
- fix ppp rdepend: pppd is not on the target if NM does not rdepend on it.

Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
---
 ...ilure-to-configure-routes-due-to-wrong-de.patch | 54 ++++++++++++++++++++
 ...-clear-ppp_watch_id-upon-pppd-termination.patch | 29 +++++++++++
 ...date-ip_iface-only-if-IP-interface-exists.patch | 45 +++++++++++++++++
 .../0006-Fix-nm-version-macro-includes.patch       | 58 ++++++++++++++++++++++
 .../networkmanager/networkmanager_1.0.10.bb        |  6 ++-
 5 files changed, 191 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/0003-core-fix-failure-to-configure-routes-due-to-wrong-de.patch
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/0004-ppp-manager-clear-ppp_watch_id-upon-pppd-termination.patch
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/0005-device-update-ip_iface-only-if-IP-interface-exists.patch
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/0006-Fix-nm-version-macro-includes.patch

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
diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager/0006-Fix-nm-version-macro-includes.patch b/meta-oe/recipes-connectivity/networkmanager/networkmanager/0006-Fix-nm-version-macro-includes.patch
new file mode 100644
index 0000000..aa57c83
--- /dev/null
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager/0006-Fix-nm-version-macro-includes.patch
@@ -0,0 +1,58 @@
+From 7274bbadd398a69b8babf47431f80d35e0228c42 Mon Sep 17 00:00:00 2001
+From: Adrian Freihofer <adrian.freihofer@gmail.com>
+Date: Mon, 18 Jan 2016 08:53:26 +0100
+Subject: [PATCH] Fix nm-version-macro includes
+
+nm-version-macros.h cannot be found since include directive has
+been changed from " to <. This breaks for example gnome-panel
+build:
+/usr/include/NetworkManager/NetworkManager.h:31:31:
+fatal error: nm-version-macros.h: No such file or directory.
+---
+ libnm-core/nm-version.h     | 2 +-
+ libnm-util/NetworkManager.h | 2 +-
+ libnm-util/nm-version.h     | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/libnm-core/nm-version.h b/libnm-core/nm-version.h
+index 730330a..d751bc1 100644
+--- a/libnm-core/nm-version.h
++++ b/libnm-core/nm-version.h
+@@ -23,7 +23,7 @@
+ 
+ #include <glib.h>
+ 
+-#include <nm-version-macros.h>
++#include "nm-version-macros.h"
+ 
+ /* Deprecation / Availability macros */
+ 
+diff --git a/libnm-util/NetworkManager.h b/libnm-util/NetworkManager.h
+index d83e4ab..3a964fc 100644
+--- a/libnm-util/NetworkManager.h
++++ b/libnm-util/NetworkManager.h
+@@ -28,7 +28,7 @@
+ 
+ /* This header must not include glib or libnm. */
+ 
+-#include <nm-version-macros.h>
++#include "nm-version-macros.h"
+ 
+ /*
+  * dbus services details
+diff --git a/libnm-util/nm-version.h b/libnm-util/nm-version.h
+index 63895dd..41101a4 100644
+--- a/libnm-util/nm-version.h
++++ b/libnm-util/nm-version.h
+@@ -23,7 +23,7 @@
+ 
+ #include <glib.h>
+ 
+-#include <nm-version-macros.h>
++#include "nm-version-macros.h"
+ 
+ /* Deprecation / Availability macros */
+ 
+-- 
+2.5.0
+
diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb
index 81ce953..b47a8c8 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb
@@ -15,6 +15,10 @@ SRC_URI = " \
     ${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkManager-${PV}.tar.xz \
     file://0001-don-t-try-to-run-sbin-dhclient-to-get-the-version-nu.patch \
     file://0002-add-pkg-config-for-libgcrypt.patch \
+    file://0003-core-fix-failure-to-configure-routes-due-to-wrong-de.patch \
+    file://0004-ppp-manager-clear-ppp_watch_id-upon-pppd-termination.patch \
+    file://0005-device-update-ip_iface-only-if-IP-interface-exists.patch \
+    file://0006-Fix-nm-version-macro-includes.patch \
 "
 SRC_URI[md5sum] = "a8f54460a4708efd840358f32d0968fd"
 SRC_URI[sha256sum] = "1bcfce8441dfd9f432a100d06b54f3831a2275cccc3b74b1b4c09a011e179fbc"
@@ -46,7 +50,7 @@ PACKAGECONFIG[bluez5] = "--enable-bluez5-dun,--disable-bluez5-dun,bluez5"
 PACKAGECONFIG[consolekit] = "--with-session-tracking=consolekit,,consolekit,consolekit"
 PACKAGECONFIG[concheck] = "--with-libsoup=yes,--with-libsoup=no,libsoup-2.4"
 PACKAGECONFIG[modemmanager] = "--with-modem-manager-1=yes,--with-modem-manager-1=no,modemmanager"
-PACKAGECONFIG[ppp] = "--enable-ppp,--disable-ppp,ppp"
+PACKAGECONFIG[ppp] = "--enable-ppp,--disable-ppp,ppp,ppp"
 # Use full featured dhcp client instead of internal one
 PACKAGECONFIG[dhclient] = "--with-dhclient=${base_sbindir}/dhclient,,,dhcp-client"
 PACKAGECONFIG[dnsmasq] = "--with-dnsmasq=${bindir}/dnsmasq"
-- 
2.5.0



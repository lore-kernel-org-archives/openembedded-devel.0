Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 20B7471AA2
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  6 Nov 2016 22:07:20 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id c17so13460412wmc.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Nov 2016 14:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=H1J1vX6BgyA9dFPSljF8IueXftuIqEDAc4in0cjDiRA=;
	b=srrKCO/v1rkDuGqxWT04XsaCY4E8bz120HmD2eKEJ/kchYqOvNraoDy3hava+4Tjgy
	Bc1CRro78zStX1qvmesLVOaU6+V3eMhCJNovEJ3NdijuENHE5JHctVuT3FtHFpMlG4i0
	O28LPnlfBNW7IalT7byaJXWGOlr3NdH+hQUkmTG0gNGylHUvJcXzpItozjcBQ7JcjJ/I
	oKHv2ih9WSReWCp9kkPUF0DJZBRQhdE2k1c3t2NgtWtnmOXTZgwZGEO0OMgrvFijyaMK
	GHWEq130DopR8VLqS5g5ln0Ewm7FEmNssY6vuuW1qAkzWmUm0qHJ71v+qkbI7VlY+Rhf
	MGNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=H1J1vX6BgyA9dFPSljF8IueXftuIqEDAc4in0cjDiRA=;
	b=DoMdkNMx+O8uFRQdi5eClZoJ3Wj7BTSlASop+jLKMAWSd3SRmhU+nPV1w0DswNnJsx
	XHg64e3WhVfGF4/ZSsb7iQFTuKXQMPsferzd4f/IA7mXMCPdWWwdunM1alT9x5TPccY2
	NNK0Tmqp4gvI3uy9w5ypCXiHN3xVXMMDeKHgZbYwwii6r2ZESde1m/AfNevo1Kue7/XG
	XHT3X98PKQXcAhPnkPu9qBRY1rkmW/dw97v4EVQ7+dgjyROs6EcfYs8V9AQwC6QFHihW
	y6TBt4Rh5l/ny23jIS779+9L5VrOkhkYtStF05haPzJJrYf3clRypH+iOVbC8tCO4KG/
	EcZQ==
X-Gm-Message-State: ABUngvcFvdiTEnlT7Cas5BeDxgq3r4NQHYUbbb5ayvvC88tkX2wiTHfoL2woGwYDgrhWsw==
X-Received: by 10.28.163.5 with SMTP id m5mr3761293wme.98.1478470040961;
	Sun, 06 Nov 2016 14:07:20 -0800 (PST)
Received: from localhost.localdomain (p4FDF1D71.dip0.t-ipconnect.de.
	[79.223.29.113]) by smtp.googlemail.com with ESMTPSA id
	k2sm16044363wjv.11.2016.11.06.14.07.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 06 Nov 2016 14:07:20 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Nov 2016 23:06:51 +0100
Message-Id: <1478470013-27247-13-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1478470013-27247-1-git-send-email-schnitzeltony@googlemail.com>
References: <1478470013-27247-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 13/15] networkmanager: update to 1.4.2
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
X-List-Received-Date: Sun, 06 Nov 2016 22:07:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* could not find out what made md5 change for
  docs/api/html/license.html but checked: it is still GPLv2
* all traces to libgcrypt are gone -> remove 0002-add-pkg-config-for-libgcrypt.patch
* upstream sets up service same as in
  0002-networkmanager-fixed-issues-of-NetworkManager-wait-o.patch
* patches 0003.. 0004.. 0005.. were not used -> remove

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...ch => 0002-Fix-nm-version-macro-includes.patch} |  0
 .../0002-add-pkg-config-for-libgcrypt.patch        | 41 ----------------
 ...ger-fixed-issues-of-NetworkManager-wait-o.patch | 44 ------------------
 ...ilure-to-configure-routes-due-to-wrong-de.patch | 54 ----------------------
 ...-clear-ppp_watch_id-upon-pppd-termination.patch | 29 ------------
 ...date-ip_iface-only-if-IP-interface-exists.patch | 45 ------------------
 ...rkmanager_1.0.12.bb => networkmanager_1.4.2.bb} | 31 +++++++------
 7 files changed, 18 insertions(+), 226 deletions(-)
 rename meta-oe/recipes-connectivity/networkmanager/networkmanager/{0006-Fix-nm-version-macro-includes.patch => 0002-Fix-nm-version-macro-includes.patch} (100%)
 delete mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/0002-add-pkg-config-for-libgcrypt.patch
 delete mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/0002-networkmanager-fixed-issues-of-NetworkManager-wait-o.patch
 delete mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/0003-core-fix-failure-to-configure-routes-due-to-wrong-de.patch
 delete mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/0004-ppp-manager-clear-ppp_watch_id-upon-pppd-termination.patch
 delete mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/0005-device-update-ip_iface-only-if-IP-interface-exists.patch
 rename meta-oe/recipes-connectivity/networkmanager/{networkmanager_1.0.12.bb => networkmanager_1.4.2.bb} (83%)

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager/0006-Fix-nm-version-macro-includes.patch b/meta-oe/recipes-connectivity/networkmanager/networkmanager/0002-Fix-nm-version-macro-includes.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/networkmanager/networkmanager/0006-Fix-nm-version-macro-includes.patch
rename to meta-oe/recipes-connectivity/networkmanager/networkmanager/0002-Fix-nm-version-macro-includes.patch
diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager/0002-add-pkg-config-for-libgcrypt.patch b/meta-oe/recipes-connectivity/networkmanager/networkmanager/0002-add-pkg-config-for-libgcrypt.patch
deleted file mode 100644
index bb95eaa..0000000
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager/0002-add-pkg-config-for-libgcrypt.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From a9261fee4a41045c42e0d292237cee532e11982c Mon Sep 17 00:00:00 2001
-From: Adrian <adrian.freihofer@gmail.com>
-Date: Thu, 27 Nov 2014 15:43:26 +0100
-Subject: [PATCH] add pkg config for libgcrypt
-
----
- configure.ac | 18 +++++++-----------
- 1 file changed, 7 insertions(+), 11 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 94b0758..654a015 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -480,17 +480,13 @@ if test x"$ac_crypto" = xnss; then
-   with_nss=yes
- elif test x"$ac_crypto" = xgnutls; then
-   PKG_CHECK_MODULES(GNUTLS, [gnutls >= 1.2])
--  AC_PATH_PROG(LIBGCRYPT_CONFIG, libgcrypt-config, no)
--  if test x"$LIBGCRYPT_CONFIG" = xno; then
--    AC_MSG_ERROR([gnutls explicitly requested but gcrypt not found on system])
--  else
--    AC_DEFINE(HAVE_GNUTLS, 1, [Define if you have libgnutls])
--    LIBGCRYPT_CFLAGS=`$LIBGCRYPT_CONFIG --cflags`
--    LIBGCRYPT_LIBS=`$LIBGCRYPT_CONFIG --libs`
--    AC_SUBST(LIBGCRYPT_CFLAGS)
--    AC_SUBST(LIBGCRYPT_LIBS)
--    with_gnutls=yes
--  fi
-+  AC_DEFINE(HAVE_GNUTLS, 1, [Define if you have libgnutls])
-+  PKG_CHECK_MODULES(LIBGCRYPT, [libgcrypt >= 1.1.42], [
-+      AC_DEFINE(HAVE_GCRYPT, 1, [Define if gcrypt library is available.])
-+      with_gnutls=yes
-+    ], [
-+      AC_MSG_ERROR([gnutls explicitly requested but gcrypt not found on system])
-+    ])
- else
-   AC_MSG_ERROR([Please choose either 'nss' or 'gnutls' for certificate and crypto operations])
- fi
--- 
-1.9.1
-
diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager/0002-networkmanager-fixed-issues-of-NetworkManager-wait-o.patch b/meta-oe/recipes-connectivity/networkmanager/networkmanager/0002-networkmanager-fixed-issues-of-NetworkManager-wait-o.patch
deleted file mode 100644
index 4eb9e21..0000000
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager/0002-networkmanager-fixed-issues-of-NetworkManager-wait-o.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 0690452b863286e524d2037427816b7850301f93 Mon Sep 17 00:00:00 2001
-From: Haiqing Bai <Haiqing.Bai@windriver.com>
-Date: Tue, 6 Sep 2016 09:27:38 +0800
-Subject: [PATCH] networkmanager: fixed issues of
- NetworkManager-wait-online.service.in.
-
-Remove network.target in "Before" to avoid circle dependency.
-Wants=network.target
-Before=network.target network-online.target
-
-Correct the "WantedBy" to network-online.target.
-
-Upstream-status: Pending
-
-Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
----
- data/NetworkManager-wait-online.service.in | 7 ++++---
- 1 file changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/data/NetworkManager-wait-online.service.in b/data/NetworkManager-wait-online.service.in
-index 6ad6942..1753d20 100644
---- a/data/NetworkManager-wait-online.service.in
-+++ b/data/NetworkManager-wait-online.service.in
-@@ -1,13 +1,14 @@
- [Unit]
- Description=Network Manager Wait Online
-+Documentation=man:nm-online(1)
- Requisite=NetworkManager.service
- After=NetworkManager.service
--Wants=network.target
--Before=network.target network-online.target
-+Before=network-online.target
- 
- [Service]
- Type=oneshot
- ExecStart=@bindir@/nm-online -s -q --timeout=30
-+RemainAfterExit=yes
- 
- [Install]
--WantedBy=multi-user.target
-+WantedBy=network-online.target
--- 
-1.9.1
-
diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager/0003-core-fix-failure-to-configure-routes-due-to-wrong-de.patch b/meta-oe/recipes-connectivity/networkmanager/networkmanager/0003-core-fix-failure-to-configure-routes-due-to-wrong-de.patch
deleted file mode 100644
index 5da536e..0000000
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager/0003-core-fix-failure-to-configure-routes-due-to-wrong-de.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 11aa07ed939193e85516c287a57dee1837242972 Mon Sep 17 00:00:00 2001
-From: Thomas Haller <thaller@redhat.com>
-Date: Mon, 4 Jan 2016 18:54:26 +0100
-Subject: [PATCH 1/7] core: fix failure to configure routes due to wrong
- device-route for IPv4 peer-addresses
-
-As in the case of a OpenVPN connection, we might add an address like:
-  10.8.0.58/32 ptp 10.8.0.57
-
-In this case, kernel would automatically add a device-route like:
-  10.8.0.57/32 via 0.0.0.0 dev 32 metric 0 mss 0 src rtprot-kernel scope link pref-src 10.8.0.58
-
-nm_ip4_config_commit() checks all IP addresses to figure out
-the present device-routes. Then the routes are synced by NMRouteManager.
-Due to a bug, we would not consider the peer-address, but the local-address
-and configure a route 10.8.0.58/32, instead of 10.8.0.57/32.
-
-That stays mostly unnoticed, because usually the peer and the local-address are
-in the same subnet, so that there is no difference (/32 is an example of the
-peer-address being in a different subnet).
-
-It also seems that due to a bug fixed by df4e5357521 this issue didn't surface.
-Probably because we would not notice the 10.8.0.57/32 right away and thus
-nm_route_manager_ip4_route_sync() would not wrongly delete it.
-
-https://bugzilla.gnome.org/show_bug.cgi?id=759892
-
-https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=809195
-https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=809494
-https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=809526
-https://bugs.archlinux.org/task/47535
-https://bugzilla.redhat.com/show_bug.cgi?id=1294309
-https://mail.gnome.org/archives/networkmanager-list/2015-December/msg00059.html
----
- src/nm-ip4-config.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/nm-ip4-config.c b/src/nm-ip4-config.c
-index f625d35..61e29af 100644
---- a/src/nm-ip4-config.c
-+++ b/src/nm-ip4-config.c
-@@ -298,7 +298,8 @@ nm_ip4_config_commit (const NMIP4Config *config, int ifindex, gboolean routes_fu
- 
- 				route.ifindex = ifindex;
- 				route.source = NM_IP_CONFIG_SOURCE_KERNEL;
--				route.network = nm_utils_ip4_address_clear_host_address (addr->address, addr->plen);
-+				route.network = nm_utils_ip4_address_clear_host_address (addr->peer_address ? : addr->address,
-+				                                                         addr->plen);
- 				route.plen = addr->plen;
- 				route.pref_src = addr->address;
- 				route.metric = default_route_metric;
--- 
-2.5.0
-
diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager/0004-ppp-manager-clear-ppp_watch_id-upon-pppd-termination.patch b/meta-oe/recipes-connectivity/networkmanager/networkmanager/0004-ppp-manager-clear-ppp_watch_id-upon-pppd-termination.patch
deleted file mode 100644
index 41f2882..0000000
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager/0004-ppp-manager-clear-ppp_watch_id-upon-pppd-termination.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 8204c2a1968f757599c5ebec9a85efaacb0e522a Mon Sep 17 00:00:00 2001
-From: Beniamino Galvani <bgalvani@redhat.com>
-Date: Mon, 4 Jan 2016 14:18:02 +0100
-Subject: [PATCH 2/7] ppp-manager: clear @ppp_watch_id upon pppd termination
-
-Set @ppp_watch_id to zero upon pppd termination, otherwise the call to
-g_source_remove(priv->ppp_watch_id) in dispose() could trigger a failed
-assertion.
-
-(cherry picked from commit 5f93f0101538db39efe0f9ea2316e63bff953bf0)
----
- src/ppp-manager/nm-ppp-manager.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/ppp-manager/nm-ppp-manager.c b/src/ppp-manager/nm-ppp-manager.c
-index d27b262..85ca9c5 100644
---- a/src/ppp-manager/nm-ppp-manager.c
-+++ b/src/ppp-manager/nm-ppp-manager.c
-@@ -828,6 +828,7 @@ ppp_watch_cb (GPid pid, gint status, gpointer user_data)
- 
- 	nm_log_dbg (LOGD_PPP, "pppd pid %d cleaned up", priv->pid);
- 	priv->pid = 0;
-+	priv->ppp_watch_id = 0;
- 	g_signal_emit (manager, signals[STATE_CHANGED], 0, NM_PPP_STATUS_DEAD);
- }
- 
--- 
-2.5.0
-
diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager/0005-device-update-ip_iface-only-if-IP-interface-exists.patch b/meta-oe/recipes-connectivity/networkmanager/networkmanager/0005-device-update-ip_iface-only-if-IP-interface-exists.patch
deleted file mode 100644
index 05c2dca..0000000
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager/0005-device-update-ip_iface-only-if-IP-interface-exists.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From cbcb848e6d4f4e8c4aa11c80f1f3dbb7fb2d397e Mon Sep 17 00:00:00 2001
-From: Beniamino Galvani <bgalvani@redhat.com>
-Date: Mon, 4 Jan 2016 14:22:01 +0100
-Subject: [PATCH 3/7] device: update @ip_iface only if IP interface exists
-
-If @ip_ifindex is zero, the IP interface has disappeared and
-there's no point in updating @ip_iface.
-
-Actually, unconditionally updating @ip_iface is dangerous because it
-breaks the assumption used by other functions (as
-nm_device_get_ip_ifindex()) that a non-NULL @ip_iface implies a valid
-@ip_ifindex. This was causing the scary failure:
-
-  devices/nm-device.c:666:get_ip_iface_identifier: assertion failed: (ifindex)
-
-https://bugzilla.redhat.com/show_bug.cgi?id=1268617
-(cherry picked from commit ed536998f9530698ff3082fc5587dbeb7d3a594f)
----
- src/devices/nm-device.c | 7 ++++---
- 1 file changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/src/devices/nm-device.c b/src/devices/nm-device.c
-index bb39ca5..4413e92 100644
---- a/src/devices/nm-device.c
-+++ b/src/devices/nm-device.c
-@@ -1526,12 +1526,13 @@ device_ip_link_changed (NMDevice *self)
- {
- 	NMDevicePrivate *priv = NM_DEVICE_GET_PRIVATE (self);
- 	const NMPlatformLink *pllink;
--	int ip_ifindex;
- 
- 	priv->device_ip_link_changed_id = 0;
- 
--	ip_ifindex = nm_device_get_ip_ifindex (self);
--	pllink = nm_platform_link_get (NM_PLATFORM_GET, ip_ifindex);
-+	if (!priv->ip_ifindex)
-+		return G_SOURCE_REMOVE;
-+
-+	pllink = nm_platform_link_get (NM_PLATFORM_GET, priv->ip_ifindex);
- 	if (!pllink)
- 		return G_SOURCE_REMOVE;
- 
--- 
-2.5.0
-
diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.12.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.4.2.bb
similarity index 83%
rename from meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.12.bb
rename to meta-oe/recipes-connectivity/networkmanager/networkmanager_1.4.2.bb
index 9134880..90d0232 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.12.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.4.2.bb
@@ -4,22 +4,32 @@ SECTION = "net/misc"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cbbffd568227ada506640fe950a4823b \
                     file://libnm-util/COPYING;md5=1c4fa765d6eb3cd2fbd84344a1b816cd \
-                    file://docs/api/html/license.html;md5=51d7fb67bde992e58533a8481cee070b \
+                    file://docs/api/html/license.html;md5=6baf214193dfc5d10b297b41fc2d22c9 \
 "
 
-DEPENDS = "intltool-native libnl dbus dbus-glib dbus-glib-native libgudev util-linux libndp libnewt polkit"
+DEPENDS = " \
+    intltool-native \
+    libnl \
+    dbus \
+    dbus-glib \
+    dbus-glib-native \
+    libgudev \
+    util-linux \
+    libndp \
+    libnewt \
+    polkit \
+    jansson \
+"
 
 inherit gnomebase gettext systemd bluetooth bash-completion vala gobject-introspection
 
 SRC_URI = " \
     ${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkManager-${PV}.tar.xz \
     file://0001-don-t-try-to-run-sbin-dhclient-to-get-the-version-nu.patch \
-    file://0002-add-pkg-config-for-libgcrypt.patch \
-    file://0006-Fix-nm-version-macro-includes.patch \
-    file://0002-networkmanager-fixed-issues-of-NetworkManager-wait-o.patch \
+    file://0002-Fix-nm-version-macro-includes.patch \
 "
-SRC_URI[md5sum] = "ebb273456a81ccf9dfaf2461061b0e96"
-SRC_URI[sha256sum] = "3a470f8c60109b1acb5784ddc2423501706b5fe34c793a6faee87e591eb04a9e"
+SRC_URI[md5sum] = "59b5b5585467756787c6cb535cbd306e"
+SRC_URI[sha256sum] = "a864e347ddf6da8dabd40e0185b8c10a655d4a94b45cbaa2b3bb4b5e8360d204"
 
 S = "${WORKDIR}/NetworkManager-${PV}"
 
@@ -57,7 +67,7 @@ PACKAGECONFIG[ppp] = "--enable-ppp,--disable-ppp,ppp,ppp"
 PACKAGECONFIG[dhclient] = "--with-dhclient=${base_sbindir}/dhclient,,,dhcp-client"
 PACKAGECONFIG[dnsmasq] = "--with-dnsmasq=${bindir}/dnsmasq"
 PACKAGECONFIG[nss] = "--with-crypto=nss,,nss"
-PACKAGECONFIG[gnutls] = "--with-crypto=gnutls,,gnutls libgcrypt"
+PACKAGECONFIG[gnutls] = "--with-crypto=gnutls,,gnutls"
 PACKAGECONFIG[wifi] = "--enable-wifi=yes,--enable-wifi=no,wireless-tools,wpa-supplicant wireless-tools"
 PACKAGECONFIG[ifupdown] = "--enable-ifupdown,--disable-ifupdown"
 PACKAGECONFIG[netconfig] = "--with-netconfig=yes,--with-netconfig=no"
@@ -89,11 +99,6 @@ RRECOMMENDS_${PN} += "iptables \
 "
 RCONFLICTS_${PN} = "connman"
 
-FILES_${PN}-dbg += " \
-    ${libdir}/NetworkManager/.debug/ \
-    ${libdir}/pppd/*/.debug/ \
-"
-
 FILES_${PN}-dev += " \
     ${datadir}/NetworkManager/gdb-cmd \
     ${libdir}/pppd/*/*.la \
-- 
2.5.5



Return-Path: <psaavedra@igalia.com>
X-Greylist: delayed 318 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 13 Mar 2018 22:26:37 UTC
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id 4B9947887D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Mar 2018 22:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:To:From;
	bh=qC1zGcEmAmNo/mtKpMmnapNi0B1xYzNzf4lw/OEL9+o=; 
	b=FmLo1tSRb29xZKDhge4haUMEgGB05dVtT1yjJ5gTUlSRl7cTXCGKLwI4t8Fz0ZaUyF34vt+BJf3DikF2Ax1cALP4UqHMGQzWiGlFVVMZQxgmBWQOSsbJsi33sxK3OCILimmriLbATx3tU9lN/Vh1JmMY2Bf2KYlLOU+ikSl2K2i35RJgBH+npFhdjGrM3Vlh7DaSb0+r76035msPkwYDl5ad4t2yae0q8VOuBW0JNTHIyEA7sTPAFQlHPAr9wbfrdh3ta5wKX7nX7Qq/Kdmjhc1/ekCPP6DyYcdbFwweKiSSFXI/KJYDayDEVi2Lv2Nud3sfxVYM/P+K4lf0HNB9Sg==;
Received: from buildbox.local.igalia.com ([192.168.10.88])
	by fanzine.igalia.com with esmtp (Exim) id 1evsIK-0000fI-LC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Mar 2018 23:21:20 +0100
From: Pablo Saavedra <psaavedra@igalia.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Mar 2018 23:20:55 +0100
Message-Id: <20180313222055.47545-1-psaavedra@igalia.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] networkmanager upgrade to 1.10.6
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
X-List-Received-Date: Tue, 13 Mar 2018 22:26:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* Upgraded to latest stable version [1]
* Forward-port of the Yocto patches
* Disabled 0004-Define-missing-features-to-cater-for-musl.patch
* This version keeps fixed 'Fixed setting 802-1x.password-raw
  property in nmcli' error. Fixed on 1.6.4 [2].

References:

[1] https://cgit.freedesktop.org/NetworkManager/NetworkManager/tree/NEWS?h=nm-1-10
[2] https://cgit.freedesktop.org/NetworkManager/NetworkManager/tree/NEWS?h=1.6.4#n11

Signed-off-by: Pablo Saavedra <psaavedra@igalia.com>
---
 ...adjust-net-headers-for-musl-compatibility.patch |  32 +-
 ...dns-resolved-add-systemd-resolved-backend.patch | 621 ---------------------
 ...ed-also-check-for-etc-resolv-conf.systemd.patch |  29 -
 ...o-run-sbin-dhclient-to-get-the-version-nu.patch |  36 --
 ...stemd-xlocale.h-is-dropped-by-newer-glibc.patch |  29 -
 .../0002-Fix-nm-version-macro-includes.patch       |  58 --
 ...et-util.h-Include-linux-sockios.h-on-musl.patch |  14 +-
 ...-string-in-g_dbus_message_new_method_erro.patch |  67 ---
 .../networkmanager/0003-Define-ETH_ALEN.patch      |  10 +-
 ...Define-missing-features-to-cater-for-musl.patch |  41 +-
 ...emove-net-ethernet.h-seems-to-be-over-spe.patch |  44 +-
 ... 0006-check-for-strndupa-before-using-it.patch} |  22 +-
 ...figure.ac-Fix-pkgconfig-sysroot-locations.patch |  25 +
 ...rkmanager_1.4.4.bb => networkmanager_1.10.6.bb} |  21 +-
 14 files changed, 119 insertions(+), 930 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-dns-resolved-add-systemd-resolved-backend.patch
 delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-dns-resolved-also-check-for-etc-resolv-conf.systemd.patch
 delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-don-t-try-to-run-sbin-dhclient-to-get-the-version-nu.patch
 delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-systemd-xlocale.h-is-dropped-by-newer-glibc.patch
 delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-Fix-nm-version-macro-includes.patch
 delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-user-format-string-in-g_dbus_message_new_method_erro.patch
 rename meta-networking/recipes-connectivity/networkmanager/networkmanager/{0001-check-for-strndupa-before-using-it.patch => 0006-check-for-strndupa-before-using-it.patch} (77%)
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0007-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.4.4.bb => networkmanager_1.10.6.bb} (81%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-adjust-net-headers-for-musl-compatibility.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-adjust-net-headers-for-musl-compatibility.patch
index ced0c7cff..194e03722 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-adjust-net-headers-for-musl-compatibility.patch
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-adjust-net-headers-for-musl-compatibility.patch
@@ -1,21 +1,21 @@
-From 047d3bf96b510740f64687480333c378e414995f Mon Sep 17 00:00:00 2001
+From f81abf62c0ae93628df36c27357358523be25fb8 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 31 Mar 2017 15:57:05 -0700
-Subject: [PATCH 1/5] adjust net/ headers for musl compatibility
+Subject: [PATCH 1/7] adjust net/ headers for musl compatibility
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- libnm-core/nm-utils.c          | 12 +++++++-----
+ libnm-core/nm-utils.c          | 13 ++++++++-----
  libnm-core/nm-utils.h          |  5 ++---
  src/platform/wifi/wifi-utils.h |  2 +-
- 3 files changed, 10 insertions(+), 9 deletions(-)
+ 3 files changed, 11 insertions(+), 9 deletions(-)
 
 diff --git a/libnm-core/nm-utils.c b/libnm-core/nm-utils.c
-index df75d56..868224e 100644
+index ebbbfd3..77273df 100644
 --- a/libnm-core/nm-utils.c
 +++ b/libnm-core/nm-utils.c
-@@ -19,24 +19,26 @@
-  * Copyright 2005 - 2014 Red Hat, Inc.
+@@ -19,14 +19,9 @@
+  * Copyright 2005 - 2017 Red Hat, Inc.
   */
  
 -#include "nm-default.h"
@@ -29,25 +29,29 @@ index df75d56..868224e 100644
  #include <arpa/inet.h>
  #include <uuid/uuid.h>
  #include <libintl.h>
- #include <gmodule.h>
+@@ -34,12 +29,20 @@
  #include <sys/stat.h>
+ #include <net/if.h>
+ #include <linux/pkt_sched.h>
 +//#include <net/if_arp.h>
 +//#include <net/ethernet.h>
 +#include <netinet/ether.h>
 +
 +#include "nm-default.h"
- 
++
 +#include "nm-utils.h"
+ 
  #if WITH_JANSSON
+ #include "nm-json.h"
  #include <jansson.h>
  #endif
  
 +
+ #include "nm-utils/nm-enum-utils.h"
+ #include "nm-utils/nm-hash-utils.h"
  #include "nm-common-macros.h"
- #include "nm-utils-private.h"
- #include "nm-setting-private.h"
 diff --git a/libnm-core/nm-utils.h b/libnm-core/nm-utils.h
-index 407c14e..156ccae 100644
+index df9284b..02e24ea 100644
 --- a/libnm-core/nm-utils.h
 +++ b/libnm-core/nm-utils.h
 @@ -27,11 +27,10 @@
@@ -65,7 +69,7 @@ index 407c14e..156ccae 100644
  #include "nm-core-enum-types.h"
  #include "nm-setting-wireless-security.h"
 diff --git a/src/platform/wifi/wifi-utils.h b/src/platform/wifi/wifi-utils.h
-index 8e2b93f..84f5ce9 100644
+index 705717b..939080f 100644
 --- a/src/platform/wifi/wifi-utils.h
 +++ b/src/platform/wifi/wifi-utils.h
 @@ -22,7 +22,7 @@
@@ -78,5 +82,5 @@ index 8e2b93f..84f5ce9 100644
  #include "nm-dbus-interface.h"
  
 -- 
-2.12.1
+2.14.1
 
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-dns-resolved-add-systemd-resolved-backend.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-dns-resolved-add-systemd-resolved-backend.patch
deleted file mode 100644
index bd194a61d..000000000
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-dns-resolved-add-systemd-resolved-backend.patch
+++ /dev/null
@@ -1,621 +0,0 @@
-From: Sjoerd Simons <sjoerd@luon.net>
-Date: Sun, 21 Aug 2016 21:46:02 +0200
-Subject: [PATCH] dns/resolved: add systemd-resolved backend
-
-Add initial DNS backend that pushes DNS information into
-systemd-resolved. Backend is choosen by default if the systems
-resolv.conv is setup to pointing to one of the standard resolved
-locations.
-
-This doesn't handle global dns configuration.
-
-Signed-off-by: Sjoerd Simons <sjoerd@luon.net>
-
-https://bugzilla.gnome.org/show_bug.cgi?id=762540
-
-Upstream-Status: Backport
-
----
- man/NetworkManager.conf.xml               |  10 +-
- src/Makefile.am                           |   2 +
- src/dns-manager/nm-dns-manager.c          |  43 ++-
- src/dns-manager/nm-dns-systemd-resolved.c | 427 ++++++++++++++++++++++++++++++
- src/dns-manager/nm-dns-systemd-resolved.h |  45 ++++
- 5 files changed, 523 insertions(+), 4 deletions(-)
- create mode 100644 src/dns-manager/nm-dns-systemd-resolved.c
- create mode 100644 src/dns-manager/nm-dns-systemd-resolved.h
-
-diff --git a/man/NetworkManager.conf.xml b/man/NetworkManager.conf.xml
-index 6295b82..0a67ae5 100644
---- a/man/NetworkManager.conf.xml
-+++ b/man/NetworkManager.conf.xml
-@@ -275,10 +275,12 @@ no-auto-default=*
-       <varlistentry>
-         <term><varname>dns</varname></term>
-         <listitem><para>Set the DNS (<filename>resolv.conf</filename>) processing mode.</para>
--        <para><literal>default</literal>: The default if the key is
--        not specified. NetworkManager will update
-+        <para><literal>default</literal>: NetworkManager will update
-         <filename>resolv.conf</filename> to reflect the nameservers
--        provided by currently active connections.</para>
-+        provided by currently active connections.  This is the default
-+        if the key is not specified, unless the system is configured
-+        to use systemd-resolved; in this case the default is
-+        <literal>systemd-resolved</literal></para>
-         <para><literal>dnsmasq</literal>: NetworkManager will run
-         dnsmasq as a local caching nameserver, using a "split DNS"
-         configuration if you are connected to a VPN, and then update
-@@ -288,6 +290,8 @@ no-auto-default=*
-         to unbound and dnssec-triggerd, providing a "split DNS"
-         configuration with DNSSEC support. The <filename>/etc/resolv.conf</filename>
-         will be managed by dnssec-trigger daemon.</para>
-+        <para><literal>systemd-resolved</literal>: NetworkManager will
-+        push the DNS configuration to systemd-resolved</para>
-         <para><literal>none</literal>: NetworkManager will not
-         modify resolv.conf. This implies
-         <literal>rc-manager</literal>&nbsp;<literal>unmanaged</literal></para>
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 8d29b19..10f63de 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -345,6 +345,8 @@ libNetworkManager_la_SOURCES = \
- 	\
- 	dns-manager/nm-dns-dnsmasq.c \
- 	dns-manager/nm-dns-dnsmasq.h \
-+	dns-manager/nm-dns-systemd-resolved.c \
-+	dns-manager/nm-dns-systemd-resolved.h \
- 	dns-manager/nm-dns-unbound.c \
- 	dns-manager/nm-dns-unbound.h \
- 	dns-manager/nm-dns-manager.c \
-diff --git a/src/dns-manager/nm-dns-manager.c b/src/dns-manager/nm-dns-manager.c
-index 5a758a9..38bc786 100644
---- a/src/dns-manager/nm-dns-manager.c
-+++ b/src/dns-manager/nm-dns-manager.c
-@@ -45,6 +45,7 @@
- 
- #include "nm-dns-plugin.h"
- #include "nm-dns-dnsmasq.h"
-+#include "nm-dns-systemd-resolved.h"
- #include "nm-dns-unbound.h"
- 
- #if WITH_LIBSOUP
-@@ -1588,6 +1589,37 @@ _check_resconf_immutable (NMDnsManagerResolvConfManager rc_manager)
- 
- NM_DEFINE_SINGLETON_GETTER (NMDnsManager, nm_dns_manager_get, NM_TYPE_DNS_MANAGER);
- 
-+static gboolean
-+_resolvconf_resolved_managed (void)
-+{
-+	static const char *const resolved_paths[] = {
-+		"/run/systemd/resolve/resolv.conf",
-+		"/lib/systemd/resolv.conf",
-+		"/usr/lib/systemd/resolv.conf",
-+	};
-+	GFile *f;
-+	GFileInfo *info;
-+	gboolean ret = FALSE;
-+
-+	f = g_file_new_for_path (_PATH_RESCONF);
-+	info = g_file_query_info (f,
-+	                          G_FILE_ATTRIBUTE_STANDARD_IS_SYMLINK","\
-+	                          G_FILE_ATTRIBUTE_STANDARD_SYMLINK_TARGET,
-+	                          G_FILE_QUERY_INFO_NOFOLLOW_SYMLINKS,
-+	                          NULL, NULL);
-+
-+	if (info && g_file_info_get_is_symlink (info)) {
-+		ret = _nm_utils_strv_find_first ((gchar **) resolved_paths,
-+		                                 G_N_ELEMENTS (resolved_paths),
-+		                                 g_file_info_get_symlink_target (info)) >= 0;
-+	}
-+
-+	g_clear_object(&info);
-+	g_clear_object(&f);
-+
-+	return ret;
-+}
-+
- static void
- init_resolv_conf_mode (NMDnsManager *self, gboolean force_reload_plugin)
- {
-@@ -1633,7 +1665,16 @@ again:
- 
- 	rc_manager = _check_resconf_immutable (rc_manager);
- 
--	if (nm_streq0 (mode, "dnsmasq")) {
-+	if (   (!mode && _resolvconf_resolved_managed ())
-+	    || nm_streq0 (mode, "systemd-resolved")) {
-+		if (   force_reload_plugin
-+		    || !NM_IS_DNS_SYSTEMD_RESOLVED (priv->plugin)) {
-+			_clear_plugin (self);
-+			priv->plugin = nm_dns_systemd_resolved_new ();
-+			plugin_changed = TRUE;
-+		}
-+		mode = "systemd-resolved";
-+	} else if (nm_streq0 (mode, "dnsmasq")) {
- 		if (force_reload_plugin || !NM_IS_DNS_DNSMASQ (priv->plugin)) {
- 			_clear_plugin (self);
- 			priv->plugin = nm_dns_dnsmasq_new ();
-diff --git a/src/dns-manager/nm-dns-systemd-resolved.c b/src/dns-manager/nm-dns-systemd-resolved.c
-new file mode 100644
-index 0000000..6bdd5f6
---- /dev/null
-+++ b/src/dns-manager/nm-dns-systemd-resolved.c
-@@ -0,0 +1,427 @@
-+/* -*- Mode: C; tab-width: 4; indent-tabs-mode: t; c-basic-offset: 4 -*- */
-+/*
-+ * Copyright (C) 2010 Dan Williams <dcbw@redhat.com>
-+ * Copyright (C) 2016 Sjoerd Simons <sjoerd@luon.net>
-+ *
-+ * This program is free software; you can redistribute it and/or modify
-+ * it under the terms of the GNU General Public License as published by
-+ * the Free Software Foundation; either version 2, or (at your option)
-+ * any later version.
-+ *
-+ * This program is distributed in the hope that it will be useful,
-+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
-+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+ * GNU General Public License for more details.
-+ *
-+ * You should have received a copy of the GNU General Public License along
-+ * with this program; if not, write to the Free Software Foundation, Inc.,
-+ * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
-+ *
-+ */
-+
-+#include "nm-default.h"
-+
-+#include "nm-dns-systemd-resolved.h"
-+
-+#include <stdlib.h>
-+#include <unistd.h>
-+#include <sys/types.h>
-+#include <sys/wait.h>
-+#include <arpa/inet.h>
-+#include <sys/stat.h>
-+#include <linux/if.h>
-+
-+#include "nm-core-internal.h"
-+#include "nm-platform.h"
-+#include "nm-utils.h"
-+#include "nm-ip4-config.h"
-+#include "nm-ip6-config.h"
-+#include "nm-bus-manager.h"
-+#include "nm-manager.h"
-+#include "nm-device.h"
-+#include "NetworkManagerUtils.h"
-+
-+G_DEFINE_TYPE (NMDnsSystemdResolved, nm_dns_systemd_resolved, NM_TYPE_DNS_PLUGIN)
-+
-+#define NM_DNS_SYSTEMD_RESOLVED_GET_PRIVATE(o) \
-+  (G_TYPE_INSTANCE_GET_PRIVATE ((o), NM_TYPE_DNS_SYSTEMD_RESOLVED, \
-+    NMDnsSystemdResolvedPrivate))
-+
-+#define SYSTEMD_RESOLVED_DBUS_SERVICE "org.freedesktop.resolve1"
-+#define SYSTEMD_RESOLVED_DBUS_PATH "/org/freedesktop/resolve1"
-+
-+typedef struct {
-+	int ifindex;
-+	GList *configs;
-+} InterfaceConfig;
-+
-+typedef struct {
-+	GDBusProxy *resolve;
-+	GCancellable *init_cancellable;
-+	GCancellable *update_cancellable;
-+	GQueue dns_updates;
-+	GQueue domain_updates;
-+} NMDnsSystemdResolvedPrivate;
-+
-+/*****************************************************************************/
-+
-+#define _NMLOG_DOMAIN         LOGD_DNS
-+#define _NMLOG_PREFIX_NAME    "systemd-resolved"
-+#define _NMLOG(level, ...) \
-+    G_STMT_START { \
-+        nm_log ((level), _NMLOG_DOMAIN, \
-+                "%s[%p]: " _NM_UTILS_MACRO_FIRST(__VA_ARGS__), \
-+                _NMLOG_PREFIX_NAME, \
-+                (self) \
-+                _NM_UTILS_MACRO_REST(__VA_ARGS__)); \
-+    } G_STMT_END
-+
-+/*****************************************************************************/
-+
-+static void
-+call_done (GObject *source, GAsyncResult *r, gpointer user_data)
-+{
-+	GVariant *v;
-+	GError *error = NULL;
-+	NMDnsSystemdResolved *self = (NMDnsSystemdResolved *) user_data;
-+
-+	v = g_dbus_proxy_call_finish (G_DBUS_PROXY (source), r, &error);
-+
-+	if (g_error_matches (error, G_IO_ERROR, G_IO_ERROR_CANCELLED))
-+		return;
-+
-+	if (error != NULL) {
-+		_LOGW ("Failed: %s\n", error->message);
-+		g_error_free (error);
-+	}
-+}
-+
-+static void
-+add_interface_configuration (NMDnsSystemdResolved *self,
-+                             GArray *interfaces,
-+                             const NMDnsIPConfigData *data)
-+{
-+	int i;
-+	InterfaceConfig *ic = NULL;
-+	int ifindex;
-+	NMDevice *device;
-+
-+	if (NM_IS_IP4_CONFIG (data->config))
-+		ifindex = nm_ip4_config_get_ifindex (data->config);
-+	else if (NM_IS_IP6_CONFIG  (data->config))
-+		ifindex = nm_ip6_config_get_ifindex (data->config);
-+	else
-+		g_return_if_reached ();
-+
-+	device = nm_manager_get_device_by_ifindex (nm_manager_get (), ifindex);
-+
-+	if (!nm_device_get_managed (device, FALSE))
-+		return;
-+
-+	for (i = 0; i < interfaces->len; i++) {
-+		InterfaceConfig *tic = &g_array_index (interfaces, InterfaceConfig, i);
-+		if (ifindex == tic->ifindex) {
-+			ic = tic;
-+			break;
-+		}
-+	}
-+
-+	if (!ic) {
-+		g_array_set_size (interfaces, interfaces->len + 1);
-+		ic = &g_array_index (interfaces, InterfaceConfig,
-+		                     interfaces->len - 1);
-+		ic->ifindex = ifindex;
-+	}
-+
-+	ic->configs = g_list_append (ic->configs, data->config);
-+}
-+
-+static void
-+add_domain (GVariantBuilder *domains,
-+            const char *domain,
-+            gboolean never_default)
-+{
-+	/* If this link is never the default (e.g. only used for resources on this
-+	 * network) add a routing domain. */
-+	g_variant_builder_add (domains, "(sb)", domain, never_default);
-+}
-+
-+static void
-+update_add_ip6_config (NMDnsSystemdResolved *self,
-+                       GVariantBuilder *dns,
-+                       GVariantBuilder *domains,
-+                       const NMIP6Config *config)
-+{
-+	guint i, n;
-+
-+	n = nm_ip6_config_get_num_nameservers (config);
-+	for (i = 0 ; i < n; i++) {
-+		const struct in6_addr *ip;
-+
-+		g_variant_builder_open (dns, G_VARIANT_TYPE ("(iay)"));
-+		g_variant_builder_add (dns, "i", AF_INET6);
-+		ip = nm_ip6_config_get_nameserver (config, i),
-+
-+		g_variant_builder_add_value (dns, g_variant_new_fixed_array (G_VARIANT_TYPE_BYTE, ip, 16, 1));
-+		g_variant_builder_close (dns);
-+	}
-+
-+	n = nm_ip6_config_get_num_searches (config);
-+	if (n > 0) {
-+		for (i = 0; i < n; i++) {
-+			add_domain (domains, nm_ip6_config_get_search (config, i),
-+			            nm_ip6_config_get_never_default (config));
-+		}
-+	} else {
-+		n = nm_ip6_config_get_num_domains (config);
-+		for (i = 0; i < n; i++) {
-+			add_domain (domains, nm_ip6_config_get_domain (config, i),
-+			            nm_ip6_config_get_never_default (config));
-+		}
-+	}
-+}
-+
-+static void
-+update_add_ip4_config (NMDnsSystemdResolved *self,
-+                       GVariantBuilder *dns,
-+                       GVariantBuilder *domains,
-+                       const NMIP4Config *config)
-+{
-+	guint i, n;
-+
-+	n = nm_ip4_config_get_num_nameservers (config);
-+	for (i = 0 ; i < n; i++) {
-+		guint32 ns;
-+
-+		g_variant_builder_open (dns, G_VARIANT_TYPE ("(iay)"));
-+		g_variant_builder_add (dns, "i", AF_INET);
-+		ns = nm_ip4_config_get_nameserver (config, i),
-+
-+		g_variant_builder_add_value (dns, g_variant_new_fixed_array (G_VARIANT_TYPE_BYTE, &ns, 4, 1));
-+		g_variant_builder_close (dns);
-+	}
-+
-+	n = nm_ip4_config_get_num_searches (config);
-+	if (n  > 0) {
-+		for (i = 0; i < n; i++) {
-+			add_domain (domains, nm_ip4_config_get_search (config, i),
-+			            nm_ip4_config_get_never_default (config));
-+		}
-+	} else {
-+		n = nm_ip4_config_get_num_domains (config);
-+		for (i = 0; i < n; i++) {
-+			add_domain (domains, nm_ip4_config_get_domain (config, i),
-+			            nm_ip4_config_get_never_default (config));
-+		}
-+	}
-+}
-+
-+static void
-+free_pending_updates (NMDnsSystemdResolved *self)
-+{
-+	NMDnsSystemdResolvedPrivate *priv = NM_DNS_SYSTEMD_RESOLVED_GET_PRIVATE (self);
-+	GVariant *v;
-+
-+	while ((v = g_queue_pop_head (&priv->dns_updates)) != NULL)
-+		g_variant_unref (v);
-+
-+	while ((v = g_queue_pop_head (&priv->domain_updates)) != NULL)
-+		g_variant_unref (v);
-+}
-+
-+static void
-+prepare_one_interface (NMDnsSystemdResolved *self, InterfaceConfig *ic)
-+{
-+	NMDnsSystemdResolvedPrivate *priv = NM_DNS_SYSTEMD_RESOLVED_GET_PRIVATE (self);
-+	GVariantBuilder dns, domains;
-+	GList *l;
-+
-+	g_variant_builder_init (&dns, G_VARIANT_TYPE ("(ia(iay))"));
-+	g_variant_builder_add (&dns, "i", ic->ifindex);
-+	g_variant_builder_open (&dns, G_VARIANT_TYPE ("a(iay)"));
-+
-+	g_variant_builder_init (&domains, G_VARIANT_TYPE ("(ia(sb))"));
-+	g_variant_builder_add (&domains, "i", ic->ifindex);
-+	g_variant_builder_open (&domains, G_VARIANT_TYPE ("a(sb)"));
-+
-+	for (l = ic->configs ; l != NULL ; l = g_list_next (l)) {
-+		if (NM_IS_IP4_CONFIG (l->data))
-+			update_add_ip4_config (self, &dns, &domains, l->data);
-+		else if (NM_IS_IP6_CONFIG (l->data))
-+			update_add_ip6_config (self, &dns, &domains, l->data);
-+		else
-+			g_assert_not_reached ();
-+	}
-+	g_variant_builder_close (&dns);
-+	g_variant_builder_close (&domains);
-+
-+	g_queue_push_tail (&priv->dns_updates,
-+	                   g_variant_ref_sink (g_variant_builder_end (&dns)));
-+	g_queue_push_tail (&priv->domain_updates,
-+	                   g_variant_ref_sink (g_variant_builder_end (&domains)));
-+}
-+
-+static void
-+send_updates (NMDnsSystemdResolved *self)
-+{
-+	NMDnsSystemdResolvedPrivate *priv = NM_DNS_SYSTEMD_RESOLVED_GET_PRIVATE (self);
-+	GVariant *v;
-+
-+	nm_clear_g_cancellable (&priv->update_cancellable);
-+
-+	if (!priv->resolve)
-+		return;
-+
-+	priv->update_cancellable = g_cancellable_new ();
-+
-+	while ((v = g_queue_pop_head (&priv->dns_updates)) != NULL) {
-+		g_dbus_proxy_call (priv->resolve, "SetLinkDNS", v,
-+		                   G_DBUS_CALL_FLAGS_NONE,
-+		                   -1, priv->update_cancellable, call_done, self);
-+		g_variant_unref (v);
-+	}
-+
-+	while ((v = g_queue_pop_head (&priv->domain_updates)) != NULL) {
-+		g_dbus_proxy_call (priv->resolve, "SetLinkDomains", v,
-+		                   G_DBUS_CALL_FLAGS_NONE,
-+		                   -1, priv->update_cancellable, call_done, self);
-+		g_variant_unref (v);
-+	}
-+}
-+
-+static gboolean
-+update (NMDnsPlugin *plugin,
-+        const NMDnsIPConfigData **configs,
-+        const NMGlobalDnsConfig *global_config,
-+        const char *hostname)
-+{
-+	NMDnsSystemdResolved *self = NM_DNS_SYSTEMD_RESOLVED (plugin);
-+	GArray *interfaces = g_array_new (TRUE, TRUE, sizeof (InterfaceConfig));
-+	const NMDnsIPConfigData **c;
-+	int i;
-+
-+	for (c = configs; *c != NULL; c++)
-+		add_interface_configuration (self, interfaces, *c);
-+
-+	free_pending_updates (self);
-+
-+	for (i = 0; i < interfaces->len; i++) {
-+		InterfaceConfig *ic = &g_array_index (interfaces, InterfaceConfig, i);
-+
-+		prepare_one_interface (self, ic);
-+		g_list_free (ic->configs);
-+	}
-+
-+	g_array_free (interfaces, TRUE);
-+
-+	send_updates (self);
-+
-+	return TRUE;
-+}
-+
-+/****************************************************************/
-+
-+static gboolean
-+is_caching (NMDnsPlugin *plugin)
-+{
-+	return TRUE;
-+}
-+
-+static const char *
-+get_name (NMDnsPlugin *plugin)
-+{
-+	return "systemd-resolved";
-+}
-+
-+/****************************************************************/
-+
-+NMDnsPlugin *
-+nm_dns_systemd_resolved_new (void)
-+{
-+	return g_object_new (NM_TYPE_DNS_SYSTEMD_RESOLVED, NULL);
-+}
-+
-+static void
-+resolved_proxy_created (GObject *source, GAsyncResult *r, gpointer user_data)
-+{
-+	NMDnsSystemdResolved *self = (NMDnsSystemdResolved *) user_data;
-+	NMDnsSystemdResolvedPrivate *priv;
-+	gs_free_error GError *error = NULL;
-+	GDBusProxy *resolve;
-+
-+	resolve = g_dbus_proxy_new_finish (r, &error);
-+	if (   !resolve
-+	    && g_error_matches (error, G_IO_ERROR, G_IO_ERROR_CANCELLED))
-+		return;
-+
-+	priv = NM_DNS_SYSTEMD_RESOLVED_GET_PRIVATE (self);
-+	g_clear_object (&priv->init_cancellable);
-+	if (!resolve) {
-+		_LOGW ("failed to connect to resolved via DBus: %s", error->message);
-+		g_signal_emit_by_name (self, NM_DNS_PLUGIN_FAILED);
-+		return;
-+	}
-+
-+	priv->resolve = resolve;
-+	send_updates (self);
-+}
-+
-+
-+static void
-+nm_dns_systemd_resolved_init (NMDnsSystemdResolved *self)
-+{
-+	NMDnsSystemdResolvedPrivate *priv = NM_DNS_SYSTEMD_RESOLVED_GET_PRIVATE (self);
-+	NMBusManager *dbus_mgr;
-+	GDBusConnection *connection;
-+
-+	g_queue_init (&priv->dns_updates);
-+	g_queue_init (&priv->domain_updates);
-+
-+	dbus_mgr = nm_bus_manager_get ();
-+	g_return_if_fail (dbus_mgr);
-+
-+	connection = nm_bus_manager_get_connection (dbus_mgr);
-+	g_return_if_fail (connection);
-+
-+	priv->init_cancellable = g_cancellable_new ();
-+	g_dbus_proxy_new (connection,
-+	                  G_DBUS_PROXY_FLAGS_DO_NOT_LOAD_PROPERTIES |
-+	                  G_DBUS_PROXY_FLAGS_DO_NOT_CONNECT_SIGNALS,
-+	                  NULL,
-+	                  SYSTEMD_RESOLVED_DBUS_SERVICE,
-+	                  SYSTEMD_RESOLVED_DBUS_PATH,
-+	                  SYSTEMD_RESOLVED_DBUS_SERVICE ".Manager",
-+	                  priv->init_cancellable,
-+	                  resolved_proxy_created,
-+	                  self);
-+}
-+
-+static void
-+dispose (GObject *object)
-+{
-+	NMDnsSystemdResolved *self = NM_DNS_SYSTEMD_RESOLVED (object);
-+	NMDnsSystemdResolvedPrivate *priv = NM_DNS_SYSTEMD_RESOLVED_GET_PRIVATE (self);
-+
-+	free_pending_updates (self);
-+	g_clear_object (&priv->resolve);
-+	nm_clear_g_cancellable (&priv->init_cancellable);
-+	nm_clear_g_cancellable (&priv->update_cancellable);
-+
-+	G_OBJECT_CLASS (nm_dns_systemd_resolved_parent_class)->dispose (object);
-+}
-+
-+static void
-+nm_dns_systemd_resolved_class_init (NMDnsSystemdResolvedClass *dns_class)
-+{
-+	NMDnsPluginClass *plugin_class = NM_DNS_PLUGIN_CLASS (dns_class);
-+	GObjectClass *object_class = G_OBJECT_CLASS (dns_class);
-+
-+	g_type_class_add_private (dns_class, sizeof (NMDnsSystemdResolvedPrivate));
-+
-+	object_class->dispose = dispose;
-+
-+	plugin_class->is_caching = is_caching;
-+	plugin_class->update = update;
-+	plugin_class->get_name = get_name;
-+}
-+
-diff --git a/src/dns-manager/nm-dns-systemd-resolved.h b/src/dns-manager/nm-dns-systemd-resolved.h
-new file mode 100644
-index 0000000..45c64b3
---- /dev/null
-+++ b/src/dns-manager/nm-dns-systemd-resolved.h
-@@ -0,0 +1,45 @@
-+/* -*- Mode: C; tab-width: 4; indent-tabs-mode: t; c-basic-offset: 4 -*- */
-+/* This program is free software; you can redistribute it and/or modify
-+ * it under the terms of the GNU General Public License as published by
-+ * the Free Software Foundation; either version 2, or (at your option)
-+ * any later version.
-+ *
-+ * This program is distributed in the hope that it will be useful,
-+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
-+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+ * GNU General Public License for more details.
-+ *
-+ * You should have received a copy of the GNU General Public License along
-+ * with this program; if not, write to the Free Software Foundation, Inc.,
-+ * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
-+ *
-+ * Copyright (C) 2010 Red Hat, Inc.
-+ * Copyright (C) 2016 Sjoerd Simons <sjoerd@luon.net>
-+ */
-+
-+#ifndef __NETWORKMANAGER_DNS_SYSTEMD_RESOLVED_H__
-+#define __NETWORKMANAGER_DNS_SYSTEMD_RESOLVED_H__
-+
-+#include "nm-dns-plugin.h"
-+
-+#define NM_TYPE_DNS_SYSTEMD_RESOLVED            (nm_dns_systemd_resolved_get_type ())
-+#define NM_DNS_SYSTEMD_RESOLVED(obj)            (G_TYPE_CHECK_INSTANCE_CAST ((obj), NM_TYPE_DNS_SYSTEMD_RESOLVED, NMDnsSystemdResolved))
-+#define NM_DNS_SYSTEMD_RESOLVED_CLASS(klass)    (G_TYPE_CHECK_CLASS_CAST ((klass), NM_TYPE_DNS_SYSTEMD_RESOLVED, NMDnsSystemdResolvedClass))
-+#define NM_IS_DNS_SYSTEMD_RESOLVED(obj)         (G_TYPE_CHECK_INSTANCE_TYPE ((obj), NM_TYPE_DNS_SYSTEMD_RESOLVED))
-+#define NM_IS_DNS_SYSTEMD_RESOLVED_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE ((klass), NM_TYPE_DNS_SYSTEMD_RESOLVED))
-+#define NM_DNS_SYSTEMD_RESOLVED_GET_CLASS(obj)  (G_TYPE_INSTANCE_GET_CLASS ((obj), NM_TYPE_DNS_SYSTEMD_RESOLVED, NMDnsSystemdResolvedClass))
-+
-+typedef struct {
-+	NMDnsPlugin parent;
-+} NMDnsSystemdResolved;
-+
-+typedef struct {
-+	NMDnsPluginClass parent;
-+} NMDnsSystemdResolvedClass;
-+
-+GType nm_dns_systemd_resolved_get_type (void);
-+
-+NMDnsPlugin *nm_dns_systemd_resolved_new (void);
-+
-+#endif /* __NETWORKMANAGER_DNS_SYSTEMD_RESOLVED_H__ */
-+
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-dns-resolved-also-check-for-etc-resolv-conf.systemd.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-dns-resolved-also-check-for-etc-resolv-conf.systemd.patch
deleted file mode 100644
index ca7e4a496..000000000
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-dns-resolved-also-check-for-etc-resolv-conf.systemd.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 6f799f1f0e68cc7bf89c0a56aec5ecf46937619d Mon Sep 17 00:00:00 2001
-From: Ricardo Salveti <rsalveti@rsalveti.net>
-Date: Thu, 15 Jun 2017 10:02:38 -0300
-Subject: [PATCH] dns/resolved: also check for /etc/resolv-conf.systemd
-
-OE specific resolv.conf path, so it can be enabled by default if available.
-
-Upstream-Status: Inappropriate [OE config specific]
-
-Signed-off-by: Ricardo Salveti <rsalveti@rsalveti.net>
----
- src/dns-manager/nm-dns-manager.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/dns-manager/nm-dns-manager.c b/src/dns-manager/nm-dns-manager.c
-index c1d2bf7..d70d4b4 100644
---- a/src/dns-manager/nm-dns-manager.c
-+++ b/src/dns-manager/nm-dns-manager.c
-@@ -1596,6 +1596,7 @@ _resolvconf_resolved_managed (void)
- 		"/run/systemd/resolve/resolv.conf",
- 		"/lib/systemd/resolv.conf",
- 		"/usr/lib/systemd/resolv.conf",
-+		"/etc/resolv-conf.systemd",
- 	};
- 	GFile *f;
- 	GFileInfo *info;
--- 
-2.7.4
-
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-don-t-try-to-run-sbin-dhclient-to-get-the-version-nu.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-don-t-try-to-run-sbin-dhclient-to-get-the-version-nu.patch
deleted file mode 100644
index 5c9ed92b8..000000000
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-don-t-try-to-run-sbin-dhclient-to-get-the-version-nu.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 7dd40db6606c3b3559365a03944cb99aee5ceabc Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Thu, 4 Apr 2013 12:57:58 +0200
-Subject: [PATCH] don't try to run /sbin/dhclient to get the version number,
- this break cross-compiling
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Inappropriate [build system specific]
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- configure.ac |    6 ------
- 1 files changed, 0 insertions(+), 6 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index cc66e9b..7163287 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -488,12 +488,6 @@ AS_IF([test -z "$with_dhcpcd"], with_dhcpcd=yes)
- # Search and check the executables
- if test "$with_dhclient" = "yes"; then
- 	AC_PATH_PROGS(with_dhclient, dhclient, no, /sbin:/usr/sbin:/usr/local/sbin)
--	if test "$with_dhclient" != "no"; then
--		if ! $with_dhclient --version 2>&1 | grep -q "^isc-dhclient-4\."; then
--			AC_MSG_WARN([Cannot use dhclient, version 4.x is required])
--			with_dhclient=no
--		fi
--	fi
- fi
- if test "$with_dhcpcd" = "yes"; then
- 	AC_PATH_PROGS(with_dhcpcd, dhcpcd, no, /sbin:/usr/sbin:/usr/local/sbin)
--- 
-1.7.6.5
-
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-systemd-xlocale.h-is-dropped-by-newer-glibc.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-systemd-xlocale.h-is-dropped-by-newer-glibc.patch
deleted file mode 100644
index 4234e2be2..000000000
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-systemd-xlocale.h-is-dropped-by-newer-glibc.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From a9bfe6f2029d75caf28fcdf3e740843cf6359615 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 27 Jun 2017 07:31:25 -0700
-Subject: [PATCH 1/2] systemd: xlocale.h is dropped by newer glibc
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/systemd/src/basic/parse-util.c | 4 ----
- 1 file changed, 4 deletions(-)
-
-diff --git a/src/systemd/src/basic/parse-util.c b/src/systemd/src/basic/parse-util.c
-index 9c21e5a..dd95d1f 100644
---- a/src/systemd/src/basic/parse-util.c
-+++ b/src/systemd/src/basic/parse-util.c
-@@ -25,11 +25,7 @@
- #include <stdio.h>
- #include <stdlib.h>
- #include <string.h>
--#ifdef __GLIBC__
--#include <xlocale.h>
--#else
- #include <locale.h>
--#endif
- #include "alloc-util.h"
- #include "extract-word.h"
- #include "macro.h"
--- 
-2.13.2
-
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-Fix-nm-version-macro-includes.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-Fix-nm-version-macro-includes.patch
deleted file mode 100644
index aa57c832c..000000000
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-Fix-nm-version-macro-includes.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 7274bbadd398a69b8babf47431f80d35e0228c42 Mon Sep 17 00:00:00 2001
-From: Adrian Freihofer <adrian.freihofer@gmail.com>
-Date: Mon, 18 Jan 2016 08:53:26 +0100
-Subject: [PATCH] Fix nm-version-macro includes
-
-nm-version-macros.h cannot be found since include directive has
-been changed from " to <. This breaks for example gnome-panel
-build:
-/usr/include/NetworkManager/NetworkManager.h:31:31:
-fatal error: nm-version-macros.h: No such file or directory.
----
- libnm-core/nm-version.h     | 2 +-
- libnm-util/NetworkManager.h | 2 +-
- libnm-util/nm-version.h     | 2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/libnm-core/nm-version.h b/libnm-core/nm-version.h
-index 730330a..d751bc1 100644
---- a/libnm-core/nm-version.h
-+++ b/libnm-core/nm-version.h
-@@ -23,7 +23,7 @@
- 
- #include <glib.h>
- 
--#include <nm-version-macros.h>
-+#include "nm-version-macros.h"
- 
- /* Deprecation / Availability macros */
- 
-diff --git a/libnm-util/NetworkManager.h b/libnm-util/NetworkManager.h
-index d83e4ab..3a964fc 100644
---- a/libnm-util/NetworkManager.h
-+++ b/libnm-util/NetworkManager.h
-@@ -28,7 +28,7 @@
- 
- /* This header must not include glib or libnm. */
- 
--#include <nm-version-macros.h>
-+#include "nm-version-macros.h"
- 
- /*
-  * dbus services details
-diff --git a/libnm-util/nm-version.h b/libnm-util/nm-version.h
-index 63895dd..41101a4 100644
---- a/libnm-util/nm-version.h
-+++ b/libnm-util/nm-version.h
-@@ -23,7 +23,7 @@
- 
- #include <glib.h>
- 
--#include <nm-version-macros.h>
-+#include "nm-version-macros.h"
- 
- /* Deprecation / Availability macros */
- 
--- 
-2.5.0
-
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-socket-util.h-Include-linux-sockios.h-on-musl.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-socket-util.h-Include-linux-sockios.h-on-musl.patch
index 22bc6e8bd..cdcd397d7 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-socket-util.h-Include-linux-sockios.h-on-musl.patch
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-socket-util.h-Include-linux-sockios.h-on-musl.patch
@@ -1,7 +1,7 @@
-From 98d7e3ae5b15e30af1bf5dd1d279e1a774bf2b86 Mon Sep 17 00:00:00 2001
+From 7f0e0613abe8aa1861946e2cc25397690da7128b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 31 Mar 2017 16:05:05 -0700
-Subject: [PATCH 2/5] socket-util.h: Include linux/sockios.h on musl
+Subject: [PATCH 2/7] socket-util.h: Include linux/sockios.h on musl
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
@@ -9,11 +9,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/src/systemd/src/basic/socket-util.h b/src/systemd/src/basic/socket-util.h
-index 2536b08..76d6107 100644
+index d7e2d85..2e7f7b6 100644
 --- a/src/systemd/src/basic/socket-util.h
 +++ b/src/systemd/src/basic/socket-util.h
-@@ -29,6 +29,12 @@
- #include <linux/netlink.h>
+@@ -30,6 +30,12 @@
+ #include <linux/if_infiniband.h>
  #include <linux/if_packet.h>
  
 +#if !defined(__GLIBC__)
@@ -23,8 +23,8 @@ index 2536b08..76d6107 100644
 +#endif
 +
  #include "macro.h"
+ #include "missing.h"
  #include "util.h"
- 
 -- 
-2.12.1
+2.14.1
 
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-user-format-string-in-g_dbus_message_new_method_erro.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-user-format-string-in-g_dbus_message_new_method_erro.patch
deleted file mode 100644
index e32b5c00d..000000000
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-user-format-string-in-g_dbus_message_new_method_erro.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From adc0668b854289a11cfc29597b5566ba1869d17e Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 27 Jun 2017 07:32:09 -0700
-Subject: [PATCH 2/2] user format string in g_dbus_message_new_method_error ()
-
-This fixes format errors with -Werror=format-security
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/nm-manager.c | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/src/nm-manager.c b/src/nm-manager.c
-index c3d65cd..e814912 100644
---- a/src/nm-manager.c
-+++ b/src/nm-manager.c
-@@ -4871,6 +4871,7 @@ prop_set_auth_done_cb (NMAuthChain *chain,
- 	if (error || (result != NM_AUTH_CALL_RESULT_YES)) {
- 		reply = g_dbus_message_new_method_error (pfd->message,
- 		                                         NM_PERM_DENIED_ERROR,
-+		                                         "%s",
- 		                                         (error_message = "Not authorized to perform this operation"));
- 		if (error)
- 			error_message = error->message;
-@@ -4882,6 +4883,7 @@ prop_set_auth_done_cb (NMAuthChain *chain,
- 	if (!object) {
- 		reply = g_dbus_message_new_method_error (pfd->message,
- 		                                         "org.freedesktop.DBus.Error.UnknownObject",
-+		                                         "%s",
- 		                                         (error_message = "Object doesn't exist."));
- 		goto done;
- 	}
-@@ -4890,6 +4892,7 @@ prop_set_auth_done_cb (NMAuthChain *chain,
- 	if (!nm_exported_object_get_interface_by_type (object, pfd->interface_type)) {
- 		reply = g_dbus_message_new_method_error (pfd->message,
- 		                                         "org.freedesktop.DBus.Error.InvalidArgs",
-+		                                         "%s",
- 		                                         (error_message = "Object is of unexpected type."));
- 		goto done;
- 	}
-@@ -4905,6 +4908,7 @@ prop_set_auth_done_cb (NMAuthChain *chain,
- 		if (global_dns && !nm_global_dns_config_is_internal (global_dns)) {
- 			reply = g_dbus_message_new_method_error (pfd->message,
- 			                                         NM_PERM_DENIED_ERROR,
-+			                                         "%s",
- 			                                         (error_message = "Global DNS configuration already set via configuration file"));
- 			goto done;
- 		}
-@@ -4949,6 +4953,7 @@ do_set_property_check (gpointer user_data)
- 	if (!pfd->subject) {
- 		reply = g_dbus_message_new_method_error (pfd->message,
- 		                                         NM_PERM_DENIED_ERROR,
-+		                                         "%s",
- 		                                         (error_message = "Could not determine request UID."));
- 		goto out;
- 	}
-@@ -4958,6 +4963,7 @@ do_set_property_check (gpointer user_data)
- 	if (!chain) {
- 		reply = g_dbus_message_new_method_error (pfd->message,
- 		                                         NM_PERM_DENIED_ERROR,
-+		                                         "%s",
- 		                                         (error_message = "Could not authenticate request."));
- 		goto out;
- 	}
--- 
-2.13.2
-
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0003-Define-ETH_ALEN.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0003-Define-ETH_ALEN.patch
index 236914f75..549e46e0e 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0003-Define-ETH_ALEN.patch
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0003-Define-ETH_ALEN.patch
@@ -1,7 +1,7 @@
-From 16c3dc7a407101243d2056d2c93e61dce1a05350 Mon Sep 17 00:00:00 2001
+From d0951fe7da63d8296a305781d7322ce4d3249415 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 31 Mar 2017 16:08:45 -0700
-Subject: [PATCH 3/5] Define ETH_ALEN
+Subject: [PATCH 3/7] Define ETH_ALEN
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
@@ -10,7 +10,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 3 insertions(+)
 
 diff --git a/libnm-core/nm-utils.h b/libnm-core/nm-utils.h
-index 156ccae..68e222b 100644
+index 02e24ea..5ff279c 100644
 --- a/libnm-core/nm-utils.h
 +++ b/libnm-core/nm-utils.h
 @@ -29,6 +29,7 @@
@@ -22,7 +22,7 @@ index 156ccae..68e222b 100644
  #include <netinet/in.h>
  
 diff --git a/src/platform/wifi/wifi-utils.h b/src/platform/wifi/wifi-utils.h
-index 84f5ce9..33a838d 100644
+index 939080f..2274408 100644
 --- a/src/platform/wifi/wifi-utils.h
 +++ b/src/platform/wifi/wifi-utils.h
 @@ -24,6 +24,8 @@
@@ -35,5 +35,5 @@ index 84f5ce9..33a838d 100644
  
  typedef struct WifiData WifiData;
 -- 
-2.12.1
+2.14.1
 
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0004-Define-missing-features-to-cater-for-musl.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0004-Define-missing-features-to-cater-for-musl.patch
index 27c9ae962..b56f6a37d 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0004-Define-missing-features-to-cater-for-musl.patch
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0004-Define-missing-features-to-cater-for-musl.patch
@@ -1,22 +1,22 @@
-From 2153109e60e362e0d09215d529bf00176f31a3e7 Mon Sep 17 00:00:00 2001
+From c9e0f112a90b6b1ade87a698608dca8d6fbe89cc Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 31 Mar 2017 16:09:41 -0700
-Subject: [PATCH 4/5] Define missing features to cater for musl
+Subject: [PATCH 4/7] Define missing features to cater for musl
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  src/systemd/sd-adapt/nm-sd-adapt.h | 2 +-
- src/systemd/src/basic/parse-util.c | 5 ++++-
+ src/systemd/src/basic/parse-util.c | 4 ++++
  src/systemd/src/basic/stdio-util.h | 2 ++
  src/systemd/src/basic/util.h       | 5 +++++
  src/systemd/src/systemd/sd-event.h | 4 ----
- 5 files changed, 12 insertions(+), 6 deletions(-)
+ 5 files changed, 12 insertions(+), 5 deletions(-)
 
 diff --git a/src/systemd/sd-adapt/nm-sd-adapt.h b/src/systemd/sd-adapt/nm-sd-adapt.h
-index cf27c1a..72c1b89 100644
+index 0d291e2..d88dd9b 100644
 --- a/src/systemd/sd-adapt/nm-sd-adapt.h
 +++ b/src/systemd/sd-adapt/nm-sd-adapt.h
-@@ -119,7 +119,7 @@ G_STMT_START { \
+@@ -134,7 +134,7 @@ G_STMT_START { \
  #  ifdef HAVE___SECURE_GETENV
  #    define secure_getenv __secure_getenv
  #  else
@@ -26,22 +26,21 @@ index cf27c1a..72c1b89 100644
  #endif
  
 diff --git a/src/systemd/src/basic/parse-util.c b/src/systemd/src/basic/parse-util.c
-index 2738663..9c21e5a 100644
+index 6d978e9..e74e84b 100644
 --- a/src/systemd/src/basic/parse-util.c
 +++ b/src/systemd/src/basic/parse-util.c
-@@ -25,8 +25,11 @@
- #include <stdio.h>
- #include <stdlib.h>
- #include <string.h>
+@@ -21,7 +21,11 @@
+ 
+ #include <errno.h>
+ #include <inttypes.h>
 +#ifdef __GLIBC__
- #include <xlocale.h>
--
++#include <xlocale.h>
 +#else
-+#include <locale.h>
+ #include <locale.h>
 +#endif
- #include "alloc-util.h"
- #include "extract-word.h"
- #include "macro.h"
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
 diff --git a/src/systemd/src/basic/stdio-util.h b/src/systemd/src/basic/stdio-util.h
 index bd1144b..c92e935 100644
 --- a/src/systemd/src/basic/stdio-util.h
@@ -57,7 +56,7 @@ index bd1144b..c92e935 100644
  #include <stdio.h>
  #include <sys/types.h>
 diff --git a/src/systemd/src/basic/util.h b/src/systemd/src/basic/util.h
-index bb2fc31..fe074a5 100644
+index b31dfd1..9b7032c 100644
 --- a/src/systemd/src/basic/util.h
 +++ b/src/systemd/src/basic/util.h
 @@ -46,6 +46,11 @@
@@ -73,14 +72,14 @@ index bb2fc31..fe074a5 100644
  #define PAGE_ALIGN(l) ALIGN_TO((l), page_size())
  
 diff --git a/src/systemd/src/systemd/sd-event.h b/src/systemd/src/systemd/sd-event.h
-index cc26b7d..c7e0004 100644
+index f8cb895..c7e0004 100644
 --- a/src/systemd/src/systemd/sd-event.h
 +++ b/src/systemd/src/systemd/sd-event.h
 @@ -69,11 +69,7 @@ typedef int (*sd_event_handler_t)(sd_event_source *s, void *userdata);
  typedef int (*sd_event_io_handler_t)(sd_event_source *s, int fd, uint32_t revents, void *userdata);
  typedef int (*sd_event_time_handler_t)(sd_event_source *s, uint64_t usec, void *userdata);
  typedef int (*sd_event_signal_handler_t)(sd_event_source *s, const struct signalfd_siginfo *si, void *userdata);
--#if defined __USE_POSIX199309 || defined __USE_XOPEN_EXTENDED
+-#if defined _GNU_SOURCE || _POSIX_C_SOURCE >= 199309L
  typedef int (*sd_event_child_handler_t)(sd_event_source *s, const siginfo_t *si, void *userdata);
 -#else
 -typedef void* sd_event_child_handler_t;
@@ -89,5 +88,5 @@ index cc26b7d..c7e0004 100644
  int sd_event_default(sd_event **e);
  
 -- 
-2.12.1
+2.14.1
 
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0005-sd-lldp.h-Remove-net-ethernet.h-seems-to-be-over-spe.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0005-sd-lldp.h-Remove-net-ethernet.h-seems-to-be-over-spe.patch
index f4a04c782..719442319 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0005-sd-lldp.h-Remove-net-ethernet.h-seems-to-be-over-spe.patch
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0005-sd-lldp.h-Remove-net-ethernet.h-seems-to-be-over-spe.patch
@@ -1,18 +1,31 @@
-From 9e9e5814456ec23b9fc669d342bf9d8f7ee49fc2 Mon Sep 17 00:00:00 2001
+From 18f71c1b48730b8602826517f2b5b088283ae948 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 31 Mar 2017 16:48:00 -0700
-Subject: [PATCH 5/5] sd-lldp.h: Remove net/ethernet.h seems to be over
+Subject: [PATCH 5/7] sd-lldp.h: Remove net/ethernet.h seems to be over
  specified
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- src/systemd/src/systemd/sd-lldp.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ src/systemd/src/libsystemd-network/sd-lldp.c | 1 +
+ src/systemd/src/systemd/sd-lldp.h            | 2 +-
+ 2 files changed, 2 insertions(+), 1 deletion(-)
 
-Index: NetworkManager-1.4.2/src/systemd/src/systemd/sd-lldp.h
-===================================================================
---- NetworkManager-1.4.2.orig/src/systemd/src/systemd/sd-lldp.h
-+++ NetworkManager-1.4.2/src/systemd/src/systemd/sd-lldp.h
+diff --git a/src/systemd/src/libsystemd-network/sd-lldp.c b/src/systemd/src/libsystemd-network/sd-lldp.c
+index 31e2448..7721cc2 100644
+--- a/src/systemd/src/libsystemd-network/sd-lldp.c
++++ b/src/systemd/src/libsystemd-network/sd-lldp.c
+@@ -21,6 +21,7 @@
+ #include "nm-sd-adapt.h"
+ 
+ #include <arpa/inet.h>
++#include <net/ethernet.h>
+ #include <linux/sockios.h>
+ 
+ #include "sd-lldp.h"
+diff --git a/src/systemd/src/systemd/sd-lldp.h b/src/systemd/src/systemd/sd-lldp.h
+index 3f35eeb..61b0e45 100644
+--- a/src/systemd/src/systemd/sd-lldp.h
++++ b/src/systemd/src/systemd/sd-lldp.h
 @@ -22,7 +22,7 @@
  ***/
  
@@ -22,15 +35,6 @@ Index: NetworkManager-1.4.2/src/systemd/src/systemd/sd-lldp.h
  #include <sys/types.h>
  
  #include "sd-event.h"
-Index: NetworkManager-1.4.2/src/systemd/src/libsystemd-network/sd-lldp.c
-===================================================================
---- NetworkManager-1.4.2.orig/src/systemd/src/libsystemd-network/sd-lldp.c
-+++ NetworkManager-1.4.2/src/systemd/src/libsystemd-network/sd-lldp.c
-@@ -21,6 +21,7 @@
- #include "nm-sd-adapt.h"
- 
- #include <arpa/inet.h>
-+#include <net/ethernet.h>
- 
- #include "sd-lldp.h"
- 
+-- 
+2.14.1
+
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-check-for-strndupa-before-using-it.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0006-check-for-strndupa-before-using-it.patch
similarity index 77%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-check-for-strndupa-before-using-it.patch
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager/0006-check-for-strndupa-before-using-it.patch
index 26f380bf9..6adb84baa 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-check-for-strndupa-before-using-it.patch
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0006-check-for-strndupa-before-using-it.patch
@@ -1,7 +1,7 @@
-From 05e8bd664d0244cb8ab4376b962830b97860f6bf Mon Sep 17 00:00:00 2001
+From f24d958fc85f9a43ac13abc85f74c4ae233dc8a4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 31 Mar 2017 18:37:19 -0700
-Subject: [PATCH] check for strndupa before using it
+Subject: [PATCH 6/7] check for strndupa before using it
 
 musl does not have strndupa
 
@@ -13,10 +13,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  3 files changed, 17 insertions(+)
 
 diff --git a/config.h.in b/config.h.in
-index db8c135..c4229ed 100644
+index edec211..0799030 100644
 --- a/config.h.in
 +++ b/config.h.in
-@@ -41,6 +41,10 @@
+@@ -34,6 +34,10 @@
     */
  #undef HAVE_DCGETTEXT
  
@@ -24,14 +24,14 @@ index db8c135..c4229ed 100644
 +   don't. */
 +#undef HAVE_DECL_STRNDUPA
 +
- /* Define to 1 if you have the <dlfcn.h> header file. */
- #undef HAVE_DLFCN_H
- 
+ /* Define to 1 if you have the declaration of `explicit_bzero', and to 0 if
+    you don't. */
+ #undef HAVE_DECL_EXPLICIT_BZERO
 diff --git a/configure.ac b/configure.ac
-index 2630f8d..d0a57fd 100644
+index 8a066ad..51e5eb6 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -54,6 +54,7 @@ AC_SUBST(NM_VERSION)
+@@ -56,6 +56,7 @@ AC_SUBST(NM_VERSION)
  
  GIT_SHA_RECORD(NM_GIT_SHA)
  
@@ -40,7 +40,7 @@ index 2630f8d..d0a57fd 100644
  dnl Checks for typedefs, structures, and compiler characteristics.
  dnl
 diff --git a/src/systemd/src/basic/alloc-util.h b/src/systemd/src/basic/alloc-util.h
-index ceeee51..924b59c 100644
+index 0a89691..1e95260 100644
 --- a/src/systemd/src/basic/alloc-util.h
 +++ b/src/systemd/src/basic/alloc-util.h
 @@ -25,6 +25,18 @@
@@ -63,5 +63,5 @@ index ceeee51..924b59c 100644
  #define new(t, n) ((t*) malloc_multiply(sizeof(t), (n)))
  
 -- 
-2.12.1
+2.14.1
 
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0007-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0007-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch
new file mode 100644
index 000000000..28848d354
--- /dev/null
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0007-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch
@@ -0,0 +1,25 @@
+From 583f0448fb7e9aba2b410c06eec6f420b41a6a0c Mon Sep 17 00:00:00 2001
+From: Pablo Saavedra <psaavedra@igalia.com>
+Date: Tue, 13 Mar 2018 17:36:20 +0100
+Subject: [PATCH 7/7] Fixed configure.ac: Fix pkgconfig sysroot locations
+
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 51e5eb6..c9d3e56 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -669,7 +669,7 @@ else
+ 	AC_DEFINE(WITH_JANSSON, 1, [Define if JANSSON is enabled])
+ 
+ 	AC_CHECK_TOOLS(READELF, [eu-readelf readelf])
+-	JANSSON_LIBDIR=`$PKG_CONFIG --variable=libdir jansson`
++	JANSSON_LIBDIR=${PKG_CONFIG_SYSROOT_DIR}`$PKG_CONFIG --variable=libdir jansson`
+ 	JANSSON_SONAME=`$READELF -d $JANSSON_LIBDIR/libjansson.so |sed -n 's/.*SONAME.*\[[\([^]]*\)]]/\1/p'`
+ 
+ 	if test "$JANSSON_SONAME" = ""; then
+-- 
+2.14.1
+
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.4.4.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.10.6.bb
similarity index 81%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager_1.4.4.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager_1.10.6.bb
index d5f456f37..6538e7b82 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.4.4.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.10.6.bb
@@ -5,7 +5,7 @@ SECTION = "net/misc"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cbbffd568227ada506640fe950a4823b \
                     file://libnm-util/COPYING;md5=1c4fa765d6eb3cd2fbd84344a1b816cd \
-                    file://docs/api/html/license.html;md5=8eb8e72bab097b9d11763002cb003697 \
+                    file://docs/api/html/license.html;md5=77b9e362690c149da196aefe7712db30 \
 "
 
 DEPENDS = " \
@@ -20,6 +20,7 @@ DEPENDS = " \
     libnewt \
     polkit \
     jansson \
+    curl \
 "
 
 inherit gnomebase gettext systemd bluetooth bash-completion vala gobject-introspection
@@ -27,21 +28,15 @@ inherit gnomebase gettext systemd bluetooth bash-completion vala gobject-introsp
 GI_DATA_ENABLED_libc-musl = "False"
 
 SRC_URI = "${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkManager-${PV}.tar.xz \
-           file://0001-don-t-try-to-run-sbin-dhclient-to-get-the-version-nu.patch \
-           file://0002-Fix-nm-version-macro-includes.patch \
            file://0001-adjust-net-headers-for-musl-compatibility.patch \
            file://0002-socket-util.h-Include-linux-sockios.h-on-musl.patch \
            file://0003-Define-ETH_ALEN.patch \
-           file://0004-Define-missing-features-to-cater-for-musl.patch \
            file://0005-sd-lldp.h-Remove-net-ethernet.h-seems-to-be-over-spe.patch \
-           file://0001-check-for-strndupa-before-using-it.patch \
-           file://0001-dns-resolved-add-systemd-resolved-backend.patch \
-           file://0001-dns-resolved-also-check-for-etc-resolv-conf.systemd.patch \
-           file://0001-systemd-xlocale.h-is-dropped-by-newer-glibc.patch \
-           file://0002-user-format-string-in-g_dbus_message_new_method_erro.patch \
+           file://0006-check-for-strndupa-before-using-it.patch \
+           file://0007-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch \
            "
-SRC_URI[md5sum] = "63f1e0d6d7e9099499d062c84c927a75"
-SRC_URI[sha256sum] = "829378f318cc008d138a23ca6a9191928ce75344e7e47a2f2c35f4ac82133309"
+SRC_URI[md5sum] = "de3c7147a693da6f80eb22f126086a14"
+SRC_URI[sha256sum] = "6af0b1e856a3725f88791f55c4fbb04105dc0b20dbf182aaec8aad16481fac76"
 
 S = "${WORKDIR}/NetworkManager-${PV}"
 
@@ -49,6 +44,7 @@ EXTRA_OECONF = " \
     --disable-ifcfg-rh \
     --disable-ifnet \
     --disable-ifcfg-suse \
+    --disable-introspection \
     --disable-more-warnings \
     --with-iptables=${sbindir}/iptables \
     --with-tests \
@@ -73,7 +69,6 @@ PACKAGECONFIG[systemd] = " \
 PACKAGECONFIG[bluez5] = "--enable-bluez5-dun,--disable-bluez5-dun,bluez5"
 # consolekit is not picked by shlibs, so add it to RDEPENDS too
 PACKAGECONFIG[consolekit] = "--with-session-tracking=consolekit,,consolekit,consolekit"
-PACKAGECONFIG[concheck] = "--with-libsoup=yes,--with-libsoup=no,libsoup-2.4"
 PACKAGECONFIG[modemmanager] = "--with-modem-manager-1=yes,--with-modem-manager-1=no,modemmanager"
 PACKAGECONFIG[ppp] = "--enable-ppp,--disable-ppp,ppp,ppp"
 # Use full featured dhcp client instead of internal one
@@ -101,6 +96,8 @@ FILES_${PN} += " \
     ${libexecdir} \
     ${libdir}/pppd/*/nm-pppd-plugin.so \
     ${libdir}/NetworkManager/*.so \
+    ${libdir}/NetworkManager/VPN \
+    ${libdir}/NetworkManager/conf.d \
     ${datadir}/polkit-1 \
     ${datadir}/dbus-1 \
     ${base_libdir}/udev/* \
-- 
2.11.0



Return-Path: <rsalveti@rsalveti.net>
Received: from mail-ua0-f174.google.com (mail-ua0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id 808E37836A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jun 2017 14:16:01 +0000 (UTC)
Received: by mail-ua0-f174.google.com with SMTP id q15so9063900uaa.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jun 2017 07:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rsalveti-net.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=izvcAEnrbndQipRC+E3aDERtVDSdBb8/lr6l6gzzXgw=;
	b=SVaGa/au66qsDzLnUXUJd/BJj3Y9bh0VteXoumUbiVD6quR3SwmQQz8e9iw93Xqrcb
	qJ8ckLYKPjcx2ca0kluq8ZMcurnYsEL8+ucHtUuj4WIyHCd5XMIX9EJzeY3Hd5k7dJmE
	5i34KI9DjyPYHdU13g5RgVV7EtuN1S6aJnesxdvRROb3OsArjmE4nRjXCPIrVHCnHqL0
	wSUrbKYBNE/mJT5Q0jVY5l4Hcco4XnZ59yYKWINMcejgJ+5+apeQ1fxFHM53ONjGL9sv
	lNMkBx3383jKwgmQzCHdNEUhT57jREJ3EwQgYtWnyIErN7asMkv2NBgQW4CLaaAcpi2W
	KneQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=izvcAEnrbndQipRC+E3aDERtVDSdBb8/lr6l6gzzXgw=;
	b=sWO4D66UypUJ+be2UGf47B9VddB90qQ/+KVjMwN2avn9zsW8xGkCef4y928zenIN8u
	2M1SrF7yH89ZCjbshgLNJ32Na7j3Imj1e0YR20r1VsD8ug8ZyqFmBxDGEnCXIh/wBRBn
	zQT8nm1z0SAFZVVD2kU1fscq9sdTx8ty8T/fXjwz/O6RkPOIyJBE/07X0ZftiJJqn+G3
	nClsTwqBP3Li4i5usVCU6fT4DarUJtWNMDctiJThsucjapyhJd6tLEeiM9selmDxVQaB
	ymdnecAy13FwxOW7vnOOUGEjvSY4lf0oI9IIiaI9N830BNy0TiBqYvpKtLScwUW+isA8
	atBg==
X-Gm-Message-State: AKS2vOyAiCYbN2GgKI8JAu9gec7gqX5yGlWjFFNFTU0tDg7nDG2uYu5d
	NHZal5YepcfNeGcphSY=
X-Received: by 10.176.76.106 with SMTP id d42mr3090072uag.4.1497536161636;
	Thu, 15 Jun 2017 07:16:01 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:badb:90a5:f21e:34ff:fe00:20a5])
	by smtp.gmail.com with ESMTPSA id w138sm13638vkw.28.2017.06.15.07.15.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 15 Jun 2017 07:16:00 -0700 (PDT)
From: Ricardo Salveti <rsalveti@rsalveti.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Jun 2017 11:15:53 -0300
Message-Id: <1497536153-5388-1-git-send-email-rsalveti@rsalveti.net>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] networkmanager: add support for systemd-resolved
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
X-List-Received-Date: Thu, 15 Jun 2017 14:16:01 -0000

Now that resolved is enabled in systemd, backport upstream patch that
adds support for the systemd-resolved backend and add one additional
check for the OE-specific resolv.conf link path.

Signed-off-by: Ricardo Salveti <rsalveti@rsalveti.net>
---
 ...dns-resolved-add-systemd-resolved-backend.patch | 621 +++++++++++++++++++++
 ...ed-also-check-for-etc-resolv-conf.systemd.patch |  29 +
 .../networkmanager/networkmanager_1.4.4.bb         |   2 +
 3 files changed, 652 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/0001-dns-resolved-add-systemd-resolved-backend.patch
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/0001-dns-resolved-also-check-for-etc-resolv-conf.systemd.patch

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager/0001-dns-resolved-add-systemd-resolved-backend.patch b/meta-oe/recipes-connectivity/networkmanager/networkmanager/0001-dns-resolved-add-systemd-resolved-backend.patch
new file mode 100644
index 0000000..bd194a6
--- /dev/null
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager/0001-dns-resolved-add-systemd-resolved-backend.patch
@@ -0,0 +1,621 @@
+From: Sjoerd Simons <sjoerd@luon.net>
+Date: Sun, 21 Aug 2016 21:46:02 +0200
+Subject: [PATCH] dns/resolved: add systemd-resolved backend
+
+Add initial DNS backend that pushes DNS information into
+systemd-resolved. Backend is choosen by default if the systems
+resolv.conv is setup to pointing to one of the standard resolved
+locations.
+
+This doesn't handle global dns configuration.
+
+Signed-off-by: Sjoerd Simons <sjoerd@luon.net>
+
+https://bugzilla.gnome.org/show_bug.cgi?id=762540
+
+Upstream-Status: Backport
+
+---
+ man/NetworkManager.conf.xml               |  10 +-
+ src/Makefile.am                           |   2 +
+ src/dns-manager/nm-dns-manager.c          |  43 ++-
+ src/dns-manager/nm-dns-systemd-resolved.c | 427 ++++++++++++++++++++++++++++++
+ src/dns-manager/nm-dns-systemd-resolved.h |  45 ++++
+ 5 files changed, 523 insertions(+), 4 deletions(-)
+ create mode 100644 src/dns-manager/nm-dns-systemd-resolved.c
+ create mode 100644 src/dns-manager/nm-dns-systemd-resolved.h
+
+diff --git a/man/NetworkManager.conf.xml b/man/NetworkManager.conf.xml
+index 6295b82..0a67ae5 100644
+--- a/man/NetworkManager.conf.xml
++++ b/man/NetworkManager.conf.xml
+@@ -275,10 +275,12 @@ no-auto-default=*
+       <varlistentry>
+         <term><varname>dns</varname></term>
+         <listitem><para>Set the DNS (<filename>resolv.conf</filename>) processing mode.</para>
+-        <para><literal>default</literal>: The default if the key is
+-        not specified. NetworkManager will update
++        <para><literal>default</literal>: NetworkManager will update
+         <filename>resolv.conf</filename> to reflect the nameservers
+-        provided by currently active connections.</para>
++        provided by currently active connections.  This is the default
++        if the key is not specified, unless the system is configured
++        to use systemd-resolved; in this case the default is
++        <literal>systemd-resolved</literal></para>
+         <para><literal>dnsmasq</literal>: NetworkManager will run
+         dnsmasq as a local caching nameserver, using a "split DNS"
+         configuration if you are connected to a VPN, and then update
+@@ -288,6 +290,8 @@ no-auto-default=*
+         to unbound and dnssec-triggerd, providing a "split DNS"
+         configuration with DNSSEC support. The <filename>/etc/resolv.conf</filename>
+         will be managed by dnssec-trigger daemon.</para>
++        <para><literal>systemd-resolved</literal>: NetworkManager will
++        push the DNS configuration to systemd-resolved</para>
+         <para><literal>none</literal>: NetworkManager will not
+         modify resolv.conf. This implies
+         <literal>rc-manager</literal>&nbsp;<literal>unmanaged</literal></para>
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 8d29b19..10f63de 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -345,6 +345,8 @@ libNetworkManager_la_SOURCES = \
+ 	\
+ 	dns-manager/nm-dns-dnsmasq.c \
+ 	dns-manager/nm-dns-dnsmasq.h \
++	dns-manager/nm-dns-systemd-resolved.c \
++	dns-manager/nm-dns-systemd-resolved.h \
+ 	dns-manager/nm-dns-unbound.c \
+ 	dns-manager/nm-dns-unbound.h \
+ 	dns-manager/nm-dns-manager.c \
+diff --git a/src/dns-manager/nm-dns-manager.c b/src/dns-manager/nm-dns-manager.c
+index 5a758a9..38bc786 100644
+--- a/src/dns-manager/nm-dns-manager.c
++++ b/src/dns-manager/nm-dns-manager.c
+@@ -45,6 +45,7 @@
+ 
+ #include "nm-dns-plugin.h"
+ #include "nm-dns-dnsmasq.h"
++#include "nm-dns-systemd-resolved.h"
+ #include "nm-dns-unbound.h"
+ 
+ #if WITH_LIBSOUP
+@@ -1588,6 +1589,37 @@ _check_resconf_immutable (NMDnsManagerResolvConfManager rc_manager)
+ 
+ NM_DEFINE_SINGLETON_GETTER (NMDnsManager, nm_dns_manager_get, NM_TYPE_DNS_MANAGER);
+ 
++static gboolean
++_resolvconf_resolved_managed (void)
++{
++	static const char *const resolved_paths[] = {
++		"/run/systemd/resolve/resolv.conf",
++		"/lib/systemd/resolv.conf",
++		"/usr/lib/systemd/resolv.conf",
++	};
++	GFile *f;
++	GFileInfo *info;
++	gboolean ret = FALSE;
++
++	f = g_file_new_for_path (_PATH_RESCONF);
++	info = g_file_query_info (f,
++	                          G_FILE_ATTRIBUTE_STANDARD_IS_SYMLINK","\
++	                          G_FILE_ATTRIBUTE_STANDARD_SYMLINK_TARGET,
++	                          G_FILE_QUERY_INFO_NOFOLLOW_SYMLINKS,
++	                          NULL, NULL);
++
++	if (info && g_file_info_get_is_symlink (info)) {
++		ret = _nm_utils_strv_find_first ((gchar **) resolved_paths,
++		                                 G_N_ELEMENTS (resolved_paths),
++		                                 g_file_info_get_symlink_target (info)) >= 0;
++	}
++
++	g_clear_object(&info);
++	g_clear_object(&f);
++
++	return ret;
++}
++
+ static void
+ init_resolv_conf_mode (NMDnsManager *self, gboolean force_reload_plugin)
+ {
+@@ -1633,7 +1665,16 @@ again:
+ 
+ 	rc_manager = _check_resconf_immutable (rc_manager);
+ 
+-	if (nm_streq0 (mode, "dnsmasq")) {
++	if (   (!mode && _resolvconf_resolved_managed ())
++	    || nm_streq0 (mode, "systemd-resolved")) {
++		if (   force_reload_plugin
++		    || !NM_IS_DNS_SYSTEMD_RESOLVED (priv->plugin)) {
++			_clear_plugin (self);
++			priv->plugin = nm_dns_systemd_resolved_new ();
++			plugin_changed = TRUE;
++		}
++		mode = "systemd-resolved";
++	} else if (nm_streq0 (mode, "dnsmasq")) {
+ 		if (force_reload_plugin || !NM_IS_DNS_DNSMASQ (priv->plugin)) {
+ 			_clear_plugin (self);
+ 			priv->plugin = nm_dns_dnsmasq_new ();
+diff --git a/src/dns-manager/nm-dns-systemd-resolved.c b/src/dns-manager/nm-dns-systemd-resolved.c
+new file mode 100644
+index 0000000..6bdd5f6
+--- /dev/null
++++ b/src/dns-manager/nm-dns-systemd-resolved.c
+@@ -0,0 +1,427 @@
++/* -*- Mode: C; tab-width: 4; indent-tabs-mode: t; c-basic-offset: 4 -*- */
++/*
++ * Copyright (C) 2010 Dan Williams <dcbw@redhat.com>
++ * Copyright (C) 2016 Sjoerd Simons <sjoerd@luon.net>
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License as published by
++ * the Free Software Foundation; either version 2, or (at your option)
++ * any later version.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License along
++ * with this program; if not, write to the Free Software Foundation, Inc.,
++ * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
++ *
++ */
++
++#include "nm-default.h"
++
++#include "nm-dns-systemd-resolved.h"
++
++#include <stdlib.h>
++#include <unistd.h>
++#include <sys/types.h>
++#include <sys/wait.h>
++#include <arpa/inet.h>
++#include <sys/stat.h>
++#include <linux/if.h>
++
++#include "nm-core-internal.h"
++#include "nm-platform.h"
++#include "nm-utils.h"
++#include "nm-ip4-config.h"
++#include "nm-ip6-config.h"
++#include "nm-bus-manager.h"
++#include "nm-manager.h"
++#include "nm-device.h"
++#include "NetworkManagerUtils.h"
++
++G_DEFINE_TYPE (NMDnsSystemdResolved, nm_dns_systemd_resolved, NM_TYPE_DNS_PLUGIN)
++
++#define NM_DNS_SYSTEMD_RESOLVED_GET_PRIVATE(o) \
++  (G_TYPE_INSTANCE_GET_PRIVATE ((o), NM_TYPE_DNS_SYSTEMD_RESOLVED, \
++    NMDnsSystemdResolvedPrivate))
++
++#define SYSTEMD_RESOLVED_DBUS_SERVICE "org.freedesktop.resolve1"
++#define SYSTEMD_RESOLVED_DBUS_PATH "/org/freedesktop/resolve1"
++
++typedef struct {
++	int ifindex;
++	GList *configs;
++} InterfaceConfig;
++
++typedef struct {
++	GDBusProxy *resolve;
++	GCancellable *init_cancellable;
++	GCancellable *update_cancellable;
++	GQueue dns_updates;
++	GQueue domain_updates;
++} NMDnsSystemdResolvedPrivate;
++
++/*****************************************************************************/
++
++#define _NMLOG_DOMAIN         LOGD_DNS
++#define _NMLOG_PREFIX_NAME    "systemd-resolved"
++#define _NMLOG(level, ...) \
++    G_STMT_START { \
++        nm_log ((level), _NMLOG_DOMAIN, \
++                "%s[%p]: " _NM_UTILS_MACRO_FIRST(__VA_ARGS__), \
++                _NMLOG_PREFIX_NAME, \
++                (self) \
++                _NM_UTILS_MACRO_REST(__VA_ARGS__)); \
++    } G_STMT_END
++
++/*****************************************************************************/
++
++static void
++call_done (GObject *source, GAsyncResult *r, gpointer user_data)
++{
++	GVariant *v;
++	GError *error = NULL;
++	NMDnsSystemdResolved *self = (NMDnsSystemdResolved *) user_data;
++
++	v = g_dbus_proxy_call_finish (G_DBUS_PROXY (source), r, &error);
++
++	if (g_error_matches (error, G_IO_ERROR, G_IO_ERROR_CANCELLED))
++		return;
++
++	if (error != NULL) {
++		_LOGW ("Failed: %s\n", error->message);
++		g_error_free (error);
++	}
++}
++
++static void
++add_interface_configuration (NMDnsSystemdResolved *self,
++                             GArray *interfaces,
++                             const NMDnsIPConfigData *data)
++{
++	int i;
++	InterfaceConfig *ic = NULL;
++	int ifindex;
++	NMDevice *device;
++
++	if (NM_IS_IP4_CONFIG (data->config))
++		ifindex = nm_ip4_config_get_ifindex (data->config);
++	else if (NM_IS_IP6_CONFIG  (data->config))
++		ifindex = nm_ip6_config_get_ifindex (data->config);
++	else
++		g_return_if_reached ();
++
++	device = nm_manager_get_device_by_ifindex (nm_manager_get (), ifindex);
++
++	if (!nm_device_get_managed (device, FALSE))
++		return;
++
++	for (i = 0; i < interfaces->len; i++) {
++		InterfaceConfig *tic = &g_array_index (interfaces, InterfaceConfig, i);
++		if (ifindex == tic->ifindex) {
++			ic = tic;
++			break;
++		}
++	}
++
++	if (!ic) {
++		g_array_set_size (interfaces, interfaces->len + 1);
++		ic = &g_array_index (interfaces, InterfaceConfig,
++		                     interfaces->len - 1);
++		ic->ifindex = ifindex;
++	}
++
++	ic->configs = g_list_append (ic->configs, data->config);
++}
++
++static void
++add_domain (GVariantBuilder *domains,
++            const char *domain,
++            gboolean never_default)
++{
++	/* If this link is never the default (e.g. only used for resources on this
++	 * network) add a routing domain. */
++	g_variant_builder_add (domains, "(sb)", domain, never_default);
++}
++
++static void
++update_add_ip6_config (NMDnsSystemdResolved *self,
++                       GVariantBuilder *dns,
++                       GVariantBuilder *domains,
++                       const NMIP6Config *config)
++{
++	guint i, n;
++
++	n = nm_ip6_config_get_num_nameservers (config);
++	for (i = 0 ; i < n; i++) {
++		const struct in6_addr *ip;
++
++		g_variant_builder_open (dns, G_VARIANT_TYPE ("(iay)"));
++		g_variant_builder_add (dns, "i", AF_INET6);
++		ip = nm_ip6_config_get_nameserver (config, i),
++
++		g_variant_builder_add_value (dns, g_variant_new_fixed_array (G_VARIANT_TYPE_BYTE, ip, 16, 1));
++		g_variant_builder_close (dns);
++	}
++
++	n = nm_ip6_config_get_num_searches (config);
++	if (n > 0) {
++		for (i = 0; i < n; i++) {
++			add_domain (domains, nm_ip6_config_get_search (config, i),
++			            nm_ip6_config_get_never_default (config));
++		}
++	} else {
++		n = nm_ip6_config_get_num_domains (config);
++		for (i = 0; i < n; i++) {
++			add_domain (domains, nm_ip6_config_get_domain (config, i),
++			            nm_ip6_config_get_never_default (config));
++		}
++	}
++}
++
++static void
++update_add_ip4_config (NMDnsSystemdResolved *self,
++                       GVariantBuilder *dns,
++                       GVariantBuilder *domains,
++                       const NMIP4Config *config)
++{
++	guint i, n;
++
++	n = nm_ip4_config_get_num_nameservers (config);
++	for (i = 0 ; i < n; i++) {
++		guint32 ns;
++
++		g_variant_builder_open (dns, G_VARIANT_TYPE ("(iay)"));
++		g_variant_builder_add (dns, "i", AF_INET);
++		ns = nm_ip4_config_get_nameserver (config, i),
++
++		g_variant_builder_add_value (dns, g_variant_new_fixed_array (G_VARIANT_TYPE_BYTE, &ns, 4, 1));
++		g_variant_builder_close (dns);
++	}
++
++	n = nm_ip4_config_get_num_searches (config);
++	if (n  > 0) {
++		for (i = 0; i < n; i++) {
++			add_domain (domains, nm_ip4_config_get_search (config, i),
++			            nm_ip4_config_get_never_default (config));
++		}
++	} else {
++		n = nm_ip4_config_get_num_domains (config);
++		for (i = 0; i < n; i++) {
++			add_domain (domains, nm_ip4_config_get_domain (config, i),
++			            nm_ip4_config_get_never_default (config));
++		}
++	}
++}
++
++static void
++free_pending_updates (NMDnsSystemdResolved *self)
++{
++	NMDnsSystemdResolvedPrivate *priv = NM_DNS_SYSTEMD_RESOLVED_GET_PRIVATE (self);
++	GVariant *v;
++
++	while ((v = g_queue_pop_head (&priv->dns_updates)) != NULL)
++		g_variant_unref (v);
++
++	while ((v = g_queue_pop_head (&priv->domain_updates)) != NULL)
++		g_variant_unref (v);
++}
++
++static void
++prepare_one_interface (NMDnsSystemdResolved *self, InterfaceConfig *ic)
++{
++	NMDnsSystemdResolvedPrivate *priv = NM_DNS_SYSTEMD_RESOLVED_GET_PRIVATE (self);
++	GVariantBuilder dns, domains;
++	GList *l;
++
++	g_variant_builder_init (&dns, G_VARIANT_TYPE ("(ia(iay))"));
++	g_variant_builder_add (&dns, "i", ic->ifindex);
++	g_variant_builder_open (&dns, G_VARIANT_TYPE ("a(iay)"));
++
++	g_variant_builder_init (&domains, G_VARIANT_TYPE ("(ia(sb))"));
++	g_variant_builder_add (&domains, "i", ic->ifindex);
++	g_variant_builder_open (&domains, G_VARIANT_TYPE ("a(sb)"));
++
++	for (l = ic->configs ; l != NULL ; l = g_list_next (l)) {
++		if (NM_IS_IP4_CONFIG (l->data))
++			update_add_ip4_config (self, &dns, &domains, l->data);
++		else if (NM_IS_IP6_CONFIG (l->data))
++			update_add_ip6_config (self, &dns, &domains, l->data);
++		else
++			g_assert_not_reached ();
++	}
++	g_variant_builder_close (&dns);
++	g_variant_builder_close (&domains);
++
++	g_queue_push_tail (&priv->dns_updates,
++	                   g_variant_ref_sink (g_variant_builder_end (&dns)));
++	g_queue_push_tail (&priv->domain_updates,
++	                   g_variant_ref_sink (g_variant_builder_end (&domains)));
++}
++
++static void
++send_updates (NMDnsSystemdResolved *self)
++{
++	NMDnsSystemdResolvedPrivate *priv = NM_DNS_SYSTEMD_RESOLVED_GET_PRIVATE (self);
++	GVariant *v;
++
++	nm_clear_g_cancellable (&priv->update_cancellable);
++
++	if (!priv->resolve)
++		return;
++
++	priv->update_cancellable = g_cancellable_new ();
++
++	while ((v = g_queue_pop_head (&priv->dns_updates)) != NULL) {
++		g_dbus_proxy_call (priv->resolve, "SetLinkDNS", v,
++		                   G_DBUS_CALL_FLAGS_NONE,
++		                   -1, priv->update_cancellable, call_done, self);
++		g_variant_unref (v);
++	}
++
++	while ((v = g_queue_pop_head (&priv->domain_updates)) != NULL) {
++		g_dbus_proxy_call (priv->resolve, "SetLinkDomains", v,
++		                   G_DBUS_CALL_FLAGS_NONE,
++		                   -1, priv->update_cancellable, call_done, self);
++		g_variant_unref (v);
++	}
++}
++
++static gboolean
++update (NMDnsPlugin *plugin,
++        const NMDnsIPConfigData **configs,
++        const NMGlobalDnsConfig *global_config,
++        const char *hostname)
++{
++	NMDnsSystemdResolved *self = NM_DNS_SYSTEMD_RESOLVED (plugin);
++	GArray *interfaces = g_array_new (TRUE, TRUE, sizeof (InterfaceConfig));
++	const NMDnsIPConfigData **c;
++	int i;
++
++	for (c = configs; *c != NULL; c++)
++		add_interface_configuration (self, interfaces, *c);
++
++	free_pending_updates (self);
++
++	for (i = 0; i < interfaces->len; i++) {
++		InterfaceConfig *ic = &g_array_index (interfaces, InterfaceConfig, i);
++
++		prepare_one_interface (self, ic);
++		g_list_free (ic->configs);
++	}
++
++	g_array_free (interfaces, TRUE);
++
++	send_updates (self);
++
++	return TRUE;
++}
++
++/****************************************************************/
++
++static gboolean
++is_caching (NMDnsPlugin *plugin)
++{
++	return TRUE;
++}
++
++static const char *
++get_name (NMDnsPlugin *plugin)
++{
++	return "systemd-resolved";
++}
++
++/****************************************************************/
++
++NMDnsPlugin *
++nm_dns_systemd_resolved_new (void)
++{
++	return g_object_new (NM_TYPE_DNS_SYSTEMD_RESOLVED, NULL);
++}
++
++static void
++resolved_proxy_created (GObject *source, GAsyncResult *r, gpointer user_data)
++{
++	NMDnsSystemdResolved *self = (NMDnsSystemdResolved *) user_data;
++	NMDnsSystemdResolvedPrivate *priv;
++	gs_free_error GError *error = NULL;
++	GDBusProxy *resolve;
++
++	resolve = g_dbus_proxy_new_finish (r, &error);
++	if (   !resolve
++	    && g_error_matches (error, G_IO_ERROR, G_IO_ERROR_CANCELLED))
++		return;
++
++	priv = NM_DNS_SYSTEMD_RESOLVED_GET_PRIVATE (self);
++	g_clear_object (&priv->init_cancellable);
++	if (!resolve) {
++		_LOGW ("failed to connect to resolved via DBus: %s", error->message);
++		g_signal_emit_by_name (self, NM_DNS_PLUGIN_FAILED);
++		return;
++	}
++
++	priv->resolve = resolve;
++	send_updates (self);
++}
++
++
++static void
++nm_dns_systemd_resolved_init (NMDnsSystemdResolved *self)
++{
++	NMDnsSystemdResolvedPrivate *priv = NM_DNS_SYSTEMD_RESOLVED_GET_PRIVATE (self);
++	NMBusManager *dbus_mgr;
++	GDBusConnection *connection;
++
++	g_queue_init (&priv->dns_updates);
++	g_queue_init (&priv->domain_updates);
++
++	dbus_mgr = nm_bus_manager_get ();
++	g_return_if_fail (dbus_mgr);
++
++	connection = nm_bus_manager_get_connection (dbus_mgr);
++	g_return_if_fail (connection);
++
++	priv->init_cancellable = g_cancellable_new ();
++	g_dbus_proxy_new (connection,
++	                  G_DBUS_PROXY_FLAGS_DO_NOT_LOAD_PROPERTIES |
++	                  G_DBUS_PROXY_FLAGS_DO_NOT_CONNECT_SIGNALS,
++	                  NULL,
++	                  SYSTEMD_RESOLVED_DBUS_SERVICE,
++	                  SYSTEMD_RESOLVED_DBUS_PATH,
++	                  SYSTEMD_RESOLVED_DBUS_SERVICE ".Manager",
++	                  priv->init_cancellable,
++	                  resolved_proxy_created,
++	                  self);
++}
++
++static void
++dispose (GObject *object)
++{
++	NMDnsSystemdResolved *self = NM_DNS_SYSTEMD_RESOLVED (object);
++	NMDnsSystemdResolvedPrivate *priv = NM_DNS_SYSTEMD_RESOLVED_GET_PRIVATE (self);
++
++	free_pending_updates (self);
++	g_clear_object (&priv->resolve);
++	nm_clear_g_cancellable (&priv->init_cancellable);
++	nm_clear_g_cancellable (&priv->update_cancellable);
++
++	G_OBJECT_CLASS (nm_dns_systemd_resolved_parent_class)->dispose (object);
++}
++
++static void
++nm_dns_systemd_resolved_class_init (NMDnsSystemdResolvedClass *dns_class)
++{
++	NMDnsPluginClass *plugin_class = NM_DNS_PLUGIN_CLASS (dns_class);
++	GObjectClass *object_class = G_OBJECT_CLASS (dns_class);
++
++	g_type_class_add_private (dns_class, sizeof (NMDnsSystemdResolvedPrivate));
++
++	object_class->dispose = dispose;
++
++	plugin_class->is_caching = is_caching;
++	plugin_class->update = update;
++	plugin_class->get_name = get_name;
++}
++
+diff --git a/src/dns-manager/nm-dns-systemd-resolved.h b/src/dns-manager/nm-dns-systemd-resolved.h
+new file mode 100644
+index 0000000..45c64b3
+--- /dev/null
++++ b/src/dns-manager/nm-dns-systemd-resolved.h
+@@ -0,0 +1,45 @@
++/* -*- Mode: C; tab-width: 4; indent-tabs-mode: t; c-basic-offset: 4 -*- */
++/* This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License as published by
++ * the Free Software Foundation; either version 2, or (at your option)
++ * any later version.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License along
++ * with this program; if not, write to the Free Software Foundation, Inc.,
++ * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
++ *
++ * Copyright (C) 2010 Red Hat, Inc.
++ * Copyright (C) 2016 Sjoerd Simons <sjoerd@luon.net>
++ */
++
++#ifndef __NETWORKMANAGER_DNS_SYSTEMD_RESOLVED_H__
++#define __NETWORKMANAGER_DNS_SYSTEMD_RESOLVED_H__
++
++#include "nm-dns-plugin.h"
++
++#define NM_TYPE_DNS_SYSTEMD_RESOLVED            (nm_dns_systemd_resolved_get_type ())
++#define NM_DNS_SYSTEMD_RESOLVED(obj)            (G_TYPE_CHECK_INSTANCE_CAST ((obj), NM_TYPE_DNS_SYSTEMD_RESOLVED, NMDnsSystemdResolved))
++#define NM_DNS_SYSTEMD_RESOLVED_CLASS(klass)    (G_TYPE_CHECK_CLASS_CAST ((klass), NM_TYPE_DNS_SYSTEMD_RESOLVED, NMDnsSystemdResolvedClass))
++#define NM_IS_DNS_SYSTEMD_RESOLVED(obj)         (G_TYPE_CHECK_INSTANCE_TYPE ((obj), NM_TYPE_DNS_SYSTEMD_RESOLVED))
++#define NM_IS_DNS_SYSTEMD_RESOLVED_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE ((klass), NM_TYPE_DNS_SYSTEMD_RESOLVED))
++#define NM_DNS_SYSTEMD_RESOLVED_GET_CLASS(obj)  (G_TYPE_INSTANCE_GET_CLASS ((obj), NM_TYPE_DNS_SYSTEMD_RESOLVED, NMDnsSystemdResolvedClass))
++
++typedef struct {
++	NMDnsPlugin parent;
++} NMDnsSystemdResolved;
++
++typedef struct {
++	NMDnsPluginClass parent;
++} NMDnsSystemdResolvedClass;
++
++GType nm_dns_systemd_resolved_get_type (void);
++
++NMDnsPlugin *nm_dns_systemd_resolved_new (void);
++
++#endif /* __NETWORKMANAGER_DNS_SYSTEMD_RESOLVED_H__ */
++
diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager/0001-dns-resolved-also-check-for-etc-resolv-conf.systemd.patch b/meta-oe/recipes-connectivity/networkmanager/networkmanager/0001-dns-resolved-also-check-for-etc-resolv-conf.systemd.patch
new file mode 100644
index 0000000..ca7e4a4
--- /dev/null
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager/0001-dns-resolved-also-check-for-etc-resolv-conf.systemd.patch
@@ -0,0 +1,29 @@
+From 6f799f1f0e68cc7bf89c0a56aec5ecf46937619d Mon Sep 17 00:00:00 2001
+From: Ricardo Salveti <rsalveti@rsalveti.net>
+Date: Thu, 15 Jun 2017 10:02:38 -0300
+Subject: [PATCH] dns/resolved: also check for /etc/resolv-conf.systemd
+
+OE specific resolv.conf path, so it can be enabled by default if available.
+
+Upstream-Status: Inappropriate [OE config specific]
+
+Signed-off-by: Ricardo Salveti <rsalveti@rsalveti.net>
+---
+ src/dns-manager/nm-dns-manager.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/dns-manager/nm-dns-manager.c b/src/dns-manager/nm-dns-manager.c
+index c1d2bf7..d70d4b4 100644
+--- a/src/dns-manager/nm-dns-manager.c
++++ b/src/dns-manager/nm-dns-manager.c
+@@ -1596,6 +1596,7 @@ _resolvconf_resolved_managed (void)
+ 		"/run/systemd/resolve/resolv.conf",
+ 		"/lib/systemd/resolv.conf",
+ 		"/usr/lib/systemd/resolv.conf",
++		"/etc/resolv-conf.systemd",
+ 	};
+ 	GFile *f;
+ 	GFileInfo *info;
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.4.4.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.4.4.bb
index 85098fe..0de4383 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.4.4.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.4.4.bb
@@ -32,6 +32,8 @@ SRC_URI = "${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkManag
            file://0004-Define-missing-features-to-cater-for-musl.patch \
            file://0005-sd-lldp.h-Remove-net-ethernet.h-seems-to-be-over-spe.patch \
            file://0001-check-for-strndupa-before-using-it.patch \
+           file://0001-dns-resolved-add-systemd-resolved-backend.patch \
+           file://0001-dns-resolved-also-check-for-etc-resolv-conf.systemd.patch \
            "
 SRC_URI[md5sum] = "63f1e0d6d7e9099499d062c84c927a75"
 SRC_URI[sha256sum] = "829378f318cc008d138a23ca6a9191928ce75344e7e47a2f2c35f4ac82133309"
-- 
2.7.4



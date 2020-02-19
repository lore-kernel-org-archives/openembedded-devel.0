Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
	[209.85.216.46])
	by mail.openembedded.org (Postfix) with ESMTP id F2D8F61572
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Feb 2020 00:50:53 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id r67so1814481pjb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2020 16:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=YLt9TBFBkgmDRsIWQ3m0kunLwfPTXH+gKA6potkbM5o=;
	b=N1+dKc6aO4PWJQoaZ3wTglD+Ii61IKbFIN4bMISPFHQM/H5CpurrlZq3uAYjHT4Ty/
	Sqn5bLBblANksGVm3MEEXYcodAJ030XuOE/2QP8tR1pQ2JW3jeibCsUwSx4TyLJehSbn
	cbDBi9ZR11tQ5wt4F5ypJkoeUCTZ4HYdr2TlFOW3bSSe7T1oqU4wJk5tAq3Q8TBCXSmQ
	YoQITlWC1j0EhINBan3OvMQ+a6hZRS0rsZYtFAHAv/uDkUwmvsa0WUf2cqHo7XO+51Ts
	9SjbakjjfLizyL1LIzMATROcopBh1juqy2ICFKyOgj9gkLKWVS8bZH1iHJtcaQ58AiJf
	AODg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=YLt9TBFBkgmDRsIWQ3m0kunLwfPTXH+gKA6potkbM5o=;
	b=l+WOUUMcnfQosFCbAFUQhcRTSTAugZ6KowmqMG5UOFVHBUHkMqFoU+KdD7CYMcLOs8
	waQvmoRNB8YdnwFm97IgtqgsOOA+OTiHn9kifYhxtt5hX1Pq2BfOOvmheCwJBd+gaclo
	c+Xqn6g/CRoe5r12/NP136D5QUUrL50+fyO4TApKTZIghZ9+ocL8r8rRaGN8pWSgoMfN
	/YBKqyZqAukHNvW2XDcsK/L12eshByMdA9mVempp42r8iXbtO/ESyGoO6ZAQTAle38Kj
	VE6ot9+dH8PtgCzG8M0ju6qTdc4gLGxP5z7WJKXqL3fw5oSRhFflcrTJs4FXRaxuSFMB
	8ajw==
X-Gm-Message-State: APjAAAUfKyxoHkasusg03cmCXdDsK2SyM+KmV10DtH5KHonhvhbdkxLV
	d/Q1yOdWjM4qcSG3sghKeOCIrNzQTds=
X-Google-Smtp-Source: APXvYqymMeectQJL+uXXqaFetlei+dJMwHhUmMr8bnN9UYR5no3RuwrDH8jhmaUMcrYSpiCYWkuSBg==
X-Received: by 2002:a17:90a:b381:: with SMTP id
	e1mr5859438pjr.38.1582073454390; 
	Tue, 18 Feb 2020 16:50:54 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::396c])
	by smtp.gmail.com with ESMTPSA id c5sm207276pfi.10.2020.02.18.16.50.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 18 Feb 2020 16:50:54 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Feb 2020 16:50:58 -0800
Message-Id: <20200219005058.2921658-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200219005058.2921658-1-raj.khem@gmail.com>
References: <20200219005058.2921658-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH 4/4] dleyna-renderer: Fix build with gupnp 1.2+
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
X-List-Received-Date: Wed, 19 Feb 2020 00:50:54 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-add-gupnp-1.2-API-support.patch      | 123 ++++++++++++++++++
 .../dleyna/dleyna-renderer_0.6.0.bb           |   4 +-
 2 files changed, 126 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-multimedia/dleyna/dleyna-renderer/0001-add-gupnp-1.2-API-support.patch

diff --git a/meta-multimedia/recipes-multimedia/dleyna/dleyna-renderer/0001-add-gupnp-1.2-API-support.patch b/meta-multimedia/recipes-multimedia/dleyna/dleyna-renderer/0001-add-gupnp-1.2-API-support.patch
new file mode 100644
index 0000000000..8f54658a11
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/dleyna/dleyna-renderer/0001-add-gupnp-1.2-API-support.patch
@@ -0,0 +1,123 @@
+From 7c945e7960cf7dffd9dd0bb5f7ec6bee4dc0bca3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 18 Feb 2020 14:17:55 -0800
+Subject: [PATCH] add gupnp 1.2 API support
+
+Takes from https://git.archlinux.org/svntogit/packages.git/tree/trunk/gupnp-1.2.diff?h=packages/dleyna-renderer
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac                |  4 +--
+ libdleyna/renderer/device.c | 51 +++++++++++++++++++++++++++++++++++--
+ libdleyna/renderer/upnp.c   |  4 +--
+ 3 files changed, 53 insertions(+), 6 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 271ee92..364659d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -38,8 +38,8 @@ LT_LANG([C])
+ PKG_PROG_PKG_CONFIG(0.16)
+ PKG_CHECK_MODULES([GLIB], [glib-2.0 >= 2.28])
+ PKG_CHECK_MODULES([GIO], [gio-2.0 >= 2.28])
+-PKG_CHECK_MODULES([GSSDP], [gssdp-1.0 >= 0.13.2])
+-PKG_CHECK_MODULES([GUPNP], [gupnp-1.0 >= 0.20.5])
++PKG_CHECK_MODULES([GSSDP], [gssdp-1.2 >= 1.2.0])
++PKG_CHECK_MODULES([GUPNP], [gupnp-1.2 >= 1.2.0])
+ PKG_CHECK_MODULES([GUPNPAV], [gupnp-av-1.0 >= 0.11.5])
+ PKG_CHECK_MODULES([GUPNPDLNA], [gupnp-dlna-2.0 >= 0.9.4])
+ PKG_CHECK_MODULES([SOUP], [libsoup-2.4 >= 2.28.2])
+diff --git a/libdleyna/renderer/device.c b/libdleyna/renderer/device.c
+index 783fb52..c7b9fc3 100644
+--- a/libdleyna/renderer/device.c
++++ b/libdleyna/renderer/device.c
+@@ -2121,6 +2121,53 @@ exit:
+ 	return;
+ }
+ 
++typedef struct
++{
++  GMainLoop *loop;
++  GUPnPServiceIntrospection *introspection;
++  GError **error;
++} GetIntrospectionAsyncData;
++
++static void
++get_introspection_async_cb (GUPnPServiceInfo           *info,
++                            GUPnPServiceIntrospection  *introspection,
++                            const GError               *error,
++                            gpointer                    user_data)
++{
++  GetIntrospectionAsyncData *data = user_data;
++  data->introspection = introspection;
++  if (data->error)
++    *data->error = g_error_copy (error);
++  g_main_loop_quit (data->loop);
++}
++
++static GUPnPServiceIntrospection *
++_gupnp_service_info_get_introspection (GUPnPServiceInfo *info,
++                                       GError          **error)
++{
++  GetIntrospectionAsyncData data;
++  GMainContext *context;
++
++  context = g_main_context_new ();
++  data.loop = g_main_loop_new (context, FALSE);
++  data.error = error;
++
++  g_main_context_push_thread_default (context);
++
++  gupnp_service_info_get_introspection_async (info,
++                                              get_introspection_async_cb,
++                                              &data);
++
++  g_main_loop_run (data.loop);
++
++  g_main_context_pop_thread_default (context);
++
++  g_main_loop_unref (data.loop);
++  g_main_context_unref (context);
++
++  return data.introspection;
++}
++
+ static gboolean prv_get_av_service_states_values(GUPnPServiceProxy *av_proxy,
+ 						 GVariant **mpris_tp_speeds,
+ 						 GPtrArray **upnp_tp_speeds,
+@@ -2147,7 +2194,7 @@ static gboolean prv_get_av_service_states_values(GUPnPServiceProxy *av_proxy,
+ 	weak_ref = av_proxy;
+ 	g_object_add_weak_pointer(G_OBJECT(av_proxy), &weak_ref);
+ 
+-	introspection = gupnp_service_info_get_introspection(
++	introspection = _gupnp_service_info_get_introspection(
+ 		GUPNP_SERVICE_INFO(av_proxy),
+ 		&error);
+ 
+@@ -2215,7 +2262,7 @@ static gboolean prv_get_rc_service_states_values(GUPnPServiceProxy *rc_proxy,
+ 	weak_ref = rc_proxy;
+ 	g_object_add_weak_pointer(G_OBJECT(rc_proxy), &weak_ref);
+ 
+-	introspection = gupnp_service_info_get_introspection(
++	introspection = _gupnp_service_info_get_introspection(
+ 		GUPNP_SERVICE_INFO(rc_proxy),
+ 		&error);
+ 
+diff --git a/libdleyna/renderer/upnp.c b/libdleyna/renderer/upnp.c
+index ac1b08a..b762226 100644
+--- a/libdleyna/renderer/upnp.c
++++ b/libdleyna/renderer/upnp.c
+@@ -243,8 +243,8 @@ static void prv_server_unavailable_cb(GUPnPControlPoint *cp,
+ 
+ 	udn = gupnp_device_info_get_udn((GUPnPDeviceInfo *)proxy);
+ 
+-	ip_address = gupnp_context_get_host_ip(
+-		gupnp_control_point_get_context(cp));
++	ip_address = gssdp_client_get_host_ip(
++		GSSDP_CLIENT(gupnp_control_point_get_context(cp)));
+ 
+ 	if (!udn || !ip_address)
+ 		goto on_error;
+-- 
+2.25.1
+
diff --git a/meta-multimedia/recipes-multimedia/dleyna/dleyna-renderer_0.6.0.bb b/meta-multimedia/recipes-multimedia/dleyna/dleyna-renderer_0.6.0.bb
index b30aee9fbe..642f21bd53 100644
--- a/meta-multimedia/recipes-multimedia/dleyna/dleyna-renderer_0.6.0.bb
+++ b/meta-multimedia/recipes-multimedia/dleyna/dleyna-renderer_0.6.0.bb
@@ -11,7 +11,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 DEPENDS = "glib-2.0 gssdp gupnp gupnp-av gupnp-dlna libsoup-2.4 dleyna-core"
 RDEPENDS_${PN} = "dleyna-connector-dbus"
 
-SRC_URI = "git://github.com/01org/${BPN}.git"
+SRC_URI = "git://github.com/01org/${BPN}.git \
+           file://0001-add-gupnp-1.2-API-support.patch \
+          "
 SRCREV = "50fd1ec9d51328e7dea98874129dc8d6fe3ea1dd"
 S = "${WORKDIR}/git"
 
-- 
2.25.1



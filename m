Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDCAAD3B988
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 16:36:03 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12115.1765298158369723529
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 08:35:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WAGI4gJF;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42e2e628f8aso2780601f8f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 08:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765298157; x=1765902957; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x1JA7zv7ycv/DbI4qpeWkJj3PFwQ/rqRtUwgcMoT2BI=;
        b=WAGI4gJFpchBYpp0WXz12TlS54uhbWOBAbu5Q3QDbBZ4anqsCDoz9FXe9CkLtDq1pz
         b4+o5aLXmZnbFQgewlTxVDsZQ/YpI751MFhLaY3g5wk/vcSzF/xW5W1+9YTDEV06qa/7
         BLCvR8l9ypXqPPgpKHXLy7J1wJZBk+6TyDLiKMekCoX6Xs4udYf2lvDkfGsljEa07srf
         EWM5FiuQ0gnxMRkxpKQl5OjIHs1mTJix+k4tJ4cNyzxRcf1+P/k6zGixOZJJ5LnKGEyv
         e74HhQwT8BufXx0TBR0oEVhhFQ1ANrx3LmTHABpFvHF3nmN93fqSNgUq/UR8RfMuHmQc
         lTXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765298157; x=1765902957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x1JA7zv7ycv/DbI4qpeWkJj3PFwQ/rqRtUwgcMoT2BI=;
        b=tFz4I1+m+g1XL4TbUb3nTlKRy7o2jLx59fOwa8q/C2QLahAFM7FUgEFYFYb9W921Dc
         WBgwSgzLO6oSDRqcZc+L9hc1ShDrZEIliTiggrGADFYF9ijoQq9f7QAAUdVOsokBQM78
         szMBRndJNplCA3583wmL0jki+U6DyahdHboZyk4UOCnNRnKB8gqOKAdapd4ksNQrGQzR
         oX/Zhi7LF7DH8Lv1R9TIoPjsWDMvFRb81aYr7IhCfLlVRHeXkp+WVMpWn44q3cPLYBaZ
         wt9T4f891K/Fc9CXXQcz9CMi9Z/PkXCJ7PqFFD3csedOlSjNTSMZJuv08727Elzi2f3K
         D5Bg==
X-Gm-Message-State: AOJu0Ywquh8WacFdBPqSIl9bMLSA69nazLwkeMt1F+ezml3accHmrGrF
	nLoToGgSV+r9MW5wj3PcsDe7L5+KqGp4Pvaw41MD5dgo8/0izdPw34oh/UFQuw==
X-Gm-Gg: AY/fxX55uhKTYHOUWoTwTIGGfWonZ6K4goGyCcyUm2LG4otyvmPYm8W5+OGO1KPezRv
	oer5PZgOmiN2Eb6X7oRtjegkOCi7Ntn/DSewFRV+ExrS2R+6MNtI2YxhEpgp8iG3VSnW4E524ds
	5uaK1d3ggj4/q6uDis96fJxM0YftyqEXHXnZned+8miU+98aso/ZNLCJxyBaSaM1Kvia7QA05PH
	L18ElAjiZd/fKX4fwaYgaF0wONQvvv0f96Lla/mO9UeKPfTHk5LgTjO6FU2ZsU09oLpGwNJQiJS
	ylbBCBBVgmGd8TTKHCCZ0ILlWbWuVdIkaicUYGnTcZDHvtZFmKyTykB+U5C4/mbnbbeIFh2fNYE
	WJGyxbmJxfArB23yPSwkAKz91W5665G7kUw0qfarjXPQgnPyD2bmP0qB1rXJZERF6h5+3cJgfD8
	XvQLUjkQnI
X-Google-Smtp-Source: AGHT+IHxuwkgtSx1iB7N/0GvdoKkYzARxmZRcaHhxl3h7PpFeEPtIz+mS3uaNAsSs2DjCJJac29Sgg==
X-Received: by 2002:a05:6000:2f86:b0:3ec:ea73:a91e with SMTP id ffacd0b85a97d-42f89f0fae6mr13689110f8f.12.1765298156644;
        Tue, 09 Dec 2025 08:35:56 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7cbff352sm33030154f8f.17.2025.12.09.08.35.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 08:35:56 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 3/4] dleyna-renderer: drop recipe
Date: Tue,  9 Dec 2025 17:35:51 +0100
Message-ID: <20251209163552.1419590-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251209163552.1419590-1-skandigraun@gmail.com>
References: <20251209163552.1419590-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 16:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122469

The recipe has been disabled for over two years, due to the application
being an abandonware, and it fails to compile with new versions of its dependencies.

There are no signs from upstream that it would be revived (repository
has been archived 4 years ago).

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../0001-add-gupnp-1.2-API-support.patch      | 123 ------------------
 .../dleyna/dleyna-renderer_0.6.0.bb           |  26 ----
 2 files changed, 149 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/dleyna/dleyna-renderer/0001-add-gupnp-1.2-API-support.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/dleyna/dleyna-renderer_0.6.0.bb

diff --git a/meta-multimedia/recipes-multimedia/dleyna/dleyna-renderer/0001-add-gupnp-1.2-API-support.patch b/meta-multimedia/recipes-multimedia/dleyna/dleyna-renderer/0001-add-gupnp-1.2-API-support.patch
deleted file mode 100644
index 8f54658a11..0000000000
--- a/meta-multimedia/recipes-multimedia/dleyna/dleyna-renderer/0001-add-gupnp-1.2-API-support.patch
+++ /dev/null
@@ -1,123 +0,0 @@
-From 7c945e7960cf7dffd9dd0bb5f7ec6bee4dc0bca3 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 18 Feb 2020 14:17:55 -0800
-Subject: [PATCH] add gupnp 1.2 API support
-
-Takes from https://git.archlinux.org/svntogit/packages.git/tree/trunk/gupnp-1.2.diff?h=packages/dleyna-renderer
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac                |  4 +--
- libdleyna/renderer/device.c | 51 +++++++++++++++++++++++++++++++++++--
- libdleyna/renderer/upnp.c   |  4 +--
- 3 files changed, 53 insertions(+), 6 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 271ee92..364659d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -38,8 +38,8 @@ LT_LANG([C])
- PKG_PROG_PKG_CONFIG(0.16)
- PKG_CHECK_MODULES([GLIB], [glib-2.0 >= 2.28])
- PKG_CHECK_MODULES([GIO], [gio-2.0 >= 2.28])
--PKG_CHECK_MODULES([GSSDP], [gssdp-1.0 >= 0.13.2])
--PKG_CHECK_MODULES([GUPNP], [gupnp-1.0 >= 0.20.5])
-+PKG_CHECK_MODULES([GSSDP], [gssdp-1.2 >= 1.2.0])
-+PKG_CHECK_MODULES([GUPNP], [gupnp-1.2 >= 1.2.0])
- PKG_CHECK_MODULES([GUPNPAV], [gupnp-av-1.0 >= 0.11.5])
- PKG_CHECK_MODULES([GUPNPDLNA], [gupnp-dlna-2.0 >= 0.9.4])
- PKG_CHECK_MODULES([SOUP], [libsoup-2.4 >= 2.28.2])
-diff --git a/libdleyna/renderer/device.c b/libdleyna/renderer/device.c
-index 783fb52..c7b9fc3 100644
---- a/libdleyna/renderer/device.c
-+++ b/libdleyna/renderer/device.c
-@@ -2121,6 +2121,53 @@ exit:
- 	return;
- }
- 
-+typedef struct
-+{
-+  GMainLoop *loop;
-+  GUPnPServiceIntrospection *introspection;
-+  GError **error;
-+} GetIntrospectionAsyncData;
-+
-+static void
-+get_introspection_async_cb (GUPnPServiceInfo           *info,
-+                            GUPnPServiceIntrospection  *introspection,
-+                            const GError               *error,
-+                            gpointer                    user_data)
-+{
-+  GetIntrospectionAsyncData *data = user_data;
-+  data->introspection = introspection;
-+  if (data->error)
-+    *data->error = g_error_copy (error);
-+  g_main_loop_quit (data->loop);
-+}
-+
-+static GUPnPServiceIntrospection *
-+_gupnp_service_info_get_introspection (GUPnPServiceInfo *info,
-+                                       GError          **error)
-+{
-+  GetIntrospectionAsyncData data;
-+  GMainContext *context;
-+
-+  context = g_main_context_new ();
-+  data.loop = g_main_loop_new (context, FALSE);
-+  data.error = error;
-+
-+  g_main_context_push_thread_default (context);
-+
-+  gupnp_service_info_get_introspection_async (info,
-+                                              get_introspection_async_cb,
-+                                              &data);
-+
-+  g_main_loop_run (data.loop);
-+
-+  g_main_context_pop_thread_default (context);
-+
-+  g_main_loop_unref (data.loop);
-+  g_main_context_unref (context);
-+
-+  return data.introspection;
-+}
-+
- static gboolean prv_get_av_service_states_values(GUPnPServiceProxy *av_proxy,
- 						 GVariant **mpris_tp_speeds,
- 						 GPtrArray **upnp_tp_speeds,
-@@ -2147,7 +2194,7 @@ static gboolean prv_get_av_service_states_values(GUPnPServiceProxy *av_proxy,
- 	weak_ref = av_proxy;
- 	g_object_add_weak_pointer(G_OBJECT(av_proxy), &weak_ref);
- 
--	introspection = gupnp_service_info_get_introspection(
-+	introspection = _gupnp_service_info_get_introspection(
- 		GUPNP_SERVICE_INFO(av_proxy),
- 		&error);
- 
-@@ -2215,7 +2262,7 @@ static gboolean prv_get_rc_service_states_values(GUPnPServiceProxy *rc_proxy,
- 	weak_ref = rc_proxy;
- 	g_object_add_weak_pointer(G_OBJECT(rc_proxy), &weak_ref);
- 
--	introspection = gupnp_service_info_get_introspection(
-+	introspection = _gupnp_service_info_get_introspection(
- 		GUPNP_SERVICE_INFO(rc_proxy),
- 		&error);
- 
-diff --git a/libdleyna/renderer/upnp.c b/libdleyna/renderer/upnp.c
-index ac1b08a..b762226 100644
---- a/libdleyna/renderer/upnp.c
-+++ b/libdleyna/renderer/upnp.c
-@@ -243,8 +243,8 @@ static void prv_server_unavailable_cb(GUPnPControlPoint *cp,
- 
- 	udn = gupnp_device_info_get_udn((GUPnPDeviceInfo *)proxy);
- 
--	ip_address = gupnp_context_get_host_ip(
--		gupnp_control_point_get_context(cp));
-+	ip_address = gssdp_client_get_host_ip(
-+		GSSDP_CLIENT(gupnp_control_point_get_context(cp)));
- 
- 	if (!udn || !ip_address)
- 		goto on_error;
--- 
-2.25.1
-
diff --git a/meta-multimedia/recipes-multimedia/dleyna/dleyna-renderer_0.6.0.bb b/meta-multimedia/recipes-multimedia/dleyna/dleyna-renderer_0.6.0.bb
deleted file mode 100644
index 3e55a212d4..0000000000
--- a/meta-multimedia/recipes-multimedia/dleyna/dleyna-renderer_0.6.0.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-SUMMARY = "DLNA renderer libraries"
-DESCRIPTION = "dleyna-renderer is a library for implementing services \
-that allow clients to discover and manipulate Digital Media Renderers. \
-An implementation of such a service for linux is also included."
-HOMEPAGE = "https://01.org/dleyna/"
-
-LICENSE = "LGPL-2.1-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
-                    file://libdleyna/renderer/server.c;endline=21;md5=f51acd4757fb6a779a87122c43cf1346"
-
-DEPENDS = "glib-2.0 gssdp gupnp gupnp-av gupnp-dlna libsoup-2.4 dleyna-core"
-RDEPENDS:${PN} = "dleyna-connector-dbus"
-
-SRC_URI = "git://github.com/01org/${BPN}.git;branch=master;protocol=https \
-           file://0001-add-gupnp-1.2-API-support.patch \
-          "
-SRCREV = "50fd1ec9d51328e7dea98874129dc8d6fe3ea1dd"
-
-inherit autotools pkgconfig
-
-CFLAGS += " -I${S}"
-
-FILES:${PN} += "${datadir}/dbus-1"
-FILES:${PN}-dev += "${libdir}/${BPN}/*.so"
-
-SKIP_RECIPE[dleyna-renderer] ?= "Upstream is dead moreover needs porting to work with latest gupnp >= 1.2"


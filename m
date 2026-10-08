Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFF4ACA6011
	for <webhook@archiver.kernel.org>; Thu,  8 Oct 2026 18:25:45 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1449.1791483942182093182
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Oct 2026 11:25:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=lYbz/KWC;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20261008182538294e24952100020783-kgyt5f@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20261008182538294e24952100020783
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 08 Oct 2026 20:25:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Xh0OdI3Dfdr+E0qXR41T00NQHgy8+3oQaLKOnmWy1x0=;
 b=lYbz/KWCRVgW+ukMpmnsyw6wS0QGfCKvle1UDRmVJf2dmaUojcrJ/INf3PNXfzzgmNpkBv
 K9/clPo6hll9QATmm9DL/NAHlvDPcsrzGvPWiM1HMYhad/+7+2IT0faxLL/JT3RE+biz8g8Z
 aQbhcDfvavG0UloeD7RlEsSNZ+Lr/aw9xCWN29F07db9kHZmoyxeXQIydbtkmFrVcmx3/XrO
 p2aXYSTiiEjgDyleVu18f4Jm28hZMzoXAhDPCCc4x9M95N/vi/R09btWCg0T/skaBjzaJfGJ
 7ZUV2bO8/NoxmeAp7qqX1NzyKFA5WR3wIjCImaV+byUfd3WdzCWOm8Ug==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH] libwebsockets: upgrade 4.5.8 -> 5.0.0
Date: Thu,  8 Oct 2026 20:25:24 +0200
Message-ID: <20261008182524.665019-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Oct 2026 18:25:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130673

From: Peter Marko <peter.marko@siemens.com>

Release notes: [1]

Solves (at least) CVE-2026-19773 and CVE-2026-78161.
[2] claims that there are many security fixes available.

Drop patch included in this release.
Drop LIB_SUFFIX which now only throws deprecation warning.
Disable WERROR to keep build green.

Add new option http3 to packageconfig and disable it as it cannot use
openssl which is now enabled for ssl package option.
It can be used together with openssl for ssl and gnutls for https but
that would be weird.
Added possibility to switch gnutls as SSL backend.

License-Update: Addend additional files [3]

[1] https://github.com/warmcat/libwebsockets/blob/v5.0.0/README.md?plain=1#L29
[2] https://github.com/warmcat/libwebsockets/commit/ed1d8f3bc5b7772f283f05d77dec3b4ced0c95b3
[3] https://github.com/warmcat/libwebsockets/commit/a64f8d72c7442d8a982cce5fc0754d87c8db7ee7

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libwebsockets/CVE-2026-10650.patch        | 46 -------------------
 ...ockets_4.5.8.bb => libwebsockets_5.0.0.bb} | 16 ++++---
 2 files changed, 10 insertions(+), 52 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2026-10650.patch
 rename meta-oe/recipes-connectivity/libwebsockets/{libwebsockets_4.5.8.bb => libwebsockets_5.0.0.bb} (86%)

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2026-10650.patch b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2026-10650.patch
deleted file mode 100644
index 5846b3616d..0000000000
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2026-10650.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 3f9f0c6ecaf0e6f3f219d30632c5d1f2479d7498 Mon Sep 17 00:00:00 2001
-From: Biniam F Demissie <biniamfd@gmail.com>
-Date: Wed, 13 May 2026 04:25:55 +0100
-Subject: [PATCH] ssh: plugin: add limit to resource exhaustion
-
-CVE: CVE-2026-10650
-Upstream-Status: Backport [https://github.com/warmcat/libwebsockets/commit/3f9f0c6ecaf0e6f3f219d30632c5d1f2479d7498]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- plugins/ssh-base/sshd.c | 9 ++++++++-
- 1 file changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/plugins/ssh-base/sshd.c b/plugins/ssh-base/sshd.c
-index ea35cb8b7..c849644d4 100644
---- a/plugins/ssh-base/sshd.c
-+++ b/plugins/ssh-base/sshd.c
-@@ -1,7 +1,7 @@
- /*
-  * libwebsockets - small server side websockets and web server implementation
-  *
-- * Copyright (C) 2010 - 2019 Andy Green <andy@warmcat.com>
-+ * Copyright (C) 2010 - 2026 Andy Green <andy@warmcat.com>
-  *
-  * Permission is hereby granted, free of charge, to any person obtaining a copy
-  * of this software and associated documentation files (the "Software"), to
-@@ -28,6 +28,8 @@
- #include <string.h>
- #include <stdlib.h>
- 
-+#define LWS_SSH_MAX_PACKET_SIZE  (256 * 1024)
-+
- void *sshd_zalloc(size_t s)
- {
- 	void *p = malloc(s);
-@@ -592,6 +594,11 @@ again:
- 			pss->parser_state = SSHS_MSG_PADDING;
- 			pss->ctr = 0;
- 			pss->pos = 4;
-+
-+			if (pss->msg_len > LWS_SSH_MAX_PACKET_SIZE) {
-+				lwsl_notice("msg size %u exceeds maximum\n", pss->msg_len);
-+				goto bail;
-+			}
- 			if (pss->msg_len < 2 + 4) {
- 				lwsl_notice("illegal msg size\n");
- 				goto bail;
diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.8.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_5.0.0.bb
similarity index 86%
rename from meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.8.bb
rename to meta-oe/recipes-connectivity/libwebsockets/libwebsockets_5.0.0.bb
index 005729dcac..bafaf10f9b 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.8.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_5.0.0.bb
@@ -1,15 +1,15 @@
 SUMMARY = "Canonical libwebsockets.org websocket library"
 HOMEPAGE = "https://libwebsockets.org/"
 LICENSE = "Apache-2.0 AND BSD-3-Clause AND MIT AND OFL-1.1 AND Zlib"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b5d391cc7929bcba238f9ba6805f7574"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d1d99ab4e0f1be7992a891906e47add2"
 
 DEPENDS = "zlib"
 DEPENDS:append:class-native = " libcap-native"
 
-SRCREV = "fbb0baf6af9c4324f0f1591734c78b0089b599d4"
+SRCREV = "2491a1b101283cf7886d05033345b7e821825319"
+SRCBRANCH = "v${@oe.utils.trim_version("${PV}", 2)}-stable"
 SRC_URI = " \
-    git://github.com/warmcat/libwebsockets.git;protocol=https;branch=v4.5-stable;tag=v${PV} \
-    file://CVE-2026-10650.patch \
+    git://github.com/warmcat/libwebsockets.git;protocol=https;branch=${SRCBRANCH};tag=v${PV} \
 "
 
 UPSTREAM_CHECK_URI = "https://github.com/warmcat/${BPN}/releases"
@@ -20,25 +20,29 @@ inherit cmake pkgconfig
 PACKAGECONFIG ?= "libuv client server http2 ssl ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[client] = "-DLWS_WITHOUT_CLIENT=OFF,-DLWS_WITHOUT_CLIENT=ON,"
 PACKAGECONFIG[http2] = "-DLWS_WITH_HTTP2=ON,-DLWS_WITH_HTTP2=OFF,"
+PACKAGECONFIG[http3] = "-DLWS_WITH_HTTP3=ON -DLWS_ROLE_QUIC=ON,-DLWS_WITH_HTTP3=OFF -DLWS_ROLE_QUIC=OFF,gnutls"
 PACKAGECONFIG[ipv6] = "-DLWS_IPV6=ON,-DLWS_IPV6=OFF,"
 PACKAGECONFIG[libevent] = "-DLWS_WITH_LIBEVENT=ON,-DLWS_WITH_LIBEVENT=OFF,libevent"
 PACKAGECONFIG[libev] = "-DLWS_WITH_LIBEV=ON,-DLWS_WITH_LIBEV=OFF,libev"
 PACKAGECONFIG[libuv] = "-DLWS_WITH_LIBUV=ON,-DLWS_WITH_LIBUV=OFF,libuv"
 PACKAGECONFIG[server] = "-DLWS_WITHOUT_SERVER=OFF,-DLWS_WITHOUT_SERVER=ON,"
-PACKAGECONFIG[ssl] = "-DLWS_WITH_SSL=ON,-DLWS_WITH_SSL=OFF,openssl libcap"
+PACKAGECONFIG[ssl] = "-DLWS_WITH_SSL=ON,-DLWS_WITH_SSL=OFF,${SSL_DEPENDENCY} libcap"
+PACKAGECONFIG[gnutls] = "-DLWS_WITH_GNUTLS=ON,-DLWS_WITH_GNUTLS=OFF,gnutls"
 PACKAGECONFIG[static] = "-DLWS_WITH_STATIC=ON,-DLWS_WITH_STATIC=OFF -DLWS_LINK_TESTAPPS_DYNAMIC=ON,"
 PACKAGECONFIG[systemd] = "-DLWS_WITH_SDEVENT=ON,-DLWS_WITH_SDEVENT=OFF,systemd"
 PACKAGECONFIG[examples] = "-DLWS_WITH_MINIMAL_EXAMPLES=ON,-DLWS_WITH_MINIMAL_EXAMPLES=OFF"
 
+SSL_DEPENDENCY = "${@bb.utils.contains('PACKAGECONFIG', 'gnutls', '', 'openssl', d)}"
+
 python __anonymous() {
   if bb.utils.contains('PACKAGECONFIG', 'systemd', True, False, d) and not bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d):
     bb.fatal("PACKAGECONFIG contains systemd but DISTRO_FEATURES doesn't")
 }
 
 EXTRA_OECMAKE += " \
-    -DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')} \
     -DLWS_WITHOUT_TESTAPPS=ON \
     -DLWS_HAVE_HMAC_CTX_new=ON \
+    -DDISABLE_WERROR=ON \
 "
 
 do_compile:prepend() {


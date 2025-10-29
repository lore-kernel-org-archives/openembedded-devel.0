Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 918D8CCF9F7
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 16:42:59 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web01.10004.1761756170469697992
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Oct 2025 09:42:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout05.t-online.de (Postfix) with SMTP id 9FD031DCF
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 17:42:48 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.224.109]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vE9Fx-0p6LVi0; Wed, 29 Oct 2025 17:42:42 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 2/2] spice: update 0.15.2 -> 0.16.0
Date: Wed, 29 Oct 2025 17:42:30 +0100
Message-ID: <20251029164230.218721-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029164230.218721-1-f_l_k@t-online.de>
References: <20251029164230.218721-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1761756162-E8F91A4B-C7C3C31D/0/0 CLEAN NORMAL
X-TOI-MSGID: 2be5350d-2866-43d9-a3d6-c4337cfaaa23
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 16:42:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121165

Major Changes in 0.16:
Added

Added DMA-BUF encoder support for GStreamer 1.24+
Implemented hardware-accelerated encoding for Intel GPUs
Added environment variable SPICE_CONVERTER_PREFERRED_FORMAT to override c=
onverter format
Multi-plane GL scanout support (new spice_qxl_gl_scanout2())

Changed

Improved memslot to preserve address bits for ARM64 TBI/AMD UAI/Intel LAM
Optimized BGR24/BGRX32 conversion when JCS_EXTENSIONS is defined
Removed GStreamer 0.10 support
Send real time to client, instead of synchronizing on both ends, attempti=
ng to fix latency issue

Fixes

Fixes a GL_DRAW cookie assertion race
Add SSL_OP_NO_RENEGOTIATION fallback path, fixing w/LibreSSL 3.7.2 builds
Fix Win32 builds
Fix TCP_NOPUSH usage on Darwin
---
 .../recipes-support/spice/{spice_git.bb =3D> spice_0.16.0.bb} | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta-networking/recipes-support/spice/{spice_git.bb =3D> spice_0.=
16.0.bb} (95%)

diff --git a/meta-networking/recipes-support/spice/spice_git.bb b/meta-ne=
tworking/recipes-support/spice/spice_0.16.0.bb
similarity index 95%
rename from meta-networking/recipes-support/spice/spice_git.bb
rename to meta-networking/recipes-support/spice/spice_0.16.0.bb
index c9418a1765..6ae63091b3 100644
--- a/meta-networking/recipes-support/spice/spice_git.bb
+++ b/meta-networking/recipes-support/spice/spice_0.16.0.bb
@@ -13,11 +13,9 @@ architectures."
 LICENSE =3D "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c"
=20
-PV =3D "0.15.2"
+SRCREV =3D "a6668fff651726e5d4cfd52cbf8669540970452c"
=20
-SRCREV =3D "0c2c1413a8b387ea597a95b6c867470a7c56c8ab"
-
-SRC_URI =3D "gitsm://gitlab.freedesktop.org/spice/spice;branch=3Dmaster;=
protocol=3Dhttps"
+SRC_URI =3D "gitsm://gitlab.freedesktop.org/spice/spice;branch=3Dmaster;=
protocol=3Dhttps;tag=3Dv0.16.0"
=20
=20
 CVE_STATUS[CVE-2016-0749] =3D "fixed-version: patched since 0.13.2"
--=20
2.51.0



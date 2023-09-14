Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AC06EEAA50
	for <webhook@archiver.kernel.org>; Thu, 14 Sep 2023 15:13:41 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.15075.1694704413842053525
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Sep 2023 08:13:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd83.aul.t-online.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout12.t-online.de (Postfix) with SMTP id 3ADE217435
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Sep 2023 17:13:31 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.167.3]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qgo26-1v2Fcn0; Thu, 14 Sep 2023 17:13:30 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCHv2] webrtc-audio-processing: add recipe for 1.x
Date: Thu, 14 Sep 2023 17:13:19 +0200
Message-ID: <20230914151319.2078983-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1694704411-E8FF6C62-EAFE8EFA/0/0 CLEAN NORMAL
X-TOI-MSGID: 3094cd21-141f-4cd7-8a24-ead45cd1d29e
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Sep 2023 15:13:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104872

Starting with 0.3.80 pipewire has a minimum requirement on
webrtc-audio-processing-1

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../0001-add-missing-header-for-musl.patch    | 33 +++++++++++++++++++
 .../webrtc-audio-processing-1_1.3.bb          | 20 +++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/webrtc-audio-proce=
ssing/webrtc-audio-processing-1/0001-add-missing-header-for-musl.patch
 create mode 100644 meta-multimedia/recipes-multimedia/webrtc-audio-proce=
ssing/webrtc-audio-processing-1_1.3.bb

diff --git a/meta-multimedia/recipes-multimedia/webrtc-audio-processing/w=
ebrtc-audio-processing-1/0001-add-missing-header-for-musl.patch b/meta-mu=
ltimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processi=
ng-1/0001-add-missing-header-for-musl.patch
new file mode 100644
index 000000000..ef1d45466
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-a=
udio-processing-1/0001-add-missing-header-for-musl.patch
@@ -0,0 +1,33 @@
+From 141fb5cbdaa6a883a61b5bf390c849159fc77605 Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Thu, 14 Sep 2023 16:12:32 +0200
+Subject: [PATCH] file_wrapper.h: add missing include for musl
+
+this fixes:
+| In file included from ../webrtc-audio-processing-1.3/webrtc/rtc_base/s=
ystem/file_wrapper.cc:11:
+| ../webrtc-audio-processing-1.3/webrtc/rtc_base/system/file_wrapper.h:8=
6:21: error: 'int64_t' has not been declared
+
+if built with musl libc
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/pulseaudio/we=
brtc-audio-processing/-/merge_requests/37]
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+---
+ webrtc/rtc_base/system/file_wrapper.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/webrtc/rtc_base/system/file_wrapper.h b/webrtc/rtc_base/sys=
tem/file_wrapper.h
+index 42c463c..c34d366 100644
+--- a/webrtc/rtc_base/system/file_wrapper.h
++++ b/webrtc/rtc_base/system/file_wrapper.h
+@@ -13,6 +13,7 @@
+=20
+ #include <stddef.h>
+ #include <stdio.h>
++#include <cstdint>
+=20
+ #include <string>
+=20
+--=20
+2.41.0
+
diff --git a/meta-multimedia/recipes-multimedia/webrtc-audio-processing/w=
ebrtc-audio-processing-1_1.3.bb b/meta-multimedia/recipes-multimedia/webr=
tc-audio-processing/webrtc-audio-processing-1_1.3.bb
new file mode 100644
index 000000000..8d281dad5
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-a=
udio-processing-1_1.3.bb
@@ -0,0 +1,20 @@
+DESCRIPTION =3D "Audio processing bits of the WebRTC reference implement=
ation"
+HOMEPAGE =3D "https://www.freedesktop.org/software/pulseaudio/webrtc-aud=
io-processing/"
+SECTION =3D "audio"
+
+DEPENDS =3D "abseil-cpp"
+DEPENDS:append:libc-musl =3D " libexecinfo"
+
+LICENSE =3D "BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dda08a38a32a340c5d91e13ee86a11=
8f2"
+
+SRC_URI =3D " \
+	http://freedesktop.org/software/pulseaudio/webrtc-audio-processing/webr=
tc-audio-processing-${PV}.tar.xz \
+	file://0001-add-missing-header-for-musl.patch \
+"
+SRC_URI[sha256sum] =3D "2365e93e778d7b61b5d6e02d21c47d97222e9c7deff9e1d0=
838ad6ec2e86f1b9"
+S =3D "${WORKDIR}/webrtc-audio-processing-${PV}"
+
+LDFLAGS:append:libc-musl =3D " -lexecinfo"
+
+inherit meson pkgconfig
--=20
2.41.0



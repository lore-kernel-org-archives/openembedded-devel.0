Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3CD7C54EDA
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 22:44:44 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.36482.1747953875028334704
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 May 2025 15:44:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout12.t-online.de (Postfix) with SMTP id 3273A1F5E
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 May 2025 00:44:33 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.171.126]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uIEeN-2jWeO10; Fri, 23 May 2025 00:44:31 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 1/2] webrtc-audio-processing-2: add recipe
Date: Fri, 23 May 2025 00:44:19 +0200
Message-ID: <20250522224420.107223-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1747953871-167FA4B3-89DEAD44/10/3626336762 SUSPECT URL
X-TOI-MSGID: 589be8a6-da0e-44cc-8535-028263ac3962
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 May 2025 22:44:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117598

- add backport patch to fix build with gcc15
- dont add the patches from webrtc-audio-processing-1
  The fixes have not been merged but it was said that
  those issues should have been fixed

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...8dc4712fa6362b0c839ad57b6b46dce1ba83.patch | 50 +++++++++++++++++++
 .../webrtc-audio-processing-2_2.1.bb          | 20 ++++++++
 2 files changed, 70 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/webrtc-audio-proce=
ssing/webrtc-audio-processing-2/e9c78dc4712fa6362b0c839ad57b6b46dce1ba83.=
patch
 create mode 100644 meta-multimedia/recipes-multimedia/webrtc-audio-proce=
ssing/webrtc-audio-processing-2_2.1.bb

diff --git a/meta-multimedia/recipes-multimedia/webrtc-audio-processing/w=
ebrtc-audio-processing-2/e9c78dc4712fa6362b0c839ad57b6b46dce1ba83.patch b=
/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-=
processing-2/e9c78dc4712fa6362b0c839ad57b6b46dce1ba83.patch
new file mode 100644
index 0000000000..3e2ac72c69
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-a=
udio-processing-2/e9c78dc4712fa6362b0c839ad57b6b46dce1ba83.patch
@@ -0,0 +1,50 @@
+From e9c78dc4712fa6362b0c839ad57b6b46dce1ba83 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Fran=3DC3=3DA7ois=3D20Laignel?=3D <francois@centricula=
r.com>
+Date: Mon, 14 Apr 2025 16:48:19 +0200
+Subject: [PATCH] Fix compilation with gcc-15
+
+This commit fixes compilation errors with gcc-15 (default for Fedora 42)=
.
+
+From [1]:
+
+> Common C++ headers (like <memory>) in GCC 15.0.0 (combined with libstd=
c++)
+> don't transitively include uint64_t anymore.
+
+See also [2].
+
+[1]: https://github.com/ROCm/rocm_smi_lib/pull/198
+[2]: https://github.com/root-project/root/issues/17444
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/pulseaudio/web=
rtc-audio-processing/-/commit/e9c78dc4712fa6362b0c839ad57b6b46dce1ba83.pa=
tch]
+---
+ .../audio_processing/aec3/multi_channel_content_detector.h       | 1 +
+ webrtc/rtc_base/trace_event.h                                    | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/webrtc/modules/audio_processing/aec3/multi_channel_content_=
detector.h b/webrtc/modules/audio_processing/aec3/multi_channel_content_d=
etector.h
+index 2b2f3b8..feb29fd 100644
+--- a/webrtc/modules/audio_processing/aec3/multi_channel_content_detecto=
r.h
++++ b/webrtc/modules/audio_processing/aec3/multi_channel_content_detecto=
r.h
+@@ -12,6 +12,7 @@
+ #define MODULES_AUDIO_PROCESSING_AEC3_MULTI_CHANNEL_CONTENT_DETECTOR_H_
+=20
+ #include <stddef.h>
++#include <cstdint>
+=20
+ #include <memory>
+ #include <optional>
+diff --git a/webrtc/rtc_base/trace_event.h b/webrtc/rtc_base/trace_event=
.h
+index 2aee713..f88a68e 100644
+--- a/webrtc/rtc_base/trace_event.h
++++ b/webrtc/rtc_base/trace_event.h
+@@ -28,6 +28,7 @@
+=20
+ #if !defined(RTC_USE_PERFETTO)
+ #include <string>
++#include <cstdint>
+=20
+ #include "rtc_base/event_tracer.h"
+=20
+--=20
+GitLab
+
diff --git a/meta-multimedia/recipes-multimedia/webrtc-audio-processing/w=
ebrtc-audio-processing-2_2.1.bb b/meta-multimedia/recipes-multimedia/webr=
tc-audio-processing/webrtc-audio-processing-2_2.1.bb
new file mode 100644
index 0000000000..00bf26c750
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-a=
udio-processing-2_2.1.bb
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
+    http://freedesktop.org/software/pulseaudio/webrtc-audio-processing/w=
ebrtc-audio-processing-${PV}.tar.xz \
+    file://e9c78dc4712fa6362b0c839ad57b6b46dce1ba83.patch \
+"
+SRC_URI[sha256sum] =3D "ae9302824b2038d394f10213cab05312c564a038434269f1=
1dbf68f511f9f9fe"
+S =3D "${WORKDIR}/webrtc-audio-processing-${PV}"
+
+LDFLAGS:append:libc-musl =3D " -lexecinfo"
+
+inherit meson pkgconfig
--=20
2.49.0



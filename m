Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BABACCD195
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 13:41:03 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.8906.1760622059158854950
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Oct 2025 06:40:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout12.t-online.de (Postfix) with SMTP id 1A44BF10C
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Oct 2025 15:40:57 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.162.17]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1v9ODs-2sjVuz0; Thu, 16 Oct 2025 15:40:52 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] pipewire: update 1.4.8 -> 1.4.9
Date: Thu, 16 Oct 2025 15:40:33 +0200
Message-ID: <20251016134033.121227-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1760622052-F17F9901-CFEF8510/0/0 CLEAN NORMAL
X-TOI-MSGID: 99b8e302-981c-4c06-9cbe-fe8c39e1e2d7
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Oct 2025 13:41:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120736

PipeWire 1.4.9 (2025-10-09)
This is a small bugfix release that is API and ABI compatible with
previous 1.x releases.
Highlights
  - Fix a regression in node unprepare that would leave nodes running
    and error.
  - Improve ALSA recovery when 3 periods is not supported. Also Improve
    headroom for SOF cards by setting it to the minimal period size by
    default.
  - Remove RestrictNamespaces from the systemd files to allow libcamera
    to load sandboxed IPA modules again.
  - Small fixes and updates.
PipeWire
  - Fix a regression in node unprepare that would leave nodes running
    and error. (#4893)
  - Remove RestrictNamespaces from the systemd files to allow libcamera
    to load sandboxed IPA modules.
Modules
  - Handle fd allocation errors in avahi. (#4913)
  - Fix initial SDP session hash and session-id. (#4852)
  - Fix a potential NULL deref in the profiler. (#4922)
SPA
  - Fix the UMP event compare function. (#4899)
  - Backport a lot of libcamera patches, such as support for colorimetry,
    thread-safety fixes, a lot of cleanups and improvements.
  - Improve ALSA recovery when 3 periods is not supported.
  - Fix a regression in the adapter where it would not always start and
    resume correctly. (#4911)
  - Improve headroom for SOF cards by setting it to the minimal period
    size by default. (#4489)
  - Adapt to newer libcamera changes.
---
 .../pipewire/{pipewire_1.4.8.bb =3D> pipewire_1.4.9.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_1.4.8.bb =3D=
> pipewire_1.4.9.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.8.b=
b b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.9.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.8.bb
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.9.bb
index 8687244f3e..683d5f3ce0 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.8.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.9.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D "dbus ncurses"
=20
-SRCREV =3D "8b43ed5c910e892d53de5a96aa01e9280a5b6650"
+SRCREV =3D "fd60e04525f3a04d90bf50085222e0cc9139b4a4"
 BRANCH =3D "${@oe.utils.trim_version('${PV}', 2)}"
 SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
${BRANCH};protocol=3Dhttps;tag=3D${PV}"
=20
--=20
2.51.0



Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0054E77179
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 11:40:40 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.35013.1733485233043363265
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Dec 2024 03:40:33 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd82.aul.t-online.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout08.t-online.de (Postfix) with SMTP id 97439656
	for <openembedded-devel@lists.openembedded.org>; Fri,  6 Dec 2024 12:40:30 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.35.241]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tJWh9-166LyL0; Fri, 6 Dec 2024 12:40:27 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 1/3] pipewire: update 1.2.6 -> 1.2.7
Date: Fri,  6 Dec 2024 12:40:24 +0100
Message-ID: <20241206114026.2441-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1733485227-457F99EF-758E803C/0/0 CLEAN NORMAL
X-TOI-MSGID: 59694c80-c9dc-41e2-8db0-babac26f22b8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Dec 2024 11:40:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114219

This is a bugfix release that is API and ABI compatible with the previous
1.2.x and 1.0.x releases.

  - Backport support for lazy scheduling.
  - Handle the case where processing would stop when an ALSA driver is
    destroyed.
  - Add support for v4l2loopback in the v4l2 plugin.
  - Small bug fixes and improvements.

  - Invalidate the proxy ID when removed.
  - Backport support for lazy scheduling.
  - Fix profiler stats for async nodes.
  - Fix EARLY_PROCESS again in pw-stream. (#3480)

  - Fix a crasher issue when nodes are created in the wrong order in
    module-filter-chain.
  - Fix unmap bug in lv2 uri tables.
  - Add ratelimit to jack-tunnel xruns.
  - Remove hardcoded limit in filter-chain sofa plugin.
  - Handle the MTU size correctly in module-rtp and handle large MTUs.
    (#4396)
  - Fix JSON float parsing errors in equalizer module. (#4418)

  - Fix crash in audiotestsrc when using spa-inspect (#4365).
  - Improve JSON float infinity checks.
  - Improve resampler performace a little.
  - Make audioconvert only output when there is something to output.
  - Fix regression in v4l2 port flags which would disable support for
    EXPBUF.
  - Handle the case where an ALSA driver is destroyed and the follower
    becomes a driver. Processing would stop. (#4401)
  - Add support for v4l2loopback in the v4l2 plugin.

  - Give a better error message when running out of fds.
  - Ensure positive latency reporting.

  - Fix memory leak in deviceprovider.
  - Fix locking when emitting an error.

  - Fix pw-dot link labels.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../pipewire/{pipewire_1.2.6.bb =3D> pipewire_1.2.7.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_1.2.6.bb =3D=
> pipewire_1.2.7.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.2.6.b=
b b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.2.7.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_1.2.6.bb
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_1.2.7.bb
index b1ee07370..d2aede6d4 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.2.6.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.2.7.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D "dbus ncurses"
=20
-SRCREV =3D "79eebcb72490484e25208971ca15b9e0ea25bd95"
+SRCREV =3D "cc7439187f61dd73b81ca69f5dbccbb52ce970b2"
 SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
1.2;protocol=3Dhttps"
 SRC_URI +=3D "file://0ca64277b317b4836beccaa3248ab9055526811c.patch"
=20
--=20
2.47.0



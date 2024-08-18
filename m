Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6901C52D7C
	for <webhook@archiver.kernel.org>; Sun, 18 Aug 2024 17:12:50 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.192577.1724001165721522184
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Aug 2024 10:12:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout09.t-online.de (Postfix) with SMTP id D65213A2C8
	for <openembedded-devel@lists.openembedded.org>; Sun, 18 Aug 2024 19:12:43 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.172.9]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sfjSN-35dzHt0; Sun, 18 Aug 2024 19:12:43 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] pipewire: update 1.2.1 -> 1.2.2
Date: Sun, 18 Aug 2024 19:13:59 +0200
Message-ID: <20240818171359.3109254-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1724001163-BB7FD848-02C362D3/0/0 CLEAN NORMAL
X-TOI-MSGID: 24df53bc-99ac-4d9a-bc28-3c15eacf5b03
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 18 Aug 2024 17:12:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111838

PipeWire 1.2.2 (2024-07-31)

This is a bugfix release that is API and ABI compatible with the
previous 1.2.x and 1.0.x releases.

Highlights
  - Fix some more fallout of the async nodes rewrite. Fixes some
    crackling, xruns and possibly also some crashes in some cases.
  - Fix freewheeling timeouts in case of xruns. This fixes ardour export.
  - Fix event mixdown in JACK. Fixes qsynth and possibly other apps.
  - Some more small fixes and improvements.

PipeWire
  - Add a new SPA_IO_CLOCK_FLAG_XRUN_RECOVER flag when the process functi=
on
    is called because of xrun recovery.
  - Properly stop nodes in all cases, this avoids spurious xruns and
    scheduling errors. (#4122)
  - Make sure async nodes receive an async link in all cases. Do the
    processing of source output ports slightly differently to make sure w=
e
    don't cause latency for sources. (#4138) (#4133)
  - Fix some races when negotiating and starting nodes. (#4094)
  - Actually include the config.h header to use malloc_trim() to reduce
    memory usage in pulse-server.

Modules
  - Avoid unloading some modules on stream errors because it is possible =
to
    recover from the error. (#4121)
  - Fix a (harmless) warning in module-rtp because of comparing samples a=
nd
    time. (#4095)

SPA
  - Let the freewheel driver detect xrun recovery and handle the timeouts
    correctly. This fixes an issue with ardour export.
  - Remove the HDMI/AC3 profiles. they turn out to fail on some hardware
    with no way to detect this.
  - Signal the eventfd when the loop is full to make sure the other threa=
d
    is woken up to process the queue.

JACK
  - Don't check timestamps when mixing down events. The timestamps are on=
ly
    checked when writing new events with the public API. This fixes an
    issue where qsynth would not receive midi events anymore.
  - Fix the jack_get_time() function, it was returning nano instead of mi=
cro
    seconds.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../pipewire/{pipewire_1.2.1.bb =3D> pipewire_1.2.2.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_1.2.1.bb =3D=
> pipewire_1.2.2.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.2.1.b=
b b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.2.2.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_1.2.1.bb
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_1.2.2.bb
index a938ca632..ab9f0c19d 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.2.1.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.2.2.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D "dbus ncurses"
=20
-SRCREV =3D "d55f5ef60869fcd0b8ea4879b51607efab2eef33"
+SRCREV =3D "e224ccdcb7514bc7417f46c75d137fbee231e7fc"
 SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
1.2;protocol=3Dhttps"
=20
 S =3D "${WORKDIR}/git"
--=20
2.45.2



Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8C26C4345F
	for <webhook@archiver.kernel.org>; Fri, 19 Apr 2024 17:26:23 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.27251.1713547573546838384
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Apr 2024 10:26:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout03.t-online.de (Postfix) with SMTP id C7B1439EA5
	for <openembedded-devel@lists.openembedded.org>; Fri, 19 Apr 2024 19:26:11 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.36.159]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rxs03-1TUKrR0; Fri, 19 Apr 2024 19:26:11 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] pipewire: update 1.0.4 -> 1.0.5
Date: Fri, 19 Apr 2024 19:26:30 +0200
Message-ID: <20240419172630.384771-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1713547571-CBFFCDF1-EA09E3A4/0/0 CLEAN NORMAL
X-TOI-MSGID: 13add7e0-89ba-4b6f-9b7e-feea029d250a
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Apr 2024 17:26:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110065

PipeWire 1.0.5 (2024-04-15)

This is a bugfix release that is API and ABI compatible with previous
1.0.x releases.

Highlights
  - pw_stream can now report timestamps on buffers and the expected
    amount of samples for the resampler.
  - The GStreamer element now has more correct timestamps using the new
    pw_stream timestamps as a fallback.
  - The FFADO module now handles suspend and resume better.
  - A regression in v4l2 was fixed when parsing malformed filters.
  - A potential memory/fd leak was fixed in client-node.
  - Many more small bugfixes and improvements.

PipeWire
  - pw_stream now reports the expected resampler input or output size in
    the pw_time structure. (#3750)
  - pw_stream now also adds a time field to the buffer, which contains th=
e
    time of the graph when the buffer was received in the stream.
  - Fix a compiler error when compiling with -Werror=3Dshadow. (#3915)
  - The config parser will warn when invalid config is detected.

Modules
  - The FFADO module now opens and closes when suspending. This fixes som=
e
    problems when FFADO properties are changed while suspended. (#3558)
  - Filter-chain will now warn when invalid config is detected.
  - Echo-cancel will now handle manage the state of the echo-cancel plugi=
n
    better, making sure run() is not called after deactivate().
  - Fix some potential memory/fd leaks in client-node.

SPA
  - Improve reading the bound ALSA controls.
  - The resampler can now also report the number of expected output sampl=
es.
  - The ALSA ACP device objects have some more properties like the card.i=
d
    and alsa.components. (#3912)
  - Fix a potential string corruption when parsing JSON strings.
  - V4l2 now sets the latency on the port. (#3910)
  - alsa-udev now has an option to expose the device even if busy. (#3914=
)
  - Improve null-audio-sink channel handling. (#3931)
  - v4l2 will now drop the first frame because it often contains wrong
    timestamps or garbage. (#3910)
  - A regression in v4l2 was fixed where invalid/empty properties in the
    filter would make it error early. (#3959)

GStreamer
  - The source now falls back to the new pw_buffer time for the timestamp=
s.

Docs
  - Sync with the master branch.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../pipewire/{pipewire_1.0.4.bb =3D> pipewire_1.0.5.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_1.0.4.bb =3D=
> pipewire_1.0.5.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.4.b=
b b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.5.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.4.bb
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.5.bb
index e9c83dd23..c8ac04d59 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.4.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.5.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D "dbus ncurses"
=20
-SRCREV =3D "f2874ad1c2f7f0b9a1da05cc4f402b3ea3761ee6"
+SRCREV =3D "a2287be601710eea0d073261223ec34b92384c8a"
 SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
1.0;protocol=3Dhttps"
=20
 S =3D "${WORKDIR}/git"
--=20
2.44.0



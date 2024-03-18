Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B894C54E68
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 00:09:20 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.31696.1710720549765960074
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Mar 2024 17:09:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout03.t-online.de (Postfix) with SMTP id A7AC33E17A
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Mar 2024 01:09:05 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.225.66]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rm0Yq-0G0gYT0; Mon, 18 Mar 2024 01:09:04 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] pipewire: update 1.0.3 -> 1.0.4
Date: Mon, 18 Mar 2024 01:09:25 +0100
Message-ID: <20240318000925.1163548-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1710720544-3DA409FB-8D67AF9A/0/0 CLEAN NORMAL
X-TOI-MSGID: 91445667-9d07-4672-8d9b-6f8a51bce1a8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Mar 2024 00:09:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109391

This is a bugfix release that is API and ABI compatible with previous
1.0.x releases.

Highlights

  - Track memfd better to avoid inconsistent memory. Also make sure the
    mixer info is removed correctly in all cases on destroyed ports.
  - Correctly handle removed objects in the metadata.
  - Add an option to set the server and client priorities instead of usin=
g
    a hardcoded value of 88.
  - The FFADO module has been fixed. Audio and MIDI now works with
    the same latency as the JACK driver. This has now also been
    tested with a Focusrite Saffire Pro 14.
  - The JACK library has seen some important fixes. Some ardour crackling
    has been fixed when looping and multiple MIDI ports on a client shoul=
d
    now work.
  - Small bugfixes and improvements.

PipeWire
  - Track memfd better to avoid inconsistent memory. Also make sure the
    mixer info is removed correctly in all cases on destroyed ports.
  - Fix Props param emission again in pw_stream. (#3833)
  - Add MAPPABLE flag to buffer data to indicate that the fd can be
    mmapped directly. Use this on DMABUF from v4l2. (#3840)
  - Correctly handle removed object in the metadata.
  - FreeBSD build and compatibility fixes.
  - Add an option to set the server and client priorities instead of usin=
g
    a hardcoded value of 88.
  - Read config overrides in the right order.
  - Fix PIPEWIRE_QUANTUM rate handling in pw_stream and pw_filter.
  - Fix pw_context_parse_conf_section(), actually use the conf argument.
  - A new pw_stream_get_nsec() and pw_filter_get_nsec() function was adde=
d
    to get the current time of the stream/filter without having to assume=
 a
    particular clock.
  - A new default.clock.quantum-floor property was added to configure the
    absolute lowest buffer-size. (#3908)

docs
  - Many doc updates.

tools
  - Make sure we always quit pw-cli when the server stops. (#3837)
  - pw-top now prints all drivers in batch mode. (#3899)

modules
  - Don't destroy the client in protocol-simple on EAGAIN.
  - Handle IPv6 better in the RTP modules. Fix IPv6 SAP header
    parsing. (#3851)
  - The FFADO module has been fixed. Audio and MIDI now works with
    the same latency as the JACK driver. This has now also been
    tested with a Focusrite Saffire Pro 14. (#3558)

pulse-server
  - Make sure the peer_name is filled to avoid protocol errors.

SPA
  - Small resampler tweaks to improve stability of adaptive resampler.
  - Add ALSA option to control htimestamp autodisable.
  - Avoid some potential crashes in audioconvert when ports are removed.
  - Improve HDMI jack detection on some SOCs.
  - The audioconvert now has a monitor.passthrough option to pass the
    latency information on the monitor ports. (#3888)

GStreamer
  - Don't use timeouts when autoconnect=3Dfalse in pipewiresrc. (#3884)
  - pipewiresrc and pipewiresink can now be automatically selected as
    audio source and sink.
  - An invalid memory access was fixed when destroying the device
    provider.

JACK
  - Remove properties correctly with the object id, not serial.
  - Improve sync with the data thread by pausing the core. Also improve
    handling of port io to avoid invalid buffer access.
  - Fix PIPEWIRE_QUANTUM rate handling.
  - Support multiple MIDI input ports per client. (#3901)
  - The output buffer size is now always correctly set. (#3892)

ALSA
  - Handle errors from eventfd_create correctly.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../pipewire/{pipewire_1.0.3.bb =3D> pipewire_1.0.4.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_1.0.3.bb =3D=
> pipewire_1.0.4.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.3.b=
b b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.4.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.3.bb
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.4.bb
index f1c9f8556..e9c83dd23 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.3.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.4.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D "dbus ncurses"
=20
-SRCREV =3D "6ab86209f23a841de7eac6bc0c1009aceb9ffd87"
+SRCREV =3D "f2874ad1c2f7f0b9a1da05cc4f402b3ea3761ee6"
 SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
1.0;protocol=3Dhttps"
=20
 S =3D "${WORKDIR}/git"
--=20
2.44.0



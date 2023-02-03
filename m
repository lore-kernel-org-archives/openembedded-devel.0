Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCB18C61DA4
	for <webhook@archiver.kernel.org>; Fri,  3 Feb 2023 05:18:37 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.4406.1675401509446194260
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Feb 2023 21:18:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd87.dcpf.telekom.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout10.t-online.de (Postfix) with SMTP id 440631D488
	for <openembedded-devel@lists.openembedded.org>; Fri,  3 Feb 2023 06:18:27 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.46.80]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pNoSk-3RV6Ir0; Fri, 3 Feb 2023 06:18:14 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-multimedia][PATCH] pipewire: update 0.3.64 -> 0.3.65
Date: Fri,  3 Feb 2023 06:18:08 +0100
Message-Id: <20230203051808.3330960-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1675401494-9DA9D0AF-FD919DEF/0/0 CLEAN NORMAL
X-TOI-MSGID: f63a0621-2d97-4411-9f8d-5a30a6bc8312
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Feb 2023 05:18:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100918

This is a bugfix release that is API and ABI compatible with previous
0.3.x releases.

  - Add back the deprecated symbols but make sure a deprecated warning is
    emitted for them. This fixes compilation issues in bindings.
  - Fix an error in the AVX code that could cause crackling in filter-cha=
in
    when using the mixer.
  - The convolver in filter-chain can now select an IR from a list of IRs
    that best matches the current samplerate. Also resampling of the IR
    has been improved.
  - A new native module-combine-stream was added. You can use this to cre=
ate
    a 5.1 device from 3 stereo soundcards, for example, or direct the out=
put
    to multiple sinks at once.
  - Support for Bluetooth MIDI was added. This requires a wireplumber
    addition as well.
  - An ALSA plugin rule was added to tweak the buffer settings in Davinci
    Resolve so that it now runs with acceptable latency. (#1697)
  - Support for compress offload was added using tinycompress. This allow=
s
    compressed formats to be decoded in hardware using ALSA on some devic=
es.
  - Many more buffixes and improvements.

  - Add back the deprecated symbols but make sure a deprecated warning is
    emitted for them. (#2952)
  - Fix a regression when running older servers and newer clients (such a=
s
    flatpaks on older server) where the server would run clients too soon=
,
    causing crashes. (#2964)
  - Ensure that environment variables override any config values.

  - pw-cli has received some improvements in the output.
  - pw-cat can now use ffmpeg to demux streams for compress offload.

  - The convolver IR volume is now preserved after resampling.
  - Adapter ports can now have a custom prefix.
  - module-rt now clamps the realtime priority to the user allowed one if
    it is within an acceptable range. Before it would fall back to RTKit
    immediately.
  - The module-echo-cancel can now have per stream channel layouts which
    makes it possible to link to specific audio ports on a device. (#2939=
)
  - Fix an error in the AVX code that could cause crackling in filter-cha=
in
    when using the mixer. (#2965)
  - The convolver in filter-chain can now select an IR from a list of IRs
    that best matches the current sample-rate.
  - module-pipe-* now better matches the pulseaudio properties. (#2973)
  - A new combine-stream module was added to combine multiple sinks into
    one sink. It is also possible to merge multiple sources into one.
  - module-rtp-source now has match rules to select what SAP sessions
    to stream from. There were also improvements to the buffering and
    latency handling.
  - module-rtp-sink now handles multicast loopback correctly.
  - module-rtp-sink implements min-ptime and max-ptime to control the
    send packet latency.

  - A new modifier flag was added to the video format parser helper to
    allow 0 (linear) as a valid modifier. (#2943)
  - Params includes were reorganized to make it more scalable. Many compr=
essed
    audio formats were added.
  - The alsa pcm plugin now handles invalid values from the driver
    gracefully. (#2953)
  - Fix some potential stuttering cause by wrong scaling and overflow
    of the output buffers in audioconvert. (#2680)
  - Debug output is now also sent to the log instead of stdout. (#2923)
  - A debug context was added to debug macros to implement custom debug
    handling. This is used to redirect the debug of pods to the debug log
    instead of using some custom duplicated code.
  - Fix some warnings for potentially undefined shifts in format
    conversion.
  - Support for compress offload was added using tinycompress. This is mo=
stly
    used on some embedded hardware where decoding of audio formats can be
    done in hardware.

  - Some fixes for LE audio were added.
  - Support for Bluetooth MIDI was added. This requires a wireplumber
    addition as well.
  - Reply OK to empty commands.
  - Improve compatibility with some devices that send stray \n such as
    the Sennheiser HD 350BT. (#2991)

  - Devices with unsupported formats (by the pulseaudio API) are now also
    listed in the pulseaudio API (with invalid formats).
  - The native module-combine-stream is used for module-combine-sink.

  - Make jack.merge-monitor default to true to better match the jack1/2
    behaviour. Add an exception for mixxx, which is more usable with
    unmerged monitors. (#1760)

  - The property handling in the ALSA plugin was improved. alsa.propertie=
s
    and alsa.rules can now be added to the config file.
  - A rule was added to tweak the buffer settings in Davinci Resolve so t=
hat
    it can run with acceptable latency. (#1697)
  - ALSA volume will now also use cubic volumes, like pulseaudio.
  - The ALSA ctl plugin now also uses the client-rt.conf file.
  - A new alsa.volume-method was added to configure cubic or linear volum=
e.
    This can be set per application using the rules.

  - pipewiresrc will now advertize DMABUF support if the pipeline suports
    this.
  - pipewiresrc will now always be a live source unless told otherwise.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../pipewire/{pipewire_0.3.64.bb =3D> pipewire_0.3.65.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_0.3.64.bb =3D=
> pipewire_0.3.65.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.64.=
bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.65.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.64.b=
b
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.65.bb
index f10b47262..bb31c998d 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.64.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.65.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D "dbus ncurses"
=20
-SRCREV =3D "bba452695eb673461c5cf626eec57728991eadf7"
+SRCREV =3D "9558a5d5e0360d8af822431c76ee858a8c7495ac"
 SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
master;protocol=3Dhttps"
=20
 S =3D "${WORKDIR}/git"
--=20
2.34.1



Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF96FC76196
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 05:06:27 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.37380.1681103182684390298
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Apr 2023 22:06:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd75.dcpf.telekom.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout04.t-online.de (Postfix) with SMTP id CE9DC125D6
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 07:06:20 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.163.40.74]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pljjE-19fiLJ0; Mon, 10 Apr 2023 07:06:08 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-multimedia][PATCH] pipewire: update 0.3.67 -> 0.3.68
Date: Mon, 10 Apr 2023 07:05:56 +0200
Message-Id: <20230410050556.1704397-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1681103168-F0FE9C10-6563DFD5/0/0 CLEAN NORMAL
X-TOI-MSGID: 2ad9df31-4fc8-4281-bad2-561b33201251
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 05:06:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102000

This is a bugfix release that is API and ABI compatible with previous
0.3.x releases.

This release contains a huge number of changes, some of which might cause
regressions. Please report anything that seems to fail after the upgrade.
UCM devices in particular might have changed names, profiles and ports th=
at
might require changes in custom scripts.

  - Symbolic links to the pipewire binary are now used instead of recompi=
ling
    the same binary multiple times.
  - Changes to the graph scheduler related to quantum/rate updates and
    calculation of the node states. Things should start and switch betwee=
n
    quantums and rates more smoothly now and especially virtual devices s=
hould
    now only run when required.
  - A new RTP session module was added. This uses the Apple MIDI protocol
    to configure low-latency bidirectional MIDI (and with a PipeWire spec=
ific
    extension, also audio) between machines. OPUS encoding was added to t=
he
    RTP formats. The SAP module was separated from the rtp-sink/source mo=
dule
    to make it more usable.
  - A new runtime debug property was added to all streams and nodes to tr=
igger
    a save of the raw samples to a wav file. Support for this has also be=
en
    added to the echo-canceler to debug potential issues.
  - Module pulse-tunnel has improved rate matching and synchronization
    support. It should also not drift anymore for capture devices.
  - The link-factory now ignores by default the link.passive property. Th=
is means
    that tools like pw-link or jack clients and wireplumber can't make pa=
ssive
    links anymore. The reason is that there is now much more advanced log=
ic in
    PipeWire itself to handle passive links based on node and port proper=
ties.
  - The RAOP sink was ported to new OpenSSL functions. Digest passwords a=
re
    handled correctly now and support for more devices was added.
  - The ACP code was updated with new PulseAudio UCM code: "Create multip=
le
    profiles per verb for conflicting devices". This might change the nam=
es
    of devices, profiles and ports so scripts might need to be updated.
  - Upmixing is disabled again by default. We now ship config files that
    distros can install to enable upmixing again. The reason being that P=
ipeWire
    should not apply fancy DSP processing to audio by default.
  - Many cleanups and bugfixes, including some crashes and memory corrupt=
ion
    bugs.

  - Various FreeBSD compilation fixes.
  - Don't crash when calling _connect twice in stream/filter. (#3091)
  - Links are now installed instead of compiling the pipewire binary
    multiple times.
  - There is now a new core event bound_props that augments the bound_id =
event
    with the global properties. This can be used to get the global.serial=
 among
    other global properties. It also makes it possible in the future to l=
et the
    server allocate unique names or uuids.
  - Fix a bug where the server could go into an infinite reconfigure loop=
 when
    the samplerate of a driver would change.
  - When a samplerate was forced, restore the previous best samplerate wh=
en the
    samplerate is no longer forced. (#2133)
  - Rework how the states of the nodes in the graph are calculated. A mor=
e
    refined algorithm is now used that only runs nodes that need to run.
  - Rework how the quantum change is applied to the graph. Drivers are no=
w
    responsible for using the new updated rate/quantum before starting a =
new
    cycle. This avoids starting a cycle with an old quantum first.
  - pw-stream and pw-filter will now ensure that the Trigger event is cal=
led
    from the main thread.
  - node.force-rate=3D0 will now force the node.rate on the graph, forcef=
ully
    switching the hardware into the new rate if possible. (#3026)
  - Additional checks were added to the thread-loop to check locking orde=
r.
  - Additional checks were added to pw-stream and pw-filter to check if m=
ethods
    are called from the right thread context.

  - A new RTP session module was added. This uses the Apple MIDI protocol
    to configure bidirectional MIDI (or audio) between machines.
  - SAP support was removed from module-rtp-source and module-rtp-sink an=
d
    moved to a separate module. This makes it possible to use the RTP mod=
ules
    without SAP support as well.
  - The echo-cancel module now has support to save the signals to a wav
    file for debugging purposes.
  - The RTP modules now have support for the OPUS codec.
  - The RAOP module was ported to new openssl encryption functions and ha=
ndles
    digest passwords correctly now.
  - module-raop-discover now has match rules to be able to select the str=
eams
    and set properties.
  - Module pulse-tunnel has improved rate matching and synchronization
    support. (#3093)
  - Fix potential memory corruption and infinite loops because
    module-pulse-tunnel was unloaded from the wrong thread.
  - The link-factory now ignores by default the link.passive property. Th=
is means
    that tools like pw-link or jack clients and wireplumber can't make pa=
ssive
    links anymore. The reason is that there is now much more advanced log=
ic in
    PipeWire itself to handle passive links based on node and port proper=
ties.
  - module-echo-cancel will now clear its buffers after a suspend to avoi=
d
    playing stray samples.
  - module-raop-sink will now handle 0 timing_port replies. (#3133)

  - The adapter module now has support for saving the raw audio to a wav
    file for debugging purposes.
  - The ACP code was updated with new PulseAudio UCM code: "Create multip=
le
    profiles per verb for conflicting devices". This might change the nam=
es
    of devices, profiles and ports so scripts might need to be updated.
  - Upmixing was disabled again by default. We now ship config files that
    distros can install to enable upmixing again. (#3081)
  - audioadapter and audioconvert have seen improvements in the experimen=
tal
    non-DSP/passthrough mode.
  - Fix a potential race where the dummy drivers could fail to stop a tim=
er
    and cause endless warnings in the logs.
  - The ALSA plugin has experimental support for IRQ based scheduling. Th=
is
    should decrease latency for some (mostly USB) drivers. This should br=
ing
    latency within JACK latency. More work on this will be done before th=
e
    1.0 release later this year.
  - Audioconvert now has support for volume ramping. (#3046)
  - A new loop method was added the check if a thread is currently runnin=
g the
    loop.
  - channelmix.disable and resample.disable now generate an error when tr=
ue
    and channelmixing or resampling is required in the converter.

  - Fix a crash in some cases when a device was disconnected.
  - Support async transport state changes. This avoids some lockups when =
the
    bluetooth backend is having issues. (#3023)
  - Align BAP sinks. This improves synchronization between earpieces.

  - Improve properties in pw-top and pavucontrol.

  - Improve error handling from pulse-tunnel.
  - Generate silence correctly for unsigned formats as well.
  - Review buffer params. The streams should now just work with 1 or 2
    buffers.
  - module-rtp-send and module-rtp-recv now have support for the OPUS cod=
ec.

  - Make sure we don't call any callbacks anymore when deactivating. (#27=
81)

  - Sort the device by priority in deviceprovider. (#3072)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../pipewire/{pipewire_0.3.67.bb =3D> pipewire_0.3.68.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_0.3.67.bb =3D=
> pipewire_0.3.68.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.67.=
bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.68.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.67.b=
b
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.68.bb
index 0d4dd63f9..2f854236b 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.67.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.68.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D "dbus ncurses"
=20
-SRCREV =3D "26623ff8cb3c9ba774537379a1835c5efb0d5159"
+SRCREV =3D "950c4487e96c7941f58311a066f4ba8289ca984a"
 SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
master;protocol=3Dhttps"
=20
 S =3D "${WORKDIR}/git"
--=20
2.34.1



Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDC12C05027
	for <webhook@archiver.kernel.org>; Sun, 19 Feb 2023 05:46:06 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.28235.1676785563878685719
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Feb 2023 21:46:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout05.t-online.de (Postfix) with SMTP id E4BA5CE11
	for <openembedded-devel@lists.openembedded.org>; Sun, 19 Feb 2023 06:46:01 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.43.64]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pTcWP-0xSPeT0; Sun, 19 Feb 2023 06:46:01 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-multimedia][PATCH] pipewire: update 0.3.65 -> 0.3.66
Date: Sun, 19 Feb 2023 06:45:51 +0100
Message-Id: <20230219054551.6765-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1676785561-DD34B4E4-28EE04DD/0/0 CLEAN NORMAL
X-TOI-MSGID: 10e2a700-f814-433e-9083-e775fb6c14db
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 19 Feb 2023 05:46:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101152

This is a bugfix release that is API and ABI compatible with previous
0.3.x releases.

  - Fix a regression in the pulseaudio module-combine-stream because the =
new
    module-combine-stream was not installed.
  - PipeWire can now generate a limits.d config file with our recommended
    settings for priorities and memlock.

  - Avoid rate switches when the graph is idle.
  - The rate selection algorithm was improved. This ensures minimal perfo=
rmance
    and quality loss when resampling.
  - The default min.quantum was set to 32 again after it got erronously c=
hanged
    to (the too low) 16 in version 0.3.45.
  - Fix compilation issues with rust bindings because of macros in define=
s.
    Work around it for now. (#2952)
  - Invalid file mappings are now refused (#2617 #2914 #3007)
  - Modules, exec and objects can now be loaded depending on conditions. =
One
    example is the X11-bell module that can now be disabled with a custom
    property override.
  - Filter now also supports _trigger_process() to drive the graph.
  - TID is now added to the journald log.
  - PipeWire generates and installs */etc/security/limits.d/25-pw-rlimits=
.conf*
    that by default contains project's recommended settings. Creation of =
the
    pipewire group is left to the distro or user ( `groupadd -r pipewire`=
 ).
    See the rlimits-* Meson options for controlling this behavior.
  - Additionally there is now by default disabled Meson option that will
    install */etc/security/limits.d/20-pw-defaults.conf* with the current=
 Linux
    default memlock value. Distros with only kernels >=3D5.16 or always u=
sing
    systemd v251 or newer do not need this. But all other builds should s=
et the
    `-Dpam-defaults-install=3Dtrue` Meson option to ensure that the memlo=
ck value
    is always large enough. Thanks to Rickie Schroeder for pointing out t=
hat
    the default Linux memlock value has been somewhat recently increased.

  - Install module-combine-stream.
  - RTP source now has support for custom channel names.
  - RTP source will now stop when inactive.
  - There is now
  - Filter-chain has a new mysofa based spacializer plugin.
  - The RTP modules can now use direct clock timestamps to send and recei=
ve
    packets. This makes it possible to synchronize sender and receiver wi=
th
    a PTP clock, for example.
  - Filter-chain now has an invert plugin to invert the polarity of a
    signal. (#3008)

  - There is now an option to set the channels used for probing Pro Audio
    devices. This could unlock more samplerates for some devices when the=
y are
    probed with fewer channels. (#2990)
  - Support was added for other clocks than the MONOTONIC clock in the
    driver nodes. This can be used to synchronize the graph to a PTP cloc=
k,
    for example.
  - The ALSA source has some more headroom when rate matching to avoid
    stuttering when following another driver.
  - libcamera controls are now mapped to standard PipeWire property value=
s.
  - The channelmixer has seen some improvements. MONO and undefined chann=
el
    layouts are now upmixed and downmixed more correctly. (#3010)

  - Many BAP support fixes.

  - The gstreamer elements now support buffer video metadata so that stri=
des
    are correctly handled.
  - pipewiresrc will now error out correctly in more cases. (#2935)

  - The frame to/from time functions are improved to also work with negat=
ive
    time and frame offsets.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../pipewire/{pipewire_0.3.65.bb =3D> pipewire_0.3.66.bb}       | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_0.3.65.bb =3D=
> pipewire_0.3.66.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.65.=
bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.66.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.65.b=
b
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.66.bb
index bb31c998d..a7c77463e 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.65.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.66.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D "dbus ncurses"
=20
-SRCREV =3D "9558a5d5e0360d8af822431c76ee858a8c7495ac"
+SRCREV =3D "08b0ed65765a1033424a5c0d897a392a61f8a2a3"
 SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
master;protocol=3Dhttps"
=20
 S =3D "${WORKDIR}/git"
@@ -256,6 +256,8 @@ FILES:${PN} =3D " \
     ${systemd_user_unitdir} \
     ${bindir}/pipewire \
     ${bindir}/pipewire-avb \
+    ${bindir}/pipewire-aes67 \
+    ${sysconfdir}/security/limits.d \
 "
=20
 RRECOMMENDS:${PN}:class-target +=3D " \
--=20
2.34.1



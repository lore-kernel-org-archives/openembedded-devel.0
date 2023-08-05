Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C5D4EB64DD
	for <webhook@archiver.kernel.org>; Sat,  5 Aug 2023 05:27:39 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.1247.1691213249746349708
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Aug 2023 22:27:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout05.t-online.de (Postfix) with SMTP id 8A8B67AAA
	for <openembedded-devel@lists.openembedded.org>; Sat,  5 Aug 2023 07:27:27 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.224.235]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qS9p1-1yXDDF0; Sat, 5 Aug 2023 07:27:27 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] pipewire: update 0.3.75 -> 0.3.77
Date: Sat,  5 Aug 2023 07:27:09 +0200
Message-ID: <20230805052709.12302-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1691213247-348C816C-D66CC2B9/0/0 CLEAN NORMAL
X-TOI-MSGID: 7adc7327-2727-43b7-8348-e71600c4d347
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Aug 2023 05:27:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104231

This is a quick bugfix release that is API and ABI compatible with previo=
us
0.3.x releases.

  - Fix a bug in ALSA source where the available number of samples was mi=
scaluclated
    and resulted in xruns in some cases.
  - A new L permission was added to make it possible to force a link betw=
een
    nodes even when the nodes can't see eachother.
  - The VBAN module now supports midi send and receive as well.
  - Many cleanups and small fixes.

  - Global objects now only show permissions that apply to them. The perm=
issions
    required to perform various API calls are documented.
  - A new L permission was added to make it possible to force a link betw=
een
    nodes even when the nodes can't see eachother.
  - Config files need to end with .conf.
  - The client.api is added the to global properties of a node.

  - The VBAN module now supports midi send and receive as well.
  - Fix module-profiler alignment and make sure we don't overrun our buff=
ers with
    many nodes.
  - Protect libcanberra calls with a mutex because it is not thread safe.=
 (#2834)

  - Support older compilers for spa_clear_ptr().
  - Fix a bug in ALSA source where the available number of samples was mi=
scaluclated
    and resulted in xruns. (#3395)
  - Don't set inotify on /dev but on the videoX devices directly. Setting=
 inotify
    on /dev would cause a lot of spurious wakeups and lock contention in =
the
    fsnotify subsystem on some benchmarks.
  - Audioconvert now rate limits the warnings when it runs out of buffers=
. (#3384)

  - Some bugs and inconsistencies were fixed in device lookup.
  - Improve subscribe event emission, detect changes to the sink or the m=
onitor
    and send the right sink/source event. (#3388)

  - The libjack.so now has a minor version of 3 and a micro version of th=
e pipewire
    version.
  - JACK clients will now see portregistration from other jack clients wh=
en they
    activate/deactivate like real JACK. (#3260)

  - Use some more autoptr cleanups, fix some leaks.

Older versions:

This is a quick bugfix release that is API and ABI compatible with previo=
us
  - LE Audio support is now enabled by default when liblc3 is available n=
ow that
    bluez has support for detecting the hardware features.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../pipewire/{pipewire_0.3.75.bb =3D> pipewire_0.3.77.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_0.3.75.bb =3D=
> pipewire_0.3.77.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.75.=
bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.77.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.75.b=
b
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.77.bb
index 72533310cb..d4b725ba34 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.75.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.77.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D "dbus ncurses"
=20
-SRCREV =3D "a3bd0f7a0a8dec9045deeb5eb3eb92b09ff75d57"
+SRCREV =3D "31cd694602cc37ada3a6d02a5a381f4e3933ecef"
 SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
master;protocol=3Dhttps"
=20
 S =3D "${WORKDIR}/git"
--=20
2.41.0



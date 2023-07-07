Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D67EEB64D9
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 14:59:10 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.14637.1688741946033433304
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Jul 2023 07:59:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout04.t-online.de (Postfix) with SMTP id BB37323298
	for <openembedded-devel@lists.openembedded.org>; Fri,  7 Jul 2023 16:59:03 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.154.160.21]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qHmvF-28GnZ30; Fri, 7 Jul 2023 16:59:01 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] pipewire: upgrade 0.3.72 -> 0.3.73
Date: Fri,  7 Jul 2023 16:58:47 +0200
Message-Id: <20230707145847.10860-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1688741941-E9FF6029-BC0429C9/0/0 CLEAN NORMAL
X-TOI-MSGID: 92a7a414-1e21-434f-aaff-8f5ac2cd682f
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jul 2023 14:59:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103712

This is a bugfix release that is API and ABI compatible with previous
0.3.x releases.

  - Fixes an ALSA resume after suspend error.
  - Handle and disable seemingly wrong hires timestamps from ALSA.
  - Filter-chain now has loadable plugin modules. The LV2 and sofa plugin=
s are
    moved to a separate .so file to make things more modular.
  - Rate changes in the graph should now be handled more gracefully by lo=
opback
    and filter-chain.
  - A regression in the rtp-sap module was fixed where it would in some c=
ases
    fail to start.
  - A potential crash in the peaks resampler was fixed.
  - Many cleanups and other small bug fixes.

  - Fix a potential segfault when no fallback driver was set in the confi=
g.
  - Improve OPUS detection.
  - Add ASYNC flag to pw-filter and pw-stream when queue/dequeue is not c=
alled
    from the process function. This ensure we allocate an extra buffer.
  - Discard pending process callbacks when disconnecting. (#3314)
  - Cleanups and improvements to the debug environment variable parsing.
  - The graph rate was tweaked to better handle very low rates such as th=
ose
    requested by pavucontrol when it does the signal monitoring.

  - An example filter module was added.
  - Filter-chain and loopback now disable the resamplers if no rate is sp=
ecified
    and will always follow the graph rate.
  - Improve setup of filter-chain. The graph is now created when starting
    because this ensure the target graph rate is known.
  - Filter-chain can now link notify ports to control ports in the graph.
  - Filter-chain now has loadable plugin modules. The LV2 and sofa plugin=
s are
    moved to a separate .so file.
  - A regression in the rtp-sap module was fixed where it would in some c=
ases
    fail to start.
  - Module-rt now has options to disable rlimits, portal and rtkit.
  - module-raop-discover now has an options to set the latency. (#3247)

  - pw-cat now supports overriding all stream properties.

  - Disable rate negotiation when the resampler is disabled. We will alwa=
ys
    follow the graph rate.
  - Set device.icon property for UCM ports as well.
  - Improve ALSA recover when using hires timestamps. This fixes some pro=
blems
    after resume from suspend. (#3315)
  - ALSA will now warn and disable hires timestamp when they seem wrong.
    They can also be disabled manually with a property.
  - V4l2 will now gracefully handle ENOTTY when enumerating frame sizes a=
nd
    frame rates. (#3325)
  - A potential crash in the peaks resampler was fixed. (#3320)

  - A client crash in pavucontrol is avoided by always setting a card nam=
e.
  - The graph rate is now taken correctly when using the FIX flags. (#331=
7)
  - An option was added to ignore the FIX flags of a stream. Also the
    documentation for those options was updated. (#3317)
  - module-raop-discover now support latency_msec. (#3247)

  - Remove an assert and issue a warning/recover instead when a buffer is=
 too
    small.

  - The device provider does locking when destroying the registry.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../pipewire/{pipewire_0.3.72.bb =3D> pipewire_0.3.73.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_0.3.72.bb =3D=
> pipewire_0.3.73.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.72.=
bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.73.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.72.b=
b
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.73.bb
index a2f9b8804f..b27886d0cc 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.72.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.73.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D "dbus ncurses"
=20
-SRCREV =3D "4cc22d60d2280fb3c771e6a246e79c90819fd485"
+SRCREV =3D "44deacbc670ccf6c02d66a48b756a16167d8048f"
 SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
master;protocol=3Dhttps"
=20
 S =3D "${WORKDIR}/git"
--=20
2.34.1



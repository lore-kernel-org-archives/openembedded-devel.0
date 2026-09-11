Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 259BBC88E50
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 09:17:47 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35503.1789118260741484981
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Sep 2026 02:17:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=OyTD+Y35;
 spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd97.aul.t-online.de (fwd97.aul.t-online.de [10.223.144.123])
	by mailout03.t-online.de (Postfix) with SMTP id 3EC50E476
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2026 11:17:38 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.228.20]) by fwd97.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x4xO4-3qOZou0; Fri, 11 Sep 2026 11:17:36 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] wireplumber: update 0.5.15 -> 0.5.17
Date: Fri, 11 Sep 2026 11:17:32 +0200
Message-ID: <20260911091732.20761-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789118256-19FF89A9-1E88268B/0/0 CLEAN NORMAL
X-TOI-MSGID: 8d2d960d-557e-405c-82b0-507f43403901
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789118258; i=f_l_k@t-online.de;
	bh=cElcSzpxHAzkVetzhjhtX9qX+8vS2KkmuAB0TgvhuZQ=;
	h=From:To:Subject:Date;
	b=OyTD+Y35syB1evPlsylpi0hdDLrA1KKl3xxpCofYHDr6PRlGVSIArksmutpuwja9T
	 gE7QwPtQ9BWcHiyR5loU23ZQ8U1aOw5vaWs5STXk8cYkJqro8gKR4HFQ2/ChxBnr5I
	 xV8ysAJ2cbC76pqhztcOSM+IGMqlgMLWCWe4ZwxenkAUrqkdcOJ5tfpwLhmu28WW0z
	 TZe9wKE7z5/j7NaFJCQoaxBlHewhDf9KNIEnKpaCEIXax1bH4aWH+TIdUCVY8aQ+Sf
	 TyJ1JueQCo9pgrJJc2z0jIpyj2yGno07oexjI7cn9kGqYBZLonwE7foZwIsGtRpB8I
	 P9WwYETudGlFw==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2026 09:17:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129957

0.5.16 is skipped because it contains a regression that broke object
destruction in the monitor scripts; upstream recommends to avoid it.

WirePlumber 0.5.17
~~~~~~~~~~~~~~~~~~

Fixes:

  - Fixed factory-created device, node and link objects to stop sharing
    ownership with their registry global, fixing a regression from the
    ``WpClientContext`` introduced in 0.5.16 that broke proper object
    destruction in the monitor scripts (#999; !890, !891)

  - Improved ``default-nodes`` to also rank on the object.serial of a nod=
e's
    device and on the node's own object.serial, so that route priorities =
are
    only compared between nodes of the same card, and the election no lon=
ger
    changes for no apparent reason when all other keys are equal (!893)

  - Fixed ``m-lua-scripting`` to include the offending Lua type name in P=
OD
    build errors (!889)

WirePlumber 0.5.16
~~~~~~~~~~~~~~~~~~

Additions & Enhancements:

  - Added ``WpClientContext``, a second PipeWire connection running on it=
s own
    thread that hosts WirePlumber's in-process media objects (loopback an=
d
    filter-chain modules, ``LocalNode()``, ``SpaDevice()``), so that slow=
 Lua
    event hooks on the main thread no longer stall their control path; th=
e
    export core is retired in favor of this new client context (!873)

  - Added new ``WpDynamicRules`` class for matching rules with conditions=
, and
    updated ``filter-graph.lua`` to use it, allowing filter-graphs to be =
loaded
    and unloaded dynamically depending on whether other objects exist or =
not
    (!872)

  - Added ``wp_impl_module_unload()`` and ``LocalModule:unload()``, givin=
g
    scripts control to unload implemented modules at any time (!881)

  - Added a ``volume-set`` action to ``module-mpris`` to allow adjusting =
the
    volume of a remote MPRIS2 player from Lua (!860)

  - Added ``--yes`` flag to ``wpctl reset`` to skip the confirmation prom=
pt
    (!850)

  - Added ``device.form-factor`` ALSA node property for use in ALSA rules=
, and
    made HDMI node descriptions include the name of the connected display=
 when
    available (!862, !874)

  - Refactored the Bluetooth monitor to use event hooks for handling devi=
ces
    and nodes, matching the design already used by the v4l2 and libcamera
    monitors (#916; !803)

  - Overhauled the documentation: filled in every stub and missing Lua AP=
I and
    C API page, added a getting started guide, new ``wireplumber(1)`` and
    ``wpexec(1)`` man pages, and removed stale pages describing features
    renamed or removed in the 0.4 to 0.5 transition (!877)

Fixes:

  - Fixed monitors to always activate all device and node features, and m=
ade
    monitors wait for successful device activation before storing the dev=
ices
    and nodes as a managed objects (#986, #996; !883, !886, !876)

  - Fixed ``find-preferred-profile`` to skip a configured preferred profi=
le
    that is not available, instead of leaving no profile selected (#993; =
!884)

  - Fixed ``permission-manager`` to not include destroyed globals when
    rebuilding the permissions array on ``objects-changed``, fixing some
    pipewire warnings in the log (!882, !888)

  - Fixed a memory leak in ``WpSpaDevice`` by only collecting params from=
 our
    own requests (#988; !879)

  - Fixed ``filter-graph`` to correctly apply graphs defined for the same=
 node
    across multiple configuration files (!870)

  - Fixed several nil-related crashes and correctness issues in Lua scrip=
ts
    (#972; !861, !864, !866, !869)

  - Improved ``apply-access`` to directly attach an already-active permis=
sion
    manager to the client instead of wastefully re-running activation on =
it
    (#973; !868)

  - Improved ``state-stream`` change detection to avoid spurious state wr=
ites
    from volume rounding and from unset or empty properties (#974; !867)

  - Fixed ``default-nodes`` to ignore smart filters when selecting the be=
st
    default node (!857)

  - Removed the ``node.filter.forward-format`` setting and its script, wh=
ich
    only worked with 0.4 and never really worked with 0.5 (!878)

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{wireplumber_0.5.15.bb =3D> wireplumber_0.5.17.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/wireplumber/{wireplumber_0.5.1=
5.bb =3D> wireplumber_0.5.17.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0=
.5.15.bb b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5=
.17.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.=
5.15.bb
rename to meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.=
17.bb
index 9f7092dfa9..3dd58a70c4 100644
--- a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.15.b=
b
+++ b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.17.b=
b
@@ -10,7 +10,7 @@ DEPENDS =3D "glib-2.0 glib-2.0-native lua pipewire \
     ${@bb.utils.contains("DISTRO_FEATURES", "gobject-introspection-data"=
, "python3-native python3-lxml-native doxygen-native", "", d)} \
 "
=20
-SRCREV =3D "bc4fa8f5e84806f86530c97cb35283eecc3ec081"
+SRCREV =3D "11e501181fb87dc8e72e55156d672109fbad2434"
 SRC_URI =3D " \
     git://gitlab.freedesktop.org/pipewire/wireplumber.git;branch=3Dmaste=
r;protocol=3Dhttps;tag=3D${PV} \
     file://run-ptest \
--=20
2.55.0



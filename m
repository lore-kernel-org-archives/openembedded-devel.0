Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5E1EC27C65
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 17:52:23 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.732.1718128341452524243
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jun 2024 10:52:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout10.t-online.de (Postfix) with SMTP id A8DD12B05E
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Jun 2024 19:52:19 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.37.218]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sH5fM-3yA4SP0; Tue, 11 Jun 2024 19:52:16 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 1/2] wireplumber: update 0.5.2 -> 0.5.3
Date: Tue, 11 Jun 2024 19:53:05 +0200
Message-ID: <20240611175306.57570-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1718128336-97FFCED6-B0AD49E1/0/0 CLEAN NORMAL
X-TOI-MSGID: 3b88ce0e-c5d1-44e8-86c7-991757bd595c
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Jun 2024 17:52:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110828

WirePlumber 0.5.3
~~~~~~~~~~~~~~~~~

Fixes:

  - Fixed a long standing issue that would cause many device nodes to hav=
e
    inconsistent naming, with a '.N' suffix (where N is a number >=3D 2) =
being
    appended at seemingly random times (#500)

  - Fixed an issue that would cause unavailable device profiles to be sel=
ected
    if they were previously stored in the state file, sometimes requiring=
 users
    to manually remove the state file to get things working again (#613)

  - Fixed an occasional crash that could sometimes be triggered by hoveri=
ng
    the volume icon on the KDE taskbar, and possibly other similar action=
s
    (#628, !644)

  - Fixed camera device deduplication logic when the same device is avail=
able
    through both V4L2 and libcamera, and the libcamera one groups multipl=
e V4L2
    devices together (#623, !636)

  - Fixed applying the default volume on streams that have no volume prev=
iously
    stored in the state file (#655)

  - Fixed an issue that would prevent some camera nodes - in some cases -
    from being destroyed when the camera device is removed (#640)

  - Fixed an issue that would cause video stream nodes to be linked with =
audio
    smart filters, if smart audio filters were configured (!647)

  - Fixed an issue that would cause WP to re-activate device profiles eve=
n
    though they were already active (!639)

  - Configuration files in standard JSON format (starting with a '{', amo=
ng
    other things) are now correctly parsed (#633)

  - Fixed overriding non-container values when merging JSON objects (#653=
)

  - Functions marked with WP_PRIVATE_API are now also marked as
    non-introspectable in the gobject-introspection metadata (#599)

Improvements:

  - Logging on the systemd journal now includes the log topic and also th=
e log
    level and location directly on the message string when the log level =
is
    high enough, which is useful for gathering additional context in logs
    submitted by users (!640)

  - Added a video-only profile in wireplumber.conf, for systems where onl=
y
    camera & screensharing are to be used (#652)

  - Improved seat state monitoring so that Bluetooth devices are only ena=
bled
    when the user is active on a local seat, instead of allowing remote u=
sers
    as well (!641)

  - Improved how main filter nodes are detected for the smart filters (!6=
42)

  - Added Lua method to merge JSON containers (!637)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../wireplumber/{wireplumber_0.5.2.bb =3D> wireplumber_0.5.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/wireplumber/{wireplumber_0.5.2=
.bb =3D> wireplumber_0.5.3.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0=
.5.2.bb b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.=
3.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.=
5.2.bb
rename to meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.=
3.bb
index 6ab48285c..c52f22aad 100644
--- a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.2.bb
+++ b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.3.bb
@@ -10,7 +10,7 @@ DEPENDS =3D "glib-2.0 glib-2.0-native lua pipewire \
     ${@bb.utils.contains("DISTRO_FEATURES", "gobject-introspection-data"=
, "python3-native python3-lxml-native doxygen-native", "", d)} \
 "
=20
-SRCREV =3D "b302ebd6ab66fd538191d22db4ebe02bcef87a91"
+SRCREV =3D "65e4ae83b994616401fc5859e00d5051b72518ba"
 SRC_URI =3D " \
     git://gitlab.freedesktop.org/pipewire/wireplumber.git;branch=3Dmaste=
r;protocol=3Dhttps \
     file://90-OE-disable-session-dbus-dependent-features.lua \
--=20
2.45.1



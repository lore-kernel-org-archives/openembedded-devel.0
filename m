Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FED9EB64DD
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 19:40:52 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.15888.1689968450934519133
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jul 2023 12:40:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd77.dcpf.telekom.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout04.t-online.de (Postfix) with SMTP id B6138AF5A
	for <openembedded-devel@lists.openembedded.org>; Fri, 21 Jul 2023 21:40:48 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.33.171]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qMvzc-3PUG6D0; Fri, 21 Jul 2023 21:40:48 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] pipewire: update 0.3.73 -> 0.3.75
Date: Fri, 21 Jul 2023 21:40:32 +0200
Message-Id: <20230721194032.2185514-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1689968448-1281C931-229C4683/0/0 CLEAN NORMAL
X-TOI-MSGID: 2162f5f5-42b9-4376-8772-10ec7356b5da
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Jul 2023 19:40:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103983

This is a bugfix release that is API and ABI compatible with previous
0.3.x releases.

  - Link permissions between nodes are now enforced. This avoids potentia=
l portal
    managed screencast nodes to link to the camera even though it was not=
 assigned
    permissions to do so by the session manager.
  - Libcamera and v4l2 devices now have properties so that duplicates can=
 be
    filtered out by the session manager.
  - A bug with draining was fixed where a buffer would be marked EMPTY an=
d would not
    play when it contained drained samples. (#3365)
  - Many fixes and improvements.

  - Permissions for links between nodes are now enforced. The link will n=
ow check
    that the owner clients of the nodes can see eachother before allowing=
 the link.
    This avoids screensharing clients to accidentally being linked to the=
 camera
    nodes by the session manager. A side effect is that patchbay tools wi=
ll no longer
    be able to link portal managed screencast nodes to the camera, for th=
is we need
    a new permission for those patchbay clients. (wireplumber#218)
  - The stream.rules/filter.rules are now evaluated when connecting the s=
tream/filter
    so that more properties can be matched. (#3355)
  - Move some internal events from the context to the nodes to better han=
dle per-node
    threads in the future.
  - The thread-loop will now signal when the thread is started.

  - A timestamp workaround in module-raop was reverted because it does no=
t work
    in all cases. Instead latency was increased to 1.5 seconds, which als=
o makes
    the problematic device in question work. (#3247)
  - The profiler module was reworked a bit to use the new node realtime e=
vents. It
    should now also handle dynamically added and removed drivers.
  - The module-rt now does the rtkit calls from a separate thread so that=
 it does
    not block the main thread. This could cause deadlocks during startup =
in some
    cases. (#3357)

  - Atomic operation macros were move from internal pipewire API to publi=
c API.
  - The video-info structure now has a new SPA_VIDEO_FLAG_MODIFIER_FIXATI=
ON_REQUIRED
    flag to instruct the application to fixate the modifiers. This simpli=
fies some
    logic in applications a lot.
  - The libcamera and v4l2 nodes now have properties to enumerate the dev=
ice id
    they are using. This can be used to match v4l2 devices and libcamera =
devices
    and filter out duplicates.
  - A bug with draining was fixed where a buffer would be marked EMPTY an=
d would not
    play when it contained drained samples. (#3365)

This is a quick bugfix release that is API and ABI compatible with previo=
us
  - Merge scope based cleanup macros.
  - Add ratelimit function.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../pipewire/{pipewire_0.3.73.bb =3D> pipewire_0.3.75.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_0.3.73.bb =3D=
> pipewire_0.3.75.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.73.=
bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.75.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.73.b=
b
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.75.bb
index b27886d0cc..72533310cb 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.73.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.75.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D "dbus ncurses"
=20
-SRCREV =3D "44deacbc670ccf6c02d66a48b756a16167d8048f"
+SRCREV =3D "a3bd0f7a0a8dec9045deeb5eb3eb92b09ff75d57"
 SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
master;protocol=3Dhttps"
=20
 S =3D "${WORKDIR}/git"
--=20
2.39.3



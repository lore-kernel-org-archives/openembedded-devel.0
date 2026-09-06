Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 595D5C79FA6
	for <webhook@archiver.kernel.org>; Sun,  6 Sep 2026 09:37:31 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11202.1788687443912957015
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Sep 2026 02:37:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=KNzmYfR7;
 spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd94.aul.t-online.de (fwd94.aul.t-online.de [10.223.144.120])
	by mailout02.t-online.de (Postfix) with SMTP id 6F0D8E24F
	for <openembedded-devel@lists.openembedded.org>; Sun,  6 Sep 2026 11:37:21 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.35.20]) by fwd94.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x39JO-22AhJh0; Sun, 6 Sep 2026 11:37:18 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 02/15] gnome-session: upgrade 49.3 -> 50.1
Date: Sun,  6 Sep 2026 11:37:00 +0200
Message-ID: <20260906093713.797648-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260906093713.797648-1-f_l_k@t-online.de>
References: <20260906093713.797648-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1788687438-017F9956-4A0D1A8A/0/0 CLEAN NORMAL
X-TOI-MSGID: 73363d83-39b8-4543-a9c3-802e6641cf5c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1788687441; i=f_l_k@t-online.de;
	bh=xiMVudEZSqJyp+KFc3qN2bS4j302uokF1f6GZGSMPtY=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=KNzmYfR7G74UmtJICjqU0SefrpU6Qo6UdBdH4bi/8qKRaUCrMeeKWSU5RQgHBlgFo
	 YQyy6symP2io0WNvXnusTaq8fmhyqVE5M0/znRbENIN+rEKkZE+ktTgNy8N7tNeb0W
	 MJQv/FZbrCxGRWv6ih9thZFkg+xYs55YLZU5Fpi2Xhkwfd8DbPfrh0ftP+iYsGQw8h
	 XBhYUVBLg8sPB7Jy5LpV65GFeE2Mui479n0gYo+CsgAkJngamYcK5RP4zNHEha4BwI
	 DZIwDpFT/ebFp0h8JpW3LHR7b8PYtll/Olkf0jtse0n2xn9c5IXfuTVv89rGZhHFal
	 qIeBHwktlgGAA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 06 Sep 2026 09:37:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129785

The X11 session support and its x11 meson option were removed upstream,
drop the corresponding PACKAGECONFIG.

Build tested on corei7-64.

AI-Generated: Uses Claude Code (Claude Fable 5.1)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-session_49.3.bb =3D> gnome-session_50.1.bb}         | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-session/{gnome-session_49.3.bb =3D=
> gnome-session_50.1.bb} (77%)

diff --git a/meta-gnome/recipes-gnome/gnome-session/gnome-session_49.3.bb=
 b/meta-gnome/recipes-gnome/gnome-session/gnome-session_50.1.bb
similarity index 77%
rename from meta-gnome/recipes-gnome/gnome-session/gnome-session_49.3.bb
rename to meta-gnome/recipes-gnome/gnome-session/gnome-session_50.1.bb
index 8ef1944ae3..af9ff91fbb 100644
--- a/meta-gnome/recipes-gnome/gnome-session/gnome-session_49.3.bb
+++ b/meta-gnome/recipes-gnome/gnome-session/gnome-session_50.1.bb
@@ -14,15 +14,12 @@ inherit gnomebase gettext gsettings upstream-version-=
is-even mime mime-xdg manpa
=20
 REQUIRED_DISTRO_FEATURES =3D "systemd"
=20
-SRC_URI[archive.sha256sum] =3D "b424a90cfe51de4941b791a5102aeaadb2c62c18=
5522a21f71cb485270053fe1"
+SRC_URI[archive.sha256sum] =3D "6289b6afa44d3e4c999ce5761ff8b2c10ba309f5=
5f9425f2b13f98208c81f6fb"
=20
 UPSTREAM_CHECK_URI =3D "https://gitlab.gnome.org/GNOME/gnome-session/-/t=
ags"
 UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)"
=20
-PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
-
 PACKAGECONFIG[docbook] =3D "-Ddocbook=3Dtrue, -Ddocbook=3Dfalse"
-PACKAGECONFIG[x11] =3D "-Dx11=3Dtrue, -Dx11=3Dfalse,virtual/libx11"
 PACKAGECONFIG[manpages] =3D "-Dman=3Dtrue, -Dman=3Dfalse,xmlto-native li=
bxslt-native"
=20
 FILES:${PN} +=3D " \
--=20
2.55.0



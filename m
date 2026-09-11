Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2557C88E50
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 08:41:03 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34844.1789116055551497805
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Sep 2026 01:40:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=jA8bb9Rb;
 spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout12.t-online.de (Postfix) with SMTP id 74B4EE60E
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2026 10:40:17 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.228.20]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x4wnw-0ddF2G0; Fri, 11 Sep 2026 10:40:16 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] glycin: Install the loaders along with libglycin
Date: Fri, 11 Sep 2026 10:39:58 +0200
Message-ID: <20260911083958.42600-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789116016-DE1409C6-73D759B4/0/0 CLEAN NORMAL
X-TOI-MSGID: 17997219-4ab2-4992-bb5a-c88cf6ced7a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789116017; i=f_l_k@t-online.de;
	bh=I+QOIfy3JEhBpf5JrlCfmTjhqbXJe/vhp/bJzrqZS8w=;
	h=From:To:Subject:Date;
	b=jA8bb9RbBmB3+wfwvdjS5r/v+brCnsaeWk8boGQDtnuStMgWAndx8d3Yzhr/ECVGl
	 7ZdyWs4ASqBIEIjclXLR7ePuTcqd8RgzStDG43ZzkLk2ZLsLtb1U5vwMwuo7ZRNRxh
	 YcAbsg4LK9v9UIwo/404QTtzF4UF60MESe0KkdRLPeyDfdH8zvPIDsbaT0dR/74ZgD
	 p0Y+5w/cQ5ixQxKPXgwZstAnHof6M3DAKnW6aAPnZkkX3T/OxSMNEodgTd6gfwizOM
	 PY/X8N/BQE+eTSI8E9HAxTu5Hoa0UehJYgWShyQIvYYkGksCKvD0nF3Kb1/cqKH/R0
	 5xczHsLaLrWCw==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2026 08:41:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129955

libglycin spawns the sandboxed loader binaries from
${libexecdir}/glycin-loaders at runtime, so a rootfs that only carries
libglycin-2.so cannot decode a single image. Nothing pulled in the
loaders package, which left users of libglycin (gnome-shell wallpapers,
nautilus) without any decoder at all.

Let ${PN} rdepend on ${PN}-loaders whenever loaders are built, and make
the loaders -> thumbnailer dependency a recommendation so the runtime
dependency graph stays free of cycles.

Tested by rebuilding gnome-image: libglycin-2-loaders and
libglycin-2-thumbnailer are now part of the rootfs manifest and
/usr/libexec/glycin-loaders/ carries the image-rs, jxl and svg loaders.

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/glycin/glycin_2.1.5.bb | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-gnome/glycin/glycin_2.1.5.bb b/meta-gnome=
/recipes-gnome/glycin/glycin_2.1.5.bb
index 6fce80d4ec..a34c2425a2 100644
--- a/meta-gnome/recipes-gnome/glycin/glycin_2.1.5.bb
+++ b/meta-gnome/recipes-gnome/glycin/glycin_2.1.5.bb
@@ -74,11 +74,14 @@ PACKAGECONFIG[jxl] =3D ",,libjxl"
 PACKAGECONFIG[raw] =3D ",,"
 PACKAGECONFIG[svg] =3D ",,librsvg cairo"
=20
-def glycin_loaders(d):
+def glycin_loader_list(d):
     known =3D (("heif", "glycin-heif"), ("image-rs", "glycin-image-rs"),
              ("jxl", "glycin-jxl"), ("raw", "glycin-raw"), ("svg", "glyc=
in-svg"))
     enabled =3D d.getVar("PACKAGECONFIG").split()
-    loaders =3D [name for flag, name in known if flag in enabled]
+    return [name for flag, name in known if flag in enabled]
+
+def glycin_loaders(d):
+    loaders =3D glycin_loader_list(d)
     if not loaders:
         return "-Dglycin-loaders=3Dfalse"
     return "-Dglycin-loaders=3Dtrue -Dloaders=3D" + ",".join(loaders)
@@ -101,6 +104,8 @@ FILES:${PN}-thumbnailer =3D "${bindir}/glycin-thumbna=
iler \
                            ${datadir}/thumbnailers \
                            "
=20
-RDEPENDS:${PN}-loaders +=3D "${@bb.utils.contains('PACKAGECONFIG', 'thum=
bnailer', '${PN}-thumbnailer', '', d)}"
+RDEPENDS:${PN} +=3D "${@d.getVar('PN') + '-loaders' if glycin_loader_lis=
t(d) else ''}"
+RDEPENDS:${PN}[vardeps] +=3D "PACKAGECONFIG"
+RRECOMMENDS:${PN}-loaders +=3D "${@bb.utils.contains('PACKAGECONFIG', 't=
humbnailer', '${PN}-thumbnailer', '', d)}"
 RDEPENDS:${PN}-thumbnailer +=3D "${PN}"
=20
--=20
2.55.0



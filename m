Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77451C43458
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 14:06:07 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36144.1782482759732723912
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jun 2026 07:06:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=HX+qv5SY;
 spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd89.aul.t-online.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout11.t-online.de (Postfix) with SMTP id 5800E1C7A3
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Jun 2026 16:05:57 +0200 (CEST)
Received: from fedora.fritz.box ([79.219.237.60]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wd7Br-2iICn30; Fri, 26 Jun 2026 16:05:55 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCHv2] packagegroup-meta-multimedia: add libdvdread to RDEPENDS
Date: Fri, 26 Jun 2026 16:05:50 +0200
Message-ID: <20260626140550.26438-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1782482755-DA7FBB4F-AAEB120E/0/0 CLEAN NORMAL
X-TOI-MSGID: a30bec83-ed92-4282-ad2d-d8f28a4f3367
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1782482757; i=f_l_k@t-online.de;
	bh=tFNdOunCgKjG6GTb87bab563rIKhKZuzDxnZKoosIE0=;
	h=From:To:Subject:Date;
	b=HX+qv5SYFtikhd01x+/GVGUG6ba/e8zo8V4NXCuIO/NXwAkTcbWUfTgAshiVcXzL5
	 E9PwWWKTtokHwlaN3OC+GlRPBcAUGrPxslh4y7gGmlwGulaYwQu74lXxyV8Mym6v6S
	 HcoNJsOQV4CJvAHl+xrHigPVY+6hUU4Dd8OoD93nskYl6UTS8vs6KpInorwDxOUDPf
	 2OgOoen/oKdu6Jr2DQo3QLiJDlhSCUPV9S6Iug3wnKkJcByXkZpthUi31vta8Ubm1r
	 +j90fBu78lhT0F1MAH3TNfqu7imJRrz1tx8yEvv6BUwYd03Uloki1dh08gdnZWzlO4
	 u5DKEnep1FU3g==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Jun 2026 14:06:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127794

libdvdread has recently been moved to meta-multimedia and the 'libdvdred'=
 runtime
dependency was removed from packagegroup-meta-oe
Add the runtime dependency to packagegroup-meta-multimedia so that is inc=
luded in
world builds again.

Set PACKAGE_ARCH =3D "${MACHINE_ARCH}", take this setting from packagegro=
up-meta-oe
This packagegroup adds runtime dependencies on packages that are not alla=
rch

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../packagegroups/packagegroup-meta-multimedia.bb              | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/packagegroups/packagegrou=
p-meta-multimedia.bb b/meta-multimedia/recipes-multimedia/packagegroups/p=
ackagegroup-meta-multimedia.bb
index 4e4f58f14a..5713f96b44 100644
--- a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-=
multimedia.bb
+++ b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-=
multimedia.bb
@@ -1,5 +1,7 @@
 SUMMARY =3D "Meta-multimedia packagegroups"
=20
+PACKAGE_ARCH =3D "${MACHINE_ARCH}"
+
 inherit packagegroup
=20
 PROVIDES =3D "${PACKAGES}"
@@ -29,6 +31,7 @@ RDEPENDS:packagegroup-meta-multimedia =3D "\
     ${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", "faac m=
pd", "", d)} \
     gerbera \
     libavc1394 \
+    libdvdread \
     libiec61883 \
     libmusicbrainz \
     mpc \
--=20
2.54.0



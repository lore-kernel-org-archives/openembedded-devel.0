Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18F70C4345F
	for <webhook@archiver.kernel.org>; Sun, 14 Apr 2024 12:58:05 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.32000.1713099480644494380
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Apr 2024 05:58:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout10.t-online.de (Postfix) with SMTP id 38FFD4A2F2
	for <openembedded-devel@lists.openembedded.org>; Sun, 14 Apr 2024 14:57:59 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.46.194]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rvzQi-0r0aXZ0; Sun, 14 Apr 2024 14:57:56 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] edid-decode: allow to build native variant
Date: Sun, 14 Apr 2024 14:58:05 +0200
Message-ID: <20240414125805.2253456-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1713099476-62FFB3C7-D35BA890/0/0 CLEAN NORMAL
X-TOI-MSGID: ff552cdd-b16e-4c32-bdb9-c326e4c3bc7d
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 14 Apr 2024 12:58:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109950

This is a requirement for libdisplay-info and fixes:
Program edid-decode found: NO

If libdisplay-info can provide edid-decode-native it looks like:
libdisplay-info| Program edid-decode found: YES (/home/flk/poky/build-hyp=
r/tmp/work/corei7-64-poky-linux/gamescope/3.14.3/recipe-sysroot-native/us=
r/bin/edid-decode)
libdisplay-info| Program ./edid-decode-check.sh found: YES (/home/flk/pok=
y/build-hypr/tmp/work/corei7-64-poky-linux/gamescope/3.14.3/git/subprojec=
ts/libdisplay-info/test/./edid-decode-check.sh)
libdisplay-info| Program ./edid-print-check.sh found: YES (/home/flk/poky=
/build-hypr/tmp/work/corei7-64-poky-linux/gamescope/3.14.3/git/subproject=
s/libdisplay-info/test/./edid-print-check.sh)
libdisplay-info| Program ./edid-decode-diff.sh found: YES (/home/flk/poky=
/build-hypr/tmp/work/corei7-64-poky-linux/gamescope/3.14.3/git/subproject=
s/libdisplay-info/test/./edid-decode-diff.sh)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-support/edid-decode/edid-decode_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/edid-decode/edid-decode_git.bb b/met=
a-oe/recipes-support/edid-decode/edid-decode_git.bb
index bb8c9de71..6eaec800c 100644
--- a/meta-oe/recipes-support/edid-decode/edid-decode_git.bb
+++ b/meta-oe/recipes-support/edid-decode/edid-decode_git.bb
@@ -14,3 +14,5 @@ S =3D "${WORKDIR}/git"
 do_install() {
     oe_runmake 'DESTDIR=3D${D}' install
 }
+
+BBCLASSEXTEND =3D "native"
--=20
2.44.0



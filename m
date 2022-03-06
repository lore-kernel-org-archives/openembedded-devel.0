Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AAA5C433EF
	for <webhook@archiver.kernel.org>; Sun,  6 Mar 2022 14:02:14 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web09.15452.1646575332642016990
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Mar 2022 06:02:13 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18,
 mailfrom: f_l_k@t-online.de)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout04.t-online.de (Postfix) with SMTP id 0309560A8
	for <openembedded-devel@lists.openembedded.org>;
 Sun,  6 Mar 2022 15:02:11 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.154.165.147]) by fwd74.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nQrSc-0f0UCH0; Sun, 6 Mar 2022 15:02:10 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH] gnome-disk-utility: disable build of man pages
Date: Sun,  6 Mar 2022 15:02:01 +0100
Message-Id: <20220306140201.592155-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1646575330-00012DCC-4A6D3572/0/0 CLEAN NORMAL
X-TOI-MSGID: 6112e130-9745-431e-ae82-853a822a0b6d
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 06 Mar 2022 14:02:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95815

this fixes:

| Program xsltproc found: NO
|
| ../gnome-disk-utility-41.0/doc/man/meson.build:1:0: ERROR: Program 'xsl=
tproc' not found or not executable

Signed-off-by: Markus Volk <f_l_k@t-online.de>

Building man is enabled by default and this feature would require a depen=
dency on libxslt-native
and network access at do_compile.
---
 .../recipes-gnome/gnome-disk-utility/gnome-disk-utility_41.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utili=
ty_41.0.bb b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utili=
ty_41.0.bb
index a7945dd3e..6bb69853a 100644
--- a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_41.0=
.bb
+++ b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_41.0=
.bb
@@ -29,6 +29,8 @@ PACKAGECONFIG[systemd] =3D "-Dlogind=3Dlibsystemd,-Dlog=
ind=3Dnone,systemd"
 SRC_URI +=3D " file://0001-build-fix-arguments-of-i18n.merge_file.patch"
 SRC_URI[archive.sha256sum] =3D "8743c98fd656062ef862933efe30c5be4c6b322e=
c02eee154ec70d08ed0895df"
=20
+EXTRA_OEMESON =3D "-Dman=3Dfalse"
+
 FILES:${PN} +=3D " \
     ${datadir}/metainfo \
     ${datadir}/dbus-1 \
--=20
2.25.1



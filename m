Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A83BC433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 18:28:06 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web08.2464.1645468084658238584
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Feb 2022 10:28:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.85,
 mailfrom: f_l_k@t-online.de)
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout11.t-online.de (Postfix) with SMTP id 60E716086
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Feb 2022 19:28:02 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.154.166.220]) by fwd83.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nMDPl-4LINYf0; Mon, 21 Feb 2022 19:28:02 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-xfce][PATCH] xfconf: inherit vala
Date: Mon, 21 Feb 2022 19:27:50 +0100
Message-Id: <20220221182750.2572036-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1645468082-0000EDC4-D539D25B/0/0 CLEAN NORMAL
X-TOI-MSGID: 20ae997b-16b2-4c08-bcb9-8903a7761581
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Feb 2022 18:28:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95424

This fixes do_configure error:

| ...xfconf/4.16.0-r0/recipe-sysroot/usr/bin/vapigen-wrapper: 2: vapigen-=
0.54: not found

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-xfce/recipes-xfce/xfconf/xfconf_4.16.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-xfce/xfconf/xfconf_4.16.0.bb b/meta-xfce/r=
ecipes-xfce/xfconf/xfconf_4.16.0.bb
index 5214b2ea7..0bbef847c 100644
--- a/meta-xfce/recipes-xfce/xfconf/xfconf_4.16.0.bb
+++ b/meta-xfce/recipes-xfce/xfconf/xfconf_4.16.0.bb
@@ -4,7 +4,7 @@ LICENSE =3D "GPLv2"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6=
552"
 DEPENDS =3D "libxfce4util perl intltool-native xfce4-dev-tools-native"
=20
-inherit xfce gtk-doc gobject-introspection bash-completion
+inherit xfce gtk-doc gobject-introspection bash-completion vala
=20
 EXTRA_OECONF +=3D "PERL=3D${STAGING_DIR_TARGET}/usr/bin/perl"
=20
--=20
2.25.1



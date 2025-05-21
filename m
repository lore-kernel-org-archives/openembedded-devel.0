Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75ACCC2D0CD
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 13:19:48 +0000 (UTC)
Received: from outbound10.mail.transip.nl (outbound10.mail.transip.nl [136.144.136.17])
 by mx.groups.io with SMTP id smtpd.web11.6985.1747819054449048772
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 May 2025 02:17:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@myspectrum.nl header.s=transip-a header.b=qPyxHUpn;
 spf=pass (domain: myspectrum.nl, ip: 136.144.136.17, mailfrom: jeroen@myspectrum.nl)
Received: from submission12.mail.transip.nl (unknown [10.103.8.163])
	by outbound10.mail.transip.nl (Postfix) with ESMTP id 4b2Qmq5bNrzTPMZw;
	Wed, 21 May 2025 11:17:31 +0200 (CEST)
Received: from yellow.myspectrum.nl (yellow.myspectrum.nl [136.144.146.76])
	by submission12.mail.transip.nl (Postfix) with ESMTPSA id 4b2Qmq1Qxpz2nC3Hx;
	Wed, 21 May 2025 11:17:31 +0200 (CEST)
Received: from yellow.myspectrum.nl (84-27-20-154.cable.dynamic.v4.ziggo.nl [84.27.20.154])
	(Authenticated sender: sendmail@myspectrum.nl)
	by yellow.myspectrum.nl (Postfix) with ESMTPSA id B8AA720295;
	Wed, 21 May 2025 09:17:29 +0000 (UTC)
Authentication-Results: yellow.myspectrum.nl;
	auth=pass smtp.auth=sendmail@myspectrum.nl smtp.mailfrom=jeroen@myspectrum.nl
Received: by yellow.myspectrum.nl (sSMTP sendmail emulation); Wed, 21 May 2025 11:17:27 +0200
From: "Jeroen Hofstee" <jeroen@myspectrum.nl>
To: openembedded-devel@lists.openembedded.org
Cc: Marc Kleine-Budde <mkl@pengutronix.de>,
	Jeroen Hofstee <jhofstee@victronenergy.com>
Subject: [oe][meta-oe][PATCH v2] socketcand: add recipe
Date: Wed, 21 May 2025 11:17:21 +0200
Message-ID: <20250521091721.2622210-1-jeroen@myspectrum.nl>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Scanned-By: ClueGetter at submission12.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=myspectrum.nl; t=1747819051; h=from:subject:to:cc:date:
 mime-version; bh=bbDBSqQHjei6XaInM/iZbnaoeXrIDuIRHWsPuyH/xSM=;
 b=qPyxHUpn74oukg96RqiNBgZ+f0xRlIi92YP2A5UmbsBFIazhLjwApz3zguAeMCFUckh6AR
 Vh3WzCxuSAoxuh6mO3ad5Cgx4vnJGeKCwVrQunTcxCreuJvuLYp9rtH75t4O+HdHLune/p
 ZCmcOGdr6gkowDsXsNzq++E6JS4rQ3iY9V4jHyg5Q754TD9FEx/AkJg2Q3Y7TNQtw9Nm57
 esmcckt8aepvdMbxfVSmQHagBg21tbEAvfHTFBAc0OAnwuQPBLqD/kg4ofmkdTrqCRoZAv
 xw9LkLMB75Q/Q+g+W7ub3/zvFou4/EMXaZG23paHY8H8zVo4vkUnJC/U7dt1BQ==
X-Report-Abuse-To: abuse@transip.nl
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 13:19:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117571

From: Jeroen Hofstee <jhofstee@victronenergy.com>

Socketcand allows to transfer socketcan messages over tcp/ip.

Signed-off-by: Jeroen Hofstee <jhofstee@victronenergy.com>
---
 .../recipes-extended/socketcan/socketcand_git.bb | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-oe/recipes-extended/socketcan/socketcand_git.bb

diff --git a/meta-oe/recipes-extended/socketcan/socketcand_git.bb b/meta-=
oe/recipes-extended/socketcan/socketcand_git.bb
new file mode 100644
index 0000000000..4e58c76460
--- /dev/null
+++ b/meta-oe/recipes-extended/socketcan/socketcand_git.bb
@@ -0,0 +1,16 @@
+SUMMARY =3D "Socketcand, socketcan over tcp/ip"
+LICENSE =3D "GPL-2.0-only | BSD-3-Clause"
+LIC_FILES_CHKSUM =3D " \
+    file://LICENSES/BSD-3-Clause;md5=3D4c00cf8b0a04a9441d8fa24850231d00 =
\
+    file://LICENSES/GPL-2.0-only.txt;md5=3Df9d20a453221a1b7e32ae84694da2=
c37 \
+"
+
+SRC_URI =3D "git://github.com/linux-can/socketcand;branch=3Dmaster;proto=
col=3Dhttps"
+SRCREV =3D "998b0394d028e791aa97d549bfc686b4fbadf5ee"
+S =3D "${WORKDIR}/git"
+
+inherit meson pkgconfig
+
+PACKAGECONFIG ?=3D "libconfig libsocketcan"
+PACKAGECONFIG[libconfig] =3D "-Dlibconfig=3Dtrue,-Dlibconfig=3Dfalse,lib=
config"
+PACKAGECONFIG[libsocketcan] =3D "-Dlibsocketcan=3Dtrue,-Dlibsocketcan=3D=
false,libsocketcan"
--=20
2.43.0



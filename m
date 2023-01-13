Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E40F9C3DA78
	for <webhook@archiver.kernel.org>; Fri, 13 Jan 2023 17:28:06 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.94292.1673630878895043286
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Jan 2023 09:27:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: enedino.org, ip: 13.77.154.182, mailfrom: alejandro@enedino.org)
Received: from alsamon-xub.lan (cpe-68-201-55-29.elp.res.rr.com [68.201.55.29])
	by linux.microsoft.com (Postfix) with ESMTPSA id ECC9720DED16;
	Fri, 13 Jan 2023 09:27:57 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com ECC9720DED16
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
To: openembedded-devel@lists.openembedded.org
Cc: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Subject: [PATCH] weechat: Update 3.4.1 -> 3.8
Date: Fri, 13 Jan 2023 10:27:56 -0700
Message-Id: <20230113172756.2565978-1-alejandro@enedino.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Jan 2023 17:28:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100569

Weechat now requires an extra zstd dependency during
compilation.

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.o=
rg>
---
 .../recipes-irc/weechat/{weechat_3.4.1.bb =3D> weechat_3.8.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-irc/weechat/{weechat_3.4.1.bb =3D> weecha=
t_3.8.bb} (89%)

diff --git a/meta-networking/recipes-irc/weechat/weechat_3.4.1.bb b/meta-=
networking/recipes-irc/weechat/weechat_3.8.bb
similarity index 89%
rename from meta-networking/recipes-irc/weechat/weechat_3.4.1.bb
rename to meta-networking/recipes-irc/weechat/weechat_3.8.bb
index 64cd1079b..8c770938a 100644
--- a/meta-networking/recipes-irc/weechat/weechat_3.4.1.bb
+++ b/meta-networking/recipes-irc/weechat/weechat_3.8.bb
@@ -4,13 +4,13 @@ SECTION =3D "net"
 LICENSE =3D "GPL-3.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1ebbd3e34237af26da5dc08a4e440=
464"
=20
-DEPENDS =3D "openssl zlib icu libgcrypt gnutls curl aspell"
+DEPENDS =3D "openssl zlib icu libgcrypt gnutls curl aspell zstd"
=20
 SRC_URI =3D "https://weechat.org/files/src/weechat-${PV}.tar.xz \
            file://0001-use-pkg-config-for-gcrypt-instead.patch \
            "
=20
-SRC_URI[sha256sum] =3D "7e088109ad5dfbcb08a9a6b1dd70ea8236093fed8a13ee9d=
9c98881d7b1aeae7"
+SRC_URI[sha256sum] =3D "f7cb65c200f8c090c56f2cf98c0b184051e516e5f7099a43=
08cacf86f174bf28"
=20
 inherit cmake pkgconfig
=20
--=20
2.34.1



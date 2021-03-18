Received: from proxima.lasnet.de (proxima.lasnet.de [78.47.171.185])
 by mx.groups.io with SMTP id smtpd.web10.49.1616096008627722545
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Mar 2021 12:33:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: datenfreihafen.org, ip: 78.47.171.185, mailfrom: stefan@datenfreihafen.org)
Received: from localhost.localdomain.datenfreihafen.local (p200300e9d726e120e9b10dbb2bfdc675.dip0.t-ipconnect.de [IPv6:2003:e9:d726:e120:e9b1:dbb:2bfd:c675])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: stefan@sostec.de)
	by proxima.lasnet.de (Postfix) with ESMTPSA id 29A50C0E00;
	Thu, 18 Mar 2021 20:33:25 +0100 (CET)
From: "Stefan Schmidt" <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Cc: Stefan Schmidt <stefan@datenfreihafen.org>,
	Stefan Schmidt <stefan.schmidt@huawei.com>
Subject: [meta-oe][PATCH 2/2] plymouth_0.9.5.bb: allow building with musl libc
Date: Thu, 18 Mar 2021 20:33:19 +0100
Message-Id: <20210318193319.1647931-1-stefan@datenfreihafen.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Stefan Schmidt <stefan.schmidt@huawei.com>

Plymouth uses rpmatch() which is not provided by musl. Instead we use
the standalone rpmatch implementation and add dependencies and LDFLAGS
adjustment for musl libs based builds.

Signed-off-by: Stefan Schmidt <stefan.schmidt@huawei.com>
---
 meta-oe/recipes-core/plymouth/plymouth_0.9.5.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-core/plymouth/plymouth_0.9.5.bb b/meta-oe/re=
cipes-core/plymouth/plymouth_0.9.5.bb
index 04106fcc9..11fb30d48 100644
--- a/meta-oe/recipes-core/plymouth/plymouth_0.9.5.bb
+++ b/meta-oe/recipes-core/plymouth/plymouth_0.9.5.bb
@@ -13,6 +13,7 @@ LICENSE =3D "GPLv2+"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
=20
 DEPENDS =3D "libcap libpng cairo dbus udev"
+DEPENDS_append_libc-musl =3D " musl-rpmatch"
 PROVIDES =3D "virtual/psplash"
 RPROVIDES_${PN} =3D "virtual-psplash virtual-psplash-support"
=20
@@ -42,6 +43,8 @@ LOGO ??=3D "${datadir}/plymouth/bizcom.png"
=20
 inherit autotools pkgconfig systemd gettext
=20
+LDFLAGS_append_libc-musl =3D " -lrpmatch"
+
 do_install_append() {
     # Remove /var/run from package as plymouth will populate it on start=
up
     rm -fr "${D}${localstatedir}/run"
--=20
2.30.2


Received: from sender21-of-o52.zoho.eu (sender21-of-o52.zoho.eu [185.172.199.238])
 by mx.groups.io with SMTP id smtpd.web12.39.1601508019487835355
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Sep 2020 16:20:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: zigsystem.com, ip: 185.172.199.238, mailfrom: zig@zigsystem.com)
ARC-Seal: i=1; a=rsa-sha256; t=1601508016; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=dtG6MW8MguLCfvcjRACC70QNH81Xw2JO9wo5oIbTh0E3QCPeJaA155wPc8mqYlp9go/1TZk+cdQKfYuXVukKwXBfORv4rU2IqOSclUGq/NU5UgmUAfIx7TAf/MiuaFOAjJxBBP1ko9Gf6jxsFh2pn6/ot54maH+tFfTdaLyvFCc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1601508016; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=zQqPzrquqxqbp0IhqnAX7niCt5cuzyQeWrR2Pbczvik=; 
	b=awIfloEbyg9SySj+GXYmlF6Qhdvcb5DNjoFP+PZDhb6wXugHCVU2cQM0WUGKXD42KRlrOagU4gmW0sy1g0YFw6MbDM6Hx3j47oE3HLJfUpJ0LY1skf2Ymut4hG6gUEq19WgmaR3u9SIod4t2jlnU4Y5BwVBjhUQA8GQEMKGkCRg=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	spf=pass  smtp.mailfrom=zig@zigsystem.com;
	dmarc=pass header.from=<zig@zigsystem.com> header.from=<zig@zigsystem.com>
Received: from ryzio.lan (cdg46.neoplus.adsl.tpnet.pl [83.30.156.46]) by mx.zoho.eu
	with SMTPS id 1601508014313814.8055578456807; Thu, 1 Oct 2020 01:20:14 +0200 (CEST)
From: zig@zigsystem.com
To: openembedded-devel@lists.openembedded.org
Cc: Zig Globulin <zig@zigsystem.com>
Message-ID: <20200930232008.1342160-1-zig@zigsystem.com>
Subject: [meta-gnome][PATCH] libuvc: add recipe
Date: Thu,  1 Oct 2020 01:20:08 +0200
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-ZohoMailClient: External
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=utf8

Signed-off-by: Zig Globulin <zig@zigsystem.com>
---
 meta-multimedia/recipes-multimedia/libuvc/libuvc.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/libuvc/libuvc.bb

diff --git a/meta-multimedia/recipes-multimedia/libuvc/libuvc.bb b/meta-mul=
timedia/recipes-multimedia/libuvc/libuvc.bb
new file mode 100644
index 000000000..27cc17bc6
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libuvc/libuvc.bb
@@ -0,0 +1,13 @@
+SUMMARY =3D "library for USB video devices built atop libusb"
+HOMEPAGE =3D "https://github.com/libuvc/libuvc.git"
+LICENSE =3D "BSD"
+LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D2f1963e0bb88c93463af750daf9=
ba0c2"
+DEPENDS =3D "libusb jpeg"
+
+SRC_URI =3D "git://github.com/libuvc/libuvc.git"
+SRCREV =3D "ad6c72a4e390367f0d2be81aac00cfc0b6680d74"
+PV =3D "v0.0.6+git${SRCPV}"
+
+S =3D "${WORKDIR}/git"
+
+inherit cmake
--=20
2.28.0



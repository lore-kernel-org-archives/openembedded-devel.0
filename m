Received: from sender11-of-o52.zoho.eu (sender11-of-o52.zoho.eu [31.186.226.238])
 by mx.groups.io with SMTP id smtpd.web12.6835.1601798710349575932
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Oct 2020 01:05:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: zigsystem.com, ip: 31.186.226.238, mailfrom: zig@zigsystem.com)
ARC-Seal: i=1; a=rsa-sha256; t=1601798706; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=DKgy2iKgLyzgXxQfUsrbjkmDdTytQWMGOyGaOOdLzhlXgBqSq05JInb3ZtiNpiHjY0THABYuLbPrWm/OdNKgSHa98IPj0XCbcEXP1dKqRPUt/pM7zF9e3XKMsAyUn4Dd/9Pkfk7d1dC6yiLn8yTCIE555ngakOYos9WQ6T2MDbY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1601798706; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=vF/i47U41u2WVd7eAR7tXTuDTPZrxkvOkzmKK6bAi20=; 
	b=JC8C9Y2Zu7nYCtCRz2NsTbkLW7jE8e3+ewOcCmonkOV64ruTJEVdqFjI8mwNAL2znxB3SlknKq9DJTgvS8CR1D461z9eDMrUdFHUUbuJTx9Eq4T81qAlv2Is8ggRjWnp74ky0n+vD43PGzHPBIaF1cOEKeZDkYkjDqd6E2QZ0Ww=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	spf=pass  smtp.mailfrom=zig@zigsystem.com;
	dmarc=pass header.from=<zig@zigsystem.com> header.from=<zig@zigsystem.com>
Received: from ryzio.lan (cdg46.neoplus.adsl.tpnet.pl [83.30.156.46]) by mx.zoho.eu
	with SMTPS id 1601798705054855.013596905218; Sun, 4 Oct 2020 10:05:05 +0200 (CEST)
From: "Zig Globulin" <zig@zigsystem.com>
To: openembedded-devel@lists.openembedded.org
Cc: Zig Globulin <zig@zigsystem.com>
Message-ID: <20201004080501.1662845-1-zig@zigsystem.com>
Subject: [meta-multimedia][PATCH] libuvc: add recipe
Date: Sun,  4 Oct 2020 10:05:01 +0200
X-Mailer: git-send-email 2.28.0
In-Reply-To: <CA+chaQcHN8fNEZCnTfyg6fYOe8JfAC=cbXGhi3P_LB8uZ8uryw@mail.gmail.com>
References: <CA+chaQcHN8fNEZCnTfyg6fYOe8JfAC=cbXGhi3P_LB8uZ8uryw@mail.gmail.com>
MIME-Version: 1.0
X-ZohoMailClient: External
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=utf8

Signed-off-by: Zig Globulin <zig@zigsystem.com>
---
 .../recipes-multimedia/libuvc/libuvc.bb            | 14 ++++++++++++++
 .../packagegroups/packagegroup-meta-multimedia.bb  |  1 +
 2 files changed, 15 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/libuvc/libuvc.bb

diff --git a/meta-multimedia/recipes-multimedia/libuvc/libuvc.bb b/meta-mul=
timedia/recipes-multimedia/libuvc/libuvc.bb
new file mode 100644
index 000000000..228db25d7
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libuvc/libuvc.bb
@@ -0,0 +1,14 @@
+SUMMARY =3D "library for USB video devices built atop libusb"
+HOMEPAGE =3D "https://github.com/libuvc/libuvc.git"
+SECTION =3D "libs"
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
diff --git a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-=
meta-multimedia.bb b/meta-multimedia/recipes-multimedia/packagegroups/packa=
gegroup-meta-multimedia.bb
index 2bf8877bb..d174f3079 100644
--- a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-mu=
ltimedia.bb
+++ b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-mu=
ltimedia.bb
@@ -60,6 +60,7 @@ RDEPENDS_packagegroup-meta-multimedia =3D "\
     vorbis-tools \
     libdvbcsa \
     libopenmpt \
+    libuvc \
     mimic \
     ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "minidln=
a", "", d)} \
     mycroft \
--=20
2.28.0



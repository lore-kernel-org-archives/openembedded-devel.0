Received: from sender11-of-o52.zoho.eu (sender11-of-o52.zoho.eu [31.186.226.238])
 by mx.groups.io with SMTP id smtpd.web10.28970.1601878890566044934
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Oct 2020 23:21:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: zigsystem.com, ip: 31.186.226.238, mailfrom: zig@zigsystem.com)
ARC-Seal: i=1; a=rsa-sha256; t=1601878885; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=MO2qMrwmMUi95ctYGN9JDPXT/douD7ljL5yck+JLzZay3CeV9hkpF4JCxxY20yp6YYFnVD9Rf827RprIuqDbtFxmKqn2utYCmwZAmlaJsLuqLVtZZQw/cf7jPFlqiL8/dEGipHtpaAt951kkdNCfy6sUR15/HYXy/B1njg41URs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1601878885; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=TLaXalnyjebEQGZ7OnbPpqRQmzGKlrnBJe7uqgRUaXs=; 
	b=OYBmP07lPu/nU3TC4UP7e1KKQ7kOiCmGzd+9+hL50kvD8BBWQKTuk50zp+DuiSA+8f9mjo1kLfKAAToB/VBnb/kpyA5l/UgXNVlQsJzjgGjDMAwHDdmsaGPTg271BhLIZywHp7TIoLoJSxJKx6QCSvd46Jastbx1goXxuluCu8U=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	spf=pass  smtp.mailfrom=zig@zigsystem.com;
	dmarc=pass header.from=<zig@zigsystem.com> header.from=<zig@zigsystem.com>
Received: from ryzio.lan (cdg46.neoplus.adsl.tpnet.pl [83.30.156.46]) by mx.zoho.eu
	with SMTPS id 1601878882056175.34787687532423; Mon, 5 Oct 2020 08:21:22 +0200 (CEST)
From: "Zig Globulin" <zig@zigsystem.com>
To: openembedded-devel@lists.openembedded.org
Cc: Zig Globulin <zig@zigsystem.com>
Message-ID: <20201005062112.1182978-1-zig@zigsystem.com>
Subject: [meta-multimedia][PATCH] libuvc: add recipe
Date: Mon,  5 Oct 2020 08:21:12 +0200
X-Mailer: git-send-email 2.28.0
In-Reply-To: <CAMKF1sqMTk3v-4oH0aMwcPkdW1aXLu4v2G8vwuFrJ6C-oq8wHg@mail.gmail.com>
References: <CAMKF1sqMTk3v-4oH0aMwcPkdW1aXLu4v2G8vwuFrJ6C-oq8wHg@mail.gmail.com>
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
index 000000000..4d301fb2f
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libuvc/libuvc.bb
@@ -0,0 +1,14 @@
+SUMMARY =3D "library for USB video devices built atop libusb"
+HOMEPAGE =3D "https://github.com/libuvc/libuvc.git"
+SECTION =3D "libs"
+LICENSE =3D "BSD-3-Clause"
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



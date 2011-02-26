Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ynezz@true.cz>) id 1PtHoR-0007qV-0Q
	for openembedded-devel@openembedded.org; Sat, 26 Feb 2011 11:55:47 +0100
Received: from localhost.localdomain (localhost [127.0.0.1])
	by mengele.ibawizard.net (Postfix) with ESMTP id 8525D1D360AA;
	Sat, 26 Feb 2011 11:49:07 +0100 (CET)
From: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: openembedded-devel@openembedded.org
Date: Sat, 26 Feb 2011 11:49:07 +0100
Message-Id: <1298717347-19637-2-git-send-email-ynezz@true.cz>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1298717347-19637-1-git-send-email-ynezz@true.cz>
References: <1298717347-19637-1-git-send-email-ynezz@true.cz>
MIME-Version: 1.0
Subject: [PATCH 2/2] jack: remove old versions
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 26 Feb 2011 10:55:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

The jack is not pinned anywhere and according to the git log it seems, th=
at
just the latest stable version is maintained and used.

Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
---
 recipes/jack/jack_0.103.0.bb |   30 ------------------------------
 recipes/jack/jack_0.116.2.bb |   32 --------------------------------
 2 files changed, 0 insertions(+), 62 deletions(-)
 delete mode 100644 recipes/jack/jack_0.103.0.bb
 delete mode 100644 recipes/jack/jack_0.116.2.bb

diff --git a/recipes/jack/jack_0.103.0.bb b/recipes/jack/jack_0.103.0.bb
deleted file mode 100644
index f7bd62a..0000000
--- a/recipes/jack/jack_0.103.0.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-DESCRIPTION =3D "JACK is a low-latency audio server. It can \
-connect a number of different applications to an audio \
-device, as well as allowing them to share audio between \
-themselves."
-SECTION =3D "libs/multimedia"
-PRIORITY =3D "optional"
-LICENSE =3D "GPL LGPL"
-PR =3D "r0"
-
-DEPENDS =3D "alsa-lib"
-
-SRC_URI =3D "${SOURCEFORGE_MIRROR}/jackit/jack-audio-connection-kit-${PV=
}.tar.gz"
-S =3D "${WORKDIR}/jack-audio-connection-kit-${PV}"
-
-inherit autotools pkgconfig
-
-EXTRA_OECONF =3D "--enable-timestamps --disable-capabilities --disable-o=
ldtrans \
-		--disable-portaudio --disable-coreaudio --enable-oss --enable-alsa"
-
-EXTRA_OEMAKE =3D 'transform=3D"s,^,,"'
-LDFLAGS_append =3D " -ldl -L${STAGING_LIBDIR}"
-
-PACKAGES =3D+ "libjack jack-server jack-examples"
-
-FILES_libjack =3D "${libdir}/*.so.* ${libdir}/jack/*.so"
-FILES_jack-server =3D "${bindir}/jackd"
-FILES_jack-examples =3D "${bindir}/*"
-
-SRC_URI[md5sum] =3D "03a0f63b997ce7b83a1eeaa6b80f4388"
-SRC_URI[sha256sum] =3D "a5d9fd696d7ee4a1c7679b5a688155bc1e0abbdf5f144d67=
62dbbee874df235f"
diff --git a/recipes/jack/jack_0.116.2.bb b/recipes/jack/jack_0.116.2.bb
deleted file mode 100644
index d97043a..0000000
--- a/recipes/jack/jack_0.116.2.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-DESCRIPTION =3D "JACK is a low-latency audio server. It can \
-connect a number of different applications to an audio \
-device, as well as allowing them to share audio between \
-themselves."
-SECTION =3D "libs/multimedia"
-PRIORITY =3D "optional"
-LICENSE =3D "GPL LGPL"
-PR =3D "r1"
-
-DEPENDS =3D "alsa-lib"
-
-SRC_URI =3D "http://jackaudio.org/downloads/jack-audio-connection-kit-${=
PV}.tar.gz"
-S =3D "${WORKDIR}/jack-audio-connection-kit-${PV}"
-
-inherit autotools
-
-EXTRA_OECONF =3D "--enable-timestamps --disable-capabilities --disable-o=
ldtrans \
-		--disable-portaudio --disable-coreaudio --enable-oss --enable-alsa"
-
-EXTRA_OEMAKE =3D 'transform=3D"s,^,,"'
-LDFLAGS_append =3D " -ldl -L${STAGING_LIBDIR}"
-
-PACKAGES =3D+ "libjack jack-server jack-examples"
-
-FILES_libjack =3D "${libdir}/*.so.* ${libdir}/jack/*.so"
-FILES_jack-server =3D "${bindir}/jackd"
-FILES_jack-examples =3D "${bindir}/*"
-FILES_${PN}-doc +=3D " ${datadir}/jack-audio-connection-kit/reference/ht=
ml/* "
-
-
-SRC_URI[md5sum] =3D "9c0ae9880e9b6e081f1a238fe6a28bd5"
-SRC_URI[sha256sum] =3D "ce6e1f61a3b003137af56b749e5ed4274584167c0877ea9e=
f2d83f47b11c8d3d"
--=20
1.7.0.4




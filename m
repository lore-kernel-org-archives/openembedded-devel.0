Received: from 11.mo7.mail-out.ovh.net (11.mo7.mail-out.ovh.net [87.98.173.157])
 by mx.groups.io with SMTP id smtpd.web10.580.1606330566250890223
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2020 10:56:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: 3mdeb.com, ip: 87.98.173.157, mailfrom: maciej.pijanowski@3mdeb.com)
Received: from player779.ha.ovh.net (unknown [10.109.138.246])
	by mo7.mail-out.ovh.net (Postfix) with ESMTP id 20218184C02
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2020 19:56:03 +0100 (CET)
Received: from 3mdeb.com (89-66-159-90.dynamic.chello.pl [89.66.159.90])
	(Authenticated sender: maciej.pijanowski@3mdeb.com)
	by player779.ha.ovh.net (Postfix) with ESMTPSA id 5FA081880C8A4
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2020 18:56:03 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-101G0046c716345-745f-4830-b34a-e4ba915260b3,
                    75A271BDE3F50F31F0097557F71BA253F37127E0) smtp.auth=maciej.pijanowski@3mdeb.com
From: "Maciej Pijanowski" <maciej.pijanowski@3mdeb.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2] cdrkit: split into more packages
Date: Wed, 25 Nov 2020 19:55:48 +0100
Message-Id: <20201125185548.577818-1-maciej.pijanowski@3mdeb.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <88100>
References: <88100>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 12160563420808490568
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudehtddguddvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforggtihgvjhcurfhijhgrnhhofihskhhiuceomhgrtghivghjrdhpihhjrghnohifshhkihesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepveelvdeltdegvedtveettdehuefgjeevieeltddtgfelgeffieeufeevvddugeefnecukfhppedtrddtrddtrddtpdekledrieeirdduheelrdeltdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejjeelrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepmhgrtghivghjrdhpihhjrghnohifshhkihesfehmuggvsgdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdquggvvhgvlheslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
Content-Transfer-Encoding: quoted-printable

Mimic the Debian pacaking scheme to allow for more fine-grained
installation choice (install the binaries we need). Moreover, dirsplit
was moved to a separate package, as it pulls in perl interpreter.

Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
---
 .../packagegroups/packagegroup-meta-oe.bb     |  2 +-
 .../cdrkit/cdrkit_1.1.11.bb                   | 32 ++++++++++++++++++-
 2 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b=
/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 8358e933d712..4f12d4d3bdda 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -207,7 +207,7 @@ RDEPENDS_packagegroup-meta-oe-kernel_remove_riscv64 =3D=
 "crash oprofile"
 RDEPENDS_packagegroup-meta-oe-kernel_remove_riscv32 =3D "crash oprofile"
=20
 RDEPENDS_packagegroup-meta-oe-multimedia =3D"\
-    alsa-oss audiofile cdrkit id3lib \
+    alsa-oss audiofile dirsplit genisoimage icedax wodim id3lib \
     a2jmidid jack libass libburn libcdio libcdio-paranoia \
     libdvdread libmms libmodplug libopus live555 \
     mplayer-common opus-tools \
diff --git a/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb b/meta-oe=
/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
index 3b10e978ef79..132e8f26b88c 100644
--- a/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
+++ b/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
@@ -17,7 +17,37 @@ SRC_URI[sha256sum] =3D "d1c030756ecc182defee9fe885638c=
1785d35a2c2a297b4604c0e0dcc7
 inherit cmake
=20
 DEPENDS =3D "libcap file bzip2"
-RDEPENDS_${PN} =3D "perl"
+RDEPENDS_dirsplit =3D "perl"
+
+PACKAGES =3D+ "dirsplit genisoimage icedax wodim"
+
+FILES_dirsplit =3D " \
+    ${bindir}/dirsplit \
+"
+
+FILES_genisoimage =3D " \
+    ${bindir}/devdump \
+    ${bindir}/genisoimage \
+    ${bindir}/isodebug \
+    ${bindir}/isodump \
+    ${bindir}/isoinfo \
+    ${bindir}/isovfy \
+    ${bindir}/mkisofs \
+"
+
+FILES_icedax =3D " \
+    ${bindir}/cdda2mp3 \
+    ${bindir}/cdda2ogg \
+    ${bindir}/icedax \
+    ${bindir}/pitchplay \
+    ${bindir}/readmult \
+"
+
+FILES_wodim =3D " \
+    ${bindir}/readom \
+    ${bindir}/wodim \
+    ${sbindir}/netscsid \
+"
=20
 do_install_append() {
     ln -sf ${bindir}/genisoimage ${D}${bindir}/mkisofs
--=20
2.25.1


Received: from 1.mo69.mail-out.ovh.net (1.mo69.mail-out.ovh.net [178.33.251.173])
 by mx.groups.io with SMTP id smtpd.web08.1221.1606333143909689736
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2020 11:39:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: 3mdeb.com, ip: 178.33.251.173, mailfrom: maciej.pijanowski@3mdeb.com)
Received: from player697.ha.ovh.net (unknown [10.108.57.49])
	by mo69.mail-out.ovh.net (Postfix) with ESMTP id 0537DA2CE3
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2020 20:39:01 +0100 (CET)
Received: from 3mdeb.com (89-66-159-90.dynamic.chello.pl [89.66.159.90])
	(Authenticated sender: maciej.pijanowski@3mdeb.com)
	by player697.ha.ovh.net (Postfix) with ESMTPSA id 7B498188A7EAB
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2020 19:39:00 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-101G00484860f07-6d61-4461-b84e-cf254c30dbe9,
                    75A271BDE3F50F31F0097557F71BA253F37127E0) smtp.auth=maciej.pijanowski@3mdeb.com
From: "Maciej Pijanowski" <maciej.pijanowski@3mdeb.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v4] cdrkit: split into more packages
Date: Wed, 25 Nov 2020 20:38:36 +0100
Message-Id: <20201125193836.586388-1-maciej.pijanowski@3mdeb.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <88102>
References: <88102>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 12886205910884625992
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudehtddguddvlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforggtihgvjhcurfhijhgrnhhofihskhhiuceomhgrtghivghjrdhpihhjrghnohifshhkihesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepveelvdeltdegvedtveettdehuefgjeevieeltddtgfelgeffieeufeevvddugeefnecukfhppedtrddtrddtrddtpdekledrieeirdduheelrdeltdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrheileejrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepmhgrtghivghjrdhpihhjrghnohifshhkihesfehmuggvsgdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdquggvvhgvlheslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
Content-Transfer-Encoding: quoted-printable

Mimic the Debian pacaking scheme to allow for more fine-grained
installation choice (install the binaries we need). Moreover, dirsplit
was moved to a separate package, as it pulls in perl interpreter.

Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
---
 .../packagegroups/packagegroup-meta-oe.bb     |  5 ++-
 .../cdrkit/cdrkit_1.1.11.bb                   | 32 ++++++++++++++++++-
 2 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b=
/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index ccbd01aaf006..e62b1eb4674f 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -615,7 +615,10 @@ RDEPENDS_packagegroup-meta-oe-kernel_remove_riscv32 =
=3D "crash makedumpfile oprofi
 RDEPENDS_packagegroup-meta-oe-multimedia =3D"\
     alsa-oss \
     ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "faad2=
", "", d)} \
-    cdrkit \
+    dirsplit \
+    genisoimage \
+    icedax \
+    wodim \
     id3lib \
     audiofile \
     a2jmidid \
diff --git a/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb b/meta-oe=
/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
index 1c7f4c62e5f4..3344821fa0da 100644
--- a/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
+++ b/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
@@ -18,7 +18,37 @@ SRC_URI[sha256sum] =3D "d1c030756ecc182defee9fe885638c=
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


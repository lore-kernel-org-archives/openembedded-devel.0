Received: from 4.mo69.mail-out.ovh.net (4.mo69.mail-out.ovh.net [46.105.42.102])
 by mx.groups.io with SMTP id smtpd.web08.1181.1606332974460909065
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2020 11:36:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: 3mdeb.com, ip: 46.105.42.102, mailfrom: maciej.pijanowski@3mdeb.com)
Received: from player693.ha.ovh.net (unknown [10.108.4.60])
	by mo69.mail-out.ovh.net (Postfix) with ESMTP id CF152A0C68
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2020 20:36:12 +0100 (CET)
Received: from 3mdeb.com (89-66-159-90.dynamic.chello.pl [89.66.159.90])
	(Authenticated sender: maciej.pijanowski@3mdeb.com)
	by player693.ha.ovh.net (Postfix) with ESMTPSA id 2032A1880B2C5
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2020 19:36:11 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-99G003de4908ac-a5e2-4934-8ce8-c74fab4f54b8,
                    75A271BDE3F50F31F0097557F71BA253F37127E0) smtp.auth=maciej.pijanowski@3mdeb.com
From: "Maciej Pijanowski" <maciej.pijanowski@3mdeb.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v3] cdrkit: split into more packages
Date: Wed, 25 Nov 2020 20:36:00 +0100
Message-Id: <20201125193600.585428-1-maciej.pijanowski@3mdeb.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <88102>
References: <88102>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 12838636640943615560
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudehtddguddvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforggtihgvjhcurfhijhgrnhhofihskhhiuceomhgrtghivghjrdhpihhjrghnohifshhkihesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepveelvdeltdegvedtveettdehuefgjeevieeltddtgfelgeffieeufeevvddugeefnecukfhppedtrddtrddtrddtpdekledrieeirdduheelrdeltdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrheileefrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepmhgrtghivghjrdhpihhjrghnohifshhkihesfehmuggvsgdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdquggvvhgvlheslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
Content-Transfer-Encoding: quoted-printable

Mimic the Debian pacaking scheme to allow for more fine-grained
installation choice (install the binaries we need). Moreover, dirsplit
was moved to a separate package, as it pulls in perl interpreter.

Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
---
 .../packagegroups/packagegroup-meta-oe.bb     |  4 +++
 .../cdrkit/cdrkit_1.1.11.bb                   | 32 ++++++++++++++++++-
 2 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b=
/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index ccbd01aaf006..8c6d50ca1f63 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -616,6 +616,10 @@ RDEPENDS_packagegroup-meta-oe-multimedia =3D"\
     alsa-oss \
     ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "faad2=
", "", d)} \
     cdrkit \
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


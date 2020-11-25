Received: from 9.mo6.mail-out.ovh.net (9.mo6.mail-out.ovh.net [87.98.171.146])
 by mx.groups.io with SMTP id smtpd.web11.7544.1606315048613646769
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2020 06:37:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: 3mdeb.com, ip: 87.98.171.146, mailfrom: maciej.pijanowski@3mdeb.com)
Received: from player758.ha.ovh.net (unknown [10.108.57.245])
	by mo6.mail-out.ovh.net (Postfix) with ESMTP id ABA00232E4B
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2020 15:37:26 +0100 (CET)
Received: from 3mdeb.com (89-66-159-90.dynamic.chello.pl [89.66.159.90])
	(Authenticated sender: maciej.pijanowski@3mdeb.com)
	by player758.ha.ovh.net (Postfix) with ESMTPSA id E2B6B188BC0D5
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2020 14:37:25 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-104R005d855245f-0482-43cd-a5b9-8ff6ce86f0ac,
                    75A271BDE3F50F31F0097557F71BA253F37127E0) smtp.auth=maciej.pijanowski@3mdeb.com
From: "Maciej Pijanowski" <maciej.pijanowski@3mdeb.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] cdrkit: split into more packages
Date: Wed, 25 Nov 2020 15:36:38 +0100
Message-Id: <20201125143638.36139-1-maciej.pijanowski@3mdeb.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Ovh-Tracer-Id: 7792916206013853256
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudehtddgieejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepofgrtghivghjucfrihhjrghnohifshhkihcuoehmrggtihgvjhdrphhijhgrnhhofihskhhiseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeehfeegieeutdfhteeikeeufeehkefffeetvefggedvtdevtdfhjeevvedtudfgueenucfkpheptddrtddrtddrtddpkeelrdeiiedrudehledrledtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeehkedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehmrggtihgvjhdrphhijhgrnhhofihskhhiseefmhguvggsrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdguvghvvghlsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
Content-Transfer-Encoding: quoted-printable

Mimic the Debian pacaking scheme to allow for more fine-grained
installation choice (install the binaries we need). Moreover, dirsplit
was moved to a separate package, as it pulls in perl interpreter.

Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
---
 .../cdrkit/cdrkit_1.1.11.bb                   | 32 ++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

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


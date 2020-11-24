Received: from 5.mo7.mail-out.ovh.net (5.mo7.mail-out.ovh.net [178.32.120.239])
 by mx.groups.io with SMTP id smtpd.web09.55151.1606237583757246091
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Nov 2020 09:06:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: 3mdeb.com, ip: 178.32.120.239, mailfrom: maciej.pijanowski@3mdeb.com)
Received: from player711.ha.ovh.net (unknown [10.108.20.161])
	by mo7.mail-out.ovh.net (Postfix) with ESMTP id 7FFC2184856
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2020 18:06:21 +0100 (CET)
Received: from 3mdeb.com (89-66-159-90.dynamic.chello.pl [89.66.159.90])
	(Authenticated sender: maciej.pijanowski@3mdeb.com)
	by player711.ha.ovh.net (Postfix) with ESMTPSA id D4BD11853FD85
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2020 17:06:20 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-100R003f58c1945-bd8f-40c7-b972-10183c8c1130,
                    BC82A14BF08680DC96B4491CA353477796433981) smtp.auth=maciej.pijanowski@3mdeb.com
From: "Maciej Pijanowski" <maciej.pijanowski@3mdeb.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] cdrkit: add native to BBCLASSEXTEND
Date: Tue, 24 Nov 2020 18:06:05 +0100
Message-Id: <20201124170605.316907-1-maciej.pijanowski@3mdeb.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Ovh-Tracer-Id: 4435201208598998600
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudegkedgleekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepofgrtghivghjucfrihhjrghnohifshhkihcuoehmrggtihgvjhdrphhijhgrnhhofihskhhiseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeehfeegieeutdfhteeikeeufeehkefffeetvefggedvtdevtdfhjeevvedtudfgueenucfkpheptddrtddrtddrtddpkeelrdeiiedrudehledrledtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeduuddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehmrggtihgvjhdrphhijhgrnhhofihskhhiseefmhguvggsrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdguvghvvghlsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
---
 meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb b/meta-oe=
/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
index 3b10e978ef79..f43f1da492de 100644
--- a/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
+++ b/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
@@ -22,3 +22,5 @@ RDEPENDS_${PN} =3D "perl"
 do_install_append() {
     ln -sf ${bindir}/genisoimage ${D}${bindir}/mkisofs
 }
+
+BBCLASSEXTEND =3D "native"
--=20
2.25.1


Received: from 11.mo7.mail-out.ovh.net (11.mo7.mail-out.ovh.net [87.98.173.157])
 by mx.groups.io with SMTP id smtpd.web12.2128.1590600451027480010
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2020 10:27:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: 3mdeb.com, ip: 87.98.173.157, mailfrom: maciej.pijanowski@3mdeb.com)
Received: from player688.ha.ovh.net (unknown [10.110.115.36])
	by mo7.mail-out.ovh.net (Postfix) with ESMTP id 0E00D168EE8
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2020 19:27:28 +0200 (CEST)
Received: from 3mdeb.com (85-222-117-222.dynamic.chello.pl [85.222.117.222])
	(Authenticated sender: maciej.pijanowski@3mdeb.com)
	by player688.ha.ovh.net (Postfix) with ESMTPSA id 1F7AA12B0E50A;
	Wed, 27 May 2020 17:27:26 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-97G0020f25a36a-1769-4623-b243-3ed7c1fd6d35,5F154F85DCB5FA11FCD9B22D0FDFD048FEC1B286) smtp.auth=maciej.pijanowski@3mdeb.com
From: "Maciej Pijanowski" <maciej.pijanowski@3mdeb.com>
To: openembedded-devel@lists.openembedded.org
Cc: piotr.krol@3mdeb.com
Subject: [meta-oe][PATCH] qpdf: fix typo in RDEPENDS
Date: Wed, 27 May 2020 19:27:13 +0200
Message-Id: <20200527172713.43176-1-maciej.pijanowski@3mdeb.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Ovh-Tracer-Id: 11745387831576243784
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedruddvgedguddtfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeforggtihgvjhcurfhijhgrnhhofihskhhiuceomhgrtghivghjrdhpihhjrghnohifshhkihesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepheefgeeiuedthfetieekueefheekffefteevgfegvddtvedthfejveevtddugfeunecukfhppedtrddtrddtrddtpdekhedrvddvvddruddujedrvddvvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrheikeekrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepmhgrtghivghjrdhpihhjrghnohifshhkihesfehmuggvsgdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdquggvvhgvlheslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
---
 meta-oe/recipes-printing/qpdf/qpdf_10.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-printing/qpdf/qpdf_10.0.1.bb b/meta-oe/recip=
es-printing/qpdf/qpdf_10.0.1.bb
index 3883a8dcf0e6..600508097b4e 100644
--- a/meta-oe/recipes-printing/qpdf/qpdf_10.0.1.bb
+++ b/meta-oe/recipes-printing/qpdf/qpdf_10.0.1.bb
@@ -32,4 +32,4 @@ DEBIAN_NOAUTONAME_libqpdf =3D "1"
 PACKAGES =3D+ "libqpdf"
 FILES_libqpdf =3D "${libdir}/libqpdf.so.*"
=20
-RDEPEND_${PN} =3D "libqpdf"
+RDEPENDS_${PN} =3D "libqpdf"
--=20
2.25.1


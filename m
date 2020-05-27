Received: from 3.mo178.mail-out.ovh.net (3.mo178.mail-out.ovh.net [46.105.44.197])
 by mx.groups.io with SMTP id smtpd.web11.2200.1590600556441887151
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2020 10:29:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: 3mdeb.com, ip: 46.105.44.197, mailfrom: maciej.pijanowski@3mdeb.com)
Received: from player730.ha.ovh.net (unknown [10.108.35.95])
	by mo178.mail-out.ovh.net (Postfix) with ESMTP id C436EA2A7B
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2020 19:29:13 +0200 (CEST)
Received: from 3mdeb.com (85-222-117-222.dynamic.chello.pl [85.222.117.222])
	(Authenticated sender: maciej.pijanowski@3mdeb.com)
	by player730.ha.ovh.net (Postfix) with ESMTPSA id DF3DF129FD480;
	Wed, 27 May 2020 17:29:11 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-103G005dfc0fbb0-b74f-47e8-894d-89a053f90032,5F154F85DCB5FA11FCD9B22D0FDFD048FEC1B286) smtp.auth=maciej.pijanowski@3mdeb.com
From: "Maciej Pijanowski" <maciej.pijanowski@3mdeb.com>
To: openembedded-devel@lists.openembedded.org
Cc: piotr.krol@3mdeb.com
Subject: [meta-gnome][PATCH] gnome-settings-daemon: fix typo in RDEPENDS
Date: Wed, 27 May 2020 19:28:46 +0200
Message-Id: <20200527172846.43810-1-maciej.pijanowski@3mdeb.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Ovh-Tracer-Id: 11774942704166383176
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedruddvgedguddtfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeforggtihgvjhcurfhijhgrnhhofihskhhiuceomhgrtghivghjrdhpihhjrghnohifshhkihesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepheefgeeiuedthfetieekueefheekffefteevgfegvddtvedthfejveevtddugfeunecukfhppedtrddtrddtrddtpdekhedrvddvvddruddujedrvddvvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejfedtrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepmhgrtghivghjrdhpihhjrghnohifshhkihesfehmuggvsgdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdquggvvhgvlheslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
---
 .../gnome-settings-daemon/gnome-settings-daemon_3.34.2.bb       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-setting=
s-daemon_3.34.2.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome=
-settings-daemon_3.34.2.bb
index 0b6865d293db..2aa3a7ebf1b4 100644
--- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemo=
n_3.34.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemo=
n_3.34.2.bb
@@ -56,4 +56,4 @@ FILES_${PN} +=3D " \
     ${libdir}/gnome-settings-daemon-3.0/libgsd.so \
 "
=20
-RDEPEND_${PN} +=3D "gdbus"
+RDEPENDS_${PN} +=3D "gdbus"
--=20
2.25.1


Received: from 1.mo2.mail-out.ovh.net ([46.105.63.121]
	helo=mo2.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1TdO6b-0004HC-Sn
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Nov 2012 17:33:55 +0100
Received: from mail190.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo2.mail-out.ovh.net (Postfix) with SMTP id E877CDC765C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2012 17:27:33 +0100 (CET)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 27 Nov 2012 18:19:34 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	buildor.local.eukrea.com) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 27 Nov 2012 18:19:32 +0200
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
X-Ovh-Mailout: 178.32.228.2 (mo2.mail-out.ovh.net)
Date: Tue, 27 Nov 2012 17:19:56 +0100
Message-Id: <1354033196-32464-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
X-Ovh-Tracer-Id: 16722991316776758601
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: -10
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehhedrtdduucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecufghrlhcuvffnffculddquddtmdenucfhrhhomhepgfhrihgtuceurohnrghrugcuoegvrhhitgesvghukhhrvggrrdgtohhmqeenucffohhmrghinhepuhguvghlrdgvughunecujfgurhephffvufffkffogggtgfesthekredtredtje
X-Spam-Check: DONE|U 0.500001/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -10
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehhedrtdduucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecufghrlhcuvffnffculddquddtmdenucfhrhhomhepgfhrihgtuceurohnrghrugcuoegvrhhitgesvghukhhrvggrrdgtohhmqeenucffohhmrghinhepuhguvghlrdgvughunecujfgurhephffvufffkffogggtgfesthekredtredtje
Cc: joe.macdonald@windriver.com
Subject: [meta-networking][PATCH] ntp: fix checksum
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
X-List-Received-Date: Tue, 27 Nov 2012 16:33:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

commit e15543f05bb2c321cd649b90de50d1a3d8cd1199 upgrade the recipe to
a newer version but didn't update the checksum so fetch is failing.

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb b/meta-ne=
tworking/recipes-support/ntp/ntp_4.2.6p5.bb
index f7c5b68..0fce5ce 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb
@@ -8,8 +8,8 @@ SRC_URI =3D "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp=
4/ntp-4.2/ntp-${PV}.tar.g
         file://ntpdate \
 "
=20
-SRC_URI[md5sum] =3D "59876a9009b098ff59767ee45a88ebd2"
-SRC_URI[sha256sum] =3D "6e84d4ddfa14b911c3ed88463af10867e1fa9b287e7b34d8=
a02e78be85a7c40e"
+SRC_URI[md5sum] =3D "00df80a84ec9528fcfb09498075525bc"
+SRC_URI[sha256sum] =3D "d6ab8371f9d31e594eb6922823d5ccd03dcc4e9d84b0e23e=
a25ac1405432f91c"
=20
 EXTRA_OECONF +=3D " --with-net-snmp-config=3Dno --without-ntpsnmpd"=20
=20
--=20
1.7.10.4




Received: from 6.mo2.mail-out.ovh.net ([87.98.165.38]
	helo=mo2.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1Qe8rK-0000ut-NR
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Jul 2011 18:52:26 +0200
Received: from mail616.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo2.mail-out.ovh.net (Postfix) with SMTP id 2623CDC0EC1
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Jul 2011 18:39:19 +0200 (CEST)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 5 Jul 2011 18:38:38 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 5 Jul 2011 18:38:37 +0200
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Jul 2011 18:38:17 +0200
Message-Id: <1309883899-658-2-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1309883899-658-1-git-send-email-eric@eukrea.com>
References: <1309883899-658-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 4471230005301128522
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 20
X-VR-SPAMCAUSE: Vade Retro 01.322.28 AV+AS Profile: OVH; Bailout: 300;
	Url TLD (20)
Cc: leon@sidebranch.com
Subject: [PATCH 2/4] at91bootstrap-2.13: add ronetix-pm9g45 board support
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
X-List-Received-Date: Tue, 05 Jul 2011 16:52:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 recipes/at91bootstrap/at91bootstrap_2.13.bb |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/recipes/at91bootstrap/at91bootstrap_2.13.bb b/recipes/at91bo=
otstrap/at91bootstrap_2.13.bb
index 9cbfb35..32f967e 100644
--- a/recipes/at91bootstrap/at91bootstrap_2.13.bb
+++ b/recipes/at91bootstrap/at91bootstrap_2.13.bb
@@ -4,8 +4,14 @@ DEFAULT_PREFERENCE =3D "-1"
 DEFAULT_PREFERENCE_at91sam9g45ek =3D "1"
 DEFAULT_PREFERENCE_at91sam9g45ekes =3D "1"
 DEFAULT_PREFERENCE_at91sam9m10ek =3D "1"
+DEFAULT_PREFERENCE_ronetix-pm9g45 =3D "1"
=20
-
+SRC_URI_ronetix-pm9g45 =3D " \
+	http://download.ronetix.info/boards/linux/bootstrap/nandflashboot/at91b=
ootstrap-pm9g45-svn-r286.tar.bz2;name=3Dpm9g45src \
+	"
+S_ronetix-pm9g45 =3D "${WORKDIR}/trunk"
=20
 SRC_URI[md5sum] =3D "1f539d6db38111b6a1d7ab93eb0a648b"
 SRC_URI[sha256sum] =3D "93b01b723ed69f33316384f097da864f5d49c40520c87ccf=
5537518dbff9df86"
+SRC_URI[pm9g45src.md5sum] =3D "03b416c59b1080ce80894f1af01f57d0"
+SRC_URI[pm9g45src.sha256sum] =3D "d2adc9631b524e313f3b7ea67969f3222e855a=
c0363981989b522c7e59edd408"
--=20
1.7.0.4




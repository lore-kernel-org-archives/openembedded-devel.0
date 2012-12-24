Received: from 3.mo2.mail-out.ovh.net ([46.105.58.226]
	helo=mo2.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1Tn7QR-0006Or-Ld
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Dec 2012 13:46:48 +0100
Received: from mail436.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo2.mail-out.ovh.net (Postfix) with SMTP id F3B01DC3392
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Dec 2012 13:35:25 +0100 (CET)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 24 Dec 2012 14:27:06 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	buildor.local.eukrea.com) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 24 Dec 2012 14:27:04 +0200
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
X-Ovh-Mailout: 178.32.228.2 (mo2.mail-out.ovh.net)
Date: Mon, 24 Dec 2012 13:26:49 +0100
Message-Id: <1356352009-30859-3-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1356352009-30859-1-git-send-email-eric@eukrea.com>
References: <1356352009-30859-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 5339017359248960843
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: 0
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehledruddvucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecunecuhfhrohhmpefgrhhitgcuueornhgrrhguuceovghrihgtsegvuhhkrhgvrgdrtghomheqnecujfgurhephffvufffkffojghfgggtgfesthekredtredtje
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehledruddvucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecunecuhfhrohhmpefgrhhitgcuueornhgrrhguuceovghrihgtsegvuhhkrhgvrgdrtghomheqnecujfgurhephffvufffkffojghfgggtgfesthekredtredtje
Cc: koen@dominion.thruhere.net,
	=?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [meta-oe][PATCH for denzil 3/3] systemd_v189: add D_P=-1
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
X-List-Received-Date: Mon, 24 Dec 2012 12:47:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

now users have the choice :
* keep the old behaviour when not using systemd :
PREFERRED_PROVIDER_udev =3D "udev"
* switch to systemd (while keeping upgrade path) :
PREFERRED_PROVIDER_udev =3D "systemd"
PREFFERED_VERSION_systemd =3D "v189"

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 meta-oe/recipes-core/systemd/systemd_v189.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-core/systemd/systemd_v189.bb b/meta-oe/recip=
es-core/systemd/systemd_v189.bb
index 613f703..633e542 100644
--- a/meta-oe/recipes-core/systemd/systemd_v189.bb
+++ b/meta-oe/recipes-core/systemd/systemd_v189.bb
@@ -8,6 +8,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.GPL2;md5=3D751419260=
aa954499f7abaabaa882bbe \
=20
 PROVIDES =3D "udev"
=20
+DEFAULT_PREFERENCE =3D "-1"
+
 DEPENDS =3D "xz kmod docbook-sgml-dtd-4.1-native intltool-native gperf-n=
ative acl readline dbus libcap libcgroup tcp-wrappers usbutils glib-2.0 l=
ibgcrypt"
 DEPENDS +=3D "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d=
)}"
=20
--=20
1.7.10.4




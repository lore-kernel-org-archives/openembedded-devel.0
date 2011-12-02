Received: from smtpfb1-g21.free.fr ([212.27.42.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1RWRHP-0005rm-5G
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Dec 2011 12:27:47 +0100
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by smtpfb1-g21.free.fr (Postfix) with ESMTP id 3C82577D12E
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Dec 2011 12:21:05 +0100 (CET)
Received: from e6520eb.lan (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 59E3E4B01CF;
	Fri,  2 Dec 2011 12:21:00 +0100 (CET)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Dec 2011 12:20:54 +0100
Message-Id: <1322824856-15965-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.6.4
MIME-Version: 1.0
Cc: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [meta-oe 1/3] pcsc-lite: handle initscript
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
X-List-Received-Date: Fri, 02 Dec 2011 11:27:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

else we get the following log at boot :
Configuring pcsc-lite.
update-rc.d: /etc/init.d/pcscd: file does not exist

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 .../recipes-support/pcsc-lite/pcsc-lite_1.7.2.bb   |   10 ++++++++--
 1 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.7.2.bb b/meta-=
oe/recipes-support/pcsc-lite/pcsc-lite_1.7.2.bb
index 14a0ba0..efa5796 100644
--- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.7.2.bb
+++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.7.2.bb
@@ -4,9 +4,10 @@ LICENSE =3D "BSD"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc8e551349dc346258274f0007679e=
149"
 DEPENDS =3D "udev"
 RDEPENDS +=3D "ccid"
-PR =3D "r1"
+PR =3D "r2"
=20
-SRC_URI =3D "https://alioth.debian.org/frs/download.php/3533/pcsc-lite-$=
{PV}.tar.bz2"
+SRC_URI =3D "https://alioth.debian.org/frs/download.php/3533/pcsc-lite-$=
{PV}.tar.bz2 \
+           file://pcscd.init "
=20
 SRC_URI[md5sum] =3D "47e7055cfc14399fdaa1b7a4aa06e5aa"
 SRC_URI[sha256sum] =3D "41f13d552eaa2c3978fbb6f2125e81903a0767011d999052=
fd1a6ee03880b398"
@@ -21,6 +22,11 @@ EXTRA_OECONF =3D " \
=20
 S =3D "${WORKDIR}/pcsc-lite-${PV}"
=20
+do_install_append() {
+	install -d "${D}/etc/init.d"
+	install -m 755 "${WORKDIR}/pcscd.init" "${D}/etc/init.d/pcscd"
+}
+
 PACKAGES =3D+ "${PN}-lib"
=20
 INITSCRIPT_NAME =3D "pcscd"
--=20
1.7.6.4




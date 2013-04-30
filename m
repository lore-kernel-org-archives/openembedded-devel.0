Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1UX5sY-0001DQ-W7
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Apr 2013 10:25:43 +0200
Received: from buildor.local.eukrea.com (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 6E0914B017A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Apr 2013 10:07:44 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Apr 2013 10:07:55 +0200
Message-Id: <1367309275-9232-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [meta-oe] sip-native: fix SRC_URI
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
X-List-Received-Date: Tue, 30 Apr 2013 08:25:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 meta-oe/recipes-extended/sip/sip-native_4.13.3.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/sip/sip-native_4.13.3.bb b/meta-oe/=
recipes-extended/sip/sip-native_4.13.3.bb
index c20683f..c7be0b4 100644
--- a/meta-oe/recipes-extended/sip/sip-native_4.13.3.bb
+++ b/meta-oe/recipes-extended/sip/sip-native_4.13.3.bb
@@ -5,7 +5,7 @@ SECTION =3D "devel"
 LICENSE =3D "GPLv2+"
 LIC_FILES_CHKSUM =3D "file://sipgen.sbf;endline=3D15;md5=3D88e887a386c18=
a01240d8d055da4e441"
=20
-SRC_URI =3D "http://www.riverbankcomputing.co.uk/static/Downloads/sip4/s=
ip-${PV}.tar.gz"
+SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/pyqt/sip/sip-${PV}/sip-${PV}.=
tar.gz"
 SRC_URI[md5sum] =3D "76192829cc42ec558db46e4f9e1d8ba9"
 SRC_URI[sha256sum] =3D "ec295f71ef339c5b98db5650865f2c6c1200c4085b7a3f33=
f284111e1f534ac1"
 S =3D "${WORKDIR}/sip-${PV}/sipgen"
--=20
1.7.10.4




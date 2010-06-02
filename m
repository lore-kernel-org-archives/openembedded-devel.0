Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1OJuOU-0002ia-LC
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jun 2010 22:18:33 +0200
Received: from localhost.localdomain (pac33-2-82-240-38-71.fbx.proxad.net
	[82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 43A954B01EF
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Jun 2010 22:14:07 +0200 (CEST)
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Jun 2010 22:08:20 +0200
Message-Id: <1275509300-18170-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 212.27.42.2
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] qt4.inc: split font package
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
X-List-Received-Date: Wed, 02 Jun 2010 20:18:33 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

* Before :
4228    KiB /armv5te/qt4-embedded-fonts_4.6.2-r19.1.5_armv5te.ipk

* After :
1058300 armv5te/qt4-embedded-fonts-pfa_4.6.2-r19.1.5_armv5te.ipk
 293236 armv5te/qt4-embedded-fonts-pfb_4.6.2-r19.1.5_armv5te.ipk
 649442 armv5te/qt4-embedded-fonts-qpf_4.6.2-r19.1.5_armv5te.ipk
1917230 armv5te/qt4-embedded-fonts-ttf-dejavu_4.6.2-r19.1.5_armv5te.ipk
 344114 armv5te/qt4-embedded-fonts-ttf-vera_4.6.2-r19.1.5_armv5te.ipk

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 recipes/qt4/qt4.inc |   14 +++++++++++---
 1 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/recipes/qt4/qt4.inc b/recipes/qt4/qt4.inc
index 5a19f65..eddfc64 100644
--- a/recipes/qt4/qt4.inc
+++ b/recipes/qt4/qt4.inc
@@ -78,7 +78,11 @@ OTHER_PACKAGES =3D "\
              ${QT_BASE_NAME}-demos \
              ${QT_BASE_NAME}-designer \
              ${QT_BASE_NAME}-examples \
-             ${QT_BASE_NAME}-fonts \
+             ${QT_BASE_NAME}-fonts-ttf-vera \
+             ${QT_BASE_NAME}-fonts-ttf-dejavu \
+             ${QT_BASE_NAME}-fonts-pfa \
+             ${QT_BASE_NAME}-fonts-pfb \
+             ${QT_BASE_NAME}-fonts-qpf \
              ${QT_BASE_NAME}-linguist \
              ${QT_BASE_NAME}-makeqpf \
              ${QT_BASE_NAME}-mkspecs \
@@ -86,7 +90,7 @@ OTHER_PACKAGES =3D "\
              ${QT_BASE_NAME}-qt3to4"
=20
 PACKAGES +=3D "${LIB_PACKAGES} ${DEV_PACKAGES} ${DBG_PACKAGES} ${OTHER_P=
ACKAGES}"
-PACKAGES_DYNAMIC =3D "${QT_BASE_NAME}-plugin-*  ${QT_BASE_NAME}-translat=
ion-*"
+PACKAGES_DYNAMIC =3D "${QT_BASE_NAME}-plugin-* ${QT_BASE_NAME}-translati=
on-* ${QT_BASE_NAME}-fonts-*"
=20
 ALLOW_EMPTY_${PN} =3D "1"
 FILES_${PN}     =3D ""
@@ -109,7 +113,11 @@ FILES_${QT_BASE_NAME}-designer             =3D "${bi=
ndir}/*designer*"
 FILES_${QT_BASE_NAME}-designer-dbg         =3D "${bindir}/.debug/*design=
er*"
 FILES_${QT_BASE_NAME}-examples             =3D "${bindir}/${QT_DIR_NAME}=
/examples/*"
 FILES_${QT_BASE_NAME}-examples-dbg         =3D "${bindir}/${QT_DIR_NAME}=
/examples/.debug ${bindir}/${QT_DIR_NAME}/examples/*/.debug ${bindir}/${Q=
T_DIR_NAME}/examples/*/*/.debug ${bindir}/${QT_DIR_NAME}/examples/*/*/*/.=
debug ${bindir}/${QT_DIR_NAME}/examples/*/*/*/*/.debug"
-FILES_${QT_BASE_NAME}-fonts                =3D "${libdir}/fonts"
+FILES_${QT_BASE_NAME}-fonts-ttf-vera       =3D "${libdir}/fonts/Vera*.tt=
f"
+FILES_${QT_BASE_NAME}-fonts-ttf-dejavu     =3D "${libdir}/fonts/DejaVu*.=
ttf"
+FILES_${QT_BASE_NAME}-fonts-pfa            =3D "${libdir}/fonts/*.pfa"
+FILES_${QT_BASE_NAME}-fonts-pfb            =3D "${libdir}/fonts/*.pfb"
+FILES_${QT_BASE_NAME}-fonts-qpf            =3D "${libdir}/fonts/*.qpf"
 FILES_${QT_BASE_NAME}-linguist             =3D "${bindir}/*linguist* ${b=
indir}/lrelease ${bindir}/lupdate ${bindir}/lconvert ${bindir}/qm2ts"
 FILES_${QT_BASE_NAME}-linguist-dbg         =3D "${bindir}/.debug/*lingui=
st* ${bindir}/.debug/lrelease ${bindir}/.debug/lupdate ${bindir}/.debug/l=
convert ${bindir}/.debug/qm2ts"
 FILES_${QT_BASE_NAME}-pixeltool            =3D "${bindir}/pixeltool"
--=20
1.6.3.3




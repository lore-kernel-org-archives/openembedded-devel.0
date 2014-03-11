Return-Path: <sgh@sgh.dk>
Received: from mx-aarh-2.stofanet.dk (mx-aarh-2.stofanet.dk [212.10.10.12])
	by mail.openembedded.org (Postfix) with ESMTP id BC7166F6E5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2014 12:55:05 +0000 (UTC)
Received: from 5634f347.rev.stofanet.dk ([86.52.243.71] helo=asrock)
	by mx-aarh-2.stofanet.dk (envelope-from <sgh@sgh.dk>)
	with esmtp id 1WNMD2-0006dY-0L
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Mar 2014 13:55:04 +0100
Received: from koontz.lgs-net.com (localhost [127.0.0.1])
	by asrock (Postfix) with ESMTP id 5A8F07ED3D;
	Tue, 11 Mar 2014 13:55:03 +0100 (CET)
From: =?UTF-8?q?S=C3=B8ren=20Holm?= <sgh@sgh.dk>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Mar 2014 13:54:57 +0100
Message-Id: <1394542497-23181-1-git-send-email-sgh@sgh.dk>
X-Mailer: git-send-email 1.9.0
MIME-Version: 1.0
Cc: =?UTF-8?q?S=C3=B8ren=20Holm?= <sgh@sgh.dk>
Subject: [meta-qt5][PATCH] qmake5_base: Add QT_DIR_NAME to "Headers"
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Mar 2014 12:55:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Without this we get Headers =3D "/usr/include" which is not meaningfull
since is is searched by defaukt. What we realy want is "/usr/local${QT_DI=
R_NAME}"
which is my default "qt5" giving "/usr/include/qt5".

Signed-off-by: S=C3=B8ren Holm <sgh@sgh.dk>
---
 classes/qmake5_base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/classes/qmake5_base.bbclass b/classes/qmake5_base.bbclass
index 2db0fa3..24c1483 100644
--- a/classes/qmake5_base.bbclass
+++ b/classes/qmake5_base.bbclass
@@ -56,7 +56,7 @@ do_generate_qt_config_file() {
     cat > ${QT_CONF_PATH} <<EOF
 [Paths]
 Prefix =3D ${OE_QMAKE_PATH_PREFIX}
-Headers =3D ${OE_QMAKE_PATH_HEADERS}
+Headers =3D ${OE_QMAKE_PATH_HEADERS}/${QT_DIR_NAME}
 Libraries =3D ${OE_QMAKE_PATH_LIBS}
 ArchData =3D ${OE_QMAKE_PATH_ARCHDATA}
 Data =3D ${OE_QMAKE_PATH_DATA}
--=20
1.9.0



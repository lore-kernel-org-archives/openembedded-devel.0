Return-Path: <johannes.pointner@br-automation.com>
Received: from mail2.br-automation.com (mail.br-automation.com [213.33.116.60])
	by mail.openembedded.org (Postfix) with ESMTP id 67331753A4
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Apr 2018 13:33:33 +0000 (UTC)
X-AuditID: c0a80110-253ff70000000e83-f0-5ac7772ed3b7
Received: from brsmtp01.br-automation.com (Unknown_Domain [192.168.1.60])
	by mail2.br-automation.com () with SMTP id CD.DA.03715.E2777CA5;
	Fri,  6 Apr 2018 15:33:34 +0200 (CEST)
MIME-Version: 1.0
From: Johannes Pointner <johannes.pointner@br-automation.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 6 Apr 2018 15:31:48 +0200
Message-Id: <20180406133148.16279-1-johannes.pointner@br-automation.com>
X-Mailer: git-send-email 2.16.3
X-MIMETrack: Itemize by SMTP Server on BRSMTPINTERN2/InternSMTP(Release
	9.0.1FP5|November 22, 2015) at 06/04/2018 15:33:36,
	Serialize by Router on BRSMTPINTERN2/InternSMTP(Release
	9.0.1FP5|November 22, 2015) at 06/04/2018 15:33:36,
	Serialize complete at 06/04/2018 15:33:36,
	Itemize by SMTP Server on BRSMTP01/Eggelsberg/AT/B&R(Release
	9.0.1FP5|November 22, 2015) at 06.04.2018 15:33:33
X-TNEFEvaluated: 1
X-Disclaimed: 63135
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgluLIzCtJLcpLzFFi42I5sILRRlev/HiUwakVihYXDy9ldmD0OLdx
	BWMAYxSXTUpqTmZZapG+XQJXxszdJ5kL+sQqJv+bzdjAuFa4i5GTQ0LARGJh53mWLkYuDiGB
	zYwSsyc/ZAdJ8AoISpyc+YQFxGYTsJU4MuErmC0ioCvx8cNcRhCbWcBa4v3yBawgtjCQ/WjF
	OzYQm0VAReLopAtAcziA5nhItHZwQ5RrSyxb+JoZYq+8xN7WlWwgeyUEOpglvjRsYoJICEmc
	XnwWqkhYYsGEc8wTGPlmITlpFpJZCxiZVjGK5yZm5hjpJRXpJpaW5OcmlmTm5+kl5+duYoSE
	j8AOxt1vtA8xCnAwKvHwChQdjxJiTSwrrsw9xCjBwawkwrv7z7EoId6UxMqq1KL8+KLSnNTi
	Q4zSHCxK4rxWUbujhATSE0tSs1NTC1KLYLJMHJxSDYx5S6avNTWXDqyTD8zcsuL+tx3L2Rxv
	XNSSr+M9ZhUnLOk/4UH2dd/uFRY7Vt0+UfLsqeq23YVb22UeMYhOuHvr0MLTkb3lM45EL2lJ
	ahF7tkfbfrGTV8v9W4JJLx9UX35z/LB68ZtdjpndCgc19kxZ4sN0/CjXfEfntRIzlJh3bFwQ
	7OW/p0RLiaU4I9FQi7moOBEAofu8zBsCAAA=
Subject: [meta-networking][PATCH] mbedtls: upgrade to 2.8.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Apr 2018 13:33:34 -0000
Content-Transfer-Encoding: quoted-printable

This also includes a switch to Apache license, because it's the primary lic=
ense
for the project according to their homepage.

* Detail release note:
  - https://tls.mbed.org/tech-updates/releases/mbedtls-2.8.0-2.7.2-and-2.1.=
11-released

Signed-off-by: Johannes Pointner <johannes.pointner@br-automation.com>
---
 .../{mbedtls=5F1.3.17.bb =3D> mbedtls=5F2.8.0.bb}        | 27 ++++++++++++=
+---------
 1 file changed, 16 insertions(+), 11 deletions(-)
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls=5F1.3.17.bb =
=3D> mbedtls=5F2.8.0.bb} (62%)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls=5F1.3.17.=
bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls=5F2.8.0.bb
similarity index 62%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls=5F1.3.17.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls=5F2.8.0.bb
index fcfec6907..736cce1b0 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls=5F1.3.17.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls=5F2.8.0.bb
@@ -15,23 +15,28 @@ understand what the code does. It features:            =
              \
    platform abstraction and threading                                \
 "
=20
-HOMEPAGE =3D "https://polarssl.org"
-BUGTRACKER =3D "https://github.com/polarssl/polarssl/issues"
+HOMEPAGE =3D "https://tls.mbed.org/"
=20
-LICENSE =3D "GPLv2"
-LIC=5FFILES=5FCHKSUM =3D "file://LICENSE;md5=3D751419260aa954499f7abaabaa8=
82bbe"
+LICENSE =3D "Apache-2.0"
+LIC=5FFILES=5FCHKSUM =3D "file://LICENSE;md5=3D302d50a6369f5f22efdb674db90=
8167a"
=20
 SECTION =3D "libdevel"
=20
-SRC=5FURI =3D "https://tls.mbed.org/download/mbedtls-${PV}-gpl.tgz"
+SRC=5FURI =3D "https://tls.mbed.org/download/mbedtls-${PV}-apache.tgz"
=20
-SRC=5FURI[md5sum] =3D "a6ed92fc377ef60f7c24d42b900e0dad"
-SRC=5FURI[sha256sum] =3D "f5beb43e850283915e3e0f8d37495eade3bfb5beedfb61e7=
b8da70d4c68edb82"
+SRC=5FURI[md5sum] =3D "2d4b0e2cb844efde1e73d3bcd9731fef"
+SRC=5FURI[sha256sum] =3D "ab8b62b995781bcf22e87a265ed06267f87c3041198e996b=
44441223d19fa9c3"
+
+inherit cmake
+
+PACKAGECONFIG ??=3D "shared-libs programs"
+PACKAGECONFIG[shared-libs] =3D "-DUSE=5FSHARED=5FMBEDTLS=5FLIBRARY=3DON,-U=
SE=5FSHARED=5FMBEDTLS=5FLIBRARY=3DOFF"
+PACKAGECONFIG[programs] =3D "-DENABLE=5FPROGRAMS=3DON,-DENABLE=5FPROGRAMS=
=3DOFF"
+
+EXTRA=5FOECMAKE =3D "-DENABLE=5FTESTING=3DOFF -DLIB=5FINSTALL=5FDIR:STRING=
=3D${libdir}"
=20
-DEPENDS =3D "openssl"
-RDEPENDS=5F${PN} +=3D "libcrypto"
 PROVIDES +=3D "polarssl"
 RPROVIDES=5F${PN} =3D "polarssl"
-EXTRA=5FOECMAKE =3D "-DUSE=5FSHARED=5FPOLARSSL=5FLIBRARY=3Don -DLIB=5FINST=
ALL=5FDIR=3D${baselib}"
=20
-inherit cmake
+PACKAGES =3D+ "${PN}-programs"
+FILES=5F${PN}-programs =3D "${bindir}/"
--=20
2.16.3




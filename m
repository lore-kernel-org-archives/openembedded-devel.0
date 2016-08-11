Return-Path: <prvs=4031d53273=michael.davis@essvote.com>
Received: from mail1.essvote.com (mail1.essvote.com [66.37.226.19])
	by mail.openembedded.org (Postfix) with ESMTP id 96D98771F7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Aug 2016 14:59:33 +0000 (UTC)
X-AuditID: 0a000213-f79d76d0000013de-dc-57ac92d3a1bf
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by mail1.essvote.com (Symantec Messaging Gateway) with SMTP id
	79.1F.05086.3D29CA75; Thu, 11 Aug 2016 09:59:32 -0500 (CDT)
Received: from ESS-EX01.essvote.corp.local ([::1]) by
	ESS-EX01.essvote.corp.local ([::1]) with mapi id 14.03.0301.000;
	Thu, 11 Aug 2016 09:59:31 -0500
From: "Davis, Michael" <michael.davis@essvote.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCHv4] pcsc-lite: Seperate GPLV3 portions from BSD
Thread-Index: AQHR8+D3G7JXcovQoUamfW7cSZhY3g==
Date: Thu, 11 Aug 2016 14:59:31 +0000
Message-ID: <1470927539-22469-1-git-send-email-michael.davis@essvote.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.8.93]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMLMWRmVeSWpSXmKPExsWyRiBPQ/fKpDXhBp9+CFlcPLyU2YHR49zG
	FYwBjFHcNkmJJWXBmel5+nYJ3BlnjzWwFXQJVsyYeIKlgbGHr4uRk0NCwETiztJuFghbTOLC
	vfVsXYxcHEICJxglmr7vYodwZjFKbPyzjRGkik3ASOLc9U1gtohArMS8TTOZQGxmAQOJd5s3
	soLYwgLuEnMufIaq8ZH4NamFFcLWk3i1/TtYPYuAqsTxrmtANRwcvAKeEud3B4CEGYGO+H5q
	DdRIcYlbT+YzQRwnILFkz3lmCFtU4uXjf6wQtqzEtx1TWCDq9SRuTJ3CBmFrSyxb+BqsnldA
	UOLkzCcsExhFZiEZOwtJyywkLbOQtCxgZFnFKJibmJljqJdaXFyWX5Kql5yfu4kRGPRcDEzC
	OxjnTLE9xCjAwajEw3th6upwIdbEsuLK3EOM0hwsSuK8KkJK4UIC6YklqdmpqQWpRfFFpTmp
	xYcYmTg4DzFKcHBJiRSn5qWkFiWWlmTEg2IrvhgYXVINjGLdrZekJ94ssbpo7hf42m/9GuvV
	Xl0n5AVKHIPO6+c/Plec3dZ0vN4j6KGiwx7+Ocu5rrxbUc56dNuEKB3VB1P2n8rrfnPuzQn/
	atWGWVy8THzsh94r/6gTUp7G8vXa/VfCnvuqV7lnMN65Ym1x4KFCHUOr4gnpiUwdx39OeFIx
	76oQY11LhhJLcUaioRZzUXEiAOrr3xl2AgAA
Subject: [meta-oe][PATCHv4] pcsc-lite: Seperate GPLV3 portions from BSD
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
X-List-Received-Date: Thu, 11 Aug 2016 14:59:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

GPLV3 and BSD portions were originally placed in the same package.
The GPLv3 portion has been seperated into pcsc-lite-spy and
pcsc-lite-spy-dev so the package can be used with GPLv3 blacklisted.
---
 .../recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb  | 24 ++++++++++++++++++=
----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb b/meta-o=
e/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb
index cc72549..0d2cb33 100644
--- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb
+++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb
@@ -1,7 +1,13 @@
 SUMMARY =3D "PC/SC Lite smart card framework and applications"
 HOMEPAGE =3D "http://pcsclite.alioth.debian.org/"
 LICENSE =3D "BSD & GPLv3+"
-LICENSE_${PN}-dev =3D "GPLv3+"
+LICENSE_${PN} =3D "BSD"
+LICENSE_${PN}-lib =3D "BSD"
+LICENSE_${PN}-doc =3D "BSD"
+LICENSE_${PN}-dev =3D "BSD"
+LICENSE_${PN}-dbg =3D "BSD & GPLv3+"
+LICENSE_${PN}-spy =3D "GPLv3+"
+LICENSE_${PN}-spy-dev =3D "GPLv3+"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbcfbd85230ac3c586fb294c8b627cf3=
2"
 DEPENDS =3D "udev"
=20
@@ -20,14 +26,24 @@ EXTRA_OECONF =3D " \
=20
 S =3D "${WORKDIR}/pcsc-lite-${PV}"
=20
-PACKAGES =3D+ "${PN}-lib"
+PACKAGES =3D "${PN} ${PN}-dbg ${PN}-dev ${PN}-lib ${PN}-doc ${PN}-spy ${PN=
}-spy-dev"
=20
 RRECOMMENDS_${PN} =3D "ccid"
=20
-FILES_${PN}-lib =3D "${libdir}/lib*${SOLIBS}"
+FILES_${PN} =3D "${sbindir}/pcscd"
+FILES_${PN}-lib =3D "${libdir}/libpcsclite*${SOLIBS}"
+FILES_${PN}-dev =3D "${includedir} \
+                   ${libdir}/pkgconfig \
+                   ${libdir}/libpcsclite.la \
+                   ${libdir}/libpcsclite.so"
+                  =20
+FILES_${PN}-spy =3D "${bindir}/pcsc-spy \
+                   ${libdir}/libpcscspy*${SOLIBS}"
+FILES_${PN}-spy-dev =3D "${libdir}/libpcscspy.la \
+                       ${libdir}/libpcscspy.so "
=20
 RPROVIDES_${PN} +=3D "${PN}-systemd"
 RREPLACES_${PN} +=3D "${PN}-systemd"
 RCONFLICTS_${PN} +=3D "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} =3D "pcscd.socket"
-RDEPENDS_${PN} +=3D"python"
+RDEPENDS_${PN}-spy +=3D"python"
--=20
2.5.5


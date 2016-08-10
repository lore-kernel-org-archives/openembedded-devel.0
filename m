Return-Path: <prvs=00301c56f3=michael.davis@essvote.com>
Received: from mail1.essvote.com (mail1.essvote.com [66.37.226.19])
	by mail.openembedded.org (Postfix) with ESMTP id 05AC8771CC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Aug 2016 19:32:10 +0000 (UTC)
X-AuditID: 0a000213-f79d76d0000013de-a5-57ab813772fa
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by mail1.essvote.com (Symantec Messaging Gateway) with SMTP id
	0F.0B.05086.8318BA75; Wed, 10 Aug 2016 14:32:08 -0500 (CDT)
Received: from ESS-EX01.essvote.corp.local ([::1]) by
	ESS-EX01.essvote.corp.local ([::1]) with mapi id 14.03.0301.000;
	Wed, 10 Aug 2016 14:32:07 -0500
From: "Davis, Michael" <michael.davis@essvote.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH] pcsc-lite: Seperate GPLV3 portions from BSD
Thread-Index: AQHR8z3hQUMsTlUi3kST4/5fQwFJIA==
Date: Wed, 10 Aug 2016 19:32:07 +0000
Message-ID: <1470857496-24658-1-git-send-email-michael.davis@essvote.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.8.93]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMLMWRmVeSWpSXmKPExsWyRiBPQ9eicXW4wYLtEhYXDy9ldmD0OLdx
	BWMAYxS3TVJiSVlwZnqevl0Cd8blp68YC97zVKy4V9LA2MndxcjJISFgInFryx8WCFtM4sK9
	9WxdjFwcQgInGCXe9/SxQzizGCUuTTsOVsUmYCRx7vomRhBbRCBWYt6mmUwgNrOAgcS7zRtZ
	QWxhAVeJ+X+XMEHUeElcO/SfGcLWk/iwo5UdxGYRUJWY/+Y6WJxXwFPiyZNmsPmMQFd8P7UG
	aqa4xK0n85kgrhOQWLLnPDOELSrx8vE/VghbVuLbjiksEPV6EjemTmGDsLUlli18DTVfUOLk
	zCcsExhFZiEZOwtJyywkLbOQtCxgZFnFKJibmJljqJdaXFyWX5Kql5yfu4kRGPRcDEzCOxjn
	TLE9xCjAwajEwxvgsipciDWxrLgy9xCjNAeLkjivipBSuJBAemJJanZqakFqUXxRaU5q8SFG
	Jg7OQ4wSHFxSIsWpeSmpRYmlJRnxoNiKLwZGl1QDI4fbY96j3eFTs1YIMWvOmaqfdfDRQgfh
	KrHm2xMO+RgpZD4+wef2QSNAYoFB1JTklSpN1RVhyyddeLHme1HOv/w4a+PsV685y5b51L7K
	mC8cMc3hs9nrDOM3P/+X8LHsOOjv8/TUY5NpGby+J2ZnRxYdUvBe9NxDqMXpbOauh2czUoNm
	9y41U2Ipzkg01GIuKk4EAHKiXgF2AgAA
Subject: [meta-oe][PATCH] pcsc-lite: Seperate GPLV3 portions from BSD
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
X-List-Received-Date: Wed, 10 Aug 2016 19:32:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

GPLV3 and BSD portions were originally placed in the same package.
The GPLv3 portion has been seperated into pcsc-lite-spy so the package can =
be used with GPLv3 blacklisted.

Signed-off-by: Michael Davis <michael.davis@essvote.com>
---
 meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb b/meta-o=
e/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb
index cc72549..e1d405b 100644
--- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb
+++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb
@@ -1,6 +1,7 @@
 SUMMARY =3D "PC/SC Lite smart card framework and applications"
 HOMEPAGE =3D "http://pcsclite.alioth.debian.org/"
-LICENSE =3D "BSD & GPLv3+"
+LICENSE =3D "BSD"=20
+LICENSE_${PN}-spy =3D "GPLv3+"
 LICENSE_${PN}-dev =3D "GPLv3+"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbcfbd85230ac3c586fb294c8b627cf3=
2"
 DEPENDS =3D "udev"
@@ -20,14 +21,16 @@ EXTRA_OECONF =3D " \
=20
 S =3D "${WORKDIR}/pcsc-lite-${PV}"
=20
-PACKAGES =3D+ "${PN}-lib"
+PACKAGES =3D+ "${PN}-lib ${PN}-spy"
=20
 RRECOMMENDS_${PN} =3D "ccid"
=20
-FILES_${PN}-lib =3D "${libdir}/lib*${SOLIBS}"
+FILES_${PN}-spy +=3D "${bindir}/pcsc-spy \
+                    ${libdir}/libpcscspy*${SOLIBS}"
+FILES_${PN}-lib =3D "${libdir}/libpcsclite*${SOLIBS}"
=20
 RPROVIDES_${PN} +=3D "${PN}-systemd"
 RREPLACES_${PN} +=3D "${PN}-systemd"
 RCONFLICTS_${PN} +=3D "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} =3D "pcscd.socket"
-RDEPENDS_${PN} +=3D"python"
+RDEPENDS_${PN}-spy +=3D"python"
--=20
2.5.5


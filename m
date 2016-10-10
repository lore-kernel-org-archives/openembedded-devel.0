Return-Path: <prvs=9091bdaeef=michael.davis@essvote.com>
X-Greylist: delayed 901 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 10 Oct 2016 17:06:18 UTC
Received: from m2.essvote.com (m2.essvote.com [66.37.226.14])
	by mail.openembedded.org (Postfix) with ESMTP id 540E460762
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Oct 2016 17:06:18 +0000 (UTC)
X-AuditID: 0a00029b-f79b86d000002197-64-57fbc7052cb8
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by m2.essvote.com (Symantec Messaging Gateway) with SMTP id
	90.D1.08599.507CBF75; Mon, 10 Oct 2016 11:51:17 -0500 (CDT)
Received: from ESS-EX01.essvote.corp.local ([::1]) by
	ESS-EX01.essvote.corp.local ([::1]) with mapi id 14.03.0301.000;
	Mon, 10 Oct 2016 11:51:17 -0500
From: "Davis, Michael" <michael.davis@essvote.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH] pcsc-lite: Seperate GPLV3 portions from BSD
Thread-Index: AQHSIxaELC8KGM5ZbEyQ5BZfRRiZrg==
Date: Mon, 10 Oct 2016 16:51:16 +0000
Message-ID: <1476118245-2074-1-git-send-email-michael.davis@essvote.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.1.128]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPLMWRmVeSWpSXmKPExsWyRiBPQ5f1+O9wg97/ZhYXDy9ldmD0OLdx
	BWMAYxS3TVJiSVlwZnqevl0Cd8bZYw1sBV2CFTMmnmBpYOzh62Lk4JAQMJG4cj+1i5ETyBST
	uHBvPVsXIxeHkMBRRokvl7ewgCSEBGYxSsxpDgSx2QSMJM5d38QIYosIxErM2zSTCcRmFjCQ
	eLd5IyuILSzgKjH/7xImiBoviWuH/jND2HoSZ/oWgvWyCKhKLOvvBrN5BTwkJrz5DGYzAh3x
	/dQaqJniEreezGeCOE5AYsme88wQtqjEy8f/WCFsOYn+h9sYIer1JG5MncIGYWtLLFv4mhli
	vqDEyZlPWCYwisxCMnYWkpZZSFpmIWlZwMiyipEv10gvtbi4LL8kVS85P3cTIzDYuRiYZu9g
	3DPB4RCjAAejEg/vhQm/w4VYE8uKK3MPMUpzsCiJ81778ChcSCA9sSQ1OzW1ILUovqg0J7X4
	ECMTB+chRgkOLimR4tS8lNSixNKSjHhQTMUXA6NKqoFxZQD/pfw1V5OPcDr2TP+pKSHy6NY8
	z3dygaLJoaq794o3a645aj8lcXbz79DGl/1/tUuYL3+YzH57t1PwpoqnSQssKy5uzlbanr50
	fmfVnuWnp9W5isn5zk/oYNj32/OvQWKVs+TH+4UXDbakGMmJRVQuDktaNOvp288P48WXrXxQ
	9o65S/esEktxRqKhFnNRcSIAQXGYs3ICAAA=
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
X-List-Received-Date: Mon, 10 Oct 2016 17:06:19 -0000
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


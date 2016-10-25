Return-Path: <prvs=2106b95c69=michael.davis@essvote.com>
Received: from mail1.essvote.com (mail1.essvote.com [66.37.226.19])
	by mail.openembedded.org (Postfix) with ESMTP id AAA4F71ABD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Oct 2016 18:43:09 +0000 (UTC)
X-AuditID: 0a000213-f79036d00000110e-85-580fa7babb19
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by mail1.essvote.com (Symantec Messaging Gateway) with SMTP id
	9E.EF.04366.AB7AF085; Tue, 25 Oct 2016 13:43:07 -0500 (CDT)
Received: from ESS-EX01.essvote.corp.local ([::1]) by
	ESS-EX01.essvote.corp.local ([::1]) with mapi id 14.03.0301.000;
	Tue, 25 Oct 2016 13:43:06 -0500
From: "Davis, Michael" <michael.davis@essvote.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][krogoth][PATCH] pcsc-lite: Seperate GPLV3 portions
	from BSD
Thread-Index: AQHSLu+fMB0Mf6GWXUSTu8vznFAsoA==
Date: Tue, 25 Oct 2016 18:43:05 +0000
Message-ID: <1477420954-7346-1-git-send-email-michael.davis@essvote.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.1.128]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrDLMWRmVeSWpSXmKPExsWyRiBPQ3f3cv4IgwWTeS1+/Z3CbHHx8FJm
	ByaPnbPusnuc27iCMYApitsmKbGkLDgzPU/fLoE74+2152wFP4Qqdj7bytrA+JC/i5GTQ0LA
	RGLfsl4mCFtM4sK99WxdjFwcQgInGCW2/j3HDOHMYpSYdO4MI0gVm4CRxLnrm8BsEYFYiXmb
	ZgJ1c3AwC0RKHGoyBwkLCwRIvL97lBUkLCIQKnH7qSNEtZ7EzR8nwHaxCKhKnG77AjaFV8BD
	YtapDWwgNiPQDd9PrQGrYRYQl7j1ZD7UbQISS/acZ4awRSVePv7HCmHLSfQ/3MYIUa8ncWPq
	FDYIW1ti2cLXzBDzBSVOznzCMoFRZBaSsbOQtMxC0jILScsCRpZVjIK5iZk5hnqpxcVl+SWp
	esn5uZsYgXHAxcAkvINxzhTbQ4wCHIxKPLwBZXwRQqyJZcWVuYcYpTlYlMR5r314FC4kkJ5Y
	kpqdmlqQWhRfVJqTWnyIkYmD8xCjBAeXlEhxal5KalFiaUlGPCiy4ouBsSXVwJiw8e/c4/uU
	gus92z542s6MS77ZZS+59u7kyLYFJqcq/0zlYFkteOzhrZTZN2fcutu38d8J702zjP1zq72O
	vU9TU5XcssLR/MDHmx+/clyO95EOcDi262P2t8iUox3s9i13rt3t+jUz7eBL93yt8KYH5XsV
	rDQm162eZXLt7MHYa9cWpWfOWFKlxFKckWioxVxUnAgAcGn4OX8CAAA=
Subject: [meta-oe][krogoth][PATCH] pcsc-lite: Seperate GPLV3 portions from BSD
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
X-List-Received-Date: Tue, 25 Oct 2016 18:43:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

From: "Davis, Michael" <michael.davis@essvote.com>

GPLV3 and BSD portions were originally placed in the same package.
The GPLv3 portion has been seperated into pcsc-lite-spy and
pcsc-lite-spy-dev so the package can be used with GPLv3 blacklisted.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
(cherry picked from commit 54c7e784c7689d8cff4173db716bb7913c65315f)
Signed-off-by: Michael Davis <michael.davis@essvote.com>
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


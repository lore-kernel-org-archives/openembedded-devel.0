Return-Path: <lauren.post@nxp.com>
X-Greylist: delayed 5599 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 04 May 2016 20:44:25 UTC
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0067.outbound.protection.outlook.com [157.55.234.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4FCF860762
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 May 2016 20:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
	s=selector1-nxp-com;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=JIwGIm7CWBlScDpaZfGxS5/HjUKxJWevpzG7Qgra9NY=;
	b=htzav0dL+ka5jkB1qm6GkbrRa67D5kFuEvlBUsG+nwmR3CSBImaw+hQHP1iaXL5eGH3BRCcL46jKwmit55JhGqKWoahZjRdfLoVmyLFSmqUbIzjiq/YvSvGyJ/SpAoo2cMb3+Y+xT605zC8rmoWqd5H/4FKSV8tUutu1uRmrJtg=
Received: from VI1PR0401MB2031.eurprd04.prod.outlook.com (10.166.141.23) by
	VI1PR0401MB2031.eurprd04.prod.outlook.com (10.166.141.23) with
	Microsoft SMTP
	Server (TLS) id 15.1.485.9; Wed, 4 May 2016 19:11:05 +0000
Received: from VI1PR0401MB2031.eurprd04.prod.outlook.com ([10.166.141.23]) by
	VI1PR0401MB2031.eurprd04.prod.outlook.com ([10.166.141.23]) with
	mapi id 15.01.0485.014; Wed, 4 May 2016 19:11:05 +0000
From: Lauren Post <lauren.post@nxp.com>
To: Otavio Salvador <otavio@ossystems.com.br>, "Meta-OpenEmbedded Mailing
	listing" <openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe master krogoth PATCH v2] opencv: Fix metapkg
	dependencies for opencv-java and opencv-locales
Thread-Index: AQHRpYCKQxjLHTErX0inEd4Py0+gTZ+pJgvw
Date: Wed, 4 May 2016 19:11:05 +0000
Message-ID: <VI1PR0401MB2031B157C831BDD836874B27E47B0@VI1PR0401MB2031.eurprd04.prod.outlook.com>
References: <1462309956-19552-1-git-send-email-otavio@ossystems.com.br>
In-Reply-To: <1462309956-19552-1-git-send-email-otavio@ossystems.com.br>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ossystems.com.br; dkim=none (message not signed)
	header.d=none; ossystems.com.br;
	dmarc=none action=none header.from=nxp.com; 
x-originating-ip: [192.88.168.50]
x-ms-office365-filtering-correlation-id: 22888282-6b4c-45a2-c05c-08d3744fd77a
x-microsoft-exchange-diagnostics: 1; VI1PR0401MB2031;
	5:y8LCS4OwUYSm4ClQZNvV3QV6AEYzkAvOLC3vqXZ0Y753yO7r14fLGQa1CGRTYCku9mnWhQwy40zKG91HemrtNWzwCg6hg0mAuustbyQddlYOrRKmEnSlcj8+xodAgkyECkRwmaW2JybU0iyH9oeQZQ==;
	24:6G1lfltYDyZeN2mHS40zyhJe2kNK5Nfe6Gk4cYcPDIVfnFi/Rcts6hSiaEL783e3WPUH/sfFslMbOm3znsuy6bDaPOCIyU/Gayy9cllcViE=;
	7:KONvGyMsryeku78sz6er0ElJY0EGS95MzCMcRmQ6+A6YebxU4T1BEBnDWkqAqSlRltvtEoeJS1+R+fjqoL5Ea93w86Lg0STaJYobirLgTXDbbTJYXrzpofjgEuSU+ZjjGDjSSsr1/EFL4mMc5B6ZahTOk6U3qCUPYcTKHLJ9brVTtxxEU/nSPwlM5qSLECiw
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:VI1PR0401MB2031;
x-microsoft-antispam-prvs: <VI1PR0401MB20316D5F539323191F5E13BEE47B0@VI1PR0401MB2031.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(106316996507680);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(9101528026)(9101521098)(601004)(2401047)(8121501046)(5005006)(10201501046)(3002001)(6055026);
	SRVR:VI1PR0401MB2031; BCL:0; PCL:0; RULEID:;
	SRVR:VI1PR0401MB2031; 
x-forefront-prvs: 093290AD39
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(377454003)(13464003)(3846002)(50986999)(586003)(76176999)(6116002)(102836003)(54356999)(5001770100001)(87936001)(81166005)(5002640100001)(106116001)(107886002)(5008740100001)(10400500002)(5004730100002)(33656002)(189998001)(3280700002)(5003600100002)(76576001)(9686002)(1220700001)(11100500001)(2906002)(2900100001)(2950100001)(3660700001)(122556002)(8936002)(92566002)(66066001)(77096005)(74316001)(19580405001)(19580395003)(86362001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0401MB2031;
	H:VI1PR0401MB2031.eurprd04.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2016 19:11:05.2162 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2031
Subject: Re: [meta-oe master krogoth PATCH v2] opencv: Fix metapkg dependencies for opencv-java and opencv-locales
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
X-List-Received-Date: Wed, 04 May 2016 20:44:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This fixed our build break issues when including opencv and dev-pkgs in our=
 development image.

Can this be backported to krogoth branch?

Acked-by: Lauren Post <lauren.post@nxp.com>

-----Original Message-----
From: Otavio Salvador [mailto:otavio@ossystems.com.br]=20
Sent: Tuesday, May 03, 2016 4:13 PM
To: Meta-OpenEmbedded Mailing listing <openembedded-devel@lists.openembedde=
d.org>
Cc: Lauren Post <lauren.post@nxp.com>; Otavio Salvador <otavio@ossystems.co=
m.br>
Subject: [meta-oe master krogoth PATCH v2] opencv: Fix metapkg dependencies=
 for opencv-java and opencv-locales

The opencv-java is not always generated so we ought to include it, only if =
it is available. The opencv-locales is not available and ought to be skippe=
d.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2:
- Fix handling of package when java support is disabled
- Avoids rdepends on -locale packages
- Improve commit log

 meta-oe/recipes-support/opencv/opencv_3.1.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/recipes=
-support/opencv/opencv_3.1.bb
index c1f9802..789512f 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
@@ -79,7 +79,8 @@ export ANT_DIR=3D"${STAGING_DIR_NATIVE}/usr/share/ant/"
=20
 TARGET_CC_ARCH +=3D "-I${S}/include "
=20
-PACKAGES +=3D "${PN}-java-dbg ${PN}-java ${PN}-samples-dbg ${PN}-samples $=
{PN}-apps python-opencv"
+PACKAGES +=3D "${PN}-samples-dbg ${PN}-samples ${PN}-apps python-opencv \
+             ${@bb.utils.contains('PACKAGECONFIG', 'oracle-java', '${PN}-j=
ava-dbg ${PN}-java', '', d)}"
=20
 python populate_packages_prepend () {
     cv_libdir =3D d.expand('${libdir}')
@@ -104,7 +105,7 @@ python populate_packages_prepend () {
     blacklist =3D [ metapkg ]
     metapkg_rdepends =3D [ ]
     for pkg in packages[1:]:
-        if not pkg in blacklist and not pkg in metapkg_rdepends and not pk=
g.endswith('-dev') and not pkg.endswith('-dbg') and not pkg.endswith('-doc'=
) :
+        if not pkg in blacklist and not pkg in metapkg_rdepends and not pk=
g.endswith('-dev') and not pkg.endswith('-dbg') and not pkg.endswith('-doc'=
) and not pkg.endswith('-locale'):
             metapkg_rdepends.append(pkg)
     bb.data.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends), d)
=20
--
2.8.2



Return-Path: <tom.hochstein@nxp.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0063.outbound.protection.outlook.com [104.47.2.63])
	by mail.openembedded.org (Postfix) with ESMTP id E8FBE771EA
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Jan 2017 00:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=7166jfLHRREv9Blq9wpHXZ3ay0vK+1tq8emMfG58M+s=;
	b=pjZMpp6sB7AdigA8z0pMKzuySpebF9r06PDtnSL/0jHAA7r5y2PwS6LeW0gho/kGs9+CxBTn/Utsz8Hgi0qSYeQeA7g7zZ26By+Z1yilahAN6a3HYTgKMaXtv84z2V5Qt3urImI3oaZAYS2FXy9xniqhwudVktJh5uY3nbdUXC0=
Received: from AMSPR04MB309.eurprd04.prod.outlook.com (10.242.107.15) by
	AMSPR04MB309.eurprd04.prod.outlook.com (10.242.107.15) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.845.12; Fri, 20 Jan 2017 23:48:45 +0000
Received: from AMSPR04MB309.eurprd04.prod.outlook.com ([10.242.107.15]) by
	AMSPR04MB309.eurprd04.prod.outlook.com ([10.242.107.15]) with mapi id
	15.01.0845.013; Fri, 20 Jan 2017 23:48:45 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-qt5][PATCH v2] qt3d: Add assimp dependency
Thread-Index: AQHSc3egaYvotCDNUU+RsegLA/uh6KFCCGMA
Date: Fri, 20 Jan 2017 23:48:44 +0000
Message-ID: <AMSPR04MB309EAC5B52A93E3CAB026E0E2710@AMSPR04MB309.eurprd04.prod.outlook.com>
References: <1484955682-24495-1-git-send-email-tom.hochstein@nxp.com>
In-Reply-To: <1484955682-24495-1-git-send-email-tom.hochstein@nxp.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=tom.hochstein@nxp.com; 
x-originating-ip: [63.246.163.81]
x-ms-office365-filtering-correlation-id: cdbd0dc4-4234-429a-d27f-08d4418edf1e
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:(22001);SRVR:AMSPR04MB309;
x-microsoft-exchange-diagnostics: 1; AMSPR04MB309;
	7:MZFEgI+e7WH4A0xv0MMP4oALhwDNoCaPwV8t/OjgxSHn+CUZCX8uDEZQkJ5p1tCtXsEJTLFmNX1DOz/aL13xCSIt4lWeiLrgf+40y32xT5xfAnIzK2giW+NKRHzgMmLH0lKumuFCOP+TdsEDyXtR2qsE76vnVbLHebXfFlkNi/gxpWaDWhLj6Z81JD6qog3lFor3dhPgXr3YWSbtcvBrc2QrBMwDEDSIUucPV+vClx0CN1PE2L6LwHBSkRxob84uWGWmmoucbxyf2oAEYWYGseDgn9Zd44YFNv7O8De3/NBb5Wc78+kzU80Z6ZWRijiRCXekdKK3geX2LuARA/0316Aaks//AEAA8gLDaQ+9LkRh7UyWeVx7DQH0+D/lfxuhmYi4Zqtjgg/sQDztNvU0CmDVstMV7SUbLjg+b4MGVym9bhLH4JbpHq+wUdSpkzzA5ED1lsXopBfA8IfVRiXDhg==
x-microsoft-antispam-prvs: <AMSPR04MB3090C693160504D71662441E2710@AMSPR04MB309.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(185117386973197)(264703809997249);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040375)(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046)(6055026)(6041248)(20161123564025)(20161123560025)(20161123562025)(20161123555025)(6072148)(6047074);
	SRVR:AMSPR04MB309; BCL:0; PCL:0; RULEID:; SRVR:AMSPR04MB309; 
x-forefront-prvs: 01930B2BA8
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(39840400002)(39860400002)(39850400002)(39410400002)(39450400003)(199003)(13464003)(189002)(377454003)(229853002)(3660700001)(68736007)(3280700002)(450100001)(6916009)(2950100002)(74316002)(122556002)(5660300001)(86362001)(6506006)(38730400001)(99286003)(33656002)(55016002)(7696004)(5640700003)(6116002)(102836003)(6436002)(77096006)(3846002)(2501003)(25786008)(81166006)(305945005)(101416001)(66066001)(9686003)(2906002)(110136003)(105586002)(92566002)(81156014)(8936002)(2351001)(2900100001)(107886002)(7736002)(3900700001)(106356001)(50986999)(97736004)(54356999)(189998001)(53936002)(8676002)(106116001)(76176999)(32563001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AMSPR04MB309;
	H:AMSPR04MB309.eurprd04.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2017 23:48:44.8551 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMSPR04MB309
Subject: Re: [meta-qt5][PATCH v2] qt3d: Add assimp dependency
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
X-List-Received-Date: Sat, 21 Jan 2017 00:04:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

First version was based on morty. This one is on master.

Tom

-----Original Message-----
From: Tom Hochstein=20
Sent: Friday, January 20, 2017 5:41 PM
To: openembedded-devel@lists.openembedded.org
Cc: Tom Hochstein <tom.hochstein@nxp.com>
Subject: [meta-qt5][PATCH v2] qt3d: Add assimp dependency

Fix build error:

fatal error: assimp/Importer.hpp: No such file or directory

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 recipes-qt/qt5/qt3d_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qt3d_git.bb b/recipes-qt/qt5/qt3d_git.bb
index 9708ec9..d8f943f 100644
--- a/recipes-qt/qt5/qt3d_git.bb
+++ b/recipes-qt/qt5/qt3d_git.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D " \
 "
=20
 DEPENDS +=3D "qtbase"
-DEPENDS_class-target +=3D "qtdeclarative qt3d-native"
+DEPENDS_class-target +=3D "qtdeclarative qt3d-native assimp"
=20
 SRC_URI +=3D " \
     file://0001-Allow-a-tools-only-build.patch \
--=20
1.9.1



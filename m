Return-Path: <ann.thornton@nxp.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0053.outbound.protection.outlook.com [104.47.2.53])
	by mail.openembedded.org (Postfix) with ESMTP id 0BA866612C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Sep 2016 16:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=Qqc6om5CHtRrkOpL+x/HcZXfpljKd7pgjXBsOyp0Sus=;
	b=ja1grod4hTftLmLm9+2g+5CcAa0+ZVVrQgIprBZe//wfO3atwBbSEc2WxapGJ1ZJrsn8m7J1dH8GD5C/yhY2nXDlwZxoqowLkUcjKXWMLmVvEv8twFUkG4uo+BZKKC3YyQwx+n/ePb523q7/QVuklrs8GG9IiBkquOnSEv8C88c=
Received: from AM5PR0401MB2564.eurprd04.prod.outlook.com (10.169.245.15) by
	AM5PR0401MB2562.eurprd04.prod.outlook.com (10.169.245.13) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.629.6; Fri, 16 Sep 2016 14:45:20 +0000
Received: from AM5PR0401MB2564.eurprd04.prod.outlook.com ([10.169.245.15]) by
	AM5PR0401MB2564.eurprd04.prod.outlook.com ([10.169.245.15]) with
	mapi id 15.01.0629.006; Fri, 16 Sep 2016 14:45:20 +0000
From: Ann Thornton <ann.thornton@nxp.com>
To: Ann Thornton <ann.thornton@nxp.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-qt5][PATCH] packagegroup-qt5-demos.bb: Includes some
	interesting Qt5 demos.
Thread-Index: AQHRxoP78gaYIQQhG0epZ794KHT9IKB8xHpg
Date: Fri, 16 Sep 2016 14:45:20 +0000
Message-ID: <AM5PR0401MB2564D303C71FAC049601B1C986F30@AM5PR0401MB2564.eurprd04.prod.outlook.com>
References: <1c3592fa-fc90-a265-5344-d83e5efe9464@nxp.com>
In-Reply-To: <1c3592fa-fc90-a265-5344-d83e5efe9464@nxp.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=ann.thornton@nxp.com; 
x-originating-ip: [192.88.168.1]
x-ms-office365-filtering-correlation-id: a0e0e474-c393-4704-39a0-08d3de401559
x-microsoft-exchange-diagnostics: 1; AM5PR0401MB2562;
	6:XGeTKQ+ZzDNHYD1bK9jiHYGmy+6HY+KJTnJCj+Kw5mdWhjapfBI9eUWUxKwLPSZQYZt2WGgByI+PuzOiYJ5tS9P0etlu2NW+BDVTS4NzA2xsi83Mxy/kvvavBCb8GVomzrL1hWRP4g3GKbNjGeaIuQuFDarkQt/tDTsWxjB1WFUv3fpOyi+pXxgCRCEJsK4yh0A4/Ep/16DrYfqpHC5j49H0QwzXTCdwFCDgj2CsJZWcnxQdVvrNqhX488TmQko+0FCtQws8L/jQPQi91ggPFae98oVPnoKdzMkJLtsh6AfC1mSWxsTZvxee1Y98AK7GD9+XLJiUBt9/0LL2wGRqyA==;
	5:uWYRrTT0iQ1RUD2UO/jBgXuNBMBYwzqJmzFwcvTKkSRRPQahZE3QLsJPhcrpI0V+PwdLCxmhC587GtoIA29ICAUoNd6GTvIfOR12FN64KHgvo/uPvDXllsUvSMD24z049aYKl3e+uQ+8eBurtCFf/w==;
	24:3AitEeboYwyygaoFesUQ3CUOLC7h69RIEXIYW5tZ54rDlPse02gbyV8hWJS0TcStIrP3co6fgKqdOKISCrRh3Mn4byp7VlFau/oQzl5FETw=;
	7:hp4vxfqe0kbGK41adFby3hR7x9e3TZ0JZrm5kh0VN+kvv7XI1cBiTT+osdp5GWHdvqRNXMHiXzmy9+NmUBabvl/rPeFKzxwH98p8DM05pBWTNLaue1/FjBCDNDAZUfArcwxMFUhdl9+htX/55BOR9X6pPaSjj2cdE1guxfWcbK+olNjYtilzNZRdgHfB9egtMQfe7p3bBwJzkWQvX7/cUfM1WUV4zjterSJaUDOe8+qg8QA8F7RaBtoX6YP2Lydz
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:AM5PR0401MB2562;
x-microsoft-antispam-prvs: <AM5PR0401MB25621B231646460A7030637086F30@AM5PR0401MB2562.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(185117386973197)(264703809997249);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(8121501046)(5005006)(10201501046)(3002001)(6055026);
	SRVR:AM5PR0401MB2562; BCL:0; PCL:0; RULEID:;
	SRVR:AM5PR0401MB2562; 
x-forefront-prvs: 0067A8BA2A
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(377454003)(199003)(13464003)(189002)(74316002)(106356001)(586003)(7736002)(19580395003)(76176999)(6116002)(68736007)(2501003)(189998001)(345774005)(86362001)(8676002)(54356999)(107886002)(3846002)(19580405001)(5002640100001)(77096005)(106116001)(102836003)(97736004)(105586002)(101416001)(2900100001)(5001770100001)(50986999)(81166006)(11100500001)(2950100001)(81156014)(2906002)(305945005)(450100001)(3280700002)(92566002)(3660700001)(76576001)(230783001)(7846002)(66066001)(122556002)(87936001)(9686002)(33656002)(7696004)(8936002)(5660300001)(10400500002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0401MB2562;
	H:AM5PR0401MB2564.eurprd04.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2016 14:45:20.4231 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2562
Subject: Re: [meta-qt5][PATCH] packagegroup-qt5-demos.bb: Includes some interesting Qt5 demos.
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
X-List-Received-Date: Fri, 16 Sep 2016 16:16:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This also seems to have gotten lost.  This is a packagegroup putting togeth=
er some useful demos.

Thank you for looking at this.
Ann Thornton

-----Original Message-----
From: Ann Thornton [mailto:ann.thornton@nxp.com]=20
Sent: Tuesday, June 14, 2016 4:31 PM
To: openembedded-devel@lists.openembedded.org
Cc: Ann Thornton <ann.thornton@nxp.com>
Subject: [meta-qt5][PATCH] packagegroup-qt5-demos.bb: Includes some interes=
ting Qt5 demos.

Signed-off-by: Ann Thornton <ann.thornton@nxp.com>
---
  recipes-qt/packagegroups/packagegroup-qt5-demos.bb | 22=20
++++++++++++++++++++++
  1 file changed, 22 insertions(+)
  create mode 100644 recipes-qt/packagegroups/packagegroup-qt5-demos.bb

diff --git a/recipes-qt/packagegroups/packagegroup-qt5-demos.bb
b/recipes-qt/packagegroups/packagegroup-qt5-demos.bb
new file mode 100644
index 0000000..436ba03
--- /dev/null
+++ b/recipes-qt/packagegroups/packagegroup-qt5-demos.bb
@@ -0,0 +1,22 @@
+# Copyright (C) 2014 Freescale Semiconductor # Released under the MIT=20
+license (see COPYING.MIT for the terms)
+
+DESCRIPTION =3D "Package group for Qt5 demos"
+LICENSE =3D "MIT"
+
+inherit packagegroup
+
+RDEPENDS_${PN} +=3D " \
+    qtbase-examples \
+    qtdeclarative-examples \
+    qt3d-examples \
+    qtsmarthome \
+    qt5ledscreen \
+    quitbattery \
+    qt5everywheredemo \=20
+    qt5nmapcarousedemo \
+    qt5nmapper \
+    cinematicexperience \
+    quitindicators \
+    qt5-demo-extrafiles \
+  "
--
1.9.1



Return-Path: <ann.thornton@nxp.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0049.outbound.protection.outlook.com [104.47.2.49])
	by mail.openembedded.org (Postfix) with ESMTP id 32B8D60017
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Sep 2016 20:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=9ym2hLr2Yeau0RTAZlEdvrfVpSxH+FFyaWAD+5IThr8=;
	b=wItOXABYioTILlXA4MpVWUR6dBh5ld1mSC3RCJ4B8lBQTK2HrgWqsjhVS3xTKoR8IFMs2Odlan4gfBaTsa1dZFAkZ15lghkRo92rvcJtmqwd23G6eIEHdFqlbLVuEJ/kjoOKdbSZ/QELgggPXV3ekFJhKwlvGnuocFmH6cVRnAA=
Received: from AM5PR0401MB2564.eurprd04.prod.outlook.com (10.169.245.15) by
	AM5PR0401MB2562.eurprd04.prod.outlook.com (10.169.245.13) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.629.6; Fri, 16 Sep 2016 14:42:34 +0000
Received: from AM5PR0401MB2564.eurprd04.prod.outlook.com ([10.169.245.15]) by
	AM5PR0401MB2564.eurprd04.prod.outlook.com ([10.169.245.15]) with
	mapi id 15.01.0629.006; Fri, 16 Sep 2016 14:42:34 +0000
From: Ann Thornton <ann.thornton@nxp.com>
To: Ann Thornton <ann.thornton@nxp.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-qt5][PATCH] packagegroup-qt5-webengine.bb: Includes
	qtwebengine, plugins and examples in one convenient packagegroup.
Thread-Index: AQHRxoPx2nlh7LschkmZ1sFB8BNXoaB8w1DA
Date: Fri, 16 Sep 2016 14:42:34 +0000
Message-ID: <AM5PR0401MB2564188FD682DE49DFD814BD86F30@AM5PR0401MB2564.eurprd04.prod.outlook.com>
References: <564b94d2-1e21-ed78-469d-9a347cfffffe@nxp.com>
In-Reply-To: <564b94d2-1e21-ed78-469d-9a347cfffffe@nxp.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=ann.thornton@nxp.com; 
x-originating-ip: [192.88.168.1]
x-ms-office365-filtering-correlation-id: 7c6d8de6-b3b2-4ace-77b4-08d3de3fb260
x-microsoft-exchange-diagnostics: 1; AM5PR0401MB2562;
	6:JwkHYgQHJhXUwAsL1IYC0iy0KiWW4XRPzA90bkSyQWGjFZNBkaDgK6AlwNhSTCPJ8P7YezGUKG/BC5v0YvAlwja0VIAkGXQkSKn++E1ylHgWji7IjZgpb+LC+TkNWxTFvLy3zAZbnmByPipVrhg10sUgv46TAygFy4vlbD5yVkqS19/TVjuJiFGZrpPO9G/WYwsmyloadtFkaNBrCk1aFgp5qsNDideyA9JUBpflER8Z+nWOHx4qw0pfP7x4fLbIBxsBdt0YIafwolHUTj//bBYxprdWIyTn35fAWot3vJYzGr7pa3fFv7AblfFZizRAfeaKUM8UmP8jlpRtBWtarw==;
	5:n9y/XS8ebGoXzEHfLgOObqNBQbjBFh9vbJXNQu5icWx6kbBGdVCqeXnlkkVaZNTHRQpmiiTgz7WpumOcVaSt7TwgNAKDcLMGjwlAOdzeje8OWLLtcvxJ102BjjzY9ZEfM6wraAo51jzm6nrH+gO4QQ==;
	24:9QW14jPoAW1tKU6TR3SmT0nZlTuIe/CCejdOzLFszkpG2lR+mfhDmMDt/2MLotEUbgJn2gl21vg3LcEGHvzAdUNKpHD4NdmqhzZJOGW6xCA=;
	7:g4MT8YRbWqCfYLO0GT0T1n+myUIOckDYBNuKecrA/SnkeFTJ083xBvgmFTB9rDC4vQbTwdGjZE0P5AUfN4qrV5GiiryUfRMVq3NXIK2rV4rUzHo+M5GSWIqYpi5XUux799PZjJu/qVPJLql7yfx4LSUowLmMTtCOQd/Lp6nBdUp7BAj2HDPjeyW+AitRpmIok3UNrWdGjl4wnYcZ4Vm07MLrnR3tvTZRtk6sqHSwH8HlcSkH3CguitWCJ0QNjlZ9
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:AM5PR0401MB2562;
x-microsoft-antispam-prvs: <AM5PR0401MB2562F1CF01B3DEF84AABA9B086F30@AM5PR0401MB2562.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(185117386973197)(264703809997249);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(8121501046)(5005006)(10201501046)(3002001)(6055026);
	SRVR:AM5PR0401MB2562; BCL:0; PCL:0; RULEID:;
	SRVR:AM5PR0401MB2562; 
x-forefront-prvs: 0067A8BA2A
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(377454003)(199003)(13464003)(189002)(74316002)(106356001)(586003)(7736002)(19580395003)(76176999)(6116002)(68736007)(2501003)(189998001)(86362001)(8676002)(54356999)(107886002)(3846002)(19580405001)(5002640100001)(77096005)(106116001)(102836003)(97736004)(105586002)(101416001)(2900100001)(5001770100001)(50986999)(81166006)(11100500001)(2950100001)(81156014)(2906002)(305945005)(450100001)(3280700002)(92566002)(3660700001)(76576001)(230783001)(7846002)(66066001)(122556002)(87936001)(9686002)(33656002)(7696004)(8936002)(5660300001)(10400500002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0401MB2562;
	H:AM5PR0401MB2564.eurprd04.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2016 14:42:34.4933 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2562
Subject: Re: [meta-qt5][PATCH] packagegroup-qt5-webengine.bb: Includes qtwebengine, plugins and examples in one convenient packagegroup.
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
X-List-Received-Date: Fri, 16 Sep 2016 20:19:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I guess this request got lost in the system.  This packagegroup just makes =
it a bit easier to use qt webengine.

Ann Thornton

-----Original Message-----
From: Ann Thornton [mailto:ann.thornton@nxp.com]=20
Sent: Tuesday, June 14, 2016 4:30 PM
To: openembedded-devel@lists.openembedded.org
Cc: Ann Thornton <ann.thornton@nxp.com>
Subject: [meta-qt5][PATCH] packagegroup-qt5-webengine.bb: Includes qtwebeng=
ine, plugins and examples in one convenient packagegroup.

Signed-off-by: Ann Thornton <ann.thornton@nxp.com>
---
  recipes-qt/packagegroups/packagegroup-qt5-webengine.bb | 14 +++++++++++++=
+
  1 file changed, 14 insertions(+)
  create mode 100644 recipes-qt/packagegroups/packagegroup-qt5-webengine.bb

diff --git a/recipes-qt/packagegroups/packagegroup-qt5-webengine.bb
b/recipes-qt/packagegroups/packagegroup-qt5-webengine.bb
new file mode 100644
index 0000000..5d09efe
--- /dev/null
+++ b/recipes-qt/packagegroups/packagegroup-qt5-webengine.bb
@@ -0,0 +1,14 @@
+# Copyright (C) 2015 Freescale Semiconductor # Released under the MIT=20
+license (see COPYING.MIT for the terms)
+
+DESCRIPTION =3D "Package group for Qt5 webengine and examples"
+LICENSE =3D "MIT"
+
+inherit packagegroup
+
+RDEPENDS_${PN} +=3D " \
+    qtwebengine \
+    qtwebengine-qmlplugins \
+    qtquickcontrols-qmlplugins \
+    qtwebengine-examples \
+"
--
1.9.1



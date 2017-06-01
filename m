Return-Path: <mns@gomspace.com>
X-Greylist: delayed 133464 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 02 Jun 2017 01:06:39 UTC
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
	(mail-eopbgr50106.outbound.protection.outlook.com [40.107.5.106])
	by mail.openembedded.org (Postfix) with ESMTP id BA4FF601A4
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Jun 2017 01:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gomspace01.onmicrosoft.com; s=selector1-gomspace-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=OiKTKkDGfBCELsRU/bZdNVOc1385QeootVJS+C+Cyac=;
	b=PzeY68reiGlwR5JISFH6gQD+Zgr2Pa1w7ZbecYUYylFILNlw6QcjJTaCl+A2VSF5flwIZhFr7gLLCwOklJWkS4yeoGRx13qmB3ecViCVUOThF+/nm0mGeRFJwTS6YV9k+qhBAjEBcxX35Ll//2IKf8adA7+o5qMIWe/zBBJR2Hw=
Received: from AM5PR0402MB2769.eurprd04.prod.outlook.com (10.175.41.11) by
	AM5PR0402MB2771.eurprd04.prod.outlook.com (10.175.41.13) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1124.9; Thu, 1 Jun 2017 10:59:32 +0000
Received: from AM5PR0402MB2769.eurprd04.prod.outlook.com
	([fe80::5052:b387:3cc7:998]) by
	AM5PR0402MB2769.eurprd04.prod.outlook.com
	([fe80::5052:b387:3cc7:998%18]) with mapi id 15.01.1124.020;
	Thu, 1 Jun 2017 10:59:32 +0000
From: Martin Siegumfeldt <mns@gomspace.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Thread-Topic: [oe] URL of devmem2
Thread-Index: AQHS2X4ttMq8BE90gUOOHHpqWZndxqIOjvmAgABB0ySAAQfwAQ==
Date: Thu, 1 Jun 2017 10:59:32 +0000
Message-ID: <AM5PR0402MB2769C03B72253295502A09CEC4F60@AM5PR0402MB2769.eurprd04.prod.outlook.com>
References: <AM5PR0402MB2769D2B8C27E4DDADE64D7CEC4F00@AM5PR0402MB2769.eurprd04.prod.outlook.com>,
	<1496243833.26945.66.camel@linux.intel.com>,
	<AM5PR0402MB2769B4C2EB8E2882A248DD34C4F10@AM5PR0402MB2769.eurprd04.prod.outlook.com>
In-Reply-To: <AM5PR0402MB2769B4C2EB8E2882A248DD34C4F10@AM5PR0402MB2769.eurprd04.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=gomspace.com;
x-originating-ip: [2603:10a6:203:2:cafe::1b]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM5PR0402MB2771;
	7:TiMnARVaam1Bh/a40Ezaidji1P/VQqN2iN6CGzS4KsJ5L0asY6XK4JB6vrpGq8WiX1ts3oh/VMbW8y8EC5/Iy88rosN2tZ9EQIH+J9Y43VvN4Uw7mD34CH27SgpihRpX5+8cp4gSH5ZI/4M9nIQfRLXaBRPHL35s5YYN/l97S0AB3kCgo8iIJJ0tpMU5Yya3gpXrHJlQMyk8nG5MCTImwyhN/IhNGzotmoAZ+WIH435t3rFWP2hKfplt1g5tiJcOl9WR/CfxudDA9PRee52OhD1mgHWMiZflPrAJPWW0qoI/vJwb7Nur6+0zs1p96pHO0V+fiTOUfXJyArPoHx0+VQ==;
	23:oH9ecFM+0xXsAiR8dSZIYDkAyG01dIuVaG77b3dxPnmvgZMxxKxaK54whyYgJM36z+Q0wmSzJYFINlTLpC3MByb5cweURBySwjSa3BILiG9l0ho5eoFYy2L6QW7Iby9JQ4uE8xZ6Bas8KUS/k4spnw==
x-ms-traffictypediagnostic: AM5PR0402MB2771:
x-ms-office365-filtering-correlation-id: af129856-19b4-4cdd-ccb4-08d4a8dd48ba
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254075)(201703131423075);
	SRVR:AM5PR0402MB2771; 
x-microsoft-antispam-prvs: <AM5PR0402MB2771D5C2BC1060741877255DC4F60@AM5PR0402MB2771.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(166708455590820)(264703809997249)(228905959029699); 
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700093)(100105000095)(100000701093)(100105300095)(100000702093)(100105100095)(6040450)(601004)(2401047)(5005006)(8121501046)(100000703093)(100105400095)(3002001)(93006095)(93001095)(10201501046)(6041248)(20161123555025)(2016111802025)(20161123564025)(20161123562025)(20161123560025)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(6072148)(6043046)(100000704093)(100105200095)(100000705092)(100105500095);
	SRVR:AM5PR0402MB2771; BCL:0; PCL:0;
	RULEID:(100000800093)(100110000095)(100000801093)(100110300095)(100000802093)(100110100095)(100000803092)(100110400095)(100000804092)(100110200095)(100000805092)(100110500095);
	SRVR:AM5PR0402MB2771; 
x-forefront-prvs: 0325F6C77B
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(39410400002)(39400400002)(39450400003)(39840400002)(377424004)(24454002)(81166006)(229853002)(8936002)(6436002)(74316002)(53546009)(2950100002)(5660300001)(305945005)(25786009)(2900100001)(8676002)(6506006)(2906002)(189998001)(50986999)(9686003)(7696004)(6246003)(102836003)(6116002)(38730400002)(110136004)(966005)(4326008)(76176999)(3280700002)(33656002)(7736002)(478600001)(54356999)(55016002)(99286003)(54906002)(6306002)(14454004)(53936002)(86362001)(3660700001)(5250100002)(42262002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM5PR0402MB2771;
	H:AM5PR0402MB2769.eurprd04.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2017 10:59:32.6742 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 91ed1e54-6d8b-4599-84d8-65fe75fda3d1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2771
X-OriginatorOrg: gomspace.com
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	"otavio@ossystems.com.br" <otavio@ossystems.com.br>
Subject: Re: URL of devmem2
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
X-List-Received-Date: Fri, 02 Jun 2017 01:06:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Sent: Wednesday, May 31, 2017 17:17
To: Martin Siegumfeldt
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] URL of devmem2
=A0=A0=A0=20
On Tue, 2017-05-30 at 20:10 +0000, Martin Siegumfeldt wrote:
> Hi,
>=20
>=20
> Is there any chance that=A0  http://git.openembedded.org/meta-openembedde=
d/commit/?id=3Dfc801961457fe2fbb24973bb43b302ad46044cb8 and=A0  http://git.=
openembedded.org/meta-openembedded/commit/?id=3D6c584374a599f6f8d3607f20ecf=
c13a67ccf1da1 will be backported to release branches? lartmaker domain seem=
s no longer available - AFAICS all branches older than pyro is affected.
>=20

without much contexts on these two patches, send the backported patches
with proper stable releases names as prefixes to the mailing list.

Thanks Leonardo, assuming=A0https://www.openembedded.org/wiki/How_to_submit=
_a_patch_to_OpenEmbedded=A0still applies I will try it out - cheers...

Pull request issued:=A0https://github.com/openembedded/meta-openembedded/pu=
ll/46=A0as recommended at=A0https://github.com/openembedded/meta-openembedd=
ed/blob/master/meta-oe/README


>=20
> Thanks,
>=20
> Martin=


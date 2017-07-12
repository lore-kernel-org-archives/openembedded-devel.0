Return-Path: <Thomas.Thorne@net2edge.com>
X-Greylist: delayed 25225 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 13 Jul 2017 03:45:15 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0100.outbound.protection.outlook.com [104.47.2.100])
	by mail.openembedded.org (Postfix) with ESMTP id EE50B78152
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jul 2017 03:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=transitionnetworks.onmicrosoft.com; s=selector1-net2edge-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=YE4SSOuOrvZFAG6hh5C5TtUcEYEOYfJhA5r7K7c7K8Q=;
	b=pH/2edyl5BDLQEDDbZdd0qAav+UX7MhoxQL/Eoc6NtE9coLZLZi1ZZp2hKzuNvphDX7MnTC5OdBTpT/5Lbm7ak3nDiQ+UCL1qxgl3Iwq1tYnEPmb8e8Ezm7hCVFIhQbS3lwSgILyHIIr+4QjeUpu3lQhMOUdEowbmM2Txa5eC5g=
Received: from DB6PR0701MB1879.eurprd07.prod.outlook.com (10.168.10.151) by
	DB6PR0701MB2519.eurprd07.prod.outlook.com (10.168.76.19) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1261.4; Wed, 12 Jul 2017 16:28:21 +0000
Received: from DB6PR0701MB1879.eurprd07.prod.outlook.com
	([fe80::b9ae:90ec:33e9:ab34]) by
	DB6PR0701MB1879.eurprd07.prod.outlook.com
	([fe80::b9ae:90ec:33e9:ab34%13]) with mapi id 15.01.1261.012;
	Wed, 12 Jul 2017 16:28:21 +0000
From: Thomas Thorne <Thomas.Thorne@net2edge.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-networking][krogoth][PATCH] Update ser2net To Version 3.1
Thread-Index: AdL7K4KR6P/tD6vORQ6g7D423Zv0MA==
Date: Wed, 12 Jul 2017 16:28:21 +0000
Message-ID: <DB6PR0701MB187912E351129D197D22070AD3AF0@DB6PR0701MB1879.eurprd07.prod.outlook.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=net2edge.com;
x-originating-ip: [81.128.174.58]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DB6PR0701MB2519;
	7:v2LTL80fDHhZkhtNTWf7o7wDAqJ088sLeQmSlLqdgqAp8KiRCQw4MklveV+8GGP5RTCjzgGpkyaPryQkKqNI3TdwLNR4mKFrVPNlA7jYHBLsUGx/agK9urlbsLbwgkjUeQgz9EgXQXzz8VejtrVouo7X+Wiv6hNdrZn8pjbXFU4LzEde+1N3z3qsI2MkXrftvhFduDmNva0fVixk9aAzzzbpD5afvl0F9VesEdyU39BBiqgHCu+yr2oep9zSKtAHUVXNK23xKHVLZMKkcH50jeZvcjnmR2bFv1k526HQHloeO+hKPOMud2pwLYdHQ0O61vl+D01pZNTYioK07RV2B2TILnAZIjZF4gZ3tH6RmcOJ+xqdSQtlaD2lGfg0SKwTOgs9rsF6LMAuq3MI/vDmtz3XsQCCEERzNEs8hGjX3wmZTn/9OGLNPFqbCUkymJwUwdGdLS+ZOl9JPxtmNs4+oxCrutfpX2V1zYtF2fJ/e4TZ2ig8x51maIjtEwoXe+eySNWRMzIO0Fyo7gYkM3Kw7Bg7UlJRkWStQ4uEkMXoybMHi2s3WfsXvvoaRsGboIInSBUcalaze19yiI9TUQVvUdxJ7k5sz1afVbGPpp1QIpjqF6a/hQQKOBxSCNCGtZvNl2nL3mRSkIdm8+HPB+wCyKvuUiOGB8V76BYQz8FtmFzbkouudahWrZtce1HD5B1X1uNZtYNGFcDmnjCGerWnFhJDO+KChR1fqGbHIXKz3rpvqWgLgvLE1my59nrLq9Ewfx9+ZOVQFf7lpdog0wy7r6P26pt6M/XLT4aGZ7quWRo=
x-forefront-antispam-report: SFV:SKI; SCL:-1SFV:NSPM;
	SFS:(10019020)(6009001)(39400400002)(39410400002)(39450400003)(39830400002)(252514010)(377424004)(6306002)(3280700002)(2501003)(3660700001)(8676002)(8936002)(81166006)(110136004)(5640700003)(38730400002)(107886003)(6436002)(5250100002)(3846002)(2906002)(5660300001)(74316002)(478600001)(6116002)(102836003)(7736002)(305945005)(25786009)(4326008)(7696004)(6916009)(2351001)(14454004)(189998001)(966005)(6506006)(55016002)(33656002)(50986999)(86362001)(99286003)(9686003)(575784001)(53936002)(2900100001)(66066001)(72206003)(54356999)(18886065003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB6PR0701MB2519;
	H:DB6PR0701MB1879.eurprd07.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
x-ms-office365-filtering-correlation-id: 19b937b1-97a9-42b1-cb07-08d4c94302e1
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254075)(300000503095)(300135400095)(2017052603031)(201703131423075)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:DB6PR0701MB2519; 
X-MS-TrafficTypeDiagnostic: DB6PR0701MB2519:|DB6PR0701MB2519:
x-exchange-antispam-report-test: UriScan:(133145235818549)(236129657087228)(167848164394848); 
x-microsoft-antispam-prvs: <DB6PR0701MB25193280E54E066F83405F71D3AF0@DB6PR0701MB2519.eurprd07.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(5005006)(8121501046)(2017060910075)(93006095)(93001095)(10201501046)(3002001)(100000703101)(100105400095)(6041248)(20161123562025)(2016111802025)(20161123555025)(20161123564025)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(6043046)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:DB6PR0701MB2519; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:DB6PR0701MB2519; 
x-forefront-prvs: 036614DD9C
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2017 16:28:21.3488 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 851184e8-8658-4a6a-973d-aa012bcc8794
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0701MB2519
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0701MB2519;
	23:k28B5XM8pOKNX7xPfTD8OorFBnhUq9vy5fmay3n2HLx2S9NRoKCaPLLtkgXAKiSJdjEBpT1qXa/aKiczm4LCwH6XeexrtPTZJsVEaIEoxwXgawktPVnqtJARor+a9N9huyxWncAbViVeDzZsplbqHg==
X-OriginatorOrg: net2edge.com
Subject: [meta-networking][krogoth][PATCH] Update ser2net To Version 3.1
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
X-List-Received-Date: Thu, 13 Jul 2017 03:45:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Version 3.1 of ser2net adds working IPv6 support which is lacking in versio=
n 2.9.1.  IPv6 is widely supported in many of the other tools already.

My specific motivation for adding IPv6 support now and to krogoth is that I=
 wish to limit the visibility of the Telnet connection offered by ser2net t=
o a single Link Local IPv6 address.

I attempted to use version 3.0 but IPv6 was not working in that version.
I could try the more recent 3.2, 3.3 or 3.4 releases but 3.1 was the earlie=
st that worked for me.  3.1 was released on 2016-11-05 which is relatively =
recent but less so than v3.4 which is still only a release candidate or 3.3=
 which was released on 2016-12-28.
---
 .../ser2net/{ser2net_2.9.1.bb =3D> ser2net_3.1.bb}                     | 5=
 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)  rename meta-oe/recipes-co=
nnectivity/ser2net/{ser2net_2.9.1.bb =3D> ser2net_3.1.bb} (71%)

diff --git a/meta-oe/recipes-connectivity/ser2net/ser2net_2.9.1.bb b/meta-o=
e/recipes-connectivity/ser2net/ser2net_3.1.bb
similarity index 71%
rename from meta-oe/recipes-connectivity/ser2net/ser2net_2.9.1.bb
rename to meta-oe/recipes-connectivity/ser2net/ser2net_3.1.bb
index 8fe6a6f..94eab2b 100644
--- a/meta-oe/recipes-connectivity/ser2net/ser2net_2.9.1.bb
+++ b/meta-oe/recipes-connectivity/ser2net/ser2net_3.1.bb
@@ -7,8 +7,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbae3019b4c6dc413=
8c217864bd04331f"
=20
 SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/ser2net/ser2net/ser2net-${PV}.t=
ar.gz"
=20
-SRC_URI[md5sum] =3D "80011ac0e60bbdcb65f1d7a86251e3f3"
-SRC_URI[sha256sum] =3D "fdee1e69903cf409bdc6f32403a566cbc6006aa9e2a4d6f8f1=
2b90dfd5ca0d0e"
+SRC_URI[md5sum] =3D "3aa17f5b28a13e4ac16c569a3b9a7e2a"
+SRC_URI[sha256sum] =3D "ad0db28e2a4b79a6d4e4b38ec1e50a22cc80fbbb4d7cad0a42=
f651457b00475e"
+
=20
 inherit autotools pkgconfig
=20
--
2.7.4

---
Thomas A. F. Thorne MEng. AUS MIET
Software Engineer

Tel: +44 3450 130 030
Email: Thomas.Thorne@Net2Edge.com
Web: http://www.Net2Edge.com/





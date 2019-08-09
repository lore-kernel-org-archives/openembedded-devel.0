Return-Path: <Rasmus.Villemoes@prevas.se>
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
	(mail-eopbgr10135.outbound.protection.outlook.com [40.107.1.135])
	by mail.openembedded.org (Postfix) with ESMTP id 15D807F420
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Aug 2019 09:20:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=fAJZxgp0qEGTPNXUyEX+44qhRA6PNBfMDwoH5jhli2nCjfiZm1EhFG9//V4nmq8y7qgKJWn1yGWSE3/NMdsq4L2lcUuSskxwMVgA8NCnRHCLdWl+IpIqOg8tsxYdySHLWmV2rcyqdNEbAJVQ8tr95DpIjue1EIwDYgMpIogpfT4b85taB9R4EPWgmvIY3IMPXUMksjoldJfRi5bbH5KXiJD02ZoRc1h7qbL3cyrMRWaczvtW3l/J9nu40j2jjCXw89hpkByP8xyf32l6y9bzY2dGfeMZnGyC0OwxEeupIhaYTsipZBpdG6yIW/PC2eLFKYW2FzI6MZow+4DYxSNpiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=GOM5pXIIL1R2hWb7Fw+n4iZm8glVNkN7ysWKGEUT41Y=;
	b=J/ifBOyFbX0fvBR06cwu+y4Zd7NbG6LyKdoYxKPAH+Dlqfe3u7idEAd9kwD/1pTnH1TuHmURgMBWta42a3rSLpPLYZdhxDpESxumMK8xul7JxgaPV9e6V7uHWyU8PeNZrUwPDaYIhvhxPSFz5Duu8reFKh+t0P5fqQNB/QGCSGQMTQoWP6LjeFVYcyCJjGLN7hBQBD11SPDzfoEX3+HVUIEzqZph5WYwB6rnrnsvs0pMBRKDyMuHS5IYWAFjSanDWqs0kH89ongQtNTKugrkG8hSQaJDau4xI3cpiSPmO9Go4sOi7UeiBervsFElmuoAz2oiPqE+RPyGoLmClt/kuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=prevas.se; dmarc=pass action=none header.from=prevas.dk; 
	dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.se; s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=GOM5pXIIL1R2hWb7Fw+n4iZm8glVNkN7ysWKGEUT41Y=;
	b=dQBsKUXJ8jLYOkTYTEMETlo0sRBdEFkPsDb9OSOYn03GidPhd/NPGojCVDYmq+JtRcHLnHa/FbK+tCrpY4CcQXqU3gyhb57/5R/CED0/fcszwGHoMLLseAU3GXCIG3UwpV4hXJdvfVaSlRNxcBiZaGgtk0tS4zWff6ysjXsptoA=
Received: from AM0PR10MB3476.EURPRD10.PROD.OUTLOOK.COM (10.186.175.83) by
	AM0PR10MB2180.EURPRD10.PROD.OUTLOOK.COM (20.177.109.91) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2157.16; Fri, 9 Aug 2019 09:20:29 +0000
Received: from AM0PR10MB3476.EURPRD10.PROD.OUTLOOK.COM
	([fe80::9451:861a:85cc:daa0]) by
	AM0PR10MB3476.EURPRD10.PROD.OUTLOOK.COM
	([fe80::9451:861a:85cc:daa0%2]) with mapi id 15.20.2157.020;
	Fri, 9 Aug 2019 09:20:29 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-browser][PATCH 1/2] chromium: don't pass
	is_official_build=true when doing a component-build
Thread-Index: AQHVTpOv46vLQG1vlEiRH21DEsnXhA==
Date: Fri, 9 Aug 2019 09:20:29 +0000
Message-ID: <20190809092013.32650-1-rasmus.villemoes@prevas.dk>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR09CA0046.eurprd09.prod.outlook.com
	(2603:10a6:7:3c::14) To AM0PR10MB3476.EURPRD10.PROD.OUTLOOK.COM
	(2603:10a6:20b:15e::19)
x-mailer: git-send-email 2.20.1
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Rasmus.Villemoes@prevas.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [81.216.59.226]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a83e0bf3-d9c1-48d7-3b81-08d71caad24f
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:AM0PR10MB2180; 
x-ms-traffictypediagnostic: AM0PR10MB2180:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR10MB218031CB15BC3CC8C196EFBF8AD60@AM0PR10MB2180.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01244308DF
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(39850400004)(136003)(396003)(346002)(376002)(189003)(199004)(186003)(66476007)(66946007)(102836004)(1076003)(14454004)(476003)(5660300002)(66556008)(8936002)(6506007)(8976002)(305945005)(66446008)(386003)(6916009)(966005)(26005)(25786009)(2906002)(7736002)(66574012)(8676002)(71190400001)(3846002)(64756008)(6116002)(508600001)(71200400001)(81156014)(6486002)(107886003)(36756003)(4326008)(81166006)(6306002)(316002)(44832011)(6512007)(50226002)(486006)(54906003)(6436002)(2351001)(14444005)(256004)(42882007)(53936002)(99286004)(66066001)(52116002)(5640700003)(2501003)(2616005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR10MB2180;
	H:AM0PR10MB3476.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: prevas.se does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0U7F54o0WQaEgGsDqUph1Hlmo/WqjZmENasjBdXMP7TNSAwVeyAmByIqv3NVM+QkPq3A3V3EfuVhdBCKsBjo0LhiqI0Q23xjmpJ3RnjUg1whzBplrdejTH+Hh++bqF1WgVqnMUpfcnHuFNvF8dEF6LlUV615I7wI85vZMdbbp7JTqarA9KLUPccL3sVbkcvQ73KFruL4682pIwDgxmuJNsSsK1QaCXwBDDZQun1wQ2XdFIWyjj3YKvfS0Eb/gsJdA3H225Vxw3d5rW4N+PlzaOVEW/w/2CiM6B/RHEjg+yQMA6Jebkg7QF/tkqk1WAg/B+5vuZ/9SpJBBeSsEPWeNMlPgCQRgIb2hMUVnkIhTYjDYGgiDGbeEdNV9U33NOFSKP917jioPYnloILSG7N1XwAz0CEq3sbVLwbCXgsz+uQ=
MIME-Version: 1.0
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: a83e0bf3-d9c1-48d7-3b81-08d71caad24f
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2019 09:20:29.6491 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xm1Ql947fbFqvE8jol/AjGKhY4bAGG1fqEuIldDte6YpWGKYmWnQi76IL8B0j3Iewmxo6hTsGEDzoA1aYETuEqxnSW/499SNvUslHajILbI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB2180
X-Mailman-Approved-At: Mon, 19 Aug 2019 08:55:33 +0000
Cc: Maksim Sisov <msisov@igalia.com>,
	Rasmus Villemoes <Rasmus.Villemoes@prevas.se>,
	Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>,
	Jakob Dyhr Thomsen <jakob.dyhr@prevas.dk>,
	Jonas Suhr Christensen <Jonas.Christensen@prevas.dk>
Subject: [meta-browser][PATCH 1/2] chromium: don't pass is_official_build=true when doing a component-build
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
X-List-Received-Date: Fri, 09 Aug 2019 09:20:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

When setting the PACKAGECONFIG component-build, the build breaks
immediately due to this from the toplevel BUILD.gn:

if (is_official_build) {
  # An official (maximally optimized!) component (optimized for build times=
)
  # build doesn't make sense and usually doesn't work.
  assert(!is_component_build)
}

So we must make is_official_build the negative of component-build.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
 recipes-browser/chromium/chromium-gn.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-browser/chromium/chromium-gn.inc b/recipes-browser/chr=
omium/chromium-gn.inc
index d5258c0..d9735ab 100644
--- a/recipes-browser/chromium/chromium-gn.inc
+++ b/recipes-browser/chromium/chromium-gn.inc
@@ -138,7 +138,8 @@ GN_ARGS +=3D 'host_pkg_config=3D"pkg-config-native"'
 # (debug, release, official) but for historical reasons there are two
 # separate flags.
 # See also: https://groups.google.com/a/chromium.org/d/msg/chromium-dev/hk=
cb6AOX5gE/PPT1ukWoBwAJ
-GN_ARGS +=3D "is_debug=3Dfalse is_official_build=3Dtrue"
+GN_ARGS +=3D "is_debug=3Dfalse"
+GN_ARGS +=3D "is_official_build=3D${@bb.utils.contains('PACKAGECONFIG', 'c=
omponent-build', 'false', 'true', d)}"
=20
 # Starting with M61, Chromium defaults to building with its own copy of li=
bc++
 # instead of the system's libstdc++. Explicitly disable this behavior.
--=20
2.20.1



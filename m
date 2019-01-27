Return-Path: <jhofstee@victronenergy.com>
X-Greylist: delayed 40679 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 28 Jan 2019 08:08:44 UTC
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
	(mail-eopbgr130094.outbound.protection.outlook.com [40.107.13.94])
	by mail.openembedded.org (Postfix) with ESMTP id B5CEC6B50B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jan 2019 08:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=victronenergy.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=2lbSlC3oys8mBCehEujgpT3pKSu5zfLTSubF/KXkPK8=;
	b=PJsrlq7QXM51xR0zGmPmcW/SWxO4b746R6lyiG+g41llLtIaRWfQ2EXkFvFH7ugeICkYUG9PQRfmOezGPf7fh77nzmdpmE1nBYGZ9k4cNZmMZv2qlNXSt7sJASueTpIUcFZxyH8YYHpJ7QqZYGdTFBEr7eNx7rzj9vcY2RyVZLU=
Received: from VI1PR0701MB2687.eurprd07.prod.outlook.com (10.173.80.135) by
	VI1PR0701MB2717.eurprd07.prod.outlook.com (10.173.80.141) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1558.15; Sun, 27 Jan 2019 20:35:52 +0000
Received: from VI1PR0701MB2687.eurprd07.prod.outlook.com
	([fe80::ec6f:b409:48:f813]) by
	VI1PR0701MB2687.eurprd07.prod.outlook.com
	([fe80::ec6f:b409:48:f813%9]) with mapi id 15.20.1580.012;
	Sun, 27 Jan 2019 20:35:52 +0000
From: Jeroen Hofstee <jhofstee@victronenergy.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe][PATCH] nodejs 8.14.0 -> 8.15.0
Thread-Index: AQHUtn/kmWBVrDFo/k+betQ6YhtTDg==
Date: Sun, 27 Jan 2019 20:35:51 +0000
Message-ID: <1548621326-6160-1-git-send-email-jhofstee@victronenergy.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2001:1c01:3b04:4900:d0b8:b883:54d5:7586]
x-clientproxiedby: AM5PR0102CA0026.eurprd01.prod.exchangelabs.com
	(2603:10a6:206::39) To VI1PR0701MB2687.eurprd07.prod.outlook.com
	(2603:10a6:801:8::7)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=jhofstee@victronenergy.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; VI1PR0701MB2717;
	6:hHXVc80+SHVi+OaFBmAaHU6shEKCCrySndfqAAL/p49LsSPSHxiQVnO4IL+3HnF+WDOZ86TvjXdnk5JPQHSuMwSDQn9q3vhXpT2rJTYLE0mBUsVrRmQe9TK2BpAGMha4kgHz2wh0cz5QoU0A9e23dMqEZx4UWu2HEaqWL/DJT81ZuuvprPLD282IHdg7Qa0IhvGWEPe+lOO7t6bipmX0mc3GJ/LE+JHxFF6ky2Bk5PxJzkQYA8pxf0X7wZd8W16LF7A6twdWKNjiCyrJPEr2f44566GgjVPAD+htnLkIUPVUWTb/oX9p54H1Y+oBN7VA3Wph+/qvptHxWEui4N36GDwbSM48/P5aigE8mKZNRp6UfaDTjzWzsU3bUl18DANnnuJEUaUX9qu9KQHPCla9rtk4+CdDMGg687IQCZnu9/vSmXcD6eTkssoE1mO4hVkGSqlOAHbMNhQgceUpfZ7pjQ==;
	5:kf3YtdOBPZ93iDX4N2C+nnCISrLEPtbq0EDC1SQOLTcQEDtYJxqPQ7Y1Z5sPly+tQ+7Jahqb5OZAPkfe0KflQJZNyuwEIMnuoYuNAl/Lx6OJPRWna3DMAdNzcnmBxiCr0hRotR5bgAAKb3KjZDn7Vg38lVim7+YgZBSqLuU1qqL7Pw7N4Q/BtR8zX11NiPne0kgG9bZ2MsqeADvCOuRH5g==;
	7:EYbo+8ft3mnIXXIWn3wV7gy7X0+fbTQFDKBNpftLOaIp/RPFSp8DBoh6CpNnr2ATNcDVWllYF3n4O+6JghDhHGi6UpjUyM1PYQ6IxxCJ0fiVKR99ADmKGDxWHloXYkWsHcY1ZA4FpGLN155p0zwX7Q==
x-ms-office365-filtering-correlation-id: 9c807260-1a39-4c9e-6a7b-08d684970735
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
	SRVR:VI1PR0701MB2717; 
x-ms-traffictypediagnostic: VI1PR0701MB2717:
x-microsoft-antispam-prvs: <VI1PR0701MB27170B61925877AC7B35BD68C0950@VI1PR0701MB2717.eurprd07.prod.outlook.com>
x-forefront-prvs: 0930AAFAD9
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(366004)(346002)(376002)(39830400003)(396003)(189003)(199004)(54906003)(186003)(316002)(102836004)(386003)(6506007)(52116002)(46003)(99286004)(2616005)(476003)(5640700003)(6436002)(86362001)(6116002)(6306002)(486006)(36756003)(14454004)(478600001)(71200400001)(71190400001)(6512007)(14444005)(256004)(107886003)(53376002)(4326008)(105586002)(2906002)(2501003)(8676002)(53936002)(106356001)(6486002)(81166006)(81156014)(305945005)(7736002)(68736007)(97736004)(8936002)(50226002)(6916009)(25786009)(2351001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0701MB2717;
	H:VI1PR0701MB2687.eurprd07.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: victronenergy.com does not
	designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: o93UJGQ6y3v4CDJ4SF3+avUarczXLPpWY7/AmqzPvliZN93y10XVrLWXOcMgp7z1u/XnUw8IjoSfrtestIpm8dyY0auDdGwWYhK51+P35VdiHjHeJLPYgZrzlyITUOQJQQ5V/Xo4ssPI7wf3fzxwH50hMZqzQ3NIYJdjuzNxkQLw/YiKPS2iLPqe+J4tx/3UxA2p+TWDRFh6GNakl0EscYx6C2UaSRivkaHoYCVOMFL331tf8LnrHjXQas9Be9L8GtJSZdRCFPBgnDIBt44GLlGQuREX829ADcIAZmPlFpKOW7FCZfZgG1QTl46jn2RfE8EvmnjMkxPQnyW+5q4077Rxp2BiF5UEqjKUbx3jxiSJBwQ30eoNtTmnc5EN7jA723c1lOIsnu4pzPca1T1lkFvJUEAzbkq3GKTE/iUEyto=
MIME-Version: 1.0
X-OriginatorOrg: victronenergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c807260-1a39-4c9e-6a7b-08d684970735
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2019 20:35:51.3781 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 60b95f08-3558-4e94-b0f8-d690c498e225
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0701MB2717
Cc: Matthijs Vader <mvader@victronenergy.com>
Subject: [PATCH] nodejs 8.14.0 -> 8.15.0
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
X-List-Received-Date: Mon, 28 Jan 2019 08:08:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

From: Matthijs Vader <mvader@victronenergy.com>

Update nodejs to latest 8.x stable release 8.15.0.

Signed-off-by: Matthijs Vader <mvader@victronenergy.com>
Signed-off-by: Jeroen Hofstee <jhofstee@victronenergy.com>
---
 .../recipes-devtools/nodejs/{nodejs_8.14.0.bb =3D> nodejs_8.15.0.bb}    | =
4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_8.14.0.bb =3D> nodejs_8.15.=
0.bb} (96%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_8.14.0.bb b/meta-oe/rec=
ipes-devtools/nodejs/nodejs_8.15.0.bb
similarity index 96%
rename from meta-oe/recipes-devtools/nodejs/nodejs_8.14.0.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_8.15.0.bb
index 14837b7..44eaee9 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_8.14.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_8.15.0.bb
@@ -14,8 +14,8 @@ COMPATIBLE_MACHINE_mips64 =3D "(!.*mips64).*"
 SRC_URI =3D "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://0001-Disable-running-gyp-files-for-bundled-deps.patch \
 "
-SRC_URI[md5sum] =3D "07b05463e479a69750e7f9e33745ddd7"
-SRC_URI[sha256sum] =3D "8ce252913c9f6aaa9871f2d9661b6e54858dae2f0064bd3c62=
4676edb09083c4"
+SRC_URI[md5sum] =3D "bfc5da493c72ded3a7f43b5662bfc53c"
+SRC_URI[sha256sum] =3D "968523333947cc3f769d73dedc6c9c60580826d8714bc0e62c=
a4589de6a7c633"
=20
 S =3D "${WORKDIR}/node-v${PV}"
=20
--=20
2.7.4



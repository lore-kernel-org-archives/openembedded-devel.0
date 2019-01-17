Return-Path: <prvs=9132d74bb=Alistair.Francis@wdc.com>
X-Greylist: delayed 566 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 17 Jan 2019 00:46:39 UTC
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	by mail.openembedded.org (Postfix) with ESMTP id 32C006BA9D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jan 2019 00:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1547686000; x=1579222000;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=gFNqL8thCazBcu9VKcSL6HgNSJfSra9nDMup57vVCyU=;
	b=ouCM9exXSmSdqMbGJUkHGoUmH1PWJTAhdSlG5h9EhHBWhFOTL84B0U35
	cuhi/aQKMX0eYYKdc9d3R8G56yElOz1f9byqrfoXQgz/C911DR0sFbH0W
	BPYYB8XynG3rIMTHPzs+Bous5SuRp6jAmnKKdP4qml01u+n1VFW+W3geC
	pe7cY4+9iSfA/Bff+QUimE8uqGz99SSAejL/BOfxlUO2wcdwdKPGpUYNi
	z+vJrWwRg6ELVmPpodmWuejH1ir3UwfD7/UJihRGF9Vj3ERxyDfhp4WEJ
	Zf0Q2OXLqy2i88BqkKh5iGqDy0vWfwoLKsCAPrq7gdf41sEvNaBKJjCCO A==;
X-IronPort-AV: E=Sophos;i="5.56,488,1539619200"; d="scan'208";a="203940454"
Received: from mail-bn3nam04lp2057.outbound.protection.outlook.com (HELO
	NAM04-BN3-obe.outbound.protection.outlook.com) ([104.47.46.57])
	by ob1.hgst.iphmx.com with ESMTP; 17 Jan 2019 08:37:13 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=gFNqL8thCazBcu9VKcSL6HgNSJfSra9nDMup57vVCyU=;
	b=GrOiHXGcbLa24qv0fwmDzgG/qvlTtA/SwjHlOfvl9H3eOZgNDb0BNFFo4aMbw8Ih2olfhS4cqlB2K09B6QuaUGooxlJfEVe1tYLWQyFaqi7JuIiq+LMFSKGGrOzyaOpsOtLMjIYnGBEFZaCU+LJ94/qRADzrJFefJgSMN9i+2uk=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0511.namprd04.prod.outlook.com (10.173.49.12) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1537.24; Thu, 17 Jan 2019 00:37:12 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::10e5:e75d:3272:2d33]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::10e5:e75d:3272:2d33%7]) with mapi id 15.20.1516.019;
	Thu, 17 Jan 2019 00:37:12 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [PATCH] xorg-driver: xf86-video-ati: Remove x86
	COMPATIBLE_MACHINE
Thread-Index: AQHUrfzJXIaMzXWmV0WvU5s5aYkscQ==
Date: Thu, 17 Jan 2019 00:37:12 +0000
Message-ID: <20190117003705.21635-1-alistair.francis@wdc.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR03CA0034.namprd03.prod.outlook.com
	(2603:10b6:a02:a8::47) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.170]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0511;
	6:xPMC5y0yuByNugC6Dasr7DLfTvINKSshMaC12vQL0tieDM84UVatgBwIN8VH5I5G40+FJ657lqGp8JDSGq9ghMrFFAvfTjBJNBT7kEydlt1sNDqaiUPNhSyYo7LDZEgUB3UtRjCbfjD9eF8GI3P73LKgVwvsuVbdyYJXhyiR+BrPlM3hFkBWMmBt/XsVxddm9JjQ4HQjDB4PVr4lKj+CaiGhnoLCQTG8hrSBIwIu6O3nbsURzUCvVw7EB19vNO/A319XmH27OLvCqJLRdbcp6NUqUHsP5lqnPaYUeAL/GyCL7RxuD4PP4ZNXB0/jK9iz1QWQL5QCTrpWHhUcIL9tsQM/ycd4OnQlwYN8wPcgmSZHK+yqKf7G6EG0LrBYG+GhkPGayHe8U6XVjcWrbnbByYWQPCD206MtjQxQjinMOdBmE8JVJVMuVVhxmhiOe528+f4K3dT0GfSqxsKW2qR1Iw==;
	5:fYMB3m3J4T8VyV8bQhRL0QgqNtNEUheodHJjVcjERZ2jfgENCrRfelSKH5vEaB95tPWJ/pK3bmyRuIVkWBy0UsXl/Wre2+w0r2tnGOG/DFuLQn0K3q4wbHglubKyCUeAx91X/cHAup/3Ld/LBbGLueXluNRaDNRYM00nqKmwSA+7wa9x3mVeWV9TZvkJXceOE30GKjwqMfGN3GgPckwMGQ==;
	7:9S55hX6ozpexAmKHCbFLhMwfvkkKgcPJlomwMMYrdTQhPCu4cRIrawnX3fbSh+oqEnMrzxOjtCq1lNrwGogy8czYDiw6kiHFBEay9X36G+nvKNE5lnJtCRT3Y1TT4lgd5odn3oPircDoAvcLDSRbAQ==
x-ms-office365-filtering-correlation-id: aa459da4-13fb-456c-2665-08d67c13ebde
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0511; 
x-ms-traffictypediagnostic: MWHPR04MB0511:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB0511C2E4121C6B0D0E21867E90830@MWHPR04MB0511.namprd04.prod.outlook.com>
x-forefront-prvs: 0920602B08
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(376002)(136003)(396003)(39860400002)(366004)(189003)(199004)(476003)(86362001)(2616005)(1076003)(2501003)(4326008)(6116002)(2906002)(25786009)(39060400002)(72206003)(256004)(478600001)(66066001)(106356001)(4744005)(44832011)(2351001)(71190400001)(71200400001)(105586002)(486006)(52116002)(5640700003)(186003)(6486002)(97736004)(99286004)(54906003)(102836004)(6436002)(8936002)(316002)(36756003)(386003)(26005)(6506007)(14454004)(53936002)(3846002)(5660300001)(8676002)(68736007)(7736002)(305945005)(6512007)(50226002)(81156014)(81166006)(6916009);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0511;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7QUedFHe5n+RExIeZsAErjpMcQwb+d7xcvxeEi3VjlO63r3Rpe14ZT67pMdOwFWmx2s4lA1ZOSPN9Hs9UZgYQYaMBhVOnRpYXoHhHC80A4zPc8FbIAnelz1u43gFz9gHMA1mrFYTsdzgPRwZnRctlwND+gyhsLtX8spDAwLWRN/I8pXulcLRATszMITBD2Ql/G22WRbTMcg1AYTw8XxT/myNnRYtTebNs1VEVV2+FvLzBNludC5+qmw9zwbf/kswnxoenpUuncf4flybyGzFio1ZbFfx7ehcTyjFwM/aFmNYrSq0NnVgRkUiJeAKOeq593fnl3bx8vAqiPQOiohPcY2/l769hb8UJ+u7OBH7V/zx3r39ZI13rRcFSmWnHWz3nqs/HwxNm7PHAisuA61Pl/qoh24h10oK4Y3HkIYePgs=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa459da4-13fb-456c-2665-08d67c13ebde
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2019 00:37:12.1600 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0511
Subject: [PATCH] xorg-driver: xf86-video-ati: Remove x86 COMPATIBLE_MACHINE
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
X-List-Received-Date: Thu, 17 Jan 2019 00:46:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The ATI drivers can work on non-x86 platforms such as RISC-V, remove the
x86 specific COMPATIBLE_MACHINE requirement.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_18.0.1.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_18.0.1.bb =
b/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_18.0.1.bb
index 969c1a0a6..b38fb6592 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_18.0.1.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_18.0.1.bb
@@ -12,8 +12,6 @@ DEPENDS +=3D "virtual/libx11 libxvmc drm \
 inherit distro_features_check
 REQUIRED_DISTRO_FEATURES +=3D "opengl"
=20
-COMPATIBLE_HOST =3D '(i.86|x86_64).*-linux'
-
 SRC_URI[md5sum] =3D "40e7c0a5a69aba3d84e0958f58705ea7"
 SRC_URI[sha256sum] =3D "72ea3b8127d4550b64f797457f5a7851a541fa4ee2cc3f345b=
6c1886b81714a0"
=20
--=20
2.19.1



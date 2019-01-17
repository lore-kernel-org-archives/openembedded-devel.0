Return-Path: <prvs=9132d74bb=Alistair.Francis@wdc.com>
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	by mail.openembedded.org (Postfix) with ESMTP id 8904F79DED
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jan 2019 18:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1547750009; x=1579286009;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=Bzr+qY8ldLgW6ZzTMXSOBTE+pnYwAV+f1cZRsIQVYUg=;
	b=ZqJDrPu1r5q1oFeOJndEN9GHKzgNiptOIWZpNZ+FhX7jaamTSgBkN6f3
	FPCpJfq9nSJgDYneJ5ShRJh2aAqpMygjPNF1eYXvVJLHigQN6uQXORVWd
	RD9z1u8RpXtP2vQUVY5HowHVOsZPvERaz9BAulyyfGkr1MP96kooh1Q26
	Zm2+SvFpnWk04UEyPz5PAxTCAbLIZsuS4jIodoP9Ld/XWOPHh9IF3zZri
	gfD09H/N/1ruqQmz28xYYMxD3/I4yL216NUBXmpKWZi6OZMUEN2Q0gErq
	ipQrO/zj0onU4DsZ2hCGDMOPkTCidAjWAbm4+jA/4lLzsClmp6iNVfr8a w==;
X-IronPort-AV: E=Sophos;i="5.56,489,1539619200"; d="scan'208";a="204034605"
Received: from mail-dm3nam05lp2051.outbound.protection.outlook.com (HELO
	NAM05-DM3-obe.outbound.protection.outlook.com) ([104.47.49.51])
	by ob1.hgst.iphmx.com with ESMTP; 18 Jan 2019 02:33:23 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Bzr+qY8ldLgW6ZzTMXSOBTE+pnYwAV+f1cZRsIQVYUg=;
	b=OtogP/I8mFpKRVj+eoooNHbJOZrGE/B+wwFt+VMyGwPxn/4r2H9S4J75DRfBUHjs2mpM7Tcsjab2v9P2jm5dEUcQQbd6N/q2niuSPUELykvhQJhns0vpMTX0Jr0NjE05c3bDnRtQJZGNsW3hE8luhK7Ib4MCasqAUnvc5Om3Wdk=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0735.namprd04.prod.outlook.com (10.172.167.148) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1537.26; Thu, 17 Jan 2019 18:33:22 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::10e5:e75d:3272:2d33]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::10e5:e75d:3272:2d33%7]) with mapi id 15.20.1516.019;
	Thu, 17 Jan 2019 18:33:22 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [PATCH] xorg-driver: xf86-video-ati: Add RISCV to
	COMPATIBLE_MACHINE
Thread-Index: AQHUrpMg4zs9nQo+LkepbNrJz2mXOQ==
Date: Thu, 17 Jan 2019 18:33:22 +0000
Message-ID: <20190117183314.23139-1-alistair.francis@wdc.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: MWHPR04CA0050.namprd04.prod.outlook.com
	(2603:10b6:300:6c::12) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.170]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0735;
	6:ZoSzR2/lrUEV/ETwezUpwfi1P36k66/5AJcVMzYSWjL+ogifSasF3QE9llQMXuzsHEBpUykifMQSMEsxH2TgSKwWjKu/Q4ypz9ug2WEVnCxRpOj2/NSlFU0eq+Bf1yXuh+HVD5LZqrzoKEDiwxTgsxe8fKlmgygdAJQtenohgQ5zwrwy2ROBodtzyDcwsoh3QzGar1RdlEVb1w8Jxmlqh5/aoweyFZHwmx06EyvN8y06mgnna19BohCLFbwn6uBJ6GBpMT7CA4qP1Ho/LDJNU1RqH/JO6EiWOWr6xrJi2IFLIu/BKXTf/0z8ZmGsl4CeY6+Fp+vJi46GxwYN2BjQVXAOO0tt4bzqAHxMPNHsdomlGF4O9eyPHxUTmxK/E5tV9zq4ARjSnZZZ5bwJdUT1ig8r4QBMN5UqO1cfwY5XgSrkdbrG8uEhEaNAzUZEBcGIIGBQlgnESEstqC7qidtvKg==;
	5:Bme7NKZ7rlSdLCRJ5g5NJbTek7jkomFlmqL1uXq44YTtkXHJu/Yj/3WBcxVAhW28RUfLOgrLD5Apu98kCfGierqNNoTRig6iHaIZ2khVCr2UHQsR+Gpnfar66LWTHHO52RKBFw+QY7Rj7cEvIuhuZBo07isgJIk+tpFCAPuaORaftWteI5rItZoKifi+PueBAHii9/mLfFQIL/qSlYQAMQ==;
	7:ZT6mzV0Lxms9y3ASBDigHWDlDiFfzTnow3GaT+6q15nWRZD1VUgxMS5f/JAizMknhKoN3uOchhco9BUHkRK4Is3olhYEL3Eyk5aPpNqY5uBADtD3cLBohaHwiU09rBRqPcllZCpU5LIk+jmkMtGeCw==
x-ms-office365-filtering-correlation-id: 9daecf85-1033-4fa8-cafd-08d67caa4270
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0735; 
x-ms-traffictypediagnostic: MWHPR04MB0735:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB0735F6F12D188A60163B019B90830@MWHPR04MB0735.namprd04.prod.outlook.com>
x-forefront-prvs: 0920602B08
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(136003)(346002)(366004)(39860400002)(376002)(189003)(199004)(71200400001)(71190400001)(54906003)(2351001)(1076003)(105586002)(316002)(256004)(14444005)(99286004)(305945005)(106356001)(2501003)(486006)(4326008)(44832011)(4744005)(6512007)(39060400002)(97736004)(53936002)(68736007)(25786009)(3846002)(2906002)(6346003)(26005)(2616005)(5660300001)(476003)(14454004)(6916009)(6506007)(386003)(102836004)(66066001)(186003)(36756003)(86362001)(7736002)(6486002)(6116002)(5640700003)(6436002)(81166006)(81156014)(478600001)(8936002)(50226002)(72206003)(52116002)(8676002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0735;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: a21+X6TGy6r9gYUwWW9TjqKQMHaiWhyPTm7Wv9nDIxjstHtRTvYT1I6WZmxo93bbXAZ30sW8YIS/9wP3TTo2phUBz26KIDkIiZc+7D82aP4LeFFGiFxGhNlWuGevzzZe/dN38ez6xjDKl+zUAmot1J+dPfYFjQr2JJuPKG6ofIeapAlQnsFvjtKHhHif4OM/9Tqts71qFVdhGzeMotqEdqdWsXSZrrRgXWBk3wooT5vZvSSSJeF+3QZH1jXGFLliIGIfPMtdnTcEbNL+kiR6yUmdNEOl6sdCsEVQSEtVv7vmvddnbatWvjhgy8TYP0xPZit3HKCAgqSEY8/6rss/FvTrLMrOCxZBa11A1uKH9hqCq2gkZ8TlEAV8Ffn68VMpk8Nig7LiaXHhYtUDxdySPzq13pri0beV3BDSTJZekmc=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9daecf85-1033-4fa8-cafd-08d67caa4270
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2019 18:33:21.9195 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0735
Subject: [PATCH] xorg-driver: xf86-video-ati: Add RISCV to COMPATIBLE_MACHINE
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
X-List-Received-Date: Thu, 17 Jan 2019 18:33:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The ATI drivers can work on non-x86 platforms such as RISC-V, add RISC-V
as an option in the COMPATIBLE_MACHINE requirement.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_18.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_18.0.1.bb =
b/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_18.0.1.bb
index 969c1a0a6..efd76c92c 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_18.0.1.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_18.0.1.bb
@@ -12,7 +12,7 @@ DEPENDS +=3D "virtual/libx11 libxvmc drm \
 inherit distro_features_check
 REQUIRED_DISTRO_FEATURES +=3D "opengl"
=20
-COMPATIBLE_HOST =3D '(i.86|x86_64).*-linux'
+COMPATIBLE_HOST =3D '(i.86|x86_64|riscv).*-linux'
=20
 SRC_URI[md5sum] =3D "40e7c0a5a69aba3d84e0958f58705ea7"
 SRC_URI[sha256sum] =3D "72ea3b8127d4550b64f797457f5a7851a541fa4ee2cc3f345b=
6c1886b81714a0"
--=20
2.19.1



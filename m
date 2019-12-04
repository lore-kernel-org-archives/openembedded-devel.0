Return-Path: <laurent.bonnans@here.com>
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
	(mail-eopbgr40099.outbound.protection.outlook.com [40.107.4.99])
	by mail.openembedded.org (Postfix) with ESMTP id AAFB66D6F5
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Dec 2019 11:23:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=Lke+PqpEXl6Vc92F8cvzF7POSj3qlWFmxw7XRscxiqb2uDZj8D5Q5Dxu5tAYP9EBqiYLds2cKxo0RlhFSC2TMtBLYQExzvMK20176mOdEmttIYm7Jcf1shhr2XRIV6FmytUxfWgQ60MZO+DsIUavyPRnxh/TldMavTL6LMRxTw5jktAWuDRBII2SDDlt0aeajakAdLcvnpHarqo+6/sGuYbXF5QilBUvNjzUYBzEzrB4RlQOj09CXULWshgO8K14JVUeQcwM5xNkZtjwl/+NsrosAchkIJ4h4/ZJSi61J5EW0oQ4FeAbO79t0oVIvT2+aMJQpyzMaj6GtxsfWJ6gBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=6dDPtzpUL7EedgSvHekJRStXLOoyAhjZ7wCcp0rx/vg=;
	b=eF1Xdsj9l7f4fEK1iEdGFI1Sst75Ch/2uRC98hQvG15GG09Ob4j4udIP71DP0HD/03w3ZbtYoKcSpJEXBQZ3IBHN/haW9zQNQqw5hyQgEVqFBZLBaJCl9MXPKshQ30d0W5A94PZFh7Y/lzi7MBcTT3Y8qGiC2H9Hxxs2n3QFdGBx45m/90zhrnqyEw4KXSEdIbXUsbfixHSR5MvnaTomryMcVrLvmNvammOoT//DUe/SsujrSVUJgx7fNQ1m0Q7W9ZALL3Bd6nqK1SV6AVfLRr4vr5MFd9/AwsHrdbASOvDMEiysxftzU2Xcyl13PudDyGRfwITIL7bUe0ZYb93cXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=here.com; dmarc=pass action=none header.from=here.com;
	dkim=pass header.d=here.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=here.com; s=selector2; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=6dDPtzpUL7EedgSvHekJRStXLOoyAhjZ7wCcp0rx/vg=;
	b=XFWullK8sO7LQ5Qxxfd9Bucl5kytpxFk/zqrtfp9fsNV3+WlYCm8U/VAnHcz6Z8+Z/SJOFBIqpcnc9HubPBwIvOQn7Z2kHUj6eXu5UsBk9ySKpJHFU7Qonk51suYJaMOz1TNWfXN9KFXH8WjmrSAjk7Kxh5CHc8KzDL3v9r+0IA=
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com (10.173.255.158) by
	AM5PR04MB3233.eurprd04.prod.outlook.com (10.175.231.26) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2516.13; Wed, 4 Dec 2019 11:23:06 +0000
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com
	([fe80::a8a6:8d0d:aca4:7bf1]) by
	AM5PR04MB3299.eurprd04.prod.outlook.com
	([fe80::a8a6:8d0d:aca4:7bf1%7]) with mapi id 15.20.2495.014;
	Wed, 4 Dec 2019 11:23:06 +0000
From: "Bonnans, Laurent" <laurent.bonnans@here.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH] opensc: fix RDEPENDS in pcsc PACKAGECONFIG
Thread-Index: AQHVqpUzZhQUCseDrUGA2YxOyrsTww==
Date: Wed, 4 Dec 2019 11:23:06 +0000
Message-ID: <20191204112301.150670-1-laurent.bonnans@here.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=laurent.bonnans@here.com; 
x-originating-ip: [131.228.216.131]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 900ee2fd-96b1-4bca-2c67-08d778ac5603
x-ms-traffictypediagnostic: AM5PR04MB3233:|AM5PR04MB3233:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR04MB32339ACB1A9F44D53FE3EE2B855D0@AM5PR04MB3233.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:510;
x-forefront-prvs: 0241D5F98C
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(346002)(376002)(39860400002)(136003)(366004)(396003)(199004)(189003)(86362001)(8936002)(6512007)(5640700003)(107886003)(2351001)(6436002)(478600001)(81166006)(14454004)(81156014)(8676002)(6486002)(2501003)(4326008)(71200400001)(71190400001)(316002)(14444005)(25786009)(54906003)(99286004)(7736002)(66556008)(64756008)(66446008)(102836004)(2616005)(6116002)(66476007)(5660300002)(3846002)(305945005)(26005)(1076003)(6506007)(186003)(76116006)(91956017)(66946007)(6916009)(4744005)(2906002)(36756003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM5PR04MB3233;
	H:AM5PR04MB3299.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: here.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: O60i+Mpj+NSQu20I0vhxazDAV/khextoDYe7NBfhu4U5Z8Tn9+qurIlMdgVnhcFzOiacU7y2AFl7mm9QZWZjJLf8RqIV5f2jLDSjZuxBvGznbBgCjLTW/IL7F1Z9Op+IyX/IBHSJY2hf41W0F8hoJ0p888lMoRKgWBGW9XPrlirar+JGch2sW7ijcXu+hQx2UzDl7L9agBQ9x4bITH0/CYVf0lkWDUe3hbLCWkjhXC9c+aGXU6BcOQ77peXS8ygCOvo3uvJ0BKQh+yA8LuA9/STaai8KEbKS/S0D5j+joHCDv7Xtw/vcQbNFce000ZPD6q2OwDX1blhSspbU5qaTMs5AiAVEa2Yw7oXZYkRHOXO8JNc62Ucl1yqKNy44UqkJLOIq+kk/am22VVF88CmStJY/dJYtg9DN/KrStL1K1R6jrT1bSDo5LV75Hb4JqctB
MIME-Version: 1.0
X-OriginatorOrg: here.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 900ee2fd-96b1-4bca-2c67-08d778ac5603
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2019 11:23:06.8151 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6d4034cd-7225-4f72-b853-91feaea64919
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +azAeP38uBDeFZZMacu4M0jIzRKHIWFKS4Wla+U1V9fsFtPz7IdbZ5mKs19b1vk7ji1XflaLjctYA5d6rxsFdbSY8Qh5Qs/vrUGTZTeGLFI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3233
Subject: [meta-oe][PATCH] opensc: fix RDEPENDS in pcsc PACKAGECONFIG
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
X-List-Received-Date: Wed, 04 Dec 2019 11:23:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

OpenSC depends on pcsc-lite's systemd service and pkcs11 library at
runtime.

Signed-off-by: Laurent Bonnans <laurent.bonnans@here.com>
---
 meta-oe/recipes-support/opensc/opensc_0.19.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/opensc/opensc_0.19.0.bb b/meta-oe/reci=
pes-support/opensc/opensc_0.19.0.bb
index a1e29dd46..006a1b6b2 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.19.0.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.19.0.bb
@@ -31,7 +31,7 @@ EXTRA_OEMAKE =3D "DESTDIR=3D${D}"
 PACKAGECONFIG ??=3D "pcsc"
=20
 PACKAGECONFIG[openct] =3D "--enable-openct,--disable-openct,openct"
-PACKAGECONFIG[pcsc] =3D "--enable-pcsc,--disable-pcsc,pcsc-lite"
+PACKAGECONFIG[pcsc] =3D "--enable-pcsc,--disable-pcsc,pcsc-lite,pcsc-lite =
pcsc-lite-lib"
=20
 RDEPENDS_${PN} =3D "readline"
=20
--=20
2.24.0


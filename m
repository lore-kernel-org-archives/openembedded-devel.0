Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.83])
 by mx.groups.io with SMTP id smtpd.web12.147.1591649265370603763
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jun 2020 13:47:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=PpzS464z;
 spf=pass (domain: windriver.com, ip: 40.107.94.83, mailfrom: yongxin.liu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=esMS63QwU2QQvJPeJc0pVIRst7d2u8XEzU7Uyu4d5R5hFDMyhsjF97Hz1URlIk7XgxMDCUrknmuqcSVDo7U2l0aYHHe5sxZxWBgfu3rPfKyGdyjh9qWEpxKCBNN8iCJxG7+O8F/ltX4+i9IO01TpQBE0qslDDdbRsTjvc0w/8aIGr72o4zOv42L6MVdY5zQxJczxa80IM/5wBdpqdxjicdGG9TEDteJX8MXG4z8z1jBoz0YfhHeliqXOr3/yGLV3NR7ODCst8gNqEXXiNXSDSToPAekXlktLa9JtJSB9HXFGUtoOSXgjfNh+sSAXle+KQy4926s2UpgDSpgqnNUh0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jsQG9l23GBVIr52F18/HjfinjMg+HoKWAndinOU3fdI=;
 b=ihY21o1cAGaF7SPKFt952AryYmDuIswm4G/tzPeYUU5RzDiqXISs81x/MufaKGmUK+g6rvW5ruO8iYqhoRWN+OAVTA8Qk9Eiq+XrqSbjWqH8mvzu6w7veP9K/o6ZK2LOif86o5jw/sHEuhwCQ4bKTmdBOMmiqJSUd/BJ9m//hAuvsO7l/gC7bQim1I7PGrmtvBzmFGrSZLG7S4eWqZegjDqX/FojxYL+yutcDIFvzHiLwVfTpCniI7HbGecND7kCz3nYicTCRPu9Rb/Aea73P/KoFrhOlDMgRfDUpcbp/o8ESYR/9/U3dgJhDk242ephxwNFBdmKklgm+JtLfKyBdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jsQG9l23GBVIr52F18/HjfinjMg+HoKWAndinOU3fdI=;
 b=PpzS464zRhpmhgSJASJqAzbhB4C4yffA/YZIWLaSoJrurPT1CEJgiYaWaCt/ejdFc539/Rq4OE9qQvL8ceWZ5v2XU2vIgLU7MkJ1WcEUKGhIde2Ga4T3j1T2smEK4Daoa3Q4YzaX5WyI860M3Ugy8dSfhG6EDw7ikq5F69YzPZc=
Received: from DM6PR11MB4409.namprd11.prod.outlook.com (2603:10b6:5:1df::30)
 by DM6PR11MB4348.namprd11.prod.outlook.com (2603:10b6:5:1db::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Mon, 8 Jun
 2020 20:47:42 +0000
Received: from DM6PR11MB4409.namprd11.prod.outlook.com
 ([fe80::1def:a9ab:efd4:90dc]) by DM6PR11MB4409.namprd11.prod.outlook.com
 ([fe80::1def:a9ab:efd4:90dc%5]) with mapi id 15.20.3066.023; Mon, 8 Jun 2020
 20:47:42 +0000
From: "Yongxin Liu" <yongxin.liu@windriver.com>
To: "Liu, Yongxin" <Yongxin.Liu@windriver.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe][meta-oe][PATCH] intel-speed-select: Add new recipe for the tool to valid Intel SST
Thread-Topic: [oe][meta-oe][PATCH] intel-speed-select: Add new recipe for the
 tool to valid Intel SST
Thread-Index: AQHWPYtqsDqKbfzyb0GNEQhokaOsSqjPMNKg
Date: Mon, 8 Jun 2020 20:47:42 +0000
Message-ID: 
 <DM6PR11MB440914D8BAE8E62F1374A8D0E5850@DM6PR11MB4409.namprd11.prod.outlook.com>
References: <16168F6369AB6DE4.1219@lists.openembedded.org>
In-Reply-To: <16168F6369AB6DE4.1219@lists.openembedded.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
x-originating-ip: [60.247.85.82]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 32433712-d17a-4859-4572-08d80bed30ca
x-ms-traffictypediagnostic: DM6PR11MB4348:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <DM6PR11MB4348467236E86629C0736015E5850@DM6PR11MB4348.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 042857DBB5
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 0BC1U+EG6bA0+Bbu1PWqa7W/pzsw5k/WkPIw1p2OGf/Z/4gqYnyq7JnkXrOJ+ocd/T090V7fBJ3DURd1Br3E5nwYBysl22pZlhPHg0fLnwF2U8IHjwVobOXkx69ycWJRBAVvY+vKW0UJ4VlFhyc+XmrbRhidx/dl+vQNzl8egp9jJ1GSu///BR+yBgLArDv56qwfEPHKku/pgExRJg+exMYDtnCc8Cyrdnv8ueZm9BQncv/3z38zbSVyP1HV48XjsTBlRtF+xVT5oZ9fJuByssumNIiqqoLYTX8UXUL7dqtLDgFXaQlRfPpNAPJrWQpl
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4409.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(346002)(376002)(39850400004)(366004)(136003)(33656002)(478600001)(53546011)(110136005)(8936002)(316002)(7696005)(6506007)(8676002)(5660300002)(83380400001)(26005)(9686003)(55016002)(66476007)(66556008)(64756008)(66946007)(186003)(2906002)(66446008)(71200400001)(52536014)(76116006)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 kixoZ15AW30URKjVoyYTwSN4iP76aASV3ino+GWbbUOKLIY1nSXz6o4iuxzn9v8JFPowCMk+g80rtKqoLw1mj3rGXkja6RoBV41iVlScsfbX5kgfYJc4A+4GGsmeeGb2DzF+ym5EjW3vkJMDPGKm0jpu4QM1PNbTigeVXt5ylv4/SrX0nbv0M5ZdIo0JUc+SKt83m2SEvwXy9GwjesB5yPW8ea3MGb/G8qeCQB2QGby9aMOtz1BgnYToLERuHA4y81BPt3cydkSH2l38wWqd3SMD694jxe2pDnWcb5YIocu/PM1/d4uUDx4XLzEodINmXs2UvPVKLDioBdHDO7j25e/VT/3LoApo3o8jeMtJrAfGG7I2a+F/KDORz9H3m7p6mcy1oIBdp5EmH1zOmqRneBxLfxreiozt2ONjCcKTq2l9krss1yrU5AF7vrobCTJnnD9pBoOGFTjF8LhVlFXCcxaF8g8pTq9dv9ann4I8Ovw=
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32433712-d17a-4859-4572-08d80bed30ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2020 20:47:42.5652
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aAGuDKWTdfXWZ3PeLIKVPuqbFn7oxSN+A2SyIN1l+RZTJdaV2+R9K8XQTadOit4qPZqeu0zdrFBu+z0wcy7HJkmi6EIGUbgK8DjpdJ6WeGo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4348
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please ignore this. Will send V2.

Thanks,
Yongxin

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-
> devel@lists.openembedded.org> On Behalf Of Yongxin Liu
> Sent: Monday, June 8, 2020 19:50
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe][meta-oe][PATCH] intel-speed-select: Add new recipe for the
> tool to valid Intel SST
>=20
> Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
> ---
>  .../intel-speed-select/intel-speed-select.bb       | 27
> ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 meta-oe/recipes-kernel/intel-speed-select/intel-speed=
-
> select.bb
>=20
> diff --git a/meta-oe/recipes-kernel/intel-speed-select/intel-speed-
> select.bb b/meta-oe/recipes-kernel/intel-speed-select/intel-speed-
> select.bb
> new file mode 100644
> index 000000000..e62c227ed
> --- /dev/null
> +++ b/meta-oe/recipes-kernel/intel-speed-select/intel-speed-select.bb
> @@ -0,0 +1,27 @@
> +SUMMARY =3D "A tool to validate Intel Speed Select commands"
> +
> +DESCRIPTION =3D "The Intel Speed Select Technology (Intel SST) is a
> +powerful new \ collection of features giving you more granular control
> +over CPU performance \ for optimized total cost of ownership."
> +
> +LICENSE =3D "GPLv2"
> +
> +inherit kernelsrc
> +
> +do_populate_lic[depends] +=3D "virtual/kernel:do_patch"
> +
> +B =3D "${WORKDIR}/${BPN}-${PV}"
> +
> +EXTRA_OEMAKE =3D "-C ${S}/tools/power/x86/intel-speed-select O=3D${B}
> CROSS=3D${TARGET_PREFIX} CC=3D"${CC}" LD=3D"${LD}" AR=3D${AR} ARCH=3D${AR=
CH}"
> +
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> +
> +do_configure[depends] +=3D "virtual/kernel:do_shared_workdir"
> +
> +do_compile() {
> +	oe_runmake
> +}
> +
> +do_install() {
> +	oe_runmake DESTDIR=3D${D} install
> +}
> --
> 2.14.4


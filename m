Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.89])
 by mx.groups.io with SMTP id smtpd.web10.505.1591650317988791856
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jun 2020 14:05:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=pMomOcuM;
 spf=pass (domain: windriver.com, ip: 40.107.93.89, mailfrom: yongxin.liu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ae6c4BLEzRoC+Rry+QqFlbaPFK/7vg7fVA6w534tjkoPFeI+gFwBD7hquPDEc2vT/7vHEnyqbsWfE7xNHHQ9G9DDCExyBCW/3fi43/vOwwk5WenU1mV5Jr1j907Tb1FCXiW0CGlVt1fDqIr8ey7qqOiwzrhb2VjZUUUetJ3Hp80YoqMXn/msUYie7pmEJAn0qN23jJODYJOGG+0p99qSSFpTYWZHja91qOMQl1Eb1z+flPUIQMa1Qd6ZK7drGwWCLGJKQ+BG9ve3ls4tW3xjfci9cwGCasyonlMJd6yJfLVEedndxbVEjvlWhuVQ9DmkS2pFThZF7hHjjik3M+H5cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hpI12rfAiKMSKuIjTkRUUmoP0gKuvQP58J5iisaSXbM=;
 b=hCbuAX5HZb7LGDDzvxGZRVmQvTPqAGtwGs2nOyDXwXwh/p9ba87RzQxQvVNFwNJFlyVtSoG9npa/UgYj1Dx2upiroFoNjp34XFcCN/O4gE518iHhCQW7g6oC5Ix4JcalS0iJj2XqIIjMETrus2N+9wnZ/4iWW3W3c8Re6i3agiWKOC2hXulk1N3BQMhlLguRNaHbuiBvEe9rg5UES9FgPUGk8rQFDcMqK/hfPiPetLrpNk9Qsevfn5hhug4J5x/UMbkdRJEH1U5YkPVlDwZ+ZHNAmIb2Mygz/fZ5AUh/Qrsr8wfp4gcvWjzo/43eHxOm4tlWsjsYXGgXcHK2hfFCaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hpI12rfAiKMSKuIjTkRUUmoP0gKuvQP58J5iisaSXbM=;
 b=pMomOcuMbJnWAZNBj0nDIxV7FVcGC8wUyJ5eHyDdQKMNmNOLE8PqyFAN1brZZnzGEMufPtpWRvGOzIYy0D0xZTPc3b8rlgeKKRW8/glMfymhv2Y/NT4amTs8EJMud5S46wSR7hTWp3GjLHnJk7rTCYCafzzII7oHary3StMcLtA=
Received: from DM6PR11MB4409.namprd11.prod.outlook.com (2603:10b6:5:1df::30)
 by DM6PR11MB3116.namprd11.prod.outlook.com (2603:10b6:5:6b::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.19; Mon, 8 Jun
 2020 21:05:17 +0000
Received: from DM6PR11MB4409.namprd11.prod.outlook.com
 ([fe80::1def:a9ab:efd4:90dc]) by DM6PR11MB4409.namprd11.prod.outlook.com
 ([fe80::1def:a9ab:efd4:90dc%5]) with mapi id 15.20.3066.023; Mon, 8 Jun 2020
 21:05:17 +0000
From: "Yongxin Liu" <yongxin.liu@windriver.com>
To: "Liu, Yongxin" <Yongxin.Liu@windriver.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe][meta-oe][PATCH V2] intel-speed-select: Add new recipe for the tool to validate Intel SST
Thread-Topic: [oe][meta-oe][PATCH V2] intel-speed-select: Add new recipe for
 the tool to validate Intel SST
Thread-Index: AQHWPdg4LY+atKJ4FUW0g8iILft+MqjPNMtA
Date: Mon, 8 Jun 2020 21:05:17 +0000
Message-ID: 
 <DM6PR11MB4409C6B794E21CAA984D4112E5850@DM6PR11MB4409.namprd11.prod.outlook.com>
References: <1616AD5F60C5F964.2507@lists.openembedded.org>
In-Reply-To: <1616AD5F60C5F964.2507@lists.openembedded.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
x-originating-ip: [60.247.85.82]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6fd1fc4d-f0e9-4325-58a0-08d80befa549
x-ms-traffictypediagnostic: DM6PR11MB3116:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <DM6PR11MB311684C55B61D63F713866C0E5850@DM6PR11MB3116.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:277;
x-forefront-prvs: 042857DBB5
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 VqtPgTiebE5w7Rsmc0V4o/8gtEy3OF75LOySpm+XfYVhhFjhThAIkmSZxlr8Um30mYlm8MYe/mQtTWetIy6Sk+4LfDR7GjxOhcZyV8yNYaAUIZqnVL5a41Jm8fxNsVcBrMogKaKaXQqVxAFJ8RYcc/Jwlyf2qOfvHPwV2eOeZDA8nQ5zex9RJ3prhEsujN0azakceEhtHoWLOABQYrQ6EeleHwl1lqLFQSKxtpdEumqcDlCq74R2KWX+QF7smklUON3ZRqK4BsdI8aWs7UbXF3SqJ0xeOg8ZNcGRJ+NvWnKHNhwD4qszDiSd/vhLTHMv
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4409.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(376002)(366004)(346002)(396003)(39850400004)(26005)(52536014)(186003)(55016002)(7696005)(6506007)(9686003)(5660300002)(8936002)(53546011)(86362001)(110136005)(83380400001)(478600001)(66476007)(316002)(76116006)(2906002)(66446008)(66556008)(15650500001)(8676002)(64756008)(66946007)(71200400001)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 guvKqFdTnH5r8i7Ej43XsqeZ/yQKA+ZzrvjqYfTcZFirDcddfC0wU53y115kie8+Vyo56Lny5o46+3I1m9/PtuQvsHCiZhTb2JApV40CYFzLClygr5iwZKrUoWSZmF856tFhxd7X5h3s0ex94FF29V6ESR9z5l2jqKEzRZep+VEVo8OMnzEc9fodAouCCLAx47of+7CJycGDOQjr8lfCfoQnAurvbgD2XoqMPXWnBk8vTiP+hzdxiUSB0/QvPosHB9f6Du0yGtke/cWdQYgzl8VyzaeTt5FU5pQrB5e+yhVnJFi56sAJvWBxiE41rMD5N5bWAGKihgivE6kpMQI3rLR51sTU/Q5uON1CAKpjSaKCpKUh61M/84kjmoyRks+/fk8fkqo6HuFqrC14oHc/EBfC8XypOW167auT9Eqe+bOCbSyXTaoi0/AuoyFwwRniHRoVhODb2NUmYhMfW+qJCgfmLFSDfOZn1HM7seabTFw=
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fd1fc4d-f0e9-4325-58a0-08d80befa549
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2020 21:05:17.0742
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qrC/qKqr6dlN6wZ/vgZb07RpvS7qkGpRterhJ2MgL0FG4B2IdawzXtHNUNZHNGz1emhTFjOHueyQeXm4rlnlX5431n9Hk8R8VkOk9aNkPN4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3116
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

V1->V2:
1) Fix typo in commit log. "valid" -> "validate"
2) Add "COMPATIBLE_HOST" in bb file.

Thanks,
Yongxin

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-
> devel@lists.openembedded.org> On Behalf Of Yongxin Liu
> Sent: Tuesday, June 9, 2020 05:00
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe][meta-oe][PATCH V2] intel-speed-select: Add new recipe for
> the tool to validate Intel SST
>=20
> Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
> ---
>  .../intel-speed-select/intel-speed-select.bb       | 29
> ++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 meta-oe/recipes-kernel/intel-speed-select/intel-speed=
-
> select.bb
>=20
> diff --git a/meta-oe/recipes-kernel/intel-speed-select/intel-speed-
> select.bb b/meta-oe/recipes-kernel/intel-speed-select/intel-speed-
> select.bb
> new file mode 100644
> index 000000000..a34f379b4
> --- /dev/null
> +++ b/meta-oe/recipes-kernel/intel-speed-select/intel-speed-select.bb
> @@ -0,0 +1,29 @@
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
> +COMPATIBLE_HOST =3D '(x86_64|i.86).*-linux'
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


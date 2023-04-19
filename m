Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17717C6FD18
	for <webhook@archiver.kernel.org>; Wed, 19 Apr 2023 13:19:50 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.76])
 by mx.groups.io with SMTP id smtpd.web11.37513.1681910381554300272
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Apr 2023 06:19:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=d/8DUjsH;
 spf=pass (domain: siemens.com, ip: 40.107.20.76, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P1iCe6DQbCsRtTC6NbScoF7seoJn6SKvUV5HOor5D5B61hx6Uj8X/FTGSrufmFudoUulUtal+d+JBhmH7vF46GPEXub9nIJdtYj83PS8reW0eS0+Uy84cnkUmuKZgoVJyNL8KFCQU0KyfPDzXBqgq/rtahX9xff6BvXBjsRpdmEHVafZ8+sYROsWqnAQI0u56JWolJ/VAD0TAIY1MakpFEvOj7bvMfEAg4jaEEC79m1/43/sQ58yZdOZNKSA+8PT9xr/MT05rIOfvBKC/YH9ehNWxy92w2pbxfloAl08y9XV0s8fpzzg6VVHfPZBgwf+4M9et9gfZ9ya6zq+NlMBfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rs+t2bYx5YN+aHBTcxnbnk9SvAet4veyFnCUck78ASw=;
 b=iWEn1m1dB3eIh27JXidzN/ZL5Mrkldg9TvDZDNDNFgqxW3uZnljt88rKrl0ogyLc7XHpxhDTG+xGX+0jej2s75nCrdbKUkJQgKlOpZ+aw9D7Q+BWTHlA++KiSheLJ8LLbTTcTSjBK2fmtesNP/G8OBVaZtmRpbAnMB7OcoDR0KRJ0jUG5FWzbbCwRdO6g3Son5u8ysOK3K1XnugevNZ4kPL3lGlT7kE9Nv0rhM9FkqnfLJtlaXZ4EowCVdpNdmcIPu4zFnnN5vwei2DFjSOZe95iUPHTnrN1MST648V0nxjrwPTIbOaSQrJ2yXJaTCfBae7RYoTs4Fm7i6LAJWS70g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rs+t2bYx5YN+aHBTcxnbnk9SvAet4veyFnCUck78ASw=;
 b=d/8DUjsHhnW2IbinnXWHwXmeMPvFSoVFgJkY0P/3XURZD2dbErWe7FoJOB+QOvGd7IdJt9nZ9ESVaLuG2AQpofuD1tOmJCjWQdSFKC1n47rpldA4ey8V9tnRbRCQcgiIf7nWgCCzZDG7bZID3r5O8RnvZrbnJayQCDPvofdJOsf4hlO0HOAmb29rMFHyE+0kNRPQ1Z+Lw9E27CwpoBgd3yQu16tXXdm4ZludLiRGx2IukjdkNmlZNOyPqMYJEANiaHCUgzfwpEimm64l7zjCYtf+G97lZv1GDOc8XNmrFHxGrFvyC9/Zi4lAa/QqSOAXa3ORzOOs6oujeqCrlgRjBA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by VI1PR10MB3312.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:131::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Wed, 19 Apr
 2023 13:19:38 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::412e:af24:fb75:da07]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::412e:af24:fb75:da07%4]) with mapi id 15.20.6319.022; Wed, 19 Apr 2023
 13:19:38 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>
Subject: RE: [oe] [meta-oe][master][langdale][kirkstone][PATCH] ntp: whitelist
 CVE-2019-11331
Thread-Topic: [oe] [meta-oe][master][langdale][kirkstone][PATCH] ntp:
 whitelist CVE-2019-11331
Thread-Index: AQHZVq444cOjUnuEOku606frjIwzZa8y0/Ug
Date: Wed, 19 Apr 2023 13:19:38 +0000
Message-ID: 
 <AS1PR10MB569715A94CEE2A11FB789D47FD629@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <174C6101BE5619C9.18270@lists.openembedded.org>
In-Reply-To: <174C6101BE5619C9.18270@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2023-04-19T13:19:37Z;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=3bd023d8-010f-468a-a120-312e943655c0;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0
document_confidentiality: Restricted
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|VI1PR10MB3312:EE_
x-ms-office365-filtering-correlation-id: a4b86ca0-c7cf-4242-1562-08db40d8ba46
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 UF2TgVBwfNB0F+IBJvbEXCIIqASK2gCKH6McMbLnwBGzpOgAVELI8rCOucaKP6fjLz4b7JDUsI/ofgrH1KCzNpAOVbSkbPPPy0zmLoDP+qiIWyCacUyzAkmcoThf9/JWX2zRoyNN0Zf3M9dyEYvSGUqozRRTj6CetfmEmb1nPHZewiaZfk9GpWmg/IMq7AgCBQrcf9Qrx/qya1cJN1jO8mk2eAEnxG9KUzdLqMWLpKXEUqx0LHIZFQzzA+0n+7PAJH7lbgX6UAqP7QTZnguv7WbZcFsUGnpTS6+qDmDb5j8FpfoXUj3M3+z+o4awlWeuzjOPApwce+1NwEkz2rC+9kDzfubLxijh+nC1c0Yf6/gO7q16IEGuKogcDDtFFPH3YBj1Si2xPlqt8oqgjOOGaao4jD1GU/hYXF7jtfen69b+1hn1Cjwk5GCM4TETH07LUKR1ZOMSIPjDZX8rlfvTKbFJt8S85jmjodzxD6qH8uGdsqGdcCGkEt6KJ5b6mnwLDhtINcmHFtWbPv6RthLOb1QSGill4WJzPZJGNP1B0f9HAcfBoLSsV8aI9buTubkg9Kbf1g7TrDMD1pyc1P1J0ep7/MmrvpMzqaDX1w3hbAU=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(396003)(346002)(136003)(39860400002)(451199021)(38100700002)(55016003)(2906002)(8936002)(8676002)(5660300002)(52536014)(33656002)(86362001)(966005)(71200400001)(7696005)(186003)(64756008)(55236004)(66946007)(66556008)(66476007)(66446008)(53546011)(9686003)(6506007)(76116006)(41300700001)(26005)(316002)(83380400001)(110136005)(478600001)(122000001)(82960400001)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?h2AXHdAnGDI0zOhlCyeUJesh7aTLOQJF1u8wT/izUFEBY1toXXni6CYHnVkd?=
 =?us-ascii?Q?6nhmIHXHMAPAaA+SVjiUCwyQc0jO7IviKGn6nZwFrLUiBhL90rHf3Kvb1bGq?=
 =?us-ascii?Q?G5KzLbqO/q7SEtJy84rWcJpaho8mHK4DviAWfOWEunXux1fS7LHoojyUtVS7?=
 =?us-ascii?Q?pgaP13YVTW0FN30VeLL7tPkoG04oQ8pv3Rc/spelQQLM1ylsHMGEtRGWZltM?=
 =?us-ascii?Q?zJSgvv9e22JUHZWAWZURFp7LLzwxRZIXwQOuoj0BryTLPreR0eJK/e4RjI6A?=
 =?us-ascii?Q?8ClzN2Y/WjK7HWe9DW+vEriboFFEZRvOXpsUySTWR2V6/sPiiIsvVdMnFeFA?=
 =?us-ascii?Q?fS+Sl3AcLQE2dT0uRKWe/BWYg8Z5HLd4kQfY3Rr9YJQLkZlhPnAFhHjwF9YC?=
 =?us-ascii?Q?4qChNg+avZZXkOITIdgeqMFZrKIQ0nwKrFhOKtSvZ8teFOIhNzidkvvjHopo?=
 =?us-ascii?Q?6ir9yW3Evo6ORFVXuar2HSRdQdQ0rCohCDcyx7TMakJ440lCxDcLzgxZ0ueg?=
 =?us-ascii?Q?Sl+2hpDsBXBYzj/YyiAzdnAIakTLB1VixmBLkQ50dwTjGgRdrLJ8VJmlsamF?=
 =?us-ascii?Q?X7rAD0SFhDuPb6UfEJAs9epf9y8VXeQjiCLCTtaFsRE1Faq1a6F9FNmEnJWF?=
 =?us-ascii?Q?l0tz/4j/xuaMYIroW2kbc6O7UmE0Mm4bPCAcYirJgwW5W8xKt0n5WhXWIqph?=
 =?us-ascii?Q?P+4LWxtYqVhe7rYuxJlswsVuRpzfTZiloC81VH1gqcjQExC1CtLKhL61wfui?=
 =?us-ascii?Q?1I9OB2SkDdN1BusyN8xqXjTrDaXrVm0w0BSGA1lf8R5NJnqhANZQc6ily+Ld?=
 =?us-ascii?Q?2Uxhh4ocrDxiFVXr+XyAEAlB2CM/NNSQjIc+MB6P3vFxozMii42zVFT5EYbj?=
 =?us-ascii?Q?DFX9JSGWUlCt2zBZPiNDjSH/NYe78zr/QjwQZfPtogzQOi2XzTVmTTb6ITeN?=
 =?us-ascii?Q?tZJFNnOV12gKxl7BnK1OIQJUblEpcuxQD8t8HdVKqVha2mBINKFExbrNgEQQ?=
 =?us-ascii?Q?d9sl0zf52JQOWP5z65sA7n6gwGDyWILLRwd/eQZdakkMDmd99NgIaEVEEsEM?=
 =?us-ascii?Q?0UDpPdlm3yW5TjgmZiX5AM2i01E9ruUUpIKxVK4Oq8nVafcAh2ikx7rcl057?=
 =?us-ascii?Q?BMclDMu7ptx5k/ES1Bf9yMjg0gm3CG92frwfgNrkIfgLWyESk9wmDe256O+N?=
 =?us-ascii?Q?Wy/x6JFO7qCxKuOzIwpiaz2EFinhhCeSpCVMSWb6j+skARlZ0wWT5HHl8foq?=
 =?us-ascii?Q?HAB43jYGKBJFgzHmAWvthTR5U2cDSvWBiVB4hJB0dcGmkz0jXxrHdMm5bRVT?=
 =?us-ascii?Q?yRYPlu8FcS1oWzd2R7ulkvj39y9dUoy0IFN9opYAT8EHPspQphEPT7x3TZ2W?=
 =?us-ascii?Q?yIoYdhSs24s9/fylNI+ZeyUEK+/Badz9Ba/MkDMpizKXoYd0jACqRIIjNLI0?=
 =?us-ascii?Q?Uy5eQlbUDwzS48TY5OmzRZrN+1N0w7Xf9c3m5MvQszL7PVuIy73dO6h7Spmi?=
 =?us-ascii?Q?9qg5n59ZBDxGjp8h/VzktJzuTQWonKiMX5XJovYhaYewcd2fXh/b+FCo1dFD?=
 =?us-ascii?Q?5KaonpTzebc7IcO4lpNxejvAO2gvZF0U7x8033eE?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a4b86ca0-c7cf-4242-1562-08db40d8ba46
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2023 13:19:38.5272
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eA0veplXyCnu1iWKdOZMLggQmFXzmhOZEBDtGiISplG7e+9dtTJZAgZlHIG1k0jrXvz39JhIB7IkeGyoOY9Zmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3312
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Apr 2023 13:19:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102135

Hello Armin, Khem,

This patch was taken to kirkstone an langdale weeks ago but is still missin=
g on master (and therefore also in mickledore).
Could you please pick them?

Thanks,
  Peter

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists=
.openembedded.org> On Behalf Of Peter Marko via lists.openembedded.org
> Sent: Tuesday, March 14, 2023 20:49
> To: openembedded-devel@lists.openembedded.org
> Cc: Marko, Peter (ADV D EU SK BFS1) <Peter.Marko@siemens.com>
> Subject: [oe] [meta-oe][master][langdale][kirkstone][PATCH] ntp: whitelis=
t CVE-2019-11331
>
> Links from https://nvd.nist.gov/vuln/detail/CVE-2019-11331 lead to conclu=
sion that this is how icurrent ntp protocol is designed.
> New RFC is propsed for future but it will not be compatible with current =
one.
>
> See https://support.f5.com/csp/article/K09940637
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb b/meta-n=
etworking/recipes-support/ntp/ntp_4.2.8p15.bb
> index 2ae53dc64..c4589c20f 100644
> --- a/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb
> +++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb
> @@ -30,6 +30,7 @@ SRC_URI =3D "http://www.eecis.udel.edu/~ntp/ntp_spool/n=
tp4/ntp-4.2/ntp-${PV}.tar.g
>  SRC_URI[sha256sum] =3D "f65840deab68614d5d7ceb2d0bb9304ff70dcdedd09abb79=
754a87536b849c19"
> =20
>  # CVE-2016-9312 is only for windows.
> +# CVE-2019-11331 is inherent to RFC 5905 and cannot be fixed without=20
> +breaking compatibility
>  # The other CVEs are not correctly identified because cve-check  # is no=
t able to check the version correctly (it only checks for 4.2.8 omitting p1=
5 that makes the difference)  CVE_CHECK_IGNORE +=3D "\ @@ -53,6 +54,7 @@ CV=
E_CHECK_IGNORE +=3D "\
>      CVE-2016-7433 \
>      CVE-2016-9310 \
>      CVE-2016-9311 \
> +    CVE-2019-11331 \
>  "
> =20
> =20
> --
> 2.30.2



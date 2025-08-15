Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ED3ECA0ED1
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 05:52:38 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.42])
 by mx.groups.io with SMTP id smtpd.web10.5855.1755237155043365697
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Aug 2025 22:52:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=vd31BWsv;
 spf=pass (domain: siemens.com, ip: 40.107.130.42, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yB5x2ueKL95uRg139zLwNRYZWEB+FtYXnrRjdSEOleVlGFBPiu4v4Iyd0mHKmEgl35az9BAwkOU5ogtmkIXYWKryEKZT3BXYAYHEZO5Fwomvy/9tOeGUWlLboSejGBqOHu4wyj/7T7czD5Y8ZJZbdhis35AYfiO/9D6UTGgyIIgvzakxTU054XthvBP2Y350N53G+BUW5xtKr+BlqqDc9e3OLMDAJHKPjFMuWkyHfT6BuGxUs1eSDjuYApLfhbsdM/JoKK/iQ9zrlL/a2ThLohpt1cTK29VLwyhfkrFrFsnfTBXJngCe1ZByxxnWTVkBj1X+nzNfwdoLgp0lN7OmpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MxYuSq9kg8wfLO8fzvI+2BGJrlKdZktydvo4HxA+to4=;
 b=qWQ/VHnCezGKOFWlYcAnAngwsgCvblauC/QWjr1V1ErbOy+IQTNpq5uAVbOwvi4WklRxotop11ZFvPrThIycu23dCMrUJ7IBXNSVBcJ08q+Kj7rfWZKeh1YINmr87DRntQBC8PkWh5kYl5epiMDsQNkWRiuAg13xVd/ZVSTFsOSBj6MJY7x4mkiPiZCSDy5VUngP6pELhBQuzU8kb8ZNNorfJkd4Oppqnk6RrU2vfTpUoj9nd1CMDgYjPg5GWiR0dNbHBuVBBgbj5RHS5WD65f7r1a0BjfM4kvVcWNSJDFho/Iq7Nl8tkCBdRkxnrAn05WvAdBazOdH8UQ6TkWgT7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MxYuSq9kg8wfLO8fzvI+2BGJrlKdZktydvo4HxA+to4=;
 b=vd31BWsv0LG1gbehuYkv6qKnDHvs5FIAjRtI3C3P+Kx+X0Io8w4Nlg1c4x35UeSQ2QSxOZvL26fpbzAetNJLnF14LsE0zVyu7/bdSGmY84UkLT3YlMk45RaLu24nPWehBvxRNj24HdrR9TrpDTDOh+yoVY6sCuRWt5buPSWNcKMAc8VRfg1MBJSAXIqCfRhWa+oYVfbOKWRJVe18m51A5/AjPCpbo8Cv/zOL+z/DiOCghId9QWsBgeBI/fLPp9dG7GWUUb5IEbQS/+tvPofA8mAFDa9KPpjK9utg6tb5ZMeKQ7DCekVrMDY7cUc5LnCwcuHLlA7nNW2e5y108/D5NA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DU2PR10MB7725.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:46d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Fri, 15 Aug
 2025 05:52:32 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%7]) with mapi id 15.20.9009.018; Fri, 15 Aug 2025
 05:52:32 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "karn.jye.lau@intel.com" <karn.jye.lau@intel.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-networking][scarthgap][PATCH] mbedtls: fix git fetcher
 conflict by using SRC_URI.
Thread-Topic: [oe] [meta-networking][scarthgap][PATCH] mbedtls: fix git
 fetcher conflict by using SRC_URI.
Thread-Index: AQHcDZsLPP8TZUoOrk+X1krjohD77LRjNfGA
Date: Fri, 15 Aug 2025 05:52:32 +0000
Message-ID: 
 <AS1PR10MB569789D04BA92FFBEBDCB664FD34A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250815041114.481650-1-karn.jye.lau@intel.com>
In-Reply-To: <20250815041114.481650-1-karn.jye.lau@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=79510229-3cbf-47e6-bd6e-de6256f29579;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-08-15T05:51:00Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DU2PR10MB7725:EE_
x-ms-office365-filtering-correlation-id: 4368e518-44cc-4221-4ce3-08dddbbfed37
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?anulO18oW1rqqpGg1oLOeIkn0bt9WbpOom/kFXHo4qs6xgpbtrMs+2CWHqo6?=
 =?us-ascii?Q?//j6xGwB+rPBaS5sG8klu92nriQHwIAxc6B7PjRV7D7ZTG8z2fm1mghTEnKH?=
 =?us-ascii?Q?OzNgQj1qEfSY6ZzEoqt0rvPtdfXjLpO5bIVYfsHmooc1c0ZtmjobeuAet0//?=
 =?us-ascii?Q?XfeL45WhCNeWGoPK7PRzWlZMPseM/G14BtQLVjuKP6LgS5aBFUrlFhdv67zv?=
 =?us-ascii?Q?TTLs/dZtpKUkns63c5uNrhsLpy4mUOVlQ1dI/WGM8sxI7Bqg+rvFGIx39m+M?=
 =?us-ascii?Q?MW1A6KPZSIpGDTyKIay8hItBIBBtq8OCPovJZSVlRoibBfp/Of5AXqRY2Bbn?=
 =?us-ascii?Q?eGGzEPpn1iBjAEa77uluoLwz+7lbDFOEJqWfH40cSMG4r8UF8Epht1izP0jj?=
 =?us-ascii?Q?XjkQ5IRn1P88THRHfQxMO9LmZsIr8pC01q6T+AXcfRraKpwLFKh26IQmIS+8?=
 =?us-ascii?Q?I0+c4HvW/Q87dOVuMedrKhKUhRYLhmexoNrD0cgfOegKyAG45QlilthaRKRY?=
 =?us-ascii?Q?n2btyt/2lxhYkfAactCk0rsK8X0MXVoSRTOzv1c3x2sGnj3ybvjuvvl0Zcvo?=
 =?us-ascii?Q?9aM0unaQMBfeJ5P8Li5YjFNmy3Qi6pkyPJviTlZHhiNQKn3JbYo/D8TQ7D8+?=
 =?us-ascii?Q?4iqhfImPJfBYJpzuJi03mALl0Mppv2a9EZoDtY0pWIhppmF0eRDa84C/kuAs?=
 =?us-ascii?Q?tHj++txm9LpV+APGxuD+jba22TiYq6ozJcjqw66dAShY7yVyAqb6DqxnDmlw?=
 =?us-ascii?Q?RNjGuXiHxHM3qnxePBEIQRNOUgAwvV32NGO68uaMpTGR/5oCV0TIODHGOLx+?=
 =?us-ascii?Q?sgDyUYKVtV/Zl8Vs+ICIxYWCv6qp63ALFPCr8eq9LE+Plf3jz+xNYN1ya1LC?=
 =?us-ascii?Q?0RK8GzjsF1iBTlmjIsM9WN5mOJX14idAk+3BlM3LFtF6Ne9GwF2XLVCz4iNa?=
 =?us-ascii?Q?O0Rzr4OWk45x7lIliC/ItbyrgE3mZtyToUUjnQIVT6FgYm9cXD3y67OYyaWu?=
 =?us-ascii?Q?bAa+SVrD8Dgk8/qZhxiTRrLdQUyo9eLFi00seUbL9OAiaIopvcV/FXpbe7bu?=
 =?us-ascii?Q?9rfHDAfL081lb8SwS4DUGCz3GJF2G/TLMJO6gYT6zIHmMzcJOeK4HYH8x/YK?=
 =?us-ascii?Q?8tiB4atNNSfLfuvOUor1UQE/Nu5e4bkHOWSSlHsVA/hw+0K+oly6DPcwPVpH?=
 =?us-ascii?Q?vzPCTQoLBgYDjq6VpI7IUhmtNQpy7S98RT2GtlOH2K+FTrwVxNnzm0e9OKSN?=
 =?us-ascii?Q?hKlj3m+IuuJxax8AHK5GVvtfQRCJjqZRMoBZD2Lcm3XVAAYqNQmvarsNwnrr?=
 =?us-ascii?Q?D8UUVk0dAAM3rLE6NSNQ4ooe3IimBuZOf8GUd3AsRaSdO4obTrOKyl5aTZ1Y?=
 =?us-ascii?Q?qn9d217sPr0e2rRITKqI1KTkMHTTL5/iyBoRH27ZvaAXuKEgvbCwhcK72Hjh?=
 =?us-ascii?Q?acR3Dhc7732I6lM/PSuGne7SrwkoT6XTZCADkBj0xxVMDZkCSOpNqg=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?7GlK7rMyVYlRzMn3i44MNg2jLh7b4M9+AvY2zlBaTg2I50bK1cqu4LZoY9Qn?=
 =?us-ascii?Q?mkNz0LGhrCl3RneeOqfOlIlas11gJjMDMHZc3NtOrKxGbvKMoscPDSWTcmER?=
 =?us-ascii?Q?nDTUNPZiXtvcl0IJ2C3YeOjAqopaIJBgKXqp+Am5+T2bZ9kuPsNaIbHHlO65?=
 =?us-ascii?Q?PwNb9+4IF4GflZppgVBRE2cBNtgGTeho/NDz5ojoMKLHWW7yMdCrtsapzCmJ?=
 =?us-ascii?Q?JzCxXTTAefHx97ZPY2oPPOQrbuw6Ka5nn+fje5OyVSUuUSGSJOjJovroBo/b?=
 =?us-ascii?Q?naM9VCqx9JIwN6aPNgzXQoDNRinnT5kkCExuBoRZbjucN80pmq4wBoe83hsC?=
 =?us-ascii?Q?Q4D/gX2+aYeXi8lphJwwYsFo2DyuvJAg6sgevy29AK83pYGQpJz9u0Wud3Es?=
 =?us-ascii?Q?9NDrIPlT/JafLrhDGiBW55e+r/oyvu5DVB3xSdFsl9y1Xl5OpyvOb6TSdmO6?=
 =?us-ascii?Q?nIB9K1LfY2idS+ELNHvcpL/wTRCS/Uaqhd7oeITYngwmf2FmEpexMWxHyOrM?=
 =?us-ascii?Q?z8yG4766YQclytZkOVnl+H8DGyTAIawsGBsGCkChUq2NAZibFwPauu88vLaw?=
 =?us-ascii?Q?pRUVfhjyPCXlW6+Df5j3W/0hx/AZBgmMCcuDJC2R5h40GGWn9g97ThrGvH8B?=
 =?us-ascii?Q?Cqh1w1IDBh6ySonjYSIqW/ZpkDHAMCCV8wW9pYPTY+IvKPjQzu3kr+7Ny/Zc?=
 =?us-ascii?Q?tBr1QbSQ+TzuscbepzC8U5nHZZBdcoQqWRif3xQHveMMMoQFRBqb5jXi5qGC?=
 =?us-ascii?Q?1e85OW7AO2BSOZPv6/mvBXtTNla0jDxjO9vyKUuAaj99OFMIwSxBKseSyMJu?=
 =?us-ascii?Q?L3Xy7z8rHLDOVHhR8gGPKs4KI0bZZ0jGgShtRmcfrXOcqbOmABNH3QCC0rUE?=
 =?us-ascii?Q?Ysabi7LuX+8L2LcPQsnRK7WgWnKeHfd7EcyCXj9bKtCKvdWiN6dXuTpfUfGQ?=
 =?us-ascii?Q?i3nbTGG9bMjlao/T65OrNGz8bZChYS1FswuEqCVPXiQTEgIfMNtXzkNNI6uR?=
 =?us-ascii?Q?BP5nlNZYntE2TjDFdz8BTgZv2ToYVEItVllyc1IXhAzbn5or+sT6vvz3f8wN?=
 =?us-ascii?Q?dyG7GleUqc5i4phNgWOsLoQE92WzKHnE7ZZ7o32JVzcWqRAgqM3L82FHfaoQ?=
 =?us-ascii?Q?M3g2he6v6j6B9KP8LdElJHlU+zh0//4GOU0NRAZwhgTyJSEaM/uCZjd+eAfg?=
 =?us-ascii?Q?GxbULhkjIlkapkeqAKpcS24rujxzF7tQfVV1waEZBeJipeWlLO5rUd1s9e6H?=
 =?us-ascii?Q?Jd04/2jCFoOWkwPBcOCgh0Dne5NrCsXl/1a7m/7RpTzJ+x+RKp49wgeTBcyu?=
 =?us-ascii?Q?1ZHus/kPOmUAxnLfqK8E6l/KKJ67pPvm1U/DQfksadunCZxMlZo9Pte75rZj?=
 =?us-ascii?Q?aZB8XZ24YEq1raQINU9CjvV4hEEdI57dpz5pDRU7sokiRDGjm5wnDd2S9PP4?=
 =?us-ascii?Q?6Iko0e5Oy8/YusIeacbD0r7jIHOB6DkFbnPuFA9oSHbvBRl1r9jwVwY2FX/g?=
 =?us-ascii?Q?5AQDxBZy0ADKOzmytYCmqltvr8bTaC+WvrJPprEPM2KRWJY21YIvebpFGpmb?=
 =?us-ascii?Q?QRPgXZ/CwyRtjr9tcmhvOjSjJCJ3fEEjahQHo9Bl?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4368e518-44cc-4221-4ce3-08dddbbfed37
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2025 05:52:32.1001
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yXwcrGjxODBus6vs1hdsJR8D/snpO2nG1npdql+zMUyJAcrHiDUQDuyesbDNAk6mVireDatICSp9IX5tWIsQQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR10MB7725
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Aug 2025 05:52:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118957

Both tag and SRVREV works with latest oe-core/poky master.
And is actually encouraged to be used so that hash is verified against the =
tag.

I wonder what could be wrong since this is a second patch for this recipe c=
omplaining about errors.

Peter

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-
> devel@lists.openembedded.org> On Behalf Of Lau, Karn Jye via
> lists.openembedded.org
> Sent: Friday, August 15, 2025 6:11
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-networking][scarthgap][PATCH] mbedtls: fix git fetche=
r conflict
> by using SRC_URI.
>=20
> From: kjlau0112 <karn.jye.lau@intel.com>
>=20
> if both SRC_URI & SRCREV specify particular source revision
> will lead to "Fix Fetcher failure: Conflicting revisions error"
>=20
> Fix by removing SRCREV and specify expected source revision in SRC_URI
> by adding revision parmater.
>=20
> Signed-off-by: kjlau0112 <karn.jye.lau@intel.com>
> ---
>  meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.b=
b b/meta-
> networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
> index 88b50a406..2591e2cde 100644
> --- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
> +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
> @@ -23,12 +23,10 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D379d5819937a6c2f1ef1630d341e026d"
>  SECTION =3D "libs"
>=20
>  S =3D "${WORKDIR}/git"
> -SRC_URI =3D "gitsm://github.com/Mbed-
> TLS/mbedtls.git;protocol=3Dhttps;branch=3Dmbedtls-3.6;tag=3Dv${PV} \
> +SRC_URI =3D "gitsm://github.com/Mbed-
> TLS/mbedtls.git;protocol=3Dhttps;branch=3Dmbedtls-
> 3.6;rev=3Dc765c831e5c2a0971410692f92f7a81d6ec65ec2\
>             file://run-ptest \
>             "
>=20
> -SRCREV =3D "c765c831e5c2a0971410692f92f7a81d6ec65ec2"
> -
>  UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
>=20
>  inherit cmake update-alternatives ptest
> --
> 2.34.1



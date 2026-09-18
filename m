Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D32D1C88E75
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 06:04:37 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.11])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5153.1789711468459445304
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Sep 2026 23:04:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=DbktYO+U;
 spf=pass (domain: siemens.com, ip: 52.101.66.11, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CuRuUit8c3yewfg629Wk1rQOhq4eRe+NIURx5veFumViIoNpEYuHBSByl1fJYkqE8VBqB/SowHLnuZyN1LlX7RttJFRhT7h7Mo/Ekyou8fREFgBZT0hoTZxfPAruUb2hLwXR6ni8FyJVYJAcoAdCZ5tBBvnp4/vesPvazvgudC+ny8ePcYaNj6exGNd3KhbIWft9Uei5oEFqvI4mrFInaYvRteicXYly0z03spy/34S9PXqGyPTY6v1EuWBQ+4vny28kCpXgcwXXy5cM2WATqWzy7AfhCOdFLnTctTrGb+MFaY1tjRjtgLouW0u+liDuvYICaYixhWALCriOfbIHXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G2znn5U4YyNPAUBU5bIuHP8ugXlgkPmU4s7nrz3IDkI=;
 b=bOvkf8pylB7dssfrLRVdKvSGe7nik1Bw4kLXsoMbtrHXiJmanxTqBshIt5+wy7sCqRYvjKhhXukFNm9oP43UIxtHd9KGEcaAChf/guigFI075VQgvBYPY0XtEIaywLoYBDLu5ml5NU1Qvte46GK7RsOZbqwWelcMtOicaI/ypTMp4jDEbpTwPoMpyh1HqZ479J5AQMHMLrD4FSuCGeOsnN6PQPppCtzavdA9R3dph22bh0DIhAn0c4froItqcnpgi2JMvuXvxW0ioJEC8l6zCrkWbnxdul0Hz7klfMiR7VUOyqg0faYENqP1aDnQsRehwH9qQhef1yBzVj/CT4USYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G2znn5U4YyNPAUBU5bIuHP8ugXlgkPmU4s7nrz3IDkI=;
 b=DbktYO+U3i/bROys7ovgaYbSHmKUNxRON89fo+FULwxAaPK/cpOBDz/K4/hvGUnyi39Yogr1XrZiIs/71Qr9xSwb3RyZD96uyFWXBtWBsrWVAWU6wVSlEcZXDaTbVZx1Re8kJ6FxeS5x5bAnxp6K0pIv7DKnok+pSOnGnANcbwr9LyOuXKYz5LCZBR2ILlFUsR/iS5zDIpFqDP4e6TWvC0u0pcCNGgozXW+lHjIqcs/fRP/GSExQjPUuOnl3/nWZtU39DHjFLAZvSQXIB4+gCqm3uas6QYWkWe+4YhTOaEQKMtuwNRJNxnahkWEzyySEPsUuUniSkJDvkAdTonLzYw==
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:420::16)
 by PA2PR10MB9135.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:422::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Fri, 18 Sep
 2026 06:04:22 +0000
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008]) by AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008%4]) with mapi id 15.21.0406.007; Fri, 18 Sep 2026
 06:04:21 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "Tillmann.Severin@bmw.de" <Tillmann.Severin@bmw.de>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: "ross.burton@arm.com" <ross.burton@arm.com>
Subject: RE: [oe] [meta-oe][PATCH v2] smolkit: Add low-footprint partial
 replacement for polkit
Thread-Topic: [oe] [meta-oe][PATCH v2] smolkit: Add low-footprint partial
 replacement for polkit
Thread-Index: AQHdRzHhjNIXAxK7lE22p1YpGTrMj7bT1tZA
Date: Fri, 18 Sep 2026 06:04:21 +0000
Message-ID: 
 <AS8PR10MB507311D2ABDAF561DD50CED2FD872@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
References: <20260918055108.3637556-1-tillmann.severin@bmw.de>
In-Reply-To: <20260918055108.3637556-1-tillmann.severin@bmw.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=1fd4b5cd-9ae3-40bf-a8e3-0fd0805dff99;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-09-18T05:57:40Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB5073:EE_|PA2PR10MB9135:EE_
x-ms-office365-filtering-correlation-id: 7b511644-8ddd-4108-f4cb-08df154aaf15
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|38070700021|5023799004|11063799006|10067099003|56012099006|55112099003|22082099003|18002099003|6133799003|3023799007;
x-microsoft-antispam-message-info: 
 /gQMUbKqbqFKRElWOP7IxZpLJEvdNsRSuuyA7E3BFzvuQNqrNNYKEoCFQGSTR2xTlFFZopWsk4m36DE2VTFl1bK5sZP5O2JEOrwtfUZEYOX0PJ1VoBUDRH28X9Xm6usoMKIkGY2GXS74nexZiTCBuoy5tkd2V74YvLKg3A88NA4Qv7HofXfoGWO+QeLeU6990Nk/7oGJIZKEeAAg+oDx24DLKaT4C6KeVB4hS3A9jqhTT9UZBa9MnfFQqJXQGFnlE0g8oNGZHw10/rHZTf4+JY9GCz3pabltIoTqGAuHn/5FH7lMYiubXQEkWDfqpFDJoiCcu4R0MIEEUOzHw8x8kzXObfSToVlaxpdj2HTGWYVYwwGPr9hVEIGJ9CxR9MuX8tpO0oSiLms22whwXjpCgiSTw70FlUrILGrtTV9UU6Gmo+63is208DPvmHUgSrHcqAnADi2EB4aqS26VJWyetCOlwDo9Z+KleOjiaLDCWxECEAG+/NPUWi/rGPIAYLJ/aUMJa/nfG1qpbDgw22IZDYHh9/uTJLgWYm39AwwYMt56u6SPjM6OAXXIdYsFM6xup254CpjyhNQwp88KbaLE/+8ArwOvqXS55jlw0hd9QihsQ6ha+lDVMuhXCGNH645V3t4Q5p7V23QpjNjpdDnYiPS00sN6fjumm/4wqzCcq6RzUsg/Lp7l0J82iWNZozBW4fIfyZ+wfv+IoZ5an5y7a+7RuUjQCmFf2L2UpYDGagQ=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(38070700021)(5023799004)(11063799006)(10067099003)(56012099006)(55112099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?0NsPTNwHnX06R+yyCBILh+nWcP7x33cSO6z/aUuCOayib0tZlVJLombxgCTD?=
 =?us-ascii?Q?K5rq2EOwvqJBnRmCmelLL6vf3xSSaMFj28RlbdtSczRDfOPuYBenqHUl3tDh?=
 =?us-ascii?Q?f5LmBXQAWbzJZbUxa3z/+nekooueQZlnJCPrPVNrq/1QVxhql9Ahc6LHlNgy?=
 =?us-ascii?Q?2UXEWcNVmc0eJKT3UCfkdgriqBbBYkTEZb757S8h/Ahepjl+D2YFmgTiF+aw?=
 =?us-ascii?Q?DM8fchNh7WXmA3/LbwGdynF8ClanXZWYVLXlTcuMw/nFoNL9OErh8lS0IBtF?=
 =?us-ascii?Q?fvRcNPw/mWnsW3ZjR9Y1JhXx93N+iUxbmZVqhKzPBNRr393I2zxY03qL5eAq?=
 =?us-ascii?Q?j9QxnZrGbFHbkaosf9BBNBYuVAkPlUndSmvYd07fEZlxIct6JeeEwHBpyraj?=
 =?us-ascii?Q?aZixecj7/YzzafpuoW1JNJtcDA9PrNZGUKTHNCXNL5n00qCteOczqvRaj74c?=
 =?us-ascii?Q?h9wGffhv0mDFWorVQqt8oUyvlM7rwqtfqpDB50W5GC3Qvs7/YQxEMNzkvFNz?=
 =?us-ascii?Q?kXRo87ukeRDZmUoxf6qlkeeuEZ4TMjReXBHa/3fSaXWw4pbrI+QbJb8NVPqL?=
 =?us-ascii?Q?D0VycyCfAoec5lDS/l27WXeBlCq+BwytXeOjVs9NFbsot3O7vzwDpgPhfGau?=
 =?us-ascii?Q?JalGZhL3P+YFkMCmjh0iL5MRo1dhqcIzUDmsIxaq6ESadyi6X1rB7YfB7FwZ?=
 =?us-ascii?Q?lLYZvnxfz+8icFkwqpW+/XWTSzrEXUshAJmRysBBOmZMtTpV/1WcL5kAhI6D?=
 =?us-ascii?Q?aofoxQO2PPBciNTTp+eUkQ03HFgU+X2qVgkBQemJTLqDq96X0KVKV9nZ6ODz?=
 =?us-ascii?Q?EJxjDHvRS15PjBFYf/ZF7btNQutlIBoRjxb5GbYiLCTPgcCEimV3Rw7iNo/L?=
 =?us-ascii?Q?K4T8R4Farg6qRQzHy6HaNAcFqt+V6PuvzgS9t/yx2doclL3iKmTo3gyCeWyq?=
 =?us-ascii?Q?aCVDcb7MjYBpXu0KqJIup2rRB+kKlmAfRrP46vUtQW4ioNSmZqAcCesyj4RR?=
 =?us-ascii?Q?H5iF5h8S1NWCeZf+S0ZNginruVLtxdsPh7bf8lfuSX4mWUSdhYTthi0i2Txv?=
 =?us-ascii?Q?FGgqrtxwAay7Epy7JhF8YfOUiaYJLlveMZ4PK2tvzY0po2/RCdB35biLQ3gx?=
 =?us-ascii?Q?wCDgfgf+Mf2jIlCXHINb/CrndQtTPFoX2jAUvVgNRjeJ/6FDirEd+iU/zuiV?=
 =?us-ascii?Q?q3Ib6vEk2nMQS58f+cYwCu5KhCty+6fwPc1xwIjqLeG2ghfh6FiLoPlFJjQK?=
 =?us-ascii?Q?Bx0IgfUnW0JZwa2m5KGiQqr6IZ9/JGRzIQVnDC76vqy+szbtrG529ksMfeSm?=
 =?us-ascii?Q?3fjsQ5uDrciDSD+ly9VLszpfBU9gJZkrS2udKDypOnryX2Z2t8uwq8jIlgdm?=
 =?us-ascii?Q?ft6/+QWLv1eNNA7YSq1yhbXX3aTPFBXQ76eQTkToGAzefz8dHv3pzHIDG5BX?=
 =?us-ascii?Q?P8QHxk0wIeO4jmTBFUo7gxlpCB7SeEbPrcN5FOxlLgWItMymmcVQAwSBfF3b?=
 =?us-ascii?Q?6Mjy+WWjHD3SMGk9V93jiKpxFxRVfqztkeZAc/Pp4JQux+Iyf+6kldU/hPAg?=
 =?us-ascii?Q?WRHDeIcn5vARcvacZA3uAP8+/e6hBfW8c5Qjw0C4yvcFUGnzjOSpon9AKh09?=
 =?us-ascii?Q?oZB1nFnRUfsDPq57FXnT5JKjz8oTVDMmwFKcnOvWBAb7Et8TXNNvgvT/rz+K?=
 =?us-ascii?Q?Uly79JZdABp/LG6EduxGgdbxvTXf1EXQpnzQU5GS1oGZ0fJXgxXbaTrZ3IhC?=
 =?us-ascii?Q?yOpMCUAI4Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b511644-8ddd-4108-f4cb-08df154aaf15
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2026 06:04:21.8946
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aYUqF0xbdLBqpr7VmEGqBroaCh5f1k22ZUWPi/0EZ8Xdl7bCD+uy3VSAHIJa83RDYLV1/n+BXMMmE/OqTFaEdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR10MB9135
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Sep 2026 06:04:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130111



> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-
> devel@lists.openembedded.org> On Behalf Of Severin Tillmann, DE-862 via
> lists.openembedded.org
> Sent: Friday, September 18, 2026 7:51 AM
> To: openembedded-devel@lists.openembedded.org
> Cc: ross.burton@arm.com; Tillmann Severin <tillmann.severin@bmw.de>
> Subject: [oe] [meta-oe][PATCH v2] smolkit: Add low-footprint partial repl=
acement
> for polkit
>=20
> smolkit is a replacement for a subset of
> polkit's interface, which is low-footprint in the
> sense of not needing to have a javascript engine
> available to do its job. polkit has this disadvantage
> and even with a small javascript engine like duktape,
> it is not worth to have turing-complete configuration
> where you could also use static JSON on some embedded
> devices.
>=20
> Signed-off-by: Tillmann Severin <tillmann.severin@bmw.de>
> ---
> changes in v2:
> - smolkit PROVIDES polkit instead of conflicting a distro feature
> - Drop line setting `S`
> - Tags are now available upstream
> ---
> ---
>  meta-oe/recipes-extended/smolkit/smolkit.bb | 24 +++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/smolkit/smolkit.bb
>=20
> diff --git a/meta-oe/recipes-extended/smolkit/smolkit.bb b/meta-oe/recipe=
s-
> extended/smolkit/smolkit.bb
> new file mode 100644
> index 0000000000..47ca0c3740
> --- /dev/null
> +++ b/meta-oe/recipes-extended/smolkit/smolkit.bb
> @@ -0,0 +1,24 @@
> +SUMMARY =3D "low-footprint polkit replacement"
> +HOMEPAGE =3D "https://github.com/bmwcarit/smolkit"
> +DESCRIPTION =3D "\
> +  Service that implements a subset of polkit's D-Bus interface with a st=
atic
> configuration language. \
> +"
> +
> +LICENSE =3D "Apache-2.0"
> +LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57"
> +
> +inherit cmake features_check pkgconfig
> +
> +DEPENDS =3D "\
> +  rapidjson \
> +  sdbus-c++ \
> +"
> +
> +PROVIDES =3D "polkit"

Doesn't this cause warnings when something in the build depends on polkit?
I think there is a need for defining PREFERRED_PROVIDER definitions in laye=
r.conf

And you maybe also need to add RPROVIDES:${PN} for cases when something RDE=
PENDS on polkit.

> +
> +PV =3D "0.2.0+git"
> +
> +SRC_URI =3D "\
> +    git://github.com/bmwcarit/${BPN}.git;protocol=3Dhttps;branch=3Dmain =
\

Please add ;tag=3Dv${PV} to SRC_URI

> +"
> +SRCREV =3D "46bbfd5c922a8d03a534398ee129ded822dfcafe"
> --
> 2.43.0



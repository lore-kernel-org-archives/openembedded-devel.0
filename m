Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.57])
 by mx.groups.io with SMTP id smtpd.web11.5263.1620277876758746425
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 May 2021 22:11:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=LBrKsBwY;
 spf=pass (domain: siemens.com, ip: 40.107.14.57, mailfrom: andrej.kozemcak@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z1+/cJovObIuPCvjGWy6VAhGbo37LXCio1FaYGCtUtUHa0nnmiptcZ58mkcRDgpSxF2NZ5Tz3HtKNNoxr8kcThptfsC29ZETyQHncy+clMzoEr1O2wCSWCEKdot9hhLIypGGK+L26gq6Qi5JHD3nPc19x65AY7K+w6D+UrW4h8qg2B1T6qCqg9MIMHKAG/zPCsrXCA4PdTkQKqFS+4xiqHJX7kU2TXQIe3DQKYnUGDVpxfXN9qUQpgmAnG25poY8oRBdMU/a2+YDcg9mAf1/rHxAeJgqo4Hh7cfUrBHZWzirf8qV7azAkYLDJSAtyIkPu9md543i/EaNSXbdoIMkGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5MJQI6AyLnJlTRVOVFgMDmhlQOp9GmE2goI6z7jzRM0=;
 b=gZxcvvWLrgOQBawx6YZfC9DYdHdSKgutumy+QlEC1nN0UYqYwxwyiGmAV3edz7D9khSEXF3eAtlvBuhXyUJZDdXyOAhLThK/SZ3DfPVZdizK5yIy6X5h7fda0CIjpEb3yFPuaf1GBJ1uufvwGvnSfbgUuQMUE8sqVxbV2dFCDcGziFhorTMCxCcJqwuQFSDdUz8fBXdZX//wTKZ4mzbl7hkLsqk5TAKep9/1p2ACQ9XYm5ow2TvV17T2WdjEQgZRlPO3rRuxMThCJOvLwYxCaRmFilcxjoxvB9jvCmYRPAzMBcUaFMxZvRNglJw2RftjGHeBoA2fpbvq08cb0Zafug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=siemens.onmicrosoft.com; s=selector1-siemens-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5MJQI6AyLnJlTRVOVFgMDmhlQOp9GmE2goI6z7jzRM0=;
 b=LBrKsBwYfgARGl0MBHiGkjGszwxm0DbVR1ygNeDb3LeG7zBXzxUyq8mP9fBsWAgIR9a5m16b+oIvMO4f3HY4Vf6+Y9M0RI8oYlkEMEkP0N/DIrMXT+VKAlWejYFSp4VnsQWsrfedbmP4oqu5yaxlEOSB46keFSp05WHnHaYH100=
Received: from DB8PR10MB2649.EURPRD10.PROD.OUTLOOK.COM (20.179.9.150) by
 DB6PR10MB1848.EURPRD10.PROD.OUTLOOK.COM (10.165.184.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.44; Thu, 6 May 2021 05:11:13 +0000
Received: from DB8PR10MB2649.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ddb3:46bc:d8fd:e199]) by DB8PR10MB2649.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ddb3:46bc:d8fd:e199%5]) with mapi id 15.20.4087.044; Thu, 6 May 2021
 05:11:13 +0000
From: "Andrej Kozemcak" <andrej.kozemcak@siemens.com>
To: Khem Raj <raj.khem@gmail.com>, Armin Kuster <akuster808@gmail.comt>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH 0/1] proftpd update
Thread-Topic: [oe] [meta-oe][PATCH 0/1] proftpd update
Thread-Index: AQHXNPE6Fw0WaK9Km0ONXCmjY/eIhKq8WPeAgBmmqEA=
Date: Thu, 6 May 2021 05:11:13 +0000
Message-ID: 
 <DB8PR10MB264973D7D0F02EA88705E364F8589@DB8PR10MB2649.EURPRD10.PROD.OUTLOOK.COM>
References: <20210419075251.21268-1-andrej.kozemcak@siemens.com>
 <a06c5c87-e9c7-9014-a06c-ae6800f0fe85@gmail.com>
In-Reply-To: <a06c5c87-e9c7-9014-a06c-ae6800f0fe85@gmail.com>
Accept-Language: sk-SK, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Enabled=true;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SetDate=2021-05-06T05:11:11Z;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Method=Standard;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Name=restricted-default;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ActionId=e0c7346e-06cc-4dfc-869f-b26e18ea06e3;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ContentBits=0
document_confidentiality: Restricted
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=siemens.com;
x-originating-ip: [188.167.61.188]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0e2b921a-7493-4f63-2cf8-08d9104d5ecc
x-ms-traffictypediagnostic: DB6PR10MB1848:
x-microsoft-antispam-prvs: 
 <DB6PR10MB1848B8522861E4E44886748CF8589@DB6PR10MB1848.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:1751;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ozlgKTuqZQLpP27WVg8AK/aQNocZ7SNwZqoaAUqfv4UrcnCtkLwHcNlo5A+hFG21HZd2x+5Qt2VLgAmYG3jBzSyQgjsecZxR/p0hbTWIHF1/VnzqKX5aCwgkep0O4z3D27jGdygXtjX7RuemVVWYrzlrYhilGLOnBUpEAJBomSLzJShU8AJEGgegqOHCJiy1xo2IP4//xKE3UUbCPLlwZAchgNn1oSHWD9zDA17Xpf8njCRLpPEhIMU4sU8V0rU+IO779o+wM+OEXPhvad3cNlg1WbOAkCZulT7nz/6asFQgSBh6oO3D4HYlK65nEID94MewOwSG8BuknsTlCAjBVlmTIwwkBWlOANEVN7QYF9LuAyFGmZltmBSgOGSPSvqBNvr4kEIYY7hd2Aj2dx7xC84Tl2WmG5Vs0a6DKude/XrjXmQ7vQFN/AVyrWjMg/f0hLuCiPzo+197hGWmxS71tVk7qqOtseYbMeIiN5ypW3zDjI23JiCyIibdaTLxPbrcKA5gDvjGP1h5eyrOHfD1VIXOJvepMbWyq93B+5kudt2Gqti80wYuMA5/iqg1T5bRr9r+C9Hh4sYd7yKpkoY6FriV2+z5hOVtvertHZQc1Ouw5deySyyqoWobASucB+q4sPviI548rpXz9moPJB0dSGyrnzt/wlqKXJiZooRvIDQ=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB2649.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(396003)(39860400002)(366004)(7696005)(6506007)(2906002)(4326008)(76116006)(83380400001)(66476007)(9686003)(5660300002)(26005)(45080400002)(53546011)(33656002)(8676002)(122000001)(316002)(478600001)(186003)(86362001)(71200400001)(66556008)(64756008)(8936002)(66446008)(15650500001)(110136005)(966005)(66946007)(55016002)(52536014)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?47z0oO/gj9WsGllIF658N4pCvcW1PjVzrMj2fW3yJEXxxbtrQdmTwoirZHk1?=
 =?us-ascii?Q?2eHYbLLh9O/zK77RyMN673Ef0LqCbJzUW5j33nTbHjRXUfTpUxLtOL6lYCUR?=
 =?us-ascii?Q?SVDfl/7/yhD+WPLyX3oCAZpUlVWA9EPY6O5JbI0Voe80deRRaqkJrsFUNe8/?=
 =?us-ascii?Q?f5EbAIQzpcvTcqFUAzP8ruJJ+h1SoDKG9lCvSX+CLy28BBlOxKNy86UXv5CY?=
 =?us-ascii?Q?9imdiLP6KcvOtZQp1Veq4pIdQgaw1kUPIdgRlDFpk53HijtZO3nihtG0Y+TB?=
 =?us-ascii?Q?oXHmR8+vSU/rntlmb3rFIy+IRylNnEYa7Hfkinrp5ovrtiuwfPvvILCcIZwG?=
 =?us-ascii?Q?wZyxQWKzaFp+oT1sG+AQj8qmc8vw12+EFvxfDqEI9bwT/Bq0PovI8Lp6/6H3?=
 =?us-ascii?Q?FKs3EfnSBLED3F+mI0CUPqugdCoglfnI4mkZWMGkjyHnpCiLrBMpOY4RfuB9?=
 =?us-ascii?Q?V8v7toH49a+/reizPoI4tdgTE91Qf4c1T4zWUbfVK/rbAgoYgVEBEZRwUDks?=
 =?us-ascii?Q?xKQZg1dWt0t/EpQryddk5Qu1VTj5pt2+Q3Ix3C6Ka9tJyaAVch4HAf0YpJjh?=
 =?us-ascii?Q?FjmyMSkDO2A8NDbqCIvrbHAFZXwR/fmXYHJaCjo1WZuWcRDbGbWio0SrC1B6?=
 =?us-ascii?Q?kSnLg94NLJ0xlMKZQxL8SDkclb+4x1jqnjU9PQKY4Ua3vLDZ0B8GU22uB3W6?=
 =?us-ascii?Q?vDkNVV8xofGpIdwM8UR9TKcKyoyu79PjlUiF9vV/Ods+1bZS3MYvHisd9sg0?=
 =?us-ascii?Q?MmibUeV+xsyBFaQwe8w9U8x5HGna8F2JQFLFkwPpEoTkskOjTuOgMsGN3iur?=
 =?us-ascii?Q?MiBxg+yyhZJwPOjvdCKH3TqvcR6ccPBPkRDfsDAnv8CYvY0iKOmhGdiz77RW?=
 =?us-ascii?Q?LqrEIaEFc9Ylb6M2FZGiM/xxmXFKqfQZKE1wu6boULPeejto2ynLRSWXvq3R?=
 =?us-ascii?Q?IbQlpcLn226AmpLQmLJucWjkIuhVnsLnpwzppYyVpQUwt6EKVy6Y1IQ1u1V1?=
 =?us-ascii?Q?AONnbJkpxe0lSqXIRyKOhuu5in73ZtnPIc/B5eQkP3Dj/YJUvTDH0JtDZh30?=
 =?us-ascii?Q?fjqYWSpDUJyGpHQQ0XyMG/B+abaMZQmxSgaetwGdaj93zvM/MVZ2fHyxbmWS?=
 =?us-ascii?Q?1HD/KPf66zuAYUil66C+y/bGXu6R4Nu5mSW4Cgq1GoQivIfC8t+toqmUfnDP?=
 =?us-ascii?Q?Dc/YM90jCVXe8kfJUmme9SgZNi/Xn/uJMAPulScVQtxEp661sTVggDowSCNe?=
 =?us-ascii?Q?fZHMg0xGIOoMuoflQbChS6+Jxr5uwaiYYX3OxzwoccRhrgr0fFNirAmxB8D8?=
 =?us-ascii?Q?s+U=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB2649.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e2b921a-7493-4f63-2cf8-08d9104d5ecc
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2021 05:11:13.7871
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GmukFqzN37edCS5guQjoJBU5p8kSuZ1sBwdl485DXftu5E7JhTjcwM6IDMTFyY3jg6CWktIRpQ1ZQoCKzL6GxMklLfT5ov5kTYomQRK4pDQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR10MB1848
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Khem, Armin,

Is want only inform, is there any new information about apply this patch a=
lso to dunfell branch?

Thank you for the information,
Best Regards,
Andrej K.

-----Original Message-----
From: Khem Raj <raj.khem@gmail.com>=20
Sent: Monday, April 19, 2021 11:18 PM
To: Kozemcak, Andrej (ADV D EU SK SI-BP1) <andrej.kozemcak@siemens.com>; o=
penembedded-devel@lists.openembedded.org; Armin Kuster <akuster808@gmail.co=
mt>
Subject: Re: [oe] [meta-oe][PATCH 0/1] proftpd update



On 4/19/21 12:52 AM, Andrej Kozemcak wrote:
> I would like to apply this update also to dunfell branch, if posible.
> Because there is lot of bugs which is not a posible fix with the easy=20
> way.

This is a leaf package so I think it might be ok from dependency point of =
view, I would leave this to Armin and other interested community members to=
 weigh in for dunfell backport.

>=20
> Andrej Kozemcak (1):
>    proftpd: Update to 1.3.7a release
>=20
>   .../proftpd/files/build_fixup.patch           | 69 ++++++++-----------
>   .../proftpd/files/contrib.patch               | 29 ++++----
>   .../{proftpd_1.3.6.bb =3D> proftpd_1.3.7a.bb}   | 12 ++--
>   3 files changed, 47 insertions(+), 63 deletions(-)
>   rename meta-networking/recipes-daemons/proftpd/{proftpd_1.3.6.bb =3D>=
=20
> proftpd_1.3.7a.bb} (93%)
>=20
>=20
>=20
>=20
>=20

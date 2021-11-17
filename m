Return-Path: <richard.leitner@skidata.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E9D3C433EF
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 16:38:56 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.109])
 by mx.groups.io with SMTP id smtpd.web12.9562.1637167134777647004
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Nov 2021 08:38:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skidata.com header.s=selector1 header.b=vYfVlHUW;
 spf=pass (domain: skidata.com, ip: 40.107.5.109,
 mailfrom: richard.leitner@skidata.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oI4I21ozTtZzfCThLBIL93E7mnLZGGv83TrqQt6rstXNTMRO+OGppK/uc+jPwakqCo9zvP0r5jaRT7WKfhCbaHI7pQPhixGidy7dHNciKQbpSADPOcjBfAD/v6zuKzLaeBQIWPyC0wk2SYBPX5m0iaWMK2wqcgpmEdfM7f4yfMfgfLv1i/2usjQIAPzgBh8gXQUJQxFGMbCp/GN+LxOojuaKKB1RhqtDYG/ck7+DyPw96VBFq9D1i5nNqym5BN7+Y4AaUQbwSJZtYHRy+RpKo/C7W9zkrQr8fm3Ri0svaKtrboLWBvAFOFF9Slad4lb8L90juqIxE4AMy+DVR8CZxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rTnmhaWgQPqi40SttxRv8dMIOjXcvrDaYNRTKe4oOCQ=;
 b=m+3XGmCng/ck+BSbTnX9+y4fN12AjVObNrMtGCxWLvoYPyKte7IVkuKpARNTbNjEp9Kb1sql/zJ+GUKlF8lSXmq55DUQ7zLPakq+re/3le8rBxsghhMmBXjSShpgOpT49rZEDtkNZKDSEe6gJ5Ev4Ff9CCX3bkQgR9I+VLBbvBsJYtqUTUnt0RewkBOFgZRZcWvlfe8HOpKjwOFHygNqUjB0KBJvkfOn973+etTwLXSMn+ctqeMszc+aSrJDOLE+jzp8Xalx9F+V/gMaRTU9boIEs7WQbfaJSAudw+M4i5q8OeuMWCIeNxo/tv6isiNZ3nuBIdfeHNMKm+O/0KVYGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=skidata.com; dmarc=pass action=none header.from=skidata.com;
 dkim=pass header.d=skidata.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skidata.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rTnmhaWgQPqi40SttxRv8dMIOjXcvrDaYNRTKe4oOCQ=;
 b=vYfVlHUW+lLz4JBD3kUo2ajp+eaKXNN/2i42xph6xjPHWzRluo7POKHYWdQAvjS50ToQBOUMtkgr1aaak5S4K5h62ejqTc2sFnRlrkBjz7rEB0R/quqLWhVMYJOmFIwjO50qvxurYa5O+cXqW7IOPSaJRlgyCoFhoAa0XOoO+lZd012ykkQyyOEog/dvetgSOhu/NivhwMxXg/O4QX4NYL0g0tdvshOJScM0sGgivXq1nk9R7V4ZecGu1wR5PqoZeGl7zTkzOtG1Ul+WzP7kuHql8tME52zWtkKcrPQKClStudNE+6BpulC+UsFwKt8rju7ZbRBv+JutX6m749u6kA==
Received: from VE1PR05MB7376.eurprd05.prod.outlook.com (2603:10a6:800:1b3::19)
 by VE1PR05MB7566.eurprd05.prod.outlook.com (2603:10a6:800:1ad::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Wed, 17 Nov
 2021 16:38:51 +0000
Received: from VE1PR05MB7376.eurprd05.prod.outlook.com
 ([fe80::21d9:e4fb:d0ff:8596]) by VE1PR05MB7376.eurprd05.prod.outlook.com
 ([fe80::21d9:e4fb:d0ff:8596%4]) with mapi id 15.20.4690.027; Wed, 17 Nov 2021
 16:38:51 +0000
From: Richard Leitner - SKIDATA <Richard.Leitner@skidata.com>
To: "esben@geanix.com" <esben@geanix.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, Esben Haabendal
	<esben.haabendal@huawei.com>
Subject: Re: [oe] [meta-java] [PATCH v2] openjdk-7: fix recipe parsing for
 "other" architectures
Thread-Topic: [oe] [meta-java] [PATCH v2] openjdk-7: fix recipe parsing for
 "other" architectures
Thread-Index: AQHXxaTDfalu0/B1Rkiu5UR+zCXWqqwIF+kA
Date: Wed, 17 Nov 2021 16:38:51 +0000
Message-ID: <YZUwGoyNnBVywaEL@ltleri2>
References: 
 <b099be176884f080fa998fabdc7114f2bba9cc5d.1634728692.git.esben.haabendal@huawei.com>
In-Reply-To: 
 <b099be176884f080fa998fabdc7114f2bba9cc5d.1634728692.git.esben.haabendal@huawei.com>
Accept-Language: en-AT, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=skidata.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 83db46ac-dfb5-46af-344d-08d9a9e8bcc5
x-ms-traffictypediagnostic: VE1PR05MB7566:
x-microsoft-antispam-prvs: 
 <VE1PR05MB756648B3856B46D00F4F6EEBF09A9@VE1PR05MB7566.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2201;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 6yvWhoMnhOztuUDUMCVqdPqHQRofC74HWm9/Hsec0hpmq5lP2NpbIL2OtmyNRmVMWSSwYdGYQBfrV7yOHb3ClzHDq5nUL1Gtbyjgxlx3ZJEnKRDwIX7Q9tCvswPx+hT7W9eGdXi9o3twtp01CxJDOCS6SkgC04niQ2lizJ4w+cuMY9C1swqidzxYkBvsT9mz6zV+qvTFautrWsX2vUnIgjCJ6TOq5DVUfKXEF0uTLf7PFIGBNsWjDyKxD3sr2T9zKet9V7TP2yrD5idNyzBewPQJd/0Mnq0UDhoBLEmukmJJmS+y9kNpchWP5BdR5rEZ0kAtTBAQFUy+kPksIpUMwaQB6iawFr9c+b1VNsHtuCHroxEQH4rufc9h070BO34Et7HYSYkCjcRJkdY0z8Hm2e9ADdGkLOpXlMVcfw0wFTTTn4bqYzbAGcxycF0ir0MH2gC1hGB/JC/5cJ77KBazZzWz8WM4Yc4q28B9jLu1xZhuyrKWzXiIJZzjn2sFaUHk6135u3HysVBXi7fD9xTebOqOvXUdI/XeFPqlLrrTQiEHhR9tXjsm0ULDgJNR2jpmrNWXaxUF+ULvOy9cS53wyNLYtk7xn0oyUFZH8bi97IjAinZsUXQif2xTpOZ1m/Mo2W+SrnKfKY4gq4LAIxEF4PKogz1MwzYIP/rkZG/JqlF7V0s7ZgBqeocWHB6ghQH8S193/J+DQXaSBi4fgZVaKBJ8aPQQdvxHtdQLBrNDzs2JuBdKypt8c1QVkIJXb4F1zmmF7gYG146Hvi9QeqESP5Qo/kgQHCW4G6DX5+LpLec=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR05MB7376.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(76116006)(122000001)(38100700002)(33716001)(8936002)(91956017)(186003)(26005)(66946007)(66476007)(6506007)(83380400001)(71200400001)(64756008)(4001150100001)(66446008)(66556008)(9686003)(508600001)(5660300002)(54906003)(966005)(86362001)(6486002)(2906002)(4326008)(316002)(8676002)(6512007)(38070700005)(6916009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?CkYhERxWLthSdfNSDh8PgKyLqJhUyfBpUi9Ed+UEXjQHChtOMRZLk0mbm0x7?=
 =?us-ascii?Q?6/WQUYnjmTY5cKfj8svaXP9zPLxhvjV44DMcfnUheqDGEYWSCRHUpObTo/VF?=
 =?us-ascii?Q?p7aVU6XfaYGAiKRN2UErpI9U4ygnkBupiJHXpWN0eW4vAO5In/2dI5DlFqFr?=
 =?us-ascii?Q?f8Bq51lNxWBeMNa/R1nsge/1dRkY8igf+fhPQq7b/If9PnETW/85ZCwlW0YO?=
 =?us-ascii?Q?uuGvyENk5GvomuCvVY5mMQh+fKWvlpOPvJ39hpfst3Hc+Jl5uLd5e5oBC2AN?=
 =?us-ascii?Q?7TfRfCC520Yqxxi42KN50XgFPSaaKInfNxCNTSajLiOEGbxxZYalh8G9Aqud?=
 =?us-ascii?Q?uM0HwA0YBxf8RUA5yetT7y6C6pVqfuXPIv1oCuv56l3p52xcLfETQmTbtyUa?=
 =?us-ascii?Q?x7B0q70BAVRs6sxuzgs+s1+BX/FeOHqphIS8NJklm9NO9CWhJ+iwSdUQBGzK?=
 =?us-ascii?Q?eudjJQcvdofv7qIK/8dVdRnYFk8kyl8NmjqNfhZjR8TcKBMgYulk2Lakr4Pf?=
 =?us-ascii?Q?vxG7Lg1zZYxXjLtk52wiiCyTKsEGn4BgDph8BVPXLGIIwwzuzoerqqtePTwg?=
 =?us-ascii?Q?5we6HfIXke90ZrQwyKmPzTZdAOtrwz6/ra6ogOz1WR8ebGlui3goy0EpP0r2?=
 =?us-ascii?Q?5Aisi5ROe8qZcDDILQBoYmXp9DLtF6Zqti2eqLlFE9wW4g3gpzVWCuI0ehZB?=
 =?us-ascii?Q?Uf2cENzXsTFv/5SmaEs/fKhmnN9bCuqH5MggtrPXL8a4jcQQnsblS5FCg0uG?=
 =?us-ascii?Q?rv8p3QJz0KfasS9PcFlxDUcOHNyOBg+f+RSnsrUa0iwaJVaKR8c+C2oDuQ+S?=
 =?us-ascii?Q?YodA71406gtQZrulUXmfIP4UXXzHitoIeGciqqwFbgD/XQvGxdb0a3N38292?=
 =?us-ascii?Q?cVE1RwoK5I1pKq19XFBcCcp/PZViFy+8wpD8YrIy4Etp5WUZs0paoynSPyQY?=
 =?us-ascii?Q?P7qEQOmeN1y25b+331QBF++6QMKaEs44n0qHyCnUzPnS8ACxFxAuVCeOEKtb?=
 =?us-ascii?Q?yAUF+dIeTlzHd4SzkgdtpNuWkE4AytoQgt1d3MfF9InGXITqofh3zcLtX7bf?=
 =?us-ascii?Q?wORhNXKmrhq5XIRe+lelX93Q128JiFDmXAdViu8dulsu0j5dzHKO6WzcmVj4?=
 =?us-ascii?Q?8Z/z1y1jjU90APx8t6+F2ocBemOj/HEmS0FF4ZDOMFXwt2NJz5pLqfZ4zIOH?=
 =?us-ascii?Q?liwhG6H1zqnbtclIqyFfekZqeoXvAveL6T+mJRrhUZNjohTDa9Z9HhhXLx+m?=
 =?us-ascii?Q?FM5dJ+8emNpWnZh+gVxrvDjP/OKfOWxdFZKHMeIBcLouo4YkUfozBuq9GVYQ?=
 =?us-ascii?Q?VmghrdTNwEQC4BpiEQ0wVX+y25GNEX8Wf/YRINhqlX8l2hEDoR037Xf7yfIq?=
 =?us-ascii?Q?oMXZKygxcJJC6Fr1DdfWZ1vKN06CPayR4xDl1I2TaP5/wkt31TGMCDvADqch?=
 =?us-ascii?Q?x6gIvkUXZrQq1plGjBJdt4tWX0Y2whxrbRw19cgm/oPI7hocnMXaUxLxcJiu?=
 =?us-ascii?Q?gP2H0MQ4VaZUfP3nGwfIxOcmnxXv4V9KLqsiBSsYUPykrXGZ20ZbVicxBLN1?=
 =?us-ascii?Q?RfXYN1B4WCiQk/+XWztibZPmbviK5ryfB+VZwXuxpxY0Tom8RLzNaILtaTGu?=
 =?us-ascii?Q?RDArKHIvoDIwyGMjo880RXCF2l4TOilmcH8Uy2P9YZehnv1wtVCfgAGsQElF?=
 =?us-ascii?Q?wtbLOIO+qJ1C5i3mdHR5gR6qPJU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BB9B378400F43D4AAF01705C90EA48E5@eurprd05.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: skidata.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR05MB7376.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 83db46ac-dfb5-46af-344d-08d9a9e8bcc5
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2021 16:38:51.3068
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e5733095-4425-4f08-b6ba-487b9a46a425
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 TiJxXwvFBCnWZ6RafOJSaW1yOdrnrj2YI3lVKwkknnMgnj5vXOAoMSQS7C3N/Ip4sQWj8ynwUbnJllbJqgrbvEiPJ+Qh4PajRVHuW2dWliw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR05MB7566
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Nov 2021 16:38:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94003

Hi Esben,

On Wed, Oct 20, 2021 at 01:20:55PM +0200, Esben Haabendal via lists.openemb=
edded.org wrote:
> From: Esben Haabendal <esben.haabendal@huawei.com>
>=20
> Using meta-java in configurations where TARGET architecture is something
> different than the most mainstream archictures (intel, arm, powerpc, mips=
),
> bitbake errors out with something like the following:
>=20
>     ERROR: ExpansionError during parsing /home/user/poky/meta-java/recipe=
s-core/openjdk/openjdk-7_99b00-2.6.5.bb
>     Traceback (most recent call last):
>       File "Var <LLVM_CONFIGURE_ARCH>", line 1, in <module>
>       File "/home/user/poky/meta-java/classes/openjdk-build-helper.bbclas=
s", line 86, in openjdk_build_helper_get_llvm_configure_arch(d=3D<bb.data_s=
mart.DataSmart object at 0x7fc729388940>):
>              else:
>         >        if 'shark' in d.getVar('PACKAGECONFIG').split():
>                      bb.warn("%s does not support %s in Shark builds yet"=
 % (d.getVar('PN'), arch) );
>     bb.data_smart.ExpansionError: Failure expanding variable LLVM_CONFIGU=
RE_ARCH, expression was ${@openjdk_build_helper_get_llvm_configure_arch(d)}=
 which triggered exception AttributeError: 'NoneType' object has no attribu=
te 'split'
>=20
> It should be safe to set PACKAGECONFIG default value to empty string, so =
we
> can always safely expand it.

This issue should be fixed by commit 327a097 (openjdk-build-helper: fix
arm64 build, 2021-10-22). Can you please verify if it also fixes the
problem in your case?

Thanks & regards;rl

>=20
> Signed-off-by: Esben Haabendal <esben.haabendal@huawei.com>
> ---
>  recipes-core/openjdk/openjdk-7-common.inc | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/recipes-core/openjdk/openjdk-7-common.inc b/recipes-core/ope=
njdk/openjdk-7-common.inc
> index 0435233148b0..7f46a0932204 100644
> --- a/recipes-core/openjdk/openjdk-7-common.inc
> +++ b/recipes-core/openjdk/openjdk-7-common.inc
> @@ -97,6 +97,7 @@ export CACAO_CONFIGURE_ARGS =3D " \
> =20
>  JAVA_HOME[unexport] =3D "1"
> =20
> +PACKAGECONFIG ??=3D ""
>  PACKAGECONFIG[kerberos] =3D "--enable-system-kerberos,--disable-system-k=
erberos,krb5"
> =20
>  EXTRA_OECONF =3D " \
> --=20
> 2.33.0
>=20

>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93479): https://lists.openembedded.org/g/openembedded=
-devel/message/93479
> Mute This Topic: https://lists.openembedded.org/mt/86462361/3617580
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
ichard.leitner@skidata.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


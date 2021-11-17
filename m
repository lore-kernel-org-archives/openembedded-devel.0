Return-Path: <richard.leitner@skidata.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE108C433EF
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 16:24:32 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.114])
 by mx.groups.io with SMTP id smtpd.web09.9449.1637166270696088829
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Nov 2021 08:24:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skidata.com header.s=selector1 header.b=ggZi4/wd;
 spf=pass (domain: skidata.com, ip: 40.107.0.114,
 mailfrom: richard.leitner@skidata.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GaAFRGC3uf1WU5GnclE+Jk2ynx0YxiphX5gUs19tuAsERrZt4Jlhq4KkPHVUAylO8kUbsC8u6Iz6vZ19bPdoFPzgptrs80dhllAQ+TE8i51cBq7neVM7MfK+SDJ2aKFmvF4jpnk6bFgW+tRzrJGhiHrPnqY+FuOEe/rNF+3sQBOcJjCvFUlluYwRjaLwEqTm7qIecp7HoUKMbnKwncJVBM1c1RNXaKhu/balE4c/KuoEWmdoP7ihUhAHMTNsegH7HIiewKzaWaH9X0tO4dLXVQsqRoQDEmR1sMy6J9rW85k+A9g+7jasaz63pB6KvG4e8ojIb3yaaIGtUHGSr2FwBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PWBNfv6uXdyiSUtGjmPgEY52vgH7vUq4YUXSYSijS+I=;
 b=CtJOpvb4NgTcWGAvL7oQida9l2pISk3rKeV+4NZf4kQ8yq3+h5HWe78/dBFpMLphUSbM2vFqR79nn16BweWMppwIZsSlkrAI38OC65nd5wXaZRhrbvzUQIZbkiWYA3Hz1AqBDqc31z37NMWhNw7V8oNjYPFq9eba8xInVK7udDqlIsWGbT0cB8LHu4MO4o4G0L4XnA/VvRGvm+4y9p3EwifWb++r39p+WmNIH5Iza/MRd1hj1/hkVs7QkHqB/UXHn89q8m3BbMCv/FQvMuMFH6s5V6caIe50nf6mZKaC97+FL/M4TNo8aIvz/gE9BWV898q2IWutKDcxIkX2gieh0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=skidata.com; dmarc=pass action=none header.from=skidata.com;
 dkim=pass header.d=skidata.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skidata.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PWBNfv6uXdyiSUtGjmPgEY52vgH7vUq4YUXSYSijS+I=;
 b=ggZi4/wdayER+r+++kze2JAoCYO8EewC+CpikXf1reAspVilla0lpiPn4dMAo38/xIp2yNdSnznWTYHlGb8ZeOFPI9XNyEh1H+y53/vIhq66j6O/ufgUwAVlIiUrJ7O4gyOe483F67svNwQGKySF+97b8DSz23Dm0SZ1P9DutyP+S2KmcbBpOYTGd3YFABGB24VVYdVtvpKR0k0j3na2OvABUkZrkZr+acNHCOk2Mf/HvErzg7ZN9kuq20aYR38irnIyKgHCsrI6niZqXKQ39Tr14yxZOYOeqQNbhqtd6lszRnf2Cw0XRi6lQ7yJ0QyrexeF9mwMdCXiBBD0xPwhXQ==
Received: from VE1PR05MB7376.eurprd05.prod.outlook.com (2603:10a6:800:1b3::19)
 by VI1PR05MB6750.eurprd05.prod.outlook.com (2603:10a6:800:13b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Wed, 17 Nov
 2021 16:24:28 +0000
Received: from VE1PR05MB7376.eurprd05.prod.outlook.com
 ([fe80::21d9:e4fb:d0ff:8596]) by VE1PR05MB7376.eurprd05.prod.outlook.com
 ([fe80::21d9:e4fb:d0ff:8596%4]) with mapi id 15.20.4690.027; Wed, 17 Nov 2021
 16:24:28 +0000
From: Richard Leitner - SKIDATA <Richard.Leitner@skidata.com>
To: "jbrunet@baylibre.com" <jbrunet@baylibre.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-java][PATCH] openjdk-build-helper: fix arm64 build
Thread-Topic: [oe] [meta-java][PATCH] openjdk-build-helper: fix arm64 build
Thread-Index: AQHXx1dQFO71uz5oX0itvpesgjmtHKwIEH+A
Date: Wed, 17 Nov 2021 16:24:28 +0000
Message-ID: <YZUsu/w5bRkoZdG4@ltleri2>
References: <20211022151212.268140-1-jbrunet@baylibre.com>
In-Reply-To: <20211022151212.268140-1-jbrunet@baylibre.com>
Accept-Language: en-AT, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=skidata.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4a84faff-6954-4673-b2d0-08d9a9e6ba49
x-ms-traffictypediagnostic: VI1PR05MB6750:
x-microsoft-antispam-prvs: 
 <VI1PR05MB675078B8547EFDB529035FCDF09A9@VI1PR05MB6750.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 00D9S5+HeqZpxOcZcx82uVX9OLVawrpLTQob8NBtb3M/RxgkCx43BtIS/3v4M+p66rd3Kal3O8yotrtLVItBXTrQu99FZ/3IViFUqN19UQBDiriy7S+NLXXF+//HsYcqLFs7XVUzdiZQQhgI5NkwcUxSxYjUZ9wSgWjLf4NXYSAPPqhVH8g6u2M7/qesTKK64ASsp7ycfFsvZvbevkX8CgsjkiOsM9lL+eEiiXuBinyttTzglkCx/yoNlYgIrabWQVWv0GPfpxhT2nyk+l9hS31t4g/7atbVeLB1Z64oCxkJghMbxvZK8tMZOgHjM7zOM1ef/NjVNEmZ/HOEuVWxJNCXQQNDTU4fDAkgp1AkB/jIL5DSffRCXPN4qxWEey2Yg2hLPYAhFTd/QzgqwkOnxHsWVT0x5IgCJjK7WvLR0Y04/Hca1XGtoESoHbNuPlnDDJf7IVE550I8l40Zwh7Ua0Xrk9E/ka10ccW4F1wj2N+8evjzneSzhy95R3OeRkulTW04j0oFeOKUnTz4QiSHOG2VYpfORvZozx7DeuFSdL7NQfZbWpxQlqcN2C/COSQVevBOVsAgDfX7p5o1E41EKtpjDkpbzvZauDsBDIT/Vkm1JCMkulQCjs1ChPp24cg7UxxlqgEfvQHeHPLxS0Fm0TXZZCercjDOipWDDvAvI/3ooMXfNWyWxbbFQUB1qZRBIUYgf1FzcJjeA3rbBpD7gg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR05MB7376.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(64756008)(6506007)(76116006)(6512007)(33716001)(66476007)(91956017)(66556008)(508600001)(186003)(86362001)(6916009)(83380400001)(66446008)(66946007)(316002)(38070700005)(4326008)(26005)(5660300002)(6486002)(122000001)(2906002)(8676002)(8936002)(9686003)(38100700002)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?1oSy3fyY/q1MzmFua8QSESAOFGIQUZ4Ohpkz3C4CoOX99SamCkXqlKXKbJ75?=
 =?us-ascii?Q?89xBKNwrd3054J9mIDOId08sT+LtabIuG9EGT9XLB1bWkrTvogi1JDRhIC3A?=
 =?us-ascii?Q?n4rI7dMya0ognRctEu2nSIgD82XST+tTCyY0kd3hKgK68GlmNhWrpVO3DnWE?=
 =?us-ascii?Q?SAGvAMH/12RWR0PP4iwF19W2LzRi76t2LKv/MvDQJp1rFetVDcaudke3MDsR?=
 =?us-ascii?Q?rhGxSa7EJAzJ763I4rp/merkwIqj+O0HevEHbVbDgJQu9MUdhTLE9oCVoXUP?=
 =?us-ascii?Q?0LTiDcg7BVct/T0dDzgXDxF7elsUrl1WSa8GZQz2uSP2bx/HMnyinbfP6WoO?=
 =?us-ascii?Q?X8MqgaveWPcmecz9M6H9mECxecQOkLPEIV+Y1a2YYUxOhxZxawOeb2G6nGlB?=
 =?us-ascii?Q?dPQJfO5q3S4/D3Ki8qylFXaEUgOGAIPXe0T/JrbBPd6gIRXDTDHCam9mTKGE?=
 =?us-ascii?Q?af/UIjvpxo4EzqXKm7x8Hw8xjWHe6S9O15MtsK8iw2dyfjz8au+j5101dXPx?=
 =?us-ascii?Q?d6TEYqL9LrBIPAzDM7zaT4PpegFUiSoCT7GwU+4RXl/WzpJvEF7tnYn52WFd?=
 =?us-ascii?Q?pa9ATdZYNdUt7tFklD6Ei2uRef0VjLipMp51gSiQ4ekO/oD00M7MBTsAX2lq?=
 =?us-ascii?Q?HvAyzyakymeWnyrHoX2rDwq/5SHuyp98UMZsgI9UjyW/LVMErZI1CUMJipTa?=
 =?us-ascii?Q?v1FksKitTN7m3ow2TyYS2bTgL4+gRvADPy20GMy3knlHelxm57wciRonNJEO?=
 =?us-ascii?Q?BjOIjkbE86Mik8XfN9c4qI3au9H1yoz2KneGuQGZZGfZsxnQYlhsC0OvLrjH?=
 =?us-ascii?Q?76QbbVh2eY4tWlSTCdXrJH5lU3FnPYx4AxzfnkmR9YvSHiXjhqG3gLfr9/yk?=
 =?us-ascii?Q?IGElv7HuiznGU2T49VjHY4o2kSpkNV4XcdG3BHrbkN9pIkT/TvO7w+k2XG5l?=
 =?us-ascii?Q?t3EKCAW45OclteG3jH5ltrn9H16qTBlHQbkGy7tKV4LrjIiHBqtlX73pIS/q?=
 =?us-ascii?Q?ATgGcoT69TAMeFvz7jlb4ZhM8bFwm6oPVlTneeS5uutAk0ucW+TNB+w9oXTI?=
 =?us-ascii?Q?Lz0YEKfIGMuBhxu7GH2wtRP9XdWiQv7tDn3OfN/uw3zeOo7bX18t40JFJftw?=
 =?us-ascii?Q?r+gjL+FnY6G0iStgcx4U3GZZGs2cp61156CFOEpql6EVMNqMOH07GHAgtORi?=
 =?us-ascii?Q?VSLXvhYLq5ENAZjEyrMIZTfzUo7zseOXYrLbMpplEKvlih9XvfJ9jYFpkESI?=
 =?us-ascii?Q?ZMTGpr/fPFbzb4WlTKC0ZrYnK4/DgF0+CGy/a3CzPTUpuro3kCaeU+msjCR4?=
 =?us-ascii?Q?/WxAZb4s3LvgYA00FeKkn3cDekFoA7MEPtkyZb6HXBnMjbyCAwcbMcue0hqR?=
 =?us-ascii?Q?4uP4D3TylsdIDa4+shpTCfTB/w88bJrsV8u+r6uwB8kByG9qnjs8c9p1MHgZ?=
 =?us-ascii?Q?maD0Jo6sp5nIzG8JeydAe7wNmWGCMiIdxGP3ge1k1Yp5m1vNZSCTWxRWYbho?=
 =?us-ascii?Q?TRWWjmanINvPURNyDLiK00KHrilJp2uH8trG0zrHAB9ZbBuCsZpeblkiWtT9?=
 =?us-ascii?Q?RKgyY++ueKMg6C54N22rx3mJ4Xq6wcLGHaN4NG3/oCTtNhhGwdaLdaU+z0uP?=
 =?us-ascii?Q?+BLDemwbuZO+Iuu2DSYFarUTHg6lCWBxfdIgFoADPbEvnzSucsTQyp5GsgGy?=
 =?us-ascii?Q?y1v89ummicm8KmTEPQ3o4fxEYBI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C9DF7450F57E2C48AC2F8A8E47C16E9D@eurprd05.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: skidata.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR05MB7376.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4a84faff-6954-4673-b2d0-08d9a9e6ba49
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2021 16:24:28.1664
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e5733095-4425-4f08-b6ba-487b9a46a425
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 h70YcpQZuAMAJrE2FyFK7hJoqvR/L+Tw+UVEyrSni1RHMPkZ4YxOx3iXlUkveqyeSmItP/W/A48xQ2gZCtxBDf4I5XTDLFyPwiSZHNMVsW8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB6750
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Nov 2021 16:24:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94002

Hi Jerome,

thanks for the patch! I've just applied it to master-next and if everything
goes well it will be merged to master after some testing.
If you want to see it backported to other branches please let me know!

lg;rl

On Fri, Oct 22, 2021 at 05:12:12PM +0200, Jerome Brunet via lists.openembed=
ded.org wrote:
> When trying to build for an arm64 machine, such as qemuarm64, parsing of
> the recipes fails with the following messages:
>=20
> WARNING: /meta-java/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb: Except=
ion during build_dependencies for LLVM_CONFIGURE_ARCH
> WARNING: /meta-java/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb: Error =
during finalise of /meta-java/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb
> ERROR: ExpansionError during parsing /meta-java/recipes-core/openjdk/open=
jdk-7_99b00-2.6.5.bb
> Traceback (most recent call last):
>   File "Var <LLVM_CONFIGURE_ARCH>", line 1, in <module>
>   File "/meta-java/classes/openjdk-build-helper.bbclass", line 86, in ope=
njdk_build_helper_get_llvm_configure_arch(d=3D<bb.data_smart.DataSmart obje=
ct at 0x7f08fed017c0>):
>          else:
>     >        if 'shark' in d.getVar('PACKAGECONFIG').split():
>                  bb.warn("%s does not support %s in Shark builds yet" % (=
d.getVar('PN'), arch) );
> bb.data_smart.ExpansionError: Failure expanding variable LLVM_CONFIGURE_A=
RCH, expression was ${@openjdk_build_helper_get_llvm_configure_arch(d)} whi=
ch triggered exception AttributeError: 'NoneType' object has no attribute '=
split'
>=20
> Using 'bb.utils.contains' solves the problem.
>=20
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  classes/openjdk-build-helper.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/classes/openjdk-build-helper.bbclass b/classes/openjdk-build=
-helper.bbclass
> index 4e334c26c166..5f838b4f8a17 100644
> --- a/classes/openjdk-build-helper.bbclass
> +++ b/classes/openjdk-build-helper.bbclass
> @@ -83,7 +83,7 @@ def openjdk_build_helper_get_llvm_configure_arch(d):
>      elif arch =3D=3D "arm":
>          arch =3D "arm"
>      else:
> -        if 'shark' in d.getVar('PACKAGECONFIG').split():
> +        if bb.utils.contains('PACKAGECONFIG', 'shark', True, False, d):
>              bb.warn("%s does not support %s in Shark builds yet" % (d.ge=
tVar('PN'), arch) );
> =20
>      return arch
> --=20
> 2.33.0
> =


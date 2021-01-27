Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.71])
 by mx.groups.io with SMTP id smtpd.web10.8615.1611759292547826883
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jan 2021 06:54:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ni6bbn3Z;
 spf=pass (domain: windriver.com, ip: 40.107.237.71, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PqNk+wYJylIiHUzqoOIRoGjxScK8D/TnTDmc737N30WpAJ/zxPPHmPXiWkiLpKKZ80Ww/XRUCRWsOmaSH5fFX4W1VUrAjS0uERpoavW5zDu8yN5QtQlR9ZP9Cwxsfg+zFA5Iv2l4eLWip/hiK3OTrlJwob3Hz/P8AFTzlpkES4NifCq+QG8tdbOWyj0JWg7ANlnnpze+7w02ZR+HsbWAkbr1Kc2s32whU9nme48hbbWejGtLXRqSZZHvJAetgVqni9tGSbTGlg2Gorco70+bArkOK/c+XNQ9ZWeH8fWMKyJxhvSCTvOQI/TeYKgT7eUSZ24gw7YosJdKAQX7VBQMeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kHwqlxRJrysXRiKXXRKAXM86JG21VAgi6x50cECh5BQ=;
 b=WbQecvkxG60BCZYO4AvcalFq75FUGxdPo2nlrhshuLI5yoLHzo7XlsjaUVMB4qUFRBWeM2U5xB7eSdTxAfHTVljAWGjfpyJ7KE9NTqTot5YaUPi81suCsZyuUQTS1wrnFKx0ujPefHqfIm2CIXfbZl7cnpkQdS3nzJRjNbxI5/g7dWKCk28npcCadw/iVycfI4p/WETro1OtGwoXOHpd5Or5M4aNJSS5U+M81K24EAR5hHiiaUCpa1S0A971iXwkefgAQYxj20otVA1NVtGI1VQfXHyAk3FgADToRswugp2HGYoyQ4ic88nwvXm9tHnFiUrXDjAnIFiIOM8uXstr5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kHwqlxRJrysXRiKXXRKAXM86JG21VAgi6x50cECh5BQ=;
 b=ni6bbn3Zc46vIlxptmicj/7KceC+olBqllyJgknCGaIIC1VYsuHGPYiUNZsHg9KPuQslOR2xbzzyLuRpP9SuEdIFYkMmIHEOqfOi6OUDD8TDNOrh20HyimErhLKX4K9kndfCUKtO0my8pHO6rhLlrBu9U2Dns6kuwTQech5Ompg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2680.namprd11.prod.outlook.com (2603:10b6:a02:c9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.17; Wed, 27 Jan
 2021 14:54:51 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3805.017; Wed, 27 Jan 2021
 14:54:51 +0000
Subject: Re: [meta-python][PATCH] packagegroup-meta-python: Add asttokens/mypy/mypy-extensions/typed-ast/send2trash
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <20210124125741.2886-1-schnitzeltony@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <2876029c-cbe1-9c72-ab77-93ad60465303@windriver.com>
Date: Wed, 27 Jan 2021 09:54:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210124125741.2886-1-schnitzeltony@gmail.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR13CA0008.namprd13.prod.outlook.com
 (2603:10b6:208:160::21) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR13CA0008.namprd13.prod.outlook.com (2603:10b6:208:160::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.8 via Frontend Transport; Wed, 27 Jan 2021 14:54:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ed47571-1d5b-4c94-f740-08d8c2d37f9c
X-MS-TrafficTypeDiagnostic: BYAPR11MB2680:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2680821C2686F0608FF5738F9FBB9@BYAPR11MB2680.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	t3FgNqyu2ZZXtVAOi3+g3xzrREPoePdelZ8Zw7Q3z45RKfgq0puJ9EW5s1vIfYj6jLnTT5ZPCmPXJ++SRptYkPXAuHWzbomLl37ZP2NHGmQLgw4mH0RWugBQOxASe56HcvaRolM40ZtI4LfLOcfPMNXx4uEClwoSUuirDfR2mGr8zG/lI19gni64ewTqwH+Ak27t4SQKFkgazE678pRqZ7yzZ6VXP4SwHNRaQkOLCNai8T+PFKGyz3j8DXZgaFyhAwe6lt94w782R652mcpejZ1kukCoKK3TYN3IKNaVOmZEkg12xk8XkhNt6BMHhC6lBnD6Ig6O+1iPWFnr9/v495D/YR1HEx6g2jGXrJWUDCx3l3W4I2M/IfkvakWnTa8yVslskDXVkPrcidUy4vQwEgAJ5RTb9THLRaGRZU5GVYiy9emwPD0GIT3qm2k8kWb0CYVS564IvJ8nHCsyd9Xv3NTCGvCdo6DMPs7gc0sYYE2i/buGJtNoHa57YC2fN8F2z9q1fU7KgjApdy3bg8kuEsCwyDNyP5oN/FlGZTPAFNL9GHFjHHcpw8bFXwwyeXhTJjaWERBDTiYHFY7dly+tnV+PYbEXCS5zrd13Q0HIS4o=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(346002)(136003)(39850400004)(376002)(956004)(66574015)(66556008)(478600001)(8676002)(316002)(44832011)(36756003)(66476007)(66946007)(52116002)(8936002)(53546011)(16576012)(86362001)(2906002)(31686004)(16526019)(2616005)(186003)(5660300002)(31696002)(26005)(83380400001)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?4iyrYi+WtDdLIW6Zz7XQdvtCsuLC/chylASJ15GVmBRYAItSpTpBXhlo/VJo?=
 =?us-ascii?Q?TX5BO0AMuACiQxIM64GyK2IXJDOx4ErcpQztWlRehNwjCv77Qef8qlxdhz06?=
 =?us-ascii?Q?PybfcOIYnBv3wilWFyLQKe4IupL8HeAVOsGNoZijNdyo9eJT1f8pHNhcrogT?=
 =?us-ascii?Q?Z2N6bHuDNQ3f5EWbWcTmRDHjxx0jtVZJHgoA75pkth9BscsvQOrXAc5r3VrC?=
 =?us-ascii?Q?v8U86rylQ0PgBVo6SdE5ji6y6OryDN1aH75D+/njnBZhQGAC9uSK09uzsJiW?=
 =?us-ascii?Q?bKTXDX9nO1uwQc7UokWxYlyis35AIrpCJEGrJ9GgEts/F/FLiA0Xt+OcDbL6?=
 =?us-ascii?Q?Ez864MXvg57xJEltfN3CM03Tfb73CpU+n2KReNA/n95hNqvCJxzVio5lnDeI?=
 =?us-ascii?Q?mzbDHUuyX9FjqHzf4BGJot5Kw6Obzr8JmO9VJyxiX8vdzdEiZnvZy+7zGowY?=
 =?us-ascii?Q?gubLQw+lRr7N1uhRBG5mGvX+lRWsyqxxxutp81QUytKIzrh/te0fJHwJEUhs?=
 =?us-ascii?Q?a7pEdgu5XyyKJ142BZIO1NMhfnxbOMLgX7nl+/fuu0D2Em1RuO6wai3U8/a0?=
 =?us-ascii?Q?84rBaHjl8W4G41KgDUmyjSW615SWgLFWk7J+7v2FAR3fgzrVF5EClWvtwgAz?=
 =?us-ascii?Q?gCl595jGgnOzafRGV7a5wLBs5cKwUo88RbyZso9JfUVdT1tdxRLLlPlhuTLr?=
 =?us-ascii?Q?B/tYUO4C1FItkPPvaIqj7VWe7r+IaYwfBCsCVEwMjw3sBs2weK5c2tr+LHHU?=
 =?us-ascii?Q?P4QL2hNIiUF7/w5T0sbB0IxSF837pjVESMfcjBg4X4vz8LpxShO09jijIpjV?=
 =?us-ascii?Q?cfqMMzN868nWkcLxzoJfAEyTFK4yJvID+/1UeduqcnOfMY1YF94o3W1tslEB?=
 =?us-ascii?Q?YLcarD095MAASBPfScVJEVQW5nNUssHPHL5ACiN0xbm8j5HrQMIiXLeteVNm?=
 =?us-ascii?Q?agapJo887CUI56U3i7B6AKkqk6xFRBi7rmmh4F3oh8ytG0cfgO8asJ+4sQo1?=
 =?us-ascii?Q?cECfmOB6WO6LAQfPX6t4Zcm5ednWJBMmMfI7iFmCO60TKmg+7vJb5p0YRBZA?=
 =?us-ascii?Q?6HGeQDZA?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ed47571-1d5b-4c94-f740-08d8c2d37f9c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2021 14:54:50.9395
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ytXVXH15AtHPJh6/V4nNTE8PMUWY7Ngw1T0G2MbaTcJELs7RWqGcsf+FaKidG01xnX9BCvWtQk1555iOVReEmLN2+YdXpCMBfTyisq/4wNU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2680
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US


On 2021-01-24 7:57 a.m., Andreas M=C3=BCller wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> This is send to be a good boy because packagegroup-meta-python looks brok=
en to
> me:
>
> * Tryping to build fails with:
>    | Missing or unbuildable dependency chain was: ['packagegroup-meta-pyt=
hon3', 'python3-cvxopt', 'lapack', 'libgfortran']
> * We have two "RDEPENDS_packagegroup-meta-python3 =3D". If I am not mista=
ken
>    packagegroup-meta-python3-extended and packagegroup-meta-python3-conne=
ctivity
>    are noobs just setting some variable inside of packagegroup-meta-pytho=
n.bb.
> * Since packages are not sorted it is close to impossible to keep track w=
hat's
>    missing
>
> Please don't ask me to fix this - have no use case for it - and it is bey=
ond
> the scope of this series.
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-core/packagegroups/packagegroup-meta-python.bb   | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-pyt=
hon.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> index bf46896f1..0b00611c3 100644
> --- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> +++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> @@ -48,6 +48,7 @@ RDEPENDS_packagegroup-meta-python3 =3D "\
>       python3-argh \
>       python3-ply \
>       python3-astroid \
> +    python3-asttokens \
>       python3-ndg-httpsclient \
>       python3-arpeggio \
>       python3-astor \
> @@ -184,6 +185,8 @@ RDEPENDS_packagegroup-meta-python3 =3D "\
>       python3-prctl \
>       python3-pyatspi \
>       python3-multidict \
> +    python3-mypy \
> +    python3-mypy-extensions \
>       python3-netaddr \
>       python3-parse \
>       python3-oauthlib \
> @@ -397,6 +400,7 @@ RDEPENDS_packagegroup-meta-python3 =3D "\
>       python3-trafaret-config \
>       python3-twisted \
>       python3-txaio \
> +    python3-typed-ast \
>       python3-typeguard \
>       python3-pytest-timeout \
>       python3-ujson \
> @@ -428,6 +432,7 @@ RDEPENDS_packagegroup-meta-python3-extended =3D "\
>       python3-pyparted \
>       python3-pywbem \
>       python3-pywbemtools \
> +    python3-send2trash \
>   "
>
>   RDEPENDS_packagegroup-meta-python3-connectivity =3D "\
> --
> 2.26.2
>

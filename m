Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.60])
 by mx.groups.io with SMTP id smtpd.web11.22157.1611501280009787748
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Jan 2021 07:14:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=dORDWuyO;
 spf=pass (domain: windriver.com, ip: 40.107.94.60, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cgDQUCQety08xncOMFdTdGgaL77XVatYN1DuSdg2BkXKLAGYiHwCy1FscnOLzHFdneR8SzVtqvvA9MCNXaetpYoXoBzzfe2MyFU6hvY/0EXgOlImcUvgPOGX+HXEsP57icCUl9BCP3LF6qWPi05z5CA+asAEZtYo+K8jxsYypZGevTvcLp93kHaLtqEpQ4BBCaUU3SegEEbtIIIBoNfuciCVwZOQKZ8oMtIs0ieUCu5T4ncc1vSrBiz5D5gqaksOxR53hd6yh/wCKf6PxDj+BD2L0q6veNhGyV33KSjb3kjLGd/58OV/sRk9iF1mYScb8w84d0SFLBbkYVqxhwf1SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w7cjxwWTVgYWwkTZmhSO+tUTnT+pqZOoYwjbALRJR88=;
 b=nXLoeAQqBv58huqjKHOIb3RE/Wg1IgkkDxrouLQ2NFC2GSf1LATIDBQ0xvkMWnK4Z43jvzS0ejzCoVyKZbkCBHecXqvR0p+a8pClxPTtB/PRTR68g6GEOdlrrslVpSFyWEaVy8qu3pArNT4nWhODULnmEvmzFNPYRoKCl2smFKWCcRCuSD9KrKsOSZO4svtJGgLEDv6V8e1Y0qVEMn+eWzbUgYLKBP5l3U+HPaDL5ugSE5HLH7IYNLWr2dLwe69nWAH7KLz3XguWeQODy/PZHkbes+QRNKC6hIrjqoXxnuL3ZhJxvMxmGSkXQMzJR1AeYmGe2ZNpu/eo3DIaYiciMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w7cjxwWTVgYWwkTZmhSO+tUTnT+pqZOoYwjbALRJR88=;
 b=dORDWuyObFdcfpbeueufn/DRqF999PLSnhvoSfyP7rm8MXojVqAoPH+S/P8VnDk9/hneFFQWm0ps5o1moqywDApVAgsW6aVnCp3dfoY7KYKCVtX8VlQizieBmrAPFsDKWQ+14WL1ddi/jcxKinBApgoJQbjDZ8CQpOLQv/G7CEk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2951.namprd11.prod.outlook.com (2603:10b6:a03:90::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.17; Sun, 24 Jan
 2021 15:14:37 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3784.017; Sun, 24 Jan 2021
 15:14:37 +0000
Subject: Re: [meta-python][PATCH] packagegroup-meta-python: Add asttokens/mypy/mypy-extensions/typed-ast/send2trash
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <20210124125741.2886-1-schnitzeltony@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <056d238d-23e8-d689-e7df-b4725769c72c@windriver.com>
Date: Sun, 24 Jan 2021 10:14:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210124125741.2886-1-schnitzeltony@gmail.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL1PR13CA0311.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::16) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL1PR13CA0311.namprd13.prod.outlook.com (2603:10b6:208:2c1::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.6 via Frontend Transport; Sun, 24 Jan 2021 15:14:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56f8f84e-fefa-44db-7c5d-08d8c07ac348
X-MS-TrafficTypeDiagnostic: BYAPR11MB2951:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB29519597DE44BA341BD0F0FD9FBE9@BYAPR11MB2951.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	k67oSpdmJRnHppSV3NkczAXI9/6n0VkO8/75IwSDhy9tnJhliHXzqQRneRAUjRy6skv4xh5yicieFrRH6BCaa4fCiA4eDYrnCfjFE8aDlPScSpg5V1wyPSRcuctNWpRj9Kywd6Ir/Tr/WwCt/fEF9SXa+ua5g5W4eJCvMRIcMKvTZcsBJufzcB/fIQlWF+JlPDpRKPqCeQTVkcuDxYb/bN0VvIS6D5J4ZiKhIlp28RkC2YLIGYaOUHw4Kd+80d8YwzzEZGjyDnIQIdPMMYoDwvv7GTKYWX2vFS5xW55xm4Or4lAGgE0QMdnvJvY8B1TRCiiKlbucrAjgq+6kRxUFMmJqnFiEU55NHwVNJMNLXU/Kr3yyb/AIX8cUJto2KzakVRALzR5XWurXa0ZbLvIg8JSUZO27pt8EomLilEouvc7yEm7ro44eFwP0U/VR5PIPGbqvG4wHItLg1CThIgw3L6DVlSu2Ot/CLEJIWJoBcio=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39830400003)(366004)(396003)(136003)(376002)(346002)(2616005)(956004)(8936002)(316002)(86362001)(36756003)(83380400001)(52116002)(44832011)(2906002)(478600001)(53546011)(31696002)(16526019)(186003)(5660300002)(8676002)(31686004)(66574015)(26005)(16576012)(66476007)(6486002)(66946007)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?1Xuci54/bAYyTvp5/tsmjaOtZ3OKaySrrbivu3nxjgXobf6UlTTz0U+j9GXW?=
 =?us-ascii?Q?OBPWI+dmWn13YIAhwTlez1/aJpAiVROBTRp/2dKrnW2KYynC8fipxTcg0LXG?=
 =?us-ascii?Q?vf8bVqpbNFHK43+4OWHMs9bJRWaquHZyzE9OKgWugEPUM3i73yaZxjg6Uqub?=
 =?us-ascii?Q?6P/FNIuh0v8SErPd8EZtxB7sIlZVyXMAlwT8rOD5UQ6Km3LIWx+HHBW94kAr?=
 =?us-ascii?Q?vIpKF5btYXQhUvFMgNRbEy4ZSXRljSdEjd73bygq8yrBLs35+Kmxm5rLyn5h?=
 =?us-ascii?Q?DEIS7L9a6sgFg+2ENGZCM23kERvTMfFi+qstz13IAQXVZLKSQeiOjkhMauiG?=
 =?us-ascii?Q?XERrEmBM70pIK5uTeK8zUmM40Hz/XS+d0R7xYsp9tJQ6MZUHnG0ZffTQzZae?=
 =?us-ascii?Q?ABuCjkfAMGj26h6y4OV3a6Uf71IrKmauIRkqCDmPuI/0HG0dfqfGu4FguPDk?=
 =?us-ascii?Q?+4mFhqIy+0tCf0LgVrWSmuc9ObqXc6WUjHJdpEEGuDYs+ksjLqZvkDVpdW0H?=
 =?us-ascii?Q?k7aXzv8yoQZ925XNPSKcDV3x7HSCFk6ATMVH1kZpAm+dvpd5rAlNbtDGtX1B?=
 =?us-ascii?Q?3a/184fvONQooPrys+391Ay4h89HSAqibbZPwdhT1kLm7sF3UhjKpy9y/F7f?=
 =?us-ascii?Q?Dd+3K409LlAco3uNb9aLo6zeub9XDOKh1JGN2n8mq0IwDNqlV2EHMXlK2WQJ?=
 =?us-ascii?Q?aR9mzDlpfEKbNDD4PfQ8dvlEGf9Uh4Pk2nHeVPnoCkWCDrn2yFrb9vkZgDDA?=
 =?us-ascii?Q?0rVgVlOTAjTll59b1RzGtxLTWqs0DHpz3XKAb9g5l3ssSopwdDIC2duwuqZJ?=
 =?us-ascii?Q?tzjLpggi3S9ganQUo3nw4x2i8/4LWtvpyxTwfVNJL/sF3/MdN4Mq/c8Wn5Di?=
 =?us-ascii?Q?fJqHDvbWUa+Xe8LRfgVhG0yQIrPCbL3ZJElzgXtUGi9+HnR2sM+p2Tm38Jel?=
 =?us-ascii?Q?6lHv40P0kT0AtUV0Lr1iREZRfBtxKm3Wd1lxlJqMXu21h5ja6npZUI6dczHF?=
 =?us-ascii?Q?7FUC?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56f8f84e-fefa-44db-7c5d-08d8c07ac348
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2021 15:14:36.9854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nbUkaxTtm5dJcpmxuHzmf6je+2I5MnzBAbjw6McNRTto4de2VmcszMt5M3KRC4YmWnVCgNl2zOsygQ4JAkXV6zOeGsKZ1IFcb4TAHB3NhXU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2951
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
Not to worry, I've got my eye on the packagegroup issues, will be fixing=20
them soon. Thanks for sending the patch!
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
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

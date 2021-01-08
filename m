Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.84])
 by mx.groups.io with SMTP id smtpd.web12.303.1610126781474102528
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Jan 2021 09:26:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=YkpBX9qY;
 spf=pass (domain: windriver.com, ip: 40.107.236.84, mailfrom: randy.macleod@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZS7uk8X8APLiA+0WNixTRfydod2v3lx90RnOxc3MTlsMYpqcOCB+mihmruXQVf7ZgZbKDjov2tJGAl2Uam+aPxbxgU7C3Sy7im9JqlQDCWO/DM7Yo+RFPrSNEWzuE1qrWXHSsIwjl1HLqc5HNF4Q5dueL0QWTvt7l9Z8BOVTvJJR01hcTIq7EFwd5cdNCe37XJR1fNbG8QF4g8MIfBLzDd93JwQCXaZPGe9SyM/HZ2hx4WcJuFkZmPdY+LrHSfM6BM7C8hFEjd/b7HuCCESj4Ly0Ffe+hIB2n8lttImvdUy0y5q4NXc9WWLodTxnr6QSVDVnXLiJTXkDmLKWr7Ykug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OBc1pW56A8rTsd4emhnmdhsC1/TmWMrLh/WoPut0RA4=;
 b=FamL1ACWe2PUJvcLXELLN2rFhlhd0yR6Me38CIIm3ldEPQt0w0LXlE1FmhMWe76QzsMXq7J1PGj3ImJEEaE1ppRCllwd8+2UY75B9LbPl2Aly7eO5hRSTrun+TzCb7uaAs4JIWSrvmPMq1bPMRsLK3jcXznndWLT5A6E8gx56qf6jokITgRN11EBNV1OdfbhClsyB+Dvx9PzHKEVT8fnSvZcEr1TKQ7z99muWS1wDhoOYRy9Zgd+mt3zELDPcM2fQFzbyEWRu0Dc3aBO4PuRusbF+Zby+pW40BVwrlaiQ4BANzE570xehJHxTMHB1BgkZXUUgoquCqitKv7X5LDTag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OBc1pW56A8rTsd4emhnmdhsC1/TmWMrLh/WoPut0RA4=;
 b=YkpBX9qYlGR2RBqP33ZbI6vZgc/aM9X13Moxv3nWhwNwW4vpM6/hG4lVDybfkv8ZC22MUpeUHbtOES7adg7WZdj1J4uhUolyJYsH2MlpJLj/BQP8rK6dDrmkS2pdYw0wcOPTeEqSfGZXfQCoBenGzDAjRPjG7K8jqvFRX+0dIyE=
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB4724.namprd11.prod.outlook.com (2603:10b6:5:2ad::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 17:26:19 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::8e2:471a:7b63:1a0e]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::8e2:471a:7b63:1a0e%7]) with mapi id 15.20.3742.006; Fri, 8 Jan 2021
 17:26:19 +0000
Subject: Re: [oe] [PATCH 07/28] xfwm4: upgrade 4.14.5 -> 4.16.0
To: Khem Raj <raj.khem@gmail.com>, =?UTF-8?Q?Andreas_M=c3=bcller?=
 <schnitzeltony@gmail.com>, openembedded-devel@lists.openembedded.org,
 "Mittal, Anuj" <anuj.mittal@intel.com>, Kang Kai <kai.kang@windriver.com>
References: <20210106151717.1779543-1-schnitzeltony@gmail.com>
 <20210106151717.1779543-7-schnitzeltony@gmail.com>
 <d1bd0b10-bdd2-6820-61c1-38b7c8e5dc7e@gmail.com>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <7aabf117-f702-0813-db20-831446869875@windriver.com>
Date: Fri, 8 Jan 2021 12:25:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <d1bd0b10-bdd2-6820-61c1-38b7c8e5dc7e@gmail.com>
X-Originating-IP: [198.48.226.187]
X-ClientProxiedBy: SJ0PR03CA0130.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::15) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
Return-Path: randy.macleod@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.2] (198.48.226.187) by SJ0PR03CA0130.namprd03.prod.outlook.com (2603:10b6:a03:33c::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Fri, 8 Jan 2021 17:26:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 31f3e31e-a26e-4c4b-df8f-08d8b3fa8310
X-MS-TrafficTypeDiagnostic: DM6PR11MB4724:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB4724563CC9D039F95F557DF0F8AE0@DM6PR11MB4724.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:312;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zXRUqaStzMyZNMQstVp/zmOagKocYtZnayGKWeZDbG5dhB6Yht7m/wErzwxrNMryBqnel3SSn5/z1CHeBIQsZSyYpOYte0nzjs6sENkgWxNYOre1gAae8/pJk9gUii6WKl2/YMNvFoXpT1+GsDVkx+Uw+YCxhaNToTFBf3Ot+BCCxswJhDuImnhVIqu0URxWVWKckqdd2rbSf/+JStakP0CsCNtNmTw1THRL8Mq40U8U+BSAeOw47tn9nxmm2ZorCtOTKiV7YqbXWl5Y/kcQrO4KBpAm8b4MeP5S0yJl3pe/v5SQQGukgt8Cl0F3v7uAnaBYsvmkL7hoPrdRaWsb52Rr1K+bD/1bouGnviDfibqSkQ6ET02HTZyD0Z03wf0Ok3sqOsPKCCqJSygsA1OwFegwqFgw1EeqMrdPAI5Gm92Wn39uUjorb/e/ZpzX+ESSPdJi8IKC2/A5QvSjO1g+1ZQpuJtlBlrRj3+49xy/r1q5aRaq+4Iw6elTeqH/XkMJXjThWdXDQLnxtXfMDw/m1cVJ4VbZ0Zd6F7ePNIaxpuhHR06NVuuac7eIpTOoeldX
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(366004)(396003)(39850400004)(346002)(110136005)(66556008)(66946007)(6666004)(478600001)(31696002)(66476007)(966005)(83380400001)(6486002)(16576012)(31686004)(186003)(956004)(2616005)(2906002)(53546011)(26005)(86362001)(16526019)(8936002)(316002)(30864003)(36756003)(6636002)(52116002)(66574015)(8676002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?lM4eCkr6YprPZaC27sgd4+Hsqzj6aHSaDkb1X5dL5nJ0EqlE/hT7mXWgP6kN?=
 =?us-ascii?Q?YlRGa9h3B8kE1sGx+9mcHQRiJUvldrS8M4itO6QEWW/CptDCzWo4VYYt7HDd?=
 =?us-ascii?Q?Enjqq7jKpoq7AcM8XIP+GMOm0n9rG0l9S3kp2HCFi3bp5y5dJ0xiLdopOGOT?=
 =?us-ascii?Q?9cZgtGxCb2xuUi8Cx5tj4otXiTOHLib5E2EWGdbaZEN6Rm7k80u1eeyE1peP?=
 =?us-ascii?Q?hPSFEtm94ZWHT8kkf14mH6PCeiWvBNGHOAzfzZ8B7daBySTOJ3Vc/ghZDb3o?=
 =?us-ascii?Q?4hNiwyw4lvnRvFXCUYA0l5tLH4fwj4V7qM3HlP0VpX9D7fj5iQ47QCZr4Gtg?=
 =?us-ascii?Q?ONaZuZUcwVxBCRJJ32F3cqC83QPp5VzzPwqVdnlnpEMhhx0lwE2arYrsnCde?=
 =?us-ascii?Q?GOn69rUUeZo/PsTBkJn/SRXE2xhztmiq0ZUUurX9chC5wP3T58ma498OlTlS?=
 =?us-ascii?Q?KZ7ULLb3lturRt232n+ej6alK8oeGXPxLBreqMGEpBPY2ybB1pM41dtGt2qJ?=
 =?us-ascii?Q?UDY+mlRvF6c/rXRq/T/Eftm/NOXz5uNts3CGfTZYyK9MfDD2ANaev/d8VY+9?=
 =?us-ascii?Q?rC8bF4W2EsWiqKYNak9XtVD587+ReX7QAwrRVqUn0aKOVmX6udWmbgx48PXP?=
 =?us-ascii?Q?go2LURHdUkePqj6yksWYNuHy+fcggrngVSChYJz1huTg/FYeFknXDICsL7Nr?=
 =?us-ascii?Q?hDV9bGYTJ7xvkm1pAGKPPXd+kKOHT7MV/58yjblRyCKNafdqtNLmU6XcA6N3?=
 =?us-ascii?Q?4nZBQakG1jVW5qqXJMbFolZKIzOSBuMrmheDO8//OQPtBwekdMXzk1PdI0KQ?=
 =?us-ascii?Q?oAglmsp8qhY1kDF8vUszV++fPROo9mWXvyKfpByflg2PAtIcA4Fb02YT6BIv?=
 =?us-ascii?Q?buGFcc9yscmOw9ZE8ny8YufFRZ9BXncQbj7OG0QKxZ9p+MNrMP4pKOA+ebNd?=
 =?us-ascii?Q?RrJ8mikYk6iXZhjkzuJxwTriw2lp3UeuedpnBxMhgIaiqi+jBTv9G271IaVv?=
 =?us-ascii?Q?iOAN?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 17:26:19.4262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 31f3e31e-a26e-4c4b-df8f-08d8b3fa8310
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GEv1+qL1J6ORZ1KohwZQKcPEdvWMUYDSRj0wkNlGmpO5SxRWHAANQzeRFfjMLVNdbKQcyj8K8PwmRYYqTZ6uOvW6etDCOKJvpbUVZybEubw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4724
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-CA

On 2021-01-06 1:55 p.m., Khem Raj wrote:
> Anuj and Randy FYI
>
> On 1/6/21 7:16 AM, Andreas M=C3=BCller wrote:
>> Compositor patch does not apply anymore and testing x86-64 excceeds my
>> resources. Looked into Fedora sources: They build xfwm4 un-patched=20
>> either.

Thanks for the heads up Khem.

Kai, can you take a look in the coming days/weeks?

../Randy

>>
>> Release notes for 4.16.0
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>> - common: Avoid zero refresh rate for monitor
>> - hints: Protect against XError from XGetTransientFor()
>> - netwm: Allow above/below only for regular windows
>> - netwm: Mark splashscreen as transient for groups
>> - client: Complete client state even on different workspaces
>> - build: Increase GTK+ requirement to 3.22
>> - Add `cycle_minimized` option
>> - compositor: Release overlay window last
>> - compositor: Free GLX data when really using GLX
>> - compositor: Remove useless trace message
>> - compositor: Release current GLX context on teardown
>> - display: Remove custom XError handler
>> - compositor: Check for XError when adding windows
>> - compositor: Trap XErrors when disabling compositor
>> - main: Enable compositor by default
>> - compositor: Remove automatic redirect support
>> - main: Add short command line options
>> - main: Add debug command line option
>> - pixmap: Use a safer strncpy()
>> - settings: Fix compiler warning
>> - Remove useless autotools macros and Makefile targets
>> - Use --enable-debug=3Dyes when compiling from git
>> - Revert "compositor: Do not damage on opaque region update"
>> - themes: Use smaller, lighter shadows
>> - compositor: Check if compositor is enabled
>> - compositor: Avoid XError when disabling compositor
>> - compositor: Warn for missing epoxy GL function
>> - netwm: Do not raise window if activate is set to none
>> - Remove GSourceFunc casts
>> - compositor: Fix build with older epoxy versions
>> - settings: Add 'Always on top' to the double click action
>> - Settings: Remove default alphabetical sorting of keyboard shortcuts
>> =C2=A0=C2=A0 Closes: #451 (Disable initial sorting of keyboard shortcut=
s)
>> - compositor: Handle XFixes XError
>> - compositor: Add support for GL_ARB_sync
>> - compositor: Return early if a Present swap is pending
>> - debug: Fix build in debug mode
>> - compositor: Fix compilation issue with Xpresent
>> - compositor: Log fence and GLX swap time in debug mode
>> - compositor: Move fence sync to redraw_glx
>> - compositor: Move fence triggered to its own function
>> - compositor: Set swap control if possible
>> - compositor: Adjust to the actual number of buffers
>> - compositor: Use a GLX drawable per buffer
>> - client: Allow transients for group to be minimized
>> - settings: Add a UI option for desktop zooming
>> - themes: Remove title shadow
>> - themes: Adjust shadows size/opacity
>> - client: Make above/below consistent
>> - compositor: Limit damage region to the screen
>> - compositor: Optimize repaint without vblank
>> - compositor: Only accumulate damage with multiple buffers
>> - compositor: Copy entire content for GLX buffers
>> - xsync: Handle XError
>> - compositor: Ignore opaque region for shaded windows
>> - compositor: Clip opaque region against window shape
>> - client: Protect against XError in XKillClient()
>> - compositor: Do not damage on opaque region update
>> - compositor: Opaque region applies to client window
>> - compositor: Reuse client size
>> - client: Toggle tiling on key shortcut
>> - client: Small cleanup
>> - Add README.md to EXTRA_DIST
>> - client: Keep tiled size of windows
>> - compositor: No need to update compositor window on configure
>> - compositor: Limit opaque region clipping to window extents
>> - compositor: Damage on opaque region update only if visible
>> - client: Send synthetic configure on force redraw
>> - Post release tag bump
>> - Translation Updates:
>> =C2=A0=C2=A0 Albanian, Arabic, Armenian (Armenia), Basque, Belarusian, =
Belarusian
>> =C2=A0=C2=A0 (Tarask), Bengali, Bulgarian, Catalan, Chinese (China), Ch=
inese (Hong
>> =C2=A0=C2=A0 Kong), Chinese (Taiwan), Croatian, Czech, Danish, Dutch, E=
astern
>> =C2=A0=C2=A0 Armenian, English (Australia), English (Canada), English (=
United
>> =C2=A0=C2=A0 Kingdom), Estonian, Finnish, French, Galician, Georgian, G=
erman,
>> =C2=A0=C2=A0 Greek, Hebrew, Hungarian, Icelandic, Indonesian, Interling=
ue,
>> =C2=A0=C2=A0 Italian, Japanese, Kazakh, Korean, Latvian, Lithuanian, Ma=
lay,
>> =C2=A0=C2=A0 Norwegian Bokm=C3=A5l, Norwegian Nynorsk, Occitan (post 15=
00), Persian
>> =C2=A0=C2=A0 (Iran), Polish, Portuguese, Portuguese (Brazil), Romanian,=
 Russian,
>> =C2=A0=C2=A0 Serbian, Slovak, Slovenian, Spanish, Swedish, Thai, Turkis=
h,
>> =C2=A0=C2=A0 Ukrainian, Urdu, Urdu (Pakistan), Uyghur
>>
>> Release notes for 4.15.3
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>> [Please note that this is a development release.]
>>
>> - Quick release after 4.15.2 to fix a regression with opaque
>> =C2=A0=C2=A0 regions leaving trails of unpainted areas on resize.
>>
>> Release notes for 4.15.2
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>> [Please note this is a preview release of a development version]
>>
>> - Add support for opaque regions in the compositor
>> - Make cursor zoom optional (xfce/xfwm4#439)
>> - Remove the deprecated options "--daemon" (Pablo Mazzini)
>> - Disable Xi2 support by default
>> - Add column sorting in settings
>> - Optimize window matching in the compositor with a hash table
>> =C2=A0=C2=A0 (Michael Banack)
>> - Add more XErrors traps
>> - I18n: Updated translations: ar, ast, be, be@tarask, bg, bn, ca,
>> =C2=A0=C2=A0 cs, da, de, el, en_AU, en_CA, en_GB, es, et, eu, fa_IR, fi=
, fr,
>> =C2=A0=C2=A0 gl, he, hr, hu, hy_AM, hye, id, ie, is, it, ja, ka, kk, ko=
, lt,
>> =C2=A0=C2=A0 lv, ms, nb, nl, nn, oc, pl, pt, pt_BR, ro, ru, sk, sl, sq,=
 sr,
>> =C2=A0=C2=A0 sv, th, tr, ug, uk, ur, ur_PK,
>> =C2=A0=C2=A0 vi, zh_CN, zh_HK, zh_TW
>> =C2=A0=C2=A0 New translations: be@tarask, fa_IR, hye, ka
>>
>> Release notes for 4.15.1
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>> [Please note that this is a development release.]
>>
>> - Fix an error leak in compositor (xfce/xfwm4#351)
>> - Fix compositor selection atom misuse
>> - Prefer zero initialized memory allocation functions
>> - Use g_slice allocator for compositor windows
>>
>> Release notes for 4.15.0
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>> [Please note that this is a development release.]
>>
>> - First 4.15.x development release
>> - Show tabwin only on primary monitor if set
>> - All fixes and i18n as found in 4.14.4
>>
>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
>> ---
>> =C2=A0 ...r-Revert-to-GLX-as-default-vblank-me.patch | 92 -------------=
------
>> =C2=A0 .../{xfwm4_4.14.5.bb =3D> xfwm4_4.16.0.bb}=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 5 +-
>> =C2=A0 2 files changed, 2 insertions(+), 95 deletions(-)
>> =C2=A0 delete mode 100644=20
>> meta-xfce/recipes-xfce/xfwm4/files/0001-Revert-compositor-Revert-to-GLX=
-as-default-vblank-me.patch
>> =C2=A0 rename meta-xfce/recipes-xfce/xfwm4/{xfwm4_4.14.5.bb =3D>=20
>> xfwm4_4.16.0.bb} (82%)
>>
>> diff --git=20
>> a/meta-xfce/recipes-xfce/xfwm4/files/0001-Revert-compositor-Revert-to-G=
LX-as-default-vblank-me.patch=20
>> b/meta-xfce/recipes-xfce/xfwm4/files/0001-Revert-compositor-Revert-to-G=
LX-as-default-vblank-me.patch=20
>>
>> deleted file mode 100644
>> index 04fd623e8..000000000
>> ---=20
>> a/meta-xfce/recipes-xfce/xfwm4/files/0001-Revert-compositor-Revert-to-G=
LX-as-default-vblank-me.patch
>> +++ /dev/null
>> @@ -1,92 +0,0 @@
>> -From acdceb0b28d86199b8c2233880fa8a04cb24d4d4 Mon Sep 17 00:00:00 2001
>> -From: Kai Kang <kai.kang@windriver.com>
>> -Date: Wed, 24 Jul 2019 09:48:04 +0800
>> -Subject: [PATCH] Revert "compositor: Revert to GLX as default vblank=
=20
>> method
>> - (again)"
>> -
>> -This reverts commit e07574d6e7a2dbaa08c3ba4765c6306073d9493e.
>> -
>> -It sets the default vblank method (auto) to GLX from 4.13.2. But it
>> -fails to start xfwm4 on intel-x86-64 boards with error:
>> -
>> -| xfwm4:=20
>> ../mesa-19.1.1/src/mesa/drivers/dri/i965/intel_mipmap_tree.c:1293:
>> -| intel_miptree_match_image: Assertion `image->TexObject->Target =3D=
=3D=20
>> mt->target' failed.
>> -| Aborted
>> -
>> -There is also a RHEL defect:
>> -https://bugzilla.redhat.com/show_bug.cgi?id=3D1678334
>> -
>> -Revert the commit to fix the issue.
>> -
>> -Upstream-Status: Inappropriate [workaround]
>> -
>> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ----
>> - src/compositor.c | 41 +++++++++++++++++++----------------------
>> - 1 file changed, 19 insertions(+), 22 deletions(-)
>> -
>> -diff --git a/src/compositor.c b/src/compositor.c
>> -index 25615282..daced607 100644
>> ---- a/src/compositor.c
>> -+++ b/src/compositor.c
>> -@@ -4483,13 +4483,28 @@ compositorManageScreen (ScreenInfo=20
>> *screen_info)
>> -=C2=A0=C2=A0=C2=A0=C2=A0 XClearArea (display_info->dpy, screen_info->o=
utput, 0, 0, 0, 0,=20
>> TRUE);
>> -=C2=A0=C2=A0=C2=A0=C2=A0 TRACE ("manual compositing enabled");
>> -
>> -+#ifdef HAVE_PRESENT_EXTENSION
>> -+=C2=A0=C2=A0=C2=A0 screen_info->use_present =3D display_info->have_pr=
esent &&
>> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (screen_info->vblank_mode =3D=3D=
=20
>> VBLANK_AUTO ||
>> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 screen_info->vblank_mode =3D=
=
=3D=20
>> VBLANK_XPRESENT);
>> -+=C2=A0=C2=A0=C2=A0 if (screen_info->use_present)
>> -+=C2=A0=C2=A0=C2=A0 {
>> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 screen_info->present_pendi=
ng =3D FALSE;
>> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XPresentSelectInput (displ=
ay_info->dpy,
>> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 screen_info->output,
>> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 PresentCompleteNotifyMask);
>> -+=C2=A0=C2=A0=C2=A0 }
>> -+#else /* HAVE_PRESENT_EXTENSION */
>> -+=C2=A0=C2=A0=C2=A0 screen_info->use_present =3D FALSE;
>> -+#endif /* HAVE_PRESENT_EXTENSION */
>> -+
>> - #ifdef HAVE_EPOXY
>> --=C2=A0=C2=A0=C2=A0 screen_info->use_glx =3D (screen_info->vblank_mode=
 =3D=3D VBLANK_AUTO ||
>> --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 screen_info->vblank_mode =3D=3D VBLANK_GLX);
>> -+=C2=A0=C2=A0=C2=A0 screen_info->use_glx =3D !screen_info->use_present=
 &&
>> - #ifdef HAVE_XSYNC
>> --=C2=A0=C2=A0=C2=A0 screen_info->use_glx &=3D display_info->have_xsync=
;
>> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 display_info->have_xsync &&
>> - #endif /* HAVE_XSYNC */
>> --=20
>> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 (screen_info->vblank_mode =3D=3D=20
>> VBLANK_AUTO ||
>> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 screen_info->vblank_mode =3D=3D VBLANK_GLX);
>> -=C2=A0=C2=A0=C2=A0=C2=A0 if (screen_info->use_glx)
>> -=C2=A0=C2=A0=C2=A0=C2=A0 {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 screen_info->glx_cont=
ext =3D None;
>> -@@ -4503,24 +4518,6 @@ compositorManageScreen (ScreenInfo *screen_info=
)
>> -=C2=A0=C2=A0=C2=A0=C2=A0 screen_info->use_glx =3D FALSE;
>> - #endif /* HAVE_EPOXY */
>> -
>> --#ifdef HAVE_PRESENT_EXTENSION
>> --=C2=A0=C2=A0=C2=A0 screen_info->use_present =3D display_info->have_pr=
esent &&
>> --#ifdef HAVE_EPOXY
>> --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !screen_info->use_glx &&
>> --#endif /* HAVE_EPOXY */
>> --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (screen_info->vblank_mode =3D=3D=
=20
>> VBLANK_AUTO ||
>> --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 screen_info->vblank_mode =3D=
=
=3D=20
>> VBLANK_XPRESENT);
>> --=C2=A0=C2=A0=C2=A0 if (screen_info->use_present)
>> --=C2=A0=C2=A0=C2=A0 {
>> --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 screen_info->present_pendi=
ng =3D FALSE;
>> --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XPresentSelectInput (displ=
ay_info->dpy,
>> --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 screen_info->output,
>> --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 PresentCompleteNotifyMask);
>> --=C2=A0=C2=A0=C2=A0 }
>> --#else /* HAVE_PRESENT_EXTENSION */
>> --=C2=A0=C2=A0=C2=A0 screen_info->use_present =3D FALSE;
>> --#endif /* HAVE_PRESENT_EXTENSION */
>> --=20
>> -=C2=A0=C2=A0=C2=A0=C2=A0 if (screen_info->use_present)
>> -=C2=A0=C2=A0=C2=A0=C2=A0 {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g_info ("Compositor u=
sing XPresent for vsync");
>> ---
>> -2.20.1
>> -
>> diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.14.5.bb=20
>> b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.16.0.bb
>> similarity index 82%
>> rename from meta-xfce/recipes-xfce/xfwm4/xfwm4_4.14.5.bb
>> rename to meta-xfce/recipes-xfce/xfwm4/xfwm4_4.16.0.bb
>> index f8febe804..3f64365f0 100644
>> --- a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.14.5.bb
>> +++ b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.16.0.bb
>> @@ -2,14 +2,13 @@ DESCRIPTION =3D "Xfce4 Window Manager"
>> =C2=A0 SECTION =3D "x11/wm"
>> =C2=A0 LICENSE =3D "GPLv2"
>> =C2=A0 LIC_FILES_CHKSUM =3D=20
>> "file://COPYING;md5=3Dd791728a073bc009b4ffaf00b7599855"
>> -DEPENDS =3D "virtual/libx11 libxfce4ui libwnck3 libxinerama exo-native=
"
>> +DEPENDS =3D "virtual/libx11 libxfce4ui libwnck3 libxinerama"
>> =C2=A0 =C2=A0 inherit xfce update-alternatives features_check
>> =C2=A0 =C2=A0 REQUIRED_DISTRO_FEATURES =3D "x11"
>> =C2=A0 -SRC_URI +=3D=20
>> "file://0001-Revert-compositor-Revert-to-GLX-as-default-vblank-me.patch=
"
>> -SRC_URI[sha256sum] =3D=20
>> "d7a7c63fa42ec6d7cb3caab130d6f496be5bd7689b775d20e8786b7f3e282930"
>> +SRC_URI[sha256sum] =3D=20
>> "1e22eae1bbb66cebfd1753b0a5606e76ecbf6b09ce4cdfd732d093c936f1feb3"
>> =C2=A0 =C2=A0 PACKAGECONFIG ?=3D " \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES', =
'opengl', 'epoxy', '',=20
>> d)} \
>>
>>
>>
>>=20
>>

--=20
# Randy MacLeod
# Wind River Linux


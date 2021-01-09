Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.40])
 by mx.groups.io with SMTP id smtpd.web10.1283.1610183765615803148
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 Jan 2021 01:16:05 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=NM7EYBCi;
 spf=pass (domain: windriver.com, ip: 40.107.94.40, mailfrom: kai.kang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dFSQJdasBtRRYK8SJdteZyEmsTJsOtrtJ+YkX174oaKMiDCwQaHEd6OqVTZkYNZbKi/fe0AW9rAklTv5GDwWZi8TTkwyvSkfWWLsTPAWp95xnJjFJ5m8WowuxWYTLskf2MgH4IhdhGyR50sWdSljbYMHzvIdhr8bZYSGpqwf5iOMGWDMYFrgYfVfbWl56qjDM00Ia4aOV9s9h2zz5g5ZBvpf2EF/Y8GPZ+y5F3WqouSFikVBLMo5MYc81m7pXpv6MyhjMBqqNJaChpunrEhnVsEt/ZqrYI2iQqeoT/Gveg95zzetDjt+rZxk5AaQp0kgVG0ip7UALMOzPaIskrnQ4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UHjuL6jbFpiD3vI97W4/oYjH/9ajzAOlaRxgsdcluhc=;
 b=PhQcdJmvKylQkuuZqAs0Rv+R/W/WR2o4WujtRchi/qNKUQwoAjuLu6IMaUx+s8qyr/GwvzKmxr3SOZkGv01q2td9cklArq80CqoCZ3giwX9W+4omfQhozauy2CWNYDf9F5+vXWnZEwD1BetzOVw9jDyWCpiMaDin0pSqmAWANYdhoy6HIIwZMdBIfzwenkOvTKLJO4ph2dHRTFc79Vcy2ngFz3HeqfbHlb5PAxpMOrIwt76gBiuq3nF9VYDoTC/R3dYY5yPcYpksZS2fHqdBCA3lOHPdbaq4YgUmF0QDj/E+nD5hBd4f0oi1nmMFfAWWyYObNP5xrVMT7mqbR5bqsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UHjuL6jbFpiD3vI97W4/oYjH/9ajzAOlaRxgsdcluhc=;
 b=NM7EYBCiVa72uf0EzJ8hFoO8FiXEPoldhEHxD1xDEqfWS8t5ptMdq73rTQCFmDC+Nitl448qdZkm6nxWC/cJoJLCuhyCTSBTFJfHYRmvjnTjA09CBww7BSmf/EKOTcIWS3ShHR/jMwQ9FYFZrh5nlv+chIo409WrfXVJtTK+oHY=
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB3294.namprd11.prod.outlook.com (2603:10b6:805:c4::33)
 by SN6PR11MB3198.namprd11.prod.outlook.com (2603:10b6:805:c3::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Sat, 9 Jan
 2021 09:16:03 +0000
Received: from SN6PR11MB3294.namprd11.prod.outlook.com
 ([fe80::b4b5:fc79:127b:66f4]) by SN6PR11MB3294.namprd11.prod.outlook.com
 ([fe80::b4b5:fc79:127b:66f4%6]) with mapi id 15.20.3742.009; Sat, 9 Jan 2021
 09:16:03 +0000
Subject: Re: [oe] [PATCH 07/28] xfwm4: upgrade 4.14.5 -> 4.16.0
To: Randy MacLeod <randy.macleod@windriver.com>, Khem Raj
 <raj.khem@gmail.com>, =?UTF-8?Q?Andreas_M=c3=bcller?=
 <schnitzeltony@gmail.com>, openembedded-devel@lists.openembedded.org,
 "Mittal, Anuj" <anuj.mittal@intel.com>
References: <20210106151717.1779543-1-schnitzeltony@gmail.com>
 <20210106151717.1779543-7-schnitzeltony@gmail.com>
 <d1bd0b10-bdd2-6820-61c1-38b7c8e5dc7e@gmail.com>
 <7aabf117-f702-0813-db20-831446869875@windriver.com>
From: "kai" <kai.kang@windriver.com>
Message-ID: <1062f406-8478-29af-ec4e-8c9d7c4c17e1@windriver.com>
Date: Sat, 9 Jan 2021 17:11:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <7aabf117-f702-0813-db20-831446869875@windriver.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0165.apcprd02.prod.outlook.com
 (2603:1096:201:1f::25) To SN6PR11MB3294.namprd11.prod.outlook.com
 (2603:10b6:805:c4::33)
Return-Path: kai.kang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.141] (60.247.85.82) by HK2PR02CA0165.apcprd02.prod.outlook.com (2603:1096:201:1f::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Sat, 9 Jan 2021 09:16:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cad0464e-acf8-49ba-8478-08d8b47f301f
X-MS-TrafficTypeDiagnostic: SN6PR11MB3198:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB3198A1098EE9C01353C8F6DB95AD0@SN6PR11MB3198.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:312;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	J/wdLh3Hr4CoH5zUXcXq6ThwnqlQDYPE27Z2lG7SJnGOVGBhco1LYWs6F2efgt99UNz6LstdpZLaa71z1N57THNobyt6+MMizc8AaGgpXsI2Dd5NZjrT9ZH5STUNnRbkRnoiTqeelr+HILiBrvwh9zR03RQCVLuTOcT9j4/xjhtd9tm0LPkadByYUnklH2DrOcX0JanTyQUvgCyFHkh6g1a0N8Kmscfo+vthAglv3Fq2odpM/S0MP8VpDPPlOHxaXYQyDL4Dzx/6ln1hxe9VUPbGiEVL1bxuhHzf/53PBCR2oge+cgZU6Ue+2bZOSLaduQ8Pb5hybznzGVaGmhtLTM+J3rFGNYWjJqUfs3SL3NmrBpEcuHXfvfhY1sZQ4mvg5+5fOY7RSLMUH1ZwOUP2jDJYz25zfh0OKcoMgmwNANWPaMIV30m9MFgTfGiP2FK0Woi2IKbSGUUFz95NE+l0jf3gWhi/NGH/mTLq54Pi2rJF+adOmYk8TnU3oeOBE2tKTImrImGNzX81a3DvFuVxKa6vLvVew1J7AhXiP7U1kv9NBDOkSo+TVm7L5dweAHWhopaoG7hPWdI4kaHl2KqOMA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3294.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(366004)(346002)(39850400004)(376002)(2906002)(31686004)(36756003)(8936002)(53546011)(6666004)(186003)(956004)(86362001)(110136005)(31696002)(52116002)(8676002)(2616005)(16526019)(6486002)(30864003)(83380400001)(6706004)(316002)(478600001)(5660300002)(66476007)(26005)(66556008)(966005)(16576012)(66946007)(66574015)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?7cC2qMpNoe3QGrb49ohXi0C5FpxqtqoP0N8aUti/ddBPhttV8DcNdytjS58q?=
 =?us-ascii?Q?XLEaoutYypMRINLqR21MoHch0Ao9k/rjAzW+8SCTykLiWhivX+KZUKK9WHlt?=
 =?us-ascii?Q?o1fk2wjaBF3cnX9YvhaxgEgZv77LZQi0c61ybRsW1MIel5hGxE9RjgAGR/Qw?=
 =?us-ascii?Q?HPJXsDQ52LXNMHbqUnFUPisWWhHjV4PyJr0AmAJBDYciHBEZy3wTMls6qk6T?=
 =?us-ascii?Q?bvdJZFuTTpW9EfY8E7DV33QfST/RjcmNSFAM95C9mjpQjM6A48SkcVQrlX3m?=
 =?us-ascii?Q?lHpGkXUaNEl93AEdNLCQ/K9U7mMoVP7n/lEpqZvmWonFVm6DuuOpJBUl2ehS?=
 =?us-ascii?Q?ndU9QxvAJ137NCGtATzNN/TFvqqDSJXKBqImBXyMvyy9i1M2Kpc/DOGKBKjX?=
 =?us-ascii?Q?KZ7O9DZSKRxtB9/Fin83incZh1xiuzi5EHEON+PtGuZcwVP+DqDtiqIy2QB0?=
 =?us-ascii?Q?Pabrc2ppTot+NlJhNZ4J/WfOCs+P9YCq6dMGGzWdDfUBlCWlN5RcqN+tir3e?=
 =?us-ascii?Q?nvKHK5WjfEmNdVZZtxawsqFAwPQ3pYV/8o8Tr9rGco/sCfvrjZTU0nYTujT5?=
 =?us-ascii?Q?+vKbIFS35TgXWj+418At1DKIrN7KTYYwlRsl1X4WMHraAMroCW6qHyLbfuPK?=
 =?us-ascii?Q?OSCYMCsZN7jXesgPohqcr7k/gKOJXQBFNi1p1q11NYoQCRBYEJWVYKawP7YZ?=
 =?us-ascii?Q?amBY49jGYworzDPj/mujX3p5fnbMCD7TWMwudadixvK/XlREJcpchwpEOgkM?=
 =?us-ascii?Q?S4z+K0G/C2fXojDc8gXyvxMY+JarFiW5GiW4XKJZVkFpBekWVYtaz75w4Quu?=
 =?us-ascii?Q?fB1kb54ZMfOa/0sJki/DOwceCkdNxlVXcub1nt7hwHg8k6MCpouM3li2vo7m?=
 =?us-ascii?Q?ipRPFYe9nGHB1QYTKTL77HuDx64Ri0Qz6fri+KANy735mOUqkLtVhh+yMxqp?=
 =?us-ascii?Q?OP2YxMFsHtF0zP5gmvNXEw7C3JN45HIJpwY+wZCX5bk=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3294.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2021 09:16:03.3223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: cad0464e-acf8-49ba-8478-08d8b47f301f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TmqgG6roqrCgkUlGsWGIDEx3Fn/6AWUQPnUoOEjYPVhx8KqrMCYlmz1inlQX3Jeoek2WdvG5l3ecmulvk6nTDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3198
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

On 1/9/21 1:25 AM, Randy MacLeod wrote:
> On 2021-01-06 1:55 p.m., Khem Raj wrote:
>> Anuj and Randy FYI
>>
>> On 1/6/21 7:16 AM, Andreas M=C3=BCller wrote:
>>> Compositor patch does not apply anymore and testing x86-64 excceeds my
>>> resources. Looked into Fedora sources: They build xfwm4 un-patched=20
>>> either.
>
> Thanks for the heads up Khem.
>
> Kai, can you take a look in the coming days/weeks?

OK. I'll try it next week.

Regards,
Kai


>
> ../Randy
>
>>>
>>> Release notes for 4.16.0
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>>> - common: Avoid zero refresh rate for monitor
>>> - hints: Protect against XError from XGetTransientFor()
>>> - netwm: Allow above/below only for regular windows
>>> - netwm: Mark splashscreen as transient for groups
>>> - client: Complete client state even on different workspaces
>>> - build: Increase GTK+ requirement to 3.22
>>> - Add `cycle_minimized` option
>>> - compositor: Release overlay window last
>>> - compositor: Free GLX data when really using GLX
>>> - compositor: Remove useless trace message
>>> - compositor: Release current GLX context on teardown
>>> - display: Remove custom XError handler
>>> - compositor: Check for XError when adding windows
>>> - compositor: Trap XErrors when disabling compositor
>>> - main: Enable compositor by default
>>> - compositor: Remove automatic redirect support
>>> - main: Add short command line options
>>> - main: Add debug command line option
>>> - pixmap: Use a safer strncpy()
>>> - settings: Fix compiler warning
>>> - Remove useless autotools macros and Makefile targets
>>> - Use --enable-debug=3Dyes when compiling from git
>>> - Revert "compositor: Do not damage on opaque region update"
>>> - themes: Use smaller, lighter shadows
>>> - compositor: Check if compositor is enabled
>>> - compositor: Avoid XError when disabling compositor
>>> - compositor: Warn for missing epoxy GL function
>>> - netwm: Do not raise window if activate is set to none
>>> - Remove GSourceFunc casts
>>> - compositor: Fix build with older epoxy versions
>>> - settings: Add 'Always on top' to the double click action
>>> - Settings: Remove default alphabetical sorting of keyboard shortcuts
>>> =C2=A0=C2=A0 Closes: #451 (Disable initial sorting of keyboard shortcu=
ts)
>>> - compositor: Handle XFixes XError
>>> - compositor: Add support for GL_ARB_sync
>>> - compositor: Return early if a Present swap is pending
>>> - debug: Fix build in debug mode
>>> - compositor: Fix compilation issue with Xpresent
>>> - compositor: Log fence and GLX swap time in debug mode
>>> - compositor: Move fence sync to redraw_glx
>>> - compositor: Move fence triggered to its own function
>>> - compositor: Set swap control if possible
>>> - compositor: Adjust to the actual number of buffers
>>> - compositor: Use a GLX drawable per buffer
>>> - client: Allow transients for group to be minimized
>>> - settings: Add a UI option for desktop zooming
>>> - themes: Remove title shadow
>>> - themes: Adjust shadows size/opacity
>>> - client: Make above/below consistent
>>> - compositor: Limit damage region to the screen
>>> - compositor: Optimize repaint without vblank
>>> - compositor: Only accumulate damage with multiple buffers
>>> - compositor: Copy entire content for GLX buffers
>>> - xsync: Handle XError
>>> - compositor: Ignore opaque region for shaded windows
>>> - compositor: Clip opaque region against window shape
>>> - client: Protect against XError in XKillClient()
>>> - compositor: Do not damage on opaque region update
>>> - compositor: Opaque region applies to client window
>>> - compositor: Reuse client size
>>> - client: Toggle tiling on key shortcut
>>> - client: Small cleanup
>>> - Add README.md to EXTRA_DIST
>>> - client: Keep tiled size of windows
>>> - compositor: No need to update compositor window on configure
>>> - compositor: Limit opaque region clipping to window extents
>>> - compositor: Damage on opaque region update only if visible
>>> - client: Send synthetic configure on force redraw
>>> - Post release tag bump
>>> - Translation Updates:
>>> =C2=A0=C2=A0 Albanian, Arabic, Armenian (Armenia), Basque, Belarusian,=
 Belarusian
>>> =C2=A0=C2=A0 (Tarask), Bengali, Bulgarian, Catalan, Chinese (China), C=
hinese=20
>>> (Hong
>>> =C2=A0=C2=A0 Kong), Chinese (Taiwan), Croatian, Czech, Danish, Dutch, =
Eastern
>>> =C2=A0=C2=A0 Armenian, English (Australia), English (Canada), English =
(United
>>> =C2=A0=C2=A0 Kingdom), Estonian, Finnish, French, Galician, Georgian, =
German,
>>> =C2=A0=C2=A0 Greek, Hebrew, Hungarian, Icelandic, Indonesian, Interlin=
gue,
>>> =C2=A0=C2=A0 Italian, Japanese, Kazakh, Korean, Latvian, Lithuanian, M=
alay,
>>> =C2=A0=C2=A0 Norwegian Bokm=C3=A5l, Norwegian Nynorsk, Occitan (post 1=
500), Persian
>>> =C2=A0=C2=A0 (Iran), Polish, Portuguese, Portuguese (Brazil), Romanian=
, Russian,
>>> =C2=A0=C2=A0 Serbian, Slovak, Slovenian, Spanish, Swedish, Thai, Turki=
sh,
>>> =C2=A0=C2=A0 Ukrainian, Urdu, Urdu (Pakistan), Uyghur
>>>
>>> Release notes for 4.15.3
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>>> [Please note that this is a development release.]
>>>
>>> - Quick release after 4.15.2 to fix a regression with opaque
>>> =C2=A0=C2=A0 regions leaving trails of unpainted areas on resize.
>>>
>>> Release notes for 4.15.2
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>>> [Please note this is a preview release of a development version]
>>>
>>> - Add support for opaque regions in the compositor
>>> - Make cursor zoom optional (xfce/xfwm4#439)
>>> - Remove the deprecated options "--daemon" (Pablo Mazzini)
>>> - Disable Xi2 support by default
>>> - Add column sorting in settings
>>> - Optimize window matching in the compositor with a hash table
>>> =C2=A0=C2=A0 (Michael Banack)
>>> - Add more XErrors traps
>>> - I18n: Updated translations: ar, ast, be, be@tarask, bg, bn, ca,
>>> =C2=A0=C2=A0 cs, da, de, el, en_AU, en_CA, en_GB, es, et, eu, fa_IR, f=
i, fr,
>>> =C2=A0=C2=A0 gl, he, hr, hu, hy_AM, hye, id, ie, is, it, ja, ka, kk, k=
o, lt,
>>> =C2=A0=C2=A0 lv, ms, nb, nl, nn, oc, pl, pt, pt_BR, ro, ru, sk, sl, sq=
, sr,
>>> =C2=A0=C2=A0 sv, th, tr, ug, uk, ur, ur_PK,
>>> =C2=A0=C2=A0 vi, zh_CN, zh_HK, zh_TW
>>> =C2=A0=C2=A0 New translations: be@tarask, fa_IR, hye, ka
>>>
>>> Release notes for 4.15.1
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>>> [Please note that this is a development release.]
>>>
>>> - Fix an error leak in compositor (xfce/xfwm4#351)
>>> - Fix compositor selection atom misuse
>>> - Prefer zero initialized memory allocation functions
>>> - Use g_slice allocator for compositor windows
>>>
>>> Release notes for 4.15.0
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>>> [Please note that this is a development release.]
>>>
>>> - First 4.15.x development release
>>> - Show tabwin only on primary monitor if set
>>> - All fixes and i18n as found in 4.14.4
>>>
>>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
>>> ---
>>> =C2=A0 ...r-Revert-to-GLX-as-default-vblank-me.patch | 92=20
>>> -------------------
>>> =C2=A0 .../{xfwm4_4.14.5.bb =3D> xfwm4_4.16.0.bb}=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0 |=C2=A0 5 +-
>>> =C2=A0 2 files changed, 2 insertions(+), 95 deletions(-)
>>> =C2=A0 delete mode 100644=20
>>> meta-xfce/recipes-xfce/xfwm4/files/0001-Revert-compositor-Revert-to-GL=
X-as-default-vblank-me.patch
>>> =C2=A0 rename meta-xfce/recipes-xfce/xfwm4/{xfwm4_4.14.5.bb =3D>=20
>>> xfwm4_4.16.0.bb} (82%)
>>>
>>> diff --git=20
>>> a/meta-xfce/recipes-xfce/xfwm4/files/0001-Revert-compositor-Revert-to-=
GLX-as-default-vblank-me.patch=20
>>> b/meta-xfce/recipes-xfce/xfwm4/files/0001-Revert-compositor-Revert-to-=
GLX-as-default-vblank-me.patch=20
>>>
>>> deleted file mode 100644
>>> index 04fd623e8..000000000
>>> ---=20
>>> a/meta-xfce/recipes-xfce/xfwm4/files/0001-Revert-compositor-Revert-to-=
GLX-as-default-vblank-me.patch
>>> +++ /dev/null
>>> @@ -1,92 +0,0 @@
>>> -From acdceb0b28d86199b8c2233880fa8a04cb24d4d4 Mon Sep 17 00:00:00 200=
1
>>> -From: Kai Kang <kai.kang@windriver.com>
>>> -Date: Wed, 24 Jul 2019 09:48:04 +0800
>>> -Subject: [PATCH] Revert "compositor: Revert to GLX as default=20
>>> vblank method
>>> - (again)"
>>> -
>>> -This reverts commit e07574d6e7a2dbaa08c3ba4765c6306073d9493e.
>>> -
>>> -It sets the default vblank method (auto) to GLX from 4.13.2. But it
>>> -fails to start xfwm4 on intel-x86-64 boards with error:
>>> -
>>> -| xfwm4:=20
>>> ../mesa-19.1.1/src/mesa/drivers/dri/i965/intel_mipmap_tree.c:1293:
>>> -| intel_miptree_match_image: Assertion `image->TexObject->Target =3D=
=3D=20
>>> mt->target' failed.
>>> -| Aborted
>>> -
>>> -There is also a RHEL defect:
>>> -https://bugzilla.redhat.com/show_bug.cgi?id=3D1678334
>>> -
>>> -Revert the commit to fix the issue.
>>> -
>>> -Upstream-Status: Inappropriate [workaround]
>>> -
>>> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
>>> ----
>>> - src/compositor.c | 41 +++++++++++++++++++----------------------
>>> - 1 file changed, 19 insertions(+), 22 deletions(-)
>>> -
>>> -diff --git a/src/compositor.c b/src/compositor.c
>>> -index 25615282..daced607 100644
>>> ---- a/src/compositor.c
>>> -+++ b/src/compositor.c
>>> -@@ -4483,13 +4483,28 @@ compositorManageScreen (ScreenInfo=20
>>> *screen_info)
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 XClearArea (display_info->dpy, screen_info->=
output, 0, 0, 0,=20
>>> 0, TRUE);
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 TRACE ("manual compositing enabled");
>>> -
>>> -+#ifdef HAVE_PRESENT_EXTENSION
>>> -+=C2=A0=C2=A0=C2=A0 screen_info->use_present =3D display_info->have_p=
resent &&
>>> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (screen_info->vblank_mode =3D=
=3D=20
>>> VBLANK_AUTO ||
>>> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 screen_info->vblank_mode =
=
=3D=3D=20
>>> VBLANK_XPRESENT);
>>> -+=C2=A0=C2=A0=C2=A0 if (screen_info->use_present)
>>> -+=C2=A0=C2=A0=C2=A0 {
>>> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 screen_info->present_pend=
ing =3D FALSE;
>>> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XPresentSelectInput (disp=
lay_info->dpy,
>>> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 screen_info->output,
>>> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PresentCompleteNotifyMask);
>>> -+=C2=A0=C2=A0=C2=A0 }
>>> -+#else /* HAVE_PRESENT_EXTENSION */
>>> -+=C2=A0=C2=A0=C2=A0 screen_info->use_present =3D FALSE;
>>> -+#endif /* HAVE_PRESENT_EXTENSION */
>>> -+
>>> - #ifdef HAVE_EPOXY
>>> --=C2=A0=C2=A0=C2=A0 screen_info->use_glx =3D (screen_info->vblank_mod=
e =3D=3D=20
>>> VBLANK_AUTO ||
>>> --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 screen_info->vblank_mode =3D=3D VBLANK_GLX);
>>> -+=C2=A0=C2=A0=C2=A0 screen_info->use_glx =3D !screen_info->use_presen=
t &&
>>> - #ifdef HAVE_XSYNC
>>> --=C2=A0=C2=A0=C2=A0 screen_info->use_glx &=3D display_info->have_xsyn=
c;
>>> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 display_info->have_xsync &&
>>> - #endif /* HAVE_XSYNC */
>>> --=20
>>> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 (screen_info->vblank_mode =3D=3D=20
>>> VBLANK_AUTO ||
>>> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 screen_info->vblank_mode =3D=3D VBLANK_GLX)=
;
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 if (screen_info->use_glx)
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 {
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 screen_info->glx_con=
text =3D None;
>>> -@@ -4503,24 +4518,6 @@ compositorManageScreen (ScreenInfo=20
>>> *screen_info)
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 screen_info->use_glx =3D FALSE;
>>> - #endif /* HAVE_EPOXY */
>>> -
>>> --#ifdef HAVE_PRESENT_EXTENSION
>>> --=C2=A0=C2=A0=C2=A0 screen_info->use_present =3D display_info->have_p=
resent &&
>>> --#ifdef HAVE_EPOXY
>>> --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !screen_info->use_glx &&
>>> --#endif /* HAVE_EPOXY */
>>> --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (screen_info->vblank_mode =3D=
=3D=20
>>> VBLANK_AUTO ||
>>> --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 screen_info->vblank_mode =
=
=3D=3D=20
>>> VBLANK_XPRESENT);
>>> --=C2=A0=C2=A0=C2=A0 if (screen_info->use_present)
>>> --=C2=A0=C2=A0=C2=A0 {
>>> --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 screen_info->present_pend=
ing =3D FALSE;
>>> --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XPresentSelectInput (disp=
lay_info->dpy,
>>> --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 screen_info->output,
>>> --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PresentCompleteNotifyMask);
>>> --=C2=A0=C2=A0=C2=A0 }
>>> --#else /* HAVE_PRESENT_EXTENSION */
>>> --=C2=A0=C2=A0=C2=A0 screen_info->use_present =3D FALSE;
>>> --#endif /* HAVE_PRESENT_EXTENSION */
>>> --=20
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 if (screen_info->use_present)
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 {
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g_info ("Compositor =
using XPresent for vsync");
>>> ---
>>> -2.20.1
>>> -
>>> diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.14.5.bb=20
>>> b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.16.0.bb
>>> similarity index 82%
>>> rename from meta-xfce/recipes-xfce/xfwm4/xfwm4_4.14.5.bb
>>> rename to meta-xfce/recipes-xfce/xfwm4/xfwm4_4.16.0.bb
>>> index f8febe804..3f64365f0 100644
>>> --- a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.14.5.bb
>>> +++ b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.16.0.bb
>>> @@ -2,14 +2,13 @@ DESCRIPTION =3D "Xfce4 Window Manager"
>>> =C2=A0 SECTION =3D "x11/wm"
>>> =C2=A0 LICENSE =3D "GPLv2"
>>> =C2=A0 LIC_FILES_CHKSUM =3D=20
>>> "file://COPYING;md5=3Dd791728a073bc009b4ffaf00b7599855"
>>> -DEPENDS =3D "virtual/libx11 libxfce4ui libwnck3 libxinerama exo-nativ=
e"
>>> +DEPENDS =3D "virtual/libx11 libxfce4ui libwnck3 libxinerama"
>>> =C2=A0 =C2=A0 inherit xfce update-alternatives features_check
>>> =C2=A0 =C2=A0 REQUIRED_DISTRO_FEATURES =3D "x11"
>>> =C2=A0 -SRC_URI +=3D=20
>>> "file://0001-Revert-compositor-Revert-to-GLX-as-default-vblank-me.patc=
h"=20
>>>
>>> -SRC_URI[sha256sum] =3D=20
>>> "d7a7c63fa42ec6d7cb3caab130d6f496be5bd7689b775d20e8786b7f3e282930"
>>> +SRC_URI[sha256sum] =3D=20
>>> "1e22eae1bbb66cebfd1753b0a5606e76ecbf6b09ce4cdfd732d093c936f1feb3"
>>> =C2=A0 =C2=A0 PACKAGECONFIG ?=3D " \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES',=
 'opengl', 'epoxy', '',=20
>>> d)} \
>>>
>>>
>>>
>>>=20
>>>
>

--=20
Kai Kang
Wind River Linux


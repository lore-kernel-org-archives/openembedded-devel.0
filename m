Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A41DC36010
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 11:04:03 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.139])
 by mx.groups.io with SMTP id smtpd.web10.8824.1743764639435422930
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Apr 2025 04:04:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=fLsfMUUa;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.247.139, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dG8T9wFvmeCCQj7TmMHGO8WjE3vWBP84bzmcRx7igqbmPSw52oXqYPtdJ+ev3SbqazBNfn75NuBDgEHX4WCEEH7hLpznyTFncLuSldi2DNo8CuuZJpOCU0d9c0ay8v5ckkKNsqFYz21Dq8DIYvFlymZAE3Ohv51gAfjxXVw1nu1JMXpGmRuT8nRvqqlWXCx0mmwzt9mp8VynaPTJs7HybnwxVL2mrPyVQguoPsWUglzeo107bDmeyggMyzBdVLjomsPA0+T1fJhrVCSMEwcC3x6mZLu8RNKlpnL6Q+Em/1J7xGAjEJBnZsHgABoFoui7Cuh7g/jL+CWylyCQU+JNZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZQ5a6xmxUi1DX4uYF/uKbHQmIMwAVCppkNaxHqsn9q4=;
 b=X3T8S6LXW68NkUEIa3XCKGUmAQ2QXmm1IF1yiqlC1CBYgMKBiQ3spqHRBkwk89wcQTZXj1RlFsOtU3p+TJwg9JXcVC0CtL/efAkWuFfe4syd/Wg621ViTdt6+tKFDhG5gd1+dyIVqoVTN97h738Hc4+/zeLD0sx5De8OCo5VwEUqs38t93KIc4aw5Q8OipoNa0m1Z2FCf027E3wWalerkEnVvohC76BeziqiU4cYjzd3p2IWOL2hi+DKJXuynxW5uURdENZhfyRJ15h+rVGx9heiEQCaxCq5+k34sm26EV/H/uJThbN2dgwpFftZ0zgzwlGVBct5xfNajshzZ/XfWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZQ5a6xmxUi1DX4uYF/uKbHQmIMwAVCppkNaxHqsn9q4=;
 b=fLsfMUUaHrUWI+eqzxYNLh2ZrrqkQTBduYVDPuTWFVyYvPlDu4OkyyxNMZS8Wc8XtcSp9KkkM8UXSvBn4aBFvparlU8wyF/8NeDuNYYhtVJubDT6MeoCt5s28OQZr7Ay0gzPSPDIJ88UwmY40sO2h3n+N5MJIu5yYmdV8jB6XmJ7IPAxlWrP2pzDT+QygKgAF9o/EcPmc4OQ86xcz9NvrQE58UzIrArwmJBLWVEbDdzFuw4LHAC9zw2iw6B/+OYo/moNv1hHUamRLNvLv44oACqvAMTeCgnKrdnPquOicGRyz9KEIm0+FJOOAZ3qP6IBO2FARC6JeHfCPS+cMORMCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PA4PR06MB7184.eurprd06.prod.outlook.com (2603:10a6:102:fc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.42; Fri, 4 Apr
 2025 11:03:56 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%3]) with mapi id 15.20.8534.048; Fri, 4 Apr 2025
 11:03:55 +0000
Message-ID: <2f4d9589-51aa-4ec4-b31f-76af3e7aae68@vaisala.com>
Date: Fri, 4 Apr 2025 14:03:53 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH 2/2] sdbus-c++: Support using alternative
 runtime D-Bus
To: Khem Raj <raj.khem@gmail.com>
CC: openembedded-devel@lists.openembedded.org
References: <20250402112901.3804235-1-niko.mauno@vaisala.com>
 <20250402112901.3804235-2-niko.mauno@vaisala.com>
 <f6b6ca1f-8792-4f99-84cf-bf6f82631576@gmail.com>
 <64506919-9b47-4e4b-84bb-e0877a5e9938@vaisala.com>
 <CAMKF1so2jcMx7=ASs4css6dr-U=FbYf2PxjDMRYtq_G0By4=Fw@mail.gmail.com>
Content-Language: en-US
From: Niko Mauno <niko.mauno@vaisala.com>
In-Reply-To: <CAMKF1so2jcMx7=ASs4css6dr-U=FbYf2PxjDMRYtq_G0By4=Fw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: GV3P280CA0010.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:b::11) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PA4PR06MB7184:EE_
X-MS-Office365-Filtering-Correlation-Id: cef5a78f-fb8c-463b-b39d-08dd7368645c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|4022899009|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?wFbpql0NI5JtyIQeJm4+5wrSNgabUv9QnK/xciLIh2HNfhHdm1yw/oLSDSli?=
 =?us-ascii?Q?LUuehFVkVSbehVlh/GiELy+uTWSWKGRPM1RBDNnHWhs4vN47xL5CXylH+SJ/?=
 =?us-ascii?Q?AcT7BqV+wwEB0Tgldx4l3UApvioc/7r++LGVPqqwASKs0abiigrdd7hcQfyO?=
 =?us-ascii?Q?QBh7FVP+qXvO43iEME7eHBSsVyqTqIV6geTFtV2QdfFO3HZ2NMAQ4EyHFvjA?=
 =?us-ascii?Q?5+mSUOwefpoX7WFKGVmhrBuYUK8jtl1GAMVdn+vel2FBuQ3w9+Kj4W+LlRRd?=
 =?us-ascii?Q?B4noqN07B9FEYY0s70SqLwzMmsdnifWOth1odLk68FhkfdoQSsMn1Xn95Kp/?=
 =?us-ascii?Q?BdwdKUttCw+6TFhHQOeofjhpEOg/dAm5zqqeUthayHMuPO+io8CMps1bgvNA?=
 =?us-ascii?Q?kvYShIIjtbl0+XwTOlh5jPoC5qxJDqn6pB1KrYxyn+fw/vN0SFWlt4PILHag?=
 =?us-ascii?Q?qU6sBj5moAna8H/LDxV8FanepgCW+9hvbekPFY/Zi44rRlW5cZCeTXOoP1bW?=
 =?us-ascii?Q?mPYlwt/WeoFyEtgz+wUrl/864cyLQBt2v3rTgJTKJOWgSymXqk0a58+QHK1x?=
 =?us-ascii?Q?cs+tPsmjxF8gbd+6El0XCFnj5aiADQ2/hBU92od8UfXOtdJ2MCsdATLuqMgq?=
 =?us-ascii?Q?hUT33EO9Z7Ihpdaj/gEHx2GA7Xw20nfdRiNoATmEXdi34ChI2ltVumZgyTaD?=
 =?us-ascii?Q?Oqz4MJHs9/ZgZmMvds+zzVBWet1tDxixKnVEx9Da9SLB7HIIR35qqWfJ7a5/?=
 =?us-ascii?Q?t6svXOHHJTWnRkjnT9a7p/QYczjTM53lKlsK71K5n72+DREMpftFwQT5gCdM?=
 =?us-ascii?Q?R35/T5A+prwevqALV/WQtpX9VNauq9ZiHhEsGl2jPEdnyM7cgyG9TcXYrpYA?=
 =?us-ascii?Q?EQ4BOgN1mbHq75W0MURw8zU5IAXE3pIz5HgvFQNmPMwjEBNykJrVYPNM+v/t?=
 =?us-ascii?Q?fT5nsvbdVy6iMrUSgVQ1D4qDo65L3r6IyHP7o9yxKGwMz+VeQpf91urh6DM9?=
 =?us-ascii?Q?/m53lGQ30qUjE0Z2xNaWKgXhvtKsTQ35899MToYyL9SVqgEaa+4l2w2B4OTY?=
 =?us-ascii?Q?4smXhnyoVpucsEr0Fa6YUv1aGYnKkYETKCKE/BgA6Ure/NqmM6YwjlDg46i9?=
 =?us-ascii?Q?kg9vCsxXK1aYD/lnA5ZTU3idBZzLh7NU/RqnLjcE9CgCcL+J4wDdfiK3/KGB?=
 =?us-ascii?Q?hckJ6UEf+TS4op49xPy8bpJZQcu/tfU4b7zy5skhgjX7dAJ7r1ChQchlT3De?=
 =?us-ascii?Q?V6RF9oyW5rVNRtJEe2OEJpN8YFOxCNWmuEFOeLYn5N6K4XgT/QUtPNqcrXXM?=
 =?us-ascii?Q?Lo1n61kxznu8BgapQehKtPPZ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(4022899009)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NQcvAH+9Y8W/3bJGIJCPXW6higzXi2NqmEERlViS7uvJhiuKS2HFsrKK4eew?=
 =?us-ascii?Q?hv/Iomq/AnVyqdjEEzuClX8QaZ1v7f73mDzt/IHZLy2V9moaCVvY8cuzWJiN?=
 =?us-ascii?Q?3v/of+V5mhHLbPvbO6NSWtBZ1Db4tt1RjGeP0+ouzClImkyFjAFgiuuGh2I9?=
 =?us-ascii?Q?aL+oey1i43iRU+d1ofuJGiklZsfN/Tm03a0pk/tMHmqUv6o6mOBB63lnE1fi?=
 =?us-ascii?Q?GOGBCLeSVtJIcFf+Z/bVo28UKFO1bqrsFrawXIdJFf5Nv3xkzZL+8PvsbEGW?=
 =?us-ascii?Q?ODXLXN+g7pvLt4FMahSrqO9QBZDOZVkw3zeCLYYA1QJXIDcIyGlKFDF2hU7M?=
 =?us-ascii?Q?AMng5hi4wSc5RvGnESTbt1iayuXZ//SWqQUhn1CyoWDnAjpnRitsgAv6Bp1Z?=
 =?us-ascii?Q?NMhZWS9yWEjTMASQDr/yelbgW1RCUUqs/eb9+dbRwbxyMu/3MAl14XTSbtmr?=
 =?us-ascii?Q?Xx9rPoF6XIo9E/8Cabv+tN2EHqOgZyFd2jI7BJ8XmOCEA8JY/5jex7QAmJW9?=
 =?us-ascii?Q?yGbYnN6MaOK3k+g7/hHnbzu95TX9/JYXXMewMDcJdaA8E2K+ABpoK1bFMfRn?=
 =?us-ascii?Q?TVCw/iO+rFIVU+FuSGweYyWnPXDRTqtfVHc+D2pfirOORbh28k2ebZS/tDDq?=
 =?us-ascii?Q?/vydPhdKzIOdEHlogkcK7e2TMaYB7JlNQ4zVARbK9pSryvjvwotHZi9A6RZU?=
 =?us-ascii?Q?lu8yUN3LgDFHvdSb7ncMdH6f12gg6Wc3QWLcbMDSuWoO3AGCtosSHb4sQC6j?=
 =?us-ascii?Q?SfY1YdqlB3Rs3gSLmquvciQlgbh8r9UvZTSgv/yZOq4xnd+5pKigsk5/u3/n?=
 =?us-ascii?Q?0M28fkyqwQKBBgE1VHnjTPCTmsdrDVhLhH9qkWYYKR1nVwJfUbV4iwB78yRp?=
 =?us-ascii?Q?6Vh+Zkf++9KzWUsBXSV6ZVtD5rKALA/cxHnahx0vHJu3m8cAU0is5j1kHSV6?=
 =?us-ascii?Q?yVU334VrUO1uGkOahbBbNTrAI8+XY3UMqMw56IxkpWnTe0+0Djyz6zLRtCCu?=
 =?us-ascii?Q?dgSXMmb6ILQ7b32ZCvQru5mIHI4f9NrUGv/E+zNQTKBgwpqftI8hOX/GmuVt?=
 =?us-ascii?Q?1efjd8wY1945GEmyIIUt5LYQn0bjPFiYmpvGuoEywYCFC/IJMvVluDYiHUcG?=
 =?us-ascii?Q?J6dYBLFcz5TZY8Ga59ne1dWuYPFzrAbMlhJnKKx5WFDE7dUs84Bsoot6XVo8?=
 =?us-ascii?Q?+nEjWTi4T2PevYjGrexbnkXZ1SypkxCLpnL9OSiU+4pfpJ2dABe9Xlbn1hGG?=
 =?us-ascii?Q?agfDtqWaRk1gXQVP8KZGH9BaMkzUINTDIplTe1sQTj+TBcQRYUwRCir6AYv3?=
 =?us-ascii?Q?MvsBiYAxurHhf7PNevFkTo3g3ySsxl6hGOChhM6TPEvuzmEcmJBahRU3sGSv?=
 =?us-ascii?Q?Z0tstsq1RAJP9cKv4hhKuz6kdHoQdveWdOFBObZiuZsSvZ+L8peML+v9REEi?=
 =?us-ascii?Q?s2gXGGJinl7SfYGaG8qFZqWgDOYQ/FoHtkZsad8eE449J0/fP3vYk6XgCmqV?=
 =?us-ascii?Q?z4Ohqra431rbc5jju0PsLf7D1GxpDTRewsbXsg6tz78nCJojdH2ui8UCd5bk?=
 =?us-ascii?Q?/EpNzFSjF7CbdOQ4KJZAnv0rMnLtdHvzmLeFm14ojS7/DaDKDQD75eQVw4bN?=
 =?us-ascii?Q?Vg=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cef5a78f-fb8c-463b-b39d-08dd7368645c
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 11:03:55.5659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Io86zG4DvQq/scXNCuIj13xHQtO7YhHwTpUlo8Uxi/XHGkSV+A+1rzkR9sRHNetFwcJXvlcIKBLIoD0PNQPIwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR06MB7184
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Apr 2025 11:04:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116584



On 4/4/25 12:04, Khem Raj wrote:
> On Fri, Apr 4, 2025 at 1:21=E2=80=AFAM Niko Mauno <niko.mauno@vaisala.com=
> wrote:
>>
>> On 4/2/25 17:27, Khem Raj wrote:
>>> On 4/2/25 4:29 AM, Niko Mauno via lists.openembedded.org wrote:
>>>> In order to facilitate using e.g. dbus-broker as runtime D-Bus
>>>> implementation, change the Freedesktop.org specific D-Bus runtime
>>>> dependency declaration to honor oe-core's new VIRTUAL-RUNTIME_dbus
>>>> variable.
>>>>
>>>> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
>>>> ---
>>>>    meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.0.0.bb | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.0.0.bb b/meta-
>>>> oe/recipes-core/sdbus-c++/sdbus-c++_2.0.0.bb
>>>> index 2b6bb1011a..a3e7c9ab54 100644
>>>> --- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.0.0.bb
>>>> +++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.0.0.bb
>>>> @@ -46,6 +46,6 @@ do_install_ptest() {
>>>>    FILES:${PN}-ptest =3D+ "${sysconfdir}/dbus-1/system.d/"
>>>>    FILES:${PN}-dev +=3D "${bindir}/sdbus-c++-xml2cpp"
>>>> -RDEPENDS:${PN}-ptest +=3D "dbus"
>>>> +RDEPENDS:${PN}-ptest +=3D "${VIRTUAL-RUNTIME_dbus}"
>>>>    # It adds -isystem which is spurious, no idea where it gets it from
>>>>    CCACHE_DISABLE =3D "1"
>>>>
>>>
>>> Thanks for these patches, as I understand they depend upon the changes
>>> in flight for oe-core, so do me favor, consolidate all the patches
>>> needed in meta-openembedded layer into a single series and send it
>>> together and perhaps send a reminder once it gets merged into oe-core.
>>>
>>
>> Hi Khem,
>>
>> the last remaining patch related to implementation of the new
>> VIRTUAL-RUNTIME_dbus was integrated to poky master yesterday.
>>
>> The associated commits now in poky master branch are:
>> https://web.git.yoctoproject.org/poky/commit/?id=3D0ecae4c6333de30802cc4=
68d699289ddc65e7aad
>> ("default-providers: Add VIRTUAL-RUNTIME_dbus variable")
>> https://web.git.yoctoproject.org/poky/commit/?id=3Da39bb35ddf484fd8160dc=
2eb1fabb6a92b07ecf0
>> ("dbus: Allow using dbus-lib with alternative D-Bus")
>> https://web.git.yoctoproject.org/poky/commit/?id=3Dc4b1070d55fa69821c5a2=
74dbbcca9e23e016aa8
>> ("systemd: Support using alternative runtime D-Bus")
>> https://web.git.yoctoproject.org/poky/commit/?id=3D84bf6e7e430d1c61ff400=
b817530fd54b410a85c
>> ("glib: Support using alternative runtime D-Bus")
>> https://web.git.yoctoproject.org/poky/commit/?id=3D9286f1e4aaa4520bc75ea=
7764c5cbbbeb6a67d4b
>> ("recipes-connectivity: Drop dbus from RDEPENDS:${PN}")
>> https://web.git.yoctoproject.org/poky/commit/?id=3D340d9e28e1df2e0d4a8c3=
51c8742064268f8ad87
>> ("dbus-glib: Revise RDEPENDS:${PN}-tests assignment")
>> https://web.git.yoctoproject.org/poky/commit/?id=3D34b7b0f86de95451f00ef=
117459ec403770e3cad
>> ("packagegroup-core-x11: Drop dbus-x11 in REDEPENDS:${PN}-utils")
>> https://web.git.yoctoproject.org/poky/commit/?id=3D5dfca64b78375de279b6c=
e7c9bffcaa35db5dc17
>> ("dbus-glib: depend on dbus, not dbus-x11")
>>
>> As you requested, I have now submitted the related meta-oe changes in a
>> single v2 series:
>> https://patchwork.yoctoproject.org/project/oe/list/?series=3D33314
>=20
> Thank you.
>=20
>>
>> Please note that there are also two individual commits to different
>> meta-openembedded sublayers which I submitted on 2nd April and which are
>> also needed,
>> one is for meta-networking:
>> https://patchwork.yoctoproject.org/project/oe/patch/20250402075935.21659=
02-1-niko.mauno@vaisala.com/
>> and one for meta-xfce:
>> https://patchwork.yoctoproject.org/project/oe/patch/20250402075322.21621=
89-1-niko.mauno@vaisala.com/
>>
>=20
> Include every one needed in meta-openembedded in the pull. I will add
> it after we have settled down a bit on
> walnascar cur off.
>=20

Thank you, v3 series submitted:=20
https://patchwork.yoctoproject.org/project/oe/list/?series=3D33320
-Niko

>> BR, Niko
>>
>>
>>>>
>>>>
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>> Links: You receive all messages sent to this group.
>>>> View/Reply Online (#116523): https://lists.openembedded.org/g/
>>>> openembedded-devel/message/116523
>>>> Mute This Topic: https://lists.openembedded.org/mt/112044576/1997914
>>>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub
>>>> [raj.khem@gmail.com]
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>
>>



Received: from NAM04-MW2-obe.outbound.protection.outlook.com (NAM04-MW2-obe.outbound.protection.outlook.com [40.107.101.45])
 by mx.groups.io with SMTP id smtpd.web11.9881.1620721211152829054
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 May 2021 01:20:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=W5BSFIQm;
 spf=pass (domain: windriver.com, ip: 40.107.101.45, mailfrom: changqing.li@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GLonfuOi+/ghbgKWMp9KJS9AIOMsYcDgYOkCX7XSk4BYRkYDqHhVwOOgN0BdekCo8iFizvUujpLvrHhEIds7uGrEXlgbuSzzwcLe3AwSDKRcdOQnNtlNQhJcSSFCAPLwjjLCKkt0xyAdyG4+Zj6vKOzJe1Su3O8ZrytMjTWlznYciAKFN9snA8OwCFeM+9OYWBpss0KfcVgbm2mzYOGXJFs7SwLECAmvicWWS69jyGVpr5se85Fy9FCeSafqLjBwu56+9p5P27SoITR7o0HZqBz35gFZ5gz3MAjdov6FhJfo3Znn53oWNF5ZQh5D1dwVnBT/1OilpDiMUcOn6yYptQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0RZQ13w4ibpS0mxSt1oQB5J3cP2FxMgvGQsmQRQRazU=;
 b=VW2r8shdABLCPx8cfiwBxViT0keqIHYiMRWyJHlgdQutI+G/epqwZx7Zfh7q0ygGmdCBGOpt+ukjeh7U/83swy094vlZFT/f6Dw4YvhqweYetqRmg8Q/qhgev8mpBaLU3kS6dVAYcCSv87Zy6w0eEmVLB/2AGDl4BqkGMGDq948oOqjUKdUo2vNK3KAoXq1mYYSyopV6BwlfBthMzi+9A8SkQ+1qXdaQhA6wj09WXUaNlX2qRkIIbviJia5oPvp7zxQIdrSZPx22gu/dphulsuANX1uHnF1Jy1xkFPBQ67huLZ8cfFOKybD4IquZPydYHrRPqMubwcwM8LhM2uu8jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0RZQ13w4ibpS0mxSt1oQB5J3cP2FxMgvGQsmQRQRazU=;
 b=W5BSFIQmmuosdF1M1ihIyosp0E7BFr3otY1GRz/9ZdDFpKfG3Ku+GoUJPqu/Sc5mbm4uh62UYtueelN2ECv3eA1MHr3mVNFayGFzzzg8rlZQJecPBgtHPCsnV/+6IyKD2j+FxrK2AiHT5aH5gN4p3XBj/7yfPK+/YocrsMgii90=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SA2PR11MB4906.namprd11.prod.outlook.com (2603:10b6:806:fa::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.24; Tue, 11 May
 2021 08:20:09 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::9d9a:d36a:4f67:486b]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::9d9a:d36a:4f67:486b%3]) with mapi id 15.20.4108.032; Tue, 11 May 2021
 08:20:09 +0000
Subject: Re: [oe] [PATCH] nmap: change shebang to python3
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20210511074724.2790-1-changqing.li@windriver.com>
 <6e1bad6721584e21b951b506a55d9427@XBOX03.axis.com>
From: "Changqing Li" <changqing.li@windriver.com>
Message-ID: <66861189-2915-f1da-09e0-57cc612d04e5@windriver.com>
Date: Tue, 11 May 2021 16:20:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <6e1bad6721584e21b951b506a55d9427@XBOX03.axis.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: SJ0PR03CA0109.namprd03.prod.outlook.com
 (2603:10b6:a03:333::24) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
Return-Path: changqing.li@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.189] (60.247.85.82) by SJ0PR03CA0109.namprd03.prod.outlook.com (2603:10b6:a03:333::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend Transport; Tue, 11 May 2021 08:20:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f9e2e3c-08d2-42ff-925b-08d914559719
X-MS-TrafficTypeDiagnostic: SA2PR11MB4906:
X-Microsoft-Antispam-PRVS: 
	<SA2PR11MB4906E514933196FF3316B96E82539@SA2PR11MB4906.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0ggPUDKpvAF/UIGvhcnq4tBMAQKw/WyJ7S84kpEK3zPE3EJ+kMNi7W++/ZE6s2lPCCKDp3a5DVrie6U3ndmE3l7bSk38dOdehKZuHsupOEiWVjwXJBUUuVYWY/X7tO2A6xJYY+F2rW/TD0h5EQ8/oIHHjR7B4TPw9Iv+cR8gwK+/5ztIFy2XhhBJN2bF/NGBCptpNFi3LcszorqsgPNByucN/WsFBeO1TKBFFYsAvXxNGPmccdLWlBKK+c359bdBUl9z3ikfmL96sBXxLoQB19ye9ZJj3bMVc2pEWXIiDiPsHgMl6GnOhSBJNVYjFN/uqp3N8AgyvWXOz2vAnByp4nPQZazaRX6ap8UIFrQT6BVEjdVRbfd0LzY+aIIB9IKDGZ1nk68/eIhFrPCPSD6cVlSxRj2XOmfyLsmdXCzsOIf8Nka4x82LcBpnHdMVmpawDymU+mVhh0unDds6CitlhbuwwFbUO3U8dDs/DwFP6x1Tjuvq9XJq7adEuSz0XbknQ9CvlvV1Jg54awseNes8Q4tat7fjVePn275nW/p7ffwnzCQ7JN+zdcaG6w6fH6CZ4xpfpYMyJ6jpLIdXhinGipBEGXBon9g9j4DqQ3V9IYrpxZxN+x3LSfpUtwOm1wd9g7tQIHxi+4MhRZ6Y9Nxwm4O0TFO6FiHlV1NCbdB7SbDa+nQkh0P7L8erE7ux+CXHB9LLh7w3P64Qe2/wEGePXmB8Py+x7FlR/F8mky4N5mEVRuUmgzC1B9hh0ssPSbk0
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(31686004)(26005)(44832011)(6486002)(5660300002)(66556008)(31696002)(8676002)(53546011)(83380400001)(86362001)(6706004)(2616005)(956004)(498600001)(6666004)(38350700002)(38100700002)(36756003)(2906002)(16576012)(52116002)(110136005)(66946007)(186003)(66476007)(16526019)(8936002)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?+0JztZXEb7P1TFpfAv6DsLz8JMMAGEfoe5WXgUfQ0bZn+ZpVFyTgyaDFr+pj?=
 =?us-ascii?Q?yahiE01YYWUMnYu+L4bI8RojUt0hPC4aHRIoobVMLyH3PfxwBYGCEpuNVnME?=
 =?us-ascii?Q?t3QznSigqOBUZZxI84ZT6fu7+9tdf942cReTuqHheIXVWdy4jvQsfAmJSyel?=
 =?us-ascii?Q?Pq14HqhhUeweSqwE2iV1Zi1TGBR7c7pmDL8fYXhBNF9fToKFHu/SPsKPbTtp?=
 =?us-ascii?Q?0tb90BWXj/GYtKl+Cp45U9x99hOglZFOuzAc6mQHsTrAlj0p9yXouvAKWEo4?=
 =?us-ascii?Q?ymddM3mE+pyd+LYBy7FMBTK10PmOTjeTXQsyro3F6jPu35b3l0/zqcZmpmCF?=
 =?us-ascii?Q?Q8gH9fKXt0CirS2Udiwyx7cJx32cMdcgLX/qvY9RAOlpPVqo1g01OW78Nqfn?=
 =?us-ascii?Q?npbxaZorRwiBf48F+DYkifRqae8RHFzS56UEFgHcAA3+nkbf+gOoPpryx4o7?=
 =?us-ascii?Q?EF15TXa953OLwRhbhlpgZEVA6Vc01fU+LGEixdNmcRp+VdPSqCtrZF0G2YiX?=
 =?us-ascii?Q?RTQ/wMsqef0ydefqeTgqZkJtLXXLNjON4lzTEgvZ0aNj4KYntJwpuzamq8AI?=
 =?us-ascii?Q?xxJ3cjuhdGa0pUEqw8KV3S5M5o1p4RsMNGtPTZ97Ukk5k9CqWa9COZ4owuqw?=
 =?us-ascii?Q?omAj3ki14/D+l3oEMOUPm7gtQqPk4ojAVoMR/mTnrQcVQrFoNjBLHSyjZwBo?=
 =?us-ascii?Q?bMjaej8fHgoRWXK34I7EFkwPAiYeg+WYpWhLLZUbPdmIftfomYOkOoK9gr2C?=
 =?us-ascii?Q?GDA/Se3u5x2oLEyEKedubMUz6atX9v9Cm2/NGheksSlByOOgE4DDNxZXUK16?=
 =?us-ascii?Q?2cSG14sSFyiGuiNb6Dzccqlj5E2r6aAjexofVSj449P7gFV/Xze7LkSNtXvU?=
 =?us-ascii?Q?gxS7Jzv2Zkw2bdXsySHKMOGjo/H27vmknFh/QFGPuZWGPqje2gon1SuqO/XQ?=
 =?us-ascii?Q?UjR2AZ9RxDUpp3DipMHOnOWOcspDGncP/xvMwrQwSst9o92t4kY9oNCTFRDa?=
 =?us-ascii?Q?fjRbp5z+/6pCEw5WZQu901B3HAxuedTdqboGj2IqkZ7kJK9oMpn328/h7uVx?=
 =?us-ascii?Q?1EgOSapdRJJv2ef5f24ftjWV/yn2tFsch9Gb4T8XjVOjaRpCKIuiPP2SXoP2?=
 =?us-ascii?Q?7PteyydIeV+jOyiHCU8cXrGmT1n5fCIe+WvQXbPkDWSoaB+6Vaa9evoA4rSW?=
 =?us-ascii?Q?ECGODrAeG5d+Bksi1DyE+fDAgGVxqIffovt2BeNftVGvkleaXAUaYYUlevEz?=
 =?us-ascii?Q?CXckYc1KHPdXmNYwTXejwYwYuLsC077uFlvZbpi44NGBkIWccbFICfOJ1OP9?=
 =?us-ascii?Q?bMoiA0woVwOpfbBQIBg3pB8c?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f9e2e3c-08d2-42ff-925b-08d914559719
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2021 08:20:09.0536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RMbsT/El/JgfO/XaeLhWYLDXFWFhZpLAo4MModYCqzypQqSUGOUZyrucHWD/NpVtqVwBoJ8CckEsW008rwHsixBrduGfxn4ra0N1VWjXUfk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4906
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US


On 5/11/21 4:09 PM, Peter Kjellerstedt wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
>> -----Original Message-----
>> From: openembedded-devel@lists.openembedded.org <openembedded-
>> devel@lists.openembedded.org> On Behalf Of Changqing Li
>> Sent: den 11 maj 2021 09:47
>> To: openembedded-devel@lists.openembedded.org
>> Subject: [oe] [PATCH] nmap: change shebang to python3
>>
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> upstream nmap is python2 compatiable now, but this recipe
>> support python3.
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   meta-oe/recipes-security/nmap/nmap_7.80.bb | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/meta-oe/recipes-security/nmap/nmap_7.80.bb b/meta-oe/recipe=
s-
>> security/nmap/nmap_7.80.bb
>> index c76d2324e..ad5e7248e 100644
>> --- a/meta-oe/recipes-security/nmap/nmap_7.80.bb
>> +++ b/meta-oe/recipes-security/nmap/nmap_7.80.bb
>> @@ -53,6 +53,9 @@ do_install_append() {
>>       if [ -f "${D}${bindir}/ndiff" ]; then
>>          sed -i 's@^#!.*$@#!/usr/bin/env python3@g'   ${D}${bindir}/ndif=
f
>>       fi
>> +    if [ -f "${D}${bindir}/uninstall_ndiff" ]; then
>> +       sed -i 's@^#!.*$@#!/usr/bin/env python3@g' ${D}${bindir}/uninsta=
ll_ndiff
>> +    fi
> This can be simplified to:
>
>        for cmd in ndiff uninstall_ndiff; do
>          if [ -f "${D}${bindir}/$cmd" ]; then
>             sed -i 's@^#!.*$@#!/usr/bin/env python3@g' ${D}${bindir}/$cmd
>          fi
>        done
Thanks.=C2=A0 Have sent a V2 patch
>
>>   }
>>
>>   FILES_${PN} +=3D "${PYTHON_SITEPACKAGES_DIR} ${datadir}/ncat"
>> --
>> 2.17.1
> //Peter
>

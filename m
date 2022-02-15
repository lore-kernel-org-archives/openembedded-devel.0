Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77673C433F5
	for <webhook@archiver.kernel.org>; Tue, 15 Feb 2022 23:26:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.4883.1644967599551494987
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Feb 2022 15:26:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=nMLDmj4g;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=9045c7428a=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 21FNC5ZU009810
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Feb 2022 15:26:38 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=content-type :
 message-id : date : subject : to : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=PKzDXPPrdqwcbelWWw7urtFndgitf/Oyrsx1BHVRfy8=;
 b=nMLDmj4giTM+edLHXzLD2pg/wV1Z3fOe12Giukw5n5gi03vZhp03QaEBI7C695+yO2NL
 4Frx98YgkMmXINNLym0Nva+QF2WLmJwWFocZSE8r0V2gKxSNzc0OAQDmCjI5BIPRz+Zx
 xvdwEOUbOpr/d+myL7+hZy6ikgVwOzzf2CLLBPhsKyTYT+9aVFZNGVa+0D0/BGZj6Nlg
 UeSFr+KD2MF14CPJmeAOM8jsqluAPG8Z2YEODA2eilKvedMmsm3YGNgnsoD2143K298Z
 nae9pu7LzSMtRCoCgKyIKDeCvQp04XVX8xFNXeQT60mOBUxkjGQ+XBRbL/RxK42Lu8hF IA==
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2044.outbound.protection.outlook.com [104.47.51.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3e8n1x0128-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Feb 2022 15:26:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FkmJk6lrbS5eysKEKq7MZGhoXgg/9s+z5oT6TvU6GQTrMBnLoXI2lMEqIiQslrzI2XRzQxpzUbVB6Yw9HbnwsR33q8Pry7QhhjHmzz204yq1LBa0xh9YW3XK4XAkd5TrD8UC2GtFrx1MFoHvagoUBx3BOO4jdnX+gZQ3GMsg/XltWjMB2+Vw/2yDBynUFqLUR7BPnpZy5vv26j85AC5xHCOunbgWE6LQr2S36JKKT8UP3OWAEFABni8aG1qhYr9dil8GgsiAd6FGpbPnfj2IWnMtLN88qjiGQCaNHMwDykf6gldLrs0RmylRXyTFO4QtvxWfYu6W+DOOHvZjf76kEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PKzDXPPrdqwcbelWWw7urtFndgitf/Oyrsx1BHVRfy8=;
 b=UQQSgIE7z/UHAdesVTDERJr3ODMcArHbeV9Iy3Nb32HGhZ2uCapTrD8AjQlw1ouAX0IlvHnYiQHFt9TtnSr55P6Ojne1qwS3M0cshg2PWSwTtSYN8fW/RBBgZVrngCxO+FL2G4VY7vw4Yp/yQ1EcMam0kLEXRzf3UhkdvcNeAsQOxD/k0A1VjOPn1ixbGIXUEC6LySAWcVtIMSR7GRzuJtMrumC5knefJZWuTskKzIjfXJH/+w8C7zkh+o9oGiYXF7Bu0PxUYA1aNrBYCmFifsdqr1gLh27AZWROTMXM6WhzvAz9GaHlKMrbXwDtgXW4hltsa1/ICUUd4AKPLyuQ/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by PH0PR11MB4935.namprd11.prod.outlook.com (2603:10b6:510:35::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Tue, 15 Feb
 2022 23:26:34 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::fca9:1fa9:6fdd:9dee]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::fca9:1fa9:6fdd:9dee%5]) with mapi id 15.20.4975.017; Tue, 15 Feb 2022
 23:26:34 +0000
Content-Type: multipart/alternative;
 boundary="------------O7hDcdlLsARbXHRXhbJRgSmT"
Message-ID: <ecc34edf-da13-66e7-54d1-acf2e5d75408@windriver.com>
Date: Tue, 15 Feb 2022 18:26:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [oe] [meta-oe][PATCH] plymouth: Add the retain-splash option
Content-Language: en-CA
To: "Yu, Mingli" <mingli.yu@windriver.com>,
        openembedded-devel@lists.openembedded.org
References: <20220215091659.37326-1-mingli.yu@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20220215091659.37326-1-mingli.yu@windriver.com>
X-ClientProxiedBy: BYAPR04CA0005.namprd04.prod.outlook.com
 (2603:10b6:a03:40::18) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c6ab3d3-a1b9-4cf5-c7c3-08d9f0da9aad
X-MS-TrafficTypeDiagnostic: PH0PR11MB4935:EE_
X-Microsoft-Antispam-PRVS: 
	<PH0PR11MB4935871924A598B2A4812905F8349@PH0PR11MB4935.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	M5NzQWuHGyKizihuDqkoAQKIUN42vaoWJsDMlXsf2xmlCLx/Nf1ruZmpXDdctJcP8k6I9NUL9Is1YEk8ASvTdWDdBbQ8KI8oXO5qAFg+rq/2FJkVwCLhNneWmo8ZMDX4ybx4I0hjzTbBmVsZxsLcx06lxzn3BVHFGXOGBRJd8SbCs6GIGGFS9UxSOqKFuzeaoINqEUgl5HdvKm0yIq7aUumsacbLdrKUddFXGU2fHpbsO8ofjTOCvv0KBZKZ+udESPxrjBe6sF5jWGwFRcHuSaIGV+8GaWKOZDR8aiXNxXtdG2w+Sf2q85n3Rt9NYT/tpMGMcKB4CT3O0S09ctlTthCHe/1wTMMbDvgWgg3A6K+Iyx3lFC7AdU272HCHHp1QYGJeiloiOZ+FSMppahxf4wWMaGWxjNnRmrcSQF+ue8G1HqzOTEPF3nOucd9wd7bp/ZADQO8bZIOagIcyWqDgY80P9LekCL47rTy6Up51Y1u28NMn7xtamltR2VpqsIlrmnXqGeRma3lF8BgYPof01g0NiJ0b16oXfyXxDmUQUj23iAMjOfgHmUZ9+lLQNQdK4wsf94uYQ0lXHdCGT0ayrFuyBBFI0oKxsT269fvImAAjS1KVh7GL5XIHTjp+d6yy241O1+ZQAqWnYB+gSlXb67a9K5yA3o8meaQ5rHwKpdKzPJOeIk0bibooh0/3aX0MvxRqrzOeu1nB59wHxQTxhL7pON58oXPsxgoyboBRehpRbgROsVMEi7UCJG5SViE1mndWZO0epLoiIaipKMXI+7sOh5g4DVGpeXImbmab3v8wMaKBMfa7fdGpX1nbe+KhP0ZpPGyKgcJyXncGF1I7l7iLflYnfZe/9R6NeQHUPrxgxxlUtQwBL0t7vkRIzzjfyttLSNNqz1AVHIe5wieZ/w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(166002)(6512007)(38100700002)(966005)(38350700002)(31686004)(186003)(36756003)(2906002)(5660300002)(8936002)(83380400001)(6506007)(33964004)(86362001)(52116002)(31696002)(53546011)(6666004)(66946007)(66476007)(66556008)(8676002)(2616005)(26005)(316002)(6486002)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YjV4YTRUQnFWZjZpSmdFVWtSamV1eUtRVUo4eGljZENISGd4VkdiM2RCaHh1?=
 =?utf-8?B?c3lSaXBTL0t5dWMrMCsyZEx3dFdwMWpERDZuMnB0b2JOVDBpSUpMK3QzOFRB?=
 =?utf-8?B?Uk9FUHphY0FIbVlkbHEyS2ZHaTE4ZHNUTEZuOVlKTTBpbWgvU3VtaW5hbHE3?=
 =?utf-8?B?ZUVmaFNLd0NzM1d5MUV3SkdHZ3ZrdHNIMlFXUWtFenhZdlRzc3d0YTJxQ2VU?=
 =?utf-8?B?QU9CUXNxK2VxODY2cFd1QXpqNUgvSm9WRmNucEZxOCsxRHNlQ1hGN1ZNMTZD?=
 =?utf-8?B?TlpJcWlLZENRbW95NVluZTdxMUkzczREZ1E3R0FGN2dwNUpXQnFlSHRiTEdj?=
 =?utf-8?B?RU5KVHNMNis1RXdHZks5d09xZ1hoS256NzJOZGRuZ3JjNWpodThld01INWpl?=
 =?utf-8?B?SFdCZWl1M2JyUWNJaHc1c0xvTm5LOE0vMjNGN0RNNUQ3ZkZURUdIWXVBMXpT?=
 =?utf-8?B?anJjdFZyd3dnOEV2TG5BbTZKbHoyejh6Z0ZMb1RkOGlBRUZrYWFpeXhSMFZn?=
 =?utf-8?B?dmxoNU9UWGNObnk5c2JTY2NuWisvOFNDTXNTTU9pQ1cyQ0RVcTYxQUJmZkFY?=
 =?utf-8?B?LythQmFVR3ZwNVRWaVZ0UEFJYk43Q2d2QVdrOCtPM0hUSllwSFk4ZGVXZnc0?=
 =?utf-8?B?cWxHWElEN3pDUENaK1pGejkvOENGQk1hQ3VMelB3SDdDWXRZOHNEd0YvWGdz?=
 =?utf-8?B?VG5Oa1FPUEFtR2RabFF4eEhlNkd5K1Vlek5Rb1FlSEh1MTFqNmY3OHh1QnFO?=
 =?utf-8?B?UEl0UjBMTXNxNEx6Zi9WN0RBV2k5Y2w2WER0QWhDZEpLZlUrdTFZcUpSbGxI?=
 =?utf-8?B?a1lVaXg0clFKVXBLOTVYL2MxejRpM2xWa3NVSzkyeC82NFJEcWFmVmVPYTNz?=
 =?utf-8?B?RHQzQitCV2FIRThKazdmLzV6TFFodHZNcVJZQVRmSDJvYVpsVlR1bkJLdFlh?=
 =?utf-8?B?NE5hbmJBT3JUYWl3TTlnTlBtMm15bHowdGNoRWlkV01VNHdVMzFRNHhFT3Ur?=
 =?utf-8?B?Q2pmdExBU2l6T1FQYU1Sbis0SVF0RDEwcUNPNktuUk8rbnZoVXhiSEhDbFRl?=
 =?utf-8?B?UEVTQm1sSFBvYzJET1FXQzEvMHJOSk81UlBMREc3WHFQYStmR2cxL3BONlpv?=
 =?utf-8?B?eXRPYnBxaUpuYnFDNXRZdk5jV1c1cFhjRTZ5NEZINTZtMFJDZDRaWTR2eG0z?=
 =?utf-8?B?SmVZdXkwYiswWlltQ0FwVnJJVndLSFlDWkV0aXFaOEwxQTZJOGNLbCtGRXdT?=
 =?utf-8?B?NWZ0cXp4Mkc0bTkydDRacDJYNzBJV1JSdjlPeWpxZlExUVY1UDRIVFQvY3pS?=
 =?utf-8?B?UTBQUjJKelVzQnNZdmp5QlBvbkVCdlMwb1c4RmhXUThjOS9OM01DNXVYT2g4?=
 =?utf-8?B?dHFOQStWME16VUJMQ0ZNUHJNODFWVkpNWnE2Nm5yYkR6bWhrYWJJSzFLOEor?=
 =?utf-8?B?Vk9hUzc1VVRvdmF5aFhiKzRoTmhtaVYvcU44U3BpZ3JWcHowOUg2bWtLelVF?=
 =?utf-8?B?V1BYQlVYK0NFcjlzVVZpSGhjbnlZYzFpUWk0Uk1XT2ZDN3prUnMyT0ZvR1B1?=
 =?utf-8?B?VVJzQnM1eERZRnMwTjhnNGhVakIzekhnczl3MTNxVERpZjQvTEx1M214K2Ft?=
 =?utf-8?B?WW5RTUh1MEtJWitaejBUbjdURk8wQVE1anZyU285V3lDeGkyeFdhd1lFdzNl?=
 =?utf-8?B?YVc2WjU5Q3JZMEVoRXlSbXUrTVdoZ1pYbUwzZUxxNEVnMUMrcUFScmExaWtY?=
 =?utf-8?B?ckNRWEtBSnU5dlVzbXY3QmtRbzVINWJLcW9veDVpZDFlQUFKWW9qUEJxM3Fm?=
 =?utf-8?B?Tm45ZHFuc1JIVUF1WGx2OUtsSDBEYjQ0ZEUyMUtnRE4xMUVOUjduQ1drYitQ?=
 =?utf-8?B?V1Y5akI2Wml5VGNNMW9Sck11WWRHbVNXdHB4RThBM3VlWGpLNVgwbThRQ0tY?=
 =?utf-8?B?eTBSMGhHaEZPNlR2RkVjbTlZRWJlYTZPNlZ3MUljd0ZMazBOVTcyQ2hjMmJt?=
 =?utf-8?B?d2VTM1NVTlFMalJlL2JySEhneHQyenNxYXU4dER6U0tNRVFnQTZpQ3hvTVUw?=
 =?utf-8?B?UDZoNWt4ZmIxOEVySjh2MlRiN2xJNnEyS0JZZHNmd1lXcjI2VlFQWWxHeDBm?=
 =?utf-8?B?UGxjUWlIZHlXZW9CblhPVlJmc2p1K0QrcmRJQTBXUDJkTDdzTnlyckZqYVBI?=
 =?utf-8?B?eGFDeFhwTk53bDVXS3B0Q0JRYkVENGFSUUs5ZGFJejFDUXR2OGRic3p3WlZS?=
 =?utf-8?B?aFFQUzFDNStWckZLL2svNG9aMm1nPT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1c6ab3d3-a1b9-4cf5-c7c3-08d9f0da9aad
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 23:26:34.4189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ihciVX4JX41uI2SMIyaqkLACkxhNxSgnZRM37vSMFPqdLy/qDxw8fkEjDEfiz+EyvkHhmjU2SB56IEn5SMmj9mGda+SDNsWpF6sMhWrHVw0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4935
X-Proofpoint-ORIG-GUID: gjxZPjls6hXjoE_3rgFNMqaV2iW7-tEp
X-Proofpoint-GUID: gjxZPjls6hXjoE_3rgFNMqaV2iW7-tEp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-15_07,2022-02-14_04,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 mlxscore=0 phishscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202150134
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Feb 2022 23:26:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95321

--------------O7hDcdlLsARbXHRXhbJRgSmT
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 21FNC5ZU009810

On 2022-02-15 04:16, Yu, Mingli wrote:
> From: Mingli Yu<mingli.yu@windriver.com>
>
> Adding the "retain-splash=E2=80=9D option to tell plymouth to keep the =
boot
> splash=E2=80=99s contents on screen even after plymouth exits to make t=
he
> splash screen show more friendly on the system which boots so fast.
>
> Signed-off-by: Mingli Yu<mingli.yu@windriver.com>
> ---
>   ...lymouth-Add-the-retain-splash-option.patch | 35 ++++++++++++++++++=
+
>   .../recipes-core/plymouth/plymouth_0.9.5.bb   |  1 +
>   2 files changed, 36 insertions(+)
>   create mode 100644 meta-oe/recipes-core/plymouth/files/0001-plymouth-=
Add-the-retain-splash-option.patch
>
> diff --git a/meta-oe/recipes-core/plymouth/files/0001-plymouth-Add-the-=
retain-splash-option.patch b/meta-oe/recipes-core/plymouth/files/0001-ply=
mouth-Add-the-retain-splash-option.patch
> new file mode 100644
> index 000000000..09876d781
> --- /dev/null
> +++ b/meta-oe/recipes-core/plymouth/files/0001-plymouth-Add-the-retain-=
splash-option.patch
> @@ -0,0 +1,35 @@
> +From f270f80d4c36a22a0f7b8de8fb6b1abef6f7b183 Mon Sep 17 00:00:00 2001
> +From: Mingli Yu<mingli.yu@windriver.com>
> +Date: Tue, 15 Feb 2022 16:23:10 +0800
> +Subject: [PATCH] plymouth : Add the retain-splash option
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Adding the "retain-splash=E2=80=9D option to tell plymouth to keep the=
 boot
> +splash=E2=80=99s contents on screen even after plymouth exits to make =
the
> +splash screen show more friendly on the system which boots so fast.
> +
> +Upstream-Status: Submitted [https://gitlab.freedesktop.org/plymouth/pl=
ymouth/-/merge_requests/157]


It was rejected upstream:

"this isn't right, plymouth-quit gets used for instance when switching=20
to a getty or something that isn't graphical. Normally the display=20
manager (e.g. GDM, or whatever) would |Conflicts=3Dplymouth-quit| so it=20
never gets run and then it would call |plymouth deactivate| and=20
|plymouth quit| on its own after its started the display"

I'm not sure what the alternative is...

../Randy

> +
> +Signed-off-by: Mingli Yu<mingli.yu@windriver.com>
> +---
> + systemd-units/plymouth-quit.service.in | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/systemd-units/plymouth-quit.service.in b/systemd-units/pl=
ymouth-quit.service.in
> +index ed9f9b9..147e9ee 100644
> +--- a/systemd-units/plymouth-quit.service.in
> ++++ b/systemd-units/plymouth-quit.service.in
> +@@ -3,7 +3,7 @@ Description=3DTerminate Plymouth Boot Screen
> + After=3Drc-local.service plymouth-start.service systemd-user-sessions=
.service
> +
> + [Service]
> +-ExecStart=3D-@PLYMOUTH_CLIENT_DIR@/plymouth quit
> ++ExecStart=3D-@PLYMOUTH_CLIENT_DIR@/plymouth quit --retain-splash
> + Type=3Doneshot
> + RemainAfterExit=3Dyes
> + TimeoutSec=3D20
> +--
> +2.17.1
> +
> diff --git a/meta-oe/recipes-core/plymouth/plymouth_0.9.5.bb b/meta-oe/=
recipes-core/plymouth/plymouth_0.9.5.bb
> index 8f9997e96..7d76ab76f 100644
> --- a/meta-oe/recipes-core/plymouth/plymouth_0.9.5.bb
> +++ b/meta-oe/recipes-core/plymouth/plymouth_0.9.5.bb
> @@ -22,6 +22,7 @@ SRC_URI =3D " \
>       file://0001-Make-full-path-to-systemd-tty-ask-password-agent-con.=
patch  \
>       file://0001-systemd-switch-to-KillMode-mixed.patch  \
>       file://0001-plymouth-start-service-in-add-related-kernel-paramet.=
patch  \
> +file://0001-plymouth-Add-the-retain-splash-option.patch  \
>           "
>  =20
>   SRC_URI[md5sum] =3D "8a25d23f3ae732af300a56fa33cacff2"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95315):https://lists.openembedded.org/g/openembedde=
d-devel/message/95315
> Mute This Topic:https://lists.openembedded.org/mt/89157208/3616765
> Group Owner:openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub  =
[randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------O7hDcdlLsARbXHRXhbJRgSmT
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 21FNC5ZU009810

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2022-02-15 04:16, Yu, Mingli wrote:=
<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:20220215091659.37326-1-mingli.y=
u@windriver.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">From: Mingli Yu <a class=3D"=
moz-txt-link-rfc2396E" href=3D"mailto:mingli.yu@windriver.com">&lt;mingli=
.yu@windriver.com&gt;</a>

Adding the &quot;retain-splash=E2=80=9D option to tell plymouth to keep t=
he boot
splash=E2=80=99s contents on screen even after plymouth exits to make the
splash screen show more friendly on the system which boots so fast.

Signed-off-by: Mingli Yu <a class=3D"moz-txt-link-rfc2396E" href=3D"mailt=
o:mingli.yu@windriver.com">&lt;mingli.yu@windriver.com&gt;</a>
---
 ...lymouth-Add-the-retain-splash-option.patch | 35 +++++++++++++++++++
 .../recipes-core/plymouth/plymouth_0.9.5.bb   |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-oe/recipes-core/plymouth/files/0001-plymouth-Add=
-the-retain-splash-option.patch

diff --git a/meta-oe/recipes-core/plymouth/files/0001-plymouth-Add-the-re=
tain-splash-option.patch b/meta-oe/recipes-core/plymouth/files/0001-plymo=
uth-Add-the-retain-splash-option.patch
new file mode 100644
index 000000000..09876d781
--- /dev/null
+++ b/meta-oe/recipes-core/plymouth/files/0001-plymouth-Add-the-retain-sp=
lash-option.patch
@@ -0,0 +1,35 @@
+From f270f80d4c36a22a0f7b8de8fb6b1abef6f7b183 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:mingli=
.yu@windriver.com">&lt;mingli.yu@windriver.com&gt;</a>
+Date: Tue, 15 Feb 2022 16:23:10 +0800
+Subject: [PATCH] plymouth : Add the retain-splash option
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Adding the &quot;retain-splash=E2=80=9D option to tell plymouth to keep =
the boot
+splash=E2=80=99s contents on screen even after plymouth exits to make th=
e
+splash screen show more friendly on the system which boots so fast.
+
+Upstream-Status: Submitted [<a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://gitlab.freedesktop.org/plymouth/plymouth/-/merge_requests/157">htt=
ps://gitlab.freedesktop.org/plymouth/plymouth/-/merge_requests/157</a>]</=
pre>
    </blockquote>
    <p><br>
    </p>
    <p>It was rejected upstream:<br>
    </p>
    <p>&quot;this isn't right, plymouth-quit gets used for instance when
      switching to a getty or something that isn't graphical. Normally
      the display manager (e.g. GDM, or whatever) would <code>Conflicts=3D=
plymouth-quit</code>
      so it never gets run and then it would call <code>plymouth
        deactivate</code> and <code>plymouth quit</code> on its own
      after its started the display&quot;</p>
    <p>I'm not sure what the alternative is...</p>
    <p>../Randy<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:20220215091659.37326-1-mingli.y=
u@windriver.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">
+
+Signed-off-by: Mingli Yu <a class=3D"moz-txt-link-rfc2396E" href=3D"mail=
to:mingli.yu@windriver.com">&lt;mingli.yu@windriver.com&gt;</a>
+---
+ systemd-units/plymouth-quit.service.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/systemd-units/plymouth-quit.service.in b/systemd-units/plym=
outh-quit.service.in
+index ed9f9b9..147e9ee 100644
+--- a/systemd-units/plymouth-quit.service.in
++++ b/systemd-units/plymouth-quit.service.in
+@@ -3,7 +3,7 @@ Description=3DTerminate Plymouth Boot Screen
+ After=3Drc-local.service plymouth-start.service systemd-user-sessions.s=
ervice
+=20
+ [Service]
+-ExecStart=3D-@PLYMOUTH_CLIENT_DIR@/plymouth quit
++ExecStart=3D-@PLYMOUTH_CLIENT_DIR@/plymouth quit --retain-splash
+ Type=3Doneshot
+ RemainAfterExit=3Dyes
+ TimeoutSec=3D20
+--=20
+2.17.1
+
diff --git a/meta-oe/recipes-core/plymouth/plymouth_0.9.5.bb b/meta-oe/re=
cipes-core/plymouth/plymouth_0.9.5.bb
index 8f9997e96..7d76ab76f 100644
--- a/meta-oe/recipes-core/plymouth/plymouth_0.9.5.bb
+++ b/meta-oe/recipes-core/plymouth/plymouth_0.9.5.bb
@@ -22,6 +22,7 @@ SRC_URI =3D &quot; \
     <a class=3D"moz-txt-link-freetext" href=3D"file://0001-Make-full-pat=
h-to-systemd-tty-ask-password-agent-con.patch">file://0001-Make-full-path=
-to-systemd-tty-ask-password-agent-con.patch</a> \
     <a class=3D"moz-txt-link-freetext" href=3D"file://0001-systemd-switc=
h-to-KillMode-mixed.patch">file://0001-systemd-switch-to-KillMode-mixed.p=
atch</a> \
     <a class=3D"moz-txt-link-freetext" href=3D"file://0001-plymouth-star=
t-service-in-add-related-kernel-paramet.patch">file://0001-plymouth-start=
-service-in-add-related-kernel-paramet.patch</a> \
+    <a class=3D"moz-txt-link-freetext" href=3D"file://0001-plymouth-Add-=
the-retain-splash-option.patch">file://0001-plymouth-Add-the-retain-splas=
h-option.patch</a> \
         &quot;
=20
 SRC_URI[md5sum] =3D &quot;8a25d23f3ae732af300a56fa33cacff2&quot;
</pre>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#95315): <a class=3D"moz-txt-link-freetext" href=3D"ht=
tps://lists.openembedded.org/g/openembedded-devel/message/95315">https://=
lists.openembedded.org/g/openembedded-devel/message/95315</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/89157208/3616765">https://lists.openembedded.org/mt/=
89157208/3616765</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.=
openembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/=
g/openembedded-devel/unsub</a> [<a class=3D"moz-txt-link-abbreviated" hre=
f=3D"mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------O7hDcdlLsARbXHRXhbJRgSmT--


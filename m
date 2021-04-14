Received: from NAM04-SN1-obe.outbound.protection.outlook.com (NAM04-SN1-obe.outbound.protection.outlook.com [40.107.70.51])
 by mx.groups.io with SMTP id smtpd.web09.7468.1618366865696422580
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Apr 2021 19:21:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=liHHtWIE;
 spf=pass (domain: windriver.com, ip: 40.107.70.51, mailfrom: kai.kang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MdeCuWuqQOeeUZlI8ydgsNDSdnFKch4gdUN5lEDFxrFVONZnSnY+fckQDnlF2apuTc0t1jsI61+LJ244Suo2Xd1szBThmoEsn4w0w1+n3t4va0cIW1+GUrZTKet5Cks0/G40m4cpxQnTYBti+bfK9hofY5RnpTLeJKrrWAR4eBu2+CVQFTK29Wub8brvyTRjdwD0f/xETVH4eO0AtRG79N+2D2Ay4OFJli/XviwoCpFamw+yBDACkxuU/43BY9N1bTGsmQBVXnl7REz5YISJXVr/FmE7sBREQ/Zsk+vdkbLA7Dl0veopm1FwKpXYJSu+0cO/mnDk/rp+cVOrMZX7YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3uABGwh3r5LcYLzv3zkKqA9aDjtfsSGiUpGGfBXEzeY=;
 b=oF4TsWYa5Wx2i2d0zBYSjdg9HQbOmqU42tgZTz0OdUr83ZVETILXL17kpxEG/SsfMswr9UK/tAbmQ9/pqp9cPbIOyMpEB+yvFdy0TjzCcM2NnR/49Ujb4wMb6dajOvp2iX65ovibAdFRlxJGJjJQXXo504/OuOzc3+Lz/vrIlC9TY2yaHenn2No0Q5dPnzo6Fok8BxVv0RXm2fJL90Hdiu5nbbyeVbAz2v9yb57FThB9v6ajD8ybDbpNoTmSZtKwCrJOh7vo9w1SXu0UqifGYYu1F/ziaFyaBjpt5un7lb2ykrJf6G7G/ZEd61cJ9fAgSM38Mp/U9MzUSxVH1YVwaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3uABGwh3r5LcYLzv3zkKqA9aDjtfsSGiUpGGfBXEzeY=;
 b=liHHtWIEyVaU8tztW5lLfMkoGyfSrj8t3O+yjPIvqDFfR7z5i+6qQX3i7dWaZ7sziVJACBGkoydejFq6lZYS39G9m0jCj6AC+QbxbI8wSpnzEieSh9s/D5YONshleYTkm6ds1kbOlYTqDYFok9Eqry1gllQ3RPOFVRbzSgl63XA=
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from CY4PR11MB1432.namprd11.prod.outlook.com (2603:10b6:910:5::22)
 by CY4PR1101MB2310.namprd11.prod.outlook.com (2603:10b6:910:1b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.20; Wed, 14 Apr
 2021 02:21:03 +0000
Received: from CY4PR11MB1432.namprd11.prod.outlook.com
 ([fe80::7943:e41c:5fd7:a130]) by CY4PR11MB1432.namprd11.prod.outlook.com
 ([fe80::7943:e41c:5fd7:a130%11]) with mapi id 15.20.4020.023; Wed, 14 Apr
 2021 02:21:03 +0000
Subject: Re: [meta-xfce][PATCH] core-image-minimal-xfce: Use graphical.target as default
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20210413061421.1201530-1-raj.khem@gmail.com>
From: "kai" <kai.kang@windriver.com>
Message-ID: <7e5b2f39-dbb1-6776-05f4-478d6878ba25@windriver.com>
Date: Wed, 14 Apr 2021 10:20:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210413061421.1201530-1-raj.khem@gmail.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: SJ0PR05CA0150.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::35) To CY4PR11MB1432.namprd11.prod.outlook.com
 (2603:10b6:910:5::22)
Return-Path: kai.kang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.141] (60.247.85.82) by SJ0PR05CA0150.namprd05.prod.outlook.com (2603:10b6:a03:33d::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.8 via Frontend Transport; Wed, 14 Apr 2021 02:21:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9bf8609-850c-46ca-45a9-08d8feebf37d
X-MS-TrafficTypeDiagnostic: CY4PR1101MB2310:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<CY4PR1101MB231065E4749EB5A05EF2FF4D954E9@CY4PR1101MB2310.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:972;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tQKXrxTyjCrJZWGTJFvuUA1h2xdT8OSZFX/5Ke9Svze9u4W3vFDHl0oF/cWI8zVPdEh3TFQlQvIXkgW/EVjuAHixNiBJQNDTU+PxYgTPHTL/k7njdcVJzsLr5hxf+TZ/HNhZuWCmmp/fsi8BLNwFOQParT6FrTIMVAwqyF/3ZuVXzrNZxTOirjyF8M1iDCrgb367necz8Oa1dukE7yldBlkDIzh4yNkFBLAG74ZFD/VaIBoNoMXVI/f0XF5Qfja5xkf+llbqsNotoO6Ull7Pf9Q//ESapZvbbb/OglYMh6CF4QozumCt5bNStWlGXdB5nIy8jFC8Iu0fgzBczBgD81PaQmw4/Cm3ic6Q8SeM2W6eoN+vFYF3qMnXZVSnYvAc64xPpSaPG4KFIoGk/HyaPW76Ugyd0k6avsgA+M7mX4cqkdpr6ssdhm+SU/hQwbi6/B9HJ0BwE3BSev4KfijOpO2Qj3+RwppVC+hHRrenuPQPsLgsMumxSnngsGK5w6gSf3R7p8HPH9lNRiVHSk6Q5jAq1hH/6H/FxfYKE2ulf3sssxihborhZewtY80ecJM2nvq713J6vaw8P4MGmsYupWPagUz1DOKIL+G0XMpRzahXHtNYrTtxhnlxk/HCG004biZunjFaDIzv2t89yf3juR+knwsyvW30maC2z7sC2yD4WTUJbed+MS94C8IF/z319myoiFA5Z+0gMzgS+jAVn4aisuIpPBnnzd6dmLIPk9w=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR11MB1432.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39850400004)(346002)(376002)(396003)(366004)(86362001)(66946007)(53546011)(52116002)(2616005)(16526019)(26005)(6666004)(31696002)(66476007)(8936002)(5660300002)(66556008)(8676002)(16576012)(2906002)(6706004)(31686004)(316002)(38100700002)(38350700002)(478600001)(186003)(6486002)(36756003)(4744005)(956004)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?MkcrOVVkRDJXcGFFMUpCNFF5KzF6WGpBb1BWRUJlMkNvQldJS09WeW0rQkNO?=
 =?utf-8?B?bDQ1cDN1T0REb1NCME05U0dBVmgrMUhjUklZRk9WaDlUazBtcE9MTGFBbGhF?=
 =?utf-8?B?SU41ak90ZGVNRUJSMFhYYW9vb0tRcDloQkxwRCswMnFjRHV0YXFvNnFweEQ5?=
 =?utf-8?B?WUFtWC9Ed29ya2EzSjVFVHF5VzhoTzV5bmhaVDNoMTJIVXZNdEhwR0h3MGJT?=
 =?utf-8?B?VzUrL3lBS0tIWmsrb2x1c3R0U3B1cGxBOW4yU0xNUExoYnl4M0FoVVpScnpJ?=
 =?utf-8?B?K1Y5VWZhOFNGaFF4MDZERXJuS2VMZzEweWtDWnlxKzlEZnNrMmRueWVjdTlX?=
 =?utf-8?B?QXcvWE1iUjJBU0xBUnBVTWdVL2ZCRUZiMnQrcGdvRkpEZ05vMkhxVVp1RWlP?=
 =?utf-8?B?U3QzZ216SHZtNjVDZVFRVnI3S3dIdWI2N3NCbW1mb0NxblNIc1ZrQm1xV2hN?=
 =?utf-8?B?eldkQXdrL1E2ZUFzbHlBK3Q3RHl5NHVoUkE1UktQaDA1YlN0bm1lMkNuRWQv?=
 =?utf-8?B?WGt4d0ptV0NtWG9IM2x3UUNPVXlkRVE4S3JGaXorN21YcDBxdG1kc1dBQTJl?=
 =?utf-8?B?WGZDZUtPUzhSS2N3Q3pkWWlCQmZLSld5WTU3MGViblZNeXQ1ckhlWVZCb2Ev?=
 =?utf-8?B?aHc3ekFuNm5YZm1QT1paQlBmUFFVdldZc0JDRjhwbmtMSGVyMEU2ZVNnSW55?=
 =?utf-8?B?U0ZnT1dYMENYc0oyVXh6dkNNcDlUTWFBdWJqS2dTblROVldXYlU3MzBYVHM3?=
 =?utf-8?B?NnBFSmZWK2tnRHdNVXBOZWE4aEtxbXVWaVVGR2pkNW92R25wUW5zWk9lbnVm?=
 =?utf-8?B?d25oenZRK1cwY2hUbCtROS80RXJWVTZvems1emJZby9iNTlKblUzL0JtZWZS?=
 =?utf-8?B?Tmo5UEdNWEs0S0Y5TE9MbERmR2lRTXBBWjgwcjNGbnRja25DNzIxQXpCbFJu?=
 =?utf-8?B?bEtrWXNDNjZ3c3FsbmJwcDlscHlDSGNlR0RsU05VeWdtdjhuZ0tSWk0xWnBv?=
 =?utf-8?B?bE82blUzc2o2UVZtVG5PejZRMGJDTjkvZFNEdHZ3aDllcUh2c2NrL2RGRVdD?=
 =?utf-8?B?ZzBlb215Q3ltRW1ka2FNakc4WDlqMnVvS2haOFdVSnlBRktmS2JUZ2w0RjY0?=
 =?utf-8?B?TUpYdlRIQU0xTWFtQk1RMHZLaUhxeUZTVmpmejM0VkMwWmtUY1hhY3Z6OE42?=
 =?utf-8?B?eG1SZFFkM0pJVDlieUZjNEQrT2ZoVzlha2pxR3Rla2NpQ0hRd0I3RWttSkpW?=
 =?utf-8?B?UVA4a05yM0RTL09QUHBXVzdKV093L2FFRGNlcG5uakZZV1NsVHBpQlF4NkZ4?=
 =?utf-8?B?Y3krckczVUcrVVNDZjlkL3hxdVpKaXlRcmtzZUJpWmUvdDRXaWwvaXRCcTZP?=
 =?utf-8?B?TDhNZVZUTHVMb1dMaHhBSUpKWDl2SFhQdVFGSm9JOHVHaXlhb05MNXFhZ1Q1?=
 =?utf-8?B?QWlTbHBKeDhjQldXSHpIMkJVazk5S2ZlSERyck9sOElYYzhoOE9pdjJCTDZP?=
 =?utf-8?B?RjhVRThqUWRXS3Z5SkF6dTJlVHpiYVRaVm51ZUVBLzVHM2tDQkZqUlozTkd4?=
 =?utf-8?B?YVRRRHA1b3QrTURLYlJaSDNUNjdVTXdUZ1JqeG4xQU9ZZFNtckhGem5Od2Vx?=
 =?utf-8?B?T016WmluMkpXLzJxUENSc29IaWNYMWpCYnhTa1dRVWpaQTR5SERkR01Da0F5?=
 =?utf-8?B?WllyWGNuenFCajBhQTFUREM0VGFqNDFGOWZuVE1RUzhRMmRhbmtmNW41cmps?=
 =?utf-8?Q?ui1/jkI81xUvSTG/EKdhDcn2fi5A37+vK8u//ne?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9bf8609-850c-46ca-45a9-08d8feebf37d
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB1432.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 02:21:03.1496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1C3Awe44RZ1YW6BgIZgic0HfTewnwLYMdSS/KDJ7TFL//Sg12dE9LSo6B82KGRzY44MmqmysVu849CYDJmQoQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2310
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 4/13/21 2:14 PM, Khem Raj wrote:
> This ensures that nodm unit is started during boot with systemd images
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Kai Kang <kai.kang@windriver.com>
> ---
>   meta-xfce/recipes-core/images/core-image-minimal-xfce.bb | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta-xfce/recipes-core/images/core-image-minimal-xfce.bb b/meta-xfce/recipes-core/images/core-image-minimal-xfce.bb
> index 8009acdd9f..9d997cf57c 100644
> --- a/meta-xfce/recipes-core/images/core-image-minimal-xfce.bb
> +++ b/meta-xfce/recipes-core/images/core-image-minimal-xfce.bb
> @@ -16,3 +16,5 @@ LICENSE = "MIT"
>   export IMAGE_BASENAME = "core-image-minimal-xfce"
>   
>   inherit core-image
> +
> +SYSTEMD_DEFAULT_TARGET = "graphical.target"

It works for me.

Acked-by: Kai Kang <kai.kang@windriver.com>

Regards,

-- 
Kai Kang
Wind River Linux


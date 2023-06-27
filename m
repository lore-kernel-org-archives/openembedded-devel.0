Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B73BEB64D9
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 22:21:23 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.70])
 by mx.groups.io with SMTP id smtpd.web11.2815.1687904479561794946
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jun 2023 15:21:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amd.com header.s=selector1 header.b=vo+7/Jcd;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.93.70, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dOa9jErhdC8/935fBfMWoL/2wyYJZi4HkwekZJZJErlR5JnQBFsaZbDzbykjt5sJscnIUnueYYD6WGB0CrF8hkOAfit7jXpncI+5luUwrBTbN8F1ewQLEhmeI3ACe8bPAHtDnCImjbpe/XkBsCEnfbLQZAUdKgP3VzUh2r2I/aFaKFChWIpkosIdaL+KyB5RPAHWPxVvM7JL89wtUvz3bYHkexzPxFljVCEwkaVrBp0qiswUWqQ8iBH75MJ7vkyZjgIQggor8CiCxIqdful3wy3kpua1/+lV1ELhhMhzx/fLUOddJS8F9Ml3qwXwyi/MuANlwt7x6MFRjZlaEhFoIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2YStEX9Q0Z92dQ/hLnQxXWIgyhg5F4TH5bsM/qzmmU0=;
 b=hRncnQVMxCfcjXPw3aTFZjq7+et9zIvpNwntIcwvmyyLSzbVCfGDWa76UgDijgMkq8H4z4sc6eXsMKSfaWeaS7j2b5eA1LZt327nROFGfquHU3SXmqzVCGxTIHSqxaHt6pSBx/fezVhZSZEu/77buUiP24Yr7/I6DJ4+gXBz1eDXrTZfMcPbgFNne0P2mAd91eTUE/G0FMmNpyHXtt7TRNXHVfokyVuzxGy4L0egyWTptwCme5nzp3N3bGqKKRydtzT9UQOIR1b7QcB7/Ox8fL5hw/sLLNaatAYNYrfcLMNgg6jTcSRP8+dfNU20STHjzvGjrbRbKf/6nG9dCX/c3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2YStEX9Q0Z92dQ/hLnQxXWIgyhg5F4TH5bsM/qzmmU0=;
 b=vo+7/JcdsceOEgDpTZECRVs/MnyBZrCH6r0ORPZZPyOABMFrkexhUMImaIzr9nC0kI7DzqAfUMD43QkHpnVkuEXrJQxr+hxO4SK0LY9oFrZRyDC/czFHSog/1vT6ZmsZ30blpGPINunAWAi8CKiFbCDmeDnOWyj2N57cfvSioIU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4367.namprd12.prod.outlook.com (2603:10b6:806:94::13)
 by PH7PR12MB6490.namprd12.prod.outlook.com (2603:10b6:510:1f5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Tue, 27 Jun
 2023 22:21:17 +0000
Received: from SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::29ee:5a62:a3e7:bfaa]) by SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::29ee:5a62:a3e7:bfaa%4]) with mapi id 15.20.6521.026; Tue, 27 Jun 2023
 22:21:17 +0000
Message-ID: <a5c4679d-2d26-682e-299d-00c30082cae8@amd.com>
Date: Tue, 27 Jun 2023 16:21:14 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [meta-oe][mickledore][PATCH] opencv: Revert fix runtime
 dependencies
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org, raj.khem@gmail.com
Cc: mark.hatle@kernel.crashing.org, twoerner@gmail.com
References: <20230620153917.1749409-1-sandeep.gundlupet-raju@amd.com>
From: "Gundlupet Raju, Sandeep" <sandeep.gundlupet-raju@amd.com>
In-Reply-To: <20230620153917.1749409-1-sandeep.gundlupet-raju@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0025.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::38) To SA0PR12MB4367.namprd12.prod.outlook.com
 (2603:10b6:806:94::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4367:EE_|PH7PR12MB6490:EE_
X-MS-Office365-Filtering-Correlation-Id: c8b49ff9-0b4c-4cb6-2c16-08db775cd395
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PTa4Ve5CVLZ7Dw80wUJiCmHJRoLca/s8GT9m4gSUoWqP7P5O9O8o7BAwG5JW08NZ8Q40TS6UM1zwlPhrw3YK8YPKg3FEri0Vdgw22/+c6KN6zsc3nxEntycIQE/JNx/yKZ3gXTxPyFBGqTnhKO7tjTeXjY1WhTclGczIuirRcqM2Kn2Jy4sR8/YBbq0P5yB36C3hFFJQLpNTPXaUw/7Y/hTXm3sdLx+9K2KOO7iaulagfH1y3l10kIv6sP6FLlRZP6s1EtYIP24lzC+/H4w8b7i89S4w/I0KqHCKlwWagX35Jy1wCdIDss25zHhOY7v43lefsqfwwcaORUDkeLBVwjPfTpxO9v+BS2wsqk4oyGZtpgW1oC0o/U9gs3ldxGZpe8r+t+jr+0AIspkcZ0LjDVSssiIuwWeBbqokfDICRc6xWcfAJStgCwQOl4sCSJBnowUb1KhU9Gh2PV7On28nxNRwEcEM2KzW01W2AvlBud23sL0+KP5Oa2Q/KgbIZuU6R4ConMr6nnpY9iW/dh9VosWqhSrVwNZv4gWeWhkb7bIPYTXGU7rmd6DyY0ipkDy42HrmM/Wqdc3UHPxaWv96k1cTWT1hmGkitVB9uvocVLsxZUiHNgt3N7K2+iJxcJlMVHSeKlPP6u2z2fgZKhzSOg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4367.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(376002)(346002)(396003)(136003)(451199021)(2906002)(186003)(6486002)(38100700002)(83380400001)(2616005)(6506007)(6512007)(53546011)(6666004)(26005)(86362001)(31696002)(41300700001)(478600001)(316002)(36756003)(66556008)(4326008)(66946007)(66476007)(31686004)(5660300002)(8676002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YjZ0b2pGWUx1ZTFDTVRuczFSY2dSRExpRnNHZC80SDBsTElwZXJmVVdGU1FF?=
 =?utf-8?B?SE9SUzlMWEhxTmZvdlRDa2taSmtqLzJtR1U3NHhkVjdvbVpiQ3ZuVUoxbmth?=
 =?utf-8?B?UWdsS2FnRGFiZ3JiQlhkZVFtUjBkbHlZdEE5VU0vWHpPR29NNk1lNHpBcFdh?=
 =?utf-8?B?TVFBM3Zyc0xnVS9PZUlESFAvL1E5RVRFZFYwNkdBVk5QOEtwaHJGdzdTNjFz?=
 =?utf-8?B?YzhDYUxDNnNmc1Y2NHIxMk1FbnRQb0NFTXhRc1JWaythZ1c1aEtzRW9Nb3Bu?=
 =?utf-8?B?eFZYSFQwSzlKeWw4Z3p4ZURmS1JzUVRoeEVmRG5Gekc5R01yTGxubUVmK2R4?=
 =?utf-8?B?d0VFNUZkbmc5OE5SdVQrdlFPQytRdFF3M1RudEEvYWlUajZzaEZJMklsM05s?=
 =?utf-8?B?SHdnbktQTkM4V1VmbjJLei9iYlI1blZja3Q2eDFyem5PTGlIQ3FvSXkvc2Mx?=
 =?utf-8?B?K2E3d1VXT0JOOVNqUHFuREFvM21IakhPbVZWM3lPQzhDZmtqS2pXcXk2YWxp?=
 =?utf-8?B?VVFvSGJhUkswNHVuOGRzaEZIT1lqUk1seE1GYnFKN0pmSDNuM2tQWUJlN3dT?=
 =?utf-8?B?VE42K1d1Y2pRVGN5NmM4RGFpOGpUNWV1akhkWUFhNVNiUCtldWFxNXpSOHR4?=
 =?utf-8?B?NVAzUFpqdUJTZFhkdXhabW9GNmdtNmEwNWRMNU1xcVN4ZUZybGpXOGFMcjZi?=
 =?utf-8?B?bWtiWFpzOWJMNXR5YjVDNVhsRjdtSlIrbFppY05lYVA0SjR0L1BqdWpqdEZF?=
 =?utf-8?B?dE5aT1d4VVJIUUpNZVpvRVFUemlxNlhtRUo5dkIzcS8xcFhHSmc5OS9JcnJU?=
 =?utf-8?B?NGJrNTVJbGhIc2o2MklQN200Um5HUHdvMlFDTXh3R1FsT3NHUnAwc1BhYWEr?=
 =?utf-8?B?RldXRzZJOGNtSVNyN25NNzZlanpxME91Z3RlUjJnb1BSZENXdC8yNkw1NGF3?=
 =?utf-8?B?UTBNWkpKRGFIRUM4UHA4S2xGRC85MW9DK1VuOWZBaEdmM1lveGxRSFZ1TStM?=
 =?utf-8?B?UDFBR25vZDNxL0Zjam9XSGlEMjYrdndnMmtLK21ieGZWRGp6anQ5S3R0QXJi?=
 =?utf-8?B?TnM1ZkdNbEpMRmc2Zlg2R1M5RUVvRjBUOGFuL1doSUZTd1YzMndTaWxERUw4?=
 =?utf-8?B?NXFTV1dNUWdlc2pCOWxKSnBQTFppeldqMWVMeTA4NmZjQzV6MEh2a1NJSzAz?=
 =?utf-8?B?QXdpYmJMMGlwMVJCZGl1LzBIM2s5SDYvTFhZS0UyQ3BVT0dybGtjTzJOaWh5?=
 =?utf-8?B?Vm9SSURNcmdjNUtya0ROK092c2ZoWXFkemhpT2dBaUdkVURRandPWk52Qld0?=
 =?utf-8?B?QXZLb21PNHVwS3FJMDdpVzZEMnB4engrQlB6U2t5NzErc0I3aHhWMnhBU2pV?=
 =?utf-8?B?WVppMEE3N3VwdmU4QjhFVVV5dWFWaWVyOEtQenZ0UlliRDhNSng1TE1BMFBH?=
 =?utf-8?B?RlB3WXlBNm9IQlB3QnNzdnRvYmFNQnpJUE1rd1gvUVVNY1ZYMGtvZDNNNmZJ?=
 =?utf-8?B?enR3MVJQSjVrSDBBSXVYTVdWZ25VR0JtdVErcVgwa1NBWXhPemNEVG15bVd0?=
 =?utf-8?B?Z1dKMUo2R25IQmJJcGQwc29ORTZVTjVqWFlybmxKak5iZ29ueTZ1SFhWNDl4?=
 =?utf-8?B?ZEZNZmhoRi9ubWhaV1hNb2pIdjhKUVFrbkx3enlIdG0vOVJqVkdUc05TY0g1?=
 =?utf-8?B?a005UnBEK01KODNvQTgwSEduaGwxL3JsMGFNRUZhZkVRQk1qY3B5cnh6am80?=
 =?utf-8?B?bGlrRG92enFzdGtEdk9ZVmFzRm1CeGFpSllITGt5L1dlSWp3WjZtTktuVU1m?=
 =?utf-8?B?TEZBZVdHU09DRUE3b3NscmZWYnZHTEtqd2crVUhYZDFRamRqazNSTm8vNGd3?=
 =?utf-8?B?anN4Y2tqMGhtSGFSQ0s2SW1LQjltVXhMdjFELzNwakFiYkVrNFR3VHVzVFJm?=
 =?utf-8?B?a0tSQXBaYmFsZERod05rYUw1dVVQQTF2eXh4cWZYSCs0NEhZa2FoYkdxczVT?=
 =?utf-8?B?YXd4Z2M1bkpYZThTeHlxaG82V2tOVGFxZC9iWS9DcVc5SVdESlBPRFlKbUxm?=
 =?utf-8?B?c3FCUGIzL3FFUDVETjd1Vm9YellESHlVN3lndTFSYmFHUGE1MXA0QTg2UitE?=
 =?utf-8?Q?jLSChByl0djR7EpRY90ZRH08M?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8b49ff9-0b4c-4cb6-2c16-08db775cd395
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4367.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2023 22:21:17.5138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +RNAoHz/szw72nRUsVlz1lSSVnBYNynP3Tdor/jjww8WvL3eVGwJe5arBpuNjkKC67GBzIAnFeOG7+LXVmjHHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6490
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 22:21:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103619

Hello All,

Can we get this patch merged to mickledore?

Also is langdale branch is still open? If so let me know I will send the 
patch for langdale as well.

Thanks,

Sandeep

On 6/20/2023 9:39 AM, Sandeep Gundlupet Raju wrote:
> This reverts commit 0abf5af3ffd3d13c009a8ffcd5a6f045c36be837
>
> libopencv-ts package is not empty and libopencv_ts libraries are
> not all installed in the -dev package, these libraries are needed
> for sdk development listed in opencv4.pc file.
>
> Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
> ---
>   meta-oe/recipes-support/opencv/opencv_4.7.0.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/opencv/opencv_4.7.0.bb b/meta-oe/recipes-support/opencv/opencv_4.7.0.bb
> index 361b00430..bad6f1508 100644
> --- a/meta-oe/recipes-support/opencv/opencv_4.7.0.bb
> +++ b/meta-oe/recipes-support/opencv/opencv_4.7.0.bb
> @@ -162,7 +162,7 @@ python populate_packages:prepend () {
>   
>       metapkg =  pn
>       d.setVar('ALLOW_EMPTY:' + metapkg, "1")
> -    blacklist = [ metapkg, "libopencv-ts" ]
> +    blacklist = [ metapkg ]
>       metapkg_rdepends = [ ]
>       for pkg in packages[1:]:
>           if not pkg in blacklist and not pkg in metapkg_rdepends and not pkg.endswith('-dev') and not pkg.endswith('-dbg') and not pkg.endswith('-doc') and not pkg.endswith('-locale') and not pkg.endswith('-staticdev'):


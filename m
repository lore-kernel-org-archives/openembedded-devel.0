Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.51])
 by mx.groups.io with SMTP id smtpd.web09.4230.1612420528458808593
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Feb 2021 22:35:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=fuq1Qlml;
 spf=pass (domain: windriver.com, ip: 40.107.237.51, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FcMUILgW0wcBoyHL9USFUsvp1l9OZks554jW8X1ZFvEpO8u2E7IYulHKcT7axEp1S9O7mLAt4AVJUZqRQ0x31qo6qzggxjUY4Ruyaiil4SHk48WwqVkSNiJpJgosKAVrqHaTF4RjvV6Jq3q5EmOL+yHy0NF2WhxyEV5YVgwAoB6iQsbm2QQl/9+5sIzaFmjfhpWJ9gY8iyDjbX28TG407oBNajeFhu4jauY5uA+NK9EWHkAscrSFp9RXdKEgG14zpaj6RlaBvK0epKkMiVgAT1b9U2//NB3IMjram0qu0kekI3b3Dx4PsV6Zv36aS5bnxPnk6ws2GzimCYArtBZQSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=epIuJSold1XU0EG6rG9KVH0sVZrHur60Aqyy240XFPM=;
 b=Op4ymAfyc9mk2ZVJmxRfmkvpPsvhFRmD4T/nyHKeL+8PM6tp7j84xIM6dwVzNSSl+CGGHRP88QvllLlgkFJHA87d38x3EQuwA0rOPF9FGsGMZOwjrmkNQlGCoa0ugfUUCW89V9u7S0QqVBYpX6sIWNR+lU1a7sUkcdgW6+C6jFCZP922spqNjNQTduIgM/3n/zaEC584VnjzkGgASVku+FLs9vtvmdc44Wg0PqA5fOXOL5k+/bDgjKMZ5vLJLLoVLVp2J2JGrcDwSGtQbdLxMl5F60OFLGyCdYYGA+YGgDU+j0Q56GRZA3OpxexfOfG1VRgs1PAe6rXhJx3KeLIhiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=epIuJSold1XU0EG6rG9KVH0sVZrHur60Aqyy240XFPM=;
 b=fuq1Qlmly2N7Mqd35+q6Ey6Ol4mbzB0waBN1G0WoEAd1H2qLK8SL5w2JAzpr1PFn7sjVCDTvX9qg7Qn9QjyRzgFsf/sTOMGvDklnVop81jhhwIdgYJe79Kx1j2nuGOAKErhKBGSRYcIDOOQ+U4lw5fyPRW1E99bpGNjNvCzHa7Q=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MWHPR11MB1902.namprd11.prod.outlook.com (2603:10b6:300:10f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Thu, 4 Feb
 2021 06:35:27 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::45:697c:a699:df64]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::45:697c:a699:df64%7]) with mapi id 15.20.3825.017; Thu, 4 Feb 2021
 06:35:26 +0000
Subject: Re: [oe] [meta-oe][PATCH] mozjs: improve reproducibility
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: openembedded-devel@lists.openembedded.org
References: <165F823E2231DC51.16314@lists.openembedded.org>
Message-ID: <db7d46f2-6917-48aa-a4c7-6abcac1c005b@windriver.com>
Date: Thu, 4 Feb 2021 14:34:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <165F823E2231DC51.16314@lists.openembedded.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2P15301CA0006.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::16) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.139] (60.247.85.82) by HK2P15301CA0006.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.1 via Frontend Transport; Thu, 4 Feb 2021 06:35:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 59a52af5-0962-4993-57b4-08d8c8d70ecc
X-MS-TrafficTypeDiagnostic: MWHPR11MB1902:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB19029F96D3C87FF72DF98989F1B39@MWHPR11MB1902.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:901;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wlbE/0zacQHl+GaAshpKsvlSAG2vkIacCPmzl0iO+PScLp70ZOxOBC82GDk0aYE4Yq2yk6IJ52pofI00T+a8j6tb2fST4OI8j7taVUlqMsy0NyEDfcVjChe7CMiEQswBSN8El3L+1EDw3d+59Ky0jNdpnv5qEpO8oewpJB53wkWFZKW8k7sZn/zkHJ7De/nlQmDSuPY6/R6WNGPA+mdbj3Dq8HgtdVxO3jM3VVdcl8lsmuuwhSqey7YrI13iUZRX9g5Jk+CZhUKL2SJuh8iJHldkLiTVtDsPeyGEpZRBg3t3mwoQhyZoFVoCYt++l7Eyxus8j/sbYECFDyixlUpx/rGiDHeLCNypNewcKWkpbewpZmo7bi67oBiIeW7xbR0wdQu+gJ1dkatbD7k8DrIBxH0VVCX+96HUMmmYq777iIlEp1f6QhuU/wCdGcNNoJwhzrCmD9hWd/xpHlwDI1/KLTB+A6VSYAlzOxH+T3LS0SrGT5LKtacI8RB3rQXMAVEpzwzC3U5csbFWlIB+VO96h4FNPdmGN3bFxXhR1phIf6lXw40yVwlvjaikvs+ZMp6YC2oRYFBEmqc5g9YuKQklBI7MIPgiIv7cwdIbK4AOKNMNoOEIDvdLpVLY1pu8d/b8TiKfO8XJtvRzLEplr+/P5/lJKtYw9U74tutExQSHabj8YJo8F1KabZor+KFo3gJXgyIb+lEZ5ewxT2+Y5uApIw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(346002)(136003)(39850400004)(396003)(478600001)(36756003)(83380400001)(66476007)(26005)(16576012)(2616005)(8676002)(53546011)(6486002)(966005)(8936002)(316002)(52116002)(66946007)(186003)(16526019)(956004)(6706004)(86362001)(31686004)(6916009)(6666004)(66556008)(2906002)(31696002)(5660300002)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?VVM4ZFhHY2RTUHZ0N05vdDJJNFllc04vdU9NbkthRW9PRmxYaDc3TTZZazVN?=
 =?utf-8?B?Z1h0TXJ2V3BkYlkxeGNwZ0UyWUlBWTBOTzZoZ0cxK09PdDcwOXVvTUlIMkd5?=
 =?utf-8?B?dGRNc0U5aXByZlB1YW9qaEFONEJDeVdGeitGeDlJczBrVUwwRWpaelFVbkQ3?=
 =?utf-8?B?TWpYZHVXdmZMTTBoY2d4ZFdHYnRaMlpHSWcvTXB2QjYvYUp4aVFUb0RuSStC?=
 =?utf-8?B?d3FFVjA5dGV2bTJvY2ZLUjNZOHJoWDVBVW5Pb09DcUpsL1hzcXBMa2FYYTFo?=
 =?utf-8?B?d0xnejlwalgyTmo5ellNSndpQVFBODBncnlBdkJEVkk3MGFiT2EvVkU3dkR2?=
 =?utf-8?B?eVJkbzVHelQyWHNwdW90MjJjUzlqTlVScWVLS09xM1N2MWNLUndDZ3VDMERq?=
 =?utf-8?B?dGtid3pMWUtkODZ4VkViYkpWdkZKOXBtVXRmRlVPc2R6cXE0a2dydVF4aENB?=
 =?utf-8?B?cExnaERhZ2ovUE42OGpEZW92N0VRallpa1JocWh6dXE5cXZjaEdjVGt6T1B1?=
 =?utf-8?B?NFpFRElkSWdKc2lWOXZ1UU1zMlhKaFVUT3VtQVhCM1prcEkrRXNOMDR1SHdp?=
 =?utf-8?B?dGtWTWRzT2VsRDFGQnRsZTFidWN6TDgvS2RORFpWRmV3cTdvdk4wU2VidEdw?=
 =?utf-8?B?dm1tMzU2cU8wWU9kZWN3VEdNQ3dsbGl0MG5GOEtZOExvOXJFRnR4ZUtkOE14?=
 =?utf-8?B?SzBuVS90ZzFqSmdlTzNncmR1eXk3N1BadDRXdGFGbkRaVkFKRWs5ektPOXEz?=
 =?utf-8?B?c0wwMkZVUnB5ZzVpSXQrYTJuSWNpQmJnbU5GQ2dwWEN2Z25KVmx0Y1FKUERE?=
 =?utf-8?B?MThEL2g4TVA5Z1VoUm9WODFjZ0Y5ajJqQjhDa2lVWXVDVm9ycCtBTEFObklr?=
 =?utf-8?B?ZGsvSm5EU0RpKzR5dVlNZmZwQ0JlSDdSYzJpR0ZwdXFRcE9pRXNDbEZSR090?=
 =?utf-8?B?K2I5dDk0TytBd2tnUmZVN2ozeUVNSlZxNGRYK21Dd09naUhPV29JVXg5UDFq?=
 =?utf-8?B?UmJvdEdBRUVtNWdQV0lSSU9qSW9DcERlMncrbUJaQzY2YWU4RysrbkpJSmpX?=
 =?utf-8?B?L3ZHTnBtdnBWZWdCbVY4eklKSU5NT01NMlVLUlJ5THlzZzZxbkwzZ1RzNnRw?=
 =?utf-8?B?c0FFSkhTVjVqS2EzTnp4MktpVVo4UnFVb0l1SHpMSFdXZDdmSlRxYkQySTMx?=
 =?utf-8?B?eEdMRk11YlBqL0RKUHVibXZTZzZpY1luY0lyanlDRnRwd1lSTzVnREdJT3hW?=
 =?utf-8?B?STh2RUxPUnBCekxmWVFBb0E3aDZzNktvbVdpdkhoY2Z0MHNqQ1RadE44WHdE?=
 =?utf-8?B?ZlB5WXNSakxCMjdZMW5kbkgwOUwrMkF4SHpDZVh2V1prMFRBRUtxZXpQczFP?=
 =?utf-8?B?MFJHU3Y1M3BjS3FFMTlvdFBZWWF3N1pqbVYrSTNIWXhtaUM2RVY3Z2RNS1Vl?=
 =?utf-8?B?cUQvVkJ6eENObUtKVGFtTDlwdS96Q2IwRmtSdkJpRDRZVThySnYxT2VoRTF6?=
 =?utf-8?B?TlFrNWEwTVhGeUJVRjNXTjVBbktuN3hkSnRUSkJUZVBTQkZNZ0dtN1ZjRE9X?=
 =?utf-8?B?WCtQSDZXdXM1dWZON1JiM0xZNnRQblNzRFdVeGZwdWNHWjIwdXFoWkRwYVZJ?=
 =?utf-8?B?cHJGb2lGT2VqRE90KzBoaHp4MDdNUFB5dmxlK24rdGRmL01laDR3alVXdENK?=
 =?utf-8?B?NnhycnN5MzZpdDJiRlVUMUVQR1FuMkhRNis5alNGbWUxT0lDUU1Td0R2ejZn?=
 =?utf-8?Q?EnFaGHJDcKjGJ69P/Mnisa9ydKKbM8QeUeza/C6?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59a52af5-0962-4993-57b4-08d8c8d70ecc
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2021 06:35:26.6324
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EZazsEepVhL5pfKny9e4/dBhqhFXhIaGYqGN6TTqZWnP+GQzJxq5v2jx1Ws9MCCyWeFmyEpe3FWVCW2SYd4TLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1902
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Ping.

Thanks,

On 2/1/21 11:32 AM, Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
> 
> Remove the build path from the file js60-config.
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>   .../meta-python/recipes-extended/mozjs/mozjs_60.9.0.bb          | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_60.9.0.bb b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_60.9.0.bb
> index 130ff13ec..614cdf6e3 100644
> --- a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_60.9.0.bb
> +++ b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_60.9.0.bb
> @@ -125,6 +125,8 @@ MULTILIB_SCRIPTS += " ${PN}-dev:${bindir}/js60-config"
>   
>   do_install_append() {
>          oe_multilib_header mozjs-60/js-config.h
> +       sed -e 's@${STAGING_DIR_HOST}@@g' \
> +           -i ${D}${bindir}/js60-config
>   }
>   
>   PACKAGES =+ "lib${BPN}"
> 
> 
> 
> 
> 

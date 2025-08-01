Return-Path: <jhofstee@victronenergy.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 791BBC87FCB
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 19:18:17 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.105])
 by mx.groups.io with SMTP id smtpd.web11.96043.1754075887532721009
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Aug 2025 12:18:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@victronenergy.com header.s=selector2 header.b=gFfpEO1o;
 spf=pass (domain: victronenergy.com, ip: 52.101.70.105, mailfrom: jhofstee@victronenergy.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p7AT5Thdx7Y03pSQ9WnHXtU/YY+dF11LIzGycwRbWxrNFe6/J7CyXmggtxPmX7nCTRb9djWYVUvO/BWthGUrWxgENodoRv6eVjoGqte0WxegRk3m3Z63udPHpxNVyQj4GKCofQl/eHiOQDdvZc29oiU1xMD+0CbgJMM2iWeagqbLXYTF24vTfSV34FYUAc4E1JlBJrn/5oSl5xt0XwN3w8CPRbvQJSiSGSzxJQLbdaAJLhGSXd8nKEJOcY8Gn5oeAnUvPiS8HknmbYyQoETyQjJy5GT7N/CYwbADMzr9GBqF1hUoyZwuAkLtiAi49o38FkC1jb95UyvxLDTA7VNRqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cwH2EJ92j8AtNOjZJ4ICdSIoFy5Fm96NLm3Ksr+dmXQ=;
 b=EITQPYDpGhOQQ4y4SolYYrzZd+Dhb/bXI6jRn13+UMVBJy0LMEr0NEOn40EAmP/8ZLyNo6owt14twMAbHpREGjT/oB1pp7dsOEzH6tCbhDEyRXYoQw3hX+JphZWugjw2CjxtRtLLgqgTQSFBybkHQ+hzIeDwTmqf2lODHIfv8c/mWk5inPE40EJyCFf/7jbkpWMiA/l8celay3HKTwt5mM1vO0VU1mUujHti4LeVb6v6/YShq3p6JB+UgbbXIsB37DUTp2DWjyR+xs8k+TJzVnC0COBmxnVFfEGf0ATUWhqEKli3AUs6/dVfmsRBCZbk5WkNiNOA5n7rJJQw2wym8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=victronenergy.com; dmarc=pass action=none
 header.from=victronenergy.com; dkim=pass header.d=victronenergy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=victronenergy.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cwH2EJ92j8AtNOjZJ4ICdSIoFy5Fm96NLm3Ksr+dmXQ=;
 b=gFfpEO1orxT9CURvGnV92+56BHqCyqP4JBdNXLwpOMDOVL3UcECQoRzAR58aAinvLFzuoNthVcnV9CmW2MuQl0VN6lsAK+MHnYs41B+TfUQqcCfoP0tQoDxqvYQMItKbv9Ic94xohWm9yD8fN/GW2P6/XTqJ8hrS0PiFOjEI5E4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=victronenergy.com;
Received: from DB9PR07MB8679.eurprd07.prod.outlook.com (2603:10a6:10:30e::14)
 by PA4PR07MB7152.eurprd07.prod.outlook.com (2603:10a6:102:f7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.16; Fri, 1 Aug
 2025 19:18:03 +0000
Received: from DB9PR07MB8679.eurprd07.prod.outlook.com
 ([fe80::5b79:28d3:a16b:4fd6]) by DB9PR07MB8679.eurprd07.prod.outlook.com
 ([fe80::5b79:28d3:a16b:4fd6%5]) with mapi id 15.20.8989.011; Fri, 1 Aug 2025
 19:18:03 +0000
Message-ID: <db41b488-bc13-4ca0-bcc9-f3eb90eaa28c@victronenergy.com>
Date: Fri, 1 Aug 2025 21:18:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-oe][walnascar[PATCH 1/4] php: sort PACKAGECONFIG
 options
To: "Kumar, Praveen" <Praveen.Kumar@windriver.com>,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20250730123111.3858530-1-praveen.kumar@windriver.com>
 <ccd7c43f-835a-4115-bbd9-6fd5a632d88f@victronenergy.com>
 <BY1PR11MB812683A8DF1837F7213EFCEDEE26A@BY1PR11MB8126.namprd11.prod.outlook.com>
Content-Language: en-US
From: Jeroen Hofstee <jhofstee@victronenergy.com>
In-Reply-To: <BY1PR11MB812683A8DF1837F7213EFCEDEE26A@BY1PR11MB8126.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4PR09CA0011.eurprd09.prod.outlook.com
 (2603:10a6:20b:5e0::13) To DB9PR07MB8679.eurprd07.prod.outlook.com
 (2603:10a6:10:30e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR07MB8679:EE_|PA4PR07MB7152:EE_
X-MS-Office365-Filtering-Correlation-Id: fb89671e-acda-436a-d474-08ddd13022f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|10070799003|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?b0FEVkVLN2ZBKzFNd1F6bEZwUzVuY3ZPRzNOd3JVYUpvajNvZkNSVis1Y0dk?=
 =?utf-8?B?SU1pWUsxaVNKV3pJaTExZGVkOUVQb3Zod0tIcE1XdHV6M0NUSlRFWUI0RFhR?=
 =?utf-8?B?eStUcGMzWTBFblZlS0NmMUN0VUZNZGhGendYVVFLWUc1WXBaeGMxV01CMmE5?=
 =?utf-8?B?NnFEa1hLSHlxTlpSc1l6T2RqUTc5bnQrdDFoMTVQN0VqeFdtc2NmNEpneUlu?=
 =?utf-8?B?bjZjdXFQS21lWFRpakZ6bFlQMHhudzdpbU92TTVpSEZWbTU3NCtWRUpIQ0di?=
 =?utf-8?B?UzNkc2xWYTZLV0VjUGJYaVRKUE9QeGs1V253QXIvblBra1RmNUluQ0xLUy9O?=
 =?utf-8?B?WWtUa0lSLzdNTFRwVENnRlR4VG1EUlB0SDhMOEpQSkVWTXFkV3NxNWRtSnVS?=
 =?utf-8?B?SWlpSGhuQzloVFpqeWV0UTRvaGhXVFVZT1VraUdoTkdQQmw3ZXNyNU8wd3A2?=
 =?utf-8?B?anJiUHRIaGtlTnR4bGtvMVpCakVlL2RPaWlyMUYrTUxHNmtWcVZObWV5Ni9n?=
 =?utf-8?B?MHFaaEUzemdPL0NMdmlhQTNmSG1LS1NUS1RUQkZhYld4VVYyaXBjaCtaRU9y?=
 =?utf-8?B?NWhzUG9LYWZIbXhVaXRRNWF6OWc2Rm04KzlwalJ6K2U3cy94YmhLTHJiMGV6?=
 =?utf-8?B?UEhLSlVRSWtZeGVxK09SeTdFM2E1QnV2WVFSTU5nMWhmTGtzRWdxS3JuNU5p?=
 =?utf-8?B?Vjh2VlNhTldmTys5NUlZVVBGeUlHa21sT2VCelhOYTFtQktpZE1RWnh0cTVo?=
 =?utf-8?B?VUZScHBVL05Gd1drNE9SQVZzcWJsamJucXpFT0d3SDhpZXlkNHJoNkZqa1hY?=
 =?utf-8?B?R21VbExEdHF4SmFKQ0dMbjdJSGNmOE91U0U5Y1ZDdlVxaHNYd01BcjR4VE5O?=
 =?utf-8?B?RDM2amhMODNQWlpuZW9BMk93YlFlRFd0Zzk0Z2gxdFpWSlRxZDJGOU85S2Yy?=
 =?utf-8?B?RmhyZDhSZUV4TU1KdnBRb1lKSU12YjRsWFNiMURDK2d6NjZiOHpidGlFV1BL?=
 =?utf-8?B?UG5SWUNESUlOVi9UM1pqNWk3WGZJZzRrb2JYMExlV3BNa1VLOUtKQWtRNFIx?=
 =?utf-8?B?d2NNM2hZbUVXWWJBUEh4djZUUEt2by8za25QZXRxZ3E0cWpZTFZUZXEvN0g4?=
 =?utf-8?B?MVNiZnY5Tksxenlsck5MMzduaGduRHJId2lvbEpIY0lFS2FKbnZzMjQ1TFV4?=
 =?utf-8?B?b2h2M2hEd2o0Rzl6NHVPS1JaZjB3ZDJMSzZiNW56SzhHbjZxQy9iZWhhbnZD?=
 =?utf-8?B?YjVyWVo4ZmFlUVJrSFBVQWI1QVhTT0E1R0lwdHFSYktGbGRxVmxmSXhzSGs0?=
 =?utf-8?B?WXhoQklsYWh4MklmalpzQmI3aytWT3RlRjUwbEx6blI4Y2ZueC9JRXlMcGZZ?=
 =?utf-8?B?bmlUYUdIM01vKy9wZGgyU0VSSWZrLzZpQjNJLzU3MjIxZ1o4NVR3Rm9JZDFz?=
 =?utf-8?B?OXk3aThRZDlRWW1wMktKSzhpRmFQQ1EzSkdDWi9kWnJiTlNjd0JjZ2RFS1hT?=
 =?utf-8?B?Y2hjM2tBUmpHa3NTb3hYdWE3dE04WVAzSnF2NUdlQWl1MDZkR2FaTnROZjJH?=
 =?utf-8?B?Z0FuRmxQUmhxbUpMU0VoSE44VVltcXo4NDB6WHJiZS85QTQzMERiWGxLZVRj?=
 =?utf-8?B?bHBnblhwRkhNTENHZkVabWJjQXdKVUR6MENhRnZGTVhDa0svalB5aVY2bVZV?=
 =?utf-8?B?aXhUbGlUSEtGbVJLS2RzOWtUOW5BY01OOVdpY0ppWC9EWmpJbVM4N0wzSU5R?=
 =?utf-8?B?WENWWWtIR20vcW5OVURsRXV0NmFDWXFhN0cyNFRRbVY5T0RXS3VYT0g4b3FS?=
 =?utf-8?B?cVRYd0x5dWtkdkZtQ2xOR0xtNUFveEM1NVEyMHJUSVpEZWhKd0pLZXNzRVgy?=
 =?utf-8?B?M3hmbVdLSzBjMVJZWVVQdFIzdUhFZVZCOFpPNGI1eG1OWWI5SzluM1ZIRFg0?=
 =?utf-8?Q?1sN1khY/FVQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR07MB8679.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bkRkNEQ0UzBTRFRtUS9yVHpXODFmdng2ZkVkKzQ3SVZmdUdHdXE5Yk1yNjNy?=
 =?utf-8?B?RGVEMzhpMHhDNzJTV0dwWEtmS0lLdlRJNWw5Vnc0OHNXM05ocW8wMzBzcFUr?=
 =?utf-8?B?VTFTZ1NhZ3MyVEl2RlF5SkpRWk5WMksrUkx0aE5WM1NWTTRJWTFXU1RRNG9R?=
 =?utf-8?B?eFZ2alcwMmJUQndLaWlETG84dTdkeXIza2lKUGhPMDV5Mkl4cU1yRk5uQ2tl?=
 =?utf-8?B?YUgxeVFKUjllWUNSODRKbDFGdUJaMWFhSm9ORkd3U3B0OTVyVlNrTzJDeFIy?=
 =?utf-8?B?SVhOSW5md0VQbWR3OTdtUGYxd3ZuS2g5Q2tZNUh4OTB1OHIzL0tKVlBTWmRh?=
 =?utf-8?B?U3dXdjgvMnQxQ3lMc21MckZhd3ZLUUpnUDJmTklFOCtsZ0c0UUNkY3RjejJW?=
 =?utf-8?B?SVF4Rm9zRFBjN0FiUWJBRVhOWkxDT3gvOGdFV2VsYTZIQ1pScWlOV3p5alhH?=
 =?utf-8?B?SHRzTWdHajVLVlBIb1dRZ2dpa1ZLQXY2NUtQSUJTeDJabUVZYUVlRDl4eEpv?=
 =?utf-8?B?SHZxK3B1ajFHUXlPdFkycGtrZ2s5MHd4YW5ZcjNLbzNZbU9rRU9uTStadVZ3?=
 =?utf-8?B?czV6aVg3U2xOeExOc2tZYVBLbG5BeFY5aEZMcnpJRWo1RlRab1Urb25Uc1VB?=
 =?utf-8?B?aUROR1JIcHBZc1FtMTUzMm5TdzBJUTdTTlJKd2NONmxrT2xYLzRrRUgxY0tJ?=
 =?utf-8?B?WnJkNGl1aDJ1Um9SNHNOVUZid0puVVVRMmxtWTkrcmV4b2hNVTErSUVqejVu?=
 =?utf-8?B?a0hRU1hVV3l2d3ppKzc2QnFSODU0cktlTnZRR053MHYwNEN4clpHQ0RCVGFr?=
 =?utf-8?B?ZjZ5NVl3cGVtbkNnRkRFaXBwU1JzalBkYUtHcy9PZVlwaGIzcHl2b2hvOXZi?=
 =?utf-8?B?UHhZTDBmTCtPM0l2eGViRXorVU1lZnd6bk9Wc01TTFREY2FVNzNENVNSa0ZV?=
 =?utf-8?B?YUFaY3VLV3FOeUN3SGxML2V4VkMwSG9pN1ZMZ0Y1aEFxd2luYmdBNmJEOU1E?=
 =?utf-8?B?bzF3T09qK2wzNTkwY3UxbElGTHVpNTNBRHp5QzBkbUJobk1LakI2VUVKR3g4?=
 =?utf-8?B?NFhwMFI1WFl6ZC9oTHYwbzgyYnQ4eE4wTHRVUmlyWGt2NnNpOG1nTHpTWEVz?=
 =?utf-8?B?RVZsaVFsMlJoUWVsS3JraVk3c1plSEpkd1Z5azdzU2svcXprUDlncWordlds?=
 =?utf-8?B?TG40VEhIYnpIbWxneGM2cUNKaG84a2pwUHQzS3dSMHJhUG84by9OdXQ1cEI1?=
 =?utf-8?B?b0todWpKWElxNDhsV0VqbjJvdHJubDdnZzEzaitqMHlFaU85ekJmMEdTcEFD?=
 =?utf-8?B?SGRaN094MnkxVjFzS0paTXBidEQ4Z0pFN3lYSm9ycWxxRm9USzNmYVovb2x4?=
 =?utf-8?B?bENSeXZBL0JxYzlwUUpDM08vTDdNdHpqSm5VQ01CbTB6Z29hR01YZlZybWRo?=
 =?utf-8?B?eGJoQkJ3MTk5OTdFa1gvd3VnaHdUZmVzQUJQdHVHbXhXT0htVG1KeGsrS1pG?=
 =?utf-8?B?REtSR3plSE55a0taTDZSQVJkMTJGb0FrSzYwM0YraSs1ZFpGZlNVQnYzMnA5?=
 =?utf-8?B?WDFpa3hmRFhxQVpDWEljK2VwRUorTlEybFQvUFRMdC8vaFYrZW95bGxoNytD?=
 =?utf-8?B?Z1VMQ2h4S09UcXhCWm9yM25WTTVrQ3oreGdXZ2p3d3JSYVlxV0t1QVdMNlhl?=
 =?utf-8?B?ejJrV2xIRlFRUmt6Q3QwN3ovNGJjM3oxRDljNnVwV1RxTmkzMGdMejV1aG4x?=
 =?utf-8?B?OC8zWlVNSjQzdkQwQnd3VUlhSFNFWU40eGpFRFBoRVF5V2txNTRnVTVUOHhT?=
 =?utf-8?B?OUJXZXZTd0JhK3BXQVFNbjlqZVZwZG9La1RJOHRwOGpTS0dKM1FjeEdhWStr?=
 =?utf-8?B?RmREVWVlM2NHTFFTRXpmVGxLK2FEcXdZT2d0MHJIbnd4emlMMWs2S3YxdTBx?=
 =?utf-8?B?N0lXZHB2cUhaaWZmdzZsVXZIVTVKYW9xSUwvbGV0UjhzcVphRThDT0VWdyt4?=
 =?utf-8?B?RldkNE1zcm03eGNnaFI5dGRQN2YwajRsUncxQ2ZFVlpTb21tUUI3MXc1WTVK?=
 =?utf-8?B?cElOcS94STRoby9lc1pYU2ZaYWdybE9FMFZNZjlKSkgrYkNmbU1aU2VEU0Z3?=
 =?utf-8?B?OCtiNE82VmJBWlhBNzRwd2NmWnBQWm1HUkE2dDJwSnR4WFh5ejJnanR6NmtI?=
 =?utf-8?B?dXE0ZVViYWMrejZ6MytIcjJ1STVsRlRwVzd4b2VSR01mNEdNR25NaFUrTXVT?=
 =?utf-8?B?WnR5SDhwRTg4cnIwWDhCOEpGa1ZBPT0=?=
X-OriginatorOrg: victronenergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb89671e-acda-436a-d474-08ddd13022f6
X-MS-Exchange-CrossTenant-AuthSource: DB9PR07MB8679.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 19:18:03.3322
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 60b95f08-3558-4e94-b0f8-d690c498e225
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6LEn6u4HHtQY8zy4KefintSdeqSfbcQwbWSj/K85NskNugX5BIBSqAayA+tC8oOgGCD7VGjlbFsWgxEXeW2oWnirgzKtHkJXr2XgpvAKp1U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR07MB7152
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Aug 2025 19:18:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118822

Hi Praveen,

I have no strong feelings about this. I just purposely didn't
sent it to older branches, since it doesn't fix a php issue or
CVE, just readability and for future maintenance , so in that
sense there isn't anything missing, nothing is broken without
this patch.

If you are cherry-picking patches back, which I understand
you are doing, I understand you want to include that patch,
else you get in a lot of silly, unnecessary conflicts.

But for other meta changes, like lets say more PACKAGES,
but without according recommends you can break things
with meta-data alone.

I guess it is just up to the maintainers,

With kind regards,
Jeroen

On 8/1/25 11:41, Kumar, Praveen wrote:

> Thanks for the feedback.
>
> I understand this is a cleanup, but we are actively maintaining this 
> branch, having the PACKAGECONFIG options sorted makes it easier to 
> manage. It helps reduce unnecessary diff when we compare the same with 
> the master branch or apply future updates.
>
> Keeping this patch would help us avoid conflicts later and make 
> upgrades easier. Will it be fine to keep this patch for easier 
> upgradation and maintenance?
>
> Please suggest your views on this, can we keep this patch for better 
> alignment of future upgradation or do I need to resend the v2 of this 
> upgrade without this patch.
>
> Thanks,
> Praveen
> ------------------------------------------------------------------------
> *From:* Jeroen Hofstee <jhofstee@victronenergy.com>
> *Sent:* Thursday, July 31, 2025 12:38 AM
> *To:* Kumar, Praveen <Praveen.Kumar@windriver.com>; 
> openembedded-devel@lists.openembedded.org 
> <openembedded-devel@lists.openembedded.org>
> *Subject:* Re: [oe][meta-oe][walnascar[PATCH 1/4] php: sort 
> PACKAGECONFIG options
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender 
> and know the content is safe.
>
> Hi Praveen,
>
> On 7/30/25 14:31, Praveen Kumar wrote:
> > [You don't often get email from praveen.kumar@windriver.com. Learn 
> why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> >
> > From: Jeroen Hofstee <jhofstee@victronenergy.com>
> >
> > This backports commit bb896f6b6f92 ("php: sort PACKAGECONFIG options"),
> > which was missing in 8.4.5 and helps in reducing unnecessary diffs in
> > future upgrades.
>
> This isn't missing anything. Cleanups like this are not
> supposed to be backported.
>
> With kind regards,
>
> Jeroen
>


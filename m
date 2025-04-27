Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45193C369CB
	for <webhook@archiver.kernel.org>; Sun, 27 Apr 2025 01:54:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.19990.1745718859560744854
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Apr 2025 18:54:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6212614de0=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53R1K3jA017072
	for <openembedded-devel@lists.openembedded.org>; Sun, 27 Apr 2025 01:54:18 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 468mq195gv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 27 Apr 2025 01:54:18 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53R1sH1A002228;
	Sun, 27 Apr 2025 01:54:17 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 468mq195gu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 27 Apr 2025 01:54:17 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iLP1YdrZhPdSBxBTpUUpoUX0U1Z9QhtyHuzaxbWGvZSWv2T9+60LJ2+b2zziuapGKWhNNl26yMDRc13jSc8K7ICgR+eQjA1vebU0y8u+Bf8ayzUjk9ZlwGhDt8dj8SUEfphxf/WzhPPkLyGgoYMDFAkFh/L91QTaQsFcHqyo9aGoxVx3Drv0trxPUILs8S34MwNnfcKSeIJWFac5SWlS8JgD1CdJ8QIeAYgEMP6sHKoiWeNDPWnKWZLVHvbJ9us+HAr3uBXfSk3pCXdiNVVqhJEJWXb6xGuUlg/ch4Zr13fAZ3oiZllycd36onJSc6u2Tjy9hzWMtVMno2cmYuxO8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HY9h3yGjCXFLydrzP50IH3M+QaouKVF7Ru75PNINPbo=;
 b=xZFY+/+qRjeSQXS7Y9fBpoKy/XsMawAd9mf9CywL885NE5f5qABfSaJ5wZCFKRlCYL+muyuN/M79rKV4KEmAWhjWHJ3EFI27M7yNRlIggRqeZYeIahY2XdvUtRD7JoRallgAsWBmKz08AU9t34Bi61nkwWtnS1Ygx3HooGpRhkHIA+TSFGPg7YTg5J9FymXq+WJFhF2ho9oOkpDSdbw26F7/BDkkKul8jmkBVDJ/luaENpyVficyiE+BFTaagjiNGTb/bjAuQeEPvo9O+1c/QclarDPkWiH9they7OVzN4bUbLVJJKIpDkJRHRg4FB3EaWxZ/MKliH/cGiL39AQB+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by SN7PR11MB6799.namprd11.prod.outlook.com (2603:10b6:806:261::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Sun, 27 Apr
 2025 01:54:14 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b03a:b02:c24e:b976]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b03a:b02:c24e:b976%2]) with mapi id 15.20.8678.025; Sun, 27 Apr 2025
 01:54:13 +0000
Message-ID: <61ab4cac-f5c3-4fef-92fa-342ddd875535@windriver.com>
Date: Sun, 27 Apr 2025 09:54:08 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][PATCH 1/2] python3-pykickstart: Add ptest
 support
To: Gyorgy Sarvari <skandigraun@gmail.com>, mingli.yu@eng.windriver.com,
        openembedded-devel@lists.openembedded.org
References: <20250425094926.151102-1-mingli.yu@eng.windriver.com>
 <23321af9-a794-493b-b665-8b3f971aaf5e@gmail.com>
Content-Language: en-US
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <23321af9-a794-493b-b665-8b3f971aaf5e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP301CA0050.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::14) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|SN7PR11MB6799:EE_
X-MS-Office365-Filtering-Correlation-Id: ade70b20-2f5e-4189-a5be-08dd852e692b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|4022899009|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dS9JWmFmK0pxZTFEMHc5MW9LQ21qMG52T2UvVXpoMUJCQk9XbEcvREl5TVQr?=
 =?utf-8?B?NDNlWllsQmNPczBxQzFPTldPaWtTc2h4RjZudTJmaDd2c1Zaanh1NmZhQzQ5?=
 =?utf-8?B?MFRaN3J5SFdBWE9ZMS92cnNSckU0Z085MVFVQUM2TzhsdDAzNndJcUJ3dExm?=
 =?utf-8?B?NFZRMXB0YWJFTUw0N3czUjNsellrNUdCUnVYeU9Jd2dhRWdiSXlYSmFvSkdT?=
 =?utf-8?B?UGRhR0k3dlZmR2Z0M2xlUnlNblNERER0bUozS2V3SjF4SlBBNGVFeTFXY2Fs?=
 =?utf-8?B?ZDR3cWtUZHZGamZ5Z01IUXlsRDBET1lPL3A2T2d1aWhSbFFiTjJQL0NrSjc4?=
 =?utf-8?B?UTlZTXlUVk1XdWlpRTFmMGJYQmc0aHIvbFZpUjJuUUhZWEo5RlZCS3BGTWVv?=
 =?utf-8?B?NFg0azZ2dTNxbWpoQ3NrSjExWFVRN0NnWnV5cWc5eDVRZGFiMnZuSUp3dzg4?=
 =?utf-8?B?U3ZyMnJscWdXbkhjRlg5SEhzVmZaRVMvWlh1QjhkWHZJSjVXOFR5Z0RiZ0Zo?=
 =?utf-8?B?czhQU09JbnFnenNIWDR5eVkwVmptRzFPRE5GM2dWdnZrMjhrc1NvUnNadHIx?=
 =?utf-8?B?ZzBjVWVwUytJZi92aUdjTTQ1Yi8wRG5BcXJyWndGTUtWdGVqb3NuNTdlN2Zi?=
 =?utf-8?B?QktkZlRGbmc1Rng2VVo5R3VCcDA3SDNaWFRjM1dpTlB1akFtTmp2Sk1XR3Na?=
 =?utf-8?B?QTN5cHVoRU9NQWU5Y0JLK2xGVXVsY09ZNlpkZktTRk1Cckc4UUhXOU5HRzFI?=
 =?utf-8?B?OWJYdmVTRGtlTGtJcC83RHN1VjhORjc4TTFaaEtwOWJsWXlVQkxyZ0dXWk9a?=
 =?utf-8?B?KzNZOW5FRng2NnpRVCthNEJ5UHZCYUd5bG56ZzEvd3dacUJTanRxd1AxSzJT?=
 =?utf-8?B?bkkrNk9uVlAxYVJXS2xGc2xEQjBXbmd3VW1yOGM0enNNNnZ0UGJIMXQ3QUtJ?=
 =?utf-8?B?dHJ4LytjT0JpSEVCVkljeitXVDVFbXBiS2ZtOFBVZ1FDN0pUb2xka000RHhR?=
 =?utf-8?B?MjRwUTgyL3FDRHB3SG0xMm05Q3ZUR214dnVNZ090VlU5Mlh5eUZSSnJTbDRH?=
 =?utf-8?B?RTZLN2RCdjh0RHIyamFBTXdGVEJvdUxJZ3VQSHJ2Q1RVQURKeFp4OEh2VlB2?=
 =?utf-8?B?WldQZ2JieWJGM1VORk9EWTczVVlmWUxMbkoyQlBDWFVjaFlzcVZMOGhjUG0r?=
 =?utf-8?B?K2FIMy9lOGxjZVpZbVkvcjkrUnh1c3FPalFjbzEyRjhSdzFLOGJXWjdwWGlI?=
 =?utf-8?B?YzNib3pDdXNlVUIrL2VNOGpza1VBVDljWmpDNkRKdTMvblhjNUhOZnhiSkZs?=
 =?utf-8?B?aWVtTklBVWVCOUhlWGFlc2NKRko4VXlVQWN4dmVzdzlCRVlsRlU0Y3JpQUxl?=
 =?utf-8?B?NFNrdmdNSVVLaDY0eGx3TXJETStTS0xTNkovd25EVi9hd2RBSkV3T0NzZlJC?=
 =?utf-8?B?aGZ1MVh0ZXlHb0JSR1Z4dWJoVThWZE9xZENaeVU1ZTRqZVJabDNNOXk3SDNn?=
 =?utf-8?B?VytYc2NSREI1RFdRd21hNXFCWlNrUE1aRFFFQmZ5bDVVMWsra3BYeXdLM1ZQ?=
 =?utf-8?B?bk42ZEM3dWozcjFnd05CUXlEWUgrampjcWEvSCtUdjgvZWVxVk1IbmRtQ3pL?=
 =?utf-8?B?Z2FNNzlON3RHSUxyUU05RW96VFBCTXc4bUt0eUpRVEM3WHRWNk9Ja0hjczdP?=
 =?utf-8?B?aWV1T1Y0RXpIUjlRS3Q2Mkc0MW9Sc3hiK2pwOGZwNVJOdENHRW9KUzdrR3hk?=
 =?utf-8?B?QmZrL3dSQXRxOEY2cEpNd055SjFIMFMwR3ZuNFZFNmp1eTRRaEdTa2pXTGxu?=
 =?utf-8?B?RnRRd1lCdERxeE5ZK3U1VFlRMzJpYVdmaEdkVTVTQklxZGFGUXRmeTdYbVdq?=
 =?utf-8?Q?Ypf4Ok2ClFr7r?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(4022899009)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ditjK2pwV3V1REg1R1EzNXVvR0VVc1pjM1NMTTVSQ3FMcXNFZGhBQXR6QlF2?=
 =?utf-8?B?dGxnbWtVOFNmc1J3Q1RTWG92ejNVUmxMYUZpMkR1M293YmhSaFZCZitOMUVY?=
 =?utf-8?B?Q1JkVTZkV1hrNWc5MXBRWDVxdmhYZE44RXZrV05wQ3RWYis4OEwvZ0hZTWVX?=
 =?utf-8?B?QU82ZjVJWmRnMXptMXZDZWx5OU9paW54Y1dLWi9TcFFQRVBTckZQL0dTRzJz?=
 =?utf-8?B?ZW9rRG42Yzk2OGpNSkNmK0tiL1BMUkdSOHRkMXdlOEhuclRTV01yZkJORzU3?=
 =?utf-8?B?bXBVZFRQdERiUys0Sm0rb0Vhd0tjTENhMmxsTTBrU3pYbkRXbjhCNGxQSzU0?=
 =?utf-8?B?ejJ4b3l3REw1T1c0YlJaTmhwRHJQL3Zjc2hVUVgrT0ZFNVNVVVFIZjJzMmts?=
 =?utf-8?B?WEtqamxoTXlheURmcmt5Nm9BdHVidjAvVmxJU2RnZWIrL3Y5QWZlcEJMdy9V?=
 =?utf-8?B?U0J1STRuWWlSbHpTeEZlZmFxZzBzTG9KMGVWdjMwSnhvazg3V1BQdnV3bFVL?=
 =?utf-8?B?MDdWZ2lqRVFUWXRyd0tuVVQvenJ6cXdrb1pGZXBFVTFkNHFvYjBhdUFkVTJB?=
 =?utf-8?B?LzRSemlaWUZjUVVvR2hJU3FLaTY1dlVwVnhoWDN5bVZ1cTVGVzRDQm0vV3Zo?=
 =?utf-8?B?ejVEa01ROHBnT1Y5OEpxTHl4b1RydW1xUjk3ZEE5MkM0aXIxaDlBRzJDemRF?=
 =?utf-8?B?NE5idXVtZy8wRUlJSjdiQVJ1ODYvNVRCYVJ1b0cycDMyWUxGRHI1S1RyK3pN?=
 =?utf-8?B?TVZZTmp1ekd4Sm4ydjBhK0xsSzMzaHpUYktidFdXSFAwM0plNmVkV2p6ckdZ?=
 =?utf-8?B?UGVYL2pqOWtwR2Y1bmhlK1lCWUdUNjRRNGdXVGllMytka0cxKzQ5NTFySmdp?=
 =?utf-8?B?UmdZVW0vaGlRa0JaKy9mMVZFekZLVGNIL1o3bG03ZEo2RWxKWGdjTVVLS1A4?=
 =?utf-8?B?TlJvU2ZLTkxYVnEvVlo5SmQ4V2hKd1IvSGZTR0Q2bWlQM3ZReHdIc0lJZ1Bz?=
 =?utf-8?B?M3ZlQTRtUXJ2MCtJcEF0N2xJTXcrdlNRQyttcy96KzE0MGI2eVpSdmpRM0sw?=
 =?utf-8?B?bk5zNzM5NGU0WCt4UnZLV3ExR0dYZndPL1huVis1T052QVlUam5pK0FUWW5E?=
 =?utf-8?B?elVubU1Db0dueGJIRFo2TmlRSWwxNVFMNFRrK0R1Tm81ZnFVZ3pVa1dvZllJ?=
 =?utf-8?B?ZU1lQkxVWHFRb2NDSE9DODNFaVVTYlNERWdMdDBXNVQ4MVp3Tk9nalloRUo2?=
 =?utf-8?B?Y0FwekpPR3dPMGhZNHNQanlJajBKQ2xpWmdnWnNzNUVaWW43a0JkR2lnT2xE?=
 =?utf-8?B?QXBRSGlnVVdkNEdxNk9Ca2VDUzdlTjRxRG1mT3g0blBKdCtwaTBkUkk3aUN4?=
 =?utf-8?B?Z0R6YXBCVUE5ZS9EdW9IYm00RnJHWXgzVkcrNk9kLzZ5dlJ6REtIZEk1K2hR?=
 =?utf-8?B?cGRsbXhveDE2NWxnTy9ZVEFPb2tDYTN6bStIK0pFQ045dDk1QmxjbDdEYmJV?=
 =?utf-8?B?TnNGNzRodmFHQTZPK0dtY21sb1hlb3lyQnJwK0psb2Fud0NHVitLWDRPdWVE?=
 =?utf-8?B?RkJBMnpnZHNDTFFxMjBJVUZhVGxmOHJGTCtEYWE3N1IzRVdCa05ZU2dTbkNV?=
 =?utf-8?B?ZG5nYnlKTHliWUR4eFJGdEpOcGxpVzQ4WWhwcDR3SFJmb3BDR1J0Zms3UTND?=
 =?utf-8?B?VkFWZ1E3YTE5RnlOSWdmMm53RmcyUkRCcmtpc0g3Ti9yT2prZFA0RTJTQkJu?=
 =?utf-8?B?YW5ndExoUWxVSWxIdG43TEsyekNJaVU4WUI1S1RVNVVZeVZVb0hZUjVvRnc5?=
 =?utf-8?B?dUtWR0VEa3R3d3cwd1I2TFhZNFVIOUJUeTV0azdIMHA1c0twazBFRUFLelFs?=
 =?utf-8?B?YXdaVDFEeUd5K2N6WHhqZC9XYS9aZDhubVVad0VqK0VDdVRTamx0WjBQYXpE?=
 =?utf-8?B?ZHA0OFpaNS92bUc4WE9vTS9nN3JVVUpkM1lid0Qvd0JGSnhnWE1Wb2hIdFBt?=
 =?utf-8?B?QUg2NVEwd0hDQ2lIR2VqeGpWcVRRVVI4L0t2Y3FPNE1QUk9xdUF4QjhJLzUy?=
 =?utf-8?B?Y2RyeGlPYk4vUytXY3RtZ3Q4RFRnMzkzdTg1aVZzNWVQZ1JYMUNZNmRVbms0?=
 =?utf-8?Q?V9L0Db+N5tsgOP4FGus2wiioU?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ade70b20-2f5e-4189-a5be-08dd852e692b
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2025 01:54:13.8408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PsT2U0z78LFMWIzb7ARzwTN4OwH4B2CL/TXxTtp+teB7P1WNUyp5hnkYNiSHTw73ddQPnxBo2fU1nfOJs4IaZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6799
X-Authority-Analysis: v=2.4 cv=KsNN2XWN c=1 sm=1 tr=0 ts=680d8e4a cx=c_pps a=CSNy8/ODUcREoDexjutt+g==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=eI422izD5DiVuLofc9QA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: pAXKC2hPG0z8Azj0I_sRqWs1quGTibGe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI3MDAxMiBTYWx0ZWRfX1RFOjv6r0KIb S/Xz3dhzpU63t9dYZOFcYVkNlrJci+CW6QPfOAowHBv8k9q9tsGZbzFghBI+dzgg/EYJI9pIbvv gAPNXOqhUYhdjJOFmApu9QFH2/pdMmy/DyM+jr/9Gsh3yu4wX1kbxAkkYoLL1MLBf/ye3zcUc8m
 QB32VwIRnjuoBNhzSRTale5YUuM0CUe8SAZYKjmoF5G/j0oJrkdS2XiYorGg58oUEdKxKf5wPjU X9g2FM+BUv7G6rfKG9WuWoQ8ar/POxQJc2NSD3BHyApekQXJknhKbEqoN7OTVo3SSCywjTgiOI3 NHbMwKcmuj9/dnY32ZQpt+0QLtA4DcUrV1M2BrL3Mw11wswpZtZmSc8Turzrbyt/JRWbCKlz/Wy
 /gONjwaSLyjvHow2P39RiYt+f4cKt6ZMbR1RnETxO/GPBptWg79efqTivuNHqldauKaJi2en
X-Proofpoint-GUID: yDhi92fgphMbfeF1BVeViUFLOPk9hY3z
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-27_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxscore=0 phishscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504270012
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Apr 2025 01:54:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117154



On 4/25/25 18:57, Gyorgy Sarvari wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> On 4/25/25 11:49, Yu, Mingli via lists.openembedded.org wrote:
>> From: Mingli Yu <mingli.yu@windriver.com>
>>
>>   # ./run-ptest
>> PASS: tests/commands/test_authconfig.py:FC3_TestCase.runTest
>> PASS: tests/commands/test_authconfig.py:F28_TestCase.runTest
>> PASS: tests/commands/test_authconfig.py:F35_TestCase.runTest
>> PASS: tests/commands/test_authselect.py:F28_TestCase.runTest
>> PASS: tests/commands/test_autopart.py:AutoPart_TestCase.runTest
>> PASS: tests/commands/test_autopart.py:FC3_TestCase.runTest
>> PASS: tests/commands/test_autopart.py:F9_TestCase.runTest
>> PASS: tests/commands/test_autopart.py:F12_TestCase.runTest
>> [snip]
>>
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> ---
>>   .../python-pykickstart/files/run-ptest         |  3 +++
>>   .../python3-pykickstart_3.63.bb                | 18 +++++++++++++++++-
>>   2 files changed, 20 insertions(+), 1 deletion(-)
>>   create mode 100755 meta-python/recipes-extended/python-pykickstart/files/run-ptest
>>
>> diff --git a/meta-python/recipes-extended/python-pykickstart/files/run-ptest b/meta-python/recipes-extended/python-pykickstart/files/run-ptest
>> new file mode 100755
>> index 0000000000..289e68b054
>> --- /dev/null
>> +++ b/meta-python/recipes-extended/python-pykickstart/files/run-ptest
>> @@ -0,0 +1,3 @@
>> +#!/bin/sh
>> +
>> +pytest --automake --deselect tests/test_packages.py::AddGroupsAndEnvironment_TestCase --deselect tests/commands/test_reboot.py::Reboot_TestCase
>> diff --git a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.63.bb b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.63.bb
>> index bd20c69980..200e8838fb 100644
>> --- a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.63.bb
>> +++ b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.63.bb
>> @@ -4,18 +4,34 @@ LICENSE = "GPL-2.0-or-later"
>>
>>   LIC_FILES_CHKSUM = "file://COPYING;md5=81bcece21748c91ba9992349a91ec11d"
>>
>> -inherit python_setuptools_build_meta
>> +inherit python_setuptools_build_meta ptest
>>
>>   RDEPENDS:${PN} = "python3 \
>>                     python3-requests \
>>                     python3-six \
>>   "
>>
>> +RDEPENDS:${PN}-ptest += " \
>> +    python3-pytest \
>> +    python3-unittest-automake-output \
>> +"
>> +
>> +do_install_ptest() {
>> +    install -d ${D}${PTEST_PATH}/tests
>> +    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests
>> +    for file in `grep -Rn unittest.main ${D}${PTEST_PATH}/tests/* |  awk -F":" '{print $1}'`; do
> 
> Isn't this whole grep+awk chain equivalent to
> grep -Rl unittest.main ${D}${PTEST_PATH}/tests/ ? If yes, wouldn't this
> be more readable?

Thanks! v2 is coming.

Thanks,
Mingli

>> +        dirname=`dirname $file`
>> +        basename=`basename $file`
>> +        [ $basename != "__init__.py" ] && mv $file ${dirname}/test_${basename}
>> +    done
>> +}
>> +
>>   SRC_URI = "git://github.com/rhinstaller/pykickstart.git;protocol=https;branch=master;tag=r${PV} \
>>              file://0001-support-authentication-for-kickstart.patch \
>>              file://0002-pykickstart-parser.py-add-lock-for-readKickstart-and.patch \
>>              file://0003-comment-out-sections-shutdown-and-environment-in-gen.patch \
>>              file://0004-load.py-retry-to-invoke-request-with-timeout.patch \
>> +           file://run-ptest \
>>              "
>>   SRCREV = "6e0d1238cb4696a9040072a5a28a706e5775c552"
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#117123): https://lists.openembedded.org/g/openembedded-devel/message/117123
>> Mute This Topic: https://lists.openembedded.org/mt/112448367/6084445
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
> 


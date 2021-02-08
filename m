Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.60])
 by mx.groups.io with SMTP id smtpd.web08.651.1612802676478134522
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Feb 2021 08:44:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=IJIzYYBd;
 spf=pass (domain: windriver.com, ip: 40.107.92.60, mailfrom: yifan.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bK5pqgi7ggxj+SWRXW84UdEyfIMRBbZthY3oKl/3gBoB2BmB03CzCoEuZRizZf1oeM0iJ4WCB3899FZWkB+bl+3Fw1BQD4bGw/wlcIlwPwyo6bx066iKrC78jdh/Bg5xQLuI2675G+1revDWNXIYLlZxGnLEV5FDJyBB+DKqqDTQNDRtbmfD0Zc2kszXujsrqln+5bNYmMgU4T53zMnjw9khlkYldEcAglejVsLCf5afGoFG9K27Yjw9FvP0qPL3BMuZaypP8zTa3kyeg0ZsZWvFpu89i5knZ7LAbNHzIfi4t1yrQsIxG5SWRvGysZspPWpAIpTBrWLmk2mfB33E0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mdEiXoGlHRv3F/9MZslhGL7AgBQRY8VFRecx5hxKls4=;
 b=JXluME1mjCEdBjNB4itYwpKHzkzUOoWaMjpE11cYSn6vNSTe/iBeULXd2MYBvacFqKAl1Hwberwt11mmrBtyRRAzOk/QAe7CeeXT09ZGFD3flPeoq6bC49l1IsBqYL0tFV+YP8mDqkC56121EjiQhTn33stfaI5QovfrTG9xqpRLFcXHI/GHKdRTtmaFluqx2GZsu3OmSSi99a7n1KMIheetp+gvlck3YVJiwihWpTV/qFEEnLWf2OMRwltyW5JlAEtdRJ41K00jOYIkZ/dlgxCWIWGAGMtL/257p2LnnAvn7nxOa5JsjPvLqh6nnaayzRCn3SutZPfBsK5Uto47CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mdEiXoGlHRv3F/9MZslhGL7AgBQRY8VFRecx5hxKls4=;
 b=IJIzYYBd1mYkUMeF/hKQAaTDqujTgWIrtuINcm7R1lPCoKK6t9sznmF4OkXTn5v9YECCzgG0xmm4l+jR9hvMRcwkFpuECE12Vwa/Kzp91QK7ygvtDQWu+yR/IvfT8dUvMoosgNowPra9A5HwVsPBjWYCbwMUMGDnVqdyQJZ7ezc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
 by SN6PR11MB3359.namprd11.prod.outlook.com (2603:10b6:805:c5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17; Mon, 8 Feb
 2021 16:44:34 +0000
Received: from SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::1c2f:159e:f6f6:36f3]) by SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::1c2f:159e:f6f6:36f3%7]) with mapi id 15.20.3805.038; Mon, 8 Feb 2021
 16:44:34 +0000
Subject: Re: [oe] [meta-OE][PATCH] libmcrypt: blacklist recipe due to inactive upstream
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20210208163120.8609-1-yifan.yu@windriver.com>
 <60589066-b98a-ef11-2a20-b6e2866665b5@gmail.com>
From: "Yi Fan Yu" <yifan.yu@windriver.com>
Message-ID: <8308fc54-fa9a-28aa-924b-b5b9448cd34f@windriver.com>
Date: Mon, 8 Feb 2021 11:44:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <60589066-b98a-ef11-2a20-b6e2866665b5@gmail.com>
X-Originating-IP: [135.0.247.71]
X-ClientProxiedBy: YTBPR01CA0024.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::37) To SA0PR11MB4719.namprd11.prod.outlook.com
 (2603:10b6:806:95::17)
Return-Path: yifan.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.42] (135.0.247.71) by YTBPR01CA0024.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::37) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19 via Frontend Transport; Mon, 8 Feb 2021 16:44:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 19a93582-e70b-4e59-8ce5-08d8cc50d0c5
X-MS-TrafficTypeDiagnostic: SN6PR11MB3359:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB335971302EE1833414F15DCA808F9@SN6PR11MB3359.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SgEuwg0elZwA9uhWxfks4xsOdH+fkaHVM8BkTID0DRmWu7RYTwIrVChm8Jwq1eEtz/bkoxMfYth9cXPQBqbS47l9IUPPFBHYunbSWjRb5BIHOApV6hmN8+L5ZJjhjEfQRJbHops07rLu3ZBuZlgrWnvwxai87lMZiRAI3cHup0/sSbV2j2XChKEGk0o2eGhONUx1xMsy7YZOMTU9eT+N5If5+X9ttCp+DfbH3oGXhMi8XGJK2SxNp8cjINv2q475z8xWSe36v3kBUz83RNyv8SXeZdOlpo9knVHBrdnsTTkrgD1d/8E4+pHrxn2iiw0RqumZC1vb9yn+O0PMoEtMTt2y8YeBFL8KhNlzFtSDvGU7qHE1EsdhqUYE0n0bp71ABP646YJ5CSfXh2rTfCSnA2Q+kEXLcen0nVsDcxTXv6SehEGI/wRIaNI192hIz/8cNPxfKTWZpKVhg7+ucn4vCgM4u5r33l8KGZdzDaBp1NdodPhW9gxA7JtJgcbd45uxhsXxBzC3aKP1CL6C7dBpj9/8HeW41acCsYSGevqA46s4MzVUoK3YpzD4d+P/h+Yk66fZNr3t8OOJttbpaAYh0fFjB8VFmnIaUJx74E6ccE0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4719.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(39850400004)(366004)(136003)(346002)(956004)(16526019)(186003)(36756003)(2616005)(316002)(31696002)(6486002)(66946007)(16576012)(4744005)(5660300002)(66556008)(53546011)(31686004)(2906002)(26005)(86362001)(66476007)(52116002)(8936002)(8676002)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?VUJqYmcyUlJOTm1EcUFCdEhHODBHYmZpeVdvdnJON1BKNUlTeGxtWmk0WkpQ?=
 =?utf-8?B?UGFzbDNPN1BlV3ZrQVdlQ3VWS3VLdHRRZElHQ0NoczVqaW9Yb0lqNzdYTE9N?=
 =?utf-8?B?UzBSSGJFVjZqREdpc1NCNGdrcnF5OXJIR1ZCb1ZzSFh2YWU3anZHNGwvWnlz?=
 =?utf-8?B?dGN3YlVtNnVKTFFEZy9rcnkrUkFPUHdGbjRoc3Jva25kMFlLRUJCMDRBU05v?=
 =?utf-8?B?OXBxc1NuM2xLemc1LzRsMy83eUthdUNjSzFUMSt3dFFDVXB6dklFb3JCNTRE?=
 =?utf-8?B?UTczd2ZhOWhLYnV2K3pSU0U0cmNrQ3dMejlzdXMxQ2ZKYzB6ODg2N3BwenhW?=
 =?utf-8?B?UHJobXRkQUszNnU0OHc3Y0hBMTdBZXk5dU1SZ05yalk1QVg0djgyTHRRamtl?=
 =?utf-8?B?NWRMeVhIQVIvSnl4ajUrVTZBdmc0cGtwQnowdHViUzFyQzgzTktGM3FqMkUy?=
 =?utf-8?B?YnB0dFNYeHFEUTQ1dUpyWTIvOURDOXJRSldJbngxTzdMbWU1TmFXSC80U2Nl?=
 =?utf-8?B?K2xOVGxwb0xkc1FzNmM1NlJlR0RMM09EL3pQZXAwVlM0NmlvYXQ2SVUxZmxY?=
 =?utf-8?B?SkJhbFlQNFExN09rNjI5WTBZdmdtd2xHNjR2KzF3SmtmaUV4NWw4WHdUdC9P?=
 =?utf-8?B?MUdFblBBY3YvcU9LTUxBRmI5ZTVVNlpKZ3dybW5MaEQ4Y0NDcDk3WEJ1YWhH?=
 =?utf-8?B?QlRCRi9iZzNYQVA5SEdwS3ZkUTFONXBzK1EvZkpkdVNHNnh0amlNV25VbHU2?=
 =?utf-8?B?Z2dDV0dsNGtER0I0ZDVHMThMMlYrVCt4RVhwY3VKLzdZMnk5OTA4Y2VVUmtS?=
 =?utf-8?B?SDVmcU5wL242RXNndHl0czdJdldENDJRUU5POEVnN2xUaHBvNmR5MmNiQXZo?=
 =?utf-8?B?T0YzUzJ5eDBaSjBEUFdaNGJXY0liNDRyZktra3dDZUl4TEN4a0hTMU5NS2tv?=
 =?utf-8?B?TzlpVDdOVlNVLzJNY0Q2VG9BcjF5TnlvSnZaa0FPT29GUDBFN1YyOXdzcEpC?=
 =?utf-8?B?amw2VFNFdE9SU3Rhb1RzaUxxWkp3MHVyQjY4cDlBQnhjV0RsU0EzVEk4REdH?=
 =?utf-8?B?eFlBTk1WQ2Z2WC90Njc3RExQVjhXSTdTODlyc0I1K3Nqa2xOd09DQ0paSkVw?=
 =?utf-8?B?cTBmTC9PTEJNUVc4VHl2OExNdW1hMk9HaUUzR2U5RUIvT0xjMHh5MDhldGto?=
 =?utf-8?B?d29DZSswSkFuMzlZZS9LNnk4ZFg4WXJ6YzJFV1Bvb0ZHL1RzYi9UTGdWc0RN?=
 =?utf-8?B?Um1qdmdkZ0FrNEw3azAwNDlaRWc3QlBOMlFZZGVTQlRFeEpNUWphR0NzU1Zm?=
 =?utf-8?B?WGNqMXJyUlZmZDY2SE5JWW82TjZvc2svZ2IwaGJxcnIzUThUdWlmS054VTVN?=
 =?utf-8?B?SUJKdWEwbStrN0FvSWxWemZzYVNLdzVMMzBManpQMWZoRllOWitCOVNuNWtj?=
 =?utf-8?B?UEg4SEhrUjJqRDE5alpqV0h2RFN5Wk1QV1ErWnRrdXZiMXVKY240TlJuaTJp?=
 =?utf-8?B?UUlQaURrSGdPeFBwbWxZcGNLaDliZ0lUWVBOMWd1aTYydllpcTRReTA3Y3Uy?=
 =?utf-8?B?SnZLdFFVOG9NTjMwMnY4bUdrcHYyb1B5cHo2R3Uvc0piRlhubmN1T3ZTUVlW?=
 =?utf-8?B?ckRYQ1RlOEFYU2Jtd0x5MGFIaUtpZWxnNWtpVGJtU2N4QVRtdnlEaE8vaVR4?=
 =?utf-8?B?Z2FNdEZRSTl2TGVGaGIvNGxOcHhETXNFMHZzNS83cnFjeVN2V2ZsY3ZsVE9I?=
 =?utf-8?Q?kQCXub26dI89OJ7paZgJcacMs2qk3itkG7fCJJo?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19a93582-e70b-4e59-8ce5-08d8cc50d0c5
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2021 16:44:34.7063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QQpAhdtXZ9GfXCJsuxwVSnHaLg/FGKKWsaCkkce24XThBfJLHYo1GOia+SxXRZnyC/u2x1JM3dVLjlOsMW+BEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3359
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

i saw the patch ya,

i think is appropriate to both fix it(immediate answer) and blacklist it 
(long term decision)

If it breaks in a future build, we can just stop caring about it

On 2/8/21 11:33 AM, Khem Raj wrote:
> I have already sent a potential fix for this recipe to build with
> autotools 2.70+ so perhaps we can avoid blacklisting it
>

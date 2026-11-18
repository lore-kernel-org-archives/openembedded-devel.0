Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.16])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10936.1795003046691737963
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2026 03:57:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=xPNGiZl+;
 spf=pass (domain: est.tech, ip: 52.101.65.16, mailfrom: yunseong.kim@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kh6bIQPyfJJ1OEPCo5o1q3M4v7RN1GzJnKlQ5QedaNgnAdhNN0qCIKKT8fgD//oFIHSM+jUuhCnjTTGmBXdltdqAOjEYtzUpzyk1qrapytik6A3QCpnZs1jQN8tShdYQbJoZnIsasWp779Bzaa78gVMFxIRo+m6ZFDgpeaDFy2hthRir2IUwXfrzqQ/PjNXOZMcxJlJOzKur2uWjZ6LP0/y9WdcwU8+g0oDzuMB95rw7IIpqE2HUv/KGWepwnwZHLZUK2TUNPsSAqOwwTEqONP5YNzdKwo5d4hscON0VgMLY2ewlr/hmLnSc2lRiCvsTNk8phwUlrE2KqdhTS0GW5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RVaeWc+x6uVSlqAFGDHZ5faqdVQqhgciGrVlfa5GlNE=;
 b=SZStM016Z/nPNH5JAnwz+4yeFHdinhfsCMQmzhL721dfi01oJvNhSoMOQVr3pLtm2hwAs/SnmO6UxjtRTmGnp42/E5GsNmJR5XyIYXX28g1BnNGUNzOqgrQ0jMSwJo72YPqM5Zu2uIYkJNYFIv6p6Ogzj4rjlQR9k2UvFnVnC5ebvNz2W/xyY1QEXSQKwlU/NKegc8zk3KXqWomtYYjme1ovQcJIqgUVVklm54QQrPzVnS7xgoKmrHF+kjJdFQz7tkSyPTCV4VMlMSR8nCTsjACQ5A+v6zoEwG86Ec0C0Ob0dfsCaNeswDIG10l6ulndCEj5TqHx6F5VwfjeRNhxGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RVaeWc+x6uVSlqAFGDHZ5faqdVQqhgciGrVlfa5GlNE=;
 b=xPNGiZl+FZqIcxQ4LKLthXFA+lcKj4CMc/uh2/LOf38bqlaaIkBvDyntcwwsw4kBNyrn9KUTzpU6Iwe9tuyDsp4e9eb8IEmCfR+7iiEq7ux6rcugKAC6VQCbjWacubwku1wjGvEgYzYzFc1uU4iK8jM24oy3QzfqVtbPgbCY3ZyokIbss956Kcppe2WirQmz5IMbO29zN1Thv2W7I1huNox1GwTA/t+W82fpGhr2gAiEkFFF1LR8qWkFQsBTEp9JUJ44HpDsrBUq/g2TmvboSn9bffCEU/3uFRC84LBwY13JHTV3/qCZoXeOx0kM4C4WyxfBhfBkCdH6FGmuVMYpqA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from FRWP189MB3398.EURP189.PROD.OUTLOOK.COM (2603:10a6:d10:1a3::22)
 by AMBP189MB3216.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6aa::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 11:57:22 +0000
Received: from FRWP189MB3398.EURP189.PROD.OUTLOOK.COM
 ([fe80::4658:dbd6:d572:896a]) by FRWP189MB3398.EURP189.PROD.OUTLOOK.COM
 ([fe80::4658:dbd6:d572:896a%4]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 11:57:22 +0000
Message-ID: <96354e3e-1a5c-4b79-a42f-8c5304549c6e@est.tech>
Date: Wed, 18 Nov 2026 12:57:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] vock: add recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, Yunseong Kim <ysk@kzalloc.com>
References: <20261116145516.11115-2-yunseong.kim@est.tech>
 <CAMKF1sqV_euA58RmpGZvWgwAHqs5W=iyM3k0Mrk6v7sP3Yj1Bg@mail.gmail.com>
From: Yunseong Kim <yunseong.kim@est.tech>
In-Reply-To: <CAMKF1sqV_euA58RmpGZvWgwAHqs5W=iyM3k0Mrk6v7sP3Yj1Bg@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0489.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::8) To FRWP189MB3398.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:d10:1a3::22)
Return-Path: yunseong.kim@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FRWP189MB3398:EE_|AMBP189MB3216:EE_
X-MS-Office365-Filtering-Correlation-Id: a039dae5-70ad-48fe-5e59-08df456b1a7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|22082099003|18002099003|56012099006|4143699003|11063799006|261026140227099003|261028144727099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info: PyYleYNks4Ebgycj1kO2dIcXB93lOOUpn04i2rS8yLkSPPrfd4M/scPjQLyZXDxxJH0VbY11qZgPpCT8S3MAcJbK78CCuGkfhq9+KoQv7fireXpInIhHlBdkYaaKVxH8EQzVJ6pgEKG7EPDoIzREBBtkvspvKQFfIeaScIEi2r0JliA7bzX+g1WeUPRYEkKUBUjmGNNwdcDlejYiU8eP68EMh0GWdx04f7+XXI0Pcs65HDxiNtTaneOpF6wsHjg47+TYjOpyXqWYy6wLn+mj/4C/uuEfWs9EVQZ2iVoHLNOa7BYxyr6R9cntVYuhv8YNnkHvae34INlF9EJ014R4/oR2Mwqgswq3tnn04HiaZB9UPQjqXBdtzG+Vh21kKceOxn65by52R3r7kEDU6hYlVb6emY4FgYKrPftZJebd3fVZESl0q+mAwvKTYCTmeq43OfZWo0GDNeed+4QSMeojyjf7ZHeX6v7D6RkiAdAsc6nXrsB3iJhUqOI5N3IzVgT9VOJIzTjZFZpfvKlFOmf+fGYOQALoJbksdJTG2pU5+zGijERTpsKkG6tUT1654/3Y689/sPOKfppWvftWt8HYDnDR3K5y31513XLOavJHyunyAck37fnSuW+MVWI5Wg0BN2m8OTVqRS6FRgN0Of0SWVIJ7vedQHPmmWnkF6rvRxU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FRWP189MB3398.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006)(261026140227099003)(261028144727099003)(261022105027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEE5bkxlOXBqOFlOanQwUjljNlhETGhwcUNGVUliMU9DemlaTVlyaUxvSkU0?=
 =?utf-8?B?QmlXbS9wVFJoejJ3QzVBTDZCdHNFVkNWdXFpdkJoNnlnOXErWmNHeWJ1cFRi?=
 =?utf-8?B?STZMMjZBM1JaWjhHcmMzYVEvSlk3bTlYTFdvN1IycWNGWXNNa2tiWmdBTkJv?=
 =?utf-8?B?c2IvS05aSitPN1lUckVnWVpDazFHVTZ1emQwdzlwdnhINWpTVmR1K2FncjlH?=
 =?utf-8?B?NWNlWW5lM0Q3NmJTWGFaKzFWSzFQeG1hNmMxMFFEeXdFQmRtV1Ayb2NzeXU4?=
 =?utf-8?B?TEdyNU9LdzVDbGJXQWF5NjVKVGRVSGlRbTZSNWllNytHRFNZbE1qY0xuRTBQ?=
 =?utf-8?B?a1pqQjZBc3V6d3Z0NFZPRDFyM05IVmNlZHdnaUhKa1A1a29kaCsvZjZUcE54?=
 =?utf-8?B?NmV6eG15V1BGZUp1VnNhSUZTYXRLS1ZFUk5yanVzeDhRa1VFWEZhZy9FRG1I?=
 =?utf-8?B?bkRlUFNJcnI3ZGNyRUhmSDVyZ29Bbkk1YkZNWGV0alJqWDZ0RFBWM3VzbVVY?=
 =?utf-8?B?bDVCR00yVDlCUWpOVWVNVEtCWGd2em5GbmtnbzZ1bUN5ZjhnelRTOHdoMXdh?=
 =?utf-8?B?OTZWcnJOb2dqaUplWkY2M2IvOFJaNjk0cmwrOHBRb0syT2xPRkY5YWpRczRK?=
 =?utf-8?B?NCt4Z1hkUHYzdWxjUlBSaU5PY2wzSGdGb1J4TU41dURuOFVrM09QTjU2bi96?=
 =?utf-8?B?R2N0R2pNUHNrT1IvZXA0cVdjNzArK0ZSWkNpbUJUUW5EbHdPQm5WeUhDTU9D?=
 =?utf-8?B?bURkRit1QzVNaERBNUpwanNjTDFMRFFMblZNcjZpZXhvUkdzTnNWQlk1U0hn?=
 =?utf-8?B?RXJEb2kvUktpd08xQmdnbDJCYWN3VWxSU0NRUmRtNWJ5NW1DOEhkZzR2YnVI?=
 =?utf-8?B?RkNCUEJoMUt2NzBJbDYzcCtrSmtvOXJGZDRDNFg0VmJtQkhHUVdCTjVGMktj?=
 =?utf-8?B?RytTcU5IV0k4cGpkWUErYWd2WjYrb0J6bVNUdlVlcFpoWjZFa2xTeTNpYkkv?=
 =?utf-8?B?aWtVRFNlR3pCa3FqUVhsQmg1YVJnSEJ3L0tSRERhWmxXMkpSVHZsbmN3Rjdi?=
 =?utf-8?B?bUxsaEFmL0U3YzRBNXVTakwxK202Smo1SVplbHJvakFkUXFrcW9RUlNXZWpt?=
 =?utf-8?B?cDhqUm1LK1A4RFdSSHpNV2xmUDBxTWUrc3grY01BUGxiSVJkdE1tZUlZc3dr?=
 =?utf-8?B?OHhXbU40SkVQcXRpcWR6N095aXV1dmFQT1cvSFNHNkozMVlNd3Y2Tk5TbGN4?=
 =?utf-8?B?T2g4SHRvK2tQWlpXWDFBMkxja3EzRkRIWksrRWxLL0w5WE4yMCtRWFJoL3di?=
 =?utf-8?B?dUhrZXFHOHFlRUFUWVpPMUVENG9BdHRrNHBQWTc3elhySUlTTXdZaEdyb2RF?=
 =?utf-8?B?QTN4RHNCK09DQUtPc3pTcGd4S0xFMjVaUWpUMXN0QllOTGpwOUNIRDJ4NDhQ?=
 =?utf-8?B?aW1VL2lKUEZuamxyaEhyTkNxamQyTGN4TjNhVzJkVU8xajFRZjliT1pXb25q?=
 =?utf-8?B?c2NrR3JjTVBVS3dXU3duN3ZlUjkyQThYczZIQTlMUis0dDB3UmZlSFRuSHNJ?=
 =?utf-8?B?bWE5QkJsekRJOW5Ea2h1YXQ5N0V5aG5xeW04cEk3cWMrMWVITVNlbEdKUFRk?=
 =?utf-8?B?aHNpUDBYWGZrVmVtMFlRNHduM3kvR1FMam5LamUzVzBxbitzUXRhVXU3d2ps?=
 =?utf-8?B?WHV5THNKd2s3SFFnK0hucCt0bExzdGJCa3E5Qll0c2xzN2M4NmU0L0ltcWtG?=
 =?utf-8?B?cG9BcytFODV6UE9jMWVIM1hrbHp6a0hGTFBXRlo4Z01IbXp4WDMrTm1mYXMx?=
 =?utf-8?B?WVlJaU9YNFRTNHNrd210L2JGTVZtVWJuZWtLcXhQdXQ1bmZOa2h0L3lveVlh?=
 =?utf-8?B?b01sVWxZNmhvVkhIaFdtb005ZGVCeTEvTmxkem53LzlmQVUrZ3JhL2V1cjk1?=
 =?utf-8?B?ZHRtVDJOcDE3UzRLczFWUEFTMURlVWdBaWdpWEliZjJzMjJKS2VqSXQvTG1w?=
 =?utf-8?B?TW1YdmdGMHFxTHhHYXZSdmJXaGxZYlFJOVl0VzIzS2NrM1VuQTJXVm1zMk5z?=
 =?utf-8?B?MWhod3RrVTJDNEJmRWlIS2xaRE5xK0xMNVdQTDhaYUwvTlYwUzFSRVgzN2NQ?=
 =?utf-8?B?NjhHd3pWdUdudmV2Y2RmVWJJVG9HR2p0Q01VNG9zSzlXWDZGY2lrR0tUaTNW?=
 =?utf-8?B?Rkh6d0VlZSsrd3NWLzFmTDJhSUZ0MFVxaVRWVUpoQnZJTUxvWnBGQmx2RGNo?=
 =?utf-8?B?U2dIT2VKNU8yVWFMNWJUbDVKcDUyUGRTME5oSnpVU0Y5QXpFYXRWMnJTK05j?=
 =?utf-8?B?WUFKQXh5bGFpQU1UWXc1VXlFS21zUzhzUjNJbWJJWVVlcHhIWUlkZz09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: a039dae5-70ad-48fe-5e59-08df456b1a7a
X-MS-Exchange-CrossTenant-AuthSource: FRWP189MB3398.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 11:57:22.0334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dbd/vHq1gBLd+L8n2wdAR4ANAPwDXFsKyB480HC/GsMoBI5fu6qVzX7LKHpleDscxFL4a3sGNVjFKROAJNwv/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBP189MB3216
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 13:03:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132653

Hi Khem,

On 17/11/2026 9:58 pm, Khem Raj wrote:
> Fails to build on TCLIBC = "musl"
Thanks for the pointing out. I've found the issue.

I will send the v2 with the fix.

Many thanks!

Best regards,
Yunseong

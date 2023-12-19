Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B41BC41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 16:49:11 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.40])
 by mx.groups.io with SMTP id smtpd.web10.1011.1703004546464880904
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Dec 2023 08:49:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@vaisala.com header.s=selector1 header.b=vMUowgAP;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.22.40, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JYhFwsfWWTIBkU73QN/ejol324SH2iqGUBeAFoH3XBfzPVpfLy6nFDRnrfC7SEmDgJ5yf+lO6Awow9+Iqd+SqFgHgFJf/m94JaqchnsSAd7Z57hUT9xoVgxld+JOXhk8TlYkJ4DSxCylCJ+N+FDOuyrz+GmrfDySUCjWcq5gjlXlH+3UXgWrzOAX3A1UMe3i9LCqKjbgUVzztYIw6+8K6DfIca9cuUYNM5Y48N1+bAiWMu+0YEJxAWX/+9HVsdy9r8u33JXrO4+TWGjT0xGXPyIFhd7HbWW8EzNKwsMFtIdEIv7nEF6aGLkWMxS0zRE28hCrNAWWVPnizBvwHZZYAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sUNpIDSxXufmzj1UDC6weXpBq+WturbqwARhGPomNSU=;
 b=DtYSVzm3IfoRwG7OI7Y4xYckTlp5IOst0ST4gMjPMfZDWGuH2unsDfZylgcJkvVtx7ot1sAulVet96UmNv343T+c+bL5250tg3Hdc4RUH6B9+DzDo6tntuGsqA43Ml2YJ/40t4vekZwOpPKb8daLicUurVT9etOVo1fLZ8HmwQ5/FycC10St87ATYP6v/xn4G1Z6tTD8tylDivcHmfUSBSJ0OyC8sUMPwAt+JN7Or8GWZLJMXJZ+ZpY7zVIY30touEXycLaszAuutbmUIqQPRa9rFQ899wvDHQAOjbPxKd0F3Uq3H5gzD0KfNM/7eWMOVrBSztf1QDT1MoD/U7ggHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sUNpIDSxXufmzj1UDC6weXpBq+WturbqwARhGPomNSU=;
 b=vMUowgAPQ7VibgbMfPxZvt7DdIye5HKCheXRNDZHBcMFxoYUycUecKfwIU8eDbNitrWLK6OyuH+1OHCQevq7z60k/YYj95b8+rLc40L1whpNDbWaAYVn1tUz/uTMbZU5Fw2PyDxKSlncO0i9ct0nf6fzs3DR4KJfa5AP+/ghWSxde3khrQ3Mh7igkKBwJDFuRRIdU4rtaTj3LtryD8gda2kcwrNHTQYCozqYhaIjUcctRzxE+rHOsi7fbtGcP50+QLLvH1cknOBTLm8XTdUaW1J1VXWyM965oBdgzgSMzYDOiamw0eafXELmjQURToMbMArotUROP2sJgVeMzi89Ug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PR3PR06MB6906.eurprd06.prod.outlook.com (2603:10a6:102:83::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Tue, 19 Dec
 2023 16:49:03 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::820:f7b6:7f2b:324b]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::820:f7b6:7f2b:324b%4]) with mapi id 15.20.7091.034; Tue, 19 Dec 2023
 16:49:03 +0000
Message-ID: <323e348c-13c2-4689-98a6-da353b970bbc@vaisala.com>
Date: Tue, 19 Dec 2023 18:49:01 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCHv2] pkcs11-provider: Add recipe
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, quaresma.jose@gmail.com
References: <20231219162705.3865469-1-niko.mauno@vaisala.com>
 <CAMKF1sog8ZgKeTN6WyOK77zBKTFA77_kVFmBc7FKwDaTQFr9Pw@mail.gmail.com>
From: Niko Mauno <niko.mauno@vaisala.com>
In-Reply-To: <CAMKF1sog8ZgKeTN6WyOK77zBKTFA77_kVFmBc7FKwDaTQFr9Pw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV2PEPF000000FC.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:1:0:19) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PR3PR06MB6906:EE_
X-MS-Office365-Filtering-Correlation-Id: d6e4e603-e7ba-4101-68f0-08dc00b2681a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9ZnppHCWcNh+f07yccvDNc3XK1Ycshqym0gn6HOeVC5y25bFuk5MlbwU+Uf7rbZiMEPPg1jrDPGA1m+MDYKcMScWkAv8+M7l4+KwqT+BHRlEF4b9QEw+CIPNR7QPd1c9GHDwP5lZeTpDXsOlxjtBwJVJXAbt9eN/RLg1r0edJtUs06AU1jm+5ydx8DMs0zagcguQFmLLuWRt0M9bSGaBFRbaNsmaC569s+6neDKaXG3VPYvuvc5st9n1C0ms/jxMV0HAviqjywVuNpmde42mc2+0wTgMFKEhsVq6FmUJuu2LVCNJK9xFr10Gp0UY3aHo5ecbxMZlN6OOA0+u+XGci2DhG098Arx3igSo5HPP9F+LWLQdb4CF4SqdtJVDd9Ke8Bq/oSEb2BAjqss+sucntOT0PlYOBGMPvn/3wzt0/15ZSPqwMLVRzPOax4repYWWti7d2T2V2oSJxDjL6TVU1/wHOISvhzfqenBiCx3+QOl9oVlaPHKaqdtdXigZYnga2e//Yps69Yynsl0SeNH4fY5fcul9Pe93MJldGw808DZUKrHFfBjI+ctMkFInfqH4HiRWLG3Cii0IXGY8/XzK7vacfvOG3WGPEgTap3NAcVvy2e7D9PYYsKzFZjRAvQbJcl3lv9rP5d+DAldWZBEQIw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(376002)(136003)(396003)(366004)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(316002)(6916009)(66946007)(66476007)(5660300002)(66556008)(2906002)(8676002)(8936002)(4326008)(44832011)(6506007)(6512007)(26005)(6486002)(478600001)(31686004)(2616005)(86362001)(31696002)(41300700001)(36756003)(558084003)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cnlnMWIvcGVZdmlpdmlHWEZVY1FUU213ZkVjU09VamVBczZLbnlaa0RXMXky?=
 =?utf-8?B?Yml5czJkZWQwaHhNTTE5OWlkeGNtZkg3MFJrY1VFY3dpQVBsY0IwOExtcFow?=
 =?utf-8?B?ZitOaFJDZkQ0aVJxZWRtNVplQXFoODEvbVhLbmdXaXVsQ1Nwc0htb1k0ZndD?=
 =?utf-8?B?YzJPdzFidHBCVFZBZERGZE9wSjFVWDExTlFPRFVxQ1o4T0JCUzg4RnFQRGJ3?=
 =?utf-8?B?TkZXU2VxSS81S3JFdWU3ZzhVR0JSZ1MvSG40ZDhxWDE4MlRSKzlhbCtLcGlu?=
 =?utf-8?B?Y21QUXc2VndzUkErQk5Ib1VwODc0WHJxNk90bHZaK0ZHSU9Gbm51Z2xCSXp4?=
 =?utf-8?B?SXlZQXJWcmVHeGlQdm45aGFPMWQvUFNlVmFiSGpJcjRWOXdyQk8wQjI0YXlE?=
 =?utf-8?B?U2YwRFViRjdtTjV4RWUrVCs3TzNYVWlKOCtwT0RzVXIzYlllTHpiOWszbHNT?=
 =?utf-8?B?RDNYR24zeEV5NzlVdE5YbHNqbE0zWWE3ajY4Tm0zYzQwZHZlaTZMclpMZlMx?=
 =?utf-8?B?UkZ5TEhkUUdBMU1wNm0rNkh3NDEzNk9uVnh6N2s1WWl0aTdIZXorcW5pSjlG?=
 =?utf-8?B?bEV1bzdIVGVRZi95eDBPRDBhSGJVWU0rdlJQcGlkNmdXbEZkbVpKRzdOcndH?=
 =?utf-8?B?MGRzRFFIWWdvcTdxTnZtMFlQaGhkUkIzcHlFWWJVUGYvVnhkOWVnUk9lZ1lO?=
 =?utf-8?B?MDVRTUd5SXlTVnlKSGgzaFd1V3pybEJoU2h5bWZHSGVZOXZlbXVDNlR3MUJz?=
 =?utf-8?B?SHg3ZGNodGVRWHdQREJDYjd6elRHeWtRVmJFaDVqaHVVVEJmR09sQi8vZDV1?=
 =?utf-8?B?ajdVUitJeDMyVWhGbExxVFRXMEVBN09SWTBsNUl6SXlqenZXVXAveWFLci9j?=
 =?utf-8?B?Z2RNS0NjM1FYRTVlaEd1eU5MT0NDdDNLUjk5Z0k4U0VoVG4rZEZBUlU1dHVn?=
 =?utf-8?B?bklBa0NwTUIwVlJONnZNRmN0U250RElPajQzdXZ3TGpBbjR3K1ZXNktIT2Vl?=
 =?utf-8?B?bFJzSVl4aFZMeEVvSUtzYXRwOUV2T2U4T0RJK0NWMDA1N2tVN0VsREh5bktZ?=
 =?utf-8?B?U0RLLytoZXhQQU5kR3MzUWNoSGR5TEV0YU9OTWhMc2VGcndHbkpDQzRreDJT?=
 =?utf-8?B?ay9lczhQSjZSVnR4Wld0T3NNZG5lcUMyelR1YTBxb04xYm9LdFl6c0hJa2pK?=
 =?utf-8?B?SjEvdjRsdkFIWEVHdHBrRTkrV2c4WXlJOVljZXVCbVhIVlRVZ0wxK0ViTHNQ?=
 =?utf-8?B?MitOZW9xajkzTm9Ka25aU3pvZG82dmpVT1A2b1ZxU2srcDhsb2gyalZ2ZTdI?=
 =?utf-8?B?dGlIVjdPKzB6VzBxU3FVU1ZqdDV3MmQ1cjZ3RXkzdStMREhDMXAvdys2bXJV?=
 =?utf-8?B?cjBOa25UdTdUNDh5cHN4Q2FUMTdHUXkyNlhMeFNRWkttaTV6czJrZE43czlp?=
 =?utf-8?B?ZWVVbVVXYTFnSUhNb3R5YXBBMDZ3S0lVVjVWSVordVpSY3ltTSt1bWxVUzJQ?=
 =?utf-8?B?dmVxamwwV0RRSW5MbllJOEh2c01ZWlZPb08yR0cwbnRWcUhBNGdqL1JQU0RH?=
 =?utf-8?B?ckhmVHQrN3A0ZjdyNDdQMDdKMGNTTUtDWUxyUXpXWW4zVGRObnpYUHc3LzNn?=
 =?utf-8?B?bk5FQUdIVGNMclRCa2NPdlRibjVsdUFiVjJmMzRod2tsbzhxdG9OREhNTjQ2?=
 =?utf-8?B?NzBSb09JUitFMFFXbExubis5NllnaVRvR09UcUkzWXl4dEFoVUttTElFTkNs?=
 =?utf-8?B?ekkxYjhLNkRZL2czQ0I2YlNRd1prenVoWkVZSDhHY0ZhVk01U2ViQnZlRExB?=
 =?utf-8?B?SkxmeVY2TmIwSi9nbU5GNG9HRDVQcHVONnF1ZTMxTnNXdnNIaThIMHRTRU9q?=
 =?utf-8?B?a1Jkdmw5SjF1eG8rWTZtY0JyQXF1Qlg5SDNBNGdqdXZrR3hWeS9HVTM2aWQ0?=
 =?utf-8?B?cUd5ZDExT2hDKy95c3dZY2dTNDBsSDczMGx5bURQdVcvWVl4MFdpcTVYUVV5?=
 =?utf-8?B?a2p5T0VXSnNkVUtSVWd1ckRRemRNNllMRUczMk5ZS0xMWDg4cVJybTdRbW9o?=
 =?utf-8?B?QXNjUVppS21RcEJnYm0xTWpQempkdSthaXB4aTlMU09nK09rQ2cvVUgwek1G?=
 =?utf-8?B?QzBtV1hTNDB6SXl2QW1taE1ZaEZycC9HaElDL0VQWE92ZXVTejMzYkYreU9I?=
 =?utf-8?B?TWc9PQ==?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6e4e603-e7ba-4101-68f0-08dc00b2681a
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2023 16:49:03.2077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dpdWqNgtZzQxwI/7Sm6QET3BNX5Tz7c+sdQLNA5hX4hZHejxpHhYTZOKDxpI4YnwWNw0ODDVpfpJxqO9HO6NDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR06MB6906
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 16:49:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107642

On 19.12.2023 18.36, Khem Raj wrote:
> I think SRCPV is redundant here as we do not need it on master.

Thanks, now submitted v3 which omits SRCPV from PV value.
-Niko


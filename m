Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.53])
 by mx.groups.io with SMTP id smtpd.web08.8364.1616071504663114789
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Mar 2021 05:45:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=FxtQQexX;
 spf=pass (domain: windriver.com, ip: 40.107.75.53, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DlmBBwcUdTOtbI0EVTBxIVJeJHPqxKqY4+UYnv5SnKGC/Id6rLkgdFuyiNH9SaE9lO4dfADhdR3Rq2CHD93GwIe8DnSPIuDLfp/SXXuqRcssdegeldPj95onFrY+o7DI5n4AbdvCPBrGFUs6jR2INFYFk6hXki5tOkoWJ4Fv+DRlri/nJZSksi1306bsm4SSRGtqXk0tWwX4/dfiPN2oBDLTjviEhRBj3uDbJ6DKJySP1QffopH1PihZ3w4qRq1rhfC5roE8b0ePEGJ7NnB9syQSykRA3otsyXSBa/TXYItfai0/llM51AgZms1l6I3Vc3QBIlWkbb8zz0pLaqN8lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Fq8+GTQgAU1PQZWv8rj1cpK7Y+AXcupg4F36drUzyo=;
 b=dCQyuTvfx5fYBEgDxh87tC/XhUEcKqQ7GyBKyXPlQFelchkovgPQiSm4DztxXxSVDQz0N71WqvG73KaqhhS63/0drTP1Ea1pX0GiojYHyT+XKFw+pmNUK+EJg5jIYnlynPSYqLdrn4fHStTp+Fdirk+dN+RQ/9GC+H4u6EyEiWCVQIIhSlZoBS37lHo8YURZ2MM3fNGn5jzKbu3iqRwha/sUsF35Fy3dAA5OX6/GgdYOggtFBp7dw2lSJlE65GHBkSiR3lxtWCWkyaRsrSS6tk3HcPDPlmMq1Zv2TXzufTZB8HsMsUU+4CH4X1dRtX637+IlO0RwEUYvmlF3sb29EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Fq8+GTQgAU1PQZWv8rj1cpK7Y+AXcupg4F36drUzyo=;
 b=FxtQQexXGMjfPikEBapdTaUk0ra9RGAt6IHBwkiEax7CLKick8C8xyqO3ruXUFpXslRQaF78PboKLIqzjBdzkY5YXxopt/GsCSLYpLTIpWVLmt3PApZMXYz4+yvX4m+nuOzNEIwyvG+LujojXZj8yy47onqnKoEtgwCCxvR+7kY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB5184.namprd11.prod.outlook.com (2603:10b6:a03:2d5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Thu, 18 Mar
 2021 12:45:02 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::89c3:3b4d:43c5:ae76]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::89c3:3b4d:43c5:ae76%5]) with mapi id 15.20.3955.018; Thu, 18 Mar 2021
 12:45:01 +0000
Subject: Re: [meta-python][PATCH] python3-pythonping: new package
To: Bartosz Golaszewski <brgl@bgdev.pl>, Khem Raj <raj.khem@gmail.com>,
 Armin Kuster <akuster808@gmail.com>,
 Tim moto-timo Orling <TicoTimo@gmail.com>, Derek Straka <derek@asterius.io>
Cc: openembedded-devel@lists.openembedded.org
References: <20210316144242.5951-1-brgl@bgdev.pl>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <4f0d6775-4470-4dec-b823-6c64d94dcaeb@windriver.com>
Date: Thu, 18 Mar 2021 08:44:58 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210316144242.5951-1-brgl@bgdev.pl>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN9PR03CA0186.namprd03.prod.outlook.com
 (2603:10b6:408:f9::11) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN9PR03CA0186.namprd03.prod.outlook.com (2603:10b6:408:f9::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Thu, 18 Mar 2021 12:45:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f151f7d-21f2-4955-af06-08d8ea0ba50c
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5184:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB51843B8AB66FE4556F4793DE9F699@SJ0PR11MB5184.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ttRnwG64s4DnhxNXRyrNzZ3NDVvzw0rN2XYsdqPrc7+aDcnydLOAhXAVeraAkbpZyS5v194hiX8ZMc/8fSTRWCgCATIKjjywQKxOUeTasohPePbiaHUw2QQqaELNL1bEJfYB9Nvrh09WZHBYzoRdZ0C0/HT2ZOZ0kKGAymtXojgX+qDCtxu/ZbL9rFdaj7Ne3rRXGvnoUc+iWnOnHj6lVyUte3uTq+KJDQnpTj97MWVPdKRGSMRIlU2aq/wf0+/rjEnxgkjLuPN9tJbO/fiTD9Nr1JwPi6ysGDDq3JirKEquqImaVZM2YlzaZSplMVGbpYEXEY9bw61P6QYcpee5AkNl1LBHqY39C8aTZgAGe5DhTHfkGDUIPjxGf9HeGQQe4wLI0qgERSBLXBCpgvZTcO6BJtE+NqOPEsxVKjILGCtc6ah7fJ1wGNFoc7s7b8IlIMwC6+BraoqGqitChiDZ5lbXeibaK5p/VXSwY718WDvnV0ssP6HDDlOauv9L3tRl8eYfPuVxXSKAPr91ZCMe3r7EhcHs58RPqrudCuykXri3QgCh1hbMblUydfS0Deahm/J22wIxoOfKSgRQ9f+S3An4XbISXARyZXw/OF+br9hpvLCzThkeZvQbxmF6CrZ/1GBGI04hbfDfmopKATGyszQ0GxWViALfYwxRL/kxNseTsD2lqgKoEG/CkfCb7+PWj+rx/hiFjCZTNm8MP4L1CGIYFX7He+dvCTulr4j0ANk9PUw1Ouy5z9t0cbVNsNAW
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(396003)(136003)(346002)(39840400004)(8676002)(478600001)(5660300002)(316002)(16576012)(186003)(2616005)(86362001)(16526019)(8936002)(956004)(26005)(44832011)(36756003)(53546011)(110136005)(31686004)(66476007)(4326008)(6486002)(31696002)(66946007)(2906002)(66556008)(38100700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?NGJUNmxmR3pYQ1VKMk45QUZXOXVjMXkxY0xWMG1UNzVYbXcxcDQ4dDVRbUZa?=
 =?utf-8?B?Z012bEtMd0JrRDlaQ3ZkYjYyWjdWczlQNDJnRkk1NXVyVlZvblIrclFVd3Zx?=
 =?utf-8?B?TTFzQUo1Q1hLMUlva2xqZEVOaE8vMkM0N0hnTmgzV1ppenZWZklGTE81bnVI?=
 =?utf-8?B?OEVmZ25vc1dEZGpzNE9mNW8yYzI5THF5Yk10YjkxNUFPNWsxZzZ2Q2h5MVpM?=
 =?utf-8?B?Y1RpMWxrS0NBRnFWYVdVVmJnUFdLcWpZbDJ3cFZxTUxnbWNrNE1JYUFlR2dy?=
 =?utf-8?B?N2dTSWNSbndEQ3lDdnArQkE0UE0yUEVrTDc0MXB2cUR4VGY5VThuNEV5Wkp3?=
 =?utf-8?B?NFZRSVI2OGNqVWJsMWlmaktWU25wSGJxUnluemZpRVQvVTd3OGtndVk2amlK?=
 =?utf-8?B?dGt3Vm4xK2d6M2pOSkh5Zkw0eEtZZmVNaW50UWxMY210SHFxR1dCSXF1dTc3?=
 =?utf-8?B?eXdMckNzdzhxc0FSTTNack0rdDA1dXJFUStqenRwaVNub0xmczlxaXpzTXJz?=
 =?utf-8?B?MW14UVZxaWpkeVZmSHBmR2RVL21iVmJWelpHUmtmZHh5NkF5OTY3alJsd2Yz?=
 =?utf-8?B?VXMwTUtmM3hZWUF5cnhzY3RZd0NmTnZLRDRFT2lMSFg1TmNxSi9jSkJsWmtM?=
 =?utf-8?B?b3JDSWkrbVNva0dieVZwZ2lTRlF5a0RPNlJ5Y2M2SWF0VmNKa3BHZFBBZUdR?=
 =?utf-8?B?RUZOTWpBNnNxS3NDdXBJN2pZSklSaFcyNXE5ZVRBQTh6Qld1bXdNc3YveU1O?=
 =?utf-8?B?SnJCOVNkYm9Xb2VidVJUQUFKYW5rajZscFZVallOY3VIaEtsNC9SRUpCMnV3?=
 =?utf-8?B?TUFUN1E4c1d5ZTFVSFh6UkJqbVFQNXdiU3lZUzdpS1JzV2diWTdCckwwbERR?=
 =?utf-8?B?bGNSdG9WOE9jb3pMLy9VL1BqRmRjWVVJbzJxOXpuNXpwNEVSR0luQW1XN3I0?=
 =?utf-8?B?ZDFhM3F0Y2ZyeDhNNTBFSGsyaHRxMitTS3JCbkhPRnNkTmR3Ym8vVExtanRW?=
 =?utf-8?B?bUlVdG03b0V5QUlLN1FTaXNIUU80czNSa1JaY3l4TzdaTG9xd2F1d2JwQzlY?=
 =?utf-8?B?aHZ0UlJGS0RGZW9pMG1MUU9pYm80MFBRM1FLdzRjeW16cVZSb2lMRXJoOGpn?=
 =?utf-8?B?aDNLNnRVK243WFE0WUJQd1ZMb1lwYkl6REo3ZVNHQzVuQ1hlM29oV2I1TmVq?=
 =?utf-8?B?TU9KMVkxeDJLcnF6YXpMSFBLQ1BmbWhsSURHeDlvN2RvMDIwSk9BK2Rrc05C?=
 =?utf-8?B?anVFNGlGU3pKT3AwN0xaekRpWEgyb0VUanNoMEFqNThKUUdkU2F6bE54SDNz?=
 =?utf-8?B?MHBzN1psaE9EUkt3WldrWExmV25WZmNtSWJPY1piT3NTZnh5TERkOFdDWFFG?=
 =?utf-8?B?ZnlpUlRVWWVVRXRrWmcwZXE3UmhjTE1LdWdWbE8zY2pCdlhKRno3b2ZlNWtZ?=
 =?utf-8?B?Qkw4UzBVcmRQZ29kYlVUMDhWK3gzeWxpakYwU2hreVowVWZoN294NUZSbDEz?=
 =?utf-8?B?U1dFQlNRSFNhcWsyZVlrdFBkdzFUTEdmSzBtN0xIMm5KeXhJVTRvQzRaUXRM?=
 =?utf-8?B?cFFUb3JrUVkvR1pNQzNQT3M4dzBaWkJidldYS0VtNisxM1NOS1loMFpNdlFN?=
 =?utf-8?B?eEdJWmJadXdnUEh2RkkzRUVzVHZaOGdQRThBUmdtdURMcERMZ1pwQUpBeFFO?=
 =?utf-8?B?bXBlcnY0LzlVTkU5eXptL1dDeXUzdFJnVWhNUFpoOTdvMkI1UmNrcDJHTnJR?=
 =?utf-8?Q?6cxV82HpFxm2RzZjAh0dPVpFw8dw6EVQEmOdOZ4?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f151f7d-21f2-4955-af06-08d8ea0ba50c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2021 12:45:01.6591
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xrxR3IcLlEV9BQGmuMB3lcPImLgiA6U1ZGwhzR8beNROrp/MVQUGCdrYMYsBpU0T9743OIETZxxCT2RZP4NCT+k7fOwMCTKssNHK6Vqu7XI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5184
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 2021-03-16 10:42 a.m., Bartosz Golaszewski wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Add a new recipe for pythonping - a python module allowing to send
> ICMP probes.
>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-pythonping_1.0.16.bb              | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-pythonping_1.0.16.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-pythonping_1.0.16.bb b/meta-python/recipes-devtools/python/python3-pythonping_1.0.16.bb
> new file mode 100644
> index 000000000..5affb934c
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pythonping_1.0.16.bb
> @@ -0,0 +1,12 @@
> +SUMMARY = "PythonPing is simple way to ping in Python."
> +HOMEPAGE = "https://pypi.org/project/pythonping/"
> +SECTION = "devel/python"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://setup.py;beginline=12;endline=12;md5=2d33c00f47720c7e35e1fdb4b9fab027"
> +
> +SRC_URI[md5sum] = "9b505ad8a5b8a6a8e57ccf75098ea364"
> +SRC_URI[sha256sum] = "d025c8b25952580dea47bc241421e17a5a97f97f50098e1096dd10d845d0f156"
> +
> +inherit pypi setuptools3
> +
> +RDEPENDS_${PN} += "python3-io"
> --
> 2.30.1
>

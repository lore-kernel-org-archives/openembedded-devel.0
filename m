Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C623C63797
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 12:45:20 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.64])
 by mx.groups.io with SMTP id smtpd.web10.105471.1673362389430194402
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Jan 2023 06:53:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=hNgskkKI;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.247.64, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MmpcxaMgYmwIndLz1PzH0R3Gfcsqhr6WmVXEAGmEriMGqxT3qdzbLoIIojsIoNZQEeiljoQsDLogaiA6cx+E9GphsfPrGkV1ABQ2cvkiC9VzeOLbuCsE3+vdU+43VkpTu0DxSyCY7syuFZnqdJ/vr9CvbVUQb073aecE+1pB0g9DxEDBkYZ86OlTIrgX9wK8Jj+vbHrBiM9rSMHPRjt5QOJ2EYaWGE6rTWsvxnWBrTYjHy29H20vnQYBztBnVDkRoWm2yHGsOueymetI8J/LF8aw+xpeu4TOTUBNIM6k4mCMbSdPpJr3XNpaCu7ngzwOB1yCp6WdAX6emEyZYvclxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=peOHid3VCVAtRtLG27q8ViWEKqomMQAJx2zwyP6WhyY=;
 b=JtKHIFHu8BXbfLZi2MyEniyC2bxIM/+FoLUqN9MPg9eIAxJ3lloiRzpUaRgrV9E6ZMyLTI8IKF4OOXPowlr0uk6ZFRGWqMitXleT2ObzjJd2Lloa9tDTpgFbl58KNZmfVTNJjpXP9KVeFzgbKWpQptxRam0USXc0/sFoDP+DWVnlOyFzA7rq5DZTW4G3xedXXvRFplF+M5OXxi8EsB+pC5cK4tilfcpriOn3Ra1v5fwZW4XTeoEJPUHy+M8spnC1PEelmO2rr/mR7uTtzIDsOM7DG1kI6NfS53brVUUUraesGE8D/auEPmYuz1TsDJCBesmtecAhveQcg4wQlBVOnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=peOHid3VCVAtRtLG27q8ViWEKqomMQAJx2zwyP6WhyY=;
 b=hNgskkKIfvFy/sdYMfmhQBuFrVpnsgvYjPunBdfENLbxSaQ2iC2Wqwe4zQ8QpT6RZg1LDD2XMOU5a8eX/p8oblCFd+wb+lXXtwFC+X6vQYiDWTQcoO8DFPMj0zvbvZ9wNzmIxteHL/pHXkqGj66i5zT1J9/yhpsR4NMhfaHA3ZyJ04CEoApmyFO+WD6V948HYhwD53x3FCniuFzrhYUlCS2q/HcEH/26FPoyxs5B7GmBSPSp+STM/FyF49GcK47uwfg+komgji19N9IFeJ4QIouwAbUWNicR/gscziArfKWMQPuV6L8oDnqB5sdX4XQ9ceHh5pl4142NEBftOyA29Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by GV1PR04MB9119.eurprd04.prod.outlook.com (2603:10a6:150:26::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 14:53:05 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9ebd:cd48:9396:76f6]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9ebd:cd48:9396:76f6%5]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 14:53:05 +0000
Message-ID: <6abe7f2a-c996-dc0e-7f7f-c3481fc73470@theobroma-systems.com>
Date: Tue, 10 Jan 2023 15:53:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH meta-python 2/2] devtools: add recipe for esptool
To: Quentin Schulz <foss+yocto@0leil.net>,
 Tim moto-timo Orling <TicoTimo@gmail.com>, Derek Straka <derek@asterius.io>,
 openembedded-devel@lists.openembedded.org
References: <20230109-esptool-v1-0-a27de84d748a@theobroma-systems.com>
 <20230109-esptool-v1-2-a27de84d748a@theobroma-systems.com>
From: "Quentin Schulz" <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20230109-esptool-v1-2-a27de84d748a@theobroma-systems.com>
X-ClientProxiedBy: VI1PR0401CA0013.eurprd04.prod.outlook.com
 (2603:10a6:800:4a::23) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|GV1PR04MB9119:EE_
X-MS-Office365-Filtering-Correlation-Id: dd82df5a-345d-4aab-7670-08daf31a60ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	der7+ItVeWOPdZavgsS2OqdfNgchpU+o6RmAzmuVExTb1X28ZD0x++ZlolLBSiGQogjxQTNuBHcMjuQw9k0b1joI926MLO/CwbkdKrbVLSSmL8AEO0R7yJ86qBDT+JuwRLlBwBW5JITtGdOjDpQ5OhVopVotgGRegjImnS5SCo295pl4oPiR7RqtdhNHyM9spamtkOgr5sWert5+q1M+zffAIF1UJO6xAMj9uO1VfMC3Zw5smy/vGBh2oeOEUZfxGzpzhVdEdPhb2jVtYmCSf2t8d5bAIhRrFIAXtbRjGzspE0UXWZ/Q6Wyhv/pzLtcDuqKB+CAYQYiP3BZf8EjZ8bIa4kIiYKFS4yUO8uoXS9L5I/e+a4PdB7joeW5irFwTdpwuhZ2VBowK1qY20tIbNZXL1IbijqbdT208Mvr1uE0N27XLtl9riCpfVVkGTGl7KfF0e/EZifOLb61lp4zsBaY5PbcdZMX6jhU/RhscXj5L1AxQSFNtzOFkEVCHT1OYEX4qyy3ZVfGCRCoFsvW1KCDjiUBxCXqoAWYKzstP1wSIR7eTt2sr62yUT2ndsgd806pjVHE7gy3ZPVgchXtZk9riqLQhWP4tJ7S7OkAtJUwLCbBIuwFltccDxQWTFjP8Gb1JNkh71TrKNxq242tvzAtf+0kmjmhMgzKGM+4O1nNwYghLQlw8S82FNIy8o5MBrmlCuxAdgDK0Dpd+55yHLqLL6n4SX6n5rS5D9ZQm9/9oHXp+LsOhxEeZwQetfQrJubIwdicNhOrpBK+lG9f5AQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(396003)(366004)(376002)(346002)(136003)(451199015)(6506007)(478600001)(6486002)(53546011)(186003)(6512007)(2616005)(66476007)(8676002)(66946007)(6666004)(41300700001)(110136005)(316002)(83380400001)(86362001)(38100700002)(31696002)(66556008)(31686004)(2906002)(8936002)(5660300002)(44832011)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZXE1L0ZKc3FhU0FiM3BTaUtpZENNT1dZRkVwYjBnL1hzYVdFYnlnakQyOWxu?=
 =?utf-8?B?T2V3U1hwcktaSEczcDF4eEJlUmJ0OXljdE5oSHZHSW4zeWdVTm94bnVUTllr?=
 =?utf-8?B?dHNlTjJ2aENNR3FlLzM0cHZNTXB6c01rRUs5K2UzOFJOUWtVSkpWWDk5dlB0?=
 =?utf-8?B?anVZUml4QXVJNktXYSt5N0JjWjRxOHA1bDRwN0FxSFBwd01jejBINWpYYmpF?=
 =?utf-8?B?Y3FFOGd1NVV5MnhnYytqYk5MRWdIOUlENUw3TzR3UEd0MGlKWTl3TWs3NW9J?=
 =?utf-8?B?T2o1aUZYNmVrUWJ5TnlZeTBLUmR2WnpUNmlkWUN1TXNLTHcyM1pxbmVTSEkr?=
 =?utf-8?B?Y2VxNWdqMi9HVHNMOUpEZFVJZUxEcDVaQ3A0YjNxL0xkUEhta1lMZE4rQ2lm?=
 =?utf-8?B?REdHaTdhU0VYODBJSmRCMnU0a3lMMWRJajVSaERHd0t4Q0Jady9oVm9obkJt?=
 =?utf-8?B?MWIwc2NFUHM1Y0RDbTJ4cXNUOUhPTnJMYlRWQS90NFJDc2hXeXpkbjg1ajFJ?=
 =?utf-8?B?SElKdXZyb1hEa1NUbzJIcWVyTU93dFQ2dFZIcTViQmcxWUNIZDhLekErMEF0?=
 =?utf-8?B?N29pN1psL0FicEVZVEFkQXdZOGwwM1IzWWhRRVQ2c0VpT29yc2NFdys3Zkg0?=
 =?utf-8?B?RC9oTU1xalpxWklUNDZRb1llNjVNcFdhWDZQZHV4UUlISHM4eGlaNnhROTlk?=
 =?utf-8?B?Zng1VTNqQzQ1WmNnbnNhOVVPRFBFSjE0a0IwOS8zMlo5RnlrcDdSWDZ2TkRF?=
 =?utf-8?B?bGhSNHhrYXpLRWdCcUNubWxLcWlpLzhUa0ZFOXRQMVB0b1lmQXZiNnNlWWwv?=
 =?utf-8?B?TEJrWEtxWXYrZlBqTkFXRjd4NXBnWCszQjM5cTZxS0p4UGRXaUQrb0d4WGRv?=
 =?utf-8?B?Yld4RlZGSFJUeG9VemdRR2xCVDdBN25rcUNsY3plSGZ1aERUMWYxSW1zSnhw?=
 =?utf-8?B?U1o0aW91K2hvWU40eHhEeVIxdUp0U3BpdlVuMGJodXFEbWR5bk9FaklYMHk3?=
 =?utf-8?B?N1dhbWJNcS9tOVJzOUpzRjY4clI4cDFOQUJPOTgyTzNuVHhlZks1Qk9zTG9K?=
 =?utf-8?B?MjY2eXI2QStDRUphZmJkM3lWMlRSeVdzYnh1QjR0UUNNUThGVHN1aGgzREFq?=
 =?utf-8?B?d3hpM2RnaGtmaW5LZFdQcHNaWmU4UlRCTEtJTnVJRnY1TXNiZk93SitjVktI?=
 =?utf-8?B?MHViYjNwVUZSS3N0VlI5Z21mdXZsN0NUVnZaelRjRm1mejNEVHNIT1Z0THFm?=
 =?utf-8?B?ci9QZEZLQ1A2dFluWTZReExXcXVmbkFoVk1XYnY3RVFUMjQ1NjlkNDdray9J?=
 =?utf-8?B?STlTZmN6bFJIUUkxT1JkY0QvdzlmV1ZwMzhsMHJCVXRzZHlnMTh4dkp1TFUx?=
 =?utf-8?B?NUZhNnpScWdwTjB0SEhZZGtoSHVLOU80eXZCNFNXUjlkOXNyaGdiL2ZiT3Ux?=
 =?utf-8?B?NDUwbDNzUEsxS2xHNDl0Z1ZaY3VRT2htbUxQd1IxSEh1Wld5eUxmekt4MkJy?=
 =?utf-8?B?c0NSVVQrMlhDVmFhbWY3YTVleDkyMnJidFlsd2NhL1BwNVRZOWVFd29OWGg5?=
 =?utf-8?B?VFE0QjFPQ3FWRVoxTExPRGFRSXQvZGtlWlVZN250WHlNK2dYVXI2b3JLU3Rj?=
 =?utf-8?B?S2MyNVRsYVNrWmkwMjhQazdZakhld2p5MGxob3Y3Uk1zR2o0KzFrTy9tZEh4?=
 =?utf-8?B?Z0FGZEl5M1JmaXNrcEtiUDVQaGtONkpabWw3K3FOTVFzeW5JTmVSVHZpUkNs?=
 =?utf-8?B?bXgzdzJuY00rRzJibDdERE9JTzZGOHBIa3diRVpheUFNbTh4cjQxdWgrY0RJ?=
 =?utf-8?B?bm9aNjg1UXpmMjhHYUZTU3pSV2pWdUkvRlZNNnkycnhwTnpaK3R4WXhYM245?=
 =?utf-8?B?VytYSFR3V25KV3pDNTh1Y0lhUkhndndybnltc0RFSEdjYjhLbjJORW1IRTdp?=
 =?utf-8?B?WWZRNE9Lall3WHhFUjBKSVBBa09oMytJKy9QV0ZYZENRSlRXejFxOHJmZWxs?=
 =?utf-8?B?YjRsSElXSHBZOWFFN1ZFcG5ZY3hSL3FTMm1IQWk0elZzdkxtU05qRTR5OHJC?=
 =?utf-8?B?cW4wcFV5YjBWZk1kdVBFSXkxa2tia0V2c1N0U1JqSEVZd1FaTXIxeEdZR3Vj?=
 =?utf-8?B?ZkVUSHVmcnpKM0FrRFYvYTkvUnVkNWoyZy9qYW1mRmxlZ0d0N3B1RnVJL094?=
 =?utf-8?B?aUZBd09xZmtUMWt4RkhQS1hLS0tZUnVMaHAwK1c4MDFBQ3FuYWdaQ2ZWNmpC?=
 =?utf-8?B?K0w5VnJkKytSbmRVTlYzUUVDWWVRPT0=?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd82df5a-345d-4aab-7670-08daf31a60ca
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 14:53:04.8988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UkqfxKvekigphdHxoUzBR3oGuaLhZdqKKrzT+T1mARVBrEf5jY1VCoXiveJf4+0zK6VmWu6iP8QvVyRWJK2BQzk6TUXi+L3sFKOAQMbYD1TQ2GL/RsLRK9GT3U9kZu4Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9119
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 12:45:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100548

Hi all,

Please do not merge. See comments below.

On 1/9/23 18:19, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> 
> esptool Python module is a collection of libs and scripts to interact
> with the bootloader on Espressif SoCs. The Python module happens to
> provide three useful scripts: esptool, espefuse and espsecure. esptool
> is the backbone of communication with the Espressif SoC's bootloader.
> espefuse is useful when one needs to burn fuses or read the current fuse
> state. Finally, espsecure is a tool for setting up Espressif
> implementation of secure boot on their SoC.
> 
> espsecure depends on python3-cryptography which is a Rust-based Python
> module, making it a heavy tool dependency-wise which is the reason why
> the scripts have been split in their own package so that people only
> interested in esptool script have the smallest possible dependency
> chain.
> 

This unfortunately does not work because all runtime dependencies of all 
packages in a recipe are built regardless if they're included in the 
image or not. So while this allows for slimmer images, it doesn't save 
compile time.

So I can suggest a few things:
  - simple recipe with one package with esptool, espefuse and espsecure,
  - keep it as is, slimmer image when one installs esptool only,
  - one recipe for esptool, another recipe for espefuse and espsecure, 
slimmer image + fastest compile time if esptool-only required, more 
complex upgrade path (need to make sure esptool and espefuse+espsecure 
versions are kept in sync) and less maintainer/user-friendly,
  - make espefuse/espsecure inclusion and their runtime dependencies 
manageable via PACKAGECONFIG, slimmer image + fastest compile time + 
"simple" recipe, PACKAGECONFIG changed via bbappend (so inclusion of a 
layer modifying it changes the package for every image) or configuration 
file (which I'm not sure makes a lot of sense?),

What are your thoughts on this?

> Cc: Quentin Schulz <foss+yocto@0leil.net>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> ---
>   .../python3-esptool/python3-esptool_4.4.bb         | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
> 
> diff --git a/meta-python/recipes-devtools/python3-esptool/python3-esptool_4.4.bb b/meta-python/recipes-devtools/python3-esptool/python3-esptool_4.4.bb
> new file mode 100644
> index 0000000000..573e5fbdd1
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python3-esptool/python3-esptool_4.4.bb
> @@ -0,0 +1,22 @@
> +SUMMARY = "A Python-based, open-source, platform-independent utility to communicate with the ROM bootloader in Espressif chips."
> +HOMEPAGE = "https://urldefense.com/v3/__https://github.com/espressif/esptool__;!!OOPJP91ZZw!ihV4ksMmKOE5_Qb9_LULCaepiK54CU-lr83C1QrA2RKEG-U8FpfWc7hno-2VJtyENI0DdBwNea_iHUTa-WpENW4N7BdbYu4bQ18$ "
> +BUGTRACKER = "https://urldefense.com/v3/__https://github.com/espressif/esptool/issues__;!!OOPJP91ZZw!ihV4ksMmKOE5_Qb9_LULCaepiK54CU-lr83C1QrA2RKEG-U8FpfWc7hno-2VJtyENI0DdBwNea_iHUTa-WpENW4N7Bdb4kL0Ayw$ "
> +LICENSE = "GPL-2.0-or-later"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +
> +SRC_URI[sha256sum] = "8acd4dfe70819b1302861ae92894380fb4700b377f5a4739479a4ec276e0b256"
> +
> +inherit pypi setuptools3
> +
> +# Split the Python package into multiple Yocto packages to avoid bringing in
> +# heavy dependencies like python3-cryptography when only esptool.py might be
> +# needed.
> +PACKAGE_BEFORE_PN += "${PN}-espefuse ${PN}-espsecure"
> +
> +RDEPENDS:${PN} += "python3-core python3-pyserial"

Missing a few runtime dependencies. I had only tested with all packages 
installed and python3-cryptography was bringing those dependencies in.

Cheers,
Quentin


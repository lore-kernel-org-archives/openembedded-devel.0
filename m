Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.40])
 by mx.groups.io with SMTP id smtpd.web08.35710.1611578365073998707
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jan 2021 04:39:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=WYIs3aW1;
 spf=pass (domain: windriver.com, ip: 40.107.220.40, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N0K7+n828qp8OGGy6MSI2nFLT1z4i/s2z+UrBBh2y81ftu4rs40R4RC8V3PN/pPcnrbQvvBQTIRkysYjIDsI8FCdhhkmLq4FJqu7yqyd2lYKEsq8eVps5makqXd4rxYXp0tT/EwSdvPCdF1K+OZBlHbVczoDVpd/tjPaptWI9B8bB18WiomUuUQ7e+by6cd/nSgEevN+A7rmRjr+dtaSTCvSa1nvotaHiYvQ7XMjjHEwHIGGdo1bDD0TUKPLRJsAVpA+CX2L9QmR9SdZPJc3DJ14lJVDVDstYWYCG+IT5X7W7yJ9182pkc3bvEsN3NM7eq7iFABmzhCDAYnPluubRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pYBzQpiTEpInnXjOYBbrbcSkM+QxFltkEZWaXpFzeDo=;
 b=i/p64bACqZe8E8lG7hX+14xRIcjTASirI64L6vX41d8TL1y4HfcHymvP4xK/BOEVzlwHokfj56EoV4cUr2brnlZFy31+McJkiyJANzUJEpcklIUEqCvhDy3TuDA687lAyUpVNi6uQIknyubLJxmowEcf4xBxpenbOJ5ErLjnRMyMVLlOlejm6Z60ontb2+N8t64Gu6A4qUVkxMjT/0F5pRCPv6igJOrsPhBhgHAnM7I3p/2nKOt7kacjwRfc+h7209euSwLlBCaC6bIr3IMhq7gm2LMstqGas0pmL4I0bZw71t12crBhvEyGDzjslnMmnZjhaFN+wMpEZIFq4kREbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pYBzQpiTEpInnXjOYBbrbcSkM+QxFltkEZWaXpFzeDo=;
 b=WYIs3aW1Ma/8iRNa+gAb59GuUcEoAgUZyFZWlf2MicmpIHIRePIkj9H95YKR1BWUJMOuhhoALw6wHh5NP45Yauq/2lpl3NX4hhGgB4WZpHGgn5HSrQZI/JyjubFjujDtnlqLDu2t3uDuHUpgvq1M5S48rPQpCw1+lk5xHpMBMJ0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from MN2PR11MB3919.namprd11.prod.outlook.com (2603:10b6:208:13b::27)
 by MN2PR11MB3984.namprd11.prod.outlook.com (2603:10b6:208:153::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Mon, 25 Jan
 2021 12:39:24 +0000
Received: from MN2PR11MB3919.namprd11.prod.outlook.com
 ([fe80::5462:9c04:72b3:6c44]) by MN2PR11MB3919.namprd11.prod.outlook.com
 ([fe80::5462:9c04:72b3:6c44%7]) with mapi id 15.20.3763.019; Mon, 25 Jan 2021
 12:39:24 +0000
Subject: Re: [oe] [meta-python][PATCH 4/5] python3-pyusb: Upgrade 1.1.0 -> 1.1.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210120111027.12947-1-leon.anavi@konsulko.com>
 <20210120111027.12947-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <da7055f5-4eb2-da2b-c91a-5ea5f46f58a0@windriver.com>
Date: Mon, 25 Jan 2021 07:39:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210120111027.12947-4-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: CH0PR13CA0001.namprd13.prod.outlook.com
 (2603:10b6:610:b1::6) To MN2PR11MB3919.namprd11.prod.outlook.com
 (2603:10b6:208:13b::27)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by CH0PR13CA0001.namprd13.prod.outlook.com (2603:10b6:610:b1::6) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.11 via Frontend Transport; Mon, 25 Jan 2021 12:39:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 66216e0c-7d17-41b0-a9c2-08d8c12e3ecb
X-MS-TrafficTypeDiagnostic: MN2PR11MB3984:
X-Microsoft-Antispam-PRVS: 
	<MN2PR11MB39842D45B48B27C1824086BF9FBD9@MN2PR11MB3984.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:663;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hF3E9zNZ7f/E2kSQ2WX5GEXq86eu3perquj7BUSKeD+RMftUS/8VcrUckhN/pTsV13xZjfxpFPIenjcQd3Zi9lBvMMPPhplJ/m9BvHQhWIMVO4hKHmxA907GEEJmqmyHXuyYfxopyGSAb6gyB8u4vIP5GoKsM/pNMA66YlIRiEWX23JcK/jAWw6G1gmkf6yynpMA3TxTf/gQ7aWlGFkecV/blOJzaNAedN+F8+XjQoSnabr7P0z1nUxU1coH3rF30L3BHx1ZXkPdGaNkm93D7W8WvvfD1N+Iz7ygcUuO/LCSvAaNe04FMJ3o6hiTSf7vAZ4qgky5D7W1eHmkcFaYl0FneVle65P9yAWRVkyO+FIlTkxOeOwvz6SlVvoJS4HWXZlvIKJi1u785V5Gl5hSs7SzEzCWJ2Rcrt768HdHlGD6G2P376FoZj1Rqr9GtBt40Le9SOmBfklZPyVWrHqJJQvgWxfu5cI4BbqDNzg9c+w+hkjTRvkDOyrv4LbjbuJup7suLKxS5fjxM4Tm1k5Fgkz5xyR+ser67ZKvyTvEKRUkv3YGM9m89ixQfw3H+dAw
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB3919.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(33964004)(5660300002)(86362001)(31696002)(2616005)(6486002)(44832011)(83380400001)(956004)(31686004)(966005)(66946007)(66476007)(66556008)(498600001)(36756003)(8676002)(52116002)(2906002)(16576012)(186003)(16526019)(53546011)(26005)(166002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?cFFUSGxrSmtCczZ4Q1RPS1BFOWF3YWk0ZTBCMnp1SmRac1VxN3FnbTE5T3Vv?=
 =?utf-8?B?UVBqa2lUdEQ5K2xhL0dzQnZQTFpCU2JTdjlUcFFkekZFd0d0SDRrZ2JZc09j?=
 =?utf-8?B?bndRMVN2RzdyWTVxaUF0cER4aDFsOU1RWm1yWVkyOHgzTEJXN2VtTE53c1VE?=
 =?utf-8?B?U0xKY1NOZHc3U052M3JvOFRSN0thWW1kdjVHME1UeGNzZnVqdW5kbDZkUUxs?=
 =?utf-8?B?bFJSL0RaN3FYOVhxZGlKOHBXU25DTGJyejRPU1hQcStQMXZjOUNBK0RLZ3JC?=
 =?utf-8?B?cEpmNEdRY0U1SEs1dTJJY1NqalJLa0Z5Uk0wNGlPS3l0S0FZV1VjTEtuRGRr?=
 =?utf-8?B?UkxpdHNUdkxRSlNvNXFockpyTVJScGhlUXljUjZvVytVaHRPUTQyYWs1Y1A1?=
 =?utf-8?B?ZjVjSUJaRmp0VlFURUxvUU5TcTRaeW9wbDg4ei9hUTBRRVlnZ1o3OGZ0bmw2?=
 =?utf-8?B?SWZwdnFnUGt5aWxPeWROOXFJaXB6Szl1UFRPSHROUHQxdGNHYVAyTndYNy9x?=
 =?utf-8?B?eG9jRnFYQmpYTFY1QWxML3BIUjlyb0llR2NJMCs5YzdXME5idXhvSGxtenhD?=
 =?utf-8?B?a0p2Vm0xRnNvdE9QK3hIS2pzUXhQTmVOVmdEaEUzeHBiZDRhd284RUNtb1pC?=
 =?utf-8?B?SlZwakk4MVgyVzkycjg3QjRHbExRMFdiUGIrdGJvcnV0b2o4VWFleU1OalF1?=
 =?utf-8?B?UnZzalBVUmphcHFSY3ZrL09oT0lDazlhWGJpbXZZTmJaR0JlTGtPay9pYmZE?=
 =?utf-8?B?bmlqdk8ybXM4R1E4ZEs3eG9UdDIrWnQ5M1hoajhWRU8rMVBWMzJpeG56ZzRk?=
 =?utf-8?B?ZG9NMjU4bkxBNFU0Y0l2d0dPUFVkWlo3aitKczZrZUpUeUYrd1h0MjV2dEh3?=
 =?utf-8?B?QVlsbDNtWUxNUFJqZkQrak9mN3gzV2VSM2dtb3JFZWJpTk5sVVBwQ0lMSys2?=
 =?utf-8?B?ejArTDFPaXNlUFZGNGFOazB0TGZzUGVkbThqTDZCN1FtaklJVFVYYUk4Y2Fx?=
 =?utf-8?B?MTUzM09WTTgva3lQS1FCN05YNUtvMjV0QmR4em9YVERLNjdYVVF5eGExRFRK?=
 =?utf-8?B?U09xbGpsNE9sVHZxcncwQlBDM3Z1L2dNWERuVVZQczM1RU9na1h2clFDRllV?=
 =?utf-8?B?ZXZlWVZzY1ZwQkQyVEJCS1g4N3pMMmJ6eFhCaHNHZG91WVpMMDBlbXpZbkZi?=
 =?utf-8?B?eE1rVUFqcGw2ME14dlNsSzdVcTZUbW0raWlDUDNJV3RFMmJNNDNtVTJpL2V6?=
 =?utf-8?B?SCt2TC81dWRhdG02Z2ovQk9xWXFrSUhWUTRjNlVUd1NUWXFzTWhFK0FUOUFs?=
 =?utf-8?Q?lGOBPcFgELk20TdktIpYWPDwciJKSOkemF?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66216e0c-7d17-41b0-a9c2-08d8c12e3ecb
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB3919.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 12:39:24.0625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b0Nt5G80XcFgTfrEiYtR5ajTkTOww1hY1vtfqj5Y4LR13Q1Izs/uh3a0RNfGJ1oIf+uyptacDmyHAm7CptI7sjG0M8/0u+0BiEGtDnmAP6M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3984
Content-Type: multipart/alternative;
 boundary="------------20CC52742C63BECFC87AAEA7"
Content-Language: en-US

--------------20CC52742C63BECFC87AAEA7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-20 6:10 a.m., Leon Anavi wrote:
> - Patch release that fixes a couple of bugs. Most notably it fixes
>    compatibility with Python 3.9.
> - As of PyUSB 1.1.1 changes that break under Python 2.7 and 3.5
>    (both of which have reached end of life) are no longer considered
>    regressions.
>
> License-Update: Update year
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-pyusb_1.1.0.bb => python3-pyusb_1.1.1.bb}      | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pyusb_1.1.0.bb => python3-pyusb_1.1.1.bb} (53%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pyusb_1.1.0.bb b/meta-python/recipes-devtools/python/python3-pyusb_1.1.1.bb
> similarity index 53%
> rename from meta-python/recipes-devtools/python/python3-pyusb_1.1.0.bb
> rename to meta-python/recipes-devtools/python/python3-pyusb_1.1.1.bb
> index 6b48d6a25..a8c7031b6 100644
> --- a/meta-python/recipes-devtools/python/python3-pyusb_1.1.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyusb_1.1.1.bb
> @@ -1,11 +1,11 @@
>   SUMMARY = "PyUSB provides USB access on the Python language"
>   HOMEPAGE = "http://pyusb.sourceforge.net/"
>   LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=c52a96fd9a0cadcb9270904c8eb5416c"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=e64a29fcd3c3dd356a24e235dfcb3905"
> +
>   DEPENDS += "libusb1 ${PYTHON_PN}-setuptools-scm-native"
>   
> -SRC_URI[md5sum] = "3b2e38e9f697d2f90d86376bd10a9505"
> -SRC_URI[sha256sum] = "d69ed64bff0e2102da11b3f49567256867853b861178689671a163d30865c298"
> +SRC_URI[sha256sum] = "7d449ad916ce58aff60b89aae0b65ac130f289c24d6a5b7b317742eccffafc38"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------20CC52742C63BECFC87AAEA7
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-20 6:10 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210120111027.12947-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Patch release that fixes a couple of bugs. Most notably it fixes
  compatibility with Python 3.9.
- As of PyUSB 1.1.1 changes that break under Python 2.7 and 3.5
  (both of which have reached end of life) are no longer considered
  regressions.

License-Update: Update year

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210120111027.12947-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-pyusb_1.1.0.bb =&gt; python3-pyusb_1.1.1.bb}      | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyusb_1.1.0.bb =&gt; python3-pyusb_1.1.1.bb} (53%)

diff --git a/meta-python/recipes-devtools/python/python3-pyusb_1.1.0.bb b/meta-python/recipes-devtools/python/python3-pyusb_1.1.1.bb
similarity index 53%
rename from meta-python/recipes-devtools/python/python3-pyusb_1.1.0.bb
rename to meta-python/recipes-devtools/python/python3-pyusb_1.1.1.bb
index 6b48d6a25..a8c7031b6 100644
--- a/meta-python/recipes-devtools/python/python3-pyusb_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyusb_1.1.1.bb
@@ -1,11 +1,11 @@
 SUMMARY = &quot;PyUSB provides USB access on the Python language&quot;
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://pyusb.sourceforge.net/">&quot;http://pyusb.sourceforge.net/&quot;</a>
 LICENSE = &quot;BSD-3-Clause&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=c52a96fd9a0cadcb9270904c8eb5416c">&quot;file://LICENSE;md5=c52a96fd9a0cadcb9270904c8eb5416c&quot;</a>
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=e64a29fcd3c3dd356a24e235dfcb3905">&quot;file://LICENSE;md5=e64a29fcd3c3dd356a24e235dfcb3905&quot;</a>
+
 DEPENDS += &quot;libusb1 ${PYTHON_PN}-setuptools-scm-native&quot;
 
-SRC_URI[md5sum] = &quot;3b2e38e9f697d2f90d86376bd10a9505&quot;
-SRC_URI[sha256sum] = &quot;d69ed64bff0e2102da11b3f49567256867853b861178689671a163d30865c298&quot;
+SRC_URI[sha256sum] = &quot;7d449ad916ce58aff60b89aae0b65ac130f289c24d6a5b7b317742eccffafc38&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------20CC52742C63BECFC87AAEA7--

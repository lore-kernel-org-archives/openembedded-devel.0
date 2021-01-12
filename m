Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.79])
 by mx.groups.io with SMTP id smtpd.web08.11386.1610467749376125812
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Jan 2021 08:09:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=FmN9qmDe;
 spf=pass (domain: windriver.com, ip: 40.107.94.79, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mG8/1FA0sjD5Hgsijmv0v+umWDBCfKxJdBDGKjRWHtfhhzCkOGfutNoZjjX3etyGdtmEjBTRB/5HX0V5pICf2FswwM0ADBD8j7EZZFvjMYfM8IZ/gKzuTucMjSE7F7+QsHYuhZzNW6V2mVc4ZES/s1w7f/BGZ9jo+ttqBxa5P4b/yQvAsycv7w8l7MwF7GXLYR+RjPdgurJqHOcDfFzyjpRihVmgWRJa8Bw/9E0gVtFXldkjORvb60AXw4ZthlErJwy5bXyjtYWXlTV/JxUUak24fhde7QkvzLqAboBlYgZVnjSxYi2cdfjAFjGy+LJbAEi7YYAcHRDvpTPtgA3eug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nt0l1JdZrJ5e9zaDcbrRmzfyipTl3rGXNuGerLoY8II=;
 b=V4xsbaJXaPptCc73UjBljSzO7i06u/XY+LGZ63pw3K7Ze9NuI+ORMz3iBgzqa7YNrOrR5gZIasJCazSvuE0yUnILi2lDQxPC8vbIiIT9L8BPThA2w1zOAqYq0CrOKUxPOLT1+83HZ3x24Ag669xjkqc9rgcajpZXAfswek92K8Emh/FM2s+99aEuzmmjJf4f8VYg1xjYUEtemB1iE8GmBTgvrjv2BOFQZf9Jh8agDFXMzrBIfvVukdnNTaiPgxJbmp/JdLPsBpjrfQu2X02XPboNSg6nfYyttrcDC4B0cUhXInHgMesXE/sNlqNlVMDFpouXecKvD070BBGth7RX4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nt0l1JdZrJ5e9zaDcbrRmzfyipTl3rGXNuGerLoY8II=;
 b=FmN9qmDejJrh6uFVCc9dJVKeuYV+g8mINyhHHxb7cWTHLDwHoz8xHT8MSu59BQvkscT6FfHOxQywmYOTFW7sNgFTT3kuZrOpQ4iP+0ZPwA1BAMZNcMm9BgaQ3b9GTcP+KvSw4V7/cHQ0819Bsp38lF6VoneMgLarxAg58I8QLLo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3031.namprd11.prod.outlook.com (2603:10b6:a03:8d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.8; Tue, 12 Jan
 2021 16:09:06 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6%7]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 16:09:06 +0000
Subject: Re: [oe] [meta-python][PATCH 1/5] python3-aiohttp: Upgrade 3.7.2 -> 3.7.3
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210108102814.9560-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <b527ef88-a278-2cc9-60d1-b1fa04ff261d@windriver.com>
Date: Tue, 12 Jan 2021 11:08:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20210108102814.9560-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:208:23a::17) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR03CA0012.namprd03.prod.outlook.com (2603:10b6:208:23a::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9 via Frontend Transport; Tue, 12 Jan 2021 16:09:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cad65536-2273-48dd-fe40-08d8b7146327
X-MS-TrafficTypeDiagnostic: BYAPR11MB3031:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB30312ACB5B022A97B4CC565F9FAA0@BYAPR11MB3031.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fIQsRUo+hafLL6fQC8bsc99HURGHco8IcwpGWJ38JEpQMKWVLnRTmAQRuxW2sP600ZNYBEd/3llg6WvFCQiiYaFy8F1D14Wderly/1Hx3Kg2TrzshxM8pJPizUpH20eI/r0HEYCPPv0DiGkTtpBrbLQqY1UUrbE0JuSc3A1E/+HQwlm19UV00fO/qLZSRPWQm7UNG/tT9BCcJ6EOz8hAL0pS7OPagKPDwwwdk8VLEbnI3NbHpXPKBfVcy7Ny9P+onUixwoZx1PWVe8dyOiaDwxaQFJ6x+utj+/bSUxBmskhv9fF+b4fa0HetT60wnAdaXHZWXv+p5PSXc9lVqQYNUQY+0Bz43+4dUi4r2wy0TYkzbcTQ4JJXYgMZ2UgO1Il79/fBHsyRs9XXQtqw5GeCBA/q2e/aLf30fAhXvwf49U+rjPW8GB2oJLPActCfA2HxyQNH5gqjjsIiDfMbA+AxrAnEhjKtPzhg2fvaZhsutR4lPEiEpvQzue1G7fZAhy9yMa64qW1vV1nCkyfFEcfQ9lB4uDjBbIYAd96fpPeAsTSqEHVWTHeMM4jEs+sq81NO
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39830400003)(366004)(396003)(136003)(66476007)(66556008)(478600001)(2616005)(53546011)(26005)(6666004)(66946007)(6486002)(8676002)(186003)(44832011)(166002)(36756003)(86362001)(8936002)(31696002)(52116002)(83380400001)(16576012)(316002)(2906002)(33964004)(966005)(16526019)(956004)(5660300002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?dnlkNXJseEZNSEhNcjc1QjhrYU8xOG82ZEg0NG9SV3MxZ2ZUditVOURDaFJU?=
 =?utf-8?B?MEU3MVV3S2VWMXBlRHRVaDlzVldnbXRxZjZWTG1VQmhVZjRwbGdvVERJcE80?=
 =?utf-8?B?eThpYjRDUEZiY2VSaU5uVHZXY3dVMmFvSlNhS2YrZk5BZjBGUGJ6cVpIMXg5?=
 =?utf-8?B?OFlhRnJWeVZ2T21tT2F2UHRDM3U0NC8yYmZLd0VFN1c1OWloT2poZWZCOWs5?=
 =?utf-8?B?aG1GaTM3ZTdQb3RIdTA3aGVyd1dHZHZ6MG1WTjlkU21mRzdUenBVNVZ0bGRl?=
 =?utf-8?B?cTZONUtPMFJBSCs4U2ZNZHJGSXlxS25acE1TQWQ1TSs0YlZKZGYvZDJnaHhx?=
 =?utf-8?B?V1BSb1JSTmkvRU1KeERSeVNiRGpjem9ySCt2WUFYY21CTytyRkFCa0VSVlFO?=
 =?utf-8?B?SzdzamJQQ2d3ZW5SNGxlUHBLQXdYQUhXOGJaM0luU20wV2hLYU94TWlER1ZD?=
 =?utf-8?B?VUJwY0ZEWTRLTkNCekU2T2M0MDhETUdGSEZNaDJYdFpLbjNxR3NKQVR1dnRv?=
 =?utf-8?B?cTQ0RFBDSENoYVNUdVJmazJLQmswNThuQ0hpb1NLclBOMjZ2bFFGYzVqM2xE?=
 =?utf-8?B?VTRvcGV6QlhWblhkVW1MaDBUcHM0TENPNWh0ZzdIWTAxUG85YnBnVkRQRnFK?=
 =?utf-8?B?UHNYTmtKZEdsZWJlei84b2tXWnZ3S1JNT0Q4dGRtMzdWWVZkc1plc1Z5a0E0?=
 =?utf-8?B?MkFaK3J3TUVhcjJyMWI3MFNEUXd2R2xHYjhHNy93Q3JORjUzQmJjWlNkTE0x?=
 =?utf-8?B?Si9WcUk3QUJqTFpldFFhSjFVUW8wSDBUaUVEVEtzeEdrL2x6UU5hcDBjMHJN?=
 =?utf-8?B?Nm9XYjdhVEFYVmVET0paN2dHbnFrTnZGVmFEMVA0Z3dZRHQ3TXdMWnBMcnY1?=
 =?utf-8?B?VlZ1WThCcmErMjI4M25jYURYek5BWG9ZeDVZZWFvUDFFQmVVNFRyeXpLdjVm?=
 =?utf-8?B?Y2pNa3pRY2FmNWhNOCtJTXhveVJhQ2VTZlBSbnQ0OHVVU0g5alc1b3dsZm45?=
 =?utf-8?B?cStmWWlYUGdKbVR5dlJNMWdkK2RFWHJCYmljbnJBekt0L05GdGdHQ1pORUs3?=
 =?utf-8?B?RkVJUVNyblRtQjBwN2t4Y01Nb2tyVkNFeEQrdUJVbTdwNDRIcDV3dk1EbkVx?=
 =?utf-8?B?NUJsNmRYZ1FlWkZEcWJ6bzBmQmlTNzlqMEhsU2R1enpZd2tGbllPZ2p6WHox?=
 =?utf-8?B?cjJ5VDdlU01PV2lBQ3d3emx4T2NUQk1pbzMyVUlSeWlBaFNJRUVtTTBGdy9q?=
 =?utf-8?B?STR1SGlSQkRNUjFFQ2d0ZWMwL01CUlYvajY3dVI0L3YvUUo1REozdUFUQlZO?=
 =?utf-8?Q?B6DoEdKC7++8+VAjjckI6xvgPA/ZEM+6nJ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 16:09:06.1990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: cad65536-2273-48dd-fe40-08d8b7146327
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UVfkhJvYs7HguAuQui3+YXK1lMqzhRGwOuWol/fo0Ni3Ou24Q5WwlxHxK+yt2wjha6yRwyhBgW0wi29v/yKvn28uXfVd9xpPnmlcMtyxtNk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3031
Content-Type: multipart/alternative;
 boundary="------------8C57BCE3981866B3DF298F65"
Content-Language: en-US

--------------8C57BCE3981866B3DF298F65
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-08 5:28 a.m., Leon Anavi wrote:
> - Use Brotli instead of brotlipy
> - Made exceptions pickleable. Also changed the repr of some
>    exceptions.
> - Raise a ClientResponseError instead of an AssertionError for
>    a blank HTTP Reason Phrase.
> - Fix web_middlewares.normalize_path_middleware behavior for
>    patch without slash.
> - Fix overshadowing of overlapped sub-applications prefixes.
> - Make BaseConnector.close() a coroutine and wait until the client
>    closes all connections. Drop deprecated "with Connector():"
>    syntax.
> - Reset the sock_read timeout each time data is received for a
>    aiohttp.client response.
> - Fixed type annotation for add_view method of UrlDispatcher to
>    accept any subclass of View
> - Fixed querying the address families from DNS that the current
>    host supports.
> - Change return type of MultipartReader.aiter() and
>    BodyPartReader.aiter() to AsyncIterator.
> - Provide x86 Windows wheels.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-aiohttp_3.7.2.bb => python3-aiohttp_3.7.3.bb}     | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-aiohttp_3.7.2.bb => python3-aiohttp_3.7.3.bb} (81%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.7.2.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.7.3.bb
> similarity index 81%
> rename from meta-python/recipes-devtools/python/python3-aiohttp_3.7.2.bb
> rename to meta-python/recipes-devtools/python/python3-aiohttp_3.7.3.bb
> index c98e3aee7..bccbd4b0e 100644
> --- a/meta-python/recipes-devtools/python/python3-aiohttp_3.7.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.7.3.bb
> @@ -4,8 +4,7 @@ HOMEPAGE = "https://github.com/aio-libs/aiohttp"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3bf3d48554bdca1ea7fdb48de378c2ca"
>   
> -SRC_URI[md5sum] = "dcf770341241aa09340653a1562ca816"
> -SRC_URI[sha256sum] = "c6da1af59841e6d43255d386a2c4bfb59c0a3b262bdb24325cc969d211be6070"
> +SRC_URI[sha256sum] = "9c1a81af067e72261c9cbe33ea792893e83bc6aa987bfbd6fdc1e5e7b22777c4"
>   
>   PYPI_PACKAGE = "aiohttp"
>   inherit setuptools3 pypi
>
> 
>

--------------8C57BCE3981866B3DF298F65
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-08 5:28 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210108102814.9560-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Use Brotli instead of brotlipy
- Made exceptions pickleable. Also changed the repr of some
  exceptions.
- Raise a ClientResponseError instead of an AssertionError for
  a blank HTTP Reason Phrase.
- Fix web_middlewares.normalize_path_middleware behavior for
  patch without slash.
- Fix overshadowing of overlapped sub-applications prefixes.
- Make BaseConnector.close() a coroutine and wait until the client
  closes all connections. Drop deprecated &quot;with Connector():&quot;
  syntax.
- Reset the sock_read timeout each time data is received for a
  aiohttp.client response.
- Fixed type annotation for add_view method of UrlDispatcher to
  accept any subclass of View
- Fixed querying the address families from DNS that the current
  host supports.
- Change return type of MultipartReader.aiter() and
  BodyPartReader.aiter() to AsyncIterator.
- Provide x86 Windows wheels.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20210108102814.9560-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-aiohttp_3.7.2.bb =&gt; python3-aiohttp_3.7.3.bb}     | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-aiohttp_3.7.2.bb =&gt; python3-aiohttp_3.7.3.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.7.2.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.7.3.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-aiohttp_3.7.2.bb
rename to meta-python/recipes-devtools/python/python3-aiohttp_3.7.3.bb
index c98e3aee7..bccbd4b0e 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.7.3.bb
@@ -4,8 +4,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/aio-libs/aiohttp">&quot;https://github.com/aio-libs/aiohttp&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=3bf3d48554bdca1ea7fdb48de378c2ca">&quot;file://LICENSE.txt;md5=3bf3d48554bdca1ea7fdb48de378c2ca&quot;</a>
 
-SRC_URI[md5sum] = &quot;dcf770341241aa09340653a1562ca816&quot;
-SRC_URI[sha256sum] = &quot;c6da1af59841e6d43255d386a2c4bfb59c0a3b262bdb24325cc969d211be6070&quot;
+SRC_URI[sha256sum] = &quot;9c1a81af067e72261c9cbe33ea792893e83bc6aa987bfbd6fdc1e5e7b22777c4&quot;
 
 PYPI_PACKAGE = &quot;aiohttp&quot;
 inherit setuptools3 pypi
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------8C57BCE3981866B3DF298F65--

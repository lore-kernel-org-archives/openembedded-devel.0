Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.42])
 by mx.groups.io with SMTP id smtpd.web10.27707.1611149801521196384
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Jan 2021 05:36:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=B5Ci6zg/;
 spf=pass (domain: windriver.com, ip: 40.107.75.42, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CeWl4a8aCVWpm12cQDZRG0LyaWaGyY1M0xX2TEpYIVO6jgxg24VXyssvKAFBJgjLhzu+A0UypFkSkL3U89DUvulF2SnsY1XsFvNt8isX6vQDCdGsfPqTwaJIkwx11qqnrIjhLch5F/jivwFoWGvj0Z/px2uKPp8XUMYrbBLeIEHil7wKh7iE/ur0outm3clDzKKa9T59EWlIEiXzXK7Dej92PE3Amxg48M/2Txz4ngN0qmRsmfqUKd6iCyRbzffHV25cQrlKVaed18N5iqRbJSiNHUyWf3K6ge/8787Zk2L3QxQsul0NeRykhNiWyctFtzc4AK90OnCMqTBBSACdjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q8gy5nN1BcF+srfBqqjeOfWvBUTQdzNyiMRuabWTOHQ=;
 b=HQR6pUozJb5r1eFMdPxeJCfCxIhva2jCa4KixtXccAzqzaKtV0RvbFK5zdPkK+eYpCAcfLYhBFeuKdHjkXwldSxBXDNvgKxrO2iZMRcv0ld11ja8nWHi4cGvJUQP9yDVV/m3qlr4NrfFg8rLULXJQONm3y4+xyjYz3kBa8dI0jMfpGaJm2YIZJh+g8jntc4gvADJJAtrmn/r0ehIIfHs6lvP2qkXbP56LbSfbjPHETPsfarWNuSy9kCidQGK9Tqp+eTTMu22Gk0wf8UUQbhrn4+vQ+KRWpaX2haXQ6EYnvOBcaCdJ7MF5ngraLJH8qbK+zK9NJruw0IRcWryvKs9gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q8gy5nN1BcF+srfBqqjeOfWvBUTQdzNyiMRuabWTOHQ=;
 b=B5Ci6zg/EDq0Q5Ci9gxP2m6nSCh019teMWAFYeF6TKPYMR5T05wcoo7Nv0JRJ6DUj0ReIdsu09Jm0aqH4//6uykosAh3N256rNk4KxPWes7dLwXbzSJ3FSFsnntuC6f2E21B0/VsB7wmy+4xjeVeVCUzh8KqcqzIDsBtuA+LuE0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3559.namprd11.prod.outlook.com (2603:10b6:a03:f7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Wed, 20 Jan
 2021 13:36:40 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3763.014; Wed, 20 Jan 2021
 13:36:40 +0000
Subject: Re: [oe] [meta-python][PATCH 10/10] python3-yappi: Upgrade 1.3.0 -> 1.3.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210119173746.24694-1-leon.anavi@konsulko.com>
 <20210119173746.24694-10-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <21c4bdf2-8d47-ae51-fb8e-d98e1cb00073@windriver.com>
Date: Wed, 20 Jan 2021 08:36:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20210119173746.24694-10-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN3PR03CA0099.namprd03.prod.outlook.com
 (2603:10b6:400:4::17) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN3PR03CA0099.namprd03.prod.outlook.com (2603:10b6:400:4::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12 via Frontend Transport; Wed, 20 Jan 2021 13:36:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0e6889a-6cd1-4735-9355-08d8bd486ab2
X-MS-TrafficTypeDiagnostic: BYAPR11MB3559:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB355948A14B470F1C792362CF9FA20@BYAPR11MB3559.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:632;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LDvuiTXDzB/jRSiFsId4E9w4V7DG97QHzgO7TP2eq54Eq43W/qGFktB6acrwvVcig6bGfraWdQs0w2TmiYjZ2QKu/NM7a8VokaOqltrt8QIXSPEN1UonMzt4jry7YuG4wArMfXjoPM4FdZ62RddKO2dtPkamFxwSkuy9AvWHXjlh77g3koeDIdH4glUKyinUQubyAYeXPHy8SzpehhG2R+tGZkmbLXLtgSj2y4ucD3I6oqHB1VIy5cQ6u8EqnXuidw+R0/FW/PDs7RwSfKO4jNtd4kuLjKBagZ9Co3AGAeXty6YW3sKIMEDDv9yUfZxV1w28Zqwb1z3MKtUKB/DYEHQKSiKw/iKw0D/05p5Z+CaPfJKnC9nhO5/8uCvp8YcoUiA8WbaH2XDJPboiouJACJqeSIDerhcay0V0dW4RmDM1r2yERrHDJA/vNpknYXyaRtP3AyfysvmK8nQpfQolP9BSZ3sq3WelRgUYJyIl/ZlY+O9hL+dSb788G15rAztL4ruJC7czp9a984rPoMoU+ZbR9kpcAuXyys9beweObNlOK5fzuk6NbVTYRG+XvtYD
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(366004)(396003)(136003)(376002)(956004)(26005)(53546011)(44832011)(478600001)(33964004)(16576012)(31696002)(86362001)(966005)(66476007)(66946007)(166002)(83380400001)(66556008)(186003)(16526019)(316002)(2616005)(5660300002)(36756003)(6486002)(8676002)(52116002)(8936002)(2906002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?b0hQR2ZEQnkvMGJ2S1FSL05DSXNSL0VMd0xzK1NWZjdPT0hpY3BoSmkrMURu?=
 =?utf-8?B?VnhyT1VqMmxvdmlxTTBFbElJUXFiZlRkckhUOWFOcHZkd3VsdENac2lpM1gr?=
 =?utf-8?B?ejRLU2s0TnJWOGE3c2wvUjMvSm9pNHArL3JyOUlGT09GMlRNSVZabkhlSjkv?=
 =?utf-8?B?bnNvRUlGaTArV3JRRjdrMzBVTnQ1dnV0dk0zTzZKK2hhbmp6MzRtS285WXlG?=
 =?utf-8?B?TmZ6VDIzWFJzVDJEME9FY1ZURi85WlduaURYNStRZHk1M2JtWGFqRVNLbkNG?=
 =?utf-8?B?R25jM0J5WWszelNEc3FuU2dxUzgzbjYvaUJsY3pwL1piaHE2R3dCUlhMUGlY?=
 =?utf-8?B?REdlVFJHcTBnRmplblc4WDU3cjBOR0FTdmlmL3U5VW9WTlRQS3FJV1hPNzR3?=
 =?utf-8?B?VUdweVB2UFNlSlFPNU9YbEVMQ2Q4b0tCTmJ4TDFwY3ZHK2gyZVJ4N2srdEcw?=
 =?utf-8?B?UzNOOFo5L3k3ckNUMmFtOVl6REcvbzFacmZjNjBMMERzZTBHZlM4YU5qUmhh?=
 =?utf-8?B?UVRyY0dKaEt1NlR2cXFDclpMM1F4K1VMemREMjFFRG1veVg1R0ViU3VaWXJk?=
 =?utf-8?B?cSt2eEdIL2ZLbEpWUnBBd04wcVEzZUpNbDhTc2lRa2NTUDhubyt5SGE4d092?=
 =?utf-8?B?T2JWcHhLcndsbGhzVVo0V3h4c0RhMkY4S3FXbFNMeFhYdHpxWmhjMVJwZVJ4?=
 =?utf-8?B?SUt4NC9PN1lHaXNTcXlZVU1DOGoyWmU0NXBSeHhxSzJ3Q0xOS0NjN0kyYnp2?=
 =?utf-8?B?c0M0SWlrZlZUSDFLYkZ6Ull6eXRiaUNkY1I5ZnkrTlRyZDRCam52QmtWTys3?=
 =?utf-8?B?Qk04L3F2MGRWRDhHeU1LYzZ1OUxQelYxbEJtWFN5Ti9hWVNnWDVvUGZGVmJL?=
 =?utf-8?B?Zkw0eUxOa0QySWVwM0VZWjNST0FqQlFJZytxdjlWNFB5TnljQXV1S2kycmNy?=
 =?utf-8?B?bmtiU3pZaFpHeXpwYk1QR25xM1pQek5EQ21vRldIL2JLbitRK3dNL1U0bGE5?=
 =?utf-8?B?TCs1ZEJyaWdQbEVrb0U1bGdOWjErRW5yMk1mRGRITnVUTEgzS1BaemZ4N1VN?=
 =?utf-8?B?OVJFa3c4ajIzQmpWZTNaM05YSDBIRmF1NWs5Q3lmQy9WK2s5dC9RWkc3ODZX?=
 =?utf-8?B?UU41alRycGpJa1psd3J5QmhUSUpLYW1xK3g1Q0NrbGdhRUd3TXdlTk96aGVo?=
 =?utf-8?B?V1FwWE1wVnBuRlpCS3Rodjd1VlpXR3FPWXdyUzFkVUdUK2FUV3VoL3JaVWZS?=
 =?utf-8?B?Y21XRi9ENWVQcUgwN0ZKUFE4UXFxbGdyNXMxWVpnengvU21tMWlnY0VkVGhD?=
 =?utf-8?Q?xMa4d5d438bLVvCw9V1pZ4UGgkb4cfa8iN?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0e6889a-6cd1-4735-9355-08d8bd486ab2
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 13:36:40.0466
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I7l9WcvV07WpFkqYfZ4nZxSu1tPfnuSF3NwcLooSqgq4dS7CHZ78TBLu7dTgu0CG4r5r5ZxU1F09GCElCSmkiiBXwxN2jn4IFc9GUGbL1tw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3559
Content-Type: multipart/alternative;
 boundary="------------407DBC9F6133076478328800"
Content-Language: en-US

--------------407DBC9F6133076478328800
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-19 12:37 p.m., Leon Anavi wrote:
> - Add support for Python 3.10
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-yappi_1.3.0.bb => python3-yappi_1.3.2.bb}  | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-yappi_1.3.0.bb => python3-yappi_1.3.2.bb} (81%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-yappi_1.3.0.bb b/meta-python/recipes-devtools/python/python3-yappi_1.3.2.bb
> similarity index 81%
> rename from meta-python/recipes-devtools/python/python3-yappi_1.3.0.bb
> rename to meta-python/recipes-devtools/python/python3-yappi_1.3.2.bb
> index f87c3fb63..7c3f0fd4b 100644
> --- a/meta-python/recipes-devtools/python/python3-yappi_1.3.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-yappi_1.3.2.bb
> @@ -4,8 +4,7 @@ HOMEPAGE = "https://github.com/sumerc/yappi"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=71c208c9a4fd864385eb69ad4caa3bee"
>   
> -SRC_URI[md5sum] = "6dde41b116566cbe1575e41a1e376f74"
> -SRC_URI[sha256sum] = "a443240f4a776fa1be04430bf423dbf09615c05eba34f4a2a6af344a7ce8ff61"
> +SRC_URI[sha256sum] = "a51d3e6e5563cc74b5bb82ed6e7bd44a9c1a7eae3d97e4d52e9465edb3a8da8d"
>   
>   SRC_URI += " \
>       file://run-ptest \
>
> 
>

--------------407DBC9F6133076478328800
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-19 12:37 p.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210119173746.24694-10-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Add support for Python 3.10

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210119173746.24694-10-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-yappi_1.3.0.bb =&gt; python3-yappi_1.3.2.bb}  | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-yappi_1.3.0.bb =&gt; python3-yappi_1.3.2.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-yappi_1.3.0.bb b/meta-python/recipes-devtools/python/python3-yappi_1.3.2.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-yappi_1.3.0.bb
rename to meta-python/recipes-devtools/python/python3-yappi_1.3.2.bb
index f87c3fb63..7c3f0fd4b 100644
--- a/meta-python/recipes-devtools/python/python3-yappi_1.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-yappi_1.3.2.bb
@@ -4,8 +4,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/sumerc/yappi">&quot;https://github.com/sumerc/yappi&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=71c208c9a4fd864385eb69ad4caa3bee">&quot;file://LICENSE;md5=71c208c9a4fd864385eb69ad4caa3bee&quot;</a>
 
-SRC_URI[md5sum] = &quot;6dde41b116566cbe1575e41a1e376f74&quot;
-SRC_URI[sha256sum] = &quot;a443240f4a776fa1be04430bf423dbf09615c05eba34f4a2a6af344a7ce8ff61&quot;
+SRC_URI[sha256sum] = &quot;a51d3e6e5563cc74b5bb82ed6e7bd44a9c1a7eae3d97e4d52e9465edb3a8da8d&quot;
 
 SRC_URI += &quot; \
     <a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------407DBC9F6133076478328800--

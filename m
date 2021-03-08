Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web10.35738.1615212221870782693
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Mar 2021 06:03:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=V3bZA4i4;
 spf=softfail (domain: windriver.com, ip: <nil>, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d976wNdS2EG09e6GmNQYcPQB29yC2ceHh7YNdp/4pSRQOGyKPzdijzErPYPBlWRIDvaMOE3P5ShX/Cy/2SO/coQDLwlK0pmjK/RMRQjr9MMVC1PbdsSXCDlUvLTbDsFnSVLBjnKiUXFZ3nTu/CI6sEb5o9GKi5aTTLKFGf8XXANuaBSYH1TomX3g5txuJy4YILlXoYIps1gRWCaP09GwNB0payI/x1waYqH1IeHOzMMKk/oCKIBfML93jt5rGFfPfofcYoqmfYtwoCtp/zxMWbwkOf2vGulWyQ0oGAGEjqjHky3TL/7SraKBDoPuDNta+QKbI6hbtplV2rlLs+quEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z+ItsQcIP3xxoFQmjCb20hZy7QUT9rAR5w6n3f1b0NM=;
 b=gdtytRZgDipR/I37fNm6Ny5RLIT/in2YEfIPcZ8jKkzcmG+rrvK+aT6e7nnqFo+kIAKGyR159Qp4mA0WfW2jBcqWPqVUFTOR3wapRe1tq9jKSvFpuqfdMMaeHbe/sMqbRgoLv3vA1Df8Qdxuaf4TDENiQdpYMvD8CCvTM1g0oz1nXALDa6O/LnpJ+wrxpLOzrTbyj5yzwur2C6BrVo8Eo9aHCtAe6aYELCAI8El+FuI5aa5sRRBQNBOLJITOTEIW7FfSx+ffHT27UFNzA/6ItNpQ7w06UgyuvZImUho3Q25kBw0Pw4Eusv2TtGdM8HRKXTnrGTxCDA7ywRQpewPrCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z+ItsQcIP3xxoFQmjCb20hZy7QUT9rAR5w6n3f1b0NM=;
 b=V3bZA4i4Xx7Qohlry8e7XrOrG/i+d2KwOofIWynVAKEt/7Pd6+qg4kNZTUD/K8gpvbo0bxE2e5myTG865WHF6kzFffXKIx7Hh8nNcvWizhV6aU+4Zj1SHRGF2AoKEVdQ5QojK/MCjQh+NgipSIJeZHELmAviav537n/h25k6cuk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4103.namprd11.prod.outlook.com (2603:10b6:a03:18c::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.26; Mon, 8 Mar
 2021 14:03:35 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3890.037; Mon, 8 Mar 2021
 14:03:35 +0000
Subject: Re: [oe] [meta-python][PATCH 1/5] python3-ipython: Upgrade 7.20.0 -> 7.21.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210304130554.32308-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <e6bbbadb-2195-05d3-dfb7-f5fd2cbd3392@windriver.com>
Date: Mon, 8 Mar 2021 09:03:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210304130554.32308-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN9PR03CA0747.namprd03.prod.outlook.com
 (2603:10b6:408:110::32) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN9PR03CA0747.namprd03.prod.outlook.com (2603:10b6:408:110::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Mon, 8 Mar 2021 14:03:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34ca5a35-c60a-42e1-de00-08d8e23af735
X-MS-TrafficTypeDiagnostic: BY5PR11MB4103:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4103BC6129B88274EA78E6B49F939@BY5PR11MB4103.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1169;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	I8xJmhz4+V6p7vipbjwEMTRhYcntY9IZbCizfRnA+KDXpgQy8VA/w39cxpsu8b52Mo1DTK4h3x0wqMeG4AF3bWQf0QEnMM4qnZOxEInArYlXDdb5y1ls7qRkMfxwcPOZGOKz4y4/081BcIZ5BhYqb+2BG+qgcINDp4FVUy3Rnukq/QTmJIUFXHNvRsd7D+8Bxv0Vc8Vc2NjV2nSDY3a+FRAFlNZaDzboFtvvzgABW8spxdE/dr39FFcnNW4vg08L1neJ7V9JKYIM0vdGP2aNfdf60cHrOlCOHUb2ROPTRJAZ8y+2tAR+xzlloZAG0Gr0/NFsG3fq/Rz8UA2rqsLudVYISLjqXXEthA+JMGmzjGy/hOT8D/7XkJQVxFImSbFozdfS0ofcbhJ/DI/ZhuzVWnzYta5vuRZf/yInmaMvI4fybLuIxLQJvm95FL2Z67iXoZ4o5bb1DzfNK94PyMMQ4B3WgXi6UDmqYyms1BkcKFpkHR7CNITWp6FkcQbnE4fEzTVC9Alh1c+8l7wEEtEsY6OSkYrOXO2g5jaRDhK9AL5YWFl859Llj0aEtyuGtEBcHrPG63HwJKLYM7RzNPZCXCwRHPcooRKqPCZIIM2bMPCqXAPWh6wu6yBlXThj/T3LIJVxI7cDLsnhC30Chon5546eNQqY8UXWgDZfMzsJfHenegpNzfHwd7NkJ9NDmf2N
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(376002)(346002)(136003)(396003)(44832011)(66476007)(2906002)(83380400001)(16526019)(26005)(66556008)(36756003)(31686004)(86362001)(31696002)(16576012)(8676002)(6486002)(8936002)(956004)(478600001)(53546011)(316002)(2616005)(33964004)(166002)(66946007)(186003)(966005)(6666004)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?SjlkbEVnd0cramx5YVdxUG1mY0hBck5ZZWJ3K3hvRExiYURwSXprZWVOMkNK?=
 =?utf-8?B?ZVNsOEl0UWplbFNydE5QcFFWL2F1Z1hKMXJPL2pWZFlqYkNTMGtTZTZNSEYw?=
 =?utf-8?B?RWV4RUp1dFRBNG1UbXM4NXp2M1RuS0gxSUlmYkZqcU1nTEVlY25hK1NBS1dU?=
 =?utf-8?B?SDhGeHlNRVhwTndLTkgxa2xHTm1WazBTamdnWDQ4eTcwVERDTlpwWHdOTEZl?=
 =?utf-8?B?ajdXbUZ3MGJQRFgxV0Ivc2NwZUJvTzkwbERBdGR6dDZKcm9ncVdYeEt0dE40?=
 =?utf-8?B?L1h2NUEyaXN5S2JLQUxSWjJzWEcwcG9wbmhYN0RuZHkwZmJYUEJ0SGJOamxm?=
 =?utf-8?B?TWR6bEdMOXdQVE5HOG0xWm94OWtVMjk0Q1FHZGQwa3hwdEJocFhIWVVWM0ZN?=
 =?utf-8?B?bGgwd3JCR0ZmSnV1anN5WmI2dVJnS3JscmV6dUZZd1FHQWtmVU5sb0JYWUFP?=
 =?utf-8?B?NHp4SmcyY3F4ejd2cmNWeXJHV0l2QWNmT0lkTFB1cEdyTGVFYytXZVY2bU1m?=
 =?utf-8?B?L2dMM1lqTUlpN0tlZ08wU2lxekhtR3BwVmtLempiRlVZa3ZBNUl2L3hOOTV3?=
 =?utf-8?B?cTBYRVNydXVCaGpySDd6cms1dUFzQ2tyQzdaZW1Jdkhac0JVSUEwZU1CZUZ2?=
 =?utf-8?B?MGgyMGRrdkdSZ1pybmQ0bW5nWjViVkFmSjBsMGkzNjBCTVhLSjNYaXpQdzRj?=
 =?utf-8?B?TEhBRVVQTGJIVDJwUXhYQlUxSWIxaWw2cExOY05mM2pvQVk3Zkhib055R1VE?=
 =?utf-8?B?RkF4YUY2Sis0SW9rNVFqbkxXK2hLVGZMVUpKUnRDNWdnalBYMVVuNFg4ajhY?=
 =?utf-8?B?RTdNR1p1NGFoNmNoSnEwQUk4dE1VZzUvMk5YYkM4UVUyUGdOdVZodnFMVDNu?=
 =?utf-8?B?N1FOb1ZKekpJTUZoSG52VG5IYUh0MDBCaGYrSUxTMTNoSEVKRWZkMGxWRUsv?=
 =?utf-8?B?Zk1wOWgyM0dOTjEyZzJNNldwYTRGZ1oxcEUwYVFBaG9ENC9nOFYrUkFwRVd3?=
 =?utf-8?B?MnJoWlJabmZXR2tEUTd3ODdFcllPam1BSWhBNXp2ckp2Z0Vmc3p3cHp1TzQ3?=
 =?utf-8?B?S1pGNWVWZVpLTzM4ekgxbHBMYzYrVXExcXUwZDBZZm9hZ1BSUzFGdjRjM2Q0?=
 =?utf-8?B?QkRTd0phcUdOU0RVMDU2bW8wdlFCUkx2RjM1ZlBnbDhBemxwTG5rd1QrWngx?=
 =?utf-8?B?Mng5WGFsNEFKYmpRTFA3ckMrR2lsOU91bTBGNkl1OTloREVqeVYyYnlHM2NU?=
 =?utf-8?B?eDV3VUJqK3ZXNE1XclhMaVRiVzYxUGdwMXlSLzIzc2FvUUFhN1JKWEh0Uzdr?=
 =?utf-8?B?akZkR05Ud3dxOTNOeGNJNWlIQ3hSKy9YZjgxNVptaS8yTTF1RG9vU3pTOVNC?=
 =?utf-8?B?RyttNzJSek5tZlpzYU1XemN2aHB5ZnpTelZiS0VBNmtvWUtnRmpTUkIxUzdj?=
 =?utf-8?B?SWJiMHBWVWU0SU1TdHUzOCtGdEIxSFVMZWxmdVI4ODlwY3VBdXBxWS90MkZO?=
 =?utf-8?B?WHhxNk9wTFVpQ0o5WXoxL3ppRG1PSXdVQUpHRUpmNE8zM2ZkS0t0VjRHSlho?=
 =?utf-8?B?VVM0aFpjK3VKT0x5a3dsZEQ2bkorZmZVYzFJb0dOSDYvTVVZVEppR2ZIR1U4?=
 =?utf-8?B?bkwzME04VlRwdkttSkx4dzRwcXRhR3loMUtoM3dsd0V1VlR2Z0s5cndCa1dP?=
 =?utf-8?B?QXlHOW1hYU4zZW9zdGtCY2dDb2NQb0QrWndCK2FNWW5vNUhaS2dYTjc0RVYx?=
 =?utf-8?Q?ADdn1cN1KQEIMktzS3T390sy/ZhSvCAqDIm0z4a?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34ca5a35-c60a-42e1-de00-08d8e23af735
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 14:03:35.7677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jLQ43BxtpUtmKBppHB5IBFK/RJbo37qLqPT9+QZSza0w4XF6JjKPiVr2mAmcF67UxzzI1AjXvdAOFUU4sZn5EDri2Bq4KUd3L38Z4DJJ7qY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4103
Content-Type: multipart/alternative;
 boundary="------------4686080181AF169B98574450"
Content-Language: en-US

--------------4686080181AF169B98574450
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-03-04 8:05 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 7.21.0:
>
> - New "context" command in ipdb
> - Fix some issues on new osx-arm64
> - Compatibility with Xeus-Python for debugger protocol
> - Misc docs fixes for compatibility and uniformity with Numpydoc
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-ipython_7.20.0.bb => python3-ipython_7.21.0.bb}    | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-ipython_7.20.0.bb => python3-ipython_7.21.0.bb} (89%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-ipython_7.20.0.bb b/meta-python/recipes-devtools/python/python3-ipython_7.21.0.bb
> similarity index 89%
> rename from meta-python/recipes-devtools/python/python3-ipython_7.20.0.bb
> rename to meta-python/recipes-devtools/python/python3-ipython_7.21.0.bb
> index 42795b9bfd..31ea244e34 100644
> --- a/meta-python/recipes-devtools/python/python3-ipython_7.20.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-ipython_7.21.0.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
>
>   PYPI_PACKAGE = "ipython"
>
> -SRC_URI[sha256sum] = "1923af00820a8cf58e91d56b89efc59780a6e81363b94464a0f17c039dffff9e"
> +SRC_URI[sha256sum] = "04323f72d5b85b606330b6d7e2dc8d2683ad46c3905e955aa96ecc7a99388e70"
>
>   RDEPENDS_${PN} = "\
>       ${PYTHON_PN}-setuptools \
> --
> 2.17.1
>
>
> 
>

--------------4686080181AF169B98574450
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-03-04 8:05 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210304130554.32308-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 7.21.0:

- New &quot;context&quot; command in ipdb
- Fix some issues on new osx-arm64
- Compatibility with Xeus-Python for debugger protocol
- Misc docs fixes for compatibility and uniformity with Numpydoc

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210304130554.32308-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-ipython_7.20.0.bb =&gt; python3-ipython_7.21.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_7.20.0.bb =&gt; python3-ipython_7.21.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_7.20.0.bb b/meta-python/recipes-devtools/python/python3-ipython_7.21.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-ipython_7.20.0.bb
rename to meta-python/recipes-devtools/python/python3-ipython_7.21.0.bb
index 42795b9bfd..31ea244e34 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_7.20.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_7.21.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f">&quot;file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f&quot;</a>

 PYPI_PACKAGE = &quot;ipython&quot;

-SRC_URI[sha256sum] = &quot;1923af00820a8cf58e91d56b89efc59780a6e81363b94464a0f17c039dffff9e&quot;
+SRC_URI[sha256sum] = &quot;04323f72d5b85b606330b6d7e2dc8d2683ad46c3905e955aa96ecc7a99388e70&quot;

 RDEPENDS_${PN} = &quot;\
     ${PYTHON_PN}-setuptools \
--
2.17.1

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------4686080181AF169B98574450--

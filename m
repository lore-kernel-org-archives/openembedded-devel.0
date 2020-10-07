Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.76])
 by mx.groups.io with SMTP id smtpd.web10.1506.1602078565403297487
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Oct 2020 06:49:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=n0Yj89D+;
 spf=pass (domain: windriver.com, ip: 40.107.236.76, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K7+akaAeVFyN/ggbo+Yruc5LwQyizdPZhLmsX5PBpaNwKo7pVCkBJ/sgncjbM5G3QRwvDQITnifPtPDehTPxrBBZ42GvD7S00X5TOvsC8CsgDo2NVskZZECvuUXyvRqYlK4h0UQmTiBi/tlx/qxdnfuCi7Emw480SnKUnKY1K7m1Goo3EebgcmOAAVJLXR1LEMLNz2Y4H6kk/48EbUtwB/EIUCtvadkL54EuahnHJ4wrevybaIEtY9gWMZtIqjhq2Tw1tFpQ2qBsvwPo/lQG5f1beq78JqeJ24qHUu2DebymHJdSlGe/gw9zZNh2upscNq/aki5vmvDA0uiC8v29Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SaV9MwoI3QfpY9plHs4CBcP5uKwSn5OwOR0Q20s7EeE=;
 b=Ms6SOQvFopSessLcsSz8xF0SdnFFsH2OK3/i9pw0TpabdM1axv5SLjiMYG66IyM2bj/4G2fT7Fv8mrbJrFKwg+Z4j+I7Ix14R04orh8eccSovocgu/iPMex2dfL1k2HzmGlpkctmNsIgk+TH9l/Y8cb9cmeI5GAf0YUh62Y8BzfPiJ2cPD5BbiDk3PWlZ5fUmigNs1qS+9StTyPAaiDhikLeRFShkz1RX6YP8PxSfZbiTnhMG64muCo3VuAuvHu4aNxvjjTwsVht2l+uQAriuRfqZwlXlRYQdQw7QtjKeYMjSW1Ie5dHKxODrRXuguNiHx1O9bhSGQhlr7+wAdzLrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SaV9MwoI3QfpY9plHs4CBcP5uKwSn5OwOR0Q20s7EeE=;
 b=n0Yj89D+aLChtU4qfqOHRM7DJfRw/hu5IkY9oB5FMXiLrJNoSNd8K/FbKGZWGVAC3VoV7bxK/fQJ2csTcfLyLm06fpTsF3oIvC083fBEm7FYvrYH/LM+cSwrRQ06zGx1g6Xm7LFP8BR201cLyQUb1xJbqnaZePEojs0YsuFyDXk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2536.namprd11.prod.outlook.com (2603:10b6:a02:c4::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21; Wed, 7 Oct
 2020 13:49:24 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3433.045; Wed, 7 Oct 2020
 13:49:24 +0000
Subject: Re: [oe] [meta-python][PATCH 4/5] python3-nocaselist: Upgrade 1.0.2 -> 1.0.3
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201006090526.24310-1-leon.anavi@konsulko.com>
 <20201006090526.24310-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <fcde4e0b-bc59-d308-a319-f64b2749d8f8@windriver.com>
Date: Wed, 7 Oct 2020 09:49:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <20201006090526.24310-4-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YT1PR01CA0081.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::20) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0081.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21 via Frontend Transport; Wed, 7 Oct 2020 13:49:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33bdda0f-1c94-42ec-2a65-08d86ac7cca2
X-MS-TrafficTypeDiagnostic: BYAPR11MB2536:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2536D1C6F2A2839BBB7C388D9F0A0@BYAPR11MB2536.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WtnPtFuIv/MPW6C4eazDqADCaOypPKuZRtsM7wQfSwxKsx82WwIpsLjyru0I0hiDSbzAZ7w1qSwak9a5F2DKtxSJqX23pliU09zk+nueMq+5l50ev8RbkOr59JEqw/H3DLQEDucl9Go7F/+XMczsw336iMsnUD4lUVZt8sAZiQa83F7pq/D7ke0aNzTuPnvXjpw9s5HrcT6Mqd6Nw3jqrafkBcZcxFWvkqmzodYU5R0EE8GRevHjmFqZkjfx6CDsImSsNF0CwPt4J8jakR3Ei6d7Ky5lCpI/pbdibIyyFxsZAfc37UgyUmYEF9Jzf3u0oCxGyqaX+agSoLykGXr5kQcU2qhFkMPbse3LUGuRHZ6CFFVHueasE4jbQnuQ/Mtf278LlHKm/81HQXi8uKvZ/eIHW6F4prTo9w66ezggy88zCEyJrMhBOcSQbVoxkokorFspU+WsKS2bzadKqUZFug==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39840400004)(136003)(346002)(376002)(366004)(396003)(86362001)(16526019)(26005)(186003)(166002)(66556008)(66476007)(66946007)(83380400001)(2616005)(956004)(316002)(52116002)(16576012)(8936002)(8676002)(31696002)(6486002)(33964004)(5660300002)(83080400001)(53546011)(478600001)(36756003)(966005)(44832011)(2906002)(31686004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	GaWBVFjT+/zFZ6yCDMlhe15EnxN1XxBsLkXMp0gXI65Uni9SBn30UyY4T9hxfp9hWTfD2VTDaZheX0wN77799m2MPFIxC5JEBm+XtrksGJtXOtnuw+pZwNY+GpESdBxs7S+WuQB+HJQn50QdhGeCAAu5mi5xv+UAltKgSsb/H06EVZVZPpUqVSW1FCy+N1cQBtlb2z4DpZpQI7wGAXFlVDbuJZC8OPcZshHex3oPomlN0YzzqGvcQG+YtMKDR3QaO1l9doOBexewGCrd7bqmQldH+FFREudpkwR2oPuiqGAXthw+ylhLwDuP/Uuh/r8DQpjBl5fEATa5WyS8dyXjTNBcqS10n4K1qa5MxfShj8sOaBYSpBhX52y3shEHpcZL2pIm8WXfPx1P2M3RpQjMxFWpwnDAmqGUI2Y2vZlt1ZC1XYanUvtCDj4HTOqr+JveNJy7RAmQG8wclMlJgD8rQB5IXyZKRkEnECdVCcpik7mwqh5hQOydq0TMd0tz/bN5yDGts7t23FYwTQ2F8QJW1q8TegqtxS5QW0aJeCVMVQh80SvBuuqhl/eIHJfdCnrJRHjhdmyWUJ2ZkYK2M4qUFcOJCEI1EpNg2E4s/lbAmREHs5z1LyLid+tHqqykxLorkb1n6JfS/SaQLo3pvD5USw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33bdda0f-1c94-42ec-2a65-08d86ac7cca2
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2020 13:49:24.0279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i+Ye/ieDM4Q2IPgl0Kr8x5PvKAQZaanmiOZlNNF1Q2Isw4BVKnQ3XPgLeQWipqkIFn0A+HDuuiVxWFPSNnpLYlzQp22LOR1U/ItgXWKfxQM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2536
Content-Type: multipart/alternative;
 boundary="------------0C0E2C0F79ADD7BADBBD42AD"
Content-Language: en-US

--------------0C0E2C0F79ADD7BADBBD42AD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/6/20 5:05 AM, Leon Anavi wrote:
> - Test: Fixed issue with virtualenv raising AttributeError during
>    installtest on Python 3.4.
> - Added checking for no expected warning. Adjusted a testcase to
>    accomodate the new check.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...ython3-nocaselist_1.0.2.bb => python3-nocaselist_1.0.3.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-nocaselist_1.0.2.bb => python3-nocaselist_1.0.3.bb} (61%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-nocaselist_1.0.2.bb b/meta-python/recipes-devtools/python/python3-nocaselist_1.0.3.bb
> similarity index 61%
> rename from meta-python/recipes-devtools/python/python3-nocaselist_1.0.2.bb
> rename to meta-python/recipes-devtools/python/python3-nocaselist_1.0.3.bb
> index 8509cd0c94..1119c7f38e 100644
> --- a/meta-python/recipes-devtools/python/python3-nocaselist_1.0.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-nocaselist_1.0.3.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://nocaselist.readthedocs.io/en/latest/"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
>   
> -SRC_URI[md5sum] = "10e58542c1225aff3f057e89e9ae4394"
> -SRC_URI[sha256sum] = "3cfe964c436991cd6bd9f2cf23375c484ec7cf0c7488471381eff13a4fdac902"
> +SRC_URI[md5sum] = "42ba878fd70611cf345c61edd83f5fb0"
> +SRC_URI[sha256sum] = "7e6decb7d85563b9044913c9087ef4b691bc3da4d7ad1d88968cdea409553326"
>   
>   inherit pypi setuptools3
>
> 
>

--------------0C0E2C0F79ADD7BADBBD42AD
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/6/20 5:05 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201006090526.24310-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Test: Fixed issue with virtualenv raising AttributeError during
  installtest on Python 3.4.
- Added checking for no expected warning. Adjusted a testcase to
  accomodate the new check.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201006090526.24310-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...ython3-nocaselist_1.0.2.bb =&gt; python3-nocaselist_1.0.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-nocaselist_1.0.2.bb =&gt; python3-nocaselist_1.0.3.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-nocaselist_1.0.2.bb b/meta-python/recipes-devtools/python/python3-nocaselist_1.0.3.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-nocaselist_1.0.2.bb
rename to meta-python/recipes-devtools/python/python3-nocaselist_1.0.3.bb
index 8509cd0c94..1119c7f38e 100644
--- a/meta-python/recipes-devtools/python/python3-nocaselist_1.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-nocaselist_1.0.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://nocaselist.readthedocs.io/en/latest/">&quot;https://nocaselist.readthedocs.io/en/latest/&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327">&quot;file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327&quot;</a>
 
-SRC_URI[md5sum] = &quot;10e58542c1225aff3f057e89e9ae4394&quot;
-SRC_URI[sha256sum] = &quot;3cfe964c436991cd6bd9f2cf23375c484ec7cf0c7488471381eff13a4fdac902&quot;
+SRC_URI[md5sum] = &quot;42ba878fd70611cf345c61edd83f5fb0&quot;
+SRC_URI[sha256sum] = &quot;7e6decb7d85563b9044913c9087ef4b691bc3da4d7ad1d88968cdea409553326&quot;
 
 inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------0C0E2C0F79ADD7BADBBD42AD--

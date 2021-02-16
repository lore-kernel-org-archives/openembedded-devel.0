Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.45])
 by mx.groups.io with SMTP id smtpd.web11.7307.1613480331801010354
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Feb 2021 04:58:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ZFdnkfJi;
 spf=pass (domain: windriver.com, ip: 40.107.93.45, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hs/pluzBfK+pVR4uyKrFVFtdKuR61pOdOpzbqCLcQoXP8H3KzBhL2c8gpAPCCCWC7vJPita3QihlqQFneXM9aZ8BwRK6NfcFExahtFZCDuWEC6RC5defj4Ivw35jMFbfcTGr7YYQQgpY8MJzy46SOSq+pw2BM3ZxFRU3W+7FErx2gymOpkoND+DC2vcHAGMpbOE4EONQBg862X8pts/AXNKmg6Vw0O06c5GA6ux34uapnVUVHmlQKLrLzxXBS1q7Ygxcy7J8s7Nc1+7rChQgxgL+OljMfaMn6qWwkRA/rFEcEYXrwCvOpuRYFW1mTOe9U+BzC91c4O6WJSm7JP3DWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1xQQNpSKt/JXMnHOqdRrKw6hy6MGW+hmZHMQH23KXgc=;
 b=G9gY17G6IoarUnGSBlD6DoyOujgrZCwMmfVU9nmCv1yLyMSuT0dbv75cjvFmW+jBzSeuLO8nybtIn6Tj9DxPAU/VIhKC5+zT9717L5oGC8mcNfnv+3leyPiaeMTcVPQ6CadZ3v5KSgSpEAfSStReR/uQ1g1cEORMQqtJx3OnoGJentuI+S1y1bNSx6yJwIIChI+M4X4pk+n1LgXGYio5C25DSpzgy03htMNSzvVy3GoerBuAJksQtc4pRwEllGV4hBkzLFsqIP60j3sOjHcjrBeUXHIw1XCffYW9YRRh3OfHWOV9IaPiU/aFHvKeBs0EZhfds+yHHl6pAbRprhz9yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1xQQNpSKt/JXMnHOqdRrKw6hy6MGW+hmZHMQH23KXgc=;
 b=ZFdnkfJiUEiMclE6jvuqcgxfd/Ai4tg47n3bYIMEdQ1FztK8/WQFuXA2eMs5Ftcj73ldzsIusLfq/JT3XvH9+qSqJw81e7XDG5z6yVSrijmUOcRxg7zKxVC0KOOavQ41LbexqN6WhemiyOCMj1Lv6lkvbUbiy8Uetaz/xVVcP4A=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4418.namprd11.prod.outlook.com (2603:10b6:a03:1cc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Tue, 16 Feb
 2021 12:58:50 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3846.042; Tue, 16 Feb 2021
 12:58:50 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-protobuf: update to 3.14.0
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
 openembedded-devel@lists.openembedded.org
References: <20210214011910.446840-1-open.source@oleksandr-kravchuk.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <7fb41d5a-5055-44a6-baf3-12fb9c5e0647@windriver.com>
Date: Tue, 16 Feb 2021 07:58:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210214011910.446840-1-open.source@oleksandr-kravchuk.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN8PR12CA0024.namprd12.prod.outlook.com
 (2603:10b6:408:60::37) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN8PR12CA0024.namprd12.prod.outlook.com (2603:10b6:408:60::37) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27 via Frontend Transport; Tue, 16 Feb 2021 12:58:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 499c2828-da57-4e88-546c-08d8d27a9af4
X-MS-TrafficTypeDiagnostic: BY5PR11MB4418:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB44188978FAB59913E49F7CAE9F879@BY5PR11MB4418.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7+uDpwIJFxJBA08SyypG7PLw7mB2fL5KplJchBgd5ys0UNzwSvZAbx/IBo6fYHxdnBJxqWqZttrzlEE2XRlrpQoKhjcC6VoVZe4AIBQlZN49S/PWS9OPu/h7L8Yxo8/8hIL/LDT0QXVDZmPhwzPltAuy5uvyoy58BqUyqcTaR6Lwo7TXtAY90QJfDKEhtcfbRZZxFXie+NkRaK1ndHcEDTLQpQryJLZ/q4oq53RS7VlruG8NdqP5TZ9IX0P9FIOuRngflmzz08JNfHcK2WHm4aboWXxYKx6xiGNow9p1tsqilN1uMX8vTYH7hb2rZHz8swEJapqSgYN6kTR4vPNalv390R+3IOx+x+l43hkWyUTDCeGJW4FRGkJjO5T1u61KU84zuTNaF7A3q3xv/PHOO9yjQJFfZWnTdL9pCjAUQnItZYR7dl9mxRpuxHqkSuBRVEt1iLDAgx90vTz+8fGgz1GoG3vmBHKWSXCCQfoXLtfUzalXL+L8BtTRtisUtePOmGNiw005ezX8uz2YyLvM2pbfb6/ULzSlnmKHE31XWSmmEnumr+O4dg51uGEyxrbc+b2htTkBKiqMHiQSoQlOKdM/ktE/+Axty5XpnHSIurYNjYueY2Hbk3xi0UPdkPZ6kqISbAGwbjmmZIHJJbHzYK/Oz4I6D7p8iPISs0LCJ4tOSVGtBs4sW4XXeed6p6J4
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(396003)(39850400004)(366004)(83380400001)(44832011)(2906002)(2616005)(186003)(478600001)(86362001)(33964004)(53546011)(31696002)(6486002)(52116002)(36756003)(31686004)(16526019)(8676002)(316002)(16576012)(8936002)(66556008)(66476007)(166002)(26005)(66946007)(966005)(5660300002)(956004)(15650500001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?OGRxNlJheE0wbzV0QTlKaHNuL0xxRVhiWWxYRG9VaUxrMFdFbFgwYjUvWlFz?=
 =?utf-8?B?UDRxWlpXSThub3NleVFQOXk3RXlSbklJNnFHRlYxcDAxdUhRaE5Ebm9SaEtL?=
 =?utf-8?B?M3IzR1RSK0pQa25CWG43MWttN3ZNcTRUa0lFK21WK0FhZnBkMDRHRHBSRTFo?=
 =?utf-8?B?bjdHa3FoVmw3dXJWcDF5UWV5VDRTMzlzMXJUZkx2TXRXWFIxamZWNWt5eEhz?=
 =?utf-8?B?eHZCVEhWVy9UT01LcnluZGFMUEV1V3pmdGNialc4V01NZm5iVzJSd09LeU8v?=
 =?utf-8?B?UW1wc29td3FuQnZpN01XdVN2QzkvSjhIWWtKSVJZTkdKVDZySUxuc2lnZ2Fw?=
 =?utf-8?B?T1RBL3lCMi9EMVAxRzh3MzdHdWY1TzlwMUdCYVFNSmJKWXVYUElSeGFHa2dJ?=
 =?utf-8?B?UmNqdWNoUkZlckUxR1FIckplNGZ4NmNVbVR5bEtYd21LR3dNUGw3amQ2ZTFV?=
 =?utf-8?B?OXVMRkV4bDVrbExYN253aXVibTRKK1ljSGxITlorRnhYTUdJejVlUGZoaTlK?=
 =?utf-8?B?U3ZJcFZnTkREOXdORFN3UnEyZmdwVHdjb3A2Zms0MXgxVzdRbG9PTXo1bTdB?=
 =?utf-8?B?bGJ4R0NLRW1ycFR5dmdIWXdoYjZGSzBUZEJkUFNndEs2aENEamRnSzFpNDlF?=
 =?utf-8?B?WlZsUTZ4aE5wVkJOT2dxZy8weGdzUGJDUjFpRWpWV0h1emxITDZ3alZpZWxk?=
 =?utf-8?B?aGh2WXhkbGF0NERLejFweHlVbXVKQ2g3MW1YR3hnMHZCdklBYlBTRmtLTVQ0?=
 =?utf-8?B?U3o0Ry9DNDFyd3NWR250eDFabmZMNHYvVEpkM0tQbCtLVzRsaDFab0h0cDgw?=
 =?utf-8?B?bThGR2RSSXFzVnRaODV3aURrMUNKcEFwekdqTWdwQzBGb3ptZWdsNG1ZWFZX?=
 =?utf-8?B?cjZ3TTZTQ1d0YXdjdzZaU2cxQVJVOEFWOWhxUVdJTWpLaG5KamZIWWNOSWQv?=
 =?utf-8?B?NFVTY2g0YlV6eStBL2psc05nbE1pSmF2anZvRU5wVjJ6U0JMZndVSStlQU9S?=
 =?utf-8?B?c00vNGhYQllJQVo2dEZSKzdqVzJ2czRRcEtnNUZYQWtDcyt5QkdVc3E0UnJr?=
 =?utf-8?B?NWZIbXhvQk9nWVd5NnN6MG5EZXFNYUIzV1J2WE9wZlZpTEp1Y0Fqd2VoZjMx?=
 =?utf-8?B?STAxdE5Sa0JWNWNwWnU3YUI4bXkvelBlbERaWWZ3b0ZxejJ1UFN2VE5DaGF0?=
 =?utf-8?B?T3dSWUtLcm9zbHcwSW9aRnNCMnM1c2M3dlo5ZC96YTFuejhYSXptMHh6Zjdy?=
 =?utf-8?B?R01vUjh2QWVNMmVNRE9xblh3RUVudWxaZlAxcnBJYjVqNTAxSDNVdFlBMDUy?=
 =?utf-8?B?TkdxVkxwSjZxcURFck45M1VwTmk3TXlFL1d0eTdpdE52YklvVGhkWWpqSEhq?=
 =?utf-8?B?Y3VISms4cS9xWFR2Uys4QzJoTjAvVThFdDRHeWNDRG1YbkhKekovUk1yOGRB?=
 =?utf-8?B?cUQycVhwTWZPYTZQLzVRL0VJTFRDSTZ3UWU0eE5PdlVHVEdRMUtpQ0RBMEJq?=
 =?utf-8?B?R1ZRTlRSQjlETExnNDE3SEs1WStUR0tBTVF1YTZwc1hiczMxS0gwVEZhUkhI?=
 =?utf-8?B?TEd1aUgxOW9uSE5IY1hKSWR2MlJPdlU0MDRwVjFZeGttaFRGYlJOR1BkNndp?=
 =?utf-8?B?ViswK0ZIZFFvRzdlcmdMWmozU2pLaGp6RXlza25uV0JEM0Q2M1lxSUlMbzho?=
 =?utf-8?B?VTZmSklFUlBYWXJmQzI0b1lnSmxJaENLRTR1Q1I2bFI4SzUvdndTSWFQaUZY?=
 =?utf-8?Q?3FF2pnHjWct5bkN18OawKEqIYwhtAshmenMnJ6S?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 499c2828-da57-4e88-546c-08d8d27a9af4
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2021 12:58:50.2380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3gV2isxgaYrV+C/38ulKDJLxm5X5mr93CSGIyvZ0JAPDykSMHY+JxVlj3XUv6G9vA5U1gPs2w8yCeQV4fLqMe4Yo36ctCFWZgPfHfFSV4Js=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4418
Content-Type: multipart/alternative;
 boundary="------------592E688132DBC41BADD3C04B"
Content-Language: en-US

--------------592E688132DBC41BADD3C04B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-13 8:19 p.m., Oleksandr Kravchuk wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-protobuf_3.12.2.bb => python3-protobuf_3.14.0.bb} | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-protobuf_3.12.2.bb => python3-protobuf_3.14.0.bb} (87%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-protobuf_3.12.2.bb b/meta-python/recipes-devtools/python/python3-protobuf_3.14.0.bb
> similarity index 87%
> rename from meta-python/recipes-devtools/python/python3-protobuf_3.12.2.bb
> rename to meta-python/recipes-devtools/python/python3-protobuf_3.14.0.bb
> index 03d0b0c60..3cf850d1f 100644
> --- a/meta-python/recipes-devtools/python/python3-protobuf_3.12.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-protobuf_3.14.0.bb
> @@ -7,8 +7,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=19e8f490f9526b1de8
>
>   inherit pypi setuptools3
>
> -SRC_URI[md5sum] = "b4336acee38ebe915b6e72fe8c5bce7b"
> -SRC_URI[sha256sum] = "49ef8ab4c27812a89a76fa894fe7a08f42f2147078392c0dee51d4a444ef6df5"
> +SRC_URI[sha256sum] = "1d63eb389347293d8915fb47bee0951c7b5dab522a4a60118b9a18f33e21f8ce"
>
>   # http://errors.yoctoproject.org/Errors/Details/184715/
>   # Can't find required file: ../src/google/protobuf/descriptor.proto
> --
> 2.25.1
>
>
> 
>

--------------592E688132DBC41BADD3C04B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-13 8:19 p.m., Oleksandr
      Kravchuk wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210214011910.446840-1-open.source@oleksandr-kravchuk.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Signed-off-by: Oleksandr Kravchuk <a class="moz-txt-link-rfc2396E" href="mailto:open.source@oleksandr-kravchuk.com">&lt;open.source@oleksandr-kravchuk.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210214011910.446840-1-open.source@oleksandr-kravchuk.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-protobuf_3.12.2.bb =&gt; python3-protobuf_3.14.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_3.12.2.bb =&gt; python3-protobuf_3.14.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_3.12.2.bb b/meta-python/recipes-devtools/python/python3-protobuf_3.14.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-protobuf_3.12.2.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_3.14.0.bb
index 03d0b0c60..3cf850d1f 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_3.12.2.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_3.14.0.bb
@@ -7,8 +7,7 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=8;endline=8;md5=19e8f490f9526b1de8inheritpypisetuptools3-SRC_URI[md5sum]=">&quot;file://PKG-INFO;beginline=8;endline=8;md5=19e8f490f9526b1de8

 inherit pypi setuptools3

-SRC_URI[md5sum] = &quot;</a>b4336acee38ebe915b6e72fe8c5bce7b&quot;
-SRC_URI[sha256sum] = &quot;49ef8ab4c27812a89a76fa894fe7a08f42f2147078392c0dee51d4a444ef6df5&quot;
+SRC_URI[sha256sum] = &quot;1d63eb389347293d8915fb47bee0951c7b5dab522a4a60118b9a18f33e21f8ce&quot;

 # <a class="moz-txt-link-freetext" href="http://errors.yoctoproject.org/Errors/Details/184715/">http://errors.yoctoproject.org/Errors/Details/184715/</a>
 # Can't find required file: ../src/google/protobuf/descriptor.proto
--
2.25.1

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------592E688132DBC41BADD3C04B--

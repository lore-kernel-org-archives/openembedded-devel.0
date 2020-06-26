Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.84])
 by mx.groups.io with SMTP id smtpd.web10.10048.1593184933075468300
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jun 2020 08:22:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=nOqNYJO0;
 spf=pass (domain: windriver.com, ip: 40.107.93.84, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WNNiGJzvi3vPTvslw4lFx9OyDrygsUXV4B0NZLtUSkyIPa7whNKR/dnxpr3Yb+jEG5N9FY8YFF7AP3RJpA9ML6Y3Kv+KLhJbnu4J/l3+Hh/dT560DowIDQRO+vwjN/4O7pK+sXPEjKC0mB4uXaDgYBlzf3jao6XfQulfh9OFfKI5wj0kYT9/QlMX+2wYQAW6wYLoTq+p+JQJcBLmSiLCFNJKaapuoVPR1ePtJ3IxVAzzy0B0+UjR488v1LC3tE7bQEBpPgBpWdkDxYE7xou+zV6Fp/5gmhnYGxA2/PlmLVK3EXfLsVN0PiFZRjDgA5xgV/if240+Kygki52caKX7hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XxEg9ZXo/Fz6vw55d2Iv2UtyzXRITHJa85VJWCFt3xg=;
 b=R6tTlXYx7FD/6N2hJHtgRcVxPGjerJo1cWYpITxRZaPm4OnjjmMhtG0fMnHcO6uN/SkOZW1jDnGzHg7EOUCsR8pgUsj0eu8WCmXO91x3HANtKGi4nliNbJARTOdT1J9mLwybV0GbKt8NsHJT4yQNjhPYv27wDA0pU21KKdgs8RCJOLKEADdwK6ighRnSiZZQMxRrFPX6pZA+MGN0zUzIvuLH7GkAeGp8bPxIOP+g2ET2IMpmKktym+BHiJzGQO9qh1P25dNT7m2CA6xWccq9S8zP0N+uErmDAvpKE0+di3BbE7iLZI8JHyg2R98v0IhlkaXhONzqveAhPtsjyuVBnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XxEg9ZXo/Fz6vw55d2Iv2UtyzXRITHJa85VJWCFt3xg=;
 b=nOqNYJO0EBH/5Lej5nmVs35Wsbm5hvza1Gv8vHhU+u2GtSq8/3ET/FKFbKGnZpAnL/YyuPDcDOF/u0qxxTvUX2qWzWw4qapYPslU/d5StJi1V6Y9kZllof2eYOQcEjRU7CuTSEPbMQP6dH4KxKwuUrHyz2GDbWnIOD1QQO2ZV1w=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN8PR11MB3682.namprd11.prod.outlook.com (2603:10b6:408:88::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.25; Fri, 26 Jun
 2020 15:22:12 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3131.025; Fri, 26 Jun 2020
 15:22:11 +0000
Subject: Re: [oe] [meta-python][PATCH 07/10] python3-pyperf: Upgrade 1.7.1 -> 2.0.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200622103542.27830-1-leon.anavi@konsulko.com>
 <20200622103542.27830-7-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <ca6fcab6-afd8-fcd6-5830-bffe99bb0eed@windriver.com>
Date: Fri, 26 Jun 2020 11:22:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200622103542.27830-7-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0003.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::16) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTXPR0101CA0003.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20 via Frontend Transport; Fri, 26 Jun 2020 15:22:11 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a2612d6-1ee4-42bb-9193-08d819e4b2b3
X-MS-TrafficTypeDiagnostic: BN8PR11MB3682:
X-Microsoft-Antispam-PRVS: 
	<BN8PR11MB368224E313995468543239E09F930@BN8PR11MB3682.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:187;
X-Forefront-PRVS: 0446F0FCE1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jg2Hi4zOnHE4TPabeSADHiVzGp/6cmt+dRhdZ/OYRkT5OwTDSb51naI+PNnqeMfQ1pNAcvkfji3UutGX4C3doC/mO52NLQQ03AqQdetCcpBgZT5bg7fcmhScl0pCQZg3tsTQylMKzxR5QO2gtpd+F/ocSPZ2U/NRaMDkR9/cV06A13qE2otmzL58nbdFfNUrGaWiIYfLqvtKjVQoM+cGnZ+sPx5KBSZ6E8NQp1KbhZzUZzXzE8DGAMUWnA0w5J9vxXE0kvmW3/eUYMYgOgSfyho7D7so97Lz4EqzCnQqi82/0pkLte/+e2PTKxvz5N5Hl8ioU+aOZyU8oQmPLvEexyEu7Wu1YFmeAiFLoY3zw+0VXuFTd9VDuGg0N3dIzctEf7PRY+58XVPyuOfYpLlditvmhwcE08WtjQJvm3Jdp9Iwe/ew1ci1S9iUDw7RNvIAjmZvb5wU1edE03TPsiZ+ZQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(136003)(366004)(39850400004)(376002)(346002)(956004)(16576012)(2616005)(166002)(316002)(36756003)(31686004)(86362001)(5660300002)(66946007)(966005)(8676002)(66476007)(66556008)(44832011)(31696002)(53546011)(33964004)(2906002)(478600001)(16526019)(186003)(6486002)(52116002)(26005)(83380400001)(8936002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	qI+inj6eOmMOg365ONpa7Xt4ef0k1p/iakUZnGtcVw919biHJitJ/mhiLvRT+al43ue3CPGaXuv+JfO0t1bzD++mWXuHSq6dPo10vHkXarOULxucC3CvIHh8uIiSST348n7/Q/jm0vGTSVSN9lXSgFi1xG9nRsRAg3Mq+cOIPFzE7Tp2pbaTFAZnydVJBr6t9BKU8hq92sRY6zjggYAAATHzl3xpGUHbKgf6+EW7JG58fFAv9y9tzv/0aBq6/WqXob0ZhCf/378f47xxvpYsjgRioApcB4vCUeZ78iyC1yr2GYo8TMELtPKB2y4pLSIKHK0nITSoWPiO8v5r44Yhl91eOK8iqZ5shqHBQNdhZIrPcVsDvSH+bo1x7EEYX9g1pi2m0yErh5+EW1ycJm8M/52cDTG14kjo5lsB10j0l4IhECUCmGHkmSXE6ml7tpOBOm7tGa5pGu57hN1UFgH3bwRiKVvdUR+2yCjYXHi3SvD6WLHsqQE0cbphO1ZKc7U9
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a2612d6-1ee4-42bb-9193-08d819e4b2b3
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB0003.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2020 15:22:11.6464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jNm4G9F4gOrcGgWhShDcaqZ6sRFLgm9fiJLFgFMvuluWvgmbjNySlC7Bsj0TRq9zbJjFBdjvvvEvVYuy/PdLhwE0Az0/oxIoEYXnLu7PC6o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3682
Content-Type: multipart/alternative;
 boundary="------------9D4B8C4137364CAF3D9EBE02"
Content-Language: en-US

--------------9D4B8C4137364CAF3D9EBE02
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/22/20 6:35 AM, Leon Anavi wrote:
> Upgrade to release 2.0.0:
>
> - Drop Python 2 support
> - Fix test_runner on PyPy3
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-pyperf_1.7.1.bb => python3-pyperf_2.0.0.bb}      | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pyperf_1.7.1.bb => python3-pyperf_2.0.0.bb} (84%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pyperf_1.7.1.bb b/meta-python/recipes-devtools/python/python3-pyperf_2.0.0.bb
> similarity index 84%
> rename from meta-python/recipes-devtools/python/python3-pyperf_1.7.1.bb
> rename to meta-python/recipes-devtools/python/python3-pyperf_2.0.0.bb
> index 081e904e1..7ced7d017 100644
> --- a/meta-python/recipes-devtools/python/python3-pyperf_1.7.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyperf_2.0.0.bb
> @@ -13,8 +13,8 @@ Features: \
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=78bc2e6e87c8c61272937b879e6dc2f8"
>   
> -SRC_URI[md5sum] = "d9e894dc843bb7f0abff109931a29895"
> -SRC_URI[sha256sum] = "c37690e810116a83a244dfeec47885e2f0475b4c450313904be3bc2cdaf6d50a"
> +SRC_URI[md5sum] = "7f62d3f6fc5475138791d3d883fdf4cd"
> +SRC_URI[sha256sum] = "2189fbc4af08d519f85468e70e32c902eab0f1341b2c41028b94b2832d3169a7"
>   
>   DEPENDS += "${PYTHON_PN}-six-native"
>   
>
> 

--------------9D4B8C4137364CAF3D9EBE02
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/22/20 6:35 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200622103542.27830-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 2.0.0:

- Drop Python 2 support
- Fix test_runner on PyPy3

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200622103542.27830-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-pyperf_1.7.1.bb =&gt; python3-pyperf_2.0.0.bb}      | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyperf_1.7.1.bb =&gt; python3-pyperf_2.0.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pyperf_1.7.1.bb b/meta-python/recipes-devtools/python/python3-pyperf_2.0.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pyperf_1.7.1.bb
rename to meta-python/recipes-devtools/python/python3-pyperf_2.0.0.bb
index 081e904e1..7ced7d017 100644
--- a/meta-python/recipes-devtools/python/python3-pyperf_1.7.1.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-pyperf_2.0.0.bb
@@ -13,8 &#43;13,8 @@ Features: \
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=78bc2e6e87c8c61272937b879e6dc2f8">&quot;file://COPYING;md5=78bc2e6e87c8c61272937b879e6dc2f8&quot;</a>
 
-SRC_URI[md5sum] = &quot;d9e894dc843bb7f0abff109931a29895&quot;
-SRC_URI[sha256sum] = &quot;c37690e810116a83a244dfeec47885e2f0475b4c450313904be3bc2cdaf6d50a&quot;
&#43;SRC_URI[md5sum] = &quot;7f62d3f6fc5475138791d3d883fdf4cd&quot;
&#43;SRC_URI[sha256sum] = &quot;2189fbc4af08d519f85468e70e32c902eab0f1341b2c41028b94b2832d3169a7&quot;
 
 DEPENDS &#43;= &quot;${PYTHON_PN}-six-native&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------9D4B8C4137364CAF3D9EBE02--

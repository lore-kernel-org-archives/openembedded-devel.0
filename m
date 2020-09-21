Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.63])
 by mx.groups.io with SMTP id smtpd.web11.44669.1600701741312684483
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Sep 2020 08:22:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=XMEw0Ycu;
 spf=pass (domain: windriver.com, ip: 40.107.94.63, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XVZhRzma40ymZ8tDfyM6IieEfet+VVWlzqgBEFdDp1H2lws2Z4VlA+XUzLwu640Q6X6DWpGphJlf/oWnOAEPRcCAisg2LNb/msyf5S79WYvr6mwBNwPPlpsRX49yhIv+hGGQrfDh0P2XP2p+FTs168kgq3ZdWYYl5d3UjHLKl/gdmrTt+LoWNmKZTZ0f7JtNNeYTdo6WB2B0E5MP0X2B0QJRnqQwoqFLX44Tj68DgfhB5kizL2kPkfj9yES4wuBtnRp8yoesuhw4ynCkqYGOknZV+xQbeSWbhM54+Y2EjS6d4NUr+lyLGP63+7i1m9fhRu2cDGMkgF9ax0P9nD5Nxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dorVvOdNu3NxxkY/Td7PAt2P2RfUVwEkuxyjPr9YRa0=;
 b=gW9T4mYsG7FioOJmM4D8/Wd0ISdP0YsBYO2l98KmOhGEcTxePSCDy1GjuikbjfXsKgGyM7yjuhngOznZ8DS496QVVx1q8JaWuC/V+Fyra95g7KNvYuuj2GtQZt/YG3Y2JZ6XDMZeO4DmZWGSzW91g3YpFfHyZEa9myI2xRT1uDIJ5jZgYwDk1PMqNbbLCXknNYsfDrc5cr0mrS2NgcfqDa5J01x2liJMULda51V5uk1GZb3PwjK7MrToK46Mq/FwqfAC64MPSPwANWZcEvE+k4F18yE5aoZeWRocGqKRU9p5tCIQYl5m3EpUyc7WC2AGDHgyebgKxeoVjHpYZ0TPcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dorVvOdNu3NxxkY/Td7PAt2P2RfUVwEkuxyjPr9YRa0=;
 b=XMEw0YcuEUNtXVQT22SXpu1p2wMSTpb+0JsX27nqlvIzN3ffQEo72PGhEKYC+5b72PYAjbeXBW7CV9eJ9D50Bf1vBFJ1cVC/5TOMuOUh2N9laBfmF707bktfmubqQnug6o1vyv34EL+gAcDov0ZQRH8njC7195TwEAd7eoz7yjY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2680.namprd11.prod.outlook.com (2603:10b6:a02:c9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Mon, 21 Sep
 2020 15:22:15 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3391.026; Mon, 21 Sep 2020
 15:22:15 +0000
Subject: Re: [oe] [meta-python][PATCH 2/2] python3-sentry-sdk: Upgrade 0.17.5 -> 0.17.6
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200916092133.11861-1-leon.anavi@konsulko.com>
 <20200916092133.11861-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <b7139d10-27c7-f071-4e78-bdf703bfd6a6@windriver.com>
Date: Mon, 21 Sep 2020 11:22:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200916092133.11861-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0121.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::30) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0121.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14 via Frontend Transport; Mon, 21 Sep 2020 15:22:14 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f268be5-69fa-4031-a061-08d85e421e88
X-MS-TrafficTypeDiagnostic: BYAPR11MB2680:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB268065DCFA23BBA85C580D499F3A0@BYAPR11MB2680.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:262;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	b2MDLVzTpgxAI7+hparowpDLV6ifSwmtERuwq0j1httYlhZPKfYu1ClST/o/Gyzzzu0it4EaxvS554Au/XWpcxDSg2CBkPV19z+j4UoaAnfsfRz9GLoRYPpEd1a+MP+erbx8+gDZq0HSDkAHyaVdLDyWLi9BsFATkmWTyANCeEb5udaBwXVBQNO7kd4OfUYZxr5wSqvAiFuT053b/QvQBKcWoVxU+dE0ieztL5JW5AlLPAU1S+xJjifG550j7OXBGk0QL++wij86qkOr6tfee/qaWpYlOENuy5KYTYHXNZu1MPlqCOJXNFs0Pj2rkVBKuw8AYklck9JVn3z5syv52IdDnXZCNVBiznWG+UlBFxpy7OgebMQrTR/FpKZBjPgqtIAyRkIux1ERHS6XRuM7K6CwvUhICN/fMwAwMvp6cMDJc2rkgbTCqoho6/KL6wrOFpJOMMPuWAcDNB1ryMghFA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39850400004)(396003)(346002)(376002)(366004)(2906002)(31686004)(53546011)(36756003)(31696002)(8936002)(2616005)(83380400001)(33964004)(956004)(52116002)(16576012)(316002)(16526019)(26005)(478600001)(166002)(186003)(44832011)(86362001)(6486002)(8676002)(66476007)(66946007)(5660300002)(66556008)(966005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	2I8jnDP0O7MlUnN/TgPW7k78jWZCJSUvR2yTnHGZGb/SYIFSfsD6+ttDDG9VeGfeHQ1PndXUt/C51CTy4rC2DJtF2sEGYsmNrk1FEIn1Qub0V35qkxXP2o0CVz3OoO0NOnrQzSV6mZBzfWygWTyLMH4g9RpE67hWMj9id35Bfvsjye/hVGFghabujmnbjpM2PLZZ0zebOt20h5BefQiUehkEd9AJzLLfHw4UyguzFnnJ7ua2vCYU7FaBOdBLpTkQ1qSHS+uf0deMCiPgoY6lBN7sgLSANFOqTcCA7iGFKojZ7jnTjgFWopc7fhgUuVykWgrqY3C2EZcMvYKiMm8Jopz0LkhvyirEd1yh+qK2RuFeu5yXm6Crx66dPdmATbNHb4PUUdsP/iMz6cz085ryRr/00Z9sfbXmklFCOwqHCfOfNCzwQqzVju9Gg+Vc1Mj3amzv+jd43TWiXvJWHU6MpgLLRxaidGUJ1k34PXKUZ4wlvfIMqSD4Rs6FnBiNK7QCKUbtxusOXUM0GWGuiTG2hbZCsmmU8d4MQFcVfXVLj/IKhZJ1j5OLIQTkS7fXOPX2bi/mO5DgGy7gid1Gq5uYFXbhSezsOtX6i3vxLZWA9REh4MyB4KSAjDTWw0477zqdKHwyBGgB1lBudDx6YbE4lQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f268be5-69fa-4031-a061-08d85e421e88
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2020 15:22:14.9286
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UcERuy8ObBv3u0xOmwp422U9MR9qe4IMKwUhMIVkMHUiYzYB+AmRuxASnhQPHmLAUQNMaFZP5pUyI86WOq1x+hWHWd+ezTWiSBo+FUqEmKI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2680
Content-Type: multipart/alternative;
 boundary="------------17C78B3AFA5193A2B647726B"
Content-Language: en-US

--------------17C78B3AFA5193A2B647726B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/16/20 5:21 AM, Leon Anavi wrote:
> Upgrade to release 0.17.6:
>
> - Support for Flask 0.10 (only relaxing verson check)
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...hon3-sentry-sdk_0.17.5.bb => python3-sentry-sdk_0.17.6.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-sentry-sdk_0.17.5.bb => python3-sentry-sdk_0.17.6.bb} (72%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.5.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.6.bb
> similarity index 72%
> rename from meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.5.bb
> rename to meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.6.bb
> index 5495fa0d3a..5f566a8264 100644
> --- a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.5.bb
> +++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.6.bb
> @@ -5,8 +5,8 @@ HOMEPAGE = "https://github.com/getsentry/sentry-python"
>   LICENSE = "BSD-2-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341"
>   
> -SRC_URI[md5sum] = "dcdf0d4f84f4f6ea02ad3f15dfcff2d9"
> -SRC_URI[sha256sum] = "02f2a72698453f722b102562eb6430d2a82d6c6c40f2b991ed69e7628142de6a"
> +SRC_URI[md5sum] = "f48cccd128b10a9a4d19db89d1a74a58"
> +SRC_URI[sha256sum] = "1a086486ff9da15791f294f6e9915eb3747d161ef64dee2d038a4d0b4a369b24"
>   
>   PYPI_PACKAGE = "sentry-sdk"
>   inherit pypi setuptools3
>
> 

--------------17C78B3AFA5193A2B647726B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/16/20 5:21 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200916092133.11861-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.17.6:

- Support for Flask 0.10 (only relaxing verson check)

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200916092133.11861-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...hon3-sentry-sdk_0.17.5.bb =&gt; python3-sentry-sdk_0.17.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_0.17.5.bb =&gt; python3-sentry-sdk_0.17.6.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.5.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.6.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.5.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.6.bb
index 5495fa0d3a..5f566a8264 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.5.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.6.bb
@@ -5,8 +5,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/getsentry/sentry-python">&quot;https://github.com/getsentry/sentry-python&quot;</a>
 LICENSE = &quot;BSD-2-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341">&quot;file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341&quot;</a>
 
-SRC_URI[md5sum] = &quot;dcdf0d4f84f4f6ea02ad3f15dfcff2d9&quot;
-SRC_URI[sha256sum] = &quot;02f2a72698453f722b102562eb6430d2a82d6c6c40f2b991ed69e7628142de6a&quot;
+SRC_URI[md5sum] = &quot;f48cccd128b10a9a4d19db89d1a74a58&quot;
+SRC_URI[sha256sum] = &quot;1a086486ff9da15791f294f6e9915eb3747d161ef64dee2d038a4d0b4a369b24&quot;
 
 PYPI_PACKAGE = &quot;sentry-sdk&quot;
 inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------17C78B3AFA5193A2B647726B--

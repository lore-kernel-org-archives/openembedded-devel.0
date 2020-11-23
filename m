Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.71])
 by mx.groups.io with SMTP id smtpd.web10.41920.1606165048093974542
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2020 12:57:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=aVNESY+W;
 spf=pass (domain: windriver.com, ip: 40.107.244.71, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mTvRFKSiGnUtoeBnsATTz6aiHhUeXC+ZBDbhJmWtHUTRUou6H5DK5wbpwr54nUZAymDyrGcE6dAp0bYVPd8Rl7KRKkmsgL8BRS5+P6AtIxqxZ9iuK+zhXZwN5t3maENZj0Pbn0D71deobZvutj6hT/IeDh6tLPk4omVdC1wIlp9sPseAgLOBAznYuXCEHasudO0xQ4Q/TOCKLp1Oy1g+pi7myACD1feJT/UlMfT9ZM9qpPgtWqLGMK+R/vQSjFbcqPsITHTTpUC/b4Fn2qupMwB/5QjHe5LT4nqTdFOhFog7kHXn72MUx6faW4dhe+I2YPomXM420KMtQ2AIvIPntQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z1SSLUIRMc+Pk1dslEOrZ7Ng9vE+62eyRoc8gL2nnLs=;
 b=P/JYKXL4Xb4Cnr5hHMPO+r1XW5QBBxvIXJi5o7IrJiGenimRIdkyKlsFCqwPCoqM93I97b0puQAu4QFHKobMZDi15NgxGEm/7hYK65y6v/X7UIDtrCRVJWF76XZ4m2m31kJWy8V8Uzvmn8yx0Kpdt3ClHDt/vdRBNG7csXy2PQgXkkc7wcV5sEd4xpkMX9bjuEVvTp0AwJPyAPVDOyGgbhGNzzouNuaJ7RHnd5fr9idoM3yqH8vuspuory0NgaK/BM5+Tp4dWU/VskF/RbMOQfZNFck1TzwpuczM02kXiC/U/eQVgaOIHQY3SfjF2lxh7oSiYsE1ldv9/G77YiAayg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z1SSLUIRMc+Pk1dslEOrZ7Ng9vE+62eyRoc8gL2nnLs=;
 b=aVNESY+WiU4use+jLjOVgAqjluITlbjID6UNaoL1jezKDx0uC91RL1yWRx6Oz7WZ7OccfEVTR7dwFmpxyg9afU+la2536QYr7jX3RpQegmPWK765mAXxBdOhNMeYzVYj5B2hAleG3emRM5doONVE7yBmHz34iOY9TzmdL7Po7FM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2600.namprd11.prod.outlook.com (2603:10b6:a02:c8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Mon, 23 Nov
 2020 20:57:27 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498%4]) with mapi id 15.20.3589.030; Mon, 23 Nov 2020
 20:57:27 +0000
Subject: Re: [oe] [meta-python][PATCH 5/5] python3-certifi: Upgrade 2020.6.20 -> 2020.11.8
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201118140220.29364-1-leon.anavi@konsulko.com>
 <20201118140220.29364-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <91c6f111-e4d8-cafa-efba-edd0db14602d@windriver.com>
Date: Mon, 23 Nov 2020 15:57:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <20201118140220.29364-5-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YT1PR01CA0005.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::18)
 To BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0005.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend Transport; Mon, 23 Nov 2020 20:57:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 53566904-0a96-4946-eeb6-08d88ff26258
X-MS-TrafficTypeDiagnostic: BYAPR11MB2600:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB260016FC2239CEBB7E6960BF9FFC0@BYAPR11MB2600.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1002;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0BGQO+sln2dbUmzZB+/0MZDWNjdMU2JTOv/S0KK3FTWX6IunJ3HJqig6Dk5KXIUnsVvi4KupZIKXbWw4yf2U45ncaY0zELR3hve9GQpZxj5SQGAtF3b2Th+/0sms1GTs5wsqtds+SalxUIrKuCb1fbnhEfw0hM9yuHETDlsYstaypLMcaTN/6HyZ7hHXiODXmsz8w/+SfwZOS6TqbQXeTh97idDXZgjcLUwVeG+Qd+y3mapUK9UQKdVfdXNd2k/OP1ys+/Iigw/dgzjKVKAKupIQ6qMv5mpC7g15loSWoK1R3aHyID7YPKwY2Emkduia+tU4GDK0r5k7WwcSkpq+1qOL55xON9b6P/ViW5u0jatuMcJnqfYUeuZz9w6tC8iuVf7jm/lzOrWs4Y1Si7xk3NrMLecG2jUWTO2wF+hYyao5Rbom6/kAnPM+R9YGudzzNesPWmRmCWNt5AuAcncCXQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(136003)(346002)(396003)(39850400004)(2616005)(53546011)(956004)(16576012)(83380400001)(33964004)(52116002)(8676002)(44832011)(8936002)(16526019)(66476007)(66556008)(66946007)(166002)(316002)(186003)(26005)(478600001)(966005)(36756003)(86362001)(31696002)(6666004)(4001150100001)(5660300002)(6486002)(2906002)(31686004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	WvOEdtpU4uk2Vz+rneFwXh9tGUhTbGAp5NMa8MqHL80YjVsl6fztZk8Cz0p0EzNBqsRGY5hkErJFQZPyRTtC/JZykUDdQo6QOaT1qNiclBmeDpzqqGTbgeV8EordoE0F2g/G0lnSynsy5dLmW0hiL+tI9iBqVZ5lDpWYwAMTWEAP8K7KUFBtFUzlcYYWwVsSxsvjF2gdBG307gOjgG+g1uSkDdAfcnjj50zB34cD72pUu23Z0KZHn2b+0d7tRXc9lYuFrXj5q6D7+HFrQc9Kn/QFGpf6gMYCBGr/Z68pX9TTXeTH4GT6PT0uoiVSFmEx/fi93ZH7L+wOcan1z5NUUt8126lbR+Y0IMe0wqUMtnD26QVdYoAWpgyB37MaVGnLiAbIEQiIAOhFe/Bld0w62HfupXEuObzD4TJCjElh1BE0ugNRV5eODIQEIYe1621G28VE05qwk8JbmyT3k9h/MKTWi0MdfdhEmZDf9DwpkrQ3vQBZ3vHXl3HWcE9ah7qpNgvxsSlZuNFL5zjAGyOhZgGX5FbzY6OKB4VjwKpteleDDlR1N2ASlMMQnlcUfZZgS8HT34a/reZpVU4YEiDd7wTClCZbyKohX/dSB+vEm5q6dwffmz9EDq1WJprG6nlFuO3v43410U+huchf+pj1ZOTCzo0Q0cRRH+laJTe9q8l3Y7TXf0Ha9dgHAnsVuVMkC+udTKa4y0muT9jPjd2khLuMdqtjQov8cE24jPu5dkfxsmiOwKPpnncdkdcnr0MxYXsm34WrehGq73YnHoLMpDgxahyKmO2Gv3xmw4EbuxFGdpf0JQ0THQ84HB1YMouEKS/rd1hsinwU6ABHHFCWon7XgsxAFXU8f4MWsrFcKYoTq0p5zlhEAcG59qSimolVhXSU2cT7N8EKW2UVWl5xvQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53566904-0a96-4946-eeb6-08d88ff26258
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 20:57:27.0366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +LuWYjQCotVyCMv/dYUdHgApgamDS0XAUVK3VOzdoZZGZ2WHwFOunkIL/Y8gCArB8CZ6gtqgZHTxX1SNkml5deEMlkkBKPokWbmf0JFtDME=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2600
Content-Type: multipart/alternative;
 boundary="------------24CCEBA9E14720FA8AE1DB88"
Content-Language: en-US

--------------24CCEBA9E14720FA8AE1DB88
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2020-11-18 9:02 a.m., Leon Anavi wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 2020.11.8:
>
> - Declare support for Python 3.9
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...hon3-certifi_2020.6.20.bb => python3-certifi_2020.11.8.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-certifi_2020.6.20.bb => python3-certifi_2020.11.8.bb} (79%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-certifi_2020.6.20.bb b/meta-python/recipes-devtools/python/python3-certifi_2020.11.8.bb
> similarity index 79%
> rename from meta-python/recipes-devtools/python/python3-certifi_2020.6.20.bb
> rename to meta-python/recipes-devtools/python/python3-certifi_2020.11.8.bb
> index 8174201416..b680fade6c 100644
> --- a/meta-python/recipes-devtools/python/python3-certifi_2020.6.20.bb
> +++ b/meta-python/recipes-devtools/python/python3-certifi_2020.11.8.bb
> @@ -7,8 +7,8 @@ HOMEPAGE = " http://certifi.io/"
>   LICENSE = "ISC"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=f77f61d14ee6feac4228d3ebd26cc1f1"
>
> -SRC_URI[md5sum] = "89525ece725d674d91b0c43007d2a47e"
> -SRC_URI[sha256sum] = "5930595817496dd21bb8dc35dad090f1c2cd0adfaf21204bf6732ca5d8ee34d3"
> +SRC_URI[md5sum] = "b25267355218d11652c707e46accd059"
> +SRC_URI[sha256sum] = "f05def092c44fbf25834a51509ef6e631dc19765ab8a57b4e7ab85531f0a9cf4"
>
>   inherit pypi setuptools3
>
> --
> 2.17.1
>
>
> 
>

--------------24CCEBA9E14720FA8AE1DB88
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-11-18 9:02 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201118140220.29364-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

Upgrade to release 2020.11.8:

- Declare support for Python 3.9

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201118140220.29364-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...hon3-certifi_2020.6.20.bb =&gt; python3-certifi_2020.11.8.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-certifi_2020.6.20.bb =&gt; python3-certifi_2020.11.8.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-certifi_2020.6.20.bb b/meta-python/recipes-devtools/python/python3-certifi_2020.11.8.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-certifi_2020.6.20.bb
rename to meta-python/recipes-devtools/python/python3-certifi_2020.11.8.bb
index 8174201416..b680fade6c 100644
--- a/meta-python/recipes-devtools/python/python3-certifi_2020.6.20.bb
+++ b/meta-python/recipes-devtools/python/python3-certifi_2020.11.8.bb
@@ -7,8 +7,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://certifi.io/">&quot; http://certifi.io/&quot;</a>
 LICENSE = &quot;ISC&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=f77f61d14ee6feac4228d3ebd26cc1f1">&quot;file://LICENSE;md5=f77f61d14ee6feac4228d3ebd26cc1f1&quot;</a>

-SRC_URI[md5sum] = &quot;89525ece725d674d91b0c43007d2a47e&quot;
-SRC_URI[sha256sum] = &quot;5930595817496dd21bb8dc35dad090f1c2cd0adfaf21204bf6732ca5d8ee34d3&quot;
+SRC_URI[md5sum] = &quot;b25267355218d11652c707e46accd059&quot;
+SRC_URI[sha256sum] = &quot;f05def092c44fbf25834a51509ef6e631dc19765ab8a57b4e7ab85531f0a9cf4&quot;

 inherit pypi setuptools3

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

--------------24CCEBA9E14720FA8AE1DB88--

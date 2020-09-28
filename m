Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.57])
 by mx.groups.io with SMTP id smtpd.web10.35868.1601297939023694686
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2020 05:58:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=SSGRwhvi;
 spf=pass (domain: windriver.com, ip: 40.107.223.57, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FSGryFDkSH4Uffy0GUV+pJOs1HWGIHVCQiSLDBOVS+gqlTTU7AkmWvY3a7hoKjJhSmDDpJVbSyb8OsD4z2BAnp8DJpVlxUtk9Tyd4LpZqU6hvXUA2cElMllVhQpI9Ten7FBA+X2B7yItPc43tujsS5z4F6kQS0X5HFD69sSnYDLpmFGYH2fliq1FSYvhh3eovnARxYfKPpeq3gmKlvCA5FFYUHxZkT1JhZdS+WPyfklzJv+GLcVkXzkozT8+UTxPxIYjLaQNo2YvZ4bab0doWVshi6ZCnflYNPtgNvWsAXdTFUbWWgEAzgnZDLm/V1WdD5v8ZtVwbyxppTnA1jCw5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gcjR9NRf67yfSlfXKelPyEXbgWkfgKSSYj8WLyvr7VM=;
 b=e+Id3D0yvvdzgKdVRz4/+71bmHUc7I2b9z+IdWRNQSGDDjfwAOE2Vd70yZvehArn32xejGDzi3mfJzPW6U2br1BMI3CJIf1iSLr3Mkm/Lq3e6tJQMi1hL0OTC5td58JkX+6vwaUnUDlor3tKrOaBbJ1VVsxtN1poLxCtjwEHd+7zmJzyDMoXXgB5uO8IbOH202u+bNoufmdmg7MZ//tm+pWEg0EXBaqH34GGXsIH/+1VteGrRm/u1qsaV3C/Q6xXc4QsjfP+Y9m/gD3IWZjE+XbszyOpQZU0Us7uD8leO4Ct5zB9aXKZDSiEdrRy6HOHDAVvIkQ3q6h2cCt8j9sb3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gcjR9NRf67yfSlfXKelPyEXbgWkfgKSSYj8WLyvr7VM=;
 b=SSGRwhvihoKvXSymoMcmgipEq1QoFT/xh6NwaQtQ7bFGIp69CJKtw0FP5iwA4FEEC0RpT8N26y/pRmX5Tf8YVDXAP2cz3AiEjqKht03/CcsY31Kszkv/zfPqBEEOrbaVhZS0sUugGMdVSOYi57KzJB+uaba9+fl4oanIeV2bTSo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3256.namprd11.prod.outlook.com (2603:10b6:a03:76::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Mon, 28 Sep
 2020 12:58:57 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3412.028; Mon, 28 Sep 2020
 12:58:57 +0000
Subject: Re: [oe] [meta-python][PATCH 2/4] python3-yarl: Upgrade 1.5.1 -> 1.6.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200924132122.30697-1-leon.anavi@konsulko.com>
 <20200924132122.30697-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <70596a48-445a-a6aa-3d7a-75a568c1b90f@windriver.com>
Date: Mon, 28 Sep 2020 08:58:52 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200924132122.30697-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YTXPR0101CA0024.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::37) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTXPR0101CA0024.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::37) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Mon, 28 Sep 2020 12:58:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20afbb5f-f2ba-4e7e-6a7f-08d863ae42cb
X-MS-TrafficTypeDiagnostic: BYAPR11MB3256:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3256486E8FDB18BA30EC85EF9F350@BYAPR11MB3256.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:551;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wncT0x2BDfkg0CZY0QaA7jcCzXdaSYzztog02JFXtC/DhcggidKEYpJUKF9oWI2Gd2ojvkErJjUBsaJu1d7hTlzhIbBqlC4+kj1cOCEomr21ZfnFdmwA2FDv6fgCgzPR/mJ1QbTKbSiJPFlEjvgSU4OMZO9vpOY5dlrrMLLFUkCBg1ZT89J9pjvivWnHC7hav3VGIBsl+NX6VU15mq4nk2SQFuUZQbJbNli28eNZVjITL1gKHDgGJGMrtBnY5gAGn9JZ7NxGguC2jlTZC2Llf5LQTOuDBNeoGW0LWikN6uAAKjRTehzHAfexvOImkOjBwWA0ubk5MZcQEYXGiRY5bM8oGGmk74m1lESiQ7TZ+DB5Tdxn5tA2+eBZm1v4hlU2J6Yg27WdswJrHFrdWVwm3hP1T9z+zDDuSHgzggGwBjfnu1u/Hx1Cxv5EbQzk8Dw5xXgbWwcVS6qbaD+dc80Wghf3ci6SzxZFaASMtEQiclE4vPo5u/DrqcU7YAgCCdP6HZe9v/Tkjkp+KagYo/prug==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(39850400004)(136003)(396003)(478600001)(66946007)(186003)(53546011)(26005)(16526019)(31696002)(8936002)(966005)(52116002)(33964004)(8676002)(36756003)(16576012)(316002)(2616005)(166002)(5660300002)(83380400001)(956004)(6486002)(2906002)(44832011)(31686004)(6666004)(66476007)(66556008)(86362001)(21314003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	5eMJrL7LhfaSbyPbcPgkOMtpDzdoM93+wOD9+cG7jOvbCr8DUr4c6UIZQNXRfWCq1knmaQzCFxtATOfC9zO+Ad3nEM9UlOChw4Vjv4FdPyvQjq9BMEEvwMFQNKvVACug6LWmAjvswDUYx2j18kBcqxOIuC+0I9/as37eTyC2UmdUe+BiY8h7iJTwzm8wPP/PSN5viHekU+omcHX1l7GWjpWIuutrDIzc2ViBbSVwPNC6yWWDp/9tRRQBOAtUWlT4FB4qkby8+6wxmNcThM4SfqZVtyXq+kfRpLdpyOx50DKWQ/0nsab7bZW1NjPogGT+HtS1dbAFX6p8K6+MnNdywd1HgQfH7tmylqyHaxFa3h0KHEFspSF182eGqsx22kCFEFAK7boCGyG9eIbpnLoKw+LDxu2qQOdBBUFNvK12pMUE90rnnTCcdUVWhQc+k02D5dB1KnZUdSGsHnvMsuoPnyeKrSjppHK+OOEAPbwahFwNDdMidxC3egZGXL0iOwAVvOjJQrwibm3vXw+sdqtiSbu4xNctPBeKil8XjxiJnb6Gwj3xQ/7IDIeZZF4HYAC23zZ9VDD5A+HOZ3+0Nwf7C8/Q0UwjH2Wp1cria6E7ej42CvWj4tdZ+pchktX5fY9JpZEYymc5XWLFwRMx5n2d6Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20afbb5f-f2ba-4e7e-6a7f-08d863ae42cb
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2020 12:58:57.1030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MU+uqkdcWjoF3tZWBM4CDeSRKbAQ6GiJqbLGhKaU05SpnsGlTkqvklZw2DVv0ktZrOvVU+BUt7hFUOB9peP6fs04dsrjFu4PEl/tYwpkwp4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3256
Content-Type: multipart/alternative;
 boundary="------------E555C114FDE27B66BD833197"
Content-Language: en-US

--------------E555C114FDE27B66BD833197
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/24/20 9:21 AM, Leon Anavi wrote:
> Upgrade to release 1.6.0:
>
> - Allow for int and float subclasses in query, while still denying
>    bool.
> - Do not requote arguments in URL.build(), with_xxx() and in /
>    operator.
> - Keep IPv6 brackets in origin().
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-yarl_1.5.1.bb => python3-yarl_1.6.0.bb}   | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-yarl_1.5.1.bb => python3-yarl_1.6.0.bb} (79%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-yarl_1.5.1.bb b/meta-python/recipes-devtools/python/python3-yarl_1.6.0.bb
> similarity index 79%
> rename from meta-python/recipes-devtools/python/python3-yarl_1.5.1.bb
> rename to meta-python/recipes-devtools/python/python3-yarl_1.6.0.bb
> index 40f0e4db03..543acc51ba 100644
> --- a/meta-python/recipes-devtools/python/python3-yarl_1.5.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-yarl_1.6.0.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/aio-libs/yarl/"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=b334fc90d45983db318f54fd5bf6c90b"
>   
> -SRC_URI[md5sum] = "a9b20bf0b8a6962e1101b28908a67bf8"
> -SRC_URI[sha256sum] = "c22c75b5f394f3d47105045ea551e08a3e804dc7e01b37800ca35b58f856c3d6"
> +SRC_URI[md5sum] = "802bb27ebdb260fbbaecbcc8168d6f28"
> +SRC_URI[sha256sum] = "61d3ea3c175fe45f1498af868879c6ffeb989d4143ac542163c45538ba5ec21b"
>   
>   SRC_URI += " \
>       file://run-ptest \
>
> 
>

--------------E555C114FDE27B66BD833197
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/24/20 9:21 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200924132122.30697-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.6.0:

- Allow for int and float subclasses in query, while still denying
  bool.
- Do not requote arguments in URL.build(), with_xxx() and in /
  operator.
- Keep IPv6 brackets in origin().

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200924132122.30697-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-yarl_1.5.1.bb =&gt; python3-yarl_1.6.0.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-yarl_1.5.1.bb =&gt; python3-yarl_1.6.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-yarl_1.5.1.bb b/meta-python/recipes-devtools/python/python3-yarl_1.6.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-yarl_1.5.1.bb
rename to meta-python/recipes-devtools/python/python3-yarl_1.6.0.bb
index 40f0e4db03..543acc51ba 100644
--- a/meta-python/recipes-devtools/python/python3-yarl_1.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-yarl_1.6.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/aio-libs/yarl/">&quot;https://github.com/aio-libs/yarl/&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=b334fc90d45983db318f54fd5bf6c90b">&quot;file://LICENSE;md5=b334fc90d45983db318f54fd5bf6c90b&quot;</a>
 
-SRC_URI[md5sum] = &quot;a9b20bf0b8a6962e1101b28908a67bf8&quot;
-SRC_URI[sha256sum] = &quot;c22c75b5f394f3d47105045ea551e08a3e804dc7e01b37800ca35b58f856c3d6&quot;
+SRC_URI[md5sum] = &quot;802bb27ebdb260fbbaecbcc8168d6f28&quot;
+SRC_URI[sha256sum] = &quot;61d3ea3c175fe45f1498af868879c6ffeb989d4143ac542163c45538ba5ec21b&quot;
 
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

--------------E555C114FDE27B66BD833197--

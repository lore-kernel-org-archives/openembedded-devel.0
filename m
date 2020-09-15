Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.58])
 by mx.groups.io with SMTP id smtpd.web12.14858.1600180080349327497
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2020 07:28:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=HPfBa9AS;
 spf=pass (domain: windriver.com, ip: 40.107.75.58, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g29uVI99z0Q4dCHiRoU936+djFwOcKskJXFC5tHvh/WO0OmJf3olS8NNeLBeQ5VHynkrKVyKSStNeXPb8GyU3nfwHQRW2Lwjzwxu/jjaEIbQ3Rz9feCCFxhYQcjlALXBNmA7smLsP8SejVNnnsl65ls9hda5focbyqySzftKvOaPJgi9c6YlLe8TacNxsEDv3H0M0OP3HActuUMmLqfEVLGoIBIEH+eAvkjeYKaGwfkdmEa3pndaivDDZYfT+CBY/7LxLaiyyh63oWCXSFRbnYl0uy8GbX3ZaeUmXrAYdoTlHQCW/FIToy8DYosQqjxEtm65jkkuIm/mgU82f3bSrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v88DzP5bbFAokbp4jUhaILkRs2KSfPkMbolWy3BOho8=;
 b=Em3JVs/HXKW6rLceMrOMshOu5L1TwsISlS7vw9JWy1rxm2KU7FlVr0ljoEvEfrMlOy31hRdh+DwNcZQMj5BEarELHm8QZ3A53fYrN9JZ6CUZ3lgTmmyX7zImkfFHxhsGwyUk9g1QKS6MXXUGTRsFc7POPb5ZDJKWo/2LOgKZLRUgudkHqOuc4hKwN/Xr45cuEUQ/aKD1gDVy/qb6QkCtXQvjhDmsASxLP75nBuiDjikbuS+/892g1FVapepffXedRTsoh07mCwHk+/1k+RJiA1Yu+zY3DFToN+Sc0lN0xSWdm1awjHTqRe3Rc9YgnDZ0zipTpNpXWpNpBmWNZciwwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v88DzP5bbFAokbp4jUhaILkRs2KSfPkMbolWy3BOho8=;
 b=HPfBa9ASjGyE0iDuxnDCm1n6X3/OZHEPOdkHhkFCMeNVA+Gkf/Nyq6hQ3GteGes/dTm3jspX5BNUr6DQ82dKdaJ6dSfMCpaPSDIGIw7RWpxy81QnE1YjgT1FDmSS5D8LFO7cZuK+UrIjyFuneay8nVOqA7z77ISeIJCHdlCda1s=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3447.namprd11.prod.outlook.com (2603:10b6:a03:1d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Tue, 15 Sep
 2020 14:27:58 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3370.019; Tue, 15 Sep 2020
 14:27:58 +0000
Subject: Re: [oe] [meta-python][PATCH 01/10] python3-diskcache: Upgrade 5.0.2 -> 5.0.3
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200914131536.6072-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <a61984f3-5400-ad1a-f61f-9658bb0b873a@windriver.com>
Date: Tue, 15 Sep 2020 10:27:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200914131536.6072-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTOPR0101CA0037.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::14) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTOPR0101CA0037.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11 via Frontend Transport; Tue, 15 Sep 2020 14:27:58 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c444e5c8-08c7-4322-4b89-08d859838b3b
X-MS-TrafficTypeDiagnostic: BYAPR11MB3447:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB34473B7A523899F9B086276B9F200@BYAPR11MB3447.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	okso3BJ7sku/B48RsanZ9LCNtEPKTMyotEZkChCbf3TubhTguWw3terGrfyFgjyHs/aduW7dd6n6YffZw2Hs6KIimqXxwtU/IzAvISfB6fbpbG8ywWyjwo119SgTYynqfFiVK4ysIP7QPdZ8ogYkDdq7cB51Pu3UkhKXZVQzWbqKiiMzbtbvhyDOlMTO898UO2xv8WHQoIWzwPHiCUP7KHYM3yjj6maTasfbo4MWapgrNJIxgNNuNS16OXW3uCzg8vBs+94gPOpQ1K+7n7r32x5TjcZIDRzE7f4uJz9QQZKfc9mocUuOcd8Gnyk9vG+fh7L87b1UU6q22J5g4BmkfHAO3K3SBbWEC4wy6YgIst3L23QuBACYcU/qqSDk+miAfoyr+rmzehNwGxfETTVtWCAkTQM1yOw8sUAlgbYlfRoLjN7jjdyRwC+n3U+cLfqLMtmC1MNXTRhjpo4VLUmZog==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(39850400004)(396003)(136003)(16576012)(186003)(956004)(44832011)(86362001)(16526019)(5660300002)(36756003)(53546011)(8936002)(66556008)(66476007)(66946007)(52116002)(2616005)(33964004)(6486002)(478600001)(8676002)(31686004)(31696002)(83380400001)(26005)(316002)(2906002)(966005)(166002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	BoUia059jiR/X4j5rJUrR5hEbkcWmRs774aXnADnNR/ZD5f8lZD0Uo016aZDZGJjOqbv4DHc4cmUlSzWLaq0wvTw2g8Yr9exdcvAx8qonZ0F7UBlhcQLjLn4m2SHD12KLAMP3BYQPKgj+CGVP+uMmYcRVmlvev4zbq7o0/kKwHqgvLEcwG2E8MJIpje7eLJiXJbk/x9aRQ8rHnYHCemq1Xzttc+1Qylp522DMvDqWPFwpxuu/ZYF73+8aWq4BoqsEWSyY3LSfJVkNCFoctfOILaS/sH8xyYN560IfCpagZMiDfi50lWebG07tBQ6dUlaDh6RLqIPdAPBfLggEy9ohpWD6G2Oul8drhPIwyP2mQxjXFBmMk9syWCeNNbGElEfVSFZerK7ruKHM1o6vFUKi193r6koBAK0b7V2BFokpew2DniBrkqUqrsmKXGkpKwB/0CQ7Tty4qKFIeB8ZgRQVR7ESBwBc/Ko3WC0HH5YT/wrulutZm3VRTaXHav589iTE40CSROEC4dAu/PBh8onqURPpgAQZyDUqZMNwy/jujG/mJQmgQmoRE2T3YDX9WlgW/SsE0uuMPLpLgAO/ocG2srUP+XCXw6Qd7dg0g40r39YVBGc8Tsz18K2SFPhDOHvbZp+e5t8pTHlzVnBuiKMFA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c444e5c8-08c7-4322-4b89-08d859838b3b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2020 14:27:58.6111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ro54+SKuIgaF23MjRvc8itc3EoMe+8iAex2HFrP8orLoQGlE2La2pqHGHR7BF6qJ6FCkSWHfejv8p0ldNuCeXt+14vi27GrtRmMITTxapRY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3447
Content-Type: multipart/alternative;
 boundary="------------F63A697C9DFF6B40C67B2082"
Content-Language: en-US

--------------F63A697C9DFF6B40C67B2082
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/14/20 9:15 AM, Leon Anavi wrote:
> Upgrade to release 5.0.3:
>
> - Add python_requires kwarg to setup
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...{python3-diskcache_5.0.2.bb => python3-diskcache_5.0.3.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-diskcache_5.0.2.bb => python3-diskcache_5.0.3.bb} (67%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-diskcache_5.0.2.bb b/meta-python/recipes-devtools/python/python3-diskcache_5.0.3.bb
> similarity index 67%
> rename from meta-python/recipes-devtools/python/python3-diskcache_5.0.2.bb
> rename to meta-python/recipes-devtools/python/python3-diskcache_5.0.3.bb
> index 7eda65fa0..7e89fa68a 100644
> --- a/meta-python/recipes-devtools/python/python3-diskcache_5.0.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-diskcache_5.0.3.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "http://www.grantjenks.com/docs/diskcache/"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=c985b6a9269e57a1073d5f142d68eb68"
>   
> -SRC_URI[md5sum] = "b8061d293045b29b83201cf9a62b1da2"
> -SRC_URI[sha256sum] = "6e350e795e197f979316a3f524a729edb13d1739959c6e9cb5df78a0a72c8255"
> +SRC_URI[md5sum] = "86fb97b0ff87cc5f1b31654ee0d341a1"
> +SRC_URI[sha256sum] = "5f4bc2018d653a1d7bbdcdecce45ea12061bf8d3b5f0323b7a5402054a285c52"
>   
>   PYPI_PACKAGE = "diskcache"
>   
>
> 

--------------F63A697C9DFF6B40C67B2082
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/14/20 9:15 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200914131536.6072-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 5.0.3:

- Add python_requires kwarg to setup

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200914131536.6072-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...{python3-diskcache_5.0.2.bb =&gt; python3-diskcache_5.0.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-diskcache_5.0.2.bb =&gt; python3-diskcache_5.0.3.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-diskcache_5.0.2.bb b/meta-python/recipes-devtools/python/python3-diskcache_5.0.3.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-diskcache_5.0.2.bb
rename to meta-python/recipes-devtools/python/python3-diskcache_5.0.3.bb
index 7eda65fa0..7e89fa68a 100644
--- a/meta-python/recipes-devtools/python/python3-diskcache_5.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-diskcache_5.0.3.bb
@@ -3,8 +3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://www.grantjenks.com/docs/diskcache/">&quot;http://www.grantjenks.com/docs/diskcache/&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=c985b6a9269e57a1073d5f142d68eb68">&quot;file://LICENSE;md5=c985b6a9269e57a1073d5f142d68eb68&quot;</a>
 
-SRC_URI[md5sum] = &quot;b8061d293045b29b83201cf9a62b1da2&quot;
-SRC_URI[sha256sum] = &quot;6e350e795e197f979316a3f524a729edb13d1739959c6e9cb5df78a0a72c8255&quot;
+SRC_URI[md5sum] = &quot;86fb97b0ff87cc5f1b31654ee0d341a1&quot;
+SRC_URI[sha256sum] = &quot;5f4bc2018d653a1d7bbdcdecce45ea12061bf8d3b5f0323b7a5402054a285c52&quot;
 
 PYPI_PACKAGE = &quot;diskcache&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------F63A697C9DFF6B40C67B2082--

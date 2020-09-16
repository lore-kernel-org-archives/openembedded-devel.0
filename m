Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.65])
 by mx.groups.io with SMTP id smtpd.web12.22644.1600263394470955718
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Sep 2020 06:36:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Ycz+r4HT;
 spf=pass (domain: windriver.com, ip: 40.107.243.65, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ng3fphDXBErkU4Wd9yHKDOstbDC/d0VqE+ZpbU50rg/e2pWWJF9HlnlAoiTIZCrlIOBJx2BoIlaF1FX1FUf8DMuCzKv+CaegMbhOmjLMDqp30NACrp7/QkmCwGa6KouV8tBHdmMp9FnvzW2nkTyn6RybAtFR92ZxyWTkMX/ARXObtcOl63Blw4w+NqDDXwqC50VRdMTXfkrVuEGrTY+bYHTbnsPJaoG/8NH7o0On6ZkjnBYwO9OYqR4H9c3si5TOd8Fd0HMtkiTm8jhTgmXIf2dxQrtSMRET0GjhSF7D/1p7lKy5C8G0VPEZMq8k37ZkofW5mgGIIu90aIHpTeleiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tgze8owHOccu1TCfbww1obVWEeCdufOVxGvBCBG3qtQ=;
 b=gAxQHbfUuYCPR6gyq9fU5dLNVUOKzR93uwW+b3dxOv7XD5ofyaKGzUvDTiqDyREq8zqnxAfu6wgovqgXjlFPe53+P2RwsjMJcpMTQsucd/aJCUE1sBcg5K1evKBULBrCTke3YkVXUKD3xiHocJo4/fsGRSSbZmay2PVS+Df3zlqMjYnNtTqb0QE1NWXv8X1vh8+YEaDm9Vv2uW5duoFJ/Qcc1BVDZZa7ljHGV+f+CyJUo3DA3g7BdgJpXF4HucFs86yOPMwGWbeNm2JSo+sWEx1E+lmAUIuMcW8oZIv33CzbzWY5FEoZZMi4bU3zQKgziXeMQsSbV7+66nEryQDg+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tgze8owHOccu1TCfbww1obVWEeCdufOVxGvBCBG3qtQ=;
 b=Ycz+r4HTz/cIIGVtTu1yhFJG0xxM1k0QPVLntPThATwp7vORnO8gpj8qXQQvgkHHcvvQim6OX3cPVwpw9eboxf44s97btbciscSjDb9fypH4Iim2y12JMJa9bVGDQ24D6uCJYzpT7PeP/rQ09tpm4buqXW0qHL9NlRIgn4viIwU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3765.namprd11.prod.outlook.com (2603:10b6:a03:f6::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Wed, 16 Sep
 2020 13:36:33 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3391.014; Wed, 16 Sep 2020
 13:36:33 +0000
Subject: Re: [oe] [meta-python][PATCH 03/10] python3-sentry-sdk: Upgrade 0.17.3 -> 0.17.5
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200915090303.14367-1-leon.anavi@konsulko.com>
 <20200915090303.14367-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <6710c525-da97-f2bf-6665-659077f3c9a7@windriver.com>
Date: Wed, 16 Sep 2020 09:36:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200915090303.14367-3-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0084.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::23) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0084.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11 via Frontend Transport; Wed, 16 Sep 2020 13:36:32 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f9d9349-d0f9-452e-c2fd-08d85a458698
X-MS-TrafficTypeDiagnostic: BYAPR11MB3765:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3765384A84255BE48EFF1C619F210@BYAPR11MB3765.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:188;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+c6Q9uGl7y2PbOtjFYc1cmhd5Ir8bt6sar+nJM01rlruPoWMsxK1WApR6cP0Wm9xxG4CgzvpPacgSQYTRnKUKAjzGFDOLH0IwVRgEeEgYWX0lWP1f5CnijRmd6Kcbcr658/xf/i3FyCxTqcz1lgH9Sjn3NtmOaWRGSMr1qUI4bMyrHeaQsTshXEmaq3eFFEuFffsDe+wgWM3rh4CUopy4q9A22m5d/jZ817godVdZMovmAe5Phtlq2qyHoLZp1xcOeSQ3QwZnBpqYW0ar8+0yccrmJB5VR1sdI/EmZwOJSB98w0OIH6SGurAhKynlv90Ga4CF2Kf+EfTX1ee02hmW6x2VX1ZAaStY5N/aN5qWnfZl1Vq6AIO3zsMOYEAtiO2RLNbR4n5WnWFDAOP8czI6WzPPUDOiP4a6V3G7ku7Ay4b/GNHot2qcn1K32MJvyxznQHkcUTragYpZII2QBaBCQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(366004)(396003)(39830400003)(44832011)(966005)(26005)(66946007)(478600001)(31686004)(66476007)(956004)(2616005)(53546011)(66556008)(6486002)(33964004)(166002)(8676002)(8936002)(16576012)(186003)(83380400001)(52116002)(31696002)(86362001)(6666004)(316002)(16526019)(5660300002)(2906002)(36756003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	Inxx27r05EP2vK02Xr42EXyJF5jy3HruiPCgoh86tfDNLN1a4jrWPSNN5Poss5+QIUQpMLqREDc9zwfynTlM59X5XPe6iEr1V+csvUDX6dH64PlFA8MYvy8m7LT9mEX1ihasnrjNdD85wsgJDwvqSNveTWAZnJ6RFTS/Tv1ujd/9UbvgIHO/j9O3y3gI3yO2ZDZ9G7PYhQ5E9B1Mju3Tlh5sCvPHnIUe6uCupZ/6f5X3AOgZ+Sg9wcl2bvYstORLfHpEmwPdfhyzR9JzxLIelt0Nuxxa4ToXp2eftzvyJ/n1Pk0Scjj1SS3QS6PWzQ8tTGe8CuIIki9YW+p30p1gef+2Y4b9lYdHdlsRraCXfAx29yRWwDdCZyyrlRwbgiuQ9RdfIz4ZYwYPIhB6oAoDZCQ8D0qZYbc+2jcFJm0xDSfcpTJIzjI3rt2Bbh9VuKSIxWfuoQ1JRssALylJQxkHdmrCCJO4h0CWBxCaO9pmDOpv0WuEb7XwcZvTuBxmzvMkAxuhILEeatLswBJtiVqNXrQ2mLoV2ABsyz2E65vh6PItw2gXOSkchBmfUwRKPbWvRDHr/PV1mD+VQXyzFy1DSepkLcZfqX4uArtPrNmcyIZafsaikt7/Z//1vFMngLz4J4fLY2sImNHRU5HXl+kekQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f9d9349-d0f9-452e-c2fd-08d85a458698
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2020 13:36:33.3375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i1+W2t5D5+B0s4HhOJd2H4hiAd4vnnJaxFPsiJxKQZ7gsY52gFPXBDuzhkAFaDI5wMoeCU38I3UajpQu23I3v3YI7EMcuQsFtp9/RCU2q7E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3765
Content-Type: multipart/alternative;
 boundary="------------BBA3960F32D5F42561FE2877"
Content-Language: en-US

--------------BBA3960F32D5F42561FE2877
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/15/20 5:02 AM, Leon Anavi wrote:
> Upgrade to release 0.17.5:
>
> - Work around an issue in the Python stdlib that makes the entire
>    process deadlock during garbage collection if events are sent
>    from a __del__ implementation.
> - Add possibility to wrap ASGI application twice in middleware to
>    enable split up of request scope data and exception catching.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...hon3-sentry-sdk_0.17.3.bb => python3-sentry-sdk_0.17.5.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-sentry-sdk_0.17.3.bb => python3-sentry-sdk_0.17.5.bb} (72%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.3.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.5.bb
> similarity index 72%
> rename from meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.3.bb
> rename to meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.5.bb
> index 0a39fb142..5495fa0d3 100644
> --- a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.5.bb
> @@ -5,8 +5,8 @@ HOMEPAGE = "https://github.com/getsentry/sentry-python"
>   LICENSE = "BSD-2-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341"
>   
> -SRC_URI[md5sum] = "5d4abcc416cbd0b9443bf56588b02b55"
> -SRC_URI[sha256sum] = "0af429c221670e602f960fca85ca3f607c85510a91f11e8be8f742a978127f78"
> +SRC_URI[md5sum] = "dcdf0d4f84f4f6ea02ad3f15dfcff2d9"
> +SRC_URI[sha256sum] = "02f2a72698453f722b102562eb6430d2a82d6c6c40f2b991ed69e7628142de6a"
>   
>   PYPI_PACKAGE = "sentry-sdk"
>   inherit pypi setuptools3
>
> 

--------------BBA3960F32D5F42561FE2877
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/15/20 5:02 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200915090303.14367-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.17.5:

- Work around an issue in the Python stdlib that makes the entire
  process deadlock during garbage collection if events are sent
  from a __del__ implementation.
- Add possibility to wrap ASGI application twice in middleware to
  enable split up of request scope data and exception catching.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200915090303.14367-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...hon3-sentry-sdk_0.17.3.bb =&gt; python3-sentry-sdk_0.17.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_0.17.3.bb =&gt; python3-sentry-sdk_0.17.5.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.3.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.5.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.3.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.5.bb
index 0a39fb142..5495fa0d3 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.3.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.5.bb
@@ -5,8 +5,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/getsentry/sentry-python">&quot;https://github.com/getsentry/sentry-python&quot;</a>
 LICENSE = &quot;BSD-2-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341">&quot;file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341&quot;</a>
 
-SRC_URI[md5sum] = &quot;5d4abcc416cbd0b9443bf56588b02b55&quot;
-SRC_URI[sha256sum] = &quot;0af429c221670e602f960fca85ca3f607c85510a91f11e8be8f742a978127f78&quot;
+SRC_URI[md5sum] = &quot;dcdf0d4f84f4f6ea02ad3f15dfcff2d9&quot;
+SRC_URI[sha256sum] = &quot;02f2a72698453f722b102562eb6430d2a82d6c6c40f2b991ed69e7628142de6a&quot;
 
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

--------------BBA3960F32D5F42561FE2877--

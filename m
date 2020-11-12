Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.55])
 by mx.groups.io with SMTP id smtpd.web12.10251.1605211320343218560
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Nov 2020 12:02:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=R9z9+dUu;
 spf=pass (domain: windriver.com, ip: 40.107.223.55, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E+mS1YrgL91EdE/ts8QcaYbC0abzcr4RZP5/6f1UxlC6ucMqbQ8iBhgDod7gMY2Xm666wBUaSnHHMyIlZsl2YNJ0OwoaXVfkUVr0KRU7uLPsfbe66HkjTQpqi+NgxgS6tJMCzlNYlxOuipUU6ktNQ8u1J3Jp0+ih3USuZfNOBClWic50yvj/mgGY/xF/CjL7q76Pbyoz4YRcAIP2e8rTF0OpSf4mIuthtzizbg3Vl7wOptVnpnqCvfK/VQb+vJy5pDwRxEK00spJgI4orM/TMn3tX61spzHFetv5iTN/0W7Uzwbl3otZI5qCQmTNyjPtLG0KHvZzNDuAP+AqzZW++A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4qxZ1tjVi9jSqUnje0odqtNA5UFRD+2nuys7SloJJkM=;
 b=EMsLhyILbZei+8GqJUAgZKO4k+R9XCNLVg2cv+qR57EPIoCXzIxLzr5aZyJa5hbz9yQjk5wFVYVRDRdvgT3hoBEab0iEUNdjolnTrCaGMFz0KB0X+nfsRi89C3ejKC48xq1t4v2YGcqflelvX+moR0RAp4vxbx2CN6wlZPEH5GfSiR88CqePxFPcn8kjCYFUj1vvKsxcpR3PZdPbsz0aBze2Quje6KGchGPT8QjCZ70g/EQR7BygdNLOYvxu9KuVB5EshsjHPOuoKfgw3Y4f3b8CX4tIuX0UKexJ2lAxzieVhIrB2Cb8ddVoI0+UD/3TcGbSx/WReQUlLy4cM/VkIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4qxZ1tjVi9jSqUnje0odqtNA5UFRD+2nuys7SloJJkM=;
 b=R9z9+dUuAEQ+6BUrce3sO45/wbUGD0pIWndxLA9gy4ayYD0n91Za65pJqhBrvwI9u/M492BiajEtoiOYO7mxyTJYbrB6hBfq0u7boRQ6PeYwjvbyseYRu8g7AAXxeJtPm9SLwlbrvOLSq26QOmOPAt35+tImvl/zPHKnUP+w7DI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3112.namprd11.prod.outlook.com (2603:10b6:a03:85::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Thu, 12 Nov
 2020 20:01:59 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3541.025; Thu, 12 Nov 2020
 20:01:59 +0000
Subject: Re: [oe] [meta-python][PATCH v2] meta-python: Drop RDEPEND'ing on python3-typing
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20201111154919.862517-1-raj.khem@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <dfda80e2-eab5-05f0-e8d6-311d5eeef0bd@windriver.com>
Date: Thu, 12 Nov 2020 15:01:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <20201111154919.862517-1-raj.khem@gmail.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YT1PR01CA0138.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::17) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0138.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Thu, 12 Nov 2020 20:01:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 191cefed-7ab2-4dd0-c275-08d88745cfc1
X-MS-TrafficTypeDiagnostic: BYAPR11MB3112:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB31126BD4909F0A5BBFD25DEA9FE70@BYAPR11MB3112.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:31;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	M8Ve8udzFybBCbHn6/hqvIzu5ghhYyaVCYBECdyYmIprBfNeD4FmR0cXJi4xGPNRmbXuUE5Lw6n9EQWtqyQgikhRQ9Cm7SqvWLtcrVh4EAwvs7MfkKPnfCgZDOjkKJfyhcbVeagbO8PQL70Bz8yZwv6vDMdoIq512A17IjfP5bJeIuc9XbS0DeY9g0ycQPRYIriu3WCuvmIq0zoqNMFuvJ/ATX5QnjTqklfG2OZU5miDdQguAc6/M91oatcAex1LLLFjawVntTSOif07HVSnoH04kiyKSz2XVkqQyKn56QpP03P/hg5Q8kTs0bgFuYifiQOpSHPhXY6zI/k++VuQ+VyFHhO1XMWdUQNybAd2LWldjp2KoIQRJPBWxQjjtUHh86Yy2nryqPxJCAcJGjaPgb9oBPegO7p4HUI/clXt8L4WaZ2GORDxyT+jTMMK5LAzMntdhmLzm9Fewf7v9fINbQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(346002)(366004)(39850400004)(966005)(2906002)(316002)(2616005)(186003)(31686004)(26005)(53546011)(166002)(16576012)(16526019)(956004)(36756003)(30864003)(52116002)(66556008)(33964004)(86362001)(478600001)(31696002)(66946007)(8676002)(8936002)(6486002)(83380400001)(5660300002)(44832011)(66476007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	aUGWCf5DLxatTZmbjud6zMEHqleXF9WJylGLXW76YvuMrYJ0XI1bfSrvcYKCgBxMVHYjH4g9hwsiCK7jGl9k0aQsHLCdmVjzMvK2cp1zIS0ULj6e/Alt0S7vnKenZ5EJJNPaZ8qYvg4ZaOIcT3id8YG59PwR+ag2ZHaSGgO5cCC0/nyatotfCASWxKcSWCAKRRDWHmwk1lqrUzGLA48dsq0DXpaUQrvXmgKkR6f84BZlWWdfyl4/ddwrv3r5uxL7QvNj9fj2dhi/vpcxf/eCQEMp/fnBA7h++rtMQ0/nLl1+kVa9bi+v4/sSXK7MC6XZrwhSKXHd/lsx/pABuzvI+I+clvGqcWq/CzkYb6d36laW0ku8M3lyw9G0tAWSKVi/dpqv5UoQRKFJitExNdJy5AgyER+R5gxGtv4l6yWdNZxSPKKxZ713RwzN3iKCqwmWvTajNjHsOBWTBJWmEQ5UdIv1D8pxFc1Uc1KPELMBdB03d7aZ3uPXAfaZOxomR3bKEsEu3E1fctILlX3stPkkkNVTG0Js8jglQX/fGMffRscRyS7d9VbxQ/p6k8ECsAAkbZH2hFYo5dJ7ckdiH4KNJpfgLbxNtIX+u9h+DGxn360fM/4L2+jlTLj0GFAnT4dUMV2oqeABokwrvVamPWoKfQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 191cefed-7ab2-4dd0-c275-08d88745cfc1
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2020 20:01:59.0784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z88eUYrded+8ODC7GIwGFO1s+2VWBuePWXS6jK7VCbWfQZ+7FJ7lStWKT/1TwNSPolyv/5gM5D/nDHOtym84kmRdVyewczd0FmsuWWs/S/E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3112
Content-Type: multipart/alternative;
 boundary="------------C896E076CAD10CD16EE5D550"
Content-Language: en-US

--------------C896E076CAD10CD16EE5D550
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/11/20 10:49 AM, Khem Raj wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> Its part of core python package now
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
> v2: Add remaining recipes
>
>   meta-python/recipes-devtools/python/python-m2crypto.inc         | 1 -
>   meta-python/recipes-devtools/python/python3-aiohttp_3.7.2.bb    | 1 -
>   meta-python/recipes-devtools/python/python3-argexec_1.0.3.bb    | 1 -
>   .../recipes-devtools/python/python3-dynamic-dispatch_1.0.3.bb   | 1 -
>   meta-python/recipes-devtools/python/python3-gmqtt_0.6.7.bb      | 1 -
>   .../recipes-devtools/python/python3-jsonrpcserver_4.1.3.bb      | 1 -
>   meta-python/recipes-devtools/python/python3-typeguard_2.10.0.bb | 2 --
>   meta-python/recipes-devtools/python/python3-webcolors_1.11.1.bb | 1 -
>   8 files changed, 9 deletions(-)
>
> diff --git a/meta-python/recipes-devtools/python/python-m2crypto.inc b/meta-python/recipes-devtools/python/python-m2crypto.inc
> index 81c81645af..797a0354bf 100644
> --- a/meta-python/recipes-devtools/python/python-m2crypto.inc
> +++ b/meta-python/recipes-devtools/python/python-m2crypto.inc
> @@ -25,7 +25,6 @@ RDEPENDS_${PN} += "\
>     ${PYTHON_PN}-netserver \
>     ${PYTHON_PN}-numbers \
>     ${PYTHON_PN}-smtpd \
> -  ${PYTHON_PN}-typing \
>     ${PYTHON_PN}-xmlrpc \
>   "
>
> diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.7.2.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.7.2.bb
> index 178e68bd97..6cd5a4cab5 100644
> --- a/meta-python/recipes-devtools/python/python3-aiohttp_3.7.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.7.2.bb
> @@ -16,6 +16,5 @@ RDEPENDS_${PN} = "\
>       ${PYTHON_PN}-idna-ssl \
>       ${PYTHON_PN}-misc \
>       ${PYTHON_PN}-multidict \
> -    ${PYTHON_PN}-typing \
>       ${PYTHON_PN}-yarl \
>   "
> diff --git a/meta-python/recipes-devtools/python/python3-argexec_1.0.3.bb b/meta-python/recipes-devtools/python/python3-argexec_1.0.3.bb
> index a26835b607..9f152a1d60 100644
> --- a/meta-python/recipes-devtools/python/python3-argexec_1.0.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-argexec_1.0.3.bb
> @@ -9,7 +9,6 @@ SRC_URI[sha256sum] = "61f9ae9322e38ae64996848421afbdb018239a99c4e796fe064f172d6c
>
>   DEPENDS += "python3-setuptools-scm-native"
>   RDEPENDS_${PN} += "\
> -  python3-typing \
>     python3-dynamic-dispatch \
>     python3-typeguard \
>   "
> diff --git a/meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.3.bb b/meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.3.bb
> index 2bf487584a..0ed5df1b2e 100644
> --- a/meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.3.bb
> @@ -12,7 +12,6 @@ PYPI_PACKAGE = "dynamic_dispatch"
>
>   DEPENDS += "python3-setuptools-scm-native"
>   RDEPENDS_${PN} += "\
> -  python3-typing \
>     python3-typeguard \
>   "
>
> diff --git a/meta-python/recipes-devtools/python/python3-gmqtt_0.6.7.bb b/meta-python/recipes-devtools/python/python3-gmqtt_0.6.7.bb
> index 2bf9d07533..70527e026c 100644
> --- a/meta-python/recipes-devtools/python/python3-gmqtt_0.6.7.bb
> +++ b/meta-python/recipes-devtools/python/python3-gmqtt_0.6.7.bb
> @@ -15,7 +15,6 @@ RDEPENDS_${PN} += "\
>       python3-json \
>       python3-logging \
>       python3-netclient \
> -    python3-typing \
>   "
>
>   BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.3.bb b/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.3.bb
> index 98db23039b..75a0926f08 100644
> --- a/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.3.bb
> @@ -17,7 +17,6 @@ RDEPENDS_${PN} += "\
>       python3-logging \
>       python3-netclient \
>       python3-pkgutil \
> -    python3-typing \
>   "
>
>   BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python3-typeguard_2.10.0.bb b/meta-python/recipes-devtools/python/python3-typeguard_2.10.0.bb
> index bd92216776..cb5c372352 100644
> --- a/meta-python/recipes-devtools/python/python3-typeguard_2.10.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-typeguard_2.10.0.bb
> @@ -28,6 +28,4 @@ DEPENDS += "\
>       python3-setuptools-scm-native \
>   "
>
> -RDEPENDS_${PN} += "python3-typing"
> -
>   BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python3-webcolors_1.11.1.bb b/meta-python/recipes-devtools/python/python3-webcolors_1.11.1.bb
> index b950d6f632..e567e0ba28 100644
> --- a/meta-python/recipes-devtools/python/python3-webcolors_1.11.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-webcolors_1.11.1.bb
> @@ -9,7 +9,6 @@ inherit pypi setuptools3 ptest
>
>   RDEPENDS_${PN}_class-target = "\
>       ${PYTHON_PN}-stringold \
> -    ${PYTHON_PN}-typing \
>   "
>
>   SRC_URI += " \
> --
> 2.29.2
>
>
> 
>

--------------C896E076CAD10CD16EE5D550
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11/11/20 10:49 AM, Khem Raj wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201111154919.862517-1-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

Its part of core python package now

Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201111154919.862517-1-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
v2: Add remaining recipes

 meta-python/recipes-devtools/python/python-m2crypto.inc         | 1 -
 meta-python/recipes-devtools/python/python3-aiohttp_3.7.2.bb    | 1 -
 meta-python/recipes-devtools/python/python3-argexec_1.0.3.bb    | 1 -
 .../recipes-devtools/python/python3-dynamic-dispatch_1.0.3.bb   | 1 -
 meta-python/recipes-devtools/python/python3-gmqtt_0.6.7.bb      | 1 -
 .../recipes-devtools/python/python3-jsonrpcserver_4.1.3.bb      | 1 -
 meta-python/recipes-devtools/python/python3-typeguard_2.10.0.bb | 2 --
 meta-python/recipes-devtools/python/python3-webcolors_1.11.1.bb | 1 -
 8 files changed, 9 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-m2crypto.inc b/meta-python/recipes-devtools/python/python-m2crypto.inc
index 81c81645af..797a0354bf 100644
--- a/meta-python/recipes-devtools/python/python-m2crypto.inc
+++ b/meta-python/recipes-devtools/python/python-m2crypto.inc
@@ -25,7 +25,6 @@ RDEPENDS_${PN} += &quot;\
   ${PYTHON_PN}-netserver \
   ${PYTHON_PN}-numbers \
   ${PYTHON_PN}-smtpd \
-  ${PYTHON_PN}-typing \
   ${PYTHON_PN}-xmlrpc \
 &quot;

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.7.2.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.7.2.bb
index 178e68bd97..6cd5a4cab5 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.7.2.bb
@@ -16,6 +16,5 @@ RDEPENDS_${PN} = &quot;\
     ${PYTHON_PN}-idna-ssl \
     ${PYTHON_PN}-misc \
     ${PYTHON_PN}-multidict \
-    ${PYTHON_PN}-typing \
     ${PYTHON_PN}-yarl \
 &quot;
diff --git a/meta-python/recipes-devtools/python/python3-argexec_1.0.3.bb b/meta-python/recipes-devtools/python/python3-argexec_1.0.3.bb
index a26835b607..9f152a1d60 100644
--- a/meta-python/recipes-devtools/python/python3-argexec_1.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-argexec_1.0.3.bb
@@ -9,7 +9,6 @@ SRC_URI[sha256sum] = &quot;61f9ae9322e38ae64996848421afbdb018239a99c4e796fe064f172d6c

 DEPENDS += &quot;python3-setuptools-scm-native&quot;
 RDEPENDS_${PN} += &quot;\
-  python3-typing \
   python3-dynamic-dispatch \
   python3-typeguard \
 &quot;
diff --git a/meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.3.bb b/meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.3.bb
index 2bf487584a..0ed5df1b2e 100644
--- a/meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.3.bb
@@ -12,7 +12,6 @@ PYPI_PACKAGE = &quot;dynamic_dispatch&quot;

 DEPENDS += &quot;python3-setuptools-scm-native&quot;
 RDEPENDS_${PN} += &quot;\
-  python3-typing \
   python3-typeguard \
 &quot;

diff --git a/meta-python/recipes-devtools/python/python3-gmqtt_0.6.7.bb b/meta-python/recipes-devtools/python/python3-gmqtt_0.6.7.bb
index 2bf9d07533..70527e026c 100644
--- a/meta-python/recipes-devtools/python/python3-gmqtt_0.6.7.bb
+++ b/meta-python/recipes-devtools/python/python3-gmqtt_0.6.7.bb
@@ -15,7 +15,6 @@ RDEPENDS_${PN} += &quot;\
     python3-json \
     python3-logging \
     python3-netclient \
-    python3-typing \
 &quot;

 BBCLASSEXTEND = &quot;native nativesdk&quot;
diff --git a/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.3.bb b/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.3.bb
index 98db23039b..75a0926f08 100644
--- a/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.3.bb
@@ -17,7 +17,6 @@ RDEPENDS_${PN} += &quot;\
     python3-logging \
     python3-netclient \
     python3-pkgutil \
-    python3-typing \
 &quot;

 BBCLASSEXTEND = &quot;native nativesdk&quot;
diff --git a/meta-python/recipes-devtools/python/python3-typeguard_2.10.0.bb b/meta-python/recipes-devtools/python/python3-typeguard_2.10.0.bb
index bd92216776..cb5c372352 100644
--- a/meta-python/recipes-devtools/python/python3-typeguard_2.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-typeguard_2.10.0.bb
@@ -28,6 +28,4 @@ DEPENDS += &quot;\
     python3-setuptools-scm-native \
 &quot;

-RDEPENDS_${PN} += &quot;python3-typing&quot;
-
 BBCLASSEXTEND = &quot;native nativesdk&quot;
diff --git a/meta-python/recipes-devtools/python/python3-webcolors_1.11.1.bb b/meta-python/recipes-devtools/python/python3-webcolors_1.11.1.bb
index b950d6f632..e567e0ba28 100644
--- a/meta-python/recipes-devtools/python/python3-webcolors_1.11.1.bb
+++ b/meta-python/recipes-devtools/python/python3-webcolors_1.11.1.bb
@@ -9,7 +9,6 @@ inherit pypi setuptools3 ptest

 RDEPENDS_${PN}_class-target = &quot;\
     ${PYTHON_PN}-stringold \
-    ${PYTHON_PN}-typing \
 &quot;

 SRC_URI += &quot; \
--
2.29.2

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------C896E076CAD10CD16EE5D550--

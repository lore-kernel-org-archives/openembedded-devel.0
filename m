Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.77])
 by mx.groups.io with SMTP id smtpd.web08.6105.1605099512538467667
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2020 04:58:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=YNPG18wo;
 spf=pass (domain: windriver.com, ip: 40.107.93.77, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U1lUyh21/6lYCYgUS3+iShwcqROCWownWuJdPimQfAUtb7h/IyNJ5Z5h03/4RPRbRNiJBIE/cEmyYBZMjzQgChXmSTA17P+x+jvvLM/ky2w0VXhUc6jy7epcFgBPPTuLY6cGzRvdyE3YeKks7X1CPCz11FfOiqh3Rt78kGPUdWJKrLoeE4ATPesjUDAkESv+kq1xtp2IiM2me6lfPvw4Y4pQglLArkI89YKkAn4sJ9+zJid+QGPHDlpBE/EZ9LxPxdIOxFo+lPGUcBkIzCH4A/XL87cwI93i5ChVZbuiXuj4K9K2HyXgUb4VTE1jYcBCsBJHkuLSjWCt9Yq7wPOcTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IPYMHsIAOqbEcgs7TcYsj3TnhZeOF84u5MB8XcH3Mbs=;
 b=noeax2mB269PwjuPoxcUCi/C1cnxlSyUWPfYfCL6LsI02n31O/+xh1kLMjJBoec+t1+hYtjfQjK8ZG2Zs2Fpa9nlUcPBwGJZs5BWQZXzgcKSb9oG77sw5H8vEXxqmDEFs7Pi79qI+2QojwHXAos3XWURnOGRcx+7z8XAG2IsmZtu6Cjn7aA3cTDAsFKQoMcn5un2QluGRey6YA90WAVKuRy/1XUOhmTwUKubq7H7JVciSKpEeQhqKwgLzu5TYtGin04wxLn03jaHkpNakwHqQzeuN5XpwmITVS0tL/bntil4iFILKFD32Pz1cw2Am8YovZEV1Ns+tivx5efCRUq/iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IPYMHsIAOqbEcgs7TcYsj3TnhZeOF84u5MB8XcH3Mbs=;
 b=YNPG18woO1xMsGnOHG8LNfFDDeNcEO6rJ1/yapIw6ctOJNXGil1EO/QlZDBPW+CGm8SW3qOZ/8CF3mdN5zj4hWlHeD6zl607+dxJTJFlQQm6UbhVQVG15EjGmFek+9QBbcDUVrS/5G7JjrT89udDhpXqyh8ZSfMtkx/39QOQ5ic=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB5184.namprd11.prod.outlook.com (2603:10b6:a03:2d5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Wed, 11 Nov
 2020 12:58:30 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3541.025; Wed, 11 Nov 2020
 12:58:30 +0000
Subject: Re: [oe] [meta-python][PATCH] meta-python: Drop RDEPEND'ing on python3-typing
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20201110193033.2750137-1-raj.khem@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <0cf0cc3c-6550-db48-63d7-8e24d17dc99c@windriver.com>
Date: Wed, 11 Nov 2020 07:58:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <20201110193033.2750137-1-raj.khem@gmail.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YTOPR0101CA0052.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::29) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTOPR0101CA0052.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Wed, 11 Nov 2020 12:58:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 331cb1e7-8031-470a-ad93-08d886417cee
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5184:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB51844FEFA7DB6EB1B0BB2B309FE80@SJ0PR11MB5184.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:644;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0SXL+jj768s2/Nu5UHw8cAUBLZ7hQqcvgeXeysFKymjuQCZETWMJMtbnr4/TMmbyvOglP1ChgMOFSm6cEOqwgy0jSDe99g/sJruu7dtBNg08DqJY0aS5F3G21i3mRKSlR9PNOPMI3x5bm27gn9Ip7NMv8mPHj2UX2A/5M3YHz+QiBVaWWhnCSoiQmqh6Xorl4KMcPQvu3NRDVvQ7uL2dzXvj9huHgD5z9rAKFW4z4pNrGO+rd3Qbpyw7anR7JYCh7ZUhbEVqol+EmZ8gJjQte4Lr7AAKQwYE1+pa9Fj3ShyzsyMMaIcWR3e/e/UZfD4PwTajnzSSxAZP733nffu5themWTKqUHPndoyhNLUbiJoxsSp6wPwyg+QFSswcQXgKFTYSoF1xNHy/yObvQG9Kn5vtPS1Tpm0l02rGRgHwL4Ph71mDsstTueqMKo+MeYkuON1Y97l68CqRgLhNEkJbyw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(376002)(39850400004)(366004)(2616005)(53546011)(956004)(316002)(5660300002)(478600001)(16526019)(16576012)(86362001)(31686004)(6486002)(44832011)(166002)(83380400001)(36756003)(8676002)(966005)(66476007)(31696002)(186003)(2906002)(66946007)(8936002)(66556008)(33964004)(52116002)(26005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	L0JWXtcm+lSql10c1ZONaeIR8c8BaQur0OPviIzDBFXhFsvwdTvucH9smbqH2JXJtPAYanXUdgIXMqI7CeciLTmvc0IcoHKIJ2ieD69hAe6q/1ZNYLHDpMuCe47F/A2TnAtMRXM15n5nb4uSY3oN1vVHX+XfVQGI0qPG/pMxTgRClKScd3F/aQ2AWULnAmQHsT4lrj8vfVLfcdNM3U2hq9p/9ObKyU4tBg6feIcXYxQz7b7t/ZZfuzI/pVnLVDQ64/XYGg7+60eTqnXOTfJ1AYb179rrisBfIdIONSehxZqc4jxImLewF6+emJKmoLrJv5sTl8ZtsnlYZfwx1w9z8vuLatKXnZoOTBqep2Ztt6PMm33WRmMxPAXDfrc73EXsTUbYuXsh00uHOIS81gPA8F6kAWNRM2N21vpEf5KAbMGy2+FqdYtc0mbvhrAOgba5Rj26c8CrsSBHgZJ+cRJrDSEZ/Q6vPnI+PltJsVbQ41JUuUPazrW/BjNNgGiG6/n0bNOXWsEYobzHtoG1MysH4ikwbNbkfRy2E4JW4hcfLiVeTuIBpYzRLypyizblCA51WwIKw6AzV+dW7NH4TDyxZ/BKxYlnYfZuMrSR/MWX+vCguL1FF4AtpTapu428ROnTBqLldjM2qrMKXL5XpsNqVw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 331cb1e7-8031-470a-ad93-08d886417cee
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2020 12:58:30.2776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PqgiqrYIwALw1JJ3imoOsLhhDlEYRSkN+EQu/ifyahI8+VHlTBDKhZPS1mmFOjBYbnjl2dnn2SafqZCG8sFt26v1tHAeDaVMOpFd7XZClc4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5184
Content-Type: multipart/alternative;
 boundary="------------62A51228F3961BA16902F63C"
Content-Language: en-US

--------------62A51228F3961BA16902F63C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/10/20 2:30 PM, Khem Raj wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> Its part of core python package now

There are at least three more recipes that still have it in their 
dependencies:

meta-python/recipes-devtools/python/python-m2crypto.inc

meta-python/recipes-devtools/python/python3-webcolors_1.11.1.bb

meta-python/recipes-devtools/python/python3-aiohttp_3.7.2.bb

Can you re-submit with those fixed as well?

>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   meta-python/recipes-devtools/python/python3-argexec_1.0.3.bb    | 1 -
>   .../recipes-devtools/python/python3-dynamic-dispatch_1.0.3.bb   | 1 -
>   meta-python/recipes-devtools/python/python3-gmqtt_0.6.7.bb      | 1 -
>   .../recipes-devtools/python/python3-jsonrpcserver_4.1.3.bb      | 1 -
>   meta-python/recipes-devtools/python/python3-typeguard_2.10.0.bb | 2 --
>   5 files changed, 6 deletions(-)
>
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
> --
> 2.29.2
>
>
> 
>

--------------62A51228F3961BA16902F63C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11/10/20 2:30 PM, Khem Raj wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201110193033.2750137-1-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

Its part of core python package now</pre>
    </blockquote>
    <p>There are at least three more recipes that still have it in their
      dependencies:</p>
    <p>meta-python/recipes-devtools/python/python-m2crypto.inc<br>
    </p>
    <p>meta-python/recipes-devtools/python/python3-webcolors_1.11.1.bb<br>
    </p>
    <p>meta-python/recipes-devtools/python/python3-aiohttp_3.7.2.bb<br>
    </p>
    <p>Can you re-submit with those fixed as well?<br>
    </p>
    <blockquote type="cite" cite="mid:20201110193033.2750137-1-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">

Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
---
 meta-python/recipes-devtools/python/python3-argexec_1.0.3.bb    | 1 -
 .../recipes-devtools/python/python3-dynamic-dispatch_1.0.3.bb   | 1 -
 meta-python/recipes-devtools/python/python3-gmqtt_0.6.7.bb      | 1 -
 .../recipes-devtools/python/python3-jsonrpcserver_4.1.3.bb      | 1 -
 meta-python/recipes-devtools/python/python3-typeguard_2.10.0.bb | 2 --
 5 files changed, 6 deletions(-)

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

--------------62A51228F3961BA16902F63C--

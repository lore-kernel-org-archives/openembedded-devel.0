Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.69])
 by mx.groups.io with SMTP id smtpd.web11.12062.1595943145871117772
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jul 2020 06:32:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=C2gJ0uLr;
 spf=pass (domain: windriver.com, ip: 40.107.243.69, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OpeDqhKEptlO9DCwfOmRBhE7+kWrMOn0PdYiAGv5qDbS8QUkjtZ2hRgtPzqT1nhYJiTy+aCLCJAiedJzOhi/nhvcSeSeS+k0ej55EdKTVJpWrEz839ZZpTGNyAPF77tVdf0K2lG0Rr9HNNkkCt8zVMGOfgYb7N3kJlrtaaq1BQ/ikHofedf6Sh29mtK97yrt+T3uGDtJ1rcXn0HLLf0c9sZd7cHjK6a5KWdzRoWlAsmhgQG6H6lUB7ADF2RKIAoHY0ddKBSNhXDmBsQHCpFAX50QFQlQSkr/qQ9occ6Ccz4Dz+TPRdolNUVEjWanXLszKlByIKw1zffAk1CsPjasiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6eedERLO+RfZUPwlKXbuBhL/naB+wOh5kSMDgcPOudE=;
 b=Jt1N9tKYlpmIOYm6RrJRnSdYYOxKozlgsoaPkbyyemBQkkT06N1x4xBQeVkwucJ+br2w8AKmjm8AsvX7r4nD0lsQmZq7PuNrhX0kcGGcOI/ks5Ir2uEDIhqrVrl7Xi2pK48b5YGm3oc9L3QoQGd1cPc8J0cCLiYP0CnSuxje5Bull/EPyUEXTymfa2KeVJ6+llHhLs6HA/Ze1KOGj2/48Ryr+vxoGxI23mmwsOzl0Rs0J22YpdT2lbYu4GkVTUO7A23R3AW0SNdueWDJw3ki8UrqJgmm+Yqc9j9UhUm2cj3TCMAKA/jI4PrXlPe1FfHp4L373Mt6Tki2oak0UMgHNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6eedERLO+RfZUPwlKXbuBhL/naB+wOh5kSMDgcPOudE=;
 b=C2gJ0uLre0IQsoMIBjbi1algzltORNeQmG+FX+TEX30f5JVCkofX4RhlORF2CYJREPOKHm5l/yaPc/d4T7a/c/55tbIQ765N2eo78RJgpx2iPPGrIYR702ile7UwHh54nSpZvLddOc86cRB562ZryUr3kGXjI5zSNVrNNmDN6t8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3816.namprd11.prod.outlook.com (2603:10b6:a03:f8::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Tue, 28 Jul
 2020 13:32:23 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3216.033; Tue, 28 Jul 2020
 13:32:23 +0000
Subject: Re: [oe] [meta-python][PATCH 2/7] python3-cmd2: Upgrade 1.1.0 -> 1.2.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200724103515.21420-1-leon.anavi@konsulko.com>
 <20200724103515.21420-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <e927c9c6-d31e-62c7-e53f-ea4a2388afd1@windriver.com>
Date: Tue, 28 Jul 2020 09:32:20 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200724103515.21420-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0069.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::8) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0069.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend Transport; Tue, 28 Jul 2020 13:32:23 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 698ea4a1-04d0-421a-a39c-08d832faa931
X-MS-TrafficTypeDiagnostic: BYAPR11MB3816:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3816F512E13B23CAA8D9C9229F730@BYAPR11MB3816.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Imf70ithjuOWxxsxzZ09rzPkRp9dQi/ZkYG6W9tEtGkQIfSLjyXjIwafFb8RrOosJaWxjLHxA1eRW1iRhSHzWX6MqM76IL7peqUOcMSH5SJcOWZCbzC6gCR3+HJg7/K0/wIfKuxKV0goXGygZiwK2heXHs/72OF7skrD2QLUMcXb4wEkcgac8b3h4bulZIviULRPh5Q3Z+hv37derb5pE0x+EvekL0G9Jg9Zy4cuq+K7+2FFVf4V3JMQ0uQvaZ2jsW89+8GSUOg/9qOTqdzWWsx3dR8olM14cPizwamX0l/h+SMVACOTzNkUhzXnkl8WWHluqhtIKhX7KGtTLHihpkoxqAFvZG8IS0/yCm0h732yNDDyP6lVob3C80xCQq6fUJaYnT2BjCIqPtLRyGV52K8FwFWg61GLIclFSJGqLjuXlFURXrzvNM+yMFLhgfcYhZDHkyh18sGVjID8+zPJ7w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(346002)(366004)(136003)(39850400004)(396003)(86362001)(166002)(16526019)(2906002)(186003)(36756003)(5660300002)(26005)(2616005)(956004)(44832011)(31686004)(8936002)(53546011)(52116002)(8676002)(316002)(478600001)(33964004)(16576012)(83380400001)(6486002)(66946007)(66556008)(66476007)(966005)(31696002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	eUIYj/IKRDaZppXh28SnYR6qAQs19QzzChuvM4s/MiguOlRe3sF3hKIoAzI0ub8Q29o+gxaaq8CqMM+pMcmwchBKTZTSD8EAAxqXNQhwZ/sEohCZgetbsQRd0+HjkiJOo8U1dPBKObGo/L395xc6bhHP+8iX8dMrJWJ3u4it0607p/QXwgeydl00q5WOxTNzzgb9PqDO5vs1V5VPGqUi5QHo9vClw3viNd8stl482rtALeMTQKBkBMut+8M1H4PSVMpe0b3EI5msNaPxx6ud7t+AyYG9Vjf2t1yzn+lUnhw6mPY7MZ+DKa5arBwiXwp0Ar3OPrtPMAg71AG0fXay+hJoCORQ2bPa4EUrd2QP159yObcxJUe9OGeRHjgWoPdJWLqPSRSFQZBhN1lF6n/yZ9eIJyNXEYImw3W4d0B2MaLj33YGsOykPQYizPwoiStmQe0NxwxVIrNeBjovwaLP/3DoeQImqpuos6B0Xs9riYQ=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 698ea4a1-04d0-421a-a39c-08d832faa931
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2020 13:32:23.7678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AxXUyd41ABZYCn8qhxWS6QzILTeNv9z7KfcASD44uws6azot0VuGzHK3oGgELC4+yejBO1Zn7eaFxtzm978vGH8aiRk3CY1T3XDfqHdpEgY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3816
Content-Type: multipart/alternative;
 boundary="------------0D1B4A3ADD1B39DF557DAD4C"
Content-Language: en-US

--------------0D1B4A3ADD1B39DF557DAD4C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/24/20 6:35 AM, Leon Anavi wrote:
> Upgrade to release 1.2.1:
>
> - Switched to getting version using importlib.metadata instead
>    of using pkg_resources
> - Fixed typing module compatibility issue with Python 3.5 prior
>    to 3.5.4
> - Relax minimum version of importlib-metadata to >= 1.6.0 when
>    using Python < 3.8
>
> Update the HOMEPAGE to match the home page link from pypi.org.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-cmd2_1.1.0.bb => python3-cmd2_1.2.1.bb} | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-cmd2_1.1.0.bb => python3-cmd2_1.2.1.bb} (67%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-cmd2_1.1.0.bb b/meta-python/recipes-devtools/python/python3-cmd2_1.2.1.bb
> similarity index 67%
> rename from meta-python/recipes-devtools/python/python3-cmd2_1.1.0.bb
> rename to meta-python/recipes-devtools/python/python3-cmd2_1.2.1.bb
> index bc74b5ab5..cb52ecfbb 100644
> --- a/meta-python/recipes-devtools/python/python3-cmd2_1.1.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-cmd2_1.2.1.bb
> @@ -1,12 +1,12 @@
>   SUMMARY = "Extra features for standard library's cmd module"
> -HOMEPAGE = "http://packages.python.org/cmd2/"
> +HOMEPAGE = "https://github.com/python-cmd2/cmd2"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=9791cd24ca7d1807388ccd55cd066def"
>   
>   DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
>   
> -SRC_URI[md5sum] = "2b4a3b15ac52d239664c40c2d661b0c7"
> -SRC_URI[sha256sum] = "d233b5ad4b9ee264a43fb14668f287d25f998f4b443a81b4efdfd292f1a77108"
> +SRC_URI[md5sum] = "0ab5f4d8ad6a9099202ed887358102f2"
> +SRC_URI[sha256sum] = "5a5d3361fadada16cae0c99b65eba5d49d587fc2e02b3afb058da1872871e7a9"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------0D1B4A3ADD1B39DF557DAD4C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/24/20 6:35 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200724103515.21420-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.2.1:

- Switched to getting version using importlib.metadata instead
  of using pkg_resources
- Fixed typing module compatibility issue with Python 3.5 prior
  to 3.5.4
- Relax minimum version of importlib-metadata to &gt;= 1.6.0 when
  using Python &lt; 3.8

Update the HOMEPAGE to match the home page link from pypi.org.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200724103515.21420-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-cmd2_1.1.0.bb =&gt; python3-cmd2_1.2.1.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cmd2_1.1.0.bb =&gt; python3-cmd2_1.2.1.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_1.1.0.bb b/meta-python/recipes-devtools/python/python3-cmd2_1.2.1.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-cmd2_1.1.0.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_1.2.1.bb
index bc74b5ab5..cb52ecfbb 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_1.2.1.bb
@@ -1,12 +1,12 @@
 SUMMARY = &quot;Extra features for standard library's cmd module&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://packages.python.org/cmd2/">&quot;http://packages.python.org/cmd2/&quot;</a>
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/python-cmd2/cmd2">&quot;https://github.com/python-cmd2/cmd2&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=9791cd24ca7d1807388ccd55cd066def">&quot;file://LICENSE;md5=9791cd24ca7d1807388ccd55cd066def&quot;</a>
 
 DEPENDS += &quot;${PYTHON_PN}-setuptools-scm-native&quot;
 
-SRC_URI[md5sum] = &quot;2b4a3b15ac52d239664c40c2d661b0c7&quot;
-SRC_URI[sha256sum] = &quot;d233b5ad4b9ee264a43fb14668f287d25f998f4b443a81b4efdfd292f1a77108&quot;
+SRC_URI[md5sum] = &quot;0ab5f4d8ad6a9099202ed887358102f2&quot;
+SRC_URI[sha256sum] = &quot;5a5d3361fadada16cae0c99b65eba5d49d587fc2e02b3afb058da1872871e7a9&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------0D1B4A3ADD1B39DF557DAD4C--

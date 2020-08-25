Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.62])
 by mx.groups.io with SMTP id smtpd.web11.12641.1598359464901574078
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2020 05:44:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=pObilPTy;
 spf=pass (domain: windriver.com, ip: 40.107.94.62, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y6Dqqn9lkkrKjQfwLn7ccJJMwaj03m7LRAJQRRJEwqH8LzIKez8vk6tTuCLqpBY024Fia0QamfhPYp7z167JuTmNa6lAAmcgLcjUINiwNRY68Z3bqHgjtD9quO/UO/HGj1mpErWL2t0JSJm4fT5K+FmEObXuf+O9oIHhzU1LyMF8nRS4gw0yXYibqPYpmAEc2WG7b6pE2TiKNuUcPH2PELlIe0PlFcvKUVJYqS6MGiHoDH/iRehv+DzezFHgSk002kfIGvG+TQ46U0psmMhd9TwiYXv4bmpUuTIa1YooOcKQpW2TJMGH6j3Mkvm4pV2dosLw7zCxUu/ZiG7BwdJyFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3vh7eDRxU9wPZ/WnrcURjQRJci9Ym7T2qK+braa7aO4=;
 b=D2EWNB+prQ8oejFQai/0cVYRHQAqKzIxFMk3op/jkTDsWqeSahoW3KAZkglRC8pzXdayULHKrL92CFvD0qNidUczYf21Yb9b/x3xz6opUQMCJZZ0/3vK9Moqu08b4WBfPaXTxay0h+AS7V3Z0Ph7BqXEtSmHalIXWrUVC6vTmLXEaLdzwWYQeTEBBrhnD/2xWA8OW8y/T2HnjzxmzilTX7XG1ibO+gU0xiGht11dmW7oHccuQRzPq2QboeH2bDpN4NnOdTZVGV1KOVXTAPMhBHYE8y2Nd2bHkebpVBb9XWS63RXuAT9OSTONv5wNiy3dyfQvLH9JHOHOPG2Nq66s5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3vh7eDRxU9wPZ/WnrcURjQRJci9Ym7T2qK+braa7aO4=;
 b=pObilPTyyGWiMsn3gM/XfKQGSXQxoKK2TJbkJFPZhA/kovFr9UlXcQO6n76Arg4zZXxszCd2x43j1xM5is72Qp62eCtC+eMLhZFQJ/llgjsVSAgKXBWVDV8Soe4vmSDlvWZPyVbo+hB4FJvhsDr/nTMhywNrtTvdumVeYvHM5ik=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4260.namprd11.prod.outlook.com (2603:10b6:a03:1ba::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Tue, 25 Aug
 2020 12:44:23 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3326.019; Tue, 25 Aug 2020
 12:44:23 +0000
Subject: Re: [oe] [meta-python][PATCH 3/5] python3-pint: Upgrade 0.14 -> 0.15
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200824091457.3360-1-leon.anavi@konsulko.com>
 <20200824091457.3360-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <be265e6f-0249-f1ec-e4b6-adb877bd7fb4@windriver.com>
Date: Tue, 25 Aug 2020 08:44:20 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200824091457.3360-3-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0090.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::29) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YT1PR01CA0090.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25 via Frontend Transport; Tue, 25 Aug 2020 12:44:22 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8173d89-b254-4cee-e9a6-08d848f497e7
X-MS-TrafficTypeDiagnostic: BY5PR11MB4260:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4260BB4BD9CE9F713FBAE4539F570@BY5PR11MB4260.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bKYbf5wrQ4kRMVmZAzFuUOvpi2ZT4Sg6vBFWkhVgLcHb5VvPmb9rzzCtDf3gSHjePOmv7Wpj/zK+RCCf4hayi38DSSgopH68+VFWwaWZIJmOuej9ACbwXA3GkTX37K4anfSXF8JxL7UVd2h679JS5cFix0cLYj64mqdEjYkyUZx8nu67el0ZKeY07eCfIaVy2yRrFLPtR/jWjExwBbb+iqngSBjkK+I7jnLXj4hGqNNoY7ExMGS5+cisQCAXjmBkRSg1gOVieSNGgbK0I5iKlUuZ0gf/CtADTTUM19Jl4B1QrdDaz6dHlr/1PmqxYcPQHVn6bRbX7lGT0l127o1DrPRDFxv29zmdF3zSQ4RPcMPmvOzupm+HctCPCE6ildBVfWB2u/4ipqk1pT1zwo4eotvTOoT6601A0fk/JvVcQgoAqz2fk6yQf7S7a61X9sy62hVRtCGhQbHkQ6FOrC+YMg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(376002)(39850400004)(346002)(86362001)(2616005)(956004)(53546011)(26005)(83380400001)(2906002)(8936002)(44832011)(478600001)(166002)(8676002)(36756003)(33964004)(966005)(186003)(66556008)(66476007)(52116002)(6486002)(66946007)(31696002)(5660300002)(316002)(31686004)(16576012)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	xf859tYQ1s1b3GJBi+QTeGY50y0zdWNT0F+JdLq4+KpsJ/BXP95Wo9/Dr5w4T1tmMLON9MvpJaI+02cqC0NTQRJFvmXNsqHzAGy2nmda6z52lBCMzUR++L37QRq0hBtx3+zq6qG9UFEmxAAcEimFrgAw+oMy8NwhOoJt1e+CIAFT0KoBg18X+LbHd0Xd9g1j3SBFT0nIIqkS4S96MsSByNy88zy8Kj7cRHwBBm7FD5xhV3Futopv2saPyuGTCTxSzUyhBOT+rRBvYAZ5bGjpvSCVgNYA1fZzJ5FcasQPhZMy4ILuOC8dHhdYHamhFR/vRNTewOzYwr0hif94bIsA2SkxlYYC2VKhz4d/wdNbJbolUYjiGvG8DkphOENcWi3amODZCGxf7Gml8Kb6l+LIcDVq9DLT4vNCQrCF3AYMESYPfzfF6YDUoUic4vtcDlCJeMxmTfPiVW5s0yoPIQiYAmBztwNUbIsrGf78kD/JafQ6eJAUMdnSzLpLBcm5suxoi9p5J0tyvNunLwWRseIgZdtbCaty9EqL4hyJiR9alFTtjxCrBXBnOW9RR1/Zw4hiX3F/+35C2NwWq3ox2hmg2iHGcvvcF3ip9OTnxGSALWYrNyPp5WU/h0b9yGZ7r/8G1dKt/ATrAvcSwviK2QsLRA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8173d89-b254-4cee-e9a6-08d848f497e7
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2020 12:44:23.2332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VvMvt4QBq78BthfM/b/MG109aM/Isx2RFHGGvhUVqsDvDCSw7kqqKq19Ge28lL51zSYA3OoQ+fpod9PQ6R5HvWPHMokTvydgUZyz+P9cjOM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4260
Content-Type: multipart/alternative;
 boundary="------------F3ECD6BF2E8C8A6C37AC4B9E"
Content-Language: en-US

--------------F3ECD6BF2E8C8A6C37AC4B9E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/24/20 5:14 AM, Leon Anavi wrote:
> Upgrade to release 0.15:
>
> - Change `Quantity` and `Unit` HTML (i.e., Jupyter notebook) repr
>    away from LaTeX to a simpler, more performant pretty-text and
>    table based repr inspired by Sparse and Dask.
> - Add `case_sensitive` option to registry for case (in)sensitive
>    handling when parsing units.
> - Implement Dask collection interface to support Pint Quantity
>    wrapped Dask arrays.
> - Started automatically testing examples in the documentation
> - Fixed an exception generated when reducing dimensions with three
>    or more units of the same type.
> - Fixed right operand power for dimensionless Quantity to reflect
>    numpy behavior.
> - Eliminated warning when setting a masked value on an underlying
>    MaskedArray.
> - Add `sort` option to `formatting.formatter` to permit disabling
>    sorting of component units in format string.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-pint_0.14.bb => python3-pint_0.15.bb}     | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pint_0.14.bb => python3-pint_0.15.bb} (83%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pint_0.14.bb b/meta-python/recipes-devtools/python/python3-pint_0.15.bb
> similarity index 83%
> rename from meta-python/recipes-devtools/python/python3-pint_0.14.bb
> rename to meta-python/recipes-devtools/python/python3-pint_0.15.bb
> index 333b015a9..4df5573b1 100644
> --- a/meta-python/recipes-devtools/python/python3-pint_0.14.bb
> +++ b/meta-python/recipes-devtools/python/python3-pint_0.15.bb
> @@ -10,8 +10,8 @@ PYPI_PACKAGE := "Pint"
>   
>   inherit pypi ptest setuptools3
>   
> -SRC_URI[md5sum] = "e5e409806bc82f518230117b30ae23ed"
> -SRC_URI[sha256sum] = "9aa450ebb9d722ed03fa9a450104cfd16c479b49f862d547c6f77320de597f72"
> +SRC_URI[md5sum] = "8171859d92713c13cd13ea7100a707f0"
> +SRC_URI[sha256sum] = "73b517bc4e49d199eb8ae9ed49104d74a11e596849ad2330b58c09e1eb6f327d"
>   
>   DEPENDS += "python3-setuptools-scm-native"
>   
>
> 

--------------F3ECD6BF2E8C8A6C37AC4B9E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/24/20 5:14 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200824091457.3360-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.15:

- Change `Quantity` and `Unit` HTML (i.e., Jupyter notebook) repr
  away from LaTeX to a simpler, more performant pretty-text and
  table based repr inspired by Sparse and Dask.
- Add `case_sensitive` option to registry for case (in)sensitive
  handling when parsing units.
- Implement Dask collection interface to support Pint Quantity
  wrapped Dask arrays.
- Started automatically testing examples in the documentation
- Fixed an exception generated when reducing dimensions with three
  or more units of the same type.
- Fixed right operand power for dimensionless Quantity to reflect
  numpy behavior.
- Eliminated warning when setting a masked value on an underlying
  MaskedArray.
- Add `sort` option to `formatting.formatter` to permit disabling
  sorting of component units in format string.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200824091457.3360-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-pint_0.14.bb =&gt; python3-pint_0.15.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pint_0.14.bb =&gt; python3-pint_0.15.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-pint_0.14.bb b/meta-python/recipes-devtools/python/python3-pint_0.15.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-pint_0.14.bb
rename to meta-python/recipes-devtools/python/python3-pint_0.15.bb
index 333b015a9..4df5573b1 100644
--- a/meta-python/recipes-devtools/python/python3-pint_0.14.bb
+++ b/meta-python/recipes-devtools/python/python3-pint_0.15.bb
@@ -10,8 +10,8 @@ PYPI_PACKAGE := &quot;Pint&quot;
 
 inherit pypi ptest setuptools3
 
-SRC_URI[md5sum] = &quot;e5e409806bc82f518230117b30ae23ed&quot;
-SRC_URI[sha256sum] = &quot;9aa450ebb9d722ed03fa9a450104cfd16c479b49f862d547c6f77320de597f72&quot;
+SRC_URI[md5sum] = &quot;8171859d92713c13cd13ea7100a707f0&quot;
+SRC_URI[sha256sum] = &quot;73b517bc4e49d199eb8ae9ed49104d74a11e596849ad2330b58c09e1eb6f327d&quot;
 
 DEPENDS += &quot;python3-setuptools-scm-native&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------F3ECD6BF2E8C8A6C37AC4B9E--

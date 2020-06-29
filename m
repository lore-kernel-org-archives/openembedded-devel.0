Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.73])
 by mx.groups.io with SMTP id smtpd.web10.20539.1593442327423879423
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jun 2020 07:52:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=U6et+njt;
 spf=pass (domain: windriver.com, ip: 40.107.92.73, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=In4otq5/6lj/240GpppcJjag003ZjQqvYl6CiQFWTbnrNMAtjmyaY9863spTfDcCVoLuplQLw4TnhUJWlHfNLnOVdtBZZu6ihoQUK4vFTTTKY1+l97mT8lw4qZfzx8pGuhl7psxiFwSVGOlXwBcQrIIIyqwXmBF2jiiXDBIdTK07ZRFNBG8393eZX6nBHXTfK1Md8nUIl8boCe2mEYQzuHXgoTOnbY9I4yJ0FPhJ0OUmyU0uXaHsSU8K8sWRGR/dnf48BbcAhSXs3GU6e/j2V8W2S0TrlzTSDn4XIee4zw+XIbDq7SNFf7zNHRBBxnm965sHDpPQ8n41UxVXDTky2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2rqIq8NQIvsLs8LMA2H0PXhWV9obLOEnyF8p6GCl+9U=;
 b=hWW8/gEPW+KhRon8M1s1WyxdulwE3LvDWZKlHcnwMQzJkIc4uUdm49Wi/CjaBxwSifE9TKotoOV0Nqw6xaTjlbSWq+gREqXB5MPkqQY2GO5wP4xbuLk9kwm3ZECzRvzSHt9Fngb6ooA/DdhBd1e62UVXtD2E1aOzuKm4z04H4Exel7kea//fOscnuUV29hXGenn/De1GE5VN3vcTqfswNxedGR+GdRu7kePDra/RcxHx+3HbD+LGoIqPezWB6oMNmNth1pWZkDAjgxBZcivTJOMa8RRAVTciGsHAlRIxfnE7ZsNPnq/ByQNQT5euxfMozCs2STk0WfOnFDbR3qwtHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2rqIq8NQIvsLs8LMA2H0PXhWV9obLOEnyF8p6GCl+9U=;
 b=U6et+njtxsmnL+iRwAI7t4/QG87nosf82YPwn4+5Xp8AVlTwUFPZHxGaR+Ansa1ARxQo/+mxBLGnf+HmT2/iF8n2cAFFwaRjwQKlS/snNlADkmFgVojPjB/AFR8VTu1U12ScZyfcbsgkJkf4OKZWb/RkJTcMFZZ+EIwiRwQ1emc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1988.namprd11.prod.outlook.com (2603:10b6:404:48::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.25; Mon, 29 Jun
 2020 14:52:06 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3131.026; Mon, 29 Jun 2020
 14:52:06 +0000
Subject: Re: [oe] [meta-python][PATCH 08/12] python3-pkgconfig: Upgrade 1.4.0 -> 1.5.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200626112944.25569-1-leon.anavi@konsulko.com>
 <20200626112944.25569-8-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <f86bd24c-4585-ac84-bca4-44527f7be6d9@windriver.com>
Date: Mon, 29 Jun 2020 10:52:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200626112944.25569-8-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0050.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::27) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTXPR0101CA0050.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20 via Frontend Transport; Mon, 29 Jun 2020 14:52:05 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 593ff465-d2ed-43ed-94fb-08d81c3bfdb8
X-MS-TrafficTypeDiagnostic: BN6PR11MB1988:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB1988B2882DA858042B687FBF9F6E0@BN6PR11MB1988.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:619;
X-Forefront-PRVS: 044968D9E1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Tng7xXeeQjWZ9AhkD7bAMTxIWshTs52wM4bZIMK4928H1QaAxa4z+MwGKYyZB6Ykvgd26essqcOx+RigV54g1M2G4BmanilxzyVzP9gZG06WuBPhSLb/8Y/9bl5T2vJS9CXFCBi0N84VEpCWcUOrOcL2Luqa/hQwf8l+4iCC5hDuDmmRqZJJCExKYGgmewGvKS+9eDiyNzbBtNQZQfXegAC8IHk3Ckawhw5vZDyu4jdpcw5+PSDGczCO0Vv00D/wtQeo941WKSBCtmt+r9tdNkWOU2j8B71D/iCUzDLKpDyk2hAktjVzjvrrc27Hwlc6us3Js2ZQ3WgS6NQ4mtDPeE7rdtDOGYSPmB170hD13wKyIgUn6DyGkAeZxKzNn8/r5EsWyMZoAKwKxAvMAw3vmBJekp2TQJUPRxK/kbA79/Wt6paHlXIOQF+t2aNJnPCRmRh37Sn5r1hT8FCPNh6i2w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(396003)(366004)(136003)(346002)(376002)(36756003)(16526019)(966005)(5660300002)(478600001)(2906002)(83380400001)(8936002)(8676002)(86362001)(31686004)(316002)(16576012)(166002)(6486002)(26005)(52116002)(186003)(33964004)(53546011)(66556008)(66946007)(66476007)(956004)(31696002)(2616005)(44832011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	VxFiKsphtnkTZACQWY4spbTlPQSkRPUe49d2whxqvwhTgluFeYz47DgtHseOaE3MCh8rnd2spsYm/AqcuVyRQMhr3RBGxHlgRd4uTV8vTCZEVhgX6+doqPVP/z87k1vF5uAIdo2NTLechsYNBvu5d+TG9ZSbgo5x9YKRSTGX6x4i5KzD6y4KdvjafwdSBdzylvyMPwZY72PMexD0hY7CkiDmgZtcAIvrXuIX1mVNsLFyP2Yt3EuOc+10cvY7/ogD+2gUS3BLn3F3J/qPzsDgMBOKxR0tgYYm/a+kVsOtgHt6I/nySuaJsgqEVcSrBbBCKNW4kaYCFYy3W8LMotFDV33qBsY7U7/SJwkrNO/b5/39ZMcRn3lGwrvTb4jgUPUOl4ycYCKSCsVyrrySeYZKlCoQayufgG7y4/ds1GmnY9EHdsparfBLzOEUNwJD0zQy+R2pXPGntQPUxzB808hygLnIlOecBvot3JyL4KqDxOI=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 593ff465-d2ed-43ed-94fb-08d81c3bfdb8
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB0003.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2020 14:52:06.2053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r7KQRLkLhD/q8AJWzV04dTR6tql+LEZ0FQbDNI0t6tQKib6Hl4FnyGBbJrY5/JVEkxlhr18c54JU5JkooOGAY4xZU4gjU0sPqn/PIhglgEY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1988
Content-Type: multipart/alternative;
 boundary="------------EDCD2EACA5069D3B63F58002"
Content-Language: en-US

--------------EDCD2EACA5069D3B63F58002
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/26/20 7:29 AM, Leon Anavi wrote:
> Inherit class pypi and upgrade to release 1.5.1:
>
> - Use poetry instead of setuptools directly
> - Fix: raise exception if package is missing
> - Fix version parsing for openssl-like version numbers
> - Fix: expose --modversion
> - Fix: strip whitespace from variable names
> - Fix: do not specify pytest Python version
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...hon3-pkgconfig_1.4.0.bb => python3-pkgconfig_1.5.1.bb} | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pkgconfig_1.4.0.bb => python3-pkgconfig_1.5.1.bb} (68%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pkgconfig_1.4.0.bb b/meta-python/recipes-devtools/python/python3-pkgconfig_1.5.1.bb
> similarity index 68%
> rename from meta-python/recipes-devtools/python/python3-pkgconfig_1.4.0.bb
> rename to meta-python/recipes-devtools/python/python3-pkgconfig_1.5.1.bb
> index fc7a47a43..05ca3beec 100644
> --- a/meta-python/recipes-devtools/python/python3-pkgconfig_1.4.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pkgconfig_1.5.1.bb
> @@ -4,16 +4,14 @@ SECTION = "devel/python"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=faa7f82be8f220bff6156be4790344fc"
>   
> -SRC_URI = "git://github.com/matze/pkgconfig.git"
> -SRCREV ?= "8af0102346847e8873af8e76ab3f34ba9da806e2"
> +SRC_URI[md5sum] = "9f9cdb224ec0a1e59efcc7cac4b91972"
> +SRC_URI[sha256sum] = "97bfe3d981bab675d5ea3ef259045d7919c93897db7d3b59d4e8593cba8d354f"
>   
>   RDEPENDS_${PN} = "pkgconfig \
>                    ${PYTHON_PN}-shell \
>                    "
>   
> -inherit setuptools3
> -
> -S = "${WORKDIR}/git"
> +inherit pypi setuptools3
>   
>   BBCLASSEXTEND = "native"
>   
>
> 

--------------EDCD2EACA5069D3B63F58002
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/26/20 7:29 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200626112944.25569-8-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Inherit class pypi and upgrade to release 1.5.1:

- Use poetry instead of setuptools directly
- Fix: raise exception if package is missing
- Fix version parsing for openssl-like version numbers
- Fix: expose --modversion
- Fix: strip whitespace from variable names
- Fix: do not specify pytest Python version

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200626112944.25569-8-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...hon3-pkgconfig_1.4.0.bb =&gt; python3-pkgconfig_1.5.1.bb} | 8 &#43;&#43;&#43;-----
 1 file changed, 3 insertions(&#43;), 5 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pkgconfig_1.4.0.bb =&gt; python3-pkgconfig_1.5.1.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-pkgconfig_1.4.0.bb b/meta-python/recipes-devtools/python/python3-pkgconfig_1.5.1.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-pkgconfig_1.4.0.bb
rename to meta-python/recipes-devtools/python/python3-pkgconfig_1.5.1.bb
index fc7a47a43..05ca3beec 100644
--- a/meta-python/recipes-devtools/python/python3-pkgconfig_1.4.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-pkgconfig_1.5.1.bb
@@ -4,16 &#43;4,14 @@ SECTION = &quot;devel/python&quot;
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=faa7f82be8f220bff6156be4790344fc">&quot;file://LICENSE;md5=faa7f82be8f220bff6156be4790344fc&quot;</a>
 
-SRC_URI = &quot;git://github.com/matze/pkgconfig.git&quot;
-SRCREV ?= &quot;8af0102346847e8873af8e76ab3f34ba9da806e2&quot;
&#43;SRC_URI[md5sum] = &quot;9f9cdb224ec0a1e59efcc7cac4b91972&quot;
&#43;SRC_URI[sha256sum] = &quot;97bfe3d981bab675d5ea3ef259045d7919c93897db7d3b59d4e8593cba8d354f&quot;
 
 RDEPENDS_${PN} = &quot;pkgconfig \
                  ${PYTHON_PN}-shell \
                  &quot;
 
-inherit setuptools3
-
-S = &quot;${WORKDIR}/git&quot;
&#43;inherit pypi setuptools3
 
 BBCLASSEXTEND = &quot;native&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------EDCD2EACA5069D3B63F58002--

Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.71])
 by mx.groups.io with SMTP id smtpd.web10.7123.1592399277328074166
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jun 2020 06:07:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=eozOSJJu;
 spf=pass (domain: windriver.com, ip: 40.107.92.71, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TPbWQazXb0w/HsstTCrtdNBMK7wG2vfuAYlwG6KF0/mEE2rcxXKgBt+AY1tEiR5GOgpcjfCjMngzPvILTRhhjvaAszkduJBSJkZVDZUWB+8OFdR6rmYDwNaDF3AC9+CFSxQG8OX5SVqRPdzEaZuQN8l5B/H4HUtHv068XdH/L9Hnk5S79jIfezxXDFuLWqiJWdA+quvKkUcSLjwqdVU0J/hTGFa8+VkS6BDRYGieL6jieYh368v7X8tlHfRWSqZ4Zj2PKvMLSaQtaV2UmjFF9za+qwgeDhIfDjk6bK8rZnQTO8BQMLQxvfc1YvsZ1JvafQzckMMCKHMA2gcMJKqz0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SetMi9dScg9rHUXSClmXeEs/GCIAakSN7k1q9MFxKhI=;
 b=HMlmLKxihHnq+DE4Jj6OGvab+/+Tjg1uvDGKTJSVieH4YfF9iI9ss6zrPdZESVtgYps290SK35NwPD6hrEaKwrk2VohOtiZPtM+LF/VBIgjk9DlAXQROvHkJC49rMMRier6kFUi3vEPX0pOyN9y3Cyfvh/G9+Kh8nrJs9PCZkKN8G0rHwjoR1HkU2zCNzcS1Z4b3YGp6MhGyM2koaA+6utjsWPr7mp3uJAJ+n/niI02Gqcc4XvU04ayjzwptuOll2o6oPtCMB29MgRljnCMWGlhv0oARme1OnQa7hw6WzWpHcLqDqoZKQqDWvhS0/CuxrYQOwM/miU4XueDNb5OoLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SetMi9dScg9rHUXSClmXeEs/GCIAakSN7k1q9MFxKhI=;
 b=eozOSJJuFEDcqiuPdxTIGMzXJzp1N1D8x09ncxKf1TcULhbbSxP9wKNssyq4Q+9B3wyTnc3jTH52cMxgyA0w1F56eLE2jDY3cD/APNnufDE23sl24KOX9VMxjKFbmsq+1clvsdBpNWO40uAdb1ofYkxZF00RlXjRU/86ccgT12k=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB3875.namprd11.prod.outlook.com (2603:10b6:405:80::37) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.21; Wed, 17 Jun
 2020 13:07:56 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.021; Wed, 17 Jun 2020
 13:07:55 +0000
Subject: Re: [oe] [meta-python][PATCH 3/7] python3-incremental: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200615103017.2714-1-leon.anavi@konsulko.com>
 <20200615103017.2714-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <8a181d20-81b3-b4af-d1f8-b6d75d7c3295@windriver.com>
Date: Wed, 17 Jun 2020 09:07:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200615103017.2714-3-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTOPR0101CA0016.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::29) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTOPR0101CA0016.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend Transport; Wed, 17 Jun 2020 13:07:55 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f338d07c-0d23-4e3b-eb08-08d812bf735b
X-MS-TrafficTypeDiagnostic: BN6PR11MB3875:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB387598B33E2A3E2C25B92D9A9F9A0@BN6PR11MB3875.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:923;
X-Forefront-PRVS: 04371797A5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	m0bZOq/RgTVBgZ7K1YM4/3YjWaOknbGkAQHGfu6RGzFuXH/AxTwjD9mO9n2Gq0+JkjxXMP8H2KoM5z7a596UpXVPbbb4TESInKWmcB44YXK/kiGRFm/rTT7tpPMZ90Dya4ZRkeUKen2CtcQEbHKGyZa6IqAcgxU5X/Y9OZttDLl0sNLfIzLnTnFyjGjdJ82EMQPHXoTifb7KBRI2lJ1Z0rFKmrFHSkojsmvBC3D0Voyn7RKobfR/YJ1+OgbaM66NKinSLqiSHABkH3FGhbu+lfPs/C+nywuyqhMRA00riuez0SDgdRjWoCIBdYxpCCl6dbbeAP9N+OWYZaYKmivIhaatXJBUv1ppAV2V1eHQjx8KYdclypk4pBa2cZEpajulpFrZ5E/bcUEAorhJAGTr/8U6K9D0mAVjdGzUmbb+s7z3SiK2FKPbT/Cy7Ghufqh/e2RH41ouNbCutSJTMIPI2Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39840400004)(136003)(396003)(366004)(376002)(346002)(83380400001)(2906002)(966005)(36756003)(44832011)(31686004)(2616005)(956004)(5660300002)(52116002)(66946007)(31696002)(16526019)(186003)(316002)(53546011)(66476007)(166002)(6486002)(478600001)(8676002)(16576012)(26005)(8936002)(66556008)(33964004)(86362001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	GBgTGw2t61lNBKn3bLrHRXJx9I7vgEq/korqIvJqP9gCHC1I1qh+6Q4CyZV2p4cxv6OHEr3FQibUQ/gRhcI5DF+4DgzKyp6Bl9ksA4QjlqhBJGIJRy2aIZu+NZ4GawYh41yyfudVbvM7yfKXEP+cOjxBqmr178BR24EInW8l1/it+McMWKXAzn9t+0OW6Q2Iv+4wWQXGem3JPz5Dj3AOY5rlkThkiYD31qD3tq3R3J792i+Hm9DuNZmed0wS01QVS/6TUBWbJfPqJ/7G0SG/hLhmvClEOmZTrernW/spv3tqPSYo50gflwGAztccX1nH5df5iIqOkGzDdck50Ed33oXRjfMfQcE9zpQTOl2LuWfR4D/5DBQeIxvVFi38tuizG4HBK8ZTBgJvMd2j7JvMYnMVncjp2LiQhFeiaPhzJ+gomX2q+3jrA4/vVYg/R03TQ28/nOzwS8H26tJ/XTgg7oMlhb/YFmKkKycOPG4NIaThnRWSbG2hnVvZivjdt+di
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f338d07c-0d23-4e3b-eb08-08d812bf735b
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2020 13:07:55.8827
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YFVHxAX8XS2sCF1NtGTALKdsJK156C8X48fD+KigPNp855Se7xc+mVcjrSaeAHdJy2KHwTgC9so0aLlVAhGqUwu7zL9KOB5lXxlsIlNbVt8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3875
Content-Type: multipart/alternative;
 boundary="------------443D733BA74E5820609533E5"
Content-Language: en-US

--------------443D733BA74E5820609533E5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/15/20 6:30 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python-incremental.inc             | 20 -----------------
>   .../python/python3-incremental_17.5.0.bb      | 22 +++++++++++++++++--
>   2 files changed, 20 insertions(+), 22 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-incremental.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-incremental.inc b/meta-python/recipes-devtools/python/python-incremental.inc
> deleted file mode 100644
> index ef5e903fb..000000000
> --- a/meta-python/recipes-devtools/python/python-incremental.inc
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -DESCRIPTION = "Incremental is a small library that versions your Python projects"
> -HOMEPAGE = "https://github.com/twisted/incremental"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=6ca9b07f08e2c72d48c74d363d1e0e15"
> -
> -SRC_URI[md5sum] = "602746e0d438e075a5a9e0678140bba2"
> -SRC_URI[sha256sum] = "7b751696aaf36eebfab537e458929e194460051ccad279c72b755a167eebd4b3"
> -
> -inherit pypi
> -
> -RDEPENDS_${PN} += " \
> -    ${PYTHON_PN}-twisted \
> -    ${PYTHON_PN}-click \
> -"
> -
> -# -native is needed to build python[3]-twisted, however, we need to take steps to
> -# prevent a circular dependency. The build apparently does not use the part of
> -# python-incremental which uses python-twisted, so this hack is OK.
> -RDEPENDS_${PYTHON_PN}-incremental-native_remove = "${PYTHON_PN}-twisted-native"
> -BBCLASSEXTEND = "native"
> diff --git a/meta-python/recipes-devtools/python/python3-incremental_17.5.0.bb b/meta-python/recipes-devtools/python/python3-incremental_17.5.0.bb
> index 0f04df4a6..568ba1989 100644
> --- a/meta-python/recipes-devtools/python/python3-incremental_17.5.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-incremental_17.5.0.bb
> @@ -1,2 +1,20 @@
> -inherit setuptools3
> -require python-incremental.inc
> +DESCRIPTION = "Incremental is a small library that versions your Python projects"
> +HOMEPAGE = "https://github.com/twisted/incremental"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=6ca9b07f08e2c72d48c74d363d1e0e15"
> +
> +SRC_URI[md5sum] = "602746e0d438e075a5a9e0678140bba2"
> +SRC_URI[sha256sum] = "7b751696aaf36eebfab537e458929e194460051ccad279c72b755a167eebd4b3"
> +
> +inherit pypi setuptools3
> +
> +RDEPENDS_${PN} += " \
> +    ${PYTHON_PN}-twisted \
> +    ${PYTHON_PN}-click \
> +"
> +
> +# -native is needed to build python[3]-twisted, however, we need to take steps to
> +# prevent a circular dependency. The build apparently does not use the part of
> +# python-incremental which uses python-twisted, so this hack is OK.
> +RDEPENDS_${PYTHON_PN}-incremental-native_remove = "${PYTHON_PN}-twisted-native"
> +BBCLASSEXTEND = "native"
>
> 

--------------443D733BA74E5820609533E5
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/15/20 6:30 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200615103017.2714-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200615103017.2714-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python-incremental.inc             | 20 -----------------
 .../python/python3-incremental_17.5.0.bb      | 22 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;--
 2 files changed, 20 insertions(&#43;), 22 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-incremental.inc

diff --git a/meta-python/recipes-devtools/python/python-incremental.inc b/meta-python/recipes-devtools/python/python-incremental.inc
deleted file mode 100644
index ef5e903fb..000000000
--- a/meta-python/recipes-devtools/python/python-incremental.inc
&#43;&#43;&#43; /dev/null
@@ -1,20 &#43;0,0 @@
-DESCRIPTION = &quot;Incremental is a small library that versions your Python projects&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/twisted/incremental">&quot;https://github.com/twisted/incremental&quot;</a>
-LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=6ca9b07f08e2c72d48c74d363d1e0e15">&quot;file://LICENSE;md5=6ca9b07f08e2c72d48c74d363d1e0e15&quot;</a>
-
-SRC_URI[md5sum] = &quot;602746e0d438e075a5a9e0678140bba2&quot;
-SRC_URI[sha256sum] = &quot;7b751696aaf36eebfab537e458929e194460051ccad279c72b755a167eebd4b3&quot;
-
-inherit pypi
-
-RDEPENDS_${PN} &#43;= &quot; \
-    ${PYTHON_PN}-twisted \
-    ${PYTHON_PN}-click \
-&quot;
-
-# -native is needed to build python[3]-twisted, however, we need to take steps to
-# prevent a circular dependency. The build apparently does not use the part of
-# python-incremental which uses python-twisted, so this hack is OK.
-RDEPENDS_${PYTHON_PN}-incremental-native_remove = &quot;${PYTHON_PN}-twisted-native&quot;
-BBCLASSEXTEND = &quot;native<a class="moz-txt-link-rfc2396E" href="mailto:diff--gita/meta-python/recipes-devtools/python/python3-incremental_17.5.0.bbb/meta-python/recipes-devtools/python/python3-incremental_17.5.0.bbindex0f04df4a6..568ba1989100644---a/meta-python/recipes-devtools/python/python3-incremental_17.5.0.bb&#43;&#43;&#43;b/meta-python/recipes-devtools/python/python3-incremental_17.5.0.bb@@-1,2&#43;1,20@@-inheritsetuptools3-requirepython-incremental.inc&#43;DESCRIPTION=">&quot;
diff --git a/meta-python/recipes-devtools/python/python3-incremental_17.5.0.bb b/meta-python/recipes-devtools/python/python3-incremental_17.5.0.bb
index 0f04df4a6..568ba1989 100644
--- a/meta-python/recipes-devtools/python/python3-incremental_17.5.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-incremental_17.5.0.bb
@@ -1,2 &#43;1,20 @@
-inherit setuptools3
-require python-incremental.inc
&#43;DESCRIPTION = &quot;</a>Incremental is a small library that versions your Python projects&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/twisted/incremental">&quot;https://github.com/twisted/incremental&quot;</a>
&#43;LICENSE = &quot;MIT&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=6ca9b07f08e2c72d48c74d363d1e0e15">&quot;file://LICENSE;md5=6ca9b07f08e2c72d48c74d363d1e0e15&quot;</a>
&#43;
&#43;SRC_URI[md5sum] = &quot;602746e0d438e075a5a9e0678140bba2&quot;
&#43;SRC_URI[sha256sum] = &quot;7b751696aaf36eebfab537e458929e194460051ccad279c72b755a167eebd4b3&quot;
&#43;
&#43;inherit pypi setuptools3
&#43;
&#43;RDEPENDS_${PN} &#43;= &quot; \
&#43;    ${PYTHON_PN}-twisted \
&#43;    ${PYTHON_PN}-click \
&#43;&quot;
&#43;
&#43;# -native is needed to build python[3]-twisted, however, we need to take steps to
&#43;# prevent a circular dependency. The build apparently does not use the part of
&#43;# python-incremental which uses python-twisted, so this hack is OK.
&#43;RDEPENDS_${PYTHON_PN}-incremental-native_remove = &quot;${PYTHON_PN}-twisted-native&quot;
&#43;BBCLASSEXTEND = &quot;native&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------443D733BA74E5820609533E5--

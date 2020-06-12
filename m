Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.83])
 by mx.groups.io with SMTP id smtpd.web10.21371.1591972838852597758
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2020 07:40:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=U6e80De1;
 spf=pass (domain: windriver.com, ip: 40.107.93.83, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IjtpWrsgdGm7X7IIXwN9Vo1nD8d48lowSMLuQYgTlXPtqpxqb1GGPu+VuwTQvc94EA7MSYkHrkTvWMhnICQCkmZ6x2iWJjuvwLngZ/fpQjT7zwkreVrrt8x9xXYv+FahfQpyY1TeWf/BP5ITwcs/3bOlvnlZ65FkauksjguZubnB2VdABx888rWDuy8JiCoAtkaunIt99k428MeIy6naDcTrws9WRY8Jjq0HIBdWj5c/Pmfv+80RHpsZFXV7KyIy94YcxvWhQNbzTDBO0M7s2NHirDhJJwFnE1tBAXWVQujK6whopeZuKIbrY1G4p+LHLIUVnkl4T0T9I6JniQA7gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R3NTWTV0VOVpW84XF7foShniqmkQwZg6zVx0p3qHOT8=;
 b=CvSK2c6/p0zOaqWJ5I366Oi+SEKJIDr1ngi5WiWG+jHdla6783sUZL/gX5Qi8HMxxtRLg/CPrI0SF/mBYfq02F2fGhvTeO/xkv/8JgJ7UQWJf9CTB+wICblz6c58S+hgQszK7fiaCX330q8idxq0WT/agimH7QlZN0kCHuUqmwbHN7JJFcHhsEY0+mDWObI/Tfsa2wykx9xF1E5RauzVWHU3VqQy9khPJtHH2A/ZNCmQkKPcJ4zY/JrnjdbzwmwXpMJ7rjXjube5YVk9aV+GjYAM/g6RVIEBx7o0+WGYDRpedQ0925d3JpyRbk032fkeL4lICHaKbpIZQsP9FATNIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R3NTWTV0VOVpW84XF7foShniqmkQwZg6zVx0p3qHOT8=;
 b=U6e80De12uuzHv9+mEoNOVucbRDf0ARiGPvcH7OnEAtD+r1M4uN3DbJKnYIkXKGla6ZoO4AdrJm4ju/4iAwRIUrRNcO8STw66oniE0TdYWmAHsmUVmaXloIbWKmgOChw982ql3L7yZ+XQ3oKRFJUxh577DeVnFNEz2xnUP0EYQY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1233.namprd11.prod.outlook.com (2603:10b6:404:44::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18; Fri, 12 Jun
 2020 14:40:37 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3088.021; Fri, 12 Jun 2020
 14:40:37 +0000
Subject: Re: [oe] [meta-python][PATCH 1/4] python3-packaging: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200612094757.22146-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <3ac255c4-7b4a-9ec4-2c39-b84ace1e5db3@windriver.com>
Date: Fri, 12 Jun 2020 10:40:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200612094757.22146-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0107.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::16) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0107.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.21 via Frontend Transport; Fri, 12 Jun 2020 14:40:37 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28f42b5a-4faa-4350-25fb-08d80ede9268
X-MS-TrafficTypeDiagnostic: BN6PR11MB1233:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB123317FCC2397BB76FEA36349F810@BN6PR11MB1233.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:207;
X-Forefront-PRVS: 0432A04947
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7bv7fqIMT/hvDjUjb3t3TA91stTO3tYzvXZdsQzoMMSnAuSMQHkKYzzowuZ8y44hpuAKFJjTdxbiiBaiUIX3ETWF1orWcWmfMWtDQWEcWjcqSvyRLiuath3SjDNTtptr9xfGAOdY1nysP9R+Ka0Av1rYTt3Q1kyCiQ/04vBd9Xj+ydLzt3hN0xUvPVeN9eYoFk5X5gy213Imt7Q9SiHZSEucLi+mKtnl9OAGlI1AVOTwYAc5t3iu7N5kFtaRGWVt2o6GqJn/NuyxbI2CBZgyRTuHbCfnqXgJF2576TCVqvHQphJEiQ56KpeO4SZ9TtuGPyInLxSIXRJNzV9nvlSywzrbf3S3Qxj8zLp00yQCwsj7OJUlAz8zKwSI1UaZ8nOUHrEyQyMwoCvOIvMeB+qHN4UFfeG0PQUhjh+vlaFvWFSBUZvjkwYFpgSnzrPBTf355UVryNYpd5DlFXhVV3NhQA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(39850400004)(346002)(396003)(376002)(366004)(6486002)(66946007)(31686004)(66476007)(66556008)(478600001)(16576012)(2906002)(966005)(316002)(36756003)(16526019)(5660300002)(83380400001)(53546011)(33964004)(26005)(186003)(31696002)(86362001)(8936002)(8676002)(2616005)(166002)(52116002)(44832011)(956004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	obPV0EnXmufNMIoxAI6u3iXYB0fFrC0Ggvomfk/AVBVylDQEccNHi28ImUiLqBmpCvyGDh7UjB5QAINa7eRy+N3+E8hR2MwsVdY43xNc1jLqcbEO0v1eeXYVvgGxJ9UA1d6Hmcu0ZGI2dFchT/W/Ix9VCrlutaBlx8a8bWpAYDXs5TQv1HoP/RAH5XX7aJLm87AcnUf2SRM91HrHLkUbfvlfhuOba+mvtnv6be66IDHBSA92XrB/zHHR27E08Yho0QT9/YxbniwJMtqyB/DKEaB98pllgXr2xwy+KbRBzFaTA2+OMaMlLrr1BE2hcAqnoUCpsPN0JCO/B4NyjwdaeEI2XfvsXFUPNz6Q1MWftYJ9PVepXhY/bzcEABlzDdtTd+9Aq9HPkhf9wRiOQYjWJhWHiHbWAgXyIHQjV5WEvOSrkqX9Loyy26Ku+MXN1I+LSOVtb6HFeYo1h/jYvnrK2GZHOVvIi4XymRuiUuiwFiFne2+z0/hZ2JfuQZUji+7K
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28f42b5a-4faa-4350-25fb-08d80ede9268
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2020 14:40:37.6931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dusclAIsDPiIuxMJDWlTb51PIZjLmRBihzAwvEFQYSa4/B261hNalQW93EIuBzkKmxrDWZ+YQmAC387/zFKJRo7vjRijQPqOwG/fRX83Z6M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1233
Content-Type: multipart/alternative;
 boundary="------------DE526AF5128DE56883680E77"
Content-Language: en-US

--------------DE526AF5128DE56883680E77
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/12/20 5:47 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python-packaging.inc     | 10 ----------
>   .../python/python3-packaging_20.3.bb                 | 12 +++++++++++-
>   2 files changed, 11 insertions(+), 11 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-packaging.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-packaging.inc b/meta-python/recipes-devtools/python/python-packaging.inc
> deleted file mode 100644
> index 418483f4e..000000000
> --- a/meta-python/recipes-devtools/python/python-packaging.inc
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -DESCRIPTION = "Core utilities for Python packages"
> -HOMEPAGE = "https://github.com/pypa/packaging"
> -LICENSE = "Apache-2.0 & BSD"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=faadaedca9251a90b205c9167578ce91"
> -
> -SRC_URI[md5sum] = "19e0d1f82a9007b448650ccfeffd0a26"
> -SRC_URI[sha256sum] = "3c292b474fda1671ec57d46d739d072bfd495a4f51ad01a055121d81e952b7a3"
> -
> -DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
> -RDEPENDS_${PN} += "${PYTHON_PN}-six ${PYTHON_PN}-pyparsing"
> diff --git a/meta-python/recipes-devtools/python/python3-packaging_20.3.bb b/meta-python/recipes-devtools/python/python3-packaging_20.3.bb
> index aa20fb26f..9eee84b1b 100644
> --- a/meta-python/recipes-devtools/python/python3-packaging_20.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-packaging_20.3.bb
> @@ -1,2 +1,12 @@
> +DESCRIPTION = "Core utilities for Python packages"
> +HOMEPAGE = "https://github.com/pypa/packaging"
> +LICENSE = "Apache-2.0 & BSD"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=faadaedca9251a90b205c9167578ce91"
> +
> +SRC_URI[md5sum] = "19e0d1f82a9007b448650ccfeffd0a26"
> +SRC_URI[sha256sum] = "3c292b474fda1671ec57d46d739d072bfd495a4f51ad01a055121d81e952b7a3"
> +
>   inherit pypi setuptools3
> -require python-packaging.inc
> +
> +DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
> +RDEPENDS_${PN} += "${PYTHON_PN}-six ${PYTHON_PN}-pyparsing"
>
> 

--------------DE526AF5128DE56883680E77
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/12/20 5:47 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200612094757.22146-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200612094757.22146-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python-packaging.inc     | 10 ----------
 .../python/python3-packaging_20.3.bb                 | 12 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-
 2 files changed, 11 insertions(&#43;), 11 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-packaging.inc

diff --git a/meta-python/recipes-devtools/python/python-packaging.inc b/meta-python/recipes-devtools/python/python-packaging.inc
deleted file mode 100644
index 418483f4e..000000000
--- a/meta-python/recipes-devtools/python/python-packaging.inc
&#43;&#43;&#43; /dev/null
@@ -1,10 &#43;0,0 @@
-DESCRIPTION = &quot;Core utilities for Python packages&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/pypa/packaging">&quot;https://github.com/pypa/packaging&quot;</a>
-LICENSE = &quot;Apache-2.0 &amp; BSD&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=faadaedca9251a90b205c9167578ce91">&quot;file://LICENSE;md5=faadaedca9251a90b205c9167578ce91&quot;</a>
-
-SRC_URI[md5sum] = &quot;19e0d1f82a9007b448650ccfeffd0a26&quot;
-SRC_URI[sha256sum] = &quot;3c292b474fda1671ec57d46d739d072bfd495a4f51ad01a055121d81e952b7a3&quot;
-
-DEPENDS &#43;= &quot;${PYTHON_PN}-setuptools-scm-native&quot;
-RDEPENDS_${PN} &#43;= &quot;${PYTHON_PN}-six ${PYTHON_PN}-pyparsing&quot;
diff --git a/meta-python/recipes-devtools/python/python3-packaging_20.3.bb b/meta-python/recipes-devtools/python/python3-packaging_20.3.bb
index aa20fb26f..9eee84b1b 100644
--- a/meta-python/recipes-devtools/python/python3-packaging_20.3.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-packaging_20.3.bb
@@ -1,2 &#43;1,12 @@
&#43;DESCRIPTION = &quot;Core utilities for Python packages&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/pypa/packaging">&quot;https://github.com/pypa/packaging&quot;</a>
&#43;LICENSE = &quot;Apache-2.0 &amp; BSD&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=faadaedca9251a90b205c9167578ce91">&quot;file://LICENSE;md5=faadaedca9251a90b205c9167578ce91&quot;</a>
&#43;
&#43;SRC_URI[md5sum] = &quot;19e0d1f82a9007b448650ccfeffd0a26&quot;
&#43;SRC_URI[sha256sum] = &quot;3c292b474fda1671ec57d46d739d072bfd495a4f51ad01a055121d81e952b7a3&quot;
&#43;
 inherit pypi setuptools3
-require python-packaging.inc
&#43;
&#43;DEPENDS &#43;= &quot;${PYTHON_PN}-setuptools-scm-native&quot;
&#43;RDEPENDS_${PN} &#43;= &quot;${PYTHON_PN}-six ${PYTHON_PN}-pyparsing&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------DE526AF5128DE56883680E77--

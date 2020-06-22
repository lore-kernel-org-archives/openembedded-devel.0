Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.53])
 by mx.groups.io with SMTP id smtpd.web10.17528.1592833556772447457
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jun 2020 06:45:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=OjL2X3Fy;
 spf=pass (domain: windriver.com, ip: 40.107.92.53, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KypwzLGdEFy4VRiMGPELURBMgtFxUMXbllCNk3yEqCBvF/0pbi4SgfpMsGd2ZJHlQe5AyS9cKPzX8lMkpyDhyA2r5jEOrhvT85uCJibQtVN8yTPJ2sml+z56K4FIM2jgPkpQ89ySJmJuDFqEXKSa/FNSdsB7nB0bPWBOh5GDXggfsUB7I02QFOM5kUtKktBAnWrP5TBP9tmyeZGmK76POwjOAeLCgQfqCJKMNjl4/8chNIiOZJtgPcIni/tRkJ2A8qawK45j2VnwdeMVIE+x2ozxUJ+jMeK0CwRNw91/rwYlnFDnhCroXJwbYJnEbtOl/I9Lx+6rS+ZEgpbKSg/pkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=evso//+Ip/0EgZjNSXICIkHyRd0lb8rc9XoMzyceNFw=;
 b=gc35boXPxwjRwD4Dpqt5utxnADKrXhF4OGf/pg9JyaXNRd4aiL36ERnTxvrbiuUPA+3xm5m3xuct1Ew3MmQPcoj+YEkVBMvFZ248mFDP1VDNIblPWm1Y5sCEBlqjXrLYavBUyGZnvvgh7sOT8Ge17ufnSS0mzRYsKTrOgBb6EgphrGLsjFp0V3XPU2cdJjxZM56+2014c7RJyI4Kejc+lF0ybE/42IPY+yy70K62XlF73RNwe/kghZGIG6nB9Ez1gntnH3Jt9b8fogzEyW9k5UGtnwQZIHROkC3ZgRw97M9gsauhUZM1A64Zz2YEm3T0v4pmZ4lrsTUYu3X2D4MJ1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=evso//+Ip/0EgZjNSXICIkHyRd0lb8rc9XoMzyceNFw=;
 b=OjL2X3FyWYijb/xXW7nPaqM0OiBsBFQTfmbr/Z6X1tgsEMCjRzpulUFZPLNiBiIGIm0MnWiCnVXeMxMzNj6rPHVZbYGq+OsOkpTdkABzH9kmx/16t0ihzWtZPTzZXo0pTdmXmEew2HYxNtDiiF3VeYWfbryrauY/rZL8n/yLb+U=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1779.namprd11.prod.outlook.com (2603:10b6:404:100::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.23; Mon, 22 Jun
 2020 13:45:55 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.027; Mon, 22 Jun 2020
 13:45:55 +0000
Subject: Re: [oe] [meta-python][PATCH 5/7] python3-prompt-toolkit: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200619081011.25051-1-leon.anavi@konsulko.com>
 <20200619081011.25051-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <6f7928da-af9a-8fd2-0de4-f4fe42e48239@windriver.com>
Date: Mon, 22 Jun 2020 09:45:50 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200619081011.25051-5-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTBPR01CA0036.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::49) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTBPR01CA0036.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::49) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend Transport; Mon, 22 Jun 2020 13:45:53 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5eee6f4-9c1c-4cdd-cc4f-08d816b2956c
X-MS-TrafficTypeDiagnostic: BN6PR11MB1779:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB1779F92BD60E2CC6E49BFE619F970@BN6PR11MB1779.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:232;
X-Forefront-PRVS: 0442E569BC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Btb9UOVPUOD2tY5e/XokMY+HzANm40nSWQ2GEVOj4CRiwCzioMaMH3CstHZWl0SdBWH1hg/1yGiDV4ywzb/TKf2sjRB5j6BlL8/49zoaEHsNpM/3INN+GvzZrilmvG/Wmrl038U+TjHWVy2169q7SHqQ6cgPx+wNaQlRjSv4CIYoliVDtl7Kbwusy9VHWfZ40HcGOckLcGWNYzFvcKu2caxx2Ms8ynXSb/qIbBQ2dq9drxw7bkmyXDwUDaXBnlaXF4kLDfcAgagxZv1gQaHce1/gLtOaOHgzWj1L/jrBEP79sgxPMIErIMNZk6ABwRg3Zwncw8A0MCFzeRO5akwF/QVJl6mgTRwX/hoxBapRwcJpSUTnx4PrPZy9wZBENvu/HsKD5OwQweUo4bl+K9oOAgtzkxfrhm3xTqXqnix6sxVK8N5U5g9oR65gnNPmTj0ZioH5/hPKmOrLckTMo3cZdQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(366004)(376002)(39850400004)(136003)(396003)(53546011)(44832011)(66476007)(66556008)(2906002)(83380400001)(26005)(86362001)(166002)(33964004)(8676002)(36756003)(8936002)(31696002)(6486002)(16576012)(5660300002)(966005)(478600001)(31686004)(66946007)(2616005)(186003)(16526019)(52116002)(316002)(956004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	3Jp4YB1MfTmxIGC1FxU8JgXwkpJoAH+zYsIX7IG2X2nm5CpHCByrmj0ev5Kkctg/q7/WKdJlb5BlIgpHoodLUUPywwTpg8BVDfwsc9Vp4/r5OKYJkpFODpPEJiVnq3Wu8Ifoz9jSn/96plbaYP2ei2NxcCEJlmNZ+b1/HVctjf43DE4b0n7V0nFYT0mCBC896aOrtomw6mvr12GQR4rSpFbNxLZmPRBmu640kIod57+7WtUt92Uxr/2ugKoh4iVUY3aVPyonUjFqWwLkEv97lNyLZHJlvh40Yupqy3FwyHYyboHiQZgryw0uamDDneNDsUwBqNjxd54iaw0JYKUp5QY1ycNecUGD/EvxlBnLQqbeaW6erBDQN9PbFYRr9vFE6tzHOZd9Rcoh98/XHzkI3nunlPFWAbIKs4WYpF7Ope0UOw0VyUMumA/LqUg1zWy30vZ3OvbgAeJkQ3LL+uzKIWMMdEerFnXpLbVOi0eo3DY=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5eee6f4-9c1c-4cdd-cc4f-08d816b2956c
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2020 13:45:54.8688
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EDRcEDZ8jnsMNPsfnuHxfXgHr171me85W5fpXusYmZcfJ1X4RfH86zxDID/rUYO0j0WVBPtgKescMbJmLBuMSGR6RmQmtPI2EHQ/zcTGKgc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1779
Content-Type: multipart/alternative;
 boundary="------------7984BF3486A9BFF64C2CD570"
Content-Language: en-US

--------------7984BF3486A9BFF64C2CD570
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/19/20 4:10 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python-prompt-toolkit.inc           | 18 ------------------
>   .../python/python3-prompt-toolkit_2.0.10.bb    | 17 ++++++++++++++++-
>   2 files changed, 16 insertions(+), 19 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-prompt-toolkit.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-prompt-toolkit.inc b/meta-python/recipes-devtools/python/python-prompt-toolkit.inc
> deleted file mode 100644
> index 91aa7bb19..000000000
> --- a/meta-python/recipes-devtools/python/python-prompt-toolkit.inc
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -SUMMARY = "Library for building powerful interactive command lines in Python"
> -LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f"
> -
> -SRC_URI[md5sum] = "5016c523e603cd7119644fbc0f00ce53"
> -SRC_URI[sha256sum] = "f15af68f66e664eaa559d4ac8a928111eebd5feda0c11738b5998045224829db"
> -
> -PYPI_PACKAGE = "prompt_toolkit"
> -
> -RDEPENDS_${PN} += " \
> -    ${PYTHON_PN}-core \
> -    ${PYTHON_PN}-six \
> -    ${PYTHON_PN}-terminal \
> -    ${PYTHON_PN}-threading \
> -    ${PYTHON_PN}-wcwidth \
> -"
> -
> -BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_2.0.10.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_2.0.10.bb
> index 0e99917c2..d9ece8dab 100644
> --- a/meta-python/recipes-devtools/python/python3-prompt-toolkit_2.0.10.bb
> +++ b/meta-python/recipes-devtools/python/python3-prompt-toolkit_2.0.10.bb
> @@ -1,7 +1,22 @@
> +SUMMARY = "Library for building powerful interactive command lines in Python"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f"
> +
> +SRC_URI[md5sum] = "5016c523e603cd7119644fbc0f00ce53"
> +SRC_URI[sha256sum] = "f15af68f66e664eaa559d4ac8a928111eebd5feda0c11738b5998045224829db"
> +
>   inherit pypi setuptools3
> -require python-prompt-toolkit.inc
> +
> +PYPI_PACKAGE = "prompt_toolkit"
>   
>   RDEPENDS_${PN} += " \
> +    ${PYTHON_PN}-core \
> +    ${PYTHON_PN}-six \
> +    ${PYTHON_PN}-terminal \
> +    ${PYTHON_PN}-threading \
> +    ${PYTHON_PN}-wcwidth \
>       ${PYTHON_PN}-datetime \
>       ${PYTHON_PN}-shell \
>   "
> +
> +BBCLASSEXTEND = "native nativesdk"
>
> 

--------------7984BF3486A9BFF64C2CD570
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/19/20 4:10 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200619081011.25051-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200619081011.25051-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python-prompt-toolkit.inc           | 18 ------------------
 .../python/python3-prompt-toolkit_2.0.10.bb    | 17 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-
 2 files changed, 16 insertions(&#43;), 19 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-prompt-toolkit.inc

diff --git a/meta-python/recipes-devtools/python/python-prompt-toolkit.inc b/meta-python/recipes-devtools/python/python-prompt-toolkit.inc
deleted file mode 100644
index 91aa7bb19..000000000
--- a/meta-python/recipes-devtools/python/python-prompt-toolkit.inc
&#43;&#43;&#43; /dev/null
@@ -1,18 &#43;0,0 @@
-SUMMARY = &quot;Library for building powerful interactive command lines in Python&quot;
-LICENSE = &quot;BSD-3-Clause&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f">&quot;file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f&quot;</a>
-
-SRC_URI[md5sum] = &quot;5016c523e603cd7119644fbc0f00ce53&quot;
-SRC_URI[sha256sum] = &quot;f15af68f66e664eaa559d4ac8a928111eebd5feda0c11738b5998045224829db&quot;
-
-PYPI_PACKAGE = &quot;prompt_toolkit&quot;
-
-RDEPENDS_${PN} &#43;= &quot; \
-    ${PYTHON_PN}-core \
-    ${PYTHON_PN}-six \
-    ${PYTHON_PN}-terminal \
-    ${PYTHON_PN}-threading \
-    ${PYTHON_PN}-wcwidth \
-&quot;
-
-BBCLASSEXTEND = &quot;native nativesdk&quot;
diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_2.0.10.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_2.0.10.bb
index 0e99917c2..d9ece8dab 100644
--- a/meta-python/recipes-devtools/python/python3-prompt-toolkit_2.0.10.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-prompt-toolkit_2.0.10.bb
@@ -1,7 &#43;1,22 @@
&#43;SUMMARY = &quot;Library for building powerful interactive command lines in Python&quot;
&#43;LICENSE = &quot;BSD-3-Clause&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f">&quot;file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f&quot;</a>
&#43;
&#43;SRC_URI[md5sum] = &quot;5016c523e603cd7119644fbc0f00ce53&quot;
&#43;SRC_URI[sha256sum] = &quot;f15af68f66e664eaa559d4ac8a928111eebd5feda0c11738b5998045224829db&quot;
&#43;
 inherit pypi setuptools3
-require python-prompt-toolkit.inc
&#43;
&#43;PYPI_PACKAGE = &quot;prompt_toolkit&quot;
 
 RDEPENDS_${PN} &#43;= &quot; \
&#43;    ${PYTHON_PN}-core \
&#43;    ${PYTHON_PN}-six \
&#43;    ${PYTHON_PN}-terminal \
&#43;    ${PYTHON_PN}-threading \
&#43;    ${PYTHON_PN}-wcwidth \
     ${PYTHON_PN}-datetime \
     ${PYTHON_PN}-shell \
 &quot;
&#43;
&#43;BBCLASSEXTEND = &quot;native nativesdk&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------7984BF3486A9BFF64C2CD570--

Received: from NAM02-CY1-obe.outbound.protection.outlook.com (NAM02-CY1-obe.outbound.protection.outlook.com [40.107.76.48])
 by mx.groups.io with SMTP id smtpd.web11.564.1599495016488670588
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Sep 2020 09:10:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=kK62N+mI;
 spf=pass (domain: windriver.com, ip: 40.107.76.48, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H+KaFpeWyHjVmSDUEmbHrDm7JUiM94RvfHhxAkKtACHTTqmo9s0780fCtn6jKsp7OcB2aHh7MGd5Q7ahzOpxJKvUdumYvSiMtmsZdRjL2q9Y5tAPz2J9a5ksqACbnCKkgzItZTL0GxXNuDeIr6q9l9h+uBpIj0aeQJExBOsJ5LuD2MWqdHAt7L3KZP/prMhM78ivUbG1TR6Lr6Hsf2DLF2Umv909Md1WxXMtFdfn/oSRrn+OYakNM5irUrFMR6ce7pOVuFROkv1vODBSkrUJfuh7bQXb8Jyr5TXrptrS75PVpv1Q4IgJ8uHVCdqt1qbCOO9DvnDDXrxtOOApNEdOyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qDmOzwDZ6KtNeFBvY/cg/PWIbKv6qEr0tgek4PcH4Bw=;
 b=I8O8PYzmzsKdoixc8lq1WNW/EI1OzpgkFWjq7fTzg3LP6uXc3G9UWkUY/AK9aiue0cnC+4uWtyChMg1n4HGDrvOW/VyVRmckwOsMo5B2x0hMdmQwWFGopatUK6OfKUTbaIQkPNTOREtCahxTEN1P+vY+pNHT975Snrobb6fbg4E/cNBHLCfUnf58GSZlWHaVr/jC9sOvaIJCKYNw6+Fv3TBzkHV01p4hDVmagUEoKH+uC5Gap+2Vn90o1fTaAI9PFfMfKk1DoHRkUpmLvNYpyJDTDS5HwKqYlqj+i2X8NVBFBkBisUtuaFQmgXywudg2CuMt80ymrG0idDZMjsF4PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qDmOzwDZ6KtNeFBvY/cg/PWIbKv6qEr0tgek4PcH4Bw=;
 b=kK62N+mIly2q0pgsD4IL1XHxNsPlAVctz04e5Yrd00CpzfC0VwUElKGYF7sjQvvASwEh4Kplfrjp9PcUwJGLQPADp99Xfo7anl+c7ed6BdDGT+uQNrDac4HjhqKWOWuNMM1FRnTCOCJi+mSLuxUDLoAvuydIf9JWo1WoHaHyvAE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3671.namprd11.prod.outlook.com (2603:10b6:a03:b3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19; Mon, 7 Sep
 2020 16:10:15 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3348.019; Mon, 7 Sep 2020
 16:10:15 +0000
Subject: Re: [oe] [meta-python][PATCH 04/10] python3-priority: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200904134713.13164-1-leon.anavi@konsulko.com>
 <20200904134713.13164-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <9f431afe-3785-44a0-1bcf-39e9790b0c5e@windriver.com>
Date: Mon, 7 Sep 2020 12:10:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200904134713.13164-4-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0023.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::36) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTXPR0101CA0023.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Mon, 7 Sep 2020 16:10:14 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f0a81079-d687-4528-7446-08d85348819f
X-MS-TrafficTypeDiagnostic: BYAPR11MB3671:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB36715CDA333354B109FAE0C29F280@BYAPR11MB3671.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:773;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vtYkAbsMQYvlYkyB3F538zTluP6wVq9X4cPjL9zlckDGiK7+2/BbWISSX1uBIybTOxqOoKbjlS14UBBXqh+pw9XUVGwYF9HQt3HyvuABCv18c58INFyINZL+wS33c+uuXXczvumPFbwEx/E5Fcj/cOu2klN51GnBGcARm9Ly7g/j/+DlQv8j6LTfhRCQUKDT1OMtncfoK+sFs7gEUU6biSm7O/0KXScR/uRYOUusZnDOTMlAytKTJ3X7syFkJTs+DtZKCDZP3JwDtfsLx6MDKLW5JqcNRb2faan8tOBtgkeov8V+6nUyKeN1232Z/x7Z6warBzSGgivUgyFQILfiIEevCWa5onJOzVTmDfiXMRH2xXXLsbg5RoIEUnY3WA9jlJ45nCLWD+SVWVp0gfUrDQjYacScbBa5RcozzcKm2LT7D0eyairfDGFl1E5ACSZbIOti0ZHxwxIS2RyWwYxilg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(366004)(376002)(39850400004)(396003)(478600001)(66476007)(2906002)(186003)(8936002)(66946007)(44832011)(16526019)(86362001)(31686004)(66556008)(966005)(6486002)(53546011)(33964004)(31696002)(52116002)(26005)(5660300002)(16576012)(316002)(2616005)(8676002)(83380400001)(36756003)(166002)(956004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	vWQXZ59UmFL0uerVRQ6kvSXNI30P5k6deNvy1MFlDRPeSp+7qFm3EoQ6wIPSWeKXXXBH8yPno2Z4pHEtzKg2i8wozsTtnGp/ePl/18RyXNLAEmuWYt5kXDeVZI4kspFNM3UCJ/rZ3cRqF92f5uQ5mAF9oI7UAc35rLVhvmoHEhCvFJdYjFbirw05ZrdlZzUoAl4MVvTP70IEohvKIzYmcbSfL40tuL3IkA4Aa3KHBTkJAbze8WiLJiAismV6ue8L+vKuYHM+W11CRZXuBI5P2t0M5PV0M2Jx8O2+1JuKzbYMcW9niKLfONAnOxoQT2ysjuJ4KfaL0kC3f4Rs1MsE9U0C+gD1Oy/L3c+RmW5rhRR7aMZfnpAhVJ2dq4Mj5AYIePOq8In4bLRqEBMSyTgx/XxDY4zPLi04/RdM7IVM/tyY8val44F6jS5y6tZTsxvh34RcjHKVa5UlZcM1Al9cFISTjvUOIbYlLsArfMeZNjSdYivHmgKDy8nRngjB03XlEIR7mptaIhiQMjv1Xe/8aJRFhoyjyuPKoaGcgveOfLWldGNE7joBe2RDdeBzcrXujXS/ROdTxieQr4DDhBRtEENC2v0UVRSNNeU6i1NxMWZ/WOqZ8plDf+4AWVkOluatgvsaU9fy4JM3iaOmjYiJdA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0a81079-d687-4528-7446-08d85348819f
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2020 16:10:15.2335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EXYwEgNqutR7NTeKIKoQmYEmWPNCQ26OtUt6sB4XjbXkQMbBtF0PQwqgHVvwwSJ1wWC4g4nlEEQaFbT+Q5esDf94/3/IiaP31T/BD0QQXNk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3671
Content-Type: multipart/alternative;
 boundary="------------03B23873A8C141D14413A7F6"
Content-Language: en-US

--------------03B23873A8C141D14413A7F6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/4/20 9:47 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python-priority/python-priority.inc               | 10 ----------
>   .../python-priority/python3-priority_1.3.0.bb         | 11 +++++++++--
>   2 files changed, 9 insertions(+), 12 deletions(-)
>   delete mode 100644 meta-python/recipes-connectivity/python-priority/python-priority.inc
>
> diff --git a/meta-python/recipes-connectivity/python-priority/python-priority.inc b/meta-python/recipes-connectivity/python-priority/python-priority.inc
> deleted file mode 100644
> index aa93819bc..000000000
> --- a/meta-python/recipes-connectivity/python-priority/python-priority.inc
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -DESCRIPTION = "A pure-Python implementation of the HTTP/2 priority tree"
> -HOMEPAGE = "https://github.com/python-hyper/priority"
> -LICENSE = "MIT"
> -
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=ae57d8a09fc8b6b164d7357339619045"
> -
> -SRC_URI[md5sum] = "4f1ff52f7fa448e9d9cb46337ae86d1e"
> -SRC_URI[sha256sum] = "6bc1961a6d7fcacbfc337769f1a382c8e746566aaa365e78047abe9f66b2ffbe"
> -
> -inherit pypi
> diff --git a/meta-python/recipes-connectivity/python-priority/python3-priority_1.3.0.bb b/meta-python/recipes-connectivity/python-priority/python3-priority_1.3.0.bb
> index fe756b56b..5d84571f9 100644
> --- a/meta-python/recipes-connectivity/python-priority/python3-priority_1.3.0.bb
> +++ b/meta-python/recipes-connectivity/python-priority/python3-priority_1.3.0.bb
> @@ -1,3 +1,10 @@
> -require python-priority.inc
> +DESCRIPTION = "A pure-Python implementation of the HTTP/2 priority tree"
> +HOMEPAGE = "https://github.com/python-hyper/priority"
> +LICENSE = "MIT"
>   
> -inherit setuptools3
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=ae57d8a09fc8b6b164d7357339619045"
> +
> +SRC_URI[md5sum] = "4f1ff52f7fa448e9d9cb46337ae86d1e"
> +SRC_URI[sha256sum] = "6bc1961a6d7fcacbfc337769f1a382c8e746566aaa365e78047abe9f66b2ffbe"
> +
> +inherit pypi setuptools3
>
> 

--------------03B23873A8C141D14413A7F6
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/4/20 9:47 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200904134713.13164-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200904134713.13164-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python-priority/python-priority.inc               | 10 ----------
 .../python-priority/python3-priority_1.3.0.bb         | 11 +++++++++--
 2 files changed, 9 insertions(+), 12 deletions(-)
 delete mode 100644 meta-python/recipes-connectivity/python-priority/python-priority.inc

diff --git a/meta-python/recipes-connectivity/python-priority/python-priority.inc b/meta-python/recipes-connectivity/python-priority/python-priority.inc
deleted file mode 100644
index aa93819bc..000000000
--- a/meta-python/recipes-connectivity/python-priority/python-priority.inc
+++ /dev/null
@@ -1,10 +0,0 @@
-DESCRIPTION = &quot;A pure-Python implementation of the HTTP/2 priority tree&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/python-hyper/priority">&quot;https://github.com/python-hyper/priority&quot;</a>
-LICENSE = &quot;MIT&quot;
-
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=ae57d8a09fc8b6b164d7357339619045">&quot;file://LICENSE;md5=ae57d8a09fc8b6b164d7357339619045&quot;</a>
-
-SRC_URI[md5sum] = &quot;4f1ff52f7fa448e9d9cb46337ae86d1e&quot;
-SRC_URI[sha256sum] = &quot;6bc1961a6d7fcacbfc337769f1a382c8e746566aaa365e78047abe9f66b2ffbe&quot;
-
-inherit pypi
diff --git a/meta-python/recipes-connectivity/python-priority/python3-priority_1.3.0.bb b/meta-python/recipes-connectivity/python-priority/python3-priority_1.3.0.bb
index fe756b56b..5d84571f9 100644
--- a/meta-python/recipes-connectivity/python-priority/python3-priority_1.3.0.bb
+++ b/meta-python/recipes-connectivity/python-priority/python3-priority_1.3.0.bb
@@ -1,3 +1,10 @@
-require python-priority.inc
+DESCRIPTION = &quot;A pure-Python implementation of the HTTP/2 priority tree&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/python-hyper/priority">&quot;https://github.com/python-hyper/priority&quot;</a>
+LICENSE = &quot;MIT&quot;
 
-inherit setuptools3
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=ae57d8a09fc8b6b164d7357339619045">&quot;file://LICENSE;md5=ae57d8a09fc8b6b164d7357339619045&quot;</a>
+
+SRC_URI[md5sum] = &quot;4f1ff52f7fa448e9d9cb46337ae86d1e&quot;
+SRC_URI[sha256sum] = &quot;6bc1961a6d7fcacbfc337769f1a382c8e746566aaa365e78047abe9f66b2ffbe&quot;
+
+inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------03B23873A8C141D14413A7F6--

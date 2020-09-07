Received: from NAM02-CY1-obe.outbound.protection.outlook.com (NAM02-CY1-obe.outbound.protection.outlook.com [40.107.76.55])
 by mx.groups.io with SMTP id smtpd.web10.584.1599495090815734843
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Sep 2020 09:11:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=PnPpGiit;
 spf=pass (domain: windriver.com, ip: 40.107.76.55, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HHdeGclnU9hCjfT/tOBMWtNusY3XoqXexG1PrRu6c2qXrrhg0TvoLv9vyfCYXoZ0dtAw+dptq8Up4/6AC/ZeaINXwtGi9iaSc1H9IXu+6PGJ506PDZIGF5PtxYMbu2tvwAs2BUYaEtXAYeDMyAnbG7J0n0GncYzeT8oMIXwgJqOuSjZ5GaRaGg1YMt02Jh64BfLoHqyGVszygE2iQ4Bv+in3ypvCZ6eXAc0SLWIaKKp8ae0rcfUQ249M0fwbRWwobDy5CYI3a9H+d52J82Y5hc//hYM+EQS0+p1uotkaMD9WwA52I2jqIHvAULqdJr4zk0CIuJpS5P5CC8kXlpi1Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bwtuc28mfocym/7bXBlUAshlPEv1h75KtTe8H+/SrtM=;
 b=gAB//pYm6MfadTCNlHUKbJBIiWoS7RKzxvHsHVcyibi2Hcm+aY0eOJLi7CTOt/6xAZ7+E9MWLDfS/7l/aizSJdRSO+0tQIs6fIArIBUyd6tSaprEMh+hqsrv3/W7ryGp7XN297RSLiIKPvJ6xCCNemGvLRpxPzuyaM2jo1orjNCVlTU7dZnxrVsdzh2tOnfnR/qy4/XfsYL2aTu195za7nw9jEeY+JExkVu33t9Q8RLUnYoaorQaPSHp9DYHSTKpTrdEFliyko2mLxQOSjH93G/XGFAFuAUyuhwTHVZeDgXdw/elLfA190elg234FYx/5+kckfEQ79rqlsVvktwuuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bwtuc28mfocym/7bXBlUAshlPEv1h75KtTe8H+/SrtM=;
 b=PnPpGiitPFZIHbg98AeershH89Wg1hElz8EeEHKKeHdsFObbIxtWKTMy9rj4MH1OiqWyL0SWzc/DUj04LPgg+ZLMY/GxgQcMjucqytIAfTM3/7v2wGa9zKoVlPXQmM6EMQUtJcdwhvqhv4X+nvrev+BC3dFT4YHAUiZLq4HRn9o=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3671.namprd11.prod.outlook.com (2603:10b6:a03:b3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19; Mon, 7 Sep
 2020 16:11:28 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3348.019; Mon, 7 Sep 2020
 16:11:28 +0000
Subject: Re: [oe] [meta-python][PATCH 10/10] python3-fann2: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200904134713.13164-1-leon.anavi@konsulko.com>
 <20200904134713.13164-10-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <cdabccf9-6e7e-0d95-e91c-f457961166a1@windriver.com>
Date: Mon, 7 Sep 2020 12:11:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200904134713.13164-10-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0019.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::32)
 To BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0019.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend Transport; Mon, 7 Sep 2020 16:11:28 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3138ba6c-1ae0-4539-8410-08d85348ad76
X-MS-TrafficTypeDiagnostic: BYAPR11MB3671:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3671FD777FFDA1352B1770CA9F280@BYAPR11MB3671.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:207;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	w4o8rYdMU/pElvCoCzxaOeJJAv4OG491Hm4I/hw0oYnq+EOYXhf0mlFDfONwhlltvT4xJM8CMQyg+hLodAwg5t0AIJuv0ZpzDVOF0PqfPMuKqEIWNRlk28xsWwyZ7tOSw7nOlsBfYzacZA4Zj6VvbUG8Nvx1Mrr10N+4zKmsG4MM4VEr5pmoKpgUCUsFKfPA/M9AqVsdk9zbEAPvCN+fcfBTB3XwHPC1R7SiPA7+B5oDrgwUrJuwcB2XRGOwZEB5ZMUZWPo3wVGUrwDSiOCsTkyAXPTxiDyiedaJ9TxCIHVnJ5L5czWECeFS0gPSpKojSOivM8NtRtHGzEYEEIB5oV/IRzl9w2ZI+foi2RmRRxaZHhvWNWiIahWCobfuCpkF6tSufp2hSyFBSmhMN0wttpHJn38ObuOVK4Y6FC3sHG6RtZbpHYZh3xTfZ/+XqovNjXmwsGkvtP8Fbc1fTXpsQg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(366004)(376002)(39850400004)(396003)(478600001)(66476007)(2906002)(186003)(8936002)(66946007)(44832011)(16526019)(86362001)(31686004)(66556008)(966005)(6486002)(53546011)(33964004)(31696002)(52116002)(26005)(5660300002)(16576012)(316002)(2616005)(8676002)(83380400001)(36756003)(166002)(956004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	EBDN8iFO32TDBtLqmGQk1yp2tNU6tUEs6+SFzof131EaYHZQFxUHa/J8P5oRC0YZyvfl8efcm5FhVWMnGc3URFYsaKUUL+4Q6UYqFkBsj84FQ9+07THXFunBBHSqQ4ayY3YKGvLjih9z47UsiPMJnbEndGKr7EzFVGpbjgE4HOVuYkQShVvtM7gTEtBSTY3GpYfWCPlKYzYMRjokUZLc8cqr9kKixlCh9FkW5Ey0zqLBBUH8laLOnCzzECWA5OoqSd448VG8aJEb9HgAEEpIVRrl6lSpntzq/rFvv2vcj4If2Yj1YTF/fyXNe2odyCYzKqCVrbKrJUAwmUKIlwYooyo2dIII9mCppjUzo9iZ80bcuP3Z4XRLCHs+HXSZECVwRKQuW9Y8dFEgaZ1PDFIzGdweC/nXW7WrWyOJWXHboG0TucGAdraosqyRBzwYhbZtqGwp7cdYhUF/TZqjfQscAi10LSCXtQ7qZ1PIuZzdbkxNrxcB1+elvRsLocuGl4mEKTiwe16RIYtpgiX74QMZDIAcskuFUghHytJEhUcWpXaV1hmF7Ihm4xcSAiO/0bADbK1ebrhCSWbFy/JMVkRHKU1DqaqHYWCBDH4ICsoKBskiHruYURKJKx3ifsyt7SvE/4KeQxTk13Al7jU/VF5WNQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3138ba6c-1ae0-4539-8410-08d85348ad76
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2020 16:11:28.8090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 32pKNnseubIKMrHtmprmwVRHdpHFe8+CVSCfrqn230qXTDYFfjopt8lKOq2EqLuPbaS9Vchnxn98FRwJCjdXRnPBXb5rKmh0FfdoH8m3Tho=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3671
Content-Type: multipart/alternative;
 boundary="------------A9AC15877826C5AA3BDADE21"
Content-Language: en-US

--------------A9AC15877826C5AA3BDADE21
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/4/20 9:47 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python-fann2.inc        |  9 ---------
>   .../recipes-devtools/python/python3-fann2_1.1.2.bb  | 13 +++++++++++--
>   2 files changed, 11 insertions(+), 11 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-fann2.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-fann2.inc b/meta-python/recipes-devtools/python/python-fann2.inc
> deleted file mode 100644
> index c415b35a9..000000000
> --- a/meta-python/recipes-devtools/python/python-fann2.inc
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -SUMMARY = "Python bindings for Fast Artificial Neural Networks 2.2.0 (FANN >= 2.2.0)"
> -SECTION = "devel/python"
> -LICENSE = "LGPLv2"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=c73b943dc75f6f65e007c56ac6515c8f"
> -
> -SRC_URI[md5sum] = "0b85b418018746d63ed66b55465697a9"
> -SRC_URI[sha256sum] = "cdca0a65ad48e08320672affe38c3dd4ea15e27821e5e1db9fa2b34299bdd41e"
> -
> -DEPENDS += "swig-native libfann"
> diff --git a/meta-python/recipes-devtools/python/python3-fann2_1.1.2.bb b/meta-python/recipes-devtools/python/python3-fann2_1.1.2.bb
> index a04c961f4..3fdc1363c 100644
> --- a/meta-python/recipes-devtools/python/python3-fann2_1.1.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-fann2_1.1.2.bb
> @@ -1,4 +1,13 @@
> -require python-fann2.inc
> -inherit pypi setuptools3
> +SUMMARY = "Python bindings for Fast Artificial Neural Networks 2.2.0 (FANN >= 2.2.0)"
> +SECTION = "devel/python"
> +LICENSE = "LGPLv2"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=c73b943dc75f6f65e007c56ac6515c8f"
> +
> +SRC_URI[md5sum] = "0b85b418018746d63ed66b55465697a9"
> +SRC_URI[sha256sum] = "cdca0a65ad48e08320672affe38c3dd4ea15e27821e5e1db9fa2b34299bdd41e"
>   
>   SRC_URI += " file://0001-setup.py-Don-t-hardcode-swig-and-fann2-binary-locati.patch"
> +
> +inherit pypi setuptools3
> +
> +DEPENDS += "swig-native libfann"
>
> 

--------------A9AC15877826C5AA3BDADE21
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
    <blockquote type="cite" cite="mid:20200904134713.13164-10-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200904134713.13164-10-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python-fann2.inc        |  9 ---------
 .../recipes-devtools/python/python3-fann2_1.1.2.bb  | 13 +++++++++++--
 2 files changed, 11 insertions(+), 11 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-fann2.inc

diff --git a/meta-python/recipes-devtools/python/python-fann2.inc b/meta-python/recipes-devtools/python/python-fann2.inc
deleted file mode 100644
index c415b35a9..000000000
--- a/meta-python/recipes-devtools/python/python-fann2.inc
+++ /dev/null
@@ -1,9 +0,0 @@
-SUMMARY = &quot;Python bindings for Fast Artificial Neural Networks 2.2.0 (FANN &gt;= 2.2.0)&quot;
-SECTION = &quot;devel/python&quot;
-LICENSE = &quot;LGPLv2&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=c73b943dc75f6f65e007c56ac6515c8f">&quot;file://LICENSE;md5=c73b943dc75f6f65e007c56ac6515c8f&quot;</a>
-
-SRC_URI[md5sum] = &quot;0b85b418018746d63ed66b55465697a9&quot;
-SRC_URI[sha256sum] = &quot;cdca0a65ad48e08320672affe38c3dd4ea15e27821e5e1db9fa2b34299bdd41e&quot;
-
-DEPENDS += &quot;swig-native libfann<a class="moz-txt-link-rfc2396E" href="mailto:diff--gita/meta-python/recipes-devtools/python/python3-fann2_1.1.2.bbb/meta-python/recipes-devtools/python/python3-fann2_1.1.2.bbindexa04c961f4..3fdc1363c100644---a/meta-python/recipes-devtools/python/python3-fann2_1.1.2.bb+++b/meta-python/recipes-devtools/python/python3-fann2_1.1.2.bb@@-1,4+1,13@@-requirepython-fann2.inc-inheritpypisetuptools3+SUMMARY=">&quot;
diff --git a/meta-python/recipes-devtools/python/python3-fann2_1.1.2.bb b/meta-python/recipes-devtools/python/python3-fann2_1.1.2.bb
index a04c961f4..3fdc1363c 100644
--- a/meta-python/recipes-devtools/python/python3-fann2_1.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-fann2_1.1.2.bb
@@ -1,4 +1,13 @@
-require python-fann2.inc
-inherit pypi setuptools3
+SUMMARY = &quot;</a>Python bindings for Fast Artificial Neural Networks 2.2.0 (FANN &gt;= 2.2.0)&quot;
+SECTION = &quot;devel/python&quot;
+LICENSE = &quot;LGPLv2&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=c73b943dc75f6f65e007c56ac6515c8f">&quot;file://LICENSE;md5=c73b943dc75f6f65e007c56ac6515c8f&quot;</a>
+
+SRC_URI[md5sum] = &quot;0b85b418018746d63ed66b55465697a9&quot;
+SRC_URI[sha256sum] = &quot;cdca0a65ad48e08320672affe38c3dd4ea15e27821e5e1db9fa2b34299bdd41e&quot;
 
 SRC_URI += <a class="moz-txt-link-rfc2396E" href="file://0001-setup.py-Don-t-hardcode-swig-and-fann2-binary-locati.patch">&quot; file://0001-setup.py-Don-t-hardcode-swig-and-fann2-binary-locati.patch&quot;</a>
+
+inherit pypi setuptools3
+
+DEPENDS += &quot;swig-native libfann&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------A9AC15877826C5AA3BDADE21--

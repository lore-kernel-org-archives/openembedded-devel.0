Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.69])
 by mx.groups.io with SMTP id smtpd.web10.121.1591377850754877037
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Jun 2020 10:24:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=PHcBrskm;
 spf=pass (domain: windriver.com, ip: 40.107.92.69, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cJpHmJ4J29c29D2yxw+DhnTKElpkIiyo6Gv9yFAZNijUr3Itxz+vu4DIK794LBlLNNvRaKjoyosHOcb7rJxt1vuUBCIT61vBbTOe0D29hd3jcAJnUFPmXRueYl6LE35rCsBWPK8FBpbNKQSWK0AqwtjmfH7vy+fDwWhzuSCAnx5JB7J516K8sjXux+0Ty9NlYW03gg3u1kwYKvw6Aa1h+MeF+dp4itOWPlilpwBkx1Kqeguu/fMEmwadUVJMWIO0ovtZVAmhIsKMRD1y7cl9K5PThZxoadwi4etKH5d/zzg6FqivboNFXT8tcVGZAtlkp7Yp+v4yGJbALuvbM+ivpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A9iemv/2UiYwSm59G3Ns9u+FvgJ6UrKcVSF/sz+IKFE=;
 b=b1rmiBd1rIRp/dseIP4Ln0uMJrkhbh5k9oHv+uwyYrhsFXEENpC1w+Mivy37poU5Fl/rp/O1zfbA05TJEwDFxbRtbYUvt1wg4/TyFiLSRPRBzFTlnkH44GmB/FIaf4aohnyanZ9PWPM3K6wo30RIxf5t/uDqR3lXAFKgboME2SkihT56PlRRhbsria+AJ1tXLSm2p50DeAcxOikPgkUHVc1DEb8gk8YGbdxheoRO4pGfnswma+RdnkyZOM1Z0ft/ka1wa7WXvYNXxlmnRf9wq/Us4x+bpLe1UB1/cJmcFQQOGsviCoNtbuU+z9hLcNsXkF45wORdFzxcZxgnxy10xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A9iemv/2UiYwSm59G3Ns9u+FvgJ6UrKcVSF/sz+IKFE=;
 b=PHcBrskmcojl1xuMtqOqy6HzSd4n7Nl9kcIYvXSW1H7PL0p3g5q/FIFD2DtZRlUCaUUJMIpB9ZjYl7Y2a8pwsEkqd4hT/ByBRYLf1jvTtsmEjtxpUm7HOtXv/2ubBYmTQQ7WrOtiMc52W1rDHcbFdRVfK92lBzbfq6YxzaPp93E=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1908.namprd11.prod.outlook.com (2603:10b6:404:103::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Fri, 5 Jun
 2020 17:24:09 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3066.019; Fri, 5 Jun 2020
 17:24:09 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-isort: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200603111629.12516-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <5792cca8-06a5-a304-2fd6-4b0acb0f83e2@windriver.com>
Date: Fri, 5 Jun 2020 13:24:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200603111629.12516-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0036.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::49) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTXPR0101CA0036.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::49) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend Transport; Fri, 5 Jun 2020 17:24:08 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6cfe89ab-5c49-4b81-11cc-08d8097541c3
X-MS-TrafficTypeDiagnostic: BN6PR11MB1908:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB1908C29757AE8E7E741CE1599F860@BN6PR11MB1908.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:341;
X-Forefront-PRVS: 0425A67DEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hrLLlHv+BD4u8ATLYQlyVEcHwc4WiBGCMKUu5Ta/zl5JC9fj5QgP8+HEYueWoh4C2WmHS4aFTDQS8Llu+kVWv1kV2RoSU/nPbrHM/QmEva7cchrWgjoemIy3GvydxeIucARA7YexBbbeUSXqK88dH3kll3BwvXuq45sPwHYNUGO26CgTy0Q0nEjgJY5tUuZmzyxOFz+hfJHLaMWq4uJD/abNju+lh4MDBqTN1MY8Vj/hfsQuACPalU3VI/BnTumK5XjhF1AcHECII/9/qLul/D817vLkPS5R066i7Qc0jcZWjuay0XDyY9wBIrz+7SMz4U0XlVYJiW0k6VAJDptyvZ3wsPBQ5rZYuu69M5OVEK33Q0dYNN/sqsOz4xgCwYnBWGL6+GFxHNfJ8zkEl6V2M5gUxbJSocou2KsFlaEzaLlpGXweTSAflqmyZ544BeVDmw2uAPT0Q4AQ6n8VjOZLKA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(346002)(136003)(39850400004)(396003)(366004)(44832011)(8676002)(31686004)(53546011)(2616005)(66476007)(66556008)(186003)(16526019)(956004)(66946007)(2906002)(16576012)(26005)(36756003)(316002)(33964004)(31696002)(966005)(478600001)(8936002)(5660300002)(52116002)(166002)(6486002)(83380400001)(86362001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	OLVtlFhMF1/xGiovGEYjjBwgFOIFdRGVyeJ6wf5CAVXpYX7iNvVZNBVaL034yX7wFz+EEpuvk61YVavSrCdiPi3ZIBVicsfm5c9bZuxjwoC+7A10kyEvcb/ckeSTn3ZZlNjqOYSrKWid2cuHqSc/R8nRA2z8idwCfrlDYAEImermyKj3KpJBIhlc/dNtYl837rMyRytL6wbV9xkjCGW1HTjv9WVsgV0N9ofz9/IINt8BYLR679TMSPlDMjH1Ak1AI2y1Edl28/uOtH02XD+47OON9BTi6choR02NEvwjrbuVSgEwSS/qker+tiCnMvc4Y8oYWrIAw2Ic7arI9DR5d/gElKDJMFrEqN78Y93R6jV4O2q2ol9Sp7T5sXqvpeFu4dxNpCTPnm2etnfo5F9AZLOWHzO/bbzsj4nv0zLfHk3dR7IPgBp/CN4n3UH/OEdPS7ZzQQ18Zh6PSevlXe0SdzDNNDd+DcoEeSIKyJyFfgI=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cfe89ab-5c49-4b81-11cc-08d8097541c3
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2020 17:24:09.4450
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LbMmIB3yEDWQt7RCaz6Y31x0Zsrp03Yh+kMhXmcj+3LBvPBUYxHTmgtCplT/ByL4MzrXPK9aiggVFfxupZWMrz3ioZ4NBYQKbrSwNKE7MzM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1908
Content-Type: multipart/alternative;
 boundary="------------1528985411B3BDE153F4DDBA"
Content-Language: en-US

--------------1528985411B3BDE153F4DDBA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/3/20 7:16 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python-isort.inc  | 17 -----------------
>   .../python/python3-isort_4.3.21.bb            | 19 +++++++++++++++++--
>   2 files changed, 17 insertions(+), 19 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-isort.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-isort.inc b/meta-python/recipes-devtools/python/python-isort.inc
> deleted file mode 100644
> index 324d4cf10..000000000
> --- a/meta-python/recipes-devtools/python/python-isort.inc
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -SUMMARY = "A Python utility / library to sort Python imports."
> -HOMEPAGE = "https://pypi.python.org/pypi/isort"
> -LICENSE = "MIT"
> -SECTION = "devel/python"
> -LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
> -
> -SRC_URI[md5sum] = "05d66f2eb7ce2c2d702e86bac24bf9e4"
> -SRC_URI[sha256sum] = "54da7e92468955c4fceacd0c86bd0ec997b0e1ee80d97f67c35a78b719dccab1"
> -
> -inherit pypi
> -
> -RDEPENDS_${PN} += "\
> -    ${PYTHON_PN}-datetime \
> -    ${PYTHON_PN}-shell \
> -"
> -
> -BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python3-isort_4.3.21.bb b/meta-python/recipes-devtools/python/python3-isort_4.3.21.bb
> index 755b3e2f2..e0b21ab55 100644
> --- a/meta-python/recipes-devtools/python/python3-isort_4.3.21.bb
> +++ b/meta-python/recipes-devtools/python/python3-isort_4.3.21.bb
> @@ -1,2 +1,17 @@
> -inherit setuptools3
> -require python-isort.inc
> +SUMMARY = "A Python utility / library to sort Python imports."
> +HOMEPAGE = "https://pypi.python.org/pypi/isort"
> +LICENSE = "MIT"
> +SECTION = "devel/python"
> +LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
> +
> +SRC_URI[md5sum] = "05d66f2eb7ce2c2d702e86bac24bf9e4"
> +SRC_URI[sha256sum] = "54da7e92468955c4fceacd0c86bd0ec997b0e1ee80d97f67c35a78b719dccab1"
> +
> +inherit pypi setuptools3
> +
> +RDEPENDS_${PN} += "\
> +    ${PYTHON_PN}-datetime \
> +    ${PYTHON_PN}-shell \
> +"
> +
> +BBCLASSEXTEND = "native nativesdk"
>
> 

--------------1528985411B3BDE153F4DDBA
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/3/20 7:16 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200603111629.12516-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200603111629.12516-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python-isort.inc  | 17 -----------------
 .../python/python3-isort_4.3.21.bb            | 19 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;--
 2 files changed, 17 insertions(&#43;), 19 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-isort.inc

diff --git a/meta-python/recipes-devtools/python/python-isort.inc b/meta-python/recipes-devtools/python/python-isort.inc
deleted file mode 100644
index 324d4cf10..000000000
--- a/meta-python/recipes-devtools/python/python-isort.inc
&#43;&#43;&#43; /dev/null
@@ -1,17 &#43;0,0 @@
-SUMMARY = &quot;A Python utility / library to sort Python imports.&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://pypi.python.org/pypi/isort">&quot;https://pypi.python.org/pypi/isort&quot;</a>
-LICENSE = &quot;MIT&quot;
-SECTION = &quot;devel/python&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489">&quot;file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489&quot;</a>
-
-SRC_URI[md5sum] = &quot;05d66f2eb7ce2c2d702e86bac24bf9e4&quot;
-SRC_URI[sha256sum] = &quot;54da7e92468955c4fceacd0c86bd0ec997b0e1ee80d97f67c35a78b719dccab1&quot;
-
-inherit pypi
-
-RDEPENDS_${PN} &#43;= &quot;\
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-shell \
-&quot;
-
-BBCLASSEXTEND = &quot;native nativesdk<a class="moz-txt-link-rfc2396E" href="mailto:diff--gita/meta-python/recipes-devtools/python/python3-isort_4.3.21.bbb/meta-python/recipes-devtools/python/python3-isort_4.3.21.bbindex755b3e2f2..e0b21ab55100644---a/meta-python/recipes-devtools/python/python3-isort_4.3.21.bb&#43;&#43;&#43;b/meta-python/recipes-devtools/python/python3-isort_4.3.21.bb@@-1,2&#43;1,17@@-inheritsetuptools3-requirepython-isort.inc&#43;SUMMARY=">&quot;
diff --git a/meta-python/recipes-devtools/python/python3-isort_4.3.21.bb b/meta-python/recipes-devtools/python/python3-isort_4.3.21.bb
index 755b3e2f2..e0b21ab55 100644
--- a/meta-python/recipes-devtools/python/python3-isort_4.3.21.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-isort_4.3.21.bb
@@ -1,2 &#43;1,17 @@
-inherit setuptools3
-require python-isort.inc
&#43;SUMMARY = &quot;</a>A Python utility / library to sort Python imports.&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://pypi.python.org/pypi/isort">&quot;https://pypi.python.org/pypi/isort&quot;</a>
&#43;LICENSE = &quot;MIT&quot;
&#43;SECTION = &quot;devel/python&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489">&quot;file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489&quot;</a>
&#43;
&#43;SRC_URI[md5sum] = &quot;05d66f2eb7ce2c2d702e86bac24bf9e4&quot;
&#43;SRC_URI[sha256sum] = &quot;54da7e92468955c4fceacd0c86bd0ec997b0e1ee80d97f67c35a78b719dccab1&quot;
&#43;
&#43;inherit pypi setuptools3
&#43;
&#43;RDEPENDS_${PN} &#43;= &quot;\
&#43;    ${PYTHON_PN}-datetime \
&#43;    ${PYTHON_PN}-shell \
&#43;&quot;
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

--------------1528985411B3BDE153F4DDBA--

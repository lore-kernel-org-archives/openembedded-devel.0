Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.75])
 by mx.groups.io with SMTP id smtpd.web10.8573.1591916656166298423
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jun 2020 16:04:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Stx27Tso;
 spf=pass (domain: windriver.com, ip: 40.107.243.75, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jh3OlioWKD7GJkwHXW9FBnftk/6HuV9inyEyMDokz4HYdIx6NooJaOniVjqAodcingrTIP0zpO2LYJCZii0QefzLpUc8vTz8TY2UR4npMO3Ki1lGjemXyiq0QmFzZIeF54FwGJuARoA7v8kSGl4HaTs7tq/6FRrgWBT+38fNpX7HyWjgOu+TaAX/VLO9flJ/mGobj5AK/51iDOCb4edAS0B4rvSt72XCRihTIr03QGizZ5hUpwezj81oDQ21PAJXFLVnOzRtFlmN1sprSYg+/lNfneouKZU+e38Ikez5hhDyvW5NedMn/os/wT2WBf3uk7Lbp83nuGDQQMHM0+I2gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aDuEx3wL4CAcnpKKHFYJ+PBNl2F3rrQO++lEDyrxBlI=;
 b=nKVwUPUYSTvv5+SCex/VZRVXCZrtpYbRprCv7U4MbxrwEj5j/L7xpBftjUq0yO8JZiemlBaBtjqTCR/thugWySairOJotsil7YYOIao17N9S8JnBhwagionKdd3lyYQ0tZc8QoHb0ffZALuIm1DK5aWKVNsoJBumB5BDHxe0d2/BALEJdEZTZaRvwGKAywEVY21mM5SnPLZLFRZVfwTrCOjNO9XTt3dnVLrgBPD72CqAZIJsigXoji9ykp75tubC/czgJdRHx/0QUzHiDnjARJZA/TZoXzv4ms7x3jj3XeidlUWsH5qXE94ivGhB/cr/z+mN3fRKnyA9NCNqMjUUvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aDuEx3wL4CAcnpKKHFYJ+PBNl2F3rrQO++lEDyrxBlI=;
 b=Stx27TsohLdDjxD1dAWmRvPrYsQq/L5RorLvFn8ZHS//iuJPW3mjIVjZVlQqHAf7LlJRihPIQfecf3OcictyW3jVDVz0+6L7rYgXmIA59RLAsANrAWBev5EAQcSGqatFuubOdAXSjNyOg1GiPYEqGutPuYw0NLEjoJsqFDfpDio=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB3955.namprd11.prod.outlook.com (2603:10b6:405:82::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.21; Thu, 11 Jun
 2020 23:04:15 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3088.021; Thu, 11 Jun 2020
 23:04:15 +0000
Subject: Re: [oe] [meta-python][PATCH 5/7] python3-ply: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200611090904.29772-1-leon.anavi@konsulko.com>
 <20200611090904.29772-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <b8b380ef-efe6-dab7-b715-f4216891a417@windriver.com>
Date: Thu, 11 Jun 2020 19:04:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200611090904.29772-5-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0153.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::32) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0153.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.21 via Frontend Transport; Thu, 11 Jun 2020 23:04:14 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f197800-bec6-46bc-84f9-08d80e5bc2ea
X-MS-TrafficTypeDiagnostic: BN6PR11MB3955:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB3955F8DD16AC206CB85149799F800@BN6PR11MB3955.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:221;
X-Forefront-PRVS: 0431F981D8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qBQOJOnsda5iqSZ3nt370wkgh6rNSXf7CTXI9LhimPCAe9DKBKxSjRnB6LfEIcjLbMV74X6TiS/j8ECUfm/0N4ACXTFl4m1CALCC8ae5g4rCnSqVPXfqB5bbG0nyMMGfdTM9lpQxFFJbQiSlSGwb+5mFEirvF1OOYn4GKp9mHnAzxNP4qLrqGwyMLkj++mD2LLtZArSR/JzsLB9sglpV1haCTHwONzJ2w/Lid5QeRqqYtu+4xgGCwm5IbNUjRDefoZMB5bsaS2tWT/TbxZiFvTsZnQMWA9NgIAVytuUnCNH+EeGJFYfdUtoW5vSu4tg5WWqfZ6sTkIkfh9Ag1A2KHS7jpMn4g2cEbk1FGeMFc0tSiDCzQpC1W+cHBBHYBhGFSgynlQcndTWrmTozu5n3NhSXTJ71z4kTxKuDclWdwGyYNghn+CUx40b+keiBt7SUM/L94dnYagKvamKi7NdAxw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(396003)(39850400004)(376002)(346002)(366004)(66946007)(2616005)(36756003)(66556008)(66476007)(44832011)(956004)(316002)(83380400001)(31696002)(166002)(16526019)(5660300002)(26005)(52116002)(2906002)(16576012)(33964004)(186003)(53546011)(86362001)(966005)(8676002)(8936002)(31686004)(6486002)(478600001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	2f9OL7FI19HAYltbfUn+1dREYxItFHI/J0AbOcucCBBrak4TSkudXzlRYeM8dyJcr1gvMeCXQtJDFKvJCn1kEJorj40cm/1d3RLBvGFbEWUyPrT08TmnPr1AjgRsumLBPeRUeAfBApJgdIhlb9ffGJySRCHBvxP/J0+JA6VErVTM+XZjtCpBmBalz5Fk8Bck1LgQHCqmNOKH40Eejl3PBj4oXw2X9YT4lqrEiNXh9oFGaQAY2BNWiLtOY/kWhde4QEhmdWy0UnVpDySJ05jbKBme0GM78fzTmTPjmOzcHZIBygyMpGZWgE9qn482j0YeLlfqnKB4I5SUI/Al8+GyitdC/bXS8WfefGRLK7h9uYLuz1SlIntR5YzZCZKPTS/cV8GU1Hx3DS3eHSIHJFoDaTdQkuZJ65PryH+XbkOuUq+KdMEyrdf5Hhqgm9kM8YTPkeITgubL8HcJVjDXVewioMnbmPoRVpGWY5LgZhNnQ3Rjzp+UUnq3ppSq37Gwc6C1
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f197800-bec6-46bc-84f9-08d80e5bc2ea
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2020 23:04:15.0046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rdb88pRqQrig9zAdrgIHPA9EYVnVmhcR/um7fTt9sQuBWNWlKvBjd2Tcf+ViSKNYwExlFfdCVwaQtWjWdG0uBvJ7WN3MOc5LhAk18RpRK4c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3955
Content-Type: multipart/alternative;
 boundary="------------8602C81F3346D02895130141"
Content-Language: en-US

--------------8602C81F3346D02895130141
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/11/20 5:09 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python-ply.inc    | 18 -----------------
>   .../python/python3-ply_3.11.bb                | 20 +++++++++++++++++--
>   2 files changed, 18 insertions(+), 20 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-ply.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-ply.inc b/meta-python/recipes-devtools/python/python-ply.inc
> deleted file mode 100644
> index 149fe058f..000000000
> --- a/meta-python/recipes-devtools/python/python-ply.inc
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -SUMMARY = "Python Lex and Yacc"
> -DESCRIPTION = "Python ply: PLY is yet another implementation of lex and yacc for Python"
> -HOMEPAGE = "https://pypi.python.org/pypi/ply"
> -SECTION = "devel/python"
> -LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://README.md;beginline=5;endline=32;md5=f5ee5c355c0e6719c787a71b8f0fa96c"
> -
> -SRC_URI[md5sum] = "6465f602e656455affcd7c5734c638f8"
> -SRC_URI[sha256sum] = "00c7c1aaa88358b9c765b6d3000c6eec0ba42abca5351b095321aef446081da3"
> -
> -inherit pypi
> -
> -RDEPENDS_${PN}_class-target += "\
> -    ${PYTHON_PN}-netclient \
> -    ${PYTHON_PN}-shell \
> -"
> -
> -BBCLASSEXTEND = "native"
> diff --git a/meta-python/recipes-devtools/python/python3-ply_3.11.bb b/meta-python/recipes-devtools/python/python3-ply_3.11.bb
> index 72410baeb..3aa010fac 100644
> --- a/meta-python/recipes-devtools/python/python3-ply_3.11.bb
> +++ b/meta-python/recipes-devtools/python/python3-ply_3.11.bb
> @@ -1,2 +1,18 @@
> -require python-ply.inc
> -inherit setuptools3
> +SUMMARY = "Python Lex and Yacc"
> +DESCRIPTION = "Python ply: PLY is yet another implementation of lex and yacc for Python"
> +HOMEPAGE = "https://pypi.python.org/pypi/ply"
> +SECTION = "devel/python"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://README.md;beginline=5;endline=32;md5=f5ee5c355c0e6719c787a71b8f0fa96c"
> +
> +SRC_URI[md5sum] = "6465f602e656455affcd7c5734c638f8"
> +SRC_URI[sha256sum] = "00c7c1aaa88358b9c765b6d3000c6eec0ba42abca5351b095321aef446081da3"
> +
> +inherit pypi setuptools3
> +
> +RDEPENDS_${PN}_class-target += "\
> +    ${PYTHON_PN}-netclient \
> +    ${PYTHON_PN}-shell \
> +"
> +
> +BBCLASSEXTEND = "native"
>
> 

--------------8602C81F3346D02895130141
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/11/20 5:09 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200611090904.29772-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200611090904.29772-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python-ply.inc    | 18 -----------------
 .../python/python3-ply_3.11.bb                | 20 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;--
 2 files changed, 18 insertions(&#43;), 20 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-ply.inc

diff --git a/meta-python/recipes-devtools/python/python-ply.inc b/meta-python/recipes-devtools/python/python-ply.inc
deleted file mode 100644
index 149fe058f..000000000
--- a/meta-python/recipes-devtools/python/python-ply.inc
&#43;&#43;&#43; /dev/null
@@ -1,18 &#43;0,0 @@
-SUMMARY = &quot;Python Lex and Yacc&quot;
-DESCRIPTION = &quot;Python ply: PLY is yet another implementation of lex and yacc for Python&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://pypi.python.org/pypi/ply">&quot;https://pypi.python.org/pypi/ply&quot;</a>
-SECTION = &quot;devel/python&quot;
-LICENSE = &quot;BSD-3-Clause&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://README.md;beginline=5;endline=32;md5=f5ee5c355c0e6719c787a71b8f0fa96c">&quot;file://README.md;beginline=5;endline=32;md5=f5ee5c355c0e6719c787a71b8f0fa96c&quot;</a>
-
-SRC_URI[md5sum] = &quot;6465f602e656455affcd7c5734c638f8&quot;
-SRC_URI[sha256sum] = &quot;00c7c1aaa88358b9c765b6d3000c6eec0ba42abca5351b095321aef446081da3&quot;
-
-inherit pypi
-
-RDEPENDS_${PN}_class-target &#43;= &quot;\
-    ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-shell \
-&quot;
-
-BBCLASSEXTEND = &quot;native<a class="moz-txt-link-rfc2396E" href="mailto:diff--gita/meta-python/recipes-devtools/python/python3-ply_3.11.bbb/meta-python/recipes-devtools/python/python3-ply_3.11.bbindex72410baeb..3aa010fac100644---a/meta-python/recipes-devtools/python/python3-ply_3.11.bb&#43;&#43;&#43;b/meta-python/recipes-devtools/python/python3-ply_3.11.bb@@-1,2&#43;1,18@@-requirepython-ply.inc-inheritsetuptools3&#43;SUMMARY=">&quot;
diff --git a/meta-python/recipes-devtools/python/python3-ply_3.11.bb b/meta-python/recipes-devtools/python/python3-ply_3.11.bb
index 72410baeb..3aa010fac 100644
--- a/meta-python/recipes-devtools/python/python3-ply_3.11.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-ply_3.11.bb
@@ -1,2 &#43;1,18 @@
-require python-ply.inc
-inherit setuptools3
&#43;SUMMARY = &quot;</a>Python Lex and Yacc&quot;
&#43;DESCRIPTION = &quot;Python ply: PLY is yet another implementation of lex and yacc for Python&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://pypi.python.org/pypi/ply">&quot;https://pypi.python.org/pypi/ply&quot;</a>
&#43;SECTION = &quot;devel/python&quot;
&#43;LICENSE = &quot;BSD-3-Clause&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://README.md;beginline=5;endline=32;md5=f5ee5c355c0e6719c787a71b8f0fa96c">&quot;file://README.md;beginline=5;endline=32;md5=f5ee5c355c0e6719c787a71b8f0fa96c&quot;</a>
&#43;
&#43;SRC_URI[md5sum] = &quot;6465f602e656455affcd7c5734c638f8&quot;
&#43;SRC_URI[sha256sum] = &quot;00c7c1aaa88358b9c765b6d3000c6eec0ba42abca5351b095321aef446081da3&quot;
&#43;
&#43;inherit pypi setuptools3
&#43;
&#43;RDEPENDS_${PN}_class-target &#43;= &quot;\
&#43;    ${PYTHON_PN}-netclient \
&#43;    ${PYTHON_PN}-shell \
&#43;&quot;
&#43;
&#43;BBCLASSEXTEND = &quot;native&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------8602C81F3346D02895130141--

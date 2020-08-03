Received: from NAM04-SN1-obe.outbound.protection.outlook.com (NAM04-SN1-obe.outbound.protection.outlook.com [40.107.70.62])
 by mx.groups.io with SMTP id smtpd.web11.6911.1596491749679070282
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2020 14:55:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=LqAleOtS;
 spf=pass (domain: windriver.com, ip: 40.107.70.62, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EW61O0dLCTulda10674KEUVdds6zS+CQ1ujomx2BfsFPe1c1ePPzXm/MjRGjAQRDF6QOgOgKQOttt+GZR7LGb1u4Jy4gKrrG73FT40IBRYEal2aZcffEC/jE95+/Fqe45xAd424DrAUAf2XoU7U8ETLi0SM2XrX47T7aS8J8cqmmbU2UUn4jd7/KipxCPZyqVpUR2V3b3p+RtxfcMcIaCvOn6qp8PSwnQ1q+FNdwWsRKepODeGpqNHeUp8fLXeAfDqL1uI/2DszEo2rG/KKb6NHAaAVAH+JZWRQ5E0sJAZripzZh0tv8yZ/eGpg18LZ8DzU+ugkXloRnGhFmK1P2dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7cdTTtotnj/Dkq3UJUamZ+wmKNxt9uaz82+/lrHSBvU=;
 b=G9w098gehx9H0T70uzPTcBr/gcWs1YuwWRrnnDPrxRLEoqt+12doSzv2+e0J13Z0BjRaawR2GluCwByaEbHXW4vSi07rjhCD/Vxv9W7vhwD65trBfd1F/+v7SFE1USHr9VG4KhDWPRpCdlsnCUUADrRsrgM8yl6P54CpUQsK1OMCQVvp0KApqv+rPjNG9jiRbLGBgM5/Ti3ftY1vHRCxcdThCbsFyafIlpcgHThtrYyo787jkIo3Vdr6YFOuHWyf7OAOk73x4bvSmDYZcih88CsarujSC4V02VpqdQSoWXNCvrLckkrgZ/9uv0WWYMg64rxrQsk+TR2oKuh+O3WE6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7cdTTtotnj/Dkq3UJUamZ+wmKNxt9uaz82+/lrHSBvU=;
 b=LqAleOtSs+N7QQ6efz9Qi13Z97fIGMIKxTbbGa17L/iSkdwjlZIMFklvsGKjkcfKTlbY4H2Jsto1wA6fpTeN65Z82ZPQICQKxENS9n5HbvgczP5ihmMLfNfU4Htffet+dSrYxlOdVB7qkBBHhO1ORgGLO/S7vbSTm8uVwTv/Co8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3352.namprd11.prod.outlook.com (2603:10b6:a03:1d::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.21; Mon, 3 Aug
 2020 21:55:48 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3239.021; Mon, 3 Aug 2020
 21:55:48 +0000
Subject: Re: [oe] [meta-python][PATCH 12/15] python3-cffi: Upgrade 1.14.0 -> 1.14.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200731132230.20031-1-leon.anavi@konsulko.com>
 <20200731132230.20031-12-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <3c1ce30f-9ac2-4cf2-85aa-1a02136dc96e@windriver.com>
Date: Mon, 3 Aug 2020 17:55:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200731132230.20031-12-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0128.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::7) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0128.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.18 via Frontend Transport; Mon, 3 Aug 2020 21:55:48 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1535dfd5-ff27-42f1-068c-08d837f7fb30
X-MS-TrafficTypeDiagnostic: BYAPR11MB3352:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB33523F8352AA79C9D45452859F4D0@BYAPR11MB3352.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:227;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZbltIyRKcAkmQTTLkHPPHnCn/036xchj77sjTzPIP7crMTUOvn/fFdyCJ7G5SgH4t/+BwyhqBpmjSimXN3NX6i17roVpQoJjk8t+3oCKq+brfNRfz8cQs9k2wd1BW4n9ZZQsJozDFgFhYTBAhGvhLGZ43aKPvXVaiB53JNKqDDDs9dqopkhTXLJclOPWJeS89dSRBKePiMt7R67LH2iz9JObbKJXlWzWgUcNeztBHvKgm+oQcEAfmkPDGFR6Ul9RJ2jOgCsmRvoRyb1r1j0AooQOCiYUy98zYB0eydVWmVbOIQVlRlMg78pZcnKO0nBXJOaj++t6sYrj+TNPJyptPHElbUndboX/TO3azh9osThdEe6qjR8tk5cVPxK7RhNt+hywoxvxgWHu0nCFOWUTvQpiW+5lLpPcB3ASfLtnBY0I7mFpgkHQVqkvsvgVw9VXmzPnVPG+k7gF3H8XHamUjQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(39850400004)(346002)(376002)(396003)(366004)(478600001)(166002)(33964004)(66556008)(66476007)(52116002)(31686004)(66946007)(316002)(16576012)(966005)(44832011)(2906002)(53546011)(36756003)(8936002)(86362001)(5660300002)(8676002)(31696002)(2616005)(83380400001)(16526019)(186003)(26005)(956004)(6486002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	KMQKGbzmwWFSb0yS2z+to3Hhv0JLgsVti/UaHEzjUKQjrSPkxHGJOqStlbtIpivVz4gfaDLIVFKCiap0epWLK+5EfHGxLHHpXa59ZipTfwo87eFTKgBOfpi7g1C76hQnOC+ZGeFzT0PsXUFxOQvf/4wMuZOrisIpcXyUkzGtu1GdsmFqYTxE+k1hpib5xL+/xXm8hc12o3uAdipC+wRmuXt4DAJZmFtaho6IHcFr154GTU5alvlI4Usb4Ygq0oN8w0O7zA8ohVtoLpojycYlAwWg5EAi2ELvwioP2bvlIUWv8BCmYQT8iN/J5cVH0inCR0BfKHP1gWCMpi0NYC3KbUmCDbJX+RUtMWJx6sM14mHpl3UMh2CCweRRz7L+2BFOemIh61rcPBHGCFUfFPzh92GGk1aAcD8DPlTp1uahiqw5dVi/pFJ027dYkJTgTFne7muyfhOlIfkIZg2ddhKJ9fS4rljprHgeX+ouUlHSGfy5KkASeQIhA1oq9dRrHAot+uTR53mf9yOMNm/MhZOdRrLh4G2PI/4wL8/jivgdekFNNkuSWSIqoIxaWU24BOQsl0C3gmghEihFH4mfdRPiWdxeK0Wm5K0BmDTaWltO4BzQkbiCcUCDg0ccFU/tqiqTTnxVT5GOh6w4qggkf7BR+w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1535dfd5-ff27-42f1-068c-08d837f7fb30
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2020 21:55:48.5392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9h9uB74/wdWQCm6F1qRlu7hSEk6jf8Xwc6BIYpqs8qvyp7yhkDuAuTBMM1BUEeOBozGfhYRSU1hOnpTdSkTzZNB3RW7rTtdUML9W3n1FvEQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3352
Content-Type: multipart/alternative;
 boundary="------------0EE9E91D992C57E284108E63"
Content-Language: en-US

--------------0EE9E91D992C57E284108E63
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/31/20 9:22 AM, Leon Anavi wrote:
> Upgrade to release 1.14.1:
>
> * CFFI source code is now `hosted on Heptapod`_.
> * Improved support for ``typedef int my_array_t[...];`` with an
>    explicit dot-dot-dot in API mode
> * Windows (32 and 64 bits): multiple fixes for ABI-mode call to
>    functions that return a structure.
> * Experimental support for MacOS 11 on aarch64.
> * Other minor changes and bug fixes.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-cffi_1.14.0.bb => python3-cffi_1.14.1.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-cffi_1.14.0.bb => python3-cffi_1.14.1.bb} (75%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-cffi_1.14.0.bb b/meta-python/recipes-devtools/python/python3-cffi_1.14.1.bb
> similarity index 75%
> rename from meta-python/recipes-devtools/python/python3-cffi_1.14.0.bb
> rename to meta-python/recipes-devtools/python/python3-cffi_1.14.1.bb
> index 53c8ee265..59b99dd71 100644
> --- a/meta-python/recipes-devtools/python/python3-cffi_1.14.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-cffi_1.14.1.bb
> @@ -4,8 +4,8 @@ LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf"
>   DEPENDS += "libffi ${PYTHON_PN}-pycparser"
>   
> -SRC_URI[md5sum] = "74845f8d2b7b583dd9a3574f402edf39"
> -SRC_URI[sha256sum] = "2d384f4a127a15ba701207f7639d94106693b6cd64173d6c8988e2c25f3ac2b6"
> +SRC_URI[md5sum] = "1dac3d20d5602829dfaa7026658b7795"
> +SRC_URI[sha256sum] = "b2a2b0d276a136146e012154baefaea2758ef1f56ae9f4e01c612b0831e0bd2f"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------0EE9E91D992C57E284108E63
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/31/20 9:22 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200731132230.20031-12-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.14.1:

* CFFI source code is now `hosted on Heptapod`_.
* Improved support for ``typedef int my_array_t[...];`` with an
  explicit dot-dot-dot in API mode
* Windows (32 and 64 bits): multiple fixes for ABI-mode call to
  functions that return a structure.
* Experimental support for MacOS 11 on aarch64.
* Other minor changes and bug fixes.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200731132230.20031-12-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-cffi_1.14.0.bb =&gt; python3-cffi_1.14.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cffi_1.14.0.bb =&gt; python3-cffi_1.14.1.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-cffi_1.14.0.bb b/meta-python/recipes-devtools/python/python3-cffi_1.14.1.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-cffi_1.14.0.bb
rename to meta-python/recipes-devtools/python/python3-cffi_1.14.1.bb
index 53c8ee265..59b99dd71 100644
--- a/meta-python/recipes-devtools/python/python3-cffi_1.14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cffi_1.14.1.bb
@@ -4,8 +4,8 @@ LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf">&quot;file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf&quot;</a>
 DEPENDS += &quot;libffi ${PYTHON_PN}-pycparser&quot;
 
-SRC_URI[md5sum] = &quot;74845f8d2b7b583dd9a3574f402edf39&quot;
-SRC_URI[sha256sum] = &quot;2d384f4a127a15ba701207f7639d94106693b6cd64173d6c8988e2c25f3ac2b6&quot;
+SRC_URI[md5sum] = &quot;1dac3d20d5602829dfaa7026658b7795&quot;
+SRC_URI[sha256sum] = &quot;b2a2b0d276a136146e012154baefaea2758ef1f56ae9f4e01c612b0831e0bd2f&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------0EE9E91D992C57E284108E63--

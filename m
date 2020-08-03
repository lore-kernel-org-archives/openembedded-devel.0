Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.54])
 by mx.groups.io with SMTP id smtpd.web10.6837.1596491706461909290
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2020 14:55:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=J03eJSU2;
 spf=pass (domain: windriver.com, ip: 40.107.223.54, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eNI05Y+Xq4rTSaRPlGHNjIUcVUtSslctVgbyqnt4tZsI1BE7TM3YGNGiKhCC3PpHIt7OVbcoYVR+mZngs6BcHq3+A9HdtfvSQSyyMW+grV+JDhqwA4JYVdBGFGcO0MIWhLAjU2z+DDiVYMqlpQF+N3LQa0FtC669HK/NKY/yYvZsh3pgNGT9OnQx5X2rw1/yp2cYUdtCEt4b5mtrpo8DLpvHOsVPERzvM6Xuw5n2akHZypeVvdGfb7bCJI/klz4/Fa4+WxA4+TWiTEfG8o3uev4NgJYqWTlNpMr1xvx0/iQlgWhEXBzjCc8f51u/Oq4GwwWPRSaG2+jbxGZV7ym2XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HXS8dfYENlZaFoMlrGI+YdG4XfH8Hly5PRLQ5KqmYVc=;
 b=PZk0uGiP6AkCsTUZGVfwZAE+v+C+XQivTC59doX40+j/V3IubUCncvZVirT+mgdrdJMCmDS7YHcjGQvI4E241a/45Xjb9oRPdQ9xFk4LoMoeOdN7KO9zkb1ztIxDCSb4k+mT92pnpQ8MCCY8JvIOEdL2zXGUA/Qm/AVAFqxOqsKtac6RJpZBqvsa7P5/1M7TIlczz/Y5GcVg02o/1WKYGO6iWr0+u4eqn8aTRxXtYxw6NjQCx9ddoaKT1f1uW0oDGCJ9RaiDCQqwOIzAMka51NYbDQp9/M145FCt1NqKywpXKdZ1rpv5JbEwBwEajFrrGxfE5EjvzqEsKdadzkOi9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HXS8dfYENlZaFoMlrGI+YdG4XfH8Hly5PRLQ5KqmYVc=;
 b=J03eJSU2bA2UJwBb+hzNVJyKdZ/uQs0iSbUzfR99v+72egQ8Z80YYKiSPE0HACyZdzbkhiW48Mk4rLYfJ+5JTBe7CSqPLK+d+Q3+i0+XDU5RRZF34RapCKQGkmXnQMRPyX01K3VMv9Th01/TBsfFqs6xb04OgkHgg4y5WNvqr/U=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4151.namprd11.prod.outlook.com (2603:10b6:a03:18f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17; Mon, 3 Aug
 2020 21:55:04 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3239.021; Mon, 3 Aug 2020
 21:55:04 +0000
Subject: Re: [oe] [meta-python][PATCH 09/15] python3-cbor2: Upgrade 5.1.1 -> 5.1.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200731132230.20031-1-leon.anavi@konsulko.com>
 <20200731132230.20031-9-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <b4561a84-ab30-30e3-20e9-8b26587f3e47@windriver.com>
Date: Mon, 3 Aug 2020 17:55:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200731132230.20031-9-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0142.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::21) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0142.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17 via Frontend Transport; Mon, 3 Aug 2020 21:55:03 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f572293a-7786-4504-2ba1-08d837f7e0d0
X-MS-TrafficTypeDiagnostic: BY5PR11MB4151:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4151C37F63045394C38A447C9F4D0@BY5PR11MB4151.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:187;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9XRrI9G64ygvHIxZFNjdcq/0/d1r2/PD0pKhZaGhnzsBQui45VEc1MiWb5WcKZNXplneSzYReSt0tzG82404Sy2zq9sqmwQ3OXynm5CLDj1IL8zc3Pjarh5T91SURF2RW84W95oXikjZ6KM/FicsthrAvXsdtMrvLRwxp0e8PS8u+iCvVh6XPB8GXZy4w+AojQXH1OqUJMuY5EYJlVYgNIAzD7o4i/fuzCu5RquKba3hDvyfMPamM/jUUn+2DN6GW+NfyRguXS6nLnpAbGzcLYxi0gWVhiHdA0Dsa/kDuGIjrUfGimpT8Y7L6i6hi0ekIKsgTMbZs84nebpL35SC52ii7GJSWqv95sg4gODQNa8129FHiX1HRaAPIIe1ApprSdEDzgkQCeHnUR9VWqkF/S44jwtUdyYbR6DXY3RLFfzyAC1KYUmOjpe/Fp8ZU5TQJMdJRBe24Nn5iBb/7cLukg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(396003)(136003)(346002)(366004)(376002)(36756003)(16526019)(2906002)(26005)(966005)(478600001)(186003)(86362001)(31686004)(16576012)(83380400001)(5660300002)(53546011)(166002)(2616005)(66556008)(66476007)(956004)(44832011)(33964004)(31696002)(6486002)(8676002)(316002)(8936002)(66946007)(52116002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	coXqwp96Y8ORhGf8qrsXwr/g0huVz81gWEltQzW7xCL52ybfHWtrcX0HvMJZpkXf8maBqVm06MwbH3yr/+jpxI9aV/ElyNv/UPQCGpSWw1eCnW/mIu5fRi8qn/J27UfAvi9DtvJJQRvH8iomk+gLDpnm71K5IXClUEHbF2hSLNO1fN6FjNeXilHrmZZSzqbyS67NPH1hW6hbkMb1QXkYdh4wpMJstDUd+joxizBhZzN/vDrVVZvIcrtBwu+ZTrCOgx0jMLfomTtGbWMfXvbI7mEhihypuZ5r62T7+Wf2UCtA5S90VG3CDoGQqaexkBzL6eRDQA5HTO2Tc5w/Krkytfk66KJz51U7vRLORPBB2TjRwYIKUi4DVh/wnX+ohZ9YFFg3ZHAy9mFHsvCvAFQ/9cbqb5019GdLVURRGNoTAbNdHfpq16WnF3IiMSEwpabfWzKuNyWLfCZlgJtsl0v11OZZ+2dR3x7zjiBV6NivgdcGpMNIHZOOiNJxZN6GioSdNPZCNi7bK5YELmf+0xBZL/DAvdzQmjqwTeqaTj+ryL+8s7qAdwt82KlGO3wdFUaNkja0MYBbjF57PlA5fQiI0gSc+lIkVCkoAGs6JXiG+a8K8R7Lvcn+8Wr8ljhXXvIsOYzU+cdC3kS6r1pAvVcbGA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f572293a-7786-4504-2ba1-08d837f7e0d0
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2020 21:55:04.2773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5C+uu38bYJHA0iyV4mB+cdpX3ZX1JRMVY7dljSVlsX7kn0I/iJqrmJcpRkAd0ABzhapCUTRWHD4WWHFEH+c3fgHxauAyNYGueUuU0I88RHg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4151
Content-Type: multipart/alternative;
 boundary="------------FEF7C03FC270FDEEBC1F0266"
Content-Language: en-US

--------------FEF7C03FC270FDEEBC1F0266
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/31/20 9:22 AM, Leon Anavi wrote:
> Upgrade to release 5.1.2:
>
> - Bugfix: Refcount bug in C lib causing intermittent segfaults
>    on shutdown
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-cbor2_5.1.1.bb => python3-cbor2_5.1.2.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-cbor2_5.1.1.bb => python3-cbor2_5.1.2.bb} (81%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-cbor2_5.1.1.bb b/meta-python/recipes-devtools/python/python3-cbor2_5.1.2.bb
> similarity index 81%
> rename from meta-python/recipes-devtools/python/python3-cbor2_5.1.1.bb
> rename to meta-python/recipes-devtools/python/python3-cbor2_5.1.2.bb
> index 6b26da2a6..c65be7226 100644
> --- a/meta-python/recipes-devtools/python/python3-cbor2_5.1.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-cbor2_5.1.2.bb
> @@ -4,8 +4,8 @@ DEPENDS +="${PYTHON_PN}-setuptools-scm-native"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
>   
> -SRC_URI[sha256sum] = "09e9607ea50e2ebb718791d475f11620cb244b0cc3758ce2e76cf36e8372ad64"
> -SRC_URI[md5sum] = "b034d7edfd22c1f98e600aaedbd90f39"
> +SRC_URI[sha256sum] = "91759bd0ee5ef0d4fa24144dfa551670730baeca8cf2fff1cc59f734ecd21de6"
> +SRC_URI[md5sum] = "693c1bd6635bee8a591a70ea924ad676"
>   
>   inherit pypi setuptools3 ptest
>   
>
> 

--------------FEF7C03FC270FDEEBC1F0266
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
    <blockquote type="cite" cite="mid:20200731132230.20031-9-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 5.1.2:

- Bugfix: Refcount bug in C lib causing intermittent segfaults
  on shutdown

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200731132230.20031-9-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-cbor2_5.1.1.bb =&gt; python3-cbor2_5.1.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cbor2_5.1.1.bb =&gt; python3-cbor2_5.1.2.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-cbor2_5.1.1.bb b/meta-python/recipes-devtools/python/python3-cbor2_5.1.2.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-cbor2_5.1.1.bb
rename to meta-python/recipes-devtools/python/python3-cbor2_5.1.2.bb
index 6b26da2a6..c65be7226 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2_5.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cbor2_5.1.2.bb
@@ -4,8 +4,8 @@ DEPENDS +=&quot;${PYTHON_PN}-setuptools-scm-native&quot;
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10">&quot;file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10&quot;</a>
 
-SRC_URI[sha256sum] = &quot;09e9607ea50e2ebb718791d475f11620cb244b0cc3758ce2e76cf36e8372ad64&quot;
-SRC_URI[md5sum] = &quot;b034d7edfd22c1f98e600aaedbd90f39&quot;
+SRC_URI[sha256sum] = &quot;91759bd0ee5ef0d4fa24144dfa551670730baeca8cf2fff1cc59f734ecd21de6&quot;
+SRC_URI[md5sum] = &quot;693c1bd6635bee8a591a70ea924ad676&quot;
 
 inherit pypi setuptools3 ptest
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------FEF7C03FC270FDEEBC1F0266--

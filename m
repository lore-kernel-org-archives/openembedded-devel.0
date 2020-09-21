Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.60])
 by mx.groups.io with SMTP id smtpd.web10.44830.1600701726704854436
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Sep 2020 08:22:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=JF/co5iZ;
 spf=pass (domain: windriver.com, ip: 40.107.236.60, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AgnN997dZHy7WwxhVF9phZ6o4KCvshRQmm6CVvbVnz7GwNNq8rJf7PZ0FbYFyHbfBDFdg1Z0Nos/rr4HfBk5OFZ9cLRDYZRlkkbtlSJHaI6YKG6y9qToqexaOx5kERRw9fUUoUghAYluHH82wGKP7KzO4XW5KNliasbWYkADhVa0XWrZ5S0zr+ZlPt8yFbnbkpJmeIO5vEiPpXA/fjoarCT0nNiLgl20A0yMx/q3c/exYlLBqvyGlbgAoH3msMF0B2bFHVIGnwEb+qVhv/B3o63IIKZneiCwAFwsv3A0tMVq+XOrPORI9I3MSdFHFuE0k1iIgccsM/osYPG2Xf2l1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F8NSIQZr5OQb7apVQjb6oH2dm3YpvRh5GcruUB2K94I=;
 b=eYwv130JSLVQpsNc/ubQAChcrReK6ZxhQnjp9su5PBdm5AtVq8qOCFIus3t2nyAT+/wjtWcdBmz4ewyPg1SUEOqDvp2rD1beAPoHXJ967BERNAyxWiLaPlivRvDAaxbVTx499G2ECDfNcD9ySUHwRP+7D/KUCuJwDymjTM/HYZRdGz4lS6AOWCDmK79NgU6BrY01t4BWxLDCAFm/syZctUWAEzeRngiyA0fas1zzdiPTBRg83b+NC2fSkShqh4yvslXz2f/mdfWGDt7v5Zq9RW78K8LrGN1rzdSm6urkPah5w3iHEv5WfbTFz5bbiX2mEZJb/DOvuVSkpDGExk69og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F8NSIQZr5OQb7apVQjb6oH2dm3YpvRh5GcruUB2K94I=;
 b=JF/co5iZKk4insqXi3+vgO7OVTnZbfr1F+mh0QVK+1u0puz1pD44yLJpcVGVy9n+2c424PHc43uKOCrFzbWoJF0dU4cqsPdH73yDEd+u0EVZsbS7TdMHlVTyJsdq+3KI4t3kiRp9Nb0RjJ/+BYQujPHSX5sTIdn+gHpsJgPIytw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4307.namprd11.prod.outlook.com (2603:10b6:a03:1bd::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Mon, 21 Sep
 2020 15:22:04 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3391.026; Mon, 21 Sep 2020
 15:22:04 +0000
Subject: Re: [oe] [meta-python][PATCH 1/2] python3-langtable: Upgrade 0.0.52 -> 0.0.53
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200916092133.11861-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <94242b9d-35a8-3765-d923-5950ef292167@windriver.com>
Date: Mon, 21 Sep 2020 11:22:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200916092133.11861-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0103.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::12) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0103.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14 via Frontend Transport; Mon, 21 Sep 2020 15:22:03 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c87da37-a701-41d0-960d-08d85e4217e9
X-MS-TrafficTypeDiagnostic: BY5PR11MB4307:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB43072D11F058273264441E9E9F3A0@BY5PR11MB4307.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:202;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ypTgRBLMtk+EDgVatZZrE8eqpK5c9VzlZ3hUN+UxYHd0a8ach63do+xNyUlfmYpWEwdXBwfnK7ewUQrQu5SIEywjInMF7DZG41lmAuXwymJi6cojirpHAsBBoyCNhWWt13hO2YcKtYdfU+xWTcmhi//WGrijY1T4eQeCOJjLbkq2+viztEh9XgkqzBW+N73AdZUqOeIcFDDU1WkUu52gYuagBSI8+eP/ClzJnVdVKujqkgNvX5Tx9+RpWTDuUKjJkkJcqmfv/KeiMOjzg/ZyH5x+p1IVjJur6GFiXMnqy4gDAsz3WCWKMZGuZ66XNDdq9g9h3yHPjIXOqpf07DT3Uw5olsu+j94RuqxR6rjPxQOAORxQr2K3DByTXcEZnuhIq4rDbGtTWrLzRr/UUU9o0w2bABURkSTqh5MXPuyHMY5pQQ64P4yPN2AeZWmAYwBTyOM0jwyll8RyTPV4Fo3OzA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(366004)(136003)(346002)(39850400004)(478600001)(8676002)(86362001)(36756003)(966005)(44832011)(53546011)(956004)(2616005)(66556008)(66476007)(2906002)(66946007)(52116002)(186003)(16576012)(31696002)(31686004)(26005)(33964004)(5660300002)(166002)(16526019)(8936002)(6486002)(316002)(83380400001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	NdAVwi3WAqWMtphe5dlZdiXJscrh2l5ynKi+NbZuhNEjDoiVZThr4q3iWg5MhSB+1DGbznSSvx5qa2OLR4OLXAGp4Q4mJehzObHj+tmRonBsgLjBD/YNkSYcEgXYeZqQbsX8zTOUBs7VxkAswOsH1Ntpi2dOG4HT7y6ne4Gb2EHnkjHIDezH1GDCUiSHXgTbOGvdgyGGQbaistKSYZEHQDKip8Oh/4uWm0mqxPiPkeWPn0yVZ7XH4t0RRwblR7tzty+giuywOr684aBt5Erf+vb9Urww13/IZDrbhinnlgeRb88MhW7zQUvwXQz8/XHmWTb/hXWOdMgupkGqgaStHjCfvTaqE0DPfV4aBXsIk5QrtIShZivDbozvumgzUx3ZQJKWVkg1ADJSe/lvz5hq3jo7H2h34qNuDD6OeEsctMZZiU1kTpHX2m8MHxIymwS9dllWC9GUjH8DT+dUtWWNUb43XKBxvEvzWhPUNeRlSUdNz8hJESHy2yjHS/Tp+Hu3ww0HyUEH7WIKSFhQ7bJxMpFCqcEuv6wLIFd5yjlZUe/IoQdLhA4h4c/c3yHlvy9y5RZmsSHyUWA7yeXWKl9x5nPdwWPKdVf6ODX0yul8a7EgCvh6O4ySDK95b3VLSma8kFH5YzZ3ACVXNtPdrTFrhg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c87da37-a701-41d0-960d-08d85e4217e9
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2020 15:22:03.8589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i4/QGN6EFOs1JtoCIa9+sMdi8PS7ra2tBySECLs6gH1AWvxUlPCyTKDA+id+BMdQjn9ZUlXFqiCUgi0yMKTMMLwkMgp9m1KS4ArQEhmkvIo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4307
Content-Type: multipart/alternative;
 boundary="------------B576AC7F6472B166AFED5CF5"
Content-Language: en-US

--------------B576AC7F6472B166AFED5CF5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/16/20 5:21 AM, Leon Anavi wrote:
> Upgrade to release 0.0.53:
>
> - Capitalize the return values of language_name() and
>    territory_name()
> - Add more translations from CLDR
> - Get translation changes from CLDR
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...ython3-langtable_0.0.52.bb => python3-langtable_0.0.53.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-langtable_0.0.52.bb => python3-langtable_0.0.53.bb} (79%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-langtable_0.0.52.bb b/meta-python/recipes-devtools/python/python3-langtable_0.0.53.bb
> similarity index 79%
> rename from meta-python/recipes-devtools/python/python3-langtable_0.0.52.bb
> rename to meta-python/recipes-devtools/python/python3-langtable_0.0.53.bb
> index e6ccd7b54f..27b690f1a0 100644
> --- a/meta-python/recipes-devtools/python/python3-langtable_0.0.52.bb
> +++ b/meta-python/recipes-devtools/python/python3-langtable_0.0.53.bb
> @@ -6,8 +6,8 @@ SECTION = "devel/python"
>   
>   LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>   
> -SRC_URI[md5sum] = "240a62b84ed29f6530ceae60609f7eff"
> -SRC_URI[sha256sum] = "a2c499704c91c0a23e5db92e80ad1d45e51466b82ffaee478e5bb781460b3db5"
> +SRC_URI[md5sum] = "d8f99adfb184f9def22539310f97ce80"
> +SRC_URI[sha256sum] = "fb17fd4d8e491c79159f81aa06ebacb18673fce59dac96f4e9d2d2db27a2e374"
>   
>   inherit pypi setuptools3 python3native
>   
>
> 

--------------B576AC7F6472B166AFED5CF5
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/16/20 5:21 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200916092133.11861-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.0.53:

- Capitalize the return values of language_name() and
  territory_name()
- Add more translations from CLDR
- Get translation changes from CLDR

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20200916092133.11861-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...ython3-langtable_0.0.52.bb =&gt; python3-langtable_0.0.53.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-langtable_0.0.52.bb =&gt; python3-langtable_0.0.53.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-langtable_0.0.52.bb b/meta-python/recipes-devtools/python/python3-langtable_0.0.53.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-langtable_0.0.52.bb
rename to meta-python/recipes-devtools/python/python3-langtable_0.0.53.bb
index e6ccd7b54f..27b690f1a0 100644
--- a/meta-python/recipes-devtools/python/python3-langtable_0.0.52.bb
+++ b/meta-python/recipes-devtools/python/python3-langtable_0.0.53.bb
@@ -6,8 +6,8 @@ SECTION = &quot;devel/python&quot;
 
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=d32239bcb673463ab874e80d47fae504">&quot;file://COPYING;md5=d32239bcb673463ab874e80d47fae504&quot;</a>
 
-SRC_URI[md5sum] = &quot;240a62b84ed29f6530ceae60609f7eff&quot;
-SRC_URI[sha256sum] = &quot;a2c499704c91c0a23e5db92e80ad1d45e51466b82ffaee478e5bb781460b3db5&quot;
+SRC_URI[md5sum] = &quot;d8f99adfb184f9def22539310f97ce80&quot;
+SRC_URI[sha256sum] = &quot;fb17fd4d8e491c79159f81aa06ebacb18673fce59dac96f4e9d2d2db27a2e374&quot;
 
 inherit pypi setuptools3 python3native
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------B576AC7F6472B166AFED5CF5--

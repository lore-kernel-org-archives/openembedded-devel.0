Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.42])
 by mx.groups.io with SMTP id smtpd.web10.67011.1597759657080547900
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2020 07:07:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Xfgppec2;
 spf=pass (domain: windriver.com, ip: 40.107.236.42, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QO5jBa43U4hf/vyJdybIRSWzU9/j45Nn4MBQH5rZjOK3q/oBGOX2zi4O41FyNYPri371G+sqH/bwNlqbVmpplwmBwLPow/BISVzlZuQ2YnRF/rqGeSYH6wayWqwQFr5RmMTFNSm38sPB2Be1B705yAWtXPPBweCkzFKKIlBOPo7Tjma7G35D+7VQLp5+H9LFLsMNDnmAIngf0fTCtVW6zf7N/O0GrQa9BVbaGTuYDSiG1PY66MBwuthEq0ieikSdUr1qChzDQG5amEwkOkUl+Zj68wYN0BNPvPxQ238qL8K3PyvDE+drlX1HG2wgJ2Bm3ENGdv5zMqBNPk58zn0OfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p1iRvUPYOf1eKovqvQZb9fX1EyZkOxYdwvFni9Z11Wc=;
 b=dsHgiQi2RzGxXQVslrl8vSvmA2Ci/XxlXoOGG2+HnnTMMRleQF2GgWpJFkvlh8o2oW3ExDTiEDXl5BXrPZ1kViIS8ZdAdkWa/babMfxYRfi/Yr4I/kLAdiVfERSd0pn6yrKnqS/ckp4nmW5gk8zWzOIf3V4cx00Ei3BgGh7pQMtAwnYt+Ys9r5VQwb4cJq2LrqcUIdeOQFbwTrtXnzTRwQhPt1fEZX1DgxQatcOTAkqRK/qksAeNX65iC87MLvhfAvDjShc3KeVZnHHzQr2IHNeuZBLEqp8CWOfvGjd8eT1uR2TVSnDs5VibquPgTBEMbqxXU2Ekuv5id8N9nNF3Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p1iRvUPYOf1eKovqvQZb9fX1EyZkOxYdwvFni9Z11Wc=;
 b=Xfgppec2ppQSeGR/ptc3fxlgpS+lzIway0Z+NYJCHOuV/DcVQmB1WWKifpxFSSoz0gIHD0IMgm7kiHFmRiqjkSNwhxYImhhdZ0l7bFcEmRbsLX0niUpBtwW3hINhBBti7ir3CUimEy94i3vynghgGBCcKUzvQIeKcQebKsbP2uw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3398.namprd11.prod.outlook.com (2603:10b6:a03:19::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Tue, 18 Aug
 2020 14:07:35 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3283.028; Tue, 18 Aug 2020
 14:07:35 +0000
Subject: Re: [oe] [meta-python][PATCH 08/10] python3-google-api-python-client: Upgrade 1.9.3 -> 1.10.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200817112901.28914-1-leon.anavi@konsulko.com>
 <20200817112901.28914-8-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <2eb06c78-a7ce-452b-d8c5-3bb3ae7408b4@windriver.com>
Date: Tue, 18 Aug 2020 10:07:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200817112901.28914-8-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTBPR01CA0014.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::27) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTBPR01CA0014.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend Transport; Tue, 18 Aug 2020 14:07:35 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ad858f4-ffb9-4688-7afd-08d843800eb8
X-MS-TrafficTypeDiagnostic: BYAPR11MB3398:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3398D14ABFA97D5DF61F8C2B9F5C0@BYAPR11MB3398.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:510;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	U1MCHbt/+HukolUA5Km0CaD3uDA7ZOJ/s23Ro0VUANvCel9bK+G1uz8vT+HLiS5lXYmea1usuKIXLfCUmOc3h0KttaeKyz8/FmPzSsYMUa8daRnXiOiTzj7BFEjkwr8aothB7WdyOssYuqdmifkKTAXnvj5R3jaWwgtR0ox6GNM+xELmeL6BdXOzCNtMD0O4pH7dtwNtFBQ0WggoiX8rQl3pwMPdmHBt/hgSojP1EjkDEXu3ubfTl9cGx0f6mikTAhtCXqT8IcxRk8aPi9I/ve1+MXwM13jcg2BURCmR8LVFg5jw9/FgbfWPfbkyr2QMPxutCq0YsdxH+Ak/5G4YUOJV9QMBsQLMSXlO3/+7WXinBS/OWcixa5BgZ+t2muy1vGZ+6NmC4EH9kRGV6kMTP6Aa55GGsJ+DgyhzJFbcYcDcX5pLL9BOkdBglIhJGL59Poqn54iYKVCwlbwjSgkbhg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(396003)(366004)(39850400004)(346002)(136003)(166002)(966005)(36756003)(31686004)(478600001)(956004)(2616005)(16576012)(6486002)(2906002)(66946007)(66556008)(44832011)(66476007)(316002)(5660300002)(53546011)(26005)(52116002)(31696002)(16526019)(86362001)(8676002)(8936002)(83380400001)(33964004)(186003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	BxY3UFUcU5aSR345iF/bBuOyE6D7M8bFGsi3c0GUZZeMChb/IkRiyZw1+2KD+49GvETxLw3nZJZ2GbFAALgpr7sef91yRCR239vlTKC18pLzHlAaAd9JLLRK/lduVMJGrkxDvjJOipPMno9EeJEW9/Xm7IsQTnmPoEudJ5kWuZ1Be7sYw9p/LTj0nTMRZmeXcB1LYIK+L7CAAyXBdZFN9IiYXrxMltMnjRvJcmKQGV7MzwE3g615wQHimRVnANRLB2an78hZ6MfdMORScgijK3Dg7XULzsM4zAtS0OLBbaVENQPAcXy7d1uVid8Ot0IPWsMsdk+Qeu6/2IZiyP5VIzFRw53EF91DVEGiff2nDDNQE4Xt8Upfz3S5JLUmtgRipQBXu9OiWen58C3uDM56WdJCD8PDKQNnFLOHBOOFUyPy03D+gTvya0TsU/AN7WqosSLb0znbsng2ERjedsWeRdiXy5wOGu4mQBx5Xw+IQU0NsEdeApM8IWNxzqJOUOjL1eSbsZ+p9ThKXnSp25t/nX72y7uWHs5DcWyLBGk2WqhDxHuBijFuFRNaGE0s4fvJmPy3OgYGDvl77Xd5nlJWYhbDqV/rFzgk/BpDQg6APdF67OXUOKtZwmgfIYNW+M787niknFMYReqQvqoM/VxQLw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ad858f4-ffb9-4688-7afd-08d843800eb8
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2020 14:07:35.7609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GtSSxP27CcL1Y3ZWc60vXF8AEu0AZh/I7mZYgUDDfxSAJOxyKywMkbHc0aDgYmWz+NHIZtzNx26/TK4LSd2ksMKSXjICS6FVag6gFFIISoI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3398
Content-Type: multipart/alternative;
 boundary="------------173A6884E5CB5DC9BEE071C4"
Content-Language: en-US

--------------173A6884E5CB5DC9BEE071C4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/17/20 7:28 AM, Leon Anavi wrote:
> Upgrade to release 1.10.0:
>
> - Allow to use 'six.moves.collections_abc.Mapping' in
>    'client_options.from_dict()'
> - Build universal wheels
> - Discovery supports retries
> - Consolidating and updating the Contribution Guide
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...nt_1.9.3.bb => python3-google-api-python-client_1.10.0.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-google-api-python-client_1.9.3.bb => python3-google-api-python-client_1.10.0.bb} (69%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_1.9.3.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_1.10.0.bb
> similarity index 69%
> rename from meta-python/recipes-devtools/python/python3-google-api-python-client_1.9.3.bb
> rename to meta-python/recipes-devtools/python/python3-google-api-python-client_1.10.0.bb
> index af4aa5287..37b6fc621 100644
> --- a/meta-python/recipes-devtools/python/python3-google-api-python-client_1.9.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_1.10.0.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=94023d14f6b58272fd885e4e3f2f08b3"
>   
> -SRC_URI[md5sum] = "eb5fa1e3f83b659ff978df1346a55576"
> -SRC_URI[sha256sum] = "220349ce189a85229fc46875d467101318495a4a735c0ff2f165b9bdbc7511a0"
> +SRC_URI[md5sum] = "a0064953388af9f9c61d8347f1e2ae0c"
> +SRC_URI[sha256sum] = "fa24f07f6124ff2e91ee9b7550e240481bcb31b8f77a75e8d481be1c44a6ff07"
>   
>   inherit pypi setuptools3
>
> 

--------------173A6884E5CB5DC9BEE071C4
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/17/20 7:28 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200817112901.28914-8-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.10.0:

- Allow to use 'six.moves.collections_abc.Mapping' in
  'client_options.from_dict()'
- Build universal wheels
- Discovery supports retries
- Consolidating and updating the Contribution Guide

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200817112901.28914-8-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...nt_1.9.3.bb =&gt; python3-google-api-python-client_1.10.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_1.9.3.bb =&gt; python3-google-api-python-client_1.10.0.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_1.9.3.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_1.10.0.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_1.9.3.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_1.10.0.bb
index af4aa5287..37b6fc621 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_1.9.3.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_1.10.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/googleapis/google-api-python-client">&quot;https://github.com/googleapis/google-api-python-client&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=94023d14f6b58272fd885e4e3f2f08b3">&quot;file://LICENSE;md5=94023d14f6b58272fd885e4e3f2f08b3&quot;</a>
 
-SRC_URI[md5sum] = &quot;eb5fa1e3f83b659ff978df1346a55576&quot;
-SRC_URI[sha256sum] = &quot;220349ce189a85229fc46875d467101318495a4a735c0ff2f165b9bdbc7511a0&quot;
+SRC_URI[md5sum] = &quot;a0064953388af9f9c61d8347f1e2ae0c&quot;
+SRC_URI[sha256sum] = &quot;fa24f07f6124ff2e91ee9b7550e240481bcb31b8f77a75e8d481be1c44a6ff07&quot;
 
 inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------173A6884E5CB5DC9BEE071C4--

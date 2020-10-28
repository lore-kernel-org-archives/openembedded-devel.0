Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.50])
 by mx.groups.io with SMTP id smtpd.web09.10602.1603898472355587071
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Oct 2020 08:21:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=TOM9rMWn;
 spf=pass (domain: windriver.com, ip: 40.107.77.50, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z103tVCu0nxPSp40U7ocXS40mXXpvojF7q1oyHnt2+VrU/NMd/jQ86ErN5edjD6wjDlmjhwKTyDBwVkal0Ib4Os50HXyzeNtBxHkH3yoHLWardS9OqcFEcdxcjQyKEjkPJTlfNS2akyOBr4LdQlt3K5O4Ry+Dc+vGyx4Py8FyRJjxk01JcssPal5ALqFJ42/v85GDsmizx82NqmyWYiJpk6ZDkQaZN3wQC7OANIub5w8Se4A0jC4PMgnXLhul/07+ks7pWQoVtGD72twOdz3aSuTT9sBM+oU7W82W8ibW1vLUTuN0qIDhVHhYkuFzRCr3z4Rtlo6iSmKJ082a9mSqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wOPIPGcTAyTOqL2lLu34CqjXfYw0F7DVUR48lsb2xMQ=;
 b=IIWCuNBkR2BMKPEylNTfyqQBMREfiu8fdm9Xtjtfu48kIIsuVc/3HkKTHblSEtL5N8YOqjGjtcSFlJ7DOo2czWjr4zNdL/fK3oG5iHTpMd89SYpHduTZ0fKr315QjC3xOhAyMY6l6sa9qnYmBA8PWsSjCtSdDUuTdUNXfkaIBVMhRDyv6+zI4Ms8vRSkrFenW9eSHLw03Xi25ParaPaqQ//41DjwXCssUczMuip/V77UifIKiDUggI1YMR2TOIdNxDegIh3hQdBDRnpsbCV7ZkFsH4bgtokF1aAzx3/HPC70bMyk8I6DXtJQCuawzKeL8LnHfU1rhufOQiLBXGITPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wOPIPGcTAyTOqL2lLu34CqjXfYw0F7DVUR48lsb2xMQ=;
 b=TOM9rMWntomZlJokW1kthhxI/Xz4lKVhcsmGoS5R/ywdxSthfjo8rBgwI8qKX7sNAWphpM0Q+gIt9hQmqjGiZr5TZPlW3PMJ7YcPptKx2m95ZL5RWe9hyhQtZyi+r5Z6DWDAFYZvsD+Yi0BdL4VSh73cAwUhY4+oCPiK/90my3s=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB5008.namprd11.prod.outlook.com (2603:10b6:a03:2d5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 28 Oct
 2020 15:21:11 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3477.028; Wed, 28 Oct 2020
 15:21:11 +0000
Subject: Re: [oe] [meta-python][PATCH 2/2] python3-google-api-python-client: Upgrade 1.12.3 -> 1.12.5
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201023143233.6911-1-leon.anavi@konsulko.com>
 <20201023143233.6911-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <82e2e671-e76d-e31a-61e8-d089bd740284@windriver.com>
Date: Wed, 28 Oct 2020 11:21:09 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
In-Reply-To: <20201023143233.6911-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BYAPR06CA0039.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::16) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BYAPR06CA0039.namprd06.prod.outlook.com (2603:10b6:a03:14b::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Wed, 28 Oct 2020 15:21:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ba4a7d6-4d58-413f-12c1-08d87b5519ea
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5008:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB5008C680F7171E3B820A56779F170@SJ0PR11MB5008.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HTimgFBqnn6MAEPtBrZS6cJkVNRSzndPCyIl0ORpdE8xCL8yJjq9bksRB7JjFWz2mpdZ0rAaKNU9LxIoP863N+ZJUuhjYjzlxyunSt6LvbQE3h+SL+0E727b1d/9xnm9L+/qYQZ/LCSiLuWl46cbGHJsuj7fZzmYepNFCFtV6made7CqIm5cfvXEsYgufmtC4E4OOU10uCNXnfup6h5u9FNIRvL+En+Zz5+4XY8GxqoZ09PUGKCXkVCLhHpB2w7I0fGwbMctKFzuuxA7ysVhBQm6pNcGk+BCOuAEEQV7LWvmPdM1QwP1lALFOxa9iwI5GYFblPTekJgd40ewBk1kixAsMzFvEuZGTRDTqzUKeLaE1ETLy4MJ2OjMkClpfQJezq6vfUF4OUdqB+6M8jwK6PiivZpfGZBxN2fM8Zj9eFnENLi6GAE5VEZ2jBedTwe81yCBGtAcBJYO5akG1NBvCw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(346002)(396003)(136003)(376002)(83380400001)(5660300002)(166002)(6486002)(478600001)(44832011)(33964004)(31686004)(86362001)(53546011)(52116002)(2906002)(16576012)(186003)(16526019)(8676002)(316002)(36756003)(66946007)(26005)(966005)(31696002)(66556008)(66476007)(8936002)(2616005)(956004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	666Vm4OSLXjnN/0xaJUVu6IZqfvsQbPMcr7mcuj+8Kh1KH9AC/wBRmn61FefH7yzJ8iXPDUbegdF65ajkhoFqsVhcRXlZ5ld2mYjIdL0mKu6aF9UMyv4GUiAbAi5EgCEfzrl64mBpElm+eXdDQ5a7SNK6Jzbg2DNvxqRAAIIJ5S+nJ4P3WG4Bxp/JZjYyLtKHnMVaO7fXgv5SCvzUbVnIplSdj+8lILOVS6cOjQIp7H39rR3OfyMF0DaUehvbaid8Jm/tdu/j5oIt8GrFqq2ZOQgob6lUiZiRoqC3xtQhQbf13Ce/HsXMH3GRd00f6fdNwHcasaLLLFZEIEWK0PjtG0bUCiopMa3SA9h7HyHttgatBowiqVs/w/5rfw02mH7r6QEvRrgVJ5KUgiahLde7xs1dajdLE17z18jJXFspU0vR9RODt1+y7DojMi3g/h8Btp+zhVVRdaie2En02/ER7Or/jllz5Mw6hRF+tTnFumKzydiY87Fl2TlCZuiNS2BipqPDzznUXqe34j6J9eErhALLywfI2TMT+9dFmN80RZ/YTh9a/WC3FI2DRrfj5O5rgkYmDVTHSkdn6UuJ6ZiuufTreBi+SjyerYI2ZpIv0pj5Ztj9Av5RAyhiOCW/zbUPAyqruyePCd7C5CpyE/75A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ba4a7d6-4d58-413f-12c1-08d87b5519ea
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2020 15:21:11.1811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hrS2Zen5tGJdz1iSl6Nka6pr63Xt+FostHtXr6x1egMWwoAUQlEqh9L7fK1MHKHOYPdLP9/pjA0uBJGaHXnxGsKraxFL2PJMz42HuhF+7wU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5008
Content-Type: multipart/alternative;
 boundary="------------E65A535F8615BB699D43DFF6"
Content-Language: en-US

--------------E65A535F8615BB699D43DFF6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/23/20 10:32 AM, Leon Anavi wrote:
> - Don't raise when downloading zero byte files
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...t_1.12.3.bb => python3-google-api-python-client_1.12.5.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-google-api-python-client_1.12.3.bb => python3-google-api-python-client_1.12.5.bb} (69%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.3.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.5.bb
> similarity index 69%
> rename from meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.3.bb
> rename to meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.5.bb
> index cf65044627..87c2212416 100644
> --- a/meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.5.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=94023d14f6b58272fd885e4e3f2f08b3"
>   
> -SRC_URI[md5sum] = "24e87dbe11fbbe3d97f23c230f518531"
> -SRC_URI[sha256sum] = "844ef76bda585ea0ea2d5e7f8f9a0eb10d6e2eba66c4fea0210ec7843941cb1a"
> +SRC_URI[md5sum] = "4aee3820666e80944f38c39176193d5c"
> +SRC_URI[sha256sum] = "1892cd490d164e5ec2f2168dc3b4fa0af68f36ca15a88b91bca1826b3d4f2829"
>   
>   inherit pypi setuptools3
>
> 
>

--------------E65A535F8615BB699D43DFF6
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/23/20 10:32 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201023143233.6911-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Don't raise when downloading zero byte files

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201023143233.6911-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...t_1.12.3.bb =&gt; python3-google-api-python-client_1.12.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_1.12.3.bb =&gt; python3-google-api-python-client_1.12.5.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.3.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.5.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.3.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.5.bb
index cf65044627..87c2212416 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.3.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.5.bb
@@ -3,7 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/googleapis/google-api-python-client">&quot;https://github.com/googleapis/google-api-python-client&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=94023d14f6b58272fd885e4e3f2f08b3">&quot;file://LICENSE;md5=94023d14f6b58272fd885e4e3f2f08b3&quot;</a>
 
-SRC_URI[md5sum] = &quot;24e87dbe11fbbe3d97f23c230f518531&quot;
-SRC_URI[sha256sum] = &quot;844ef76bda585ea0ea2d5e7f8f9a0eb10d6e2eba66c4fea0210ec7843941cb1a&quot;
+SRC_URI[md5sum] = &quot;4aee3820666e80944f38c39176193d5c&quot;
+SRC_URI[sha256sum] = &quot;1892cd490d164e5ec2f2168dc3b4fa0af68f36ca15a88b91bca1826b3d4f2829&quot;
 
 inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------E65A535F8615BB699D43DFF6--

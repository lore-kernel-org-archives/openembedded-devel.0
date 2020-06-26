Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.86])
 by mx.groups.io with SMTP id smtpd.web12.9836.1593183732433282224
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jun 2020 08:02:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=MS2z4X4C;
 spf=pass (domain: windriver.com, ip: 40.107.93.86, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aXeVsqZo0VpGAm3pb0ftB5fkFQkkB0S21MCB7Xb6Ppwrg09J/Eewj1YK8fmfE1KXQGUvXDAQ2xw+J35kMuq8NGzscK0KmwHvXJkT9u0LQX7EsyVoUcHIwsrr1MgVJAPIds4Ny/e8BIId7RaJZZyr2oUbjorRizrnAcgzdM5uqTQnY4NAEcYX2lENJx6gl2op+1LZz+cr51bnTvUSGTNa1+nNxxqklRhWChB/hTVQrxm3XvJvCQMFTIRgQAH+n8JPpvHIggXDtyPbdAgFfwbYM1h4MvZ6+KZQCKzQJD3JV7ZssqIk5TRnbrljbsJSEU9+vftn9SffYSaZ6kVY2cV2iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8A2B2L0EsFXdbhMNGaPN06/eGxJB4gKtCxP0NRZINRI=;
 b=Utt+tEhSidDBmp/w5EyqWIfDOO5LMx1ZG2elv6lj2dVqS4MLRZbZm2RN6usWieoD5D+BVrTL25nCUV5PZcAKGfaTSZ69N7Aeu4An55bIPbO2WKLYnYSDnE7V9DaK8GShde4/0s9C3ICAR/kUjVFea67BadQVQ9mM427afhawg7/W0J0ad4qx5hw78wJo42ItdBlAyv6lqhdpzYtB2nQ6wsJfaObVqFtzIWXvWQh76v2A29I/oHfrI1k4YUbq0xt+25iHx8FUwEuL7dlLboSOox94DTLYqhHjfSBbgY+dv0TuCfOTXKrzz4+gy/wyD67ec2OJTsozqD46wqIfUREP5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8A2B2L0EsFXdbhMNGaPN06/eGxJB4gKtCxP0NRZINRI=;
 b=MS2z4X4CICN2S+Pm8b8SuIVMsTGS4a8qZBKb8/cLZcco/HoWE8oPH9hQzkX0BkBybjmiLvU4JSd8//d7tFx9PKi2ilVGYqVmbTz6qg1Y/S7fbQBGHVZiKSqeMoMsIxMpQqRjOBveH0mSFmw8BtFPlGOqqxdi2g/+HeNuVfLsrFw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1604.namprd11.prod.outlook.com (2603:10b6:405:e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20; Fri, 26 Jun
 2020 15:02:11 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3131.025; Fri, 26 Jun 2020
 15:02:11 +0000
Subject: Re: [oe] [meta-python][PATCH 10/12] python3-coverage: Upgrade 5.0.2 -> 5.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200625090719.16068-1-leon.anavi@konsulko.com>
 <20200625090719.16068-10-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <804f4bd3-fe0c-34c9-7e69-74ff34fccec1@windriver.com>
Date: Fri, 26 Jun 2020 11:02:09 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200625090719.16068-10-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0089.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::28) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0089.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21 via Frontend Transport; Fri, 26 Jun 2020 15:02:10 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3becaea3-6400-4b32-3932-08d819e1e746
X-MS-TrafficTypeDiagnostic: BN6PR11MB1604:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB16049A8F786E285C55B8669A9F930@BN6PR11MB1604.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:923;
X-Forefront-PRVS: 0446F0FCE1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	w5MmOeR8NaI/03LEqtEUQWLXdu0m0Lkn1OXYS3MAjQzq+qL0A6yyN/+aN9/ycUfZaaJMOEQAejOOFEfaNvzTZoaJSCdZxvqA7YS3weuEmLOQ/caWho3LI6Zjf7CErHMP7wXD+7oxM94NuGT0zQ5mEaAUSnY9qGNDRPpKkoepziIKQRddMut/xhqkPfgDyiAwd4bfj2ixXm12M507994vuGqy+R78+hifdeNks1MIaGGVtynsAfFRXE7BXtIjvmPnq4Pj03f3R27KvpPlHw/ZbfLb03h86QCv+qGo8HeZBlxbDbPPAxcFVTkzXb8VmJKl5IzMlfhLjzQpknA+VzdqPQZioh32u8z1dTmFbyRjuW+HcgyVA/H1f8cywKzVQBSZulUyCLjNYZ01WtgwCFIYIuDaX5Cp4rBT5Fc4HSVXs1lRwJ/Eemar7SEyKSBupwr41UwTWpApyuIU/07VNEG1Ow==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(346002)(136003)(396003)(376002)(39850400004)(2616005)(956004)(31686004)(66556008)(66946007)(44832011)(83380400001)(6486002)(86362001)(16576012)(31696002)(166002)(316002)(966005)(66476007)(53546011)(8936002)(8676002)(36756003)(2906002)(186003)(478600001)(5660300002)(33964004)(16526019)(26005)(52116002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	7yKrCbLPXPzWXtXQcT9sz+pVcgpdfmf+y4Wutph2ganO6HbXpsQlNmmYkcJEcsrx6c/+/BuWFqvncBg+NgLOO64g3gfbM4G3EmClF/neCT0lB+KX/LnqxXgSdaV+klYGZR2Cc3xV1CNnT9/C9z/Ivjj15rTwKK2QGGERbhHNJuA6xEeE8/yz4CdIM6p23Y1YXa6lcxewjSni4K8YJ+hktquEcflIk6b2ntLjhrUbswPG8LXMcRxoj1+zYiIA4JX4XK7iFuFTAmwyt1nTQ2V1V8vqe9wWfoheg28BONrBWEsCKb185Qc3JsXS+9pV0wEm2tVRldYZlr7/NMnKyXGSjnEVr0kW7og9epzaduCVW+SmIeenx6Ls07CbFaK1DZheWC6BiPcS3X0bdIjPb2zca+UOzCGVFu1JmwIHmUYyVn1IBYQ0xSB2hzB2KxBlBvyFtaNb2G6I/D5hJnYGaJy0+K7kfrCve1LeNLyd1ysdZQjxQAljl+7SvuxSOEaAKgxU
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3becaea3-6400-4b32-3932-08d819e1e746
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB0003.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2020 15:02:11.3788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9hlxk0pz6WNh50/iWu1qAqSSoIQ6Nr+p/JG/Lg65HLDU9MNQhWTxI38WJdMr2oDBBIBsA1HBxgHv/wTfviwNrl2dyRdtyUkJqPw7knygoJk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1604
Content-Type: multipart/alternative;
 boundary="------------DA6E6DC309F877AEC0480578"
Content-Language: en-US

--------------DA6E6DC309F877AEC0480578
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/25/20 5:07 AM, Leon Anavi wrote:
> Upgrade to release 5.1:
>
> - The JSON report now includes counts of covered and missing
>    branches.
> - On Python 3.8, try-finally-return reported wrong branch coverage
>    with decorated async functions (issue 964). This is now fixed.
> - The :meth:`~coverage.Coverage.get_option` and
>    :meth:`~coverage.Coverage.set_option` methods can now manipulate
>    the [paths] configuration setting.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-coverage_5.0.2.bb => python3-coverage_5.1.bb}    | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-coverage_5.0.2.bb => python3-coverage_5.1.bb} (61%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-coverage_5.0.2.bb b/meta-python/recipes-devtools/python/python3-coverage_5.1.bb
> similarity index 61%
> rename from meta-python/recipes-devtools/python/python3-coverage_5.0.2.bb
> rename to meta-python/recipes-devtools/python/python3-coverage_5.1.bb
> index 9407278e9..7265d2c97 100644
> --- a/meta-python/recipes-devtools/python/python3-coverage_5.0.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-coverage_5.1.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://coverage.readthedocs.io"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
>   
> -SRC_URI[md5sum] = "876be562bc78deac6fc2a06ee4a6d551"
> -SRC_URI[sha256sum] = "b251c7092cbb6d789d62dc9c9e7c4fb448c9138b51285c36aeb72462cad3600e"
> +SRC_URI[md5sum] = "506e30fb011158abe5ce92f39866b271"
> +SRC_URI[sha256sum] = "f90bfc4ad18450c80b024036eaf91e4a246ae287701aaa88eaebebf150868052"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------DA6E6DC309F877AEC0480578
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/25/20 5:07 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200625090719.16068-10-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 5.1:

- The JSON report now includes counts of covered and missing
  branches.
- On Python 3.8, try-finally-return reported wrong branch coverage
  with decorated async functions (issue 964). This is now fixed.
- The :meth:`~coverage.Coverage.get_option` and
  :meth:`~coverage.Coverage.set_option` methods can now manipulate
  the [paths] configuration setting.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200625090719.16068-10-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-coverage_5.0.2.bb =&gt; python3-coverage_5.1.bb}    | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_5.0.2.bb =&gt; python3-coverage_5.1.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_5.0.2.bb b/meta-python/recipes-devtools/python/python3-coverage_5.1.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-coverage_5.0.2.bb
rename to meta-python/recipes-devtools/python/python3-coverage_5.1.bb
index 9407278e9..7265d2c97 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_5.0.2.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-coverage_5.1.bb
@@ -3,8 &#43;3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://coverage.readthedocs.io">&quot;https://coverage.readthedocs.io&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93">&quot;file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93&quot;</a>
 
-SRC_URI[md5sum] = &quot;876be562bc78deac6fc2a06ee4a6d551&quot;
-SRC_URI[sha256sum] = &quot;b251c7092cbb6d789d62dc9c9e7c4fb448c9138b51285c36aeb72462cad3600e&quot;
&#43;SRC_URI[md5sum] = &quot;506e30fb011158abe5ce92f39866b271&quot;
&#43;SRC_URI[sha256sum] = &quot;f90bfc4ad18450c80b024036eaf91e4a246ae287701aaa88eaebebf150868052&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------DA6E6DC309F877AEC0480578--

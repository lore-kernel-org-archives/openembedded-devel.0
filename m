Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.71])
 by mx.groups.io with SMTP id smtpd.web11.9986.1593184867022731013
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jun 2020 08:21:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=SxUCyLrX;
 spf=pass (domain: windriver.com, ip: 40.107.77.71, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dwjYEnQlW8Re035uplscJS7kGbBWpsW9QgveaQ4K+mg2+mfK9U6w9CTZudLKK17Iyphc0HFr1pPG50A2eHbIaoDSCH9Jl7rtgCYGpYQ0yXHlEFXvH4nRf3H7llPkH6YMZ9gQ6jxTc2OxqeQXGvO0noNPtksp5BG+XuPEMNP078NZ2EXm9OkwR7WZ24WQUh504ulQXmII8/NCFlk3bUDmYdux8qFjrGre4bcm79jiTcu/+yJPGVjyuMgWgsmg/hGlkaeqopGNSVIzEarbAXP7iyjfJ0mPJltE36seT9HhPzvvIMpCT0Mgq3atGTc463cUi0cpB6aAJybnLFqWQs1V7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NxJfUw4O8VNpIz09naLZoXNPhUDZU3LQX1DXruNzJ6E=;
 b=RTAmYw3w0/KrMgPxuLzYy2fM2DKTu0KB6+BYorSmIPCH9/+c5ea6BeroEuBDiDOdRhaHpLM1bIiQ5XCbVPt2ca+0M089Kg1iyAvFWWD7gMvZyz7vzMIF1xoUortL0MTriLxiGIrOXI0EyvYhS/lB1gLArYwXX6RdSOgyxGBPh765hP5nQWGO7v6BWzrkxT7Bt89iILOGjpT1KqZ1Yqhj31iXfb2+gj5MuuxFV3ia2e+d/G0IDhdyVCMh4b+cM6fd0g/ntSaGPfy1CnAfp4G0qd5m4rUcO4pNJQk3oajgJtOsgUhsXCZB7tr9VawxkFtUHCkQVsptwnODSlgvsmvZyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NxJfUw4O8VNpIz09naLZoXNPhUDZU3LQX1DXruNzJ6E=;
 b=SxUCyLrXMXnDhl4s9GORraP6N9CTb4vekRGEviHl3hgm/08KuY0kN/HsakfMbVsjqrXhAHa+0/Ckd0brHSClb7K5PED2/n4YIoNJMYdHNAhCNjIRM2HlZQBsljpsCZz8aXZAzQgmD4gyy3/X9ra1xCoYQ+yba//mlXFkZ1Cnank=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB3953.namprd11.prod.outlook.com (2603:10b6:405:7f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.24; Fri, 26 Jun
 2020 15:21:05 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3131.025; Fri, 26 Jun 2020
 15:21:05 +0000
Subject: Re: [oe] [meta-python][PATCH 01/10] python3-ordered-set: Upgrade 3.1.1 -> 4.0.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200622103542.27830-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <b6b30222-515f-8f18-66ca-e1fc07ff2ebf@windriver.com>
Date: Fri, 26 Jun 2020 11:21:03 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200622103542.27830-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0004.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::17) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTXPR0101CA0004.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20 via Frontend Transport; Fri, 26 Jun 2020 15:21:04 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2c31726-0d49-4f3b-18d0-08d819e48af6
X-MS-TrafficTypeDiagnostic: BN6PR11MB3953:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB3953F3239C783BF88FCD35C39F930@BN6PR11MB3953.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:184;
X-Forefront-PRVS: 0446F0FCE1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hKxU1w3neIMYJL9hnkS7NkmqpP7M//1tX001uVDR12tSLfTLGgpkjlimWZTK1Qra+Bt8Cgwf0ULMyDiKGoN3ENpaaXP0ZVZGo1uFPgAHdmy9oLGJ32SIP2ZVTMQ1yuTrUbh1lTPTNDDMxA6eGWDjbR4D1iuBofCcLMinD/lJhT2o/42bQiccMbP7XIJJJJ7MSMrP0EbHruUmFHZW6fXx3BSrE9gZqclfND6e9c3XuRXPv5rXn0h2iEJ6f7G59rIh4S365aXvdVKttd2gfo2684qFtsHTTYwdSMHKT15+gX1GicGVqIYiV8B4bN6zDUKr6bIInePTS1lJD9nWfHD+ylEUIAyGzGfGPrvlPyOqsXkrtPyrN8ZSFG+fiLgIl/qc3zKiQ0xsq83ziTrKhpqd/DKCuImEhDU7bnyQKedowzFhuE2gvtjY2rJc2CMsBXRXwcZGM9rhqADS2ICSsdfW7A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(396003)(136003)(346002)(376002)(366004)(316002)(166002)(16576012)(2906002)(956004)(83380400001)(31686004)(8676002)(31696002)(8936002)(478600001)(966005)(36756003)(52116002)(53546011)(26005)(44832011)(2616005)(186003)(6486002)(16526019)(33964004)(66556008)(66476007)(5660300002)(86362001)(66946007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	gQa8v8/ZX83Q00AeOXmkly97/5RsvBfLYWq7XzXeGm7zFbcqPWIWgc0iglh6MUsikPNanm9Euf1nS0mqm+8yr6PKAYqqHNPXd/zMXsdpiVM+6jypRq1WK/OcVfwS1QVmzMoFEia03F4UVxm59vN5CRfyjhEq3lyJvD3LsZvHLvd3pRsQlgMFcZeHTBZcVh4Qmdecj00Fe/KRc5J3CHYUqp/kBkQWTYKcYWl+eqdFz+GfZ5tGziq8cH9ecaW5FVT4RoC58GYS2I8fox1i9js2errG/CRjRsZiXotTQuiGpft8shtQuICsmX26NH2ka/7W1cpPhtLtdYZGjmdI0vFDzkKDBYgTL7G5npfsb7sgwqDrx86CTWX93Wgt89ZQ22A0V4GPTB1JPzPJs7q3pbH2J5U4NhcYJkqUUh3Ss+VThS0Lr1vHMXtQrNofapva/+vkJSi/gZtTJflFCiCbM187gxb28IVH8DFxXoF3a23vwbIjSlcNJ62ra7gNdIqt/fSN
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2c31726-0d49-4f3b-18d0-08d819e48af6
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB0003.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2020 15:21:04.9935
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SJ+6FTSbBSFnCjCYZHOQjsHxiDDTF8p2kBlpAtIfYfcFmT0JHmf+tIPEO8oTcNaqsDSFO6Ssvn3Ymrx28r2RWX2x1jZPRvDOUEh3BI9lnT4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3953
Content-Type: multipart/alternative;
 boundary="------------86FB07B281A6DB2A10797230"
Content-Language: en-US

--------------86FB07B281A6DB2A10797230
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/22/20 6:35 AM, Leon Anavi wrote:
> Upgrade to release 4.0.2:
>
> - Fix packaging, remove vestiges of type stubs
> - Code formatting (isort and black)
> - Directly distribute type stub file via PEP 561
> - Include pytest.ini in sdist
> - Add a Jenkinsfile
> - Handle another indexing case from NumPy
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...hon3-ordered-set_3.1.1.bb => python3-ordered-set_4.0.2.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-ordered-set_3.1.1.bb => python3-ordered-set_4.0.2.bb} (76%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-ordered-set_3.1.1.bb b/meta-python/recipes-devtools/python/python3-ordered-set_4.0.2.bb
> similarity index 76%
> rename from meta-python/recipes-devtools/python/python3-ordered-set_3.1.1.bb
> rename to meta-python/recipes-devtools/python/python3-ordered-set_4.0.2.bb
> index bf362daa7..0e678b54d 100644
> --- a/meta-python/recipes-devtools/python/python3-ordered-set_3.1.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-ordered-set_4.0.2.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "http://github.com/LuminosoInsight/ordered-set"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://MIT-LICENSE;md5=2b36be0d99854aa2ae292a800a7c1d4e"
>   
> -SRC_URI[md5sum] = "6e12312c8dc4c90fe840e86e8a352644"
> -SRC_URI[sha256sum] = "a7bfa858748c73b096e43db14eb23e2bc714a503f990c89fac8fab9b0ee79724"
> +SRC_URI[md5sum] = "5d88f3870c32d4868b28c8fe833f7e74"
> +SRC_URI[sha256sum] = "ba93b2df055bca202116ec44b9bead3df33ea63a7d5827ff8e16738b97f33a95"
>   
>   inherit pypi setuptools3 ptest
>   
>
> 

--------------86FB07B281A6DB2A10797230
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/22/20 6:35 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200622103542.27830-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 4.0.2:

- Fix packaging, remove vestiges of type stubs
- Code formatting (isort and black)
- Directly distribute type stub file via PEP 561
- Include pytest.ini in sdist
- Add a Jenkinsfile
- Handle another indexing case from NumPy

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20200622103542.27830-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...hon3-ordered-set_3.1.1.bb =&gt; python3-ordered-set_4.0.2.bb} | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-ordered-set_3.1.1.bb =&gt; python3-ordered-set_4.0.2.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-ordered-set_3.1.1.bb b/meta-python/recipes-devtools/python/python3-ordered-set_4.0.2.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-ordered-set_3.1.1.bb
rename to meta-python/recipes-devtools/python/python3-ordered-set_4.0.2.bb
index bf362daa7..0e678b54d 100644
--- a/meta-python/recipes-devtools/python/python3-ordered-set_3.1.1.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-ordered-set_4.0.2.bb
@@ -3,8 &#43;3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://github.com/LuminosoInsight/ordered-set">&quot;http://github.com/LuminosoInsight/ordered-set&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://MIT-LICENSE;md5=2b36be0d99854aa2ae292a800a7c1d4e">&quot;file://MIT-LICENSE;md5=2b36be0d99854aa2ae292a800a7c1d4e&quot;</a>
 
-SRC_URI[md5sum] = &quot;6e12312c8dc4c90fe840e86e8a352644&quot;
-SRC_URI[sha256sum] = &quot;a7bfa858748c73b096e43db14eb23e2bc714a503f990c89fac8fab9b0ee79724&quot;
&#43;SRC_URI[md5sum] = &quot;5d88f3870c32d4868b28c8fe833f7e74&quot;
&#43;SRC_URI[sha256sum] = &quot;ba93b2df055bca202116ec44b9bead3df33ea63a7d5827ff8e16738b97f33a95&quot;
 
 inherit pypi setuptools3 ptest
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------86FB07B281A6DB2A10797230--

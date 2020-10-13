Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.54])
 by mx.groups.io with SMTP id smtpd.web12.9235.1602632565125259130
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2020 16:42:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=nGtITyAy;
 spf=pass (domain: windriver.com, ip: 40.107.223.54, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ntI9o1g9abnHya1c2RVU4duCb+sXtVTkCGFMIrERDw26f/tSptCFKKjTH8CnDK1EgU57rJ4NcbclyI+V8V51Csm/lufNdLqfAO/VcnPkP6ux2up3blLogVsQke5HPjV8XtVJOJ5Mr/bHs/b/1J9mksl2Tce8HeKU2oe7Tt+fvfKnPmfNYzMRFJ+VQWfJn+FTY5nPSglvwIOAjQ4kr70QELnacxrQ4dRiM+EIlcFt9xSECKGDchL2zyj4bV5UVZ6KdzpRVAQQAngazJdphAtMdrYW+9jupi6XFO7h1ucWXt7VLbE32w0CIzSdxD0V+nZgphmaLUn/NhtkV/eKY9S5cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZFNk22ynAdWIKphtptTBqY0FAoFYGVgRpLj2NEHBLb0=;
 b=Bl9QkT1OKLLLMbtFuFW4/sd1cH6k7HMqeCwcfSC3V2AsV+WzX4GHZWIl0JWJNcHRql7WLbwQPzNo0m9sL+I8E1+I2MJ2Ytk+mPe0BO/pMq9Xb8WrlcKAa5BCZeJk3bAlgFNVFOfLN0/p1nyN/o03VgW+98kdUKrGTbeGPpirfW/IQdargYb3wuW49r/P5O+5t4yfa1ZC/o2T/zsGhS2S//XJZ4+L6ZrM4j4agyIErovOWE6MxMJ12zdM8sj6g+PtpKdRrBDiVxjmx2CbfyNtJ15ThNtex2qG7HbeG95/jwNm4BeInRPupJ8R7WIr98fgRuv/JEy1cHPlwjQGVjpB3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZFNk22ynAdWIKphtptTBqY0FAoFYGVgRpLj2NEHBLb0=;
 b=nGtITyAyoS7iM0xWwL+wsOjGjQS5lF6g95kQkSPIIyvrhGgMQTizMu70kxfbV31T3qt2znO7aTI3D7OfAw65V4eHjzHlmjTEMnygbbjXbaql7bQ9EZAxVbwadGQV7WjlsDK7EQp9BSwxiPTZ9XEfBHTbxQHP7/7LmXlS4YubmHA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3816.namprd11.prod.outlook.com (2603:10b6:a03:f8::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21; Tue, 13 Oct
 2020 23:42:42 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3455.030; Tue, 13 Oct 2020
 23:42:42 +0000
Subject: Re: [oe] [meta-python][PATCH 4/5] python3-prettytable: Upgrade 1.0.0 -> 1.0.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201012140022.15761-1-leon.anavi@konsulko.com>
 <20201012140022.15761-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <d455cde1-b47d-07b3-a4f2-1ff4b98718f7@windriver.com>
Date: Tue, 13 Oct 2020 19:42:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <20201012140022.15761-4-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BY5PR04CA0009.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::19) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BY5PR04CA0009.namprd04.prod.outlook.com (2603:10b6:a03:1d0::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23 via Frontend Transport; Tue, 13 Oct 2020 23:42:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eafd0367-7ede-494e-e2d6-08d86fd1ad10
X-MS-TrafficTypeDiagnostic: BYAPR11MB3816:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3816C31F46D916CB245604159F040@BYAPR11MB3816.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:549;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mGK3d6YR+Wcb05hSW9ULF7cHxrAJht1NXXGKBkwzW913L4icDi+Vc3/YPPCAcV5/P3f414Gj6Mtwh6lq4d8qnX+ctc6koYIdcE1OdXVGkUFI7P7UgGMSbCJ04Ywfn+W2/L/7Lqk8Ft/34YmEFU/FK9Ysxa2F3vEEvh9IznZtA2AFbv4ThtlLgiECc8wxka/F/RqGt0TwljihjuJtE0VmYUJANt6hKy98mKILg9G8xY4OZFfdgNkv2H+YIGMASdnKVMQCIfaw4yveEPcL4lkzCCUbvUE4KD/stNHzhe1l4ruIT0De3ZSyFUQqqieAUOxtsg4ydldl0N6tQOsm6er30cqO64u6dKYDXRxP8NTWQuIIUIsvu78AF0C0S48Jm22sQnaux9NMVIbWZOgSbsvILmPz2SiF2nc099NZXq6mrFMav7LYnujWBABFXU4mMKT2xqA1CncTDXl+bRv31MHB6MCA9VNwr6nAs7fXoPxDvEw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(136003)(366004)(39850400004)(316002)(66476007)(66556008)(44832011)(166002)(478600001)(2906002)(66946007)(52116002)(33964004)(16576012)(26005)(36756003)(53546011)(16526019)(186003)(83380400001)(8936002)(956004)(83080400001)(5660300002)(2616005)(86362001)(31696002)(31686004)(8676002)(19273905006)(966005)(6486002)(43740500002)(563064011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	NeJlpb+ajdGzISvWKJHRVmvxHH4VBG/UKPKEJnF75f7fiJe2qsQHl/d5q6Bke4FXeuT8OwajM3LdIvZNEw8/gtaoqFzZldi8Vm7O/vKmqoON1aHgw3zrgGPKGAKzO4NjVwCU6kPv82+1jeoqnQjuJpr4mUt+n0i9cikTgre4UDas4W3VEi/84OCbjSi8TN0V8J7qzvF39xJiLPO5gd0SFxJHTKXDtRIeDEPqU6/nqu/jmjZMLihgsi8PdLbOivaxwelfEfW8hf46IZ9PcXgRy5CwjH1ak95UszAMOwX78MrCVKQ8UpovHVzMeCjmc8HsIRM5ZoWkR1Qu1Tibu0mJes1VKgDrYX7GGJbfIWsCJkFU3QG9DhRi6DM/x3CypKhaHeHq8xEcmei8RcMCWVUioiDbyRPxSQ7U2r71gxlKicdHMSAgTU3Moqd5hOwawMig9jsdxkxd48iUJCV8hd3Wtm6qpvey7H5C0t6pMV5ZZSGpyXlWVe+smg+L4h6KJr68rbnIRRpzN4kjb94xixsaZgncH9RF9yEoDFDs8LTZ6AMoRMCy4P7coPpPhGabPAuwt3FQS8UNGAelBTJbPapsHnr5y/yf7bYiHk1et+vvEHrJtXXHfxLdtlyYeDAm8BjD5DWg7fjThdA4uvnd1k3hjA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eafd0367-7ede-494e-e2d6-08d86fd1ad10
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2020 23:42:41.8826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rrU2wM4Xo0dq7v1oLrcypQ7BOfrBORTf6pZc1ywa+GEWmEN++P+l475vmpKNWM39ZF0Vi2GuML3HgcKGmNjz3zvq9y6ovbpVV7Y52bu9TIo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3816
Content-Type: multipart/alternative;
 boundary="------------A0F78AA26254398C894C7328"
Content-Language: en-US

--------------A0F78AA26254398C894C7328
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/12/20 10:00 AM, Leon Anavi wrote:
> - Add setuptools as a dependency
> - Fix string comparison and deprecation warning
> - Update release checklist to deploy from GitHub Actions
> - Use Release Drafter to draft GH Releases from labelled PRs
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...hon3-prettytable_1.0.0.bb => python3-prettytable_1.0.1.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-prettytable_1.0.0.bb => python3-prettytable_1.0.1.bb} (86%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-prettytable_1.0.0.bb b/meta-python/recipes-devtools/python/python3-prettytable_1.0.1.bb
> similarity index 86%
> rename from meta-python/recipes-devtools/python/python3-prettytable_1.0.0.bb
> rename to meta-python/recipes-devtools/python/python3-prettytable_1.0.1.bb
> index e5688a3866..a065b6c475 100644
> --- a/meta-python/recipes-devtools/python/python3-prettytable_1.0.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-prettytable_1.0.1.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "http://code.google.com/p/prettytable"
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=c9a6829fcd174d9535b46211917c7671"
>   
> -SRC_URI[md5sum] = "fb31d4c94fef42f2caf9784c44d8ea82"
> -SRC_URI[sha256sum] = "98a3b74b1980e6a9392498e3a2a5406f6bd836f412843c2be23d9c88671747ac"
> +SRC_URI[md5sum] = "b5bd0acec56ae7ccf5ac22d3f671c3a7"
> +SRC_URI[sha256sum] = "6bb7f539903cb031fecb855b615cbcac8cd245ebc6fa51c6e23ab3386db89771"
>   
>   do_install_append() {
>       perm_files=`find "${D}${PYTHON_SITEPACKAGES_DIR}/" -name "*.txt" -o -name "PKG-INFO"`
>
> 
>

--------------A0F78AA26254398C894C7328
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/12/20 10:00 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201012140022.15761-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Add setuptools as a dependency
- Fix string comparison and deprecation warning
- Update release checklist to deploy from GitHub Actions
- Use Release Drafter to draft GH Releases from labelled PRs

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201012140022.15761-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...hon3-prettytable_1.0.0.bb =&gt; python3-prettytable_1.0.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-prettytable_1.0.0.bb =&gt; python3-prettytable_1.0.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-prettytable_1.0.0.bb b/meta-python/recipes-devtools/python/python3-prettytable_1.0.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-prettytable_1.0.0.bb
rename to meta-python/recipes-devtools/python/python3-prettytable_1.0.1.bb
index e5688a3866..a065b6c475 100644
--- a/meta-python/recipes-devtools/python/python3-prettytable_1.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-prettytable_1.0.1.bb
@@ -3,8 +3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://code.google.com/p/prettytable">&quot;http://code.google.com/p/prettytable&quot;</a>
 LICENSE = &quot;BSD-3-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=c9a6829fcd174d9535b46211917c7671">&quot;file://COPYING;md5=c9a6829fcd174d9535b46211917c7671&quot;</a>
 
-SRC_URI[md5sum] = &quot;fb31d4c94fef42f2caf9784c44d8ea82&quot;
-SRC_URI[sha256sum] = &quot;98a3b74b1980e6a9392498e3a2a5406f6bd836f412843c2be23d9c88671747ac&quot;
+SRC_URI[md5sum] = &quot;b5bd0acec56ae7ccf5ac22d3f671c3a7&quot;
+SRC_URI[sha256sum] = &quot;6bb7f539903cb031fecb855b615cbcac8cd245ebc6fa51c6e23ab3386db89771&quot;
 
 do_install_append() {
     perm_files=`find &quot;${D}${PYTHON_SITEPACKAGES_DIR}/&quot; -name &quot;*.txt&quot; -o -name &quot;PKG-INFO&quot;`
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------A0F78AA26254398C894C7328--

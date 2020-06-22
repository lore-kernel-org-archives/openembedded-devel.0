Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.89])
 by mx.groups.io with SMTP id smtpd.web10.17561.1592833635092089048
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jun 2020 06:47:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=W/SRKW6A;
 spf=pass (domain: windriver.com, ip: 40.107.93.89, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TZfwkCgPE+HhHa6HFy1LCdITjmA1LZfEJ9aogHulQrFGGubjGVbROkKnQoA/BLO+wHRt/YQjmgXNXI2pKep6x8+xH4crHwL5vjqFxt0Rb2j1PTF2lSsyKzrqB5yOasl7cnH0GavAyrFwlQT6fr8Kj1isDV/vwCg7nXfLnnc8GrvG0NRmmAzecAdVA+wOHrGai7fkcA2/QjsBoudQpqmkN7htDdyTGX6+UB2uiJJTEktmK7LFXfor1MhXLqOnRttXDbcZe+9jsPTvHrAnDYgnhuM7CnmJSaJaoiHcvmold/MwAqnM6qNGzLQjFAY9q7G1p07rJ7omzriugkdOa0u74w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kIKcRIXfCMu5ktePG8PHouxwPXsAQR+f3e2IB5heiNg=;
 b=hXZRAu7owPFNgZY4AVMDyCoFX5RtDWj1eth9E6TcIxH0SNuwnf7vHJjOzxaVr0sAXm1OiHBFO/AapVanRpk6ha7ZqJgi6/pi1lkPny70un3u3Hwot5RLtfJrd/2aBm+ZjkLntGzb4g42bCxVm3wrL6en+pKchZzoCIsPZ0aB8Fb9BeybKVepX55g2kqu0JVmFyT8Gu+icrB5ISLw+ObBv4mPro7tndApiOMk7pLVbFD9A1cgPoTj94wWDT4Nfn0nkWbkWn5AbQnvyhJPQ6Ns+VtfyWFa58Y74WJaw+SgzNkApQuk+Xqk9pWT6ZSHzVkYJ9E8l1MMvc20rzPx8ouJyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kIKcRIXfCMu5ktePG8PHouxwPXsAQR+f3e2IB5heiNg=;
 b=W/SRKW6AQjWVA+Ww7RptqO2QVxS10lCD+Wij22pNF9ofD43XnMFy7Jfs8X6nmkdG2ZlF3tihW5RdnsM2HNxhXFFXXOdBO7SyNxWn1JL8ovEl8Wzg33nlorR+Rzx0Fyr9PzHPYcOs0l36mN8QWFrTwPSNbh+oxb7xFi7R6zfVETQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN7PR11MB2546.namprd11.prod.outlook.com (2603:10b6:406:ad::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.23; Mon, 22 Jun
 2020 13:47:14 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.027; Mon, 22 Jun 2020
 13:47:13 +0000
Subject: Re: [oe] [meta-python][PATCH 2/3] python3-toml: Upgrade 0.10.0 -> 0.10.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200619094638.7116-1-leon.anavi@konsulko.com>
 <20200619094638.7116-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <953da316-9f1f-9cb3-6c70-d80946936a9c@windriver.com>
Date: Mon, 22 Jun 2020 09:47:11 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200619094638.7116-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0062.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::31) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0062.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend Transport; Mon, 22 Jun 2020 13:47:12 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84616c69-5a66-459f-9dbb-08d816b2c464
X-MS-TrafficTypeDiagnostic: BN7PR11MB2546:
X-Microsoft-Antispam-PRVS: 
	<BN7PR11MB2546E05A928CE50020304B479F970@BN7PR11MB2546.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-Forefront-PRVS: 0442E569BC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Wnz9eKNrt40vCK7xexm5MdQ26W1XHArbL/a7KfozfVB9s+Jt5wpYB8nkURpVbICDGyBMpeYlh1vaGzpOsBzPcDZnpq9cHJZ6Qi5ksIE8inbF752ee+P7zeRF7cDt0+aliC0P8O5PRZWl1MGH9xRqaasa25xHsqRr1PvnXzemSePfIxDSawdOsg81ji5kM997igAqlU4G870JZgwCSb1BAoDp3A2SAuFfINw0WPiupB6lE0i10cVD1zAz9JcMmPjQ0ufbKAOoxn2EPM+tvqk+IUDUClCO3/ZeDYOjzmK7acQZ5zFOU8DjvsK8WDv+JxvWn2XBcCTuANwNwxuZly3SDeyJtRe+4Oc9QyoGt5G77/MwW1lWeRDivbzfLSiOtM0ZA26fl71izd8RXeXuf0LwrvasGtcS+Dsg9fmLHV1REyHPh2IWMGDE33vr57vgHldZxDR3RQc7+XXnyAZicgEg9w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(346002)(366004)(39850400004)(396003)(376002)(66556008)(36756003)(2906002)(53546011)(186003)(6486002)(166002)(16526019)(52116002)(31686004)(26005)(83380400001)(31696002)(5660300002)(86362001)(33964004)(16576012)(44832011)(316002)(66946007)(66476007)(8936002)(2616005)(956004)(478600001)(966005)(8676002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	WpFTymWPkHJWhLqtOXaJJEZmBq1MJ1qI7jxAoreAT7AumVc0hPtLWmvmu2wrBcaQ76bNB7R9Pzd2Q5UR+OwMoSo99IHpOEmusy66xkoeD29fPRHq3IQJLwadbV35SYTA/0g9stxrCJIMv2sYFoo6K7v1Xnc/c1TGba91e/IQx5tFD8kGzPGvagtl9IqL/Y51F19Mg6i/Gt+Xj687t3CMFBHbLzBYk61MPFstc202dmYqLiE/7K0lvjbkRa2QHSqexZ0u7hefM+60ERjihOR8YF40AWQzrPb95GH4kjXrp9AmvGyEbEajHFEMDCB+uWSkp+aQyINJ3+q3e76ektsF0RjXmEgwbq1TD7yxQG8LV29g3/17Qks7ltqNhkgUwkP4LTuy34C1FqUzo6rr4zDEN92iFuSdjagvOm9EQeoS+w7oR9DfbzM+T6bK7yo+RUKRWfQQ5g2brjs/8juZw8ReR/WcgsJhxlmSQ4DS983AryU=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84616c69-5a66-459f-9dbb-08d816b2c464
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2020 13:47:13.7136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0QZmvIyPThh+QYGi+GIJCHMDCzgJPXpPTar5kGGpalq1++nXXAOcpSX9mT6y0e7aJF7GCuiKK03s/feAOPUNHGhR08UGC2w5+JGgqUJY1Ws=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2546
Content-Type: multipart/alternative;
 boundary="------------812A9E644B2A6759979B34B5"
Content-Language: en-US

--------------812A9E644B2A6759979B34B5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/19/20 5:46 AM, Leon Anavi wrote:
> Upgrade to release 0.10.1:
>
> - Removed test for unexpected EOF while parsing string
> - Raise an exception if EOF is reached and a string is
>    unterminated
> - Allow loading from bytes paths.
> - Fix the issue where the parser fails on time attr with no space
>    after =
> - Fix trailing whitespace in break
> - Handle arrays of multiline strings
> - Fix bad syntax handling
> - Improve professionalism of error message.
> - Extend TomlNumpyEncoder to numpy integer types.
> - Fix loading values when a line has " }" after a boolean.
>
> The copyright notices were updated and the md5 checksum has
> changed. The license remains MIT.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-toml_0.10.0.bb => python3-toml_0.10.1.bb}      | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-toml_0.10.0.bb => python3-toml_0.10.1.bb} (54%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-toml_0.10.0.bb b/meta-python/recipes-devtools/python/python3-toml_0.10.1.bb
> similarity index 54%
> rename from meta-python/recipes-devtools/python/python3-toml_0.10.0.bb
> rename to meta-python/recipes-devtools/python/python3-toml_0.10.1.bb
> index b72753b80..00f38c6c3 100644
> --- a/meta-python/recipes-devtools/python/python3-toml_0.10.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-toml_0.10.1.bb
> @@ -2,10 +2,10 @@ SUMMARY = "Python Library for Tom's Obvious, Minimal Language"
>   HOMEPAGE = "https://github.com/uiri/toml"
>   LICENSE = "MIT"
>   SECTION = "devel/python"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=6d6012eea477117abf51c31262a152f8"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=16c77b2b1050d2f03cb9c2ed0edaf4f0"
>   
> -SRC_URI[md5sum] = "63fffbe2d632865ec29cd69bfdf36682"
> -SRC_URI[sha256sum] = "229f81c57791a41d65e399fc06bf0848bab550a9dfd5ed66df18ce5f05e73d5c"
> +SRC_URI[md5sum] = "743131c431419fe42f854cff02ad3abe"
> +SRC_URI[sha256sum] = "926b612be1e5ce0634a2ca03470f95169cf16f939018233a670519cb4ac58b0f"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------812A9E644B2A6759979B34B5
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/19/20 5:46 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200619094638.7116-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.10.1:

- Removed test for unexpected EOF while parsing string
- Raise an exception if EOF is reached and a string is
  unterminated
- Allow loading from bytes paths.
- Fix the issue where the parser fails on time attr with no space
  after =
- Fix trailing whitespace in break
- Handle arrays of multiline strings
- Fix bad syntax handling
- Improve professionalism of error message.
- Extend TomlNumpyEncoder to numpy integer types.
- Fix loading values when a line has &quot; }&quot; after a boolean.

The copyright notices were updated and the md5 checksum has
changed. The license remains MIT.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200619094638.7116-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-toml_0.10.0.bb =&gt; python3-toml_0.10.1.bb}      | 6 &#43;&#43;&#43;---
 1 file changed, 3 insertions(&#43;), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-toml_0.10.0.bb =&gt; python3-toml_0.10.1.bb} (54%)

diff --git a/meta-python/recipes-devtools/python/python3-toml_0.10.0.bb b/meta-python/recipes-devtools/python/python3-toml_0.10.1.bb
similarity index 54%
rename from meta-python/recipes-devtools/python/python3-toml_0.10.0.bb
rename to meta-python/recipes-devtools/python/python3-toml_0.10.1.bb
index b72753b80..00f38c6c3 100644
--- a/meta-python/recipes-devtools/python/python3-toml_0.10.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-toml_0.10.1.bb
@@ -2,10 &#43;2,10 @@ SUMMARY = &quot;Python Library for Tom's Obvious, Minimal Language&quot;
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/uiri/toml">&quot;https://github.com/uiri/toml&quot;</a>
 LICENSE = &quot;MIT&quot;
 SECTION = &quot;devel/python&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=6d6012eea477117abf51c31262a152f8">&quot;file://LICENSE;md5=6d6012eea477117abf51c31262a152f8&quot;</a>
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=16c77b2b1050d2f03cb9c2ed0edaf4f0">&quot;file://LICENSE;md5=16c77b2b1050d2f03cb9c2ed0edaf4f0&quot;</a>
 
-SRC_URI[md5sum] = &quot;63fffbe2d632865ec29cd69bfdf36682&quot;
-SRC_URI[sha256sum] = &quot;229f81c57791a41d65e399fc06bf0848bab550a9dfd5ed66df18ce5f05e73d5c&quot;
&#43;SRC_URI[md5sum] = &quot;743131c431419fe42f854cff02ad3abe&quot;
&#43;SRC_URI[sha256sum] = &quot;926b612be1e5ce0634a2ca03470f95169cf16f939018233a670519cb4ac58b0f&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------812A9E644B2A6759979B34B5--

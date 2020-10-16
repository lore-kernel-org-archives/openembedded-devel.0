Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.89])
 by mx.groups.io with SMTP id smtpd.web12.21559.1602868635005702323
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Oct 2020 10:17:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=UVs0jwtV;
 spf=pass (domain: windriver.com, ip: 40.107.77.89, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T+ac7e9/IVIgmNcT2z8LGyfbiAHv7iIQEP6DSPoGFPCV5MFR47p5ZY/WMG6ZCCaC+fQReY1IBUg6+BVZj2Oow1BDM/Qy1WGgsN569KSZCYxUyi2LAHFqI5V4/UFVCqjzOdx6VImaMG+Zje5uvAeKVDZ0wWhqEMwPmcURHN7BOUnOqz8KtIaQ4PVFv2bKHV8s0LhrkgyaZPCdvlWaIjr+JmiUh9Izkfg1Xxtht3M0dWLOUQawzre8dBD9sqiZ8CC350sxZA978H6CoTVPZfHNubI1HjRyhklp2KEg58Bst4ymLP76EvIee0KhI0a6P4f0zo3LTJbXSIT34ismj9ynhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LiK94qfoHzNZyiF3Kh8q8lGj28s1eBxAw9o8NJvEYcw=;
 b=UthG0u/Y55Th7Bpj0TGMHixGP2LMjDsl71OrZ5D7cE/GRe0UcAChkaBWXv3eDD+qZzVkOMVzZaeXqIYSDIoc4BE09H7zwEbiIhEaIMs1dIbK9j0uVFSuUpL+H9U6xJjKJUILznMxA2M/olvwiEikxOJjxEb9MDddQJxLaOlqv6WxW91aZxT+ndcok4q5Yy06XnprfZwvzYnIkySNI9fMwm6SEXGryRcOxpU6RPjLuqEd7NmMeBoO8tIxsng8Qy8C15WfMdCMEFf08dgwqatuF+uT9UMsLaa1smnMcAaZmEtk0aueyXaDxIs9g/mVjsk/K+YIJnmMMQQYEKOSjKQALQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LiK94qfoHzNZyiF3Kh8q8lGj28s1eBxAw9o8NJvEYcw=;
 b=UVs0jwtVlwyuU4xzQdaxQQGqB2axm2FtNf8sYaGR/b4X9JZkWKRYkmNibygMvmwXFwLtDHy5PH+xcFGMlmuluSDl8jZAnI/KNXoMlS45rp9c0Lz3tBbjEXQpp3TpmJV5vXjCKDotqkoab7KtGU+o0283Ukwv2fxUbKXrBgxa3N0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4241.namprd11.prod.outlook.com (2603:10b6:a03:1ca::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25; Fri, 16 Oct
 2020 17:17:11 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3477.025; Fri, 16 Oct 2020
 17:17:11 +0000
Subject: Re: [oe] [meta-python][PATCH 6/7] python3-prompt-toolkit: Upgrade 3.0.7 -> 3.0.8
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201013085914.31580-1-leon.anavi@konsulko.com>
 <20201013085914.31580-6-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <d597a77f-ee6b-6773-b951-bd2d6a29ccde@windriver.com>
Date: Fri, 16 Oct 2020 13:17:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <20201013085914.31580-6-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BY5PR17CA0062.namprd17.prod.outlook.com
 (2603:10b6:a03:167::39) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BY5PR17CA0062.namprd17.prod.outlook.com (2603:10b6:a03:167::39) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.22 via Frontend Transport; Fri, 16 Oct 2020 17:17:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e79ba78-74f0-48e2-98bd-08d871f75147
X-MS-TrafficTypeDiagnostic: BY5PR11MB4241:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB42411299945560BA032ADDFE9F030@BY5PR11MB4241.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:632;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	e0zRnpj8NpUPs6ziKsyTbSm3uuhbsr6hWOkBD9fxMeRI13puJg36/AstHxHvV4uQEF0IWlojV6W15nqVixrW1q2mgHtlm6TSdR86eCywofTCxsH0dgUClSsyChrgFB93aBPgVgl438katfNzfChenL16Gw1rcsLhWqhzDVmtVLgpstue6IAn3xhN42trVsZjud7EyGoBcyAd/i/PzIcJWJeJtycHjlZ/WrP2rVUXhRAlQFPJIlvm9PqdXl0M8UfR4yOLWfgYQwwTw1a6fInYCUfWRs4k2k7ByLtilN49q+eGIYeS1jxCHMcESxYjzi3+9R2rhm3MtfVULg7NGH/kVBf1BkDB52B3IBLk3oBL01duTxf/uix5VmhQjZuQtl5IUsXAMBBXk6PRxIIrTzJMaBy0Xyx0mJcEauLG0us7jcj1DldOdTa0N76TDnvTWnmB7uEkFK+C5KFnGDU/ZBvvO3B2qqr/9M6CdT+X2Res9Fo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(136003)(366004)(376002)(396003)(83380400001)(16526019)(44832011)(166002)(2906002)(478600001)(966005)(26005)(86362001)(6486002)(2616005)(956004)(186003)(53546011)(34490700002)(66476007)(66556008)(66946007)(316002)(31686004)(52116002)(5660300002)(33964004)(31696002)(16576012)(8936002)(8676002)(36756003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	HtuSu74vAR8CNorO4p7u57FvpugPBezQOUrA3hN3ESPHeWoCg3T8crUUru8hfl/0tmmE4LPqG7u4KEmDNZkx0nV4R4DnzK7IHqiZtgPEvnFzvNOXbowro/FqkZ5q1YxJzw6TCzYfiq7En5/zZRV6PmSGxmYkBe4wIHRsc1qTz4UcrcGfX0IrVfgmbwYQvpHQ4oSzscAAnhypnYpHcahNcZq+aPUEzxpdO6wewKlGKePeU3mTLnfNLJHxie5L1l1aYzi9Orx9YjVZnm/axEmHLwZFuCG3bBrf7hkk1gF/Mf5iL65KDofB/M8PmLR1oY+wqnsXFxvmauUAV8CQssJpINUx/Vv88CO/Kji/b2hsYPCkatrsunvwugHicnIBlVdyF2+OqoZthJI/Zi1TvfpVCly55QYEVXJRELHcrO0AS4PPKVkec1Pxm5PSrvZzhqJDd9NVldcxD3DPEAtWcnVQIf289gnKoLkK7FKPiq6RBLMfgVHjNPZdjHc5LjARsNXfRr2PfvG4WifcOW2SxGNNb+Cg0KvGLCDF3hiw+TI2HwbBBjcMR2HcPdqTqwUkOs16HoTpFvnsVO5zE1P3MXo1xxmnco5OtKTZS/iAatNCjv5GAau3dKwXNzIQfx0w7W5VRycQib8a+d17KZx7kk0kWg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e79ba78-74f0-48e2-98bd-08d871f75147
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2020 17:17:11.0870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oc1oOiuhgpzOXHv2BpY/dWiCXdfcmCSJ+xzkzLtvQnc+Ld/Xi96H/sQPkiCIgrhETqb7owKdnBcuw5fSWtKcnS836bkHwKsH6S6u8kOLHP8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4241
Content-Type: multipart/alternative;
 boundary="------------3127A95859B548ED0883AD07"
Content-Language: en-US

--------------3127A95859B548ED0883AD07
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/13/20 4:59 AM, Leon Anavi wrote:
> - Added `validator` parameter to `input_dialog`.
> - Cope with stdout not having a working `fileno`.
> - Handle situation when /dev/null is piped into stdin, or when
>    stdin is closed somehow.
> - Fix for telnet/ssh server: `isatty` method was not implemented.
> - Display correct error when a tuple is passed into
>    `to_formatted_text`.
> - Pass along WORD parameter in `Document._is_word_before_cursor_complete`.
>    Fixes some key bindings.
> - Expose `ProgressBarCounter` in shortcuts module.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...rompt-toolkit_3.0.7.bb => python3-prompt-toolkit_3.0.8.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-prompt-toolkit_3.0.7.bb => python3-prompt-toolkit_3.0.8.bb} (80%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.7.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.8.bb
> similarity index 80%
> rename from meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.7.bb
> rename to meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.8.bb
> index 7b0d1a0696..0debba48d2 100644
> --- a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.7.bb
> +++ b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.8.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://python-prompt-toolkit.readthedocs.io/"
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f"
>   
> -SRC_URI[md5sum] = "f1b34c688ef7dccccb951130f008f6fe"
> -SRC_URI[sha256sum] = "822f4605f28f7d2ba6b0b09a31e25e140871e96364d1d377667b547bb3bf4489"
> +SRC_URI[md5sum] = "cf3ca19873fa9e7f6162296cf6bae419"
> +SRC_URI[sha256sum] = "25c95d2ac813909f813c93fde734b6e44406d1477a9faef7c915ff37d39c0a8c"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------3127A95859B548ED0883AD07
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/13/20 4:59 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201013085914.31580-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Added `validator` parameter to `input_dialog`.
- Cope with stdout not having a working `fileno`.
- Handle situation when /dev/null is piped into stdin, or when
  stdin is closed somehow.
- Fix for telnet/ssh server: `isatty` method was not implemented.
- Display correct error when a tuple is passed into
  `to_formatted_text`.
- Pass along WORD parameter in `Document._is_word_before_cursor_complete`.
  Fixes some key bindings.
- Expose `ProgressBarCounter` in shortcuts module.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201013085914.31580-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...rompt-toolkit_3.0.7.bb =&gt; python3-prompt-toolkit_3.0.8.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-prompt-toolkit_3.0.7.bb =&gt; python3-prompt-toolkit_3.0.8.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.7.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.8.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.7.bb
rename to meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.8.bb
index 7b0d1a0696..0debba48d2 100644
--- a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.7.bb
+++ b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.8.bb
@@ -3,8 +3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://python-prompt-toolkit.readthedocs.io/">&quot;https://python-prompt-toolkit.readthedocs.io/&quot;</a>
 LICENSE = &quot;BSD-3-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f">&quot;file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f&quot;</a>
 
-SRC_URI[md5sum] = &quot;f1b34c688ef7dccccb951130f008f6fe&quot;
-SRC_URI[sha256sum] = &quot;822f4605f28f7d2ba6b0b09a31e25e140871e96364d1d377667b547bb3bf4489&quot;
+SRC_URI[md5sum] = &quot;cf3ca19873fa9e7f6162296cf6bae419&quot;
+SRC_URI[sha256sum] = &quot;25c95d2ac813909f813c93fde734b6e44406d1477a9faef7c915ff37d39c0a8c&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------3127A95859B548ED0883AD07--

Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.78])
 by mx.groups.io with SMTP id smtpd.web09.14935.1609774378277225156
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Jan 2021 07:32:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ADvmQQmr;
 spf=pass (domain: windriver.com, ip: 40.107.92.78, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BfR3gA53+WH9+ucge3Kw6B/20vHaHYclNR8OvpB4+SX6zvCNXonf5GIg3IEs5stT+roimPw0FEIPftniXTGA/IuJ+/yFc12TJLRYYv7BcyXDbg4xCCcXnRYRcCGKHnTgSUFiWIPmD3r6MAfFTXHUmuUpGuuQ1CJRMF+IAZhzASkIAfc5oRHSrU8UgCmIiErAkykne5MsEJ+EyPF9ZKgo0x3um09pvz/OmYaxNniXoYfCUd32q8WQREjCwNTUz9QtByaMllu1HfciwhVCgV3Wyj9KMhL4PuppC/l+w1ZFP2X+23j+c4Dj7TpwWPBK3SkCXLRbkWHLlZR8r/UwJkUonA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VR6otVS+HXdYGXT5fzPOzoKmHTZWgtlIZVuEYJAk6uo=;
 b=K83EpiqgfMaI+ZU3C7cJ5QnKrnEOvOsWZe498O6upD3lvjW8pjaYdXTF+YeS4zQoWizMjzkCfsp0w3V0GaA+eRajk6lzzO8reVxVLdIKylzTUcPq5G6oG0fjB3m0MNNTIOU15ftb1sVYqr+tUAC/bdlHuvJ3k/3ggPy+jr3IUjko3/3fAaB87B3KAviqR3T7DAxQQE283oISiFNb4zRqtDU3pCKgGDsczG+fXmYJ9TDLbSZ7cjEBQpEpJIdE13YyMM+kq5/2VTue5HvQgBaVnEtVU2xP7IeZe/F0MBZ58ucZzccUa2fPQjVkO/5RU9fk1tHtQdA4lOMpbIqj2IKsjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VR6otVS+HXdYGXT5fzPOzoKmHTZWgtlIZVuEYJAk6uo=;
 b=ADvmQQmrjpXQT4+ih7Ot3pHOlRMq3mJUmz/ibxTCfnIYKaUiKdTfk7ZhUdaORboXDw6Pl1ZfVzFhzyYfG1i512SpfMBj2092ld78JMkXG0ha4wpRiJU2UmqwQDjHluEjAn2neQ0fyjezH6Qey7yk5F8u6BxWTO/c4Th2oqWNc0Y=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB5053.namprd11.prod.outlook.com (2603:10b6:a03:2af::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20; Mon, 4 Jan
 2021 15:32:57 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6%7]) with mapi id 15.20.3721.024; Mon, 4 Jan 2021
 15:32:57 +0000
Subject: Re: [oe] [meta-python][PATCH 1/3] python3-natsort: Upgrade 7.0.1 -> 7.1.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201222215727.25166-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <f1548ba6-621b-f0cf-575d-a34effd586aa@windriver.com>
Date: Mon, 4 Jan 2021 10:32:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20201222215727.25166-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL1PR13CA0351.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::26) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL1PR13CA0351.namprd13.prod.outlook.com (2603:10b6:208:2c6::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.2 via Frontend Transport; Mon, 4 Jan 2021 15:32:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b4f7de2a-c956-4cbf-b898-08d8b0c602e4
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5053:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB505340E4B30353B845C15E739FD20@SJ0PR11MB5053.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ASqcsXL605z+RVxFQLizHue6LxZn4BBF37aqX0vd7z96LCxUcuazxgoEs5RCBhsCBHQfTu+IfIxL3DyrbWGyua2VU67omOxHaH7om36Bcj3mTEGXXKqu9UOrrZafdRNCQ5ohhYg50Kj4ho8eXzvLGlCYccdOAB5JNXHFXFPHATS+09wJpsNRE/ZdPgvRqI4LbpXuoKCBJBKpUSXeKb3ZVNpsFcIBOztVvuzqtkHAafHssTkqUo9WC4sFOjvR0KOz5dWgOoManH1V5Xr6r/+WMHk2M3aCEPhMxkgywBux/TPVAWPnfBQ7Ox2pGTZDE/zG/DZpCnWmrfwRb/LHarQL094Hrm6e3qJK0/xmNcMTENSieN+dhve6ilNTCr9RCI+qUB/qEUJ/iudEbCnp/RL5rS1a+6JHxJFR0jNOP7sfCcX8vfENqU8sGD0dRqPGeuCFjwNHkdxk77miRH8GbfaJ3IWqJ9EheqBaCBw23joLUFgAlGY5Tj5cxvt0yZIUgKgRnV8PkVkrslFywS+PB8eE/fc2ERWkDvS4/1IsfmcadENjHjIonZy4ueOHyqHDsJ5U
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(346002)(136003)(376002)(396003)(66556008)(52116002)(2616005)(478600001)(53546011)(166002)(66946007)(36756003)(966005)(66476007)(26005)(31696002)(6486002)(4001150100001)(16526019)(2906002)(956004)(186003)(5660300002)(86362001)(66574015)(8676002)(33964004)(83380400001)(44832011)(16576012)(8936002)(31686004)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?NzRZN3NwM0lEeUI0UGRzRENFOVNhQS9jMlM0REpIOUhWQXRuZnMvVThib3Z1?=
 =?utf-8?B?WkZZd2d5b3B5M01kRkVyYnpObVVseWFZZzEwcGlzSThFVmcyM0t2dUk1SGZI?=
 =?utf-8?B?aDRYWHBDK3FlM3pSMUJLdHlwdWUzekd3cmlYQml6MGZYcGFxR0pla1Zyenp2?=
 =?utf-8?B?QzlmTUdBcjNXWk1kOUVoNkdUQU9pVWpDMDlvWER6cUZPZDFncStCNDlYbExl?=
 =?utf-8?B?STd3VG1HK2tIVUJQM1Z4Vkhiai9lNGI3eUN6UktsTUttUFZJL1c2bXJONGZv?=
 =?utf-8?B?SXFweEVpNnVXWXlZS2FvVjNDY2I2UVpCVm0zbDliVk5ZenQxckNaT1IzaUJN?=
 =?utf-8?B?SlowQ3U3eWh6MWxSYjVYQkpxSjlWR2lucGhPZ3gvaFlMUFFlR1dlNENkUHhH?=
 =?utf-8?B?VHBKblcvaXJPMUxOMy9hcHFwdjcvWmw5UkVlVXJBbG02UGhFSkFxYTE0Vi9P?=
 =?utf-8?B?QVQzbjF2WW5pT3VIRmdWWWZlOC93S0pPckVmZll0NVYwV2lhQjBBckJtNXp4?=
 =?utf-8?B?VEdzZW4vcnduZEhvWGU1L21ScWVqWXkycjhkNWpPRE9UTHU2dGpBWk80K3NG?=
 =?utf-8?B?bjBKbG9iQmx4cVpKOWJBaytHZlh5OFI0WVJlaExZMkw0dXh1ZzJDbFI4d0Ey?=
 =?utf-8?B?WFdqdHJ1cEVqMkprWHJ4dVA1OHAwV1V1cVZ3QWwzUG42SCtMTUZWb2szeDdT?=
 =?utf-8?B?TEQ4U0VCMFpOZm5KcWUyVFp6ZGJXTzJBRlQ3eENUdkgzeWh4OEJQbitabndw?=
 =?utf-8?B?cmk5TUhldzNVdmVPQzJqUGhJVXZ6MDJmTkFEejVKZzl1aWhGL1Mvc3prYW1i?=
 =?utf-8?B?Zm1OTjFUSm9odVJDSmFveVdyNENucDRLcUpMN0J6blFULy9aWFVqVVlKQmdD?=
 =?utf-8?B?Vmx1Y1Q4d3NtMGJvY2Y4R0VEZlVlaDdKZTc1WnJrZzFrbnMwRG00NFZuRUZv?=
 =?utf-8?B?VUYrQ2F3TktpVjFpQmtwRi9YclJDY25XVDZiWE8wUWlVb2Q3ZnZXNmFtY2Ez?=
 =?utf-8?B?MEJKSmR1RHQxcDVtM3lPTE54WmttbjUzaWRsSUVHTUFCTG5xRlBIOFhlT3d2?=
 =?utf-8?B?bTZ0bXJUTjVHVm5uNGp4MVhxakVTbk92ajN1aGcrS3NJQ1BUM0tPb0djZTJa?=
 =?utf-8?B?c0VHSUNJMmNNZnhWV1N5c01EL01oMTFNL0pscU43OFZDR2ptRE5rYjkvM0Zs?=
 =?utf-8?B?TUNJZUpDaE9RM0lVYkxadFNERHAwbU5VdFdJQlJiM1NMKzUwR1JrZC8yc3JB?=
 =?utf-8?B?OEJOdFpxL1dFOFIxdityd1hIeXV1aGx1NnVFQzVEMjZMVS9JVGwwVmJHaW9p?=
 =?utf-8?Q?fYEFF37BwdjY4PldwY+fjZhA7MPPq3cX2O?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2021 15:32:57.0153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: b4f7de2a-c956-4cbf-b898-08d8b0c602e4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T7NGkvmbiLvyjw4+XNOO843zw/M6W55D+acF5kcx32DsyhCaEWysfJJ5UJjEJxL98IWFtRzWftztAgNC262D1fy2djbY+v9m2MnXBLzjhlY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5053
Content-Type: multipart/alternative;
 boundary="------------30B07DEA223ABFAB7AAD3B05"
Content-Language: en-US

--------------30B07DEA223ABFAB7AAD3B05
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2020-12-22 4:57 p.m., Leon Anavi wrote:
> - os_sorted, os_sort_keygen, and os_sort_key to better support
>    sorting like the file browser on the current operating system
> - Support for Python 3.9
> - Treat None like NaN internally to avoid TypeError
> - No longer fail tests every time a new Python version is released
> - Various typos, missing figures, and out-of-date information in
>    the "How it works"
> - Fix typo in CHANGELOG
> - Updated "How it works" to account for Pandas updates
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-natsort_7.0.1.bb => python3-natsort_7.1.0.bb}      | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-natsort_7.0.1.bb => python3-natsort_7.1.0.bb} (75%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-natsort_7.0.1.bb b/meta-python/recipes-devtools/python/python3-natsort_7.1.0.bb
> similarity index 75%
> rename from meta-python/recipes-devtools/python/python3-natsort_7.0.1.bb
> rename to meta-python/recipes-devtools/python/python3-natsort_7.1.0.bb
> index e20cdf0fa3..c890ae2432 100644
> --- a/meta-python/recipes-devtools/python/python3-natsort_7.0.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-natsort_7.1.0.bb
> @@ -4,7 +4,7 @@ LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=6a96e5ad780a0eea866ecccec4463517"
>   
>   PYPI_PACKAGE = "natsort"
> -SRC_URI[sha256sum] = "a633464dc3a22b305df0f27abcb3e83515898aa1fd0ed2f9726c3571a27258cf"
> +SRC_URI[sha256sum] = "33f3f1003e2af4b4df20908fe62aa029999d136b966463746942efbfc821add3"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------30B07DEA223ABFAB7AAD3B05
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-12-22 4:57 p.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201222215727.25166-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- os_sorted, os_sort_keygen, and os_sort_key to better support
  sorting like the file browser on the current operating system
- Support for Python 3.9
- Treat None like NaN internally to avoid TypeError
- No longer fail tests every time a new Python version is released
- Various typos, missing figures, and out-of-date information in
  the &quot;How it works&quot;
- Fix typo in CHANGELOG
- Updated &quot;How it works&quot; to account for Pandas updates

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201222215727.25166-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-natsort_7.0.1.bb =&gt; python3-natsort_7.1.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-natsort_7.0.1.bb =&gt; python3-natsort_7.1.0.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-natsort_7.0.1.bb b/meta-python/recipes-devtools/python/python3-natsort_7.1.0.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-natsort_7.0.1.bb
rename to meta-python/recipes-devtools/python/python3-natsort_7.1.0.bb
index e20cdf0fa3..c890ae2432 100644
--- a/meta-python/recipes-devtools/python/python3-natsort_7.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-natsort_7.1.0.bb
@@ -4,7 +4,7 @@ LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=6a96e5ad780a0eea866ecccec4463517">&quot;file://LICENSE;md5=6a96e5ad780a0eea866ecccec4463517&quot;</a>
 
 PYPI_PACKAGE = &quot;natsort&quot;
-SRC_URI[sha256sum] = &quot;a633464dc3a22b305df0f27abcb3e83515898aa1fd0ed2f9726c3571a27258cf&quot;
+SRC_URI[sha256sum] = &quot;33f3f1003e2af4b4df20908fe62aa029999d136b966463746942efbfc821add3&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------30B07DEA223ABFAB7AAD3B05--

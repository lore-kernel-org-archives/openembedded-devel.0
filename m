Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.83])
 by mx.groups.io with SMTP id smtpd.web08.25.1612303781655032965
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Feb 2021 14:09:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=mfa93e4U;
 spf=pass (domain: windriver.com, ip: 40.107.93.83, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a4uh/BClIAsMk7521Ycm/EIQVEjJ0wMJ/8noRBh6aCYpBQT5Ork03ECcl2g25hf+BG658OF7xMvf6NDbXG+bV2Upo2cZ1oe6SikNnNJ32PVr1tyOX8a82Mq2r13ZACQRr/9J9+XhEzVeeXHdTjhXcc0gAR/hoppIAd5Yi428H0iQApbSBzUrfFSB5FuEINVeNImKzgi1hDggkHKqbC3EYfMKOqwOfCshJblSWrX568coKEYxCil0Q7dtoK71sBmMuWl1LEBVtd4KK9eBQlcYhuZByrMyw29vSCBRIQ+ShBnGqEYL2Bo2S7BqA/ipz/cH/Dp+VtB/EYl1vkWcCVA+jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=19c2KISDZ9BekyNVKiozlhPjMZvAHdVignpofFbhAM4=;
 b=IMfe5dCPBS65/G3VDon16meZ2XRqI5SO/4F5sxmHF8LR+bIZgSv6TfV5AviNvKaqjJg7iP8YT0nRuU/V6YuUii4N1yrbV4mHxV5Jq18Ygf5mtk+U1rNIWes73EEUMqwTcr4VP+nQdzN7K8hoANjHI3Yub2UalCYEGH7rFnOc1sMFqq+YGwFrhAYZ8xnSfFvuct4FyFo5/N/GXGJLBsr5HR7lHbggVtt/tcW4eLRs12ABxCFMjB1+pqrHmI43+i1OgSOL8EKMBEiJbm5wgy/OzSlgkfYObOcpja5Yokh+gBpKvHy9UI+y80nM+SRmjKnqD88rvX+A66OJGOof38xXeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=19c2KISDZ9BekyNVKiozlhPjMZvAHdVignpofFbhAM4=;
 b=mfa93e4UPSkLgMOzR8Yw/J3H/pQztlXQeGTTIqEpf3r+hmq3oFx+ktq2HK/8Fqp6uCnz/Qtd8LrwNma4Yu1n/IsWI+pGlLT5Cn56LLva+NSEe6aDJKjHGTEqjCoXXpCJbVwfda0bTqFgbey/6zn24CT1PHNGUTuDZiTFMUhTeUs=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3448.namprd11.prod.outlook.com (2603:10b6:a03:76::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.22; Tue, 2 Feb
 2021 22:09:39 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3805.024; Tue, 2 Feb 2021
 22:09:39 +0000
Subject: Re: [oe] [meta-python][PATCH 1/5] python3-cmd2: Upgrade 1.4.0 -> 1.5.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210201124516.30135-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <2c6b93fd-467d-e047-a011-314c36d756b2@windriver.com>
Date: Tue, 2 Feb 2021 17:09:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210201124516.30135-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL0PR01CA0034.prod.exchangelabs.com (2603:10b6:208:71::47)
 To BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL0PR01CA0034.prod.exchangelabs.com (2603:10b6:208:71::47) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.18 via Frontend Transport; Tue, 2 Feb 2021 22:09:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc719969-b10e-4e6b-34a4-08d8c7c73bc7
X-MS-TrafficTypeDiagnostic: BYAPR11MB3448:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3448AFC2565784465DACBA0E9FB59@BYAPR11MB3448.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DtdSh1fHnnO4ad0gpXWrt+GN+yYut3D1bqwPIHVRY1ABjZ08RLOHruGTqevIiJqG+iA9meQh9nun6Fnbw7nX0/OJPSdKLZAo+O8upZYnscajeACmqNcqafpskLXOK8qqEnwap8zxSqv5RmButnQIZnbpMO8nOA0WsQrsol3YNSRi5xk7EnGhhGnjNqNc9JdNRjC+G/iuKIDTwQ1QAMBmx9ylqoiDL6BEubQGZFmB02nI2Prn0ru9S9gq74BxNBC4Cwe+6ORpBw/k8zGUacDtypS/ZuD0rkUggdDPwOf42ZeodxXO35GUjX7Y5ShfMUOCWNukeHEOzS/Sv7g55lpLAy6wWtp7YbVGh/1yqWYGixRN4MyhW8NNh5jh3E/ERoHmtSoHpC0ivTrn/QdkyVFxXOA8PJnLlSVofXT7+vZ+nUXC2zxwDH3ZqiDIBOKKVDusNxLlGk/yfrHZk4hCepenwFYRL46yo5zXOx5H6+KDQu/WEo/Dp+/oaWZF+6V42U7lfmdXZKhBdvGqDw8/OPKEXeiVs7Qj/qSXU4BoD2df57MPGhSOeRwcP3+WUfebAFPsdpmD3pA1jrAX/LIkFQexLF9oYBT1T8H2ENOkZWl4wVW0d+jZOpOM8jGc09JiPj88RZMxEV7dMV7v7ZdX34UzgQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(396003)(39850400004)(136003)(66946007)(31696002)(186003)(86362001)(26005)(33964004)(8936002)(31686004)(8676002)(478600001)(52116002)(83380400001)(316002)(16526019)(966005)(5660300002)(956004)(2906002)(166002)(6486002)(2616005)(53546011)(16576012)(66556008)(66476007)(36756003)(44832011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?RDZnZ1pESVRybFJURVcxYkR5a3ZteWhSWVRFYjhQZ1JrUGNQNSs1UjM4dllE?=
 =?utf-8?B?aUc3NStST1lGYlRvanFZeE5XZFF2UFhUVHMrcm53ZlZ3cURQdmY1MldVMGFj?=
 =?utf-8?B?L0VMaWY3ODB5dkdTbEpTMGRQb1QzV2VkZWZ5Z0p4VEVMeDZMakREcWdwV2VZ?=
 =?utf-8?B?cWN6RFNWZHR2SnU4QllhSW9UTGhBcDlPd0crNmxYTnZLdXdtdFhSUTM0SE16?=
 =?utf-8?B?SEkzSTgwNUNrUkpnK29FTkRCK1JnSGk1RkhiUXBpV0JJNmQvVjE3SEM4UDQx?=
 =?utf-8?B?d3lGY1RhZmNHQm5ub25XUGp3eld1dmxscnV6K1ZhUFNwdUI5YlVGMWJSb0cx?=
 =?utf-8?B?TzdlWFN1eGxuaUhIcHNPMm9yQVJIV0FkdFVZTEdpbEprdlprUHVhYXBUZ29V?=
 =?utf-8?B?cXhYU29OSU9EQ0NpblgvRmEwb3VFcG5yVms3Q0xKWDFCZE8wTDYzK2N1U0U3?=
 =?utf-8?B?NzZoWmxPRTZLSnJDMVR2ZHpBVHFrYXlUeW1ZanYrRW1ndVNDWDIyeWU1czIv?=
 =?utf-8?B?YmdSVXB1eTdiMnpneDZiTTdCdjZNb0hYckNHelM3MXdYaUtIWTQrS01PREJr?=
 =?utf-8?B?dndXRS9YY3BZQ3dTWERPRFIydUFBREE5cHJDZURPT1h4bUNpSndFWVB3QTVi?=
 =?utf-8?B?TnkvT2F4Q3B4d3lRWmN2ai8wRnhib0hmbEppUmFFbmFjWm8wYTh6emdTRFRh?=
 =?utf-8?B?bmowa1ZSYVViODdOQ3IvdVRSRE1pTEpLL1VNc3FDQkVWdk9DNkdXeE1aajhZ?=
 =?utf-8?B?NXN4d3JJTTc2RUk0WkFiZm1KVnVaNDU4L0N1OUMybHZjTTV5NjJ0VVVNV2NQ?=
 =?utf-8?B?Y1JTTlZ2REJaOC8rUnd2MUxFUGVQd01uZzl4MDVmZk1ZYkVPbkRzT29iZzBx?=
 =?utf-8?B?SWxGOGVWZEptdEd1UnZ3VURTUWdyTE9RbXIvRFNvdml6RDk5SDZQSXQ0Ukxx?=
 =?utf-8?B?KzNFQVRLWUZLVnRaTWNhVzh0U3JQYzAwUE9LSThkV1poaURWWXhWTHhKUDZO?=
 =?utf-8?B?aTJ2d3Y4Sk91YUVpcktqQ1E3elB2OUtaMjgwUVZpT1FscGpabW1kTVVZWTZY?=
 =?utf-8?B?MzRycTMzeVF0aEN3aTdHQ255aW83emlSVkMxWGtiUm84cFVrc0RwdE9kaUdJ?=
 =?utf-8?B?YkR2d0Nja3pweVlsNFExWE44U3Uxd2sxbmVkOHQzOVRaODNtZVBxMWZtQW5Y?=
 =?utf-8?B?YXNPdHRnT21KUW5HbVVKaCt4Y2krcnVTeDU4MnNTc0tIb1JYSG1GcGkvNDR1?=
 =?utf-8?B?YnFkVjNnUDczV08zNzcwWE13cWVPclQ3T1A3UUlhd2YvSWdGZnB5MlA5RFhP?=
 =?utf-8?B?cWZQY3pUYmE2S1Y5ZVQ0SFlHdU1UWFd6d3N6bUFqdUxEWTl2RFJJN0J2Z2F1?=
 =?utf-8?B?TCtJTDQ2SDlRY1A0d255d1dWb0pnM3Y4TUprV1N3T241dGVhK3FFMjNRSW9I?=
 =?utf-8?B?aDRNQ2QzQjNDTHp0TUhqUlQvaHRBVUlscWJTRFNRPT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc719969-b10e-4e6b-34a4-08d8c7c73bc7
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2021 22:09:39.1053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GH8ruD7VnEJ8CeLyey4izdkoTw4r4RWKlamaWWdfLW3n6NSiWsll3PlcNPmz07nmfUARbq8GQfH8e3zLupo0cwxIZs3WYkE5GIymEmVOH3I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3448
Content-Type: multipart/alternative;
 boundary="------------4B51BCE29C0265C0E55C7942"
Content-Language: en-US

--------------4B51BCE29C0265C0E55C7942
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-01 7:45 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 1.5.0:
>
> - Fixed bug where setting always_show_hint=True did not show a
>    hint when completing Settables
> - Fixed bug in editor detection logic on Linux systems that do not
>    have which
> - Fixed bug in table creator where column headers with tabs would
>    result in an incorrect width calculation
> - Fixed FileNotFoundError which occurred when running history
>    --clear and no history file existed.
> - Added silent_startup_script option to cmd2.Cmd.__init__(). If
>    True, then the startup script's output will be suppressed.
>    Anything written to stderr will still display.
> - cmd2 now uses pyreadline3 when running Python 3.8 or greater
>    on Windows
> - This is the last release planned to support Python 3.5
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-cmd2_1.4.0.bb => python3-cmd2_1.5.0.bb}    | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-cmd2_1.4.0.bb => python3-cmd2_1.5.0.bb} (75%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-cmd2_1.4.0.bb b/meta-python/recipes-devtools/python/python3-cmd2_1.5.0.bb
> similarity index 75%
> rename from meta-python/recipes-devtools/python/python3-cmd2_1.4.0.bb
> rename to meta-python/recipes-devtools/python/python3-cmd2_1.5.0.bb
> index dfe493bd2..18c7a6699 100644
> --- a/meta-python/recipes-devtools/python/python3-cmd2_1.4.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-cmd2_1.5.0.bb
> @@ -5,8 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=9791cd24ca7d1807388ccd55cd066def"
>
>   DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
>
> -SRC_URI[md5sum] = "520afccc1d46f833d117a23fab76ed8f"
> -SRC_URI[sha256sum] = "e59fa932418603af4e046a96c8985812b05af8a73bfd9d7a386cd1b02c6ab687"
> +SRC_URI[sha256sum] = "701a8c9975c4abc45e5d13906ab149f959f812869106347323a3f89ac0e82a62"
>
>   inherit pypi setuptools3
>
> --
> 2.17.1
>
>
> 
>

--------------4B51BCE29C0265C0E55C7942
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-01 7:45 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210201124516.30135-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 1.5.0:

- Fixed bug where setting always_show_hint=True did not show a
  hint when completing Settables
- Fixed bug in editor detection logic on Linux systems that do not
  have which
- Fixed bug in table creator where column headers with tabs would
  result in an incorrect width calculation
- Fixed FileNotFoundError which occurred when running history
  --clear and no history file existed.
- Added silent_startup_script option to cmd2.Cmd.__init__(). If
  True, then the startup script's output will be suppressed.
  Anything written to stderr will still display.
- cmd2 now uses pyreadline3 when running Python 3.8 or greater
  on Windows
- This is the last release planned to support Python 3.5

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210201124516.30135-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-cmd2_1.4.0.bb =&gt; python3-cmd2_1.5.0.bb}    | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cmd2_1.4.0.bb =&gt; python3-cmd2_1.5.0.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_1.4.0.bb b/meta-python/recipes-devtools/python/python3-cmd2_1.5.0.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-cmd2_1.4.0.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_1.5.0.bb
index dfe493bd2..18c7a6699 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_1.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_1.5.0.bb
@@ -5,8 +5,7 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=9791cd24ca7d1807388ccd55cd066def">&quot;file://LICENSE;md5=9791cd24ca7d1807388ccd55cd066def&quot;</a>

 DEPENDS += &quot;${PYTHON_PN}-setuptools-scm-native&quot;

-SRC_URI[md5sum] = &quot;520afccc1d46f833d117a23fab76ed8f&quot;
-SRC_URI[sha256sum] = &quot;e59fa932418603af4e046a96c8985812b05af8a73bfd9d7a386cd1b02c6ab687&quot;
+SRC_URI[sha256sum] = &quot;701a8c9975c4abc45e5d13906ab149f959f812869106347323a3f89ac0e82a62&quot;

 inherit pypi setuptools3

--
2.17.1

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------4B51BCE29C0265C0E55C7942--

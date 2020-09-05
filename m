Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.88])
 by mx.groups.io with SMTP id smtpd.web12.5643.1599332572449387054
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Sep 2020 12:02:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Ee33O1fY;
 spf=pass (domain: windriver.com, ip: 40.107.223.88, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fs41BqCrtj8oErkLFhlanMhB5uQNdv8W5d1hvjtLd4CPMakd5hKcafpCROWXkylJB2ueI3RhRnm9076XwOcD/+4xjBH5ATv3tWaNBYumnZRmGVQMuOtCwGhPwYSNuMKh2BKd5TBFgK6/pvMCOl3DE5Av3ga5x2edWTmiv/uDgK5zuOnL2rCC/28J2zuuxSfgqYa/1N10rFN5k0CzRcgRX8VLN9UtP79nKQ3NhMc9TRoZV8UGsgN+4yLfaIOdLUMBDNEQivxOWmCgR6xYKMfgFZjw7upMk7jax8HymyDRiSzNLSb48VZH2oXLnAFY7WUX/63Zp3qfuAT3hSu6EQWWkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yDrdnY0z7cr83f1xywDfhIPxwkopHPrijY/knholqYg=;
 b=LTs4vj0vcW+vQnypIGtSzWk7q4omGu62PRiewU8R8VrthPbopek6iCeuCBpuMhcEmc4rBrT9Fg3UA0O5HfOx46Ochal216Ohd42xCSndJEM8guNnxzr1MKBhtUYaFUXn84smW2R/m24yrSTaJEHn5r3QgmEnULYNs4VoRJFbt5Tm9H71xQQ8BioHGchXCxa9V8NYeTXPUZ0xUAJolCyvcccvOtyDeO+dXu0vAldHPQMNLWsBv+SC+cB6uqKwYOEMEuvk42Jp+4DGeRaO9Uyq13Ksyzpnv+s4HL1tYjJhTI9ENIdvgL6WaQKHYQw1wEeuPyIjngvnWwJwuSi1wEGNYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yDrdnY0z7cr83f1xywDfhIPxwkopHPrijY/knholqYg=;
 b=Ee33O1fYSbs8db6cjIEZ0o8XFOdX4VTE0OI9FEgM6k24AyRMTfh1kGTwwzgdkpnPz+y7DC0W8DeQdJHwaW2QElDmnRXv3MNvgD1cui366Nb0GFb6a82PijuTZsoyVNpRE37JD5MJ8zWI6qcw3FBJHylMBnxCkbLPLBvrHg1njcM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2952.namprd11.prod.outlook.com (2603:10b6:a03:82::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Sat, 5 Sep
 2020 19:02:51 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3348.015; Sat, 5 Sep 2020
 19:02:51 +0000
Subject: Re: [oe] [meta-python][PATCH 4/7] python3-absl: Upgrade 0.9.0 -> 0.10.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200902112808.18547-1-leon.anavi@konsulko.com>
 <20200902112808.18547-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <c51571a2-017e-422b-c8d3-bab7652e0f6e@windriver.com>
Date: Sat, 5 Sep 2020 15:02:48 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200902112808.18547-4-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTBPR01CA0018.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::31) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTBPR01CA0018.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend Transport; Sat, 5 Sep 2020 19:02:50 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 306d0d01-c4eb-49c9-39c4-08d851ce496b
X-MS-TrafficTypeDiagnostic: BYAPR11MB2952:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2952B3EC8E1CB18FC12549E89F2A0@BYAPR11MB2952.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7IhW3mZHFXLtfWlvrdnDwsWB2IhdgvvGIp6dM9n2Yvk0IYahMptyPAkU/hJ18Ujm5iIMcfAyvHv6Rx7DpQLd3ZN32wthndzh2Xl3umN4mli314Lk/TWv/UBJXBlB2UfYEQ5oEaLpF4dMxOq/2Xte501jsgDpv6tI8MgZ8nWDurzpCa+Eg3i6NRv3C0U0oeNSpglNKJ5eTsXA9ZExEgkVDW8eqpMgmcxgdlUW3wDacmMwQD1FBxPsycKh8vtKYJBjhNSp5ZL1h3qniTPff5fbrNj/zxFHUFbb8I8co5imrA0wtm3b8GL6jGdYUYcDAHjNdrQyoCOiMWaSAHUxhqU3PAJd7S6N+FTc71sjigKWDmQMEOlK9TAnTYBSJBlB2SZfKg6JyhN8E71yKMxf4uB6pJ2+BdOPdF0Ng8xh0WLG9OhnmJZkHsueiiAwJITsNPdNAxVSjoKbdFaQDAh/rq+i/w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(39840400004)(376002)(346002)(396003)(53546011)(66556008)(66946007)(8936002)(16526019)(26005)(186003)(166002)(8676002)(16576012)(83380400001)(316002)(31686004)(36756003)(86362001)(33964004)(31696002)(2616005)(5660300002)(2906002)(966005)(66476007)(44832011)(52116002)(478600001)(956004)(6486002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	Y+4slbA9CEwh3AhlaKT0UjOHl2mOXXdaeXrGGLc5lqg7rZ8t9t0vCx/Do6lHN8ZF3Olp9YSMA8oZKgTL+0lsC02BRHudXW9sDVKgTdfLWx34MJbd/aVaWiiaW71S/pU18QM3NvTEpZOQm4/Op4NyhdULXqgN1FWWx0LJso/x7OXXGEvzChns1OVbmIpYRIxqohIBs0mmfdjlTOElfmk5zgHajSWi6eUZtILTwbaB8qMchqnNN9dxYVenza5yXRMNKolIvwuW5dZ5Vf8ByHHEdYrwSPVhKRAc98qhg+yaODceslcphyT4SpmBeucE35OtoIHYj3+ej9A2H0l0F2nOgqY8iWDB73VWGDf7YeZvqipaOhKezr91tx/4vswt2MWd1hEHi8t+zcmr94ZXmMORvHIKjB2o8KGkdTaojbLdjqsx7Qv9/O+Nai/dgZ86Z7J+KEsVHmMo4fUoGoJpYSfxhA731gxl+zT5WMi7DXbcaZhNERbvn7OB+/Z4Suv0z0R/aKOCq7Fl7UuM7smy5WwA5O8AGD6V0yGCLB21GJyu4ZnrZ9wbZnPl3RufM8sz2IvDvNoEAC1EoplW9SyEj52Vlc2r+bA/a5bmHwdEH+21YB6DvudGlI5JEcU3VgIHmIrXQAcwLtF/i8j/Mzt+oYIlkw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 306d0d01-c4eb-49c9-39c4-08d851ce496b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2020 19:02:51.1680
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NCqUo8YyUPRB2lj8wGG0OwN/Mfwb5bvfqEVwiqeFIwE4g+OPJEcUg4AhwhcOy1hR6Wh7qRer1U7unehS7Exe7ATEmFF7Aj9QLOTC3bjoF6I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2952
Content-Type: multipart/alternative;
 boundary="------------1A8495B780AD7B816D21FBFD"
Content-Language: en-US

--------------1A8495B780AD7B816D21FBFD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/2/20 7:28 AM, Leon Anavi wrote:
> Use PyPI and upgrade to release 0.10.0:
>
> Added:
> - (testing) _TempDir and _TempFile now implement __fspath__ to
>    satisfy os.PathLike
> - (logging) --logger_levels: allows specifying the log levels of
>    loggers.
> - (flags) FLAGS.validate_all_flags: a new method that validates
>    all flags and raises an exception if one fails.
> - (flags) FLAGS.get_flags_for_module: Allows fetching the flags a
>    module defines.
> - (testing) parameterized.TestCase: Supports async test
>    definitions.
> - (testing,app) Added --pdb flag: When true, uncaught exceptions
>    will be handled by pdb.post_mortem. This is an alias for
>    --pdb_post_mortem.
>
> Changed:
> - (testing) Failed tests output a copy/pastable test id to make it
>    easier to copy the failing test to the command line.
> - (testing) @parameterized.parameters now treats a single
>    abc.Mapping as a single test case, consistent with
>    named_parameters. Previously the abc.Mapping is treated as if
>    only its keys are passed as a list of test cases. If you were
>    relying on the old inconsistent behavior, explicitly convert
>    the abc.Mapping to a list.
> - (flags) DEFINE_enum_class and DEFINE_mutlti_enum_class accept a
>    case_sensitive argument. When False (the default), strings are
>    mapped to enum member names without case sensitivity, and member
>    names are serialized in lowercase form. Flag definitions for
>    enums whose members include duplicates when case is ignored must
>    now explicitly pass case_sensitive=True.
>
> Fixed:
> - (flags) Defining an alias no longer marks the aliased flag as
>    always present on the command line.
> - (flags) Aliasing a multi flag no longer causes the default value
>    to be appended to.
> - (flags) Alias default values now matched the aliased default
>    value.
> - (flags) Alias present counter now correctly reflects command
>    line usage.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-absl_0.9.0.bb => python3-absl_0.10.0.bb}     | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-absl_0.9.0.bb => python3-absl_0.10.0.bb} (55%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-absl_0.9.0.bb b/meta-python/recipes-devtools/python/python3-absl_0.10.0.bb
> similarity index 55%
> rename from meta-python/recipes-devtools/python/python3-absl_0.9.0.bb
> rename to meta-python/recipes-devtools/python/python3-absl_0.10.0.bb
> index a8f47ba4c..5be00ccb4 100644
> --- a/meta-python/recipes-devtools/python/python3-absl_0.9.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-absl_0.10.0.bb
> @@ -4,11 +4,11 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>   
> -SRC_URI = "git://github.com/abseil/abseil-py.git"
> -SRCREV ?= "06edd9c20592cec39178b94240b5e86f32e19768"
> +SRC_URI[md5sum] = "9cb38ddf7a2f000e2c92e5d9dfa36ffa"
> +SRC_URI[sha256sum] = "b20f504a7871a580be5268a18fbad48af4203df5d33dbc9272426cb806245a45"
>   
> -inherit setuptools3
> +PYPI_PACKAGE = "absl-py"
>   
> -S = "${WORKDIR}/git"
> +inherit pypi setuptools3
>   
>   BBCLASSEXTEND = "native"
>
> 

--------------1A8495B780AD7B816D21FBFD
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/2/20 7:28 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200902112808.18547-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Use PyPI and upgrade to release 0.10.0:

Added:
- (testing) _TempDir and _TempFile now implement __fspath__ to
  satisfy os.PathLike
- (logging) --logger_levels: allows specifying the log levels of
  loggers.
- (flags) FLAGS.validate_all_flags: a new method that validates
  all flags and raises an exception if one fails.
- (flags) FLAGS.get_flags_for_module: Allows fetching the flags a
  module defines.
- (testing) parameterized.TestCase: Supports async test
  definitions.
- (testing,app) Added --pdb flag: When true, uncaught exceptions
  will be handled by pdb.post_mortem. This is an alias for
  --pdb_post_mortem.

Changed:
- (testing) Failed tests output a copy/pastable test id to make it
  easier to copy the failing test to the command line.
- (testing) @parameterized.parameters now treats a single
  abc.Mapping as a single test case, consistent with
  named_parameters. Previously the abc.Mapping is treated as if
  only its keys are passed as a list of test cases. If you were
  relying on the old inconsistent behavior, explicitly convert
  the abc.Mapping to a list.
- (flags) DEFINE_enum_class and DEFINE_mutlti_enum_class accept a
  case_sensitive argument. When False (the default), strings are
  mapped to enum member names without case sensitivity, and member
  names are serialized in lowercase form. Flag definitions for
  enums whose members include duplicates when case is ignored must
  now explicitly pass case_sensitive=True.

Fixed:
- (flags) Defining an alias no longer marks the aliased flag as
  always present on the command line.
- (flags) Aliasing a multi flag no longer causes the default value
  to be appended to.
- (flags) Alias default values now matched the aliased default
  value.
- (flags) Alias present counter now correctly reflects command
  line usage.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200902112808.18547-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-absl_0.9.0.bb =&gt; python3-absl_0.10.0.bb}     | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-absl_0.9.0.bb =&gt; python3-absl_0.10.0.bb} (55%)

diff --git a/meta-python/recipes-devtools/python/python3-absl_0.9.0.bb b/meta-python/recipes-devtools/python/python3-absl_0.10.0.bb
similarity index 55%
rename from meta-python/recipes-devtools/python/python3-absl_0.9.0.bb
rename to meta-python/recipes-devtools/python/python3-absl_0.10.0.bb
index a8f47ba4c..5be00ccb4 100644
--- a/meta-python/recipes-devtools/python/python3-absl_0.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-absl_0.10.0.bb
@@ -4,11 +4,11 @@ SECTION = &quot;devel/python&quot;
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57">&quot;file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57&quot;</a>
 
-SRC_URI = &quot;git://github.com/abseil/abseil-py.git&quot;
-SRCREV ?= &quot;06edd9c20592cec39178b94240b5e86f32e19768&quot;
+SRC_URI[md5sum] = &quot;9cb38ddf7a2f000e2c92e5d9dfa36ffa&quot;
+SRC_URI[sha256sum] = &quot;b20f504a7871a580be5268a18fbad48af4203df5d33dbc9272426cb806245a45&quot;
 
-inherit setuptools3
+PYPI_PACKAGE = &quot;absl-py&quot;
 
-S = &quot;${WORKDIR}/git&quot;
+inherit pypi setuptools3
 
 BBCLASSEXTEND = &quot;native&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------1A8495B780AD7B816D21FBFD--

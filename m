Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.88])
 by mx.groups.io with SMTP id smtpd.web12.11301.1610467978500713138
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Jan 2021 08:12:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=JCTvA4iX;
 spf=pass (domain: windriver.com, ip: 40.107.94.88, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I2wZZaaOnrTqAg3wyMcqk67AUNmOHU4oPuoVpSByh2/pRfyario/0uenUT5EP+l8yhbERM/gq+ONQWxrVbiq+0YlhyxXM9wP++tD+Ze9WkaMbwsyW9A3USwwJIWxxjwiUMb9W16CPXajc8G4f5cbRb7YDKDoiXzLI8HoiDPzjWjgAxn7IQaJYvzSB5QHRrHxAByFHWczy9M8WVxmP+K/1heMJqic3IOmrQZaTkg5+4DCcoSuKiSzCK3KbdKBQE6Fxdh8k09kJgU5XfGfohoo3seycljWEYhW7s7WpQM+NMiKDaoC3QkeXF08kyuHc3ZOqWGvD3Y4+B9geJwxJt5hAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=53EKT948QfwFqVltpkpNBhjdAtfK57ZCDvaVbgHA398=;
 b=AFGVOrWH18FtFK6hP7qbZnztKZzN2OesXPJJaaN3dHM3OKkuUpyeUUeDRjaM7NYpMlSkzt7/OLWNp08s1l0lMuj21GEH/Be0hj9Q0qcJo2Kk5wrPkcvac1vQg4oIIRgZwOgYUeFqHvoUdIb378Z7OuEpw3gmdLTah6n2HJaYzbWfXu/dfu3B6vR3oWpk+76hSlC1hFlHw4RwcexjLCaj1kjgyWCU4Bh7vTNo/wxg1ZChNaKZEh6iHtkjOq2cYnUTs9+uy28CBcvTIJ3MEZ2SxkaH1HwMh9EfNfn/iiYRUoLuM4/6cfEuQLJO8zPMo3qv3NI06bJYPvZUY00o57HeHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=53EKT948QfwFqVltpkpNBhjdAtfK57ZCDvaVbgHA398=;
 b=JCTvA4iXjB8IC+3BklXUontEitB61uo5wyyFp9jzATHdcU+dXqI5pejgC01J+QtHlw+iT70bFeHB0lwX53HdKonFXmI0QQF+ohcSA1LFqXl4PyGPkdKJ72ClxLFX6YaroXXDXJwdODAWBeV3rgQG9cqJHAinCx490/ycKEHUVOw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2807.namprd11.prod.outlook.com (2603:10b6:a02:c3::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 16:12:57 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6%7]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 16:12:57 +0000
Subject: Re: [oe] [meta-python][PATCH 01/10] python3-pillow: Upgrade 7.2.0 -> 8.1.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210111152512.23506-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <dc75d751-b3d8-8018-7dd3-b94cb187aac5@windriver.com>
Date: Tue, 12 Jan 2021 11:12:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20210111152512.23506-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR02CA0025.namprd02.prod.outlook.com
 (2603:10b6:208:fc::38) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR02CA0025.namprd02.prod.outlook.com (2603:10b6:208:fc::38) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Tue, 12 Jan 2021 16:12:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49ba9561-e277-46c9-fb32-08d8b714ece6
X-MS-TrafficTypeDiagnostic: BYAPR11MB2807:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2807D7806C45B6C49AF57A039FAA0@BYAPR11MB2807.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+ARHJXWHK9HunJfctKmdWeukvTU3iPwcPI972wZC9LUGjZLdgihvyFk+WglbdFeQys20iq/wmVxodOnmH6CjPOI3SdW4LweyvJHjjSXaWWYuTfnwIQpK0gEdD+8146SwYsffZzfWxMPwdDnr88PFg84lItRtnnvzA0Jb91cQKjSSO39dh7jh83RvW7lV2LYgUxOIQ33tOVckUhNKMddrRHeG0PgWkBNTU9JrfcvBE37BkZfKzXBsXYexrYhCPtLPm7DM21mxQN5+BN6J9ofiii13Vdt3OFUVsGRLed0WWK5wf5KlAbA+TjyjDpD9kaSqaUpsD1prVbMlQx+vFpXMc+FctMB2HtZqvlFjm1+7Zz77CP8wWahImk4iPWOfWMGSd7qMcusSI57UyjTBgDJMq7/FDbi9+IQafxIohGuMCaawoXxkvCeY35E06Up78oAT9CED+65sM/NZ8h1vrkGpkU2eBD2DaN5Hm0wueF+F75/EGDVz70PagMsjwKUxJluae/pnI+yQxpteacpmOjCgmONMonthU4QZ7WRzMaVca+A94Ipg7BDmzWbv0ygnahBi
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(39840400004)(136003)(346002)(966005)(2616005)(8676002)(6486002)(66556008)(316002)(16576012)(186003)(52116002)(956004)(8936002)(2906002)(26005)(44832011)(5660300002)(31686004)(86362001)(31696002)(166002)(66946007)(83380400001)(30864003)(16526019)(36756003)(53546011)(66476007)(33964004)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?VzRXR0ErYUd4Z0F4bFVJR3o0TGNGWmprT1hkbExOc1g3QzRMVkw0bE9VcXN3?=
 =?utf-8?B?OXBMM1lIclBuMDJtczRRNHVpWmFOUjdrNDdWdUViNkNqUVVRbk1pd0VtRGUr?=
 =?utf-8?B?aC9JRTlESnhFcDQyTEk4RmlZU3k3Rm90NFFMWSt5b1U3bVptUmhOMjhySFRK?=
 =?utf-8?B?UEZWZGo2SG4vQzJRTG9KL1lRaUM2SWp0b2xvZFZJS1FJbVd5RUFUUm55N0J4?=
 =?utf-8?B?VjJObXhlTEw4TWh6V2RQK1YzMjBXRVlVZXB5UkZLYW83Y3JiQWdTcWtadzkv?=
 =?utf-8?B?Q2p1b21ZbkFqYXp3bDhNdjFhVHZ2a2NQdDZXRThnaTdHaUthZ1ByWEFSVEJh?=
 =?utf-8?B?M1Ntd3h4dlBEUW5hZnp0eE1mYlJZMnR6ODljMFlYYU4vdjNPVGQ0bkFSLzVv?=
 =?utf-8?B?alpZTkFLamhvY0JQalRpb2tRZjc4dFBLV0FRTzZQZVRXSUtGSkpUYUYxZm1L?=
 =?utf-8?B?a2NlRFVEOXI3TjhhNUxtQVpUNHdjei94VHZ3MFhVeFFZdGNLS080YlhuOVIr?=
 =?utf-8?B?N1V3WUJXMmJGQzYwSkFnc3RVV01oQjhVZXJDUmtYaWF3RUg1cThxdEtyT2dm?=
 =?utf-8?B?TTYvb2xzbytpeVhkV3VYZVR5VUg5RElETUpvbEJTeWZjbWxpR2pWYURwYjR6?=
 =?utf-8?B?Z1NwcmlacGRYb2FMQ0I5dW81VnlYNmZVVi9nQ1JoM2JHQVp4dTdnRHE2RElw?=
 =?utf-8?B?LzljUnYwaC9KWWZSQU1hVDRUaFo1NURUbXF5YkVncTl3T0ZlWVZYQUVWK3lR?=
 =?utf-8?B?dkxzQVFiUUpVTCtBWjRZNjVLMDBuMnVPcExqSGNleGl6ZHFNb1VWektjSWNu?=
 =?utf-8?B?RFlQOGY5YUdoNmpSUmxIbTYvektGN0NwNi85OTUra3poNU9EVE05VXk3bXdp?=
 =?utf-8?B?MXdIalJ3Q0x0OGYwejFiQzVYRzNaeThlNk9lSDZZTnpEQ3J2ZmFGcjd6MXFE?=
 =?utf-8?B?N0xVY2ZLLzhKV05jSXBkaFV6TFBDdzZYRTBvSmgzWlR5M1Q3YXY5dnkwWnJC?=
 =?utf-8?B?Rnd0ZE4rNnhSaVlhVWdCMGJSZDVwVU5DNHptcjBWV1Z4N2RRUVJRQlFudlZy?=
 =?utf-8?B?QTZkL2FjT0dVS0ZVT3J3N2RrSG5pdURaSHNuRENNOHhjNHdMc2dtZmEvdlZX?=
 =?utf-8?B?bjZMZW9CNFRZMXlLU251TlhYYStla1EwZjdMd2RzQlg4MkQwOWR3NVJRQmF3?=
 =?utf-8?B?MTVEMC9xOG9YTG5BM2EraTFDSXlxZXY0eXA2N1NvKzRJbEwzUDMxTWNMZXVO?=
 =?utf-8?B?b2xlY1krVXJrN1I0TlEwNTNESnY3aERTNFVKWDNOWXdLOFlZWXp2Q2Z3bjd4?=
 =?utf-8?Q?3gX+3BC6JoOyfCTUjCEcmFgtnTHCSv9IU0?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 16:12:57.3755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 49ba9561-e277-46c9-fb32-08d8b714ece6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n99nG3cZ67d4LcOOicNyjlvQc4Prvk8jcDL161FQQDhgvVkHMCxmWtlZdupUzhZorG426UWnUDdB13pr4ZhHx0fDDGY/Qe0diYkGw8eYtOM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2807
Content-Type: multipart/alternative;
 boundary="------------159B2BD4C0A5501CC8E22C9F"
Content-Language: en-US

--------------159B2BD4C0A5501CC8E22C9F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-11 10:25 a.m., Leon Anavi wrote:
> - Fix TIFF OOB Write error
> - Fix for Buffer Read Overrun in PCX Decoding
> - Fix for SGI Decode buffer overrun
> - Fix OOB Read when saving GIF of xsize=1
> - Add support for PySide6
> - Moved QApplication into one test
> - Use disposal settings from previous frame in APNG
> - Revert "skip wheels on 3.10-dev due to wheel#354"
> - Better _binary module use
> - Added exception explaining that repr_png saves to PNG
> - Use previous disposal method in GIF load_end
> - Do not catch a ValueError only to raise another
> - Allow putpalette to accept 1024 integers to include alpha values
> - Fix OOB Read when writing TIFF with custom Metadata
> - Removed unused variable
> - Fix dereferencing of potential null pointers
> - Fixed warnings assigning to "unsigned char *" from "char *"
> - Add append_images support for ICO
> - Fixed comparison warnings
> - Block TIFFTAG_SUBIFD
> - Fix dereferencing potential null pointer
> - Replaced PyErr_NoMemory with ImagingError_MemoryError
> - Remove duplicate code
> - Moved warning to end of execution
> - Removed unused fromstring and tostring C methods
> - init() if one of the formats is unrecognised
>
> License-Update: Updated copyright year
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../0001-support-cross-compiling.patch        | 43 ++++++-------------
>   ...illow_7.2.0.bb => python3-pillow_8.1.0.bb} |  7 ++-
>   2 files changed, 16 insertions(+), 34 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pillow_7.2.0.bb => python3-pillow_8.1.0.bb} (78%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pillow/0001-support-cross-compiling.patch b/meta-python/recipes-devtools/python/python3-pillow/0001-support-cross-compiling.patch
> index 6de19ad87..e4ba35b88 100644
> --- a/meta-python/recipes-devtools/python/python3-pillow/0001-support-cross-compiling.patch
> +++ b/meta-python/recipes-devtools/python/python3-pillow/0001-support-cross-compiling.patch
> @@ -1,20 +1,21 @@
> -From ae7c8d0336381dd4c10e809e9c8926f9deeafeb8 Mon Sep 17 00:00:00 2001
> -From: Hongxu Jia <hongxu.jia@windriver.com>
> -Date: Thu, 14 Mar 2019 03:48:10 -0400
> +From cd09b6f68aa49c72e9a9bb0765e8c666238a7b7e Mon Sep 17 00:00:00 2001
> +From: Leon Anavi <leon.anavi@konsulko.com>
> +Date: Mon, 11 Jan 2021 13:25:12 +0000
>   Subject: [PATCH] support cross compiling
>   
>   Upstream-Status: Inappropriate [oe specific]
>   
> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +Suggested-by: Hongxu Jia <hongxu.jia@windriver.com>
> +Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>   ---
> - setup.py | 13 +++----------
> - 1 file changed, 3 insertions(+), 10 deletions(-)
> + setup.py | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
>   
>   diff --git a/setup.py b/setup.py
> -index 5ceae344..07863340 100755
> +index cbc2641c..302bc6e7 100755
>   --- a/setup.py
>   +++ b/setup.py
> -@@ -105,7 +105,7 @@ _LIB_IMAGING = (
> +@@ -123,7 +123,7 @@ _LIB_IMAGING = (
>        "codec_fd",
>    )
>    
> @@ -23,39 +24,21 @@ index 5ceae344..07863340 100755
>    
>    
>    class DependencyException(Exception):
> -@@ -396,21 +396,16 @@ class pil_build_ext(build_ext):
> +@@ -408,12 +408,12 @@ class pil_build_ext(build_ext):
>                        _add_directory(library_dirs, match.group(1))
>    
>            # include, rpath, if set as environment variables:
>   -        for k in ("C_INCLUDE_PATH", "CPATH", "INCLUDE"):
> -+        for k in ('C_INCLUDE_PATH', 'CPATH', 'INCLUDE', 'STAGING_INCDIR'):
> ++        for k in ("C_INCLUDE_PATH", "CPATH", "INCLUDE", "STAGING_INCDIR"):
>                if k in os.environ:
>                    for d in os.environ[k].split(os.path.pathsep):
>                        _add_directory(include_dirs, d)
>    
>   -        for k in ("LD_RUN_PATH", "LIBRARY_PATH", "LIB"):
> -+        for k in ('LD_RUN_PATH', 'LIBRARY_PATH', 'LIB', 'STAGING_LIBDIR'):
> ++        for k in ("LD_RUN_PATH", "LIBRARY_PATH", "LIB", "STAGING_LIBDIR"):
>                if k in os.environ:
>                    for d in os.environ[k].split(os.path.pathsep):
>                        _add_directory(library_dirs, d)
> -
> --        prefix = sysconfig.get_config_var("prefix")
> --        if prefix:
> --            _add_directory(library_dirs, os.path.join(prefix, "lib"))
> --            _add_directory(include_dirs, os.path.join(prefix, "include"))
> --
> -         #
> -         # add platform directories
> -
> -@@ -469,8 +464,6 @@ class pil_build_ext(build_ext):
> -             or sys.platform.startswith("gnu")
> -             or sys.platform.startswith("freebsd")
> -         ):
> --            for dirname in _find_library_dirs_ldconfig():
> --                _add_directory(library_dirs, dirname)
> -             if sys.platform.startswith("linux") and os.environ.get(
> -                 "ANDROID_ROOT", None
> -             ):
>   --
> -2.20.1
> +2.17.1
>   
> diff --git a/meta-python/recipes-devtools/python/python3-pillow_7.2.0.bb b/meta-python/recipes-devtools/python/python3-pillow_8.1.0.bb
> similarity index 78%
> rename from meta-python/recipes-devtools/python/python3-pillow_7.2.0.bb
> rename to meta-python/recipes-devtools/python/python3-pillow_8.1.0.bb
> index 13cab4300..63974590c 100644
> --- a/meta-python/recipes-devtools/python/python3-pillow_7.2.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pillow_8.1.0.bb
> @@ -3,14 +3,13 @@ Clark and Contributors. PIL is the Python Imaging Library by Fredrik Lundh and \
>   Contributors."
>   HOMEPAGE = "https://pillow.readthedocs.io"
>   LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=ea2dc3f5611e69058503d4b940049d03"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=0337b116233da4616ae9fdb130bf6f1a"
>   
> -SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=7.2.x \
> +SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=8.1.x \
>              file://0001-support-cross-compiling.patch \
>              file://0001-explicitly-set-compile-options.patch \
>   "
> -SRCREV ?= "2bd74943fb9f320def6c066e732b701d1c15f677"
> -
> +SRCREV ?= "fcc42e0d344146ee9d265d1f43c094ce5a0ec4cf"
>   
>   inherit setuptools3
>   
>
> 
>

--------------159B2BD4C0A5501CC8E22C9F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-11 10:25 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210111152512.23506-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Fix TIFF OOB Write error
- Fix for Buffer Read Overrun in PCX Decoding
- Fix for SGI Decode buffer overrun
- Fix OOB Read when saving GIF of xsize=1
- Add support for PySide6
- Moved QApplication into one test
- Use disposal settings from previous frame in APNG
- Revert &quot;skip wheels on 3.10-dev due to wheel#354&quot;
- Better _binary module use
- Added exception explaining that repr_png saves to PNG
- Use previous disposal method in GIF load_end
- Do not catch a ValueError only to raise another
- Allow putpalette to accept 1024 integers to include alpha values
- Fix OOB Read when writing TIFF with custom Metadata
- Removed unused variable
- Fix dereferencing of potential null pointers
- Fixed warnings assigning to &quot;unsigned char *&quot; from &quot;char *&quot;
- Add append_images support for ICO
- Fixed comparison warnings
- Block TIFFTAG_SUBIFD
- Fix dereferencing potential null pointer
- Replaced PyErr_NoMemory with ImagingError_MemoryError
- Remove duplicate code
- Moved warning to end of execution
- Removed unused fromstring and tostring C methods
- init() if one of the formats is unrecognised

License-Update: Updated copyright year

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210111152512.23506-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../0001-support-cross-compiling.patch        | 43 ++++++-------------
 ...illow_7.2.0.bb =&gt; python3-pillow_8.1.0.bb} |  7 ++-
 2 files changed, 16 insertions(+), 34 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pillow_7.2.0.bb =&gt; python3-pillow_8.1.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-pillow/0001-support-cross-compiling.patch b/meta-python/recipes-devtools/python/python3-pillow/0001-support-cross-compiling.patch
index 6de19ad87..e4ba35b88 100644
--- a/meta-python/recipes-devtools/python/python3-pillow/0001-support-cross-compiling.patch
+++ b/meta-python/recipes-devtools/python/python3-pillow/0001-support-cross-compiling.patch
@@ -1,20 +1,21 @@
-From ae7c8d0336381dd4c10e809e9c8926f9deeafeb8 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
-Date: Thu, 14 Mar 2019 03:48:10 -0400
+From cd09b6f68aa49c72e9a9bb0765e8c666238a7b7e Mon Sep 17 00:00:00 2001
+From: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a>
+Date: Mon, 11 Jan 2021 13:25:12 +0000
 Subject: [PATCH] support cross compiling
 
 Upstream-Status: Inappropriate [oe specific]
 
-Signed-off-by: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
+Suggested-by: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
+Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a>
 ---
- setup.py | 13 +++----------
- 1 file changed, 3 insertions(+), 10 deletions(-)
+ setup.py | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/setup.py b/setup.py
-index 5ceae344..07863340 100755
+index cbc2641c..302bc6e7 100755
 --- a/setup.py
 +++ b/setup.py
-@@ -105,7 +105,7 @@ _LIB_IMAGING = (
+@@ -123,7 +123,7 @@ _LIB_IMAGING = (
      &quot;codec_fd&quot;,
  )
  
@@ -23,39 +24,21 @@ index 5ceae344..07863340 100755
  
  
  class DependencyException(Exception):
-@@ -396,21 +396,16 @@ class pil_build_ext(build_ext):
+@@ -408,12 +408,12 @@ class pil_build_ext(build_ext):
                      _add_directory(library_dirs, match.group(1))
  
          # include, rpath, if set as environment variables:
 -        for k in (&quot;C_INCLUDE_PATH&quot;, &quot;CPATH&quot;, &quot;INCLUDE&quot;):
-+        for k in ('C_INCLUDE_PATH', 'CPATH', 'INCLUDE', 'STAGING_INCDIR'):
++        for k in (&quot;C_INCLUDE_PATH&quot;, &quot;CPATH&quot;, &quot;INCLUDE&quot;, &quot;STAGING_INCDIR&quot;):
              if k in os.environ:
                  for d in os.environ[k].split(os.path.pathsep):
                      _add_directory(include_dirs, d)
  
 -        for k in (&quot;LD_RUN_PATH&quot;, &quot;LIBRARY_PATH&quot;, &quot;LIB&quot;):
-+        for k in ('LD_RUN_PATH', 'LIBRARY_PATH', 'LIB', 'STAGING_LIBDIR'):
++        for k in (&quot;LD_RUN_PATH&quot;, &quot;LIBRARY_PATH&quot;, &quot;LIB&quot;, &quot;STAGING_LIBDIR&quot;):
              if k in os.environ:
                  for d in os.environ[k].split(os.path.pathsep):
                      _add_directory(library_dirs, d)
- 
--        prefix = sysconfig.get_config_var(&quot;prefix&quot;)
--        if prefix:
--            _add_directory(library_dirs, os.path.join(prefix, &quot;lib&quot;))
--            _add_directory(include_dirs, os.path.join(prefix, &quot;include&quot;))
--
-         #
-         # add platform directories
- 
-@@ -469,8 +464,6 @@ class pil_build_ext(build_ext):
-             or sys.platform.startswith(&quot;gnu&quot;)
-             or sys.platform.startswith(&quot;freebsd&quot;)
-         ):
--            for dirname in _find_library_dirs_ldconfig():
--                _add_directory(library_dirs, dirname)
-             if sys.platform.startswith(&quot;linux&quot;) and os.environ.get(
-                 &quot;ANDROID_ROOT&quot;, None
-             ):
 -- 
-2.20.1
+2.17.1
 
diff --git a/meta-python/recipes-devtools/python/python3-pillow_7.2.0.bb b/meta-python/recipes-devtools/python/python3-pillow_8.1.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-pillow_7.2.0.bb
rename to meta-python/recipes-devtools/python/python3-pillow_8.1.0.bb
index 13cab4300..63974590c 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_7.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_8.1.0.bb
@@ -3,14 +3,13 @@ Clark and Contributors. PIL is the Python Imaging Library by Fredrik Lundh and \
 Contributors.&quot;
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://pillow.readthedocs.io">&quot;https://pillow.readthedocs.io&quot;</a>
 LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=ea2dc3f5611e69058503d4b940049d03">&quot;file://LICENSE;md5=ea2dc3f5611e69058503d4b940049d03&quot;</a>
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=0337b116233da4616ae9fdb130bf6f1a">&quot;file://LICENSE;md5=0337b116233da4616ae9fdb130bf6f1a&quot;</a>
 
-SRC_URI = &quot;git://github.com/python-pillow/Pillow.git;branch=7.2.x \
+SRC_URI = &quot;git://github.com/python-pillow/Pillow.git;branch=8.1.x \
            <a class="moz-txt-link-freetext" href="file://0001-support-cross-compiling.patch">file://0001-support-cross-compiling.patch</a> \
            <a class="moz-txt-link-freetext" href="file://0001-explicitly-set-compile-options.patch">file://0001-explicitly-set-compile-options.patch</a> \
 &quot;
-SRCREV ?= &quot;2bd74943fb9f320def6c066e732b701d1c15f677&quot;
-
+SRCREV ?= &quot;fcc42e0d344146ee9d265d1f43c094ce5a0ec4cf&quot;
 
 inherit setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------159B2BD4C0A5501CC8E22C9F--

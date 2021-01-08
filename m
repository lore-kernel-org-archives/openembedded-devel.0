Received: from NAM02-CY1-obe.outbound.protection.outlook.com (NAM02-CY1-obe.outbound.protection.outlook.com [40.107.76.42])
 by mx.groups.io with SMTP id smtpd.web10.1962.1610122084306750400
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Jan 2021 08:08:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=H3LgXVEC;
 spf=pass (domain: windriver.com, ip: 40.107.76.42, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GynO3JZgjRxDzUBly3wwO8cMg55448UmJekE51raomMT1TpAwDZqbfwFw/YgR51Q+jfOOJ4QcAhCJILHDxUapu3sBaeZxGlkQ/a2BNFeyIIrKV8k5iADn4T9Z06ghpkPvauQu5WYfRR59lvvISsa1oRSkG7JToODGznE4K8wCCyhlPD3E1qZAeokB03j3w1kdoYo9ouwy0LRhowON7M4/bAoNY082VmiTjSzaIUpZlkCG6kLgcdX+JyunBsJaeK1P0gM0sXLaqatYIAKoym9YCjFUVoUFmuFrFM6IjxzLxceSDkdo4X4X7PNtGlaarPvgaD+I5w6EP5fXiopiaTf/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hSZ+OC/j0eXvmuVmnb6OD/90yniodLLmzpkOyt/KJUA=;
 b=a/nKZbGAhNKNBg+i7nW/VmjvUEK0MgU1XvunjxtmdVr1MGGPce+lD4T+UTwghWhvH8Dky1a5QQXMr5wLR7nnac155vngt36s2t1gGoR9ol5RAGbzpRNm98ThD4YCoz95Hl/31nrDi9W1amIXKVI/UfF6YYkEp66mghrICROxvBEcww7eyMn75SqHSKUqbW2VIuT0uA8DGo6vAAouBJ+AZs5S7uzwh1i2o/MT6MK0CP8vK0/CylvHRokbM56qbhgzoRD3gwVdNeLYwy+YeOpReP1bMZXdM+R5ov/4/s1WvE18rKFi8EMlZfl/QG1hJRWO5IeBvqjNZAQ1EfaJXwA/AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hSZ+OC/j0eXvmuVmnb6OD/90yniodLLmzpkOyt/KJUA=;
 b=H3LgXVECAaP9OlNgOvNl1GcV2Xu0Tykk7N9nFJ8gtOTAMLs52sYkcweUzUoAcn/o5FsCAEuf6EV2P/yab4h1zvgCNsBptYKGSuGr2Nw+nPKo/+j9ly4KpPsHHlvFpM/ksx4SoZk0JCnSQmAvRuDz/sKpp7Idaemr4koP7KHZCbw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4150.namprd11.prod.outlook.com (2603:10b6:a03:190::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 16:08:03 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6%7]) with mapi id 15.20.3742.009; Fri, 8 Jan 2021
 16:08:03 +0000
Subject: Re: [oe] [meta-python][PATCH 10/10] python3-babel: Upgrade 2.8.0 -> 2.9.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210106220702.10483-1-leon.anavi@konsulko.com>
 <20210106220702.10483-10-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <295d8330-292f-117a-b27d-313fe6302b68@windriver.com>
Date: Fri, 8 Jan 2021 11:08:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20210106220702.10483-10-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR01CA0058.prod.exchangelabs.com (2603:10b6:208:23f::27)
 To BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR01CA0058.prod.exchangelabs.com (2603:10b6:208:23f::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Fri, 8 Jan 2021 16:08:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be73e4a4-72d2-4a3a-8d5e-08d8b3ef93ee
X-MS-TrafficTypeDiagnostic: BY5PR11MB4150:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB41506B3C9089E2FACA0523369FAE0@BY5PR11MB4150.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:332;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0iZigUn6fsBnCsjpOlWf1sXVXzgJ+Nx16KTFo9hM5w1Dczi2+8HS/hK1Lt9qkT7UslG+G3Pea1TtTezg+b+kpeZ4mfZQdzy6luqXWqfrNBrdS36UZjmm0RXtGPSXm0uudBY4xnfFj6HQLLoPpVkHvyxmpgu2qqqa7vme5fxjaRJE1ieImm3RpbT6E4qt30ioAnPvl88PGnvIRB7/m57xnf4bAgw0ambUb0k8TXqQM9URlQ1AW7XXAxUIunBUDsAkouEsV75GJJP7Q5GYBAS4BFJOMGKbO2WrLkRURWx60RfHkarNjp3RWKHsQ4QB6XHsKn/oVN4BroMMVm6ogrEHfjAMyu/IscDaKFp9GKgBAZm1AOTQ9A9Cjb6lN3+QUy+guwwgzv2I/hgble7ng6l0YmxA3jg7T56+xW0IkoIrdSFdhcoqSsBYTZCrirspLe1yM43B+JQs5msjyDiBt68EYhDs+K4sdGRv95ZpMRyZLjsTyK+PsYvk+P7cNIVAba5tZB6Z5k2MrbNVuafAXmHDQw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(346002)(39850400004)(136003)(956004)(2616005)(66946007)(16526019)(66556008)(31686004)(44832011)(53546011)(66476007)(33964004)(31696002)(186003)(36756003)(83380400001)(52116002)(8676002)(6486002)(478600001)(16576012)(166002)(2906002)(5660300002)(86362001)(26005)(8936002)(966005)(316002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?OHgzU051U3RiR1NqMlJvOXJlTVRRZkhnanhkVWZINURNYlUrc0ZOdVNMajQ0?=
 =?utf-8?B?c3BzS3hLL2l3WmRVSHdSRDI0KzhiYnFqRlhEeUU4L25hKzlqM1JhUHFkUFBG?=
 =?utf-8?B?QThobHhkclJsN3Vhd28vWWhmU2RtMlNQLzB2ejlSR1lwaDBGWHJ5TWJ6dEg0?=
 =?utf-8?B?MU9vdy9NaXJvRlVldEx4TjBmYzVZcUpsblNaOTRsTjVtNTFRVnA3eXpKdU51?=
 =?utf-8?B?bVQ0emwvMUU2RC9NZUpCME16TVd5VHNDQkcwSjBLYUJVbC9pR2NwM29DUnly?=
 =?utf-8?B?WloyUitzd1N0YnNDVGRoSW50UGtra0RpUVdGNGFIZFVzdjVodmFIdnpiSnhh?=
 =?utf-8?B?NUwwRmVFWHkxZ3RlQUFKSXZMU2piUVZEa1BPRUNZL1QwZ0dZT3JxSVRxRzh1?=
 =?utf-8?B?WWN4Ynpma05OTWg4QWp6R2V4Sng3OGV3YldUQnlmNnd2bVAwSWlPdVBPTWxx?=
 =?utf-8?B?eFB4MGlXNmJEbEZGVDcyUkluYjFVVERIN0tUL3crQkI2SHV1a0JKUndMUGhN?=
 =?utf-8?B?aXBjc3diZWx4UEZPNDU0M2E1dEc2dHJGOUZwR0hUVEM5Qk4veGhxRGQxdkxm?=
 =?utf-8?B?M0l3cHJPam8yR25kVjV4Q01qQXRwWHpqc2J1UnBLZEpBQ2F4a1JHM2tLS1M0?=
 =?utf-8?B?UE45NHg2aHdWWVMrbEc2bzFjR1BiTGF4dlhiemJCK2VibE9HVy9yV25Vc1hO?=
 =?utf-8?B?MHF4d1lnNCtLOFN1bXFEUXNXY2VNZ3N1dGlVZ3p0VEFRdE5Vc3ltaGtjckRw?=
 =?utf-8?B?aFptS1lXREE1WENoMlpBd1BGL2lsOVlJa0JpL2lDWHRiUUxpSzB5RU9QZVNm?=
 =?utf-8?B?d1MxaEZEUTJjOUZKRlNOL2diOHd3WkMzeTlGejQyQjBBSk53VmVERVIxM1Ja?=
 =?utf-8?B?ditJSnVxZ2hsc21TblBMRFFGREJnOUZVd2RmdDVRbzhwOTRndzBRd2lvcjV5?=
 =?utf-8?B?RG1pU3FZLzZ6ZVJOOFA1bVVVQWRpV0Q2MlN4NmFlWHQ0UFB5SzhQd2Q5MG1E?=
 =?utf-8?B?VzM0WXo0VVc5M0t3TjlQRWFmY1ZzN2k5dW45citnaklVN0FwNGFVVWJYRzBw?=
 =?utf-8?B?bW1yYjVINUNYY3AxVDVzUHgrcFViM3VQM05zRFdCSWpadDZmaFhBb2thRTg3?=
 =?utf-8?B?cGFpQWVZTlVzV0x0Ym8xR0c1S1Z0Tmx2M3VKeGRvU1huYm1VQTdOM0h4ZHV6?=
 =?utf-8?B?UHFFQ3VGYnRHNVZ4U3kxcmhIRTFray9zaWJqWHo1dXAvUFg5VFhsVkc1VHRs?=
 =?utf-8?B?MkZzUThaelFacmcyOFdDQmtKWkxObDVUaFphRktBMVNMMTRHcE1oRERIYytq?=
 =?utf-8?Q?fiaJ7xPoHMYPnxyc0L5N295i7D0pEqufDA?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 16:08:03.2925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: be73e4a4-72d2-4a3a-8d5e-08d8b3ef93ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CJScUDWMZF0fKDJ6/kBpbvT6EeNJa5YaUp16t5Rv4K+/lmaknSYecjPwLkANmPY3ufFD9/CxKEOBsreMqWA2xWTiifkcm3ciJz8RCEeWgno=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4150
Content-Type: multipart/alternative;
 boundary="------------F498A7F20E9DB30572AE682B"
Content-Language: en-US

--------------F498A7F20E9DB30572AE682B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-06 5:07 p.m., Leon Anavi wrote:
> - CLDR: Use CLDR 37
> - Dates: Handle ZoneInfo objects in get_timezone_location,
>    get_timezone_name
> - Numbers: Add group_separator feature in number formatting
> - Dates: Correct default Format().timedelta format to 'long' to
>    mute deprecation warnings
> - Import: Simplify iteration code in "import_cldr.py"
> - Import: Stop using deprecated ElementTree methods
>    "getchildren()" and "getiterator()"
> - Messages: Fix unicode printing error on Python 2 without TTY.
> - Messages: Introduce invariant that _invalid_pofile() takes
>    unicode line.
> - Tests: fix tests when using Python 3.9
> - Tests: Remove deprecated 'sudo: false' from Travis configuration
> - Tests: Support Py.test 6.x
> - Utilities: LazyProxy: Handle AttributeError in specified func
> - Utilities: Replace usage of parser.suite with ast.parse
>
> License-Update: Update year
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-babel_2.8.0.bb => python3-babel_2.9.0.bb}       | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-babel_2.8.0.bb => python3-babel_2.9.0.bb} (70%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-babel_2.8.0.bb b/meta-python/recipes-devtools/python/python3-babel_2.9.0.bb
> similarity index 70%
> rename from meta-python/recipes-devtools/python/python3-babel_2.8.0.bb
> rename to meta-python/recipes-devtools/python/python3-babel_2.9.0.bb
> index c69098b226..7248abf33b 100644
> --- a/meta-python/recipes-devtools/python/python3-babel_2.8.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-babel_2.9.0.bb
> @@ -1,10 +1,9 @@
>   DESCRIPTION = "A collection of tools for internationalizing Python applications"
>   HOMEPAGE = "http://babel.edgewall.org/"
>   LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=942469df9305abb1c59e95f778310384"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=22a580b27e4ebf9689e466b63aedeb7f"
>   
> -SRC_URI[md5sum] = "6fad9772e75421969ddb41975483abdf"
> -SRC_URI[sha256sum] = "1aac2ae2d0d8ea368fa90906567f5c08463d98ade155c0c4bfedd6a0f7160e38"
> +SRC_URI[sha256sum] = "da031ab54472314f210b0adcff1588ee5d1d1d0ba4dbd07b94dba82bde791e05"
>   
>   PYPI_PACKAGE = "Babel"
>   
>
> 
>

--------------F498A7F20E9DB30572AE682B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-06 5:07 p.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210106220702.10483-10-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- CLDR: Use CLDR 37
- Dates: Handle ZoneInfo objects in get_timezone_location,
  get_timezone_name
- Numbers: Add group_separator feature in number formatting
- Dates: Correct default Format().timedelta format to 'long' to
  mute deprecation warnings
- Import: Simplify iteration code in &quot;import_cldr.py&quot;
- Import: Stop using deprecated ElementTree methods
  &quot;getchildren()&quot; and &quot;getiterator()&quot;
- Messages: Fix unicode printing error on Python 2 without TTY.
- Messages: Introduce invariant that _invalid_pofile() takes
  unicode line.
- Tests: fix tests when using Python 3.9
- Tests: Remove deprecated 'sudo: false' from Travis configuration
- Tests: Support Py.test 6.x
- Utilities: LazyProxy: Handle AttributeError in specified func
- Utilities: Replace usage of parser.suite with ast.parse

License-Update: Update year

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210106220702.10483-10-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-babel_2.8.0.bb =&gt; python3-babel_2.9.0.bb}       | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-babel_2.8.0.bb =&gt; python3-babel_2.9.0.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-babel_2.8.0.bb b/meta-python/recipes-devtools/python/python3-babel_2.9.0.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-babel_2.8.0.bb
rename to meta-python/recipes-devtools/python/python3-babel_2.9.0.bb
index c69098b226..7248abf33b 100644
--- a/meta-python/recipes-devtools/python/python3-babel_2.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-babel_2.9.0.bb
@@ -1,10 +1,9 @@
 DESCRIPTION = &quot;A collection of tools for internationalizing Python applications&quot;
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://babel.edgewall.org/">&quot;http://babel.edgewall.org/&quot;</a>
 LICENSE = &quot;BSD-3-Clause&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=942469df9305abb1c59e95f778310384">&quot;file://LICENSE;md5=942469df9305abb1c59e95f778310384&quot;</a>
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=22a580b27e4ebf9689e466b63aedeb7f">&quot;file://LICENSE;md5=22a580b27e4ebf9689e466b63aedeb7f&quot;</a>
 
-SRC_URI[md5sum] = &quot;6fad9772e75421969ddb41975483abdf&quot;
-SRC_URI[sha256sum] = &quot;1aac2ae2d0d8ea368fa90906567f5c08463d98ade155c0c4bfedd6a0f7160e38&quot;
+SRC_URI[sha256sum] = &quot;da031ab54472314f210b0adcff1588ee5d1d1d0ba4dbd07b94dba82bde791e05&quot;
 
 PYPI_PACKAGE = &quot;Babel&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------F498A7F20E9DB30572AE682B--

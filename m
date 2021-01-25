Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.88])
 by mx.groups.io with SMTP id smtpd.web09.35535.1611578475610614100
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jan 2021 04:41:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=K1on+m+x;
 spf=pass (domain: windriver.com, ip: 40.107.93.88, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MCl7JwwuhT/6/zPWu1RQ4bdk6tYfYygjcsZ15A1n0irHEokv+S10CfwS6VLxGNTIfFhx6pvJj7spDl3wJXlray0uS4ybkYpHCcUEa8YpBUohJKHY52+4Zk8QyAEGx9ogjOYF0BnzCZZWdOWw8jbbsGeamYlscTdlW75ZJV5E5pZ0DqVGw/FPKxV9YEAIFOk7r6a+n0bXuqM1E2mBVKNFQJyTs1z5WVYdYwYNu6RhBJe6ytSXOX7y9UmqEnbiJYTdkIDNZpdGw5/1aTSBOAXdWeAK7VbrhORvjnV9wJbmTpAQEal1h25NNTSSUkvJ1LyCIut6wBwFibbXZH8hdHLi2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MpCsAAgBE6rqIvAWBi0lqATsZGSi50rz1sNgXqPIax8=;
 b=CPiH85+qQ04BhmoL+kDMh84uzovTGfeH4qH0lugG1Hnj5TnGF226Y/f5oSEVZ0bXrh5s/bhezeFAtcYPamZA80SbU6NsjsWV60fLi/pMblFyIf4L1XGLv7X07IjXkeYG8ZmYNDuhBXUEBG2q3lMITrma09ZSunX6/J/VB2ku1Rel6Gers5JkiXkR3NNEmgSH6++k72jz6Q2pmoQvKHfLd9sc740J4yZMBIRnf708bQFTqx0SRC6iS8vgb9mfkg+hb5S8mWcv9g+/rIhn1lLY8q0wW/CIEemKYm9pYhjx+pM01gSWCuVeiliXYt/w4iprjVBYOB1AroszCCmmXrP2zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MpCsAAgBE6rqIvAWBi0lqATsZGSi50rz1sNgXqPIax8=;
 b=K1on+m+xQf8yfVCAftIcrWCpjH2EeChGZ4SJkottCjzmmI2FWpPZdnoO0HtMyL04Vcft9XL3dF85nsnIH4JwpteZAN58y949DMjY7ZHvi2oJRLOXVxzgKJBTGwH6sDNxYktVd14as0UBeI2L6yqtBH+aenqBG2WdkIQLBzSLpHU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from MN2PR11MB3919.namprd11.prod.outlook.com (2603:10b6:208:13b::27)
 by MN2PR11MB3984.namprd11.prod.outlook.com (2603:10b6:208:153::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Mon, 25 Jan
 2021 12:41:14 +0000
Received: from MN2PR11MB3919.namprd11.prod.outlook.com
 ([fe80::5462:9c04:72b3:6c44]) by MN2PR11MB3919.namprd11.prod.outlook.com
 ([fe80::5462:9c04:72b3:6c44%7]) with mapi id 15.20.3763.019; Mon, 25 Jan 2021
 12:41:14 +0000
Subject: Re: [oe] [meta-python][PATCH 4/5] python3-pykwalify: Upgrade 1.7.0 -> 1.8.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210121131709.27097-1-leon.anavi@konsulko.com>
 <20210121131709.27097-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <db57b2ee-236b-834a-6df8-e58dd65ce910@windriver.com>
Date: Mon, 25 Jan 2021 07:41:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210121131709.27097-4-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR14CA0015.namprd14.prod.outlook.com
 (2603:10b6:208:23e::20) To MN2PR11MB3919.namprd11.prod.outlook.com
 (2603:10b6:208:13b::27)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR14CA0015.namprd14.prod.outlook.com (2603:10b6:208:23e::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12 via Frontend Transport; Mon, 25 Jan 2021 12:41:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c91f679-b1cb-4f7f-0ba6-08d8c12e809f
X-MS-TrafficTypeDiagnostic: MN2PR11MB3984:
X-Microsoft-Antispam-PRVS: 
	<MN2PR11MB39846E5577AAD3BF4A5E20809FBD9@MN2PR11MB3984.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cSTq6tZW2LOvSqZbYp5RkeSSsDIVroaqZHpsOAmgUivZehMbXI09hfK59L6+si72TYMYWApGkL+zHa9pgKUP/lU1CT0qcznauL4N/Dn+MbHX9A4aGjJ5KQSk7rkYrT0fyCYoOnRpZTRTWfaT+28qBK0eig4cBh4bSCuY6p94WZPuyPdiTiefbPRhsTK4Mmvtpe7UqUx7c49y+xmTF7aO3Pin3RqG3VzE4A98vD+a2XQ/NDlMUHOM51MfdlydUPntei+0PE/6AHXhwmIhMlx3JWpU88unlSVpP/eoEq1rJbWBoYISCg/0atV/ag7DReE0QGK4bWDYrnaM13YFH+4AazXswFJkRLH4Rpn2qyZqbycNAT6mjc/C2JW+eXmRmGLuhXYhJTc+YtM7CPs3JUOr1lxZR34G0cp4/xmrR2J6derTykykSlVJ5ZfX0aAaNpnxGdaBX8y0Ciq7BDa582UBqMacaMnyXqA4YqRul999Wy0PG+bKevLnYt1bym5zXssQeaL86MqfslzLx7urC6ChAjJLEENiUYtteOtl+08zTchTv7R3rLplL513RL2569gv
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB3919.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(39850400004)(396003)(366004)(8936002)(33964004)(5660300002)(86362001)(31696002)(2616005)(6486002)(66574015)(478600001)(44832011)(83380400001)(956004)(31686004)(966005)(66946007)(66476007)(66556008)(30864003)(36756003)(8676002)(52116002)(2906002)(316002)(16576012)(186003)(16526019)(53546011)(26005)(166002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?QmN2RnFWSXpocWFTbmlvUHk0TkhZYVQ1RHhPRUlLVVF6WXVoajVHRS9LYXAx?=
 =?utf-8?B?R1BjZG1ITDBXT0dZMnl2YldYZ0poNVUzajRVV3FzTThhbnhzamRSM0dQRHE1?=
 =?utf-8?B?dktvK3FsMmFKYS9EYTZYN3pJdkFaeEdTSFlUanJMTHNFNkJmcGdmNEJWNlJ0?=
 =?utf-8?B?NWNhcmhrM1dKalhCb1pzVVJIOVZvVTRPMUhOVk5uUFVESEZRY1BUNlovaDVC?=
 =?utf-8?B?eHl3QVEybUVXOGNmVGVMWlRndlpmNnFoZ2FlTlRjWjFmanZIVDB5Q3pieFBn?=
 =?utf-8?B?M1BEZnhKekYxTFI2VGVsV1FRS1VaeTVWdUpqdnpnWFNDbEhQQ1djVys5RTM2?=
 =?utf-8?B?UU96RWw3TlRqU01iYU1VQ0MzOGNsSU96L3R6bkVFckFINVBHMzZRdEFmYnpu?=
 =?utf-8?B?bitXSk5OZTlkRjM2aTYrcHRDSVRQRVo3VURNMS9razZOK1hlTVRCR1lDUWk4?=
 =?utf-8?B?S2YzUkRSUHVYZUs3M3lXUnVDdzR2VGVEdnJsSUlQYU9VS3pubG9URWw4MFV0?=
 =?utf-8?B?T2VTRS9HOU5zM1RkdDdoR2c5eUJnd1ZSbERLbDVRYWd3enAydmVCcU8vcmpt?=
 =?utf-8?B?cjg2NUlPenVYZGZhbHhzNEExcVFFRjRYTjlvanB2cENNKzdDb0pac2FQeVlW?=
 =?utf-8?B?VDl5aUNFRXdqMW5CWm9Kelk4QlBpNkRFL0c4bTBrSHJKTVNvYi9qem1ZMG15?=
 =?utf-8?B?KzJjSndjZDNFdXhlTG85T3NUdW0zL0x0ejcxMVQvbHNCMVBoSllwWm9PVmVN?=
 =?utf-8?B?NWtuNk9vUnZsUmNrZTZFVG1hVzlRbEFyNFlQUGpzUVBiYVplSVpDbzdzUDBB?=
 =?utf-8?B?Y3IwQTlOUkxGdnVHdnZYd3k0dnJKdmYyeTViVEUrWW13TmxvTWJOdGMyT2hT?=
 =?utf-8?B?Ym51ZkxBRlRvcCszUTgrV2hHOFIvRjRtak9FTW45UXMwOUkzVVJFL2VwOVFv?=
 =?utf-8?B?RWh5c2dFcDFqaWIyT1E1Y0c3RHZoekdsZTZIdEF3OEhWdmowNlkwMzdTZCsz?=
 =?utf-8?B?TERBS1Q0emNsVU5PdHpxUk5ZUnlRQVlFSEVXbFdyb2NMajVBU1gyNUpiUnRC?=
 =?utf-8?B?RU83UDE5Wk04ZXFwb0NzOHR2b25adFQ1WHpiNlUrK1V2RWhrcGIzcE1Db3N5?=
 =?utf-8?B?azNMNzUzVCs1Y3FidXh6d0ZnRnpwT2EwV2RMYzVDR3Z5Q2YxQjV6SDk5UzU3?=
 =?utf-8?B?Yk51ajNIV1BtMDIxM2NwcWVLVm5aZXNnWlR5QkJvUTh6aExLN0lwRmNlU2xK?=
 =?utf-8?B?Ylg1bDREVmZHeHVtVkRvK0h6ZktQK1RzVnprNkNQUTRTVTVTSWc4ZUJMT0R3?=
 =?utf-8?Q?AekJ0Hny6ujDsKwkaayuZPpVamaUOr5NMD?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c91f679-b1cb-4f7f-0ba6-08d8c12e809f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB3919.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 12:41:14.5387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7I/LtvjF6qbSct1dNzj6xMLiIp4uXfVa7aPXoJMWsvwF+eA3/I5BsQtYMYO5RWSsMbfBrWNj9jHyjBAaTKsAKtZgtd0dFOSUBg5cSnCwnIM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3984
Content-Type: multipart/alternative;
 boundary="------------2F8A4AE7F4402B6642EE1828"
Content-Language: en-US

--------------2F8A4AE7F4402B6642EE1828
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2021-01-21 8:17 a.m., Leon Anavi wrote:
> Upgrade to release 1.8.0:
>
> - Dropped support for python 3.5 and below, including 2.7
> - ruamel.yaml is now the default and preffered yaml parser
> - Dropped support for pyyaml parser
> - Update minimum version of ruamel.yaml to 0.16.0
> - Update minimum version of python-dateutil to 2.8.0
> - Added new cli argument "--encoding ENCODING" that specifies what
>    encoding to open data and schema files with
> - Enum error strings now output all possible values for easier
>    debugging
> - Removed deprecated imp module. Dynamic imports imght be affected
> - Implement new type email that uses a relative simple regex to
>    validate email addresses according to RFC 5322 Official Standard
> - Implement new type url that uses a relative simple regex to
>    validate url:s according to RFC 1808
> - Add new argument "schema_file_obj" to Core class. Allows to pass
>    in StringIO or similar interfaced objects to use for validation.
> - Add new argument "data_file_obj" to Core class. Allows to pass in
>    StringIO or similar interfaced objects to use for validation.
> - Fixed a regression from 1.6.1 where ruamel.yaml safe_load would
>    break for all built-in custom python tags.
> - All normal python tags should now be possible to use again.
> - Fixed an issue with regex values that was not converted to str()
>    before regex mapping was attempted.
> - This should validate things like integers and objects that support
>    str() conversion better.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../0001-rule.py-fix-missing-comma.patch      | 34 -------------------
>   ...fy_1.7.0.bb => python3-pykwalify_1.8.0.bb} |  7 ++--
>   2 files changed, 2 insertions(+), 39 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python3-pykwalify/0001-rule.py-fix-missing-comma.patch
>   rename meta-python/recipes-devtools/python/{python3-pykwalify_1.7.0.bb => python3-pykwalify_1.8.0.bb} (57%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pykwalify/0001-rule.py-fix-missing-comma.patch b/meta-python/recipes-devtools/python/python3-pykwalify/0001-rule.py-fix-missing-comma.patch
> deleted file mode 100644
> index 689355eea..000000000
> --- a/meta-python/recipes-devtools/python/python3-pykwalify/0001-rule.py-fix-missing-comma.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From f96b76efb810d7d559254d0ec58de628e09f525a Mon Sep 17 00:00:00 2001
> -From: =?UTF-8?q?Mart=C3=AD=20Bol=C3=ADvar?= <marti.f.bolivar@gmail.com>
> -Date: Mon, 13 Jan 2020 08:42:05 -0800
> -Subject: [PATCH] rule.py: fix missing comma
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=UTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -A line in the defined_keywords list is missing a comma. Add it.
> -
> -Signed-off-by: Martí Bolívar <marti.f.bolivar@gmail.com>
> -
> -Upstream-Status: Backport [https://github.com/Grokzen/pykwalify.git]
> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ----
> - pykwalify/rule.py | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/pykwalify/rule.py b/pykwalify/rule.py
> -index 7ac2c9e..f044b69 100644
> ---- a/pykwalify/rule.py
> -+++ b/pykwalify/rule.py
> -@@ -340,7 +340,7 @@ class Rule(object):
> -             ('matching', 'matching'),
> -             ('matching_rule', 'matching_rule'),
> -             ('name', 'name'),
> --            ('nullable', 'nullable')
> -+            ('nullable', 'nullable'),
> -             ('parent', 'parent'),
> -             ('pattern', 'pattern'),
> -             ('pattern_regexp', 'pattern_regexp'),
> ---
> -2.18.2
> -
> diff --git a/meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb b/meta-python/recipes-devtools/python/python3-pykwalify_1.8.0.bb
> similarity index 57%
> rename from meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb
> rename to meta-python/recipes-devtools/python/python3-pykwalify_1.8.0.bb
> index 2e1bff4f2..aa14cdd4b 100644
> --- a/meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pykwalify_1.8.0.bb
> @@ -2,12 +2,9 @@ SUMMARY = "YAML/JSON validation library"
>   DESCRIPTION = "pykwalify is a schema validator for YAML and JSON"
>   HOMEPAGE = "https://pypi.org/project/pykwalify/"
>   LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=a72ea5159364a2cd7f45c6dcbee37872"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=4eaf57328ad29ea2e0ed31a57f0914dc"
>   
> -SRC_URI[md5sum] = "58357f1d0f77de976e73dbd3660af75b"
> -SRC_URI[sha256sum] = "7e8b39c5a3a10bc176682b3bd9a7422c39ca247482df198b402e8015defcceb2"
> -
> -SRC_URI += "file://0001-rule.py-fix-missing-comma.patch"
> +SRC_URI[sha256sum] = "796b2ad3ed4cb99b88308b533fb2f559c30fa6efb4fa9fda11347f483d245884"
>   
>   PYPI_PACKAGE = "pykwalify"
>   
>
> 
>

--------------2F8A4AE7F4402B6642EE1828
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-21 8:17 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210121131709.27097-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.8.0:

- Dropped support for python 3.5 and below, including 2.7
- ruamel.yaml is now the default and preffered yaml parser
- Dropped support for pyyaml parser
- Update minimum version of ruamel.yaml to 0.16.0
- Update minimum version of python-dateutil to 2.8.0
- Added new cli argument &quot;--encoding ENCODING&quot; that specifies what
  encoding to open data and schema files with
- Enum error strings now output all possible values for easier
  debugging
- Removed deprecated imp module. Dynamic imports imght be affected
- Implement new type email that uses a relative simple regex to
  validate email addresses according to RFC 5322 Official Standard
- Implement new type url that uses a relative simple regex to
  validate url:s according to RFC 1808
- Add new argument &quot;schema_file_obj&quot; to Core class. Allows to pass
  in StringIO or similar interfaced objects to use for validation.
- Add new argument &quot;data_file_obj&quot; to Core class. Allows to pass in
  StringIO or similar interfaced objects to use for validation.
- Fixed a regression from 1.6.1 where ruamel.yaml safe_load would
  break for all built-in custom python tags.
- All normal python tags should now be possible to use again.
- Fixed an issue with regex values that was not converted to str()
  before regex mapping was attempted.
- This should validate things like integers and objects that support
  str() conversion better.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210121131709.27097-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../0001-rule.py-fix-missing-comma.patch      | 34 -------------------
 ...fy_1.7.0.bb =&gt; python3-pykwalify_1.8.0.bb} |  7 ++--
 2 files changed, 2 insertions(+), 39 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pykwalify/0001-rule.py-fix-missing-comma.patch
 rename meta-python/recipes-devtools/python/{python3-pykwalify_1.7.0.bb =&gt; python3-pykwalify_1.8.0.bb} (57%)

diff --git a/meta-python/recipes-devtools/python/python3-pykwalify/0001-rule.py-fix-missing-comma.patch b/meta-python/recipes-devtools/python/python3-pykwalify/0001-rule.py-fix-missing-comma.patch
deleted file mode 100644
index 689355eea..000000000
--- a/meta-python/recipes-devtools/python/python3-pykwalify/0001-rule.py-fix-missing-comma.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From f96b76efb810d7d559254d0ec58de628e09f525a Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Mart=C3=AD=20Bol=C3=ADvar?= <a class="moz-txt-link-rfc2396E" href="mailto:marti.f.bolivar@gmail.com">&lt;marti.f.bolivar@gmail.com&gt;</a>
-Date: Mon, 13 Jan 2020 08:42:05 -0800
-Subject: [PATCH] rule.py: fix missing comma
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-A line in the defined_keywords list is missing a comma. Add it.
-
-Signed-off-by: Martí Bolívar <a class="moz-txt-link-rfc2396E" href="mailto:marti.f.bolivar@gmail.com">&lt;marti.f.bolivar@gmail.com&gt;</a>
-
-Upstream-Status: Backport [<a class="moz-txt-link-freetext" href="https://github.com/Grokzen/pykwalify.git">https://github.com/Grokzen/pykwalify.git</a>]
-Signed-off-by: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
----
- pykwalify/rule.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/pykwalify/rule.py b/pykwalify/rule.py
-index 7ac2c9e..f044b69 100644
---- a/pykwalify/rule.py
-+++ b/pykwalify/rule.py
-@@ -340,7 +340,7 @@ class Rule(object):
-             ('matching', 'matching'),
-             ('matching_rule', 'matching_rule'),
-             ('name', 'name'),
--            ('nullable', 'nullable')
-+            ('nullable', 'nullable'),
-             ('parent', 'parent'),
-             ('pattern', 'pattern'),
-             ('pattern_regexp', 'pattern_regexp'),
--- 
-2.18.2
-
diff --git a/meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb b/meta-python/recipes-devtools/python/python3-pykwalify_1.8.0.bb
similarity index 57%
rename from meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb
rename to meta-python/recipes-devtools/python/python3-pykwalify_1.8.0.bb
index 2e1bff4f2..aa14cdd4b 100644
--- a/meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pykwalify_1.8.0.bb
@@ -2,12 +2,9 @@ SUMMARY = &quot;YAML/JSON validation library&quot;
 DESCRIPTION = &quot;pykwalify is a schema validator for YAML and JSON&quot;
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://pypi.org/project/pykwalify/">&quot;https://pypi.org/project/pykwalify/&quot;</a>
 LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=a72ea5159364a2cd7f45c6dcbee37872">&quot;file://LICENSE;md5=a72ea5159364a2cd7f45c6dcbee37872&quot;</a>
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=4eaf57328ad29ea2e0ed31a57f0914dc">&quot;file://LICENSE;md5=4eaf57328ad29ea2e0ed31a57f0914dc&quot;</a>
 
-SRC_URI[md5sum] = &quot;58357f1d0f77de976e73dbd3660af75b&quot;
-SRC_URI[sha256sum] = &quot;7e8b39c5a3a10bc176682b3bd9a7422c39ca247482df198b402e8015defcceb2&quot;
-
-SRC_URI += <a class="moz-txt-link-rfc2396E" href="file://0001-rule.py-fix-missing-comma.patch">&quot;file://0001-rule.py-fix-missing-comma.patch&quot;</a>
+SRC_URI[sha256sum] = &quot;796b2ad3ed4cb99b88308b533fb2f559c30fa6efb4fa9fda11347f483d245884&quot;
 
 PYPI_PACKAGE = &quot;pykwalify&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------2F8A4AE7F4402B6642EE1828--

Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.55])
 by mx.groups.io with SMTP id smtpd.web11.1920.1610121978759045646
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Jan 2021 08:06:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=IvgXdfWm;
 spf=pass (domain: windriver.com, ip: 40.107.223.55, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z4DTkwTip+tBkYgol/bbJH+8g/JKUke/FdViN8iJLpEWvlPrIHzHrJHVqMxiH/PTkrf/oncgOptK/lSnF+z7M93IaIuYkVl7doa3Y+N+MNsldDWJTJ5Qqi5U8Jy/9wAzJHgiGS43WUOiFtUFSCCgxOSXdofDYHeeGpq0cQy8QCvIPk5QopRuSDoqeNknMew+kG/PYGg8H/hXkouEz7WxF/aOVkH2FaPz8umgYjNWX6O6vVCApKW3NkscvpwO/gIRLLE0ltN9zES9v2hy8o8xpf5RIsDTXG2Vec1R55rqZH499mxAQOm1/PJ5KEvLz5z0Db/IuMUxY/sNZIE2gNX4LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MsuGlJiWf5NXJ3PQgsjCwmFVJKzpm4m5MCPxdsv4zyQ=;
 b=SZ5URFjTou8FwYFkXDB1CH2QRBy3A+m2ydZ0EEmb1pHmHWYfElNI4oCA/zSx+rFznFHY4DKf+Lp/OTNQeTx8DnPhLo1NSXxVxe4Dngobug154+6C2/xpUmTxWdgnHiF5F2XbibzzQCJ85arNLAqV/llEdJiWM1BqkQrEjcNZQUah1zOeWo+J1ZT40wSg3vYD1moR6eG9ZMEi3PrLbMeIEFg9Lk7TcFgZyCTTrWZ25TNQviPp5sAgo5ivacI4RIw0KAlarVfvQSeVB+7q0M+Tgbz7Ql0nP1+AXkK26Vk6L8tMH8ANRM98GYJqS8ADzlxHX416gEKiD3k4ba6jp4uxiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MsuGlJiWf5NXJ3PQgsjCwmFVJKzpm4m5MCPxdsv4zyQ=;
 b=IvgXdfWm/0rCCPkPVmHnPpJpfJ2EyotkMreT0wEmFOoPGdoM9pgrDWHZCJpPNn4QcNmZTGKzAjl9LzmbfojbzBWyo9xd6hwgoeyhOR/JooO8z8ooArVGYasYCVjAubE1nM3Ji7vp7P85QpspwSVCdB6IRprvauYaUAXhfUbEVzw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3303.namprd11.prod.outlook.com (2603:10b6:a03:18::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 16:06:12 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6%7]) with mapi id 15.20.3742.009; Fri, 8 Jan 2021
 16:06:12 +0000
Subject: Re: [oe] [meta-python][PATCH 05/10] python3-transitions: Upgrade 0.8.5 -> 0.8.6
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210106220702.10483-1-leon.anavi@konsulko.com>
 <20210106220702.10483-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <1e3f837d-6833-a6bd-512b-f32965cc0e28@windriver.com>
Date: Fri, 8 Jan 2021 11:06:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20210106220702.10483-5-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR13CA0012.namprd13.prod.outlook.com
 (2603:10b6:208:160::25) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR13CA0012.namprd13.prod.outlook.com (2603:10b6:208:160::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.2 via Frontend Transport; Fri, 8 Jan 2021 16:06:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: caf050f9-323e-4a3b-ecd0-08d8b3ef51b8
X-MS-TrafficTypeDiagnostic: BYAPR11MB3303:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3303AB61C4B72390AD932E609FAE0@BYAPR11MB3303.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/ZOeTpiQITRjLG4qudPnkmceepHDwaDzHWYDXG/tD/KakcWQaxxEB5t7PZbEc6L8Y54cuki3PYNvnRX5WTZrJoQy/cLjQg6jd+We4nkCdVZUXPNOuaYc7WivForNbsfojiBup3WMn2REfMWeM1eJ169cQS3ac9fHN67QpzLWZ0zwtpn+aR9WPGHI8z88CJuOv+1w7t1LtAQjy09mOaEm7VGnu/T58YodPoLcezkriemA6E5wIFHxPfKEETbiPwZ18hqaTLVT9EUxkm34x0AcIIG41J1+byNvZy+QhYyM4lYEvjRfUIY+7fcKxyFtDn5VWKQNESFe1g49ZFxRNxWDh597/nkUlOXAZGH/ZfM7GsITQH6VYKfEwRc7aptJRaYSL74Zym48ZGLY9zWepwKx4uPRoPvwoMjh8r4LbmslicnEg0bs9scUDSTRcjqm3eja921LlDfLSML/vlWhxi7XMuTFNciR4bLW4gOosigegRJiQ/vIs/gfSq9acZ944H7RfrhDQr+C6yCgP4CqfaQIy2O5lR+AACSdMXg5uZIbMj89PRb0qBkH/5+yNoPvTbAK
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(39850400004)(136003)(366004)(66946007)(8676002)(33964004)(44832011)(86362001)(8936002)(2616005)(166002)(2906002)(956004)(52116002)(66556008)(6486002)(83380400001)(66476007)(16526019)(16576012)(966005)(36756003)(31686004)(31696002)(5660300002)(26005)(53546011)(478600001)(186003)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?Q3l3Qy9YbzhPN3pOdmlrZjhrK0d2bUNLZzB2OGlGWTBiNzc0VW9BZEE2c0pn?=
 =?utf-8?B?dFBTMnhXVHdLRzVEcjBPQitONU40YXZGSXA1RlcrM0E2bGFvWUxSZExTbFFp?=
 =?utf-8?B?eGpJN2ZuU3NiUHNicFBXSm1lelJGZStUTGJ4dGs1SE9kZnB0UmxvM0JHb0ZQ?=
 =?utf-8?B?SzRvU3NMSk1MVXFRejZraXp6eHMxRC9VUmN3TFJzempwZ1F4YUwvd0tjN2Vn?=
 =?utf-8?B?Q2dCdk5CTDgzWjcxRlpqLzhMenlpWUtwNlZOVjVINlJzQndGMExoVVZOOEw5?=
 =?utf-8?B?cmdVREh5OXl0YkV1UUVSdFVpYm9GNTc2KzFlaG1EVXA0QktUc2Evb2ZZWTZj?=
 =?utf-8?B?K1BXV0lXTU94ZDVsaEZvYTRCMHZ1Y1VJQUxlMmlwNUxkMlI4bXpCd05oSzM1?=
 =?utf-8?B?dEIvQUVYeHluNXF5OENLMmFXZzkyQmwzUWUvbW1UaUNISlB3aEEyL2lwWEJN?=
 =?utf-8?B?YXJya3dhWWpURkZTS1FXYTkyRzk4UFhxK1BTUkJXdDNSTnh0b05IZnFDWktO?=
 =?utf-8?B?WXhlRVYyTVRyK0lnQ1U3RS9hR2s2L1EzRWRKWlArcTRVczZMS2h6c2lOM1Rs?=
 =?utf-8?B?blFZNUVuTTJ4czl5Z2poVWJjVGh3UjFValorYU9OeWd0aGp6MkRrWngwV054?=
 =?utf-8?B?QTJUWDZuTTdsMnI1cFBYUjJUTmNLL3NGcWRWZGdRYlJQbEVHTzQ2WHF2czFk?=
 =?utf-8?B?K0Yxc0NFaHhDVU9BUDdFa2tKOUcrZjk2b0RWdkhEVHBhRzRYWStYVUxTVGhR?=
 =?utf-8?B?cGJRNlZqeUwzaUh6c2lVK1RwdnM0eFhTWFI3TUhEYks0clUyTHZwaGxHMy8z?=
 =?utf-8?B?VmlSWnNFNG1rdHF6VG81MkZMSFg1cnpmbGNrMWo0dmkreWR0UnVScVNJL00z?=
 =?utf-8?B?UG5rOW1XMFpJb2svK09VRDA2bDVJL2JtOFhiakdnOGVNTHNWTGJlbUROSDZo?=
 =?utf-8?B?MFFBYm01NXMxdjBDUXl5TCszVTFTdjF4Y2ovOWNNWHlWUXJRYXdzbEx3SXZv?=
 =?utf-8?B?eEViTUlQajVjRWZaSk9SRk45S0xjMnMwaUw3V0p1NVI4S3Q1Yyt2c24yVUxt?=
 =?utf-8?B?MTRrcDdlRWgyU0Z3SnBZMm9Dc0VQaEF6bFlXakZGbVVZd2gxOFYwQjIwcmhH?=
 =?utf-8?B?V01NQSt1NnFPOWVVUzlDRTk4NFMvcHR1bkprN2h2NTFPV2QxNmt2NkoyMTV2?=
 =?utf-8?B?YUlqTWR5NnhLUHJXTlNyd1pUWHA2M3QvVW0zelJjbE9QV3hWeEFKSjFGUVV6?=
 =?utf-8?B?Yk9TWDFTUTFTZWNCOTQ2WFRMeGZYRTkrTUFWUzlWQ01LQUlXM003YU9IUXJn?=
 =?utf-8?Q?gdg2Dr17L4ZDHs1uvWoTuRwDWIXlnMIN6u?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 16:06:12.1705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: caf050f9-323e-4a3b-ecd0-08d8b3ef51b8
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XEyFDr8eIC5fX7GZs44yEKKf45TYvmhD1MTPPzLrTGpyLAa217fN3b3h2Nc5wxqmOFr4AX6QMe0T/1ZPkodPaeEVArIsoE2SI4tR9zYD+dQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3303
Content-Type: multipart/alternative;
 boundary="------------E829D1355CC745D3CF8361D7"
Content-Language: en-US

--------------E829D1355CC745D3CF8361D7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-06 5:06 p.m., Leon Anavi wrote:
> - HierarchicalMachine.add_states will raise a ValueError when an
>    Enum name contains the currently used NestedState.separator.
> - Bugfix: Reset NestedState._scope when enter/exit callbacks raise
>    an exception
> - Bugfix: Let HierarchicalMachine._get_trigger which is bound to
>    model.trigger raise a MachineError for invalid events and
>    AttributeError for unknown events
> - Introduced HierarchicalMachine.has_trigger to determine whether
>    an event is valid for an HSM
> - Feature: AsyncMachine features an event queue dictionary for
>    individual models when queued='model'
> - Feature: Machine.remove_model will now also remove model events
>    from the event queue when queued=True
> - Feature: Machine.get_transitions and its HSM counterpart now
>    accept Enum and State for source and dest
>
> License-Update: Update year
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...hon3-transitions_0.8.5.bb => python3-transitions_0.8.6.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-transitions_0.8.5.bb => python3-transitions_0.8.6.bb} (52%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-transitions_0.8.5.bb b/meta-python/recipes-devtools/python/python3-transitions_0.8.6.bb
> similarity index 52%
> rename from meta-python/recipes-devtools/python/python3-transitions_0.8.5.bb
> rename to meta-python/recipes-devtools/python/python3-transitions_0.8.6.bb
> index 7f88bc1d22..701c82cda8 100644
> --- a/meta-python/recipes-devtools/python/python3-transitions_0.8.5.bb
> +++ b/meta-python/recipes-devtools/python/python3-transitions_0.8.6.bb
> @@ -1,9 +1,9 @@
>   SUMMARY = "A lightweight, object-oriented Python state machine implementation with many extensions."
>   LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=de0a0876a688a4483bfafa764773ab39"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=baac7be1f4c17620df74188e23da6d47"
>   
>   inherit pypi setuptools3
>   
> -SRC_URI[sha256sum] = "e441c66a0c753d56c01c3e5e547f21dbe4a5569c939f12477475c5e81d79769b"
> +SRC_URI[sha256sum] = "032e10113139852ffb3ecfa4c2a5138f87441d85c3d6ad9122bb4b0978180a8d"
>   
>   RDEPENDS_${PN} += "python3-six"
>
> 
>

--------------E829D1355CC745D3CF8361D7
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-06 5:06 p.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210106220702.10483-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- HierarchicalMachine.add_states will raise a ValueError when an
  Enum name contains the currently used NestedState.separator.
- Bugfix: Reset NestedState._scope when enter/exit callbacks raise
  an exception
- Bugfix: Let HierarchicalMachine._get_trigger which is bound to
  model.trigger raise a MachineError for invalid events and
  AttributeError for unknown events
- Introduced HierarchicalMachine.has_trigger to determine whether
  an event is valid for an HSM
- Feature: AsyncMachine features an event queue dictionary for
  individual models when queued='model'
- Feature: Machine.remove_model will now also remove model events
  from the event queue when queued=True
- Feature: Machine.get_transitions and its HSM counterpart now
  accept Enum and State for source and dest

License-Update: Update year

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210106220702.10483-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...hon3-transitions_0.8.5.bb =&gt; python3-transitions_0.8.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-transitions_0.8.5.bb =&gt; python3-transitions_0.8.6.bb} (52%)

diff --git a/meta-python/recipes-devtools/python/python3-transitions_0.8.5.bb b/meta-python/recipes-devtools/python/python3-transitions_0.8.6.bb
similarity index 52%
rename from meta-python/recipes-devtools/python/python3-transitions_0.8.5.bb
rename to meta-python/recipes-devtools/python/python3-transitions_0.8.6.bb
index 7f88bc1d22..701c82cda8 100644
--- a/meta-python/recipes-devtools/python/python3-transitions_0.8.5.bb
+++ b/meta-python/recipes-devtools/python/python3-transitions_0.8.6.bb
@@ -1,9 +1,9 @@
 SUMMARY = &quot;A lightweight, object-oriented Python state machine implementation with many extensions.&quot;
 LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=de0a0876a688a4483bfafa764773ab39">&quot;file://LICENSE;md5=de0a0876a688a4483bfafa764773ab39&quot;</a>
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=baac7be1f4c17620df74188e23da6d47">&quot;file://LICENSE;md5=baac7be1f4c17620df74188e23da6d47&quot;</a>
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = &quot;e441c66a0c753d56c01c3e5e547f21dbe4a5569c939f12477475c5e81d79769b&quot;
+SRC_URI[sha256sum] = &quot;032e10113139852ffb3ecfa4c2a5138f87441d85c3d6ad9122bb4b0978180a8d&quot;
 
 RDEPENDS_${PN} += &quot;python3-six&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------E829D1355CC745D3CF8361D7--

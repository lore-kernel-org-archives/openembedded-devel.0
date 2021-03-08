Received: from NAM04-DM6-obe.outbound.protection.outlook.com (NAM04-DM6-obe.outbound.protection.outlook.com [40.107.102.76])
 by mx.groups.io with SMTP id smtpd.web11.36377.1615212446608252307
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Mar 2021 06:07:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=SkrizGfI;
 spf=pass (domain: windriver.com, ip: 40.107.102.76, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J63leeOyRne7Mbc2I/iqQhrK78DI9n1CbxNbS3cYEyOTxZLmfhjQPWluC69JjBOyXgV5hcLjoyK4Y5bCAzzSJYuoCxSoQ4WcvhEdpPF+a/LZ5iLWT2wmUzXfs5TIOowpO6gTSM1ZnppZ9U3E3etsu+KCbK7IglGnoKBmkW+C5ymLoYIRgY6cj6U6/S7dIwwSn8G+T5WW+AdaaokwIQ7vten/ZhGm6hRf+FRKpmmyQjg0oj7trgsaG14A0pgZ1G5ULHaZjyORwJiAYRQbjg8lYtbkcc3aO8aiqJ85W9jAZUG9ADKQBQl+2rTQGS8bc/Kozb6DM8BLLbpvjpuJZOSkhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OSQHYewZ3gDiqLhjgvrXFBdSQQJHq7u8hm6w7uiO5F0=;
 b=nx8RYMEojKtqbO5+vwGkDs2m47TMyv5l0qZIRUrO9u9g88cnphlsd8cME19smp/Q1q4ZTtyc14LOgjyQrNcrX6zkyKHPE94riG7E3M40sf+aZqDThZYe+D7UJbntBT+6xSmRmP7wQyjNPPLgGoCHq4hIPrp13+FipmnzJ4JfngcZFqAGUiJgxvH5GbVgn00fwaNgcHwG0cxO5l2r/yGAqy2l+zmNUegucMtu43s6mvEfuHFfQWiuhjBfSyOEWcEGbgztvVksbOysO+bDZmZ4NM4m92FxSwAsm0LW2Gk9FkdrwKTambPWjT6aw0u0K3Kqr1OLlhMYzo579xi1MDh5ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OSQHYewZ3gDiqLhjgvrXFBdSQQJHq7u8hm6w7uiO5F0=;
 b=SkrizGfIBVqJX0QwijQWPIhm2HOqECGqmyxIZ8GP0LzTlYDHtDtT7j7A8Xn2y4b1aDCTj15AkUz/zr9HTJMXjj2JC8IqBy3mGPkjRXYWDThOwOQ4ZuwwBW/d6qzd1U2KFtBCIZSw4AYlBT2IXSkBv2MaBpgatxhuYC17Elo68m0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3446.namprd11.prod.outlook.com (2603:10b6:a03:1a::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.28; Mon, 8 Mar
 2021 14:07:25 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3890.037; Mon, 8 Mar 2021
 14:07:25 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-websocket-client: update to 0.58.0
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
 openembedded-devel@lists.openembedded.org
References: <20210307163559.978268-1-open.source@oleksandr-kravchuk.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <1944aca2-edab-11d9-9eb7-3a62e8c0be5a@windriver.com>
Date: Mon, 8 Mar 2021 09:07:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210307163559.978268-1-open.source@oleksandr-kravchuk.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN8PR04CA0036.namprd04.prod.outlook.com
 (2603:10b6:408:70::49) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN8PR04CA0036.namprd04.prod.outlook.com (2603:10b6:408:70::49) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Mon, 8 Mar 2021 14:07:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac95a4c2-1df5-438f-0838-08d8e23b7fe0
X-MS-TrafficTypeDiagnostic: BYAPR11MB3446:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3446D34634AA3F9270ACFE5E9F939@BYAPR11MB3446.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IrqVr3h/YARcywJKFBnvK5gKQjYUIGyJZB9csbqp9PJGkb9BudZ48SdHZLXAL8nSe/xrf2F6sU3PdwbLBdMbTXYhxNoDot57hLugCvxBMad+061GvwjBWPPIoQrzaBNzQt9i1MxvDj0xb5kI7TUUopmi9neR9XK1ZyjDU28V5PmUmVluOmotSpfU1J10w+sPXeLmkAkun69JggfHhzIBGxgmLi2vf8r2YGqZ3uw0zVEqhIQa2J4TX9yQxo2aa8wkwFU0LXxDMplJUUILl0rSkmhjdw2IfKQYjrey4T9rXWzYSYn2hN2R9qUa7yzHIyPNq3QcZnauCebcW8iCjnasVj9uObAU1vdOw0gljg/f0Y2LjpJIrCn5htzTGDl0dP0FBld7V+rWIIRIp5E7Hcc31STD7HTjHXvrkkv1onukhFrW41GglEhakeMZ/ap2WSdwgiL+ZFF/yZ52j7TxbpAPVfK2i8vaZOKjzkZ5DLdttve6slYi6aP78yUc+pkLZmc7ZmhxrbkAVVuqvGsU0SvCbSg5/wVpcKaniMfxO1saHomTS3gB1BPbJMkqesZR69sk7mKet7Yara4B5xjf1jjR737vTgELpjqp/mpNl+p0DsxV3l8AMeVaqYAJIDTLrHRyeUk39IJuqfGs4+nrWc3766JS/l+KcK9b24QurpqZ6SyGMX7fQgWkZ7mjd5zfvRKj
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(366004)(39850400004)(396003)(376002)(53546011)(478600001)(26005)(6486002)(15650500001)(31686004)(31696002)(166002)(2906002)(66476007)(966005)(5660300002)(316002)(66946007)(86362001)(8936002)(44832011)(83380400001)(16576012)(8676002)(956004)(186003)(2616005)(33964004)(36756003)(66556008)(16526019)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?aStqOU0vSlp0VWg2Zy9SZ1BpdlRldlhPdHZ3MU1QSktFZWUzRGxGUXpvMno3?=
 =?utf-8?B?aGlMQ09JL1E0U3NKQnovODBPdDhINlBTVk5tZXdXVS9xY2N0N04zN3RTQ0hr?=
 =?utf-8?B?VkwrK0hJb3plRkl0VVNidVNJVnZweUZnQ1RNYnRQMkoxZUlsRjNLSXpIeHg0?=
 =?utf-8?B?K052WUhiamlyMEI4TkkrNWNxY0cvT3U1Z0tzaGlBOWI5MTJRdVdNVCt6RWdh?=
 =?utf-8?B?N2llMzM5R1BGNFFHQWpCYnhxNDlNQzNDMVVzQ2RiUmRiTGpJeCtOMnRnU1pm?=
 =?utf-8?B?K2YwT3ZqdnJRb2hkWlZna0JSbndRYVVXTlloYjFHMHQxbm9waytFaDBzVFBM?=
 =?utf-8?B?TDM3SVB4WlRzTHh4Zy8wSm01bjgweGYrbVBWc0FUeTBGQ0ppdG5xVSt5Y1dx?=
 =?utf-8?B?dTVaY21QYngxUnNQazZyUGxSWXpabFBWOGlpa25pdENOc0IzSnNCTytWdllW?=
 =?utf-8?B?aWZBTmRvbjVZQkNKNXlyK0lWaFh2QW1GZ1NxV3puWnFlclp1M0I5YU1ZZUtk?=
 =?utf-8?B?S0JuY29NeXA0cDFIaWFiYy8veWJOY3lRcjdMcTBQYmI0QmY4ZVdSamNqMDc5?=
 =?utf-8?B?L3FkY0hJa2h0cmlPVmEzS05KWEtsWEZ2aE1OQkJMcXp0bXJJU2srekxUYjlu?=
 =?utf-8?B?VnJlVGVSQm9iSmozSEM2SndjVXJ6dnB3U2IwcHhjeDlJZGJURDFMQU5HQnVT?=
 =?utf-8?B?dzFzZmtSSGFuVWdCUnB1c21xdUFzenVZMGZURGRleE8xcVQ2RGgrSGRnSW0w?=
 =?utf-8?B?elJJMTJFMktDNTNZVVJyVmExMG1TL3BOMFRUSlo0VnlLNzBhdjZqK29hRHZt?=
 =?utf-8?B?M095N1JRd2l4YzV6dENBYWhXY1dFUzJ2bERrYWlZZTZVaHgxcXJiTzJYeWh6?=
 =?utf-8?B?a0pyR0MzZmdyaDE5b05IYVlTRFFobVFIUkI1bncwWGErUlNLZHYyaXpHMm0x?=
 =?utf-8?B?VnhULzIrSTY5bGlqcnlQcGl3MFozU0FpbHA4WVlxSGQyM0tUNHFvQUdQbmR2?=
 =?utf-8?B?QkVHOXVLTllvV3A5Y3RqbWdlUnlTbExWSTMvcTZINTVmYWNPQktOekFLcjZ0?=
 =?utf-8?B?ckpvMnVIOExpNzIxd2R5ZnNOOWpab1B2Uk1KMk55QnNrdm41WTZvUEtvcVM5?=
 =?utf-8?B?MEtLRkFmVW9raVB2QVpBS0VyZW1BYnQ0cTR4NjBKdlFJQTBaeWVuV05uZkhH?=
 =?utf-8?B?ZnpoZUFINHFaVkdkem9mMTh2dFAxdFN2elMyY0ZKL09HN253MWsvVlAxdWdN?=
 =?utf-8?B?SHlRRnlBbnF4UnVnYVYvU3pxTXVER2FxUFgwaDN3bjN0WDF5eHozZEozYldn?=
 =?utf-8?B?aU5qMzBJUklFVjk2SURIaFdQb09VUWo3Mi9DUnAxT2tBdHh3bVphMWp1VjRR?=
 =?utf-8?B?c2V4cFlaejhXeGRpRHQ4M2ZxSk9XYkxkVlBRdWNPcGVKZVdNdkM1dDF4azdq?=
 =?utf-8?B?dTRmeklqQWdwRlU1Y1g5bzZHaVZvTmoyejk4M2xWNnlKOGYybDFJdmJZeEtP?=
 =?utf-8?B?OE1pbW00UEp2NHFJTEpZandtd29iYWFUSjZIdi9RSG9Tcmw5d0lVaFp2SjRH?=
 =?utf-8?B?Q3I0eTljanNnVlhSdENxVlVGeUlMN0ZTUllZaGo0ZzltU2gzODBhSGtxZUlH?=
 =?utf-8?B?VG04ejRPSU5tTTBHSTRMUjQwaVh0eEY2UlJxamU3eTVjOC9tSDEwdEtmclcv?=
 =?utf-8?B?ZVUxNnNqR2J6NTl0MmhBWFBkMXg1ampqRUVpK0RJZXZXN29GNUhxRE9tOEVF?=
 =?utf-8?Q?U3uacKxZChBqigxuFe/z4OBpHIZ6reOTWkEolKe?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac95a4c2-1df5-438f-0838-08d8e23b7fe0
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 14:07:25.0770
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OFY8Cy0ZgoNVM0p4RKpkkRW50FCu2beQfnfIRdydtwXRKr8nGcNyEEzRCniclygs36bBzKtmQ1fHlMPwBd8nrYfDBYKop5lJ62u8TbcUlkk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3446
Content-Type: multipart/alternative;
 boundary="------------AEBA323DB66AF49F16F2BACE"
Content-Language: en-US

--------------AEBA323DB66AF49F16F2BACE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-03-07 11:35 a.m., Oleksandr Kravchuk wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...lient_0.57.0.bb => python3-websocket-client_0.58.0.bb} | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-websocket-client_0.57.0.bb => python3-websocket-client_0.58.0.bb} (61%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-websocket-client_0.57.0.bb b/meta-python/recipes-devtools/python/python3-websocket-client_0.58.0.bb
> similarity index 61%
> rename from meta-python/recipes-devtools/python/python3-websocket-client_0.57.0.bb
> rename to meta-python/recipes-devtools/python/python3-websocket-client_0.58.0.bb
> index aaa92f3cc..a5d7d901b 100644
> --- a/meta-python/recipes-devtools/python/python3-websocket-client_0.57.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-websocket-client_0.58.0.bb
> @@ -4,13 +4,13 @@ websocket-client module is WebSocket client for python. \
>   This provide the low level APIs for WebSocket. All APIs \
>   are the synchronous functions."
>   HOMEPAGE = "https://github.com/websocket-client/websocket-client"
> -LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=c4c4a98fbc4836b81c8c64d6ecb01fc1"
> +LICENSE = "LGPLv2.1"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=c96ca6c1de8adc025adfada81d06fba5"
>
> -SRC_URI[md5sum] = "8061820da5e1de26a6a1a6996d4eebd5"
> -SRC_URI[sha256sum] = "d735b91d6d1692a6a181f2a8c9e0238e5f6373356f561bb9dc4c7af36f452010"
> +SRC_URI[sha256sum] = "63509b41d158ae5b7f67eb4ad20fecbb4eee99434e73e140354dc3ff8e09716f"
>
>   PYPI_PACKAGE = "websocket_client"
> +
>   inherit pypi setuptools3
>
>   RDEPENDS_${PN} = "\
> --
> 2.25.1
>
>
> 
>

--------------AEBA323DB66AF49F16F2BACE
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-03-07 11:35 a.m., Oleksandr
      Kravchuk wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210307163559.978268-1-open.source@oleksandr-kravchuk.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Signed-off-by: Oleksandr Kravchuk <a class="moz-txt-link-rfc2396E" href="mailto:open.source@oleksandr-kravchuk.com">&lt;open.source@oleksandr-kravchuk.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210307163559.978268-1-open.source@oleksandr-kravchuk.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...lient_0.57.0.bb =&gt; python3-websocket-client_0.58.0.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-websocket-client_0.57.0.bb =&gt; python3-websocket-client_0.58.0.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-websocket-client_0.57.0.bb b/meta-python/recipes-devtools/python/python3-websocket-client_0.58.0.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-websocket-client_0.57.0.bb
rename to meta-python/recipes-devtools/python/python3-websocket-client_0.58.0.bb
index aaa92f3cc..a5d7d901b 100644
--- a/meta-python/recipes-devtools/python/python3-websocket-client_0.57.0.bb
+++ b/meta-python/recipes-devtools/python/python3-websocket-client_0.58.0.bb
@@ -4,13 +4,13 @@ websocket-client module is WebSocket client for python. \
 This provide the low level APIs for WebSocket. All APIs \
 are the synchronous functions.&quot;
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/websocket-client/websocket-client">&quot;https://github.com/websocket-client/websocket-client&quot;</a>
-LICENSE = &quot;BSD-3-Clause&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=c4c4a98fbc4836b81c8c64d6ecb01fc1">&quot;file://LICENSE;md5=c4c4a98fbc4836b81c8c64d6ecb01fc1&quot;</a>
+LICENSE = &quot;LGPLv2.1&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=c96ca6c1de8adc025adfada81d06fba5">&quot;file://LICENSE;md5=c96ca6c1de8adc025adfada81d06fba5&quot;</a>

-SRC_URI[md5sum] = &quot;8061820da5e1de26a6a1a6996d4eebd5&quot;
-SRC_URI[sha256sum] = &quot;d735b91d6d1692a6a181f2a8c9e0238e5f6373356f561bb9dc4c7af36f452010&quot;
+SRC_URI[sha256sum] = &quot;63509b41d158ae5b7f67eb4ad20fecbb4eee99434e73e140354dc3ff8e09716f&quot;

 PYPI_PACKAGE = &quot;websocket_client&quot;
+
 inherit pypi setuptools3

 RDEPENDS_${PN} = &quot;\
--
2.25.1

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------AEBA323DB66AF49F16F2BACE--

Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.57])
 by mx.groups.io with SMTP id smtpd.web11.2969.1608571050496887484
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Dec 2020 09:17:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=iXiU1R5D;
 spf=pass (domain: windriver.com, ip: 40.107.92.57, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H+EZOVPcBeHkcmJoPFuh3QszGgJls5J0zgBqBl88Dpvx2DpsbwLEJb37muGqiohythEK2Jro9ctPfZr5JzvI89AWp331uindNhoQ24zo9y6rQiSXQqL9i3cbZ+FD41YAbMhWJEi9RQcZ05+HYysHXG0vvIk9qbv4lY+RH0U++FTBBzZvG9zRQfSQklLVWTiA5IisWhY/ietDstDe3AfBURMyEmc/LlnzwaSC1jaBVjp9u627a0sMwoF9n/kifMkIP6D/wyohChxNi/Gkcwp1/PIQKKoU98fc51WUe+6ilthJVr3BDToPCHaR4CrzKM8JW7N8VR0V9PZ4eN6MF7yfAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wFS5IBHoz8ATcgOSQZ/9ipm5egzC8vxP96tUquYtkFE=;
 b=WixxTkqGo5/4kGy4kplLWh9r8sf0JYq7FAJNagnIaVCj1h8TFxpWCfv19J8A50lf4b8yj6hqfnhbI0t8YF7bpNwCpdjJ/Y9Flo56t0SFX406EyiepKobyJWKeLm+0SyfOe2CHcxxEAxam9TddlIds1NpAM999meSCuq5fw0O4VREeQ9fsugcrMsDl2A7/m4CC36jWvvaqU53WFRyZeOYzQ/QEeF2CGwwymgNOPEkCt3FIqXzlDVe3fVLy68qqu6JD0RAklx+65GSIi/NAqLIFGj/yvF0/p19gp7/y8E6q0HHuf+eyBT4IVJPrMsvufXXB9E5ocLGQ47jVI0Ns6Yg+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wFS5IBHoz8ATcgOSQZ/9ipm5egzC8vxP96tUquYtkFE=;
 b=iXiU1R5DENF5t5UHTntfWerIc9cvAB1J9qh7uxLaEGtT9joX9iDP/6DTjVZ66kaZu7I1KCw9YCqr0uWC4phE+f9Pz6yYEX2Xk8Bx8l46Kb8EeIYOhXA9tmwXxz7PqCRsVWNJAwi4+TdCo7oXyAXSb7WzLarg7uPjfYouyC7ZgaE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2917.namprd11.prod.outlook.com (2603:10b6:a03:89::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.25; Mon, 21 Dec
 2020 17:17:29 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498%4]) with mapi id 15.20.3654.033; Mon, 21 Dec 2020
 17:17:29 +0000
Subject: Re: [oe] [meta-python][PATCH 2/5] python3-pychromecast: Upgrade 7.5.1 -> 7.6.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201218214748.14563-1-leon.anavi@konsulko.com>
 <20201218214748.14563-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <35ece8b6-0d70-7534-b37b-5760543d7778@windriver.com>
Date: Mon, 21 Dec 2020 12:17:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20201218214748.14563-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR16CA0021.namprd16.prod.outlook.com
 (2603:10b6:208:134::34) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR16CA0021.namprd16.prod.outlook.com (2603:10b6:208:134::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.29 via Frontend Transport; Mon, 21 Dec 2020 17:17:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0c4b2103-2ad8-4469-bb9d-08d8a5d44ba0
X-MS-TrafficTypeDiagnostic: BYAPR11MB2917:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2917BCE8B6680E7B349654219FC00@BYAPR11MB2917.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:632;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	D9ATgrO8BRJjQbVYzP0lPaZASWuEgQl/TnpifknhX4hSwYODud7+njwlWSAafOiua0dJf1OqMk+oEJ5c0JE3pM5t0CmPUbv2qe7awWxZNyoiGyRr7+PEWsjz/GVN3fa3LFSzWhqAeHqqTqsDCL68EZ655yF9/oVmtdbec2I1BFj2dOIeIoT1Am0lsZMCezIM3nr7dbdgESSYFNg7vHhFMO9+6AmAa4O0EI5QNjetyXBDwiyqdNnFCr/Rp7Lh91O+c8OFX26ORAqoe/CVx46idTPqE8h3UO4iPkLvM7oFU7vTtYzjYeDz7sB+JuVsXGZg2sKux1eHX140FqOlRB+bnde/BbSJimoZPlejdvvhDXmWal3WBNYDIgs17rmsHeSUXEp7Vv8VFZoAyKleZvzF1l8chFZEgq3HL9nI3Z+qiGXB/ji28xwtI5KVUuvkznBQkjVHkjI60KZ37kSZY7MAMHbTtafUB0s0YVNNyF/y5FTzeLWx1HmN3bKKW75M9dQ0gsbZJcCom1RBM+2AmVKz+dlUHPyh28xhBYo1OmYR2xjXzdl2CJQzPRQXwoifNCvahlVdP1h5a4MU5Q63GdM6KA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(136003)(39850400004)(366004)(16576012)(478600001)(52116002)(31686004)(966005)(16526019)(316002)(36756003)(4001150100001)(2616005)(66476007)(66946007)(83380400001)(66556008)(8936002)(6486002)(44832011)(166002)(26005)(53546011)(8676002)(2906002)(86362001)(956004)(31696002)(33964004)(186003)(5660300002)(45980500001)(43740500002)(148694004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?L3JtZTNJN2Mwdk1EVTMzY09iTjRneHZsb3hKUjVibjAxTXN5bXJBQStMRFda?=
 =?utf-8?B?WlZZMnRCdnBZMlVqUjJ4WUtSd0FhWW9CV1orTU4xUmN0dHJCQjNVSFg1QXpL?=
 =?utf-8?B?V1BXaGVIV0F4K3dTQnd6bW1XeFVkUWRDT0lPdWdDUTVzRTA1cDRWWTVPdkxH?=
 =?utf-8?B?QUtGK2d3Ukw1dkYvdkdiclFjeVFReFZUQ0EvTkF1cTFwSnZBMUFwbG9mVE9h?=
 =?utf-8?B?U1ViMy83UjRjdEd3Z01Rdlh6Q2k5WEJ1KzJEWTk2VnZtaklXN0x1R25iV2to?=
 =?utf-8?B?azN2dlhqRCtmbHJxdXZmNjV0MnVOVitsRHIrMTFRMXR1ZG9nMjg4ZjAzU21t?=
 =?utf-8?B?QmdsdVJlb3dqVHUwTjUwYkYzNnR2eEJBbTVDL1dZVzB6eGZNMHVndGUyc0xF?=
 =?utf-8?B?WGN0ck11K1ZjSGEwMlFyUHhRUG43RzUwdDFKclFXNnZJRktvZjBnNmFRUEFN?=
 =?utf-8?B?U1ljQktXZktxOE01QVJDV1hiTHppRGVhY1JPdCtSWWhwc1hDdnkxZDNvU2RJ?=
 =?utf-8?B?cWdTTkVuY0QrM2hyU3R1Y3NZaXFpbTRsT1dkMWNBN2tEd29nVnh5M0tPMG4v?=
 =?utf-8?B?QXNacHczK0JicGRZamN5RUhtSnBQdWxMQTA0dVhiTVl4QlVxd1ZmWlhRTjlC?=
 =?utf-8?B?S2lmWjYyTWMrRE1BRTl0ZUZDVjJ0WGlGSlhnbE9Vd0NEekJYR1pOcnZHK0ZZ?=
 =?utf-8?B?Rzh1b0xUbU9DUGVWbVBRVWJSTVdyTXBId1dWaFdkS2xQZ2tFZ3BaNTVaUE5x?=
 =?utf-8?B?QlRGenZ4cU42c0I3cG9ESFJxd2IwZktFZ1VsMVNJWlJzT3BYdGptU0VDSFdN?=
 =?utf-8?B?VFZUQnhxTG1Ja3FYZW43dEVkb21ReCtnN2ZOUTNiY0RoTFlzYTJ2L3N5U0hG?=
 =?utf-8?B?bXFNUmRwd0pVSUdhd3ZTQ3RXSkNXVUdqbmkzL3FLdi80Uy9iMDZUUTRLM0lT?=
 =?utf-8?B?QytaY3phUmJuZ0M1VW5Rb0pSZHlrNzVXdTcxWmxZOEJmT0hqUlk2TGtTVmZh?=
 =?utf-8?B?UzZINEc1bG9raytxNDQ5YVhIMzBzSlE4YVdsamhBWms5UU9GL2F6cUplUWp1?=
 =?utf-8?B?c1pXRklMcjkwQndlOW40VGV6b0FNK0RYdDBWd2YyakZxa3dTemFqSzFuNXoz?=
 =?utf-8?B?bzcrQlRGb3N6ZmNPQmlqdnVoSU9kaEZUejU2cjdXRENuRm41THVJaDlPSlhN?=
 =?utf-8?B?LzJOQmFEcmFiWENGRTFrMXdoQlNTTFhMWWRQL09WY3k0V1hqcEdDRlBJcDVv?=
 =?utf-8?B?UW1EbUh5blZhaUhOUWVkRXNtRjY1ZElremwyU2lDdG9IVVA0Vkt6SGJQYklN?=
 =?utf-8?Q?cpdUdXRIHanizfXoxPfunTSMELVM15leBX?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2020 17:17:29.2210
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c4b2103-2ad8-4469-bb9d-08d8a5d44ba0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b4pGVrttRuStGvc+fCLLOeatKOroqGSinJA9cZTDcuM6ogmtPAoE5RMwlzkf+ofQQGp/GjwgGaTncTQ2tc+R3KcDDI4LyXBPW6Hk1zAemn0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2917
Content-Type: multipart/alternative;
 boundary="------------C4CC893B2EE5770D4C828771"
Content-Language: en-US

--------------C4CC893B2EE5770D4C828771
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2020-12-18 4:47 p.m., Leon Anavi wrote:
> - Spotify quick play (again)
> - Fix next/previous track
> - Add support for BubbleUPNP
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...on3-pychromecast_7.5.1.bb => python3-pychromecast_7.6.0.bb} | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pychromecast_7.5.1.bb => python3-pychromecast_7.6.0.bb} (66%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_7.5.1.bb b/meta-python/recipes-devtools/python/python3-pychromecast_7.6.0.bb
> similarity index 66%
> rename from meta-python/recipes-devtools/python/python3-pychromecast_7.5.1.bb
> rename to meta-python/recipes-devtools/python/python3-pychromecast_7.6.0.bb
> index b7796251ec..52803744f9 100644
> --- a/meta-python/recipes-devtools/python/python3-pychromecast_7.5.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-pychromecast_7.6.0.bb
> @@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/balloob/pychromecast"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
>   
> -SRC_URI[md5sum] = "9dee7207b7a5c73ebf8fad64be137f27"
> -SRC_URI[sha256sum] = "cf2e9fa795ea1e9d0d180adfbdccefd6b4f532eae56f41f15d1a75b323096f51"
> +SRC_URI[sha256sum] = "998851e615e41ff436780867de84adea0f1720b7a73822451bd9ff9a00c0e255"
>   
>   PYPI_PACKAGE = "PyChromecast"
>   
>
> 
>

--------------C4CC893B2EE5770D4C828771
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-12-18 4:47 p.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201218214748.14563-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Spotify quick play (again)
- Fix next/previous track
- Add support for BubbleUPNP

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201218214748.14563-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...on3-pychromecast_7.5.1.bb =&gt; python3-pychromecast_7.6.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pychromecast_7.5.1.bb =&gt; python3-pychromecast_7.6.0.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_7.5.1.bb b/meta-python/recipes-devtools/python/python3-pychromecast_7.6.0.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-pychromecast_7.5.1.bb
rename to meta-python/recipes-devtools/python/python3-pychromecast_7.6.0.bb
index b7796251ec..52803744f9 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_7.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_7.6.0.bb
@@ -3,8 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/balloob/pychromecast">&quot;https://github.com/balloob/pychromecast&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5">&quot;file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5&quot;</a>
 
-SRC_URI[md5sum] = &quot;9dee7207b7a5c73ebf8fad64be137f27&quot;
-SRC_URI[sha256sum] = &quot;cf2e9fa795ea1e9d0d180adfbdccefd6b4f532eae56f41f15d1a75b323096f51&quot;
+SRC_URI[sha256sum] = &quot;998851e615e41ff436780867de84adea0f1720b7a73822451bd9ff9a00c0e255&quot;
 
 PYPI_PACKAGE = &quot;PyChromecast&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------C4CC893B2EE5770D4C828771--

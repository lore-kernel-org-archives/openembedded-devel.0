Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.57])
 by mx.groups.io with SMTP id smtpd.web11.19055.1606484870803627432
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Nov 2020 05:47:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Y3XNswtK;
 spf=pass (domain: windriver.com, ip: 40.107.237.57, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a5Nize/3pxeSNqGqZSRpTGmJnY3k0IiTG8Eq2vAieOCYeNl3ARe7fNj9jZ4tCaDjKW1sIM4Z/zp2ZWhSee21J8BUMgwg8vJGMfsaBEEQSvWRooDenb2jS70qJm8dTcSBe5lVggKt1Z0zB5WbivFEWYM0F3NqBxMellOLT7/lrr+ebnORGG6Ss6t6lfD5bvatjAaeYupTMHO+kdwhn8GuyimWiSPMrTJkH/p21ZyIYtuXVWaDhwbiWPcWhf58T/5tg171Ec78wrzf8TjLYu4g1RO+6nK4cBqrV6KD7ZvTat06e5jEWsTGiOVW4Q9LvkEok0P0EI35hRR72XRQQLH4Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bctY4XDwV8GG/BYexerRV//B5F1nhaUQ639i/VsPAJs=;
 b=L8IDcbBYpOm7bxgcA9G+aQpB/StgF4jQCFtXLZvInD0zAq0HU86wxmz64u95W72Y20g+gnlAXDt4/WpfHPJySc2om9r17ttx33TdPSs1Bpmq0RyklNpIQqFCqbJQOSaPVijM/CcVGFgO4fPcknTcaFlGpwERhl4kUJoqSXI0AKh2d1Q/OKV0oe5dgEpEu4Kr+cFvrhUff0MpnbdvRQT/F/PgXaDysNmqfMvPI14gMIY2VCc2/UBrK6gBnvjCdVEHLobMU68XDvhGunpzgBCFyAtS+o21qQkgm0xNtzCFL6xzQV6FMUSTSpfGpaeGr/TyDlNXGAvCxuL4rGwJdtBVOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bctY4XDwV8GG/BYexerRV//B5F1nhaUQ639i/VsPAJs=;
 b=Y3XNswtKHQfegQV30CZrgFhErrQ974yJyO1ZmG2zTOdTKg7pht6uwFZ/fXP6+HYTieliPQn44E3dvlUY17KbQATOz4RLk/eJ4Xk6nJ1DC272kRmI8b+N24+9QwB8gE8ysbUp5+Qu9jK9kRYKjzvMVzaeDCwEDl6w8qO7UYsvuNY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2598.namprd11.prod.outlook.com (2603:10b6:a02:cb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22; Fri, 27 Nov
 2020 13:47:48 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498%4]) with mapi id 15.20.3589.030; Fri, 27 Nov 2020
 13:47:48 +0000
Subject: Re: [oe] [meta-python][PATCH 7/7] python3-transitions: Upgrade 0.8.4 -> 0.8.5
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201126112215.11451-1-leon.anavi@konsulko.com>
 <20201126112215.11451-7-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <d1971b39-3fb3-6965-5fcc-8d54a0e34d1b@windriver.com>
Date: Fri, 27 Nov 2020 08:47:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <20201126112215.11451-7-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YT1PR01CA0152.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::31) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0152.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend Transport; Fri, 27 Nov 2020 13:47:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 61fd3cd2-d686-49ac-712f-08d892db069e
X-MS-TrafficTypeDiagnostic: BYAPR11MB2598:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB259822E34F746E36B7A283209FF80@BYAPR11MB2598.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:883;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZqtOO9/T7IJoJAxPh1S0rJ2q0IZT0VpqktR703VrSHZsIQSEX1MR8zUynjoQBNoPMX9BlQwa21U/D5Jn53nLMVvPfSvN3QyYL2iguNltJWaqIBkcyNBxC+TnMKBtOqW131buiaHOYa9KHXedhYoW8ZdDdbnanwQTvsC7XQGJxrFiLQVlMtsBJ4z/pzIOJH/iBMF2jpC/OB+pNcfbPC2nwyA1qyH3QmVCKL9+LJohaGPJqRCJ+3dQ2CkTZk0l+FeaFpJwUS2uOEpO9SxbS2izbxtmgxOCzqAEuez3TsXp5ND3gUpFnd81uhbG1Vv4VDxf6UFOzqTe8CSrccAAytPHNyCxyPxMgrt9XmZ2rH8CF5u+ToRQYkQBgRoh/LF0oYYrfmWRCqZ5Nt6Ed6oDLEwVzn1hupyiKL+FVQZGLFI9rN+htdpFAkrTuo+0Z6O58yL/UOYoYBFt377CPDaw05b+aQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39840400004)(136003)(366004)(346002)(396003)(186003)(2906002)(26005)(16526019)(52116002)(6486002)(8936002)(83380400001)(53546011)(478600001)(66946007)(33964004)(86362001)(966005)(5660300002)(2616005)(956004)(166002)(8676002)(316002)(31696002)(16576012)(4001150100001)(36756003)(66556008)(66476007)(31686004)(44832011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?RC8rcEdpN3pRL0FJWEN6RncvQXduK1NoRDNrQjQzSE9iaDQvVnBjL2RtRWs5?=
 =?utf-8?B?eWhISEd1dHpWVmxOMVRFME1ocGRQclBLRXd3eGJvZS9KYzJlVTh5Nkk1Zndj?=
 =?utf-8?B?UG5iRVFTYjRlU2lYbG4vU1I2WkVLVGd0c0JLdFh0dldETGVLWjNlTDRBNndy?=
 =?utf-8?B?NVFIbllFbk55OWZrQ052bFdCYUhCYmNLZWV5aGU3bTV5bFhuMjJKZ2ZFeFNx?=
 =?utf-8?B?d0Zhc01lQ3Vja3lDR1pqaUs2TExhajFESzcweTkwZEVtQTEwSE1HaWg0N0NX?=
 =?utf-8?B?aTljYnZ3c0lIL1JpSkZKUjhXci9iWFN6bmQ5YWp1RkVpTUdoclJyQ01jT0My?=
 =?utf-8?B?aDFKYkZjTmJsdysyZ2dqc1lYcUtLOUhDZjRmcFoxS3M1clhOTFcva1VSOWc0?=
 =?utf-8?B?bnlwK3hmWVB2bWc5ajZxOTBmaWhPdHVPVEFwU2hMS3djdVdWVzUwaXpGUWl3?=
 =?utf-8?B?cmFqbmcwWVoyV1Z4cXZPU0pZNmlac1hpa25iTHA2ZlBZMUVUNWUvYTNMM2Nz?=
 =?utf-8?B?MGxMMTZVakxra0lmYmNhUHBDRmJaM1NmSm90aDdSY3Nla1pLOWJKM2NVSEND?=
 =?utf-8?B?dzAwcDVONGtiQjZRU2NRSU9BeW1LT1dzOCtrM3k2QXFubFM4aDRJcVUwZGdq?=
 =?utf-8?B?QXFqTm1qQ2xwYk9HZHZoSmdmZGh5empaNkRoRVQ3YmoveGoyNUtXM2ZmcVZy?=
 =?utf-8?B?c0Eyckt6b0dnY29KUWp4ZzdLdjRXd3VLUkdmU1pIZ0dUS24rYTZjL2xBeElv?=
 =?utf-8?B?RFFQNnNPZlZCV05vL1VkaFMyd0dyRGtJSEt4T3dQVHZIOGNoZEhaeEdZT2I1?=
 =?utf-8?B?dm5MT2JsMEU2a2lXQ21GYTBqTE81Z0ZFN3VTcENNYk5ZN2lCaXY4TjNkblZj?=
 =?utf-8?B?TUJxVUFncXlUdm02bytSYmx3U3lEV0sxdkptL0VHZ0NEWDhLbnh0Q2pPYTly?=
 =?utf-8?B?bjBCYlA1OU5SL0NFTVdFbkx3ZnJNYjhJVG00K09VTUxkVHRhNjc0NHNYQjFW?=
 =?utf-8?B?bjlmUWtjR3R1YXhoajRnRW8xcDBKSjBTMGJ1YUN1Vk1oSVg4SjZmTFhVUUtP?=
 =?utf-8?B?OHJUSHBLbTZXV1pKTFEvTmpYRSt2Y1cxeGkzckYyWjFPbHl4SmJaS05xODB1?=
 =?utf-8?B?N0h3UVJNSXBVN1hjQlFiMDh3YytqVlBieDgxWVNlWXhndC9qSGhNYUdYS2Y1?=
 =?utf-8?B?YmUwbU1pNExDOFF3ckk3QnVrUUUrVFErcWpWamtOekdEUmxMQzdLQ0Z4bHBo?=
 =?utf-8?B?WFRFOU9pdlNiajZtTCtQMmt5eWNFakRId05tNGFtRWt3UHVqa1hyR2lpcXNm?=
 =?utf-8?Q?56XA7ApQAFRaaaHHu633QYOSBfbNt0LtUD?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61fd3cd2-d686-49ac-712f-08d892db069e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2020 13:47:48.3732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4DjPfWgIJYcTuUeMeRwLczjiATX4DDDNHFNVuG1tiuzjLZ5BzkJvLxzl7YA0J2ws7IZ5OJf/DzBmshFk6FDssClD018z7ML8YT1of+Jmw6o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2598
Content-Type: multipart/alternative;
 boundary="------------0199DA75354433BEA20DA3EB"
Content-Language: en-US

--------------0199DA75354433BEA20DA3EB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2020-11-26 6:22 a.m., Leon Anavi wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 0.8.5:
>
> - AsyncMachine.switch_model_context is expected to be async now
>    for easier integration of async code during model switch.
> - Bugfix: Initializing a machine with GraphSupport threw an
>    exception when initial was set to a nested or parallel state
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-transitions_0.8.4.bb               | 11 -----------
>   .../python/python3-transitions_0.8.5.bb               |  9 +++++++++
>   2 files changed, 9 insertions(+), 11 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python3-transitions_0.8.4.bb
>   create mode 100644 meta-python/recipes-devtools/python/python3-transitions_0.8.5.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-transitions_0.8.4.bb b/meta-python/recipes-devtools/python/python3-transitions_0.8.4.bb
> deleted file mode 100644
> index 3da97ef95e..0000000000
> --- a/meta-python/recipes-devtools/python/python3-transitions_0.8.4.bb
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -inherit pypi setuptools3
> -
> -SUMMARY = "A lightweight, object-oriented Python state machine implementation with many extensions."
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=de0a0876a688a4483bfafa764773ab39"
> -
> -SRC_URI = "https://files.pythonhosted.org/packages/32/32/305845f95f98b505e641aa3fc135b0a9747befcff06223a541d2aa388d47/transitions-${PV}.tar.gz"
> -SRC_URI[md5sum] = "ef07ea90015a296653a4b095837b0354"
> -SRC_URI[sha256sum] = "9a2841b24789dfd345267cb92e26b79da75fd03f6021d1a5222c71b5c9ae3c16"
> -
> -RDEPENDS_${PN} += "python3-six"
> diff --git a/meta-python/recipes-devtools/python/python3-transitions_0.8.5.bb b/meta-python/recipes-devtools/python/python3-transitions_0.8.5.bb
> new file mode 100644
> index 0000000000..7f88bc1d22
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-transitions_0.8.5.bb
> @@ -0,0 +1,9 @@
> +SUMMARY = "A lightweight, object-oriented Python state machine implementation with many extensions."
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=de0a0876a688a4483bfafa764773ab39"
> +
> +inherit pypi setuptools3
> +
> +SRC_URI[sha256sum] = "e441c66a0c753d56c01c3e5e547f21dbe4a5569c939f12477475c5e81d79769b"
> +
> +RDEPENDS_${PN} += "python3-six"
> --
> 2.17.1
>
>
> 
>

--------------0199DA75354433BEA20DA3EB
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-11-26 6:22 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201126112215.11451-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

Upgrade to release 0.8.5:

- AsyncMachine.switch_model_context is expected to be async now
  for easier integration of async code during model switch.
- Bugfix: Initializing a machine with GraphSupport threw an
  exception when initial was set to a nested or parallel state

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20201126112215.11451-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-transitions_0.8.4.bb               | 11 -----------
 .../python/python3-transitions_0.8.5.bb               |  9 +++++++++
 2 files changed, 9 insertions(+), 11 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-transitions_0.8.4.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-transitions_0.8.5.bb

diff --git a/meta-python/recipes-devtools/python/python3-transitions_0.8.4.bb b/meta-python/recipes-devtools/python/python3-transitions_0.8.4.bb
deleted file mode 100644
index 3da97ef95e..0000000000
--- a/meta-python/recipes-devtools/python/python3-transitions_0.8.4.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-inherit pypi setuptools3
-
-SUMMARY = &quot;A lightweight, object-oriented Python state machine implementation with many extensions.&quot;
-LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=de0a0876a688a4483bfafa764773ab39">&quot;file://LICENSE;md5=de0a0876a688a4483bfafa764773ab39&quot;</a>
-
-SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://files.pythonhosted.org/packages/32/32/305845f95f98b505e641aa3fc135b0a9747befcff06223a541d2aa388d47/transitions-${PV}.tar.gz">&quot;https://files.pythonhosted.org/packages/32/32/305845f95f98b505e641aa3fc135b0a9747befcff06223a541d2aa388d47/transitions-${PV}.tar.gz&quot;</a>
-SRC_URI[md5sum] = &quot;ef07ea90015a296653a4b095837b0354&quot;
-SRC_URI[sha256sum] = &quot;9a2841b24789dfd345267cb92e26b79da75fd03f6021d1a5222c71b5c9ae3c16&quot;
-
-RDEPENDS_${PN} += &quot;python3-six&quot;
diff --git a/meta-python/recipes-devtools/python/python3-transitions_0.8.5.bb b/meta-python/recipes-devtools/python/python3-transitions_0.8.5.bb
new file mode 100644
index 0000000000..7f88bc1d22
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-transitions_0.8.5.bb
@@ -0,0 +1,9 @@
+SUMMARY = &quot;A lightweight, object-oriented Python state machine implementation with many extensions.&quot;
+LICENSE = &quot;MIT&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=de0a0876a688a4483bfafa764773ab39">&quot;file://LICENSE;md5=de0a0876a688a4483bfafa764773ab39&quot;</a>
+
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] = &quot;e441c66a0c753d56c01c3e5e547f21dbe4a5569c939f12477475c5e81d79769b&quot;
+
+RDEPENDS_${PN} += &quot;python3-six&quot;
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

--------------0199DA75354433BEA20DA3EB--

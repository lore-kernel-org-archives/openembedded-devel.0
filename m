Received: from NAM04-CO1-obe.outbound.protection.outlook.com (NAM04-CO1-obe.outbound.protection.outlook.com [40.107.69.48])
 by mx.groups.io with SMTP id smtpd.web10.5270.1606918315303625721
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Dec 2020 06:11:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=nAy86VT2;
 spf=pass (domain: windriver.com, ip: 40.107.69.48, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V/CW2i0gVo1BJz2TmFN1iOytqSwbvvLP+RA14mTZaxt0uhie8XtldMakZP1pJSZHvgQKCs5Ar82InJP3Avoag+n+JDsC8z/bHLd5ViL8Zo/QeqRCb7m8tyCmhyatU8GEzvjKbHaLqYUhQMtmNj9jFtJQ3HpGSujTm5uJj+bu7+v/Cs/5+a/90+LP5/wYxAzUKAfZlRZOUJt3R1tFDdupvY4KAUkpm0PPEhhF3Y8dhuPbctFP19OomX8f52m7yK4ocfIdu/DlLQq3wSeJ7/5e6ztXVn7Sgs0gPxU3SWGgWXZbWlrPoGcb7AXRYyKem03EjHDhAXzOB308Aclo2xYvUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Z8OCd/gkM/52lxa5pV0TSiSPj06LZfjaFW9+M7ACJg=;
 b=Qh6A9ra/S/gd6PouEebINetrBuhRrOW8GA4XyLNBwqnF+iOlaVjJMgk7JitcXk0Xleb+h34AVd20/DxicHXHnLmHIky1BZIrIuquVnR/mNSNkzZQopXuAkwF85AVekba+Zl4QKzPmD3XvU2rxtc62ttMeG/QPSYyYPLm4SeoYeHs4OWpsiX+92xLYiVV1y315u1OnwPpNqL3YoLScu61S1/zbiA29wQZaA/PEuR56EPiZxZO73ThqO28pFRc196SxElH+Mwe9wWvKXFMkCKELitqek0vQKcHG9s4Rq3TpbpC97CL0W25HEGbLReMJQ9b6ZFTEqBfQ0d1LS/YFYE+RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Z8OCd/gkM/52lxa5pV0TSiSPj06LZfjaFW9+M7ACJg=;
 b=nAy86VT2YFzUTKIr0EMGV3DKwSD7N1pp6cADehFjfrpvP4SkUIkoAxgOEcSq8BB0BafDfMe00foXinXIaO4i3vYHaQaT2evjPNLjJ60+m4Gbk6bM3tjoJbLAHaUsv0i0Y1QjLQ4gX7VfLOnchFoyOE2eAITxMhHPL+kYqTXDM0k=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4864.namprd11.prod.outlook.com (2603:10b6:a03:2d4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.24; Wed, 2 Dec
 2020 14:11:52 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498%4]) with mapi id 15.20.3632.017; Wed, 2 Dec 2020
 14:11:51 +0000
Subject: Re: [oe] [meta-python][PATCH 15/16] python3-hypothesis: drop (moved to oe-core)
To: Tim Orling <ticotimo@gmail.com>, openembedded-devel@lists.openembedded.org
References: <cover.1606592636.git.ticotimo@gmail.com>
 <fa4d69a0a33940e6bf7b514f01a9f17e137f8cc5.1606592636.git.ticotimo@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <395d22d0-9264-cb5e-d0e1-8ff76ec0a51e@windriver.com>
Date: Wed, 2 Dec 2020 09:11:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <fa4d69a0a33940e6bf7b514f01a9f17e137f8cc5.1606592636.git.ticotimo@gmail.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YTXPR0101CA0048.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::25) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTXPR0101CA0048.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Wed, 2 Dec 2020 14:11:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a474ed90-1c85-404e-1682-08d896cc365b
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4864:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB486453A6C9B9285E2763C5819FF30@SJ0PR11MB4864.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:741;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OhyOkEmf6qjdT20uHl/T8PM84R4lVhpZFzeZNQhHwuUqgDFSNi8ekq2kjUzkKhmVn6kUrsx0sBWmdtNO+aqQ/JtiBxbeOo+3AfRh5LSMjp6lLqiuWgwr4Nvj/eqDOyeshk3+30xXYt+hqFb/GBjCA8AHT+ffKkWqAiXoftXocfEqvWaPLl/RF5iEMJQ9EMdWLli7L17PMEFA1hPfuhJcAPmRn+Pj+QlQFDsGPEt6RF8Xq9s0UKjw2nyHyJuLLg3Vpb8Ah63PKwadwMG75RplJgUejaW2ah2fj6jTfePM4/lK2GHPAxyxBstwV6eS3+iYmB/OpWfGciX6H/nwmXWWfKTEXn6PN35xkeiuDcryqEd1UzPJimUa6ycC2HzFo/dDuFi6KDOljdsZuNQtzHZv74WScKCKotaQVQIWD3PBKIWb+bjZwd/SGWXSKwwYoWyxmEnDw4djbzNATWV0Kq+sXM7AxTXY55gOLnx5Jk6eHjc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(396003)(346002)(376002)(136003)(956004)(8676002)(53546011)(4001150100001)(33964004)(52116002)(44832011)(6486002)(16576012)(316002)(86362001)(166002)(36756003)(26005)(83380400001)(2616005)(2906002)(66476007)(5660300002)(6666004)(186003)(8936002)(966005)(478600001)(66946007)(31686004)(31696002)(66556008)(16526019)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?TUdhSkU4YWNnd0Z0NEtFbWFyaGhweW5mUnRLdTBkeHVpVHVNRDJnRDBnR2d5?=
 =?utf-8?B?QnYyRzZFKzQxZkhtcmgwS2M1NmFKMk9UQ2pPRjJMOERUQnpHV0lrcG91bHkz?=
 =?utf-8?B?ZlBjNVFmSlZUbTZyMytTaFYyczRSUXh3ME5HS00rSEhKUlB5WHhDbURZZFNp?=
 =?utf-8?B?TXZCSEdaaXRHWVpnM1E0WnhWZ3RpY0JRMkNRNGV6M2IyeFN4NjRMU0lQN3VY?=
 =?utf-8?B?c24zZDdSZXNEcG50UUpkdEZsWGRwTXBUTmdHaytYOWxvVlRjL2pPUUJPdjhq?=
 =?utf-8?B?Ymd2YWVYN2g2aDNtVFN3NmdjWjBFNXduMk5XT1ZpME5nTHdIdVhXWG5DM3VU?=
 =?utf-8?B?R3FHZFI2UmNQMXRCUXFadDNqaW4rbStJVnpFRmphZWdhTG1HeUV2Z1dvMUds?=
 =?utf-8?B?OGJxc2NRc1djR1Z2c0FJTVd0V0RRTlFrL0h6WHBsVkJQdnpLNVJRM0RlemMy?=
 =?utf-8?B?L25YaFdQTTBQUUUxVVlaZXBIdlh6YmhsZVVPa3g5S3ZsWmpsVWxlWkZaaGN6?=
 =?utf-8?B?bmIrSmVMK1lYN2pqbHZ0VW9IZUpmV3kyOW5TS3ZTMDVIS1QyS2ZQQnpSaXVK?=
 =?utf-8?B?eGRlSUVScmM1SjRGR25mM21LYkYrU0h3OE5KY3gxRHRsL0FTaGhPZzV3R1g3?=
 =?utf-8?B?K3U4WHFYNE1jbE5iYmxPQTZpS09lZVlwZmFEMkxYUUdzdlM4cllhTjN6bE8v?=
 =?utf-8?B?S3R6cnhIZHMyZkhaOG9wTUN1ZGtJaVBTUWw0dXhCd0N1UDlPMFdtaVFWWmJr?=
 =?utf-8?B?ai9PY3pHeXluR1ZWN1hvNVJZa0hkdUp2Wll1MzlydVZQdk10aWRuZ3pOb0xC?=
 =?utf-8?B?Q1A2MHJTWG5aSExoM3JTUUROQmdGOFZxY2c4SXo5Q2RqZThIQWtFbWx6RDQ2?=
 =?utf-8?B?c0dUWlFiQ3VVOTZMSGMvT2J3cDliVVVSRG44Q3lGd3h6cjQxWFkwdE9KWnVX?=
 =?utf-8?B?UE1JN1lSRGlINWI3dVZqTDgyWlNIZlpHdnZ2aVFWU0pxblN5QVkzWEYxQzg3?=
 =?utf-8?B?OUJZZCtHM0tSa2tvYWtQRm5wYTlUTGRBcDZucC94akczcnNQTDRKd2hzTlk1?=
 =?utf-8?B?QkJMOFFjYW5aMFlnTkxCR2ViZmRtNU9aQkw0MXdFQmFOT0lzUmdvN1ZRM293?=
 =?utf-8?B?ZHF1aW9ncjNyQnNlWVFjU3RJTkYvYU55VTdDQUg1azc0N2JRVTRaaEFZcXky?=
 =?utf-8?B?MkcyM3pVQUVZQ1ZTVEZRZmNiMURDallXV3BoS0J0SmRvS2ZnQ0hBelYzUG1K?=
 =?utf-8?B?RldMRHRKZ0cvN2gvQ1Mwa2p6R015NEtKVzNTK3E0ZXAzTklWZWorT1RPb21I?=
 =?utf-8?Q?xKMFoexCq4au4N4XleXnfuYwSD1UithbSU?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a474ed90-1c85-404e-1682-08d896cc365b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2020 14:11:51.0584
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aGCk2TiPnjbmRMYkuth8pJ8SIqwB0Atld0NqLuIdv0DMHrChuwgX4tDThtLLP+80hACLx37ounRZK30neOVov8WhDhJ2PmoYfNh8DF00j4I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4864
Content-Type: multipart/alternative;
 boundary="------------C581C77C6EF4FECC82A32323"
Content-Language: en-US

--------------C581C77C6EF4FECC82A32323
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2020-11-28 2:46 p.m., Tim Orling wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> From: Tim Orling <ticotimo@gmail.com>
>
> Signed-off-by: Tim Orling <ticotimo@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-hypothesis_5.41.3.bb            | 14 --------------
>   1 file changed, 14 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python3-hypothesis_5.41.3.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-hypothesis_5.41.3.bb b/meta-python/recipes-devtools/python/python3-hypothesis_5.41.3.bb
> deleted file mode 100644
> index b7bf15c31e..0000000000
> --- a/meta-python/recipes-devtools/python/python3-hypothesis_5.41.3.bb
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -SUMMARY = "A library for property-based testing"
> -HOMEPAGE = "https://github.com/HypothesisWorks/hypothesis/tree/master/hypothesis-python"
> -LICENSE = "MPL-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4ee62c16ebd0f4f99d906f36b7de8c3c"
> -
> -PYPI_PACKAGE = "hypothesis"
> -
> -inherit pypi setuptools3
> -
> -SRC_URI[sha256sum] = "6a3471ff74864ab04a0650c75500ef15f2f4a901d49ccbb7cbec668365736688"
> -
> -RDEPENDS_${PN} += "python3-core"
> -
> -BBCLASSEXTEND = "native nativesdk"
> --
> 2.25.0
>
>
> 
>

--------------C581C77C6EF4FECC82A32323
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-11-28 2:46 p.m., Tim Orling
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:fa4d69a0a33940e6bf7b514f01a9f17e137f8cc5.1606592636.git.ticotimo@gmail.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

From: Tim Orling <a class="moz-txt-link-rfc2396E" href="mailto:ticotimo@gmail.com">&lt;ticotimo@gmail.com&gt;</a>

Signed-off-by: Tim Orling <a class="moz-txt-link-rfc2396E" href="mailto:ticotimo@gmail.com">&lt;ticotimo@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:fa4d69a0a33940e6bf7b514f01a9f17e137f8cc5.1606592636.git.ticotimo@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-hypothesis_5.41.3.bb            | 14 --------------
 1 file changed, 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-hypothesis_5.41.3.bb

diff --git a/meta-python/recipes-devtools/python/python3-hypothesis_5.41.3.bb b/meta-python/recipes-devtools/python/python3-hypothesis_5.41.3.bb
deleted file mode 100644
index b7bf15c31e..0000000000
--- a/meta-python/recipes-devtools/python/python3-hypothesis_5.41.3.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = &quot;A library for property-based testing&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/HypothesisWorks/hypothesis/tree/master/hypothesis-python">&quot;https://github.com/HypothesisWorks/hypothesis/tree/master/hypothesis-python&quot;</a>
-LICENSE = &quot;MPL-2.0&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=4ee62c16ebd0f4f99d906f36b7de8c3c">&quot;file://LICENSE.txt;md5=4ee62c16ebd0f4f99d906f36b7de8c3c&quot;</a>
-
-PYPI_PACKAGE = &quot;hypothesis&quot;
-
-inherit pypi setuptools3
-
-SRC_URI[sha256sum] = &quot;6a3471ff74864ab04a0650c75500ef15f2f4a901d49ccbb7cbec668365736688&quot;
-
-RDEPENDS_${PN} += &quot;python3-core&quot;
-
-BBCLASSEXTEND = &quot;native nativesdk&quot;
--
2.25.0

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------C581C77C6EF4FECC82A32323--

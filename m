Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.50])
 by mx.groups.io with SMTP id smtpd.web08.35733.1611578490485778268
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jan 2021 04:41:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=JmZ4iih6;
 spf=pass (domain: windriver.com, ip: 40.107.92.50, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WOVdUzZAJioozLvukZfGF4Jj+2pPBUBebjRWyMxWQBSA478zqjhJWMcI+Rk5hOOZmnI9ASE/9sclfH3b0EyKjUCagI+uyhLMqdWD9RQxepgNYybz+qI0s/v9mJRF7pU5GKQaHGC4NFMFasRCTOm/N14THDvyNRoaIx4sGZaFva7igsX+IMHaTLWsuWTdDUSz+95Ldt0Cap9B6XPcnQTdhGmfmcUBOIMbuHwEhYoIok3QGY9Q5ni7tv9TyBEm86xfQHQ3ubjjAh0H+WPTcdJs3YG84ZQ2cTm8A20tNftljGFV5GwzQQvPrmSWRHS6uIsavcSH467mVSUBFdNMBhmjSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AA+nTIbXw1+12zXOdpQT2L7pNtMqGUMrS7jVcpy0ibQ=;
 b=G+07VBS/AP2vOSAnJAn2PmxQE1E/GLW2g/tV6yLLSHvSd5HZnz3yvu4lpeZH2u79IjCwR+W5oLBGmcXAALoq7qNIC1nBHPJHJCCkewg2oM5DcCqSXrTbHTLrwDGQ6Zu5kAjPNlRXfU4zePvEj8PNfa7XXEHEQkM3WCu3ehTSLLCP+2e0hW4gSE4NgZ8R9tFXlbj91A2XywHZu8eHPfUkf1uBnyHWQu3KhIhN/lPyuE/PNsZGLYEO3yZ+s1rfIFd1qw7vxBLntlS4o3V5GfgciXp6wMU27Es1k80tKSywygks2CMnNoJYEriThp2vmvWpy62p1y4ykx5kA72kSX+Aug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AA+nTIbXw1+12zXOdpQT2L7pNtMqGUMrS7jVcpy0ibQ=;
 b=JmZ4iih6e6RXrlRo2NSM3aENlRG5hMd5w76Gwq5rI3awaWJnktWVSY7rm8fF0eOSiWNwasV5WshCfBPTEhm4WqF9ZzbEnKSKLSJ0/FncKvzi6juWmxrcTjS1ZeyrBe17nj+jx+EuYZYBHvvr/0MpmP7X+k8agxTZJm9aO1fI4k8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from MN2PR11MB3919.namprd11.prod.outlook.com (2603:10b6:208:13b::27)
 by MN2PR11MB3678.namprd11.prod.outlook.com (2603:10b6:208:f8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.16; Mon, 25 Jan
 2021 12:41:29 +0000
Received: from MN2PR11MB3919.namprd11.prod.outlook.com
 ([fe80::5462:9c04:72b3:6c44]) by MN2PR11MB3919.namprd11.prod.outlook.com
 ([fe80::5462:9c04:72b3:6c44%7]) with mapi id 15.20.3763.019; Mon, 25 Jan 2021
 12:41:29 +0000
Subject: Re: [oe] [meta-python][PATCH 5/5] python3-croniter: Upgrade 1.0.1 -> 1.0.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210121131709.27097-1-leon.anavi@konsulko.com>
 <20210121131709.27097-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <0d5d7f40-f286-d277-9f1f-5301a50d0d1c@windriver.com>
Date: Mon, 25 Jan 2021 07:41:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210121131709.27097-5-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR14CA0030.namprd14.prod.outlook.com
 (2603:10b6:208:23e::35) To MN2PR11MB3919.namprd11.prod.outlook.com
 (2603:10b6:208:13b::27)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR14CA0030.namprd14.prod.outlook.com (2603:10b6:208:23e::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12 via Frontend Transport; Mon, 25 Jan 2021 12:41:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 906b7b12-f1be-4cec-97ee-08d8c12e8944
X-MS-TrafficTypeDiagnostic: MN2PR11MB3678:
X-Microsoft-Antispam-PRVS: 
	<MN2PR11MB367834C51A65FDCF302A59CE9FBD9@MN2PR11MB3678.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:369;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	du/SALQnybvJ0hQFJIg18gGfcxJFUWnwAKDLeb5ytzGurn7YfCeo4s7ARjQmezq4fbaEgv9lov1I3IlNnz4D8pwIiDdJ+OO65EjyvRIymqTW28ryTRqPF/kk+ESASGwK3JxDgx8kS/w4JevZVnW3r5phrPHSn9kOZNDUbPplSvkNFgwgOJI7InBSEy4iGMv19mpZBaMxCmrCSGtPWNxAh/EPlprSAgXWfeZRYUBtbRLYzHZRM4lEXGD3uNP9Zu7sIs9nOZttdUPQhz+WfCdLmJ07SgmzqUFY8+Hg9PgiNg4kEDhJ3HO61E2zkWzQ4sSc5GDM2llyF0bQzZ8Lj5hCWAOweyVLwdPE8Qs/tQdaFLznPIiZOSOyhR++wp0FHLE+8bFk/Y3bqnQDTppUk0ILkCPiIGRmBzsIZr9Ks6WtXT8nFreyHA26QyTJg7+jPu8bVHyvgWWyOT04SqaFeUQE/pzM+TIbWnSQmKRWRJbuPPTFTZ+jYCQTe1pS4h2yqDpnEztLXMB4FKmR3RXyDhaw0qobD7wkJKAMYKrq8Ud2NWw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB3919.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(366004)(39840400004)(346002)(33964004)(2906002)(966005)(478600001)(186003)(316002)(956004)(5660300002)(52116002)(166002)(66556008)(53546011)(66476007)(16526019)(8936002)(36756003)(6486002)(66946007)(26005)(31696002)(44832011)(31686004)(8676002)(86362001)(83380400001)(16576012)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?RFgvaVIycmtCak1ONnRhQWhkczd2cGJuV0Q1STFObHlFTHhuRW1vTEU2MEpl?=
 =?utf-8?B?MXJ4OTlNS0xEUWsxdVNwT2lxZDMyK1d4NkZ2R0luRGRHTHNhRTdFckJRN0hM?=
 =?utf-8?B?bXNhUVdLN2szOXJiQVZRVERybUFodTAzbUdlR01hVVdmUThaVytqTEZGZnFD?=
 =?utf-8?B?dEpaVlFKbXB6czg5a3FIMGo3RUttNHlySWtscTlVTDJiUko5dUN4NmEyWFl2?=
 =?utf-8?B?SkZQbXFtc25DVERkOUNmaDJtK1dNeTVhT2hhMHZKakswd3NhTHJzS0ZqWWFo?=
 =?utf-8?B?bm1JM282eW5mSENTL2ZRaExXU3JtckFtZEdhaFNZTmlEbXpEOEF2bm5IL3hL?=
 =?utf-8?B?dHd2c0VUK01UQUkvYXluVXNGbTg4V3NYVkRyR2hFTmp2QUhBZU0zK1RTKzIx?=
 =?utf-8?B?dmtXTmRUQjJKVGZOakxydHdvQnhxd2tpNVdVaG1uT2lvU0FscWJ5ZWtNSUpT?=
 =?utf-8?B?Qmg0ci9XUTN4R1pLS0h2amdEa0RUSE1SMTMvUGtEeTMyNGRZY3pZcWRmVjky?=
 =?utf-8?B?cWczU29WV21NR1F4K1hRTzByZ2RWYS9HNHV3ZGlGZ2wrSC83ak5wVTM1Qm9x?=
 =?utf-8?B?SE9BcWhqS2dFNlVBb3Q2UXZlYmZCeTU0eURhaFM2dmpPSlJtZHRNVE9RSFVr?=
 =?utf-8?B?c3RiSE9JTVFTcCt5NCt4NmQ2K0pMMStsZk10U3pBTzJHRGZRWHBHU2ZxUzNy?=
 =?utf-8?B?aTZyREJlckllY3NuRTNNd0RUVU5nM3htd2Y4OUxjVS9RYVlKVnRRN1Zoc2s0?=
 =?utf-8?B?NHY2ZlpKTWxwOE9PNEgvMldnVDEvdTFrZit1bFlpZHdrekE0UkNXQ0JVTXpj?=
 =?utf-8?B?WFBqd21MNHRiVXNZY2hBR1pJNGVneE5vNUFxckJuMG91bU5XUXN2Mk5BN2lX?=
 =?utf-8?B?NG5TaUduN05URlZxckpZYmpnNHozeDBDTURxN0M2aGR6NnpDd0ROeWZ3cjZ5?=
 =?utf-8?B?YTZQck1nWWIwQ1hENWtBTUJCMVhaSWYzWUFWYU5HTk9TRVdWejAxZWxqaFJ4?=
 =?utf-8?B?RXNwdXBKOHczN0NTWFFvQnhIaVJ2T2JsWGJhU3JMZkRQZ2FRRkJWZVVYNEs3?=
 =?utf-8?B?YWQxenY3b1VUWTdDMlFjekJxYVR3MGhpL05ZOG10dkUrWDBGbkUzc1dzK3FF?=
 =?utf-8?B?RW5SQkdWTGVRS0JuZFJTNS9yZkgyZDhVeEIwMlQrellNdXJtaW1QYWJGYnF2?=
 =?utf-8?B?SXFHVVc0RFAwMHM5MkUrZWtVUy85R3JJTEUxR3VQUWhNSXVBcDFYUUlUM0ta?=
 =?utf-8?B?M2tKcmowb1VlNmllcG1zTkFGMzdKdzBEaDZJZldzdm9ZT2h6Sm1sREVDUHlM?=
 =?utf-8?Q?SjU/aiSuV/8uVKmNq6eiPVZ4hoppVlxgcU?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 906b7b12-f1be-4cec-97ee-08d8c12e8944
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB3919.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 12:41:28.9924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tu8BNc6BbNeDiUgSlRCDO3ILGepA7i8Z7JHsYsp1j7Pf7RG6c7dM2uasw0h8XRdBcxV+lEO6nMTFZpGAVQW0aGAfcsqmSFgg8O0XW8InkFU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3678
Content-Type: multipart/alternative;
 boundary="------------C11F8A1287FD4A39DA977851"
Content-Language: en-US

--------------C11F8A1287FD4A39DA977851
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-21 8:17 a.m., Leon Anavi wrote:
> - Fix match when datetime has microseconds
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-croniter_1.0.1.bb => python3-croniter_1.0.2.bb}    | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-croniter_1.0.1.bb => python3-croniter_1.0.2.bb} (78%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-croniter_1.0.1.bb b/meta-python/recipes-devtools/python/python3-croniter_1.0.2.bb
> similarity index 78%
> rename from meta-python/recipes-devtools/python/python3-croniter_1.0.1.bb
> rename to meta-python/recipes-devtools/python/python3-croniter_1.0.2.bb
> index 0ffae0c0d..bfe1f1d4c 100644
> --- a/meta-python/recipes-devtools/python/python3-croniter_1.0.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-croniter_1.0.2.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2"
>   
>   PYPI_PACKAGE = "croniter"
>   
> -SRC_URI[sha256sum] = "9d9942beaae10c0f9f5de4dcbfab4d85b10638cf407195b82d990bc086d6de0d"
> +SRC_URI[sha256sum] = "12f9fd52e7cfb623d0788956d137a3de26e5583a25820fa7710fb6b58d32b213"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------C11F8A1287FD4A39DA977851
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-21 8:17 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210121131709.27097-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Fix match when datetime has microseconds

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210121131709.27097-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-croniter_1.0.1.bb =&gt; python3-croniter_1.0.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-croniter_1.0.1.bb =&gt; python3-croniter_1.0.2.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-croniter_1.0.1.bb b/meta-python/recipes-devtools/python/python3-croniter_1.0.2.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-croniter_1.0.1.bb
rename to meta-python/recipes-devtools/python/python3-croniter_1.0.2.bb
index 0ffae0c0d..bfe1f1d4c 100644
--- a/meta-python/recipes-devtools/python/python3-croniter_1.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-croniter_1.0.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2">&quot;file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2&quot;</a>
 
 PYPI_PACKAGE = &quot;croniter&quot;
 
-SRC_URI[sha256sum] = &quot;9d9942beaae10c0f9f5de4dcbfab4d85b10638cf407195b82d990bc086d6de0d&quot;
+SRC_URI[sha256sum] = &quot;12f9fd52e7cfb623d0788956d137a3de26e5583a25820fa7710fb6b58d32b213&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------C11F8A1287FD4A39DA977851--

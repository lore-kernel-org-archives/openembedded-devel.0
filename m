Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.62])
 by mx.groups.io with SMTP id smtpd.web09.280.1610649839658327887
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Jan 2021 10:44:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=dpEErukT;
 spf=pass (domain: windriver.com, ip: 40.107.92.62, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WfguDX+kf1GM6VzqpBBbIZJBdFR+vfKcLF161Ag/+x3bjrcLwnlBW2Hm1jMUPsAKGH20tFZg7kGVC3w75Ze65e/LO2NNYTePaHi5ngt7DpabbL1Qtn2HEVS4rBZmtwSMiGY/re1I6cIENbdSUnn23lgq7smQxRMPsxR3YFqcmk3qBjhb56WeSGG/GxvIb6AyPST1wi9j8KG3qm/zi0xyaCiuhgteRGmACw5X/N7NVJru6mG+NIdxlWj2B27Q1MTMGzCkZzJF0TlVkjvfBOn2m95sI+aACkYF+afL76b4Kk4LBIUNAhQHmt9D2hVKPMcNdM04KJSkflUnqReH+Udx1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LsnqB5JJlCxKWbtAIgp++/CO1mvj+k/Ox1BgQhsrUro=;
 b=AsK2dv4PVgzQlTkImvDvxyRbcTmDk9kmFxJCXqosFAwtTS74WuPb7VoLXL+W9IB/diYoigSLBM1UwFe/lr+XYWnY+u5ZiJ22nU2fX6TduWahEeab2h1OrMdN7/3WcCSQdhwKpN9c+b18E6MchRm/a9ItUZ2tztcirx/9k0/FAb8hbl3zGynkagsUZ33Birt7JBWrFlDEObdPsRvUyBO+j/+sOkUG9oiEbgF95LoucjFc8DPO3o0BEYKIsK5ICmiAZuqgebH9ropctFfIzPBtFgJXjxay5jSvPLX31CRJCDNAKtG7AysKfXnGkjyhBzC+4ZcGJgMXz5JD1/LkbF/W1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LsnqB5JJlCxKWbtAIgp++/CO1mvj+k/Ox1BgQhsrUro=;
 b=dpEErukTvhwJGiis3iy3sGtog3F10IXkdiSNoerhahZ8JtyurLM5Y7PQ8Os3IRR8Sp+NTM6C5ZTu8+M8WlAZ6KD19F4o1B2QW3tVyBWyNvvArvzvYm+DvQhGtm218J/q0G0c7DGUA1XfHWxUcAhJAaeKqEqR0OM9Ge8NDt2v+uc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB5134.namprd11.prod.outlook.com (2603:10b6:a03:2de::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Thu, 14 Jan
 2021 18:43:58 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6%7]) with mapi id 15.20.3742.012; Thu, 14 Jan 2021
 18:43:58 +0000
Subject: Re: [oe] [meta-python][PATCH 02/10] python3-lz4: Upgrade 3.1.0 -> 3.1.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210113142626.27599-1-leon.anavi@konsulko.com>
 <20210113142626.27599-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <85dd51d1-e537-dc3e-e9e9-a904bf5b2258@windriver.com>
Date: Thu, 14 Jan 2021 13:43:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20210113142626.27599-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR22CA0015.namprd22.prod.outlook.com
 (2603:10b6:208:238::20) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR22CA0015.namprd22.prod.outlook.com (2603:10b6:208:238::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10 via Frontend Transport; Thu, 14 Jan 2021 18:43:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: afb42059-e1dd-4d25-c9ce-08d8b8bc5a84
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5134:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB5134359D51F2BBF8F6F7673B9FA80@SJ0PR11MB5134.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:632;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ljAhfQqLZIn1Ibnb2y6iYj+5fK4Upcg2nH/K0mKoeAhMA46L7p8Q5/f3HZFWD66bLnJsOagKrpMy6gZmeAdyV7DMnH9dHmWHGUUe3LLNZY6AFcB8gigKi9q0Ud+pEVJUXFe/Us07yM7kQoLBBv6rFV/XdyrjfUVANtGAxOjZCKgOKb9Rg+MHOxOYePVNOw6hTSfGvydvw0w/mLdM4b9k35+kfkbUwUCp17TqlwEsJz2Bl5TG3U9sOJUZdJyQmHlzdpMRwX+iDVkDnf0o1Sr2jNxxfyi4gx42IQtKQW2wTA1/IHBvzlcnu8HIdwn3eBl2hs11CmA/As+H9C8A1XVbhdhimhHqKKxNrXJQSxRfFwOrB1sAJQQj4co5wpBtDNN9Dj+XZj9U02cqOw+Ap0nVM4Qswm7qlyBhuzZoyos0RgE4yAuED/ARbojXIpHbTOPqU5lR6LOuzXRVp23oD7BSKy2xO/rZbz9FcNL1/tIUJ0i/5EawojpybpMJc0yNGqbl+T+GESBO8fsY939RANVnEICIOb5ulTti5Q2VotQZbf0lDpTb68OJIe/25y+jc0DX
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(366004)(376002)(346002)(136003)(8676002)(33964004)(6486002)(83380400001)(5660300002)(8936002)(186003)(16576012)(66946007)(66476007)(52116002)(31696002)(166002)(16526019)(966005)(36756003)(44832011)(956004)(2616005)(53546011)(86362001)(316002)(66556008)(478600001)(31686004)(26005)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?QUlZTnFpdStYU2hsUmRUTVBYWmZSWERTWEV3RGpmaTlzQmRmTXZYNGt0V0VW?=
 =?utf-8?B?Tzk2a0xOMnZtdjkrUG9SaWRRSjlpUFgwNFRBRFQxVFVaQXFaMVA2a0cyWWJl?=
 =?utf-8?B?Y2twM21LR3p2dWVwdEwxcTlKRFFSM250a0IyK0NrRkxTVjZSazJXTnN6QTk3?=
 =?utf-8?B?Rk1qQUpOdC9idjFVTVBmOGd3a2JZdFMzRExkaDYyQ2FBbDExWlRyUnc1U2pY?=
 =?utf-8?B?dUZmaU5QemVaakhpNG1vK01VbVAzL2RRcnRqRFhjbEVqUC93NUNiSmY2UlNj?=
 =?utf-8?B?VzM3R0FEWXJQM0NxU2ZSeXhFNDBXaC9GRUVMek8rS0JWdDBhOVQ3bGErbHdE?=
 =?utf-8?B?MUFwYS92RHJOOG5iK3BxVkM4eTZUYmsvVGhwMlNNQW1IakRyZis1WXhsbE9a?=
 =?utf-8?B?MWx6eEJXWk12S1c1NC9VVm1KQ01rcVNQdU1HR0ZVMFhqWkl3a1d4QTlueUNR?=
 =?utf-8?B?MjlrKy8yRzA4T1BaekxZRWF6K2drZUNHaEV6YStDVWtuaW1oUjY2SEsxNzFL?=
 =?utf-8?B?VGhGLzd2M0EyZkRGeEJZQi9hSEs2WkIyV1g2azRpdXdsZlp1QVEveUNWb0JF?=
 =?utf-8?B?RVdDRzlON3VGZFNvSlVJUzg2bUFXZW9IWDlzSE1KdTF2T3hQQ3dscGxPcEZF?=
 =?utf-8?B?YW9uMkhDK2NqSEpVSnRqQ1dxZnBLd2JYM1Uwc0RCR1oyanA4ZkZqSnlyeXk3?=
 =?utf-8?B?R2NyajVVNzF1cWltb2dlSTY2N3JLc3NhRnRCWlFlbXdnVHNqTWNkSDZ3WFp5?=
 =?utf-8?B?NU5MRllsbDBvTFpsSnNXNm83L2pvVUlMa0pWVmovdGZuTXhvQkFtR251aU9I?=
 =?utf-8?B?M0tpV3BoRXBsNWhsUk9yYzQvbUd6eTRlQ3grY3lJVS9aS0NpYzExN09pZ3hX?=
 =?utf-8?B?WGcwbHdLalRiWllmYXdlMWp4bVltVFY5NVVzc3IxbmdrUU94TWxiNUZGalpL?=
 =?utf-8?B?QTljL21NckhEcmNPbEtSb1EzaThZdGJMNHYrQ3E5bnNaYTdIQkdhR2RwdStV?=
 =?utf-8?B?NkY5bzNrRVZST1p1WVNieHV4WGZDbWpKSHcrbk5VMFpRUmJpSE5mWFE1bkpW?=
 =?utf-8?B?VlFRVTZabG5xcUpoRjN1VlZRNWNNWjJyWG1jRFhFWmNuM2dpSUxlUWkwVjlH?=
 =?utf-8?B?eHJhSEpIYjVBZ0dab21XaUlzK1dwdGczTG1SeE1EWDhscGhmbHFHVmFyYjBt?=
 =?utf-8?B?NTZlQzZhZFF1bkpNRnp3NVA1QTV4VnVrZ0VVZXVWb0lRakhOVk92TGJCMHVQ?=
 =?utf-8?B?TUFOVGV1bTlEWGY0QUJHeHZMekluSnFwYXdCVnB1RkV1WkFNNjhYemQybElq?=
 =?utf-8?Q?VMGrvZ72GQZV/S5KuqseBkYpUSwP0EqB46?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 18:43:58.3560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: afb42059-e1dd-4d25-c9ce-08d8b8bc5a84
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q/TQYEW/4bNFW+mnPW/JeRmk0hY0zVh9ZKBC76vz1oT58URDWwW7J4KMy8y9/YAd3RsNZkkQKZFTECBKy8wafyIjc151QWVzcS62OzQlhMg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5134
Content-Type: multipart/alternative;
 boundary="------------80167EB59C3B82EC4D2D3B1B"
Content-Language: en-US

--------------80167EB59C3B82EC4D2D3B1B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-13 9:26 a.m., Leon Anavi wrote:
> - Correct how pkgconfig is handled in setup.py to account for
>    multiple build flags
> - Improve how CHAR_BIT is handled
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-lz4_3.1.0.bb => python3-lz4_3.1.1.bb}      | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-lz4_3.1.0.bb => python3-lz4_3.1.1.bb} (70%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-lz4_3.1.0.bb b/meta-python/recipes-devtools/python/python3-lz4_3.1.1.bb
> similarity index 70%
> rename from meta-python/recipes-devtools/python/python3-lz4_3.1.0.bb
> rename to meta-python/recipes-devtools/python/python3-lz4_3.1.1.bb
> index 06bf63159..1cc378def 100644
> --- a/meta-python/recipes-devtools/python/python3-lz4_3.1.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-lz4_3.1.1.bb
> @@ -8,8 +8,7 @@ DEPENDS += " \
>       ${PYTHON_PN}-pkgconfig-native \
>   "
>   
> -SRC_URI[md5sum] = "1bf913acec3cb63893f522c222c8e3b1"
> -SRC_URI[sha256sum] = "debe75513db3eb9e5cdcd82a329ff38374b6316ab65b848b571e0404746c1e05"
> +SRC_URI[sha256sum] = "1ac354804cb2d5fb3d213857a6bf8590a301ef051cc16fbb4938bd2d6e524bda"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------80167EB59C3B82EC4D2D3B1B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-13 9:26 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210113142626.27599-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Correct how pkgconfig is handled in setup.py to account for
  multiple build flags
- Improve how CHAR_BIT is handled

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210113142626.27599-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-lz4_3.1.0.bb =&gt; python3-lz4_3.1.1.bb}      | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-lz4_3.1.0.bb =&gt; python3-lz4_3.1.1.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-lz4_3.1.0.bb b/meta-python/recipes-devtools/python/python3-lz4_3.1.1.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-lz4_3.1.0.bb
rename to meta-python/recipes-devtools/python/python3-lz4_3.1.1.bb
index 06bf63159..1cc378def 100644
--- a/meta-python/recipes-devtools/python/python3-lz4_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-lz4_3.1.1.bb
@@ -8,8 +8,7 @@ DEPENDS += &quot; \
     ${PYTHON_PN}-pkgconfig-native \
 &quot;
 
-SRC_URI[md5sum] = &quot;1bf913acec3cb63893f522c222c8e3b1&quot;
-SRC_URI[sha256sum] = &quot;debe75513db3eb9e5cdcd82a329ff38374b6316ab65b848b571e0404746c1e05&quot;
+SRC_URI[sha256sum] = &quot;1ac354804cb2d5fb3d213857a6bf8590a301ef051cc16fbb4938bd2d6e524bda&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------80167EB59C3B82EC4D2D3B1B--

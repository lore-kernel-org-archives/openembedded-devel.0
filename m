Received: from NAM04-BN8-obe.outbound.protection.outlook.com (NAM04-BN8-obe.outbound.protection.outlook.com [40.107.100.87])
 by mx.groups.io with SMTP id smtpd.web12.12581.1598359551955117071
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2020 05:45:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=jKPdNLpY;
 spf=pass (domain: windriver.com, ip: 40.107.100.87, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gLS06fGPoOaIXEM68dCNBUagGwNKseJiz1PLHBqGvGmzmhF2UTaPWrMTzBRtEBPPqxFGkQjtKA6yb+9cZgpVMhGtDqRIQ38MZU4yh8GD334G21t5M72WSZ5NHXldcQyhwHl4yFMIUqeH4PGtRBDcJeoppdYn26yyuTOVvxr3G/R+5BKZZ8qO3bveLlBQq5KEKO+fURWCFdT8G73Yde2FvEKmCfY/N2S65R6wNbhqLOCJ4zJc09ZRUN0keRJWUwruLXrmbbQ8SycvGaMEQ3GHOgqpXztILGJEYRek2dGlM1vq2enpkIC0Vz6aNhhSrw7bYdxkOGyuX99T7toSuHmnCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s6T7/hJQPA43LalIqDo4ORjP+869V1stZ0Y4/gJTbik=;
 b=SCRhy0ZqmzBtujFlUcJs1UCz2+zFDDq1ejJtbiQNgXCO+xOy4yqLPJr7LtRkRlld9eqzOuv+QzfyWD5sSbGxP7bG2zgBt4VODtp54wnfcZF1SwXJEAHbABzzuKkUVIcDPQ6wTO0ZLs9dQHsv/5xZoHVniaVV+B1Ncy3sWvoYD5ZWV90zWdVNeFn8BmkT5872Yp1Cjaj5Arr4snItoUTHhlCEKCUy/BNB3vP5XuGEYnudaGlHOyfVEin/IXSo40OKQvvRvB29wqLbBvjAqSlSUpbnSLPTkClh+PJGM8MvdYQVs43PEQowtA8e4K5tt3CWWAKIKNXoXRJZ0Fzm8W+2qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s6T7/hJQPA43LalIqDo4ORjP+869V1stZ0Y4/gJTbik=;
 b=jKPdNLpYpE1hMIVmhbhBTmfEYLsCiMZuhPHpA2ZW3z6rWcOVvKZWDqQZBhleTKhPkPVd+YEleYsAWkAH/JD7lG8FnyVCc9YqfFo4YBSOTlpwLSo9NVPl/7fO9uxyUY4p56QDPmGgiKl/Mi3HABXsWusCjl8DWs3/iScbcw6WiYk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB3976.namprd11.prod.outlook.com (2603:10b6:a03:187::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Tue, 25 Aug
 2020 12:45:50 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3326.019; Tue, 25 Aug 2020
 12:45:50 +0000
Subject: Re: [oe] [meta-python][PATCH 4/7] python3-inflection: Upgrade 0.5.0 -> 0.5.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200824145004.12568-1-leon.anavi@konsulko.com>
 <20200824145004.12568-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <712d8b93-05cc-57e1-501f-7372a5fde4a7@windriver.com>
Date: Tue, 25 Aug 2020 08:45:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200824145004.12568-4-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0087.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::26) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YT1PR01CA0087.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend Transport; Tue, 25 Aug 2020 12:45:49 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d35ba76-e639-4eb4-647c-08d848f4cb74
X-MS-TrafficTypeDiagnostic: BY5PR11MB3976:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB397685DCFE3F224C11AF87749F570@BY5PR11MB3976.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:285;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	L6z+ez3UjyCb6wVm1beAoY351xqAoGm1vQ5Z8juE7IcAOFf/q0y6H6kuQUL72f3ulcCzqmCCuGLSZ6TFBAmAjQE+JxLUttzoVAzXruwqPqZdqrhldlAtBBZb/KdFiuhY2U+Gsy2x7mNeAEp6MlUWX5jEV9SKWizQ9O+7Ky4N4bJ6/wmFG6m+VU7RUAok3SqrjPiPWLwBJPNbJHqLiAtFHR+eyg/9yS1FQdB9mf1HHdeg2Y/18oCOS70afbdMoadl7MhVazMZLRPxbjIFnNHfxivTItuYk7X7sxJVClAMysvDbTX9rK2TgXGrdcDLh5JQFrz4uCgNsyx9UGjyJvEOyW3SG5jF4rnLhnwIAlVya/91w1bpeP3Yo/U+TQ2RnO0pDVy0rsPLoJuE6pxv7gbMh2zarpThLHD1tWQozkli0+to6uGQgCzIb7Ij+VuEn2Eake7aXpgJiGDaEesPXl79EA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(39850400004)(346002)(396003)(66476007)(966005)(16576012)(36756003)(8676002)(8936002)(316002)(44832011)(956004)(6486002)(86362001)(2616005)(33964004)(53546011)(52116002)(26005)(478600001)(186003)(31696002)(5660300002)(66556008)(66946007)(83380400001)(166002)(31686004)(2906002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	xKttO6Aen4k3fjTMH4mJQblmUZXVIyNKPDkZ8R9QR5tJBDCX4K43aoR8NdJ+bVKppiQuWohIAPLl99WGW0Sy++ZRCT6Ywbrxmf6m7W4paAhvbGeH58fa6Agt5fDC6MIx3wq0G/S/1MZE2iWYrol0QZs7e13cH4RQiYNtfTATNgHvfjnSucW6QwmFlAMiEBRcBgVT4HnIMmCVcWNzsWryjsVeIK8aP2jz7HaE/zugdlCUu4wler6VIIp/CeptrogcnH4ujselqjFIGV1u4SgJFo6SzW2YH2RZLK+1vifX7Pr0uPLbC7CCsIlBpFiIkMB3re4d/H3Mj5DMBV/MuCJawPpRyj4BCYVYXIQBE3wwTMEJ6ogNoIH4milOOmn7t7Bbvec5FtjY7aylxTN9DNcfHVSiC8OFOW7JgSlSmFBv9zMY++h9lK2tghjEO4UNwelTXRBhnTWeHYiwaJk3hE6lfxBFXgraq9/pw5fzwrwy+R15xtp5/H4pbekfsLB/pW8TPbk/dHA0XzH8yPm0Wb4E4LYmF/brVvUcg3RTjBgBodCl4Q+Ukh72jbE6XyxZjmzIUwh4R4GvgbRpQYj/sOwqdbQsBL8LZPXlOUaEfuP8iSOvgoDM1bRUwosQ2xYPGo469x0x/ZEX+j311OAxaz0ThQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d35ba76-e639-4eb4-647c-08d848f4cb74
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2020 12:45:49.9365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O7cVDZOAKIX+aWYaHbvLtz4PnKUVl5kUBERzxfZQ53JWsCprQ/yJ8Xe2be1hNRCJshCDntJ4zDaCZStyuA26tzAggGP4eNwqvc5Kf83/tHw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3976
Content-Type: multipart/alternative;
 boundary="------------6057EF2162EF583282F7C166"
Content-Language: en-US

--------------6057EF2162EF583282F7C166
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/24/20 10:50 AM, Leon Anavi wrote:
> Upgrade to release 0.5.1:
>
> - Fix type hints not working
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...ython3-inflection_0.5.0.bb => python3-inflection_0.5.1.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-inflection_0.5.0.bb => python3-inflection_0.5.1.bb} (77%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-inflection_0.5.0.bb b/meta-python/recipes-devtools/python/python3-inflection_0.5.1.bb
> similarity index 77%
> rename from meta-python/recipes-devtools/python/python3-inflection_0.5.0.bb
> rename to meta-python/recipes-devtools/python/python3-inflection_0.5.1.bb
> index 0a3b7734c..b5cde669f 100644
> --- a/meta-python/recipes-devtools/python/python3-inflection_0.5.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-inflection_0.5.1.bb
> @@ -4,8 +4,8 @@ LICENSE = "MIT"
>   SECTION = "devel/python"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=2fb6fa1a6f1792d78de19ad1bb653c31"
>   
> -SRC_URI[md5sum] = "87b2ab6ffdd6e15aa31d109ce5ff10bb"
> -SRC_URI[sha256sum] = "f576e85132d34f5bf7df5183c2c6f94cfb32e528f53065345cf71329ba0b8924"
> +SRC_URI[md5sum] = "c3287d4f0e3bdf625a52d655cc514403"
> +SRC_URI[sha256sum] = "1a29730d366e996aaacffb2f1f1cb9593dc38e2ddd30c91250c6dde09ea9b417"
>   
>   inherit pypi setuptools3 ptest
>   
>
> 

--------------6057EF2162EF583282F7C166
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/24/20 10:50 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200824145004.12568-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.5.1:

- Fix type hints not working

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200824145004.12568-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...ython3-inflection_0.5.0.bb =&gt; python3-inflection_0.5.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-inflection_0.5.0.bb =&gt; python3-inflection_0.5.1.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-inflection_0.5.0.bb b/meta-python/recipes-devtools/python/python3-inflection_0.5.1.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-inflection_0.5.0.bb
rename to meta-python/recipes-devtools/python/python3-inflection_0.5.1.bb
index 0a3b7734c..b5cde669f 100644
--- a/meta-python/recipes-devtools/python/python3-inflection_0.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-inflection_0.5.1.bb
@@ -4,8 +4,8 @@ LICENSE = &quot;MIT&quot;
 SECTION = &quot;devel/python&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=2fb6fa1a6f1792d78de19ad1bb653c31">&quot;file://LICENSE;md5=2fb6fa1a6f1792d78de19ad1bb653c31&quot;</a>
 
-SRC_URI[md5sum] = &quot;87b2ab6ffdd6e15aa31d109ce5ff10bb&quot;
-SRC_URI[sha256sum] = &quot;f576e85132d34f5bf7df5183c2c6f94cfb32e528f53065345cf71329ba0b8924&quot;
+SRC_URI[md5sum] = &quot;c3287d4f0e3bdf625a52d655cc514403&quot;
+SRC_URI[sha256sum] = &quot;1a29730d366e996aaacffb2f1f1cb9593dc38e2ddd30c91250c6dde09ea9b417&quot;
 
 inherit pypi setuptools3 ptest
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------6057EF2162EF583282F7C166--

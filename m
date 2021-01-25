Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.58])
 by mx.groups.io with SMTP id smtpd.web09.35529.1611578413252842087
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jan 2021 04:40:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Rqje6EYP;
 spf=pass (domain: windriver.com, ip: 40.107.220.58, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nEmHx25LcRbu95AePpq1Ctrk/FwxQdTjn3i89IdKkcQE3GLQGS3FvrBYd/tBonzn3GAEu8VbZcRHET2uAQ3esFqyo80uOFjlru2zR6KRDZeTHXGS0EshtHNxo8IllNbVdDzt5E5XD6x3zI6QJpOeHHUm2wDOWhVZpnwnqHner2hLQcdsl82pk4nl2yk7+7c2c5eORAo7v660HCIZyDe8b3/Hd0zxTWrtYU3kO0oi/0XIVw9AXrMZdaiI5p8Y+n3gSc8oyCUiEECpV+MICEZoCy+pOhVTdWII2JzS045pSpKeFIbQykG6ADoMHm2+V/ykJqoxZc2408v3j8VL9dnlcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tn7ZaxJRLrbQdWeyQ/ut+SgBbJXWVE/SVj3OgYgZTFg=;
 b=fNx2O7HlBjzk+tRuB55plCbLJPMaVb8zL1X3MJoV9HJiPG5lrLE5sED3PdxCeR5mThebcp109jreonKVWDGYhWXVCKe6rY2h4CEHdSwnWBF/jSbd+dZiITN4dZz9SfkBEDS0bQ5COTPeb6IymtY74t636nrlO2sUk2mgedXeIq3WtbRmnmPzQrRMNolJzB65VoE6XpORjszQej7lGX7SKkXAN3+8gG33nU3ZjHdyzvEuAs76t/SaGGEnuNICAPhJX7jHzBgyUJwk2DE8ILjrTToRe4wYwUnZOtL/e9Kt5oXWWgvkVyYRzxYxdpt3LNXRED5S36r33AKMhlLcA4LHNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tn7ZaxJRLrbQdWeyQ/ut+SgBbJXWVE/SVj3OgYgZTFg=;
 b=Rqje6EYPY6dgQyNlCeQbgZLmyVMtfEdH6jdlfv8w2vdmZ2C+Y0Cr5rjayHzp6bssvBaFSYuXaJeI+iBZv3uEfILyo/rQixOtNDL8SZbcAf6ycdkjS/Z96gGfRBcEIIdTATj5elWe1G9oiY0dfo6eLcJnCC4xphGtdS8blxInLFI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from MN2PR11MB3919.namprd11.prod.outlook.com (2603:10b6:208:13b::27)
 by MN2PR11MB3984.namprd11.prod.outlook.com (2603:10b6:208:153::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Mon, 25 Jan
 2021 12:40:12 +0000
Received: from MN2PR11MB3919.namprd11.prod.outlook.com
 ([fe80::5462:9c04:72b3:6c44]) by MN2PR11MB3919.namprd11.prod.outlook.com
 ([fe80::5462:9c04:72b3:6c44%7]) with mapi id 15.20.3763.019; Mon, 25 Jan 2021
 12:40:12 +0000
Subject: Re: [oe] [meta-python][PATCH 2/2] python3-alembic: Upgrade 1.4.3 -> 1.5.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210120165300.8588-1-leon.anavi@konsulko.com>
 <20210120165300.8588-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <595c8a53-aa56-2daa-49fe-d0c19d818a52@windriver.com>
Date: Mon, 25 Jan 2021 07:40:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210120165300.8588-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL0PR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:208:91::34) To MN2PR11MB3919.namprd11.prod.outlook.com
 (2603:10b6:208:13b::27)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL0PR05CA0024.namprd05.prod.outlook.com (2603:10b6:208:91::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.7 via Frontend Transport; Mon, 25 Jan 2021 12:40:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3284e7ce-3a43-4556-40f7-08d8c12e5b90
X-MS-TrafficTypeDiagnostic: MN2PR11MB3984:
X-Microsoft-Antispam-PRVS: 
	<MN2PR11MB3984C507F334CA5EDE3A84F69FBD9@MN2PR11MB3984.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	A6C8qciNqtJofMamesushN48QcchlfNpa/hqRN93ak29Yio0uA+HVnZmBqnHGm4vb1XKGJP7cpVuph3CMrKNgqo0MK5n+LQ1RBgN+EO85BI9nyaDYPgJPeQp4k5rUkyhKkz335Cye8pogLbUpqKqWpn2CiZp26oi+9zvb+nUpHYzm1sfT76gRZoNmVCLhT0Ip7FuEPhcHlQY3X0+Vn4fDQLsyNgqLavHzfKOBsZD4dyXbHggD7ObDRkBV4e3QFhSH8Fb+Kvfm2LRETI7Qh0RIZd9Rb8MrgfdD1IvUMA+RSvRYKOyah7iUBiVkkiYfA5ggQ9j+AY0/03pGET50jiAeScxMRufiZGQbj88FzSiZno4K+AFRCVGsEexjzz+f8Vd3lay/bSoDkePYTDwidUIztJGBBxM54UMY1qEdIlmg7QIMstgq5F08cVGsH2tuVmjU5d+EVmT2N3xFgqdgMGUEmBcjN+zz89NdfQZPFpJheGIvULuEh7hqmxv26xAxGbuRmL04DWSK8rYsLzT0Ga0ymuqvwmXW3ho4VxeTVG8/FBGqCK1eiCXxlKLiL+nlyd0
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB3919.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(39850400004)(396003)(366004)(8936002)(33964004)(5660300002)(86362001)(31696002)(2616005)(6486002)(478600001)(44832011)(83380400001)(956004)(31686004)(966005)(66946007)(66476007)(66556008)(36756003)(8676002)(52116002)(2906002)(316002)(16576012)(186003)(16526019)(53546011)(26005)(166002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?QUN0OUhxV0t6c2dEL2xnZTY2RGZjUVkzN2h6bm5Ya08wZWlOS0xNbkV2V3Fj?=
 =?utf-8?B?SXBtWE1KYUplTkdYdnM0dW1neDR2WCtsSEp1SjMra2p2ZnFiMzVVM0NTZVQy?=
 =?utf-8?B?cFdjL0hBY0xHakVZNUZER21tYkMrb0NqMExqcmUrSmF3dUJMcW9ib0JFazNw?=
 =?utf-8?B?bE9waEhIa0FpSVBObUtQN0x1bWpUN2xrdm82ZFZ6SUg1QytlekhwWmt1dEJR?=
 =?utf-8?B?ZUdCbXVhMjFXM2JmbnI5N1A2TlpQMDVRRnlCK3RMWGV3eGRRZHBkNDVYWXhV?=
 =?utf-8?B?SWx0VFlRMEwvdElpbm1xZHhGSG8wQlh2eUZ6WUFXQ0xpMVBIM0pqYTFmNkJw?=
 =?utf-8?B?TmQxc0NwUGQ1TEZSN2JTaURHY25aczhGcDdHWHV4WExMN2FxSWdmOXBzeElu?=
 =?utf-8?B?dGhJdDZzRUljbzk3aXhPWTdpUUt2ZDJSL2RlY1V1QmgyeTU2TUcrZk9uRnBV?=
 =?utf-8?B?UW1MdGJ3dzR4WEpxUjBQakVGY0k0NjVwcXkvNmFlM0NlSFdpelJ6S0hZQnlX?=
 =?utf-8?B?ZitJMG5RUk10Q2tIeXB2Nm5iNE53RlNvWXQ3UlR2SS8zS0tOT2lnOHE1MTRX?=
 =?utf-8?B?ZGtTMVFrSE16Q3NHTGlVTEdmMmZNczN5TWEzQ3RHVFhCSS9uSFpvclZsN2U0?=
 =?utf-8?B?dzRhclRZZnJaYm5rQkRZM2NmdTV5KzNSVDZJUEI1bkZoVEtab29zbXZ3YUdE?=
 =?utf-8?B?aXkyVzZZeVErN0tRU3h6SUc1RkZYVktzU1ltRnJrcm0vYnBQeUR1b2phMzE3?=
 =?utf-8?B?cUhFL2tNeU1HWnVJK2ptQ3dlc01iRm1vQWtZTG0rOTAyZkw4ejh0dWJMRkhs?=
 =?utf-8?B?SUFtVkRXcTE4YUdreUVxdkJVTFZnSHoxcFZiUHpnVFFYMm5LM2k0NDZDM0Vi?=
 =?utf-8?B?d0oza0pHc0ZPVnhUaTg5T2Z1VEFOb0c4dnJCOGRQTFZJbXlaME5EdnQ3RFYw?=
 =?utf-8?B?Mmx2bGVlUThlSDVCc2lOWDJ0VmpWaWJxVWFoWkpmd2pqS3JudXhuY2xIcXhZ?=
 =?utf-8?B?MFR0V3k0TXpTYUZ2M29aV0hKY3lCY2wraUlqZDFnalVXVTlxM3B5S1lPMjJz?=
 =?utf-8?B?VW83dVZsRTJhVVBCcHRHNGVwUGw5cC93RVNUa1JucVllOElTYzh5czE4eUxm?=
 =?utf-8?B?MEtQbVM0bGJXNUl5d1ZGQTI3MGthMmZCWERYT3pDZUFRVG85aEdVQWg2Vjlu?=
 =?utf-8?B?ZW95TFpJYXBRRGJ0N2ZicUdlRi9ZUWdldzNaa205SGt3Q08vai9oVWZIK1Q1?=
 =?utf-8?B?L1k1RStrZmZBcnhnQ2svTnR3UXBWd3V2d1R0dmhYY01EOUtRci9iM1dYSXJV?=
 =?utf-8?Q?2wIxcIdcGNxqmw6h1J5C618UOCzV5EwPpT?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3284e7ce-3a43-4556-40f7-08d8c12e5b90
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB3919.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 12:40:12.3131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x/7thRXJEjB8BWCjD/gYzB0pj7EFr8QkOeagw5wQOAeYOp8x9SDiC3DvP+skWpYJeQCT/YGX5v0YBewdFhZjU1LXeLb4NFOsUzG/L/q8z3E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3984
Content-Type: multipart/alternative;
 boundary="------------71DEB09A0DC27A344E1AA004"
Content-Language: en-US

--------------71DEB09A0DC27A344E1AA004
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-20 11:53 a.m., Leon Anavi wrote:
> - Fixed installation issue where the "templates" directory was not
>    being installed, preventing commands like "list_templates" and
>    "init" from working.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-alembic_1.4.3.bb => python3-alembic_1.5.1.bb}   | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-alembic_1.4.3.bb => python3-alembic_1.5.1.bb} (54%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.4.3.bb b/meta-python/recipes-devtools/python/python3-alembic_1.5.1.bb
> similarity index 54%
> rename from meta-python/recipes-devtools/python/python3-alembic_1.4.3.bb
> rename to meta-python/recipes-devtools/python/python3-alembic_1.5.1.bb
> index 0e7f629d4..f07be042f 100644
> --- a/meta-python/recipes-devtools/python/python3-alembic_1.4.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-alembic_1.5.1.bb
> @@ -1,11 +1,10 @@
>   DESCRIPTION = "A database migration tool for SQLAlchemy"
>   LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=bd64aba1b968c2bfbc2b525a181ce85c"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=c4ece55266dcdd02ce165b1ee0e490bb"
>   
>   inherit pypi setuptools3
>   
> -SRC_URI[md5sum] = "6051576d8e25e3d4a9fd818d79531bad"
> -SRC_URI[sha256sum] = "5334f32314fb2a56d86b4c4dd1ae34b08c03cae4cb888bc699942104d66bc245"
> +SRC_URI[sha256sum] = "52d1d48109f17959982779e3c4b5cdeca701e449897bacb75bab173bd6ba984e"
>   
>   PYPI_PACKAGE = "alembic"
>   
>
> 
>

--------------71DEB09A0DC27A344E1AA004
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-20 11:53 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210120165300.8588-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Fixed installation issue where the &quot;templates&quot; directory was not
  being installed, preventing commands like &quot;list_templates&quot; and
  &quot;init&quot; from working.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210120165300.8588-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-alembic_1.4.3.bb =&gt; python3-alembic_1.5.1.bb}   | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.4.3.bb =&gt; python3-alembic_1.5.1.bb} (54%)

diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.4.3.bb b/meta-python/recipes-devtools/python/python3-alembic_1.5.1.bb
similarity index 54%
rename from meta-python/recipes-devtools/python/python3-alembic_1.4.3.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.5.1.bb
index 0e7f629d4..f07be042f 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.5.1.bb
@@ -1,11 +1,10 @@
 DESCRIPTION = &quot;A database migration tool for SQLAlchemy&quot;
 LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=bd64aba1b968c2bfbc2b525a181ce85c">&quot;file://LICENSE;md5=bd64aba1b968c2bfbc2b525a181ce85c&quot;</a>
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=c4ece55266dcdd02ce165b1ee0e490bb">&quot;file://LICENSE;md5=c4ece55266dcdd02ce165b1ee0e490bb&quot;</a>
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = &quot;6051576d8e25e3d4a9fd818d79531bad&quot;
-SRC_URI[sha256sum] = &quot;5334f32314fb2a56d86b4c4dd1ae34b08c03cae4cb888bc699942104d66bc245&quot;
+SRC_URI[sha256sum] = &quot;52d1d48109f17959982779e3c4b5cdeca701e449897bacb75bab173bd6ba984e&quot;
 
 PYPI_PACKAGE = &quot;alembic&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------71DEB09A0DC27A344E1AA004--

Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.79])
 by mx.groups.io with SMTP id smtpd.web10.22676.1591976317445045780
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2020 08:38:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Z4l48T0q;
 spf=pass (domain: windriver.com, ip: 40.107.75.79, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JlqwcHTWJTxfELKWbPQPY0fMOp/IiI5NFcETLTF4u6pBzDQgp2MvyIU/wANu3ADTscJy8rXfkgiApJnD28UeCmUcJoq4FP3LV2K0j+0Fz8eY8q+wu2NqkNXjbQq8W+Ij59Edwcebx8TdmcUXTE9DirWrFmadtd93NN/I3/rWmE4NC2KLJJX/4vSuJsFSoIplgyOgCrgcotrXXAMvKDhWWWuH11aHPZB+0N6h0c/U3GSRa5iDBCrA0qu3MXbTjRv8fwQOXckjkYHcbdHKrEKNsWoKWs7mEiF8XXH5d0FlaGPfYgeB3aBCYPMWmgbQC0Wj6SxsNcU2uz80Q0eHPBOejw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jVyNMXTvvPKwWTLmMelednOTnRrLFXMtLlIkUtBwoRA=;
 b=Ey61fJv6d2Hac6bnLC6I/4AqnTg2FKDGhRiyUrZpLRBUv5xC2hjuFxAO6h+vVnT7jQHtZw8KZ4DLDiV+Bo+x7IiAnMt64qMS1l51hnK27hnv06e7kN0t3ICd/3d4EiNy174UZxzriBf3+0uvgDWw2X7BQJ53U8Ksw4hFg+mJ/r8HYe21IW3p8xuX/IQ6SPo5COynMjt+lWpmSH80gCjD/BmGvLSzgpwQL95V6fpZ7q1b6DzHKh1R3QKG3z5LjCJZuiDReFuhzcYacUY0YH7PU8HFoWlPrkdZ/IgahaVVxWLwmC0fusMYIuWqE/SwicI/ti+HAp2hYHkxMSdJxdSy4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jVyNMXTvvPKwWTLmMelednOTnRrLFXMtLlIkUtBwoRA=;
 b=Z4l48T0q2LEU1J16cLZwgwdmNAnASFLSqjJCIyyd6aW9XAVnLIZ7V43UpYOCSWG50ysGEb2rxwY5ZpngQ0PUY6aXJhYFOArZbO3zosk2fD/X83cOUloV6cxnqlDjd8ogJ66F2ylEKlauUZV1HaFFvfIU+md/wTdOHJD6KOeYmz8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN8PR11MB3746.namprd11.prod.outlook.com (2603:10b6:408:8c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.21; Fri, 12 Jun
 2020 15:38:36 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3088.021; Fri, 12 Jun 2020
 15:38:36 +0000
Subject: Re: [oe] [meta-python][PATCH 3/5] python3-kconfiglib: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200612144201.4536-1-leon.anavi@konsulko.com>
 <20200612144201.4536-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <aef8aa5c-a81d-4671-a3b6-00d6731f765a@windriver.com>
Date: Fri, 12 Jun 2020 11:38:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200612144201.4536-3-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0022.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::35)
 To BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0022.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18 via Frontend Transport; Fri, 12 Jun 2020 15:38:35 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b656767-b5da-4e91-dad2-08d80ee6aba7
X-MS-TrafficTypeDiagnostic: BN8PR11MB3746:
X-Microsoft-Antispam-PRVS: 
	<BN8PR11MB3746AD5D65C15028D18BA5C79F810@BN8PR11MB3746.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:138;
X-Forefront-PRVS: 0432A04947
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3uqxmr91Dw3/yzvpMdUJ4H505vFJft/zrY4BTmajYjr6ogmk6W620xSzai9k31wZNlz6m9nnWdl2trDsiW/EUMEDCGWaudkFLUFoWjJ6+ZOVlLi6bMQpATDMb2lTXUUahWHBY5dwyu4Hy5xIG9+7V2mJFfPx4fmTMFJTQ3oIhp1hUQBXFRFFv1VpZbKIkjlwKG7GnNUH/laoR1GEGpn8XQeZLB/QWlwVdvN87rWS9FTg1UeTjI+nVslQTSu7xESMU9/dYqsZJEGhPnTbJXn819tjOw++sK+wd5Rjm7Uz9DSX7YegzjSlUv6kfVwsIHDE31/8N5cvvHzZCjOVnzo+6aHD9C+uQEduIbteVvase8sYqqPohLe/XlfGMtZjivQ0Qp1cevOdSNFmq2fFvJaTtCuI9n8TNfKGZpfMfKt2nTsGUAy0zhwaATh5quPdfhLsd+y/iMcly86FGlfSfWHo1Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(136003)(396003)(376002)(346002)(366004)(66946007)(36756003)(31696002)(66556008)(44832011)(2616005)(83380400001)(166002)(316002)(2906002)(86362001)(26005)(16576012)(5660300002)(52116002)(33964004)(186003)(16526019)(956004)(66476007)(53546011)(8936002)(966005)(31686004)(6486002)(8676002)(478600001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	CCyZrwRLrZfXEVYkzaOx5Ms2UrbGWuexOC87AqT/IqWYk+NuXD8dKWhHa3KoO0Qhi4KaMYEKBiDWwaZJ8/PnqBHeaRDn+eSm2WGmfWiCufpEJrxHyQ+QMrn1pjfEnUYqQLFUw8jefa8RXUyxVoCs7LzzEctjyAQ+xNYKTeCxb5UBK9bNtgfp55AN/Jhno5zv+eX9jafHSFcdX6wfOPF5TzRqrZufo4zuMdedBg/4prRk8sJVOnhlBuwEOhPIc7D53gQ6T1INDVRb/fkt1TSuLCriB3E0S4iYH1QRYXnY/SnPCZaqSIJy9U/TflrjFGksjbGRWo+cUlzbJDAdqi2tLiR/p3RefOo6Vyjq7VJ0LbiNKs7vf96zCkfLWr383Dry+uvGYJJ+OkhXfWPSD7/kpyPs71m3HyJlLEtoK8w/fwiWmPBV/rJJjZzhzv2T44s1hkjseSxQjRJZJz5akf37KuIRURh0SoDst3InDHbVZpXugLHPJPMfaBc9SB55XMPP
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b656767-b5da-4e91-dad2-08d80ee6aba7
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2020 15:38:36.0565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DLkhVwICOT1SxEhbW5I8HB1KZin7UVOvYkSg5XyZ8AhCIKcvj83ehUoXIaY9FYEvImuu/F0nYUxf+9NYD7hN/5ekvXoBdHhACPXqrw4Bzm4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3746
Content-Type: multipart/alternative;
 boundary="------------DFAD9F4555504F05AC4CDE75"
Content-Language: en-US

--------------DFAD9F4555504F05AC4CDE75
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/12/20 10:41 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-kconfiglib_14.1.0.bb                | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/meta-python/recipes-devtools/python/python3-kconfiglib_14.1.0.bb b/meta-python/recipes-devtools/python/python3-kconfiglib_14.1.0.bb
> index ab0944ff7..ec09cfc58 100644
> --- a/meta-python/recipes-devtools/python/python3-kconfiglib_14.1.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-kconfiglib_14.1.0.bb
> @@ -1,2 +1,10 @@
> -require python-kconfiglib.inc
> +DESCRIPTION = "Kconfiglib is a Kconfig implementation in Python"
> +LICENSE = "ISC"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=712177a72a3937909543eda3ad1bfb7c"
> +
> +SRC_URI[md5sum] = "4ad68618824d4bad1d1de1d7eb838bba"
> +SRC_URI[sha256sum] = "bed2cc2216f538eca4255a83a4588d8823563cdd50114f86cf1a2674e602c93c"
> +
>   inherit pypi setuptools3
> +
> +BBCLASSEXTEND = "native nativesdk"
>
> 

--------------DFAD9F4555504F05AC4CDE75
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/12/20 10:41 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200612144201.4536-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200612144201.4536-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-kconfiglib_14.1.0.bb                | 10 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-
 1 file changed, 9 insertions(&#43;), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-kconfiglib_14.1.0.bb b/meta-python/recipes-devtools/python/python3-kconfiglib_14.1.0.bb
index ab0944ff7..ec09cfc58 100644
--- a/meta-python/recipes-devtools/python/python3-kconfiglib_14.1.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-kconfiglib_14.1.0.bb
@@ -1,2 &#43;1,10 @@
-require python-kconfiglib.inc
&#43;DESCRIPTION = &quot;Kconfiglib is a Kconfig implementation in Python&quot;
&#43;LICENSE = &quot;ISC&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=712177a72a3937909543eda3ad1bfb7c">&quot;file://LICENSE.txt;md5=712177a72a3937909543eda3ad1bfb7c&quot;</a>
&#43;
&#43;SRC_URI[md5sum] = &quot;4ad68618824d4bad1d1de1d7eb838bba&quot;
&#43;SRC_URI[sha256sum] = &quot;bed2cc2216f538eca4255a83a4588d8823563cdd50114f86cf1a2674e602c93c&quot;
&#43;
 inherit pypi setuptools3
&#43;
&#43;BBCLASSEXTEND = &quot;native nativesdk&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------DFAD9F4555504F05AC4CDE75--

Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.83])
 by mx.groups.io with SMTP id smtpd.web11.9956.1593090138017304005
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2020 06:02:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=DtW1Nu4E;
 spf=pass (domain: windriver.com, ip: 40.107.223.83, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JSXY7b5e9wNtQuKDVK+viIUCtqcodSPLoRurQohkDyOKQF8tfwwSh/7SdSjbyuMDoY2/5D4495N4pdgBKf4DcvmfRnhPKvKU4kanurDpqc+4o9K67+MpTPbC39DEA6i1aHKdnihF/t1kluvVjOWIulEcP6R878gfhCaUKOBgrhfJvOJPBibaDpYbIjjygDk2RQdDMEFU/h8UyP1c6DwEJmnZ7CodfuRXr4rQOxQK/a+5DdWqGW+461P0AqkA2KjSrBhWtuPiFYR9v5egbZpj1fyOh6nGDYKIjMIfECO7w7vfJKNpE7o9DEhnMlN15TP9m6J8KPayL4XTB8Vu9OBd0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QFC6tuXqwONuu/hDtZV4Rs1TaXVtN4xCEupcp1bEbHw=;
 b=Bd6t0jKC56SWcw4AWLRzzi0CAgh0cT2aXcoS+rzofWMMBr9PYgNk93rFxUOYkBSH/O2Ddvcx5nGfDDoT+tSXU98LfohH3nW01mSZgUGrgEtvJKbRywKcmoeTi4T/9w9wsZ5hVrquxYbYFFArJXCP/fOBewaX5Czq+GfpHtM449jWNZ6Y8/g6AyjJ4ye8FkesA0p1GqzRdv2kUZICGXr5GtJ+WUhl1KXYYZSqyU5m1ezcFFUvkgogZX6P10GPKe1VLlI4ETUz9sl5HV9LcaTeVcckaQ4DpI4ZlMAaFJ0t+WUPurLMIERr+jK/GbBPqvyKNjjBFRkrfLI2Ha4lXRpj3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QFC6tuXqwONuu/hDtZV4Rs1TaXVtN4xCEupcp1bEbHw=;
 b=DtW1Nu4EJ3YJSW9squycCIoQAMb3+p5NbSVG8kl5vY+H9Q0N/6AFJaEBBSgsT1YYSnbFccZ6pUwZc9NW0ENWj7dXJnBi5+owEocTOhsyWQMtEMUFjs9AyKdXS0WqUf07TJTx/GiUM2Dfg5Y7+aRNcahSD3l6MpDNBknOCDMUDQQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB4161.namprd11.prod.outlook.com (2603:10b6:405:81::38) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.23; Thu, 25 Jun
 2020 13:02:16 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.027; Thu, 25 Jun 2020
 13:02:16 +0000
Subject: Re: [oe] [meta-python][PATCH 09/11] python3-spidev: Upgrade 3.4 -> 3.5
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200623095136.24854-1-leon.anavi@konsulko.com>
 <20200623095136.24854-9-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <2f9495a5-ef70-46ec-8789-634b72acc072@windriver.com>
Date: Thu, 25 Jun 2020 09:02:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200623095136.24854-9-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0126.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::35) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0126.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20 via Frontend Transport; Thu, 25 Jun 2020 13:02:16 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab6f2a1f-d308-41c8-f131-08d81907fc82
X-MS-TrafficTypeDiagnostic: BN6PR11MB4161:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB41619DB8CD9B8742045E9E9F9F920@BN6PR11MB4161.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-Forefront-PRVS: 0445A82F82
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fYO80cWExyPOARhQoXEP4AZFPBp+JJKNnkptndTubfAzdkbl9JnFgjQ/MlZXJ/AEDVIhvcGEn69VYAt2OCnK5amq2xsJ+TZVd6n4X0Q/DnVtXupefXXi8ZDhmPCsSmVl1iUUZc8XAFNkCDM+2Zrma15r7Uj/pggcbEYrmp4m3PEBkWfrFW6ZTYcroeec5lC5Zo1cJldCPERxTpZOrFLvEadGOzIOyIltuTrStYsnxrDsYKQoVGGs4gUqVXFhAYgwP+kYLsP5f8vYJS8hWlHyEJVOLnKOm8odIgFP3FThCGYXr3Y3gq7313J5/PfYrPt/qTyp44tnUty+loXDHTJKRm/9Z+vZWegq6l9ZLC+L1mreLnZIxsO1Ow2+xVms4GqkIViELrO2IabWX1H1gCWEWgobtddMO8TB7D985w2g0BECBYXH43ioS+XYbxSgguJ0VN5rw4sh8sN6yYRYzQrKrA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(396003)(346002)(136003)(366004)(376002)(8676002)(53546011)(6486002)(66556008)(16526019)(86362001)(33964004)(316002)(66946007)(66476007)(52116002)(166002)(186003)(2906002)(26005)(8936002)(83380400001)(966005)(2616005)(956004)(31696002)(31686004)(44832011)(478600001)(16576012)(36756003)(5660300002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	SO7WNGpa8M0VTIceh//SdEgyHIYli4Yz3sPL807iRD8kyiNrMxSVp5uDFB9qKC9+Xu/55PmGnsjUX+FX6xMjPsn6hxVwjK4vqRRSWrTlRAkQKt7WbQZdrIIKd9GrFc+BCIT1V9aZEW5j1uOzaFzwRNh3qSxXOwsAyOoxGKKca/uXkyB+8RtXhI/OlAThLdYhmWpYAmMHMVt3DJdYrV+RBm6j7/gmapZ2bU70+X+8cf2T+bb8MUtXjbWhA8LoTQD39LNVzIFWrEdrnpVyhBdvoBzROb40zY4xClj2KD155iYAC6w0NET4hGJ4eSRL0mjMbA9PXIhkRjpJwDTOjJrcqKajoES4HTiZY22+X+0CDH1e6tGnhf+TLk4aDQq9u2A0nCQWTniaapXXZ7l5Bi3LvlEpEKWvR5PtFbZ7ThaDENJsKElFwqijO4GmJi2yDjw348n6RB3RGi2JPyIe3r0suv+IVQxZ6z3m0/sWLT+BJvWvn8q9r6Ay5bk5kbDlMWCI
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab6f2a1f-d308-41c8-f131-08d81907fc82
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB0003.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2020 13:02:16.7405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1BNqrqSXQrh/EWH8QUFRF/XU/pYrAED2Hp8UR6jy1B1sKEzkdUg0OHb07ZfU5bzHJj+U7de1INGf0VQI58TgBPpLydNfaHQxUDo1HuO8zv4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4161
Content-Type: multipart/alternative;
 boundary="------------1D45E533A2D361DD5E1BD62B"
Content-Language: en-US

--------------1D45E533A2D361DD5E1BD62B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/23/20 5:51 AM, Leon Anavi wrote:
> Upgrade to release 3.5:
>
> - Fixed memory leaks
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-spidev_3.4.bb => python3-spidev_3.5.bb}   | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-spidev_3.4.bb => python3-spidev_3.5.bb} (82%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-spidev_3.4.bb b/meta-python/recipes-devtools/python/python3-spidev_3.5.bb
> similarity index 82%
> rename from meta-python/recipes-devtools/python/python3-spidev_3.4.bb
> rename to meta-python/recipes-devtools/python/python3-spidev_3.5.bb
> index 334d658d6..ca5a1eb52 100644
> --- a/meta-python/recipes-devtools/python/python3-spidev_3.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-spidev_3.5.bb
> @@ -10,7 +10,7 @@ LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
>   SRCNAME = "spidev"
>   
> -SRC_URI[md5sum] = "bbab6352449f1d572cc9eefeafc58bd1"
> -SRC_URI[sha256sum] = "4314e52f573d95233c907f307558893313a8a606e197e77bb711526b0e179e80"
> +SRC_URI[md5sum] = "7007e4fff2750025e233d8dfe46be670"
> +SRC_URI[sha256sum] = "8a7f5c289f161ea2ac4697fa8a10918232c990678dd0053084b3c43b1363910d"
>   
>   inherit pypi setuptools3
>
> 

--------------1D45E533A2D361DD5E1BD62B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/23/20 5:51 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200623095136.24854-9-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 3.5:

- Fixed memory leaks

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200623095136.24854-9-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-spidev_3.4.bb =&gt; python3-spidev_3.5.bb}   | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-spidev_3.4.bb =&gt; python3-spidev_3.5.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-spidev_3.4.bb b/meta-python/recipes-devtools/python/python3-spidev_3.5.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-spidev_3.4.bb
rename to meta-python/recipes-devtools/python/python3-spidev_3.5.bb
index 334d658d6..ca5a1eb52 100644
--- a/meta-python/recipes-devtools/python/python3-spidev_3.4.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-spidev_3.5.bb
@@ -10,7 &#43;10,7 @@ LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://${COREBASE}/meta/files/common-licenses/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302">&quot;file://${COREBASE}/meta/files/common-licenses/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302&quot;</a>
 SRCNAME = &quot;spidev&quot;
 
-SRC_URI[md5sum] = &quot;bbab6352449f1d572cc9eefeafc58bd1&quot;
-SRC_URI[sha256sum] = &quot;4314e52f573d95233c907f307558893313a8a606e197e77bb711526b0e179e80&quot;
&#43;SRC_URI[md5sum] = &quot;7007e4fff2750025e233d8dfe46be670&quot;
&#43;SRC_URI[sha256sum] = &quot;8a7f5c289f161ea2ac4697fa8a10918232c990678dd0053084b3c43b1363910d&quot;
 
 inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------1D45E533A2D361DD5E1BD62B--

Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.60])
 by mx.groups.io with SMTP id smtpd.web12.9289.1592405150154809929
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jun 2020 07:45:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=pifJFD5J;
 spf=pass (domain: windriver.com, ip: 40.107.220.60, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MaIqKTE3sS5s6ReJZ9291P27NonKlYyOPDJ4bnyTFuMs9CAsFNLQxoIW72vQSGGu1uKEqrnxlT2+VwuuyxOUkWPaTfUeoUCTf4gmHzWdLSRXVH5SI4p5gjIJ8ZNzTJ4i8LEluFry80IlcxGx1H5PpH613I2voz3ztZaWhxkHVUch8fc5NK9oFP0Nh6JVShp2X3zldNyt7aQwSbMouAVbBCnedaiSFYZTyz0Z0WpU82V58+HZk1vMvTQHOfHiZaJQhItVdd570wha4aAbX34qka4b1hSu0DUwZWwI1Zp3Kone9pkAt4rVpu3UYPt+NX3u6uCoyEHCyX3k8Boo2KXCMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y8GPZbsOIMZbiHO5F4cm1Q5zSDT3RTweoMqgvQ/xGAo=;
 b=R6G+NsLfxq4PUBJAh6boSHwe2dpRURPfXqydGtGrFO9rlAIy6+hU3CT5myJgYUn3rcZ+KWZplEvjV+l/+VIe7tcGFgdbmVkoWB66hKDyC6ATh6m/oA9Pqlj2hFJ11CvT4uz004M+oV8TPHLm8iPjEvlxGovBiSZWftXiW3KFY9NXMRRgUu8MW6yCVuh5drmAPS0dMAMdnLvPa3QZKZDMr6NxhnPYWtJJJY735DS/SzvvjVlMxWes4vdJ10HMV/cL0qzuFu+s+tXndun9YuHGNMmNtDzyTbkYHk88ejhaCtsx568KI1SHZ+slNLjJml4F00KeQyxslYssNzFmvbx5Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y8GPZbsOIMZbiHO5F4cm1Q5zSDT3RTweoMqgvQ/xGAo=;
 b=pifJFD5JlsxJB3wW/Yh143m9AAHlyT79ml1S5f4w/JZpzLUrowIv8+P6VGvQybkP6snOg8YyT9u+XOLQMj6LOYRYDVtGU1/Dgd4jXbZUdbdo8KLtcL6Ebx9wFJSucp7GU4C8eCQ8faPTL93grdO7WINLojRyxyD4rg1BJBzX78E=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB4162.namprd11.prod.outlook.com (2603:10b6:405:84::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.24; Wed, 17 Jun
 2020 14:45:49 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.021; Wed, 17 Jun 2020
 14:45:49 +0000
Subject: Re: [oe] [meta-python][PATCH] python-kconfiglib.inc: Remove
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200615164918.822-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <ebad0852-02f3-41ae-4974-d4d6d0c23339@windriver.com>
Date: Wed, 17 Jun 2020 10:45:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200615164918.822-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0140.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::19) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0140.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.21 via Frontend Transport; Wed, 17 Jun 2020 14:45:48 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e19d4fca-30cc-4f72-8e48-08d812cd2005
X-MS-TrafficTypeDiagnostic: BN6PR11MB4162:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB4162A537835B52346DABA7C59F9A0@BN6PR11MB4162.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:353;
X-Forefront-PRVS: 04371797A5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	r361icJboI2+6UqorkWJmLh79ziw+cUWA3zFDTGIHnXpE9wUKHo0P8+Vu2BQungb7l71DCYKYGHtG9mN4I6Pqa879yDLmUhDr3Dn8txAW3PNA2/fBbgmLuv1tA8FTMC0He4meZDEBrFPh3q0h+nWYBJCVVRpy3MwJR1erclYPE9Ix9m92D6Svc+pYDmmisFSAOf4giV982JBSAV3Zs2HHXBuDI4T+pOXDpfI1ElDF1ZK6/PVsWeQo/9xrF/iOcSrFJAGRZu1fnGapwSBSxyqYBfw1JH35Fzq5kcJgLBNvRVhqWuNBEMX+S8DOYcDBEgF0WkFxe6YdpZBaFLxNNTv44u65PFxZYE+5zuJoQDWp41x23AeqbI//9StrL4tY7XnqU/pRt5wb903gMNpg4e57F/XVTvN6/EirlcozcQwUnF+eg9CuHDFKVGoLUrx2BpsthKuoAPG9ysqvFuj8VYp+Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(366004)(39850400004)(396003)(346002)(376002)(53546011)(52116002)(31686004)(6486002)(33964004)(83380400001)(44832011)(66476007)(66946007)(966005)(26005)(16526019)(66556008)(186003)(5660300002)(6666004)(16576012)(86362001)(166002)(8676002)(31696002)(36756003)(316002)(478600001)(2616005)(8936002)(2906002)(956004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	NuFns75ET3q3EZK3SpT9vEDfMwRfRDXICl6cMIXxJ09pOjfrrJuH41tBZSL5HfPfUOmuN5bdzU/TVpP5UnbERZv87JBzndInZhqJMUT3Cs7X9lHrSBmuZETj0X/UQ/32J9SeLOKesooKzj4BzDHmoM08IdXIswrPqNaPqhb8Nppk1GqkarceIxi5wMUGsN7kCLLjdbtPj2JQF/3lrX9gXqKYnc7xrYlSSoEaPHL3HXw0R3+AqhlhswalGLuTa3ca7WzJP17oQrXzouJDgpA4g6NHcmwdV9Po4O6Oj0GaF9wzoXpnph5mUyJmupF9nGLUbSJ+MUhebCGju78mhm/XhzlRHY+Mzhlpm/Wwl0/Xeluqq6KJ0a+7y50z5gKiNHdFk2d+6gmaCRCCV7naCN6sKnM7k06wNxrIWc1tilNJcw22V+zbHJwKL+N1K8qMf+7CKeKPLKhtKkMZl9xRIA62krh0rFBnwI9+Bq4yMsNG1ydHyVcN5F6dlHHm+/oHSoqO
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e19d4fca-30cc-4f72-8e48-08d812cd2005
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2020 14:45:48.9183
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U29CpN4yOkJYr8zOpltM3MsnrO6izsWkqturJqd99DTxyW45YGFkCYgPfSY+bAKLvXxIdoZwTibKm31TWXBtZvRw8c7vzj0HPLqjg73HsMc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4162
Content-Type: multipart/alternative;
 boundary="------------9CCD48E79666A48E7774924F"
Content-Language: en-US

--------------9CCD48E79666A48E7774924F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/15/20 12:49 PM, Leon Anavi wrote:
> Remove inc file because the recipe python3-kconfiglib has been
> alredy consolidated in a single file. I forgot to delete the
> inc file in the previous commit.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   meta-python/recipes-devtools/python/python-kconfiglib.inc | 8 --------
>   1 file changed, 8 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-kconfiglib.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-kconfiglib.inc b/meta-python/recipes-devtools/python/python-kconfiglib.inc
> deleted file mode 100644
> index 3dc4961c8..000000000
> --- a/meta-python/recipes-devtools/python/python-kconfiglib.inc
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -DESCRIPTION = "Kconfiglib is a Kconfig implementation in Python"
> -LICENSE = "ISC"
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=712177a72a3937909543eda3ad1bfb7c"
> -
> -SRC_URI[md5sum] = "4ad68618824d4bad1d1de1d7eb838bba"
> -SRC_URI[sha256sum] = "bed2cc2216f538eca4255a83a4588d8823563cdd50114f86cf1a2674e602c93c"
> -
> -BBCLASSEXTEND = "native nativesdk"
>
> 

--------------9CCD48E79666A48E7774924F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/15/20 12:49 PM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200615164918.822-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Remove inc file because the recipe python3-kconfiglib has been
alredy consolidated in a single file. I forgot to delete the
inc file in the previous commit.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200615164918.822-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 meta-python/recipes-devtools/python/python-kconfiglib.inc | 8 --------
 1 file changed, 8 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-kconfiglib.inc

diff --git a/meta-python/recipes-devtools/python/python-kconfiglib.inc b/meta-python/recipes-devtools/python/python-kconfiglib.inc
deleted file mode 100644
index 3dc4961c8..000000000
--- a/meta-python/recipes-devtools/python/python-kconfiglib.inc
&#43;&#43;&#43; /dev/null
@@ -1,8 &#43;0,0 @@
-DESCRIPTION = &quot;Kconfiglib is a Kconfig implementation in Python&quot;
-LICENSE = &quot;ISC&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=712177a72a3937909543eda3ad1bfb7c">&quot;file://LICENSE.txt;md5=712177a72a3937909543eda3ad1bfb7c&quot;</a>
-
-SRC_URI[md5sum] = &quot;4ad68618824d4bad1d1de1d7eb838bba&quot;
-SRC_URI[sha256sum] = &quot;bed2cc2216f538eca4255a83a4588d8823563cdd50114f86cf1a2674e602c93c&quot;
-
-BBCLASSEXTEND = &quot;native nativesdk&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------9CCD48E79666A48E7774924F--

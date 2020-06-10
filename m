Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.67])
 by mx.groups.io with SMTP id smtpd.web10.3048.1591818826311348248
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jun 2020 12:53:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=hS8Ya/54;
 spf=pass (domain: windriver.com, ip: 40.107.237.67, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NwRzHp8mJWsRdJjyVL3tk+yTkDEw63UebzRovUscdAm8ey6xunhZShuKRr8zH78ocQM/v9o6604BirjYj4TbvT0cK+AvD3yJGRyVl19d+J06XNW+m3/med9nUsNofhdTM7d2HPorXK1ZduJJiP6GOpvu2hIM42Sx4E2C5TqW+k5lgdKzDtWmmRetiCR/q5Lpm1Tw6oK2SNXG4LevbvWWIgec9DEU9Uc3onbcjrhTUGk1JLT1NAN++0VvFpX3TXsUUFmKxoMx1oBA8+8XLuBLuTToQ76VToR1Gr6mayG1w7K2MHco+1IEJZFEJDD2zyMq2bC8sZLq/zmVw8v6oKTY6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rfq5UQfJuoff83ejVZJ044/xnn7gpxQ+sh5YCVmyFDg=;
 b=B5F7F0hVG7/LpBJ5aeduLoyY77f1/7HCuVuYDTNI/CzKnf6MsSG1O++jrRzDYxfYv+6C+B5WzOvWxnZVdp5E4j5lee4YooY0saOC4SG7xS1xDCIwYH9qwTyJ9znrBe7pp1+PamY7VvgB5FIrqlTbrYPFFH4HlxEFCssxmq434p4p+5xPPZLGtw0sh4RolqXSTZvNLnWjSpVaB2XNrunS0qjZbCmGZjnbeV1d9SDyZ4YvZFkpxz6ZoTHmkvyQcBibHtdJeGwbznOrZ5hRQj+ipXoCAtNGrOXBevuVly8IgVSO68LgQ5LL/KCX9bSpueZtX8bgk5XNBBhYHvBDRo8xqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rfq5UQfJuoff83ejVZJ044/xnn7gpxQ+sh5YCVmyFDg=;
 b=hS8Ya/54dZL3ojNkzura43tbwqCNmbGdVTjsV/iZyDrAkoiTpJ9ILgTdMUX6sg0wH1/utBHO1JmRBgqxTxa4emOTiPRzykLtuYJRGR+Mg1DawfpAHKC9iT/MgkUL4242j0pgoH/CoQW7lJizkYWOK9+wIMp7+CjGTvPRaeMQnJk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1700.namprd11.prod.outlook.com (2603:10b6:404:47::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.22; Wed, 10 Jun
 2020 19:53:45 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3088.021; Wed, 10 Jun 2020
 19:53:44 +0000
Subject: Re: [oe] [meta-python][PATCH 2/3] python3-bitarray: Upgrade 1.2.1 -> 1.2.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200609134311.13299-1-leon.anavi@konsulko.com>
 <20200609134311.13299-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <e79e260f-17e9-a64b-26ca-d17b113c1848@windriver.com>
Date: Wed, 10 Jun 2020 15:53:38 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200609134311.13299-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0115.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::24) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0115.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18 via Frontend Transport; Wed, 10 Jun 2020 19:53:40 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f2d8e4b7-ab53-4703-8370-08d80d77f91b
X-MS-TrafficTypeDiagnostic: BN6PR11MB1700:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB17007B54E885D5351D5DFCB59F830@BN6PR11MB1700.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-Forefront-PRVS: 0430FA5CB7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	48lKwKBR+9c+d1SF9h1gum/wEYLx01P9Iqo/eitr36r/rRHwFZSvbHDR/NQV5qtWVq9H55SC8qjQyxWx2/2KgmOfPxeqPvVKRKUQTXgeUyg5mIpZG3PRqtaqIUgkQSM6ZK1WWDvniW9EfDWNe2jOCmm4cHn7j+jtMnbskaBye81VvVICtHrCmA5qkGXwcMWb45KVxWT6rHGVdoOHhEBHLnaREenkdZGOd1rO1/HOY+zjg3yljfmB7PkN5BTen+ORz0tfm2E/+99l9sNkCnVpidTcWl4+6o9OB5dxLWKjtpEHKOumVpJ4ustDVc9l1hm3ZgZSs0Vhnt5Xl7NbetTi2/Sh7uHQPUtSEEyW7n0s/2M8rDQeogHF2kmJs6QCWP+T3W2TmH8PxIQ7xB4FGLjXc7+DiNmALyurOKwxv6lnbq0lXcx0wJst38US5ZAcCd+lNR//ppyMNxJOQzXQxF3q4A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(366004)(396003)(376002)(136003)(39850400004)(66556008)(52116002)(66946007)(2906002)(33964004)(66476007)(31696002)(31686004)(53546011)(86362001)(186003)(956004)(966005)(16576012)(83380400001)(8936002)(2616005)(6486002)(8676002)(36756003)(5660300002)(26005)(16526019)(44832011)(166002)(316002)(478600001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	kR38s1ZVrJ0YT4yVEjvaDezPxTGQPmBdddYUcXI3uO/HYZjGopELz3v3/K7dbpI0OcoS80UnMEm6eld1WNYkJNflVQXOGBb+CL75JL4cxFJ/TC+5eX09542LaI3FwaluiRQsvSF8leVKkJ7Pf2WggH76+li2FHmEn1YJsf29enR8yCx1RNONK71FDSoax5Z0jEW4ZnPP09BqNDAuhSMW7A9zt09/N6hiou4XIdy90ZnhD5aNsvSHWan0jNZYqJMJcNIs6+a+jj1PDgP8u6F7Y2ZR1ghX6ENv0M5KinEBVxhcOglWe+YwX3IM15HgCuePaj3P3uFkTuqNtPmo2W88puF0GhCwAEPGNgmH5ExsWvLcqEu4aOT9C38RTTrnuiO9fWPJSKDzQUjmF9eYfZL+W+yLivvYjE1SgVsS8ID19AnN7awG2s1ljezGoDqc0kTMnFqsLbuPLu44a7FXyc9Hg+p0C6OHDL/G1FfQuOj57ndm3+BcOwXz+d5VVkDlQXg5
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2d8e4b7-ab53-4703-8370-08d80d77f91b
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2020 19:53:43.0309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GY2ZTrzuZnGfrbULfwPRBjVCB3Jp+T1L9o3uUJDb46BHRFFYoX+ujE0QoN/DmPwyWyRghNvBRixW0YtelsedTX1UfRbRBQcIKUBBAG27iIw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1700
Content-Type: multipart/alternative;
 boundary="------------6EEDD56FF5C39D38437D5BAA"
Content-Language: en-US

--------------6EEDD56FF5C39D38437D5BAA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/9/20 9:43 AM, Leon Anavi wrote:
> Upgrade to release 1.2.2. Change license checksum because of the
> updated metadata stored in PKG-INFO. The license remains PSF.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python3-bitarray_1.2.1.bb | 11 -----------
>   .../recipes-devtools/python/python3-bitarray_1.2.2.bb | 11 +++++++++++
>   2 files changed, 11 insertions(+), 11 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python3-bitarray_1.2.1.bb
>   create mode 100644 meta-python/recipes-devtools/python/python3-bitarray_1.2.2.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-bitarray_1.2.1.bb b/meta-python/recipes-devtools/python/python3-bitarray_1.2.1.bb
> deleted file mode 100644
> index 2bf2937d1..000000000
> --- a/meta-python/recipes-devtools/python/python3-bitarray_1.2.1.bb
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -SUMMARY = "A high-level Python efficient arrays of booleans -- C extension"
> -HOMEPAGE = "https://github.com/ilanschnell/bitarray"
> -LICENSE = "PSF"
> -LIC_FILES_CHKSUM = "file://PKG-INFO;md5=dc301a25ebe210dcc53b0a2d5a038eae"
> -
> -SRC_URI[md5sum] = "a46bf869f6adf34f5b0dc82b469793b7"
> -SRC_URI[sha256sum] = "2ed675f460bb0d3d66fd8042a6f1f0d36cf213e52e72a745283ddb245da7b9cf"
> -
> -inherit setuptools3 pypi
> -
> -BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python3-bitarray_1.2.2.bb b/meta-python/recipes-devtools/python/python3-bitarray_1.2.2.bb
> new file mode 100644
> index 000000000..c495738c4
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-bitarray_1.2.2.bb
> @@ -0,0 +1,11 @@
> +SUMMARY = "A high-level Python efficient arrays of booleans -- C extension"
> +HOMEPAGE = "https://github.com/ilanschnell/bitarray"
> +LICENSE = "PSF"
> +LIC_FILES_CHKSUM = "file://PKG-INFO;md5=d331e1d54f5e78247388f5416c2ab928"
> +
> +SRC_URI[md5sum] = "81c48852b0bc538ac3ed25fae020360c"
> +SRC_URI[sha256sum] = "27a69ffcee3b868abab3ce8b17c69e02b63e722d4d64ffd91d659f81e9984954"
> +
> +inherit setuptools3 pypi
> +
> +BBCLASSEXTEND = "native nativesdk"
>
> 

--------------6EEDD56FF5C39D38437D5BAA
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/9/20 9:43 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200609134311.13299-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.2.2. Change license checksum because of the
updated metadata stored in PKG-INFO. The license remains PSF.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200609134311.13299-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python3-bitarray_1.2.1.bb | 11 -----------
 .../recipes-devtools/python/python3-bitarray_1.2.2.bb | 11 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;
 2 files changed, 11 insertions(&#43;), 11 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-bitarray_1.2.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-bitarray_1.2.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_1.2.1.bb b/meta-python/recipes-devtools/python/python3-bitarray_1.2.1.bb
deleted file mode 100644
index 2bf2937d1..000000000
--- a/meta-python/recipes-devtools/python/python3-bitarray_1.2.1.bb
&#43;&#43;&#43; /dev/null
@@ -1,11 &#43;0,0 @@
-SUMMARY = &quot;A high-level Python efficient arrays of booleans -- C extension&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/ilanschnell/bitarray">&quot;https://github.com/ilanschnell/bitarray&quot;</a>
-LICENSE = &quot;PSF&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;md5=dc301a25ebe210dcc53b0a2d5a038eae">&quot;file://PKG-INFO;md5=dc301a25ebe210dcc53b0a2d5a038eae&quot;</a>
-
-SRC_URI[md5sum] = &quot;a46bf869f6adf34f5b0dc82b469793b7&quot;
-SRC_URI[sha256sum] = &quot;2ed675f460bb0d3d66fd8042a6f1f0d36cf213e52e72a745283ddb245da7b9cf&quot;
-
-inherit setuptools3 pypi
-
-BBCLASSEXTEND = &quot;native nativesdk&quot;
diff --git a/meta-python/recipes-devtools/python/python3-bitarray_1.2.2.bb b/meta-python/recipes-devtools/python/python3-bitarray_1.2.2.bb
new file mode 100644
index 000000000..c495738c4
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-bitarray_1.2.2.bb
@@ -0,0 &#43;1,11 @@
&#43;SUMMARY = &quot;A high-level Python efficient arrays of booleans -- C extension&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/ilanschnell/bitarray">&quot;https://github.com/ilanschnell/bitarray&quot;</a>
&#43;LICENSE = &quot;PSF&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;md5=d331e1d54f5e78247388f5416c2ab928">&quot;file://PKG-INFO;md5=d331e1d54f5e78247388f5416c2ab928&quot;</a>
&#43;
&#43;SRC_URI[md5sum] = &quot;81c48852b0bc538ac3ed25fae020360c&quot;
&#43;SRC_URI[sha256sum] = &quot;27a69ffcee3b868abab3ce8b17c69e02b63e722d4d64ffd91d659f81e9984954&quot;
&#43;
&#43;inherit setuptools3 pypi
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

--------------6EEDD56FF5C39D38437D5BAA--

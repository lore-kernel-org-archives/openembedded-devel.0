Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.70])
 by mx.groups.io with SMTP id smtpd.web11.10300.1599060746121317097
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2020 08:32:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=DFdIYD4e;
 spf=pass (domain: windriver.com, ip: 40.107.237.70, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hYRzi7QJLeBe8EK9ItkQKZYfBZ4s1yNwvwLGBu8XLLQs7+IKsRdHRnO4xuqYexho8B+pJ2V8gE6bFSI2L3RFVQqLTs5cbKWsLJ0pQZ5dtkgG/+e3QhrXYZ3gZ9/lGUqoqERDxaR9I5UoQOwIu9ji0yynFgPtvVE/7OTq5BBvM/pq98UMoVvsmJkZGvWeQ0zkZphotSBSzRjuzOe7C7OizSBkdj3owQy9rAE30ddBXxSWU8PQO37osag6WjfBOLcRIzJGgL69kJztu3uLef2qbCx4FOQqmkqehYJwoNh80BGFVbh3zYLQr4Kbsy3IaxfVn57WXoC28RclvkBb9ea0lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aNfOBduENCkTpezofETkg9v5x7ifBdsfL/MXOIMruv8=;
 b=Q/jmMROsVXSWrjef1RvsrxfXd2uTGSXr1X+yvsxZ+zJTusq3tDBVxU4nbLyBOxJ3w4TgAjPGGVTVbbBmpM0kZeKbTj89L8xqkZsjMFuoB4WYr0/zwdHC5jY5u7Zu5SdsxVCcYESSIyaRU0PPdGwWANt8+//V+Zp+v6FVNWg8pidVH9r+FsW9rW22yTiyR168D0jEf/6qclQ4sR4CtgQ+Wf/ZAXkBsaZtntO6kK5uxa4sWlRdTtRtGjn+xTPCD6p65Okxd3Fy5LamYMyLn8gtJ+gzO1fl/TWEH4zM+dKU+v00pP2B3rN7/rOvNQ1lHPtaDwF7P1jZ1SyHRRQKIQrysg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aNfOBduENCkTpezofETkg9v5x7ifBdsfL/MXOIMruv8=;
 b=DFdIYD4eRLL7Hn0ChiYauxNfFrhcaJS69QYQ29lf1QBXOGlbMgaelfE0O21baMUGoHes7BX25trigrTakwBTNFZlOG3J/SdDQhcMd7+64cdAl2CJLfPs0rT8myr3JyUvByEwShiJxzOhS8ty+nR/9K7Nhidoo008955xScYol1s=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4008.namprd11.prod.outlook.com (2603:10b6:a03:186::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19; Wed, 2 Sep
 2020 15:32:24 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3348.015; Wed, 2 Sep 2020
 15:32:23 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-pillow: Upgrade 6.2.1 -> 7.2.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200901125132.9501-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <385abcac-8851-a00f-5ff5-b7967ff9f35f@windriver.com>
Date: Wed, 2 Sep 2020 11:32:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200901125132.9501-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0073.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::12) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YT1PR01CA0073.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Wed, 2 Sep 2020 15:32:22 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40c1b1d5-97b5-4c5a-5f94-08d84f55637c
X-MS-TrafficTypeDiagnostic: BY5PR11MB4008:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4008C125A2A89D73E6991DB39F2F0@BY5PR11MB4008.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bveERdKKzrlsJ0TfdPeijrbIAt/QeKuu9uVDcDCaxprcgUXvnGzTeWaTr9HzRKoRQjVHnxQvzD4qlbF65c/OwLoKCrZpEArM66ee74bf0ahLOSUPki9+3KXXKs7JR6NJjnf/VgM2eHeKuMJqUe9CdlpIHsJh2OIxZcx6+IzvqzTSr7CNgvOpEOHq2/4s23GlVFXGzt4ApQeOq4xwfOEChfGBIx4VvlhM1CXRANo8TrhIwImbXaoznvZIZXsudfHeYUr8XjWP67v3+oX+qs4moKBBRf6G1fpbriKqKitlv+RYRVQ9/cmpcorcbzRPXgZy/08HLi1WzxlTfdtwcxKJHyxnj+Wk1U9KRIYRKnCJvdrOPsFf7ueNLcZaln2kymug9dUoDg9BAE0pKrwRKWKeu3I+0ab0dARU1N1GnrG98UmyIWbMxM+xrOInRnvPdjYFGdK+Jkw6vm7ROIR2DYLQ1g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(39850400004)(136003)(346002)(366004)(83380400001)(44832011)(86362001)(316002)(19627235002)(6486002)(31686004)(166002)(66476007)(66946007)(478600001)(33964004)(8676002)(186003)(2616005)(956004)(31696002)(16576012)(53546011)(66556008)(26005)(2906002)(52116002)(966005)(5660300002)(36756003)(8936002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	ulfYhXga1Uo9W1/avZhG/jkev4Ra1uOU830To3QX8qdv/wTIm/OYe3F9a8srCL5+seCZ5GXpciWLLpFR2+Yse4o3pPjjg1TpiMOSXwQuW2G9oUwzvyfO+TmvkhGd6CC0z2dbD0APqBJe71Zc1IEkf3YSZf4gJM2z2/7jDX/EjpDjdkjKtIfOzXhbF2Ag456u/PDRY+5GKN87sDLm67dgqOwjnogSofsjtDYMUKdDBYvziTVrZ8T92SY+PDDvv+vvLGpy5uj7//oQI0KH7n0oBpqDin9wAJ+XosynBLY6fj5JDWz/fOmYssS3Ia53JnaPvy9DRqeUU8SpzV4xLEcadtcK6ryHclX4X8PPMpkYxRX81Skx1B3ZPzQxoVj2oejLbddPs9NjJfEypvKWMXjE1HUGAUKXN3pFb72uWjqboNWNYbAeHwGdlY04bJc//aQS8v6ydf1Q/tpiOL492SN1hYL/jutZLKNi9TenM6XO2cnst9hBiAFQAbmCmQU4nMj332cVpPT22rmdhOhcoX/T2F+JZsWR8ZFscZqICSH5dlmMMcDmUL/Pzi/iB50uQcoNj1uc8gZeUfQHgh3ttLtCf1i401xOzf42ielo1m/kTno8ZZ4+oX4/Cl4N0837nKF1EjiagiHmxYi/UlJ8v0uDpg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40c1b1d5-97b5-4c5a-5f94-08d84f55637c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2020 15:32:23.8671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SqJNnxxg6QzgGQnL34eX+jFq+tdLDqSzIpuO1oO7D1TB8rKxYAzCl2YMWp50ISFuk4nnTDdhJBhkaDCzmH3t+x9Ox06LMlayPHA1QloGFBM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4008
Content-Type: multipart/alternative;
 boundary="------------87A95A1E8C278E3686ACAEE9"
Content-Language: en-US

--------------87A95A1E8C278E3686ACAEE9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/1/20 8:51 AM, Leon Anavi wrote:
> Upgrade to release 7.2.0:
>
> - Do not convert I;16 images when showing PNGs
> - Fixed ICNS file pointer saving
> - Fixed loading non-RGBA mode APNGs with dispose background
> - Deprecated _showxv
> - Deprecate Image.show(command="...")
> - Updated JPEG magic number
> - Change STRIPBYTECOUNTS to LONG if necessary when saving
> - Write JFIF header when saving JPEG
> - Replaced tiff_jpeg with jpeg compression when saving TIFF images
> - Writing TIFF tags: improved BYTE, added UNDEFINED
> - Consider transparency when pasting text on an RGBA image
> - Added method argument to single frame WebP saving
> - Use ImageFileDirectory_v2 in Image.Exif
> - Corrected reading EXIF metadata without prefix
> - Fixed drawing a jointed line with a sequence of numeric values
> - Added support for 1-D NumPy arrays
> - Parse orientation from XMP tags
> - Speed up text layout by not rendering glyphs
> - Fixed ZeroDivisionError in Image.thumbnail
> - Replaced TiffImagePlugin DEBUG with logging
> - Fix repeatedly loading .gbr
> - JPEG: Truncate icclist instead of setting to None
> - Fixes default offset for Exif
> - Fixed bug when unpickling TIFF images
> - Fix pickling WebP
> - Replace IOError and WindowsError aliases with OSError
>
> License-Update: Word wrap and updated copyright year.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../0001-explicitly-set-compile-options.patch | 19 +++++++++++--------
>   ...illow_6.2.1.bb => python3-pillow_7.2.0.bb} |  6 +++---
>   2 files changed, 14 insertions(+), 11 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pillow_6.2.1.bb => python3-pillow_7.2.0.bb} (78%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pillow/0001-explicitly-set-compile-options.patch b/meta-python/recipes-devtools/python/python3-pillow/0001-explicitly-set-compile-options.patch
> index 35aee4214..005fea5c6 100644
> --- a/meta-python/recipes-devtools/python/python3-pillow/0001-explicitly-set-compile-options.patch
> +++ b/meta-python/recipes-devtools/python/python3-pillow/0001-explicitly-set-compile-options.patch
> @@ -1,6 +1,6 @@
> -From 862a981ce462cd83a99e3db9faeeda1f8c64983f Mon Sep 17 00:00:00 2001
> -From: Hongxu Jia <hongxu.jia@windriver.com>
> -Date: Mon, 18 Mar 2019 23:23:55 -0400
> +From 27bfa4028453dc79a72569823e97da8fd1994ffc Mon Sep 17 00:00:00 2001
> +From: Leon Anavi <leon.anavi@konsulko.com>
> +Date: Tue, 1 Sep 2020 11:53:53 +0000
>   Subject: [PATCH] explicitly set compile options
>   
>   OE does not support to install egg package, so
> @@ -10,19 +10,19 @@ explicitly set build_ext options for oe-core's
>   Upstream-Status: Inappropriate [oe specific]
>   
>   Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> -
> +Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>   ---
>    setup.cfg | 12 ++++++++++++
>    1 file changed, 12 insertions(+)
>   
>   diff --git a/setup.cfg b/setup.cfg
> -index 1c6ebc84..1ccc3d69 100644
> +index 19979cf7..ed27dfe1 100644
>   --- a/setup.cfg
>   +++ b/setup.cfg
> -@@ -13,3 +13,15 @@ multi_line_output = 3
> -
> +@@ -11,3 +11,15 @@ multi_line_output = 3
>    [tool:pytest]
> - addopts = -rs
> + addopts = -ra --color=yes
> + testpaths = Tests
>   +
>   +[build_ext]
>   +disable-platform-guessing = 1
> @@ -35,3 +35,6 @@ index 1c6ebc84..1ccc3d69 100644
>   +disable-webp = 1
>   +disable-webpmux = 1
>   +disable-imagequant = 1
> +--
> +2.17.1
> +
> diff --git a/meta-python/recipes-devtools/python/python3-pillow_6.2.1.bb b/meta-python/recipes-devtools/python/python3-pillow_7.2.0.bb
> similarity index 78%
> rename from meta-python/recipes-devtools/python/python3-pillow_6.2.1.bb
> rename to meta-python/recipes-devtools/python/python3-pillow_7.2.0.bb
> index a383a3ff9..13cab4300 100644
> --- a/meta-python/recipes-devtools/python/python3-pillow_6.2.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-pillow_7.2.0.bb
> @@ -3,13 +3,13 @@ Clark and Contributors. PIL is the Python Imaging Library by Fredrik Lundh and \
>   Contributors."
>   HOMEPAGE = "https://pillow.readthedocs.io"
>   LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=55c0f320370091249c1755c0d2b48e89"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=ea2dc3f5611e69058503d4b940049d03"
>   
> -SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=6.2.x \
> +SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=7.2.x \
>              file://0001-support-cross-compiling.patch \
>              file://0001-explicitly-set-compile-options.patch \
>   "
> -SRCREV ?= "6e0f07bbe38def22d36ee176b2efd9ea74b453a6"
> +SRCREV ?= "2bd74943fb9f320def6c066e732b701d1c15f677"
>   
>   
>   inherit setuptools3
>
> 

--------------87A95A1E8C278E3686ACAEE9
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/1/20 8:51 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200901125132.9501-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 7.2.0:

- Do not convert I;16 images when showing PNGs
- Fixed ICNS file pointer saving
- Fixed loading non-RGBA mode APNGs with dispose background
- Deprecated _showxv
- Deprecate Image.show(command=&quot;...&quot;)
- Updated JPEG magic number
- Change STRIPBYTECOUNTS to LONG if necessary when saving
- Write JFIF header when saving JPEG
- Replaced tiff_jpeg with jpeg compression when saving TIFF images
- Writing TIFF tags: improved BYTE, added UNDEFINED
- Consider transparency when pasting text on an RGBA image
- Added method argument to single frame WebP saving
- Use ImageFileDirectory_v2 in Image.Exif
- Corrected reading EXIF metadata without prefix
- Fixed drawing a jointed line with a sequence of numeric values
- Added support for 1-D NumPy arrays
- Parse orientation from XMP tags
- Speed up text layout by not rendering glyphs
- Fixed ZeroDivisionError in Image.thumbnail
- Replaced TiffImagePlugin DEBUG with logging
- Fix repeatedly loading .gbr
- JPEG: Truncate icclist instead of setting to None
- Fixes default offset for Exif
- Fixed bug when unpickling TIFF images
- Fix pickling WebP
- Replace IOError and WindowsError aliases with OSError

License-Update: Word wrap and updated copyright year.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200901125132.9501-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../0001-explicitly-set-compile-options.patch | 19 +++++++++++--------
 ...illow_6.2.1.bb =&gt; python3-pillow_7.2.0.bb} |  6 +++---
 2 files changed, 14 insertions(+), 11 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pillow_6.2.1.bb =&gt; python3-pillow_7.2.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-pillow/0001-explicitly-set-compile-options.patch b/meta-python/recipes-devtools/python/python3-pillow/0001-explicitly-set-compile-options.patch
index 35aee4214..005fea5c6 100644
--- a/meta-python/recipes-devtools/python/python3-pillow/0001-explicitly-set-compile-options.patch
+++ b/meta-python/recipes-devtools/python/python3-pillow/0001-explicitly-set-compile-options.patch
@@ -1,6 +1,6 @@
-From 862a981ce462cd83a99e3db9faeeda1f8c64983f Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
-Date: Mon, 18 Mar 2019 23:23:55 -0400
+From 27bfa4028453dc79a72569823e97da8fd1994ffc Mon Sep 17 00:00:00 2001
+From: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a>
+Date: Tue, 1 Sep 2020 11:53:53 +0000
 Subject: [PATCH] explicitly set compile options
 
 OE does not support to install egg package, so
@@ -10,19 +10,19 @@ explicitly set build_ext options for oe-core's
 Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
-
+Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a>
 ---
  setup.cfg | 12 ++++++++++++
  1 file changed, 12 insertions(+)
 
 diff --git a/setup.cfg b/setup.cfg
-index 1c6ebc84..1ccc3d69 100644
+index 19979cf7..ed27dfe1 100644
 --- a/setup.cfg
 +++ b/setup.cfg
-@@ -13,3 +13,15 @@ multi_line_output = 3
- 
+@@ -11,3 +11,15 @@ multi_line_output = 3
  [tool:pytest]
- addopts = -rs
+ addopts = -ra --color=yes
+ testpaths = Tests
 +
 +[build_ext]
 +disable-platform-guessing = 1
@@ -35,3 +35,6 @@ index 1c6ebc84..1ccc3d69 100644
 +disable-webp = 1
 +disable-webpmux = 1
 +disable-imagequant = 1
+-- 
+2.17.1
+
diff --git a/meta-python/recipes-devtools/python/python3-pillow_6.2.1.bb b/meta-python/recipes-devtools/python/python3-pillow_7.2.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-pillow_6.2.1.bb
rename to meta-python/recipes-devtools/python/python3-pillow_7.2.0.bb
index a383a3ff9..13cab4300 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_6.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_7.2.0.bb
@@ -3,13 +3,13 @@ Clark and Contributors. PIL is the Python Imaging Library by Fredrik Lundh and \
 Contributors.&quot;
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://pillow.readthedocs.io">&quot;https://pillow.readthedocs.io&quot;</a>
 LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=55c0f320370091249c1755c0d2b48e89">&quot;file://LICENSE;md5=55c0f320370091249c1755c0d2b48e89&quot;</a>
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=ea2dc3f5611e69058503d4b940049d03">&quot;file://LICENSE;md5=ea2dc3f5611e69058503d4b940049d03&quot;</a>
 
-SRC_URI = &quot;git://github.com/python-pillow/Pillow.git;branch=6.2.x \
+SRC_URI = &quot;git://github.com/python-pillow/Pillow.git;branch=7.2.x \
            <a class="moz-txt-link-freetext" href="file://0001-support-cross-compiling.patch">file://0001-support-cross-compiling.patch</a> \
            <a class="moz-txt-link-freetext" href="file://0001-explicitly-set-compile-options.patch">file://0001-explicitly-set-compile-options.patch</a> \
 &quot;
-SRCREV ?= &quot;6e0f07bbe38def22d36ee176b2efd9ea74b453a6&quot;
+SRCREV ?= &quot;2bd74943fb9f320def6c066e732b701d1c15f677&quot;
 
 
 inherit setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------87A95A1E8C278E3686ACAEE9--

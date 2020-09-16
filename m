Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.45])
 by mx.groups.io with SMTP id smtpd.web11.22418.1600263456664654388
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Sep 2020 06:37:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Ci97xORR;
 spf=pass (domain: windriver.com, ip: 40.107.223.45, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ckYxZkZGSQAUN8ljEy2yV0jb94q6ciUvNTABOTsQT3EkbItY3QJ6c9M3GunCY/fzeWkyObG6Hyu9Sph1rwkaDkLqPIBxd3ii3JAXS/3+KufH3tQf7ufUA2CtPL+dBRcLKZpej8/S0dvHZX2iFz4ttdxBrZ6wiRKGUyCDg4jIv35iW1Uf/ZOj6VdSszvsjmLWdEGgfe8deYiuAfUFf0JlHNFE0UCmC18rfCST10HuDMTEatCkkRFvPV0JtKOJjFGyYA1e0wCQ2CeYNhrmbGXbn2Gzz2CoPp+vO6r1qFCP/Uieof2mj4rIaoqk2lF9sSXOssyOTCgQMm2myFCJYm02EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7cAqlwYTEAAS7IUFiNCZJZyVyUPnnEV3Tm0CLpSFLQ4=;
 b=RgEDvcNLPjb3TSMHH45KJvRdBxBW3tUmZLpH9Un1RLRQapPBIS1IAQ9rc6GA3uwMLPCkw7DUfHiUgMKLExVeiToMe8QhjOHLfrm7NKMlv9L6/iNinjkv7yAxTRJVX1/gi0KF2PSX1/1gdfXYhb9uapkHK6byI9n4ITLeUkAmUfpUmBRD6e+2ZCa6cipLPveJiL9N2S9RNTnYkQ26bu3XyQJyjEDATtsIDJwShN8kRnxMHyY7yuN/CEzMB6KtSoIfcQy7Ge1x0AHEomE/YilBE80deoH6lZBg4oOAQSWFAqdPRe5ZCH4mH9d4LjKZF+OCW8RxYUndOR74eMglOOSi4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7cAqlwYTEAAS7IUFiNCZJZyVyUPnnEV3Tm0CLpSFLQ4=;
 b=Ci97xORR46LZzP/f/UR5lHX3vFR57HP5QmHsf9Ci/UHVqp8OE1WB9jx6feftaeXjIP1ydw2w07sp9iaJim4osDcw4lD7b7fvge0N+LOuFzTW/4DN1y+rXN9akw3LfBvON489NUqJdJeg36zardfObCcS5g0iQPVZpsNGsp+Eta8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4306.namprd11.prod.outlook.com (2603:10b6:a03:1bb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.17; Wed, 16 Sep
 2020 13:37:35 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3391.014; Wed, 16 Sep 2020
 13:37:35 +0000
Subject: Re: [oe] [meta-python][PATCH 08/10] python3-matplotlib: Upgrade 3.3.1 -> 3.3.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200915090303.14367-1-leon.anavi@konsulko.com>
 <20200915090303.14367-8-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <ce249a8f-fd25-20a7-c9ef-99eccf9ebcd4@windriver.com>
Date: Wed, 16 Sep 2020 09:37:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200915090303.14367-8-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0075.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::14) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0075.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14 via Frontend Transport; Wed, 16 Sep 2020 13:37:34 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c6c4f395-a50a-47eb-3f18-08d85a45ab52
X-MS-TrafficTypeDiagnostic: BY5PR11MB4306:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB43068C87CCDAEB1DD039DE499F210@BY5PR11MB4306.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qnmKh5VyMiQBpPmD65rXj5jv1hrVv38hUZOmLeU+dV6Q1VtqlrsRlfIYYK2oo6ONRqJV6oGOrLOS5T4SXUu8grZMuFhJ66J/Tv+6n1KRy3mciix7cbsY8Fe+TUkVEJ7VusoZBdFh/ITH9CLFEUCKycG0HL1XoZKhHFCVz/zyXvtLb9O8DY0Fm/ic+5T6oWn35k3Q3Tdn/xSzsgKPe2b7UwGHsjuxR6jEQjVVtHG6Bh4DXW+8Rk8bPndEw9u277I0oVQrhX4KtnHfvzqsIlCiSxp3OVmV/UwRGf0AUpicQOiqRX4PPtBCjCqg5Lbf4i59enwmM+2KdQAI/Ba954F0GBceGEo9o1wD36L6Ny676v1W8DePX8Sjj2ac9LUIagi8eZCie7KLvo6XIQUTNgT34iu15houmhWS0+z2H0drpxBvBvvHCMa2v12rOGc040FoDKhYsP0BJ/a974r2HMdQxg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39830400003)(396003)(366004)(136003)(376002)(346002)(83380400001)(956004)(8676002)(5660300002)(2616005)(966005)(53546011)(478600001)(26005)(44832011)(166002)(8936002)(316002)(31686004)(6486002)(86362001)(31696002)(16526019)(66476007)(186003)(52116002)(33964004)(2906002)(66556008)(66946007)(16576012)(36756003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	EESEV1KxdOne6qoBrhgLbi32k0b5/rZrE4aVqMsyqqkvJqBBl3d0DbZ1hvkpxF/yudlpjMc5TLay0+iyShJVLSz5z2FgCwb1YYj7Am1T1yVf/ZcBOOBz05WY3RXuCmQHFcE7Vl/4xM7psuSskoAu3p6PbZT2qyV0EFKesviU21L8Ww6sSTk2D7LXwh0KELISml9tZryQylioMIFn0B6p5dAN+5c4KdrSPJ8uk+aEsY5PUoXsp8HpFKbflSEJFGx+2/3VcIaE2GU9x8q874BuSKaINP9UMSVtkP0bIACAavv4LdAY1bFTZLR/92T//Tiy7vh/+SuAb3jPyL2lWH4g/+GHTyG90/xUxnHtqEgXC7Sh8XCYDc/9O7RzsECBRIyr2JRKcZLwCbbgOcxKTdNOkX4MBZG+zVkKtK/LcddhsKJjGaanLID7Z8ShKrEu/3B7s4Eg2hjHDRP6vvrAOHClw7p1NtmB0/6LanxGKc4R3YAMWlwFtNqphpeW4hWT75wMP6+zNwFr2DWRduJKBNywHW8DnSyXmigwgUFERXtNxPFzA3C2UPAmy/duupwFChcpe1GS1aBK+iiUboMSboW598UbzND7iraZ7o5aPobF+ju59xZisXoLyfYLmojkpeJYZZ1tsM96IkL0z81jhANhbw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6c4f395-a50a-47eb-3f18-08d85a45ab52
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2020 13:37:34.9980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lyWs9wgYYxdCne/etwTr5kS0QCvBkZTZlx163n2XngYS85/ws5BdC4Hy0eR9rBL0BuVzWvbuMmnerZ7M8DFU5nfy5y+fSlYbBN2OQu+2pKg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4306
Content-Type: multipart/alternative;
 boundary="------------21ACA5CB5F9A84FF13F22788"
Content-Language: en-US

--------------21ACA5CB5F9A84FF13F22788
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/15/20 5:03 AM, Leon Anavi wrote:
> Upgrade to release 3.3.2:
>
> - fix Axis scale on twinned Axes
> - fix auto-close of Figures in nbagg
> - fix automatic title placement if Axes is off the Figure
> - fix autoranging of log scales with barstacked histogram
> - fix extra redraws when using Button or TextBox widgets
> - fix imshow with LogNorm and large vmin/vmax ranges
> - fix plotting Pandas DataFrame with string MultiIndex
> - fix scatter with marker=''
> - fix scatter3d color/linewidth re-projection
> - fix state of mode buttons in TkAgg backends
> - include license files in built distribution
> - reduce Visual C++ runtime requirements on Windows
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...hon3-matplotlib_3.3.1.bb => python3-matplotlib_3.3.2.bb} | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-matplotlib_3.3.1.bb => python3-matplotlib_3.3.2.bb} (83%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-matplotlib_3.3.1.bb b/meta-python/recipes-devtools/python/python3-matplotlib_3.3.2.bb
> similarity index 83%
> rename from meta-python/recipes-devtools/python/python3-matplotlib_3.3.1.bb
> rename to meta-python/recipes-devtools/python/python3-matplotlib_3.3.2.bb
> index 6273ee2f2..a2e7074d7 100644
> --- a/meta-python/recipes-devtools/python/python3-matplotlib_3.3.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-matplotlib_3.3.2.bb
> @@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/matplotlib/matplotlib"
>   SECTION = "devel/python"
>   LICENSE = "PSF"
>   LIC_FILES_CHKSUM = "\
> -    file://setup.py;beginline=251;endline=251;md5=e0ef37de7122ce842bcd1fb54482b353 \
> +    file://setup.py;beginline=259;endline=259;md5=e0ef37de7122ce842bcd1fb54482b353 \
>       file://LICENSE/LICENSE;md5=afec61498aa5f0c45936687da9a53d74 \
>   "
>   DEPENDS = "\
> @@ -19,8 +19,8 @@ DEPENDS = "\
>       python3-certifi-native \
>   "
>   
> -SRC_URI[md5sum] = "f3a405f340be5b151cb2042c4d8d16f7"
> -SRC_URI[sha256sum] = "87f53bcce90772f942c2db56736788b39332d552461a5cb13f05ff45c1680f0e"
> +SRC_URI[md5sum] = "a85791908e78818bd425ba9ab38500fa"
> +SRC_URI[sha256sum] = "3d2edbf59367f03cd9daf42939ca06383a7d7803e3993eb5ff1bee8e8a3fbb6b"
>   
>   inherit pypi setuptools3 pkgconfig
>   
>
> 

--------------21ACA5CB5F9A84FF13F22788
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/15/20 5:03 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200915090303.14367-8-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 3.3.2:

- fix Axis scale on twinned Axes
- fix auto-close of Figures in nbagg
- fix automatic title placement if Axes is off the Figure
- fix autoranging of log scales with barstacked histogram
- fix extra redraws when using Button or TextBox widgets
- fix imshow with LogNorm and large vmin/vmax ranges
- fix plotting Pandas DataFrame with string MultiIndex
- fix scatter with marker=''
- fix scatter3d color/linewidth re-projection
- fix state of mode buttons in TkAgg backends
- include license files in built distribution
- reduce Visual C++ runtime requirements on Windows

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200915090303.14367-8-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...hon3-matplotlib_3.3.1.bb =&gt; python3-matplotlib_3.3.2.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-matplotlib_3.3.1.bb =&gt; python3-matplotlib_3.3.2.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-matplotlib_3.3.1.bb b/meta-python/recipes-devtools/python/python3-matplotlib_3.3.2.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-matplotlib_3.3.1.bb
rename to meta-python/recipes-devtools/python/python3-matplotlib_3.3.2.bb
index 6273ee2f2..a2e7074d7 100644
--- a/meta-python/recipes-devtools/python/python3-matplotlib_3.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-matplotlib_3.3.2.bb
@@ -7,7 +7,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/matplotlib/matplotlib">&quot;https://github.com/matplotlib/matplotlib&quot;</a>
 SECTION = &quot;devel/python&quot;
 LICENSE = &quot;PSF&quot;
 LIC_FILES_CHKSUM = &quot;\
-    <a class="moz-txt-link-freetext" href="file://setup.py;beginline=251;endline=251;md5=e0ef37de7122ce842bcd1fb54482b353">file://setup.py;beginline=251;endline=251;md5=e0ef37de7122ce842bcd1fb54482b353</a> \
+    <a class="moz-txt-link-freetext" href="file://setup.py;beginline=259;endline=259;md5=e0ef37de7122ce842bcd1fb54482b353">file://setup.py;beginline=259;endline=259;md5=e0ef37de7122ce842bcd1fb54482b353</a> \
     <a class="moz-txt-link-freetext" href="file://LICENSE/LICENSE;md5=afec61498aa5f0c45936687da9a53d74">file://LICENSE/LICENSE;md5=afec61498aa5f0c45936687da9a53d74</a> \
 &quot;
 DEPENDS = &quot;\
@@ -19,8 +19,8 @@ DEPENDS = &quot;\
     python3-certifi-native \
 &quot;
 
-SRC_URI[md5sum] = &quot;f3a405f340be5b151cb2042c4d8d16f7&quot;
-SRC_URI[sha256sum] = &quot;87f53bcce90772f942c2db56736788b39332d552461a5cb13f05ff45c1680f0e&quot;
+SRC_URI[md5sum] = &quot;a85791908e78818bd425ba9ab38500fa&quot;
+SRC_URI[sha256sum] = &quot;3d2edbf59367f03cd9daf42939ca06383a7d7803e3993eb5ff1bee8e8a3fbb6b&quot;
 
 inherit pypi setuptools3 pkgconfig
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------21ACA5CB5F9A84FF13F22788--

Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.57])
 by mx.groups.io with SMTP id smtpd.web11.9578.1593183723851727687
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jun 2020 08:02:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=M+h9Deuo;
 spf=pass (domain: windriver.com, ip: 40.107.244.57, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DJGTBH0DOkzfFiAr12uZXo4bxfgDgHKVKQRHPKpnxt8+ec13uR5sxdomQbutGke40XhY8BjMBzyHIcgbqfPEHkthqjYXcfm4FNvli5394vON4AImKnDQ2tJ3Dbn1kLQdCPoHvM8g5nQ+5wPv6bjkkSduHY1xkLUE+aVNY+ogosQX2pteTNh4BJgMdZXxGk0LIb11Y/4au6B7nM8daJvspKSwajblpE8A7juRj/5qWBUN6e+gPrbzhFXZzSIvNcW67Y1VsaCeu7PSYFXsYTJhDiPVdVSv9nToihbSqIk4tq+b+YdXQvE3OF9B/VJpu5CGwlNkmLV5ANPDxuf7zax/ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7XSJuJ20idVZb9/oJAeqIednl4pP6KEy0V42X0BPo2M=;
 b=JxrpS428gQXKyYanJfV91RMJRbyXImHMuCyr+5y7iayho0ha2Ur6A5udaURhWi7LP65Orrk7qvaT+aRqkBYmrHNo8LUdPHhyCeJ9YH4Jnbt14vGZH5OKvdfOwUmNc5b3Kp+eI/NrrxEDUGD6pJNOCHXJyl0wcjZfTG/qst+YMnViBQMTlBJT5NX+e03xlwFWyjzjKIU7iDYMudlqe4civMHM5B7moB4mkzISoVWQG6EhBEycxSKVq4L5MqGDsGYjixLdXv15WpLqApYv3OTeA3OMDKmk6+/7oDCh/SFjuA0qpPCHqjG8SyMMJrmFTTxcnkxylvc/vpqb4BZCEzwsqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7XSJuJ20idVZb9/oJAeqIednl4pP6KEy0V42X0BPo2M=;
 b=M+h9DeuosX8KD9TXpo2N0kNAsbHGSD1uIeGmxvsX6GgQRgkqMfA99gegMJf850r9MhK2m58p+MVD/fLSgOV2ix7MPDL2au35hbP4S1BmgkAbvZGrOX6WsepOSn4DlA0K/RnoKqxU97lplPhrB7Rkim7v83xzWfGbUkQehk55RbU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1604.namprd11.prod.outlook.com (2603:10b6:405:e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20; Fri, 26 Jun
 2020 15:02:02 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3131.025; Fri, 26 Jun 2020
 15:02:02 +0000
Subject: Re: [oe] [meta-python][PATCH 09/12] python3-matplotlib: Upgrade 3.2.1 -> 3.2.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200625090719.16068-1-leon.anavi@konsulko.com>
 <20200625090719.16068-9-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <0c9e4c9c-2ee0-b1fa-7e43-7c901b5fa907@windriver.com>
Date: Fri, 26 Jun 2020 11:02:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200625090719.16068-9-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0087.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::26) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0087.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20 via Frontend Transport; Fri, 26 Jun 2020 15:02:02 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 511e498e-32bc-445c-3df7-08d819e1e1f4
X-MS-TrafficTypeDiagnostic: BN6PR11MB1604:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB1604112DACF7B849E61A51CB9F930@BN6PR11MB1604.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-Forefront-PRVS: 0446F0FCE1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dG0zVGPkTPL6oTdib0SgBnkj/BQyF+0G6yoLsI4cRfCFvc0AYPLg7S/4H0EH+8RVizA8tNwHqNtDMOtiUd1QdlYirQ8UzcMM6uMZqX/aZIRTPp0PA6w6z3DP5AxNE01BsLVPRe3sZRE9IrXxE7Xw81bnviYAtmynTr2MID/iqQ7KHD10nuNBhB1fxUMg71ETqpwqnuOid8fcFH4/r4dEyUJlL5izfzbZh+37IYuV4qZ6BnYum9TEMB1wb6lhBnLdF6VMGFoCTmCCpEwJgmpr/80TAfsxsFaL/rxA77r3MezG2nwo5O3Icq7X1K4d/hfcxE0QALZaj8HSIv8ojxlwmq5IdRzuKn3t7HTIIRRen5txD7hxD13NaZOwpedZv7cUUIHK8cMWO8j0RQBLabyiYqZBCOJGxm/QE7/BY3puOqP7mwmNibRbXN3Iq/YUmFsyqgdozrkHTWwsl8H7Xatqfg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(346002)(136003)(396003)(376002)(39850400004)(2616005)(956004)(31686004)(66556008)(66946007)(44832011)(83380400001)(6486002)(86362001)(16576012)(31696002)(166002)(316002)(966005)(66476007)(53546011)(8936002)(8676002)(36756003)(2906002)(186003)(478600001)(5660300002)(33964004)(16526019)(26005)(52116002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	rX9sWMd5NlsFvx1egB84vwTayV5TDRcdOvRmTG6i2Zzyhsp66Wh8QMk32gn9thp42iBFjiQWId3TazBQXqORIGQZBSyjmvjrFpPq7Ow8/1U3NzulAdGCGiUActJbjETGT0BwpikmCVGxUw4db3gFu+IYVFCOXJt73+yYxUBxjkDFFIqJmtsBej0oYIA3PCa+QdaAJVjsSBiSMLHyXbORkVSlZ5dv7x2px0TRQSoHDflbWmv9NBpJ3/5mbKs3WeqcNChYqclmhIEN1kvDjdS02OlGBPPOrdfQLUpeuKteVsH+MK/MzQN/dUXhUu9fMLOerzBuyszQafR182yjXX2JlEaVkTQd4+08brcIwbGfuJwOjeoVjH31U6u9J9nX9ANR9yGdvzscAhqiLVf//nsbcq8w4EBr+9C27UT4CyP23Rr682sby+1jXen1m3QVNOr5AlUvIMj+FfkN1h2PSS8myrsjv8YA/azCDGWDsFtAlcc=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 511e498e-32bc-445c-3df7-08d819e1e1f4
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB0003.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2020 15:02:02.5039
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FKAFhEfYbIUF9NeFH7aMR3cDu4SMxhlSm8e5nbswLKulVy9hF1HsT1TtXVw8iIXv0kK7UufkbhkzGbUsyfynPSCYR/mH+ZgXwfU72WPzoMA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1604
Content-Type: multipart/alternative;
 boundary="------------FA5E1FA8FC813CABEDC491CA"
Content-Language: en-US

--------------FA5E1FA8FC813CABEDC491CA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/25/20 5:07 AM, Leon Anavi wrote:
> Upgrade to release 3.2.2:
>
> - Unit converters recognize subclasses
> - imsave accepts metadata and PIL options
> - cbook.normalize_kwargs
> - FontProperties accepts os.PathLike
> - Gouraud-shading alpha channel in PDF backend
> - Kerning adjustments now use correct values
> - bar3d lightsource shading
> - Shifting errorbars
> - Improvements in Logit scale ticker and formatter
> - rcParams for axes title location and color
> - 3-digit and 4-digit hex colors
>
> The line in setup.py for determining the license has changed.
> The license remains the same.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...hon3-matplotlib_3.2.1.bb => python3-matplotlib_3.2.2.bb} | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-matplotlib_3.2.1.bb => python3-matplotlib_3.2.2.bb} (79%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-matplotlib_3.2.1.bb b/meta-python/recipes-devtools/python/python3-matplotlib_3.2.2.bb
> similarity index 79%
> rename from meta-python/recipes-devtools/python/python3-matplotlib_3.2.1.bb
> rename to meta-python/recipes-devtools/python/python3-matplotlib_3.2.2.bb
> index f6d8c53d0..b32177d9b 100644
> --- a/meta-python/recipes-devtools/python/python3-matplotlib_3.2.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-matplotlib_3.2.2.bb
> @@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/matplotlib/matplotlib"
>   SECTION = "devel/python"
>   LICENSE = "PSF"
>   LIC_FILES_CHKSUM = "\
> -    file://setup.py;beginline=250;endline=250;md5=2a114620e4e6843aa7568d5902501753 \
> +    file://setup.py;beginline=253;endline=253;md5=2a114620e4e6843aa7568d5902501753 \
>       file://LICENSE/LICENSE;md5=afec61498aa5f0c45936687da9a53d74 \
>   "
>   DEPENDS = "\
> @@ -18,8 +18,8 @@ DEPENDS = "\
>       python3-pytz-native \
>   "
>   
> -SRC_URI[md5sum] = "6c018a644a88120886cc7211f7c826f0"
> -SRC_URI[sha256sum] = "ffe2f9cdcea1086fc414e82f42271ecf1976700b8edd16ca9d376189c6d93aee"
> +SRC_URI[md5sum] = "b60cd68f792a30173d825e16482aedd8"
> +SRC_URI[sha256sum] = "3d77a6630d093d74cbbfebaa0571d00790966be1ed204e4a8239f5cbd6835c5d"
>   
>   inherit pypi setuptools3 pkgconfig
>   
>
> 

--------------FA5E1FA8FC813CABEDC491CA
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/25/20 5:07 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200625090719.16068-9-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 3.2.2:

- Unit converters recognize subclasses
- imsave accepts metadata and PIL options
- cbook.normalize_kwargs
- FontProperties accepts os.PathLike
- Gouraud-shading alpha channel in PDF backend
- Kerning adjustments now use correct values
- bar3d lightsource shading
- Shifting errorbars
- Improvements in Logit scale ticker and formatter
- rcParams for axes title location and color
- 3-digit and 4-digit hex colors

The line in setup.py for determining the license has changed.
The license remains the same.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200625090719.16068-9-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...hon3-matplotlib_3.2.1.bb =&gt; python3-matplotlib_3.2.2.bb} | 6 &#43;&#43;&#43;---
 1 file changed, 3 insertions(&#43;), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-matplotlib_3.2.1.bb =&gt; python3-matplotlib_3.2.2.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-matplotlib_3.2.1.bb b/meta-python/recipes-devtools/python/python3-matplotlib_3.2.2.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-matplotlib_3.2.1.bb
rename to meta-python/recipes-devtools/python/python3-matplotlib_3.2.2.bb
index f6d8c53d0..b32177d9b 100644
--- a/meta-python/recipes-devtools/python/python3-matplotlib_3.2.1.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-matplotlib_3.2.2.bb
@@ -7,7 &#43;7,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/matplotlib/matplotlib">&quot;https://github.com/matplotlib/matplotlib&quot;</a>
 SECTION = &quot;devel/python&quot;
 LICENSE = &quot;PSF&quot;
 LIC_FILES_CHKSUM = &quot;\
-    <a class="moz-txt-link-freetext" href="file://setup.py;beginline=250;endline=250;md5=2a114620e4e6843aa7568d5902501753">file://setup.py;beginline=250;endline=250;md5=2a114620e4e6843aa7568d5902501753</a> \
&#43;    <a class="moz-txt-link-freetext" href="file://setup.py;beginline=253;endline=253;md5=2a114620e4e6843aa7568d5902501753">file://setup.py;beginline=253;endline=253;md5=2a114620e4e6843aa7568d5902501753</a> \
     <a class="moz-txt-link-freetext" href="file://LICENSE/LICENSE;md5=afec61498aa5f0c45936687da9a53d74">file://LICENSE/LICENSE;md5=afec61498aa5f0c45936687da9a53d74</a> \
 &quot;
 DEPENDS = &quot;\
@@ -18,8 &#43;18,8 @@ DEPENDS = &quot;\
     python3-pytz-native \
 &quot;
 
-SRC_URI[md5sum] = &quot;6c018a644a88120886cc7211f7c826f0&quot;
-SRC_URI[sha256sum] = &quot;ffe2f9cdcea1086fc414e82f42271ecf1976700b8edd16ca9d376189c6d93aee&quot;
&#43;SRC_URI[md5sum] = &quot;b60cd68f792a30173d825e16482aedd8&quot;
&#43;SRC_URI[sha256sum] = &quot;3d77a6630d093d74cbbfebaa0571d00790966be1ed204e4a8239f5cbd6835c5d&quot;
 
 inherit pypi setuptools3 pkgconfig
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------FA5E1FA8FC813CABEDC491CA--

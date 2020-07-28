Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.57])
 by mx.groups.io with SMTP id smtpd.web11.12105.1595943243184575756
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jul 2020 06:34:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=qOjeAYnz;
 spf=pass (domain: windriver.com, ip: 40.107.243.57, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CB9hk8zYFl5ugL4pz3Ve5TNzkS6osUE0x76bd/WlR2mUre7r4xbzXS8L6etrewANixylq+JOJkbg23oYOl0QgB9y855m1SvJ0wRfWFqXV8WB5YGJ04WUhh5fU8MyQmmZu4zmaNso78KL0NS2R2cJ8ZsTiB67CJbHSNJrYmBP5NTqAwai3wQ/qqr/A9Snmsbanx/C4/mLl3BbDBv2qARkb/Vnc6IhWxF0c0AaeUnOl/EJ+eLUhVv07jhWf2ZSk4rbeoExEMCC7MHnqdV0CP4RCBY8/IlVbf9GR74fYLwq70SqyFnPYrWuNt1KG4SkXj00w41NemJGe/JtIafYD0MD/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SQe1jrageGSGh36MoGgDHQoAfq/uG+0VeJQA5+L5ZTM=;
 b=RiRJgQsdGG7fm+gwDxU2tYGwM+SQvpFDzXxzWEzjKBO4eIjDR4bAxGneyUYlg3452RlpO8RT2QQIKd6GIQOvYpGy3qikb/ef9xXxrDr42OfY7vdVIYnawXq32Tj/sjhTugMF4RE5Ci/m89P9WqVVyPPiaHoP+FYf1xYvRjqe1CVc7PZPjbDT3kPdU8oFEKQUalXqtUqYIaciJ/a39MRY0UxnUh9ToIJa84aazuZVp4yd74Vf0QmtmuaoCO126aq9qblqNVdm4FYaQEcSobdciIMx5I8WbsyzFKZ8Fomyxpr2QQDWYnOCzfN5NujzTMoFIAwAbia5sAfrFVIJQpvnAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SQe1jrageGSGh36MoGgDHQoAfq/uG+0VeJQA5+L5ZTM=;
 b=qOjeAYnziXZ4gPQvh3G+X9aw1+n4ACRU+j/YyaoCMughB+hjKK+g3XJKHwv8yhjODsOjGgw6t7S5Ed/9/vb3oYGKyavR6Gmbh7ejeuj/IKKJZfjaFMvz465w5+0nhtm8jiDmROy4LrHAU5Jg5t0uk+QbKsAP6LJLKx1/3kRPl88=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3816.namprd11.prod.outlook.com (2603:10b6:a03:f8::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Tue, 28 Jul
 2020 13:34:02 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3216.033; Tue, 28 Jul 2020
 13:34:02 +0000
Subject: Re: [oe] [meta-python][PATCHv2] python3-matplotlib: Upgrade 3.2.2 -> 3.3.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200724163137.1593-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <3a868de4-b099-bc51-5ee6-2f85b59d7aba@windriver.com>
Date: Tue, 28 Jul 2020 09:33:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200724163137.1593-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0089.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::28) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0089.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.22 via Frontend Transport; Tue, 28 Jul 2020 13:34:01 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da8a6b2e-e93d-42d8-bbf0-08d832fae3c3
X-MS-TrafficTypeDiagnostic: BYAPR11MB3816:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB38163F3C396389A6096D4C9E9F730@BYAPR11MB3816.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	AIYfo3B7Dclwu1u/xUBKkzR7MY7r3berNl2LrJIl8xbfTj+0E5QJgSUd7YHlIm2bf6IWAL4In0Lv8nSo76Cg4qD1Drzb9/VmAHhUs6wIwtRFr7y9oeuO37PSERFeUfWorG3AAb0ZfUHHwhyaKt3AxIUrC39QsI9bu3kj1M0NYKNRcmanGhfkD4JU72udCc7umOTfR1D3TbSN0/oPet3fwQDDVc1BWU2hpRKY5CcR+hcOs1jNNQThm3yxnys3NAkh98Loj3ozYa7EiXwxA0rN+GBuIjX+M8yiQ3teVP8Eg+ZXjdpod0ADG0A8uMzmzjnYTGHMt3afD0dvvgpFmfqqnUuNNcR33nHbXpbz130jiFP6gqehlfG0Ettsv86zysZPrvoDzQ+pZzkFHrgLwX+5nDdNr7TkpHtd/R+ov82oQuFvMaKBmbf4nvyGGAAlf9eT4SDp0bz1iIhaZXkJgg9AAQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(39850400004)(136003)(366004)(346002)(376002)(478600001)(316002)(83380400001)(33964004)(16576012)(53546011)(52116002)(8936002)(8676002)(31696002)(966005)(66476007)(66556008)(6486002)(66946007)(26005)(166002)(16526019)(2906002)(186003)(86362001)(36756003)(5660300002)(31686004)(44832011)(956004)(2616005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	Duj2Mpt49XO3B0YUknXPrl6vJxiM3v7xHlK5hkZclNkDajTcnxbryb/NJrLRMRV3w9v7dpCOAtP9dQai6V9rpzteoaEQ0CdQZccAm9u7P0DZGdvAHTcNYV6d4QL9jI8//FA2vdDvbrvGAi4RjGDrbpnMO3o1N/nWrMW6MyEvvz3aM4DJKA1hPiYxey1baUhXbhLC9CuWQE/pykmrYmXR3JFP8LluJY0UhACHl2DsVqmrGoQlV3X5o+q6R3VD/uU2YMDfl4updw5h4eJ5i9VuqHkCzbIuoWkdSZ6nDsN5WlRMwtq/wCIq04TkkzhqJQ4X3NwTRBbnqvctkMiQHu9AuTIpX5Hy7+6gS/9VYw1IQNBIgvNCZ07DO42cjTQWgM+guTRfvjNkAF10PUQWzS8LUXvUL2ggkIjT2fkDURAhzYbwY+Ktru5KHxoemMS5oaUC6f8KOGA1I8gRoG/7ySUHz++ZZrJu+yGH5pYynwLg4Xk=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da8a6b2e-e93d-42d8-bbf0-08d832fae3c3
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2020 13:34:02.0162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qSDuuV6oU4sfhykTbg2XmeDOloHPL950K3ronyPXsbKL75XNa0E9AK6sIdW254kqpKC8F9WEabGbOMNTPTDIpvzUBlWju6nGVMqct5vqn14=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3816
Content-Type: multipart/alternative;
 boundary="------------00EB9A525A43C363AEEF8CCC"
Content-Language: en-US

--------------00EB9A525A43C363AEEF8CCC
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/24/20 12:31 PM, Leon Anavi wrote:
> Upgrade to release 3.3.0:
>
> - Provisional API for composing semantic axes layouts from text
>    or nested lists
> - New Axes.sharex, Axes.sharey methods
> - Turbo colormap
> - colors.BoundaryNorm supports extend keyword argument
> - Text color for legend labels
> - Pcolor and Pcolormesh now accept shading='nearest' and 'auto'
> - Allow tick formatters to be set with str or function inputs
> - New Axes.axline method
> - Dates use a modern epoch
> - Improved font weight detection
> - Axes3D no longer distorts the 3D plot to match the 2D aspect
>    ratio
> - More consistent toolbar behavior across backends
> - Toolbar icons are now styled for dark themes
> - Cursor text now uses a number of significant digits matching
>    pointing precision
> - Functions to compute a Path's size
> - savefig() gained a backend keyword argument
> - Saving SVG now supports adding metadata
> - Saving PDF metadata via PGF now consistent with PDF backend
> - NbAgg and WebAgg no longer use jQuery & jQuery UI
>
> Create setup.cfg with configuration to use the copy of FreeType
> installed on the system.
>
> License-Update: The line and the checksum of the license in
> setup.py has changed but the license remains the same.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...atplotlib_3.2.2.bb => python3-matplotlib_3.3.0.bb} | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-matplotlib_3.2.2.bb => python3-matplotlib_3.3.0.bb} (70%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-matplotlib_3.2.2.bb b/meta-python/recipes-devtools/python/python3-matplotlib_3.3.0.bb
> similarity index 70%
> rename from meta-python/recipes-devtools/python/python3-matplotlib_3.2.2.bb
> rename to meta-python/recipes-devtools/python/python3-matplotlib_3.3.0.bb
> index b32177d9b..2e88efb56 100644
> --- a/meta-python/recipes-devtools/python/python3-matplotlib_3.2.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-matplotlib_3.3.0.bb
> @@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/matplotlib/matplotlib"
>   SECTION = "devel/python"
>   LICENSE = "PSF"
>   LIC_FILES_CHKSUM = "\
> -    file://setup.py;beginline=253;endline=253;md5=2a114620e4e6843aa7568d5902501753 \
> +    file://setup.py;beginline=251;endline=251;md5=e0ef37de7122ce842bcd1fb54482b353 \
>       file://LICENSE/LICENSE;md5=afec61498aa5f0c45936687da9a53d74 \
>   "
>   DEPENDS = "\
> @@ -18,8 +18,8 @@ DEPENDS = "\
>       python3-pytz-native \
>   "
>   
> -SRC_URI[md5sum] = "b60cd68f792a30173d825e16482aedd8"
> -SRC_URI[sha256sum] = "3d77a6630d093d74cbbfebaa0571d00790966be1ed204e4a8239f5cbd6835c5d"
> +SRC_URI[md5sum] = "b1de7185687c6f5c092689e3431a69b3"
> +SRC_URI[sha256sum] = "24e8db94948019d531ce0bcd637ac24b1c8f6744ac86d2aa0eb6dbaeb1386f82"
>   
>   inherit pypi setuptools3 pkgconfig
>   
> @@ -34,4 +34,9 @@ RDEPENDS_${PN} = "\
>       python3-pytz \
>   "
>   
> +do_compile_prepend() {
> +    echo [libs] > ${S}/setup.cfg
> +    echo system_freetype = true >> ${S}/setup.cfg
> +}
> +
>   BBCLASSEXTEND = "native"
>
> 

--------------00EB9A525A43C363AEEF8CCC
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/24/20 12:31 PM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200724163137.1593-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 3.3.0:

- Provisional API for composing semantic axes layouts from text
  or nested lists
- New Axes.sharex, Axes.sharey methods
- Turbo colormap
- colors.BoundaryNorm supports extend keyword argument
- Text color for legend labels
- Pcolor and Pcolormesh now accept shading='nearest' and 'auto'
- Allow tick formatters to be set with str or function inputs
- New Axes.axline method
- Dates use a modern epoch
- Improved font weight detection
- Axes3D no longer distorts the 3D plot to match the 2D aspect
  ratio
- More consistent toolbar behavior across backends
- Toolbar icons are now styled for dark themes
- Cursor text now uses a number of significant digits matching
  pointing precision
- Functions to compute a Path's size
- savefig() gained a backend keyword argument
- Saving SVG now supports adding metadata
- Saving PDF metadata via PGF now consistent with PDF backend
- NbAgg and WebAgg no longer use jQuery &amp; jQuery UI

Create setup.cfg with configuration to use the copy of FreeType
installed on the system.

License-Update: The line and the checksum of the license in
setup.py has changed but the license remains the same.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200724163137.1593-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...atplotlib_3.2.2.bb =&gt; python3-matplotlib_3.3.0.bb} | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-matplotlib_3.2.2.bb =&gt; python3-matplotlib_3.3.0.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-matplotlib_3.2.2.bb b/meta-python/recipes-devtools/python/python3-matplotlib_3.3.0.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-matplotlib_3.2.2.bb
rename to meta-python/recipes-devtools/python/python3-matplotlib_3.3.0.bb
index b32177d9b..2e88efb56 100644
--- a/meta-python/recipes-devtools/python/python3-matplotlib_3.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-matplotlib_3.3.0.bb
@@ -7,7 +7,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/matplotlib/matplotlib">&quot;https://github.com/matplotlib/matplotlib&quot;</a>
 SECTION = &quot;devel/python&quot;
 LICENSE = &quot;PSF&quot;
 LIC_FILES_CHKSUM = &quot;\
-    <a class="moz-txt-link-freetext" href="file://setup.py;beginline=253;endline=253;md5=2a114620e4e6843aa7568d5902501753">file://setup.py;beginline=253;endline=253;md5=2a114620e4e6843aa7568d5902501753</a> \
+    <a class="moz-txt-link-freetext" href="file://setup.py;beginline=251;endline=251;md5=e0ef37de7122ce842bcd1fb54482b353">file://setup.py;beginline=251;endline=251;md5=e0ef37de7122ce842bcd1fb54482b353</a> \
     <a class="moz-txt-link-freetext" href="file://LICENSE/LICENSE;md5=afec61498aa5f0c45936687da9a53d74">file://LICENSE/LICENSE;md5=afec61498aa5f0c45936687da9a53d74</a> \
 &quot;
 DEPENDS = &quot;\
@@ -18,8 +18,8 @@ DEPENDS = &quot;\
     python3-pytz-native \
 &quot;
 
-SRC_URI[md5sum] = &quot;b60cd68f792a30173d825e16482aedd8&quot;
-SRC_URI[sha256sum] = &quot;3d77a6630d093d74cbbfebaa0571d00790966be1ed204e4a8239f5cbd6835c5d&quot;
+SRC_URI[md5sum] = &quot;b1de7185687c6f5c092689e3431a69b3&quot;
+SRC_URI[sha256sum] = &quot;24e8db94948019d531ce0bcd637ac24b1c8f6744ac86d2aa0eb6dbaeb1386f82&quot;
 
 inherit pypi setuptools3 pkgconfig
 
@@ -34,4 +34,9 @@ RDEPENDS_${PN} = &quot;\
     python3-pytz \
 &quot;
 
+do_compile_prepend() {
+    echo [libs] &gt; ${S}/setup.cfg
+    echo system_freetype = true &gt;&gt; ${S}/setup.cfg
+}
+
 BBCLASSEXTEND = &quot;native&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------00EB9A525A43C363AEEF8CCC--

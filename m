Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.66])
 by mx.groups.io with SMTP id smtpd.web10.10427.1599060635218286831
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2020 08:30:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Zgqv1GBd;
 spf=pass (domain: windriver.com, ip: 40.107.236.66, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nMr63QTESqjoRGCDSBYy1WuXhaedRfz23pJ0QhPv/246KXT4fjNaiDR1izQj/gzxj1SY9Qv6pm9LbFfgiAYmusQwXAC1DQWdogd6f6OYnzxlzTmHnSjVeSScmk9/fEcGE6JZSaYV+n7XNNcoEl6YCKtlrMZdkfOZ0VIjJqWXlliCHEGswi4ot9x7mOeV9Xs1kcfIA2cLl/iAsdOvz7aa7fZlHwvSFkpN9gkuw8jxWlErCJKvdCWtqbZlaJ+C8rfT4lssULFlJVnjv8c7i6IyggeqROFc1PA32SB7EfwDlYIvW50073quQ2hDD8oHq1fuBuvSQChfwmWXp9ztmZMD7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pNhhS4+QhkwZ1sCW2e9av/q8m3jEKjyMzeGvrP8jc3E=;
 b=iGy4KaRadhmeimlQbjwk8Um8oknzsqKp9c/nqeYH6KdDgUsvRxy6mtya3EWmD2fZuhZE8Ur9KgF/SmTl3TdC10gGMf05V+2dIMxrY+eIhdUa/Z2KiNoAKCf86m7Msl+Vevi0oIGY/8iGRdfbkwm+FUTaZvtWByKtKzYtvmKCKEMCVxJ4Q+/8VNwtKe7X3TRLPHZQJCnRa7dHlWwix7zCtRkE/vz/WPpHixSS2W3vrcXcWtAcaipDtfIel0bTBgPICS6l5Z2MA1OCAtXLs6snsDDuatUkAXTHjwIU1F0qda7h8Gw6ke9HCO7LuO9xw9/FxOCFjJ49q52Fjw4SmmwclA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pNhhS4+QhkwZ1sCW2e9av/q8m3jEKjyMzeGvrP8jc3E=;
 b=Zgqv1GBdHrjceGRH3MjbWHTbtBSrQ+hztZHqI3k9gmyp2yWSwliXk3g8aLF6/Q6JoRLZvqEO0qHxTcVkFpg9hlxSs/K/CWCDWw5gX4OT5fESI4N3t5myP6uzfak4uGHL6fbQbWLYSqWlBBfCserqDBZRlhgaG1vdOuwzcptH//g=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3030.namprd11.prod.outlook.com (2603:10b6:a03:87::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Wed, 2 Sep
 2020 15:30:33 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3348.015; Wed, 2 Sep 2020
 15:30:33 +0000
Subject: Re: [oe] [meta-python][PATCH 09/10] python3-hpack: Upgrade 3.0.0 -> 4.0.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200831070318.6573-1-leon.anavi@konsulko.com>
 <20200831070318.6573-9-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <a3141cc5-1cb3-208d-cf01-cdcd89ed27a9@windriver.com>
Date: Wed, 2 Sep 2020 11:30:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200831070318.6573-9-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0012.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::25)
 To BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YT1PR01CA0012.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend Transport; Wed, 2 Sep 2020 15:30:32 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1e2a244-d892-4273-58fe-08d84f5521e6
X-MS-TrafficTypeDiagnostic: BYAPR11MB3030:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB30306B412C8F64EA75F5580F9F2F0@BYAPR11MB3030.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:285;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bL2A07k4EDG6+S05HmVPBZN5MPchgnpQh518o3osgF3qaoQxIGjkAvse/KD0kEYycSqIOMX7tfuWFAYi+MFNfSDvWGREbRiyO4gBcGQKGlWWRgivN0efmD/7CCPYcP1NlqrT2Kwmbv/YIaIZnDreTGPBvkD4FfP5ZBDz+mQ1XjpDxxjhMKut5dnLGHrI9xQbo+9dhkHUpw8cK9lsRXcdm0pFFLioLKtiN5iFM0UbcJcCMCZYEqlIbP3+mixnuMpykvZSFvCZB3s2rGCDO7dut3BLYo8jZhzeNnb/jIfUKrbGCk7ZjBk/1RGZ0rpkslIfxxaLELOjzEDgGd103OIuQE9g703F+H4DFEYoz+63Y0FC3SbyUvxeaV4osab5/974ls/xwM/TaRPqZPJyPbyG08ybfoq31A+HZAu3zCnReBlZsf0wvtSzPIufMLtJ7Z+/YMHGu+z5bH1GFACv5uTf/g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39850400004)(366004)(376002)(346002)(6486002)(316002)(966005)(31686004)(86362001)(5660300002)(16576012)(2906002)(2616005)(52116002)(66476007)(8936002)(478600001)(186003)(66946007)(44832011)(36756003)(8676002)(26005)(53546011)(956004)(83380400001)(166002)(66556008)(31696002)(33964004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	VHEcjVWhxse4jp+pYW8s55owRzRW0Xcv1BM9k/UHh9wQWI4E89pxunbrr3SPaV1s4cVRQOxy4ZhKG2VGvTsC5YddkFQlJwgmNI87DChJUDSE2heJpelcn2N3tpawp0z8JQOt51K3KQvrmQUUIvJU34e3ngZjgUDP3Kveg0Fz9zMll1S5KfLb9oAQYgGRAiL/S+1sl1l5PYxGJahStYT2LfjzVIHGx+kJVv9O8Bas+nk+0Cc68RhpRg9bApp+2MLKwsqtrMALIdYO0kK+epgA4d35DBc/yFqlZ5CiHBJQUrT0xJ3XNU1g8kmtyonqgvUpXid+gz3NzwHUaSP6p7SOomXD22UAG52vsPk+6zvpb9+ezXcqxD8lR/JHyrCgqyeMuVTjAsoQ8vE6c5nueoUoD9hmT6GuBb8v+PWSu+XNQPK4GkQDi3maOyTRH1vupZyBRmMz0gURQ/wOuWPSdBF58DOKe5nTFIaYw3hxEacicEjCS3qzBAarrkvHFt8vsz5l26CATpQFUm9YUsR8Z04+PBh/bbnSGGNYygHfA+3jGTR5Q/qHbmXHG3306hZOk/+6yXaRhrfKu+01iLXaShA8DG2M1hVg9XICRPygHiVbdat/WMqG7x+ArUyUwQRpTGc72FNYfKPZRFDLrvFN/e9Peg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1e2a244-d892-4273-58fe-08d84f5521e6
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2020 15:30:33.5772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K/WTzC2AS8zg/Lp+Vfi6VDpeKJq/W6xdItkmauLAbzIb2INimKm0ZInOiZX09Eu7GJTSSWphQ/B6JPLgJltPF6w9Dm2LUaYHEDdCgVFtbq8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3030
Content-Type: multipart/alternative;
 boundary="------------CECF29DA06CB9A56BFE6CD11"
Content-Language: en-US

--------------CECF29DA06CB9A56BFE6CD11
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/31/20 3:03 AM, Leon Anavi wrote:
> Upgrade to release 4.0.0:
>
> - Remove support for Python 2.7, 3.4 and 3.5.
> - Add support for Python 3.8.
> - Performance improvement of static header search. Use dict
>    search instead of linear search.
> - Fix debug output of headers during encoding.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-hpack_3.0.0.bb => python3-hpack_4.0.0.bb}        | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-connectivity/python-hpack/{python3-hpack_3.0.0.bb => python3-hpack_4.0.0.bb} (61%)
>
> diff --git a/meta-python/recipes-connectivity/python-hpack/python3-hpack_3.0.0.bb b/meta-python/recipes-connectivity/python-hpack/python3-hpack_4.0.0.bb
> similarity index 61%
> rename from meta-python/recipes-connectivity/python-hpack/python3-hpack_3.0.0.bb
> rename to meta-python/recipes-connectivity/python-hpack/python3-hpack_4.0.0.bb
> index 742f34f2f..afba98e4b 100644
> --- a/meta-python/recipes-connectivity/python-hpack/python3-hpack_3.0.0.bb
> +++ b/meta-python/recipes-connectivity/python-hpack/python3-hpack_4.0.0.bb
> @@ -4,7 +4,7 @@ LICENSE = "MIT"
>   
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=5bf1c68e73fbaec2b1687b7e71514393"
>   
> -SRC_URI[md5sum] = "556b0ae66180f54c2ce8029a0952088b"
> -SRC_URI[sha256sum] = "8eec9c1f4bfae3408a3f30500261f7e6a65912dc138526ea054f9ad98892e9d2"
> +SRC_URI[md5sum] = "27e01514ef06dc9fa0798d3dcb7de47c"
> +SRC_URI[sha256sum] = "fc41de0c63e687ebffde81187a948221294896f6bdc0ae2312708df339430095"
>   
>   inherit pypi setuptools3
>
> 

--------------CECF29DA06CB9A56BFE6CD11
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/31/20 3:03 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200831070318.6573-9-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 4.0.0:

- Remove support for Python 2.7, 3.4 and 3.5.
- Add support for Python 3.8.
- Performance improvement of static header search. Use dict
  search instead of linear search.
- Fix debug output of headers during encoding.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200831070318.6573-9-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-hpack_3.0.0.bb =&gt; python3-hpack_4.0.0.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-connectivity/python-hpack/{python3-hpack_3.0.0.bb =&gt; python3-hpack_4.0.0.bb} (61%)

diff --git a/meta-python/recipes-connectivity/python-hpack/python3-hpack_3.0.0.bb b/meta-python/recipes-connectivity/python-hpack/python3-hpack_4.0.0.bb
similarity index 61%
rename from meta-python/recipes-connectivity/python-hpack/python3-hpack_3.0.0.bb
rename to meta-python/recipes-connectivity/python-hpack/python3-hpack_4.0.0.bb
index 742f34f2f..afba98e4b 100644
--- a/meta-python/recipes-connectivity/python-hpack/python3-hpack_3.0.0.bb
+++ b/meta-python/recipes-connectivity/python-hpack/python3-hpack_4.0.0.bb
@@ -4,7 +4,7 @@ LICENSE = &quot;MIT&quot;
 
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=5bf1c68e73fbaec2b1687b7e71514393">&quot;file://LICENSE;md5=5bf1c68e73fbaec2b1687b7e71514393&quot;</a>
 
-SRC_URI[md5sum] = &quot;556b0ae66180f54c2ce8029a0952088b&quot;
-SRC_URI[sha256sum] = &quot;8eec9c1f4bfae3408a3f30500261f7e6a65912dc138526ea054f9ad98892e9d2&quot;
+SRC_URI[md5sum] = &quot;27e01514ef06dc9fa0798d3dcb7de47c&quot;
+SRC_URI[sha256sum] = &quot;fc41de0c63e687ebffde81187a948221294896f6bdc0ae2312708df339430095&quot;
 
 inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------CECF29DA06CB9A56BFE6CD11--

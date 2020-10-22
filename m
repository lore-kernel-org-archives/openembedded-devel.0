Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.52])
 by mx.groups.io with SMTP id smtpd.web10.1326.1603410259835861263
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2020 16:44:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=iOLsAVbI;
 spf=pass (domain: windriver.com, ip: 40.107.77.52, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z3u2mWC0Ff3v9hnhzo0GE2/3uUiB4Je3p4/1cbXqyPsbExvaVlQHjHFEnczQY9l1crseT99fUXV6Q/WTVP6WHW1iNG5jEygLcDzhuziS1sBcsB0eGvSC8I7m2/56eoR6ir22r8aOgZvyX1iEbphgXTdmRlmRJSc/eQ14OthNaGEZl7gji42/++cpfUj+LXBZgcjNuLS8vZmwCiEx0HTELv57S/wgCGmBBzOh4U0MMC8x9IsX1tNDjkTY9fGZ1D1z+TSCOHFMFPPWMXupvR916bvZNn0nDVKTssa5gKOa+c/j5O/NGuzXN7NM9JxVbSrcV9rO77521DwjwQWpFLjDfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SLtLmiY9qSEgoJG7kQWuc0ud0zRj8IVDcJubK/jWzvA=;
 b=gzYYRv5Dw8tIE+dFzRknZJXKG9GTlROxVP7ZSACZHaTDTvRzRjzp2Uxb+c9DG8OZT4cZ4bZcI/uOLlJTZu31Hz5CuBZEldLIJBfc6iGZUCnLu2xfJfca8/mklnWJL9nngqU8nvRFlxZqBwT7ctS9qLMyL6csiY5vi0ECA/wzDTGt6tToDUyiPOo4lyuCUUp/oVGnJiarBYSWM86/i0hdeP0EXHHVZca7oDGdRkkoKptCVO8Ysg82p0qQN79nN0rCxVjxEaw96HUCZQgHFlo9FEjlmxXhU3KM8fcr/fAQFDu7KWhUMdWVK8O+tMelJzZ1Jl9QGYw/gzLOl5dcSevlHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SLtLmiY9qSEgoJG7kQWuc0ud0zRj8IVDcJubK/jWzvA=;
 b=iOLsAVbIReu+dDlQcNkqJcPBuvaYv1iwWtYPpWc4BIRLDVib4HzodNnNBKPMpgTD50REJmPz2AGXKuMTcdkXRA495u0GovsqH26e9bujw/xuyOsEfO3ETU0R931MdkCgWT9vdMwhIeGuhDWhD3PnPVL0jEe8PN/mz8WiTJ3hq4E=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Thu, 22 Oct
 2020 23:44:18 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3477.028; Thu, 22 Oct 2020
 23:44:18 +0000
Subject: Re: [oe] [meta-python][PATCH 1/7] python3-humanize: Upgrade 3.0.1 -> 3.1.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201021111609.28237-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <464c5e6f-c02b-8309-1a62-b5761b7388eb@windriver.com>
Date: Thu, 22 Oct 2020 19:44:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
In-Reply-To: <20201021111609.28237-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BYAPR04CA0021.namprd04.prod.outlook.com
 (2603:10b6:a03:40::34) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BYAPR04CA0021.namprd04.prod.outlook.com (2603:10b6:a03:40::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Thu, 22 Oct 2020 23:44:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99e7691a-a647-4cfe-ec23-08d876e4649f
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4896:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB4896F1BB51E495CA50D8A1209F1D0@SJ0PR11MB4896.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SyMy6qbOUIM+bZekLHU6FtWDT5868cnh1axAoeismAkySNrr6ai5H2umRTmg76v6rZ9Eu6LSmOFuCLRSIeQK1LKha9dJ5LkBJ5uJDUDvjdVxbRht2urY4wr5ax2b3S0rqLJRiwmlM0xRrqvUcAJa9+1cLYpwTp5xFsQBCwpw99ynkYs2iERsm1tDmOQz0a1fcMrwjEQU2iUmv7okwnpLo/GitFGMYozqjR4LHMJi+JrVGFeEzDbejSeRZv4r19/fyuGCUA/4DJqzL2i98n5iIn501pxYyE3VDCc8ZSIDTfveihdu0zglnO/OJiTcVHR0jpfMApA+KvULbVNEoKUnbvIF9IXJHXvavRvfPUDs9uANTnVRY2Vkqzv4a4ah/R2xKVCnoetx9tV76suuK+ICRBHJMOmg0k41Kr/jNaBjB/W0v7RdKsflCXDvRsxhjLo8Ne3lIt242UdsxccAmQQShBIZFc85fNRy4Kv1XjBIK9Q=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(396003)(346002)(366004)(376002)(2616005)(31686004)(33964004)(478600001)(186003)(2906002)(956004)(166002)(44832011)(8936002)(6486002)(19273905006)(966005)(8676002)(83380400001)(36756003)(5660300002)(66556008)(53546011)(316002)(86362001)(26005)(16576012)(66946007)(66476007)(16526019)(52116002)(31696002)(43740500002)(563064011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	4nOFFI6MY6xBGfHQmhaUlcWXHAPevpSbAu1TbEYewRYYCK646HJ1sOBI1ASF1qekN534vI7r/v7QxB6xiSaxiixn22iYwM+bBQ6TtTU+tL8tpelj7i0e6fce8PpQIm2lXszYwbgMutOf4axJJ+MsdLKA1Z2LFU9vwkv4/LL9t55hlmyjJyPH1I5rskcRf5YI9LyUOq7HcRBfdAjihy78QQEnOVhM5C1Deb2GE9KnPSlEYKzLINlpZaNWe6WOuaD46T8X5le0N1fovRRUgHhcWuSSAU74SgUM0JjiGLh56EYU7X6YRZ9s5pxGars8WXjjFpjhY/05JI7BpyYCQGL04piWUBvRjerwOnZLlTIm3FQ59o9tfwFRTgIPtu75KlD/CNEIFz9kTQfG8nv4YcAwGiE1nhaEFU9tNyMchI8Rz9B6ORIPMQWrrxRIprVErC9zjyu4sZl6QFXzC+YBFxslLOA+9CesKFXJMn2b3cLuBk7299W5te0tTAgPzGpDNe+PrjtzMuv0REop09ypV1vZsT+8V2C+V6hTsQw8NhrSUSDsHRTs38imXAtZZ8a+EQe1MIZtCVh0RoaCWWhYo1/1JMStv8VCqAvNxw8sTB3q3T4u9lAUIROwp86tfE40qO+g4kYiirkud8BVhF7ei4ygYg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99e7691a-a647-4cfe-ec23-08d876e4649f
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2020 23:44:18.8037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BxKxUFDdFoXWeK9YmBc2yFQkTAGgydCqtLM5S13hDjxfCPvcy5D79zM36macbRjXs12YaYyY6Lu95W3SKDgqoHK7Gfe3N9mZ/L+ZY+huY+o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4896
Content-Type: multipart/alternative;
 boundary="------------4C8490AD15A9672D34C5EC72"
Content-Language: en-US

--------------4C8490AD15A9672D34C5EC72
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/21/20 7:16 AM, Leon Anavi wrote:
> - Declare support for Python 3.9
> - testing/docs: Include doctests in testing
> - Allow custom "now" in naturaldelta and naturaltime
> - Represent with a zero if the delta is too small
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-humanize_3.0.1.bb => python3-humanize_3.1.0.bb}  | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-humanize_3.0.1.bb => python3-humanize_3.1.0.bb} (71%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-humanize_3.0.1.bb b/meta-python/recipes-devtools/python/python3-humanize_3.1.0.bb
> similarity index 71%
> rename from meta-python/recipes-devtools/python/python3-humanize_3.0.1.bb
> rename to meta-python/recipes-devtools/python/python3-humanize_3.1.0.bb
> index 92831bf135..43b882cb84 100644
> --- a/meta-python/recipes-devtools/python/python3-humanize_3.0.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-humanize_3.1.0.bb
> @@ -4,8 +4,8 @@ HOMEPAGE = "http://github.com/jmoiron/humanize"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d"
>   
> -SRC_URI[md5sum] = "53faa88dedddba1227f9c41d65440c54"
> -SRC_URI[sha256sum] = "8ff8f292c9bf52bbefdc620410e7defd1c95e7eeb1a5cfc2859aaea4b1877ff5"
> +SRC_URI[md5sum] = "bde0a033cf200f2874e6e3fc860bed48"
> +SRC_URI[sha256sum] = "fd3eb915310335c63a54d4507289ecc7b3a7454cd2c22ac5086d061a3cbfd592"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------4C8490AD15A9672D34C5EC72
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/21/20 7:16 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201021111609.28237-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Declare support for Python 3.9
- testing/docs: Include doctests in testing
- Allow custom &quot;now&quot; in naturaldelta and naturaltime
- Represent with a zero if the delta is too small

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201021111609.28237-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-humanize_3.0.1.bb =&gt; python3-humanize_3.1.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-humanize_3.0.1.bb =&gt; python3-humanize_3.1.0.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-humanize_3.0.1.bb b/meta-python/recipes-devtools/python/python3-humanize_3.1.0.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-humanize_3.0.1.bb
rename to meta-python/recipes-devtools/python/python3-humanize_3.1.0.bb
index 92831bf135..43b882cb84 100644
--- a/meta-python/recipes-devtools/python/python3-humanize_3.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-humanize_3.1.0.bb
@@ -4,8 +4,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://github.com/jmoiron/humanize">&quot;http://github.com/jmoiron/humanize&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d">&quot;file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d&quot;</a>
 
-SRC_URI[md5sum] = &quot;53faa88dedddba1227f9c41d65440c54&quot;
-SRC_URI[sha256sum] = &quot;8ff8f292c9bf52bbefdc620410e7defd1c95e7eeb1a5cfc2859aaea4b1877ff5&quot;
+SRC_URI[md5sum] = &quot;bde0a033cf200f2874e6e3fc860bed48&quot;
+SRC_URI[sha256sum] = &quot;fd3eb915310335c63a54d4507289ecc7b3a7454cd2c22ac5086d061a3cbfd592&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------4C8490AD15A9672D34C5EC72--

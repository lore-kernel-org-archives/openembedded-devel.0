Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.67])
 by mx.groups.io with SMTP id smtpd.web12.6925.1596491775747012922
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2020 14:56:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=XfZ22KQK;
 spf=pass (domain: windriver.com, ip: 40.107.223.67, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eWVWHI/Rj5VLk0jMUXajqTbEJcbqaSvwhOz+i0A8yFVBgaiLpQF/6M/LL9VaFRzh0gegj/dAkkzsoM+qXo32lfU2p2YcGir9Ma9ZvB4f2x8Cfs/XLz28e4LvA2E4stSSPH+B6VIra1xbG1hwjt8TXiND4RMs072V8evcz6iYqRZWvzmCiTWpuCIaXxO7fto1C4D69RXa96hjab/QiPJXRxIIb35crPwy0UiL9P+H3zgCKAQgL8cxn5ZMn3XL556PkoUbF86wDmnouwARzS66DC1iiQS2J6KIolARrYtt0J6O/7ivB+YF2znzaAjwPB9OtVcf2YHy9KyHp2Fr16/hVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x30UHxXuZIr1gvT02qLFamYeWHZFAn+4F6z/6Y+vW3c=;
 b=NFy4Qwvq/U4t4TVdUbKEfsVRtzxCz3JwECuk2OGzy60/ohVMID46mZ/qNdikxROukoSlSEQpGACPSj1zgfx1mUNnzL+aGT5NWgAJmjC1yMLKolgmVnGo4i/BX6XjOHvoRrFwdn+HMFXHxtzYU1xsOG11SysvjMub0Ll3z02mh3p2zKArPCUDysAakdYTrIBCPe9sK6IqEgm6YkCa0Ao81wRoIUa5gEb5jaUloK7fo9e5Zm+8SLcKrqoZ4G2jZ5ouiNM/9z3kAx0bg3rq+NmYPIGS3xyEiFt27QfP5MFi6HVODDoUcbkzqOrP7ADvZfDc7vhabreDzg2+yGslojAHdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x30UHxXuZIr1gvT02qLFamYeWHZFAn+4F6z/6Y+vW3c=;
 b=XfZ22KQKZOP6+2YwfKP5oiJoLrtcPd5GbyqT9+W7XoN6whHwnlMZq/UlswtyWRsNgaIFb1WkGTRaYVi2iM6PrFlVZmpBsNmE6uj7vTd0m4aeym53fkoQe9m6k6ZomOsfmb926kS81xQWvV31c3C/21eCGZZDfm1yWtrVc+XdV0g=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4151.namprd11.prod.outlook.com (2603:10b6:a03:18f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17; Mon, 3 Aug
 2020 21:56:14 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3239.021; Mon, 3 Aug 2020
 21:56:14 +0000
Subject: Re: [oe] [meta-python][PATCH 14/15] python3-luma-core: Upgrade 1.14.0 -> 1.14.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200731132230.20031-1-leon.anavi@konsulko.com>
 <20200731132230.20031-14-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <1dbe08d2-2784-6dc9-30e9-3597c4716484@windriver.com>
Date: Mon, 3 Aug 2020 17:56:11 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200731132230.20031-14-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0155.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::34) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0155.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend Transport; Mon, 3 Aug 2020 21:56:14 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 48db2247-88ca-4680-8e2f-08d837f80aba
X-MS-TrafficTypeDiagnostic: BY5PR11MB4151:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4151344F106EFC7F582DE8359F4D0@BY5PR11MB4151.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:265;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LewbsJ+iyTGts5Lm9FaNc9msPz+70nOkJImxeAFh9eHagzgGFxc5iHhZa8DhU6J2NV89wgKx/ivPt6yYdlOPrT3JEBhLAOcM6uJDuFG66vdSojEaIgMY2tFVMP18wVrlaVWbvPs2/Ut4t1PwywXgmz71yXP0l4ANFvyfWlms5NjiywUj3Ys6RLhgXgACgRwnFAMG5+OQ2Dsd5W/vJIkJGbpNjTjwumqS/ZvJEm+6FLeeB76YGEzra5gJfHBCmxIg2LgkahNDwIQH+Y3y1Qhs0so/c+tuBiEJ8CKQJqISC7GJk2QCIcTypnEQ/vjYf6HAaXPlC1jhhTJM9e9GlnvaDpumqoHYvOJXAnyl1sSm5/IiHt3TV+EeSqAuMn7XFnyoycQ1fbIcLLpyi6n8m4ukQvRwvcymP8YtHo3VBw2HJ2x4L97vemlqyodlXyx0yvn/eJ+vwwT5AjcVv00bwiltxQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(396003)(136003)(346002)(366004)(376002)(36756003)(16526019)(2906002)(26005)(966005)(478600001)(186003)(86362001)(31686004)(16576012)(83380400001)(5660300002)(53546011)(166002)(2616005)(66556008)(66476007)(956004)(44832011)(33964004)(31696002)(6486002)(8676002)(316002)(8936002)(66946007)(6666004)(52116002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	aa5wxorOCFLT+uOqS4cZn4mNwP+6otBWorKzmFDwyxoGpimNmFRd8quaYg1bIssBhpV5CDVBvD+sXngQZdQdFvzQ96+dFHeU7jr3aaimJ3okhUiktkk/gXtazFXGz6Cy++L2TKv2icze4RhygZvak2zOttt0OkprQ6SAko9qJfJOr6p8ekh90UR6izNgLF6LXH0OyE6bJgCXmnyD7jWNL3MxrkUBFj0wM48kta/hbep/Qq9P6++JsuIEhV4D2DmVGmULHeOA66FBOd4WVIGv4qGucGYeViNetwX91ELb36nWqeHI1KFeJ9+MReVHdHOHaBAElV9Ri83H7Mgckk8he/nl4DwuYJaVXRs9D06+WUyMsCHCPFMO8PnEZBCZ2FQ9uWLarN/vOiwu/FEYGx4+2faWW8pxF41VYeMTFlbzd0nLnzWQPc4CaA/aPDPYeGMjP9CY9C3Kvs5NJH0PIvOWJvnCsKiYv/79AuhhTYc13TwQ+7F0SPbsuxFQXyv8c95uz2k6oKPpQfnGWKhv/DOY1vTVjDHlcaHzsLDXLkeB2oReETGBb44wC4/r/WpAeef+JTtqzUlAbxUWtl34G5xF/ek2HvJXaOLKXcAiFREgd+awGm6DI9Ao4KJNsRC0qEUJH1KrFMEA2nKpJEco8lOPmg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48db2247-88ca-4680-8e2f-08d837f80aba
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2020 21:56:14.6039
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0/et8p1yznpbDjSVSkOGR1MHRzmwzlx3BbbLlT4HBL9YpR3d+eEl6dW37oENzXC6x7C3i8cu3eCcUc3TXKvTGuS2WSHMNRrCadPwjtub9x4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4151
Content-Type: multipart/alternative;
 boundary="------------F30A4CC7F32BFB03E939DCEA"
Content-Language: en-US

--------------F30A4CC7F32BFB03E939DCEA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/31/20 9:22 AM, Leon Anavi wrote:
> Upgrade to release 1.14.1:
>
> - Pin spidev at v3.4 or lower; v3.5 seems to cause SystemException
>    running on latest linux kernel
> - Fix bug in snapshot: should always redraw on startup
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...ython3-luma-core_1.14.0.bb => python3-luma-core_1.14.1.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-luma-core_1.14.0.bb => python3-luma-core_1.14.1.bb} (75%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-luma-core_1.14.0.bb b/meta-python/recipes-devtools/python/python3-luma-core_1.14.1.bb
> similarity index 75%
> rename from meta-python/recipes-devtools/python/python3-luma-core_1.14.0.bb
> rename to meta-python/recipes-devtools/python/python3-luma-core_1.14.1.bb
> index 503acc824..d532405cc 100644
> --- a/meta-python/recipes-devtools/python/python3-luma-core_1.14.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-luma-core_1.14.1.bb
> @@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=eda804060ba2312e41fe96b6fa334fd7"
>   
>   inherit pypi setuptools3
>   
> -SRC_URI[md5sum] = "c049eabcdd50c4c1e630282c058e18f8"
> -SRC_URI[sha256sum] = "1501901f08c279abb9a5f1b76347955d6a15238c1e86e055aef96acd3e2e4215"
> +SRC_URI[md5sum] = "a738326f46c860acf6a4a9b2ec36ba73"
> +SRC_URI[sha256sum] = "972dc312b2831fe4c6b51943cc36903a9508cab8d9f2631a7ee485695924d34b"
>   
>   CLEANBROKEN = "1"
>   
>
> 

--------------F30A4CC7F32BFB03E939DCEA
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/31/20 9:22 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200731132230.20031-14-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.14.1:

- Pin spidev at v3.4 or lower; v3.5 seems to cause SystemException
  running on latest linux kernel
- Fix bug in snapshot: should always redraw on startup

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200731132230.20031-14-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...ython3-luma-core_1.14.0.bb =&gt; python3-luma-core_1.14.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-luma-core_1.14.0.bb =&gt; python3-luma-core_1.14.1.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-luma-core_1.14.0.bb b/meta-python/recipes-devtools/python/python3-luma-core_1.14.1.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-luma-core_1.14.0.bb
rename to meta-python/recipes-devtools/python/python3-luma-core_1.14.1.bb
index 503acc824..d532405cc 100644
--- a/meta-python/recipes-devtools/python/python3-luma-core_1.14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-luma-core_1.14.1.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.rst;md5=eda804060ba2312e41fe96b6fa334fd7">&quot;file://LICENSE.rst;md5=eda804060ba2312e41fe96b6fa334fd7&quot;</a>
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = &quot;c049eabcdd50c4c1e630282c058e18f8&quot;
-SRC_URI[sha256sum] = &quot;1501901f08c279abb9a5f1b76347955d6a15238c1e86e055aef96acd3e2e4215&quot;
+SRC_URI[md5sum] = &quot;a738326f46c860acf6a4a9b2ec36ba73&quot;
+SRC_URI[sha256sum] = &quot;972dc312b2831fe4c6b51943cc36903a9508cab8d9f2631a7ee485695924d34b&quot;
 
 CLEANBROKEN = &quot;1&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------F30A4CC7F32BFB03E939DCEA--

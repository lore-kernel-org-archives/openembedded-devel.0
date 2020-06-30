Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.55])
 by mx.groups.io with SMTP id smtpd.web11.15252.1593523501338305753
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2020 06:25:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=L0fNBKYv;
 spf=pass (domain: windriver.com, ip: 40.107.93.55, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NBoTxpw4O55pG1TkeK8EKZK9vnK1U6eeLwUvOuyWpLYqf/wJSnqGSSNyE6MwUYp1Jvqwj1IAJLBd4w2YYEywx88AkC4TFZXpNgQ811R7kGv2Y/05u3oZbd7kx/MAYK+5UeQFglRwPJkGFQ6mTBdl6jWItfDrnoKVHRQ8WeOKuFTbD7/pF8EUgZdiir4DbmFRFmPhueJiW2T/ONw1YGHxXfDvkdaU3xK8oKZ7A7ff4ZzbUCywsRERwC7icQ6BeANPMZgWfJsqmIQRrjiFbB7mrp2cOwxcxAoh2f5DyKRl5FXXldWRqL1ru9SBxFXWEqPovnHKJgdjuR2pOyOiF3SD2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vcYaoFegJ2D+NuqziuA2m8r0jNpjhmvqhNDaT1Ge9zQ=;
 b=BVITx8nSVQG6tLDDOWbDStY0QhzdzFt18CHmVc2+izaOgmoXbk2NDx6+e3JYN/jdxBrCPJk73TKohDalSSPXGVLLVzcqt/d8k9hbjSaJ3bmkINyFPJQ75azw1LD3M49FInN2GT9b5Zkct0LJf21yc2oEhRjZ7uDlR6Hctvpk772yRzDB+LSE1P1AY9qyMG/Bc9iV2q1g2plKloHTvo52zLERYyEJ4qH2LOEcs6kxPphs7zA9Fl+jHrZx7SnJPhyQf0NgheakSAnnRtnjBR8weemEi3AILp0xto87BhscVe2MhwzKZOrncSC56uXzzwvgx6V6+I6TVZIfG/jeMgcDyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vcYaoFegJ2D+NuqziuA2m8r0jNpjhmvqhNDaT1Ge9zQ=;
 b=L0fNBKYvx4agdCFlbDoyfWkeXh3620xUcw+4mZnQLVA5gTsyf7AvkWfJEPx0Qfp+ybYKk+0gl/yNq+uGQAkrXgAeRQbKbUeZB5DAiFTqvdA9JdwM9MTBUZ4gP0y7IfjptqPg4oDrRbkLMfzz095TZPHJ6SjYdGIcW5HWUwi4QXY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CY4PR11MB0006.namprd11.prod.outlook.com (2603:10b6:910:7b::18)
 by CY4PR11MB1367.namprd11.prod.outlook.com (2603:10b6:903:2d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21; Tue, 30 Jun
 2020 13:25:00 +0000
Received: from CY4PR11MB0006.namprd11.prod.outlook.com
 ([fe80::f422:a1ed:36f3:82d4]) by CY4PR11MB0006.namprd11.prod.outlook.com
 ([fe80::f422:a1ed:36f3:82d4%7]) with mapi id 15.20.3131.027; Tue, 30 Jun 2020
 13:25:00 +0000
Subject: Re: [oe] [meta-python][PATCH 08/10] python3-yappi: Upgrade 1.0 -> 1.2.5
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200629121233.27026-1-leon.anavi@konsulko.com>
 <20200629121233.27026-8-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <9bfc4ae9-b872-f848-a028-24ddf3bf71b4@windriver.com>
Date: Tue, 30 Jun 2020 09:24:58 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200629121233.27026-8-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0014.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::27)
 To CY4PR11MB0006.namprd11.prod.outlook.com (2603:10b6:910:7b::18)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0014.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21 via Frontend Transport; Tue, 30 Jun 2020 13:24:59 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4cd938c2-51f3-45f6-3cae-08d81cf8fd4d
X-MS-TrafficTypeDiagnostic: CY4PR11MB1367:
X-Microsoft-Antispam-PRVS: 
	<CY4PR11MB13670F8F507DA9EE5DE9A3089F6F0@CY4PR11MB1367.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:972;
X-Forefront-PRVS: 0450A714CB
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vj5bXvhDW6GcpBxvOtFOiBtOXv9B5pPy3Mm5IvlWppE7CDVX5b7bETlrqQT/z8/+to6ylvLAVwbKWZjCN9rIVdKHYQqMWlwm3HlyGSn9el9x2F6/aY9XUoQaQ2FZqZfyI+5SkzFzq1pRl0l8t4Ye6wpPNrHuXWlNSe5rntok6VwpkvjG2smCLn+rORaRGNpux9gAltMZuYqIKzJ7sIfb3I9R+MWk7LmQLyePlkX66rN7Q/BgIKZ4gYuPniZiDsOdz6NVm0lvQKVeB8txXsBIVPqdPJHl7SzF30nGjvw7OnHzU9baVXnFDvKdQX5JwZxb7HxcGfpfL+HA6jAdQbh1NhLxseoMpyf2EFEWP/l91gtVLjP0RSP+RY6abaOc2eQ3Jne3r9DmZKoqzwBNqmciA/9Q21hd4qnz3LQwj5ONFZSe8I/heOTbD3OfWIlVjTTBjYwO/D0L7y+xH80Wn2uZRw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR11MB0006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(396003)(366004)(376002)(136003)(346002)(956004)(2616005)(44832011)(36756003)(66946007)(8936002)(66556008)(66476007)(5660300002)(31696002)(166002)(8676002)(6486002)(26005)(52116002)(186003)(83380400001)(16526019)(16576012)(33964004)(316002)(2906002)(966005)(478600001)(31686004)(53546011)(86362001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	u5Bqr1eNGb9pKDKwmvSJNZcjzl+BTOrFiFt/s2qUPvi8+yM+HMIXqUMYi/VTEe9zo3Xud8H8h86IuSNPLkLyF98M9I2an/199qe254AblU10XtkaDMGa9ur0NweqIhAsRqwOqtEvzLeGu2Oo26OfY+nJCNb6HoizQ/KTWpkTsMiZq2DaPWaIZOlYgHzSiYRh6IC6IvEBVb+nzwhszrX2m57UiUBldkrlkvZKrxXimCz5QXXfuNuuZLZ3m98E4XAUVgV7TUzXqeRvrdE3B+3ewbjAtuWfhk31G9Jbrlg/szpEPUuXP1VuWzRdwzCqkk4PalmlDtAVaKDMbvrjQWG3Q/DH+Ii+ZHwOJvmQmYcx8J+6bll95RfT+Q4DNlHYC6ABh2fJL7BxpyDa2tdMZ5OeaSQcPp/DYxcHLxk+kfrOa2KSbJz8FO7TMuBKPA7lTLR5egqO3bz8Yw6bkghLpxcBhGRn0M75ek3r0c7KPGK38zbje9PcHVPo8v+VB5ZpcvbW
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cd938c2-51f3-45f6-3cae-08d81cf8fd4d
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB0006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2020 13:25:00.1359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yYbaenZjMEV0+109akcKl+8/Pmpvfs74a3YJ+4H68w1JKkSHTFWEfaeQXQb936evDYQclIKA94XaX7ksg1T+ppk/NBZQL7V4SmqGNr2rwuA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1367
Content-Type: multipart/alternative;
 boundary="------------8A2FE3584C055652C4BB7A57"
Content-Language: en-US

--------------8A2FE3584C055652C4BB7A57
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/29/20 8:12 AM, Leon Anavi wrote:
> Fix HOMEPAGE. Use file LICENSE for LIC_FILES_CHKSUM. Upgrade
> to release 1.2.5:
>
> - Fix tag/ctx_id filtering on get_func_stats
> - Add filter_callback to get_func_stats() for filtering
>    function/module descriptors
> - FIX: issues related to invalid conversion from long->ptr in
>    Win32
> - Optimize tstate->dict retrieval
> - Various other fixes
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-yappi_1.0.bb => python3-yappi_1.2.5.bb}   | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-yappi_1.0.bb => python3-yappi_1.2.5.bb} (60%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-yappi_1.0.bb b/meta-python/recipes-devtools/python/python3-yappi_1.2.5.bb
> similarity index 60%
> rename from meta-python/recipes-devtools/python/python3-yappi_1.0.bb
> rename to meta-python/recipes-devtools/python/python3-yappi_1.2.5.bb
> index 75de4dfbe..366dec3dc 100644
> --- a/meta-python/recipes-devtools/python/python3-yappi_1.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-yappi_1.2.5.bb
> @@ -1,11 +1,11 @@
>   SUMMARY  = "Yet Another Python Profiler"
> -HOMEPAGE = "http://yappi.googlecode.com/"
> +HOMEPAGE = "https://github.com/sumerc/yappi"
>   
>   LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://PKG-INFO;md5=9a193c13f346884e597acdcac7fe9ac8"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=71c208c9a4fd864385eb69ad4caa3bee"
>   
> -SRC_URI[md5sum] = "a545101aa8a435b0780f06f4723f58c8"
> -SRC_URI[sha256sum] = "7f814131515d51db62b1a3468bcb84de30499124752806a5a6e11caf0b4344bf"
> +SRC_URI[md5sum] = "83237494e7d22df2a31935a1e6650fa6"
> +SRC_URI[sha256sum] = "ad5fa4caf2859e480ffc4ec3e85615a6f7dea852c8f035f2db723f824ed4ba11"
>   
>   SRC_URI += " \
>       file://run-ptest \
> @@ -28,5 +28,5 @@ RDEPENDS_${PN}-ptest += " \
>   do_install_ptest() {
>       install -d ${D}${PTEST_PATH}/tests
>       cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> -    cp -f ${S}/yappi.py ${D}/${PTEST_PATH}/
> +    cp -f ${S}/yappi/yappi.py ${D}/${PTEST_PATH}/
>   }
>
> 

--------------8A2FE3584C055652C4BB7A57
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/29/20 8:12 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200629121233.27026-8-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Fix HOMEPAGE. Use file LICENSE for LIC_FILES_CHKSUM. Upgrade
to release 1.2.5:

- Fix tag/ctx_id filtering on get_func_stats
- Add filter_callback to get_func_stats() for filtering
  function/module descriptors
- FIX: issues related to invalid conversion from long-&gt;ptr in
  Win32
- Optimize tstate-&gt;dict retrieval
- Various other fixes

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200629121233.27026-8-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-yappi_1.0.bb =&gt; python3-yappi_1.2.5.bb}   | 10 &#43;&#43;&#43;&#43;&#43;-----
 1 file changed, 5 insertions(&#43;), 5 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-yappi_1.0.bb =&gt; python3-yappi_1.2.5.bb} (60%)

diff --git a/meta-python/recipes-devtools/python/python3-yappi_1.0.bb b/meta-python/recipes-devtools/python/python3-yappi_1.2.5.bb
similarity index 60%
rename from meta-python/recipes-devtools/python/python3-yappi_1.0.bb
rename to meta-python/recipes-devtools/python/python3-yappi_1.2.5.bb
index 75de4dfbe..366dec3dc 100644
--- a/meta-python/recipes-devtools/python/python3-yappi_1.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-yappi_1.2.5.bb
@@ -1,11 &#43;1,11 @@
 SUMMARY  = &quot;Yet Another Python Profiler&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://yappi.googlecode.com/">&quot;http://yappi.googlecode.com/&quot;</a>
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/sumerc/yappi">&quot;https://github.com/sumerc/yappi&quot;</a>
 
 LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;md5=9a193c13f346884e597acdcac7fe9ac8">&quot;file://PKG-INFO;md5=9a193c13f346884e597acdcac7fe9ac8&quot;</a>
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=71c208c9a4fd864385eb69ad4caa3bee">&quot;file://LICENSE;md5=71c208c9a4fd864385eb69ad4caa3bee&quot;</a>
 
-SRC_URI[md5sum] = &quot;a545101aa8a435b0780f06f4723f58c8&quot;
-SRC_URI[sha256sum] = &quot;7f814131515d51db62b1a3468bcb84de30499124752806a5a6e11caf0b4344bf&quot;
&#43;SRC_URI[md5sum] = &quot;83237494e7d22df2a31935a1e6650fa6&quot;
&#43;SRC_URI[sha256sum] = &quot;ad5fa4caf2859e480ffc4ec3e85615a6f7dea852c8f035f2db723f824ed4ba11&quot;
 
 SRC_URI &#43;= &quot; \
     <a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \
@@ -28,5 &#43;28,5 @@ RDEPENDS_${PN}-ptest &#43;= &quot; \
 do_install_ptest() {
     install -d ${D}${PTEST_PATH}/tests
     cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-    cp -f ${S}/yappi.py ${D}/${PTEST_PATH}/
&#43;    cp -f ${S}/yappi/yappi.py ${D}/${PTEST_PATH}/
 }
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------8A2FE3584C055652C4BB7A57--

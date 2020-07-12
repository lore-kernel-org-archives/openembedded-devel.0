Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.57])
 by mx.groups.io with SMTP id smtpd.web12.2037.1594577812873360630
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Jul 2020 11:16:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=D5YsEDUU;
 spf=pass (domain: windriver.com, ip: 40.107.236.57, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V0rD7YZXQpxqPZMgRXCk8EDl9cWHyJpRv8UisOjWihH1Zt1x3GyrgbgpTmstmNgBUMDGOlbTXkLyJgqFbg4Jjlod+gSGHakPND16bMeAq6crQr+ImAR6PxVhl4CrrFk2etKGT3Ib5Ct2zipHYlzRNhSdznEv6d3bjCpSV9ghQuiVSUYPua+OTBMw3pqR13wJ6x2aHvUUkRrBYFcu2RZ7brAxUjN7b4VhBQHPEcnVj5oATDV/OmtUxtm06TFM74oIeSDjrNi6R+IKLJ1wVobkc2HW4/f3jqidDgQS8hkjRcSsy9C3PK/uoemG9bxCN69SIUYAWUXssTwPsnyIEvK7pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wzZjBs9h2bVU6s5w6i8RX0uO8eyMFpdCeNt4y2QY3gc=;
 b=BkgXUCx1Tn0ZketcOZixcIH6hSXOpfRUEN9PLiF6PRuRgPonb/JIcSbSt77ACRV8pdo/2eStOHy863oXjUV1+YpGy3kYJknkYNJUGx1sw8xrtNNR4rzvJc/5gXuNQXA0ozkiErMx3SQBn67BmB9Dcbhcf3vo8WOLMpqeB0v3D4zTTc0T5ElIUWdmzA6o98XjIVfvMn3+Rc/mga0AbpkLhuTyRq6Aps7ZZctQt5GoYWYFE8CFFL8A2cNYMOgw8amM5vDBlwQKaEbC/6Ntpl1Z8eFaVfpLMXxgGRjaH+iYoTpPwmh06E+yI3yDDBFzBKu8FNnxK9Culvl+NZOYOke9RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wzZjBs9h2bVU6s5w6i8RX0uO8eyMFpdCeNt4y2QY3gc=;
 b=D5YsEDUUp1QsEONSC4e+zsCy+Kueg4GZACWUkaB9A8PSpubc8YjpSpOJu3bAL1uVsma2qZxJsBRR2E5yxUpyGfof1vnOnzop42OM7DCYWkVa4ydLDAPFIqEmyCKo8mV175m0apCN+3N9qg6cY1unLuiwChAjAblcJ2WRuRDjPKw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM6PR11MB4532.namprd11.prod.outlook.com (2603:10b6:5:2aa::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.23; Sun, 12 Jul 2020 18:16:51 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3174.025; Sun, 12 Jul 2020
 18:16:51 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-idna: upgrade 2.9 -> 2.10
To: Wang Mingyu <wangmy@cn.fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1594306837-45766-1-git-send-email-wangmy@cn.fujitsu.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <99a60ecc-d907-2a7c-2572-e3d396c6ae85@windriver.com>
Date: Sun, 12 Jul 2020 14:16:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <1594306837-45766-1-git-send-email-wangmy@cn.fujitsu.com>
X-ClientProxiedBy: YTXPR0101CA0012.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::25) To DM5PR11MB0011.namprd11.prod.outlook.com
 (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTXPR0101CA0012.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20 via Frontend Transport; Sun, 12 Jul 2020 18:16:51 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3cd177da-568f-4d74-1ed4-08d8268fbfda
X-MS-TrafficTypeDiagnostic: DM6PR11MB4532:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB4532B6E5896305E77C134A509F630@DM6PR11MB4532.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:227;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oCsRfhFJfxF3jCeTP++2Vb39kRFLRgROMtI3/O4/fxQWtgM0eVh7JhjWJYN2As4bOBZ+gxgBKrSRVcT9ARl6MPbbgVE+jzZjkLrRDmP2lweS0TI7QMynlme90ZoxdATvtb9E9zrjA8Dt6ciYgNpQTbjmi4X+w05ebsizTk1zpfN++BM6/CPmUjpIKsLQ6PxDNoKK9jZbUEPuxAI9j+PxpMCscJlz1OAAULZBJZLMwlGGr2O8wmlY3Po8cWWmltPUF4VnH9ux7qvaPy45KrYG5gnyfm/VsLk7H1YmCyZ89OCiF35qwmWD6Wl87T/JI9aGk0HN5lDyMe85dCrlfqDZSML2D0TqvLcLTBLCGJAKUDob6oX38HZoBk69750AoQCvqKlmnbf6yLwwJFPAllBZIGeZhSVcrSyub7UjybDSTAQG9fKjPZSTTKVliximp+SEemD+jAYIhIW+4qKBIWuHPQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(39830400003)(346002)(376002)(136003)(396003)(2906002)(166002)(8936002)(31696002)(83380400001)(66476007)(66556008)(966005)(478600001)(6486002)(66946007)(33964004)(52116002)(36756003)(86362001)(16576012)(316002)(5660300002)(31686004)(53546011)(186003)(16526019)(26005)(44832011)(956004)(8676002)(2616005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	eTgPkBlPTGWY1ZwLdNYLQklrJ0Jx7pxKRdD3cWP/f6NnnBr/NXcF5Mg0WITgxsj9vB7AjFtlBDtMhrv7RGbFe2Ffcd6xcKmmacX8fFORPY+W4Cq95e14HNgDt8EN/k7X19vj2E1aMk66xQ29na0ACk7uxuXWYwj1DJQs8dclaEaaG1V/PTW2NU+0E++gbZzKdUbI/cZ2N8sAgZVIKZGCghfQccrEAgh7Sk9Mhl/hf5J9WSuNy8kWq39nVHxQ5M7yFt7omIY3R4JRffZN3andP01NCZLoJOJHkm5nTTRIxtNCP+k15BbbxBNhj4IhVSZt7uWQp3FtHdUslys+GyydAhRYVOWC3fKos1YaXMe2N8c9o2GcrHsy55mA4AtFyA92tfhu+5LfRpj/aR0sooDiu/jXKfsMUWFB/KMkuelrtjHMttabts60E9jirL1Dzn3yqicc32rGgGk+DXxtnVNJfaO4SkPlbR9jA0TLk3NQkhE=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cd177da-568f-4d74-1ed4-08d8268fbfda
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2020 18:16:51.6097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j/IIKQvlQE26rtaJJuF9kRH00lvfq0l056UwiyW3teFFK8aEy10NU048mAE18nT+Hwc+MzbhIef6+RDnvBQcfXhnaHf5ubUKTKh9qfjNwWI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4532
Content-Type: multipart/alternative;
 boundary="------------9B00391C5A1BCFE4888F2089"
Content-Language: en-US

--------------9B00391C5A1BCFE4888F2089
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/9/20 11:00 AM, Wang Mingyu wrote:
> Main new features of idna release 2.10:
> - Update to Unicode 13.0.0.
> - Throws a more specific exception if "xn--" is provided as a label.
> - This is expected to be the last version that supports Python 2.
> See here for a full comparison:
> https://github.com/kjd/idna/commit/e5c11dbcd8dd32bb048b4dbdd344b49d18ecdf45
>
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   meta-python/recipes-devtools/python/python-idna.inc           | 4 ++--
>   .../python/{python3-idna_2.9.bb => python3-idna_2.10.bb}      | 0
>   2 files changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-idna_2.9.bb => python3-idna_2.10.bb} (100%)
>
> diff --git a/meta-python/recipes-devtools/python/python-idna.inc b/meta-python/recipes-devtools/python/python-idna.inc
> index adf26e0279..4968f10726 100644
> --- a/meta-python/recipes-devtools/python/python-idna.inc
> +++ b/meta-python/recipes-devtools/python/python-idna.inc
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/kjd/idna"
>   LICENSE = "BSD-3-Clause & Python-2.0 & Unicode"
>   LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=cf36c8682cc154d2d4aa57bd6246b9a1"
>   
> -SRC_URI[md5sum] = "870b8b80267f00f0faf1b7ba4bdbf14e"
> -SRC_URI[sha256sum] = "7588d1c14ae4c77d74036e8c22ff447b26d0fde8f007354fd48a7814db15b7cb"
> +SRC_URI[md5sum] = "7a910c706db30d758f377db2762c0f9a"
> +SRC_URI[sha256sum] = "b307872f855b18632ce0c21c5e45be78c0ea7ae4c15c828c20788b26921eb3f6"
>   
>   RDEPENDS_${PN}_class-target = "\
>       ${PYTHON_PN}-codecs \
> diff --git a/meta-python/recipes-devtools/python/python3-idna_2.9.bb b/meta-python/recipes-devtools/python/python3-idna_2.10.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python3-idna_2.9.bb
> rename to meta-python/recipes-devtools/python/python3-idna_2.10.bb
>
> 

--------------9B00391C5A1BCFE4888F2089
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/9/20 11:00 AM, Wang Mingyu wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1594306837-45766-1-git-send-email-wangmy@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">Main new features of idna release 2.10:
- Update to Unicode 13.0.0.
- Throws a more specific exception if &quot;xn--&quot; is provided as a label.
- This is expected to be the last version that supports Python 2.
See here for a full comparison:
<a class="moz-txt-link-freetext" href="https://github.com/kjd/idna/commit/e5c11dbcd8dd32bb048b4dbdd344b49d18ecdf45">https://github.com/kjd/idna/commit/e5c11dbcd8dd32bb048b4dbdd344b49d18ecdf45</a>

Signed-off-by: Wang Mingyu <a class="moz-txt-link-rfc2396E" href="mailto:wangmy@cn.fujitsu.com">&lt;wangmy@cn.fujitsu.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:1594306837-45766-1-git-send-email-wangmy@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">
---
 meta-python/recipes-devtools/python/python-idna.inc           | 4 &#43;&#43;--
 .../python/{python3-idna_2.9.bb =&gt; python3-idna_2.10.bb}      | 0
 2 files changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-idna_2.9.bb =&gt; python3-idna_2.10.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-idna.inc b/meta-python/recipes-devtools/python/python-idna.inc
index adf26e0279..4968f10726 100644
--- a/meta-python/recipes-devtools/python/python-idna.inc
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python-idna.inc
@@ -3,8 &#43;3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/kjd/idna">&quot;https://github.com/kjd/idna&quot;</a>
 LICENSE = &quot;BSD-3-Clause &amp; Python-2.0 &amp; Unicode&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.rst;md5=cf36c8682cc154d2d4aa57bd6246b9a1">&quot;file://LICENSE.rst;md5=cf36c8682cc154d2d4aa57bd6246b9a1&quot;</a>
 
-SRC_URI[md5sum] = &quot;870b8b80267f00f0faf1b7ba4bdbf14e&quot;
-SRC_URI[sha256sum] = &quot;7588d1c14ae4c77d74036e8c22ff447b26d0fde8f007354fd48a7814db15b7cb&quot;
&#43;SRC_URI[md5sum] = &quot;7a910c706db30d758f377db2762c0f9a&quot;
&#43;SRC_URI[sha256sum] = &quot;b307872f855b18632ce0c21c5e45be78c0ea7ae4c15c828c20788b26921eb3f6&quot;
 
 RDEPENDS_${PN}_class-target = &quot;\
     ${PYTHON_PN}-codecs \
diff --git a/meta-python/recipes-devtools/python/python3-idna_2.9.bb b/meta-python/recipes-devtools/python/python3-idna_2.10.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-idna_2.9.bb
rename to meta-python/recipes-devtools/python/python3-idna_2.10.bb
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------9B00391C5A1BCFE4888F2089--

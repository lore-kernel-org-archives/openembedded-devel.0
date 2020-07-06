Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.44])
 by mx.groups.io with SMTP id smtpd.web10.60542.1594050169307058023
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2020 08:42:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ePGrcvkx;
 spf=pass (domain: windriver.com, ip: 40.107.243.44, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BY8TsmatZfE59Nk5kmnLJQ9qG6/Aw5FuinC/KXRuI+rOkRCi1ou3YT9LcxTPv6vruW91Ehvun4pieCxdA3JHTwU2Jm/WGOHH4lnTbo85M0FSm5m7lEs5gpUdQV3qU3nvS2wuOIlqj49hv3g3eA/8x82yCDndxzxTP1i3vW44BImckFlZdHheLlLCMvm0jTUo7DOLf4T8MHfkQ1ZKLc4bWFSaFQY282qL5mHXja8rcgdt48KI0RQUtf76nTIPOT+9E8Xv97wSblI+1ABN5lJ0Rfct0FajL1LbHUwMMGluefi1tHGAmb8xdQDaGC4iRuLYh9U704FOXgHlukGJ31nsGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R1nprmALQ7QwyTdIa6jaecmyBWwcnBXe0+TGxMJFitU=;
 b=ceygrEqBksF4zz+ZGpdKVTdVVqT8ErLMYTN3XrWkwwLRsIBtdrNL2Wlq43AaW6kUsXeI4Mxk31YXsY1HlwLn1mLK43yNyfWpWqYoMHbscdCoGKVJR37nGy2KXNCxKZM+dFSewR1t1wm4yvMdw3hHWF6fxSRtfhrs5ft57Wk+hkvAvJsBP6J5mvyuYEWFAQCkrfVG1lV2FPa0fFoqUlpzI8dvOA3wcP3966eIsLxB/vOyWsDr8N+AnOKT0IqsZUJuaonXtCWwDGJ0SeJ8B1BbXcHTOxrprYRHBcLW6BcrGmm4dzOM0UuQeYaDuyAZk27ta81t8BY2qaXkCHAPDaGiHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R1nprmALQ7QwyTdIa6jaecmyBWwcnBXe0+TGxMJFitU=;
 b=ePGrcvkxSOvT+Ebzch0E6OIzzR2gPLNjU4EApDOSvjFFPSjdLRulQWPU8PWVyVfhZNRFgnKWj1Y8h26XGXHyGjr1v/11msdAMtI4We60Ks2O8hGfX+AQxjTSqFlaWpsc+HQGdtp9bcmtz92aqBHql2sX8+vgn8/Zuja07mbrRvQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM6PR11MB3275.namprd11.prod.outlook.com (2603:10b6:5:5e::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.23; Mon, 6 Jul 2020 15:42:48 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3153.029; Mon, 6 Jul 2020
 15:42:48 +0000
Subject: Re: [oe] [meta-python][PATCH 3/5] python3-pybluez: Upgrade 0.22 -> 0.23
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200702104819.14256-1-leon.anavi@konsulko.com>
 <20200702104819.14256-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <4f1f4152-361f-309b-60da-15bedbdfa0b8@windriver.com>
Date: Mon, 6 Jul 2020 11:42:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200702104819.14256-3-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0015.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::28)
 To DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0015.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23 via Frontend Transport; Mon, 6 Jul 2020 15:42:48 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 065134b9-c337-4906-2d84-08d821c33c04
X-MS-TrafficTypeDiagnostic: DM6PR11MB3275:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB32758C8AE26210FAB7D9ABED9F690@DM6PR11MB3275.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-Forefront-PRVS: 04569283F9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	e0bjE/p2AXgpuNAnI8Fws2Rtw7egJnoiHyEz8NQavrB/RoQz80z9XP8JAhwvWzz2u4xyxLT0MiM+8Bg9sKUALZF92y3QD/kdyFsJyPimyeMUCwc9iwpETLhmK0ucAhvY7WKr059fS/9QoESKtdnemKcrMw95cobkQJL/Hw/OVe37uqHpjh3cxQzJsIpbqY5YXstZ71xd85cP/8irzvvyoMbTXaVvsJBDlC1imFPLoGtNZgKbzQWv+v21dGaH/IgaIdfBDDgoXJAObE8E93VzGSmNBYsb67tLr5ZGCRUGrmA5IV5fKOHXEK7tudEmT+Wd2Ia3l1SnhN/BeKvA7Uiy39V+8smfpi5w/lV5jYJFbZbu5xjacyoo5C0yuCT7rW2BX87Co3IhfTfryIpXs4+c9qFmmg4hAP5YIsMxEP9IvakklIr2QqIaiQ2k+paVfVBFxugJur//QkYhD5OdPcvqdw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(346002)(376002)(366004)(39850400004)(396003)(33964004)(16576012)(36756003)(26005)(8936002)(8676002)(316002)(31696002)(6486002)(16526019)(86362001)(2616005)(83380400001)(44832011)(186003)(956004)(2906002)(166002)(66946007)(52116002)(31686004)(66556008)(66476007)(5660300002)(53546011)(478600001)(966005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	LPDsgGVYuglgWCsKIEsHkO+RD0lOWI+N7O7IYLVE/mRmVq8zA753zj37e+jNn4IK1xxEFQytDe49SqCIFnkpIgdoIJhcq0eg8YkKjKeygUoo22uLf7j6GWrDk6HWyB6k3FeKK4x49ema5gxUUf303cJhU0Qm8+CJCG3HxQbu4Q0RT4TRWRf0E6g+CkBFFECdKBBszQajD71yB8ThZbBzEaMmNfB/gByHObh5yJBdlVvFjHMHFkUS8GmUfsJ7vOthn5k0i5EmRbPVV4mm+ru3YPdy1bAbYfDeNksBGJylEbv+Mq26+2s6BzYMH9wfagje4/QH//w874G/QLxsYHNMZ2o9MixRk3LwX16faC13WKvoJ43hmBqJielpRMokx8SSoMtyLQnveCzvy+XL69BPADq1wYuzeqRxll7HztjEQDB6ntdjq8JI0HvBtun/JWc2YftYxEtMMm06jsoaXb8UUkKT8TFbyBAPddZcA0OGPxG392eCbFAhU6oaQFlt7pDt
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 065134b9-c337-4906-2d84-08d821c33c04
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2020 15:42:48.3390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wfRIKC/2TwjyYDVhc8JPZXE1yy17/BWrmL12xOa78gWQKAEXjibtH3Jg0MkqAlzXIDdofgeB6FsD6d69VvkUFj6gJn3TyOqemejaZozHAPY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3275
Content-Type: multipart/alternative;
 boundary="------------49B0A258E8FBE530A9E97A9A"
Content-Language: en-US

--------------49B0A258E8FBE530A9E97A9A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/2/20 6:48 AM, Leon Anavi wrote:
> Upgrade to release 0.23:
>
> - Dropped support for Python 2.7. The minimum Python version
>    is now 3.5.
>
> Use tar.gz instead of zip. Fix the URL of the HOMEPAGE.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-pybluez_0.22.bb => python3-pybluez_0.23.bb}   | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pybluez_0.22.bb => python3-pybluez_0.23.bb} (58%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pybluez_0.22.bb b/meta-python/recipes-devtools/python/python3-pybluez_0.23.bb
> similarity index 58%
> rename from meta-python/recipes-devtools/python/python3-pybluez_0.22.bb
> rename to meta-python/recipes-devtools/python/python3-pybluez_0.23.bb
> index 26902e18d..5242059bc 100644
> --- a/meta-python/recipes-devtools/python/python3-pybluez_0.22.bb
> +++ b/meta-python/recipes-devtools/python/python3-pybluez_0.23.bb
> @@ -1,5 +1,5 @@
>   DESCRIPTION = "Bluetooth Python extension module"
> -HOMEPAGE = "http://karulis.github.io/pybluez/"
> +HOMEPAGE = "https://pybluez.github.io/"
>   SECTION = "devel/python"
>   
>   DEPENDS = "bluez5"
> @@ -7,11 +7,10 @@ DEPENDS = "bluez5"
>   LICENSE = "GPL-2.0"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=8a71d0475d08eee76d8b6d0c6dbec543"
>   
> -SRC_URI[md5sum] = "49dab9d5a8f0b798c8125c7f649be3cd"
> -SRC_URI[sha256sum] = "4ce006716a54d9d18e8186a3f1c8b12a8e6befecffe8fd5828a291fb694ce49d"
> +SRC_URI[md5sum] = "afbe8429bb82d2c46a3d0f5f4f898f9d"
> +SRC_URI[sha256sum] = "c8f04d2e78951eaa9de486b4d49381704e8943d0a6e6e58f55fcd7b8582e90de"
>   
>   PYPI_PACKAGE = "PyBluez"
> -PYPI_PACKAGE_EXT = "zip"
>   inherit pypi setuptools3
>   
>   RDEPENDS_${PN} += "\
>
> 

--------------49B0A258E8FBE530A9E97A9A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/2/20 6:48 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200702104819.14256-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.23:

- Dropped support for Python 2.7. The minimum Python version
  is now 3.5.

Use tar.gz instead of zip. Fix the URL of the HOMEPAGE.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200702104819.14256-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-pybluez_0.22.bb =&gt; python3-pybluez_0.23.bb}   | 7 &#43;&#43;&#43;----
 1 file changed, 3 insertions(&#43;), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pybluez_0.22.bb =&gt; python3-pybluez_0.23.bb} (58%)

diff --git a/meta-python/recipes-devtools/python/python3-pybluez_0.22.bb b/meta-python/recipes-devtools/python/python3-pybluez_0.23.bb
similarity index 58%
rename from meta-python/recipes-devtools/python/python3-pybluez_0.22.bb
rename to meta-python/recipes-devtools/python/python3-pybluez_0.23.bb
index 26902e18d..5242059bc 100644
--- a/meta-python/recipes-devtools/python/python3-pybluez_0.22.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-pybluez_0.23.bb
@@ -1,5 &#43;1,5 @@
 DESCRIPTION = &quot;Bluetooth Python extension module&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://karulis.github.io/pybluez/">&quot;http://karulis.github.io/pybluez/&quot;</a>
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://pybluez.github.io/">&quot;https://pybluez.github.io/&quot;</a>
 SECTION = &quot;devel/python&quot;
 
 DEPENDS = &quot;bluez5&quot;
@@ -7,11 &#43;7,10 @@ DEPENDS = &quot;bluez5&quot;
 LICENSE = &quot;GPL-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=8a71d0475d08eee76d8b6d0c6dbec543">&quot;file://COPYING;md5=8a71d0475d08eee76d8b6d0c6dbec543&quot;</a>
 
-SRC_URI[md5sum] = &quot;49dab9d5a8f0b798c8125c7f649be3cd&quot;
-SRC_URI[sha256sum] = &quot;4ce006716a54d9d18e8186a3f1c8b12a8e6befecffe8fd5828a291fb694ce49d&quot;
&#43;SRC_URI[md5sum] = &quot;afbe8429bb82d2c46a3d0f5f4f898f9d&quot;
&#43;SRC_URI[sha256sum] = &quot;c8f04d2e78951eaa9de486b4d49381704e8943d0a6e6e58f55fcd7b8582e90de&quot;
 
 PYPI_PACKAGE = &quot;PyBluez&quot;
-PYPI_PACKAGE_EXT = &quot;zip&quot;
 inherit pypi setuptools3
 
 RDEPENDS_${PN} &#43;= &quot;\
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------49B0A258E8FBE530A9E97A9A--

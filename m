Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.60])
 by mx.groups.io with SMTP id smtpd.web12.9820.1593089957359257145
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2020 05:59:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=feUT7dDI;
 spf=pass (domain: windriver.com, ip: 40.107.223.60, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ioU3wjmDcicrxwGTbURB2F3Urbp67AUG9B2bwKm/YPFl9GsLeX+PhwZM66tXeVYruZnGaH3opKBcYKiAoo8fKuueyPZ15QLtbSGI3TNh2eh2vVwo0JrljMwgDbzHwME/+myHTXJq2I5NY2rbw9hbTsXLIq4FrkRzg3tctRDCyK2qtTdcnvFC9jP1zsSUFDpoRzbL5l9+VQrBzSNGhZ+NB7ylYSTjbRH9PsfrbRSNd96cXig5Uh+KJRiHr2TDh/w2XV9cD71NaoiJFN+v6FoqupmAAzKyD+meMMOZLGT6NT0PfJQ73zKOTqDH0hkkfdNmvgCt1VXXFTlWo4knH4Ediw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ospAI25eeqWmfYp0Nrq/qXLQh3uVhGLp1cH/rF5em3k=;
 b=RuvQC67wDhAe6XeB7cScYOGIlGE9753MCzzYEcs63T6LPESVXML7Nr/CCbmyQjObclO8BLPKV8C2xp1gMUnGv3GR+bnJvzd1QJxM9EbssjaUFu43gznbB1PA9qNzMc7bd7Ndc2CYps4vfqkoEqXT74x2uGcqW3qb6c5UPXg293D7m4zmGknqA5irw+khW6WCHqIsRSXpTdCRWqMQx2ABuvBM45K+idy+ltAmrhx6exAJvA0xYDPAoyuiFhx7kXzxzOe5NQE6wvF/R1PQZLZs5je5kpA4ZRnv5h2kqwX3VfR9dLgpBTnHto/1C5hUTqvYhhZRlg720NmAgShPgTJLZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ospAI25eeqWmfYp0Nrq/qXLQh3uVhGLp1cH/rF5em3k=;
 b=feUT7dDIzvWI7eALD7JnjnekRUPhlJbLh/kiRoeezSlz3TGsVGDazBiwModNyCZZRdYukrO6sMAzU9l+PVOe2Nx3Di6MRGxokoXajJlOcQQXJJpWJSiThyEGmadQfj94Qhm06R3JzDVvcqOp1rKolt/5fD7VzWb0ZKJK+ZGAW9U=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB3954.namprd11.prod.outlook.com (2603:10b6:405:79::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21; Thu, 25 Jun
 2020 12:59:16 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.027; Thu, 25 Jun 2020
 12:59:16 +0000
Subject: Re: [oe] [meta-python][PATCH 07/10] python3-lazy-object-proxy: Upgrade 1.4.3 -> 1.5.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200624151628.547-1-leon.anavi@konsulko.com>
 <20200624151628.547-7-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <c16e9826-98f4-3cae-0d00-23ae652c0ce0@windriver.com>
Date: Thu, 25 Jun 2020 08:59:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200624151628.547-7-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0042.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::11) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0042.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21 via Frontend Transport; Thu, 25 Jun 2020 12:59:15 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a950ab31-3c48-49bb-6053-08d8190790e7
X-MS-TrafficTypeDiagnostic: BN6PR11MB3954:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB39544339B1FBFDCC0DC769829F920@BN6PR11MB3954.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:262;
X-Forefront-PRVS: 0445A82F82
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WY7wuare5ZgVF6T439I4dlyFFFgSVHGf5uRMqO6W3FEaRV0M3Ok2zWONXu8imBtO3KK2tyyRCEaQkkQJEBCxlMDNXM5sVLIbiVTICJ7ECtED04gDcnfp5P51csf02R1042ID6HMx6akHVKfx8v/ibbSPGgdYxM1E6HMUZ1ln5uoFJv715NYI+Pche9RW8RDAGXKnwnuVdnVASilHBhLo0aIr9Xu4R21h15XHYndHb1IRs7pdHYpoCaRq2hajX/Rkq8xeApo5t2qgMQfOTUJesOM+XPCQ18Mh63vXv2gC5LPRd6YTHVGXdV7CF1N4SVZm6cpjsLKUzCGngvgW1egiai2BnRu/pAigQ4IKB/CplemVZIzbEao6jWEKd4eyBaXBnb8QftwHACsCD3YUGHwf7tXqEcTVajt9FQKi9SthokIdULpTKj8R7pmG0dSrLCbQtXihCLvbHeSYTC1Ci3COHA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(376002)(39850400004)(366004)(396003)(346002)(52116002)(44832011)(83380400001)(86362001)(26005)(31696002)(186003)(36756003)(5660300002)(53546011)(8936002)(16526019)(966005)(16576012)(166002)(66946007)(66476007)(33964004)(66556008)(956004)(478600001)(2616005)(6486002)(316002)(8676002)(31686004)(2906002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	XF+1LCwOTqgnCupEJ2DV6tihnGj3vaZjSlZlPytxn5X8FSRLBHDHKblya/5WYuahmtKylwg0uMp5sIswIA4msoOWlA0fYfIBFM1SSnb28DAuhd60fUfsTRHrOa/Y9dvJy1KX4cozrCQJ1M+D55RUXuJwJSCU5YXNXW+p2LXrZKLDe9mNc9NrAwo81s6BJHbI0DzHD725WLpp60ydJ+CoFbsLbwbDhDTpRkYweJsVd4rUba1ZdK7kfYEiw1QI+2E+9CEhLfWgHWYZ/plRJssS7/ebWPuUyuU3PMy5CdQw1XBl87w/EAgH8tm9CUuj2d+qxRvFG4si0tDQft1nbZPGjZo1VxC0qzbO/W1LFlNKiw2SQVWR85nB8YRR+KkpbR3685zun+TUC0Dp9Mua9Mx9qgfsGaAmOEDuMuPPCtKZnVyOnCN+YgJ9WbrfmEbjmOeeLftWaf/g0PT5NLrHj7mlkqgNMHF33rk0vLTeXUOSaxM=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a950ab31-3c48-49bb-6053-08d8190790e7
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2020 12:59:16.2243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fA5c4uX/Xk8kpf+SOZjuiWtSdwiodgxuHjGlwu1YzuHrZb7TxCMR30Zjs1BHaKJffOGvaNbvSTWEmLJh+YTh1MccX7i2X4UGUJ3fRVPOYnA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3954
Content-Type: multipart/alternative;
 boundary="------------C9B399B1152EE09F3D295904"
Content-Language: en-US

--------------C9B399B1152EE09F3D295904
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/24/20 11:16 AM, Leon Anavi wrote:
> Upgrade to release 1.5.0:
>
> - Added support for __fspath__.
> - Dropped support for Python 3.4.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...ject-proxy_1.4.3.bb => python3-lazy-object-proxy_1.5.0.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-lazy-object-proxy_1.4.3.bb => python3-lazy-object-proxy_1.5.0.bb} (68%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.4.3.bb b/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.5.0.bb
> similarity index 68%
> rename from meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.4.3.bb
> rename to meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.5.0.bb
> index bd197adcb..60d0e169f 100644
> --- a/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.4.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.5.0.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=9c5c2c74370826468065c5702b8a1fcf"
>   
>   DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
>   
> -SRC_URI[md5sum] = "5c64c06affcd2a7c6ddc848af4280cca"
> -SRC_URI[sha256sum] = "f3900e8a5de27447acbf900b4750b0ddfd7ec1ea7fbaf11dfa911141bc522af0"
> +SRC_URI[md5sum] = "ea5c009f1995d86942d024714096624e"
> +SRC_URI[sha256sum] = "a0aed261060cd0372abf08d16399b1224dbb5b400312e6b00f2b23eabe1d4e96"
>   
>   inherit pypi setuptools3
>
> 

--------------C9B399B1152EE09F3D295904
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/24/20 11:16 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200624151628.547-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.5.0:

- Added support for __fspath__.
- Dropped support for Python 3.4.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200624151628.547-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...ject-proxy_1.4.3.bb =&gt; python3-lazy-object-proxy_1.5.0.bb} | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-lazy-object-proxy_1.4.3.bb =&gt; python3-lazy-object-proxy_1.5.0.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.4.3.bb b/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.5.0.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.4.3.bb
rename to meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.5.0.bb
index bd197adcb..60d0e169f 100644
--- a/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.4.3.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.5.0.bb
@@ -6,7 &#43;6,7 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=9c5c2c74370826468065c5702b8a1fcf">&quot;file://LICENSE;md5=9c5c2c74370826468065c5702b8a1fcf&quot;</a>
 
 DEPENDS &#43;= &quot;${PYTHON_PN}-setuptools-scm-native&quot;
 
-SRC_URI[md5sum] = &quot;5c64c06affcd2a7c6ddc848af4280cca&quot;
-SRC_URI[sha256sum] = &quot;f3900e8a5de27447acbf900b4750b0ddfd7ec1ea7fbaf11dfa911141bc522af0&quot;
&#43;SRC_URI[md5sum] = &quot;ea5c009f1995d86942d024714096624e&quot;
&#43;SRC_URI[sha256sum] = &quot;a0aed261060cd0372abf08d16399b1224dbb5b400312e6b00f2b23eabe1d4e96&quot;
 
 inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------C9B399B1152EE09F3D295904--

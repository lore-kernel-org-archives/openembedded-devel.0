Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.71])
 by mx.groups.io with SMTP id smtpd.web11.1144.1590611517977511704
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2020 13:31:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=NgHd2NaL;
 spf=pass (domain: windriver.com, ip: 40.107.244.71, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iFdP44lpaLREnCp2TV4Ak6Ldsy20rHi0bIY1C2o4A4KZls3iDt5SL+0jSQdrva4blz7GNNPN0rDC+GyfB0vManx2zA5Ye2LnvU8gFjvnTgDRY/STLAdukhon16i/+CCi/XLXhhXIuO6cQ8VRhivhsEqKr/qUyEyesxwzSlQnwzenlOrTXgGTryDBYjuNeIpk7oecUiLRD7HCGpKYwucMPLzDIdV/C8dfUrleNWqWRQTDAuEqF3A/piYbbMamD6PtmU32DvJDxOI+0visjKNw+BhxHvi+cJ/ccXDafHZe0YO4/cTb3K/CTUtupGRmdXzxfxcad8sFLlQwAkJpicV9Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8PnnEVu88pWMk5PA46qkYALhQR6m5IHd5WfrUaTNgUE=;
 b=k5RWUXD6ynFVq100PHUaeXYnPZ25Olw7v00q6J3N3Rd0T8Yito7RjWktRCSjj2JmAo066DlnJ8bsWsHrFk4Snyz9gs4tG+xqB1SGcOi+GmUAomekab7AFCL2J/HwlXK/Zs7dDui5zMtWy6N6kKoZ1B/4ww5crI55gsK5adlkFHI9ojAaoEdFxPD7qTo5pSBjr7I7g601ar5UFL5udVJ0ZaDVyf4ZygBIaM4HdM9Yr87vjPSucbpNElI10FS7TPk6hBhVjn6gPOZ8XbvsNTvVcf8N2lIqw/SOl2ewcz1E3lplqaGLPDpBbxPtfNsfLkH82OEujMvWX9jeHea0njqhGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8PnnEVu88pWMk5PA46qkYALhQR6m5IHd5WfrUaTNgUE=;
 b=NgHd2NaL3Ccgz2HfyZB5DSLT1wAA5OJPrIr1l+v8xEbQLV2tggEOp1Lsfl2EcY6vTjI1A1UrnQ/1QWgATkmRP31Eo0vLwfViMyrov5w8VNneestxjXitI63g2+xkbZvohVbaaS7n0kYgVrVylxPLrVp6aLeI/EKnWWqBJnUzGeM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1473.namprd11.prod.outlook.com (2603:10b6:405:a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Wed, 27 May
 2020 20:31:55 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3045.018; Wed, 27 May 2020
 20:31:55 +0000
Subject: Re: [oe] [meta-python][PATCH 1/2] python3-click: Upgrade 7.0 -> 7.1.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200527122229.24023-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <aa3a52da-85cb-b584-5fef-cd9504a8f987@windriver.com>
Date: Wed, 27 May 2020 16:31:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200527122229.24023-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0119.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::28) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0119.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19 via Frontend Transport; Wed, 27 May 2020 20:31:54 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49ad064b-e984-459d-d2eb-08d8027cfecf
X-MS-TrafficTypeDiagnostic: BN6PR11MB1473:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB1473A0FA0702E1BCAAA892149FB10@BN6PR11MB1473.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:923;
X-Forefront-PRVS: 04163EF38A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	F49S0Tl+7rtqYoh8gl26tzkSOxtS9wJY+VB2tXyO8P7qBo8jt0ghblhXhHTgEafwLUlzF9JnpZ//mnWac/Y1ixbRRwWM91SxtC3WHWpLj2M7CWT5UUz7fh5m0YsuvcxeHpaXcrlzSrMWOoD28RYJUr57GaTijXUq25hAkjB8aiQnhmJff0pNHhFV7QDrHiwWepFAK03g5DHfde5AnQZf9viWIUiX/KnQjesMvbD6YbMgC3jV7HGYZCOWDeQoc/eWSBFA/CXYbEQF9T2/acJKfNV5mXNriRPldboDPwlXAzXJ/L75rDqZuhCLtEwzQHAzWL8Ko/l86A3lxqrPveFKUBlNfRj8CW4d50ec/Cvnj1R19yzxiTvB8MKERZUFkL60vm6tPUtkYQGEnXB9Vs/N/rb4U+H3bB3ZLOtF46toevGyXgpdRirApW85ZuiAwiWx22jy5J2a7IGg4DJ/y7AiUA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(136003)(346002)(39850400004)(376002)(396003)(8936002)(44832011)(6486002)(8676002)(33964004)(2616005)(66946007)(16576012)(316002)(186003)(166002)(956004)(2906002)(16526019)(83380400001)(66476007)(66556008)(26005)(5660300002)(52116002)(53546011)(86362001)(478600001)(31686004)(966005)(36756003)(31696002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	0BtzZqUafGON0Ooj0Rt0lhcjkeaQOVXTkhEMSaUKkl9Gkr7N7TA9sa9J2SsxxgLgiO0E2hz8Y7VEMQCVVBLkDiJ3tljGMg2SI9tYwZyWJj2zDWwKC3bF51DSknCTSanwASLJjeIVexGFbFL7hRSIV5NHYw3EJzRIngNx2Fd6FEhnDPMcaPPLIDjEKShxIv65FaZYn3SfkeMTCCSU1ozPzRNf0z9wF8cpBSwjVgnJAbM8wmTB3j/mptS+xd8LiCRu125FCVR1dGohz1F9g+1g2CA1be3o4pgqLxL4HBUcsz4n73uSulZehpTpn8DBmfLgWMBz6cnE/LOtBVEVgRmJrdt+mWyjamWKiWg6Lxe205jjZiAubrZRd1iVj+df0MwM63sQKxJgnT9qAGZyNbqxK/aQr2PlLuuqZ5cj7a8aLj4y9HabpGr1m0axhQiopUjR8HCce7UDHFJ7xgz9Uoko1DyzNvNSzw4cLtWqWahYik0TVptylSf749TOs9X55IuE
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49ad064b-e984-459d-d2eb-08d8027cfecf
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2020 20:31:55.0382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h7D+eVTSNl58L3zBWb4MOd1L5nFsYzv3L5YuewzZAWR8Q2jGmrlWKVPrdPQouvl4ENPiVdpAxgMRKoQmp/1h913RK0cHDhRsTDNEgHRmpw8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1473
Content-Type: multipart/alternative;
 boundary="------------8A0A37776FAD29F73F1BB885"
Content-Language: en-US

--------------8A0A37776FAD29F73F1BB885
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/27/20 8:22 AM, Leon Anavi wrote:
> Upgrade to release 7.1.2.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-click_7.0.bb => python3-click_7.1.2.bb}       | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-click_7.0.bb => python3-click_7.1.2.bb} (72%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-click_7.0.bb b/meta-python/recipes-devtools/python/python3-click_7.1.2.bb
> similarity index 72%
> rename from meta-python/recipes-devtools/python/python3-click_7.0.bb
> rename to meta-python/recipes-devtools/python/python3-click_7.1.2.bb
> index cfa3e0fe4..fa29d11ab 100644
> --- a/meta-python/recipes-devtools/python/python3-click_7.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-click_7.1.2.bb
> @@ -6,12 +6,11 @@ Line Interface Creation Kit". It's highly configurable but comes with \
>   sensible defaults out of the box."
>   HOMEPAGE = "http://click.pocoo.org/"
>   LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=c13ed890b210a882c1778216694c98c7"
> +LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=1fa98232fd645608937a0fdc82e999b8"
>   
> -SRC_URI[md5sum] = "7f53d50f7b7373ebc7963f9ff697450a"
> -SRC_URI[sha256sum] = "5b94b49521f6456670fdb30cd82a4eca9412788a93fa6dd6df72c94d5a8ff2d7"
> +SRC_URI[md5sum] = "53692f62cb99a1a10c59248f1776d9c0"
> +SRC_URI[sha256sum] = "d2b5255c7c6349bc1bd1e59e08cd12acbbd63ce649f2588755783aa94dfb6b1a"
>   
> -PYPI_PACKAGE = "Click"
>   inherit pypi setuptools3
>   
>   UPSTREAM_CHECK_REGEX = "click/(?P<pver>\d+(\.\d+)+)/"
>
> 

--------------8A0A37776FAD29F73F1BB885
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/27/20 8:22 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200527122229.24023-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 7.1.2.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20200527122229.24023-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-click_7.0.bb =&gt; python3-click_7.1.2.bb}       | 7 &#43;&#43;&#43;----
 1 file changed, 3 insertions(&#43;), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-click_7.0.bb =&gt; python3-click_7.1.2.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-click_7.0.bb b/meta-python/recipes-devtools/python/python3-click_7.1.2.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-click_7.0.bb
rename to meta-python/recipes-devtools/python/python3-click_7.1.2.bb
index cfa3e0fe4..fa29d11ab 100644
--- a/meta-python/recipes-devtools/python/python3-click_7.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-click_7.1.2.bb
@@ -6,12 &#43;6,11 @@ Line Interface Creation Kit&quot;. It's highly configurable but comes with \
 sensible defaults out of the box.&quot;
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://click.pocoo.org/">&quot;http://click.pocoo.org/&quot;</a>
 LICENSE = &quot;BSD-3-Clause&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.rst;md5=c13ed890b210a882c1778216694c98c7">&quot;file://LICENSE.rst;md5=c13ed890b210a882c1778216694c98c7&quot;</a>
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.rst;md5=1fa98232fd645608937a0fdc82e999b8">&quot;file://LICENSE.rst;md5=1fa98232fd645608937a0fdc82e999b8&quot;</a>
 
-SRC_URI[md5sum] = &quot;7f53d50f7b7373ebc7963f9ff697450a&quot;
-SRC_URI[sha256sum] = &quot;5b94b49521f6456670fdb30cd82a4eca9412788a93fa6dd6df72c94d5a8ff2d7&quot;
&#43;SRC_URI[md5sum] = &quot;53692f62cb99a1a10c59248f1776d9c0&quot;
&#43;SRC_URI[sha256sum] = &quot;d2b5255c7c6349bc1bd1e59e08cd12acbbd63ce649f2588755783aa94dfb6b1a&quot;
 
-PYPI_PACKAGE = &quot;Click&quot;
 inherit pypi setuptools3
 
 UPSTREAM_CHECK_REGEX = &quot;click/(?P&lt;pver&gt;\d&#43;(\.\d&#43;)&#43;)/&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------8A0A37776FAD29F73F1BB885--

Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.62])
 by mx.groups.io with SMTP id smtpd.web09.266.1610649807990932395
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Jan 2021 10:43:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=DdoECyeX;
 spf=pass (domain: windriver.com, ip: 40.107.93.62, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gloTq7d39yJezB32dr3q5jcbf0wBqMadgO+bffU/ZPv6gE+ogW5soi754OppLx1yMk2ACE8z7wyodKqreF019zoFkSNIj4e+2EBPi6R9pSlkpbrvpAgAFUw/xAcht/RhA55ROujKt3MtyV8HjXxc8xbbUAnTC7Q78XJ1eaO5t/1Grp5Emxfi4UfcaPbPLjTdApswh0JuM2v1UXNRXDGx1CHO53L2HEEYPbIE5B5K3BCt6i+2ipVjFuCPeOIgaEcNuyQnxGaAnu7FZGc4B+2ysVsz3wSDg4Z0Be54qmENqjOn3FlB8Kq/AE6O5q+VNnHKuYFz7VOvabyCc5uiu/IlWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m/b8Oc8RrmkdiYKnoKRZZQap7L4PL8M1kW6gpct6PWs=;
 b=dmcuRyagGdbYQfIoEpfuR0KZ+x1ys8FXJedC/s+6UGUIEEuyzSbgo5v8dlCwUVT4NeXLA1FdsR8Cxpg3kSgJplNKDsXHrNw7ikZ03PhlaYJvzxtQKMZAn9N0QyIQeqCXx/hWgRaXUeFoqNRuTKn17sMn7y2UWk4IyweMkXBJXog/9L8njuWj7V/YXmixazYY/l639eLIuZV00qG9I4dt9xu5tH/QjTmv6dQ1hCroHlGP5chlUYqPHfzq4REMB+Dx7nz32pIhAvXKcleKa8uy7RgKc1GallRY9MJIugg1ctV/3rvg6/H3+wkBcQTVtf647MfJ/QOqNJKMohuoKFCxCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m/b8Oc8RrmkdiYKnoKRZZQap7L4PL8M1kW6gpct6PWs=;
 b=DdoECyeXueNL+/x125332b2vnOy+hys6gbEyv+8j0Gf6yEyd3lxxkZhJKhhSgOdZOjBuVY2TG0e8osyUmTgmSQyeeUUyuwUpqvBQnE1cpdpyGt7vO2csy73xveo2hezOfC2L3yTUERGdQsXVxnyk4rnKyL5S4Od1Bun/8wCaXTw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3606.namprd11.prod.outlook.com (2603:10b6:a03:b5::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 14 Jan
 2021 18:43:26 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6%7]) with mapi id 15.20.3742.012; Thu, 14 Jan 2021
 18:43:26 +0000
Subject: Re: [oe] [meta-python][PATCH 2/2] python3-pyjwt: Upgrade 1.7.1 -> 2.0.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210112182354.15359-1-leon.anavi@konsulko.com>
 <20210112182354.15359-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <6bbe63e4-c3a5-f386-e96b-132fecea632f@windriver.com>
Date: Thu, 14 Jan 2021 13:43:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20210112182354.15359-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR22CA0010.namprd22.prod.outlook.com
 (2603:10b6:208:238::15) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR22CA0010.namprd22.prod.outlook.com (2603:10b6:208:238::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9 via Frontend Transport; Thu, 14 Jan 2021 18:43:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73a14a22-2ec5-49bb-1dff-08d8b8bc47b0
X-MS-TrafficTypeDiagnostic: BYAPR11MB3606:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB360666337161DAD5D922DDC69FA80@BYAPR11MB3606.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:632;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vBjAHsANX1uDMGk/j06+87Ss3JQZ3estGQ6w+SweTy7UtbMGIbJSY9NsdptlroaJtTQrDq09Rnlr4eQxwF1g5C4tT7R4GSYEuVQE7zd8cU4WpkEL39CkLGQVCBrgCeB4Yp26eezh8sPSUoRwu+AULCQlXSisg1eyYR6IM3abCb+vEuLVMN9lQMntPrZcNal0djROTn2pedbwX+JZNLEVqeERUUAMflugRm51meGl9EbkGkXyqqQJq6l9U8n/ii/wSufjU3qR2IKPC+1HbbTFwclnZCmH8LndHHrva24Zi/SWbCAObdcJerfy1zCh2O3MjYNDphC5dl2ZlvGLNcNDhcnXuRPbbmrTiWEIRTjoJpfuOvGTvIudDBKXMluLR4ldoBAzj/6PijP/xKC9CPqAe/HqFTBID75Te8fonbnh25IK63K/f74vs5q7NSuVPsSmfCC4eBGwQkUIRKtzi0Ksz/O9Ade/mtbPvm6yDxrahyljFgdXFHSXHojzlQZJKa/pm2ySSusizr2C+TFFAMpRL7ATgt047ru4I5rNUktQgCXT7Q45OX+JW6czr9WywmT5m3D6j3zcIHDm/gSxbkDwQQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(346002)(366004)(39850400004)(966005)(186003)(33964004)(83380400001)(16526019)(8936002)(478600001)(956004)(52116002)(5660300002)(2616005)(2906002)(19273905006)(53546011)(86362001)(31696002)(66946007)(26005)(316002)(16576012)(166002)(8676002)(36756003)(66556008)(66476007)(31686004)(6486002)(44832011)(43740500002)(45980500001)(563064011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?UGRkdW4wMWN2cEdFMFhpR1lpZFdnRll6UWhleFlhTUNtYXd4RTRLRW1UMmhz?=
 =?utf-8?B?ZE1yVC9zZ2IxT0NCY3krSEZDWGpLV2xsYnM5bFFpWVlCdUtLeTJoc2ZlRkln?=
 =?utf-8?B?SGJsTCtlczJIWm1FZSthY3Mxd2lFMFRtYjJRdXk3MytJdGZITmZETjBlNytQ?=
 =?utf-8?B?cTBUWEhqMkxoV2JqUEJ2MitaMjVTaVhTSy83RlgrS3lhY1ZHa3dNbU9QNkJu?=
 =?utf-8?B?RGl0TklmNjBsajFuUG5FSjl6YzFETDVwQnpwSzB0aTMxUkRRNFFCWFJSNjA0?=
 =?utf-8?B?Zkhvck96Y1hZVHVyWmtPKzdXN2lEREl4OE53dG11VTUxRkZjK2M0aTlvUlpn?=
 =?utf-8?B?cUFDMWFic3hDVDdvMmxTUndxSHFZWGFrQWNCeUlzUjlLQXB5RDVRcWxQUTNM?=
 =?utf-8?B?VnFKazVCZGRFUm91YnNHYkZHaFNZeWZtZzdQaDhReGIxeG1XdklWU0VjZTR5?=
 =?utf-8?B?eGNNNzFxSzVCNVJNSEh6eUl0N0dtSE9XaDhuMjJ3VmNub0VteTl5RXRuOVRO?=
 =?utf-8?B?Q1Y3ZTN0eDAvSHROTGQvakgxUUlyU3EyRXJlNHowZXBSYWVnSFIwNFUrM0VP?=
 =?utf-8?B?OGNJTkl2SUJZbnNrejNPY29nRmN5Rzk1dkUvQkxIUTBUeC82aDU0Z3ZYTGlH?=
 =?utf-8?B?Q3E3b1U5cm9PbE1WZHY5OXJnM0dVRU1XaHlZQUw2TFNiQUVhbGcyY2J1NFNB?=
 =?utf-8?B?T09qb0dhWHdHSklKcUVGa0RySW5HUCtLNUVKQkk3VXY5MmJWOVZzZklsSTc5?=
 =?utf-8?B?WUxYMkI2UFc0TWdLOVpUSWZzejJHdlBpNVpyM0ZIMTRUanZOY29zT0k4cFIr?=
 =?utf-8?B?T2JqZXBRZDBOc1B2TkxseVl5TDVMMEpDVE01Vk1NL2JqcmtUOFRqdUhyY05v?=
 =?utf-8?B?SXFOYkgwWndTZHM4ZmpuTW91VmJpRFB3dFdGQ0E5elhqOXQ4bUxlVWRlenBN?=
 =?utf-8?B?c2g1aGtKTWtSYWQ1SVNXejZ6QkpyVjNKZDdLRkFLL05NdUxuaVBWQys5dDR2?=
 =?utf-8?B?RFRGbXhWR3Bjbyt6Rk52Vkh6K29LM3FWNDYwWXZsZGlzbEpuN3lOMXF4Zi9J?=
 =?utf-8?B?S3praU5IOEdYSTZKajZhdnc2eW5vZTRvRWpvemI3U1JqWEJYNlVBYm5WLzV4?=
 =?utf-8?B?Zklxb3dYSlpGUEw1dDRRWnRoUGZCTlhENjN4YWlqc0dhb1FseWNoQ2NNZDNl?=
 =?utf-8?B?NFJBaWlHVW54TXIvRE9zS2tWbEZZNzJ2dmJIOGxjMW4wdGJvVXd0ZUJsYzhM?=
 =?utf-8?B?ZDRlc1NtbGJKYnN1KzNDRHMyQmtiM0JiTFlTM05DenhSS2FGUjNGY3F0bDdo?=
 =?utf-8?Q?XoFl4hpeFAfRQg/GpvkIv5c9wGKF+fs4Sf?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 18:43:26.8412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 73a14a22-2ec5-49bb-1dff-08d8b8bc47b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qSw2Vc9qV968bgH0+spzNu/t2SMg9HiDgjfTB4VMOFwxmmoqqtOHPnMK+1gDftDGGdF4rAufjstLbeVcR0n+STpXWYOnzEPHNGMn4dI1664=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3606
Content-Type: multipart/alternative;
 boundary="------------76AFDE9FF9030E91659A622B"
Content-Language: en-US

--------------76AFDE9FF9030E91659A622B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-12 1:23 p.m., Leon Anavi wrote:
> - Drop support for Python 2 and Python 3.0-3.5
> - Drop support for PyCrypto and ECDSA
> - Improve typings
> - Introduce better experience for JWKs
> - Support for JWKs containing ECDSA keys
> - Add support for Ed25519 / EdDSA
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-pyjwt_1.7.1.bb => python3-pyjwt_2.0.0.bb}  | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pyjwt_1.7.1.bb => python3-pyjwt_2.0.0.bb} (76%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_1.7.1.bb b/meta-python/recipes-devtools/python/python3-pyjwt_2.0.0.bb
> similarity index 76%
> rename from meta-python/recipes-devtools/python/python3-pyjwt_1.7.1.bb
> rename to meta-python/recipes-devtools/python/python3-pyjwt_2.0.0.bb
> index d2f7be46c..aa6531ea3 100644
> --- a/meta-python/recipes-devtools/python/python3-pyjwt_1.7.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.0.0.bb
> @@ -5,8 +5,7 @@ HOMEPAGE = "http://github.com/jpadilla/pyjwt"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=68626705a7b513ca8d5f44a3e200ed0c"
>   
> -SRC_URI[md5sum] = "a4712f980c008696e13e09504120b2a0"
> -SRC_URI[sha256sum] = "8d59a976fb773f3e6a39c85636357c4f0e242707394cadadd9814f5cbaa20e96"
> +SRC_URI[sha256sum] = "7a2b271c6dac2fda9e0c33d176c4253faba2c6c6b3a99c7f28a32c3c97522779"
>   
>   PYPI_PACKAGE = "PyJWT"
>   inherit pypi setuptools3
>
> 
>

--------------76AFDE9FF9030E91659A622B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-12 1:23 p.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210112182354.15359-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Drop support for Python 2 and Python 3.0-3.5
- Drop support for PyCrypto and ECDSA
- Improve typings
- Introduce better experience for JWKs
- Support for JWKs containing ECDSA keys
- Add support for Ed25519 / EdDSA

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210112182354.15359-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-pyjwt_1.7.1.bb =&gt; python3-pyjwt_2.0.0.bb}  | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyjwt_1.7.1.bb =&gt; python3-pyjwt_2.0.0.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_1.7.1.bb b/meta-python/recipes-devtools/python/python3-pyjwt_2.0.0.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-pyjwt_1.7.1.bb
rename to meta-python/recipes-devtools/python/python3-pyjwt_2.0.0.bb
index d2f7be46c..aa6531ea3 100644
--- a/meta-python/recipes-devtools/python/python3-pyjwt_1.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.0.0.bb
@@ -5,8 +5,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://github.com/jpadilla/pyjwt">&quot;http://github.com/jpadilla/pyjwt&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=68626705a7b513ca8d5f44a3e200ed0c">&quot;file://LICENSE;md5=68626705a7b513ca8d5f44a3e200ed0c&quot;</a>
 
-SRC_URI[md5sum] = &quot;a4712f980c008696e13e09504120b2a0&quot;
-SRC_URI[sha256sum] = &quot;8d59a976fb773f3e6a39c85636357c4f0e242707394cadadd9814f5cbaa20e96&quot;
+SRC_URI[sha256sum] = &quot;7a2b271c6dac2fda9e0c33d176c4253faba2c6c6b3a99c7f28a32c3c97522779&quot;
 
 PYPI_PACKAGE = &quot;PyJWT&quot;
 inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------76AFDE9FF9030E91659A622B--

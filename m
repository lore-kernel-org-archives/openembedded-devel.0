Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.62])
 by mx.groups.io with SMTP id smtpd.web12.13033.1597334009300430687
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2020 08:53:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=TR0DjpgP;
 spf=pass (domain: windriver.com, ip: 40.107.220.62, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JZ2tfPOtFpbICM6Bm+4GvCrSSgO9teoVbzQm/TLbb2lXxseKZJzqxaunZooMyrAvO9/9AzmupuJBv8i3NmHrc5eyeJP1hZRR+41FyUyqHKI+W4gE+IAM8nM5ZZMJy3ktjbBoYKS+imMq4jtm4nAZqToPGav+hl4oszKEympRpZIclM18Hr5mGW94VoalHSzqbfoAPgbJuZF05T0QdeA4YnnANvzIsBpgBO8QKYPFmeY8Sj6ld/rTckrDsiUx4PfjOco8kMJVQqtyyLygKTrVjfCSJtEVipEhLLjCcsUCAUvcQNiJ+IXSRG5yxoRqU1nHEgG1/72PHcCWrhxQzG5ZZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f7ER8yTGDo3g+zIYMO1CG8Yy9aD7ivQVDJ3u7cvye6g=;
 b=G9xrD2lAzmaiSk7ld6g3UkZTpbesj7F4mSulnL0jICtDw5lyBGGE4u9+Tip5HPMQsbobNc/XMv727gnRCM5z4ORW0zPqgMYYv/dHhYRLKCLSYeYSOKscIo7vM3XfGkpnKgAcR8cAx9BbpM3sVkt0UM64QOz3Mj7d4uUY8c38JjchWamKr3S66Xn37WmytnsNtskSDyQJIvsFuQm6lB1RaaqMCQKg6vpRj2jXQMzMv1y/XcLJNhSDFr80bGxqv/oxWpmK/AHyG3LPboxxLGCLQZaHihHgm4CmLIY8FkmJpAkwnD9pwV5xwg0X1ZfFGYVUh1wn4ghdCMVPlvcm7/XAbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f7ER8yTGDo3g+zIYMO1CG8Yy9aD7ivQVDJ3u7cvye6g=;
 b=TR0DjpgP/LASh3KEMARPNZ6veDguYvbQeQ8CwJdOL7Or9lzf1YLuPYGxtweINnLoVk+XIp2EraYAOGuyQUbCJKE6uPdNH25KL6i58sKmWMg5lgB6UNG3hK2tPF8jJE6q0syeV47+lsN3Xkbrh4xgLH+8dq51n9VA7m4mbRuoflo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4183.namprd11.prod.outlook.com (2603:10b6:a03:18e::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16; Thu, 13 Aug
 2020 15:53:26 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3261.024; Thu, 13 Aug 2020
 15:53:26 +0000
Subject: Re: [oe] [meta-python][PATCH 01/10] python3-luma-core: Upgrade 1.14.1 -> 1.15.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200811114430.27916-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <bc3e869b-2add-e87d-610a-37002aaf7ff5@windriver.com>
Date: Thu, 13 Aug 2020 11:53:23 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200811114430.27916-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0064.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::41) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTXPR0101CA0064.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::41) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16 via Frontend Transport; Thu, 13 Aug 2020 15:53:25 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8e3f886b-8cf3-4cfc-b9b0-08d83fa103c0
X-MS-TrafficTypeDiagnostic: BY5PR11MB4183:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4183F8FA200559485D9987F69F430@BY5PR11MB4183.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OQxDO5RnFTKchJp/cYctQApOtiNL6WZOjc0gFW2CU0nCzmO6teuRVe/Z5t7WZSjCzRU/A5XvzGjXDul3JDxU3Xt1HQljNzVUb9CKo4iUtC1PAchK0UCJnptkbZDWQblrsY5lUVzRv6IMZ8kh+wuMSm00L1dpR3HiJPpaHYb0oWIpgVGALYD97r1vxDFX7G2qlAkLcxsetvspF5ygNKxIoq58ajddSHtHx2ROGCWNh2O0pSBMhoumB1rd3ZuJ5vPJLnLv0KtlJtd+Y276STTV4kNeNMLQ35yDJeF/ePmsyo9weymDIAfqq4Bthb48ajCGvdXPy3L1cQ8UcZgooVh21Agopp3qSwDIDX7XUqERTFzMZ+LVfn9/xtmEZ3TITTAoqd3c7Lsto0GPLEp52KRcyXXHzHYdWvk5JfdREx8SRZdrzt9vys6wL0DSCAtXHH/ckSvTPDs/PfBkK5jf030Mpg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(376002)(346002)(136003)(366004)(396003)(316002)(2616005)(16576012)(956004)(66476007)(478600001)(166002)(36756003)(83380400001)(66946007)(66556008)(6486002)(186003)(31696002)(8676002)(966005)(52116002)(5660300002)(86362001)(31686004)(33964004)(44832011)(8936002)(16526019)(2906002)(53546011)(26005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	1ncyp2KWWYzyJqutExNUQGCczWb2HtuVTo+0D/dVdIzVFDf2LmrlGTXaGE6z/Te/TnRXI3UmJq/hSKJaHucx7VL0mZIlxuSjQ8ud4+SHSpx9RdFWkQ4Jw+A2muysWkE655L1MDfF4Tj7B1Q/yFHI/EOPV418L1zF8ufbze/xmNb8YbRCBLy1IlDWpteSG/B90pkgpc0FpQWPiMQENehZ+XGIY4HkETzulqYLk5qcj/4r0gHqxVsLngG+G8j0EBC+NIeYhCw7ibuDHQ9Ke36c3uG/S/nkPNjby4BgcqvcIEuwgr6CDIHfab0fhnfDsk6mMCpXYhBIoG4clIYfgZ/VJv6p8ogeoHgscngH0thnXkvNSfTnymDUuRUe51VHxN49h6h4tUBNIakis5uWhACY2Xv4dLtzkJ3hTr0Sv4RNgMmkVvlo39BXIwBjUrKxHOaQID/GcWjLUhPUUqKUWOxrO1sdgA5hnnuoONsROVTbd6wA63ZYnoZOCkBrPfjzXC2toZzYVUjbckhlfZqtglN2iXPO66pXUYLJh8g9Og8PzSIsnxAdy02qEs5gFYOiazwqWmnSpfAeLI5VikZ+b8HZ+P5lqWOC9AcklQiqT+Ds95Q5Hkx5tGtJDibW6cy4XYFKwFXezvXwqfTZFS0DfBRhpg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e3f886b-8cf3-4cfc-b9b0-08d83fa103c0
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2020 15:53:26.0590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CxlyQgEWjKxDTV5gQGFhsUPDkZVO/hYnluDN6Nv0sht3gzM3IK7Yn7hHRhLsHo4yxCuEKKyMvs6LAG3KyqNVsrn/dnOH3KrRERF50Oey1v4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4183
Content-Type: multipart/alternative;
 boundary="------------0113CFB8DA1FC8DE301B0B0F"
Content-Language: en-US

--------------0113CFB8DA1FC8DE301B0B0F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/11/20 7:44 AM, Leon Anavi wrote:
> Upgrade to release 1.15.0:
>
> - Parallel bus and I2C backpack support
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...ython3-luma-core_1.14.1.bb => python3-luma-core_1.15.0.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-luma-core_1.14.1.bb => python3-luma-core_1.15.0.bb} (75%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-luma-core_1.14.1.bb b/meta-python/recipes-devtools/python/python3-luma-core_1.15.0.bb
> similarity index 75%
> rename from meta-python/recipes-devtools/python/python3-luma-core_1.14.1.bb
> rename to meta-python/recipes-devtools/python/python3-luma-core_1.15.0.bb
> index d532405cc..17445e727 100644
> --- a/meta-python/recipes-devtools/python/python3-luma-core_1.14.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-luma-core_1.15.0.bb
> @@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=eda804060ba2312e41fe96b6fa334fd7"
>   
>   inherit pypi setuptools3
>   
> -SRC_URI[md5sum] = "a738326f46c860acf6a4a9b2ec36ba73"
> -SRC_URI[sha256sum] = "972dc312b2831fe4c6b51943cc36903a9508cab8d9f2631a7ee485695924d34b"
> +SRC_URI[md5sum] = "9c890fa8e387a035ff0d1ae96a0715f1"
> +SRC_URI[sha256sum] = "e0e14c762695fb8758e8b15cfd28cd4c1618bf2fd93157c8770a2e8e0e254ae5"
>   
>   CLEANBROKEN = "1"
>   
>
> 

--------------0113CFB8DA1FC8DE301B0B0F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/11/20 7:44 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200811114430.27916-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.15.0:

- Parallel bus and I2C backpack support

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20200811114430.27916-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...ython3-luma-core_1.14.1.bb =&gt; python3-luma-core_1.15.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-luma-core_1.14.1.bb =&gt; python3-luma-core_1.15.0.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-luma-core_1.14.1.bb b/meta-python/recipes-devtools/python/python3-luma-core_1.15.0.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-luma-core_1.14.1.bb
rename to meta-python/recipes-devtools/python/python3-luma-core_1.15.0.bb
index d532405cc..17445e727 100644
--- a/meta-python/recipes-devtools/python/python3-luma-core_1.14.1.bb
+++ b/meta-python/recipes-devtools/python/python3-luma-core_1.15.0.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.rst;md5=eda804060ba2312e41fe96b6fa334fd7">&quot;file://LICENSE.rst;md5=eda804060ba2312e41fe96b6fa334fd7&quot;</a>
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = &quot;a738326f46c860acf6a4a9b2ec36ba73&quot;
-SRC_URI[sha256sum] = &quot;972dc312b2831fe4c6b51943cc36903a9508cab8d9f2631a7ee485695924d34b&quot;
+SRC_URI[md5sum] = &quot;9c890fa8e387a035ff0d1ae96a0715f1&quot;
+SRC_URI[sha256sum] = &quot;e0e14c762695fb8758e8b15cfd28cd4c1618bf2fd93157c8770a2e8e0e254ae5&quot;
 
 CLEANBROKEN = &quot;1&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------0113CFB8DA1FC8DE301B0B0F--

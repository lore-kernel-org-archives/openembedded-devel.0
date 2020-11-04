Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.46])
 by mx.groups.io with SMTP id smtpd.web09.13860.1604501134025361224
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Nov 2020 06:45:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Nd3hQCPf;
 spf=pass (domain: windriver.com, ip: 40.107.243.46, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XSQmtR3/QKi1udW0+W+vSHWe0mkQ0uSUNqofDaWv3wE4khn83tHQLxwHKQbSvCZox8nSgawd+LQDuLSqzdboBHnCRLqEGVomKw6KSBxmbxI9QDAhDwgcd1XMV/9W5zSF7hyYar7DuqQJ75x5i484S/2F/Jk4oCwrUNdug+FUbGmxW3W0IZNhBxXK0ixTP8Xisz5vnd5PfE3CWtnY5J18L977UmGaYmVdNSL92LWzJqaRL009Nr43FNYyO7RwtKeXtHbfftJphPAvw20hsudSEUWGQvTVtswaQ7nXMCx5aqaFwsm3xWidU0kl3ZeSNQO6SdOHLu6mwEMkdxCPOnMpeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3yPcdALIizRnWHT14yUTUY0zesOVATlxIaP0vxL3ZVc=;
 b=lwo7a7DaPQRrqPApKdoT5gbieG39WvSCaOI7jZ0vcwTzRmlU/YRwHhvGY0CQ1Zogn5bhLpUDFxuJU1K+GJ3becs9XT0F5nXWfWskz7VZQEkt4xd+UFQrWSRktkyQkfpiG3uQFb/PMiVZ27Zj3LGRizY1E4z64y1OWkPHD1/82/tu7aOxiU8Lbx7gG/jtaCcKy0KtJCNk6Sz4QJkaF5JFJ7FgQMnDXXicOdV3l2ZrS9nFVDTWzICg44ardmnqSpj2XVFpwAEixbpivJc03p1fgmCPlor6/OE/WSbUX9dCD+1tkWbuP/QMPFbUlCTJicc0FD3ms/dYDTc4t3mfNIetkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3yPcdALIizRnWHT14yUTUY0zesOVATlxIaP0vxL3ZVc=;
 b=Nd3hQCPfKDl9a+/JxTv/orrwdVCQ8nA/kxJQIbY9wh5Il6zy6kkqRsVxa06oAGyg581/DMD0yA0JpcSh4bZiyU3qZCWc0lccV6SDrz/i+bhaFJQ139KVba0X2iwoYrcft51bi7s6gcQlVdRNC9rW9boZ/NSH7u6bW1WkjFWu06s=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB5085.namprd11.prod.outlook.com (2603:10b6:a03:2db::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Wed, 4 Nov
 2020 14:45:33 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3499.032; Wed, 4 Nov 2020
 14:45:33 +0000
Subject: Re: [oe] [meta-python][PATCH 4/5] python3-luma-core: Upgrade 1.17.2 -> 1.17.3
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201026115041.11671-1-leon.anavi@konsulko.com>
 <20201026115041.11671-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <b8966f7e-8a61-5551-0f5d-632c913106ae@windriver.com>
Date: Wed, 4 Nov 2020 09:45:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
In-Reply-To: <20201026115041.11671-4-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BYAPR05CA0004.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::17) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BYAPR05CA0004.namprd05.prod.outlook.com (2603:10b6:a03:c0::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.10 via Frontend Transport; Wed, 4 Nov 2020 14:45:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 100afe56-ff62-4d12-27ab-08d880d04844
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5085:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB50850BFEFE3254CB054177449FEF0@SJ0PR11MB5085.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hFonIfZ4KLKDwyABkx35QmBy58xVNxyECvEwri92y5Ng1tPjOYwy328ipTamBizmhrmkv9r72U/8OKofjnZ/dlW6/HmrS7ZeNuJr/+7sVF27RCgq8WzEzE/uOn12NWQA7fNAY45bw/kl0EUjFOBxSx91dqrQ1/ejYhooFZIEvnp3b4BXi84gDxuvzXeMDw31qbsnyEfdR/JI0y7FIr01dKI5cFMv98dqFYciZnw9OLHqEkeo7SvzZXN2Isj5JKSYgTX1mO6JAwwS+4VpxOO6hCmUzFZDEXBqabpMYaRw7b2EIKqKAra8g0s2EKMVEogMUUQrCR0weLQYSR9uBv/zRC3xMIkT20aHAub3FZGlKyR8rXiOoo4iB6Ujap1irIQcdcJrBwg3gRsSxO0QaobHxTgbDHO07imu/YjsDr8Owx94iM+7qSS1Ye4Y5pfeYxFFv3U1CdOi7ixb/bLi93msvw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39850400004)(136003)(366004)(376002)(8936002)(36756003)(6486002)(166002)(5660300002)(8676002)(33964004)(53546011)(66946007)(86362001)(66556008)(66476007)(44832011)(83380400001)(52116002)(478600001)(2616005)(956004)(2906002)(31686004)(316002)(186003)(16526019)(966005)(16576012)(26005)(31696002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	1qrQBKv6kP8dSGr2RXp+dD8R/CJDh3WiX1edcIhDiaOqgZzrrHFSyYHruhSzO5dZYLYKWZomNZ1V4oQY1wxU7n6WGoWfZgFzRKYhp6ggEAO1Q6Y2dFNawfsN9MpxHrwY78L+njlVsAlM6Bt86LRuawJP50da2t7NRN/mwWCeAEm9nAHzhoqG7wMiGjSrvNhmuv45SRa0IiOGIOugX/Rr/Ua577A+Oqzm2eu6bKcmGG7vJHf4RAc1yQKcfaZsEyLU63G+9LEzZEmeSz8ssESFwt556QJRnhPEdDwdNGv+biWwyhxa65vw/vSEEEDZbpXRs3VtY+XLm82og/hOmglWSsbOE/dLzAGTW5Ak3Un5V+7CD09eSciGHTKQJy40y/b0BqYzYfbprpoTJuBv2poGpx+VMjWVeycthm5LqBt6kYDLAAsPEd+p1CtkHzQgxUNcyccZIrX3K0A3gblzJ4JSQ+Vl54UytgOjavYs517Uy1Fy5jIBwIwLCn2kvBOWCol6xKW5DYJdCSigQeserv/h+XRu5c1CunV1LV6vcDSfyVRxrN26NCyjtwhrhtHynzb8WVWWLFNndybNzxWpIPS++cj2NWbTtGGYuJRkY+ecovP2TZtyQiycXnI7NKPsSbBD4lOVZxu8zm2O8MWgbNFDYQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 100afe56-ff62-4d12-27ab-08d880d04844
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2020 14:45:32.9412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lKhhxL1MbASZTypI0gbea1w4NF5zdfrLr2Fa6Xm7yFOBGchRDlPM7wcjSmCBPVC0fgrZUSO0Death9kaLoDiYaGjjnx7VCneG1P7+LkICWM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5085
Content-Type: multipart/alternative;
 boundary="------------69C8E033B2C6732FDE482FF9"
Content-Language: en-US

--------------69C8E033B2C6732FDE482FF9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/26/20 7:50 AM, Leon Anavi wrote:
> - Drop support for Python 3.5, only 3.6 or newer is supported now
> - Add missing cmdline interfaces: "noop" & "gpio_cs_spi"
> - Legacy proportional font wrapper raises user-friendly error
>    message when character is not in the font table
>
> License-Update: Update year
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...hon3-luma-core_1.17.2.bb => python3-luma-core_1.17.3.bb} | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-luma-core_1.17.2.bb => python3-luma-core_1.17.3.bb} (62%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-luma-core_1.17.2.bb b/meta-python/recipes-devtools/python/python3-luma-core_1.17.3.bb
> similarity index 62%
> rename from meta-python/recipes-devtools/python/python3-luma-core_1.17.2.bb
> rename to meta-python/recipes-devtools/python/python3-luma-core_1.17.3.bb
> index 97786ff456..8301d7f77a 100644
> --- a/meta-python/recipes-devtools/python/python3-luma-core_1.17.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-luma-core_1.17.3.bb
> @@ -2,12 +2,12 @@ SUMMARY = "A component library to support SBC display drivers"
>   DESCRIPTION = "A component library to support SBC display drivers"
>   HOMEPAGE = "https://github.com/rm-hull/luma.core"
>   LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=eda804060ba2312e41fe96b6fa334fd7"
> +LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=db07e3d471938ea7d7fd2135f88ac9a1"
>   
>   inherit pypi setuptools3
>   
> -SRC_URI[md5sum] = "4e4a5e85ccf19eba001d11d95b33b174"
> -SRC_URI[sha256sum] = "d66b98e23470f023a6423273e9632180a1a941849f1417c69a708ca51861c993"
> +SRC_URI[md5sum] = "c13303a123c32c1a8dc5bc089a920822"
> +SRC_URI[sha256sum] = "1c928ad8e42af5fd395260176f89eb68a8af61911971f94124fabc9c6b550689"
>   
>   CLEANBROKEN = "1"
>   
>
> 
>

--------------69C8E033B2C6732FDE482FF9
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/26/20 7:50 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201026115041.11671-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Drop support for Python 3.5, only 3.6 or newer is supported now
- Add missing cmdline interfaces: &quot;noop&quot; &amp; &quot;gpio_cs_spi&quot;
- Legacy proportional font wrapper raises user-friendly error
  message when character is not in the font table

License-Update: Update year

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201026115041.11671-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...hon3-luma-core_1.17.2.bb =&gt; python3-luma-core_1.17.3.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-luma-core_1.17.2.bb =&gt; python3-luma-core_1.17.3.bb} (62%)

diff --git a/meta-python/recipes-devtools/python/python3-luma-core_1.17.2.bb b/meta-python/recipes-devtools/python/python3-luma-core_1.17.3.bb
similarity index 62%
rename from meta-python/recipes-devtools/python/python3-luma-core_1.17.2.bb
rename to meta-python/recipes-devtools/python/python3-luma-core_1.17.3.bb
index 97786ff456..8301d7f77a 100644
--- a/meta-python/recipes-devtools/python/python3-luma-core_1.17.2.bb
+++ b/meta-python/recipes-devtools/python/python3-luma-core_1.17.3.bb
@@ -2,12 +2,12 @@ SUMMARY = &quot;A component library to support SBC display drivers&quot;
 DESCRIPTION = &quot;A component library to support SBC display drivers&quot;
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/rm-hull/luma.core">&quot;https://github.com/rm-hull/luma.core&quot;</a>
 LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.rst;md5=eda804060ba2312e41fe96b6fa334fd7">&quot;file://LICENSE.rst;md5=eda804060ba2312e41fe96b6fa334fd7&quot;</a>
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.rst;md5=db07e3d471938ea7d7fd2135f88ac9a1">&quot;file://LICENSE.rst;md5=db07e3d471938ea7d7fd2135f88ac9a1&quot;</a>
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = &quot;4e4a5e85ccf19eba001d11d95b33b174&quot;
-SRC_URI[sha256sum] = &quot;d66b98e23470f023a6423273e9632180a1a941849f1417c69a708ca51861c993&quot;
+SRC_URI[md5sum] = &quot;c13303a123c32c1a8dc5bc089a920822&quot;
+SRC_URI[sha256sum] = &quot;1c928ad8e42af5fd395260176f89eb68a8af61911971f94124fabc9c6b550689&quot;
 
 CLEANBROKEN = &quot;1&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------69C8E033B2C6732FDE482FF9--

Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.71])
 by mx.groups.io with SMTP id smtpd.web12.13148.1597334292533705956
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2020 08:58:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=RUG4yiu6;
 spf=pass (domain: windriver.com, ip: 40.107.237.71, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T4zSYWFkXCPlwwUoUXjNWusbRhGrBrHSRNgwmKvZn8c5aWXNGNX6QczNL/iuzr864tMyZg2UUTfPt9hJXiySZTZJk8qoKlDsaNtwynByS5tNqM46u65P2zd0wjZ7cm6R+eWzknvUMaImeEi6FFrW4fT/ePE+kKL8BLICqYVqOSamnHc7fX2Mmay8DihFxYwajWBUZ8lVIjVjBmB7LB/8aamol2KbJB0sCnBxD7bmCEr/DME6v03wvuPNERwQ1ukZoS5WS8PEiHP/I8bD2mcfAPa/NZ0wE0ZhNioauswQpg3bHiw/FmuZW+bNFhMy+Rh69id/TVofup8hxKzLaRkEoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vdj6GL9Vf4JojcTGxyZcPGanM2NPWLV+Szq2Qtlml5o=;
 b=TguVxI/yd15ddUwUssrvrA6FOUFib8bUcCYPVjq5f97dQ57eEHXt3covpbSM7NBYOBJGtREtUJkWrr3kIfzjHHcZyx8tz1692e+gWrudx8fv0OSNZdhjVrD4/HJdKSGLPKlqNFUABhcC1KiZxm84027whVIBjsb4+MrhX6USOHD3jjOt8DeW/0zkxzLkA0/KuwDWFeLhsoBn4h0WhaacLVBbWfqvyPjnK55ZfanBxhkYn0Cz87W2+9WG+EdVpsXFUpNacpn+XpbgT+DQ2RqnfJyqweKXC37p3JhWJ8hcOsCtPtPEc/4Eqpbow3P6ss9i6Z6UWnRHKRvJLg1zsskWtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vdj6GL9Vf4JojcTGxyZcPGanM2NPWLV+Szq2Qtlml5o=;
 b=RUG4yiu6gXQv+b2zJ02EySvyrXo6uxVr0/4D2gJQ0Qvr/JA9c7gTm6r2+m8gpkq9cMDkQiGJ7XHfQ5rnCidQbYPliVkNjLVvXQBnEVmwC8xRcj8drL0pzS4Yg6BEILOUsfxKY+5uQiWstiVSZ56ohy17GEiEHHk/lPi/oh+LnDI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3606.namprd11.prod.outlook.com (2603:10b6:a03:b5::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.20; Thu, 13 Aug
 2020 15:58:11 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3261.024; Thu, 13 Aug 2020
 15:58:11 +0000
Subject: Re: [oe] [meta-python][PATCH 1/3] python3-matplotlib: Use lld for linking when using clang
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20200812230821.1802729-1-raj.khem@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <045ca313-8ecd-b0d5-5ebc-4507f6390fd1@windriver.com>
Date: Thu, 13 Aug 2020 11:58:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200812230821.1802729-1-raj.khem@gmail.com>
X-ClientProxiedBy: YT1PR01CA0098.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::7) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0098.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend Transport; Thu, 13 Aug 2020 15:58:10 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73b9a6b5-5d59-4c20-fe0b-08d83fa1adb8
X-MS-TrafficTypeDiagnostic: BYAPR11MB3606:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3606A2F9D9DC93FBE23F23C59F430@BYAPR11MB3606.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:883;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RtZNAXRsRwLmjx/GIn662WYisYpZBsBBOIJcLVAdWNlfEWGuRk8RprCtCpC/WKi6ZVeREkKAlXmKj3SKGB+0/d6nu/NC4CDJH2XedXzbQdQQM7MOQkBIzYyjFBASeEA4GLEYyQwmJSrP5a1cZma8bDrEh9atrA2ED9PA5bsl1LMAgCtsN5uY64/d0YDCvOfy7E7cFVUwF6P8xDDUii1m/00FQsD0b5CmVzpr5eHxm4u/KgBMYyVD7MWUpK7x9fzwxY44HtcUyVdPrNGvBU7hVt7KDwyEruxLfxSzrHeO4y7FME/g33Swj16HmugxzjMSqoITyMDXu4f12+TNJYZyy4CfUioOVP6PuaDem3OV5VOGe1StrDbbe4woL+KVP03Q05sIMVbvGA6rZx2FVTigrNp3GKJOIpPrGwmosHD8YkCmmXrLwG6w1W/hY9TzrttUJmNS1/PWXqi82b3VoU8fGw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(346002)(376002)(39850400004)(396003)(8676002)(31686004)(186003)(8936002)(16526019)(5660300002)(36756003)(26005)(6486002)(478600001)(2906002)(31696002)(44832011)(66946007)(956004)(166002)(66476007)(966005)(83380400001)(86362001)(66556008)(52116002)(53546011)(316002)(33964004)(2616005)(16576012)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	ckW02rVkiTr3vXxkPtHJ0Ll+c2JiuoUVfTERVylEOeESXbZVmdci10WHNWlz3kL7IIXbaFIa+wR/bK9hCmUM8T4xrmDLim0J5G4NaKvtWIOUYTFAl2PWX1ARP38qn0YYB+1EJzTVVrs1oWgzEdQDtMKxDfLoZuCQYPfcgn8TxWzcz13qASMkw66jefs4mHvw0hXroNo5jgKqq22gc8Vl0wRygKRvrkZGDMNiyn1p2Ium1XwZO43bp1HdbfMBTA1aU9T+oY3GUnUx/zkP6r/QYoxAfbyUON75WjYbNUIXWLSTswsrD8k8jjlVwsf8g7d8fNgw5m43ESXz0mt9wRw+ghCvQ2KzG7Eh4027Grm5IinCAs0tg+v6P7MZDOXdO8ViFBLh4wt3lQWaIUagKMmADA4YimxkAYd+n7az3TsGaEYqpqOjWaa2cMbSh5lPL/xCbo75WbauJYNVJQ7srgJFhCQzdbsniJz2k31i+d8g2ZiUCKgwLN7xIHx+tMHe6SlZGVl3b9XM1N28gWfabU8300W99jUbcuITePIOrnaWmLxq1+8iPBOVZDu76WKWO1zu0ow5HysQIa21l4x1oW7O0vfG9mrFHAA18fVeO7ylt1GUF55zDIKe40Ckvparxv1NWtf5PTHvqDUinZvGPxzfKw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73b9a6b5-5d59-4c20-fe0b-08d83fa1adb8
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2020 15:58:11.2210
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /cvrVC+hrVrdWf8e1RYoeKwXiTUkRESZScb1OQx+T5axjsBXS/QmfwXWqLlYrrqUU7ufI9Pg3Z0qHq0pY6xfrWj9VpsFa738uIkfOnVsvmg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3606
Content-Type: multipart/alternative;
 boundary="------------E575AFAC1D3E701DC057A855"
Content-Language: en-US

--------------E575AFAC1D3E701DC057A855
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/12/20 7:08 PM, Khem Raj wrote:
> build uses LTO and for some reason it does not work well when using
> clang-11
>
> Fixes
>
> | /mnt/b/yoe/master/build/tmp/work/armv7vet2hf-neon-yoe-linux-musleabi/python3-matplotlib/3.3.0-r0/recipe-sysroot-nat
> ive/usr/bin/arm-yoe-linux-musleabi/arm-yoe-linux-musleabi-ld.gold: error: /mnt/b/yoe/master/build/tmp/work/armv7vet2h
> f-neon-yoe-linux-musleabi/python3-matplotlib/3.3.0-r0/build/temp.linux-x86_64-3.8/extern/agg24-svn/src/agg_bezier_arc
> .o: not an object or archive
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python3-matplotlib_3.3.0.bb        | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/meta-python/recipes-devtools/python/python3-matplotlib_3.3.0.bb b/meta-python/recipes-devtools/python/python3-matplotlib_3.3.0.bb
> index 2e88efb563..bc2054a4d7 100644
> --- a/meta-python/recipes-devtools/python/python3-matplotlib_3.3.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-matplotlib_3.3.0.bb
> @@ -23,6 +23,9 @@ SRC_URI[sha256sum] = "24e8db94948019d531ce0bcd637ac24b1c8f6744ac86d2aa0eb6dbaeb1
>   
>   inherit pypi setuptools3 pkgconfig
>   
> +# LTO with clang needs lld
> +LDFLAGS_append_toolchain-clang = " -fuse-ld=lld"
> +
>   RDEPENDS_${PN} = "\
>       freetype \
>       libpng \
>
> 

--------------E575AFAC1D3E701DC057A855
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/12/20 7:08 PM, Khem Raj wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200812230821.1802729-1-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">build uses LTO and for some reason it does not work well when using
clang-11

Fixes

| /mnt/b/yoe/master/build/tmp/work/armv7vet2hf-neon-yoe-linux-musleabi/python3-matplotlib/3.3.0-r0/recipe-sysroot-nat
ive/usr/bin/arm-yoe-linux-musleabi/arm-yoe-linux-musleabi-ld.gold: error: /mnt/b/yoe/master/build/tmp/work/armv7vet2h
f-neon-yoe-linux-musleabi/python3-matplotlib/3.3.0-r0/build/temp.linux-x86_64-3.8/extern/agg24-svn/src/agg_bezier_arc
.o: not an object or archive

Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200812230821.1802729-1-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python3-matplotlib_3.3.0.bb        | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-matplotlib_3.3.0.bb b/meta-python/recipes-devtools/python/python3-matplotlib_3.3.0.bb
index 2e88efb563..bc2054a4d7 100644
--- a/meta-python/recipes-devtools/python/python3-matplotlib_3.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-matplotlib_3.3.0.bb
@@ -23,6 +23,9 @@ SRC_URI[sha256sum] = &quot;24e8db94948019d531ce0bcd637ac24b1c8f6744ac86d2aa0eb6dbaeb1
 
 inherit pypi setuptools3 pkgconfig
 
+# LTO with clang needs lld
+LDFLAGS_append_toolchain-clang = &quot; -fuse-ld=lld&quot;
+
 RDEPENDS_${PN} = &quot;\
     freetype \
     libpng \
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------E575AFAC1D3E701DC057A855--

Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.47])
 by mx.groups.io with SMTP id smtpd.web12.7187.1592399579437795847
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jun 2020 06:12:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Pw/W2S8u;
 spf=pass (domain: windriver.com, ip: 40.107.77.47, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AKVQ7sUU89vHuVP4qdW9uaBLeN/Il0SM8LuyR784yDFao2Yg0pPt9SddirC/IBx3pgc7HJla/R+7hzcmQotBxR5o874zpCuIvym0sU8Vi3cLCL0ONX8isuh5PAh58EzPFuR5umr8bGG3+Q/+Rx8uG5BFcBG+rrvOxLlRjzR1Z5zb9/6y9W3MERyaGB3z9YBqfc9XJEU5ZkJGrhogcFKiw5OFJFyl3ww7864dcH/8hhqfw5ReNJLMmjXO6OVjFbO7PwgU0TDmnpR4TDC75x2Z6iDA6kmjswqjyVJHyUBtO4Qv0lUbQ70aRr/1LBh5LfXoLMkUY3o2ELPrWiHgdYw4cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Bj0qbt17X06LYili/CacZM2pfRQWpjOMZLmhgaWzR8=;
 b=kbjsXFNn2KwOTXoh43vyO3fmh7g2DR8QBUrd9TJj1cv2dsx9kumuyEY0Dh4r4nq+7P/3bMu2pDdKMADhtf+yLhr33haJhCpI3ZpoZmaXe2PfOjFlyCZPmqVCzk6QhdOzajfWk3Nk2HfGpNW0W4eHaZja5/1eDZbTGvxZVODbX2ojH3Ly0wYjqY3RhdBgxKqtv4FixvCeQEN/728ihveiy2r58DwA1+HV0zuewVNvpfPCBTBwK/BUdWSZqHh/RwN4keB4yU9K3b6Bvc9ZtSsUkKWxrgZJzj7JVlLvB+lgdaEwZY1Bq4sw4Cg0hzq6Pa/RHBpC1YJkzZUUFt8r6V+XUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Bj0qbt17X06LYili/CacZM2pfRQWpjOMZLmhgaWzR8=;
 b=Pw/W2S8uNiHEkzYmukZSt/PiVK2kcZxdwSXJSaQVDvhpf2Kt2EWBIfC6gjawxGknoBJVzhivav7AV3eNZn99R3zeQpYXm2UwsE9CuRsf8pQKTOWvmWjDzqLci/czfxzcz98tSZ3I1kmfQmjXAARX1PMeoXD39HaNsOz+GuEl8+I=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1873.namprd11.prod.outlook.com (2603:10b6:404:106::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21; Wed, 17 Jun
 2020 13:12:57 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.021; Wed, 17 Jun 2020
 13:12:57 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-protobuf: Upgrade 3.11.3 -> 3.12.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200615124926.19597-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <13629558-b0bd-d1ae-9589-4249dd249821@windriver.com>
Date: Wed, 17 Jun 2020 09:12:55 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200615124926.19597-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTOPR0101CA0030.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::43) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTOPR0101CA0030.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::43) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend Transport; Wed, 17 Jun 2020 13:12:57 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c322a8d5-5064-427b-6d01-08d812c02749
X-MS-TrafficTypeDiagnostic: BN6PR11MB1873:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB1873A623B1CF950FCCC8F3469F9A0@BN6PR11MB1873.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 04371797A5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PJxtRpGWxk3IKQl7W60gnFi2vCXWxtcjIkKK0RVfyWVD1x3VShQqXCFg5+fzHVuZ/9C7b4QYjZsbQ/Uydl1ePnGgbCkwxtMT9DVfpTuloym8ES6FSW9S4QNYsKhrjSQgussuqNN3A+Hts9uOIcGBeb/MRzzkvr1PxF5n/WLkdmd1BmyeII2HBDNsKfJO+lYgNcMTo145vZYvntJVdYUFBXY+dYDvJxAK7SyTHQx9m6nVAL0/RA6W+mZCEjL7qav/1B968tNxlPK+fglxKaKZBVDOgDuteGW+pQT8+42ST29+qgyA2yeKhnyRczfflpL+/2LcWDYSzY5mNzdF4ewvLkHMTl6lu1NR7Xlz+3SAe/1L/Mc2umCtLpg6V/bmLomI9FcrXdAoPS6GlJp0M36VjK/XMIqQV5/9YAtulhnDqYtSsabAOhlWx2DlaC4bYZ4DThnr4wWg9LeX7jWH/HSiDA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(39840400004)(346002)(366004)(136003)(396003)(66946007)(45080400002)(31696002)(66476007)(186003)(478600001)(86362001)(6486002)(16526019)(26005)(5660300002)(66556008)(8676002)(83380400001)(8936002)(966005)(16576012)(52116002)(2906002)(2616005)(44832011)(956004)(316002)(33964004)(53546011)(36756003)(166002)(31686004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	431mF47XTwq+GLM7BoVAjvAhjaBu4kFTVhJOJNcKmQNpI8eE5YMrD1LYEmzkWJMjd0+c3T7UDDX4/RUmQxUiNmTGVJSI7vOHDzqh9zc1q+XgMT+t95rS2eX1qft+rUJsp23QLkPALzcrq0r2BDdQkCeiimdZ+BH4mILauXW2BslkhIefVws16eg/9pAvV8rFxsg+ggXqXQLsOcsgZyg6h/k8ZrrXIWqe/sTWjLoSgqeEjdI8R++l2cuk7EFrrqLpm8R7d50veY4hgw89fdtvyRwFTh+xmz0VOormIP4TyEF00yrMVTaNLaZ+g8YJavBrQer1nsVKTa6orwbqaWSYWTDRMCtFLMM8f8dgaEVwb9NEusofXdpHL1vUU7hj7fJiZJ/nsjIRiun//qe8SGKRj0uXU5HEAkAZRJ0bWn35JYbWzN9Y6+PK8E32DTBb/iCGS29WHMGGEwkb7c5dgEOMJjm7X7kMlDaVKUp54Vt+lite9kkWcEP4H+ZWE/UTt2G2
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c322a8d5-5064-427b-6d01-08d812c02749
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2020 13:12:57.7579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: orqrWJ5GURBfKE8SLIjzf8CnYiGiiz48NHt19oKCqT45YMzaChFCoq916ZQVOBhCK3sK99BFLIQ10NjBX75yTkkGc/HAbAMCdjG81TwhESU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1873
Content-Type: multipart/alternative;
 boundary="------------0F7EDC92605F5D89CCAC32A5"
Content-Language: en-US

--------------0F7EDC92605F5D89CCAC32A5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/15/20 8:49 AM, Leon Anavi wrote:
> Upgrade to relase 3.12.2. Depends on the upgrade of protobuf
> to 3.12.3 in meta-oe. The new release for Python brings:
>
> - [experimental] Added proto3 presence support.
> - [experimental] fast import protobuf module, only works with cpp
>    generated code linked in.
> - Truncate 'float' fields to 4 bytes of precision in setters for
>    pure-Python implementation.
> - Fixed a memory leak in C++ bindings.
> - Added a deprecation warning when code tries to create Descriptor
>    objects directly.
> - Fix unintended comparison between bytes and string in
>    descriptor.py.
> - Avoid printing excess digits for float fields in TextFormat.
> - Remove Python 2.5 syntax compatibility from the proto compiler
>    generated _pb2.py module code.
> - Drop 3.3, 3.4 and use single version docker images for all python
>    tests.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...{python3-protobuf_3.11.3.bb => python3-protobuf_3.12.2.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-protobuf_3.11.3.bb => python3-protobuf_3.12.2.bb} (87%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-protobuf_3.11.3.bb b/meta-python/recipes-devtools/python/python3-protobuf_3.12.2.bb
> similarity index 87%
> rename from meta-python/recipes-devtools/python/python3-protobuf_3.11.3.bb
> rename to meta-python/recipes-devtools/python/python3-protobuf_3.12.2.bb
> index a4c9d6699..03d0b0c60 100644
> --- a/meta-python/recipes-devtools/python/python3-protobuf_3.11.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-protobuf_3.12.2.bb
> @@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=19e8f490f9526b1de8
>   
>   inherit pypi setuptools3
>   
> -SRC_URI[md5sum] = "eeda7dea65fc94e560fc9a8180eb1872"
> -SRC_URI[sha256sum] = "c77c974d1dadf246d789f6dad1c24426137c9091e930dbf50e0a29c1fcf00b1f"
> +SRC_URI[md5sum] = "b4336acee38ebe915b6e72fe8c5bce7b"
> +SRC_URI[sha256sum] = "49ef8ab4c27812a89a76fa894fe7a08f42f2147078392c0dee51d4a444ef6df5"
>   
>   # http://errors.yoctoproject.org/Errors/Details/184715/
>   # Can't find required file: ../src/google/protobuf/descriptor.proto
>
> 

--------------0F7EDC92605F5D89CCAC32A5
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/15/20 8:49 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200615124926.19597-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to relase 3.12.2. Depends on the upgrade of protobuf
to 3.12.3 in meta-oe. The new release for Python brings:

- [experimental] Added proto3 presence support.
- [experimental] fast import protobuf module, only works with cpp
  generated code linked in.
- Truncate 'float' fields to 4 bytes of precision in setters for
  pure-Python implementation.
- Fixed a memory leak in C&#43;&#43; bindings.
- Added a deprecation warning when code tries to create Descriptor
  objects directly.
- Fix unintended comparison between bytes and string in
  descriptor.py.
- Avoid printing excess digits for float fields in TextFormat.
- Remove Python 2.5 syntax compatibility from the proto compiler
  generated _pb2.py module code.
- Drop 3.3, 3.4 and use single version docker images for all python
  tests.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200615124926.19597-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...{python3-protobuf_3.11.3.bb =&gt; python3-protobuf_3.12.2.bb} | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_3.11.3.bb =&gt; python3-protobuf_3.12.2.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_3.11.3.bb b/meta-python/recipes-devtools/python/python3-protobuf_3.12.2.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-protobuf_3.11.3.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_3.12.2.bb
index a4c9d6699..03d0b0c60 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_3.11.3.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-protobuf_3.12.2.bb
@@ -7,8 &#43;7,8 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=8;endline=8;md5=19e8f490f9526b1de8inheritpypisetuptools3-SRC_URI[md5sum]=">&quot;file://PKG-INFO;beginline=8;endline=8;md5=19e8f490f9526b1de8
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = &quot;</a>eeda7dea65fc94e560fc9a8180eb1872&quot;
-SRC_URI[sha256sum] = &quot;c77c974d1dadf246d789f6dad1c24426137c9091e930dbf50e0a29c1fcf00b1f&quot;
&#43;SRC_URI[md5sum] = &quot;b4336acee38ebe915b6e72fe8c5bce7b&quot;
&#43;SRC_URI[sha256sum] = &quot;49ef8ab4c27812a89a76fa894fe7a08f42f2147078392c0dee51d4a444ef6df5&quot;
 
 # <a class="moz-txt-link-freetext" href="http://errors.yoctoproject.org/Errors/Details/184715/">http://errors.yoctoproject.org/Errors/Details/184715/</a>
 # Can't find required file: ../src/google/protobuf/descriptor.proto
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------0F7EDC92605F5D89CCAC32A5--

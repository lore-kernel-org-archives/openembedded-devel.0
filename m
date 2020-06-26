Received: from NAM04-BN3-obe.outbound.protection.outlook.com (NAM04-BN3-obe.outbound.protection.outlook.com [40.107.68.85])
 by mx.groups.io with SMTP id smtpd.web12.10237.1593184876253834648
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jun 2020 08:21:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=A29wJIyz;
 spf=pass (domain: windriver.com, ip: 40.107.68.85, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jt5PawwkRx3VDUkdDqLt/4NAlHYiw958Hi/9gQYf3BHCaOVBVG1payIAL49lun1EadvQ6QQlG20l61le1Z0HZrtnyEqzfNSrMtmopqFZW5okOX89PxrHLfSeGeZ+1UHIoyED+29EbPy1xV9XpxosSmvzSFx/hPQN6Nb2KCfi2kT85o4FLXUlHSo5sv7A/JeKZhxL+SNsLts+uSJLUfIi8KlVy8a0LprjFtDKZvrLSjx/0g/ZwhZOBss0NgczqRu4RRCM5vMtd9NLwZZsn9SmZMSvi5g0GNKwxULz7sHIyv9QuAQOXLuqzabpa0yxYoUAl4ukLcsdv40Ub1WZniptpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cllMUJwh5zGvpFsEWRaF25NKx/kawr6CHmMAg6foClI=;
 b=AxaypK/k2G9DmvCZZlUy5Fwnd+DMluyB2FoolE6aXnkCbsI2uBavU2+7c3nXM4Du42cbCvknBOVgFmuXT3PEeFW9tQJgT2ed+EHTaTtAVkW/j97Gl1hXQIg1al/fGHZ8HK/In2t81dl+QIlwFphjU6Hj1HAaWuQCXYMWHolInZguFPavSm4NBf/qqKXn518OudJu3OTKuKlYbJPIpqEBVOVvq1ip2nDJwyTdJCMHoa0eEAHijomxH/1sKuDCv/oRYJTQwjSf5oOnK9vJCXIjtwR19GZUWk85yAT8I51uN2B73WMgsfjKMcEn+0J5aqeg++bUHb2bN5gd2bQnzVvT3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cllMUJwh5zGvpFsEWRaF25NKx/kawr6CHmMAg6foClI=;
 b=A29wJIyz0HV/w5i6QoU8lr37vvogjlT0J3rUhy1Pnwzw901wgDdTkiLMSqtKOGWidFtHHG5DSmeqlFOy9C9w/9x4vVWC1P3MNp9C9vxeOIGKBhDcoIo+udBx2hn/zAAm+EUemmOWIiO/lHLrOo9MJBJS2z5oEbs76G6q/skH94Y=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB3953.namprd11.prod.outlook.com (2603:10b6:405:7f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.24; Fri, 26 Jun
 2020 15:21:15 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3131.025; Fri, 26 Jun 2020
 15:21:15 +0000
Subject: Re: [oe] [meta-python][PATCH 02/10] python3-cheetah: Upgrade 3.2.4 -> 3.2.5
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200622103542.27830-1-leon.anavi@konsulko.com>
 <20200622103542.27830-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <694ad404-762d-27cd-0e71-b34594b2cb0c@windriver.com>
Date: Fri, 26 Jun 2020 11:21:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200622103542.27830-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0018.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::31) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTXPR0101CA0018.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21 via Frontend Transport; Fri, 26 Jun 2020 15:21:14 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b180168-4fc6-4834-87f5-08d819e490dd
X-MS-TrafficTypeDiagnostic: BN6PR11MB3953:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB3953B90CD2F3DABEB11147D19F930@BN6PR11MB3953.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:213;
X-Forefront-PRVS: 0446F0FCE1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pdN4FY4txiNN3s3n9i5nm7SeTWJkiZLDqOUf8oGWGoXUdC/mv7tBvDqk+Q7GcisqeMLNrn54uq67sarSgdFJm9bnnkmsyRgc8qhKSkSCA8+WHGssYVvDI66B7CFSu1jM4KHA74zrz1rvdvLhoNbIUicnlhJVmFhRJWsaCtRXxzypoDS0jHxVSkN3DPTJdW6AMhw5NIMzcNhLTO1BehaxvFlub1aUGqodjzt9rtwW6TDrMq8tc+mKS8XAgrTxM1aRKcHoMlP1EYrr1tHKhNQv+idgwRahmIy4+wFP7I0jl6GmSf5MvBj4O2leI6YIm40Fxc5eWhNG5ypfUoiXCYEMcbIo73DqRX4erHkjB2DG4YObzOB5nRu6yYwdIQwiwD/Pb6Gd82ICl62mIF0ta2KcOgI/zadnQpyTddj1KwjX9iesoej3AOF1FVPViwDuocboRnHmapqwp0HSQ1uo2TuoUg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(396003)(136003)(346002)(376002)(366004)(316002)(166002)(16576012)(2906002)(956004)(83380400001)(31686004)(8676002)(31696002)(8936002)(478600001)(966005)(36756003)(52116002)(53546011)(26005)(44832011)(2616005)(186003)(6486002)(16526019)(33964004)(66556008)(66476007)(5660300002)(86362001)(66946007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	vQlAp51rt51JBk0ooEAi41VxAiGhqPG+nv5EuHDTcsxK3IeTpOMp5jZ9+EWlJP9PruKdmHIDaan2a8rLatfwKBagDV8YtpQCHR5N7EOI0F79pmA8GvGAfyeee+s2iuB+q0qjp/AalLMoNy9rGg82m/ZWgh5XQuqfQ9dEshC0DpfKPW9ntXnepI87+KTJSGvqTYgeRwygsGhVnJOShvyjaxbkoJe78w/VQm0uhJhFVkGcPGruRTYimutIwu+pkphdMCKX4wjRC0ZXq7Cgq4bHwe8yNk/7KG11qbZsfFd08GIf2Dc7Xnp/newot3MngFGyTKFrbiNwAcRaEVdutVUNVKwwF/KSnYvAL4untx06S/xkWrpEOABO9S8nerBRox5XCXZ2w9jMC6F8+sGCEJOnxKe1XH5lPFt3BvRNCqbs//GfF7b56k4Zrr7M/TsS1X19kFV2VURKHIGufmRK/kisIvN4tJ9NTe7QyuEhHnn1u+dsL6BG7J/ubgShXMI31XEU
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b180168-4fc6-4834-87f5-08d819e490dd
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB0003.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2020 15:21:14.9019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N2wiNSFchh420gy9kUTbtUorBVlYq7o0ZDoGUDT8e/21PNiRZRoevj/jci7ju/AkTz/R8N1E3jFIT5RK8JU9nqnYF6QQLCss/hyYPu+nHxQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3953
Content-Type: multipart/alternative;
 boundary="------------9C7234B114081AAFF3283921"
Content-Language: en-US

--------------9C7234B114081AAFF3283921
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/22/20 6:35 AM, Leon Anavi wrote:
> Add homepage and upgrade to release 3.2.5:
>
> - Tests(tox): Refactor `tox.ini`: remove spaces
> - Setup: add markdown as an optional dependency
> - Build: Install `wheel` and `auditwheel` that correspond to
>    each other
> - Style: Fix flake8 E741 ambiguous variable name 'l'
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-cheetah_3.2.4.bb => python3-cheetah_3.2.5.bb}   | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-cheetah_3.2.4.bb => python3-cheetah_3.2.5.bb} (63%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-cheetah_3.2.4.bb b/meta-python/recipes-devtools/python/python3-cheetah_3.2.5.bb
> similarity index 63%
> rename from meta-python/recipes-devtools/python/python3-cheetah_3.2.4.bb
> rename to meta-python/recipes-devtools/python/python3-cheetah_3.2.5.bb
> index 05882d087..6fa088f59 100644
> --- a/meta-python/recipes-devtools/python/python3-cheetah_3.2.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-cheetah_3.2.5.bb
> @@ -1,4 +1,5 @@
>   SUMMARY = "Python template engine and code generation tool"
> +HOMEPAGE = "https://cheetahtemplate.org/"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=15e13a4ed0e5880e3e55ec88b0921181"
>   
> @@ -10,5 +11,5 @@ RDEPENDS_${PN}_class-native = ""
>   
>   BBCLASSEXTEND = "native nativesdk"
>   
> -SRC_URI[md5sum] = "8c0ac643263ffc3454fb321342284d0a"
> -SRC_URI[sha256sum] = "caabb9c22961a3413ac85cd1e5525ec9ca80daeba6555f4f60802b6c256e252b"
> +SRC_URI[md5sum] = "fc735d4ca7997df2a2da1cae0cf89a1e"
> +SRC_URI[sha256sum] = "ececc9ca7c58b9a86ce71eb95594c4619949e2a058d2a1af74c7ae8222515eb1"
>
> 

--------------9C7234B114081AAFF3283921
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/22/20 6:35 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200622103542.27830-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Add homepage and upgrade to release 3.2.5:

- Tests(tox): Refactor `tox.ini`: remove spaces
- Setup: add markdown as an optional dependency
- Build: Install `wheel` and `auditwheel` that correspond to
  each other
- Style: Fix flake8 E741 ambiguous variable name 'l'

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200622103542.27830-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-cheetah_3.2.4.bb =&gt; python3-cheetah_3.2.5.bb}   | 5 &#43;&#43;&#43;--
 1 file changed, 3 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cheetah_3.2.4.bb =&gt; python3-cheetah_3.2.5.bb} (63%)

diff --git a/meta-python/recipes-devtools/python/python3-cheetah_3.2.4.bb b/meta-python/recipes-devtools/python/python3-cheetah_3.2.5.bb
similarity index 63%
rename from meta-python/recipes-devtools/python/python3-cheetah_3.2.4.bb
rename to meta-python/recipes-devtools/python/python3-cheetah_3.2.5.bb
index 05882d087..6fa088f59 100644
--- a/meta-python/recipes-devtools/python/python3-cheetah_3.2.4.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-cheetah_3.2.5.bb
@@ -1,4 &#43;1,5 @@
 SUMMARY = &quot;Python template engine and code generation tool&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://cheetahtemplate.org/">&quot;https://cheetahtemplate.org/&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=15e13a4ed0e5880e3e55ec88b0921181">&quot;file://LICENSE;md5=15e13a4ed0e5880e3e55ec88b0921181&quot;</a>
 
@@ -10,5 &#43;11,5 @@ RDEPENDS_${PN}_class-native = &quot;&quot;
 
 BBCLASSEXTEND = &quot;native nativesdk&quot;
 
-SRC_URI[md5sum] = &quot;8c0ac643263ffc3454fb321342284d0a&quot;
-SRC_URI[sha256sum] = &quot;caabb9c22961a3413ac85cd1e5525ec9ca80daeba6555f4f60802b6c256e252b&quot;
&#43;SRC_URI[md5sum] = &quot;fc735d4ca7997df2a2da1cae0cf89a1e&quot;
&#43;SRC_URI[sha256sum] = &quot;ececc9ca7c58b9a86ce71eb95594c4619949e2a058d2a1af74c7ae8222515eb1&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------9C7234B114081AAFF3283921--

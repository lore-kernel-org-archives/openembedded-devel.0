Received: from NAM04-DM6-obe.outbound.protection.outlook.com (NAM04-DM6-obe.outbound.protection.outlook.com [40.107.102.84])
 by mx.groups.io with SMTP id smtpd.web10.5562.1599332480653914845
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Sep 2020 12:01:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=EaULS2GC;
 spf=pass (domain: windriver.com, ip: 40.107.102.84, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SW4s2Yoz5Q2eyNlf4E/5ExZqa3IoW0dR1xGIBzvKjKeWW5gFHbiVrbzF1xoWMypdsOIWBH0w9Aag4NKV/c7BHSXXycAFCmsQ0Zz7WN8GZrhfHLDaOvpxsgYv1Ur8kzjVNDAmCW2NMtQu8PPYZQJ/0Dx5OJhAZ4ojnZWygfisOdpfcHvd36JZfVBA1C7/4P7SIWDdfqiVvjC0Pcduf6aB+dqKdeICjpn3DNPo9hSid23FQ2JdAlegPJC6673CB6hjezPgkK4kA7uzjHQWQFR5xPTTDDw5LcNw+64mm+fe5tUkuICTU6ZpgVstH7fRiY5i1jk4vpK3h0fxVQy/61qq0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cxouFBOBVzr8p2Nk0eNU0m68zIxeHmh4QeT/HdP87eo=;
 b=Ut7oMBtlT3UAuJju4LgrIfoGyZouZyDkjKVW4fSsw/1PIb2GI2rGQk56HUyaUHSjQ1mgKIJo0lhimwmwBKUY2jmBGpOEkE4x7694Gr1mhvvl9FOw+4e62Xzlak+sOx3xxZp35VLWgN2AEBqEKEU4ZjLDA5cHKxri6lgU4XexVca7rnkHQi97gB94T8JJBA4Ytn4Ge1yqbhs/n1xT+l4UCRLnb+N6VcRzYFCBeSDO8sgF/Xtpo2LUeAjmz9InfVku3Fbys5Byo+580qd8Ix3TjfihxeM2W+33ALIgdKNhq3WPKBNEu0b0OXrGCX+JIOMa0UqJtUIlLvXrN9ZU5JHX5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cxouFBOBVzr8p2Nk0eNU0m68zIxeHmh4QeT/HdP87eo=;
 b=EaULS2GCRvgu+chx6DLqgD0Ryw03AjT4V4Ot3lG2md09aZk2NmU+NcmJwJU5uSo6Tc6fy9FlJhNaeUhulnum8c603H/DzI7xSYXMHzx+8oCekOtztQVwPox/w3OiZYP9n2JRQucHJzxmY6fmFJNFd56nMvbJBD0ahMu/gdDA8qM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2952.namprd11.prod.outlook.com (2603:10b6:a03:82::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Sat, 5 Sep
 2020 19:01:19 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3348.015; Sat, 5 Sep 2020
 19:01:19 +0000
Subject: Re: [oe] [meta-python][PATCH 3/5] python3-robotframework: Upgrade 3.2.1 -> 3.2.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200902083342.22101-1-leon.anavi@konsulko.com>
 <20200902083342.22101-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <e64bb521-31f9-ea54-6024-de8445f869d9@windriver.com>
Date: Sat, 5 Sep 2020 15:01:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200902083342.22101-3-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTOPR0101CA0055.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::32) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTOPR0101CA0055.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend Transport; Sat, 5 Sep 2020 19:01:18 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc138683-fe59-497a-9c87-08d851ce128c
X-MS-TrafficTypeDiagnostic: BYAPR11MB2952:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB29521058F94AEB1A683632839F2A0@BYAPR11MB2952.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:209;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fT2hwjFxn4Yryo+/CCP28qRp21+bOAEUNhvIxJinSIDQwPfCQMSTmjgLkRNQGha4awfiqdYOc5vRBs/TVRfT3xmoyNpUnmb1mPu1SqJKZwylZomN/CyDPmFOagw3w3VNrZai82QIRbOLmU8Q/h2grxbXUSgtKKtESjhQjmsMWyFmJiHtiEIpByhY10GSnKWXUFu/F7nTSqsFzAc+5c0gWGMnd0p/Hd/HLFALqKjtQ1OvmWX9GhwW/8imnIf0s4AqCGlihQw36QlT3U6rU8d2A09pG5u//njj+yNtJJblnm/mWqAqZuGudGADn2TCCyjs+Fo51y74t0VcuHap4vBEmN2xVi9YPc/kenZc03rMwTTHJF+Dsoxe11cksGNiZrpTaiaY8ZYnmBQ0otdqEf8JwVPzI78ktFSOkhkSAusPb3bEIIk6iUnpPi1wYSbmH3b9Z6jje60PEK5Kut5kLZGSkQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(39840400004)(376002)(346002)(396003)(53546011)(66556008)(66946007)(8936002)(16526019)(26005)(186003)(166002)(8676002)(16576012)(83380400001)(316002)(31686004)(36756003)(86362001)(33964004)(31696002)(2616005)(5660300002)(2906002)(966005)(66476007)(44832011)(52116002)(478600001)(956004)(6486002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	efYPfwYhv8tegguammFawW0dchsY3Db2N3j+xn5tGdO10Xe87XgRNG45VYfMD232O4WM16H1xjoAtIkY5b6JbLOoR7MuHBcCl3rl81OwXWs/LGy5Kqt+AqPyITCMJ2mpofzmfn7eIHpjTWqzptkiK39vD3mwOPbwZBXcfrAQj2FGjl1HT2qeEWs7ClwlAKL4SBqxMkxmbFJChPa8zY+xxPxbyCnblGuGzk1Q4WkzoyxGPZcIuvOZTcGYSGFtQirVeeT02nkR4AGzi9iBxszSlhMECDnC8vgo2LYoEKYIm7HfE9wQui8m3WRcY+QQBApRyiLvoUzNnc5rMaRMaRAVlwM54/Z4dHIrWk3vpw4BM0UmJ16M563SXAsD4wPqgI/lapqbvaRZqTF9g+QfmoZhwltnze9KQVcUR0IDvF/mNeXiZphKuytg4KskI/VM5q4lpgzzlXcg7b/DwEHfBd6jmUbCiWjtlbyzZ/i0bXVs7hdblhIQi34Lgc2MnZeFyKxWdBPlNyKSxu6Xkyd7vfvp4yoallINJKL3yEYIHsFAYQrYvbPbdPHZvpEsZ+zCPFGGw5sRIHT/rrmDDbuReuO/8nuSklbMoZySeJp7AbRWfi4rFNja6vtwZ1Vj1VMMOpk1J2fhxlIJRLTIexXcn2FPOA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc138683-fe59-497a-9c87-08d851ce128c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2020 19:01:19.5119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TqRNLjIWeYVzS5Xp5taPiaOF0Qv2n2W6G4H3NwnTZmNeRkxlI4br/71r+kroqprwI3oknW/Q0+vzEEOTsOMOMLp3ZHs6+ga8rvC/+TCTrJo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2952
Content-Type: multipart/alternative;
 boundary="------------DE35DCCE56EACF5FE7EC74D4"
Content-Language: en-US

--------------DE35DCCE56EACF5FE7EC74D4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/2/20 4:33 AM, Leon Anavi wrote:
> Upgrade to release 3.2.2, a new minor release with some bug fixes,
> Libdoc enhancements and official Python 3.9 support. For more
> details please visit:
> https://github.com/robotframework/robotframework/blob/master/doc/releasenotes/rf-3.2.2.rst
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...obotframework_3.2.1.bb => python3-robotframework_3.2.2.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-robotframework_3.2.1.bb => python3-robotframework_3.2.2.bb} (86%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-robotframework_3.2.1.bb b/meta-python/recipes-devtools/python/python3-robotframework_3.2.2.bb
> similarity index 86%
> rename from meta-python/recipes-devtools/python/python3-robotframework_3.2.1.bb
> rename to meta-python/recipes-devtools/python/python3-robotframework_3.2.2.bb
> index a5e3a2a4f..10f031c7b 100644
> --- a/meta-python/recipes-devtools/python/python3-robotframework_3.2.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-robotframework_3.2.2.bb
> @@ -12,8 +12,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
>   inherit pypi setuptools3
>   
>   PYPI_PACKAGE_EXT = "zip"
> -SRC_URI[md5sum] = "ac8aaad885e48c6b6cd5461be5b8149f"
> -SRC_URI[sha256sum] = "d693e6d06b17f48669e2a8c4cb6c1f0d56e5f1a74835d18b8ea2118da7bf2d79"
> +SRC_URI[md5sum] = "ac6b77c223821856e8ac077acf5a7c1d"
> +SRC_URI[sha256sum] = "a0786a916d0572bd9d6afe26e95c6021e3df5dcafa0ece6b302e36366e58c24e"
>   
>   RDEPENDS_${PN} += " \
>       ${PYTHON_PN}-shell \
>
> 

--------------DE35DCCE56EACF5FE7EC74D4
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/2/20 4:33 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200902083342.22101-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 3.2.2, a new minor release with some bug fixes,
Libdoc enhancements and official Python 3.9 support. For more
details please visit:
<a class="moz-txt-link-freetext" href="https://github.com/robotframework/robotframework/blob/master/doc/releasenotes/rf-3.2.2.rst">https://github.com/robotframework/robotframework/blob/master/doc/releasenotes/rf-3.2.2.rst</a>

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200902083342.22101-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...obotframework_3.2.1.bb =&gt; python3-robotframework_3.2.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-robotframework_3.2.1.bb =&gt; python3-robotframework_3.2.2.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-robotframework_3.2.1.bb b/meta-python/recipes-devtools/python/python3-robotframework_3.2.2.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-robotframework_3.2.1.bb
rename to meta-python/recipes-devtools/python/python3-robotframework_3.2.2.bb
index a5e3a2a4f..10f031c7b 100644
--- a/meta-python/recipes-devtools/python/python3-robotframework_3.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-robotframework_3.2.2.bb
@@ -12,8 +12,8 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57">&quot;file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57&quot;</a>
 inherit pypi setuptools3
 
 PYPI_PACKAGE_EXT = &quot;zip&quot;
-SRC_URI[md5sum] = &quot;ac8aaad885e48c6b6cd5461be5b8149f&quot;
-SRC_URI[sha256sum] = &quot;d693e6d06b17f48669e2a8c4cb6c1f0d56e5f1a74835d18b8ea2118da7bf2d79&quot;
+SRC_URI[md5sum] = &quot;ac6b77c223821856e8ac077acf5a7c1d&quot;
+SRC_URI[sha256sum] = &quot;a0786a916d0572bd9d6afe26e95c6021e3df5dcafa0ece6b302e36366e58c24e&quot;
 
 RDEPENDS_${PN} += &quot; \
     ${PYTHON_PN}-shell \
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------DE35DCCE56EACF5FE7EC74D4--

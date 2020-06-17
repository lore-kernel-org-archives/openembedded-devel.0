Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.81])
 by mx.groups.io with SMTP id smtpd.web10.7166.1592399367017755961
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jun 2020 06:09:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=W2l3Z+EJ;
 spf=pass (domain: windriver.com, ip: 40.107.220.81, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BrPyfe9GfjLL9ARJi2ubM8iFEA/AcaSS7/1sPISYmvRQP004nNucI3I6YCp/MU48VnGyltFT0GlL26Hf6wjPcNpcNCG1G6AkKGgFTFof6XWVBwgFjhCRQFELOiTcyDpk/IZMHtKQduwhLvHU4ppElwZYGu5QDCDjn+AUS4OvnHpLKiJmJJXgyGfegbtSzTfLG7Yj+5ivHVfEezLX9s7lcXj88jpkDYBNvd237JB1FqxFn8ki2Tesm2Z+xI1RM7H37o7zrZ7M1z2x1/jPCIP4yfDsWDWc70BTCJxbKheXjq1oiq7aATsnYjUBG631U0UhjBAwJIg15mDIw7NUxdeuYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Wl4mAEFzG3LzPFgddxKFTGnjaYPtLXocz/pbHODG2M=;
 b=OZdElx18UZOvBa5//JJFnCOIcVqCMXOyLbmaVHvjJmWugTaPPexxIZLBFx7fB4khdKRFAtaV0SecUyHXGVTL/pKdYl5vljbBjjM8s5KjfFW6S0LH+EtIbqye0+XIjQDKZE6MGPqhg+bEiNHLImkFoQpPP5p+HjKuP4YH+v7LCu++G6g4bMJoZfB2Rkjw0h527rpAL/b0gn/GCxlZv1+iiYA6DIVNIgv3dFAm0WYy5T4N+GzUcqLoLFmyfBreYm8yUhc+4lmogi2kLZtBKwuxNXGqjvACLRdUhK1fJMRC8nEMvt/xfs35S8W7tOFmGW4D2J7GUjGsYqHkl6EwqVvG5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Wl4mAEFzG3LzPFgddxKFTGnjaYPtLXocz/pbHODG2M=;
 b=W2l3Z+EJlRhZL4yFw8DCZJ5KBUEO+GBKUn71uN5mSBX3zpjMrj/u9KTE+cq+wfjIBiJHXOIJnqcBEFni11YHVWFvXgDBgcPd16kQpXKkzIV4Hnw/zXm2ycDam9iktHe0hnbcQzdAPTEl46njoS5bGMorZ3Y1UQioG8qziGLCHN0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN8PR11MB3588.namprd11.prod.outlook.com (2603:10b6:408:83::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.26; Wed, 17 Jun
 2020 13:09:25 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.021; Wed, 17 Jun 2020
 13:09:25 +0000
Subject: Re: [oe] [meta-python][PATCH 2/2] python3-protobuf: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200615123848.31016-1-leon.anavi@konsulko.com>
 <20200615123848.31016-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <c9a1b64f-70e0-259f-63d6-16d9c461dda9@windriver.com>
Date: Wed, 17 Jun 2020 09:09:23 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200615123848.31016-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0003.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::16)
 To BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0003.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend Transport; Wed, 17 Jun 2020 13:09:25 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b108032-3125-44bd-1fd4-08d812bfa8f0
X-MS-TrafficTypeDiagnostic: BN8PR11MB3588:
X-Microsoft-Antispam-PRVS: 
	<BN8PR11MB35886CD02CA0A3633A50733C9F9A0@BN8PR11MB3588.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:393;
X-Forefront-PRVS: 04371797A5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2lGTC2hIynWeLmyUhYU6UU+rFtZqSGkLrYsxZv0B25p06FtPBXOXSAwdsHdcRFlD8ek7i0GYO6W+vgvTkGtZs58nZ8AYncpMf7lqlBnhaLS0r+05QCU25gpsvh4ZKrGMRubjaqk7nCt7NTvgO8CM72RnGiKLauF011T+y+Lxj+yccUHmQFdjhy0rn+cVSmmOH1+JzCcqlQmnBu01uZ0P3waE6mBP/0q2nKXMgRF4qB0p4U4uANO4j335k4vhagqhHntts4o5mGxDcVp6dDKlagxg6a/QpDQKmn+4Pk3VZRrJsSBgiHUh3++dX7ApSBine+6CMh0y4HyNCEvzYbo6lCe9UggxI+BIjMNamkvHzmyfIXGsxOHtvieAaYHW9C98onOCbAAQgf35aDLK4yRTs8WYGcvV7BbhyptTceArf49LNVFnrtUz+XFTvq4G902+jy5L9XvugvqPSAdlo3daUA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(376002)(366004)(346002)(39840400004)(136003)(66556008)(26005)(53546011)(6486002)(166002)(31686004)(8676002)(2906002)(966005)(66946007)(316002)(8936002)(16576012)(66476007)(44832011)(186003)(86362001)(33964004)(52116002)(478600001)(16526019)(36756003)(5660300002)(83380400001)(31696002)(2616005)(956004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	2QuPZhgbMMAZadAFasVZk15MgmwdT4dsBnDTf6RRmUIhZhn670WzO/xowaW3etdYZI51EODolVJRrr3Ogqd1g253C204Quo0SPMvU9OS23UaxLaZlJ1Qggf1YPa+FWLkm76hihdSYjEF29bYPoxZysmoKluOGTJIN/0HCF5jbv9nrCDE+B4yBI2x/U459otHxEd4IB9I3ZyxPFZdeX+Xeg1IqR4d4LY8oGxWh/NAfoKb8lr+hx6aY12SbEGU4Nt0/EK3FCTB8iQd6ItdocJXw8B3i2BDbZuZ6UwQQl1ZEKJ0Tliz8oDyrPekyjkRFZye2p/M2BaBVuVthbemQHdnbJGVA7I32zjZs5zdMZ6OmGGg+0UdSo6CFFpT3wuKYZJglBgC/eE8yGYORDqM+pEs9fuvyKBgDRUbJ8h5un0jUjUuZeanhQMfWWSvMbN68/Vun+SqRIPMmTwM70GteJUe5mwyU+8B2TIdl+frKAW5FmA=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b108032-3125-44bd-1fd4-08d812bfa8f0
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2020 13:09:25.7718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mHUL+l2hN0hoQeR91qzNMF7B1p2HDRnDFjWLCxj2DmKcueulQ9Gqzx6EUuzn4CEJSJCA3vxnEBZ7fNvKYQAHKIBJ7omADA8FIRmVGEh2bIo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3588
Content-Type: multipart/alternative;
 boundary="------------64542B4BB17E3CE3B0D19901"
Content-Language: en-US

--------------64542B4BB17E3CE3B0D19901
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/15/20 8:38 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python-protobuf.inc                | 32 -----------------
>   .../python/python3-protobuf_3.11.3.bb         | 34 +++++++++++++++++--
>   2 files changed, 32 insertions(+), 34 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-protobuf.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-protobuf.inc b/meta-python/recipes-devtools/python/python-protobuf.inc
> deleted file mode 100644
> index 5716894f3..000000000
> --- a/meta-python/recipes-devtools/python/python-protobuf.inc
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -DESCRIPTION = "Protocol Buffers"
> -HOMEPAGE = "https://developers.google.com/protocol-buffers/"
> -SECTION = "devel/python"
> -
> -LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=19e8f490f9526b1de84f8d949cfcfd4e"
> -
> -inherit pypi
> -
> -SRC_URI[md5sum] = "eeda7dea65fc94e560fc9a8180eb1872"
> -SRC_URI[sha256sum] = "c77c974d1dadf246d789f6dad1c24426137c9091e930dbf50e0a29c1fcf00b1f"
> -
> -# http://errors.yoctoproject.org/Errors/Details/184715/
> -# Can't find required file: ../src/google/protobuf/descriptor.proto
> -CLEANBROKEN = "1"
> -
> -UPSTREAM_CHECK_REGEX = "protobuf/(?P<pver>\d+(\.\d+)+)/"
> -
> -RDEPENDS_${PN} += " \
> -    ${PYTHON_PN}-datetime \
> -    ${PYTHON_PN}-json \
> -    ${PYTHON_PN}-logging \
> -    ${PYTHON_PN}-netclient \
> -    ${PYTHON_PN}-numbers \
> -    ${PYTHON_PN}-pkgutil \
> -    ${PYTHON_PN}-six \
> -    ${PYTHON_PN}-unittest \
> -"
> -
> -# For usage in other recipies when compiling protobuf files (e.g. by grpcio-tools)
> -BBCLASSEXTEND = "native nativesdk"
> -
> diff --git a/meta-python/recipes-devtools/python/python3-protobuf_3.11.3.bb b/meta-python/recipes-devtools/python/python3-protobuf_3.11.3.bb
> index 30ea34e90..a4c9d6699 100644
> --- a/meta-python/recipes-devtools/python/python3-protobuf_3.11.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-protobuf_3.11.3.bb
> @@ -1,7 +1,37 @@
> -inherit setuptools3
> -require python-protobuf.inc
> +DESCRIPTION = "Protocol Buffers"
> +HOMEPAGE = "https://developers.google.com/protocol-buffers/"
> +SECTION = "devel/python"
> +
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=19e8f490f9526b1de84f8d949cfcfd4e"
> +
> +inherit pypi setuptools3
> +
> +SRC_URI[md5sum] = "eeda7dea65fc94e560fc9a8180eb1872"
> +SRC_URI[sha256sum] = "c77c974d1dadf246d789f6dad1c24426137c9091e930dbf50e0a29c1fcf00b1f"
> +
> +# http://errors.yoctoproject.org/Errors/Details/184715/
> +# Can't find required file: ../src/google/protobuf/descriptor.proto
> +CLEANBROKEN = "1"
> +
> +UPSTREAM_CHECK_REGEX = "protobuf/(?P<pver>\d+(\.\d+)+)/"
>   
>   DEPENDS += "protobuf"
> +
> +RDEPENDS_${PN} += " \
> +    ${PYTHON_PN}-datetime \
> +    ${PYTHON_PN}-json \
> +    ${PYTHON_PN}-logging \
> +    ${PYTHON_PN}-netclient \
> +    ${PYTHON_PN}-numbers \
> +    ${PYTHON_PN}-pkgutil \
> +    ${PYTHON_PN}-six \
> +    ${PYTHON_PN}-unittest \
> +"
> +
> +# For usage in other recipies when compiling protobuf files (e.g. by grpcio-tools)
> +BBCLASSEXTEND = "native nativesdk"
> +
>   DISTUTILS_BUILD_ARGS += "--cpp_implementation"
>   DISTUTILS_INSTALL_ARGS += "--cpp_implementation"
>   
>
> 

--------------64542B4BB17E3CE3B0D19901
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/15/20 8:38 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200615123848.31016-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200615123848.31016-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python-protobuf.inc                | 32 -----------------
 .../python/python3-protobuf_3.11.3.bb         | 34 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;--
 2 files changed, 32 insertions(&#43;), 34 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-protobuf.inc

diff --git a/meta-python/recipes-devtools/python/python-protobuf.inc b/meta-python/recipes-devtools/python/python-protobuf.inc
deleted file mode 100644
index 5716894f3..000000000
--- a/meta-python/recipes-devtools/python/python-protobuf.inc
&#43;&#43;&#43; /dev/null
@@ -1,32 &#43;0,0 @@
-DESCRIPTION = &quot;Protocol Buffers&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://developers.google.com/protocol-buffers/">&quot;https://developers.google.com/protocol-buffers/&quot;</a>
-SECTION = &quot;devel/python&quot;
-
-LICENSE = &quot;BSD-3-Clause&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=8;endline=8;md5=19e8f490f9526b1de84f8d949cfcfd4e">&quot;file://PKG-INFO;beginline=8;endline=8;md5=19e8f490f9526b1de84f8d949cfcfd4e&quot;</a>
-
-inherit pypi
-
-SRC_URI[md5sum] = &quot;eeda7dea65fc94e560fc9a8180eb1872&quot;
-SRC_URI[sha256sum] = &quot;c77c974d1dadf246d789f6dad1c24426137c9091e930dbf50e0a29c1fcf00b1f&quot;
-
-# <a class="moz-txt-link-freetext" href="http://errors.yoctoproject.org/Errors/Details/184715/">http://errors.yoctoproject.org/Errors/Details/184715/</a>
-# Can't find required file: ../src/google/protobuf/descriptor.proto
-CLEANBROKEN = &quot;1&quot;
-
-UPSTREAM_CHECK_REGEX = &quot;protobuf/(?P&lt;pver&gt;\d&#43;(\.\d&#43;)&#43;)/&quot;
-
-RDEPENDS_${PN} &#43;= &quot; \
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-json \
-    ${PYTHON_PN}-logging \
-    ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-numbers \
-    ${PYTHON_PN}-pkgutil \
-    ${PYTHON_PN}-six \
-    ${PYTHON_PN}-unittest \
-&quot;
-
-# For usage in other recipies when compiling protobuf files (e.g. by grpcio-tools)
-BBCLASSEXTEND = &quot;native nativesdk&quot;
-
diff --git a/meta-python/recipes-devtools/python/python3-protobuf_3.11.3.bb b/meta-python/recipes-devtools/python/python3-protobuf_3.11.3.bb
index 30ea34e90..a4c9d6699 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_3.11.3.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-protobuf_3.11.3.bb
@@ -1,7 &#43;1,37 @@
-inherit setuptools3
-require python-protobuf.inc
&#43;DESCRIPTION = &quot;Protocol Buffers&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://developers.google.com/protocol-buffers/">&quot;https://developers.google.com/protocol-buffers/&quot;</a>
&#43;SECTION = &quot;devel/python&quot;
&#43;
&#43;LICENSE = &quot;BSD-3-Clause&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=8;endline=8;md5=19e8f490f9526b1de84f8d949cfcfd4e">&quot;file://PKG-INFO;beginline=8;endline=8;md5=19e8f490f9526b1de84f8d949cfcfd4e&quot;</a>
&#43;
&#43;inherit pypi setuptools3
&#43;
&#43;SRC_URI[md5sum] = &quot;eeda7dea65fc94e560fc9a8180eb1872&quot;
&#43;SRC_URI[sha256sum] = &quot;c77c974d1dadf246d789f6dad1c24426137c9091e930dbf50e0a29c1fcf00b1f&quot;
&#43;
&#43;# <a class="moz-txt-link-freetext" href="http://errors.yoctoproject.org/Errors/Details/184715/">http://errors.yoctoproject.org/Errors/Details/184715/</a>
&#43;# Can't find required file: ../src/google/protobuf/descriptor.proto
&#43;CLEANBROKEN = &quot;1&quot;
&#43;
&#43;UPSTREAM_CHECK_REGEX = &quot;protobuf/(?P&lt;pver&gt;\d&#43;(\.\d&#43;)&#43;)/&quot;
 
 DEPENDS &#43;= &quot;protobuf&quot;
&#43;
&#43;RDEPENDS_${PN} &#43;= &quot; \
&#43;    ${PYTHON_PN}-datetime \
&#43;    ${PYTHON_PN}-json \
&#43;    ${PYTHON_PN}-logging \
&#43;    ${PYTHON_PN}-netclient \
&#43;    ${PYTHON_PN}-numbers \
&#43;    ${PYTHON_PN}-pkgutil \
&#43;    ${PYTHON_PN}-six \
&#43;    ${PYTHON_PN}-unittest \
&#43;&quot;
&#43;
&#43;# For usage in other recipies when compiling protobuf files (e.g. by grpcio-tools)
&#43;BBCLASSEXTEND = &quot;native nativesdk&quot;
&#43;
 DISTUTILS_BUILD_ARGS &#43;= &quot;--cpp_implementation&quot;
 DISTUTILS_INSTALL_ARGS &#43;= &quot;--cpp_implementation&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------64542B4BB17E3CE3B0D19901--

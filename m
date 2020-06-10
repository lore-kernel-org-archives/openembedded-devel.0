Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.58])
 by mx.groups.io with SMTP id smtpd.web12.3026.1591818667353374436
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jun 2020 12:51:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=YamKCS3Y;
 spf=pass (domain: windriver.com, ip: 40.107.75.58, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HyL53qVunPlnn9nW37c5TiNrXYRqnmDWC/WV76aXKM3ridLRIQJTTQ0qOW5vem0y8sguoNSOxrR7wpopDwWS+EITeEZ/056OCR6FujVqTS4c3dr/I4fpDXUoFJMCEn9glNfyiBdHTW99exqEoUoY1P2c3n5hIgQQ8TW7sM3l9qmamp5uj80VzC+5blgkirmORzZPxS7pujUAUX9HSbSCArgdVrdm5p5aGhpzKLsHjX3ONI6tSEbhejtPabRFe+HNFmOYRBMSumfBCpMIgXjAuCRpA3QlkOl4pUB8UzGh9zkxq8qYKnoCaMe3Jsg79FqPsbrp7hkI9a158LWvsvcLlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4m++7YEQLk0ldOApkF5cPbCX/JzCOutQ1Yoe0NbAgdE=;
 b=Zzz0p2585WPUV2M0Yuhfx3QR20/OAXCMKZWoViYJbZqbu5CKWaEgxfzkiiyatzJfyY6/Y9p0KBvKlrPOlcg6m98y161EuiIffOtl0CykTvz+Y/0FXJ+LckXjo3wZxigJ/bNDpIlBmXBWwZ+SZb+FPXURf3i+nmeAqecaPc+2WV839A/uLb3VyNkK7Jv0Db5MSvygYQcRTUBY7Mwb0C1pc5ATz1r51oqTb0rAUl+eGFpjilxwEyqkvzOMICtTiOdbci48TyK5uqsJhEz6QSBE8qkSN9NiWDl839GTHKyO+t3eQWgBJ5piBnPVZrkFf6MXcx8igxSzUF5bO3s2eeEvxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4m++7YEQLk0ldOApkF5cPbCX/JzCOutQ1Yoe0NbAgdE=;
 b=YamKCS3YSWmu8cC/opGGKLpnb3mbXqJ9cf9b3VcVZZlf2jOMxeHrYjbPGlGHO82+sCLX9MBK/1M2faN/OK+TK8mr81vwzx6+CJsXmYOhk002DHdNZFz58vfivb79ikvFcj56Bzs6uDJMKVfsj1D0M30zdKkj8WZsS+9lY3oJ8Q4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB3924.namprd11.prod.outlook.com (2603:10b6:405:7a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18; Wed, 10 Jun
 2020 19:51:06 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3088.021; Wed, 10 Jun 2020
 19:51:06 +0000
Subject: Re: [oe] [meta-python][PATCH 1/3] python3-evdev: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200609091121.23832-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <e59c0ea0-87e3-6a3c-da0d-c53bc43bee83@windriver.com>
Date: Wed, 10 Jun 2020 15:51:03 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200609091121.23832-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTBPR01CA0028.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::41) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTBPR01CA0028.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::41) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.19 via Frontend Transport; Wed, 10 Jun 2020 19:51:05 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ce99450-fc6a-463f-0d95-08d80d779cf1
X-MS-TrafficTypeDiagnostic: BN6PR11MB3924:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB3924ADFD22E031403535435E9F830@BN6PR11MB3924.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:138;
X-Forefront-PRVS: 0430FA5CB7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	si2TLTYwDvcS7oRWBmClvHh8w/KRRH44EkC+F1VnfFbnPkvfGFVRRuI2bKI+5WPpiCY3f2m7XO50PXwDhOG7wiWW+9eknkImjCQ0r7W403VhyRSf609fNXlWchlXON7T6v2D2Ec/JlX2taItYxr9lsvVxAGTVk7oEnJSYb1BAxM++XZY4O623GtSxz2RXRUp8B31zXXi8SO7eXp1Kda10uF9kNsEMgSi9ffg2mXVGQnZ7wvb5q7CwCDuS5cgRd+T1v57XMGn9gTR2BzRwy6Y4O8wiE6TEP+R+/E8ZOeq/8/5QiK7JS+5fWCNcGt7QQErFe23tGQWBY2Vy1HAa2h+RUx484g4FaSvwN1KWeqrOvmiSRhzmEDVsCvKKLZ9ItR8YWzjMjzcdOKNiow0r3nnXvDxORehtPL1O6lZyApjMqglZiQ7oGg/EqbaILZ5CR+RCx3+DwJwzKrw48XfO20Lpg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(346002)(39850400004)(136003)(366004)(376002)(316002)(6486002)(8936002)(16576012)(166002)(2616005)(956004)(31696002)(86362001)(31686004)(44832011)(83380400001)(966005)(66946007)(66556008)(5660300002)(53546011)(8676002)(16526019)(66476007)(36756003)(2906002)(478600001)(33964004)(186003)(52116002)(26005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	crbLDGcCMW5vK6Xn7r3NWoQyyM+efJWPpS2ogRNlFmRTWH3YViFiv8pGvrh+avNy3oZDPakihl8sRpb252x7gVeDDQCQrEFDRDj43InGO/HSluY6aF9kbdx1gSut/OGC9rDBnwwRTfa9dtjq3OxMdQQphYNummnX81zLpLl5NJyAPEuWf1b2sGesgKXFYsdVkhh5d14UABWPKiLPmrlIDN/NvSSfILM0ZUSi7IcWJXznpGa6MD53cCUdEvzIUmnlewuORMAeRUcKEqUDMpgT8HEPiYVWFo2LB9Q6e8opLTen74N64WQwwg3Di95qvOByWYNwY30liV+uCWCgjI13EaJXv1/hi8kfQtMJhFmYU9I1idDsez9TfEb3ESLE0PhrOfiAew071FRIbTevfqYV6vUsTo6W9AZ4PQZSyByBBKT4nFLe/UCAjZT/9ZmmAa0wKpOMcGuB7OHhPe+sQJr5QXMzDmmRiMTvYkWWsfvCnmgQKwNbF2Qi+qn+91l++394
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ce99450-fc6a-463f-0d95-08d80d779cf1
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2020 19:51:05.9517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mO6FvDT+oyPJ4WX5F5ZhGaQiZEZG2VM22UnpV6HUheWYIKCKqEfYiffBI8qBkZZ3UZ5qDp5ztgLJDEcsVTcgsQK9cvV1OK3rkH8vrYOhOGw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3924
Content-Type: multipart/alternative;
 boundary="------------DCD6FE5767E3F6B7168885FA"
Content-Language: en-US

--------------DCD6FE5767E3F6B7168885FA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/9/20 5:11 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python-evdev.inc  | 25 -------------------
>   .../python/python3-evdev_1.3.0.bb             | 22 +++++++++++++++-
>   2 files changed, 21 insertions(+), 26 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-evdev.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-evdev.inc b/meta-python/recipes-devtools/python/python-evdev.inc
> deleted file mode 100644
> index 5f5426aac..000000000
> --- a/meta-python/recipes-devtools/python/python-evdev.inc
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -SUMMARY = "Python evdev lib"
> -HOMEPAGE = "https://github.com/gvalkov/python-evdev"
> -LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=18debddbb3f52c661a129724a883a8e2"
> -
> -FILESEXTRAPATHS_prepend := "${THISDIR}/python-evdev:"
> -
> -SRC_URI = "${PYPI_SRC_URI}"
> -
> -SRC_URI[md5sum] = "05f9e900d6e11e1674475d2dd2668f0d"
> -SRC_URI[sha256sum] = "b1c649b4fed7252711011da235782b2c260b32e004058d62473471e5cd30634d"
> -
> -do_compile_prepend() {
> -    rm -rf ${S}/evdev/ecodes.c
> -}
> -
> -DISTUTILS_BUILD_ARGS = "build_ecodes --evdev-headers ${STAGING_DIR_TARGET}/usr/include/linux/input.h:${STAGING_DIR_TARGET}/usr/include/linux/input-event-codes.h"
> -
> -RDEPENDS_${PN} += "\
> -    ${PYTHON_PN}-ctypes \
> -    ${PYTHON_PN}-fcntl \
> -    ${PYTHON_PN}-io \
> -    ${PYTHON_PN}-shell \
> -    ${PYTHON_PN}-stringold \
> -    "
> diff --git a/meta-python/recipes-devtools/python/python3-evdev_1.3.0.bb b/meta-python/recipes-devtools/python/python3-evdev_1.3.0.bb
> index d87bf2fec..fe11049ad 100644
> --- a/meta-python/recipes-devtools/python/python3-evdev_1.3.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-evdev_1.3.0.bb
> @@ -1,3 +1,23 @@
> +SUMMARY = "Python evdev lib"
> +HOMEPAGE = "https://github.com/gvalkov/python-evdev"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=18debddbb3f52c661a129724a883a8e2"
> +
> +SRC_URI[md5sum] = "05f9e900d6e11e1674475d2dd2668f0d"
> +SRC_URI[sha256sum] = "b1c649b4fed7252711011da235782b2c260b32e004058d62473471e5cd30634d"
> +
>   inherit pypi setuptools3
> -require python-evdev.inc
>   
> +do_compile_prepend() {
> +    rm -rf ${S}/evdev/ecodes.c
> +}
> +
> +DISTUTILS_BUILD_ARGS = "build_ecodes --evdev-headers ${STAGING_DIR_TARGET}/usr/include/linux/input.h:${STAGING_DIR_TARGET}/usr/include/linux/input-event-codes.h"
> +
> +RDEPENDS_${PN} += "\
> +    ${PYTHON_PN}-ctypes \
> +    ${PYTHON_PN}-fcntl \
> +    ${PYTHON_PN}-io \
> +    ${PYTHON_PN}-shell \
> +    ${PYTHON_PN}-stringold \
> +    "
>
> 

--------------DCD6FE5767E3F6B7168885FA
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/9/20 5:11 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200609091121.23832-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200609091121.23832-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python-evdev.inc  | 25 -------------------
 .../python/python3-evdev_1.3.0.bb             | 22 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-
 2 files changed, 21 insertions(&#43;), 26 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-evdev.inc

diff --git a/meta-python/recipes-devtools/python/python-evdev.inc b/meta-python/recipes-devtools/python/python-evdev.inc
deleted file mode 100644
index 5f5426aac..000000000
--- a/meta-python/recipes-devtools/python/python-evdev.inc
&#43;&#43;&#43; /dev/null
@@ -1,25 &#43;0,0 @@
-SUMMARY = &quot;Python evdev lib&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/gvalkov/python-evdev">&quot;https://github.com/gvalkov/python-evdev&quot;</a>
-LICENSE = &quot;BSD-3-Clause&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=18debddbb3f52c661a129724a883a8e2">&quot;file://LICENSE;md5=18debddbb3f52c661a129724a883a8e2&quot;</a>
-
-FILESEXTRAPATHS_prepend := &quot;${THISDIR}/python-evdev:&quot;
-
-SRC_URI = &quot;${PYPI_SRC_URI}&quot;
-
-SRC_URI[md5sum] = &quot;05f9e900d6e11e1674475d2dd2668f0d&quot;
-SRC_URI[sha256sum] = &quot;b1c649b4fed7252711011da235782b2c260b32e004058d62473471e5cd30634d&quot;
-
-do_compile_prepend() {
-    rm -rf ${S}/evdev/ecodes.c
-}
-
-DISTUTILS_BUILD_ARGS = &quot;build_ecodes --evdev-headers ${STAGING_DIR_TARGET}/usr/include/linux/input.h:${STAGING_DIR_TARGET}/usr/include/linux/input-event-codes.h&quot;
-
-RDEPENDS_${PN} &#43;= &quot;\
-    ${PYTHON_PN}-ctypes \
-    ${PYTHON_PN}-fcntl \
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-shell \
-    ${PYTHON_PN}-stringold \
-    &quot;
diff --git a/meta-python/recipes-devtools/python/python3-evdev_1.3.0.bb b/meta-python/recipes-devtools/python/python3-evdev_1.3.0.bb
index d87bf2fec..fe11049ad 100644
--- a/meta-python/recipes-devtools/python/python3-evdev_1.3.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-evdev_1.3.0.bb
@@ -1,3 &#43;1,23 @@
&#43;SUMMARY = &quot;Python evdev lib&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/gvalkov/python-evdev">&quot;https://github.com/gvalkov/python-evdev&quot;</a>
&#43;LICENSE = &quot;BSD-3-Clause&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=18debddbb3f52c661a129724a883a8e2">&quot;file://LICENSE;md5=18debddbb3f52c661a129724a883a8e2&quot;</a>
&#43;
&#43;SRC_URI[md5sum] = &quot;05f9e900d6e11e1674475d2dd2668f0d&quot;
&#43;SRC_URI[sha256sum] = &quot;b1c649b4fed7252711011da235782b2c260b32e004058d62473471e5cd30634d&quot;
&#43;
 inherit pypi setuptools3
-require python-evdev.inc
 
&#43;do_compile_prepend() {
&#43;    rm -rf ${S}/evdev/ecodes.c
&#43;}
&#43;
&#43;DISTUTILS_BUILD_ARGS = &quot;build_ecodes --evdev-headers ${STAGING_DIR_TARGET}/usr/include/linux/input.h:${STAGING_DIR_TARGET}/usr/include/linux/input-event-codes.h&quot;
&#43;
&#43;RDEPENDS_${PN} &#43;= &quot;\
&#43;    ${PYTHON_PN}-ctypes \
&#43;    ${PYTHON_PN}-fcntl \
&#43;    ${PYTHON_PN}-io \
&#43;    ${PYTHON_PN}-shell \
&#43;    ${PYTHON_PN}-stringold \
&#43;    &quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------DCD6FE5767E3F6B7168885FA--

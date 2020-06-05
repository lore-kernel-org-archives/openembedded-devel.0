Received: from NAM02-CY1-obe.outbound.protection.outlook.com (NAM02-CY1-obe.outbound.protection.outlook.com [40.107.76.53])
 by mx.groups.io with SMTP id smtpd.web12.199.1591385297593841153
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Jun 2020 12:28:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Ds+oGrVC;
 spf=pass (domain: windriver.com, ip: 40.107.76.53, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IrGk/0fwE1R/srQ+84nh4kVvhuBdcwtavFj5gYM7ZaPfU73oHM/sUQTYbSodG4XIWYV/CQyATjt339srN/0xpnl9d4VKl+/cPgdbFmdkcxgw2ixK2EcPZ6YmgzVLbL531Sc5qR9qgVe6+yH8TMrDF3uM2DjT+tjmr3dx9JQBcPcZSW20FI2HmX2tA+xVAdaHMZ/hOa1EV5WmvFM4bhxflYxU9wNMwSzHXjdwWTCVQwNx2uNf29Y1pbDyU2lA0xrREZO9PRqJm9fRdyxkqAAkb2OaYnTWxNn6/bCxx2CSsCA1lYSIlr79l0YG4wYaSp2BIyqyF29yqn46CTz0H3lZkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V1jkd15K86Oh/xrO6HkgVnfvCfDK9YJszinrhIUxtL4=;
 b=HRpiJwFT/6x8f4anKbxM44WFjy129q1q8L1aoV6PvBmjhiD3j9EYW5BBNbeWud16HkltOFGfyFbbEpACnTCBaggHDZ577iqZLrpQ95MfTkOt3iS+rVy24Jmx33fgGQSpIzzAfQJgO2N/fiMi57pAwJ+lBX/LlwcK3w6QxROxLvxVa56aVDh8T4bmHpigf3TwDwmzOMSdGmtrhG1OutSnjjIArcEK/ysnwHnewcB/rBERzC5UQy4XzgEMpfmZwqFcmEjm0XpD87cBCa+HJpPkSH1aJ830Avhsoypr7rMDVgkbviNjIfUgaHcKJQiUgvjnTUuz3ZaT1OpBkLHT3aU73Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V1jkd15K86Oh/xrO6HkgVnfvCfDK9YJszinrhIUxtL4=;
 b=Ds+oGrVCd5MIqd9vM9RSeGBONI14JUDFdkC1iVS1NA2TMIwuVW4DcJiiaBi1Pl6Hn+Op5IMuW78sgfaJdBRhNv5DmTF2bKy+QwYJEJezWvqmODWli0WvvmoYeb/5+fJa7Ff1i7UwNvMH9fe1SBa66YuBW6OJtUkn4EIwqqj69rw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB4033.namprd11.prod.outlook.com (2603:10b6:405:78::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Fri, 5 Jun
 2020 19:28:16 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3066.019; Fri, 5 Jun 2020
 19:28:16 +0000
Subject: Re: [oe] [meta-python][PATCH 2/2] python3-jsonschema: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200605173152.2360-1-leon.anavi@konsulko.com>
 <20200605173152.2360-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <6a239e08-cc29-6ed9-3f5d-e09fd84e5967@windriver.com>
Date: Fri, 5 Jun 2020 15:28:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200605173152.2360-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTOPR0101CA0021.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::34) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTOPR0101CA0021.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend Transport; Fri, 5 Jun 2020 19:28:16 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00c88a37-841c-400f-ba7d-08d809869896
X-MS-TrafficTypeDiagnostic: BN6PR11MB4033:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB4033FE67127B5DE1EA8067D99F860@BN6PR11MB4033.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:513;
X-Forefront-PRVS: 0425A67DEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ds0qHhjytzi4YNWZzfc7T31BBG4UACR4f+ueHaORflzrUitWXen0fRAJFdreGHZyYDztJHK6Y2v34WAIPMdvFDzFEOrdbq3vZMlrdtHuMICBiDvdgmbNu5bg7Dm7ZoS+l2Q2e2q612dzZp6v3PfapoCHEiSsYWtD0dt0GZ77rWRQWIqcqqRDjvgkjrl6cwPF5Cggu84iPjJNRRzHie1SDjba/7YjpL6t7wVA3PuokCdKvjASEdQ67cH+iIa/vbwFzWPc7Kqqf8dm1pm1+1cpA2Ki6fLKkHNny1EZlgccUG7wLaNZgiXGY0i5Jon0keY+dQtEFuSqOJYE0EQO8NkO6agJ3d1Coc9Q+meBEw197FZhnMakL7DBUeZp0m1u+dd5KqzJ7KO9yGne7FqTmvlPgzOVaPtJA+XrYG9WcosDo6r65FomDcIVzA5N062kCsEwfPgHmukjWjfIPQvkZg3sfw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(376002)(136003)(396003)(366004)(346002)(16576012)(16526019)(86362001)(66556008)(186003)(53546011)(66476007)(44832011)(66946007)(316002)(956004)(26005)(6486002)(83380400001)(2616005)(36756003)(31696002)(478600001)(52116002)(8936002)(966005)(33964004)(5660300002)(166002)(2906002)(31686004)(8676002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	THwawjJSqf/EIP1+mQX3cBQOPaeKjcWL4HqNJrBFklQAOb+zbd+SdPid6L0YRzYLr3BSx4munJMg9vl4WLYS21lvrvO3O+gYiRzSuC918a8WFUnCIl76GVwqFsdnACimYiDpazwa1gBMeUkBl78l3RkBA6rzgHvvukLALG+2P33dVT1PrlbxdF4L3zDnVTukLVNvRXR4YruWqGeIbs0LJBG7oQIUPkrG3a3MqIx22kXBadSZ/etUoYBlNzXCKfg9CmOIvYT8BztahF24FsHlrWrUZmZgP3DU00GSSsI6AHXfW2mT0ZzzBAAuQGa6qnQ+a0GgJbCXsowV601jpaiZftqq425wX5LLuEWAqWh4LTUUxl8HTthdS9H9525/3H1y4l+pqwIulTEMTfwLF75nCaVCxNfKGmZntMAfEORtHr3Fl99fNWP9xMDpBhxelt40GalqGedI6q9fMWjNr4FGlsUEEAGLyeHxpS2FfY7tbtyjt5GDYZaqhRJ3u9u3N594
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00c88a37-841c-400f-ba7d-08d809869896
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2020 19:28:16.4077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UVHaxNFG4THIsZaplxPTZasyVtaxJki89tTktZEmX2rhz5jW8pu3265nYm4/pbKlV8+QVgSZ5lXzSFaavKzQSPFVpHb9btDLGVGcLQh5uzw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4033
Content-Type: multipart/alternative;
 boundary="------------C7C2BDE3B164C90F9BC61896"
Content-Language: en-US

--------------C7C2BDE3B164C90F9BC61896
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/5/20 1:31 PM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python-jsonschema.inc              | 48 -------------------
>   .../python/python3-jsonschema_3.2.0.bb        | 48 ++++++++++++++++++-
>   2 files changed, 47 insertions(+), 49 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-jsonschema.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-jsonschema.inc b/meta-python/recipes-devtools/python/python-jsonschema.inc
> deleted file mode 100644
> index 8135b0fe6..000000000
> --- a/meta-python/recipes-devtools/python/python-jsonschema.inc
> +++ /dev/null
> @@ -1,48 +0,0 @@
> -SUMMARY = "An implementation of JSON Schema validation for Python"
> -HOMEPAGE = "https://github.com/Julian/jsonschema"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8 \
> -                    file://json/LICENSE;md5=9d4de43111d33570c8fe49b4cb0e01af"
> -DEPENDS += "${PYTHON_PN}-vcversioner-native ${PYTHON_PN}-setuptools-scm-native"
> -
> -FILESEXTRAPATHS_prepend := "${THISDIR}/python-jsonschema:"
> -
> -SRC_URI[md5sum] = "f1a0b5011f05a02a8dee1070cd10a26d"
> -SRC_URI[sha256sum] = "c8a85b28d377cc7737e46e2d9f2b4f44ee3c0e1deac6bf46ddefc7187d30797a"
> -
> -PACKAGECONFIG ??= "format"
> -PACKAGECONFIG[format] = ",,,\
> -    ${PYTHON_PN}-idna \
> -    ${PYTHON_PN}-jsonpointer \
> -    ${PYTHON_PN}-webcolors \
> -    ${PYTHON_PN}-rfc3987 \
> -    ${PYTHON_PN}-strict-rfc3339 \
> -"
> -PACKAGECONFIG[nongpl] = ",,,\
> -    ${PYTHON_PN}-idna \
> -    ${PYTHON_PN}-jsonpointer \
> -    ${PYTHON_PN}-webcolors \
> -    ${PYTHON_PN}-rfc3986-validator \
> -    ${PYTHON_PN}-rfc3339-validator \
> -"
> -
> -RDEPENDS_${PN} += " \
> -    ${PYTHON_PN}-attrs \
> -    ${PYTHON_PN}-core \
> -    ${PYTHON_PN}-datetime \
> -    ${PYTHON_PN}-importlib-metadata \
> -    ${PYTHON_PN}-io \
> -    ${PYTHON_PN}-json \
> -    ${PYTHON_PN}-netclient \
> -    ${PYTHON_PN}-numbers \
> -    ${PYTHON_PN}-pkgutil \
> -    ${PYTHON_PN}-pprint \
> -    ${PYTHON_PN}-pyrsistent \
> -    ${PYTHON_PN}-shell \
> -    ${PYTHON_PN}-six \
> -    ${PYTHON_PN}-unittest \
> -    ${PYTHON_PN}-setuptools-scm \
> -    ${PYTHON_PN}-zipp \
> -"
> -
> -BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python3-jsonschema_3.2.0.bb b/meta-python/recipes-devtools/python/python3-jsonschema_3.2.0.bb
> index 926990747..2705dd3ba 100644
> --- a/meta-python/recipes-devtools/python/python3-jsonschema_3.2.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-jsonschema_3.2.0.bb
> @@ -1,2 +1,48 @@
> +SUMMARY = "An implementation of JSON Schema validation for Python"
> +HOMEPAGE = "https://github.com/Julian/jsonschema"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8 \
> +                    file://json/LICENSE;md5=9d4de43111d33570c8fe49b4cb0e01af"
> +DEPENDS += "${PYTHON_PN}-vcversioner-native ${PYTHON_PN}-setuptools-scm-native"
> +
> +SRC_URI[md5sum] = "f1a0b5011f05a02a8dee1070cd10a26d"
> +SRC_URI[sha256sum] = "c8a85b28d377cc7737e46e2d9f2b4f44ee3c0e1deac6bf46ddefc7187d30797a"
> +
>   inherit pypi setuptools3
> -require python-jsonschema.inc
> +
> +PACKAGECONFIG ??= "format"
> +PACKAGECONFIG[format] = ",,,\
> +    ${PYTHON_PN}-idna \
> +    ${PYTHON_PN}-jsonpointer \
> +    ${PYTHON_PN}-webcolors \
> +    ${PYTHON_PN}-rfc3987 \
> +    ${PYTHON_PN}-strict-rfc3339 \
> +"
> +PACKAGECONFIG[nongpl] = ",,,\
> +    ${PYTHON_PN}-idna \
> +    ${PYTHON_PN}-jsonpointer \
> +    ${PYTHON_PN}-webcolors \
> +    ${PYTHON_PN}-rfc3986-validator \
> +    ${PYTHON_PN}-rfc3339-validator \
> +"
> +
> +RDEPENDS_${PN} += " \
> +    ${PYTHON_PN}-attrs \
> +    ${PYTHON_PN}-core \
> +    ${PYTHON_PN}-datetime \
> +    ${PYTHON_PN}-importlib-metadata \
> +    ${PYTHON_PN}-io \
> +    ${PYTHON_PN}-json \
> +    ${PYTHON_PN}-netclient \
> +    ${PYTHON_PN}-numbers \
> +    ${PYTHON_PN}-pkgutil \
> +    ${PYTHON_PN}-pprint \
> +    ${PYTHON_PN}-pyrsistent \
> +    ${PYTHON_PN}-shell \
> +    ${PYTHON_PN}-six \
> +    ${PYTHON_PN}-unittest \
> +    ${PYTHON_PN}-setuptools-scm \
> +    ${PYTHON_PN}-zipp \
> +"
> +
> +BBCLASSEXTEND = "native nativesdk"
>
> 

--------------C7C2BDE3B164C90F9BC61896
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/5/20 1:31 PM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200605173152.2360-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200605173152.2360-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python-jsonschema.inc              | 48 -------------------
 .../python/python3-jsonschema_3.2.0.bb        | 48 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-
 2 files changed, 47 insertions(&#43;), 49 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-jsonschema.inc

diff --git a/meta-python/recipes-devtools/python/python-jsonschema.inc b/meta-python/recipes-devtools/python/python-jsonschema.inc
deleted file mode 100644
index 8135b0fe6..000000000
--- a/meta-python/recipes-devtools/python/python-jsonschema.inc
&#43;&#43;&#43; /dev/null
@@ -1,48 &#43;0,0 @@
-SUMMARY = &quot;An implementation of JSON Schema validation for Python&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/Julian/jsonschema">&quot;https://github.com/Julian/jsonschema&quot;</a>
-LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8\-file://json/LICENSE;md5=9d4de43111d33570c8fe49b4cb0e01af">&quot;file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8 \
-                    file://json/LICENSE;md5=9d4de43111d33570c8fe49b4cb0e01af&quot;</a>
-DEPENDS &#43;= &quot;${PYTHON_PN}-vcversioner-native ${PYTHON_PN}-setuptools-scm-native&quot;
-
-FILESEXTRAPATHS_prepend := &quot;${THISDIR}/python-jsonschema:&quot;
-
-SRC_URI[md5sum] = &quot;f1a0b5011f05a02a8dee1070cd10a26d&quot;
-SRC_URI[sha256sum] = &quot;c8a85b28d377cc7737e46e2d9f2b4f44ee3c0e1deac6bf46ddefc7187d30797a&quot;
-
-PACKAGECONFIG ??= &quot;format&quot;
-PACKAGECONFIG[format] = &quot;,,,\
-    ${PYTHON_PN}-idna \
-    ${PYTHON_PN}-jsonpointer \
-    ${PYTHON_PN}-webcolors \
-    ${PYTHON_PN}-rfc3987 \
-    ${PYTHON_PN}-strict-rfc3339 \
-&quot;
-PACKAGECONFIG[nongpl] = &quot;,,,\
-    ${PYTHON_PN}-idna \
-    ${PYTHON_PN}-jsonpointer \
-    ${PYTHON_PN}-webcolors \
-    ${PYTHON_PN}-rfc3986-validator \
-    ${PYTHON_PN}-rfc3339-validator \
-&quot;
-
-RDEPENDS_${PN} &#43;= &quot; \
-    ${PYTHON_PN}-attrs \
-    ${PYTHON_PN}-core \
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-importlib-metadata \
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-json \
-    ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-numbers \
-    ${PYTHON_PN}-pkgutil \
-    ${PYTHON_PN}-pprint \
-    ${PYTHON_PN}-pyrsistent \
-    ${PYTHON_PN}-shell \
-    ${PYTHON_PN}-six \
-    ${PYTHON_PN}-unittest \
-    ${PYTHON_PN}-setuptools-scm \
-    ${PYTHON_PN}-zipp \
-&quot;
-
-BBCLASSEXTEND = &quot;native nativesdk&quot;
diff --git a/meta-python/recipes-devtools/python/python3-jsonschema_3.2.0.bb b/meta-python/recipes-devtools/python/python3-jsonschema_3.2.0.bb
index 926990747..2705dd3ba 100644
--- a/meta-python/recipes-devtools/python/python3-jsonschema_3.2.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-jsonschema_3.2.0.bb
@@ -1,2 &#43;1,48 @@
&#43;SUMMARY = &quot;An implementation of JSON Schema validation for Python&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/Julian/jsonschema">&quot;https://github.com/Julian/jsonschema&quot;</a>
&#43;LICENSE = &quot;MIT&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8\&#43;file://json/LICENSE;md5=9d4de43111d33570c8fe49b4cb0e01af">&quot;file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8 \
&#43;                    file://json/LICENSE;md5=9d4de43111d33570c8fe49b4cb0e01af&quot;</a>
&#43;DEPENDS &#43;= &quot;${PYTHON_PN}-vcversioner-native ${PYTHON_PN}-setuptools-scm-native&quot;
&#43;
&#43;SRC_URI[md5sum] = &quot;f1a0b5011f05a02a8dee1070cd10a26d&quot;
&#43;SRC_URI[sha256sum] = &quot;c8a85b28d377cc7737e46e2d9f2b4f44ee3c0e1deac6bf46ddefc7187d30797a&quot;
&#43;
 inherit pypi setuptools3
-require python-jsonschema.inc
&#43;
&#43;PACKAGECONFIG ??= &quot;format&quot;
&#43;PACKAGECONFIG[format] = &quot;,,,\
&#43;    ${PYTHON_PN}-idna \
&#43;    ${PYTHON_PN}-jsonpointer \
&#43;    ${PYTHON_PN}-webcolors \
&#43;    ${PYTHON_PN}-rfc3987 \
&#43;    ${PYTHON_PN}-strict-rfc3339 \
&#43;&quot;
&#43;PACKAGECONFIG[nongpl] = &quot;,,,\
&#43;    ${PYTHON_PN}-idna \
&#43;    ${PYTHON_PN}-jsonpointer \
&#43;    ${PYTHON_PN}-webcolors \
&#43;    ${PYTHON_PN}-rfc3986-validator \
&#43;    ${PYTHON_PN}-rfc3339-validator \
&#43;&quot;
&#43;
&#43;RDEPENDS_${PN} &#43;= &quot; \
&#43;    ${PYTHON_PN}-attrs \
&#43;    ${PYTHON_PN}-core \
&#43;    ${PYTHON_PN}-datetime \
&#43;    ${PYTHON_PN}-importlib-metadata \
&#43;    ${PYTHON_PN}-io \
&#43;    ${PYTHON_PN}-json \
&#43;    ${PYTHON_PN}-netclient \
&#43;    ${PYTHON_PN}-numbers \
&#43;    ${PYTHON_PN}-pkgutil \
&#43;    ${PYTHON_PN}-pprint \
&#43;    ${PYTHON_PN}-pyrsistent \
&#43;    ${PYTHON_PN}-shell \
&#43;    ${PYTHON_PN}-six \
&#43;    ${PYTHON_PN}-unittest \
&#43;    ${PYTHON_PN}-setuptools-scm \
&#43;    ${PYTHON_PN}-zipp \
&#43;&quot;
&#43;
&#43;BBCLASSEXTEND = &quot;native nativesdk&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------C7C2BDE3B164C90F9BC61896--

Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.77])
 by mx.groups.io with SMTP id smtpd.web12.12171.1591799351000577663
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jun 2020 07:29:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=SajQ0GvV;
 spf=pass (domain: windriver.com, ip: 40.107.237.77, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k+N1uy1LA8exAvLp8NHmPVJh6pB3xGc1ALYDp5kqCV1ZqL9JMMTKrJW8t/ZBts780s3U6++Go/E6Izcr2NUqd428m5/eYFXW4mT50thuHJzMW/NYzGPBfyQTmDkf9IuRwKq55TrMnq5KJPpOIgFw0CZFi40d4GSgPqR3xauLqCC6hr6zsWjXOtb0sTrmC2DgjkFuT3gXxLomyYnTDd4hxYiIEneJ2QsZH3jYCW4jKGBkvQirpQbXtbYflgUXgLU2iz77hZWY9DFIFjxEByDyPtn4QG9nkpRdIEBPaFHKxXHrI3l/fgAgW42clF8pQhiL0io8Vr9/JDZKebsUH3Exsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yj9Oe1wWwkCqQjujvl6s2OCcx592j4wVKM5Sn/UKFiY=;
 b=V9xURODWIJhg4iiiyPBjyRCBtqCEJLpr6N1PD3ubEgehvfgVIkK60rFQx8b9AJY0BPXJO0LXBnuVNpEAJM4SV/89akWycq1mUPJuTRCtn85ii6/r13wf3CtD9p7LCo4/Q7q70QihcBQb9X87/zkauR7McA7j5B/yl0T6lVzq6ZmMMWKPZ0qiUhn7pguOPjObAdVyeTuJHY1E57NOD5DATj0q9E0s8WNB824UvpmoNavoW6GPYGi/2EUCrbt8I80o8a73M9rvwNfebZMwXYsi494IDQoctIJxBToQEANvHBB1nLLLfju3u61VCh4rUQbRHGWP5Z/qCYcH+Pgy1WS0zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yj9Oe1wWwkCqQjujvl6s2OCcx592j4wVKM5Sn/UKFiY=;
 b=SajQ0GvV13nbMP8Z3zgaywmKlQJwthc3hhh6xilpJle6UBCCuItqRFsI2thlXp/7X0p6oTvpkW16Lk0PX3ZV3EF6DWF6XTYDwHoAeRnaK4wfCvh1SQ4uMzAX2LQ5NVg4ZKSTebVLgfPwUktglq3IC0mjkXKj9IlsDKP189vUr+s=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB3953.namprd11.prod.outlook.com (2603:10b6:405:7f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.19; Wed, 10 Jun
 2020 14:29:09 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3088.021; Wed, 10 Jun 2020
 14:29:09 +0000
Subject: Re: [oe] [meta-python][PATCH 1/7] python3-lxml: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200608121410.5814-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <1b988c8c-97a7-80af-c667-6fe9277ea832@windriver.com>
Date: Wed, 10 Jun 2020 10:29:06 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200608121410.5814-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0074.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::13) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0074.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18 via Frontend Transport; Wed, 10 Jun 2020 14:29:08 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 76fe84c5-e01a-47ec-895f-08d80d4aa34c
X-MS-TrafficTypeDiagnostic: BN6PR11MB3953:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB395376806FD47F65AA10CD8B9F830@BN6PR11MB3953.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-Forefront-PRVS: 0430FA5CB7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9QIMdhkgPMaS24JO6Z3las52THf10IVNcMS9eoKNEDiQhRVVElMIe1mA7EKZUWVji5Swa0yWT2suz2UCzyYzUq1zM9GxmG4Nq9wqH27GLjyc6kOGkmiOXYsB3xKObUyYENsmQXWCKEQfNd0a8B+9fd0bVjS8b4QtpVyMpVlWzg5E/shW75wwOoqkeW+S1chn0dLKcX2P0haewhFHxDHdW3wPaWrm+gc85pX3QjPcuOpMK6YURUHjTjJsLJqM58IcCu+yJ8THCGTSyyR5gkjetp8cUbdkYN9BSHl2f0Og/XN3kNDr73i7FUfYhBpAcyC8i80OM1fEPA7AkEPV1b8x4H7g7tXiHdzgMQiccRQeluv/oe99gGUL7Su4xvXhoTYDOHTMq45fqPveTpaCidCezCIW6ZZvoW2h6AxtGhMvXyRECYZzWlGjNmUlOkAY/B9a3ku1+TOTU+XbAhwcKdlflA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(39850400004)(376002)(366004)(346002)(136003)(8676002)(8936002)(66556008)(66946007)(66476007)(5660300002)(31696002)(86362001)(30864003)(31686004)(966005)(33964004)(36756003)(316002)(6486002)(166002)(478600001)(2906002)(2616005)(186003)(26005)(44832011)(83380400001)(53546011)(956004)(16576012)(16526019)(52116002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	0M0GcLGB2cde0cV2v2HCqPb7DYu/6eSVS1iepJK/a2TR+AS9ol+Lw53gugMvLfT+8DLxYo7Q6E0VfQBVDVATZQVLUrO2YoVmysibsDnK7TqZcQFsXqrWPmEbSKMIKyLCgi1x5lRsAwW2oLd66EzLuSFoucd2ZPSL2B1NX4Z4aDfexPjdtiAQl8QZ6qG3N/jeNBe4SlQYQHABnRYoc0L9Czx+3WFC6pu34ABQr01iSDoO6Pn3i5h2vFMkEazi04V0ZH+s9AlMjLY4WQQA66Oo2pTvbMfrXZFbP3f7daHofFmwrnT/a7+MBRJ1z4sP6Cx/dmEOAd2+AKQv1xGbZ6w0fZL5MRkaCO+8//PkKpB3YU/2ci4sGk4qDhrkfXWQLlsoOhrDyaOAiUdUDfz9PoQMdHh6kGS862uE6435hoLdSXwW5cK0+1ia49QzlFlZvIZBGgCpARUQjJsM02RK9bJwLtXmjB+tuAhd7jInafhMDRU=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76fe84c5-e01a-47ec-895f-08d80d4aa34c
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2020 14:29:09.5016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DRR5lo2SUnsAHzR7CYjgeYHleE8zZKg/+tYDUI7VI0VvGfYdz37JBARU0+UEh8XRixbzyf01ZRZS+kCpFQkh73rJfKVhG6q2zokyhcTaZ5s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3953
Content-Type: multipart/alternative;
 boundary="------------E4707966933BC2B7119C47E6"
Content-Language: en-US

--------------E4707966933BC2B7119C47E6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/8/20 8:14 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python-lxml.inc   | 50 -----------------
>   .../python/python3-lxml_4.5.0.bb              | 53 ++++++++++++++++++-
>   2 files changed, 51 insertions(+), 52 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-lxml.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-lxml.inc b/meta-python/recipes-devtools/python/python-lxml.inc
> deleted file mode 100644
> index 05b5eae46..000000000
> --- a/meta-python/recipes-devtools/python/python-lxml.inc
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -SUMMARY = "Powerful and Pythonic XML processing library combining libxml2/libxslt with the ElementTree API."
> -DESCRIPTION = "lxml is a Pythonic, mature binding for the libxml2 and \
> -libxslt libraries. It provides safe and convenient access to these \
> -libraries using the ElementTree API. It extends the ElementTree API \
> -significantly to offer support for XPath, RelaxNG, XML Schema, XSLT, \
> -C14N and much more."
> -HOMEPAGE = "http://codespeak.net/lxml"
> -SECTION = "devel/python"
> -LICENSE = "BSD & GPLv2 & MIT & PSF"
> -LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
> -                    file://doc/licenses/elementtree.txt;md5=eb34d036a6e3d56314ee49a6852ac891 \
> -                    file://doc/licenses/BSD.txt;md5=700a1fc17f4797d4f2d34970c8ee694b \
> -                    file://doc/licenses/GPL.txt;md5=94d55d512a9ba36caa9b7df079bae19f \
> -                    file://src/lxml/isoschematron/resources/rng/iso-schematron.rng;beginline=2;endline=7;md5=fc85684a8dd5fa272c086bceb0d99e10 \
> -                    file://src/lxml/isoschematron/resources/xsl/iso-schematron-xslt1/iso_schematron_message.xsl;beginline=2;endline=24;md5=cc86b7b2bbc678e13f58ea403eb9929b \
> -                    file://src/lxml/isoschematron/resources/xsl/RNG2Schtrn.xsl;beginline=2;endline=7;md5=5b03236d293dc3784205542b409d2f53 \
> -                    "
> -
> -DEPENDS += "libxml2 libxslt"
> -
> -SRC_URI[md5sum] = "f088e452ed45b030b6f84269f1e84d11"
> -SRC_URI[sha256sum] = "8620ce80f50d023d414183bf90cc2576c2837b88e00bea3f33ad2630133bbb60"
> -
> -DISTUTILS_BUILD_ARGS += " \
> -                     --with-xslt-config='pkg-config libxslt' \
> -                     --with-xml2-config='pkg-config libxml-2.0' \
> -"
> -
> -DISTUTILS_INSTALL_ARGS += " \
> -                     --with-xslt-config='pkg-config libxslt' \
> -                     --with-xml2-config='pkg-config libxml-2.0' \
> -"
> -
> -inherit pypi
> -
> -# {standard input}: Assembler messages:
> -# {standard input}:1488805: Error: branch out of range
> -DEBUG_OPTIMIZATION_remove_mips = " -Og"
> -DEBUG_OPTIMIZATION_append_mips = " -O"
> -BUILD_OPTIMIZATION_remove_mips = " -Og"
> -BUILD_OPTIMIZATION_append_mips = " -O"
> -
> -DEBUG_OPTIMIZATION_remove_mipsel = " -Og"
> -DEBUG_OPTIMIZATION_append_mipsel = " -O"
> -BUILD_OPTIMIZATION_remove_mipsel = " -Og"
> -BUILD_OPTIMIZATION_append_mipsel = " -O"
> -
> -BBCLASSEXTEND = "native nativesdk"
> -
> -RDEPENDS_${PN} += "libxml2 libxslt ${PYTHON_PN}-compression"
> diff --git a/meta-python/recipes-devtools/python/python3-lxml_4.5.0.bb b/meta-python/recipes-devtools/python/python3-lxml_4.5.0.bb
> index b95d7bae7..e3cfa46d1 100644
> --- a/meta-python/recipes-devtools/python/python3-lxml_4.5.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-lxml_4.5.0.bb
> @@ -1,3 +1,52 @@
> -inherit setuptools3
> -require python-lxml.inc
> +SUMMARY = "Powerful and Pythonic XML processing library combining libxml2/libxslt with the ElementTree API."
> +DESCRIPTION = "lxml is a Pythonic, mature binding for the libxml2 and \
> +libxslt libraries. It provides safe and convenient access to these \
> +libraries using the ElementTree API. It extends the ElementTree API \
> +significantly to offer support for XPath, RelaxNG, XML Schema, XSLT, \
> +C14N and much more."
> +HOMEPAGE = "http://codespeak.net/lxml"
> +SECTION = "devel/python"
> +LICENSE = "BSD & GPLv2 & MIT & PSF"
> +LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
> +                    file://doc/licenses/elementtree.txt;md5=eb34d036a6e3d56314ee49a6852ac891 \
> +                    file://doc/licenses/BSD.txt;md5=700a1fc17f4797d4f2d34970c8ee694b \
> +                    file://doc/licenses/GPL.txt;md5=94d55d512a9ba36caa9b7df079bae19f \
> +                    file://src/lxml/isoschematron/resources/rng/iso-schematron.rng;beginline=2;endline=7;md5=fc85684a8dd5fa272c086bceb0d99e10 \
> +                    file://src/lxml/isoschematron/resources/xsl/iso-schematron-xslt1/iso_schematron_message.xsl;beginline=2;endline=24;md5=cc86b7b2bbc678e13f58ea403eb9929b \
> +                    file://src/lxml/isoschematron/resources/xsl/RNG2Schtrn.xsl;beginline=2;endline=7;md5=5b03236d293dc3784205542b409d2f53 \
> +                    "
> +
> +DEPENDS += "libxml2 libxslt"
> +
> +SRC_URI[md5sum] = "f088e452ed45b030b6f84269f1e84d11"
> +SRC_URI[sha256sum] = "8620ce80f50d023d414183bf90cc2576c2837b88e00bea3f33ad2630133bbb60"
> +
> +DISTUTILS_BUILD_ARGS += " \
> +                     --with-xslt-config='pkg-config libxslt' \
> +                     --with-xml2-config='pkg-config libxml-2.0' \
> +"
> +
> +DISTUTILS_INSTALL_ARGS += " \
> +                     --with-xslt-config='pkg-config libxslt' \
> +                     --with-xml2-config='pkg-config libxml-2.0' \
> +"
> +
> +inherit pypi setuptools3
> +
> +# {standard input}: Assembler messages:
> +# {standard input}:1488805: Error: branch out of range
> +DEBUG_OPTIMIZATION_remove_mips = " -Og"
> +DEBUG_OPTIMIZATION_append_mips = " -O"
> +BUILD_OPTIMIZATION_remove_mips = " -Og"
> +BUILD_OPTIMIZATION_append_mips = " -O"
> +
> +DEBUG_OPTIMIZATION_remove_mipsel = " -Og"
> +DEBUG_OPTIMIZATION_append_mipsel = " -O"
> +BUILD_OPTIMIZATION_remove_mipsel = " -Og"
> +BUILD_OPTIMIZATION_append_mipsel = " -O"
> +
> +BBCLASSEXTEND = "native nativesdk"
> +
> +RDEPENDS_${PN} += "libxml2 libxslt ${PYTHON_PN}-compression"
> +
>   CLEANBROKEN = "1"
>
> 

--------------E4707966933BC2B7119C47E6
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/8/20 8:14 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200608121410.5814-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20200608121410.5814-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python-lxml.inc   | 50 -----------------
 .../python/python3-lxml_4.5.0.bb              | 53 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-
 2 files changed, 51 insertions(&#43;), 52 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-lxml.inc

diff --git a/meta-python/recipes-devtools/python/python-lxml.inc b/meta-python/recipes-devtools/python/python-lxml.inc
deleted file mode 100644
index 05b5eae46..000000000
--- a/meta-python/recipes-devtools/python/python-lxml.inc
&#43;&#43;&#43; /dev/null
@@ -1,50 &#43;0,0 @@
-SUMMARY = &quot;Powerful and Pythonic XML processing library combining libxml2/libxslt with the ElementTree API.&quot;
-DESCRIPTION = &quot;lxml is a Pythonic, mature binding for the libxml2 and \
-libxslt libraries. It provides safe and convenient access to these \
-libraries using the ElementTree API. It extends the ElementTree API \
-significantly to offer support for XPath, RelaxNG, XML Schema, XSLT, \
-C14N and much more.&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://codespeak.net/lxml">&quot;http://codespeak.net/lxml&quot;</a>
-SECTION = &quot;devel/python&quot;
-LICENSE = &quot;BSD &amp; GPLv2 &amp; MIT &amp; PSF&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403\-file://doc/licenses/elementtree.txt;md5=eb34d036a6e3d56314ee49a6852ac891\-file://doc/licenses/BSD.txt;md5=700a1fc17f4797d4f2d34970c8ee694b\-file://doc/licenses/GPL.txt;md5=94d55d512a9ba36caa9b7df079bae19f\-file://src/lxml/isoschematron/resources/rng/iso-schematron.rng;beginline=2;endline=7;md5=fc85684a8dd5fa272c086bceb0d99e10\-file://src/lxml/isoschematron/resources/xsl/iso-schematron-xslt1/iso_schematron_message.xsl;beginline=2;endline=24;md5=cc86b7b2bbc678e13f58ea403eb9929b\-file://src/lxml/isoschematron/resources/xsl/RNG2Schtrn.xsl;beginline=2;endline=7;md5=5b03236d293dc3784205542b409d2f53\-">&quot;file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
-                    file://doc/licenses/elementtree.txt;md5=eb34d036a6e3d56314ee49a6852ac891 \
-                    file://doc/licenses/BSD.txt;md5=700a1fc17f4797d4f2d34970c8ee694b \
-                    file://doc/licenses/GPL.txt;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://src/lxml/isoschematron/resources/rng/iso-schematron.rng;beginline=2;endline=7;md5=fc85684a8dd5fa272c086bceb0d99e10 \
-                    file://src/lxml/isoschematron/resources/xsl/iso-schematron-xslt1/iso_schematron_message.xsl;beginline=2;endline=24;md5=cc86b7b2bbc678e13f58ea403eb9929b \
-                    file://src/lxml/isoschematron/resources/xsl/RNG2Schtrn.xsl;beginline=2;endline=7;md5=5b03236d293dc3784205542b409d2f53 \
-                    &quot;</a>
-
-DEPENDS &#43;= &quot;libxml2 libxslt&quot;
-
-SRC_URI[md5sum] = &quot;f088e452ed45b030b6f84269f1e84d11&quot;
-SRC_URI[sha256sum] = &quot;8620ce80f50d023d414183bf90cc2576c2837b88e00bea3f33ad2630133bbb60&quot;
-
-DISTUTILS_BUILD_ARGS &#43;= &quot; \
-                     --with-xslt-config='pkg-config libxslt' \
-                     --with-xml2-config='pkg-config libxml-2.0' \
-&quot;
-
-DISTUTILS_INSTALL_ARGS &#43;= &quot; \
-                     --with-xslt-config='pkg-config libxslt' \
-                     --with-xml2-config='pkg-config libxml-2.0' \
-&quot;
-
-inherit pypi
-
-# {standard input}: Assembler messages:
-# {standard input}:1488805: Error: branch out of range
-DEBUG_OPTIMIZATION_remove_mips = &quot; -Og&quot;
-DEBUG_OPTIMIZATION_append_mips = &quot; -O&quot;
-BUILD_OPTIMIZATION_remove_mips = &quot; -Og&quot;
-BUILD_OPTIMIZATION_append_mips = &quot; -O&quot;
-
-DEBUG_OPTIMIZATION_remove_mipsel = &quot; -Og&quot;
-DEBUG_OPTIMIZATION_append_mipsel = &quot; -O&quot;
-BUILD_OPTIMIZATION_remove_mipsel = &quot; -Og&quot;
-BUILD_OPTIMIZATION_append_mipsel = &quot; -O&quot;
-
-BBCLASSEXTEND = &quot;native nativesdk&quot;
-
-RDEPENDS_${PN} &#43;= &quot;libxml2 libxslt ${PYTHON_PN}-compression<a class="moz-txt-link-rfc2396E" href="mailto:diff--gita/meta-python/recipes-devtools/python/python3-lxml_4.5.0.bbb/meta-python/recipes-devtools/python/python3-lxml_4.5.0.bbindexb95d7bae7..e3cfa46d1100644---a/meta-python/recipes-devtools/python/python3-lxml_4.5.0.bb&#43;&#43;&#43;b/meta-python/recipes-devtools/python/python3-lxml_4.5.0.bb@@-1,3&#43;1,52@@-inheritsetuptools3-requirepython-lxml.inc&#43;SUMMARY=">&quot;
diff --git a/meta-python/recipes-devtools/python/python3-lxml_4.5.0.bb b/meta-python/recipes-devtools/python/python3-lxml_4.5.0.bb
index b95d7bae7..e3cfa46d1 100644
--- a/meta-python/recipes-devtools/python/python3-lxml_4.5.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-lxml_4.5.0.bb
@@ -1,3 &#43;1,52 @@
-inherit setuptools3
-require python-lxml.inc
&#43;SUMMARY = &quot;</a>Powerful and Pythonic XML processing library combining libxml2/libxslt with the ElementTree API.&quot;
&#43;DESCRIPTION = &quot;lxml is a Pythonic, mature binding for the libxml2 and \
&#43;libxslt libraries. It provides safe and convenient access to these \
&#43;libraries using the ElementTree API. It extends the ElementTree API \
&#43;significantly to offer support for XPath, RelaxNG, XML Schema, XSLT, \
&#43;C14N and much more.&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://codespeak.net/lxml">&quot;http://codespeak.net/lxml&quot;</a>
&#43;SECTION = &quot;devel/python&quot;
&#43;LICENSE = &quot;BSD &amp; GPLv2 &amp; MIT &amp; PSF&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403\&#43;file://doc/licenses/elementtree.txt;md5=eb34d036a6e3d56314ee49a6852ac891\&#43;file://doc/licenses/BSD.txt;md5=700a1fc17f4797d4f2d34970c8ee694b\&#43;file://doc/licenses/GPL.txt;md5=94d55d512a9ba36caa9b7df079bae19f\&#43;file://src/lxml/isoschematron/resources/rng/iso-schematron.rng;beginline=2;endline=7;md5=fc85684a8dd5fa272c086bceb0d99e10\&#43;file://src/lxml/isoschematron/resources/xsl/iso-schematron-xslt1/iso_schematron_message.xsl;beginline=2;endline=24;md5=cc86b7b2bbc678e13f58ea403eb9929b\&#43;file://src/lxml/isoschematron/resources/xsl/RNG2Schtrn.xsl;beginline=2;endline=7;md5=5b03236d293dc3784205542b409d2f53\&#43;">&quot;file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
&#43;                    file://doc/licenses/elementtree.txt;md5=eb34d036a6e3d56314ee49a6852ac891 \
&#43;                    file://doc/licenses/BSD.txt;md5=700a1fc17f4797d4f2d34970c8ee694b \
&#43;                    file://doc/licenses/GPL.txt;md5=94d55d512a9ba36caa9b7df079bae19f \
&#43;                    file://src/lxml/isoschematron/resources/rng/iso-schematron.rng;beginline=2;endline=7;md5=fc85684a8dd5fa272c086bceb0d99e10 \
&#43;                    file://src/lxml/isoschematron/resources/xsl/iso-schematron-xslt1/iso_schematron_message.xsl;beginline=2;endline=24;md5=cc86b7b2bbc678e13f58ea403eb9929b \
&#43;                    file://src/lxml/isoschematron/resources/xsl/RNG2Schtrn.xsl;beginline=2;endline=7;md5=5b03236d293dc3784205542b409d2f53 \
&#43;                    &quot;</a>
&#43;
&#43;DEPENDS &#43;= &quot;libxml2 libxslt&quot;
&#43;
&#43;SRC_URI[md5sum] = &quot;f088e452ed45b030b6f84269f1e84d11&quot;
&#43;SRC_URI[sha256sum] = &quot;8620ce80f50d023d414183bf90cc2576c2837b88e00bea3f33ad2630133bbb60&quot;
&#43;
&#43;DISTUTILS_BUILD_ARGS &#43;= &quot; \
&#43;                     --with-xslt-config='pkg-config libxslt' \
&#43;                     --with-xml2-config='pkg-config libxml-2.0' \
&#43;&quot;
&#43;
&#43;DISTUTILS_INSTALL_ARGS &#43;= &quot; \
&#43;                     --with-xslt-config='pkg-config libxslt' \
&#43;                     --with-xml2-config='pkg-config libxml-2.0' \
&#43;&quot;
&#43;
&#43;inherit pypi setuptools3
&#43;
&#43;# {standard input}: Assembler messages:
&#43;# {standard input}:1488805: Error: branch out of range
&#43;DEBUG_OPTIMIZATION_remove_mips = &quot; -Og&quot;
&#43;DEBUG_OPTIMIZATION_append_mips = &quot; -O&quot;
&#43;BUILD_OPTIMIZATION_remove_mips = &quot; -Og&quot;
&#43;BUILD_OPTIMIZATION_append_mips = &quot; -O&quot;
&#43;
&#43;DEBUG_OPTIMIZATION_remove_mipsel = &quot; -Og&quot;
&#43;DEBUG_OPTIMIZATION_append_mipsel = &quot; -O&quot;
&#43;BUILD_OPTIMIZATION_remove_mipsel = &quot; -Og&quot;
&#43;BUILD_OPTIMIZATION_append_mipsel = &quot; -O&quot;
&#43;
&#43;BBCLASSEXTEND = &quot;native nativesdk&quot;
&#43;
&#43;RDEPENDS_${PN} &#43;= &quot;libxml2 libxslt ${PYTHON_PN}-compression&quot;
&#43;
 CLEANBROKEN = &quot;1&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------E4707966933BC2B7119C47E6--

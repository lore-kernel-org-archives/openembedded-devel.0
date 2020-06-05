Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.87])
 by mx.groups.io with SMTP id smtpd.web12.194.1591377955923532049
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Jun 2020 10:25:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Oq6g1WpZ;
 spf=pass (domain: windriver.com, ip: 40.107.220.87, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fuFTyUp3NWi2PPTYThpsInrz7dfhMM5YjQZndoOtZephFK6wif6S9433zL92jBPANIC5p18VlPPCJDMfDRtR4psDsr/IEdxkMq0Y+6LRa+ZdMCSizXrco3Jl/UlDeJ0Y4VurLXyJGWshy6ztxuwk8Vc+iXfsPXuCuCH/ZvwAEo40GH2ZLYcMw1+mga7cn57Ui4gvLdgbps/1cpSlZEutSqgPgWVRaI10gUrOTNcBXykcS1EHlcE1jrCoOABKtPy11jp+ouvtvRiJflk8booWkGacckYNQP6rberXLPc/aSBPKZYyffvmeIQC6/7bb+klbP+XWpyYx4vAq3AphyVZ8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B8Uu258WyiHfEWmUblGvvPqy4bUYkTFPGXRXgkKgdcE=;
 b=EqdDw5aSx8tVu/i3NJ5es7ksYECXI0lH9RZ48vUAd2jG1lBwPO87N3vLEsTStim0OXZkfd/ZDQ749KOtTsP+9L6FTgiCMX4fABcZfaO/cEM/TPCpp0B7+oHNJUP+DCHeT5MRh9G31hL8sr0jW5SOFZvki0knCkTaG5yPJNEfgMeOU5XB4IpPeHiyjkZ5LTEwW5ErIxnj4zPqiR/X4+sBUHywe3B1U+vlTz3MFCuGErUWeUOm/g3sLlXtw4BMCOLcJXu7kaDbaMtEanY5L/BkNIqP4UM1bo9c6KFZJRvBu0aClAm/ZYE8z7edFugKqFtH40o5ykxfgg3v8n0MUU5fgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B8Uu258WyiHfEWmUblGvvPqy4bUYkTFPGXRXgkKgdcE=;
 b=Oq6g1WpZaYv/UiMr1kPdhxqxKKGnldMS3ThqGA6zyAlNeAbzVSy0xzQkG/Qw9EMu26IN06+J2Bt4nvtgIzqfsjYNkgKZ9Z77xC5/Cl3FLXMMxLdrZhSegygqdBmxIdObke3Mz9ANoDXbvdytZbgOYUIR4xeD2GHSGaceVWCFFbA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1874.namprd11.prod.outlook.com (2603:10b6:404:107::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.19; Fri, 5 Jun
 2020 17:25:54 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3066.019; Fri, 5 Jun 2020
 17:25:54 +0000
Subject: Re: [oe] [meta-python][PATCH 1/6] python3-dateutil: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200604121223.3818-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <8be3a083-3def-5470-38e4-33c071b895a8@windriver.com>
Date: Fri, 5 Jun 2020 13:25:52 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200604121223.3818-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTOPR0101CA0012.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::25) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTOPR0101CA0012.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend Transport; Fri, 5 Jun 2020 17:25:53 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eca22169-2ee7-41a6-1738-08d80975801d
X-MS-TrafficTypeDiagnostic: BN6PR11MB1874:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB1874468A75E5338C22F864529F860@BN6PR11MB1874.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1265;
X-Forefront-PRVS: 0425A67DEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	V/4YrUBUljbBzMtBMA0eoGyOLTodoa7g8wdfvTVMKPN/y8TMugfBTuP3Hk/3iqAGQsyeUXNPlZmObI04KfCzLBaUAEGDqNfjbgVMocS346SHOvJj0zQUiJWnF9rn1F4Tq00mNsG5V5QZBdIHzZ3YdZyVwcubUBafWhCt0263GLqNezdtGyagLyPBvLjPQg6vMY+OOunzhf7SAIpkjFDOKdRKf+xwi+zT5oZmRkwOFW5z5XP7kCriPZIctpXnPtqDXqeVtaf2ELQuDxz0y7LKgxhgldVAOE1ynNVOc+EJP88RbdvzLX8BCB/j8zYMSMEFqgsFr0kus8ndyI4s1NaxZ2jhHF9aORSeWmB9crNB13Ps6h7xNJSoGiuKmQw1fGgqNkPraMipJZ/HUpWFDWvtKOPtr12wxNVhSE9TWrIRZ5i96wSLSN4ktuuZM+YJn1VrIb3fggscCvLxKYv3jY9NhQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(366004)(376002)(136003)(396003)(39850400004)(2616005)(66476007)(186003)(66946007)(86362001)(16526019)(316002)(16576012)(8936002)(26005)(52116002)(44832011)(6486002)(53546011)(33964004)(956004)(31686004)(8676002)(31696002)(36756003)(2906002)(66556008)(966005)(166002)(83380400001)(5660300002)(478600001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	2c/r0rCbti8QaMoVidbdg2gTQah2g6pJGgFEpwIubjwe1jSYJBx+F3a+OGL6ywSExb0pOWR/jgqKnI22/gOp1MxYzk2X+hV2JbIl8LF9IaP6rZmOSI4LhYdSbdr6fN00o6pudUM3HoI+Pp00sZI+sEwKs9Y8KyFIDXLNBOsOH0M4J1EvvhG678ROKbB9zzjBocy+L2iAiEU2jmiesTkb3K/a/IlMP5wzjeCYt1A445kess+sWfYb4TKPhZ5N5h/giClEGsVQifmR10io/CrICY8wt+2MbCL6l6AqNPouoKxBvvvlbn5ewjYiQ/9lYo7UCOYdPgbOw12db9ShGrh0VPSx7zUlwGivpRb36zX+yalhLF6OBkHkWU+s81ra6Lz6xqWgbYpio+/4JiGayA8Npi1FbyiEBx5WLKTbFPQohQqWAU0ymRTQqkMqgMmxG3/9RYXJyWAP4GEshMF4UTHkyny8FO5Wv71WY8TY5WWcpZc=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eca22169-2ee7-41a6-1738-08d80975801d
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2020 17:25:54.0687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UGIRv5GIlSOFxf76/1IMVjna91dqktzCdaiLtLI3AlstRdrxZuDjPg4M+8nWo1ev6T+s6hu5xqlfwFpDTHxlCmU+iQEfJqNS0PiVpXLlJko=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1874
Content-Type: multipart/alternative;
 boundary="------------D412C319F57E566FD4372DA6"
Content-Language: en-US

--------------D412C319F57E566FD4372DA6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/4/20 8:12 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python-dateutil.inc                | 25 -----------------
>   .../python/python3-dateutil_2.8.1.bb          | 27 +++++++++++++++++--
>   2 files changed, 25 insertions(+), 27 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-dateutil.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-dateutil.inc b/meta-python/recipes-devtools/python/python-dateutil.inc
> deleted file mode 100644
> index e70e963e9..000000000
> --- a/meta-python/recipes-devtools/python/python-dateutil.inc
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -SUMMARY = "Extensions to the standard Python datetime module"
> -DESCRIPTION = "The dateutil module provides powerful extensions to the datetime module available in the Python standard library."
> -HOMEPAGE = "https://dateutil.readthedocs.org"
> -LICENSE = "BSD-3-Clause & Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=e3155c7bdc71f66e02678411d2abf996"
> -
> -SRC_URI[md5sum] = "f2a1d4b680b297b367a974664ca3a4f6"
> -SRC_URI[sha256sum] = "73ebfe9dbf22e832286dafa60473e4cd239f8592f699aa5adaf10050e6e1823c"
> -
> -PYPI_PACKAGE = "python-dateutil"
> -inherit pypi
> -
> -PACKAGES =+ "${PN}-zoneinfo"
> -FILES_${PN}-zoneinfo = "${libdir}/${PYTHON_DIR}/site-packages/dateutil/zoneinfo"
> -
> -DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
> -
> -RDEPENDS_${PN} = "\
> -    ${PYTHON_PN}-datetime \
> -    ${PYTHON_PN}-numbers \
> -    ${PYTHON_PN}-six \
> -    ${PYTHON_PN}-stringold \
> -"
> -
> -BBCLASSEXTEND = "native"
> diff --git a/meta-python/recipes-devtools/python/python3-dateutil_2.8.1.bb b/meta-python/recipes-devtools/python/python3-dateutil_2.8.1.bb
> index 1d2baf55c..fb7db162c 100644
> --- a/meta-python/recipes-devtools/python/python3-dateutil_2.8.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-dateutil_2.8.1.bb
> @@ -1,2 +1,25 @@
> -inherit setuptools3
> -require python-dateutil.inc
> +SUMMARY = "Extensions to the standard Python datetime module"
> +DESCRIPTION = "The dateutil module provides powerful extensions to the datetime module available in the Python standard library."
> +HOMEPAGE = "https://dateutil.readthedocs.org"
> +LICENSE = "BSD-3-Clause & Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=e3155c7bdc71f66e02678411d2abf996"
> +
> +SRC_URI[md5sum] = "f2a1d4b680b297b367a974664ca3a4f6"
> +SRC_URI[sha256sum] = "73ebfe9dbf22e832286dafa60473e4cd239f8592f699aa5adaf10050e6e1823c"
> +
> +PYPI_PACKAGE = "python-dateutil"
> +inherit pypi setuptools3
> +
> +PACKAGES =+ "${PN}-zoneinfo"
> +FILES_${PN}-zoneinfo = "${libdir}/${PYTHON_DIR}/site-packages/dateutil/zoneinfo"
> +
> +DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
> +
> +RDEPENDS_${PN} = "\
> +    ${PYTHON_PN}-datetime \
> +    ${PYTHON_PN}-numbers \
> +    ${PYTHON_PN}-six \
> +    ${PYTHON_PN}-stringold \
> +"
> +
> +BBCLASSEXTEND = "native"
>
> 

--------------D412C319F57E566FD4372DA6
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/4/20 8:12 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200604121223.3818-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200604121223.3818-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python-dateutil.inc                | 25 -----------------
 .../python/python3-dateutil_2.8.1.bb          | 27 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;--
 2 files changed, 25 insertions(&#43;), 27 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-dateutil.inc

diff --git a/meta-python/recipes-devtools/python/python-dateutil.inc b/meta-python/recipes-devtools/python/python-dateutil.inc
deleted file mode 100644
index e70e963e9..000000000
--- a/meta-python/recipes-devtools/python/python-dateutil.inc
&#43;&#43;&#43; /dev/null
@@ -1,25 &#43;0,0 @@
-SUMMARY = &quot;Extensions to the standard Python datetime module&quot;
-DESCRIPTION = &quot;The dateutil module provides powerful extensions to the datetime module available in the Python standard library.&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://dateutil.readthedocs.org">&quot;https://dateutil.readthedocs.org&quot;</a>
-LICENSE = &quot;BSD-3-Clause &amp; Apache-2.0&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=e3155c7bdc71f66e02678411d2abf996">&quot;file://LICENSE;md5=e3155c7bdc71f66e02678411d2abf996&quot;</a>
-
-SRC_URI[md5sum] = &quot;f2a1d4b680b297b367a974664ca3a4f6&quot;
-SRC_URI[sha256sum] = &quot;73ebfe9dbf22e832286dafa60473e4cd239f8592f699aa5adaf10050e6e1823c&quot;
-
-PYPI_PACKAGE = &quot;python-dateutil&quot;
-inherit pypi
-
-PACKAGES =&#43; &quot;${PN}-zoneinfo&quot;
-FILES_${PN}-zoneinfo = &quot;${libdir}/${PYTHON_DIR}/site-packages/dateutil/zoneinfo&quot;
-
-DEPENDS &#43;= &quot;${PYTHON_PN}-setuptools-scm-native&quot;
-
-RDEPENDS_${PN} = &quot;\
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-numbers \
-    ${PYTHON_PN}-six \
-    ${PYTHON_PN}-stringold \
-&quot;
-
-BBCLASSEXTEND = &quot;native<a class="moz-txt-link-rfc2396E" href="mailto:diff--gita/meta-python/recipes-devtools/python/python3-dateutil_2.8.1.bbb/meta-python/recipes-devtools/python/python3-dateutil_2.8.1.bbindex1d2baf55c..fb7db162c100644---a/meta-python/recipes-devtools/python/python3-dateutil_2.8.1.bb&#43;&#43;&#43;b/meta-python/recipes-devtools/python/python3-dateutil_2.8.1.bb@@-1,2&#43;1,25@@-inheritsetuptools3-requirepython-dateutil.inc&#43;SUMMARY=">&quot;
diff --git a/meta-python/recipes-devtools/python/python3-dateutil_2.8.1.bb b/meta-python/recipes-devtools/python/python3-dateutil_2.8.1.bb
index 1d2baf55c..fb7db162c 100644
--- a/meta-python/recipes-devtools/python/python3-dateutil_2.8.1.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-dateutil_2.8.1.bb
@@ -1,2 &#43;1,25 @@
-inherit setuptools3
-require python-dateutil.inc
&#43;SUMMARY = &quot;</a>Extensions to the standard Python datetime module&quot;
&#43;DESCRIPTION = &quot;The dateutil module provides powerful extensions to the datetime module available in the Python standard library.&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://dateutil.readthedocs.org">&quot;https://dateutil.readthedocs.org&quot;</a>
&#43;LICENSE = &quot;BSD-3-Clause &amp; Apache-2.0&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=e3155c7bdc71f66e02678411d2abf996">&quot;file://LICENSE;md5=e3155c7bdc71f66e02678411d2abf996&quot;</a>
&#43;
&#43;SRC_URI[md5sum] = &quot;f2a1d4b680b297b367a974664ca3a4f6&quot;
&#43;SRC_URI[sha256sum] = &quot;73ebfe9dbf22e832286dafa60473e4cd239f8592f699aa5adaf10050e6e1823c&quot;
&#43;
&#43;PYPI_PACKAGE = &quot;python-dateutil&quot;
&#43;inherit pypi setuptools3
&#43;
&#43;PACKAGES =&#43; &quot;${PN}-zoneinfo&quot;
&#43;FILES_${PN}-zoneinfo = &quot;${libdir}/${PYTHON_DIR}/site-packages/dateutil/zoneinfo&quot;
&#43;
&#43;DEPENDS &#43;= &quot;${PYTHON_PN}-setuptools-scm-native&quot;
&#43;
&#43;RDEPENDS_${PN} = &quot;\
&#43;    ${PYTHON_PN}-datetime \
&#43;    ${PYTHON_PN}-numbers \
&#43;    ${PYTHON_PN}-six \
&#43;    ${PYTHON_PN}-stringold \
&#43;&quot;
&#43;
&#43;BBCLASSEXTEND = &quot;native&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------D412C319F57E566FD4372DA6--

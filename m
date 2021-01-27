Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.40])
 by mx.groups.io with SMTP id smtpd.web12.8788.1611760130693876909
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jan 2021 07:08:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=OYQWNt94;
 spf=pass (domain: windriver.com, ip: 40.107.243.40, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iIC8UiGtfbPt1Ve9SRKOz3ML/9OIB5VjjDLrvI2jZmsCijfYgTCJ4vilkPJGQto4/PRh1K4qqX/KvYWrMVjSOgcwww8z84mL+et70aQUcXEa5PFLPTIdplgTR4Wk2BeqVrPeyc5AcIgVAeGa2NHo32Puxr1F7zdZwniXZ83QSW+1/FeoZA7N4b4btkqfAytdNZY1Rix6JimvDxVwh/PuZyD1XVr72GxEsZ2Eq7AAHm4noi8CNSm+uykq1cJ9m/3sibglm04tggwpsMiwJ+iqWtC7Q5h54APRvAveodDNxq7CJsX2BZ1wc6hOLgmvJFSrrxkmsjZV51sJ2BUJH5T2wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xa34nmeu2rt/jsGM1VBDBw3rTlPjWXTWNVXATmcY7LU=;
 b=CUdg7embR4ZwXnZujAf/R6Rf7mxok5z68GYjxpz3HoKyjuTMzRoZbJF9fj0EKpjcshDdKxIFdgGOvU6mih6TDy8E04DrwI6pje2OhAXO0Cy6YDRjj2lrlyNkY++r2m3HRZtxb74uPYSzF9ErksBYS8Q8Y36GCevD3+l0z3yGhUxZJhPfakw1ZsclYsl7xvYYOlqGCg4fij4jCo9SxwfolwmUR/ljb6NtWb0dEIXh8EsGFYV7o8v1wXsXfoe9qQLEGEvsxJiIRggt5nCURfHm+yO4esvQ76RrX2gCB1jdu7qMh1G7voBhNRuVQAoESVnBh7ur4tJ0atgzqtL+5YgmwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xa34nmeu2rt/jsGM1VBDBw3rTlPjWXTWNVXATmcY7LU=;
 b=OYQWNt94QK+PWXgiF5p508aaSOB9PQ7vt2fX3xmFs5Wggnt9hRGLgoTYhM00r7eewa7IcMrhAOu7QCkGgyBhF5VN2/FhqKs8a1LboVIt0jiA+kMJXaPOcFBPk6mVAU1hm3EjsV2rFHZchi8sMxC9gf+QATCw64EZkHyImt6w9y4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3478.namprd11.prod.outlook.com (2603:10b6:a03:7b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Wed, 27 Jan
 2021 15:08:48 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3805.017; Wed, 27 Jan 2021
 15:08:48 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-xmlschema: Yocto recipes for validating against XSD 1.1
To: Junjie Mao <junjie.mao@intel.com>,
 openembedded-devel@lists.openembedded.org
References: <1611558046-30976-1-git-send-email-junjie.mao@intel.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <f643ab1a-318c-9989-e13c-34e64b8c2192@windriver.com>
Date: Wed, 27 Jan 2021 10:08:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <1611558046-30976-1-git-send-email-junjie.mao@intel.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL0PR02CA0130.namprd02.prod.outlook.com
 (2603:10b6:208:35::35) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL0PR02CA0130.namprd02.prod.outlook.com (2603:10b6:208:35::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17 via Frontend Transport; Wed, 27 Jan 2021 15:08:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a646f1b0-5d94-4f7d-b31c-08d8c2d57259
X-MS-TrafficTypeDiagnostic: BYAPR11MB3478:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB34784D2E19E5CFB33911007D9FBB9@BYAPR11MB3478.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uPPFE70SfJJnACCrG/fCheLAUNHMP61hjCpjK0DtWNAsvVnqDE+p/Uo2y8OrUCDyTnUiPe9Yfoyfkvig1fgzvaEjEgrdX65Tz/dtZN2WSu4PkzHxEfPMYspE43lWUQTl25WRFNWL1vIMNyEc2TWJ9oagQAN+CW7HwLLYczw3R1AEi+VC+KHAySn+iRhq+cC2SHpOd8TJ69PwpqwB/BJiSJlp8edlsPzWd+fEV2zG0BqUCXh0pz32hfG4bVHlc5mgKDjg04wPj9b5DnPSAhAzGA9AtT2Nfo+NsF2dOzabc6lIkcA2dYWXDFS4rtIx3EWtfa1bspyon0WRYx0MCQhLLdb3aojNwPusvfHMbenvHSPU+dsUpc4kK40K35NhDhuqRSKhJT4q0sGqlRvAY4og/3aqML0KTB/b498hb2q5PYE6G17d/qWQBdAAvKAJmZzjrQcOloeBv5BLYBgF+CezTAhwdfaghrmhKOa7WK5VLHfHiL3bn3it84ni6Qo0P9xqJG1JOekuNoPmSnhU5aaizwrUKSQuZRORew7b3pExwkI6Tq7i6j63d+awjMufoF9Aaq0IE+0+GH0Dcmsyom2USJ2CTaiiM+72M6OdaE9zPW/zMpFTOTfKNeg1eLT8LU0PQflkMVNM6cT9AAH8QVa2CpVoVKUjox4PrLLgH/dElZQFtmkE/dfDRcnRs3Djy3wb
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(346002)(136003)(376002)(396003)(5660300002)(31686004)(6486002)(2906002)(8676002)(66476007)(33964004)(2616005)(966005)(36756003)(166002)(86362001)(8936002)(66946007)(478600001)(83380400001)(66556008)(316002)(16576012)(31696002)(6666004)(26005)(186003)(956004)(16526019)(44832011)(53546011)(52116002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?ZkZSeXpuaHc3Z2Q0enpVNzRWRUNEaWQxaVNwOXFMN08zeVowL1NHTTFTdVZ1?=
 =?utf-8?B?MUV3Wkc4c2JxM1ZaSG9KSWd1WGUxbXF4MzVGTFMxODlSQkZJdklJbmp5d0dH?=
 =?utf-8?B?YmFiQklRNTVoTDFGeVI4UHhiWTBudWszVmt6cWNvb0NzYXhXVWJCUXB6L3E4?=
 =?utf-8?B?RWpHVnhOMUFSVG44b2xNVnFZb1YvREZIOXN4cWFoakZwdUtCOTkxeGYzMkVP?=
 =?utf-8?B?SHFxNVdsMXQweVVnZU1VTnZaOEluSWJOVXhCWjhEcGQ2Wk04TklVSzVJUkpF?=
 =?utf-8?B?QnprVDk3bCtWR0daMVNDUkdyQ2xvMWxwdkl2QUxIVFFHYVNXTTZMcS9LSXc0?=
 =?utf-8?B?UFpiSUk1WmZVN3ZEN3JueC9TZmk2Y3BrNk56aVF4aUttVkFDS2ZpcEM1eGhY?=
 =?utf-8?B?S01YTkE1ZWdJNUF1bkdXdTc0QVFKb1ZrU0dFTzFHTW1IVEFsMis5dmVvNGVy?=
 =?utf-8?B?ZFdMS1QyUEplaXBPQlZNSlYvRXh6Tjk0WlM5cEIvMWMya25sbFpRSzhsV0h4?=
 =?utf-8?B?dkNGd0h0Slg1eHpPSld5aFVTNlVIZ2h0L2R0U0dKWldBV3VMcit2NEJQdGhv?=
 =?utf-8?B?SEY5OWV4SWUwVERXVENmbGY0akY1OXRndjJnM0tvLzZScFVoN1JRK01oYVVi?=
 =?utf-8?B?QWNsSWthamdTSDJzRzl3K0pIK3dNVEY2L2p6UytCNUk4SXBsYWlSaFlEL21C?=
 =?utf-8?B?a0lRZ01TVFlyczlUbjFsSUlaTkRpckNqN2xRUjQwd0ZvUll1eTZsb3dIelNm?=
 =?utf-8?B?eWp0YXErYmVSejhiUkR5TXcrKzJuc2hJdThSdHpKc0dNcGxZbE9oTkdpaXhr?=
 =?utf-8?B?dDN5cXFLamdvcC9sKzNKUGEwYlAwZ0wrQnRFaGZhZjhFR3Y1R2hYYUMzUlJY?=
 =?utf-8?B?Zzdickx1cDFJQVRLWmNWTklFVlNVd3I2QytPb3ByaFZ3bHlHZHVJM1FaTEd1?=
 =?utf-8?B?eWJnSnE5Y24xa3VmTnFRaFA3OXN3SEl0bVF3aG9FSlg4RldLdkJZSnE2NTlu?=
 =?utf-8?B?Y1JEM3U3elNuTmJmSzFvV0NGOW8ySW5ONnVlRUcxREhaUFFZekRiQnpEQ0pE?=
 =?utf-8?B?UTI5N3hIcEFGK0FIWjQweXVadmdEODlSL2s2L2U5WjY0NHZBZVBCbllQR3pO?=
 =?utf-8?B?REdSdWVKWTVmWjJSTXdhQjcrVUZUb2NPek1WTlhBQy9sYkdUeXpNN1RzcWRh?=
 =?utf-8?B?ZW9jQ1FkWVN0S3J5SlJURGx5WmJ5ays4V0dFQW1NdHV2SFk1Uk8rdjFwSnVT?=
 =?utf-8?B?S2JKVHF4SnZhd3NERGxJMjZuMGZkWG1UWktQQU9XQ1FmQlVMVWJrMjBKNDhL?=
 =?utf-8?B?L0dkbUI0SnVjWWh6VHFVUzUyWldFVElSeDk4NWNzdGgzRE5Tby9rZktzbFRY?=
 =?utf-8?B?eXg1RUpLcHQvRi9rSEZiVXo2OEdqYzJYS0N1cHVFRzlyNmZtTXhwVFF3YVVI?=
 =?utf-8?B?eEFoZ2FtZVgrZEh1dlhGczZVVUcvR0Vmcy9tK3ZBPT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a646f1b0-5d94-4f7d-b31c-08d8c2d57259
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2021 15:08:48.2104
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oLiaZ1MeT/wtxAETDVyWURnx8pya/Ru0syADd+7CpGeJdxR4t1i9yq3SLpv4twkXLt01lADD+cDP6bRr9hr9RdhLwrSsskBkFuM5RbjfMOQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3478
Content-Type: multipart/alternative;
 boundary="------------66BC751EB089406A7D1959BA"
Content-Language: en-US

--------------66BC751EB089406A7D1959BA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-25 2:00 a.m., Junjie Mao wrote:
> Signed-off-by: Junjie Mao <junjie.mao@intel.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-elementpath_2.1.2.bb              | 12 ++++++++++++
>   .../python/python3-xmlschema_1.4.1.bb                | 20 ++++++++++++++++++++
>   2 files changed, 32 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-elementpath_2.1.2.bb
>   create mode 100644 meta-python/recipes-devtools/python/python3-xmlschema_1.4.1.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-elementpath_2.1.2.bb b/meta-python/recipes-devtools/python/python3-elementpath_2.1.2.bb
> new file mode 100644
> index 0000000..f47f152
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-elementpath_2.1.2.bb
> @@ -0,0 +1,12 @@
> +DESCRIPTION = "Provide XPath 1.0 and 2.0 selectors for Python's ElementTree XML data structures, both for the standard ElementTree library and for the lxml.etree library."
> +HOMEPAGE = "https://github.com/sissaschool/elementpath"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=5dbb7fb7d72da3921202dd7b995d3ecf"
> +
> +SRC_URI[md5sum] = "887f60e9c4fb9b0804a38372b2798101"
> +SRC_URI[sha256sum] = "23e1fed8d196d9a6cc4d220ef11fbe7eb8cff3a27848621c447e9d96134b2085"
> +
> +PYPI_PACKAGE = "elementpath"
> +inherit pypi setuptools3
> +
> +BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python3-xmlschema_1.4.1.bb b/meta-python/recipes-devtools/python/python3-xmlschema_1.4.1.bb
> new file mode 100644
> index 0000000..c609931
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-xmlschema_1.4.1.bb
> @@ -0,0 +1,20 @@
> +SUMMARY = "The xmlschema library is an implementation of XML Schema for Python (supports Python 3.6+)."
> +HOMEPAGE = "https://github.com/sissaschool/xmlschema"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=47489cb18c469474afeb259ed1d4832f"
> +
> +SRC_URI[md5sum] = "f4c46f8c4415a0ca31dc2f623b668664"
> +SRC_URI[sha256sum] = "ade693114ff2e4a9ed5a2371ce29ae888f689bc58e326e5796f8a7dc8954dd4a"
> +
> +PYPI_PACKAGE = "xmlschema"
> +inherit pypi setuptools3
> +
> +DEPENDS += "\
> +    ${PYTHON_PN}-elementpath \
> +"
> +
> +RDEPENDS_${PN} += "\
> +    ${PYTHON_PN}-elementpath \
> +"
> +
> +BBCLASSEXTEND = "native nativesdk"
>
> 
>

--------------66BC751EB089406A7D1959BA
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-25 2:00 a.m., Junjie Mao
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1611558046-30976-1-git-send-email-junjie.mao@intel.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Junjie Mao <a class="moz-txt-link-rfc2396E" href="mailto:junjie.mao@intel.com">&lt;junjie.mao@intel.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:1611558046-30976-1-git-send-email-junjie.mao@intel.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-elementpath_2.1.2.bb              | 12 ++++++++++++
 .../python/python3-xmlschema_1.4.1.bb                | 20 ++++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-elementpath_2.1.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-xmlschema_1.4.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-elementpath_2.1.2.bb b/meta-python/recipes-devtools/python/python3-elementpath_2.1.2.bb
new file mode 100644
index 0000000..f47f152
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-elementpath_2.1.2.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = &quot;Provide XPath 1.0 and 2.0 selectors for Python's ElementTree XML data structures, both for the standard ElementTree library and for the lxml.etree library.&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/sissaschool/elementpath">&quot;https://github.com/sissaschool/elementpath&quot;</a>
+LICENSE = &quot;MIT&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=5dbb7fb7d72da3921202dd7b995d3ecf">&quot;file://LICENSE;md5=5dbb7fb7d72da3921202dd7b995d3ecf&quot;</a>
+
+SRC_URI[md5sum] = &quot;887f60e9c4fb9b0804a38372b2798101&quot;
+SRC_URI[sha256sum] = &quot;23e1fed8d196d9a6cc4d220ef11fbe7eb8cff3a27848621c447e9d96134b2085&quot;
+
+PYPI_PACKAGE = &quot;elementpath&quot;
+inherit pypi setuptools3
+
+BBCLASSEXTEND = &quot;native nativesdk&quot;
diff --git a/meta-python/recipes-devtools/python/python3-xmlschema_1.4.1.bb b/meta-python/recipes-devtools/python/python3-xmlschema_1.4.1.bb
new file mode 100644
index 0000000..c609931
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-xmlschema_1.4.1.bb
@@ -0,0 +1,20 @@
+SUMMARY = &quot;The xmlschema library is an implementation of XML Schema for Python (supports Python 3.6+).&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/sissaschool/xmlschema">&quot;https://github.com/sissaschool/xmlschema&quot;</a>
+LICENSE = &quot;MIT&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=47489cb18c469474afeb259ed1d4832f">&quot;file://LICENSE;md5=47489cb18c469474afeb259ed1d4832f&quot;</a>
+
+SRC_URI[md5sum] = &quot;f4c46f8c4415a0ca31dc2f623b668664&quot;
+SRC_URI[sha256sum] = &quot;ade693114ff2e4a9ed5a2371ce29ae888f689bc58e326e5796f8a7dc8954dd4a&quot;
+
+PYPI_PACKAGE = &quot;xmlschema&quot;
+inherit pypi setuptools3
+
+DEPENDS += &quot;\
+    ${PYTHON_PN}-elementpath \
+&quot;
+
+RDEPENDS_${PN} += &quot;\
+    ${PYTHON_PN}-elementpath \
+&quot;
+
+BBCLASSEXTEND = &quot;native nativesdk&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------66BC751EB089406A7D1959BA--

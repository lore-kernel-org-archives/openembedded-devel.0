Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.82])
 by mx.groups.io with SMTP id smtpd.web10.8345.1612533655903743466
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Feb 2021 06:00:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=NnrKtdk6;
 spf=pass (domain: windriver.com, ip: 40.107.75.82, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cLU6WYqnSWyMzTE+iFlzl/vJm3YZO7XH8RHY1qoTsfdAuqUsEIz53nr7+ICYXzYkL84u/MjiGt0sLDpFaC+5SPo+PfzHJkCpo0HwSTZSh+kAILdaBZQYCdBbpJXbJO3TrYsyWixLf8rSCxgpLVLe+WKUpWJwu69Cv00wSykhYkcL3PE3eieqpNRiPDwxhLVW6dHU2cpzvXNZNJmQXSakn/pbZR7Lng6oZb1NnEp0TU+ugG7VZH1v8W+F+4g+z/x1909LNfp+p3ACpfKUeb5k3nrysxW90NqxR3rsczhEGd3HC5y24LR/SpYXktbe7QS6cm/O4J0sqMu4oVnUGcRsOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0PsM9GbhnDdY1gpFLNCAZShqeHNyeulUkjQCJOT0uE0=;
 b=Qkdq/sl3zr8l7codA4bMlDpEP1pLjyb85qX5tjAqiN0gGZ9BujKrSR8hwWQAg4GMkRDTb2RkBVGbLyeOBRDF/xy6oFa8X3NSsTe3+DpVbXxhXjweV3pOO3OlrNS4ou5yqreNaxacx+ku1eMQ2VCCAWx8M+JMMNwboxyz4CP69BXYu4C6a+vbRpewDVdY09tvPzvtDdsgFs/rpbYs8nNNaFJe3Cf8HohoqHtFDQ+++LQiAIyWpaJ099X1jgMh28VqZpZv5DwWv9Ism4top+jwoiwmLSKGLcTWnclZ/eLhwDFgB6gCtzEMxkDnVJoWNtzmeS1cBBEDds0VqdB2Ors24g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0PsM9GbhnDdY1gpFLNCAZShqeHNyeulUkjQCJOT0uE0=;
 b=NnrKtdk6J27ITudqzrqoUP3XUm16+88Lz+XhL41UaEPZ3+dhwznUTMw895138yyqg6glSmJbiXmrfadVq3cAxN2YuiOMzyhqhI7BhHlc74Ow7lAO174aK4H3a16nwyFfDGY6MFit7hBBVstrCi7r2LWvmgxN4T5R1Z1UWJS8O7o=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB3894.namprd11.prod.outlook.com (2603:10b6:a03:18c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.23; Fri, 5 Feb
 2021 14:00:54 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3825.020; Fri, 5 Feb 2021
 14:00:54 +0000
Subject: Re: [oe] [meta-python][PATCH 2/5] python3-pywbem: Upgrade 1.1.0 -> 1.1.3
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210202112636.30651-1-leon.anavi@konsulko.com>
 <20210202112636.30651-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <49e3ca59-ea21-5c9c-6c3f-784a44f39dd0@windriver.com>
Date: Fri, 5 Feb 2021 09:00:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210202112636.30651-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN6PR11CA0037.namprd11.prod.outlook.com
 (2603:10b6:404:4b::23) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN6PR11CA0037.namprd11.prod.outlook.com (2603:10b6:404:4b::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17 via Frontend Transport; Fri, 5 Feb 2021 14:00:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02d55ed2-11b2-473b-65cb-08d8c9de7441
X-MS-TrafficTypeDiagnostic: BY5PR11MB3894:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB389489C1B11704A89D9372BF9FB29@BY5PR11MB3894.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eqnp5XxFI+ZnwjuvWEi6fY+fE1Lq71tCi63rda+b/pvq4ZqdPjaPHLU7+GIOwP6rH4KA2yKcIauNyBI3eLbmNnBK0PN4U/K2e5TE3Xm+IUM9CM9oU5wfpPvfXd6NWlwocEGfrLvaf52+7c7cMVLZPGvc4rNUBnndxgkya6d/F2UrfhJu5FRDhpbKajVYVIcFaNFGtWczWhBy8igo/64EZHISjhnbhGemheLl8h1COFVQQQMqFSiT0YaoTv8aCBAs+YHsbqCyiPirFcrRQJLZRBbxzgjpIUoOIMBprRXnLQlGJ9gNsvdOIoJBoPwge4Q7PPi8DHez/IuWOf6WpkQ7tUaWLGMBo6k76PEeYjwjbz3uBduSOlyaAzokowAaAaxzjQ/TDfrqLY6uo+Arl0Ad8k8OChipN0P7CtglhjzfC0xdH2nUYhqvJD3BvXXIjM4K7whgYpWsIkbGa1dpBNMUGXCY6sj/3bF+RAm1T2RdaRnB9XbdkywhkgGeBf3I84t+cJ557QMSTxGZm3mejCrtuJYy3keH5PDeYMMntzY4ps83/F9UOesdO8DjrbuNPv74dK+q59FFoNRSu2QnKKL7MzREL7pEszw9/MLkIefoD0foHEgvNFrz9/f+ExauetreBf7karIpeEr0OHNglpSW/sdUVRIdJ2POHBkAJYUWcmTSH/FtiXt1H4o/qzH2ztV8
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39850400004)(376002)(346002)(366004)(166002)(31686004)(8936002)(66556008)(478600001)(66476007)(5660300002)(83380400001)(966005)(66946007)(6486002)(31696002)(26005)(186003)(316002)(16526019)(33964004)(16576012)(8676002)(44832011)(2616005)(956004)(52116002)(86362001)(36756003)(2906002)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?UFl5VHpGVEsyMjNjdEtmRWlQYWlKNGFRT3NheUFuWEVqN0hTSVBjN2VsdHZm?=
 =?utf-8?B?UDNNdFNvaVBlNEVPakRCODdtV1hOT09FQVE4Y25vSkx2anN2UVNxTzU2MGp1?=
 =?utf-8?B?ZlYvR3poT1JBM0Q5SWNnbXVLbzNEankzTk9qN3VLaSsxaSsyZnN0QUV5S3FW?=
 =?utf-8?B?aXNKWjg3VUdnN0lvbmY1VVpWb0Y2UlVUekVwWU95K1FKaHF2QU83b3IvZWRM?=
 =?utf-8?B?akkvQTFBRjAydWxKcVZtZTlaaVZFVGhOSmRjTFNZREVZQmZsMDVNaS9MN3dM?=
 =?utf-8?B?SEJIbTdPOFY5LzdkZk9BbE94N3NndUF0bWQ2RWN5b29QMHRHaFp4MzYyQkZX?=
 =?utf-8?B?L0FBNUxMTm9VUHQwWlF0ak1FaEpDZERJQ1Z1Nno2dzhwVjI0UktkMmdvUDZW?=
 =?utf-8?B?RkxjODBmZVg5a01rY04wc3pMT1FRYXpqUzA1ZWZic3pMUWllVHpTUGltZXk5?=
 =?utf-8?B?TXpIT0o0a0hnOHZUR3FDZStOMEd4dmZyNGQ3VDRCeCtQZGcxWVIrS2ljb2Nw?=
 =?utf-8?B?QTF3ZjF2bHZhSFdvLzA1QUJNOTlXcHZ1amk2TkZkK3ErTGVCYmhLRGVQaUU2?=
 =?utf-8?B?S1lIaThnZ05SL05LczVIUWlPYUl1SG1DeGhKbE9lZmJ1NThSUjljKzBYaFRU?=
 =?utf-8?B?WHNFWDJnQzhteDRKdElRMVdBMVByWVg1V3d3ZkIzd3VDYlptcUFkRk1ESm1o?=
 =?utf-8?B?UDYrcWxJMEpFUkRMSEx1U3Blc2ZheGFMdFVxalBSV0JOWHhLUHFNQ1Z2ZFRl?=
 =?utf-8?B?dFltMDlIckdkeEF5NStrMEUwNXJRNTBQR2pwWUE0bSttNjlTMHRROHVUVUUv?=
 =?utf-8?B?aVNCdEVsODZqSGlmcmFvZjAwdmZtdmI1bjZnMkNkV05JQVY3Q1lEc0FsbmV5?=
 =?utf-8?B?Mk11Umg2aWpXdUtPSHdNand2S1NoT213QUxscDhyYkVjWGNjVWo0aStsRnFn?=
 =?utf-8?B?VjF0bGROSnU4VkdZNjFHQXlqNnBzNDBQMXFTZjZtU2FIaitFMVF2YTRhWXpo?=
 =?utf-8?B?N2o5OW9id0ZaNlBpampGZWdGVnVkTHczMHA1NFJFenVEd05ueS9ESXB0T2tK?=
 =?utf-8?B?KzFRVHpjemZMQTlRMit1c1htL0VLVnJlUUJRZWJTZW9vRFRzKyttUWkvVHNu?=
 =?utf-8?B?TGxtMUV4cXlJL1dwVGNIV3NCT3h1ckliK2dwOFovYkhBZXhVaFdUeTcrR0RR?=
 =?utf-8?B?SnBkMUFQV2VwODdpOFd3Vm1WVFYwTm9lYy8vbU5zZWd6WDBLVTNNVElFZXEr?=
 =?utf-8?B?aTRHMjRqbFpTSk1WMWlWeHBGQ3ZDT3ovWGlWMnVyc3hOS1FUOURySDExVytz?=
 =?utf-8?B?dG1SNzJKdEpOT2xlR0NGaTBBekd3Z2U0NDg5eVBRZ3NEMDFYM3pBOU5BVjZI?=
 =?utf-8?B?bDU4RFBySzkrS1Z0L1JFMFhETlpERUR1MUNDMUs1dEQ0dzdYNlBpWGMwckVT?=
 =?utf-8?B?YWJ3SlZjTGdqMGdjaEpDc0RtendFbnhmVXRkWG1HUHNrdlFQYVR4MUlpdTFj?=
 =?utf-8?B?NmlKMUdHRUZhN2ZEeWRQQnFlV2ZNQlg2SHpPdjN0b1VyR2xNalEwOXBsMjhE?=
 =?utf-8?B?dWg4VWhlNE90eWZHVXAvekNzL2t1OW53Uk1oUU8xeG5DUm9ncThpRGtVdVlK?=
 =?utf-8?B?aUE5OWQ5Q0RjMWwxMGQ4VWh4NDRpejRtUFRsUmdpUkZQLzdpYTFIQ3RxUkVD?=
 =?utf-8?B?cWtHQS9kRExSQnQ4Y3I1clE4WXpzVXJPeDZ6ekMzM2pjWEF6L1QzUW5QNi9i?=
 =?utf-8?Q?VQBol7TX6iug0hHl+19SqVtGsGFmDf0PXKVvI4p?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02d55ed2-11b2-473b-65cb-08d8c9de7441
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 14:00:54.5449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Wr4xnkinjwg08JhJWl9eKdaugDb03vPxGKN9XsnTxWIRt0GyxnWXy7UZ/XvHzbBeVT66YtIKiq8Et4m7N+pRl2mFM202QiySkIiPo7osGE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3894
Content-Type: multipart/alternative;
 boundary="------------F7036C181AA7B731B01D8318"
Content-Language: en-US

--------------F7036C181AA7B731B01D8318
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2021-02-02 6:26 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 1.1.3:
>
> - MOF compiler: Fixed bug where MOF compiler did not correctly
>    install a CIM schema in a non-default namespace because it tried
>    to get the qualifiers from the default namespace.
> - Test: Changed dependency to ‘typed-ast’ to match the needs of
>    ‘astroid’ and to install it only on CPython. This allows
>    re-enabling PyPy3 on Travis.
> - Test: Pinned psutil to <=5.6.3 on PyPy2+3 to avoid an
>    installation error.
> - Test: Increased the minimum version of ‘pyzmq’ on Python 3.9
>    to 19.0.0 to avoid an installation error.
> - Test: Circumvented unicode issue with
>    lxml.etree.fromstring()/XML() on Python 3.9 by passing in binary
>    strings.
> - Test: Adjusted _format()/_ascii2() testcases to PyPy3 behavior
>    with binary vs unicode results.
> - Test: Disabled leaktest in travis also on PyPy3 (in addition to
>    PyPy2).
> - Fixed a DeprecationWarning issued by urllib3 about using the
>    whitelist_methods parameter of Retry.
> - Fixed issue on GitHub Actions with macos by no longer running
>    “brew update” in pywbem_os_setup.sh. (issue #2544)
> - Docs: Fixed incorrect attribute name ‘provider_classnames’ in
>    method provider example. (issue #2564)
> - Mitigated the coveralls HTTP status 422 by pinning
>    coveralls-python to <3.0.0.
> - Migrated from Travis and Appveyor to GitHub Actions. This
>    required several changes in package dependencies for development.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-pywbem_1.1.0.bb => python3-pywbem_1.1.3.bb}       | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-extended/pywbem/{python3-pywbem_1.1.0.bb => python3-pywbem_1.1.3.bb} (91%)
>
> diff --git a/meta-python/recipes-extended/pywbem/python3-pywbem_1.1.0.bb b/meta-python/recipes-extended/pywbem/python3-pywbem_1.1.3.bb
> similarity index 91%
> rename from meta-python/recipes-extended/pywbem/python3-pywbem_1.1.0.bb
> rename to meta-python/recipes-extended/pywbem/python3-pywbem_1.1.3.bb
> index d68ae9abf..fd7341953 100644
> --- a/meta-python/recipes-extended/pywbem/python3-pywbem_1.1.0.bb
> +++ b/meta-python/recipes-extended/pywbem/python3-pywbem_1.1.3.bb
> @@ -16,8 +16,7 @@ HOMEPAGE = "http://pywbem.github.io"
>   LICENSE = "LGPLv2.1"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fbc093901857fcd118f065f900982c24"
>
> -SRC_URI[md5sum] = "6ade0cda6a997542d61f15713c2dd971"
> -SRC_URI[sha256sum] = "4e2baa4b4b88943cca32c7eb588fffff22ce86c748ba7544e01149f9638014fe"
> +SRC_URI[sha256sum] = "2abb6443f4debae56af7abefadb9fa5b8af9b53fc9bcf67f6c01a78db1064300"
>
>   inherit pypi setuptools3 update-alternatives
>
> --
> 2.17.1
>
>
> 
>

--------------F7036C181AA7B731B01D8318
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-02 6:26 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210202112636.30651-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 1.1.3:

- MOF compiler: Fixed bug where MOF compiler did not correctly
  install a CIM schema in a non-default namespace because it tried
  to get the qualifiers from the default namespace.
- Test: Changed dependency to ‘typed-ast’ to match the needs of
  ‘astroid’ and to install it only on CPython. This allows
  re-enabling PyPy3 on Travis.
- Test: Pinned psutil to &lt;=5.6.3 on PyPy2+3 to avoid an
  installation error.
- Test: Increased the minimum version of ‘pyzmq’ on Python 3.9
  to 19.0.0 to avoid an installation error.
- Test: Circumvented unicode issue with
  lxml.etree.fromstring()/XML() on Python 3.9 by passing in binary
  strings.
- Test: Adjusted _format()/_ascii2() testcases to PyPy3 behavior
  with binary vs unicode results.
- Test: Disabled leaktest in travis also on PyPy3 (in addition to
  PyPy2).
- Fixed a DeprecationWarning issued by urllib3 about using the
  whitelist_methods parameter of Retry.
- Fixed issue on GitHub Actions with macos by no longer running
  “brew update” in pywbem_os_setup.sh. (issue #2544)
- Docs: Fixed incorrect attribute name ‘provider_classnames’ in
  method provider example. (issue #2564)
- Mitigated the coveralls HTTP status 422 by pinning
  coveralls-python to &lt;3.0.0.
- Migrated from Travis and Appveyor to GitHub Actions. This
  required several changes in package dependencies for development.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210202112636.30651-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-pywbem_1.1.0.bb =&gt; python3-pywbem_1.1.3.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-extended/pywbem/{python3-pywbem_1.1.0.bb =&gt; python3-pywbem_1.1.3.bb} (91%)

diff --git a/meta-python/recipes-extended/pywbem/python3-pywbem_1.1.0.bb b/meta-python/recipes-extended/pywbem/python3-pywbem_1.1.3.bb
similarity index 91%
rename from meta-python/recipes-extended/pywbem/python3-pywbem_1.1.0.bb
rename to meta-python/recipes-extended/pywbem/python3-pywbem_1.1.3.bb
index d68ae9abf..fd7341953 100644
--- a/meta-python/recipes-extended/pywbem/python3-pywbem_1.1.0.bb
+++ b/meta-python/recipes-extended/pywbem/python3-pywbem_1.1.3.bb
@@ -16,8 +16,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://pywbem.github.io">&quot;http://pywbem.github.io&quot;</a>
 LICENSE = &quot;LGPLv2.1&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=fbc093901857fcd118f065f900982c24">&quot;file://LICENSE.txt;md5=fbc093901857fcd118f065f900982c24&quot;</a>

-SRC_URI[md5sum] = &quot;6ade0cda6a997542d61f15713c2dd971&quot;
-SRC_URI[sha256sum] = &quot;4e2baa4b4b88943cca32c7eb588fffff22ce86c748ba7544e01149f9638014fe&quot;
+SRC_URI[sha256sum] = &quot;2abb6443f4debae56af7abefadb9fa5b8af9b53fc9bcf67f6c01a78db1064300&quot;

 inherit pypi setuptools3 update-alternatives

--
2.17.1

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------F7036C181AA7B731B01D8318--

Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.69])
 by mx.groups.io with SMTP id smtpd.web08.13456.1616422565895953108
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Mar 2021 07:16:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=mTaCDUsl;
 spf=pass (domain: windriver.com, ip: 40.107.93.69, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FGVjOZAba5Z6ZhB7LSAfhjpJFwNBKRUYXExHah54krf/W4Y8sC1VnXKdWbwz7orfGiKGXG47LMI70Ny9mPVksDESutdj/Y5/A395YBIE6q2Oad21LpY9NOe/oOrJ8kMO/d+UJk3+d70vJL5xavjjO0fSJJZASPFU3ydP48oJ0u2hQPv2aLrgqS9gtysvT62uMZtN4nEhzi5qtFXMZg6CZLHyHERSPcKUsc8XotWjkwX/VnMa2Pgv++wjdZaqgQeqlYEaOSSmFkix9yk9/xzbn5yoLZDmh+EID/q0kfxJaVtIMxs/51mnOWkKb3WvT0TVtOv299ih0bZN3xUic7yUWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7lJdhSth4AKg09K3yInY4uOVvGPOH2QVjmZCsWkyQwM=;
 b=dzM3YEMu63+nRXoIVoR6vfsej/dZdSkI+SOEP+p3gNfZcVfofa8eXN6eZPkYhDnr3iO7PSKPwBaYOAxsM/EedW9M7Px9OX6nexZDAe/5NGAI6ZTjFwJJGV9EMEZpMqPs3rGd4qukckvTqjrMNvWfIDhFU0QZ9HKQ6JepWiA/4SILgcwmH9HsUdVqDHF8EM2eZCb7qoqs5mRMKkF6nvW54jlWwVAclnNqSc1KZvBnt0fXfVPkyPrAKAxPsdhSWi1YH/ekzt8V3U6636aQbNQpQRZ12+xk/fuzTv+Qnqfeu6VqjWB5yP25CXQjJkzQu3cjgVVRQ8OBohMMXzy8p0Jqrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7lJdhSth4AKg09K3yInY4uOVvGPOH2QVjmZCsWkyQwM=;
 b=mTaCDUslbAlJkOAhFemZjUq419VuDJYcjF3d/M0ZXOCXe6rjopZ8FJBHmOFMQCVpmmFSw7X0pmwm9S+S1ke7k9oIXi7RUri01hdeRTehnblNgyWlFXql7vPMX7Zp+xvxZnfihmL4X9mmsQ1SfbaJebe/MjLSs3yAQQoXvp2Iw1I=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB5053.namprd11.prod.outlook.com (2603:10b6:a03:2af::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 14:16:04 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::89c3:3b4d:43c5:ae76]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::89c3:3b4d:43c5:ae76%5]) with mapi id 15.20.3955.025; Mon, 22 Mar 2021
 14:16:04 +0000
Subject: Re: [oe] [meta-python][PATCH 3/3] python3-werkzeug: Delete recipe for 1.0.0
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20210318064853.1268-1-raj.khem@gmail.com>
 <20210318064853.1268-3-raj.khem@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <b4772e7c-b6a8-6e6e-234f-4be0be990844@windriver.com>
Date: Mon, 22 Mar 2021 10:16:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210318064853.1268-3-raj.khem@gmail.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN9PR03CA0843.namprd03.prod.outlook.com
 (2603:10b6:408:13d::8) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN9PR03CA0843.namprd03.prod.outlook.com (2603:10b6:408:13d::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Mon, 22 Mar 2021 14:16:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a6cec1c1-162e-472d-3c6c-08d8ed3d0736
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5053:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB5053008D6D43FD8C42E0E0199F659@SJ0PR11MB5053.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MSpWGu026J9czNd+2gOi7ipmLMrirpGr0KYAKwBX7HZPnBFNvMJ644n3S3XXtZ7W+q12H5mPrurxxLwsxEfBqN7sUthSdW33DRh0tC/GgLuOL8Yqj5srZn7sSyjgdxN5TG9CmrZJuWRnMpeX/pOuLn06zPN+enntp0vzQbpNYk78Xs8kUf7RvoD5xWzNhElowMX96ss8p/cQe2B5euY6IetHiyH+iygK59PFvrqKOAFphMyqDbTXf6W5JbgAhTs93VO/5tdlzXLslMZbyD0DAg6k1ZTuH85zXdOV4PmI3USGlNaeG3U2gvJvo2h/gNhT0w6TvBPQO48MQgDp5QBjDNq8LCcLIOQ+qYUgh+RM5wzfM0zz1h6LrY0PPInuovNBnLzRpHuudr+3T+/OjfQ/sBPFRqEItl5XtX6TpaUOkP+n6k1O53yyIH0VvarDxJzfNXMYRuYFb7s47LFBeYGldHf/+saYaBRYvArOd1Iq1h0e82Qk8uE8pLomVG97TjWa6CwDOYLCVZwzsZkn8POCZrMjMxlYU144NDyFl55jjk5jh3kAE0W70zJGlCuPjAsbq7v3J++jgxGsfXZtQXPF8C7nTT3K50pEm+rKAMtHoGiaD8UqlZN3CnSwU0jOw+mh+90eCbo++m0htKeKUMWayEIY0GGV3X9ed3vqpNOByeKES3A06oAvacMpCC2N+6ojWsDQ+jXapAOq0XKrkmYdMqHeQ81j337eUqin6aE5qPNGccX2octc6RmFJryn6Ly7RNm/uweCHT/o2rugraxRd7LBr/I2l5GWiCRG+OHkUtY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(39850400004)(136003)(376002)(396003)(5660300002)(66946007)(166002)(26005)(186003)(478600001)(66476007)(2906002)(66556008)(956004)(966005)(2616005)(16526019)(31696002)(86362001)(8936002)(44832011)(33964004)(8676002)(16576012)(31686004)(316002)(6486002)(83380400001)(36756003)(53546011)(38100700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?RUVRbm1VRldZNktsa3R5VmdJMGQ3UUMxMnBuOTdjd1FIR3BLOXc0b0xadGZh?=
 =?utf-8?B?b0I3a2g2ZnZWS0ppQnVwa3ZQSWU4VVBCeXFkNkNNY2NUTXRDeXo1YzNhM3BR?=
 =?utf-8?B?eWFNQnNKeERZWU9pcE9pb3VFUGhucHhFdVcxbXZnMXJzSGFsSGhsU2JGTTdD?=
 =?utf-8?B?YWpGSHF6LzZ0QWhBNVpEUm1YZjBMRit6YVhGeFc2VU92WlNMaDg1R21hdlZU?=
 =?utf-8?B?YzQ1RnY3Tm5KcjArclUwSDJuMG9vRm9adEpzWkF1ZXFheDlNOUw2Y0hqMFkx?=
 =?utf-8?B?WVM1L2ZKRWx6ZU5qQ2NtN0NHU1pxZVZtb0Znc2todHNYNVhNNWZ2eS9TY093?=
 =?utf-8?B?SzdsbmJ4aFJGSVRJRTYzUjgraTV3MlBkYlRRZ01XcUpIdnBMUWI0NmcxSFhy?=
 =?utf-8?B?cmNJOTFDdUVwQWJrVlhKdy9tWklYdEpBK2J3bWZCbXJOenFmZjI5Z0NLbU83?=
 =?utf-8?B?K2NnK3hNTi8zQUI1Sm1XSzN6d1owTlNoQUpiZ3lGYzFIdEpZQmdpdHBmOXVs?=
 =?utf-8?B?WE12NXQyVUJ0aklHazU2UG5wVXBnTTgxUmdYbThlY2ZSNTJTd2FIN2FmTTc4?=
 =?utf-8?B?aGIwYmw0aEtrbm9zYUhZK0hReVdJQ1NEWm5YV09manhOS3BkU0xvN3l3YVB6?=
 =?utf-8?B?R2lpTC9GU2x4enlhK0JuWFNDYnNLdEtDZW16RDdrTWVTQnpPNUl0QVhEcnB4?=
 =?utf-8?B?V2Y0NDh1Ti9LMks2UTNNclFqdVpNT3NpSVFwZUxtMVNwZ3oxTGRiYlNBQXJn?=
 =?utf-8?B?V3pwWHArZ1FxMnNBNEVZT0tFbDhtbzVhTWFBTk5Kd1pWbi9HOG83RkxSZFhp?=
 =?utf-8?B?b1BJY1oyNjcza25aU0NaVE9GQ3QzdEJwdFNnOGY1UlhRUDdVMzlFRUR1MTh6?=
 =?utf-8?B?Wll0RkRtMFhwTE9Jd0pqWk5INHVyUGoyS2JkZ3JMNkZFMXZtMEZ6OW53UXNz?=
 =?utf-8?B?UW9RMFZXZlZCcG9MTUhJNGZNS0FDeHVUdXNKWU4wODJQUXVNbmFTa3N1YkNk?=
 =?utf-8?B?cnZQUWdaZkNIMjNKK2NGbk8zUmZ4TkhxMXFNMHpZMXE4cGRDVVoxOVhkT3ll?=
 =?utf-8?B?Nk5ydGpMRTJIcFdPS0hLeVZNb2VkL3NCVDhoeHpvTkNISlJIUWpkZWdCeDNh?=
 =?utf-8?B?Q3JSV0RJZytLYTdkRG5zNFBoUTNibnZvZ1hNa3JveEZ3ZmJGWWNNMHdXMmxR?=
 =?utf-8?B?bVFoRk9MVHh0bzBDMFltZy81VUh3QlVlQ0dIaFMybFBkUmY5SXczYXo1b3gx?=
 =?utf-8?B?TDRRZHliK0FKQnVjalN2ZWtMY1B6cndPYWkwaXBiVTRXM295MG5yeFppWkMr?=
 =?utf-8?B?NFRQTXRiVnh0MUpTSG5JTHdjUlEwNFJCVnliVXplY1lIVitsdE10US84UWdV?=
 =?utf-8?B?ZmcxK2JnN3JwVlNvT2JENk9DY2l0Nnc3bGw1K3FvSEEzeXl5WDhYZnpwOEpS?=
 =?utf-8?B?QmxUWGozelBGL1l6c0hRSFdTTiszQ1ZlL0ptSkxLay8xME0zdktTRGR4VnJj?=
 =?utf-8?B?dWlMTVN4YW12Z24ySnhNL2t2OWlIaDd5cm5CclFGekk5akJtbmhpNTBxdE8r?=
 =?utf-8?B?eDNqbUZWQ2Z4dWU0YS9menVUT0ZQNnFnT29IUTZXQVVFdnZLaUpXYlZsaG5q?=
 =?utf-8?B?Q3hOT2ZRdkRNYnZ3UDFhWlg2bE1SRXg2Z0UxME5udkh5eHg0NC9GMmg4TXFv?=
 =?utf-8?B?aSs2Mi84aHpUUlFCT2dKdUVJekJtdjF4SFNCWUVnU0htdTJzNE5RS2RnQnc2?=
 =?utf-8?Q?uc8IU/lY2iFstHlV8bDwey8+s7NHggDmVemEBCB?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6cec1c1-162e-472d-3c6c-08d8ed3d0736
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 14:16:04.5526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /JuPRKQn51GwnQy65LLhYuG0ornbQAur8ZhQ3ZbBFtj4ULu/8g26xvEHBc3Te2xF64w8PkgIK1T02yVDqFeNue2tOsrwWbV0JT05BWOdAM4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5053
Content-Type: multipart/alternative;
 boundary="------------B7ACB356D088DBEA2BEEAFAA"
Content-Language: en-US

--------------B7ACB356D088DBEA2BEEAFAA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-03-18 2:48 a.m., Khem Raj wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> 1.0.1 is already in
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-werkzeug_1.0.0.bb          | 50 -------------------
>   1 file changed, 50 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python3-werkzeug_1.0.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_1.0.0.bb b/meta-python/recipes-devtools/python/python3-werkzeug_1.0.0.bb
> deleted file mode 100644
> index 3e4374ed4b..0000000000
> --- a/meta-python/recipes-devtools/python/python3-werkzeug_1.0.0.bb
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -SUMMARY = "The Swiss Army knife of Python web development"
> -DESCRIPTION = "\
> -Werkzeug started as simple collection of various utilities for WSGI \
> -applications and has become one of the most advanced WSGI utility modules. \
> -It includes a powerful debugger, full featured request and response objects, \
> -HTTP utilities to handle entity tags, cache control headers, HTTP dates, \
> -cookie handling, file uploads, a powerful URL routing system and a bunch \
> -of community contributed addon modules."
> -HOMEPAGE = "http://werkzeug.pocoo.org/"
> -LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462"
> -
> -SRC_URI[md5sum] = "305f75c4a88c96dcdc5654bf2d01bc05"
> -SRC_URI[sha256sum] = "169ba8a33788476292d04186ab33b01d6add475033dfc07215e6d219cc077096"
> -
> -PYPI_PACKAGE = "Werkzeug"
> -
> -inherit pypi setuptools3
> -
> -CLEANBROKEN = "1"
> -
> -PACKAGES =+ "${PN}-tests"
> -FILES_${PN}-tests+= " \
> -    ${PYTHON_SITEPACKAGES_DIR}/werkzeug/test* \
> -    ${PYTHON_SITEPACKAGES_DIR}/werkzeug/__pycache__/test* \
> -    ${PYTHON_SITEPACKAGES_DIR}/werkzeug/contrib/test* \
> -    ${PYTHON_SITEPACKAGES_DIR}/werkzeug/contrib/__pycache__/test* \
> -"
> -
> -RDEPENDS_${PN} += " \
> -    ${PYTHON_PN}-datetime \
> -    ${PYTHON_PN}-difflib \
> -    ${PYTHON_PN}-email \
> -    ${PYTHON_PN}-html \
> -    ${PYTHON_PN}-io \
> -    ${PYTHON_PN}-json \
> -    ${PYTHON_PN}-misc \
> -    ${PYTHON_PN}-netclient \
> -    ${PYTHON_PN}-netserver \
> -    ${PYTHON_PN}-numbers \
> -    ${PYTHON_PN}-pkgutil \
> -    ${PYTHON_PN}-pprint \
> -    ${PYTHON_PN}-threading \
> -    ${PYTHON_PN}-unixadmin \
> -"
> -
> -RDEPENDS_${PN}-tests = " \
> -    ${PN} \
> -    ${PYTHON_PN}-unittest \
> -"
> --
> 2.31.0
>
>
> 
>

--------------B7ACB356D088DBEA2BEEAFAA
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-03-18 2:48 a.m., Khem Raj
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210318064853.1268-3-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

1.0.1 is already in

Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210318064853.1268-3-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-werkzeug_1.0.0.bb          | 50 -------------------
 1 file changed, 50 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-werkzeug_1.0.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_1.0.0.bb b/meta-python/recipes-devtools/python/python3-werkzeug_1.0.0.bb
deleted file mode 100644
index 3e4374ed4b..0000000000
--- a/meta-python/recipes-devtools/python/python3-werkzeug_1.0.0.bb
+++ /dev/null
@@ -1,50 +0,0 @@
-SUMMARY = &quot;The Swiss Army knife of Python web development&quot;
-DESCRIPTION = &quot;\
-Werkzeug started as simple collection of various utilities for WSGI \
-applications and has become one of the most advanced WSGI utility modules. \
-It includes a powerful debugger, full featured request and response objects, \
-HTTP utilities to handle entity tags, cache control headers, HTTP dates, \
-cookie handling, file uploads, a powerful URL routing system and a bunch \
-of community contributed addon modules.&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://werkzeug.pocoo.org/">&quot;http://werkzeug.pocoo.org/&quot;</a>
-LICENSE = &quot;BSD-3-Clause&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462">&quot;file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462&quot;</a>
-
-SRC_URI[md5sum] = &quot;305f75c4a88c96dcdc5654bf2d01bc05&quot;
-SRC_URI[sha256sum] = &quot;169ba8a33788476292d04186ab33b01d6add475033dfc07215e6d219cc077096&quot;
-
-PYPI_PACKAGE = &quot;Werkzeug&quot;
-
-inherit pypi setuptools3
-
-CLEANBROKEN = &quot;1&quot;
-
-PACKAGES =+ &quot;${PN}-tests&quot;
-FILES_${PN}-tests+= &quot; \
-    ${PYTHON_SITEPACKAGES_DIR}/werkzeug/test* \
-    ${PYTHON_SITEPACKAGES_DIR}/werkzeug/__pycache__/test* \
-    ${PYTHON_SITEPACKAGES_DIR}/werkzeug/contrib/test* \
-    ${PYTHON_SITEPACKAGES_DIR}/werkzeug/contrib/__pycache__/test* \
-&quot;
-
-RDEPENDS_${PN} += &quot; \
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-difflib \
-    ${PYTHON_PN}-email \
-    ${PYTHON_PN}-html \
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-json \
-    ${PYTHON_PN}-misc \
-    ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-netserver \
-    ${PYTHON_PN}-numbers \
-    ${PYTHON_PN}-pkgutil \
-    ${PYTHON_PN}-pprint \
-    ${PYTHON_PN}-threading \
-    ${PYTHON_PN}-unixadmin \
-&quot;
-
-RDEPENDS_${PN}-tests = &quot; \
-    ${PN} \
-    ${PYTHON_PN}-unittest \
-&quot;
--
2.31.0

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------B7ACB356D088DBEA2BEEAFAA--

Received: from NAM04-BN8-obe.outbound.protection.outlook.com (NAM04-BN8-obe.outbound.protection.outlook.com [40.107.100.41])
 by mx.groups.io with SMTP id smtpd.web10.12809.1598359583548586664
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2020 05:46:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=XFrL1WAV;
 spf=pass (domain: windriver.com, ip: 40.107.100.41, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gLuF2r0XvFykZol/GIPzjHSq2SC/Oxp16Zuy9NyPd1VozntYIpmUvmORwf6ZFDMyvUlYVlm56T7NajUjie4XaUYnvnzq+eZuLSGx+wQSqf/kHJjZRCgO0nhns2etSQG9VZxYCFxc49sjDaiQK6dovfzHdzFatmyhXkr0KGtRHe8kE3t0mxucoCOD/R4cIELPM4+hPRHLFAwq0DSduBmP2JjC+T1alFex/Oc2quh35ghBVvn3Z1qNOolQdS0O7dn9+cbvncADBjdOUOlgAIJKXKSSKBwqSh3tlZRli/e8KdbuB/ryGlDYsE4A6MhQKnBUG43ykzO47UnIuQKW/QeYtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MhtYnX88k9DjUpyLVoKqmRJaByEffrQTXs/eZit47GQ=;
 b=IAZx4pDBHtAyT76wS3MxWEv+xRqvQrao8UJcWPAJ4lO2/ZpHQPVi9bQBrg4aXRov+RnzdHVC30lNAkYIjaa+fjNTzUdvUJvDTyByNiVX2QCb42JdLJF06twR+c3Ky4mkM6K84beQAJbFnhU9Uc3sbQMLlrWlGLVKIR6gysgFFFyhpAhgCBulCBJf4H9qZZRxSYhPPPNxI5IzHIHSJqqOZn/1aNnesBLVFC5mO+f/Y4ZyKsz/pUE3OeW/x2jdKZL8IQh8pqE7uJSjMNJFajSd77XzK1i7/gU7C/4V2RoSsR5fb1KTzCXVt3AW5Bvw7GixWoHcenBXNzGpsVHaJqqE9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MhtYnX88k9DjUpyLVoKqmRJaByEffrQTXs/eZit47GQ=;
 b=XFrL1WAVL7KNf77V5qJzFpAAJAp74m41W+jrDoT4H2N/l3LYypSonvE1ZQ4Bx1/bAMKnGUdRhP55FvQH30uzE/z4hbzcpsYB0iWIOQKTxaUAlZP5PnDLYojRM3ilAewcrMi9OjI0WoQtbaKiXCjH5b7oTpBGN6CvN0i1uj2uyUg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB3976.namprd11.prod.outlook.com (2603:10b6:a03:187::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Tue, 25 Aug
 2020 12:46:21 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3326.019; Tue, 25 Aug 2020
 12:46:21 +0000
Subject: Re: [oe] [meta-python][PATCH 6/7] python3-pandas: Upgrade 1.1.0 -> 1.1.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200824145004.12568-1-leon.anavi@konsulko.com>
 <20200824145004.12568-6-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <422a1179-b202-70ca-8900-53d61924b864@windriver.com>
Date: Tue, 25 Aug 2020 08:46:18 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200824145004.12568-6-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0096.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::35) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YT1PR01CA0096.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25 via Frontend Transport; Tue, 25 Aug 2020 12:46:20 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 580c9b66-2b9f-4be5-cd4c-08d848f4de3d
X-MS-TrafficTypeDiagnostic: BY5PR11MB3976:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB3976FC1F7887E1A169F50B809F570@BY5PR11MB3976.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QuOZrMbUMKuA0BQp+BZ1FL9lCL0u97D45JzMW+W3H2qaTRBEHLBF+K3XqySKUePPoWwCrXHR/mkX2O93cfCtSnOmG2I0fFTA67tLlH3wH7nGaV2R8hh+2vR/+/p8fiEfU7tnZNt2RdCbZMaf45DdoMnH78znddoarY7cu7uN+pKhVxjNRlxBGUlAOigqHKxBmKQ1BLPYagOxrjJEA+1NfTcgvfl2j2M8ingr/wxswxpU39c7+qdYAoa+S2jlln+eVCpGJG9/7yeWwnwTmOQxjQReT+lpjL7tzJhx0B2o+I+7EHKfkgoeXTcH5OCjSt/npOjICTLMM97oNT/tvn7BZSrMwMU0iP3SLu00S1Dtec3J5AUxAGkMalcLxsNgVxOB//BY21/w7sxco4cqVrcM+Rhd7ZH8OtuGkmwC/Vs0Se9c5HJzpaj1MUrwJz5YXs0lY6c30pxOREXW7l7yYH5sVg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(39850400004)(376002)(366004)(136003)(66946007)(66556008)(478600001)(26005)(186003)(5660300002)(31696002)(2906002)(83380400001)(31686004)(166002)(8676002)(36756003)(316002)(8936002)(66476007)(966005)(16576012)(86362001)(2616005)(52116002)(33964004)(53546011)(6486002)(44832011)(956004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	Ie7MxTpMXXrqIVUQddpr3EfBmFV2m/eqR92xvKDDrBdOb1TNjUjZcIUXvKsKXXLIuyhkiRQWk09q/EFiIFwKusIZ1vcJ739zudtJ0RE4qb6Sw+JlbH+64C7ptTYfvTfyLTN2USFD7jdRvQ7yEfHqPsU8zDLK7omw/VnZoNo63rOyI1me9yh4TA7nAWhye5nd7M3Z1XB8DTZ5j9eOesuNAuq/neSSdoo21CY15ycB8QrlJoDTubhsIE8OhNQHXCi2tycNGAXvFUjB+l1ZtQs3ds/YINxE316GdhfumlLhQ/8cEK2uMWU0M4jJRfBCbYnP+CAR4ahSeViz4P/34XJHyxo0ihmWlGOQX9eR5PrKc+Q1ZHbAGLkjq/JKE+NnTgWFfAEx6sKyXi1xPb7QgElBHPso5VfFBNbvlUagnzRRY4VFOoJtBwQf41XqhfkAAxQgu/0dV43l5t1el+T+RMeXF1/UYNqUAIa3B8SGZN63jYjYFMkOkfE9XBr8WP8pjbs8MTygZZj3kXufLsXejQkxNJ4fWUV4XNF5wso2ycFsAEpcA1jpI/Nk4rNCqGsnbZTD6bj0It1dYszXz2hf+rnhwgUsL+M705K6G4rFe5etbg8fn+3cxehhVa71IYxlziyOa67EuK4BAu0fYOqzs6ffsQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 580c9b66-2b9f-4be5-cd4c-08d848f4de3d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2020 12:46:21.3795
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KU5M4hn7kqq90Yc7IfxlmABMbBeUrTwDxWodkxgXQ2jLfpSxWH83I2e/ziHnHvGOfiIIaMi7cZZuxT1ZaddRb5qdruqoLBArGUUGiBSlkxA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3976
Content-Type: multipart/alternative;
 boundary="------------E4B4D52BF17D80B12C7068F0"
Content-Language: en-US

--------------E4B4D52BF17D80B12C7068F0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/24/20 10:50 AM, Leon Anavi wrote:
> Upgrade to release 1.1.1:
>
> - Fixed regression in CategoricalIndex.format() where, when
>    stringified scalars had different lengths, the shorter string
>    would be right-filled with spaces, so it had the same length
>    as the longest string
> - Fixed regression in Series.truncate() when trying to truncate
>    a single-element series
> - Fixed regression where DataFrame.to_numpy() would raise a
>    RuntimeError for mixed dtypes when converting to str
> - Fixed regression where read_csv() would raise a ValueError when
>    pandas.options.mode.use_inf_as_na was set to True
> - Fixed regression where pandas.testing.assert_series_equal()
>    would raise an error when non-numeric dtypes were passed with
>    check_exact=True
> - Fixed regression in .groupby(..).rolling(..) where column
>    selection was ignored
> - Fixed regression where DataFrame.interpolate() would raise a
>    TypeError when the DataFrame was empty
> - Fixed regression in DataFrame.shift() with axis=1 and
>    heterogeneous dtypes
> - Fixed regression in DataFrame.diff() with read-only data
> - Fixed regression in .groupby(..).rolling(..) where a segfault
>    would occur with center=True and an odd number of values
> - Fixed regression in DataFrame.apply() where functions that
>    altered the input in-place only operated on a single row
> - Fixed regression in DataFrame.reset_index() would raise a
>    ValueError on empty DataFrame with a MultiIndex with a
>    datetime64 dtype level
> - Fixed regression where pandas.merge_asof() would raise a
>    UnboundLocalError when left_index, right_index and tolerance
>    were set
> - Fixed regression in .groupby(..).rolling(..) where a custom
>    BaseIndexer would be ignored
> - Fixed regression in DataFrame.replace() and Series.replace()
>    where compiled regular expressions would be ignored during
>    replacement
> - Bug in Styler whereby cell_ids argument had no effect due to
>    other recent changes
> - Bug in pandas.testing.assert_series_equal() and
>    pandas.testing.assert_frame_equal() where extension dtypes
>    were not ignored when check_dtypes was set to False
> - Bug in to_timedelta() fails when arg is a Series with Int64
>    dtype containing null values
> - Bug in .groupby(..).rolling(..) where passing closed with
>    column selection would raise a ValueError
> - Bug in DataFrame constructor failing to raise ValueError in
>    some cases when data and index have mismatched lengths
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-pandas_1.1.0.bb => python3-pandas_1.1.1.bb}      | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pandas_1.1.0.bb => python3-pandas_1.1.1.bb} (83%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pandas_1.1.0.bb b/meta-python/recipes-devtools/python/python3-pandas_1.1.1.bb
> similarity index 83%
> rename from meta-python/recipes-devtools/python/python3-pandas_1.1.0.bb
> rename to meta-python/recipes-devtools/python/python3-pandas_1.1.1.bb
> index 7d65287cb..63ae69e3d 100644
> --- a/meta-python/recipes-devtools/python/python3-pandas_1.1.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pandas_1.1.1.bb
> @@ -6,8 +6,8 @@ HOMEPAGE = "http://pandas.pydata.org/"
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=c2a8f987b2ce77c368c6b3e1b5b10774"
>   
> -SRC_URI[md5sum] = "512da48424b85bf198002bdbdf38af5a"
> -SRC_URI[sha256sum] = "b39508562ad0bb3f384b0db24da7d68a2608b9ddc85b1d931ccaaa92d5e45273"
> +SRC_URI[md5sum] = "bb796b56c276ecea1a6a227010e9c56a"
> +SRC_URI[sha256sum] = "53328284a7bb046e2e885fd1b8c078bd896d7fc4575b915d4936f54984a2ba67"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------E4B4D52BF17D80B12C7068F0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/24/20 10:50 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200824145004.12568-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.1.1:

- Fixed regression in CategoricalIndex.format() where, when
  stringified scalars had different lengths, the shorter string
  would be right-filled with spaces, so it had the same length
  as the longest string
- Fixed regression in Series.truncate() when trying to truncate
  a single-element series
- Fixed regression where DataFrame.to_numpy() would raise a
  RuntimeError for mixed dtypes when converting to str
- Fixed regression where read_csv() would raise a ValueError when
  pandas.options.mode.use_inf_as_na was set to True
- Fixed regression where pandas.testing.assert_series_equal()
  would raise an error when non-numeric dtypes were passed with
  check_exact=True
- Fixed regression in .groupby(..).rolling(..) where column
  selection was ignored
- Fixed regression where DataFrame.interpolate() would raise a
  TypeError when the DataFrame was empty
- Fixed regression in DataFrame.shift() with axis=1 and
  heterogeneous dtypes
- Fixed regression in DataFrame.diff() with read-only data
- Fixed regression in .groupby(..).rolling(..) where a segfault
  would occur with center=True and an odd number of values
- Fixed regression in DataFrame.apply() where functions that
  altered the input in-place only operated on a single row
- Fixed regression in DataFrame.reset_index() would raise a
  ValueError on empty DataFrame with a MultiIndex with a
  datetime64 dtype level
- Fixed regression where pandas.merge_asof() would raise a
  UnboundLocalError when left_index, right_index and tolerance
  were set
- Fixed regression in .groupby(..).rolling(..) where a custom
  BaseIndexer would be ignored
- Fixed regression in DataFrame.replace() and Series.replace()
  where compiled regular expressions would be ignored during
  replacement
- Bug in Styler whereby cell_ids argument had no effect due to
  other recent changes
- Bug in pandas.testing.assert_series_equal() and
  pandas.testing.assert_frame_equal() where extension dtypes
  were not ignored when check_dtypes was set to False
- Bug in to_timedelta() fails when arg is a Series with Int64
  dtype containing null values
- Bug in .groupby(..).rolling(..) where passing closed with
  column selection would raise a ValueError
- Bug in DataFrame constructor failing to raise ValueError in
  some cases when data and index have mismatched lengths

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200824145004.12568-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-pandas_1.1.0.bb =&gt; python3-pandas_1.1.1.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pandas_1.1.0.bb =&gt; python3-pandas_1.1.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-pandas_1.1.0.bb b/meta-python/recipes-devtools/python/python3-pandas_1.1.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-pandas_1.1.0.bb
rename to meta-python/recipes-devtools/python/python3-pandas_1.1.1.bb
index 7d65287cb..63ae69e3d 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_1.1.1.bb
@@ -6,8 +6,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://pandas.pydata.org/">&quot;http://pandas.pydata.org/&quot;</a>
 LICENSE = &quot;BSD-3-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=c2a8f987b2ce77c368c6b3e1b5b10774">&quot;file://LICENSE;md5=c2a8f987b2ce77c368c6b3e1b5b10774&quot;</a>
 
-SRC_URI[md5sum] = &quot;512da48424b85bf198002bdbdf38af5a&quot;
-SRC_URI[sha256sum] = &quot;b39508562ad0bb3f384b0db24da7d68a2608b9ddc85b1d931ccaaa92d5e45273&quot;
+SRC_URI[md5sum] = &quot;bb796b56c276ecea1a6a227010e9c56a&quot;
+SRC_URI[sha256sum] = &quot;53328284a7bb046e2e885fd1b8c078bd896d7fc4575b915d4936f54984a2ba67&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------E4B4D52BF17D80B12C7068F0--

Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.47])
 by mx.groups.io with SMTP id smtpd.web11.26419.1605714756070537369
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2020 07:52:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=PHzbM6dI;
 spf=pass (domain: windriver.com, ip: 40.107.77.47, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kx2kG85QuUGTqDdiEuQeMc8AjBjTng/s+HTz0JSiUMTIQUP79FBUWFV1HiEP+uNuo55m1Ntq/C1DoGLO8taCH9uWPmAsyyMX/IzQRkSG1ToXNeJKpWp/MVUB/RuWOO8ule5fh/F95dEOlz97mQPr71xg7fqYDHNZHJh+KrHqpUnbSeBVUdu2V9t7v6gr0PCivofL931St85tINQL8MorBIb9JV3Lz9xCj9RbBugtgmXGeOG2hGqbHEl2VfTl8Wem/Js3OUrKdUDvBvlzb8LIginEPrFwjFVLSibL2gYSoGaZ7d8j/ja/rXDdog7OZM1X2bSEw+E6mXM6O6iBk1vYng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PYj/KTZR+Z7LYEkX618eoG63qpV+ASezAkDAwHaKxTI=;
 b=iCtJS7m/JRlj6Lc8xdPI/UP9lBb6c/rVvMzAobXV19bQXbRRh208y0h4+k+BZnhQ3NfHhMaUT5CqBCncrEY7X/huiJ6PX+zaXycnTPPCBmTAH4SxdX5+PE37b5T55OYk2orP/N9EMnrbDZbDykbGsxuAFKJD5l1cQZmo+BemEnN86euaeGpLhVCjcu7IwPfRsyn6gEfqkOF1+yhTqNnyxB2b38irB1KM9pHxND7GthRfxSW1DaeWnvYQZh2ISVfHSRmnyycbxvAS4UsCN/4epMLTVz3QeJco1c7a8lcPdNOqaHnGuAGnIgRPTCn9g8QaXmeCQRRY8vrOdkqL32oeQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PYj/KTZR+Z7LYEkX618eoG63qpV+ASezAkDAwHaKxTI=;
 b=PHzbM6dIlYUxyApLrN40RUbxys57IVcG0dnORhlARGBADcSpg6CKnyRyTGtb7tOK+TyDLmpsBQD/BxoGX3sFSrP/csgZKe4lvW4ApnFBUBMTvka8ry8S4purilc5ejT05TPcxCCwJOvYlvTscpnffEPNlnM/IMaTouPVTdRJpcM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2598.namprd11.prod.outlook.com (2603:10b6:a02:cb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Wed, 18 Nov
 2020 15:52:34 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3541.029; Wed, 18 Nov 2020
 15:52:34 +0000
Subject: Re: [oe] [meta-python][PATCH 4/5] python3-pandas: Upgrade 1.1.3 -> 1.1.4
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201112105618.23773-1-leon.anavi@konsulko.com>
 <20201112105618.23773-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <0866d455-b70e-dc5b-e177-bdf3231772ef@windriver.com>
Date: Wed, 18 Nov 2020 10:52:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <20201112105618.23773-4-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YT1PR01CA0066.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::35) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0066.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend Transport; Wed, 18 Nov 2020 15:52:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bfa6b1cc-0ac1-4ba5-dae7-08d88bd9f70a
X-MS-TrafficTypeDiagnostic: BYAPR11MB2598:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2598D237049A1FD6CB64F4C69FE10@BYAPR11MB2598.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gyQDNQ7MYR6qZpmulvgFxDr3y1fX1fFV6B/cSKihlORyma7Amc/fZlGPWcEEU473TO6k3gEhE6DYnSvAOtJGUygxMZGHkslTImIkRY17trIq3wNGVe2uzr+uMNi+PDTbHMPKsqg9iE4FGyw3oR5M38LooZvFiC92z8nH4anqGWUArJUUfocXaxiCu2rIDA1aaf0gqpHPjZgnwuM/U9PNhxtGtZ9uK80VR3LT0vjNVUOZH2L6otLevxhB57t6Qcym1KN1j1AcHwSIdoJb71oCOTTN8R87LV+QwSrQ8bkTS9sg6iaZxx+KJhb/sS24vVhl2ugoJalzHS3UK+3p/yowbXfpJpfnT9O79xoTTsVcOAjSWcTc5hUq55zDAKwl72XIiBB39Z6vyGXZjscGuXEqrYW6R59B9NvQ7SQVnRvYFVswrvq8Oljdy4GB6QP0UiZuBoYenxIREVdMmbgp3MGdDA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(346002)(39850400004)(366004)(26005)(316002)(53546011)(33964004)(8676002)(478600001)(956004)(86362001)(66946007)(4001150100001)(966005)(52116002)(31696002)(166002)(66476007)(66556008)(31686004)(16526019)(2616005)(16576012)(8936002)(5660300002)(83380400001)(2906002)(186003)(6486002)(36756003)(44832011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	mEk/2MJTu3Wx6bFj80XkTQm6I2+UXA3YnAQlXRHVtFGjurq1+alEuS/YTgROABG05k+cueRPwZh8NKGe6Or07bUaCXgG32ne7owbKFyV/rPkbXHf6phy3XyNhDW47ecNrGZK9go1q2ZfJd9oxnc3PMQqMXcbpQbo9g4v4MMBD5wC6CS8aqep7L9rrmHwLGK7yCfPiKtf5fkDHiFKH0MDu9MX4ZIqgGmnYzo2RJJew6P3P/t/W0m63wQkRj+0MMj+NUSuUNDIWaN2F2EvsjkU2GBuWfB6yPrAFf1tpLKNt6aLXeox3viov+rggx1EZbJ6yLUBAKmgzmTvJIm/iKGAG0nQJoCdtIKiQiooL/u3oTCS1OX8vzHOQMBuU1/iGMvPGS7w6858Cy/UfEgrmfdrNpX0mioegchEIekwKNz0RHOp0MMeap20HNukUw34TtP0AFIpIH6ge3Sh7Hp3tVUM/oM9tutSMLuH6tFxKzNBK4MBO8NKWKshdkfvdRwUuTU+/RElNXilPDCPQFLCCl70TPoY6D3LWFgTM0rzSRrx4bczMNCTpI1azWtAjAfEONyhLaf4qN/8S/Nt4Ks+HgNonELA4+8/gqsCo0Ii1E0cfai1/eXwvj6HzQIB4OcbE2tuDQbRlrpwHBZwCDAj83Lp4w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfa6b1cc-0ac1-4ba5-dae7-08d88bd9f70a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 15:52:34.3711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kLVqRb60C/Ejm0TrEYG3sY1mr7oTIpfh+G7NpYbnwqwTJXJeGn7P9qvbchr1eLUHc4dOzMS9blEErTNdQGZG7+YlNMms88cKBh9jSVc7ft0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2598
Content-Type: multipart/alternative;
 boundary="------------B951B40A88D54CCC29B9D98B"
Content-Language: en-US

--------------B951B40A88D54CCC29B9D98B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2020-11-12 5:56 a.m., Leon Anavi wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 1.1.4:
>
> - Fixed regression in read_csv() raising a ValueError when names
>    was of type dict_keys
> - Fixed regression in read_csv() with more than 1M rows and
>    specifying a index_col argument
> - Fixed regression where attempting to mutate a DateOffset object
>    would no longer raise an AttributeError
> - Fixed regression where DataFrame.agg() would fail with TypeError
>    when passed positional arguments to be passed on to the
>    aggregation function
> - Fixed regression in RollingGroupby with sort=False not being
>    respected
> - Fixed regression in Series.astype() converting None to "nan"
>    when casting to string
> - Fixed regression in Series.rank() method failing for read-only
>    data
> - Fixed regression in RollingGroupby causing a segmentation fault
>    with Index of dtype object
> - Fixed regression in DataFrame.resample(...).apply(...)() raised
>    AttributeError when input was a DataFrame and only a Series was
>    evaluated
> - Fixed regression in DataFrame.groupby(..).std() with nullable
>    integer dtype
> - Fixed regression in PeriodDtype comparing both equal and unequal
>    to its string representation
> - Fixed regression where slicing DatetimeIndex raised AssertionError
>    on irregular time series with pd.NaT or on unsorted indices
> - Fixed regression in certain offsets (pd.offsets.Day() and below)
>    no longer being hashable
> - Fixed regression in StataReader which required chunksize to be
>    manually set when using an iterator to read a dataset
> - Fixed regression in setitem with DataFrame.iloc() which raised
>    error when trying to set a value while filtering with a boolean
>    list
> - Fixed regression in setitem with a Series getting aligned before
>    setting the values
> - Fixed regression in MultiIndex.is_monotonic_increasing returning
>    wrong results with NaN in at least one of the levels
> - Fixed regression in inplace arithmetic operation on a Series not
>    updating the parent DataFrame
> - Fixed bug causing groupby(...).sum() and similar to not preserve
>    metadata
> - Fixed bug in Series.isin() and DataFrame.isin() raising a
>    ValueError when the target was read-only
> - Fixed bug in GroupBy.fillna() that introduced a performance
>    regression after 1.0.5
> - Fixed bug in DataFrame.info() was raising a KeyError when the
>    DataFrame has integer column names
> - Fixed bug in DataFrameGroupby.apply() would drop a
>    CategoricalIndex when grouped on
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-pandas_1.1.3.bb => python3-pandas_1.1.4.bb}      | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pandas_1.1.3.bb => python3-pandas_1.1.4.bb} (83%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pandas_1.1.3.bb b/meta-python/recipes-devtools/python/python3-pandas_1.1.4.bb
> similarity index 83%
> rename from meta-python/recipes-devtools/python/python3-pandas_1.1.3.bb
> rename to meta-python/recipes-devtools/python/python3-pandas_1.1.4.bb
> index da1ffd0b6d..78730b46af 100644
> --- a/meta-python/recipes-devtools/python/python3-pandas_1.1.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-pandas_1.1.4.bb
> @@ -6,8 +6,8 @@ HOMEPAGE = "http://pandas.pydata.org/"
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=c2a8f987b2ce77c368c6b3e1b5b10774"
>
> -SRC_URI[md5sum] = "f10372d83a1c55cae217e8c05bf9bc5d"
> -SRC_URI[sha256sum] = "babbeda2f83b0686c9ad38d93b10516e68cdcd5771007eb80a763e98aaf44613"
> +SRC_URI[md5sum] = "594e6a429f297c77470e37d3510cccbb"
> +SRC_URI[sha256sum] = "a979d0404b135c63954dea79e6246c45dd45371a88631cdbb4877d844e6de3b6"
>
>   inherit pypi setuptools3
>
> --
> 2.17.1
>
>
> 
>

--------------B951B40A88D54CCC29B9D98B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-11-12 5:56 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201112105618.23773-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

Upgrade to release 1.1.4:

- Fixed regression in read_csv() raising a ValueError when names
  was of type dict_keys
- Fixed regression in read_csv() with more than 1M rows and
  specifying a index_col argument
- Fixed regression where attempting to mutate a DateOffset object
  would no longer raise an AttributeError
- Fixed regression where DataFrame.agg() would fail with TypeError
  when passed positional arguments to be passed on to the
  aggregation function
- Fixed regression in RollingGroupby with sort=False not being
  respected
- Fixed regression in Series.astype() converting None to &quot;nan&quot;
  when casting to string
- Fixed regression in Series.rank() method failing for read-only
  data
- Fixed regression in RollingGroupby causing a segmentation fault
  with Index of dtype object
- Fixed regression in DataFrame.resample(...).apply(...)() raised
  AttributeError when input was a DataFrame and only a Series was
  evaluated
- Fixed regression in DataFrame.groupby(..).std() with nullable
  integer dtype
- Fixed regression in PeriodDtype comparing both equal and unequal
  to its string representation
- Fixed regression where slicing DatetimeIndex raised AssertionError
  on irregular time series with pd.NaT or on unsorted indices
- Fixed regression in certain offsets (pd.offsets.Day() and below)
  no longer being hashable
- Fixed regression in StataReader which required chunksize to be
  manually set when using an iterator to read a dataset
- Fixed regression in setitem with DataFrame.iloc() which raised
  error when trying to set a value while filtering with a boolean
  list
- Fixed regression in setitem with a Series getting aligned before
  setting the values
- Fixed regression in MultiIndex.is_monotonic_increasing returning
  wrong results with NaN in at least one of the levels
- Fixed regression in inplace arithmetic operation on a Series not
  updating the parent DataFrame
- Fixed bug causing groupby(...).sum() and similar to not preserve
  metadata
- Fixed bug in Series.isin() and DataFrame.isin() raising a
  ValueError when the target was read-only
- Fixed bug in GroupBy.fillna() that introduced a performance
  regression after 1.0.5
- Fixed bug in DataFrame.info() was raising a KeyError when the
  DataFrame has integer column names
- Fixed bug in DataFrameGroupby.apply() would drop a
  CategoricalIndex when grouped on

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201112105618.23773-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-pandas_1.1.3.bb =&gt; python3-pandas_1.1.4.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pandas_1.1.3.bb =&gt; python3-pandas_1.1.4.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-pandas_1.1.3.bb b/meta-python/recipes-devtools/python/python3-pandas_1.1.4.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-pandas_1.1.3.bb
rename to meta-python/recipes-devtools/python/python3-pandas_1.1.4.bb
index da1ffd0b6d..78730b46af 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_1.1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_1.1.4.bb
@@ -6,8 +6,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://pandas.pydata.org/">&quot;http://pandas.pydata.org/&quot;</a>
 LICENSE = &quot;BSD-3-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=c2a8f987b2ce77c368c6b3e1b5b10774">&quot;file://LICENSE;md5=c2a8f987b2ce77c368c6b3e1b5b10774&quot;</a>

-SRC_URI[md5sum] = &quot;f10372d83a1c55cae217e8c05bf9bc5d&quot;
-SRC_URI[sha256sum] = &quot;babbeda2f83b0686c9ad38d93b10516e68cdcd5771007eb80a763e98aaf44613&quot;
+SRC_URI[md5sum] = &quot;594e6a429f297c77470e37d3510cccbb&quot;
+SRC_URI[sha256sum] = &quot;a979d0404b135c63954dea79e6246c45dd45371a88631cdbb4877d844e6de3b6&quot;

 inherit pypi setuptools3

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

--------------B951B40A88D54CCC29B9D98B--

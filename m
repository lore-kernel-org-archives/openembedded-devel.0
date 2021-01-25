Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.84])
 by mx.groups.io with SMTP id smtpd.web08.35717.1611578398800586768
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jan 2021 04:39:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=KWoGl2MA;
 spf=pass (domain: windriver.com, ip: 40.107.220.84, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tse01iatrO/vp3Oj5ORdSeXZ06wiIZ/cMtpNj6dMG8qBpmQdFfjjn677rYvBlBByzHo10ue/RSbAlVoWtelq/ObXt2nNks10d7ZGGoQkKVXV7C9RbONy3I9cyflw6fugq2uJo2Q9Syxq3GH2jTwKJKkRoGiO+YHv2oGq9e32U19SIyATVgWATGkInVSTZPyp6J8PFfxgtzoRmOIxyBWB4SGJDBAmaYP8bjdgLRCnUFV7TqrOQJ2Zd6w+TC/qxKzLPeuZzF4dz5sccmHI06xnNjULxLABmIppjO/YBbNRZskk7sZE1ztQMvRenNlDWwwbHzILGnsmjQkLc+NE5Nosuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4D4UaoU/XQTJmUwT5ffM2GkMXgJ6YiZ+a5sxwKjq3d4=;
 b=TkmVk4ifMivbbU+cy/B388fZVr1WW1CagNqeWZmFbnnaI2LY5b3M+TVodaRqpwO4Z+JchxrjPGL2/W0T5mA17kl+iPeh7U4fOnRRqYrFxYxjf+rdhs6SFW8/MLKtOvXE/rbYb127M/mxz7xIx0kTgVk7rrG7cicIlXGWGGof3RQIPz98tNjcbz97Eeapu8dCuTNwKCudkYm9OxntY4IEoHPyWzDw11dsN37oxKma2GIy6F6jycib8RNEaGEdkWrXpbtP8ZMxBJTwqyA6uJnCNs1j7/1cP7qjKOjAnfI2GpLxHE4jJekaqcByMc49Y2dacDmaJ4vY+8xDpc+1jvX9tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4D4UaoU/XQTJmUwT5ffM2GkMXgJ6YiZ+a5sxwKjq3d4=;
 b=KWoGl2MA7Go0XeGqVCcaXsxhzHHYc7O44SGIcNhAID1caoYXrObwvInsnWQo2OYqf0Vih8GUo5f5h67l2Jb0YdDPsyrnh9StvyTTQzjj1YlnItrA09NDX0t6+D9+HhN7QPdJtD5LoDiXCH3eVbNs8GEccsKfirKK2+Py2tWUOIo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from MN2PR11MB3919.namprd11.prod.outlook.com (2603:10b6:208:13b::27)
 by MN2PR11MB3984.namprd11.prod.outlook.com (2603:10b6:208:153::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Mon, 25 Jan
 2021 12:39:57 +0000
Received: from MN2PR11MB3919.namprd11.prod.outlook.com
 ([fe80::5462:9c04:72b3:6c44]) by MN2PR11MB3919.namprd11.prod.outlook.com
 ([fe80::5462:9c04:72b3:6c44%7]) with mapi id 15.20.3763.019; Mon, 25 Jan 2021
 12:39:57 +0000
Subject: Re: [oe] [meta-python][PATCH 1/2] python3-pandas: Upgrade 1.2.0 -> 1.2.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210120165300.8588-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <44cc317f-a1c5-8eb7-fc7d-4ca6d68890db@windriver.com>
Date: Mon, 25 Jan 2021 07:39:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210120165300.8588-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL0PR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:208:91::34) To MN2PR11MB3919.namprd11.prod.outlook.com
 (2603:10b6:208:13b::27)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL0PR05CA0024.namprd05.prod.outlook.com (2603:10b6:208:91::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.7 via Frontend Transport; Mon, 25 Jan 2021 12:39:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a2fdf97-3bd5-4d2b-7561-08d8c12e51f7
X-MS-TrafficTypeDiagnostic: MN2PR11MB3984:
X-Microsoft-Antispam-PRVS: 
	<MN2PR11MB3984A5E27756A6983A4C27CB9FBD9@MN2PR11MB3984.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kLNHfBjom4Dli2hPwIRauGK2wXn7bDLZPm2mSCw5NYyojSHPZOGg9zl3JVG63fD+xDIP+s8C+7nYCy9hgOWTuMLnEbn4HHYGkRgp5dHlNKQg6WhvgaBrclB2nDKpnHsc7eyQUe0pQCrsRf9VAxKE0W5DulhyBif0AQ0pwaiJXFD9RkzbHY3aoMp5yMGN12eOZikKGKyHGzIGgOWExsS8wVy4jcZnOTKriCIn51p1/YbNNUc+u6P/h/0pUeMHuyDaA5KY46ZoTGPifNIjJublfeQKIq/OLIbCmo1JK449LxlBalRGSQ2WHMCu6/DYo8DFz9xIyr+3OjWz0awTRB+9JHyJtYFt/TCmFkWn4T+/7NIgbU3JG2dwmaPepxjlIQqhgxK6pygQgOuHd2J3TGaiPNyNm8PqLQhvFEAgtf8LTtqBwohlRgCSfjiEYiFkyRB7gsezHR15H40qbS+StddoYnTfXiTkEYZP0sAPUt6dhhqXp/GQZR0AjJRTSAVi6l3n41/Y6IYpp61hycRQ0YZOzYKx5yewbPOZ1u9cBctpP5JShLZZv110YiZDOPO+z/Jl
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB3919.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(396003)(366004)(39840400004)(8936002)(33964004)(5660300002)(86362001)(31696002)(2616005)(6486002)(478600001)(44832011)(83380400001)(956004)(31686004)(966005)(66946007)(66476007)(66556008)(36756003)(8676002)(52116002)(2906002)(316002)(16576012)(186003)(16526019)(53546011)(26005)(166002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?b0NVc0R0Y1o5ZzcvMXZjbTZDbXVLQUpIYWRRc203Ylo5cHhjZHNXRlI2VVR5?=
 =?utf-8?B?dDBkbjB0cWR6cVhscnlSVWlJdVhRNVV5M0NtWlliQ2xvYUgzVFowM3ZPTThw?=
 =?utf-8?B?Tjh0MFZVbkJGeVNWVGNRc29WMWMrbmJDNndVRkVDSHRqekx6dEZiN2J6ODQz?=
 =?utf-8?B?SkRRZGw3N3ZOeFlGQjFkeXk1YUM2RFN3NExXMUwwdkJ6NDNUa3VIQkxJUkx3?=
 =?utf-8?B?UWNzaEJKQWVuKzVpcWFBb1h0Z01WRCtFSUkrSFlDVy8xTXVNRjRzYnVkY3V4?=
 =?utf-8?B?UkJoNVNHVGl0OUp2YUxQSGc1WHBQUXZCVVY5b0tIdE5TeCtMVnFVMmNpY0FM?=
 =?utf-8?B?SkJNcmJaNUlNbHI4eWlEMkVaYlAzRUZhKzUvTkdiSC9Ocm94NkFuczN0RGxl?=
 =?utf-8?B?cVNDWStvdjlITXpWR0djNHZFRUdkQmpxQzZtMmk4SHorNGxUanZSK3NJdVZI?=
 =?utf-8?B?cVpibFhqangyMTlGQXpVRVdDZ0xYUDU4dThzUVdvZjk1YkZGNWt1Q000bDF6?=
 =?utf-8?B?Zm5zSTJkNjV3bGd2WUVIODNqdlNCTHQ0c0NEQWIrTTAxS2prT2Fkb2xocks5?=
 =?utf-8?B?SjE4bG05cWY2TkkxM3ZVTk5PdnA4K0E1aFBHT1p2RXMzcW5zZVFaR0pUQUlQ?=
 =?utf-8?B?SHJuK1B3aWdGTDJIOHQ4dGpKUHJpUHFWOUl2OUpMKzNRd1FxU1hablFQSEtI?=
 =?utf-8?B?Y0hPVFFpOTNNRmx0WUNBWXZZTDh3M2FvYlp6ZFkvclJJQkhxbDNXLytlY1Z6?=
 =?utf-8?B?cmpyNWdFMkMwNnJYQW8xNVFjUkhTL2ZLZExJNERsWEswQkJnNW5tQ2xQNnk5?=
 =?utf-8?B?YmpWeGZqWGNxR1VRc05ESGJyUWlaYnVkT3Z6U2pIY1M1Y3htdHJzL1lrVzlm?=
 =?utf-8?B?R2ZuZlRZeUFqVkdrNU1rcVRhS3JEQ1dyOXJ6WVRQR1IzSmVwR1NwZlN3SFdP?=
 =?utf-8?B?STNPdmRnVXhySHJJQm5sYWNDT3JWTmlkTlk0MmxMdElMK3FBaWJubGtraFp4?=
 =?utf-8?B?SWVKR0FCbUlBeUVqZFVXOFRDclFqSjQ0cFJlSlJRY3NtQXFic052amVwNEcr?=
 =?utf-8?B?MHZvdkE1Q2ZiZVhPUVhoQzcvclZGTGZMcmRHNDVNMjJZRy9WN0R1enIzUW45?=
 =?utf-8?B?Nzg0MHNxRFNWT2hJdnlZdVJjUXVGOVdhSWVjS1lreUdjeGRuUHhybzdCU1Vu?=
 =?utf-8?B?MXZlckRpbEpGbjJJQUZYZGkzSTlKQU16VXRVRDBtYlJhWFRDWUdUclRhMHdi?=
 =?utf-8?B?eFdxeWpRU0cxRFdKSklXNEJrYlZ4M1g4Nm1CYjFmU1NxZGh6TXR6RDVTVzBO?=
 =?utf-8?Q?QsL8WcNrTEb8+xTqZygD8gHARih6oPiyKo?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a2fdf97-3bd5-4d2b-7561-08d8c12e51f7
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB3919.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 12:39:57.3156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p4kAqvpmqg896URon6rQIX67C+MwC/qvT6bU+HExuGlp6YFgjllwkDHUllB3x/dWKcxDBOLaipSkZxvqFl80OPe0aAFcaK0mhJ2zFhdjado=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3984
Content-Type: multipart/alternative;
 boundary="------------098E4977DD2A1A44D96B2EAB"
Content-Language: en-US

--------------098E4977DD2A1A44D96B2EAB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2021-01-20 11:52 a.m., Leon Anavi wrote:
> Upgrade to release 1.2.1:
>
> - Fixed regression in to_csv() that created corrupted zip files
>    when there were more rows than chunksize
> - Fixed regression in to_csv() opening codecs.StreamReaderWriter
>    in binary mode instead of in text mode
> - Fixed regression in read_csv() and other read functions were
>    the encoding error policy (errors) did not default to "replace"
>    when no encoding was specified
> - Fixed regression in read_excel() with non-rawbyte file handles
> - Fixed regression in DataFrame.to_stata() not removing the
>    created file when an error occured
> - Fixed regression in DataFrame.__setitem__ raising ValueError
>    when expanding DataFrame and new column is from type "0 - name"
> - Fixed regression in setting with DataFrame.loc() raising
>    ValueError when DataFrame has unsorted MultiIndex columns and
>    indexer is a scalar
> - Fixed regression in setting with DataFrame.loc() raising
>    KeyError with MultiIndex and list-like columns indexer enlarging
>    DataFrame
> - Fixed regression in groupby() with Categorical grouping column
>    not showing unused categories for grouped.indices
> - Fixed regression in GroupBy.sem() where the presence of
>    non-numeric columns would cause an error instead of being
>    dropped
> - Fixed regression in DataFrameGroupBy.diff() raising for int8 and
>    int16 columns
> - Fixed regression in DataFrame.groupby() when aggregating an
>    ExtensionDType that could fail for non-numeric values
> - Fixed regression in Rolling.skew() and Rolling.kurt() modifying
>    the object inplace
> - Fixed regression in DataFrame.any() and DataFrame.all() not
>    returning a result for tz-aware datetime64 columns
> - Fixed regression in DataFrame.apply() with axis=1 using str
>    accessor in apply function
> - Fixed regression in DataFrame.replace() raising ValueError when
>    DataFrame has dtype bytes
> - Fixed regression in Series.fillna() that raised RecursionError
>    with datetime64[ns, UTC] dtype
> - Fixed regression in comparisons between NaT and datetime.date
>    objects incorrectly returning True
> - Fixed regression in calling NumPy accumulate() ufuncs on
>    DataFrames, e.g. np.maximum.accumulate(df)
> - Fixed regression in repr of float-like strings of an object
>    dtype having trailing 0’s truncated after the decimal
> - Fixed regression that raised AttributeError with PyArrow
>    versions [0.16.0, 1.0.0)
> - Fixed regression in pandas.testing.assert_frame_equal() raising
>    TypeError with check_like=True when Index or columns have mixed
>    dtype
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-pandas_1.2.0.bb => python3-pandas_1.2.1.bb} | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-pandas_1.2.0.bb => python3-pandas_1.2.1.bb} (88%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pandas_1.2.0.bb b/meta-python/recipes-devtools/python/python3-pandas_1.2.1.bb
> similarity index 88%
> rename from meta-python/recipes-devtools/python/python3-pandas_1.2.0.bb
> rename to meta-python/recipes-devtools/python/python3-pandas_1.2.1.bb
> index 0cb631990..ae8a55f84 100644
> --- a/meta-python/recipes-devtools/python/python3-pandas_1.2.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pandas_1.2.1.bb
> @@ -6,7 +6,7 @@ HOMEPAGE = "http://pandas.pydata.org/"
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=c2a8f987b2ce77c368c6b3e1b5b10774"
>   
> -SRC_URI[sha256sum] = "e03386615b970b8b41da6a68afe717626741bb2431cec993640685614c0680e4"
> +SRC_URI[sha256sum] = "5527c5475d955c0bc9689c56865aaa2a7b13c504d6c44f0aadbf57b565af5ebd"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------098E4977DD2A1A44D96B2EAB
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-20 11:52 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210120165300.8588-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.2.1:

- Fixed regression in to_csv() that created corrupted zip files
  when there were more rows than chunksize
- Fixed regression in to_csv() opening codecs.StreamReaderWriter
  in binary mode instead of in text mode
- Fixed regression in read_csv() and other read functions were
  the encoding error policy (errors) did not default to &quot;replace&quot;
  when no encoding was specified
- Fixed regression in read_excel() with non-rawbyte file handles
- Fixed regression in DataFrame.to_stata() not removing the
  created file when an error occured
- Fixed regression in DataFrame.__setitem__ raising ValueError
  when expanding DataFrame and new column is from type &quot;0 - name&quot;
- Fixed regression in setting with DataFrame.loc() raising
  ValueError when DataFrame has unsorted MultiIndex columns and
  indexer is a scalar
- Fixed regression in setting with DataFrame.loc() raising
  KeyError with MultiIndex and list-like columns indexer enlarging
  DataFrame
- Fixed regression in groupby() with Categorical grouping column
  not showing unused categories for grouped.indices
- Fixed regression in GroupBy.sem() where the presence of
  non-numeric columns would cause an error instead of being
  dropped
- Fixed regression in DataFrameGroupBy.diff() raising for int8 and
  int16 columns
- Fixed regression in DataFrame.groupby() when aggregating an
  ExtensionDType that could fail for non-numeric values
- Fixed regression in Rolling.skew() and Rolling.kurt() modifying
  the object inplace
- Fixed regression in DataFrame.any() and DataFrame.all() not
  returning a result for tz-aware datetime64 columns
- Fixed regression in DataFrame.apply() with axis=1 using str
  accessor in apply function
- Fixed regression in DataFrame.replace() raising ValueError when
  DataFrame has dtype bytes
- Fixed regression in Series.fillna() that raised RecursionError
  with datetime64[ns, UTC] dtype
- Fixed regression in comparisons between NaT and datetime.date
  objects incorrectly returning True
- Fixed regression in calling NumPy accumulate() ufuncs on
  DataFrames, e.g. np.maximum.accumulate(df)
- Fixed regression in repr of float-like strings of an object
  dtype having trailing 0’s truncated after the decimal
- Fixed regression that raised AttributeError with PyArrow
  versions [0.16.0, 1.0.0)
- Fixed regression in pandas.testing.assert_frame_equal() raising
  TypeError with check_like=True when Index or columns have mixed
  dtype

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210120165300.8588-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-pandas_1.2.0.bb =&gt; python3-pandas_1.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pandas_1.2.0.bb =&gt; python3-pandas_1.2.1.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-pandas_1.2.0.bb b/meta-python/recipes-devtools/python/python3-pandas_1.2.1.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-pandas_1.2.0.bb
rename to meta-python/recipes-devtools/python/python3-pandas_1.2.1.bb
index 0cb631990..ae8a55f84 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_1.2.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://pandas.pydata.org/">&quot;http://pandas.pydata.org/&quot;</a>
 LICENSE = &quot;BSD-3-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=c2a8f987b2ce77c368c6b3e1b5b10774">&quot;file://LICENSE;md5=c2a8f987b2ce77c368c6b3e1b5b10774&quot;</a>
 
-SRC_URI[sha256sum] = &quot;e03386615b970b8b41da6a68afe717626741bb2431cec993640685614c0680e4&quot;
+SRC_URI[sha256sum] = &quot;5527c5475d955c0bc9689c56865aaa2a7b13c504d6c44f0aadbf57b565af5ebd&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------098E4977DD2A1A44D96B2EAB--

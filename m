Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.86])
 by mx.groups.io with SMTP id smtpd.web09.1012.1614620925225638058
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Mar 2021 09:48:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=IQ1oO/KR;
 spf=pass (domain: windriver.com, ip: 40.107.244.86, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eNWV71XTbQq9t+QyGVCZ697VgJlrTa+f38ZHFiuuOKdWLpq7FNKQXc/dKLRMLvbHc84faif0meemvkEDjrnyPABXnldjRbJaKJJHNemZD35Nz5GLHRsFB095fyLZONmN4su+vem787c6dzDtYLObVVablMibF/tGe2kNLCAzqf+r2RsI7ZX34gMuFS8+k/eJnzUML0BlxkKAGrjDTz0sUpskgJh0AHqz1RCB6mcxTP89iurAx0N4hSIpA4kk5KXtcQR1qJcKo8z21kXYvsckCn8wLIrOAVPGn4RQmgU1zIdZbeG+KIvwQmDnvl03nkhrf9MXZO+HpDFLspVF/QU2DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r8fRCai6MJ3uY0nzyj8MluDT0ll8NA7ZZaLM15pD/Io=;
 b=gN/rqdHH9iMERG9ylsNcEMUrlHKNAUNMABkIKZcyeh3qmdjAaau3Uar4boo6ZLMCn984SjiQRtVPKNPSbeDndMzBdHnrNwtN1erjnKkpz91h0MmfBx7DOWsLANzUSZvfSrH0WC/DatTljihrW2/3j8l7fhpYkVq5PjeIwn8AE98fzpijEa8CZvKmt79Qe348BHdPU4ekczNoX1PbwE9MUwADwY6O18RyyHnH8tc5z6gFFKjfBl3nYEnTS3iPVsxDXgA5GoD5UqrhghiiNLJOES+n6PwIcteJ4X6hYbkHO9vPLY12r4ejQ5K+LNrxqh1kx3oWJMdXJ6vpX3N1814FnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r8fRCai6MJ3uY0nzyj8MluDT0ll8NA7ZZaLM15pD/Io=;
 b=IQ1oO/KRKyHaxsU92THeMn05B0HEsqZOnk5YblLF8RnLRDp5uTATl9OU2NPRm10sFRfpK+3jXSPWx+jEoJ1JzO3W51VC+6Km2DKkpVgMPurPpADvxvk10ULhJXOw+KnZxLvTmdnatHRyiuD7cODDHYy4SNzq6XaiJhlv76xObsQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3670.namprd11.prod.outlook.com (2603:10b6:a03:f8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.28; Mon, 1 Mar
 2021 17:48:43 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3890.028; Mon, 1 Mar 2021
 17:48:43 +0000
Subject: Re: [oe] [meta-python][PATCH 2/5] python3-pandas: Upgrade 1.2.1 -> 1.2.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210224112512.31406-1-leon.anavi@konsulko.com>
 <20210224112512.31406-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <54206819-e292-b808-8b52-13b4a28a2f34@windriver.com>
Date: Mon, 1 Mar 2021 12:48:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210224112512.31406-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR15CA0051.namprd15.prod.outlook.com
 (2603:10b6:208:237::20) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR15CA0051.namprd15.prod.outlook.com (2603:10b6:208:237::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend Transport; Mon, 1 Mar 2021 17:48:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6333e0af-a79f-493d-9453-08d8dcda418b
X-MS-TrafficTypeDiagnostic: BYAPR11MB3670:
X-MS-Exchange-MinimumUrlDomainAge: pydata.org#3363
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB36702A19D98A6038E2968BD69F9A9@BYAPR11MB3670.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7fRgZrlyBjsVeXUh1tyP7YXSSmbgD3NfTfalO1NXJVD5VPieAn9MTKbJNIXbUPis9y2PQKKpmG0gzBha5pkTKP9TAm4USOoBPA2rxs8LPAWAGQ7LKov3IMa5DtsgukirogzQXXygMTrYsnAyKp8aHcLtbu7xlDMP95kX4R3FOrjhubvoqDs3O5N+zgOpH9Cxya95P/PYkgd1arCEpAr+DOWL/kffhl0vJFsceguMB+6ZxKy87Z8bpwxRwA2RH1bOn5zavsxFPd4qnN7L8iQru2yPtQFqpSEZtlaBnmET6PLAJOajRWn3MgANx4+2ivZLLVusopgwGpnHQAU9WZ9Pl70sQPeePw28a7JFVRWrDseJ26P75PmrWHslF9v6689+fi8LDOJosnydmxQEICAW74PXYvko9pKPPRZEA5wLK4tDxRZzUrMohJKMgduP66RyFVvGzQPhDAyAOzv8D/dC7+nsmmNjxilK9tXLfl9qPVQoKan0kIMlOX+E+jDEIerrV+XNGTpdtFv8s3GX7R/MP/JrhbdCwK4NqkC9Xlmfi/ZyYoi+q1dMx4e5Rz3v3R9KcugCV7W07nyvJFadP55twCILELNaKopaITqTwQAtxUKAAReS9Zxy3E4LJAYTrBAnu6F2uq+L0lQh+RjfaLWX+inDvlEDoUT+eA9tUQhybkdVy8FDW3TGf9JvhRUucjeg
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(346002)(39840400004)(136003)(366004)(966005)(2906002)(8936002)(16576012)(166002)(31696002)(478600001)(86362001)(8676002)(31686004)(44832011)(5660300002)(316002)(36756003)(26005)(66556008)(66946007)(66476007)(33964004)(2616005)(186003)(956004)(16526019)(83380400001)(6486002)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?d01aM1FFT1oybktaMWd3S3lKcDRjaUxQeGUxMklLaCthVkFVQjEzeGpTRlhz?=
 =?utf-8?B?ekE0ZHJTaW5RSEt6OTVzOENRSzZvTU44YUdjOWFuWExTcXZjWDQ5MnhHY3lv?=
 =?utf-8?B?cTlQYmpjdFh1Qm1RZUpsQ0pYVmJVWkxBdUhqWE94RnZhcTBnL2UzQkVPWjJH?=
 =?utf-8?B?ZW1ON0lxaHJNd2tZSDgxV3dqRVlqWUxSV1ZtVzR2YjJoR3pBUXRwYTRnSzJp?=
 =?utf-8?B?eVIxbUVySXBnUk90LzlnQUt1YThwT21FMTZNT3BhVHVRY2F2RzlKM1ZOTEpk?=
 =?utf-8?B?SS85K1VERkJlMldwa3hlTDRZV0c4Z2YxbUtJaTJVNS9UQ25ZZmtOekdpYnV2?=
 =?utf-8?B?aHN5S2hWSkV5S3ZoN0xHczljRkFQMjh1SVNvTGFCZUZwNEh6ZnlqM1kvM0dn?=
 =?utf-8?B?WGVGZi8yL1pGLzZNWGVjT04rdFJlSDZaNVJTQmFMQmMrQ3BlU2FsK1hqU25M?=
 =?utf-8?B?MlpJbk1tVnlxUjEvZkM0R1VINDVlck96dmtkdG00U05nS24vZExFTTVNTDQ1?=
 =?utf-8?B?RXpDZXlUUUl1bFhyamxGOFNBSzNlaUhCTk1hU045TmwyWmN4aEFpT1VpYk5K?=
 =?utf-8?B?Uzk0SmEyem56U3NnemJjcXdNN1Y3eHZ4N1phY01iUkNJWDhneTBiOERFZU15?=
 =?utf-8?B?N1l0b2U2VlJNNFUxRVYrNmNXK3JpMU1nQjBtcHVSVCtxM0VLV0s3cjk5R1Nh?=
 =?utf-8?B?ZERyQ2JWNnBDdUZ5dHd5YXZ5TlhVK3BiTUN6cDRLSmczdno1YmgwYjZNa1hB?=
 =?utf-8?B?T3lJN09sTndDNENLSWJkVE9KMEQ1OERoZE1kUUVzMkNxeVEwbkVKaGw4QkFE?=
 =?utf-8?B?OEZTRTVrZUxEdjdzNGNOOWs1SWlva1BHVXcvejQrUHZFcDlsbVVmSXhEZStV?=
 =?utf-8?B?Q1JZZU5VR0tXVzc3YkF6aDFYVi9RTm4ySEYxcUZmcXZiQjZub0xTazRteG00?=
 =?utf-8?B?QnZCc1hPS2c0RUp1V2NMdDRubE8xVUJjSi9FY1AzUDYyQkJvaVRXSkZnbUlv?=
 =?utf-8?B?MnpNVEdqb0dNc3o2alRKVUttWGRlWkcvVUdwbTlnVUF6Z2g1Tm1OOGF2VUdU?=
 =?utf-8?B?K0gxc2xBTjB1VUFsdTRUWkZtQzEyUUZpQ3RHQWcxZHBsUEJXYnNTRDhRMzZz?=
 =?utf-8?B?Vm1sbnpPTnM5K0lUdmZGR2h5RTg1REUySEg3bU9IWGxIbUZWay9lUFNKVTVx?=
 =?utf-8?B?eEd5dDBiMTBMVFZWeGdBeHh4SjdiSERmMkplbUZKNzJSWHYwU3FNMHp3Tmdw?=
 =?utf-8?B?Q09jNjF5NEZabWpMWkljSGhWdDFwMjFhRFZMMnMyWjlHNVU4dGpSRWFLMUYz?=
 =?utf-8?B?TW05aHpweC9Pd0xxTERMdkR4U1JpZzRIbE9JZUNvSk1aWG5jODMvUEorK3JB?=
 =?utf-8?B?aXhKSVRUM2lPdEkyMHFFK1Rmd3hVcTdzdUFmUnAwRXpuOWdjQ0I1VlRtMGNt?=
 =?utf-8?B?cHVyUlZUOHdVZXYreHBpU05sRnFEdS9JZ3FTKzk4bGxjR3pUaEx3SS9oWTJF?=
 =?utf-8?B?MTVFVjh1MUNQbEg2VkRzY29iNFN0QVhKTGlmMkdmd25MNkdSUm13SGIwWGx5?=
 =?utf-8?B?bi9KaHVPWGhnVUJzVzh1dm5sSlU1YlNhc3Y3L0hvQVNUSWkvc1lBTk5YRC93?=
 =?utf-8?B?SkZrVHplWDExazRCRFAvbnc1LzM4Vkl1MUF3OVM4bEpnazFyQVgvRGVjVmdB?=
 =?utf-8?B?cFdweGJHMHRPcFk3WUtwZXlLbWhXSnoyYzZTdmxnSmFKSFFpS2w1TURvamUw?=
 =?utf-8?Q?w/SeGaGrORp6r5k5zbe00cdJvbhIrjUuouPGgpX?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6333e0af-a79f-493d-9453-08d8dcda418b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2021 17:48:43.7061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SUDAR6FRYtiSeP8L8aykKRF4bZKzXcWbX2s/3xMFDRzsKc2MOxCAOKmxG3HrDWDwcYn5jFLhD6gcmhKjoNCykX5qKX3sg60U3AHkSpXFSCM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3670
Content-Type: multipart/alternative;
 boundary="------------3B9F2BE0F477D53BCAA20135"
Content-Language: en-US

--------------3B9F2BE0F477D53BCAA20135
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-24 6:25 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 1.2.2:
>
> - Fixed regression in read_excel() that caused it to raise
>    AttributeError when checking version of older xlrd versions
> - Fixed regression in DataFrame constructor reordering element
>    when construction from datetime ndarray with dtype not
>    "datetime64[ns]"
> - Fixed regression in DataFrame.astype() and Series.astype()
>    not casting to bytes dtype
> - Fixed regression in to_pickle() failing to create bz2/xz
>    compressed pickle files with protocol=5
> - Fixed regression in pandas.testing.assert_series_equal() and
>    pandas.testing.assert_frame_equal() always raising
>    AssertionError when comparing extension dtypes
> - Fixed regression in to_csv() opening codecs.StreamWriter in
>    binary mode instead of in text mode and ignoring user-provided
>    mode
> - Fixed regression in Categorical.astype() casting to incorrect
>    dtype when np.int32 is passed to dtype argument
> - Fixed regression in to_excel() creating corrupt files when
>    appending (mode="a") to an existing file
> - Fixed regression in DataFrame.transform() failing in case of an
>    empty DataFrame or Series
> - Fixed regression in groupby() or resample() when aggregating an
>    all-NaN or numeric object dtype column
> - Fixed regression in Rolling.count() where the min_periods
>    argument would be set to 0 after the operation
> - Fixed regression in read_excel() that incorrectly raised when
>    the argument io was a non-path and non-buffer and the engine
>    argument was specified
> - pandas.read_excel() error message when a specified sheetname
>    does not exist is now uniform across engines
> - Fixed bug in pandas.read_excel() producing incorrect results
>    when the engine openpyxl is used and the excel file is missing
>    or has incorrect dimension information; the fix requires
>    openpyxl >= 3.0.0, prior versions may still fail
> - Fixed bug in pandas.read_excel() sometimes producing a DataFrame
>    with trailing rows of np.nan when the engine openpyxl is used
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-pandas_1.2.1.bb => python3-pandas_1.2.2.bb} | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-pandas_1.2.1.bb => python3-pandas_1.2.2.bb} (88%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pandas_1.2.1.bb b/meta-python/recipes-devtools/python/python3-pandas_1.2.2.bb
> similarity index 88%
> rename from meta-python/recipes-devtools/python/python3-pandas_1.2.1.bb
> rename to meta-python/recipes-devtools/python/python3-pandas_1.2.2.bb
> index ae8a55f847..7529237866 100644
> --- a/meta-python/recipes-devtools/python/python3-pandas_1.2.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-pandas_1.2.2.bb
> @@ -6,7 +6,7 @@ HOMEPAGE = "http://pandas.pydata.org/"
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=c2a8f987b2ce77c368c6b3e1b5b10774"
>
> -SRC_URI[sha256sum] = "5527c5475d955c0bc9689c56865aaa2a7b13c504d6c44f0aadbf57b565af5ebd"
> +SRC_URI[sha256sum] = "14ed84b463e9b84c8ff9308a79b04bf591ae3122a376ee0f62c68a1bd917a773"
>
>   inherit pypi setuptools3
>
> --
> 2.17.1
>
>
> 
>

--------------3B9F2BE0F477D53BCAA20135
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-24 6:25 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210224112512.31406-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 1.2.2:

- Fixed regression in read_excel() that caused it to raise
  AttributeError when checking version of older xlrd versions
- Fixed regression in DataFrame constructor reordering element
  when construction from datetime ndarray with dtype not
  &quot;datetime64[ns]&quot;
- Fixed regression in DataFrame.astype() and Series.astype()
  not casting to bytes dtype
- Fixed regression in to_pickle() failing to create bz2/xz
  compressed pickle files with protocol=5
- Fixed regression in pandas.testing.assert_series_equal() and
  pandas.testing.assert_frame_equal() always raising
  AssertionError when comparing extension dtypes
- Fixed regression in to_csv() opening codecs.StreamWriter in
  binary mode instead of in text mode and ignoring user-provided
  mode
- Fixed regression in Categorical.astype() casting to incorrect
  dtype when np.int32 is passed to dtype argument
- Fixed regression in to_excel() creating corrupt files when
  appending (mode=&quot;a&quot;) to an existing file
- Fixed regression in DataFrame.transform() failing in case of an
  empty DataFrame or Series
- Fixed regression in groupby() or resample() when aggregating an
  all-NaN or numeric object dtype column
- Fixed regression in Rolling.count() where the min_periods
  argument would be set to 0 after the operation
- Fixed regression in read_excel() that incorrectly raised when
  the argument io was a non-path and non-buffer and the engine
  argument was specified
- pandas.read_excel() error message when a specified sheetname
  does not exist is now uniform across engines
- Fixed bug in pandas.read_excel() producing incorrect results
  when the engine openpyxl is used and the excel file is missing
  or has incorrect dimension information; the fix requires
  openpyxl &gt;= 3.0.0, prior versions may still fail
- Fixed bug in pandas.read_excel() sometimes producing a DataFrame
  with trailing rows of np.nan when the engine openpyxl is used

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210224112512.31406-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-pandas_1.2.1.bb =&gt; python3-pandas_1.2.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pandas_1.2.1.bb =&gt; python3-pandas_1.2.2.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-pandas_1.2.1.bb b/meta-python/recipes-devtools/python/python3-pandas_1.2.2.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-pandas_1.2.1.bb
rename to meta-python/recipes-devtools/python/python3-pandas_1.2.2.bb
index ae8a55f847..7529237866 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_1.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_1.2.2.bb
@@ -6,7 +6,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://pandas.pydata.org/">&quot;http://pandas.pydata.org/&quot;</a>
 LICENSE = &quot;BSD-3-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=c2a8f987b2ce77c368c6b3e1b5b10774">&quot;file://LICENSE;md5=c2a8f987b2ce77c368c6b3e1b5b10774&quot;</a>

-SRC_URI[sha256sum] = &quot;5527c5475d955c0bc9689c56865aaa2a7b13c504d6c44f0aadbf57b565af5ebd&quot;
+SRC_URI[sha256sum] = &quot;14ed84b463e9b84c8ff9308a79b04bf591ae3122a376ee0f62c68a1bd917a773&quot;

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

--------------3B9F2BE0F477D53BCAA20135--

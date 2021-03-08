Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.69])
 by mx.groups.io with SMTP id smtpd.web11.36319.1615212258005841509
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Mar 2021 06:04:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=pygTtS+x;
 spf=pass (domain: windriver.com, ip: 40.107.237.69, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K79QvoRNoVwgUpE6zGlUdwPEvuUzor4BuvRPIO8udrZSdbQ2xO3AmlBgsG12fdh6e3xdV2oIyOAwMgTskmiNtkWI6FwTuEFFNJDzdhAXUlkaXDGB3B9NwTK3bpi0JpUjcDfvW2gyr1W2cnv0BL/7kr93kR7A04+a2q9hdSFHvQcFUz3VbcXRGl/00Dm7c2n06MUmuaZ5Nbxmyr2QBIhZ/d/uh+bWoaUXEB6gK/+xWqn2CKeXGUPuK92Sup8hfKnko6p434csjEQqLvcCphW0RH/MKoOEhL219pomYLJbU3kw4gV9D3nZ7LgT85gFDek2JoI8mOtVxyw1DrUvmsUIlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1HBAD4ZM1A35vvVh7C5uZK8ty6A7CnZH1j52Bf8Rx8Q=;
 b=d01upYmx9QsIHI/eJYumf/E4FiEhvOdl+d00547hDV1FXcpXFDbBD/MKZAFTszYuZANw7YAsjhj5jM+xHtEh9lH9QNALuilOzzhJKeudO2WPw5XLhyvB4asAaXiudPp2uGq/eTT2P0nTLamiVJcvRIuKduDqKCRn8lJsApahGYPROGwdP3ZkN9D1gjAH15n2LtXRR5S6lfBWZnj38vnX7MSPyrIDfGnngDp/Wy4V5yU3MICcAGHtGXdN0vi7VZf/2Ke0H6Z9hp7fhk3GueLCGIhC3k92heeh6cAdLxy4CYfRbWc0neFTCn/QMcg5o2+MDWaHQg0pySwf5RFvZYG2uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1HBAD4ZM1A35vvVh7C5uZK8ty6A7CnZH1j52Bf8Rx8Q=;
 b=pygTtS+xIymQdBaXQI8g73abFg0MnS7ZTm1L+yTccK6kFQbmjVNRaVIoqXjO0+6b9ayS3Xes4Gs/LiRGAEWF2X9/EEfQE+hvdpd8WkFcSIqyKeDSFQcfq/gPeKqomirPV1GshDsuaTERCyZLyVa9cTQKab+veb2BC4R/sW+IVZc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4103.namprd11.prod.outlook.com (2603:10b6:a03:18c::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.26; Mon, 8 Mar
 2021 14:04:16 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3890.037; Mon, 8 Mar 2021
 14:04:16 +0000
Subject: Re: [oe] [meta-python][PATCH 5/5] python3-pandas: Upgrade 1.2.2 -> 1.2.3
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210304130554.32308-1-leon.anavi@konsulko.com>
 <20210304130554.32308-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <805bb555-8043-12f0-c2b6-5a32eb33043c@windriver.com>
Date: Mon, 8 Mar 2021 09:04:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210304130554.32308-5-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN9PR03CA0723.namprd03.prod.outlook.com
 (2603:10b6:408:110::8) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN9PR03CA0723.namprd03.prod.outlook.com (2603:10b6:408:110::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Mon, 8 Mar 2021 14:04:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 094e3435-e577-477f-01bb-08d8e23b0f65
X-MS-TrafficTypeDiagnostic: BY5PR11MB4103:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4103BA7E7907FA5C1F3F7CE19F939@BY5PR11MB4103.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	29CZHa19Ha8NAdkIhgQJQQDAWJoG6V4UmcFuvBSGB2S1fF2bDhLYbqe8igV8NaSV2asMBx+lxOeGttGIbPLE1TYuPVeQzCGTICWi8pbEYnXiatUvEq8LRA2/7j3QvlTtLkM/Yx3EMgF2IF0Ftzx50FYaBuy4FV/xR1/G6ljRPk9qrzwp7F7ops8U+7e+BXJEOuR+DNxS21gGK4c2cLwqg08uu/xdcC2Ci2gN4x1ODPs4Ezdb6uJzwK/aeuqM7D5akA3Lw1zvqtS01RbM2cwYZFZXLSRgNXFcKJ0/gThv4dqXTmdJZ3GYEQ3T4RPsB+/Rua1irL54UTdmUx+5OdV6rfm3FuUjf4KxN4oWchJ63KM6inGIUMgik6NjE6WdMBQRm2b6s+O8Hd1ZcxSZBrp+qAht0s6Xns88vKAxKQJxbgpPJjI3W/c/gTtbyzoRNuvTE2DloLlsqA2aiA5+aubDErJ/RUMnvPJRAWznaAZ9Vp8vUiYWl4hoSzQjUL/Y2tdI00c9rwwlq+jnkkg5cV5XfWVljS4rMjAAuv32HUK5pxCMCHrYHKvJY4P3sbCJvgE+XdzKaSAbtTIoMjR/k3aXQ95yv59AzB7BqQtms8ikVOSh93SP8Sm51TmkcCQteBMWcYwMDUWVw/VmjdyeWzJQAm8ucAYOYn7CLcB41OzaKz8Gl3qUfOJMAcD3SIDTLSx0
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(376002)(346002)(136003)(396003)(44832011)(66476007)(2906002)(83380400001)(16526019)(26005)(66556008)(36756003)(31686004)(86362001)(31696002)(16576012)(8676002)(6486002)(8936002)(956004)(478600001)(53546011)(316002)(2616005)(33964004)(166002)(66946007)(186003)(966005)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?cmlHam9YeUV2K2FXbDRNekNNUkxOcWVoS25mY1hnTXo2SSttMTV2UHU5dVV3?=
 =?utf-8?B?UUpXbWJxSlBXU1lGZHluWUF1WEhWU2I5Z3lIN2tNdEhsbmM4L0NzbFdVWnJT?=
 =?utf-8?B?RFFRRWh0Y2lpRGdjWVN1bGdtVjVSbEtFd0lCSEJ4WFVPUVllcVNJcFNZNk9z?=
 =?utf-8?B?MXAxV1ZCczllTnV6WlREUUxSMFJzejM3Um5wTkg2SzNUdlVyRm9jSUFIdGRx?=
 =?utf-8?B?ckdJY3VYLzhsNm9udnc5dGlLZldMdTZ3bFQwWmFIS3VMUnU1dERrQVE4c0ZS?=
 =?utf-8?B?eTZnK2x2ZDhUS2RkQ1U1VGV1eWhKRkwwTXpGVVBEd2ZBMGppMTZ2cmpEOUlh?=
 =?utf-8?B?c1BhdTJlRUloSytrOFVxVFg4MXJPYTN0a0tDL3U4bUdqeGpWRUhnSnNXTlFT?=
 =?utf-8?B?UEVXN09HVTJaWm1PeHpKSnYzbndIMDYyektwd2FPcXh5RDlyMHBiakZRaU9W?=
 =?utf-8?B?NThDNVMrVDdFSjAyaHY4VFkwVG85dHVjeUFYeE1kcHNtTU9aRzhCc0FlK0x1?=
 =?utf-8?B?dW1sR21iMWR6YysvbW5aUklSQkpZS2U2Q0ZucjJsY2V1UlFSYXQzNWs1eHVM?=
 =?utf-8?B?anVkM0tKdTgxTm1Sa2xRNVEzNHlQcG9jQVhKVTBaNEJYMUo4ZFhnenFJTHdo?=
 =?utf-8?B?dkZiangvU3VDMnNkckJYWXIvMDFMZ0JIWjhJVFJPR2M0bTdYbnhJNFNvSEdh?=
 =?utf-8?B?d000c1FvdmtzUXhoc1dSeEFTZG9RVDUvNUhxbDdLMUl0ZjdvY1hTdVZvUEx4?=
 =?utf-8?B?dGI2cCtmck9CTFZ4bWRDSjdMeTd3dFNxYVhxNHpYdDdkNmVMaHkvL01DdXdo?=
 =?utf-8?B?V1pINkVUOTNscDZFYlVqU0ZxZExOMDRrU1VEMmlFVFFrc2R6RUN2Q3F1Q3dp?=
 =?utf-8?B?RmNuVGR5QUxOQTNVc1J4SUYrQ1k3UFUvMnJ0cmtTOHhIblF0ZmdMZkQ3VHlq?=
 =?utf-8?B?ajlDMGRFeUhDczFHcFRaNSt1SGtHKzVEbU1DdUlqVElaNlhZazdBbmRSUXQw?=
 =?utf-8?B?Ynk3ZUlDWmxMNUs3bno1SWZFcW5qako1MkpWcGpoRTlteUZucitJQTBBWDhH?=
 =?utf-8?B?Wks5U1p3NzZQNDdLRWRIZHFxcmNRNkFCWWMwbzN1dmtYZkJCa3ppSVVGVjB5?=
 =?utf-8?B?TnVTT0JDeVdKRm4wZUtYVW9mZC8yMCtsdUY5RU42d2pVM2sxTXpQQW8vaEJz?=
 =?utf-8?B?alVTVi9zSy9yeEJTVENoaWVJRUhHZ1BoVldBTnBzOG9BVVA1ZlVrdlFNYlhu?=
 =?utf-8?B?dlRtaDgrMkZpRUptSi92K2ZMMmlreWRNTXh6VHJ0T3RwbDk2dnRXcjMvb1I0?=
 =?utf-8?B?R29KTGxwOFJyVDc1SU9YUlBRazVHWXIrUHVkRXBGTFBEQVBzYWxUS2RmODg1?=
 =?utf-8?B?WFdDcStzWEU4YXlqWEloQWxkWFBIMjhUeDJEd09PV1pxNmxDbUo1M1hIaDNE?=
 =?utf-8?B?SkMxWGNoRHpTT2RIR3ViYkIveGFwSzhrVFdOeUFySlNaRmo0ZjdXOEZ3NDZv?=
 =?utf-8?B?RitmY1FNVUY1dHlraUMwWUtYc0xJc0VJUDBUR0dLbjVLL3AvK2FRbS9LZkdi?=
 =?utf-8?B?bUpVSyt5cHRmNUxYbFlWYWZsdk5ZQnhCU0JyZm1CYXFMRHFmb21CQVc0c1Iw?=
 =?utf-8?B?UklLM1RnK3VaazVOcUJNay82eS9sOWYwcnNyb3hzd2ZqbHpvaHQ0Yk1EK3d0?=
 =?utf-8?B?T01RQzBDRmh0TkRybUl0azBFYkRhSlEvbjUrVWxwemZPS3ZtQ3RnbTFlRHV1?=
 =?utf-8?Q?/knjowuPCan/p+sBw+vbQndG1k/z7ZIOAtdrDFl?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 094e3435-e577-477f-01bb-08d8e23b0f65
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 14:04:16.4249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dfNqluBxbVLPmuomi85R2I2d1CJ8r+6x9dlmJsyzZzY+LhTBHbB6DNUfrQadsKpSrxLjTNWP8Clqz/hJVLGeHhA0I+iDznVbk8THNRxkKSY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4103
Content-Type: multipart/alternative;
 boundary="------------C2A1016244C44C8B0B0A7036"
Content-Language: en-US

--------------C2A1016244C44C8B0B0A7036
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-03-04 8:05 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 1.2.3:
>
> - Fixed regression in to_excel() raising KeyError when giving
>    duplicate columns with columns attribute
> - Fixed regression in nullable integer unary ops propagating mask
>    on assignment
> - Fixed regression in DataFrame.__setitem__() not aligning
>    DataFrame on right-hand side for boolean indexer
> - Fixed regression in to_json() failing to use compression with
>    URL-like paths that are internally opened in binary mode or with
>    user-provided file objects that are opened in binary mode
> - Fixed regression in Series.sort_index() and DataFrame.sort_index(),
>    which exited with an ungraceful error when having kwarg
>    ascending=None passed. Passing ascending=None is still considered
>    invalid, and the improved error message suggests a proper usage
>    (ascending must be a boolean or a list-like of boolean)
> - Fixed regression in DataFrame.transform() and Series.transform()
>    giving incorrect column labels when passed a dictionary with a
>    mix of list and non-list values
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-pandas_1.2.2.bb => python3-pandas_1.2.3.bb} | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-pandas_1.2.2.bb => python3-pandas_1.2.3.bb} (88%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pandas_1.2.2.bb b/meta-python/recipes-devtools/python/python3-pandas_1.2.3.bb
> similarity index 88%
> rename from meta-python/recipes-devtools/python/python3-pandas_1.2.2.bb
> rename to meta-python/recipes-devtools/python/python3-pandas_1.2.3.bb
> index 7529237866..8c36c21bb9 100644
> --- a/meta-python/recipes-devtools/python/python3-pandas_1.2.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-pandas_1.2.3.bb
> @@ -6,7 +6,7 @@ HOMEPAGE = "http://pandas.pydata.org/"
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=c2a8f987b2ce77c368c6b3e1b5b10774"
>
> -SRC_URI[sha256sum] = "14ed84b463e9b84c8ff9308a79b04bf591ae3122a376ee0f62c68a1bd917a773"
> +SRC_URI[sha256sum] = "df6f10b85aef7a5bb25259ad651ad1cc1d6bb09000595cab47e718cbac250b1d"
>
>   inherit pypi setuptools3
>
> --
> 2.17.1
>
>
> 
>

--------------C2A1016244C44C8B0B0A7036
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-03-04 8:05 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210304130554.32308-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 1.2.3:

- Fixed regression in to_excel() raising KeyError when giving
  duplicate columns with columns attribute
- Fixed regression in nullable integer unary ops propagating mask
  on assignment
- Fixed regression in DataFrame.__setitem__() not aligning
  DataFrame on right-hand side for boolean indexer
- Fixed regression in to_json() failing to use compression with
  URL-like paths that are internally opened in binary mode or with
  user-provided file objects that are opened in binary mode
- Fixed regression in Series.sort_index() and DataFrame.sort_index(),
  which exited with an ungraceful error when having kwarg
  ascending=None passed. Passing ascending=None is still considered
  invalid, and the improved error message suggests a proper usage
  (ascending must be a boolean or a list-like of boolean)
- Fixed regression in DataFrame.transform() and Series.transform()
  giving incorrect column labels when passed a dictionary with a
  mix of list and non-list values

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210304130554.32308-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-pandas_1.2.2.bb =&gt; python3-pandas_1.2.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pandas_1.2.2.bb =&gt; python3-pandas_1.2.3.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-pandas_1.2.2.bb b/meta-python/recipes-devtools/python/python3-pandas_1.2.3.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-pandas_1.2.2.bb
rename to meta-python/recipes-devtools/python/python3-pandas_1.2.3.bb
index 7529237866..8c36c21bb9 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_1.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_1.2.3.bb
@@ -6,7 +6,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://pandas.pydata.org/">&quot;http://pandas.pydata.org/&quot;</a>
 LICENSE = &quot;BSD-3-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=c2a8f987b2ce77c368c6b3e1b5b10774">&quot;file://LICENSE;md5=c2a8f987b2ce77c368c6b3e1b5b10774&quot;</a>

-SRC_URI[sha256sum] = &quot;14ed84b463e9b84c8ff9308a79b04bf591ae3122a376ee0f62c68a1bd917a773&quot;
+SRC_URI[sha256sum] = &quot;df6f10b85aef7a5bb25259ad651ad1cc1d6bb09000595cab47e718cbac250b1d&quot;

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

--------------C2A1016244C44C8B0B0A7036--

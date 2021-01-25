Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.77])
 by mx.groups.io with SMTP id smtpd.web08.35758.1611578628465579051
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jan 2021 04:43:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=JXrvx0IR;
 spf=pass (domain: windriver.com, ip: 40.107.244.77, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LcAzkJ4y6jLgtY8P+ECYqJc5/jz63gXus+oLo833g3Vp5fkVVkBfnlR1WEDcgp4wTdMz605+tl7tIK7vY1tHsdY2mJqO4jJT6B3ySoRqfw6yIupvM7L6EfZ9GUhpItK9IEtQ5Pi/Hp14Q7x72qFGrjNJ7eG3MoSGrgf1Ye68Fc7OMAIvdI6GtNhvm4Qoe3uAUMeFRFfrp1Ki3DCMX6dLePT0b1WGCf3cbKZyvhv84c9Nslw9gtumqAxvfV/AOseDWdnvKa4M8xv73bQO3Xn1qhf1d/uKgxCWG4vKslqS+EerpJMfGo5zFLsnAK6uO9aIf7g/Sz8d0sNgAi+Moll9yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PgOhSqFqz/sIEcLfdEdyfXLD5nOkaHsQhCc6O1DEtyo=;
 b=XA83qO1nkZ8j4QSqtj+Tgi0sQCjpmNnO4eGj3E5XYOdjDHdJn/IcTIE0N58s9ovqbtTZw+OQDqEifUIrmsR9dVHwEZYRMub4f1l6LzWZ4jFLNk4xnUuvMtLpHB00Dy1lw/Afgd5Rm/p0h9tgFTRLWz5DEwPtbn4G51kA8wtlBKWGR7tUFxmVY8LN9qR1yDyUv897PM9OqLvwiXLomUqYvQSk+9s+wL4IPDZc3ImhJJaP/DfqGIrQTE6haWJ48WHKEA8/aNNn5UgcEQmcTnGvJZ+Ma6rHfu57vQpswyo3dSW/Nj3dizQgGB95tkHJ1wXbSLHI5eChaiaFDomTCwA0+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PgOhSqFqz/sIEcLfdEdyfXLD5nOkaHsQhCc6O1DEtyo=;
 b=JXrvx0IRM7y41erBUmo0LQDTmrBfaHgGdl7NUoBn2lq2mL5ZrXbaG/NdTghQ5SFu1y/euT6rhqm6KDnawZ7pnC5muX318agB81YTci3lLLwxxTgvZdcQLgxf74Pfw/1cn7NJ91SI/rPQIewDjKAqklbJqS39+KfvxQSiJQL/aOc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from MN2PR11MB3919.namprd11.prod.outlook.com (2603:10b6:208:13b::27)
 by MN2PR11MB3678.namprd11.prod.outlook.com (2603:10b6:208:f8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.16; Mon, 25 Jan
 2021 12:43:47 +0000
Received: from MN2PR11MB3919.namprd11.prod.outlook.com
 ([fe80::5462:9c04:72b3:6c44]) by MN2PR11MB3919.namprd11.prod.outlook.com
 ([fe80::5462:9c04:72b3:6c44%7]) with mapi id 15.20.3763.019; Mon, 25 Jan 2021
 12:43:47 +0000
Subject: Re: [oe] [meta-python][PATCH 5/5] python3-prompt-toolkit: Upgrade 3.0.10 -> 3.0.11
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210122101126.25982-1-leon.anavi@konsulko.com>
 <20210122101126.25982-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <485cd2f8-f161-cd72-e19b-4a78cde8c20b@windriver.com>
Date: Mon, 25 Jan 2021 07:43:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210122101126.25982-5-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN9PR03CA0450.namprd03.prod.outlook.com
 (2603:10b6:408:113::35) To MN2PR11MB3919.namprd11.prod.outlook.com
 (2603:10b6:208:13b::27)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN9PR03CA0450.namprd03.prod.outlook.com (2603:10b6:408:113::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.14 via Frontend Transport; Mon, 25 Jan 2021 12:43:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37c7ecef-38cc-4e52-666f-08d8c12edbd1
X-MS-TrafficTypeDiagnostic: MN2PR11MB3678:
X-Microsoft-Antispam-PRVS: 
	<MN2PR11MB36785005409E0995E59C94129FBD9@MN2PR11MB3678.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WsoRrUAwaDxSKqoKmdyINQw2/xl8NTUAmUvtshKCfAi0DE/unNtUGucGH3PyHwl2K3T5nrcqG+c86VxKWYdzt85mVkJWqxEzuDv/pwI1sPA06qPt6aG27MACp6zurbDEHDbb1sML+89yc4xZGjMEZ4k06CtnGPwhWvClQGToe8D9zDzMx+zeYij9hVdBI+QP1SVf88gENue6ZP4Zaq5erE9rD8/9NMNJ5ms6rMjqKcoD6eXl8j66MpiwT2DHrjV/lpU8d3TLXvhagBfemeXnCzPz9CqNKToQ03Ow/l2aEeTQAzh8TT7tmyX/JgZ+dcezWPUqWmkDQOwUjt+X+yx/wmsYwguZOyABJxS0M8wyAPN9A6g/pzAUp6utHz/Eo4yUN5ka8waHkTItbaR2dv+/nlD3PmkaEcNV5jMjDQi9zluUreh35b/2MXBD6Zz0N9EsIjnNztK9suotLz74YZke6m9hGcu8I0VVB0pIV++4EF03/u1ZK0Cofd5oMxrOmbd1/puCDtXZaJuurSJP7uLI3986jB/fFaI0ArEbinsn2rw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB3919.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(366004)(39840400004)(346002)(33964004)(2906002)(966005)(478600001)(186003)(316002)(956004)(5660300002)(52116002)(166002)(66556008)(53546011)(66476007)(16526019)(8936002)(36756003)(6486002)(66946007)(26005)(31696002)(44832011)(31686004)(8676002)(86362001)(83380400001)(16576012)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?UmRJVmR6OE12VXJXN3VKTUZVdndZUlFnOHJYZk5GcjMvVFlnNUdSMTFMM0ph?=
 =?utf-8?B?ZExjQWpmNFF2NGltSm9QQmtZTHNKenl1RFBGWkx3SWVKMFJUa2h1YWF4aFJ4?=
 =?utf-8?B?OGpNa1BPbkZlNlZpZ0k0UzdiK0kzdG1FSk1FeWM3aTBtTkZpWEF2a3VOR1o1?=
 =?utf-8?B?REZpQUxnM0k3MWlzVDh2T2xLMzMraWpZK084QURVS25aVTFXNGxscGNLSHIv?=
 =?utf-8?B?N0lhNy9TTVZvdlNEdzQzWGhFQU56aENFdkV4Yk4zMXYrdDNLZWdCazJrUk9m?=
 =?utf-8?B?cUZURnpCbk1oQm5KRVQ0TUNmaDlTSFExQUVjbzFnY1l5VzFnbkVmNUpVRTh5?=
 =?utf-8?B?dEEyR0FyUDlXT0hnZmxhdnVDL09FRWcyalRpbVJ3L0hTbVRGV2xva2F4UHdr?=
 =?utf-8?B?REx4RDExMTRVWlhrbzRNZ21ORUVzUmJHamdvSGUwaVVyekdTZG1FanZoa0Ja?=
 =?utf-8?B?TEpKYnVTTi9FdW9IdUVYL2J0M0FkQlV5OVZ4cE1HOE9UcVZabWphaGxFL25w?=
 =?utf-8?B?a0dlMmpDMjFRK0pnYzc2NFJOR1dZQ21RdEhuc2VGV2dKZnBBWUlrTXJSaUVQ?=
 =?utf-8?B?MXZzZHYrWTB3cGgrU1dXcnNROUl2QmZtZ2d2SXZRbHdFanNrQ3pENER0YStM?=
 =?utf-8?B?UHZWWjN0b1hGNklsa2t2VXN3REN6YlJCUDZjSzZqWnU4TkNvMWNWRW5mVlVZ?=
 =?utf-8?B?aEJjNzR2Qk42RTJyVGNXVnd6VnlhY01iTWhjdG9GRXZBcVVlaXNhMVBpb1Jr?=
 =?utf-8?B?K0UwdGZDcmUyaHJNT3lJYkQzZUZuYmFhbnpLT0dTbFJVZmtEVXdIdlZ6QURp?=
 =?utf-8?B?K1U4Ni9uRTE5M3Q4bHdoVzRFK2gzcHlZRUI0d1NDa0pZWnVSSTl1aDdkWjNU?=
 =?utf-8?B?eC9WbWJOM3BtUVhUazc4b1ZNRlBVdDZBT212bzVwRU1FaGN0ZkhLbWQ2Z3Jx?=
 =?utf-8?B?ejh6RFhsS2JLTGJmQnJtZmxhSUlwbUd0enZ1M3ZucEJjUHpUVHZHS1Q1RWFW?=
 =?utf-8?B?WDkycEFGUGtqVDZIU1RlZng2Q0V5YWJsK2czVVROaEZoUWdjeUZKTU84TjJv?=
 =?utf-8?B?aExqVUxrZmF6SEp1K3JybDV5MXZlTkIwVlpPOHd2YVhDRzVtR3BSMmhSWjE2?=
 =?utf-8?B?aXMwT2Q3UTd4NzVFSGwvMWJlWEduTlNnVGNSaFAwU0JPdk5FQjlYOW1telY0?=
 =?utf-8?B?QmFtVzFUUlpaYmhMZkRBSmd2anZ4M254QlRrNFEwcHloa3NXVzhVcVRWeXQ5?=
 =?utf-8?B?QUVjVVYxNVdISkNtOEV4T0hvRmRmZFZhUGQxZ3hQWXFMa3BSSXY0Ky9SYzJr?=
 =?utf-8?Q?TFjNreSjfA5YWeKr3X80u4hJxwll5iRLWu?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37c7ecef-38cc-4e52-666f-08d8c12edbd1
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB3919.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 12:43:47.4914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3+DC+UJUpNqhlJkVh9YcMosUBeIf9h2G3trI5Km+YWo3bHLjoqIW8sZqJMIVHUGzFoYoIz2BIpk8GheXmTpB1VieQXHLTFK+3+yuNSgVJp4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3678
Content-Type: multipart/alternative;
 boundary="------------B13D20FCAD2D2BC76BC53CF0"
Content-Language: en-US

--------------B13D20FCAD2D2BC76BC53CF0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-22 5:11 a.m., Leon Anavi wrote:
> - Poll terminal size: better handle resize events when the
>    application runs in a thread other than the main thread (where
>    handling SIGWINCH doesn't work) or in the Windows console.
> - Fix bug in system toolbar. The execution of system commands was
>    broken.
> - A refactoring of patch_stdout that includes several fixes.
> - A refactoring of the `ThreadedHistory`, which includes several
>    fixes, in particular a race condition that happened when editing
>    input while a big history was still being loaded in the
>    background.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...rompt-toolkit_3.0.10.bb => python3-prompt-toolkit_3.0.11.bb} | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-prompt-toolkit_3.0.10.bb => python3-prompt-toolkit_3.0.11.bb} (86%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.10.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.11.bb
> similarity index 86%
> rename from meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.10.bb
> rename to meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.11.bb
> index abd9eb18c..0b832c064 100644
> --- a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.10.bb
> +++ b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.11.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://python-prompt-toolkit.readthedocs.io/"
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f"
>   
> -SRC_URI[sha256sum] = "b8b3d0bde65da350290c46a8f54f336b3cbf5464a4ac11239668d986852e79d5"
> +SRC_URI[sha256sum] = "dc83e6368b0edd9ceabe17a055f2e22f6ed95b9aa39dbd59d0b4f3585bdfe9ed"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------B13D20FCAD2D2BC76BC53CF0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-22 5:11 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210122101126.25982-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Poll terminal size: better handle resize events when the
  application runs in a thread other than the main thread (where
  handling SIGWINCH doesn't work) or in the Windows console.
- Fix bug in system toolbar. The execution of system commands was
  broken.
- A refactoring of patch_stdout that includes several fixes.
- A refactoring of the `ThreadedHistory`, which includes several
  fixes, in particular a race condition that happened when editing
  input while a big history was still being loaded in the
  background.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210122101126.25982-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...rompt-toolkit_3.0.10.bb =&gt; python3-prompt-toolkit_3.0.11.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-prompt-toolkit_3.0.10.bb =&gt; python3-prompt-toolkit_3.0.11.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.10.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.11.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.10.bb
rename to meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.11.bb
index abd9eb18c..0b832c064 100644
--- a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.10.bb
+++ b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.11.bb
@@ -3,7 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://python-prompt-toolkit.readthedocs.io/">&quot;https://python-prompt-toolkit.readthedocs.io/&quot;</a>
 LICENSE = &quot;BSD-3-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f">&quot;file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f&quot;</a>
 
-SRC_URI[sha256sum] = &quot;b8b3d0bde65da350290c46a8f54f336b3cbf5464a4ac11239668d986852e79d5&quot;
+SRC_URI[sha256sum] = &quot;dc83e6368b0edd9ceabe17a055f2e22f6ed95b9aa39dbd59d0b4f3585bdfe9ed&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------B13D20FCAD2D2BC76BC53CF0--

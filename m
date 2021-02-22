Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.55])
 by mx.groups.io with SMTP id smtpd.web11.34280.1613999897178744092
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Feb 2021 05:18:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=nMZIVNpm;
 spf=pass (domain: windriver.com, ip: 40.107.236.55, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eopQLyBiL7CJg1oQODa9yDDjERHWjAB2Ra2a67hIUskZ5zE8NcXn555qrhsaPN3ydH8ilys6hUNaILkjHAzv1GBNG40c1TH5Fmebbn8tDT5EHzXKMhznmrQhQpWtDi2WHMasnhdYA7KrrvJq5LhikfbZukOFRa53MBdhGh72yQpZodRo29THBuahOtWtNs+9t+fwsaZ0EJ0pYBA3ccdFEtHr5MJ9WayV6Iz+daMO3FMzRuBWanBtXCJfCFTNoIV9S+v23LSO75xDFhdnTLMhneUOf5ttx/hTqSgwt0q6u9nyMa/B1UVMnUqtI2ZdLvDusXlSaNiGUcEFBv+qxZHgVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IkVpAi7RcdxvCabJQolKTQIAI+ymMRhk5AZvge/PwQM=;
 b=ZWSbXfp5N/feoSalGbDaTQlswVNj1/lLJGa8UxelSsa75/WumDR7YD0u9AoHB4Kd77JlqpXqbOdIXqswVVPWrsOTZDQ1U5Zdandj5IWlPhCvyC4PzUpu2UKQMzI59e406S65UFi88bMn+Pf9AxW/ojn5CqX8ziCQCmQ5qplpRwXsC5tyRv0YHjmO+w3Ztct+nVmv9tSF1/lKnRbv955rjK7tlFdAIEWtjXGvIkzUi7yd4DH+58sF2HrpQ2NMKky8b6h986FMDCCTChXjimqGTXNGWJ2pHBNAvZNorQAh3gZIw2+Ke3YqCDysJSu8NQlWFCFbpuRFit9Dl+Rw+WbQyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IkVpAi7RcdxvCabJQolKTQIAI+ymMRhk5AZvge/PwQM=;
 b=nMZIVNpm2zfR807pPReboMDbt4mRLLHvxspSxlE2ErkndR0U5+cvZewaPhRWHlR13JuMVCJfAD43qvhEp5nZGjnVSjpiovLH5sylg+TZfrLrmFTcXUCKsRH+5sbI/kzLXGMFV7jVZ9dxTfWLgGODT6wbBW8odhxcFGkHZ2S8xx0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB3975.namprd11.prod.outlook.com (2603:10b6:a03:184::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.33; Mon, 22 Feb
 2021 13:18:15 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3868.032; Mon, 22 Feb 2021
 13:18:15 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-tqdm: update 4.57.0
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
 openembedded-devel@lists.openembedded.org
References: <20210219215412.2367782-1-open.source@oleksandr-kravchuk.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <0aa1ac65-169c-db25-bee7-af8e486b5786@windriver.com>
Date: Mon, 22 Feb 2021 08:18:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210219215412.2367782-1-open.source@oleksandr-kravchuk.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR16CA0035.namprd16.prod.outlook.com
 (2603:10b6:208:134::48) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR16CA0035.namprd16.prod.outlook.com (2603:10b6:208:134::48) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend Transport; Mon, 22 Feb 2021 13:18:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a94652a-7281-4a75-5e76-08d8d7345001
X-MS-TrafficTypeDiagnostic: BY5PR11MB3975:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB397535367CC490F05950A0F09F819@BY5PR11MB3975.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:538;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	w9p+w2FqWmk3eod0eAQVpsKCveWHDgbL8PnpRpmEPpyxwA6Wfkr8WJGD7epuKCi68NrLmzKVCIoGFA38SYeuzEJEXpDvKehR76s1IAYqgg5bj2ogPvNoFgrwKX72Ngb+NE/GzpjeCVHtZCpUCUC0Jj2zFNZF8337AOAnH1Xbglv28gtza8r0vu1CAQuyzuRP1/NL80r4xnZdejSApLBo5qG8rVstaq/PfbY0zP1EwPXJbpDEk/4jIbcp7hFULL0sL6515IeblK+xUSp2cw0dY5whw1fg0nqeacPUQROmUM7PkUN5AjT5kX+dWCleTdXKCaNqSNM+HVZMhXs4d9CgJXCXmbCr//0AnuHpjMKEz+15xDZ12DT5h0XeeVBniaUK2qOzsB701eMVlJZlTqt+GWKGDw19wGfoJ6akbdl5HwJ6A3OT0hFOfgsucXFDozpVInE7EBcqXFaXWks5W5zizdaUGJsMFI6zy9m01YqTrCHGhO3Qp7QZZy5gnW/cMfNxfb1yUWO+JAVF84Xbn4wTXW/YHNxslrckJxqtK+A27zLLiLAzlOgJpsGODpMW2gBvervjuLrJcBZwHfmZAPY2++bUd599Sk9J/gVj9sXgzZDuVx2jXI8c7DjDXDpM571vG31nDsreXKDI1Od1agjQIqfEsEbHYMHPtB+bs3zHbs7S8UkPzEXwcTv1PPdNFoGk
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(39850400004)(376002)(136003)(396003)(2906002)(83380400001)(478600001)(53546011)(15650500001)(16526019)(956004)(66946007)(26005)(966005)(31686004)(66476007)(66556008)(186003)(33964004)(31696002)(166002)(8676002)(44832011)(36756003)(2616005)(5660300002)(316002)(16576012)(86362001)(6486002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?MStnM3p2YThaeTBFc0VlcXFzTEFKc2hmekJGR0hMdkkvY3Z3clFNRk04eFNE?=
 =?utf-8?B?UkVKMjlqWkZhYkpRclBtQlFnMEFGRTlIcVBLV0xMNEczUUlqQ001eWVqZTRK?=
 =?utf-8?B?R3pWOTlISFZjVDkyMzJXSUt3VkpQNCs5LzAwYnRrQ0k1NGgxb1ZDMGZTMEY2?=
 =?utf-8?B?WFhLTmFLZHdKTDhNZEVpU1ZqVkRCSGdUVFFMaVRlM1BEdllvamIza0gvZk1m?=
 =?utf-8?B?M283cnhob0RtMnI1ZVdCMGVpYkVGWjFNeEthcVJwN0NYSjdhZ3Y5eDUzcmx4?=
 =?utf-8?B?Z1RmMzhNMVBrZ2pmY3BxcUhLdVdGYk1oRDVwbW9YNkNnQzNEWGlLRDVFSWZK?=
 =?utf-8?B?RHNHNjlqei9rdVFTR0FIY2pvS29nTi9kczlTVjIvcEhyejdZUDZWRk0zRnlH?=
 =?utf-8?B?eFA4Uk52cFo1ZFdlaUFkSXlxaTkyOG01SVYydFVOeHpyWm9BMzkzaGQxN3NJ?=
 =?utf-8?B?NGNZRWlDS3lvcnZGcFJucUtQOVhGZ3g4YjJIRXZuZFNndFQxZzhSUUJRWjdj?=
 =?utf-8?B?bi95UmdzaVZmQTR6ZkNnOStGL29UNmM1amMrZmpjUmNNVkhmNGFEZTJzWUs4?=
 =?utf-8?B?S0Y4ekM1S1g4Mk9vK0JrNFFMZXAxSVRQNlNXaGZXdDlwVXk4VytMdnlBNlRm?=
 =?utf-8?B?anNwVDc2ZmhwR1gxbnZnbzh6TFpqci9CVUtnMU9MSVlyRHp4Rm14a0dDTHh4?=
 =?utf-8?B?YVNxbTZEUzN1VnlpeFVKbXkzYVF0aWY1SU5oMkVjVXJHM1MybkVNT1RvM0Nu?=
 =?utf-8?B?VEJWQXRpdWQ5ZWpIVmgweTVtYk9xRXpDL2ZGeW5iRjJKdktFalhpSGhLZHBq?=
 =?utf-8?B?Wi9lbE5US3NtZmFUZ1ErYTZYU3JlaWVvbmgyaStVTklocXg1dm93VkZpMEt1?=
 =?utf-8?B?M0JMWi9WSmVXck1OWXFkUkVReHhYd3ZmN3haa0o0L1QwYVNZYjZYL09DK2w5?=
 =?utf-8?B?SXhzZkt2RXNVV1RTNXNkR1gvbFRIRDRyeXRKbTlTaUZVNmJYbERCL1BVZkdZ?=
 =?utf-8?B?Z0hiaUhRb3QxaTV3aUdJcU84MFV5NS9mbVBzcGdmaUNOU3NIT2ZBSjNFQUZr?=
 =?utf-8?B?MDFGNWVFOEE0QzNuQzR5OHlSbXRIRzdYZWFGTmN0MXp4V3RKY2VvVC9jK1Nx?=
 =?utf-8?B?b0RXUnZ0eEtlWXpqYVNkdnFiVDlBM29aM3EwMnFmZDU5Z1AwY3laaE1nY0Zz?=
 =?utf-8?B?THMxRzFpRC9kd1kxUTl4MkxDZmtWUWlBalRmem01RXRWUEZjdWZ3WHJZYzlD?=
 =?utf-8?B?U0xHT1IrNW1oTGoyV3o4TE1QWWllTngyOEFxeDlMeE5tRXZpajk4WllHSkFY?=
 =?utf-8?B?M2FxMnkzWW81cW5FNTR4M0VkaS80WW5BZ1ZoYXlWazRHVmYvQlBUYXJoUDB5?=
 =?utf-8?B?NTVwSytTN1hPWEVZc21TQm9BUkVhTjF1UGNkUlFPTmd3bGNhRGFEcklsUWxs?=
 =?utf-8?B?ZFFCVHBkdElKZmhwQ0VaK2xWbndtckltT1kxd04rdFNZTmJsV3V4OTJOeUt4?=
 =?utf-8?B?dUR6aXFXc3VScGJpdnNBYVlIS2pjSXF5TG9ldGdhclMwbXkxM013cE01blpR?=
 =?utf-8?B?RVE2VVZxM2k0UkVlZFd3L0VJNmgyY0VKTE1LQklDdVRpZktCUk5Ha2tMazNy?=
 =?utf-8?B?Zmo5dTh4aVBJdEdPaGdFeFhYS0l2Q1BMeHZOcEs2WHNFR2JkaWY4TkpyL0w1?=
 =?utf-8?B?MitYTXljSE5OZ3hmUG5La0pwSVFLRUNiTzRYdEtwVHpUV2cvU1ozazNJa3ZH?=
 =?utf-8?Q?5OiuWFqh/NoN6+HAVD3fvevavcVE47zLFPnKmPz?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a94652a-7281-4a75-5e76-08d8d7345001
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 13:18:15.5792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: skyDyCsJytfd2zFhWi5GOjghrSFotPd0BoVA02iqdd5DoXquzCkC7BeYWHhWpU1rg0tbnoIuVlUw9LpBp1wNezA61v7lnXWCEdonjnuqnlk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3975
Content-Type: multipart/alternative;
 boundary="------------EB74353FE97FF750CAF7EC06"
Content-Language: en-US

--------------EB74353FE97FF750CAF7EC06
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-19 4:54 p.m., Oleksandr Kravchuk wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> License-Update: copyright years.
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-tqdm_4.56.0.bb => python3-tqdm_4.57.0.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-tqdm_4.56.0.bb => python3-tqdm_4.57.0.bb} (60%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.56.0.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.57.0.bb
> similarity index 60%
> rename from meta-python/recipes-devtools/python/python3-tqdm_4.56.0.bb
> rename to meta-python/recipes-devtools/python/python3-tqdm_4.57.0.bb
> index d4baf6f22..50133bdad 100644
> --- a/meta-python/recipes-devtools/python/python3-tqdm_4.56.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-tqdm_4.57.0.bb
> @@ -3,9 +3,9 @@ HOMEPAGE = "http://tqdm.github.io/"
>   SECTION = "devel/python"
>
>   LICENSE = "MIT & MPL-2.0"
> -LIC_FILES_CHKSUM = "file://LICENCE;md5=7ea57584e3f8bbde2ae3e1537551de25"
> +LIC_FILES_CHKSUM = "file://LICENCE;md5=59e4271a933d33edfe60237db377a14b"
>
> -SRC_URI[sha256sum] = "fe3d08dd00a526850568d542ff9de9bbc2a09a791da3c334f3213d8d0bbbca65"
> +SRC_URI[sha256sum] = "65185676e9fdf20d154cffd1c5de8e39ef9696ff7e59fe0156b1b08e468736af"
>
>   inherit pypi setuptools3
>
> --
> 2.25.1
>
>
> 
>

--------------EB74353FE97FF750CAF7EC06
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-19 4:54 p.m., Oleksandr
      Kravchuk wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210219215412.2367782-1-open.source@oleksandr-kravchuk.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

License-Update: copyright years.

Signed-off-by: Oleksandr Kravchuk <a class="moz-txt-link-rfc2396E" href="mailto:open.source@oleksandr-kravchuk.com">&lt;open.source@oleksandr-kravchuk.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210219215412.2367782-1-open.source@oleksandr-kravchuk.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-tqdm_4.56.0.bb =&gt; python3-tqdm_4.57.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-tqdm_4.56.0.bb =&gt; python3-tqdm_4.57.0.bb} (60%)

diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.56.0.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.57.0.bb
similarity index 60%
rename from meta-python/recipes-devtools/python/python3-tqdm_4.56.0.bb
rename to meta-python/recipes-devtools/python/python3-tqdm_4.57.0.bb
index d4baf6f22..50133bdad 100644
--- a/meta-python/recipes-devtools/python/python3-tqdm_4.56.0.bb
+++ b/meta-python/recipes-devtools/python/python3-tqdm_4.57.0.bb
@@ -3,9 +3,9 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://tqdm.github.io/">&quot;http://tqdm.github.io/&quot;</a>
 SECTION = &quot;devel/python&quot;

 LICENSE = &quot;MIT &amp; MPL-2.0&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENCE;md5=7ea57584e3f8bbde2ae3e1537551de25">&quot;file://LICENCE;md5=7ea57584e3f8bbde2ae3e1537551de25&quot;</a>
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENCE;md5=59e4271a933d33edfe60237db377a14b">&quot;file://LICENCE;md5=59e4271a933d33edfe60237db377a14b&quot;</a>

-SRC_URI[sha256sum] = &quot;fe3d08dd00a526850568d542ff9de9bbc2a09a791da3c334f3213d8d0bbbca65&quot;
+SRC_URI[sha256sum] = &quot;65185676e9fdf20d154cffd1c5de8e39ef9696ff7e59fe0156b1b08e468736af&quot;

 inherit pypi setuptools3

--
2.25.1

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------EB74353FE97FF750CAF7EC06--

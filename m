Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.87])
 by mx.groups.io with SMTP id smtpd.web09.36049.1615212196716602331
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Mar 2021 06:03:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=PLz0Ttou;
 spf=pass (domain: windriver.com, ip: 40.107.237.87, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nTsB8/9W4WeyFjMPM9YPhBSXD3N2alxSEi2jWu5j0nftT0DPtpFC/V2VA6RWSx2xCg672UE6gtpGMHsbp8EAea1oJ7AK+wKL8q/25dslD/E6wBrBToTVVm4VE/K61/7cEsOQubW65ktrdSpo3LoMEwqWCks79y4wf+eXb3rmhhdntUmQ9vG7fxXS0udqOuySUTjgA3/VtQnuwcG43LDQ3zZaMoFRTg7HwCM8Xy4a0ymCR6OonR3eE26eDx2KTDehfN0uiBnYG8uuNg2EizZVnUAyXO5qwhzI9zx8q7YHWP4nb1EXbj4hK0dACrouRrIOc9njW3Fp9TfXi50VLiI7zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vvxMutjXoedWHeFJkzyYWoDtHHTzjVpOXqrn/1QXdjA=;
 b=fnxbHRKgWbxp4hJG6opih965nNzfBDCM1Gw6JVDKvBWO3rpA8E4cQpl+rz41Vg6ilZblwFFvR4dmCw9PsT6721lCBim/LwIwDR8glwmqkoj2m3abEaP4IK2knuxQvoFEj5vrouUn6/ig3u7IApOxCodbcukWxKjsQBYPp5X6uwvqfv7WPsESyBZVTtKhsiirdwZmJPtrmyJbnVswGPWIuQymCO4gEBxbuH4wXeXNbhw5k9z2wc4DO4kbDk3TmFnbn7tLvO3n0nlGX7rJx+cjR5epQTRcAKjv8ibC+YcUVcTQWTQpTx6SbKJ5sSD0CyPswot1Jog8Uqzix7zqK0mETg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vvxMutjXoedWHeFJkzyYWoDtHHTzjVpOXqrn/1QXdjA=;
 b=PLz0TtouSW1PXlvHws02q2TvxH1bc1OCcnmBVhAmY3NsKonwYEzH5YhSnUzcWzY1AMazLsEgI7ct7U/EsAKS7KXtWO4XkkDRRMIYgqsYSexPJdIdPjHc9jbY3DEHOJx+Gr81LsKBPixDQJDt2nHTWY683wRS/Qc9XGLoXXZCDlA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4103.namprd11.prod.outlook.com (2603:10b6:a03:18c::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.26; Mon, 8 Mar
 2021 14:03:10 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3890.037; Mon, 8 Mar 2021
 14:03:10 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-grpcio: Upgrade to 1.36.1
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20210303203016.2832532-1-raj.khem@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <9c94c2d6-19c1-fb72-2070-b522fbb921b9@windriver.com>
Date: Mon, 8 Mar 2021 09:03:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210303203016.2832532-1-raj.khem@gmail.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL0PR03CA0029.namprd03.prod.outlook.com
 (2603:10b6:208:2d::42) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL0PR03CA0029.namprd03.prod.outlook.com (2603:10b6:208:2d::42) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Mon, 8 Mar 2021 14:03:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ceafdce8-5a01-4f44-c301-08d8e23ae7da
X-MS-TrafficTypeDiagnostic: BY5PR11MB4103:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4103A525860F28FFDFD80F309F939@BY5PR11MB4103.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Qk1rVETQF8W0dA1q60ty4bM3Ptp5lpbJ4f94iA8VSKfpRmXlmq3drZ2xwByOo6QUqGc1hTkuIBgA9U54KpwBRl3+2DkfH35wp8yu1BsJhXIR7l2XneYyHGyzs8QdA2+yMid8vIMdQoq9kUFc0H+hMQGhGKNuEvD6N2HAnnQJVXbfI6dYs2T/w64xZuoy5wYpbdUXwzTcPjyAAYwQy70c3L58QJsyG8BRCdMcuotp8aM+FGxTaCMSfjnGkhmzscL43Nii6DZXvCN19/hgKjJkAM6Zva1sTaetaz+96Vsdt9QKLMFpgIWf+GuGSK/0um58x1txNeSFusr5VLBKu9N4uhUHSIm57DiouUkMMr3Kiz7XtqsMOvlH/XuSsml/sPGmwxpbhtm/65MLrUmGveI4anAcj1ffc8XxE+8GtElnafJS5fOMcc4Pu5UGMWjqyLxvTeVfZqdEn8lSk5YayY++4V78/iylhRzWVj2wc2CrZt7wt5Txbvz27Dnrp1064MAM6Uj8+Xmt2TtwSK+oawQgQJIRgClrvwae6yBPDIHjTkJCpfLKsKGVeGe9a5oVc3xIYXNrwzvdFMY9ZrBkgjmGrKqqvvdCvuTvauZU66+kI4oRR4jEg/deX1wXg+pFmh9gqpjTSu1Bq0Gwhb/BiO5afKL4A4Wd3FS1E/GvbXp30/f+e0x0kI0VqFSURAWKIiuX
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(376002)(346002)(136003)(396003)(44832011)(66476007)(2906002)(83380400001)(16526019)(26005)(66556008)(36756003)(31686004)(86362001)(31696002)(16576012)(8676002)(6486002)(8936002)(956004)(478600001)(53546011)(316002)(2616005)(33964004)(166002)(66946007)(186003)(966005)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?WE5VMEoyOHpSQ2I1dmdTdi96bVFXek9Vd01idGR1cXVVZWtyWmZVZjVTMjJ3?=
 =?utf-8?B?TEtlYzZISVp2cnJqczE5M0QrTHJuNDZJUjZydkFLT0dFSExyd0YvWjMvb1Q2?=
 =?utf-8?B?M3dWRUJ1K2luZVFNQWdPdVM5MWdab2tkU3BXWVJtT0cyQVYwT3J1NUlNNE1a?=
 =?utf-8?B?bkVQL2plY0JTUkVCaVNiaTBFMjQxR0hRK291TytMWlZiY2planNEVFdJd01z?=
 =?utf-8?B?blhpYkNzWkpNUmQyWnVSbXd4aGNIZTNiTDNMMElNSXdtSTJ6NExlQVFhem9F?=
 =?utf-8?B?bitrRmRkTG9xdG1wTy9WR3N4SU5RekxZMlVQTkc3VWRidzhIYWZRblZCamdE?=
 =?utf-8?B?eTZ0ZGJWZFdBYXA0cURwelliOTFpL2UvRGdPSEZlNUExT0dZWEVLWE5EckJP?=
 =?utf-8?B?Z2d3K0RpdmhpaUtycEJubThrcHJ3NFMyQUJkaVYxTFZ3dmZ4YWJlNXFVayt4?=
 =?utf-8?B?cHZ5K05Mb1FFWWJyL3BWbkRsSHBZYXJWVk9iYllwdmZoa2lGZWZoNWxHeXEv?=
 =?utf-8?B?eE1xTUZYQlNmZkwwSy94L2pjVlpNV24vaUl0MGNCbEtpelY0dThDSlhGTEc5?=
 =?utf-8?B?TTBsbk5ISGNNdlNZTWlTVmZ2NlBYcHlLb3NDdy9Ebk8zV2kxbENUVlFubStN?=
 =?utf-8?B?Ull1SkpzUkZvU2xuYmdCNURsZjZDbnhsODhjcnNBaHV3S0RWeVJGMVIydVpq?=
 =?utf-8?B?WUlsaVJPUzNXTFQweUZTUU0rcU1TMzZ2cEFNNnRrdXJEcFc1dTN1V1l0SHox?=
 =?utf-8?B?eFd4RVkrT0tMWmJtN01idVRSKzFaK3VvRWRsQzVhRVhxRWxlVlZ0WkFLTUU0?=
 =?utf-8?B?VWplVjdvNldTYlVEWWc3TUdrcTA0ZnJRUW5UL2FsMmVKa0MvNkhwUEFFMWFx?=
 =?utf-8?B?K0dqMk1USUl6M0MvQndaUEd3a0tqbnRFemRqaDUwcVVDZjNoS0FZcTVaeVNk?=
 =?utf-8?B?QWJ6amx2bkxWU0J1WE5MYy93L0NNWll3MGlEQXBsRHBHSWNJUTlMWkVpMVJP?=
 =?utf-8?B?cm11MGdPdzJ6NGY0b3VxMjQ1WnR1U081blR1SUltajNMN21yUzE0ZHZpRzBK?=
 =?utf-8?B?WEo2amg2VHNDdmRyeDd6REE4UVNxcWs0Q0pPMVliVDhIUlhCZEtUeHNvQUVi?=
 =?utf-8?B?L0h5Z2ZJMW8vd3NvNVJJaTk0Z2xPZUQ4NE9wU0orYXcyWjdPanVRejJzMlFs?=
 =?utf-8?B?S2JUVlVSRzhsZmpLNk95ZHFpanpjZ0ltbllQdWRzV3VXWVc2a0FkZlFsZWc4?=
 =?utf-8?B?VExDbVkvRlliMVJVb2c1ZlM0WXdyUkNidjNLU1VJbVJDREgwVWp2R0lJRWFQ?=
 =?utf-8?B?bnBITEZXb1l5Zkw5bnpXbGh3UWgydzA0anFwUTZRKzlqaTdzNVN3bDk0Mnlo?=
 =?utf-8?B?NDQxa3R6eXNZQnRIY0xVSmVCRDVaNmFZTDBEb1RiaVloZ0NRSThZYnBLZ3pM?=
 =?utf-8?B?VWxvY29EWWx6Q1ZIQzdnaThRaHNRb0pEUzJMWEZoUE00djdpVWcxMzVEakxs?=
 =?utf-8?B?SXlxZ0drVXF6NkFNcHdjTlN4SEZhRnhWdVhIdDB4SFA2Z25raUladDFSMjJr?=
 =?utf-8?B?dWRCV3RuTmUwWHVIb1dJVG9qanM5Z3NSU2FwYU9tbnVxUlVHRm9KZUxxQjJx?=
 =?utf-8?B?Skl1ekxNaEpqMjB5NGFlay96Rks0QVlRbWhDUWpITERoV3ptMUhaTWtrbUw4?=
 =?utf-8?B?aGFtWW9LU1JTci9lMEw0Yy9HdThIS3E2MnR5Rld0SVdYblpNL2R3VzZsdE1R?=
 =?utf-8?Q?cito0dMm8siIKrnas5iZTHXrCHB2CVYEPiXEvPt?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ceafdce8-5a01-4f44-c301-08d8e23ae7da
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 14:03:10.0448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l29ksfu9YtSA9zBhWJATZgZovolbFntvGuzhi1yMAivSN8RbS51UVpk5hnPgqe7j3U6PucFr9pKgV96b2EST8bgyDeG7sZzTZbJTirmWieQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4103
Content-Type: multipart/alternative;
 boundary="------------E7B8C6D77EA2AEE3DA813F58"
Content-Language: en-US

--------------E7B8C6D77EA2AEE3DA813F58
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-03-03 3:30 p.m., Khem Raj wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Release notes are here [1]
>
> See the differences after 1.35.0 upwards
>
> [1] https://github.com/grpc/grpc/releases
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-grpcio/ppc-boringssl-support.patch           | 2 +-
>   .../python/python3-grpcio/riscv64_support.patch                 | 2 +-
>   .../{python3-grpcio_1.35.0.bb => python3-grpcio_1.36.1.bb}      | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-grpcio_1.35.0.bb => python3-grpcio_1.36.1.bb} (93%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-grpcio/ppc-boringssl-support.patch b/meta-python/recipes-devtools/python/python3-grpcio/ppc-boringssl-support.patch
> index dadd3da85e..5c9be443d8 100644
> --- a/meta-python/recipes-devtools/python/python3-grpcio/ppc-boringssl-support.patch
> +++ b/meta-python/recipes-devtools/python/python3-grpcio/ppc-boringssl-support.patch
> @@ -12,6 +12,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   +#elif (defined(__PPC__) || defined(__powerpc__))
>   +#define OPENSSL_32_BIT
>   +#define OPENSSL_PPC
> - #elif defined(__mips__) && !defined(__LP64__)
> + #elif defined(__MIPSEL__) && !defined(__LP64__)
>    #define OPENSSL_32_BIT
>    #define OPENSSL_MIPS
> diff --git a/meta-python/recipes-devtools/python/python3-grpcio/riscv64_support.patch b/meta-python/recipes-devtools/python/python3-grpcio/riscv64_support.patch
> index 7e071ae1e6..350c67deaf 100644
> --- a/meta-python/recipes-devtools/python/python3-grpcio/riscv64_support.patch
> +++ b/meta-python/recipes-devtools/python/python3-grpcio/riscv64_support.patch
> @@ -5,7 +5,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   --- a/third_party/boringssl-with-bazel/src/include/openssl/base.h
>   +++ b/third_party/boringssl-with-bazel/src/include/openssl/base.h
>   @@ -108,6 +108,14 @@ extern "C" {
> - #elif defined(__mips__) && defined(__LP64__)
> + #elif defined(__MIPSEL__) && defined(__LP64__)
>    #define OPENSSL_64_BIT
>    #define OPENSSL_MIPS64
>   +#elif defined(__riscv)
> diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.35.0.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb
> similarity index 93%
> rename from meta-python/recipes-devtools/python/python3-grpcio_1.35.0.bb
> rename to meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb
> index 2c137f6ce7..d374b54b34 100644
> --- a/meta-python/recipes-devtools/python/python3-grpcio_1.35.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb
> @@ -11,7 +11,7 @@ SRC_URI_append_class-target = " file://ppc-boringssl-support.patch \
>                                   file://riscv64_support.patch \
>                                   file://boring_ssl.patch \
>   "
> -SRC_URI[sha256sum] = "7bd0ebbb14dde78bf66a1162efd29d3393e4e943952e2f339757aa48a184645c"
> +SRC_URI[sha256sum] = "a66ea59b20f3669df0f0c6a3bd57b985e5b2d1dcf3e4c29819bb8dc232d0fd38"
>
>   RDEPENDS_${PN} = "${PYTHON_PN}-protobuf \
>                     ${PYTHON_PN}-setuptools \
> --
> 2.30.1
>
>
> 
>

--------------E7B8C6D77EA2AEE3DA813F58
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-03-03 3:30 p.m., Khem Raj
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210303203016.2832532-1-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Release notes are here [1]

See the differences after 1.35.0 upwards

[1] <a class="moz-txt-link-freetext" href="https://github.com/grpc/grpc/releases">https://github.com/grpc/grpc/releases</a>

Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210303203016.2832532-1-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-grpcio/ppc-boringssl-support.patch           | 2 +-
 .../python/python3-grpcio/riscv64_support.patch                 | 2 +-
 .../{python3-grpcio_1.35.0.bb =&gt; python3-grpcio_1.36.1.bb}      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio_1.35.0.bb =&gt; python3-grpcio_1.36.1.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio/ppc-boringssl-support.patch b/meta-python/recipes-devtools/python/python3-grpcio/ppc-boringssl-support.patch
index dadd3da85e..5c9be443d8 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio/ppc-boringssl-support.patch
+++ b/meta-python/recipes-devtools/python/python3-grpcio/ppc-boringssl-support.patch
@@ -12,6 +12,6 @@ Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
 +#elif (defined(__PPC__) || defined(__powerpc__))
 +#define OPENSSL_32_BIT
 +#define OPENSSL_PPC
- #elif defined(__mips__) &amp;&amp; !defined(__LP64__)
+ #elif defined(__MIPSEL__) &amp;&amp; !defined(__LP64__)
  #define OPENSSL_32_BIT
  #define OPENSSL_MIPS
diff --git a/meta-python/recipes-devtools/python/python3-grpcio/riscv64_support.patch b/meta-python/recipes-devtools/python/python3-grpcio/riscv64_support.patch
index 7e071ae1e6..350c67deaf 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio/riscv64_support.patch
+++ b/meta-python/recipes-devtools/python/python3-grpcio/riscv64_support.patch
@@ -5,7 +5,7 @@ Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
 --- a/third_party/boringssl-with-bazel/src/include/openssl/base.h
 +++ b/third_party/boringssl-with-bazel/src/include/openssl/base.h
 @@ -108,6 +108,14 @@ extern &quot;C&quot; {
- #elif defined(__mips__) &amp;&amp; defined(__LP64__)
+ #elif defined(__MIPSEL__) &amp;&amp; defined(__LP64__)
  #define OPENSSL_64_BIT
  #define OPENSSL_MIPS64
 +#elif defined(__riscv)
diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.35.0.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-grpcio_1.35.0.bb
rename to meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb
index 2c137f6ce7..d374b54b34 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.35.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb
@@ -11,7 +11,7 @@ SRC_URI_append_class-target = <a class="moz-txt-link-rfc2396E" href="file://ppc-boringssl-support.patch\file://riscv64_support.patch\file://boring_ssl.patch\">&quot; file://ppc-boringssl-support.patch \
                                 file://riscv64_support.patch \
                                 file://boring_ssl.patch \
 &quot;</a>
-SRC_URI[sha256sum] = &quot;7bd0ebbb14dde78bf66a1162efd29d3393e4e943952e2f339757aa48a184645c&quot;
+SRC_URI[sha256sum] = &quot;a66ea59b20f3669df0f0c6a3bd57b985e5b2d1dcf3e4c29819bb8dc232d0fd38&quot;

 RDEPENDS_${PN} = &quot;${PYTHON_PN}-protobuf \
                   ${PYTHON_PN}-setuptools \
--
2.30.1

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------E7B8C6D77EA2AEE3DA813F58--

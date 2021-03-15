Received: from NAM04-DM6-obe.outbound.protection.outlook.com (NAM04-DM6-obe.outbound.protection.outlook.com [40.107.102.78])
 by mx.groups.io with SMTP id smtpd.web09.8315.1615813429540327819
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Mar 2021 06:03:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=nmTRwr4Q;
 spf=pass (domain: windriver.com, ip: 40.107.102.78, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PQ7PpwKG84BNas3MiI56l7H659O81xZ/62IcTpPAPANrWbXu0AhPWTONGdyU4D0CEeTQRyl0CBNS0Lv7if8DZ8TrBXjMAK1wHcDeLzImcdRMJXOGp1/p9EDj8Tscj5wP4lvSk+9rsl2m42xa860c+qFVQ6P8zanpN3yFlkfrXIzlAXUINQCbwoObbORThVJ/7RGJ4lcmn6ImKFvpxONis7SlOXXBX78Zrk2H3qU5pkpXnUI2iRE99NoRVJsb0eZrCRMoBpA7fX2uREF1kf6HeY3uzU4MnaYE8NCBMsbCQSIlKKp8OE2DxX2VXF3S9ln3z4vLGg2HH/GjWR9IRBkUsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJreEur4JYR9MMwMAGK5D68uZraGgzjaoA93Wdixb6c=;
 b=GBD9eKNHvR1y8LVIU6jolFOtr+BOvWPgrKP1zU6iTQtMvFxaV4wyYOQ5qmap9/ajjx5Tif2Hgrkkvy3FUcyIOYSDIUvSYCS2TN+dzUOuyfyhoo7//AW5aEA7Ej8kRwmj/xpLBjUCPeGwnOz8kvZFyxpq66eO289LDZBqeAEJomzmqUM9ELegxwj8iPpfEOi3z1bb5K+/aTjXANfrhJ1g/JfFBwbFVH52bHF2jW+IFgXefDry78hw5nOcDWDeWjlX8BvVaAUMheIM/d/wlxRsztPlbUaXsAOzshBcyvI3G9h1iqlmuW2WvyZgi+N7f0YD+NXmRE2/3icuCRIC9Bua5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJreEur4JYR9MMwMAGK5D68uZraGgzjaoA93Wdixb6c=;
 b=nmTRwr4Qlm1pdrX2KS7pLsr9Qbpk3W7+HY7bkYt/6vFlGddCkTkAp2P9BTljAlCVro8SzHyhAeoE6cJ/F3/0zBk0V8UCDwetAvp5faACIOtF86euxeeTwU3i9khybDSSXUurRQUUaz72wpu+K1WSWiiaP9elvgyBh7dWtn0J58s=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2920.namprd11.prod.outlook.com (2603:10b6:a03:82::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Mon, 15 Mar
 2021 13:03:46 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 13:03:46 +0000
Subject: Re: [oe] [meta-python][PATCH 2/2] python3-grpcio,python3-grpcio-tools: Enable build on ppc64/glibc
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20210313183047.402000-1-raj.khem@gmail.com>
 <20210313183047.402000-2-raj.khem@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <c410e7b2-9573-25a6-4efc-56ea0e777bb1@windriver.com>
Date: Mon, 15 Mar 2021 09:03:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210313183047.402000-2-raj.khem@gmail.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN0PR02CA0024.namprd02.prod.outlook.com
 (2603:10b6:408:e4::29) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN0PR02CA0024.namprd02.prod.outlook.com (2603:10b6:408:e4::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend Transport; Mon, 15 Mar 2021 13:03:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7ca1278-503a-4379-05cf-08d8e7b2c483
X-MS-TrafficTypeDiagnostic: BYAPR11MB2920:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2920FE33B0F49AE5B6F36ED29F6C9@BYAPR11MB2920.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4u8zlMVc+3gWq6Y5tOkSSutk5HHQkYXJoRyEhjYH+4G2wYn7D5YZGDBfMH4+QXlRCcUHfuNl0/E3Ml5ILCxxDJOOC4NCc4umFTCxTTTPmVgptTZQgusYooLbJnBoBBceUyhf/YFKDuMlB8nGiU75Cu8eTWrnp489SZOnjTjGSQs63rfg9dL9mBLwPU/BgvazjIra9SEQfU++R7WMD1peh2Ro6d6pKTbi4ZjuZl1UCV/IGj2pA0h09A5XgYieSK1xOWennL2ETJdUj0b+qEqA2TKtO54TFcJXzKQJUwuOzzYcqRCjusNJGhkvJ5zGS/oXqPI38o2R1afPducND+4CknPjQjqgCpiy0Pq4kLrcMyLrM5OYVLCNXxOjC9cbOLabRjC5HbXqnEAX8WcM5aRDP176b0IpShngEBCL5gQ6m9xaxGAabfx1Ar41m3iIUi/bONh/w3QveMvsqz2z4WxwkAiR9kwOrt9jWmXLxr3vjl7Kvepn/XtFB9Zo5k4/wcqCxchzvxuPZChZg+lrnPz4eEYnxaGvVes5EhDaPmvTqV1dGIGrCmdijKYZX0o2a+QjiEcOMAD9ZoABrXYBPghuMZSAyyEji2Im8mv+v2CeoG45UUXlHk5cUMbVIvhR7WMru8bWTJvdIIfWlT6H994PBdaOTyt01oWW80qgQZqMjp4/j3EeQjQVUsjwmNvSVgi3JkBZzXhqYQkpFgh8qclnyqudjcHbPl/GKFbBGh5TCUc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(346002)(366004)(39850400004)(2906002)(33964004)(31686004)(2616005)(5660300002)(186003)(16526019)(26005)(6486002)(16576012)(166002)(966005)(8676002)(478600001)(956004)(53546011)(316002)(66556008)(66476007)(8936002)(36756003)(83380400001)(44832011)(31696002)(66946007)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?VVlJM290U2U3QXBLaWZhbE9UM3VIUmNMMVdGdmQ5Yis3SUp0UjNOWlhIMGU4?=
 =?utf-8?B?OElWcVBVVUZaMkN4Z0h2cE96RWJBbXlpREVaTnI2dkNLb2lRekZ6T0VBcHJy?=
 =?utf-8?B?K2lGQk53YUZVZTVncTNsY2I3Tm1HZWxZZ0U4Snp2SHZDbkFWMStodTFXN0VK?=
 =?utf-8?B?NEtSSXArRlpCWkpRb3poWTRJNUlWOWhWUlJGaDZKQm41b09mOGFOazFtWS9P?=
 =?utf-8?B?emRpYUxNMVBKdG1vQmtONjhNb28zWC9pSVA0RzgxRjBRT05wbnpOVHRtMGpC?=
 =?utf-8?B?SGVVOE8xRmhQR0luNGQyZnJpYUZmWTl4WlFKS2ZsUnorQ2FCazB3c3B5NlFQ?=
 =?utf-8?B?T2tvQTR4VmFrb2k5UHdqN09sMXlOMXh6bTVLTWNVcVVsbGs1MU91TElZTkFG?=
 =?utf-8?B?ejFmSTJZa3pIODN2OFA1MlVGWlhueFFHOFUrTGVrZDdaM25DZzRTcEJ6amJl?=
 =?utf-8?B?UWxtTzQ5YW1MRnd3OWN1Q2wyMXBxOTFxS2NtTFlHbHI3YXVWWlp1TDQ5Tkp1?=
 =?utf-8?B?Nmpneks4NFNTdlBHYlZUM1NSc2JLNWkvNzQrWWJSL0wwZThESStlU0w0SUI1?=
 =?utf-8?B?b1FSTUE4WERucXo5ZmNzcXVveUN2cUx1bGc2RnI3Vnd6Nm96dFFZOUdiR3dJ?=
 =?utf-8?B?bjF3UVpFTkFQaVJ2Qm9EMDBESXBDZHlKOVAwcnAyNjdTUDJjSFYrYWJtZWJ2?=
 =?utf-8?B?UmRYMUJMT2pLOVBRdjNXUDFxbXpwYTJ6aG1HOHFJRlZQcWkwenNjTmxwYmNv?=
 =?utf-8?B?SzNWZnZsRWtHbFI1U0NPNTg3L1Bha0xhR1BUSzMybHYrRFljckVJalo4dkVQ?=
 =?utf-8?B?TFVXemJPQnIyK1IzOG5uS0RlSzVJTVFrTkRZS2svMGtzckxPeWd3enpvbzNN?=
 =?utf-8?B?K3h1dXhOMXBzV0hubXRHK2pxelFDdU5NaGFycDhDNTB5VjcySzhNdkprWngz?=
 =?utf-8?B?Tjl6S3NWcWdnUjhqT0ZFSWU5TkNFNlMyV3NrZ0UxbVRJVU53dDdxUXFYZDFt?=
 =?utf-8?B?dHFjcUlQdG82TW1ReUpaQWdWTHU1b1VtUkVuTGl4RXQzVXo0ZGlRTFlBaGcv?=
 =?utf-8?B?QWVYOXJuUThYbUFvQkZBNExkR0hLMkIvYnRyZDVjcVp4OFJ4QTNRT0xVNC9p?=
 =?utf-8?B?VWVSRmFzUkt5L2FyaTBieVhXRE9vUVFsQVNwZ05pL2ZUeVdNenNMRlNvQWJi?=
 =?utf-8?B?MTJKRFFYS2p0NHI4enRjaWxTeFV4V3BwTUc3QnZkMjBtcGJIbHpmQ0tTdkhU?=
 =?utf-8?B?RVBHMTRBYVdjSDczZ1BybHdDc2hVZGc2SHhTVVJkS3BhWU43U3JHdGEvdnFP?=
 =?utf-8?B?Nzc3UHRUNk5oWWg5WmZqbyt5WDZsREhvU1FBcTFtdlVDK082azZXVThsODc0?=
 =?utf-8?B?NmwzVk53bjFwMTJBYUpZNENFUi9mUXlMZlJXb3BwcGM4ZXFLK3FlejRnbFJq?=
 =?utf-8?B?bno3Y3hUSGUyV1kyZjhQWjZhKzBnMjNucGo3WnBYa2pzTkN1WkNkWG5CdXUr?=
 =?utf-8?B?TEE3U2QrWTI2TGVsYk1DRDBhS2JkTGlxem1NVXFJbExtR0dxRVlSN1piWTJr?=
 =?utf-8?B?cSsxNkhwYnZPaDhHNVdDUWs5WWZzQllzcEM5V2d5aUtUODRWWGVWRlI2ZnVD?=
 =?utf-8?B?SHErZUtCMVNCcjVDb2VlemE1OWNEZ2R1dEEzVWZ4NWhCTENJL1pGcWZkcEYw?=
 =?utf-8?B?ZmFhS1lremhaUVNnUWw3Um5RMkVaOXd1MktLUGhUcGFKNVl0dVpod1E3S1p3?=
 =?utf-8?Q?1p9Y2SATSnYEXYWctnO0lhFR+WPNynBALWNKabR?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7ca1278-503a-4379-05cf-08d8e7b2c483
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 13:03:46.2289
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uNxeLH5Y5UndQFH5ZmtenBgIJA1iDzJJpiEEdcBP54pToGF2tTw55vvmbtQtw6IOPQeY94yr6h5YWGRDtgx1nxFrVZ47QmELTvp+QDTAV7E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2920
Content-Type: multipart/alternative;
 boundary="------------07039958627DDF7158DACA80"
Content-Language: en-US

--------------07039958627DDF7158DACA80
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-03-13 1:30 p.m., Khem Raj wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> We can compile abseil-cpp now for ppc64
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-core/packagegroups/packagegroup-meta-python.bb    | 2 +-
>   .../recipes-devtools/python/python3-grpcio-tools_1.35.0.bb    | 4 ++--
>   meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb  | 4 ++--
>   3 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> index df4fcc8826..c6ac19a225 100644
> --- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> +++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> @@ -449,7 +449,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
>       python3-zopeinterface \
>       telepathy-python3 \
>   "
> -RDEPENDS_packagegroup-meta-python3_remove_powerpc64le = "python3-grpcio python3-grpcio-tools"
> +RDEPENDS_packagegroup-meta-python3_remove_libc-musl_powerpc64le = "python3-grpcio python3-grpcio-tools"
>
>   RDEPENDS_packagegroup-meta-python3-ptest = "\
>       python3-cryptography-ptest \
> diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.35.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.35.0.bb
> index 475b4e6063..6758429aef 100644
> --- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.35.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.35.0.bb
> @@ -17,6 +17,6 @@ RDEPENDS_${PN} = "${PYTHON_PN}-grpcio"
>
>   BBCLASSEXTEND = "native nativesdk"
>
> -# Needs python3-grpcio which does not build for ppc64le
> -COMPATIBLE_HOST_powerpc64le = "null"
> +# Needs abseil-cpp which does not build for ppc64le/musl
> +COMPATIBLE_HOST_libc-musl_powerpc64le = "null"
>
> diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb
> index fa030b99e2..13cef537e2 100644
> --- a/meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb
> @@ -44,6 +44,6 @@ BBCLASSEXTEND = "native nativesdk"
>
>   CCACHE_DISABLE = "1"
>
> -# abseil-cpp/absl/base/internal/unscaledcycleclock.cc:100:2: error: #error Must implement UnscaledCycleClock::Frequency()
> -COMPATIBLE_HOST_powerpc64le = "null"
> +# needs vdso support
> +COMPATIBLE_HOST_libc-musl_powerpc64le = "null"
>
> --
> 2.30.2
>
>
> 
>

--------------07039958627DDF7158DACA80
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-03-13 1:30 p.m., Khem Raj
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210313183047.402000-2-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

We can compile abseil-cpp now for ppc64

Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210313183047.402000-2-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-core/packagegroups/packagegroup-meta-python.bb    | 2 +-
 .../recipes-devtools/python/python3-grpcio-tools_1.35.0.bb    | 4 ++--
 meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb  | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index df4fcc8826..c6ac19a225 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -449,7 +449,7 @@ RDEPENDS_packagegroup-meta-python3 = &quot;\
     python3-zopeinterface \
     telepathy-python3 \
 &quot;
-RDEPENDS_packagegroup-meta-python3_remove_powerpc64le = &quot;python3-grpcio python3-grpcio-tools&quot;
+RDEPENDS_packagegroup-meta-python3_remove_libc-musl_powerpc64le = &quot;python3-grpcio python3-grpcio-tools&quot;

 RDEPENDS_packagegroup-meta-python3-ptest = &quot;\
     python3-cryptography-ptest \
diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.35.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.35.0.bb
index 475b4e6063..6758429aef 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.35.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.35.0.bb
@@ -17,6 +17,6 @@ RDEPENDS_${PN} = &quot;${PYTHON_PN}-grpcio&quot;

 BBCLASSEXTEND = &quot;native nativesdk&quot;

-# Needs python3-grpcio which does not build for ppc64le
-COMPATIBLE_HOST_powerpc64le = &quot;null&quot;
+# Needs abseil-cpp which does not build for ppc64le/musl
+COMPATIBLE_HOST_libc-musl_powerpc64le = &quot;null&quot;

diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb
index fa030b99e2..13cef537e2 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb
@@ -44,6 +44,6 @@ BBCLASSEXTEND = &quot;native nativesdk&quot;

 CCACHE_DISABLE = &quot;1&quot;

-# abseil-cpp/absl/base/internal/unscaledcycleclock.cc:100:2: error: #error Must implement UnscaledCycleClock::Frequency()
-COMPATIBLE_HOST_powerpc64le = &quot;null&quot;
+# needs vdso support
+COMPATIBLE_HOST_libc-musl_powerpc64le = &quot;null&quot;

--
2.30.2

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------07039958627DDF7158DACA80--

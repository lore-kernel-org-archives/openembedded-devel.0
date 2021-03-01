Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.52])
 by mx.groups.io with SMTP id smtpd.web09.1044.1614621007586434905
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Mar 2021 09:50:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ZrzcbpML;
 spf=pass (domain: windriver.com, ip: 40.107.237.52, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j0UkHQLUSLfxeQeg9f+rMOlvF3RjDXF89zyt8L8M9LE30FRfvym2anMAUcewWg3Yj99rIQv+9NIDVNxE3dIkSvdDf0/cETMKrmtF0jvoBqDYYeXesj87SAMDgwlNXdEnVKSD0NrLPIj1sj10Uc8J3pFGt+CL9BT4+CghRKJ65hPixIULxyM9TGSoC0VYUljYFIRBC2bUIWhuYURsX48CeZ7FIGFABR6Yx2JtJTnomZa70YjUjETSKCLyksA8mkZs6HXSBl3Vm/Qpnhm5CNj42TOEd8MKyDqp24c5IT/iowGfFD8JwJYuKWbmpaA5/BM5XwzCfHbSYQC8SKOTzLqS9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V1fQn8zDSGwNiwGadWH/uH/wWgAX6utEyaF0H1k5Gjc=;
 b=T4HFLRhKpwKbc/wCPQuc1buYgayyv95flB67i4q1G7SqzII7K23WfTTWOZi0fHRz1YDijRGGp/fiWS90kSzpdny3IMowJBGQFEw/kYhal3q8y1du+CAoC6Kmfet3GD7hsAcGxoHT77N+kkEQiaM4aWY5p7u0+O51uQUcPvLn71nhMKfhNFWg2n3WuIaXmIko+MJiqnKFnAa9ZzSPtibf4MRSmPeaPLmpwrJwXoUFfWvSot28EmhU/YAz2Q04YCvP/j5+GIoqYYcSA0eChqQxPu3SWwp7Ax890j0m8xWO//CsTqEB65uwzHxBooiQ19XicO0ZtRv6HU090yoXVAg3uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V1fQn8zDSGwNiwGadWH/uH/wWgAX6utEyaF0H1k5Gjc=;
 b=ZrzcbpMLEHDY5kkcITkqe74OZPx4CtH4w98IxFX15iKoWQm0rRLSu9Uwb0COP5DcarWfaeSmUygdIXaP21oiIHp0Jf4JZALOwJyTBoL6q9kNNVeBSB8EZ51sY19ZsF0GNvueAup8Bnm2jhuL0DdWb9RWud6Q2WGcEhjugqGBcNc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3447.namprd11.prod.outlook.com (2603:10b6:a03:1d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Mon, 1 Mar
 2021 17:50:05 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3890.028; Mon, 1 Mar 2021
 17:50:05 +0000
Subject: Re: [oe] [meta-python][PATCH 3/5] python3-cvxopt: Upgrade 1.2.5 -> 1.2.6
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210225160544.8994-1-leon.anavi@konsulko.com>
 <20210225160544.8994-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <dc1a7920-db3e-e0e8-2944-c9f518b22355@windriver.com>
Date: Mon, 1 Mar 2021 12:50:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210225160544.8994-3-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN6PR19CA0092.namprd19.prod.outlook.com
 (2603:10b6:404:133::30) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN6PR19CA0092.namprd19.prod.outlook.com (2603:10b6:404:133::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend Transport; Mon, 1 Mar 2021 17:50:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 48c665db-77de-4f47-5223-08d8dcda721b
X-MS-TrafficTypeDiagnostic: BYAPR11MB3447:
X-MS-Exchange-MinimumUrlDomainAge: cvxopt.org#4961
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB34473D6B59010CA267731D1F9F9A9@BYAPR11MB3447.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:473;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IU/Bv5yFgVv3w/F1eF4j9w8AkuOpg3b4MG9/TTrCSu3tRmTIib+sY5dHvezGR9RMAiVZJOhRhBNh9W8MaG7cELyDrnl1io8rg74MM7bj5367OoAM9B2f4LMt7o35EQGbvekGSRHj47ylo2awuC2TgOCGSqONNFRlgv1Ow8uGptU0qNz3ixqR5nHQ7ppiQ0igSOOxYc60yC4vObCHjmHEASHV2sRWVNKMp2Pyf56FJeXEU13nCIfl9PjPDHQPqetyGFon+rLfOJY5+SbDPey8lGHHFPQBXbUoKY4cTwjU6zpljGrNCHVxj+7YOBTY/eAtmR4CWh8l7EtlO0+8/EbuCcRJHpYzf5RQ5tYwiw9xY5CqmySUJoI8X2XkXy/KzS/HjiFf7PvMUqvi0V9oOMEiHyfJxCB0i8zHu0saMfiislHdIZszTB+ujrC8JtZXB6YcIPdoEX9aie/VwQEO78wamZafTrktx/UYJ7I8cRPonfjCzttHRDa2KOmMY1kJeN26K/GKitAot2hWqVS0RWkDpVhZuA42jCc0hcrX4lbnxOEtZsGX+jW0nscnT4FztC4OAWPRg6RnhKghEnb2axSGxbOrQlBJHwOsd05jCyb9vL91WO3xwjFYS+M6d7pIzvg+er2ievMPz0PIOZr93gBWd4tJMRuUl3mklHSXdIPqas0o1B5XZEv3wD961dzZtaAb
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(366004)(396003)(39840400004)(346002)(26005)(86362001)(166002)(83380400001)(16526019)(186003)(5660300002)(316002)(16576012)(33964004)(36756003)(31686004)(2906002)(478600001)(2616005)(956004)(66476007)(31696002)(966005)(8936002)(8676002)(53546011)(44832011)(66946007)(6486002)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?V0o2dThnRHN2NjNaMUY0ZEd6eW4zK0FjYU9iemdBQ0lDS2QyRGpsM09nNy9C?=
 =?utf-8?B?UlVqWXJIZGlUSmNaRVR6ei9seTYzSkEwL3FOdVZpL2MrT1BBMWJXVGZSSExV?=
 =?utf-8?B?V0pXRnA1T0ZGcUN1ZFdzaVB4bGhVeEdZYnUzWnFQZDgvWDV6enNDNFJVVjJm?=
 =?utf-8?B?UkRjT3E0VGFpQjJPQnFSQUQ5SHpabEdleWtWKythTkZ6MjN3bTJ2RnhKbEpt?=
 =?utf-8?B?aDM3cmZ2VEtvQWgza25yZ0Q0R3NuTXdRbXFxUHV1YXRISFlWL0dVQVFvV0VX?=
 =?utf-8?B?eEVITVFTcG5NeE9tS1V2c2dOOHoyc0ppb1RNV3hpRVg5UHc4RVJwWGVROFpZ?=
 =?utf-8?B?ZU5QeWI5NDlRWEpNRjQ1aFVvd1M0THpLcktKRlJuSzNXM1I5SEpsSjhXS2JI?=
 =?utf-8?B?cFVValZ5eVJzZ0ZwMDBnRDFPRHRuZXJnU1NkZkhrTUZpU3RmL2s2THJRUVFm?=
 =?utf-8?B?czFMTm5rc3ZEaCtNZEJqMXh2WWNTWERUMWJ1ZHQ2bURCbFh3dWhGNzQ1Ky9X?=
 =?utf-8?B?aDJ5SXhHRDAva3pHRHBJVXg3S0hpRVZRVW15ZmhDcnlvbCttcis3R1NnOEtw?=
 =?utf-8?B?c2ZNT29vUy9aL1hRc0JtTm5leUo1b2FOZkRTS09RSjh4RmxLdEEwbERZNVZk?=
 =?utf-8?B?Q1VLTTBtN1F2VXRDWEI1L0JpZCtyQWk5SU00K1huNUV2ZmlJeGd3RVdzSDNT?=
 =?utf-8?B?SGVJaGtPRHM3alI3dUVhM0NFWTdsc0hJUERYeXI5dTNNejB4R0YxUzFHc3lQ?=
 =?utf-8?B?ZFdoaU1uWlJsN3VLTHB2cFFoR2htenJPdzYxckU4c3NCQTRFRWw2bUZoK21D?=
 =?utf-8?B?ZE1YSkxzMzJXNm1VcEl6VnJUVk85U1hmTkdaV3FMME0wZmliRVVMcEs5R2R3?=
 =?utf-8?B?Yjd2NmVxVHc5TEtPM1hJNzdYczROekxRN2VXSzBnMlBhcDB1V2doVDRzcCsv?=
 =?utf-8?B?NlNYbUpuQW9OQlpZSzI1c3R6Q1JFdHhzR2t1cHNBM0pvWTZpM1BkSGk4YnV5?=
 =?utf-8?B?L213OTV5TU14TVBmR25HdE5yOG1BbzdtaXpJR1ZrRUxONldtbktJSzlESVU2?=
 =?utf-8?B?K2NQR2MvRVRPQ21sSU93enNYQUtmSmNCVWc4bnNXYWVTVExzUDFuT3hJTkVq?=
 =?utf-8?B?SUx0ak1SSHA1QXk4S1BCSDJDeXFCcFhJcmdxVndlYmZoaFhhRFdZSFFRRjZn?=
 =?utf-8?B?ZzZlcG54amw4TzVQQzVibm43YXlNRnZ1OFVEa3F5UmZibkE0TzBOSlJBWjV1?=
 =?utf-8?B?TnZpa2FqUXkzMUdONTdvMGJteXBiQUVOYkM4ZjZCbW5WbTdrNmVweTRVREVG?=
 =?utf-8?B?WFYwUzRzdkFTc2hVM1R3a1QzVVpkYUp5UjdKUCtXa011b1lWUWRvWDMyTk9v?=
 =?utf-8?B?aDhkNGQ3QzJMT0tFejJWRjMyYzhXTFQyTGdMb0dJMHZ4NVRkZi9vZjRGMmdU?=
 =?utf-8?B?VVFiclFCeUlER2w1NVJ2SExkYytmd1VYQVVua0V4VGJHd0ZOcmRFVGhYclJo?=
 =?utf-8?B?RlpuNUx1TFc5QU01Ymh0TThkdHIyU1BIZEg0d2hkZm1SVnZzcEZ3ZEovaks3?=
 =?utf-8?B?K2FudUk0TFVidnlvcnlzbWJpUzg1eWlzN1F5ZnBtUXRrelpJbHo5ZUo2Wmxa?=
 =?utf-8?B?R3I3ekkyVTd2d3pmZlAzajR5MHdIcmlxRDhvbmlUd2IyQjJRbmRDckpDeUUx?=
 =?utf-8?B?VTR3RUt3K3pnOUdOc3Y3WWFkcmExUHU5cFBDUC9CRWVrK1VRekVqTEJYa2h3?=
 =?utf-8?Q?LzIdthjc7J84HqLFqGK9HhU35BTBPy8qzE70YLM?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48c665db-77de-4f47-5223-08d8dcda721b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2021 17:50:05.0638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bPHJQAorUOpSklSaTTyn7OjnPaGT3h+UzwRO34Zzaf/QPduHW8In0jcmI4YpVhPq2rXpp6sGItQwYZlIO9UIi5K32sOYeKJiVU/7lWiXQwU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3447
Content-Type: multipart/alternative;
 boundary="------------CEE889382A609B00636FE6D0"
Content-Language: en-US

--------------CEE889382A609B00636FE6D0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-25 11:05 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 1.2.6:
>
> - Change construction of sparse matrix to avoid limitations of
>    linear indexing with long int
> - Make create_indexlist declaration match definition in dense.c
> - Update version, copyright, and documentation
> - Fixes typos in examples, documentation
>
> License-Update: Update year
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-cvxopt_1.2.5.bb => python3-cvxopt_1.2.6.bb}      | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-cvxopt_1.2.5.bb => python3-cvxopt_1.2.6.bb} (78%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-cvxopt_1.2.5.bb b/meta-python/recipes-devtools/python/python3-cvxopt_1.2.6.bb
> similarity index 78%
> rename from meta-python/recipes-devtools/python/python3-cvxopt_1.2.5.bb
> rename to meta-python/recipes-devtools/python/python3-cvxopt_1.2.6.bb
> index ef06b56022..360df6a3ef 100644
> --- a/meta-python/recipes-devtools/python/python3-cvxopt_1.2.5.bb
> +++ b/meta-python/recipes-devtools/python/python3-cvxopt_1.2.6.bb
> @@ -1,11 +1,11 @@
>   SUMMARY = "Convex optimization package"
>   HOMEPAGE = "http://cvxopt.org"
>   LICENSE = "GPL-3.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=4905701d14049b3f8e4774c290aeee21"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=ba1a8a73d8ebea5c47a1173aaf476ddd"
>
>   SRC_URI = "git://github.com/cvxopt/cvxopt;protocol=https"
>
> -SRCREV = "5b59d87007bf6fdea464e14875543b35255b84b2"
> +SRCREV = "60fdb838e0bb2d8f32ba51129552c83b55acd2a7"
>
>   S = "${WORKDIR}/git"
>
> --
> 2.17.1
>
>
> 
>

--------------CEE889382A609B00636FE6D0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-25 11:05 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210225160544.8994-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 1.2.6:

- Change construction of sparse matrix to avoid limitations of
  linear indexing with long int
- Make create_indexlist declaration match definition in dense.c
- Update version, copyright, and documentation
- Fixes typos in examples, documentation

License-Update: Update year

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210225160544.8994-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-cvxopt_1.2.5.bb =&gt; python3-cvxopt_1.2.6.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cvxopt_1.2.5.bb =&gt; python3-cvxopt_1.2.6.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-cvxopt_1.2.5.bb b/meta-python/recipes-devtools/python/python3-cvxopt_1.2.6.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-cvxopt_1.2.5.bb
rename to meta-python/recipes-devtools/python/python3-cvxopt_1.2.6.bb
index ef06b56022..360df6a3ef 100644
--- a/meta-python/recipes-devtools/python/python3-cvxopt_1.2.5.bb
+++ b/meta-python/recipes-devtools/python/python3-cvxopt_1.2.6.bb
@@ -1,11 +1,11 @@
 SUMMARY = &quot;Convex optimization package&quot;
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://cvxopt.org">&quot;http://cvxopt.org&quot;</a>
 LICENSE = &quot;GPL-3.0&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=4905701d14049b3f8e4774c290aeee21">&quot;file://LICENSE;md5=4905701d14049b3f8e4774c290aeee21&quot;</a>
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=ba1a8a73d8ebea5c47a1173aaf476ddd">&quot;file://LICENSE;md5=ba1a8a73d8ebea5c47a1173aaf476ddd&quot;</a>

 SRC_URI = &quot;git://github.com/cvxopt/cvxopt;protocol=https&quot;

-SRCREV = &quot;5b59d87007bf6fdea464e14875543b35255b84b2&quot;
+SRCREV = &quot;60fdb838e0bb2d8f32ba51129552c83b55acd2a7&quot;

 S = &quot;${WORKDIR}/git&quot;

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

--------------CEE889382A609B00636FE6D0--

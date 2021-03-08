Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.80])
 by mx.groups.io with SMTP id smtpd.web12.36219.1615212398833596957
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Mar 2021 06:06:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=BG8zWyZr;
 spf=pass (domain: windriver.com, ip: 40.107.236.80, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MK5I3VovEkBoGefcQrNcf+7WW54Pgyfi9tRHM2VBoWGLAPZNdEfSmGsuxT2FjYn3MOC3EoM+EW+xR7rcVYqJLBjULxHdOXpvFJCQgfAy92fJwoLB+mn7kjoYCH3gmqA7aB5oBpiPcucqQfSc0/lfkVWBpt6VkI0tSEjn/BYRpJbCDyw0X48rcS+3nBNeXvlZMbUe8jlGvXUp47WNQu/K65CdjtpCVYWuY74yb/BKNkMApi4qvFdvfG/sLbrNxp6ZmErj0ch8kJ1fkULJCqN6TJviUH4ghsaCUnt0ouRTAD3GLigzVlNFr9bfkLaUnNc67bpD6rzJVWy1Eyj2yFp7LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oHv1HJUyA7KPakOxoOMT4Nn60/bs2vJcOd01VRBFRiU=;
 b=DQdmWp4JlOzvvIMK2OBvHpkHXRxW3Y+bfoTLonTsLcq1QOsGiljrx/SNPKo8U0OxxDjVXqF/wjJDUptwDsRyRaeuUqExzsEp2pjcXjGJ1H0hBE0X++wmVME1Q8U2xySY9AHDm3/AVd7py+kyN7Ix4Qp2fy5WJyq+JuKyyhA5qTCEPp0IZBIYW8zJ3NvM/XjcTmORccf7W0AGiQInEJNvRphFiqmIGEsiPxJVp/eHCHTRtM5+bcLu/s3akSGuz56EOIKo46VGILPbninbaHCAK6c2yNGiHDE+M2deu8//ckIw6yo5xMVmZl/HjHzcIKO7Qoc18NLEdgxjKG0/npgFdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oHv1HJUyA7KPakOxoOMT4Nn60/bs2vJcOd01VRBFRiU=;
 b=BG8zWyZrRAiDNoYFzdeSctFzyCluh2qSl27pj2syIuoZWyKRKHqeNNB/UzaJBnMvII5+XW4ra6ZColC7H/Y7wFuiCjSx4FWM0wsLmCxXLVcAikYlimnCGzSf06vFzRPv2OYvXjpvkxE7upm3LF8s74w4bZzJavUFgU3R5bj3bjs=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2631.namprd11.prod.outlook.com (2603:10b6:a02:be::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.28; Mon, 8 Mar
 2021 14:06:34 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3890.037; Mon, 8 Mar 2021
 14:06:34 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-gpsd-py3: Added recipe
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Cc: Colin McAllister <colinmca242@gmail.com>
References: <20210307054335.2332899-1-raj.khem@gmail.com>
 <20210307054335.2332899-2-raj.khem@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <b81ce7df-6f47-6b5a-9cb5-77d273a91521@windriver.com>
Date: Mon, 8 Mar 2021 09:06:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210307054335.2332899-2-raj.khem@gmail.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN6PR22CA0054.namprd22.prod.outlook.com
 (2603:10b6:404:ca::16) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN6PR22CA0054.namprd22.prod.outlook.com (2603:10b6:404:ca::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Mon, 8 Mar 2021 14:06:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 645952f6-34c7-4e4a-4df4-08d8e23b61a5
X-MS-TrafficTypeDiagnostic: BYAPR11MB2631:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB263147F33CF563E7D5CC738F9F939@BYAPR11MB2631.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:854;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3/kshDvqkf/vplIaWIOqaKhQWaAiK++V4UHyqws7zrpIo4KI5IgAvw32Z4bSG8sc7QObeX46fweyJ5e/fmP3YCasHfFUuJMmxyMLYfNUk9vS9deBly6WMCuaugbaWGvY5xg+ZViI9qSZX2kW88/YWLRz0EoMFGslZCBjMSk0p5pC0Wq1CXp+yGv5lW493Vl4GzWsmdNn1qmzul0hLybBYHNAUbFTq6+Ea0hnCOC/QweqWnmZGtpvSac4G2RiWHEQCtqSin4rb8cz6L0ef7FClCB81chEyhWFGYPeyJqULN4+pzGNf5XSP1j4u9/P5iNza4+OEmfz3k1l84jtor9PsBgmB0uPhZR4Fm/xDwcdZhvFQ2/Sx5P20apvm4UMWGl+m8gL4hvOU5NAuhS71oQ8Nz6NNnQGNYvrygJRO3A+s8GP3GwkeRqoQk77C0UZzgMZ0kOQP2+RYon6RTLKNTZPPONqsY5JtY6qlbZIeLEbJ1d4upG7Ui45Ytbrl0+3XX/neGInuwKYuNJJ8P7c17FyIGg8L7uTY1XITJ5WVOqYSVxmLW/LrZ9Q3WHFdiLpr8AZfPdlvzH3R3GVyGT7jIQsXGbh+eFfwEBwp1p5m9aQcSGkon+GggUIKDm6wxmDQL9ndrEFAe6wVgfWQZUJrV+XzYeA7v2tAbN1vR6BVFyjoTj7KMCjz44msH8ZCNrgqf1p
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(376002)(396003)(366004)(136003)(36756003)(33964004)(53546011)(6486002)(16526019)(966005)(31696002)(31686004)(86362001)(44832011)(166002)(66946007)(66476007)(66556008)(956004)(2616005)(5660300002)(478600001)(83380400001)(2906002)(186003)(8676002)(8936002)(16576012)(316002)(26005)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?M2IxVGJKQmdVaDlWSC9Qakh3Q0tkQzVMaExjZ3pYdXN1bTVaVUo4aFUwdDZx?=
 =?utf-8?B?YWhLWkV5YTYwUDEraXQ3RkhmdE9UbWdYcVQvRHVSK29yTkw4VDloTXhVVnVJ?=
 =?utf-8?B?Q1lQUFdVWU5ZYjZZOE45b0o5S0JWV2dVNUZmWnBsWFFIcnBZYU91QUVsdmJP?=
 =?utf-8?B?NHRFd2xZbmdKTHRLNXpHSDZ4MzR4Z2ZtZUNSZjVFQmZNZVZkbjBJYVlCbVpT?=
 =?utf-8?B?UllCeXBrcGVBM3BaYS91Uk14ZVRYNDdleTQ4WXRESXhPejkvL0pOS2tRSk1y?=
 =?utf-8?B?djVBOXBQa2FocW81bFRUQUFxRzMwQlQ1VTdKT0J1UHpLZkVwOXJWdzJiWnlD?=
 =?utf-8?B?WmUrTnovSHd0Vm1YUGFibkFScW9RVXIzd1hTZGFjdGNyTnZ5RkFVb1p5Z0FJ?=
 =?utf-8?B?VDNkUkc4SVNEQllYK2VLbFl3S3BxTU9ybm1IbVR3R0Urb0NDbUwvVjdIZnNI?=
 =?utf-8?B?LzYrUFRvcXZNRXNxNkczZ20zVzRNZkFla3ZYVkVxUElFcGJlK01jV3FoSXJG?=
 =?utf-8?B?L1RlOXp3cDUwdC81bVh1ZEQ0NCtnbXR1QWZRSjl0czh6Sk11aEtQREpweUtZ?=
 =?utf-8?B?dnF0bnI2M3lKSnRrbitQTkxybEx2ajFGR1hjc3VDL3dOamlIR0lDZ0k5bk43?=
 =?utf-8?B?WDdOeG9pMkNwNWZ0OXZMdnFRRmU0TERGTFd1UkJDeFpVdUVRenk3VHpYRW55?=
 =?utf-8?B?ZTBoV0lydS9PbWVKWkxwWW1TYm05aU0rcnY3SlJtdDdKYy9RNXMvUVZKQkk3?=
 =?utf-8?B?VlZzaGYxOENSeVR2VmozNnVwWVVxeFR5VHgxdnpzRm5SdVRoaW5Qcm5TQnNZ?=
 =?utf-8?B?Y0xNZmNCa3B3ZWsxcXBkMUZTdGRxdXBsQVg5SVZ6djFPT1VJL0h0UUNXVHo1?=
 =?utf-8?B?VDRPc3RtNmpTMVlpU0tFRkNqZzlEVDdCWkpDcTI3SFhIZmxFcGVzM084bitF?=
 =?utf-8?B?WVh5alN0ZklxdEJJYVdJd25sQURLdjV1RGJ2c2ZHSnJNcmtEdXZHVGJsaE1K?=
 =?utf-8?B?TmRpVkhkS0ROOVh4Q2pCdXBXdE5yZGRoMGZTbTl5MWlEdktTaWZIbnpGSVB6?=
 =?utf-8?B?bXZ2Ukd5VVczNE9tWEZZV2JsT0V1ZmV4VFQ1L0lVN3dZQnZ1YndNQ3RudUJQ?=
 =?utf-8?B?YUppUndBVUdmcWV6RGVHbDRla3kzd3UwVUhCaW1NTkdoNmltbVQzVlBFRFU1?=
 =?utf-8?B?R1lNQ0JiTVNCVlVNdjVITkR4d2hJRmlzdGNRZXF2TDhDYnpJTzhIM0w4MmhX?=
 =?utf-8?B?eW9ZYkg4cUNHUE9MMTloNGlTRVZnS2ZqdWIrcHgxb2xITnpTdkxCemQwcmtl?=
 =?utf-8?B?bGszTVUrSDdRemEzUVdObEVkcGRZYXBhVmRnVVM5VWVyWU9IWHhpZTl0d3RB?=
 =?utf-8?B?eEZRUjV2dVFGRlZ1ek5xd01PZ0toSk11VDczNTVDL3Jtd1hpRklvU0R6SVBW?=
 =?utf-8?B?d3UrdFJzQ2xpY1ZDNFNJQUIyTVdZc3Nsb3pKd1QzTGdwNVlOQ0lvNHJia2JW?=
 =?utf-8?B?eExPWnludUROUFdZbGxrUTU5bHFRRWpwc1lEYys4VGNuQVRWd0JaREU4OGhJ?=
 =?utf-8?B?SjlWSm0zNkthQ2F2RnhLVjlZaVhDQ2FOdDRYT2h5ZEpPa1VxMUhFeEpPMDgv?=
 =?utf-8?B?eGxwdGNMZ0kxa3YwYXVRaldDVXV0ZkExenRLUnZ0YWhUT0R2UjY4bmxlUWpr?=
 =?utf-8?B?UGdwZEdRbWRIV0UzbWhQVTRDcXAzOHhWaVdGcU5OR0Q1S05FL1ZaM0pnY0Ey?=
 =?utf-8?Q?nWJyt5rwSYq3kw2Q8Z9BpFBFKUs6K87da5LyqgI?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 645952f6-34c7-4e4a-4df4-08d8e23b61a5
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 14:06:34.3445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WMqVz/DQxSmKgqUON9eqd+cPPlxE3eYivoBgEbQfmolpigWUq+faCgEEmK9SqIMjHqafm3RBG/25VCTPwh6xEv5G2PLWqeJb7f63YkhEQ0o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2631
Content-Type: multipart/alternative;
 boundary="------------5D57833CA36EAF5868511A9E"
Content-Language: en-US

--------------5D57833CA36EAF5868511A9E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-03-07 12:43 a.m., Khem Raj wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> From: Colin McAllister <colinmca242@gmail.com>
>
> Create Python3 recipe for gpsd-py3.
>
> Signed-off-by: Colin McAllister <colinmca242@gmail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../packagegroups/packagegroup-meta-python.bb    |  1 +
>   .../python/python3-gpsd-py3_0.3.0.bb             | 16 ++++++++++++++++
>   2 files changed, 17 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-gpsd-py3_0.3.0.bb
>
> diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> index c1271d09dc..4512f839f4 100644
> --- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> +++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> @@ -144,6 +144,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
>       python3-gmqtt \
>       python3-gnupg \
>       python3-google-api-python-client \
> +    python3-gpsd-py3 \
>       python3-graphviz \
>       python3-greenlet \
>       python3-greenstalk \
> diff --git a/meta-python/recipes-devtools/python/python3-gpsd-py3_0.3.0.bb b/meta-python/recipes-devtools/python/python3-gpsd-py3_0.3.0.bb
> new file mode 100644
> index 0000000000..35485ba7c4
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-gpsd-py3_0.3.0.bb
> @@ -0,0 +1,16 @@
> +DESCRIPTION = "This is a library for polling gpsd in Python3"
> +HOMEPAGE = "https://github.com/MartijnBraam/gpsd-py3"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://setup.py;beginline=10;endline=10;md5=c2d9994c57f0444e39f1dab19af50254"
> +SRC_URI[md5sum] = "041ce56e8879e2104b4d54c8119cd529"
> +SRC_URI[sha256sum] = "2908d3bd78dfb6720ecfe22f97e139b5a4a198f38df3a77215cf644a33513192"
> +
> +PYPI_PACKAGE = "gpsd-py3"
> +
> +inherit pypi setuptools3
> +
> +CLEANBROKEN = "1"
> +
> +RDEPENDS_${PN} += " \
> +    python3 \
> +"
> --
> 2.30.1
>
>
> 
>

--------------5D57833CA36EAF5868511A9E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-03-07 12:43 a.m., Khem Raj
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210307054335.2332899-2-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

From: Colin McAllister <a class="moz-txt-link-rfc2396E" href="mailto:colinmca242@gmail.com">&lt;colinmca242@gmail.com&gt;</a>

Create Python3 recipe for gpsd-py3.

Signed-off-by: Colin McAllister <a class="moz-txt-link-rfc2396E" href="mailto:colinmca242@gmail.com">&lt;colinmca242@gmail.com&gt;</a>
Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210307054335.2332899-2-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../packagegroups/packagegroup-meta-python.bb    |  1 +
 .../python/python3-gpsd-py3_0.3.0.bb             | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-gpsd-py3_0.3.0.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index c1271d09dc..4512f839f4 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -144,6 +144,7 @@ RDEPENDS_packagegroup-meta-python3 = &quot;\
     python3-gmqtt \
     python3-gnupg \
     python3-google-api-python-client \
+    python3-gpsd-py3 \
     python3-graphviz \
     python3-greenlet \
     python3-greenstalk \
diff --git a/meta-python/recipes-devtools/python/python3-gpsd-py3_0.3.0.bb b/meta-python/recipes-devtools/python/python3-gpsd-py3_0.3.0.bb
new file mode 100644
index 0000000000..35485ba7c4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-gpsd-py3_0.3.0.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = &quot;This is a library for polling gpsd in Python3&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/MartijnBraam/gpsd-py3">&quot;https://github.com/MartijnBraam/gpsd-py3&quot;</a>
+LICENSE = &quot;MIT&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://setup.py;beginline=10;endline=10;md5=c2d9994c57f0444e39f1dab19af50254">&quot;file://setup.py;beginline=10;endline=10;md5=c2d9994c57f0444e39f1dab19af50254&quot;</a>
+SRC_URI[md5sum] = &quot;041ce56e8879e2104b4d54c8119cd529&quot;
+SRC_URI[sha256sum] = &quot;2908d3bd78dfb6720ecfe22f97e139b5a4a198f38df3a77215cf644a33513192&quot;
+
+PYPI_PACKAGE = &quot;gpsd-py3&quot;
+
+inherit pypi setuptools3
+
+CLEANBROKEN = &quot;1&quot;
+
+RDEPENDS_${PN} += &quot; \
+    python3 \
+&quot;
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

--------------5D57833CA36EAF5868511A9E--

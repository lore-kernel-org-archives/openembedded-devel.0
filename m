Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.82])
 by mx.groups.io with SMTP id smtpd.web09.35552.1611578570634274667
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jan 2021 04:42:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=HHOG3QSU;
 spf=pass (domain: windriver.com, ip: 40.107.94.82, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V46x50+0KIegKKHpOnNxZK5f47MssXKOJVKvPPVF4JkHXHKr2fiDhBYhKzYf8PC/vLLuwQ7aOCAsU73h7/kqVmctksY7xqVGc0Rn20hEiZzp7dl1z1cOhVSELJlVkXl5PMHkCHmLms3uyXBSINOWCCEt2kiekdZaFynuhOKE7auQ1A/Sm/WkKuiKuH65pUCiXop/G4SgU9FO17R608UbPJGs1w7VzGwRGRP9uAk1k/OrwloLsimFE+Q3DpPZ5vrI4h0e1iibr6G0gv8ds/TntJlFA1p/vq209a1t2EfxuST4labEbgt9pev+dXYuFhbrjSSOGmXCMoREzY/A3vGnlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PUq1u0y23Bqa5t5+O1UdsstOJ7Os0J/e9kFdKcZ+tJM=;
 b=mxM5FnulW/RFe0I3IBnc2B6jJqHykV7fER8qTlum/0p51ZcdjLFVKRSPZlhfCLwVRwHfG48FTe++pNPoKcXzT5E1PJTcP5OnVIQktmVm/4tnTJDp6liptyThF8+yFJGti57OBL6TK7VQNYtHPt+6lgiXVzZxuVEZSTykLZY0xc/jvY91Rh0fy/QdHtwZgEfNI1JQu9fh/INvdkQJZRhwE+8tYMUXTcLWE1r6o7FywmWFtjMGs5KDYF1bxUJ+Cws/0buImiECsMlS6Bb+dxoGYp907ljhxc+Qndz2fH4G4sVKpDo5Qp47cGcfqFIIKbQFakrWfM6+NFLHaz4IkZ4qpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PUq1u0y23Bqa5t5+O1UdsstOJ7Os0J/e9kFdKcZ+tJM=;
 b=HHOG3QSUVdwqKWRS854UmW2z58H02Mu0UXvOhd+ZVmJKZiE/rPyoFNCM0ht5RzsEDOVDKO3yh6sYC5I3QIRXUFxqw8rPaJZG0XiZz3hoH2N7a5zHta4z+Vg84iBrUPIC0R8riwr/WGUtSKi1Upc0EiMuQjlGrf71hWKtEAdfzas=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from MN2PR11MB3919.namprd11.prod.outlook.com (2603:10b6:208:13b::27)
 by MN2PR11MB3647.namprd11.prod.outlook.com (2603:10b6:208:ec::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.17; Mon, 25 Jan
 2021 12:42:49 +0000
Received: from MN2PR11MB3919.namprd11.prod.outlook.com
 ([fe80::5462:9c04:72b3:6c44]) by MN2PR11MB3919.namprd11.prod.outlook.com
 ([fe80::5462:9c04:72b3:6c44%7]) with mapi id 15.20.3763.019; Mon, 25 Jan 2021
 12:42:49 +0000
Subject: Re: [oe] [meta-python][PATCH v2 2/2] meta-python: Add jstyleson
To: Andrew Jeffery <andrew@aj.id.au>,
 openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com
References: <20210122054538.3675758-1-andrew@aj.id.au>
 <20210122054538.3675758-2-andrew@aj.id.au>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <bab4f2a6-a1a0-c300-2003-db584b993e9a@windriver.com>
Date: Mon, 25 Jan 2021 07:42:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210122054538.3675758-2-andrew@aj.id.au>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN9PR03CA0447.namprd03.prod.outlook.com
 (2603:10b6:408:113::32) To MN2PR11MB3919.namprd11.prod.outlook.com
 (2603:10b6:208:13b::27)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN9PR03CA0447.namprd03.prod.outlook.com (2603:10b6:408:113::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.14 via Frontend Transport; Mon, 25 Jan 2021 12:42:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d7d2a35-a160-4cc0-f752-08d8c12eb8e3
X-MS-TrafficTypeDiagnostic: MN2PR11MB3647:
X-Microsoft-Antispam-PRVS: 
	<MN2PR11MB3647DD72525CA75E39D3764D9FBD9@MN2PR11MB3647.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kMdcTbgmFaDdwookYGvd0RdGX4HwGBBVuNWVBa2aeyDfZMAAcSsMcx+s43UUM6lV0K9eec8YZ/mdrRw+CuyvHHPB+GR6nySXORIo06q3GV9+9dD+/nVniivQgLpFHUmdh73qPWWvDgh8fHFnluAqqLYvnWB4Z/J5KaaLvV4owAUquap/3tRfXAQhlADhViLw9ZO72nf4tHUOFN/BaGAHG2RW7iJ7HqF0rNdTe0RvbSHN+hM7oZxOqYoAhzSm4LVX7uZSedbur3aL17uLLy//K+ymkr73YwoRB+vRjnJ1O4g4Tg9mcTSU3tCPzWOF479/UgwmxjyU/wrSjNFNZFHDEuc4ptNc/uSzJFhXC/dGFwd/ntuJeb3T1ODBuGGDq7xN9HExFAXPMvxWvoB6jKIrj6Iskl6QREYEbQ68Q+k/92r0wV82MGA3atZtgGyv0hBfbXB9gafZoPm2qYCjwYJnAAr48qihb1hn72JAG1Y95eAdjKEELSEjmS7sUCpq3w5sQ9fwYf2G1DzvLUgUQSt0m5Mz4OGeydzGqvmi0sRWaJJKu97XXcjOc1k6u7cI2kmN
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB3919.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(39850400004)(346002)(136003)(366004)(66946007)(8936002)(5660300002)(44832011)(86362001)(31686004)(956004)(166002)(186003)(966005)(66476007)(66556008)(36756003)(478600001)(26005)(52116002)(16526019)(16576012)(2906002)(316002)(83380400001)(2616005)(4326008)(31696002)(53546011)(33964004)(6486002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?c1FCcktsaFFCWFBBUzNOVEtEcVh5cWExNzlFamJRenJtaGJiOHpVRXRGTDR5?=
 =?utf-8?B?aHJXci90NmhtWlJIc044YTQzcEZScTJIdGdiZDk1ZFFyeTVTZ2hRblFwMlla?=
 =?utf-8?B?K3RtdmQwY1FzanJrRHdMSEFpa2lHMlhaWGM5YkJXTE9LRElPS3FkMjl3R3FV?=
 =?utf-8?B?WmovQlNhWHBIRWhQejNSYzRPdjNGeWEvM2ZMOXJBc3VOZThaNnprcVNOOVBE?=
 =?utf-8?B?OWlEaytzQ1d5anErZTRnaFRzb2U4TWtXUkxhOHRORlBVY0taeWdrTXFkSFo0?=
 =?utf-8?B?UW1jb1VLRUN0MXZmSVBwTllqUGRTbmpKL1RXRnhjek9lY0xUZmpCRUx6SkFs?=
 =?utf-8?B?SkxHTkVXdVJwb3JZN1p6VmhKZUZGMzJkcVRkVVlVRm00M0NTQkdTWnhmT0Ft?=
 =?utf-8?B?V0hEdXV6b0EzandjRXJSLzhVL3IwQ0c5Vy9JaDB3QkMrcWRQZnp6MWptcEVU?=
 =?utf-8?B?WjE5V1I0OS9uMWl5NmE5STJYT2w4bWVlcWJvZHg5WE9ZdjNhNnNWeUx6T3hC?=
 =?utf-8?B?N2IrS1ZXV1BvazJhdmVFeml0dForWlpMdjZ4TmZacUU0cDI0R204RVUwQmxj?=
 =?utf-8?B?T095dHZ4NTkzNXZ1U3pYRXRQV3c3SkRDeEcxaVJrVjdER2t6MENTckY4Ykow?=
 =?utf-8?B?eGRsQlhDOWVzNjl6UTRwTkpUREhFZVlnY2VLTlo3Qk0wemRwVytsMEI4U3hz?=
 =?utf-8?B?OVlYcHlMbmlxOFBmMjJWdFR5QUpwd3V3NmhENWdxZTFyZnVaek4rTnZtRHlu?=
 =?utf-8?B?R2xyTTFxaEtMWGg0TmRJS2dRZm1qWk1yRGZKMlJpWmRBeG8vU0djSzJRaU03?=
 =?utf-8?B?RjBzT3BjQTJUMWlQNmFSWlV0T211WHlteWdyM2RBYUp2cm4yZUJHWHd1bEpz?=
 =?utf-8?B?eG1PUDJIRnhEd2dJaW9iTVJKNDZpMDRlV2JQcFRtZkRYNGdJRlBSY29vVVM0?=
 =?utf-8?B?TDdxZ3JHSTBsdDZIL09rUFdIZVR2Q1R2d25jL05XSlBJb203WkZLK0l6TGNs?=
 =?utf-8?B?OXhTZ3dFcEdZbDBaRDNLZlJva2U2TnYvc1hVVkFFc3dxTldrVlByeVEzaGZH?=
 =?utf-8?B?WnpaZDJKMzFzbFI1ZEkxYVBURG5KR1F5czhzQ281c3l0TWwzL2pBcFJKb0Fq?=
 =?utf-8?B?cDU2STN1RUk1K05wa3loSHNVSlVQenpIYyswWTdZYS9rMktDc091WjBoak52?=
 =?utf-8?B?Zis1dHFLNU0ra0cwZHRYcWZGMkVvQ2FxdENNeTVITG1KbGVLZjg2LzJva1ds?=
 =?utf-8?B?Y2h0blBFUWhRdjMwRXYxWFo2bXBGQVFyWmxndk1wV09KVVhaRWpUOWl3UUVv?=
 =?utf-8?Q?jNh33ci8s5aUmhbAeF4nlZEAVy4dr7zI/R?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d7d2a35-a160-4cc0-f752-08d8c12eb8e3
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB3919.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 12:42:48.8878
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wAyCFFSfsX7hjL359l366NdZq/Ab/RbFY9xmkHrF+zcTa58mnl9LbdxIepUBAe5GknUSAz0GurDPquovFAVmgZ9sBxlq0yFCeV0MssBCSxI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3647
Content-Type: multipart/alternative;
 boundary="------------CE19BCECBBC4FC8A1A49BE72"
Content-Language: en-US

--------------CE19BCECBBC4FC8A1A49BE72
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-22 12:45 a.m., Andrew Jeffery wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> jstyleson is a library to parse JSON with js-style comments.
>
> The license isn't shipped in the pypi package, so it was extracted from
> the github repo at [1].
>
> [1] https://github.com/linjackson78/jstyleson/blob/8c47cc9e665b3b1744cccfaa7a650de5f3c575dd/LICENSE
>
> Change-Id: I1e22ef42e823d172fd52f40e84bd5194c131310a
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../packagegroups/packagegroup-meta-python.bb     |  1 +
>   .../python/python3-jstyleson/LICENSE              |  8 ++++++++
>   .../python/python3-jstyleson_0.0.2.bb             | 15 +++++++++++++++
>   3 files changed, 24 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-jstyleson/LICENSE
>   create mode 100644 meta-python/recipes-devtools/python/python3-jstyleson_0.0.2.bb
>
> diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> index 41f376b39b55..5f81fd35b75f 100644
> --- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> +++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> @@ -417,6 +417,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
>       python3-cvxopt \
>       python3-jsonpath-rw \
>       python3-hexdump \
> +    python3-jstyleson \
>   "
>
>   RDEPENDS_packagegroup-meta-python3-extended = "\
> diff --git a/meta-python/recipes-devtools/python/python3-jstyleson/LICENSE b/meta-python/recipes-devtools/python/python3-jstyleson/LICENSE
> new file mode 100644
> index 000000000000..807babd62b64
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-jstyleson/LICENSE
> @@ -0,0 +1,8 @@
> +The MIT License (MIT)
> +Copyright (c) 2016 linjackson
> +
> +Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
> +
> +The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
> +
> +THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
> \ No newline at end of file
> diff --git a/meta-python/recipes-devtools/python/python3-jstyleson_0.0.2.bb b/meta-python/recipes-devtools/python/python3-jstyleson_0.0.2.bb
> new file mode 100644
> index 000000000000..e70ce33efcd2
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-jstyleson_0.0.2.bb
> @@ -0,0 +1,15 @@
> +SUMMARY = "Library to parse JSON with js-style comments."
> +HOMEPAGE = "https://github.com/linjackson78/jstyleson"
> +
> +SRC_URI += " file://LICENSE "
> +
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE;md5=d97b96c7337934ee448ffd4392f32079"
> +
> +PYPI_PACKAGE_EXT = "tar.gz"
> +
> +inherit pypi setuptools3
> +
> +SRC_URI[sha256sum] = "680003f3b15a2959e4e6a351f3b858e3c07dd3e073a0d54954e34d8ea5e1308e"
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.27.0
>
>
> 
>

--------------CE19BCECBBC4FC8A1A49BE72
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-22 12:45 a.m., Andrew
      Jeffery wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210122054538.3675758-2-andrew@aj.id.au">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

jstyleson is a library to parse JSON with js-style comments.

The license isn't shipped in the pypi package, so it was extracted from
the github repo at [1].

[1] <a class="moz-txt-link-freetext" href="https://github.com/linjackson78/jstyleson/blob/8c47cc9e665b3b1744cccfaa7a650de5f3c575dd/LICENSE">https://github.com/linjackson78/jstyleson/blob/8c47cc9e665b3b1744cccfaa7a650de5f3c575dd/LICENSE</a>

Change-Id: I1e22ef42e823d172fd52f40e84bd5194c131310a
Signed-off-by: Andrew Jeffery <a class="moz-txt-link-rfc2396E" href="mailto:andrew@aj.id.au">&lt;andrew@aj.id.au&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210122054538.3675758-2-andrew@aj.id.au">
      <pre class="moz-quote-pre" wrap="">
---
 .../packagegroups/packagegroup-meta-python.bb     |  1 +
 .../python/python3-jstyleson/LICENSE              |  8 ++++++++
 .../python/python3-jstyleson_0.0.2.bb             | 15 +++++++++++++++
 3 files changed, 24 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-jstyleson/LICENSE
 create mode 100644 meta-python/recipes-devtools/python/python3-jstyleson_0.0.2.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 41f376b39b55..5f81fd35b75f 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -417,6 +417,7 @@ RDEPENDS_packagegroup-meta-python3 = &quot;\
     python3-cvxopt \
     python3-jsonpath-rw \
     python3-hexdump \
+    python3-jstyleson \
 &quot;

 RDEPENDS_packagegroup-meta-python3-extended = &quot;\
diff --git a/meta-python/recipes-devtools/python/python3-jstyleson/LICENSE b/meta-python/recipes-devtools/python/python3-jstyleson/LICENSE
new file mode 100644
index 000000000000..807babd62b64
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-jstyleson/LICENSE
@@ -0,0 +1,8 @@
+The MIT License (MIT)
+Copyright (c) 2016 linjackson
+
+Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the &quot;Software&quot;), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
+
+The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
+
+THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
\ No newline at end of file
diff --git a/meta-python/recipes-devtools/python/python3-jstyleson_0.0.2.bb b/meta-python/recipes-devtools/python/python3-jstyleson_0.0.2.bb
new file mode 100644
index 000000000000..e70ce33efcd2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-jstyleson_0.0.2.bb
@@ -0,0 +1,15 @@
+SUMMARY = &quot;Library to parse JSON with js-style comments.&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/linjackson78/jstyleson">&quot;https://github.com/linjackson78/jstyleson&quot;</a>
+
+SRC_URI += <a class="moz-txt-link-rfc2396E" href="file://LICENSE">&quot; file://LICENSE &quot;</a>
+
+LICENSE = &quot;MIT&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://${WORKDIR}/LICENSE;md5=d97b96c7337934ee448ffd4392f32079">&quot;file://${WORKDIR}/LICENSE;md5=d97b96c7337934ee448ffd4392f32079&quot;</a>
+
+PYPI_PACKAGE_EXT = &quot;tar.gz&quot;
+
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] = &quot;680003f3b15a2959e4e6a351f3b858e3c07dd3e073a0d54954e34d8ea5e1308e&quot;
+
+BBCLASSEXTEND = &quot;native nativesdk&quot;
--
2.27.0

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------CE19BCECBBC4FC8A1A49BE72--

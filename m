Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.59])
 by mx.groups.io with SMTP id smtpd.web12.23957.1611839168760003731
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Jan 2021 05:06:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Ooij1erS;
 spf=pass (domain: windriver.com, ip: 40.107.244.59, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ib60utoEaAQffoV7G4lZdToEGcHPXw1ZtcFAgWZ5x19jEi+AYePWACPmDSf516sHwMk87xIeaACBm8XUqwjuZCF+TjeEIrzuyJ03g4Yf+Q6IuCliVmUU7ta56XobngNDT1KImlwj5zQh/Ko+t1l0md4MDsDt/OkVuuwGAQAUQGbwXQlxBV5Gt5IIXYUfT1GUzXrBr8KmkPtsbmFPyeSXloFjBCcZVAUC2IZ14geV9HOhJBRJt+ffzKQi/dXAmZsZTvVbbknYYH6gH3iAmIi/PP8qTEy//IZKnCpwYymRUZg+lC9U1njvZXZY+kCkDfyWuMnXoBugnec8YYgiKkdpHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hC+HrkFOQvh8Yn8aYrZu23c078YJcj2xw/G+zScwexw=;
 b=HoBVhA8Phu7bkNqdDxJg3Xdh0UlJkEjMKLSn/eEmDhZwWMowoAjsq3O6FvAeYrBDWJ8D6iZyMePrBdohYqjTpivABGERia33DHzubcqb06Q4WZ1BN128eP8oMtB5l0qNCQB8s01Qm5aEYeilVL4YCPILGPaUoFxj4iGL9tlhmADH+hJWkiOj8oKuvTJA50GK/3ORWYODF0YEzYvCSzIXwsuJIvxzgWSAB+lwAGvkWN6cyWRA8Fi64BdHuA4uqUfmYQUzZ6VEc4uwwYWSkgt711lKEMeQR8nsx7aJaPnhfw4D0slJTqjFI4W8J48QbNN3XwpsdkTXLDe+lRb1O5QKyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hC+HrkFOQvh8Yn8aYrZu23c078YJcj2xw/G+zScwexw=;
 b=Ooij1erSaTPAFhNrmYmST9isQNOu435XUp0Uhz+jZhdT+TjSdfEWfXYNyBEHqT5+qr3FDUE6nKVqaGAq+s8JR/mKIqV0JxZcAcq2i5JaXafGxGMakom4n0WI1AdX/2OSeT9InTs7o6myhY0mBNwoynHn4bXAXfVVs3Ydn0gACYU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2951.namprd11.prod.outlook.com (2603:10b6:a03:90::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Thu, 28 Jan
 2021 13:06:07 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3805.017; Thu, 28 Jan 2021
 13:06:07 +0000
Subject: Re: [oe] [meta-python][PATCH 2/5] python3-pymisp: Upgrade 2.4.135.3 -> 2.4.137.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210125152337.20937-1-leon.anavi@konsulko.com>
 <20210125152337.20937-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <5a26f1fe-dde4-77fb-350f-65555a0400e7@windriver.com>
Date: Thu, 28 Jan 2021 08:06:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210125152337.20937-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL0PR0102CA0046.prod.exchangelabs.com
 (2603:10b6:208:25::23) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL0PR0102CA0046.prod.exchangelabs.com (2603:10b6:208:25::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16 via Frontend Transport; Thu, 28 Jan 2021 13:06:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2c3aeb1-e601-4d1f-d267-08d8c38d79d9
X-MS-TrafficTypeDiagnostic: BYAPR11MB2951:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2951367CABA5168D7C69D2DC9FBA9@BYAPR11MB2951.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:126;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	E+rNNPvhDUjWnP09E+I+W40FwhJ7WT57DO3vMfiMgGpz4UL9rG2J12NQcovp9uKZzywiAbuNREKuvNMuUhJAwH2xDVO51P28M1An0sct8CSL8KYn23ZPiw8kYP63eznDJiMBHtJaGgvWXSzP2YhbDkjkpLnvalB6BGYtJ4iRdNcxOkoBbXS5NT1GYjL8f39DtO7kNV+iD6VQ1J+VOgsq3nPvTdkzJaDZ982PTFdRPIGrgZjLrNBbG7uSN/GkpNQ9/raVWm1R08WaM6yDqJUO6fAbRtBuA288iuDvCsa+jsQ6hGFlLB2deUN5dZcZ7C5j27AYcfAq1Ud3NzWkLaSLCTsba3S3XBtH4VgwECejgeb0kuV3Lx2FuHHFfkav7kkUGbhmcKc2wy348WT9/R2X0SaCd49JlK5Yv6q4U39J77dJOEEZZlk+6uS16xK4uHxBvSe43rXnCNNziFY6LP3VIDwZ2ZKgXkWa71JJQ/JdOEs6ldTkJ4WGm2V4Z0yyeCyohwhESCrfJFHhMkBvOXkotxJ9y9RUXfez/d4nuLDkjh9ZO1VcExLmeElAkEWe59wcDm0+9Rmvplkx+C17FRZKeMU5P1eCNNomz522CZxYqLxehJy6n7HAzK5c7iInOtnFuZeH+9b7EA5fRlPEr3uYmJCno1bnV9eqw5qtUsM/HdQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(366004)(39830400003)(376002)(396003)(36756003)(2906002)(33964004)(52116002)(83380400001)(166002)(8676002)(966005)(66946007)(478600001)(6486002)(66476007)(31686004)(66556008)(31696002)(5660300002)(8936002)(44832011)(53546011)(2616005)(956004)(16576012)(86362001)(186003)(16526019)(26005)(316002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?RG8vTnVQd3NFaU50cU5pL1pFWDhkclBnSTBSK3RHUUdLTmIwSE1ZVFVNcmJh?=
 =?utf-8?B?Ri9iN0wxdUVkYTdSeEthN2pOWVE0dTR5SWlPckNRU2hqZ0dxVDBRMzFlaDFU?=
 =?utf-8?B?UXF4UHUvdEV5QVVnNFgyQ0FVaEZpdVhHUVNZRDQrVUFFWndXRzlwWTJXeU1V?=
 =?utf-8?B?dGtSekxOOGpRYXdGTkRLQU0vN0xGbmtCTXRhbmk2L29EWWp1QlpReG1yZmdo?=
 =?utf-8?B?Y3JwNEUrYlBGUmxZWC9RUGZiclRLaEYyNHowYnVOdzRGV0Y2T3F4VkZhUytG?=
 =?utf-8?B?OCsydXQ0TDhEcG1UY0tnSVpVQ3hSVWFLa3BqZTRqU3pzZFVvNW1xcklxcHJL?=
 =?utf-8?B?YWJEL2VaMklFYjRpOHUwZmJYUEpERXkzb0RFVGxWblM2MzYwdy9PWU15NUdo?=
 =?utf-8?B?c2pzbnFqSlV0d1Mzb214L0xQUFhiTDJHSXhKbEoweXpKdUZ0VE4rZTBzaXpZ?=
 =?utf-8?B?d3ZqWUFWakVoWXQzc3J4TmVWSnM3L0FHYkwrS0lySkxrb1BMUVRUMkZtTjhW?=
 =?utf-8?B?RVhpWFNmNVN1QWJQUUduM0E0dHpwMldqeFczT2J3QVBYSDN2eEdNRzl4b3RN?=
 =?utf-8?B?Zk5hQ3dtVnA4dmMvQTJrVGNHYW5TMnJJR1AxcDZYSHBpdTVzMGtDKzZ3ajVB?=
 =?utf-8?B?YTZCVFFVaWVjbnA4UG5VZVkrQ1ZMY1VuU3RjMmhjc2gvOXpUZmV0cG9KZHZO?=
 =?utf-8?B?bVBQWW9WYVZHWXNtV1pWZEFRaWpYUFR6ZU9SMGxuV0RpY2hBKzhIR1FsandC?=
 =?utf-8?B?WEVZVXhCSjhhUVJaMm9KNGRDUnh2T2pzd1VFbzR4ZmhiUUNTcmdtaG1VeTl1?=
 =?utf-8?B?dWx4ZUJEdkFPY2dSb3A5R0xGMkMrdm40UEJDbitLTmhaaDFia0NhOW1xUkpF?=
 =?utf-8?B?U1BsMktlRmd5aUtHcmZ5dU05cTRhU3BhcU03QmZqOVJEMzVqb2VET2J3TXFp?=
 =?utf-8?B?NHgxVG9rdy9VamVkN1dDTWdvaDVzSndHSmZmellhaU1IZnpWSmZwUEpEdjhk?=
 =?utf-8?B?NGwyS1lWbllQVTIwTnBkMmMxZnJOU0pCWnZmNm1ZR0pyWC9zMGVDNjFEU2NZ?=
 =?utf-8?B?Zk96L005bGppTHdkajNmNXdKZllORVhpOHJyaEhHVGxVMmVUcmVZMmlDckhr?=
 =?utf-8?B?YkVJRW5kSUhDWkFOWEVyWVY0R1EwY3JjVmNIYTA0N09UbnNIL0EyMVhuZHhs?=
 =?utf-8?B?TDJiSVV2N0FucTFGRUdlbjYzZzVtSlEwVDVRR29mSW9DMEZiTXFiTnZ4VjNI?=
 =?utf-8?B?cGVrdjVxR0IwbzljTVhsb2NmQXFaNGNyWXJJbi8yZDZOWDdsZ2h2Y1g4Y3Zi?=
 =?utf-8?B?WUZqZHl2UStDTHJFQldVOXZjN0J4UDMwQUZWZ055V2VLZTZFS1BsK2N5YlN3?=
 =?utf-8?B?Rk1zZkFXWlRLZ0Vpd3RtRW9ZcG9hcncrODJQY3BGb1Y3MllKVnRGUG5VTWVG?=
 =?utf-8?Q?RY4IMkmg?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2c3aeb1-e601-4d1f-d267-08d8c38d79d9
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 13:06:07.7397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jq1Ra0txP9Zn/4l53VJeI2IvhhUKm9EyICM6KLC0By/EMqCuDlpHSdbUesxGKMAV90+QBoQdvGLf7HFeGAH4hYthXMbNnBpoDNUsJVThAI0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2951
Content-Type: multipart/alternative;
 boundary="------------181859399AD38559F957289F"
Content-Language: en-US

--------------181859399AD38559F957289F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-25 10:23 a.m., Leon Anavi wrote:
> - Fail if a duplicate object is added to an event.
> - Add test case for page/limit in logs search.
> - Improve docstring for get_event.
> - Better warning if lief is outdated.
> - Update minimal dependency for lief in setup.py.
>
> Fetch source from the git repository to avoid extras_require issue
> in setup.py from the archive for this release in PyPI.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...hon3-pymisp_2.4.135.3.bb => python3-pymisp_2.4.137.1.bb} | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.135.3.bb => python3-pymisp_2.4.137.1.bb} (74%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.135.3.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.137.1.bb
> similarity index 74%
> rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.135.3.bb
> rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.137.1.bb
> index bbfc0459d..9b2efa2cd 100644
> --- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.135.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.137.1.bb
> @@ -3,9 +3,11 @@ HOMEPAGE = "https://github.com/MISP/PyMISP"
>   LICENSE = "BSD-2-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
>   
> -SRC_URI[sha256sum] = "f0bbdd77358223ba75c9cc40f192c7a2a7a5838bdd08b28381f71d220151ea8a"
> +SRC_URI = "git://github.com/MISP/PyMISP.git;protocol=https;branch=main"
> +SRCREV = "7b64c1c9a4fec8ed37c1522b31ab56f30b83f0e1"
> +S = "${WORKDIR}/git"
>   
> -inherit pypi setuptools3
> +inherit setuptools3
>   
>   RDEPENDS_${PN} += " \
>       ${PYTHON_PN}-dateutil \
>
> 
>

--------------181859399AD38559F957289F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-25 10:23 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210125152337.20937-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Fail if a duplicate object is added to an event.
- Add test case for page/limit in logs search.
- Improve docstring for get_event.
- Better warning if lief is outdated.
- Update minimal dependency for lief in setup.py.

Fetch source from the git repository to avoid extras_require issue
in setup.py from the archive for this release in PyPI.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210125152337.20937-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...hon3-pymisp_2.4.135.3.bb =&gt; python3-pymisp_2.4.137.1.bb} | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.135.3.bb =&gt; python3-pymisp_2.4.137.1.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.135.3.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.137.1.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.135.3.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.137.1.bb
index bbfc0459d..9b2efa2cd 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.135.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.137.1.bb
@@ -3,9 +3,11 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/MISP/PyMISP">&quot;https://github.com/MISP/PyMISP&quot;</a>
 LICENSE = &quot;BSD-2-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20">&quot;file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20&quot;</a>
 
-SRC_URI[sha256sum] = &quot;f0bbdd77358223ba75c9cc40f192c7a2a7a5838bdd08b28381f71d220151ea8a&quot;
+SRC_URI = &quot;git://github.com/MISP/PyMISP.git;protocol=https;branch=main&quot;
+SRCREV = &quot;7b64c1c9a4fec8ed37c1522b31ab56f30b83f0e1&quot;
+S = &quot;${WORKDIR}/git&quot;
 
-inherit pypi setuptools3
+inherit setuptools3
 
 RDEPENDS_${PN} += &quot; \
     ${PYTHON_PN}-dateutil \
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------181859399AD38559F957289F--

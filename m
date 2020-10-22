Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.43])
 by mx.groups.io with SMTP id smtpd.web09.1361.1603410293967403343
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2020 16:44:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=VusSGttH;
 spf=pass (domain: windriver.com, ip: 40.107.77.43, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UAd371RDLpSQblVa4NyNczt+SBJrMWsRF4R7YRvlaYOEErCwRwJ0MVLiE1iyV/WFJxA8NK5syF0mAYhw1weZH6VyqNlbz57iGiOXTNXIG46B5e1+/2xNenuYsfsN3OV1pG44OzXyLiArWnLI3QQYryCQT3n+5Bnm4XDsqDV1hmEc590H61kOFW+USQT+Srb1kvamj8K+c5woLUUKk1TRhF0rZed7Sww6sSnpvMxG2amhHhlop40PIhpX4vMFYUfBjsEUjU997amR8bT8CFQQh/bzJspqaq1rBRIpHW6n4DTH4pNiNvFwxbrgK7n1TgeESLv+FhpSZkxNpTqEsn2nSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bZiqnWea2xcPZDkHrYZPjbW7DR9s0k4RvcFEdnfU16s=;
 b=fSLyoz0pxxh0i5QWhwz26JjWoA/WygB0AM+jCVGXQB1ZvEizQZqrZ9rSZ2Q7kediUqSBhzPRM3i7ICI5pzDgI0Boa68RCohEl/Zqq7oe2Z52OeeVedP6H98IA+qZg1wVM9zLUoyhWWwqvaw6iaYx2Y92A43MTje7yXPfgd4WEfLRImTPlpuIqS8GPA2+wyBzao+/WWIvV2oWmGRJajzOgkmrqyXvxboXC2f8oMj8L7+/zANAuQ62BVXCYvEVVpx02BP9LyPpnIhfhX/Wws7KKn50Glnhr/E/p3PQQL2aQfwL6yxyGypqu3r8b7pdy6ncFtglLFs+MdMXm1v/8+dheg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bZiqnWea2xcPZDkHrYZPjbW7DR9s0k4RvcFEdnfU16s=;
 b=VusSGttHweMczH3bB/S1+0Fp34cZmwU1J0WspimnecIt3CwuXzmRqhj3LSmVM3B3yJ2zf2GXtOfjximApCMOUahLO3EI1y5EPE8LFMzRxC3i3Bbiu9IzYJPyp9Km7ImKSY9aTrBh/m6O6o765/Wu68nEqUfDI6s1nQ5HIF+zX4Q=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Thu, 22 Oct
 2020 23:44:53 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3477.028; Thu, 22 Oct 2020
 23:44:53 +0000
Subject: Re: [oe] [meta-python][PATCH 4/7] python3-bitarray: Upgrade 1.5.3 -> 1.6.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201021111609.28237-1-leon.anavi@konsulko.com>
 <20201021111609.28237-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <ab9f4251-31cf-f2c3-3743-4ff343af3418@windriver.com>
Date: Thu, 22 Oct 2020 19:44:50 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
In-Reply-To: <20201021111609.28237-4-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BYAPR04CA0005.namprd04.prod.outlook.com
 (2603:10b6:a03:40::18) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BYAPR04CA0005.namprd04.prod.outlook.com (2603:10b6:a03:40::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Thu, 22 Oct 2020 23:44:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d702a4c5-0950-4e81-49c5-08d876e478e1
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4896:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB4896088BB4EDE35FE73F77649F1D0@SJ0PR11MB4896.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bvlQAPtCdZPqi4jscYEgTPrN2aGfDr6GdvJjIvYhUCL9f/ZmMHdOUXArFZbDgXxt0Tc0aj1Gq6tgiBWp1VBhhzbVA/zn74Dno081Fyg9Y2LBaOdLPPsyzgwAoRJR6fnQaXyGHHm375iXHU796ah7unVHSr3BbmKBflj8UAtqdtzJHwZUAiSZUw2u1UdwrnpvkMiwyEykYHViO2yVEqR9p/Od4p8QvdwDJMxB7APqR7j11qr9Bj2WGdA2lOD4tlc3Yl0o57dqVyIUKvOgqcCjiJ9qbyzs0wTOBGgm7ypQ68nrx3eA1Fr/IuLd0k1eURT47pZm1KxT0rQb/TG9358JFSEqoXWZDBZ14NaO8oGjkQ/yIW9aRe6/c7mS/KVrfgS8hVcVyltVhEQH157xjheAtje/Ufp33hQ/GdxKFvZMmDnT/FmYoosM40mthRX9RozYiENea6jL4b7ZNNgKqaaPug==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(396003)(346002)(366004)(376002)(2616005)(31686004)(33964004)(478600001)(186003)(2906002)(956004)(166002)(44832011)(8936002)(6486002)(966005)(8676002)(83380400001)(36756003)(5660300002)(66556008)(53546011)(316002)(86362001)(26005)(16576012)(66946007)(66476007)(16526019)(52116002)(31696002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	hBR8qczK+DeGwbqdTsYhgsfI3431AqOnN0JM2ofs2xfGRmVUM2C2OmoOP9JxMULp/6dC70Ya1GFgvvXzVyukxBPKCQ8pJxpu+wkrJEH36aSvhJE/iHqm7weigxx7FgUM4+iMfu10yX7n986vczwsCswWA/YFpscV0wALeNlsTCEa2/1CIWKbQYlmSBmnL4iBhJpnDUZ4nKA4VUkzoVGElodExcUWcBnt0uZYDKB/jiFcSJ6t8W4y/oEuoz9OV9p2LEI6s3vfp39XtcYMWad0bp2moI0IzB6tHGs45fKMqnII5MEMRH/2YMlscsJBp+f2lpwDbiSMmpu5cke1ChucHzAv/CCXfdoG9HfH4UD7zYgWpHn1eOqrU8CIlyvjImsS9lY5/o+q0zkcwqye1kV5gwV+Y4mtFI7Km2dB6CnOKZKCFc2hSGI0KrvZugf7sDs1WWDBqlJKoK+d/XBi4PhKNrMEHnosEdWbxHP5RXZW0bWj6XCCMzmwz4TCbFO30nH6m13WT5DqeO7vgm2Q0d7wWyy9kG38jgvhSgtHuyvfJmesstP1jjV9iyvgds+bcMhHLpuLvs/XZpMeEW0FA+Sapnhy9CLJmSjnzUJX3cqB2ZVoaEXeyA3d/7JK96w/my1gOkhqBpxNzsvl8j0QWfEjjw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d702a4c5-0950-4e81-49c5-08d876e478e1
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2020 23:44:52.9284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7/U0NIE/WkxTCzB5A8aWQEiaukWDJYl5l9DAs4UdkaInXCC0Ewwie0McQI8qgEOzh1DPze3nh6YVrwKnLO/X7JYmTj1ii1GNQt9DIAYVdtM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4896
Content-Type: multipart/alternative;
 boundary="------------35728740C82842AA3D6F57AC"
Content-Language: en-US

--------------35728740C82842AA3D6F57AC
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/21/20 7:16 AM, Leon Anavi wrote:
> - add `decodetree` object, for speeding up consecutive calls
>    to `.decode()` and `.iterdecode()`, in particular when dealing
>    with large prefix codes, see #103
> - add optional parameter to `.tolist()` which changes the items in
>    the returned list to integers (0 or 1), as opposed to Booleans
> - remove deprecated `bitdiff()`, which has been deprecated since
>    version 1.2.0, use `bitarray.util.count_xor()` instead
> - drop Python 2.6 support
>
> License-Update: Update license file, license remains the same.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-bitarray_1.5.3.bb => python3-bitarray_1.6.0.bb}  | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-bitarray_1.5.3.bb => python3-bitarray_1.6.0.bb} (68%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-bitarray_1.5.3.bb b/meta-python/recipes-devtools/python/python3-bitarray_1.6.0.bb
> similarity index 68%
> rename from meta-python/recipes-devtools/python/python3-bitarray_1.5.3.bb
> rename to meta-python/recipes-devtools/python/python3-bitarray_1.6.0.bb
> index e36a17027f..b085cf7c09 100644
> --- a/meta-python/recipes-devtools/python/python3-bitarray_1.5.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-bitarray_1.6.0.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
>   LICENSE = "PSF"
>   LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
>   
> -SRC_URI[md5sum] = "7cfa242b99351646fab0d76b05aab747"
> -SRC_URI[sha256sum] = "567631fc922b1c2c528c376795f18dcc0604d18702e0b8b50e8e35f0474214a5"
> +SRC_URI[md5sum] = "08ddac722b139c1544087c4953a6335b"
> +SRC_URI[sha256sum] = "ba157ddebddc723fe021fc80595b3c70924d69ee58286b62bfca21da48edfc9d"
>   
>   inherit setuptools3 pypi
>   
>
> 
>

--------------35728740C82842AA3D6F57AC
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/21/20 7:16 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201021111609.28237-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- add `decodetree` object, for speeding up consecutive calls
  to `.decode()` and `.iterdecode()`, in particular when dealing
  with large prefix codes, see #103
- add optional parameter to `.tolist()` which changes the items in
  the returned list to integers (0 or 1), as opposed to Booleans
- remove deprecated `bitdiff()`, which has been deprecated since
  version 1.2.0, use `bitarray.util.count_xor()` instead
- drop Python 2.6 support

License-Update: Update license file, license remains the same.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201021111609.28237-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-bitarray_1.5.3.bb =&gt; python3-bitarray_1.6.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_1.5.3.bb =&gt; python3-bitarray_1.6.0.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_1.5.3.bb b/meta-python/recipes-devtools/python/python3-bitarray_1.6.0.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-bitarray_1.5.3.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_1.6.0.bb
index e36a17027f..b085cf7c09 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_1.5.3.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_1.6.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/ilanschnell/bitarray">&quot;https://github.com/ilanschnell/bitarray&quot;</a>
 LICENSE = &quot;PSF&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d">&quot;file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d&quot;</a>
 
-SRC_URI[md5sum] = &quot;7cfa242b99351646fab0d76b05aab747&quot;
-SRC_URI[sha256sum] = &quot;567631fc922b1c2c528c376795f18dcc0604d18702e0b8b50e8e35f0474214a5&quot;
+SRC_URI[md5sum] = &quot;08ddac722b139c1544087c4953a6335b&quot;
+SRC_URI[sha256sum] = &quot;ba157ddebddc723fe021fc80595b3c70924d69ee58286b62bfca21da48edfc9d&quot;
 
 inherit setuptools3 pypi
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------35728740C82842AA3D6F57AC--

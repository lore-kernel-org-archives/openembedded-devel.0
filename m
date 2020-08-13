Received: from NAM04-SN1-obe.outbound.protection.outlook.com (NAM04-SN1-obe.outbound.protection.outlook.com [40.107.70.77])
 by mx.groups.io with SMTP id smtpd.web10.13219.1597334187966934127
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2020 08:56:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=RZqxOQ8q;
 spf=pass (domain: windriver.com, ip: 40.107.70.77, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cMQCACFQKl2+19uLFk7iPDEomo+pjWjfngtr/esk2U1rBuctF8NwfspNBdAhUMu2XiclfABBGFCZ4NBapDQDS/cWXjYt5ea7wAdVVe3znNok8tbSVHYrXf4vFcVf3jS266i1tq1GlFjg5fyEROgie1KdzSnxQGEGoip7DgxZZjKKC5z2W41hojL2cKxaHxH0GzcX0mtycqDkGrCCuqPm3fSn66/P6VeC8Im/DD6E4YGO2SIE4crpfEt+1XGK2mAW4byM6Gbws7M6k4YYhmdc4ztfTs2fEL88mwWQBqBluzdVtFeHYDhWv0h7tnaNcs0JQr8IndNNUCvzIH/dVBJJBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VsjZrcHi6HkRFsXvXxo49swjnMz5FEsGEgT3S+B8E70=;
 b=XpB6ujQ85yl7dHuqyjwhATFQjSxWYOGK/C1s+I0ibQDIfHu6IkaBYpHrjrKurx2NqafTyFku49KJoTrF7aaBYkWojKFyxINu9JrvvW9iOriEzqFzrzVMkFsO4nRC0QebBw8gD+BUbD5xB8rwW2f4FVWzGUU0N+ehSm45Jcb8pbm+OsIRMc8Uy96jgI9qTKnBVZkssQkuWgWgfk4lDGIKBXDbTwcm73l94gAIKid9MYjdo6kVBKLiuMddJl81PCWeApwEWLWB46cffhSXZQ/EuA7ur+FHJesLbUHDQ00r5hyRrUhyQvQ6RFNhVL0w1UeQ5qKmCperiwUUic/SFaS/Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VsjZrcHi6HkRFsXvXxo49swjnMz5FEsGEgT3S+B8E70=;
 b=RZqxOQ8qBx8NnIDnC4VY2I23PbJjcMigP5z4yuGvhn2nPTBc+ktqXGdZA2oJyECDwltKUm/g552Fcbov8SD1vdhAetgynwF78+ZZph7+DtWxLwVIoBt1QvVy7OPqWe6lj/SpBVpeRD4n6SW88+Xuw1PtlnhHIR/S/naOqmC3EeE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3814.namprd11.prod.outlook.com (2603:10b6:a03:fb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15; Thu, 13 Aug
 2020 15:56:26 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3261.024; Thu, 13 Aug 2020
 15:56:26 +0000
Subject: Re: [oe] [meta-python][PATCH 4/5] python3-cmd2: Upgrade 1.3.1 -> 1.3.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200812102726.4376-1-leon.anavi@konsulko.com>
 <20200812102726.4376-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <cac9ab6a-e25a-1e91-38cc-8aa09eb6d76d@windriver.com>
Date: Thu, 13 Aug 2020 11:56:24 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200812102726.4376-4-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTOPR0101CA0011.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::24) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTOPR0101CA0011.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend Transport; Thu, 13 Aug 2020 15:56:26 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7f07bcd-b469-46a3-c17f-08d83fa16f8b
X-MS-TrafficTypeDiagnostic: BYAPR11MB3814:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB381469515F314125B3E263749F430@BYAPR11MB3814.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:212;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	O6Ddc2/v+l3AwYilsf71zMGkLRuJkDMPqOcMQGG+HA2NJTQKXefDPSh+wW3LZSk2Vtt41VKkz8vk8ySZGhc5RI/lPf7/hzxjZYaYKIgE4SvJNAc5+iC3P5la8CmvF7U+kogxneP63iG6peM9vcRsC8CMC0zM6coChU52r8RjkTkic1yrtXJCwVtbPEmu/P/MRBxaW6FOyoTjQ74nHeoPIhsEad5UdDsI6RiM3uzRZZ7qjSsk4niS5BtKRSosfivrF2HnaaRAQ2op/4mZTTEezlqjuwC0eHGOw7hWzotdJ7t7O58ixfbBBjoLnY4Qb4t4sNH82SJlD1ruSK0fOSZdiyHiDz3YqLdPY4/GnJXeIPNCXNA5aRYhQCqO4sF6+jdhvSpJMRgpwQ9JaPfLAZgECeRAAmx6tFXdTK4TWy0sybTj8i9hG9hSJQY06xxhSDx6Iw2ujaWu8l+OpGIbwfFMhQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(39850400004)(376002)(366004)(136003)(346002)(8936002)(16526019)(66946007)(66556008)(966005)(66476007)(2616005)(31686004)(31696002)(44832011)(186003)(956004)(36756003)(166002)(83380400001)(26005)(86362001)(5660300002)(16576012)(53546011)(33964004)(6486002)(52116002)(8676002)(316002)(2906002)(478600001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	oOY53t+A5AjKcmiN1nZmrz1plD9mo9uuSYMKKIk7NGtQ6jGXkXzqD1xYK72G236ZjXzccKiqPiqNQEiLwZZOObcDETs2dLM7HbmsUki+byaC9ihVXWEjn9In080E+1tRWUy89d9E+KdPIqLfaElbEwFYvC/IMd3e9pioUbG4ObjMOIIu3CY1xNyRvI5G5NYuF7C6ZSLbWxzOTe5TvPIIz7e1hrGi93cOS2ggzv+6hSCVUC04cWkgACOPCA8ejcKKsCpTgkoGmCEgXLU7VmdUwsSSZhoBirGPnydQtB0f3hn5D82jcq5FAeBi+opNlTPKBPiCbzUfGZMWgOI8V6cWgl2djZWqBA0zkPQRYeOdxpe/7qgYGFXOS3KgDmngjHJoUPy1z8VGVSQSiS2KwUn9sgSB9BDa/Vb+21UdAi5J1fFpcKna7UO65AA7DnU7nLwqx/4pfIni7L7TGeS/+IV4/J+ebU/xQu53a7Qp5vD69t98uHCp9nNdQ8JR9nTuHTklP/M5MIsj9cvCB82YCeU4IrndSEnAS1T97EAcRduhVtTbdEOrMdArXXhyHmpG6WFP3ddyl9UT0COZkEqWzclBkFogrsPWUopWzlkQK2P16SiCkpd7SwF5ZO3mMDBIfoJPqoE9hygj6q3Nv2d2gyKa/g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7f07bcd-b469-46a3-c17f-08d83fa16f8b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2020 15:56:26.8558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zAruUcSbnyYr1eXQy4KPvmEC1DqhzedbcSeCUEYh/WAzm0rXtLECDQqSFCBnfCEYIg7M+P5R/JS4sOBnZ6kkq55q4lWIn5Adx4BusR4GGZE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3814
Content-Type: multipart/alternative;
 boundary="------------C312A0557E9F0803A480E318"
Content-Language: en-US

--------------C312A0557E9F0803A480E318
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/12/20 6:27 AM, Leon Anavi wrote:
> Upgrade to release 1.3.2:
>
> - Added functions to fetch registered CommandSets by type and
>    command name.
> - Fixed prog value of subcommands added with as_subcommand_to()
>    decorator.
> - Fixed missing settings in subcommand parsers created with
>    as_subcommand_to() decorator. These settings include things
>    like description and epilog text.
> - Fixed issue with CommandSet auto-discovery only searching
>    direct sub-classes
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-cmd2_1.3.1.bb => python3-cmd2_1.3.2.bb}   | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-cmd2_1.3.1.bb => python3-cmd2_1.3.2.bb} (75%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-cmd2_1.3.1.bb b/meta-python/recipes-devtools/python/python3-cmd2_1.3.2.bb
> similarity index 75%
> rename from meta-python/recipes-devtools/python/python3-cmd2_1.3.1.bb
> rename to meta-python/recipes-devtools/python/python3-cmd2_1.3.2.bb
> index 15b10d0f5..f5d6099dd 100644
> --- a/meta-python/recipes-devtools/python/python3-cmd2_1.3.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-cmd2_1.3.2.bb
> @@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=9791cd24ca7d1807388ccd55cd066def"
>   
>   DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
>   
> -SRC_URI[md5sum] = "9f0af0810da98a30ac92f1e4e7a8c8ab"
> -SRC_URI[sha256sum] = "c86f3b8348798732759c9d53cbcb6258a8f21f60c1a1268e942d24c9dc50b4c6"
> +SRC_URI[md5sum] = "ee7199d76f75bf01d8a162db6b696662"
> +SRC_URI[sha256sum] = "645792972e1c0475b03fd575d8ca95c526db970d886669a399307eb52fddd7bd"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------C312A0557E9F0803A480E318
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/12/20 6:27 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200812102726.4376-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.3.2:

- Added functions to fetch registered CommandSets by type and
  command name.
- Fixed prog value of subcommands added with as_subcommand_to()
  decorator.
- Fixed missing settings in subcommand parsers created with
  as_subcommand_to() decorator. These settings include things
  like description and epilog text.
- Fixed issue with CommandSet auto-discovery only searching
  direct sub-classes

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200812102726.4376-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-cmd2_1.3.1.bb =&gt; python3-cmd2_1.3.2.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cmd2_1.3.1.bb =&gt; python3-cmd2_1.3.2.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_1.3.1.bb b/meta-python/recipes-devtools/python/python3-cmd2_1.3.2.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-cmd2_1.3.1.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_1.3.2.bb
index 15b10d0f5..f5d6099dd 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_1.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_1.3.2.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=9791cd24ca7d1807388ccd55cd066def">&quot;file://LICENSE;md5=9791cd24ca7d1807388ccd55cd066def&quot;</a>
 
 DEPENDS += &quot;${PYTHON_PN}-setuptools-scm-native&quot;
 
-SRC_URI[md5sum] = &quot;9f0af0810da98a30ac92f1e4e7a8c8ab&quot;
-SRC_URI[sha256sum] = &quot;c86f3b8348798732759c9d53cbcb6258a8f21f60c1a1268e942d24c9dc50b4c6&quot;
+SRC_URI[md5sum] = &quot;ee7199d76f75bf01d8a162db6b696662&quot;
+SRC_URI[sha256sum] = &quot;645792972e1c0475b03fd575d8ca95c526db970d886669a399307eb52fddd7bd&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------C312A0557E9F0803A480E318--

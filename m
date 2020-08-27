Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.67])
 by mx.groups.io with SMTP id smtpd.web11.25438.1598552369683078231
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Aug 2020 11:19:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=M6yJ2Q31;
 spf=pass (domain: windriver.com, ip: 40.107.243.67, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mlYRfGeV/iGRAo8Mhxg91Y3s42U9W3t3S8ZfoLVX5CWZlsRUHuT2Kz/9vQrCjeqLXaZPDaTA1aJZLG3/6TnHWY/DXsVtyKL+kT52ozWeXrzXcNL++YRT3zS7kl4aqLRNJaHawqHhhKNTbEc/HOLhKuNnd7+MZkGWO3emtxWhRCsjFVsPQ/ZOrmYUsbRkrWC7JMiLrcaBEEF5dyEAvwUFFr7WIi/o56ttuO+JUqgt5eSdHFo8sJqmFKKpyzrSgDyu5SfT0wMQ5v27yyVvtYaZzyzA4Z3LFi8j2HiDSBnCjacgIOsmVtCHKWhx/whcWOEmiSbNEQSQ20jFhvmjAp8g5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WTJJbdHGA8TK3pMBAbhcR6q1CURvnUwNfStriknSDDU=;
 b=ZzHuJnwSNACaha6nfKDWMvBSqogjl1PgHVesVm4YCTB6hsnL+5LICN+BtC52B6oH1tgai/7IU0yOpWR5wk3Kltnv6h4vHRpggxuPaBFvepgKjeN++vMu7y0GMbb85LOayTnB9SNYJ81tjG35W9rTGHx6yjACSA3akkTwB/QK/RxxHqxtan8DE7FbMaOsFs4hJe1o2AiFgARvKr+0VRMXiiXln/qFWXGDLdQe60e3agzQ17XSn9BQHOkpIgRIMKMY6qtvq4JoYgJM0wUNzjsgvTcekpBmzCoistd/hpxgqhIgII11hNvmyxIMwlYuWpHrOEI4PFEGuU3C31gSkypBrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WTJJbdHGA8TK3pMBAbhcR6q1CURvnUwNfStriknSDDU=;
 b=M6yJ2Q31l39Y9unTgpGU6lk37Mm/BVZSyoeLA3d8iHNqotUTVX1nBm98v/H/qlPVbiq4VWLS6E3L0gGClFxg0+QjuHunhYRUjcG/lDzajpCBIWvVAU7DI4G7FJ/U5xpDDBYonkpeJ/T/Pu38qQblV+tnJr1pA9k3fwdMF8BTgi4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2726.namprd11.prod.outlook.com (2603:10b6:a02:be::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19; Thu, 27 Aug
 2020 18:19:28 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3326.019; Thu, 27 Aug 2020
 18:19:28 +0000
Subject: Re: [oe] [meta-python][PATCH 2/6] python3-cmd2: Upgrade 1.3.4 -> 1.3.5
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200826154020.29208-1-leon.anavi@konsulko.com>
 <20200826154020.29208-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <b88df9d9-a2f0-c3c9-1ff2-429faa64c3a4@windriver.com>
Date: Thu, 27 Aug 2020 14:19:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200826154020.29208-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0016.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::29)
 To BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YT1PR01CA0016.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Thu, 27 Aug 2020 18:19:27 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 90ab2e36-060a-4fd0-02b6-08d84ab5bc65
X-MS-TrafficTypeDiagnostic: BYAPR11MB2726:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2726F182FFF858BB898B55C39F550@BYAPR11MB2726.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:192;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+aTIuVr/Jl+CK+9GiZadDmrIcy8D/uV/VqsRFRlpFs2AZBpfnuZS1XqtWLimWh0+wVDJvcskuqIwfsrTZqObLBmvjIBCxXedVHEh4kk1U4Xe3Fd/R/QIzFiEQH1wbbllblhAFhSFVt0y6QFKJZ2dHRebIv8Ob4iiZ6z+R2okKhcWT45CgPHgbNCkVYVo7TVMP2e/s7lXYfxIlITpv9A2YUK9FekpNF9o6j5Y3vx51YT2VoL+kvC/uQ7ZKYG2QbYyY7VoQOTKhdtGWAuQAfTc+8FjbAapqxkwnNKee7MYhlTjvaq3X816DuOsW0SAFSnZp9tazUPG/ac9n7Q/08R9aWrrUP1S03NC0VMFBk7UzJbsiZtYX3RP0CCF7OEd5AW3g1tz3MfYEj/bOaYzio9IS1m0rnTJHSUToQUCIoAUZDXyAjYbuhQRXGWcmxBTh8Ch+3JTLYWh5gePHTX/4rAdaA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(396003)(366004)(136003)(346002)(5660300002)(66556008)(2616005)(956004)(26005)(31696002)(8936002)(6486002)(83380400001)(33964004)(966005)(66946007)(31686004)(86362001)(2906002)(186003)(66476007)(53546011)(52116002)(166002)(8676002)(36756003)(316002)(478600001)(44832011)(16576012)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	CaoRYq+JoThW7gXfNfWfqK8bKeHvDajZV02RWF63JyysqNR4FkmtuJNZ+KXOQRmV/MA4ZjUVVISH6dq6BcP+b2ZuzVpefmB/XPFaLsEz4463eprL9IGfngmuqMVzXOlAZk1BuzDU5TJ7H5y55y6jgX6iZUZuJ4IdRMEXaVWX38PbMWTVwlX3mTjyeVFUKBR8j6jPzsYMtc15rvfxpYFFWOzKUUl4f/Ja+gKX8K/a5Etb4ovTxpQ0dxhBYyK/6E4ZQhG1pgY6ORh10jrZQP7WesqEb5zc6rH2Lqtw81448zyWnrcBAaQwTR5p9E4Vnb9nZWvCOvmMjlz4pweCWiF6choE7/ShptlFuR4qWyhiWnDO5W6CfMIDxQ9VOLmS2+mmWMM0bnyrttFMOcP8cUqDhCnIvZSE306ls6s5TKfrQG/FVvbBgs0R4dFtgPVehi4NZrnddtbXn4j77pZnWIS56rcmU/YYqYp0V/GyIv9lC5TwV02CXKKumz+OmeBpPP/cuNC7AA6MF84R6HHxum2lKJZIIz0F9oTZWTnMcPr9JIAByGlle4gYktDF+y08lTqTpJuM7uFmfxTqOYlG+G/lxdoOxVIM9dzz8vXEAzoGgqaT5RIYt3cGjvxIaiN17X62jEAOlPaFjctW+ISreYnDyg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90ab2e36-060a-4fd0-02b6-08d84ab5bc65
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2020 18:19:28.4766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uZ16rtuGo1yMNhScaQxLOyyr7/7ixUSSQ7W+85oMhFJG+GpoxtF9QDaBV0xxrELh2uoydeRg1geH2r+4kHeuOnrWPgXnDzvA2iP0csItViQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2726
Content-Type: multipart/alternative;
 boundary="------------502ADB7693FEF162E3965769"
Content-Language: en-US

--------------502ADB7693FEF162E3965769
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/26/20 11:40 AM, Leon Anavi wrote:
> Upgrade to release 1.3.5:
>
> - Fixed RecursionError when printing an argparse.Namespace caused
>    by custom attribute cmd2 was adding
> - Added get_statement() function to argparse.Namespace which
>    returns __statement__ attribute
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-cmd2_1.3.4.bb => python3-cmd2_1.3.5.bb}   | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-cmd2_1.3.4.bb => python3-cmd2_1.3.5.bb} (75%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-cmd2_1.3.4.bb b/meta-python/recipes-devtools/python/python3-cmd2_1.3.5.bb
> similarity index 75%
> rename from meta-python/recipes-devtools/python/python3-cmd2_1.3.4.bb
> rename to meta-python/recipes-devtools/python/python3-cmd2_1.3.5.bb
> index ab05b82e1..c0daec42a 100644
> --- a/meta-python/recipes-devtools/python/python3-cmd2_1.3.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-cmd2_1.3.5.bb
> @@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=9791cd24ca7d1807388ccd55cd066def"
>   
>   DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
>   
> -SRC_URI[md5sum] = "6b746468d1fd606b5dd96058dde0c5ac"
> -SRC_URI[sha256sum] = "b56f82f3ef3c9a0aa08423e25a97516a3e19239b051426be5686611786fd6032"
> +SRC_URI[md5sum] = "a4a35ebe43179bf071430e2e8c7963e7"
> +SRC_URI[sha256sum] = "d9ef1d657e98b1c6898bca75019fd661db410f81febe6e1aedded9667f39f37e"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------502ADB7693FEF162E3965769
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/26/20 11:40 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200826154020.29208-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.3.5:

- Fixed RecursionError when printing an argparse.Namespace caused
  by custom attribute cmd2 was adding
- Added get_statement() function to argparse.Namespace which
  returns __statement__ attribute

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200826154020.29208-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-cmd2_1.3.4.bb =&gt; python3-cmd2_1.3.5.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cmd2_1.3.4.bb =&gt; python3-cmd2_1.3.5.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_1.3.4.bb b/meta-python/recipes-devtools/python/python3-cmd2_1.3.5.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-cmd2_1.3.4.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_1.3.5.bb
index ab05b82e1..c0daec42a 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_1.3.4.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_1.3.5.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=9791cd24ca7d1807388ccd55cd066def">&quot;file://LICENSE;md5=9791cd24ca7d1807388ccd55cd066def&quot;</a>
 
 DEPENDS += &quot;${PYTHON_PN}-setuptools-scm-native&quot;
 
-SRC_URI[md5sum] = &quot;6b746468d1fd606b5dd96058dde0c5ac&quot;
-SRC_URI[sha256sum] = &quot;b56f82f3ef3c9a0aa08423e25a97516a3e19239b051426be5686611786fd6032&quot;
+SRC_URI[md5sum] = &quot;a4a35ebe43179bf071430e2e8c7963e7&quot;
+SRC_URI[sha256sum] = &quot;d9ef1d657e98b1c6898bca75019fd661db410f81febe6e1aedded9667f39f37e&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------502ADB7693FEF162E3965769--

Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.46])
 by mx.groups.io with SMTP id smtpd.web08.10289.1605211334750848934
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Nov 2020 12:02:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=h6KrhoqL;
 spf=pass (domain: windriver.com, ip: 40.107.223.46, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cAKZAzkwNVv74cXq5eYsKFFC1ENXvSE3K/ui0MCuf6yGQLQfjok3CKjPG1CEY4gZ3jcYeYACdDhEFhFJui0bI6ZKBzYzhGgwhp4+6b5PHWXuux33GM6flIfIpgxhCGFl/iGInZgNJxkoVyNjaTY7zoXXuJ6TKeNszkfaIukNDEkqKtsB5h77nXJbl4sCHvDmAcLdq1cpIxCby0WnLRVuW4kaF0hcc2+XSlRlNcEFGYTa36lcg0klp+BzIEj3o5X5hsIDFhFdcMILn2Jmy8eaMVg8mgT4y8xNy12qRUfr3AV/4Ejtm4n9ne493pontuQ9Fj01dWzxs1ne/EaWzLmueQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vQ7RvNicTV5//a3vF8JK+rdT0C3i3KukZK6/udYadkk=;
 b=gMcZJR8NouoAAmhmz/6soybRU5hHVtcM0ckf2L04e86tnoJktm4R0Oj/dKLFbIeAF307xxbq9121YgfaX1bi4FZWhZg75q74cGavXZTwt+O4HFAdFiWS8ASJXNYWZ7pplFRL4jG6WjNKotioftjlm2dJUx+GMYRDo6+X/W2qWJkie46MyYYBwkGrF9Nv4l09vILLDS2V8/ykEwC7KFfUB3Nv174mMU/C9VpBnwvPwdiTXvOq8bYLMc5CQ9J4oPE0yhbfYhClVOGeE4UilGA9zcRVfnGcEhKaXc6HTA2DBHbyL34WwL4PefU0BP6Tre1UKGKsWBBdDBosa+cTInusVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vQ7RvNicTV5//a3vF8JK+rdT0C3i3KukZK6/udYadkk=;
 b=h6KrhoqLfGajzMchyJJakq75cr2kmUciP1KkMWE6AB6ydvzh8jsdORXESAPjr9NKQq2YaaxpWcjPim6GZ0x4C1EJiM6WZ5hhQ0nHamCxFME18nQiRq81TaOhncpICMgtyijzwvTAl1nUx4M7qWf0Wef/nK+t3sHNXe4Pd68mgxw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3112.namprd11.prod.outlook.com (2603:10b6:a03:85::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Thu, 12 Nov
 2020 20:02:13 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3541.025; Thu, 12 Nov 2020
 20:02:13 +0000
Subject: Re: [oe] [meta-python][PATCH 1/2] python3-cvxopt: Exclude from world builds
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20201111181323.897884-1-raj.khem@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <6bc455c0-78bc-2af1-2cfe-41d97501d9db@windriver.com>
Date: Thu, 12 Nov 2020 15:02:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <20201111181323.897884-1-raj.khem@gmail.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YT1PR01CA0136.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::15) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0136.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Thu, 12 Nov 2020 20:02:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e60dee18-bed7-4796-f000-08d88745d8dd
X-MS-TrafficTypeDiagnostic: BYAPR11MB3112:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3112A8A752AD8D939A5C14019FE70@BYAPR11MB3112.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ThprPAm2uOr+OGMvEpJxeghkjYknkEEtlRRHM2IUTSmsPAAUfEnWIrweUueG6ZAOfWq71C3jVOw0dtPED0iyFMv7D7CsGr6SxRX9OpjTCbAH9zbtBQtmNb4kbYqQP6r/igvEgecAlAU6QbkrZHDElF04dEomsystZIsw5Z5V+sbVUb77etcIMNeor9kml7G4Fk6wUmNqWOmF+uQRK74uyUR0Bpuy7cKdLtZSBKJaQMLAgnqgzmNs6zCon+QV9gz6hUS8febei50zTLbVw6VUfMQAvSuvOx0JEwj8YjLYLYv2uKPdo0SdNQGVHaDoN0xKMbo7RY62qqtc2SF3iblzUaLIUX7aIPap76qr7yMCSalPIfYL0fbhusyOOZwRXRsXRQVgRgELpXVD4yHDWe8BRsX78djrQ4jLcZqKsD89cJ1ArJFLp7XzZOghcEGFxfrtVz3SSonv2Yh5sCw2WOp7gA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(346002)(366004)(39850400004)(966005)(2906002)(316002)(2616005)(186003)(31686004)(26005)(53546011)(166002)(16576012)(16526019)(956004)(36756003)(52116002)(66556008)(33964004)(86362001)(478600001)(31696002)(66946007)(8676002)(8936002)(6486002)(83380400001)(5660300002)(44832011)(66476007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	K8YMokOIz/fwtbqAtD+uBIHZxGUO/1MiwjjIVLrycoWZk+vc0YPgow0Je7I5bd3GIBUJQ0GwIke4JRgpniV/sDrBBW8P5yJzL803HlH4iMv2BbXPByu+6PIUGAkJHDynYNqyyhi41kn63lUJo/Fn+mI7bslvaQg+sEYlyU4fC3Z5EQboI798Ii7gz++DXdvNBVf0bQT3zxyp92+/vF3QiItfvbfqZj8ZITEr1gMe715IHm9uYiE8o7Gzd9FKWGdE90e8RCIxgaAY9Jujr4yzf0u7vYotINuR4IP46pwvAcLx+OSysnXdBjQfyei0nYfV3IMYu3x9qtOdYB+L+LSlVlF/vj7qxVO9byUNewO9Zy0VwtOMSm4HKxkgLKTCHFD5ErRlfNEJ0KQTY557LAtGUn+btkSaGa0/bANa2SoEwIMgoN4bm5CmBlBMniy8gWr0gnATtaebdbrNywLQFCVsqVlfVd7dQfU0k4RLFMa+hQDvizpyMy0XTCYQyZuDgAOkPNDLFx6e4b7tg465WKrJp0YNrwrzGICyWiRfCPr0U1m0vgE5ICSjWVqG7NWq9B5Gt/84bzn+vU+rOnbUmY7op4tmOONWExNW5AaBaLKfAim9rIRXzBTSbf9k1qZ368iIs0j5rrcqoqwWO0DIrYBpgA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e60dee18-bed7-4796-f000-08d88745d8dd
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2020 20:02:13.5720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3y/hl1JWiNKjM+kZooZLKxcSfjlwkhHJLdwQSGRzPn3X3eh3vHAwGfEcsbhAgR+GzGweIMqSR3ubOjC6fQ5WC5LJb9YGE1ljsXsAJtag8/c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3112
Content-Type: multipart/alternative;
 boundary="------------199DD9422FD4732F2D994923"
Content-Language: en-US

--------------199DD9422FD4732F2D994923
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/11/20 1:13 PM, Khem Raj wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> it needs lapack which need fortran
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   meta-python/recipes-devtools/python/python3-cvxopt_1.2.5.bb | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta-python/recipes-devtools/python/python3-cvxopt_1.2.5.bb b/meta-python/recipes-devtools/python/python3-cvxopt_1.2.5.bb
> index b440d62bd5..ef06b56022 100644
> --- a/meta-python/recipes-devtools/python/python3-cvxopt_1.2.5.bb
> +++ b/meta-python/recipes-devtools/python/python3-cvxopt_1.2.5.bb
> @@ -17,3 +17,5 @@ inherit setuptools3
>   export CVXOPT_BLAS_LIB_DIR = "${STAGING_LIBDIR}"
>   export CVXOPT_SUITESPARSE_LIB_DIR = "${STAGING_LIBDIR}"
>   export CVXOPT_SUITESPARSE_INC_DIR = "${STAGING_INCDIR}"
> +
> +EXCLUDE_FROM_WORLD = "1"
> --
> 2.29.2
>
>
> 
>

--------------199DD9422FD4732F2D994923
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11/11/20 1:13 PM, Khem Raj wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201111181323.897884-1-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

it needs lapack which need fortran

Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201111181323.897884-1-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 meta-python/recipes-devtools/python/python3-cvxopt_1.2.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-cvxopt_1.2.5.bb b/meta-python/recipes-devtools/python/python3-cvxopt_1.2.5.bb
index b440d62bd5..ef06b56022 100644
--- a/meta-python/recipes-devtools/python/python3-cvxopt_1.2.5.bb
+++ b/meta-python/recipes-devtools/python/python3-cvxopt_1.2.5.bb
@@ -17,3 +17,5 @@ inherit setuptools3
 export CVXOPT_BLAS_LIB_DIR = &quot;${STAGING_LIBDIR}&quot;
 export CVXOPT_SUITESPARSE_LIB_DIR = &quot;${STAGING_LIBDIR}&quot;
 export CVXOPT_SUITESPARSE_INC_DIR = &quot;${STAGING_INCDIR}&quot;
+
+EXCLUDE_FROM_WORLD = &quot;1&quot;
--
2.29.2

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------199DD9422FD4732F2D994923--

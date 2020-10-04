Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.61])
 by mx.groups.io with SMTP id smtpd.web10.10784.1601818655550252008
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Oct 2020 06:37:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=V0l6D/s6;
 spf=pass (domain: windriver.com, ip: 40.107.93.61, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YKFkLIjWLXUNlZW3YK3adX0UBoarociv23r4+VxjmY4g0I0ufsvBtNgwXXFiJ/pCQMTC19PfCP70oht3XkaqX1j10Kioc1r9jsp4q6rRXyWAJtBeistZAAB+75aIg/PkSfbAn22tpVzn32vI+xmYWZO/N5N4q/cu9kzFX8hlQlgOK4DX5VELL5QhX8Era7g6uefHXf/CXs56+2Yd4dtNrM1sEf11JBpUBJYJl8kxG1X82dYOgXXVenEX0PDRWV0oyxBj8irWdbwAZSRJanonf4xtd9tB5Mc2XcJC7ekegFeIoAYiz4NZkqkfZeugUItZj7KB5jNeT1rWp7mNC2wBoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o1jJeHoUDVSX0gpt3hYpmTKAQFetGqSMyPUrkhTcs6I=;
 b=nABS876ulteqHzqX6lLAxiirhkauxr1P8q7ZRUnG4CF7QeknQgq11RNS3PlhaC/gMOhU666mPF82Ic+m6I+IyPisVVzjaIWJemNJW8JWoSVlAXbYmKXqDo+VtU3it/rJQoAgwi83mAXntliKUaXLqFL31ML4kim0trBhiIHUTQKH0b14z0VDX/gDCGjHphcU8d1HTcda/S/vWnN1w3FLdwYg0X/bfg2EaVGySCnVtWfdwazutqzKU3wTS4dpMjFomKqPxYfGXh+kuzr6euOUIn1EI9vqnTmmWQyCtgIKoMvmhQf7yd93DzFR+dEi5eKyB7ZPu/PHMzBZiWcpTg+AAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o1jJeHoUDVSX0gpt3hYpmTKAQFetGqSMyPUrkhTcs6I=;
 b=V0l6D/s6V1jzMno56F37QBtpvABtUBXPZKglB6Tpc3eNRhuIdMycvTvxXpxS9x1nq1T7WiLxQcAVqIh7cRUP+V+5/ZU+jbKPHsemC5sTaZTS1I/IxsaWE3TUtftZNGjjlyi02BaTUvYn9RUAQdywuEdmzw36FvNXNyIcySYXBeQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2951.namprd11.prod.outlook.com (2603:10b6:a03:90::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Sun, 4 Oct
 2020 13:37:34 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3433.042; Sun, 4 Oct 2020
 13:37:34 +0000
Subject: Re: [oe] [meta-python][PATCH 3/5] python3-humanize: Upgrade 2.6.0 -> 3.0.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201001082006.21365-1-leon.anavi@konsulko.com>
 <20201001082006.21365-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <a3cb89c8-0026-65a7-4b68-83cb53e3c207@windriver.com>
Date: Sun, 4 Oct 2020 09:37:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <20201001082006.21365-3-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YTOPR0101CA0042.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::19) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTOPR0101CA0042.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.36 via Frontend Transport; Sun, 4 Oct 2020 13:37:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8f2e1d5-f6ec-4dca-c8fe-08d8686aa66e
X-MS-TrafficTypeDiagnostic: BYAPR11MB2951:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB29510AA6A10942E6C4D36E139F0F0@BYAPR11MB2951.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:285;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xEBqn+ElBRSfnqAY3vAc/WqPCuupf0sx9FZwtYbLtE6Be6SJpTW809vbyDRHbw62HHEGz/7o/xdaG+YXoxRAuBFBDuI3r3Tf7qDnDIsPW/J+csZcPmh8tBqzuznzgSnkztH3BwM/rmYjNktsj/qPsi5Mw5GcVlbOZdSLwDkM9DvifeheVsFUAi/EDfLQHCtyJKR2z5O5N8w1wkkoJK1zQBO0cJpc3tHz5qZ3koIOmpXLpeDzvOGKjlzZvABt7GfLSNwfo6EdlDIRE2wvX8VoDRNOb3vPP8QMty5pGSQXouEuTHTlkr9boYate24Aj3TZ4ulYz1Imh4KhSq7YiEUWnB7Hp3PW4Z/Ntk6mR42W6HPTdzV8oOfR9WgBd7I85a3DfPCP/T1Q+BG7ucKA0RI3msbiohlVpLfLN+3omfUylkOzMvuMbhGukc3Jv8F+ZmPTy3A/rx9Ko0zyZn+HPsfLYUnIm6+rOUz7d6Lml3JHhFI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(39840400004)(396003)(136003)(6486002)(186003)(16526019)(86362001)(478600001)(44832011)(52116002)(33964004)(19273905006)(31696002)(5660300002)(66476007)(66946007)(66556008)(36756003)(8936002)(8676002)(53546011)(26005)(83380400001)(966005)(83080400001)(16576012)(316002)(2906002)(166002)(956004)(31686004)(2616005)(43740500002)(563064011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	rZlQffUSsLlMhHzhTa25Bglh7wQZtHhPF7mOse4DashcvG4VAWYGwVRJaFTgklmigBvurM4dAkawmB7NSyE3oybeDcFOgId94PqcGY4ZnbgdAXYNGG55t8zFIcXKjruENvp5hUm3ffVNrfii1VyxOZNDbxh5Jxz6FZjIbsF7eKx/UwRnU8Hh+vcgOwpAPdhIAnwZdzJbZeFnxm/uhXpB0N6NANVyZLVrE9dnrLvAbxiSu7bZ4s48McbeSKZ+9ORhGBBm3SKwcxkVdTYEsTilPVMshtZRkHpkgReOJwvDzZYhrwBhRR7XRzMxpv/NbjQ1Updz3TYJHsZvgD4luWoeOO0PNCgLn1otGHn20+0YeXLYI+lax4OFAMnyUqvyblhnTVyCzI3IrtWzWpZUzBsYxXHSr9bKG7J3ci8f/HeLZdz63+GjrK8O0DG02nIHEABkpNje22/6Moef4GQNEGycg5GTYrTARSMB2QzGS8RgfbMmhtG1ZRsr/QJdIouFaJ1pr1vAguyBQGha47UOVhrL/M9pZIkYU/NT7rTCn2O7MclvpmD9l5r3MldSMvqTi4Ks63rOTGe0NHFvujOJqSd4XVqc4VXz80GkSCWX8MxOZTskLtXSqPqEJJaQQLlfir+xwddiLK4OjAwDCJb23FdTIA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8f2e1d5-f6ec-4dca-c8fe-08d8686aa66e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2020 13:37:34.3314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Da5gcVQrj0dQ8YpFwla1s/Jh81SI1xGYHqj+yUOXFODpnfQDzM7+qhtShqiL3/KdYtszftOhst/W4ETEB+FCsZsA1Y4rvWvaFC8v0sPGDBA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2951
Content-Type: multipart/alternative;
 boundary="------------4B8B29E6234DE3BA065DE4E0"
Content-Language: en-US

--------------4B8B29E6234DE3BA065DE4E0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/1/20 4:20 AM, Leon Anavi wrote:
> Upgrade to release 3.0.0:
>
> - Add explicit setuptools dependency for pkg_resources
> - Drop support for Python 3.5
> - pdate minimum_unit handling of naturaldelta and naturaltime
> - Internationalise a previously hardcoded 'and'
> - Update docs
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-humanize_2.6.0.bb => python3-humanize_3.0.0.bb}  | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-humanize_2.6.0.bb => python3-humanize_3.0.0.bb} (71%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-humanize_2.6.0.bb b/meta-python/recipes-devtools/python/python3-humanize_3.0.0.bb
> similarity index 71%
> rename from meta-python/recipes-devtools/python/python3-humanize_2.6.0.bb
> rename to meta-python/recipes-devtools/python/python3-humanize_3.0.0.bb
> index de1e985742..386fb1e136 100644
> --- a/meta-python/recipes-devtools/python/python3-humanize_2.6.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-humanize_3.0.0.bb
> @@ -4,8 +4,8 @@ HOMEPAGE = "http://github.com/jmoiron/humanize"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d"
>   
> -SRC_URI[md5sum] = "de3a507d9274912a3a177849a9349edb"
> -SRC_URI[sha256sum] = "8ee358ea6c23de896b9d1925ebe6a8504bb2ba7e98d5ccf4d07ab7f3b28f3819"
> +SRC_URI[md5sum] = "779b291ac40b73a0fd6006c0485c1794"
> +SRC_URI[sha256sum] = "db08acbd8e31954f146467a213a112c4b80a5b8e319e06b76aa184a679bd8b48"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------4B8B29E6234DE3BA065DE4E0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/1/20 4:20 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201001082006.21365-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 3.0.0:

- Add explicit setuptools dependency for pkg_resources
- Drop support for Python 3.5
- pdate minimum_unit handling of naturaldelta and naturaltime
- Internationalise a previously hardcoded 'and'
- Update docs

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201001082006.21365-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-humanize_2.6.0.bb =&gt; python3-humanize_3.0.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-humanize_2.6.0.bb =&gt; python3-humanize_3.0.0.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-humanize_2.6.0.bb b/meta-python/recipes-devtools/python/python3-humanize_3.0.0.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-humanize_2.6.0.bb
rename to meta-python/recipes-devtools/python/python3-humanize_3.0.0.bb
index de1e985742..386fb1e136 100644
--- a/meta-python/recipes-devtools/python/python3-humanize_2.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-humanize_3.0.0.bb
@@ -4,8 +4,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://github.com/jmoiron/humanize">&quot;http://github.com/jmoiron/humanize&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d">&quot;file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d&quot;</a>
 
-SRC_URI[md5sum] = &quot;de3a507d9274912a3a177849a9349edb&quot;
-SRC_URI[sha256sum] = &quot;8ee358ea6c23de896b9d1925ebe6a8504bb2ba7e98d5ccf4d07ab7f3b28f3819&quot;
+SRC_URI[md5sum] = &quot;779b291ac40b73a0fd6006c0485c1794&quot;
+SRC_URI[sha256sum] = &quot;db08acbd8e31954f146467a213a112c4b80a5b8e319e06b76aa184a679bd8b48&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------4B8B29E6234DE3BA065DE4E0--

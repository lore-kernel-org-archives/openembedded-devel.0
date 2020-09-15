Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.41])
 by mx.groups.io with SMTP id smtpd.web10.14860.1600180385537278521
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2020 07:33:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=bdhOwmQH;
 spf=pass (domain: windriver.com, ip: 40.107.94.41, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oeAjYfwEdk/duUMgaex0UpMpDyUVN2aOTsw8yk6RTpPROaAoeOw/LO4u1vcDuenFUrHAbVERRgLEwFseUEom+wk8/465JEMTXT7B/AvS7jH6iE3u0mnGcS6efNrwJ72bgxtvHWGWzvDMF3zdjlN2iPgz+435a/aSNwnEV4EGA0mgXUfCHnB4nMwod5zMfny8vqJeBjwz6J/rSpK/FjPsjETzmYGerAbtJs8DqSh3BXs6ai8RQyELZYe8E9NaQXS3pLBQ3xZyoGRY6kIRIlbX8XkEQ3LfyyzsNRrWjIEFioWPkAPWVWy4paefrEBCvd54mg1fxrbODWy+iORBP4Gjag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bkalhdSVdipyUSQr/7YKrdhq2u0fqStyYo9GNOgWqGY=;
 b=OKqmbkxY/fKraXbelr2WxALmUqg9TaeoqG5++tYT8JkANFAaOcYeaXM5+cY/2f+ZBk3wfcqctqHAuNhiulAKJXVfUCnCPRRAFZ3SCQEpOJpCLbm5x0LGYZCqQkar/Hb9poH1nAbG/asr40HvEV2y5cyKjPnXXh7sK8Lz9f8THcQCSB5FmqrX3WvpBmE96rFwpIP5htIWgMKOKGO5d4LLG2YSx8cpubaYP8Bc/7GlE5pkfPO59XlwBrZ6jB9ZSQ/itLtqgEC0QrD6mRJLFlWF6zwOgbFPSwmWv84bRBU4de1ZTUfsUeKeYOhERSCUOruEQim+KZkWDuVwc4eWWDRRrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bkalhdSVdipyUSQr/7YKrdhq2u0fqStyYo9GNOgWqGY=;
 b=bdhOwmQHfKJmGH6BGaeNuRv///P8Ol9+WNCd2zXQWtqaRU3Nph39bSvJ4jSAK+eIGVyzY8pjMbWN8d0m1/SBl0pT9YN2GxNrwElznKeh5wf+Z2+PGYYlSo6f/m5v4vRhjFUovqWOU0xdnRgqds4i044FCcRfMIKDC+IdcrRvidk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4388.namprd11.prod.outlook.com (2603:10b6:a03:1c9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Tue, 15 Sep
 2020 14:33:04 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3370.019; Tue, 15 Sep 2020
 14:33:04 +0000
Subject: Re: [oe] [meta-python][PATCH 09/10] python3-pint: Upgrade 0.15 -> 0.16
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200914131536.6072-1-leon.anavi@konsulko.com>
 <20200914131536.6072-9-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <55c43b8b-0b42-97c3-96f7-84d5ac181f16@windriver.com>
Date: Tue, 15 Sep 2020 10:33:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200914131536.6072-9-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::48) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTXPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::48) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Tue, 15 Sep 2020 14:33:02 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd48011e-cfc1-4a62-ba99-08d8598440b8
X-MS-TrafficTypeDiagnostic: BY5PR11MB4388:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4388097E67B818EF1F5066DB9F200@BY5PR11MB4388.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tTrtOPi2V8Gv4f25l1Y3TciBNjFjSi08mrs3ovgzxrlA2MzlLrWW5D3q/ZhON24hCrI/TpsXzZvHtJ6cVcmsd4OIzhbPe5Sqzi8I6HgZxrayWzI5BfgKMRet9J3gFQ+Eji+zcXN8IUEwxBjEVKavAZeAO5KDqdVNy0BZpk7oTT9m9CUTrSvW6+htWWGMPFMVNhF2tz8eet2O45idKG7wXgV9NAytuxLi+523xMZi96LsMdIz2I+iuz9t1N4HcM73QgcuGnNyHtp0yK3I1M170tZkqvS+iADZ6YBx38P/Ywx/k1RM/5vbrPZQuBsjkGinn2125Ck9/TGxsKL8gau9N7Ium6rgK6YbON4s/iGK3LyplpDH/s8vZWx3BZ+qO7r4Q1nX1v0o6i2sFkkU3YC8LD/DPcQgNix+L8J9Dq8yYKhDeBw8KEOnh/vvXvdU3d77bVqEqZ/WQJG+gbD0lKvhYw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(396003)(376002)(366004)(346002)(86362001)(66556008)(316002)(16526019)(2906002)(66946007)(66476007)(33964004)(966005)(16576012)(26005)(53546011)(52116002)(186003)(166002)(83380400001)(36756003)(8936002)(478600001)(31696002)(2616005)(6486002)(8676002)(31686004)(44832011)(5660300002)(956004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	lG6DWbzTbQMoJyVNEqUuNjhRxNKUW+Ee9aTPNzOlOnxSIGXtb+4B8fK9yA/810utF5H/AgHQ3+heSP5e8Gj4c7OmepTf5LLX1OwzNQfjJFOxNzBycnvvLQwRvbnPv9uDIx2XUtMZOUKaq/R/7WBVovrqfokCJRmRngfqIxGAlarcB3JDAIuqhzce5QO/CTNYG45ahsemy3bWhvEcmUvbiBJDWfe9cuPCK2Aj8FZKIkqhPcqE3NgugED1q2256ZVUM0XQt8m/z8gXXYdclidH99WMx7ub8MFZReQpnHpbgJ3SmZ06bDpbb4yi+3buzrzKfixcCgXm+G32EYHRwT6InPq00gXhKu7KEVxzlAKqm1xmrBB/Yt99jkuqoN7XWeKS2Kj/ySSQOynknMS8/PGiyw613A+AfFcCDIq8AHryViemf0K0+gWHdZjEsvoA1EwvZ/OzCZQrHpoHGpYE+dFmcWbvA1az8yCjNsJOjKI6mkvHzGW8nOYGquNu2yjmeXgICfbXqL1ABNGe7YeFK+S1JtWt7w8EvGaPGZMRMsWYgCYEJALYssj/ysaDxlUu+Dka6xZHHIX6CjsocQFmSWKbpp41PpZwkO1g4er6VZ2a8vZ7ea9HngRv7SB5Ianl0xiX2Pt4kgM3pyhVqaeRPzsBnw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd48011e-cfc1-4a62-ba99-08d8598440b8
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2020 14:33:03.1817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tveedwe2Qohyc1Ff48n34/WwivRZTYYBhDMGeVKww/t9kVxfk0nn+0Fvxr4M8UXSwj8NBOsrylt90DTDRVxsBaciNvy/7aUusIa1RA9/KjE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4388
Content-Type: multipart/alternative;
 boundary="------------ADDE4E03C0944A4E2460F41D"
Content-Language: en-US

--------------ADDE4E03C0944A4E2460F41D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/14/20 9:15 AM, Leon Anavi wrote:
> Upgrade to release 0.16:
>
> - Fixed issue where performing an operation of a Quantity with
>    certain units would perform an in-place unit conversion that
>    modified the operand in addition to the returned value
> - Implements Logarithmic Units like dBm, dB or decade
> - Drop dependency on setuptools pkg_resources to read package
>    resources, using std lib importlib.resources instead.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-pint_0.15.bb => python3-pint_0.16.bb}     | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pint_0.15.bb => python3-pint_0.16.bb} (83%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pint_0.15.bb b/meta-python/recipes-devtools/python/python3-pint_0.16.bb
> similarity index 83%
> rename from meta-python/recipes-devtools/python/python3-pint_0.15.bb
> rename to meta-python/recipes-devtools/python/python3-pint_0.16.bb
> index 4df5573b1..7775d733a 100644
> --- a/meta-python/recipes-devtools/python/python3-pint_0.15.bb
> +++ b/meta-python/recipes-devtools/python/python3-pint_0.16.bb
> @@ -10,8 +10,8 @@ PYPI_PACKAGE := "Pint"
>   
>   inherit pypi ptest setuptools3
>   
> -SRC_URI[md5sum] = "8171859d92713c13cd13ea7100a707f0"
> -SRC_URI[sha256sum] = "73b517bc4e49d199eb8ae9ed49104d74a11e596849ad2330b58c09e1eb6f327d"
> +SRC_URI[md5sum] = "ec78e4e42512b93f80b9093416ad7417"
> +SRC_URI[sha256sum] = "e437420e65fa72a2805f4036f986669c48d54944eeb0e47c8ba16f98cbdcd599"
>   
>   DEPENDS += "python3-setuptools-scm-native"
>   
>
> 

--------------ADDE4E03C0944A4E2460F41D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/14/20 9:15 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200914131536.6072-9-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.16:

- Fixed issue where performing an operation of a Quantity with
  certain units would perform an in-place unit conversion that
  modified the operand in addition to the returned value
- Implements Logarithmic Units like dBm, dB or decade
- Drop dependency on setuptools pkg_resources to read package
  resources, using std lib importlib.resources instead.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200914131536.6072-9-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-pint_0.15.bb =&gt; python3-pint_0.16.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pint_0.15.bb =&gt; python3-pint_0.16.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-pint_0.15.bb b/meta-python/recipes-devtools/python/python3-pint_0.16.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-pint_0.15.bb
rename to meta-python/recipes-devtools/python/python3-pint_0.16.bb
index 4df5573b1..7775d733a 100644
--- a/meta-python/recipes-devtools/python/python3-pint_0.15.bb
+++ b/meta-python/recipes-devtools/python/python3-pint_0.16.bb
@@ -10,8 +10,8 @@ PYPI_PACKAGE := &quot;Pint&quot;
 
 inherit pypi ptest setuptools3
 
-SRC_URI[md5sum] = &quot;8171859d92713c13cd13ea7100a707f0&quot;
-SRC_URI[sha256sum] = &quot;73b517bc4e49d199eb8ae9ed49104d74a11e596849ad2330b58c09e1eb6f327d&quot;
+SRC_URI[md5sum] = &quot;ec78e4e42512b93f80b9093416ad7417&quot;
+SRC_URI[sha256sum] = &quot;e437420e65fa72a2805f4036f986669c48d54944eeb0e47c8ba16f98cbdcd599&quot;
 
 DEPENDS += &quot;python3-setuptools-scm-native&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------ADDE4E03C0944A4E2460F41D--

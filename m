Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.56])
 by mx.groups.io with SMTP id smtpd.web10.21199.1602868373810595523
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Oct 2020 10:12:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=UZdjSkD/;
 spf=pass (domain: windriver.com, ip: 40.107.94.56, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DfkGYo36t0dZVNynp1I48F3C+XlP81Lka4ZIxVdWhx79bwyZjoAVygNwdwsly/SGGTn8xGRNDSLIcejBZ/NB+fNERvZGV4+PmPzKMD8zQsL+Jj51iaePs5TkWXHknYjPLU+f57nDLmdMjKFO+RNYvf2fVHVBUMVEm8VeFzjwQSQhXhn1b6d+iOJcT4UdxD4vGTyROcNWHKg/DLcoIfd2yJvHGl7GaN/3vM/Cv4Za1hFUqdN+2zmijGEMED9gn6Fsp9/jL4Emec2nuG1owrJRxWApsQ6epXmanEFm5MQYp6BdnF9M1oJMabVXu44nd0LWckmJuVsTGYSNs0IxUhregA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7fIPrlU2dFPJIVNL+YDolFNMEcAanxIHUIgdyxGI9u0=;
 b=ONs0kTbB1hx4Gnl6KMMrnoM1CNPsrongx6vKGomX4zMqz4vRyeYXcfaCX1aBzNZotJOXGCEe2cnrxVxG2P3wje9CZ4j20vUfX22L4djkwlqCi0VsaaZTzkxBRBoU/bAZMGyXfvOIDQ7eWWsavR8K4Yroa5bWH3lic4NamKbFvp5TgMBCMHkkCv6T+9vY4iYWVLF3DHRXKM0PVMCd5EH/RZO7R01iJHoGZD44NyBcb/FzcF/lVxrXTrTOAeMl2kL/aQhH+l0obrQGtUBhNfjq49Aab0IeYg1X9l6oKKsq3tIzBopJVCeozvERyJlCFrMsSg+GmY/d1RjQhqzpbgnY2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7fIPrlU2dFPJIVNL+YDolFNMEcAanxIHUIgdyxGI9u0=;
 b=UZdjSkD/vhrU9TR9+i9Z0ZzuErUUYSevB5nJxJtSZd+OSeBaRfDZcGBdFezRhbMJkYDkoAcq4JPJHDO0di4DMCy+kBKpyY9nxOOjgcxr7hn462kSLDnLmQH9FsWerhn2EpnM1dNYTJ/upXkL9uSWKmgsghCP5KuvTzmwedfcDok=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4182.namprd11.prod.outlook.com (2603:10b6:a03:183::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23; Fri, 16 Oct
 2020 17:12:43 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3477.025; Fri, 16 Oct 2020
 17:12:43 +0000
Subject: Re: [oe] [meta-python][PATCH 2/7] python3-ujson: Upgrade 3.2.0 -> 4.0.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201013085914.31580-1-leon.anavi@konsulko.com>
 <20201013085914.31580-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <958c0148-8e7a-4041-1ed3-e60ac0cddaa5@windriver.com>
Date: Fri, 16 Oct 2020 13:12:40 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <20201013085914.31580-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BY3PR10CA0029.namprd10.prod.outlook.com
 (2603:10b6:a03:255::34) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BY3PR10CA0029.namprd10.prod.outlook.com (2603:10b6:a03:255::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.23 via Frontend Transport; Fri, 16 Oct 2020 17:12:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 390b8d87-8a81-4561-e920-08d871f6b17e
X-MS-TrafficTypeDiagnostic: BY5PR11MB4182:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4182396CCC35ADE8F95E162E9F030@BY5PR11MB4182.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1169;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nwP7pWD7EYbmyW5lDGKh1dN223q0D40Wi+yAlLOrTDFhcnYwAOFCu5qBD43DNsFUfxffmg5DKgflWoKFfkKK1pWZ7PqFQG/uUyqLS0tFOMLjNGpt7FBTELzoLn0jTFPCVbhdmtg3KFxDYhvlOL4qVzp6VXKxxp2wZkR8sTrfbvCqVSKRHivTBz7wPFS6w6q15WgvN5f42M1eItpvBD9bRg5n45DqrR7JOmmghiSZmqxJYr/b8lpU2kPvEcj+3RE3YN7iXyFXqYFLYZ1ALEKmxTpgmOkW5MKLYVzL58EKJu/S5TGsYt17EWWzJNnT8hka+bE77D4dVo+cXG8AqzOfQ8o7k61gj5ZzzMYnax5Igkdn9WCtQX8I2KB4hPgJKH97EpwMYPmkHm2kWPQYiQ94/vVDKxDX6uf7AMQ2GW6PANx9XdfPJXbk1NF6/U3JMHIILKi1bmqWG4JWPopw//KCHier69s2s7754z2diBFQzjnLSdarAfAUP4EbGQ1EsXYf
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(396003)(376002)(346002)(366004)(966005)(66476007)(66946007)(2906002)(2616005)(66556008)(86362001)(478600001)(53546011)(33964004)(16576012)(36756003)(52116002)(16526019)(956004)(26005)(8676002)(316002)(5660300002)(166002)(8936002)(83380400001)(186003)(34490700002)(31696002)(6486002)(44832011)(31686004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	dXta6s5ZVun7Io00cVOnmmiejAlPc76MmvHh5DtkALYIqdq1tvKjQFJ7NylCUChREjzbCJf8mWXYPcSjzAT9aGU5Ny1J1h3S6Rex96xOvXWifrxlkdxDUNnaQryuir4tqFzQBw0QFZVxQKW2YonZOGNihgIXMWQNq5H3ZrqKcEUXzh83jPJDDFehV8xXCeAVnpb4MpRXbhnkGq52IELzur6Dm1yEGpQfdnEZxIH6vIFkaGPK0xQoUSM4MbusdLVJk2VhpFhiNZuxWxyp5oSZhNjkGUM/anQ/bcUNV8nZAYEY9IqMJNHbeE0u+pjuPAP2Pmgyok3Xd5Bpshhrz/eG9L8svIOkcpVXtupG5W1/eAJk6Qw4K/IDe9hVIZT+FuDOQqBcboboOwDezPibLTvRMT9Yo200XHsJFrAgT+lIPQ8p10I+Byj/0xtyiTin/FJQkye8b5+ItMpjsnBIDthz5TXj2mWR3eMjvK6XzuppEHL75vDNMJ60N9yYyplho3wsRHz8Ka4/74np5RcgQcP+vCXd2sEm0V78qWoI3wSLJ6i5eCtfYtQXfOgaWA4kZBN5YUTq6+bTW5Nu9q/ply82CPZLmOaq+wYIrLDBYqw4fIiAus34NnN3l+F9lcrdR5YsgPnmpZkJO9wKckwUXAuuKQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 390b8d87-8a81-4561-e920-08d871f6b17e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2020 17:12:42.8522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WzsfnwGtRSY8RY3/vRQHgUstubDqpb8G9Q7nqYTWN0dcxCmXPcRw+uOvq6pFwxM2NP9iGQWGNla9GLPkYaGCTcaV9JM24TpgAw4q6RYkBoI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4182
Content-Type: multipart/alternative;
 boundary="------------F6C927EFA6415386BC6C131D"
Content-Language: en-US

--------------F6C927EFA6415386BC6C131D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/13/20 4:59 AM, Leon Anavi wrote:
> - Fix UnicodeDecodeError on arm64/aarch64
> - Add support for Python 3.9
> - Build wheels for Python 3.9
> - Drop support for EOL Python 3.5
> - Fix indent and add test case
> - Update code samples in README
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-ujson_3.2.0.bb => python3-ujson_4.0.1.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-ujson_3.2.0.bb => python3-ujson_4.0.1.bb} (83%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-ujson_3.2.0.bb b/meta-python/recipes-devtools/python/python3-ujson_4.0.1.bb
> similarity index 83%
> rename from meta-python/recipes-devtools/python/python3-ujson_3.2.0.bb
> rename to meta-python/recipes-devtools/python/python3-ujson_4.0.1.bb
> index e1d7d9d79a..2475306f91 100644
> --- a/meta-python/recipes-devtools/python/python3-ujson_3.2.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-ujson_4.0.1.bb
> @@ -4,8 +4,8 @@ DESCRIPTION = "UltraJSON is an ultra fast JSON encoder and decoder written in pu
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=10fa10456417c0252bcb8a498e498ffe"
>   
> -SRC_URI[md5sum] = "a524264ef4069e18d742e32e90845a3f"
> -SRC_URI[sha256sum] = "abb1996ba1c1d2faf5b1e38efa97da7f64e5373a31f705b96fe0587f5f778db4"
> +SRC_URI[md5sum] = "c8030a62912c3be18ff99fa5b25258b8"
> +SRC_URI[sha256sum] = "26cf6241b36ff5ce4539ae687b6b02673109c5e3efc96148806a7873eaa229d3"
>   
>   inherit pypi ptest setuptools3
>   
>
> 
>

--------------F6C927EFA6415386BC6C131D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/13/20 4:59 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201013085914.31580-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Fix UnicodeDecodeError on arm64/aarch64
- Add support for Python 3.9
- Build wheels for Python 3.9
- Drop support for EOL Python 3.5
- Fix indent and add test case
- Update code samples in README

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201013085914.31580-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-ujson_3.2.0.bb =&gt; python3-ujson_4.0.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-ujson_3.2.0.bb =&gt; python3-ujson_4.0.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-ujson_3.2.0.bb b/meta-python/recipes-devtools/python/python3-ujson_4.0.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-ujson_3.2.0.bb
rename to meta-python/recipes-devtools/python/python3-ujson_4.0.1.bb
index e1d7d9d79a..2475306f91 100644
--- a/meta-python/recipes-devtools/python/python3-ujson_3.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ujson_4.0.1.bb
@@ -4,8 +4,8 @@ DESCRIPTION = &quot;UltraJSON is an ultra fast JSON encoder and decoder written in pu
 LICENSE = &quot;BSD-3-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=8;endline=8;md5=10fa10456417c0252bcb8a498e498ffe">&quot;file://PKG-INFO;beginline=8;endline=8;md5=10fa10456417c0252bcb8a498e498ffe&quot;</a>
 
-SRC_URI[md5sum] = &quot;a524264ef4069e18d742e32e90845a3f&quot;
-SRC_URI[sha256sum] = &quot;abb1996ba1c1d2faf5b1e38efa97da7f64e5373a31f705b96fe0587f5f778db4&quot;
+SRC_URI[md5sum] = &quot;c8030a62912c3be18ff99fa5b25258b8&quot;
+SRC_URI[sha256sum] = &quot;26cf6241b36ff5ce4539ae687b6b02673109c5e3efc96148806a7873eaa229d3&quot;
 
 inherit pypi ptest setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------F6C927EFA6415386BC6C131D--

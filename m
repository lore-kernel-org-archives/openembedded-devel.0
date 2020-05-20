Received: from NAM04-CO1-obe.outbound.protection.outlook.com (NAM04-CO1-obe.outbound.protection.outlook.com [40.107.69.53])
 by mx.groups.io with SMTP id smtpd.web11.13386.1589983998442854139
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 May 2020 07:13:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=SsF9knX/;
 spf=pass (domain: windriver.com, ip: 40.107.69.53, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lslRHFe+DoeIST9SjSXreaMyvIT561mrIZsNVbEu4k+JD96nVefouAnp8HOi/npQyTQn2x6wPEWmZz6zIlh0hehFbfKVo4+bABYabpLs5gDVAyB7wLaFn7LyQ3x70wGHMXozzexoQRvkj787gyosaf/qs+fAGxWNRpPZkvZj66LDaJ1x9NXhxr6j1zp0Z7cfuMIe5By+b0CPgzXXKFodRfSNULbfaXEjyowN+o2KLSHFZoCQxzW4Uy425l7mwW6SAgHuAEFNaoEWy3DYPlUx64vofbDe0CsHCoGIOBvXg7VBBCjhIakmHm7zdBTNwLMr7Jk3c9vMKdemP9cEzJn7+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RlbU71WVxMdJOLgbRfRdBMkPcoyJjA+BeUSi8pX0yno=;
 b=kHRWZoucNVw9tsAOjBtkPHtv0DRSEByQ9rckNHyPbopizcVJCcU5viTJtcVCGdZH2d8J6wrI+hW2tQlgZ5HiHrYGiBQ6yCbmk1/01Pw/PjktF0N0NEYLTEw1Vi0hziSL0aoimYHWs/gNVYGHd8SE2A8XjtkbU3/fakZKH7hdvwLRAvhf1zaYlz8o6PaRALNmQ/Scxyg1VtSgU7aMF92CbubPTg3KhMC/q3RWKOTnxOpZOKO5zAYy6t1FIkTvTMPKEb17UwsZcdHF1iZ2yUk2ZNNRSbC81eoMEB6LE7Qs7Jqk6NXQEpzagIZOzWOBuVcUmLHQSxrbAPSX1aVXiA7NIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RlbU71WVxMdJOLgbRfRdBMkPcoyJjA+BeUSi8pX0yno=;
 b=SsF9knX/qkUINoQYVUDgjmYVzCs/GLONRUllhd/l48J+CLcZWakZP4nwMKawQhnyZe5yaQ0+gIIqGusxU1+JhW8FoYKjHdsXgWSPulL+V99WEslKKV0XlHz1NtvKCXvmUxiUld7X9bK7WclDhOuW6T2p524zzhKRcgIEV37WBBc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1331.namprd11.prod.outlook.com (2603:10b6:404:49::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20; Wed, 20 May
 2020 14:13:16 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3000.022; Wed, 20 May 2020
 14:13:16 +0000
Subject: Re: [oe] [meta-python][PATCH v2] python3-iso8601: add python3-numbers to RDEPENDS
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
Reply-To: openembedded-devel@lists.openembedded.org
References: <160A5C4D5532F28F.26752@lists.openembedded.org>
Message-ID: <34a335af-0e47-1efd-f0bf-db2da2702852@windriver.com>
Date: Wed, 20 May 2020 10:13:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <160A5C4D5532F28F.26752@lists.openembedded.org>
X-ClientProxiedBy: YTOPR0101CA0065.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::42) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTOPR0101CA0065.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::42) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.24 via Frontend Transport; Wed, 20 May 2020 14:13:15 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 90997409-5a59-4ba8-30d2-08d7fcc7f095
X-MS-TrafficTypeDiagnostic: BN6PR11MB1331:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB1331EE65978574FA1AD74A0A9FB60@BN6PR11MB1331.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1284;
X-Forefront-PRVS: 04097B7F7F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Vtrqec2djDUfahSJwP99LrOnAb1YU31rP8zpwu+SeGm6HWqA0lK2j6g4x5zLk4lto218yIWagvPGCqpps4ScsanQ0LS7nbbuOwDY7c16t7E1x0SHjZVmO6BbTlKptuUqmKsdhoK3lNmnqCy8tJMK5duwX3Dj155K6KjMBGdX1KCgvCphxSHz87YuOmD/RS4HHjwtr7zQFdgaFBBBswRJk/9KLMJGssXF+baI0Bi5FAkLafY+YdWweaRwI+kvRGKGg+/aHZdbihnqfcfS91SX7rf88sgckYFEq/10OYDbaaB/gTYWB7hqNmxltbep0yEGhG58n6oz4A+4yqhZP7EwbMP1pGWo7UO7v3FrXcM/1O6WlOFxS5mQxXyMvYKw7dN7tLZkUX6TkS03umBVAZgYqyG2zwqEkIcjm9C50oIAnCVpr4c4NBAXCGuF7A2YJW0FVjuxz1x5/5U6S9+ebOVe+/jfBwtL7lUHm0OSDI67rCoeLAZOTBymuHzsTCvPXXTOuEywF4muWLHfn4Xcgv9nydt+bK3FKqC0+I2yYeCjqqQPik52AYHLpJbeefa6K9FOf40zJG+UOfgfStwDkY3wKg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(376002)(346002)(366004)(136003)(39850400004)(33964004)(166002)(52116002)(26005)(66556008)(966005)(36756003)(186003)(66946007)(2616005)(53546011)(66476007)(16526019)(956004)(478600001)(8936002)(16576012)(316002)(31686004)(8676002)(5660300002)(44832011)(2906002)(6916009)(6486002)(86362001)(31696002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	MVgbo6LRjgrvTdsSNZnXaMi8vWUpGfEsPcMn8OScDcQ9F8WJ41CLDGxHLm+H+OkA1QGDhae0OuNLOBO21nkALHUSEKtSePMGiHEjo/oOqfCIGyUQksyA3PLFNM3PtNTG9Bn//xRNuNP/5HvlUtio573B1u2s/kjqzyxzc5li1wvmeuH5Ak53asV7zzU8CO54z2i6eVFXV5CWSvewyPrczR8g1FdvT0b7dT8jEfOw6njEmyFYVIczMMF6yQvivezbQfMPbVpdMvpptlvKG+Knr9gtT2ku2sk8Ylyg021Gt85ohv6UK1PRLhupXYS/ei2oPd7UofF9JnqMF+NpVqtvS8Sp+s+bE/El68D4a+8HMXJ57VqLfqRSs34xHXa8ewS7gQBGt22YyBDeEjyg+kEiOKJma2ShgdyEXjRbPhh99NWyDZrBjy2j/WO+xwhC5xwWs59hz2GfLc9hni0mCbbfM0NgPAqQBNyqeF5aTlKY9bv4lyj5fcOJl1b3kULkRJg0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90997409-5a59-4ba8-30d2-08d7fcc7f095
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2020 14:13:16.5022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8/o6vDonQsJ8aSzdFZsizuQFXWNLW+GnEzezydpOS4T/B8qUTukWUcva42GJErRFWaibsXvho3vcSE2U/FpPWD+DyW2VBFikxDWpk5y4Ti4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1331
Content-Type: multipart/alternative;
 boundary="------------DD5E168E1166168BA236A0A4"
Content-Language: en-US

--------------DD5E168E1166168BA236A0A4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Bump. I don't think this patch got picked up?

On 4/29/20 2:01 PM, Trevor Gamblin wrote:
> Sending v2 to fix commit message.
>
> python3-iso8601 relies on the decimal module from the standard
> library, but it is not in iso8601's RDEPENDS:
>
> root@qemux86-64:~# python3
> Python 3.8.2 (default, Feb 25 2020, 10:39:28)
> [GCC 9.3.0] on linux
> Type "help", "copyright", "credits" or "license" for more information.
>>>> import iso8601
> Traceback (most recent call last):
>    File "<stdin>", line 1, in <module>
>    File "/usr/lib/python3.8/site-packages/iso8601/__init__.py", line 1, in <module>
>      from .iso8601 import *
>    File "/usr/lib/python3.8/site-packages/iso8601/iso8601.py", line 12, in <module>
>      from decimal import Decimal
> ModuleNotFoundError: No module named 'decimal'
>
> Add it to RDEPENDS to fix the import error.
>
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   meta-python/recipes-devtools/python/python-iso8601.inc | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta-python/recipes-devtools/python/python-iso8601.inc b/meta-python/recipes-devtools/python/python-iso8601.inc
> index 61e9abbac..b6e021c5b 100644
> --- a/meta-python/recipes-devtools/python/python-iso8601.inc
> +++ b/meta-python/recipes-devtools/python/python-iso8601.inc
> @@ -8,6 +8,7 @@ SRC_URI[sha256sum] = "49c4b20e1f38aa5cf109ddcd39647ac419f928512c869dc01d5c7098ed
>   
>   RDEPENDS_${PN} += "\
>       ${PYTHON_PN}-datetime \
> +    ${PYTHON_PN}-numbers \
>   "
>   
>   BBCLASSEXTEND = "native nativesdk"
>
> 

--------------DD5E168E1166168BA236A0A4
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Bump. I don't think this patch got picked up?<br>
    </p>
    <div class="moz-cite-prefix">On 4/29/20 2:01 PM, Trevor Gamblin
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:160A5C4D5532F28F.26752@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">Sending v2 to fix commit message.

python3-iso8601 relies on the decimal module from the standard
library, but it is not in iso8601's RDEPENDS:

root@qemux86-64:~# python3
Python 3.8.2 (default, Feb 25 2020, 10:39:28)
[GCC 9.3.0] on linux
Type &quot;help&quot;, &quot;copyright&quot;, &quot;credits&quot; or &quot;license&quot; for more information.
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">import iso8601
</pre>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">Traceback (most recent call last):
  File &quot;&lt;stdin&gt;&quot;, line 1, in &lt;module&gt;
  File &quot;/usr/lib/python3.8/site-packages/iso8601/__init__.py&quot;, line 1, in &lt;module&gt;
    from .iso8601 import *
  File &quot;/usr/lib/python3.8/site-packages/iso8601/iso8601.py&quot;, line 12, in &lt;module&gt;
    from decimal import Decimal
ModuleNotFoundError: No module named 'decimal'

Add it to RDEPENDS to fix the import error.

Signed-off-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
---
 meta-python/recipes-devtools/python/python-iso8601.inc | 1 &#43;
 1 file changed, 1 insertion(&#43;)

diff --git a/meta-python/recipes-devtools/python/python-iso8601.inc b/meta-python/recipes-devtools/python/python-iso8601.inc
index 61e9abbac..b6e021c5b 100644
--- a/meta-python/recipes-devtools/python/python-iso8601.inc
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python-iso8601.inc
@@ -8,6 &#43;8,7 @@ SRC_URI[sha256sum] = &quot;49c4b20e1f38aa5cf109ddcd39647ac419f928512c869dc01d5c7098ed
 
 RDEPENDS_${PN} &#43;= &quot;\
     ${PYTHON_PN}-datetime \
&#43;    ${PYTHON_PN}-numbers \ 
 &quot;
 
 BBCLASSEXTEND = &quot;native nativesdk&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------DD5E168E1166168BA236A0A4--

Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.80])
 by mx.groups.io with SMTP id smtpd.web11.9545.1593183667649917514
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jun 2020 08:01:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=DD7hRpQO;
 spf=pass (domain: windriver.com, ip: 40.107.93.80, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OIkpzhqcCCCipPse6Aj+xj0cN3N0CJWfLdB4xb051Vwdd7D8Xw1PGisgAk3z3yXRnMHUDtF4SfhlqeGIGU9VtuRchHi6LhuAdollc/9OeByEkdiaPjtppT8N5f5s/yeKl0peXYqbLluLvPWmxxszucUHIsx7hXBddyJR2s6WQDwFq9GnXZ/70VzBUq0WpQySL2+1PUyzZm4crTx0ZwpbJ6lWh9d6ZZk6hotT6r9HpIOeUMP2oGs9ph2cNlHylhQ+OPQqGQnLuQLLdc9cuCIDsixehxXtOgvURk/5DkSrKU1FHnuNahpng9pbYxn0pjMXl2yfuokYubOywBcx2Qp+JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MIuFa1Y4Q70TvJHAp9B2Q3CbiMa1Q1qu65gUH/hn6kc=;
 b=O++FwTcWCOXcxFXe72UGGMKNLPSIDcwtQXlxFaaoFbg/q3o0os+NxZnq39W1fyTFkshvI8yiwbwrhvxXzgDBrhc/xWJyMjvFLWtGgSywaBHfW6yKuFaf3wP6UxdWQVxMIPb28QQxApyUf4hH63HMIIMD8nEMbYhNyfMlbaZDyPB2wLJ5nwi8v/RlHyMlToSuIHgMzxcAA17wSRhIIhR8B4d+3PXjt1U1lSOLiCKkNx3ZV2s/IWwQbj2PWhkWxqrpVrKi4t76mMORMPaLMtZkx0ewBC8kjRx+w7cL3mMEKQF8CYifzhhQSFiI7HDm8ryjxHS87Ah6oWOqImKphtyfSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MIuFa1Y4Q70TvJHAp9B2Q3CbiMa1Q1qu65gUH/hn6kc=;
 b=DD7hRpQOGuk8xRw/oZPDn3xVGjk+Cwm5zUaKSAqiBAapayZd0HhRnFGts3YP0tsjmJstduClq7zdHPSw+zz1dtTo0aI6dZcXgztwfO5M16d4b8mSgpkgv9aIb9KSz5S5+FSOTdYOK4ROW0EYWluUU9rVTJp9pG7jH8LdNAnfrw0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1604.namprd11.prod.outlook.com (2603:10b6:405:e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20; Fri, 26 Jun
 2020 15:01:06 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3131.025; Fri, 26 Jun 2020
 15:01:06 +0000
Subject: Re: [oe] [meta-python][PATCH 04/12] python3-twine: Upgrade 3.1.1 -> 3.2.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200625090719.16068-1-leon.anavi@konsulko.com>
 <20200625090719.16068-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <00ec657b-3a40-f514-9b50-8d55bf0f40fd@windriver.com>
Date: Fri, 26 Jun 2020 11:01:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200625090719.16068-4-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0019.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::32) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTXPR0101CA0019.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20 via Frontend Transport; Fri, 26 Jun 2020 15:01:05 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b566b800-8cb0-4906-41a3-08d819e1c08b
X-MS-TrafficTypeDiagnostic: BN6PR11MB1604:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB160414A4FD3F60938A3EFCA69F930@BN6PR11MB1604.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;
X-Forefront-PRVS: 0446F0FCE1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EgGNn8L5PAbgA0fnI5zEfSixhdtOcpIAczSSjGThPoRT9fKJZu3KOOmZjxaLDGvFvqAXtRhrGZD+iN3icmsmmk6smIgDG81HX8uugGMkPxGPRsjAVJNw95BJQfOv4c2bvLyIu3ALSeN+bsztqKh5p/p1v2V0WfGHHV2TM9GpJ0uzBogvun9uhvg9QNDKjW2NN2rmpqurtpKH669Gfl9OeL5dB8WK4Gw82RxLYAInL+Sfc9mI9+TNnInrcKLWEj8lgv5AXEWDA9/cxk/GzVkxE8Fjyqb+ZFAjOMNBnP1QfOVlXcKo2jlZLAT+Ct6aNP1fRCVBq41uumKtop8H+mpcxqoFvlq2ERgc+4uUaPRTAzddZ6wBxQ7TrNxnltpXG8ZaR/WPWe2GCOb/NIbdj/FnVbsa39JMe5kiPL8bGjKC9Z/PtgW8vnLeDN36LupF5h6wGKVlsVltVGjOGLpq1N7z/A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(346002)(136003)(396003)(376002)(39850400004)(2616005)(956004)(31686004)(66556008)(66946007)(44832011)(83380400001)(6486002)(86362001)(16576012)(31696002)(166002)(316002)(966005)(66476007)(53546011)(8936002)(8676002)(36756003)(2906002)(186003)(478600001)(5660300002)(33964004)(16526019)(26005)(52116002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	sseTGqLZilX+ygs00G0CE+HYwS/pTn6uprQ+79JqLWww70YSP+0l8xUxzRf1w+aeM7cASL3wcS9eT1k7EopMOFNXULCFxK/9kVC8CJ+7IdU933b4B60AxFJq8o8uBzXm7x3qq/TSivRn2CPafQz5dL2z+JwdX2KaoCMbLZ8GeyrJwlqHWr2FnvrHPKVWkz1mPBLJTZaPccC8dzDYnXP0vC67wl/z7ktVxwww3Q7+zMs3n/OpxW6MnIIYDs1aUX292kkGWQRkRMrZdFi1Et5hiJRwfdV6nBz57OtmYpYfxGUz+wvMFQw/KT9fRSQXxnAhsTtHSTlzfdLnwWp9VzhWDTBwvD14ZHET2sFd217Di+1PTbv9OP1lyAt7lCmYgSSS3Okt/Jui3Dwr2F1ia5BkJi3ozmBU254iZ9lZA0Xs7e12HQYPqptiumVdkcHoWYe02jJuwc5ITTrW1l0HghoYwoTEibQra+e4LenrlJW5q3g=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b566b800-8cb0-4906-41a3-08d819e1c08b
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB0003.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2020 15:01:06.3971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q9POLC7jYO9TTTyBoNF5xXhi9I0NnvokYsPDsiIjRM3Zp/g6aJViaQqo5ohr0LDFzPgZ3xGyKtubV5TXvyt57ZWXiNj7W7HtxUISDCrWlaA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1604
Content-Type: multipart/alternative;
 boundary="------------F5DC606E9EF342273548AFAC"
Content-Language: en-US

--------------F5DC606E9EF342273548AFAC
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/25/20 5:07 AM, Leon Anavi wrote:
> Upgrade to release 3.2.0:
>
> - Improve display of HTTP errors during upload
> - Use red text when printing errors on the command line
> - Print packages and signatures to be uploaded when using
>    --verbose option
> - Update URL to .pypirc specification
> - Require repository URL scheme to be http or https
> - Don't raise an exception when Python version can't be parsed
>    from filename
> - Fix inaccurate retry message during upload
> - Clarify error messages for archive format
> - Add type annotations, checked with mypy, with PEP 561 support
>    for users of Twine's API
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-twine_3.1.1.bb => python3-twine_3.2.0.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-twine_3.1.1.bb => python3-twine_3.2.0.bb} (68%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-twine_3.1.1.bb b/meta-python/recipes-devtools/python/python3-twine_3.2.0.bb
> similarity index 68%
> rename from meta-python/recipes-devtools/python/python3-twine_3.1.1.bb
> rename to meta-python/recipes-devtools/python/python3-twine_3.2.0.bb
> index 31b55302a..34309585f 100644
> --- a/meta-python/recipes-devtools/python/python3-twine_3.1.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-twine_3.2.0.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://twine.readthedocs.io/"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=a3d1106b253a8d50dd82a4202a045b4c"
>   
> -SRC_URI[md5sum] = "faf033a3458de37df6cdecceb6da2c2b"
> -SRC_URI[sha256sum] = "d561a5e511f70275e5a485a6275ff61851c16ffcb3a95a602189161112d9f160"
> +SRC_URI[md5sum] = "41ce5c8aad253ef4b43b19c76997e2f2"
> +SRC_URI[sha256sum] = "34352fd52ec3b9d29837e6072d5a2a7c6fe4290e97bba46bb8d478b5c598f7ab"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------F5DC606E9EF342273548AFAC
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/25/20 5:07 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200625090719.16068-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 3.2.0:

- Improve display of HTTP errors during upload
- Use red text when printing errors on the command line
- Print packages and signatures to be uploaded when using
  --verbose option
- Update URL to .pypirc specification
- Require repository URL scheme to be http or https
- Don't raise an exception when Python version can't be parsed
  from filename
- Fix inaccurate retry message during upload
- Clarify error messages for archive format
- Add type annotations, checked with mypy, with PEP 561 support
  for users of Twine's API

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200625090719.16068-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-twine_3.1.1.bb =&gt; python3-twine_3.2.0.bb} | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-twine_3.1.1.bb =&gt; python3-twine_3.2.0.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-twine_3.1.1.bb b/meta-python/recipes-devtools/python/python3-twine_3.2.0.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-twine_3.1.1.bb
rename to meta-python/recipes-devtools/python/python3-twine_3.2.0.bb
index 31b55302a..34309585f 100644
--- a/meta-python/recipes-devtools/python/python3-twine_3.1.1.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-twine_3.2.0.bb
@@ -3,8 &#43;3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://twine.readthedocs.io/">&quot;https://twine.readthedocs.io/&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=a3d1106b253a8d50dd82a4202a045b4c">&quot;file://LICENSE;md5=a3d1106b253a8d50dd82a4202a045b4c&quot;</a>
 
-SRC_URI[md5sum] = &quot;faf033a3458de37df6cdecceb6da2c2b&quot;
-SRC_URI[sha256sum] = &quot;d561a5e511f70275e5a485a6275ff61851c16ffcb3a95a602189161112d9f160&quot;
&#43;SRC_URI[md5sum] = &quot;41ce5c8aad253ef4b43b19c76997e2f2&quot;
&#43;SRC_URI[sha256sum] = &quot;34352fd52ec3b9d29837e6072d5a2a7c6fe4290e97bba46bb8d478b5c598f7ab&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------F5DC606E9EF342273548AFAC--

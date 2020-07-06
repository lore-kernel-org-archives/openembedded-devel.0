Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.73])
 by mx.groups.io with SMTP id smtpd.web10.60471.1594049998396887734
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2020 08:39:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=g3XhYoiY;
 spf=pass (domain: windriver.com, ip: 40.107.92.73, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VcAxr8tNomFI3jfSA1uHkQ/nHDXRIqN8KfWFI2tJG6MozP+pkKUELNngprgL2G7P3FJkdPjsSOlMwiAZPbKhIk8/rdhqvvF6s59lqRbiJfb90uiwG3DS2QfhQB3WypR4z7NzuASWMmpDLXEGu6R60I7788FrV9dBVzqqHPnX1SdBvyM4I4YBzKlWQ0DZfy9fY8+jR1jVoaLxT/ppIpbkpQ4WY8jrUkf/p3uqEEST+8ztySh9/lpx18SlVCCRaPh8G6AdYsgLFKYDh2q6KbgIG9SPoMQf4N819JG4JmV3bEN8pwjcQuhMcL1gy+6BpHB+ysnU3pX1rpok9fE1/AuJdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jM5wbZh9g+sMJ5AgF4nCFnc0PkPovXtPq7k/Yo6Ds+g=;
 b=CQID5/Ati/QahBQV0NcgVNfyclpmfvnC2nNSTk/Hpbf0KoUgJW2MyPJgfeJ/BO5e8MEFdyipVjzDwkrfY/vvuWc/8kTYjztX9UdJQP1O1DVKXojyQjb1o1MEpYeZlsFoOHwoeAjq3aEsJujGPYIDarY679/6beVb59xWl5EvRA/POI2lcHyoj9GzNUjr4mhrCJb7z5nNfTGw5UNXX6fT/hVp54HUdLgCtbYCXh0A6zeCTTEvaWlspWQXbE6iTV+N2GouMOHcbrz0aojQdJKnveug0N7RMlfDjZ/wvzgEvrN6eiikPn0lZv9Aj/gt+/UXEnQ9KfvFPxGJNL4TEwkkwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jM5wbZh9g+sMJ5AgF4nCFnc0PkPovXtPq7k/Yo6Ds+g=;
 b=g3XhYoiY2tP2CCjVVoxo9mGpNXf6MFMMRWgwTOOGZz9HaatOGu284+cXDZyDooyBS5lsDmq8SddKecGp5nkJOMFxlllpChHjYDk0EzYSL1pK5azl4MLHIr5mvBtbtiKLiZmx62iZMdpJ/Y+iQyWTIk8mt7tq6eT99PgkofwjQqI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM5PR11MB1820.namprd11.prod.outlook.com (2603:10b6:3:111::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.28; Mon, 6 Jul 2020 15:39:57 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3153.029; Mon, 6 Jul 2020
 15:39:57 +0000
Subject: Re: [oe] [meta-python][PATCH 1/5] python3-requests: Upgrade 2.23.0 -> 2.24.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200701142243.1686-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <9cd943fb-5955-ef40-1ab1-c17c2ac6a4ca@windriver.com>
Date: Mon, 6 Jul 2020 11:39:55 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200701142243.1686-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0048.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::25) To DM5PR11MB0011.namprd11.prod.outlook.com
 (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTXPR0101CA0048.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.22 via Frontend Transport; Mon, 6 Jul 2020 15:39:56 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0152e869-dd73-4d90-7463-08d821c2d607
X-MS-TrafficTypeDiagnostic: DM5PR11MB1820:
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB182056186533A6A35497A4C79F690@DM5PR11MB1820.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-Forefront-PRVS: 04569283F9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	u+FTpsyYdh1dUbzDy9mhMO4oX0K64qNTg3tgtvJXKck7l1+Rw3FTL+5vsxGn42qOeyfqFXdAcjwZ1d8UlZL1xobRn+wKyTsDCZdBlrkGt5Classt96rDpDEbToKiaOKzK77LoY0sGDSZWn5FjS19bjejbLjT2S+OSEE5KqKotJ9kJz5FazG5Hi1JnlKw42TPyjq42manReHadTfa99FQewedHggKMAiQp7K4eO/vpGVnbRGNMUh+Ut/aGMA6aBrZPt2+NTP1wDUswX3Xzsd96WbNE5hiYYdc7eoDLqXg+bJkF+SEdHWEuQrdshSk7y+Nc8DwuzUaeyD3VhAluRwYGGvkCuIhtPJzEfRSvOGtszXO3EteiZ9YtYUgcmtG4HWONZtFvgH6paRADDaMWZpdTZwcZ1r2aqZoGUzdBYRAkzkCdxuOCmr4FO8g68uSBxcYMVkAfm1MQGTT44v+mFrgDQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(346002)(366004)(396003)(136003)(376002)(8676002)(33964004)(52116002)(5660300002)(8936002)(53546011)(966005)(478600001)(66556008)(36756003)(31686004)(66476007)(83380400001)(26005)(44832011)(2906002)(6486002)(956004)(2616005)(316002)(16576012)(16526019)(186003)(66946007)(166002)(31696002)(86362001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	qyed7HbQgFFMB9UK6jy5sPiHzbmTdF4zVkyrz9O6iBD9zw6Yw0alf93QqrkSjBWjfRf3pvXUSDYSZXBOwdXyZfA/qVStOYZsgStvSm41qAeSfMzyQUUbV8Op67yLbwBHl8egHrPq5CPmfHsGhJhr13AWpLGd/3rHsa+ydUICarNPxzLI2YtWLC4d6/Fu3MKKf0Hnp17UZDBAWngnY1u/Pkc+0WeKvWfl/hjSpn0c8kgfv/ksbY3rKNyMJXhDH6TSYxb99aWEZGVZSNnYKNi0iie3V9QIbsN2BCPgUTf3eTdG3pdKkvSm1FRdvrj8wTKcPAtGtR7vX57L04b2dbfuZqB+qkylA2BOl1fdVZc/+TaXe0YyYZa9VOpmdbUAGoS/KJRX1YNzFSzz/D/+GNVh6iEnh5k4PVZEXsEZaC/bjfT/0FxLJRrE1iy6Q3NorNAqxp/rqGuI8Nk63w73vznqsi/MIZ2+4pxr4LTSwLxaYaU=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0152e869-dd73-4d90-7463-08d821c2d607
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2020 15:39:57.2259
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1SbWseo9713aC5b0qxxkoE0inIBow4IdtjEUsORENI+DGa+DnCX5/JJb1QVKZZIN/EzHtmvgsTG/7tkXd/2k3fcVd9yMSm2eMo97YN/UvT4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1820
Content-Type: multipart/alternative;
 boundary="------------EF56BDE916ACABD323113506"
Content-Language: en-US

--------------EF56BDE916ACABD323113506
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 7/1/20 10:22 AM, Leon Anavi wrote:
> Upgrade to release 2.24.0:
>
> - pyOpenSSL TLS implementation is now only used if Python either
>    doesn't have an ssl module or doesn't support SNI. Previously
>    pyOpenSSL was unconditionally used if available. This applies
>    even if pyOpenSSL is installed via the requests[security] extra.
> - Redirect resolution should now only occur when allow_redirects
>    is True.
> - No longer perform unnecessary Content-Length calculation for
>    requests that won’t use it.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...{python3-requests_2.23.0.bb => python3-requests_2.24.0.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-requests_2.23.0.bb => python3-requests_2.24.0.bb} (81%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-requests_2.23.0.bb b/meta-python/recipes-devtools/python/python3-requests_2.24.0.bb
> similarity index 81%
> rename from meta-python/recipes-devtools/python/python3-requests_2.23.0.bb
> rename to meta-python/recipes-devtools/python/python3-requests_2.24.0.bb
> index 9f3fb7d2e..de9a53584 100644
> --- a/meta-python/recipes-devtools/python/python3-requests_2.23.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-requests_2.24.0.bb
> @@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=19b6be66ed463d93fa88c29f7860bcd7"
>   
>   FILESEXTRAPATHS_prepend := "${THISDIR}/python-requests:"
>   
> -SRC_URI[md5sum] = "abfdc28db1065bbd0bc32592ac9d27a6"
> -SRC_URI[sha256sum] = "b3f43d496c6daba4493e7c431722aeb7dbc6288f52a6e04e7b6023b0247817e6"
> +SRC_URI[md5sum] = "b54bff26a389e5932e8b1c4983a99ce7"
> +SRC_URI[sha256sum] = "b3559a131db72c33ee969480840fff4bb6dd111de7dd27c8ee1f820f4f00231b"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------EF56BDE916ACABD323113506
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/1/20 10:22 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200701142243.1686-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 2.24.0:

- pyOpenSSL TLS implementation is now only used if Python either
  doesn't have an ssl module or doesn't support SNI. Previously
  pyOpenSSL was unconditionally used if available. This applies
  even if pyOpenSSL is installed via the requests[security] extra.
- Redirect resolution should now only occur when allow_redirects
  is True.
- No longer perform unnecessary Content-Length calculation for
  requests that won’t use it.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200701142243.1686-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...{python3-requests_2.23.0.bb =&gt; python3-requests_2.24.0.bb} | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-requests_2.23.0.bb =&gt; python3-requests_2.24.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-requests_2.23.0.bb b/meta-python/recipes-devtools/python/python3-requests_2.24.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-requests_2.23.0.bb
rename to meta-python/recipes-devtools/python/python3-requests_2.24.0.bb
index 9f3fb7d2e..de9a53584 100644
--- a/meta-python/recipes-devtools/python/python3-requests_2.23.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-requests_2.24.0.bb
@@ -5,8 &#43;5,8 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=19b6be66ed463d93fa88c29f7860bcd7">&quot;file://LICENSE;md5=19b6be66ed463d93fa88c29f7860bcd7&quot;</a>
 
 FILESEXTRAPATHS_prepend := &quot;${THISDIR}/python-requests:&quot;
 
-SRC_URI[md5sum] = &quot;abfdc28db1065bbd0bc32592ac9d27a6&quot;
-SRC_URI[sha256sum] = &quot;b3f43d496c6daba4493e7c431722aeb7dbc6288f52a6e04e7b6023b0247817e6&quot;
&#43;SRC_URI[md5sum] = &quot;b54bff26a389e5932e8b1c4983a99ce7&quot;
&#43;SRC_URI[sha256sum] = &quot;b3559a131db72c33ee969480840fff4bb6dd111de7dd27c8ee1f820f4f00231b&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------EF56BDE916ACABD323113506--

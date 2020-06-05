Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.51])
 by mx.groups.io with SMTP id smtpd.web12.1022.1591380928335866468
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Jun 2020 11:15:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=NyJeqiPD;
 spf=pass (domain: windriver.com, ip: 40.107.75.51, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V8G4RB0wZ34fYFe8QOs2sPHY5LY/VWskF+SpvuFf48IuVtmdl3T2Z6BtMgp6Dnh2rzpz5u16pnFBUQrW9aT8TeqimS5B7s1hHCimOV6sUernQkEBpprJ7y4huefgg2CB/B+ZIawR7mKN8Z6jvORihBJmjRwwNOW350Pfpr5Dnnf6ghYdRnOXI9xlEKn+EhWYUbIy3XCxxv6dOSXEghYr7oOpE8dHf6mI8oqMrFfFPb5Tlar2m+Xpd+oEpq7ZP0UXJv4+7VrM6xypop24Ay8eawkWN4EYM+bUOfKTNLxlL1B5TN3y23C9vuaV0m3ABd3SZi0rusGnttVCcPMjTw3oiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QSV4LGKgfKU2S1me6mXnnEph74ToFjv/8gAB1sBquR4=;
 b=aRG1s0B8zEibfZGHBw65EU2gNRfEuNcWuE3n3C1skgNBLFXtij4TauLKkjdVvmLiH3euE9PTAz3cSDXLWGw1GfvcpwhhZiSAe7IYgPKnpVD7sLdG/8RluP9zk1CCzpmlpGwQJ6/tw4Lk96eYnRnr3vmnAyNlRqLUSwS+GVes2CWAGgz+VQlue+x/31oUgGYaKWT0AzUyJ4xsx5EMvsqdw6+gF3aRRcyhklYlyr2JttyQ6Bm0/6gSyl7f5T2egvkTuN73zoCyqIhj1yBGC7RTpnvIRqDywPBy9eMkSysem71A3vKh7pD6krZqH0i2IkJ2qRGJmPvdKw2AaLRj0Fbrsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QSV4LGKgfKU2S1me6mXnnEph74ToFjv/8gAB1sBquR4=;
 b=NyJeqiPDTTok/bQCfzUlOkM344Nx/tRiGbJV48tlEbvoY6g9uRKnEk4vghmoo4PJgu8ys4ynOEAtAWJPfhCq4rQcZo32YtlchEZpQ6Xt+cHDcEbVIjaMuYJnF1nFmKkXfX1QkSK8MUkb34GjEdl+xaYyHTlk2ib/atO7Fm7rtRg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1236.namprd11.prod.outlook.com (2603:10b6:404:48::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Fri, 5 Jun
 2020 18:15:26 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3066.019; Fri, 5 Jun 2020
 18:15:26 +0000
Subject: Re: [oe] [meta-python][PATCH 6/6] python3-html2text: Upgrade 2019.8.11 -> 2020.1.16
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200604121223.3818-1-leon.anavi@konsulko.com>
 <20200604121223.3818-6-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <5610ab48-4135-347a-5509-78455ff51b3f@windriver.com>
Date: Fri, 5 Jun 2020 14:15:23 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200604121223.3818-6-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTBPR01CA0031.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::44) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTBPR01CA0031.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::44) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend Transport; Fri, 5 Jun 2020 18:15:25 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: acc38bb5-fe0f-4996-1bcd-08d8097c6b8b
X-MS-TrafficTypeDiagnostic: BN6PR11MB1236:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB1236519643F9CECE5E5266799F860@BN6PR11MB1236.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-Forefront-PRVS: 0425A67DEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mYBLWp+a9DkGFJivkVMO16NPC3t+qfh9xJ1HlPCu+6sL7XxDcp/aEochoW1uAJ9rHkpaaSTbgTGN2ONozjZo8Xhq3n1DxLeZhdBoN6cFdngIto7t/nT2pKofcxUJPOXn0dE4aeP3/YJLFuWUCCQhT7xVRNDOwIBZfAjBRkLpBpQLYEp4NovWiOADF5/vaHAqNrTT68UXvENt9BlpXjJtjXx41YzRb04RYKvwrwG0TICXl2YUTQKgY+9QoIVCrUr+d1c8IXyqgEqzV6v+K2wJss+NaoFq8c/8fUJjGLC7YZ8bcybrDTVTZj0CO44ZRYwFxM/PPfb+QzXs82y76nwHuUnyI9kR1/W/wx20lhLMchgQju7C3Ut4O91Ity2r20esHYs4QXQn6nfofV3nSm1meLLQfkUqU2afaYZkzlKvkRP/pBQd6/m93khg/wKuPNci0jHZJzU50chSUo452pxnyQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(39850400004)(376002)(136003)(346002)(366004)(52116002)(166002)(33964004)(53546011)(26005)(186003)(16526019)(6486002)(8676002)(83380400001)(31686004)(16576012)(316002)(8936002)(44832011)(956004)(86362001)(2616005)(31696002)(2906002)(966005)(478600001)(36756003)(66946007)(66476007)(5660300002)(66556008)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	N5EB2uBB6+aJCh46/8FCHHySd42DeFRVIc6jXLQnZhT2lhBbX2/qGBSTzWZ6TJ/GVmSEk6dSPVN95JCThGfEflVWxvgK5Nf05vqhZJI1EnDdC5Aj7XETEE7ErqSho1PuZiXzxxMb2tve3SQWTfn9WQZJTAzlD5ipXHsYTPWjQUL4gm/7/oQiqn4daSsxwdEKuz8yEcbPCRV0K9uHVw31EiQaVWbbl5t6c5/gsQ05xMGdX+l5ZRDke0MlHotkn5wGHV61t+q5B11/Eq82CNQhm0bz4yzSDshNIuinUuSkeHa1dShG9sQA7OmqLn4V8uo5C82oZcnwM1/LJishAbpYrKbIOUwGXBRKeeF1ArczEME5FN+pLv4hMmCzOnt+3Mhmv0t4cQsPgwJqTOGi0+UMpjPByWGZxv8ZkaDG2Pf4+DSzb2z/cIQzbMBqdLWNTivKnptfAE3J1UeHEsRG1XKR4c1v7jEhsIJaKHO9P2JzhgYYMY5/NFaxOyKtPWMIdULe
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acc38bb5-fe0f-4996-1bcd-08d8097c6b8b
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2020 18:15:25.9507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hIVaNuQY3smf3P+87rM2l/CP5FRb8khu5C12Gm0deG2Ohkrm5P9MoqhbDUJEh8QkPa0nXOOAAtrrY9TX3uu4zMHge16BgdWPkG9frzefI/M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1236
Content-Type: multipart/alternative;
 boundary="------------C60CBBE46ECDAD84D872FE85"
Content-Language: en-US

--------------C60CBBE46ECDAD84D872FE85
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/4/20 8:12 AM, Leon Anavi wrote:
> Upgrade to release 2020.1.16. Consolidate inc and bb files
> into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python3-html2text_2019.8.11.bb  | 2 --
>   ...{python-html2text.inc => python3-html2text_2020.1.16.bb} | 6 +++---
>   2 files changed, 3 insertions(+), 5 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python3-html2text_2019.8.11.bb
>   rename meta-python/recipes-devtools/python/{python-html2text.inc => python3-html2text_2020.1.16.bb} (58%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-html2text_2019.8.11.bb b/meta-python/recipes-devtools/python/python3-html2text_2019.8.11.bb
> deleted file mode 100644
> index 9cb5b01eb..000000000
> --- a/meta-python/recipes-devtools/python/python3-html2text_2019.8.11.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -inherit setuptools3
> -require python-html2text.inc
> diff --git a/meta-python/recipes-devtools/python/python-html2text.inc b/meta-python/recipes-devtools/python/python3-html2text_2020.1.16.bb
> similarity index 58%
> rename from meta-python/recipes-devtools/python/python-html2text.inc
> rename to meta-python/recipes-devtools/python/python3-html2text_2020.1.16.bb
> index 678dcef3f..565b31d97 100644
> --- a/meta-python/recipes-devtools/python/python-html2text.inc
> +++ b/meta-python/recipes-devtools/python/python3-html2text_2020.1.16.bb
> @@ -4,9 +4,9 @@ HOMEPAGE = "https://github.com/Alir3z4/html2text"
>   LICENSE = "GPL-3.0"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>   
> -SRC_URI[md5sum] = "21aad7ec95b70606024b783c8253899c"
> -SRC_URI[sha256sum] = "f516b9c10284174e2a974d86f91cab02b3cf983a17752075da751af0e895ef5e"
> +SRC_URI[md5sum] = "c77b580c94d1a9e0145f23cc4472993d"
> +SRC_URI[sha256sum] = "e296318e16b059ddb97f7a8a1d6a5c1d7af4544049a01e261731d2d5cc277bbb"
>   
> -inherit pypi
> +inherit pypi setuptools3
>   
>   BBCLASSEXTEND = "native nativesdk"
>
> 

--------------C60CBBE46ECDAD84D872FE85
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/4/20 8:12 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200604121223.3818-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 2020.1.16. Consolidate inc and bb files
into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20200604121223.3818-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python3-html2text_2019.8.11.bb  | 2 --
 ...{python-html2text.inc =&gt; python3-html2text_2020.1.16.bb} | 6 &#43;&#43;&#43;---
 2 files changed, 3 insertions(&#43;), 5 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-html2text_2019.8.11.bb
 rename meta-python/recipes-devtools/python/{python-html2text.inc =&gt; python3-html2text_2020.1.16.bb} (58%)

diff --git a/meta-python/recipes-devtools/python/python3-html2text_2019.8.11.bb b/meta-python/recipes-devtools/python/python3-html2text_2019.8.11.bb
deleted file mode 100644
index 9cb5b01eb..000000000
--- a/meta-python/recipes-devtools/python/python3-html2text_2019.8.11.bb
&#43;&#43;&#43; /dev/null
@@ -1,2 &#43;0,0 @@
-inherit setuptools3
-require python-html2text.inc
diff --git a/meta-python/recipes-devtools/python/python-html2text.inc b/meta-python/recipes-devtools/python/python3-html2text_2020.1.16.bb
similarity index 58%
rename from meta-python/recipes-devtools/python/python-html2text.inc
rename to meta-python/recipes-devtools/python/python3-html2text_2020.1.16.bb
index 678dcef3f..565b31d97 100644
--- a/meta-python/recipes-devtools/python/python-html2text.inc
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-html2text_2020.1.16.bb
@@ -4,9 &#43;4,9 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/Alir3z4/html2text">&quot;https://github.com/Alir3z4/html2text&quot;</a>
 LICENSE = &quot;GPL-3.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=d32239bcb673463ab874e80d47fae504">&quot;file://COPYING;md5=d32239bcb673463ab874e80d47fae504&quot;</a>
 
-SRC_URI[md5sum] = &quot;21aad7ec95b70606024b783c8253899c&quot;
-SRC_URI[sha256sum] = &quot;f516b9c10284174e2a974d86f91cab02b3cf983a17752075da751af0e895ef5e&quot;
&#43;SRC_URI[md5sum] = &quot;c77b580c94d1a9e0145f23cc4472993d&quot;
&#43;SRC_URI[sha256sum] = &quot;e296318e16b059ddb97f7a8a1d6a5c1d7af4544049a01e261731d2d5cc277bbb&quot;
 
-inherit pypi
&#43;inherit pypi setuptools3
 
 BBCLASSEXTEND = &quot;native nativesdk&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------C60CBBE46ECDAD84D872FE85--

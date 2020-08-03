Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.53])
 by mx.groups.io with SMTP id smtpd.web12.6701.1596491003230356361
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2020 14:43:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Ub7jLhxl;
 spf=pass (domain: windriver.com, ip: 40.107.223.53, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D/FTOUG/ZrkO04y+8pwjlOPxMcfZi7ID4nch6wtPf1qz8bfAGrM+pijbsOMGTmAssxxT/8kc8CJWkxusWd0iNkUvwVGcAzZep+5+Y5koVUDGvCPYAISeLPrpPm5R1462IXuxNpVJ5PENgLD/FVLIn4f0adDuQceGYajEcRY6iNnfBNoe9dNKHAofPDl+01d0SZLoiaFLhwo3FE6SvFTf6yNKa7/Jv4SxewcAsTkcD2/xC4fG7brfzEev2RLUaThNsZ9cUf3Pbh3XpLhNvs0DS8V+F08m1aOiY18cJoE663GmhIMnQeDXIne1ziK5G7Ki9O2exD0DlNR6rYVPolQLkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZhQDV0LhzWyFpgekbzhs1ayTVd8R4AdOHbIOPWq+Nyo=;
 b=lunvSYQ7pk+cezumqgpwQx35LkILeIB5yftdAUxwjlSEG3guNe4FIHSJIJ6G0K4xYMhsuUydxu3r6H37ReH+xb1Fvt0DWpR2PEhO2p9KkwYQYU8HrB+jExMEcOMAxalRg5xEgfDtYWgMnLDbHckh6htCRRuROmUQOyds1Gpk0kBfNlXcTeJkcRgyr6lFUT+uDKWW18U4ruTCK0mLUqkx2RCBheZOrAzypS4AZBiuq0YonFSpOJxLRpmguyQazgQBJ3CG7bB27mHs41rwjaNB2vQAM1kNOMIT+Ir3MjlOWWo4byHGnyTtTehX78IRPIaK4ui//cYSZxzcxVaXL6xN6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZhQDV0LhzWyFpgekbzhs1ayTVd8R4AdOHbIOPWq+Nyo=;
 b=Ub7jLhxlTfqR9oqPzkxOqdd2QtDFNuNpbEcZVQvErwGVum4BPCAwqh6t+4HExlI42OrzJLQryfN2LOAs41UfdFUicdj8uC6OtehA+05xfPzxld+kiwaPLvESgU/RK52wtQ/wpbw5n0o41cJQzWW+WK/f/g2AbGiDWchy/jixFPg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4101.namprd11.prod.outlook.com (2603:10b6:a03:18e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17; Mon, 3 Aug
 2020 21:43:22 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3239.021; Mon, 3 Aug 2020
 21:43:22 +0000
Subject: Re: [oe] [meta-python][PATCH 03/15] python3-gmqtt: Upgarde 0.6.5 -> 0.6.7
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200731132230.20031-1-leon.anavi@konsulko.com>
 <20200731132230.20031-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <07c96ea0-9844-73d1-8fc9-93bec90e45e5@windriver.com>
Date: Mon, 3 Aug 2020 17:43:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200731132230.20031-3-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0039.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::16) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTXPR0101CA0039.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend Transport; Mon, 3 Aug 2020 21:43:21 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a49bd1a-e9d3-4fc8-5bc8-08d837f63e46
X-MS-TrafficTypeDiagnostic: BY5PR11MB4101:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4101B0EAA42762ABECFEE1F69F4D0@BY5PR11MB4101.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	94L/67IadzUi/7p8C3I37eEGP6ZWUJ+7CPkEER66EL3H5mr3yssn6PKnIXXx9gKihH2Ztee1cOY/f2xbaPliZ1PSJcuEI95d7aRMD8INC6EAj1AiZgvoYrfoElD/9bhSFHkFImk8y65BLjTkkOYzlPajUIRrZdkZdnqkRQMk9gx7I6JGly7G2E/lUHnqckPvsQekAUN4pi0Pyd8SVaYkjyEPWED5+69i9fsMO7/vj0YNlwZX4UaRfj3U41ZINCimvXpfbYJ9CLNoTqLT9kOckoi1wP/RXKAbEbXepmPtTmbBKaGWjf8Wf9X+5KrCxsscFdJsLNl0HIiBCDmcElhN1l/+d4N0o5FDppYACCbY1B2GZqYe52tKQiB3XedYZhbPM3XqeX2SD4Nd/6L5vRtnhEj2QW8jkaRWQQ9A4DsAEan7EPzs3sTVhtpvpx4gbpy/iLk9WXpWSsx6kuMkYMC2PA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(376002)(136003)(396003)(346002)(366004)(66556008)(166002)(8676002)(478600001)(6486002)(31696002)(44832011)(2906002)(66476007)(66946007)(52116002)(31686004)(16526019)(26005)(16576012)(956004)(86362001)(83380400001)(316002)(186003)(53546011)(966005)(33964004)(2616005)(36756003)(5660300002)(8936002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	oIHKgsagG3/w4FcG+wqXu30qcRm6Xibi6y0RzHzpsKG55vpP4QqepK7DuC697W1O6Jt0mNI9S/gG0ROj6nXzR026FmWqA/Mi42T3kek3NXRNROz9MbEGr4YgizUCOjNGKcy8L5rDqUVy9/hfY6dcy4ivRGPdRvdq1a6EbRIUxPhtM82AfSGSu+BJX68MH0wFy+VDYpQRC42phXnFJZXZAkMrSAI3VHW41RvENG1mqWGQx8u50b54Eo1x8f1iu9ucMBzzaK0JyzfddJe/+OdLoHh4FP08nOvj+TvqF/b9KOraPMXoUE5kXvbQ3DsSUfxoRjOD3gsHbi0Rdt8W2fMg/oqy5dCbzm9kywo2VSytJTLBEUYg7KYyyGjaMDNfp8qkel8BrtJL5DsYPYzqNfi0QfOqpq2vRwlp7hWOCJy/Oc5fc9Duyop18IumAdo6ds2sVVOYc+7K8VDF5IaWec3nPE4J5PybQ81uuv526PknJUcHDgpBuV4mNYcprWb0SMP7i5Xg3XafRTmImRf4307iA20ecolayT4ybpZdb7pYN7yvhF5bqFLp9XvIoPikYwjlDCNS7oKZ7FoZBhpA4sw5CxuRWz+u4102ruD8jCvzndEoF7PziWYzz2hQ2iKrfCHJKKiBmbOdFnN/E8GXnrCI3w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a49bd1a-e9d3-4fc8-5bc8-08d837f63e46
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2020 21:43:22.1174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J2bvNwjhEw5ek8L8yPTGV1wZC0SD/S/IuIB0gW0rz6FfW9Kao5LZphObbaE6cd+Dr1STE0C36UMNZEZk1/Qftgo+dx8bbY7YKIW4GyMPWnw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4101
Content-Type: multipart/alternative;
 boundary="------------733C31DD95CA315B289DCB7B"
Content-Language: en-US

--------------733C31DD95CA315B289DCB7B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/31/20 9:22 AM, Leon Anavi wrote:
> Upgrade to release 0.6.7:
>
> - Handle incoming topic alias in proper way
> - Fix python3.8 warning and improve disconnect process
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-gmqtt_0.6.5.bb => python3-gmqtt_0.6.7.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-gmqtt_0.6.5.bb => python3-gmqtt_0.6.7.bb} (74%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-gmqtt_0.6.5.bb b/meta-python/recipes-devtools/python/python3-gmqtt_0.6.7.bb
> similarity index 74%
> rename from meta-python/recipes-devtools/python/python3-gmqtt_0.6.5.bb
> rename to meta-python/recipes-devtools/python/python3-gmqtt_0.6.7.bb
> index 379c7679c..2bf9d0753 100644
> --- a/meta-python/recipes-devtools/python/python3-gmqtt_0.6.5.bb
> +++ b/meta-python/recipes-devtools/python/python3-gmqtt_0.6.7.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/wialon/gmqtt"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=903f1792621a3b35ee546da75d139177"
>   
> -SRC_URI[md5sum] = "9388ec09b6536c4e68c5ac5c31de3dc9"
> -SRC_URI[sha256sum] = "c12b2d7d5a90f3304b7291b1d9d21df47e228dfb4ff990e965008fdd1a55ce60"
> +SRC_URI[md5sum] = "9e26fec7d5b64afab63d6d82faacc208"
> +SRC_URI[sha256sum] = "86b3679de400b8068dfadf871ce063a7040ed5052d30cc323aed69430888b422"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------733C31DD95CA315B289DCB7B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/31/20 9:22 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200731132230.20031-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.6.7:

- Handle incoming topic alias in proper way
- Fix python3.8 warning and improve disconnect process

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200731132230.20031-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-gmqtt_0.6.5.bb =&gt; python3-gmqtt_0.6.7.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-gmqtt_0.6.5.bb =&gt; python3-gmqtt_0.6.7.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-gmqtt_0.6.5.bb b/meta-python/recipes-devtools/python/python3-gmqtt_0.6.7.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-gmqtt_0.6.5.bb
rename to meta-python/recipes-devtools/python/python3-gmqtt_0.6.7.bb
index 379c7679c..2bf9d0753 100644
--- a/meta-python/recipes-devtools/python/python3-gmqtt_0.6.5.bb
+++ b/meta-python/recipes-devtools/python/python3-gmqtt_0.6.7.bb
@@ -3,8 +3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/wialon/gmqtt">&quot;https://github.com/wialon/gmqtt&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=903f1792621a3b35ee546da75d139177">&quot;file://LICENSE;md5=903f1792621a3b35ee546da75d139177&quot;</a>
 
-SRC_URI[md5sum] = &quot;9388ec09b6536c4e68c5ac5c31de3dc9&quot;
-SRC_URI[sha256sum] = &quot;c12b2d7d5a90f3304b7291b1d9d21df47e228dfb4ff990e965008fdd1a55ce60&quot;
+SRC_URI[md5sum] = &quot;9e26fec7d5b64afab63d6d82faacc208&quot;
+SRC_URI[sha256sum] = &quot;86b3679de400b8068dfadf871ce063a7040ed5052d30cc323aed69430888b422&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------733C31DD95CA315B289DCB7B--

Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.55])
 by mx.groups.io with SMTP id smtpd.web11.94109.1597860391879398778
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2020 11:06:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=eAT+ehNT;
 spf=pass (domain: windriver.com, ip: 40.107.94.55, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tltm9N+o3vg+3MxQS6IaKN4mPA7y0rG21AuuiE/CCPYg3LXeXrXX2iEKu53Y34gxTImanALcnJXuwTYow+MMHa48/gF95mYeYv4hWUsxrRKy9zFzXZzQLzcwz7TilhCljYO4UGcwrgD9o6OI0UTyy4wYo1Xb/ZG75Ny9oItBoLK8RSUmzExfTPcmoGOy/k/teqtM1hDqwiUjOWdA8bbrrZlpUb1InwKWlnrD7VYEq/WIUlBPif5DDpELrY9yfDUGwFrIvYoyUPArVvZHTCbnjN3Y2rtEpkYEny9z+saOyu1YCyLnH+cAlpT2cMri/ngcIr/O2OF18Q6B+NC/7Pjrtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3fFNdBlyLAgYq3IWZqcT6TiGMZWa1wd+Zkw57ggFPAk=;
 b=lkSPoL1Hj7hdLP8Zqustvbic7aaYHVF3UOKGHJARjjyMkBg0a0eqGwFMa9nL+hXxeU3TtTF/L4mlby95KxQf0ckAUMbKH4SGcIU9BRIl8x5sge8EVVbZPy2MGy1P7ultER7daAmevEYKYxOLRq2WfxDlPGVxzm6chdhUljQzawtcEcxupciCzGMqeA6ZrDBBYi29NM0BwRXPj8gr0hypV4dLv90yb0yM/gduIPNxjEZZ0Zm7NB8Bn47suTmVFDyHhcAXiAtklm36+Yl2hlzYtCUoiMKVATHDfqIaRa5/Wbkic449pKGzLJg2TXiajCpsIOT/l6+NgO0DR/vk/s93TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3fFNdBlyLAgYq3IWZqcT6TiGMZWa1wd+Zkw57ggFPAk=;
 b=eAT+ehNT+F46vjqTw4RRDxa80GLCtHJ2dqDc1JIiNYp+r3zNhCHwo0FyDOMnXwAqY9875nnDQHMPM6KuiSQNeNeBEvqCXmwHtryq0R5Pfb6+bm0vAP1vysp9/lPXRYZdm0RDxEktF2pc78UhG119BJpd7+2GbHGj895w9Y3VMk0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3913.namprd11.prod.outlook.com (2603:10b6:5:193::33)
 by DM5PR11MB0073.namprd11.prod.outlook.com (2603:10b6:4:67::37) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.28; Wed, 19 Aug
 2020 18:06:30 +0000
Received: from DM6PR11MB3913.namprd11.prod.outlook.com
 ([fe80::fb:781c:eb42:b4f]) by DM6PR11MB3913.namprd11.prod.outlook.com
 ([fe80::fb:781c:eb42:b4f%4]) with mapi id 15.20.3305.024; Wed, 19 Aug 2020
 18:06:30 +0000
Subject: Re: [oe] [meta-python][PATCH 2/6] python3-sentry-sdk: Upgrade 0.16.3 -> 0.16.5
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200818153444.15728-1-leon.anavi@konsulko.com>
 <20200818153444.15728-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <c83ae4d1-30f7-a467-57e6-1b6160833be9@windriver.com>
Date: Wed, 19 Aug 2020 14:06:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200818153444.15728-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0014.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::27) To DM6PR11MB3913.namprd11.prod.outlook.com
 (2603:10b6:5:193::33)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YTXPR0101CA0014.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend Transport; Wed, 19 Aug 2020 18:06:30 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6fb2da8-a1d8-4c65-095e-08d8446a9959
X-MS-TrafficTypeDiagnostic: DM5PR11MB0073:
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB0073B04120F9EED8B3E3E1079F5D0@DM5PR11MB0073.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YR63KYh54/pLuh1S4ekgQW29a72eKLVkF8QJaOy58F7lROD+yTAxWMhNro1XJ6iUcEL4pP05am1HiJ8BYjcdqngWYcCwmXYj8bAHnMB2k7xV0gMWOdicAC57M1hcJxNQ7lDUVgxcEzokdYPWyWZPsmga3JMNIjdtyWjNJlzAgasbXJiObqbYxO69FUxKBWD4RpWiPrQpeEYZcnfIq+qiP+pzuJHquNUq9PCXo4OqFpwqM7C6xqPZKd4VJqKLTm1rnAMERhcJNN5tKWlqSzkzBmsRgrkyu2eOO87MDUu9xqI/3uTW77UdRrZr6VFgYyiTJK75AFSB7XdqWM+I3XZ5FQi/JPAHPsDeHk+F9KwHwYCSWD4kh/0NNdqdF4NYWTQwGQQgkyKN4btUhRiStHzaw/trmQfNy4JUnD+/rHbUW0jQgNkFJ2u795AjNzJtcfJ33QtCzxDtEHGdgIsniWZx6gVvdIPBjI9UaEB3kA+0ICw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3913.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(376002)(346002)(366004)(39850400004)(396003)(44832011)(36756003)(966005)(33964004)(6486002)(16576012)(186003)(5660300002)(110011004)(31696002)(478600001)(53546011)(2616005)(83380400001)(956004)(66476007)(26005)(66946007)(86362001)(8676002)(8936002)(6666004)(316002)(66556008)(166002)(2906002)(31686004)(52116002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	Ztn9Ye+9uZT3lb3EJHJuwDwQR+3obj3kyq/UxUPkcrwo8bVWr+QLpIyacrdQ3o6nVpTkNmTpnR8aJwYnD+AkDii6+RPhZg5Efi0ltebwRFZoCvpgmYQJlY2v68y0zaO6JmHRl3QHiZLPiuikzfeJC9q02iF4XxGM0Tn3lQ86qR4JelYiOYlvT7lOjEM6qAE/Bds4Flvtk9RA3eWmOIPRkX07ub5i0luyPrPZJ49/MLO7zAx/MDh8XGVHG3jMGUNo2nY8nUS8vyYyRs3cJKDLhNftgL0/JJoHpjOi4HpjvETUVy61s/eMNN767yXsPXqkMtKuNW6KXHFioYb+7j1czSIPWS7ehamHwnhlDnXzuf/j4LfZkjq0mXbkMxuWgNQYRlLcRy/TDaRuWYPlk8+4fTWeb5T6HmVkcD0Zqz7Ae8MNGAT80TqYQY0MLNyoiK2On3O178z3w1DU352k9XrP6dKqpKYpw5Ssw17TpcPhLusgyWmKh1O/q6Tbk5JNOUiQfPWVWBLb7yVkdk4Vm55piiKrhSSrKbCG9EqJdJSYZiU0n3RKOfW6I8G4LUYplN/83TTzkwNvAE6DTjNFFdhmRRlAywz6w68vL0nvmS3DK+Yh6JtoO+g2ypNdqRZpSp7W8gmS3rrSNzS7uyrcTSIwSQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6fb2da8-a1d8-4c65-095e-08d8446a9959
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3913.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2020 18:06:30.4145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qA6RbqhBqwhoOBpVi0AmYMz3X/q81KjWnxnSVxTLZjbflXPDXhmFQ+q6CiTZZapyJ+c+n7e7JsRYTROWUKl4YhXoxzHO14dWTRQ9dDDKzdU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB0073
Content-Type: multipart/alternative;
 boundary="------------066526A87C300BE4A8AFB998"
Content-Language: en-US

--------------066526A87C300BE4A8AFB998
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/18/20 11:34 AM, Leon Anavi wrote:
> Upgrade to release 0.16.5:
>
> - Fix a bug that caused Django apps to crash if the view didn't
>    have a __name__ attribute.
> - Add experiment to avoid trunchating span descriptions. Initialize
>    with init(_experiments={"smart_transaction_trimming": True}).
> - Add a span around the Django view in transactions to distinguish
>    its operations from middleware operations.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...hon3-sentry-sdk_0.16.3.bb => python3-sentry-sdk_0.16.5.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-sentry-sdk_0.16.3.bb => python3-sentry-sdk_0.16.5.bb} (72%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.16.3.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.16.5.bb
> similarity index 72%
> rename from meta-python/recipes-devtools/python/python3-sentry-sdk_0.16.3.bb
> rename to meta-python/recipes-devtools/python/python3-sentry-sdk_0.16.5.bb
> index ee84f6b0b..ad01f6f5b 100644
> --- a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.16.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.16.5.bb
> @@ -5,8 +5,8 @@ HOMEPAGE = "https://github.com/getsentry/sentry-python"
>   LICENSE = "BSD-2-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341"
>   
> -SRC_URI[md5sum] = "41ac61676030401bcf22b47ac6a2709f"
> -SRC_URI[sha256sum] = "21b17d6aa064c0fb703a7c00f77cf6c9c497cf2f83345c28892980a5e742d116"
> +SRC_URI[md5sum] = "6d65fda758929b6a8d16e6030302c811"
> +SRC_URI[sha256sum] = "e12eb1c2c01cd9e9cfe70608dbda4ef451f37ef0b7cbb92e5d43f87c341d6334"
>   
>   PYPI_PACKAGE = "sentry-sdk"
>   inherit pypi setuptools3
>
> 

--------------066526A87C300BE4A8AFB998
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/18/20 11:34 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200818153444.15728-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.16.5:

- Fix a bug that caused Django apps to crash if the view didn't
  have a __name__ attribute.
- Add experiment to avoid trunchating span descriptions. Initialize
  with init(_experiments={&quot;smart_transaction_trimming&quot;: True}).
- Add a span around the Django view in transactions to distinguish
  its operations from middleware operations.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200818153444.15728-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...hon3-sentry-sdk_0.16.3.bb =&gt; python3-sentry-sdk_0.16.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_0.16.3.bb =&gt; python3-sentry-sdk_0.16.5.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.16.3.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.16.5.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_0.16.3.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_0.16.5.bb
index ee84f6b0b..ad01f6f5b 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.16.3.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.16.5.bb
@@ -5,8 +5,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/getsentry/sentry-python">&quot;https://github.com/getsentry/sentry-python&quot;</a>
 LICENSE = &quot;BSD-2-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341">&quot;file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341&quot;</a>
 
-SRC_URI[md5sum] = &quot;41ac61676030401bcf22b47ac6a2709f&quot;
-SRC_URI[sha256sum] = &quot;21b17d6aa064c0fb703a7c00f77cf6c9c497cf2f83345c28892980a5e742d116&quot;
+SRC_URI[md5sum] = &quot;6d65fda758929b6a8d16e6030302c811&quot;
+SRC_URI[sha256sum] = &quot;e12eb1c2c01cd9e9cfe70608dbda4ef451f37ef0b7cbb92e5d43f87c341d6334&quot;
 
 PYPI_PACKAGE = &quot;sentry-sdk&quot;
 inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------066526A87C300BE4A8AFB998--

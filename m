Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.43])
 by mx.groups.io with SMTP id smtpd.web11.5932.1596718893431655355
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Aug 2020 06:01:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=TsvdtTyK;
 spf=pass (domain: windriver.com, ip: 40.107.223.43, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A5LhmJ+9+v1KGUyI05pb6OHZmWZdxqHp0UQMVR+C/hFeFDX2sV5WaXRupymTcwb07Z0FnFm6c45+qfDzKu0dlymF9Vu6mC+oWovUC/toQP2u7QeXFqABP3fu9Zf9U/GAEoMTUnUn8yeiuQAD01Y0CHd0SroEtxZ/WlCF8fQkTWl+aO9vZHfT4ib2GUs6zOH9Msr4yQgW0rE0heQPFm6A8VO/o3PSsQNm9gCreBfyWI7LZegIpIqjVaj2S7bHrVM60LzNyxezuovMvMYuot79Mnoa+Mu5zXCJPUT3p+9Yvm2bRHPf1p4GkXVtD0zh8FJV6AYbaphBb7deMYssUWRlMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i9MEHwCZZnlJV+QabUUF9GgcY8mL846M5sA0pJoPs/M=;
 b=MIVL8l0xaYHndsoEMRnw+wN53AnjtRwsmFVTD5YgZUe8tNz/+uGLI7P1hqVMLX3zAbT/389M8LIUcMS14NXXtPYYk+yhBY2I62TIJbxswKvNvhqhO2zjnu2RKN/oT5Guup2pWJwBR/xSzo1c7GXafwztMnt3NEwVynAp6wfuGsgHhwMk7Iiu38Ph6uj0xoNClhG/ksITXtLx38UU9hH1QibBHuTp7c7Oi6PiNvYK/X9hHcYTQiHYhXP+t1fOc+dE9O2wSVYb/HiTRqkEWZpCGCId/itl63k61KjF70xXgwGfxsdGbDMcZTZk80grmz8HfIX+BBcQZfp2zg5anWsBSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i9MEHwCZZnlJV+QabUUF9GgcY8mL846M5sA0pJoPs/M=;
 b=TsvdtTyKITkKyFkdP0L2MqQIWYHvNEEFJDkXK+w1yE7i6D5pmbH5OteGS6h/wjW1V7SCw58lgwu8C+40Ychs9LHkJD4+OQRw+MYHbln5ttq1e/qo24IXT8MaClwZNOc9qCIKfNDthNow4na7bGLCBJ1gxueHuoR79HhXSHYX7DA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4305.namprd11.prod.outlook.com (2603:10b6:a03:1bf::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15; Thu, 6 Aug
 2020 13:01:32 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3261.016; Thu, 6 Aug 2020
 13:01:32 +0000
Subject: Re: [oe] [meta-python][PATCH 2/7] python3-yarl: Upgrade 1.4.2 -> 1.5.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200803140520.23250-1-leon.anavi@konsulko.com>
 <20200803140520.23250-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <021ebbe6-061a-3d89-8e93-9b0053d893d1@windriver.com>
Date: Thu, 6 Aug 2020 09:01:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200803140520.23250-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0055.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::32) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTXPR0101CA0055.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.18 via Frontend Transport; Thu, 6 Aug 2020 13:01:31 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 824b303a-0d71-483e-35ba-08d83a08d721
X-MS-TrafficTypeDiagnostic: BY5PR11MB4305:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB43057639C588E53D71251FA79F480@BY5PR11MB4305.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KAXrysS4gVQWFT/+WzfPpmc8NweR2Eyi+ezhgHfqfsjQS7I7bLsBJ7NSC1lLXFfujrYitCrSPJ69/sNU+Zo0eI1oZLQnLTZLIe1N9SbBPFf4ZgJu8hHSCS5fh2/bykBMMlZfD1RXPMg4K9jPpFh/jgmzZmT7i4FEEUWq6rl3ihInaHNUYyDHzNspcIU7S4QzYVuyf9t6f3Q8iSQJTyiP9bDeHP3RIS8yWFo7P1RdLUmqDwr+3EVPUOW3VUo4mOMeZ/S6rIAnQLLL74P/AXLQojiPtNWj1fun8AuhsgvslAYltdGK/N2TwtGY/yGabmLWc8LSHLuC+3TExhjO3O0kWCDtn1oQFP7bQYAhYFomqvoqW+Ft1GPCBPoz+qIR/Lpa2No8CnnvaFnS5i4yL8L2tuQqSbIk89eqWhryyOvMq0Eutb0PTALdzvk8rgtbA+/DOxD746kXle7E4rIEoCJKUA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(376002)(346002)(366004)(396003)(136003)(2616005)(44832011)(26005)(86362001)(186003)(16526019)(31686004)(956004)(5660300002)(16576012)(316002)(478600001)(966005)(52116002)(2906002)(6486002)(166002)(8676002)(8936002)(36756003)(66556008)(66476007)(66946007)(31696002)(33964004)(53546011)(83380400001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	JZ2BaVHGClHJUlY53zNZPUwMoT1LK4LIO13wIgMs667wR/+31TDkVBKZGohXUiQLDb79w/BmmKH/JwpfQ+dAUDgEy75qoeCN8i2NguF9mjr5HkabgvpIUeDG991UmplBt0nUQB6yiNjJhX7o3YE70y8V0VU6+aNf4nloi9Gltqtu9XMvLeql5KYeCMRWJxfcq6LhuJKdRqUTLDeOzfuzQ0/4HQufjiELfCXAlKL02q8fWYXmS3ix+0mslWibG2RmUmH+wwG6OzMMhV5hQaSRWjfeS6X1OYRKFwaGDTCkGmi4HFceg94wjRegblZ8sqv2X++oTOPNFG/w/EWMWeulCGdyFtoGeR2L0i8MyBGGurgKQhCjpbEvqvFeGhwUub9UvbJS4nA0bsLCPQoUyz3IH4dylXSrJTPvu9UFNCmcYmPSJXem51cmcU5uNykWAgQT42ff0qG4/IXliFS3jNsU3LysdxIru3roJX3Zk47jd2j+c69jR880IyC/wXEeY4+Wq6l3famOAta04mLxFl1umFH/ciIOhjFu2Lg2FaGMnfadjw9Cq6ljTdaf3goAEPCSm2sscx5gN8qLcf9zLnUqCXZOhs1pCeGXKeLqmlJ410cx8SeZFrXsW5hOCh4gIDOWVAkCb1yHPQgqmaCkPBhgXQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 824b303a-0d71-483e-35ba-08d83a08d721
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2020 13:01:31.9080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KpFIgak0VF10mbTLczsgKguOKnr2nAgMiCGqaRexG7QYt+Q2/3f/ksF6dpFvmzWCi0sMoQzL6+pHn52zuJNQpUQ6yhAAHJu9u10QW9dNuO8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4305
Content-Type: multipart/alternative;
 boundary="------------D6273526D7220E7627BDD800"
Content-Language: en-US

--------------D6273526D7220E7627BDD800
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/3/20 10:05 AM, Leon Anavi wrote:
> Upgrade to release 1.5.1:
>
> - Fix including relocated internal yarl._quoting_c C-extension
>    into published PyPI dists.
> - Convert host to lowercase on URL building. #386
> - Allow using mod operator (%) for updating query string (an alias
>    for update_query() method).
> - Allow use of sequences such as list and tuple in the values of a
>    mapping such as dict to represent that a key has many values:
>
>    url = URL("http://example.com")
>    assert url.with_query({"a": [1, 2]}) == URL("http://example.com/?a=1&a=2")
>
> - Support URL.build() with scheme and path (creates a relative
>    URL).
> - Cache slow IDNA encode/decode calls.
> - Add @final / Final type hints.
> - Support URL authority/raw_authority properties and authority
>    argument of URL.build() method.
> - Hide the library implementation details, make the exposed public
>    list very clean.
> - Fix tests with newer Python (3.7.6, 3.8.1 and 3.9.0+).
> - Fix a bug where query component, passed in a form of mapping or
>    sequence, is unquoted in unexpected way.
> - Hide Query and QueryVariable type aliases in __init__.pyi, now
>    they are prefixed with underscore.
> - Keep ipv6 brackets after updating port/user/password.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-yarl_1.4.2.bb => python3-yarl_1.5.1.bb}   | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-yarl_1.4.2.bb => python3-yarl_1.5.1.bb} (79%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-yarl_1.4.2.bb b/meta-python/recipes-devtools/python/python3-yarl_1.5.1.bb
> similarity index 79%
> rename from meta-python/recipes-devtools/python/python3-yarl_1.4.2.bb
> rename to meta-python/recipes-devtools/python/python3-yarl_1.5.1.bb
> index 15d92065d..40f0e4db0 100644
> --- a/meta-python/recipes-devtools/python/python3-yarl_1.4.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-yarl_1.5.1.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/aio-libs/yarl/"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=b334fc90d45983db318f54fd5bf6c90b"
>   
> -SRC_URI[md5sum] = "08ba0d6e18f460b44d9e5459f3d217ba"
> -SRC_URI[sha256sum] = "58cd9c469eced558cd81aa3f484b2924e8897049e06889e8ff2510435b7ef74b"
> +SRC_URI[md5sum] = "a9b20bf0b8a6962e1101b28908a67bf8"
> +SRC_URI[sha256sum] = "c22c75b5f394f3d47105045ea551e08a3e804dc7e01b37800ca35b58f856c3d6"
>   
>   SRC_URI += " \
>       file://run-ptest \
>
> 

--------------D6273526D7220E7627BDD800
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/3/20 10:05 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200803140520.23250-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.5.1:

- Fix including relocated internal yarl._quoting_c C-extension
  into published PyPI dists.
- Convert host to lowercase on URL building. #386
- Allow using mod operator (%) for updating query string (an alias
  for update_query() method).
- Allow use of sequences such as list and tuple in the values of a
  mapping such as dict to represent that a key has many values:

  url = URL(<a class="moz-txt-link-rfc2396E" href="http://example.com">&quot;http://example.com&quot;</a>)
  assert url.with_query({&quot;a&quot;: [1, 2]}) == URL(<a class="moz-txt-link-rfc2396E" href="http://example.com/?a=1&amp;a=2">&quot;http://example.com/?a=1&amp;a=2&quot;</a>)

- Support URL.build() with scheme and path (creates a relative
  URL).
- Cache slow IDNA encode/decode calls.
- Add @final / Final type hints.
- Support URL authority/raw_authority properties and authority
  argument of URL.build() method.
- Hide the library implementation details, make the exposed public
  list very clean.
- Fix tests with newer Python (3.7.6, 3.8.1 and 3.9.0+).
- Fix a bug where query component, passed in a form of mapping or
  sequence, is unquoted in unexpected way.
- Hide Query and QueryVariable type aliases in __init__.pyi, now
  they are prefixed with underscore.
- Keep ipv6 brackets after updating port/user/password.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200803140520.23250-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-yarl_1.4.2.bb =&gt; python3-yarl_1.5.1.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-yarl_1.4.2.bb =&gt; python3-yarl_1.5.1.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-yarl_1.4.2.bb b/meta-python/recipes-devtools/python/python3-yarl_1.5.1.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-yarl_1.4.2.bb
rename to meta-python/recipes-devtools/python/python3-yarl_1.5.1.bb
index 15d92065d..40f0e4db0 100644
--- a/meta-python/recipes-devtools/python/python3-yarl_1.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-yarl_1.5.1.bb
@@ -3,8 +3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/aio-libs/yarl/">&quot;https://github.com/aio-libs/yarl/&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=b334fc90d45983db318f54fd5bf6c90b">&quot;file://LICENSE;md5=b334fc90d45983db318f54fd5bf6c90b&quot;</a>
 
-SRC_URI[md5sum] = &quot;08ba0d6e18f460b44d9e5459f3d217ba&quot;
-SRC_URI[sha256sum] = &quot;58cd9c469eced558cd81aa3f484b2924e8897049e06889e8ff2510435b7ef74b&quot;
+SRC_URI[md5sum] = &quot;a9b20bf0b8a6962e1101b28908a67bf8&quot;
+SRC_URI[sha256sum] = &quot;c22c75b5f394f3d47105045ea551e08a3e804dc7e01b37800ca35b58f856c3d6&quot;
 
 SRC_URI += &quot; \
     <a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------D6273526D7220E7627BDD800--

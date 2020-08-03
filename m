Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.83])
 by mx.groups.io with SMTP id smtpd.web12.6697.1596490991127881324
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2020 14:43:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=kNjSaMSn;
 spf=pass (domain: windriver.com, ip: 40.107.223.83, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PyABoy/sLUDjQuhtdJ0U3u0I5I7SkdIHIgSFjy6RYDNeVHC6MDK+zizlaEKFjU0MUJPFZox/GmsjfWX7SjaR4o6EcRWwOOFwcMdmXMQv0wTm/eeM7FLLLL3MAcSkzd9FFsmUm5iwKbYA+bnwToawsG3PzqhUR70XTzPoZ9HpGRlZBePsKlFouGa94kSEaF+AFqbPLd58YP3EEdalg2l1BuDp/GXXjMYaf9HcqyvCN3/8qH5SaOu1hP8lPLVmiF5GNfq7G5URKoBvNx1gAwXqcbRJ0LJKviby8Ojq4gVGib3gimEJkoY5ATB8B8bFVt+m/OAtb4/Msh2Zo40eMqWlBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KQQ3eJdMf3Z6L6sa/i3IMGiJg+NKYI4AIHAnlrKARqY=;
 b=K2GFsc9/PHHRy/BdRo33oJLDsddbIiFtVBhBN0pW3GWDDmkLJamZnmz+iObpyC2pkeCWN7f6bMxhf+J/9hoaLTsYXbU3+2OOhIlbhO47FRNgSPKoGHOal4pjmXgqpMW0XsCFMDmf+pF781b5xUWCYT5l6rkeJfX3N/3RZcLreqtUxKO2h37A3H9y9rcpGckDOapG1ag/eA7f10LsTM/0bCPTrOomC0F/XErXcNLJ+ZKDkD1gTGvutPp7sdmQ9KcADswYlfSKQ4fCjRQ6vxu3JviWm/X8/gJDsJIhYCImhUqocerr45LZ250juHZWuJgkzWGy+zjvvg4IVvly2irDBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KQQ3eJdMf3Z6L6sa/i3IMGiJg+NKYI4AIHAnlrKARqY=;
 b=kNjSaMSnND73rBIWJdVLu2NbNH6tsGJMxAcnMFfjsaMJHArtN2VvmBrU9OOETMgOojsECTAllgv6eyBWsw+qo1oWfVclW8Fqx9VzIwrPSMnXShuLrXQlcm6pex3P8QtWsk+dqq9gF1t1+0UXTYCrmUd9NekQY28b7C0bQt9RP0E=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4101.namprd11.prod.outlook.com (2603:10b6:a03:18e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17; Mon, 3 Aug
 2020 21:43:10 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3239.021; Mon, 3 Aug 2020
 21:43:09 +0000
Subject: Re: [oe] [meta-python][PATCH 02/15] python3-lxml: Upgrade 4.5.1 -> 4.5.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200731132230.20031-1-leon.anavi@konsulko.com>
 <20200731132230.20031-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <63aac180-82f2-083d-fb66-9ee0cbae7c7b@windriver.com>
Date: Mon, 3 Aug 2020 17:43:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200731132230.20031-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0071.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::48) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTXPR0101CA0071.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::48) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17 via Frontend Transport; Mon, 3 Aug 2020 21:43:09 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: adc84133-aa34-4c5c-ff52-08d837f63701
X-MS-TrafficTypeDiagnostic: BY5PR11MB4101:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4101A28D480C57B0087C98619F4D0@BY5PR11MB4101.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oVs/OXocg4aMo+VRtlxgaG4Q+tH/Djn8PF5B14TdFmMjeTwy6qGT6TV+U2tqJZwKnnIzbhLu3AqJ9ho4oQMxdTAGBMQ0aRAeCglZIR9ZvzLgqjtt/YOWZFNeH80D7wSCnC1xKeIm5a3IlD06B56vuAIo1j532UCrC14z2wHxvEaVnn/l6wNK0e/o3NnHiXHC30RQTTxCV78YMUjU0v2UIDoe58Fib/zY8csNQXsvOXBcknGCv0L9GSnd71bU4bfMIS4S3QwTZL3VmHA0UWoWrqMwBhcdEjwy2JnvinlzHY9pHA4t/ke70jiQZgImcHAIFcOslDr+/46sSdR8gKAU7fhcER5X8UMVlLddRsYpHx1k3pycMqdd7r3JbIq9zT1kJfU3NRxMxWx/WRS8qwzBDtUDSoizG0JauLizZVj4nkxtYTB+n3QA5pEbHyqVMywhjnAedkpMEwr8OjwNPEUzrw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(376002)(136003)(396003)(346002)(366004)(66556008)(166002)(8676002)(478600001)(6486002)(31696002)(44832011)(2906002)(66476007)(66946007)(52116002)(31686004)(16526019)(26005)(16576012)(956004)(86362001)(83380400001)(316002)(186003)(53546011)(966005)(33964004)(2616005)(36756003)(5660300002)(8936002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	8NOGQ4k91fGltNMiJElN1zmctTG2KFGasAk9tK3XXo0j5q0yqFBxMQSpteW0bMtfnoHt9AK1R3+5H08kz3WinxM/uTo7YQl2ZbsOSfKcaRSB0kmsjVKZCsnzQmfBZ27gdeesXXaReZEZDFIeW0o5Znk1KGnVnRXCneurTHYJO38QPuYlDtsknupwN+lzsWQnVEuvBI98UVyqJE3+JhXYm9n3HfDxh05F7K1f3gtvRQvFPQRloSNM+YZgVAs+lWnsQWOunxEkQ6zFEdNB6RiUjywhkK9NodfklTZahnHRlhYKz1kyKehc2E0kurw4cAHZ/cauWeYpWaKpHV7UgaVN3zAo7iqzu8iICa5bRbr3mHZZvzV/o4vTlUd2x/+O8OgeZGg2V5iK4rB6K9zHxgrm25C1V2vnlPyNGrRgI5i2R0DQkFzn/KuziRRpHxqN+yYqCPV/P6B9rq6RuU4RcmRg0gmphZMFLtEZq7afachwb8txvNCxMjt4Olft/EafpfbPL25+YWOohh1YNrRvIqhQKQg3x7lIzKYkHElnw08pvzPHZ5NvNON4QWh3prOw3Ts7/s+ci4N+ehKiTonjbYaR2t5IuKfJb7R6200Epkk7FtfMuda5UruwpBJiVQYdH6TaMQKsA/zhv4fzEPn2iOHKqg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adc84133-aa34-4c5c-ff52-08d837f63701
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2020 21:43:09.9074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rNqCQBLOofeSPs2826FRGsXumTduxAGVuSGm4shXQAUyysxe8oHod/uZTDzvLV2PzdT3NQr4YhdHe+Ldz6G8KZx11Ovx3YWHVDfe0AEdnno=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4101
Content-Type: multipart/alternative;
 boundary="------------46B625CCAA98CC756E1F36C6"
Content-Language: en-US

--------------46B625CCAA98CC756E1F36C6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/31/20 9:22 AM, Leon Anavi wrote:
> Upgrade to release 4.5.2:
>
> - Cleaner() now validates that only known configuration options
>    can be set.
> - LP#1882606: Cleaner.clean_html() discarded comments and PIs
>    regardless of the corresponding configuration option, if
>    remove_unknown_tags was set.
> - LP#1880251: Instead of globally overwriting the document loader
>    in libxml2, lxml now sets it per parser run, which improves the
>    interoperability with other users of libxml2 such as libxmlsec.
> - LP#1881960: Fix build in CPython 3.10 by using Cython 0.29.21.
> - The setup options "--with-xml2-config" and "--with-xslt-config"
>    were accidentally renamed to "--xml2-config" and "--xslt-config"
>    in 4.5.1 and are now available again.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-lxml_4.5.1.bb => python3-lxml_4.5.2.bb}   | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-lxml_4.5.1.bb => python3-lxml_4.5.2.bb} (93%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-lxml_4.5.1.bb b/meta-python/recipes-devtools/python/python3-lxml_4.5.2.bb
> similarity index 93%
> rename from meta-python/recipes-devtools/python/python3-lxml_4.5.1.bb
> rename to meta-python/recipes-devtools/python/python3-lxml_4.5.2.bb
> index a4198b029..7e11a67e7 100644
> --- a/meta-python/recipes-devtools/python/python3-lxml_4.5.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-lxml_4.5.2.bb
> @@ -18,8 +18,8 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
>   
>   DEPENDS += "libxml2 libxslt"
>   
> -SRC_URI[md5sum] = "4d3cca9c0018dd98f39e0ac54fcc3d14"
> -SRC_URI[sha256sum] = "27ee0faf8077c7c1a589573b1450743011117f1aa1a91d5ae776bbc5ca6070f2"
> +SRC_URI[md5sum] = "83ad758eab6c254b3565715967d553a6"
> +SRC_URI[sha256sum] = "cdc13a1682b2a6241080745b1953719e7fe0850b40a5c71ca574f090a1391df6"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------46B625CCAA98CC756E1F36C6
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
    <blockquote type="cite" cite="mid:20200731132230.20031-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 4.5.2:

- Cleaner() now validates that only known configuration options
  can be set.
- LP#1882606: Cleaner.clean_html() discarded comments and PIs
  regardless of the corresponding configuration option, if
  remove_unknown_tags was set.
- LP#1880251: Instead of globally overwriting the document loader
  in libxml2, lxml now sets it per parser run, which improves the
  interoperability with other users of libxml2 such as libxmlsec.
- LP#1881960: Fix build in CPython 3.10 by using Cython 0.29.21.
- The setup options &quot;--with-xml2-config&quot; and &quot;--with-xslt-config&quot;
  were accidentally renamed to &quot;--xml2-config&quot; and &quot;--xslt-config&quot;
  in 4.5.1 and are now available again.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200731132230.20031-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-lxml_4.5.1.bb =&gt; python3-lxml_4.5.2.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-lxml_4.5.1.bb =&gt; python3-lxml_4.5.2.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-lxml_4.5.1.bb b/meta-python/recipes-devtools/python/python3-lxml_4.5.2.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-lxml_4.5.1.bb
rename to meta-python/recipes-devtools/python/python3-lxml_4.5.2.bb
index a4198b029..7e11a67e7 100644
--- a/meta-python/recipes-devtools/python/python3-lxml_4.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-lxml_4.5.2.bb
@@ -18,8 +18,8 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403\DEPENDS+=">&quot;file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
 
 DEPENDS += &quot;</a>libxml2 libxslt&quot;
 
-SRC_URI[md5sum] = &quot;4d3cca9c0018dd98f39e0ac54fcc3d14&quot;
-SRC_URI[sha256sum] = &quot;27ee0faf8077c7c1a589573b1450743011117f1aa1a91d5ae776bbc5ca6070f2&quot;
+SRC_URI[md5sum] = &quot;83ad758eab6c254b3565715967d553a6&quot;
+SRC_URI[sha256sum] = &quot;cdc13a1682b2a6241080745b1953719e7fe0850b40a5c71ca574f090a1391df6&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------46B625CCAA98CC756E1F36C6--

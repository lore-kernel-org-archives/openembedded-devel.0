Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.58])
 by mx.groups.io with SMTP id smtpd.web10.12740.1598359348976726903
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2020 05:42:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=UDsgfuf4;
 spf=pass (domain: windriver.com, ip: 40.107.223.58, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SCmCoxMCOnpEk04H1oLSPoMyQQKk/lae0El6a51efz4SqDqnMYEszJdE3uqZtv+ZBlmiz1thWgZgQbIpufPQZkcvpTpOcVRNG5R6Z7kedma9wFCImb/EFIpDA94v8AWqN2X9A3Kzpc77w6fxQZtvpGh/jL/gy5HNAs59+KCVcSq4CAQ4okaoIo4xxPuR5k+H5sedsZNFhY2AuIJGiMxu93lYI7tsCduclmJIyy/ReTjVtEApCtL/uqxrIBiq/JmBsvW1WJUhTjNTU+FeFzshuVZnM//lN28+Dn4hU/xnO8s73QIrWI0SyH72J5Suqh5uT98weqmGH6GGstqk4MZdyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N2iUkPeij8WEkeGPXCzvDrHwVQaS2j9eiSFEOMQQS04=;
 b=BUR2rWgd4DHzgfBWIbyb1JMsQEJORAZpeTMyb9dh6QjKeFevUoYzpUeSz0BjJN93umM4QGWYB+eBz81ms8svXgXb7ZD4UfnGQId7JKD/P2K4kIWBAhI6hb3RERBmv3a84wJy+eJVrgE/x/DbIchx9L9gxTr4fZFG37QUZBLY28Imytog19nJWz4ChXRQ1YMvhxPeh4X0y+hAqFS+jKEapcr78hvfutY4rZ7njuFvDfV9kwanOHtWrhhcFIDblvl0q7VlBaRT+zASrjc9NxLiyLovemr7ZcE6IuTezARxtv7ywRTllO+x6bIb09dnMQWxUTcmFztfjMbTeIPDgiGzVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N2iUkPeij8WEkeGPXCzvDrHwVQaS2j9eiSFEOMQQS04=;
 b=UDsgfuf4u4dvNGElA8rxtAGb4nGOmWIhT6L4zDR0uAgFrzLPhExdU7rSN1X1d21tFqabAsV1mhXpexqfI6nT05TAub2aUt8IAsxAQt4BCWZVXgWtGHC5o53qgdjHFgSNRtQyh5svkkKx2OC5iLfmZuTDqc8l9cmWS/aQlm/uUmg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4260.namprd11.prod.outlook.com (2603:10b6:a03:1ba::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Tue, 25 Aug
 2020 12:42:28 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3326.019; Tue, 25 Aug 2020
 12:42:28 +0000
Subject: Re: [oe] [meta-python][PATCH 08/11] python3-nocaselist: Add recipe
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200821234504.719-1-leon.anavi@konsulko.com>
 <20200821234504.719-8-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <6f7b42b7-4aee-bb6f-84e4-4f507f048986@windriver.com>
Date: Tue, 25 Aug 2020 08:42:24 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200821234504.719-8-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTOPR0101CA0019.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::32) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YTOPR0101CA0019.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25 via Frontend Transport; Tue, 25 Aug 2020 12:42:27 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b516a97-4615-4715-53bf-08d848f45324
X-MS-TrafficTypeDiagnostic: BY5PR11MB4260:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4260102D9C596A5919F058E59F570@BY5PR11MB4260.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ugq3ILHvJ/8FAbv5eMBpq6f+ydnrPKHxHnzvoZ2DHR+RzRrlLt9jy8ai7UP6n05JmMhgSa76DctWSedOnqPs6JQq8A/0DMqxa35Z0SoSthNKVjZIp4UcwVpxKveOxLc1dbqtzSVAQqEGe/BjL7Ae0g1ho9U7pwufTTuEMIh1Va1cxbx/EO0vn17nLvlFxAnSfJdgEa0TXXsHVMZ6ydiMQs3eObOiPPKC+h2Zr1kwsrNPrr334t61ctZ/C+LE6V4EKYKzSQds1Dpj6qvgvtYfZHMo44uuwlvmP/bZlKJDM+tZTa3jCEtOr4b9F6CbL/rMOkLTXSp7IqdRqz1TBLjLnW7XYr6VfL3Jn/uHmWEcp5/UtP6v7X0Ed9W5EX2psTMvbpshUJ/+W0cShpr+EYqpLDSrleL4Ot5fs5kmcZm+KrzVKK6v1P/g4kwaICkrPc/r3LWKyXjHJwkUcjsPYIqAMA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(376002)(396003)(136003)(366004)(186003)(66556008)(66476007)(52116002)(66946007)(6486002)(966005)(8676002)(36756003)(33964004)(316002)(5660300002)(16576012)(31686004)(31696002)(26005)(6666004)(86362001)(53546011)(2616005)(956004)(44832011)(166002)(478600001)(83380400001)(2906002)(8936002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	Lt+sUZu7J47PejJi2MbsJF20NFn/cQ00FE0pijnJfanPlL2dg/eok5KV6pxyXNGlMopKZJJsy00N6vCwMqx4xoj0SoOdacr55JSMPGhDNBF5c1JLJ7pUEMhGVDur0W70Xfo7zS0sjkmxGNlXEAXQCVX8ZDknzdCDYUeHbyMNvw/Hst2kJMNEhiACC3Svh39fwodsXtuX//7VEKbh1rK2uJ1vZaemlxTg23GhEv2N/7jSzhrQMDcD8lvmz4bCLrgJ/icl2yC6pI1DeF69jRlL8wCiExUv/+9YSJZsoJFsyqn8vWxFVQiOaHm/i5Sey7zMTyOH7wtDrn4/9+gxwDeeVB1R6GWRwkUWljxwuyqqP+DED8ZLX6qw5UBL2L+trdPDDrMj+78kVqwexu0/zq0icHgASneqE3vWC8zbOR+SdZkc4jKLH3QQ4USLt+M54zxorXjiElDZTHLTK1FI3k4wPw9nqato89sfPQZePyOH96tZHwmNPdkPentZ2f5OdTZBy0AoqdzDWrZnC8Cte984xETrvcZ+ZBStoKwxLcFUjKkbw9syIl6HtCcxqo1Wz6H4xnkLaiAQj0naAqGwBdPgPtG/sRDuZvtW833wSTQVm8c5UqqOTq/ZdQjJRNJzDnWd7w8f/Wx5OhKTP/B+VaZvog==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b516a97-4615-4715-53bf-08d848f45324
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2020 12:42:27.8733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YauvcBFcMY1pCrZwg7rFpKPhfBUN57yXdlcyysFD/lv4q2+IIHxxituHWBKmObYRG7jjR11EjIUkLlvqYMSZulb1Yth6DouessZXC6nsT78=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4260
Content-Type: multipart/alternative;
 boundary="------------146801834D8DE719B05E6972"
Content-Language: en-US

--------------146801834D8DE719B05E6972
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 8/21/20 7:45 PM, Leon Anavi wrote:
> Add recipe for nocaselist, a case-insensitive list for Python.
> Changelog for 1.0.1:
>
> - Fixed the incorrect behavior of the ‘+’ and ‘+=’ operators to
>    now (correctly) treat the right hand operand as an iterable of
>    items to be added, instead of (incorrectly) as a single item.
>    For ‘+’, the right hand operand now must be a list, consistent
>    with the built-in list class.
> - Fixed the incorrect behavior of the * and *= operators to now
>    validate that the number is an integer and raise TypeError
>    otherwise, consistent with the built-in list class.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python3-nocaselist_1.0.1.bb  | 9 +++++++++
>   1 file changed, 9 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-nocaselist_1.0.1.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-nocaselist_1.0.1.bb b/meta-python/recipes-devtools/python/python3-nocaselist_1.0.1.bb
> new file mode 100644
> index 000000000..9a6b24e75
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-nocaselist_1.0.1.bb
> @@ -0,0 +1,9 @@
> +SUMMARY = "A case-insensitive list for Python"
> +HOMEPAGE = "https://nocaselist.readthedocs.io/en/latest/"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
> +
> +SRC_URI[md5sum] = "a2654766ee683906ba6c77ac1e89f556"
> +SRC_URI[sha256sum] = "87dc37f97cf52f6e10e1e4a82f56359067462a713222b52976045bf227a40eda"
> +
> +inherit pypi setuptools3
>
> 

--------------146801834D8DE719B05E6972
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/21/20 7:45 PM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200821234504.719-8-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Add recipe for nocaselist, a case-insensitive list for Python.
Changelog for 1.0.1:

- Fixed the incorrect behavior of the ‘+’ and ‘+=’ operators to
  now (correctly) treat the right hand operand as an iterable of
  items to be added, instead of (incorrectly) as a single item.
  For ‘+’, the right hand operand now must be a list, consistent
  with the built-in list class.
- Fixed the incorrect behavior of the * and *= operators to now
  validate that the number is an integer and raise TypeError
  otherwise, consistent with the built-in list class.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200821234504.719-8-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python3-nocaselist_1.0.1.bb  | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-nocaselist_1.0.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-nocaselist_1.0.1.bb b/meta-python/recipes-devtools/python/python3-nocaselist_1.0.1.bb
new file mode 100644
index 000000000..9a6b24e75
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-nocaselist_1.0.1.bb
@@ -0,0 +1,9 @@
+SUMMARY = &quot;A case-insensitive list for Python&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://nocaselist.readthedocs.io/en/latest/">&quot;https://nocaselist.readthedocs.io/en/latest/&quot;</a>
+LICENSE = &quot;Apache-2.0&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327">&quot;file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327&quot;</a>
+
+SRC_URI[md5sum] = &quot;a2654766ee683906ba6c77ac1e89f556&quot;
+SRC_URI[sha256sum] = &quot;87dc37f97cf52f6e10e1e4a82f56359067462a713222b52976045bf227a40eda&quot;
+
+inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------146801834D8DE719B05E6972--

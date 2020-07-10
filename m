Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.84])
 by mx.groups.io with SMTP id smtpd.web12.9821.1594384691084780143
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jul 2020 05:38:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=kBN8ZVZL;
 spf=pass (domain: windriver.com, ip: 40.107.93.84, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mZ8QNRwiCJESmiax54onHHTnUgu6RRM9P6Zeoq+9AElb9Et0ExxGd8XoJZNWHkceiZyaNdxt1eNgH4/fTJjHBRbogYk36HeytyTCkNEnbSLIgGcoNfsUghJpzbGjrqnaI2htF5DzGG+Zlh36mzNYKlBxInXyGTnIqCYih1mwu3sELFta3aROj4IiDO5rI46/7IDz403iZpPdCwA8MuiDkU3b3ljnnsVQ4mYWEb3CJqRGxCRNNgXRE3Y31flcByWSn/lgLlHjZx6k2klIORN4LWTLkpWGeB/OkAcWhNL3pI6Twlrcehi11lOYJwrBL7SwfnlZ1Vl1vMCfhpgAVsXLRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mstiendf67KMsD0srGBOnNj1BeCPCwZ8SrXlG5EP7C8=;
 b=dtkbSLVBGlSefS+8KM2aLdwmmxg2PCwNplbChUkr40huEDfzGAMgpCLI4MCgAbSOUTTAPPhmsD50HYlgie7vaADwOZHxR/4adIGLQYqj/sBG7DOfJ316KYIOKqOCDocdSzyDoeCrIxOAx3jZ2wrqI1eobCebU9Ugs5dPpK8bjhDzZznHplLknodFgMuNO9rb27GC4TMNpItXXuIOzgckAl5O5pNaMRCiimP9R4Jz3XrtrXSnIQ7AFj7NPlhlfr/KyIUf1+ZNWoJ6cZAv8BgJlDEC5yivXSjcQiVTlsIhXP+XCGo8lwTGKxu03/tOlnSV1WxIDBjZlWCddNERRvnjmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mstiendf67KMsD0srGBOnNj1BeCPCwZ8SrXlG5EP7C8=;
 b=kBN8ZVZLXmBUgo8i5dUx5NNtIxe1+QdKjNIgTNoZRdBTpv63m1HSfd7jKPjm/keXz3xQ7oy2b6nDdkAg/eplHtKsNVmXhHB6yVgot8u3Wkq9Qc5oAX0HNiqP3HyvOjPeyvs+qjbfgsRzMRu6/qbcJE2DcN8n352vxS5BFzr3wRQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM6PR11MB4516.namprd11.prod.outlook.com (2603:10b6:5:2a5::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.20; Fri, 10 Jul 2020 12:38:10 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3153.031; Fri, 10 Jul 2020
 12:38:10 +0000
Subject: Re: [oe] [meta-python][PATCH 7/7] python3-jsonref: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200708094659.27331-1-leon.anavi@konsulko.com>
 <20200708094659.27331-7-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <273f009e-62a3-26df-e041-1cb0d550081e@windriver.com>
Date: Fri, 10 Jul 2020 08:38:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200708094659.27331-7-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0003.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::16)
 To DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0003.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21 via Frontend Transport; Fri, 10 Jul 2020 12:38:09 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 873101d5-7d24-4ce3-2045-08d824ce1a7f
X-MS-TrafficTypeDiagnostic: DM6PR11MB4516:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB4516048BF2E32A09D61ABFA89F650@DM6PR11MB4516.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:221;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HHXbRZYOYlBugKjMJu8Wb3yaJtn8GQaFX8//qtDpjvfB6JEnQMQjXmqTioA6UiMqSjxwu1Lx18G+gBV0CeB6O4HMdpHpLWnbFM0DxrZtTCDclXJ+dw7cxETYaS6Ku+ufY6mb7pPCtFkAWzC2HmtzsRWeZfZkRAWMbfboJudEl/+KXJijH6GuLUcidl4OG/koyKUWCOHm6+F/iDadoJ/gPIQZQp7/391hbi+LKwQ7Y9xV3Ss6wsx+tjg0k8ERL+OPZaSPpwX7Ffv8bPcuAf9ufd4M3gw3cRb6s305wRCgVstJR7MjUTbf2bv2+vvBgraH/DH5iQE/P9JTaTzYcZ3sCDV0JrN3fXc8iCIBfMugXRHC5TmD1c5GTG4Pn06/hivoGs/R7kPwPcEziGJiVlbFXocl8lHR/3BoRIXwXyI3UDlNMnULHdpGBxqXyf3XP8FlckJImTN8UZkQ9fgwZpNmLQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(39850400004)(366004)(376002)(346002)(136003)(16526019)(16576012)(44832011)(166002)(53546011)(66556008)(66946007)(26005)(66476007)(2906002)(966005)(316002)(478600001)(8676002)(31686004)(31696002)(8936002)(6666004)(6486002)(86362001)(2616005)(956004)(36756003)(186003)(52116002)(5660300002)(83380400001)(33964004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	8zirqB33RahGR6gNXktFhiNTZxgcqq7bJlpFTWQind5VQeGDiu4Wi5lz6U2GJz40lYqJtYK1+HgTPA7pUvP4lUyxjZUgFSDx2GiCH6XtwwI7lJJjn9kIqjK6HdSwa+cYwwhszxQ10HLD5TT2EXeRUV7ARUDkULbkcEx0vWw5zoSz5RykEPUkDadd389QvDezC39MtfNOf+qTEEOG7z6Jq5nCjU9d5g+IgeDMVfP7JMcor14YbZH5ZGeHzrReAYM2hsk+CPOJh3ZURSVJn/FSFOGlSmb1LJxemWjn0Usmpn8k8NFDZEBv6AxBDxVHYPbvB+N/h4GtWo8hMExRXC+HQ1i7gd6D4P5uJLMBTOodSoktpnb1YjB1BQT15rsTb6vrQRduJ1pksdl95iNYZyCFb3JVzqbASZ1G/EQVjJ1KEdn7lYjfZ0vpYOJxMcjMVjTkfrkpL3kkay/KEpCudppAGy+TLLUZq0tRfmTKqVBYgbM=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 873101d5-7d24-4ce3-2045-08d824ce1a7f
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2020 12:38:10.1056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I1RJchtLqW9axSHkBEjcHTYhrEnBHRJg7kC7EKKN+OQUssUOZaMY3rT74A//LlrfHYr2yjScyPULKlQtc8nlBA061j9oYIlId/Pd46iD5i8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4516
Content-Type: multipart/alternative;
 boundary="------------166D3A04E778F0D0525A7A92"
Content-Language: en-US

--------------166D3A04E778F0D0525A7A92
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/8/20 5:46 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python-jsonref/python-jsonref.inc                | 11 -----------
>   .../python-jsonref/python3-jsonref_0.2.bb            | 12 +++++++++++-
>   2 files changed, 11 insertions(+), 12 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python-jsonref/python-jsonref.inc
>
> diff --git a/meta-python/recipes-devtools/python-jsonref/python-jsonref.inc b/meta-python/recipes-devtools/python-jsonref/python-jsonref.inc
> deleted file mode 100644
> index 45deb09c7..000000000
> --- a/meta-python/recipes-devtools/python-jsonref/python-jsonref.inc
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -SUMMARY = "jsonref is a library for automatic dereferencing of JSON Reference objects for Python"
> -HOMEPAGE = "https://github.com/gazpachoking/jsonref"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=a34264f25338d41744dca1abfe4eb18f"
> -
> -SRC_URI[md5sum] = "42b518b9ccd6852d1d709749bc96cb70"
> -SRC_URI[sha256sum] = "f3c45b121cf6257eafabdc3a8008763aed1cd7da06dbabc59a9e4d2a5e4e6697"
> -
> -inherit pypi setuptools3
> -
> -BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python-jsonref/python3-jsonref_0.2.bb b/meta-python/recipes-devtools/python-jsonref/python3-jsonref_0.2.bb
> index d97893f5a..45deb09c7 100644
> --- a/meta-python/recipes-devtools/python-jsonref/python3-jsonref_0.2.bb
> +++ b/meta-python/recipes-devtools/python-jsonref/python3-jsonref_0.2.bb
> @@ -1 +1,11 @@
> -require python-jsonref.inc
> +SUMMARY = "jsonref is a library for automatic dereferencing of JSON Reference objects for Python"
> +HOMEPAGE = "https://github.com/gazpachoking/jsonref"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=a34264f25338d41744dca1abfe4eb18f"
> +
> +SRC_URI[md5sum] = "42b518b9ccd6852d1d709749bc96cb70"
> +SRC_URI[sha256sum] = "f3c45b121cf6257eafabdc3a8008763aed1cd7da06dbabc59a9e4d2a5e4e6697"
> +
> +inherit pypi setuptools3
> +
> +BBCLASSEXTEND = "native nativesdk"
>
> 

--------------166D3A04E778F0D0525A7A92
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/8/20 5:46 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200708094659.27331-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200708094659.27331-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python-jsonref/python-jsonref.inc                | 11 -----------
 .../python-jsonref/python3-jsonref_0.2.bb            | 12 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-
 2 files changed, 11 insertions(&#43;), 12 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python-jsonref/python-jsonref.inc

diff --git a/meta-python/recipes-devtools/python-jsonref/python-jsonref.inc b/meta-python/recipes-devtools/python-jsonref/python-jsonref.inc
deleted file mode 100644
index 45deb09c7..000000000
--- a/meta-python/recipes-devtools/python-jsonref/python-jsonref.inc
&#43;&#43;&#43; /dev/null
@@ -1,11 &#43;0,0 @@
-SUMMARY = &quot;jsonref is a library for automatic dereferencing of JSON Reference objects for Python&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/gazpachoking/jsonref">&quot;https://github.com/gazpachoking/jsonref&quot;</a>
-LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=a34264f25338d41744dca1abfe4eb18f">&quot;file://LICENSE;md5=a34264f25338d41744dca1abfe4eb18f&quot;</a>
-
-SRC_URI[md5sum] = &quot;42b518b9ccd6852d1d709749bc96cb70&quot;
-SRC_URI[sha256sum] = &quot;f3c45b121cf6257eafabdc3a8008763aed1cd7da06dbabc59a9e4d2a5e4e6697&quot;
-
-inherit pypi setuptools3
-
-BBCLASSEXTEND = &quot;native nativesdk&quot;
diff --git a/meta-python/recipes-devtools/python-jsonref/python3-jsonref_0.2.bb b/meta-python/recipes-devtools/python-jsonref/python3-jsonref_0.2.bb
index d97893f5a..45deb09c7 100644
--- a/meta-python/recipes-devtools/python-jsonref/python3-jsonref_0.2.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python-jsonref/python3-jsonref_0.2.bb
@@ -1 &#43;1,11 @@
-require python-jsonref.inc
&#43;SUMMARY = &quot;jsonref is a library for automatic dereferencing of JSON Reference objects for Python&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/gazpachoking/jsonref">&quot;https://github.com/gazpachoking/jsonref&quot;</a>
&#43;LICENSE = &quot;MIT&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=a34264f25338d41744dca1abfe4eb18f">&quot;file://LICENSE;md5=a34264f25338d41744dca1abfe4eb18f&quot;</a>
&#43;
&#43;SRC_URI[md5sum] = &quot;42b518b9ccd6852d1d709749bc96cb70&quot;
&#43;SRC_URI[sha256sum] = &quot;f3c45b121cf6257eafabdc3a8008763aed1cd7da06dbabc59a9e4d2a5e4e6697&quot;
&#43;
&#43;inherit pypi setuptools3
&#43;
&#43;BBCLASSEXTEND = &quot;native nativesdk&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------166D3A04E778F0D0525A7A92--

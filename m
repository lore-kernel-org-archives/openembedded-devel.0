Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.42])
 by mx.groups.io with SMTP id smtpd.web11.22434.1600263484711240901
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Sep 2020 06:38:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=JsEjXuCu;
 spf=pass (domain: windriver.com, ip: 40.107.75.42, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=njTiWbmGyk1Qx3fPF3Sy+hX+BLqmKKIOWDOoFksXIl4NqZNSAcNxx5lgMowrO6oHdCQq2MhYH8yJ75H2DAfsSScWkqm9d44O+90wb5GQ82R1Z1lhnDhkh1ftxt4PYdHRuxLKaE2sfjjAhhgVA8XaTCkqEJe2MN2DN/5+m3qdEjiELf2O1bITXwwq+qKiYIqbM8WbgbfAeExssVpQS4Bea0Q0UsU5XaFdZPVGOdSEye+ctYBJXMEdwA156xt987t7yd2WCCroaF6FbGd8HBUxlDTNHD1SKiT0h6yQlAg8GNFCWmFa4kpblzrChVBzbvvZCUoMPRjU0sH7i6pKxw22lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KrubSRLIGizL8PlzA2w9XIdJHfG29Ff9pt4LAYYZUmg=;
 b=nWiNtfo6HaSIYgMfM0dfSs1hu+dvuk7MPHAvEelmQFpgM4H3WiDEw4MPd9SeI1u7hEuNh2r/g3cGk+MQwzwT1dhluZAfIqLpALRI56ZVhwo9HAYpb0fJzc/oPR+eljo1j4WSs7jqh/tti3CLY1ic16ii7GCnWmj4EEKpmKe5ubkrSnGx4yY6IKUdj5a4MPEZa3YcIJb5TazCOnf9pdOXWLVIqry3EiDDfJePrUgix5W5tcp3UzdCPLEMp5AYNxwmn7ijJYMmSqEzIwVGIwNOUa1oUf3rVaVYTJB+k3oybuthX4VlAMv0oLmw4KGTgzux4HbWXNJiD0r4Xpedqmcnng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KrubSRLIGizL8PlzA2w9XIdJHfG29Ff9pt4LAYYZUmg=;
 b=JsEjXuCucGYPMEzEDJelixk87uIxXdSWMukm4lNVS9BlnRyDNfMjDGm/WxJzhFLQxJ1TrGC59sDJIDBp6AQduxkYfNCbBSHBpVBiYfcc+MGbRKIo5PVDJHciVJpAXDD3sa5d2ikEv3yquINbP632mCZPFe7eA2A517IBxuWydW0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4306.namprd11.prod.outlook.com (2603:10b6:a03:1bb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.17; Wed, 16 Sep
 2020 13:38:02 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3391.014; Wed, 16 Sep 2020
 13:38:02 +0000
Subject: Re: [oe] [meta-python][PATCH 10/10] python3-pyrsistent: Upgrade 0.16.0 -> 0.17.3
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200915090303.14367-1-leon.anavi@konsulko.com>
 <20200915090303.14367-10-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <c2600e85-6dc1-55d4-fca5-714ebee56996@windriver.com>
Date: Wed, 16 Sep 2020 09:37:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200915090303.14367-10-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0086.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::25) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0086.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.13 via Frontend Transport; Wed, 16 Sep 2020 13:38:01 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ece6bd3-afe2-463a-ee66-08d85a45bbbb
X-MS-TrafficTypeDiagnostic: BY5PR11MB4306:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4306770967079F6847B88D319F210@BY5PR11MB4306.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:635;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OWPRLt5/ZnRl7Cb8gXQVXjM1ZcC6KqtzDW+a/R7sHQJT8grTn6g4WB+o9PQY5DCdUOzoLUiOjRVP9k3EQ1HaBeuwShPKqsVHDqr/yJRHy9Cpu7ezT9HnqX3syX9pj2IrVTpbi7wLM7bJXftYSURkd3zOYkdV8AiCabZxWp3DvLFRKcLuhut2zXrs1uR9cW+9gSGtKeBawrGROM91Mdq70xxLxrOjZqG91iFTP24dnyUDE81+59/JctMBcfbFeMB58BKoOgb3MkLOAD4dI0GK5fG69nD3iuPsYE3IdbiqYUuQfVtlFLUdvRcSsSiPj8OAAZ6vXatFectbEFGhmEZZjHarGOuZG8ZqWUSZMwwuSFTIhzoDc57U6oWf0CI3oWntvZig0D+r3Lj+TqVJRSaer6uJcNaTvcJhL6HWc7pBP/BEm326aNEjY3nCrRcRSMmvm4XiblzUCb6Q3b/g1WsmgEIlIWd1YXbd6k/PKbXHzn0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39830400003)(396003)(366004)(136003)(376002)(346002)(83380400001)(956004)(8676002)(5660300002)(2616005)(966005)(53546011)(478600001)(26005)(44832011)(166002)(8936002)(316002)(31686004)(6486002)(86362001)(31696002)(16526019)(66476007)(186003)(52116002)(33964004)(2906002)(66556008)(66946007)(16576012)(36756003)(43740500002)(148694004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	KvZUScXa/Li+f5yNYusEPtS3RC4bnxmrGkNNifkZZOlO2Ltk5jzVHZJvoxtCrbvOH1aFLYQ+nj25NXhbAMIZ+alCRcp0zn8RqEBHQdIRmSSsPzDeInBjjR13RQoxBYYW06H/zCd18KCYOYX+latMMPR4RL2rbiwI6mUBOAo+jLJ7TDMmWumHnY6/OWaqn+Kt5TDIrAxaV+BLtX3m1zh+oGyAd9pChjG+YvXtxPjBm7ylS/6LxW5y8eifYANpwnaBmwpQ6Lju2Y/6KW8xbVeUAVOyfAgL701AnbbHP/LD+ZNf/7jp+BaBh9nkx3GO0AfkToSaKSliXQe0xCQZWwTyVJ7rLhOuFiCxMHG9FHOg9Ep0ubkjJBOQ1ZnJfPEIh+VP12YGkFfbYuRkx8iFpuQ22Sb+JrODRvF3L5zY2eDJPYiVxSOCOx3PyuYulh3OfmgvA9ruXNe+VXllGd8sjqZx+z6p4+NxyUri6NqU7/x/Hy1FDAH32je8TDcGedJBd2VIE1mWwemiR09hN+vhqwKv1yTJSFWwnN10lCcOEtWEaPRoq7H2dkQRwoV6ujrZA5MNxiuD2AHxPCNRJ1d6/Gnm749ltAQ9uQkPq67YfHdm9rdnKqBIIqdhNxSqCLMuoOX0HP0kjfYvjy2YnWGaZw0gOw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ece6bd3-afe2-463a-ee66-08d85a45bbbb
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2020 13:38:02.4772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fxwngfbxi4kClj1tm7Bufkq/inj0itr9roMWckzcwP5d5QoAZgVf9AC10s3o6UNNZBcUGAyAh2xD0pahVqAcMLT8aJMHkgDC9Q909zn0bjY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4306
Content-Type: multipart/alternative;
 boundary="------------0517A6E025D13140985A2676"
Content-Language: en-US

--------------0517A6E025D13140985A2676
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/15/20 5:03 AM, Leon Anavi wrote:
> Upgrade 0.17.3:
>
> - Remove Python 2 support code. This includes dropping some
>    compatibility code and the dependency on six.
> - Python 3 exception chaining. This is a minor backwards
>    incompatibility, hence stepping to 0.17.0.
> - Restrict package to Python >= 3.5 to not break unpinned
>    Python 2 dependencies.
> - Release v0.17.3 with proper meta data requiring Python >= 3.5.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...on3-pyrsistent_0.16.0.bb => python3-pyrsistent_0.17.3.bb} | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pyrsistent_0.16.0.bb => python3-pyrsistent_0.17.3.bb} (66%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pyrsistent_0.16.0.bb b/meta-python/recipes-devtools/python/python3-pyrsistent_0.17.3.bb
> similarity index 66%
> rename from meta-python/recipes-devtools/python/python3-pyrsistent_0.16.0.bb
> rename to meta-python/recipes-devtools/python/python3-pyrsistent_0.17.3.bb
> index dec661143..72736c891 100644
> --- a/meta-python/recipes-devtools/python/python3-pyrsistent_0.16.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyrsistent_0.17.3.bb
> @@ -3,14 +3,13 @@ HOMEPAGE = "https://github.com/tobgu/pyrsistent"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENCE.mit;md5=ca574f2891cf528b3e7a2ee570337e7c"
>   
> -SRC_URI[md5sum] = "4ba30da6f0a63554e70ac6c4c1904929"
> -SRC_URI[sha256sum] = "28669905fe725965daa16184933676547c5bb40a5153055a8dee2a4bd7933ad3"
> +SRC_URI[md5sum] = "cd38658ea772a7f9b12b6f9485a7018b"
> +SRC_URI[sha256sum] = "2e636185d9eb976a18a8a8e96efce62f2905fea90041958d8cc2a189756ebf3e"
>   
>   inherit pypi setuptools3
>   
>   RDEPENDS_${PN} += " \
>       ${PYTHON_PN}-numbers \
> -    ${PYTHON_PN}-six \
>   "
>   
>   BBCLASSEXTEND = "native nativesdk"
>
> 

--------------0517A6E025D13140985A2676
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/15/20 5:03 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200915090303.14367-10-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade 0.17.3:

- Remove Python 2 support code. This includes dropping some
  compatibility code and the dependency on six.
- Python 3 exception chaining. This is a minor backwards
  incompatibility, hence stepping to 0.17.0.
- Restrict package to Python &gt;= 3.5 to not break unpinned
  Python 2 dependencies.
- Release v0.17.3 with proper meta data requiring Python &gt;= 3.5.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200915090303.14367-10-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...on3-pyrsistent_0.16.0.bb =&gt; python3-pyrsistent_0.17.3.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyrsistent_0.16.0.bb =&gt; python3-pyrsistent_0.17.3.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-pyrsistent_0.16.0.bb b/meta-python/recipes-devtools/python/python3-pyrsistent_0.17.3.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-pyrsistent_0.16.0.bb
rename to meta-python/recipes-devtools/python/python3-pyrsistent_0.17.3.bb
index dec661143..72736c891 100644
--- a/meta-python/recipes-devtools/python/python3-pyrsistent_0.16.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyrsistent_0.17.3.bb
@@ -3,14 +3,13 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/tobgu/pyrsistent">&quot;https://github.com/tobgu/pyrsistent&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENCE.mit;md5=ca574f2891cf528b3e7a2ee570337e7c">&quot;file://LICENCE.mit;md5=ca574f2891cf528b3e7a2ee570337e7c&quot;</a>
 
-SRC_URI[md5sum] = &quot;4ba30da6f0a63554e70ac6c4c1904929&quot;
-SRC_URI[sha256sum] = &quot;28669905fe725965daa16184933676547c5bb40a5153055a8dee2a4bd7933ad3&quot;
+SRC_URI[md5sum] = &quot;cd38658ea772a7f9b12b6f9485a7018b&quot;
+SRC_URI[sha256sum] = &quot;2e636185d9eb976a18a8a8e96efce62f2905fea90041958d8cc2a189756ebf3e&quot;
 
 inherit pypi setuptools3
 
 RDEPENDS_${PN} += &quot; \
     ${PYTHON_PN}-numbers \
-    ${PYTHON_PN}-six \
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

--------------0517A6E025D13140985A2676--

Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.56])
 by mx.groups.io with SMTP id smtpd.web11.8664.1590075195165301568
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 May 2020 08:33:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=aj1E9Nx8;
 spf=pass (domain: windriver.com, ip: 40.107.94.56, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ik0TaEJAL2nEejwbLuXgLbD824WES7XBhkqpM8emVLUkvbfuaMycS6Nh6ehmwHCSsI9UUlUlrkQ0e/yk+QzPdFzNHVKS0ly7nWr/RLryQYhcnxv7d1KLwU650MIVyzwYn5F3Rn5MY8JZyPJF8oMLsll6U3pU2AWyjAGIatyC6BHdrOflKJhTNvJVNmHtXGmvCzLPJLhCyHQl0Hi2YizCf24GxGWz2WLz/qcziwtxgwEGk3M40uanKegOd+FzFGX2GwaFrJEgURw4Frbz0H9vEaJoeyslpU22OBXqy1/PHGyn7qOVEIXqAherM4HwLMGIsnAmlcyoCCtvM8q63RWHBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=blzWVHr/xxX9cfchD8IcCRYtdHtNWVbYwZzKcbNXvSg=;
 b=OmCJl3vEqryrOzkJhUZ1Vhlr17ktMqeHIiBrS2JwqwkBswrn/6DS4wizokJeKWCNHqKOL2SZ285cHG4jA8OZelg8wy2seQPw2LXJTU5UZjU4eWIeT2HaMveAgQFkNpmm8JEYsHj2dWFUzzG9aMfFyih7e5bt8HSTa6LVCD/ABo9aNgdFelDblcA0/GsFpGeh5dUHM3zqJqAYpkMLCCfN1di1tPd4CX9Wdj6vsfVISP8poImh9aKVW+pKWo7XFPk7oNU1tLlkTdZOCyJzZdqHSVvKsoYUDANIWSmbV9dXb6k7c0bYzHY3/d0kEh7vPIs7g2g/kS66HU+8PKDyN7sOUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=blzWVHr/xxX9cfchD8IcCRYtdHtNWVbYwZzKcbNXvSg=;
 b=aj1E9Nx8f81nHoJ/V3g1yiBrnnvl5+WpOJuXWHl0vgSyVzRtiL193B+ndhHdSn0onFlUjQHSu3Ri0MPb0P9EPC8fMU6y14HqmLVuyX5JMoxSCFKmcyJtCaiIqIlFys+kXSCe/fsH94snxqo0Cdpqu3+Vb9XlDQsRSDtJVJURq/E=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1809.namprd11.prod.outlook.com (2603:10b6:404:102::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.24; Thu, 21 May
 2020 15:33:12 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3000.022; Thu, 21 May 2020
 15:33:12 +0000
Subject: Re: [oe] [meta-python][PATCH 4/4] python3-appdirs: Upgrade to 1.4.4
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200520141502.28254-1-leon.anavi@konsulko.com>
 <20200520141502.28254-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <59f3db1c-74b5-773c-d386-d34aef443716@windriver.com>
Date: Thu, 21 May 2020 11:33:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200520141502.28254-4-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0057.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::34) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTXPR0101CA0057.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23 via Frontend Transport; Thu, 21 May 2020 15:33:12 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 03fea419-24fa-4fe5-dce8-08d7fd9c45b8
X-MS-TrafficTypeDiagnostic: BN6PR11MB1809:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB180937E3285407B7EEF4C7529FB70@BN6PR11MB1809.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-Forefront-PRVS: 041032FF37
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aKKwOo2Zo1++dusQ70xdrAQB7cWtXT0QjMwVm7kYUvDWZNOLNsl//H82CU/6ar+HSN0eMzzrIwsJREjBGq8SZKiOp8jtp5SLahO8mqXnzi9OzV6R4n8PIH74DZrWL1vGyILSgJLjwDxxQ+QUXhwEZeqNoEdrbJErSaZtRhSJfFYSQLKXTUHx2QugANnJafPYHctMKEYwVMYRoK9rGPHP18NxqK4V4FpyY/cyGRzr2iU7g13OJTWT+76lVapBicXnU1KwFp4uzQq7Phf+YwZbMHk5IquCEhCi9qltc/s3f2N7wweSmatbscdGAo9Z4FNQfn7HpWkJ8OeN7waudrEM0H76v2PcioXIwHyIcwVEqADKvMa0jq6inZ+UbK9Pw1054cEtlRQIklIa4pXprmK2VoRJtHusz4XDm2nB9UotMBPxa0tDb6cyb/l2UzA/4t0Huh/Qm8P//gyd7ZwRPXiVDw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(136003)(366004)(396003)(346002)(376002)(31686004)(26005)(478600001)(5660300002)(53546011)(166002)(6486002)(186003)(16526019)(52116002)(66946007)(2906002)(33964004)(8676002)(316002)(8936002)(16576012)(36756003)(66476007)(66556008)(44832011)(31696002)(956004)(86362001)(966005)(2616005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	1cJkflbivFNKkD+35uREaFODzZo4SxPA2zsUnMbCvJNnw0qSivSCFrPilhF/d0r5SdHtb33Pu75DCj3eD4VIi/AwiJfgJZOqVnkaTLdR6aefnLgDa3UCR7KcJMh3khuooVm+Y3A5lr39lgufIWAKSDiIh0JYobMvUucXLYRW9HFbVcaMgd+a7UfQ+fQj/va5RgCalgs14oHflowlsSmGY+fSWLValMiKrNxA41m+boCw2kRe6BK9tbcYt2PxA6FRHfDW0oRSHd4e/swF2d6qkAxFQHOG0+viXglFS3ROhKVDM80UcvjtXBAfD7Zbk6fanmtgK2DUoo59QislVGQbNFh3BxKm3l7edDlskW8pIIXeQ57RSVzzjBu0jOwmhBOWXE+bijagCY9l6oPMaliYWC9n6AExhEda3114qdFHOBMxuNLY6a7ojLuXaY4R5DH4Ro0L68r190GgmEaaOuHUfA9+qKjV96A8Osr/5oSZgGjdaPQuMGMObaNrGhzkcWvp
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03fea419-24fa-4fe5-dce8-08d7fd9c45b8
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2020 15:33:12.4222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8SzoapE4ETZWLaWEWKvLA4K2SwipzyKLo++NvgKXlOFzx9qIbIQzm+lKDUByCCruq2kAYgPCQxmKiix1L30OWAQJ2sfMvSjxMIEKM/cruCc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1809
Content-Type: multipart/alternative;
 boundary="------------58E9194DD9EC9FA528167C3F"
Content-Language: en-US

--------------58E9194DD9EC9FA528167C3F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/20/20 10:15 AM, Leon Anavi wrote:
> Upgrade to release 1.4.4.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-appdirs_1.4.3.bb => python3-appdirs_1.4.4.bb}    | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-appdirs_1.4.3.bb => python3-appdirs_1.4.4.bb} (75%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-appdirs_1.4.3.bb b/meta-python/recipes-devtools/python/python3-appdirs_1.4.4.bb
> similarity index 75%
> rename from meta-python/recipes-devtools/python/python3-appdirs_1.4.3.bb
> rename to meta-python/recipes-devtools/python/python3-appdirs_1.4.4.bb
> index 2e183d888..eef5c0273 100644
> --- a/meta-python/recipes-devtools/python/python3-appdirs_1.4.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-appdirs_1.4.4.bb
> @@ -6,8 +6,8 @@ SRC_URI += " \
>   	file://run-ptest \
>   "
>   
> -SRC_URI[md5sum] = "44c679904082a2133f5566c8a0d3ab42"
> -SRC_URI[sha256sum] = "9e5896d1372858f8dd3344faf4e5014d21849c756c8d5701f78f8a103b372d92"
> +SRC_URI[md5sum] = "d6bca12613174185dd9abc8a29f4f012"
> +SRC_URI[sha256sum] = "7d5d0167b2b1ba821647616af46a749d1c653740dd0d2415100fe26e27afdf41"
>   
>   inherit pypi setuptools3 ptest
>   
>
> 

--------------58E9194DD9EC9FA528167C3F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/20/20 10:15 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200520141502.28254-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.4.4.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20200520141502.28254-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-appdirs_1.4.3.bb =&gt; python3-appdirs_1.4.4.bb}    | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-appdirs_1.4.3.bb =&gt; python3-appdirs_1.4.4.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-appdirs_1.4.3.bb b/meta-python/recipes-devtools/python/python3-appdirs_1.4.4.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-appdirs_1.4.3.bb
rename to meta-python/recipes-devtools/python/python3-appdirs_1.4.4.bb
index 2e183d888..eef5c0273 100644
--- a/meta-python/recipes-devtools/python/python3-appdirs_1.4.3.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-appdirs_1.4.4.bb
@@ -6,8 &#43;6,8 @@ SRC_URI &#43;= &quot; \
 	<a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \
 &quot;
 
-SRC_URI[md5sum] = &quot;44c679904082a2133f5566c8a0d3ab42&quot;
-SRC_URI[sha256sum] = &quot;9e5896d1372858f8dd3344faf4e5014d21849c756c8d5701f78f8a103b372d92&quot;
&#43;SRC_URI[md5sum] = &quot;d6bca12613174185dd9abc8a29f4f012&quot;
&#43;SRC_URI[sha256sum] = &quot;7d5d0167b2b1ba821647616af46a749d1c653740dd0d2415100fe26e27afdf41&quot;
 
 inherit pypi setuptools3 ptest
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------58E9194DD9EC9FA528167C3F--

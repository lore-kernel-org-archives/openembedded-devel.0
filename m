Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.43])
 by mx.groups.io with SMTP id smtpd.web11.9994.1593184885544183375
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jun 2020 08:21:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=W4nC7gBq;
 spf=pass (domain: windriver.com, ip: 40.107.77.43, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oX9erHjl2WLQW7lFRqFnqFzbvdc2HrsP31ADuqoAblsmUBLurHWd4xVwzyzQxNA8eOUfQuiUDX/N5yz/7CeORfSIFd4K1TLy2i5sbxN00xjdNNV36WI0Iu/ZI8hwduUFuf3NoY3uFAF7pc+u2Od8Ch89Gcns4pmiXfvY3yroKHbwPK8zXuJf0pyjBTs7wYbcCn3E86O1F1FQYTc5cO2+pjjhcDRNBSWBLVQ6C7JqOJUhhNH0Vzp/FwCfhTQ15WBBzc7xRqcf2C6x8zSTVGdm12c45mJ2bpS/ofWYT7fvMVtuFq73gA3udEM/4jHS7bfNYwgL0kKyptwTjKyg8jvEhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yA7VZgWg3xRMoHs9oXgLydvESzHF+bFeuj/l9QuFj1w=;
 b=dEf8922fakqr/1i3k2qN83iOmLC8jIY+oQJ4IbooMBRAQ8MvoMFM0pmSnrraIL9o8DWh2Wf1HYD30IlFntmg7OPYkJieXMjOlGSuGflI1ge43ouNuflRn67wWDEGdK5X6ANGtwpz80q+ZjLMEMtY3M/lHRdkEMRdghxDqINONFN1GWNGYh7fG4yzB1jeFUV28hsX+GC6abPPCZbo0xWmqO49sKnV9VpTmPCNVnSF1+bhQG/YyOOjxVIZ6GHc3puLAhkLFJOc8czsRX5KZQ9ACOHBkyavnxyTs8i51OmZ3LndfgVUgjn8GfXxEJHZ2ZYAqqxwZAbUh0blgHbhI8+qSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yA7VZgWg3xRMoHs9oXgLydvESzHF+bFeuj/l9QuFj1w=;
 b=W4nC7gBqEoIV7f8FomhBSxM/rAPmOrfi3ub1JqkSrx3eINZ2/kAwsKPX4X1hRBPST3483jF/mbCy5K0hVDzBYpp3/RKnJPllfdURn5UDUaurU0ZNTufyq1qj3Ng6zuzFde79ITwsGiQkcDh4TedfzMB1eN6nE3QX3He6n5hFfOU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB3953.namprd11.prod.outlook.com (2603:10b6:405:7f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.24; Fri, 26 Jun
 2020 15:21:24 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3131.025; Fri, 26 Jun 2020
 15:21:24 +0000
Subject: Re: [oe] [meta-python][PATCH 03/10] python3-cmd2: Upgrade 0.9.23 -> 1.1.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200622103542.27830-1-leon.anavi@konsulko.com>
 <20200622103542.27830-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <662fb14b-9046-26ab-69d6-8556e534e008@windriver.com>
Date: Fri, 26 Jun 2020 11:21:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200622103542.27830-3-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0016.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::29) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTXPR0101CA0016.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21 via Frontend Transport; Fri, 26 Jun 2020 15:21:23 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88813e9f-520b-4712-0651-08d819e49667
X-MS-TrafficTypeDiagnostic: BN6PR11MB3953:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB3953422ADDAC9650050DBF939F930@BN6PR11MB3953.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-Forefront-PRVS: 0446F0FCE1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qN0B70TFj3ikpwx87y8Ecwii/akEjPdSC4GSlFQ43cGithof3ZxXo/P7aQi3xGUfGFyzfIznH6EmAk2bpkwRAs1GVs8Gr8/DlZ+kF2AXozJ8Ld1etEY1tGmzgnqx5aVCQsOZrbiw3Oi2Ng933d6iYdXd7ebLBa4qvTqOx0V+cIza+HCm0WadRFn8Pon/4uWgQ0cNj/toMqG/MTbMvHDCQYkVHufpqbkXu8aWk7asb1xghIpuQmMaoYMRZOyaJSJQTNTZfGQHzWEK4wE4wFaEvr3RRprfXbLe2eBa7KBvTfUgS9JnOQn8CiEMoNf1erFZBq3MGAdm3jvnxIpE2O+OE+S2aiI5du/r/BbxV15RDgjembqgROzNPiN8WI++PRUvmtWjb1Lha13dcQDDSk+aru8mPHVq+Yfm9dM6YC8gP2YUQZZ0NAg7LC/EvjZSwdrWEwWtNt3X5vlLsHcShslbTA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(396003)(136003)(346002)(376002)(366004)(316002)(166002)(16576012)(2906002)(956004)(83380400001)(31686004)(8676002)(31696002)(8936002)(478600001)(966005)(36756003)(52116002)(53546011)(26005)(44832011)(2616005)(186003)(6486002)(16526019)(33964004)(66556008)(66476007)(5660300002)(86362001)(66946007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	r1mU6+rjUDM/N1YfT1MutajmP+duJGjjDbJ0IMPKIFbg53/wFVW21pDKcoZprasKWVurR6YNEAGmpdXItgl9VhGyCl0L3r29itCfGpks7tVD6kSeWtiWE7ahwF8gk0uLWu+TtPOSznn9Y0mUdCv37+yONKbezhc6uS1oqC7EDeA1km68aMn7NnrpbJmEBpzHqINPh3fONLQqs6V4B9aDx7M4rfUX6fhRdbMNr9MHGH1duVfzN2RtxmsLF0K9LTbgsSptYFx2jSGN0LoA9jrC9RJi/xeNdQOe7nnTlMdJ475t6VlxaECb5gTnzWVMhtuSxRfYsHSD0yFgaAqPu374QhNbWfsqBRSDfddrlDHPEW04I0B5+WDO3OZB/wwcQlJkIAv1rDjJhv7sQIJSVH8lxIuCl7KJ4xcQePaB+oXMGRzYwuzITjAj5CtJ+pe23IzrY6W+w3XLNYgl4zoCaLc8HbR8uKA1hw0ug/gNEt9jMr7v1hDtuVdjOHeFcyb6edhO
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88813e9f-520b-4712-0651-08d819e49667
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB0003.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2020 15:21:24.2365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tZf9QgaFLJO63+Mn/4YLgJjEV9TPZglyqS/SgWyIamOTPIbh1mwepehXTTBOEHpbimVkWuKpLwyGBREYl2uYudxfBxrz5ZW9dfbUs2BVvoY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3953
Content-Type: multipart/alternative;
 boundary="------------3B3C73424D39D03C2C7E66E9"
Content-Language: en-US

--------------3B3C73424D39D03C2C7E66E9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/22/20 6:35 AM, Leon Anavi wrote:
> Upgrade to release 1.1.0:
>
> - Fixed issue where subcommand usage text could contain a
>    subcommand alias instead of the actual name
> - Fixed bug in ArgparseCompleter where fill_width could become
>    negative if token_width was large relative to the terminal
>    width.
> - Made ipy consistent
> - with_argument_list, with_argparser, and
>    with_argparser_and_unknown_args wrappers now pass kwargs through
>    to their wrapped command function.
> - Added table_creator module for creating richly formatted tables.
> - Added new exceptions to the public API
> - Added explicit handling of SystemExit. If a command raises this
>    exception, the command loop will be gracefully stopped.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-cmd2_0.9.23.bb => python3-cmd2_1.1.0.bb}  | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-cmd2_0.9.23.bb => python3-cmd2_1.1.0.bb} (75%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-cmd2_0.9.23.bb b/meta-python/recipes-devtools/python/python3-cmd2_1.1.0.bb
> similarity index 75%
> rename from meta-python/recipes-devtools/python/python3-cmd2_0.9.23.bb
> rename to meta-python/recipes-devtools/python/python3-cmd2_1.1.0.bb
> index 803ca4a40..bc74b5ab5 100644
> --- a/meta-python/recipes-devtools/python/python3-cmd2_0.9.23.bb
> +++ b/meta-python/recipes-devtools/python/python3-cmd2_1.1.0.bb
> @@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=9791cd24ca7d1807388ccd55cd066def"
>   
>   DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
>   
> -SRC_URI[md5sum] = "6db66a06210d5f1edb44693b887ed62b"
> -SRC_URI[sha256sum] = "8ad12ef3cc46d03073c545b6e80a3f84a5921f6653073a60e7d9a7ff3b352c9e"
> +SRC_URI[md5sum] = "2b4a3b15ac52d239664c40c2d661b0c7"
> +SRC_URI[sha256sum] = "d233b5ad4b9ee264a43fb14668f287d25f998f4b443a81b4efdfd292f1a77108"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------3B3C73424D39D03C2C7E66E9
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/22/20 6:35 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200622103542.27830-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.1.0:

- Fixed issue where subcommand usage text could contain a
  subcommand alias instead of the actual name
- Fixed bug in ArgparseCompleter where fill_width could become
  negative if token_width was large relative to the terminal
  width.
- Made ipy consistent
- with_argument_list, with_argparser, and
  with_argparser_and_unknown_args wrappers now pass kwargs through
  to their wrapped command function.
- Added table_creator module for creating richly formatted tables.
- Added new exceptions to the public API
- Added explicit handling of SystemExit. If a command raises this
  exception, the command loop will be gracefully stopped.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200622103542.27830-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-cmd2_0.9.23.bb =&gt; python3-cmd2_1.1.0.bb}  | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cmd2_0.9.23.bb =&gt; python3-cmd2_1.1.0.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_0.9.23.bb b/meta-python/recipes-devtools/python/python3-cmd2_1.1.0.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-cmd2_0.9.23.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_1.1.0.bb
index 803ca4a40..bc74b5ab5 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_0.9.23.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-cmd2_1.1.0.bb
@@ -5,8 &#43;5,8 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=9791cd24ca7d1807388ccd55cd066def">&quot;file://LICENSE;md5=9791cd24ca7d1807388ccd55cd066def&quot;</a>
 
 DEPENDS &#43;= &quot;${PYTHON_PN}-setuptools-scm-native&quot;
 
-SRC_URI[md5sum] = &quot;6db66a06210d5f1edb44693b887ed62b&quot;
-SRC_URI[sha256sum] = &quot;8ad12ef3cc46d03073c545b6e80a3f84a5921f6653073a60e7d9a7ff3b352c9e&quot;
&#43;SRC_URI[md5sum] = &quot;2b4a3b15ac52d239664c40c2d661b0c7&quot;
&#43;SRC_URI[sha256sum] = &quot;d233b5ad4b9ee264a43fb14668f287d25f998f4b443a81b4efdfd292f1a77108&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------3B3C73424D39D03C2C7E66E9--

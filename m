Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.58])
 by mx.groups.io with SMTP id smtpd.web10.20568.1593442376533032012
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jun 2020 07:52:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Qf9ZD3BW;
 spf=pass (domain: windriver.com, ip: 40.107.92.58, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ay9UFbBj35O3Yg0nPLp1QxhzHuILhgtyX0sRD5skguD4B5CMpOSeICbDYAAsvz1PCdoSBx8YKnY/5pCU52pPAZLf8L9hre85ho7VMiEfIAUshWf/ZBlWOv4Fcv94AHIeRexiW0I7AuXPwOBNL0sB8wKntlnkDrNUx1XD2WQrxR4O+f8qLiqt3YW5Fo0j5BBxY/8IQiUiWQrNXV4uLpNmTMmA5NlgY44Fa5fIs61MpHskgly99YX3s5dqAC+Uy4fpv26r7JVPd7RDwg2hv7BRu5leP2o9kfR547pQyT8eRAgwfuN85J75fB5yoKR54E7yoiWXU5rxrIiloFSerbLo7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HuNUUQ8qSvxRD3+U3JKf3LCQGCGf94ZP1qAebJCbviw=;
 b=KrLoiZqrTk5W7v313KuZ81CiiCe01FSOIU24Ibgs1QzNAChex9en0yU1fRUdYLGm0SoFxexkF9uiKCT4vPYnwuEUbAOb1INSz9AaVSkknjwLMgx5xpkXDYEW2WWmdgD00zgOYkdgFkQlK4fejc4SbtlUZLlHUiUXUFc24Jeq+Ux4Cblwwmb87jbxWY7URPBB2vvCovWp1LnKX4isP1jlOAvf6r7N4TawAw5nzGT7MMq7FfUYOMgGohjgP9HMCG9ao6RCEqvFaLl9YtVwhulfXRAJdTzb01Nwrm1L/Wd8s5dihq5hT72JUdIZHdnNwPYxwYN89JZh3xO1v1nHWyxRWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HuNUUQ8qSvxRD3+U3JKf3LCQGCGf94ZP1qAebJCbviw=;
 b=Qf9ZD3BWnO1YCi1JcJP8f6PgtvPBHRRM+AMTjoIa7o6MFMt3LatWu6rg9bs5xgldYu53bxtb7M+SohOOCSXpl9KAXIy2unG8vNuv9+7L3VrOJNFmkFXyQfwodEiGYg8HIelIHG90zndxYrr7LAVlR+C3Rp4iJpUX1YST7tD33g0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1988.namprd11.prod.outlook.com (2603:10b6:404:48::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.25; Mon, 29 Jun
 2020 14:52:55 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3131.026; Mon, 29 Jun 2020
 14:52:55 +0000
Subject: Re: [oe] [meta-python][PATCH 11/12] python3-pybind11: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200626112944.25569-1-leon.anavi@konsulko.com>
 <20200626112944.25569-11-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <ded245a2-d467-ccab-b38c-fa171ce5a5bb@windriver.com>
Date: Mon, 29 Jun 2020 10:52:52 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200626112944.25569-11-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0118.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::27) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0118.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20 via Frontend Transport; Mon, 29 Jun 2020 14:52:54 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 98202cfb-f159-465a-2a92-08d81c3c1b03
X-MS-TrafficTypeDiagnostic: BN6PR11MB1988:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB1988F5E9F816111792DD72CE9F6E0@BN6PR11MB1988.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:138;
X-Forefront-PRVS: 044968D9E1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	94b46tolunk836JsXvbqPhCYHgJID7ZOSR9y6iuDu/Aiccz9lKuG/ufnH7FHls2QNFlIDspesCij6/1N0y3QcTxL4OAOCxcdGErqcOqnJfb4HzhpCjf6Sksla+rXBbrg3cQ+pU4xdf2aL56IKs5QliAC7MRqHDhjibBbtd1NKi+BASbdfRlBiGaMi73GBtXcMX8zK36Ry4Gz9dfnyAT2yS3qaHJVH4IQxW9C65z/4L5zMf7kBkpr/Q3tNqUJXA8ywBJycYTEBDFrM4woOrAWoWeQEJFbrzuKU0hAAM/CVlk+AQXnHcy9Hj0byEWLzlmRVu8XvX3pPSC96KNhmsu9sp0r9L2/kk/x8m1T6u7JR36EP0tIt2MmA8lHFg5HNZA1vLWsc5sBgCh41e8ATl/XXIZ7k7MzWsKFLOCjyzc3YrdlGBKtFgSrMR8SngC1UWZBuieEpniq9OrpfUwyZsEXzQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(396003)(366004)(136003)(346002)(376002)(36756003)(16526019)(966005)(5660300002)(478600001)(2906002)(83380400001)(8936002)(8676002)(86362001)(31686004)(316002)(16576012)(166002)(6486002)(26005)(52116002)(186003)(33964004)(53546011)(66556008)(66946007)(66476007)(956004)(31696002)(2616005)(44832011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	+Va3G5U6o8bYcETIVKVamAKTZtwGMRoczV3trCaFTtX67kBQuEhvCQ5hlHGrci5wAk4SLQebHaH8XT+HvFyqT3o2iWjhLPto0Y3YVLASHgwuVH4kYa0qA8mSmh1yv4J6lfHG1OkyvXANQTRl6GQ8DLxrgjsXTCN2hQAuSUGR3AcECFKZTOYEi1cWvl7GXWmkkPnITk1T0Em0q/qODWRuNVhtG49fTNCTT0o3oEoy0tqgw4z49MMsWYhiwFETcHqk5OlLjZOxBVh70aXbAEVxEDTLfQe58EOcdswWEsIvchQDLuz4osaGvgHT6StDXscUar9l5eyeTU47ueH3J26HNI+zAmd+5GnMPkBVfl/ztgkQPWpK08PhgBE4dj0mvwtH48ONTNYfsv6E4iMUaAN1n2PAX2fK9yjj/VMgrTW9SKmVaC0Es69wvJIe4QXxBaw+/7tMB6LM/snGexN5xRBL0nODBfXiuQh3CDGWrfSNAVHv4rhJnyiPaPnYvu5kAc/I
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98202cfb-f159-465a-2a92-08d81c3c1b03
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB0003.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2020 14:52:55.2211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Q/GFC9EZi0NMfTzaMXTW/0btAetztm7RcZ/80vl/uZdzl5fMW5zwkvpHDDsW9vUI3MpuZ2BdgfV2lAMi8SEqcM1XWruvqAxFcWaIeXr6MI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1988
Content-Type: multipart/alternative;
 boundary="------------62F41E8B3BDFF5A73D2C6392"
Content-Language: en-US

--------------62F41E8B3BDFF5A73D2C6392
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/26/20 7:29 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   meta-python/recipes-devtools/python/python-pybind11.inc  | 7 -------
>   .../recipes-devtools/python/python3-pybind11_2.4.3.bb    | 9 ++++++++-
>   2 files changed, 8 insertions(+), 8 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-pybind11.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-pybind11.inc b/meta-python/recipes-devtools/python/python-pybind11.inc
> deleted file mode 100644
> index d1d53e125..000000000
> --- a/meta-python/recipes-devtools/python/python-pybind11.inc
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -SUMMARY = "Seamless operability between C++11 and Python"
> -HOMEPAGE = "https://github.com/wjakob/pybind11"
> -LICENSE = "BSD-2-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=beb87117af69fd10fbf9fb14c22a2e62"
> -
> -SRC_URI[md5sum] = "23fdca8191b16ce3e7f38fb9e4252b2d"
> -SRC_URI[sha256sum] = "72e6def53fb491f7f4e92692029d2e7bb5a0783314f20d80222735ff10a75758"
> diff --git a/meta-python/recipes-devtools/python/python3-pybind11_2.4.3.bb b/meta-python/recipes-devtools/python/python3-pybind11_2.4.3.bb
> index 355e28460..9efa2db75 100644
> --- a/meta-python/recipes-devtools/python/python3-pybind11_2.4.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-pybind11_2.4.3.bb
> @@ -1,2 +1,9 @@
> +SUMMARY = "Seamless operability between C++11 and Python"
> +HOMEPAGE = "https://github.com/wjakob/pybind11"
> +LICENSE = "BSD-2-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=beb87117af69fd10fbf9fb14c22a2e62"
> +
> +SRC_URI[md5sum] = "23fdca8191b16ce3e7f38fb9e4252b2d"
> +SRC_URI[sha256sum] = "72e6def53fb491f7f4e92692029d2e7bb5a0783314f20d80222735ff10a75758"
> +
>   inherit pypi setuptools3
> -require python-pybind11.inc
>
> 

--------------62F41E8B3BDFF5A73D2C6392
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/26/20 7:29 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200626112944.25569-11-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200626112944.25569-11-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 meta-python/recipes-devtools/python/python-pybind11.inc  | 7 -------
 .../recipes-devtools/python/python3-pybind11_2.4.3.bb    | 9 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-
 2 files changed, 8 insertions(&#43;), 8 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pybind11.inc

diff --git a/meta-python/recipes-devtools/python/python-pybind11.inc b/meta-python/recipes-devtools/python/python-pybind11.inc
deleted file mode 100644
index d1d53e125..000000000
--- a/meta-python/recipes-devtools/python/python-pybind11.inc
&#43;&#43;&#43; /dev/null
@@ -1,7 &#43;0,0 @@
-SUMMARY = &quot;Seamless operability between C&#43;&#43;11 and Python&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/wjakob/pybind11">&quot;https://github.com/wjakob/pybind11&quot;</a>
-LICENSE = &quot;BSD-2-Clause&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=beb87117af69fd10fbf9fb14c22a2e62">&quot;file://LICENSE;md5=beb87117af69fd10fbf9fb14c22a2e62&quot;</a>
-
-SRC_URI[md5sum] = &quot;23fdca8191b16ce3e7f38fb9e4252b2d&quot;
-SRC_URI[sha256sum] = &quot;72e6def53fb491f7f4e92692029d2e7bb5a0783314f20d80222735ff10a75758&quot;
diff --git a/meta-python/recipes-devtools/python/python3-pybind11_2.4.3.bb b/meta-python/recipes-devtools/python/python3-pybind11_2.4.3.bb
index 355e28460..9efa2db75 100644
--- a/meta-python/recipes-devtools/python/python3-pybind11_2.4.3.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-pybind11_2.4.3.bb
@@ -1,2 &#43;1,9 @@
&#43;SUMMARY = &quot;Seamless operability between C&#43;&#43;11 and Python&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/wjakob/pybind11">&quot;https://github.com/wjakob/pybind11&quot;</a>
&#43;LICENSE = &quot;BSD-2-Clause&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=beb87117af69fd10fbf9fb14c22a2e62">&quot;file://LICENSE;md5=beb87117af69fd10fbf9fb14c22a2e62&quot;</a>
&#43;
&#43;SRC_URI[md5sum] = &quot;23fdca8191b16ce3e7f38fb9e4252b2d&quot;
&#43;SRC_URI[sha256sum] = &quot;72e6def53fb491f7f4e92692029d2e7bb5a0783314f20d80222735ff10a75758&quot;
&#43;
 inherit pypi setuptools3
-require python-pybind11.inc
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------62F41E8B3BDFF5A73D2C6392--

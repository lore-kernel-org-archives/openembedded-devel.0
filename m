Received: from NAM04-BN3-obe.outbound.protection.outlook.com (NAM04-BN3-obe.outbound.protection.outlook.com [40.107.68.89])
 by mx.groups.io with SMTP id smtpd.web12.10971.1593785164407511410
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jul 2020 07:06:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Vdu+40jn;
 spf=pass (domain: windriver.com, ip: 40.107.68.89, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hwOovf/ca13M/snki9brXsJiKRo4xD8t13/32yPOxzwqBQwFm2VThl5koFpdFMM15LlBEfA65+wPCSRzBvn8MrH10JFjz9WNe7CxbUtpa7gfBIZWRX4r283BnFvX/Nm/ggVBFIwwBguUeu4AgSwV+L82ouh+3XRmIXLPHrKVWY2FvrhDcobD3xWa3mUgx9DrfQ0275XVGpSyOrj3nNzk4Cnz+XfxKWQX8oSP4h0D9eEVj4bBHsm5StqJcbd3HLWqPDKre0x7GDfkVYHXb4feoCXrApfqLlOMVFNeXj4D4RbEsfKQvQwQ8aG7Xcvb6+mTGnMA/0f8QbJABB0REcAGFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F3M7isXBK0VGneCUf5D6+lxkeRWxEbHlDcIFS5JzsJw=;
 b=Z23qdP3kv9cq/FFuVZ4bu9tl+KZ55x1E2TzkJI+GU84m/ym+z/DVu1X+ET387TDUs9qA8O6kOv7X2se+7fhTX3poFgSoqRd+YuosESMZC1+wi6WPb7NcqS2+VDR+Fv+LZdWzZW0y0tf503IMYjK1DbN6tGufp2ZFKg/DqkBxcFUi03UrJlpfBV5vBPTje7kN5C4cZ8cymmgOOX95rXUErn6mBxIaGNOpneMszx/IYQQYOPVtGveFyziq8cu3/oa7wXr8cUAK9duu9hEwVpwmaCB1wH+ouoBOFzlqUbpHvPjZsdudh6p0crEeGZ2wJkCbJQWhyRWMW+Rh6uybKLvFDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F3M7isXBK0VGneCUf5D6+lxkeRWxEbHlDcIFS5JzsJw=;
 b=Vdu+40jnNUWv+a4E6FmoW81RSl+nRu9ekZvKUJrACFerjisGdmcVDppVotR7bY+oRpk6YK1Huzizy9lkgpuqB0xqDsTY1f8zTRkz3LvL9yAAECEvQ5R1nz8JZjmHle5PHNxz5TPsrZrJicKtQcNvwd3OqovMmWe053xSZ+9bTYI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM6PR11MB4300.namprd11.prod.outlook.com (2603:10b6:5:1dc::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.22; Fri, 3 Jul 2020 14:06:03 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3131.036; Fri, 3 Jul 2020
 14:06:03 +0000
Subject: Re: [oe] [meta-python][PATCH 4/7] python3-keras-preprocessing: Upgrade 1.1.0 -> 1.1.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200630171119.25540-1-leon.anavi@konsulko.com>
 <20200630171119.25540-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <0971b115-b741-e69e-44fe-527478aa2c5f@windriver.com>
Date: Fri, 3 Jul 2020 10:06:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200630171119.25540-4-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0155.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::34) To DM5PR11MB0011.namprd11.prod.outlook.com
 (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0155.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.21 via Frontend Transport; Fri, 3 Jul 2020 14:06:02 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 195a785c-cbf0-463e-30db-08d81f5a3883
X-MS-TrafficTypeDiagnostic: DM6PR11MB4300:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB4300C07F56BE9B7995234EAF9F6A0@DM6PR11MB4300.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-Forefront-PRVS: 045315E1EE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nks2Fkb+9lhgD8GxcsGg14mC34/qJBJbQlGpis3tEcNBJmsnn9c28UhV7k4zM7Z9ZD7WUEyu7VjLQKbtxtflZZQff9GYadLMm5KaMWBYrSliy11H2witZinhaCz7Gf9cf/hViVFWd0OD2TESHPiKGAySZRjDDG+WMYxqrI0CZHkGDcS3cn8XLmZCRivBlKVT9Ep2F68RQcmtmUDWGKKLx4XDTU4OoImi2Trd6QsleVRSN76sgXMdtFHLDbrMhZJlLeT94RYOge+Plzdy2ImraDWZv+Y3Gop0NIDWriD02HdHS490vnI6p+rsd7zLLiLl7n+rpYmG7dZBjzLM0l/NWz7hzqM24gfq+2WGRkIhf1y8k5Cd4qB99F1DAdNGt/EPYoxoD3TEt3rs/5OifepVnUHoim72sLuE72twZ4PO3OzaCr5PCBAdjTeQy8gEf7jPDnsJuHOJjN/JMWSKjEP+pA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(366004)(396003)(376002)(136003)(39850400004)(31696002)(66476007)(66556008)(66946007)(16576012)(6486002)(2616005)(478600001)(166002)(86362001)(966005)(16526019)(956004)(5660300002)(44832011)(8676002)(2906002)(186003)(26005)(31686004)(316002)(8936002)(53546011)(52116002)(36756003)(33964004)(83380400001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	dYy2dCA75LvaEEddF0wBc+wt9yPgH3qYFpQJCcSmoWlaShjj+iqZidOUo3Gg+znCuh4+zCu93GGGv264ZHHbfkzzxgwOo0SSSUEvtGILVeRJborz0CHRwLpG6ucOp3Hy9GLTWrK/6nk4AoGXsF+sjYUCvNrS6QxXkGRpSr8vcZ9aUXmyKAqySEZ081/t9vyjZA1zWa4B0xkdinOZiESYYt+Sucwv1B7rutIimigwgeiyK6xatnI6FuSapBOPzdk2H2RMzLnPB65zc/IppdiBd+R8UhNgpcdxAoNpsZwHWkfF9fAdZJGqfSu2DgFWZS4+Gl0E51EHktdasgEpgVgYUKzknMSyyG2amB5/jwaf50aHDJYR3pdnSSNXjSGfp6s2jUANJAV4X/LTdTmxrxLj8YCC7oPgGofs/4Pszb4U1A/8r+zgE28nmuP/Hg8BoihCnzzN4J9g3dZU8J/K2hhU0CPeh0NthE4y/3HG11hpJbHK4Agz/0GO8PJpqRfBvV1/
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 195a785c-cbf0-463e-30db-08d81f5a3883
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2020 14:06:03.0813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wTbseL+vrhHdw7IqMWIsdsOBHd+YJVk9uTThfMSa4jkx5W7HaylB6u9JybDuLIh2mk1r5JkmlK9Gyvit5vy+EhN+5kbgrVmFGYfteZWKJPY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4300
Content-Type: multipart/alternative;
 boundary="------------C14275692F2379BDF6AA67CE"
Content-Language: en-US

--------------C14275692F2379BDF6AA67CE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/30/20 1:11 PM, Leon Anavi wrote:
> Switch to pypi. Upgrade to release 1.1.2:
>
> - Allow zoom_range to be int or int tuple
> - Make sure image iterator classes subclass the tf.keras
>    Sequence class if it is available
> - Minor optimization and dtype check
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-keras-preprocessing_1.1.0.bb  | 15 ---------------
>   .../python/python3-keras-preprocessing_1.1.2.bb  | 16 ++++++++++++++++
>   2 files changed, 16 insertions(+), 15 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python3-keras-preprocessing_1.1.0.bb
>   create mode 100644 meta-python/recipes-devtools/python/python3-keras-preprocessing_1.1.2.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-keras-preprocessing_1.1.0.bb b/meta-python/recipes-devtools/python/python3-keras-preprocessing_1.1.0.bb
> deleted file mode 100644
> index eacb3402d..000000000
> --- a/meta-python/recipes-devtools/python/python3-keras-preprocessing_1.1.0.bb
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -SUMMARY = "Easy data preprocessing and data augmentation for deep learning models"
> -HOMEPAGE = "https://github.com/keras-team/keras-preprocessing"
> -SECTION = "devel/python"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=1744b320500cc2e3112964d00cce7aa4"
> -
> -SRC_URI = "git://github.com/keras-team/keras-preprocessing.git"
> -SRCREV ?= "ff90696c0416b74344b91df097b228e694339b88"
> -
> -inherit setuptools3
> -
> -S = "${WORKDIR}/git"
> -
> -BBCLASSEXTEND = "native"
> -
> diff --git a/meta-python/recipes-devtools/python/python3-keras-preprocessing_1.1.2.bb b/meta-python/recipes-devtools/python/python3-keras-preprocessing_1.1.2.bb
> new file mode 100644
> index 000000000..749b6c8c9
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-keras-preprocessing_1.1.2.bb
> @@ -0,0 +1,16 @@
> +SUMMARY = "Easy data preprocessing and data augmentation for deep learning models"
> +HOMEPAGE = "https://github.com/keras-team/keras-preprocessing"
> +SECTION = "devel/python"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=1744b320500cc2e3112964d00cce7aa4"
> +
> +inherit pypi setuptools3
> +
> +SRC_URI[md5sum] = "d2a0e10437cfa5c2d09458a84fb58d05"
> +SRC_URI[sha256sum] = "add82567c50c8bc648c14195bf544a5ce7c1f76761536956c3d2978970179ef3"
> +
> +PYPI_PACKAGE = "Keras_Preprocessing"
> +PYPI_SRC_URI = "https://files.pythonhosted.org/packages/5e/f1/b44337faca48874333769a29398fe4666686733c8880aa160b9fd5dfe600/Keras_Preprocessing-${PV}.tar.gz"
> +
> +BBCLASSEXTEND = "native"
> +
>
> 

--------------C14275692F2379BDF6AA67CE
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/30/20 1:11 PM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200630171119.25540-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Switch to pypi. Upgrade to release 1.1.2:

- Allow zoom_range to be int or int tuple
- Make sure image iterator classes subclass the tf.keras
  Sequence class if it is available
- Minor optimization and dtype check

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200630171119.25540-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-keras-preprocessing_1.1.0.bb  | 15 ---------------
 .../python/python3-keras-preprocessing_1.1.2.bb  | 16 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;
 2 files changed, 16 insertions(&#43;), 15 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-keras-preprocessing_1.1.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-keras-preprocessing_1.1.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-keras-preprocessing_1.1.0.bb b/meta-python/recipes-devtools/python/python3-keras-preprocessing_1.1.0.bb
deleted file mode 100644
index eacb3402d..000000000
--- a/meta-python/recipes-devtools/python/python3-keras-preprocessing_1.1.0.bb
&#43;&#43;&#43; /dev/null
@@ -1,15 &#43;0,0 @@
-SUMMARY = &quot;Easy data preprocessing and data augmentation for deep learning models&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/keras-team/keras-preprocessing">&quot;https://github.com/keras-team/keras-preprocessing&quot;</a>
-SECTION = &quot;devel/python&quot;
-LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=1744b320500cc2e3112964d00cce7aa4">&quot;file://LICENSE;md5=1744b320500cc2e3112964d00cce7aa4&quot;</a>
-
-SRC_URI = &quot;git://github.com/keras-team/keras-preprocessing.git&quot;
-SRCREV ?= &quot;ff90696c0416b74344b91df097b228e694339b88&quot;
-
-inherit setuptools3
-
-S = &quot;${WORKDIR}/git&quot;
-
-BBCLASSEXTEND = &quot;native&quot;
-
diff --git a/meta-python/recipes-devtools/python/python3-keras-preprocessing_1.1.2.bb b/meta-python/recipes-devtools/python/python3-keras-preprocessing_1.1.2.bb
new file mode 100644
index 000000000..749b6c8c9
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-keras-preprocessing_1.1.2.bb
@@ -0,0 &#43;1,16 @@
&#43;SUMMARY = &quot;Easy data preprocessing and data augmentation for deep learning models&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/keras-team/keras-preprocessing">&quot;https://github.com/keras-team/keras-preprocessing&quot;</a>
&#43;SECTION = &quot;devel/python&quot;
&#43;LICENSE = &quot;MIT&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=1744b320500cc2e3112964d00cce7aa4">&quot;file://LICENSE;md5=1744b320500cc2e3112964d00cce7aa4&quot;</a>
&#43;
&#43;inherit pypi setuptools3
&#43;
&#43;SRC_URI[md5sum] = &quot;d2a0e10437cfa5c2d09458a84fb58d05&quot;
&#43;SRC_URI[sha256sum] = &quot;add82567c50c8bc648c14195bf544a5ce7c1f76761536956c3d2978970179ef3&quot;
&#43;
&#43;PYPI_PACKAGE = &quot;Keras_Preprocessing&quot;
&#43;PYPI_SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://files.pythonhosted.org/packages/5e/f1/b44337faca48874333769a29398fe4666686733c8880aa160b9fd5dfe600/Keras_Preprocessing-${PV}.tar.gz">&quot;https://files.pythonhosted.org/packages/5e/f1/b44337faca48874333769a29398fe4666686733c8880aa160b9fd5dfe600/Keras_Preprocessing-${PV}.tar.gz&quot;</a>
&#43;
&#43;BBCLASSEXTEND = &quot;native&quot;
&#43;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------C14275692F2379BDF6AA67CE--

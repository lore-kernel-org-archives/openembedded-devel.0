Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.43])
 by mx.groups.io with SMTP id smtpd.web12.7088.1592399301838562967
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jun 2020 06:08:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=hBOV74LW;
 spf=pass (domain: windriver.com, ip: 40.107.220.43, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JOo+vUi24cRzHa4MZIFvCg4StgZzfL60oXKxd/WWjCP3lWCvXdVbNp/apLO1xfNCzn9iK1rhs9bjwqiUEXbu+y17dYqR0SaLpuci2gy4Qt+YUsIpMg347BLrwpOGaze0cP0wQHO0909FVG8vJ8xHlHClX9gtqeQopRpviVold4FWqY5IH4VDtk46UOPgMRqCpbFkCpXn49nrK4lJey5VbUiWfmqzSu+O4zzQ0D2Cop4l64fnMVA1L3sYZ0N+aOosDuIzxvqHsmdGvKgrOIX0xgCGHr2vDiICv6yjYfL+kZwoBkT2lDk3NBeBBkIOSXOdmMVjWhXu8f45eu3U2aCrtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w02MEhMliCPLDwbqeTOB7SgQtBvd5d/GUwuvJmBiMv8=;
 b=kp16+fNXtrq+grO+7oH1Uaq9cfwRxx8mPj4/xS4htBl/itXD6VGkl7rY2I0rU68W5EzXge0t/lUJrhky9gDad93njy8KrEB877W7cxKXZ9rgOL+cz3IBSS5FjZCSUT5xGqvfc+sJ0MbLgnmDpCqhwjUxpaVtctbTKQrtT3v93/Lfto7ASpISgrZ74+09jKe/cl85jRXpissUaI+doLoZwLBgaqOeesHjJy6Nxv0wuYHJoa6tGtqsCuozcJ4vbQd2QnLHD35F7o0fA5Lp8VkCGlm5U9poRP0jgGiFFdQRf302B+BBqhHhSvn53WCiIm0Aqr5CV0egsPXMf/KOie6jtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w02MEhMliCPLDwbqeTOB7SgQtBvd5d/GUwuvJmBiMv8=;
 b=hBOV74LWb2rY0lmMQ3tVIEpRdPZI9lJ2AD4ch5jx5u6uLymlrRmDPHFqr625PuUYVV4orXkSr5SsLws+8a8YZmC6PuSRl23zmQQkyyENjQB4lYArcxOmFswzXgr035duQBnehS3XuOCJrN7l4k6YhK05ibS6w/BVbA7pSLndaJs=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN8PR11MB3588.namprd11.prod.outlook.com (2603:10b6:408:83::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.26; Wed, 17 Jun
 2020 13:08:20 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.021; Wed, 17 Jun 2020
 13:08:20 +0000
Subject: Re: [oe] [meta-python][PATCH 5/7] python3-importlib-metadata: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200615103017.2714-1-leon.anavi@konsulko.com>
 <20200615103017.2714-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <99991c9b-6d61-d754-8ec1-6bf4a19896d6@windriver.com>
Date: Wed, 17 Jun 2020 09:08:18 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200615103017.2714-5-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTOPR0101CA0026.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::39) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTOPR0101CA0026.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::39) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend Transport; Wed, 17 Jun 2020 13:08:20 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b62ec5d-aa32-4908-b162-08d812bf8206
X-MS-TrafficTypeDiagnostic: BN8PR11MB3588:
X-Microsoft-Antispam-PRVS: 
	<BN8PR11MB35884907447EF76E715E686F9F9A0@BN8PR11MB3588.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:159;
X-Forefront-PRVS: 04371797A5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FNzXpdIZ0M4AX84SKY+VuL1dFUl2PPYg6WkdIxMvPKd1o0BKu2YiEJkB9I5XIhVl/q04xk+HPab4M193fbHac/kk06Nguom3U0MtOa47EzUjEVbXuLnjs4OaCEidTxns/fVWog5fRr9n804PjsODbj44v0bFsydi8OG/2KYQTPBGoZ686u6NhLY7//6P/FVd7Fk5PStzgfc85tirI9fbMxMBntbA+QqtKxHi9r9tUfEWBC92/TE8BcEd0oAYgh+V82ncA/eklk3dDEEJidcSbYmr+ApWmc0THoUKOobRCVzjKtv0ConJzGOmuo6hiOejFfEWhr9y5iiJZTQ2aNjzj3nw9/awSHM2HZDb4sYsJCWw9i8vFyvjOkeTSX5JbLdZvoQ17iby8kRhG5iZTgJFUmDbeEzeQ895LuY6Z12JwQqgO+BykXvttr0DF3plRlJES7lxs+BSQqMvOLdYdqLlwQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(376002)(366004)(346002)(39840400004)(136003)(66556008)(26005)(53546011)(6486002)(166002)(31686004)(8676002)(2906002)(966005)(66946007)(316002)(8936002)(16576012)(66476007)(44832011)(186003)(86362001)(33964004)(52116002)(478600001)(16526019)(36756003)(5660300002)(83380400001)(31696002)(2616005)(956004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	f8NNO1kEiIbZ8kN0crrxyUz3GWLU5Igs/V6LforlS8Rlt8hrIwEqhHuH7mWBBbwUJs8ql1/l8IgbBUI3FO6xmUgHrHgSDrYCyZ5qm1h4lfAYA47T8Ol+K2UfvLdO3dkEHyMf/J8WjWv4rR1qYfvUYEMQ0kW31vTUvCWIbbzwT7oyzg9Cp8ZVGZ0YGEwomdi/QYOrXlKmhdDKHvFwqoNTliforYJQUIFbRMVMAi2SR3G4Gh9Kx/P96MQQ8sJ78je/fRlNUoruwrSaRfwjTn+wiThctb0u8p+0IA09Tbu1+qGdLq7kiA9QiFBFyMa4ueZ4F4MAFpKQ8guQU6hjVxOXBAvs3CDSM7neCGlx+X6dyY5e6UluojJx2B8nWQpuKJplT5rn8D6+YeEyPBe15P6hl7OSvkmMbVtwvfIJzN7cGLV8pZ6NBHF/eHg6aa8+iXIsvXm42RHvV5WHASmLg3TxD/vvOii3YAkQ8IAkIjNMsTM=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b62ec5d-aa32-4908-b162-08d812bf8206
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2020 13:08:20.4850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ScpBflJELX65HpveKS4Y/3293MF00oUH6vgrEBBhnKELx/ekToh44AKYpOJDB1Kng3rux5/7B5tXdv/QS8tA0Pf5rS22pHU5fy5vml2GlUE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3588
Content-Type: multipart/alternative;
 boundary="------------92DE398E9006F9F1B98196E8"
Content-Language: en-US

--------------92DE398E9006F9F1B98196E8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/15/20 6:30 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python-importlib-metadata.inc          | 14 --------------
>   .../python/python3-importlib-metadata_1.5.2.bb    | 15 ++++++++++++++-
>   2 files changed, 14 insertions(+), 15 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-importlib-metadata.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-importlib-metadata.inc b/meta-python/recipes-devtools/python/python-importlib-metadata.inc
> deleted file mode 100644
> index b6165dc5b..000000000
> --- a/meta-python/recipes-devtools/python/python-importlib-metadata.inc
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -DESCRIPTION = "Read metadata from Python packages"
> -HOMEPAGE = "https://pypi.org/project/importlib-metadata/"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=e88ae122f3925d8bde8319060f2ddb8e"
> -
> -SRC_URI = "https://files.pythonhosted.org/packages/d7/cd/3b1dffa46b19dac269d586b9d45090588a8bd7a5741602a369d45e1bdf65/importlib_metadata-1.5.2.tar.gz"
> -S = "${WORKDIR}/importlib_metadata-${PV}"
> -SRC_URI[md5sum] = "35a85a81c7d86605f4f49397f4e7e39c"
> -SRC_URI[sha256sum] = "dfc83688553a91a786c6c91eeb5f3b1d31f24d71877bbd94ecbf5484e57690a2"
> -
> -DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
> -RDEPENDS_${PN} += "${PYTHON_PN}-zipp ${PYTHON_PN}-pathlib2"
> -
> -BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python3-importlib-metadata_1.5.2.bb b/meta-python/recipes-devtools/python/python3-importlib-metadata_1.5.2.bb
> index 8a971dac0..5170855c2 100644
> --- a/meta-python/recipes-devtools/python/python3-importlib-metadata_1.5.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-importlib-metadata_1.5.2.bb
> @@ -1,5 +1,18 @@
> +DESCRIPTION = "Read metadata from Python packages"
> +HOMEPAGE = "https://pypi.org/project/importlib-metadata/"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=e88ae122f3925d8bde8319060f2ddb8e"
> +
>   inherit pypi setuptools3
> -require python-importlib-metadata.inc
>   
> +SRC_URI = "https://files.pythonhosted.org/packages/d7/cd/3b1dffa46b19dac269d586b9d45090588a8bd7a5741602a369d45e1bdf65/importlib_metadata-1.5.2.tar.gz"
> +S = "${WORKDIR}/importlib_metadata-${PV}"
> +SRC_URI[md5sum] = "35a85a81c7d86605f4f49397f4e7e39c"
> +SRC_URI[sha256sum] = "dfc83688553a91a786c6c91eeb5f3b1d31f24d71877bbd94ecbf5484e57690a2"
> +
> +DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
> +RDEPENDS_${PN} += "${PYTHON_PN}-zipp ${PYTHON_PN}-pathlib2"
>   RDEPENDS_${PN}_append_class-target = " python3-misc"
>   RDEPENDS_${PN}_append_class-nativesdk = " python3-misc"
> +
> +BBCLASSEXTEND = "native nativesdk"
>
> 

--------------92DE398E9006F9F1B98196E8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/15/20 6:30 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200615103017.2714-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200615103017.2714-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python-importlib-metadata.inc          | 14 --------------
 .../python/python3-importlib-metadata_1.5.2.bb    | 15 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-
 2 files changed, 14 insertions(&#43;), 15 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-importlib-metadata.inc

diff --git a/meta-python/recipes-devtools/python/python-importlib-metadata.inc b/meta-python/recipes-devtools/python/python-importlib-metadata.inc
deleted file mode 100644
index b6165dc5b..000000000
--- a/meta-python/recipes-devtools/python/python-importlib-metadata.inc
&#43;&#43;&#43; /dev/null
@@ -1,14 &#43;0,0 @@
-DESCRIPTION = &quot;Read metadata from Python packages&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://pypi.org/project/importlib-metadata/">&quot;https://pypi.org/project/importlib-metadata/&quot;</a>
-LICENSE = &quot;Apache-2.0&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=e88ae122f3925d8bde8319060f2ddb8e">&quot;file://LICENSE;md5=e88ae122f3925d8bde8319060f2ddb8e&quot;</a>
-
-SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://files.pythonhosted.org/packages/d7/cd/3b1dffa46b19dac269d586b9d45090588a8bd7a5741602a369d45e1bdf65/importlib_metadata-1.5.2.tar.gz">&quot;https://files.pythonhosted.org/packages/d7/cd/3b1dffa46b19dac269d586b9d45090588a8bd7a5741602a369d45e1bdf65/importlib_metadata-1.5.2.tar.gz&quot;</a>
-S = &quot;${WORKDIR}/importlib_metadata-${PV}&quot;
-SRC_URI[md5sum] = &quot;35a85a81c7d86605f4f49397f4e7e39c&quot;
-SRC_URI[sha256sum] = &quot;dfc83688553a91a786c6c91eeb5f3b1d31f24d71877bbd94ecbf5484e57690a2&quot;
-
-DEPENDS &#43;= &quot;${PYTHON_PN}-setuptools-scm-native&quot;
-RDEPENDS_${PN} &#43;= &quot;${PYTHON_PN}-zipp ${PYTHON_PN}-pathlib2&quot;
-
-BBCLASSEXTEND = &quot;native nativesdk&quot;
diff --git a/meta-python/recipes-devtools/python/python3-importlib-metadata_1.5.2.bb b/meta-python/recipes-devtools/python/python3-importlib-metadata_1.5.2.bb
index 8a971dac0..5170855c2 100644
--- a/meta-python/recipes-devtools/python/python3-importlib-metadata_1.5.2.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-importlib-metadata_1.5.2.bb
@@ -1,5 &#43;1,18 @@
&#43;DESCRIPTION = &quot;Read metadata from Python packages&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://pypi.org/project/importlib-metadata/">&quot;https://pypi.org/project/importlib-metadata/&quot;</a>
&#43;LICENSE = &quot;Apache-2.0&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=e88ae122f3925d8bde8319060f2ddb8e">&quot;file://LICENSE;md5=e88ae122f3925d8bde8319060f2ddb8e&quot;</a>
&#43;
 inherit pypi setuptools3
-require python-importlib-metadata.inc
 
&#43;SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://files.pythonhosted.org/packages/d7/cd/3b1dffa46b19dac269d586b9d45090588a8bd7a5741602a369d45e1bdf65/importlib_metadata-1.5.2.tar.gz">&quot;https://files.pythonhosted.org/packages/d7/cd/3b1dffa46b19dac269d586b9d45090588a8bd7a5741602a369d45e1bdf65/importlib_metadata-1.5.2.tar.gz&quot;</a>
&#43;S = &quot;${WORKDIR}/importlib_metadata-${PV}&quot;
&#43;SRC_URI[md5sum] = &quot;35a85a81c7d86605f4f49397f4e7e39c&quot;
&#43;SRC_URI[sha256sum] = &quot;dfc83688553a91a786c6c91eeb5f3b1d31f24d71877bbd94ecbf5484e57690a2&quot;
&#43;
&#43;DEPENDS &#43;= &quot;${PYTHON_PN}-setuptools-scm-native&quot;
&#43;RDEPENDS_${PN} &#43;= &quot;${PYTHON_PN}-zipp ${PYTHON_PN}-pathlib2&quot;
 RDEPENDS_${PN}_append_class-target = &quot; python3-misc&quot;
 RDEPENDS_${PN}_append_class-nativesdk = &quot; python3-misc&quot;
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

--------------92DE398E9006F9F1B98196E8--

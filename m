Received: from NAM04-SN1-obe.outbound.protection.outlook.com (NAM04-SN1-obe.outbound.protection.outlook.com [40.107.70.42])
 by mx.groups.io with SMTP id smtpd.web10.21329.1594922602300959855
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Jul 2020 11:03:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=YGFJxDt1;
 spf=pass (domain: windriver.com, ip: 40.107.70.42, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b43BINI997rJNRIRc9ELx6Gl+Q7MOSEpNm3hC8ua2NTQd8W/QWRqZZyzG7a9Zm6CnB7xG3kY5xyMJWa0R9msLgXAzmo9ZyhfS/1lYkZDPs8ntfECe1LMa8mYA3IIN+98BBZX5waEJGZl5+kn+3fnBc7hoTOsHfjNTv9VL4MKhFoN65b7+MfDNo0WS2qyIvFqTOYNYrwQ4aHDvJeT9T4KsjtX+MiejIZE8U7Nat0PDzj6b9gCgrXyiu1FXmTSypTHJSFcE9e3SUPzS2iaLytGEiQzfBYYpTbPI+NY1VWHiIOwL/y723+/BqSvv2hW0ajrAP9ibZ1Rstdg2PP8zx3J9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XeKhUi4N7SwKCoVRefpWfQbexIyMHFLL+6qSqiJGR6w=;
 b=NEsk++stgzb0r96pWLJYkpHmXf+7b5SXLM/Z+mMSZZW+Yle3bzWU7LSCkoarH/TL/iPwv4klcUHRYOgH62HzDp3Yg3sPQpJN/GmuedE6CVlUqmzJ8Oio88UsVa8jlFvZv7XrHnJ1NwgWQnsRFJG5cfqDEM7NCHJvIbkd+ptxsd+RSOg3WcsLC0uv7NMW1edJYk0rq+/AeeuF91Dw17EQFHslMewkjXGVSsmXhi8lptHMD6wz9Vg073Ruhy3C/idztDuK3KHG2CnoUpinNviIVekPvzqte32se2py7tp+dR46GUr1hajlFCd7++YPynAgSSlP2pAVY+quFTqoIMrXCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XeKhUi4N7SwKCoVRefpWfQbexIyMHFLL+6qSqiJGR6w=;
 b=YGFJxDt17WE/rgeURfQ6EbO0cRRrC5ggmIYd+ALtVb2hVBw0FhObXzBScQjhz6RMXEz2rEUT3rRPq0GRTkbf5O4Pt4k3zLGDJw1bbHTrhiWXMtwSjK+6bQJrb6g2OQ5oH1p0TXvwcvwkQ0j1s9s1VuwDbihj0mr617G8RnErTAA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CY4PR11MB0006.namprd11.prod.outlook.com (2603:10b6:910:7b::18)
 by CY4PR1101MB2168.namprd11.prod.outlook.com (2603:10b6:910:18::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.23; Thu, 16 Jul
 2020 18:03:20 +0000
Received: from CY4PR11MB0006.namprd11.prod.outlook.com
 ([fe80::f422:a1ed:36f3:82d4]) by CY4PR11MB0006.namprd11.prod.outlook.com
 ([fe80::f422:a1ed:36f3:82d4%7]) with mapi id 15.20.3195.018; Thu, 16 Jul 2020
 18:03:20 +0000
Subject: Re: [oe][meta-python][PATCH v2] python3-xlsxwriter: add recipe for v 1.2.9
To: Andrej Valek <andrej.valek@siemens.com>,
 openembedded-devel@lists.openembedded.org
References: <20200715083545.11177-1-andrej.valek@siemens.com>
 <20200715114526.16990-1-andrej.valek@siemens.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <6247cca4-8633-e624-de4a-7f0ac3a0190f@windriver.com>
Date: Thu, 16 Jul 2020 14:03:18 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200715114526.16990-1-andrej.valek@siemens.com>
X-ClientProxiedBy: YT1PR01CA0038.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::7) To CY4PR11MB0006.namprd11.prod.outlook.com
 (2603:10b6:910:7b::18)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0038.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18 via Frontend Transport; Thu, 16 Jul 2020 18:03:19 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 706e535e-2a8a-4f17-6005-08d829b285f9
X-MS-TrafficTypeDiagnostic: CY4PR1101MB2168:
X-Microsoft-Antispam-PRVS: 
	<CY4PR1101MB216898117FE305FC9FFB42909F7F0@CY4PR1101MB2168.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:207;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JzIrGEbnDNtoZ55/HB3ghDhIJp4LuFqgDpfKmoJ9qJw8FveJfUsp/2eJKx7vIldkv1qooPyl9HELYgWVlzlaOaOeet3mLUJi7iULe6MsgiiymN4NyJzHaV0tBJ0sqS0F2bFdaFHKecinQLtJuQbv3zlExdWM38lF2dgKpcIsX7QdcYBaZRjtkqahAT104Lus6yVbrf+1yTuwD2HZskfHadVsmxey4nW/nHXOkmvbg8xzWVKkC8xfWdojsjLpyXIu0z5QAR1xkgqDaN03HaPtQ7P+YlXwAjrkZ/7PxbojTJezm6jCmnl8HgFGvAGNQBLuMyV/WnBNaz/KtZcnH/azUH2GBbIygHrokMV2/pDGmOnh9M8lxGCdiIhyx6Bc4SHrYlXgYrqOfYMdgh46h8ss9iOs0Ia1aJMX3aJZxBBSiOMzZJqZJyPXFENZB6aOh+ELLVizTD0q9nCF7n/DcgjAaw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR11MB0006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(376002)(396003)(136003)(366004)(39850400004)(316002)(83380400001)(16526019)(186003)(66556008)(66476007)(166002)(2616005)(26005)(2906002)(8676002)(31686004)(66946007)(53546011)(33964004)(8936002)(478600001)(52116002)(16576012)(5660300002)(44832011)(966005)(6486002)(31696002)(36756003)(86362001)(956004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	22LmM44GWS1PU1eS6dDGck5hSX2WF3vju2fejBpjxfouCN+Szho2lFxLES5AI6eZt6yPKJzgfSz6t2XY9b5x8rF3QSSLYqzQxbos+nIJGTOrsg0xyLbFe6xBUX5qjgXWLpUx76eAJJYKXSPH15xH9TEBpg25wGY4NVX/IkXvBc4ZV6bN/XCe5otpsngP2MT8uP8mLWZALhabgPTl/+TtnKYSmWKpr44phoDedaCqVl4NIdBHjVE1ImD/qc2Ay/W5DvKn2xb6FucwR5BKMdTKioIGPBHG3/Bxlevwf4mgg2Lx374oW/uwwS+jPZCMnCXDf7+/L9//odw7nrKEefFHFWEFNjEpk7W6+Sbllm1RolMSyVb9wCOJ1MFhskP8Kqhmi4sQaaSmIvMajHS3JgxVyj7PDM1ZvDBYFvQF07F6ReEKC1avby5BwBdQPoZf3OeYH4Zvvgh2o+f8IOjnYRvR3cGi2+ks1sX2N6CNJaM+uqQQcQQJOIOmCsABbLngTKNr
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 706e535e-2a8a-4f17-6005-08d829b285f9
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB0006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2020 18:03:20.4533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LwZ3mRtw0j+G2PxJPcAAwSn9l0VtWcUSguqSIrNaeOB/I+/CgV/i1DAQxoItFOItBtb1oInrWYPCOJZiWVL5Z3UaHtra8ahag9AtAjigjyE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2168
Content-Type: multipart/alternative;
 boundary="------------6AD73B67146E728AD3D41675"
Content-Language: en-US

--------------6AD73B67146E728AD3D41675
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/15/20 7:45 AM, Andrej Valek wrote:
> Recipe for https://xlsxwriter.readthedocs.io python3 module
>
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   meta-python/recipes-devtools/python/python-xlsxwriter.inc     | 11 +++++++++++
>   .../recipes-devtools/python/python3-xlsxwriter_1.2.9.bb       |  5 +++++
>   2 files changed, 16 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python-xlsxwriter.inc
>   create mode 100644 meta-python/recipes-devtools/python/python3-xlsxwriter_1.2.9.bb
>
> diff --git a/meta-python/recipes-devtools/python/python-xlsxwriter.inc b/meta-python/recipes-devtools/python/python-xlsxwriter.inc
> new file mode 100644
> index 000000000..f5d56db00
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-xlsxwriter.inc
> @@ -0,0 +1,11 @@
> +SUMMARY = "Python 2 and 3 compatibility library"
> +HOMEPAGE = "https://xlsxwriter.readthedocs.io"
> +SECTION = "devel/python"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=0960d52d61b0801760f39463288c2672"
> +
> +inherit pypi
> +
> +PYPI_PACKAGE = "XlsxWriter"
> +
> +BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.2.9.bb b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.2.9.bb
> new file mode 100644
> index 000000000..cba856143
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.2.9.bb
> @@ -0,0 +1,5 @@
> +inherit setuptools3
> +require python-xlsxwriter.inc
> +
> +SRC_URI[md5sum] = "20f8b7df7f1705fa2f7ac3f84789d2ca"
> +SRC_URI[sha256sum] = "828b3285fc95105f5b1946a6a015b31cf388bd5378fdc6604e4d1b7839df2e77"
>
> 

--------------6AD73B67146E728AD3D41675
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/15/20 7:45 AM, Andrej Valek wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200715114526.16990-1-andrej.valek@siemens.com">
      <pre class="moz-quote-pre" wrap="">Recipe for <a class="moz-txt-link-freetext" href="https://xlsxwriter.readthedocs.io">https://xlsxwriter.readthedocs.io</a> python3 module

Signed-off-by: Andrej Valek <a class="moz-txt-link-rfc2396E" href="mailto:andrej.valek@siemens.com">&lt;andrej.valek@siemens.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20200715114526.16990-1-andrej.valek@siemens.com">
      <pre class="moz-quote-pre" wrap="">
---
 meta-python/recipes-devtools/python/python-xlsxwriter.inc     | 11 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;
 .../recipes-devtools/python/python3-xlsxwriter_1.2.9.bb       |  5 &#43;&#43;&#43;&#43;&#43;
 2 files changed, 16 insertions(&#43;)
 create mode 100644 meta-python/recipes-devtools/python/python-xlsxwriter.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-xlsxwriter_1.2.9.bb

diff --git a/meta-python/recipes-devtools/python/python-xlsxwriter.inc b/meta-python/recipes-devtools/python/python-xlsxwriter.inc
new file mode 100644
index 000000000..f5d56db00
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python-xlsxwriter.inc
@@ -0,0 &#43;1,11 @@
&#43;SUMMARY = &quot;Python 2 and 3 compatibility library&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://xlsxwriter.readthedocs.io">&quot;https://xlsxwriter.readthedocs.io&quot;</a>
&#43;SECTION = &quot;devel/python&quot;
&#43;LICENSE = &quot;MIT&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=0960d52d61b0801760f39463288c2672">&quot;file://LICENSE.txt;md5=0960d52d61b0801760f39463288c2672&quot;</a>
&#43;
&#43;inherit pypi
&#43;
&#43;PYPI_PACKAGE = &quot;XlsxWriter&quot;
&#43;
&#43;BBCLASSEXTEND = &quot;native nativesdk&quot;
diff --git a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.2.9.bb b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.2.9.bb
new file mode 100644
index 000000000..cba856143
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.2.9.bb
@@ -0,0 &#43;1,5 @@
&#43;inherit setuptools3
&#43;require python-xlsxwriter.inc
&#43;
&#43;SRC_URI[md5sum] = &quot;20f8b7df7f1705fa2f7ac3f84789d2ca&quot;
&#43;SRC_URI[sha256sum] = &quot;828b3285fc95105f5b1946a6a015b31cf388bd5378fdc6604e4d1b7839df2e77&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------6AD73B67146E728AD3D41675--

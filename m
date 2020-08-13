Received: from NAM04-SN1-obe.outbound.protection.outlook.com (NAM04-SN1-obe.outbound.protection.outlook.com [40.107.70.72])
 by mx.groups.io with SMTP id smtpd.web10.13205.1597334155409278621
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2020 08:55:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=L3xIvSWZ;
 spf=pass (domain: windriver.com, ip: 40.107.70.72, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C7RZLtn5JPyEs0IP2+XD8KTiGf44Wsh7iitUTc5plu0+c/XqJD6vna+k38ag4SPRca+XuQXFWP00NCE59BOlDzH33hK/Ert/QPSRs6MOAZKbAhSORPFGbx4MtrLL1Dw14nxDZYnG94id/ZsbP9mJUmQg19SygY84fIJCIOsP3hUpNrOQ7I9btL9H31wSILQrDVFkEaGu0m25bljyPjFhSM/83NwReOxb4szmKNM8W6W0iAxAdbQe1reXbuvgPJOBI8rMgrGPscxuwTYqnM8tBz58gAX6Bu02pa5Bx8HLmH40U7kDt5ogl3GqSaLE4kEWmunlm/cVuMQ8pNkAGZukdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w2e8VW9m3O2SJNu7b3n5gTzAj295Kle+tsRRjy2mQ1A=;
 b=npYirf1C548mGRxeU7E/bbuscs/si4Eq5JHIsqvfXu/zAq/BUUqDJvvJPxrtKRTmkPnSM7UYcNA/VJsnFX78DzgiKU4ulsT8nbDBOAevUiCznBAnETswRL5srUl8eLjPfwoDEJU9MdIfRbQJIoWaXtAA7+9+E4lqfUt+uIz/YeweThq/bl/RoC+vqlSbU/YfQZ+AjiuxeKAcAA/hHFFLsUaBCoP32BDE5N+uYkUMZy39i9YcIPXtSq51Z0qTaEmNhs8DjT8gzUnpcMnOM4nh57gYmxcyCWStOTixmzfGbeuWu18Gj863MMV0GAl1wMfBE78VV+lefETIKanwt1/n2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w2e8VW9m3O2SJNu7b3n5gTzAj295Kle+tsRRjy2mQ1A=;
 b=L3xIvSWZq00icpY8ZhHxS1qIDliCsbjvZphztztnOtaZKTGYVMNKJL1aIn6ec2jdY42GTZ0pxTqWkA6mWE2Im4FwrFrITj3xOG3oCGkD9goBaEO1Iq8Gfd1+lX+b4www4KIA8ZM691ATYqg3WOuXAJqm2Uj8yVDWE8/x8g6lQk4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3814.namprd11.prod.outlook.com (2603:10b6:a03:fb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15; Thu, 13 Aug
 2020 15:55:54 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3261.024; Thu, 13 Aug 2020
 15:55:54 +0000
Subject: Re: [oe] [meta-python][PATCH 1/5] python3-graphviz: Upgrade 0.14 -> 0.14.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200812102726.4376-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <23dffbbb-e682-accd-45dc-24214e56bfa2@windriver.com>
Date: Thu, 13 Aug 2020 11:55:51 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200812102726.4376-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0080.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::19) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0080.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend Transport; Thu, 13 Aug 2020 15:55:53 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1b86591-584e-4b8f-7502-08d83fa15c05
X-MS-TrafficTypeDiagnostic: BYAPR11MB3814:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3814E1AB317B88F5347345B99F430@BYAPR11MB3814.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kujyBkWfOQbYV6nBB6ccHFnk+HllOnNM6wp8GFEPVWrlNH83yWK/LhnNVu7tGKt4Hob+WYFlmVsILHD/qevxhst9edtaR86B5muCeOmxc0P9fxQV2JkoKQlPTtRQxDJk6Vgm23nZ7ehwurHiVhXvSdy+KPX243bDgYH2ZsygsPnhiffHs+vE0CJgg42xg0uQJ4DRXifvYMctJH5F6MC4yYXJWYR8mJKqcGTIMg524UBDTtB3WBCVSlhQDcxn7cQ3YpL/10nPvP25D8eN4alOMgnr9catknNA1SnBecpZrITnl5T/X9skqjgW8DTCpetPmORplKOOK3e+hcGvBxQqlASuJ/cD3HvrlHk6HNXAWRBHoeJsm1kPhRMGtfVO/3QYpVaNgaupWR459zSCIYBwypYdCoIA4aZK9p4mkyJRQgQPjcVw7SOP24q/f4d3vm275sHF85FzPFIE/f8g6GfYRQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(39850400004)(376002)(366004)(136003)(346002)(8936002)(16526019)(66946007)(66556008)(966005)(66476007)(2616005)(31686004)(31696002)(44832011)(186003)(956004)(36756003)(166002)(83380400001)(26005)(86362001)(5660300002)(16576012)(53546011)(33964004)(6486002)(52116002)(8676002)(316002)(2906002)(478600001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	E0RBT6RzKRkV7+SmipK1Nl2fbX/xdyXzbckYykasDjSWB28Yl8M578pdhHzhgShYAL/at8tMhWuZgg6i6TCjKvaASH1F57+3ZfKQl/Pd9C+xL1j87ehAbHpaOxTUp/Gktlu8SUnSmyPQCFg7qMJgXTqOSalxUB/npAdartctj6leGNQcRGCENTRtYHd5PbSbiI9L4kL1v3gmTX8bK/0MOyxWqSykB6YGcw4wr6YVqpOtGgJZyeAbg0fRwInLwfvFAOGyfzf7xwUrfiCBlz3pVhPF7qHHZSJHvSwNRrOdIpe8gjsg3ZYUwpFd6TVGOadr5SFrsYOaoWFF810ZVJ7EBlMOMHGz0qAXBiouMQx51n+t/vFY4INtgpIwlfzm8Afhb2g58LwFeC/p2pDd1n3rjonHy00eRT8SyQTGWYFqxYYi3U4TsdmBskCO1iTo7YUz777HuRhFG9fXkN0NMUHmpKCzac5KKMpPL3wGnaGqs9gjrqhoi7cavYUfudDu/fmN/GyxQLTIyIMvD0tgigRIBt1SZ6HVqeDgvWih+yHRZjowIlmNRjMyfHlFxEp1bsyhqP0mL3+3CjEzFqhbaQtKZ388HlfxNhMb0AeUpt0ZaGH9xhoQQZrGIQhFO7UxTRL9IRahL734P2Lru6TkefkCGA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1b86591-584e-4b8f-7502-08d83fa15c05
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2020 15:55:54.1659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ooeaulaaNW4acsml+4tQX631IJLSN4Y6qfE0ygAnFMaMSE9e8EzSJvemVi9cJrPgl/8LoNi10Lkdt1AvzCACnnDGUqfiCL0VRn5gaxJ5Oeg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3814
Content-Type: multipart/alternative;
 boundary="------------97614D9906CED3CB3268294B"
Content-Language: en-US

--------------97614D9906CED3CB3268294B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/12/20 6:27 AM, Leon Anavi wrote:
> Add homepage and upgrade to release 0.14.1:
>
> Document the colon-separated node[:port[:compass]] format used
> for tail and head points in the edge()- and edges()-methods
>
> License-Update: Use file LICENSE.txt to check the license.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-graphviz_0.14.1.bb           | 17 +++++++++++++++++
>   .../python/python3-graphviz_0.14.bb             | 16 ----------------
>   2 files changed, 17 insertions(+), 16 deletions(-)
>   create mode 100644 meta-python/recipes-devtools/python/python3-graphviz_0.14.1.bb
>   delete mode 100644 meta-python/recipes-devtools/python/python3-graphviz_0.14.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-graphviz_0.14.1.bb b/meta-python/recipes-devtools/python/python3-graphviz_0.14.1.bb
> new file mode 100644
> index 000000000..f26a1efce
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-graphviz_0.14.1.bb
> @@ -0,0 +1,17 @@
> +DESCRIPTION = "Graphviz protocol implementation"
> +HOMEPAGE = "https://graphviz.readthedocs.io/en/stable/"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f7831c564aeff14e68aa4ff7a93dc89f"
> +
> +SRC_URI[md5sum] = "436cb0f41f6a949f916357ca037e205a"
> +SRC_URI[sha256sum] = "f5aad52a652c06825dcc5ee018d920fca26aef339386866094597fb3f2f222ce"
> +
> +inherit pypi setuptools3
> +
> +PYPI_PACKAGE_EXT = "zip"
> +
> +RDEPENDS_${PN} += " \
> +    ${PYTHON_PN}-logging \
> +"
> +
> +BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python3-graphviz_0.14.bb b/meta-python/recipes-devtools/python/python3-graphviz_0.14.bb
> deleted file mode 100644
> index 98bbddd21..000000000
> --- a/meta-python/recipes-devtools/python/python3-graphviz_0.14.bb
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -DESCRIPTION = "Graphviz protocol implementation"
> -
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
> -
> -SRC_URI[sha256sum] = "e104ba036c8aef84320ec80560e544cd3cad68c9f90394b4e2b87bc44ab09791"
> -
> -inherit pypi setuptools3
> -
> -PYPI_PACKAGE_EXT = "zip"
> -
> -RDEPENDS_${PN} += " \
> -    ${PYTHON_PN}-logging \
> -"
> -
> -BBCLASSEXTEND = "native nativesdk"
>
> 

--------------97614D9906CED3CB3268294B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/12/20 6:27 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200812102726.4376-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Add homepage and upgrade to release 0.14.1:

Document the colon-separated node[:port[:compass]] format used
for tail and head points in the edge()- and edges()-methods

License-Update: Use file LICENSE.txt to check the license.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200812102726.4376-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-graphviz_0.14.1.bb           | 17 +++++++++++++++++
 .../python/python3-graphviz_0.14.bb             | 16 ----------------
 2 files changed, 17 insertions(+), 16 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-graphviz_0.14.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-graphviz_0.14.bb

diff --git a/meta-python/recipes-devtools/python/python3-graphviz_0.14.1.bb b/meta-python/recipes-devtools/python/python3-graphviz_0.14.1.bb
new file mode 100644
index 000000000..f26a1efce
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-graphviz_0.14.1.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = &quot;Graphviz protocol implementation&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://graphviz.readthedocs.io/en/stable/">&quot;https://graphviz.readthedocs.io/en/stable/&quot;</a>
+LICENSE = &quot;MIT&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=f7831c564aeff14e68aa4ff7a93dc89f">&quot;file://LICENSE.txt;md5=f7831c564aeff14e68aa4ff7a93dc89f&quot;</a>
+
+SRC_URI[md5sum] = &quot;436cb0f41f6a949f916357ca037e205a&quot;
+SRC_URI[sha256sum] = &quot;f5aad52a652c06825dcc5ee018d920fca26aef339386866094597fb3f2f222ce&quot;
+
+inherit pypi setuptools3
+
+PYPI_PACKAGE_EXT = &quot;zip&quot;
+
+RDEPENDS_${PN} += &quot; \
+    ${PYTHON_PN}-logging \
+&quot;
+
+BBCLASSEXTEND = &quot;native nativesdk&quot;
diff --git a/meta-python/recipes-devtools/python/python3-graphviz_0.14.bb b/meta-python/recipes-devtools/python/python3-graphviz_0.14.bb
deleted file mode 100644
index 98bbddd21..000000000
--- a/meta-python/recipes-devtools/python/python3-graphviz_0.14.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-DESCRIPTION = &quot;Graphviz protocol implementation&quot;
-
-LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302">&quot;file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302&quot;</a>
-
-SRC_URI[sha256sum] = &quot;e104ba036c8aef84320ec80560e544cd3cad68c9f90394b4e2b87bc44ab09791&quot;
-
-inherit pypi setuptools3
-
-PYPI_PACKAGE_EXT = &quot;zip&quot;
-
-RDEPENDS_${PN} += &quot; \
-    ${PYTHON_PN}-logging \
-&quot;
-
-BBCLASSEXTEND = &quot;native nativesdk&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------97614D9906CED3CB3268294B--

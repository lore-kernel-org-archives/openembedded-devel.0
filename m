Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.62])
 by mx.groups.io with SMTP id smtpd.web10.44551.1597065082314664169
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Aug 2020 06:11:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=UZVCReff;
 spf=pass (domain: windriver.com, ip: 40.107.237.62, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kd/MNXUysI9KS/cEvcOeyTSyT+q/zoEEwsXDeCw86gZ2s/HWovgg6QDB6otTeWkRUemeTYczcrU4grsG69wGIgBTTESnT8eD6KWaHXSwZNC9tRSRdrcYi9j4Jju/JRvbKvlR7eCLn31LuXOn4wpOz9PdMotjIO+InjEIGAswvhspSMDPNWfOlqmTql5DFpYPnxmEyVmWQSzkZq9TVMsqogXEtmalA/B3l8kOnDyl9QUABqzhdk9ZapViVORN4+tt/WoyYb6imhVFV+vFseTtKPEwgGxe2CcWf9iBNCU4xo8sZJliu6ibTIJZb+QdhfTPMfQaPq7XKMTi6HybYK8RQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UCViSUeZ//9IJ6C8XhPgfSw7qEowI+3OFRsJbhiWkIY=;
 b=f6G+5Q/On+Hb4O65aDrZJieGTsRaWy/KbiGxzwqJZScMj1FqcUfLDv9AFRnOM6STNn0O7zr84MrSOpwC/gtUs/l1DvgFPVj4wmZQDsl+i+grw0Bdx7MN7ZkOWpe6uHSEW0b+Wps9M42vQ0Jt1+psMaoMpOvLoVTXs1qr8Bbwya7YlpOAuiGKjsvW56YpzBUswgKvRn32Vi7vW2C74TeQ9uH4KHR01jWUmHOkBS8WI4YwkUR/fvy3u+3vNJhmPtg+xILmFXhk1C/p0Bf4/8zmYE702Sa6CPUGFelHTqrdCBwHuXs20gaAvFIZYpBrtuQ7pKT1wQvImsrppNEOnFjt6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UCViSUeZ//9IJ6C8XhPgfSw7qEowI+3OFRsJbhiWkIY=;
 b=UZVCRefft4fh+tsu8duECGh19GMm9RCeOdNvPeEdbM5kMgY2bbfPsQ2sASlids0EDXEoovb12gFIopnK20ObDCNNCRMWCdzD9Q6BSUBQ0CFOYmhs1DLVIwVGsuXQple+KsbHzXuyTYPI5f92vdkGZ7UgMbBXb4YHjXeyckydrpE=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4226.namprd11.prod.outlook.com (2603:10b6:a03:1bf::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Mon, 10 Aug
 2020 13:11:20 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3261.024; Mon, 10 Aug 2020
 13:11:20 +0000
Subject: Re: [oe] [meta-python][ 2/9] python3-jdatetime: Added recipe
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Cc: Colin McAllister <colinmca242@gmail.com>
References: <20200808170407.2326879-1-raj.khem@gmail.com>
 <20200808170407.2326879-2-raj.khem@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <3469ba8b-7e75-36c6-3176-7b11f9232390@windriver.com>
Date: Mon, 10 Aug 2020 09:11:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200808170407.2326879-2-raj.khem@gmail.com>
X-ClientProxiedBy: YT1PR01CA0043.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::12) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0043.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.18 via Frontend Transport; Mon, 10 Aug 2020 13:11:19 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa26acb8-b3d1-42d2-be37-08d83d2edfa4
X-MS-TrafficTypeDiagnostic: BY5PR11MB4226:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4226CE041FF6E52C8C5CDCCA9F440@BY5PR11MB4226.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6Eof5fRtdS0iuIA1e4cnkrxujDJ7ZIehxPJM9qeU7LZepi4sj35o/hVEHcBrvhnSlIDeY7ISvssB/D8BLFeZ/y13055Sn+XoIbm8ao/rsFhzZXwg07tScAjwC46A+Q5giShqDxKi2A403gXoyraiAxmdX5WrmzXtpyFj0qvzeuVCv6YKXJfQYZ6I0YYxs5Z/xmgJJGxWfOeUYkVNt1VRFlgXURsrGjX4mVIfocYzwe0fmVG87JmogMcUloR4WXdULAsvCVPdwXA84MwP6FjmNy1G9fP3JzIXpMTESPQxmRxM7ZiVbJHgwmiwvdCM7Ap/ET5XdAzmxVL6S83Evd2EPdvp6mUXiY7KHYi09qDanyvLkOpVEkhY7EDhmJO9OG/zbppQ1PAdF6dgtAl3zxQkslMRgk4QQcPY/GhrVjH2Y+zLmUeIHeXehWQ6TGvyUSoLFTNaFfqnLldc1I1OeY0yyQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(136003)(396003)(366004)(376002)(39850400004)(26005)(186003)(16576012)(5660300002)(16526019)(316002)(86362001)(66476007)(966005)(8936002)(31696002)(52116002)(6486002)(33964004)(36756003)(8676002)(2906002)(53546011)(31686004)(66946007)(83380400001)(956004)(478600001)(4326008)(166002)(66556008)(2616005)(44832011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	XE2U2nRkdmmRO8Hd7er/3iUlO5M+oYgexGhv5VROXRYHogvbWpRuk19f62JK0nb3dTgYwQuwJaDLxHaKx+3UWbvRmfX8IwG+JgEeVTcEw8oiPCkiHMnFAVvhzE90hg0Y2q/J8c9yvONUkRkntMFIWJTsIQ4gMTjk6qZwDuUGi/C5MS9s3dmqqKn41G6A6AiO3cOJzhe5v1vXtlxHs8Y+5tfVuH6S9P531aP4AGG+c7YG0K5dhCoLk4fXubAoZDNsKt6KB6wkaY+XmhFQTHahbtlrciPpv7g5IXB17DDqHzGMFZHc8IFNMrQIKY8SoW8Ouhbb17xdlMTXiLmSFcEwGW+XH1vCXiOW0wSzpmMLWfwgBTyOixiPfktmFg4O9LZWswm+cbU5hXooOJiQ9XY+QiTt5tZmjXhQwTJpOY2OeWaIiO6NgrY1giQ2j+LVwh46jraJCpxarPL81XvBxoGP17KHY5PGp0iGqAlGMgh1XJIRoUv8MEQvvc8xPtcKKeEf/+S7YmpeXABwWts+8xNB6/9n4DHuBXVib8pvtuVNyUISaxqtXN8CJFMxiX6PCf/9SnUyk4H/nFMOJEDivUh5kVox9pts3wSsJB4YLbL9hIy5N4Gkw2Q/8qfXvNtP9d2zLKa041Ik11mmE75c90m9Sg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa26acb8-b3d1-42d2-be37-08d83d2edfa4
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2020 13:11:20.6009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZwtFyM7a0tSqyHBwX89Z2BzhehQKiQKmd5p0o3DAozDI1oGX7x7ZzwRiSWdTCCicnntGJjPitrhS6Tw1PIqa3YY5w/OnAt0lcO4R5piV+0I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4226
Content-Type: multipart/alternative;
 boundary="------------653A5FD6CBFD57966CDF5F13"
Content-Language: en-US

--------------653A5FD6CBFD57966CDF5F13
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/8/20 1:04 PM, Khem Raj wrote:
> From: Colin McAllister <colinmca242@gmail.com>
>
> Created python3 recipe for jdatetime.
>
> Signed-off-by: Colin McAllister <colinmca242@gmail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-jdatetime_3.6.2.bb          | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-jdatetime_3.6.2.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-jdatetime_3.6.2.bb b/meta-python/recipes-devtools/python/python3-jdatetime_3.6.2.bb
> new file mode 100644
> index 0000000000..43f6e18493
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-jdatetime_3.6.2.bb
> @@ -0,0 +1,18 @@
> +DESCRIPTION = "Jalali implementation of Python's datetime module"
> +HOMEPAGE = "https://github.com/slashmili/python-jalali"
> +LICENSE = "Python-2.0"
> +LIC_FILES_CHKSUM = "file://PKG-INFO;md5=fc0a323542d2fbe0ad822fa0b1a0a96f"
> +
> +SRC_URI[md5sum] = "3c9ee1bc7de48ff4d9c773046b2eb081"
> +SRC_URI[sha256sum] = "a589e35f0dab89283c1a3de9d70ed6cf657932aaed8e8ce1b0e5801aaab1da67"
> +
> +PYPI_PACKAGE = "jdatetime"
> +
> +inherit pypi setuptools3
> +
> +CLEANBROKEN = "1"
> +
> +RDEPENDS_${PN} += " \
> +        ${PYTHON_PN}-modules \
> +"
> +
>
> 

--------------653A5FD6CBFD57966CDF5F13
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/8/20 1:04 PM, Khem Raj wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200808170407.2326879-2-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">From: Colin McAllister <a class="moz-txt-link-rfc2396E" href="mailto:colinmca242@gmail.com">&lt;colinmca242@gmail.com&gt;</a>

Created python3 recipe for jdatetime.

Signed-off-by: Colin McAllister <a class="moz-txt-link-rfc2396E" href="mailto:colinmca242@gmail.com">&lt;colinmca242@gmail.com&gt;</a>
Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200808170407.2326879-2-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-jdatetime_3.6.2.bb          | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-jdatetime_3.6.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-jdatetime_3.6.2.bb b/meta-python/recipes-devtools/python/python3-jdatetime_3.6.2.bb
new file mode 100644
index 0000000000..43f6e18493
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-jdatetime_3.6.2.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = &quot;Jalali implementation of Python's datetime module&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/slashmili/python-jalali">&quot;https://github.com/slashmili/python-jalali&quot;</a>
+LICENSE = &quot;Python-2.0&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;md5=fc0a323542d2fbe0ad822fa0b1a0a96f">&quot;file://PKG-INFO;md5=fc0a323542d2fbe0ad822fa0b1a0a96f&quot;</a>
+
+SRC_URI[md5sum] = &quot;3c9ee1bc7de48ff4d9c773046b2eb081&quot;
+SRC_URI[sha256sum] = &quot;a589e35f0dab89283c1a3de9d70ed6cf657932aaed8e8ce1b0e5801aaab1da67&quot;
+
+PYPI_PACKAGE = &quot;jdatetime&quot;
+
+inherit pypi setuptools3
+
+CLEANBROKEN = &quot;1&quot;
+
+RDEPENDS_${PN} += &quot; \
+        ${PYTHON_PN}-modules \
+&quot;
+
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------653A5FD6CBFD57966CDF5F13--

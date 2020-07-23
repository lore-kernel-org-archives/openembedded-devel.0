Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.71])
 by mx.groups.io with SMTP id smtpd.web12.2391.1595522917245350317
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jul 2020 09:48:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=EWW7mJp+;
 spf=pass (domain: windriver.com, ip: 40.107.236.71, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KuUYHZ5Oo3S2adxtsMKm4x4JR3lrAS3ByLRChJbJ6rM91qtceflBGLc5ATnYL0s48xHQioAguXOA/6ine51NagHklVz474jIPPluQA8H30HD+KNvZQx8Cl7fIZxXVSG9C5ubQPgdJYtzi3V5KMiIz6uBZxGihpwNFweVENjxAEmWPzMEvjGrLDLOmyDQclW1bvw2K4BghMxPpu/qjKbmT4w1+ZAWvK9QIfmfhfsnI63I2hUgLnmj1vuVBiR10Susy4DueUVLL60xb6LsTyJMG2CyamE43Z75mceaswlezV0ihDbr/Wiaoe8i9okLNvDmbgBVCMvsfizr6fR68llvKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w6SvnVGQnyTq+2VTw7By3SImQiJijqPdFMdCPA8ZByQ=;
 b=TJQKpikkQaXC18UqqVwl8z5HUk1WKYFcB7OJXbTvqTC3mxH9GQS4kUejRXJLoXKS4k/dYIlC6lMfSwejSVDaIb7yZd3u1uKBPWonnkjbUvlzbqKaBjGfu7jc5RAcOnCX+c8Xal66DkrZ6Jr2IcmYVsEz0XT0IQghH86883grhnQn9SLlrdhMHIU22AhbwWNKaK2HE8kBZUqpM9LT2dPtV7+E8dxS1Z07i+TRafi3zLA6ZhdNw+Hs5hUUTuS2QRRNUApPVFL46cf25uLjJTaHXR3j3RufGD81I/aoCuS0mOzMxI0HJh/V1ukpwvz9hmy4BzkH1NQroUEIhrHi+JKRpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w6SvnVGQnyTq+2VTw7By3SImQiJijqPdFMdCPA8ZByQ=;
 b=EWW7mJp+KjqkXtwwan5EuQjiwEECyTT+BXEE6aqvkGX1O3MFUOYWh2tahz8D+Bc8XB4w4vnQA/WQ2hphfC9+RAoL/C31iABR3MAnEQyfL7832WG4FiZDEsa8zUkP1YAnwFmj1FdgyFSJQk23YoFpOT2sSkd8kiwKq8oJZ4N0HrI=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1601.namprd11.prod.outlook.com (2603:10b6:405:f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23; Thu, 23 Jul
 2020 16:48:34 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::7dd1:2777:7445:756f]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::7dd1:2777:7445:756f%7]) with mapi id 15.20.3195.028; Thu, 23 Jul 2020
 16:48:34 +0000
Subject: Re: [oe] [meta-python][PATCH 1/4] python3-cantools: Added recipe
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Cc: Colin McAllister <colinmca242@gmail.com>
References: <20200722225608.3968953-1-raj.khem@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <dcf6fa2f-1db8-9f0c-8f11-af2ef5ce4e84@windriver.com>
Date: Thu, 23 Jul 2020 12:48:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200722225608.3968953-1-raj.khem@gmail.com>
X-ClientProxiedBy: YT1PR01CA0072.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::11) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0072.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.20 via Frontend Transport; Thu, 23 Jul 2020 16:48:33 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1813d006-853f-4409-e4ed-08d82f283cfb
X-MS-TrafficTypeDiagnostic: BN6PR11MB1601:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB16019CC3504659B1663A7CDB9F760@BN6PR11MB1601.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:473;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kRGxl6EImWJ87wRyukW07qLgkz5EqnM/rWyKoYCmyOhqX1dBUvNunZyEjKWOhZtfWPJrpmv/IR9sVNHXcgSYnV4hl7C5wWbgpMEKyOQGUslAA7VZ+fyIg1wTgmwjnYJMfERbxyQ3BinHWn6usqTkLO+3JnwlPqyFmdVmyFH7LZolq8RKw3PT2D2un59xLpmfYwY9GRjtacO0Aa9zfKhXDoj8nRmwrPSevlOSSGMRzpofq3UM3m6nfm14tqcqIIE6uvPYWjd5RZHFnLC0ErfDW5zP7+5a4OBZMDwcEz3NgOe4Pib5l9jPRKyw+Me5U6imL8tFT1embZU/pbnro7mjNuhoqkRW4GcX35xRv1lrZ7qdAXM7MYocgvqk31up0b0YKcW3Nl3NnXZCP7mJZurAZqBC//vjPzrqWKpfWWT7oXRgI307ZDBNfQ0jHxwI0Ma+iShPxl5fZ3tacdTgO3AmkA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(366004)(136003)(376002)(396003)(39850400004)(2616005)(52116002)(26005)(33964004)(53546011)(478600001)(44832011)(956004)(16526019)(31686004)(6486002)(186003)(16576012)(83380400001)(66476007)(66556008)(166002)(966005)(8936002)(31696002)(4326008)(316002)(86362001)(36756003)(5660300002)(66946007)(8676002)(2906002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	UCFBMb1t1Ym7+3dcJFm3Zqmvml2amS1+jy9rbZfEOWoOM0w3fP0JiOtUyvK0XgIYATXjYNxJAE/J3U23m3pgebb9G4y8muUqn+hyQlDhFKWenBf9JvbpzZXttVx2F/bIN0AK3pnySgFPX2acmveIkmUC2gutjl5WwFjCWei7cUH2BFis5h3UjEXa2Mg6D+CFAsCEj5zmgKSjg4f0HTfSW9b77gO5UyNsZlq0jUeGaVsgDUCPY5IHXJhAvJO7Rdu4vGmRr8WMBttP1ofaGUlapk/IefiHGj3ltaEt2lImNSuhCVoPLU+l3mOmaUhVZFVcSaTHhw3W8MlKz7sb7XdKJuiXxD+tOM+/RVsD4bkIwQ1Wviu0D0yeI6gPudxz+KV0T2yZPpQ75pXcMXUI8IOF5Uzw4oMI5HGRPu+gK/IFUBNROroQyaFKlWjaNlOkr7t7iOWAdmsi8cxvGdowFedzGOyXtalBOgmVE3zxQ0WsiOU=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1813d006-853f-4409-e4ed-08d82f283cfb
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB0003.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2020 16:48:34.3902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0lTuGQKsewOzhBNIlHLk4xHow97RJSyTjcJ6f2uw4yt1p8QCjQSXLU8iMWMy7bHHzMVhww//WQzdMdjTBbKOVd5ECL9DZpvkpWmY0oF/CYE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1601
Content-Type: multipart/alternative;
 boundary="------------8E7640175F7EB73D9BD47003"
Content-Language: en-US

--------------8E7640175F7EB73D9BD47003
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/22/20 6:56 PM, Khem Raj wrote:
> From: Colin McAllister <colinmca242@gmail.com>
>
> Created python3 recipe for cantools.
>
> Signed-off-by: Colin McAllister <colinmca242@gmail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-cantools_35.1.0.bb              | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-cantools_35.1.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-cantools_35.1.0.bb b/meta-python/recipes-devtools/python/python3-cantools_35.1.0.bb
> new file mode 100644
> index 0000000000..a9638fbd2b
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-cantools_35.1.0.bb
> @@ -0,0 +1,14 @@
> +DESCRIPTION = "CAN BUS tools in Python 3."
> +HOMEPAGE = "https://github.com/eerimoq/cantools"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
> +
> +SRC_URI[md5sum] = "46b71bbfec33146d9dbba708489a8ae2"
> +SRC_URI[sha256sum] = "bd0ac5b16bb7fe2ada0c9436c91a0b3795217bed7126296dde1565919a3f44f1"
> +
> +PYPI_PACKAGE = "cantools"
> +
> +inherit pypi setuptools3
> +
> +CLEANBROKEN = "1"
> +
>
> 

--------------8E7640175F7EB73D9BD47003
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/22/20 6:56 PM, Khem Raj wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200722225608.3968953-1-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">From: Colin McAllister <a class="moz-txt-link-rfc2396E" href="mailto:colinmca242@gmail.com">&lt;colinmca242@gmail.com&gt;</a>

Created python3 recipe for cantools.

Signed-off-by: Colin McAllister <a class="moz-txt-link-rfc2396E" href="mailto:colinmca242@gmail.com">&lt;colinmca242@gmail.com&gt;</a>
Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200722225608.3968953-1-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-cantools_35.1.0.bb              | 14 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;
 1 file changed, 14 insertions(&#43;)
 create mode 100644 meta-python/recipes-devtools/python/python3-cantools_35.1.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-cantools_35.1.0.bb b/meta-python/recipes-devtools/python/python3-cantools_35.1.0.bb
new file mode 100644
index 0000000000..a9638fbd2b
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-cantools_35.1.0.bb
@@ -0,0 &#43;1,14 @@
&#43;DESCRIPTION = &quot;CAN BUS tools in Python 3.&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/eerimoq/cantools">&quot;https://github.com/eerimoq/cantools&quot;</a>
&#43;LICENSE = &quot;MIT&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd">&quot;file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd&quot;</a>
&#43;
&#43;SRC_URI[md5sum] = &quot;46b71bbfec33146d9dbba708489a8ae2&quot;
&#43;SRC_URI[sha256sum] = &quot;bd0ac5b16bb7fe2ada0c9436c91a0b3795217bed7126296dde1565919a3f44f1&quot;
&#43;
&#43;PYPI_PACKAGE = &quot;cantools&quot;
&#43;
&#43;inherit pypi setuptools3
&#43;
&#43;CLEANBROKEN = &quot;1&quot;
&#43;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------8E7640175F7EB73D9BD47003--

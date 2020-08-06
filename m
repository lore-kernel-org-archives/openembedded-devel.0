Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.50])
 by mx.groups.io with SMTP id smtpd.web12.5764.1596719003790775720
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Aug 2020 06:03:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=JOF6LVhJ;
 spf=pass (domain: windriver.com, ip: 40.107.223.50, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gT+X993tB4CizCPsgwtOddBSuMtL1qX1Tpj4Cn4qaVT2lUaPBhD3gp5DNXGEDbVmivdDG80cMvhakvMpq4Df8epGqbmsR6/v6BBMNE7hQalN+HybLHWi86pr3i4OrE3GuaO5zAlz1tT9AVp3RCjGcHR86Y3pNwXc68Hy/xOo3XjBJ3+S/fYfiQuFt5axwhHFbE/xH8HezyYzmz5HIl8v518fSRk72tL7f4pvxjFSsZSVZtyXLpRf+Tl2f6MWSvLzurl+/ICZNDPJJpuM8BU0ySo//hFaBx/pbjmntAxkUMCUtdT+24BKYhpvonvL9/dU1FaYiKBtALslVATyaCM6Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PmhbOsn4UiM5H5vmls78Dd2TpulHWBWk2ASxD5N/qgA=;
 b=FkOwtoeo7vvJPRU6B6/pBfQy8MuRPNH2PxnLwRovCbNVO8G0mRTo4ksWJVIyAJJrBeGMEdvy72gG+opl3ZZfHKsmLxW2R27tY2ewtFYFtvli5pDEu9ud2NR4Zh4IkG4lUwLNePxT6zxAGO2xhUxnxaIM9PnUAyAMYF6CVAWPDeHpAzK2z9X3VfnI/ix9OSIFpfZ5VAAuzI/xt0bc288LEwB+2dACi1y4KMx9pg5SsJ6s3Ow/midBvTNBMmuDFbeEtr6wnjIbz/nO3TN/CnjwtC4KeYN81VotCsayutZQ0PQpdmekMOm4x1j+DRMU1+soOl+Z90/2QPQU4HLF3XeRqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PmhbOsn4UiM5H5vmls78Dd2TpulHWBWk2ASxD5N/qgA=;
 b=JOF6LVhJbKBPpPTRhdUclbXcSn6knzykkiOK5q9CzF2Uw+/LfRjDtYHt8SLXIeRu3wqKhBKQQdVA9es7WjnOCdIuSm6ccWSJmcURYGg8R1X+45a5elwbmnR4pTzRjfay8DG9kyk21xmEdxV80Q0w+xHTp/wKskPogCJMiR8aG54=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4305.namprd11.prod.outlook.com (2603:10b6:a03:1bf::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15; Thu, 6 Aug
 2020 13:03:22 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3261.016; Thu, 6 Aug 2020
 13:03:22 +0000
Subject: Re: [oe] [meta-python][PATCH 3/3] python3-textparser: Added recipe
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Cc: Colin McAllister <colinmca242@gmail.com>
References: <20200804005401.2416569-1-raj.khem@gmail.com>
 <20200804005401.2416569-3-raj.khem@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <00abb779-c938-0e01-3f12-daef4c3091bd@windriver.com>
Date: Thu, 6 Aug 2020 09:03:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200804005401.2416569-3-raj.khem@gmail.com>
X-ClientProxiedBy: YT1PR01CA0080.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::19) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0080.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend Transport; Thu, 6 Aug 2020 13:03:21 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67f607f9-0e98-4ebb-2e0b-08d83a0918e7
X-MS-TrafficTypeDiagnostic: BY5PR11MB4305:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB43056035AE73B9C0774B927A9F480@BY5PR11MB4305.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4VGeJP9xypWSP6c1FBMwt31P3s2SFLhbLa6qTVDp6DWDeRL2JAGLypfaQ6javA6FerXgXtVafN7N9xcMMKZWzRyzFbt5zumjPFev+/joaZ43UdtjPnCSLbPYsLlVJ/q+yPl91xeSR67YVKIicrL+1eC+JXSxG1UVweiLWMVDdyPXKcxnPj2s7mvZcMByR4rjPcbnJwkXeXW+uCRxc18XtFqltKi8/Z418U1xCCBpXVZOuKY/hi/7te3fod0ej/pKSNLK2klO8C+Y703GSGJ+o4gvkcUSESac3wytgf5ODzSzWrlG0WlAmxYg8mLepntTS/Y8GQLVTFDwKHwfWm4mzSVo06LkYmrjlqyKouMI8BIyRnYXA1dKnq4norGbnTuZOxtioAFV+Zl0R2Huj+QCSkkoIoyQe7lp9yMU+hEgcTpXYtPUYaVCTGPbCFaF01+MEGjbCMLy2ZL89pm/whmmNA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(376002)(346002)(366004)(396003)(136003)(2616005)(44832011)(26005)(86362001)(186003)(16526019)(31686004)(956004)(5660300002)(16576012)(316002)(478600001)(966005)(52116002)(2906002)(6486002)(4326008)(166002)(8676002)(8936002)(36756003)(66556008)(66476007)(66946007)(31696002)(33964004)(53546011)(83380400001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	7O2LGEPnnYMUgwDT9QtGVRjG2e5fQT7QiRovQmP+y1M59MsROAahgB7a5TwyWBK8vz0/2R9akdlHmRUBjiw0qPbOHp92N5f8QUJilUm88NyPmn80ed3bkzZ8d2jbo/Uj0nKOfwqGiZRuNfWOpxyVNeiEqBVQDJHYkJo2FNqAfVZmJQHDe0rSeDdM4uoHVyCdzOdg1Plhg2Pqe63V5vhLzfQ0x0S5nL+u7+VBXSJaybK8AMP4Ir4AUJeJ3ImceUB1eLQSayz7XhPXs9DtHlFhrvuFbq64UYC0Oen/t0xItA81Zo+B1tES+rIHJ4/aYkTDn3cxYLuGF5MIAj9OKgVBMIMUROf0c1zBpV0av4afZSP3SDBKXcjfrnUuQBmcoIs0MCcHxaJ0ZC7wDK50xuoKen/b2KYDHCd2WFG2ttWdhjwPkrwqja7/yL4QgWV9RQKI2ymJIyWza1/2LPp4gg245EONekjAFyRGIRs4J5e68BQRiJUPnQ2LYgginHNKhgXsgKz4e9WsXhHzbNzFTFxzEge5xX/4X2n4fT0dQ5tK6iQME20KWKwC4WXir6cycJ0qKXNYeW533B9ZFc3WGDOdJxecyrJkPTG8hPkYLC2lRDO2YJMEtRQ5b/QwOM3IUvqSp3eTf0LkTrNZx1l6R7+X7w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67f607f9-0e98-4ebb-2e0b-08d83a0918e7
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2020 13:03:22.1784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 88jpAlbZZjp5Gh6e6qxHPcFMcs5tI3MFNNA8BqgtoHtk/1gt+g6WN68EEcpzQw7pSzcVIDreG86amCdCneJaLLSnxDeghYpcjP6fX6KlnmA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4305
Content-Type: multipart/alternative;
 boundary="------------B24776D27AF871E3F2998732"
Content-Language: en-US

--------------B24776D27AF871E3F2998732
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/3/20 8:54 PM, Khem Raj wrote:
> From: Colin McAllister <colinmca242@gmail.com>
>
> Added python3 recipe for textparser.
>
> Signed-off-by: Colin McAllister <colinmca242@gmail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-textparser_0.23.0.bb            | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-textparser_0.23.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-textparser_0.23.0.bb b/meta-python/recipes-devtools/python/python3-textparser_0.23.0.bb
> new file mode 100644
> index 0000000000..0c626e7aa2
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-textparser_0.23.0.bb
> @@ -0,0 +1,14 @@
> +DESCRIPTION = "A text parser written in the Python language."
> +HOMEPAGE = "https://github.com/eerimoq/textparser"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=fe9942a8bba5458a9dbd11277bc347ad"
> +
> +SRC_URI[md5sum] = "d5378eac93406156e9029114aaa1b515"
> +SRC_URI[sha256sum] = "f009d0f6f78aa7c1e648dca4e3961f6d67495f7f520f1a705245ffad33f4b470"
> +
> +PYPI_PACKAGE = "textparser"
> +
> +inherit pypi setuptools3
> +
> +CLEANBROKEN = "1"
> +
>
> 

--------------B24776D27AF871E3F2998732
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/3/20 8:54 PM, Khem Raj wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200804005401.2416569-3-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">From: Colin McAllister <a class="moz-txt-link-rfc2396E" href="mailto:colinmca242@gmail.com">&lt;colinmca242@gmail.com&gt;</a>

Added python3 recipe for textparser.

Signed-off-by: Colin McAllister <a class="moz-txt-link-rfc2396E" href="mailto:colinmca242@gmail.com">&lt;colinmca242@gmail.com&gt;</a>
Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200804005401.2416569-3-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-textparser_0.23.0.bb            | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-textparser_0.23.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-textparser_0.23.0.bb b/meta-python/recipes-devtools/python/python3-textparser_0.23.0.bb
new file mode 100644
index 0000000000..0c626e7aa2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-textparser_0.23.0.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = &quot;A text parser written in the Python language.&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/eerimoq/textparser">&quot;https://github.com/eerimoq/textparser&quot;</a>
+LICENSE = &quot;MIT&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=fe9942a8bba5458a9dbd11277bc347ad">&quot;file://LICENSE;md5=fe9942a8bba5458a9dbd11277bc347ad&quot;</a>
+
+SRC_URI[md5sum] = &quot;d5378eac93406156e9029114aaa1b515&quot;
+SRC_URI[sha256sum] = &quot;f009d0f6f78aa7c1e648dca4e3961f6d67495f7f520f1a705245ffad33f4b470&quot;
+
+PYPI_PACKAGE = &quot;textparser&quot;
+
+inherit pypi setuptools3
+
+CLEANBROKEN = &quot;1&quot;
+
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------B24776D27AF871E3F2998732--

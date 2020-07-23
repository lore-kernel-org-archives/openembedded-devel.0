Received: from NAM04-SN1-obe.outbound.protection.outlook.com (NAM04-SN1-obe.outbound.protection.outlook.com [40.107.70.53])
 by mx.groups.io with SMTP id smtpd.web12.2399.1595522937148393998
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jul 2020 09:48:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=lnVA7ZOt;
 spf=pass (domain: windriver.com, ip: 40.107.70.53, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jeK/DiCl63DdGmVomPwayUBT2VULnZ1kFpOaMnLTtIsSXqcfyLXHAhpw0cARHwKn3VNB4ap6KA2qI4yCc+0m0Me3dYuAFPkkdCs7jEuqF2ZM166Lyiuc5ZGlTAd9mYJhbfYJTdCT+jKpcthYuPQyOipXA/U2Sdvi3Tj5RBGY982V3DWh36Oq1gdubkUhiPChUpoLUsaY5J5I+QP6i2zb79oJy56yWyUOmS/z0ameN5E/RFe7V0MQbnus8VuAwmQzzU3VK3bT5vZiZL90WlO1ikx+6859RqNfFykpJevOIElGpYfRD5F13NHQclRKTK8hFfxTiM8g45FvJKprtQ1Xgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tx9NiWqP5Z2PITOU6VMHuc4dnxA0V+2ektYtCbHgXvQ=;
 b=oH6VvO3+UXG9JXkf7AJL4T30A38rSox8q6dA4rDE1AA31ZdPiFvO0MKXuuDQYd68wAj5zeuqRJMRnSMAiHSgwMibWEUCmdAcb7Zew2dRqirTOTlHaW6DnW8yjWc6SQr4WNCjHLu4MoKr3zn8yZfrPwoNHI4w0B7QBgPQ1e4bZIiUos+MdES4z5skfYaHWx0KHeq+rosuQ39jneRJzWEWK41lQTfwGxUmBVdf049DwUsZOvPo7ZQ9E0OEyW/jOGdsYNkvN2WH1FcHLlYun4KxdYGIzWXaWN+UUYNjUhI5EsHNpdjDoXQXR34LucARk3tMXxXle/uv48E4Kf+S6RNW2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tx9NiWqP5Z2PITOU6VMHuc4dnxA0V+2ektYtCbHgXvQ=;
 b=lnVA7ZOtlV9Kp1P7lwprnABQ2Dr5bGI3M8Zhb5S3MHHH4fIRd46ZAS1Fd10+eqeGZ0MtxdEqFmMP/h40TsN5l41jjb/8J+pMt6qQ5SsVKgPKfAyYwDb1RzP8koLUGwrBsVRykejByjDknJHrW+aElApEUCDneZJm1n2ai3LWwKc=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1601.namprd11.prod.outlook.com (2603:10b6:405:f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23; Thu, 23 Jul
 2020 16:48:56 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::7dd1:2777:7445:756f]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::7dd1:2777:7445:756f%7]) with mapi id 15.20.3195.028; Thu, 23 Jul 2020
 16:48:55 +0000
Subject: Re: [oe] [meta-python][PATCH 2/4] python3-dateparser: Added recipe
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Cc: Colin McAllister <colinmca242@gmail.com>
References: <20200722225608.3968953-1-raj.khem@gmail.com>
 <20200722225608.3968953-2-raj.khem@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <2642682c-8e92-8185-7d8f-57bb367e3ebe@windriver.com>
Date: Thu, 23 Jul 2020 12:48:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200722225608.3968953-2-raj.khem@gmail.com>
X-ClientProxiedBy: YT1PR01CA0130.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::9) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0130.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::9) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.20 via Frontend Transport; Thu, 23 Jul 2020 16:48:54 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c5eb343-ed9b-4c33-4428-08d82f284971
X-MS-TrafficTypeDiagnostic: BN6PR11MB1601:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB160120DC3025ADF29D7F20809F760@BN6PR11MB1601.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:773;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZPS1Ye5QmQToIpv1gG/sjzWID5/8pfYQxsaLNQ/J9V1k6mBuMq08xfzh/oDWQCJUkL6IaVQnLiw9yv5Jq50NLBilB9NGwa+uMoL6jVPOhEpaMhB7vTq9d/eF1YpsSxTZhqxTBlfBUD7fzZTJFDsoC+HLTtTheEL4hZfPHF3TTC4TDI58IpmllXIfFNmLO4kCosHKGQas7EBOM9kqeBGzqvg/MCpbj4Vb8YFnBiPk6EV3hMWXq9CQHXC0+I0xigtPyIRt/K5Msj/xl80VEduLGSw81o6GgbJ1HCCxecrK+1DO0UXpdA9O8jAJwp+QgQ+plmIuQQ/qmBZzAmNzclzFOtm0l5peET5LWZ4xsycE4QVqw6TsOzhiFlQR2iPKG0j3tWFKn3DZnKrZqdfDx+NJ9ShhwIQ0/EJJriXd3FcRWX9OUUFTJVkxWxqgM+lq+VyH8QJlMmWd3QrQDCjRV5DjZw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(366004)(136003)(376002)(396003)(39850400004)(2616005)(52116002)(26005)(33964004)(53546011)(478600001)(44832011)(956004)(16526019)(31686004)(6486002)(186003)(16576012)(83380400001)(66476007)(66556008)(166002)(966005)(8936002)(31696002)(4326008)(316002)(86362001)(36756003)(5660300002)(66946007)(8676002)(2906002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	4GcEz4AvbN6AqZwMRH01i8fJOXDHUzzYM/MI87UKeVe6FmtoKjTrqUkE0++4COCgE10iYTvF+t1x172sqlXrojnOjO9lItxG6XBJGqZ5zj8bMHAgIox5Nd0F9d/+iN9ved+MXjoExYDoVM+cUHOUUBq5hdVFIk0atFam1snBcifbeLkFWbIng7/IIZ7ICh9L+xHgn1aViIkzJQ/K3kDFGVua75kQNbEA79Rr706qeLceKXU3tm73QC0AEb4+0r7gyYSIotY1QTYdIdtnLyiwveYtuGzupXW+KTOK2zJdNt2BvyAB7jP576HzvehFkt3E3TPwqKCeyZWa0OuPW6sZ6w91PMxLJMC96F8Tz1p+oY2t2RxQznctxC4LTzofDCDziU57t/1ZVkpbYNVDZqLHovZC7rAsHvbjlIkvZQXKp6MRK7z+QhGpcrZvQ+xO5jJk7pncuouJe9jmyfJSA32LBeLcoCwgnKhYxSfQl0RFqcw9B7Hu0Y/Pjssc/7DthJ4n
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c5eb343-ed9b-4c33-4428-08d82f284971
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB0003.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2020 16:48:55.2970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lxTJ45Fj3XUaV+1YA+peApQNiI5VivlSiCwYxMQIgyWQPqul9oHYtiy7PHWa4M5eB0Qhpe9ACpiX+Ly5e2C9tpoupMbmgG952BrbynDRkAo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1601
Content-Type: multipart/alternative;
 boundary="------------127B718EE18CE865C30EB60C"
Content-Language: en-US

--------------127B718EE18CE865C30EB60C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/22/20 6:56 PM, Khem Raj wrote:
> From: Colin McAllister <colinmca242@gmail.com>
>
> Created python3 recipe for dateparser.
>
> Signed-off-by: Colin McAllister <colinmca242@gmail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-dateparser_0.7.6.bb        | 21 +++++++++++++++++++
>   1 file changed, 21 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-dateparser_0.7.6.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-dateparser_0.7.6.bb b/meta-python/recipes-devtools/python/python3-dateparser_0.7.6.bb
> new file mode 100644
> index 0000000000..e4683911e2
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-dateparser_0.7.6.bb
> @@ -0,0 +1,21 @@
> +DESCRIPTION = "Provides modules to easily parse localized dates in almost any string formats commonly found on web pages"
> +HOMEPAGE = "https://github.com/scrapinghub/dateparser"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=3d3ed25571191e7aa3f55d0a6efe0051"
> +
> +SRC_URI[md5sum] = "78b4bf317f9b844631562abad5ce040b"
> +SRC_URI[sha256sum] = "e875efd8c57c85c2d02b238239878db59ff1971f5a823457fcc69e493bf6ebfa"
> +
> +PYPI_PACKAGE = "dateparser"
> +
> +inherit pypi setuptools3
> +
> +CLEANBROKEN = "1"
> +
> +RDEPENDS_${PN} += " \
> +        ${PYTHON_PN}-dateutil \
> +        ${PYTHON_PN}-tzlocal \
> +        ${PYTHON_PN}-ruamel-yaml \
> +"
> +
> +# Ommitted ${PYTHON_PN}-convertdate, ${PYTHON_PN}-jdatetime ${PYTHON_PN}-umalqurra
>
> 

--------------127B718EE18CE865C30EB60C
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
    <blockquote type="cite" cite="mid:20200722225608.3968953-2-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">From: Colin McAllister <a class="moz-txt-link-rfc2396E" href="mailto:colinmca242@gmail.com">&lt;colinmca242@gmail.com&gt;</a>

Created python3 recipe for dateparser.

Signed-off-by: Colin McAllister <a class="moz-txt-link-rfc2396E" href="mailto:colinmca242@gmail.com">&lt;colinmca242@gmail.com&gt;</a>
Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200722225608.3968953-2-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-dateparser_0.7.6.bb        | 21 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;
 1 file changed, 21 insertions(&#43;)
 create mode 100644 meta-python/recipes-devtools/python/python3-dateparser_0.7.6.bb

diff --git a/meta-python/recipes-devtools/python/python3-dateparser_0.7.6.bb b/meta-python/recipes-devtools/python/python3-dateparser_0.7.6.bb
new file mode 100644
index 0000000000..e4683911e2
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-dateparser_0.7.6.bb
@@ -0,0 &#43;1,21 @@
&#43;DESCRIPTION = &quot;Provides modules to easily parse localized dates in almost any string formats commonly found on web pages&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/scrapinghub/dateparser">&quot;https://github.com/scrapinghub/dateparser&quot;</a>
&#43;LICENSE = &quot;BSD-3-Clause&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=3d3ed25571191e7aa3f55d0a6efe0051">&quot;file://LICENSE;md5=3d3ed25571191e7aa3f55d0a6efe0051&quot;</a>
&#43;
&#43;SRC_URI[md5sum] = &quot;78b4bf317f9b844631562abad5ce040b&quot;
&#43;SRC_URI[sha256sum] = &quot;e875efd8c57c85c2d02b238239878db59ff1971f5a823457fcc69e493bf6ebfa&quot;
&#43;
&#43;PYPI_PACKAGE = &quot;dateparser&quot;
&#43;
&#43;inherit pypi setuptools3
&#43;
&#43;CLEANBROKEN = &quot;1&quot;
&#43;
&#43;RDEPENDS_${PN} &#43;= &quot; \
&#43;        ${PYTHON_PN}-dateutil \
&#43;        ${PYTHON_PN}-tzlocal \
&#43;        ${PYTHON_PN}-ruamel-yaml \
&#43;&quot;
&#43;
&#43;# Ommitted ${PYTHON_PN}-convertdate, ${PYTHON_PN}-jdatetime ${PYTHON_PN}-umalqurra
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------127B718EE18CE865C30EB60C--

Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.88])
 by mx.groups.io with SMTP id smtpd.web10.10671.1592583565397141748
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Jun 2020 09:19:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=JAnOGmhY;
 spf=pass (domain: windriver.com, ip: 40.107.94.88, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ShVCVLyi2B72K83df5TKV7gdgXxPCooCSHoIQGdM1APtZv7SM6e23oF+dR2RiQZ5WoFgkbPnfq9MeSHAJRPr+uBtUwlsFYCl0SFjUqvFiibjsM2HivPzUI7as0uxuaZUNdOd+NxiMAV+uWz5xEKHtB0Y8/o3oj1Ct3FC1Do3IMTGfnHN7uXbzl4t9ngJoKkZ3PC3pJjqs7NRmZXzRRhVfGjM7YtW+Bl06Tvv+Trz+u4r7isev2+/Y4UY8axallk3ILkUNY9kcXBhKsPS6aaN/JOnIWMXdVOhd0Lm0zlDE3yDOZWbpLw0MrX0ajga7OVaquyjjGmV5RiRTvKsLIfiPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bfJgyrTXyt3wNoUF2YDT178+ljbmafPnmFdFVGUAhQY=;
 b=i0X9Ih66vXZ17E2w/heGWCsGfKX6Regj6uvYFYlW2pBOIogWDyrYlhKY2830xbeTKFdQ6ArC7b6JfaLZEXFG1YUsDv3PGqxSJGYt3AXjVmc3N4OiFvd+JprTGbNMMNPi8LXQmjFYhYO5Uzd4w8FaI1NoQvcWKLpYykXyaAXnJEY6B6Vd0LrMH2UebKPNCx1D1ZPsB3oYWMlEuyitfliy7ceB1CGztdNJBgtI5oDuKh6Vex5aPvUanWjTfWUOTCWGKw9u+FkIChCgg+/sx1lUHMoF3mEsEv/i/KovubHuwjMcpJJOBQPMHYZm15j79B1WcdkhzIcQoPoOXSoCO5+vmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bfJgyrTXyt3wNoUF2YDT178+ljbmafPnmFdFVGUAhQY=;
 b=JAnOGmhYFK+2vRk8Ek0kk4yOxh/s6TO6KI25SG7uJRAC+8doMVlPAgFe0RB7YSVk8+LsoYrwMRvq39ot2Ih+QC1Oc4IYWq77GwCrZ/cbD3HziAM4bI88GgwMzeN1iWXvIqS5ORuD13+nGV4NMtV0y5WfHUQBwih1pjn1aaRYmr4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB3954.namprd11.prod.outlook.com (2603:10b6:405:79::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21; Fri, 19 Jun
 2020 16:19:24 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.021; Fri, 19 Jun 2020
 16:19:24 +0000
Subject: Re: [oe] [meta-python][PATCH 2/7] python3-croniter: add package
To: akuster <akuster808@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20200618152805.13075-1-akuster808@gmail.com>
 <20200618152805.13075-3-akuster808@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <327f1121-a981-9c5f-71ff-72a4929997e0@windriver.com>
Date: Fri, 19 Jun 2020 12:19:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200618152805.13075-3-akuster808@gmail.com>
X-ClientProxiedBy: YT1PR01CA0153.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::32) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0153.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend Transport; Fri, 19 Jun 2020 16:19:23 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5509ccfc-5b73-4da0-5cb1-08d8146c87ca
X-MS-TrafficTypeDiagnostic: BN6PR11MB3954:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB3954EB7382E01052E80162D09F980@BN6PR11MB3954.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:207;
X-Forefront-PRVS: 0439571D1D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7uhPpB49F38yNngAavTqvF5Zs4dAEy8SvtqECuNwfFvj3aRIbr2W3AZDomVjz+esORd9aU+UMrF7yJiqxrY55cuQwtl6vfbRKdYIP4/M0GAH1DGiV7QCYwntXi40R095RqnwYvFB/udCOycQ3pct3BTqQBK560lO+JQzLzwCb6WWgTD+BAGhl/v+f1ji6LDoXnsGvje55s+RRf5/OnJAVblgBtJyM1e/A45GUm3EqEMZxLqPVLlbBKRnJxfvjfZdfupLxScrm+TMgB/RdwoIVzCOM5pRrOTiU4ky4P8OVbOY1y2ZrhI+MGNVNBT7l3bxFE4iwuE6HP7N9K3lTw2LTdBKO8MT6m0/zuGDOLNgkwBFtVokSwEHRYUQNffA7Dpdd1dLcgMA6j7OGIvDF69K2z5REBtySfs5J1ORdo3zMQUHGlQkSTgo2e1XHVpZTpaJFtRyJPQNDZka3vbkJFTiqg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(376002)(136003)(366004)(39850400004)(396003)(5660300002)(53546011)(6486002)(478600001)(86362001)(83380400001)(8936002)(26005)(956004)(166002)(16526019)(44832011)(52116002)(33964004)(31696002)(31686004)(2616005)(186003)(316002)(2906002)(966005)(36756003)(66476007)(66556008)(66946007)(16576012)(8676002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	EtfAnNsNZHUiCLpDcXSjGiL6cX2PMGH47FZXp3KqhZHmKTZDWgJBRO1n9SKjWF6i6j0zhWBLaoqO67dM7aLdc/bxtqDSw8K2tDmv95YrchtOx7TBwYSONiv7EFRIQAZ8tMVYKbj0YKZ3xnfRpOn++xoV6NJL/mmv+e7XhIDw/JAcjMADc6ch3Yjsh183SsJdEVVhx7frEZ7fY251dsiOuoV0yp4thU55mMWVMqCJht/cMv3FNv0/77me0W+JgCYK5kTqWc2w3IJQdyJOyAzZKVMhvJKwmZ4Ykx/vpbfjDMS7IhjEjL4NrFH2isl6VADVrCRySC7okCDLUPy3b1l7ZpHgpzs4FzL+XLOG8gXnuN0Uh5srB9pfIIBZTyDKwa8VnM6LXPpl/rjkkdSqBRah/72tdV/G+RkfynJNpLcopdhSLxF6hlBytJjdthP/r7daxLWvU95u3xE+kM8ei+1Q92xzB/exhTZpBZFifjXhVQULciL2z7e591YAq2gfTIs+
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5509ccfc-5b73-4da0-5cb1-08d8146c87ca
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2020 16:19:24.2585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +c4eTrEeO55M0HxA9laNThuNR7Y3aQmV1USfonGfYRVA2yJQNr/KzktvKNXN8gCelaDzwO3tkwBXxtZ4EURJieSdldoqsYIcrJJ3JurwB6E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3954
Content-Type: multipart/alternative;
 boundary="------------656418C929CCDC28DA1F549F"
Content-Language: en-US

--------------656418C929CCDC28DA1F549F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/18/20 11:28 AM, akuster wrote:
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-croniter_0.3.33.bb                 | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-croniter_0.3.33.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-croniter_0.3.33.bb b/meta-python/recipes-devtools/python/python3-croniter_0.3.33.bb
> new file mode 100644
> index 0000000000..4dd53a67bc
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-croniter_0.3.33.bb
> @@ -0,0 +1,11 @@
> +DESCRIPTION = "croniter provides iteration for datetime object with cron like format"
> +SECTION = "devel/python"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2"
> +
> +PYPI_PACKAGE = "croniter"
> +SRC_URI[sha256sum] = "03ad19baa220ca8bd105413c9f3bab2e7a1514046c20aeb7bf16805c07538eee"
> +
> +inherit pypi setuptools3
> +
> +RDEPENDS_${PN} += " python3-dateutil"
>
> 

--------------656418C929CCDC28DA1F549F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/18/20 11:28 AM, akuster wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200618152805.13075-3-akuster808@gmail.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Armin Kuster <a class="moz-txt-link-rfc2396E" href="mailto:akuster808@gmail.com">&lt;akuster808@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200618152805.13075-3-akuster808@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-croniter_0.3.33.bb                 | 11 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;
 1 file changed, 11 insertions(&#43;)
 create mode 100644 meta-python/recipes-devtools/python/python3-croniter_0.3.33.bb

diff --git a/meta-python/recipes-devtools/python/python3-croniter_0.3.33.bb b/meta-python/recipes-devtools/python/python3-croniter_0.3.33.bb
new file mode 100644
index 0000000000..4dd53a67bc
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-croniter_0.3.33.bb
@@ -0,0 &#43;1,11 @@
&#43;DESCRIPTION = &quot;croniter provides iteration for datetime object with cron like format&quot;
&#43;SECTION = &quot;devel/python&quot;
&#43;LICENSE = &quot;MIT&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2">&quot;file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2&quot;</a>
&#43;
&#43;PYPI_PACKAGE = &quot;croniter&quot;
&#43;SRC_URI[sha256sum] = &quot;03ad19baa220ca8bd105413c9f3bab2e7a1514046c20aeb7bf16805c07538eee&quot;
&#43;
&#43;inherit pypi setuptools3
&#43;
&#43;RDEPENDS_${PN} &#43;= &quot; python3-dateutil&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------656418C929CCDC28DA1F549F--

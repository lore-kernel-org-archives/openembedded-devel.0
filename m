Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.66])
 by mx.groups.io with SMTP id smtpd.web11.12312.1603110728523724600
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Oct 2020 05:32:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=qIHczJ7k;
 spf=pass (domain: windriver.com, ip: 40.107.243.66, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n6lwLeIIZDfgqeuG5gBfWHqm3WWezW3hxedzCXKT/Pr/1FssESq2L7cQsjEA4meEa2zkp8lISVNDUbX3QPC8kf0bGKm69JcIeDtagIwR7GRA1ixK7+kiuGi6z35NDqgPfWRisZ4ibGv6kY+zu8fQ6dn9rhxC16si/20D1eejRThBpwVtoTjET826RrdWizkHviXhJfKydyLQ+73VmCoS4INcBgjVtgFG5pIzZVTiqczJVq86olQ9/hBTPkdIGKvanDcqKc0wDu+Efo+PQneKixdO+SeV6uzSg9Z7SoVKTfXhDT2fJpS4bwot1o0pEM16gxV7JEBU07HdTFn9OMjRCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ngOYr+QagL1iLdY7XQG0aWlj9cG0uJbfCGFqPYdCN8o=;
 b=QfAqtnE09DDEQ0fT+e1DXIOckUtheDRyIwo66daM2vV4IYZ6oYgV/OFAsXUfot+DB52A4t3qNCV92XnvR+mFtIgRzAu9DmihnnD+V81uiIX9Kk+cuLk5uBLKrAFmxueA/TydKU2s+W2Z7rTGfHFQI+5TYNSjW7qR1dFCO81Axf0SumsM3hwYO87cbs+d6oSLXYYDqIGISJBuV0MUt/HC0FFLC9is9a2HmZRgQcLIWmQoi4cQaJoBiOP+Oxd97rxg8iT/m//7rpA2+ig97yxWZhbuPPVnnPFKGCFss3qk2pL8bApgtqm0sQ+Z2FkeJzunR8gDkan+DkfuxbMRQzBavQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ngOYr+QagL1iLdY7XQG0aWlj9cG0uJbfCGFqPYdCN8o=;
 b=qIHczJ7kEIPjt8pJnRJj41Iy1wviVwi7vU4Mlt0MCNyHlXpjA+c9l599sGRHzb+4lSzfLiQgxdLKibiOputyr2tgOjUgNID9lPcBAua2L/ISorHrb0+R7yuT+gmduBSXzIoe073o3YB0PpPJqf2tsb5/IbZ5KbsCu4oZJ4a57H0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4323.namprd11.prod.outlook.com (2603:10b6:a03:1c2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.22; Mon, 19 Oct
 2020 12:32:07 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3477.028; Mon, 19 Oct 2020
 12:32:07 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-colorama: add native and nativesdk to BBCLASSEXTEND
To: Martin Jansa <Martin.Jansa@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <20201014213813.788941-1-Martin.Jansa@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <4f180d41-71b0-37ff-45dc-7d172401da18@windriver.com>
Date: Mon, 19 Oct 2020 08:32:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <20201014213813.788941-1-Martin.Jansa@gmail.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BYAPR08CA0051.namprd08.prod.outlook.com
 (2603:10b6:a03:117::28) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BYAPR08CA0051.namprd08.prod.outlook.com (2603:10b6:a03:117::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21 via Frontend Transport; Mon, 19 Oct 2020 12:32:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b005ad51-5359-442f-f3cc-08d8742afe09
X-MS-TrafficTypeDiagnostic: BY5PR11MB4323:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4323C7F4C134866027D1BBB69F1E0@BY5PR11MB4323.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:252;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cf1gfUB5eqBE1AZ5il6HSWM7kEAwuB25vm7ROQEig1OV1MjG/kkALhgUxb7IweEwofmpaGqGrs2rmfSvDPWmweWH1LsD7vbrZphqPu8BbgSDtXorvEN92SGW+C1G/g1XqUlkH8YGNmz9sNhRkLL30CS0F47HSRcSZ5xmWqM6TxOkaHRByGZJsq5/Em2i1dtihvfq573Zz8OLuJ8OXwhaCtvxr0ke+XjrGELCk+PtZnZyYcCjkQY+xfzaR3dLIMRj1zpzsrxklvXjEk8KFmqSa28NvTVZ3j1So0cjmzbJ0fOdpb4XcoDWqCCnkP0CDWa0+oiZU/JUz3ADjA/rLdnUcyTTVPZNMJbf7X8BlGesrVC/uuXU73Z/Ad8rlZtxJHl1CilJ0b+mKO2kePJFyQPbpZmNrriiokisnVrYATdJ7tVt2Q8lkwdrQzP8iQRlk0S7k6hVAoU1bHF4PSsj93btAw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(39850400004)(366004)(376002)(33964004)(6486002)(316002)(66556008)(66476007)(2616005)(66946007)(86362001)(956004)(52116002)(8936002)(166002)(36756003)(2906002)(16576012)(53546011)(83380400001)(478600001)(186003)(31686004)(16526019)(966005)(44832011)(8676002)(31696002)(26005)(5660300002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	fpVE7SXyfJWGusjSSCCWRGRuMVAYeQ5PuRZ2qwAXCJyBVE3IMEo++F6sY71jcYr3hLiZGlU04FgBANTbmO4Lfb4iypgDRYOzYhzeb+ztEmVhSNd7oshFwEp8UsKm01l9EMOyd7JNAoWJnk2aQTLHei8wZwRsFkMHlGdVlBxvymIU3HwrdASyw4+/0t+g36eLrXOm0WfGh/yU75Cyn7FFh5h8CRFAhbauwUnb05a8AADsI9ZPyHbNTUQlRPdiUg3XbWwiqfB9/tTTrDpUH/lAWY90hHZc9YK2pHMnQMF9v3m6cdqZWvvEY80ABymhOKGnbOd3e5qbkP6gmSWCV8KIS4XGdmi1kC3ccqt8SeS9L75dKqR9SiOBOOyR1lkxjHEvHsH4KP56BsaD7LxX3xQ7bIk7i/FWVmsYGqkLjL6SYDsY1lMQnKIgo07Q4C1T4Edm49gtN8/ZHj4hVZOQps6VBkHIPQ6x3pAcIhd+1Up5TtZ/O5g/X48lVT54tsMKjn1h3aqQhwNttmljX1xybtt0IzyAPyh7Ol9nw+3YoRCleqLLQ31uo7b1aMLmhmxeq/SqmD9oXeLLhOOphcvYuxhh7sN+Lg4aAjMaa82qc9tXFDMkNcXfMLFvi9bCZHa2VPyH9MFa6+Oz7WbDNWfEVMRS9w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b005ad51-5359-442f-f3cc-08d8742afe09
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2020 12:32:07.4107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7BlW1KvNBbRygIFbGyG5G2s/lmzztGi3JRzePvfsW/bTxJPLm+hDhocYGeauS7t6xRXXIME3tP1ZFa+esGOlc7EumNg/HKv5vuSWKN9G/Oo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4323
Content-Type: multipart/alternative;
 boundary="------------51D57DFCAA4643C439AC14E9"
Content-Language: en-US

--------------51D57DFCAA4643C439AC14E9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/14/20 5:38 PM, Martin Jansa wrote:
> * python3-cmd2 depends on colorama since the first version in:
>    commit dc66ca8495eb051e1e6de5333e36f7f8054094a1
>    Author: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
>    Date:   Mon Sep 2 13:22:08 2019 +0800
>
>      python-cmd2: Add python3 version
>
>      Providing a python3 version of python-cmd2.
>
>    has both BBCLASSEXTENDs since:
>
>    commit e929ea7a18b0aa4d7767d2264d26fcc5c8dde688
>    Author: Binghua Guan <freebendy@gmail.com>
>    Date:   Mon Jul 23 21:29:50 2018 +0800
>
>      python-cmd2: add native and nativesdk
>
>    causing:
> ERROR: Nothing RPROVIDES 'python3-colorama-native' (but virtual:native:/OE/meta-openembedded/meta-python/recipes-devtools/python/python3-cmd2_1.3.11.bb RDEPENDS on or otherwise requires it)
> NOTE: Runtime target 'python3-colorama-native' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['python3-colorama-native']
> NOTE: Runtime target 'python3-cmd2-native' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['python3-cmd2-native', 'python3-colorama-native']
> NOTE: Runtime target 'python3-pyflakes-native' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['python3-pyflakes-native', 'python3-cmd2-native', 'python3-colorama-native']
> ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
> Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'ament-cmake-pyflakes', 'ament-pyflakes-native', 'python3-pyflakes-native', 'python3-cmd2-native', 'python3-colorama-native']
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   meta-python/recipes-devtools/python/python3-colorama_0.4.3.bb | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta-python/recipes-devtools/python/python3-colorama_0.4.3.bb b/meta-python/recipes-devtools/python/python3-colorama_0.4.3.bb
> index 7a3f533f26..31a523b0c1 100644
> --- a/meta-python/recipes-devtools/python/python3-colorama_0.4.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-colorama_0.4.3.bb
> @@ -8,3 +8,4 @@ inherit pypi setuptools3
>   SRC_URI[md5sum] = "02daee502863d24112a8c05a5d69a612"
>   SRC_URI[sha256sum] = "e96da0d330793e2cb9485e9ddfd918d456036c7149416295932478192f4436a1"
>   
> +BBCLASSEXTEND = "native nativesdk"
>
> 
>

--------------51D57DFCAA4643C439AC14E9
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/14/20 5:38 PM, Martin Jansa
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201014213813.788941-1-Martin.Jansa@gmail.com">
      <pre class="moz-quote-pre" wrap="">* python3-cmd2 depends on colorama since the first version in:
  commit dc66ca8495eb051e1e6de5333e36f7f8054094a1
  Author: Zheng Ruoqin <a class="moz-txt-link-rfc2396E" href="mailto:zhengrq.fnst@cn.fujitsu.com">&lt;zhengrq.fnst@cn.fujitsu.com&gt;</a>
  Date:   Mon Sep 2 13:22:08 2019 +0800

    python-cmd2: Add python3 version

    Providing a python3 version of python-cmd2.

  has both BBCLASSEXTENDs since:

  commit e929ea7a18b0aa4d7767d2264d26fcc5c8dde688
  Author: Binghua Guan <a class="moz-txt-link-rfc2396E" href="mailto:freebendy@gmail.com">&lt;freebendy@gmail.com&gt;</a>
  Date:   Mon Jul 23 21:29:50 2018 +0800

    python-cmd2: add native and nativesdk

  causing:
ERROR: Nothing RPROVIDES 'python3-colorama-native' (but virtual:native:/OE/meta-openembedded/meta-python/recipes-devtools/python/python3-cmd2_1.3.11.bb RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'python3-colorama-native' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-colorama-native']
NOTE: Runtime target 'python3-cmd2-native' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-cmd2-native', 'python3-colorama-native']
NOTE: Runtime target 'python3-pyflakes-native' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-pyflakes-native', 'python3-cmd2-native', 'python3-colorama-native']
ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'ament-cmake-pyflakes', 'ament-pyflakes-native', 'python3-pyflakes-native', 'python3-cmd2-native', 'python3-colorama-native']

Signed-off-by: Martin Jansa <a class="moz-txt-link-rfc2396E" href="mailto:Martin.Jansa@gmail.com">&lt;Martin.Jansa@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201014213813.788941-1-Martin.Jansa@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 meta-python/recipes-devtools/python/python3-colorama_0.4.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-colorama_0.4.3.bb b/meta-python/recipes-devtools/python/python3-colorama_0.4.3.bb
index 7a3f533f26..31a523b0c1 100644
--- a/meta-python/recipes-devtools/python/python3-colorama_0.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-colorama_0.4.3.bb
@@ -8,3 +8,4 @@ inherit pypi setuptools3
 SRC_URI[md5sum] = &quot;02daee502863d24112a8c05a5d69a612&quot;
 SRC_URI[sha256sum] = &quot;e96da0d330793e2cb9485e9ddfd918d456036c7149416295932478192f4436a1&quot;
 
+BBCLASSEXTEND = &quot;native nativesdk&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------51D57DFCAA4643C439AC14E9--

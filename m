Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.48])
 by mx.groups.io with SMTP id smtpd.web10.10667.1592583556809064747
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Jun 2020 09:19:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=YwgCiV9L;
 spf=pass (domain: windriver.com, ip: 40.107.94.48, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PoXf3qSSbxzMhvfesD3assoSVgh9VjMfef+lNWPJ4wtVnerIQnpNXdJZIXCrgW01dNXrZQzdaQVOEw9bktk+E/KB84ajOGtaGueEqtl1WlaHD8ODlRQoFgClga5CesB66mBjJf6sIDTgIQm0lk3J3n5wP7H3/nK2TynO6dfLWh7pOAlR3bm+Gx6iBhSNWGtF8lnAWRZUjQ/WthCF4LTPSQARqN0QSWN2LhRTpEb58tp6Rmv6y8RXoHOtbeXgDijn3THNMGagkgzwEp+G6vuxrhFUxGwhxXopBEZJnjO0C+enVjX1K4VP0vXehSWyTovvNHaFggeQWYoB6KoPUzkWzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+l8IHoFTBZ4BocNsK31eiYkbyuZp463rWAZU/rYFhrw=;
 b=ScpEMkSM5jcm+fsbKqQkZSfjznvZLTRMW5pOXgtOArNZDwrcYXFWjNjNQaQIokpuOhqe8IiHvXcAgaqw1seY2mUMp42kj9IfFd9rmgqJqU/SovrP/Arkgqi14qPE7xycwdWPv79Q5tViTS7m5UYFi/T4aRenAu/+KkavrILkTZjIhrpVzjSwDedIzdkN+2Evji9a5+lAm33+7pzEUvj6/pxrjlg/TLOCfWNhoqWT/wwsmRvEYosyM/tNggGwsMJfwexuZoyKbhvgh67LIKk/uXsHmobVLqBlpSMwPiAyN7/ilqf+92kUfD5UbdpfrtN0xmErG2dNzj+ZUQHQcqBAEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+l8IHoFTBZ4BocNsK31eiYkbyuZp463rWAZU/rYFhrw=;
 b=YwgCiV9LUItlW1dBC3ihDqtde6H5grc6H6lYle38g3ihWliMZxJPM+wNZ1wMq5riN009Z2/UJhuBcKVWBQxHtdYV9xtSxTgF+gCJ/Vk5l/t38UrOtaClwS/mUy9evYYTFiwA5oGjcN4ggXtXrlP1bMjjTxG+E1cXiHfTFDGEQVc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB3954.namprd11.prod.outlook.com (2603:10b6:405:79::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21; Fri, 19 Jun
 2020 16:19:14 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.021; Fri, 19 Jun 2020
 16:19:13 +0000
Subject: Re: [oe] [meta-python][PATCH 1/7] python3-configobj: Add package
To: akuster <akuster808@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20200618152805.13075-1-akuster808@gmail.com>
 <20200618152805.13075-2-akuster808@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <001ba6d3-b37a-92c1-c5e9-8bfd976e46e4@windriver.com>
Date: Fri, 19 Jun 2020 12:19:11 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200618152805.13075-2-akuster808@gmail.com>
X-ClientProxiedBy: YT1PR01CA0155.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::34) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0155.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend Transport; Fri, 19 Jun 2020 16:19:13 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb8c2f84-174a-4880-6d85-08d8146c8178
X-MS-TrafficTypeDiagnostic: BN6PR11MB3954:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB3954867C4DDBBA62A518F05F9F980@BN6PR11MB3954.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:138;
X-Forefront-PRVS: 0439571D1D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vq3zDCrV270Z4VPdfHrTVJ1IlwEQGB50CWDbPVhNAV7ybxvqCFzePXfhoKd8toIcVEh4y/ha3HLu+pUx2dLI7zBhAJ1W3Mr+K99n+a9TVqwLB9PAHPJVveeOEwGF0FPBYfeNBx/Jg7TB88IWmkffc/uhHMZ6LQBPG+VNPZDNbf3+OfXUOszuz0yhzrWiyBDALZzMs8pJFToSzzZrmiwz03VVWJwn2tZ8pVqaH/5fMi7OZYAu4vjzaNqioJsyyMXU+DnoLuZAQRyfd9+RwN8vnrQffUPKmNn4X4o3w3eD0SzlV3kBtAJKBGsDEhR5YXH3ZBZ0c/8cv8Wmhw+Z0wMyaB1/EuUrvzaeQ1IrE3Z5MP6ycbn7KobXMCMDz6qNWYEN9OJkwkJz5AXds02q4Iz/mzmfkbaHxV2DilpxszCy00b/CZgBIhvIhq7slang2yD/ImXlJKnxoDWctxuSWHFvMw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(376002)(136003)(366004)(39850400004)(396003)(5660300002)(53546011)(6486002)(478600001)(86362001)(83380400001)(8936002)(26005)(956004)(166002)(16526019)(44832011)(52116002)(33964004)(31696002)(31686004)(2616005)(186003)(316002)(2906002)(966005)(36756003)(66476007)(66556008)(66946007)(16576012)(8676002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	o5nnEHPPMmIlkPn2Iees9fgDSbJPEpnbgkC+eGbxvSGELeIuKWVjcVCGahpuKsK2K/Tapxz+XKnpsJSp+TQcgOB55ZSPyDR5m6OlQUk+5Utod5wZASSlxqbzHbhIVJ2C56mKd/objM+e1+GeoY3wAOd3pLz3CB6ppeyNshS/hL9UkRN4+DXcQb9j2pAdDjndnXjCGBzvgXNGTdkK49C1B8MT7ExzsStuEFIJUgoyNVuYXAEQ2uU4ERK++OLM6DwLAlL5nPPp5iGQXYoJZw4WhYo3Ympodxy9mWrZkq/dJhnsatE3xZGm4lQEXdfOH8wUC0Qwh35nNqDUqSyogDMUZr7lLPq0wALtOhyUHrAspwO09YwsZOix103uSLYdM7yzs5OU3l2QXJRP1sHa0sLL55xpSBDLpMiZ39K/kwAqLtj3qcHs0B4i3MeJL4piiN3d+m7qnc08UDXldiYz70XaPyVt26kW2lms14xqpBYO3TI=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb8c2f84-174a-4880-6d85-08d8146c8178
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2020 16:19:13.6916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /2OiRJihCF8RbWmtzHLzqarTGfnHauOe1/JB0H5j7VpBzwArTcGMqhI7lfrFEm+JvhabLTgIAmSiX+xqFobnYGVYRoQM1hxWK0+q7zL2wrU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3954
Content-Type: multipart/alternative;
 boundary="------------61EE4F969799A3CEECBE7FA2"
Content-Language: en-US

--------------61EE4F969799A3CEECBE7FA2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/18/20 11:27 AM, akuster wrote:
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python3-configobj_5.0.6.bb   | 9 +++++++++
>   1 file changed, 9 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-configobj_5.0.6.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-configobj_5.0.6.bb b/meta-python/recipes-devtools/python/python3-configobj_5.0.6.bb
> new file mode 100644
> index 0000000000..1b85368105
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-configobj_5.0.6.bb
> @@ -0,0 +1,9 @@
> +SUMMARY = "Config file reading, writing and validation."
> +SECTION = "devel/python"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://configobj.py;md5=a7c3968dd866dfd23e91e125b669ab21"
> +
> +PYPI_PACKAGE = "configobj"
> +SRC_URI[sha256sum] = "a2f5650770e1c87fb335af19a9b7eb73fc05ccf22144eb68db7d00cd2bcb0902"
> +
> +inherit pypi setuptools3
>
> 

--------------61EE4F969799A3CEECBE7FA2
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/18/20 11:27 AM, akuster wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200618152805.13075-2-akuster808@gmail.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Armin Kuster <a class="moz-txt-link-rfc2396E" href="mailto:akuster808@gmail.com">&lt;akuster808@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20200618152805.13075-2-akuster808@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python3-configobj_5.0.6.bb   | 9 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;
 1 file changed, 9 insertions(&#43;)
 create mode 100644 meta-python/recipes-devtools/python/python3-configobj_5.0.6.bb

diff --git a/meta-python/recipes-devtools/python/python3-configobj_5.0.6.bb b/meta-python/recipes-devtools/python/python3-configobj_5.0.6.bb
new file mode 100644
index 0000000000..1b85368105
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-configobj_5.0.6.bb
@@ -0,0 &#43;1,9 @@
&#43;SUMMARY = &quot;Config file reading, writing and validation.&quot;
&#43;SECTION = &quot;devel/python&quot;
&#43;LICENSE = &quot;BSD-3-Clause&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://configobj.py;md5=a7c3968dd866dfd23e91e125b669ab21">&quot;file://configobj.py;md5=a7c3968dd866dfd23e91e125b669ab21&quot;</a>
&#43;
&#43;PYPI_PACKAGE = &quot;configobj&quot;
&#43;SRC_URI[sha256sum] = &quot;a2f5650770e1c87fb335af19a9b7eb73fc05ccf22144eb68db7d00cd2bcb0902&quot;
&#43;
&#43;inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------61EE4F969799A3CEECBE7FA2--

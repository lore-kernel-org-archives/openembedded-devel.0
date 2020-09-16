Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.74])
 by mx.groups.io with SMTP id smtpd.web10.22539.1600263468423246120
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Sep 2020 06:37:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=NkWq4l2t;
 spf=pass (domain: windriver.com, ip: 40.107.75.74, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gvv3TV4OnPFfiPUGsfeltPQXS8TyK3/5QaOIz6H42CDFa2wKGxg/w6JeVHD8zPxxKExG0uyj9PK1OACDKEvsYXDXYLewLFY0lSnVZTknePD3/pzB47+sHIdmRBbreYblUKhNSTK6/XEl/DfffMg5qu04RnbEz4e3vOgwhhFc5oHfmH+XQ9lJPr/brI/gLn/FI7oc2aHgXwyRNDJpFvGWoF0FVhkF75DI63GUYTMKZeNsBbGoy1ZB6vq5GCXW4/Z0bmcmhDaRwZeAXUJDySyY1IDv3m+MfOPFSbZLG1AfZVmCS7oW3LOiWaGH/F5VMBPa8YN4/WSuMbGAdNouiZvsyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d464Jk2eBeI4hJnB6PrwiEht2dKNDSymOKGhrZ2BoUY=;
 b=eIumC6G0siWVCyAsJ6nEGMY71aQo/H3d0TZL55RIZQcWHYVbZkCtUA6uyyEl9KIWJswa9oFZvKAmoF5GFUn7xuwGDp9FNmh9y29CmogfWXSeWpiMSp/K/I+Tz/rrYH0QiLbkjiuJ9am85nhoyvf9PxP1YTKq8XLCn+JlS1WzCJGrw9t8DRLy0zG+hUSfvQjuWuLoljvZc12Hv1h3gOOw6o+zGMHNsxHldtAGt7ymomL4aeq0aVE7EcOCa79snt2WKU0OFLawH6haGRvRU3h5/BrLQyxja4nthYimsdhz5nAm6XJdPeI6QE0+YEgHLxVC7sRzxPtN2bvpA/WsXh41jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d464Jk2eBeI4hJnB6PrwiEht2dKNDSymOKGhrZ2BoUY=;
 b=NkWq4l2tRyGLsoU91ITyi2a8EQA75cYf1hID9zj5r2ivx0QanSYT6jGTyNqqrhfIoHvAKb6AmpUYe45b7gTo1SFDRaZ+MNOwrGcD25e32qidw8sH0m8grL3qlFrGaImnchmGXhZH/nJuMsemFvIkWF3qeWySzm/bAilpOlclf8s=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4306.namprd11.prod.outlook.com (2603:10b6:a03:1bb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.17; Wed, 16 Sep
 2020 13:37:47 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3391.014; Wed, 16 Sep 2020
 13:37:47 +0000
Subject: Re: [oe] [meta-python][PATCH 09/10] python3-pychromecast: Upgrade 7.2.1 -> 7.3.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200915090303.14367-1-leon.anavi@konsulko.com>
 <20200915090303.14367-9-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <237c19ed-f183-eaa5-530b-becfe31974ed@windriver.com>
Date: Wed, 16 Sep 2020 09:37:44 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200915090303.14367-9-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0074.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::13) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0074.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11 via Frontend Transport; Wed, 16 Sep 2020 13:37:46 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d5527b75-7e29-47b7-54c7-08d85a45b280
X-MS-TrafficTypeDiagnostic: BY5PR11MB4306:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4306F262B67DF65D668F1A279F210@BY5PR11MB4306.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:291;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LqQ8qNRbnFbWwIKW0pmX/IEIsMswV9/G8veYCoU+MmvxMKq9H7cXo6PoBvGtiOjbSyGsgXRR4c+nzGvWlj214FbFIISbeAdA85kVTbUY/qphD02bIJYQJgMrCPlP4iFI2YFDP8oGUJvX+MSNXg44tRp/b92CSRNo8FJo7LLtqecYfLd1jabjSbVa/OQTl7vrbd6mUgyqvH/uMwrm0AstZ1a/GWxCzJh12+0bl18EFgjowU6WGgaIlSziqRq/cyfr0MmQhrKTxT4Il3iKCmUAxfJpnVt3dNwQ/1Z+RhGLJShQCz/uMk8eMiBL22Vd5jFk5FcFHVJodD3doLiV2QiDHeNS3EXMPJrAR07/AIdsTnJGeO23BaJgvdb27zWFAayCt6919S40fGxUuQq+cUinoop/6cW04TKzUef90zUB+FzmEr2TiU9qbjtL6dww1TA3EoI/ss9eF+jsNA6EBJg0vQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39830400003)(396003)(366004)(136003)(376002)(346002)(83380400001)(956004)(8676002)(5660300002)(2616005)(966005)(53546011)(478600001)(26005)(44832011)(166002)(8936002)(316002)(31686004)(6486002)(86362001)(31696002)(16526019)(66476007)(186003)(52116002)(33964004)(2906002)(66556008)(66946007)(16576012)(36756003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	r3l0S4AAO5/inbHMchhZR7rcCEqSz7cWoDZPhre9igFl9bOIaueUVDb8dz9TNpMZnbqnRbhgGLJzi5xHvUGedOK6fmVEKmNldGjbe9oW0TB/4sFg8b0TLpQ7KnHYcp49k168rxTcpalLSiXUhrITd2zv52Z+Q2lK7ALL4R63ktYjW1zR35R3WFlc9gmOk+ZhdKHsPiQO0JjN3GGKMetZA8K6zlPj0azpjsAaJcQPDDeCJS+dtIGiBPIf3EFDOe6yiF5ZaldRzqAye8K+k+ELuo5z338zkr2zaU+1RCMVcheYrieby44OUJERwq8rNOHtJIVTzBKK9PH/Feyvj33FF/ujQ7zB1TQp0YQ9r2hWlToKVWB3SStDpYDdv+d/Mv23DAa66eaVDcVsZp8HCGeRDH6VUqeW+wY+oE9UDZLk5q9O8pp83mTbtxAWskmUCsA9Mn8WcNYCKOs3XLDu2xF0xuD0JQd9Lsq8gJBzTBs87eXCKcvHS65Ar4R0fp2aaVcSWiYlxWoTayflJLj/Brmz1BPPxisDxAdY1WLvr+x3YzACWcxd64vTdU8FA4IukWBICUm/aOabN2EtIAs61PR0PCw+9kw+M5ve30yBPb1lZ3w9viHk/rdGm5IQbhPCMfj2W04B2kOOo9uZF3z9xWle+g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5527b75-7e29-47b7-54c7-08d85a45b280
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2020 13:37:47.0211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 71GcNPJ/SOCzM46InvIJURxphHRK60WwiqUg3shDkdzFAe9mhnfFSkTXBe1k9I/bxGagAjgsrL/T2YUkRrrHVm/dMrmToGt15KqB/e1a+e4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4306
Content-Type: multipart/alternative;
 boundary="------------D2532C304E97BC267169FECD"
Content-Language: en-US

--------------D2532C304E97BC267169FECD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/15/20 5:03 AM, Leon Anavi wrote:
> Upgrade to release 7.3.0:
>
> - add support for QUEUE_INSERT
> - Run black and flake8 on examples
> - Fix get_chromecasts non blocking mode
> - Black 20.8b1
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...n3-pychromecast_7.2.1.bb => python3-pychromecast_7.3.0.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pychromecast_7.2.1.bb => python3-pychromecast_7.3.0.bb} (66%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_7.2.1.bb b/meta-python/recipes-devtools/python/python3-pychromecast_7.3.0.bb
> similarity index 66%
> rename from meta-python/recipes-devtools/python/python3-pychromecast_7.2.1.bb
> rename to meta-python/recipes-devtools/python/python3-pychromecast_7.3.0.bb
> index 6a3b16c38..b444df05d 100644
> --- a/meta-python/recipes-devtools/python/python3-pychromecast_7.2.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-pychromecast_7.3.0.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/balloob/pychromecast"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
>   
> -SRC_URI[md5sum] = "a39b87178f866dda52da494eac0afe07"
> -SRC_URI[sha256sum] = "9aad074d0361791af8ccb8fb7ea0f1646db3d89600fed85c5562b64c8b1aa899"
> +SRC_URI[md5sum] = "7ab862743ff33dafc93206c1435abc5e"
> +SRC_URI[sha256sum] = "f594231efb34b86eeb463611662bca21a6962793885d3ad68195286940f7473d"
>   
>   PYPI_PACKAGE = "PyChromecast"
>   
>
> 

--------------D2532C304E97BC267169FECD
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/15/20 5:03 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200915090303.14367-9-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 7.3.0:

- add support for QUEUE_INSERT
- Run black and flake8 on examples
- Fix get_chromecasts non blocking mode
- Black 20.8b1

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200915090303.14367-9-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...n3-pychromecast_7.2.1.bb =&gt; python3-pychromecast_7.3.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pychromecast_7.2.1.bb =&gt; python3-pychromecast_7.3.0.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_7.2.1.bb b/meta-python/recipes-devtools/python/python3-pychromecast_7.3.0.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-pychromecast_7.2.1.bb
rename to meta-python/recipes-devtools/python/python3-pychromecast_7.3.0.bb
index 6a3b16c38..b444df05d 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_7.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_7.3.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/balloob/pychromecast">&quot;https://github.com/balloob/pychromecast&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5">&quot;file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5&quot;</a>
 
-SRC_URI[md5sum] = &quot;a39b87178f866dda52da494eac0afe07&quot;
-SRC_URI[sha256sum] = &quot;9aad074d0361791af8ccb8fb7ea0f1646db3d89600fed85c5562b64c8b1aa899&quot;
+SRC_URI[md5sum] = &quot;7ab862743ff33dafc93206c1435abc5e&quot;
+SRC_URI[sha256sum] = &quot;f594231efb34b86eeb463611662bca21a6962793885d3ad68195286940f7473d&quot;
 
 PYPI_PACKAGE = &quot;PyChromecast&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------D2532C304E97BC267169FECD--

Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.68])
 by mx.groups.io with SMTP id smtpd.web11.10179.1599060479971350008
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2020 08:28:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=jyHQl3Oq;
 spf=pass (domain: windriver.com, ip: 40.107.223.68, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bEuDFcX8W9YKAymVf0O/bqFgGPJQKXUEc1GWdMbsq62O0ZXsmUzLiKIOl11nnYSnVg/ouuVD7GH4kIE0XSFm/2pCEDMmEwZteiXIOEu4QIWpl4gesCAeJq5opbqhp24zG1E0LLypxrFK/FtjIlXmvqlp0PzbxA98tOt5sq2jwnANm7VcnVLsdZrBB/JWtvLvw0Xe5M8O+RYGP36JZI9HfLIIE5m0rh51mtSXxRUf76JvleNiw7VPHwGGkUXDnRY0CvQhiRzliN9W3rUEMdZ5QUbxsoavWWqFwJ+dlvqVSma7pFTkpcQJYyreeQT/TBpd9uXeWOasLbbElpSJtEExwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k1eP4gstfQlhgWHh0+tdMtb9Bqz/W44VTSDEtU+AVms=;
 b=WIX7B/5OrwENIIJHjI7qoVL47dAv/KA172P2vChzxY9/PMOM+pVVt7bJ7Fxvny6PzUXFeczY/EZMwVC0pCtDW0eGY+7ZKzBllDx2dmBM/si0hdtMINUJWH65zPdinM++KsmAeuGkwmr8IEADUys+KLpNyRz/tDA/dU/e5PCm6PF/ibKfjaJ/NjXtDVMd23vUwv0QaAZbwwT2Jgg9+zr8wBDB6UCv4OhCQfdj5bVAPmtJXM2zXPA2FCQ7FZeQrA575V5hEjLiJPHpfRRfycEaqGskhhlb0ZNuPcCJxHPkvbLIE4C3wcNzuevRlBYc1QDoZCNryn9Ey23SdaNZe/re/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k1eP4gstfQlhgWHh0+tdMtb9Bqz/W44VTSDEtU+AVms=;
 b=jyHQl3OqguUThQaRgroR8aRlab1JBPvD9+nA+hkr3g6i2W5OhsRyP5SRJVcc9PHCgfNMF5zmyH/Q5MSZo9ZW8YaUo+baiYap1YtefusqodwYIUk9qWkX13H8sHA+zlvZZOT9iIJY4f3p4EvI6kDdouuu/QqtQ3bEhlBPIhjXq38=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3352.namprd11.prod.outlook.com (2603:10b6:a03:1d::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19; Wed, 2 Sep
 2020 15:27:58 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3348.015; Wed, 2 Sep 2020
 15:27:58 +0000
Subject: Re: [oe] [meta-python][PATCH 4/5] python3-google-api-python-client: Upgrade 1.10.1 -> 1.11.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200828135131.26321-1-leon.anavi@konsulko.com>
 <20200828135131.26321-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <bc140ff2-d250-63c5-189a-bba7d5a86340@windriver.com>
Date: Wed, 2 Sep 2020 11:27:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200828135131.26321-4-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0060.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::37) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YTXPR0101CA0060.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::37) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Wed, 2 Sep 2020 15:27:58 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9fe7292-0544-4885-b71a-08d84f54c599
X-MS-TrafficTypeDiagnostic: BYAPR11MB3352:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3352B8F598A1A84CDD7EF4249F2F0@BYAPR11MB3352.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:262;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iey3pUMgSwj0yGLx7/FP8CXinGjZmU13Aslly+jZjISgrO342clMX/nq8zQoQSXLDvZca0uV/lRZaTucWF0pRu/aRhUxp/uc/+RmiByWLM6Ra5U/B2SvazNTSOn4zV7vC0JCfhHZJnMqC0y3aBjU6glx5ChwNX55eTvKu6+2lhsB3373YPQpH7KWi638nJQuVLpKE9VRn5a8PKrYLI6eS7EG8HCTGnOaYAOYyZEdm+q7P6a/mYJ9gBXxIxyXfRa+aYltck1cVpfls4aGFZ+1NpRHCDJN8Vpka0OYlOvPQbRR2GM9vBdKzS4L7v2Cvm51/yR16fwWegtwip6wTcRiOO7P67okLhTlbp/0kelmemCuMrQczMEhu8gb9fX4NtnGE5Ei2AfMKQeh7orfMGjmpZ1ugfuM4E5/oDvH59e5rKK4fLHO6ka6IKqBWS21py1E2Xzq3/yF8hoG//rrLS4S5A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(39850400004)(396003)(376002)(136003)(66556008)(53546011)(966005)(52116002)(31696002)(83380400001)(26005)(8936002)(2906002)(16576012)(36756003)(5660300002)(31686004)(33964004)(2616005)(66476007)(44832011)(66946007)(956004)(316002)(478600001)(6486002)(166002)(8676002)(86362001)(186003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	p3KeVpdpPR69VKtRakYoMijztG4Ac2ccLF/zl+G+MdJEAKJLCKb0hJqXyHfX8dGnZHpDg0BLLn6tkyLCOyRkx62kiuAeU07bHIKDHLSt11LuQQOHZZfqg11/rjjJ4ty8VF5BAu+T2P2qjd+C8ZR5AmXIy24mBvVAWMb2YkeXiC4EKCra/gdc1HdDu22Kn01tF9Fz/XGIACHoi3Pa/lJAgc1rw8nFg/9NCdNfNq5WUHz6mdG5QZp2a972BHWm++kszax9EuWuuAJPDllBPFCJq5lBEO/KTBNGQ3Ge9s9023viR+3VeWqARH5aEhhR1WGiE0eYvc+25O905/b8x1jit0VcVQGvo6nbdwhBvBfOa3DjgPUP8mUJRRmwSkfILctzTaXe4ZLzmXLB/Rhp5vyJL80IUy/69j/VsWbRUOqSMFatG5wd/mSTTmm/BUGYO+rjWP1fKBXHfzmFN/IL3GtkLJvVUHfvpOXsbcWrH7pi6KO77MNCiW/g7mGbc1sQTpwYMRjOu17cBczITHybMUPvqq6dJ92imxd7rfIqkT6w41ZaQVTSdVoQpRF1K36wLatAG8IUnSJLhBIyn8MDts5HMPKNF2C1Eg1GDgqWdJzCgNwT1mQUrD6NBdhAL3RbnUjZeaz9dJbkLKVrx7ko3dSfkA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9fe7292-0544-4885-b71a-08d84f54c599
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2020 15:27:58.6396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tdBIMEvtm06bDomECXcfCAAMEUwngSkjeiYcYYrNaptwUbSK2cXf4UIo4Ci52lr7Dsi3zj38ysqU9gO+5YQOiU5/s6gNFMdKEedajf8zVn0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3352
Content-Type: multipart/alternative;
 boundary="------------49082DF4CC236D1F886053C4"
Content-Language: en-US

--------------49082DF4CC236D1F886053C4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/28/20 9:51 AM, Leon Anavi wrote:
> Upgrade to release 1.11.0:
>
> - Add support for mtls env variables
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...t_1.10.1.bb => python3-google-api-python-client_1.11.0.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-google-api-python-client_1.10.1.bb => python3-google-api-python-client_1.11.0.bb} (69%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_1.10.1.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_1.11.0.bb
> similarity index 69%
> rename from meta-python/recipes-devtools/python/python3-google-api-python-client_1.10.1.bb
> rename to meta-python/recipes-devtools/python/python3-google-api-python-client_1.11.0.bb
> index b52dd467b..c14b17254 100644
> --- a/meta-python/recipes-devtools/python/python3-google-api-python-client_1.10.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_1.11.0.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=94023d14f6b58272fd885e4e3f2f08b3"
>   
> -SRC_URI[md5sum] = "016caa49075275f02f9b8f199dc96a75"
> -SRC_URI[sha256sum] = "aa8740103774c2b7859f73ba6f55211e794ed7a374c5c427b583869b6bfe9e6c"
> +SRC_URI[md5sum] = "b9a09d60cffda35887a8e09b600a73b0"
> +SRC_URI[sha256sum] = "caf4015800ef1a18d06d117f47f0219c0c0641f21978f6b1bb5ede7912fab97b"
>   
>   inherit pypi setuptools3
>
> 

--------------49082DF4CC236D1F886053C4
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/28/20 9:51 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200828135131.26321-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.11.0:

- Add support for mtls env variables

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200828135131.26321-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...t_1.10.1.bb =&gt; python3-google-api-python-client_1.11.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_1.10.1.bb =&gt; python3-google-api-python-client_1.11.0.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_1.10.1.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_1.11.0.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_1.10.1.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_1.11.0.bb
index b52dd467b..c14b17254 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_1.10.1.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_1.11.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/googleapis/google-api-python-client">&quot;https://github.com/googleapis/google-api-python-client&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=94023d14f6b58272fd885e4e3f2f08b3">&quot;file://LICENSE;md5=94023d14f6b58272fd885e4e3f2f08b3&quot;</a>
 
-SRC_URI[md5sum] = &quot;016caa49075275f02f9b8f199dc96a75&quot;
-SRC_URI[sha256sum] = &quot;aa8740103774c2b7859f73ba6f55211e794ed7a374c5c427b583869b6bfe9e6c&quot;
+SRC_URI[md5sum] = &quot;b9a09d60cffda35887a8e09b600a73b0&quot;
+SRC_URI[sha256sum] = &quot;caf4015800ef1a18d06d117f47f0219c0c0641f21978f6b1bb5ede7912fab97b&quot;
 
 inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------49082DF4CC236D1F886053C4--

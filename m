Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.73])
 by mx.groups.io with SMTP id smtpd.web11.4999.1594857165819697638
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2020 16:52:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=XaaC2dSt;
 spf=pass (domain: windriver.com, ip: 40.107.244.73, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T1r20lUqTj04/pBJPCeb1w6Dg+Vv/zacrz8j8Sd4PrW6BtLU8iKDJbzSvfzBI4wRhNQvPyjyGplEm4tDe6xeIIEUewKjbaPCquGXEyg4L6dZq2BySwEOfJ+qeU108LwBkBa7KhCUohc8FblvPhLJ5xByfV2r7nIGCgzAJsWGGj4Ox9JfEKpeIt8+Uvo5b2tRXc00WJg5ONZFJ8jkBBHMDGZ9a4y5RfThoqVrx7vEGH0lUAh/9D+lDqGOM7wp184avL16gKd2ymS4KfKzzqn2n0uy/cUpw3+ozobcMldBpR6Qv77rofbazjkcQcQcdlc/i8xoTXslNn8iptZCsMS2Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YzayMSgpav+zOs+8/V2sNHobocv7ChCZpCLfNzmQMnU=;
 b=BZF0oXjKfzn54AsrUPXV0oiAl0+dx8i56O8yLcqwFYp3C9TymmcabvuwYX7DiZA7NozRpIfY34zIEWM3pezZgZOCpHM2IsIECJY8OLp8ypJsy03xCqGgD+kKPTbMfckgpiizAKIYlb/Hk2/TNBYjupd3Tj5kp6ZgrpCHCiDc6oKmdzEP6fpDrhIhr8cuYX9SO60qVchXT3rOTbhQXbZOUDzeWLnmMcoR+N+uG+wzwHZkWmt5ZlaA6UdrTqPLHk82OMmOc/yRx06MZjKSHwivMuaox0D3ZUprridWykrwMZtscs2wUfDv4ZbDFUYEQX4GgAvWccULjamkPfMJom/83Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YzayMSgpav+zOs+8/V2sNHobocv7ChCZpCLfNzmQMnU=;
 b=XaaC2dStMmo7QfljHoIm+6jFprdbScHrdPv6cwSA5o9CKstdkb7BlsbEhOFaqDnMYA1+zR4ZjyhFFnrqv0bJLCKb6Sr5XpS3W1Qbn2a/t/lCiBBcH6hzWbfb5QIJLLLjwCUmNnSsM1V79rxCb+NROGKnRJpaT5YgOZlm+PRMcDs=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CY4PR11MB0006.namprd11.prod.outlook.com (2603:10b6:910:7b::18)
 by CY4PR11MB0055.namprd11.prod.outlook.com (2603:10b6:910:76::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.24; Wed, 15 Jul
 2020 23:52:45 +0000
Received: from CY4PR11MB0006.namprd11.prod.outlook.com
 ([fe80::f422:a1ed:36f3:82d4]) by CY4PR11MB0006.namprd11.prod.outlook.com
 ([fe80::f422:a1ed:36f3:82d4%7]) with mapi id 15.20.3195.018; Wed, 15 Jul 2020
 23:52:44 +0000
Subject: Re: [oe] [meta-python][PATCH 2/5] python3-ecdsa: add package
To: akuster <akuster808@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20200711031932.5883-1-akuster808@gmail.com>
 <20200711031932.5883-2-akuster808@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <898d4c4b-c846-bc0c-eaa9-bac86192add9@windriver.com>
Date: Wed, 15 Jul 2020 19:52:42 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200711031932.5883-2-akuster808@gmail.com>
X-ClientProxiedBy: YT1PR01CA0094.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::33) To CY4PR11MB0006.namprd11.prod.outlook.com
 (2603:10b6:910:7b::18)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0094.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18 via Frontend Transport; Wed, 15 Jul 2020 23:52:44 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 27ff3044-8000-4ffc-dab5-08d8291a2b31
X-MS-TrafficTypeDiagnostic: CY4PR11MB0055:
X-Microsoft-Antispam-PRVS: 
	<CY4PR11MB0055C6FF7CEEFC72AA44AB049F7E0@CY4PR11MB0055.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:281;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dmg9x8R7QPWleQZ+v8VHz8PLrB9B275/XVKipz5NL4XjP8+b4vribse2uKlsATtTAFxwlwhXGh/MuBBo6TPfK6t4verPyFxs9lt8omktv++FfgKIvqbQmCNhwZMXwc5q3uX8XBL1pX8kP32bkwXf6bQEYjyn039cMq1Gtvp8TAnEUgx1qBPevfjeZbBt62B9DbZfJFTy0JIpSPhV5t14DmIuwh45cHwX8PgEihvoOuHkguFIaPdt53IEQGCAGITYU0HcpPM58/sfOcyk2V92iwutQ9DvKiI/rgcBxfyI9dFwjIyWuTgMeWeOO6Y+G8AmU4jUwf+5JNMXYiBOlkJ+aWpx5sPELoizfQtt4arhVaMEUkZVsM6u7YfpaCOmXDV2QPUOw+R2uTh1LFwdL0a1WQeTWXCVRhOM4582bVrONV1SnE9jIg02ABuaHv96F2wH5J7XrZbXWZJhzBXJq8wf2g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR11MB0006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(346002)(366004)(39850400004)(396003)(136003)(86362001)(316002)(8936002)(31696002)(2906002)(5660300002)(478600001)(16576012)(166002)(966005)(36756003)(31686004)(8676002)(186003)(956004)(16526019)(52116002)(44832011)(66946007)(83380400001)(6486002)(66476007)(26005)(2616005)(33964004)(53546011)(66556008)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	vYFaQQP08MKcY3JspxTZj/FWTTR7/tCCEOGbYoORMdu36n5gx71PUZhFKzL7FCdWHVbwLlgT6L9MdAsA+PP74ProWAEjmsjIo6JralaSoOiiIiNuDumv4zN2pbqZKOBTAAh3bZHKnuLy6YjEK262NqxmsU4E/bl0WEXUrMqKWr9ydtp7kv2/DqBSArhLQqlLCH3jubYFR3ZHRSN1o6VWC6QX8ZgEtlxmnZrJwmBQiHc95jZNA53w4DBBoIRVJrxGwtxtLxsZZBaPO/V2r4AFB5ApUr6m+dYp4Mfo9SwhXYahsIbwbNPX230neO6j8MlhmjbIHKWUb+nTC6hTUms8Sh73fueVjryTafNXKfwuVbWNfQl6BuJPsch39wOTQyzwl0UnSWbeX2+COB5lrOJm77fN/dleIZXxnj+tyVNh+du1aels8hTseO7/jstAgZrcast0tsnZO1r0RqsLMhuD1BDwn2uDw+X888Ht5Vn+Ip8=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27ff3044-8000-4ffc-dab5-08d8291a2b31
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB0006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2020 23:52:44.7718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XO6rWyo2/ivMbdljRJi3k7HhOLFMhGmxAEb2OVUFmLAicYmlR8b1HZdScrkufTr3HAhrWvFStjlerlCZCovcJ2GzhNg8iguuaHaqA1zCapA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB0055
Content-Type: multipart/alternative;
 boundary="------------A1F3B083E1821FDF12620154"
Content-Language: en-US

--------------A1F3B083E1821FDF12620154
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/10/20 11:19 PM, akuster wrote:
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python3-ecdsa_0.15.bb   | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-ecdsa_0.15.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-ecdsa_0.15.bb b/meta-python/recipes-devtools/python/python3-ecdsa_0.15.bb
> new file mode 100644
> index 0000000000..aba62f3ef9
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-ecdsa_0.15.bb
> @@ -0,0 +1,13 @@
> +SUMMARY = "ECDSA cryptographic signature library (pure python)"
> +SECTION = "devel/python"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=66ffc5e30f76cbb5358fe54b645e5a1d"
> +
> +DEPENDS += "python3-pip python3-pbr"
> +
> +PYPI_PACKAGE = "ecdsa"
> +SRC_URI[sha256sum] = "8f12ac317f8a1318efa75757ef0a651abe12e51fc1af8838fb91079445227277"
> +
> +inherit pypi setuptools3
> +
> +RDEPENDS_${PN} += "python3-six python3-gmpy2 python3-pbr"
>
> 

--------------A1F3B083E1821FDF12620154
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/10/20 11:19 PM, akuster wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200711031932.5883-2-akuster808@gmail.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Armin Kuster <a class="moz-txt-link-rfc2396E" href="mailto:akuster808@gmail.com">&lt;akuster808@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200711031932.5883-2-akuster808@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python3-ecdsa_0.15.bb   | 13 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;
 1 file changed, 13 insertions(&#43;)
 create mode 100644 meta-python/recipes-devtools/python/python3-ecdsa_0.15.bb

diff --git a/meta-python/recipes-devtools/python/python3-ecdsa_0.15.bb b/meta-python/recipes-devtools/python/python3-ecdsa_0.15.bb
new file mode 100644
index 0000000000..aba62f3ef9
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-ecdsa_0.15.bb
@@ -0,0 &#43;1,13 @@
&#43;SUMMARY = &quot;ECDSA cryptographic signature library (pure python)&quot;
&#43;SECTION = &quot;devel/python&quot;
&#43;LICENSE = &quot;MIT&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=66ffc5e30f76cbb5358fe54b645e5a1d">&quot;file://LICENSE;md5=66ffc5e30f76cbb5358fe54b645e5a1d&quot;</a>
&#43;
&#43;DEPENDS &#43;= &quot;python3-pip python3-pbr&quot;
&#43;
&#43;PYPI_PACKAGE = &quot;ecdsa&quot;
&#43;SRC_URI[sha256sum] = &quot;8f12ac317f8a1318efa75757ef0a651abe12e51fc1af8838fb91079445227277&quot;
&#43;
&#43;inherit pypi setuptools3
&#43;
&#43;RDEPENDS_${PN} &#43;= &quot;python3-six python3-gmpy2 python3-pbr&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------A1F3B083E1821FDF12620154--

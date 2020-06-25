Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.87])
 by mx.groups.io with SMTP id smtpd.web11.9891.1593089967178642240
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2020 05:59:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=mkJ5ZKMW;
 spf=pass (domain: windriver.com, ip: 40.107.223.87, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G+81WAo0znOhbZ80+kkJ9s3OCWnqf2iRCvCQIP7BsH06mlRbnqtzTOJxdrgnzWI/Rc6Tb+bCb54OrMBqvmWSrDQiCoR1Mtw0CWJ40oj7ysW2aGNRu7SvBsUlUTR02KfaruHeHiVUTRjXzA9tpMdD2w1D97+InkFSuelEp2n6VhD85AIm9/WxFFL+amIXBLjn0WP3jzmy3loqcFUzl1zOv2ScOdkjP6Rn6Ffz+Sf8zcpJkwt2EaBPJKb9m1J0247D4AweBOMc1tX2ouKY6Jb+VGOeK4a2QQE0NkMlVEyuKcnTvGL8BNN62eIVuYFQ/70JWrMW8tHShVZb4FXyH58NVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qUVBq2E9vFYyd6WrNr6CS7wgF0QwWqJ58fuXwtwS76o=;
 b=Gc2gVuVm/Euhn8ozeZiPPKAlD4k8uCCF2GhIJxNMGvkvPqzd0gGCBEQMfj+7UT2bxla8a2b/igZpp6SkVBZWWTg5SdwNpnMBjd/li04SQcxbDgxmseuUGPzcuqjrbh7+I6whECTy4S3q1wYdNS+bGAsA3M4yEojBQLZveTaihTuUlk2N+FB8ViXiSb34Gt8UEinUTpKoR5+zKaY48LNB6hc7Od5j/NQEVQdYtZSvKxTuoP5Kpnioe5lt+/hHHI5qUA7n6+5gvNQEaCgyXzUt8zIVAfIRhyQubhRXWQN0UM/nyYcQGGuATy2gQWNgo/K8UIFSLh3Yp2a5gDKtKvsRJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qUVBq2E9vFYyd6WrNr6CS7wgF0QwWqJ58fuXwtwS76o=;
 b=mkJ5ZKMWdxVyvuLScUxr5mex+DYpX8Ke7ptxGaWShOebwudhqWwEkD7gJrov8LtQ1K+YKiKaT1jiYM2yvSdR86eGGBXEQ5zARZp4jEvj9zGEWZ+Iw2R/3rCyF6grEPqKAwlYaYsqXcZZSvoK1D59Hinmif6OGkDhEqLoCjy4e7M=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB3954.namprd11.prod.outlook.com (2603:10b6:405:79::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21; Thu, 25 Jun
 2020 12:59:26 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.027; Thu, 25 Jun 2020
 12:59:26 +0000
Subject: Re: [oe] [meta-python][PATCH 06/10] python3-lazy-object-proxy: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200624151628.547-1-leon.anavi@konsulko.com>
 <20200624151628.547-6-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <c24e1d54-5ebc-f443-64aa-2104878a7a44@windriver.com>
Date: Thu, 25 Jun 2020 08:59:23 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200624151628.547-6-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0037.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::6) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0037.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::6) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21 via Frontend Transport; Thu, 25 Jun 2020 12:59:25 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae3f7d9a-a079-4f76-c6b7-08d8190796a7
X-MS-TrafficTypeDiagnostic: BN6PR11MB3954:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB395470FC628E81C3773F4FFC9F920@BN6PR11MB3954.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:126;
X-Forefront-PRVS: 0445A82F82
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RC9n2nKxTdWU0dTyNubhAGexabZW64GW37k8MllrMUjxEX6ijtD9WgVTEUl1e8ng+47bl0H/e76vVQG6+C09K6FsS1E1hCZtc7F772sGWSTB0npwruzcKLcK3QmMNw2my+krh0MvzVv/oa0LIe7hhPYLHd7aKbfLvm9TZ83bcghx7Dsug5v6uHbB2LMeQFhnQhljSLVNQWCMsB32MepItUqv0Av/8BMcZKxym/3xoCiCvVTItnHLzM8KTQeCpM3kXjlfvWGSfNd2r31c8bS1Pp6IJbkiP77SUmbmjJZU6S8ip1U6tEZ/h+rKFTf7xbsPBDnKv3wFHgy+3nFQxDegtOWjNBboWmpQcBMJ31kkHwz7QBjup7rhVocDmDApThh8NRfwtGMS+gjgew7ZmjP3nV+VwKq5gP9xb/kZ7CNEUeiQThPP7hplKdaBKTG22Ar9KvIJsg/yZHDM28lQyQC3Uw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(376002)(39850400004)(366004)(396003)(346002)(52116002)(44832011)(83380400001)(86362001)(26005)(31696002)(186003)(36756003)(5660300002)(53546011)(8936002)(16526019)(966005)(16576012)(166002)(66946007)(66476007)(33964004)(66556008)(956004)(478600001)(2616005)(6486002)(316002)(8676002)(31686004)(2906002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	cZUoZpb/oWWMRZkPBR6WeU7RkRIx7KlX9kJWBzVTLX4LLtrIaoDLu0ymR9QO+hddDb6vnIWo9s1iVynI8a+pOmvFSccW7AS6K0Yw9o51D8sRKGZwekwCHA6rmGdt4UeeYdvXJUdrSHsPQc3r6wiCLlewM+dvLrXKzER6aJTwvl18vWmXSUOJAWN0wB63phICIZwR1hZv2hzW2ImbjG7goRM9+yWKHP9yujhg9OZrgEX4f4p2CkdenAqrcfAoKRr4vYruzEf09FaidvN/jnkSbvc2kEcrntFylYe8CI5SLL867z891b+pUPpnNeeOGw6o03St4X7LHxoUoKX7c48cFcTvDroJZyvA3A18cr6atH/I/qLnu4CSX8QfPLEfdHjQO91U9/8ioFFKR37Z5Kpm0q95t+xlyx+KDBPbXz9sTP25ENdgwHjSZ81r5Xna9LvRxLPjFv1MOlC5URxuIBnPGAh0y2iLZ3AcGNqDHoj6M/4=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae3f7d9a-a079-4f76-c6b7-08d8190796a7
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2020 12:59:25.8763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rNhSY7E5ny0on/QENkUb7nGVtUgunjQEPAgjCRlJgcTntC14foH2TrhFtTBvSqchi7wy22v+9JaPt+2FEoGMDgDTF+7+g4hP9nINSU995FE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3954
Content-Type: multipart/alternative;
 boundary="------------7D9D3EAD404D0CCE76FEB5AA"
Content-Language: en-US

--------------7D9D3EAD404D0CCE76FEB5AA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/24/20 11:16 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python-lazy-object-proxy.inc            | 12 ------------
>   .../python/python3-lazy-object-proxy_1.4.3.bb      | 14 ++++++++++++--
>   2 files changed, 12 insertions(+), 14 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-lazy-object-proxy.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-lazy-object-proxy.inc b/meta-python/recipes-devtools/python/python-lazy-object-proxy.inc
> deleted file mode 100644
> index bbbd66ce6..000000000
> --- a/meta-python/recipes-devtools/python/python-lazy-object-proxy.inc
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -SUMMARY = "A fast and thorough lazy object proxy"
> -HOMEPAGE = "https://python-lazy-object-proxy.readthedocs.io/"
> -LICENSE = "BSD-2-Clause"
> -SECTION = "devel/python"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=9c5c2c74370826468065c5702b8a1fcf"
> -
> -DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
> -
> -SRC_URI[md5sum] = "5c64c06affcd2a7c6ddc848af4280cca"
> -SRC_URI[sha256sum] = "f3900e8a5de27447acbf900b4750b0ddfd7ec1ea7fbaf11dfa911141bc522af0"
> -
> -inherit pypi
> diff --git a/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.4.3.bb b/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.4.3.bb
> index 150e12fd4..bd197adcb 100644
> --- a/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.4.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.4.3.bb
> @@ -1,2 +1,12 @@
> -inherit setuptools3
> -require python-lazy-object-proxy.inc
> +SUMMARY = "A fast and thorough lazy object proxy"
> +HOMEPAGE = "https://python-lazy-object-proxy.readthedocs.io/"
> +LICENSE = "BSD-2-Clause"
> +SECTION = "devel/python"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=9c5c2c74370826468065c5702b8a1fcf"
> +
> +DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
> +
> +SRC_URI[md5sum] = "5c64c06affcd2a7c6ddc848af4280cca"
> +SRC_URI[sha256sum] = "f3900e8a5de27447acbf900b4750b0ddfd7ec1ea7fbaf11dfa911141bc522af0"
> +
> +inherit pypi setuptools3
>
> 

--------------7D9D3EAD404D0CCE76FEB5AA
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/24/20 11:16 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200624151628.547-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200624151628.547-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python-lazy-object-proxy.inc            | 12 ------------
 .../python/python3-lazy-object-proxy_1.4.3.bb      | 14 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;--
 2 files changed, 12 insertions(&#43;), 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-lazy-object-proxy.inc

diff --git a/meta-python/recipes-devtools/python/python-lazy-object-proxy.inc b/meta-python/recipes-devtools/python/python-lazy-object-proxy.inc
deleted file mode 100644
index bbbd66ce6..000000000
--- a/meta-python/recipes-devtools/python/python-lazy-object-proxy.inc
&#43;&#43;&#43; /dev/null
@@ -1,12 &#43;0,0 @@
-SUMMARY = &quot;A fast and thorough lazy object proxy&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://python-lazy-object-proxy.readthedocs.io/">&quot;https://python-lazy-object-proxy.readthedocs.io/&quot;</a>
-LICENSE = &quot;BSD-2-Clause&quot;
-SECTION = &quot;devel/python&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=9c5c2c74370826468065c5702b8a1fcf">&quot;file://LICENSE;md5=9c5c2c74370826468065c5702b8a1fcf&quot;</a>
-
-DEPENDS &#43;= &quot;${PYTHON_PN}-setuptools-scm-native&quot;
-
-SRC_URI[md5sum] = &quot;5c64c06affcd2a7c6ddc848af4280cca&quot;
-SRC_URI[sha256sum] = &quot;f3900e8a5de27447acbf900b4750b0ddfd7ec1ea7fbaf11dfa911141bc522af0&quot;
-
-inherit pypi
diff --git a/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.4.3.bb b/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.4.3.bb
index 150e12fd4..bd197adcb 100644
--- a/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.4.3.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.4.3.bb
@@ -1,2 &#43;1,12 @@
-inherit setuptools3
-require python-lazy-object-proxy.inc
&#43;SUMMARY = &quot;A fast and thorough lazy object proxy&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://python-lazy-object-proxy.readthedocs.io/">&quot;https://python-lazy-object-proxy.readthedocs.io/&quot;</a>
&#43;LICENSE = &quot;BSD-2-Clause&quot;
&#43;SECTION = &quot;devel/python&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=9c5c2c74370826468065c5702b8a1fcf">&quot;file://LICENSE;md5=9c5c2c74370826468065c5702b8a1fcf&quot;</a>
&#43;
&#43;DEPENDS &#43;= &quot;${PYTHON_PN}-setuptools-scm-native&quot;
&#43;
&#43;SRC_URI[md5sum] = &quot;5c64c06affcd2a7c6ddc848af4280cca&quot;
&#43;SRC_URI[sha256sum] = &quot;f3900e8a5de27447acbf900b4750b0ddfd7ec1ea7fbaf11dfa911141bc522af0&quot;
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

--------------7D9D3EAD404D0CCE76FEB5AA--

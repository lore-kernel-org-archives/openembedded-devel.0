Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.70])
 by mx.groups.io with SMTP id smtpd.web11.6896.1596491681355262655
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2020 14:54:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=d77+uPqo;
 spf=pass (domain: windriver.com, ip: 40.107.93.70, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PjJn2njD6yX3hfDuPjGpz0S3t4juJYYYtcVjh0jFmxnWZ6YQmle6AgDFZI7iNoktIPVFnRYBirpPVsa10SzFjFmr89T29sfWAQLPkMDWvkzK8MH1cO/GCzGMHTQtS+ptEItD6G7WgzXvJQqK8dyWVrwu6yY/g7U3X9+S8jux06xV4+RwKLfdnOOAwLmfX97YdL2hw1ZqT9c+5jVW99b1sWokSDK3tFHVfTUhb1vbjm/WRahEsLqSyoQds/Z+sRSI7ltmbJXiXGyWFAavZrPLlIbicaIHiUkQx1RlsfMYKaXedNL+XOD8rf8D218B6PRZgaleCjjsVL4sDpRTJ/UxrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VdSCHaio/LEF6GiarzDCwd37zIblxi0lRVAG8W+4ftQ=;
 b=Ors4nmF8DX3/lQYcKZqDAsue+IhgmlzaMqWfxeRlmxHeqfp3xt2GcJmaDiTU4dbyLAFMTNyWeRO/1miYFAmEQIjINfYhg814jhls1uzRRKQqPLH9KAv+PiDAmWNTMdgldensOHoumH1fRiKvss9owzFFTOiVzPmOrJ1flvYCmOslhEt5OleiC5VSCoi3/jVmUf9moR/0rMBr/sMq15eDwz2JMjMofjK95avVJ3vtlslsKlFbKUI51Vdm/qjVOQO5ELOghGus8xF7kcku3g2SVxJlWXXIcyMHNRDMOjQbwTku/rp1A6NnGoWDlQa0Ppso/p7w+JC9WUmVQ76Rk2iveg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VdSCHaio/LEF6GiarzDCwd37zIblxi0lRVAG8W+4ftQ=;
 b=d77+uPqoGrlfNK7fNMkpyfWt8cTzs+dNM9hcbQlNUJ6qqrS+SqIymnKm4xxTY7CtO6GL3ssTOKLy4XKu4UnsotiLNb2c+xdftBxaQnStLnpEgrcE8Ob4zrlQdvdBQJCNxSQ95dq/ZRjw6cTnHm3f9sZQrOpGpf7Yd6bxd71+Oa0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4183.namprd11.prod.outlook.com (2603:10b6:a03:18e::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20; Mon, 3 Aug
 2020 21:54:39 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3239.021; Mon, 3 Aug 2020
 21:54:39 +0000
Subject: Re: [oe] [meta-python][PATCH 07/15] python3-pychromecast: Upgrade 7.1.2 -> 7.2.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200731132230.20031-1-leon.anavi@konsulko.com>
 <20200731132230.20031-7-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <37e24d0f-aeb7-284a-daa7-1665b66c98a4@windriver.com>
Date: Mon, 3 Aug 2020 17:54:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200731132230.20031-7-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0147.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::26) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0147.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17 via Frontend Transport; Mon, 3 Aug 2020 21:54:38 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 12fbf7f6-acb9-4ce6-d043-08d837f7d1d8
X-MS-TrafficTypeDiagnostic: BY5PR11MB4183:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4183346D647F2FABE591EEC29F4D0@BY5PR11MB4183.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:285;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7PszEocO1SfSQCRrBkrXLLkEUtNeTbHGjlocftjgekpTadBQkc7FX8EzdzhQVZSfCgv4ibCrDGefVKvZZYM6jUohdyUatIaVlh5Y3YZGvy4qGBmIbd34tb0k4wBN+eAp0ouekaPwJ2IKaoU1NX5Yy5FKKRED4UIsh6S/N+yPe885yNCUCeOCauXct44eNO6qXwwwMbFeWZWHcjLJ0JG7+tz/srp8zbdUG0wjfDLFD3gxeJPnhqt9w8igZMzMY8SRNSXuHRfCf3M9pVw9yIk63pjvPfxvC3BVx6OmrlI8WcGm1DOUVzUudAGbCP9+I8QVmnz2rWrvTl6BxcqH3pTVUfIzG3FP1pyuOAnRZ/KuTocg9uag3ilxjYsO1xcwmizPxI/QVlk4Y9F3pOS0QJmb5nrYXznb4VhbIp4oc3PZuPpkBLUESbrbuW0ZpFimAxQl3qe9/t4hGXnb106LvMjVQQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(39850400004)(376002)(346002)(396003)(136003)(33964004)(52116002)(44832011)(66946007)(31696002)(66476007)(53546011)(16576012)(6666004)(36756003)(956004)(316002)(31686004)(66574015)(8936002)(8676002)(2616005)(26005)(478600001)(86362001)(5660300002)(83380400001)(16526019)(966005)(2906002)(186003)(66556008)(6486002)(166002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	Innj+MPPmzpFPMjz3GC22AWNuCVYzh+FNjKF3Pu3iVVyaJYPfRfAtbn35iDf9FJ172Wkfl9Va/sVtYwi6X8v1avqYEPP0eJy6TPfVhuep8Fur4fm3vS0imS9c1HBg5YQjc4uFuxV3uUUC/yeSvjxBpt0y+2cLk7AyRTruoJx4UcF0APJkQ6iWGvnMDvfjr4ZKQ73Y2d+6aWx9kNWKbkAw9O+xq+xnllq8GMxhvLe40Rxh12C9woIffLWe8XAUvULXt+ZfzP2yq2bRRa1Icvd6CrWM6jqtisEGiBVvtcL7PU5OU8IEsrwyGDURIv+0qDxk/QQc+Hp7zXFjL7xZgnVBOF69CWZf9J99/cEHpBa/HeKKnHX++jXzQseoWDTejjE5FuKOtUHPDTxeLYmXz8UPFbOe5R4PXsmys/WeLwwFwNfjolevi9RvkRHOfro/R6RUg3dygrYeAwl4o3mKM/TqGjIXrQwBDKBAMWwMS0Ff0AWwq6/9ZWaD/PWWRc5/e0h4ZfTQ4mgajaSGh3t5VA8zqBhz+ChysqrpHAqeifLjC1Cyorv1STiyQbE2PPSx+eS20iCpnVHCjXXNEWBKp5aJfVswt5HZveXIWL6p/LUAGYjnmboodemdtn/pVnE0LhocEbUNP8buP/fnskrZfha1w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12fbf7f6-acb9-4ce6-d043-08d837f7d1d8
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2020 21:54:39.1401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /9xbe9Xl5+4WFxMvszjr0nNB9SvN5YIbM1Lb8cBJBWIFIk/mTNyaPstH+r05X+fw+zEGFk3HkTR4MlGnYzSed5h8JxxmzUJQROU6uTEFEyE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4183
Content-Type: multipart/alternative;
 boundary="------------BD8DEDC78AE58B2BF5B0A8B8"
Content-Language: en-US

--------------BD8DEDC78AE58B2BF5B0A8B8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/31/20 9:22 AM, Leon Anavi wrote:
> Upgrade to release 7.2.0:
>
> - Allow passing an already existing zeroconf object to additional
>    functions
> - Ignore browser updates for *._sub._googlecast._tcp.local.
> - Fix return type of get_listed_chromecasts
> - Remove host and port from Chromecast object
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...n3-pychromecast_7.1.2.bb => python3-pychromecast_7.2.0.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pychromecast_7.1.2.bb => python3-pychromecast_7.2.0.bb} (66%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_7.1.2.bb b/meta-python/recipes-devtools/python/python3-pychromecast_7.2.0.bb
> similarity index 66%
> rename from meta-python/recipes-devtools/python/python3-pychromecast_7.1.2.bb
> rename to meta-python/recipes-devtools/python/python3-pychromecast_7.2.0.bb
> index 98dbf33b2..257778ba9 100644
> --- a/meta-python/recipes-devtools/python/python3-pychromecast_7.1.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-pychromecast_7.2.0.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/balloob/pychromecast"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
>   
> -SRC_URI[md5sum] = "6ca5102b09009c85424a9ab628005992"
> -SRC_URI[sha256sum] = "adcf478d7fc539e9decde59b2db7b6a4b1d679c4cf78d515d880adb1c4bc1c30"
> +SRC_URI[md5sum] = "20ed7ec024fd4739446d42f8d19813b8"
> +SRC_URI[sha256sum] = "c522c5ecb554471ca8e5690c05530b1c237c301349061d3839c506984f8d3c2d"
>   
>   PYPI_PACKAGE = "PyChromecast"
>   
>
> 

--------------BD8DEDC78AE58B2BF5B0A8B8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/31/20 9:22 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200731132230.20031-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 7.2.0:

- Allow passing an already existing zeroconf object to additional
  functions
- Ignore browser updates for *._sub._googlecast._tcp.local.
- Fix return type of get_listed_chromecasts
- Remove host and port from Chromecast object

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200731132230.20031-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...n3-pychromecast_7.1.2.bb =&gt; python3-pychromecast_7.2.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pychromecast_7.1.2.bb =&gt; python3-pychromecast_7.2.0.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_7.1.2.bb b/meta-python/recipes-devtools/python/python3-pychromecast_7.2.0.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-pychromecast_7.1.2.bb
rename to meta-python/recipes-devtools/python/python3-pychromecast_7.2.0.bb
index 98dbf33b2..257778ba9 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_7.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_7.2.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/balloob/pychromecast">&quot;https://github.com/balloob/pychromecast&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5">&quot;file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5&quot;</a>
 
-SRC_URI[md5sum] = &quot;6ca5102b09009c85424a9ab628005992&quot;
-SRC_URI[sha256sum] = &quot;adcf478d7fc539e9decde59b2db7b6a4b1d679c4cf78d515d880adb1c4bc1c30&quot;
+SRC_URI[md5sum] = &quot;20ed7ec024fd4739446d42f8d19813b8&quot;
+SRC_URI[sha256sum] = &quot;c522c5ecb554471ca8e5690c05530b1c237c301349061d3839c506984f8d3c2d&quot;
 
 PYPI_PACKAGE = &quot;PyChromecast&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------BD8DEDC78AE58B2BF5B0A8B8--

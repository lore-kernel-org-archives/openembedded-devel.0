Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.41])
 by mx.groups.io with SMTP id smtpd.web11.5012.1594857195415053946
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2020 16:53:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=P1Qx1EMx;
 spf=pass (domain: windriver.com, ip: 40.107.244.41, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L0CH/EjNgnR7E5DzUUcCjeUgSeJZVk1ZPVr5BszAa8wQ9sEi084mepMqzOD+Ui4WLKSD6p6SbMDVQE9m6BP8jVW8KdKlnyt2+uzcjAv00/Qjem8kdBsuZUoURqxDap7I1vE6CEwPWSRX0+Vgg2zJJ/yBSMS/dxm5N+YdhLeNYzxxCfS2IUAaIB6ZCttJU1kxBHxEfU2AuyDsCQzGMrcoxkil0KAab43JkZTfjJue1bH7lfrNDsdHwMJD60/fgWYWrmC+lQ7FPuTlbbUku8vqvMTF6Du69LsHwkKagCu+WR6M9ld+J/D79JLNusRoB+tC8TEMpVZVhNv26+PSaZksjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WPPsnS4J0Gop4fJZgoQ6HahzRwZrrGwB8rEHiSBNRqc=;
 b=Hj4CfAKBolzN02CSV9tUHemNwsugtEgZGfQ+POZNFay/r7F8mzVqQWMLLwftckTrKcTFgT03gCPwHZfnG9kpM8h/U5voTuHKdLJLZyGlXia1EF+QZEhbffkAQPNxAYMyDMJrDBj4qTE0mPZp/puWQJnszKQ5J2UOeHHtp6KFK2FvmWqHuiFAerO+Gyftl4Y9wYqgqITOVJ2RpWqiP+TfBLqnWHalmEQJFiEXBsUaIRU29BcRv7u+mFSgqSUytTCUkyHMMwD1rgOHkQHWy8MkK6srHhBdkXkodEoKq9P7BPzWPOHd7Tj3uYaJDJgS/Gq9p0T/Yf60ar+XbQPfpXf0gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WPPsnS4J0Gop4fJZgoQ6HahzRwZrrGwB8rEHiSBNRqc=;
 b=P1Qx1EMxVQJvML23bSCv51sdDS31OMSseAOAOhVKRweC3HfjMGnLqXZ6Dht2YXb2C5NELK2iL70nLj2SeQ5m5UpLYnXerjXQOP44a1FakBCxo+hYsBqt+ayoGZZeNIx44QXb5Y/dAGCXdatxZxTd7SKG/kXhP073acxAh+UDu6M=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CY4PR11MB0006.namprd11.prod.outlook.com (2603:10b6:910:7b::18)
 by CY4PR11MB0055.namprd11.prod.outlook.com (2603:10b6:910:76::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.24; Wed, 15 Jul
 2020 23:53:14 +0000
Received: from CY4PR11MB0006.namprd11.prod.outlook.com
 ([fe80::f422:a1ed:36f3:82d4]) by CY4PR11MB0006.namprd11.prod.outlook.com
 ([fe80::f422:a1ed:36f3:82d4%7]) with mapi id 15.20.3195.018; Wed, 15 Jul 2020
 23:53:14 +0000
Subject: Re: [oe] [meta-python][PATCH 4/5] python3-gnupg: add new package
To: akuster <akuster808@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20200711031932.5883-1-akuster808@gmail.com>
 <20200711031932.5883-4-akuster808@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <a7bd24e7-e00f-27dc-da9e-b0d4247d6a81@windriver.com>
Date: Wed, 15 Jul 2020 19:53:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200711031932.5883-4-akuster808@gmail.com>
X-ClientProxiedBy: YT1PR01CA0076.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::15) To CY4PR11MB0006.namprd11.prod.outlook.com
 (2603:10b6:910:7b::18)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0076.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18 via Frontend Transport; Wed, 15 Jul 2020 23:53:13 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80e375a3-93d0-49d1-af05-08d8291a3cd7
X-MS-TrafficTypeDiagnostic: CY4PR11MB0055:
X-Microsoft-Antispam-PRVS: 
	<CY4PR11MB0055ED011FB2CD514D547B8C9F7E0@CY4PR11MB0055.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SDi3uVerIuA2iNDdJl1/FfhAa1rHTRXBK2qv6m5SlUQTegoAH4k8YK2y5zVkuNFQ7QL1tiuM6DoR8Y9dcrd/B/k22zbeCIOecBXvqPBejVLFXBt/Bdtjgi8BK0R0+qhG9SoQWj09XGkXM7jj2cwy64iali07pn/1DX+ECyiKo1WWL/dX2ZaYnizK6Mmo5el6QD9qQA4CQ0FDirqgjmVrjxq77Pr9yCmfwd/A8GUWzoaljWUfJuQDTprB9xKbjz9ptmI2a3KOe8Bbk48leXOTqm4oKGZb16CMJkk+bb8Lmq4K94qw1KQHLAI1tbSMfFMAloDuqy+XFI4Vd1n7xCMjWlKnZ8iaLhgde2HrbBtkYAiuOOTs7/smxBC3bu52gNHE5TI6aLAgZJ38tPtcNFahkyf+e9j/T7qLyDFs68ESyPyX260LLecwtMrICMmIzgX7qjR845pmWEbwKOm+Hr44jQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR11MB0006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(346002)(366004)(39850400004)(396003)(136003)(86362001)(316002)(8936002)(31696002)(2906002)(5660300002)(478600001)(16576012)(166002)(966005)(36756003)(31686004)(8676002)(186003)(956004)(16526019)(52116002)(44832011)(66946007)(83380400001)(6486002)(66476007)(26005)(2616005)(33964004)(53546011)(66556008)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	5Ll8GMqtuB6DW+Hf6ZjHnN4NSvDhHVJvF25MpC4kHxK3rSM2VnQnW0E8VLCsRmRHE8MmgbCnXNF3HWBvNQgRYrkorLTVByEtqUORy0GQyUv+7fz9vULp7dmy2xNMnp3l3SXYH8I3YG3va2fSXEAb/hhKNSW2JtXS0iNaCx5aZh/m1WwnK4ETR7l4QtitgUe4qqRa/u6k569H6Quf+MUeh/a/MqUewYxFEWJXEmDmiDqyMZdphmqu9hXrAjhhfOGNNqZIxn9I0OPdxeR+qi69xFUD+lgatT/dkynz/wRcYDPoV+iItqhZge+a2uoilpibSc6e7Y6ey0DgWOrMfMFNmmtBo2PHTjy1wsUPhKfW2a20KdI50YamHcTtj27q7t15iYigd9deHsA90WjEXqAaKHUSOmOI4wLOXb7j2Vy95ocsuHCdJitkK0vshj2/0Fc22r0EP7Ljl9FGplS8HGS3t2Ij0uKe7jFfazCaR80kydw=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80e375a3-93d0-49d1-af05-08d8291a3cd7
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB0006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2020 23:53:14.4558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4FVn0MCmnxbZDbEGtKJA7gpSOtGrWwuMgDsIDqv2WNhfTXWGJzuPsb+zsA3cLqlPWNa1Hjz8RHv10uUBX17CUMvT6iTNlz9MA/7bgva9qko=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB0055
Content-Type: multipart/alternative;
 boundary="------------731C3EBEAF33239D82E69A73"
Content-Language: en-US

--------------731C3EBEAF33239D82E69A73
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/10/20 11:19 PM, akuster wrote:
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python3-gnupg_0.4.6.bb    | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-gnupg_0.4.6.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-gnupg_0.4.6.bb b/meta-python/recipes-devtools/python/python3-gnupg_0.4.6.bb
> new file mode 100644
> index 0000000000..ff0a91c6f6
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-gnupg_0.4.6.bb
> @@ -0,0 +1,11 @@
> +SUMMARY = "A wrapper for the Gnu Privacy Guard (GPG or GnuPG)"
> +SECTION = "devel/python"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b0b7ac63b60085b23fa9f7e1951daa1d"
> +
> +PYPI_PACKAGE = "python-gnupg"
> +SRC_URI[sha256sum] = "3aa0884b3bd414652c2385b9df39e7b87272c2eca1b8fcc3089bc9e58652019a"
> +
> +inherit pypi setuptools3
> +
> +RDEPENDS_${PN} +=  "gnupg-gpg"
>
> 

--------------731C3EBEAF33239D82E69A73
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
    <blockquote type="cite" cite="mid:20200711031932.5883-4-akuster808@gmail.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Armin Kuster <a class="moz-txt-link-rfc2396E" href="mailto:akuster808@gmail.com">&lt;akuster808@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200711031932.5883-4-akuster808@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python3-gnupg_0.4.6.bb    | 11 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;
 1 file changed, 11 insertions(&#43;)
 create mode 100644 meta-python/recipes-devtools/python/python3-gnupg_0.4.6.bb

diff --git a/meta-python/recipes-devtools/python/python3-gnupg_0.4.6.bb b/meta-python/recipes-devtools/python/python3-gnupg_0.4.6.bb
new file mode 100644
index 0000000000..ff0a91c6f6
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-gnupg_0.4.6.bb
@@ -0,0 &#43;1,11 @@
&#43;SUMMARY = &quot;A wrapper for the Gnu Privacy Guard (GPG or GnuPG)&quot;
&#43;SECTION = &quot;devel/python&quot;
&#43;LICENSE = &quot;BSD&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=b0b7ac63b60085b23fa9f7e1951daa1d">&quot;file://LICENSE.txt;md5=b0b7ac63b60085b23fa9f7e1951daa1d&quot;</a>
&#43;
&#43;PYPI_PACKAGE = &quot;python-gnupg&quot;
&#43;SRC_URI[sha256sum] = &quot;3aa0884b3bd414652c2385b9df39e7b87272c2eca1b8fcc3089bc9e58652019a&quot;
&#43;
&#43;inherit pypi setuptools3
&#43;
&#43;RDEPENDS_${PN} &#43;=  &quot;gnupg-gpg&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------731C3EBEAF33239D82E69A73--

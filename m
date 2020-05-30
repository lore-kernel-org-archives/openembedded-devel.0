Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.79])
 by mx.groups.io with SMTP id smtpd.web12.9993.1590847621563767695
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 May 2020 07:07:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=GwSraQ6i;
 spf=pass (domain: windriver.com, ip: 40.107.93.79, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IgYUagDEGVKEt+lzI+Si3T8v5a503kBE8eM8kYg6Tez0l5MZh1lpoOENqMahruwSTUZJXoOqAv06S5YEGAAdx5D1k5ZquBu2EjIiaAgpk3KCJjiCMuAPPQV0b2v+euSvgyAod2a1dK7U3YzjQSqx5AjFmiyqT5G42MJfc44W9uUCGzxrEyAuv8B0ZQ6KpSyMQmFGl30HrM18Z3ihzleT5UdXeZYx2+9DXJ3+7WpKqFiXN707jwY/eZEXro6G0rzmDd4KEvW/6LNw1nQ1PxrJRIzI0CrsfOXUJaoINZi2e0m7bCdlgoZFB/Ix/gSjm0ZbObpGtDcUD/6nos/MUdpjIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7mPyNAoMNM9QsrvjX36kjt3flaC76PSPgeTfVEDotdw=;
 b=WIW7FSTbeoou6f7tXxqSWLi+s0xcRqdC3eHDjE0wJUTNC8PgktXJnfnL8LhNFtiJ42/Tl2qBfaWQvPoX9NsUAXShePLR/DQU3C09c7ZawauwQXUh8zxaqaa+L8SXm2tRKqGrQZlFzxN8CpNoMaJKwywRXAD9Zkx9Nbb8XypKMIP382Ezk2wFtSkOpUtgRu0Gp+y6KbiF2SqFlNiyh+iMzB+kn34SY+L+U8fPUYxUHspP6CzLPoKwbGtMTdjEXMT5R3GrOka1VOENK1dTbPjNWpO6Pxn9Ll44YS3lzmoLb5dd/jicLIaRE3mLNX12bD4iLHeYOH93jG0UcfwhLuhJYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7mPyNAoMNM9QsrvjX36kjt3flaC76PSPgeTfVEDotdw=;
 b=GwSraQ6i2JusYV6WIa+Q13RrevaLdjM11mM3LCQuSdIdP/t+1gBXDCg8o0YtYqjCvHDL2v+TigbvwabMv0ZBn54PuRtyxlJaAzrB20fQpbqxY+QY4Re50l3Bntv23RtrE3aGUu08PydeDUltxZarpG/RmuGpcfNSiQ8JZNILeBc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1521.namprd11.prod.outlook.com (2603:10b6:405:e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.24; Sat, 30 May
 2020 14:07:00 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3045.018; Sat, 30 May 2020
 14:07:00 +0000
Subject: Re: [oe] [meta-python][PATCH 2/2] python3-imageio: Upgrade 2.6.0 -> 2.8.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200528143610.30650-1-leon.anavi@konsulko.com>
 <20200528143610.30650-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <2f72f3e1-3d88-11a2-6f99-3bf9ba904790@windriver.com>
Date: Sat, 30 May 2020 10:06:58 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200528143610.30650-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0139.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::18) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0139.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend Transport; Sat, 30 May 2020 14:07:00 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff9a59af-24ea-4094-e4d1-08d804a2b8af
X-MS-TrafficTypeDiagnostic: BN6PR11MB1521:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB1521688E763B214D50F07C029F8C0@BN6PR11MB1521.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:546;
X-Forefront-PRVS: 041963B986
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Qyp3EItF7JQtoOC7c3Ht5hY7LcbFT2PXhQDIIk4iBAwKDnPNZQaxJNN2Pp96/LuVNCA9dnzuiNEduFdir278Zkmq6nL72njkBdtS1eVYroKUUZvkwFcytd5AX/1eNTLglLebXGUfR9x2hCZcBU8iVUL58KEA1giPBJd7kDgZSvqzY1W8Umjz1Jje4HV1ZDzuA0RP99nXR6qSlv7gDo4Xzd2kIRJ913J3bDOlpI0t0M1naZOptvXrkzxDfLtcWXhR6ycC9PoUHCQFjnRWQ2OtLR8CmOg8uQZGghog8oUnmR1KDzZCDVG70KNchOh7OO7A/yZhH52vNgvzj4iYCD5KsDD0ghQ00eGmABqs0cx5JEprqbzFDkuuS39lF2B9GpEJWgn4amPRxSxPFc0Ce/lmt+TxkwXUa+wVcMWdsDmSWc+CCY2RQr5e61VWwqulDLjBhyUkwId+IsJ100HPgO8dhQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(366004)(396003)(376002)(136003)(346002)(2906002)(66476007)(66556008)(2616005)(956004)(8936002)(36756003)(83380400001)(8676002)(44832011)(5660300002)(478600001)(966005)(31696002)(6486002)(66946007)(86362001)(166002)(33964004)(16576012)(52116002)(186003)(16526019)(31686004)(316002)(53546011)(26005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	lnMrC/Kp+66gRs501NAN8K8nZDp9LpU6f9rvubqhqg87+jc9/dWeN0tYI0+hFR9WW05gcmcGMZchdWG3TBeFws+vKI8I0p2RqV+z4g1TqpREHvgV9cS8QLt6ohYjrDRX3eYXmBOS6LHwNGW1r1LPI7FZSWXxq4Rho855M/6cNFQS+jcfrUYmciNA5RXeycNe4BtvIk+174NMQ12OrQtqsgTFZcMIeEuvd0gtVOrf5qoh1egk+JlrN0ldnzpvbvlo0LfP+BD9E5WElSaGJ1krhN/8dwyhWd2AqeZtS/8zGFBw8GKSdtTnihJOTTSSQ7aTWdAJSksc9/0mlcfM1qD6yq63DTaKdIqLqtm+kH3zeL4s7gUh2OHFAzogY2jjHZ6mk+W2l9vOVK2pq1vjaCLhr8/SYntmUAb8+KkxI1XYeE/rABJvO1Mcd5cTc4XRPZx1JHvTgOp+0SY6m5A2n+aU2QdebH8NYrgOrKafGht88U0=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff9a59af-24ea-4094-e4d1-08d804a2b8af
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2020 14:07:00.4729
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zk3UCzStPI27E5DM4W/xxcCzysjvpJCxEDE3bSh1mzqwDLAliKDwpvDRH1mSLLehc38BcTIQRHkQb2OcaKg0O9QTJrpKW4eyxdlurwoe74s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1521
Content-Type: multipart/alternative;
 boundary="------------19D32CE4AAC659A377C88705"
Content-Language: en-US

--------------19D32CE4AAC659A377C88705
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/28/20 10:36 AM, Leon Anavi wrote:
> Upgrade to release 2.8.0 and get the source from pypi.org.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...thon3-imageio_2.6.0.bb => python3-imageio_2.8.0.bb} | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-imageio_2.6.0.bb => python3-imageio_2.8.0.bb} (54%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.6.0.bb b/meta-python/recipes-devtools/python/python3-imageio_2.8.0.bb
> similarity index 54%
> rename from meta-python/recipes-devtools/python/python3-imageio_2.6.0.bb
> rename to meta-python/recipes-devtools/python/python3-imageio_2.8.0.bb
> index 8fe4b988d..9ca30f424 100644
> --- a/meta-python/recipes-devtools/python/python3-imageio_2.6.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-imageio_2.8.0.bb
> @@ -3,12 +3,12 @@ write a wide range of image data, including animated images, video, \
>   volumetric data, and scientific formats."
>   SECTION = "devel/python"
>   LICENSE = "BSD-2-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=d8b7fdd0dff0fd18f35c05365d3d7bf7"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=7b9bbbb543b6af3e6b53f9b7fb68f71d"
>   
> -SRC_URI = "git://github.com/imageio/imageio.git;protocol=https"
> -SRCREV = "0b161649b3ee108f80bd99466aeab2e65cf82cd8"
> -S = "${WORKDIR}/git"
>   
> -inherit setuptools3
> +SRC_URI[md5sum] = "1e270dbf24c0390c2f4e3e4120904ac0"
> +SRC_URI[sha256sum] = "fb5fd6d3d17126bbaac9af29fe340e2c97a196eb9416d4f28c0e543744a152cf"
> +
> +inherit pypi setuptools3
>   
>   RDEPENDS_${PN} = "python3-numpy python3-pillow"
>
> 

--------------19D32CE4AAC659A377C88705
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/28/20 10:36 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200528143610.30650-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 2.8.0 and get the source from pypi.org.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200528143610.30650-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...thon3-imageio_2.6.0.bb =&gt; python3-imageio_2.8.0.bb} | 10 &#43;&#43;&#43;&#43;&#43;-----
 1 file changed, 5 insertions(&#43;), 5 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-imageio_2.6.0.bb =&gt; python3-imageio_2.8.0.bb} (54%)

diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.6.0.bb b/meta-python/recipes-devtools/python/python3-imageio_2.8.0.bb
similarity index 54%
rename from meta-python/recipes-devtools/python/python3-imageio_2.6.0.bb
rename to meta-python/recipes-devtools/python/python3-imageio_2.8.0.bb
index 8fe4b988d..9ca30f424 100644
--- a/meta-python/recipes-devtools/python/python3-imageio_2.6.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-imageio_2.8.0.bb
@@ -3,12 &#43;3,12 @@ write a wide range of image data, including animated images, video, \
 volumetric data, and scientific formats.&quot;
 SECTION = &quot;devel/python&quot;
 LICENSE = &quot;BSD-2-Clause&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=d8b7fdd0dff0fd18f35c05365d3d7bf7">&quot;file://LICENSE;md5=d8b7fdd0dff0fd18f35c05365d3d7bf7&quot;</a>
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=7b9bbbb543b6af3e6b53f9b7fb68f71d">&quot;file://LICENSE;md5=7b9bbbb543b6af3e6b53f9b7fb68f71d&quot;</a>
 
-SRC_URI = &quot;git://github.com/imageio/imageio.git;protocol=https&quot;
-SRCREV = &quot;0b161649b3ee108f80bd99466aeab2e65cf82cd8&quot;
-S = &quot;${WORKDIR}/git&quot;
 
-inherit setuptools3
&#43;SRC_URI[md5sum] = &quot;1e270dbf24c0390c2f4e3e4120904ac0&quot;
&#43;SRC_URI[sha256sum] = &quot;fb5fd6d3d17126bbaac9af29fe340e2c97a196eb9416d4f28c0e543744a152cf&quot;
&#43;
&#43;inherit pypi setuptools3
 
 RDEPENDS_${PN} = &quot;python3-numpy python3-pillow&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------19D32CE4AAC659A377C88705--

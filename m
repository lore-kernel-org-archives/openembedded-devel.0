Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.76])
 by mx.groups.io with SMTP id smtpd.web12.2307.1590098437011833230
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 May 2020 15:00:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=fozsX0XR;
 spf=pass (domain: windriver.com, ip: 40.107.220.76, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QrxfziyRI11gD6cNKWR3cOJjWUXpw/k6YtEnuS9ObcZEo6BHSqSPedV7YJ7OTl2HgS2mCV8sKsQeQzf/Yn9ZLOylbbs11Gu6G69D30iVqUAOwY3q1pSTJygef3f2HslRn8QcH1fgZ6VW5B36vsgkwdy2CGApZv3TT46c220HUfi4oFdLwaeLCo4gbekP1vFNwsx6uFHBJ+dBPCrgVHKFfRrXBFhnW/3l9yppl7ZqusBTyLMwIEv/BWWHvTq5FdG0qe2dylo9EBecn1N64MHWxjTMGwwG8Kq6h857zs0yLmiUoxazIF5yrBhGtU2A26Bn/95T97S39M4wmrGhi821Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2RTy+/VC0LE4WCYWuxT47rEcfw0KzwoSZKqLaGcLM1Y=;
 b=keAipSMdQHjsyCYE8CSb79JJxdCXz+btHSVsh+983tsq4GEoTa+mHVDl43Cdu92XTRUBDu6t9XawUgfexOJGqgdBw4ALIspvDE3jMi8hC952vvBqsYY1PBzx2sNPboyJff1FyTYY2Jpvqp2Z+gXTZq0tXs+qMSkXJGyNSBAXs4gePUx1iJ7TY6G0UrPkJEf01VTyCGBwlWl4Vyq1g2EektbCSrvDlgaMtA5KX5Vo9ehc6/gbZiCFyiYFtwDmia3/sgsMMQLgVGLmip9gptqSM9Yis+LwZwTxEBNBzhHY89OpBWB99KIc1HcIUrAj97U358vCTcPk4sQJ/uFKyCrBzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2RTy+/VC0LE4WCYWuxT47rEcfw0KzwoSZKqLaGcLM1Y=;
 b=fozsX0XRuCjwPzi/icD06neVkYvaWChABQmo521et9Q2h+E74Q5Cd4lIZBsgH+qkup67Q/014gcLSgnEfe0f4m9/4GLAAIxS2H3KW14/gsxDFVnp0Kmwef+WJar1xSkALbXEBNFjjl1CqKKMQjGuMPnWqns5HYP4hcSvvrSLVu0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1780.namprd11.prod.outlook.com (2603:10b6:404:103::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Thu, 21 May
 2020 22:00:35 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3000.022; Thu, 21 May 2020
 22:00:35 +0000
Subject: Re: [oe] [PATCH] python3-ansicolors: Add recipe version 1.1.8
To: Domarys Correa <domarys.correa@ossystems.com.br>,
 openembedded-devel@lists.openembedded.org
References: <20200520203217.26010-1-domarys.correa@ossystems.com.br>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <69d25aad-d73d-27dc-89d1-af7b42a47dfc@windriver.com>
Date: Thu, 21 May 2020 18:00:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200520203217.26010-1-domarys.correa@ossystems.com.br>
X-ClientProxiedBy: YT1PR01CA0128.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::7) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0128.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27 via Frontend Transport; Thu, 21 May 2020 22:00:35 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80ad65c8-d1f3-4b36-1f28-08d7fdd263e2
X-MS-TrafficTypeDiagnostic: BN6PR11MB1780:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB178003D1E6D47DF5CCD932379FB70@BN6PR11MB1780.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:247;
X-Forefront-PRVS: 041032FF37
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SGWCMAcSIWI/NQvI+2DJeEkJWsK57eoNJXQJuS5REWebg3yeMfproPAOy+l6MnYZK6aKr6T9thatKhY6Z8PXnf+T5Cwo7GFNPTaHium1SShtG3xl6PNyzaWnGBIJkClHTxuDayZ9hk1BS07pwglPdEfFe4cjzoC0C4m6F99xCZFJd9k0WwuD13xjlMpnnNUu0xMH8hnm3GmPGcheRGpWTraZOe6dszE1F3Jj6JXw8npgqN0ezsiQE/6Tso1u5NYDJv7AEEAfHouuQR8eCE/BOx4T/d21Xxe5rSY/BnyNxyz23p6dBsUQaCe9xX6mtZr/30ykrymFPJlymbg+DIphYOv9GWfWCJRmVrJmKKfz5AmS6ykPxcVXYsRc0UYqhzSiyuU/y7L7ZaJAUEJoJsTfFo0FTETCIzlKrgj7aNjMJeDocbUHvdNtCI2qrspUEpV5qMBzr3/y0GuBFf8OOZS1bw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(376002)(136003)(39850400004)(366004)(396003)(8936002)(66476007)(66556008)(66946007)(36756003)(956004)(44832011)(966005)(2616005)(16526019)(31686004)(186003)(16576012)(5660300002)(8676002)(478600001)(316002)(26005)(31696002)(86362001)(6486002)(2906002)(52116002)(166002)(33964004)(53546011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	MV8XNfJZs/Wtbejor4qeIVK/IOxBRHfCBfY5GnRAAR2F2GRqGi/Xa7PsoKiS6GrJG7Jliy1+u6I69ctAKJcZT6z34IPMOvS50jl44wkJKpvlJ76kaJODmBpoevA522LsIzVCOWB6EogkuylhydK2U0N99zvsjtYyN433NSD2sL2MmvS9arUB53GB22nZlGrRKPDB6Pw9lrcwS/XlSMKssaaGqPRA6YRnDLZSMBi8B/hU6oP+m71pSawrmZHV6aIKHgrv2dZKbyByuZTxzgPEKpigzO0NBr+Cny3GhiFdq50rrLFk0O1ugzU1sZxeTxauW+bZ4nr2EITamgNVJQZa8Dz+Ficx+TEPkYr0G1pCStLeYCndAUUJQ91Fw1IzG+F0cFT0U9Eipj+qIHvZ7OjV3c0e1uqweh9Sf1EEqDpPng/JktkjvFagwYjASF8OToPIT2gyLkTxg3HR4aAljdd4pblUi8yROzlIH7Q4eekXnM9HVS4d4FByGMjmmGyk0l2m
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80ad65c8-d1f3-4b36-1f28-08d7fdd263e2
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2020 22:00:35.9036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b5x/Qa7srmwXQeRo8LbZNUaHjamxfjFpHMFvyI8abf4cTYlhUkxs59Qi5cb9dujQ2IZBIDxFILnOg0VXq9hnsQQLPcTfCjZTRqUrOW66hs0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1780
Content-Type: multipart/alternative;
 boundary="------------A4012E2FFB47A18B84ECDE02"
Content-Language: en-US

--------------A4012E2FFB47A18B84ECDE02
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/20/20 4:32 PM, Domarys Correa wrote:
> Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-ansicolors_1.1.8.bb               | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-ansicolors_1.1.8.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-ansicolors_1.1.8.bb b/meta-python/recipes-devtools/python/python3-ansicolors_1.1.8.bb
> new file mode 100644
> index 000000000..9ba710cb7
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-ansicolors_1.1.8.bb
> @@ -0,0 +1,12 @@
> +DESCRIPTION = "Add ANSI colors and decorations to your strings"
> +
> +LICENSE = "ISC"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=aef5566ac4fede9815eccf124c281317"
> +
> +SRC_URI[sha256sum] = "99f94f5e3348a0bcd43c82e5fc4414013ccc19d70bd939ad71e0133ce9c372e0"
> +
> +PYPI_PACKAGE_EXT = "zip"
> +
> +inherit pypi setuptools3
> +
> +BBCLASSEXTEND = "native nativesdk"
>
> 

--------------A4012E2FFB47A18B84ECDE02
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/20/20 4:32 PM, Domarys Correa
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200520203217.26010-1-domarys.correa@ossystems.com.br">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Domarys Correa <a class="moz-txt-link-rfc2396E" href="mailto:domarys.correa@ossystems.com.br">&lt;domarys.correa@ossystems.com.br&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200520203217.26010-1-domarys.correa@ossystems.com.br">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-ansicolors_1.1.8.bb               | 12 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;
 1 file changed, 12 insertions(&#43;)
 create mode 100644 meta-python/recipes-devtools/python/python3-ansicolors_1.1.8.bb

diff --git a/meta-python/recipes-devtools/python/python3-ansicolors_1.1.8.bb b/meta-python/recipes-devtools/python/python3-ansicolors_1.1.8.bb
new file mode 100644
index 000000000..9ba710cb7
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-ansicolors_1.1.8.bb
@@ -0,0 &#43;1,12 @@
&#43;DESCRIPTION = &quot;Add ANSI colors and decorations to your strings&quot;
&#43;
&#43;LICENSE = &quot;ISC&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=aef5566ac4fede9815eccf124c281317">&quot;file://LICENSE;md5=aef5566ac4fede9815eccf124c281317&quot;</a>
&#43;
&#43;SRC_URI[sha256sum] = &quot;99f94f5e3348a0bcd43c82e5fc4414013ccc19d70bd939ad71e0133ce9c372e0&quot;
&#43;
&#43;PYPI_PACKAGE_EXT = &quot;zip&quot;
&#43;
&#43;inherit pypi setuptools3
&#43;
&#43;BBCLASSEXTEND = &quot;native nativesdk&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------A4012E2FFB47A18B84ECDE02--

Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.58])
 by mx.groups.io with SMTP id smtpd.web12.13548.1616422463798372830
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Mar 2021 07:14:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=jGh7lwgJ;
 spf=pass (domain: windriver.com, ip: 40.107.93.58, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UZiZsYsObeXvT5/xAOdvMOOq+AlouQQ5O41Y51miMq4Z0kleGwJQjvyeMey9K9zp+U3msDwhWdF2RBiONE0moyyovqkQ2eSZkIelI9R7jmD2/AKtV+j85s+WCLq21vY6svBWU4w+rxndrUiqLGY87V+hM7cocoioanSrZ00gRVe3+BFcEEBLqIFqrVA12JiDSCPtJT0YewNJfNlcaFCPBMFbleXhGA3VHnQnAsIr5pXcqsg85HPqS5meGPW8dUV9EqwbJ5cTt0fq4pun83WIoZF+pi3D0vSKWqyYKZD8xBhmJS40apQSS9QbFvSlNMTzj9e4ckEme3cegwLgucItFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r2FcooB1zioBVFaXP4WHLMAGiMcU8LAfg20qoOW+4Ro=;
 b=XcW8EKBFvNN8xiCGOIdV6Th6qmwTxRVDe8T/ZbdJBeh54TYe9fo/IpeyoXJoCPDWB1vwoLEb38cLoZCTK/Exk6znvLfosZAm0+X53hTLjCuSf8vcxDhZDetS5vcjt2aPJx0Zehi2nvDq28CCV9E6sKIszCFSq9C6p6s3wIY/WTE+d9JCvAvSGa8V4sSVrJWdPKzBFJqFZSczN+RV2plA+2iWEkyjgl/GdxWdlKE2n7rcH/iBjBI8rw0TgPgwfbmcN7eH2Wq5FuZ9bXqESTTIGleIZ9d8m47/zkXyuZS10Y4XWRseexNhsJ2JLPzxbSVPEqm7EIo1g6XR6/AK3J2rLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r2FcooB1zioBVFaXP4WHLMAGiMcU8LAfg20qoOW+4Ro=;
 b=jGh7lwgJ/V3hvIZxpjGZ2j4iIAEdCSBpAPMzVCwh4gi8E+Y5qCFRZ/O1Z+q9ZQzHDNb3VOL2mpV40ocrDJx/Zxz7hauLdGlUo2OvU426vlnGHqeATLVKB4WEL1AJbV+eiBHRMdBbPbSFMWNVr+kDNZxV+v/dnstBHMdHKU8vFNY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB5053.namprd11.prod.outlook.com (2603:10b6:a03:2af::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 14:14:21 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::89c3:3b4d:43c5:ae76]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::89c3:3b4d:43c5:ae76%5]) with mapi id 15.20.3955.025; Mon, 22 Mar 2021
 14:14:21 +0000
Subject: Re: [oe] [meta-python][PATCH 1/3] python3-spidev: Remove recipe for 3.2
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20210318064853.1268-1-raj.khem@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <f370edd2-1aa5-9027-2c01-dc01b7d8a40a@windriver.com>
Date: Mon, 22 Mar 2021 10:14:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210318064853.1268-1-raj.khem@gmail.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN9PR03CA0862.namprd03.prod.outlook.com
 (2603:10b6:408:13d::27) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN9PR03CA0862.namprd03.prod.outlook.com (2603:10b6:408:13d::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Mon, 22 Mar 2021 14:14:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10868c7a-78d0-4f4a-3f87-08d8ed3cc971
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5053:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB5053FF2270AB5B92FCF1044D9F659@SJ0PR11MB5053.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	J3v48Bg4u26cnz5PgT+KbnW1x8VCAUkwB7E7n9e9SmpDmDl12Sp5yqKs9qYRf1qAvTnBcDefhBk01GL/y9rJ3fjjiPfxoyrzB9fktZIenU8Ws2nG1rWsfgrlukg5BJ2x/GIrIgsrgPQHsIF6x0zgi8Ny4qIkXfii4io9Ykb8esiFrR+GC3N9xRYAuL5J/Xi+SHez9TzAGMP5RPgxcYEUWym13HLO70DhxdOupYF4nZvp3F1ZtitEgPp+ejVM/uVtFr3pAE36Sxux529sVOSvjYXKrzoE80UGGl2eQK2Prq9lGgDwS/GCMuMsG6BLVwUwVr+8fFtsK8ymv/gY0UxCjt1INreUEeQ+QfMAAghXxLiITa+pXFYyfncJyyHwZLS8ebjpFDFScXkg+DwrK+0enlpBGk4OKlLaGeWHpTTTU8v6yntOBOMyCmILmQS0pffAfYniNowsQXW8EuZkl3eGmOonz1DtnxJPeWxf+GxXEJDuRPRuDA5tuiBBXdcWwikvKqIfvxpw0ebhTv6sM9rzAivIjQSe1ffLLW8Y7CG5e91nQWQwOzh4KFzSv96fPWBJbJFP+lcfh+SASTTsa4TU+R4/uHuoLHOAoTfhevG/GkMIqL+Q97gGTgWYJXjlIwOIeJktOMI/XbGIzm8xjHxCROXK4XEJC8lcLAa8eyVJtKY9YyDsQSWUaOoE+CYCqUckUeIZ3edpH+ka3/Z2vT8uru28RM4VVhhO8D65quvWGRTxgB9W4zA7ZiUYeRatxAkXRUn7oRiVxa+P1+vl8h5mjuFNzG7wDSVhmPH4YLfUbbw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(39850400004)(136003)(376002)(396003)(5660300002)(66946007)(166002)(26005)(186003)(6666004)(478600001)(66476007)(2906002)(66556008)(956004)(966005)(2616005)(16526019)(31696002)(86362001)(8936002)(44832011)(33964004)(8676002)(16576012)(31686004)(316002)(6486002)(83380400001)(36756003)(53546011)(38100700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?SG1zUTluRW9mM1IxbmRqeFhwMGhhYkg0ektGODNPZGhQRGMxcXZ6Y1NpVXlq?=
 =?utf-8?B?c0svZFFpUXgrOEg4YUpYOE0wdUNKRnY3NmlsVThabThYNHhmd1ZQbzVORmJX?=
 =?utf-8?B?ek1oZHVYNzdOOVVUMm1vcUdiOGsvLytKL1RvSVJ2b3dHT0tqMkJkenlZZ2tO?=
 =?utf-8?B?MHp5aVgrSXRVMHpxSmxqR2JJeGs2ZHJETlFSMnFqU0NuRzA0ZitGcHZ6RGtU?=
 =?utf-8?B?ODJIOGNWWExnN1pjdGdqNmErV1loRzdlNFFzVTRuOERoM3pQOS9Zc2tJaE9I?=
 =?utf-8?B?dHh5VmlsRXlON2UvempXYzJReHlCVXZkQXFpMkNiUmNibFNQeUx1bENXNDNO?=
 =?utf-8?B?NzFUNnZjaDhJY2g3MSt4dEZXT2NSUnhmc3VvcTZsN2tJb1dEVHlqUlBnSEFD?=
 =?utf-8?B?cDZ3OHdLVFFOWTU2SGVMUVVqSm50UUlCSTc2RUp3VTUwRHZKQ3BrWUlwVWJT?=
 =?utf-8?B?QVV6S1MvZW80blM3K3p4QWdodU0yVFdJUUJyMFpHWE1ybXQ2aE5aa0RsTmMr?=
 =?utf-8?B?OGJoMnZDOTFEUWRnZnRiUnBMaFdGbjFuVEZJZEtobjRiSWZvdjZsWUYyNzR3?=
 =?utf-8?B?TWpBeGE4M1JaMnAxbFdvZHM3b25pYTYrVGxxYTcvSkF3d0NmZkNlTEp4VFNO?=
 =?utf-8?B?Vkl2NHZwOGVzVmFpVDZhR1U3bTFzRFlDSk5hRE1WNFRFdjE2S3cxV2ZBdUVh?=
 =?utf-8?B?MDJXTU5aT2JBcjYzdDlqOWpZMFIraWE0bnMwOGRtUDI1REZYNDVkSjEyVlRq?=
 =?utf-8?B?Y2RxNnhWb0tVVVE0SlhER1paZzJ2bkxyMVJleU43VHRtVUwwSmtFUzRTS1ox?=
 =?utf-8?B?dFdOTi9LVlNsbjB2clFoUXVVUVloOVlCZC9hSHVPVVZZMmd5SlBVaEsrZ251?=
 =?utf-8?B?NERkMnlva1FuQ21tMlc0bUVkSGM4LzNkZUcwR2NOUXB3UjhVSGExdzVmUjZs?=
 =?utf-8?B?NzZsRU1ZKzd5THpGNmQ5eXNibzVYSlVZRTVTcWxlL1k4UnQvU2pmK1hKcXky?=
 =?utf-8?B?Q2RXd1YveUppd0tFZW5XTS8vRStzeHNwMkRhKzhVMHkyQjd2dGx0Z25wQkJS?=
 =?utf-8?B?ZG1ybFhUcFBnam01OXJ4bWxEU0M2NWVURU1kYzlXOTc0TXRXdHZ1L2NseWs5?=
 =?utf-8?B?bHREUmttSVJSMHhWMFQ1WGZMN25YM1FGdXpUMTRlYnVSd0lnQ2thWDhYVEFX?=
 =?utf-8?B?S0FuTHBWZzlxRmVBc2pYWm96a1RRelgweXNnK1djWUh4TG1Ya0lnNFJWdjND?=
 =?utf-8?B?UDlsRXZHQVlDWjVteUkyaFVaRjFzWGVDRWVFVXFtc3JXUFRNc3B2emIrdDNx?=
 =?utf-8?B?ajFObzFReFBFM3ZLejYxWDlkTkV6ZTJvbVFSdFpnMlFXTnJzV0lCanUrQVJK?=
 =?utf-8?B?bUR1SUF6aVNrSmpQNTVPTDA5Smh3VUFpdkljS3JWY1VTdTBybkN2SEFQVFE1?=
 =?utf-8?B?NkFFTXBqVzh6OEdpOVQwdkpqbHlQN1FZT0FpY3lHaHFxcG84VHVVZk9STGFm?=
 =?utf-8?B?V3piRC9iVHF2WUIyUG1hNWcxY0dVVjBrK2ZoUDFxWm5QczJTTkFURHpRUGUz?=
 =?utf-8?B?dmp3dUlBb0RnK25Hc0dMbWtkNVRQTVhwbXAxMUJkTFhRWTUyYlBMMXdLNmRh?=
 =?utf-8?B?YlVCTmdzOHVaYWMxcnU1VkJjTkJWSWZSNHQyWUZUcVlESk1VenJOKzhqMkdm?=
 =?utf-8?B?b2V4Q0Z4bHBlMGhkRkhiOVZKRnNPc24xWXhoNmJTK1BHR3dDcXVucnk4eVVT?=
 =?utf-8?Q?h6k3QjDHCyr+/IpRWy1/78ijAXUXlAKH+LvJsp2?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10868c7a-78d0-4f4a-3f87-08d8ed3cc971
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 14:14:20.9016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3kcjrpHJjTqH3QLdfyvBOSE29mWN6da/WLLZeM6Nl1XqrW4c5AB1shUAOTd5GXtNH0pzd9O405B8/4dU6p1hB/Ip0EOV/T3OWHi4vKbhBg4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5053
Content-Type: multipart/alternative;
 boundary="------------2201EEE9CE50A40A41AC38C7"
Content-Language: en-US

--------------2201EEE9CE50A40A41AC38C7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-03-18 2:48 a.m., Khem Raj wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> 3.5 is already there
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-spidev_3.2.bb                 | 16 ----------------
>   1 file changed, 16 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python3-spidev_3.2.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-spidev_3.2.bb b/meta-python/recipes-devtools/python/python3-spidev_3.2.bb
> deleted file mode 100644
> index 65679594d3..0000000000
> --- a/meta-python/recipes-devtools/python/python3-spidev_3.2.bb
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -SUMMARY = "Python bindings for Linux SPI access through spidev"
> -DESCRIPTION = "This project contains a python module for interfacing with SPI\
> -devices from user space via the spidev linux kernel driver.\
> -This is a modified version of the code originally found\
> -[here](http://elk.informatik.fh-augsburg.de/da/da-49/trees/pyap7k/lang/py-spi)\
> -All code is GPLv2 licensed unless explicitly stated otherwise."
> -HOMEPAGE = "http://github.com/doceme/py-spidev"
> -SECTION = "devel/python"
> -LICENSE = "GPLv2"
> -LIC_FILES_CHKSUM = "file://LICENSE.md;md5=54bdb9022ebb75ab68399cdaab97da60"
> -SRCNAME = "spidev"
> -
> -SRC_URI[md5sum] = "f601676f1bb48b9aa3b3897f95216365"
> -SRC_URI[sha256sum] = "09d2b5122f0dd79910713a11f9a0020f71537224bf829916def4fffc0ea59456"
> -
> -inherit pypi setuptools3
> --
> 2.31.0
>
>
> 
>

--------------2201EEE9CE50A40A41AC38C7
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-03-18 2:48 a.m., Khem Raj
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210318064853.1268-1-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

3.5 is already there

Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20210318064853.1268-1-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-spidev_3.2.bb                 | 16 ----------------
 1 file changed, 16 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-spidev_3.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-spidev_3.2.bb b/meta-python/recipes-devtools/python/python3-spidev_3.2.bb
deleted file mode 100644
index 65679594d3..0000000000
--- a/meta-python/recipes-devtools/python/python3-spidev_3.2.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = &quot;Python bindings for Linux SPI access through spidev&quot;
-DESCRIPTION = &quot;This project contains a python module for interfacing with SPI\
-devices from user space via the spidev linux kernel driver.\
-This is a modified version of the code originally found\
-[here](<a class="moz-txt-link-freetext" href="http://elk.informatik.fh-augsburg.de/da/da-49/trees/pyap7k/lang/py-spi">http://elk.informatik.fh-augsburg.de/da/da-49/trees/pyap7k/lang/py-spi</a>)\
-All code is GPLv2 licensed unless explicitly stated otherwise.&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://github.com/doceme/py-spidev">&quot;http://github.com/doceme/py-spidev&quot;</a>
-SECTION = &quot;devel/python&quot;
-LICENSE = &quot;GPLv2&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.md;md5=54bdb9022ebb75ab68399cdaab97da60">&quot;file://LICENSE.md;md5=54bdb9022ebb75ab68399cdaab97da60&quot;</a>
-SRCNAME = &quot;spidev&quot;
-
-SRC_URI[md5sum] = &quot;f601676f1bb48b9aa3b3897f95216365&quot;
-SRC_URI[sha256sum] = &quot;09d2b5122f0dd79910713a11f9a0020f71537224bf829916def4fffc0ea59456&quot;
-
-inherit pypi setuptools3
--
2.31.0

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------2201EEE9CE50A40A41AC38C7--

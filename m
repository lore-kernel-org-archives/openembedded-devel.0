Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.70])
 by mx.groups.io with SMTP id smtpd.web11.19815.1590693868185671507
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 May 2020 12:24:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=NuvmTWOS;
 spf=pass (domain: windriver.com, ip: 40.107.93.70, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HUASyWu0wECOFhtSs0IVla5xcVCVTHth3cgggXK8PJb+0Q5X9CXzCMgrjQVXlm/uEQ+HW+SMGpMFaO45uNyg7WKKkKqPUMpmYlZ6cqBLqLusOEeFuewqMA1sDEDcySJnsSrBaYVRQJnhNVAN1gg9T9t1qzJZW6/7y/SMcQFdkTXL4k4EM3Z2ZajZUziY/svLufdbyGj3gxY5sIqIOd04xWiAFhNmxrikFCk18jkybzFbltGtntR/a9U5A8jAm9Wwe+6oO6gOumiL1B5kptOPajV5FNMNtzk0auoQs39Z7x54+9TyODpZ06f7BRtCTil0bV8Znac0a119AbLGv0e3Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZQOWKW8y37YvfOtZ8vbYu1rgwmxu1B8XkKCW0TIyaLU=;
 b=MKPmYLDLQu9+b2YJu6MfxD6CbmIkZ8CnDtVBkpX0MqOskMIn6F0uq5iXCd2g/F7O2NZebWlLiYk3rNKg4ad371JME6R3isOzKrOPUa54vkdQkaYjGC7bGSmGH7XUlxIRU1M+HM92d/ppzIhpzDFJ4c5c1pTLRyrufNPn2stxbQrvFb/9yhiuJ/RxejhY+rlk6udr59awKRBnNPSXVJvXAcnb5ffla/qYBIyX5nLw7vtXHvDa/7+rcUQucAr1lx4jPdXLe6ofghZ7atWVsBlGw5oyeGSINBrVxECOE6kVm8k+Np18m0aGwqOiW5QJQbJ9x0S0VRm9vQcS7oZlEhECpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZQOWKW8y37YvfOtZ8vbYu1rgwmxu1B8XkKCW0TIyaLU=;
 b=NuvmTWOS/CpCSHbEfQtEL6nCLECslX8E57RAzf8rSHbl+yxPVQ/kBGvSiiJxjHwf1SKcUcyXm0kc3AQDyVMIAZGfT8Y8PFrC+rZmiZ+2WZG+VIG+6XPAhMbGSbmEXQDiq0WPOwi3ozrJ4qgUfCdZah1mjq/qG2kNLg9k540LXCc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1330.namprd11.prod.outlook.com (2603:10b6:404:4a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19; Thu, 28 May
 2020 19:24:24 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3045.018; Thu, 28 May 2020
 19:24:24 +0000
Subject: Re: [oe] [meta-oe][PATCH v2] python3-pyudev: Update 0.21.0 -> 0.22.0
To: Domarys Correa <domarys.correa@ossystems.com.br>,
 openembedded-devel@lists.openembedded.org
References: <20200525210151.13741-1-domarys.correa@ossystems.com.br>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <d7a672a4-ec31-1e48-9785-a1d2cab99f4b@windriver.com>
Date: Thu, 28 May 2020 15:24:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200525210151.13741-1-domarys.correa@ossystems.com.br>
X-ClientProxiedBy: YTOPR0101CA0053.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::30) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTOPR0101CA0053.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend Transport; Thu, 28 May 2020 19:24:23 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: abdcbc73-2513-41b8-ddc0-08d8033cbad0
X-MS-TrafficTypeDiagnostic: BN6PR11MB1330:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB1330556AE77D5C8956E5C3EA9F8E0@BN6PR11MB1330.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-Forefront-PRVS: 0417A3FFD2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6+ehdeLENJOfibcX5xFw6pZROZ/60DZb0NZ6Q/QK1lGGjg8DSuvd5gMohIN1/6j+ARHiwWnUMDdxsRgko+ltWc2lUN62gFGKt7Nwp6yIVctXao/M0YGDZ9fdEOLipVzH3KwZPb2Xq7XunF4rj9jmMfDAVlOYw5qMj2oC7qp8dHsw2NNVICl8UhaYLml0jHHcvBPbP2tgl4BwD+7woM/4IPJprmcEQ4KCg/3R6LUiacExbY7fFQPUdr38Fm8LQhgZhNoSKfKCAn0jBDxNrQfNb/sTZxF2m1pBAk4SVTvvXMjpqOjiI3AGRECGF6W0rhghCXK2RlACpQeyhjKJXx0jZqKBeMVs4OHSA7La2s/wOxoeWIIjmPEoeiMfgYs0ATu3sc9sgCTm/ETZfhA9GctBxvGdLTrQQpDuYXvUxaMJsZcWgH0jmxWwvtiyvlGU+ew7jI2GARbGLTY03FrgC47B7g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(39850400004)(366004)(376002)(346002)(136003)(316002)(16526019)(66556008)(66476007)(956004)(2906002)(31686004)(186003)(86362001)(8936002)(8676002)(33964004)(53546011)(6486002)(52116002)(66946007)(5660300002)(478600001)(36756003)(31696002)(83380400001)(15650500001)(16576012)(2616005)(44832011)(166002)(26005)(966005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	B2SMVsTjmr1O8GoCVbMKnIU6wezeuf9FOGSg85hTA9HZFJ/MjM3rZ8b/mKgVYyIHJ8X3iAXZR7zG96Ue0TuDlllvHh0//+gAhrxJsuyZRKNRw3CIDtMNnFDBw+/TuWxIjI7JN5Z+HocRfOsLCv/kJDNuGBK17ZsGNKPjGtmlaLdB0ELV4y+kUkCIi7aJGH1iIwymFCrLsW+RC+kOpKtOBFIM+XNOIxsnRBqKaKyxNLfGzwr1UrC8dtOc8SnhAAcza8ALSFUv4CV5FUpEaXdqGF5CC1rWxJb8K45B7rEGHiqVk6PTZwHeVDrf074Qvru7vEdaDOyM1jsoBCCbq7e195nbddSxVZVNuAnqwuZBiFHI+r/B4bqwR8rVLSh7JUJAsgwwXfEhtDKqqt313KGYkFEh3K7u46yDh9HTiXbEAoOZlc+4hTcfbV9Xw87NFuuBBbz0SvSZqYzzIstRLFXN3s3EYgTQIPfbCVIK1T0pgHhkQWL/BFCiPlvlonzSpey1
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abdcbc73-2513-41b8-ddc0-08d8033cbad0
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2020 19:24:24.2327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fi6EBnDf8YshXmUtnS/gis3X9KXRXIcoE1F8NfEuopAINtAh7GyFPjyOn0RQsICXfyIxk0m+2xEUYkIhuuMoPTEbOT3nKPLxBVFUP4c6ZG8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1330
Content-Type: multipart/alternative;
 boundary="------------791D8D20245BE89B163B4016"
Content-Language: en-US

--------------791D8D20245BE89B163B4016
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/25/20 5:01 PM, Domarys Correa wrote:
> Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
> v1 had problems to be added to the master-next due to lack
> of rebase with it. The current version is fixed on the
> master-next and successfully tested.
>
> .../{python3-pyudev_0.21.0.bb => python3-pyudev_0.22.0.bb}  | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pyudev_0.21.0.bb => python3-pyudev_0.22.0.bb} (76%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pyudev_0.21.0.bb b/meta-python/recipes-devtools/python/python3-pyudev_0.22.0.bb
> similarity index 76%
> rename from meta-python/recipes-devtools/python/python3-pyudev_0.21.0.bb
> rename to meta-python/recipes-devtools/python/python3-pyudev_0.22.0.bb
> index 49a3628f4..38c012843 100644
> --- a/meta-python/recipes-devtools/python/python3-pyudev_0.21.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyudev_0.22.0.bb
> @@ -1,9 +1,9 @@
>   SUMMARY = "A libudev binding"
> +
>   LICENSE = "LGPLv2.1+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
>   
> -SRC_URI[md5sum] = "cf4d9db7d772622144ca1be6b5d9353b"
> -SRC_URI[sha256sum] = "094b7a100150114748aaa3b70663485dd360457a709bfaaafe5a977371033f2b"
> +SRC_URI[sha256sum] = "69bb1beb7ac52855b6d1b9fe909eefb0017f38d917cba9939602c6880035b276"
>   
>   inherit pypi setuptools3
>   
> @@ -20,3 +20,5 @@ RDEPENDS_${PN} = "\
>       ${PYTHON_PN}-fcntl \
>       libudev \
>   "
> +
> +BBCLASSEXTEND = "native nativesdk"
>
> 

--------------791D8D20245BE89B163B4016
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/25/20 5:01 PM, Domarys Correa
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200525210151.13741-1-domarys.correa@ossystems.com.br">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Domarys Correa <a class="moz-txt-link-rfc2396E" href="mailto:domarys.correa@ossystems.com.br">&lt;domarys.correa@ossystems.com.br&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200525210151.13741-1-domarys.correa@ossystems.com.br">
      <pre class="moz-quote-pre" wrap="">
---
v1 had problems to be added to the master-next due to lack
of rebase with it. The current version is fixed on the
master-next and successfully tested.

.../{python3-pyudev_0.21.0.bb =&gt; python3-pyudev_0.22.0.bb}  | 6 &#43;&#43;&#43;&#43;--
 1 file changed, 4 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyudev_0.21.0.bb =&gt; python3-pyudev_0.22.0.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-pyudev_0.21.0.bb b/meta-python/recipes-devtools/python/python3-pyudev_0.22.0.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-pyudev_0.21.0.bb
rename to meta-python/recipes-devtools/python/python3-pyudev_0.22.0.bb
index 49a3628f4..38c012843 100644
--- a/meta-python/recipes-devtools/python/python3-pyudev_0.21.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-pyudev_0.22.0.bb
@@ -1,9 &#43;1,9 @@
 SUMMARY = &quot;A libudev binding&quot;
&#43;
 LICENSE = &quot;LGPLv2.1&#43;&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343">&quot;file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343&quot;</a>
 
-SRC_URI[md5sum] = &quot;cf4d9db7d772622144ca1be6b5d9353b&quot;
-SRC_URI[sha256sum] = &quot;094b7a100150114748aaa3b70663485dd360457a709bfaaafe5a977371033f2b&quot;
&#43;SRC_URI[sha256sum] = &quot;69bb1beb7ac52855b6d1b9fe909eefb0017f38d917cba9939602c6880035b276&quot;
 
 inherit pypi setuptools3
 
@@ -20,3 &#43;20,5 @@ RDEPENDS_${PN} = &quot;\
     ${PYTHON_PN}-fcntl \
     libudev \
 &quot;
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

--------------791D8D20245BE89B163B4016--

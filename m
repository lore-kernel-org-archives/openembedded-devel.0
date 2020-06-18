Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.49])
 by mx.groups.io with SMTP id smtpd.web10.1857.1592508724383744752
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jun 2020 12:32:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=nK1+z3f+;
 spf=pass (domain: windriver.com, ip: 40.107.94.49, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ejc/0h9j6otSD+81qRDU3SadrAvJjnrmOGDLoxYXunAsw/JLxNVMbP8zy+1rZ1qSrp1CjJuAsWyozwlTf0eoQWMUlhmM4sxb+wjq2WWe+2e6q95IqZPg9y275nD/uuWErk46bq1+e7tCS/WcEQUWKieV4n1f9p3hJ8aMz6R2W9Etn+LTze4OPMelbyrq9ubqq7y77lOw7CmT/FakJM+EtWm8hQOAKFomEox3rt2k/DQSylET1+AqHfZ2fX5M/ZbBLwzfZV6RVGKCkfYkHRWQl+Jv5MSKNUxZO73aH9tw0yPh5FwgYBgoVKuwy6Z/8f0xoTPhn/8q1HOwDUOgS9gvJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=atSdaJp5kuhEtcO3tXUR8MZzOvSeZ4Gr8lSBCE/Os7E=;
 b=IQrG7yIk0/1z/nLg5TR3FzczeJh72vdDKUq+oJEu6XyPHdsiRTUdX550INiSo9f/qxl1/87Whe8ydD8OszMTn9TFi5mN71pVeN45K5TzYld9hLq9xC9JPhu75faLDAAgDQ1UqOZWA5Q34XBk7f7DXd5CKrJJiFq/6od+mc7QFoLUctKqDqF5o+hoaCskRO1Dq5jSnLbgjKIVASwS0DIwC8QpDpzQwGhnM5Mnni3oBv9qcfjxxsG10MOBfJyM075KJlkNs43PhoA9MVFR2ssHPHF30unP3M7hEe/99iKrWrL/v73us6yNHuazAOrWZP2fSqj6yl9sdyS2eiIB2Ze5SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=atSdaJp5kuhEtcO3tXUR8MZzOvSeZ4Gr8lSBCE/Os7E=;
 b=nK1+z3f+qQWd75l8SNGDANsFlhWHhbxNr/n2nDcLqBpEvQq2M0LwEkEfN9wXLwcfozGs5csP2WTotw8M3rlWvf557I2vkwiEumseO60FPpeVNJ7s/FFxvnUqHCyrNw4eH+pzEyImB3e/839INYWxIKZ5/mJ29i+MZCWtAOsc8eA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB2050.namprd11.prod.outlook.com (2603:10b6:404:3c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Thu, 18 Jun
 2020 19:32:03 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.021; Thu, 18 Jun 2020
 19:32:03 +0000
Subject: Re: [oe] [meta-python][PATCH 3/3] python3-periphery: Upgrade 2.0.1 -> 2.1.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200618090358.31927-1-leon.anavi@konsulko.com>
 <20200618090358.31927-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <3fa7236a-019b-2213-f7a0-1b9523eca748@windriver.com>
Date: Thu, 18 Jun 2020 15:32:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200618090358.31927-3-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0039.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::16) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTXPR0101CA0039.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend Transport; Thu, 18 Jun 2020 19:32:02 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50b707f4-cf6c-414a-e666-08d813be4714
X-MS-TrafficTypeDiagnostic: BN6PR11MB2050:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB2050DD72F6DAF9E7FBC24F209F9B0@BN6PR11MB2050.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 0438F90F17
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BUXbwCGQ1zQI3hu5wBs2uxWfVcE6KR7CHcUMukiUG/KybSkvLBP86QtORtn+vBVJSMZ0YGBqn7Vbeum3vV7CshGUapUG/EDwRWCgMffg+ilfndeclyhdAOBZi71tahE13Dm1nzMUzQBu3J8eBn7Bq0MtOq4Sb5j17bPDRvdk4uQJrOUE/EGYiUF7ZAfDGcKOpRfUV6Vk89KqccXeL8YS6Tv2PN2c85ldUWb9fD7t3mhZnWYzZULCqT3hurTiaCaWZHbb3A55QXxS3KyPNWX6YH3cQZH+IGebrASoaLUdBocCK/2+MI0346GpCR/7uZf/jknmd39Dvc0skv0p6ZyZiSoftzKW6Cc1mrjs/nVgsVGPmIidQKMnr9Q3+HGskVmFWAJ39GCCp9D6lj+eNwbBCKhTav/kw2K2NziPT4LNeXoMl8aMmH1zuZyYr6FU38a5cUSYJX6v+J6tbjHME8Fyhg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(136003)(396003)(39850400004)(376002)(366004)(44832011)(6486002)(33964004)(956004)(166002)(83380400001)(2616005)(36756003)(478600001)(86362001)(31696002)(53546011)(31686004)(8676002)(8936002)(16526019)(26005)(966005)(2906002)(316002)(66476007)(66556008)(5660300002)(16576012)(52116002)(186003)(66946007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	3yW/OcZW4hMrw4arQ4/l7WMip8H6Bw4axjk3ono2wnyPPobRzbBWs6MI8HgrzpOaQOhP4PL4plpbcwrtnhCYCi+k9Hm74eO4NYuDbS40sOJFvD5pmkuhDvHpnJUMfa7jM2O+ZYg2+GuLtZ7IgulEWPa4GS+JiD1Op9ufRJbX4Hf5Nv0PME6c7amJDRkvfZmcErVusv5fl3v72pyqu70AnFdORBoNn9G/0J2Zzpftk8nQIObF3VcIcgUJfYNP4ZfVFyELu1Z+StsdEz6MnSeN5dRoSr66TunZZgOc4jS7qro4UTq/xOt5LTrS4xcpWzWtBEzp0prwfQysAy/oYafwTI/tBHKPmXSbzorn57zvR6zhpU+GaHt4VOGGuGq8gF+cjpAPGh7qKNvSTsGSc0ngZHohT2ev8O8PeGwG7pERfc9wk2lA9T+aE8w/+xzjblStAMHPcydIwadboirw+3aHnkImg2afR5rsxsoyDOEl2+JIbNRmshPItsUfe57QYZUZ
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50b707f4-cf6c-414a-e666-08d813be4714
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2020 19:32:03.2172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mleW93iS5ZJxBxvb4WJ8EaPpks/lPz5NdNr2bZ/PGleCgrtW/t9DJMgof+yVhxvOmKtJjoKcFcrqNvcSV1cfTUTjGoZd8db+FWSMHKM/qhI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB2050
Content-Type: multipart/alternative;
 boundary="------------2F12443D46FFB9E4182071AE"
Content-Language: en-US

--------------2F12443D46FFB9E4182071AE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/18/20 5:03 AM, Leon Anavi wrote:
> Upgrade to release 2.1.0. Use LICENSE instead of PKG-INFO in
> LIC_FILES_CHKSUM. The new release brings the following changes:
>
> GPIO:
> - Add poll_multiple() static method.
> - Add line consumer label property.
> - Add line bias, line drive, and inverted properties.
> - Add additional properties as keyword arguments to constructor
>    for character device GPIOs.
> - Only unexport GPIO in close() if exported in open for sysfs
>    GPIOs.
> - Improve wording and fix typos in docstrings.
>
> Serial:
> - Fix performance of blocking read in read().
> - Raise exception on unexpected empty read in read(), which may
>    be caused by a serial port disconnect.
> - Add vmin and vtime properties for the corresponding termios
>    settings.
> - Add support for termios timeout with read().
> - Improve wording in docstrings.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...ython3-periphery_2.0.1.bb => python3-periphery_2.1.0.bb} | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-periphery_2.0.1.bb => python3-periphery_2.1.0.bb} (57%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-periphery_2.0.1.bb b/meta-python/recipes-devtools/python/python3-periphery_2.1.0.bb
> similarity index 57%
> rename from meta-python/recipes-devtools/python/python3-periphery_2.0.1.bb
> rename to meta-python/recipes-devtools/python/python3-periphery_2.1.0.bb
> index 1aa48625f..3cd9004df 100644
> --- a/meta-python/recipes-devtools/python/python3-periphery_2.0.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-periphery_2.1.0.bb
> @@ -2,10 +2,10 @@ DESCRIPTION = "A pure Python 2/3 library for peripheral I/O (GPIO, LED, PWM, SPI
>   HOMEPAGE = "http://pythonhosted.org/python-periphery/"
>   LICENSE = "MIT"
>   
> -LIC_FILES_CHKSUM = "file://PKG-INFO;md5=1ecf5c2354c22fb5bfd53eefb8f9e65b"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=fea92e2e010ccb151792c29fadc2db7b"
>   
> -SRC_URI[md5sum] = "1d958f02575d4a19734ee2dd92336157"
> -SRC_URI[sha256sum] = "5da4d5f40ff8974cf6c724587baa674d7e0593f07b6f6ee896104f11c1be18ec"
> +SRC_URI[md5sum] = "27cdd7e026438067a238fb04ed5766a3"
> +SRC_URI[sha256sum] = "57baa82e6bc59b67747317d16ad0cf9626826e8d43233af13bce924660500bd6"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------2F12443D46FFB9E4182071AE
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/18/20 5:03 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200618090358.31927-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 2.1.0. Use LICENSE instead of PKG-INFO in
LIC_FILES_CHKSUM. The new release brings the following changes:

GPIO:
- Add poll_multiple() static method.
- Add line consumer label property.
- Add line bias, line drive, and inverted properties.
- Add additional properties as keyword arguments to constructor
  for character device GPIOs.
- Only unexport GPIO in close() if exported in open for sysfs
  GPIOs.
- Improve wording and fix typos in docstrings.

Serial:
- Fix performance of blocking read in read().
- Raise exception on unexpected empty read in read(), which may
  be caused by a serial port disconnect.
- Add vmin and vtime properties for the corresponding termios
  settings.
- Add support for termios timeout with read().
- Improve wording in docstrings.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200618090358.31927-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...ython3-periphery_2.0.1.bb =&gt; python3-periphery_2.1.0.bb} | 6 &#43;&#43;&#43;---
 1 file changed, 3 insertions(&#43;), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-periphery_2.0.1.bb =&gt; python3-periphery_2.1.0.bb} (57%)

diff --git a/meta-python/recipes-devtools/python/python3-periphery_2.0.1.bb b/meta-python/recipes-devtools/python/python3-periphery_2.1.0.bb
similarity index 57%
rename from meta-python/recipes-devtools/python/python3-periphery_2.0.1.bb
rename to meta-python/recipes-devtools/python/python3-periphery_2.1.0.bb
index 1aa48625f..3cd9004df 100644
--- a/meta-python/recipes-devtools/python/python3-periphery_2.0.1.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-periphery_2.1.0.bb
@@ -2,10 &#43;2,10 @@ DESCRIPTION = &quot;A pure Python 2/3 library for peripheral I/O (GPIO, LED, PWM, SPI
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://pythonhosted.org/python-periphery/">&quot;http://pythonhosted.org/python-periphery/&quot;</a>
 LICENSE = &quot;MIT&quot;
 
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;md5=1ecf5c2354c22fb5bfd53eefb8f9e65b">&quot;file://PKG-INFO;md5=1ecf5c2354c22fb5bfd53eefb8f9e65b&quot;</a>
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=fea92e2e010ccb151792c29fadc2db7b">&quot;file://LICENSE;md5=fea92e2e010ccb151792c29fadc2db7b&quot;</a>
 
-SRC_URI[md5sum] = &quot;1d958f02575d4a19734ee2dd92336157&quot;
-SRC_URI[sha256sum] = &quot;5da4d5f40ff8974cf6c724587baa674d7e0593f07b6f6ee896104f11c1be18ec&quot;
&#43;SRC_URI[md5sum] = &quot;27cdd7e026438067a238fb04ed5766a3&quot;
&#43;SRC_URI[sha256sum] = &quot;57baa82e6bc59b67747317d16ad0cf9626826e8d43233af13bce924660500bd6&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------2F12443D46FFB9E4182071AE--

Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.69])
 by mx.groups.io with SMTP id smtpd.web11.143.1591377907804095275
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Jun 2020 10:25:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=O9G+xvP7;
 spf=pass (domain: windriver.com, ip: 40.107.92.69, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nbqeklWVCI0zMkf7R7YY/TuT6POnifMWkaSCmMZRRtMMQB0LJKLwJS3/04WSvWD15Rxoe0RVpunKolrpXSdZrXobGeZ729DC6pVF4nrOiKG9tIAiSVPeYpAvx02A9jzLIziMiq1TOvk/8xnW4ezT1VQtUuNP8q6po5AmKK1SQjkusOFChCK7z7u8vH708C5yUT9PlsdZE9uM7Kx8UVGxlRDRJ2Qz5uSryaDKciuJDKr02aqPOEPY2tN4//f8EqGsvjn+7K43TChEz5iBzOIa+oAau13xL/DX6x8yzfsbqapBYA7UEMC5gjJstJb62OjNU4/2twxv6OnGgE1aM+Cw+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tg7Td+cQwdXFmSIo7fJD/ENqsRah18rHfRwynyux88M=;
 b=G5Tl0ruslbm0NHqLXEqh91hOCFrWvJSAH6ACk6oHyTNwJwzhPkivi8KwjnHPhpWIDOVGIKWMTtxSKoBc41RSQ67PKJn1rsKPwJr50ZcH+tSsAH6xCne9phZfeZnwXiMu8KrfHCg16IXLRx/ZjH4Qc80SoNxrkLsweqqnQBUaqlsoljgNBOtZjKBX9JOtTl6GaTyVO5h8HiMk7mvPsBKooCBC5kXbSX3PfZt71R6q2Pqa082e9BIB8gbDX2TdKDiB7WjjeRZhDWqf/dvKUrDYmXgn+NQnUrQ7EjrDpC95htb+5Gbi/NBaL8jHGcm3DDs0w1Qx9VA6XJojDcxWoUkLqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tg7Td+cQwdXFmSIo7fJD/ENqsRah18rHfRwynyux88M=;
 b=O9G+xvP7XtnUr8cZoqG1apRJE4rKvobgqcRjr4byUC2D4TtECO+Bm1mxqbqS7msOF33kqqh8I21ivxFTqQAA1qK0eASHiDmFdlYJoWJy5OjjE3pjiLUE47n+cE48pvFBm5dxM00DBRlV7OH1aU9jsaolR3oHQLowsnHRW19EcKc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1908.namprd11.prod.outlook.com (2603:10b6:404:103::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Fri, 5 Jun
 2020 17:25:06 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3066.019; Fri, 5 Jun 2020
 17:25:06 +0000
Subject: Re: [oe] [meta-python][PATCH 2/3] python3-engineio: Upgrade 3.12.1 -> 3.13.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200603134232.22336-1-leon.anavi@konsulko.com>
 <20200603134232.22336-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <bcc233c9-3a2c-90eb-c6f1-fd832334d3dd@windriver.com>
Date: Fri, 5 Jun 2020 13:25:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200603134232.22336-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0027.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::40) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTXPR0101CA0027.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::40) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend Transport; Fri, 5 Jun 2020 17:25:06 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 318c62e4-6b26-45c4-3c48-08d8097563f0
X-MS-TrafficTypeDiagnostic: BN6PR11MB1908:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB19087225FCAFC531F2D092659F860@BN6PR11MB1908.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-Forefront-PRVS: 0425A67DEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	w/iG5m0uizgyJT7j4EaPW18a52ZZZo5yi0cLVipu2e73bAN+8dI9lIKd4K78dVMxh+psqNldEyAbcFfWVRypOo4rZpoD5dattZD9k1hpEwbleszpJxNsWI1/alkj089C1vujuxsXecMfF8jNjlAKbsJ+1YBv6IHxPFHmvXUugw7G4Il8drsEf8AGcPrYSyPnd0KcWHpu40CtwHr8/iUaEc49hohNYHkdr/KBeaC4aeOPgk6agrUCDHwMGlCdLvBdOhjFjShScHDAZpmKlLcxuPW8khn3MA6v5WNtuUdNhPq8oOi0W0mLGHNdZFYDCmF+V6jImrfxR8NHUHO8VsqFS1jhMXFfM5049+nVy61btqt2fNq+7eWtyhd7PcmgLy2SfBT6TxI+rhwPKRbiAt34jbjb3NV5xoEM/uOM4JjgdUqlf2giqgnDVqOqd7Re2va46BSrtdcwJ6W566XYucb/1Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(346002)(136003)(39850400004)(396003)(366004)(44832011)(8676002)(31686004)(53546011)(2616005)(66476007)(66556008)(186003)(16526019)(956004)(66946007)(2906002)(16576012)(26005)(36756003)(316002)(33964004)(31696002)(966005)(478600001)(8936002)(5660300002)(52116002)(166002)(6486002)(83380400001)(86362001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	uZUBSPZqBBVNVqTXID8hF/ON6mEX80PXmixcSBBtZDCmlWeg2jTTqtKWSjwoHn6bJYkGJN4qDSUjjytiKQ8OIUQPYoRIXI9uK3QwzVMz1lTLw7vfjpEl3kOd3vfp2o8A/8AcOXstAUn4pjRsLA6+1cw23u9g5d48lIo9Np3HMZ05WtGsgjyFPfkBG5WWRk7S4QK/ScC9qC8Y93h4hZ8TGXvSW75SyC9aHxK5NJgbBSHRfu/Bi/yQqBoVdlw1JeonRh/TwBQsDs2lfuyRxpidUr2DHS4MHiGxd6TmSJrCS1rdaGx8dDWOeq5rM0s8n56QGloOhMPU1ErowJOq0HPXtIe54LLSKPfSgdotcvI6gG2R+OlAjxAloNrNYVq/F8kQ+7DV3vgCtOJ9NflOEyPi+HgIai1kNeK/BfXayBcQSHHYXIErHNYE0vOeBcVvq9jWH3o/j44wYJw1YxvTFDBWqVRIt2OKF3eScKoJS9jTHkA=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 318c62e4-6b26-45c4-3c48-08d8097563f0
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2020 17:25:06.7576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VQSmZIcXHgC2GebUOthm7yiN7jg0uugglHmBXnZis3E/XqkkDUusGJ02vPOqwemHR+E9lhYgUANRkHVro7OuG3sCvizC0X0i2xK6VozwhbA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1908
Content-Type: multipart/alternative;
 boundary="------------C43861088C7DB104E039EBB4"
Content-Language: en-US

--------------C43861088C7DB104E039EBB4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/3/20 9:42 AM, Leon Anavi wrote:
> Upgrade to release 3.13.0 and consolidate inc and bb files into
> a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python3-engineio_3.12.1.bb      | 2 --
>   .../{python-engineio.inc => python3-engineio_3.13.0.bb}     | 6 +++---
>   2 files changed, 3 insertions(+), 5 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python3-engineio_3.12.1.bb
>   rename meta-python/recipes-devtools/python/{python-engineio.inc => python3-engineio_3.13.0.bb} (59%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-engineio_3.12.1.bb b/meta-python/recipes-devtools/python/python3-engineio_3.12.1.bb
> deleted file mode 100644
> index 028d1104a..000000000
> --- a/meta-python/recipes-devtools/python/python3-engineio_3.12.1.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -inherit setuptools3
> -require python-engineio.inc
> diff --git a/meta-python/recipes-devtools/python/python-engineio.inc b/meta-python/recipes-devtools/python/python3-engineio_3.13.0.bb
> similarity index 59%
> rename from meta-python/recipes-devtools/python/python-engineio.inc
> rename to meta-python/recipes-devtools/python/python3-engineio_3.13.0.bb
> index 965f42014..51f853390 100644
> --- a/meta-python/recipes-devtools/python/python-engineio.inc
> +++ b/meta-python/recipes-devtools/python/python3-engineio_3.13.0.bb
> @@ -5,9 +5,9 @@ SECTION = "devel/python"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=42d0a9e728978f0eeb759c3be91536b8"
>   
> -inherit pypi
> +inherit pypi setuptools3
>   
>   PYPI_PACKAGE = "python-engineio"
>   
> -SRC_URI[md5sum] = "e6ea8b3f2f32eeeb02014c46092f2adb"
> -SRC_URI[sha256sum] = "2481732d93646998f7372ef0ecf003af7817b82720b881db173c3d50b4887916"
> +SRC_URI[md5sum] = "822b5dba0308dde6b8cbfd022daae0e4"
> +SRC_URI[sha256sum] = "2da5e1e5565e170a17169d1a76eb6a099cc96f0a25a5b1e0f9785f151485daea"
>
> 

--------------C43861088C7DB104E039EBB4
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/3/20 9:42 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200603134232.22336-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 3.13.0 and consolidate inc and bb files into
a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200603134232.22336-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python3-engineio_3.12.1.bb      | 2 --
 .../{python-engineio.inc =&gt; python3-engineio_3.13.0.bb}     | 6 &#43;&#43;&#43;---
 2 files changed, 3 insertions(&#43;), 5 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-engineio_3.12.1.bb
 rename meta-python/recipes-devtools/python/{python-engineio.inc =&gt; python3-engineio_3.13.0.bb} (59%)

diff --git a/meta-python/recipes-devtools/python/python3-engineio_3.12.1.bb b/meta-python/recipes-devtools/python/python3-engineio_3.12.1.bb
deleted file mode 100644
index 028d1104a..000000000
--- a/meta-python/recipes-devtools/python/python3-engineio_3.12.1.bb
&#43;&#43;&#43; /dev/null
@@ -1,2 &#43;0,0 @@
-inherit setuptools3
-require python-engineio.inc
diff --git a/meta-python/recipes-devtools/python/python-engineio.inc b/meta-python/recipes-devtools/python/python3-engineio_3.13.0.bb
similarity index 59%
rename from meta-python/recipes-devtools/python/python-engineio.inc
rename to meta-python/recipes-devtools/python/python3-engineio_3.13.0.bb
index 965f42014..51f853390 100644
--- a/meta-python/recipes-devtools/python/python-engineio.inc
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-engineio_3.13.0.bb
@@ -5,9 &#43;5,9 @@ SECTION = &quot;devel/python&quot;
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=42d0a9e728978f0eeb759c3be91536b8">&quot;file://LICENSE;md5=42d0a9e728978f0eeb759c3be91536b8&quot;</a>
 
-inherit pypi
&#43;inherit pypi setuptools3
 
 PYPI_PACKAGE = &quot;python-engineio&quot;
 
-SRC_URI[md5sum] = &quot;e6ea8b3f2f32eeeb02014c46092f2adb&quot;
-SRC_URI[sha256sum] = &quot;2481732d93646998f7372ef0ecf003af7817b82720b881db173c3d50b4887916&quot;
&#43;SRC_URI[md5sum] = &quot;822b5dba0308dde6b8cbfd022daae0e4&quot;
&#43;SRC_URI[sha256sum] = &quot;2da5e1e5565e170a17169d1a76eb6a099cc96f0a25a5b1e0f9785f151485daea&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------C43861088C7DB104E039EBB4--

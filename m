Received: from NAM04-SN1-obe.outbound.protection.outlook.com (NAM04-SN1-obe.outbound.protection.outlook.com [40.107.70.49])
 by mx.groups.io with SMTP id smtpd.web10.21357.1591972820697277231
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2020 07:40:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ZszcXYQ6;
 spf=pass (domain: windriver.com, ip: 40.107.70.49, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kGhZU0+s+yPnJ76ubftNL691X0SMW6bAdW2/8rPeVer33e4jPGpajRbgmCjaDjuyVa+YH2P/4Aa7317S8CrTQbjYyYKkh3l/5XBraOP8QtnPH54mfxKaGXBMuqvby7n3UDqSazhV6WcUOybzBQLMdMdscA0NelT5wQzPUfcjLrfr5Im7T7+ocAsvKZaF+L/HEWNudTkvoU/JAJ/IZerc3ndxJ6vUhoAOvYIV4DqOfHXZ54u5zCaUB0tkLO/ua+7aJOo4Zg6tJBvReSMQfMyEPQ/bSxsLtTePljNpdF5eacwjMmgLtI7L6r5FhuxYMooibTSAxIZEWC2XtZpBio+blw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HvB0ckXJR9JQUowWntPn6buw8owmaEGfQesTRsgS88w=;
 b=MJ4QbKBGPbGjJAs52qvflzs50/2jPoKde3wLs3IzhPl5FUELEk7RAKNcctPG6St8mBCYJHaflwCgUDlWNTW/+JfqEx2cB+jdgTwQNlPi31f6oHrHp7G/Ku3xOzJAdWJNhrEKWt+AIefAxiqBvWlqn/JDl/OctcQ2zRkBEkQIG2uADRzRW18YV10/bPGsXE+mlOhcA1UVulqnl6CfIf7h3aZLPrNdexQLDv0BqxVzET4SpAblN4zTc2rrtezAvxokE/2cacrmA46s3i27EUAFesGah9sniVDCgzUJFBU06z/jAwvBvZDpLm9C2d0VZ8cVYyF2ytTrmrfXg2aSef4I3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HvB0ckXJR9JQUowWntPn6buw8owmaEGfQesTRsgS88w=;
 b=ZszcXYQ6Bd+C+JlN8BNa+kdAXO4VcL/Jxzc4as5hKF1DALU3ufhlb/Al28n3aUjAb4Ct4JgJWrroYiiQ4q2yWNACOwuy+Me2ZE7abWdYjedA5gHyXjNddzOcJPRiBlgZj9fPhSfgBkzNEoe4vPtLK2fNCZVkk5yHUFoB6br7WDc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1233.namprd11.prod.outlook.com (2603:10b6:404:44::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18; Fri, 12 Jun
 2020 14:40:19 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3088.021; Fri, 12 Jun 2020
 14:40:18 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-m2crypto: add the missing rdepends
To: "Yu, Mingli" <mingli.yu@windriver.com>,
 openembedded-devel@lists.openembedded.org
References: <20200612034646.3659830-1-mingli.yu@windriver.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <cbabbacc-4eca-8ed0-4bc0-4fdf70bde200@windriver.com>
Date: Fri, 12 Jun 2020 10:40:15 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200612034646.3659830-1-mingli.yu@windriver.com>
X-ClientProxiedBy: YT1PR01CA0109.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::18) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0109.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18 via Frontend Transport; Fri, 12 Jun 2020 14:40:18 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 352ffd78-df23-443d-14ac-08d80ede8732
X-MS-TrafficTypeDiagnostic: BN6PR11MB1233:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB1233B4E7B8F483EC0629E03E9F810@BN6PR11MB1233.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-Forefront-PRVS: 0432A04947
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NFjrTLDrxZOEvDGTZX4VduZuk33SvPGDCTOy4jKeZmvhYsX8RGFwvMuj0fw7un08a0jtu1oBNPRptfAdSRRM4iR2p1NHWpD3zbsSo0brck+HpbuTMAOQ39i3/LIaCokQ1JbH+3cs67a4WJF5AT0GLXcZ+JLqhXzcVBHnc3NW83h/tpf8pjj0Ofpo0/YAC71AMI7JXZentVSrLRKkjB/15OYlWxVNijcVLexDbgkXZzxY9M27dXEM9V+tKjf/gIi1iQ/GqYfH5w1V5Ja4NpYA5jcEOTEtS5AtiU79/AK65ObspUmq8sCwWjH3WpUhW8E2yjb/x3t+sJwkrGOOPXps0Lcjq0Wl1Td3fhkG3+YiptSge9//hXE776DQ1hsElLIluMraakfBABAVjVipxh4v5DX7PjrLpIkDHdydus9vheKl5OctQoJ/olu7PlOjz+gU8VmBwjhnf6sckBooVqijrA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(39850400004)(346002)(396003)(376002)(366004)(6486002)(66946007)(31686004)(66476007)(66556008)(478600001)(16576012)(2906002)(6666004)(966005)(316002)(36756003)(16526019)(5660300002)(83380400001)(53546011)(33964004)(26005)(186003)(31696002)(86362001)(8936002)(8676002)(2616005)(166002)(52116002)(44832011)(956004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	OKOF6OUdzcrjv5IlzXUD+Did5OlYVMGh7aDKjDkY7nmPxO6FYWZE1xZT99p/qN8+ZUCZSpW3K/EF4zwT/vgtz5SohuJHz7r+N7/BkqTvUAgMIRi3CS4wHB6osL81puQb0qNPCbAd5nFXDOvi2LriPcvni2Zcljz0FXAiwqEYzTLtF20CNiI9rHhc8FF5Ieyi2qKM56ydI3tgZsVgVRzfk7C11zAoRHk/Xr0gYEs5xNkqcdqpOkCIW83YyB78ojp3/k9kVyix0kaLfDLTyHdj6VbCQmTASSpj62Q1C93SdXQ2esx9eTivrv9CREI05/HUcxn3ho5TubJNNLedCJc529MpEd2cbZjyAILtsge3Wog/Wg3Hp5j8dKfGeEgzFe8FNSXIzuCTfX+X7p4gGKaHsqUXdIzab7aAoGxRKGh+3FEspeR4KfzaiMD22ya2UE5r4bl4cAt0znUx9cMnRS7ziYeyRY37wvYFxVqrN1ZXEOYUWTbKTcut2ET299foNrhh
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 352ffd78-df23-443d-14ac-08d80ede8732
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2020 14:40:18.8748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BtXmxqfqvUO/80kGDAyR0wipXyLOw3ZVbwCJk0HEjlITAYe0TspUrrdbFLOTMhxRwdXDdhtdN4puQSwZV7bpv79ytJyS6jm3hTjPq1C0c3E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1233
Content-Type: multipart/alternative;
 boundary="------------16A8E03BEF03E3D771F5698E"
Content-Language: en-US

--------------16A8E03BEF03E3D771F5698E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/11/20 11:46 PM, Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
>
> Add the missing rdepends to fix the error such as below:
>   # python3
>   [snip]
>   >>> import M2Crypto
>   ModuleNotFoundError: No module named 'decimal'
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python-m2crypto.inc    | 14 ++++++++++----
>   1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/meta-python/recipes-devtools/python/python-m2crypto.inc b/meta-python/recipes-devtools/python/python-m2crypto.inc
> index 881fdf1cc..81c81645a 100644
> --- a/meta-python/recipes-devtools/python/python-m2crypto.inc
> +++ b/meta-python/recipes-devtools/python/python-m2crypto.inc
> @@ -17,10 +17,16 @@ PYPI_PACKAGE = "M2Crypto"
>   inherit pypi siteinfo
>   
>   DEPENDS += "openssl swig-native"
> -RDEPENDS_${PN} += "${PYTHON_PN}-typing \
> -                   ${PYTHON_PN}-distutils \
> -                   ${PYTHON_PN}-smtpd \
> -                   ${PYTHON_PN}-xmlrpc \
> +RDEPENDS_${PN} += "\
> +  ${PYTHON_PN}-datetime \
> +  ${PYTHON_PN}-distutils \
> +  ${PYTHON_PN}-logging \
> +  ${PYTHON_PN}-netclient \
> +  ${PYTHON_PN}-netserver \
> +  ${PYTHON_PN}-numbers \
> +  ${PYTHON_PN}-smtpd \
> +  ${PYTHON_PN}-typing \
> +  ${PYTHON_PN}-xmlrpc \
>   "
>   
>   DISTUTILS_BUILD_ARGS += "build_ext --openssl=${STAGING_EXECPREFIXDIR} -I${STAGING_INCDIR}"
>
> 

--------------16A8E03BEF03E3D771F5698E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/11/20 11:46 PM, Yu, Mingli wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200612034646.3659830-1-mingli.yu@windriver.com">
      <pre class="moz-quote-pre" wrap="">From: Mingli Yu <a class="moz-txt-link-rfc2396E" href="mailto:mingli.yu@windriver.com">&lt;mingli.yu@windriver.com&gt;</a>

Add the missing rdepends to fix the error such as below:
 # python3
 [snip]
 &gt;&gt;&gt; import M2Crypto
 ModuleNotFoundError: No module named 'decimal'

Signed-off-by: Mingli Yu <a class="moz-txt-link-rfc2396E" href="mailto:mingli.yu@windriver.com">&lt;mingli.yu@windriver.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200612034646.3659830-1-mingli.yu@windriver.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python-m2crypto.inc    | 14 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;----
 1 file changed, 10 insertions(&#43;), 4 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-m2crypto.inc b/meta-python/recipes-devtools/python/python-m2crypto.inc
index 881fdf1cc..81c81645a 100644
--- a/meta-python/recipes-devtools/python/python-m2crypto.inc
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python-m2crypto.inc
@@ -17,10 &#43;17,16 @@ PYPI_PACKAGE = &quot;M2Crypto&quot;
 inherit pypi siteinfo
 
 DEPENDS &#43;= &quot;openssl swig-native&quot;
-RDEPENDS_${PN} &#43;= &quot;${PYTHON_PN}-typing \
-                   ${PYTHON_PN}-distutils \
-                   ${PYTHON_PN}-smtpd \
-                   ${PYTHON_PN}-xmlrpc \
&#43;RDEPENDS_${PN} &#43;= &quot;\
&#43;  ${PYTHON_PN}-datetime \
&#43;  ${PYTHON_PN}-distutils \
&#43;  ${PYTHON_PN}-logging \
&#43;  ${PYTHON_PN}-netclient \
&#43;  ${PYTHON_PN}-netserver \
&#43;  ${PYTHON_PN}-numbers \
&#43;  ${PYTHON_PN}-smtpd \
&#43;  ${PYTHON_PN}-typing \
&#43;  ${PYTHON_PN}-xmlrpc \
 &quot;
 
 DISTUTILS_BUILD_ARGS &#43;= &quot;build_ext --openssl=${STAGING_EXECPREFIXDIR} -I${STAGING_INCDIR}&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------16A8E03BEF03E3D771F5698E--

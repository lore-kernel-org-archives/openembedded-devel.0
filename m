Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.55])
 by mx.groups.io with SMTP id smtpd.web10.60480.1594050019894021463
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2020 08:40:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=SGoah6lq;
 spf=pass (domain: windriver.com, ip: 40.107.92.55, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YvJlid2QO3zGe/xzfTqoiop9rl1HkauMBuJJ/ewF12gUSCfcgwjnWoMI/7KEm2Y5jkf+rhagR4mg3Tme999EpM3YwQJZKxm5fcBRnX7CPim4VBcRg0YHGMneRqosFoZz8Czl+yJdAGgoFgS0P3i6WG59REYb+FFEmO4MhEfFdMak1rybpFb7JfwX1uSwUhl0YOysVt+HVRYh/QOrui4+7QijtotDOlydLNZ0Cfd3kD/AOiRmWcQ0aJLGeWQrYLe6JNGbe+dlxeS9AJeS6sL6DI7wu8wntDhTSo78C1XDKpm+NaOCol4DeXOxBnmMsBiv1GDOKR98EyYJrnQvQRl7wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1LnmnT2ykTsywMDko8rVEjuF97OpcLZ9vlc4eOST35I=;
 b=KW5yJ16clAIilar9nCmog7Pu1mrokHzrn+v2HBOiEmid/3Fb8DT0cd5uffEVhF/AotWBTs3a+d2MtWqzPEkJyHakLGdzQ9ORS9YLwrA+sCwvdoMWsN6y35azNQBWScFRGNwtr0+o0H4hXH919lF15cyS5yY3qEkXOLIsMfpC9F4EEY4yaZtJOovm0gTzVGlG+Di/xIrUrU24+t+2GQCMeHN+Mljk6gazvNCMb/widdhZpDE3/vjBqGA8XfLTPzQGRoDdp6gm8pFBkW/4zOB3uSrk31t70SZ7qJQ6YV1OlWWSqMSziRmBF1HzU38jzR4kmG02g0cy7adMfds6Z90OEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1LnmnT2ykTsywMDko8rVEjuF97OpcLZ9vlc4eOST35I=;
 b=SGoah6lqrFa8PJXJwQeICMXjtVnuYq/asdcq2ajcaoFEsP7zmYgvGu5KrmydUaeMkuZjQjs51+QZke0lRmon9damkHGZSqHVp49yVM0mTfg36UlGDvwsAbe/ephsC9Ug2ZaHvGz7URNYkId+5WmxhzWGK1uX83INWdI3YSvdWa0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM5PR11MB1820.namprd11.prod.outlook.com (2603:10b6:3:111::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.28; Mon, 6 Jul 2020 15:40:18 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3153.029; Mon, 6 Jul 2020
 15:40:18 +0000
Subject: Re: [oe] [meta-python][PATCH 2/5] python3-cryptography-vectors: Upgrade 2.8 -> 2.9.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200701142243.1686-1-leon.anavi@konsulko.com>
 <20200701142243.1686-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <41b49272-a1f7-d635-d281-12ae93e1b262@windriver.com>
Date: Mon, 6 Jul 2020 11:40:15 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200701142243.1686-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0066.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::35) To DM5PR11MB0011.namprd11.prod.outlook.com
 (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0066.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20 via Frontend Transport; Mon, 6 Jul 2020 15:40:18 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1639dec-4d41-4cda-6285-08d821c2e2d2
X-MS-TrafficTypeDiagnostic: DM5PR11MB1820:
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB1820B2C925574F7D6B65E2469F690@DM5PR11MB1820.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;
X-Forefront-PRVS: 04569283F9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Zsw1QiLqAVAB9eDlZAVAFDYJmS1dV7LfAag3UVDLMTSwK4EI620hcPpIIOw7i9iHOnycGGRMqRdQoa/4nowBTz0ATzpG3gjmPhqorO5Q4A9AEyWTemC+fqjEo3yEYyk9PfLgMJRt/0hRmDz3xJa0rOmSrFYc8HLEX3ccMgim+axonjl/ICjptLkDDlIpWF0DPfLPti7HojP5DhYvx3uWmRzOwjXeGO1HcaRDaPZllp7tBEfk//U9B3ZVgySAARveEhj8nwDx0tcX5lvUf53NJqhnIWcO8W7LwdiM8uNkz/SJR7sk1V7g/XPjMfsc+SxlEhIvx5YBbUsyNbKWbFzjuH83eb+HMaD7j5SxAjHDJLM+2HtoVLOjS2Oxc06S08NiI6moubnLeDJeR79Awq2jGfckTw0FJI3itFM9uuPTImmCJELZO62px8O8K/5DIl2aJ7hbaxFD8iAd9G/wc1RZvA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(346002)(366004)(396003)(136003)(376002)(8676002)(33964004)(52116002)(5660300002)(8936002)(53546011)(966005)(478600001)(66556008)(36756003)(31686004)(66476007)(6666004)(83380400001)(26005)(44832011)(2906002)(6486002)(956004)(2616005)(316002)(16576012)(16526019)(186003)(66946007)(166002)(31696002)(86362001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	prprDIDZcPLl426NGBpSomM2eTJliOyMtLEYu6tJQ7ddIbgwmw1KAA8yQF9flfT5e5zpOFDwg79AluoFoy13IkqLdK2dmcCLkv4T0BGZ3Hy4m1JnBcy40g/hzDDR1SQl8h2qntHIUvIjhL8KjNi22jDlDEDcjKGVxTWCK99Q5tUohlkbgIZD5AjiDJxE0PO1KFjELh+Jw0aQvRp/sMUOD9Vd5tG7pN6rQJnYjii8RD0u/CeNy5K/JdaUDeSyvVxTdGzmjAlcotZt3xwzkmkucmnLNncSYaKz54QvaZ1YgXMFutQig60LjHk+aSCi8hjkC26Y/W7BV+FOGLkGwT+7PHj9hOtr9mXXTuHJiNC0soMTMmzQs9cOjqfpx1Vfc73d1Cb90yD1ZzP4FZ9GeR3GceKZH8sfxE/XwSRCDaPriqnn8yDhuL06Rqm5hqcwHPOqaocfxpw8KyULODQn4J9GlbZlpswBG1k2gmRdS+HV0d4=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1639dec-4d41-4cda-6285-08d821c2e2d2
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2020 15:40:18.7194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Aq5kN0pSa95t+iJaOa0RnJCPOARJb9VXdYVZNGUupSqg4IyVs1Zv9s6zqjNIQLd/Kn6DIPJpBo2/BrMSwJYc2fRrV4k0okyqx7MrigMMp9M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1820
Content-Type: multipart/alternative;
 boundary="------------AE47AB1D22813455BD29CDD5"
Content-Language: en-US

--------------AE47AB1D22813455BD29CDD5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/1/20 10:22 AM, Leon Anavi wrote:
> Upgrade to release 2.9.2:
>
> - Updated the macOS wheel to fix an issue where it would not run
>    on macOS versions older than 10.15.
> - Updated Windows, macOS, and manylinux wheels to be compiled with
>    OpenSSL 1.1.1g.
> - Support for Python 3.4 has been removed due to low usage and
>    maintenance burden.
> - Support for OpenSSL 1.0.1 has been removed. Users on older
>    version of OpenSSL will need to upgrade.
> - Support for LibreSSL 2.6.x has been removed.
> - Removed support for calling
>    :meth:`~cryptography.hazmat.primitives.asymmetric.x25519.X25519PublicKey.public_bytes`
>    with no arguments, as per our deprecation policy. You must now
>    pass encoding and format.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...y-vectors_2.8.bb => python3-cryptography-vectors_2.9.2.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-cryptography-vectors_2.8.bb => python3-cryptography-vectors_2.9.2.bb} (73%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-cryptography-vectors_2.8.bb b/meta-python/recipes-devtools/python/python3-cryptography-vectors_2.9.2.bb
> similarity index 73%
> rename from meta-python/recipes-devtools/python/python3-cryptography-vectors_2.8.bb
> rename to meta-python/recipes-devtools/python/python3-cryptography-vectors_2.9.2.bb
> index 948aab9e0..60316fc74 100644
> --- a/meta-python/recipes-devtools/python/python3-cryptography-vectors_2.8.bb
> +++ b/meta-python/recipes-devtools/python/python3-cryptography-vectors_2.9.2.bb
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2.0 | BSD"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4"
>   
> -SRC_URI[md5sum] = "a744ed29bb9ef56b3a50317fea3b218e"
> -SRC_URI[sha256sum] = "6cd32174c56a3eca72f64af43c1daacaae758cfa5ff9d280dfcf818fa11ef116"
> +SRC_URI[md5sum] = "657349b8de73959fc49ba15fd7346b58"
> +SRC_URI[sha256sum] = "99ac91c4d89572399b097240809af1b8f67f4bedf43398d290c9b2b3d9f491b4"
>   
>   PYPI_PACKAGE = "cryptography_vectors"
>   
>
> 

--------------AE47AB1D22813455BD29CDD5
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/1/20 10:22 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200701142243.1686-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 2.9.2:

- Updated the macOS wheel to fix an issue where it would not run
  on macOS versions older than 10.15.
- Updated Windows, macOS, and manylinux wheels to be compiled with
  OpenSSL 1.1.1g.
- Support for Python 3.4 has been removed due to low usage and
  maintenance burden.
- Support for OpenSSL 1.0.1 has been removed. Users on older
  version of OpenSSL will need to upgrade.
- Support for LibreSSL 2.6.x has been removed.
- Removed support for calling
  :meth:`~cryptography.hazmat.primitives.asymmetric.x25519.X25519PublicKey.public_bytes`
  with no arguments, as per our deprecation policy. You must now
  pass encoding and format.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200701142243.1686-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...y-vectors_2.8.bb =&gt; python3-cryptography-vectors_2.9.2.bb} | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cryptography-vectors_2.8.bb =&gt; python3-cryptography-vectors_2.9.2.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-cryptography-vectors_2.8.bb b/meta-python/recipes-devtools/python/python3-cryptography-vectors_2.9.2.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-cryptography-vectors_2.8.bb
rename to meta-python/recipes-devtools/python/python3-cryptography-vectors_2.9.2.bb
index 948aab9e0..60316fc74 100644
--- a/meta-python/recipes-devtools/python/python3-cryptography-vectors_2.8.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-cryptography-vectors_2.9.2.bb
@@ -4,8 &#43;4,8 @@ SECTION = &quot;devel/python&quot;
 LICENSE = &quot;Apache-2.0 | BSD&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4">&quot;file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4&quot;</a>
 
-SRC_URI[md5sum] = &quot;a744ed29bb9ef56b3a50317fea3b218e&quot;
-SRC_URI[sha256sum] = &quot;6cd32174c56a3eca72f64af43c1daacaae758cfa5ff9d280dfcf818fa11ef116&quot;
&#43;SRC_URI[md5sum] = &quot;657349b8de73959fc49ba15fd7346b58&quot;
&#43;SRC_URI[sha256sum] = &quot;99ac91c4d89572399b097240809af1b8f67f4bedf43398d290c9b2b3d9f491b4&quot;
 
 PYPI_PACKAGE = &quot;cryptography_vectors&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------AE47AB1D22813455BD29CDD5--

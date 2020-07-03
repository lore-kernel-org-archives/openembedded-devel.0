Received: from NAM04-BN3-obe.outbound.protection.outlook.com (NAM04-BN3-obe.outbound.protection.outlook.com [40.107.68.78])
 by mx.groups.io with SMTP id smtpd.web11.10825.1593785195776380786
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jul 2020 07:06:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=dH0PbUjE;
 spf=pass (domain: windriver.com, ip: 40.107.68.78, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FJ+5A6BxJo3WOXvfH6Pv/ojPeaI7q2LWLA4CGg60ZGEsEnSWTMkkXUfRv+nHl3S9ZvzMSePg/7krXS+pNyEfjnYpddUHbLWpxsC9z2Ct935gOuDskbrNzMKnxI4kG92JUS11EsTOCuG2PKipZQq2+sfDxfTduOZZyGqDQ2ir3/I9K66cTOqdNbXIcarT2BVuZi6H4UjYoejRFy1SwOUIpBkPIBFrpSS+fNeG0cU6fp4JvD9GTZxwC3K3VmxI/kx8K9M9HLpOrs7jRevxarU2MHnHu8H1nkxxXQS/bzmWo7KDbhFg1XTIbO25bxjfxTP7Rxu9bGZBbEZWKoO0B5s89w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xovzy70qQnC8n0PQLUS7smGfoesrFIZxm0L6mV6NG30=;
 b=ZBrfMAeb7rZmBLWvz3fXvEqLX6wqxqZT25guWhUjFMKMK5wrSa4WSkAGcD1Tjcme5zuX11L5yoIQhleDW9hsf+gCVXeqkqDfV7t3aRvPWrMObWPc6JjNlqz7ZZgVc98/m9ZCAtJIBMqGbcThPr0Ku+bTudQcOOgHhswSRgRDdvVgLjMuZ0SUu2mGE4plsEtEVSEpDNCsLvX36R8b/l3N4yHw8RYos0MsQIPbVfOPdHdgIvpPcPfuFOdzTxB2H/NOYQQZcmOstzlyAXUs48hp48snw7exFiSnWqrUT6fxZynzfH32m10NhTaAOVeMkFt8E69ae8Uf4d2H1tPrnT6pRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xovzy70qQnC8n0PQLUS7smGfoesrFIZxm0L6mV6NG30=;
 b=dH0PbUjEz8TOpBIPh9470mP+XRdtbZQei0zV3vqJhPB/YkvzK2uRi8LFojc7K9WDhSAey+WQgrAyx5I6mvMFlS0xIr4L+XzYd1POar4i0F1yd8Hp5v5MKjFcisisjc7ShwMB5zscA6t1WsxnJpCrJOtqUsLj0FI4TsOXvBirW7E=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM6PR11MB4300.namprd11.prod.outlook.com (2603:10b6:5:1dc::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.22; Fri, 3 Jul 2020 14:06:34 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3131.036; Fri, 3 Jul 2020
 14:06:34 +0000
Subject: Re: [oe] [meta-python][PATCH 7/7] python3-h2: Upgrade 3.1.1 -> 3.2.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200630171119.25540-1-leon.anavi@konsulko.com>
 <20200630171119.25540-7-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <83193ecb-7e42-f816-201d-5ddc523e2ec5@windriver.com>
Date: Fri, 3 Jul 2020 10:06:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200630171119.25540-7-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0128.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::7) To DM5PR11MB0011.namprd11.prod.outlook.com
 (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0128.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23 via Frontend Transport; Fri, 3 Jul 2020 14:06:34 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a6095280-bb9e-473b-104c-08d81f5a4b3d
X-MS-TrafficTypeDiagnostic: DM6PR11MB4300:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB4300F2D67F2800771CFC6FE39F6A0@DM6PR11MB4300.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1002;
X-Forefront-PRVS: 045315E1EE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SW6fxXKfZS+VYuOqi8JDrpKT+m68pL+TMT1Pxulg6TZuPOy4osZN/qnR4X5C0/qo26B29Al2YIUFlb90WesfPhch0ls3I/J0z4FxXf7tAB0ekSjwOEFBzyJWtpQhOmnBSXKV+qnE1sZWbkVN3b5FxyR9Wl/FFT9MRhQwx1FjXaHGt4W64gdSfrKvr144xpmyqWnkoPldQr3vr4rS7wbGnN+3PlCmnaEZ3dJT8GH8LiKS5oYZdaROI8WPTDyXj1wlaEy7xeRoB5gHra+JE/l0htQdCPzvqbuQStYDho0RNk0XK9fVa6Uvey5tnwXuWW2zfsZ03F21A1TFxv4t7yV7wMkOR+LiuA32Ri6pP/FfUbhw4NFwV7W6IMZExLF7j7NFtrTziGYj9SqI8BYbGbWoEjtwa18jwUITQBVuKvFHnY8KrGaFYr+bszWp8pAC14IhaR/tJtxktvrQCkmZm/uwyA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(366004)(396003)(376002)(136003)(39850400004)(31696002)(66476007)(66556008)(66946007)(16576012)(6486002)(2616005)(478600001)(166002)(86362001)(966005)(16526019)(956004)(5660300002)(44832011)(8676002)(2906002)(186003)(26005)(31686004)(316002)(8936002)(53546011)(52116002)(36756003)(33964004)(83380400001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	PG3en+J+OmSuk7vO4QMM0sttOcL5/7+iMQyEjnBAJpxRRwWuYfqBpLu/FK97Bf7AI950M1f1yZg3mxWxqLeBn+QypoZ6H/0KPCj4DTdTExJoQSFvYxdeT1tawl7+8oQFFME9jggiLtX2DkmIKrdV4fl9lpgxY8oW6/llAALliR4Aqf7N6VCVoUe3MsC1NAKBpARnF/JbStunKog4t4CwofFcCY1+iltgR9Eju0NbANvVUK1PF28tGEogSz+U3t2WQVQQ3wkZNZFrIXaedjAt+pUONyEq+qB48IMQqhlLJj6JGzhNnbZNHUGYkzj+H8PNaAMbZk8EwzZWYWw+ggDH0+4sFyhypOV/B/BTNkCRX0ttt/3Okt19uvoWRq5srZnUWk0DfBLOjCUN2qA+2Y1UJng/0p6nT83KX+KfK48fjK4OuXaW/M914e+VX0yUfLfbr/DrUawLc9sg6hPKrOZ6ClnszuaAbaXiL9bOMxxzWhW6SBhpupgcxiEdAjvQgKKK
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6095280-bb9e-473b-104c-08d81f5a4b3d
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2020 14:06:34.5014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XEwjFldgE12859bYbQAzIeAb1LDfJL81YSoLlaFCOTgczgnfP3crBrB8SEOeYbbOfTURrdv9OH/vngWeEo7xx9orJIFTowEuk1Yl8jER+CA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4300
Content-Type: multipart/alternative;
 boundary="------------F6FC2F4A6BADBC3EE33BBD31"
Content-Language: en-US

--------------F6FC2F4A6BADBC3EE33BBD31
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/30/20 1:11 PM, Leon Anavi wrote:
> Upgrade to release 3.2.0:
>
> - Receiving DATA frames on closed (or reset) streams now
>    properly emit a WINDOW_UPDATE to keep the connection flow window
>    topped up.
> - h2.config.logger now uses a trace(...) function, in addition to
>    debug(...). If you defined a custom logger object, you need to
>    handle these new function calls.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python-h2/{python3-h2_3.1.1.bb => python3-h2_3.2.0.bb}    | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-connectivity/python-h2/{python3-h2_3.1.1.bb => python3-h2_3.2.0.bb} (68%)
>
> diff --git a/meta-python/recipes-connectivity/python-h2/python3-h2_3.1.1.bb b/meta-python/recipes-connectivity/python-h2/python3-h2_3.2.0.bb
> similarity index 68%
> rename from meta-python/recipes-connectivity/python-h2/python3-h2_3.1.1.bb
> rename to meta-python/recipes-connectivity/python-h2/python3-h2_3.2.0.bb
> index 5d9a65530..bdc110fb6 100644
> --- a/meta-python/recipes-connectivity/python-h2/python3-h2_3.1.1.bb
> +++ b/meta-python/recipes-connectivity/python-h2/python3-h2_3.2.0.bb
> @@ -4,8 +4,8 @@ LICENSE = "MIT"
>   
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=b6b2f6bbe76528af543242d606c14851"
>   
> -SRC_URI[md5sum] = "950b5a62a2a608dc4547a01edf99aa8f"
> -SRC_URI[sha256sum] = "b8a32bd282594424c0ac55845377eea13fa54fe4a8db012f3a198ed923dc3ab4"
> +SRC_URI[md5sum] = "197a99c09f344a0dd987fab9801dc8d0"
> +SRC_URI[sha256sum] = "875f41ebd6f2c44781259005b157faed1a5031df3ae5aa7bcb4628a6c0782f14"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------F6FC2F4A6BADBC3EE33BBD31
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/30/20 1:11 PM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200630171119.25540-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 3.2.0:

- Receiving DATA frames on closed (or reset) streams now
  properly emit a WINDOW_UPDATE to keep the connection flow window
  topped up.
- h2.config.logger now uses a trace(...) function, in addition to
  debug(...). If you defined a custom logger object, you need to
  handle these new function calls.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200630171119.25540-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python-h2/{python3-h2_3.1.1.bb =&gt; python3-h2_3.2.0.bb}    | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-connectivity/python-h2/{python3-h2_3.1.1.bb =&gt; python3-h2_3.2.0.bb} (68%)

diff --git a/meta-python/recipes-connectivity/python-h2/python3-h2_3.1.1.bb b/meta-python/recipes-connectivity/python-h2/python3-h2_3.2.0.bb
similarity index 68%
rename from meta-python/recipes-connectivity/python-h2/python3-h2_3.1.1.bb
rename to meta-python/recipes-connectivity/python-h2/python3-h2_3.2.0.bb
index 5d9a65530..bdc110fb6 100644
--- a/meta-python/recipes-connectivity/python-h2/python3-h2_3.1.1.bb
&#43;&#43;&#43; b/meta-python/recipes-connectivity/python-h2/python3-h2_3.2.0.bb
@@ -4,8 &#43;4,8 @@ LICENSE = &quot;MIT&quot;
 
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=b6b2f6bbe76528af543242d606c14851">&quot;file://LICENSE;md5=b6b2f6bbe76528af543242d606c14851&quot;</a>
 
-SRC_URI[md5sum] = &quot;950b5a62a2a608dc4547a01edf99aa8f&quot;
-SRC_URI[sha256sum] = &quot;b8a32bd282594424c0ac55845377eea13fa54fe4a8db012f3a198ed923dc3ab4&quot;
&#43;SRC_URI[md5sum] = &quot;197a99c09f344a0dd987fab9801dc8d0&quot;
&#43;SRC_URI[sha256sum] = &quot;875f41ebd6f2c44781259005b157faed1a5031df3ae5aa7bcb4628a6c0782f14&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------F6FC2F4A6BADBC3EE33BBD31--

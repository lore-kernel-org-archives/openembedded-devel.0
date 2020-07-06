Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.50])
 by mx.groups.io with SMTP id smtpd.web10.60532.1594050156146811405
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2020 08:42:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=IB3V0XQc;
 spf=pass (domain: windriver.com, ip: 40.107.243.50, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BYLDaS+krmLjaruTR5hy4xoCqFd1wqZbagRXbxfuLUIx6Ys9Jm5AEhwx2FP7CFncrC4R1yYzgA+YiBLKRE27UIMKS4IDrkEFDxhRoow8wjh5OlM+HjSgHohhbTz5I0n+2NGENdfCf1Mf+ETcFkYnErWcqDqZFeRfKxOHU9JBF2hbwbnuuKTV7mBUYDWjoSc/V3eCWudSP9bxrZshy6ilt1qWbxHM5TURqLW9rT2kQ/awMi3ifHQ+o+nnrLQ91H+s+dj4WJ5tejTs5PsEIqcckkw1DF2A6MtF1mvEdFwqjIJB95wAz8PiFED38gSJ4xY3DBxhQbEUKDNvPivysS1omQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X3WOC0Z8d4qYkBV4KwCCUnhSzz83nobxGI6qhL1Nrh8=;
 b=hwhdZ+AlBAs12RyF7OkjREAcB+Lj3kes98AzuFwvEEwwitJD79Gxv3GafpflsOwyjBMRgfrHNlyXPB/OC9IMsXIbmygjjWYiEALn4m23H6EyoQhUwt2Sk7KArrFG/4grchCmDizv+eX8rD3q+mOwt47OgQ7c4XTgFe4ZvXuRn3MOVSuXQR/cWJfD6novuvJk57N34jE6uz4HFhALagVrRB8rJrlAOZjBswnBZ8cN6bQHsBUV21n+XWtRmshcpcGWrKk1FSALZ4fTrUxr2IncTBVk8DTKRCIeu7zxGhTMWo7GesGYtdk5g48SgcY47fr4hQF/vDdQH3S03Jv4mTpBtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X3WOC0Z8d4qYkBV4KwCCUnhSzz83nobxGI6qhL1Nrh8=;
 b=IB3V0XQckSIQbeiENsqA/k78oOULOtrhs75NtQQvDaDuUiaQBmdBD6YY2DJmCflCdtaRuFJnDBZL2OxjGPmBfnO7kxjhx9P17taXjSxtUEDCajC+gw35EC9dEmnQIv104CQjEXzgDxF21UlDm/9JvgehHJPdhqmjbiYQ/JFQagg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM6PR11MB3275.namprd11.prod.outlook.com (2603:10b6:5:5e::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.23; Mon, 6 Jul 2020 15:42:34 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3153.029; Mon, 6 Jul 2020
 15:42:34 +0000
Subject: Re: [oe] [meta-python][PATCH 2/5] python3-dbus-next: Upgrade 0.1.2 -> 0.1.3
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200702104819.14256-1-leon.anavi@konsulko.com>
 <20200702104819.14256-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <48500d0d-0268-a89a-0e00-e16d22ef54b1@windriver.com>
Date: Mon, 6 Jul 2020 11:42:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200702104819.14256-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0154.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::33) To DM5PR11MB0011.namprd11.prod.outlook.com
 (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0154.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20 via Frontend Transport; Mon, 6 Jul 2020 15:42:34 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d5b452f-5817-490d-9a24-08d821c333b1
X-MS-TrafficTypeDiagnostic: DM6PR11MB3275:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB32751E03F43A69AA342991AF9F690@DM6PR11MB3275.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 04569283F9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CPFWRZ0425ftH7admqDNFs8zEnJEqJ1xcMDQZtVLCROLXCKvwD8y4YM1x/JqxYiAiwyr+VBBv7EfeyEII+CuLFTXgUNYjFlutKiGRI+blpZNpmylgsJEdFBP9PZGpzO4Xq3C+ZGN646WYXGttv2b4QsBhDXznzERc8RTdkRYFWyHU+MuvH50KkRqV3Li+hFM8iJmPbG7nrQhiF+oOBwDrGNmQ/rfaS60LMcj2Fa+W6VpjhkG33tvDQNAOQf0ZpSwxQrpwRWRT/CFDoe+g2ZKScaekVhy/sji3+FXEcbOQpJdB4cO+H/CsxJy4WIn9lFr6/5TS/1dYZ5Q8+F+Qmc5t9wH1UlwNcyLrDxIXFlnnhnVu0nZfZU6zvlqrEuEOGS7ZEpN9c4EnSN6uFU4cnO4GPhnutWHegW1W3d8T49nDAM1n/illNan0+fCY5vVL/7bZRyS+itZub+TlScGL+2JiA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(346002)(376002)(366004)(39850400004)(396003)(33964004)(16576012)(36756003)(26005)(8936002)(8676002)(316002)(31696002)(6486002)(16526019)(86362001)(2616005)(83380400001)(44832011)(186003)(956004)(2906002)(166002)(66946007)(52116002)(31686004)(66556008)(66476007)(5660300002)(53546011)(478600001)(966005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	5a584a+arWj7dTouSfVs2ZoTn1wR6Rmk/i74Ns05qigOa0RcHb9St3fvIuc2gColHyR2tNHkNT3VuVy2DTqWKx343FtYH31bUAZIvX1jtpYzWn31NyWAMvzbmPovogZ6yAfRc7tuMK0khpNWQ8sJSticJ/Z5l14kl7AOEGxCn+T3WZJX9FjAq0kuV871LPs1r0BWf1OQmBjRu8anj8pxBv4v0Zk7azOyVai9rJOZZ6XdqPW9GrDCmycFH7NibkB85WtEGtrDCopI5wD5VA/o9wru2BJ39W/+pYcIzE6mfIzIiPqRLLXdwJFXhoKZIqMzE7dgZPFhAhwuKlvk9rvOalKfUq9fAzD+WEAgRN+grFZphYmJD/Wu5VjRhVAeAuYMM1DD7iZ2awdUZmjyR0cXqMHGOJuyiXZQwPuJaolDLWxkwRgnTRiSiqB8EiyQOkOTSGm0Ny9Gy+YLVd+deLK+mhA6bf8/1nEAAOW/EK+D9bGeiUQHcy9TGIqZdtEZ8CVK
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d5b452f-5817-490d-9a24-08d821c333b1
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2020 15:42:34.4130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NUJXhJdWWcU6GhKej8swWS5/7LYyYoik8NEo2us3pVUAs7utscfmuINljixc63GDNhPxWbhntx/38gD1OyvRe/Fav3WMdgU66hNz/ZoBKvQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3275
Content-Type: multipart/alternative;
 boundary="------------CC14CDB9BF03FE5A26688ACA"
Content-Language: en-US

--------------CC14CDB9BF03FE5A26688ACA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/2/20 6:48 AM, Leon Anavi wrote:
> Upgrade to release 0.1.3:
>
> - Add the object manager interface to the service.
> - Allow coroutines in service methods.
> - Client: don't send method replies with NO_REPLY_EXPECTED
>    message flag.
> - Fix duplicate nodes in introspection.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...ython3-dbus-next_0.1.2.bb => python3-dbus-next_0.1.3.bb} | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-dbus-next_0.1.2.bb => python3-dbus-next_0.1.3.bb} (52%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-dbus-next_0.1.2.bb b/meta-python/recipes-devtools/python/python3-dbus-next_0.1.3.bb
> similarity index 52%
> rename from meta-python/recipes-devtools/python/python3-dbus-next_0.1.2.bb
> rename to meta-python/recipes-devtools/python/python3-dbus-next_0.1.3.bb
> index 2784013a1..4da4be81b 100644
> --- a/meta-python/recipes-devtools/python/python3-dbus-next_0.1.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-dbus-next_0.1.3.bb
> @@ -1,10 +1,10 @@
>   SUMMARY = "A zero-dependency DBus library for Python with asyncio support"
>   HOMEPAGE = "https://github.com/acrisci/python-dbus-next"
>   LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://PKG-INFO;md5=b32e18a71bcdd072bce21f204629a104"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=94e750c96e56788499b56c81de91431c"
>   
> -SRC_URI[md5sum] = "df838d695284dd1775860f9691a8663f"
> -SRC_URI[sha256sum] = "a567d845ceed5feac48dda7faeb9ff2571f9a434a3c32b9b363f763e82368762"
> +SRC_URI[md5sum] = "a823270b11c8dd7932c12adc6b2fadbb"
> +SRC_URI[sha256sum] = "4dd9097778224c69228f7f2a0f52e9b13ec2c75e87974ad312525c927835e8fb"
>   
>   PYPI_PACKAGE = "dbus_next"
>   
>
> 

--------------CC14CDB9BF03FE5A26688ACA
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/2/20 6:48 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200702104819.14256-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.1.3:

- Add the object manager interface to the service.
- Allow coroutines in service methods.
- Client: don't send method replies with NO_REPLY_EXPECTED
  message flag.
- Fix duplicate nodes in introspection.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200702104819.14256-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...ython3-dbus-next_0.1.2.bb =&gt; python3-dbus-next_0.1.3.bb} | 6 &#43;&#43;&#43;---
 1 file changed, 3 insertions(&#43;), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-dbus-next_0.1.2.bb =&gt; python3-dbus-next_0.1.3.bb} (52%)

diff --git a/meta-python/recipes-devtools/python/python3-dbus-next_0.1.2.bb b/meta-python/recipes-devtools/python/python3-dbus-next_0.1.3.bb
similarity index 52%
rename from meta-python/recipes-devtools/python/python3-dbus-next_0.1.2.bb
rename to meta-python/recipes-devtools/python/python3-dbus-next_0.1.3.bb
index 2784013a1..4da4be81b 100644
--- a/meta-python/recipes-devtools/python/python3-dbus-next_0.1.2.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-dbus-next_0.1.3.bb
@@ -1,10 &#43;1,10 @@
 SUMMARY = &quot;A zero-dependency DBus library for Python with asyncio support&quot;
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/acrisci/python-dbus-next">&quot;https://github.com/acrisci/python-dbus-next&quot;</a>
 LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;md5=b32e18a71bcdd072bce21f204629a104">&quot;file://PKG-INFO;md5=b32e18a71bcdd072bce21f204629a104&quot;</a>
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=94e750c96e56788499b56c81de91431c">&quot;file://LICENSE;md5=94e750c96e56788499b56c81de91431c&quot;</a>
 
-SRC_URI[md5sum] = &quot;df838d695284dd1775860f9691a8663f&quot;
-SRC_URI[sha256sum] = &quot;a567d845ceed5feac48dda7faeb9ff2571f9a434a3c32b9b363f763e82368762&quot;
&#43;SRC_URI[md5sum] = &quot;a823270b11c8dd7932c12adc6b2fadbb&quot;
&#43;SRC_URI[sha256sum] = &quot;4dd9097778224c69228f7f2a0f52e9b13ec2c75e87974ad312525c927835e8fb&quot;
 
 PYPI_PACKAGE = &quot;dbus_next&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------CC14CDB9BF03FE5A26688ACA--

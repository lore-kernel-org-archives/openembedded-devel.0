Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.44])
 by mx.groups.io with SMTP id smtpd.web11.9540.1593183657548001238
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jun 2020 08:00:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=pphW0cRp;
 spf=pass (domain: windriver.com, ip: 40.107.244.44, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dW4PkQ38Iviuh/weKGfHVnuEYMPX6rjZkYBIiOc4Veo4Ka7OF9b/IE8UWoYwLiac+KlwmPlMZl4If5gt7ePPbROhdsiqRxRNQJhPIM7+tUloufLnY44X3Iqf8l13N4WmfKkbKMm6FATvHjgU0JCjPrwSLLrHQ31xTxPBiItoeiWK/TDyx1yU+iw8R2SkYxk+CRhhmx+C+JNc6hrzF/iYksuYobH/ilpRqfmpe55WSyuooiY/cxk5Arqs1UBBDBvTrpw7fwSN0DMNw5JusvMw/pxU2gIE6rHjA/y7OP+UDxJkMDHSTdyfXSW4CatOqsCWKwIf6glWd0R+4LPr7sGEcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3FUmwePtkPYVdP4umVrGNHtl39dI5w9RgpVJr204PHc=;
 b=ZU6D9rpaKZMfje3muMVAxEAsBP+FR9UxQelrUVu9aIecbVr9OLDbh1CCEggITvwwZDP61sBbk71yFgEwxUboJP5X5EtGOcScnbajcdQYjcNcjTsELNuAPYFgFOTkc0p5XrNagvI7AMEhfHh6sJH9SriI4fe3FiJGq7clnWqvKuoSyo9CJ+KDmAgZuRa4aSKPyNQSNCA82kHo+/2wyIpw8cOn8KrxPZUWRt9X0kjq1p+Sry+BoOawwFlKyKWCv/FF41wZ88bn2zWQSHNE37H7byjnDNnPendxyDUCra3retiDh8dAyH9TqpkOzAZoWNgVP+Pby8cn14Yyw1qeiLZx4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3FUmwePtkPYVdP4umVrGNHtl39dI5w9RgpVJr204PHc=;
 b=pphW0cRpHvnIivyV0LHzwoXIJIsD2kqolxR1ZUP1Osaslk22kFq/LsF5PhDiaH70TZ13yIHokyZ78jlY9NuXC2Yi+jrYLkduQMRwYxB6IVGR8pz/wfFUmiiJq5bLL2NvFhGAhCqizqsj5v/+c430KZZX9yqnNLbY37+0qI7dATw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1604.namprd11.prod.outlook.com (2603:10b6:405:e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20; Fri, 26 Jun
 2020 15:00:56 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3131.025; Fri, 26 Jun 2020
 15:00:56 +0000
Subject: Re: [oe] [meta-python][PATCH 03/12] python3-socketio: Upgrade 4.5.1 -> 4.6.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200625090719.16068-1-leon.anavi@konsulko.com>
 <20200625090719.16068-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <37d8ffc0-0675-a7ac-de0a-6fa3405699c6@windriver.com>
Date: Fri, 26 Jun 2020 11:00:54 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200625090719.16068-3-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0024.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::37) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTXPR0101CA0024.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::37) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21 via Frontend Transport; Fri, 26 Jun 2020 15:00:56 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a301c385-f320-43a1-2160-08d819e1baa4
X-MS-TrafficTypeDiagnostic: BN6PR11MB1604:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB1604F6A757DEBA52980A1E4A9F930@BN6PR11MB1604.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-Forefront-PRVS: 0446F0FCE1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KgBcpIAFaxvL0ux98gOb9f2OMRZujehAvx4y0EpI/8Uf/yxsd1itScM3NWC/tbkHYPm8v4Hi2ggq6h4UTq1R/xEkQyXab6eq3E+hxjlNBrLB/kt0cPaFCtnwxHkP9sbJiEd+VSkpZrHJB5SaBMH5yNENqV80QUNr1MRE9rXYB2DOz0lGsbDoQ11uwGyoS72EFkAHdcn6ZkkL5fqjjZhGBOA1fzmdwi6ujgIIcoJvAlqLjwBhA6WDzBU0lt/r0RjMnI5X+NVKCbSKIvZcyh0ivuQVlnthXlveoEP2GLnfcmXv4vs/Ei0xyg9Eno85skqZ3Y0LKUHbKdJ8mr5Nsyi8dc9r1Jbm8B6FAN+huryJgAgzSiW5EqD9TJxUuh7PrZiMSDYuPtYpEtbHiVnaJ428g38t5VE+PRMkfmpo4ROMoaqZCM0xIZf/zFFrqY5YBZ0VqFYDGttMO/W34nJBcPJ+Jw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(346002)(136003)(396003)(376002)(39850400004)(2616005)(956004)(31686004)(66556008)(66946007)(44832011)(83380400001)(6486002)(86362001)(16576012)(31696002)(166002)(316002)(966005)(66476007)(53546011)(8936002)(8676002)(36756003)(2906002)(186003)(478600001)(5660300002)(33964004)(16526019)(26005)(52116002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	32bw7CpZlpgbMvIp/ydj8uZ8Z1WVduatj0mC57VwG5J+lHOcZwuOX1NbDIVEOe1nIUHk+ggzMcOJ0rmtVHRdqIysPm3pzDbcS/AYgwp2OV1FzrU5k73ZP1kydDYm3RLDXKC75n9lN1KuueNUNP+1rEJazK/HlkPMs/WUgq5mY6BjNOdRHV4hKE+hsOxQLEr/VbpLqJuuUcDclEvKobatrRBv7Zl6L4HCuPDjai7ItwI0wBX7cYMlQzfKPTxnlLvwyBNu1utq7CHs1+8JrqVf39cCKmFDsLKPszj+nAfS1FRBSPCqQ6cTT6rqRo99HRMeTw14fnsOngpIxAafwsOtDJpmBkQ1LASbD6V34jRDc5apIRGur0SBcr7URNIPVCk10/c636wIY9K0qdjrOJeDwpvMPRCBkj3RJiaFCRDStsQZcEKpezf330rM84krNdbX55KFwIbGH2MmByTySBM/1smPZu1Mue9rZAo3y5dfn8E=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a301c385-f320-43a1-2160-08d819e1baa4
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB0003.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2020 15:00:56.5088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YDKPDrRRQbWaOb8rAOhzPHrLMo00g2Xj5bzdVVRKpaOgAHsLyLj6nhjvPt3fxuLsAhJts6C5zpRDT3CTPOXjDpvw/dmmm2Q6bQcsEoaHqGU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1604
Content-Type: multipart/alternative;
 boundary="------------EFEA7BA19F9EF8460672EE35"
Content-Language: en-US

--------------EFEA7BA19F9EF8460672EE35
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/25/20 5:07 AM, Leon Anavi wrote:
> Upgrade to release 4.6.0:
>
> - Improved handling of rejected connections
> - Fix multi-namespace disconnect logic
> - AsyncPubSubManager does not await for can_disconnect()
> - Require a recipient in call() function in the server
> - ASGI startup and shutdown lifespan handlers
> - Remove references to Python 2.7 in the documentation
> - Fix server example in docstring
> - Fix documentation typo
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-socketio_4.5.1.bb => python3-socketio_4.6.0.bb}  | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-socketio_4.5.1.bb => python3-socketio_4.6.0.bb} (83%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-socketio_4.5.1.bb b/meta-python/recipes-devtools/python/python3-socketio_4.6.0.bb
> similarity index 83%
> rename from meta-python/recipes-devtools/python/python3-socketio_4.5.1.bb
> rename to meta-python/recipes-devtools/python/python3-socketio_4.6.0.bb
> index 54ecbbaa0..7d96398e9 100644
> --- a/meta-python/recipes-devtools/python/python3-socketio_4.5.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-socketio_4.6.0.bb
> @@ -9,8 +9,8 @@ inherit pypi setuptools3
>   
>   PYPI_PACKAGE = "python-socketio"
>   
> -SRC_URI[md5sum] = "3dbd0a2ebcf34632f67327b665cbb951"
> -SRC_URI[sha256sum] = "149b98c33f8c3d09273fb4ebeb83781e4dc9411b56b27d9f058bec1bd1ed74b7"
> +SRC_URI[md5sum] = "44bb7854234e144655ef9c34b0165704"
> +SRC_URI[sha256sum] = "358d8fbbc029c4538ea25bcaa283e47f375be0017fcba829de8a3a731c9df25a"
>   
>   PACKAGECONFIG ?= "asyncio_client client"
>   PACKAGECONFIG[asyncio_client] = ",,,${PYTHON_PN}-aiohttp ${PYTHON_PN}-websockets"
>
> 

--------------EFEA7BA19F9EF8460672EE35
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/25/20 5:07 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200625090719.16068-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 4.6.0:

- Improved handling of rejected connections
- Fix multi-namespace disconnect logic
- AsyncPubSubManager does not await for can_disconnect()
- Require a recipient in call() function in the server
- ASGI startup and shutdown lifespan handlers
- Remove references to Python 2.7 in the documentation
- Fix server example in docstring
- Fix documentation typo

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200625090719.16068-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-socketio_4.5.1.bb =&gt; python3-socketio_4.6.0.bb}  | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-socketio_4.5.1.bb =&gt; python3-socketio_4.6.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-socketio_4.5.1.bb b/meta-python/recipes-devtools/python/python3-socketio_4.6.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-socketio_4.5.1.bb
rename to meta-python/recipes-devtools/python/python3-socketio_4.6.0.bb
index 54ecbbaa0..7d96398e9 100644
--- a/meta-python/recipes-devtools/python/python3-socketio_4.5.1.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-socketio_4.6.0.bb
@@ -9,8 &#43;9,8 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = &quot;python-socketio&quot;
 
-SRC_URI[md5sum] = &quot;3dbd0a2ebcf34632f67327b665cbb951&quot;
-SRC_URI[sha256sum] = &quot;149b98c33f8c3d09273fb4ebeb83781e4dc9411b56b27d9f058bec1bd1ed74b7&quot;
&#43;SRC_URI[md5sum] = &quot;44bb7854234e144655ef9c34b0165704&quot;
&#43;SRC_URI[sha256sum] = &quot;358d8fbbc029c4538ea25bcaa283e47f375be0017fcba829de8a3a731c9df25a&quot;
 
 PACKAGECONFIG ?= &quot;asyncio_client client&quot;
 PACKAGECONFIG[asyncio_client] = &quot;,,,${PYTHON_PN}-aiohttp ${PYTHON_PN}-websockets&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------EFEA7BA19F9EF8460672EE35--

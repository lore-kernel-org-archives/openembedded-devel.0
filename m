Received: from NAM04-CO1-obe.outbound.protection.outlook.com (NAM04-CO1-obe.outbound.protection.outlook.com [40.107.69.73])
 by mx.groups.io with SMTP id smtpd.web12.60590.1594050039317214226
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2020 08:40:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=VU/Xyjaf;
 spf=pass (domain: windriver.com, ip: 40.107.69.73, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UzGx3xMjyEvmTM/5LubMvJ/WL8dlUAmXnoBfoCe3dTPQglJolWelS+sthe9stRYJcMUfM++WJvOiiqsOZ58V4CWvEvzJXWnhSl8LFPAAGvehNtuCwqzdtN45Dc7Se0bQxpVrf/evNwm5L1pqgbELjBih6YPos42V3pCt3Tq/GcWlzRWNl9i0ooOydP/7ABYc1fse5GRY3sbqHPePJpWFUvyzPElf1hcCx5fwMIZH6OS8voI2iPTajNP9t6VMcTViN6KofH1wOBAwcjeKs5DGHdPDFhUQXBbpZetvctgt5AypvRaS7X+Ii7NvuEiXf+PZTqLdg4RnYXbJo5DFRknOzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9mCozX8BL9CLD7Gpa8LvFvgxKQ/ieNIPwh66Jom5/2I=;
 b=XI9JV9wN47N6aZAqm6cBuQ1noNGhNBwuukoPTrUOqVeibBc5kUAKsN7cu6IaKlrpIooz907imXAAND7BK+6r4KhTip/3HNy2kG1dczbRLX5oO4efd4sA+OLUOVkqDU/lGwFm3wqQxvBKzk60H+ovjgJtPfg9k+0DMoba4GMYRy+BwPLXMljSDjv9e28qVJeK2LIRQAJX9VbLbsws4ZmRgYS4HS8cyagDa2YCqPUWerlyXguSJixDpvGkIz8U0PBsaDdEfY8btoYnwnF3vngiXB8YeMltfaNQQ9bmPOSGCzcpD7JbcaYGqTTJizs4i4Ubm4fn6L9NSdD2RNZfV9PslA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9mCozX8BL9CLD7Gpa8LvFvgxKQ/ieNIPwh66Jom5/2I=;
 b=VU/XyjafXLnefcbv5Ocj39zheo2lxqVbxaUCkATQOjl9Yr6GE+OuoOQYJnAM++PrXHw56qYXFaeLGJ0UjmNu5LbaY1EVljWd6AttB7rkph1cwtWTSRnIcWJt2r2QEmoP0KSwPg3USl3yFu9tjLntuQ8RUiMeCNKHJPkTD69xmzI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM6PR11MB2827.namprd11.prod.outlook.com (2603:10b6:5:c8::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.20; Mon, 6 Jul 2020 15:40:37 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3153.029; Mon, 6 Jul 2020
 15:40:37 +0000
Subject: Re: [oe] [meta-python][PATCH 3/5] python3-google-api-python-client: Upgrade 1.7.11 -> 1.9.3
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200701142243.1686-1-leon.anavi@konsulko.com>
 <20200701142243.1686-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <2bdca9dd-85b2-d424-6e75-a14878a76af8@windriver.com>
Date: Mon, 6 Jul 2020 11:40:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200701142243.1686-3-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0060.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::29) To DM5PR11MB0011.namprd11.prod.outlook.com
 (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0060.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20 via Frontend Transport; Mon, 6 Jul 2020 15:40:37 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e219727-544a-4286-96c3-08d821c2ee2a
X-MS-TrafficTypeDiagnostic: DM6PR11MB2827:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB2827C7B67471D30410DFD4AE9F690@DM6PR11MB2827.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:883;
X-Forefront-PRVS: 04569283F9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1RxUKCnbNV9jkKkvuhPUMOlS4SEEt9qBdnkrQfK7dK7dV9r2s2DEGqhSTIhT3uhYN/8obqHbHyFMsa+jdslHfvZhztlJki+rSXq4uMm3UhEt+TuIddB8xgqK9CYcbjBVswdEkUe7VCGebBSdA1MgHFaBh4/zPuq4BIV1YX+XsA2d7y3WaL2rbwU7Prz4FXsVezPXHhoAm1Zy2XW6Za7Fb04nwxBr834KZV4Im454xZRxuHyp7hu74At0tfDscHMZEpYfuB1gX2GDE2cz2wuHT7V9YCLQTVrE9xnooQmHAMxBSocma1EXa/xSdU2DIMGEQTg/w4p5JYII9/8qfxU4KXX8c/gD1Qd4K8MZqvVTAMIZCjK2c39eLRM69OMhH20pPd3HsF0oqgLYCKFv7IIBTs+8w0jrXlOLbtXrEi+gmCEiNX9P4vb0hic0LtikmAiHnuZ4qYWb2qL74na3CsWP9A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(8676002)(66476007)(66946007)(66556008)(966005)(44832011)(498600001)(956004)(2616005)(16526019)(26005)(5660300002)(2906002)(53546011)(31686004)(186003)(52116002)(8936002)(33964004)(166002)(83380400001)(31696002)(36756003)(86362001)(6486002)(16576012)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	UOwOVcivka+gEKzOWpe3DWJkt8dRZ6T5NXPv3W2crLzAacWoe5GoEPkERqF9gYtsNkHk4Yym7tP68eXGpPpUStGLx2EIGiYbHLtZPqqF/oCfri+CGJ//xKY/BNAR8hFynD6yGAoQcgWJC5iLLL+Ie1abgb+YHOTCLGlAD1Oq8FmFn02qdzE/C3yk5ks8RoJ28jURNYAxYTAzLje9I+FqCaUArlf6OXJHsXBHK7H9ftDvSVNlVKp+4vDE5P7Go6h2HIH8rCHmwGboHr8yCOVaTZz2Z+SdkRCupz0RoXrVR/H1DI64UGap21BqSpnqVpqhf9o5WXCDEP5D+z37HGMIZREtVBfnBhYYn3h3V19D93HZyouidQ2T0px7V8tjx7DciJDm2y4knHvCZSzkh+nT1E+FnLzb3zk+XjKmXZU73w9N+8WzceQ/OCHIYAm4zBcnnVjmePMgenvyUTqoT4ohMhAFdwNL1oiNDFwiB8R9rSE=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e219727-544a-4286-96c3-08d821c2ee2a
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2020 15:40:37.7315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z+sf1PN9AXW7RgM+IEQ6SiV4wR0ZcoY6GedwWHg7anP+mdGX8MD/um5jkTDDVJpwP/0LMDLk206CM/FuvDZgxso9AAF4QQNeMXhNb1eDONo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2827
Content-Type: multipart/alternative;
 boundary="------------9C34E3731565F9618B645793"
Content-Language: en-US

--------------9C34E3731565F9618B645793
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/1/20 10:22 AM, Leon Anavi wrote:
> Upgrade to release 1.9.3:
>
> - update GOOGLE_API_USE_MTLS values
> - bump api-core version
> - fix python-api-core dependency issue
> - add mtls feature
> - add templates for python samples projects
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...nt_1.7.11.bb => python3-google-api-python-client_1.9.3.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-google-api-python-client_1.7.11.bb => python3-google-api-python-client_1.9.3.bb} (69%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_1.7.11.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_1.9.3.bb
> similarity index 69%
> rename from meta-python/recipes-devtools/python/python3-google-api-python-client_1.7.11.bb
> rename to meta-python/recipes-devtools/python/python3-google-api-python-client_1.9.3.bb
> index 25e3b9c3f..af4aa5287 100644
> --- a/meta-python/recipes-devtools/python/python3-google-api-python-client_1.7.11.bb
> +++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_1.9.3.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=94023d14f6b58272fd885e4e3f2f08b3"
>   
> -SRC_URI[md5sum] = "6e28e8caf2e4d55ed5b7c48a538a61c9"
> -SRC_URI[sha256sum] = "a8a88174f66d92aed7ebbd73744c2c319b4b1ce828e565f9ec721352d2e2fb8c"
> +SRC_URI[md5sum] = "eb5fa1e3f83b659ff978df1346a55576"
> +SRC_URI[sha256sum] = "220349ce189a85229fc46875d467101318495a4a735c0ff2f165b9bdbc7511a0"
>   
>   inherit pypi setuptools3
>
> 

--------------9C34E3731565F9618B645793
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
    <blockquote type="cite" cite="mid:20200701142243.1686-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.9.3:

- update GOOGLE_API_USE_MTLS values
- bump api-core version
- fix python-api-core dependency issue
- add mtls feature
- add templates for python samples projects

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200701142243.1686-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...nt_1.7.11.bb =&gt; python3-google-api-python-client_1.9.3.bb} | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_1.7.11.bb =&gt; python3-google-api-python-client_1.9.3.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_1.7.11.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_1.9.3.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_1.7.11.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_1.9.3.bb
index 25e3b9c3f..af4aa5287 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_1.7.11.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-google-api-python-client_1.9.3.bb
@@ -3,7 &#43;3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/googleapis/google-api-python-client">&quot;https://github.com/googleapis/google-api-python-client&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=94023d14f6b58272fd885e4e3f2f08b3">&quot;file://LICENSE;md5=94023d14f6b58272fd885e4e3f2f08b3&quot;</a>
 
-SRC_URI[md5sum] = &quot;6e28e8caf2e4d55ed5b7c48a538a61c9&quot;
-SRC_URI[sha256sum] = &quot;a8a88174f66d92aed7ebbd73744c2c319b4b1ce828e565f9ec721352d2e2fb8c&quot;
&#43;SRC_URI[md5sum] = &quot;eb5fa1e3f83b659ff978df1346a55576&quot;
&#43;SRC_URI[sha256sum] = &quot;220349ce189a85229fc46875d467101318495a4a735c0ff2f165b9bdbc7511a0&quot;
 
 inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------9C34E3731565F9618B645793--

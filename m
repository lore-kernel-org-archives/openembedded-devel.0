Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.66])
 by mx.groups.io with SMTP id smtpd.web10.15680.1597154653820736514
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Aug 2020 07:04:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=iuX7SWwk;
 spf=pass (domain: windriver.com, ip: 40.107.94.66, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L92U+f+cqXlVPMm6XFK1ktk2C76jAUyQjAjtjgajLUKAvuYg1Gh2w34aysdJ/LpEWd8XtLfYy1ZKvM8nZ6u+IvTT71pgur9ZmpSnWtjrga8TqMqhiFOlO6DrBVGo7pd6Tw+UvNyCwOo3VDc6l9EU+YGC79276t4bUK8U7L71G6k+0Jyem4G1h4ia7mxfPimSrzLW5MhYFEekQyWL/2klZMAEzSITsqcKUd5lfO8caOU2JI8WOzi1lE8gJQ8lMRTF8Ir77wvc3ybMund906jD4TL54Hc2hQprsCULA9jLgI62NhKbOs+PjnxeJL/sUaMbVRwBoG9+wr22PtY14zYOQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DohDaCN/FYtj4mnJCz6/+cwXLE4BXh3v9RwcTHv6cEw=;
 b=mZgiR6WjKmt3s3KHoSpq+FN14Rb3D+qr06LD4a3Kys8kwtOsq2RUTzz7GSHiUuzm1CNPYcLM3NC+wp/RQZrDPE2MS9kmUwlXK2lIB5EYL6C9sWXGTIQS0YaQAhiqxPyU9LiqChX3qfblfas8QyCkJcIlczC+XYIVUXsgyVvGJTTY84ZHxC0+ECkhnkf2PWoDLeyLzgqQx8oYRnMx/hPBsbFWIcYfFMz80CP8BhdPchQ7uziJC17OsOLAD0YNOBMw7ZMVMOtFzdn/gz22HE+ZdPEaM6vgPCDer44scouV2LtQG2rUDwaye8pgxYQkm3nXu/N5WHXjZpomfWKtb+m4vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DohDaCN/FYtj4mnJCz6/+cwXLE4BXh3v9RwcTHv6cEw=;
 b=iuX7SWwk5hGOujBo42cV4rAQorrCvKRyZlg0Ra8hVuTHPJMIIFem83Lkmnh6mZ6N0ImusgXijxjwqi6nECGmozJK7ePWhv/tmpTpdpNgdbYppFatp5yNdrCO6Rq+pxTW3vplqpKPKtyvfU5EoUY1y9DxPDo6VHW3ICqxb4nGBjs=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4243.namprd11.prod.outlook.com (2603:10b6:a03:1c8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Tue, 11 Aug
 2020 14:04:11 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3261.024; Tue, 11 Aug 2020
 14:04:11 +0000
Subject: Re: [oe] [meta-python][PATCH 1/7] python3-parso: Upgrade 0.7.1 -> 0.8.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200810144318.17106-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <23b0ab59-eae0-a127-7257-4d747636cfe9@windriver.com>
Date: Tue, 11 Aug 2020 10:04:09 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200810144318.17106-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0060.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::29) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0060.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend Transport; Tue, 11 Aug 2020 14:04:10 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 057c928e-28c9-4623-ce2b-08d83dff6c31
X-MS-TrafficTypeDiagnostic: BY5PR11MB4243:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4243308C2245C0AB98B0736E9F450@BY5PR11MB4243.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/rootYxMAV2XZ5AJlWpKUnBDfcbThK4WuCc6sCa7vy67n6tBFk+r+C0U5XF9FTBFmUlzhrRMBu/LnfmvYhOi1kqgOg+/L/Ob3RhCQQlzGhGVRdSChVY2MdZcaF+WS0QKmVh8POmhYU3dz5XF/jjYc5GXg+goli4PmOMkXVgUDNldmbN0ripCBGgyAd5DwmXv7dPJPHF1gtgx8bNseaZ6g2uyaDlzQyrj0iRKMottznv/ufWOXx9g/sGyrrrLBbD6BxkFBMx3AdBYPhsQP3X2JqfIE+W/85LrmsnYrahZM447aBVPxUY5GR06HWmYvP8eFRcrETcyWEWcb6j9fHo0D57RCy0CYCpJ7WiDDksZZyIQOSuIW5cpsgoVYQ98eMHO9DZonqSoYKUH77KmaV3hY+YcUiKae/VKHG1fwGVpf/BD9GVQfp5ao9QIZfqgNCwCgI4B9/qQ7Lvtqi4+z6KaDQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(44832011)(53546011)(52116002)(16526019)(186003)(26005)(956004)(8676002)(33964004)(2906002)(2616005)(31686004)(36756003)(6486002)(498600001)(16576012)(8936002)(966005)(66476007)(5660300002)(66556008)(66946007)(83380400001)(166002)(31696002)(86362001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	1wAbZyw5XNSC4ITDsfHgUTH46OD/KMhr5RKsOKXD9lxYIX1Ybgfj+MiX9RDM9v8DCQwdVz0blNSOQ4hQpe1MEhO3t+E4eHp0DXcPrmV872zfwUDCMkzN58HYxjQNxcakTWJhnblOwHBqGNXcOWqEdgXkWlxA98KGqihHv8OSxxzM7sxhktEQFOtdhI1GSco9MYSSaW02H4adaV2syg9IhrX8bknOgWioF2Zh09Q769XfrPf4XBQX7KB4aCzZqh9VBLVSUqMSQeua05sFyC6XvaVpGSg05lSkOr+QW4Ey+aVFvv5yorjkVsWuQihJ+NyLz9fr5R/F6SC8q62a0mZvIF3KlL8rnOG74a71QmtUtu7vd/OuFDPzoqpgcRH/S1YSIBdcv1orGR+ylD8oJEfrPMFvJCwO4MrFQIqFibOY7t/jBihJetd0ie17LLZSIC98ezLMbb7HruVAlA1q8qo/RHgSqMlp5gq46LlPKsYCR4pX/4/OnigOcqcIrXy0KJ/MqQHCc/NjZ3LRzojNuUpYIUUfomUmxHnDMtuB3gigtkYAlmQsM5OLe+uRpVXs+CQuBTzi+LYwMLoNfph1a5TJKO1Cd4728EzMny2WlSAiOgA69lXqX+a8gjtlN1UI/ESQf2RaQf1RLY2pR/euNJlsgw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 057c928e-28c9-4623-ce2b-08d83dff6c31
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2020 14:04:11.7181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iuBvtSWtlQLiQMrHTtthZq8vvR0NAiiRUHHc1kHJTHSP/+bQR4B9mE4IeVE+SH9pIMZcXas5RGEmvwh2TR3ld8lBrCZG3i8j2iNGcmJJZXE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4243
Content-Type: multipart/alternative;
 boundary="------------3DF173C0CAA7607A6CA89D01"
Content-Language: en-US

--------------3DF173C0CAA7607A6CA89D01
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/10/20 10:43 AM, Leon Anavi wrote:
> Upgrade to release 0.8.0:
>
> - Dropped Support for Python 2.7, 3.4, 3.5
> - It's possible to use ``pathlib.Path`` objects now in the API
> - The stubs are gone, we are now using annotations
> - ``namedexpr_test`` nodes are now a proper class called
>    ``NamedExpr``
> - A lot of smaller refactorings
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-parso_0.7.1.bb => python3-parso_0.8.0.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-parso_0.7.1.bb => python3-parso_0.8.0.bb} (65%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-parso_0.7.1.bb b/meta-python/recipes-devtools/python/python3-parso_0.8.0.bb
> similarity index 65%
> rename from meta-python/recipes-devtools/python/python3-parso_0.7.1.bb
> rename to meta-python/recipes-devtools/python/python3-parso_0.8.0.bb
> index 6d775227c..507087909 100644
> --- a/meta-python/recipes-devtools/python/python3-parso_0.7.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-parso_0.8.0.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=cbaa2675b2424d771451332a7a69503f"
>   
>   PYPI_PACKAGE = "parso"
>   
> -SRC_URI[md5sum] = "eac40cda515ee71e3bb008c404ca3ac1"
> -SRC_URI[sha256sum] = "caba44724b994a8a5e086460bb212abc5a8bc46951bf4a9a1210745953622eb9"
> +SRC_URI[md5sum] = "ee3592994bfc0d0843790544c1b2b702"
> +SRC_URI[sha256sum] = "2b6db14759c528d857eeb9eac559c2166b2554548af39f5198bdfb976f72aa64"
>   
>   inherit setuptools3 pypi
>
> 

--------------3DF173C0CAA7607A6CA89D01
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/10/20 10:43 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200810144318.17106-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.8.0:

- Dropped Support for Python 2.7, 3.4, 3.5
- It's possible to use ``pathlib.Path`` objects now in the API
- The stubs are gone, we are now using annotations
- ``namedexpr_test`` nodes are now a proper class called
  ``NamedExpr``
- A lot of smaller refactorings

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200810144318.17106-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-parso_0.7.1.bb =&gt; python3-parso_0.8.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-parso_0.7.1.bb =&gt; python3-parso_0.8.0.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-parso_0.7.1.bb b/meta-python/recipes-devtools/python/python3-parso_0.8.0.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-parso_0.7.1.bb
rename to meta-python/recipes-devtools/python/python3-parso_0.8.0.bb
index 6d775227c..507087909 100644
--- a/meta-python/recipes-devtools/python/python3-parso_0.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-parso_0.8.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=cbaa2675b2424d771451332a7a69503f">&quot;file://LICENSE.txt;md5=cbaa2675b2424d771451332a7a69503f&quot;</a>
 
 PYPI_PACKAGE = &quot;parso&quot;
 
-SRC_URI[md5sum] = &quot;eac40cda515ee71e3bb008c404ca3ac1&quot;
-SRC_URI[sha256sum] = &quot;caba44724b994a8a5e086460bb212abc5a8bc46951bf4a9a1210745953622eb9&quot;
+SRC_URI[md5sum] = &quot;ee3592994bfc0d0843790544c1b2b702&quot;
+SRC_URI[sha256sum] = &quot;2b6db14759c528d857eeb9eac559c2166b2554548af39f5198bdfb976f72aa64&quot;
 
 inherit setuptools3 pypi
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------3DF173C0CAA7607A6CA89D01--

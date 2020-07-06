Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.65])
 by mx.groups.io with SMTP id smtpd.web11.60903.1594050555005403360
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2020 08:49:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=P2RKUZ4b;
 spf=pass (domain: windriver.com, ip: 40.107.244.65, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U9ie+LyzVlVEq0tSg6RyAlY3eY3YdiovzEUS+4nw/Oq6LVWSm828gtWG4aPVj5GC9zOCOtUGtWkxvjLbFBxrh+aiLkEWMGoplns/5PeMuPmootVMtSOLZrLe4O1sTnC00wcypgYpHsQMx7+Ig8k1QlQbLJZ0z27IvJ96q0NRLf5dDlHrPuWgDlzMdH7wDKNtNKiYGdtU0DqALvMaqogwpNPDsHBNNH0Dur6XkypOYhsp1SP7jU5rY0AMf+WYsXsZ8HGpZ4whAfgVQj9miQgGFCKDlSqNReOqP2l+k/3BzXm/qIfo1ChYu61I1jwfcK/Rep7xF9yIamWrmiJa53+gNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8LIz/U2NgxgQctjgxR+MgDaW9cQTbYkmt061vJHDvPs=;
 b=T2ZT5IkCEwym2k0b3WHHuistsb0rM8qU9fj+SAev4B4IgXfzyl0mhNkSfKF+wO5ifWfXWXtyVShcaI+cqpl4hg7GtKBw255ddLNHqEHDR3eoORnSAm1z97jZTvvhFFUggNlXVWFiBQVxuNG5fOONEkdrMnsoayIZrdr6Z08IxZQ57RRaTSRnpvNzR0S8M+LdoDXoe3dUVg/3dw0GC386T1zzG7UP3QSImk33PSRqE/T1e8vbcz7w04m+qn8pIFQqkSKrmB26/qSxyn5YOiC5REiE6k7d1iyE6untg9ggpCL21r1FVTh6sZk5P4zJZkALevLU6UCbbMndpG4G0W1cWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8LIz/U2NgxgQctjgxR+MgDaW9cQTbYkmt061vJHDvPs=;
 b=P2RKUZ4bQtEg2MSxXZynpAXIWdOulRFIt2XtHFIqaNxgLEshaz7s46COkDzFsXM4em8gEKmZ9oIwWzT18lLBafQCa1JI6UMVOFVIKKWLEjXoN2E6MDgelddzh0nwRXqGQsSKTz9d4u0cpc+Uyj7V8qTfPNXfUFAw6UYYTLk/7WI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM5PR11MB1899.namprd11.prod.outlook.com (2603:10b6:3:10b::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.27; Mon, 6 Jul 2020 15:49:14 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3153.029; Mon, 6 Jul 2020
 15:49:14 +0000
Subject: Re: [oe] [meta-python][PATCH 06/10] python3-robotframework: Upgrade 3.0.4 -> 3.2.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200703093020.3514-1-leon.anavi@konsulko.com>
 <20200703093020.3514-6-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <069ccf6a-6333-651f-a9d3-be2c7814ca4f@windriver.com>
Date: Mon, 6 Jul 2020 11:49:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200703093020.3514-6-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0005.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::18)
 To DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0005.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20 via Frontend Transport; Mon, 6 Jul 2020 15:49:13 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a4b3843-571e-4ed4-0e07-08d821c421fe
X-MS-TrafficTypeDiagnostic: DM5PR11MB1899:
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB1899E06AC75CA460A09A0A2C9F690@DM5PR11MB1899.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-Forefront-PRVS: 04569283F9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kmYRjavuLuPdf+QwMTpIRQCOtWPU8gm1EQpXMaqsk4gNpkp4Y33s3bWUdJpT/HPlA1ej3baEDUaiYJoCQK9qbSItvx6lgOJOhuWCOoN101Np6dNS3X9Y01HeOVI9vBUymT6HQElgMd4vY5Xx4xCAlPizPz/flKJxvg0tZ7YUgxFx+UPLt74gzoC4XSzdrqRcwbeX3WZwc3K8IPLt9TcKp/OayQgBo0XHSq9zI+8e7T6SRexLLkKi4VZg5Wwvb1Uj/dRMhHEg4QHMhuZjwujzclgOyZDMrPm/OKbSOwn6aRJRbvebFkck6GKizgMufGEOl9JPfA70onwclhPdYX9n06TAMprZRcvsiEMuOELYXSSHb6IP8+NTTSup2GTWdupE78sYcTg6A8iPmdIPzElj5xRlRjln21SWBnz2HB9xDXMFH6H3DFgQLAzDplYb3BclDw2k3Q2sj2zJBMFtZZwVrA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(346002)(376002)(366004)(39850400004)(136003)(16576012)(5660300002)(31686004)(478600001)(86362001)(83380400001)(31696002)(6486002)(966005)(36756003)(316002)(956004)(2616005)(186003)(16526019)(33964004)(44832011)(166002)(52116002)(8936002)(8676002)(66946007)(66476007)(66556008)(2906002)(53546011)(26005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	ZvGNSuc2brmyXHxWX1uV+HCcfuxhP6DKYhHphdOS1f5XC6qGa6eiu6E6HZsDoAMfs1wNgA8HGumoQillV7tRQfGasYyuu5yuBQsanq+ElluV9ZuUawF4t0atIn9xub0NsQ+fBeU1+9bN2Z2c3VQGe/G7x0+PKOKgAdGINCnobbwAGFKywo0cYRTispCE24J5ZNu+f9vc8vsk+skOVzQCJkJhPNoth/2MnIBnJO96cUucnkausoLWGteVIyAQPrziwLkfzvvjekQy5iQKxzCf9pVOCAPIdGzrLmv8EVVrXqCPdkPIT+VslZIJKKRHucj2EMuPL+7q1lHVZFb9A5aQH7CqaaUJwoSFzn/jq9gUcfKc16iyvnQh1g5BUhdI+VdT1s6jKlSDL6RA3vFBsSlUQmuv3VANzztzSea/UgHAnDPSa3PUlKf9rwWDYXGPCENQfr8VVoo/7eIxLSxlrRLRpWNUYHq2C83+q/7f7g3Ml2UaIUmskA5MXIYptWeelP23
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a4b3843-571e-4ed4-0e07-08d821c421fe
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2020 15:49:14.1339
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KimSW3XOudU6tqQAoCqqptvV8zHGN+1HiRS8UvVV5UtQTJuu7Lc0WeSgiWhpmdLyhM85t610xHa0GsTfnPnXXhA+6EVjp0UhHy8iwRTxuD8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1899
Content-Type: multipart/alternative;
 boundary="------------40423B9DB260C59A381E0DFC"
Content-Language: en-US

--------------40423B9DB260C59A381E0DFC
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/3/20 5:30 AM, Leon Anavi wrote:
> Suppy zip as the correct extention for download in variable
> PYPI_PACKAGE_EXT. Upgrade to release 3.2.1, for details have a
> look at the release notes:
> https://github.com/robotframework/robotframework/blob/master/doc/releasenotes/rf-3.2.1.rst
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...botframework_3.0.4.bb => python3-robotframework_3.2.1.bb} | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-robotframework_3.0.4.bb => python3-robotframework_3.2.1.bb} (84%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-robotframework_3.0.4.bb b/meta-python/recipes-devtools/python/python3-robotframework_3.2.1.bb
> similarity index 84%
> rename from meta-python/recipes-devtools/python/python3-robotframework_3.0.4.bb
> rename to meta-python/recipes-devtools/python/python3-robotframework_3.2.1.bb
> index 0628f92d98..a5e3a2a4f2 100644
> --- a/meta-python/recipes-devtools/python/python3-robotframework_3.0.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-robotframework_3.2.1.bb
> @@ -11,8 +11,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
>   
>   inherit pypi setuptools3
>   
> -SRC_URI[md5sum] = "ee753415645ff4831ff0d366a0467fe7"
> -SRC_URI[sha256sum] = "ab94257cbd848dfca7148e092d233a12853cc7e840ce8231af9cbb5e7f51aa47"
> +PYPI_PACKAGE_EXT = "zip"
> +SRC_URI[md5sum] = "ac8aaad885e48c6b6cd5461be5b8149f"
> +SRC_URI[sha256sum] = "d693e6d06b17f48669e2a8c4cb6c1f0d56e5f1a74835d18b8ea2118da7bf2d79"
>   
>   RDEPENDS_${PN} += " \
>       ${PYTHON_PN}-shell \
>
> 

--------------40423B9DB260C59A381E0DFC
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/3/20 5:30 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200703093020.3514-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Suppy zip as the correct extention for download in variable
PYPI_PACKAGE_EXT. Upgrade to release 3.2.1, for details have a
look at the release notes:
<a class="moz-txt-link-freetext" href="https://github.com/robotframework/robotframework/blob/master/doc/releasenotes/rf-3.2.1.rst">https://github.com/robotframework/robotframework/blob/master/doc/releasenotes/rf-3.2.1.rst</a>

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200703093020.3514-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...botframework_3.0.4.bb =&gt; python3-robotframework_3.2.1.bb} | 5 &#43;&#43;&#43;--
 1 file changed, 3 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-robotframework_3.0.4.bb =&gt; python3-robotframework_3.2.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-robotframework_3.0.4.bb b/meta-python/recipes-devtools/python/python3-robotframework_3.2.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-robotframework_3.0.4.bb
rename to meta-python/recipes-devtools/python/python3-robotframework_3.2.1.bb
index 0628f92d98..a5e3a2a4f2 100644
--- a/meta-python/recipes-devtools/python/python3-robotframework_3.0.4.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-robotframework_3.2.1.bb
@@ -11,8 &#43;11,9 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57">&quot;file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57&quot;</a>
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = &quot;ee753415645ff4831ff0d366a0467fe7&quot;
-SRC_URI[sha256sum] = &quot;ab94257cbd848dfca7148e092d233a12853cc7e840ce8231af9cbb5e7f51aa47&quot;
&#43;PYPI_PACKAGE_EXT = &quot;zip&quot;
&#43;SRC_URI[md5sum] = &quot;ac8aaad885e48c6b6cd5461be5b8149f&quot;
&#43;SRC_URI[sha256sum] = &quot;d693e6d06b17f48669e2a8c4cb6c1f0d56e5f1a74835d18b8ea2118da7bf2d79&quot;
 
 RDEPENDS_${PN} &#43;= &quot; \
     ${PYTHON_PN}-shell \
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------40423B9DB260C59A381E0DFC--

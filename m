Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.79])
 by mx.groups.io with SMTP id smtpd.web12.20372.1590175373672959299
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 May 2020 12:22:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ASgys+v4;
 spf=pass (domain: windriver.com, ip: 40.107.237.79, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X9dpJdnftDQiUDgI6BamU/W8i/wFZB63h7uqBirxUfb2kksSHywUg+fVtu02cDEmgJypPrgi8WJ/A5XSBX2mkvJYED9y+H0Qg/eFu7a/VVC0N37PWBriWcRVKN3NUfPtYRSw3Jq5v23c9Czg9pmx6q3YmgYG0OoD4kfJH3UlZNTz6/NrMyXwDAHh2b6oB9J8Xxg6BhAhXvIkP7yYYouIYrCE3Swr9fvrTbYA2cdTYcLUmBBQiQlZrqXOTaMTlwikF/pWd4L9a5uwzWsUjSdngVDNT/9AyTcRSBpKzkPRY+MK0msJkMpWTvXdFulQkWYNEwXwvRmRvH3+Ex6rW6zdXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KsiGNnpmjFEU6jl99Mx/YAJQUTt0SU8khNV2mqQji4g=;
 b=OjFB16c3KZnFSUB5PCQUhIbs6ZaB91fIaZE7aiEJUYyLxzHAbTTp/mMVqFgdt6HkPDoW16IlvZkl+xaC2QpT+VkPTz88qZugXJ47xPBSGJn0kGf2coMefhgsF8KtVPeqbaNXjgmEE2gz5r+3Hpyvju+QoSJounhhUG5b1m92Wu9W1bqYqjliH3HsvBs2c0Xxi4HHMMXZHePZaiuDd9oam8nt8n3X52Z5KbL7FQLCYgwndCi0DHqEXNrsPy7zZPWgtyKf+yWdUMnvGqefcN1bZd4Z5gdDIvht02cF/EiqH3Gng7EKFHbE6HaSb4mkhgATReNTJS5BCBdtjELbmg3jog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KsiGNnpmjFEU6jl99Mx/YAJQUTt0SU8khNV2mqQji4g=;
 b=ASgys+v4hJguHy9/IiBtyPMC1iCIfRPz6euOGh+YOUXVs/9CEKNHkzV/nkcR+l7XMZcbtSvHuO2MnSliCqZFp/Ell6wzb1G9iGoGTWvKQomlkQj/sluKMJDC6i4VndfCU3EaKHooCys9D7LIO+YxqiQKKB+oofqJibBIE8O2g20=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB4004.namprd11.prod.outlook.com (2603:10b6:405:7c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Fri, 22 May
 2020 19:22:52 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3000.034; Fri, 22 May 2020
 19:22:52 +0000
Subject: Re: [oe] [meta-python][PATCH 2/3] python3-webcolors: Upgrade 1.8.1 -> 1.11.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200522134007.10925-1-leon.anavi@konsulko.com>
 <20200522134007.10925-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <1d999500-c646-74cb-3cda-d74fcb3bbe6e@windriver.com>
Date: Fri, 22 May 2020 15:22:50 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200522134007.10925-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0017.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::30) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTXPR0101CA0017.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.24 via Frontend Transport; Fri, 22 May 2020 19:22:52 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 730e104f-f91d-42e9-e8f0-08d7fe8585b1
X-MS-TrafficTypeDiagnostic: BN6PR11MB4004:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB400452DA6F25803779ADA6FE9FB40@BN6PR11MB4004.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:262;
X-Forefront-PRVS: 04111BAC64
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XsjiBu+Vw04uDOm91nqPFkJfIvf02DWBbDZ1sgnjILx3VGIxhBATZ05tWOz057awz+QUQvevn1240vBz6zA5P3LMODGcC7qRNOKm10dDOxhXl4s8j7LqWqk19rPV39Iguz6fVaRATzuQF3nBQWXVVXzL/Ejtra8x8kGMo5YUkkBl74KmONFEMBUJ8x2yXRN3DD+4r9AuQbEd7z5Sc3zabVriPD7IyyOzzpoYil56VSfK334pEVVqXfIDkQPYrtfhKl0IJ5wgNTSKBPnBRt/NzUodHDLK14MVDMQDdsOX5BWKYn+WOgRGS3uDzA0z97darHaVOXHbWuOksm8rzAZgivLawM/DgcadMGwKZ7sr4nrHbAs41YGaclxjWDLI2fZsusm98KcXIQnpeBmvv5LvTR8FkWzWiZycW69VdEPpmMHD68e7mRdJIS2G1tW4k9aLdvgv/O7eKiwoBHUmgoHscQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(396003)(136003)(39850400004)(346002)(366004)(33964004)(31696002)(166002)(16526019)(53546011)(186003)(956004)(966005)(2616005)(31686004)(52116002)(5660300002)(44832011)(2906002)(26005)(36756003)(66556008)(86362001)(316002)(8676002)(66946007)(6486002)(16576012)(66476007)(478600001)(8936002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	cSra4Y46sRdZW7LNt8wMEpwjkUvQeZ8lsT9AbUV79J7AKNvxmBRX6ZoSR4WXnODM5a2TZkHoMlxHOjDxfpsrLnj0JIFLkAzQzw/Ry5dJ0h4EUJJnW9CqD9hI2T0s4a1He5RKtn9hFacUfHpmawwexGqUGZ8QXQIhRfJ6IH4LxzeFVUGvhQ2t9iO17tJZx3915Fu7H0rlHP8i1ycQmhDc+fkBUmqCufgyP1pmielZvYy2g1TXZoIiVA1lC5ZyAqNEYrS1S/s5OyU8HqthvNSXk2VLdJBFkAiaWsZxfXRZYSR/Hb+JEEMG7Uz5TW0d/0RRB2cGYRukMDfMxzFroGAhERpMbnf/XcyBC77JrneQ6uLR8DBQ4zl3fChyLPLgDQ8v/6xXuuxxujtcV3IgwefzmdM14LzAkweuuwaNxyiI2R6svEELoT+MiNZaamu9j5jxlf0OycupC7b5HWZMuH5I9xDrRImygMk3cUZbodRozPIkSMFmCFv/4zwZM/G2Hkt/
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 730e104f-f91d-42e9-e8f0-08d7fe8585b1
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2020 19:22:52.4108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jn+ELd1AKOefU+EUJw+F1n+FoKpGYRPQPmWfZ25i6jQD623bYNQEHdFTJ2LAzOk7pejvFVrNh8bax1hnPTCXjS6guOclIya7IPG3c8lwly4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4004
Content-Type: multipart/alternative;
 boundary="------------CBC785591013B79792B7B6D5"
Content-Language: en-US

--------------CBC785591013B79792B7B6D5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/22/20 9:40 AM, Leon Anavi wrote:
> Upgrade to release 1.11.1.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...thon3-webcolors_1.8.1.bb => python3-webcolors_1.11.1.bb} | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-webcolors_1.8.1.bb => python3-webcolors_1.11.1.bb} (67%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-webcolors_1.8.1.bb b/meta-python/recipes-devtools/python/python3-webcolors_1.11.1.bb
> similarity index 67%
> rename from meta-python/recipes-devtools/python/python3-webcolors_1.8.1.bb
> rename to meta-python/recipes-devtools/python/python3-webcolors_1.11.1.bb
> index 65eed9e78..e567e0ba2 100644
> --- a/meta-python/recipes-devtools/python/python3-webcolors_1.8.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-webcolors_1.11.1.bb
> @@ -1,9 +1,9 @@
>   SUMMARY = "Simple Python module for working with HTML/CSS color definitions."
>   LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=197add016087e6884a012b0f185d44ad"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=25b90379a52351261c51272e7923d240"
>   
> -SRC_URI[md5sum] = "40890db38b2a856e526a568864025fe6"
> -SRC_URI[sha256sum] = "030562f624467a9901f0b455fef05486a88cfb5daa1e356bd4aacea043850b59"
> +SRC_URI[md5sum] = "54d28a7c80b3e4d974ec2fee86768be9"
> +SRC_URI[sha256sum] = "76f360636957d1c976db7466bc71dcb713bb95ac8911944dffc55c01cb516de6"
>   
>   inherit pypi setuptools3 ptest
>   
>
> 

--------------CBC785591013B79792B7B6D5
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/22/20 9:40 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200522134007.10925-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.11.1.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200522134007.10925-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...thon3-webcolors_1.8.1.bb =&gt; python3-webcolors_1.11.1.bb} | 6 &#43;&#43;&#43;---
 1 file changed, 3 insertions(&#43;), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-webcolors_1.8.1.bb =&gt; python3-webcolors_1.11.1.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-webcolors_1.8.1.bb b/meta-python/recipes-devtools/python/python3-webcolors_1.11.1.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-webcolors_1.8.1.bb
rename to meta-python/recipes-devtools/python/python3-webcolors_1.11.1.bb
index 65eed9e78..e567e0ba2 100644
--- a/meta-python/recipes-devtools/python/python3-webcolors_1.8.1.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-webcolors_1.11.1.bb
@@ -1,9 &#43;1,9 @@
 SUMMARY = &quot;Simple Python module for working with HTML/CSS color definitions.&quot;
 LICENSE = &quot;BSD-3-Clause&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=197add016087e6884a012b0f185d44ad">&quot;file://LICENSE;md5=197add016087e6884a012b0f185d44ad&quot;</a>
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=25b90379a52351261c51272e7923d240">&quot;file://LICENSE;md5=25b90379a52351261c51272e7923d240&quot;</a>
 
-SRC_URI[md5sum] = &quot;40890db38b2a856e526a568864025fe6&quot;
-SRC_URI[sha256sum] = &quot;030562f624467a9901f0b455fef05486a88cfb5daa1e356bd4aacea043850b59&quot;
&#43;SRC_URI[md5sum] = &quot;54d28a7c80b3e4d974ec2fee86768be9&quot;
&#43;SRC_URI[sha256sum] = &quot;76f360636957d1c976db7466bc71dcb713bb95ac8911944dffc55c01cb516de6&quot;
 
 inherit pypi setuptools3 ptest
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------CBC785591013B79792B7B6D5--

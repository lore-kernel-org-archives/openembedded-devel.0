Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.42])
 by mx.groups.io with SMTP id smtpd.web12.10858.1601818667633504252
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Oct 2020 06:37:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ZfviUWtl;
 spf=pass (domain: windriver.com, ip: 40.107.93.42, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i+CVHKGEVGVS9ibYhosXK9RJrqPfCApQEvrrash7EhxE+f6N2KzRV3x5NmmlcaU6pGO0qYHcbBLJaQZCy9LkGDhFuQvilzkfCoCq0suPBHTJ81yFQ9KerARcHMHfnZ+arH1/O/73tjeLds1rmUHdKcSjsuOCWnMDRV4q0+UNqnMsmYH1u3Hvx5jl6dXCxAoMaxEmq5Ifb0/B+ZszNbJmmVBDpcEcMVfWl/7EHegadTkpixnaen5tZ6gO+ncRfEes9UdpsPiAY6RZAEFJs6bGAtPwXQ3FbVoi6sYJOfaLPIHqE62187+cKOq/+4xtZfzZStgfxzmr2JoF6VcD9A67tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VbnCrd5ssELUttl1QR434fk1p2I4K776+Tq+yhQpEew=;
 b=TwvqA+lfNqnsF+me4kO8yC021yOvvETepr1X1i06CaC8LG43gKTDWyXzoY25EY6IDfmEp2B2B+0K5htVDtOu+bVmvvAtdFCFDF9bDp6NHQp+JBzieG4Pyhmzax2mPUhqRh3RsfuIAnlCYRRXwGnuGSoIUw7+/K+xUW3z2r8gmKf4Z25R5LiOT2GzTU9C96oiCyBQlyYprqkJ+AGUv2YH53bt7kkxXjdlXSli9726Lbf6NT5lrjuoEb8kvTxY/QTXjZTkze+gmcxq5X4sx4D3R/g+oR0ViqL5axvafNZDe80zmhns04M7qecE7PFUZCyPH3elIxSPPSwd3DI//rnqxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VbnCrd5ssELUttl1QR434fk1p2I4K776+Tq+yhQpEew=;
 b=ZfviUWtlIR6pwuutigAY8yArR1+yJklCg40sHzPbst//XdiCNKjc6mBeRdbqfhQpuNb6OmBELaIBeT4P5hWgY+tYOhQ4xXtEQU+pgdic9FzL6I+fjELUqebRJQzS78kQNLEjIm+9HTKdZ7w9EV+w90+17o0SJ2Bv+X7dM9Wtd9U=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2951.namprd11.prod.outlook.com (2603:10b6:a03:90::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Sun, 4 Oct
 2020 13:37:46 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3433.042; Sun, 4 Oct 2020
 13:37:46 +0000
Subject: Re: [oe] [meta-python][PATCH 4/5] python3-pystemd: Upgrade 0.7.0 -> 0.8.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201001082006.21365-1-leon.anavi@konsulko.com>
 <20201001082006.21365-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <cd40e1bd-a558-ce07-504a-02226696abe8@windriver.com>
Date: Sun, 4 Oct 2020 09:37:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <20201001082006.21365-4-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YTOPR0101CA0062.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::39) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTOPR0101CA0062.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::39) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34 via Frontend Transport; Sun, 4 Oct 2020 13:37:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c36a6967-d744-476f-2cc9-08d8686aad94
X-MS-TrafficTypeDiagnostic: BYAPR11MB2951:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB29518FA0C9926CF5C9BFCEE49F0F0@BYAPR11MB2951.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	I7XMqrXKVhhO7gtBg73FKZ3i3jWkD6kCK3ZY88J9hpi9owBy1dgcKgaIclijJkkqpUUKK6Ij0J1BVBJlcLj4Ija29tP251Rh0ZxfYtn1QtPin/WbszwP5p1IfIai54XsyBm1R8qMr1CZhb7MUVJhibEaF1ddrCWwWBz1uXOOGUkAtHFbSL9KIMUtNPhMKwQ+hzwQiY8S0NGg+GoTqa+1EUCbceZaFNjvaTr5DG1FhAWEgiaHb7Lo5BuRxrbx7oval+MqZXZkLoEKwiiKSQUfB+eOFBTix0adv5SZyE6N/JcT0tIcGsO6py+j5dtwDchwMgxgbDlpluZ7qAxDMr8IZH3D3lAOP3f75PTNR9KZBm+cql4+xVOLNtnnZtY+AJiA8hqZorf5pWu7Dth2k99gnFBMudTLl0voFGll2Dm0BKrD8mTexUuX/PWzSvagAoyLNU9/DLjUZCN9yfjI6GE0ng==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(39840400004)(396003)(136003)(6486002)(186003)(16526019)(86362001)(478600001)(44832011)(52116002)(33964004)(31696002)(5660300002)(66476007)(66946007)(66556008)(36756003)(8936002)(8676002)(53546011)(26005)(83380400001)(966005)(83080400001)(16576012)(316002)(2906002)(166002)(956004)(31686004)(2616005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	UdBs88ojZsr8MQKJnxjZnAS0kO7qSddLhGCiOjIPUNFb1kse5Ei2H3l4fk00aKjX6nn9laAAQCu83P/fpM8Tum6Pd9I2Yo+HgIshoJS0bhRxIyHVdLabz0bfCoXYd29DYMt2qjVRWGiOtLpz5RJ0spBSmvzJdNR+kx5OM3qdijp5hlpLmzW6zyl99SUJaxMX9c52jn0ry3OhExdMcW1+T1U0hfpElaHxQP6S0BChjndZ56u4i0Gdi64zoTqf1NSMpOdEzlw20hONUsrWojXEW4NmMMnNDsqncf34BIK6uNsgE+85SRS+NO7NjCndmnMYw3IleAm62DderrjiFcdaLb4VrBJ/Tng5PSTym2f9Mp4XLogiSKm2VelEie20k5L561z/9zlqXUEdAb7xM7/QC+skYw5Pm1qVZ3wKMzkcdXa7kvrHQJvZYX5beMY/Rgt6foF+mczyOGXRXKOsoXLNLvQhPqr7As3qkT+B7znEr/yBGVzMLOxAPuUjbQxUBQlHEjjkEpuRo8X0MwcL+tp/SQJExbsP4EVUrpXVAgjOV05kvuOqPcx50hxggfyymm+zc0Yv3uRIOMKMiZrDDasH5UIEYYx2sUDU7zfIDhNL0idoNguLy6NSbnDQ3rAq3UElopRAEENcA4eZzl4Ea1aXgg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c36a6967-d744-476f-2cc9-08d8686aad94
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2020 13:37:46.3175
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Shh4lubuKlT7+JUM+qE8NaW/odpZAXtD/jjcaOfvoNfdZM8+9M5aBCySU3Xoa7CxkYImkvnosl0rqmS4lZBd4gkga04HgdlWskN8gN25HQc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2951
Content-Type: multipart/alternative;
 boundary="------------864B6FA68B175309E955C3E0"
Content-Language: en-US

--------------864B6FA68B175309E955C3E0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/1/20 4:20 AM, Leon Anavi wrote:
> Upgrade to release 0.8.0:
>
> - add initial support for python 3.7 and 3.8
> - added options StandardOutputFile, StandardOutputFileToAppend,
>    StandardErrorFile and StandardErrorFileToAppend to known unit
>    signatures.
> - Added type stubs for pystemd.daemon, pystemd.dbuslib,
>    pystemd.systemd1.Unit and pystemd.systemd1.Manager because we
>    still "support python 3.4.
> - fix issue when char is unsigned, and <char *> -1 returns 255.
> - added slice_ option to pystemd.run to specify the cgroup where
>    the unit is created.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-pystemd_0.7.0.bb => python3-pystemd_0.8.0.bb}    | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pystemd_0.7.0.bb => python3-pystemd_0.8.0.bb} (67%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pystemd_0.7.0.bb b/meta-python/recipes-devtools/python/python3-pystemd_0.8.0.bb
> similarity index 67%
> rename from meta-python/recipes-devtools/python/python3-pystemd_0.7.0.bb
> rename to meta-python/recipes-devtools/python/python3-pystemd_0.8.0.bb
> index 66f026cae2..e09b633f90 100644
> --- a/meta-python/recipes-devtools/python/python3-pystemd_0.7.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pystemd_0.8.0.bb
> @@ -2,8 +2,8 @@ SUMMARY = "Python bindings for interacting with systemd over DBus"
>   LICENSE = "LGPLv2.1"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=4fbd65380cdd255951079008b364516c"
>   
> -SRC_URI[md5sum] = "f493c3e54457e49fe3c160274b863bac"
> -SRC_URI[sha256sum] = "f5dc49d02995ab96335d9e94f9fe036673d89b8cc9907e7a0ac83c06665f2430"
> +SRC_URI[md5sum] = "f993739eca645749f18d4ccfd4a0fbf3"
> +SRC_URI[sha256sum] = "cac2e42043ab28d43adf33dab493c6a3cf8a99794f824ae8af6d9cd6458b9972"
>   
>   DEPENDS = "systemd"
>   REQUIRED_DISTRO_FEATURES = "systemd"
>
> 
>

--------------864B6FA68B175309E955C3E0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/1/20 4:20 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201001082006.21365-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.8.0:

- add initial support for python 3.7 and 3.8
- added options StandardOutputFile, StandardOutputFileToAppend,
  StandardErrorFile and StandardErrorFileToAppend to known unit
  signatures.
- Added type stubs for pystemd.daemon, pystemd.dbuslib,
  pystemd.systemd1.Unit and pystemd.systemd1.Manager because we
  still &quot;support python 3.4.
- fix issue when char is unsigned, and &lt;char *&gt; -1 returns 255.
- added slice_ option to pystemd.run to specify the cgroup where
  the unit is created.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201001082006.21365-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-pystemd_0.7.0.bb =&gt; python3-pystemd_0.8.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pystemd_0.7.0.bb =&gt; python3-pystemd_0.8.0.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-pystemd_0.7.0.bb b/meta-python/recipes-devtools/python/python3-pystemd_0.8.0.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-pystemd_0.7.0.bb
rename to meta-python/recipes-devtools/python/python3-pystemd_0.8.0.bb
index 66f026cae2..e09b633f90 100644
--- a/meta-python/recipes-devtools/python/python3-pystemd_0.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pystemd_0.8.0.bb
@@ -2,8 +2,8 @@ SUMMARY = &quot;Python bindings for interacting with systemd over DBus&quot;
 LICENSE = &quot;LGPLv2.1&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=4fbd65380cdd255951079008b364516c">&quot;file://LICENSE;md5=4fbd65380cdd255951079008b364516c&quot;</a>
 
-SRC_URI[md5sum] = &quot;f493c3e54457e49fe3c160274b863bac&quot;
-SRC_URI[sha256sum] = &quot;f5dc49d02995ab96335d9e94f9fe036673d89b8cc9907e7a0ac83c06665f2430&quot;
+SRC_URI[md5sum] = &quot;f993739eca645749f18d4ccfd4a0fbf3&quot;
+SRC_URI[sha256sum] = &quot;cac2e42043ab28d43adf33dab493c6a3cf8a99794f824ae8af6d9cd6458b9972&quot;
 
 DEPENDS = &quot;systemd&quot;
 REQUIRED_DISTRO_FEATURES = &quot;systemd&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------864B6FA68B175309E955C3E0--

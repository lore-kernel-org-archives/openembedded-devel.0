Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.78])
 by mx.groups.io with SMTP id smtpd.web08.11863.1615394779059514916
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Mar 2021 08:46:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ibOHKxDd;
 spf=pass (domain: windriver.com, ip: 40.107.223.78, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dD+41yhNYWvwoZ/DHj7PZHbGPa3c4GGXL83PlHbhBu7OLcqSyMQ+PC41kUjMWXDIG18NU1Ibrb6BnmE99NDtfL6h3x6h2+2sHKJztQsIE6xtVPwaoBHyyB77vQadd8hhTugLidQiPoSZc9wxkIR12HnfutDBtdaESvG5CtDQhMPy1pC4MCgbCudulrfB8yrpxZI2+7+hycVvFRm+RsYSfCegn81nHn15QZQE+XwOxruZcX0/J6IpTECGQT2Q+X8jm06oKH5bPGOGskebsrJQbXts1IGZsv/PGB8oDV5iOkCPQ03HgFFDF5ffD+vyARTBXhr/UFc/Ub5JGYFK6K7xrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rgG+KPHK4uvRfkNiGrcUC1lWyOsijcXCAFfhZOs+fE8=;
 b=mfaPnRzGcKGpwPxWuU01kEeyEBE/6LcoMR08l0NOG/5qVCmZeoFiTqdAy98A3qNO5I8cUEmd6jZA8rhVQF5Iy77poJBzpCL+63L40N3Jkb46IiuA5Wdt2vKDpmzA5xkGrV2Vvdrx6nNyMzv/cqi+jI+b3FCAkGrn1++9qgzlQ8JOws9ZJwe+3uLqcKvFbPcY0iiNt2J2mb3xx6Idd20altqafODxO6Tuz+5I/kIq1vxPtLHs6rDgDiQ3yeeDVYkLWNA37tyUy8+jqroKDOOgI9yFzEcbNjlqaLBT16kJNPBIp6X7iU0xyZT9UgEX8OL/HVMoCh+4fGi6BCHCAwMmaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rgG+KPHK4uvRfkNiGrcUC1lWyOsijcXCAFfhZOs+fE8=;
 b=ibOHKxDdYAg8TRHafNb6M6bP+xUY7x8oIThcliV1ZsUxJdXvomSiVAtH917WCIiEDiSJbimcBxIO4BV3Pi0DqCMgY0QPhzFWdbXu37k4EEav5aG4wN8+VGKJH6LemzR47GOTPpQu1WWbQ9QFC0okilYRSafjSDzBolAn5LLzbyo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB5008.namprd11.prod.outlook.com (2603:10b6:a03:2d5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.18; Wed, 10 Mar
 2021 16:46:17 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3912.029; Wed, 10 Mar 2021
 16:46:16 +0000
Subject: Re: [oe] [meta-python][PATCH 1/5] python3-ruamel-yaml: Upgrade 0.16.12 -> 0.16.13
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210308161810.21582-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <4dbfdfe9-3872-be65-502e-4678aca855b0@windriver.com>
Date: Wed, 10 Mar 2021 11:46:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210308161810.21582-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN6PR1701CA0004.namprd17.prod.outlook.com
 (2603:10b6:405:15::14) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN6PR1701CA0004.namprd17.prod.outlook.com (2603:10b6:405:15::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Wed, 10 Mar 2021 16:46:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50c6109f-def7-4616-4a4a-08d8e3e405dd
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5008:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB50088DF983C594CB010F61B49F919@SJ0PR11MB5008.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:901;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rWDp6rDo0/5r6Z/mO8lMAtxnguSJJ+EAbx4m0y+tS6kP7l4nVDj4u2bTzEtZqIJUMimVqvyenn2KitxitZ1psmakMuXcIL5miCXy+LursFiNssweIkb3gNBMagegaFQURdtPE20gq3y1E1HzP8hPykhxZLIu1Lpp6wDqK74ej51OJtCCnPAw+iGsUWDRJtZzt6o5k5SgBZ6zFZT7KHRkJ4jOZlnBz+rh/bEETw6qVFacoMbY9Iz81gUT4gJj4t3Fbshsb3rrDkQprnwmLm5lTMatOJq+DRRbbK8zYjSruT7BJN2j732LmQ5WLh+bP/ScmoFCouzeK4gWVH818BU7lcND4ALxHUlBta0incY1ZySnLYJLANYkvIfNKtDAJcZ71LVb63rriWpvFN7w2qaMgWnmF2dqAp6glVEyB0OUE2ZUhEpeN7bdi5KYXS35Q8w1cvxXqJodJjQUoMebpxZ7Igzo3Df9Bw1ZZU2S1utuC3qUlbocE6GCrE0gQVCxZkE6zeHHR1b6Z94FbyMsD2ikg2fDm4IsGcTHfWyS5FppX1fUnMVK7Bwdi8lCEHlbzgE8UpOzzIRCcltWLz407WEyMwrV5LIZWxhJ16di/T+yeSLJZ7VKHFLdv2jzu1t757auSqNi1oY0LrIEnRQkb6W1BOipAf69Dc4ki5tX1zdNR+UfbxqnBfxez8sDxJ1jLN39
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39850400004)(376002)(366004)(136003)(16576012)(53546011)(2616005)(33964004)(5660300002)(966005)(316002)(83380400001)(8676002)(44832011)(8936002)(16526019)(31696002)(186003)(36756003)(26005)(478600001)(2906002)(166002)(956004)(31686004)(6486002)(86362001)(66556008)(66476007)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?bnlFb2NRemVYektRT3VSazVWenFZVC9DWTF6a3Nud0ZhaitHcFEwZkxPMzZn?=
 =?utf-8?B?L0tKd1dTOUoxeUN4L2ZhejdSeVNWMExUT1FLdU5HVmw0d0RJN00zMTFxanJG?=
 =?utf-8?B?NzIySDE4UTRvc0RuTDd6MlRCSlBnQzFiRXNWdFAySmJOME83N3FNR3UxY3Vi?=
 =?utf-8?B?a3NmZWJNQnZxRlVGQ2dKUVpKUEI1ZHNxOUFCY3hPT0VKYWl3bEsvTWJ1L1p4?=
 =?utf-8?B?bzhtd1pxYjhlM1NJN2xVeUJLaHRCbjlBOC9taXNBZ2x0QVZnNU9uS1hONWFE?=
 =?utf-8?B?SVVKRVFYYUNkU29WY0tjR3BTdk16NUpvWTdtcGhOa0FUaFdhZHZYdGc5ak01?=
 =?utf-8?B?K3dROWtrdmxZYjN0Tnk1YUNzUjQzc042aG9Ud1c3R0Fvb3AxSVVXcXFIUnB3?=
 =?utf-8?B?Q0YwVDh6R1ZRUUtpUWhJbEVGQnZkY0JrWnJ3U085K3V4OCt0eTBGeGg1eS9Y?=
 =?utf-8?B?dktzb1A3UG1uRi9McE1QOS8zYWxGeTloVWhMQ3JsWTgvNzZqcy9IRG5DdXlh?=
 =?utf-8?B?clFOZVJ4L05pYzJhWnZlV0R6WHhYLzRZU09NT3RYeWpCQks4eGNhb1NNcWwx?=
 =?utf-8?B?QU5helBpQkpvcWQ0TGo0b0huQ2FldDAxdUVSakR2c2xoZ0IwRVVBQlh5S3pp?=
 =?utf-8?B?VnJMb04wd09NTTNIQVJlSlRCSUlUbkZPL01GV05rMW5EL2xjZWhlVFZsOXR6?=
 =?utf-8?B?RkcrR21TWi9mdkRWY0ZqaGpXa043T1hwTk9OTUJHMDRSMHN4MzFVV09vb0RJ?=
 =?utf-8?B?a0NkQWFXcG5HVzJzT2piS05jdTJtNDVNUlFBWkRBT2pnbnphM1doWVpTSWUv?=
 =?utf-8?B?VmNnR3Izc2pOaEhHcjJDUTRCRG9JWEpqejhlbE50RmZBV1pZWThkdGFiOTZq?=
 =?utf-8?B?VmpiMXJYWDdCQmpYajBLb3RycWtDM2pYaUxYUVFGV2VoQ0VlYU1sQkhkeG83?=
 =?utf-8?B?cGRnZCtGbWRDc3BMNjExbkdmR2UraysreHlFL1hPeGFlYzZtL24xYi9WZW05?=
 =?utf-8?B?WndnY1ZmVUF0VlY2ZVl1NXl6bHViL2UzbUpEeWtBYmFEYXpqa0xqL2VkaUFy?=
 =?utf-8?B?bUJKZFNIRldGeHVOaXdMaHh3eWxsWEN1cXZaQWp0RWxLS0JHMEJrK01uYnp3?=
 =?utf-8?B?SGYzRmo1YjYwTW5YKzYwRE1LQm05SGxtUjRPOTJlaTNPNEM4bEpiQWhUU0Y5?=
 =?utf-8?B?TmtXSlljaTRFSjdrZFpReFNWWjFESUwwWmh6TWxOdUpUd3ZXemsvTmlBWWNk?=
 =?utf-8?B?WURrUVJtNzhSL0ZQVUxjb2dxenpDVW92OUtsLy83bVFkMm5SS1A5YXRGOTM0?=
 =?utf-8?B?WUJveENUTWFjUlRubi9BSnhYTk9JbjdxT01KbHdOeGo5NGNYd21mcGMzeHFR?=
 =?utf-8?B?cWRKeElmYXNvSEZzZU9INlJCUUZPYVA5SW1hTGN6SVNkUGJUVjBDQm5wQ2or?=
 =?utf-8?B?aFB1SGhNTGd1MlIyL1dEelF1bnZqdFF4OHlYVFRabXhCa3U0RGplR3RKcjBl?=
 =?utf-8?B?Rk1iRjN5ZWFnTThNbXJmSElYVkV3dDVOTU9mWVN0WGVZRzVULys3SFZmd2NE?=
 =?utf-8?B?MnpkbWpvTjIxTXRFR3lCTnQ2T3prMkdzOHB3ZnJyVktUU3M0cVF6dDdwV1k2?=
 =?utf-8?B?RlVPZjNrY0g2K2EyOGIxekd2dklyMm9rUjE2V0R3OGRkUFUwM1pTVkxXWTNK?=
 =?utf-8?B?S1BRNDJ1U1ZJTXRwLysyUGdWVk8rVG56TC9sMjcxR3YxdnovNlRlZ2RNZ1d1?=
 =?utf-8?Q?xjbcsCNngQwjxlHQT3eeoiXBWOUDrdH/2l2UW2b?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50c6109f-def7-4616-4a4a-08d8e3e405dd
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2021 16:46:16.5850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: btLQ4lzT03eFyIErZ2xCefUERmURPzwwQOWkKxMpZfUSWa3C7HnF8IUeg9bcSGwV8XvMwMipT244gLhNeLS5MHiCwrQQw4PHsXdj54qZjaQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5008
Content-Type: multipart/alternative;
 boundary="------------1B21D3E7F47407267F15FC54"
Content-Language: en-US

--------------1B21D3E7F47407267F15FC54
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-03-08 11:18 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 0.16.13:
>
> - fix: could not update() CommentedMap with keyword arguments
> - fix: unable to dump mutated TimeStamp objects
> - fix: unable to addd comment without starting space
> - fix: recursive call to walk_tree not preserving all params
> - a None value in a flow-style sequence is now dumped as `null`
>    instead of `!!null ''`
>
> License-Update: Update year
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...ruamel-yaml_0.16.12.bb => python3-ruamel-yaml_0.16.13.bb} | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-ruamel-yaml_0.16.12.bb => python3-ruamel-yaml_0.16.13.bb} (63%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.12.bb b/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.13.bb
> similarity index 63%
> rename from meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.12.bb
> rename to meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.13.bb
> index 7593ce7f5..39795b784 100644
> --- a/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.12.bb
> +++ b/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.13.bb
> @@ -2,7 +2,7 @@ SUMMARY = "YAML parser/emitter that supports roundtrip preservation of comments,
>   AUTHOR = "Anthon van der Neut"
>
>   LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=60afc0a1bb0501c0c555cabe78bba022"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=fa0a51dfb461e2f803969e0f3fa71dfe"
>
>   PYPI_PACKAGE = "ruamel.yaml"
>
> @@ -10,8 +10,7 @@ inherit pypi setuptools3
>
>   BBCLASSEXTEND = "native nativesdk"
>
> -SRC_URI[md5sum] = "c7e4b216d9554d80be42011b448b7c61"
> -SRC_URI[sha256sum] = "076cc0bc34f1966d920a49f18b52b6ad559fbe656a0748e3535cf7b3f29ebf9e"
> +SRC_URI[sha256sum] = "bb48c514222702878759a05af96f4b7ecdba9b33cd4efcf25c86b882cef3a942"
>
>   do_install_prepend() {
>       export RUAMEL_NO_PIP_INSTALL_CHECK=1
> --
> 2.17.1
>
>
> 
>

--------------1B21D3E7F47407267F15FC54
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-03-08 11:18 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210308161810.21582-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 0.16.13:

- fix: could not update() CommentedMap with keyword arguments
- fix: unable to dump mutated TimeStamp objects
- fix: unable to addd comment without starting space
- fix: recursive call to walk_tree not preserving all params
- a None value in a flow-style sequence is now dumped as `null`
  instead of `!!null ''`

License-Update: Update year

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20210308161810.21582-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...ruamel-yaml_0.16.12.bb =&gt; python3-ruamel-yaml_0.16.13.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-ruamel-yaml_0.16.12.bb =&gt; python3-ruamel-yaml_0.16.13.bb} (63%)

diff --git a/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.12.bb b/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.13.bb
similarity index 63%
rename from meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.12.bb
rename to meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.13.bb
index 7593ce7f5..39795b784 100644
--- a/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.12.bb
+++ b/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.13.bb
@@ -2,7 +2,7 @@ SUMMARY = &quot;YAML parser/emitter that supports roundtrip preservation of comments,
 AUTHOR = &quot;Anthon van der Neut&quot;

 LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=60afc0a1bb0501c0c555cabe78bba022">&quot;file://LICENSE;md5=60afc0a1bb0501c0c555cabe78bba022&quot;</a>
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=fa0a51dfb461e2f803969e0f3fa71dfe">&quot;file://LICENSE;md5=fa0a51dfb461e2f803969e0f3fa71dfe&quot;</a>

 PYPI_PACKAGE = &quot;ruamel.yaml&quot;

@@ -10,8 +10,7 @@ inherit pypi setuptools3

 BBCLASSEXTEND = &quot;native nativesdk&quot;

-SRC_URI[md5sum] = &quot;c7e4b216d9554d80be42011b448b7c61&quot;
-SRC_URI[sha256sum] = &quot;076cc0bc34f1966d920a49f18b52b6ad559fbe656a0748e3535cf7b3f29ebf9e&quot;
+SRC_URI[sha256sum] = &quot;bb48c514222702878759a05af96f4b7ecdba9b33cd4efcf25c86b882cef3a942&quot;

 do_install_prepend() {
     export RUAMEL_NO_PIP_INSTALL_CHECK=1
--
2.17.1

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------1B21D3E7F47407267F15FC54--

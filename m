Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.73])
 by mx.groups.io with SMTP id smtpd.web10.5412.1607343933409243084
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Dec 2020 04:25:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=FwEB6TP/;
 spf=pass (domain: windriver.com, ip: 40.107.93.73, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZHX9NrI57CelguFkX14Kxu0o3GpR62h8iB2zRSR8Vw37Rww6JO4LmHfvnDxN8B6alsjdWwKCSUT8GGhLZ0GbduIsPhdNphTJX9AmJrPRpBm7e7fLrK/vSfoR9/rrUxAJtGDIV3VmqqdmqhGijEe24jxgC1wsoVih2QCcrXYLiU+fqQQbqO6PJP2wAhCjay0VrqYdw4idfCYQOtiy2fs/Cx5BJV0f/QKSH9W6xiOzfCOa6/f2UTM1Xse0XBDx2rNnRSHq9+ZdNBqdVMP6S3yLwBTDvpTSPeHWu5+CuR0Pya1AtiNHWURsHqME7wK25D092LTAi2xPpGRdJg36CXyQdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4NKdAWRAL5U6XVkKp7BTHC6ZVFy4E4IccHFR5U+1G/k=;
 b=gXYwhP5s5lrNclsEIJTCfVwWH46mP+rjjrdIxmQa0MY9MoH9WQZgWol/cyeTfHeL/t2vEX8tZ/KE5Krjq/rKsxSmfTt66z35fRr6bGFm2GmbS1SeUD9/ohFc6uSc4NJotBMgDCwjvvZCIPlIFBp2MpruACgc9yHE01WOJH3cxTcgQJ3/JJKuBxsPaMcualg1ONCC/C4tub1FcIKtKSbXC1Du33jnpxcyY7h1UWcWzsra6ZC4if1OW/fBMyGSPhyi3xyFgnluaHlVdoq5T0qoh9wl4wRsUco/boH6fxVAzxtDI25PvhdjNUnMWEj7FDBqderariG5i0kkhnUtJ7FnJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4NKdAWRAL5U6XVkKp7BTHC6ZVFy4E4IccHFR5U+1G/k=;
 b=FwEB6TP/f/5hDXujIoIKYWVfKPB/U5M0hiN797icYCvbcT1t4XJofvUexhF3+Nix96FBVOFjquYiWxL/U6y8qxnYZ+y+JbeMBNjxmn9iDVx5inJ23Pjok2MXV1hxTlLA1Xryh+zc98ObvDXXwEWn1ZnbgwUPwaSWyg01X0oVSl8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3302.namprd11.prod.outlook.com (2603:10b6:a03:7b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.31; Mon, 7 Dec
 2020 12:25:30 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498%4]) with mapi id 15.20.3632.017; Mon, 7 Dec 2020
 12:25:30 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-aiohttp: added missing RDEPENDs
To: Vyacheslav Yurkov <uvv.mail@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <20201202061918.71606-1-uvv.mail@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <4cac6b8b-28ce-ef11-f236-cf6a9080f1f9@windriver.com>
Date: Mon, 7 Dec 2020 07:25:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20201202061918.71606-1-uvv.mail@gmail.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YTOPR0101CA0032.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::45) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTOPR0101CA0032.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::45) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Mon, 7 Dec 2020 12:25:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bff6d721-cbc1-4ef1-83eb-08d89aab2ff9
X-MS-TrafficTypeDiagnostic: BYAPR11MB3302:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB330225ABE62E48ACDDAF9D849FCE0@BYAPR11MB3302.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:403;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dkZlE8jbuHWa27dkvd3ulZVJLpee6aT3hkvihZ9OLtihHTAgiblSu52LpWXqEU//66vX349sKyeVIn7om0tv2JlczqCdq3QGDeqBk4u+nAp0OIHHwzim2IMnrByKk/qs4lbZJTr4WbwdnUzCwmrNc4mY8kqEK75YdKKYIPv+omapQYRWseiRFKVPNQQslGedmDkyCEYU7w9WXgUXH5IRGJFb9W+8iUKlVfojw8YGETcZ/FUlrmQWT+048zD1Cu0NS8YCqQorVNhV0+NEYQeM+zXOcWeSHkw3FKXYiDk4w3XihEzc6WeJuszL2LKbsFBDqi92+WXX5tplmzvtj6+kG3azBzSZRl8s0CJneZGGIFj3Xp022K9jZ4FIciif7L7IyHZ0ZsPyXKYtLIeeecKeXX2bapgcZoqMnANo+b72yDcAU12INHImB4U1Hd2IwgrYSaft1jzM0J/IXoS8JG8W0xjhThtgBwNNN/bLmOHfyIYZPEFBoO8eTBLe6vIAsndQ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(396003)(136003)(376002)(39850400004)(316002)(956004)(966005)(36756003)(52116002)(2616005)(8936002)(86362001)(8676002)(2906002)(53546011)(6486002)(83380400001)(26005)(166002)(66476007)(16526019)(44832011)(16576012)(5660300002)(33964004)(31686004)(31696002)(66946007)(478600001)(66556008)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?TnhvZjZFZVRMZ1ZCMVBRek9PS3FVdytra0tmWFFQQndGS2swVEtra0VaM2Va?=
 =?utf-8?B?OEZzYmZJeHZZOFdCNjV3Qmc0ek9FTmhOK3U3QU9OWnNGRGRzdENoNmpsYnUx?=
 =?utf-8?B?c3FHNlFnNTEzNjVhdVdheTljNmxIRHg2TExYN3pXZ2FtVFdKODFOZFFFdFBl?=
 =?utf-8?B?blRrSE83VmlRR2VWdTNVZzltSkFhbDl3L1hyT0IxUTM5SC9UT3ZYelprUFd4?=
 =?utf-8?B?WFdLNUtBcVl1V0xMd1ZYVzRlRGNrbXpxdXMwdFhxUVNVZ3hmOXNFRndCTnY4?=
 =?utf-8?B?UUdIQkxDMWtieExyTWR3aTVsKzZpbFFwYVY2UVNiUUg3TUlHRzUwOUNiVnRK?=
 =?utf-8?B?MS84RkEzaytmMURSdHlEZ0FrSnJUQ1N0cHlENmZPajJ0dlg3UHU4WHlmelBs?=
 =?utf-8?B?YnNJK3hhNjhqM2R0Y0loRVY0cVhJWFMvNVAweS9UQ0RZOXU1SERIT3QyTkpo?=
 =?utf-8?B?TUFwcUFaSWlmRldzYzBhdTFjaXJSb2RTTTBsZzJaemFHcWwvMDJoWW5WZGFv?=
 =?utf-8?B?QzU5YXZISThPY2dDMGNpRk9mZDFZbGRtSWpmSzZjT1JVSDdNQ2NUdURyWEdk?=
 =?utf-8?B?bFJrMlNGeXJhdTJlT2tNZmFHSGEveCsrN1NUdXZ3cllkbTVoN2NYMGwzYmZ2?=
 =?utf-8?B?bUtqdk4xekN5cGNvMk9sUFNFZnFXb0RDa0xLNEdhWGE2V2drMjV3d1BmYnNG?=
 =?utf-8?B?YytmQytiY1k3RFE4eXVJS2t1QkN0UCtsZEZjbXN0SkV2bHFVUVRYNUx3dDVt?=
 =?utf-8?B?aW82VUk5SGdsVDlPQUE0RGZaUEJWUnQranpVVXVRWXg0b3BsL014NVVmMG9I?=
 =?utf-8?B?RFJJSXVMZE9YbFo5T3FoVWhZQlBDeW5pdENDV0dNaFU2UFlodndEUHR3clc4?=
 =?utf-8?B?SVRYRjhpVWRzZ1hpdFkvOHd0RnZRSDJ4YlplRHJXUDQ0M041N1pmTzE5RTdr?=
 =?utf-8?B?VzZhZStzQ2h6SFd0UFFBMjJtTGRjZ091SUJVQWRGeExFSURwK2YvdCt4WmxN?=
 =?utf-8?B?bzB1SFNYWmtha2RCSXRqTnNaVjdVQXVOY0pObmNEYTNWYkl6UnM2aHNxOFF4?=
 =?utf-8?B?ZUUwUnFPVnhHZDUzZlIxMnV2MEwyMzhEYWpkVE50dEY3b2dYb3h1SGpkQ2cx?=
 =?utf-8?B?d0p5QzczSWpOQmR5aC9GaHFrRDdsNlRHVVAzd242TklwN2dxZnVkRldaUE0v?=
 =?utf-8?B?dVJJRkFYd3F5Z1BtV1FQM0QvR05GT1p6NlE4d2lVd3hvU2JqVjZmQTlmWjhG?=
 =?utf-8?B?cUlVS0xtY1F2d0FQM1B3U2c0Vmh3ZFlQSEpsLzE0cEN6OFcvbTRRdTE0endy?=
 =?utf-8?Q?Qk2bf4B+RSiROAMkOMCUD6LfoKlo6xEbC0?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2020 12:25:30.6952
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: bff6d721-cbc1-4ef1-83eb-08d89aab2ff9
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k62dxE20jO+jqFL3C8nxOQb+E09pV1nhy3I241k+WzDsrXsEGLFbHeuMslaLXwiguILZVqu5awLRYZWI8R7WGpbr+bnE5BZypG7Uj8B/wCE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3302
Content-Type: multipart/alternative;
 boundary="------------E553EDE1D085CB4B1630AC16"
Content-Language: en-US

--------------E553EDE1D085CB4B1630AC16
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2020-12-02 1:19 a.m., Vyacheslav Yurkov wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> aiohttp implicitly RDEPENDs on html, json, and socketserver modules,
> which are part of python3 recipe. They can't be properly imported if
> they are missing from RDEPENDS
>
> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   meta-python/recipes-devtools/python/python3-aiohttp_3.7.2.bb | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.7.2.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.7.2.bb
> index 6cd5a4cab..c98e3aee7 100644
> --- a/meta-python/recipes-devtools/python/python3-aiohttp_3.7.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.7.2.bb
> @@ -13,8 +13,11 @@ RDEPENDS_${PN} = "\
>       ${PYTHON_PN}-async-timeout \
>       ${PYTHON_PN}-attrs \
>       ${PYTHON_PN}-chardet \
> +    ${PYTHON_PN}-html \
>       ${PYTHON_PN}-idna-ssl \
> +    ${PYTHON_PN}-json \
>       ${PYTHON_PN}-misc \
>       ${PYTHON_PN}-multidict \
> +    ${PYTHON_PN}-netserver \
>       ${PYTHON_PN}-yarl \
>   "
> --
> 2.28.0
>
>
> 
>

--------------E553EDE1D085CB4B1630AC16
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-12-02 1:19 a.m., Vyacheslav
      Yurkov wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201202061918.71606-1-uvv.mail@gmail.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

aiohttp implicitly RDEPENDs on html, json, and socketserver modules,
which are part of python3 recipe. They can't be properly imported if
they are missing from RDEPENDS

Signed-off-by: Vyacheslav Yurkov <a class="moz-txt-link-rfc2396E" href="mailto:uvv.mail@gmail.com">&lt;uvv.mail@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20201202061918.71606-1-uvv.mail@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 meta-python/recipes-devtools/python/python3-aiohttp_3.7.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.7.2.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.7.2.bb
index 6cd5a4cab..c98e3aee7 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.7.2.bb
@@ -13,8 +13,11 @@ RDEPENDS_${PN} = &quot;\
     ${PYTHON_PN}-async-timeout \
     ${PYTHON_PN}-attrs \
     ${PYTHON_PN}-chardet \
+    ${PYTHON_PN}-html \
     ${PYTHON_PN}-idna-ssl \
+    ${PYTHON_PN}-json \
     ${PYTHON_PN}-misc \
     ${PYTHON_PN}-multidict \
+    ${PYTHON_PN}-netserver \
     ${PYTHON_PN}-yarl \
 &quot;
--
2.28.0

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------E553EDE1D085CB4B1630AC16--

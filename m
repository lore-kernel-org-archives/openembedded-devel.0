Received: from NAM04-DM6-obe.outbound.protection.outlook.com (NAM04-DM6-obe.outbound.protection.outlook.com [40.107.102.50])
 by mx.groups.io with SMTP id smtpd.web11.5435.1606918201790873121
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Dec 2020 06:10:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=CjTAAFOB;
 spf=pass (domain: windriver.com, ip: 40.107.102.50, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MIJJhlyxJnAp3rQXZRe4pE8zXl+zfvAKzgvF3tWZ8CwgpFb5dhHMlVxrZrxxa5TG+Dg8o1fUWeHl+hs3mR9myn2TVG8fsFUsfL8UbPDezApdztMys0L+6P1FkIhbZXg4IgWuQfWgNGl5fwCMNu/tjHCBJAg7Um5QfX3FBIfAjjiCHntsDKoBBqrXR38vBwZRjvcdbee/cAiShikkejKWvwKLCP8JI8ah4F0Z2nN6zb+A2+TtnZJ2QzBsE2u7x92IsP/y4aAUH5pJMkW7zrhgH/ttnBA6mjjAGMlRKvv6B9+10gU+ImrtV/qCBZONYOucyJRkX3NE3oLrGZOYm7lXjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PZp3ckseuT7GHbZodcqBMSHe5+S2qF5wepPr+nODuKc=;
 b=arvk0jPDVU6glp+xqjwO0PPXvkS9fH5WgsslgbjGhiotrNSXq3LvS4Isf9explyjlryIOVnzBfXijShGeQZZsbVfrU68Io+jBrag+qQ4RjkECYV2bki/KcevFBfi0y90cDg3qCEj0+fVu94v71sVQOfixJCQOmvf4yWbfqzPGBP/IpGeqTEzHyXdZWW+yYN1hwJPgrDkxu4nz6DuiM5b6pRCDdpJr6cwjxySIN8ZNjetPMM4Z8FnLke48oGnVOy+lpZJTNrR+vt0OV4k9DvA78CyMBT1aViIZsxluYN7jtEhvDeN+eOFDjNaVXxqPQvZOitXBvqgklosbrfQQXo8xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PZp3ckseuT7GHbZodcqBMSHe5+S2qF5wepPr+nODuKc=;
 b=CjTAAFOB6E0gzPyP07GDUMUlRNaDjWLUsDJyjAfHjGOGHPEt6kbv3fra/vLi45iMdzoRUz488yn+QxQ9hhStehU1plEyXtq/TWv/5chotAfnLjhBAbyhWRyDgussVoKEaqaRza5efljAGf/zwJU68ugXiv2fbLUrNlKY0sk9fxY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4864.namprd11.prod.outlook.com (2603:10b6:a03:2d4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.24; Wed, 2 Dec
 2020 14:10:00 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498%4]) with mapi id 15.20.3632.017; Wed, 2 Dec 2020
 14:10:00 +0000
Subject: Re: [oe] [meta-python][PATCH 06/16] python3-toml: drop (moved to oe-core)
To: Tim Orling <ticotimo@gmail.com>, openembedded-devel@lists.openembedded.org
References: <cover.1606592636.git.ticotimo@gmail.com>
 <46e510e2627ef2cc6a2ede1d9ebfea99e6569f70.1606592636.git.ticotimo@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <f3aa4417-cce2-0151-f649-362b95ba6d96@windriver.com>
Date: Wed, 2 Dec 2020 09:09:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <46e510e2627ef2cc6a2ede1d9ebfea99e6569f70.1606592636.git.ticotimo@gmail.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YTXPR0101CA0018.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::31) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTXPR0101CA0018.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Wed, 2 Dec 2020 14:10:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0764763c-c40f-45d1-2fc7-08d896cbf4f7
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4864:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB48644470F109D8A3812C4AAB9FF30@SJ0PR11MB4864.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:854;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZHGuxfClHxXmecQxRrj/Enq9ppwtzUVnUEAGc7n2HrNguBhtE1lf/VEvNnWvDvo+MOwpxnSK1/4Ziyzh7zLIlgPU34gDhyjfRMeAjAvlnrmQvE7b1oQ/684FaoQE/yiQuHyKyVXsHUDvWycJblbm4zqzHaLVuQT0fS1QmskGbRyFcCN5Acn+cFW5n54N3j/2/YzYcsYxrBQ6ZqsVq0unqURHnQvMtJ/Zmr59sZ4uC7hNBUogbhNBX68EbOU1GNcFPIY0F2e/yoYSJXAqhJOQi55IzfqLkFoO04rN8q2Ogx143WqsMt8754vpXgadwz18yynPzeW/BFfqDnjOiXE/RQCXd8F8qiIvYAWnX7X5aV6VPxhU0zjHyz4TT5CR9sSjmj9SLe02Ctq9GPJdh+HbeLAZYFBVr5aaKjLuzhrgexWESOqDfM7nnP8frVKW1D0lDwidGgYLO5qlgZgLUEp6qLZS0f7niNmfcGgtyXJtIV0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(396003)(346002)(376002)(136003)(956004)(8676002)(53546011)(4001150100001)(33964004)(52116002)(44832011)(6486002)(16576012)(316002)(86362001)(166002)(36756003)(26005)(83380400001)(2616005)(2906002)(66476007)(5660300002)(186003)(8936002)(966005)(478600001)(66946007)(31686004)(31696002)(66556008)(16526019)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?Q0xXM0ZqK0NuWFNlT1Y4WW5EZHJmOTNFOWNQSkRSWUZtelFEcmxFNitzOEdi?=
 =?utf-8?B?UXpGakdiKzhRY3VxQ0tOc0Jqb0tnS2xGdUxlTkt3TXV2ZVU1QkFWK3V5QWY5?=
 =?utf-8?B?elkvM3lBVlVnWjV1U1lISzhRRW0rR0padUd1YXMyYzZTeHpvQXBpUEllS1cz?=
 =?utf-8?B?cnhPWUdKa3d0QWt3eVpyRkM0ZzNXenhNRGwrMTQxeDBnZVhpOEhNbzRpT3R6?=
 =?utf-8?B?OEZwM0VKUU9EcVovei9ibWRSeDhqWW5QazBiOXFYLzFPQVJERkx0Z0s2SS9V?=
 =?utf-8?B?ZWVaTGp1ZTRyUkpBcitlYUhCYnZPVnB1MUR2cjhTQVIrUDcrOXVIM2IzOHIv?=
 =?utf-8?B?UVZTOFN3QzNwZysySFcwQ3pSRHBGaDlzcmMrWDVodjVCZnRoUVB5RHVyZzNW?=
 =?utf-8?B?dVluSEtzRWtmMldVWGs0dHYvYkpqOWhibE9WT01tS1RnbWdSVmJEVEhoU2xu?=
 =?utf-8?B?d3AzQzQrbEFZWGlaVzdGQWJZWW9QR2tVMndaRDVUMGg5WmkyR296Rmh4Nis1?=
 =?utf-8?B?MllTVU92LzQ5QzA2cXF6eUNDZHVOc2pzT1lkRklUd1FGYlVpS1hwaElpU0V2?=
 =?utf-8?B?UlB2VU1OR0VxM3dvYWZ6eHArdTdEQWZ4dmp1NWNaQTBUOTI0UStDSVZXVm9u?=
 =?utf-8?B?VTUrcEtyOUowTEhHM3VjakZnOUpNTWlsZXhtSk5FVXdiR3FaZ3VOb09VS0I5?=
 =?utf-8?B?c0pyWHQyTTJaNFBUVXVIZHBKVEcrTXQrT2NqVUpWbTdNam5QOTZYU3VyT1da?=
 =?utf-8?B?QTJRUGZPcktCQldsUUxzNTBteVM1MUhSSkdyT1BNSTQ4bWJPQ0RKaXJyYzgy?=
 =?utf-8?B?ZXp0R3p6aUh5Y0ZHNzZBU0FkS2JDT2JNcjM1RGNnUUx3N08vMTIzZmNJbWJN?=
 =?utf-8?B?aUJSbGtRQS9temdRcXBKZTdmdlJQaWs0ckVQcUVKQndKM2xXUDM1UC9POWgy?=
 =?utf-8?B?eXdQWFFRRGpEazk0bm1IcThMMDFLK1pnZUNvdTJMSmUwbi9HczhrK1dVVkJy?=
 =?utf-8?B?WWdlTTZwRU1Od1EyMGMzU0xFNTYrYWRYbldDVjVMVVoyV21YOWZRRklxN2hF?=
 =?utf-8?B?NWZ6bXU5K2ptUmZWUitvQWlVYjY0ZGZmVER3N2szRUlINjdJTjA5Q0hzTXAw?=
 =?utf-8?B?Ty8rOGxLVWVVSHVkbFU2UHptUGEwV3FsRCtPR2Fnb0hjdEs0VUN3WTJvY2dK?=
 =?utf-8?B?a0l6ZXVTYlBjYkE0dGtvUC8xSjhkRGpLMElCTkI5THBmYldTUytCd3Z0SWFS?=
 =?utf-8?B?Y1VMZGRCQkF1a1lkZnNWTWpKbnJSYTNIY0dFcGU1QUcrQ3Z6UVo4by9Hbldl?=
 =?utf-8?Q?RK89A6mG2FDzfX9kpEaj+KOEb6N8ynI+SN?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0764763c-c40f-45d1-2fc7-08d896cbf4f7
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2020 14:10:00.7421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SzzmrQlWEGo8wK6zrzVHngXskTTlHRkRQzeiChB2oIAbCK7JjeRiOwPCPT28RvKymetCVK8zVD3MuNhQZvcQuXCgWjLDWrIeO8J2hVE6cDU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4864
Content-Type: multipart/alternative;
 boundary="------------77B156F085F2AC091F0991FF"
Content-Language: en-US

--------------77B156F085F2AC091F0991FF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2020-11-28 2:46 p.m., Tim Orling wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> From: Tim Orling <ticotimo@gmail.com>
>
> Signed-off-by: Tim Orling <ticotimo@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-toml_0.10.2.bb                 | 15 ---------------
>   1 file changed, 15 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python3-toml_0.10.2.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-toml_0.10.2.bb b/meta-python/recipes-devtools/python/python3-toml_0.10.2.bb
> deleted file mode 100644
> index b46eba6fd1..0000000000
> --- a/meta-python/recipes-devtools/python/python3-toml_0.10.2.bb
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -SUMMARY = "Python Library for Tom's Obvious, Minimal Language"
> -HOMEPAGE = "https://github.com/uiri/toml"
> -LICENSE = "MIT"
> -SECTION = "devel/python"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=16c77b2b1050d2f03cb9c2ed0edaf4f0"
> -
> -SRC_URI[sha256sum] = "b3bda1d108d5dd99f4a20d24d9c348e91c4db7ab1b749200bded2f839ccbe68f"
> -
> -inherit pypi setuptools3
> -
> -BBCLASSEXTEND = "native nativesdk"
> -
> -RDEPENDS_${PN} += " \
> -    ${PYTHON_PN}-misc \
> -"
> --
> 2.25.0
>
>
> 
>

--------------77B156F085F2AC091F0991FF
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-11-28 2:46 p.m., Tim Orling
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:46e510e2627ef2cc6a2ede1d9ebfea99e6569f70.1606592636.git.ticotimo@gmail.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

From: Tim Orling <a class="moz-txt-link-rfc2396E" href="mailto:ticotimo@gmail.com">&lt;ticotimo@gmail.com&gt;</a>

Signed-off-by: Tim Orling <a class="moz-txt-link-rfc2396E" href="mailto:ticotimo@gmail.com">&lt;ticotimo@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:46e510e2627ef2cc6a2ede1d9ebfea99e6569f70.1606592636.git.ticotimo@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-toml_0.10.2.bb                 | 15 ---------------
 1 file changed, 15 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-toml_0.10.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-toml_0.10.2.bb b/meta-python/recipes-devtools/python/python3-toml_0.10.2.bb
deleted file mode 100644
index b46eba6fd1..0000000000
--- a/meta-python/recipes-devtools/python/python3-toml_0.10.2.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = &quot;Python Library for Tom's Obvious, Minimal Language&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/uiri/toml">&quot;https://github.com/uiri/toml&quot;</a>
-LICENSE = &quot;MIT&quot;
-SECTION = &quot;devel/python&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=16c77b2b1050d2f03cb9c2ed0edaf4f0">&quot;file://LICENSE;md5=16c77b2b1050d2f03cb9c2ed0edaf4f0&quot;</a>
-
-SRC_URI[sha256sum] = &quot;b3bda1d108d5dd99f4a20d24d9c348e91c4db7ab1b749200bded2f839ccbe68f&quot;
-
-inherit pypi setuptools3
-
-BBCLASSEXTEND = &quot;native nativesdk&quot;
-
-RDEPENDS_${PN} += &quot; \
-    ${PYTHON_PN}-misc \
-&quot;
--
2.25.0

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------77B156F085F2AC091F0991FF--

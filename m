Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.65])
 by mx.groups.io with SMTP id smtpd.web11.95.1615992826693196402
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Mar 2021 07:53:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=JSH6Q+Co;
 spf=pass (domain: windriver.com, ip: 40.107.94.65, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nwN+YpIdQ9EJqJEmFVm784yJUyJbisnbSz0QQ9mg8OrkHcsWIUb5IRFzvKMOfwAsqzdUNjH7qZOPQ/l5UxAZx4cznfzODaU6+ufJnVp4/rKE8byLfSX7yGlLYxCNOrxZHo3wgqlA5uo2L9+kGohpIuKMcqSK74RUH4kYC71Xe25Oexmms3tsQkcDpQJyIZVIwYNLqbkZ19PdLY5RboYffdHf5515KQox7C5z3lmcx9r9UwTmgUf+ScIbXjlyzNKU+UTbgDsIIlHqhbPfdXbg+s64VCUak1evl4knJ9GPZ4irJuT/b+uLF4kwiGkanJHzJy0gKouPbGnQvYLolMZ1zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q9p894pTs6TV5zlUmTK7MInoB9pFhrLZEHnGlTrhvP8=;
 b=RoIRJE0D6birK7kXslxz0g75HC7wyWsEtGDDMV5pF2HnPiDTZRl3TyEijIIluZe4+pA8U3uUMAyoX2fI7Ftb2ffH8+6k8bCHc2O7gXmb7QilqjXXxv5Y654T293qa6OYGIjHTFhecOh7Y4cSVp5AqYF+b/U4dqOz4CcLahkT+SiHB4txLVWF5NBWJvmOD2gEdvaLnd4J92xNlp0xOTYcxQ7JHA5W1Eb7us3t4XyB/9/9UXVkFgp8IJs+uPOqwHp5oUUC1dDHIlsMYP/BbIrslQjGhjjcsz2JXPZCPtaaUBcL3l0XAhDnqF3CIlo7IqNy1tOwn2xxyNMoiyyeo/zN3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q9p894pTs6TV5zlUmTK7MInoB9pFhrLZEHnGlTrhvP8=;
 b=JSH6Q+CoIzZfKxofkZjlfHz8GRoClcwQRroz444m2p/7gXB6TaYVnKT23HuLeEN+9SE8KUHJ/GIr8i94jb9FpPWaT2B4M7C0YUxGpwBk/i0KaNIqUBftha1vNCTXUrTbMBX+dZiUvyUnp11oDUuLGiBw3kmORk+gcKcLKgBX7xM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4784.namprd11.prod.outlook.com (2603:10b6:a03:2da::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 14:53:45 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 14:53:45 +0000
Subject: Re: [oe] [meta-python][PATCH 09/10] python3-pyflakes: Upgrade 2.2.0 -> 2.3.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210315084727.26812-1-leon.anavi@konsulko.com>
 <20210315084727.26812-9-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <40f4b4f6-b6e3-cc15-7532-e75c4bf2b159@windriver.com>
Date: Wed, 17 Mar 2021 10:53:42 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210315084727.26812-9-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN9PR03CA0501.namprd03.prod.outlook.com
 (2603:10b6:408:130::26) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN9PR03CA0501.namprd03.prod.outlook.com (2603:10b6:408:130::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 14:53:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf5df612-6b9b-42d1-f380-08d8e954769d
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4784:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB4784984CE0A62E9156090C0D9F6A9@SJ0PR11MB4784.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:586;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0JD2pvSodVEWediCNFbGVTglvrrkp+MJ63aXCeFdSw5nPo0RvMUjAuF+ZlyuHzASdiABGs7+BL7h95t3c3xUWW1sfFS2k/55vGXSUO69UYLcUbRdFLZNzT+B6VtLGdq5JuySXT61pPpTZNhaZ80Db9YAjuggLXYY8pI82E89z5wqSlTHQnU2RyVqyRL0Gy9eHHkzKzxyn2fYaJ/mxke5/nzByNow2T027FQIxb/P3L6OY3jYPao3dUkBZ0PLomxnkAWIzOXdbK/6SgxzzjKSaLoWohrF6Y5+EaEz0zvhd2We0IbUO0a5grkA+SGNy3V2cW7rCT3Hk+qx86DHdECXKAeTX2fGo/cWEUv0ZIJIJUZLdGj8C0/lSPIiMmbJ3ErC8zi82WQ3rCRb3MrVrOA5z0YOannQidAaieoQmx0FNrzV59R54wNrbaQVthpYhHjHNGyVnEdlk/3OeeVPtGCM914JKKQ69rCpdrCvcsgo6pwmu7FSaAvhosft8GKoJy5siTu0UfWI0vmEz4QYsTwetjjBulmZcy0G6tVhyI7saENNLOHEI5PBHNch/llGqm0AxRn/WGhUFI7QDT4irrahmkejwFkDXT+EE2w0xBvhqAw2oiFZXCmzKWLmYXY0dx0+yV6Y3n+AgjPTQn1yKCW5A22+nx9S43vrYPpBOk7dJYmdCjFvYUB+Bd7r14COBP+KmXydvh82aEFHNGtABWhrFuAH3juobaWHPexOCokRBVk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(136003)(366004)(346002)(396003)(2616005)(8936002)(956004)(8676002)(33964004)(966005)(66476007)(31696002)(66946007)(66556008)(6486002)(44832011)(53546011)(5660300002)(316002)(86362001)(2906002)(16576012)(36756003)(31686004)(16526019)(186003)(26005)(166002)(478600001)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?WVNoWUlhV0xwTWl2OThhMXZWaElnU0tMclhoMEV5c3AyeHRCQlFCQ2llR00z?=
 =?utf-8?B?RW1sV0ltR3NCMFpmZ2dPTms3NkdPZVU3b3FsY2JVRGRIR2pJeHo3NlVlclNl?=
 =?utf-8?B?ZHpGZkhKbGovUTY4aDkxa29sZ2tXQmdFYjdCRWxYcy9ZR0FHR3pleG5kSkdy?=
 =?utf-8?B?TEx6eTF6L05MNllUczB0YlVxQUliZHdwSk90YzEyWVpJbldkSys0VlZyVnV2?=
 =?utf-8?B?cmVnd3NxQ1pSc1F3bkwyOStpWXQ2K092czJ0b1lQTDVxenRPZUEyQ0dkQVJ6?=
 =?utf-8?B?QmtMRGtwQkhDMWRTK1Z1dm9jZFFOQTlIYkF0dDEzTHlxNVlZRUxzajF0SnF6?=
 =?utf-8?B?THZkb2d0K1piT0d1R1FtT2M2Q2RHanRIZEpXTkcxTEN4anhxZ3hzc2dMdnM3?=
 =?utf-8?B?TmV0NFZMNmMzTEJQcTBrRGs1MGNGSVBqbEg1ejhNQmFkNmF3dVZTNWZVVjll?=
 =?utf-8?B?bzMxTEZNSmgrM0tCQ2pLWVF4dVFqT3o3VFhERjIxeHgxdko1RExKdHlMclpj?=
 =?utf-8?B?cW9zTkowQ1Y0Q1BBNHdtQW5XVWVMY2VSWXFFR0ZlODJTT2dqR3JMc3FGMHQv?=
 =?utf-8?B?ZW5wSjZReXRpblhIVU9KQzNMUXMwUnUxc2VkNXNsdUdCNmI3TUR3WUdsN3Qz?=
 =?utf-8?B?ZmJTUEYzRnA5UGRoekZVS1BHVXlPdStQdWtGd004bEZ6bEl5b3hBMmlUckxU?=
 =?utf-8?B?Vkowakh0UFZ5dTdzUGYwbi9JaWFGZWkwWk1xbnVRVjc3Um5VWTBSZC9XdnlQ?=
 =?utf-8?B?Nkx2NFZVLzVDQlJ4eVRCR05vOVp2dmg2ODVhS0RnenVLbnNpeGVTMnQvNTN4?=
 =?utf-8?B?Q0xpVitBZFpTblh3emc1bndqVHVML3UxUlhpL29SdG5ycGtNeVVqRHBQbzdH?=
 =?utf-8?B?dXFXdTV6akNtREIxRlZwaFNSZlpBRVJqSHpiOWE0NWtIblExdC9sSkJ6Q2xI?=
 =?utf-8?B?K2lISVI0UERFNGFnRnJ0UnJmWHo0QnpIbzZ5Rm80cUU4L3h4UWpKdVBabGtU?=
 =?utf-8?B?NlM5VWVOKy82N0p5cDFJNzdvaHZHcEZxd0thN0EwUjFEMHdmZm8ra1ZJRHYx?=
 =?utf-8?B?cFY5WjhnM1JDaDhNYXdtSTFvRytXV1FpSGhNMlhrb1ErN3lVZjhnaWI5Wmpw?=
 =?utf-8?B?U3oxaFJ0c2xlQ25iblBWbUtBNFhBTitHUUdEM29sQUl0Y29NN0JURlBYMGdt?=
 =?utf-8?B?UlpSWmpmVzFIREgvcUhtZ3BhNDNHWHNlYnBES3hrcWFWdU9YVWpvdk5MU2ZF?=
 =?utf-8?B?NVBxYXg5RW1lS042dk1sLzUrMHZndm1iQ0w3WTlIM1NGc3hCa25sM1A4MDhZ?=
 =?utf-8?B?dlB3a0R2bTdQUzZ3ZTlyOVhpVXE2NTBXWDk3Nmdiemx4V0JpRFNZRklWZTVT?=
 =?utf-8?B?VVYwa0dVMHhkK1hOMHNRa1UvZXI0YjNzL2ZUakUzeG5hSXhkS1hqdHIyQXdF?=
 =?utf-8?B?SU0vd2x2VU5tdDdsRlMySTJCdUwvS3dDamtZbTJmTWRnNHNBL2FNM1lUNWQ1?=
 =?utf-8?B?Vmg5Zm9tU2V3V21rM3lEbEh2bVhXOUMvNUpXRDdKTDdFMTJLQmE3R1VKOHpC?=
 =?utf-8?B?SkwwR2lCSUxwYjk0RHBJWHU0UHdGalc0aEpId1Jyc3oyMXRheVlsNzcvTVZX?=
 =?utf-8?B?WEF1T0crUXZNOXBsTTJBNDlNOVAxTXR2ODM3OWxLY2F1ZkJsVGNqU1JWZmE4?=
 =?utf-8?B?c3IvdytVa01rVGZRMmE5dUFyWmVtazhzMnZkRjZUYmpNSGFWS2l0QzhtcFhY?=
 =?utf-8?Q?NGoXJytTqQRW8SHJ2bJ9Tq0iSywLeVT5/14sbH2?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf5df612-6b9b-42d1-f380-08d8e954769d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 14:53:45.2431
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qIXUezt6q/j7D/TMznNj2VfLLRB0a5Eyhu9wvrUJBV5w9yEVTs1RRUq+H52dHGBs35iMfyccbzfGzobzgoSoD6fvfzRsSQwonHAkNJOqFPE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4784
Content-Type: multipart/alternative;
 boundary="------------73C2A160662224C98E8F503E"
Content-Language: en-US

--------------73C2A160662224C98E8F503E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-03-15 4:47 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 2.3.0:
>
> - Recognize tuple concatenation in __all__ export definitions
> - Better support use of annotation-only assignments when using
>    from __future__ import annotations
> - Recognize special-case typing for Annotated
> - Fix undefined name __qualname__ in class scope
> - Recognize special-cased typing for TypeVar
> - Errors for undefined exports in __all__ are shown in a
>    deterministic order
> - Fix false positives in certain typing constructs (TypeVar,
>    NamedTuple, TypedDict, cast)
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-pyflakes_2.2.0.bb => python3-pyflakes_2.3.0.bb}   | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pyflakes_2.2.0.bb => python3-pyflakes_2.3.0.bb} (71%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pyflakes_2.2.0.bb b/meta-python/recipes-devtools/python/python3-pyflakes_2.3.0.bb
> similarity index 71%
> rename from meta-python/recipes-devtools/python/python3-pyflakes_2.2.0.bb
> rename to meta-python/recipes-devtools/python/python3-pyflakes_2.3.0.bb
> index 911cf4ec3..0c8956728 100644
> --- a/meta-python/recipes-devtools/python/python3-pyflakes_2.2.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyflakes_2.3.0.bb
> @@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/dreamhost/cliff"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=690c2d09203dc9e07c4083fc45ea981f"
>
> -SRC_URI[md5sum] = "48b1c29732ca810a70cba0e6d0531169"
> -SRC_URI[sha256sum] = "35b2d75ee967ea93b55750aa9edbbf72813e06a66ba54438df2cfac9e3c27fc8"
> +SRC_URI[sha256sum] = "e59fd8e750e588358f1b8885e5a4751203a0516e0ee6d34811089ac294c8806f"
>
>   inherit pypi setuptools3
>
> --
> 2.17.1
>
>
> 
>

--------------73C2A160662224C98E8F503E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-03-15 4:47 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210315084727.26812-9-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 2.3.0:

- Recognize tuple concatenation in __all__ export definitions
- Better support use of annotation-only assignments when using
  from __future__ import annotations
- Recognize special-case typing for Annotated
- Fix undefined name __qualname__ in class scope
- Recognize special-cased typing for TypeVar
- Errors for undefined exports in __all__ are shown in a
  deterministic order
- Fix false positives in certain typing constructs (TypeVar,
  NamedTuple, TypedDict, cast)

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210315084727.26812-9-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-pyflakes_2.2.0.bb =&gt; python3-pyflakes_2.3.0.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyflakes_2.2.0.bb =&gt; python3-pyflakes_2.3.0.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-pyflakes_2.2.0.bb b/meta-python/recipes-devtools/python/python3-pyflakes_2.3.0.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-pyflakes_2.2.0.bb
rename to meta-python/recipes-devtools/python/python3-pyflakes_2.3.0.bb
index 911cf4ec3..0c8956728 100644
--- a/meta-python/recipes-devtools/python/python3-pyflakes_2.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyflakes_2.3.0.bb
@@ -3,8 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/dreamhost/cliff">&quot;https://github.com/dreamhost/cliff&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=690c2d09203dc9e07c4083fc45ea981f">&quot;file://LICENSE;md5=690c2d09203dc9e07c4083fc45ea981f&quot;</a>

-SRC_URI[md5sum] = &quot;48b1c29732ca810a70cba0e6d0531169&quot;
-SRC_URI[sha256sum] = &quot;35b2d75ee967ea93b55750aa9edbbf72813e06a66ba54438df2cfac9e3c27fc8&quot;
+SRC_URI[sha256sum] = &quot;e59fd8e750e588358f1b8885e5a4751203a0516e0ee6d34811089ac294c8806f&quot;

 inherit pypi setuptools3

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

--------------73C2A160662224C98E8F503E--

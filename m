Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.69])
 by mx.groups.io with SMTP id smtpd.web12.8117.1615813299595729266
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Mar 2021 06:01:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=QXf7pzuL;
 spf=pass (domain: windriver.com, ip: 40.107.243.69, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m5QEVg67HBULVH/CoIsSs8ocu5nP4sw5Ijm3n0sgE+kRjFEekyzgYilIztTD31KfUo0IVRJssk6bWAs3eukfWZxUovoioK5ZRIApOtJM0ELn6yFI//PVqDC4Zd0cUd1UASqmouwTUDj1E4AWHaYQtw0UkLfq2CEWRKs5bkxWPS9Va9YdTzi76tes9yIp55QEqxcvfxdLX3e1dCekV34tXaX6opOFiiwXo+M64tEeJyXPxGry703e7ZVWORWAj5iW2+tl5U+fKxVwIrbk8GfgTbzxzg4+twI0W/pUcWZsiPzFDrxpxD02UFzNQtUE8ASZaI2WOGJ7slJChQKVEElxkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C5G4aMJz1EzS3VvSCDOwxMpGBhNKkL+GGbfPVuJEvGM=;
 b=Fu0ag78R0yIzCs8C6w/1Nb68zjmsjVUbn54FkQldJ/mbCe7r6RwIGfED439ycnMJmKL6yxFxWV+D6X/XgAZhrM0KnylQXpZ+gQwwRpiVWUul+oSQ88GUP+Y58/YihCg13FLWH7RxVL8UqAmwxGA8YuxnOTLNFwzOGoIoDUd2sAnyvWR1LQUY4aya1bogh2Dhc0koZbegNZTMvrU4nPtQXbZdLG7vWJBTpWr9zA2h7WCGgPqJS/wVLrHwVia2mHy65NJ+ZsCexLoUOL+c85aUv4HFCBsVUwU3w0T9aN1Hk9z/UOWbGisV2XUBX1B2UXugWom/t73wkVYLuaV8StENOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C5G4aMJz1EzS3VvSCDOwxMpGBhNKkL+GGbfPVuJEvGM=;
 b=QXf7pzuLX+xSXXNCF2ASrBylOEGqj+SB4UEblxC91SJfJ1pFHihj0wFBAM5uVj8rDhGf3XQ+eLAf5rRm1XfJuRY1tRCxpK2ScJcaiXrnZ4LIGobYMMZCsNrKR3uUpgkflfrIgXmBgD3EqiPSe+9RhTzUPE8N0WgbB42mAsKM5Fc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2901.namprd11.prod.outlook.com (2603:10b6:a03:91::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 13:01:38 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 13:01:38 +0000
Subject: Re: [oe] [meta-python][PATCH 5/5] python3-prompt-toolkit: Upgrade 3.0.16 -> 3.0.17
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210312162600.8335-1-leon.anavi@konsulko.com>
 <20210312162600.8335-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <2f1abc25-447b-487d-2c4b-d7b32c4dd200@windriver.com>
Date: Mon, 15 Mar 2021 09:01:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210312162600.8335-5-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN9PR03CA0361.namprd03.prod.outlook.com
 (2603:10b6:408:f7::6) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN9PR03CA0361.namprd03.prod.outlook.com (2603:10b6:408:f7::6) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend Transport; Mon, 15 Mar 2021 13:01:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 346290ec-f7c5-4590-f969-08d8e7b27838
X-MS-TrafficTypeDiagnostic: BYAPR11MB2901:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB29015B427F09AABA5DBEE2139F6C9@BYAPR11MB2901.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:626;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UfJ1kuf6tW8j6j+Q2lbR6W0xSgzJt/eppAIqR/HfAl61hnHXKPXeGs8s3HVEkdAMf0D+uOr2iAmA+SudqWdamPAngpfILBlg8WXf7/ycVap+/P4ZQ5E8tgZLhunIg8d+IvEaHAHeGcxqF9oaxW77bla3IvbDLx+I+UFycgaBGknMYpvQw2lkVgIdaw+ZKJMQUOnnkxUKAWagyxK2pze4LomvPvox7K5LXf+sSIidVL9TRhjHb34/7TDNxGwktsD3GXkG517L95wuZPqrryqzFQ/LulrD9+Nz3iEH2rwNrh3cDUVRVzcMzj/POE8gGSm1+5fGlFVP410Bg8LZF+PmSCh5KUMtYi3cW1bG3bAHR1ZUINVgpx1PalpbtRy2vFrQjW2qE2uhRFZzQoru4gTpxAM0BAAnSCIWbPRhC8ydug1aVDXneWKyAzA/I3tPz77l11j2EgJFWRCig0E8pRxdXjMAH/oJyp3sBEApsRvQF0UiVzN6tqQ/er7Kwzuo/g8u1lcgUem8fdluSlfbeJbCvNMAn8qZHks7o00N6sUQ2DbXv+VZIy6rHZSuSm4zrdiF9hl9tisswt5afWaSuAvfM9+PJjJQAQ21PkmbjOTZxyad4gQzLLga/EKQOiWLtrbM/wz3Aav3++jGwCUfp/CEF5iJWvz9CkIyCwMazDbzPNvHZrRPQmG6px+R4Hkg16FMMJcslulNQLpbkEyRb8tuMNvdiknU4kM1fnCbglIvk40=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(376002)(136003)(366004)(396003)(26005)(36756003)(2616005)(8676002)(166002)(956004)(16576012)(186003)(966005)(31686004)(16526019)(478600001)(86362001)(83380400001)(66476007)(8936002)(66556008)(53546011)(5660300002)(33964004)(6486002)(2906002)(31696002)(44832011)(316002)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?bHMrNFd6dmlqeFNLT2xoZGJPTnAvWFBmZ3IweU9XOTVsNkV6S0JNQlMvcldj?=
 =?utf-8?B?SjNaOG5Lc1Y4cXdza1psL3kyY2ZVZ3FGb29JZjB2STBBSlQ1SERPNTVETzEz?=
 =?utf-8?B?enRTVmJ3WDZQVnJETlk4d0R6aFN5Y3ZvMURyazBBQ2xvT04xdWdiWnpGQ21h?=
 =?utf-8?B?Z3YyTGRVVTh0NWxnbFVMdmUrSU1xQ1VEd0x0cUJkblN1cllIRVR3Rk4vNTF3?=
 =?utf-8?B?Z2sya2dBc1VTYU5DeStUMVJjU3o0VHRhd2pHN1pkbk5PTURZUUloWFVueTVr?=
 =?utf-8?B?N1lHV0lnZDFPQ0Qwc2drcWR0emRucWNCMTRtdFJabTlCQVNSU0crOUR5RjMz?=
 =?utf-8?B?eVl0UjQ0V3llWEYvcDBRYnVkU2t4MEtpZnZjNGlRTVNwY1ZNUzUzamFqVnBS?=
 =?utf-8?B?djZmVEFLSmhoVzVuV3RreExtWERCWG42SkVJNk01NFBRNmFkTjdvdWlrd3N4?=
 =?utf-8?B?MkNVQkowR2FaZG9PNVpzSzRxYjRrK0lSRlFiN2tVMUkrYUdHanNPR25xREtm?=
 =?utf-8?B?YWEwZHF5S3I2ajBSdWl5UXlxb2o1WFIzVHBPNnZZT1FhNjE3dGtUbzBjWjVu?=
 =?utf-8?B?UnlIUFdUaVhML1BvSnZsRnR3VzJjb2tXK1crU2NNZGpvRWZHSGV5R0pkNmNh?=
 =?utf-8?B?b2syd0NFUE13Y1hZMlZ0QzRoVDNXRStRVEIvcjVkcnp2NnN6STNPOEhoaHhr?=
 =?utf-8?B?NDVzbkVaVXk1aUpMTjc2azdOcTBKRWIxL3JOeVlKOVVvWFJncExma3Z2YkZx?=
 =?utf-8?B?SVUxWng0UmJkQUxGQ2FwYWV3OUdnS1huMTJQSzhLYm41a2hHNVJndkdhRTlC?=
 =?utf-8?B?b2hsWG0zc3ZWbnYzTWdHVm55cGtFU0dKd1dBNTFxNWNMaEsrLytMU0VXUzVP?=
 =?utf-8?B?b0xDTXhrREFBbGMwRDZZcXlhcHhCSkhMNEpzcjNMOXJ1K0pYaXlZSWc1RFNV?=
 =?utf-8?B?cENEQmcxNkN5bjNKdmtkNVlEQlhRZEhKdzY5L25vTGRYYm1wTHFyWlVlY3cr?=
 =?utf-8?B?RzN2d2RnK0VKSFRvZWVrR085ZHlkSkdoM3l5TzRkRE5ocGNIR0pHUlJqaFo0?=
 =?utf-8?B?TUtxUGVtbFF2eEN6TXlEd1pqMDY5UFZoNWVDeHBFMkNLQ0ZoYjYrZlhCeERl?=
 =?utf-8?B?Z3g2OEw0T3ZLYkN1bmtxaXRaQzFxSVdDRU9qQ1hlWFlPdWFrbkU2VEZPd3FI?=
 =?utf-8?B?MGxudGVxYUQ4TnpsR2VNT1ZZTVR5R0xMZHUwNlhqbmIzQVV4VU52cmNoSjZl?=
 =?utf-8?B?WW9xRUlEWXdxaXlyb1R0djNZT3JUcW5FN1c4WncxdXJBNVJ1QXU5R2J6UlNU?=
 =?utf-8?B?N3ZwWHRKVHNwRlRrQWs0ejZSQmwxZCtDK1NWdDhvZm5IUmNPcm45bXFKY1o3?=
 =?utf-8?B?QWZRZyt5bzUwNnVNY2lRMEV1b2dudWpPdzVEaTBLT0JWdzNDMTZrbDdPamNN?=
 =?utf-8?B?Q2dNQTV4UGRRbFdlRktwMU9QakROWlAxNjFnN1U4b3RocUxPVnR6dFpFQ1d2?=
 =?utf-8?B?ZlExUUlkdWN5dGlMZUg1Uk1JbWd3QmJhRXZJaWl6NjhvWWhFNEZMN2phSFh3?=
 =?utf-8?B?U21tVlRYNTQ4akFGYjY3NmlnQSswcEhmVFA3S1BwcW5JbEtNSHlvT01UaVRR?=
 =?utf-8?B?Q3o3U0dYR3MvSVBzekNDR1p4eUdsRUhyRkdHTS9tVjl4MVBZZVpHU0s1T2hM?=
 =?utf-8?B?M2NvRW5oeVFaUzY1S0ZrblJzem05K3ZXeWwrbGlwUS91eGFhcHdNbzFWRzBS?=
 =?utf-8?Q?+QdB1dElumNitriCPxwVMYG6+j47FFK5YWhpTT5?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 346290ec-f7c5-4590-f969-08d8e7b27838
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 13:01:38.2188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nfqiYWI+SQpHNKgKKWuSRfw7G5vEEreK9+g1Z8wReliqJ37bAUNjxKlhU2qhf30kDZe2XDFZnuqBbLEZ5tO56XnW1VRZDUHFXH4SjS9hC7g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2901
Content-Type: multipart/alternative;
 boundary="------------2B4549D17CC1CCFC440DBEE6"
Content-Language: en-US

--------------2B4549D17CC1CCFC440DBEE6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-03-12 11:26 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 3.0.17:
>
> - Accept `style` parameter in `print_container` utility.
> - On Windows, handle Control-Delete.
> - Avoid leaking file descriptors in SSH server.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...rompt-toolkit_3.0.16.bb => python3-prompt-toolkit_3.0.17.bb} | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-prompt-toolkit_3.0.16.bb => python3-prompt-toolkit_3.0.17.bb} (86%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.16.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.17.bb
> similarity index 86%
> rename from meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.16.bb
> rename to meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.17.bb
> index 2a377d6e6..699e6028b 100644
> --- a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.16.bb
> +++ b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.17.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://python-prompt-toolkit.readthedocs.io/"
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f"
>
> -SRC_URI[sha256sum] = "0fa02fa80363844a4ab4b8d6891f62dd0645ba672723130423ca4037b80c1974"
> +SRC_URI[sha256sum] = "9397a7162cf45449147ad6042fa37983a081b8a73363a5253dd4072666333137"
>
>   inherit pypi setuptools3
>
> --
> 2.17.1
>
>
> 
>

--------------2B4549D17CC1CCFC440DBEE6
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-03-12 11:26 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210312162600.8335-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 3.0.17:

- Accept `style` parameter in `print_container` utility.
- On Windows, handle Control-Delete.
- Avoid leaking file descriptors in SSH server.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210312162600.8335-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...rompt-toolkit_3.0.16.bb =&gt; python3-prompt-toolkit_3.0.17.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-prompt-toolkit_3.0.16.bb =&gt; python3-prompt-toolkit_3.0.17.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.16.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.17.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.16.bb
rename to meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.17.bb
index 2a377d6e6..699e6028b 100644
--- a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.16.bb
+++ b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.17.bb
@@ -3,7 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://python-prompt-toolkit.readthedocs.io/">&quot;https://python-prompt-toolkit.readthedocs.io/&quot;</a>
 LICENSE = &quot;BSD-3-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f">&quot;file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f&quot;</a>

-SRC_URI[sha256sum] = &quot;0fa02fa80363844a4ab4b8d6891f62dd0645ba672723130423ca4037b80c1974&quot;
+SRC_URI[sha256sum] = &quot;9397a7162cf45449147ad6042fa37983a081b8a73363a5253dd4072666333137&quot;

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

--------------2B4549D17CC1CCFC440DBEE6--

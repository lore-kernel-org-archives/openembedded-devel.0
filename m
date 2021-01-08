Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.54])
 by mx.groups.io with SMTP id smtpd.web09.1920.1610121848409726906
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Jan 2021 08:04:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=osg6JoNf;
 spf=pass (domain: windriver.com, ip: 40.107.243.54, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KremhcZEIzWbNrHLpbMmUb+Ted+KLU4UB5/jZ/33qmSto1frYsgcM0P5W9fd+e9gbL8RmosZaKU2fvbPIwzw2MRNi79uUbTv6CbsYc92IGFN4PQJrhx4HKXSElQNX/Go3IEPGDZQKFuBhoABCIwxmFKvy6pNUrvxgKdYpElKciSKcsGhTAss1/RTwKSHZ2cl/OnZcjZmhobR0927pa8aLo0QG61PaQMOWkQnNZn8cxzfkf82EGkzzqivEn3JMWWJxXGXPBoi9dXN223P/Tq79HiNf8as3ygLYcEPJ7vPVS5hl9obZxTkXR9KWasNfotCrw+6MLhu0Xo9IisBv738Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xqxWC8r1NShH4cg37mc3wySkM7TCShEeRbUZc41zick=;
 b=DCHiZst7yi5LQiWOJcvS65LZiyvz+Xi6rtMjM8eiF3iiCtpWR5HB6EK71h9Ypg05Ilrhc2nP9YIoJPQF3kHMjRhYjCoMG2Q4Lpz0hdYdtOX+rKFFxnkrtbOMGC1Jb/Brtnbh3oDrPmXfL0f6pQdrq9w3dF+Ff9H5MnnU1HoWLE2YBEervDVzmKwuvNgYyoQC0Jm5dPoQ+toMzqmc6RPPijPTk1mvnPZbXY5Wu/F0059e/RmAC+LOnd5WKesDh1PZqEe7sZw+fQGliqu/28h76TKdwr13muW0pPzATyl+Yy+TI5tLH8dH7A+0MIELKEqtP8RGQorhFYPrIuaSROASUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xqxWC8r1NShH4cg37mc3wySkM7TCShEeRbUZc41zick=;
 b=osg6JoNfXUkQaFRJMtSZ59nsW51pQ1n4PCYWDDqkg0RVEIZ1VvfjLYpdADi9+l1oj+gCleXHhuw+S34naBDVxONASiMCBpGqgOOyFySKzII9dWZqTN6EhCOyVE78fAokb6Tmavh91W0fqXEhT54AxANSiHUM78Pr73q3OO03aDQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 16:04:07 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6%7]) with mapi id 15.20.3742.009; Fri, 8 Jan 2021
 16:04:07 +0000
Subject: Re: [oe] [meta-python][PATCH 06/10] python3-prompt-toolkit: Upgrade 3.0.8 -> 3.0.9
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210105151638.15700-1-leon.anavi@konsulko.com>
 <20210105151638.15700-6-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <1d2e2d23-4ca0-6fde-a135-7b7d3a8d54c5@windriver.com>
Date: Fri, 8 Jan 2021 11:04:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20210105151638.15700-6-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR18CA0012.namprd18.prod.outlook.com
 (2603:10b6:208:23c::17) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR18CA0012.namprd18.prod.outlook.com (2603:10b6:208:23c::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Fri, 8 Jan 2021 16:04:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f70391d4-2b3d-4150-ff95-08d8b3ef0722
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4896:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB4896E02337DD5BC46B2B48A89FAE0@SJ0PR11MB4896.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:820;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ncdOM/Zj1Z1nHZqV39V2lJzzQMzr4HpPz06L0yKux5VrxbJxjM2TWa+/+mfcwohG+6X7AkxwXz97BUUVts2enrQIc9YWmgnpijBpZiEZEt3Zme7mN3/vb/K9ExqLCyTuxsnqV/ZsPr/dL8M5WOxtG0Gu3+VhQ34/UP3djt83cuSjj8PlybIeCVOyjyP5+SzcwN4ULMT/nte3FveJmf38I+nxaN7dV8PbtfK2WbPxji7EMBwkMcYBlMVCZa3UVmAgoAMFlfNi+KYhHBC/ncP6PwNdfUYGXU8PQa+pk15O1cfJKdIaP55rtaIgK5jshATngN7xHOzPvx5dq0UAVT3HdmVNtTLHnAB/ejzIIkcajhwK2H18WVNU4Q02K2eOZuQHZTqOMIGllX08w2ZN3/Rglahi0PKQrn5koT3/jpp5PtjnmBYf7KAcsSyArB8fgJLiSmNS8NMtY6jmU4C4z+vR2+nEBsV60eH05mfLyAS7cRGI3d24me1xae9qFv9d+UdJ6bW4A4isNqvBUJzG/xZQo0PDA5+vegofOhe60VExnoA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(136003)(396003)(376002)(366004)(478600001)(186003)(16526019)(31696002)(16576012)(316002)(86362001)(36756003)(26005)(2616005)(52116002)(966005)(956004)(83380400001)(2906002)(31686004)(53546011)(8676002)(33964004)(66556008)(8936002)(5660300002)(166002)(66476007)(44832011)(66946007)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?eUdmcFM3RDBjRWF0cVJQSDZsU05zQy9TdXMvRjNJZy9rMm5EUkhQUDRQS0xY?=
 =?utf-8?B?cnVoRVJGYllwZS9ZKzZqUVBnZkp6MjVZT0d5aXVNMmp1OFBUMHZOSk9sNFZj?=
 =?utf-8?B?dXdKUFRTS0lUZkFJYmpHOFZXSVl3NzcwU2FkQ1hmUDNKNEs5U1kyN2gwK21K?=
 =?utf-8?B?eGhwcE1HQnN4WURMc0UxT01sSlM0Q0JkWndRczZWY0pLY1BrMW90OWR3dG16?=
 =?utf-8?B?c3NqSUw3Z1Vxb1hyRlVGSnd2SVMyQnFPeVNJQ01pOVJCeGExTFB4WlNCZ1Bs?=
 =?utf-8?B?ZGVqMEorelFTYVhsZ05UQmpaQUtEZTh2Z1dORk1OSkc1QlhveWtrdXEyZ2N4?=
 =?utf-8?B?S3hVc1ZLZmVnTU4vM21ncG81OVBwancvTUd6MVRka21yekZEaVo3WHlxT0s0?=
 =?utf-8?B?cENBQUdqLzlyWmtZUVRqd0J2OUt0RTdTbmlONXFiUTFLWDNBTEhqbTdoU3Zq?=
 =?utf-8?B?MGl5THNWTEpOWVl2bDliejRoWlJOQXRmblI3aStWNjZaN0RtVUhhQ1o2aUts?=
 =?utf-8?B?SngzM1NYNkh5Q3kyVkNKMTVLYmlXdkE2Sm1tZGFxRFppM0Jaa0VyRVNFSXhr?=
 =?utf-8?B?bDJOaW9xSm5rZW1obk1MSmF2WWJIZFdiWmVaMHBMTkZHVXFEVFJPcDVPakZT?=
 =?utf-8?B?b2pjeER4SzFXRXpZMnlqMkFuVnVnTVJnd0MvSEFrSG5YZlZDaWtVbDNJTjJO?=
 =?utf-8?B?TENpRGxQRlo1M3JjUG1tZmZwNlorK2ltZTNUQkd6Ni9hbkw3TDc3MlZnQjI0?=
 =?utf-8?B?KzhzYW12TXM3aENPN1poQmhGeHprSGE2elp6RXo4VWN6alAzekRXWlZ3YUdR?=
 =?utf-8?B?Z0FSUGxXU2ZxajRVbkRLQStNTGk4SDgvektZTlNVSTNQbWI3eWxyTEhSZWE3?=
 =?utf-8?B?TVNxQjR0MVhvSmNNemtGWGlrUm1uTnRaSFBIUzF2T014QjkxMUZKWDBkZjQy?=
 =?utf-8?B?RUVqdVNST0VabUtHbnpXWDlHZXV1dzBwZXNzNzdOd3JqMzJpWk9yZzcxeVhY?=
 =?utf-8?B?ZUdWbXJqOWZyK3JqQmJVaGRqL0g0RTc4Q3dFTHdYWHluUHpLUVgybFpjZFFP?=
 =?utf-8?B?RzFBQ2FEeUcyaEdoLzY3bjYrZFpXd2ZQVG9oWnM2L0dLV2Y3YVBaV3VrS2pG?=
 =?utf-8?B?Vlk3VXA1SVEybkl6WDhPUWtCR2dQOG9wUU9zeFVJWFd6b0JseU1UQUlLZUgy?=
 =?utf-8?B?N0ZPdmJrT2lMejY1S1daems5RnFkazZORlNydUUzOXh6L3E4QWtzUmJZTERx?=
 =?utf-8?B?WFVoK0FrZjhrNVM2NDZuS2tSclpLS0RTeG54d2pCaDQ3b2xPbVdhWVdNWjNr?=
 =?utf-8?Q?wryUL9T8XrhOo2NaLFn8z5+w4IryzOheX4?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 16:04:07.0135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: f70391d4-2b3d-4150-ff95-08d8b3ef0722
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NdfX8VYc8dyUgEVJ9S9WP11oZ/6PrhTEM6qZRnmRmFkKGGZJiQ5MCH4v6xYw6wgAevEDJtG8jou0/7Bf69gVGDfM+FOiHznyqiDQueMFx/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4896
Content-Type: multipart/alternative;
 boundary="------------CA7026E7EA50343AF8CF4C39"
Content-Language: en-US

--------------CA7026E7EA50343AF8CF4C39
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-05 10:16 a.m., Leon Anavi wrote:
> - Handle c-tab for TERM=linux.
> - Improve rendering speed of `print_formatted_text`. (Don't render
>    styling attributes to output between fragments that have
>    identical styling.)
> - Gracefully handle `FileHistory` decoding errors.
> - Prevent asyncio deprecation warnings.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...prompt-toolkit_3.0.8.bb => python3-prompt-toolkit_3.0.9.bb} | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-prompt-toolkit_3.0.8.bb => python3-prompt-toolkit_3.0.9.bb} (80%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.8.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.9.bb
> similarity index 80%
> rename from meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.8.bb
> rename to meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.9.bb
> index 0debba48d2..589d9398d0 100644
> --- a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.8.bb
> +++ b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.9.bb
> @@ -3,8 +3,7 @@ HOMEPAGE = "https://python-prompt-toolkit.readthedocs.io/"
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f"
>   
> -SRC_URI[md5sum] = "cf3ca19873fa9e7f6162296cf6bae419"
> -SRC_URI[sha256sum] = "25c95d2ac813909f813c93fde734b6e44406d1477a9faef7c915ff37d39c0a8c"
> +SRC_URI[sha256sum] = "c5eeab58dd31b541442825d7870777f2a2f764eb5fda03334d5219cd84b9722f"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------CA7026E7EA50343AF8CF4C39
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-05 10:16 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210105151638.15700-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Handle c-tab for TERM=linux.
- Improve rendering speed of `print_formatted_text`. (Don't render
  styling attributes to output between fragments that have
  identical styling.)
- Gracefully handle `FileHistory` decoding errors.
- Prevent asyncio deprecation warnings.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210105151638.15700-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...prompt-toolkit_3.0.8.bb =&gt; python3-prompt-toolkit_3.0.9.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-prompt-toolkit_3.0.8.bb =&gt; python3-prompt-toolkit_3.0.9.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.8.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.9.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.8.bb
rename to meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.9.bb
index 0debba48d2..589d9398d0 100644
--- a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.8.bb
+++ b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.9.bb
@@ -3,8 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://python-prompt-toolkit.readthedocs.io/">&quot;https://python-prompt-toolkit.readthedocs.io/&quot;</a>
 LICENSE = &quot;BSD-3-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f">&quot;file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f&quot;</a>
 
-SRC_URI[md5sum] = &quot;cf3ca19873fa9e7f6162296cf6bae419&quot;
-SRC_URI[sha256sum] = &quot;25c95d2ac813909f813c93fde734b6e44406d1477a9faef7c915ff37d39c0a8c&quot;
+SRC_URI[sha256sum] = &quot;c5eeab58dd31b541442825d7870777f2a2f764eb5fda03334d5219cd84b9722f&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------CA7026E7EA50343AF8CF4C39--

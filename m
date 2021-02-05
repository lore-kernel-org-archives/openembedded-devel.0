Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.48])
 by mx.groups.io with SMTP id smtpd.web11.8461.1612533867682235095
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Feb 2021 06:04:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=irpYO6BP;
 spf=pass (domain: windriver.com, ip: 40.107.220.48, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ANBGSBHVy6kSFMCykrU5UsFRIe3cVrNmltKf6EI4MMyM9PlZCToNZ0wO/QpeakYwaQtwLZnBoa2FuVLFKhLGPqLV88Xhui154OQ58koeKWRnoDgDaJQcYKrLB77I4+Par9pyskhAKUsLeuaWABaZLXYg7YETOiriHIC7jFyWpr8ZvHRnWLw9rEtrTT4tqzq/vus/hvFKbJ3no+4/Y51mIeVTYBKlWrj0jqIXkIkbneiA+PJ2dDI2Vfy1zA2HBzDvHxyFGgnOesnxaQt6atNcbJbA8+SP+HzpaAtg/SjuU0fsYuV7CNslVGAFkHRlZjhKmNPSv7ILbTdNeAkkD9/n8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d89a//EXSgRoq4sa2vNwCcfzKTVoGlK7P/m6yp3ZubQ=;
 b=jyiE+CjEjBhG9ebIUd0TwaY58rZGR84HkITO7T9ci0sC6zh5iyWC4IBjhSjozhNMCuG//BYncjlveoQJ6f+a8JfGbicz0/hrlXXDNeBWjozjDxexBk2WwNX1NS4y8RTfJaSzt8z2aCVW8FVIbcWrbVQ5UqZ6juzdWW8d5KWRPbg7kN1vcP7zXyRxKXLs8AZcMpE6yHsiUGPMi9PpaFVgsr4JfJ8a899Cut9PAeg4oSqvRcRrBwqU6DZQpID/h4V+cSCe9HxYVMFJH1A5MIykEVLyEGwSNuhzIP/DXBb8oCJnn4lQ3WAl0OtVdZienKUZtcy8ucFZt7keTFlQEQVcqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d89a//EXSgRoq4sa2vNwCcfzKTVoGlK7P/m6yp3ZubQ=;
 b=irpYO6BPLCJKCJVUsDMFLS+SJx/sk7NvJ+9zsLoKF/Gnj9ynBJ3LLOrhDckAxHRonBrEgKbGO5hNN358GBR9RZlF7Gevo5GihDvXeInsJmABGkqUf4BpFqYhre+Z1KDk+0G1zVe0Scg3dJLPSCgHxnBjDsXXMOEVJiGkrJ7ppQ8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3352.namprd11.prod.outlook.com (2603:10b6:a03:1d::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Fri, 5 Feb
 2021 14:04:26 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3825.020; Fri, 5 Feb 2021
 14:04:26 +0000
Subject: Re: [oe] [meta-python][PATCH 1/3] python3-alembic: Upgrade 1.5.3 -> 1.5.4
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210204131940.22585-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <5fa311b3-2e46-2fd4-75f1-4b04d006ea5a@windriver.com>
Date: Fri, 5 Feb 2021 09:04:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210204131940.22585-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN9PR03CA0547.namprd03.prod.outlook.com
 (2603:10b6:408:138::12) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN9PR03CA0547.namprd03.prod.outlook.com (2603:10b6:408:138::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.21 via Frontend Transport; Fri, 5 Feb 2021 14:04:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f6376335-4ac1-4291-e2ab-08d8c9def2a4
X-MS-TrafficTypeDiagnostic: BYAPR11MB3352:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB33521B6BCF2099DAAD26A85C9FB29@BYAPR11MB3352.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UYoiNyeS0tY0FdMHyu57O6Dk+gx9UKKF8xbuFCX01iiIcFNkRBn7TNQVo/QBk+ccEwLSP2EkyVJqbfuEBz1LDbK86wz+/xR7ZTWpRlthvUCs9haKkoNGYUBmm4AgC+SQkE6z8uSc4klO0EyvsS4riQ4LI3XM05s+4aZGlL47ATjxJqBihWY1AfJNFiVd7Cistwx02fcGtqVGRUCdLIy9fe+u5jDzZ2Fx3SVG3wMivlr/5mLHOWjEgwAOXJgZNVF0vT7IP37v8xQE743LDdUpmZNDkoAbRiX/F5aaltcxiZ2gsaBz2HFlUFaBx3UWKH8TwFz5hH76nGWEgKYR8f7NrtO0edKs/V3gJ+HMnqIRSt6XZp1iCzjecptqlzcqYcVeMy7wftaoHIpi5QdDsb1zYOHKcWzPwWf2Non7XVoEgDp5B79cXxXzSS9QUDInqlACTOPnHD//8MSk2zIV2YA/NTsBi36LgjSz/aMw8WBpWgTAns7H6Qrap4YqvqPQg8fKEgn+U+joUElP9Ulopt0tSZOCKSwcXWY5SD78aHFqgCfwtn4sDQ9HMki6mBpNIQiVo3b2OoeVM3PT7rN2v2DnNZ3LkCbSoAMdae4VbiQ/BVoFJ9Y8p/5XFv7Jxaq36NMby1xg2FAKqCk5rpIM3gYxNEo8dkZYu4wQUN6+tmmXnT+0QXNhUYBJlHRFJLLhS7MB
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(136003)(39850400004)(396003)(346002)(8936002)(83380400001)(966005)(44832011)(5660300002)(16576012)(8676002)(36756003)(166002)(33964004)(478600001)(66476007)(66556008)(31686004)(52116002)(2906002)(53546011)(186003)(26005)(16526019)(31696002)(66946007)(6486002)(86362001)(316002)(2616005)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?MEhveGcvaFhlUUthQ2xta29wdmtwZTk5dUFUSjViUzNadEU1T3ZzNEtmYzc0?=
 =?utf-8?B?U3VvVHM1RnBwQ210dXkrZU04WGRGZWtVYVEzbWlUY1VHQXNDTFRGd2FTQ3dP?=
 =?utf-8?B?Tkt5Ry9obnpSZ01Rd0hnSis5TFR6WHJVaEFtZWZ2d1dLOFlYL2ZlbmtpMHFJ?=
 =?utf-8?B?MG02WlI5alEzWXZ3MElPUWc0SDZFb0xiYVgwUUd3SHc4cnFBcE5RNjJ0RUR4?=
 =?utf-8?B?RHEvZmZZNENZbUZOazRYUTIzNjh1aHpGZzg3LytTUnFaUGc3cGYxb1hVOE1v?=
 =?utf-8?B?Zm1NdTZiQ2pJWVQvZkl1SFltUkhjc2FZb25VQWVlbW4zNTFkOVRUNmZnMGpJ?=
 =?utf-8?B?ZC8rTUxXVjNzaGFUczdNRUVhSVEzd2w3bmJxOHpzTWUrSFB4aS9LVWtROGE0?=
 =?utf-8?B?bmZJVjM4dzd0VlNHVElhOTh3d0YvcTlVcjd1c3dkczZKS2ltNWhoN1NFSlFs?=
 =?utf-8?B?V01lNkJRcGNxbEd4U1JOWDRjR3RpM3Q2WHVqckJiMnNXbTBpQzc1WkdtM3Rw?=
 =?utf-8?B?RFF0SjU1MTVqa0dVRTNCN3lISWR1Q1dseDhCejJsMGhvNUY5TFZFUWtLZnpC?=
 =?utf-8?B?MUxNU09xWjlyVFZ2Zm1lK3l3S2hwN0JPZXRVam1DVEY5dXJQNlU0TkJsWDdh?=
 =?utf-8?B?VmswOHpocWVyZ2EzRGJsOXp3SkZWdzN2OGNKTC9TM1pCS0VZcWd0RjNGRDNS?=
 =?utf-8?B?U1JkRG9DYll0SzRDR2x2MVAzUWFnSzdDV0Z4em00Sldpa0lDR3R1N3dldGkz?=
 =?utf-8?B?aUJkanZmdmlEMDkyRSszM0swSEwvYXN6K2dOVjVPMmZxRk50QWxSUVhBUjN2?=
 =?utf-8?B?ZkVVRnUvQ2ZLTlhTS0RFTlpWamEzd3NvU3dLNGFUSER6WmQ1aW1UeWN3aUtO?=
 =?utf-8?B?T2EveG5xY2YyN2VGK2F0a3RsbW9zOUJNbVlQZkVDTGhaK09SbVlkRmY4czFL?=
 =?utf-8?B?bnMxcmZZR2REN1dOcHRMME9QUmZqcFNMYm5aanU4SVRHQk5tQnZLdExHNkhh?=
 =?utf-8?B?Y0xFQUxDeTVOQUhJOWZ2ZnduR3VyNUxTdlZnMUpQTGpUbll0TVZRemx6YmU4?=
 =?utf-8?B?UVRoY2VySTloUlhlcXVTczFseWlzdXFVUGhtdWQ5U2JSczVpcGw3amtrL0VT?=
 =?utf-8?B?Z2JvMWYrMDVXU3ZINmgyN3JpS09nT1JEcVBMSkNPb3Zad3lKS1pjVGQyZEhV?=
 =?utf-8?B?QUN2Yjk0ZGMza3hYaEU2T1NJM0lIN3EyQXUreDFOTjlUWURjc0lQMjFzMTJu?=
 =?utf-8?B?eUxQR0cwZzFWZS9Wak0ySEI0bFVnaUtWVDR4NTB2K3g5VVRrTERmeFlCUGV3?=
 =?utf-8?B?TVV6ZEQ0TzNublFXbkw2T0MxQWdpZzdxUjU5emxId3J5Y2x6ZURQaTlpY1cz?=
 =?utf-8?B?LzI3V1ZJaVBJNzNOakhuT1VEMTlObHlFMEM5YTZSNGd2SHVJV0dST0Z5QW9C?=
 =?utf-8?B?d29JZGJFeE1YL1ZHekQ1b0tSaU5iUmRXOWpVK250RE0wZkNxZ1B2UDFubERt?=
 =?utf-8?B?TWdpOWZIZVZ2dGtJNlBzZmtXN2FMYVJOVnVzWGJXY2QvQTNyWUl6OWpjRWNq?=
 =?utf-8?B?WFJzbDM4WTVNMjc2Q1o0RkxCbXc5Rjc3MEFtRGNRWXBDR0RkaGRFcmNGOGhw?=
 =?utf-8?B?NzB5Sk9Ubyt3cHRZTHdpNXJEZk1qYkl5ckFWN3Ava2JPV1lRRXBBQjl1dWNW?=
 =?utf-8?B?bFFuWUQxTXN5VEJ5eFVKZ0JqOTFMb0xmZEtxYXpObjlJb1dSbEtKYnBPQ0FK?=
 =?utf-8?Q?Y1cixIpxw4mm9rYdTLbTGMrMR9YTbIidvzEUruE?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6376335-4ac1-4291-e2ab-08d8c9def2a4
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 14:04:26.4959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JJ6dAIQZ0J5nAfOr6xhxx7gyG9oOk76yN4wV3QuXe+mb0NHoRsxjcG/aRdQ6r8XiOemVnPzo/GbhepCSUI6HKIh1U+Sm9z5nGwBHJ3bNTMY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3352
Content-Type: multipart/alternative;
 boundary="------------53DB4C91E7002DE66471100E"
Content-Language: en-US

--------------53DB4C91E7002DE66471100E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-04 8:19 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 1.5.4:
>
> - Fixed bug in versioning model where a downgrade across a
>    revision with a dependency on another branch, yet an ancestor
>    is also dependent on that branch, would produce an erroneous
>    state in the alembic_version table, making upgrades impossible
>    without manually repairing the table.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-alembic_1.5.3.bb => python3-alembic_1.5.4.bb}      | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-alembic_1.5.3.bb => python3-alembic_1.5.4.bb} (78%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.5.3.bb b/meta-python/recipes-devtools/python/python3-alembic_1.5.4.bb
> similarity index 78%
> rename from meta-python/recipes-devtools/python/python3-alembic_1.5.3.bb
> rename to meta-python/recipes-devtools/python/python3-alembic_1.5.4.bb
> index c263300cd..9a0991d3c 100644
> --- a/meta-python/recipes-devtools/python/python3-alembic_1.5.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-alembic_1.5.4.bb
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c4ece55266dcdd02ce165b1ee0e490bb"
>
>   inherit pypi setuptools3
>
> -SRC_URI[sha256sum] = "04608b6904a6e6bd1af83e1a48f73f50ba214aeddef44b92d498df33818654a8"
> +SRC_URI[sha256sum] = "e871118b6174681f7e9a9ea67cfcae954c6d18e05b49c6b17f662d2530c76bf5"
>
>   PYPI_PACKAGE = "alembic"
>
> --
> 2.17.1
>
>
> 
>

--------------53DB4C91E7002DE66471100E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-04 8:19 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210204131940.22585-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 1.5.4:

- Fixed bug in versioning model where a downgrade across a
  revision with a dependency on another branch, yet an ancestor
  is also dependent on that branch, would produce an erroneous
  state in the alembic_version table, making upgrades impossible
  without manually repairing the table.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210204131940.22585-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-alembic_1.5.3.bb =&gt; python3-alembic_1.5.4.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.5.3.bb =&gt; python3-alembic_1.5.4.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.5.3.bb b/meta-python/recipes-devtools/python/python3-alembic_1.5.4.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-alembic_1.5.3.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.5.4.bb
index c263300cd..9a0991d3c 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.5.3.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.5.4.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=c4ece55266dcdd02ce165b1ee0e490bb">&quot;file://LICENSE;md5=c4ece55266dcdd02ce165b1ee0e490bb&quot;</a>

 inherit pypi setuptools3

-SRC_URI[sha256sum] = &quot;04608b6904a6e6bd1af83e1a48f73f50ba214aeddef44b92d498df33818654a8&quot;
+SRC_URI[sha256sum] = &quot;e871118b6174681f7e9a9ea67cfcae954c6d18e05b49c6b17f662d2530c76bf5&quot;

 PYPI_PACKAGE = &quot;alembic&quot;

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

--------------53DB4C91E7002DE66471100E--

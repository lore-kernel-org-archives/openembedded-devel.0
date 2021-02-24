Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.74])
 by mx.groups.io with SMTP id smtpd.web08.7831.1614177865968469766
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Feb 2021 06:44:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=o42z+VcU;
 spf=pass (domain: windriver.com, ip: 40.107.92.74, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i++lD4QZKHDZhvWc99Ggs9DyG70RFfVov+NnRbvkkdHTCCu7Fzek9/hK0l+KovAWVHARkgdR8nE5aXk2+ePAej7Mr/C4PGO9B6weBZEPzrz9GnPs72fHALJyK06Ikmb/4IDvBcOt1wHuiww7VvsL1CuFOGrXVlqI1FiOs/RPvOqL+NYu7WeJSvnYRGHNH/JRLmnj6WRBKyGvCybKNtLYb+qH/+OsCLEn80Jb4fIFmtoqGDZfBVj0F0UUUsRAwoejq1FHVoiVqskRpfy9M+5HdqKX5fhCP+2hIvxkpcL8f9BWCI9lN0Yw+6+0LIDYeIPkm78drvbOt3T5jRKcVjrDvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2e2M2hZK4EU3Dqyb/p+f/2cM544H7FFI9OU9GzNUtlY=;
 b=hTF9Efr+c/uXkPZdNjOMrQTw6E+AzYyXPEp73UZcP9ufum0HVDJ8uyN0aZXJSl97j0XwobHvmnjJSDRHfwdxqz8DfRqv4YHyw6lWtQo7gfK69c6vmo5I+oSrNlwpoUoLfLXZuZCdcohqccqBE5PBW9FeJDjATbhR7fH/wulnzS9g54eJgmqmq1P5+123tj0upSRHlDe1764AmyfNVeMEgifiNfrNlmHpgh4Y+vZNpcExH4WUsLkHY8qR2ZNOd7LlE072MByMCWF6kzrTSYSwAf+G0iotkeUc4A3Zj4axaaCz/CWXVKXdIYHyAjZ76TUkduaKd/RGKoBuY6AJCwHcbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2e2M2hZK4EU3Dqyb/p+f/2cM544H7FFI9OU9GzNUtlY=;
 b=o42z+VcUxzi1YCaHKdk26UfvWZJ7ZnCK5cgS88DNcy6QVrADrmdcM/favhEZQwQ/+TzKO5YhX1NLTf+kEaXWoR4OTy8KQrKoTKUvErl3td6hFSpCikrnd6MNxdUMq3Uy0KFRsDB5a+w6XwQRh/VupkX1MxyCBvMU849aH5ZK9rM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2630.namprd11.prod.outlook.com (2603:10b6:a02:c2::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.32; Wed, 24 Feb
 2021 14:44:24 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3868.032; Wed, 24 Feb 2021
 14:44:24 +0000
Subject: Re: [oe] [meta-python][PATCH 04/10] python3-typeguard: Upgrade 2.11.0 -> 2.11.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210223152219.32129-1-leon.anavi@konsulko.com>
 <20210223152219.32129-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <cd073a03-639e-3e3c-81ed-717f5a5f9526@windriver.com>
Date: Wed, 24 Feb 2021 09:44:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210223152219.32129-4-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL1PR13CA0275.namprd13.prod.outlook.com
 (2603:10b6:208:2bc::10) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL1PR13CA0275.namprd13.prod.outlook.com (2603:10b6:208:2bc::10) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.9 via Frontend Transport; Wed, 24 Feb 2021 14:44:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee5f4a72-5a0a-4ae4-26d0-08d8d8d2ad6b
X-MS-TrafficTypeDiagnostic: BYAPR11MB2630:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2630340BD1B37C6C7F3237249F9F9@BYAPR11MB2630.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:538;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PAQa9ItlUuWQd4XpoeX/So2b17l1iA1vYah3hpouXgincRQDubyGg7uCCdW4CsQ5ExRALXuvAxen+/KI5QJLcenteTVZSgR7ZFUbQfYZPOjBSuXR/VYjaLP6DrZMFA9WoPbNhht8qN/TqJwuQJWLVYYA6sFwF5j9Ut8ShMoOfaDiSa8e+KvF0FRKpv+Cn/4EkFxazGiTjvw8U6amFWgf5YarZHhCT9zhCRdw9O5T7mLBU7AV6bSrDKU7BdnzGe0oyVsYxGfdMQ9DtMyQdEXD7N03QnZYuJyarPMIYXJkdIVnb8NFT8uuah634MSpPlMwYaGwo5Lb+aCkroSPmp/UMClZJTGGrX6mJdxy7+faLef46wc4alHbphgAgOA6QA+epDZ/Q+2o0s/shBg/RtO58PqujH+1pZi7c5ElbAZPJshdJG/gXF0hnMcu6PMDngAPrndDFpbu/MObzvxyExoPO3dk2n+vxFuKED80R5LDRXR9N2jk+mzh1O7SmWsAH8FDaGiMs/M05W/URNl/Sa8nQGy5yXWHu9gNNuwDoi05t32/BqCY/+XDO4TY9Tg4Ws8oy1UyCM/CMqr71alii1trGffXduKiKUWU3cVO3FjA5OBAQlCxJ9ucgaUcfrnrutNYtLKBA4/cPD0xtBpH95WzLPZ/UnANHGSk6h3Ycc28AgMXB/lBedmehZuKwk30VKdI
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(39830400003)(366004)(376002)(66946007)(44832011)(66476007)(2906002)(966005)(16526019)(31696002)(66556008)(31686004)(5660300002)(53546011)(956004)(186003)(2616005)(26005)(36756003)(6486002)(33964004)(86362001)(166002)(8936002)(478600001)(8676002)(16576012)(316002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?R28wRmh5RDR6T0Y5eFlVdDF0WUhZcFZKcHlsNDhMeHhaQ2ovclRHYVVWREFx?=
 =?utf-8?B?OUllUEJTR3JVN0VqY0JPcjlpZkxzVkdIcnVIc1NEcW40UXFtMlRaL2tzemdW?=
 =?utf-8?B?MEVJRTVJU2gvOFl2NEgwcnN1YmVpbnhYdm0vdnhRQUswSXQrbGR4enZERWRB?=
 =?utf-8?B?Ly8zNEc2TTQyeEpMYkNpekZFaW5qZkJwL3Z5ZUZMVEhXUjdpMFd3YkpiMVNW?=
 =?utf-8?B?VmM3OFF1UzFLUDJVS3Q2TUxSdmRZWHJSNWtHUjJmcjgzVWt5M3hwMzhrOHMr?=
 =?utf-8?B?a0FndzBsTGFBRDFjbUNUcjJrS2l1OVZ6dk5hWEk4V3d4MVFsWDUrMUl2S2tm?=
 =?utf-8?B?Y2hZQ2M5VUtTYnRwMXNVdm9FUkpwakVsK1hRMGEyWlVyVHBvTHp2Sk9qYUg1?=
 =?utf-8?B?UHp1amE0SzNCcVR3bS84dmpZU1grYXhWMUU4UDJEeWdLZmpIQ3BKd21Bdm1h?=
 =?utf-8?B?TXZrSTEwcWowa2ppRXdKcThUbEIzZ1pVQld0TVUrbUFLVWlyVHZkeXd4U0sz?=
 =?utf-8?B?Z3NOcmtGQ2o3M1cwRlh4RzRia1Y5T00zc2NNbXg4MDJsY2FuVFhDbFpEa2NR?=
 =?utf-8?B?cnRmTkdLMWVQTXRpbjdEaUpDVXNmR1NQOGhzU21oY1VnU1p3UzYzbERnbFo5?=
 =?utf-8?B?VmxRVm1pRlY2N0d4UGNudHNCZUJrOU84SElCUGtqWUV0VkdscnZCaGxKSS9u?=
 =?utf-8?B?NTVNNmFSZTR0NDI2TTJDMUY1cHF4MkFWVGZHSzBFMmoxS25sc01YRFVrZStQ?=
 =?utf-8?B?cUY3KzlXdUdkT0ZDUy9kcElpaFRKZlhaS0pyVjBqOWYzVDFwUXQ2WlU1RXlK?=
 =?utf-8?B?YW9ZZWpFcTU2WGtRNGVlRWtiQkZ3enZGQU1tWFJyZzVRUmdlNnhGSjJNT3li?=
 =?utf-8?B?MGxKZUwybmlzdmRzdHBycXREWjJVdTRrVDFKQjVlQ24zeVZMcjFnUFB1RE1B?=
 =?utf-8?B?MStJMU9zaGlKa0VpbjZ0RkNGZWttaHlFVzE2YjQyTGFQVWY5VTNFUHkrY3pJ?=
 =?utf-8?B?VTZTZkNpMW5waDNYRmxKRG1KM0xjNm1HU3hsL2tNUTFRVXF0N0pPRFBwNDV3?=
 =?utf-8?B?VG1MdjBlKzcvYk12NGtpdkxNTzBwL1pyN3RJQVdOb0lyeDhNcGxOaldlald1?=
 =?utf-8?B?RU50dWFmK0xnL1JSQ1ozdTNsWlQ5NXRrSDducXltYkxzaGNJbmVxckhjSVl1?=
 =?utf-8?B?KzZRQmhJRG1STzIzdTkxZjk1VmdTc3JiZmt6eDgvakMydWFUNTBUMjNCUWhJ?=
 =?utf-8?B?VFZ1VnhMVWtwVUlqL3NaWktWOUR3ZWg4Q0hsRGpnS2t5QkRXakJHdG5NQndS?=
 =?utf-8?B?M0g0RVBwVVV6cjZpZzA0cjBxZmgycXpYTGlkbkFFdjhXdlRMb0hXK01Zc09V?=
 =?utf-8?B?eDRxWTZyd01VTUtRR2MrdjdKQ0ozc2IxUXBNMy9ENlRTVExOS0dFMnpERG85?=
 =?utf-8?B?c096WVN3TDZKejhET2JHQm9LS3FtRDBoWFNlRDExaFRwMEpXeGllOG1oSGs3?=
 =?utf-8?B?bktMTE9ybnJwRTNqVnVzemcwUXNSelZFMDUxSnB5V1NKK1J5ZTBRMTk2UU5Z?=
 =?utf-8?B?KzdINGI1MFI2TTVyUXJjVjAvMG5rOGt1S0FxaEFKS1hOZDE2RWpqclJkbFox?=
 =?utf-8?B?S3psN1U3WEZzVzhoa2FwTnBzMU4vZDFnWVE1T0hyRmhPK0VHR01mYjVJMTBH?=
 =?utf-8?B?Vnoxck9Td2huZmZpM2E3UEsvVWNneDRzOGVpbmd5cTdYeUdZVis4d2pialU1?=
 =?utf-8?Q?E78PYf4vdZOnXMDKvY5tr4DcOc0QJQF/3GEFYPY?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee5f4a72-5a0a-4ae4-26d0-08d8d8d2ad6b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 14:44:23.8956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rlEdai6a4NnGWQ6PGnXl36yyYmgqO94amL3owiF416nowR6xzJH1SDFPiwGt5Uq8MQ+KhKOeB7OpTES9KdL6fkVbi408XDKjcG8fOZcoFaw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2630
Content-Type: multipart/alternative;
 boundary="------------C0C6D9741E3E84BD519AA1A4"
Content-Language: en-US

--------------C0C6D9741E3E84BD519AA1A4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-23 10:22 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 2.11.1:
>
> - Fixed compatibility with Python 3.10
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...{python3-typeguard_2.11.0.bb => python3-typeguard_2.11.1.bb} | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-typeguard_2.11.0.bb => python3-typeguard_2.11.1.bb} (87%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-typeguard_2.11.0.bb b/meta-python/recipes-devtools/python/python3-typeguard_2.11.1.bb
> similarity index 87%
> rename from meta-python/recipes-devtools/python/python3-typeguard_2.11.0.bb
> rename to meta-python/recipes-devtools/python/python3-typeguard_2.11.1.bb
> index 3c9cac86bb..640adf83b7 100644
> --- a/meta-python/recipes-devtools/python/python3-typeguard_2.11.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-typeguard_2.11.1.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/typeguard/"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=f0e423eea5c91e7aa21bdb70184b3e53"
>
> -SRC_URI[sha256sum] = "cc3b9c3466823e70b47af7bc43e481ef59ad37112ae71c448f0d3fe773db7567"
> +SRC_URI[sha256sum] = "33243c1cbfcb9736a06c6db22dd08876b5f297e6344aa272a2862c0f8e669f64"
>
>   inherit pypi setuptools3 ptest
>
> --
> 2.17.1
>
>
> 
>

--------------C0C6D9741E3E84BD519AA1A4
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-23 10:22 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210223152219.32129-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 2.11.1:

- Fixed compatibility with Python 3.10

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210223152219.32129-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...{python3-typeguard_2.11.0.bb =&gt; python3-typeguard_2.11.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-typeguard_2.11.0.bb =&gt; python3-typeguard_2.11.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-typeguard_2.11.0.bb b/meta-python/recipes-devtools/python/python3-typeguard_2.11.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-typeguard_2.11.0.bb
rename to meta-python/recipes-devtools/python/python3-typeguard_2.11.1.bb
index 3c9cac86bb..640adf83b7 100644
--- a/meta-python/recipes-devtools/python/python3-typeguard_2.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-typeguard_2.11.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://pypi.org/project/typeguard/">&quot;https://pypi.org/project/typeguard/&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=f0e423eea5c91e7aa21bdb70184b3e53">&quot;file://LICENSE;md5=f0e423eea5c91e7aa21bdb70184b3e53&quot;</a>

-SRC_URI[sha256sum] = &quot;cc3b9c3466823e70b47af7bc43e481ef59ad37112ae71c448f0d3fe773db7567&quot;
+SRC_URI[sha256sum] = &quot;33243c1cbfcb9736a06c6db22dd08876b5f297e6344aa272a2862c0f8e669f64&quot;

 inherit pypi setuptools3 ptest

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

--------------C0C6D9741E3E84BD519AA1A4--

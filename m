Received: from NAM04-DM6-obe.outbound.protection.outlook.com (NAM04-DM6-obe.outbound.protection.outlook.com [40.107.102.80])
 by mx.groups.io with SMTP id smtpd.web11.33846.1612185831858791012
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Feb 2021 05:23:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=IGm4os60;
 spf=pass (domain: windriver.com, ip: 40.107.102.80, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UYE0jFikusIxTinFRHr9cD1T2H37dg4O0vJnJZ4e+p3J1gHpLsKAawdqchkE3giEmd3Q4dIb/kWfNYr5GWJLrQzeU3zMMfT2Zrt6Wsgt0HBWEI+1ZGkKgHccSgGtNrYwZUn6o4JNq64+88ZHITtuzF1RJCr4ODscOxp+JIvQqYtsqeIt3h0uXpAjUhpe0yuFKGrb9Wnmu85WLo6DWRVaNqfgCnrqNH0V8SfRMG7McAFdNr7l/RoLbSCYI9/QuuKS0VP5xE4dH8jdeBJa051YP/CR5OJD5g24v/eauSTQFruFplgX6xg3wByndKhPgiUrwaoMVaK59fWBZ8dBHVzNeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6n5yf/iplMQXgZvQYvIte+d5dd3V6VBoevC+5N0L8gs=;
 b=B5dX0h6BzgJcwwIYteSN+g2nUqMj+h3Thd5DKNjr/LOX9fdJ/JySUNy8Y4cp4JFTcLiGL6f8aDg3DF0XEBnRCc9Al0vGxEVvCd1IT8SNewd1uspchs5G7G5CmEfHwAi1gI+OWBaq7VyLPzzR4bxjdhCMvylB6ss9OUqvSbh6YUd2xqkV7Vm+VlS0shIkluki/cQcnrvnPBSSmsHYC0PcDz7OT0a4os56KRO0tV2aChObNvj5jXYqBcbDi+AoFnFyXmqfu+gYHmNWJxdoEepRHd4OKj5HOiFR4gt6DQJ38KA72jTziULDcWB7LZhVpa6d6H68jUkQknuETOWHPNuS3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6n5yf/iplMQXgZvQYvIte+d5dd3V6VBoevC+5N0L8gs=;
 b=IGm4os60WHAs6+LCVJW25DrwnSmrTL4fGNU3rq+1MKLgz3u1LBqQ5TcsS/OZdLMLyIEzpEBOI00MwbUVDJfWMOO7K07pMB5a58Sn2xvyP/0LjhmR9L4Wcw0GDvLSS+f62JJvVcoDPc/SqxjZyONt2bjdC+ma5EZXHBfQFba29Vg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB5165.namprd11.prod.outlook.com (2603:10b6:a03:2ad::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Mon, 1 Feb
 2021 13:23:50 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3805.024; Mon, 1 Feb 2021
 13:23:50 +0000
Subject: Re: [oe] [meta-python][PATCH 3/5] python3-urllib3: Upgrade 1.26.2 -> 1.26.3
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210128102903.11760-1-leon.anavi@konsulko.com>
 <20210128102903.11760-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <ac7262e2-d766-aab1-0b15-5e555f8903d8@windriver.com>
Date: Mon, 1 Feb 2021 08:23:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210128102903.11760-3-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN0PR04CA0024.namprd04.prod.outlook.com
 (2603:10b6:408:ee::29) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN0PR04CA0024.namprd04.prod.outlook.com (2603:10b6:408:ee::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17 via Frontend Transport; Mon, 1 Feb 2021 13:23:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e5689e4c-01e2-4b76-8f0d-08d8c6b49cf3
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5165:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB5165D3C07656FD74CA660EB09FB69@SJ0PR11MB5165.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8urmoxDkF2F4cQakxfi/Ootjam4sXI2mmyQ6XLjrY8m8gQSpRW+1cQ/oedfO8vtBLXs0LSyQulqoMLFEcpZysQ6SXK+UOjM1qV4nJW+4Ja4e3TlI80u9cgC4m5CiNVlOZbiGuDdPJxzJ9uCv+IutN8QOBqIAnI9eA06z2PLPcBk3R7l+GzCLy3zA5FV6k+96cB+wPii1ffi5UhUyZgOQMhYWBMR4UuPf/S3+PxvMdDALrzpu1gcAmSYiAqevnp+Ww5B8Uj04uNoQoX1Ub5ApJhbJMReWXrrU8DxxYhwGDZhotqoyWaNN0Ng+Sp7etRXxjHdPKD4yPtMXDlJuhZH4x2boFeAszsG1cF2uRLM18IB2+YqZfi2A3AbAE37hHuLvd1ORRzj75KdyvUXX8bOEXG/pN4l8C5PNzdzdOz9i8Ogtw+ADlTS2fxFsLsUBl9x38xCcJK9Frk4H2Y46yhdZvbYgn5Lv3LkbOKAqUnwC8VhiUQI2FSpy4Kz5DiX4xk+8sMbgM7D+NfpYj9mJ56tj+ljfVUMhzZGCr8QTk9tNqHhFzyfNtIdPOshoHLtUUXXWCNBUJ4PUwvo+vT1bvZHFAUfeEjbs8eWDC1v1QUBXrX9e5j+5J6mmphFqa75EL8p6avdlU5gPJHQdUnCQaF6UsJu0p58RK8uvYPa6z3ZVPaBbE3WfTXMKJbdyJ/zZJbsn
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(396003)(136003)(39850400004)(376002)(5660300002)(66476007)(33964004)(66946007)(16526019)(2616005)(2906002)(36756003)(186003)(66556008)(86362001)(52116002)(31686004)(6486002)(8676002)(966005)(956004)(53546011)(44832011)(83380400001)(26005)(478600001)(316002)(16576012)(8936002)(31696002)(166002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?RlBJSkQzcmJLRCtsejB4Wit5SmZBc1N0aUdGcWRpbmdEWTJmUlVWOE93cTND?=
 =?utf-8?B?Zm51L1BBOWIrTzFoOXNiQ1ZxdERSRXRlSk8waTdvdVJ1S1c0VVlLK2NDNys4?=
 =?utf-8?B?dTlCRy9JdTAxa0cyNkZqSTllbFdBamxQRk44bStKRmtFUTlzRE01eGlULzVK?=
 =?utf-8?B?UCszSTdlNnVJTkxFMlhLdXJTQmlocldwd2w1dHZjbnFNZVJwcXZ4UVoxSjQ2?=
 =?utf-8?B?eHJmZjhqMnlQKzFXVitxNEdzZzRDSWtsNTdZM1NTZkNsM2dFV25JZGNHU0xW?=
 =?utf-8?B?eCsyZ092Uk5pMzVyeGY0VktzdjZBeGFkSDZENnB5NWZ6cGVUY0lpWVRTOTBC?=
 =?utf-8?B?TDQ1bFI2dnpxQmRBQlZ0UnRHZXNUa3JNdk5OQ3BSZWFTM0VFS050TEpyWUNF?=
 =?utf-8?B?M2VjTkFTZ0I2QTY4RFc2NFFKV1dpRklpVlZJRlN0UjN0S0JFeUFiTytNZkU2?=
 =?utf-8?B?bjVQOURVcTJETzZDVDlVbk14d2k4T1VpU1huZTVNaWZ6eHA2d0VMYy9BVk40?=
 =?utf-8?B?cmRieGdPL0RodVhqQUlGZCs5ZjBJUlM0MzFnUmM4cXQvWG1ScWtHVldFdlRn?=
 =?utf-8?B?eE1JMHlPaDlYQlFZM2FoT2g1UWh0djhOem9RaStzamRNbVR4RWVqSjlWaGhQ?=
 =?utf-8?B?cFlyYS9FMFNvSzl0b004akp1dmtJNWdSbG1SNTNkS2lLMEJFOVhwNXdxbzNi?=
 =?utf-8?B?QUFGdktpWFFHRmxKWmlRODcxZ2ZpUHN6b3AvemxxVXdraU9FK3pZZjBGMFAv?=
 =?utf-8?B?Tm5Xb2h2d0xrY0JaRFVwMTVhZXVCZEpnMmVVV2VRSU1ScHpZbkpOWit5c0Ju?=
 =?utf-8?B?U1FRNjFFQy9oWmJMVEVha1B6bzU5eTN6VkFrVU1vNXZqWUVQUGFsYnpabXFU?=
 =?utf-8?B?REtjNDJZeVlFVU4wam5iV29NUGlwV3h3ZGpCamlLTzcxenpMWUZoSlFndUQv?=
 =?utf-8?B?M1gwSmRmMm5MRUd1ekpGVG5kdjdtWXYydmU5M2ZsTTVlU09lUzM5Nkd0Vm1n?=
 =?utf-8?B?MWdLZjNRSE4yTHRVMTNNQW5xYmZTcEU5M0YxN054RHkrdVpNcWMyUWFOaXFK?=
 =?utf-8?B?aUZ1U1Zmci9NMUErb2tKUUU5SkVWK3pUc1RhRktUNkJFdXZUUTF5V1poRDRF?=
 =?utf-8?B?V0pNTm9ZZmpneTRsbG1CbHp0UHZBa1FtaGdyTnJWZ2Z2aXNyMDVtTk5tOHpQ?=
 =?utf-8?B?Q1czOFJYTVpWaHQ5Y3RlYmJhWWgzRWZPc21ZVWNnY1BkOFo1cVBtM0pqNmNZ?=
 =?utf-8?B?UGdqU2IyNE44ZEhlTWE0NFdNNVc3eGxMSENrUCs3QkRYQ2tNaE4rQ2ZKaDVJ?=
 =?utf-8?B?bW9xaFoxbGdMZWh6OUNNeUprWlB6OHp5R3BtZUoyU0czcTgrYXNzVXR1V0dP?=
 =?utf-8?B?TzdhNE9KZElHN3MrelhBVTc5SW56QmlwZnNxWVVpVzV6UU1TS2xCZzdoMURk?=
 =?utf-8?B?ZG9jWWlrcHk4dWVsZlZHLzQ1UXRWa05FQXdKQkt3PT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5689e4c-01e2-4b76-8f0d-08d8c6b49cf3
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2021 13:23:50.7872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VMuHY0U/UsJAwmqBtuGTEiPgRa331nrhFO1MrPe4yhWcoHXCpSL/yfyn9SiOVT6AcagRkjXt+EKD83c1okj96af1WK+b1JymoXXsG15/BG8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5165
Content-Type: multipart/alternative;
 boundary="------------DD85851F4AC71F3BD3121214"
Content-Language: en-US

--------------DD85851F4AC71F3BD3121214
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-28 5:29 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 1.26.3:
>
> - Fixed bytes and string comparison issue with headers
> - Changed ProxySchemeUnknown error message to be more actionable
>    if the user supplies a proxy URL without a scheme
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-urllib3_1.26.2.bb => python3-urllib3_1.26.3.bb}    | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-urllib3_1.26.2.bb => python3-urllib3_1.26.3.bb} (86%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-urllib3_1.26.2.bb b/meta-python/recipes-devtools/python/python3-urllib3_1.26.3.bb
> similarity index 86%
> rename from meta-python/recipes-devtools/python/python3-urllib3_1.26.2.bb
> rename to meta-python/recipes-devtools/python/python3-urllib3_1.26.3.bb
> index fcd670901..739cf24f5 100644
> --- a/meta-python/recipes-devtools/python/python3-urllib3_1.26.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-urllib3_1.26.3.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c2823cb995439c984fd62a973d79815c"
>
> -SRC_URI[sha256sum] = "19188f96923873c92ccb987120ec4acaa12f0461fa9ce5d3d0772bc965a39e08"
> +SRC_URI[sha256sum] = "de3eedaad74a2683334e282005cd8d7f22f4d55fa690a2a1020a416cb0a47e73"
>
>   inherit pypi setuptools3
>
> --
> 2.17.1
>
>
> 
>

--------------DD85851F4AC71F3BD3121214
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-28 5:29 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210128102903.11760-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 1.26.3:

- Fixed bytes and string comparison issue with headers
- Changed ProxySchemeUnknown error message to be more actionable
  if the user supplies a proxy URL without a scheme

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210128102903.11760-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-urllib3_1.26.2.bb =&gt; python3-urllib3_1.26.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-urllib3_1.26.2.bb =&gt; python3-urllib3_1.26.3.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-urllib3_1.26.2.bb b/meta-python/recipes-devtools/python/python3-urllib3_1.26.3.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-urllib3_1.26.2.bb
rename to meta-python/recipes-devtools/python/python3-urllib3_1.26.3.bb
index fcd670901..739cf24f5 100644
--- a/meta-python/recipes-devtools/python/python3-urllib3_1.26.2.bb
+++ b/meta-python/recipes-devtools/python/python3-urllib3_1.26.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/shazow/urllib3">&quot;https://github.com/shazow/urllib3&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=c2823cb995439c984fd62a973d79815c">&quot;file://LICENSE.txt;md5=c2823cb995439c984fd62a973d79815c&quot;</a>

-SRC_URI[sha256sum] = &quot;19188f96923873c92ccb987120ec4acaa12f0461fa9ce5d3d0772bc965a39e08&quot;
+SRC_URI[sha256sum] = &quot;de3eedaad74a2683334e282005cd8d7f22f4d55fa690a2a1020a416cb0a47e73&quot;

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

--------------DD85851F4AC71F3BD3121214--

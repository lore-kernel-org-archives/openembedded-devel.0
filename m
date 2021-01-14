Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.83])
 by mx.groups.io with SMTP id smtpd.web12.248.1610649886414898479
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Jan 2021 10:44:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=CiR+5Mho;
 spf=pass (domain: windriver.com, ip: 40.107.244.83, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cuCF35UEf7UsFmvJF6zBtKYqNST5WlfCDuYd8ysYrJrspChpaSpOTD34XPqIZ+4K9eddhMJq2EjvM3wlh3FTZNyG/thACzKFWkxq78imhyRREglV06p1B2A2O19KEYksZtNfkmVUsv+njz3icjvTMzQkHgWhC5vAZTYFSOjyJb9+DEMqrnTSTiIA/HZ/FlmLPjKoUP+OR1wm7z0P9EOsSxGS9wcXNL1CtouZv7gsOAxXI47YkMtE7/R5GOCJ+R5R7BMiV/aQUijUONGz4M/9ylI9WoeugeGW532BuvjYV5Bzo6frP+ew/HzV+CVIkP6VSMDv+GYGrUzy1DPfY+f8gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eGipM04bqsRHZryYAZXgvn0Miz0MVTjosqdvLhbmJjQ=;
 b=f10mLI3yFjfzfurbgmmDPnQX+8Sa3B0s9k3o3tjDAtkpoUoFxeViFTjJT6wFycKbyaQW4uODkFDphD24g+vsMxIp+12Nz5aWfpbCVBD49UfCtW6D9qMKzfZTn+HQXgACx/HaK8rICKNcoogAk5IBqWI8mSkaBC5Lz03Z0JBYcWH9qQYzrjKQNJ/kSuNJx92qeRMLPQpTeZCbuBJpn0iPCmemXJ8+EHvXiS9RsVdFbI6NH1x7RnGqvps571SrFpqvskQiAnbbZ5lrcx4q5sNr1rXzN4x4ALC4Auz06G0b1pdqcv5kQTI73R2LbhhoQNcyYFNU1rQF13gtFDJtvIJ6Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eGipM04bqsRHZryYAZXgvn0Miz0MVTjosqdvLhbmJjQ=;
 b=CiR+5Mho4rsJb5uHVWljBdiKR79g5cvsv1eAPIkf8ThpSvgIN17QQF1vOq7mszgr71Lnj4XCGJi1oPRGT8o79OnI7zi6XeGO1fz8xQfx5nx4+EX2GEhM9rbp3j4X5Rebn5N/HZHYECcYBbEnvWrjCmcGkNjz9fgraDQ+GVeHzwk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4800.namprd11.prod.outlook.com (2603:10b6:a03:2af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Thu, 14 Jan
 2021 18:44:45 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6%7]) with mapi id 15.20.3742.012; Thu, 14 Jan 2021
 18:44:45 +0000
Subject: Re: [oe] [meta-python][PATCH 06/10] python3-regex: Upgrade 2020.10.28 -> 2020.11.13
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210113142626.27599-1-leon.anavi@konsulko.com>
 <20210113142626.27599-6-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <5bec88fe-6110-b9ae-02c8-4a63b6005500@windriver.com>
Date: Thu, 14 Jan 2021 13:44:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20210113142626.27599-6-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL1PR13CA0129.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::14) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL1PR13CA0129.namprd13.prod.outlook.com (2603:10b6:208:2bb::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.4 via Frontend Transport; Thu, 14 Jan 2021 18:44:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e607bce7-738c-4fbb-a967-08d8b8bc769e
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4800:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB48007E20DA7DBAE9A2AE46349FA80@SJ0PR11MB4800.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eXwO84fMYG2dD1N4VCEO6lz9Ap42cZZRkMETHk3ztp/lG2DmQb+Eyb8BryceRoM6+AKj0Ni4yukw9vsxGuD5SLA59b/c7CCRm7RF5SoqLmsDT7dKopSFvFuNPmQ7PbkvATnJ8v6RxMyy83cdNbbks9cq68AWOOzig8Oz0yuIjBINGMUFmupaL6V/3TgNFZQ5oSuY/EcRomMSpQX0cAYjcEu4Ca518/iaXEVH94H6UTKbF+bfv0wG/QoYni+NQkQZAZ0WfqPEya9zPagF6gO7owSLDB8LsvprtWeYrpDv/r1KFLiZwjFjz7NJD7luB3JOiKV2MO6h+Jxnr2Y2KmYLo7z4exo1fIoqvhzBOgib5ro8OTQlzVr5g3mpJxGMn5rMa93n8cS7r+9xcIHZH3PNJoMIEIccyFX7ztdzCTZrpogCt+U80xOoVxNDZSQKKKBsZr/kIFBywWcjkGvAOseXLUUwooLr8BkvXTkQdS4Ex8WyNnfIl1/cvvN3N+9P10ikiRSxDVf6Vj5gDeeW051Svd3eAcIzDpmqzAYTDSHh262NhgQf7UzcfnEjwN8TcQrV
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(396003)(136003)(376002)(346002)(86362001)(478600001)(83380400001)(66946007)(2906002)(31696002)(31686004)(166002)(16576012)(316002)(966005)(8936002)(5660300002)(186003)(16526019)(53546011)(6486002)(52116002)(8676002)(66476007)(36756003)(33964004)(26005)(2616005)(956004)(44832011)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?SGQ4em1CdjJJQUlmUFBONXY2TFZBcVJFak5oZWg4MUNQL2N4M0h4UGNhMzEr?=
 =?utf-8?B?bW95Rm1MNHM2UFlaRFVWVU9yNEdoS2QyYkVwdkVZRjVjdFJLYmltQnZGSDhJ?=
 =?utf-8?B?cVg3MndXSnNZcVk0UWlxZGlhV3RWSnBsV1dVT1oxSkdRUisvZlRtS2NxV2dV?=
 =?utf-8?B?NG9uc0FLaXRtdkh2bENScWRLN2EyVENQYlUyU2JtY1lNeWtLWGtheVVuejFQ?=
 =?utf-8?B?T0hwQ1Y0T1VOdDJUSkN6Mm1hd3R5WDlrNFV0MWJDNHA2dEVzZHg0NWptT2Fj?=
 =?utf-8?B?bmhwblVRNlkxSUdYOHp4ZW16VUt3NmtRU0xVVXc4NVRmSmF6UlUvRzFMenRU?=
 =?utf-8?B?eXRWeU53Y1VvamxzZXphaDJKL3FxbHJ1QWlUS0pjVFF1V3NlWFBLdEMxbUlF?=
 =?utf-8?B?U1ZUMGVjSEJYWGpQU2hXb2dwTWdGWHBQWExtdjc3RTVLY250VVEyaHY4c3hq?=
 =?utf-8?B?VWw0MzJib0l1cnk1ZlJIOVkxUG5ObDFJNFFiK0lIS2JhaGJwbmxGM0kreHRu?=
 =?utf-8?B?a2lhWjB3R1VTWXJtN1JUQTNYTHVMZmxFUTJJWGk5ZXFZQnBWc052dHpHWG16?=
 =?utf-8?B?Y3B6YThRWlFDbmtnbnB2cWxiUzh2dm1wdW15RHhNR0IydWFXS2lyNHQ4L3Rp?=
 =?utf-8?B?M2pOblA5UWZnR1I3andNKzlDQWF2eENRVnBZU2oxMHhoUzFzRm95TnpWMjJI?=
 =?utf-8?B?bnJ5N0FHV3FKZ21nejQ2WHhBaUVqUldqNkdPaU94c056YmVkODRpVXhoOVdZ?=
 =?utf-8?B?cWNvVVgvQkJDcWJsSVd1ajJiTjhTV0IzL1F5SmQ2amdhajdRSmhEbXdxOWhw?=
 =?utf-8?B?NE9kemFhQjFwbFVYY0xTeEQ2TzFMa2ZvaDIxU1J5aWd2NndFdVcydXZobkc0?=
 =?utf-8?B?TE5TZnc2clRXUmhTSGVxYzFBbEpZaHo4clE1aTAwdERmZk1LRzZCdGlNa3hT?=
 =?utf-8?B?WW5mbEtEOFJYU2N6N2RHdVgzMm5SdmxaUjhWaEF1bmNLbTJma3NPVlR3cTlL?=
 =?utf-8?B?Qy9IK0dFQkVnbDFrbEhmaDlVMHJhRTJSSCt5bG9uMThIcDBFUUxRaUxKMTVZ?=
 =?utf-8?B?WkMzNGFvd0YrdERWZFp6eE5rRm1aL1NKeW9OcURRbFVrZjBwM2FKQStxS0hn?=
 =?utf-8?B?QmNJaUtOT0tGcEgyNmFUVmhxNWQ4OFUxNHNKMEx4UlErSWxKbmRwb0t2Rkly?=
 =?utf-8?B?dnFId0YxZGRrbFQ1RHFTcDFIYzhRU2R0aG9xYmtkOVBQSmNvZE00YWVxUldt?=
 =?utf-8?B?Vk1BTFFST1YxajFFY2MyeHpjNHJtNTJWa1hKdUptTnZFTkVXTU0zTXRiK0NT?=
 =?utf-8?Q?S76sCaH/R/9Y+0h0Onumk3tc5LDTELFGv+?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 18:44:45.5307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: e607bce7-738c-4fbb-a967-08d8b8bc769e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1tRFyD6gQOl0ELD0AIAWOG7dT5aUzsS4Bepb8AAXPQDLERIf0LK76r2pAI1Dkrd77Pw3dZ3mwwrZQcO81+2q0hpmXHY1Ync4OId7jWaovho=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4800
Content-Type: multipart/alternative;
 boundary="------------CBBAAAC33E034DFBBBD7DDC0"
Content-Language: en-US

--------------CBBAAAC33E034DFBBBD7DDC0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-13 9:26 a.m., Leon Anavi wrote:
> - clock() calls for timeout cause slowdown in Docker
> - Unexpected behaviour in fuzzy matching with limited character
>    set with IGNORECASE flag
> - Added password arguments to twine upload in .travis.yml
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...python3-regex_2020.10.28.bb => python3-regex_2020.11.13.bb} | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-regex_2020.10.28.bb => python3-regex_2020.11.13.bb} (68%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-regex_2020.10.28.bb b/meta-python/recipes-devtools/python/python3-regex_2020.11.13.bb
> similarity index 68%
> rename from meta-python/recipes-devtools/python/python3-regex_2020.10.28.bb
> rename to meta-python/recipes-devtools/python/python3-regex_2020.11.13.bb
> index c3cddd8f1..b5f714397 100644
> --- a/meta-python/recipes-devtools/python/python3-regex_2020.10.28.bb
> +++ b/meta-python/recipes-devtools/python/python3-regex_2020.11.13.bb
> @@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=f0a3e4a2554ebb89c0
>   
>   inherit pypi setuptools3
>   
> -SRC_URI[md5sum] = "8150da7f676e73751b4e3c7b1ba79a34"
> -SRC_URI[sha256sum] = "dd3e6547ecf842a29cf25123fbf8d2461c53c8d37aa20d87ecee130c89b7079b"
> +SRC_URI[sha256sum] = "83d6b356e116ca119db8e7c6fc2983289d87b27b3fac238cfe5dca529d884562"
>   
>   BBCLASSEXTEND = "native nativesdk"
>
> 
>

--------------CBBAAAC33E034DFBBBD7DDC0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-13 9:26 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210113142626.27599-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- clock() calls for timeout cause slowdown in Docker
- Unexpected behaviour in fuzzy matching with limited character
  set with IGNORECASE flag
- Added password arguments to twine upload in .travis.yml

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210113142626.27599-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...python3-regex_2020.10.28.bb =&gt; python3-regex_2020.11.13.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-regex_2020.10.28.bb =&gt; python3-regex_2020.11.13.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-regex_2020.10.28.bb b/meta-python/recipes-devtools/python/python3-regex_2020.11.13.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-regex_2020.10.28.bb
rename to meta-python/recipes-devtools/python/python3-regex_2020.11.13.bb
index c3cddd8f1..b5f714397 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2020.10.28.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2020.11.13.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=8;endline=8;md5=f0a3e4a2554ebb89c0inheritpypisetuptools3-SRC_URI[md5sum]=">&quot;file://PKG-INFO;beginline=8;endline=8;md5=f0a3e4a2554ebb89c0
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = &quot;</a>8150da7f676e73751b4e3c7b1ba79a34&quot;
-SRC_URI[sha256sum] = &quot;dd3e6547ecf842a29cf25123fbf8d2461c53c8d37aa20d87ecee130c89b7079b&quot;
+SRC_URI[sha256sum] = &quot;83d6b356e116ca119db8e7c6fc2983289d87b27b3fac238cfe5dca529d884562&quot;
 
 BBCLASSEXTEND = &quot;native nativesdk&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------CBBAAAC33E034DFBBBD7DDC0--

Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.73])
 by mx.groups.io with SMTP id smtpd.web10.8834.1611760147630456574
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jan 2021 07:09:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=kGY/OT4Y;
 spf=pass (domain: windriver.com, ip: 40.107.243.73, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SwW9x07s4T9+SIsbyFT+iW/QbZvjn6paSKDUSIc9IHwInUyamhvNfhcnM07BeKWT0eic5qGjbgQknny9UJAdZDPLvS0H2U6uFguR/f4JUajludPdK1x2NyBfzpOfAg2Z97shcEnohZ+w/LJkU+TLrnkUrr3nQuhQTHX9VnnDx64PQJjVzdqh7wvWDBMrXy4Rr1G/H0XXz134ghXvTEnIewHmJjz8Fxhhtlu/nAUKtrd3sF1cIwUScGy/m55liBUVvm4m9tUZN0agGoAfrVaZz1+GYWUwhg1aDUbmwx9lyUlpNmB+1a7ew/sVLGcsaHNG2G2hMeAa+YV1XU7V3uHWKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XvZ9At0E9zvfwR8xk+xBOEbSoVzShpHSJMCJhylP4G4=;
 b=lYWj6ueaMM+7RpX4/ajv81CyG1oK/gYaBKPwvpVej3N0a9CFORGiZeIRKZPpjMm9ce3EFIJ/zJbwJud31PHGlnWw3kSxJWqKuXJUnMQC/DPZ4tct/ki3SzEax8FuUq8wQ2Vfm2/vYT/mUUSFjMyvGew994AXsxHln2+HNQahKnKC85e7Z0wEVCrOjhfqXtAKOjDk86yzgG8BPcirt/c721byqFG6TuNtvwuP6GlIU20fBjVQUv9mgykSS1YJWZRiuzl7aJIBH+5c0NOhdIrIJCno5OPBDftupXNmMwLIfOqLaIb6cgal9k3b9EeEpEKPAbY9YxW6mJu0y657/H5uMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XvZ9At0E9zvfwR8xk+xBOEbSoVzShpHSJMCJhylP4G4=;
 b=kGY/OT4Y8zAr1ho+EleWzorNMdnw7urj4aU1KzDxNzEdxbvGFd9ATcZn+BmtAdqdi3zBukOL5Q8kheVpFi1rBTYFfxmpbjWgUmhPIt/bJ1HVXfbgYKN/7WQ++ATjTQQi1E/anmcQ7JknGOmFkuOjX4QkQc6TuRZMpE2dS3F2dMM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3478.namprd11.prod.outlook.com (2603:10b6:a03:7b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Wed, 27 Jan
 2021 15:09:06 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3805.017; Wed, 27 Jan 2021
 15:09:06 +0000
Subject: Re: [oe] [meta-python][PATCH 2/2] python3-pyyaml: Upgrade 5.4 -> 5.4.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210125093035.6177-1-leon.anavi@konsulko.com>
 <20210125093035.6177-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <2f63aba4-cf5a-a2b3-c880-ce1a8fd87e20@windriver.com>
Date: Wed, 27 Jan 2021 10:09:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210125093035.6177-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL0PR02CA0126.namprd02.prod.outlook.com
 (2603:10b6:208:35::31) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL0PR02CA0126.namprd02.prod.outlook.com (2603:10b6:208:35::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17 via Frontend Transport; Wed, 27 Jan 2021 15:09:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 23908ddb-7ef4-49db-8beb-08d8c2d57d7a
X-MS-TrafficTypeDiagnostic: BYAPR11MB3478:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB34787E28E2BB25FBE72C340D9FBB9@BYAPR11MB3478.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:612;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/9Z8oZZEbq6Vby88T99jNu51nmTDjIdELN2KL1CZPVxFSxNJmrsS21C1tc1uO7pgCp5vEOVN41g0J3rqjeLzwk+SRsY5vwq3w3p9vdTIaDUFAHPcQL8RVkDtNQmxAwRrA3GY+L9AN2c3rzii6e+r1MpIM0DyEHr+iLPtvW5O57AzyzDpY/tk8oRs9VmTRgUNK4fGr7LDMkrfwC5C5CWxhAh64zHWfEHJ3RIwXIeJMjUZBlYW5Cw7yw7JgEcS5uOiDO4uhMiHoMPFRxL817R+z2Tod5A8jKMXl2E0XFYKlqJswQmU0EaNMtbFAy3bZy6qpylZr5iQypgVR7NwjfwhfTOluS5ukIz3L4rcZ+97SYipmtrKp/7Iwc/pcy4l3Ozh3XRua5PiN9635pFe378nY19dFZlkVeARdCueB7TyCggSCV13443ooIIF+HT6zYU+NoLFGoYHh01F/xVzE5ygTOSHNGeSTnIvS4lwWABf3pvpWCpIk3Q89GtumaxAEie3WdspXd95pJr0ISyfRlu8tu1bMuluZckdY+R8y0/+csUDDWjHykk1xJTtkm9cu42HlZFrWOTGyzJgamviQFKb2uBcb6IJBfZXYaSzQzlWgVUBwNCnrvpM34aqaO21tmqzvhMkhOfYngJiBmpza+tQuov7qs7XIie/RgZhpou5GMvkytNyoflzrsb7AUuLZKJm
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(346002)(136003)(376002)(396003)(5660300002)(31686004)(6486002)(2906002)(8676002)(66476007)(33964004)(2616005)(966005)(36756003)(166002)(86362001)(8936002)(66946007)(478600001)(83380400001)(66556008)(316002)(16576012)(31696002)(26005)(186003)(956004)(16526019)(44832011)(53546011)(52116002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?S2ZyekY4eFJQWHpna0wvUlNuSEpGRC9lc0tZaC9EZWh5RXRPYURYVk5zb09X?=
 =?utf-8?B?NlhvVVQzUW1vTHUzRE1PMmw1NnJIaXdPQ2VNRW91d1EvUDRiOVNSV0lqekJQ?=
 =?utf-8?B?MU9oNEhzTVhCM09HaW5PVUx1NVUwc0V3VzUwbHhJaTlwOFdVNysyRktpalpu?=
 =?utf-8?B?TThCMkJsM095NitveWVFckJaYkJ5SExBUFZwUHFJTzM2SlhZTTZvNnMxbEIw?=
 =?utf-8?B?cE1ML0dMem1QY2JBVFhCbDFWb1JObDRkdnp3WXZSaXZ0dCtoU3hMSHpjQnhy?=
 =?utf-8?B?NnRTeGQreEs0dVg0Z0dFL3VyS1U2ZnliSGdQTGErcU0rUnpUeC9rMTN6OGJk?=
 =?utf-8?B?UFc2VTJ1NWpVd3dlcFMyVFkreGhzNlo3bzJzSnFrT0tDTlVjT0FkSksyKzE2?=
 =?utf-8?B?SlJmbjViRWVYSVlvdTZ0UUZueXlaNHJIcVhmQU5VbzdpemFLbHRVdXlKeHNM?=
 =?utf-8?B?ayt3T2cyb0xNQkpNRGVkV1ZseGx2L0RrcmpVUm1mOEs1QS93QTFkRGdKeEpE?=
 =?utf-8?B?VmJlOXl1MlpvUm03YVBzcnpYSTNIc0hrWVluc0szcmIwSmdRd3B5ODFnVFNZ?=
 =?utf-8?B?MDhXQjU0Q2ZnU2hWVUVCSDFiTWtLMXRKTTZRdTl6TEtMQ0pJVnV5TGc1KzJw?=
 =?utf-8?B?clFHK2JFVmRuQmFibFp4aVlESVdqRlo0Q09TOE0wclNXUzhxd01jRFZBeXdo?=
 =?utf-8?B?c0c3RWxhTy9pZU1vem5YejVINFBaa05laFBxcDgrMStsUytiS2VEM2Z4aUh6?=
 =?utf-8?B?NlM3LzdScDcySkR3azh5UkVldXdKZm1GYzU1djU2cG9xYm1CbXB0QkxjT3lN?=
 =?utf-8?B?UnlkbVkrcjJFUkVvOUxNc05BdXlHVUJpZ2VvbUwvQmJUdjZZcW9WR1loUjBQ?=
 =?utf-8?B?cFNZVnNRajliV1RYaUJJRzMvWHgzbzY0eGlhSDU4cWNYWldkREtTaEVuZTVU?=
 =?utf-8?B?enc1TXJ1djk4eG5rU3lPSDZPUHZrRTlKdzNMTC9KQXVueW1hZDBlS0hUYUtV?=
 =?utf-8?B?WFVVTW1kUlVKKzM1OVNzdiswbDM4aWZ3WnhYMEx6T29PUkFqdjhxWnYwSWRt?=
 =?utf-8?B?R2RaU3RvT0FhMTYreTQzYXZYQkdTaUtVb1JqRDZDVWhNZzY1UGlKVjJrQldX?=
 =?utf-8?B?aU5yNENsclZYWTVkODQ3VGNzNlF1bnFIMW1zUHF5Z0wwZkpvYlJwOVJhOUVi?=
 =?utf-8?B?a29hL2cxM21UbUwwVEhkam1jOWdJQjhJdkk5YWlUNzhadFc5QzFkenFpaytL?=
 =?utf-8?B?T21jMmVadDFLK3hNbVZrU1JodThJbnJHdFJ6QWFmeGdpaWVlM1ZOZTYyZHcx?=
 =?utf-8?B?ZVBMVUVDSk16d0F1T1BGTTA5Qkh3RlhJS0pwZGtJY05BOHR3eXdGWDVRNFdX?=
 =?utf-8?B?UVlPVzE0RHJiaHExd0V3UUhQNDBuYThPbWZTWm1ZNGhUeklkbVloRys0RnQv?=
 =?utf-8?Q?bCZ2tnds?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23908ddb-7ef4-49db-8beb-08d8c2d57d7a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2021 15:09:06.3350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2yjaBY3WLXxQutCxjf13SZQwnzqGhibg+69uS1lMcm1FkLFz0hFjS6aL/vqQIQXaJipuIRc772AJe+yEzgYlXzekbUvq03KJfXFHvqh4QIA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3478
Content-Type: multipart/alternative;
 boundary="------------42C2F9BD145B68A2BB6A8663"
Content-Language: en-US

--------------42C2F9BD145B68A2BB6A8663
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-25 4:30 a.m., Leon Anavi wrote:
> - Fix stub compat with older pyyaml versions that may unwittingly
>    load it
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-pyyaml_5.4.bb => python3-pyyaml_5.4.1.bb}   | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-pyyaml_5.4.bb => python3-pyyaml_5.4.1.bb} (79%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pyyaml_5.4.bb b/meta-python/recipes-devtools/python/python3-pyyaml_5.4.1.bb
> similarity index 79%
> rename from meta-python/recipes-devtools/python/python3-pyyaml_5.4.bb
> rename to meta-python/recipes-devtools/python/python3-pyyaml_5.4.1.bb
> index e46b608f7..c3025fdc6 100644
> --- a/meta-python/recipes-devtools/python/python3-pyyaml_5.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyyaml_5.4.1.bb
> @@ -8,7 +8,7 @@ PYPI_PACKAGE = "PyYAML"
>   
>   inherit pypi setuptools3
>   
> -SRC_URI[sha256sum] = "3c49e39ac034fd64fd576d63bb4db53cda89b362768a67f07749d55f128ac18a"
> +SRC_URI[sha256sum] = "607774cbba28732bfa802b54baa7484215f530991055bb562efbed5b2f20a45e"
>   
>   RDEPENDS_${PN} += "\
>       ${PYTHON_PN}-datetime \
>
> 
>

--------------42C2F9BD145B68A2BB6A8663
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-25 4:30 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210125093035.6177-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Fix stub compat with older pyyaml versions that may unwittingly
  load it

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210125093035.6177-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-pyyaml_5.4.bb =&gt; python3-pyyaml_5.4.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyyaml_5.4.bb =&gt; python3-pyyaml_5.4.1.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-pyyaml_5.4.bb b/meta-python/recipes-devtools/python/python3-pyyaml_5.4.1.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-pyyaml_5.4.bb
rename to meta-python/recipes-devtools/python/python3-pyyaml_5.4.1.bb
index e46b608f7..c3025fdc6 100644
--- a/meta-python/recipes-devtools/python/python3-pyyaml_5.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pyyaml_5.4.1.bb
@@ -8,7 +8,7 @@ PYPI_PACKAGE = &quot;PyYAML&quot;
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = &quot;3c49e39ac034fd64fd576d63bb4db53cda89b362768a67f07749d55f128ac18a&quot;
+SRC_URI[sha256sum] = &quot;607774cbba28732bfa802b54baa7484215f530991055bb562efbed5b2f20a45e&quot;
 
 RDEPENDS_${PN} += &quot;\
     ${PYTHON_PN}-datetime \
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------42C2F9BD145B68A2BB6A8663--

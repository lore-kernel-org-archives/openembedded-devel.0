Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.75])
 by mx.groups.io with SMTP id smtpd.web11.28.1612303805504335437
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Feb 2021 14:10:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=k1tHDbMd;
 spf=pass (domain: windriver.com, ip: 40.107.93.75, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ng4Boo8EnFCiQT+csZ27uZ2gItXJTjkEjjwWffOVXlgGUJvYmI4abIYiNHnapz4QLiy2XSfN9e/hCMsJgklEEH17OXTv1Vw7bkvudZcxgzs6c+IHa7vs6TD6F9aIqPQmq8gctKApwCvDk5gTdcVurg1kWulD8EP9QJlBl/51RBRNANvrfI/8EVT1bTU+sK2jJdAM6Xgs1ENpPWD6DMuL7a1f5qmtXY6kjtdTsgwfB2DAtsI1+IR+B9ItN9NNRNHsYes4qagXJUMuIgwydMiSrALpmhkW9EXMorHezh0Q5nDHEboeM1ihvUF/lUhlcTbYKLV3/iYlgEipzWoSJmEd9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/JLkV698KeI8pEeDDEd1e7DVahTsxxQIQYaVanA08OQ=;
 b=DIcyrF2JXj/udRbGJBZwXbiR8cfbFKABQmCaCOIXGn7ImTx7cR04tFhVXMxVBocrGFoeio/ngafHNq7DGYxKcDRXWQ34chf41NdctHnigbndhmS4kSx/Kax3wImr/KD+scz/ZNt4i/eGWH4PVcGgGV00IWiusol95JdkTthFeb7C03OhqGmam+QfQIFHaP9g8FD7dr1fz4sjKWO9nD4y7NtqW2iNLNSIQLUg5KsgW4SUYY4D+sZHDOl8zLYeE5wD+UftVZfRTGts/tj69nIbwXOZNTqSntc82FNlh6xkIlPuI5NKOtcW71qCjrpIRL4pC/fG8ZjliXasGgK9Y+MasA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/JLkV698KeI8pEeDDEd1e7DVahTsxxQIQYaVanA08OQ=;
 b=k1tHDbMd4Hiei7whIS21IvAZZKUKLSBwYIFe3K7yH4pN1mZ+s+GmI2g1k5FJsrdLWCKh9UfOFKk4LRz1S6o73KrK+NskBaYChzIHkUfphHM3/mcw8fGft0LxG6k01wddWgKMxp+GDY4gxwfzO1Udb/UmL37XD8hrjL9y8tT2vGQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3448.namprd11.prod.outlook.com (2603:10b6:a03:76::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.22; Tue, 2 Feb
 2021 22:10:04 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3805.024; Tue, 2 Feb 2021
 22:10:04 +0000
Subject: Re: [oe] [meta-python][PATCH 3/5] python3-croniter: Upgrade 1.0.4 -> 1.0.5
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210201124516.30135-1-leon.anavi@konsulko.com>
 <20210201124516.30135-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <7a294536-266d-8132-de7c-38c125eac4f3@windriver.com>
Date: Tue, 2 Feb 2021 17:10:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210201124516.30135-3-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL0PR01CA0019.prod.exchangelabs.com (2603:10b6:208:71::32)
 To BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL0PR01CA0019.prod.exchangelabs.com (2603:10b6:208:71::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17 via Frontend Transport; Tue, 2 Feb 2021 22:10:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 19c37993-c13e-432b-adac-08d8c7c74ada
X-MS-TrafficTypeDiagnostic: BYAPR11MB3448:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3448D4F90256D77D4515BA149FB59@BYAPR11MB3448.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:538;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2Fst+dv/tJ61j6i/5u0d5Pwz+xVn/J21ylMCQfljHePLzxyf+llK+6JdsbZNEzs6E8WqmPqt0NpBH9TfOMMxWuqpRlzou3HZXszUx7Gg8Zcl+CKkzg4kgfzaz7YSd9tfuFpcN3Or2jcRyUxl7yHh8ecXdFuuVa04BbiRghLe68kUkmD7NUxJlSwpAURrR8e7lYxlcaRkFk/VWR7vKawaH9u9ax/jOvxlnZs5aImhE9Em8MdIUvrEFFQpv0QT0104ERw+vlVQg5fkIixHJZyUxI39eKppd6FPGme/lSQlU3DWDBncW7BMM+wZv4UzqsIHFpe3dgCcfd6E/CMasQpEPeUQPuztOOc7nEURtzJmJ1B6q/RuevUpabvrSbMNEJS63pcvkCQxucrIYgoLy6KRuogM5N9Tpg6Xs6rj8ld1oeboDyBjW4noVFunEJ2L45y+b2vdwtcgcNw+V6fz1bBZWzVriJQbnN9GiuwQ1Xi5wg8V6FpqlTbmhilCglWa9INujSGDmM+0ApqWgA0TbFLLSgLotbjdlJeEwaA3jAvBB6w++1Y+Lz7v5M2rTYdXccTZVjmXzhMjBBO6A08DeXjDh5GxM+GkTuKuUhZnJgk8cq/Vhl/6b2mxpKOHTiZ1ZhypFB4v/t51AkaP09WSYZxImoAzDK3r/NnC6ni9Ve01wn4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(396003)(39850400004)(136003)(66946007)(31696002)(186003)(86362001)(26005)(33964004)(8936002)(31686004)(8676002)(478600001)(52116002)(83380400001)(316002)(16526019)(966005)(5660300002)(956004)(2906002)(166002)(6486002)(2616005)(53546011)(16576012)(66556008)(66476007)(36756003)(44832011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?NnJjVzliMXlEVDl5empTWUlYU3owZzZ6LzlSK0IxR0JZRzU4N3NmMy9XYzdt?=
 =?utf-8?B?d2RvOHZJSlRPc0o0Uno1M3ZLSFp3RXM1Vlk2NHFNTTJ5dnJyZFQ2azdKWllP?=
 =?utf-8?B?cmRaZWhzNGI3SzY5bm00QjlpTHBKMmhNaXpZR2p6R01sT3liYndjSmxSQXhu?=
 =?utf-8?B?NzV6UWZoaStMQjB5eDVrU1J6Q1o3eDFwdnJCdTFqb21vSkNIcHZxbjJ0Q2Y1?=
 =?utf-8?B?WCtGaE9zZzVNT05YK3BtaVgvV1NGSHJRZWtrL2U1QzlIK3FmSVVWMTdYSE83?=
 =?utf-8?B?MVA2VzliTWRUdDBWT2J1YlhPbTZUV3owYThoTXQvN1B3TWpycERyWGNteFZp?=
 =?utf-8?B?d3pBTW12ZFhmcUhuRGR5WXFTa3FzZHZOMm9pVnBzQmFXWEpBZ3UwQW5reVlJ?=
 =?utf-8?B?SVp0TVVwcnhMcnIreVhWYXc5OGpodG1RY1pnWGQwWUEvdHVwUVlzYkw1L1k2?=
 =?utf-8?B?RHBPWUtvQ0hyZGtzRGpSN1NwQWxXMHVuU2J2QWVuOVp2RHZGdWRZVXBXd2s1?=
 =?utf-8?B?ZkhEVzF6bDRsZlZQbGhNY1R2NER2TnA3c08vazRtS0FhMnZGcyt2SktEZE1r?=
 =?utf-8?B?RFRDNTl2Sks2akp1ckhaZlNrYklyVUtDV0YzWEhrZGd6SVZoTVl3bTVwK2Mw?=
 =?utf-8?B?eWZkcy9YbG51L3dQRUZLTU5IbDRNMS9WV0d3blMrOTcwZjdjZnZzTkpBU2V5?=
 =?utf-8?B?VlZ4NTNGc0ZlNzM3c3FSWDhGd0hDTG9oYUhRcDluQ3FUYjNFY3hGUk1oR0pp?=
 =?utf-8?B?UFVJeUJUMmlaYUUyU0l1RzhiNDFmSlVweHF4TFR1WDNqZ1J1ZElaMEozNjlU?=
 =?utf-8?B?T2QrclE2VjAycDZ5YVlRNldWUVU4eXdZSXkwdTB3dlhPMmhFSk5kK0NpTDJ4?=
 =?utf-8?B?Z1liNi83SHQyblNmS3k0dm44dE5HSGdsRjNFa0lnNmpOR1R1WG9rMFEwTGNX?=
 =?utf-8?B?MFY3dXgrM2dCNWo0UDFubDNXZW9zZW5yRFFWcHA5MnMxSDhZZ3JWTTE5VG4r?=
 =?utf-8?B?R0tDN3NNVXMzenZYNjdxWWlZaUp4WFJwN2hzOXpKek1VQlpqQ083YkJBR0o5?=
 =?utf-8?B?KzlwQjFHbmxlUHBrVEZMSVN4cVlVUHRHN0ZZUXU4K3JvRVZYUG90emZuYUIz?=
 =?utf-8?B?dnZxbWs0VnB0aGZ5VFBzWWppeDBXQ3l0aklLQlpGaU9qdzQ4ZXRPc3FwRm43?=
 =?utf-8?B?SUR2d0Q4WkhOb1pRRm5IVGJ4di9sUld4RURQazJWZVhHbkJIOWFmZGZaakpi?=
 =?utf-8?B?V09qRUtOQWwxSmZFb3d4dmN3MHNNbjcvVjdiM2twVHp4dWJpSThNbE8zVGdX?=
 =?utf-8?B?cTg4RXNzL2Z0OGNaMnc2cUlFYU8rcWpuRW5sZkVIc1RqZGxzVkozV0g4T1JE?=
 =?utf-8?B?MWh3ODk0Z3orYi9XSHJmTlNqeVhNUUlZN2lTcWtENTZMb3VzZzVRbHlMMVVm?=
 =?utf-8?B?ZlU1dmVYenZkR1IvMHZTYlJjOUpEdEVVZzJPTXhnPT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19c37993-c13e-432b-adac-08d8c7c74ada
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2021 22:10:04.2838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4d+GvhHXHSGoQEH+7kxos4Y6jLy5z/wln7jPP9Ef/UEs2TQzyIz4GUUbzS/yha1ys7vyupwv5V0DFN06+aX2x1NR1oHabwScNcjgUXAb7n8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3448
Content-Type: multipart/alternative;
 boundary="------------7B658AAEA9DBF742BF4A6EB4"
Content-Language: en-US

--------------7B658AAEA9DBF742BF4A6EB4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-01 7:45 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 1.0.5:
>
> - Security fix: fix overflow when using cron ranges
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-croniter_1.0.4.bb => python3-croniter_1.0.5.bb}    | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-croniter_1.0.4.bb => python3-croniter_1.0.5.bb} (78%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-croniter_1.0.4.bb b/meta-python/recipes-devtools/python/python3-croniter_1.0.5.bb
> similarity index 78%
> rename from meta-python/recipes-devtools/python/python3-croniter_1.0.4.bb
> rename to meta-python/recipes-devtools/python/python3-croniter_1.0.5.bb
> index 8328cf6d3..c8af97d7c 100644
> --- a/meta-python/recipes-devtools/python/python3-croniter_1.0.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-croniter_1.0.5.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2"
>
>   PYPI_PACKAGE = "croniter"
>
> -SRC_URI[sha256sum] = "7f861f4a896b2b43069ef218d2b999d2c9f760598c2592a6b842cb04bc75562e"
> +SRC_URI[sha256sum] = "8636e7f0ce842b4192b7f097cab724fc15bf2459265f1a2bc6cf6eacfa44420e"
>
>   inherit pypi setuptools3
>
> --
> 2.17.1
>
>
> 
>

--------------7B658AAEA9DBF742BF4A6EB4
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-01 7:45 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210201124516.30135-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 1.0.5:

- Security fix: fix overflow when using cron ranges

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210201124516.30135-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-croniter_1.0.4.bb =&gt; python3-croniter_1.0.5.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-croniter_1.0.4.bb =&gt; python3-croniter_1.0.5.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-croniter_1.0.4.bb b/meta-python/recipes-devtools/python/python3-croniter_1.0.5.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-croniter_1.0.4.bb
rename to meta-python/recipes-devtools/python/python3-croniter_1.0.5.bb
index 8328cf6d3..c8af97d7c 100644
--- a/meta-python/recipes-devtools/python/python3-croniter_1.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-croniter_1.0.5.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2">&quot;file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2&quot;</a>

 PYPI_PACKAGE = &quot;croniter&quot;

-SRC_URI[sha256sum] = &quot;7f861f4a896b2b43069ef218d2b999d2c9f760598c2592a6b842cb04bc75562e&quot;
+SRC_URI[sha256sum] = &quot;8636e7f0ce842b4192b7f097cab724fc15bf2459265f1a2bc6cf6eacfa44420e&quot;

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

--------------7B658AAEA9DBF742BF4A6EB4--

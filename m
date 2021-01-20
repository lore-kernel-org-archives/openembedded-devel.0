Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.82])
 by mx.groups.io with SMTP id smtpd.web08.27661.1611149697594921161
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Jan 2021 05:34:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=GFdZk0No;
 spf=pass (domain: windriver.com, ip: 40.107.75.82, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R/gDuubfh9LCVXrudW5fudSENCL9bkBdmKdj+zbIrboZWUR0SJnZlE0N3AukSYoMDzGnSO8fZFyWC5KX79dSGq8JcY5o/EUdp+paGIWUEvqPlqJdS60k5mZM31PRYBnZCLsbKuEfYdMFWqSt3mZ/FRTRbntwj4/RUIBHOivW9mv54yXTqUaHEdteXzBVGaMqyCiYYssyv+hG3CSt+QesoikEoqOL3w4RN70wHuIEbYS9CK6qTNL6CaNn5foz2uohH12I9I3tnVfykO2noV3LrHf+XuM1TF6Ybuq32rSYZ9O4GCPc5ZY3cWhd52x8+0aTkSl8RDg3NlxDjMWsYss7dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4A6EmjEMyGqV5psGdsHRQa7YZ4XINuMo7XAyNuSQWio=;
 b=gMz/PY+evwG5bH6TYBzZHAZSvdvQfVwFMYhlgtnr6/eCXaSnw4LAc/rthAuOoOtOZmFjWsKgWQGjJSl7v77PZj2DL8B3AMZNYiHKfw+DuU2GVkd2Wob7ujWE9D1QBJw0ylMwzJ0MsPpRAV7ypuF19/KYHIqPvbjbFVClpHUBL4rLRZM+TFovVg7juKtGPS5O7wksx5BTKg9SJ2Gd+V/fzOOipjubJAS4gQy9zZF1S1nkUQmrJe3y8bpT4IUOI0CdBZCBICu6RfV9/LTSQ/HGXGcSZqHEXCmSQeGNXcxhvubEbi1dG4T+6X5NO+pf38YHKeYZ4iAv7WB48QNtACH3tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4A6EmjEMyGqV5psGdsHRQa7YZ4XINuMo7XAyNuSQWio=;
 b=GFdZk0No9xayMxAf2jbZArl/CkS603NfoKt9U3u6lV0+k1sR7pUvy3bhanRbfnMtiHtI4GvQ3MMY5wnBUljgKcYBsy5T1SEIeN1AS8gy05t8EBYR2+9vnTSDjsudOt09TWlfdiBW9WFunkrSMMohMkTO/gFPM/uMTiSzT/Piywk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3559.namprd11.prod.outlook.com (2603:10b6:a03:f7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Wed, 20 Jan
 2021 13:34:54 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3763.014; Wed, 20 Jan 2021
 13:34:54 +0000
Subject: Re: [oe] [meta-python][PATCH 04/10] python3-cheetah: Upgrade 3.2.5 -> 3.2.6
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210119173746.24694-1-leon.anavi@konsulko.com>
 <20210119173746.24694-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <4eed917e-0572-24a0-3e92-32e14fee1e77@windriver.com>
Date: Wed, 20 Jan 2021 08:34:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20210119173746.24694-4-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: CH2PR14CA0008.namprd14.prod.outlook.com
 (2603:10b6:610:60::18) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by CH2PR14CA0008.namprd14.prod.outlook.com (2603:10b6:610:60::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12 via Frontend Transport; Wed, 20 Jan 2021 13:34:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 051a0678-d3c2-423f-f31d-08d8bd482ba9
X-MS-TrafficTypeDiagnostic: BYAPR11MB3559:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3559672951D8B12C76AFB29D9FA20@BYAPR11MB3559.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:400;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mpXr7bAwZ7vjXPB+X6bYzv3iQrKqhMV3dSNFefAZeTwsBLBlZXYOVysMY1pCHBmxx/1DXZ1T9MN14dPFffprMffz6jswmKeCeFBZosCBa7IK1s9JNjWG+FuyLeUibF4sdQkFB1zsICP0BS9TtlZUPpDXnDCcXo8XrxGku9Gmf8opaJ35FjqCE672palE+dNNLlNVXqDWRWAcrvWWn/ofpxYqYxLqRvD6iAGAQhrHyzzjKx788lzMmnVvYoPR6XZwODlqr3PXYuewRQKksEU+TCUBQsyFoTxJ7FFfJsgS+e0smLrDgzUQ22OQtSMNYC5CdQSSMPKWeTifOJrCdxXsB4P84bjyOk1C7qcyuCjM5eBA4QwJ4akH2anh1ILoX2b7AYr9niMR11Cs7MU4KfGXZN1cRRZNxHbSgO0511vYiKqBorqZ9ScU2kLXK7vd/p4bCGaz4YdEDhOJ3sOrXr4rw7RrIMnjotr5MZh7FkEBjo/pSyOoDXmenQvDSvMiGMKDE94QSWghOIx5zPOphY4vCrFkXeeWhwOT1Tbj/cxueo0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(366004)(396003)(136003)(376002)(956004)(26005)(53546011)(44832011)(478600001)(33964004)(16576012)(31696002)(86362001)(966005)(66476007)(66946007)(166002)(83380400001)(66556008)(186003)(16526019)(316002)(2616005)(5660300002)(36756003)(6486002)(8676002)(52116002)(8936002)(2906002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?S2JJbmlmbTVPaGNIMW40QmREL1pINlNUMUdOb2REVTJ3QnJLZnBSVXJqU2cx?=
 =?utf-8?B?d0NWbUJrSXowcUVBSGprL3FPcXNRbUR2cnpEOFhVUmxwSm9STUNqWkN2NEp3?=
 =?utf-8?B?K2srTGZYMlltNzJrVDhHbC9CZmlCZEtRRVpCTjEyN256bE8rTTFzRmhiNXFw?=
 =?utf-8?B?Ukp6Zk4xYkg5aVNmOU5qS28rT0dna1FXVXZmK0FiMDFISGlDTk1JVzM0bnh6?=
 =?utf-8?B?YjZvSEZGNUlLTGVWL1FWa0JldjR1MXNiV0ZSSXZKS3NIc1hGOEEzSml2MmFw?=
 =?utf-8?B?NzRnYnh1U2Y5K3dHT3ZUcDhxV3AwWHRmY3ljQlZMdk9zWW4yZ1R4TUtNQlJ0?=
 =?utf-8?B?b3l3YVpVYjZ1UWRlYkpzWE5yZ2xwY1AwajhEN0hVTTgzaGRweWdla0pTNkJ0?=
 =?utf-8?B?RlQ3L2k5VWp4M05hb0pad0xOa3I4Rmh4TDhOMjVINUN1bStxblpNVUhHczNx?=
 =?utf-8?B?a0ovOTlKYzZMd1VVTVdGQ2EyWHcwdWZSeU56ZURsS2FXb2VaL1BBdnVXMUV2?=
 =?utf-8?B?azlrNFoxZ1QwUVRQMlpmemQ3TFZxQk0xcEVDK3d3bWtBSm5zeW5oSGlPeUtK?=
 =?utf-8?B?QURHNWo4TDZlY2NOZ0VxRmRQZURIMW5naUhqUjRjTXVnMGNLcTlIRVpMMmdV?=
 =?utf-8?B?MDZJWEMwcDBGM043L3hiMmRxdFNMYnIvYXhBUGtBY1QzVkdLZitVeVdqRDhN?=
 =?utf-8?B?WjVjRnJnenZ5MU8zc0liZXVtVk55cUtXdGVKYXBNbHg1aEJmZlBibnFTNU14?=
 =?utf-8?B?eWV5NDYwL1FIbUR1L2dSQmxtcjVzQnlYUWwyQUtkZ0pUd0dqZlVFUkIwRlYx?=
 =?utf-8?B?MHpmT21wRlNZYlMxN2d5U0t1OGhGeS9CcldBMkNqRUFENUphb29aK25xTTdq?=
 =?utf-8?B?b1ZvMUhOdTlKWnZDSFFCUTZvblNaci9IUUc2b3RRRVFBbk0vRXVjUVJUaUM4?=
 =?utf-8?B?clN0cDNPTGp5Wk5EdFhEZW5TTTBjZ3NhS0l4SnAvMHNQY1RKVjJFM1JtYkpq?=
 =?utf-8?B?RWM5R3Z4alJIaE9tdEdPNnlIZEU2SzhWTTU3Q1F3RkN3alZLekxYa1M5SDFF?=
 =?utf-8?B?Rk5NNXdCVUMyTXJHNUVuL2pEc2FidytvWW5YRWlJRThia1gyeEQ5T2xHSGNG?=
 =?utf-8?B?UGZ5Rzc3eG5tMWVyL3dKeDB0a2xKdllsR2lWVHdhWnBVMXdnZlNDeGJmQXQ2?=
 =?utf-8?B?d0RyVXMrcVB1TmV6OTI4dVJtWXNzS2FQZ0RlMThZYlVPS2thZTdoWERwN1Zz?=
 =?utf-8?B?Qk5ianI1OWdrMy9qK3BsTEVFMTcrdUVFSVhtS2Jodzc5cFZlaHloK0JSRXBi?=
 =?utf-8?Q?vW/UxzZft6KsfWqtvam0lvBO4538vWu3oM?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 051a0678-d3c2-423f-f31d-08d8bd482ba9
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 13:34:54.2807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VE15Kg+RRVPCtMgrNu1XpdYkD+W/NOsAux+dE4dmBLrKHJRRxZwVzv+xD6GqNgJmvb0zqvsBrseP9XPOl1FErK5mRB+QMU06L1KCKCRKeEE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3559
Content-Type: multipart/alternative;
 boundary="------------5C0DDB6ECBF74CB1DF53D045"
Content-Language: en-US

--------------5C0DDB6ECBF74CB1DF53D045
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-19 12:37 p.m., Leon Anavi wrote:
> - Fixed use of uninitialized variable in _namemapper
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-cheetah_3.2.5.bb => python3-cheetah_3.2.6.bb}     | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-cheetah_3.2.5.bb => python3-cheetah_3.2.6.bb} (72%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-cheetah_3.2.5.bb b/meta-python/recipes-devtools/python/python3-cheetah_3.2.6.bb
> similarity index 72%
> rename from meta-python/recipes-devtools/python/python3-cheetah_3.2.5.bb
> rename to meta-python/recipes-devtools/python/python3-cheetah_3.2.6.bb
> index 6fa088f59..a7e5443f2 100644
> --- a/meta-python/recipes-devtools/python/python3-cheetah_3.2.5.bb
> +++ b/meta-python/recipes-devtools/python/python3-cheetah_3.2.6.bb
> @@ -11,5 +11,4 @@ RDEPENDS_${PN}_class-native = ""
>   
>   BBCLASSEXTEND = "native nativesdk"
>   
> -SRC_URI[md5sum] = "fc735d4ca7997df2a2da1cae0cf89a1e"
> -SRC_URI[sha256sum] = "ececc9ca7c58b9a86ce71eb95594c4619949e2a058d2a1af74c7ae8222515eb1"
> +SRC_URI[sha256sum] = "f1c2b693cdcac2ded2823d363f8459ae785261e61c128d68464c8781dba0466b"
>
> 
>

--------------5C0DDB6ECBF74CB1DF53D045
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-19 12:37 p.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210119173746.24694-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Fixed use of uninitialized variable in _namemapper

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210119173746.24694-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-cheetah_3.2.5.bb =&gt; python3-cheetah_3.2.6.bb}     | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cheetah_3.2.5.bb =&gt; python3-cheetah_3.2.6.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-cheetah_3.2.5.bb b/meta-python/recipes-devtools/python/python3-cheetah_3.2.6.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-cheetah_3.2.5.bb
rename to meta-python/recipes-devtools/python/python3-cheetah_3.2.6.bb
index 6fa088f59..a7e5443f2 100644
--- a/meta-python/recipes-devtools/python/python3-cheetah_3.2.5.bb
+++ b/meta-python/recipes-devtools/python/python3-cheetah_3.2.6.bb
@@ -11,5 +11,4 @@ RDEPENDS_${PN}_class-native = &quot;&quot;
 
 BBCLASSEXTEND = &quot;native nativesdk&quot;
 
-SRC_URI[md5sum] = &quot;fc735d4ca7997df2a2da1cae0cf89a1e&quot;
-SRC_URI[sha256sum] = &quot;ececc9ca7c58b9a86ce71eb95594c4619949e2a058d2a1af74c7ae8222515eb1&quot;
+SRC_URI[sha256sum] = &quot;f1c2b693cdcac2ded2823d363f8459ae785261e61c128d68464c8781dba0466b&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------5C0DDB6ECBF74CB1DF53D045--

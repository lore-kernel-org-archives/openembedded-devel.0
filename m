Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.54])
 by mx.groups.io with SMTP id smtpd.web10.217.1615993251058464572
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Mar 2021 08:00:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=FefK3Rav;
 spf=pass (domain: windriver.com, ip: 40.107.220.54, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TW6QrwbebO5geQjnPoMSS6JpIRP9NwA5lEvarMwaEFW/anQuwa1I0DLHuybysiGWIN53K382QPYICP7eXMz3EowEnzTcMeg+NyVqxYV3kLxtS2E4nrwY8AjI5tRm566HMqQFgndr9vTod9sm7+MXvP+yj+RRQ5YOtZssTMAx9OcGmKF6G/wzK0uJFnkMdTG53oCCqPkWxLDVdTTsFX8Y2D2x244ZLkBs+u+v4924aC2Qtwq5NMC8ssoMmVFmJx61O5NrHqVjRkvzAcCiNDWhaJqSZYaQJbZa9Aywc05HmSDlHMAaIRou1M9hgRyl6JJ5pnLR3c1d8fCdAp1ZI7m8Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gbynpgs5fe4LOiPrCmoBYc2jn6sbEqlTB00LHyQj5qk=;
 b=nwF4f7Bbz7mPRro+5JzMny121ClGpyaW25wINWyLFpEiLA5/GjYR++QcFtaAk1dSw9dxL571y/0vi1Wd+fVmBfzRRHw9twLOzIbFfmCv1n3L3sD0oRW9Gxexu22t0YJS/EXxO/mS+96ShhwMffRiDB+5d+qisOkjL0FJkiblK56pq8eWPgH3DtrBXnvTUEIUmZ3MSwP7uE26i+3v64NArTux6DFXyu0zt0oXouai28CEVM7ijwqBQ5l+RZP1RI58PL5Xk+iThpjDWE9dMUUqzqTsDqM8LGt0gzMHXW6WfOgM2GMmawP9Rag4hDK+l0hx1kaqjI3ntT+zzRr+KApuiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gbynpgs5fe4LOiPrCmoBYc2jn6sbEqlTB00LHyQj5qk=;
 b=FefK3RavfmmE4Y6OiuUckCKfNfWgGgguZ7zPvbPdy1247389D5FZIFysrmEiEpyrFXEcErCi3ujuchPjYOIQcCispT98YDWHQ7jDPrpK1WSZyXvA5/aSm2qFvbCkmnkEK7vfj0NCEaaShrQ7SYKgtPA1C2h6JJiOziNjgAXQp4o=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3253.namprd11.prod.outlook.com (2603:10b6:a03:77::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 17 Mar
 2021 15:00:49 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 15:00:49 +0000
Subject: Re: [oe] [meta-python][PATCH 5/6] python3-socketio: Upgrade 5.0.4 -> 5.1.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210316083744.17558-1-leon.anavi@konsulko.com>
 <20210316083744.17558-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <802bba98-8b39-b71f-82dd-b7495809db3f@windriver.com>
Date: Wed, 17 Mar 2021 11:00:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210316083744.17558-5-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN1PR14CA0012.namprd14.prod.outlook.com
 (2603:10b6:408:e3::17) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN1PR14CA0012.namprd14.prod.outlook.com (2603:10b6:408:e3::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 15:00:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de51142b-6259-4834-1a48-08d8e9557384
X-MS-TrafficTypeDiagnostic: BYAPR11MB3253:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB32535C0413C57688668BD1509F6A9@BYAPR11MB3253.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7Rnn1u2osq8vQ7lCUlpdsuh26ml4pDTVP6lZjUC5NUS1fwY9gk950ZpF2EzL/sJpSY/Y30p3kIcYBR54eD9aUe6ln64E60LZJPwWJfYe4utCLIsMO+6kkyu40PMzXTc0eNKFq8LVPvFaWoZpbIvgdqlNDSqRnMGZusRA6e8HUAoSxBIDtKpuHpztnBDjE2hb5H7mpRTShBJsHjuP/RJDbxMlaEgBmEGhWavZBgM/MFJLtUtClW8bTXUHKJdNRTwiH7E+etOeE9XFIaMSP0vUfQNPDjTSdcpXHKu2ETYHTZCi9kQKYcjsYRsgWyy4Nm4xseSk0HEBRvXWJXCjiBeSDvmpt1oTs20RfSu3jyrbpTA0EmLnSiSxGntAELajqTaznylQ3SDXMiVSUiiN7bE+tgBS4f1AnI/kwhMGf+nTtC1mDzaDBoBBE3KL3y3IMIDBmpGKPqZgAtTLexWHKBXGCUbT3jEBFaHod3KR7bvt2TzXymVtSE+daeKeBNV4VlQKgO6E2bh3ZGsDn4bdI8NvVMyqDX4HmLUF9DEYDANRTMhuA+t8laHOhpHsC8FljteK/VOsXcGoxj0x5Uy7PBE6zGETtwH37FJJZgDN63xtal7yTjG+1Z82p1hf+rxqx04PVtqJGNY5hXlxewiXVKgZZNfqtVBzKKEPkcq6fUBu0b99GIZhApxT13OyQPW53018l14IlzOQLOGpbCeTnhenW4W4THATYXkEbqvaXtSKJF4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(136003)(39850400004)(366004)(6486002)(956004)(86362001)(44832011)(2616005)(186003)(16526019)(26005)(36756003)(966005)(478600001)(31696002)(53546011)(33964004)(66556008)(66476007)(5660300002)(66946007)(8936002)(166002)(31686004)(8676002)(2906002)(83380400001)(16576012)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?NUV0TVlBSzg2U2RQYWZ3RmdRUEV2N2RBVGJ3VHB1Y2ZQNFRhOUZmZytNejl1?=
 =?utf-8?B?UlVGREZjMU5nZ2pFcUtvanphZGlsM0cxMm1Dd1pkZ2d0cCtVZldSOUlWS0hX?=
 =?utf-8?B?bzBMZWNSZzBFejFiUWtRT01DSEVlS2pyaTdlVm5oTEQ0b3hBSXA2N3dRTmZE?=
 =?utf-8?B?WlpDSW5vZ29KQnZLVmg4TzlqS1E5dG05RGF3cS9hKzVyNEd0VFR3cURIQjVF?=
 =?utf-8?B?TUx3M1BMR2tOVHcvMFhOdjgwL0s3L2M4VGsxUXhVL1hoNWpnZ0Fham90OFcw?=
 =?utf-8?B?V0NLUkVqY3dFcFdOYkdUZVBwWWlHOXRPZVFRcFlqQVBWbjBlS0cvbXhTU2Vl?=
 =?utf-8?B?UGd1U1Z0RDJhbHorTFZ3N0MwZFdRcExzUVQ1K2UvS2EwaUxUMWowbE5yMzV2?=
 =?utf-8?B?aUYvU0I0NEkyaHg5WDVUV2dzRjZkNGYvT2tGdTk0c1kyVzBFaC9QT2VlMmJ2?=
 =?utf-8?B?Q2hMZjNMREpudGlqOHVYVUdsMWVwNzZZTDkyY3JXMDBNL0NPZlBRN3VNOW52?=
 =?utf-8?B?R0Y0d1pHVEtlNjI5dWVQajMwc29kVHRZaVQrdzIxY0dxVk53eitIL0xNREN0?=
 =?utf-8?B?WW4yMGRCc08vWnVvU0dKRU5GNG9ab0FZWmdlSzJCM3l2eG9GdXJrZzF0OGli?=
 =?utf-8?B?QU5sdFRmMGNwMC9iUVNreXJQQW9iR05zZmRENlhwRnhmZjgyRnZKM0tOSXU3?=
 =?utf-8?B?Mk9namxnbS9rVHdPVWVzYkc1OVBVQy9WVzR4VmtNL0xnTnNOSDV6eE0wV2s2?=
 =?utf-8?B?dSsyRy9ubWxOUDRYekM4aGFBNi83dmkyOVJNVWlqTkEzcDY3S3hoeHlCUUx0?=
 =?utf-8?B?eXVia0prZFF6emlMdm5mbGJ0L0ZqdEdqSm9TUkliM0NzWkV2NHgydUNWOWxQ?=
 =?utf-8?B?QndSVUwwZDRRZGs0cmlFYmx6R2s4aEY3SmtDeCt1QnVyK3gyaEoyNm1WQjVS?=
 =?utf-8?B?bmJxZExEYWZUakhUUGtZVFpyaHkxcXREc2hEL2UvdktCZUgydzIwTDJsdXRJ?=
 =?utf-8?B?bTM0Zm96TGErNTJiYitGK3lyN2NLck9WRTZEVXlNbG1nbUo5ZU8waVlyZjkx?=
 =?utf-8?B?eEt3bVl1amxhRmU3Q2VUVVM1SHRESDNYMi8xK2hMcUpxeHRhdk1nVFUyTHZJ?=
 =?utf-8?B?Y29pQVlOSlUwSXZyWjFnNGNiemtld0t1R2U2eUEwcWE2YUVJSDdGNkg1K0di?=
 =?utf-8?B?RUw5cjRUMThqMG1JZ0lsQy9leVNYc255TTRqVTdra2pwanloOEhmRlhRdnJK?=
 =?utf-8?B?THJ3eEdzKzlacUcxRWFJYXIxTVZWU1RNZ1pCSFd4NE5UMHo1L2FSTDEzMmpS?=
 =?utf-8?B?WGZPZjNSOEtpMmdPMEVaSWgwUXgxSEhIOVdaL2R6OHhYQnYyQzFIQ1d1SjRT?=
 =?utf-8?B?Smk5THhxTkNEbjZmWkl4ZHB2bUZHWkJ4Tld2bEgyT3EyMFhxTFZLTXNVMUkw?=
 =?utf-8?B?d0RvY09ZM3FEdll2YWt5SGlJd21pRTR2bHg4YzAwUWJVUklxSms5ZGxHeW5k?=
 =?utf-8?B?RjZjQzlxQ3l5czNEdEtXTVBuenlDZERoamFjbEtEYWpsU2hJcUV6ZDBDRnpM?=
 =?utf-8?B?Z1U3bkRhOFhMMEhtVi80QnhCbERHTHBPd05jMWxpWjduaUxENmdKZ3VCL2U1?=
 =?utf-8?B?c0cxUjFnbjNLaEJrdUtlOWhQcThVcTZPK1hsSGVFZkhPWWUvUGVwS2hqWUhw?=
 =?utf-8?B?ZDloQmlWb3ZJU3FWeVRIUXg0WTRKK2QyUG92TUhYeGRGcmR0NFJwYnZ2NVJX?=
 =?utf-8?Q?jLEAgadFuS25vuGs9J5WKA1MMu6pMUnMluYVQds?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de51142b-6259-4834-1a48-08d8e9557384
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 15:00:49.4343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Im3QU+p5dNGCmEdLsWEfwxQgtC1GGRazA/+dK7ne991laqUWtRySUzBEH8uI835xTbsMPQYn7nCGRhDMcKxsAwuuUgk2CrSgPX9SFTjLEl0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3253
Content-Type: multipart/alternative;
 boundary="------------895483B4E547BBC94D4D90DC"
Content-Language: en-US

--------------895483B4E547BBC94D4D90DC
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-03-16 4:37 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 5.1.0:
>
> - Added wait argument to client's connect method
> - Invoke the disconnect handler when the client initiates a
>    disconnection
> - Pass auth information sent by client to the connect handler
> - Catch all possible Redis errors
> - Reset message queue sleep timer upon reconnect
> - Fixed bad event object used by asyncio client reconnect logic
> - Adding missing example of async client implementation to
>    documentation
> - Add scrolling to documentation sidebar
> - Typo fix in documentation
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-socketio_5.0.4.bb => python3-socketio_5.1.0.bb}    | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-socketio_5.0.4.bb => python3-socketio_5.1.0.bb} (88%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-socketio_5.0.4.bb b/meta-python/recipes-devtools/python/python3-socketio_5.1.0.bb
> similarity index 88%
> rename from meta-python/recipes-devtools/python/python3-socketio_5.0.4.bb
> rename to meta-python/recipes-devtools/python/python3-socketio_5.1.0.bb
> index 70db342cc..8cf6a96ba 100644
> --- a/meta-python/recipes-devtools/python/python3-socketio_5.0.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-socketio_5.1.0.bb
> @@ -9,7 +9,7 @@ inherit pypi setuptools3
>
>   PYPI_PACKAGE = "python-socketio"
>
> -SRC_URI[sha256sum] = "f53fd0d5bd9f75a70492062f4ae6195ab5d34d67a29024d740f25e468392893e"
> +SRC_URI[sha256sum] = "338cc29abb6f3ca14c88f1f8d05ed27c690df4648f62062b299f92625bbf7093"
>
>   PACKAGECONFIG ?= "asyncio_client client"
>   PACKAGECONFIG[asyncio_client] = ",,,${PYTHON_PN}-aiohttp ${PYTHON_PN}-websockets"
> --
> 2.17.1
>
>
> 
>

--------------895483B4E547BBC94D4D90DC
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-03-16 4:37 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210316083744.17558-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 5.1.0:

- Added wait argument to client's connect method
- Invoke the disconnect handler when the client initiates a
  disconnection
- Pass auth information sent by client to the connect handler
- Catch all possible Redis errors
- Reset message queue sleep timer upon reconnect
- Fixed bad event object used by asyncio client reconnect logic
- Adding missing example of async client implementation to
  documentation
- Add scrolling to documentation sidebar
- Typo fix in documentation

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210316083744.17558-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-socketio_5.0.4.bb =&gt; python3-socketio_5.1.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-socketio_5.0.4.bb =&gt; python3-socketio_5.1.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-socketio_5.0.4.bb b/meta-python/recipes-devtools/python/python3-socketio_5.1.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-socketio_5.0.4.bb
rename to meta-python/recipes-devtools/python/python3-socketio_5.1.0.bb
index 70db342cc..8cf6a96ba 100644
--- a/meta-python/recipes-devtools/python/python3-socketio_5.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-socketio_5.1.0.bb
@@ -9,7 +9,7 @@ inherit pypi setuptools3

 PYPI_PACKAGE = &quot;python-socketio&quot;

-SRC_URI[sha256sum] = &quot;f53fd0d5bd9f75a70492062f4ae6195ab5d34d67a29024d740f25e468392893e&quot;
+SRC_URI[sha256sum] = &quot;338cc29abb6f3ca14c88f1f8d05ed27c690df4648f62062b299f92625bbf7093&quot;

 PACKAGECONFIG ?= &quot;asyncio_client client&quot;
 PACKAGECONFIG[asyncio_client] = &quot;,,,${PYTHON_PN}-aiohttp ${PYTHON_PN}-websockets&quot;
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

--------------895483B4E547BBC94D4D90DC--

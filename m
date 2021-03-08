Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.77])
 by mx.groups.io with SMTP id smtpd.web09.36068.1615212236869453493
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Mar 2021 06:03:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=VZ6XsFob;
 spf=pass (domain: windriver.com, ip: 40.107.237.77, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iZEic7381fBKQhZ8/4JxYfy7st+zCJ1je2NuvwqDRTI1FLsZRGEiWMTAp+umFN0Z3GiWn4ibRbZGqd13qvVZs/V4Ja67fDrqMo5xJ09Sa+6KhzOsBRXu2snB5CKMx1YPPvyQ53ePlu3B1ietrblJ9Gevk9eNL3Nxp0cEy/7dZDaAjjJDZ/SKMR+p1NluBSo4REvgxhqYUsONDdY4iZwgPCag9EkTX4Uwh1EKN3pMQrEMvqvhhi2LxGpWnTdzVlA7A4fe2QrDTtl2mV06aaJ7Ir5cUDtvl9a1OY841DFTxA5onxOXuhC1JYbxMUiuc7+N+6iaaw3G+m4hTTVARI1LEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6K0Cx3S2Dh/QwYTv2BNgyoVcP62OCMfo5oES/4sXuaE=;
 b=PDKy0GltoGNRljW19x7AMjcHfBI6DAWqp9DVjvv07y8/qXN9qL5O9bOQ0dwrWyPAJhrprHHRS/BOvISTPLSPEmYASsOB6jFkQFkW508z9+oa9TTXwy4PpCVTLTHNeqaoLayZ6KYTQLbvICpVWJRQz/FFO0JQe9AeeG7el+XHQkuBbAsWZ8E+M5woMRJm9N7StXAqPGietAj0SUF6iTET9K18pD3FtIlDzmVFnMcQoUqkP2WuJgT3dAT/EBzR7pFg0qw42wU9z8CH6izUijyoxI2X5+PYb3CRFwXCKXKtkXIrbCZm528GM0JtgCP1cIVWMaZPlmrLeXflXA540rAakg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6K0Cx3S2Dh/QwYTv2BNgyoVcP62OCMfo5oES/4sXuaE=;
 b=VZ6XsFobPt1GQBFOfXMqObg0SG1o16Hx6Q7Zb7Q98uAOytXMJRe5jpM8OZ289L1e1cpxzTD8GS8qRyu4U107Aqjx9BNx/a+alODmx2C6Uuxaqu6XKpj1fCWRwVSh7Cb/iTFhLxB9aBNYyQPJ6DAO9JHqASAGUjpe6agsKKh+TQo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4103.namprd11.prod.outlook.com (2603:10b6:a03:18c::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.26; Mon, 8 Mar
 2021 14:03:55 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3890.037; Mon, 8 Mar 2021
 14:03:55 +0000
Subject: Re: [oe] [meta-python][PATCH 3/5] python3-astroid: Upgrade 2.5 -> 2.5.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210304130554.32308-1-leon.anavi@konsulko.com>
 <20210304130554.32308-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <2ac4b941-597e-2eb5-4e80-a9b4494af0f3@windriver.com>
Date: Mon, 8 Mar 2021 09:03:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210304130554.32308-3-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN9PR03CA0730.namprd03.prod.outlook.com
 (2603:10b6:408:110::15) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN9PR03CA0730.namprd03.prod.outlook.com (2603:10b6:408:110::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Mon, 8 Mar 2021 14:03:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c073b5b-71be-43e7-a98b-08d8e23b02c2
X-MS-TrafficTypeDiagnostic: BY5PR11MB4103:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4103686F2534F4DCAEC5B88D9F939@BY5PR11MB4103.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pAbTDf1yBc3MMK1wS+Bak3Ccm47WlOcjUolLziKiRUIWdxX4GyrUXfElKWb7MTSpL/iP+X7tDkDCmY89kiDhNS5oKAlad98vdpaOtNScqRwrLYFKE4XkjWbDcTLkYF915v+1UUmQr/vdcdG7fwtahzYmCk1K/qKX8SGbwYUbZKjkMtHYOv4IT5ez/IGUTGnP7auSAYcdBYWotV4zrx1ge65hzIwlr7zEmDXHACidlaRqiKIa3ncgKZqpFjChMlplEqbvHHf2mQKlKrAkMlhOFGtL9MXHr+qQRWEJePfUX7yH+gpSB8/Rx/ZmhNAsSt/aIkYHJCPmJ7lV2gWKKNjAkSn88e6FnB3fgIifS51fi4Dc8e0iAL5HB7G+sc/8hEbnXY/CvEeXIkOYZWMSERogVFQBtYK/iUlXRG+kOxZABp3YY4L95L4yiHyEoPvkT3eMFvQk4jyLtAhuaiOFZGZwcxYEKgIwSq6YsIeLRdbGRRGMG88RNhpqUI3M/R9/nu4Wdd7IOuu1WONsPI4Ctrm7zUFLuwWNu4o696fl0eue2EQ+waucNPisvTpYPnGjFb80aaheKexcvchemONLEnmz7Abe5mm89pYlKiK6D6NtFMF5FSOAKSmcmHywBnVI0SXh5o60bT8XRbdSNOnLqnQ9r4XrCE634BpD8UpuI9RCMD9MchVEq319LhUxTNU6h0kb
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(376002)(346002)(136003)(396003)(44832011)(66476007)(2906002)(83380400001)(16526019)(26005)(66556008)(36756003)(31686004)(86362001)(31696002)(16576012)(8676002)(6486002)(8936002)(956004)(478600001)(53546011)(316002)(2616005)(33964004)(166002)(66946007)(186003)(966005)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?SFpYVUU3L0U4NTJaem9EU2plVjRmejlGVXdMMk5aTWoreGRyQjBmSG1WZ21O?=
 =?utf-8?B?T1ZvTUxITUxtcHR6QmJWaTladDYrMCtWS1FoZWo3cmR1VjhVY3F3ZWZ6bXNK?=
 =?utf-8?B?WHcrS2tBOEw4UjExL3FTSUEyZzh4Mm5KejFMenhaTU4rZlJlQjE2ZHk3dFZ0?=
 =?utf-8?B?TkdLS1ZQaGR0VXpQYVZCenV5bjBRaHFvdnVkQUZZZ0xOVnFDTW5EVzd3TkRX?=
 =?utf-8?B?K2lkQlRtRDc5NWtDTGFqL2NFRHJPUG9HOHFkTUh1OXg5OVExQVFIWDVlYStm?=
 =?utf-8?B?ZE93NlJsOXVib0xCQnJYZkR4UHNQYU15cmU4dmNUQlJyVmg2ZGVWZWYzQTBF?=
 =?utf-8?B?MUg1U0Jrb1ZHOXZkSjlNSGM3OUVVWmRTRFdaMEdRS1BVTVlMTnZWZmhwVUc3?=
 =?utf-8?B?YWlJOWxvT21hNkFTVEMxaGJMUHNDczd4ZU5WN0RZYUh6QmZ3eGFsR3cwRnFF?=
 =?utf-8?B?V1lQYjE3aWZYaWx5c1ZLVE1HQVUzQllzeVdqK1R0M3VzaytNQnI0MkpYbnR0?=
 =?utf-8?B?SGUxMnloU041OFZhKzJJR3JiVmprSzZpaWV0KzlKeXg3d3RvVzhobG9jdjd6?=
 =?utf-8?B?end6Y1JTVnJ3MjRraHZXV2E4S3d4VGlHV0lTQUsvV1k2NWQ2OUsxOTZSVm90?=
 =?utf-8?B?dVM1bDJzU3lNR2FpYTI2VXZQbHJ4UnlFVFhpL21Dd0c3ODJDcmlCYytJYTNP?=
 =?utf-8?B?UEtwNy9wRXF5UVNVSzg3RG03b2xYSTUwaUZIOThSVlBaRVRBZ0hmU2tqVDl6?=
 =?utf-8?B?UnR4VCtTODUxT0UwdTlBWFlSbXFoM3dic3p4amVtSWpiZlFEVFB0djl5b3ly?=
 =?utf-8?B?NEJaZkRKNGZZUFlscWNvbzRHaStncVBSTlpCS2F4TXFZdVIybmlEYmNwQmJW?=
 =?utf-8?B?VC91dTRHL3VQcWVHREJqbzR4bW4yNmJBdzl2TTBZUm5mVTZ2eHlPbkNDMVVM?=
 =?utf-8?B?V2RkUW0xMzROT2RrcXJLYkVLUVV1aFd5TzU2emlYMzIxK3VTWkFzUWhaWWdo?=
 =?utf-8?B?OVFleXVHMVcwMHdSMjhERUhpUWsxU2FCNmN5d084eDc5K2IxaTYreWxyVEFT?=
 =?utf-8?B?NTdxS0hRNXBRNE9oV0MvVWtqUE43b0VHTDMyelBFTXprS1pnM3hWNFN6Wndl?=
 =?utf-8?B?RTZMSUQwcUZOV3JmL0F0QklFdjN3TXhOR2IxVzFaVk9DNWZEYk14eW5ZR1NY?=
 =?utf-8?B?ZG5Eb1JIcmhnS3lWc1RuWHR6U2ZMbmx5U3lJU1BTejlYYXJOS25NeW9OeW5L?=
 =?utf-8?B?ZHNHZVNIU2djdXo0UFN0MHU5amhDTEk2NGhFMythdUtxUTk4RDZVWWZ1d0xm?=
 =?utf-8?B?YmpJeGFPVUlnZEFFdmlkU0xBTzh5UTNuZ1Q2UTdWU3VKb3ZXRjgyNGV3RDM2?=
 =?utf-8?B?ZEdxMjR0WjBsWFpkWG03N3hlZTRON0ViM0E3c3hTVDBLZGN6R2xwWm5UdXRp?=
 =?utf-8?B?dVdxcUNZeEptWUdmQlBWaVBidHh1MFI1aUlqZDdpc1hNbFRUVVZGT2FtVHp3?=
 =?utf-8?B?L21Zc1A4ZktXUlIxeXFHRzBaMEdndUdXK3BXcHlFSXNLRzA4WkVkZ0NnRkhn?=
 =?utf-8?B?bkczZExjUjFVcjlmS0pVczJhS3dBVmdLYkE5ZUxpRm02c04wUFc1cGNPR21S?=
 =?utf-8?B?dWhvamVyQ211T0JvVkZvSm11UHhsVDF0eUtnMTd2WHdDUE9uVHpwb0xzSG44?=
 =?utf-8?B?Yk9haG1KbU1NM3BYQmZXL2VzekpKOE9ubUZBTVA3MVFPUWZVNXdzd2RpdnVz?=
 =?utf-8?Q?ZIP/zcpSkQXuHfiSWmutlR4Bc56oY3xBRIgteI6?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c073b5b-71be-43e7-a98b-08d8e23b02c2
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 14:03:55.2403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UHFAx+JDMb1VRNAM94uEIV3E7U7GaIkIMGcX1FRlGEtg3DziESrY2hupouKzgRWaWAypfjXTUbkT2pN4CUB57Q2ThPGe9nfRUZDkwQw4u+g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4103
Content-Type: multipart/alternative;
 boundary="------------AC68F6187E831A5E855B7242"
Content-Language: en-US

--------------AC68F6187E831A5E855B7242
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-03-04 8:05 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 2.5.1:
>
> - The ``context.path`` is reverted to a set because otherwise it
>    leads to false positives for non `numpy` functions.
> - Don't transform dataclass ClassVars
> - Improve typing.TypedDict inference
> - Fix the `Duplicates found in MROs` false positive.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-astroid_2.5.bb => python3-astroid_2.5.1.bb} | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-astroid_2.5.bb => python3-astroid_2.5.1.bb} (89%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-astroid_2.5.bb b/meta-python/recipes-devtools/python/python3-astroid_2.5.1.bb
> similarity index 89%
> rename from meta-python/recipes-devtools/python/python3-astroid_2.5.bb
> rename to meta-python/recipes-devtools/python/python3-astroid_2.5.1.bb
> index f69d85015c..84315767d3 100644
> --- a/meta-python/recipes-devtools/python/python3-astroid_2.5.bb
> +++ b/meta-python/recipes-devtools/python/python3-astroid_2.5.1.bb
> @@ -4,7 +4,7 @@ SECTION = "devel/python"
>   LICENSE = "LGPL-2.1"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
>
> -SRC_URI[sha256sum] = "b31c92f545517dcc452f284bc9c044050862fbe6d93d2b3de4a215a6b384bf0d"
> +SRC_URI[sha256sum] = "cfc35498ee64017be059ceffab0a25bedf7548ab76f2bea691c5565896e7128d"
>
>   inherit pypi setuptools3
>
> --
> 2.17.1
>
>
> 
>

--------------AC68F6187E831A5E855B7242
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-03-04 8:05 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210304130554.32308-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 2.5.1:

- The ``context.path`` is reverted to a set because otherwise it
  leads to false positives for non `numpy` functions.
- Don't transform dataclass ClassVars
- Improve typing.TypedDict inference
- Fix the `Duplicates found in MROs` false positive.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210304130554.32308-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-astroid_2.5.bb =&gt; python3-astroid_2.5.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_2.5.bb =&gt; python3-astroid_2.5.1.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_2.5.bb b/meta-python/recipes-devtools/python/python3-astroid_2.5.1.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-astroid_2.5.bb
rename to meta-python/recipes-devtools/python/python3-astroid_2.5.1.bb
index f69d85015c..84315767d3 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_2.5.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_2.5.1.bb
@@ -4,7 +4,7 @@ SECTION = &quot;devel/python&quot;
 LICENSE = &quot;LGPL-2.1&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=751419260aa954499f7abaabaa882bbe">&quot;file://COPYING;md5=751419260aa954499f7abaabaa882bbe&quot;</a>

-SRC_URI[sha256sum] = &quot;b31c92f545517dcc452f284bc9c044050862fbe6d93d2b3de4a215a6b384bf0d&quot;
+SRC_URI[sha256sum] = &quot;cfc35498ee64017be059ceffab0a25bedf7548ab76f2bea691c5565896e7128d&quot;

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

--------------AC68F6187E831A5E855B7242--

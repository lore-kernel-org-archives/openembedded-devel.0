Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.54])
 by mx.groups.io with SMTP id smtpd.web12.1072.1614621042560195985
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Mar 2021 09:50:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=F4VRR0jW;
 spf=pass (domain: windriver.com, ip: 40.107.236.54, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bPZtKwsEfHGFN6mhMPto1cnUaJFKN11PnuLFgqAUKg0d7JPWVAM9pMFqFUPN/Jc0slc2a/jahPxuOAzuAJcD3b8g/kOYiZGZ34p4qtZgPxtgeI84Ld2LR5je6fNGbJ9EpiStTo12VvZB61lk7+Pajwu5ZYwvQEE3vvv32uVsWjZbN0wRFk/Ye5xCHEj1Rni57/PTQhaLAQNxEaproxu26XTugukMAVu26ERoqRcehJDN7hQEomhxcHMG5GB2YKCZHMpOhxp/R7viqg2g9npERe4/i7VhucIqtiSWMKpAapXojWH+6Wu/Ot0ViBSIUV6I096KX8WDR0Ns1UsdeTSkEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QkHOKZp2Vqo1qec5nNSBtg7BjVI+fcaRAAK7Ss5qEK4=;
 b=oTH2r5+lALvVqgBsaEuQ2l3K9KtfgQYqD37G9kT9s0G6zWhHORjiN5WK5k9TeGhz/jzBrlwZOeEaRQfuDH5nUlSX3pp/P+kcTkaz0jVcCA+S4z7wT0FpsI1+apA1BQpkyIHrD0w80kGoCrbhitEcaL44Wb7dguegMaLubshtzJbAfFTaQDiC+j1H8bgF/jvy2hvm5UrbmhJ8q1eee+48SuRcVlG2cK4M9+caJtm0ZNLtqu6TdCbOH1wY1Ivhv1m1j3ZjN5wqYNEQuh83/CHWLMYFYDKBdyIbhPOp7fHF3cJrAj//kdsCdw05ZYeQ9XJRVPZGu9fRzqldN0f0AcOJTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QkHOKZp2Vqo1qec5nNSBtg7BjVI+fcaRAAK7Ss5qEK4=;
 b=F4VRR0jW9hx8A/RMLJLm1O67ZFIa4sMmN+giTfMJSZhFxLRNlaAGmCxTp/C6vp3lOZlPZaH8qQV7ee4f3mp+TlxA7R1XEhBQNFLkMUA8GYgkIvRV560Nxyt7mdwi8mTdRk0TGzXRQqvWLGujDnRSAJyEMNsDhjbEqX5LCdZNeq8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3303.namprd11.prod.outlook.com (2603:10b6:a03:18::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.23; Mon, 1 Mar
 2021 17:50:41 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3890.028; Mon, 1 Mar 2021
 17:50:41 +0000
Subject: Re: [oe] [meta-python][PATCH 5/5] python3-pyzmq: Upgrade 22.0.2 -> 22.0.3
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210225160544.8994-1-leon.anavi@konsulko.com>
 <20210225160544.8994-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <94e25079-153d-00f4-6f5e-ffb75d56eafe@windriver.com>
Date: Mon, 1 Mar 2021 12:50:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210225160544.8994-5-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN6PR19CA0084.namprd19.prod.outlook.com
 (2603:10b6:404:133::22) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN6PR19CA0084.namprd19.prod.outlook.com (2603:10b6:404:133::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend Transport; Mon, 1 Mar 2021 17:50:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b926b34f-1a7c-48f8-68a6-08d8dcda8784
X-MS-TrafficTypeDiagnostic: BYAPR11MB3303:
X-MS-Exchange-MinimumUrlDomainAge: openembedded.org#6614
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB33032BE29836EA8E4B8FB71C9F9A9@BYAPR11MB3303.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:107;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Zpa86LA+af0T7xIMsTgsvwxXrPHoSKlZzt42Nm8MI8/5Xq5kcG2nsLM8TFX2j+n5MvxPVg3aQ5C+hWYxmurL0gljfB5iB496jZwFfBSjx0woVDRD4vqiFTlv0Fq6vY82kW8KdzIhiWc+GinR8uNycv21Yd9Vxx/oqv3uLD9FNdVzJnA+HB7QH5nV4+G1AWgD6zjNNJMn1O7hWz23xrKtuWCVXzmCaw/5ELZbirlbm8wrvX67ZQtyqHyF94tZty2PrVbfstdqGSj9fPb3rXciQ9dsceiwDF7dHbFwCg1Zyg9k6jvmSuvmeaOE8/oS4ubXvyZELgY22eJH68lOKz6a2Qq1TJbkRaY0zWLIENzEjxmPGkbnFz1M0pBo6LwbboHqPPRlLKqWGuIeqqXWbzlHCpF61nbOXtxkyQUCMny/S1lA6DKXS70N5SXLcQ75T4DKlskGCvp1ORujyaqSGLe2il0HDjTeISA44JMGl9uGmtCrT84108eEZVKnhHM3GWt+e3gmHVAwjwddt0niJTR3wdDoJ/d1/+e9LcEZehG+TPyDpZwxbelp/zPe0QdKDZh5u1BpTvtzAQao8cRRzq10m3aS4HxDnxlZttac7PJ8on8Rb5iJqYrIk5YHkpPMpbJ6qTgPSQr9cvQEFHjtZPxvCOtUGogZX+Ky6FXXVDarJHOsEAI8pGSmrxMABXh8YHqR
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(396003)(346002)(376002)(366004)(31686004)(66946007)(8936002)(26005)(8676002)(2906002)(6486002)(16576012)(66476007)(316002)(66556008)(86362001)(478600001)(5660300002)(33964004)(83380400001)(186003)(956004)(36756003)(44832011)(16526019)(2616005)(31696002)(53546011)(966005)(166002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?VlR5YjhITytRdTFsRWpUcmFvdDB2TUhSZllFOHRNWjJzR3FTV29zWmQ2TkJ3?=
 =?utf-8?B?emlwWmtlNTJkV05McG04alpCMEFLRGJNOFJsaE80UkdYY0QreVdWWms1U2hQ?=
 =?utf-8?B?TS9oeG5nVmxwZmQyaVJxZUdBSkRWMWprV1k4SmsyaU9VZno5anN5dGpMTFVx?=
 =?utf-8?B?ZElLSjg2cWxzOW14dzNWVWExcnhLQlhYbnpLblNsNytFemlzU3l3dU1vWEpK?=
 =?utf-8?B?TGFDNlBpb3VUQ2JNb3ZtMWx6RU9OZ3VUTWpUOHUwWmQxWDNRcHdwNU90cUdr?=
 =?utf-8?B?b2x0ODR0eVF5UExuWUhYT2YvQ2pUNTFXdWpXZFllMTNpQ2hrbmdtZmRRYjBJ?=
 =?utf-8?B?eGlWQlBHb0lvMU1kalBCNWx0MWxwSlUzSWpxRnc3VnZnWHRCa1kxYWd0WFJK?=
 =?utf-8?B?Z1hwcjZEdmtLSEZRaE1ZMmdsUTFTenNIMEpDbjJjVjBEbzNReVBOZm1lRDND?=
 =?utf-8?B?VkRpN0lML3BsT0dLakZiVkpzQ0QvZ3BvRytIL1ExelVRU3VnZjZ2ZXdjL3Rp?=
 =?utf-8?B?ZEpyNHEzblFobGxlNUUxZjFEM3JHVjc5bDQrcGZFbUZtWDhVS2tuYTZoaTk0?=
 =?utf-8?B?NTV2R2lxTmtBTHUranpsdjJwR1BkVHlDK0RsT1k2RTNQc0xaYXRiYzVXQlBn?=
 =?utf-8?B?UzNpMi92MVhoL1hRQUphMkJmWXZ3M09PYUJGVnJIYkptREt6UkdrYjdqV21w?=
 =?utf-8?B?UHF6ZGIwRWh1ZzR4d0UwWC9HSXNHUnEzWUlhdVVPazRPVG1VcEdJQlM4Nitk?=
 =?utf-8?B?dWJtWGM2ZTI0eW5wMUI1TVNnMHU1QlpHUE9zcmFIYWRybURESnFyanp1YjBn?=
 =?utf-8?B?eUJ3ekdFL1RPN1RwYTBCazNOdU1WSnVxQThBUHkrWkoyQ0k2SXIzWE9DSHJ1?=
 =?utf-8?B?OEpjTjZjUnJFY05kR2tsdXQ4bVVhMjJhaE9aaXFEQjM5SldTSVRvTkJWanFi?=
 =?utf-8?B?c1JsdDhRTTh5TlNyaDRFNlB2NWRjM3M0WVJteE1TMDFNdks1VmR3MlVCOEdF?=
 =?utf-8?B?U0NTTEtrdjUyblRvZlN6QnNoRE1Xd0FYdmdvQUJHTklKZDlNWHVFWUp3UFla?=
 =?utf-8?B?bVd2T0pKWWxKcEFGVm42Znp4TGRsLzNtQ1NKZDlhdFQ0SHVRTmFmQ0FEWmYz?=
 =?utf-8?B?VjZNa0hnSFcyUjFWME5YTTBwZGRHMU1wRkJFTFZzTDZyaHNLUWxINURqRDNR?=
 =?utf-8?B?Nms2UVJPZnpPaXgrUkJnN2dOR3lLdHRMaWpaVE40NWtXTnd0VzNvT3RBNThX?=
 =?utf-8?B?SzRVbk5mUDRBNGhPb3NrSDBlRGJleEorZGtEMGRIeUl3emh4TTlaWTJKUkpo?=
 =?utf-8?B?RzZTVkNFUkZ1Zy9ZTlR5K0c2bjB5azUwZjUybGk0RWVCdS9IN0lYRmI2ZmN1?=
 =?utf-8?B?UTEyYWM5dnZRZWtWWmQ1bzR5bG10bDd3QzNHTk5XU1NMeEQrOFpCTmdudGRN?=
 =?utf-8?B?L3FJS0lpQTVURmZuTENDZWhCNWd1aFlkVjJwcGxPQ2NDcnBuMnM1M3poemlW?=
 =?utf-8?B?V2VxNGJISnJxUGRhQUdOMGlLelVkc2pWQVRPQkwwVTdhenhLRUtNUWw1Vy9w?=
 =?utf-8?B?NmVnQjFLRForWEgxN2pzR1J5MDRia3VmK2d0dXZPVWVyWXhKZEs3Zkg2bTJG?=
 =?utf-8?B?Q1liY0thMW42VmlFaStXVnRFQWRQOWJJSGZuTm1CZUZZVStyb0o0Z1BVRXd6?=
 =?utf-8?B?Mnh4eGNXdW41Wnc5b0dtUnNZaVFaajR3alV6Mk5NbGJWRUJTR21iVml0aUJX?=
 =?utf-8?Q?YE1l8ZnfUizfYFFiyzKvhBV3/9ukbJB2S9Tu1HY?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b926b34f-1a7c-48f8-68a6-08d8dcda8784
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2021 17:50:40.9157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xu5XgNt5q5FPr4MzWKxIuTjIr43EIyZtrfSPwQGMMKt/4XB7urvjfNueBOw93RtM4fA9W6poQei8uB/LGSbi7B9nUGPODXSJv3BkvJTxNTY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3303
Content-Type: multipart/alternative;
 boundary="------------39356F8F048501509AB00EE3"
Content-Language: en-US

--------------39356F8F048501509AB00EE3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-25 11:05 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 22.0.3:
>
> - Fix fork-safety bug in garbage collection thread (regression in
>    20.0) when using subprocesses.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-pyzmq_22.0.2.bb => python3-pyzmq_22.0.3.bb} | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-pyzmq_22.0.2.bb => python3-pyzmq_22.0.3.bb} (91%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pyzmq_22.0.2.bb b/meta-python/recipes-devtools/python/python3-pyzmq_22.0.3.bb
> similarity index 91%
> rename from meta-python/recipes-devtools/python/python3-pyzmq_22.0.2.bb
> rename to meta-python/recipes-devtools/python/python3-pyzmq_22.0.3.bb
> index 555f27cb49..dbf8e6446c 100644
> --- a/meta-python/recipes-devtools/python/python3-pyzmq_22.0.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyzmq_22.0.3.bb
> @@ -8,7 +8,7 @@ DEPENDS = "zeromq"
>   FILESEXTRAPATHS_prepend := "${THISDIR}/python-pyzmq:"
>
>   SRC_URI += "file://club-rpath-out.patch"
> -SRC_URI[sha256sum] = "d7b82a959e5e22d492f4f5a1e650e909a6c8c76ede178f538313ddb9d1e92963"
> +SRC_URI[sha256sum] = "f7f63ce127980d40f3e6a5fdb87abf17ce1a7c2bd8bf2c7560e1bbce8ab1f92d"
>
>   inherit pypi pkgconfig setuptools3
>
> --
> 2.17.1
>
>
> 
>

--------------39356F8F048501509AB00EE3
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-25 11:05 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210225160544.8994-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 22.0.3:

- Fix fork-safety bug in garbage collection thread (regression in
  20.0) when using subprocesses.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210225160544.8994-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-pyzmq_22.0.2.bb =&gt; python3-pyzmq_22.0.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyzmq_22.0.2.bb =&gt; python3-pyzmq_22.0.3.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pyzmq_22.0.2.bb b/meta-python/recipes-devtools/python/python3-pyzmq_22.0.3.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pyzmq_22.0.2.bb
rename to meta-python/recipes-devtools/python/python3-pyzmq_22.0.3.bb
index 555f27cb49..dbf8e6446c 100644
--- a/meta-python/recipes-devtools/python/python3-pyzmq_22.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyzmq_22.0.3.bb
@@ -8,7 +8,7 @@ DEPENDS = &quot;zeromq&quot;
 FILESEXTRAPATHS_prepend := &quot;${THISDIR}/python-pyzmq:&quot;

 SRC_URI += <a class="moz-txt-link-rfc2396E" href="file://club-rpath-out.patch">&quot;file://club-rpath-out.patch&quot;</a>
-SRC_URI[sha256sum] = &quot;d7b82a959e5e22d492f4f5a1e650e909a6c8c76ede178f538313ddb9d1e92963&quot;
+SRC_URI[sha256sum] = &quot;f7f63ce127980d40f3e6a5fdb87abf17ce1a7c2bd8bf2c7560e1bbce8ab1f92d&quot;

 inherit pypi pkgconfig setuptools3

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

--------------39356F8F048501509AB00EE3--

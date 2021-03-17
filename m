Received: from NAM04-SN1-obe.outbound.protection.outlook.com (NAM04-SN1-obe.outbound.protection.outlook.com [40.107.70.80])
 by mx.groups.io with SMTP id smtpd.web11.204.1615993202737989082
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Mar 2021 08:00:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=XmMKpj0E;
 spf=pass (domain: windriver.com, ip: 40.107.70.80, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JDFp4QiJJsJcIi01AiOxeTBI6bv6Bk+HljKwYmKM+5krmfjqD9xb3ti0Hq93Q8UJdqh6VgQ/FenkA2X8t8LmgtYuO/WuM3SFtM+P7fU8aGlbZAA94j62ZN9DVcp+1PdFRy1xSnsVGdepYTMK0EuGcUD3lf0ylMcHskua8Q/loNJaw4nxk2+o7tTnz9eteyKxntOW8VPQT+cvDQe9XtKS5XH1a9SEtUpofPRcl54F74l+dgsMZJxuNz9HLFrrf8izGSA0rzy+Ni7jkTPXFr4FNzVrkAvccudk0Wd4sOfFq6y4p8UlPS8Fq6KOhzcuB9zxVK2Vqu1eJSLUir5Eju2LIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oiXrXR1G0Xg3Rd7uXbmlp0hLYQd3ReR62Uxrj8STjbU=;
 b=BiolUvlSFzA4qdqUnkdzuHK+CMaahDYkOngg+RIAuzYlKfq1MdBjqeI4csRDIuIw7/KDD5XgGfFPXjQ8vqiIvP6Tk2pR5vkBGJ1RatuzjEbr+0NHc/6bBazYbTsdKBnDBE+2Wt+BOYFAZFFqA8U/GDL7ecyxEMsjiXnjDULE3DMgJBNopngBQMISHgRBzQZilIxVtgcYBC3GHKBu90S1ZsvlrVVY30loBH3aKXt1lgRCgBHG76tIChixj21xg1dElzd1uZCyDzcFOW722eeQvvM2TeyCtm+XpEr+oo7bSyLBv+3uyZZRFY23MC5nUxoz3pB1dvjJxUFDY7vmt4SHfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oiXrXR1G0Xg3Rd7uXbmlp0hLYQd3ReR62Uxrj8STjbU=;
 b=XmMKpj0EFjxPZ8beXhyhUWWmKMvdkfkkPDNo/WTTahQTrxfvl8YdJUd9RRBXnquk+L070lu/krhAnCkw6ZWuOHjR+AB9890oIvOKG+0mW2ZwgVeaMGj0t/DC7npvs9YlHZS8Ld6Qr/jPZVALQhIL7qio34BAnLtC+LBcmFmA3SU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3398.namprd11.prod.outlook.com (2603:10b6:a03:19::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 14:59:59 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 14:59:59 +0000
Subject: Re: [oe] [meta-python][PATCH 1/6] python3-pulsectl: Upgrade 21.2.0 -> 21.3.4
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210316083744.17558-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <342e727f-5ce5-da2b-fb77-6abcebf0c268@windriver.com>
Date: Wed, 17 Mar 2021 10:59:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210316083744.17558-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN1PR14CA0023.namprd14.prod.outlook.com
 (2603:10b6:408:e3::28) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN1PR14CA0023.namprd14.prod.outlook.com (2603:10b6:408:e3::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 14:59:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d127c8a4-35ed-4894-862d-08d8e95555da
X-MS-TrafficTypeDiagnostic: BYAPR11MB3398:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3398F5681F5A373857ADD5799F6A9@BYAPR11MB3398.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1002;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NEeZahX0VhLBkOWOmCOhMfPbwtRSucIFjcTqD5ZkY3EJ/M+Jlz8JWGi2Bj2mEIEONl6BKOsmmre+l8BnzQcrvcl9M1xCb3Z6xkn0SKgxsbGW+8WSmwIfd1M0fAHvS8EJJudLzKylod6vZ4T1vjayN6k5KIPNBbZC8K5jxCcm1WzJol0uO0JymzCPKlh3vy1cTLcRuPUPrJaDwRisM8eEmMqJyWssKW7eLWkTCFslQ9iW3wDXtSnMv7pFd8dgGe4p4cXOGhEdyM7q3f49YtijkwMFs2pfpwD7GWeLDD0S9QqbqK+CZ017Mo0IDGpw/L/Mu2AiLHg8hwle7DTADqK8D5mxXZAvP2iGH7r5E8qqqKgB0t+LiEhQpqglMneSiTO0Q2UEBg+9t+9MPgRmmR1qmiaB1UnhLa2WRMcC18DPByc02+7jBQyaqnLHXq5IB6d+s4rkMa2UwwH2Hrd6zuY/MUDjIB4A1hztEK8YTU3aKGyoMP8ZlzJDcNCUDJKVMXviGuX0eFe/gukittDIyo916P68KczSEm+NJ0U2zuzx+tC1BjUO5aadntXsacqm5eLp8O28fBnXNIfzmtc/6SQe8y3qGLxj8PdcDg9jLXDnwLxbxJIPKALXRWNXHTFrTlVFDScwfBoacEUfwJWiaRUb1HtSUB6qadmIHMeXNlAgVMUJrm7I5LoyzmxRwgmfvwoUUoYoX1nota6PyAHwt3SZZ9ZcdWy4ZzSiLBUZ3GQ6IDo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(39850400004)(396003)(366004)(346002)(478600001)(26005)(31686004)(31696002)(8676002)(33964004)(53546011)(956004)(86362001)(83380400001)(166002)(16576012)(186003)(16526019)(6666004)(44832011)(966005)(2616005)(316002)(8936002)(6486002)(66556008)(66476007)(36756003)(66946007)(2906002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?VmNDaitOTmRaZ0JaSnlNVTNQRk5mV3BDeFVzbXJkMWU0Zy9VdmRSNHpiQTRO?=
 =?utf-8?B?alVMalVHM2Y4cVY3MGwrQWtoMm9VTE1iQ2FibUJoaTdtOXROWmZOU2xOTjBy?=
 =?utf-8?B?TWpTMkN6cnpmaTEvTXlmeWQrSVJ5TENDaElTZ3Y4ekZZZE1aMnJyMzhhNWVh?=
 =?utf-8?B?VkdjMnVZSjhNTmt5SW1ReWd1VnEzd2xrZC9DMWt4c3J1OGVyUG9qMGNmNUN3?=
 =?utf-8?B?NXlrbE10SXZTTmxNU1hxdTdibTI3ajd6R1R4Y2FWOUtUNGFMcm1LNkVJY2tE?=
 =?utf-8?B?VTBpSFlzMG15V25TVjZYcE9pek5halZqVFQ3aDlaNGtWeGFDVmx1VzdScWsx?=
 =?utf-8?B?bE9ZM2FzdStTVEtLeVNwME52dUhkTng3NlNObU1sZU9IN2d5dXRneFdHUVkx?=
 =?utf-8?B?QkZxK3k2N212T2RqL1lyWTRoZjA1TlZqTXc2Q3hpZ1F2L3ZnQk9kQ29oVE5X?=
 =?utf-8?B?WHYveVdaTTB5VVV1TXFnc1VXbFVnSzFIckk2aEZ6d1pHOCtoS1UrVHIxTmlU?=
 =?utf-8?B?TVE5YlpPYTJZVXBFNm5iQk1jRlR6ekZGclVXQjZKeTFEcUhtSnhTTDdGeTZn?=
 =?utf-8?B?Ky9xdTZsYXY4TDVjMkppV3E4ZUoxUzNNTmMwVzRxeC9LdHZlWnoySmhvckNN?=
 =?utf-8?B?aVJkTlBZbm4rUWZVdWw0bXBvYlI3WFlJV0lUdmRpT1FQM1FtTnVTbzQ5dmND?=
 =?utf-8?B?M1VzSjRFUHRJQ3V0OVgxZnE0WitJbUlMYXVzaWpSdmtkbW4xVGllLzVZSUYv?=
 =?utf-8?B?UzI1ci9VZnpjZzI5ZzQ1RTBhcldTZGlBS2piMWJrK040b1VFc2U1T3l1UkZU?=
 =?utf-8?B?Y0tDeUJRbFVVWUQvZTVPRkxEcS9PMjFjd2l5aTBwZFZCMGdJcEJnVmYyT2Jo?=
 =?utf-8?B?WkhRdU00cEk5ZytvTlBJYlpjRTJtVSsyckhxM2pscWlxaXU1MnNuNkk3dm05?=
 =?utf-8?B?U2h3cURscC9uVERnRHNkVE1hR3JxUy9RSGV1Uk5pRVJ1L0RRUVVuOVVhdFRX?=
 =?utf-8?B?WW5nTWs3UElpb3o5TDRwc2I1Skpmd01mR2ZzdWxaMWJ1RENlYzljZHNHV2Ey?=
 =?utf-8?B?S1g4N1NnZlRRSTdLdU9YekNibU1Qa2EzTXI3ZTZ3QTNML1pxWlNVMXhhaGFU?=
 =?utf-8?B?ZGV2d1piNDZaN3JZUkFiL21CRjlrVjluUTRhdkZUN00vVnhNQ3QxOEZFSENI?=
 =?utf-8?B?RjgydE1mdHdWT1BnN09jd3FFQzQ2R2w2RG1ERURJbVpxcFhCaHowRjlyMGx3?=
 =?utf-8?B?aTBxc1IxaWoxZVFGNHVCVTg5ZU5hWXVGaTJMNEFOUXZHNU1DdC8reUdkY25p?=
 =?utf-8?B?dlk0eXR0b1dyUmN4VUFnTUxHa1BUbnVOUVdJb1c2VWJEc2hIZlAvSDkwNVRi?=
 =?utf-8?B?eWNQM2JvRnpjc2ZyZnU2RFN6bDd2TXlyTUdQM0dOSUYrWUN3R0J3SXJwSnBj?=
 =?utf-8?B?R3J3azN4ODBMeG9LMnlHSVhXMkV4MDBwQyt5ZW1LOVQ2MTM2UVZwV0JaNEtt?=
 =?utf-8?B?Q2xiMWFaWXBsNHlyR3VMcnhuRkx6Q3plcnpYRnRKeWRwM2Y4QmFFU29yM1hH?=
 =?utf-8?B?eTF0dFl5VDR1K09pUlVvcXRSWFp2M09OMGw5eEptamhyeUhFSGdLY25mdFJI?=
 =?utf-8?B?S2Y5TUtzSWlQSldZK0lGbnk4ZjV2SjNqUUlucnVwazRnL1I0bkhPQmIzSVRu?=
 =?utf-8?B?M2YzYXFxNXVmSWtCQzJaS1phVm96RCtzeW5hc0xCWmVJTnhxMERyVG1GYmNS?=
 =?utf-8?Q?zb/s6gNtmKdnsJiomzPDgVj1AwU4P8vd82C+3NQ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d127c8a4-35ed-4894-862d-08d8e95555da
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 14:59:59.6420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: auSzSL9WEpd516zMgmZQSnDCf4vOF3x/xq8NYRhTNbA/V3kt+Jg3OFAkuAwLL5gr6u/z5EZscK1Lld4Q8lyHP0b4iPN/9v+QOAkkJ+1WN6I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3398
Content-Type: multipart/alternative;
 boundary="------------057AFB486D57B367A38A53FF"
Content-Language: en-US

--------------057AFB486D57B367A38A53FF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-03-16 4:37 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 21.3.4:
>
> - Add timeout= option for connect() method
> - Expose "base_volume" (alsa volume level) attribute for
>    sinks/sources
> - There is now https://pypi.org/project/pulsectl-asyncio/ module
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-pulsectl_21.2.0.bb => python3-pulsectl_21.3.4.bb}  | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-pulsectl_21.2.0.bb => python3-pulsectl_21.3.4.bb} (84%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pulsectl_21.2.0.bb b/meta-python/recipes-devtools/python/python3-pulsectl_21.3.4.bb
> similarity index 84%
> rename from meta-python/recipes-devtools/python/python3-pulsectl_21.2.0.bb
> rename to meta-python/recipes-devtools/python/python3-pulsectl_21.3.4.bb
> index c99a5507f..a4455eeb1 100644
> --- a/meta-python/recipes-devtools/python/python3-pulsectl_21.2.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pulsectl_21.3.4.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/mk-fg/python-pulse-control"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=f1d10048469ff90123263eb5e214061d"
>
> -SRC_URI[sha256sum] = "282be9ad1a9add961f0bbafa8e19723ac397a2eec5e14fb8cd6c51ff29962715"
> +SRC_URI[sha256sum] = "faa8b9336237565990298f20870e13dd1678a4586847ca5a7ff2abf10752f356"
>
>   RDEPENDS_${PN} += "pulseaudio"
>
> --
> 2.17.1
>
>
> 
>

--------------057AFB486D57B367A38A53FF
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
    <blockquote type="cite" cite="mid:20210316083744.17558-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 21.3.4:

- Add timeout= option for connect() method
- Expose &quot;base_volume&quot; (alsa volume level) attribute for
  sinks/sources
- There is now <a class="moz-txt-link-freetext" href="https://pypi.org/project/pulsectl-asyncio/">https://pypi.org/project/pulsectl-asyncio/</a> module

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210316083744.17558-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-pulsectl_21.2.0.bb =&gt; python3-pulsectl_21.3.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pulsectl_21.2.0.bb =&gt; python3-pulsectl_21.3.4.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pulsectl_21.2.0.bb b/meta-python/recipes-devtools/python/python3-pulsectl_21.3.4.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pulsectl_21.2.0.bb
rename to meta-python/recipes-devtools/python/python3-pulsectl_21.3.4.bb
index c99a5507f..a4455eeb1 100644
--- a/meta-python/recipes-devtools/python/python3-pulsectl_21.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pulsectl_21.3.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/mk-fg/python-pulse-control">&quot;https://github.com/mk-fg/python-pulse-control&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=f1d10048469ff90123263eb5e214061d">&quot;file://COPYING;md5=f1d10048469ff90123263eb5e214061d&quot;</a>

-SRC_URI[sha256sum] = &quot;282be9ad1a9add961f0bbafa8e19723ac397a2eec5e14fb8cd6c51ff29962715&quot;
+SRC_URI[sha256sum] = &quot;faa8b9336237565990298f20870e13dd1678a4586847ca5a7ff2abf10752f356&quot;

 RDEPENDS_${PN} += &quot;pulseaudio&quot;

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

--------------057AFB486D57B367A38A53FF--

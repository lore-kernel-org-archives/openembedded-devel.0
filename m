Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.57])
 by mx.groups.io with SMTP id smtpd.web09.76.1615992793010263707
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Mar 2021 07:53:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=AqDyFk6B;
 spf=pass (domain: windriver.com, ip: 40.107.220.57, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bB2kH2zbr6iXo62Conf06oZdXGNEC1QghwDLzwaWC5dPgDXJ+D9TsMZPrl1fhdRoD4jRRZ6rDUDbSOfJkFzc+doyrmigf5AW393fxwMI4PBDJyf6q/dXcxIC/Vrif+22rwX7N9kQXwARcLnhiug4G+3K/AJPgRyILUwnHEpDaIb2PWfydC/+YYpW40GEPWZa4x6H6a8KIj99z2oioWo54ZYKcJ6FCWmfogRdU9s0Rj0myUg/gGIMRj8SGMq4ZtZWv6/sQ5OiP5FNMjZh+KAr6EuYW2SqVcwajvNvT1TExAy62Qh/MW6VOywi3l74F0CC+4p4hUZdSxdiqnSADrpvgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c5OWFBEhLETDVrf48/0ZaozDMLKenr9mGR7KuT8MQKE=;
 b=RUAigDbkVxW23vLEQ8x+p5JrtOVKtdZEWWU/nfTDRglu5cfeUj80rNumZ/rFRFzIfbC0M/RJVZAvev5MoLHISg9eCLUflsrSipucPK6MLQI3h4m7+3ySIdgass0Wl/WIGrO7oH6io+OUE4lsrW2cAHsUbmSHHnjlVhPpM09ffRJJvE3+1HQ1QQ8zUTx65QoJajnSeAJ41MqWH8MnyK38o/ZKzjE8j//Velm0ot+PI0700WqprRQU4u9e0VpNnbfaViagx4y6G9IHr0zvP+Sl1qmhkBvetfOXgyXy9T+EnCL2a4rZWaOi2CjhcaCZ64DXDs+6al8OZcuwadsvCZMsrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c5OWFBEhLETDVrf48/0ZaozDMLKenr9mGR7KuT8MQKE=;
 b=AqDyFk6B3/img2/qblTBEG6mDr9TRmSrx191ZiI7yLDqICf96ttGPx8PdSQZpGajBFbEhYourcpCtTsiV9wTsQUk411Ft6U4K/5Hi6bLu3iMxVh6+fHvQBt4+MlVZldz/NyQsMocZ4PolXOxhyxXMr6BNfkcl4Q1Zw7hcph3Kuw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2632.namprd11.prod.outlook.com (2603:10b6:a02:c4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 14:53:11 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 14:53:11 +0000
Subject: Re: [oe] [meta-python][PATCH 06/10] python3-pycodestyle: Upgrade 2.6.0 -> 2.7.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210315084727.26812-1-leon.anavi@konsulko.com>
 <20210315084727.26812-6-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <b2b4c1b2-c3b6-0b56-bfc3-91cf3ae4693b@windriver.com>
Date: Wed, 17 Mar 2021 10:53:09 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210315084727.26812-6-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN6PR13CA0049.namprd13.prod.outlook.com
 (2603:10b6:404:11::11) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN6PR13CA0049.namprd13.prod.outlook.com (2603:10b6:404:11::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.9 via Frontend Transport; Wed, 17 Mar 2021 14:53:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e62780c3-e59b-4839-cade-08d8e95462bd
X-MS-TrafficTypeDiagnostic: BYAPR11MB2632:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB263206B524932DFFF710B9859F6A9@BYAPR11MB2632.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:913;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NkUP8TdZwaBp6jVlz3XtmlreqtSx8btQTVZ2xO2nL5O1+P2xO9hAIvjKUQ+Phit8Gj+K25/0YRtLAOqnjmEm1CBTT/itmMmWFqG3A09UQOPQHcBeoukh1Po7zJWB0o0DniOqHSq+ea+td75Bk/lawEVjq4R/B6NTg3mptzxCulL3nVOtF8/nUSz51PIU7ZX5NKldF5+uXcarS0YUqsH++Lz6R/PNioCW90KKNZsueOfrPEJl6KqizTVi9I3N3tNntwOHTW4sb3NlS2ieQgHcf0qcUQQBRzO0R4zgDIt+oZKmNULd6qXv0l+yxsdyaxiDnuelAA6gLWEeqk7FMasSUnEP6mniHWp4F89OA7WfYj9p9k9rRaYL9Y7elfnzP52J6Sy8KXgZ6cC7CXHa1H0T3kvJpkLwCcTg0XTD2gacAvdhaSUpiNAZW3dxLYfnnPJ1Mjl50BdCZqDjYG2maLMPnS/o8ryTaf6ohq9QXerJD2xdZu8AnGLN4Du7Yao2tehsOCutDT34ghXD1z94/QsHdvwE7Q08IThJGmX45DaNwhNKlf7UJXxglF9E49a4ykKziuTo5+wE2AqA3Qoc4X79zptHGW5Xnk0rMJOj2ypJXKhATrSD9IZFcA7ZwB3YvC54FiWX+LuZp/+zdQk6PUBAg2heuY8MCFrc2sSVmE3fxDI7H3gycNaObF496Gkq81xcbmYmHTIqT9i7xgLwWiO8Ig==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(39850400004)(366004)(396003)(44832011)(86362001)(5660300002)(16526019)(83380400001)(31696002)(6486002)(36756003)(16576012)(31686004)(186003)(2616005)(2906002)(166002)(956004)(478600001)(26005)(966005)(33964004)(53546011)(8936002)(66476007)(8676002)(316002)(66556008)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?VEZwQytBdHlHZm1iYmZOem5rcytGTDlHbU1BRjE3VFAwZ21DVngra2UzZS9E?=
 =?utf-8?B?S1hRTERvZ3ZZQ2hvTzZLd2FucWlBMUNYK1VPU3U1bXZqcUZpK2JPaFJnTUxu?=
 =?utf-8?B?RFRIMVhhdFpXempObjRXSTI4a1ByeDRNcmM1Q0ljOURNb2tGQlZUL2l1bURx?=
 =?utf-8?B?Q3N3Um4vQW9wQjBON3FvR2VUb2h3QjVQZWd0Um9zVFR5ZzltQmRQaDRJbmtm?=
 =?utf-8?B?L3lTZHF0ckhqSlJseFdzYnZnbE5BZzNJYkZ6RjNwb3hacmRWRVN4NTFKSVRv?=
 =?utf-8?B?OXc2aDlCUGZpNCtPK1h2YU9ySE5UdTVXWkhPQkJXU1lKTCs2VlhjdGU3dXEw?=
 =?utf-8?B?dEo5Y3NzaU5qazFDY2FlUFFpS1ArUk13czZWN2tuYWovSUE3Rml1cjBYRmFI?=
 =?utf-8?B?ODZuMDBLb2lDZWludklFTzNPMVpmUmZjL0x5SzNHdEFuMkhtYVk3Vm9tc204?=
 =?utf-8?B?Y0hXSTJwT3dESFFlVEY2bG9CQVd1ZDgrKytZWFh0R1g5NXdiM000b2JxVml3?=
 =?utf-8?B?YVJ3SmU3WnhReHk1SHgwZlN2NERtUmdBemxRUURUbnMvWjltK01xOFpTbHB0?=
 =?utf-8?B?RnpFNU8ybWZsZk1XSTVyUXh6UG1mTExMRHRwUmp1bmcwSVEzeFlPelo5bmZR?=
 =?utf-8?B?ckNNYnA3VTJJSHh4cVhqZWZwcWc5QXA1RHVMYkVkNXNSRjBLcUFKeFVnQkhi?=
 =?utf-8?B?NTRhVzc1OHl3QlFRZ3lqMnRkSEFoRGJxd0FNbG5lU1JLN3BzZHhLUmtaK2xv?=
 =?utf-8?B?MGZxdnN5bElwZ3VYbk01bXUxSndlT1F1Z3BPZ0lhekg0MENYS3dmV1ZZa0hS?=
 =?utf-8?B?M2F0cURCZ2w4SmsvempKeWF1TXVmMFZrQlU0aUdjUGhua2lnakI4akxBRUp6?=
 =?utf-8?B?a3cycE1tL2VhL1BWa1NLQ25ST1RSUytCYkMrdTJZa3ZveTNxalhrWHZmM1VE?=
 =?utf-8?B?SzRIdGpWVHlSMS9hYmNiTWZNTnFMYWRvQ3l2ZnFWV3Fma0NrRVdHZVZHbGRv?=
 =?utf-8?B?YW9qNHA2cHNHMUMrdjc2Tkt2VTJGdDllTjVsd1Q4eWJRdnhpMFllSDRLZi9B?=
 =?utf-8?B?ZVhkQmtCV2pmbWNzQlgzMkkveEw1M0dWMW1VUEM1aE1vL2kwSloycUJJYiti?=
 =?utf-8?B?clhhcTBXUGllamdtNHdocTNJWXIwU0xzWFZTMm9zMy9xbGtJaExObGV6TlFx?=
 =?utf-8?B?V1ZObUJIRTd4Q1NxellBWGFUb3V0YldLS0pTMm14OVRobklXT0drWTJEZUM2?=
 =?utf-8?B?U2hjTlRpakNxVkpDSlpVcG9HMDJYZXdCVmpQTzRRKzV1dG45TG00c28wL2s5?=
 =?utf-8?B?TzJKbExrZkFpWURqUjFXYzdzbFVSVnRjdFBtR0xnbXVrTmRmTDlYUFZuN2Rl?=
 =?utf-8?B?Nm5qQTRtdzRlZnJRMW5uS0E0MDgwQVlMOUdrRkpLVEttcUhOV25HeHU2RUh4?=
 =?utf-8?B?YmlTQ09MbXJHSFl0MVV5U1N5R0hSUGM0aW9sK3BjTy9MUUE4dnJRNzNEWkpS?=
 =?utf-8?B?RjZ0cEp6MEI3MURFWk9mNTNsMlIzTFR3aUhrcWpmalVzMXBWODVIZGhOTDZ0?=
 =?utf-8?B?MFpLVGlDeUExM2ViV0JidFVWdURsbGIrelRVcG9yTGR5WWtPYzBsTlE0Um8z?=
 =?utf-8?B?Tk1jOU9ockhnUGhEclpkQmdOUmpOMnlyMHFIZmgvcG9FVERHNk4zSEg5amo1?=
 =?utf-8?B?ODJxeGFnUkZmbzJSaDREdGdZSHVVUGJNWUdhTjYxZDEycWV2aFE5RDk1NThE?=
 =?utf-8?Q?sM9x9kQcEz1Syu1+AFIVxkzCkMY/RMiU0z+aX5l?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e62780c3-e59b-4839-cade-08d8e95462bd
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 14:53:11.7084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n2PvAPkFfdzWHT9vZ9S9ya6+7A0gdFIVq45njdMMR6C/U/TioV/rS6LHpa9KOnRhJvslkE8Uhl2O+GqoY9CdS0BUIySRPlQTMP7sM9fPawE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2632
Content-Type: multipart/alternative;
 boundary="------------34806CB6BF0EBCF63D10D50F"
Content-Language: en-US

--------------34806CB6BF0EBCF63D10D50F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-03-15 4:47 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 2.7.0:
>
> - Fix physical checks (such as W191) at end of file
> - Add --indent-size option (defaulting to 4)
> - W605: fix escaped crlf false positive on windows
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...thon3-pycodestyle_2.6.0.bb => python3-pycodestyle_2.7.0.bb} | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pycodestyle_2.6.0.bb => python3-pycodestyle_2.7.0.bb} (67%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pycodestyle_2.6.0.bb b/meta-python/recipes-devtools/python/python3-pycodestyle_2.7.0.bb
> similarity index 67%
> rename from meta-python/recipes-devtools/python/python3-pycodestyle_2.6.0.bb
> rename to meta-python/recipes-devtools/python/python3-pycodestyle_2.7.0.bb
> index 4ad1f5493..611abca6b 100644
> --- a/meta-python/recipes-devtools/python/python3-pycodestyle_2.6.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pycodestyle_2.7.0.bb
> @@ -4,8 +4,7 @@ LICENSE = "MIT"
>   SECTION = "devel/python"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=a8546d0e77f416fb05a26acd89c8b3bd"
>
> -SRC_URI[md5sum] = "e2fcdace728267d5fa3aa98e08ee40db"
> -SRC_URI[sha256sum] = "c58a7d2815e0e8d7972bf1803331fb0152f867bd89adf8a01dfd55085434192e"
> +SRC_URI[sha256sum] = "c389c1d06bf7904078ca03399a4816f974a1d590090fecea0c63ec26ebaf1cef"
>
>   inherit pypi setuptools3
>
> --
> 2.17.1
>
>
> 
>

--------------34806CB6BF0EBCF63D10D50F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-03-15 4:47 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210315084727.26812-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 2.7.0:

- Fix physical checks (such as W191) at end of file
- Add --indent-size option (defaulting to 4)
- W605: fix escaped crlf false positive on windows

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210315084727.26812-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...thon3-pycodestyle_2.6.0.bb =&gt; python3-pycodestyle_2.7.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pycodestyle_2.6.0.bb =&gt; python3-pycodestyle_2.7.0.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-pycodestyle_2.6.0.bb b/meta-python/recipes-devtools/python/python3-pycodestyle_2.7.0.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-pycodestyle_2.6.0.bb
rename to meta-python/recipes-devtools/python/python3-pycodestyle_2.7.0.bb
index 4ad1f5493..611abca6b 100644
--- a/meta-python/recipes-devtools/python/python3-pycodestyle_2.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pycodestyle_2.7.0.bb
@@ -4,8 +4,7 @@ LICENSE = &quot;MIT&quot;
 SECTION = &quot;devel/python&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=a8546d0e77f416fb05a26acd89c8b3bd">&quot;file://LICENSE;md5=a8546d0e77f416fb05a26acd89c8b3bd&quot;</a>

-SRC_URI[md5sum] = &quot;e2fcdace728267d5fa3aa98e08ee40db&quot;
-SRC_URI[sha256sum] = &quot;c58a7d2815e0e8d7972bf1803331fb0152f867bd89adf8a01dfd55085434192e&quot;
+SRC_URI[sha256sum] = &quot;c389c1d06bf7904078ca03399a4816f974a1d590090fecea0c63ec26ebaf1cef&quot;

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

--------------34806CB6BF0EBCF63D10D50F--

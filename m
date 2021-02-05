Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.80])
 by mx.groups.io with SMTP id smtpd.web09.8077.1612533712984613314
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Feb 2021 06:01:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=WOvvfzJZ;
 spf=pass (domain: windriver.com, ip: 40.107.93.80, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eAohlkZadK1AbdJF4rJs7LSFM/ImnWXgH+yD3BHxsnt0a9zLnu+oQqz62kAQn/Gow83lUK4ucb0Ke4G/fhqisYw6Zgs+4rAAwr7RVo1xSHeog8gKrPsICBagJGQs5sgtOnfFizQYDrScNZRkokm3pYBF9rDd6pJ1RM7EoJImCYTbsHoaSW2sCzBGxkCTTCCWBblRckzY6KVMnus8hogAQGLeqXpSloz1L3zej5ur3LALCAa1m8yvaEORrGP/BN1KBAHVVDINRUjsSxrKpLJ61luJTdoHMzVcmq6BmUIjiR3utAp/d7f8i7goz3buCwyi/wDhG16wdfqbbBnHPjMCdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TyLA+3wkoTVQ5IwfU2tiXO1kpmisLgn5yMBdm7SC0f4=;
 b=Dxw1I1bMiaTilncjvKevmqFcdoyp5pH8yjQCz00tOdtOGWd3u2wFOC9qXxxoj2dCamR0EtoitPx8UVE4K6f7Tqg9xH1Est1u4OBKua+DM2XMg+BAUJNTLbzbSCIJ6X7Aqs7/mk0gBnvV9DNcCpuIy2rb8Ilk6yBrSeJMhTq7ihX2c4GF5D+J7n82Y38yhsLKqHmOsTYM8zKHge3cby53M3A7C9BOmmnPWDGaqONjH5gytJeLuqtwbRdRXHuPAQkhRadQXSAnutNS6W7c4XaEii3PXXKQSQDN3vi6sv1SfSHN+3dX/Xsc8kwqalVpojHdKXhoWG1km3KzXYMfCm7Ztw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TyLA+3wkoTVQ5IwfU2tiXO1kpmisLgn5yMBdm7SC0f4=;
 b=WOvvfzJZFx6hcKOjfE8A6ruvgZlQo6OvkdL3WMudoHmudF8x1nQNVXH5aX7q+/6NN/59Xnr2gTeCHe6HMW68IS+/22MVr52LBMxzIhcdSwAUqiWmIxzy3dwnXmbgw56TNzox22S0KgC7uoktI/K+hUsXYOqcEp7C62F5Y//gWEE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB3894.namprd11.prod.outlook.com (2603:10b6:a03:18c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.23; Fri, 5 Feb
 2021 14:01:52 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3825.020; Fri, 5 Feb 2021
 14:01:51 +0000
Subject: Re: [oe] [meta-python][PATCH 5/5] python3-pywbemtools: Upgrade 0.8.0 -> 0.8.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210202112636.30651-1-leon.anavi@konsulko.com>
 <20210202112636.30651-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <32a134d1-2cfa-11fa-1b6c-b458f7752fad@windriver.com>
Date: Fri, 5 Feb 2021 09:01:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210202112636.30651-5-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN6PR11CA0037.namprd11.prod.outlook.com
 (2603:10b6:404:4b::23) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN6PR11CA0037.namprd11.prod.outlook.com (2603:10b6:404:4b::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17 via Frontend Transport; Fri, 5 Feb 2021 14:01:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e9d503d-2134-4f6a-b45b-08d8c9de966f
X-MS-TrafficTypeDiagnostic: BY5PR11MB3894:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB389482310869F6F5BE9602159FB29@BY5PR11MB3894.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QJwFlplIuCJOyCPtzCMbWTDsGuhnkV4PuLnGrsXJd3yyqP1Pd66g+ohiohcompeamZo0D2XHu5W1zBJuS1ov5fD9Agt0O/3VhJDlfXNopf8BDw+Vov4XRFuFrVybT4LjvaIpOVME7WYXO0aqCv8jhC17gBS/LG3BO7U7yRVBvUjjnrwKj1fxajT2O0h+A6dg+QJtI8hJ98iwSy5Y6LWlR81uqE5J+cq51NfJod34Yz6xk9s8OTrcNDR8Xm7yBzWWRvKrRjHrADs1xc/4yFkL/xn9L6TMI2fnwnEPZ1VqVql2YgWFw0nVjnxSJl0+r6CSvuGJtxshOOI8/5NCKX0CZNTcDBq3/rJPlE3MSEsSfpj3HlHQ0wTi+JcpkgdCVug+L7Ci+wqrAELTUlCRmvTk76FZbFT5U6LI7EpYqgmGRiV9dPuLcbbBFOT+WO8G8ayaIMuO/hsU8EvQ9OunXCHjpww3V1R/c7uK1vTemYK5J8EALx/qvIOEZZNXvXBwdyad0ZEl4N4U2+ITXdD7Pj7xmcz2pP8reDqyBVKSeVAzY7uzqaZx6XvT2LZnWciAq1RYoMpVXd+hQjPSvvOk6d0kIHrufz6NnTJzVW4SCzv1DU+jBIDm4XD4cZOn0dEdfrWhQ8N0Ct83p5N3mYfA+8wQ6p6KiIo3s12Xzsik1rVfs2n7F35NFvAmsAC8BUmbEJJW
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39850400004)(376002)(346002)(366004)(166002)(31686004)(8936002)(66556008)(478600001)(66476007)(5660300002)(83380400001)(966005)(66946007)(6486002)(31696002)(26005)(186003)(316002)(16526019)(33964004)(16576012)(8676002)(44832011)(2616005)(956004)(52116002)(86362001)(36756003)(2906002)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?WlhaR2pkSldTL3l3Wlo3S2ZYZEcvU3k3Nm8zMmVENHZoTnRtRVViOWRiVkJO?=
 =?utf-8?B?bTdiTnJHbjZhOEhtc0NLTEUzdEN4OFg5cXR1OHJhUXhVdkhVYXVUZnBBSW0r?=
 =?utf-8?B?T1hrb3RBY0JIcVU3RDNZUXZ5VTA0UGNjQkRvclFFRnlaVW1udEk2L1lkazdr?=
 =?utf-8?B?VU1qN0NEK1Bxa1BHWFV4ck5JSngwUWdEZmxHOEJQaUxveTd6SzlsQ0FCd3JM?=
 =?utf-8?B?cVBMUmVndnpncHpmZGpES243YUsvZngrZjVzc2dtRXY4dU5LNHZQUU1FQ0pY?=
 =?utf-8?B?KzBCbXpiZ0R2SjFETEU1UXZBQXpqTHpnZlVVV3VPbUdtN05oZXdjOWo1Z0xN?=
 =?utf-8?B?VmFqc1VwUDhsQVZKdWtldUpFMGlYa29MQ3FTQUFFbDhyRkZPcHlxMU5SWXUz?=
 =?utf-8?B?OFcyb1R5SlpkTGg3OG40SVA1VFRwQ1pIRHEzTDM2VmFNNjE2bnUwcXJYcDNv?=
 =?utf-8?B?V0RtU0tMQmdIUXhHeEpWU2RoNjRQSGVBMmVTSkdQY1A0NUNYT3dwYkFIYWZp?=
 =?utf-8?B?N25XSkwrL3NjTGdZbmNpc2ROWDd1MXltMWlwUE5mcWo2Rk1jWjdLZWZibWpH?=
 =?utf-8?B?TDlxYzlTK2xKRFk0OUFpQTBZRGk0dHEvc21KbW9xTjE3dFlvTW5rQU5JWHBE?=
 =?utf-8?B?T3lrY2ROZ3RrQU14MTgvdlB4MGgvNlFvekU4aERUdGs5WVhNREppTFM1RnQv?=
 =?utf-8?B?SzlBbFZCQ0ZPeGswYy9OdVk4Q3ExeGF6R0VqOWNEYmRLNm4yOUplVHZ2bHhz?=
 =?utf-8?B?Wi9UemZpRFhPYjJ5bDhZcDhPUllKeTNPVThGak9OWUpkUFpVWVRsYzRCdm8r?=
 =?utf-8?B?MzIwcHVKWUxIU2ZoSDhibmZua3pGcE9IKzFrMEJaT0tYZ20wKzBSSk5SZjRa?=
 =?utf-8?B?Z2FnQ2lRbjFVbGFGRHMvbzUzelVGV0FQcnplUDJjanZEQXRkWFF6a0p6U0J2?=
 =?utf-8?B?NkVxcndxVlpSVUF5RDZzeWFYUEZUanp2WTRmNWljWUNwRTEvOVYrdkFXZnVN?=
 =?utf-8?B?UkQzaFd2QWVBd0tpbitSRjhFOW1NZklIdXUyTEZnSDlPVzZGcjdva3R3dC82?=
 =?utf-8?B?OWMvNVFvKytrekIrczJSeTJienMvdHVzWkVUR2FBZnlIVDZNUXZNNndPeVZU?=
 =?utf-8?B?TytydXROcDBSRDJHMEdJSmIycWhaVDFlcDhsbkFqSE14emV0UktETmduSEdD?=
 =?utf-8?B?T0RiVmJBQmovM1RrQ3dHeTlBVWlpT0JhSnJaUWRHRkF0SFppVUNLVWcxREVa?=
 =?utf-8?B?M3BFQzY1MWlPUnhzWU9zY0ZrN2dQaVhheCt5ckZQZUFZeXBNTll2K3oxSS9G?=
 =?utf-8?B?Wjh6WEZaWnAwelFockwyRW5TZGhVWktQNStqSWhVa2ZPdWMrTW9iVjNaZTcx?=
 =?utf-8?B?Rm5IVU01M3lXZ2tEUGtYZE9nMWg4RFRGWCtNYzVsNGxWMW1reTlTT0hrZ3NW?=
 =?utf-8?B?T3FHSkh6cXpqbHNZMmhCZHMwcHZXeVYzSTNrVDBtVEFZbzh4Nm1BUkhqR3pU?=
 =?utf-8?B?WE1aQXdjV2M0UjJWeVVPRlpTMTZBcFpwNzlMNGRZeVptT2o5OU5SMncwRFk4?=
 =?utf-8?B?Y2JITERSNVo3Q2FPVktMTnBtZDdrVjBFeTR5RVo0VHJZK3p3UVFUSXlYN1po?=
 =?utf-8?B?UFRTZUwyUWlpeDJpWlY2SFF2c0lKbG44QzN2TUdWRU9qZXY5Y0RNcEsvUGhM?=
 =?utf-8?B?WWV3ckxWeGRkeHl3MSt1Q0c4dTNSYkFNeU5TK1N6WFl4ZEI0ZEFialZXWW5Z?=
 =?utf-8?Q?20dNGqgHq60oVllnAIzWQJD7v7Cxo0Gc30HAn/b?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e9d503d-2134-4f6a-b45b-08d8c9de966f
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 14:01:51.8679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LVYWcvZVesZsFK20czavKH0yvFZDPbJHbs8vjGeW3Cj4xwcaMu/hHt3CdrVpv57QtceRh9A2M3TGdkSZacSEYrBxb+1WsuAuJMvJyjpfOUA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3894
Content-Type: multipart/alternative;
 boundary="------------DF4A825E76148AAF9DB833E2"
Content-Language: en-US

--------------DF4A825E76148AAF9DB833E2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-02 6:26 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 0.8.1:
>
> - Fixed a ValueError on Windows that was raised when the
>    connections file was not on the home drive.
> - Limit click package to < 8.0 because of a) incompatibility with
>    python 2.7, b) incompatibility between click 8.0 and clicl-repl.
> - Limit mock package to lt 4.0.3 to avoid issue issue that causes
>    test failure.
> - Increased minimum pywbem version from 1.1.1 to 1.1.3 to pick
>    up fixes.
> - Migrated from Travis and Appveyor to GitHub Actions. This required
>    several changes in package dependencies for development.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...thon3-pywbemtools_0.8.0.bb => python3-pywbemtools_0.8.1.bb} | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-extended/pywbemtools/{python3-pywbemtools_0.8.0.bb => python3-pywbemtools_0.8.1.bb} (87%)
>
> diff --git a/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.8.0.bb b/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.8.1.bb
> similarity index 87%
> rename from meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.8.0.bb
> rename to meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.8.1.bb
> index 03caec539..c5cabdb13 100644
> --- a/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.8.0.bb
> +++ b/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.8.1.bb
> @@ -4,8 +4,7 @@ HOMEPAGE = "https://pywbemtools.readthedocs.io/en/stable/"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
>
> -SRC_URI[md5sum] = "e41ef654a0af0461d6c164752963fdfb"
> -SRC_URI[sha256sum] = "b869bb217613cdfee1e97e8afc28fe3f9bf3b88f8fc99e588d03c4be0922c319"
> +SRC_URI[sha256sum] = "3cbee091f0a4917394814d7e639ab9fe13ad0859e47288deabf2b09a4382c4ae"
>
>   inherit pypi setuptools3
>
> --
> 2.17.1
>
>
> 
>

--------------DF4A825E76148AAF9DB833E2
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-02 6:26 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210202112636.30651-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 0.8.1:

- Fixed a ValueError on Windows that was raised when the
  connections file was not on the home drive.
- Limit click package to &lt; 8.0 because of a) incompatibility with
  python 2.7, b) incompatibility between click 8.0 and clicl-repl.
- Limit mock package to lt 4.0.3 to avoid issue issue that causes
  test failure.
- Increased minimum pywbem version from 1.1.1 to 1.1.3 to pick
  up fixes.
- Migrated from Travis and Appveyor to GitHub Actions. This required
  several changes in package dependencies for development.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210202112636.30651-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...thon3-pywbemtools_0.8.0.bb =&gt; python3-pywbemtools_0.8.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-extended/pywbemtools/{python3-pywbemtools_0.8.0.bb =&gt; python3-pywbemtools_0.8.1.bb} (87%)

diff --git a/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.8.0.bb b/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.8.1.bb
similarity index 87%
rename from meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.8.0.bb
rename to meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.8.1.bb
index 03caec539..c5cabdb13 100644
--- a/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.8.0.bb
+++ b/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.8.1.bb
@@ -4,8 +4,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://pywbemtools.readthedocs.io/en/stable/">&quot;https://pywbemtools.readthedocs.io/en/stable/&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa">&quot;file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa&quot;</a>

-SRC_URI[md5sum] = &quot;e41ef654a0af0461d6c164752963fdfb&quot;
-SRC_URI[sha256sum] = &quot;b869bb217613cdfee1e97e8afc28fe3f9bf3b88f8fc99e588d03c4be0922c319&quot;
+SRC_URI[sha256sum] = &quot;3cbee091f0a4917394814d7e639ab9fe13ad0859e47288deabf2b09a4382c4ae&quot;

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

--------------DF4A825E76148AAF9DB833E2--

Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.60])
 by mx.groups.io with SMTP id smtpd.web09.8274.1615813259194006244
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Mar 2021 06:00:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=mrKgfnor;
 spf=pass (domain: windriver.com, ip: 40.107.244.60, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kCex8EB6EGIkD8ksmM47RHS+jqR6or33o6CrfHS86nkkVrEjCMkASNpcc43ESiHiL5KoIIACrlZ8KgHa3jpikHTgl0O4Is3o81VRHZK7eATXVel/0LoMzNL/pi5UAXvIGAOpw15XPCxCM+TuXQcw1aN1jgjeZhWJyP9eavJ/3+jO6T75JQosTRBsqPIorxpen9x20Rsydf1t4ymJgs+qrkdkGasz7MDidZ3MT5wlMsYxEee+hSLlPheu71/lgP+5ICHyExrejrZDKe4oJd3rot/U85q4/FwjJx/FIX/lTAiglqxJU9ACHtkol9zq7z8vtBsyQ++8wzkm3RUGjRKMAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IBG1FccAfIsFpDcfbl0tkLBYx+v67mCQo1jtiEAX1s4=;
 b=UY0/G0WaSEMKf1GS1NXUFzwJ8q/scaYyh/aFRW/cA6vWt8hfBatbvnmq/DoV0BaPIOu2H8P6JOS/l1C84uGWAd2sTKcASVwgY1caXV7zJ8HKL+M1FSjI64nojQCT9qUqk4ip1iErVAe/Vy/OMq1tvEuJAXfywUsa/E2GIY7f/4btf+DnMhWfuK3fFMVkINx6SrlZpeJiahZl+jNyJYOo3mkSfvnBM+Xr+32Y2GNCSIT6RFFe52+g9K/ldH/BcdqUWfJfC+T5uTRQFPAp/0EK4wFH2HbqNeHNlyjZ3U5QfBDYy3r1v+Fr6q7gvV56RpdMG6UrZaXyBmYNIdFu6dyQWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IBG1FccAfIsFpDcfbl0tkLBYx+v67mCQo1jtiEAX1s4=;
 b=mrKgfnore/681sAVdpk8A8Wq1OXvpMIPqsJ7GR7l8NQljPxemWyrchfzyaV8KA3JRC4rwURTQmDzC7DR0bJbl0lg0guhSwXnX1I4mqZ8A07MBIb1y4DxcYZTRH4M2pMnGQvapRp//tgMk7YbD2zPJdoyV6lsLuPdnb+Y6WbT2ZU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2901.namprd11.prod.outlook.com (2603:10b6:a03:91::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 13:00:57 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 13:00:57 +0000
Subject: Re: [oe] [meta-python][PATCH 2/5] python3-pako: Upgrade 0.3.0 -> 0.3.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210312162600.8335-1-leon.anavi@konsulko.com>
 <20210312162600.8335-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <3db2d908-6405-75ff-188f-c1062449d171@windriver.com>
Date: Mon, 15 Mar 2021 09:00:55 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210312162600.8335-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN9PR03CA0384.namprd03.prod.outlook.com
 (2603:10b6:408:f7::29) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN9PR03CA0384.namprd03.prod.outlook.com (2603:10b6:408:f7::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend Transport; Mon, 15 Mar 2021 13:00:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b62235a-7a8f-4df0-047b-08d8e7b2601b
X-MS-TrafficTypeDiagnostic: BYAPR11MB2901:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2901E3578A425CF51AAEBE229F6C9@BYAPR11MB2901.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1002;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6xlM2ZjKWh3ulsMpz0luH47++7xVJ7xgzmIUiVMCIaJxdoc02d5iN23DJjQ+IAryHF6imvvtx6/92yqi5svLhQsosHyMGkJizKB7+lWk1p0sfCCoJbBB1QDhegvKJHJs7vOKXIdyIM3bjjMADaVScvILNYzkowhtgwWa0QYk7dZNoJqhjijfCjksZTvCH37AnJa/Y8Ttjuo5Y+1xEBmsW+6fVmAuSG2rpYxCZlh7K818m0VfIeLVvoBgV1LuYUqvts3pnlQ2vwJWGlEKXU37pgQgbMLcGDooELHTjHTYnR1N6ul4Ls1jBP+sV6oCUSKZDzGEkCuU1s1FAVWYgOL3Tq184XKSalcswbZ7XkkJ5VS4KKYHHjlr1z5H2HYLxRp2lN1HWoPsaHOG1UNt3D4HwESKQTQk7sX4wJRtH0dgOfNtAzMSoTlyEuFn/WDnTHQOrZVETDHDeWjiQQY2h+4g54AorwZ/g6IKNo/SMe9Q5VTQRtttYS0NjFn/urmSjQyEx60S9H7Z3vQMQuGdpuILVs4EZ8s708+NdHK6JA7nuNbLhMlxGWGBHuIhWTFOykymYqsa/58DfAyegfzmHXUnS/35aAzVWhV2O7AFt6fHjszrEFUwG+vhKiwxfJU8knF+Lmn4R/gEEBr09WopT9maAA3OvXmuLNJbsiTeV446Kl0BkE2S3ja4S1e9LA5sDRky8Y95NUlJgFFmuKFCGPsd1eaS8YDGAO0dJCs+djSOpks=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(39840400004)(366004)(396003)(26005)(36756003)(2616005)(8676002)(166002)(956004)(16576012)(186003)(966005)(31686004)(16526019)(478600001)(86362001)(83380400001)(66476007)(8936002)(66556008)(53546011)(5660300002)(33964004)(6486002)(2906002)(31696002)(44832011)(316002)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?MWd2L3pROHovcDhkZWxscTQxUGpTNGZGancvNS9JeHUvRDNtU094SHc0TVAw?=
 =?utf-8?B?Mk5SV09mQkFxZnRxNWdzNWpRYk8zNmxsL1IreFlwL2RRSDE5UTNwOTEvZHEw?=
 =?utf-8?B?RUNYYlF0WllQVlNCNXc5dE9BQ1ltenNrVElpdk9kS0g3bWhwd2xiaEoxbkNm?=
 =?utf-8?B?a2V0SE9FbWdETW9sWFI0b2t1TlFtMVdBUURndmg5Mkhhbmd1WVlJcHlQbWVh?=
 =?utf-8?B?eStuNjNIcE5mR2VHQTB0QytTRitlRUg3SnVGSU55eFk0L1FNMFFGYWRsUFJ1?=
 =?utf-8?B?UGFjS1V0SWhrNHE3bG44Q1NZbERPNVVIZnJGSmRvQWoxRDJXYmhGcmdlTWY3?=
 =?utf-8?B?OGF4U0FOTjQzd1dLQnZFTE5CRE1yMGJVOFlJMWZwK1dCZWtpMm5QWUhwV2I1?=
 =?utf-8?B?ODF4OVpoai9hcEpmSWJOczI1RUFNRzhJNHZUZHJ1MHdMc3hnS2pFVDhzRnRj?=
 =?utf-8?B?Tmt6dlIvc2xxNzZaREZVd0pYejlLVVFEQ1hOME9SKzg0ejdaOW9WVTI1b2Vh?=
 =?utf-8?B?ZlJCMWNsbXphckRiVnZyOUxmMU5XMUVWS3kvdjhhbUZpOXdGSW5xMGE4Rzk1?=
 =?utf-8?B?Wk1YZU0rRE1ZdnBrQ1I1OXphSS9ISUtLMzdOZVFOS0tMbGtkanZ2MVZvN2g0?=
 =?utf-8?B?ejJvY2xqZU1YSm5RMTVvWHY1OGo0eVJZdGkwT1cwRXJVcUlDRDNwQVVwMTFD?=
 =?utf-8?B?TWVNUEpzYU5RY3lHbUU5YXV2bnpuU1J2dmlYZDUzZlJTRXNlenBuaFBNSjVB?=
 =?utf-8?B?NXB1MllDaUIyYyszWkg5RUVUTnlRSE01dVpySXZRZzg1SU01TUVaOUJhRG82?=
 =?utf-8?B?KzgrZkJYODFqWnc4NmZTMGg1M0tvNWovNlhwUkVMMHMxSHpnY2E4b25kR29p?=
 =?utf-8?B?YnhaelJJS0xZTTNHM1JvalEvOHF5TWtDT3pUelJNM2tOSVYzRHR6anZ6MzBv?=
 =?utf-8?B?alYrZHAxOVNBOXNJNEdwZHRTclhZRTBpdUt1K2dTdVFrZVF0c0NBNEtSeXp3?=
 =?utf-8?B?V2FWcXNuOEozWUJaS0pDalpRbURFbjFsV2lsaXNKY1B3RnJOL1FzVUU2VGZr?=
 =?utf-8?B?SDNKME1TWC9WWWp5R29EczR5OFVVUXEyS2t1d3puWVpjU0V1a0JDdmMzNXpW?=
 =?utf-8?B?eUh6bUl6bk5tL3dseFVYTCtlODV6TTdYL29mRGk3TllERVl5L2g5SjZrcHBU?=
 =?utf-8?B?Z3pnUGYzdFRtVXNPNkhqOExYQ0NCc0JDclA4bXhrTXZZcThwZzFoTWk3c0VR?=
 =?utf-8?B?d1BhQnB6TldiM1hPOXZ6cG9uSGtHdzBJeEExTzhka1JhYlZXNnBiWGM5MzNh?=
 =?utf-8?B?Z3Nmd1lsdDltYWExUWVJTTVVQXdmNlZqcTN6b1ppbkxiVTV1bE5lNGlCZ0Vy?=
 =?utf-8?B?ZWsyZk45YnVKMytYRVRmYkt2N2d6ZnBDNTNpbUpIc1hiTlRJWHNHcG8rNkk0?=
 =?utf-8?B?VktBQ2ZIUG5IRkFuQm54KzNLdjh6L0RvODRvQ3h4dzFmaitzaG9oNVhKQnBp?=
 =?utf-8?B?T0hxeDkyM29GMmQzV1pQZ2pTOFJMcGJwTFl3R0Z3UmVwbEFXb3VEemNGaGxi?=
 =?utf-8?B?S2Jad2NzQzdUQTNhbUlDMnBocE9XUzhmVm4vR1E1SnNJQzBpakp3OUFZSWcz?=
 =?utf-8?B?TFVzR3Z1WEFrWlkyeWx2cUFyblZXMjBEWXp0ajA3RWI2K1RZTUgyTWt0YXdn?=
 =?utf-8?B?enhxRlAyanpaT1pVdXZOZ2RaMjhSWlg2MVlvRThMRHA5enZZaEx2SGtveUlo?=
 =?utf-8?Q?p5Je2XnB6MJ6ZpwzJyOxosmJtbXp8oAjX9UyqfA?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b62235a-7a8f-4df0-047b-08d8e7b2601b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 13:00:57.7832
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +nnU+Q93SNuk/8UF0/3yDbhheZ55JTRLdkt6Nd9SyYOUdRa4YgTi9To9h/ojGu07N096D2wp0pAQ9khS6GBFZM2kwgHlmPilvlPyW+jIFUU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2901
Content-Type: multipart/alternative;
 boundary="------------793186A2E1D73FF067C444F3"
Content-Language: en-US

--------------793186A2E1D73FF067C444F3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-03-12 11:25 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 0.3.1:
>
> - Adds an optional no-confirm flag particularly for use in
>    non-interactive setups.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-pako_0.3.0.bb => python3-pako_0.3.1.bb}     | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-pako_0.3.0.bb => python3-pako_0.3.1.bb} (75%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pako_0.3.0.bb b/meta-python/recipes-devtools/python/python3-pako_0.3.1.bb
> similarity index 75%
> rename from meta-python/recipes-devtools/python/python3-pako_0.3.0.bb
> rename to meta-python/recipes-devtools/python/python3-pako_0.3.1.bb
> index 3eacd0bdd..1930d866e 100644
> --- a/meta-python/recipes-devtools/python/python3-pako_0.3.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pako_0.3.1.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/MycroftAI/pako"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=e23fadd6ceef8c618fc1c65191d846fa"
>
> -SRC_URI[sha256sum] = "eabd1c121d6701069d1a10132f197ee2b5f4e75a3d68a93b07f69214ab0ff9c7"
> +SRC_URI[sha256sum] = "c033a073bb818ca336ae1fccba2655bd60dfe77744f85d4517abd3160d72231f"
>
>   inherit pypi setuptools3
>
> --
> 2.17.1
>
>
> 
>

--------------793186A2E1D73FF067C444F3
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-03-12 11:25 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210312162600.8335-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 0.3.1:

- Adds an optional no-confirm flag particularly for use in
  non-interactive setups.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210312162600.8335-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-pako_0.3.0.bb =&gt; python3-pako_0.3.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pako_0.3.0.bb =&gt; python3-pako_0.3.1.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-pako_0.3.0.bb b/meta-python/recipes-devtools/python/python3-pako_0.3.1.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-pako_0.3.0.bb
rename to meta-python/recipes-devtools/python/python3-pako_0.3.1.bb
index 3eacd0bdd..1930d866e 100644
--- a/meta-python/recipes-devtools/python/python3-pako_0.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pako_0.3.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/MycroftAI/pako">&quot;https://github.com/MycroftAI/pako&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=e23fadd6ceef8c618fc1c65191d846fa">&quot;file://LICENSE;md5=e23fadd6ceef8c618fc1c65191d846fa&quot;</a>

-SRC_URI[sha256sum] = &quot;eabd1c121d6701069d1a10132f197ee2b5f4e75a3d68a93b07f69214ab0ff9c7&quot;
+SRC_URI[sha256sum] = &quot;c033a073bb818ca336ae1fccba2655bd60dfe77744f85d4517abd3160d72231f&quot;

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

--------------793186A2E1D73FF067C444F3--

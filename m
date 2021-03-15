Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.83])
 by mx.groups.io with SMTP id smtpd.web11.8208.1615813287421934224
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Mar 2021 06:01:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=pp7kQMYO;
 spf=pass (domain: windriver.com, ip: 40.107.243.83, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dL4e846Y5eYLlgcdCDaWdPVgCgZd1wVZwfFYsL3xBNYmBV0qtm1tpUTq9IYjjVFdFwB6Q7Dz3SIvcTV/OO7qNcN1ULUdkzIF26qAntrh+CKGFDh+d8Ph4KCUPwNMB18jAv4ktoYfy/KQSfjEPX+bpeiM72kaLZAV6wQzVw2o+AE2GAyZfMdXoXKH2epllLmYwgEbsm82ajaL7ivAOBQlkVdlKsIimbHYpbGUK9ecvDldovBkCEWlIQNMn7OCrcFMA173Fa6Z9+iqqZHv7YR3gxWvI3+F/GqV8PC8qF1EzbJ7oUq38Lg/tyvaNRKv/lhf1cdqv7bHpZgev4ku/HWRiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IGLIkX1jgH4BuZcaCQG7CmvG+Y7PWHuFDnVxjl5nl9o=;
 b=lcBkQD+cm4n4hjDahdTVgwEY+iaeaFzymedhDAObgK7vY9MusMiW3Y8neWlCR+a8LNb5WCgSMNTNlWhuBUb91RnUQrMGn0AyJ/LdBNe9/qaZa2K0jK9DxhYyRFXcTCByPvQUAq851uiiP33FryL1JBylyE5M1RjaF3DmWV8nmgafMFL5Nsw6k1gw6hY1Ti0k1k98A2ND0D4h8+7tbcW/qM/aRax5q69L+uQd5ln0EXfq3bM7xyiS/2k+222x9g1AfT9ye+6RoUsnWucY7PyFiM9VADU68gME9Ez7qGrvbm6pdnHozdwoRC9fJm1tJ2KwLxvee6SQk6uFwHtGpJC2UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IGLIkX1jgH4BuZcaCQG7CmvG+Y7PWHuFDnVxjl5nl9o=;
 b=pp7kQMYOs9G3oRt9e2H0tv2xl6K1D8HIYcOqQ28iOaI4o4cyVFWNzZmOA5d2fOqgLGmYXh4ze2O810843+6wCWE62Ls34rbMQXxJkGW+WkXHWph2PIa4pxCTL6VTCgACq7P+9CObjrIcuPb9pCvzHov3TUk6bny0SxdsyXfmLgc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2901.namprd11.prod.outlook.com (2603:10b6:a03:91::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 13:01:26 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 13:01:26 +0000
Subject: Re: [oe] [meta-python][PATCH 4/5] python3-croniter: Upgrade 1.0.6 -> 1.0.8
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210312162600.8335-1-leon.anavi@konsulko.com>
 <20210312162600.8335-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <6349b0ba-8cac-92d9-e4a6-8b885f794dd5@windriver.com>
Date: Mon, 15 Mar 2021 09:01:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210312162600.8335-4-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN9PR03CA0378.namprd03.prod.outlook.com
 (2603:10b6:408:f7::23) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN9PR03CA0378.namprd03.prod.outlook.com (2603:10b6:408:f7::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend Transport; Mon, 15 Mar 2021 13:01:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e2c457d2-10a8-4531-a4ba-08d8e7b270fb
X-MS-TrafficTypeDiagnostic: BYAPR11MB2901:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB290142481695A4A389523C4A9F6C9@BYAPR11MB2901.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1824;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DBmuf8hQyJtMved3YjdXTyKxl2dapoJGfkmvnSIkKNwFteHT8OwP5c2FHXCxcbRYc0eD1c2IDCrxA5BhW28Iv3PgHaDUhH4/t0AeVg14pNDfVmRck7U10wEeV97MkQFhp48X56T7B5PBWMoQuIug7aKwsfhRkfrNaSMbfXPEYDmlR2R6OhuBvWWSDQ04SbnW3gTerS3v5RpSje7EaAK1rUeOQ03D/M47fAs4A0ejIKIQsRqb+QZxbD+U1bTkIh/JQpIsk5iyent14ehHVKD7/32/XwJItWcjrMm7BdEZeUBUzNx/1b3havTkueXTf4n3nPtEK/d+mgEmrAX0nB9I4aNZesLL/ZF6o8w5MzVnJN/PpKTqopN5SiGudA431P1u36FWuCtV1zw1in4VrnTv+oSNqxGW0WdR/RfjBkp+lxM12wfSSQ5yw/WdkTASfh3ewmKDY66V8pPECdB3alJpTJ37TaNLA2i8qww+0M/Vp/f6iyL9+hW+utZihe7u1Mjf8vi1S65F37KY3tcsArD8fhLGYmGi93Sl0eXHYhSGutMmimAmrZtLkYOskN7nG6MAnaJdS0OyiwdKtdpZdFLWbfjtCN50mdgo/cnSKYTok6vSHrhZU1QJxilS5BUGxRCLSuYPbVRMjlXimJTAcXd8uhwM1lpbjCaF5/JDRVPe7VUNd/XuBJiq2pEuhTDKLxwRahuzvFiCNCePQQKE5s5YrOw5ikzlC+X5HfJ505qSX1s=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(376002)(136003)(366004)(396003)(26005)(36756003)(2616005)(8676002)(166002)(956004)(16576012)(186003)(966005)(31686004)(16526019)(478600001)(86362001)(83380400001)(66476007)(8936002)(66556008)(53546011)(5660300002)(33964004)(6486002)(2906002)(6666004)(31696002)(44832011)(316002)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?S3pXVFA0OG1wVWpkMXF4SXVWRkVpU3VzSThDOG1JellVNDFSbnRWaVhRWWYr?=
 =?utf-8?B?N2RDVG14SWZVZ2ZzMURWQ1RBRjVLYU5sSWJhM0xMZGpqb1FrV0ZJb3BoemV3?=
 =?utf-8?B?bVJjaGhwdEJoSWUyNGtHSnFtMUVvSURiejRHaDVpMjQ0TTJEWm4rWmVuS3d6?=
 =?utf-8?B?NlRIZEN4aVhzSUNQOStQcTJUSHVVSkM0cEVTb0ZxMERSZHduMERBazRiUFBN?=
 =?utf-8?B?WUMvbFUvdlZBeDh4dnVxRWNNUE5zdHdoYVhsYmthS1ArZGhqZHhEaTVJL3FZ?=
 =?utf-8?B?RnJnWDNaR1dkUXFVS2JGeW9tSzV0R2g4bytBQnBmTnhDZjh2NDgyQW9MRjhG?=
 =?utf-8?B?SWZNckpaeDRxZ1Npall0YzJTYndnTVRIbnFmekVManIzMjdpRkNzdE4yeGw0?=
 =?utf-8?B?TGs0L1NNRXArVklHUHJoNm5DSmo4aGVTUFcrRjlnMks1YkJkaEUra0QveTJL?=
 =?utf-8?B?UHpVdFRlcm40bWVYVlJta2Y5TjdrOWp4QU1oTVN2SDV4aXpCMkhWRmxCYm9J?=
 =?utf-8?B?VUEyY01YTHVPVW44NGJ1VnRQSnphUGtab3g4RGZ1MjU5a0NNaTNOeHY5aGFI?=
 =?utf-8?B?M2hNMWh6eDNFWEhNeVhZY1JVTmVLVm41NWZWVGx6Mzl6NWlsWHpJbkNtaWpK?=
 =?utf-8?B?YjFVRnBBYXZxV1hEYjFPR2h1eHVpWEsxQzVRSndPdGZZV1RSeFEyR1hORVEv?=
 =?utf-8?B?Y3pIQUNUZmhLT05jaXZ5VS9RZ0Y4Z09sRkN3eERkdUgrQVFjRUhXRkZMNk04?=
 =?utf-8?B?WUpDRjFzREV4cis0MmRJbFN5TmEvdnNLZldoVk45L3U4d0plVFhSUXY0dHhV?=
 =?utf-8?B?K2FHSXFubnhiUUZISHdHbEg3alQxZSt5UnBGQWVOVmZKN1V0cXBSZVc5UVA3?=
 =?utf-8?B?RVpybTY0NEJMclFSM2hSU3BwU0xsWjA5N01TK0RBZDNvYnRRNHFjSXlFKzJj?=
 =?utf-8?B?U0RCdVV5bnBmdGhwbHlxRFdkZE4vSmg2d2sybnRMY21tN2xSejBTb0FFc29h?=
 =?utf-8?B?L2pabUtwZ3RmaXdFbmROeWJ2WXRxUUtBWjQxTG1lbEtxSHo3enk0eGFVR1kz?=
 =?utf-8?B?SndZMlg3ZTFabi93UFYzVnczeEJZRVpRT20vMGhCQ3lhdmJUVXFvOVp3MU5a?=
 =?utf-8?B?WkhGOGlNQUc5cC8weUtDVHROOEI3Zm5pVy9ad3hqM2dvdzE5bms1MzhRLzZM?=
 =?utf-8?B?T1V0Z0YwbnB0UVpZVzduV0VNdXFvbjNNbDhOczFEVEhzOWlOdzBIQks0Vitp?=
 =?utf-8?B?UjkzN0xCdXQ3dFhqL3RUK25pMWR0TFFZbW0rWFliaHg2VUxNMlA3eVRLbFI3?=
 =?utf-8?B?cDhiT3ptZzhWOTFscHRWWW81Ri9MTXdtWHRzSkFHZE14Qkc4U2hESXMvT09r?=
 =?utf-8?B?QUxORVViN3hqOGdJODJrdjgrc3pnR25uVjJ2b3VqOFpoY2dWazlBdWFUK1Q1?=
 =?utf-8?B?cWYxSTBQMVloVFJyT21TdDljTGh1amxpQlVRWllXUHJLcnoyQmk3NzFrWUZa?=
 =?utf-8?B?OVNrQUY4OWw2ZDR4OWJJcXVsSG5Sd1l2aE9DZjBHYktHMkxFc2Uwc3QyaHN4?=
 =?utf-8?B?OS9tM3g0Y1NFMVBkdEUyU1BRWDBNQTBUUzFHU3kyN2gwcEJvYUpValIxT1JL?=
 =?utf-8?B?QzFRb2FpMmhtY1Q5Vlg5Y0srN29hcW1ETDBiWWNMdmt5L3RreDhIN1ZVOVdl?=
 =?utf-8?B?bDlDdWRqaHFqd0d1TjArWUtkdDMrMVh1T0JzSmV5bjNlcFFPdnR2UTRGb3J3?=
 =?utf-8?Q?Dxr2dh4YYQvBAbhDTZFnQN5/V2cel+NetTGjnxw?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2c457d2-10a8-4531-a4ba-08d8e7b270fb
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 13:01:26.0239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: quywws1MvT0VsAzmgjHT3EoK9gdYNH+bJNrpctMjNmkvpBCC+g9kmXQC4vHxIK6ejOdKdpr6wXLuHQWF9mTlimM9qs+2LtWOQJ1NjeEy9aA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2901
Content-Type: multipart/alternative;
 boundary="------------D51060EBEAFBBE44032E052B"
Content-Language: en-US

--------------D51060EBEAFBBE44032E052B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-03-12 11:25 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 1.0.8:
>
> - Update _expand to lowercase each component of the expression
> - Fix _expand to reject int literals with underscores
> - Remove a debug statement to make flake8 happy
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-croniter_1.0.6.bb => python3-croniter_1.0.8.bb}    | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-croniter_1.0.6.bb => python3-croniter_1.0.8.bb} (78%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-croniter_1.0.6.bb b/meta-python/recipes-devtools/python/python3-croniter_1.0.8.bb
> similarity index 78%
> rename from meta-python/recipes-devtools/python/python3-croniter_1.0.6.bb
> rename to meta-python/recipes-devtools/python/python3-croniter_1.0.8.bb
> index d3b6fa1f4..0d0ac75ae 100644
> --- a/meta-python/recipes-devtools/python/python3-croniter_1.0.6.bb
> +++ b/meta-python/recipes-devtools/python/python3-croniter_1.0.8.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2"
>
>   PYPI_PACKAGE = "croniter"
>
> -SRC_URI[sha256sum] = "e79bcc9681d2345e71360241aebe19ed6c5475fec40cc59a7998fe1a2ca568d0"
> +SRC_URI[sha256sum] = "c8b830d787c9993361b74eaad7d7396090d7f2d9db41ceb4a52cb75da461c3ed"
>
>   inherit pypi setuptools3
>
> --
> 2.17.1
>
>
> 
>

--------------D51060EBEAFBBE44032E052B
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
    <blockquote type="cite" cite="mid:20210312162600.8335-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 1.0.8:

- Update _expand to lowercase each component of the expression
- Fix _expand to reject int literals with underscores
- Remove a debug statement to make flake8 happy

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210312162600.8335-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-croniter_1.0.6.bb =&gt; python3-croniter_1.0.8.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-croniter_1.0.6.bb =&gt; python3-croniter_1.0.8.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-croniter_1.0.6.bb b/meta-python/recipes-devtools/python/python3-croniter_1.0.8.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-croniter_1.0.6.bb
rename to meta-python/recipes-devtools/python/python3-croniter_1.0.8.bb
index d3b6fa1f4..0d0ac75ae 100644
--- a/meta-python/recipes-devtools/python/python3-croniter_1.0.6.bb
+++ b/meta-python/recipes-devtools/python/python3-croniter_1.0.8.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2">&quot;file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2&quot;</a>

 PYPI_PACKAGE = &quot;croniter&quot;

-SRC_URI[sha256sum] = &quot;e79bcc9681d2345e71360241aebe19ed6c5475fec40cc59a7998fe1a2ca568d0&quot;
+SRC_URI[sha256sum] = &quot;c8b830d787c9993361b74eaad7d7396090d7f2d9db41ceb4a52cb75da461c3ed&quot;

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

--------------D51060EBEAFBBE44032E052B--

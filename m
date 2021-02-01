Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.71])
 by mx.groups.io with SMTP id smtpd.web08.33831.1612186500223603405
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Feb 2021 05:35:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Czh5+so6;
 spf=pass (domain: windriver.com, ip: 40.107.75.71, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K91M4qy/8h+LcDat9oEyY6wyWJpoyu94slE2xFJ714zkUDwrL8TbtT/Qk4da/j7zwdzQ+BUFbgFD0A5O6agQVAEplN2TmYvOJwXYEIlCxTZC3xRvYzJNQ2o4l8JvsCKQt2HZH8zp+u9YrrcXz/SBNAJj5Ds+AHpK2Asnb6PAaFXc3rNFCG2/XrPRIZEcYpyi04NolVbzT7tyJh1HWI1dIBcxCwS8BcQKcQTbMZYMU7yN/QPrHnYCP5WsVHAXLstwX5b+OoPhgwvSHVIrZQBkv5tNAPQPTMsBJ+XXgU1gmwqynKOCfjY1Ygqc2Owytc8dHDoTJKy1vLhPVoGbbnqQoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Kaqg/h5wVPFERqWo+Uuh6KEOB4ipjrlWc7A14gXr9g=;
 b=aY36vwutOzlOEYm0BNHwJCeRoT9yoMf7hSTQLiCRir5rO0rgZcPS0aDBMe9uqjeLD3wrvFcpqbGEvezPJ1k9P29VM1diFq2XgsxPC+gBj6x+Uy4Rh7o2V3W61aXEzE8uEckWYZuwYX2zDccWkxMDhkWFHCOlsxYWhUOllfMci7/axb9ySf4c+5JqF9YVA/yybYyFYt5mubk8kM2PlD8d5HBegL0HAik86z9Cf/QM753f+xg1liSnA1ywkC8YG74+R5Aloq7UMcvgdGuMfy4Xsi5IVYhoV2Drp+TmuydDMSnCi9UXYfoPkaeOuY6WKK3M9ekS+yAplNpO9t1rvuWMsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Kaqg/h5wVPFERqWo+Uuh6KEOB4ipjrlWc7A14gXr9g=;
 b=Czh5+so6kVAQ/3M42/EgGiAFoa1v0QGZJX7TqpV1F/CEYQ8GaFjDVtgMBpRlLphYMZpCim/MtBZettPTSL5MNKdfN5BISRdym6GLwNZJQN7HOWuPMudo+xKltDHf3hUUtJpvoH+WKzVFWSPABl0KbBBD/czVZxOTs0JAlyjgulo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4308.namprd11.prod.outlook.com (2603:10b6:a03:1b9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Mon, 1 Feb
 2021 13:34:58 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3805.024; Mon, 1 Feb 2021
 13:34:58 +0000
Subject: Re: [oe] [meta-python][PATCH 1/4] python3-croniter: Upgrade 1.0.2 -> 1.0.4
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210129131029.2163-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <b8e2b4bc-ff66-f82e-93c7-6e17525c7d0a@windriver.com>
Date: Mon, 1 Feb 2021 08:34:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210129131029.2163-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN6PR1101CA0007.namprd11.prod.outlook.com
 (2603:10b6:405:4a::17) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN6PR1101CA0007.namprd11.prod.outlook.com (2603:10b6:405:4a::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17 via Frontend Transport; Mon, 1 Feb 2021 13:34:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b149db0-7dc6-45f8-0f81-08d8c6b62b37
X-MS-TrafficTypeDiagnostic: BY5PR11MB4308:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB430848C32C4AF725564253999FB69@BY5PR11MB4308.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:538;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JniwsWpGlYccLZ4JhA4VENZRLrbuj8Ng6s5MuBuYgXVFGZLW27H2xxTwRIK0+hn9P2Ps4fSiPsiH1RqGQke+m0itJy5kaIDoOERSKarDm/pl5bj5Vy8hYjFmT8A5x59dG/Iu0ulFppADGD3GnwU+hF1iEXuFwTCqVNhGoBJe/e03Z6Vyc4ornsXXPdNZVPO1BlleinAoIxXJauIY8SzIv8fA5NNiHUYZAbHsZrV0xd7WVjeT83AdH1B15ZhjZcRcBau+2L1wIgRUipC/OsEnldKBfbYlX2FJz1q46UupLVnnEjiaNhCf8W2lsrBz2KOyQnfiblRLg0Nxba29itTqwHjalTJHrOvfD9tYlEKktcnAlwMsGD/fkzeGjAU7YZXYa8Xs+K2MVmUEbX+ZYhpnfR+BEs5s7/ZQTZVPPqrAlTbW7OVuJViiR5CN23vCHonBbUpI9fcYwWT15xFmKsZIgPiIGBQ/+8hmU7Zsz2hskJ8vRtBI72PSAEXKe5N7cMS9qx1vkdVEOaHr53dzK3D4DCu92u5MOK5ZAHuiPhepTrdMSUyaP4tJqafmjybw4p/98eiiWOOOs2yLMkIi+i/+AOuRzIeVjEqyB0ZmkuM9/ErTmeVG7jefm4r1HheqYRFja3T0jZMaE+7id/A2X3omfTQLnDhAGqvZ5iEicMjoJmhePL/8xTEEA93lvWLliTui
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(136003)(376002)(396003)(366004)(5660300002)(316002)(478600001)(26005)(966005)(8936002)(53546011)(956004)(2616005)(186003)(44832011)(16526019)(166002)(86362001)(52116002)(2906002)(16576012)(66946007)(83380400001)(66556008)(66476007)(31686004)(6486002)(33964004)(31696002)(36756003)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?UkJ2eGU3TzF2cGMrOVJrcGJ0eWxsUWF4TTB0SkZ6M3E5Q1hWdUVmcFR6YUNI?=
 =?utf-8?B?NEdxTzFhMlNSUWdESENVWnNqNUhUVmRpR0wwOCsvczJVRXh4RUQydmxaWVFX?=
 =?utf-8?B?OUdQNm1HazhPQnUzN0FMSVlPT2lYRlhJWVJ2b0lidExVV0k2L1BRTjExSXVp?=
 =?utf-8?B?amRjQmVVbUtRbWtoQTYvKzJwR2sxTWR3UDdHeS9rWE94UnB6VVdMRFQ2MWMv?=
 =?utf-8?B?ZWNMQnJSSVgwcG9zMEkzQ0NPK2dBWXNtZy9MbldoREQ2VlU0RHZOYWU1TEE0?=
 =?utf-8?B?aGdNTlBiZ0o4aFd2S0hZRG44VmpvU2FwckEzRGJxT3o4K0IzVDZLTWpkbzlP?=
 =?utf-8?B?Mmw1M2Y1WWlYSkFMNUdXQng4Uk1PaGpkK3Btei9UOHlWTG9iREMrLytnbnRs?=
 =?utf-8?B?TWVTWk0vSWlDa0kwSEhiaWkvaVJiOHRTYkhiOGwzNU4vdWoyNUI3VkZFeTN1?=
 =?utf-8?B?cnd5a3N4d3U3Z3c1eW01L0lsN1cxUUtoTGo3b2xTcTdITnpoTVJxa1BQTkRn?=
 =?utf-8?B?OEtBanhsVFZFVkl3NEIvaGd0RkhmT0Q2OGc0alhjSFlnYXVFOVJQOEYwNDRz?=
 =?utf-8?B?US82RlpFVEtrZHZJdzFqMzcrSm9meFMybzZHTzlGbzZIQ1pJYjAvUExJSndH?=
 =?utf-8?B?R0t1TUx6bXo5SEs5WVBsSTg2ZEFZMkU0NFlkdkgveHh5VmJVTG5xVGw0N3Y4?=
 =?utf-8?B?VjNQT24xSnErdDNaSUZidnpBenMrQWVnNnEwZ3RyYTIvUERpTXJPQ0FOMEx4?=
 =?utf-8?B?UkR6c0x5UEF6b21HWCswRFFXM0xIdUk3TlhVblY1NFk0c3A3d1NBQTd1Qnoy?=
 =?utf-8?B?ZjN0MWpudGRvM041TDE5WjJNRkdkbWNGVGRsTmlIQ0JHbmZJZ2RmUHA2Tnl0?=
 =?utf-8?B?UzY0R2RMbVRiMEo0aVBaVmorOG5ZSk1jQVNhdUJVbDRXVDhnbHJCVjBiZ0Z4?=
 =?utf-8?B?NVJaMUoyQm5CWFFrZmlmbVBwYVJtQVZ1UWdiMW9xUEcyVit2b1YzVnFOTmFH?=
 =?utf-8?B?NVhGb0ozMlkwczdsK1ViOHRTcnFOSTZVOXVPT2cwU0Jqc1ZrRTJydDRrUEFB?=
 =?utf-8?B?WTlncTBidEQ2NFdXVDJxS01QSXZNYndDaTliZmZzMGVOR1o4Um1SckN6ckVw?=
 =?utf-8?B?WXF5MDdtTTJQMmtaVzBWckhUSW9zMHFibkhCUGFJdDU5WTNScjE2QXdqejN3?=
 =?utf-8?B?cmJPV25aSHdNM2JrUWRvSzhoVjlwU1lSNmY1ZG1OTTZteWJFUm1UandiU1RI?=
 =?utf-8?B?akM1d0JJNnB1TGgzTTBzM25ZR1FZZFlhYVZDTHE5d3R6NGJOMTNYSWhIb2gx?=
 =?utf-8?B?UVRCYjR4bHU0ODhVY1ZFdGZGaEl1V2haODJoNDc3U21XcUJ2K3h0ZXZIbTQ2?=
 =?utf-8?B?ZnV0RVNKZjVrU1JLSTB0enFSd2hQeWovK3JYUFltUkRueFZ1NTdMOFB3a043?=
 =?utf-8?Q?aPsUC/Fa?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b149db0-7dc6-45f8-0f81-08d8c6b62b37
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2021 13:34:58.6300
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i1Z5EZ4Dv6K42XaXabIwcn2trZyLeprSDkatg1/DFeYvqT5qeWe5mJeBCz1hccWZyJQVz1kcdT6dEhtFkGInQOY++JTW8HORE9uJqSG3OBY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4308
Content-Type: multipart/alternative;
 boundary="------------C26B03AC159599DA2512DD90"
Content-Language: en-US

--------------C26B03AC159599DA2512DD90
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-29 8:10 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 1.0.4:
>
> - Raise CroniterBadCronError when error syntax
> - Fix spelling
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-croniter_1.0.2.bb => python3-croniter_1.0.4.bb}    | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-croniter_1.0.2.bb => python3-croniter_1.0.4.bb} (78%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-croniter_1.0.2.bb b/meta-python/recipes-devtools/python/python3-croniter_1.0.4.bb
> similarity index 78%
> rename from meta-python/recipes-devtools/python/python3-croniter_1.0.2.bb
> rename to meta-python/recipes-devtools/python/python3-croniter_1.0.4.bb
> index bfe1f1d4c..8328cf6d3 100644
> --- a/meta-python/recipes-devtools/python/python3-croniter_1.0.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-croniter_1.0.4.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2"
>
>   PYPI_PACKAGE = "croniter"
>
> -SRC_URI[sha256sum] = "12f9fd52e7cfb623d0788956d137a3de26e5583a25820fa7710fb6b58d32b213"
> +SRC_URI[sha256sum] = "7f861f4a896b2b43069ef218d2b999d2c9f760598c2592a6b842cb04bc75562e"
>
>   inherit pypi setuptools3
>
> --
> 2.17.1
>
>
> 
>

--------------C26B03AC159599DA2512DD90
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-29 8:10 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210129131029.2163-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 1.0.4:

- Raise CroniterBadCronError when error syntax
- Fix spelling

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210129131029.2163-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-croniter_1.0.2.bb =&gt; python3-croniter_1.0.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-croniter_1.0.2.bb =&gt; python3-croniter_1.0.4.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-croniter_1.0.2.bb b/meta-python/recipes-devtools/python/python3-croniter_1.0.4.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-croniter_1.0.2.bb
rename to meta-python/recipes-devtools/python/python3-croniter_1.0.4.bb
index bfe1f1d4c..8328cf6d3 100644
--- a/meta-python/recipes-devtools/python/python3-croniter_1.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-croniter_1.0.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2">&quot;file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2&quot;</a>

 PYPI_PACKAGE = &quot;croniter&quot;

-SRC_URI[sha256sum] = &quot;12f9fd52e7cfb623d0788956d137a3de26e5583a25820fa7710fb6b58d32b213&quot;
+SRC_URI[sha256sum] = &quot;7f861f4a896b2b43069ef218d2b999d2c9f760598c2592a6b842cb04bc75562e&quot;

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

--------------C26B03AC159599DA2512DD90--

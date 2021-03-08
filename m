Received: from NAM04-DM6-obe.outbound.protection.outlook.com (NAM04-DM6-obe.outbound.protection.outlook.com [40.107.102.87])
 by mx.groups.io with SMTP id smtpd.web10.35798.1615212433985727668
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Mar 2021 06:07:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Jdbo/Lle;
 spf=pass (domain: windriver.com, ip: 40.107.102.87, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fzGQ7gGOLNTD7Dj4eYGNCMjU5VObcUI8vSrsr4//WfyjzdWl48bGNNqNEG8+1a79URsMcJibad+fBvCYcB+L83H6DiV7L+f6FHxPTb9yc7MCCA0hDeqdc2P/6Z0Z59HtneSClE3guZcYlnH3heXFKKF35Dw1sF09SVZf2OuubZ169S0EFrrvbLggGqD9mgGMCP/vv1DTadlApk98D567JXZbJ66BKqA9gznnEpxOXVzWtw+bnqTP3jfebevnV99/iYw0/MoVxhAXxFJIPejp+LH6+8kaNQDThibLXpI9mi/CyKpVkoIfiRQ/UIIImEbtBvqpUIO5nlXKIxzm9mROdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I0V2iKVXv0+B/twR/rx9Enb2vVDDW/j7xX9r+o7ewEw=;
 b=RtIq68uFBT30QM2GzbCaTZf8EJ6CgsApHFxTDyV4iHn16EhP5idcifOSKzmKIQAIHuXF+MPcKUAApr5aJaOknu8Roimeq3gaPXsVeKD3CAvQAX3ldg0J5H1C0bIivJw2H76HYxl3qkZgJmsffQ/dB/9PY8DcRR59megCbLMKRE9UZSKIpigcSQdXsTbFvlu0YFW1ei936XrOe5/4fNSGC+IthmyjBV6fVXgRqhkNH2LNSFgzd+MhjcS4dgR20+kMjXv80u+OGlGMWOgZuI0EMtxYjtcuwx0APHs5yVmEGFDeZdeyNeuxuOscX8RBzWryweAL6syc4mpj/QoJnn4u4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I0V2iKVXv0+B/twR/rx9Enb2vVDDW/j7xX9r+o7ewEw=;
 b=Jdbo/Lle632lgv6vRntg6eh8Udh6zmgMxIkSWojMgTkRbzPirTcDGazsd0CpixaCebYszt+q8+nFPvb++ZyveZYM7P6cIUTn7RoperkpmGb/rTNC3wLoe/Iot5VfEIFbCJZ5lXrZNmzgAr06pUA+UAAoJO31a41FsQBmnOuwlzA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3446.namprd11.prod.outlook.com (2603:10b6:a03:1a::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.28; Mon, 8 Mar
 2021 14:07:12 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3890.037; Mon, 8 Mar 2021
 14:07:12 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-bitarray: update to 1.7.0
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
 openembedded-devel@lists.openembedded.org
References: <20210307162719.975146-1-open.source@oleksandr-kravchuk.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <4d3ebe89-c13e-2843-f163-8f7b6935144f@windriver.com>
Date: Mon, 8 Mar 2021 09:07:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210307162719.975146-1-open.source@oleksandr-kravchuk.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN8PR04CA0027.namprd04.prod.outlook.com
 (2603:10b6:408:70::40) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN8PR04CA0027.namprd04.prod.outlook.com (2603:10b6:408:70::40) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Mon, 8 Mar 2021 14:07:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8539834-abf3-470e-7183-08d8e23b784f
X-MS-TrafficTypeDiagnostic: BYAPR11MB3446:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3446A1E50C6ED8B576AED4B79F939@BYAPR11MB3446.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Lp70W9cqhP7y+9RVCGFofmLaqo/ZrjhY4Ax5ZZ1FCDcvwvsC54bY66uAKrIyLMP14v8VQWH4Erow0XJZwbDYIvcXNHklufFR7F/AjE+23prsG9BrYpvUF5Cgno6uLHFm9sg/+wcpaMRO7g8mJMpbyk04mwELPcw15PzYfxsVGZUkbozKTRPf/xz+nx4CMjntgYrTEql93Esv9DLsOvFio7GJ2DxqsikXyx3nRVOxyk3x45W2/FnZmKvQjgg9iDrkRDK5AxGl6brkwtGOpNI1oAWzLUEIS+moDeHe5qwgurVRu1xrrXb9xfgxCpfVewcYVeVrqx9ulftHg+B7GUFLg78IgxHmZCklOdjkToV02nTEztNQ/kZMK0LGPcGWpD9xUl/Q1w9rzTAAYBfXoagprwTJUmmOjVF/1pjE/+S1xig9TYnLt6fx4jRoG0LuUGDmm24icanO2Pg6PWipuSvkoovOTSCcGfw9ZNrx4zMmzRG2G4JC+4WleWSavKPEr40QJheQsZpW4pHs8BsDZL5hO76ZfBPJGkZ4LadOdMdvVPp7PuboaCgFgsR0NM7D9lidxZYHeAic1Kccq3swz24TT9mtbcBr1yygE16HMD77eanHy/qC/R20QptNJdvEQJAHlgVGJuYJJ1xJOmZRgpAs0LrHc7K6a8BjXiIHQcaWqZsQyhiTIwFOdX3O3rLVXm2R
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(366004)(39850400004)(396003)(376002)(53546011)(478600001)(26005)(6486002)(15650500001)(31686004)(31696002)(166002)(2906002)(66476007)(966005)(5660300002)(316002)(66946007)(86362001)(8936002)(44832011)(83380400001)(16576012)(8676002)(956004)(186003)(2616005)(33964004)(36756003)(66556008)(16526019)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?L2lDcURKUE9DR3A1dXNJTmZuYUxUQ3RXYTBCdEdjaUFpTHFvZHp4SkRMNE9T?=
 =?utf-8?B?WnBpWDE4K2lGbUNvNmQwa3hQby9Xdm9BTHBjN2tXRFdIQTJreWJSbjB0UkpN?=
 =?utf-8?B?MTNGN2J2czMwWVpZZE9hZTAwUVR6K0wwZWJlYzhsenA4RXB0RG5kZDZDOWs5?=
 =?utf-8?B?VmJDTTdQYythVVFEdXlIL3ZIWXd0NjhmUEk3cHZkTFNwZFd2L05mVStxNDF1?=
 =?utf-8?B?MnVLQzBQZ2gwaEwrd0VuVXllZVBWQ3dSMWg1cFM4V2hTOWpmNWdURnNnVGlq?=
 =?utf-8?B?SEEyU2c3cW9SSHp1eVJPVGdFZk9KSCttbkh0d29SQ1VVUE1OdUF4QzFxczVu?=
 =?utf-8?B?cGpOVEFFcnpGVFVwdHJ1bVRHME1VYzNGTjdvK1ZvZWJHa21XLzFyVkFoNjh2?=
 =?utf-8?B?c2xrZUd3cjNQUmhIQjcrd0dGaWh4WXFaaUVTRS9TcW5qNWNGU1B3TmsySGtN?=
 =?utf-8?B?VkhnT3FIZllCZVg3QkJRZy9DY3p4a2F2dFQ0TGdXNC9DVE8zUzQvaXVqbERk?=
 =?utf-8?B?WkZJOEl2MHRFWFYwRk43OVNzYXdzRmczeWVCcVQ1ZjFXOUYxME1xVHdNdUVx?=
 =?utf-8?B?bkVScW5NKy9KT3orNWxpTTdzS0VjVVV3MDRMajJTNTRTK21vb1pYUW9nbWZj?=
 =?utf-8?B?d09jZzNzSE1kQzh2Y21GdklpQ1VITXh4UTZVRzNldDcrK2hhVjFsVDU4MVRp?=
 =?utf-8?B?ZEJyQUtpNnpnY1lnU1pkaS9FRFJmeFFzRGVhZzVaSlF5NTRRNHAyUDdxSnJr?=
 =?utf-8?B?akRUTDdYeWUrRUJtL2pRLzlaYS9IVnFUMUduTTNtV3lVNitORjBvSDJjcUNG?=
 =?utf-8?B?VDJHZUJ0dmtmNTVBMU9ZbmNXT0xjTEwxK1IvblhyNzhKNmxUTlhZa044ZElr?=
 =?utf-8?B?WnBrUFJNcENINDR6cUg4WFZ3MXlTNUVBeFh2YlpPT1l6WU9LeUs1V0V3VFVQ?=
 =?utf-8?B?QnR0ajJINkxuZlB5Y0F2dFI3WS9oY2lKQmpIcHVndkN2a1FNYm9qZjRrbVhH?=
 =?utf-8?B?SDN6ME4veGZoSHI0V3dTTWdBSm12UUdMOHMvUnRzNU8vYURMV1VGdWlnSjRh?=
 =?utf-8?B?eDdOOE52RWptc29RYXFJZzYvb3Vjb0t4aUdWT1c0K1dkZFdrdlZvOTlyTXEw?=
 =?utf-8?B?ZkREQnJZbS8vZUV5WjdHZDhtK3dIOXh3ZXJkd2ZPRTdoZk1pdTFYMng2d3ky?=
 =?utf-8?B?dTkyUjR1dUpjLzBGdUFuR092aDVEZDhSQlJEN3B1L2U5MXN4QXpyVkpySksy?=
 =?utf-8?B?b0w3RDluc2tlSFR0UVkrZVZYWWRSMjRvaDRQSGlxd0dkSFgrWithbC8zOFNm?=
 =?utf-8?B?VGdwRDZLSEc5MjNsbmozbXNGM3ptZ2tzYkw0Z0YyZ2grL0JWYUhkS2Q3REcy?=
 =?utf-8?B?MHoxVy9qcTdldWNaVi82UkprWGRIdGRIZ3MyZWRnejBoa2RuM0hLeW9kdXUz?=
 =?utf-8?B?ZjhWV2dEcnZFaENERTgrQlVKdkltOE00cUJGRG1nN2NnQXdWc0d6U1hyNkR0?=
 =?utf-8?B?NEdRY3ZVVlRodUlYbWV2Z1Jsd1lITXdYZmVJVUp2M0psNEJPREZBalM4dWtE?=
 =?utf-8?B?RElNR1c0Z3lOczJBRHpjMmI4M3dHNTRIMEh2bG0wNXNaYjE2c3ZiMG16Yi8r?=
 =?utf-8?B?cVJrNnp1OVcrVGtsZ2VyaUxGV2Z1aFRPOGtBTExiM0IvN0tDa0pRQUcyM0hM?=
 =?utf-8?B?NnV1L24wbTJSSGJFODVxNjY0K3R0UVB6ZFdjMGlSM3NFcjVMd2hUbEM0OEc0?=
 =?utf-8?Q?j/u2jYpfKt/nGqenUcupqwGecIzp1GLoIIKml0H?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8539834-abf3-470e-7183-08d8e23b784f
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 14:07:12.4494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oNzUdCY+pU6GgNjAQ78g/+2saT5fG21XOx2DwUYqWxt7mXyIgp6sRPHi2pl3UROjsHcg3JqwS0W03UTMq4Qp+ydO0tj/0qtM+swHf4MeqMw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3446
Content-Type: multipart/alternative;
 boundary="------------2FC485CA832F21379D65D0EE"
Content-Language: en-US

--------------2FC485CA832F21379D65D0EE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-03-07 11:27 a.m., Oleksandr Kravchuk wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-bitarray_1.6.3.bb => python3-bitarray_1.7.0.bb}    | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-bitarray_1.6.3.bb => python3-bitarray_1.7.0.bb} (77%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-bitarray_1.6.3.bb b/meta-python/recipes-devtools/python/python3-bitarray_1.7.0.bb
> similarity index 77%
> rename from meta-python/recipes-devtools/python/python3-bitarray_1.6.3.bb
> rename to meta-python/recipes-devtools/python/python3-bitarray_1.7.0.bb
> index 16beab551..c91b7443e 100644
> --- a/meta-python/recipes-devtools/python/python3-bitarray_1.6.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-bitarray_1.7.0.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
>   LICENSE = "PSF"
>   LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
>
> -SRC_URI[sha256sum] = "ae27ce4bef4f35b4cc2c0b0d9cf02ed49eee567c23d70cb5066ad215f9b62b3c"
> +SRC_URI[sha256sum] = "e31b472ac92e04ea943723cf781ec168e15049d91a3052203defb81652d2b086"
>
>   inherit setuptools3 pypi
>
> --
> 2.25.1
>
>
> 
>

--------------2FC485CA832F21379D65D0EE
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-03-07 11:27 a.m., Oleksandr
      Kravchuk wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210307162719.975146-1-open.source@oleksandr-kravchuk.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Signed-off-by: Oleksandr Kravchuk <a class="moz-txt-link-rfc2396E" href="mailto:open.source@oleksandr-kravchuk.com">&lt;open.source@oleksandr-kravchuk.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210307162719.975146-1-open.source@oleksandr-kravchuk.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-bitarray_1.6.3.bb =&gt; python3-bitarray_1.7.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_1.6.3.bb =&gt; python3-bitarray_1.7.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_1.6.3.bb b/meta-python/recipes-devtools/python/python3-bitarray_1.7.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-bitarray_1.6.3.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_1.7.0.bb
index 16beab551..c91b7443e 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_1.6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_1.7.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/ilanschnell/bitarray">&quot;https://github.com/ilanschnell/bitarray&quot;</a>
 LICENSE = &quot;PSF&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d">&quot;file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d&quot;</a>

-SRC_URI[sha256sum] = &quot;ae27ce4bef4f35b4cc2c0b0d9cf02ed49eee567c23d70cb5066ad215f9b62b3c&quot;
+SRC_URI[sha256sum] = &quot;e31b472ac92e04ea943723cf781ec168e15049d91a3052203defb81652d2b086&quot;

 inherit setuptools3 pypi

--
2.25.1

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------2FC485CA832F21379D65D0EE--

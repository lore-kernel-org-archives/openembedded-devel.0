Received: from NAM04-DM6-obe.outbound.protection.outlook.com (NAM04-DM6-obe.outbound.protection.outlook.com [40.107.102.51])
 by mx.groups.io with SMTP id smtpd.web09.36123.1615212456053975441
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Mar 2021 06:07:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=iw6+KO6M;
 spf=pass (domain: windriver.com, ip: 40.107.102.51, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ur8dUzYRrJf/QXDIju1PPCPE3JVPeEzdGX0ckixeMdfvT9B1hqZH0uZT59JR2YUCWRLt1KACYbj+4+s7IAfLkYiPhq8WyZAxoZC6LVHFRAyZsLS5fbX+b7RLEGaCFwPJBcp8xA6ssEXQFSCEh/687rsRzt8sHrHoqxyRQaZQ21nRhX8eMevzmxa4vVsSXD/6cFdlwiAro283wRHiDmYABbd+AZ9Af2b3GKSrcCGgLV/wA7bV8Tn7aZCSZ5DUUU/v7Xhnll/c/FAi4dh9v7XlTfBZbR2dCgHeWi2fdowteBNId8qjl6uclKalbqGGali/E7fOJAi+Qr8LSviKQ42Bzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sctQ3NfDG5S4oyMIE5xnjrh0sCVIk/hEyW2PDXXmeXo=;
 b=Ici2jTC/2VOfHys/zjIxmCabQ86IMt+9dEFFf+1L8ohQMHCM56/pD0hiaphGqiWfMi/7gKTzfQm6iCRkJyE78bjLTFXhae15QlYsWd4NGNiTFEK4zi627evu5CPBjMtLj1hYQR5t1zknZQwqeIMzE4C4MVOe+lGp6VebyfLmdpwaPTLgrJWzhstxW6aLTbh1ic3Kzqn0Msj7jm53GTR0AtEeRv/4Il8zw7hTKDyaWgnOFkTTmpua4xj56Io4VtDETJT00+dMfgNaeLi2AAQmxubNPArAaKkkGVSVl4V0byQSw4wGY+o4ZSUWSpVbR4/vA/viYejs1Yfkm33iMjbuOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sctQ3NfDG5S4oyMIE5xnjrh0sCVIk/hEyW2PDXXmeXo=;
 b=iw6+KO6MH9RULr7kQjb+sVyOy0SdNyKdRIzfv0KSJu9IVCUK0MHD2Rn8/O2G5hruz9T8riiaJCDGTQ1tDuyiF0/NFEOlcaIpvilXNOh2DMwpKTTHZbUukMKKXJx8WRQZ1zZ/tE2BW2MWZb1CxRIQ8Gyv5xk3HMAaMrXUbk14pY0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3446.namprd11.prod.outlook.com (2603:10b6:a03:1a::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.28; Mon, 8 Mar
 2021 14:07:34 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3890.037; Mon, 8 Mar 2021
 14:07:34 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-google-api-python-client: update to 2.0.2
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
 openembedded-devel@lists.openembedded.org
References: <20210307163944.979682-1-open.source@oleksandr-kravchuk.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <8f9af1c5-c7b8-3506-c841-c70985647257@windriver.com>
Date: Mon, 8 Mar 2021 09:07:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210307163944.979682-1-open.source@oleksandr-kravchuk.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN8PR04CA0006.namprd04.prod.outlook.com
 (2603:10b6:408:70::19) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN8PR04CA0006.namprd04.prod.outlook.com (2603:10b6:408:70::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Mon, 8 Mar 2021 14:07:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 598b9948-c1a8-4849-b730-08d8e23b85a9
X-MS-TrafficTypeDiagnostic: BYAPR11MB3446:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3446746828050F9D8EBC1D159F939@BYAPR11MB3446.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dw9qcKAumgboF1LRW2tpVJJohgYtrO6mfKT+3/fKkr5C0RF/OaEUFxCnBNADGkUQaF7lYH5Wg3Zj4vo7Q2Ti7q+Mc0DJFaTZC4731pIS51f8KoFLRLJAVW3nGKYfHY6ta8LPUS6lswYvTEharlxHgKkFP1JzF2tBh42V4Ef/8R3giy/fzwDA9/SYIYP/s6RvRXfd1FdahVkhqkm5ujVrkz0zysCmdIKHWw3lg4hhILbU1nO99pTvJAfugjoctUmHshll2INOT5lD/3RKu6Vh2gGYlB+iQQqJ4xfB/vQOv9e/7PqIsymTw19fkFEyfZ9bDvvoqSlDl8wptklXTKiGeE2zuw58IK9PofcnNM81sn+jcbfCUKsNcdlmPSxXkmXJIGZoRgIqRQnpHVdlSbAKvJmvnGyI7KQHQ7utMXwMCC07ms8X+W+i4YG7H4WHzBHZr1Xr49jZbcP2zFE3653JQQkdX7Rl0C+r0nFNQAsn3PAL1DmQ57tQBE9TVlc7atyy9vAw4YkEum3BJ2AgXZfL8KNOVFyOmss0Hj4LUkJyYK9BMn8gnQC/k1M6emteW34tystqfbhiZp44OFviF6bbsqIo1qcQ+SjvaN+1V6+mDlTjnVsebPf6Yt+0J9s1nWsP15Ro8sY2EaFIpG1fMjYTgRGUw/fvOA1w2tEiI6opJVJG/70qluPKp4IiczJ3r6e0
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(366004)(39850400004)(396003)(376002)(53546011)(478600001)(26005)(6486002)(15650500001)(31686004)(31696002)(166002)(2906002)(66476007)(966005)(5660300002)(316002)(66946007)(86362001)(8936002)(44832011)(83380400001)(16576012)(8676002)(956004)(186003)(2616005)(33964004)(36756003)(66556008)(16526019)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?Z2hXU2NtNERTMTl0OFpCVjBza2J5OTlVcXBOQXFacCtzTFdjYW9GaXBpSG1n?=
 =?utf-8?B?SGJFS2dMWE5GenNLc2xDOTFVYXBGbTlTRmJHaUh0aENBWFVqMGlIckVBdzdC?=
 =?utf-8?B?VUNpdUV3ck1JallIY2FLTkVkcG0yeGd2ZlpuM1V0Q093RVErR2R0bk9qZUNk?=
 =?utf-8?B?V3VXeWYxaDB2S0hjZHlNZUtCdFVKb2xMTEwzOExmNi9kSVdoc1dVR3Q1Qi93?=
 =?utf-8?B?M2hVN2R3Ti9vNUtHcXk0Q3FIcGFnTEV0Z2N1aDZxYVFvUnZzTUtvQTREUkFi?=
 =?utf-8?B?T3Z5MUN2VUNrNEl3UjIzSmRnOXJNWVgzY3pWZ3RBQUVteUlCclVTWVd5S3N1?=
 =?utf-8?B?MlhxRGdhWkQxUGxwTHpHbEhHVTNiNmJTSzJSRTBUR2NseXl1Y0krZUpFWGM4?=
 =?utf-8?B?MW1rUDVtdWhlU1djU0hiSEVNUWVlOHFiaWRmQWMwZkdiSlV6MS9YZUFCZjM3?=
 =?utf-8?B?NkJSditVOGNzbExIcUd0S3Jnai9LMFV2Vk9Rc20rbXhmUHRkUmxLcWtrZ0ZU?=
 =?utf-8?B?TjZnZ3lMSmlGa0lFR3dFSmdxSkVYK0tDdHVzSnFHN3VYanR6TFZaVVFwOTQv?=
 =?utf-8?B?YjhLRVRZR3hubzduUzNTUXptdEYzSHF5aU8zZmJKK2MzYzFtd1R0VkhHZnJK?=
 =?utf-8?B?WmR0SnpaMFRyZ3VST05ydmtVT082MjJwWDlCVnp1R2pjbitZT1ZUTlFYTXhG?=
 =?utf-8?B?SVpVQmJOVEhmOGFnNXVWdmExYUVCZGlCMjBaTEZJL25mUzY1cU9hMU12T3k0?=
 =?utf-8?B?SFRSU2hvYkIyWGdhY0hwKzE3RUF0b0lMQXN6aW5jQ1A0QVYrWHNmc0FHZ3hC?=
 =?utf-8?B?UlRDU2s2RkVzZjRubFlON2N3eHZKT3RpTWpJYnVrUFEzOFM3T3oxSHB1NmFs?=
 =?utf-8?B?eWdLa0JWdVdZY1FUZFdJNDUxY3NBajhmWkZRYW9wYmhuYWZZb011cTYrNWJP?=
 =?utf-8?B?c1FyUTk5ZEVoTHpuenBZOEJjRi9obk9WeTE5YkNOQitMQzZqNW9GM2FqRzg1?=
 =?utf-8?B?dzJQY0l0cWppbFlKcXA3citkU1J0bWw2NVFZVmtjVmZ1V1QrTW9mdldTSXFo?=
 =?utf-8?B?RW80QUZYTjBsaWFtSWZlQ2tQeURYNTMvbHhNR1YxVTdwVllMbkZjWVZMS3ls?=
 =?utf-8?B?TXRobjZsU0dlSStHVEF0NkpBZURDQUJ4WDlNY204TDFhWEtLbUtZNHN4Y3hV?=
 =?utf-8?B?TUR2cVN1TlFQdExqTTQ0L0hDdjFJNnBMNjl0b21yaVZhMmFqZHRyZjZERWJE?=
 =?utf-8?B?Ty91WUlnRE5ZWWZTa1REWmVGL0xXUytZcGtZRmwyR2ZtUEpuRjFTT2hKd2Fp?=
 =?utf-8?B?QzgwaEdndjhXNDRIT0RIQm5DeUszRno3MjlSR0lKOHQ4U0Rma0Y0cWJ6d0JW?=
 =?utf-8?B?eUVLdFEza3JoSGJJV1FuZHhIMHlaSHV0NVF3NC9GMGxmeEZZRlUrREdXSkZn?=
 =?utf-8?B?ckZldkcvcy9DT05SRjRjRUE2NlVORldhcmNuNzBteW9KWHNMWmZub1B2S3BH?=
 =?utf-8?B?aUsvZnV3bWhrVCtkRTBVNkxXSmhvSWVlUUpDQ2FNcEFLY0JRYlJuMmVkejAr?=
 =?utf-8?B?MmpCUG1ESVJNRzFxYWM4RVljenJiV3duSFY4Ulo2OTBtdytxVmdRTmtaWGFa?=
 =?utf-8?B?WUtCUjhGZTE3eExwakhzdWVlRlhwNy8yTkIyZlFPOXpQeXVBZkh0ZlRTb1No?=
 =?utf-8?B?WWUvajZPOFBIamNXRFRCaVY5M0p5NTkvL3daS3FnaTU1S1RxTis5bS9Pa3Vn?=
 =?utf-8?Q?kJ9JHohafaxS4paF87/Isnq719QSrtCQ45Yt6bW?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 598b9948-c1a8-4849-b730-08d8e23b85a9
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 14:07:34.7954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 23YmVL1WydVLShBzHXsf63cIb95Q9hQv13P59X3rvjGHaWdRDDTj3TuR4M0NolhBn4rtkPjzmbYQl1ZGbIkSyjTh45KyJUc+PWhU2nkVj3w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3446
Content-Type: multipart/alternative;
 boundary="------------202860D8E6A3870F375F2EF7"
Content-Language: en-US

--------------202860D8E6A3870F375F2EF7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-03-07 11:39 a.m., Oleksandr Kravchuk wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...t_1.12.8.bb => python3-google-api-python-client_2.0.2.bb} | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-google-api-python-client_1.12.8.bb => python3-google-api-python-client_2.0.2.bb} (62%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.8.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.0.2.bb
> similarity index 62%
> rename from meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.8.bb
> rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.0.2.bb
> index 1774f962e..38aa349a6 100644
> --- a/meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.8.bb
> +++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.0.2.bb
> @@ -1,8 +1,9 @@
> -SUMMARY = "The Google API Client for Python is a client library for accessing the Plus, Moderator, and many other Google APIs."
> +SUMMARY = "The Google API Client for Python is a client library for accessing the Plus, \
> +Moderator, and many other Google APIs."
>   HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=94023d14f6b58272fd885e4e3f2f08b3"
>
> -SRC_URI[sha256sum] = "f3b9684442eec2cfe9f9bb48e796ef919456b82142c7528c5fd527e5224f08bb"
> +SRC_URI[sha256sum] = "48686cceb0dc8cb8b9ee1920ad7c0d9b499ef4fca0ca51c1c69f1e462a628011"
>
>   inherit pypi setuptools3
> --
> 2.25.1
>
>
> 
>

--------------202860D8E6A3870F375F2EF7
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-03-07 11:39 a.m., Oleksandr
      Kravchuk wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210307163944.979682-1-open.source@oleksandr-kravchuk.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Signed-off-by: Oleksandr Kravchuk <a class="moz-txt-link-rfc2396E" href="mailto:open.source@oleksandr-kravchuk.com">&lt;open.source@oleksandr-kravchuk.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210307163944.979682-1-open.source@oleksandr-kravchuk.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...t_1.12.8.bb =&gt; python3-google-api-python-client_2.0.2.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_1.12.8.bb =&gt; python3-google-api-python-client_2.0.2.bb} (62%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.8.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.0.2.bb
similarity index 62%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.8.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.0.2.bb
index 1774f962e..38aa349a6 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.8.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.0.2.bb
@@ -1,8 +1,9 @@
-SUMMARY = &quot;The Google API Client for Python is a client library for accessing the Plus, Moderator, and many other Google APIs.&quot;
+SUMMARY = &quot;The Google API Client for Python is a client library for accessing the Plus, \
+Moderator, and many other Google APIs.&quot;
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/googleapis/google-api-python-client">&quot;https://github.com/googleapis/google-api-python-client&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=94023d14f6b58272fd885e4e3f2f08b3">&quot;file://LICENSE;md5=94023d14f6b58272fd885e4e3f2f08b3&quot;</a>

-SRC_URI[sha256sum] = &quot;f3b9684442eec2cfe9f9bb48e796ef919456b82142c7528c5fd527e5224f08bb&quot;
+SRC_URI[sha256sum] = &quot;48686cceb0dc8cb8b9ee1920ad7c0d9b499ef4fca0ca51c1c69f1e462a628011&quot;

 inherit pypi setuptools3
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

--------------202860D8E6A3870F375F2EF7--

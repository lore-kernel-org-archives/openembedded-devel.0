Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.76])
 by mx.groups.io with SMTP id smtpd.web09.8295.1615813363515046986
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Mar 2021 06:02:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=IL+pj0b5;
 spf=pass (domain: windriver.com, ip: 40.107.243.76, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lJzIagpd5Y89TeG5HyXWboGs50hUFsMNPwuItW/a0ObyzY+Weaiv2exqYdkPvJd9umsuNJJdFK8tOKTK6CoilVmT6+W59M2O0JaOiKx8dk1ikcLkyj2nAjSzbegAZgm/PUuL40lDKt+ADwkxlDUnxwz54MSZ3k7OAb9xic/iOo600j/TPQzlchuucNPIIrfX7FxUJZ+xHWnaojd+ZWvx9QwOadp2TFkkNCPkApmT/P9iL1ltauSxtxvj9Ubzh90IYriNF+DrroeGeIDvprMtcUJutvPDfhUMMY7z8iuOg4y0hMnnOgfbBxkihI8utoWoITddN8n6NmPpO4UwMBi7dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DWlzkdDh3dB+ncPpoC9lhnpVem+VkGaM8SQZX8PAi3M=;
 b=Vdo/RS8EqYuG5k9ZJcEk36yNjuNFh7U5aLdLGBGKCT7CMXjeK5APordcY82cmGoWRJrVEKV4galqe1u1UShX6aT/GFTB3iOMSyt/djU0Z5croKamNjzjl4tp2XHwiFWLZ7S0x7eTZcovqGpJbob/VOhR7YoCaWlc09y732Ny1OF22VlmwgXy/4nEc6Dcnmq+JW8nwDBojRF4wq4MpVs9EsA4LxuozSBHW9TbmslxYqfgKXlDH4KKenLdddVnTJAP1Pq7qsYKt2jmA9fZGaqHOXvKQ4xwHx6qxW4PHwkXGsVrjCt5feImlFmGj4QTRBu6XUPQBpRJBkXxLxNOBj9aYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DWlzkdDh3dB+ncPpoC9lhnpVem+VkGaM8SQZX8PAi3M=;
 b=IL+pj0b5HE+5WhaOkE108Ge64F1W0ERXVwhkPNjUClOpC9V6tN5oWCnLKhgC/3IJ9Y/S8BL3sC0kRNMOVrMJM2Ur8yhrZcp4muMp1OIqCNFjpaZn3JXcauovhUBI5BvF7Jyf6Z+66sE7bz/LeqxSOFdxvKxXEzu2s7R4mJpoSuk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2901.namprd11.prod.outlook.com (2603:10b6:a03:91::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 13:02:42 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 13:02:42 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-grpcio: Disable for ppc64le
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20210312072804.1668163-1-raj.khem@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <d8503d85-5b96-fd4b-3d8d-d3ed09144e56@windriver.com>
Date: Mon, 15 Mar 2021 09:02:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210312072804.1668163-1-raj.khem@gmail.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN9PR03CA0386.namprd03.prod.outlook.com
 (2603:10b6:408:f7::31) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN9PR03CA0386.namprd03.prod.outlook.com (2603:10b6:408:f7::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend Transport; Mon, 15 Mar 2021 13:02:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 90d8e7fc-e005-45b7-4372-08d8e7b29e37
X-MS-TrafficTypeDiagnostic: BYAPR11MB2901:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB290172D42924FE36BF3070509F6C9@BYAPR11MB2901.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3CfJZ4x1MLTlp9JIlD1BDghiVcED+I+IFGnQVFZuZZLrNY+1AAKVatJG8wu6P6LmxwIfnXnxABCeR2ryV0LsDMiopGlaZWrQ3g+LK4uQlaJPuDhi+DxjGGPgfsAeJD7CFJpmnbvKSvbUMAgfjIaxuCKLfxJCLBhLDfAMGiC7TwZd8z4wXJF/FhnGNYxn6MJ//m/vy4wM+r3dOVZPRCT4vEUa16ux90TgtHp4hzJo8BkVYKo3iZWYoidrWKUEPS3Fxr4r5XWtABaZzT4GTKswd9xRmkG+vxmaGQxujllfbsh8ZzF5Po3Dkn4OslD34fOkaThwNZ/hER5eIoFJxtSMy2GPFmYysxQr8xGwZUgug6YtBkImYqm82KLd7bdbB4tHP1QxbuUBzRRwQlxnpfBmq8EDB/Jc8EDDzqQQmEm67l7pp7jME+kdsftcpnc4uqwr43qLida2sWr+JA58NSyvDTEXQsJhTTG33+StBwSY1S53ix1sh2qQhd3kdrE1HD2/ykQvYAzK06vTwO84t02zCidvH71SBWLpmL8iq07zUeYvzWWrY+R8coz7ep3GSY9RfIzUMmoj93mLKrPd1s1YmMoByFyJRoiqNccoadm8T1t1CWFbOZ0MalM/L+Tl5lIk4/QNN7cr7JCAQ/4jicc1FG8CFZXLjok898dVqDOJJ3+/JZNTtY230/mNFnmKbr22RgjaRdwknXJ3GNwaIvphPWuEjHV7QuUTwYHd3o3SDWE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(376002)(136003)(366004)(396003)(26005)(36756003)(2616005)(8676002)(166002)(956004)(16576012)(186003)(966005)(31686004)(16526019)(478600001)(86362001)(83380400001)(66476007)(8936002)(66556008)(53546011)(5660300002)(33964004)(6486002)(2906002)(31696002)(44832011)(316002)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?aXdRVGphdkFGTENJMzgzUnk2R3NXc3hGMVhWQXVEMEs5cTg2Tlk2WmlUK21Z?=
 =?utf-8?B?eWhIS0NEb3JQR3pYWHB3aFVRa3NraWt1VUVBS1VQOFJEZDJ4WFRSbVpiNGdB?=
 =?utf-8?B?TENHbkpHd0cwTlNBczNDV3pZWXdKSURDQ1UwdEtYUTNsdEcvMVVkcVdHZisx?=
 =?utf-8?B?dWFqang1U2N3UEExWG8zc3c1VHdXb29tVDZFcDNlMUVCcTZMZm9aT0FjaWdv?=
 =?utf-8?B?VFVaSFBldHBkUVFVcmJLbnZSYnNKbkZ2NngxN0ptUEtuRnc0WHIrZ0FCTTk3?=
 =?utf-8?B?MjdKSnY4TUNwQ1RXU1RoeXZ4V083dG5nd2ZQNGI1T2c2QXlnK1JTQ1FueHRC?=
 =?utf-8?B?bE9CTXVjMDd0VlJ6UE1yb3NRTnRVSTY4dXNva2ZRVEFZdHM3M2hsNThpQ0Zz?=
 =?utf-8?B?UTY0dTFjNkFzMGlaMjBaaU5tSkNZeEtQQUQ1NE9ZOU1GMzg4OTZkMzNGQXRX?=
 =?utf-8?B?ZHVhRmhVZkdIK2s5Tm44TEc1YjU2ZEhjcnN6SXV5SUxzTDMzRi9WMTFjb2Fa?=
 =?utf-8?B?NXptYUdUaFIzY2hoV1VhNG9DdE45Nm9zQ1pXV1RURm5kdkQ0aUtacFVWemE2?=
 =?utf-8?B?NDZZblFncGh1N0F0UzRianlVdkcweTJDMjE5YUl3RlJkaGJ1aUVyTVU0U0g4?=
 =?utf-8?B?dUx2aUcwekVWMFRsYmxNUExSZUhuV0NtT1h4MlFoMURpWXdZR1d0YW01RXVm?=
 =?utf-8?B?UStzUnJxTnFxc2xzMnJ2RG1oTGtnOVl1OXN2Nzhvdm5mMldmVmx3Lzh3VFFs?=
 =?utf-8?B?WEw1Mml0WnJGR2VMRU81aHgzcDFLSFpoRTFxd1ZJb2Fsdng3SDhRZndDOHZm?=
 =?utf-8?B?d0tkMERmLzRaLzB1Y3JLSWxCR0Q3ZkszY1p5QmN3cjZRUUlxY0dBV0VRK3Bv?=
 =?utf-8?B?c1RnWXpPWHgrdGpSYmVHeFN0YUNjT05lNEliNGdYNmxtdUxvS2JSS3RST28x?=
 =?utf-8?B?SzUwdHhIbm9GV1RzYXd3aWpoSGx5L0JhalNhSThyUU1TWVUzZzFLVHhCYU5G?=
 =?utf-8?B?L3hZUjhJNFExZkJxV1I1NWpBV0Q2a2E4NU4zeFJxaTIvWHRGYTR2enZQZFZL?=
 =?utf-8?B?Sk1CTEdjblkxaytmMDI0U1hOenFhUFdGcjlUblZlMDB3bFB3NE9FNU03SkJF?=
 =?utf-8?B?eDFmdzdGWUU1TS85azVLL0lBTHI4TVM3Z1BHeDFGRXlabnF4cGpFd05vcTdL?=
 =?utf-8?B?MnF4NEFuNXVnb0FLaWxCWTRTSSt3ZDRxN1lqb0hyNGUzR29JTW1nNEJuenVm?=
 =?utf-8?B?dHJBL0J5ZDBmaVZPcEJPWmxiQVBwYjFvV0txZ3hSNE8ycGs0azdGZkRZeEE5?=
 =?utf-8?B?ejIzdU0wUFUrQytLNHBBU2FSVm5kRTlqcUxDWUEyVzB4R0MrY3RORHBxQjho?=
 =?utf-8?B?WmpZNWpmYUdZTXRSNnY5aWdLTEpJeTlURVh2M0U3Wkt4YmVZWkZXcUs2TjM3?=
 =?utf-8?B?MVZHUjdmY0J2L0UrNHAyL3NlZFZBVWJUVUxKNlBuSHRSV3drOFJNMkxSUkhj?=
 =?utf-8?B?MlhXS1BldHIxdmVWa081MGNscFVmTUwvNkUwRDZBTWZlT2dHaEo3ejR5M2E0?=
 =?utf-8?B?YXRvSSswcTQySXMxN3p0NmdlRUFHeVJKS2JsQnFaaEczc3krenJKUmwyREJI?=
 =?utf-8?B?OGRLaUwyeTVsQ080cTBqRlFZUUVmUkhKQlpEZUVVSEozMlVZT3BqUjRPYVpQ?=
 =?utf-8?B?UW4wak5SRjVNd2dKSXArVlEwS25IVG54SGloRFowUHlVMitqeEcvTlUyeG1t?=
 =?utf-8?Q?9aUQhN2H1jFL3u7VYBuSe+CKL0eyjUdu0LeHYgW?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90d8e7fc-e005-45b7-4372-08d8e7b29e37
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 13:02:41.9280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5NbL2EaTqbWDMHJ1vYqBHhXpACMXW09ZLHnAyQLcMo8nW7gkl81bztHO6WTPdBbzvfQGqdloLXvcC5c+xPIJxiQym1iAtG/cBzDHq62SttA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2901
Content-Type: multipart/alternative;
 boundary="------------0CEC5CCF5E712D02BA5BBC66"
Content-Language: en-US

--------------0CEC5CCF5E712D02BA5BBC66
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-03-12 2:28 a.m., Khem Raj wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> abseil-cpp does not have support for ppc64le yet
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb
> index 3d875bf4ba..fa030b99e2 100644
> --- a/meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb
> @@ -43,3 +43,7 @@ CLEANBROKEN = "1"
>   BBCLASSEXTEND = "native nativesdk"
>
>   CCACHE_DISABLE = "1"
> +
> +# abseil-cpp/absl/base/internal/unscaledcycleclock.cc:100:2: error: #error Must implement UnscaledCycleClock::Frequency()
> +COMPATIBLE_HOST_powerpc64le = "null"
> +
> --
> 2.30.2
>
>
> 
>

--------------0CEC5CCF5E712D02BA5BBC66
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-03-12 2:28 a.m., Khem Raj
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210312072804.1668163-1-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

abseil-cpp does not have support for ppc64le yet

Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210312072804.1668163-1-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb
index 3d875bf4ba..fa030b99e2 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb
@@ -43,3 +43,7 @@ CLEANBROKEN = &quot;1&quot;
 BBCLASSEXTEND = &quot;native nativesdk&quot;

 CCACHE_DISABLE = &quot;1&quot;
+
+# abseil-cpp/absl/base/internal/unscaledcycleclock.cc:100:2: error: #error Must implement UnscaledCycleClock::Frequency()
+COMPATIBLE_HOST_powerpc64le = &quot;null&quot;
+
--
2.30.2

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------0CEC5CCF5E712D02BA5BBC66--

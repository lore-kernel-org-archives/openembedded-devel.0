Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.70])
 by mx.groups.io with SMTP id smtpd.web09.19184.1606484971768413241
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Nov 2020 05:49:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=P17+7JE1;
 spf=pass (domain: windriver.com, ip: 40.107.237.70, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DtbK1v7WVh1LTm73d3RPPjnwK0l0u4Z2wQcLqkLWsBuutTuqYbr1BwMFgsFJHAKxBz6OZIbNonGNIE6ULETxLaM5GY8V7O8h2avRSIDIkIK6eqkRA+t5n+n/DnCFIpa5etwHeLPfeb4RzE9jfBVbjd1r2IvJ5WqZ5g9ueXTCYZFM476+Zw5fwsaXcRmwx2Rtx/MuibrXP75foziM+iFOxjwV1sqSevjZPodKgb4sL2JhLbU34arOp3+ph6rWtp5rBpUpRtgMkVck6t46NWufCA0+o/pLLcrXjrGTYdlB+zxEjndK0qvqhXNpYmjzARkHHc/eFItANpqBnKdEfbn7rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3kIUoeggHyKhA669iHKHmCBPkDT+go+q05Kh/63dfpY=;
 b=dBXhlIQh3rv/QDCf04IQdOlX1bTPB2Zwf1Ef7tSDtPGvzK19c+rTHgpednx1J/8GtHGeMbE4rD3bVcoe7u7LijOOV2Hwxjnaq9yTT5cJf3BcuTUlqgghFYWSjLyYbtNB6e0n0JYGJ/EsIoWNzRFLuZHfJFqSzf0HAcV9tkJ0R+fZ89tzD+rxU9HK6Nu7e3/gywLIUki+gqhCnxw/8iTJwB04qo9O3xkEBb8+3vATi1YlCSLiKKXzmHN5+FnZHzgwVchWdoL3LhcFuDrWW35IpBZZocCVwt3boOoGykRdpjDI/0DtQp88tzU2OWzCS3VG/S1Ar2dL5G0rRuc0g/x0WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3kIUoeggHyKhA669iHKHmCBPkDT+go+q05Kh/63dfpY=;
 b=P17+7JE1lMIT1D5T6DRR3xCwc/s+SPJTsFNp9PYpfLYlOxu67QQPOrwr8ZkmMGIZ0eHTTzLZturROpOGn+FV/HCCsEI3YbHSExBGFjg7YjPtQYmqzZWsMZj2mTbUoEH1AN1NIH2+5vf2CR/4L4MGIV/XUXsF9b6EwtoixYJ7+1c=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2598.namprd11.prod.outlook.com (2603:10b6:a02:cb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22; Fri, 27 Nov
 2020 13:49:30 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498%4]) with mapi id 15.20.3589.030; Fri, 27 Nov 2020
 13:49:30 +0000
Subject: Re: [oe] [meta-python][PATCH 2/3] python3-bitstruct: Upgrade 8.11.0 -> 8.11.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201126180347.13763-1-leon.anavi@konsulko.com>
 <20201126180347.13763-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <a17ed490-a31f-50af-9994-482246fbb2e3@windriver.com>
Date: Fri, 27 Nov 2020 08:49:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <20201126180347.13763-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YT1PR01CA0049.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::18) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0049.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend Transport; Fri, 27 Nov 2020 13:49:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b4a7aa14-8106-404b-3de9-08d892db4390
X-MS-TrafficTypeDiagnostic: BYAPR11MB2598:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB259835DCA73D1D3E528222749FF80@BYAPR11MB2598.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:538;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pd/Kkdc8qzUb8pVSeCiHnouS/nKW0ZLSuFBZSPhBhlvWDAZrUJxCApUdzKlL3PsOdDEvoBriQ7DJ5Mg+HB7ZJ+XuVTzowqlh+T5LMgxPHyuqhws63bjxhNi7cPMLrIcnLPtTjeRBAt4IcpKGhKlA3Zg8RtX/gvobn1q6cKAoA2U5b5sZGkleKlPPFIjDljQZVqVfJr1lDEsiGdUj2VVWXvrqSQ7qD6MlvXkJIFCzN9+GIu0dKMX7Put4OvIW4Bl7FyWheK8g6FmydAGu81nP0qGQGSRtNvLKsABBs0KkWdIrysd3sbgIjXiraijyP8/zrItXRKyaPF6/eBMonipyvRQmtGFrDewzyOIlYUWlz01ID59cIj0QTMVet/3Tc9HYKDu9OaWJNuOtRuDRbGVrQ9MRfWvjDs0/8lCTFdpNi6joZXX6P2T+E84RqhaKuXat9RzfTpL6XgDSsBLpVzr5hQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39840400004)(136003)(366004)(346002)(396003)(186003)(2906002)(26005)(16526019)(52116002)(6486002)(8936002)(83380400001)(53546011)(478600001)(66946007)(33964004)(86362001)(966005)(5660300002)(2616005)(956004)(166002)(8676002)(316002)(31696002)(16576012)(4001150100001)(36756003)(66556008)(66476007)(31686004)(44832011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?QU83MVNZTW9BRjRyMHhlR1dJVS90amU2bXA3Wk1iSDdXalo2U0ZsRWNRYjRT?=
 =?utf-8?B?OVNrYW9lWisvVmNQODJVSzYrTjNXN29QRzJOZUVFcEg5RjE2a1JvN1J4Znhx?=
 =?utf-8?B?S3dMMVo4YUk5QjJhZTZvV3h0ZkIzbDhoaTFFK1U2aXBXWUV1dkVsdFhUQnBW?=
 =?utf-8?B?NkdaTGtoQnkzeENWa3NCandNeERGOVNjc1VDWEh5ZVJHeHVwUWx6TTFLeVN4?=
 =?utf-8?B?TGphQUNqdHRzVzdnQUdKMUYzQkV4WHFhd0lCSlR6c2J6MSt2ZG95UXEwUVRU?=
 =?utf-8?B?dEM0c05zbTY4R01LQk5pV29PYXBtTWR6VEtoZ25xNTVFVDJpQndrM3czcFRF?=
 =?utf-8?B?OVdnMnFZL3ZKWitVeXFHTXdVb2Z6bXliSE9aN05ZYW8rR0YwbTBsb0Nxc2ZG?=
 =?utf-8?B?SkFQSUZ6bDNLVlNIVkY5Tnl6VE43Zm5GYnZIVEVmU3k2c2YwNFZXbklHZWRm?=
 =?utf-8?B?T2VBUGlDaWltSXY3Z2x4RFBJNnVZRnQxSUJ2c0ZIMCt5YmZHd1JiY05pL0NF?=
 =?utf-8?B?YlpFNXUyMktRRjRCM21JNTBEQld1S3FHTzFtbm1iVnhKN3gvV1pxZXFZTFFr?=
 =?utf-8?B?Rk9Tanlmekx5UjRpWmJIVUhuUlpiY1hnVzA3WHlzVEwxSVNVdEhHK2JtaHdF?=
 =?utf-8?B?N2pIak4xbGZLcXZlc3RXR3ZXd2RaamJuRTVxcWg5MURZTjFMeWtCZGxUTDBD?=
 =?utf-8?B?SEdxanJsSnpQaWErcktiZXNNSzYxV2I1Ky9jZ0gvM2ozUGpyWkJvYkdRL2ZC?=
 =?utf-8?B?ZUlyWjdMdXg3TkJzK1dpL3NrY2N3OXBqbGJKWCs4RG9qS3YrRmMzZGhYTmtW?=
 =?utf-8?B?d1luSW01c1NiZ2tNR3dTWTdQNXJSa0tqL0FpWm5jRjlhTDRia0V6MFovQytt?=
 =?utf-8?B?d08vcGpSVXZqRmxPWDFjMzZjSWJzMy9UbTJidmxLZkJhZ09jNk81Y3M1VEZj?=
 =?utf-8?B?aWl6RS9iTWlqSnpoWTJmTkF6NXd6Uy9ScGhOaVIzbndEdi9UYVQ4cmkxd0l6?=
 =?utf-8?B?cmN1UG1Qa1B2Sm5aOWU0YVpxMmg0Nm9aeWhKdHhFTVNpME1oaVczK1B3cjU4?=
 =?utf-8?B?SDJyWTE4OVZta3VzaUZuR1FLdFFxdStOL2ZvWU1pSEZJVDR4NElMT3d1QTlo?=
 =?utf-8?B?VXJPZ3FxV2c5aGZ2KzJNRk9tNDZFRjVTWURDQ0p2SFdlTndpNUVpSmJ1bUk5?=
 =?utf-8?B?bUFzTGpRSGlsYnZ4Y0hzbGFHZHIyd0ROUUUxOXpDeDZvMm03T1dKQnphalVL?=
 =?utf-8?B?UTh3Smh5UUp1V1dITHNrZ1FGWnluWTg0SVhsYjlxcDhvSXVZR0h4dVRxNlV2?=
 =?utf-8?Q?Oed9BoQSKNo9/58HTGR709pdEFKi/d+512?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4a7aa14-8106-404b-3de9-08d892db4390
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2020 13:49:30.2904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s18NvrCqPB+SH0toro9oktTqhGbfBqgvSXAY4CgCBV/0la41VKmaQXeca/urvWK8BWMYF+pIccZheLcI7PNsyC3Kope8ZC71i/0c6BJ8mko=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2598
Content-Type: multipart/alternative;
 boundary="------------D3BE683AFC87B18DA8BFF516"
Content-Language: en-US

--------------D3BE683AFC87B18DA8BFF516
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2020-11-26 1:03 p.m., Leon Anavi wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 8.11.1:
>
> - Fix memory leak in unpack dict C extension
> - Release with python3
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...python3-bitstruct_8.11.0.bb => python3-bitstruct_8.11.1.bb} | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-bitstruct_8.11.0.bb => python3-bitstruct_8.11.1.bb} (70%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-bitstruct_8.11.0.bb b/meta-python/recipes-devtools/python/python3-bitstruct_8.11.1.bb
> similarity index 70%
> rename from meta-python/recipes-devtools/python/python3-bitstruct_8.11.0.bb
> rename to meta-python/recipes-devtools/python/python3-bitstruct_8.11.1.bb
> index a25380418c..49b31971a6 100644
> --- a/meta-python/recipes-devtools/python/python3-bitstruct_8.11.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-bitstruct_8.11.1.bb
> @@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/eerimoq/bitstruct"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
>
> -SRC_URI[md5sum] = "8eaf853c95e10ca4b6bca2fe5ff307c6"
> -SRC_URI[sha256sum] = "2b13f2c3e76b49e8cd854f7a1da590bb73ecbc6cbfacc2d479eacf2b88282d5d"
> +SRC_URI[sha256sum] = "4e7b8769c0f09fee403d0a5f637f8b575b191a79a92e140811aa109ce7461f0c"
>
>   PYPI_PACKAGE = "bitstruct"
>
> --
> 2.17.1
>
>
> 
>

--------------D3BE683AFC87B18DA8BFF516
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-11-26 1:03 p.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201126180347.13763-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

Upgrade to release 8.11.1:

- Fix memory leak in unpack dict C extension
- Release with python3

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201126180347.13763-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...python3-bitstruct_8.11.0.bb =&gt; python3-bitstruct_8.11.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-bitstruct_8.11.0.bb =&gt; python3-bitstruct_8.11.1.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-bitstruct_8.11.0.bb b/meta-python/recipes-devtools/python/python3-bitstruct_8.11.1.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-bitstruct_8.11.0.bb
rename to meta-python/recipes-devtools/python/python3-bitstruct_8.11.1.bb
index a25380418c..49b31971a6 100644
--- a/meta-python/recipes-devtools/python/python3-bitstruct_8.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-bitstruct_8.11.1.bb
@@ -3,8 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/eerimoq/bitstruct">&quot;https://github.com/eerimoq/bitstruct&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd">&quot;file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd&quot;</a>

-SRC_URI[md5sum] = &quot;8eaf853c95e10ca4b6bca2fe5ff307c6&quot;
-SRC_URI[sha256sum] = &quot;2b13f2c3e76b49e8cd854f7a1da590bb73ecbc6cbfacc2d479eacf2b88282d5d&quot;
+SRC_URI[sha256sum] = &quot;4e7b8769c0f09fee403d0a5f637f8b575b191a79a92e140811aa109ce7461f0c&quot;

 PYPI_PACKAGE = &quot;bitstruct&quot;

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

--------------D3BE683AFC87B18DA8BFF516--

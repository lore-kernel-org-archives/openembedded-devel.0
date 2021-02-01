Received: from NAM04-DM6-obe.outbound.protection.outlook.com (NAM04-DM6-obe.outbound.protection.outlook.com [40.107.102.63])
 by mx.groups.io with SMTP id smtpd.web12.33677.1612185815733849104
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Feb 2021 05:23:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=gsJkn0tU;
 spf=pass (domain: windriver.com, ip: 40.107.102.63, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gz3vbHYUQF96F59t2EKbpNM2JeVVJdwNvrwzHlDODJxrrm4QPXineR84eceQqVyXRO86J/l2HAfUP00lpk22ibPFU64go4+Xpo52UqowlvsrrTyfho6jyYBka59/8vRC4LAFK8aKIOH7hyaoQCc1BczoB5VimslFMp7mVvKAQrLG899maxjxQld2jmgCMt2gHzmXyejXX/MZjeJe0ZDUtDAZv8/Ja8IxXhkY+pErru7EveNHkXGMJ6ENYCZ5R66+J+HFMQltUUak65N5CeHCvuRiYqgt24CLE4Xkr78oB5a30fqLYsiipIhw2j5B13Q6XrAaWcHqU6b+5PVz9eVO7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SMLL9ymVsjvfVS2VH3UrxGSlM+Gr8byuDIwFjAFkhtE=;
 b=mDRSE5/hLz3knpAl3LKYgDg4f/pLwjTfQJ0fnVjcSyLb7aBdvZA3SwYIJfSbYkvlV8bAlYTbZr2dSF1kehWJm8MLxRMDZ5UsQfyaISNOGgNq4EpH6YzxgLN8Nk/ZUcJantmcsyfQo4iOsZnNoY4eknG+5aRDIJ9vEiztdfXxuLJiTQO9rJglKiJkuS4/V77DWg9duDWYV5VUs8e3zshfJZylV8/gDH8YsKiVbHZW9dsgGbY2yj7rex1FGT//wN0EjL2K+dGdefV307XyMmGrFt5Y/g7rYqRAZcp1gti3dwEgb4lnCqkyf6f+1Uiq6gi6fM3p1PWR+dmLzGX/C5Iy2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SMLL9ymVsjvfVS2VH3UrxGSlM+Gr8byuDIwFjAFkhtE=;
 b=gsJkn0tUgUUbbE7vW0lDQ14hfdqAWr06Cj3kdpTaJd5dH0yQdO1Sg+2nJIeLfk85chAzvTYqjCdPX4LbqwwF8gvSkrS/ATbaPJ17uuSU37uOLZTRI2Mf7t4dTrF/VDThI1RKDWRDAW6cmW/cLrDbzLfNk7JEBzem2Sm3uz1ZJ/8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB5165.namprd11.prod.outlook.com (2603:10b6:a03:2ad::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Mon, 1 Feb
 2021 13:23:32 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3805.024; Mon, 1 Feb 2021
 13:23:32 +0000
Subject: Re: [oe] [meta-python][PATCH 1/5] python3-gevent: Upgrade 20.9.0 -> 21.1.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210128102903.11760-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <899dc2ff-ff26-c4f5-9a93-56d2ad0a19c7@windriver.com>
Date: Mon, 1 Feb 2021 08:23:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210128102903.11760-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN0PR04CA0023.namprd04.prod.outlook.com
 (2603:10b6:408:ee::28) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN0PR04CA0023.namprd04.prod.outlook.com (2603:10b6:408:ee::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16 via Frontend Transport; Mon, 1 Feb 2021 13:23:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6262f73e-afd9-4de9-64c5-08d8c6b491f6
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5165:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB51655E6CE8663AE6662AB9D89FB69@SJ0PR11MB5165.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BswkqJgoqWb471ZGYCrXp9/w1UaSuJYU0ChXF+tIY6vSVHWAggJ1J2LESlpMbIPYijl3Qa6BLW2CbFGOeGyyPrIpCQR8pNUv+nMCcmNYiw3M0JhFIVIYN9pmmFhGDAKSHOunotTCfcnfXsRqW66HHjDfQFLozaZ6CrTAakrn+888Y7Zx6exRf24r0bKJ9Ajou746eAFgT63RJ3I7iW3qK/lOw7XZGaDLTHzAj2h3MjR5flLXypBuC0zTsCNkMUpQLCWFcI/8Mg+IhbJ2bJ6v4A0Wu+H3VvKH4Vsyx2iZkR9M64d2mrgSxeCfotVw21pKhANCsVeM9al0qo60zmV3EU6jscm90rX/FlT08yW7s+cQ7oPnXHjaFR6qHfXNNQAGisnsvMJclpT8ImBMt1VvEcvM1WP6CMaxA1bjssVLKV+t/xqesi8VjHniEWc6cPP/+W5hbMBb30TXWMqpAPHhZdrLlipiYrlpO0urZK+ML4bkJbXzZkgUB8OkPNeYvMSYXvWoVqW+JV6GhdyLqtao/IkPls0JcOerje++dp3Tj1OiWdscBVJ+T5NE4m/IZM+xme+7+Olz7UQglOAA8vhP+LP7gEAcdlZQi8f85CL3q3rvhZrFO2K9xgPYbBlQ1/I/lKlRePnsdbRPYbh4sOoBi0R6pYIcOrxJLolRVuwMF5fLX3cDpLA4TtC6aobIpp/p
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(396003)(136003)(39850400004)(376002)(5660300002)(66476007)(33964004)(66946007)(16526019)(2616005)(2906002)(36756003)(186003)(66556008)(86362001)(52116002)(31686004)(6486002)(8676002)(966005)(956004)(53546011)(44832011)(83380400001)(26005)(478600001)(316002)(16576012)(8936002)(31696002)(166002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?MVc3eTJBTzU0Q2RDSEdiQ041b1JYekVuL2FpN0NxQmtORVJjREhIS1BUL1hx?=
 =?utf-8?B?WFMxbW9XWG9CVlU0MlhmUzZTSWpGY2NHVkIvTTZsNHhhQjE2L1J0RmRDZFhD?=
 =?utf-8?B?eTNudEpnY3VYYndSTFpod0RpTC9PREVaTUVVQ3RVTkhBMTM2ZE9DZVBDZVha?=
 =?utf-8?B?ckdURVJ2KzNlemJpU0xEZGJwSXFQSFlNbzNSeVlDK2FmWURsTmhnSUlhNzJw?=
 =?utf-8?B?Qmkzc0xyVklVMzdLdXh1N3VKa0JCMzdNS0kvRnVjeDI3aE15OVRHNDBab2JB?=
 =?utf-8?B?TGgwOW1UY05lU0tWVHFPY2pOaUVVSlo0Z281V0U1eEJSbEZCRytkTUNEbVhv?=
 =?utf-8?B?c1dzbjF6RTMwVkVOTGRFVGZWaWV4aENaTmFqNDJtUFgwRzg2SHNPa3JlcDBv?=
 =?utf-8?B?MndFTDVnMW96TVpIekJmeDNuZTNwT3ppT05FNjV6Z1hqTTZtcTdFdEJydDl0?=
 =?utf-8?B?QUNFTWd0VHJFME00L2l1RzF0cHUvKy9HczYwTzdweXNZUlZqYWYyUy9zUGVN?=
 =?utf-8?B?aGZRN0xBZWp6TzFFRWg4VXh6RGM5TFZFOFFrR3VaeHlLWXlqNkNkM0ttRkZL?=
 =?utf-8?B?eXN1SlJ0ZHhYS2Z6czBMaXJxK1d2TkVkVGxDWW5mOE14SFJrbXBFVUtPVzQv?=
 =?utf-8?B?VmYwa1prckVnZjRPang0SEhDQk80QlRxVVdlWEkzZ1lpMG4wWk5XbDBIMVRy?=
 =?utf-8?B?cUZCVE9yc0JQcTZrajVoajhZRGRONjY5VnVZVTVsb2NIQjRrRlJpaTJrREd6?=
 =?utf-8?B?NjFrOUpIeU1XUUt6UGxzdzNUSUNhLzJySkVOTDV6UGV0Y0UwMTBFQVhBZS9M?=
 =?utf-8?B?SVA1N3NtN1B1czRsaExyQjhrNjA3WFpudWdSeWQrTEcwSE9zTldnR0xpZ2dw?=
 =?utf-8?B?WENvNjQwdWY5a2Z5QmRmcURMVUN4ZitZMjZVZHI5Y1JpZkZ5MmFGM3pWSFM1?=
 =?utf-8?B?elJqd255YkcxR1RiVHNFdWJBNlgzUUF2S0xTMytyUVJKaE1ZbHFaZGorSlNI?=
 =?utf-8?B?YmUrTks1bi9WbE9GQmw5TTgxd3ViVE44bWI3dXY0V2JqbE13OW0yTE51TlBY?=
 =?utf-8?B?Y1EvNVFtM3NmQ3VwSFhTUFAxalFaTk5oUXRvclJZL0VYZTVFUHlocFBiRWdT?=
 =?utf-8?B?ZVBQTWNwS2x5ZmNNTHNnR3R1dWVDNFNkT2x3alRoL29ySW9vbC9hWnFiWEFY?=
 =?utf-8?B?bTFCV2FXMDdYL1FNN0xXQkxlbkRadUdYdE5JclVxRU1jRzhTaE94WDN0dHZ4?=
 =?utf-8?B?QzRPOUEydExLa0dONFhJRFdpK1QrVFlKeUtJNGZJbmNpUEZwYkwvUURETHJG?=
 =?utf-8?B?dkVZenh1NzBTeUNKcEkyUU9WZ0ZjVFJmeXlZT1FWOC81ZWw3ck11djVVZS9n?=
 =?utf-8?B?YXBJUGZRR3BXWUxZek11TkNZZmYyR1VNYm0yOVdMK3o4SVB3bjFjRm9STEZE?=
 =?utf-8?Q?QZb8IN2B?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6262f73e-afd9-4de9-64c5-08d8c6b491f6
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2021 13:23:32.1700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g8n+YHnOY++ihGxtGp4v4xQwUV5rBtjHnvm2VdzsJKLn5GolCHsVVCL3atNMryHQrHPId6a89+eIPKzEMpqmVch6v0G3Fzv/SXqKHNRIsKk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5165
Content-Type: multipart/alternative;
 boundary="------------56305B6BB1A0960273B58E34"
Content-Language: en-US

--------------56305B6BB1A0960273B58E34
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-28 5:28 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> - Update the embedded libev from 4.31 to 4.33.
> - Update the embedded libuv from 1.38.0 to 1.40.0.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-gevent_20.9.0.bb => python3-gevent_21.1.2.bb}     | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-gevent_20.9.0.bb => python3-gevent_21.1.2.bb} (89%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-gevent_20.9.0.bb b/meta-python/recipes-devtools/python/python3-gevent_21.1.2.bb
> similarity index 89%
> rename from meta-python/recipes-devtools/python/python3-gevent_20.9.0.bb
> rename to meta-python/recipes-devtools/python/python3-gevent_21.1.2.bb
> index 06c45f2ed..5edd96b34 100644
> --- a/meta-python/recipes-devtools/python/python3-gevent_20.9.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-gevent_21.1.2.bb
> @@ -20,8 +20,7 @@ SRC_URI_append = " \
>       file://libev-conf.patch;patch=1;pnum=1 \
>   "
>
> -SRC_URI[md5sum] = "9366ee7eebed48003f8a748568ef1f70"
> -SRC_URI[sha256sum] = "5f6d48051d336561ec08995431ee4d265ac723a64bba99cc58c3eb1a4d4f5c8d"
> +SRC_URI[sha256sum] = "520cc2a029a9eef436e4e56b007af7859315cafa21937d43c1d5269f12f2c981"
>
>   # The python-gevent has no autoreconf ability
>   # and the logic for detecting a cross compile is flawed
> --
> 2.17.1
>
>
> 
>

--------------56305B6BB1A0960273B58E34
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-28 5:28 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210128102903.11760-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

- Update the embedded libev from 4.31 to 4.33.
- Update the embedded libuv from 1.38.0 to 1.40.0.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20210128102903.11760-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-gevent_20.9.0.bb =&gt; python3-gevent_21.1.2.bb}     | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-gevent_20.9.0.bb =&gt; python3-gevent_21.1.2.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-gevent_20.9.0.bb b/meta-python/recipes-devtools/python/python3-gevent_21.1.2.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-gevent_20.9.0.bb
rename to meta-python/recipes-devtools/python/python3-gevent_21.1.2.bb
index 06c45f2ed..5edd96b34 100644
--- a/meta-python/recipes-devtools/python/python3-gevent_20.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gevent_21.1.2.bb
@@ -20,8 +20,7 @@ SRC_URI_append = &quot; \
     <a class="moz-txt-link-freetext" href="file://libev-conf.patch;patch=1;pnum=1">file://libev-conf.patch;patch=1;pnum=1</a> \
 &quot;

-SRC_URI[md5sum] = &quot;9366ee7eebed48003f8a748568ef1f70&quot;
-SRC_URI[sha256sum] = &quot;5f6d48051d336561ec08995431ee4d265ac723a64bba99cc58c3eb1a4d4f5c8d&quot;
+SRC_URI[sha256sum] = &quot;520cc2a029a9eef436e4e56b007af7859315cafa21937d43c1d5269f12f2c981&quot;

 # The python-gevent has no autoreconf ability
 # and the logic for detecting a cross compile is flawed
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

--------------56305B6BB1A0960273B58E34--

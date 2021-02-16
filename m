Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.42])
 by mx.groups.io with SMTP id smtpd.web10.7252.1613480182482631299
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Feb 2021 04:56:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=WRrQ9Ij7;
 spf=pass (domain: windriver.com, ip: 40.107.223.42, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NIn2B/vhYR+MoSAWAO1IEF3J2M1OAhaMdapYgF6/SS7T6J2oR32edv6qabucuVQCX9Q5Bb0RVh+OBru7Vnkb1Sgaw/MVbU8Ucyn/U6izIJbLplMQDx8+0X09b1xqdkToemGJznDmmYb4tVoRjAxEBQO7gYOOOPwNZfFRnBnSU0hsXgAfxcKQojcVrC5czTPJjQumHm/sjPlmYQoPG1JlcsR3RSx3sej5H0Q96ssRa9MOMcCWCR2FF41EBkxpCBxMyb731M/xZ2aureD87f12GaTeqe6iNR8x3N2xUfT0UKq4zzBOkhmOSK3htRkgoV74g8g/+NdXaTlMAPrMESBIEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E9eHYmjUDxw897fmhBz7XDIgqZEnVSA1SheT7Om1bBQ=;
 b=SDkheNWFW6UmJaNkVio/n6aughVe/15Fd8pUjThhNhWGIS3RU+o7Egx4sAxDY1VpCb9BnV+rZP/GjUnrV3f7dwKMb1O8Eu0q+mhE2pRofiltL/BS8IvIJ10xCZi6zog4PeHcY6bLvcFZWTT88XKKhyB3dIVxO4QLiLLxj09DBS+kqRYDkq5s0ae3mUB8DPN7GSkN8YQvKfUPOZTnJNW9Ghwo3d0XXcJhHVzfsl+Syw8wwryh4Eex+s4XfVCG7J7JjkE0DWAvU2T+cGqgiM9a4cNxa+LBMEfCujL5sX4VRlecv6KELjwAxUigFmkaMgEAQXG9S8NAoZbb/yQwgxh64g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E9eHYmjUDxw897fmhBz7XDIgqZEnVSA1SheT7Om1bBQ=;
 b=WRrQ9Ij7h+vtp8OoCDn4Lh6xD0UjEHK8yanUxXEOzoXjfTtJ2flu7j6Zf8RPcTMCVxIw6+9XMmcWNWbT+7BwYpX/ISlev1SjKbD/s/WgeKLPYmK2wAAuVuMnM1yHV/K8htx0gHEWgjX2aOuUOF/82waDisGgYW2kLcfLSEBubFs=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3061.namprd11.prod.outlook.com (2603:10b6:a03:83::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Tue, 16 Feb
 2021 12:56:21 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3846.042; Tue, 16 Feb 2021
 12:56:21 +0000
Subject: Re: [oe] [meta-python[PATCH] python3-pika: update to 1.2.0
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
 openembedded-devel@lists.openembedded.org
References: <20210211000506.1922438-1-open.source@oleksandr-kravchuk.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <3421d4d9-c42d-0424-62a3-a0665ff20e48@windriver.com>
Date: Tue, 16 Feb 2021 07:56:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210211000506.1922438-1-open.source@oleksandr-kravchuk.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL0PR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:208:91::24) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL0PR05CA0014.namprd05.prod.outlook.com (2603:10b6:208:91::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.11 via Frontend Transport; Tue, 16 Feb 2021 12:56:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 06c31d7f-bd4c-42ff-340c-08d8d27a4211
X-MS-TrafficTypeDiagnostic: BYAPR11MB3061:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3061EB33884CFCA89CD9D0C89F879@BYAPR11MB3061.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:538;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GIaWC5tY5Mn6QrVJ1sKr3q+dz7rtrG0soHHzRiVWbAFCW/GwO4y1kg4FYdGrCoRl3lsifSrWhtcvVK+Sa15qlUTKEzi6C5gIjD/kPG+ww+V8dYnxNHWtU7eGmYrEiFbPoZn8QYhTedqkwjCByyvzSClfaUjHGtcudUlYh8FdGVS4AJIhSKuX1vrnspnF1iRuf5DTMvHIm7o1nPaUB8vpsA9UZzuGKqC1N180XxoHokc4vWkTNN2Y1uevndhDmBF2z8qdGefqdKpkAPhGoe3DRX3vESJiWoJ31WIU9bZZ2YmoY4uYdLAKgqd3f9s1PnyEixBGm55jym1bxIE/vEEieoSB2QUzGw/yFGYCNPzroRU+wep9+lCcfWDDBEpIoKtiGOU74UuyVvgL1iXev4UZD1FUm1kXkfsPMmqsIkkbg+Gh5UYmRxZ1+l3UmLm8mdsj0MgsuGxk6eNVrhKoFAEE8ZL8rsqafVavMdmjsyhPTsmOsu7X1rhgmvPgbwUOWQz1qzOAQ7Ggeh7K2K6qcBqU4UgA373jyept4p8RlFObMc54Fcd35CPPiEEvlWH0HEHw11VTFdGzZUvSIs/dbww8CTmGvI7uiDAfjC66OBZpC5W9M3ekhJgHkELVnncXlwKQrZ8Kx6fo8lXYn2ItZ2peODRg9ohdDUvx8nXe7lKO1TIY28CjEOzdJ842uRbB5oug
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(366004)(346002)(136003)(39850400004)(2616005)(956004)(8676002)(8936002)(166002)(86362001)(44832011)(478600001)(33964004)(16526019)(53546011)(316002)(966005)(26005)(186003)(83380400001)(16576012)(31696002)(36756003)(52116002)(31686004)(2906002)(66946007)(66476007)(6486002)(66556008)(5660300002)(15650500001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?VGh0djZBTFpScDVWZXIyQUh4L1ZYVmphV2hVVlZHbjQ4SExzZzROMktPd1hS?=
 =?utf-8?B?L2d1TnQ1a0JPZ25zSnhKejNNVWh2eGl0eUttOWw4V095YTZhN2ZLaGdRTXFu?=
 =?utf-8?B?SmdqVW1tTW1qK0FRWHVtb1FKeU5SVzFLbTlUbTNwVDZ0MGxyRTFsak1jZ1pt?=
 =?utf-8?B?QkxmZ0YrbE4wcEtXd3Z6RUpYUEFiNEllQ0JPdkpQRnhhQXZ6YlRyU0xLR0U5?=
 =?utf-8?B?YU9aSHB6VFMvYTBCT2lobkZaZkUvdzFYY1cwbEh3ZTZ2eEpNamNwVjdxdDlv?=
 =?utf-8?B?WGVXdDhKbkVaYndtRnR5SFR1VmFQdDNLVm1GS0RLSFZzdjN0NmFOaEZUbUo3?=
 =?utf-8?B?RWFrbk5oZEwzaE4rU0UrNnpTVHIvd2RKajRoaWpzWk4yMXBvOGhtZTFDaDVC?=
 =?utf-8?B?VEJiYkhMZzQ4TjdJdVQzUUZUeDJ1SUF1azhHMEFWMWNwSmdyRzRJNEI1czBC?=
 =?utf-8?B?eUJBU3F3MGtQQzRLMmQwaHplTDhCR0VJSlNVOHNFRzJ1V2FncmEvUmVtU2NY?=
 =?utf-8?B?dkZzeHY0TXRCaXFGL05YL3Zaa3AxUGNYT1d0ejlZT0dtUlpxQUIzaHQwTTNE?=
 =?utf-8?B?cTBQNC8wWTg0cHlxMHgzR2ZpekY4OTJJV2YwY2hJTUN0TVRtSWpHaXNEYU56?=
 =?utf-8?B?cXd2L3lzUS9jTzZ6bFZsY2FWV0JodzR6RmpkYkhuK0Q1dUNIbTNGRlgyRkl5?=
 =?utf-8?B?N2h5ald4bWoxMXZSZzA2SEFUQU9NcUJvZjlxZlJxQjl1SHVKZE1hejZlVEkx?=
 =?utf-8?B?M1dFdzAwK2hnMU8zUmhoWWM3dnNiQlgvelhLSmhtZ0xTRG9lZTQ3S0wyUjRZ?=
 =?utf-8?B?eFhHcjM0OGQ5blRHT04xYTJDZjM1ZTY0WEZrSXFwOGpOa1RBOGZUNmN0b2xF?=
 =?utf-8?B?Q3JrbVN3emlyc2s0TmwraExMR0grdmxqSlpaaFVZbzZxblJVUE1wRStkQW1B?=
 =?utf-8?B?SDJadVYxNTluYThrVHlOUE1rb0xJSjFxWWRRQjBCQ05pM01FVXV6U0w2RUFn?=
 =?utf-8?B?T2JsVzZETlpIdDd3aEVhSVVqYldPYnd1YU1MZnhtRTRuc2FkSy9HSmVZMzN1?=
 =?utf-8?B?SWU1L2RISWp2c214eW5YYy9RTGFKNXdETGhUOEdPZDNLSTZPdFhyYlR3SnlO?=
 =?utf-8?B?bDZGRnA2U3hPaGNNa2pNUk5kN2s0UW9UYjMvekFCZEFtdHJsQzFZQzI5OFJu?=
 =?utf-8?B?VnAvN2xaaG1GZVdmWmpJTTROYk4wNktnUklBWVRZWi9GMDBhc1VlTVVDazA5?=
 =?utf-8?B?SDRWSXJJSlM4Z3ZScFA2YkQrWFZXZ3ZkY1djZEFDcEZaaEg4V3ZEblVzTHhq?=
 =?utf-8?B?eWRtMDB4R21uK1N0UmZIb3Y3NzR2Y3BUZS9CMERHZjNtVkQvZWw0M05PdXVG?=
 =?utf-8?B?b2RMZFZiVld6YmsxUTlJS2JGbXZNNnhiUmhDcGpQazRGN1dNYkVmbm41VGJn?=
 =?utf-8?B?dGJML0ZWVlFRMFYyL1J0Z216Zk9kNzZJOTU2WkhCemxaQzhCa2R3dE9XM2FH?=
 =?utf-8?B?TWlkM01Gek5uVWZWalljNzYyU3J5OUNYcjk3RU1UZ2hraHZ3dGprSXlaNDFP?=
 =?utf-8?B?bHNkM2lUL1VTN0dkNkxZQzFLNldwbllNTVZnd3VjMUp1Ri9NOE9HUnpzWjNr?=
 =?utf-8?B?UEkrcWNJYU9GNm5qNWNvTnZOMWpOZXp0ZkhUSThKamtqMG9TYnd5a3k3R3B0?=
 =?utf-8?B?bElVWU9lb2E3L3A5a2VVcTRsR01oOVp4RHpNOTJVakhLTFVEcFgvWHhsd295?=
 =?utf-8?Q?hed+qeuadRYvVNpsrUUTyEa6BVbY/RBfuD2WVz5?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06c31d7f-bd4c-42ff-340c-08d8d27a4211
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2021 12:56:21.1360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0zN76wGD3mqyvLIwpOD6P2sBz5kvImBdFMUKHO7kpPZjZtOQLCjn0+mCe/atSsYCI2a+gk0WfkdSw8XnjlT6RNz0RjguLfP9MFof6NWJlOA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3061
Content-Type: multipart/alternative;
 boundary="------------3812D8E1E5C9A867E98EDBDB"
Content-Language: en-US

--------------3812D8E1E5C9A867E98EDBDB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2021-02-10 7:05 p.m., Oleksandr Kravchuk wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> License-Update: copyright year.
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-pika_1.1.0.bb => python3-pika_1.2.0.bb}  | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pika_1.1.0.bb => python3-pika_1.2.0.bb} (67%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pika_1.1.0.bb b/meta-python/recipes-devtools/python/python3-pika_1.2.0.bb
> similarity index 67%
> rename from meta-python/recipes-devtools/python/python3-pika_1.1.0.bb
> rename to meta-python/recipes-devtools/python/python3-pika_1.2.0.bb
> index c61d47c47..9f275b301 100644
> --- a/meta-python/recipes-devtools/python/python3-pika_1.1.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pika_1.2.0.bb
> @@ -6,10 +6,9 @@ including RabbitMQ’s extensions. \
>   SECTION = "devel/python"
>   HOMEPAGE = "https://pika.readthedocs.io"
>   LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=535836bf0a5de515a7bfee026075701d"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=278bdfee5b51616941c1f6b2f1cfcb99"
>
> -SRC_URI[md5sum] = "6002400cdd33bf85ec8680ece72910d4"
> -SRC_URI[sha256sum] = "9fa76ba4b65034b878b2b8de90ff8660a59d925b087c5bb88f8fdbb4b64a1dbf"
> +SRC_URI[sha256sum] = "f023d6ac581086b124190cb3dc81dd581a149d216fa4540ac34f9be1e3970b89"
>
>   inherit pypi setuptools3
>
> --
> 2.25.1
>
>
> 
>

--------------3812D8E1E5C9A867E98EDBDB
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-10 7:05 p.m., Oleksandr
      Kravchuk wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210211000506.1922438-1-open.source@oleksandr-kravchuk.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

License-Update: copyright year.

Signed-off-by: Oleksandr Kravchuk <a class="moz-txt-link-rfc2396E" href="mailto:open.source@oleksandr-kravchuk.com">&lt;open.source@oleksandr-kravchuk.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210211000506.1922438-1-open.source@oleksandr-kravchuk.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-pika_1.1.0.bb =&gt; python3-pika_1.2.0.bb}  | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pika_1.1.0.bb =&gt; python3-pika_1.2.0.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-pika_1.1.0.bb b/meta-python/recipes-devtools/python/python3-pika_1.2.0.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-pika_1.1.0.bb
rename to meta-python/recipes-devtools/python/python3-pika_1.2.0.bb
index c61d47c47..9f275b301 100644
--- a/meta-python/recipes-devtools/python/python3-pika_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pika_1.2.0.bb
@@ -6,10 +6,9 @@ including RabbitMQ’s extensions. \
 SECTION = &quot;devel/python&quot;
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://pika.readthedocs.io">&quot;https://pika.readthedocs.io&quot;</a>
 LICENSE = &quot;BSD-3-Clause&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=535836bf0a5de515a7bfee026075701d">&quot;file://LICENSE;md5=535836bf0a5de515a7bfee026075701d&quot;</a>
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=278bdfee5b51616941c1f6b2f1cfcb99">&quot;file://LICENSE;md5=278bdfee5b51616941c1f6b2f1cfcb99&quot;</a>

-SRC_URI[md5sum] = &quot;6002400cdd33bf85ec8680ece72910d4&quot;
-SRC_URI[sha256sum] = &quot;9fa76ba4b65034b878b2b8de90ff8660a59d925b087c5bb88f8fdbb4b64a1dbf&quot;
+SRC_URI[sha256sum] = &quot;f023d6ac581086b124190cb3dc81dd581a149d216fa4540ac34f9be1e3970b89&quot;

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

--------------3812D8E1E5C9A867E98EDBDB--

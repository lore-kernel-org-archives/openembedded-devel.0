Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.81])
 by mx.groups.io with SMTP id smtpd.web09.7284.1613480172614050197
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Feb 2021 04:56:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=L/1kF9tD;
 spf=pass (domain: windriver.com, ip: 40.107.94.81, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cpLcD+ZL1XOMzL461Z/qxWDOTH2J07aCpcxUNQi4fOgZA0nzzy0No4t1hjqTynov/ODP4waZVeWyCN5/rRkZlZrwk7wVETpPLGO+LEW9AyzJQGyN+Thb8zL7pp//yfcz1QKPFj1B5Qj3GMhVJoMjY32VZlU97NPcf/wsUOpWCw4QjeFd2N0N39uRkfgrp2cA18AtkG7AMAfvjJzO7oEwftJVfTmR4QRevNml5d58Zs14sw6I82tTdWJffor5dd40DO+QZ2MDWsqcEYWNERQZGzFtUuUOr1k1VcTBCyUGLzXl93UNrSCVqKKB6tttjOpSlrrGsj7pQKJWaQWL2B7qbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZxjrKgx3VRIw/FbiwE9uKtAd6zpUPCBf/fBt15PfCpw=;
 b=Q7zuKik7D9SiCR4WGWvXWgUJUp5SbN0bWZkYoF4LxPQvBB9B+Ml7IspoeVTh5D7MNcrpY9oSagTqreHVyq+jtG+jYidEgzpHQBXlTG5rpEhjaJBn8LN51VBiOs2BVZqdlIcaOKEd8/N4SCNHl2aaUxLQD9N7MtZhgLcJZGmU5JTXlPc61w7ylM6Bl9xeKRHLnXEj0alL/jr8lgrtQuCkSPEjiZrTaMFlG5uNUBOE7HZY93c/UCcyFzHL4CqssJ4zwEVIU7V2tWdGx5GzuS8ZULv5VFbTSi+SeLJXzYnMRq53GNDgI4zqYJMlLiHWkSAsyr0s5lLQkrmfdw2sqzkFUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZxjrKgx3VRIw/FbiwE9uKtAd6zpUPCBf/fBt15PfCpw=;
 b=L/1kF9tD2PMx1BbFQw4QPc0/ktHOPRm+zPVJWk7IB31GF6QbdzYn+zOX7Lc7/MLRU4H6CTOlrNLyCRUaYxARsN7znXd8SB245/KGiBLnGwCMQIQej7bZvGFEpTOHCbJ1b6y+Sy9PGvo8QOifPmmqS5k+UHQGReitpMujnyCcsrQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3061.namprd11.prod.outlook.com (2603:10b6:a03:83::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Tue, 16 Feb
 2021 12:56:09 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3846.042; Tue, 16 Feb 2021
 12:56:09 +0000
Subject: Re: [oe] [meta-python[PATCH] python3-idna: update to 3.1
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
 openembedded-devel@lists.openembedded.org
References: <20210211000457.1922320-1-open.source@oleksandr-kravchuk.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <36271f0b-381a-246d-824d-6a63824c7f95@windriver.com>
Date: Tue, 16 Feb 2021 07:56:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210211000457.1922320-1-open.source@oleksandr-kravchuk.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL0PR05CA0029.namprd05.prod.outlook.com
 (2603:10b6:208:91::39) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL0PR05CA0029.namprd05.prod.outlook.com (2603:10b6:208:91::39) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.11 via Frontend Transport; Tue, 16 Feb 2021 12:56:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 29d6616a-9ae2-4d99-c603-08d8d27a3b01
X-MS-TrafficTypeDiagnostic: BYAPR11MB3061:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3061FCF9CC4FD89FF5FF70E39F879@BYAPR11MB3061.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:538;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oJ25fKGsIj9bA8xC12/h4AkO+GWIGwXQBjVw1eJeVx/GdsP4q4XMH7ot3aKENNasvBmPLVY8qkVKMhoZ0xjZK1C1uvgFTqO3Ub4kPTVEOt3I7LQFW8kukIGnNUmIDxgKrEUxUPoyahi+pr8nv2WNWhU63ATvNnuB1tkV2XhMARJFIvDhr+l9XcWNRivrqH1JM2ycApB8PIWbPuhUV3uiGazmre2xxBq4R5frcVlulEH+vtdQqWi+9+U6KrIJXsT9voQ1+0q95UPGUyPkSBQd6q36mhdHpjNkeEkO3GyvTXlYnR4RqMDEaME4se0BJkuS55ntzW59PyLp0q3V4JJZeeemV38Aq19wkev2z78eUdiz8d6SwmlqF8xmcRJ0ZT29bEbm1VagJXulqyAMHXDctVbgaP4OR/eipz7OB6ZlFCP4xEYxDr9qERVd5tURbAqP8KJT3UUrdcwc8R9y1QpOHwh6A1oMdrtWylulBkrA/ZNC0dBmxek3jErMXybzIDZmu42PQ3P0PVFy/rje8gh3UBXCjPhAdCUMmXlTuYaF0fV9ToMOjrmiae6xUNtiZJTwbSiJLTpcuBWDstQjxCgiEUEF6Ek3yFHuyhWai8UXMVZUYOru4D5/+NSqgELIMnGHDv8PGL7WbttpCCfoomwfyzCYdPH7Mw9IdvWQTQORBPh4y0ka1P6wBgYmXXvE5do7
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(366004)(346002)(136003)(39850400004)(2616005)(956004)(8676002)(8936002)(166002)(86362001)(44832011)(478600001)(33964004)(16526019)(53546011)(316002)(966005)(26005)(186003)(83380400001)(16576012)(31696002)(36756003)(52116002)(31686004)(2906002)(66946007)(66476007)(6486002)(66556008)(5660300002)(15650500001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?bzZ6RXUyaiswUy9rMm5lMXA5VGs1SDhlMWkvbURudVp1a2xxT1l4S2ttY1Vp?=
 =?utf-8?B?alN4alhHbk5ST3N1a1dhWHZXZGxqQy91S285T244NENjamZkZTZhdHpzODZq?=
 =?utf-8?B?SGlUV3FRSjVZY3JzNk96NTMyWk1jZXBjUGgrUzk4c3NHMHhJK1FoUVNkM3VD?=
 =?utf-8?B?ckEzakhoRDN3cjNHanFlY251TzNuczF5V1ZhRTUvOTJCMGs4TEJvblRDTHAz?=
 =?utf-8?B?UXVudXpHb2RwQ2c1UE4xenhvRkdtamtwSlZ5M1NHM1JiTnphaG5NV1kxVFI2?=
 =?utf-8?B?Z2xsN3ZlMjJrNFJ4aGZSMklaZFR4cG93NkJ3cXRvUEdTMEcycGNhbkFsQWlR?=
 =?utf-8?B?djBUeU1YQkhYdlpmM2U4cm9EaTV5bUdYT01QdytpdEcwdUdxN0JPL0pjK01j?=
 =?utf-8?B?cmpZemt2NDd2ODhwcTBYOG1vcnB6MVVVNHBqUDRJYlFTVldSdkk5UEU4M3Fj?=
 =?utf-8?B?TkNkVW9YLzhVVVN3UEEvWTNJZ3NmVkhMVjNHWi9aV2h6NzNtTHR0S2ZLMllL?=
 =?utf-8?B?aWpBN3hESDduV1dGT1FuajMxYm1GaFU4N0FnRlhKdVU4TEMwdkJ1VDVJcXRD?=
 =?utf-8?B?ejVjZ2IvV1JBRXkyWmswZDF1RFEyUXdGN2xBOUkxQk00WjE1eStqYnA5QjFx?=
 =?utf-8?B?YTgvcCtCcVk5M3ZLWTgvMWpGdDBLZmRrTDZjaTlpQk9ydS9wZTJXclFBWk5y?=
 =?utf-8?B?dnF0Y3VDRGRFLzAvMnM5VjhTN1p1VVlRYzJ2Q28xbkpyNGdYTE5sOU9TNndZ?=
 =?utf-8?B?b25QNk4vQmRFVEZqYk9Qa0VONlVlS0EwWEhPYWw3U0FOYWF1SmVzc1M2OVJr?=
 =?utf-8?B?Q05SdkRIeS9IVm9NVVQ5VUU1d256dGVubFBjdEhTZElybXVzYnlnMkMrekNW?=
 =?utf-8?B?YTZRTDhlZEt4RnpacDBReGxTcHE4VVAzcFdrT3ROQVpYM3FsV3d3SU5yMzNP?=
 =?utf-8?B?b3FJL2E5d1lyaVR6YW1peWJWWEVEb2tJOHlqQmgrbDkxME5mSGF6cmpvaG50?=
 =?utf-8?B?S2V6UGxFSXA0M2hKZDRjdXlXRHhZcFZlVG55WEdJVFdnU1FOQXZNY2xLbkE0?=
 =?utf-8?B?c2tOZG0zaHdOUU1mYnJJZnJzUU1oaTRMNTdsN1BoMUpiazRYbld1TnJDMUtl?=
 =?utf-8?B?SVljMXJpZWVpVGRBc3pnd0VpM1orMFphK2NUenYrak5HZ1pOMUZWSW5jZFAv?=
 =?utf-8?B?S2hvZW9NaUltUGxySHp1dnRDQWN2NSsvSVBIcFFDeXk0WHZYdGo3ZWd3Rk9r?=
 =?utf-8?B?TWFoV1BnT1VPeHBnd01zRlpkdzNZTFFWY0tkYUxqdGRJQWw2ayszempUQlNO?=
 =?utf-8?B?NzdQU2xIRUlYZHdmTzF3dWxrc1cxczVvYUNIb2lqSjNXSDVVR0kzLzBxRzUx?=
 =?utf-8?B?ZTdWS3dIMlduWG12ekZWZnYvZEZ3K0x0L2dvNWNDaTRpOSsrcFBhNHd6MTIx?=
 =?utf-8?B?NkZsaXBub1RGTUVuT0lCOTQ5RUdCQUN0S1RLRXBBUlhycEl3YUIvazllem9y?=
 =?utf-8?B?OVVVU0lSQ3Rqbi9ZSWRUZ3c4VkR6R21rR1ZKNktZdVp2d1JrdEVUUlZNMlN0?=
 =?utf-8?B?YmhTUFpWZzNPNUVMYUlWeHpZQzYxOUNOREY2ZXJMWDcrNXllVmNRb0hFa3Nx?=
 =?utf-8?B?Mkh5VmREa1hQdDFjZG00ekpXWU5OTHd2SjJvazhFRWFxeFY3TG1nMWVWeXF4?=
 =?utf-8?B?NUhGUll5bU1naDQ1ZGZlYkFEdjZUZmpzdUQrNEp1K2Y4VEhFK2lvNlRySkt0?=
 =?utf-8?Q?dpHGfFKsoPrXtOfAfnsCZyW9Mk7q5mGeyY+jcOW?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29d6616a-9ae2-4d99-c603-08d8d27a3b01
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2021 12:56:09.3218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YqT6HG8Tui+7JrbuM516mNBpuiMJxRjbKUwaeSHFQavZjA9zJbmj7Ud/c8zjEr5ybNHUp5EF/Df34TWYUImDo18abFco2IQCMReNNSw0YhU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3061
Content-Type: multipart/alternative;
 boundary="------------674622FD43BCBB1480C396D7"
Content-Language: en-US

--------------674622FD43BCBB1480C396D7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-10 7:04 p.m., Oleksandr Kravchuk wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> License-Update: copyright years.
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   meta-python/recipes-devtools/python/python3-idna_2.10.bb     | 2 --
>   .../python/{python-idna.inc => python3-idna_3.1.bb}          | 5 ++---
>   2 files changed, 2 insertions(+), 5 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python3-idna_2.10.bb
>   rename meta-python/recipes-devtools/python/{python-idna.inc => python3-idna_3.1.bb} (60%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-idna_2.10.bb b/meta-python/recipes-devtools/python/python3-idna_2.10.bb
> deleted file mode 100644
> index a08ca714a..000000000
> --- a/meta-python/recipes-devtools/python/python3-idna_2.10.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -inherit pypi setuptools3
> -require python-idna.inc
> diff --git a/meta-python/recipes-devtools/python/python-idna.inc b/meta-python/recipes-devtools/python/python3-idna_3.1.bb
> similarity index 60%
> rename from meta-python/recipes-devtools/python/python-idna.inc
> rename to meta-python/recipes-devtools/python/python3-idna_3.1.bb
> index 4968f1072..0b64bb2ee 100644
> --- a/meta-python/recipes-devtools/python/python-idna.inc
> +++ b/meta-python/recipes-devtools/python/python3-idna_3.1.bb
> @@ -1,10 +1,9 @@
>   SUMMARY = "Internationalised Domain Names in Applications"
>   HOMEPAGE = "https://github.com/kjd/idna"
>   LICENSE = "BSD-3-Clause & Python-2.0 & Unicode"
> -LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=cf36c8682cc154d2d4aa57bd6246b9a1"
> +LIC_FILES_CHKSUM = "file://LICENSE.md;md5=239668a7c6066d9e0c5382e9c8c6c0e1"
>
> -SRC_URI[md5sum] = "7a910c706db30d758f377db2762c0f9a"
> -SRC_URI[sha256sum] = "b307872f855b18632ce0c21c5e45be78c0ea7ae4c15c828c20788b26921eb3f6"
> +SRC_URI[sha256sum] = "c5b02147e01ea9920e6b0a3f1f7bb833612d507592c837a6c49552768f4054e1"
>
>   RDEPENDS_${PN}_class-target = "\
>       ${PYTHON_PN}-codecs \
> --
> 2.25.1
>
>
> 
>

--------------674622FD43BCBB1480C396D7
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-10 7:04 p.m., Oleksandr
      Kravchuk wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210211000457.1922320-1-open.source@oleksandr-kravchuk.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

License-Update: copyright years.

Signed-off-by: Oleksandr Kravchuk <a class="moz-txt-link-rfc2396E" href="mailto:open.source@oleksandr-kravchuk.com">&lt;open.source@oleksandr-kravchuk.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20210211000457.1922320-1-open.source@oleksandr-kravchuk.com">
      <pre class="moz-quote-pre" wrap="">
---
 meta-python/recipes-devtools/python/python3-idna_2.10.bb     | 2 --
 .../python/{python-idna.inc =&gt; python3-idna_3.1.bb}          | 5 ++---
 2 files changed, 2 insertions(+), 5 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-idna_2.10.bb
 rename meta-python/recipes-devtools/python/{python-idna.inc =&gt; python3-idna_3.1.bb} (60%)

diff --git a/meta-python/recipes-devtools/python/python3-idna_2.10.bb b/meta-python/recipes-devtools/python/python3-idna_2.10.bb
deleted file mode 100644
index a08ca714a..000000000
--- a/meta-python/recipes-devtools/python/python3-idna_2.10.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools3
-require python-idna.inc
diff --git a/meta-python/recipes-devtools/python/python-idna.inc b/meta-python/recipes-devtools/python/python3-idna_3.1.bb
similarity index 60%
rename from meta-python/recipes-devtools/python/python-idna.inc
rename to meta-python/recipes-devtools/python/python3-idna_3.1.bb
index 4968f1072..0b64bb2ee 100644
--- a/meta-python/recipes-devtools/python/python-idna.inc
+++ b/meta-python/recipes-devtools/python/python3-idna_3.1.bb
@@ -1,10 +1,9 @@
 SUMMARY = &quot;Internationalised Domain Names in Applications&quot;
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/kjd/idna">&quot;https://github.com/kjd/idna&quot;</a>
 LICENSE = &quot;BSD-3-Clause &amp; Python-2.0 &amp; Unicode&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.rst;md5=cf36c8682cc154d2d4aa57bd6246b9a1">&quot;file://LICENSE.rst;md5=cf36c8682cc154d2d4aa57bd6246b9a1&quot;</a>
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.md;md5=239668a7c6066d9e0c5382e9c8c6c0e1">&quot;file://LICENSE.md;md5=239668a7c6066d9e0c5382e9c8c6c0e1&quot;</a>

-SRC_URI[md5sum] = &quot;7a910c706db30d758f377db2762c0f9a&quot;
-SRC_URI[sha256sum] = &quot;b307872f855b18632ce0c21c5e45be78c0ea7ae4c15c828c20788b26921eb3f6&quot;
+SRC_URI[sha256sum] = &quot;c5b02147e01ea9920e6b0a3f1f7bb833612d507592c837a6c49552768f4054e1&quot;

 RDEPENDS_${PN}_class-target = &quot;\
     ${PYTHON_PN}-codecs \
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

--------------674622FD43BCBB1480C396D7--

Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.82])
 by mx.groups.io with SMTP id smtpd.web10.21194.1602868362968731192
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Oct 2020 10:12:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=jpHmJE0Q;
 spf=pass (domain: windriver.com, ip: 40.107.94.82, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JyklNNa1bP3zvLAFRlgFG/D4X10kSX6MeBlFEYNdS+hfZcVH1jIps1WX8PySKgUhc81nWSosznctWSPT5aeveaoGew0uwAUGV7Le+RXY1cfZinVc0YLQKzeUJN/xfHzrAYhSEZnIcw0EUT8dOiCdDMZiREw6YMwLTvSK+CEFWlxRph6/v2btDKwVqZ15nHuJ3WboW1+ELD+f+hudYM+dgl9yYpRmFNa3ku4RmHpscUNYGZI+IzjhduaPtfE3B27fL3yoWB0MxbeVk65Dd2lmbSJgVoXn+iSSuqqEd/5uEG7spGcPWcja52lfv23mzOkA47MaZEZnn21mWi7TgwmM3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Mqa8TlGlOMZ5f5JKHtHXNJ8pFMkODkAZMGJDNaWns0=;
 b=obj3Cx+QeKo1LUL/ZUgFbzCxlxHqkiuiD40uLrY4pYpg0hYvaIg/U3qoU9Yp6oUhNMysk17hzcao4Z36zjER6Nztu1gMyUUdhRgPFecWkTA/mXtOVbqbvdKm25a+SWj5lsizbe5Mh7/BInL/S+xVnExPGk5F9FEkH/sCA5TZ999L5QXOFqApv15ZwTRIzbufoodA4x/1H8owmJ1RCVc0AUQdfDOVW1W+pus9QFolfv/1xga30bHYXYBrNGRrNRR/ZTjqiJKUhH7Zt+E8oHXI6gSKVo8jVHPRVUrwJbYYsLrXXaaizHL6b1qRxCXBlZsbmZ3niQVwMtj41GEfiN0Jng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Mqa8TlGlOMZ5f5JKHtHXNJ8pFMkODkAZMGJDNaWns0=;
 b=jpHmJE0QQ7E7xtqSBVKt//7yKjLH2JcOrQ+jzSBc0GpnQdWai4BxjhnN1/wmHTXBYeO19YwhaPElbI7hpZq1tuVT0ebf6ploZnItRyNkLgjU23gcDqzUvFHF5dJxFEspEj9+qHYijAxyA+KEMfSqvpbFV3wV2B8E3VP1EGT7YzY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4182.namprd11.prod.outlook.com (2603:10b6:a03:183::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23; Fri, 16 Oct
 2020 17:12:31 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3477.025; Fri, 16 Oct 2020
 17:12:30 +0000
Subject: Re: [oe] [meta-python][PATCH 1/7] python3-aiohttp: Upgrade 3.6.2 -> 3.6.3
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201013085914.31580-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <511c6630-7b4b-0569-6a4a-c7d9b8604d04@windriver.com>
Date: Fri, 16 Oct 2020 13:12:28 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <20201013085914.31580-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BY3PR10CA0026.namprd10.prod.outlook.com
 (2603:10b6:a03:255::31) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BY3PR10CA0026.namprd10.prod.outlook.com (2603:10b6:a03:255::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21 via Frontend Transport; Fri, 16 Oct 2020 17:12:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec35df39-7be5-44a4-d9ba-08d871f6a9f6
X-MS-TrafficTypeDiagnostic: BY5PR11MB4182:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB418214838075905CED03F0289F030@BY5PR11MB4182.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:644;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	AR8iUcJ/zmiXKMRDXVHM6fMwOMoxQqzIKko+PE3SxAWqQKePbsfR+B9psze5PqBLPTr7PKf+BPGDXMiPZ4Ad6Zi1iuIYraB5NEISAure/e0kTCA5jS8zDQxPHppKFjFhAulo5Gz8b3ngRb2sgu0mmBDzKlvfTMGwP1RosiQ7rIo9/TcYASLVdvgQKj5JPtLrqiDWO8fi/DoNQFbXrahQm26cw3gGFFT/4H/Ufm15vcz57B7h26Ql+oJJVtpDdFaWpYTIX/VyrRV/22VLIFqsOZgmv/o+8eKZV2KiMne9WLDH9vv/02N3Cm7U1UufgFUD5HrJJGyKfVDTBU8jzRo8XvOpap1vfDH9otoQVprKoMS/al6M+Ziip18iCOT5VYYiOp6MGScF9dr8JnJx2DQp4ph6bzJs6bvZ0wTXPZczNi/zwOUSWyqJZgKraETOfSOmmiJx7V84fLr3s7iL6FGuDX1QgL99BtWeONe0xw/3FI1e+by5XdI2u+GkZfS7glks
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(396003)(376002)(346002)(366004)(966005)(66476007)(66946007)(2906002)(2616005)(66556008)(86362001)(478600001)(53546011)(33964004)(16576012)(36756003)(52116002)(16526019)(956004)(26005)(8676002)(316002)(5660300002)(166002)(8936002)(83380400001)(186003)(34490700002)(31696002)(6486002)(44832011)(31686004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	rBpDvDuUAV4G2LQjQZddmAq2jrOalGPLE+AmFVNfEpx/vm0PBzMgmVuMsQBxqY5vQbtnhcFxejAB9xEPxO8GPZSyHE7SVfFnTO4p7bXPZ9Tf8rUOdgm8KLNGS9ZBbU4SG7K4TOS+9KNDcn73a5aU+RupdjV5hLtG1PmdVv6dDHDqkfPwpM69g3SpzdcgqHvAkkGpdzyJ2uCbQ5qEMY4AGxJ0J5wsW6C03HIDIeQa9GLvcAotmz5kSJE0Rlc7AVR15Lz82rOqfYbDlZv2X+9+6PCeeZvN7luNxm89LaDFyfgOqSC3N+AmtJHURHaa1Zs7j3o3Njkz2MpD0YITpfL4cTGtcAdd76YeFab9EVXJWgsM6lEN2aj25PIcyStNX1vmZJKFx27Mc2ffheWzq2EfzdcQmPfDOf3tfEumLCu+fEPwfJ7WGjo+KwdURSBP6Y3vaOHplKTxAmUmWTnK2jnju/vVtIusi1JvkNUC/N0w4WkMqhGklR/r2SKqKRTFcJurDyTWeLP0BMWAb2yosTM4ovBVpATKefUgvrXj9WRgy8TR7mfUVofo7R8b/sHuTzVVOGIJwaP/CDXCAhcS59Bo2gR8bE0o3AYCLgkfAzuLEPRSOro/3vNhKACbMFBDD4u64ZrB1/6MgWMS5k/r97UekQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec35df39-7be5-44a4-d9ba-08d871f6a9f6
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2020 17:12:30.2904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ySu17vojmh8Qety7cMTMEydx6u56WQJDteT4QxAWeTWchfK2CWhBNpPm4tZnR4VxzhOrB4vFe0uz31viZfLbjxefn/XwSTiRsL+5q/xtcGA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4182
Content-Type: multipart/alternative;
 boundary="------------E155E25B42DC36E7FBF08C86"
Content-Language: en-US

--------------E155E25B42DC36E7FBF08C86
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/13/20 4:59 AM, Leon Anavi wrote:
> - Pin yarl to <1.6.0 to avoid buggy behavior that will be fixed
>    by the next aiohttp release.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-aiohttp_3.6.2.bb => python3-aiohttp_3.6.3.bb}    | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-aiohttp_3.6.2.bb => python3-aiohttp_3.6.3.bb} (80%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.6.2.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.6.3.bb
> similarity index 80%
> rename from meta-python/recipes-devtools/python/python3-aiohttp_3.6.2.bb
> rename to meta-python/recipes-devtools/python/python3-aiohttp_3.6.3.bb
> index 121447cdb7..824bde5e25 100644
> --- a/meta-python/recipes-devtools/python/python3-aiohttp_3.6.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.6.3.bb
> @@ -4,8 +4,8 @@ HOMEPAGE = "https://github.com/aio-libs/aiohttp"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=cf056e8e7a0a5477451af18b7b5aa98c"
>   
> -SRC_URI[md5sum] = "ca40144c199a09fc1a141960cf6295f0"
> -SRC_URI[sha256sum] = "259ab809ff0727d0e834ac5e8a283dc5e3e0ecc30c4d80b3cd17a4139ce1f326"
> +SRC_URI[md5sum] = "13d02dc8379207dde1f6966d1fc5083d"
> +SRC_URI[sha256sum] = "698cd7bc3c7d1b82bb728bae835724a486a8c376647aec336aa21a60113c3645"
>   
>   PYPI_PACKAGE = "aiohttp"
>   inherit setuptools3 pypi
>
> 
>

--------------E155E25B42DC36E7FBF08C86
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/13/20 4:59 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201013085914.31580-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Pin yarl to &lt;1.6.0 to avoid buggy behavior that will be fixed
  by the next aiohttp release.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20201013085914.31580-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-aiohttp_3.6.2.bb =&gt; python3-aiohttp_3.6.3.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-aiohttp_3.6.2.bb =&gt; python3-aiohttp_3.6.3.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.6.2.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.6.3.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-aiohttp_3.6.2.bb
rename to meta-python/recipes-devtools/python/python3-aiohttp_3.6.3.bb
index 121447cdb7..824bde5e25 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.6.3.bb
@@ -4,8 +4,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/aio-libs/aiohttp">&quot;https://github.com/aio-libs/aiohttp&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=cf056e8e7a0a5477451af18b7b5aa98c">&quot;file://LICENSE.txt;md5=cf056e8e7a0a5477451af18b7b5aa98c&quot;</a>
 
-SRC_URI[md5sum] = &quot;ca40144c199a09fc1a141960cf6295f0&quot;
-SRC_URI[sha256sum] = &quot;259ab809ff0727d0e834ac5e8a283dc5e3e0ecc30c4d80b3cd17a4139ce1f326&quot;
+SRC_URI[md5sum] = &quot;13d02dc8379207dde1f6966d1fc5083d&quot;
+SRC_URI[sha256sum] = &quot;698cd7bc3c7d1b82bb728bae835724a486a8c376647aec336aa21a60113c3645&quot;
 
 PYPI_PACKAGE = &quot;aiohttp&quot;
 inherit setuptools3 pypi
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------E155E25B42DC36E7FBF08C86--

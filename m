Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.56])
 by mx.groups.io with SMTP id smtpd.web11.21170.1602868388329124497
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Oct 2020 10:13:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=DrY/YdpJ;
 spf=pass (domain: windriver.com, ip: 40.107.94.56, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SsEGcQEmRYnKBoRrPn0v+EuY1TfdJbbWlbEnKGctRnk4aMreInhCXvfWCuNcIo6bxB9JLcayVdcIIWATRVfu6viEegH6ljpfLrOdYG2asRlq2WlRaU/C9h1CAlEHELOSK38Nwbd27TlsyYbyGeYtfQQ8OXB23xF+W1N6wG4tXVOEveGpaSfbajVc1GkX7dDcS2RQY3u1Zx+6gTOguoEuoqpl9OC55QaZo4mDHDNZOr5fZBcmj2Vfg3HFQWdTKON4K1uCBwcekuZOiWHZW3gEVy0lDw5GJlbS7PDxTAiLRuMMPO0L6LFt8JehIen8Juhvdv423EZ38NlrRuLQ703JAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=msx64UHHNxf/LQDfs083jwSro1tlpT7RqRzJ83ybSC4=;
 b=V+ospiEHUNslISDy1i8b5QYsGXvqWOlNZMCwJuEUDdzIWTKqkYjX6HCb52QanHiNSjrQywExBxDPyPMxfNU7Ec6gipAK6PSJyLTHYDfi29q62aLmgOi/B88Lo9ZWEdlwRav6RFPCanKcTtcbJhHo7a2uzZKTu7Fu2Z1w7zAb5YyZbECaeEywGBxGpX/njN3GUp+HODCivQI+GsVIq4uBK2H66wq3ZPEkNs6z4VE5vWc+4eExiYU5QxwtbLeaaV9/YQ20Fl8EBbaYNzV0eZhU31Oh7uQI2FPQjTjkcCaAWwc/G1lsr9cnAathqFvZwv94tHiLLKoqZmilcwZZn+k7YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=msx64UHHNxf/LQDfs083jwSro1tlpT7RqRzJ83ybSC4=;
 b=DrY/YdpJM6xhkPUyPXP88poED8Uzv018cFK0B/8ribNEw958LsorjK1W2WTvwbp/cutwYe3tMQo1bkxMg0CgRvOknEX9uDWiRmVNHOHLxQWnrw02wu56sZ3kYkXeyqJ+a+Mq3stitUfZ9NV25y44yzXqV7Fdp86RjEJiorsBQ/E=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4182.namprd11.prod.outlook.com (2603:10b6:a03:183::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23; Fri, 16 Oct
 2020 17:13:03 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3477.025; Fri, 16 Oct 2020
 17:13:03 +0000
Subject: Re: [oe] [meta-python][PATCH 4/7] python3-croniter: Upgrade 0.3.34 -> 0.3.35
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201013085914.31580-1-leon.anavi@konsulko.com>
 <20201013085914.31580-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <ffaff025-7348-57de-2b4e-e42c9a449014@windriver.com>
Date: Fri, 16 Oct 2020 13:13:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <20201013085914.31580-4-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BY3PR10CA0021.namprd10.prod.outlook.com
 (2603:10b6:a03:255::26) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BY3PR10CA0021.namprd10.prod.outlook.com (2603:10b6:a03:255::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.24 via Frontend Transport; Fri, 16 Oct 2020 17:13:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a4173bb-9784-44aa-f078-08d871f6bd88
X-MS-TrafficTypeDiagnostic: BY5PR11MB4182:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4182D6366EFA4C0FF7B74B789F030@BY5PR11MB4182.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1/ry99tAkQNmpSwSnP8lKzV2fPkhTX96YxNZ8UC0+wO8U6igulAcnO8uhaVZzPPB+w/HZCLAt1GuKDTp/O+OkfDrs0at4B5tgJNKhjgZR+r1OaxYvRRCrvWMgyMQTrKj5RjmXJXmDhFyBotF2KHaWCi7Ssb+LtdWc4QGx/aYyUdGTCfAx1oaZnn0pXpCQZMMRPyy05MLraoA2lVCSBRifpJFB/OUw+OTfZA85/usGrK7g1Utly9CQ+3KT28W61/3arrEnzSsFKt3Nh+GPjBd+qlO+Wv2daABPaYRq+KMRc+8NwRhDOgeHCTgdviprkruQwrSAtu6rsimNyiZkmx4F3UDDhZA3gTPD/ibXyq5TPkWr5JIVqWZOf7RAqN7xUkSkdXUN2II8OYOfqA5XK5sQr2+CVQtFBPTgQzpt3e0T2DmkUokrcHNZj20OkOGxwqjlULxJMwxBQNS/hFVVwJbjuBhnN5IfFORtqqiCNRijkaC8RuKdwbuDs8nI2+Tpuv0
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(966005)(66476007)(66946007)(498600001)(2906002)(2616005)(66556008)(86362001)(53546011)(33964004)(16576012)(36756003)(52116002)(16526019)(956004)(26005)(8676002)(5660300002)(166002)(8936002)(83380400001)(186003)(34490700002)(31696002)(6486002)(44832011)(31686004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	mmB5vUdQmqiLICsuwQy8NTH/A2rjfLHOetQPgRpvFiXImJB/F10Pj3S3rsknyhhKKQu5L/MRhsn2dnEAzEFsPMNVdGR/vpdMpoG06VYXCP4lAlLItXm7WRTV1qufNNU48AC6pjrYmK5fdfOTxSONdi5W+FFdjfXbCCszmTvuUHUG4KNwojhrGCVuPdyA3z5tuB6KlF8YhZm2PpVT5iqieQxj/UjSexDQ7BTdd16bOIljXGesGtka8I2m/L9fsm3TWgo0fscCuohADLLGqf1qb6HY9fSTiYs5I1QwjRlZHTYaJTppRSCFF/483lCSk/8VJLsvrmyNXZ1b2t44pFYk73X/pAq2Udr12zLeOifUbPXBRlWkJkgNJVe8tW+7wUd6ZNeHQOb5zv7j31eicSrksFR7GjL3cC/UxZ9qk7IOcu23lQdO6E8xWGEA4rm1dBc/TZ2ph4Qd09BxVOddVPwPltzaOZw9BamdOg3n1BwrdRwCTtWgjcsOdGuh49PhaZS4EtVR3LzQLw3+vTRFo4RUgSIx46CFe2mPZpFOa9WOortcLDxOfU7fkbJiafugik4SqFoL3qKY1ciWSk3xZ7naGMvmj4qmqg97vTg0iJFe/wVni1RAdjcbqZgJ8RqS3tUICQ2AjxUR94Y22QQy6gzL3w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a4173bb-9784-44aa-f078-08d871f6bd88
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2020 17:13:03.3474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4mGOBoUimFTuftbtjhaCe2qNxoOo9jNr8pfXWf5kqvn7TJ4yQi+bBxNsxO/rnPx8rJ25MN416oZUoATV33m1RqNFARrydsa4BTQbrz16klM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4182
Content-Type: multipart/alternative;
 boundary="------------D285F0AECBBDB72D807F0FD2"
Content-Language: en-US

--------------D285F0AECBBDB72D807F0FD2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/13/20 4:59 AM, Leon Anavi wrote:
> - Handle L in ranges.
> - Add a new initializaton paramter max_years_between_matches to
>    support finding the next/previous date beyond the default 1 year
>    window, if so desired. Updated README to include additional
>    notes and example of this usage.
> - The croniter_range() function was updated to automatically
>    determines the appropriate max_years_between_matches value, this
>    preventing handling of the CroniterBadDateError exception.
> - Updated exception handling classes: CroniterBadDateError now
>    only applies during date finding operations (next/prev), and all
>    parsing errors can now be caught using CroniterBadCronError. The
>    CroniterNotAlphaError exception is now a subclass of
>    CroniterBadCronError. A breif description of each exception
>    class was added as an inline docstring.
> - Updated iterable interfaces to replace the CroniterBadDateError
>    with StopIteration if (and only if) the max_years_between_matches
>    argument is provided. The rationale here is that if the user has
>    specified the max tollernace between matches, then there's no need
>    to further inform them of no additional matches. Just stop the
>    iteration. This also keeps backwards compatibility.
> - Minor docs update.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...{python3-croniter_0.3.34.bb => python3-croniter_0.3.35.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-croniter_0.3.34.bb => python3-croniter_0.3.35.bb} (68%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-croniter_0.3.34.bb b/meta-python/recipes-devtools/python/python3-croniter_0.3.35.bb
> similarity index 68%
> rename from meta-python/recipes-devtools/python/python3-croniter_0.3.34.bb
> rename to meta-python/recipes-devtools/python/python3-croniter_0.3.35.bb
> index 123d176137..388885c158 100644
> --- a/meta-python/recipes-devtools/python/python3-croniter_0.3.34.bb
> +++ b/meta-python/recipes-devtools/python/python3-croniter_0.3.35.bb
> @@ -4,8 +4,8 @@ LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2"
>   
>   PYPI_PACKAGE = "croniter"
> -SRC_URI[md5sum] = "adfeeb0032ab7aeccba908fa2eb09c33"
> -SRC_URI[sha256sum] = "7186b9b464f45cf3d3c83a18bc2344cc101d7b9fd35a05f2878437b14967e964"
> +SRC_URI[md5sum] = "8bb1443b90123f96ad64d7fae26df342"
> +SRC_URI[sha256sum] = "b9075573d9d18fdc4c67ad6741c4bfa4b446b1b1d7f03279757244c8a75abedf"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------D285F0AECBBDB72D807F0FD2
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
    <blockquote type="cite" cite="mid:20201013085914.31580-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Handle L in ranges.
- Add a new initializaton paramter max_years_between_matches to
  support finding the next/previous date beyond the default 1 year
  window, if so desired. Updated README to include additional
  notes and example of this usage.
- The croniter_range() function was updated to automatically
  determines the appropriate max_years_between_matches value, this
  preventing handling of the CroniterBadDateError exception.
- Updated exception handling classes: CroniterBadDateError now
  only applies during date finding operations (next/prev), and all
  parsing errors can now be caught using CroniterBadCronError. The
  CroniterNotAlphaError exception is now a subclass of
  CroniterBadCronError. A breif description of each exception
  class was added as an inline docstring.
- Updated iterable interfaces to replace the CroniterBadDateError
  with StopIteration if (and only if) the max_years_between_matches
  argument is provided. The rationale here is that if the user has
  specified the max tollernace between matches, then there's no need
  to further inform them of no additional matches. Just stop the
  iteration. This also keeps backwards compatibility.
- Minor docs update.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201013085914.31580-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...{python3-croniter_0.3.34.bb =&gt; python3-croniter_0.3.35.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-croniter_0.3.34.bb =&gt; python3-croniter_0.3.35.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-croniter_0.3.34.bb b/meta-python/recipes-devtools/python/python3-croniter_0.3.35.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-croniter_0.3.34.bb
rename to meta-python/recipes-devtools/python/python3-croniter_0.3.35.bb
index 123d176137..388885c158 100644
--- a/meta-python/recipes-devtools/python/python3-croniter_0.3.34.bb
+++ b/meta-python/recipes-devtools/python/python3-croniter_0.3.35.bb
@@ -4,8 +4,8 @@ LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2">&quot;file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2&quot;</a>
 
 PYPI_PACKAGE = &quot;croniter&quot;
-SRC_URI[md5sum] = &quot;adfeeb0032ab7aeccba908fa2eb09c33&quot;
-SRC_URI[sha256sum] = &quot;7186b9b464f45cf3d3c83a18bc2344cc101d7b9fd35a05f2878437b14967e964&quot;
+SRC_URI[md5sum] = &quot;8bb1443b90123f96ad64d7fae26df342&quot;
+SRC_URI[sha256sum] = &quot;b9075573d9d18fdc4c67ad6741c4bfa4b446b1b1d7f03279757244c8a75abedf&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------D285F0AECBBDB72D807F0FD2--

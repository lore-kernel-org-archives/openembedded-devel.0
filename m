Return-Path: <johnathanx.mantey@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 327AFC4167D
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 17:59:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web10.39031.1698947965499085862
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Nov 2023 10:59:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=bQZhKxB+;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: johnathanx.mantey@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698947965; x=1730483965;
  h=references:from:to:cc:subject:date:in-reply-to:
   message-id:content-transfer-encoding:mime-version;
  bh=LKRbE7zrlDQ5Gj/EMBbMxabJxM2U1qReZUODolBDHkw=;
  b=bQZhKxB+v28t0JuzJlHx+TSqm06oh0SVVn1hyzhX67MZKYolirpGi8ry
   p7oogiiHeW/qvY8pZrbdeswxLR4fia/ieCig6234nTO22qONcrx2oL4fW
   FWbEWunv9Y+tzU9n5atfPsja1X/6j3EhIUAgolVtzWhJ+4WNcZvlwRyHq
   L5aLrdR0qdncWJcAo/T0oSz5XcsWy2pmfo9x2bT4LgfF1iJ81oNrLq1ky
   z7QPtLV9IUUfklpGwP8YCozQS0fq8AyCYuJcJHhH43pOcFfrnIE+RFGOU
   5Xx4Y3HDmpvoCl+anLJp2m1nIRrreLKMYL2HHaXHkW85DChb8tjdRpbOM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="385954616"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="385954616"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 10:59:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="934853890"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="934853890"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 02 Nov 2023 10:59:24 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 2 Nov 2023 10:59:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 2 Nov 2023 10:59:24 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 2 Nov 2023 10:59:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=noERM9DLfOa63elIrFCabGWEllGw+MP54Wk0m6tGehkizttNtR0bG3F46WDbDUgMnNjVYWhO4DSWHJSaEz2cxJ3TqfjLSZcaCPjdGTM65ZkzeVj0AGsK9wRGrF7AILLcjvknJ8uZMRvammOQH8C1VA31O9EPGaz/R8gUYFLL4/7xh0ycl4BasCvMLWUlA2QmVr/xP7MbWajLJoZ2f7R/Twk3l9BFUKJ/9QgvVZ/ag8ignZJxlPfY9hiWZbNzmpDLmeJt3Z+iJMCNhAqJFpaHD8ZfRVSK6heOCj8EOHTLVp3OlWDB2sJPa3NbVwEz/bEekOhGVqaeYtd1AFUO1o6msQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o7WkW+lPGPRY+6ynj/pLNNeLLbtCwRxec0dEqrGg6AU=;
 b=dQCnEEAWIfO2vtz0+iGNK0ph50o7whJCmSGim4QuUBoFRCmX4zYKfipiLEOYC4PPOf5+fbW/VipxgY/zXxkju88A25Kz547bQmFz3SeP4d4z0HsCDPejv8yBlHGZX45+unMZ6jVB58GcvWn47cjoJvpXIBfGQsWJnF0o/qhtC5qLO08OTgjLqgcphcVFXVRkQDccqzKMmz33HtGbbGRo0pVDBmv4jRSi/K55Xll35vXlt3BAOUlV9VaZXjjJaP/b0D1B1MK2fpW3unAXPfApHOvKW/oyCSLCSO8Mz6G324bgkk2q+xM3EmeRneh6a4JIa123sLk464Zc8MHKtHQkCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5978.namprd11.prod.outlook.com (2603:10b6:208:385::18)
 by PH7PR11MB6931.namprd11.prod.outlook.com (2603:10b6:510:206::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.24; Thu, 2 Nov
 2023 17:59:21 +0000
Received: from BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::5d1:aa22:7c98:f3c6]) by BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::5d1:aa22:7c98:f3c6%6]) with mapi id 15.20.6954.019; Thu, 2 Nov 2023
 17:59:21 +0000
References: <20231102172736.221038-1-johnathanx.mantey@intel.com>
 <CAMKF1sqafeMMeYfk-eY3gSEUFUL0=XKmSAaJ5Ha9gY68NDFqNQ@mail.gmail.com>
User-agent: mu4e 1.8.11; emacs 28.3
From: Johnathan Mantey <johnathanx.mantey@intel.com>
To: Khem Raj <raj.khem@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH] Update ipmitool to eliminate unneeded patch
Date: Thu, 2 Nov 2023 10:56:16 -0700
In-Reply-To: <CAMKF1sqafeMMeYfk-eY3gSEUFUL0=XKmSAaJ5Ha9gY68NDFqNQ@mail.gmail.com>
Message-ID: <875y2k3ukp.fsf@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MW4P221CA0014.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::19) To BL1PR11MB5978.namprd11.prod.outlook.com
 (2603:10b6:208:385::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5978:EE_|PH7PR11MB6931:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e96c8aa-f2ce-4e7d-2dba-08dbdbcd70c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2rKXevhu2zXsd68Pyc+yV+URVRYmATAojbFs0vU4LTg+4IHlRT34aD8QFhy/MyV8ZL9WJHaJn36XNfyuwhDEuIfi8Uoronbpo1aDAsVvOhdWyu+EdpPvp1t2cXxRDPHoordhhBmZ+s0bXTuwAjglPYLKMBTVLqcRWqzOHzDdAIXOW7E6x7ezpPf7NGNozOBbFz7Ig8olJvQtfgOfQxvytoHPf+PigG5FUWCilHPfObJmwlMtPRqjRets/99YrCCC3TnXk/kH19JrAYkhcxCdTmf158Ij9Ltflr0uj1VMleRb34PICI5XaahomCLydEpLsEytdsq6lyxV35tFfmCVtrXiO7XhPb1x8L7BmaDDG/bWM0kAQ12kbQDhOukdWnFEqgrZwDc7JQsaCgVXztLIYPsyxFCcPf9JKv9iRi6fAP0TOrO3O38xEnAWLwB9kuqgMsXbK3K3b/DyTet35Xp2mYILmMa5ZXO7WawwI2eTQ9rCkD1wXaA3OcFKsy/fS1yBQi59VYJK18YdTCCrzLnVZWdA/icz9Pd6+mR9d6ZvpTyjtg+dSqlIArf+JnaHGzjscPxNJ7+48H/5qzxWykXfkg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5978.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(136003)(346002)(39860400002)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(53546011)(66899024)(38100700002)(2616005)(8676002)(86362001)(36756003)(8936002)(82960400001)(4326008)(83380400001)(5660300002)(26005)(6666004)(966005)(6486002)(6506007)(6512007)(6916009)(478600001)(41300700001)(66556008)(66946007)(2906002)(66476007)(316002)(15650500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEcrQjZkVzVJTXBNeGZ6YUc1dE1UalN5UWtOQlVoTUFHQXl4TkQvSjd2Qk1S?=
 =?utf-8?B?VnJScFYyZG52WHhqZWF3dm5LTHRTZW95ck5RODYwMDFXNWtQTXkxUERJeDdh?=
 =?utf-8?B?YmJVSnIzM01Tb2lMOU1uSkRYR3VVa21VUnM0T2tiNUFOR2RpMzBPS1dXUStj?=
 =?utf-8?B?UldZS2VuY1plTDEzdDVQdHo3dy9GOUpSZENMdjgyWjcrZ094SG5yazYrdStC?=
 =?utf-8?B?QUFKU29ITkdBWlF5MHM0Q1dUUjQxWnJETGhvUlM5dlBYaTJWcXI1ditJMkVn?=
 =?utf-8?B?bnY1ZmhRakQ3VnBkMEJ1cy9WenBsc3hndDc1dU1mTDAxU25SNkVkM1czQ3Ns?=
 =?utf-8?B?S1JEN2Q5d00vSUNkeElJSjNHY0Fna3pTZTl5NVlVcE1EaHUzbTdEQkxsOTUy?=
 =?utf-8?B?SkZkcU5yWllydFAwWmVlcTNPN1c5RC94WGw2RzBFSklhMHZSS1ZzTjFoNUxT?=
 =?utf-8?B?K1FuZGhvbU5VWlY2K1lDdXZ6MVJvYlRrV2U0VnkxTTFtS25nZzN6K3VqQmZF?=
 =?utf-8?B?a0xFUDVYTVQ3YVFsd3VTVlNhOU82SVlYVjgyWHc3Ukw2U0FneTJNb01NWmZV?=
 =?utf-8?B?VWhadlVwaDBoVVlZcUdRVEJic3JwNzM2dDBGWWl3OExJalNTTWhJaGw2dkN0?=
 =?utf-8?B?a096emJrUEdqNjFTUVBoQzBEK0RUN0hYSCthR3pvQmxzdkZYTUlpZERMV0JZ?=
 =?utf-8?B?dllBbFI5RWhWNXY3VzZFNE9NblpyYjU1UXVVc3JsbGE2VWFNQnMwbDZpd0ky?=
 =?utf-8?B?V3ZVQTFxdUlrYlR5bHNGTGFoa1lZM0NaR0I4TURONVRMU3dyQXEzRFVpN0tO?=
 =?utf-8?B?RkhVeFNRRU80OC9nZVYzRC9XM1hNZHFiQXJsdFhSdDVKbUczU2JxZC9ERXFI?=
 =?utf-8?B?ak5vTldFR3RpVzBuZ1dETXlDOWowS1RDRml3R2gxQURqcERGQTdQOVlvMjJs?=
 =?utf-8?B?REJxRWpic0NUSmtqY200akhRdkdGRUtRejRFcGZkeGFsYnVOMytwd0NVQVpq?=
 =?utf-8?B?a2FLMG5namwrZ1Z6T05QZmNHZnpTWnpMT1VBbUFWWDdyS2VqMUF1NE1SRjlT?=
 =?utf-8?B?Y3BkaDcrc1UvVHdUY3dvRlEwZXJXOTVveDVBMjMvWlNNWC96OHZvalpRN1p3?=
 =?utf-8?B?MHZyTm5yeDNLWUdTU1cvWHYya1dDODkwdTZjTXdhc0tkRlo2cEpsYmc1R2di?=
 =?utf-8?B?RlFaMmNSc0VrZHBPNit5aUdNSUdaOUxGWHRwVytIT204UEVaeVhZaFFtVjF3?=
 =?utf-8?B?bGZlMDlVTS9Genc5NzJ6WFJBdGFER3RjTnR1c0lGTWwxb2c2Nkl2RGVyejNr?=
 =?utf-8?B?RCtURlE1UzUxK1lYdEdMdjloOWZHdWFuZkxJd0dJNjRHNkh4ckx4eW1IT1Bo?=
 =?utf-8?B?SnhhRVBJcmpDYUdyVWJ3dzhWclhuRXU3cUlQcEpWVHVqaG5Dd0xpc1Y2aFhP?=
 =?utf-8?B?aU9UdkRiR015SngvTWc1VDJ2ZXhBSE5sUzF1elI0ZXNpMThubTlBeEdyTURT?=
 =?utf-8?B?citXdUc0b3d4NmNPbnpjeXpwOFNhT2JIakJ3cXBhRFdjUGZqY1YwNjhRWmtO?=
 =?utf-8?B?RGZabEc0djMzcWhaOU5oS3hJMHgySUI2ajlaeEhnYmM0T0h5VURvTnVnN29n?=
 =?utf-8?B?Q1NnRmI3NWtFSEgvMDRSdjBNRzJxdFlTZ2pYTnRCVm5zWDFIRHhDdlRET2xR?=
 =?utf-8?B?ZzhlM2FiaUFoLytGcWs3MzZQeFNrU3lFS2FHbHY2VVpOdkZQclBOYVVMaHVN?=
 =?utf-8?B?QVJOeC9rVTJ3dHlBV0l0c3prSDVoVG9KcVRiaXMrcWhNNUZ3WXZBTHJmVmJW?=
 =?utf-8?B?Y1R4NnMyN0lEOGFkRlQyT0x4aGZ1M0FUb2VJVzZ1RzUwM0FyOGJjOHRESzVz?=
 =?utf-8?B?eGc5cXduK2tZU2RsWC9DQ012dERGdnZGYzk0eWtJTXJzLzVKL0pIenQrSFlx?=
 =?utf-8?B?SnJVY2R2L2VpWTVqaTJ5VHJvRmN2UVRXODN2TmZRK0pnMVlYMWJKZE55eE1m?=
 =?utf-8?B?Y2Z4eTh4WTFiN3haSUdEUkp6L3l5ODhGdDF2d1VObGdHeVBseU5rU21NdFZv?=
 =?utf-8?B?WFJLTW5ENTZtTWlVa3EvdGFXdFJmMFRMWG8zZ0lsR3IyUTBGNHVEbWdYaVgy?=
 =?utf-8?B?NTNTbmRTQ1VtYzJ1aGNSYjR0UlNPU0N2VHR2YU9RZ2xvcHRZYzlHcFByZ2Vl?=
 =?utf-8?B?MGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e96c8aa-f2ce-4e7d-2dba-08dbdbcd70c5
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5978.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 17:59:21.2634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mgnOQR6zWIWHkVAag2INlzkA16qFZIcaaRTbX3XdP0FqT9hWFCOD9fNLzYvTDioPPrhS4SOHG2mPGPUk+G8lPMAKkiAtzgzh5/yrWrfFR+k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6931
X-OriginatorOrg: intel.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Nov 2023 17:59:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105846


Khem Raj <raj.khem@gmail.com> writes:

> Thanks for the patch, few nits for future reference
> The patch is not generated against standalone meta-openembedded=20
> repo
> so please do so. it makes it easy
> for us to appy it. The subject line has a familiar format
>
> recipe: <summary>
>
> Details.
>
> The append is not needed the option can be merged into the=20
> options
> just above it.
>
> I have made this tweaks and pushed it into staging ( master-next=20
> )
> please test it out as well on your end
>

I will endeavor to do better for the next commit, as I do have one=20
I hope to make.
Thanks for tweaking my patch, I will pull what you've done, and do=20
some testing.

> On Thu, Nov 2, 2023 at 10:27=E2=80=AFAM Johnathan Mantey
> <johnathanx.mantey@intel.com> wrote:
>>
>> The upstream ipmitool code has implemented an autoconfig=20
>> control to
>> enable and disable dynamic fetching of the IANA numbers=20
>> file. As a
>> result the patch removing the code that blocks fetching the=20
>> IANA numbers is
>> no longer relevant.
>>
>> The patch being removed explicitlly blocks downloading the IANA
>> numbers file. Maintain this behavior at this level by using the
>> --disable-registry-download feature.
>>
>> In order for that autoconfig switch to work, the recipe must=20
>> inherit
>> the pkgconfig feature. Without the pkgconfig dependency the=20
>> code in
>> the configure.ac file causes a compile time error.
>>
>> Tested:
>> IANA numbers file isn't downloaded.
>> Manually downloaded IANA file is installed in /usr/share/misc
>> Enabling registry download enables dynamic download of IANA=20
>> numbers
>>
>> Signed-off-by: Johnathan Mantey <johnathanx.mantey@intel.com>
>> ---
>>  ...-the-logic-to-download-IANA-PEN-data.patch | 41=20
>>  -------------------
>>  .../ipmitool/ipmitool_1.8.19.bb               |  8 ++--
>>  2 files changed, 5 insertions(+), 44 deletions(-)
>>  delete mode 100644=20
>>  meta-openembedded/meta-oe/recipes-kernel/ipmitool/ipmitool/0001-configu=
re-Remove-the-logic-to-download-IANA-PEN-data.patch
>>
>> diff --git
> a/meta-openembedded/meta-oe/recipes-kernel/ipmitool/ipmitool/0001-configu=
re-Remove-the-logic-to-download-IANA-PEN-data.patch
> b/meta-openembedded/meta-oe/recipes-kernel/ipmitool/ipmitool/0001-configu=
re-Remove-the-logic-to-download-IANA-PEN-data.patch
>> deleted file mode 100644
>> index 442f132718..0000000000
>> ---=20
>> a/meta-openembedded/meta-oe/recipes-kernel/ipmitool/ipmitool/0001-config=
ure-Remove-the-logic-to-download-IANA-PEN-data.patch
>> +++ /dev/null
>> @@ -1,41 +0,0 @@
>> -From 63d72f97bd106dd2101cd7fdac6df4f7a053d67c Mon Sep 17=20
>> 00:00:00 2001
>> -From: Khem Raj <raj.khem@gmail.com>
>> -Date: Fri, 2 Sep 2022 08:27:39 -0700
>> -Subject: [PATCH] configure: Remove the logic to download IANA=20
>> PEN database
>> - during configure
>> -
>> -OE will do all downloading before it starts to configure=20
>> therefore this
>> -step is moved out into bitbake recipe, so we can make it=20
>> immutable build
>> -
>> -Upstream-Status: Inappropriate [OE-Specific]
>> -
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ----
>> - configure.ac | 16 +---------------
>> - 1 file changed, 1 insertion(+), 15 deletions(-)
>> -
>> ---- a/configure.ac
>> -+++ b/configure.ac
>> -@@ -56,21 +56,7 @@ if test "x$exec_prefix" =3D "xNONE"; then
>> -       exec_prefix=3D"$prefix"
>> - fi
>> -
>> --if test "x$WGET" =3D "x"; then
>> --      if test "x$CURL" =3D "x"; then
>> --              AC_MSG_WARN([** Neither wget nor curl could be=20
>> found.])
>> --              AC_MSG_WARN([** IANA PEN database will not be=20
>> installed by `make install` !])
>> --      else
>> --              DOWNLOAD=3D"$CURL --location --progress-bar"
>> --              AM_CONDITIONAL([DOWNLOAD], [true])
>> --      fi
>> --else
>> --      DOWNLOAD=3D"$WGET -c -nd -O -"
>> --      AM_CONDITIONAL([DOWNLOAD], [true])
>> --fi
>> --
>> --AC_MSG_WARN([** Download is:])
>> --AC_MSG_WARN($DOWNLOAD)
>> -+AM_CONDITIONAL([DOWNLOAD], [false])
>> - AC_SUBST(DOWNLOAD, $DOWNLOAD)
>> -
>> - dnl
>> diff --git=20
>> a/meta-openembedded/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb=20
>> b/meta-openembedded/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb
>> index ab9074bba5..1c541faf8c 100644
>> ---=20
>> a/meta-openembedded/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb
>> +++=20
>> b/meta-openembedded/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb
>> @@ -21,10 +21,9 @@ LICENSE =3D "BSD-3-Clause"
>>  LIC_FILES_CHKSUM =3D=20
>>  "file://COPYING;md5=3D9aa91e13d644326bf281924212862184"
>>
>>  DEPENDS =3D "openssl readline ncurses"
>> -SRCREV =3D "19d78782d795d0cf4ceefe655f616210c9143e62"
>> +SRCREV =3D "ab5ce5baff097ebb6e2a17a171858be213ee68d3"
>>  SRC_URI =3D=20
>>  "git://codeberg.org/ipmitool/ipmitool;protocol=3Dhttps;branch=3Dmaster=
=20
>>  \
>>             ${IANA_ENTERPRISE_NUMBERS} \
>> -=20
>> file://0001-configure-Remove-the-logic-to-download-IANA-PEN-data.patch=20
>> \
>>             "
>>  IANA_ENTERPRISE_NUMBERS ?=3D ""
>>
>> @@ -34,7 +33,7 @@ IANA_ENTERPRISE_NUMBERS ?=3D ""
>>
>>  S =3D "${WORKDIR}/git"
>>
>> -inherit autotools
>> +inherit autotools pkgconfig
>>
>>  do_install:append() {
>>          if [ -e ${WORKDIR}/iana-enterprise-numbers ]; then
>> @@ -50,5 +49,8 @@ FILES:${PN} +=3D "${datadir}/misc"
>>  # --enable-file-security adds some security checks
>>  # --disable-intf-free disables FreeIPMI support - we don't=20
>>  want to depend on
>>  #   FreeIPMI libraries, FreeIPMI has its own ipmitoool-like=20
>>  utility.
>> +# --disable-registry-download prevents the IANA numbers from=20
>> being fetched
>> +#   at build time, as it is not repeatable.
>>  #
>>  EXTRA_OECONF =3D "--disable-dependency-tracking=20
>>  --enable-file-security --disable-intf-free"
>> +EXTRA_OECONF:append =3D " --disable-registry-download "
>> --
>> 2.41.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#105842):=20
>> https://lists.openembedded.org/g/openembedded-devel/message/105842
>> Mute This Topic:=20
>> https://lists.openembedded.org/mt/102347757/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe:=20
>> https://lists.openembedded.org/g/openembedded-devel/unsub=20
>> [raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


--=20
Johnathan Mantey


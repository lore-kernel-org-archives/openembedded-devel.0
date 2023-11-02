Return-Path: <johnathanx.mantey@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C947C4332F
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 19:41:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web11.41741.1698954059808130866
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Nov 2023 12:41:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=bfqE4gBM;
 spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: johnathanx.mantey@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698954059; x=1730490059;
  h=references:from:to:cc:subject:date:in-reply-to:
   message-id:content-transfer-encoding:mime-version;
  bh=iIg52SKZuZjW7WLNIZnRwRVuduFy8zH1WlcoC3rviIE=;
  b=bfqE4gBMz9bNNMV6moCiMYVoXd/nDY39F0wniIQXbr1hb5PbxDFbz1iZ
   V5C0iJi/7g95ll889x9kBUq0rF5F+8G1vVthZcBBahusRsZ8k7puqFb+q
   lhs6IU99dNfUTzpIP5e9tg6ffXBmaRJSM8l15X5ZdFR7zRFuanRp0YtFt
   X2YeuinOE+PK7P2mFb9PWMOGy/liREMQMOp1+bFftHrDgGwT0LoMCWAUM
   DzCj+0nU5ZkssZWQ0Dp5VPCjJHfifMn3kCehS1fVolf8uT8PMC/6lQ3N3
   PeAN3kh4DDy35q1FGNaFZwZRjttQuQTEVDmgxIj24sVXENQs0ddR6ZUiM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="368144433"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="368144433"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 12:40:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="9118858"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 02 Nov 2023 12:40:58 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 2 Nov 2023 12:40:57 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 2 Nov 2023 12:40:57 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 2 Nov 2023 12:40:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EhuKlrSwtC43jAuiGMfJlOhRQ2K6xqmqTbyc53BzxncxesZCcu3MdFlxa2snfiuTFuz6T9qUpGetpIMaGU333UKvOh+MSe0BLc1hAgQet4VwfXmy+TufwNzhbmYIX+aAmcXFUg8KU+6mZkKuP/MNX55aSkrxqFFp7ow99sgOkToyRMH1qTzJ8ozqSJNEiT1SfppH+sz3BNzzQ1YIhdA1TFOl9IWe8fIzVReIKPKj60pMdhMtNa7wuz36MvpkOnvTAAisnBJCSqdf6L9g+oPw8OUTRcbzP8KWP8zo3Jc3yAxos5hkjtoGxW/aTvjpur6ZQE6N3me8WAZ88p4ZLfDf/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v8GjHp055Fb/KDzyQpinD7tv2uJTgQvTQ5Wx0xIntNA=;
 b=DtH8oGwb9I/xpx21h2hhO847ruA4TYdgrz0vb7eA9OV8Vi0yIUbM+74RhnpStPVhx0l4XUNzNcJuW7qfA+CmZxZEJnXNnSYwoJ9UiDu/U6vKqCk/Ahyb/TMoPQPURLeHF/AWOkoO+anKVk60BS0RsTM5MlwLL7pD6InlXlFRhAA7BubyvCCFxRl0u6QTJZuNZmRocAKlvETXEg6F7rXztwwfjXWvkhbtz/j8xrCGFm4PuoGhhFaYJs61FdvJHsNu5InzAlASgpgrZvnLbky9fTs+XXN1Y3wUhPT/BV9b/IlcT32AsOKBSBl4tWExtXoOZbEuq9lTtIlcm6jeRBxwVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5978.namprd11.prod.outlook.com (2603:10b6:208:385::18)
 by CY5PR11MB6462.namprd11.prod.outlook.com (2603:10b6:930:32::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Thu, 2 Nov
 2023 19:40:55 +0000
Received: from BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::5d1:aa22:7c98:f3c6]) by BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::5d1:aa22:7c98:f3c6%6]) with mapi id 15.20.6954.019; Thu, 2 Nov 2023
 19:40:55 +0000
References: <20231102172736.221038-1-johnathanx.mantey@intel.com>
 <CAMKF1sqafeMMeYfk-eY3gSEUFUL0=XKmSAaJ5Ha9gY68NDFqNQ@mail.gmail.com>
User-agent: mu4e 1.8.11; emacs 28.3
From: Johnathan Mantey <johnathanx.mantey@intel.com>
To: Khem Raj <raj.khem@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH] Update ipmitool to eliminate unneeded patch
Date: Thu, 2 Nov 2023 12:39:02 -0700
In-Reply-To: <CAMKF1sqafeMMeYfk-eY3gSEUFUL0=XKmSAaJ5Ha9gY68NDFqNQ@mail.gmail.com>
Message-ID: <87wmv02bay.fsf@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MW4PR04CA0130.namprd04.prod.outlook.com
 (2603:10b6:303:84::15) To BL1PR11MB5978.namprd11.prod.outlook.com
 (2603:10b6:208:385::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5978:EE_|CY5PR11MB6462:EE_
X-MS-Office365-Filtering-Correlation-Id: b4a2577e-6717-4132-107d-08dbdbdba148
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P9Y+buStWSOixAPaT3guScwTwInnsh/6IiTcfFSrDv329zib0Z1mzGwhny5iO/9P+ncMAsOl7ZdVqmfJdQ8XPYO0THNrN7A8bbPbZEV6+LkFRaWTuxYctgjuuTLr59zhqBXPWKS5IyygB5uXWgzvlO9FTRzb+N24F92lxSEv6O3DdzwisU0GnYYh6ZhMameaS99GogGN3qxeH+sUL0XYaYLpNusrzIPj/V0X2ww2p4tS2eLGJZWL1SkoapbeZZ7t9PjJAjzLJ31g8dkqyKg+kD5l0NgUSqIQ7pcVByOdhjDfL8B4QxEFW2eAFMstuXg7I9rGFRs1O6/hC75WhEl3a8XWEl8yorWHYe1QPJPzj/HC7prhSPLJotQuubfchUHscgYQTLfcDSkaEqOUDejsS94dAbWJzIAZIMkgnYcf2oIFCfKK5S6lpQ6R4gIwbmkRkJ7JeAYhm3cTJnQSQLt/ErAGPHpyjWk79CtZtHnMWFb23tAsMAvkjV8JFJ/aKLQ49XIcLwpcBSuLW52pebdSKsvHdjkNHqGpD9UgueDAijJjFNrp5J47E4MsTxVcuEhi4sJEux0kh2vGQB+8vqff0A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5978.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(396003)(376002)(136003)(346002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(66899024)(966005)(66946007)(26005)(38100700002)(66476007)(316002)(66556008)(6916009)(5660300002)(8676002)(8936002)(4326008)(53546011)(6666004)(6512007)(2906002)(6486002)(2616005)(15650500001)(41300700001)(478600001)(6506007)(86362001)(82960400001)(36756003)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3RmQ3pybUVrQkQyT0srbTNCVjQvelQvd3FXSjFickFZQW1YNkhxR210aExD?=
 =?utf-8?B?dUgxQkhjMElYcWNlVHJ0azJabzB0ZzdzNm44SHg3ZjRSb2ZiZ3d6cmJzeWgy?=
 =?utf-8?B?YkhYVXB0NWZHclprbmcyb2ErWFMyZWl5WE5VcWFMdVUvamFvN2dKckU5YTUw?=
 =?utf-8?B?cjlSakZqLzdqdmYxai9mYVB0emkyNGFjVGpzK2QvRGlmaFlwb2JOVkZqS2lB?=
 =?utf-8?B?aENuTG1pWFd6MTlCS2k2VElaK3ZRMTZGbzkybDRub2szMWxIcFFtcFpqOTFI?=
 =?utf-8?B?c3NYK1lFOTRQTGxabzBza2lnU1Qwa0tNYStLTzBuOUNaQzlHSmhVYkZzWmV0?=
 =?utf-8?B?QXZ2UU10d3RuU3cveWhUUlZBZ1hPcjhiYmF1UGtzQnpoaFA1blAvK1VVSWQ1?=
 =?utf-8?B?Y1p5Rmd4Q3BCeFpNRW9hSHFyZ1BCaG5DaVM4ekcwRkRjYlZXRWxCRFdVbmlM?=
 =?utf-8?B?SDRBZXkwdlM3UW56ZkdnMWRyeGp4aVp1ZXVWTGdWRER6OFN6b0FkenEwOE03?=
 =?utf-8?B?NnlmenpEaUU4ZzZUYVpENzl4MUQyRTJiTDYzZjJHb1k2UjJMUVdxZDZqVFRV?=
 =?utf-8?B?cEJSVW84TDF3bEtrM0JBWGl5NUpKemhRQWVVS2c3K0JCWWJXc0lISUord21w?=
 =?utf-8?B?OTljUHlJSnN6Vk1Cd0ZQY0tpYW4xZXVxNHNHQjlmS1Y1WlhYb21LTUpTamZq?=
 =?utf-8?B?Y0w3ZVFjam5FT1RiVEoyalJvcTZJTVozVklqVnNBWEE1cVdqdTlrMXNEc0lo?=
 =?utf-8?B?MVR0cWU2TkN1a095UDRwTHRGNEtMMkU3RXdtZ1dCMysvcGNTSkFGbUFOeHF3?=
 =?utf-8?B?YmFyK0xmdTFFaVZRMU8yaERFK2NhOHdnenJjYVkxaFFzU3duR25YR3Exa2E1?=
 =?utf-8?B?QzRCYmtkaEtpRy8xU2VsTHllMEQ3b1dXbkF0VTVHcnQ3S3M1QVpKQ3hWck40?=
 =?utf-8?B?ZTkvNnN5WXdjK2RXeWxQU2tSNzRtZEhxTDV4YUZwazBINEs1aW00czBFRkdT?=
 =?utf-8?B?SkcyWlpsK2x2TmNxUmVkNHo0REV4bE90QnVrT3hPTHR4L3JEbGdBc0xZUW1t?=
 =?utf-8?B?SFhieVI3R1hqK2QzVUVkSld6TlV6WkErUTY1Ym1mK1JRNVJoTGR3Z29UOXhV?=
 =?utf-8?B?ZTB0RjZWd2xzVmxZdGpYUFRwemNUdDdVeUJFekxvSnhIVHhrdUgyOW0zeE02?=
 =?utf-8?B?SjZVNVpxQVlBR0krbHZSTDJ6RE5Sd2lFdmxqTERMWTdLZ2ZPZ0prZmUvaGd2?=
 =?utf-8?B?R014WEovdEhjOVloNzNBR3pnTUZpeElmZU1CdjNsRGRxTy9ZbkNQZFpBNXB4?=
 =?utf-8?B?MXNudlJjR2RkQU14YTc4ZGkzZEdMYTlrU2FwcDVQaFdsajI1WW9TZDFXU3kw?=
 =?utf-8?B?VEZCRjBJd3I1SlRULy9rSytaWTNaUm5SZVN4d3NiYUl2MWxyeEpSeDgzR2lt?=
 =?utf-8?B?WkJXUFdhWmpLczMxRFQwYytBUmQ5ZnlUZ0I2NVpXSjd5bmJEc1JPWUlWL0s3?=
 =?utf-8?B?dkdYWC9BSEtxS0orQlBXNHFiZWd0eUJTdlJONFZxR1RLMzRySWEyK21JdzJM?=
 =?utf-8?B?cTRiV2ZJZS9hdzlxU3crQmdOSXZjQlM1VkIxQjF5eDVqZ09uUHBEeUFFQmtC?=
 =?utf-8?B?ckt0VHhGM1lDNDJLVFh6NkJvUDQ1dWtDaGRqS0Z0U0N1N3lONzVpaWdRRWV5?=
 =?utf-8?B?RWpPMDlrQ0N6QWxRQXVSNC9yVS9XWVRRZlZQVHR2SjVTaWtXZFNwQ3JJU21I?=
 =?utf-8?B?SWxTbHF6YjJUZDFSWHJ0b3UrT211ZUp5cEtHVHY2MEF0R1pQcC9Sb2Z4bEo3?=
 =?utf-8?B?NTErVE8zMzRTd1pwdTdRWUtOa3Jpc2hlZGYyN2hqNDk2WExOWEp3d01IalNC?=
 =?utf-8?B?TkFaandGTkNVT3Y4K2pYZDZEakN3UVNxME9JcGluZVBJWk1jYkhBOUhSeHBt?=
 =?utf-8?B?VHIvRVJjcTVHY1N1SEhRaXVKNXN6ODBNWGV1cm1GT1FNbHJ5YWJFa3lNYmcx?=
 =?utf-8?B?cmQ3azdZdkoxVytEOEZuL09keGZrcnk1UXdkZVNRR28xR0pyaVZ1dUEvMFEz?=
 =?utf-8?B?VytBQ1VXWnc3OUxaNU1zTGR0Y3NTRUxyajcwdjAvTUNuOFMzZVNnOXN1dzI0?=
 =?utf-8?B?eEdiL3h2ZVo0N3lTUG9WS2NiTWQydjFIWE9wUlkrWEJrL3lmaURRajlKN1F3?=
 =?utf-8?B?Tmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b4a2577e-6717-4132-107d-08dbdbdba148
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5978.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 19:40:55.5984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vjSy51a42GtHyqJas0xpDtxIYnr3t9xgnngfBnf4ynNlPTuW6Ct9Ton4mRjQNj+pBuuEeQzRrbEAmeQs5Xkh2J8qDcY3C/yWGWEp5f8BLp4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6462
X-OriginatorOrg: intel.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Nov 2023 19:41:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105847


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

I have applied your changes and performed some tests. Everything=20
is working as expected.
Thank you for fixing this for me, and getting it staged!

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


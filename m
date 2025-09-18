Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51F10CAC59F
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 01:56:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by mx.groups.io with SMTP id smtpd.web10.4021.1758160579940803000
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Sep 2025 18:56:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=IRB+o/9g;
 spf=pass (domain: intel.com, ip: 192.198.163.8, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758160579; x=1789696579;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=wd31m9SC4k7A5f/OiZJoT9KZlS9rszaUm9lte9fq4IA=;
  b=IRB+o/9g6Re+gQqJcK7hIWqaj6mk38VyjukKmodZTPL+Y8ibAXD4QPLu
   NFrzknBsgMoMQaTMwIpGRdFFX+NDBE9FVOrXj3B+/CC+nk2HQ+OAsnpC0
   PTc/eON9hxddveRyi2g77FxtLSjjA0YQ0et8kTvko3of+cP/N7/rrDZ4x
   k+KCb5F79EJHzJE7ebc0EJlIIqEJbpuGKXg1p1iG3SYCGG57aUk+I3K+n
   ZO1QDBbDTj31MA6DOpNdT3B/0dCCK/VuBlf1w5epjNBKa0a2xCpSiy7mG
   E2gPFVarzEUcbg1CnBozwBZTpcz9HToPlNSeTOFB0jx8n6BXq6DWGe+xh
   w==;
X-CSE-ConnectionGUID: ULFJL2ctQ/uBK4kddOHziQ==
X-CSE-MsgGUID: hkoExJRdT6OPhP2YxG+taQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="78083355"
X-IronPort-AV: E=Sophos;i="6.18,273,1751266800"; 
   d="scan'208";a="78083355"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 18:56:19 -0700
X-CSE-ConnectionGUID: tlMKdotOTl2pyBh4gtqY0g==
X-CSE-MsgGUID: Aj6uTexRR1K5h0Gy9C1PZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,273,1751266800"; 
   d="scan'208";a="179809516"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 18:56:19 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 17 Sep 2025 18:56:18 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 17 Sep 2025 18:56:18 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.65) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 17 Sep 2025 18:56:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gtntKHjFKeIdO1uTQpvj0Ez1oChgKiR0W4Rlzyi7aar30P87OHAxZ36dA9gzKX+USELyFMxOMpBAzpsHFEwGuaK3d0efvUyqySWkYsOH1oZMa6gBDf8VkICGI/EUrQJd/URwyFhra5QBgbrjzMBOBz5hOt9AzoqPLYZyLmdNMCo+k95vBGH9qnjMHzQ1iS/ICGVekdb3byF+rAuBWuWugZNYJ+m+Tv+oFSsrR8y/CK6ogE0+tY7vJvFYrqUaOwhtcLI4vJaYO7KYjsRn3NsRn3YFcsv7OqYhRcan22wo+pCEhqtmrtLRipn2m+hD9kN2mVto4xY4ZSqMiWuVxzenyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wd31m9SC4k7A5f/OiZJoT9KZlS9rszaUm9lte9fq4IA=;
 b=HQd/vk+RIMpq+ZLwQzVVIPD5G1+yJ0m87NZeCACnFeFCT+WUz4o9xY+AIOWqd8RyVwO3YdSAA2rKz8oUrH1nPVr3PqYhD2dsUfc9r6xrJM1isNui9kZPszS8J8TLwm8PAvAH3SvGGsOoMhAsSZPB/PHcd+9wn1nFSVH06NCM6Xv5evb4xO5pEeSDzh1IBdinrG3nkmpuTQF9w2zewfAChTLzeL+k9wcGS/f4dwASqUo9wC/sZj51yE+zE7CRN+4SwyfXETcYZcyenrOOHo5TZxIT/nQmVdtyPxfRbP90Q0fby9t4D/d4ZDDOLg981pZzWpbWutnY8TFL9ctHPqdbug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6430.namprd11.prod.outlook.com (2603:10b6:8:b6::15) by
 PH3PPF6B7063D92.namprd11.prod.outlook.com (2603:10b6:518:1::d2a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Thu, 18 Sep
 2025 01:56:15 +0000
Received: from DM4PR11MB6430.namprd11.prod.outlook.com
 ([fe80::b81:6df0:d8b2:e596]) by DM4PR11MB6430.namprd11.prod.outlook.com
 ([fe80::b81:6df0:d8b2:e596%5]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 01:56:15 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "soumya.sambu@windriver.com"
	<soumya.sambu@windriver.com>
Subject: Re: [oe][meta-python][kirkstone][PATCH 1/1] python3-twisted: Fix
 CVE-2024-41810
Thread-Topic: [oe][meta-python][kirkstone][PATCH 1/1] python3-twisted: Fix
 CVE-2024-41810
Thread-Index: AQHcJwlVMjOLGiFQsk6tDXCqBmt3x7SYMMEA
Date: Thu, 18 Sep 2025 01:56:15 +0000
Message-ID: <b7132aa6ff32871bfd278cc97c643caff7c41314.camel@intel.com>
References: <20250916125600.1274823-1-soumya.sambu@windriver.com>
In-Reply-To: <20250916125600.1274823-1-soumya.sambu@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6430:EE_|PH3PPF6B7063D92:EE_
x-ms-office365-filtering-correlation-id: 2b656b93-5e7b-4aa4-17a8-08ddf6568d45
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|4022899009|1800799024|376014|366016|38070700021|13003099007;
x-microsoft-antispam-message-info: =?utf-8?B?MTA1TEtoVm5JYTRvNmUweVRMOUVwb1BhRTlCcjJYZXNNc0JLV1JBOTdaYXhT?=
 =?utf-8?B?Ylo5bHZFd1E3bmtJM1lWSDJsMU50NlpvZUlNa2Z1UHRCTkJGZWFwdFZ0T1E5?=
 =?utf-8?B?OXFIU3JXdmtEeXZNbUtERWphZHNpWEFiYUltYjljUlJMR05DMVRQV0t5OUNw?=
 =?utf-8?B?T1ZqclZXSWp1UzBSdEk4cVdzT0RHUG53T0NtWThXNW15T21ySHphei9zREpU?=
 =?utf-8?B?aTM2M3EzL1YzQjhENUpod0RTTVF0WkVCTGlFMm5mcjlvbndRWFg2bjBJREpS?=
 =?utf-8?B?aU1lcW1sR3c3bWE3N3hZVVRLWldVRmk3eGhmSjN2TmZ4eTNMTXZRNmJtbE1p?=
 =?utf-8?B?K0VVUnpIQ3NJY3hRc1l4ZytlMWdMSlNPV0Y2S3JkY3NOcWdvbzZPNGJvVUQ4?=
 =?utf-8?B?N3NIQW4rQnhjVXJDNlA4ZXhWMnVWUVJSWU1Jc2k0TzhDaGZoclpJZ0xzVnc3?=
 =?utf-8?B?OWhjcEd6OFBQRHdtcll2QkJReG9VOUxpejBwREljMFFGUGZVUWdML3FxOVRQ?=
 =?utf-8?B?RlNuV3QyL1hNODRzdlNtT2s2dTl3RlZjYzVBUVZhVThXK2t2ZmZHZEhkZ1NQ?=
 =?utf-8?B?QnRibkhEMjBKSW5CS1czeERkUDY5Z1ZWTDlTclZmNEdhendMZzh5M3pSOWpH?=
 =?utf-8?B?b2tSTVp2V3M4aU1ocjhyQzJOTGRhZHFTNHhIVEhXSjZBamNhdDA0TDY4clRW?=
 =?utf-8?B?eks0M3Nmd0U3ZUM2Uytra2JBSzhza1YzK0dEZmFIdkVIMW00alNZcDMrc0NQ?=
 =?utf-8?B?UmN3OW5LVHpwNFVnYWJXNW91RkFhNjRwYi83K3JpRWdEQ0xOYk9FS0JqdXkw?=
 =?utf-8?B?SW1tYTkvb21ER1dqKzhyWnd1MTViNmo1L0VwaXJUOGtHdWdob0RRQVNuL3RZ?=
 =?utf-8?B?QVBQUjIwVU5xamdkTmkwNDdmeDRINTRoWkt0ZXVuNmRVKzI5MlE1VWU5THhh?=
 =?utf-8?B?NGVVV0dLazIyV09ERDBBajR1VGZCRm44UCtIR2lZV2dYdXRnbDY4K24zVlUv?=
 =?utf-8?B?d1pISWUzZWtiOW1KSGVnQk9BdHQ0Tmk0MUkrdlR3aHFxNk1vRkU3WFRVQWxQ?=
 =?utf-8?B?SmFsWmZQL0Z0K3h4a3VSVjZBelUvT0ZhcU9aNFFiR21ZdlV3L0VXcEFGR2Vk?=
 =?utf-8?B?WU5hOGFIbzR3TVhzTDFQVkt5cFltNDRiZjczYUVqR0VNV253VHFZcE15bzFl?=
 =?utf-8?B?R3FzUDJkQlp5dGt1L0Y0cndIUTJLUGdUNXJtdU1qeTYwbFNjNVo3L0dPR2ow?=
 =?utf-8?B?a1dpUWVTamVUVUJ4TVduV1RBekVjdWljQ2UrVWowcjJybFR0dVMxOUFaK1Jq?=
 =?utf-8?B?NHE3NjZmWXh3YW8rVVFwUHVqSk9SbERiV1hjOEdsMVByc1lvNTJwVTdKa3h5?=
 =?utf-8?B?TXlVMkgvRXNaM2JTeWxhOSszRHFFQjQxNkpRSmJ0aWdpait0cjlRRTMxb3VD?=
 =?utf-8?B?RGZqOEh6QVBZeUFsYyttZ05XWEswa01ycjBmT2JRdkZJaVJ6Q2sxYUFsaDUw?=
 =?utf-8?B?WDBqdkc2WnNMTXdoU01MM1lMd2tEbUM1bFlBdkdLaEd5YkxqYXhWemxzRldG?=
 =?utf-8?B?QzdTS1E3OUwvbHh4WmRhcmlDNTNEL3lvb1VWckRXYWVUSUVkY3JOZjJTUmJC?=
 =?utf-8?B?bi82SWwvMERJdlZNZUNOUlN4blB3N042L2RXenFmc25IWlA4Wk5Rd0U1MmlG?=
 =?utf-8?B?eU9BSjB1RndodTFvYyszcjFvb0hQYXZKVFdOM0RvbjhQRit0cFZQQWIyUTZp?=
 =?utf-8?B?RGs4bXd5YVg3Ky9DWWlVWWRMNEU3SURzc1lGMU5mSEhqbkg1Y2x0ZVFBeFhH?=
 =?utf-8?B?NWgya0szSTN2bXZDaktaeUVzeEZzRUlPVVIrS254UjNLZEJLam0yWVFiWFAr?=
 =?utf-8?B?ZW8rNTR3aDVEUERUUm9oSjNxZVplQ1V2OE1VM1djV09Nd3Q2M0xQcWNqd1NR?=
 =?utf-8?Q?bYmxFKLcgdg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6430.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(376014)(366016)(38070700021)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Lzl1cTJLQnhvUHplQ1BnNStwNzlqaUpWOXN4NzJPOVJjeGlRUXBkYitiamQ2?=
 =?utf-8?B?OXZIL0UzV3J4VUpqcTVnZE5iMWJOYms4T0ZROTJubkdYYkYxczJEYzhnam56?=
 =?utf-8?B?L3BFcXF5bG9HTVdBR2wxTjBkWitXVkQrZ2hXaGVrVklCWVZNa1VaMldxUjA1?=
 =?utf-8?B?V091STVyOHdmN1NWV2dNaVV2eWdaRVRsbWVXRGI2YnFnK1BkY0NHUDZOdkZu?=
 =?utf-8?B?ZVpDa1ErMHlMUEx3LzVVaC94VDhsVHYzcWxSbll0aklJdk1aNjFQdXc2TXR5?=
 =?utf-8?B?d2JrbS9ITFlpUWFOZkJQOFU3QzZKZXNuZHNMMm1BYzFzZHcxUlcybGFualF5?=
 =?utf-8?B?Z2Z4dm5IR3k3YUN0RVkyZWNkOElwK3VxUGpzVjIyMmlxOStaaVNaTmZuamRI?=
 =?utf-8?B?c3JhSm1aTlNabm92TTd3SUdvSVlHZWUwZTRRNEkzem1WM1NXUWV6K0JMeWd2?=
 =?utf-8?B?SEJqR1p4NFlNbnZwd0hQdzFqR3RnYTRCSnd2eXF6Z1ZOc3hQVStaZEIvaldt?=
 =?utf-8?B?dDdsN2NtcDFxY1FkSGZIVUNncWdwZ3U4SHhuN29qV1NXWlY5Zm5vRFI4WCtv?=
 =?utf-8?B?c1U2KzhDZ0hSS0EvUzFsRnczVklWMU5IUStUbmx4REo0UHFkWWlJb3NyaWEz?=
 =?utf-8?B?eEhTWmhaVURNR2lhbFMwNXgrYXNTbnUySGpDNzIzVlgvN2I0M2gySCt3TFZm?=
 =?utf-8?B?R3lvT1RhTlRxdXQwZ2RXZGlsb1g2VFFRWTFDaGhRNmxNRWh5OGRWVGh4VDBZ?=
 =?utf-8?B?QXZhYlZ6RUdvSkNFUEpTaVEyVXB0N3hMM2xRRG40NzR1aTU3QVY1Q0RjSVh0?=
 =?utf-8?B?ZDBsREh5MUZ6bXpYZVN4ejRjTGpjWnNVajNzN1lDSDc2eVNTQVJVOGJsYmNM?=
 =?utf-8?B?VFl2SGtMWDNsZVhSajZsZkl5VzNnMGlxb2oyenhHL0pqcGpSREVtbzBqaE5W?=
 =?utf-8?B?dkxvYkpkNzEvbDkvVCtpNVNJOFR4RTcwQ2NQbURpb0ZtZ3VBamdCZzNvTm55?=
 =?utf-8?B?OW95VjZqajBBUGZFVDJpU1VJNnRMZ3pYTTBKQ0dsWDZMRjJUaDJiVVl1bTJ6?=
 =?utf-8?B?bUlxNVFnS3BYeklVNVcwUE1JWlpYVjkrNWRDY3RnR2huamFkc2hVS2JORTAr?=
 =?utf-8?B?eDcvWXQxbmZyTDE1RzRCVFNOcnZRTlp4MDgzTDFGOGJiZ042QXVIWXdRbC9j?=
 =?utf-8?B?UWE3UlV1RXhzQzBldWF3c3lyUFBEdExhdlZGTUExZUJqVTg0VGorYlZMWWhQ?=
 =?utf-8?B?R3BZNDdldHZxdWFhMkNWejVab0lNN1JDMEZqVHpwNmNMZ1IxOHdFSEFyd2hY?=
 =?utf-8?B?VkFkZlYzS1o2eHo1Q1N2cnhoM0xybUFUWmlxUGZZN2FEVDJNbWxycnk5ajN5?=
 =?utf-8?B?V3lwSHNWZlpuTzBTWDI5aDcyMVJOYTIzRmM3Y0Q2MXdoVmdwS3RxQXdmdEtu?=
 =?utf-8?B?RTZ1REN0a2pLMjQxSTRPai9BdkwrRUxlam5SNWVRT1YwZ0ZWWFdIa2E4QmJK?=
 =?utf-8?B?ZlM1ZW16dFREdi9HYmtNVjgvelEzWlUyUCtvVkxsS0F3WENHWHVSTi9LTWRi?=
 =?utf-8?B?TnladjQzT2dFdGU1WVk0SFVNS2lPYnNMRU9waVVlckJ4YlBNNDgvUVF6TUkx?=
 =?utf-8?B?SU1vNnR3ZElyZmQ5RE81Tkl6VlJHRlh1dFZhTHFpeWliR2dIVU5LQ0ZkMDlT?=
 =?utf-8?B?UWtNTUFVa29TTjRsdzVUQ3dwN3B6R0c4U3hrdnRZS0R6enkyUVhJWi9GRVBq?=
 =?utf-8?B?bk82SFRMS2ppZ1FNSmZiTzRKaXQvZjk0aHV2OGhKZG1Ib3dqNmNWMTRGTm5W?=
 =?utf-8?B?UWEzRmRPQWFSSFA0WjFUVUkvNVhsejNhaEI1ZXhNeEVneVlhaGpYdEZBRXNv?=
 =?utf-8?B?OUp1b3piU1VIczBhMkY1MEg0SjZjald4dkVwYVorZWpFLzVoU0R5eHpXeFQ1?=
 =?utf-8?B?MFdadWVhUmhOWDNRZTY2VnFDUU1VRW5GdU5xLzJ2SlRRMTQ5WnNpTFY2c2dY?=
 =?utf-8?B?dHFkOWdSV0NBbGJVenduY05OcHlnWWVmZVErY1BLYVhSeG1xMjFEQ1lycVND?=
 =?utf-8?B?RFdxcnNEYm5hVFh0QXgxdllseUtON0RkZEVqTnN3ckZMQ2VzZStiM2dxbEdP?=
 =?utf-8?B?SFhFRlFQdVA4aWpTcThaU2lOTk8vZzV5dUFaWWVEenFjTzRqdnFKNEVtOE5i?=
 =?utf-8?B?Znc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2C79DDF5844B454BB5EFD11002685BA4@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b656b93-5e7b-4aa4-17a8-08ddf6568d45
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2025 01:56:15.3545
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nHHsHxR6qx4/LSl3LY2Ow/nkKvF3lBDH9xm/slJepSR/I8ZUvAqXuCUP6ixnvDYDOsZWX/nc4sQkziGYVSed+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF6B7063D92
X-OriginatorOrg: intel.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 01:56:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119497

T24gVHVlLCAyMDI1LTA5LTE2IGF0IDE4OjI2ICswNTMwLCBTb3VteWEgdmlhIGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcNCndyb3RlOg0KPiBGcm9tOiBTb3VteWEgU2FtYnUgPHNvdW15YS5zYW1idUB3
aW5kcml2ZXIuY29tPg0KPiANCj4gVHdpc3RlZCBpcyBhbiBldmVudC1iYXNlZCBmcmFtZXdvcmsg
Zm9yIGludGVybmV0IGFwcGxpY2F0aW9ucywNCj4gc3VwcG9ydGluZyBQeXRob24gMy42Ky4NCj4g
VGhlIGB0d2lzdGVkLndlYi51dGlsLnJlZGlyZWN0VG9gIGZ1bmN0aW9uIGNvbnRhaW5zIGFuIEhU
TUwgaW5qZWN0aW9uDQo+IHZ1bG5lcmFiaWxpdHkuDQo+IElmIGFwcGxpY2F0aW9uIGNvZGUgYWxs
b3dzIGFuIGF0dGFja2VyIHRvIGNvbnRyb2wgdGhlIHJlZGlyZWN0IFVSTA0KPiB0aGlzIHZ1bG5l
cmFiaWxpdHkNCj4gbWF5IHJlc3VsdCBpbiBSZWZsZWN0ZWQgQ3Jvc3MtU2l0ZSBTY3JpcHRpbmcg
KFhTUykgaW4gdGhlIHJlZGlyZWN0DQo+IHJlc3BvbnNlIEhUTUwgYm9keS4NCj4gVGhpcyB2dWxu
ZXJhYmlsaXR5IGlzIGZpeGVkIGluIDI0LjcuMHJjMS4NCg0KVGhpcyBDVkUgaXMgYXBwbGljYWJs
ZSB0byBzY2FydGhnYXAgdG9vLiBDYW4geW91IHNlbmQgYSBwYXRjaCBmb3IgdGhhdA0KYnJhbmNo
IGFzIHdlbGwgcGxlYXNlPw0KDQpUaGFua3MsDQoNCkFudWoNCg0KPiANCj4gUmVmZXJlbmNlOg0K
PiBodHRwczovL252ZC5uaXN0Lmdvdi92dWxuL2RldGFpbC9DVkUtMjAyNC00MTgxMA0KPiANCj4g
VXBzdHJlYW0gcGF0Y2g6DQo+IGh0dHBzOi8vZ2l0aHViLmNvbS90d2lzdGVkL3R3aXN0ZWQvY29t
bWl0LzA0NmExNjRmODlhMGYwOGQzMjM5ZWNlYmQ3NTAzNjBmODkxNGRmMzMNCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IFNvdW15YSBTYW1idSA8c291bXlhLnNhbWJ1QHdpbmRyaXZlci5jb20+DQo+IC0t
LQ0KPiDCoC4uLi9weXRob24zLXR3aXN0ZWQvQ1ZFLTIwMjQtNDE4MTAucGF0Y2jCoMKgwqDCoMKg
IHwgMTA5DQo+ICsrKysrKysrKysrKysrKysrKw0KPiDCoC4uLi9weXRob24vcHl0aG9uMy10d2lz
dGVkXzIyLjIuMC5iYsKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAzICstDQo+IMKgMiBmaWxlcyBj
aGFuZ2VkLCAxMTEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiDCoGNyZWF0ZSBtb2Rl
IDEwMDY0NCBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLQ0KPiB0
d2lzdGVkL0NWRS0yMDI0LTQxODEwLnBhdGNoDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS1weXRo
b24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10d2lzdGVkL0NWRS0NCj4gMjAyNC00
MTgxMC5wYXRjaCBiL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
DQo+IHR3aXN0ZWQvQ1ZFLTIwMjQtNDE4MTAucGF0Y2gNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQN
Cj4gaW5kZXggMDAwMDAwMDAwMC4uYzA4NDIzMDRkYw0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBi
L21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdHdpc3RlZC9DVkUt
MjAyNC0NCj4gNDE4MTAucGF0Y2gNCj4gQEAgLTAsMCArMSwxMDkgQEANCj4gK0Zyb20gMDQ2YTE2
NGY4OWEwZjA4ZDMyMzllY2ViZDc1MDM2MGY4OTE0ZGYzMyBNb24gU2VwIDE3IDAwOjAwOjAwDQo+
IDIwMDENCj4gK0Zyb206IEFkaSBSb2liYW4gPGFkaXJvaWJhbkBnbWFpbC5jb20+DQo+ICtEYXRl
OiBNb24gSnVsIDI5IDE0OjI4OjAzIDIwMjQgKzAxMDANCj4gK1N1YmplY3Q6IFtQQVRDSF0gTWVy
Z2UgY29tbWl0IGZyb20gZm9yaw0KPiArDQo+ICtBZGRlZCBIVE1MIG91dHB1dCBlbmNvZGluZyB0
aGUgIlVSTCIgcGFyYW1ldGVyIG9mIHRoZSAicmVkaXJlY3RUbyINCj4gZnVuY3Rpb24NCj4gKw0K
PiArQ1ZFOiBDVkUtMjAyNC00MTgxMA0KPiArDQo+ICtVcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0
DQo+IFtodHRwczovL2dpdGh1Yi5jb20vdHdpc3RlZC90d2lzdGVkL2NvbW1pdC8wNDZhMTY0Zjg5
YTBmMDhkMzIzOWVjZWJkNw0KPiA1MDM2MGY4OTE0ZGYzM10NCj4gKw0KPiArU2lnbmVkLW9mZi1i
eTogU291bXlhIFNhbWJ1IDxzb3VteWEuc2FtYnVAd2luZHJpdmVyLmNvbT4NCj4gKy0tLQ0KPiAr
IHNyYy90d2lzdGVkL3dlYi9fdGVtcGxhdGVfdXRpbC5wecKgwqDCoMKgwqDCoMKgwqDCoCB8wqAg
MiArLQ0KPiArIHNyYy90d2lzdGVkL3dlYi9uZXdzZnJhZ21lbnRzLzEyMjYzLmJ1Z2ZpeCB8wqAg
MSArDQo+ICsgc3JjL3R3aXN0ZWQvd2ViL25ld3NmcmFnbWVudHMvOTgzOS5idWdmaXjCoCB8wqAg
MSArDQo+ICsgc3JjL3R3aXN0ZWQvd2ViL3Rlc3QvdGVzdF91dGlsLnB5wqDCoMKgwqDCoMKgwqDC
oMKgIHwgMzkNCj4gKysrKysrKysrKysrKysrKysrKysrLQ0KPiArIDQgZmlsZXMgY2hhbmdlZCwg
NDEgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gKyBjcmVhdGUgbW9kZSAxMDA2NDQg
c3JjL3R3aXN0ZWQvd2ViL25ld3NmcmFnbWVudHMvMTIyNjMuYnVnZml4DQo+ICsgY3JlYXRlIG1v
ZGUgMTAwNjQ0IHNyYy90d2lzdGVkL3dlYi9uZXdzZnJhZ21lbnRzLzk4MzkuYnVnZml4DQo+ICsN
Cj4gK2RpZmYgLS1naXQgYS9zcmMvdHdpc3RlZC93ZWIvX3RlbXBsYXRlX3V0aWwucHkNCj4gYi9z
cmMvdHdpc3RlZC93ZWIvX3RlbXBsYXRlX3V0aWwucHkNCj4gK2luZGV4IGJkMDgxYmQuLjNmYjU2
ZTUgMTAwNjQ0DQo+ICstLS0gYS9zcmMvdHdpc3RlZC93ZWIvX3RlbXBsYXRlX3V0aWwucHkNCj4g
KysrKyBiL3NyYy90d2lzdGVkL3dlYi9fdGVtcGxhdGVfdXRpbC5weQ0KPiArQEAgLTkyLDcgKzky
LDcgQEAgZGVmIHJlZGlyZWN0VG8oVVJMOiBieXRlcywgcmVxdWVzdDogSVJlcXVlc3QpIC0+DQo+
IGJ5dGVzOg0KPiArwqDCoMKgwqAgPC9ib2R5Pg0KPiArIDwvaHRtbD4NCj4gKyAiIiIgJSB7DQo+
ICstwqDCoMKgwqDCoMKgwqAgYiJ1cmwiOiBVUkwNCj4gKyvCoMKgwqDCoMKgwqDCoCBiInVybCI6
IGVzY2FwZShVUkwuZGVjb2RlKCJ1dGYtOCIpKS5lbmNvZGUoInV0Zi04IikNCj4gK8KgwqDCoMKg
IH0NCj4gK8KgwqDCoMKgIHJldHVybiBjb250ZW50DQo+ICsgDQo+ICtkaWZmIC0tZ2l0IGEvc3Jj
L3R3aXN0ZWQvd2ViL25ld3NmcmFnbWVudHMvMTIyNjMuYnVnZml4DQo+IGIvc3JjL3R3aXN0ZWQv
d2ViL25ld3NmcmFnbWVudHMvMTIyNjMuYnVnZml4DQo+ICtuZXcgZmlsZSBtb2RlIDEwMDY0NA0K
PiAraW5kZXggMDAwMDAwMC4uYjM5ODJjYQ0KPiArLS0tIC9kZXYvbnVsbA0KPiArKysrIGIvc3Jj
L3R3aXN0ZWQvd2ViL25ld3NmcmFnbWVudHMvMTIyNjMuYnVnZml4DQo+ICtAQCAtMCwwICsxIEBA
DQo+ICsrdHdpc3RlZC53ZWIudXRpbC5yZWRpcmVjdFRvIG5vdyBIVE1MLWVzY2FwZXMgdGhlIHBy
b3ZpZGVkIFVSTCBpbg0KPiB0aGUgZmFsbGJhY2sgcmVzcG9uc2UgYm9keSBpdCByZXR1cm5zIChH
SFNBLWNmNTYtZzZ3Ni1wcXEyKS4gVGhlDQo+IGlzc3VlIGlzIGJlaW5nIHRyYWNrZWQgd2l0aCBD
VkUtMjAyNC00MTgxMC4NCj4gK1wgTm8gbmV3bGluZSBhdCBlbmQgb2YgZmlsZQ0KPiArZGlmZiAt
LWdpdCBhL3NyYy90d2lzdGVkL3dlYi9uZXdzZnJhZ21lbnRzLzk4MzkuYnVnZml4DQo+IGIvc3Jj
L3R3aXN0ZWQvd2ViL25ld3NmcmFnbWVudHMvOTgzOS5idWdmaXgNCj4gK25ldyBmaWxlIG1vZGUg
MTAwNjQ0DQo+ICtpbmRleCAwMDAwMDAwLi4xZTJlN2Y3DQo+ICstLS0gL2Rldi9udWxsDQo+ICsr
KysgYi9zcmMvdHdpc3RlZC93ZWIvbmV3c2ZyYWdtZW50cy85ODM5LmJ1Z2ZpeA0KPiArQEAgLTAs
MCArMSBAQA0KPiArK3R3aXN0ZWQud2ViLnV0aWwucmVkaXJlY3RUbyBub3cgSFRNTC1lc2NhcGVz
IHRoZSBwcm92aWRlZCBVUkwgaW4NCj4gdGhlIGZhbGxiYWNrIHJlc3BvbnNlIGJvZHkgaXQgcmV0
dXJucyAoR0hTQS1jZjU2LWc2dzYtcHFxMiwgQ1ZFLTIwMjQtDQo+IDQxODEwKS4NCj4gK2RpZmYg
LS1naXQgYS9zcmMvdHdpc3RlZC93ZWIvdGVzdC90ZXN0X3V0aWwucHkNCj4gYi9zcmMvdHdpc3Rl
ZC93ZWIvdGVzdC90ZXN0X3V0aWwucHkNCj4gK2luZGV4IDk5NmIwZDAuLjg3MjgyY2UgMTAwNjQ0
DQo+ICstLS0gYS9zcmMvdHdpc3RlZC93ZWIvdGVzdC90ZXN0X3V0aWwucHkNCj4gKysrKyBiL3Ny
Yy90d2lzdGVkL3dlYi90ZXN0L3Rlc3RfdXRpbC5weQ0KPiArQEAgLTUsNyArNSw2IEBADQo+ICsg
VGVzdHMgZm9yIEx7dHdpc3RlZC53ZWIudXRpbH0uDQo+ICsgIiIiDQo+ICsgDQo+ICstDQo+ICsg
aW1wb3J0IGdjDQo+ICsgDQo+ICsgZnJvbSB0d2lzdGVkLmludGVybmV0IGltcG9ydCBkZWZlcg0K
PiArQEAgLTY0LDYgKzYzLDQ0IEBAIGNsYXNzIFJlZGlyZWN0VG9UZXN0cyhUZXN0Q2FzZSk6DQo+
ICvCoMKgwqDCoMKgwqDCoMKgIHRhcmdldFVSTCA9ICJodHRwOi8vdGFyZ2V0LmV4YW1wbGUuY29t
LzQzMjEiDQo+ICvCoMKgwqDCoMKgwqDCoMKgIHNlbGYuYXNzZXJ0UmFpc2VzKFR5cGVFcnJvciwg
cmVkaXJlY3RUbywgdGFyZ2V0VVJMLA0KPiByZXF1ZXN0KQ0KPiArIA0KPiArK8KgwqDCoCBkZWYg
dGVzdF9sZWdpdGltYXRlUmVkaXJlY3Qoc2VsZik6DQo+ICsrwqDCoMKgwqDCoMKgwqAgIiIiDQo+
ICsrwqDCoMKgwqDCoMKgwqAgTGVnaXRpbWF0ZSBVUkxzIGFyZSBmdWxseSBpbnRlcnBvbGF0ZWQg
aW4gdGhlIGByZWRpcmVjdFRvYA0KPiByZXNwb25zZSBib2R5IHdpdGhvdXQgdHJhbnNmb3JtYXRp
b24NCj4gKyvCoMKgwqDCoMKgwqDCoCAiIiINCj4gKyvCoMKgwqDCoMKgwqDCoCByZXF1ZXN0ID0g
RHVtbXlSZXF1ZXN0KFtiIiJdKQ0KPiArK8KgwqDCoMKgwqDCoMKgIGh0bWwgPSByZWRpcmVjdFRv
KGIiaHR0cHM6Ly90d2lzdGVkLm9yZy8iLCByZXF1ZXN0KQ0KPiArK8KgwqDCoMKgwqDCoMKgIGV4
cGVjdGVkID0gYiIiIg0KPiArKzxodG1sPg0KPiArK8KgwqDCoCA8aGVhZD4NCj4gKyvCoMKgwqDC
oMKgwqDCoCA8bWV0YSBodHRwLWVxdWl2PVwicmVmcmVzaFwiDQo+IGNvbnRlbnQ9XCIwO1VSTD1o
dHRwczovL3R3aXN0ZWQub3JnL1wiPg0KPiArK8KgwqDCoCA8L2hlYWQ+DQo+ICsrwqDCoMKgIDxi
b2R5IGJnY29sb3I9XCIjRkZGRkZGXCIgdGV4dD1cIiMwMDAwMDBcIj4NCj4gKyvCoMKgwqAgPGEg
aHJlZj1cImh0dHBzOi8vdHdpc3RlZC5vcmcvXCI+Y2xpY2sgaGVyZTwvYT4NCj4gKyvCoMKgwqAg
PC9ib2R5Pg0KPiArKzwvaHRtbD4NCj4gKysiIiINCj4gKyvCoMKgwqDCoMKgwqDCoCBzZWxmLmFz
c2VydEVxdWFsKGh0bWwsIGV4cGVjdGVkKQ0KPiArKw0KPiArK8KgwqDCoCBkZWYgdGVzdF9tYWxp
Y2lvdXNSZWRpcmVjdChzZWxmKToNCj4gKyvCoMKgwqDCoMKgwqDCoCAiIiINCj4gKyvCoMKgwqDC
oMKgwqDCoCBNYWxpY2lvdXMgVVJMcyBhcmUgSFRNTC1lc2NhcGVkIGJlZm9yZSBpbnRlcnBvbGF0
aW5nIHRoZW0NCj4gaW4gdGhlIGByZWRpcmVjdFRvYCByZXNwb25zZSBib2R5DQo+ICsrwqDCoMKg
wqDCoMKgwqAgIiIiDQo+ICsrwqDCoMKgwqDCoMKgwqAgcmVxdWVzdCA9IER1bW15UmVxdWVzdChb
YiIiXSkNCj4gKyvCoMKgwqDCoMKgwqDCoCBodG1sID0gcmVkaXJlY3RUbygNCj4gKyvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgDQo+IGInaHR0cHM6Ly90d2lzdGVkLm9yZy8iPjxzY3JpcHQ+YWxlcnQo
ZG9jdW1lbnQubG9jYXRpb24pPC9zY3JpcHQ+JywNCj4gcmVxdWVzdA0KPiArK8KgwqDCoMKgwqDC
oMKgICkNCj4gKyvCoMKgwqDCoMKgwqDCoCBleHBlY3RlZCA9IGIiIiINCj4gKys8aHRtbD4NCj4g
KyvCoMKgwqAgPGhlYWQ+DQo+ICsrwqDCoMKgwqDCoMKgwqAgPG1ldGEgaHR0cC1lcXVpdj1cInJl
ZnJlc2hcIg0KPiBjb250ZW50PVwiMDtVUkw9aHR0cHM6Ly90d2lzdGVkLm9yZy8mcXVvdDsmZ3Q7
Jmx0O3NjcmlwdCZndDthbGVydChkb2MNCj4gdW1lbnQubG9jYXRpb24pJmx0Oy9zY3JpcHQmZ3Q7
XCI+DQo+ICsrwqDCoMKgIDwvaGVhZD4NCj4gKyvCoMKgwqAgPGJvZHkgYmdjb2xvcj1cIiNGRkZG
RkZcIiB0ZXh0PVwiIzAwMDAwMFwiPg0KPiArK8KgwqDCoCA8YQ0KPiBocmVmPVwiaHR0cHM6Ly90
d2lzdGVkLm9yZy8mcXVvdDsmZ3Q7Jmx0O3NjcmlwdCZndDthbGVydChkb2N1bWVudC5sb2MNCj4g
YXRpb24pJmx0Oy9zY3JpcHQmZ3Q7XCI+Y2xpY2sgaGVyZTwvYT4NCj4gKyvCoMKgwqAgPC9ib2R5
Pg0KPiArKzwvaHRtbD4NCj4gKysiIiINCj4gKyvCoMKgwqDCoMKgwqDCoCBzZWxmLmFzc2VydEVx
dWFsKGh0bWwsIGV4cGVjdGVkKQ0KPiArKw0KPiArIA0KPiArIGNsYXNzIFBhcmVudFJlZGlyZWN0
VGVzdHMoU3luY2hyb25vdXNUZXN0Q2FzZSk6DQo+ICvCoMKgwqDCoCAiIiINCj4gKy0tIA0KPiAr
Mi40MC4wDQo+ICsNCj4gZGlmZiAtLWdpdCBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtDQo+IHR3aXN0ZWRfMjIuMi4wLmJiIGIvbWV0YS1weXRob24vcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy0NCj4gdHdpc3RlZF8yMi4yLjAuYmINCj4gaW5kZXgg
ZGE4M2YwMTIzYS4uZWY2MDI4OTBlYSAxMDA2NDQNCj4gLS0tIGEvbWV0YS1weXRob24vcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10d2lzdGVkXzIyLjIuMC5iYg0KPiArKysgYi9tZXRh
LXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXR3aXN0ZWRfMjIuMi4wLmJi
DQo+IEBAIC0xMiw3ICsxMiw4IEBAIFNSQ19VUklbc2hhMjU2c3VtXSA9DQo+ICI1N2YzMmIxZjY4
MzhmYWNiOGMwMDRjODk0Njc4NDAzNjdhZDM4ZTllNTM1ZjgyNTIwOTEzNDVkYmE1DQo+IMKgUFlQ
SV9QQUNLQUdFID0gIlR3aXN0ZWQiDQo+IMKgDQo+IMKgU1JDX1VSSSArPSAiZmlsZTovL0NWRS0y
MDI0LTQxNjcxLTAwMDEucGF0Y2jCoFwNCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZmlsZTov
L0NWRS0yMDI0LTQxNjcxLTAwMDIucGF0Y2giDQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZp
bGU6Ly9DVkUtMjAyNC00MTY3MS0wMDAyLnBhdGNowqBcDQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGZpbGU6Ly9DVkUtMjAyNC00MTgxMC5wYXRjaCINCj4gwqANCj4gwqBpbmhlcml0IHB5cGkg
cHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YQ0KPiDCoA0KPiANCj4gLT0tPS09LT0tPS09LT0t
PS09LT0tPS0NCj4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMg
Z3JvdXAuDQo+IFZpZXcvUmVwbHkgT25saW5lICgjMTE5NDY2KToNCj4gaHR0cHM6Ly9saXN0cy5v
cGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWRldmVsL21lc3NhZ2UvMTE5NDY2DQo+IE11
dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210LzExNTI3MjAy
NC8zNjE2NzAyDQo+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtZGV2ZWwrb3duZXJAbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZw0KPiBVbnN1YnNjcmliZToNCj4gaHR0cHM6Ly9saXN0cy5vcGVuZW1i
ZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWRldmVsL3Vuc3ViwqBbDQo+IGFudWoubWl0dGFsQGlu
dGVsLmNvbV0NCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCg==


Return-Path: <yogesh.tyagi@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DA44CF9C7E
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 15:13:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by mx.groups.io with SMTP id smtpd.web10.18709.1727277222352664592
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Sep 2024 08:13:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=dC/Naqbp;
 spf=pass (domain: intel.com, ip: 192.198.163.19, mailfrom: yogesh.tyagi@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727277222; x=1758813222;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=7Sw3F2+pvyiRDxUwPGBd65qRIhvQy5hOh8o9F33vm/s=;
  b=dC/Naqbp0yc9oXqxIbshLpFRg5Y0G7OklHW27s5wtqNQmiVJgsguCL+m
   rYZfiAZoQglYZjp0406vQTGBdQp5MD37S2MQ5n2AxNUoReHdZe2+Yj+Iz
   +oz1XMIL1VU9x2N9IIqmA2toKWXKRAqT6AelN1E7j5xiDyJFz+Z32VMLB
   2HYCSv70/HfQSYNFwrpqXZcWDs4ygFjB13y1jPJv3QD+ad2/yNBn4xXvP
   Jb3nowFNWmWQ28NjM0c5tTGu2TwqoYnXOg43ZICLBX9Ojc1wrfAL1Ln4q
   uXz2AQ6z2EqKpMCVciazBArLL1JcwMHQZOEvWsOPQdkQaHT5JsLCe+5j3
   A==;
X-CSE-ConnectionGUID: Z5Bp/2QvSyqWrCmhvLELRw==
X-CSE-MsgGUID: SgJVGl/8QXevhWDnZ194iQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="25842771"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; 
   d="scan'208";a="25842771"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 08:13:42 -0700
X-CSE-ConnectionGUID: fU3het+5QNeJROdUii/mmA==
X-CSE-MsgGUID: nRoC9M02TeW5S3cyhsXHKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; 
   d="scan'208";a="109270588"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 25 Sep 2024 08:13:42 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 25 Sep 2024 08:13:41 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 25 Sep 2024 08:13:41 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 25 Sep 2024 08:13:41 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 25 Sep 2024 08:13:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ibAp0wNSkqAm/daRVYfWskNcQ6iX2i/pLxsTtwJzpfBNcqaH41yvJmH+PTHL17kemDHN/Co3l/4qziaZAy6fiFb9JqariTTAnuatJFOGbjOVloZ+iu6+PVwSJA9KU0gfeHDbcvqiqA6VSelPzn2s/fKGHqAc4k5n7flkNWo99b8Yk8cRgIMraUPzJed3OEb0S0PcudjA/fc4sS7rBkue2/Dhg8AHt6nJZRw45VzYF/kpRIPQ/il+178II/X4z7ldhqCDbfcNONTcSDu2l0lObY2rkxTAvZhITLuRvSOQjzpBBP+hOEdHotQsXPnuLEbhmXk+OBkhCphOftrMwcuVWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Sw3F2+pvyiRDxUwPGBd65qRIhvQy5hOh8o9F33vm/s=;
 b=y/T9mB2XtQVUr3NXZi5s+Hdn2Gr7mPr+EFrghutZFaIzh/Tb3173BcBJNiJov1BnbPS9tfqWUiJgc+3ZFjHOkyP5rRMPrbLGLdchjROlqCZs9rA9z/KotmccSAUoD2thnqtuAOjmdJrH71eLQL9CzvfVeXVeuYK7HVVS01JuBrCMXdxeyk3IA+LsCaw/wbwV6XWx6lS+5bws+acrRcUVHFEfJotKqZri/vh4Yv6T2rwc4pTYIZZSdEDdS4b/3L8r2madWjAQniIXF+yWM1ZpmCOQ1HQqaU+ZFVVFDovO73+P44sy1ObDkqqCzLpgEjfvSCWtDTmhOk3RbOEJEFhzhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5867.namprd11.prod.outlook.com (2603:10b6:a03:42a::13)
 by SJ1PR11MB6299.namprd11.prod.outlook.com (2603:10b6:a03:456::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.29; Wed, 25 Sep
 2024 15:13:37 +0000
Received: from SJ0PR11MB5867.namprd11.prod.outlook.com
 ([fe80::dc4d:b84:3424:b7e0]) by SJ0PR11MB5867.namprd11.prod.outlook.com
 ([fe80::dc4d:b84:3424:b7e0%7]) with mapi id 15.20.7982.022; Wed, 25 Sep 2024
 15:13:37 +0000
From: "Tyagi, Yogesh" <yogesh.tyagi@intel.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [scarthgap][PATCH] tbb-native: Fix build with gcc-13
Thread-Topic: [oe] [scarthgap][PATCH] tbb-native: Fix build with gcc-13
Thread-Index: AQHbD11JXx6JcOa6gk+RjdztOaBfmbJom/tA
Date: Wed, 25 Sep 2024 15:13:37 +0000
Message-ID: <SJ0PR11MB58671054576E0E99C5C1CAAC8C692@SJ0PR11MB5867.namprd11.prod.outlook.com>
References: <20240925095224.1383106-1-yogesh.tyagi@intel.com>
 <CAMKF1srzWN1U9MOS3V9qArjCtbZ3o57TkTYraZut8mBo=-yB5A@mail.gmail.com>
In-Reply-To: <CAMKF1srzWN1U9MOS3V9qArjCtbZ3o57TkTYraZut8mBo=-yB5A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5867:EE_|SJ1PR11MB6299:EE_
x-ms-office365-filtering-correlation-id: 05067f1c-2046-49f9-336a-08dcdd74a199
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|4022899009|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?eFYxaTRuQ2pJTm51UTBoVkFpcnBoSmp4cXpvVWwweUMzeWduNTNoWEVpUnc4?=
 =?utf-8?B?aU5COGpUVFZ2TFdMZVppUXQ4RmpObjByRTN2V1lHWUJjbXppemd4MVR5WVBQ?=
 =?utf-8?B?Q2VFOElhWmVRM0E4b3E3VmZsSC9wbFR3bllYOFpVUnBhVHAvVXFiRWUyQW1K?=
 =?utf-8?B?RkxKSmNnMDdLMG1GRzZPZVI3ak1FSzI2enR5ZDhxR1hFVEVhNkRtZGJnUTVj?=
 =?utf-8?B?Nm5oZnh1elI3S1d6bzhsQjBWOVhuUUUrQ3B4d2tia1VtWjl1aWlyVVVLSXNy?=
 =?utf-8?B?TXY3OXpUVHpDVHZwMm5ickNXdWZQU0RzRVl4NWh3Zm1XM1FKd2dFNGlheSt1?=
 =?utf-8?B?WW0zSm9uNUh3MlFURHk5Q1UwekVFQkFxdEtSN2dUUlhzN2xqZmZPc0p1cm1k?=
 =?utf-8?B?SjB1REV1MnBtWmNaZkpSaFpMT2Y5L0xqYWZmWitDTnNFTkhFQWg5S0JQSkVw?=
 =?utf-8?B?UHdhRW1KU0xUQkNEb0p1RXBNOHlvUHVoS0EzZTFUNlZVZUZ2ZTVSN3RFSlJi?=
 =?utf-8?B?T05SREF0elhTOHdpcVZwMUJBS2g4SStDcXBoWDFGZjYweXF1azZCbzhiZll4?=
 =?utf-8?B?ZVp5Tms0dDJ6U2hla0I1cndWZVY5VjNBMXhWL1dTOWhMemdLbHR5bk5yUWZF?=
 =?utf-8?B?VzlKZkZzUWkzbXNacUFBOHBremI5aTBqdHFEa0RyYUpLUVdzWGxDVVpLMUsw?=
 =?utf-8?B?R2ZOMXM4QXA2ZmdEUm95WktCRi9BNmUzdUFmcWN5MTlKTmM5Z21lZzhCaVoz?=
 =?utf-8?B?ZDQ2cXBVelNCcVhiaU1GVlRrSGxncVBGQkdSZDA0UnRYR0Q4NFNOL0R4c241?=
 =?utf-8?B?TlNoaGZKNDRuZ2Zvd3JFZXdXVWNyMnJ6YW1uNkc1OUtMRFFiLzRXSUJ6Ynhi?=
 =?utf-8?B?YkxIUlVYdTYvMDlsSXdKMVpKanVjcEZ5N2dNbmhlcmdhSWJ1RTh6TS9GdmRL?=
 =?utf-8?B?bVRWa09jYzBuekpCMnZMcGFYSzlnZHVQcWpoYXpML0NSVFVYdjAydkR1OFhy?=
 =?utf-8?B?QlN6V0hiNHRoRnZ3eVFucmdTSGlRMm5UZnp2dldveU9FTWQ1ZVR6c2RsV0pi?=
 =?utf-8?B?elMzYzUrWlA4aTlwVkdSRUxYd25CeWU5MWpkTGFCYS93YzJhZXZLTnJCYW1a?=
 =?utf-8?B?OFhjM0pVb3pVV1N2VmlXZ2tUNEgwZjdWUGRSL01PWUFIck15VS80eGdLMlVT?=
 =?utf-8?B?UklrV3dON2o3TEtvVDRmZTRVUTdjbmJYTVA5MzdWSUEvbVNrUlA2ODRHR3R6?=
 =?utf-8?B?UU5MSGJIV3AyelNKbU5qbjVWZlpldDR1L0V5S21MYUdONHpQYUZScThKNDJM?=
 =?utf-8?B?OE9XZW1yMldsRHJxTWNGNlVpVzZ2L24rSmg5NHc2VjM3ejloaFM4VVRwaFBK?=
 =?utf-8?B?cG1ReDAvemt3NkhKektpdm12dlRkY0k2bitiL2tQclNxSk83T09KRThybzFW?=
 =?utf-8?B?MHhad2RWQUIxRCtCS3F3Q05MeTA2Z1RlSzR3cDkzaUJWbmNlaXVwbm9Vbmdh?=
 =?utf-8?B?RmdIeEVRVkNzazVxdG5Nc2V4UW51eXdMbWs3S2ZWSmlvTndiZ1F2QmR6SGtK?=
 =?utf-8?B?M1hUNkxTdGdmNVZwSEhNdmIwbStsK0NLamJhU0lNK0tjbTdsY0lOYTVpQWdv?=
 =?utf-8?B?KzIvbUgzSE41dFBvLzdWNkRBSVZ6YnZERTNKZTR2RTBsdUR3RGUwZUsyei8x?=
 =?utf-8?B?OTVaWnV0K0E1RFNwakZ0Nk9mQ3NzK1dDTFRiUjlUbFlocXdEeEQ0V2dzUnRj?=
 =?utf-8?B?TVd4SHBZTTk0MEJkWlJWdytwY053NGdxSFJZK2VteWFFWHRMNy9XWVpJQ0tB?=
 =?utf-8?Q?2m2FL9BQA6jOZVSLNNehotr/Ot7Bf4Ee9oZKY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4022899009)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SGZLSGRTYlN1eHNnYUFoeWllb3J3NVYvdWRad0JTL0FzeGdwVjhMN01YT29Y?=
 =?utf-8?B?T2FhR09aRm92cFhycHc5NGtBQnRwZ21yQ256cTlTRUVzTlRsR3Z3TWNIa2wz?=
 =?utf-8?B?UkxHRllseERLMDdPdDM0QXVBYTBYQ1F5N0pFQ1VQQm5VemV3RTdkb1ZwcDVv?=
 =?utf-8?B?bkJYdnNMM1B1Z0t4RUNaY2J1U21peU9uWWFVaUtiWElBQzd6TitSRFVleEcz?=
 =?utf-8?B?VkQzZElDK0loOWxIQnBEVUIrNlVXWVdBRHE0MHZBNWl4cXNmUXhFRUpzZ3Fl?=
 =?utf-8?B?WVdsV1d2Y2pHdW5Lakc5aUlSOStFbFg1Rm9TQzZhZ3g3Qk1iWWtuKzlUUXJP?=
 =?utf-8?B?bm9yLzFvRFVJMFFoUDZyblNKL1d5SWJqbWVHV1Irb2NuTmNXSmZaSmtIZEs0?=
 =?utf-8?B?UkxqZGdXVTRTZURKZUpxaVBNV2NBWS9XVVFyMnlkNm5jTkdDTk1SSFc1b2Qv?=
 =?utf-8?B?RE96akMvZXdtR1pFTlc1ckQ4MVZwWFpDR0dKZTYyNnNDTEUyQ293WExrNWhP?=
 =?utf-8?B?S3hOT2NMdjhhZzI0UkR2QUJuVkp6TjFDNzNCYXFTQU1ldzJoQ1pMblBMRHBs?=
 =?utf-8?B?TGxaZ3JlS2lHOTE5emxDS2MrY3NXRDVpV3JyVDlVNTRtYUNtRjZqdXo2MXI5?=
 =?utf-8?B?RU5zNU02dFZzakdEN1pqMWRKME5PcnVwL1dtS09HUVdkaElJZXNNWlFyQlFn?=
 =?utf-8?B?UzFaNDRFYkduZGhPY1hUam10REo4aDBONjBHYWtrVitqVXVQbCtmVlNFODFT?=
 =?utf-8?B?cmlOWVR6ZzBCdEtwa0tpbDljOFB1bTJkWFVLaU5EdmdSYXBUS2JwRHJSSDdU?=
 =?utf-8?B?ZjhvZFF5TEhaK3FGdVRxSEtaQmxHYUh2OTB2amdRSFlidFlObUZGaFh6K1ZQ?=
 =?utf-8?B?UEVTalN0ODF3VTdDQ01abTUrMzdFTXZuQkY5R0g5ZEpaa3hYUzgrVWgvdHJ6?=
 =?utf-8?B?R1FpeCtWN1JNN2FwcjhQdUphRU12d3ZSNXlkc2dsOXRiS2wzSEJiVWNjWTFx?=
 =?utf-8?B?SUhvOXVHTng0QS9lWWVaK0IrbUlLd1loTHlVeVJQMmt5WXZFby9sNFFjUlpa?=
 =?utf-8?B?S3hiUGlKcG14RnFZRDUzU2R3b2plZGJGNCs3c2NyYWV0SWF3ZEVzbjdmSFdo?=
 =?utf-8?B?ZzM3QWdDalRuRlJWTTNYSS8wTHF2WDdaMzMyQ3F1eTVsV2NiSVBqaGlPVGdD?=
 =?utf-8?B?TnJZYmpMaUNmUGV5UGNTR0c1SkJFT09ZblBDSUl1ak8xSXg5OUFMMGFwUlhu?=
 =?utf-8?B?cUJUZVhzVmYyRDEzLzBKZXRFVUFLeVZJSzhObGJkNURVWlhnMUFYUFNDdGpx?=
 =?utf-8?B?eFZCRVMxQ1MyR3NFSzFya3RRRjBzbUxJaERuN0p3SER4dlRKelNNZnRnSTJQ?=
 =?utf-8?B?eENYVkJmUG1ua2tKQitRSUxqc3FNZ1F1NXE0N0kxU0NzVStVUWZEQ1c4TmZS?=
 =?utf-8?B?WHpYVFJHYm1DNzRwVi9BLzFqQk9TSWZPRXhGZjZTdHMxbDRxWHdpZTl6NkF5?=
 =?utf-8?B?d3RQTU5wdXBtelE5RXBZNGNKc0ZnZ2R3WENlYUxPdThsTWs3S3YzMUxyaEdT?=
 =?utf-8?B?RjF5bjdmcFUvSGllUHNXbVMwY2ZTV25ZTXRaRms0OVJndnJ3L0prc1g4cXBT?=
 =?utf-8?B?aDR6RnBwREE5WWU1S2hrNXVGQ3RxN25CVWJvZ1FTRVM5c1BjQ0FCRGhkeEoy?=
 =?utf-8?B?UkdpWFozRy82Qm9GSzhMVXNBVnhReGxhN05OM1d3MGFpSk0vVzlYTDUzcC9P?=
 =?utf-8?B?Z3RiQU1wQk02NElNY0Nuc3M3cDVjd1hUa2xLTW8vLzZTbnhiVU1RL2tieHVX?=
 =?utf-8?B?cE9WZmFJRjJFK3oyTDJXVS9RRFAwZmpLUmFvTGp6amYydEYybjM2QlJNS01I?=
 =?utf-8?B?ajNwRnVXZFRSMUVvZWJZc25sa0ZTbUFTUlA1dytKR0hFQzVQZTF3L0ZnM1pl?=
 =?utf-8?B?NDRVdWFieldnbUFsVkY3NU8vbFN5dDE5YlRLY0dvakk1ZDBielNkbDgvRGZL?=
 =?utf-8?B?UzFHQ0dPTzcxcGd5eEdJeGNNdnE0WXR6S3lGd1JaWFh0OU14S1VreDh3T0Vq?=
 =?utf-8?B?RTNFKzJ5b2Q4WEladnoyNkllWW5MRDd5L0g4dVRkVSsyWFNyV0M1MGdQa1ds?=
 =?utf-8?Q?HTJLaBGNdJiPhalK6DPDdr5Zw?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05067f1c-2046-49f9-336a-08dcdd74a199
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2024 15:13:37.6376
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DLwz3F0SgLHcXJUb+NhYlvbaDN60RZEmb4uu5uIqQ0ulSip4Z4H7rXhiK8p5zcjFKgHNUU5eQubSih1StvnzDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6299
X-OriginatorOrg: intel.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Sep 2024 15:13:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112499

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2hlbSBSYWogPHJhai5r
aGVtQGdtYWlsLmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCBTZXB0ZW1iZXIgMjUsIDIwMjQgODo0
MSBQTQ0KPiBUbzogVHlhZ2ksIFlvZ2VzaCA8eW9nZXNoLnR5YWdpQGludGVsLmNvbT4NCj4gQ2M6
IG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJl
OiBbb2VdIFtzY2FydGhnYXBdW1BBVENIXSB0YmItbmF0aXZlOiBGaXggYnVpbGQgd2l0aCBnY2Mt
MTMNCj4gDQo+IGRvIHdlIG5lZWQgdGhpcyBvbiBtYXN0ZXIgYXMgd2VsbCA/DQoNCnRiYi1uYXRp
dmUgaXMgYnVpbGRpbmcgZmluZSBvbiBtYXN0ZXIuDQoNCj4gDQo+IE9uIFdlZCwgU2VwIDI1LCAy
MDI0IGF0IDI6NTLigK9BTSBZb2dlc2ggVHlhZ2kgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcN
Cj4gPHlvZ2VzaC50eWFnaT1pbnRlbC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4NCj4gd3Jv
dGU6DQo+ID4NCj4gPiAqIEZpeGVzIGZvbGxvd2luZyBzdHJpbmdvcC1vdmVyZmxvdyB3YXJuaW5n
IHdpdGggZ2NjLTEzOg0KPiA+DQo+ID4gSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC91c3IvaW5jbHVk
ZS9jKysvMTMvYXRvbWljOjQxLA0KPiA+ICAgICAgICAgICAgICAgICAgZnJvbSAvcG9reS9idWls
ZC90bXAvd29yay94ODZfNjQtbGludXgvdGJiLQ0KPiBuYXRpdmUvMjAyMS4xMS4wL2dpdC9zcmMv
dGJiLy4uLy4uL2luY2x1ZGUvb25lYXBpL3RiYi9kZXRhaWwvX3V0aWxzLmg6MjIsDQo+ID4gICAg
ICAgICAgICAgICAgICBmcm9tIC9wb2t5L2J1aWxkL3RtcC93b3JrL3g4Nl82NC1saW51eC90YmIt
DQo+IG5hdGl2ZS8yMDIxLjExLjAvZ2l0L3NyYy90YmIvdGFza19kaXNwYXRjaGVyLmg6MjAsDQo+
ID4gICAgICAgICAgICAgICAgICBmcm9tIC9wb2t5L2J1aWxkL3RtcC93b3JrL3g4Nl82NC1saW51
eC90YmItDQo+IG5hdGl2ZS8yMDIxLjExLjAvZ2l0L3NyYy90YmIvYXJlbmEuY3BwOjE3Og0KPiA+
IEluIG1lbWJlciBmdW5jdGlvbiDigJh2b2lkIHN0ZDo6X19hdG9taWNfYmFzZTxfSW50VHA+Ojpz
dG9yZShfX2ludF90eXBlLA0KPiBzdGQ6Om1lbW9yeV9vcmRlcikgW3dpdGggX0lUcCA9IGJvb2xd
4oCZLA0KPiA+ICAgICBpbmxpbmVkIGZyb20g4oCYdm9pZCBzdGQ6OmF0b21pYzxib29sPjo6c3Rv
cmUoYm9vbCwgc3RkOjptZW1vcnlfb3JkZXIp4oCZIGF0DQo+IC91c3IvaW5jbHVkZS9jKysvMTMv
YXRvbWljOjEwNDoyMCwNCj4gPiAgICAgaW5saW5lZCBmcm9tIOKAmHZvaWQNCj4gdGJiOjpkZXRh
aWw6OnIxOjpjb25jdXJyZW50X21vbml0b3JfYmFzZTxDb250ZXh0Pjo6bm90aWZ5X29uZV9yZWxh
eGVkKCkgW3dpdGgNCj4gQ29udGV4dCA9IGxvbmcgdW5zaWduZWQgaW50XeKAmSBhdCAvcG9reS9i
dWlsZC90bXAvd29yay94ODZfNjQtbGludXgvdGJiLQ0KPiBuYXRpdmUvMjAyMS4xMS4wL2dpdC9z
cmMvdGJiL2NvbmN1cnJlbnRfbW9uaXRvci5oOjI5Mzo1MzoNCj4gPiAvdXNyL2luY2x1ZGUvYysr
LzEzL2JpdHMvYXRvbWljX2Jhc2UuaDo0ODE6MjU6IGVycm9yOiDigJh2b2lkDQo+IF9fYXRvbWlj
X3N0b3JlXzEodm9sYXRpbGUgdm9pZCosIHVuc2lnbmVkIGNoYXIsIGludCnigJkgd3JpdGluZyAx
IGJ5dGUgaW50byBhIHJlZ2lvbg0KPiBvZiBzaXplIDAgb3ZlcmZsb3dzIHRoZSBkZXN0aW5hdGlv
biBbLVdlcnJvcj1zdHJpbmdvcC1vdmVyZmxvdz1dDQo+ID4gICA0ODEgfCAgICAgICAgIF9fYXRv
bWljX3N0b3JlX24oJl9NX2ksIF9faSwgaW50KF9fbSkpOw0KPiA+ICAgICAgIHwgICAgICAgICB+
fn5+fn5+fn5+fn5+fn5+Xn5+fn5+fn5+fn5+fn5+fn5+fn5+fg0KPiA+IGNvbXBpbGF0aW9uIHRl
cm1pbmF0ZWQgZHVlIHRvIC1XZmF0YWwtZXJyb3JzLg0KPiA+IGNjMXBsdXM6IGFsbCB3YXJuaW5n
cyBiZWluZyB0cmVhdGVkIGFzIGVycm9ycw0KPiA+DQo+ID4gKGNoZXJyeSBwaWNrZWQgZnJvbSBj
b21taXQgZTEzMTA3MTc2OWVlM2RmNTFiNTZiMDUzYmE2YmZhMDZhZTllZmYyNSkNCj4gPg0KPiA+
IFNpZ25lZC1vZmYtYnk6IFlvZ2VzaCBUeWFnaSA8eW9nZXNoLnR5YWdpQGludGVsLmNvbT4NCj4g
PiAtLS0NCj4gPiAgLi4uc3VwcHJlc3MtbmV3LUdDQy0xMi0xMy13YXJuaW5ncy0xMTkyLnBhdGNo
IHwgNTcNCj4gPiArKysrKysrKysrKysrKysrKysrICBtZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC90
YmIvdGJiXzIwMjEuMTEuMC5iYiAgfA0KPiA+IDEgKw0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDU4
IGluc2VydGlvbnMoKykNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+ID4gbWV0YS1vZS9yZWNp
cGVzLXN1cHBvcnQvdGJiL3RiYi8wMDAxLUZpeC1zdXBwcmVzcy1uZXctR0NDLTEyLTEzLXdhcm5p
bg0KPiA+IGdzLTExOTIucGF0Y2gNCj4gPg0KPiA+IGRpZmYgLS1naXQNCj4gPiBhL21ldGEtb2Uv
cmVjaXBlcy1zdXBwb3J0L3RiYi90YmIvMDAwMS1GaXgtc3VwcHJlc3MtbmV3LUdDQy0xMi0xMy13
YXJuDQo+ID4gaW5ncy0xMTkyLnBhdGNoDQo+ID4gYi9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC90
YmIvdGJiLzAwMDEtRml4LXN1cHByZXNzLW5ldy1HQ0MtMTItMTMtd2Fybg0KPiA+IGluZ3MtMTE5
Mi5wYXRjaA0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMC4u
NDg5ZjAxMWI4NA0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9tZXRhLW9lL3JlY2lwZXMt
c3VwcG9ydC90YmIvdGJiLzAwMDEtRml4LXN1cHByZXNzLW5ldy1HQ0MtMTItMTMtDQo+ID4gKysr
IHdhcm5pbmdzLTExOTIucGF0Y2gNCj4gPiBAQCAtMCwwICsxLDU3IEBADQo+ID4gK0Zyb20gZTEz
MTA3MTc2OWVlM2RmNTFiNTZiMDUzYmE2YmZhMDZhZTllZmYyNSBNb24gU2VwIDE3IDAwOjAwOjAw
DQo+ID4gKzIwMDENCj4gPiArRnJvbTogRG1pdHJpIE1va2hvdiA8ZG1pdHJpLm4ubW9raG92QGlu
dGVsLmNvbT4NCj4gPiArRGF0ZTogTW9uLCAxMSBTZXAgMjAyMyAxMDozNTowNyAtMDUwMA0KPiA+
ICtTdWJqZWN0OiBbUEFUQ0hdIEZpeC9zdXBwcmVzcyBuZXcgR0NDIDEyLzEzIHdhcm5pbmdzICgj
MTE5MikNCj4gPiArDQo+ID4gK1Vwc3RyZWFtLVN0YXR1czogQmFja3BvcnQNCj4gPiArW2h0dHBz
Oi8vZ2l0aHViLmNvbS9vbmVhcGktDQo+IHNyYy9vbmVUQkIvY29tbWl0L2UxMzEwNzE3NjllZTNk
ZjUxYjU2YjA1Mw0KPiA+ICtiYTZiZmEwNmFlOWVmZjI1XQ0KPiA+ICtTaWduZWQtb2ZmLWJ5OiBE
bWl0cmkgTW9raG92IDxkbWl0cmkubi5tb2tob3ZAaW50ZWwuY29tPg0KPiA+ICstLS0NCj4gPiAr
IC4uLi9vbmVhcGkvdGJiL2RldGFpbC9fY29uY3VycmVudF91bm9yZGVyZWRfYmFzZS5oICAgfCAg
MiArLQ0KPiA+ICsgc3JjL3RiYi9jb25jdXJyZW50X21vbml0b3IuaCAgICAgICAgICAgICAgICAg
ICAgICAgICB8IDEyICsrKysrKysrKysrLQ0KPiA+ICsgMiBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+ICsNCj4gPiArZGlmZiAtLWdpdCBhL2luY2x1
ZGUvb25lYXBpL3RiYi9kZXRhaWwvX2NvbmN1cnJlbnRfdW5vcmRlcmVkX2Jhc2UuaA0KPiA+ICti
L2luY2x1ZGUvb25lYXBpL3RiYi9kZXRhaWwvX2NvbmN1cnJlbnRfdW5vcmRlcmVkX2Jhc2UuaA0K
PiA+ICtpbmRleCBhZGU5MWMzMy4uNDA4MjkyMDggMTAwNjQ0DQo+ID4gKy0tLSBhL2luY2x1ZGUv
b25lYXBpL3RiYi9kZXRhaWwvX2NvbmN1cnJlbnRfdW5vcmRlcmVkX2Jhc2UuaA0KPiA+ICsrKysg
Yi9pbmNsdWRlL29uZWFwaS90YmIvZGV0YWlsL19jb25jdXJyZW50X3Vub3JkZXJlZF9iYXNlLmgN
Cj4gPiArQEAgLTkyMSw3ICs5MjEsNyBAQCBwcml2YXRlOg0KPiA+ICsgICAgICAgICAgICAgbm9k
ZV9hbGxvY2F0b3JfdHJhaXRzOjpkZWFsbG9jYXRlKGR1bW15X25vZGVfYWxsb2NhdG9yLCBub2Rl
LCAxKTsNCj4gPiArICAgICAgICAgfSBlbHNlIHsNCj4gPiArICAgICAgICAgICAgIC8vIEdDQyAx
MS4xIGlzc3VlcyBhIHdhcm5pbmcgaGVyZSB0aGF0IGluY29ycmVjdCBkZXN0cnVjdG9yIG1pZ2h0
IGJlDQo+IGNhbGxlZCBmb3IgZHVtbXlfbm9kZXMNCj4gPiArLSAgICAgICAgICAgICNpZiAoX19U
QkJfR0NDX1ZFUlNJT04gPj0gMTEwMTAwICYmIF9fVEJCX0dDQ19WRVJTSU9OIDwNCj4gMTMwMDAw
ICkgJiYgIV9fY2xhbmdfXyAmJiAhX19JTlRFTF9DT01QSUxFUg0KPiA+ICsrICAgICAgICAgICAg
I2lmIChfX1RCQl9HQ0NfVkVSU0lPTiA+PSAxMTAxMDAgJiYgX19UQkJfR0NDX1ZFUlNJT04gPA0K
PiA+ICsrIDE0MDAwMCApICYmICFfX2NsYW5nX18gJiYgIV9fSU5URUxfQ09NUElMRVINCj4gPiAr
ICAgICAgICAgICAgIHZvbGF0aWxlDQo+ID4gKyAgICAgICAgICAgICAjZW5kaWYNCj4gPiArICAg
ICAgICAgICAgIHZhbHVlX25vZGVfcHRyIHZhbF9ub2RlID0NCj4gPiArc3RhdGljX2Nhc3Q8dmFs
dWVfbm9kZV9wdHI+KG5vZGUpOw0KPiA+ICtkaWZmIC0tZ2l0IGEvc3JjL3RiYi9jb25jdXJyZW50
X21vbml0b3IuaA0KPiA+ICtiL3NyYy90YmIvY29uY3VycmVudF9tb25pdG9yLmggaW5kZXggM2Qy
MGVmNWIuLjNlNWM0YmViIDEwMDY0NA0KPiA+ICstLS0gYS9zcmMvdGJiL2NvbmN1cnJlbnRfbW9u
aXRvci5oDQo+ID4gKysrKyBiL3NyYy90YmIvY29uY3VycmVudF9tb25pdG9yLmgNCj4gPiArQEAg
LTEsNSArMSw1IEBADQo+ID4gKyAvKg0KPiA+ICstICAgIENvcHlyaWdodCAoYykgMjAwNS0yMDIx
IEludGVsIENvcnBvcmF0aW9uDQo+ID4gKysgICAgQ29weXJpZ2h0IChjKSAyMDA1LTIwMjMgSW50
ZWwgQ29ycG9yYXRpb24NCj4gPiArDQo+ID4gKyAgICAgTGljZW5zZWQgdW5kZXIgdGhlIEFwYWNo
ZSBMaWNlbnNlLCBWZXJzaW9uIDIuMCAodGhlICJMaWNlbnNlIik7DQo+ID4gKyAgICAgeW91IG1h
eSBub3QgdXNlIHRoaXMgZmlsZSBleGNlcHQgaW4gY29tcGxpYW5jZSB3aXRoIHRoZSBMaWNlbnNl
Lg0KPiA+ICtAQCAtMjkwLDcgKzI5MCwxNyBAQCBwdWJsaWM6DQo+ID4gKyAgICAgICAgICAgICBu
ID0gbXlfd2FpdHNldC5mcm9udCgpOw0KPiA+ICsgICAgICAgICAgICAgaWYgKG4gIT0gZW5kKSB7
DQo+ID4gKyAgICAgICAgICAgICAgICAgbXlfd2FpdHNldC5yZW1vdmUoKm4pOw0KPiA+ICsrDQo+
ID4gKysvLyBHQ0MgMTIueC0xMy54IGlzc3VlcyBhIHdhcm5pbmcgaGVyZSB0aGF0DQo+ID4gKyt0
b193YWl0X25vZGUobiktPm15X2lzX2luX2xpc3QgbWlnaHQgaGF2ZSBzaXplIDAsIHNpbmNlIG4g
aXMgLy8gYQ0KPiA+ICsrYmFzZV9ub2RlIHBvaW50ZXIuIChUaGlzIGNhbm5vdCBoYXBwZW4sIGJl
Y2F1c2Ugb25seSB3YWl0X25vZGUNCj4gPiArK3BvaW50ZXJzIGFyZSBhZGRlZCB0byBteV93YWl0
c2V0LikgI2lmIChfX1RCQl9HQ0NfVkVSU0lPTiA+PSAxMjAxMDANCj4gPiArKyYmIF9fVEJCX0dD
Q19WRVJTSU9OIDwgMTQwMDAwICkgJiYgIV9fY2xhbmdfXyAmJg0KPiAhX19JTlRFTF9DT01QSUxF
UiAjcHJhZ21hIEdDQyBkaWFnbm9zdGljIHB1c2ggI3ByYWdtYSBHQ0MgZGlhZ25vc3RpYw0KPiBp
Z25vcmVkICItV3N0cmluZ29wLW92ZXJmbG93Ig0KPiA+ICsrI2VuZGlmDQo+ID4gKyAgICAgICAg
ICAgICAgICAgdG9fd2FpdF9ub2RlKG4pLT5teV9pc19pbl9saXN0LnN0b3JlKGZhbHNlLA0KPiA+
ICsgc3RkOjptZW1vcnlfb3JkZXJfcmVsYXhlZCk7DQo+ID4gKysjaWYgKF9fVEJCX0dDQ19WRVJT
SU9OID49IDEyMDEwMCAmJiBfX1RCQl9HQ0NfVkVSU0lPTiA8IDE0MDAwMCApDQo+ICYmDQo+ID4g
KyshX19jbGFuZ19fICYmICFfX0lOVEVMX0NPTVBJTEVSICNwcmFnbWEgR0NDIGRpYWdub3N0aWMg
cG9wICNlbmRpZg0KPiA+ICsgICAgICAgICAgICAgfQ0KPiA+ICsgICAgICAgICB9DQo+ID4gKw0K
PiA+ICstLQ0KPiA+ICsyLjQzLjANCj4gPiArDQo+ID4gZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVj
aXBlcy1zdXBwb3J0L3RiYi90YmJfMjAyMS4xMS4wLmJiDQo+ID4gYi9tZXRhLW9lL3JlY2lwZXMt
c3VwcG9ydC90YmIvdGJiXzIwMjEuMTEuMC5iYg0KPiA+IGluZGV4IGY4MzQ3MjZiZDYuLjMxOGNk
ODc2NDMgMTAwNjQ0DQo+ID4gLS0tIGEvbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvdGJiL3RiYl8y
MDIxLjExLjAuYmINCj4gPiArKysgYi9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC90YmIvdGJiXzIw
MjEuMTEuMC5iYg0KPiA+IEBAIC0xNiw2ICsxNiw3IEBAIEJSQU5DSCA9ICJvbmV0YmJfMjAyMSIN
Cj4gPiAgU1JDUkVWID0gIjhiODI5YWNjNjU1NjkwMTllZGI4OTZjNTE1MGQ0MjdmMjg4ZThhYmEi
DQo+ID4gIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9vbmVhcGktDQo+IHNyYy9vbmVUQkIu
Z2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD0ke0JSQU5DSH0gXA0KPiA+DQo+ID4gZmlsZTovLzAw
MDEtaHdsb2NfZGV0ZWN0aW9uLmNtYWtlLXJlbW92ZS1jcm9zcy1jb21waWF0aW9uLWNoZWNrLnBh
dGNoDQo+ID4gXA0KPiA+ICsNCj4gPiArIGZpbGU6Ly8wMDAxLUZpeC1zdXBwcmVzcy1uZXctR0ND
LTEyLTEzLXdhcm5pbmdzLTExOTIucGF0Y2ggXA0KPiA+ICAiDQo+ID4gIFMgPSAiJHtXT1JLRElS
fS9naXQiDQo+ID4NCj4gPiAtLQ0KPiA+IDIuNDMuMA0KPiA+DQo+ID4NCj4gPiAtPS09LT0tPS09
LT0tPS09LT0tPS09LQ0KPiA+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0
byB0aGlzIGdyb3VwLg0KPiA+IFZpZXcvUmVwbHkgT25saW5lICgjMTEyNDk1KToNCj4gPiBodHRw
czovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtZGV2ZWwvbWVzc2FnZS8x
MTI0OTUNCj4gPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zy9tdC8xMDg2NDQ5NzEvMTk5NzkxNA0KPiA+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtZGV2
ZWwrb3duZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+IFVuc3Vic2NyaWJlOiBodHRwczov
L2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtZGV2ZWwvdW5zdWINCj4gPiBb
cmFqLmtoZW1AZ21haWwuY29tXQ0KPiA+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+ID4NCg==


Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AE8CCCF9EA
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 04:10:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by mx.groups.io with SMTP id smtpd.web11.20382.1761797396426125044
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Oct 2025 21:09:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=k0aGr/w1;
 spf=pass (domain: intel.com, ip: 198.175.65.13, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761797397; x=1793333397;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=BSfmu8WfUNJgYmQ0aH7FBJY/JuzgU7sy+GYbFoPMblE=;
  b=k0aGr/w1e8YptqqJESeonBLuFifuv2exa/raRlDnlq1En+G+qxjHn/W/
   5dYCXgTlKsp2T3l/XurRiNe6aAARAf4qPEp5wfvXGWZHU2KEi/rSRxB5K
   GPmLqnVMwiLAMLsoMjJfpgnggc9fmymg0sTlAGm0+CCSjtP0utWWNuK7m
   +yRe5UEUbCOKzQ6PCF/pEupLQSX6291ZTJNAu0YzAtDA/x79LVaEdbFJz
   S/j34XILsgSYR8QbYekPzOSEZe5VGWX8mqF20lWwnKOqkgQXo7A2pRbqf
   /C8h/esOvPLCMEk8j1IgE0Y9p0e1h2O+4vxEpiB/c9M1RRVncfK9qPXlJ
   Q==;
X-CSE-ConnectionGUID: meNj17jhTFedjx59zv0cWQ==
X-CSE-MsgGUID: 6UI7fi3EQveZX19lI+CKsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="75050960"
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="75050960"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 21:06:40 -0700
X-CSE-ConnectionGUID: Ygww9lz8S1WB5YyrU7lX9Q==
X-CSE-MsgGUID: NPMch/9nQeKjMYSa3pWoUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="186586750"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 21:06:40 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 21:06:39 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 29 Oct 2025 21:06:39 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.54) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 21:06:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KW+dFw2A3jI7vS2pVOfqOurhSluyabwnzkqZUCnk8p41moVhLvWxhQpDCdxmBhHMeLiQm7FzL5kKCX7ffR14o6sSD1YCRDSTRBarDb4rxIbVQ8RlX5RxfLCQLizG9rZVvoWulqelT+z8HSt1JUzHPOjcP5A/G1ehgiOz83IXRBcZV6otebMYpQx+t2H8y6mWFHo1hr3xkAtoBoqYGEhGdXSZ7PhCkyBWP8edOEYzFpfZocBpJSEl71WGBWQ//+JNZ64Z6uR9HRfDN4awO0UDrpGvVaKWXbP4BZmt+ztXxlXDLxyMh1x5LxKttK/0PfoTd2olkaqztIVktaJ0LOCQ5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BSfmu8WfUNJgYmQ0aH7FBJY/JuzgU7sy+GYbFoPMblE=;
 b=BtyR3HuOpzPxhLp7iEYgvR3URZ+tp8bUdwPzJH4Rv2M0rMpgkWMnABnoIM6mIxYHF4C7wzkQ4bpcy8tMdl+ivnaWq6EfiXNcjP1fvRUSYQF3V0z711SF+IjKhZ18/56BYX/pq80wUSfFloDLyuzlwRlRTQbjAYF6lwICXZJwrMWwN5GwqRHPvwZB2cx70XWJnHiGCktZNuijLgCyjaL1CL/co0OA/uulVLQw0BOsNlbf5yiE65dMJWoBkzYGYIuKS2goT+9vVNME6Tk5wUAUWELDiFlug1DFVOw/Hkh3goB/pANHMSRCzvdZDK6zEFzWD9Sn6UDfL+iducoZzK30NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by PH0PR11MB4950.namprd11.prod.outlook.com (2603:10b6:510:33::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 04:06:32 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%2]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 04:06:26 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "skandigraun@gmail.com"
	<skandigraun@gmail.com>
Subject: Re: [oe] [meta-multimedia][scarthgap][PATCH] libavif: patch
 CVE-2025-48174
Thread-Topic: [oe] [meta-multimedia][scarthgap][PATCH] libavif: patch
 CVE-2025-48174
Thread-Index: AQHcOU/LNxqudCnd10qRyVtrhDzew7TaMn0A
Date: Thu, 30 Oct 2025 04:06:26 +0000
Message-ID: <d7f6521e81038097295be946bd82e0757051ac53.camel@intel.com>
References: <20251009190556.1552672-1-skandigraun@gmail.com>
In-Reply-To: <20251009190556.1552672-1-skandigraun@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|PH0PR11MB4950:EE_
x-ms-office365-filtering-correlation-id: 9dc4d9ca-36b6-4c99-1709-08de1769b23e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|4022899009|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?K0dnTUtWcERqdXZQZkFxVkdQeU5MZjdKcVlSOGY4WHczczNhWlVSQkN6bGpw?=
 =?utf-8?B?ZjYvSjI0T0E4bDl6NGRIaTFWKy9Hc0gzZzFOWDNHYjAyTFdZT2RrWDdyWjc5?=
 =?utf-8?B?ZHdHM3hZWlFieldhMzhTMytLclB1elF1aFA2VE42bTNOU2RsNUI1QXAzbDhp?=
 =?utf-8?B?aCs1TEMyQTV2aUN4U0lLdGJ6Z1AyTDdqRFJxVW1VSVV5bkJiK2ZKVzBzME1h?=
 =?utf-8?B?VEgyWk82TzN0eUN5N0xkaktUMmNXQ01salFTSjR3bUI5bldOd3NoMy9DNmdw?=
 =?utf-8?B?akk4L3MxdWk1N0Z4eW9wWW5KQ2RiM1pXanBTWmxWbGlyS2NLWnQzSElXcHRH?=
 =?utf-8?B?bldwUFM2RUVuSFpVaFJHeWlGTmNkWkVFYWxVQlIxMy9iMktvcGdOS1pua1Zr?=
 =?utf-8?B?VFNKWllLbHRYVDlzNWIxM3gzYVdsRjZNd1hQdVlzbXJIQ0dzd05LYi9wc1Fl?=
 =?utf-8?B?Q3R5NUpHemhGQVUyelYrZEhvWEh0ZFlLNmIzdXAwQmtUdDQzRFdSR0xSWjV5?=
 =?utf-8?B?ZEZaNk5JOHBrNngvQUIvTEI5WjVhYmNqSlZLN0xQK0lFVHQ5djVIODkvUDJ6?=
 =?utf-8?B?ZDc3RkIvMDBNZnBqTll3UHlpWTBnRlNnN2hnbTNYUkQrUnoxUEFjYldwTFJX?=
 =?utf-8?B?RnJCa1lWamduRVNUTDlGL2crcHFCRnZOOTNLV01KSW5CY3htRUF0NFpjNUxG?=
 =?utf-8?B?MG1DakFwTjBaRllNcWZiVWhTcVpyVWoxeThrcGtGMk9xektTcnhBMUJmdVVP?=
 =?utf-8?B?cFc4Q3g3R2p6cnZ1NC8vZXNhbHZ6UVgxaXI3MkNCQTA2ZS9GMlAvQ3pIVlN2?=
 =?utf-8?B?MmtpMUFQLzU1dmZIdXNqNnNTWkxvNEFoK2tUS1R5dGNmZ0N6MGtaOHNscHkz?=
 =?utf-8?B?M05KOFp1a0pEaUh3UytDRUlPcGorQTJNMTVoUnRLVkVCY0o4ZGVlVGJBRTFq?=
 =?utf-8?B?ZjdEZWxUdFlNbVhIL1c5MmsxM1lEQ01iWHRuZFUzeWxSaVBaNllGcnhUWEdT?=
 =?utf-8?B?N2VKcHhtSS9DMGJ6TEdpQmNyUkhrUTVibk8vb3lwZkJMdW1ielgrazRORnd1?=
 =?utf-8?B?Um5NSzUwWjExWUtkTXVGUmpvTE1yblg1b2d6VEorZTl3alptckk5UWdUdUhI?=
 =?utf-8?B?TCtHd01uRVFkY1BlM0dReWExU0pRdlZjREM4QU5kWjlVdk1JaVNHUDVzY1NW?=
 =?utf-8?B?a3JIbE5HTFc5U01scGxlQnZJN1llNzR6dGsrRDZ2WFRTWGNHN1NDRXZnU25u?=
 =?utf-8?B?UWozSHFtTkxDVENyUkVOTHJvZ1J2SkZxWFFOM1FUeFljVyt3aE50VmdOUlBj?=
 =?utf-8?B?M2tsT1hUZy9mcnZlV1UrK01iYm9hOWdvLy9sZU5POXdIOCt3Qll5ZHQ2QkVC?=
 =?utf-8?B?ZW1BcnBha29RNlZTN1BjZlczdTZGeXhyWEVVVkNOUFQ4eTAvL2o2T3EzQVpr?=
 =?utf-8?B?NnNDa0lPSmlZNUtBZHl0NmdNSkFtQTRDN0V1OXY4eDMrZ0szN0wzWGFhNGJy?=
 =?utf-8?B?SW50RkI3S0FPcklScU8vZ0ZyaGNpMVpxd2lOS09LQ3FjUWxEZks0ZWIxZ1pX?=
 =?utf-8?B?U2pOUEQyMVU0VlVpWEw1OEhnZFJTY3hSSkR1Rnh6c004M05sVk9GVzBrNUgx?=
 =?utf-8?B?SGc3STBnelF2RmpUN0hsbmFXTnVieU92QVFCTTFmcU5ObUg4Mk1RblExOTRP?=
 =?utf-8?B?MVFnaThWMVlyOEUvYVJUTFJmWDZXTnpsQTFDOUZGTERvMzZlL3F0REZvSXB5?=
 =?utf-8?B?UjQ3TzhMRXJrZjZIbWtETXBPNFltL3FXbHZUY2QwV2V5ZWY3WmFWbHZZdVA2?=
 =?utf-8?B?R0Q4YnFjM2lqdzJtb3JnVkxHQlJxeHJlK0l4SndqakNWT3ZQc3Z3RU05akZY?=
 =?utf-8?B?SVd4QmtUUWdBd1dwYlFFajM4VVBUZzgrTFNmTnFjcVo5Z2tkWmV3ZkVmc3FD?=
 =?utf-8?B?a0pGREdxQUN0MzAvRThDSFF5bzZVNzlCOGR4M1FIem9CWW5DQ2J4UldtYm55?=
 =?utf-8?B?dzJmU1A3VUJnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(4022899009)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MDNsUDk1bjFzaG4rVkxjSW05YWcwK1dRNzRWV29qOVFEOHVJSkQ4NWZBYWMy?=
 =?utf-8?B?bnRFdjc0Q2E0QVVHQ2c2dHFzLy9vNmdwVUQ1bmlXY0JuV2dLTEJXZ3g5bWU5?=
 =?utf-8?B?SHQraHE1Q0dUTFpub0Y4b1Q2R1h4ZG1TaWVURTg3NGo1TUJsMnNKa0xQTCth?=
 =?utf-8?B?MDBoYU82alU0a3hwNlhPTGZwSWNZUUhVQ1hYZWlobm5SNE1yMHFRbFVRd2tL?=
 =?utf-8?B?SEw1TWtZRG1OY0JEcEFCUzZreE9xMzZIRXBqUEc1Qlh5WUd4M21UVnVuSFlD?=
 =?utf-8?B?NGh3bmYwQTJNbmpBeFVTNkxia0ZWcnFFbE9UODRhbm0yNHJ0a0hhMlhWMVlO?=
 =?utf-8?B?TnJGbUFpWVhxQWNmWjZteUpJcFQwTTFaREpyTGRsQVNzS3QxLzBKYU1scnpE?=
 =?utf-8?B?N0RJOGJUVUhhOGdWSUpnaUN5MHFsdVltclFaSGNhT1orUzk1RGhLM1Z3VDU1?=
 =?utf-8?B?WG5iWlQvQTBFZkxRVUp4d0ZkejVIU0V0MXlSY1dVTUNIdjIraklaTGdFVGhW?=
 =?utf-8?B?NnJJQkJFT1VvU2JZOGpYWDBUMUtWMmhxdkY0Nno2VkpLNGt6MVNMeHp2ZFlo?=
 =?utf-8?B?QzgzNWpmeWZiY1I1bnNKREcrYVlnbVprbXZpa0hHWVFySFVDU3hpbTBQdlF5?=
 =?utf-8?B?ZDFoOVpiRGVVL2xpWCtBckxNU09VVURBQlA2ak81dThJWG9TS1hzdkRleEM1?=
 =?utf-8?B?QUdod2hOOEZrVGNZR2p6cEE5bnMzem5GV2VMUXE4ckhKMFdHZTZmTktiL1BX?=
 =?utf-8?B?T2p2R1I2N3VPZWUwY0E5UU9YM3FlbS84MXlBaHRmUVE0RkF5cDJiYVppVlZ0?=
 =?utf-8?B?Vy8zS2lscFh0Ym0vRkVCd2JiYUhyb2VmZkRQWmNPZ3JodHl6Qk5NWHBOMUU5?=
 =?utf-8?B?MDdvV3FmeGRpVUQ3czdHWC94U0x2TWNPSVV0RGxhUWdTYXhTMTVwMXc3UFAz?=
 =?utf-8?B?N3JSbXNLS2FkcVVJSXBZWk9FRlVKY2FKK2pINUJiVTJXeHFWaDIxdFNTZ29n?=
 =?utf-8?B?bWNQdFdhMHpObHpDU0JDSTFYVnJidG1QYU82V1ZKcmEvL0pVdWwzSEkrNmtS?=
 =?utf-8?B?WllURi8zTHZaUDJEUWtaRlJkY1Zib0YzeTNSUmZ1K3pZZXRmWXNpeHcxTURV?=
 =?utf-8?B?WjRPc0RPUGI2bC9ZbHF5Ynh3T2k2c0V2OFpJbjhWTHB2UHBkU1lROU55VzBW?=
 =?utf-8?B?QUt2UnZWUlJIbVhObkl6TjlCQWNBRHdLS3N2R2pQQTNkTDlWNHZ6TFU0Rng3?=
 =?utf-8?B?UnFoR29mbms0QURkNDQ2d2VjNEkzRE5NWVZ1cmtUQTVQbkZSeTdXNjVvVFFp?=
 =?utf-8?B?NWV2NnVZbkQ5QnRYSm9GVTk3YStVb0NxTlBRbGJyN3dYRHBhMEtFZ1NXbkty?=
 =?utf-8?B?QmV2Q2xNdE9DcG4vZDFUaE9VUHZ3empvdlZSMnM3VlU2K1NNOTV4TGk0eU5Y?=
 =?utf-8?B?d2NQWm1jcWNNeWhSNFdJOFN0QXJ0ZjA2Si8wUnFjc2xCc2ZVOVhyWXY2ZWRB?=
 =?utf-8?B?V3NJNlp5YU1nd2luQmZIWkxQRy9sOStPMmpEcXhTTzNOSTBld0xQdEZmSy9T?=
 =?utf-8?B?S1hUdENXODVNNjNKOUlXNHBZcUlpOHl1UDlZcjNvU3BMUlVGQVVkVVExQzZW?=
 =?utf-8?B?Y0FzRld4TWRsUW9iN1VTOU5zdm5lYVFzSDBJY0JqQng5THVRa0h5L1htWTdw?=
 =?utf-8?B?d2hWa1R3eTN2RmozL1V3dk4zODZsMDljQlBlR0tKOXRQOGFqZG85S0d1Qzk0?=
 =?utf-8?B?anV3WFBQLzhsdkNQYkp2eU1zV29Rczg2UlR1WmRZZUhyWHFqRTRaZzJVcEVi?=
 =?utf-8?B?ZFlZVHQzbXVOdkMyY3ZyK3A0anVHRUNUS1dwN0NIdGV0RnVYQlhGazZxNFlu?=
 =?utf-8?B?dUx2L2t4eXcwOXhvdHVyTjFXamh5SHNjOURqdGYyNmd4NDNvUmNXQnc4SXVJ?=
 =?utf-8?B?RHBmZjF3Q3YxU1FYUjZQZVZtWGhWYkk1QVpzVlp6cTV0MU9oNnUwQnVBdDRD?=
 =?utf-8?B?WmpaTzA2LzFWWS84USszeit1UWFZajIwZ3dORUk5L0IyVno3TkNGMkZQVCtR?=
 =?utf-8?B?dVBwaDZxNVc2QzExZzBaY2JxVlp2bmI1eE9FT1BwVENBTjJ0MWVORDliczBv?=
 =?utf-8?B?ZXRuNGc2QWwwQmJUTjlFNVpSR3ZxOW5nT0ZHNG0vWSsveTV0SUk5ekdiUkRT?=
 =?utf-8?B?N3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <63CA7E461B12FA4F94AA4881B3A74F2B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dc4d9ca-36b6-4c99-1709-08de1769b23e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2025 04:06:26.2365
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1bSiK6usI7VHcBRdIyKMqEz5p+X5LzofWtO1djCOtwMd20XgjVD1HNpBIoad+H1SpehHgqUi+zWRzbvGKRLqag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4950
X-OriginatorOrg: intel.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Oct 2025 04:10:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121182

T24gVGh1LCAyMDI1LTEwLTA5IGF0IDIxOjA1ICswMjAwLCBHeW9yZ3kgU2FydmFyaSB2aWENCmxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcgd3JvdGU6DQo+IERldGFpbHM6IGh0dHBzOi8vbnZkLm5pc3Qu
Z292L3Z1bG4vZGV0YWlsL0NWRS0yMDI1LTQ4MTc0DQo+IA0KPiBCYWNrcG9ydCB0aGUgcHVsbCBy
ZXF1ZXN0IG1lbnRpb25lZCBpbiB0aGUgZGV0YWlscyBvZiB0aGUgQ1ZFLg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogR3lvcmd5IFNhcnZhcmkgPHNrYW5kaWdyYXVuQGdtYWlsLmNvbT4NCj4gLS0tDQo+
IMKgLi4uZC1pbnRlZ2VyLW92ZXJmbG93LWNoZWNrLXRvLW1ha2VSb29tLnBhdGNoIHwgMjcNCj4g
KysrKysrKysrKysrKysrKysrKw0KPiDCoC4uLi9saWJhdmlmL2xpYmF2aWZfMS4wLjEuYmLCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA0ICsrLQ0KPiDCoDIgZmlsZXMgY2hh
bmdlZCwgMzAgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiDCoGNyZWF0ZSBtb2RlIDEw
MDY0NCBtZXRhLW11bHRpbWVkaWEvcmVjaXBlcy0NCj4gbXVsdGltZWRpYS9saWJhdmlmL2xpYmF2
aWYvMDAwMS1BZGQtaW50ZWdlci1vdmVyZmxvdy1jaGVjay10by0NCj4gbWFrZVJvb20ucGF0Y2gN
Cj4gDQo+IGRpZmYgLS1naXQgYS9tZXRhLW11bHRpbWVkaWEvcmVjaXBlcy1tdWx0aW1lZGlhL2xp
YmF2aWYvbGliYXZpZi8wMDAxLQ0KPiBBZGQtaW50ZWdlci1vdmVyZmxvdy1jaGVjay10by1tYWtl
Um9vbS5wYXRjaCBiL21ldGEtDQo+IG11bHRpbWVkaWEvcmVjaXBlcy1tdWx0aW1lZGlhL2xpYmF2
aWYvbGliYXZpZi8wMDAxLUFkZC1pbnRlZ2VyLQ0KPiBvdmVyZmxvdy1jaGVjay10by1tYWtlUm9v
bS5wYXRjaA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwLi43ZDE2
Y2VmYTQ5DQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvbWV0YS1tdWx0aW1lZGlhL3JlY2lwZXMt
bXVsdGltZWRpYS9saWJhdmlmL2xpYmF2aWYvMDAwMS1BZGQtDQo+IGludGVnZXItb3ZlcmZsb3ct
Y2hlY2stdG8tbWFrZVJvb20ucGF0Y2gNCj4gQEAgLTAsMCArMSwyNyBAQA0KPiArRnJvbSAyNDAy
NTZiMDVmOWZmNGM2ZDBhZmJjZDZkNGM5MDU5MDM3MjI3ZTU2IE1vbiBTZXAgMTcgMDA6MDA6MDAN
Cj4gMjAwMQ0KPiArRnJvbTogR3lvcmd5IFNhcnZhcmkgPHNrYW5kaWdyYXVuQGdtYWlsLmNvbT4N
Cj4gK0RhdGU6IFRodSwgOSBPY3QgMjAyNSAyMDo1MDo1NyArMDIwMA0KPiArU3ViamVjdDogW1BB
VENIXSBBZGQgaW50ZWdlciBvdmVyZmxvdyBjaGVjayB0byBtYWtlUm9vbS4NCj4gKw0KPiArQ1ZF
OiBDVkUtMjAyNS00ODE3NA0KPiArVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydA0KPiBbaHR0cHM6
Ly9naXRodWIuY29tL0FPTWVkaWFDb2RlYy9saWJhdmlmL3B1bGwvMjc2OF0NCg0KVGhlIFBSIGFs
c28gc2VlbXMgdG8gYmUgcmVmZXJlbmNpbmcgMyBvdGhlciBjb21taXRzIHRoYXQgd2VyZSBhZGRl
ZA0KbGF0ZXIgb24gYW5kIGl0IHNlZW1zIERlYmlhbiBhbHNvIHVzZXMgdGhlbToNCg0KaHR0cHM6
Ly9zYWxzYS5kZWJpYW4ub3JnL211bHRpbWVkaWEtdGVhbS9saWJhdmlmLy0vYmxvYi9kZWJpYW4v
c2lkL2RlYmlhbi9wYXRjaGVzL0FkZC1hbm90aGVyLWludGVnZXItb3ZlcmZsb3ctY2hlY2stdG8t
bWFrZVJvb20ucGF0Y2g/cmVmX3R5cGU9aGVhZHMNCg0KU2hvdWxkIHdlIGluY2x1ZGUgdGhpcyBh
cyB3ZWxsPw0KDQo+ICsNCj4gK1NpZ25lZC1vZmYtYnk6IEd5b3JneSBTYXJ2YXJpIDxza2FuZGln
cmF1bkBnbWFpbC5jb20+DQo+ICstLS0NCj4gKyBzcmMvc3RyZWFtLmMgfCAzICsrKw0KPiArIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykNCj4gKw0KPiArZGlmZiAtLWdpdCBhL3NyYy9z
dHJlYW0uYyBiL3NyYy9zdHJlYW0uYw0KPiAraW5kZXggYzg1Y2EzMWIuLmIzOGM5M2M2IDEwMDY0
NA0KPiArLS0tIGEvc3JjL3N0cmVhbS5jDQo+ICsrKysgYi9zcmMvc3RyZWFtLmMNCj4gK0BAIC0z
MTksNiArMzE5LDkgQEAgYXZpZkJvb2wNCj4gYXZpZlJPU3RyZWFtUmVhZEFuZEVuZm9yY2VWZXJz
aW9uKGF2aWZST1N0cmVhbSAqIHN0cmVhbSwgdWludDhfdA0KPiBlbmZvcmMNCj4gKyAjZGVmaW5l
IEFWSUZfU1RSRUFNX0JVRkZFUl9JTkNSRU1FTlQgKDEwMjQgKiAxMDI0KQ0KPiArIHN0YXRpYyBh
dmlmUmVzdWx0IG1ha2VSb29tKGF2aWZSV1N0cmVhbSAqIHN0cmVhbSwgc2l6ZV90IHNpemUpDQo+
ICsgew0KPiArK8KgwqDCoCBpZiAoc2l6ZSA+IFNJWkVfTUFYIC0gc3RyZWFtLT5vZmZzZXQpIHsN
Cj4gKyvCoMKgwqDCoMKgwqDCoCByZXR1cm4gQVZJRl9SRVNVTFRfT1VUX09GX01FTU9SWTsNCj4g
KyvCoMKgwqAgfQ0KPiArwqDCoMKgwqAgc2l6ZV90IG5lZWRlZFNpemUgPSBzdHJlYW0tPm9mZnNl
dCArIHNpemU7DQo+ICvCoMKgwqDCoCBzaXplX3QgbmV3U2l6ZSA9IHN0cmVhbS0+cmF3LT5zaXpl
Ow0KPiArwqDCoMKgwqAgd2hpbGUgKG5ld1NpemUgPCBuZWVkZWRTaXplKSB7DQo+IGRpZmYgLS1n
aXQgYS9tZXRhLW11bHRpbWVkaWEvcmVjaXBlcy0NCj4gbXVsdGltZWRpYS9saWJhdmlmL2xpYmF2
aWZfMS4wLjEuYmIgYi9tZXRhLW11bHRpbWVkaWEvcmVjaXBlcy0NCj4gbXVsdGltZWRpYS9saWJh
dmlmL2xpYmF2aWZfMS4wLjEuYmINCj4gaW5kZXggODg1NzU4YjZhNC4uZmExYzE2NmVlZiAxMDA2
NDQNCj4gLS0tIGEvbWV0YS1tdWx0aW1lZGlhL3JlY2lwZXMtbXVsdGltZWRpYS9saWJhdmlmL2xp
YmF2aWZfMS4wLjEuYmINCj4gKysrIGIvbWV0YS1tdWx0aW1lZGlhL3JlY2lwZXMtbXVsdGltZWRp
YS9saWJhdmlmL2xpYmF2aWZfMS4wLjEuYmINCj4gQEAgLTQsNyArNCw5IEBAIFNFQ1RJT04gPSAi
bGlicyINCj4gwqBMSUNFTlNFID0gIkJTRC0yLUNsYXVzZSINCj4gwqBMSUNfRklMRVNfQ0hLU1VN
ID0NCj4gImZpbGU6Ly9MSUNFTlNFO21kNT1jNTI4Yjc1YjA3NDI1YjVjMWQyZTM0ZGU5OGMzOTdi
NSINCj4gwqANCj4gLVNSQ19VUkkgPQ0KPiAiZ2l0Oi8vZ2l0aHViLmNvbS9BT01lZGlhQ29kZWMv
bGliYXZpZi5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPXYxLjANCj4gLngiDQo+ICtTUkNfVVJJ
ID0NCj4gImdpdDovL2dpdGh1Yi5jb20vQU9NZWRpYUNvZGVjL2xpYmF2aWYuZ2l0O3Byb3RvY29s
PWh0dHBzO2JyYW5jaD12MS4wDQo+IC54IFwNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgDQo+IGZp
bGU6Ly8wMDAxLUFkZC1pbnRlZ2VyLW92ZXJmbG93LWNoZWNrLXRvLW1ha2VSb29tLnBhdGNowqBc
DQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoCAiDQo+IMKgDQo+IMKgUyA9ICIke1dPUktESVJ9L2dp
dCINCj4gwqBTUkNSRVYgPSAiZDFjMjZmYWNhZjVhOGE5NzkxOWNlZWUwNjgxNGQwNWQxMGUyNTYy
MiINCj4gDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IExpbmtzOiBZb3UgcmVjZWl2ZSBh
bGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLg0KPiBWaWV3L1JlcGx5IE9ubGluZSAoIzEy
MDQ0OSk6DQo+IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1k
ZXZlbC9tZXNzYWdlLzEyMDQ0OQ0KPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZy9tdC8xMTU2NzcyMDMvMzYxNjcwMg0KPiBHcm91cCBPd25lcjogb3BlbmVt
YmVkZGVkLWRldmVsK293bmVyQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gVW5zdWJzY3JpYmU6
DQo+IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1kZXZlbC91
bnN1YsKgWw0KPiBhbnVqLm1pdHRhbEBpbnRlbC5jb21dDQo+IC09LT0tPS09LT0tPS09LT0tPS09
LT0tDQo=


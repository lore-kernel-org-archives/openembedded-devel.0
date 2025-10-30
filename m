Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B78FCCF9F6
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 06:32:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by mx.groups.io with SMTP id smtpd.web10.21027.1761805937020678379
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Oct 2025 23:32:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=glARum9P;
 spf=pass (domain: intel.com, ip: 198.175.65.16, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761805937; x=1793341937;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=IBydhxa8Tj0RGVmviBlnBaHvOIuJ/kredCbjoePstF0=;
  b=glARum9Pav7YUbEn5FpzAKaxXILz6H0aHnQoa1uD1xIEdjEIU0o/bZQQ
   oxom9Rs1VauEFhI5w/a4UF5A1xiqnFadWt6+cpJJvg9hHF7E9lD/uC2hk
   Q8uQvencgdWY8Vcyjmn8ukt/hMhf9R+dYNWn0STk1nvCX2feV6uwIyg7+
   hprX/Hoz3D/GhdBbIcyoH68KHHNWVI4KHPjzrBVWkyxhuo8u6eSMU8TWF
   QDAIMxH7iOPkDZAI3EhFL2lQMV7Uo7sGudvBeOnKjKfdZ6Y4fkjuoxPTc
   8i6ePKFnGXLPzrnRbO76M0ccO2x+1g0QYhPSmt8jA0/AJOykmIcsoBEfo
   g==;
X-CSE-ConnectionGUID: cmHZ39v7SrO7GkIWtz8Nkw==
X-CSE-MsgGUID: oWcRrGNeTHGAVVq4ngexCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="64087843"
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="64087843"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 23:32:16 -0700
X-CSE-ConnectionGUID: bYcmO/62Q0OX4zLvqYgvhQ==
X-CSE-MsgGUID: zGIsvKviS6utyibqJ3kfHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="190234080"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 23:32:16 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 23:32:16 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 29 Oct 2025 23:32:16 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.0) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 23:32:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eG2GIEOVerQJrAXOXhf4wrJASsx9mKXyiKrDLnQPS2+ntgz8ePxa1Bk5cy43t2BzXjFRoZcSmk5Isl4KuIqT9qy7gaaGu1KW8BjERtWXFLze0fsXZWYeqr547EkA4IA7aZKstITtZsJGVeJ3gFXFzNiWcuWvkQOJ0BGoijko5ruXlWyyYTqSJYdsMYh+ssQEBHtKVj/Y01xlG+S75tPepJUUZ4RbTFw/jZc73L9pewKglMbX4HOdSqu/fCeR6PPW+p7qk/H5qcxVTh+n+5idHHLeiZ4dCW9TlWBPJ2ATl9dxqNyKakTdpk9hrlKrVbzPlLUk/NUiCAv5aGp1l2orxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IBydhxa8Tj0RGVmviBlnBaHvOIuJ/kredCbjoePstF0=;
 b=St/reGZqpq4Ufclgk6T+PfK6j7/1eU6kOupfOeXmesa5eoGc/Rhiq7oFTBHvVc+DK0U5NBa0/ABHW27yYmbzUqwTbggYZjElirN3b/3FrXV2BRJMr+vaCWyk21V2fjNNPDh4ZSsjTsBAHWkCuyRcA5rJk2rj9FxM5LOI/2hMuZ0kmx1zVN/CGkW/LRWy6Q2xulYRJW6oVRrXw6mR6MVI23BoBhucleO7bW2336cfPirHaShRwJhZUaw4bzfEWRx8A1WSdC6hGSoBBDx6TPCMvqgBZbPQnjkSM3tjHPjlzATYc2878if3MYArLeVcA95qOhg8C/FxQWus1bnd+iEDug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by BN9PR11MB5289.namprd11.prod.outlook.com (2603:10b6:408:136::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Thu, 30 Oct
 2025 06:32:14 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%2]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 06:32:08 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "vanusuri@mvista.com" <vanusuri@mvista.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe][meta-oe][scarthgap][PATCH] libssh: Fix CVE-2025-8277
Thread-Topic: [oe][meta-oe][scarthgap][PATCH] libssh: Fix CVE-2025-8277
Thread-Index: AQHcOSBOQenMjZ/Id0yVba5dChJBNLTaL7WAgAAp/oCAAAHeAA==
Date: Thu, 30 Oct 2025 06:32:08 +0000
Message-ID: <23fae9ba42d32a600456b5593be9f7262161648f.camel@intel.com>
References: <20251009132543.1680755-1-vanusuri@mvista.com>
		 <d62b15e94667438900736a89a8220db30705a040.camel@intel.com>
	 <CANQUz193KeDJuX8_WO9roc0T1-tOov2c2fdoMv+SAat+tX1-uA@mail.gmail.com>
In-Reply-To: <CANQUz193KeDJuX8_WO9roc0T1-tOov2c2fdoMv+SAat+tX1-uA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|BN9PR11MB5289:EE_
x-ms-office365-filtering-correlation-id: 658acd88-0cb1-4f21-b78c-08de177e0cd2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?aEZ6UjNSU09xZkdMUDdyc3FKR2d5NmFzK2xNV0RlZzZJeFpSbmhJamh0bXkz?=
 =?utf-8?B?ZmcyaDl0bVBMVTJDQU9MQVk3VGZsTHFqZUhMVXc3aXI5NnJoSmR6TzZhSStN?=
 =?utf-8?B?NkwwS0g5TTVCNldnNEpweTRsQ21QVkVJckNjdmFyUHJyMzhpcXRkZ3FURWZ2?=
 =?utf-8?B?OEZSYUllaHhFbWZFbGxLcllFL2RENzV5VDlEODZtMDA1eVF1a3NKNnhXUTMy?=
 =?utf-8?B?cGpCbGVpV1I3NE03LzRkeVJwSjNNaXAvN0NLcEF4c1l0eGJReDFkMGpCbHBE?=
 =?utf-8?B?K0tyNzhpSythKzBUaW1xQ3o4a25GSnV3ZjFRSzZuZjUrNDNOOVc2Y3d3Tysz?=
 =?utf-8?B?aHQrK1M0QnZ6b1FHRlFkNm4vUEszMm1hMXZWa3BEMkltYkVnZ0NPbStTb0Z0?=
 =?utf-8?B?OGw3ajkzbXhkU1VVcDJnaERROWtTTmlXWFZCZDFXTjd1dHh2QmJuYnBzQXN4?=
 =?utf-8?B?WHlVSkpjUTl5VlNPR3FYeGVQTjlrVmN3MWNuY25MWTJub3FGVWYxTWZvQXla?=
 =?utf-8?B?bHRVK2NjTWJxQnVlSzEzbVBQZ1RiTnphNGxoYU55TS9qNUdFemNuNUJ4RnNm?=
 =?utf-8?B?aTRxc2JoQXJERWY3WmMzNVBPaG1MTGkwdzlOTEF5dVJ5aURmQ1QrZXM3bi9O?=
 =?utf-8?B?dFk4RGtkcDNRcG1wZEp0c21aV1JxRE9hcW10Zm1wU1g1Z2ZUUy9nNlpYU096?=
 =?utf-8?B?Y0cvTXp1THZicjd0eHZnUVM0dDZ1bjZDd0Y4aVdzbzA5ZEJRaEd6bTNLZVF4?=
 =?utf-8?B?Slhod0Rtem4xemQyNmVFS0FxaisvTHJ2YWtqNk0zTnFTbVhVTTIvY1RONXVB?=
 =?utf-8?B?dEFEVGJnRmJIcW1vdUtrbUxsRW1GSi9SVldYaGx6bmdxOThFTEVGcjVLTVFF?=
 =?utf-8?B?L3piUEp2QkpDN3Z2RHhBM0h4RHZVUGozQklNODhjUTkyc0hqNk45dDlKb2x3?=
 =?utf-8?B?ZmdUWXMrVjlQeTRpazBqSVR2dEdYNTMyM3lBdEpuZWltRk1tNmpKcXRrSmxi?=
 =?utf-8?B?ZUxjZUxqMkd2YVpGZVhDcm5zZlBjZU1GZ2NSWUduWGsvSWo5MWJUdk5YejJm?=
 =?utf-8?B?eWgrQXZ2cUJrbTdSQnBKSWlVcFhuQXJDR00yK2NqenBTQ2NIU01MWWIxdlcx?=
 =?utf-8?B?RlpVYmR5TGR3NVkwSjBsMVZTQ1lUZ29xYk1kNkROQkZNK1FuNzVWc1JyN0R5?=
 =?utf-8?B?T21zTmxoMW5uL3d0bVpyYXZqSUlnRXdJdDkyUnJNaUYzWndRbmhLUkM2TGtH?=
 =?utf-8?B?cG92U3RhOUdIUjVXSy8wWFNEVExSdEdnN1J1YUIwS2JHcGRseDUyOS8yczNr?=
 =?utf-8?B?N0xrcFAzT1pXN3BXWWF5aFBQZDJuaWM1RlVjRGUwYkYwQkZ5ZXl6cXFwcEsr?=
 =?utf-8?B?ZFVHRzlQLzNGRnBCZENXNUhORkNnb3YyMVZNMEYwOTNZZVZZQ1pwd0E2MWZz?=
 =?utf-8?B?V0RVOERTZUE1VzlRN2NnMlA5UHNJa0hwVDFUeG5YQngwakxxRGxMMUVaUXdG?=
 =?utf-8?B?bnZ1Z0FTNUhwdldkQ3AvdFdmVytIZ3pCOVRWYnZHWTdoTEtYQzFidlphRXIz?=
 =?utf-8?B?WVU3MFQrSVFLLzcyYWU3NVFZdmRCTkJlZkxKU2VtMG9WN20yNkFrYVFXN0lD?=
 =?utf-8?B?RytQSDZNcHBIb3gvMFhqV1Npa1JiL041RjJwNDBlYmpLbmc4aVNvamdaM2Nh?=
 =?utf-8?B?U2ZvQUpOM0UrSFpiOUd2RWMrOWFXRDFNWUh5OGRnQWx4aDAyK2s5V3ZYYlll?=
 =?utf-8?B?Ymcwd0ZVYVV3TWJnTGVVUDdlb1BVTTRhNC91cmgwRDN3QkFhOU1SQUVHWFNQ?=
 =?utf-8?B?OWhubFU1Z09zWjNIV3grSGNYVlZDVU5SZElRUmZvVTVRa1l5LzRJdTBUQzdz?=
 =?utf-8?B?bTJOcnM0VzBkdUlVM3Zhak5qcU52cE1WT20yWXRXNUpNQWthbjR5YTNTNTUw?=
 =?utf-8?B?bW5DTmFWT3NoeURiWFJLdmJ5d3Qxc3p0bUtTa3pQVEphbFMySmpiZzcxSXVG?=
 =?utf-8?B?WE8wUTVCNWZBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZnFCamtXN0ZkREZrNFR1WWxkTUdKSUdOMHVDWjUyMXJjMU9rTUhMc1lGTXFW?=
 =?utf-8?B?SlcxSWhod0VEUlNGMVZValkxa3NqYktibDRvRktYWk1iK1M3bkFqVU0ySHI0?=
 =?utf-8?B?TWtGNHB4T3ZEb0twLzNJcy9TMDNWOW1Rd3cyL25xS1JKOWNZdlMrSlMvNXFI?=
 =?utf-8?B?V3RaZnErU05JRjlDZVlOUURvbkc3TDNPalJkb3FvaVhqTWIwVy8ycno3cjJv?=
 =?utf-8?B?RkNiTU1mWmZjVDFsYXlOeGY4ditDdUEwdnYvVEJ5UjRZRWwvV3RpUjBWSUxM?=
 =?utf-8?B?Y3hmMHFieG9HSjBscjVtVzNiVkoyWjNQeGF2Q0FQcXJhRC80T2RtVVpnNFgw?=
 =?utf-8?B?KzZGbjJBNVhUK21Ock5LYzNNaWgvZEVuMXlzMlE4aG1vcDdvek9jU2R6dE5r?=
 =?utf-8?B?YVpBdFpKZzd2a1hBT204QjZCZEg0NU1GOWdPM0F5bDdMeHVCejQ1SnAzYkZE?=
 =?utf-8?B?bFNnMCtwRU5rNnI4b1FjRkovdVVNVzIxWkxDOEI2dTFyZGlJSkhGOFExdUdt?=
 =?utf-8?B?eWZmcWtwV0NzWVB6d3JPbzhNQ005VVZuODhJSGdBNG0xSk54SkJ0bUp3dTlK?=
 =?utf-8?B?L0xnOGxPeDBOZnYreUM2QnZmR0VpYjFPRFhlSXdzZ0lnbGFjQkp4M0pyNE8z?=
 =?utf-8?B?eDZvV1RNOVBtQ0ZuUEtPTzJzZlYzWTJ6TXYxZGxxZnJXQXZTZlBqTWZQRklF?=
 =?utf-8?B?bWxiYjIvR2F0U2VDaC96YTZKcUZtL1hiMlJ6UUdma1kxbzliL1hiWWI2RjZQ?=
 =?utf-8?B?YWZHdi8rRDFVblV1OVNaRktvM2JIMGxweDRBeXBNUjU0OTF5UC9NSWovZHNi?=
 =?utf-8?B?T2Y1YTNMRk1aK2g1TVdiSlYzRnhZL3BZMHlxdkM4bGh0bWFEbmpXQ1ZSQnVH?=
 =?utf-8?B?TCtNR09MWHNkbmhNTDBtcnMraVFWUjRleGV5QWxSNFRZR1lRSEZTTkRYc0ZB?=
 =?utf-8?B?RmhNNURVK2FTMWEveVd4VmNjS2JXbUI3c0svaERTQXB6Vm4wbzYzaVVKTnl2?=
 =?utf-8?B?Y3kzQ3c2SGpLa1ovZnc0dVJ1TjV4cHpUdmFaZHVFM1l1NVZ4bldsbXZvSnB6?=
 =?utf-8?B?dXZwUU9GYUVsMkR3cnlMNkZ4dWhUZ2tEalo3QmtURTRGR1Fsd2dvK09PQm9z?=
 =?utf-8?B?Zzd2QzJUbTBGMDlBbXZ4ODhJSm43OSt2ZVNGRXdrZjFlSmNwZXB0emFYZnZO?=
 =?utf-8?B?YUM2N3VRb2RTYXVWWjBrYS9NaGtxUXpoVFNTb3VVTmZvcGhETUNia0J1b3pa?=
 =?utf-8?B?d0xhd3lKM0hWRHVqZDBKZmtoZ0lsV3hnc2xQUlV5UHd5ejZiRTlDYkFncnZs?=
 =?utf-8?B?OEpJZ1RQcTl3bmZmUUZnTzJaYkgvUEhtRlA4ZWJzb3pKTjM5RW5NY01pdG9E?=
 =?utf-8?B?a1N3elVYbGhmTWRYV083YndXMnQzeHBMc3pwREtUYm1ldWZObUphL1N1ZVRQ?=
 =?utf-8?B?aWwxSStqSG1rUGt5UGd0VmdHWVpWeUJIb1M3TnNwNmJKdi9LTDNSTGMzQjht?=
 =?utf-8?B?Q2tyYmtWZVFHRmRMQUtBNndJYnFURDVmRHVodWxVTDBzZjhBdDg4aDhPK2Zp?=
 =?utf-8?B?VHJhdW9RSDNra1Z2bThOTzJNd0syTlI5aS93YzFHcHBJakxNMXhDcWVjckdM?=
 =?utf-8?B?TGlhaldVYis1WThna0x2dUNkYXNDSHJ5U0hRczdhdHIvSzJFbWttcms5OUJ3?=
 =?utf-8?B?OXJiYXR3V0pvMHlmaWFtTThpNkRubE5XaGl6d1BCUFpscmlEN1VUZlZwWlhO?=
 =?utf-8?B?bUFFNHpDbFFacEdtdWN6cFhZaHFKQW9kZVNzb3BpWXVWN01pMmNJbS9RRCtB?=
 =?utf-8?B?djN6cG9FL01QY1dtRlREdEJpdkhsejBuckdkUjcrUWlPaFZMbFBtc01hM0xQ?=
 =?utf-8?B?cWQ2Z0lwR05Da01vVERXdk9FbXg1a29PekFiQUFqcG1lc29QbVF2VFJNaERi?=
 =?utf-8?B?NVlHcFczLzRJSnJMY2tBZlBhQnJIcXdsUnVKaVZOZ1JybVQza2g5czc5dHRQ?=
 =?utf-8?B?SnRHT21zQ1BOV3Vpd2dJZjJ2d3ErU1hXaVZZY0xyZ1N1NVY4eCtnNTJVWE1p?=
 =?utf-8?B?b24ySHZPREZnR3hyZitjNHd2K2EyM3gzdWNJcFlmazROaWpzMHdvZTZzakVI?=
 =?utf-8?B?ZW9GLzBYRGQybnRKTEZxYkFoYzFoeFFOTEhBNGk4RkF0d3I1emZPbitiQUor?=
 =?utf-8?B?Nmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E22A910B2370584CBEFF92C89A37DB77@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 658acd88-0cb1-4f21-b78c-08de177e0cd2
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2025 06:32:08.1574
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5yA5TfqPN2Fun3cvDFPm9XoG1JLPvCojjzdXdJXXuu9KX8/MhW7B33lihWHt3Lps0eVwz/s/rVvdGb6OTz6bEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5289
X-OriginatorOrg: intel.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Oct 2025 06:32:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121195

T24gVGh1LCAyMDI1LTEwLTMwIGF0IDExOjU1ICswNTMwLCBWaWpheSBBbnVzdXJpIHdyb3RlOg0K
PiBIaSBBbnVqLA0KPiANCj4gVGhlIHJlbGV2YW50IGNoYW5nZXMgaW4gYGVjZGhfY3J5cHRvLmNg
IGFyZSBsb2NhdGVkIHdpdGhpbiB0aGUNCj4gZnVuY3Rpb24gYHN0YXRpYyBzc2hfc3RyaW5nIHNz
aF9lY2RoX2dlbmVyYXRlYC4gVGhpcyBmdW5jdGlvbiwNCj4gaG93ZXZlciwgaXMgbm90IHByZXNl
bnQgaW4gdGhlIGBsaWJzc2gtMC4xMC42YCB2ZXJzaW9uLiBJdCB3YXMNCj4gaW50cm9kdWNlZCBp
biBgbGlic3NoYCB2ZXJzaW9uIDAuMTEgYnkgdGhlIGNvbW1pdMKgDQo+IGBodHRwczovL2dpdC5s
aWJzc2gub3JnL3Byb2plY3RzL2xpYnNzaC5naXQvY29tbWl0L3NyYy9lY2RoX2NyeXB0by5jPw0K
PiBoPXN0YWJsZS0wLjExJmlkPTFlYjNkZjUyNTRhNDM0OGVhZTZlZGJjOGEyYmYwOGZlZjQwMTU4
OTdgLg0KPiANCj4gQ29uc2VxdWVudGx5LCB0aGVzZSBjaGFuZ2VzIGNhbm5vdCBiZSBkaXJlY3Rs
eSBhcHBsaWVkIHRvIHRoZQ0KPiBgbGlic3NoLTAuMTAuNmAgdmVyc2lvbi4gVGhpcyBhbGlnbnMg
d2l0aCB0aGUgYXBwcm9hY2ggdGFrZW4gYnkgb3RoZXINCj4gZGlzdHJpYnV0aW9ucywgYXMgU3Vz
ZSBhbHNvIGRpZCBub3QgYmFja3BvcnQgdGhlIGBlY2RoX2NyeXB0by5jYCBmaWxlDQo+IGNoYW5n
ZXMgaW4gdGhlaXIgYGxpYnNzaC0wLjEwLjYtMy4xLnNyYy5ycG1gIHBhY2thZ2UsIHdoaWNoIGlz
DQo+IGF2YWlsYWJsZSBhdA0KPiBgaHR0cHM6Ly9jZGltYWdlLmRlYmlhbi5vcmcvbWlycm9yL29w
ZW5zdXNlLm9yZy9kaXN0cmlidXRpb24vbGVhcC1taWMNCj4gcm8vNi4wL3Byb2R1Y3QvcmVwby9v
cGVuU1VTRS1MZWFwLU1pY3JvLTYuMC14ODZfNjQtTWVkaWEzL3NyYy9saWJzc2gtDQo+IDAuMTAu
Ni0zLjEuc3JjLnJwbWAuDQoNClRoYW5rIHlvdSBmb3IgdGhlIGRldGFpbHMuIFRoZXNlIHNob3Vs
ZCBiZSBwcmVzZW50IGluIHRoZSBjb21taXQNCm1lc3NhZ2Ugc2F5aW5nIHdoYXQgd2FzIGNoYW5n
ZWQgd2hpbGUgY2hlcnJ5LXBpY2tpbmcuIA0KDQpDYW4geW91IHBsZWFzZSBzZW5kIGEgdjI/DQoN
Cj4gDQo+IFRoYW5rcyAmIFJlZ2FyZHMsDQo+IFZpamF5DQo+IA0KPiBPbiBUaHUsIE9jdCAzMCwg
MjAyNSBhdCA5OjI14oCvQU0gTWl0dGFsLCBBbnVqIDxhbnVqLm1pdHRhbEBpbnRlbC5jb20+DQo+
IHdyb3RlOg0KPiA+IE9uIFRodSwgMjAyNS0xMC0wOSBhdCAxODo1NSArMDUzMCwgVmlqYXkgQW51
c3VyaSB2aWENCj4gPiBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIHdyb3RlOg0KPiA+ID4gKysrIGIv
bWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvbGlic3NoL2xpYnNzaC9DVkUtMjAyNS04Mjc3LTIucGF0
Y2gNCj4gPiA+IEBAIC0wLDAgKzEsODkgQEANCj4gPiA+ICtGcm9tIDI2NjE3NGE2ZDM2Njg3YjY1
Y2Y5MDE3NGYwNmFmOTBiOGIyN2M2NWYgTW9uIFNlcCAxNw0KPiA+ID4gMDA6MDA6MDANCj4gPiA+
IDIwMDENCj4gPiA+ICtGcm9tOiBGcmFuY2VzY28gUm9sbG8gPGVmZXJvbGxvQGdtYWlsLmNvbT4N
Cj4gPiA+ICtEYXRlOiBUaHUsIDI0IEp1bCAyMDI1IDE2OjMwOjA3ICswMzAwDQo+ID4gPiArU3Vi
amVjdDogW1BBVENIXSBDVkUtMjAyNS04Mjc3OiBGaXggbWVtb3J5IGxlYWsgb2YgdW51c2VkDQo+
ID4gPiBlcGhlbWVyYWwNCj4gPiA+IGtleSBwYWlyDQo+ID4gPiArIGFmdGVyIGNsaWVudCdzIHdy
b25nIEtFWCBndWVzcw0KPiA+ID4gKw0KPiA+ID4gK1NpZ25lZC1vZmYtYnk6IEZyYW5jZXNjbyBS
b2xsbyA8ZWZlcm9sbG9AZ21haWwuY29tPg0KPiA+ID4gK1Jldmlld2VkLWJ5OiBBbmRyZWFzIFNj
aG5laWRlciA8YXNuQGNyeXB0b21pbGsub3JnPg0KPiA+ID4gKyhjaGVycnkgcGlja2VkIGZyb20g
Y29tbWl0DQo+ID4gPiBjY2ZmMjJkMzc4N2MxMzU1YjNmMGRjZDA5ZmU1NGQ5MGFjYzU1YmYxKQ0K
PiA+ID4gKw0KPiA+ID4gK1Vwc3RyZWFtLVN0YXR1czogQmFja3BvcnQNCj4gPiA+IFsNCj4gPiA+
IGh0dHBzOi8vZ2l0LmxpYnNzaC5vcmcvcHJvamVjdHMvbGlic3NoLmdpdC9jb21taXQvP2g9c3Rh
YmxlLTAuMTEmaQ0KPiA+ID4gZD0NCj4gPiA+IDI2NjE3NGE2ZDM2Njg3YjY1Y2Y5MDE3NGYwNmFm
OTBiOGIyN2M2NWZdDQo+ID4gPiArQ1ZFOiBDVkUtMjAyNS04Mjc3DQo+ID4gPiArU2lnbmVkLW9m
Zi1ieTogVmlqYXkgQW51c3VyaSA8dmFudXN1cmlAbXZpc3RhLmNvbT4NCj4gPiA+ICstLS0NCj4g
PiA+ICsgc3JjL2RoX2NyeXB0by5jwqDCoMKgwqDCoMKgIHwgNSArKysrKw0KPiA+ID4gKyBzcmMv
ZGhfa2V5LmPCoMKgwqDCoMKgwqDCoMKgwqAgfCA1ICsrKysrDQo+ID4gPiArIHNyYy9lY2RoX2dj
cnlwdC5jwqDCoMKgwqAgfCA2ICsrKysrKw0KPiA+ID4gKyBzcmMvZWNkaF9tYmVkY3J5cHRvLmMg
fCA2ICsrKysrKw0KPiA+IA0KPiA+IFRoaXMgZG9lcyBub3QgbG9vayBsaWtlIGEgc2ltcGxlIGJh
Y2twb3J0IG9mDQo+ID4gaHR0cHM6Ly9naXQubGlic3NoLm9yZy9wcm9qZWN0cy9saWJzc2guZ2l0
L2NvbW1pdC8/aD1zdGFibGUtMC4xMSZpZD0yNjYxNzRhNmQzNjY4N2I2NWNmOTAxNzRmMDZhZjkw
YjhiMjdjNjVmDQo+ID4gDQo+ID4gV2FzIHRoZSBjaGFuZ2UgaW4gZWNkaF9jcnlwdG8uYyBub3Qg
cmVxdWlyZWQ/DQo=


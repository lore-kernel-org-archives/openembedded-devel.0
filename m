Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52D4CCAC59A
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 02:02:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by mx.groups.io with SMTP id smtpd.web10.4159.1758160967307998583
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Sep 2025 19:02:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=KngFW1D9;
 spf=pass (domain: intel.com, ip: 198.175.65.9, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758160968; x=1789696968;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=BUP31gILh/a4RlhrQy9IfQgHH86NBrEuKc0Zs31NioA=;
  b=KngFW1D90f6HxT5f8CMFURrOao7zVdvj8+Ruy1zuk+oRLS6wpChVdLdV
   2B3jzsfg8wvFGyIYMLLmFAHoNieu6R6H9lYwwILtQ/lIoSMGMLOMvKVuP
   OeacgYgR1ey0F/uZj7PmF2PbPlOiQGoriurFhXzI34PDGlKv4uxrVHHX8
   GZcp59JKNDDtAxF1T63QH36H3yfwW3DBcbbNOhyq4PhdInSEHEisp48V8
   bixHtmU/83Y0r8jJtsnOYkA5raeKH5WoTLZBSgv4mHupjyDchDYFksw4h
   DhTgGbhZ+UsP4007U8eh4xC/CF2LTHUtK9aobcl5QwsIQrXuN70sxqFhU
   g==;
X-CSE-ConnectionGUID: vR4wt5BARGC7Y5lps83aLA==
X-CSE-MsgGUID: X3vO8YjeS3K+buK96qu7KQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="83076323"
X-IronPort-AV: E=Sophos;i="6.18,273,1751266800"; 
   d="scan'208";a="83076323"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 19:02:47 -0700
X-CSE-ConnectionGUID: xGI6XFdlS0W+oS7jmKe+pA==
X-CSE-MsgGUID: I9dchETZQyKL8VtpxNBNxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,273,1751266800"; 
   d="scan'208";a="206195762"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 19:02:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 17 Sep 2025 19:02:46 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 17 Sep 2025 19:02:46 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.70) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 17 Sep 2025 19:02:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZnLilOFPobtjCzxcU+xMpXMjbSYUVT4bt15jowu5ofl8VRY44+n7Czmq03mE4HSDRYOrRUIQOO6vc1xaww9lVyCJFZ2kxnPzel+q64CIHpqs3WSPN/5FZXtz56s8WpsWHRfJ2RMWWfM89HHF3jPeOZJp5oYrr/eoLX+S5e7BxbNHxRWt/i52s9TbwxkGirqbvRtyjpxuZ7s1pQP2R5BPqwMQ301kSJYzRh0TYKf3lOsZ3VJoIqwGYF7qA08UgTdYqINuCW2MK7NmRu1Z9ea14BTvY/xF5C2pfpz4GUx2LyklX2YJgPWr03GMgW0zNfSZHq8/5wWaX38ijfZPVKebhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BUP31gILh/a4RlhrQy9IfQgHH86NBrEuKc0Zs31NioA=;
 b=tjzYcKGmDRBpvn9pLGUO6rlsjhKj7SDrHrWtdhna7MJ0+WS3eIC2uLiZcyQMj6dd+dYCPlypGANcwZ6kUyklQuHh9vdebyKaRI8ww3Uwvc2owO5czcrwYbk9uEDDUHa52Q/QasQS/KxTQyvij4zlBHr7QIoeSLil6CIr8NBCDA1HM2hpLCVlMqtKTzvmHf3C2IvmpCK7LsyhmgZdEXyfm6zWdJywVqBu6vACWvVH0ih57V2c2I8UZ+K7b+Vi3PgnpyN6EP2qnH77S5cIb5w2T7L73TY4xNlP/BXJ3AqbS/rsD2Mze+lp1VBXjnhGIU1JQ22jKp3LeKhMgyoQtvx8ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6430.namprd11.prod.outlook.com (2603:10b6:8:b6::15) by
 PH7PR11MB6008.namprd11.prod.outlook.com (2603:10b6:510:1d0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.23; Thu, 18 Sep
 2025 02:02:38 +0000
Received: from DM4PR11MB6430.namprd11.prod.outlook.com
 ([fe80::b81:6df0:d8b2:e596]) by DM4PR11MB6430.namprd11.prod.outlook.com
 ([fe80::b81:6df0:d8b2:e596%5]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 02:02:38 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "peng.zhang1.cn@windriver.com"
	<peng.zhang1.cn@windriver.com>, "skandigraun@gmail.com"
	<skandigraun@gmail.com>
Subject: Re: [oe] [meta-oe][scarthgap][PATCH] iperf3: fix CVE-2025-54350
Thread-Topic: [oe] [meta-oe][scarthgap][PATCH] iperf3: fix CVE-2025-54350
Thread-Index: AQHcJ5bHxVaUZxS/LUSlfuFGWwOam7SYMW6A
Date: Thu, 18 Sep 2025 02:02:38 +0000
Message-ID: <bc48b4bd3497a5262d07c576e1036142f0bfa7d2.camel@intel.com>
References: <20250917054831.2884291-1-peng.zhang1.cn@windriver.com>
In-Reply-To: <20250917054831.2884291-1-peng.zhang1.cn@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6430:EE_|PH7PR11MB6008:EE_
x-ms-office365-filtering-correlation-id: b88f842b-a277-4699-832e-08ddf657717c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|4022899009|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?YmxXbmxxOEUxRDVEanF0NExVdWRqUUgvZW9ZcnRVYlRITEQ2Ums1aWNJUWdt?=
 =?utf-8?B?dm1RM1YxWHZ2dElIR1V2SVhhU05OcUVZOGp5QVhHTnEwVkZjditBL2lXTVND?=
 =?utf-8?B?MWlKVGdJMTZlS3BRYjVFTkpMMVhmU1c4S2lvaWc5V1lJbFZTVHBUdDJ6ajNj?=
 =?utf-8?B?UDQ4RjFmNHFDd0F4Vk1HcVl3UTBJOFNhZSs2Q3BqL2ZmN0tjMnZSa01Ka1JR?=
 =?utf-8?B?bXFaRDlad2xDemhjMEtIeEdJdDJreWJxd0x0ZEl3Yk15OE8zU2d0a3R2ODIw?=
 =?utf-8?B?RkFZOVgzWEUwSklzK3Z0T0orc1p5RytJcmRaSldNTDY1bGtBS1dBK1FjOEFz?=
 =?utf-8?B?dGpsMnAxdVVqWVZ1UXo2d2RNL3o1eEM4NVIrSDBRZ1UvSkhLUGh1MjBqejdw?=
 =?utf-8?B?WnorWk5NNjJjZUhpdTZ2cHlIdU9URjJlNVBIS2NBQnd3WFVtbmJsUUNNM3Bh?=
 =?utf-8?B?cG9ZY1RwTHNIaGJSOVB6NStQeHNwVmQ5QXdzc09Pd2Z6UmlYUkozOUJ6elBn?=
 =?utf-8?B?aWt2WURjYzB4M3NTUDF1bEJTVUxnS3gvVDFZU3pUa3BUWGVCcW96UVpoOGE1?=
 =?utf-8?B?YTNqN0ZIdGQ0ODVLSitOZ3FjTVVxV1U0WFI1cFc5MjU2bDhWUjNhWnZYRFdw?=
 =?utf-8?B?eWdialhMaGZnQlpDb2NaZ0tSeXpGWGZiUVJDZ2VYbERyM0RjeEdCVFlFUTNE?=
 =?utf-8?B?NUtyUVhuV1hvUjNCeXFKaEJGUEY2ZW0veVd0Uk14K1FyNG9sRG1La0NpbHpL?=
 =?utf-8?B?ekhFbUlZZHV1ODE5akQzZGVvQ3hYcUo2WkxxdnQzYjJnS2FCeFhjWExucGpH?=
 =?utf-8?B?emp4NEZtV0FqSWdhMjU2ZllvZEdyRTN4QW5CbEdveUVheW9SK04ycjU3K3ps?=
 =?utf-8?B?dW5jam81RWJ2TkFwb04vN1Q2UlhCVFpSOHc3QlExNENKMmZ4RDZMcy9lWWpz?=
 =?utf-8?B?WmJNSVVhT21KYVBrRVF6OWsxT0xTeXB5TFExdjVDQWR4L3ROWUFIQTRROGZD?=
 =?utf-8?B?Qm9sanpEYTdRaWp1ZVAvekFvR2d5SHYyQXNZSVBYdUx0VUVkNTU0dnFXQy9a?=
 =?utf-8?B?aWlEZE00WE95YXBCUXhHeXRDSTNabWNhS1MxdjF6ZlN2c3hkSGdmeWIwOUZs?=
 =?utf-8?B?MWNmUUVhYitaaHUwUTNxdTIyWnRxZkFTUCtSdk1nQXlpNTk1UjdOUUl4K25w?=
 =?utf-8?B?SmVGNWtCMlpNKzRIalZINk1oMUh4WENTYjNZKzhJOS8zUWtuakNJS3B5bHJF?=
 =?utf-8?B?cStadzBISDY0Um5McFdRelBqTHZpUHlYUFJLUnZKSjdLcHcrejFEVDhJczhi?=
 =?utf-8?B?cGQ0SitTbXlSRDArNkhYOVNQeW5hbDk0eDRBYlhlZWVPdXNLc0NMOXpOWUJh?=
 =?utf-8?B?Z0hwSVpNTVRORzUzQ01nakszdGhQTklPemhDakdNKzRaWmpCT2JGZU1zUWdp?=
 =?utf-8?B?M0tlUVlYRVJjNktvenNUanorVkpRbFhnVlBWbjlnb0xJdFJYVURPeThsSlcy?=
 =?utf-8?B?VFQ1SXNGZTJjM2xndzJadzN3WXg5ZlNEV0IxMkE0QmVTQWNxVzlVdmZlaGZz?=
 =?utf-8?B?d2NHYmtOYjhyYUFrQVZrR0l4Yi80ZldNQ24rNDRYcE55OTlralBoUFRqMVZa?=
 =?utf-8?B?OUdQNUk5RmhiVzltbjQ3RGtaQVhXN05XeE54cWFkRFp5SVhXT3g1bTU3MHFk?=
 =?utf-8?B?WlJmU3VJRmZ2L2ZkMEFMNDJIQjFZcGlIcWo1SEZmeW03RXBydEhLeXQzN2R5?=
 =?utf-8?B?WS9CMmF4b01GUHBabThqMW5oOHJ1Y1BSejhNcUxoNG9QcTRCR1VoWk5Sa0hM?=
 =?utf-8?B?cmh2TUNqVnIxKzVscTZsWmRVdDdlMVlya09BNnFyeWdCMlRtSDJ0dXpXaENo?=
 =?utf-8?B?TGNpNkFtUUx1dVpkQmpZS2N3cVlDdU9MemZUdjRtekFaTVVUMEwvbkJhRXlP?=
 =?utf-8?Q?EseoS9i48e7+XL+GnY4RuX3U6NLHPLsG?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6430.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4022899009)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?anRiQzY2dkovMlJXL29tbXB0M1dOSWprWVdCeHlpV1B4MEJWbEZaR25xYTFV?=
 =?utf-8?B?Slc4aCsxRkN6dWVOYks4aFdVejY4eGVSTE1VQ0twaGZ5ZlkzUlhYcXNLSUVU?=
 =?utf-8?B?UHBUdzA3dGJSSVphT1ZNR0I1azl5S3ZVNWV5ektOdDAxREpvNjZQZEt6bEMv?=
 =?utf-8?B?cnkvdHJ2S2NHTmFuQVN2K1pyMkVPalRuc2ozNUo1RkFjYndlR0FLbWtHaUJn?=
 =?utf-8?B?Y3NjWUpZS1ZVcVBiYWNWUGQzbUR0UHR0alNIOTEzaDQwUm9Cam9PVnl3dDAx?=
 =?utf-8?B?cTd3Sk9SdU9lWmwwdEFkUWtTL1hZdjVLQlpuMTRnMFUwaUtTcy9DNDF3WXFa?=
 =?utf-8?B?emREM2NWTDFDSzg2NStlNlZsRWRxeUdhTFdRRU5TanpmdW9WcTNHdnMxQUtr?=
 =?utf-8?B?bkFBeU9OckpQR05ycWVvbmVMWDdzdGN1Nk9lUFptTlV2dW03VW1EUHAwVHU2?=
 =?utf-8?B?SDlhNFZHaGJldklLRmloQ1llcjB0MVBBNWZhSUdia3BuV2xRa0NHVHArdlUy?=
 =?utf-8?B?REdKUGZhUXJvS2FFdzdFb3RCbHR3Z2g3SHV6SXd5cjRVdlhKY3lMcS9wWHJH?=
 =?utf-8?B?WThYa09CVi9pTUYveWNKSTF1OWh1ZG5wNnUzWFRUSTRmQW5LR0FranErRXB6?=
 =?utf-8?B?d2FUNURsMG8vZTJDbHk5eU1XQ3ZlL3VSVmU1SWo5aUxGQnBTbkJnc01wK3Va?=
 =?utf-8?B?Q0xtdk9BNXFNc20xQlozOGVXMUJaTGptelRHTXZOWXB2R0k3UHdnd0ZaRXdk?=
 =?utf-8?B?emtHcW1FcWtjb3Q2Y1ZxLzdsRlhOYjdjOHVWQnRiN1VjSmZOOHcrajI1NXZ6?=
 =?utf-8?B?MEdmS2UvYkRDalhTWnkxTGlRYUFsTG1YeXhrcEhwQXJJOC9LYytsOVVvNi9V?=
 =?utf-8?B?RGJhZXJnOVBKSjl1N0h3V1RPc2M1RVFYUE9kdno1bUh6djVMNTlkS3dYY29R?=
 =?utf-8?B?UVgxTURqQUdzZnRBZ3VJY1dxY0lHRVZZTVdUQmxqRmlVdWZhcHptMVdZQlEz?=
 =?utf-8?B?V2lObkdpWHFES0FXVU9Pd2Ixc0dkcWRSYWpuNm12NWVFYmIyZFVIdlFsYVJk?=
 =?utf-8?B?MUhxZUV3N2kzUTdGZHBZU0hia0R3Tnd1L0lrdjRLTW91OTFOL2xIdXVHbEU3?=
 =?utf-8?B?eVZwK3I1bzBIM2o5SDlWQ3NzQ1BRS0FYWVpSYXFnUTlBUmQyQUlnTkc3ajVh?=
 =?utf-8?B?WExrTjQ2ZUMrY3FwMjZVOHU3NVR4RlBWVFdJTmlWRnFOMDRDZE9MVkpxN09h?=
 =?utf-8?B?Y0pHaDdtYWZTY1lwWTlGb3VYN01Dd1JUZ2FKa1BpRWU2N3dIOHY1THg0RWlo?=
 =?utf-8?B?dWh0S2U0QjhCUUllU0o3RFlSeFpHaXcxYUQ5UVJoQUErK0pGMnV6YUxvMXVj?=
 =?utf-8?B?eXZIbnR2UjdDOG9qVExIVlNsQW51MGVVSDRSV0xMcEpEUHp6SE4wdVpXeDE4?=
 =?utf-8?B?WU1XOUI1YlptQ21wWlNKVjlQcUliM0ZoM3pxRFROYjJXeDAzWnd3QkNYWG1I?=
 =?utf-8?B?QXNVMzN4a1NuTzd0Z3FlL1Zod3l3c3hTZ2E5UHh1dmVEVitDUGd6QmEzM1Nv?=
 =?utf-8?B?bFIwODhUZmZFM0UxNXdMVHhaZW42WDBpQWtoYTRybkNqd3pmc1E3WGRkQXhv?=
 =?utf-8?B?OHJMYW1LN2l6WlBkUS9tU3YwK1FxWDNIbWs1U0sxZFZQazV3d0FrUEhoSHpk?=
 =?utf-8?B?NHNmZjBLRWVGTkhwZGhpUDNWQm9RWVo3MjJ5NG9FT1FQaFJIMjZ1ck5ac2JH?=
 =?utf-8?B?QUVwU0lsbWhEa1hvTHpKeVJVTVlLUVVQYk4xTW9EKzBEbHp3WjZDQXNWdmNt?=
 =?utf-8?B?aVhDODhaNlRZaGlMSVNxYVFNRkRxR1drZE0zWEs2SGFBbGxUUlNQM0llRGJm?=
 =?utf-8?B?a1VCSnpHWkxnd01FVmNSNndHa29SZSsvaHExMU1peGU2MGdHT1QyaUxpNmFo?=
 =?utf-8?B?S0xzQjA1OXBTazZPQlQ3QmV6TmtxWmVaSlJjd0llQnpLam8rSzdmYURLWWRO?=
 =?utf-8?B?SVpuZmw2RlVFRjV1NUVYOFluQ2NLck9Yb1BYNWRxL0N5eXVWU1FUdmIwSGVI?=
 =?utf-8?B?YURPcWRzQ2g1dHdGaVg2N3NKVUpDT1YxOGdCWm1pcUdVYWJFdS90SUxqYmJK?=
 =?utf-8?B?YVgxMVA0cVFNRnZST3lPWmRpUVNpUkFtSWpBaXhOME40eGZ3eld3L0s1dTBG?=
 =?utf-8?B?clE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F74FF8C9C1DDCA4DA16981B4EAB494C6@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b88f842b-a277-4699-832e-08ddf657717c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2025 02:02:38.2513
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BZWwmDUYKMUPDgLDxcvrpFw305+MCBeYX7nWMm4Ti9wiTDt4eUgRhHKUU93eSA5XBTEUg2VIvQumvzpOYOJV+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6008
X-OriginatorOrg: intel.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 02:02:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119499

T24gV2VkLCAyMDI1LTA5LTE3IGF0IDEzOjQ4ICswODAwLCBaaGFuZywgUGVuZyAoUGF1bCkgKENO
KSB2aWENCmxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgd3JvdGU6DQo+IEZyb206IFpoYW5nIFBlbmcg
PHBlbmcuemhhbmcxLmNuQHdpbmRyaXZlci5jb20+DQo+IA0KPiBDVkUtMjAyNS01NDM1MDoNCj4g
SW4gaXBlcmYgYmVmb3JlIDMuMTkuMSwgaXBlcmZfYXV0aC5jIGhhcyBhIEJhc2U2NERlY29kZSBh
c3NlcnRpb24NCj4gZmFpbHVyZSBhbmQgYXBwbGljYXRpb24gZXhpdCB1cG9uIGEgbWFsZm9ybWVk
IGF1dGhlbnRpY2F0aW9uIGF0dGVtcHQuDQo+IA0KPiBSZWZlcmVuY2U6DQo+IFtodHRwczovL252
ZC5uaXN0Lmdvdi92dWxuL2RldGFpbC9DVkUtMjAyNS01NDM1MF0NCj4gDQo+IFVwc3RyZWFtIHBh
dGNoZXM6DQo+IFsNCj4gaHR0cHM6Ly9naXRodWIuY29tL2VzbmV0L2lwZXJmL2NvbW1pdC80ZWFi
NjYxZGEwYmJhYWMwNDQ5M2ZhNDAxNjRlOTI4Yw0KPiA2ZGY3OTM0YV0NCg0KVGhpcyBzZWVtcyB0
byBiZSBhZmZlY3Rpbmcga2lya3N0b25lIGFuZCB3YWxuYXNjYXIgYXMgd2VsbC4NCg0KVGhhbmtz
LA0KDQpBbnVqDQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFpoYW5nIFBlbmcgPHBlbmcuemhhbmcx
LmNuQHdpbmRyaXZlci5jb20+DQo+IC0tLQ0KPiDCoC4uLi9pcGVyZjMvaXBlcmYzL0NWRS0yMDI1
LTU0MzUwLnBhdGNowqDCoMKgwqDCoMKgwqAgfCAzOQ0KPiArKysrKysrKysrKysrKysrKysrDQo+
IMKgLi4uL3JlY2lwZXMtYmVuY2htYXJrL2lwZXJmMy9pcGVyZjNfMy4xOC5iYsKgwqAgfMKgIDEg
Kw0KPiDCoDIgZmlsZXMgY2hhbmdlZCwgNDAgaW5zZXJ0aW9ucygrKQ0KPiDCoGNyZWF0ZSBtb2Rl
IDEwMDY0NCBtZXRhLW9lL3JlY2lwZXMtYmVuY2htYXJrL2lwZXJmMy9pcGVyZjMvQ1ZFLTIwMjUt
DQo+IDU0MzUwLnBhdGNoDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLWJlbmNo
bWFyay9pcGVyZjMvaXBlcmYzL0NWRS0yMDI1LQ0KPiA1NDM1MC5wYXRjaCBiL21ldGEtb2UvcmVj
aXBlcy1iZW5jaG1hcmsvaXBlcmYzL2lwZXJmMy9DVkUtMjAyNS0NCj4gNTQzNTAucGF0Y2gNCj4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMC4uZTZkZTBlODEwYw0KPiAt
LS0gL2Rldi9udWxsDQo+ICsrKyBiL21ldGEtb2UvcmVjaXBlcy1iZW5jaG1hcmsvaXBlcmYzL2lw
ZXJmMy9DVkUtMjAyNS01NDM1MC5wYXRjaA0KPiBAQCAtMCwwICsxLDM5IEBADQo+ICtGcm9tIDRj
ZDZjOGU4NTM3NmEzM2JkZGQwMWZhYzE0M2UyNzQzNmQ0MWYyYjkgTW9uIFNlcCAxNyAwMDowMDow
MA0KPiAyMDAxDQo+ICtGcm9tOiAiQnJ1Y2UgQS4gTWFoIiA8Ym1haEBlcy5uZXQ+DQo+ICtEYXRl
OiBUdWUsIDI0IEp1biAyMDI1IDE1OjU4OjIxIC0wNzAwDQo+ICtTdWJqZWN0OiBbUEFUQ0hdIFBy
ZXZlbnQgY3Jhc2ggZHVlIHRvIGFzc2VydGlvbiBmYWlsdXJlcyBvbg0KPiBtYWxmb3JtZWQNCj4g
KyBhdXRoZW50aWNhdGlvbiBhdHRlbXB0Lg0KPiArDQo+ICtSZXBvcnRlZCBieSBIYW4gTGVlIChB
cHBsZSBJbmZvcm1hdGlvbiBTZWN1cml0eSkNCj4gK0NWRS0yMDI1LTU0MzUwDQo+ICsNCj4gK0NW
RTogQ1ZFLTIwMjUtNTQzNTANCj4gK1Vwc3RyZWFtLVN0YXR1czogQmFja3BvcnQNCj4gW2h0dHBz
Oi8vZ2l0aHViLmNvbS9lc25ldC9pcGVyZi9jb21taXQvNGVhYjY2MWRhMGJiYWFjMDQ0OTNmYTQw
MTY0ZTkyDQo+IDhjNmRmNzkzNGFdDQo+ICtTaWduZWQtb2ZmLWJ5OiBaaGFuZyBQZW5nIDxwZW5n
LnpoYW5nMS5jbkB3aW5kcml2ZXIuY29tPg0KPiArLS0tDQo+ICsgc3JjL2lwZXJmX2F1dGguYyB8
IDIgLS0NCj4gKyAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkNCj4gKw0KPiArZGlmZiAt
LWdpdCBhL3NyYy9pcGVyZl9hdXRoLmMgYi9zcmMvaXBlcmZfYXV0aC5jDQo+ICtpbmRleCA4NmI0
ZWJhLi42MzJmMDNkIDEwMDY0NA0KPiArLS0tIGEvc3JjL2lwZXJmX2F1dGguYw0KPiArKysrIGIv
c3JjL2lwZXJmX2F1dGguYw0KPiArQEAgLTI4LDcgKzI4LDYgQEANCj4gKyAjaW5jbHVkZSAiaXBl
cmZfY29uZmlnLmgiDQo+ICsgDQo+ICsgI2luY2x1ZGUgPHN0cmluZy5oPg0KPiArLSNpbmNsdWRl
IDxhc3NlcnQuaD4NCj4gKyAjaW5jbHVkZSA8dGltZS5oPg0KPiArICNpbmNsdWRlIDxzeXMvdHlw
ZXMuaD4NCj4gKyAvKiBGcmVlQlNEIG5lZWRzIF9XSVRIX0dFVExJTkUgdG8gZW5hYmxlIHRoZSBn
ZXRsaW5lKCkgZGVjbGFyYXRpb24NCj4gKi8NCj4gK0BAIC0xNTIsNyArMTUxLDYgQEAgaW50IEJh
c2U2NERlY29kZShjb25zdCBjaGFyKiBiNjRtZXNzYWdlLA0KPiB1bnNpZ25lZCBjaGFyKiogYnVm
ZmVyLCBzaXplX3QqIGxlbmd0aCkNCj4gKyANCj4gK8KgwqDCoMKgIEJJT19zZXRfZmxhZ3MoYmlv
LCBCSU9fRkxBR1NfQkFTRTY0X05PX05MKTsgLy9EbyBub3QgdXNlDQo+IG5ld2xpbmVzIHRvIGZs
dXNoIGJ1ZmZlcg0KPiArwqDCoMKgwqAgKmxlbmd0aCA9IEJJT19yZWFkKGJpbywgKmJ1ZmZlciwg
c3RybGVuKGI2NG1lc3NhZ2UpKTsNCj4gKy3CoMKgwqAgYXNzZXJ0KCpsZW5ndGggPT0gZGVjb2Rl
TGVuKTsgLy9sZW5ndGggc2hvdWxkIGVxdWFsIGRlY29kZUxlbiwNCj4gZWxzZSBzb21ldGhpbmcg
d2VudCBob3JyaWJseSB3cm9uZw0KPiArwqDCoMKgwqAgQklPX2ZyZWVfYWxsKGJpbyk7DQo+ICsg
DQo+ICvCoMKgwqDCoCByZXR1cm4gKDApOyAvL3N1Y2Nlc3MNCj4gKy0tIA0KPiArMi41MC4wDQo+
ICsNCj4gZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1iZW5jaG1hcmsvaXBlcmYzL2lwZXJm
M18zLjE4LmJiIGIvbWV0YS0NCj4gb2UvcmVjaXBlcy1iZW5jaG1hcmsvaXBlcmYzL2lwZXJmM18z
LjE4LmJiDQo+IGluZGV4IGU5NmQ1ZjA4NGIuLjdmYjJjNTJkMDggMTAwNjQ0DQo+IC0tLSBhL21l
dGEtb2UvcmVjaXBlcy1iZW5jaG1hcmsvaXBlcmYzL2lwZXJmM18zLjE4LmJiDQo+ICsrKyBiL21l
dGEtb2UvcmVjaXBlcy1iZW5jaG1hcmsvaXBlcmYzL2lwZXJmM18zLjE4LmJiDQo+IEBAIC0xNiw2
ICsxNiw3IEBAIFNSQ19VUkkgPQ0KPiAiZ2l0Oi8vZ2l0aHViLmNvbS9lc25ldC9pcGVyZi5naXQ7
YnJhbmNoPW1hc3Rlcjtwcm90b2NvbD1odHRwcyBcDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
ZmlsZTovLzAwMDItUmVtb3ZlLXBnLWZyb20tcHJvZmlsZV9DRkxBR1MucGF0Y2jCoFwNCj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBmaWxlOi8vMDAwMS1jb25maWd1cmUuYWMtY2hlY2stZm9yLUNQ
UC1wcm9nLnBhdGNowqBcDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZmlsZTovL0NWRS0yMDI1
LTU0MzQ5LnBhdGNowqBcDQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoCBmaWxlOi8vQ1ZFLTIwMjUt
NTQzNTAucGF0Y2jCoFwNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgIg0KPiDCoA0KPiDCoFNSQ1JF
ViA9ICIyYTI5ODQ0ODhkNmRlOGY3YTJkMWY1OTM4ZTAzY2E3YmU1N2UyMjdjIg0KPiANCj4gLT0t
PS09LT0tPS09LT0tPS09LT0tPS0NCj4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBz
ZW50IHRvIHRoaXMgZ3JvdXAuDQo+IFZpZXcvUmVwbHkgT25saW5lICgjMTE5NDc4KToNCj4gaHR0
cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWRldmVsL21lc3NhZ2Uv
MTE5NDc4DQo+IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3Jn
L210LzExNTI4Njk5MC8zNjE2NzAyDQo+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtZGV2ZWwr
b3duZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBVbnN1YnNjcmliZToNCj4gaHR0cHM6Ly9s
aXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWRldmVsL3Vuc3ViwqBbDQo+IGFu
dWoubWl0dGFsQGludGVsLmNvbV0NCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCg==


Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20EB5CAC5A7
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 06:33:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by mx.groups.io with SMTP id smtpd.web10.10574.1758609222797689805
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Sep 2025 23:33:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=BKeGPcyW;
 spf=pass (domain: intel.com, ip: 192.198.163.9, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758609223; x=1790145223;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=YZMdGOjlb/J808yiEG3+YvwgOoMQVyTzKj/K5bOWjWU=;
  b=BKeGPcyWy2//HwRGg2zXNNXU8ZpESa/BC/QMgdho9OHjmMwo6UWqp0/r
   gdWPeCFvpzx71bPsx1WseoO3magLig8lWS2nrtrhnJUiyqSByyFFxs0hj
   McRVahAaChycY3esp6SDb3LwbCHZqwe/ppnGsifu0OIaZDKS1y8azI+Pz
   1MVr4VjtlFimNrqAm8pygsJ+QzslNLCLMhBpSyyAvXgfxYo7vdzkO8hPV
   jQ9E9P68zB6qmnORJHGTNLzp8XLP1JG927rH5GVTw0D11Aj0Ns+UV7HRU
   Hh9dzfXyzDhRxM4VmnDpS5HHd0wYRtrc6Yp7dsJmy+Im60iOq9Y/Nfe7E
   Q==;
X-CSE-ConnectionGUID: ZOSjEWqZSbmJrU2gE86Bmw==
X-CSE-MsgGUID: Jd/AhlgQSSCfHa3nj9loTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="71555463"
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="71555463"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 23:33:43 -0700
X-CSE-ConnectionGUID: 9A3K5glkQ0SQzJSJQxY07Q==
X-CSE-MsgGUID: o5exRdX7T9+dMZ66HaEv3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="207613533"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 23:33:42 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 23:33:41 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 22 Sep 2025 23:33:41 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.21) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 23:33:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jny1uuXj9I9yKhgZ2B+z5Nyridy9BQqnZy3lhxR2LClUTdUmzJB99t6Om+zvZzscuaI7Tme4HKq3GvVUhQe644d6pUEuCIWG8Eyyvc59Za4m9yyfabXTSquBKRWWuvxU2NPr0alYEYhccXjHFbq+O1ysuW05mGqaNEz/3qS60zoOtHYkTkjCySYRETpFBtlxsLAbVr/HrbjQOXifJY7EKlFkGhNzg1bxAHp/+QNHZKBueBwh8zHt+tGo9+YwsLrBsitwBQHP3noLpYOXtVo3ozxxfw3v1MtgfDpc5z7FXdncSUbxFVDlwcvKG55+pF1CxLFDnsIEvTzf5rK6c97QEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YZMdGOjlb/J808yiEG3+YvwgOoMQVyTzKj/K5bOWjWU=;
 b=IKMUz0naur+3qd7D27JRtUkDDM7M0sEHDyprXNelvSuu+SCfqwRBlIVT18k/8F/QxPAe9I1+xRdtekpk0TzmUuVoRF5tnAmrlUEyrcLE3nfu3//QVjbkvyJ++LwhUJWmNUgAachQuWDUbkk102A9IUeaILjza9jEIpBD4ZZ7/7jcphdKOlhmjq8XF1qjBUFr8rZJ+xzNxCYsXolzWLKdHWFYn86dQcO7kaJUjEWwerI9hYKjW2SiPe4MOcHWpdxqrMM8wqdX1dLlmv75Pi529kfHYtWs9oB+rlx43teUqfV+PCZTMilTAaNme3nwRevSeDs2QOvgN8uNmwrAh8pDOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by SA0PR11MB4750.namprd11.prod.outlook.com (2603:10b6:806:9d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.21; Tue, 23 Sep
 2025 06:33:38 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%2]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 06:33:38 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "emailaddress.ashish@gmail.com"
	<emailaddress.ashish@gmail.com>
Subject: Re: [oe] [scarthgap] meta-oe: image: optionally remove RAW image
 after sparse image creation
Thread-Topic: [oe] [scarthgap] meta-oe: image: optionally remove RAW image
 after sparse image creation
Thread-Index: AQHcKKqLA0jdjzEo7kurU6h6zlba4LSgVcAAgAAA5oA=
Date: Tue, 23 Sep 2025 06:33:38 +0000
Message-ID: <e0f606e659851aa170740b055e75a8f311bc7abf.camel@intel.com>
References: <20250918144221.2422710-1-emailaddress.ashish@gmail.com>
	 <24267.1758609024818415904@lists.openembedded.org>
In-Reply-To: <24267.1758609024818415904@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|SA0PR11MB4750:EE_
x-ms-office365-filtering-correlation-id: 5ed7c9d6-bb49-451e-6efe-08ddfa6b216b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?bk1hVkVYZmpWRG1sa1MxdnpJeGhEaERlV1lDWWR5UzNiZEpvVFdYVkpuSkVr?=
 =?utf-8?B?NCtNVUFpMUxJQ3NkQ0xxMkxWSzE1K3BaT3ZuNnZSUkZFU0M0cWFMRUN6SDBy?=
 =?utf-8?B?UTN5WG1LdXRUS29xZDZ5K0hGN01xNng3U3FrUG90d0dVajE5UjFGOEJOVEpi?=
 =?utf-8?B?Uis5TkNabjRNMGNndDBHMVUyR1YvUjI1QjRrQnEyeDRTb3M0QlN1NGpadmVV?=
 =?utf-8?B?elo0NW1aR1dyb3pPdVJINHJXdXBLWUlZQVhQU29OdFBlaUF4SnpjVzFPS08r?=
 =?utf-8?B?dUM4YWszc3VkbUdoZEI1QUZtZDBsV2tub0NSaktrL2lOMnp6VFVpTk45Rkll?=
 =?utf-8?B?SVpkandoWTVvSkVQQW15K0s0eDEyREhvc0FhQ1Q0RzNQNldYMkMrS1BxMXdM?=
 =?utf-8?B?MDNXTlNVRE9pVHlxNkQ3RUhCSU9STTNsbHNVcDU4TFdFYk02MHRzbWgvU1BK?=
 =?utf-8?B?UTRmQTJnakdTY09HOGY1UXpnVlR2SlJqL2lYODJsU0lTaXBYZmxFanJLRjFW?=
 =?utf-8?B?enFUZ0xDWi9sOW1jZi9mT1NhYmt0RmpEam90Rzd0TjFmSkwzRmZwUUR0bFNR?=
 =?utf-8?B?alVpS1cxVlZjUVQxZUF0bGhOT0pZZGZEb3ZYRXE2OS9FLzN2V3JxTkV0bjRv?=
 =?utf-8?B?K0xPM0FScVNWaTlOS0pjVTg4UmplaGdiellHUjZ2TktHZTFpWnRjc0FuZDU1?=
 =?utf-8?B?T1lSbmN6dStLVWk4YnJOaUxuVnBxZTN3S1RNNkh6dHI3YXcvTGRLY082elhG?=
 =?utf-8?B?bXY4WnMxZ1NCUmtYM2t1Ny9LR3lqQ3ppV05nUFRIT2pvYTBZaElPU2t0N0xT?=
 =?utf-8?B?YVVYa2MvZVRqbWxJLzcweGJmc2RqNTBma0F6ajgxQW82bzNGbEx1d1c0Ulpn?=
 =?utf-8?B?Y1kxOW9GSWVHdHF3b2dndlp6SVZPZjB2YnF2UDBkMG5PT0dEeUliVlEydDBi?=
 =?utf-8?B?WW52K2xZYS85dDNJQjRyRXNPOUc3QjhhV2hqeUZTTDY3cE9SRFhQN3pwR1lR?=
 =?utf-8?B?dTdUbkl3QzVjRUxZNFF2L0pNSWsxcTRFU3R1TVAvTlprWUhDSXNWUjdUT2FS?=
 =?utf-8?B?czFZeGZud3FrOEl5amdQVTJ6ckVTTG4yNVpOR2RpNmxNNlZ5dStteDV6ZHRs?=
 =?utf-8?B?VDVWYTdxNWprcXJLb2lUeHc0NUJOOGt2VjRNL3RiU1ZVNk4xcTNaVW4wOWdv?=
 =?utf-8?B?REwxRXJZQS9qVHEvSktpNlRWd1dhQkpUbXFqT3pNOFA5OE9Wd08xTm43aER2?=
 =?utf-8?B?WStJVHhMUXJSNHBFKy9CZ3F1NnVGZnptNVV6bGpaSEJ0eURtTEVPNXU4VlV4?=
 =?utf-8?B?cmlpaWFZZFRub09HZktSaXNwWnJtT0VWZFlOWVRBYUMwOFpadkhLUUtqUGhl?=
 =?utf-8?B?YXNKclJIK3RyUTFZbE1HaERXWkpPc1NoQnIyUUJTajV5K28zdUpjQWRaUFBW?=
 =?utf-8?B?dVdmYkNqalBMK2ZKWDBXc0dmNkthVVFKY0NIbmJqNzE4NmpCQzFvRDRwMWJI?=
 =?utf-8?B?dUozYmp0OW94bmVraG1JdW1aOHU5UGlqNjJaaitUaXJpU2ZKUGhHR2xKbkxr?=
 =?utf-8?B?WmlJZkdCZzUzTG5hSVFvdHdmMnp5VER1Yk1HMDRNZWhtU011SkpvMEhwK3pH?=
 =?utf-8?B?ZWI0QUthWXkvdTdVRUExeFdXN3JtOTArWVpxbmtRTm93cWJHSUMraERtaE9I?=
 =?utf-8?B?aVQvd1YyYm40cXBoY0hFM0NtTWQzZTJkZFNURmYzUlJPVXp2RGxzZjJTbXBr?=
 =?utf-8?B?L1A3NFZoMnVpWmRWUCsvV1E2a29TV1JJeTFJYXNrZm5SK2FrbjhhZExoS0py?=
 =?utf-8?B?WHI2QkFjdTFjVTlJNjRYY3pwL1JMd21ia1NETXBsbFZvL1B6cXBWanRxWW8w?=
 =?utf-8?B?dEQ3cUMwZmtUTTVHNTJvcUlsNFpxcXowOFFDcStLQU1TMGVtVjZOS1BXS1hs?=
 =?utf-8?B?OTJHQ1RuRWxqOVBWQnNiZ2Nya0lhYWN1cWgvN1N5aXpZcmVyakREaldJV0Nw?=
 =?utf-8?B?L1dhMitlMmNnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eDNxR3lEbE02RnZsYjIySW9PazNUM0lEVlJkZm15N1pKQmoyT3k5Ym92bzdw?=
 =?utf-8?B?anloS0RDeGpJeGhwZVg2TC93MUNHWnp1Z3RvbFlZYjNDYmNKTVN1ZHk0Z090?=
 =?utf-8?B?RGt5UnpoR2R3UVNSNlVXT3ByeFo3K0d4eDhldFlNOVRqVm9kMUlJTlhZSEUw?=
 =?utf-8?B?Zmc2T2hhejNySU5CTlQ3VmtkUG5UWnFjZVptTGdKc0pwdUtpMXQ3UFhnWlFZ?=
 =?utf-8?B?QXFuY0YvdThBWGdnMmtEODRvczZsNHNGSEFLWlBiNW9udUhIMVRkRkVzVlU1?=
 =?utf-8?B?TU5NZUgyYW8rMFNUNW9PT09uZElGVStoang5eXJabENYU3UxS05WcUhWc1Ry?=
 =?utf-8?B?Mnk0dFlRUmNuemtYSmpTTk1SanF1VTdkaVYzVHpZaGFBTzA4aStVZmFRTkpw?=
 =?utf-8?B?NjdCejlENlVRcVJ6TEpZMENUTllMS1RCa2JsWGhmTmw1ZFdmWGhYcDhXV3Nu?=
 =?utf-8?B?U2tZR3djLzh4aHlDSEJzZmVSSzllbHVpdEwzNERXQk5YUUVoMStjem9hYk9Z?=
 =?utf-8?B?MUpYVXVVOXJ2azV4UW91Q2JldWM0MUcxU0lnZS9zMXRwZTcyOGxaM3oyNnRZ?=
 =?utf-8?B?Mk5VZzU3QmhwbndWMlZyWDl5NVpMMEp1TjdEcGdmZjlaZmdzSU90cTlQbXIz?=
 =?utf-8?B?ckV5UzdjRmZCdVB6SWhBc2c5anhPR2xaOFZnWWhDbjh6b1E3OFM5YlhWSlFo?=
 =?utf-8?B?ZnJWSFJjVnBrd3Z5elhPa3hhYysyNHFpaElDelJwNnRubkFjcjBLWmcyTFlN?=
 =?utf-8?B?U1UrZFMxeHJ4N09ORDE2ZWZBcmZRRmx4cnMveDkvL3V5eDl2STR3ME5RNTNu?=
 =?utf-8?B?OUtrZUgrcExtcmFHSXdnbjNNajNGWGkvOHB4SkNTYkJ3cGQvc1ZqMDNQNDI3?=
 =?utf-8?B?akJ2QjNJQWxIRytTSjhjYTR5Z0lPcXpBUmNUK1R5aE5qNS9JdDJNNmdXV2Zl?=
 =?utf-8?B?Mk4vc3gyVE5INk5SS2pseDVHayt2Zkx1Um9YKzQrYlZxNFB6MmNWdHRicFhP?=
 =?utf-8?B?ZGNJTVZWN1hDSm5wcVdSRXp1SHRsUDRWSjc2UGgxUENsWTV2WTdCTGR0NEV6?=
 =?utf-8?B?YXZ3VFhvbVY2cStsSlk3UHRJYzlqR0pyU1o5RGVuVEx4UlZ5UXJpSjlNMUIr?=
 =?utf-8?B?V2gwbkR0RHVWalE3aFgyVkV5cnN6R3FhYS85RHExVjJXNTl0M3RZNGtPRGpZ?=
 =?utf-8?B?dTJxREtXUDlVazNIa0tMK3p1cWpxb21FM3lGYUJQdjdPOHYvZk50YWtSb3hB?=
 =?utf-8?B?Nm9GckhBdDBhVjhUK1VQOHlaOThsb1FxTU9sUkdXNStVZFNHdEtUWWY3QXg0?=
 =?utf-8?B?TmFWUGZBUnBqakxORUo4ZzNWZW8yQTlJSWkrdkFndG1pYVI2TVBIOXhuRFZB?=
 =?utf-8?B?dEVsZlN5ZjNqcittd0VLVlordWFJUURYTUxzYnI4THJmd3E4dndhUmRZaFlo?=
 =?utf-8?B?andYRFliTXBUNTF5VzRXQ3JQRGxWV3lidGVPZFBXdFltOW5INmVQQkxUTkRY?=
 =?utf-8?B?akxSL2R4bFBwUDcyaGhLbXhxc0pBdys3ODBTRFlqT1ZuRVRzL0FKcXcvd05n?=
 =?utf-8?B?S1A0b2FxYmlZOHdFdU1RRzc5azBvQTFod3pqYjQ0VjJMTzhXTitiNHB6d1pk?=
 =?utf-8?B?TDlGOEU3aXB6cmo5ZnlLckkwMWxBalJVTXJrbnFSSVhPa3pEOFJmdy9qeUps?=
 =?utf-8?B?U1VzNWQzK3oxNWZXcXNLSVdITlVSMmZVbHhYbmNqZ3BneWJRK1d0ZndWZURm?=
 =?utf-8?B?M3p4NjFWNWhwWmNZYk1DSU5ITlhzV3ZsOVREcXRzWVl4UjV0WHRjZXdlSlox?=
 =?utf-8?B?RHdLaEQvYmlEZ0IvL3lkanBMaVZidUNPalJtLzF0MU1GZ1hWbXFOUUY0ZTJQ?=
 =?utf-8?B?dFZnT1NkV25jaURFcThqSzB1WWtGSWFsOW56bm53OThPanpVdEZhcUNINVR6?=
 =?utf-8?B?Y3ZSQzJuV2t1TTZhd0JBQXl3ZGNDeldwVjdjVEpkY3NXUjJiL0NlQnBhYXpT?=
 =?utf-8?B?QVl4YVF3amxKTWdadVJvcmc5UWplNnROVlZOWm1KZEZadHVVZ2lBVk9PaS9Y?=
 =?utf-8?B?R2hUbDJwS2pFd1VZbFhRdlQzYy90SGpFYzVMTzZKTDdWWnJBUUxzWWZNR09i?=
 =?utf-8?B?Mm1qVk5uSU9hZ2NzYU1oMlBkVjlQdG54dHBqaytpRVFneDVSeDlyVlF0UHlK?=
 =?utf-8?B?NFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <55AF0A66B72DC945A1B568F7BA134E35@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ed7c9d6-bb49-451e-6efe-08ddfa6b216b
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2025 06:33:38.5420
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ko2CERw/STig50oF55UjhgQmK4HkHr7eFfy6Sz8fi5zGBuGyUfMb9vI/nl+6zKtLqlco1upG23Z6XEt+pBzB8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4750
X-OriginatorOrg: intel.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 06:33:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119652

T24gTW9uLCAyMDI1LTA5LTIyIGF0IDIzOjMwIC0wNzAwLCBBc2hpc2ggTWlzaHJhIHZpYQ0KbGlz
dHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4gSGkgQW51aiAswqANCj4gwqANCj4gQ2FuIHlv
dSBwbGVhc2Ugc2hhcmUgeW91ciBjb21tZW50cyBvbiB0aGlzIGJhY2twb3J0ZWQgcGF0Y2guDQoN
ClRoYW5rIHlvdSBmb3IgcmVtaW5kZXIuIEl0J3MgaW4gbXkgdGVzdCBxdWV1ZS4NCg0KVGhhbmtz
LA0KDQpBbnVqDQo=


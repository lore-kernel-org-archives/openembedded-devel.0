Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2936CCF9F0
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 07:16:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by mx.groups.io with SMTP id smtpd.web01.18362.1761808590903856185
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Oct 2025 00:16:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=K8rp5I/n;
 spf=pass (domain: intel.com, ip: 198.175.65.20, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761808591; x=1793344591;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=AXyufi/dpE4wtNaGpTW6Et9ZWfpjFD8+1wcjr4fRDzk=;
  b=K8rp5I/nOobEeniGtFCl8nL9YtdQIvJMohffL8kU7WWeCnQUjO86mr/N
   GsF0TY+FLLqwLaM39IuK56zZhsmPRqLsPSK5gr3AMB7XinrvRNV3jWwxj
   ETlX96d6rMzRk0TczP38msUPIxtQ3xpJ0lzbfXoouZmQMYiRSGHybantO
   ADnbT3aCgwyapcOcXW75pFBKpF6TbsOgkEcGQ7DltdT4fxSmaOYFaDS82
   fSKY73L3vCgXKtwo/kCFEsv4rRaDzqwboQED4PkH2sikFW/CQZqB/Z82/
   7StpxvMos+WFp8CYDXj+/D8dwSk/L//NdiA1hDUj4Enrk3SCvCSE0G0Vb
   g==;
X-CSE-ConnectionGUID: TaUmS1KZSVC6NvRZGWhoAA==
X-CSE-MsgGUID: EnnOVqHqTXyEgVMoRYdpkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="63641065"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; 
   d="scan'208";a="63641065"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 00:16:30 -0700
X-CSE-ConnectionGUID: D5kyLxU8S3SROX+q+zx+Wg==
X-CSE-MsgGUID: WvBPwMySTZSnVX9UBcdo6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; 
   d="scan'208";a="185758693"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 00:16:30 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 00:16:30 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 00:16:30 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.55) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 00:16:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g1wXcNFarXItJClrFWwIH8pM1vkIGWhDfmQyMKULkMbx52SwLJlXSk+v24LKmnytLLYNmhlw3zhEl6wG8W5mT8X86YkgK5tFVrLv6qypILthpXppiNwW84xzjPEwIgqRTQ/JeYTpSyX8Fa9Lci8y2Qt+iU+6oVq6nhFZh3eBJ4PfE5xc74nPVcIJEb/8DQ3SOJXgbC1UEv/R5+qkH9U+2Vk7aQRgKFxXFu9s0ah+/4qbxJQoKsFXCeoOepu6ZGawwatSrZKxtY1pNr9ge+C8UEGUzkFVOzyDp6z+K6AekJiOZjH0alDtidTIVOLjupfhKfHg5FJUMdIwD10BCfd8Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AXyufi/dpE4wtNaGpTW6Et9ZWfpjFD8+1wcjr4fRDzk=;
 b=FXuSxp4RVBlwMZnGnDRxBrTdxzcIK3k2MvMCFDYVrDXVKExw1i7s5qX+/y8WPethjYkIKZ5Ev2AtOo0ARYFP8LYHf/H105vvNlyImSM9Uo9ble/SDXd72gNsJhi4nw4tMXjnGOS7duO7WMLN5tYQqOky21Akia5IP9lRpyMUAuWTxcrC1GFI7wa3rd8k3bG6u/q70hedFGPHl6bLXIM9vUEkuEKlOmZC1KljgiFbL+xA9rS4ncC0N0OWXXJ3blio8ZpePvbylCI0aGGpkd8xO61z3KtWIiNsx1tw3acFYtXbcJnx546ikBXRzTFxumDJgm4cfyE1lOf2ffzDzjD05g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by IA1PR11MB7891.namprd11.prod.outlook.com (2603:10b6:208:3fa::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 07:16:22 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%2]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 07:16:22 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "ankur.tyagi85@gmail.com" <ankur.tyagi85@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe][meta-python][scarthgap][PATCH v2 7/8] python3-django: patch
 CVE-2025-59682
Thread-Topic: [oe][meta-python][scarthgap][PATCH v2 7/8] python3-django: patch
 CVE-2025-59682
Thread-Index: AQHcQ6t7jy95VlvTSUOL3uudvNnCt7TaUtiA
Date: Thu, 30 Oct 2025 07:16:22 +0000
Message-ID: <55399ed3eb7a13cd570872e691416f3090e8e52f.camel@intel.com>
References: <20251022232633.1703690-1-ankur.tyagi85@gmail.com>
	 <20251022232633.1703690-8-ankur.tyagi85@gmail.com>
In-Reply-To: <20251022232633.1703690-8-ankur.tyagi85@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|IA1PR11MB7891:EE_
x-ms-office365-filtering-correlation-id: 9b2bac63-e26e-4ef6-332b-08de17843b1d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|4022899009|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?Wk1ESkNlZFlOTUFJa2I3OVNHN3Q5alpJT2FMTzdzVmRxV0NzTVRIYmtyMzFM?=
 =?utf-8?B?N0lQQ0xESFBtWElSQVNPVWRzUHQ0RzJtRTRObFZaajJRUzdBeUNrbFlCMENU?=
 =?utf-8?B?a05lSDV5RDQyVHBUejZMRWJEV0EzWUZJZXlpNDNYME55Si8vQkRXQjVHNnVE?=
 =?utf-8?B?V1FlaXlBVWs2enlPUTdXMEdpbnAyOG1WYzl6U0tUR3VqWWhWVm9KRm82eXk4?=
 =?utf-8?B?akZTK1RGQ01TbHFMNUZHbHZRWDd2aXplbHBuaFJ2M203Y1VDQ1NwSFlKSnJm?=
 =?utf-8?B?V2l0Y0tiNXdRL1BhdGovekVOYkxMdzAzUTcrSFgwbGxoMWttdS9OVUFaZUJK?=
 =?utf-8?B?czRydWpNbW1rSWRuQklWVVJYRkdDK0I3dmgrbzlSRVZaL1laQkQ5TW43N093?=
 =?utf-8?B?bFRVMlRlZTNsaWh6MDE3dWh6a3lKUXZIbzBjWlFvOHdlNWxMUm9US05UTVdu?=
 =?utf-8?B?Q3E1dGJ5S2FTeEw0bSs5SmtyV08vUFhkYVM5RWg2YlZPWmZzRnJoQkk1T2pv?=
 =?utf-8?B?N2FBMG0wb2ZVUlhQV2Rab3NUdDg5YXlIOEgyM29PUC9xbWNSLzlBdFFwSEo4?=
 =?utf-8?B?alhaY1BwbjZLcnUvRDg0WitnWjM5VDZVVWxDZXFQMThJbmpra0dqc1hvNE1Y?=
 =?utf-8?B?blJDRHRQZHZ0NlBYb0E2dnZ5OWNIYVM1NHdhY3o4RjFRMmtVOVZUb2E5UHlu?=
 =?utf-8?B?OUtNNTFBWGgwYmM1VHRQTU43YVFRbGYxKzQxR01oSlFJdjN6bXhnNjVUeGZV?=
 =?utf-8?B?T2hmbHM3ZFRRcXBvVytxMnJteCt5WWRlUXZoeDBzTEJXM1NoQitsZGJTUERZ?=
 =?utf-8?B?dmtVekp1VzVUUnh3aUpQUEI4L09tY1I2NUkrbHB6dmRuL2tJR0xwdzkwNjBs?=
 =?utf-8?B?Mzk3VjdUOEg2N2wzbk93WkcvUENSM0tocURzL0Zyclp1dUQyN3dxeHpDMW9B?=
 =?utf-8?B?cEE5aTRkdXlaWlBLVkZ5SDFGdzVVd3YxOWFqR0dkM1pHUlVTd25GV0JmUWRV?=
 =?utf-8?B?MXN1Tkl4YnhYUTRtME1UajlodWZEUGpxWlI3blhHUzZGZS96UFQ5UmplK3kx?=
 =?utf-8?B?eVF4bm5NT0gwb2lzOVh5eEs2VW9wN0UzM1hmN1BBOFBHK2FqOWFZSS8yd0hF?=
 =?utf-8?B?ZmxGaytaRlUwd25qME41cW0xYnpQcDE0RWhZNUhaeFVoU2JRMkhXUkpGTEpu?=
 =?utf-8?B?MTlFRzVuL0VweHo4cU5CVm1NeGY5NjdoSFBJdStOZk5OWHhkT0RxZStydzdZ?=
 =?utf-8?B?SGw5bkdGMmo2Z2ZVSU9LcU84SkUvajVhT1l2VG1VRDdOKzFJekR4VGVOYzNu?=
 =?utf-8?B?SUJVOE84NmpTNG9wQnY1SndnRWszaXdHOWU1eHNZQytKZmQ2elNaVjdTYWxR?=
 =?utf-8?B?ck1YVCtMY0lSVXpIbmMwcFIwYU51NUR0S1ZPdkh6ZHR6c0VtMFkzVG15NFFV?=
 =?utf-8?B?NXJBWWxndElLaWRVTGtnVm9DOXBKK2lqenh0NHk0S2xNWDZqSFg2Q0tMOUdj?=
 =?utf-8?B?Zld3VWR0ZUJvVVVGUUI5QzYvY0VOOXdRS0k5WmZFS1FlK1k0cm5PaUFURXB2?=
 =?utf-8?B?ZkYzZytnM1pkd04xYlZMbUVNZGtoM2NmOTBaZFZBKzV6b25kVmJmcmhOQ1Ew?=
 =?utf-8?B?RVl6TFMwMk5JQmRWdDd0RzVJY2xWamVDMkJGUnZQRlRkSDFSNDhYaU1lNXRK?=
 =?utf-8?B?MjdsVFByTXBwOFgxVmVtUlZmbnZtbHhtcC9uVGRnU0ZYY1dSWStpekpMMGov?=
 =?utf-8?B?eG5aREZZT0ZmME1lR1NpWjNNQkhoYnJiRDZydkR3QlJwa2s2YmJGQUFqWFpy?=
 =?utf-8?B?MFBybmRtQXpib3BEMXlmRFZKdEYwSmJ3L0dNUnBvSEdSTzJnZHJLTXZDZHc0?=
 =?utf-8?B?Tk5wSUFvcVNpSzRtWFREVUEyNjFkR0swRDhPVUFYTWhVYXdQa0hGb1lWQVZv?=
 =?utf-8?B?YXdJdUlucEppcGtocngxNjA1eSttRGo0Nm1CbXZMam1iTnU0LzlZTGJab3Vo?=
 =?utf-8?B?eHRLM0ZtcmhBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(4022899009)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WW1ZV2lmYjNKYk5Ja0ZQdUo2bTdHRVdaL3pXQzYxWlExWlJqNFA1a3hCR05z?=
 =?utf-8?B?azBUQ1BkOGNpaVdZWjBVZ3k5RlE2SjBRV1JObndkajZaam9qVkVSdXYwc1BK?=
 =?utf-8?B?VGVWd2xFYjlCbnJ5ZUNwZ0YzWjBUWHgrWUpKbHhONmpFWFNzTkhIZEZKaUpk?=
 =?utf-8?B?VDR1SWlXTmI5OXdpVTRlc0FRUld5cHRuNjdmckdyNWZMNmY3V1dtL3BTT1hz?=
 =?utf-8?B?WUZtQXZvWFJtNXlnWEpwd1Z1bFNnMVlvUmlHMjFNNlRlVGFvTU9nL0wyZjVN?=
 =?utf-8?B?VWI5azJybjdVT1hQREFRTlhXVllvS1VkUGwyVlRuaHRGMHF1UFlROE5MMEpD?=
 =?utf-8?B?VUxwWEZuTFlqbUFlUDlDS0R2Nk5sQjhjMHR1YmlvTWxLTjg5YUY0ZHh5RU40?=
 =?utf-8?B?bUdvTUJIRWw3ZXpVT1NXbmt1d1pGeW1DbE0rOE5mOERzeGxCdmlBYmxodDRX?=
 =?utf-8?B?Ym5oK0l1T0V4bXUwRmR3VjA4NlQ4Q1hUWGxOQzBXMTdDQjFFUUxadmVIekdi?=
 =?utf-8?B?RDBrdFJOMjNsWFhPbk01UnpoeGhCc290MkRSOUtUWDc3QjUxaGRGclY4RC85?=
 =?utf-8?B?c1ZacjJnNzJhY1NCczVKL3psNjNpZWxMT2xITDFGay9KL3hvUW9aeFkvWkQ1?=
 =?utf-8?B?bnRvWFo5cm1xcm50K3BlQzhQOVRPTXhEYVRxSGpCSm96SzVvZk8zS0VUZkQw?=
 =?utf-8?B?cUp6QkpUcy9nRE9oWDhHK0UrTVg3eE9MRFF0RXJTVmhzdGFQWXFXRVBFRWVT?=
 =?utf-8?B?RDFQbWRqSk9jeUxiTzB0U2ZxWVlmMW8zZ2c3NVNVYUJrZWt1N0ZyR0NkTGxq?=
 =?utf-8?B?bDBMRkZxbDNxVjlrMnU2TXRTVGUweVZKOXJPeXdnNFJWcWNPU1ZSQzRpSkFs?=
 =?utf-8?B?UVQvZm1uaDBtNTRJeW80b002OS9hUWhMMkd5SG93NVAydS92RGw1SlJCeURh?=
 =?utf-8?B?VFIwdElEWEIwcFl0MDFJOHZxMnhXZjJHSjd3L21WQlFOVmQ5UW5odnFCckhI?=
 =?utf-8?B?OU05T3FKZjZBbmlZdUxLMDZFL3ZRQkFnWk9mZ2NVUDNpY0FGZldhVDNlRzFm?=
 =?utf-8?B?ejVDVHorbG5LSTltV3lSbVgwS1F0c3k2b1dkVWc0R05YZU5rVlJXZCtHa1dp?=
 =?utf-8?B?U0NPWlN5dnNhSHd5RlJmRE9vck1SdUVQMDhoSGlCTTY0NCsxbXRSd0ZuazJo?=
 =?utf-8?B?WUs4R0dpTzhBbTk0TWsyRFQ4a1NoenREV01kVnpVMU54RU5Hc3JSUWlqRS9T?=
 =?utf-8?B?dFNLUDc5dE5URnI3R2FFZHNEVUVvbno3aHlSNGNNTW51VDZLYzAxM3NWdnJw?=
 =?utf-8?B?aWd0SUpZQ0RJU0ROakdaOWZ0clY4WkVmV2cwVjEyWnpwWlduRGxmQnRtM2wv?=
 =?utf-8?B?Skd5MXV4M3RsRURucG5Sd1A0cGlFZmFNVGJrY1E3bXp0SGNocnFFWjlMK1RB?=
 =?utf-8?B?aitUL1hVRXdFeGwxelVnOVY0TytiTTR5L3NhZGhvWlNqMis4ZHJlOHkxTjRD?=
 =?utf-8?B?RTdzZjJ0WnF2T0RNOWtScUhzM3V0TEFGWmQweWxBbkcwN3RxemcvZDM3Kzk5?=
 =?utf-8?B?d0xuVmNIdmJpNnd4T1QrMjZmUC9vTEJrQzBONXJOYkNJOXRDV2F5QkRER0Rx?=
 =?utf-8?B?N0hRbEVTYVNHWm9jd2xCMG1iblZXWHpuRWp2TjFOSGJ0WW81REZGcmEwSG4z?=
 =?utf-8?B?UmM1bngzYmtiYWlqSWZuSC9EMThPL2Fra2VSWE5yY09nbE54U3QxVU94TDh3?=
 =?utf-8?B?NytzRU1XZGtaSzExOFZnTFNYREJsWnl6TlVLcGdrc2JPemlTQUdaVDRnUzR3?=
 =?utf-8?B?UHcraFV5VTF0YnQ4dHVONklzQlV3WlZYSWErUGNlQXFUNUYxYzRKYjhvN0Zw?=
 =?utf-8?B?SnRtWFdWWVhpdkhOUU94TVhnMFZZNzBZRFhiVktlRnU4dC9Od3NWVlFJdHNU?=
 =?utf-8?B?VGdpY01SeU1VOG9RVDJQUC9SaFo5Y3BENGlQVVgzazVuakR1NUlLNEVzdGdz?=
 =?utf-8?B?cC9RajQxREVKRSs1alZsMGNtQXlMMDFEOS8wTjRZYWxBbHBKKy9vbmNtc3pC?=
 =?utf-8?B?Y0ZQQ2xUU21qMzdGRG9DMUU5eW84MzR6YStnOHJCakljZTFXR05MWnJMNUFi?=
 =?utf-8?B?VVhHSnB4WkhtMytZR3MyaVF0QlhXeFEwa2dPcUpzeDNvYW1WM0czWWdmNDc2?=
 =?utf-8?B?L0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <44984018F79AE04AB64626AFA4C4F8D1@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b2bac63-e26e-4ef6-332b-08de17843b1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2025 07:16:22.7597
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rBwL9Brj1M89CK+xYm7TByKyrj1jNC6Euk4MH0qZ6rvaphloIblRE6iC3uGRR4Gh2hb1VqqIpJSsnwVDYUmT1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7891
X-OriginatorOrg: intel.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Oct 2025 07:16:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121198

Q2FuIHdlIHVwZGF0ZSBzdHJhaWdodCB0byA0LjIuMjUgaW5zdGVhZCB0aGF0IG9ubHkgaGFzIGFs
bCB0aGVzZSBDVkUNCmZpeGVzIGFuZCBhIGZldyBidWcgZml4ZXM/DQoNCk9uIFRodSwgMjAyNS0x
MC0yMyBhdCAxMjoyNiArMTMwMCwgQW5rdXIgVHlhZ2kgdmlhDQpsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnIHdyb3RlOg0KPiBEZXRhaWxzIGh0dHBzOi8vbnZkLm5pc3QuZ292L3Z1bG4vZGV0YWlsL0NW
RS0yMDI1LTU5NjgyDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbmt1ciBUeWFnaSA8YW5rdXIudHlh
Z2k4NUBnbWFpbC5jb20+DQo+IC0tLQ0KPiDCoC4uLi9DVkUtMjAyNS01OTY4Mi5wYXRjaMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDcyDQo+ICsrKysrKysrKysr
KysrKysrKysNCj4gwqAuLi4vcHl0aG9uL3B5dGhvbjMtZGphbmdvXzQuMi4yMC5iYsKgwqDCoMKg
wqDCoMKgwqDCoMKgIHzCoCAxICsNCj4gwqAyIGZpbGVzIGNoYW5nZWQsIDczIGluc2VydGlvbnMo
KykNCj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy0NCj4gZGphbmdvLTQuMi4yMC9DVkUtMjAyNS01OTY4Mi5wYXRjaA0KPiAN
Cj4gZGlmZiAtLWdpdCBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtZGphbmdvLQ0KPiA0LjIuMjAvQ1ZFLTIwMjUtNTk2ODIucGF0Y2ggYi9tZXRhLXB5dGhvbi9y
ZWNpcGVzLQ0KPiBkZXZ0b29scy9weXRob24vcHl0aG9uMy1kamFuZ28tNC4yLjIwL0NWRS0yMDI1
LTU5NjgyLnBhdGNoDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAu
LjcyZjU2NmEwZTENCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9tZXRhLXB5dGhvbi9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWRqYW5nby00LjIuMjAvQ1ZFLQ0KPiAyMDI1LTU5Njgy
LnBhdGNoDQo+IEBAIC0wLDAgKzEsNzIgQEANCj4gK0Zyb20gYzc1N2I2MjBjZDgwOTlkMTdlMjAy
YzBmNTU4MmJiYWI1NTY0MDU2YyBNb24gU2VwIDE3IDAwOjAwOjAwDQo+IDIwMDENCj4gK0Zyb206
IFNhcmFoIEJveWNlIDw0MjI5NjU2NitzYXJhaGJveWNlQHVzZXJzLm5vcmVwbHkuZ2l0aHViLmNv
bT4NCj4gK0RhdGU6IFR1ZSwgMTYgU2VwIDIwMjUgMTc6MTM6MzYgKzAyMDANCj4gK1N1YmplY3Q6
IFtQQVRDSF0gWzQuMi54XSBGaXhlZCBDVkUtMjAyNS01OTY4MiAtLSBGaXhlZCBwb3RlbnRpYWwN
Cj4gcGFydGlhbA0KPiArIGRpcmVjdG9yeS10cmF2ZXJzYWwgdmlhIGFyY2hpdmUuZXh0cmFjdCgp
Lg0KPiArDQo+ICtUaGFua3Mgc3RhY2tlcmVkIGZvciB0aGUgcmVwb3J0Lg0KPiArDQo+ICtGb2xs
b3cgdXAgdG8gMDU0MTNhZmE4YzE4Y2RiOTc4ZmNkZjQ3MGUwOWY3YTEyYjIzNGEyMy4NCj4gKw0K
PiArQmFja3BvcnQgb2YgOTI0YTBjMDkyZTY1ZmEyZDA5NTNmZDE4NTVkMmRjODc4NmQ5NGRlMiBm
cm9tIG1haW4uDQo+ICsNCj4gK0NWRTogQ1ZFLTIwMjUtNTk2ODINCj4gK1Vwc3RyZWFtLVN0YXR1
czogQmFja3BvcnQNCj4gW2h0dHBzOi8vZ2l0aHViLmNvbS9kamFuZ28vZGphbmdvL2NvbW1pdC85
NTA0YmJhYTM5MmM5ZmUzN2VlZTkyOTFmNWI0DQo+IGMyOWViNjAzNzYxOV0NCj4gKyhjaGVycnkg
cGlja2VkIGZyb20gY29tbWl0IDk1MDRiYmFhMzkyYzlmZTM3ZWVlOTI5MWY1YjRjMjllYjYwMzc2
MTkpDQo+ICtTaWduZWQtb2ZmLWJ5OiBBbmt1ciBUeWFnaSA8YW5rdXIudHlhZ2k4NUBnbWFpbC5j
b20+DQo+ICstLS0NCj4gKyBkamFuZ28vdXRpbHMvYXJjaGl2ZS5wecKgwqDCoMKgwqDCoMKgwqDC
oMKgIHzCoCA2ICsrKysrLQ0KPiArIHRlc3RzL3V0aWxzX3Rlc3RzL3Rlc3RfYXJjaGl2ZS5weSB8
IDE5ICsrKysrKysrKysrKysrKysrKysNCj4gKyAyIGZpbGVzIGNoYW5nZWQsIDI0IGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkNCj4gKw0KPiArZGlmZiAtLWdpdCBhL2RqYW5nby91dGlscy9h
cmNoaXZlLnB5IGIvZGphbmdvL3V0aWxzL2FyY2hpdmUucHkNCj4gK2luZGV4IDcxZWMyZDAwMTUu
LmU4YWY2OTBlMjcgMTAwNjQ0DQo+ICstLS0gYS9kamFuZ28vdXRpbHMvYXJjaGl2ZS5weQ0KPiAr
KysrIGIvZGphbmdvL3V0aWxzL2FyY2hpdmUucHkNCj4gK0BAIC0xNDQsNyArMTQ0LDExIEBAIGNs
YXNzIEJhc2VBcmNoaXZlOg0KPiArwqDCoMKgwqAgZGVmIHRhcmdldF9maWxlbmFtZShzZWxmLCB0
b19wYXRoLCBuYW1lKToNCj4gK8KgwqDCoMKgwqDCoMKgwqAgdGFyZ2V0X3BhdGggPSBvcy5wYXRo
LmFic3BhdGgodG9fcGF0aCkNCj4gK8KgwqDCoMKgwqDCoMKgwqAgZmlsZW5hbWUgPSBvcy5wYXRo
LmFic3BhdGgob3MucGF0aC5qb2luKHRhcmdldF9wYXRoLCBuYW1lKSkNCj4gKy3CoMKgwqDCoMKg
wqDCoCBpZiBub3QgZmlsZW5hbWUuc3RhcnRzd2l0aCh0YXJnZXRfcGF0aCk6DQo+ICsrwqDCoMKg
wqDCoMKgwqAgdHJ5Og0KPiArK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgb3MucGF0aC5jb21t
b25wYXRoKFt0YXJnZXRfcGF0aCwgZmlsZW5hbWVdKSAhPQ0KPiB0YXJnZXRfcGF0aDoNCj4gKyvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmFpc2UgU3VzcGljaW91c09wZXJhdGlvbigi
QXJjaGl2ZSBjb250YWlucyBpbnZhbGlkDQo+IHBhdGg6ICclcyciICUgbmFtZSkNCj4gKyvCoMKg
wqDCoMKgwqDCoCBleGNlcHQgVmFsdWVFcnJvcjoNCj4gKyvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
ICMgRGlmZmVyZW50IGRyaXZlcyBvbiBXaW5kb3dzIHJhaXNlcyBWYWx1ZUVycm9yLg0KPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJhaXNlIFN1c3BpY2lvdXNPcGVyYXRpb24oIkFyY2hpdmUg
Y29udGFpbnMgaW52YWxpZA0KPiBwYXRoOiAnJXMnIiAlIG5hbWUpDQo+ICvCoMKgwqDCoMKgwqDC
oMKgIHJldHVybiBmaWxlbmFtZQ0KPiArIA0KPiArZGlmZiAtLWdpdCBhL3Rlc3RzL3V0aWxzX3Rl
c3RzL3Rlc3RfYXJjaGl2ZS5weQ0KPiBiL3Rlc3RzL3V0aWxzX3Rlc3RzL3Rlc3RfYXJjaGl2ZS5w
eQ0KPiAraW5kZXggOGNkMTA3MDYzZi4uODA2M2RhZmI2NSAxMDA2NDQNCj4gKy0tLSBhL3Rlc3Rz
L3V0aWxzX3Rlc3RzL3Rlc3RfYXJjaGl2ZS5weQ0KPiArKysrIGIvdGVzdHMvdXRpbHNfdGVzdHMv
dGVzdF9hcmNoaXZlLnB5DQo+ICtAQCAtMyw2ICszLDcgQEAgaW1wb3J0IHN0YXQNCj4gKyBpbXBv
cnQgc3lzDQo+ICsgaW1wb3J0IHRlbXBmaWxlDQo+ICsgaW1wb3J0IHVuaXR0ZXN0DQo+ICsraW1w
b3J0IHppcGZpbGUNCj4gKyANCj4gKyBmcm9tIGRqYW5nby5jb3JlLmV4Y2VwdGlvbnMgaW1wb3J0
IFN1c3BpY2lvdXNPcGVyYXRpb24NCj4gKyBmcm9tIGRqYW5nby50ZXN0IGltcG9ydCBTaW1wbGVU
ZXN0Q2FzZQ0KPiArQEAgLTk2LDMgKzk3LDIxIEBAIGNsYXNzIFRlc3RBcmNoaXZlSW52YWxpZChT
aW1wbGVUZXN0Q2FzZSk6DQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgd2l0aCBzZWxmLnN1
YlRlc3QoZW50cnkpLCB0ZW1wZmlsZS5UZW1wb3JhcnlEaXJlY3RvcnkoKQ0KPiBhcyB0bXBkaXI6
DQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB3aXRoIHNlbGYuYXNzZXJ0UmFp
c2VzTWVzc2FnZShTdXNwaWNpb3VzT3BlcmF0aW9uLA0KPiBtc2cgJSBpbnZhbGlkX3BhdGgpOg0K
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBhcmNoaXZlLmV4dHJh
Y3Qob3MucGF0aC5qb2luKGFyY2hpdmVzX2RpciwNCj4gZW50cnkpLCB0bXBkaXIpDQo+ICsrDQo+
ICsrwqDCoMKgIGRlZiB0ZXN0X2V4dHJhY3RfZnVuY3Rpb25fdHJhdmVyc2FsX3N0YXJ0c3dpdGgo
c2VsZik6DQo+ICsrwqDCoMKgwqDCoMKgwqAgd2l0aCB0ZW1wZmlsZS5UZW1wb3JhcnlEaXJlY3Rv
cnkoKSBhcyB0bXBkaXI6DQo+ICsrwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBiYXNlID0gb3MucGF0
aC5hYnNwYXRoKHRtcGRpcikNCj4gKyvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRhcmZpbGVfaGFu
ZGxlID0NCj4gdGVtcGZpbGUuTmFtZWRUZW1wb3JhcnlGaWxlKHN1ZmZpeD0iLnppcCIsIGRlbGV0
ZT1GYWxzZSkNCj4gKyvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRhcl9wYXRoID0gdGFyZmlsZV9o
YW5kbGUubmFtZQ0KPiArK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdGFyZmlsZV9oYW5kbGUuY2xv
c2UoKQ0KPiArK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2VsZi5hZGRDbGVhbnVwKG9zLnJlbW92
ZSwgdGFyX3BhdGgpDQo+ICsrDQo+ICsrwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtYWxpY2lvdXNf
bWVtYmVyID0gb3MucGF0aC5qb2luKGJhc2UgKyAiYWJjIiwNCj4gImV2aWwudHh0IikNCj4gKyvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHdpdGggemlwZmlsZS5aaXBGaWxlKHRhcl9wYXRoLCAidyIp
IGFzIHpmOg0KPiArK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB6Zi53cml0ZXN0ciht
YWxpY2lvdXNfbWVtYmVyLCAiZXZpbFxuIikNCj4gKyvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgemYud3JpdGVzdHIoInRlc3QudHh0IiwgImRhdGFcbiIpDQo+ICsrDQo+ICsrwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB3aXRoIHNlbGYuYXNzZXJ0UmFpc2VzTWVzc2FnZSgNCj4gKyvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgU3VzcGljaW91c09wZXJhdGlvbiwgIkFyY2hpdmUg
Y29udGFpbnMgaW52YWxpZA0KPiBwYXRoIg0KPiArK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKToN
Cj4gKyvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYXJjaGl2ZS5leHRyYWN0KHRhcl9w
YXRoLCBiYXNlKQ0KPiBkaWZmIC0tZ2l0IGEvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy0NCj4gZGphbmdvXzQuMi4yMC5iYiBiL21ldGEtcHl0aG9uL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtDQo+IGRqYW5nb180LjIuMjAuYmINCj4gaW5kZXggNDQz
YjRkYmJmYy4uOTY0Yjk4MmZkYSAxMDA2NDQNCj4gLS0tIGEvbWV0YS1weXRob24vcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1kamFuZ29fNC4yLjIwLmJiDQo+ICsrKyBiL21ldGEtcHl0
aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZGphbmdvXzQuMi4yMC5iYg0KPiBA
QCAtMTIsNiArMTIsNyBAQCBTUkNfVVJJICs9ICIgXA0KPiDCoMKgwqDCoCBmaWxlOi8vQ1ZFLTIw
MjUtNDg0MzItNi5wYXRjaMKgXA0KPiDCoMKgwqDCoCBmaWxlOi8vQ1ZFLTIwMjUtNTc4MzMucGF0
Y2jCoFwNCj4gwqDCoMKgwqAgZmlsZTovL0NWRS0yMDI1LTU5NjgxLnBhdGNowqBcDQo+ICvCoMKg
wqAgZmlsZTovL0NWRS0yMDI1LTU5NjgyLnBhdGNowqBcDQo+IMKgIg0KPiDCoA0KPiDCoFNSQ19V
Uklbc2hhMjU2c3VtXSA9DQo+ICI5MmJhYzViNDQzMmE2NDUzMmFiYjczYjJhYzI3MjAzZjQ4NWU0
MDIyNWQyNjQwYTdmYmVmMmI2MmI4NzZlNzg5Ig0KPiANCj4gLT0tPS09LT0tPS09LT0tPS09LT0t
PS0NCj4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAu
DQo+IFZpZXcvUmVwbHkgT25saW5lICgjMTIwOTA4KToNCj4gaHR0cHM6Ly9saXN0cy5vcGVuZW1i
ZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWRldmVsL21lc3NhZ2UvMTIwOTA4DQo+IE11dGUgVGhp
cyBUb3BpYzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210LzExNTkwMjM2Ny8zNjE2
NzAyDQo+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtZGV2ZWwrb3duZXJAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZw0KPiBVbnN1YnNjcmliZToNCj4gaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQu
b3JnL2cvb3BlbmVtYmVkZGVkLWRldmVsL3Vuc3ViwqBbDQo+IGFudWoubWl0dGFsQGludGVsLmNv
bV0NCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCg==


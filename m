Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE1BACAC5AA
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 02:16:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by mx.groups.io with SMTP id smtpd.web10.7591.1758593781560249533
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Sep 2025 19:16:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=M7fwvmZK;
 spf=pass (domain: intel.com, ip: 198.175.65.20, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758593782; x=1790129782;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=XrVIsk41BAzZ3Leda8mBt/7OqEw7Dys53iSoYt3t9wY=;
  b=M7fwvmZKfBVhi4QlN9JWPCxFagcNODXTI9skUmrCOpv5XV+Kk7CIaqHO
   JCz911MOlF5QbWT2/Fe4/0qUCdYEk6czD2pG3bIr0Ho+EW9psCfnwn25T
   wtih3vFJh4UF1niWBzr4VD1Ofe/i0U/nP5we8EdkiAcnC5TUFbmt1rCl7
   JacX0p7isoE5SQ+GDF5WLKQHxWCcDR9cCQVIgGA3nZ5WGfbBSq4M5FMlT
   mamg37B4Zg6Inbi1FLku/L0t1ZtybtipLWiB1W+YdRhO5X35zNNXf+BJN
   V47s7yqBjV/FdvF1bChk3IWcxNdSQCzHU2bcEcjNIFMjKZIfCuoCbLk9J
   A==;
X-CSE-ConnectionGUID: C+srr/JVRXyhCjKiC8LR9A==
X-CSE-MsgGUID: +NBd+NKSR72d6vfOO58J2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60565556"
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; 
   d="scan'208";a="60565556"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 19:16:21 -0700
X-CSE-ConnectionGUID: NoPTTXdXTh6Ky0SMQT7otw==
X-CSE-MsgGUID: w9PdXxFLRBCCHH4iyZPB/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; 
   d="scan'208";a="176560127"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 19:16:20 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 19:16:19 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 22 Sep 2025 19:16:19 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.61) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 19:16:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PvBQB2/lTzTTNzKPW7h0tL+psMxUjnoDKhPuvOZ8ubsdtVMH8SU0cZ62+l9lT9VfmGDSjlXuBOHrHgvNAlVEPT2lmFIsUihntQuhgm5N4fqIC0v/vWl26g000KlC8rt6AZgrE4EDRIsdY5PZ19OSmy/n8j8kjkFydWJ1vyonYDjQe7TksQ4RyXd59EoPVd8bHuAohDhRMAGvKIww9vN7Z6w74a4qhSCGfbTIGG5ToL4/XeIERXaau1JBZna8ps89U7HqzW0xvjBRwbELTS8To8tQ++c19qpG4v6xWc/KdfxPYTDVTtR8IN4b8iynclkowspqOaPI72LIIGXaA1OiKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XrVIsk41BAzZ3Leda8mBt/7OqEw7Dys53iSoYt3t9wY=;
 b=kFa1i2Pg+D/zDT6LojfPDmiHnNLXRH8SkCXf7rmiBUKbi4i3b98362SVS8fHvN08O07OA7GtjfNd+EyIHDzhlD16MLZ4zDRgTQpukHoe2Zr4jBC27u9CvYT7NfWlgYXAwxX2ijBbVR64eo3Sx9UOwDAjJObZqtqR+p30ezDoVJMv0BPu5LAvl8PH/gRIraaq0VqbOiMLOkJkFnrNwwkfOPEw5HsMvqV/Ke63vu4cZOSZhju1E0GcXEZnfaHVYQ+3G+zFyDWVSTmyAHeYg6tj3SeoH09BbAwcrM2isM+7f8H6LuwmaIaJkLTOtUHXngofPjEN1TLfJBfvhrVr6t2bFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by IA0PR11MB7751.namprd11.prod.outlook.com (2603:10b6:208:43a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Tue, 23 Sep
 2025 02:16:11 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%2]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 02:16:11 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "spushpka@cisco.com" <spushpka@cisco.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: "vchavda@cisco.com" <vchavda@cisco.com>, "deeratho@cisco.com"
	<deeratho@cisco.com>
Subject: Re: [oe] [meta-openembedded] [scarthgap] [PATCH] cjson 1.7.18: Fix
 CVE-2025-57052
Thread-Topic: [oe] [meta-openembedded] [scarthgap] [PATCH] cjson 1.7.18: Fix
 CVE-2025-57052
Thread-Index: AQHcKVlI8ltt+12XvU+Hsb3SEIJv8bSgDVqA
Date: Tue, 23 Sep 2025 02:16:11 +0000
Message-ID: <4853c446e6ab7d5451db06684f6adf0ae77d1503.camel@intel.com>
References: <20250919113331.2357-1-spushpka@cisco.com>
In-Reply-To: <20250919113331.2357-1-spushpka@cisco.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|IA0PR11MB7751:EE_
x-ms-office365-filtering-correlation-id: d3d53d83-db7d-43a5-e4cd-08ddfa472a2f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|4022899009|376014|1800799024|366016|13003099007|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?dnNGVmo1d1owelVucWhHZnNxc1dqbmtVdTR0cTRLZU05RklJVTZUYmNPK3dK?=
 =?utf-8?B?TnRqMVpnU3RQUHVESHJVOG5aVnF3eTNoK3AvemhjMU5Hd0U0Q0s4YllrSUh2?=
 =?utf-8?B?bU1DMzNxR3VjMXRrWjdDWkJSNkNGcFI2Z0JJVHBSd1FqQTN6M1dKVFF4MnBY?=
 =?utf-8?B?d0N4THhuMVEydDN1VDlIaUI0alpQdGZZTmNFbjdkMDBXYUF5d1lGUTZxM0dK?=
 =?utf-8?B?MG1KV25DaU04QUJyTnI0M1NKWFFtYnZMRXdROWFEYy9OSFhvd1ZtbGZESlJk?=
 =?utf-8?B?UXNmTjY2NEVWekV1Q3dQeDQxTXpHVGI0NHBGSzdVUURkcXRRTWpSZHRaQkdp?=
 =?utf-8?B?YXlkSnhBS3IxVlY2OUxaV3JUc3phdkF3ZVpiUDBmWkNXd1l2VURiRnd4Nncw?=
 =?utf-8?B?NWhxeXdKNHcrS3pCY1kyQ0krRytNalBYK1NEWFdISU9jZUROZHNQbUVXK3dk?=
 =?utf-8?B?WnhqUXVGbW1LbjVTNnlNYTZBMGIvQXBsZkRvV3NEV24yV09qTTNTeUtXRGFI?=
 =?utf-8?B?Um1jNUt3OWZ6eFh4dmNFYnhyYmp3bjdsRTVKUlROdWgwd25SWmpmNW51SURz?=
 =?utf-8?B?ajA3QUNaMktDaEJES0xnZVRlaWVPSzVvcUhDSm5aT3VYb0Vma0pOR21TS2RG?=
 =?utf-8?B?VkpNWlF1OElxcnUzK0xOem1Rckc0U1phc2xqNGE4RlJ6ODdBaGVzRmFpVDRH?=
 =?utf-8?B?VnR5N2huNlUxN2JsYm0zR2swRXRyYllVR3RYQSs0QW91cmVzNFhMTFJMK1RZ?=
 =?utf-8?B?VVRpcmFFRTZQVVBMZml0QklJa0VrZk9DeGpWeHo2V0REUnhEMk0rb2grZ2Jj?=
 =?utf-8?B?aWt5R2YrZi9EY0ZVU2dVVmx0Q25UUmx1UFVhcEFvaEg1bTFLNE9JS2lhNFpK?=
 =?utf-8?B?YUlLL29vTUZtei9NZzdKODM1eGs5UDFTYlNCMzYrMXZEUlZ2M1pSRmdFSExX?=
 =?utf-8?B?ZzNhbXNCM251WUgyWWt0QytVejBUSGZyaVYyTnNTYWYrM3owZGN3ZkZaaHIx?=
 =?utf-8?B?cDBhamNRdGNEV1BmWW1mYk5malpRREhLdVdmZ3ZLSmZ6NGRYcW9hSEEyN2Ra?=
 =?utf-8?B?Q3BDK3N6ZHNCdTA4Y3V6SGdCZWphbHlpdTJ5UG1sZlg0Z2h6V0NHL2FqcHZT?=
 =?utf-8?B?WDA0aUZraGNqeHdvUHByWEc5dVlZc0RFdDJGbGxNK0JUa3ZRSUJQVjFwNEVJ?=
 =?utf-8?B?YzY3TkpJNTJkc1V2bGxydGVJL1FDanpEKytGdFh1OHJoejBnblczUGtaWWRY?=
 =?utf-8?B?eWYyRE0zdUZkaDZxbXNKSHdsem5WS2RqazdzTVc3bFlLMDFrRzNBeGE0TVdU?=
 =?utf-8?B?dUZCcVpzdUVidnhrVCtYYmRkaWpIWnluYUFxSnBjOFdnTWJwZWt2bTlldG5s?=
 =?utf-8?B?UlkrazdrYmFVUDFUNi8rU0pDbDZHcGlMY1RSOUVoVlI0Rm1id010WUE2cUVW?=
 =?utf-8?B?ODJIdktqNDc3R1JBenhwVVFwM21lRERYV1o4d0g3eDVEb0VQV3JPUTZkeC9N?=
 =?utf-8?B?emFyeTB3Mm1NYkd5SWVlckRqTktPczcweWVxRGZVcjFUSkV0eGF2R252YXVQ?=
 =?utf-8?B?elZpNjM0ckZpL3NMWGVjcFpkTHBPdU5CQUJmUzB4dFBBMUhadHBzeWZhc3kv?=
 =?utf-8?B?SDhxODVBNU5FcTdOUlVTd3VwbjJGQ0hEYVFpNjBvdStTMml4TjVpQ3pLY1Yy?=
 =?utf-8?B?YTB0eUdBZzgzLzI3UDdVQVBSczJLRkVSVkcwTy95MXlsR2ZjWEoveEdGR1Bn?=
 =?utf-8?B?TzhHNjEyNEdwVXgwRVplRm1jU0toZjdZWk5jaWZFRXBIdlRFU2ZldEFnS2Fm?=
 =?utf-8?B?MEhqZ3dlaGM2UFJiT1RwMDBSREhVN1NZbUcxQ1Q0SXJBcHZYc25RZjdNM3hi?=
 =?utf-8?B?WmkyMytQbGNzQStiYU1pYUliY09yaUJ1UlZQTHprZVAwTkluQ2hCekJKZXpS?=
 =?utf-8?Q?0JEaojPoNGkFP4dFj5VOPYi+cg2IQ40u?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(1800799024)(366016)(13003099007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SVduUjVMZU4vMHNpMGFzeW53VzZOeTlCVDlsQ1NaSDdxQkRqeitZWmMreTlO?=
 =?utf-8?B?SUVOQlNFUjdOS2MyYjdIZHhCMW5LZ2lZZFU2ZXF0OWxUS2h5UDVqQVJqRzhD?=
 =?utf-8?B?KzBpWUkwcUwzNlZmcFc5VHFRRVhTWnZCYUM1d3RNZWM1bktHNzdZVzdIRmg4?=
 =?utf-8?B?OUluQ0Q1b1pmamlzZGhLZjVZcTU5WWtQcnVvZHNnM255c0x5cWN5UmljYmdL?=
 =?utf-8?B?aE01c1Q4anZEYnUxdUU0dE5FdFZTbDEvOGtON1FJN29FSGliU0hjMzREVWNz?=
 =?utf-8?B?K1ZUbVVLSlgyWVA2Rmx6U1ZOM2NLSnlsa1VId05sS2lKZEFOVnM5dlNBcjQy?=
 =?utf-8?B?eFJLdGZiOWt1a2NVQU4wbVpuN0pJWFpLRVNpSjZoWDM1aGV6djhnajlWYTh4?=
 =?utf-8?B?bVIwLy84cXhpQmFhdXlnMGpVK2hBa0R2T1hhVld0TzBtUnZxSHdJMWUva3hH?=
 =?utf-8?B?UW1DdUlCNGpPTlJEbk0wNi94VkUyUVFpVENzR1d0dG9TbDdQZmU4NldSbUho?=
 =?utf-8?B?elNBaC84ZnpjTko0bElzT0V1eEF0RUpPMVdEMGpBQTNmcTlVenBlNndVL1U0?=
 =?utf-8?B?ck1qMjJ2VmIxMlRVMmFsNk5CTEgxRTFvS3Y1MmNydVJZNzR6OGg5TXhhZlY3?=
 =?utf-8?B?M3ZudnhUSGNqTGp3c1R2TEM3bTJ3RC93QzVGdys3NmZVdlFESFIzaUQyM1l0?=
 =?utf-8?B?Z0krNkRHMmE0amxKS09GVGtzZnlIRU91eDVBNjR1a3RzS0R2NEdOeC9XcnN5?=
 =?utf-8?B?SGtqdXBRTFJWemZKc0NoQWI2TzdsbG1vcEQxT0pUVnNHUDNwWEdwaHhHb2tZ?=
 =?utf-8?B?eE03Vld6blVIWWxpaGFXR011M3BLOEo3SHNreXB2dXIzSDZrMEpENG5BTzJ6?=
 =?utf-8?B?OTFjVnM3VnFKcTVPdWRHR1dIeFF3Q1NkaHBuQXhNcGdBS2NKYnMzYUc4T2pn?=
 =?utf-8?B?aFFkKzlBZ01LY0JsTHJEclNLWUlFbGd4cThtOENheW54MTJjeWY5NlNQL2to?=
 =?utf-8?B?NmJIeGlKeUFMOGxEVk13cnNhbGRXL3pIb1N3VURlT2lFRVZhZnVzUzVlU1hs?=
 =?utf-8?B?VTZ3ZTl5Z2xxelY0NmxCcFNYWWNTeldOTDZlNUttQ01KbUdDMDBCY3dTSmxW?=
 =?utf-8?B?L2lEaG9TaHpXSjJIcEJqamdsS2RxNGZndVlwc2huZFRERUQwU0VNL1dVd3lJ?=
 =?utf-8?B?dEJZK2FLYTBFQXBSYU9yMDArU0Z0bk5SemROK3JtTDF1ODBYODg5SVZaZ1BI?=
 =?utf-8?B?RlA4VkFlMitEb0dkTGx1cXlML3BRMnpRK1hNc1UrOTJWN0ZNR0FBemtxUFBT?=
 =?utf-8?B?QWRWRHUzTzVBVTN5dkdCMUt6bVZaT1puREZ2WXNKRlJWOTdOOHd2cnptVXFS?=
 =?utf-8?B?SUxEcnpveG5TYmdKb1FYT1h1V2o2Wk5SdzlhZVNUdVQ0LzI2QVNqVURHQ2tT?=
 =?utf-8?B?emhISDY0SEdnTnAwSkpDOGU3UUU4K2s1U2pFTHZqUjZHQzZjY0dQK3BNM2w1?=
 =?utf-8?B?b0w0cmUzQlViMWRpdHhKcHNySXNwU1JuMTU4L015UWIreHZ2OVU0bFFUdGE5?=
 =?utf-8?B?TkdZUVlhTnphdUR5OU44b3ljNWhQSFkxbW1IcGIvZUhIaEVmNmIrME1ndE1r?=
 =?utf-8?B?VE93Ui9sb2VKUlZvUWxUK043QWRTZW5DNkpXSnY4NGxZUERLd1p5aXl0MG9h?=
 =?utf-8?B?Y0RQOTZ0RFhWS0t0bC9aT2lPWHNRdkV0d2lValpGQjBsUFdyQVFoMVRKSm1R?=
 =?utf-8?B?c1k3N0hpVUtSTjZWV2l4L2h4VGt6Z1B5WE43V21KbWszSHR5QnVlM2JCNDBZ?=
 =?utf-8?B?bkRHOFJZbkJSaTMwY2VyaEdNSlpueHYyVXUxanp0KzgwemtiREhqRDIrMkpP?=
 =?utf-8?B?SkVsY3pFc0RxMWxiVEh6U3N4L05paHZuZC9hOEV4cm9oQjJkUU5waCtvVzl4?=
 =?utf-8?B?YWQyOFY4Y1U1c1pvUWt6d0dyVWU2WS9LSFBjUFVJOHgzY1play95OC96WHhp?=
 =?utf-8?B?TWpIWVNiaVg0WmNucHBBTjZscUl2NDRWamkvVnllL000cVFwanB5dzMydjZQ?=
 =?utf-8?B?YnFjbk93bkx1NTc2TlNuRW5qQUxmQ3pNSU1jaWFtVTR0Z2h6clFwNVFRbFky?=
 =?utf-8?B?Z09LaVVodFNUZGRVVFpOMDJGai8xWWUxaHN4ZXFsSFRPQUswdzJ4cjFsQWhv?=
 =?utf-8?B?OEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4D81D07C88E84A4CA5A8E4D520FDA1A8@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3d53d83-db7d-43a5-e4cd-08ddfa472a2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2025 02:16:11.3495
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fAp++dqqNAGtn4eCqUGY2kNIAp33yxEDOBnqaQS7BOrz3+rJfS69RthQdY6gdXoFo08ieGF+gPrIU0gicHxb8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7751
X-OriginatorOrg: intel.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 02:16:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119646

T24gRnJpLCAyMDI1LTA5LTE5IGF0IDA0OjMzIC0wNzAwLCBTaHViaGFtIFB1c2hwa2FyIHZpYQ0K
bGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4gVXBzdHJlYW0gUmVwb3NpdG9yeTogaHR0
cHM6Ly9naXRodWIuY29tL0RhdmVHYW1ibGUvY0pTT04uZ2l0DQo+IA0KPiBCdWcgRGV0YWlsczog
aHR0cHM6Ly9udmQubmlzdC5nb3YvdnVsbi9kZXRhaWwvQ1ZFLTIwMjUtNTcwNTINCj4gVHlwZTog
U2VjdXJpdHkgRml4DQo+IENWRTogQ1ZFLTIwMjUtNTcwNTINCj4gU2NvcmU6IDkuOA0KPiBQYXRj
aDogaHR0cHM6Ly9naXRodWIuY29tL0RhdmVHYW1ibGUvY0pTT04vY29tbWl0Lzc0ZTFmZjQ5OTRh
YQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogU2h1YmhhbSBQdXNocGthciA8c3B1c2hwa2FAY2lzY28u
Y29tPg0KDQpQbGVhc2UgZml4IHlvdXIgZ2l0IGNvbmZpZyBzbyB0aGUgYXV0aG9yIGluZm9ybWF0
aW9uIGlzIGNvcnJlY3Qgd2hlbg0Kc2VuZGluZyBwYXRjaGVzLg0KDQpQbGVhc2Ugc2VlOg0KaHR0
cHM6Ly9kb2NzLnlvY3RvcHJvamVjdC5vcmcvZGV2L2NvbnRyaWJ1dG9yLWd1aWRlL3N1Ym1pdC1j
aGFuZ2VzLmh0bWwjZml4aW5nLXlvdXItZnJvbS1pZGVudGl0eQ0KDQpUaGFua3MsDQoNCkFudWoN
Cg0KPiAtLS0NCj4gwqAuLi4vY2pzb24vY2pzb24vQ1ZFLTIwMjUtNTcwNTIucGF0Y2jCoMKgwqDC
oMKgwqDCoMKgwqAgfCAzMw0KPiArKysrKysrKysrKysrKysrKysrDQo+IMKgLi4uL3JlY2lwZXMt
ZGV2dG9vbHMvY2pzb24vY2pzb25fMS43LjE4LmJiwqDCoMKgIHzCoCAxICsNCj4gwqAyIGZpbGVz
IGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKykNCj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS1v
ZS9yZWNpcGVzLWRldnRvb2xzL2Nqc29uL2Nqc29uL0NWRS0yMDI1LQ0KPiA1NzA1Mi5wYXRjaA0K
PiANCj4gZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9janNvbi9janNvbi9D
VkUtMjAyNS0NCj4gNTcwNTIucGF0Y2ggYi9tZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMvY2pzb24v
Y2pzb24vQ1ZFLTIwMjUtDQo+IDU3MDUyLnBhdGNoDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+
IGluZGV4IDAwMDAwMDAwMDAuLmVkM2Q0YTdlYmENCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9t
ZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMvY2pzb24vY2pzb24vQ1ZFLTIwMjUtNTcwNTIucGF0Y2gN
Cj4gQEAgLTAsMCArMSwzMyBAQA0KPiArRnJvbSBlNTNhMTQxMzMwNDM4MmQ1NjIxNzZiZWQ5MTYw
OWUwMGI0ZmNmODdlIE1vbiBTZXAgMTcgMDA6MDA6MDANCj4gMjAwMQ0KPiArRnJvbTogTGVlIDxw
ZXRlcmFsZnJlZGxlZUBnbWFpbC5jb20+DQo+ICtEYXRlOiBGcmksIDUgU2VwIDIwMjUgMTQ6NTM6
MjAgKzA4MDANCj4gK1N1YmplY3Q6IFtQQVRDSF0gZml4IHRoZSBpbmNvcnJlY3QgY2hlY2sgaW4N
Cj4gZGVjb2RlX2FycmF5X2luZGV4X2Zyb21fcG9pbnRlcg0KPiArICgjOTU3KQ0KPiArDQo+ICt0
aGlzIGZpeGVzIENWRS0yMDI1LTU3MDUyDQo+ICsNCj4gK0NWRTogQ1ZFLTIwMjUtNTcwNTINCj4g
K1Vwc3RyZWFtLVN0YXR1czogQmFja3BvcnQNCj4gW2h0dHBzOi8vZ2l0aHViLmNvbS9EYXZlR2Ft
YmxlL2NKU09OL2NvbW1pdC83NGUxZmY0OTk0YWFdDQo+ICsNCj4gKyhjaGVycnkgcGlja2VkIGZy
b20gY29tbWl0IDc0ZTFmZjQ5OTRhYTQxMzkxMjY5NjdmNmQyODliNjc1YjRiMzZmZWYpDQo+ICtT
aWduZWQtb2ZmLWJ5OiBTaHViaGFtIFB1c2hwa2FyIDxzcHVzaHBrYUBjaXNjby5jb20+DQo+ICst
LS0NCj4gKyBjSlNPTl9VdGlscy5jIHwgMiArLQ0KPiArIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiArDQo+ICtkaWZmIC0tZ2l0IGEvY0pTT05fVXRpbHMu
YyBiL2NKU09OX1V0aWxzLmMNCj4gK2luZGV4IDYzNjUxZGYuLjhmYTI0ZjggMTAwNjQ0DQo+ICst
LS0gYS9jSlNPTl9VdGlscy5jDQo+ICsrKysgYi9jSlNPTl9VdGlscy5jDQo+ICtAQCAtMjgyLDcg
KzI4Miw3IEBAIHN0YXRpYyBjSlNPTl9ib29sDQo+IGRlY29kZV9hcnJheV9pbmRleF9mcm9tX3Bv
aW50ZXIoY29uc3QgdW5zaWduZWQgY2hhciAqIGNvbnN0IHBvDQo+ICvCoMKgwqDCoMKgwqDCoMKg
IHJldHVybiAwOw0KPiArwqDCoMKgwqAgfQ0KPiArIA0KPiArLcKgwqDCoCBmb3IgKHBvc2l0aW9u
ID0gMDsgKHBvaW50ZXJbcG9zaXRpb25dID49ICcwJykgJiYgKHBvaW50ZXJbMF0gPD0NCj4gJzkn
KTsgcG9zaXRpb24rKykNCj4gKyvCoMKgwqAgZm9yIChwb3NpdGlvbiA9IDA7IChwb2ludGVyW3Bv
c2l0aW9uXSA+PSAnMCcpICYmDQo+IChwb2ludGVyW3Bvc2l0aW9uXSA8PSAnOScpOyBwb3NpdGlv
bisrKQ0KPiArwqDCoMKgwqAgew0KPiArwqDCoMKgwqDCoMKgwqDCoCBwYXJzZWRfaW5kZXggPSAo
MTAgKiBwYXJzZWRfaW5kZXgpICsNCj4gKHNpemVfdCkocG9pbnRlcltwb3NpdGlvbl0gLSAnMCcp
Ow0KPiArIA0KPiArLS0gDQo+ICsyLjQ0LjENCj4gKw0KPiBkaWZmIC0tZ2l0IGEvbWV0YS1vZS9y
ZWNpcGVzLWRldnRvb2xzL2Nqc29uL2Nqc29uXzEuNy4xOC5iYiBiL21ldGEtDQo+IG9lL3JlY2lw
ZXMtZGV2dG9vbHMvY2pzb24vY2pzb25fMS43LjE4LmJiDQo+IGluZGV4IGJkZWFiMzA1NWMuLjY3
ZDUzNmNmMjQgMTAwNjQ0DQo+IC0tLSBhL21ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9janNvbi9j
anNvbl8xLjcuMTguYmINCj4gKysrIGIvbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xzL2Nqc29uL2Nq
c29uXzEuNy4xOC5iYg0KPiBAQCAtNiw2ICs2LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9DQo+ICJm
aWxlOi8vTElDRU5TRTttZDU9MjE4OTQ3Zjc3ZThjYjhlMmZhMDI5MThkYzQxYzUwZDAiDQo+IMKg
DQo+IMKgU1JDX1VSSSA9DQo+ICJnaXQ6Ly9naXRodWIuY29tL0RhdmVHYW1ibGUvY0pTT04uZ2l0
O2JyYW5jaD1tYXN0ZXI7cHJvdG9jb2w9aHR0cHMgXA0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGZpbGU6Ly9ydW4tcHRlc3TCoFwNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgIGZpbGU6Ly9DVkUt
MjAyNS01NzA1Mi5wYXRjaMKgXA0KPiDCoMKgwqDCoMKgwqDCoMKgwqAgIg0KPiDCoFNSQ1JFViA9
ICJhY2M3NjIzOWJlZTAxZDhlOWM4NThhZTJjYWIyOTY3MDRlNTJkOTE2Ig0KPiDCoA0KPiANCj4g
LT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdl
cyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+IFZpZXcvUmVwbHkgT25saW5lICgjMTE5NTkzKToNCj4g
aHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWRldmVsL21lc3Nh
Z2UvMTE5NTkzDQo+IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQu
b3JnL210LzExNTMyNjE0Mi8zNjE2NzAyDQo+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtZGV2
ZWwrb3duZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBVbnN1YnNjcmliZToNCj4gaHR0cHM6
Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWRldmVsL3Vuc3ViwqBbDQo+
IGFudWoubWl0dGFsQGludGVsLmNvbV0NCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCg==


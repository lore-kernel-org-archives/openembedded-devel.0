Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 733C6C433FE
	for <webhook@archiver.kernel.org>; Thu,  6 Oct 2022 23:16:01 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web09.1084.1665098156186135038
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Oct 2022 16:15:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=nc2Ffd3M;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665098156; x=1696634156;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=UppQk/Ns9nmfgMHo1QbcTTdD8IFHym3okpMWp8AHytY=;
  b=nc2Ffd3MDmI9frkDy5Q58Ib0Q+EaWCPZZZxdkQiSj/77PThzkvIIetyD
   OJmzmncM97qQl0fsClhfphgEXdbvGPEkLjhM4I4QE+kqppQAix3EuvyoF
   jyJXu7hroZPJgZ/nxFXeVr03jZhtylX07QTldT/iEN8NrwRb9xoCWmtjE
   C6GBgpHfITue3c0fs1MBBwsBgFT8lLkWvjxLcw4Qe8PV3hS80RP/NGTgE
   HYAnIT3utq/CnrreUW1BRbwI0roCvHECU2lD+1rT1o2ojOeVKgARtRUCN
   DIbGKDa6ASx8/yp+oH96TcZ4t+0GPxXwyN9vs7A8EGQyr8mV2eIxG9Us4
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10492"; a="301196242"
X-IronPort-AV: E=Sophos;i="5.95,164,1661842800";
   d="scan'208";a="301196242"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2022 16:15:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10492"; a="658102033"
X-IronPort-AV: E=Sophos;i="5.95,164,1661842800";
   d="scan'208";a="658102033"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga001.jf.intel.com with ESMTP; 06 Oct 2022 16:15:55 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 6 Oct 2022 16:15:55 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 6 Oct 2022 16:15:55 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 6 Oct 2022 16:15:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I4x20br2jmYu/mu+8xhZR1r4ihnRAhIHahkRu2vLiEDSEHcHiU6zt32Zp7ZKTLqIouxlqcDaKR/Qxurf8TvuGa2uQr1s0SI0myRoumZzcVR1tPZcwsYJn7egc2GLZ0vM7AVBiReImnCuq0hXBBerOtwP2KGdztYzBxC4y/+ZYj043IJHbYwBdMqGxgruK4/2jtDZ/AjB6iDUjw5MrFQqHeEzyG2aqjZHJwgV/SZZzy8xj39aGyUAVaqANdAKk5ajeX9rzhNOYvLUDJzTB5eHktH1HFGTp1EliTlVZ97ZZqbeHQJ3ExYYMT43C4N+JjH7WJUCR7BLBFbhnBYxJzFqOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UppQk/Ns9nmfgMHo1QbcTTdD8IFHym3okpMWp8AHytY=;
 b=KZOcjGkVB5/9slHhxNOxYNIM6oQiAl/hEuvB6uxmUihfd1SKO33HBRe3gdYhAJyr6tR+eJXvAmObaX3ucJQrTtv7zKtHjE87JDLzjtnTMeHRZw4EQOwxzqJtf4f5cWM9ObPL+La85h0jg+N9q+InT6kAStM2KesXsCU5p+ocun4sNA/C3ynWQ7Yu6q/nhNp37VVnHjYg1k7yc3dEFxp2Iz4DyOf2GVYllAKxZ4ErPXCD6pkKhSvTqNMyPbCNddjbV+g0ELlNztw3e0mmhyGRGH5L9e7xsVsCuWgRNFhxQwZSasVihTYi0CC0g21qfIN7HLrTJ31afuMDktYBRsNvtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by SA1PR11MB5921.namprd11.prod.outlook.com (2603:10b6:806:22a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.32; Thu, 6 Oct
 2022 23:15:52 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::71fb:9367:d62c:aabd]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::71fb:9367:d62c:aabd%8]) with mapi id 15.20.5676.020; Thu, 6 Oct 2022
 23:15:52 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [PATCH] opencv: fix reproducibility issues
Thread-Topic: [oe] [PATCH] opencv: fix reproducibility issues
Thread-Index: AQHY2bHGoyqrQFz1bEGD+P9mJ+bwz64B/8CA
Date: Thu, 6 Oct 2022 23:15:52 +0000
Message-ID: <245961bbdcbdd10aacf5e4cc84e168b724bd774c.camel@intel.com>
References: <20221006084048.154710-1-anuj.mittal@intel.com>
	 <CAMKF1soTFvufyWGUZ6T4-c3tPMKTHzgnbeXyg1PP0aOgLSdcqQ@mail.gmail.com>
In-Reply-To: 
 <CAMKF1soTFvufyWGUZ6T4-c3tPMKTHzgnbeXyg1PP0aOgLSdcqQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4 (3.44.4-2.fc36) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|SA1PR11MB5921:EE_
x-ms-office365-filtering-correlation-id: 7e08c07f-c677-4a7f-b585-08daa7f0b6ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 5HKOTmI02f/4T0t2d7Iln92U9n/MNfxrmuN2bUYUNL+2WOS49ehF3fi8JOmOlPPfnkhmZSIG7rRnt3VuVlr+k10x0ZD8uYPaInuG8X9vJbA7bU7f8srjW+kCgHW/VeU70sq3Dv15QPbOnozxipkw61gqXCqDo+1eY4o+1zzpxhSxJHQFKh1bqXRHS4t4HJfNlP1JZKia1EsQAT7+/FFB0Vsn5OtAteoTXo+ZllVINFGQkGQnol6AGOeGJGxjeHz1yFjObxOrzZlV5Oal4Xe1a+P33mjKJQklZNLpAeIdAUwkbWnWEkOhfwFW3oJo/cM52RclmOiPCQChOldO71qtTOWBGm5LN5oq1X9Iooirlhzr2dRKdoZjFiEhfmMaNy0wAnIs1TrS+61DWDXvmAFv9HB5+Z94kQM+LgTVtwoNGb+4WWyQMU6iEOXtWC8TjCEihOUersvTmkGDdOe9ytEXSUD1ylaB4LnlnEsRJkAIf7KlmafGkVHpIAjeiTTeMMzdaapa8zzv0EeUE7J20WrbGcTM2furUR7S/yiUkRH39/jW35T4ufAFZ2bCCrcwU7FqawKrqOIyUofio2GxnXje50qu7fj5Hx1WMJ+TXVa6/a7n18kjQ47lhdWXXWtYBc2iEJ3Q3qBHcQprTORK/r4Z+87QJ0E5RvgOd5gR3GOllON271z8MdNW2AZy3ECZOmpbZ11Q16CG2E8fKW5EXXIrQ9ZXBc7V5CnmKbqM6GhSa/aHkA4fsm5l0TYRZZkxbmxPJbL2vtWOIhPxaNSyiEqUpDJrZJutHRo3lfkGYYRt9r4YGFKW92qLRwpDA/uC1pFhAti1Nr7Lg3RkavMKTcTpNw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(39860400002)(366004)(376002)(136003)(346002)(451199015)(5660300002)(66899015)(8936002)(82960400001)(38100700002)(83380400001)(2906002)(8676002)(2616005)(478600001)(41300700001)(186003)(53546011)(76116006)(36756003)(66946007)(66556008)(91956017)(966005)(6486002)(66446008)(4326008)(64756008)(122000001)(316002)(6506007)(6512007)(6916009)(66476007)(38070700005)(71200400001)(26005)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WXd3UXlIV0hZUzFybC9rbHduMk80VGQrd2lId2haMXV3SE84VlU5UzRhVDFY?=
 =?utf-8?B?Y2FWQklLczZ4c0hIeVlZelk4TXgxSGlYMmFGRWdDWVIxbmFMSEhKaW9YbmV4?=
 =?utf-8?B?cWJ3Qll1Q0N3OVRVeVFKSjVpc3M2ZHg0dEVLcGV1YjNLZEM1aVQ0a1ZNZnBy?=
 =?utf-8?B?UUY0YmdXTFZ1K1krcThoNnJHS0lDYk1Zd1FkWldlSFYwVHdHb284TFA4RzNN?=
 =?utf-8?B?RHBuc09jUjJJdEtMbEQ5YlZzbmVhU3ZKMmRUcTY1K3d1RTF0TEtaeERpbmtU?=
 =?utf-8?B?bzVHSkdodk9ScFZyRlhGenRWWGs2aUhWQ3duanpENDNQcWpZb01HRVpBbzBE?=
 =?utf-8?B?Z2pwN005bEl4ZVIxcnlTYkFIQ0UycGIyQnpYMURFUEV5U0w3cTdDaGlGV1Rt?=
 =?utf-8?B?TXQwUnIzZVd2T3QvRlZ3d0NmdTdVLzl3bVhwUmxjRWNUUmRGaW1QZ2lSU0da?=
 =?utf-8?B?bGUwS2prWjVjRFllblhmaVNSUnVqNkxNR3RDWndsSEJDYklFKzI4NzI5bitX?=
 =?utf-8?B?Z3JPczB1aERmZkhKWkR4QS91YlhneE1zdHBPQ1hrTW12NnBINTdjMDZpbE1L?=
 =?utf-8?B?dnNmeE5HcWd4NDJNcWtPdm1vWWpzeGtxRTNEeWRHeXlzcjhlcFZZV1VxYkFC?=
 =?utf-8?B?YzU5UUUxR3JGMkYvZWYzSkV3SXlxOUpBci93VG5wZ3J0Nlo4bzMwQURSUHlO?=
 =?utf-8?B?UUpVTlh5NmwxcGs2SXdxRVFtZXAzNW8vdUMxbEN2VWVIMVl6NFJ5Z0xaOVMw?=
 =?utf-8?B?NU9XSkJ6MmNheGlHTHp0RW9ydXBLaWE0MkhiUVYzY3ZPVzhwKzBoOGF5Q1Vk?=
 =?utf-8?B?ajQvMnJ6elBMWGk2dW9jcldTOTJyRFNDaFRhYVdyUGY5RjU0SnQ5M29md3Vl?=
 =?utf-8?B?SHVjaStPRER3b20ySmxmZUNGcEZuLzhZY2wraWtpQnlMME53QW1kSndubUV4?=
 =?utf-8?B?N1dsMnozSmJlOEtJa2hNUFdKUW90SHBDVmV0NFBlSW9aRm5zQmVNUzZBZkJo?=
 =?utf-8?B?NTNyOUQ3bVM5TmNZOGcxMDB5NWs3UXFieXU3NDhKTit4TVJmQ2dvbjdEOWRp?=
 =?utf-8?B?OWVjNmpGSkd6dFV0cWUzZlJBb0gwMVRJSWt0dlE3cHM3WHV6cjA2NXcyVERj?=
 =?utf-8?B?bWFTTE13UklIU0V1ZDhWYVVsRU9hV0NOT0Z6bDdKNXVaU0wzbjIyaElLOVkr?=
 =?utf-8?B?UEpBYmx2MzdyaGlia0NFTW4wSFh1eTVIYUtjZ2l0M2NGRXNVdGJvSXRZdjFz?=
 =?utf-8?B?Q3hSTFlJc2k4YjUyeDBPbUpqY3BTeFk1NzVrVG4ydzVjZjBQNGRsNzBUdkVi?=
 =?utf-8?B?SzVDdEpXRHN0bHF4REU3NW94QkpuY2REKzFJTEw3eU80MzhneXNRY0QrSjdQ?=
 =?utf-8?B?M2ltTWJSYU5EekZUM1dpaDBnd0pvd3IvMUhWRXlSbzgxeVpuODRZbFBIbzlx?=
 =?utf-8?B?UkFkTjRYRXQraFVGcjZBa3FadEZMUXptQjFyczd6Qkp3WTdNSlVxdm83ZHNw?=
 =?utf-8?B?RGdrZDhKcFFrc2FKVU0rWDUxdWZncGk3WUhheVVLZlhOeWYxZGl1YWxham1Q?=
 =?utf-8?B?eXkrQUEwNFRSdmcwbEhOZDQybThXdFlldEo5YmhveXh5dTh4cDJ5ZXN5dHo3?=
 =?utf-8?B?VHgvWjQ2aWlpU3BETTdMOThRYS9tZEhFd1dtd3dmNUdOVUFZazJ0My9sSFJV?=
 =?utf-8?B?Rmx6NFNxWmZLN0E3aXNzMFRhTjhUU0dTRDFjN0dPL3c2ZlBOTUtENTBqbGxu?=
 =?utf-8?B?WHBqSUpZd0FSanRDWnVEeitmUXp3YWNlQi9aVC90L0p6bERYZkg4Tkg4NkNS?=
 =?utf-8?B?YVlJYmNmMnk4R1V3WmJuRmtKTmZqZnp5TFdrbnhEZUxpc3VDL2tFSzJZZS9w?=
 =?utf-8?B?eUoycHY3eXpiOXo4b0NLeE5vSTV3WE5zOCtUUS9TbE1TcXg1RUE1V1hTRWVk?=
 =?utf-8?B?cGQzdm4vQUxnNEZmamtMRUs4bVFUeW9JSVdHdCtQQ3JDOVJYdk9xQ2YyVWZy?=
 =?utf-8?B?dlZMWVRTZDZjbDh2Wlp3OWNMWGJSRUEzZThuZDhUWXdWaTBlZjc3d1ZkS1NH?=
 =?utf-8?B?bzVOcWs4U0ZlZUZsMkhOU2VGOGJBK0g2Y09iNHZsUFVLb1dpSFgyL0VVNHFJ?=
 =?utf-8?B?THJWZHBUUml4aGpxbXVxSWw1M01qbnFybzBpTnB5VkJxZnhmOVRoSm9JandI?=
 =?utf-8?B?REE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <95BCBB20D119D342982E011AC94CA146@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7e08c07f-c677-4a7f-b585-08daa7f0b6ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2022 23:15:52.6711
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 tL+UMG0KKYxt1MJbyJcJZFfHRt6WCHkG2Wcp87JZN3d7URAJ2hord4Z1hK3NRZYDnCTN+jBrt1hNZJBQM5+o9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5921
X-OriginatorOrg: intel.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Oct 2022 23:16:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99084

T24gVGh1LCAyMDIyLTEwLTA2IGF0IDExOjMwIC0wNzAwLCBLaGVtIFJhaiB3cm90ZToNCj4gYnR3
LiBJIGRvIHNlZSBhIFFBIHdhcm5pbmcsIHBlcmhhcHMgaXRzIG5vdCByZWxhdGVkIHRvIHlvdXIg
Y2hhbmdlDQo+IGJ1dA0KPiBJIHRob3VnaHQgaXQgd291bGQgYmUgZ29vZCB0byBjaGVjaw0KPiAN
Cj4gaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3R5cGhvb24vIy9idWlsZGVy
cy84OC9idWlsZHMvMjA4Mi9zdGVwcy8xNC9sb2dzL3dhcm5pbmdzDQoNClllcywgdGhlcmUgd2Vy
ZSB+MzAgb2YgdGhlbSBlYXJsaWVyIEkgdGhpbmsuIFRoaXMgY2hhbmdlIGZpeGVzIG1vc3Qgb2YN
CnRoZW0gZXhjZXB0IHRoaXMuIEkgd2lsbCBzZW5kIGEgc2VwYXJhdGUgY2hhbmdlIGxhdGVyIHRv
IGZpeCB0aGlzIGxhc3QNCm9uZSBhcyB3ZWxsLg0KDQpUaGFua3MsDQoNCkFudWoNCg0KPiANCj4g
T24gVGh1LCBPY3QgNiwgMjAyMiBhdCAxOjQwIEFNIEFudWogTWl0dGFsIDxhbnVqLm1pdHRhbEBp
bnRlbC5jb20+DQo+IHdyb3RlOg0KPiA+IA0KPiA+IERvd25sb2FkIGFuZCB1bnBhY2sgY29udHJp
YiBtb2R1bGVzIGFuZCBvdGhlciByZXBvc2l0b3JpZXMgaW4gUw0KPiA+IGluc3RlYWQNCj4gPiBv
ZiBXT1JLRElSIHNvIHRoZXkgZG9uJ3QgZXNjYXBlIGZpbGUtcHJlZml4LW1hcCBzdWJzdGl0dXRp
b25zLg0KPiA+IA0KPiA+IEZpeGVzIGEgbnVtYmVyIG9mIHJlcHJvZHVjaWJpbGl0eSBwcm9ibGVt
cyBiZWNhdXNlIG9mIE9wZW5DViBjaGVjaw0KPiA+IG1hY3JvcyB0aGF0IHdlcmUgZW1iZWRkaW5n
IHBhdGggdG8gZmlsZXMgaW4gY29udHJpYi8uDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogQW51
aiBNaXR0YWwgPGFudWoubWl0dGFsQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiDCoC4uLi9yZWNp
cGVzLXN1cHBvcnQvb3BlbmN2L29wZW5jdl80LjYuMC5iYsKgwqDCoCB8IDMwICsrKysrKysrKy0t
LS0tLQ0KPiA+IC0tLS0NCj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAx
NSBkZWxldGlvbnMoLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLXN1
cHBvcnQvb3BlbmN2L29wZW5jdl80LjYuMC5iYiBiL21ldGEtDQo+ID4gb2UvcmVjaXBlcy1zdXBw
b3J0L29wZW5jdi9vcGVuY3ZfNC42LjAuYmINCj4gPiBpbmRleCBmNmMxMDA1NGMuLmRhMWU2NTlh
NCAxMDA2NDQNCj4gPiAtLS0gYS9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9vcGVuY3Yvb3BlbmN2
XzQuNi4wLmJiDQo+ID4gKysrIGIvbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvb3BlbmN2L29wZW5j
dl80LjYuMC5iYg0KPiA+IEBAIC0zOSwxMiArMzksMTIgQEAgSVBQX01ENSA9ICIke0BpcHBfbWQ1
c3VtKGQpfSINCj4gPiANCj4gPiDCoFNSQ1JFVl9GT1JNQVQgPSAib3BlbmN2X2NvbnRyaWJfaXBw
X2Jvb3N0ZGVzY192Z2ciDQo+ID4gwqBTUkNfVVJJID0NCj4gPiAiZ2l0Oi8vZ2l0aHViLmNvbS9v
cGVuY3Yvb3BlbmN2LmdpdDtuYW1lPW9wZW5jdjticmFuY2g9bWFzdGVyO3Byb3RvDQo+ID4gY29s
PWh0dHBzIFwNCj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqANCj4gPiBnaXQ6Ly9naXRodWIuY29t
L29wZW5jdi9vcGVuY3ZfY29udHJpYi5naXQ7ZGVzdHN1ZmZpeD1jb250cmliO25hbWU9DQo+ID4g
Y29udHJpYjticmFuY2g9bWFzdGVyO3Byb3RvY29sPWh0dHBzIFwNCj4gPiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqANCj4gPiBnaXQ6Ly9naXRodWIuY29tL29wZW5jdi9vcGVuY3ZfM3JkcGFydHkuZ2l0
O2JyYW5jaD1pcHBpY3YvbWFzdGVyXzIwDQo+ID4gMTkxMDE4O2Rlc3RzdWZmaXg9aXBwO25hbWU9
aXBwO3Byb3RvY29sPWh0dHBzIFwNCj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqANCj4gPiBnaXQ6
Ly9naXRodWIuY29tL29wZW5jdi9vcGVuY3ZfM3JkcGFydHkuZ2l0O2JyYW5jaD1jb250cmliX3hm
ZWF0dXJlDQo+ID4gczJkX2Jvb3N0ZGVzY18yMDE2MTAxMjtkZXN0c3VmZml4PWJvb3N0ZGVzYztu
YW1lPWJvb3N0ZGVzYztwcm90b2NvbA0KPiA+ID1odHRwcyBcDQo+ID4gLcKgwqDCoMKgwqDCoMKg
wqDCoMKgDQo+ID4gZ2l0Oi8vZ2l0aHViLmNvbS9vcGVuY3Yvb3BlbmN2XzNyZHBhcnR5LmdpdDti
cmFuY2g9Y29udHJpYl94ZmVhdHVyZQ0KPiA+IHMyZF92Z2dfMjAxNjAzMTc7ZGVzdHN1ZmZpeD12
Z2c7bmFtZT12Z2c7cHJvdG9jb2w9aHR0cHMgXA0KPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoA0K
PiA+IGdpdDovL2dpdGh1Yi5jb20vb3BlbmN2L29wZW5jdl8zcmRwYXJ0eS5naXQ7YnJhbmNoPWNv
bnRyaWJfZmFjZV9hbGkNCj4gPiBnbm1lbnRfMjAxNzA4MTg7ZGVzdHN1ZmZpeD1mYWNlO25hbWU9
ZmFjZTtwcm90b2NvbD1odHRwcyBcDQo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgDQo+ID4gZ2l0
Oi8vZ2l0aHViLmNvbS9XZUNoYXRDVi9vcGVuY3ZfM3JkcGFydHkuZ2l0O2JyYW5jaD13ZWNoYXRf
cXJjb2RlOw0KPiA+IGRlc3RzdWZmaXg9d2VjaGF0X3FyY29kZTtuYW1lPXdlY2hhdC1xcmNvZGU7
cHJvdG9jb2w9aHR0cHMgXA0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoA0KPiA+IGdpdDovL2dp
dGh1Yi5jb20vb3BlbmN2L29wZW5jdl9jb250cmliLmdpdDtkZXN0c3VmZml4PWdpdC9jb250cmli
O24NCj4gPiBhbWU9Y29udHJpYjticmFuY2g9bWFzdGVyO3Byb3RvY29sPWh0dHBzIFwNCj4gPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqANCj4gPiBnaXQ6Ly9naXRodWIuY29tL29wZW5jdi9vcGVuY3Zf
M3JkcGFydHkuZ2l0O2JyYW5jaD1pcHBpY3YvbWFzdGVyXzIwDQo+ID4gMTkxMDE4O2Rlc3RzdWZm
aXg9Z2l0L2lwcDtuYW1lPWlwcDtwcm90b2NvbD1odHRwcyBcDQo+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgDQo+ID4gZ2l0Oi8vZ2l0aHViLmNvbS9vcGVuY3Yvb3BlbmN2XzNyZHBhcnR5LmdpdDti
cmFuY2g9Y29udHJpYl94ZmVhdHVyZQ0KPiA+IHMyZF9ib29zdGRlc2NfMjAxNjEwMTI7ZGVzdHN1
ZmZpeD1naXQvYm9vc3RkZXNjO25hbWU9Ym9vc3RkZXNjO3Byb3QNCj4gPiBvY29sPWh0dHBzIFwN
Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqANCj4gPiBnaXQ6Ly9naXRodWIuY29tL29wZW5jdi9v
cGVuY3ZfM3JkcGFydHkuZ2l0O2JyYW5jaD1jb250cmliX3hmZWF0dXJlDQo+ID4gczJkX3ZnZ18y
MDE2MDMxNztkZXN0c3VmZml4PWdpdC92Z2c7bmFtZT12Z2c7cHJvdG9jb2w9aHR0cHMgXA0KPiA+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoA0KPiA+IGdpdDovL2dpdGh1Yi5jb20vb3BlbmN2L29wZW5j
dl8zcmRwYXJ0eS5naXQ7YnJhbmNoPWNvbnRyaWJfZmFjZV9hbGkNCj4gPiBnbm1lbnRfMjAxNzA4
MTg7ZGVzdHN1ZmZpeD1naXQvZmFjZTtuYW1lPWZhY2U7cHJvdG9jb2w9aHR0cHMgXA0KPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoA0KPiA+IGdpdDovL2dpdGh1Yi5jb20vV2VDaGF0Q1Yvb3BlbmN2
XzNyZHBhcnR5LmdpdDticmFuY2g9d2VjaGF0X3FyY29kZTsNCj4gPiBkZXN0c3VmZml4PWdpdC93
ZWNoYXRfcXJjb2RlO25hbWU9d2VjaGF0LXFyY29kZTtwcm90b2NvbD1odHRwcyBcDQo+ID4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoA0KPiA+IGZpbGU6Ly8wMDAxLTNyZHBhcnR5LWlwcGljdi1Vc2Ut
cHJlLWRvd25sb2FkZWQtaXBwLnBhdGNowqBcDQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBm
aWxlOi8vMDAwMy1Uby1maXgtZXJyb3JzLWFzLWZvbGxvd2luZy5wYXRjaMKgXA0KPiA+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqANCj4gPiBmaWxlOi8vMDAwMS1UZW1wb3JhcmxpeS13b3JrLWFyb3Vu
ZC1kZXByZWNhdGVkLWZmbXBlZy1SQVctZnVuY3RpLnBhdGNoDQo+ID4gwqBcDQo+ID4gQEAgLTUy
LDcgKzUyLDcgQEAgU1JDX1VSSSA9DQo+ID4gImdpdDovL2dpdGh1Yi5jb20vb3BlbmN2L29wZW5j
di5naXQ7bmFtZT1vcGVuY3Y7YnJhbmNoPW1hc3Rlcjtwcm90bw0KPiA+IGNvbA0KPiA+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgZmlsZTovL2Rvd25sb2FkLnBhdGNowqBcDQo+ID4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBmaWxlOi8vMDAwMS1NYWtlLXRzLW1vZHVsZS1leHRlcm5hbC5wYXRjaMKg
XA0KPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIg0KPiA+IC1TUkNfVVJJOmFwcGVuZDpyaXNj
djY0ID0gIg0KPiA+IGZpbGU6Ly8wMDAxLVVzZS1Pcy10by1jb21waWxlLXRpbnl4bWwyLmNwcC5w
YXRjaDtwYXRjaGRpcj0uLi9jb250cmliDQo+ID4gIg0KPiA+ICtTUkNfVVJJOmFwcGVuZDpyaXNj
djY0ID0gIg0KPiA+IGZpbGU6Ly8wMDAxLVVzZS1Pcy10by1jb21waWxlLXRpbnl4bWwyLmNwcC5w
YXRjaDtwYXRjaGRpcj1jb250cmliIg0KPiA+IA0KPiA+IMKgUyA9ICIke1dPUktESVJ9L2dpdCIN
Cj4gPiANCj4gPiBAQCAtNjEsNyArNjEsNyBAQCBTID0gIiR7V09SS0RJUn0vZ2l0Ig0KPiA+IMKg
T1BFTkNWX0RMRElSID0gIiR7V09SS0RJUn0vZG93bmxvYWRzIg0KPiA+IA0KPiA+IMKgZG9fdW5w
YWNrX2V4dHJhKCkgew0KPiA+IC3CoMKgwqAgdGFyIHh6ZiAke1dPUktESVJ9L2lwcC9pcHBpY3Yv
JHtJUFBfRklMRU5BTUV9IC1DICR7V09SS0RJUn0NCj4gPiArwqDCoMKgIHRhciB4emYgJHtTfS9p
cHAvaXBwaWN2LyR7SVBQX0ZJTEVOQU1FfSAtQyAke1N9DQo+ID4gDQo+ID4gwqDCoMKgwqAgbWQ1
KCkgew0KPiA+IMKgwqDCoMKgwqDCoMKgwqAgIyBSZXR1cm4gdGhlIE1ENSBvZiAkMQ0KPiA+IEBA
IC03NiwyMiArNzYsMjIgQEAgZG9fdW5wYWNrX2V4dHJhKCkgew0KPiA+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB0ZXN0IC1lICRERVNUIHx8IGxuIC1zICRGICRERVNUDQo+ID4gwqDCoMKgwqDC
oMKgwqDCoCBkb25lDQo+ID4gwqDCoMKgwqAgfQ0KPiA+IC3CoMKgwqAgY2FjaGUgeGZlYXR1cmVz
MmQvYm9vc3RkZXNjICR7V09SS0RJUn0vYm9vc3RkZXNjLyouaQ0KPiA+IC3CoMKgwqAgY2FjaGUg
eGZlYXR1cmVzMmQvdmdnICR7V09SS0RJUn0vdmdnLyouaQ0KPiA+IC3CoMKgwqAgY2FjaGUgZGF0
YSAke1dPUktESVJ9L2ZhY2UvKi5kYXQNCj4gPiAtwqDCoMKgIGNhY2hlIHdlY2hhdF9xcmNvZGUg
JHtXT1JLRElSfS93ZWNoYXRfcXJjb2RlLyouY2FmZmVtb2RlbA0KPiA+IC3CoMKgwqAgY2FjaGUg
d2VjaGF0X3FyY29kZSAke1dPUktESVJ9L3dlY2hhdF9xcmNvZGUvKi5wcm90b3R4dA0KPiA+ICvC
oMKgwqAgY2FjaGUgeGZlYXR1cmVzMmQvYm9vc3RkZXNjICR7U30vYm9vc3RkZXNjLyouaQ0KPiA+
ICvCoMKgwqAgY2FjaGUgeGZlYXR1cmVzMmQvdmdnICR7U30vdmdnLyouaQ0KPiA+ICvCoMKgwqAg
Y2FjaGUgZGF0YSAke1N9L2ZhY2UvKi5kYXQNCj4gPiArwqDCoMKgIGNhY2hlIHdlY2hhdF9xcmNv
ZGUgJHtTfS93ZWNoYXRfcXJjb2RlLyouY2FmZmVtb2RlbA0KPiA+ICvCoMKgwqAgY2FjaGUgd2Vj
aGF0X3FyY29kZSAke1N9L3dlY2hhdF9xcmNvZGUvKi5wcm90b3R4dA0KPiA+IMKgfQ0KPiA+IMKg
YWRkdGFzayB1bnBhY2tfZXh0cmEgYWZ0ZXIgZG9fdW5wYWNrIGJlZm9yZSBkb19wYXRjaA0KPiA+
IA0KPiA+IMKgQ01BS0VfVkVSQk9TRSA9ICJWRVJCT1NFPTEiDQo+ID4gDQo+ID4gLUVYVFJBX09F
Q01BS0UgPSAiLQ0KPiA+IERPUEVOQ1ZfRVhUUkFfTU9EVUxFU19QQVRIPSR7V09SS0RJUn0vY29u
dHJpYi9tb2R1bGVzIFwNCj4gPiArRVhUUkFfT0VDTUFLRSA9ICItRE9QRU5DVl9FWFRSQV9NT0RV
TEVTX1BBVEg9JHtTfS9jb250cmliL21vZHVsZXMNCj4gPiBcDQo+ID4gwqDCoMKgwqAgLURXSVRI
XzEzOTQ9T0ZGIFwNCj4gPiDCoMKgwqDCoCAtREVOQUJMRV9QUkVDT01QSUxFRF9IRUFERVJTPU9G
RiBcDQo+ID4gwqDCoMKgwqAgLURDTUFLRV9TS0lQX1JQQVRIPU9OIFwNCj4gPiDCoMKgwqDCoCAt
RE9QRU5DVl9JQ1ZfSEFTSD0ke0lQUF9NRDV9IFwNCj4gPiAtwqDCoMKgIC1ESVBQUk9PVD0ke1dP
UktESVJ9L2lwcGljdl9sbnggXA0KPiA+ICvCoMKgwqAgLURJUFBST09UPSR7U30vaXBwaWN2X2xu
eCBcDQo+ID4gwqDCoMKgwqAgLURPUEVOQ1ZfR0VORVJBVEVfUEtHQ09ORklHPU9OIFwNCj4gPiDC
oMKgwqDCoCAtRE9QRU5DVl9ET1dOTE9BRF9QQVRIPSR7T1BFTkNWX0RMRElSfSBcDQo+ID4gwqDC
oMKgwqAgLURPUEVOQ1ZfQUxMT1dfRE9XTkxPQURTPU9GRiBcDQo+ID4gLS0NCj4gPiAyLjM3LjMN
Cj4gPiANCj4gPiANCj4gPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiA+IExpbmtzOiBZb3Ug
cmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLg0KPiA+IFZpZXcvUmVwbHkg
T25saW5lICgjOTkwNzgpOg0KPiA+IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29w
ZW5lbWJlZGRlZC1kZXZlbC9tZXNzYWdlLzk5MDc4DQo+ID4gTXV0ZSBUaGlzIFRvcGljOiBodHRw
czovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQvOTQxNTM3ODcvMTk5NzkxNA0KPiA+IEdyb3Vw
IE93bmVyOiBvcGVuZW1iZWRkZWQtZGV2ZWwrb3duZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0K
PiA+IFVuc3Vic2NyaWJlOg0KPiA+IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29w
ZW5lbWJlZGRlZC1kZXZlbC91bnN1YsKgWw0KPiA+IHJhai5raGVtQGdtYWlsLmNvbV0NCj4gPiAt
PS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiA+IA0KDQo=


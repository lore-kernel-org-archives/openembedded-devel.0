Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3FF9C4332F
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 03:33:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web11.23424.1698896014370915356
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Nov 2023 20:33:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=IzGDf0RS;
 spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698896014; x=1730432014;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=F4UC5I1Dlgbsql5JxVlKBj4FYbkT5b0ZTl/shx2hhnc=;
  b=IzGDf0RSfusyw73TuwudwkVBWlcB/lnr6/c/5+jvLLBpQqDPWy1dhYnk
   pEGlgQsz2g1N9GpNd8d52O75pTk4WGCVGA0HY3U4riPqqgIf478Julyjy
   QPBxj6l1rJBSI0s91+hA5i4JdIiC4UNEpDKOhK4qT1f+hT0ZthG+aLRx0
   V7h+fDhss2jsWUCcos1milpagHGDqbYhWtRsGaLzAGi1iFzUfJTbXEyEd
   2fR/pLrgBjYAoS/pOy4frL8QfZVlqxZIOho+dBNT3eahVZw69MSu3WLOm
   XZBQtpZxCmAXtkrjMGNI3zU2GXzCD+fxHHnNoMyFDbazZ9vB4GEXCm3qO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="419742361"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; 
   d="scan'208";a="419742361"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2023 20:33:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="790275893"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; 
   d="scan'208";a="790275893"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 01 Nov 2023 20:33:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 1 Nov 2023 20:33:32 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 1 Nov 2023 20:33:32 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 1 Nov 2023 20:33:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=juxEPeDNX4ruroDWFr3KnNLuGqUUhcUhRBHIh5rw7J9JiGuagAWrGwxTsf7i8O3mYOKUOKUsz4Zw7ckp5vTtkn9L/yjJI5QXPrgAq8xodyeltcniZc/J9OH39BH9xXtpTLJJWBS8DaFOi4ieXiFTCyeKvcVcmTWpMCs+DoeIbxMzVFjyIrWnd+18BAmXhMQTSxbHCpIIxPBFqzVY7hoT90gJR+P1JXo/xzvbKyLE0IcQfkzMpQJkwbW9dnIwSzTkZs3cXb8aWDIt++d37LxqZKLLuqHqD/UOPtuZNdUiB3/yOxTfZf05wWcIksesivnv8aUssXOn/D8Dd8s5Qw8JSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F4UC5I1Dlgbsql5JxVlKBj4FYbkT5b0ZTl/shx2hhnc=;
 b=aiid1v2rDKNqc+cph1+NVSWUoKpemdazpQO2uFyAdPIdrNjlX2a5evSXaxa7CPK+l6s1TKrEdQRKkpgYPSYKIOwf2t3rPutAAo7lzyDAZeGWZ6wZphmTCjUWdOWvypIxoXWaNBporhQHukol6Jy83EaaqQUSOvwXQ/vbMjJnETdtOGgSKCn1ZpvQ6Eh7rdvtQ59QG14G+Hp7A2wFQmyFGkTJ6AhGHNnyqXF3uYkm5qEN4viTK75w+yLR2UqOQ6P3dbkBS41XyJFeeSK8D3TdFu4LjLrw/JCVOVAEW36cMfJgqM3qAv2KUAAfL6mFtIb3FDWoSQA7NXyIxF8HFQ+m3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by DS0PR11MB7507.namprd11.prod.outlook.com (2603:10b6:8:150::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29; Thu, 2 Nov
 2023 03:33:25 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::775f:2197:89f9:105d]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::775f:2197:89f9:105d%3]) with mapi id 15.20.6954.021; Thu, 2 Nov 2023
 03:33:25 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "mingli.yu@eng.windriver.com"
	<mingli.yu@eng.windriver.com>
Subject: Re: [oe] [meta-oe][PATCH v2] vboxguestdrivers: Remove the buildpath
Thread-Topic: [oe] [meta-oe][PATCH v2] vboxguestdrivers: Remove the buildpath
Thread-Index: AQHaDTzhCyZhKA93sUOyHcDJwJMzo7BmYDCA
Date: Thu, 2 Nov 2023 03:33:24 +0000
Message-ID: <b73b222a61dad218bc270f47f77d020c6fc6613b.camel@intel.com>
References: <20231102032939.3447809-1-mingli.yu@windriver.com>
In-Reply-To: <20231102032939.3447809-1-mingli.yu@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.4 (3.48.4-1.fc38) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|DS0PR11MB7507:EE_
x-ms-office365-filtering-correlation-id: 19795955-6aa4-45f4-bf6e-08dbdb54785c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KD55ZMnu0DkbIKuRVgnBwK2Jt3SUvfatBu0TZiYxHIS9egLKEHfPMqTi9FwBIYbUmOhuxWgS674/TnIQs/Gmc5jRL01vQtDutmsYk2lQQoqo6tKD9wt7l/huSk6OMgOjqknrHCjDEUb2rRUjkuYUWKEPSsEaXY9rMKSbnH3URhA9sFxBsiyXeViBOTsOzOO7WXIjB6hHZMRsrHUjTlKb2nHxkGOAh7wjoBhzxsEAjqaPwZ534EC+yUXy7ucbny3Mw2MK1/PMUamGsEiPRBI/iXJNxTL3svsvVJ6H46Moz7OsTD7IB/GyKqs3C/O74ArHMXjNrqhxKwlf/y0gA5EJOg9//e/2skbi8rmivJjGn3hs0MH7RPrXCnwKc7iuD7RVuR1wkJBR20S7WyA5sbn99nRTSe0mbyDzEWLs/wsNlnH9hJmSwc1QPawGwrODG+apZ/WLVRShsQROc2SKln7XjFTOFzuds2FAQVb9EnH10cEV5oqbzHVMCxkUIwJofxWBAsEoDPjN7A5c5+hCrGUTzWdSWTAgFfhOqR+zIdQ0Yoh/ZWoXHfMYUMAJLw424TMTTnmrP0geuqRypaIH23Poai0cwVETaqMCnY+eK/UlZXy4qScxx7O1i/giTZ/+C6+Lstqm4I6Xm6eKhcKFoaG18JoZ8UM8Nn0g8lPEjQ33FUc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(39860400002)(136003)(346002)(366004)(230273577357003)(230173577357003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(6486002)(8936002)(8676002)(478600001)(38070700009)(36756003)(122000001)(5660300002)(86362001)(41300700001)(2906002)(66556008)(64756008)(91956017)(110136005)(76116006)(316002)(66476007)(66946007)(66446008)(83380400001)(82960400001)(38100700002)(26005)(6512007)(2616005)(6506007)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TDJJMlJEckpIZDFRbVBQOEJ3NzJvYncrckdZUG44SjB5K2U2cngxNXA4dDR2?=
 =?utf-8?B?OHE4OGs3TG5ZZGZaUC9sM1M3bmFXMUQrZXRSdkRyOHk3dTROK3NoWENIbjAw?=
 =?utf-8?B?WGVoUlNsYUtRTWo2L0Z3SkhmazJNSlZ5T1Y1M3FzZXJwN29FNkxWNjhvdDFl?=
 =?utf-8?B?S09kbWNMS2p3T3F4WGk5cG1Uc25pZG1tdDR4blNjVFNvbng3eGw2TGRaNlJG?=
 =?utf-8?B?NHFGdUYxSFI4K2lITzl0dmhmQno2YUtqT3o3S1F1K0MyOGxWQjJKMDdLQVlD?=
 =?utf-8?B?RDFCNEJKYTBxRkNheGo5RkhCSFc5dHpsN2FLZUhMeTV3ZklhZWJFVG1BWGhQ?=
 =?utf-8?B?bm81UGpPNkhPZDhla0V3dGVjL01GSXVmMHR3ZWIrRW43QXkzZXI5K0htdjZV?=
 =?utf-8?B?V1Y2UlUyak43U0FtSG5lSFhUVDc1U3NZRmlITGZReGEyR0JCenVQb3c4WFJY?=
 =?utf-8?B?VW5lcHk3YTVxRWs4bUl3WTJVWDMxOWtBUjVLWG05MGRDZ0ltd3hnbHRDRHZH?=
 =?utf-8?B?RHBiOE1MUFh2cDVhZWVDQW5SSVJ2Y2VsQktFUXo5WG1DMUZNbGcyWDlZd0Y2?=
 =?utf-8?B?MHZEaXl1eDNwOUc5SFBjTWZseHhyN3luc0k2ZnZPeHBVam1yVUcxdERpbDY0?=
 =?utf-8?B?MElQcnl6czZQK0dMSFR6Vmd1anBSUmVjRmdhLzVoOVVlRUxDbmRrb0pRQ2FX?=
 =?utf-8?B?aFZ2VTBkOW8xSjhQYmlmQ2hyREd0bHVzQjVmUlFjZ0R6clJDYnhSbThVakpu?=
 =?utf-8?B?QXVhVDdSL1BmUHJtS01YWDdHaWJEbU9kVzhmeS80UW5uT2RXVFVCekU2aExo?=
 =?utf-8?B?dmljNVpZeHhPbFNDNW1MTlpXRlFPTnl4V0ZrR2pKTzMxd3JvcjFnVWE1bHZm?=
 =?utf-8?B?S216TzRCa0xOa3h2aHNyMTJ5bjd5eG5sWVpJM1VaaFJyVTNGZHAwRFFpSHhS?=
 =?utf-8?B?M3RtdGozUFR5Qmwwc0ZwQWJYd3BTRU9iZjdhSkRrOGRyTHY3d0pCb3ZDQUZW?=
 =?utf-8?B?RDU4V2hZUjBENkRzNjFET1QzMTc1YjVydUhJSTNSV0pJc2lvdW82MUlZcldl?=
 =?utf-8?B?STZVL2pxK1Y1THdtSHVvTis1K1FQWVUwZTdFeGpSb0Y0TmFjVzBJTTRLcWpV?=
 =?utf-8?B?blRNa3dnQzYrNmdYTnJiMG4vWVBtdjBpTEtPWmFvNVNoV05mYm01YVAvZGx2?=
 =?utf-8?B?TWdUK3J0QnE5VUhsM0pONlFjbEJEUXBxOGgzdmhNQW5tZDRINEV6c3lRaDl3?=
 =?utf-8?B?WjRyb1FzMDdnVDFHbmJWZmprYWJEdUR3K0FrdEdlcXI2V1NJVWp5S0RvZG91?=
 =?utf-8?B?RlN1NUtvbkYyazVQdnkwcEpIQ2M4TnJnaFJPSFY0WjN2MzBHdDN3TEt3cHgy?=
 =?utf-8?B?cFhkV05iZTJtdE42amF5NGNLUncweGl6c2Fnb3Z1SlI3OEFNRVo4N2hSVlh0?=
 =?utf-8?B?N0NlZWJvV1h6T3dJSXlyV2lpcHBhb3lQRnJSVm5PWGdQSnNxQ1d5aEpoNHVs?=
 =?utf-8?B?MUpQelFheVJBK1BydFZVWSt5eEV4eGdNaGEySWsvU3ZWRXliSjJSSEZWK3Ji?=
 =?utf-8?B?VE5NSG93NXpoZCsrUHNFSmdIaWZ0SWdHUWUxTS9pbnc0V3lCOXcvT1ZNZTY1?=
 =?utf-8?B?NENVMVNIamppeGlKa0NydndMNkI1Sm1hUjRocmdRMU1mTXpoMzZZbFB3aEQ2?=
 =?utf-8?B?N0FieFZKOU9rQTVYeXhoa3JUM1pHa2o2Q2U3YXI2aVdzNzVnMEVBK2lzRUZz?=
 =?utf-8?B?bVVpUUhCaHVCb1ZGSjNOUTdvRFE1Y1dDQUFZbWJ3RWlsOEhtUDNtNitBS1po?=
 =?utf-8?B?ZzZmUXFlRU1mQzdYS2lRcGg2K1VpM1hXMklaTkMrRFA1aWd6WmZON2drOWZB?=
 =?utf-8?B?QVY5SVRYWkp4VW1COXVVWWJKR3lGL2pRNkJnSEpkaVd4TmxGVWZKUktLeHdj?=
 =?utf-8?B?Y1IrV0RhQTBrUGFYUFFZRDJXM3dZaitzME9yVWFLcW5QaFlOUVkvT3A4eHJW?=
 =?utf-8?B?MUl6cm43VkxwUVVZdW1iWEptOUlTRXkxcm5nRTdESFJjRFB3Rk1FL1FDUUZw?=
 =?utf-8?B?aE14NzViNlpmQksvOTlDWDZQVFhlSSt2N0pxdjZqdURkMWE2dWdLMzFYNFRk?=
 =?utf-8?B?TDVuTXJaSUtseGxjRFpnNDlScUorc1JTbndhSjZoSE0rOUhhRGp4ZFNDbXQ4?=
 =?utf-8?B?Y3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BB89CB5CB0A735499681CDE570C55D48@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19795955-6aa4-45f4-bf6e-08dbdb54785c
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2023 03:33:24.5803
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WM4Ppm06RKzj0nfb17jNQ/QMgRW98OfOat7JsYwdkm7MRuOU5bQLw6YODZoOiBjxQQF2aBbEHKB2zslSvP3JQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7507
X-OriginatorOrg: intel.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Nov 2023 03:33:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105831

T24gVGh1LCAyMDIzLTExLTAyIGF0IDExOjI5ICswODAwLCBZdSwgTWluZ2xpIHdyb3RlOg0KPiBG
cm9tOiBNaW5nbGkgWXUgPG1pbmdsaS55dUB3aW5kcml2ZXIuY29tPg0KPiANCj4gRml4ZXM6DQo+
IMKgIFdBUk5JTkc6IHZib3hndWVzdGRyaXZlcnMtNy4wLjEwLXIwIGRvX3BhY2thZ2VfcWE6IFFB
IElzc3VlOiBGaWxlDQo+IC91c3IvbGliL21vZHVsZXMvNi4xLjUxLXlvY3RvLXN0YW5kYXJkL2tl
cm5lbC9taXNjL3Zib3hzZi5rbyBpbg0KPiBwYWNrYWdlIGtlcm5lbC1tb2R1bGUtdmJveHNmLTYu
MS41MS15b2N0by1zdGFuZGFyZCBjb250YWlucyByZWZlcmVuY2UNCj4gdG8gVE1QRElSIFtidWls
ZHBhdGhzXQ0KPiDCoCBXQVJOSU5HOiB2Ym94Z3Vlc3Rkcml2ZXJzLTcuMC4xMC1yMCBkb19wYWNr
YWdlX3FhOiBRQSBJc3N1ZTogRmlsZQ0KPiAvdXNyL2xpYi9tb2R1bGVzLzYuMS41MS15b2N0by1z
dGFuZGFyZC9rZXJuZWwvbWlzYy92Ym94Z3Vlc3Qua28gaW4NCj4gcGFja2FnZSBrZXJuZWwtbW9k
dWxlLXZib3hndWVzdC02LjEuNTEteW9jdG8tc3RhbmRhcmQgY29udGFpbnMNCj4gcmVmZXJlbmNl
IHRvIFRNUERJUiBbYnVpbGRwYXRoc10NCj4gwqAgV0FSTklORzogdmJveGd1ZXN0ZHJpdmVycy03
LjAuMTAtcjAgZG9fcGFja2FnZV9xYTogUUEgSXNzdWU6IEZpbGUNCj4gL3Vzci9saWIvbW9kdWxl
cy82LjEuNTEteW9jdG8tc3RhbmRhcmQva2VybmVsL21pc2MvdmJveHZpZGVvLmtvIGluDQo+IHBh
Y2thZ2Uga2VybmVsLW1vZHVsZS12Ym94dmlkZW8tNi4xLjUxLXlvY3RvLXN0YW5kYXJkIGNvbnRh
aW5zDQo+IHJlZmVyZW5jZSB0byBUTVBESVIgW2J1aWxkcGF0aHNdDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBNaW5nbGkgWXUgPG1pbmdsaS55dUB3aW5kcml2ZXIuY29tPg0KPiAtLS0NCj4gwqAuLi4v
dmJveGd1ZXN0ZHJpdmVycy92Ym94Z3Vlc3Rkcml2ZXJzXzcuMC4xMC5iYsKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB8IDMNCj4gKystDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBl
cy0NCj4gc3VwcG9ydC92Ym94Z3Vlc3Rkcml2ZXJzL3Zib3hndWVzdGRyaXZlcnNfNy4wLjEwLmJi
IGIvbWV0YS0NCj4gb2UvcmVjaXBlcy1zdXBwb3J0L3Zib3hndWVzdGRyaXZlcnMvdmJveGd1ZXN0
ZHJpdmVyc183LjAuMTAuYmINCj4gaW5kZXggOGU5MDEzODI0Li44NDc0NTg2NDUgMTAwNjQ0DQo+
IC0tLSBhL21ldGEtb2UvcmVjaXBlcy0NCj4gc3VwcG9ydC92Ym94Z3Vlc3Rkcml2ZXJzL3Zib3hn
dWVzdGRyaXZlcnNfNy4wLjEwLmJiDQo+ICsrKyBiL21ldGEtb2UvcmVjaXBlcy0NCj4gc3VwcG9y
dC92Ym94Z3Vlc3Rkcml2ZXJzL3Zib3hndWVzdGRyaXZlcnNfNy4wLjEwLmJiDQo+IEBAIC0yNCw3
ICsyNCw4IEBAIFM6dGFzay1wYXRjaCA9ICIke1dPUktESVJ9LyR7VkJPWF9OQU1FfSINCj4gwqBl
eHBvcnQgVkJPWF9LQlVJTERfVEFSR0VUX0FSQ0g9IiR7QVJDSH0iDQo+IMKgZXhwb3J0IFZCT1hf
S0JVSUxEX1RBUkdFVF9BUkNIOng4Ni02ND0iYW1kNjQiDQo+IMKgDQo+IC1FWFRSQV9PRU1BS0Ug
Kz0gIktFUk5fRElSPScke1dPUktESVJ9LyR7S0VSTkVMX1ZFUlNJT059L2J1aWxkJw0KPiBLQlVJ
TERfVkVSQk9TRT0xIg0KPiArRVhUUkFfT0VNQUtFICs9ICJLRVJOX0RJUj0nJHtXT1JLRElSfS8k
e0tFUk5FTF9WRVJTSU9OfS9idWlsZCcNCj4gS0JVSUxEX1ZFUkJPU0U9MSBDQz0nJHtDQ30gJHtE
RUJVR19QUkVGSVhfTUFQfSAtZmRlYnVnLXByZWZpeC0NCj4gbWFwPSR7U1RBR0lOR19LRVJORUxf
RElSfT0ke0tFUk5FTF9TUkNfUEFUSH0gLWZkZWJ1Zy1wcmVmaXgtDQo+IG1hcD0ke1NUQUdJTkdf
S0VSTkVMX0JVSUxERElSfT0ke0tFUk5FTF9TUkNfUEFUSH0nIg0KPiArVE9PTENIQUlOID0gImdj
YyINCj4gwqANCg0KV2h5IGlzIHRoaXMgcmVxdWlyZWQ/IFRoaXMgaXNuJ3QgbWVudGlvbmVkIGlu
IHRoZSBjb21taXQgbWVzc2FnZS4NCg0KVGhhbmtzLA0KDQpBbnVqDQoNCg==


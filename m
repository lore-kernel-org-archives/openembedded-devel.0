Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4F8DC25B75
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 08:05:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by mx.groups.io with SMTP id smtpd.web11.9436.1715760300043316547
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 May 2024 01:05:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=AL0ihpiv;
 spf=pass (domain: intel.com, ip: 198.175.65.19, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715760300; x=1747296300;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=rnhNrRCis07Q9CAEeodMPsfzFHPKOzP5Qo2a5bzFejA=;
  b=AL0ihpivpfz+4iB6Zc6vGfUD8NOt3iqDMkrOdklK3MFeWHKq68VdLoKg
   xPz4+HTfK+Jy7vr4Y73wM95/M64sfTg7DlsbNYNcaVOBf598s4hwYWKGP
   NkIEC3yFIHedVcjY4r2VayOukS5oC8WGri3elncj59cb8bCsLK1RwYKP3
   Qcoz4M19RfGZ2k0LnV7q6gtx1me2la13RK4Rbk6Rov4IGsRXXEGlCdaJv
   d/79KKOFtORL6Io+usEajoT+GLC2ga5Oe/RrXCuf3UQlb2IJDi5h07cHk
   26095p+E7cb6JEVjhOmnntXabLLzQZMjxHVZZsCwBO4KB4dBfbbg3yzHM
   g==;
X-CSE-ConnectionGUID: DWDPwgUoRGCgLqCxZ3cd0A==
X-CSE-MsgGUID: jvPxgZwiTMW6BL88MSISnQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="11645821"
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; 
   d="scan'208";a="11645821"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2024 01:04:49 -0700
X-CSE-ConnectionGUID: n2Yd0xmKSBu/VXG+NPPFgg==
X-CSE-MsgGUID: S2MmwI2aSkSp1HUqX70GIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; 
   d="scan'208";a="54174746"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 15 May 2024 01:04:49 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 15 May 2024 01:04:48 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 15 May 2024 01:04:48 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 15 May 2024 01:04:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gfzr5yZq4OsyD77jrxdvXJEkJMjvez88LQfohccol2F3FSQ7iBn+kBoZaiBCBLnhKVj1nSWnvG30AnVhf/0b8LuzteznO4V9b2n3HddLN+1TQaVbZeoYRt9Ke/7xsy6F8eGJy7fGc2WUgEJL6CCJgVrA++vseR0NrHiAM492yrm//sSv/nWFBLWSBGtUZIFy6TbELwMeF7TJEXtT7wHB5DoHT4q/+hR0DE12SSMFMXMLOfM/6inr37Ub6vHl56TfyYpMWA0/NbPSuTA4isDyLX9jf+/Oyxh3icJPg1spFRKF6UXMfHYctWOFhmzFzNYDTZjXvp/4Y/HfmYWruc+XNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rnhNrRCis07Q9CAEeodMPsfzFHPKOzP5Qo2a5bzFejA=;
 b=K4S0mlgtzqfpUsKoqM9yB+OLDcNCH9cIUx0GlBmel8UiJY6qRFjrzpZ4HvR1yEJVZrzcFVtheDUiSD1568Gk9ZyGrjoyOobsdMyIQUn7UxMA+ZbkucftGljXMYFVmwk7h5fpZ1bodXCljO+COjWCYRSj709pzNpkVglk0gmGzs7IiPx7bT7/n84XpWKuSdCGB6UbxWaGLxHw/yePVNxppuCL1aKgVyE/t4hWb7XI6IDAVvFbvhRu85NNwv10xyYF2gQzDpk1oRaWKVua1UDTY/FCHtVWwECyTdnOkrEW/U3ifDPc7jUmsjzZjNOcixsb2qk41q0anhnsTeQXFoWcYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6430.namprd11.prod.outlook.com (2603:10b6:8:b6::15) by
 SA1PR11MB8448.namprd11.prod.outlook.com (2603:10b6:806:3a3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Wed, 15 May
 2024 08:04:45 +0000
Received: from DM4PR11MB6430.namprd11.prod.outlook.com
 ([fe80::9378:e70c:77ca:d46f]) by DM4PR11MB6430.namprd11.prod.outlook.com
 ([fe80::9378:e70c:77ca:d46f%7]) with mapi id 15.20.7544.052; Wed, 15 May 2024
 08:04:45 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "abhilash.kollam@gmail.com" <abhilash.kollam@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [PATCH] opentelemetry-cpp: add opentelemtry recipe
Thread-Topic: [oe] [PATCH] opentelemetry-cpp: add opentelemtry recipe
Thread-Index: AQHapoedWyK6Gant50WNDRnJa8c/CbGX8AgA
Date: Wed, 15 May 2024 08:04:45 +0000
Message-ID: <d0f2806d27a4cac32d0760c0e1289daf0261c687.camel@intel.com>
References: <20240515052002.3843823-1-abhilash.kollam@gmail.com>
In-Reply-To: <20240515052002.3843823-1-abhilash.kollam@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.50.4 (3.50.4-1.fc39) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6430:EE_|SA1PR11MB8448:EE_
x-ms-office365-filtering-correlation-id: 81414e99-4496-427e-dddd-08dc74b5af2f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?UXJmemFBRWZ1SUVNdHZPZWZYQVJndE5IT0xqeDJSS0dLZkg0bGRGTzU5UzFy?=
 =?utf-8?B?ejB6Zks5U0lYY1lUTWJrRlZmMW1QdWdPcFlDQWhuQ1phOWo2TTFlM01vRm5V?=
 =?utf-8?B?d2dEMTVDUUxtdEJNd0pna1JEVUM4eWtDQmhSV0pDYUwvRENzV1M4V3FBeExN?=
 =?utf-8?B?UXMxd004RUoxS1lTMm13blpqa0o3VDlzVHNvSjJtVjlkZnQ3bEovNlE1SmFE?=
 =?utf-8?B?ZHk1eG1vUVQwTTkybXFvcjNXQUdFUWpHaDNZYVcvU3FrU3prNXgvU242dHEz?=
 =?utf-8?B?L0FJQ0htY1ErdmxmKzNnRzM1cC9iOGd1TTlzV3JmaS95U1lCL2VkK1lObHhP?=
 =?utf-8?B?UzFEZWwrR1lINStHSEtxZGh4ZE9hSVFZcmVxTTJUNHFHem1UaW5XSEgxc3pM?=
 =?utf-8?B?SEZOYjkrUk9ldXAzYnJ0TTdIQUpRVnZwSTg1VWpkVTFFb0Zpb0NMZlBsMVhS?=
 =?utf-8?B?Y2plNjNRbFhOYjc1RVFSd2Z2cE5PYnFjaGV5elkrODhWSlJRS2Q5bEM4Szky?=
 =?utf-8?B?N2tQQmlpUmhlN0Jja0NXR1dhRDJreCtrdEpYOGlVbzZrNFhVeExRVGNMd0NS?=
 =?utf-8?B?RzZKU2F4SFZLb3Uyc2VodlB3aWhnVXhSdnl1Qm1ueDU4Y2JUWW1oL2RWSXMx?=
 =?utf-8?B?K0dBYkdXOXZxRXJBOXg0QXczcFRWOUVhMldrZGYwM2hEc0RXMG1US28wUUFa?=
 =?utf-8?B?dmdNcjhBd2xFRkRzeUdnS0N4K1dacFhkODM0N3NWSVdsN044TWZacGFFMGpF?=
 =?utf-8?B?ZWRtc01iMmlzR3RWZG41S3Q0ZEpVRXhiQVc1ZkxRZmdGOVVwQkdLb05BQXpu?=
 =?utf-8?B?V25STk52aUREc01aRlF0bGpsUEgwMU9pTmJQRjBlSTRaSG9HSkhOY0hSNU96?=
 =?utf-8?B?SzRxeUNMQk1rc0VMRyt5NWY0b3Zvd0doZ1ZMTThvdFV4alVFTjY0N2dQS2p1?=
 =?utf-8?B?OE1IWG9selg4M3V1S09Fb250R2RCdEF3WE1mY3IwRE0xUEpkQXNZVlN0dlRM?=
 =?utf-8?B?SFdQc2lvRFcwUkJqWnVUK29abmJ5ajY5RkdHUGNieGE1cm1VMkpPblRKRnla?=
 =?utf-8?B?NkQyaGsveHVzbGV4M1d5VStBUjljeWErSU1mTVZmR2Z5b1o0c2lwR3dGbHZO?=
 =?utf-8?B?RlhBMWs2Q2lnbHorVi9rcHVib0VIUUtqUmVuaDc4ZlJXSVk4S2x0N1MvUTdq?=
 =?utf-8?B?eVRsSUZYS1NUczlKT3c2dU9VT0pVUEhsT3FwQmhBY1ZibCs0Y1lmMGRZQmJk?=
 =?utf-8?B?OHRrQ1FQcDVSZjFIcVJQN3dwZ2t2L2ZRU1AvTUxaMmJtaGhMbkUxMUVyY25l?=
 =?utf-8?B?bmNJVjgvT3JWOEhtS0pxUmFodWhuaEpXNU9SRFJraXVOREswc1VTTkl4VEVn?=
 =?utf-8?B?RGJPUldPcXFxU0cwZW5UOXFSVDJLUFYvNW1wa3kxOE1JazQyWi9kRnRhUUZF?=
 =?utf-8?B?WWRuelJON2xYY2VJM3lUREU5ZzYvYjd6bWl4UXlyOGo0WXY1ZlluNzhScnBB?=
 =?utf-8?B?UGN0M0tLKzVHN2M5a2NSZk9HU3VHMUlYVzZUUzI5Q3lTbHQ5ZE9lQzN3ZDU1?=
 =?utf-8?B?bllZcEdxcmJuT3FwSGNlTWRiYkMwSDM4K2wxNWpVcndQOGEraHF0b3hSbm85?=
 =?utf-8?B?UC80MnFCQk0xM2I3blI4L3ZLYXZveVlUT1owOUdKQitHNTRCUkgrZjhqd0pl?=
 =?utf-8?B?dFJjc0llZnZDZFVWSHpxUlZTbVdjS2JxRTlGc3EyRm5HeS95ZVQySDlCNHFD?=
 =?utf-8?Q?Qb6HSBNS11A/GxeaIM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6430.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SHBpb0diT1VLSFJDeTdjcjZPYkdhQzdWcndMQkoxSy9jVjZMME9OblhsMlBa?=
 =?utf-8?B?MHhEbWluVnkzSlUzZnN2ZWlxbGlBaEpJM29tMnRBNDhMNkxwZUNGUElpK0JG?=
 =?utf-8?B?VWtMOHdwYWdhTGQ3Y3NJMU1RYnhJVUJnVGREWWlVc1BOR2VGOGYyeW02NUQy?=
 =?utf-8?B?bFhteGgxQWd6cHlxSGdvWHJSeTY2YWNjY05Nc1ZwNm9EdnJEKzBydHpvdUFv?=
 =?utf-8?B?Njlhdndjb1FyUllXVXpPRHlrSVdwajZVYTVJZDc5T2VrSTcyMUFoNHdiVzRt?=
 =?utf-8?B?NlA2THdOWjVVbENnNlJ4ZlRWTnFqV2lteWpISmw0Q0RuQkYvRnlXUGhvWXFB?=
 =?utf-8?B?ekF3eUpxWVdCQ0REb2pJdUJDN2pveFhDZlg3QmtTdzJrMVhTbXNmV1V4STNy?=
 =?utf-8?B?ZWowVnJqd1hEZS9ab0FqSS9qVUV0ZEY3WVErNjV3MWlHMml3ZHAxeGI1SlZH?=
 =?utf-8?B?ZVptc25wdW9jVCsxdW82OURISlJGV242eDVyeWIzZXJ6R25EeTF3VEM1UzYx?=
 =?utf-8?B?eUJ5c1YvY2Zwc2NPbTZ3SUN0d29NczBJREd0cU5DRmUvV01ORkZxMGxtNklZ?=
 =?utf-8?B?SXJlR04zWEJvTWE3cTVkRDk5cUI4YzYxN3JGQnRhcDd4RDhxVlRPQkRSTjA2?=
 =?utf-8?B?c2o2L2cyZ1Y5MytFYUo2Tjd0OWpGbWUzalJLY1ZXTWw0V1FnTDhTNDc5UXlp?=
 =?utf-8?B?TU5zVnNINDhsT2RUVWM2U0c5a0xCY21SQjhoNldyN3NqYnhyYWlQOE9rRUF6?=
 =?utf-8?B?R2JqRHdXV3BlOVRYeXNSdTFCUUdWL0tEMXlyMkFYN2lmN3Izb0MxbU5HSk9m?=
 =?utf-8?B?WDQvV3JsblRXMjl6T0h5Nk9LUEM4eUtYckdpdVNOR3VydWMxL2dhYnMyZEVJ?=
 =?utf-8?B?NVpRTG9kTTRvUENwZlV0SUJiUkpuOXY4YUt0Zm9jQ3JXNWxhMWFRaitFWC8r?=
 =?utf-8?B?RGpHbDhvUDRJRmRVbXZXMnl4WnVsYnRsdUpZL0Nhb0Jhb3ZEWkVKekszZUVn?=
 =?utf-8?B?RUQzSlN1alErQ05wTkx3TlhLVTBpdEl1eTIxdnptS1VvbWRXdUtHVmNyaStG?=
 =?utf-8?B?Wlo1ZnA0ZTVkSHlTSWZyT0o0ZXF3WDdUbHlMN1VpUWcrbGpjMWxMYkhRZWpX?=
 =?utf-8?B?d1pCYkI4aGp6MHU2VkZFd2dzbEQ5VUwxZUlMa1JNWktsbHRCZVZ0Nk9MYTdo?=
 =?utf-8?B?NjBoN1Y1OFlJSEk2UGtUQmdHbG5oVXpWdzJFMHJGWGswSGFLdUtVUXBKc2kr?=
 =?utf-8?B?MXV1N3BOdVJzZTBNaFhiNUVZRmpWcVJQb1JSVTMzTTdtNWdCZndXRGpHc2dY?=
 =?utf-8?B?SzhBUG1RUkZpQ2R2bUhEdEpDVVlEV2R1SUpVY1dpS092eHRJRU9WRExyWTdJ?=
 =?utf-8?B?VWhxbWpMYjZRZUp3OEJydjlxRXBjLzFmS0FkZjdiVjM4bFppV0FnK1krZmdQ?=
 =?utf-8?B?TGlKRTRIWkIvQ0p2V2Jlalc0QUFSdHptVXhQa1Z0SC9mcnVMU3RsNjVBbmFW?=
 =?utf-8?B?dlVyZ1pjZW1tTEZ2YnljVThvVkNGRVdrQWd0bDdoaWsvZEo1TmJYYTJpNGR6?=
 =?utf-8?B?LzlyblBueGszWXZGL0VuUEpFL0VTeEF5c01kTUNscWt4eGZPNGpmdnl2RUk5?=
 =?utf-8?B?VGU3eUlrbVpQTE9ZTW11S2dLTkxHYWJXbjc3NmhzSGpJV1krUTlzblVML3hl?=
 =?utf-8?B?SnFxaWE2ODZmWUM1VXlwSGFJellqSll2SGpLUGZyNmZYdHY0S0dwRFlEdjNP?=
 =?utf-8?B?ZmkvaGxIMmlSK0RUWHBlNVJsYmFHR1JwWXJrRCsrOWVRN3V0ak95RkNkWFo5?=
 =?utf-8?B?T09yZW9BaWF6Q3BaZk1VVytWN1BFSEhIVlBMekNDaXdwMkhzYzljbDREN1hU?=
 =?utf-8?B?WW51c2p3OWwvRmdCMXV5ZFRhN040UDZmYnV4YkdsZHBSTGpsS3YxbWdZODhM?=
 =?utf-8?B?S3dlNW94WmE0bG92SFgrUTkzTjhoQ09qNHMxWUo5UlJXbC8zZ3hWL0FLYXo1?=
 =?utf-8?B?bk9NWHZFRG9JQVhoeEJsOTluNlVudzkwQUJjQ2Q1c3k2VmJNVXEyK2syVitP?=
 =?utf-8?B?SldHOTlyYmJtcFZlakVZdUVoQVMzZlFBUUM5a0FWcDQxbENpY1lUYUdNSmVZ?=
 =?utf-8?B?M0J4aEYxZ2dTRy93NWlHaGFqd2dwQXQ4bnAzYk9TenVkcVFRMzJhNjdacXFn?=
 =?utf-8?B?VUphaksxMkxBcndFK1JuMVZZd25DVFJ2bkkwbVBNOEtXNng3cXIzNUVCRnJJ?=
 =?utf-8?B?NUtOSnNHNjJzcWI2R0JsclpNb3NBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <38FBA1918CF99140A113F05ABD98744C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81414e99-4496-427e-dddd-08dc74b5af2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2024 08:04:45.6275
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: leNas8Lf99WEqu7VTBihJfpNR28Cx5zboVfUnHeQK5Ls88WUO8u+t0jasU8LHeblFA5xv5IQ85FkTwxU79YDOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8448
X-OriginatorOrg: intel.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 May 2024 08:05:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110403

T24gV2VkLCAyMDI0LTA1LTE1IGF0IDAwOjIwIC0wNTAwLCBBYmhpbGFzaCBSYWp1IHdyb3RlOg0K
PiBBbiBPYnNlcnZhYmlsaXR5IGZyYW1ld29yayB0byBjcmVhdGUgYW5kIG1hbmFnZSB0ZWxlbWV0
cnkgZGF0YSBzdWNoDQo+IGFzDQo+IHRyYWNlcywgbWV0cmljcywgYW5kIGxvZ3MNCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IEFiaGlsYXNoIFJhanUgPGFiaGlsYXNoLmtvbGxhbUBnbWFpbC5jb20+DQo+
IC0tLQ0KPiDCoC4uLi9vcGVudGVsZW1ldHJ5L29wZW50ZWxlbWV0cnktY3BwXzEuMTUuMC5iYsKg
wqAgfCAxNw0KPiArKysrKysrKysrKysrKysrKw0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNl
cnRpb25zKCspDQo+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEtb2UvcmVjaXBlcy0NCj4gc3Vw
cG9ydC9vcGVudGVsZW1ldHJ5L29wZW50ZWxlbWV0cnktY3BwXzEuMTUuMC5iYg0KPiANCj4gZGlm
ZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L29wZW50ZWxlbWV0cnkvb3BlbnRlbGVt
ZXRyeS0NCj4gY3BwXzEuMTUuMC5iYiBiL21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L29wZW50ZWxl
bWV0cnkvb3BlbnRlbGVtZXRyeS0NCj4gY3BwXzEuMTUuMC5iYg0KPiBuZXcgZmlsZSBtb2RlIDEw
MDY0NA0KPiBpbmRleCAwMDAwMDAwMDAuLjg1ZGY1YmU4Mg0KPiAtLS0gL2Rldi9udWxsDQo+ICsr
KyBiL21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L29wZW50ZWxlbWV0cnkvb3BlbnRlbGVtZXRyeS0N
Cj4gY3BwXzEuMTUuMC5iYg0KPiBAQCAtMCwwICsxLDE3IEBADQo+ICtTVU1NQVJZID0gIk9wZW4g
VGVsZW1ldHJ5IExpYnJhcnkiDQo+ICtERVNDUklQVElPTiA9ICJBbiBPYnNlcnZhYmlsaXR5IGZy
YW1ld29yayB0byBjcmVhdGUgYW5kIG1hbmFnZQ0KPiB0ZWxlbWV0cnkgZGF0YSBcDQo+ICtzdWNo
IGFzIHRyYWNlcywgbWV0cmljcywgYW5kIGxvZ3MuIg0KPiArSE9NRVBBR0UgPSAiaHR0cHM6Ly9n
aXRodWIuY29tL29wZW4tdGVsZW1ldHJ5L29wZW50ZWxlbWV0cnktY3BwIg0KPiArU0VDVElPTiA9
ICJsaWJzIg0KPiArTElDRU5TRSA9ICJBcGFjaGUtMi4wIg0KPiArTElDX0ZJTEVTX0NIS1NVTSA9
DQo+ICJmaWxlOi8vJHtTfS9MSUNFTlNFO21kNT04NmQzZjNhOTVjMzI0Yzk0NzliZDg5ODY5Njhm
NDMyNyINCg0KJHtTfSBzaG91bGRuJ3QgYmUgbmVlZGVkIGhlcmUuDQoNCj4gKw0KPiArREVQRU5E
UyA9ICJubG9obWFubi1qc29uIg0KPiArDQo+ICtTUkNfVVJJID0NCj4gImh0dHBzOi8vZ2l0aHVi
LmNvbS9vcGVuLXRlbGVtZXRyeS9vcGVudGVsZW1ldHJ5LWNwcC9hcmNoaXZlL3JlZnMvdGFnDQo+
IHMvdiR7UFZ9LnRhci5neiINCj4gK1NSQ19VUklbc2hhMjU2c3VtXSA9DQo+ICI2OWIwZmVmMzgw
NjU4ZTE1YmU5ZDgxN2JmY2IzMmUzZjVkZTk2ZGE2NTJiY2RjZTc3YjRlNzUwZWQ4YmVkZGVlIg0K
PiArDQo+ICtTID0gIiR7V09SS0RJUn0vb3BlbnRlbGVtZXRyeS1jcHAtJHtQVn0iDQoNClRoaXMg
aXMgZGVmYXVsdCBzbyBzaG91bGRuJ3QgYmUgbmVlZGVkLg0KDQpodHRwczovL2dpdC55b2N0b3By
b2plY3Qub3JnL3Bva3kvdHJlZS9tZXRhL2NvbmYvYml0YmFrZS5jb25mI240MTENCg==


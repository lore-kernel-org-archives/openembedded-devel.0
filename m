Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5978DC7EE22
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 14:25:13 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web10.33985.1683642304914023143
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 May 2023 07:25:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=Wq9EIj6d;
 spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683642304; x=1715178304;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=2DebGRKvwjPteiGfyaOf7PpLkYqVw1egraSPsincPMs=;
  b=Wq9EIj6daXmLHc3nXG6FXw8F7XLoGuUUHdDwjnongVOGYAF5Xylh7/oq
   jCAuYnhUUpl7ImicVD7sYmzy+IzyE0UdvIYb86Dof8mcKhoeXbvZ4s7hh
   FLHGfla1sS6ICpuoQ0P752cjSsJatd6nnXowtBocBw1wwK4Wl1uM+sp+z
   VjN4J+YHHtxlxx3FePhIcuxyO5bOEb1tULt1x6+T/hl1dpmkELIKdkxf1
   Yyv/V9WHVaDIc8JNfEb3+vN7WQUJlEiyejD7WRiHjiDaZkEGi5AVaFg/p
   PKmwY/r8fOG882IIJSYLpFJ70e2pcqHTQFeA+XTemEGENC3ZK+0FM/ZCa
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="329563937"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; 
   d="scan'208";a="329563937"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2023 07:25:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="873212927"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; 
   d="scan'208";a="873212927"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga005.jf.intel.com with ESMTP; 09 May 2023 07:25:04 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 9 May 2023 07:25:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 9 May 2023 07:25:04 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 9 May 2023 07:25:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P/2i664sRCG325tVu5vTOFT91/xm/UWPXqgRt387E9rgjdFz+G6hy344199Ipvh0LTbEBZlBwPFh++kfb23N668pQiRf4wka2camosI+9Q6InsGazrknvRz//Hn8GcDtsBBFe4g9artnB6PhpphZd/lABDepMZWQ8BbjRWDAe6/WSY2G/oPTER97cnCvvLp0wAIpiNYEILh0NTWZjYAO7HvyMLL4LxY9WNWrTYfGNbeA3Fo95KYS1gwVBAQ0ZDEl3CFfXkgity9xw+cDBANI3SrRFM3E9I+JECe7IJ0kEvL+Nx6ZvZXMaVRf4xle0+JI//1Di7iOCnh2NCl/1EwBrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2DebGRKvwjPteiGfyaOf7PpLkYqVw1egraSPsincPMs=;
 b=YdJwQf62lkXGI65KhzGkPyIx7qXEVD4tcTgSDoWsRaGVYsqxGIisN5MX7Tv8+hystRTgSVB+kLt+FcE++vT139yH51L8DqSpWZ9xNbGwbM79/1KBpr6fF1wEnsJE0FdCUwCjApLTnpVVufv72xD3I4Jd7eyLyBaHFvZ7b5qElG6BCM05LQV1P3RJWetFx6IXAoHbdCOelRoBIQ/FmqCfs3cgXyXtnDLt9B8Mp53uLKXGltcB6/ubQIimx3AkfmO3SkGwFO1LHcRITD6hyFms0VmjmVexuqj+veD4e1dJaEkMiIj8CJJpDnrE0zahZN4Unm5mVxvzcI4E+lHxHtDmIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8093.namprd11.prod.outlook.com (2603:10b6:610:139::10)
 by IA1PR11MB6169.namprd11.prod.outlook.com (2603:10b6:208:3eb::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Tue, 9 May
 2023 14:25:02 +0000
Received: from CH3PR11MB8093.namprd11.prod.outlook.com
 ([fe80::290e:f138:7910:e1fa]) by CH3PR11MB8093.namprd11.prod.outlook.com
 ([fe80::290e:f138:7910:e1fa%7]) with mapi id 15.20.6363.033; Tue, 9 May 2023
 14:25:02 +0000
From: "Lee, Chee Yang" <chee.yang.lee@intel.com>
To: akuster808 <akuster808@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][kirkstone 1/2] freerdp: fix
 CVE-2022-39316/39318/39319
Thread-Topic: [oe] [meta-oe][kirkstone 1/2] freerdp: fix
 CVE-2022-39316/39318/39319
Thread-Index: AQHZgmOrJjzKvBRkH0izvas9U4ZcPa9R9RZw
Date: Tue, 9 May 2023 14:25:02 +0000
Message-ID: <CH3PR11MB8093EA312B48D5FD6CF35A18B9769@CH3PR11MB8093.namprd11.prod.outlook.com>
References: <20230509035309.3773590-1-chee.yang.lee@intel.com>
 <fe01ab3f-ca1a-6aeb-0e9f-151dcfe622d5@gmail.com>
In-Reply-To: <fe01ab3f-ca1a-6aeb-0e9f-151dcfe622d5@gmail.com>
Accept-Language: en-SG, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8093:EE_|IA1PR11MB6169:EE_
x-ms-office365-filtering-correlation-id: f6dd5e39-efa4-4129-8a06-08db50992d50
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OmF627hDjCWApgXepPwKw0hm4UNxygAgpdt1yURNUinPsutgyeaEslMyCsXjJSWPRgxZlg776+EddXWeVtaVJv23BlkaaKhWknf0MOgz2U1SzHK2XzMr2ucjjGWpvzW+Z9mvbcIu3lsCZ+toranxuyeeA1DSiaZPeCiJgRHzVEEI2wzGxT09lSVda2QHB53kZSlv0C3ELkiGQNI3ygA+LtJfnjTXsPH8BMVSJNsENDRzmFLOVJr5NuEknp5ou5IiSxD31u4yX0QrwwIuK6E49ln+VLpIMXxMD3nSmcmrq1xlS6j9RlOAySQSJunhFR7aOx756U6dppSwwHyqfVT2DFliCbYHrsMp7wbsyTQzL+xzoHhIHwL6Kk0hdDPLmje2L6jFYOHAbF+EO8YWwcxC46+lLzGKA343JcWE2TZ67GDzp1r4HAI0LBkuiEkniNKPGH2e9PSPGooAveKagtNRV00DHBaJRvQ5hNEcEi0z2CkykTNg3tudVjF/5IxAIyawzd5B8TImWOuRdcrnkVxtbYeid8UhwLgwJJScVaO9kEE1UyOPOmzOE5Okh21WBE8KueRC6gDC6v5n4bgbz6xV1lY6usvYRqgioDeJAdXNJ0/bSY62IwQR1w3cYKJKcKkR
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8093.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(366004)(376002)(136003)(346002)(451199021)(86362001)(66446008)(33656002)(64756008)(316002)(478600001)(66556008)(76116006)(66946007)(66476007)(7696005)(110136005)(55016003)(5660300002)(8936002)(52536014)(4744005)(8676002)(2906002)(41300700001)(82960400001)(71200400001)(186003)(38070700005)(122000001)(38100700002)(6506007)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q0p1NnZnUlArQTYvLzVRTUlzWjZJaVJiR05kVmZkNUpwL3BOMXdNcldMUnRT?=
 =?utf-8?B?RW9La0pPemgvR0YyK24zS0lGT3E2ZzJtWmYyL2U3K3g2NEZPa3FRdzltMVdl?=
 =?utf-8?B?aFJVVEJMQ2UrQlJyODhSQ3Q4L1JrWGR6cFVYYjRHdmZLMlcrWHRmZjNRV3Z4?=
 =?utf-8?B?Y2ZIOUV0TTl0VjBuQXpxZEp3UE1zSkNDcXBobFdvZG1Md1FIM2tielB6d2Fo?=
 =?utf-8?B?OHo1WlFXSGF4Ukg2VjhEQjZod2tTS3lQNGg3SmlKdDVqT0I3NDB1SXRPWUkz?=
 =?utf-8?B?OFZLZjJhQ2t5QWthUWdOQWxoYjRjY2cxMjBob25vcDZ2UVdJWDVSckxQeXBW?=
 =?utf-8?B?UkdqcTZwSWVsNlFaQUhKWWcya0s5ZVdidUtWSlROUSs4anFjeGVRMGR5ako3?=
 =?utf-8?B?T2V5dmsyZTRNSWp5Sk1GWXBUTFRYa2UzNmV0Z3p0RGVVYzB5ZGZIMUNkcjlu?=
 =?utf-8?B?bWZCVFZJVldsNjA0ZnZWQy96ajUvSC81MVpGaEp6c1dBOEpObUhtRzdBME5t?=
 =?utf-8?B?UTB0QzFrb2J6NDd1WkIvNzdEYm84dlVnSXUwS0xLWGJOdnM0c2FqNWU1ZDNF?=
 =?utf-8?B?NEs2SjBCWDJIdmdkSEp4OFBnbWtCSzdENVpsQWdYUkNIWERKRUFSK2N1MEhX?=
 =?utf-8?B?T1FnWVlSVDhmZTJMS3Z5c09WemxOL3phd1A1R3UzekJ5MkViaGpmbUxFdkRH?=
 =?utf-8?B?Y0R1OUhTaGJVcUV0WTkvR25sSzdVQS8xRVhNamU5TDQ3K1FjOVZQUUZBK0k0?=
 =?utf-8?B?MEdCUWhFM0s5MmhyNzJvekI4NHh2M1F6bFRDTjYvV3RjQjV6amExTmlSdk9M?=
 =?utf-8?B?RXZUR1B1cVVtL1dtNWY0WTdNYzk0R0xHckNFU2ljakFHQ2s1L0tWL3VCV1Js?=
 =?utf-8?B?QVlpVS9hekxLbkgzUEk5RlZqbC9LUEVqSFFIcGg1VFJTME5Rckx0ZFY1eWFQ?=
 =?utf-8?B?SlcwQnlWUlJ5VTJMNFVJalBpZGtoNnlEeFRwWjk3aW9SVGpVbkhZbTd6R3dE?=
 =?utf-8?B?ZTdEU2ZwQ0M3djhJeVZWL0ViRkJMMHJucnl0RmZWTUhYUWx0bDFkWGNrUFA0?=
 =?utf-8?B?SHNSazAyTVpCanRBM3lZM0Z2WHpGWkdDMm1uM3JTTmZNbVpTZXFGcUFvS0pi?=
 =?utf-8?B?MjJGK2Rabm9zZURVdngxL0ROR1dML3htc1QzRVlmU2lLUGVrYzFaWkdYV0Ns?=
 =?utf-8?B?RXQyVDVVYVI5elFGNFk4a1F2ZWF2WXdQTDlLQ2xMRGFpQ3Jncy9pVEhBdVpB?=
 =?utf-8?B?N0lIdGR6NHFOU0Q1OVF2aWE0dEFaRjFIRHE4dmw5dEhUNnNxemhVWGM3M1dN?=
 =?utf-8?B?VmtEVHN4VThkYSszdXdzV0MwU1BVRGxzTUVxQjgxbnhDQ0o3QzRsTEo4TjNF?=
 =?utf-8?B?YU9ZS2FUUDh4UEhIQlBGZzBaZ2xPcUUvWFNZZDFVRExubS94K2c0RzJlWkNN?=
 =?utf-8?B?cGNkd2syeC9ZZDh6SDUraTBadXVZd003Skh2SFhNVkJJS1ZtWC9OSkN0OGJY?=
 =?utf-8?B?L2xRODQ3NHM2aVdoMWk4ZTRzNEtBSnJqSnpnWUZ3d2t4dGlNUlVHeVJUTm9v?=
 =?utf-8?B?cG5yUXZxN0hIODl2bjQrRHdGN1Z1ZEZxSDJYaW1sSW9EQlhCZnpXWXlFTmU3?=
 =?utf-8?B?VVlJdjRrR0pzT204Z1hlVXhieHkzcXAxQVRzazZqVnJZblpBLys1NzE3bURa?=
 =?utf-8?B?ZW15OWMxaGxCM04vMjlpZWQwdUZsUmJteTRzT2IxRWhMaGJaeVlNUStLSjZ1?=
 =?utf-8?B?S1RQanVFcXRSaWwyNEVrMTNwOFZnMTJ1UFpkQTB6Z2hXYWhlWnozYVdVbW4z?=
 =?utf-8?B?UTN3NElSa0s5aVp0UDdjOG5tL1hhTEFXeFdKRzRQR20xdGtEWDFINzJDcUJ1?=
 =?utf-8?B?STd2SWpwNmVQbUQwQ1hsajVWekpINDJsK2Vod3VVeUEySm43Y3dCUGNwaWFM?=
 =?utf-8?B?cFhEdkd0LzBOUWlDdWt0ZHRQOWVhMFhvTlp0MmFHam1seHFMQzlHcFlQdEl2?=
 =?utf-8?B?RVhlYk10Wkp4cU5LY3BIWCtxOXIwMGR3QTB5eXlsR1RBOUwrTzAyZkZtWEVS?=
 =?utf-8?B?S1UxNnhud3ZMRkF4SFcxSFhDOGN2NnNyMFlrVDc3Z1JSUi8vbFFqd3NBUGNy?=
 =?utf-8?B?WVJZUkdSOFFvMkNGSTAxdEViR0x2N0IwY3djRmd6YUwwcm90NTU3dmhyQUhC?=
 =?utf-8?Q?+JHmRo+85E+A8k7E7DWtw5PX9km4hrkDU0r0srBmcTny?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8093.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6dd5e39-efa4-4129-8a06-08db50992d50
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2023 14:25:02.3502
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kw4Y1os225u6B4PM2TZPeV5MLMwcdaLEe1tWWQX3giKRmrU0Y1V1+LUiQVekNPsBv5mWF3Cn3SHwzExIK+80FQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6169
X-OriginatorOrg: intel.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 14:25:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102511

DQo+ICsrKysrKysrKysrKysrKysrKysNCj4gPiAgIC4uLi9mcmVlcmRwL0NWRS0yMDIyLTM5MzE4
LTM5MzE5LnBhdGNoICAgICAgICB8IDQxICsrKysrKysrKysrKysrDQo+ID4gICAuLi4vcmVjaXBl
cy1zdXBwb3J0L2ZyZWVyZHAvZnJlZXJkcF8yLjYuMS5iYiAgfCAgMiArDQo+ID4gICAzIGZpbGVz
IGNoYW5nZWQsIDk2IGluc2VydGlvbnMoKykNCj4gPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRh
LW9lL3JlY2lwZXMtc3VwcG9ydC9mcmVlcmRwL2ZyZWVyZHAvQ1ZFLQ0KPiAyMDIyLTM5MzE2LnBh
dGNoDQo+ID4gICBjcmVhdGUgbW9kZSAxMDA2NDQNCj4gPiBtZXRhLW9lL3JlY2lwZXMtc3VwcG9y
dC9mcmVlcmRwL2ZyZWVyZHAvQ1ZFLTIwMjItMzkzMTgtMzkzMTkucGF0Y2gNCj4gDQo+IERvIHRo
ZXNlIGFmZmVjdCBtYXN0ZXIgb3IgbWlja2xlZG9yZT8gQWRkaW5nIHNvbWV0aGluZyBsaWtlICIg
QWZmZWN0cyBbPCwgPD0gXQ0KPiB7dmVyc2lvbn0gIiB3b3VsZCBiZSBoZWxwZnVsLiBJIGFtIHRl
bmRpbmcgNCBhY3RpdmUgYnJhbmNoZXMgYW5kIG5vdCBoYXZpbmcgdG8NCj4gY2hlY2tpbmfCoCBu
ZXdlciBicmFuY2hlcyB3b3VsZCBiZSBuaWNlLg0KDQpUaGVzZSBpcyBmaXhlZCBpbiAyLjkuMCwg
IG5vdCBhZmZlY3RpbmcgbWFzdGVyIGFuZCBtaWNrbGVkb3JlLg0KDQo=


Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51D82C47074
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 03:06:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.31785.1704683208440196159
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jan 2024 19:06:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=nYzXi+xq;
 spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704683208; x=1736219208;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=cCMswCzrgYxD6TstacjdvyZLjowV+8clyz29xducyf0=;
  b=nYzXi+xqt5Ocez5pfZjt+ZZO3+hO2YKM+/TuguNFscCzRLa5YlIiQ2t+
   e4d3yG18vjCYUVhYzfNN9MrYG5cK8k86DDlCgdJdhKFr3Aq7euy68RGGa
   CcMCFMuc7l6AGcViokQbZZHLdeouGSKnq69sUuOYzJxwpwIx8AdT/RKxK
   FlqtBOCsI7l+Ss4mx+ijSEOPqAVtwbiPXNm2z28v236gp/pypla7v6JV1
   G65JdZaZhPQehxh17jx4IJ1RrcBY/I7w18hPA+7GqVtO25QoN2SvKSbtY
   uVfKb3q4BkWH49hZuq5xqlkf1BGZIMYF0pWzwkgu9b3Zsw8zJPOA+Ylpu
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="462075422"
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="462075422"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2024 19:06:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="757489153"
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="757489153"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 07 Jan 2024 19:06:47 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 7 Jan 2024 19:06:47 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 7 Jan 2024 19:06:47 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 7 Jan 2024 19:06:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fjczc9GsuKjyQYmh88Y6/a6VP5P890AFzGr7HijrxZO5CcwLAXUkIQVQNON0LmHq+wYw/uUmdOSjkPp+cYqiHXKQhZ8HZuwvgq2nOy/bVBQRHOBrF57SF/aW41ZKnG2pA23hfJWvNet/z4kgexvn42R6urzGy6CPXt6N7Z1OanIdQQYBTpGNPmkcJJ3GzOoUoEuKIUiLYIM2WK0/VWHzDxJCDCURtJwDd+UJ0ULnhxNmYuienqtOKpf+NxAEVYMCQO3JTLrFu3BfsT0M8JHZQgIIAK08T0/UizMsRGF7490i2yRv3P60i8tsif38ZHKF7MXh0nVbqmWFklf68C0Tug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cCMswCzrgYxD6TstacjdvyZLjowV+8clyz29xducyf0=;
 b=k9jCXXyPwVs4oNsLP47FA2JasCNWnUk/tmHbIuHpxsFuD5Q31QOuvZvMf7vkD61UEueAAwg2aOMi67pZ4CmzBEEWFnrqEGs+nWFz40XhSObNDMtACnRn5wcT7ncKE2/VyENY+XH31DPeQ636MlfBoceceK/JUET913EkFTGSVk1aTKyAbt45ppqzCoB3JWCextt5PTVdG3hJHIfc4gKByjs5v97/MkA/imieQ8kzKvZrFWaZI8RudQESO4uFpqVNbXrYPBPgtYaiM/GKJAi9RH/lHtRrc64RtzjHMdTibKfBC4bylfkntTebc8n4Mkkw0EGKKrZ9kO/c8IHkTr/3UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by BN9PR11MB5337.namprd11.prod.outlook.com (2603:10b6:408:136::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21; Mon, 8 Jan
 2024 03:06:40 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::f9dd:37dd:4a05:e9ca]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::f9dd:37dd:4a05:e9ca%3]) with mapi id 15.20.7159.020; Mon, 8 Jan 2024
 03:06:39 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "vanusuri@mvista.com" <vanusuri@mvista.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][kirkstone][PATCH v3 1/4] libssh: upgrade 0.8.9 ->
 0.10.4
Thread-Topic: [oe] [meta-oe][kirkstone][PATCH v3 1/4] libssh: upgrade 0.8.9 ->
 0.10.4
Thread-Index: AQHaMyI/amG6Oty/VkW/orGGjI3F3bDPSpSAgAAHMgCAAAdZAA==
Date: Mon, 8 Jan 2024 03:06:39 +0000
Message-ID: <01f2945033e4d306a29d91c3d7fb97df7a5a60a9.camel@intel.com>
References: <20231220085438.97520-1-vanusuri@mvista.com>
	 <422964d0680ba081bec487ebb01ac7d516bd3b1c.camel@intel.com>
	 <CANQUz1-W59EEXEhKCUtBEUOkSOmmgnDA+DycdeY51QqfgSk_4w@mail.gmail.com>
In-Reply-To: <CANQUz1-W59EEXEhKCUtBEUOkSOmmgnDA+DycdeY51QqfgSk_4w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.4 (3.48.4-1.fc38) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|BN9PR11MB5337:EE_
x-ms-office365-filtering-correlation-id: 4dac6349-98bc-472d-3369-08dc0ff6d57b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: a87uvjk3H0AFbqqOEoMDFRB9NXfpuhR3MKoM00iOsWzBqU6CmEqsLDDopEUGKAfMHK1K8RUZzHRIiBLS1Kdv+TpdIONxgvcy6F/iYGG2K/URRchWHbAPhE1mVa7Dioaft4ijAcL63hyWgK5ux2AUqerGnViYnMATD2sjnh6BZ5t5Dj6SAsct7XaRP4sdDoMFxAG/PA8NLw+R/S8f6Y42sEzEdKXihwhdhyvUsklWRDedO4trVrDAwmHmevbWwBVLhDl30JZGF87ryTuUhsma5o8u0mer7kq2d1J1W/Zq6gsZnJn4zkx1BlGb3tVhLs83pQaNFCO4S8cGcqALUlckqf+/DELiILzh2GO8QHvvGS21BCYRi/nr/7gC0QWDRm0MJGuP/L1C+Sh42+bNx4ogdODA+bkSahEIhMnV++Kf5NdEuQz6irAt/udvM6eRlNUaLRCVh6SqcZrtBrh0tFWy1SWfhPnsU9UWVz5x1YNACxi9RIdJlSoY/AP75wBSdkLuxOexXGJ/HlPkZcQmcmdh3NtuOjF1b4w3GKwjmuA0yAznzvEhkIx0JwDQLOJraPKKP1Y4QNrVGIpGXeDknQ/Q8CNwtF/0BqKldbIqL+IT3l8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(346002)(136003)(366004)(396003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(316002)(8936002)(8676002)(36756003)(71200400001)(6506007)(83380400001)(4326008)(53546011)(66946007)(66556008)(91956017)(76116006)(2616005)(6512007)(6486002)(478600001)(966005)(6916009)(64756008)(26005)(66476007)(66446008)(4001150100001)(122000001)(38100700002)(2906002)(5660300002)(38070700009)(66899024)(41300700001)(86362001)(82960400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TS9NVG0rKytZRE43aHF3dUdqS1NsWUpUZCtBUVRXTVRzUmFOMjBTQ0ZZQ04x?=
 =?utf-8?B?Z2hrWHE2c3dDU1MxeVdUdTQrQ1JTbVV5NG5ROEVQVW14Q2ZiTnJzVktZbk9j?=
 =?utf-8?B?T0VtaTJXbXNwYWwvdnJuRGMvSDloaHVySVZnTGdnOTJtTVdhd0l5OFpKamFZ?=
 =?utf-8?B?SjZ1ZXdQUGJlTHMvRUZBUklPYjFBcXhLbnMzQzViT1Uxa3lwUC9zTXFEdFR5?=
 =?utf-8?B?NkV6NlRNUWtnRVBSSHJtMHJiRnQ1eGt0RnJSaUhyZFpQY1ZSdi9LejdoYllU?=
 =?utf-8?B?VCtEVDE4N3pWalRKV0FKSVRHQ0Y5NHpxZThHMCtLaVlvWnNMdjgzb292T0Vl?=
 =?utf-8?B?dDkvZlUrelAweTJIVHhKd1JVb081Wlc1N1NXMk1CbllHMnBGQ3NFbGcxQWJq?=
 =?utf-8?B?bDI5RHJqRXZ0VlFkSndKZHVLUEFSMDIxTEhCM3lSSmNTbUxQZjVNaHpTaHdx?=
 =?utf-8?B?R0xscG42SXF2LzRiZFRpVmhzQmpWdW1xckg4OWJJeENlQ3dlY3RCS243eTZj?=
 =?utf-8?B?a01oKzVhZlZIdFZ5MGFCdFYwd0x5QVkwdVJFUWJZQ09USHJ1RGl2K1o4ODZO?=
 =?utf-8?B?OWZ3M0hrODgvOG10Nm5QUCtKRE5RcmY4SzRhbUpDNlc2MXJSMTBxZWZEbU5m?=
 =?utf-8?B?eDFPRWQ3cUFiQjJuNmx6N2JBMmhQM1JRRkJYRmwyODhtem1ZRUM2L3dkcVFU?=
 =?utf-8?B?QWZKUFZIUnB4WGtNZFNKT3piMmZQZDZIODl0azVvOFlKQU5vMmVXVklqUVhI?=
 =?utf-8?B?VmdCMXNhYWlJWmtlT09nLytEdlJmekR0cUpFK0p4dXA3em1tTnloVFNoN2NL?=
 =?utf-8?B?b2w3T3kvOHQ0U0lUV3pzdTJ6ODdDd0oreDdDODFpempYV0xFTGJsNlQyc2RX?=
 =?utf-8?B?bXZSUWRqYzV0bEVYdFliQmVxUEtkRXV1QU5xQ0hrZTduM056SnNsbkNuS3Np?=
 =?utf-8?B?d21WbjB4Zk14WWpkdStqd1l6T0xjbXoxQ1BaNGtJaWRaMFB1R1FSelk3MzBr?=
 =?utf-8?B?ZzJTR28rZWR0OW14QVhCNE1JdUNmbFZLeGtYRHN6VUVubEpCWGVzeklGbjRq?=
 =?utf-8?B?Q21pM0pReG1LWnc5a2JJZTF0ZHRQT2srMDV3MmFjODkzNEZIRWpzOWZKQlB5?=
 =?utf-8?B?N1lpQTgvQkw1MFN2NnZ6UEkrdTMza3hCRFRJbWhrRUZnUThrRWZ2MDBYRjZq?=
 =?utf-8?B?clBBQnNtVG1oOVhFdmVHTGR2eDk3TkoxeTVzbmZOY3BrdHFEUVhpdlB1cjlF?=
 =?utf-8?B?S2x3TWpNN1JwYnBGNi9BOTIrRWFBaVRSTlFmMlFJdVo4b2kzZVJ6V2xGM1lO?=
 =?utf-8?B?MWs0c1EyWWxERU1OUzV1aTFpMll1ZEZUTDBXNXJEaWJrREtOd3NlODIvS0F0?=
 =?utf-8?B?blB4VU9ZaXJKTU9UTlI5Q2dzdWUyellMMHVrYnErVHlSOFlSc05BVDczcTdL?=
 =?utf-8?B?a0srVDVZSkFhajNRaW1BczlwOHV1LzBzWUV3Q3RJeU5tRVRsOFZNMHRFZXdR?=
 =?utf-8?B?SkxWTDJWWSsxSjlkeDRUVjdlVUxiZkdWTTFjcXBXdUd5Y1lrR29CT3JMZEFR?=
 =?utf-8?B?MHlrdXpRdU1CL3lQRC9aU2dEeUw5b294QUJFQlZqd1lYcmpCMG94anpaakVo?=
 =?utf-8?B?S3pNdyt2S245WHY2UGtaMVlIWEtuWXVMblM5bVBYY3IvK3kzTHlDNFJrcmt3?=
 =?utf-8?B?enI5Qno1WFg4d3ZRMFlLRDByNE4yRFAyaG1HNjExc0dMVnA1dnUxZlBmMmp6?=
 =?utf-8?B?WEdiVER1R2lJaldzMW5TRVdIdjV2Unl2aVRZSEE0QUFxZFRma1BrUG9veUtp?=
 =?utf-8?B?RUhBaFZUSjA4bUU3TlM5Q3ZuQ1JGUU9TQjBqQ25rQ1dMOGVnNGxMYXU5K0U5?=
 =?utf-8?B?ZnhiQjNlRjhtOGxVTytFdkdaVk02MmZqZm9NTndxQmJqZ0RDcFN1WC9IVDFF?=
 =?utf-8?B?aVJ5L21DVVp2SG5uVUYrNFlLbnErOHFMNVVNdWdURHRiUWtKQktMOGpoTmJS?=
 =?utf-8?B?ekdPM0F0SnhkVWtrU1h2cU1rd09CZzcvNEt6UHdHd3ViWUhEMHZtYURyWnJ6?=
 =?utf-8?B?clRNWUw1QndqVUxkeTUyemNSQzRxeUdtRWNQbVpQZGM1bEIzMUxrMElnMUNT?=
 =?utf-8?B?NmRoTjZ3R1lYL29JV1NJbHZyb05obnZ2TkNPUHkzRzdSMTJjUXJiWUErbkhK?=
 =?utf-8?B?L1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BF09BEAAFAADD949982282A56C663FA2@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dac6349-98bc-472d-3369-08dc0ff6d57b
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2024 03:06:39.7513
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L2WBg3ul5K5tztz6eQWr9I1tP2FzqaBGChcZ9lKjlzZv9hr5Qn2etaQzc+SUMz1XiOnJhkfX1hnm5/iZ+qKDiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5337
X-OriginatorOrg: intel.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 03:06:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108122

T24gTW9uLCAyMDI0LTAxLTA4IGF0IDA4OjEwICswNTMwLCBWaWpheSBBbnVzdXJpIHZpYQ0KbGlz
dHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4gSGkgQW51aiwNCj4gDQo+IEkgdGhvdWdodCBv
ZiB1cGRhdGluZyBsaWJzc2ggdG8gMC4xMC42IHRvIGZpeCB0aGUgYmVsb3cgc2VjdXJpdHkgYnVn
cw0KPiANCj4gKiBGaXggQ1ZFLTIwMjMtNjAwNDogQ29tbWFuZCBpbmplY3Rpb24gdXNpbmcgcHJv
eHljb21tYW5kDQo+ICogRml4IENWRS0yMDIzLTQ4Nzk1OiBQb3RlbnRpYWwgZG93bmdyYWRlIGF0
dGFjayB1c2luZyBzdHJpY3Qga2V4DQo+ICogRml4IENWRS0yMDIzLTY5MTg6IE1pc3NpbmcgY2hl
Y2tzIGZvciByZXR1cm4gdmFsdWVzIG9mIE1EIGZ1bmN0aW9ucw0KPiANCj4gUmVmOg0KPiBodHRw
czovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtZGV2ZWwvbWVzc2FnZS8x
MDc5OTMNCj4gKGxpYnNzaCB1cGRhdGUgdG8gMC4xMC42IGZvciBtYXN0ZXIgYnJhbmNoKQ0KPiAN
Cj4gTm93IEkgaGF2ZSB0byBnbyB3aXRoIGJhY2twb3J0aW5nIHRoZSBmaXhlc8KgIGluc3RlYWTC
oCBvZiB1cGdyYWRpbmc/DQoNClllcywgdGhhdCBpcyB0aGUgcG9saWN5Lg0KDQpodHRwczovL3dp
a2kueW9jdG9wcm9qZWN0Lm9yZy93aWtpL1N0YWJsZV9SZWxlYXNlX2FuZF9MVFMjU3RhYmxlL0xU
U19QYXRjaF9BY2NlcHRhbmNlX1BvbGljaWVzDQoNClRoYW5rcywNCg0KQW51ag0KDQo+IA0KPiBU
aGFua3MgJiBSZWdhcmRzLA0KPiBWaWpheQ0KPiANCj4gDQo+IA0KPiBPbiBNb24sIEphbiA4LCAy
MDI0IGF0IDc6NDTigK9BTSBNaXR0YWwsIEFudWogPGFudWoubWl0dGFsQGludGVsLmNvbT4NCj4g
d3JvdGU6DQo+ID4gT24gV2VkLCAyMDIzLTEyLTIwIGF0IDE0OjI0ICswNTMwLCBWaWpheSBBbnVz
dXJpIHZpYQ0KPiA+IGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgd3JvdGU6DQo+ID4gPiBGcm9tOiBW
aWpheSBBbnVzdXJpIDx2YW51c3VyaUBtdmlzdGEuY29tPg0KPiA+ID4gDQo+ID4gPiBDaGFuZ2VM
b2c6DQo+ID4gPiBodHRwczovL2dpdC5saWJzc2gub3JnL3Byb2plY3RzL2xpYnNzaC5naXQvdHJl
ZS9DSEFOR0VMT0c/aD1saWJzc2gtMC4xMC40DQo+ID4gDQo+ID4gSSBkb24ndCB0aGluayB0aGlz
IGlzIGFsbG93ZWQgYXMgcGVyIHN0YWJsZSBicmFuY2ggcG9saWN5IHVubGVzcw0KPiA+IHRoaXMN
Cj4gPiBpcyBhIGJ1ZyBmaXggb25seSB1cGdyYWRlLg0KPiA+IA0KPiA+IFRoYW5rcywNCj4gPiAN
Cj4gPiBBbnVqDQo+ID4gDQo+ID4gPiANCj4gPiA+IERyb3AgQ1ZFLTIwMjAtMTYxMzUucGF0Y2gN
Cj4gPiA+IA0KPiA+ID4gUmVmOg0KPiA+ID4gaHR0cHM6Ly9naXQub3BlbmVtYmVkZGVkLm9yZy9t
ZXRhLW9wZW5lbWJlZGRlZC1jb250cmliL2NvbW1pdC8/aD1zdGFibGUvbmFuYmllbGQtbnV0Jmlk
PTRiN2U0MzQxMzI3ZTg2NzIwOGJmYzNkOGJhMTk1NGFmNjY2NDFlNjANCj4gPiA+IA0KPiA+ID4g
U2lnbmVkLW9mZi1ieTogVmlqYXkgQW51c3VyaSA8dmFudXN1cmlAbXZpc3RhLmNvbT4NCj4gPiA+
IC0tLQ0KPiA+ID4gwqAuLi4vbGlic3NoL2xpYnNzaC9DVkUtMjAyMC0xNjEzNS5wYXRjaMKgwqDC
oMKgwqDCoMKgIHwgNDQgLS0tLS0tLS0tLS0tLQ0KPiA+ID4gLS0tLQ0KPiA+ID4gLS0NCj4gPiA+
IMKgLi4uL3tsaWJzc2hfMC44LjkuYmIgPT4gbGlic3NoXzAuMTAuNC5iYn3CoMKgwqDCoCB8IDE2
ICsrLS0tLS0NCj4gPiA+IMKgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDU3IGRl
bGV0aW9ucygtKQ0KPiA+ID4gwqBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS1vZS9yZWNpcGVzLXN1
cHBvcnQvbGlic3NoL2xpYnNzaC9DVkUtDQo+ID4gPiAyMDIwLQ0KPiA+ID4gMTYxMzUucGF0Y2gN
Cj4gPiA+IMKgcmVuYW1lIG1ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L2xpYnNzaC97bGlic3NoXzAu
OC45LmJiID0+DQo+ID4gPiBsaWJzc2hfMC4xMC40LmJifSAoNjIlKQ0KPiA+ID4gDQo+ID4gPiBk
aWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvbGlic3NoL2xpYnNzaC9DVkUtMjAy
MC0NCj4gPiA+IDE2MTM1LnBhdGNoIGIvbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvbGlic3NoL2xp
YnNzaC9DVkUtMjAyMC0NCj4gPiA+IDE2MTM1LnBhdGNoDQo+ID4gPiBkZWxldGVkIGZpbGUgbW9k
ZSAxMDA2NDQNCj4gPiA+IGluZGV4IDYzYjc4Njg4ZC4uMDAwMDAwMDAwDQo+ID4gPiAtLS0gYS9t
ZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9saWJzc2gvbGlic3NoL0NWRS0yMDIwLTE2MTM1LnBhdGNo
DQo+ID4gPiArKysgL2Rldi9udWxsDQo+ID4gPiBAQCAtMSw0NCArMCwwIEBADQo+ID4gPiAtRnJv
bSAwYTkyNjhhNjBmMmQzNzQ4Y2E2OWJkZTU2NTFmMjBlNzI3NjEwNThjIE1vbiBTZXAgMTcNCj4g
PiA+IDAwOjAwOjAwDQo+ID4gPiAyMDAxDQo+ID4gPiAtRnJvbTogQW5kcmVhcyBTY2huZWlkZXIg
PGFzbkBjcnlwdG9taWxrLm9yZz4NCj4gPiA+IC1EYXRlOiBXZWQsIDMgSnVuIDIwMjAgMTA6MDQ6
MDkgKzAyMDANCj4gPiA+IC1TdWJqZWN0OiBDVkUtMjAyMC0xNjEzNTogQWRkIG1pc3NpbmcgTlVM
TCBjaGVjayBmb3INCj4gPiA+IHNzaF9idWZmZXJfbmV3KCkNCj4gPiA+IC0NCj4gPiA+IC1BZGQg
YSBtaXNzaW5nIE5VTEwgY2hlY2sgZm9yIHRoZSBwb2ludGVyIHJldHVybmVkIGJ5DQo+ID4gPiBz
c2hfYnVmZmVyX25ldygpIGluDQo+ID4gPiAtc2Z0cHNlcnZlci5jLg0KPiA+ID4gLQ0KPiA+ID4g
LVRoYW5rcyB0byBSYW1pbiBGYXJhanBvdXIgQ2FtaSBmb3Igc3BvdHRpbmcgdGhpcy4NCj4gPiA+
IC0NCj4gPiA+IC1GaXhlcyBUMjMyDQo+ID4gPiAtDQo+ID4gPiAtU2lnbmVkLW9mZi1ieTogQW5k
cmVhcyBTY2huZWlkZXIgPGFzbkBjcnlwdG9taWxrLm9yZz4NCj4gPiA+IC1SZXZpZXdlZC1ieTog
QW5kZXJzb24gVG9zaGl5dWtpIFNhc2FraSA8YW5zYXNha2lAcmVkaGF0LmNvbT4NCj4gPiA+IC1S
ZXZpZXdlZC1ieTogSmFrdWIgSmVsZW4gPGpqZWxlbkByZWRoYXQuY29tPg0KPiA+ID4gLShjaGVy
cnkgcGlja2VkIGZyb20gY29tbWl0DQo+ID4gPiA1MzNkODgxYjBmNGIyNGM3MmIzNWVjYzk3ZmEz
NWQyOTVkMDYzZTUzKQ0KPiA+ID4gLQ0KPiA+ID4gLVVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQN
Cj4gPiA+IFsNCj4gPiA+IGh0dHBzOi8vZ2l0LmxpYnNzaC5vcmcvcHJvamVjdHMvbGlic3NoLmdp
dC9wYXRjaC8/aWQ9MGE5MjY4YTYwZjJkMw0KPiA+ID4gNzQNCj4gPiA+IDhjYTY5YmRlNTY1MWYy
MGU3Mjc2MTA1OGNdDQo+ID4gPiAtQ1ZFOiBDVkUtMjAyMC0xNjEzNQ0KPiA+ID4gLVNpZ25lZC1v
ZmYtYnk6IEhpdGVuZHJhIFByYWphcGF0aSA8aHByYWphcGF0aUBtdmlzdGEuY29tPg0KPiA+ID4g
LS0tLQ0KPiA+ID4gLSBzcmMvc2Z0cHNlcnZlci5jIHwgNiArKysrKysNCj4gPiA+IC0gMSBmaWxl
IGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQ0KPiA+ID4gLQ0KPiA+ID4gLWRpZmYgLS1naXQgYS9z
cmMvc2Z0cHNlcnZlci5jIGIvc3JjL3NmdHBzZXJ2ZXIuYw0KPiA+ID4gLWluZGV4IDE3MTdhYTQx
Ny4uMWFmOGEwZTc2IDEwMDY0NA0KPiA+ID4gLS0tLSBhL3NyYy9zZnRwc2VydmVyLmMNCj4gPiA+
IC0rKysgYi9zcmMvc2Z0cHNlcnZlci5jDQo+ID4gPiAtQEAgLTY0LDYgKzY0LDEyIEBAIHNmdHBf
Y2xpZW50X21lc3NhZ2UNCj4gPiA+IHNmdHBfZ2V0X2NsaWVudF9tZXNzYWdlKHNmdHBfc2Vzc2lv
biBzZnRwKSB7DQo+ID4gPiAtIA0KPiA+ID4gLcKgwqAgLyogdGFrZSBhIGNvcHkgb2YgdGhlIHdo
b2xlIHBhY2tldCAqLw0KPiA+ID4gLcKgwqAgbXNnLT5jb21wbGV0ZV9tZXNzYWdlID0gc3NoX2J1
ZmZlcl9uZXcoKTsNCj4gPiA+IC0rwqAgaWYgKG1zZy0+Y29tcGxldGVfbWVzc2FnZSA9PSBOVUxM
KSB7DQo+ID4gPiAtK8KgwqDCoMKgwqAgc3NoX3NldF9lcnJvcl9vb20oc2Vzc2lvbik7DQo+ID4g
PiAtK8KgwqDCoMKgwqAgc2Z0cF9jbGllbnRfbWVzc2FnZV9mcmVlKG1zZyk7DQo+ID4gPiAtK8Kg
wqDCoMKgwqAgcmV0dXJuIE5VTEw7DQo+ID4gPiAtK8KgIH0NCj4gPiA+IC0rDQo+ID4gPiAtwqDC
oCBzc2hfYnVmZmVyX2FkZF9kYXRhKG1zZy0+Y29tcGxldGVfbWVzc2FnZSwNCj4gPiA+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzc2hfYnVmZmVyX2dldChw
YXlsb2FkKSwNCj4gPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBzc2hfYnVmZmVyX2dldF9sZW4ocGF5bG9hZCkpOw0KPiA+ID4gLS0tIA0KPiA+ID4gLTIu
MjUuMQ0KPiA+ID4gLQ0KPiA+ID4gZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0
L2xpYnNzaC9saWJzc2hfMC44LjkuYmINCj4gPiA+IGIvbWV0YS0NCj4gPiA+IG9lL3JlY2lwZXMt
c3VwcG9ydC9saWJzc2gvbGlic3NoXzAuMTAuNC5iYg0KPiA+ID4gc2ltaWxhcml0eSBpbmRleCA2
MiUNCj4gPiA+IHJlbmFtZSBmcm9tIG1ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L2xpYnNzaC9saWJz
c2hfMC44LjkuYmINCj4gPiA+IHJlbmFtZSB0byBtZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9saWJz
c2gvbGlic3NoXzAuMTAuNC5iYg0KPiA+ID4gaW5kZXggMDYxZjEzOTEyLi4zYTU3YTcyOGEgMTAw
NjQ0DQo+ID4gPiAtLS0gYS9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9saWJzc2gvbGlic3NoXzAu
OC45LmJiDQo+ID4gPiArKysgYi9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9saWJzc2gvbGlic3No
XzAuMTAuNC5iYg0KPiA+ID4gQEAgLTYsMTAgKzYsOCBAQCBMSUNfRklMRVNfQ0hLU1VNID0NCj4g
PiA+ICJmaWxlOi8vQ09QWUlORzttZDU9ZGFiYjQ5NThiODMwZTVkZjExZDJiMGVkOGVhMjU1YTAi
DQo+ID4gPiDCoA0KPiA+ID4gwqBERVBFTkRTID0gInpsaWIgb3BlbnNzbCINCj4gPiA+IMKgDQo+
ID4gPiAtU1JDX1VSSSA9DQo+ID4gPiAiZ2l0Oi8vZ2l0LmxpYnNzaC5vcmcvcHJvamVjdHMvbGli
c3NoLmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9cw0KPiA+ID4gdGFibA0KPiA+ID4gZS0wLjgg
XA0KPiA+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgIGZpbGU6Ly9DVkUtMjAyMC0xNjEzNS5wYXRj
aMKgXA0KPiA+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoCAiDQo+ID4gPiAtU1JDUkVWID0gIjA0Njg1
YTc0ZGY5Y2UxZGIxYmMxMTZhODNhMGRhNzhiNGY0ZmExZjgiDQo+ID4gPiArU1JDX1VSSSA9DQo+
ID4gPiAiZ2l0Oi8vZ2l0LmxpYnNzaC5vcmcvcHJvamVjdHMvbGlic3NoLmdpdDtwcm90b2NvbD1o
dHRwczticmFuY2g9cw0KPiA+ID4gdGFibA0KPiA+ID4gZS0wLjEwIg0KPiA+ID4gK1NSQ1JFViA9
ICJlODMyMjgxN2E5ZTVhYWVmMDY5OGQ3NzlkZGQ0NjdhMjA5YTg1ZDg1Ig0KPiA+ID4gwqANCj4g
PiA+IMKgUyA9ICIke1dPUktESVJ9L2dpdCINCj4gPiA+IMKgDQo+ID4gPiBAQCAtMjUsMTUgKzIz
LDcgQEAgRVhUUkFfT0VDTUFLRSA9ICIgXA0KPiA+ID4gwqDCoMKgwqAgLURXSVRIX1BDQVA9MSBc
DQo+ID4gPiDCoMKgwqDCoCAtRFdJVEhfU0ZUUD0xIFwNCj4gPiA+IMKgwqDCoMKgIC1EV0lUSF9a
TElCPTEgXA0KPiA+ID4gLcKgwqDCoCAtRExJQl9TVUZGSVg9JHtAZC5nZXRWYXIoJ2Jhc2VsaWIn
KS5yZXBsYWNlKCdsaWInLCAnJyl9IFwNCj4gPiA+ICvCoMKgwqAgLURXSVRIX0VYQU1QTEVTPTAg
XA0KPiA+ID4gwqDCoMKgwqAgIg0KPiA+ID4gwqANCj4gPiA+IC1kb19jb25maWd1cmU6cHJlcGVu
ZCAoKSB7DQo+ID4gPiAtwqDCoMKgICMgRGlzYWJsZSBidWlsZGluZyBvZiBleGFtcGxlcw0KPiA+
ID4gLcKgwqDCoCBzZWQgLWkgLWUgJy9hZGRfc3ViZGlyZWN0b3J5KGV4YW1wbGVzKS9zL14vI0RP
Tk9UV0FOVC8nDQo+ID4gPiAke1N9L0NNYWtlTGlzdHMudHh0IFwNCj4gPiA+IC3CoMKgwqDCoMKg
wqDCoCB8fCBiYmZhdGFsICJGYWlsZWQgdG8gZGlzYWJsZSBleGFtcGxlcyINCj4gPiA+IC19DQo+
ID4gPiAtDQo+ID4gPiAtVE9PTENIQUlOID0gImdjYyINCj4gPiA+IC0NCj4gPiA+IMKgQkJDTEFT
U0VYVEVORCA9ICJuYXRpdmUgbmF0aXZlc2RrIg0KPiA+ID4gDQo+ID4gPiANCj4gPiA+IA0KPiA+
IA0KPiANCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gTGlua3M6IFlvdSByZWNlaXZlIGFs
bCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+IFZpZXcvUmVwbHkgT25saW5lICgjMTA4
MDgzKToNCj4gaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWRl
dmVsL21lc3NhZ2UvMTA4MDgzDQo+IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5vcGVu
ZW1iZWRkZWQub3JnL210LzEwMzI3ODEyNy8zNjE2NzAyDQo+IEdyb3VwIE93bmVyOiBvcGVuZW1i
ZWRkZWQtZGV2ZWwrb3duZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBVbnN1YnNjcmliZToN
Cj4gaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWRldmVsL3Vu
c3ViwqBbDQo+IGFudWoubWl0dGFsQGludGVsLmNvbV0NCj4gLT0tPS09LT0tPS09LT0tPS09LT0t
PS0NCj4gDQoNCg==


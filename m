Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0205C47073
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 02:14:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by mx.groups.io with SMTP id smtpd.web11.30851.1704680084482446462
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jan 2024 18:14:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=TiTaW0lG;
 spf=pass (domain: intel.com, ip: 192.198.163.11, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704680084; x=1736216084;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=r6ovPrcQJ2L+eZLDD1r1R3Du/t51c+g/2upzOSTMJR4=;
  b=TiTaW0lGig/tnrcHGHX+jsx7vZx/c0P8iyqKU5l8388T2/zYSzlDYhBf
   paK8pa+i6w4dJSIOVOWZOyzSmKw/7uJpkj4HAINCBw89r4DIBq3a8o4Gw
   Z126V8IQ+4s5semTPlQQ6oo8L7clwPMv+d66fNlMZn2nTtXqW4jcyZwJX
   /DjBhg31K6/elX+jrheje1BJsQqRwOZ0+an8K8Y5N+W5mr3e+KDH338iI
   rkCGGeAfZRJua8//wBA5IOSDqZASUh1LVANe8orNKX+nMzODgHUMo+8/t
   LeLtUyXi5qKRqr7y1uAhMZ1pQo219fct7N9/Qlf2Wfw6sosFSZ1NJdBKb
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="4537408"
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="4537408"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2024 18:14:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="851654040"
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="851654040"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 07 Jan 2024 18:14:40 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 7 Jan 2024 18:14:39 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 7 Jan 2024 18:14:39 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 7 Jan 2024 18:14:39 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 7 Jan 2024 18:14:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BA4tPxD32hn5pzrZo2HdirCZPNYnxLfDjAb+jxzsucghZNhiCUTLJViVJ+dpY95NSsSOZBBxB+/DXTRWP87z5n015XYp69ONbbn1F8CEpfphlqyCnAizZq8J8jPjkc1MIB1iO4J4nLruhy4bWQUbyK+Vrwh6ZARy1dswpDFyRfyRZeNW9bHPTvIt8RHwsPAhldPGSbRWmwyUgyRXShC6+nNiFCwt/cWlVp1Il5ZYJCzhCVsPTS1XcJ4PfjXuO06FT9Rd8esuR3cbvBaIYHqUH8WYo/fHqytgLh0TOzxI7UFDh8LYDOzjmeFnCfxrJQBjvtZGOwG+9y5Lf3S1c2LFFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r6ovPrcQJ2L+eZLDD1r1R3Du/t51c+g/2upzOSTMJR4=;
 b=nKOCqxVv2YZvXxIT+no71kAxy0Fm23/1PU3AcREnfqVYLGI1DX1yEWTcRYNRWnJT4Eq72jESTVPZLxjkouIrYr+zT5umSnEX+GoyHOUhx3DrVMvyp7ed/KoSklNUO/iW08OwRi2Hee5EnJdCyrmUd7Q7CYVWlsC0CcaY7Ixd7b4wD09RFeL7xdY23NdKVmgpFdTTV92RqWKFgXv9j/U3+6TaONQUbMdlOfqHjOR6VdAXueJ56UfjZnJRMqvU4GYwSRuX0lvMRXmAsf6Ta9h6o7+8iY/TiEnM1aKG9IggTeQIyHBMOVey8WVhF64cdA11i+OPVQtAJPyP5LMt/eAfrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by CH3PR11MB7794.namprd11.prod.outlook.com (2603:10b6:610:125::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21; Mon, 8 Jan
 2024 02:14:36 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::f9dd:37dd:4a05:e9ca]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::f9dd:37dd:4a05:e9ca%3]) with mapi id 15.20.7159.020; Mon, 8 Jan 2024
 02:14:36 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "vanusuri@mvista.com" <vanusuri@mvista.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][kirkstone][PATCH v3 1/4] libssh: upgrade 0.8.9 ->
 0.10.4
Thread-Topic: [oe] [meta-oe][kirkstone][PATCH v3 1/4] libssh: upgrade 0.8.9 ->
 0.10.4
Thread-Index: AQHaMyI/amG6Oty/VkW/orGGjI3F3bDPSpSA
Date: Mon, 8 Jan 2024 02:14:36 +0000
Message-ID: <422964d0680ba081bec487ebb01ac7d516bd3b1c.camel@intel.com>
References: <20231220085438.97520-1-vanusuri@mvista.com>
In-Reply-To: <20231220085438.97520-1-vanusuri@mvista.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.4 (3.48.4-1.fc38) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|CH3PR11MB7794:EE_
x-ms-office365-filtering-correlation-id: fa5a0e5e-6354-45f2-6339-08dc0fef8ff3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zf833eqEhRf7JVEUpWp1jYtXg0jd9YioWJr2Ug/cMV0ZRpIPyB901NTDqWziWV17x0QgJk9FWh6gD7qaUqEyoPyshePB7dMzfxc1FO/nmLFTkQ+DBUqPNsL+c4HmU5aMIczjCjkl+YNeBZhaD8MGthmq5EAg5J6a3b+SHTBwE4TtYMaJtX6wF8+NFq05D23jhAZufKrnhkuPfj+QBB2I+XGgoQcUZ7ykZI6y7d+T6X8a5ws3qc0229MleczElebCtg/lQHiTyurAkrBWW7uUBeEBZFkZ0tlA/gFRoqtcLxZAGBolQAQ4LIb5XgSGfcQjEpmFGSXmS8g4RZI4FbCYZJJ1Kv3T2tzNebbheRygLKVtMeZEn2HUn1hpfIMtd2jiomREeCrEzHSUkNdsFRp0BVy7bd14umkWz+eC/7pbwTkbSrGWB16wsfk9YMh2ViDjkvUJ4tXWFe8dMjltO1ckDV+R/d5qvzywKQqd0EgexWZSzAQV7z3JWQyRRFDBL1uRfCQUvH0YySeSahWvo3pL6Vqs1BAyW8D1wVg31naF+Wjhl33hzNdAbhwOzLxIOxPw9hsJ8BrlYCGhSxUEI6KELzUsUSm3RkKGWXNJKaGYkqQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(366004)(346002)(396003)(136003)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(41300700001)(6506007)(83380400001)(71200400001)(4001150100001)(38070700009)(91956017)(2906002)(66446008)(66476007)(66556008)(64756008)(66946007)(76116006)(110136005)(316002)(38100700002)(122000001)(26005)(966005)(478600001)(6512007)(2616005)(82960400001)(86362001)(6486002)(66899024)(5660300002)(8936002)(36756003)(8676002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WUxZMWp2dlovVkVyY213cG5SMUFabWlWbnlxcld1MHpqSXdRWW91V2hCYnlJ?=
 =?utf-8?B?WnlJeDYwdTN2SVl4WEg5dEhQcHpNQWVHaWJKamhnRDcvaEE0OGlyczZyZzZj?=
 =?utf-8?B?cDFta2JKMXR1L05xeUQrQnhrVjNFUkdsdzE4c2FmcnVObkphTmVFcGtQV213?=
 =?utf-8?B?V1E3ZGRXVkNPUS9zeVJnTUh5WUVPVWdXYjIrVjFxVXhlQ2dpT01sZEtmbFdW?=
 =?utf-8?B?bFZoUUpxdGdkTVhqb2l6eEpoYlJoVGRHYlR2b1RlS2ZFc3FjSXQySlBuL2k4?=
 =?utf-8?B?cXcvWjhkZ3FDcmVIdDIyQzhjOEw3OFZLMEFVVUVnSjVwbjFpWWM2NkVkdytC?=
 =?utf-8?B?RXdpQXlwLzROVjUyTDIwVlRNUXcwb2xmK2x5T00yNUVURS83dDlKRVBuQzMy?=
 =?utf-8?B?MEMxcFZGdjFYSC90OGVxUWtWeHdTbngzYUNRSHU4UC9Jc25aTXZxR0pXcjAz?=
 =?utf-8?B?U0l5eVJLa25PNVV4bW5IaEg4UHRiUnNZdkpnaDhYbnZZK0xWSTRXRnd2TXFw?=
 =?utf-8?B?VmRyWWVEenJtc051ZWcrK0pmZkVCYWZFTDFvQ3l6TXVZL3ZsdUpldlhCWGls?=
 =?utf-8?B?UHhTb2ttNmt3ajA4RnIxRjZkcVhZcXRDMHh5R29NYktXcmxZWHJQcnVxZkJo?=
 =?utf-8?B?ZFdPQUZ0MzM4V2h3TUtVa0JzZy9Ld1N6Z1dzYTdOR0JnYk1MdjZLcS93VFFv?=
 =?utf-8?B?blNkbmx1VnZJVER4OXNjSk1qa0pKWVgvUEEvUmdkRkU5NHBQMkR1SXBIVHl1?=
 =?utf-8?B?Tkl6OFR2M1RObG5ZNU15bTQ5dkF5S2dsU2pqbXZpR2UrTWFJRzFraVVEelp2?=
 =?utf-8?B?azNrTG1MeHVxT3dXSE9mY3hEUm1Ia295akxTS005SUZiMzlCNGY2U1VNQk5L?=
 =?utf-8?B?WTlyMW5hL1JlTHdob3lVRXdvcCtiYnFHdlB6M0swMVM0Z0RyK3hxZXlnTUtY?=
 =?utf-8?B?eXFzU1dMdHVWdzcyYS9FU1lqK0tWMlQzYU9OWFc0TTFNR1BuKzh3azl5S3RQ?=
 =?utf-8?B?dEdUdllOUnlsK1BVZGh5QUlWTEs5eXloOWpLcEhHUXJRZE56UlZwTkUvdUor?=
 =?utf-8?B?WTh6WUxLWXR6ZVY2ZFdYWmgyV0pCZ3hucUlOd0wrcHJ5UlNqbC96eTJEdjVK?=
 =?utf-8?B?RjFDTUtpN0JBVlRhTDhKblNxRllyM0VnelJma1BuVG1LM0drTGFtYW53a1NY?=
 =?utf-8?B?Nmx1QW56aHliLzV6clc3eXBZRjRUOW5GUW5CSkZRa0JtQlVwdHJBcFNFMjlG?=
 =?utf-8?B?SFJBRjYzNk90dHZLK0tIVm5UR2YrQWIwa0FiWldsRXRrbDBMbmcxRWFUVzFv?=
 =?utf-8?B?SHFmNmoyeGc2VWNqUGlaZ2ZiSnNweWdGbGFKWDZmZEw3TE5zYVpYTzNxWUh5?=
 =?utf-8?B?YkFNejBId1lNZnJiZHUvNExIOVlvbHNtVGZpRFhmcy8zY1RDenM2a0czakY5?=
 =?utf-8?B?WWhmVE9VMGY4NlNIYldZZUo1Z3JTajV3WjhDcDczTkQ5VGlQajFCc1R2K1J1?=
 =?utf-8?B?UDdocHAxRytaUTcvNml2Vm9OcEVwVktEbGd1OGNiUHlsWFVmKzVuT2V0QkdI?=
 =?utf-8?B?bmd5dDVTaktVTmxGQ00xQ0c1NWhPd2FZQm1YaUFQSnAyNzRwV1pnSHBsdS8v?=
 =?utf-8?B?WmV2ZEtWUE95REZTait3L1NUNWVsR01vS2FyQWc4aksxYkUyRG9Ta0NvdW43?=
 =?utf-8?B?NEhvMVhHd1REZEtmSWptK0JLMTVpNHFZZUNVQlZSdEZsVE9GYlk4VHl3My9n?=
 =?utf-8?B?b3BmalpYeWxDUE1heHpkbnkvdklOaWdXZWF6RE5XZ3ZiTXB4WXg0QmdOdXFq?=
 =?utf-8?B?aVArd29taTRucHBqUDN0WXVZdmNsM1ZYYzNBd1hsckRNRlhORGhDdXYvL2hr?=
 =?utf-8?B?Y0FaY3MyNFJYQm53WGg2Mm9GR0szSHBDZ1RSZ0dEOWVrTUF5YXVpNXN4NmNB?=
 =?utf-8?B?R1l2RCtUcmFzVy8wUjVlcVREaWsvY3B0VFpIZUFEd3pYZFRsODNZWkRBbWhY?=
 =?utf-8?B?RHI0MVZGWkd2Vk1ueWRpVVVOMnp2Qll0eU1JUi9zb1pySG1VVGRuRlMrVEN2?=
 =?utf-8?B?dWx4TUF5ZHdxZ1VReUpQLzc0bU1MMytIV1RqZDZVK2hweUpvaGRXOVNmVkNy?=
 =?utf-8?B?ODNmRWNGOTM4TWt1QW9tRlM5V0pVU2ptSnBiQ09GMnhxQVJadmJHNlJPWjI0?=
 =?utf-8?B?T3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DE1F03F8C58D4D4ABDB97F2F109C6763@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa5a0e5e-6354-45f2-6339-08dc0fef8ff3
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2024 02:14:36.6138
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zsJ0yvPIW1XklPnmTrSqSHb7o/hqKv0gWXutPsjjzodb3ThOPr/o5KPXog7Jrb4+2q7UAPTCbLyT4o/AkyV4FQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7794
X-OriginatorOrg: intel.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 02:14:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108082

T24gV2VkLCAyMDIzLTEyLTIwIGF0IDE0OjI0ICswNTMwLCBWaWpheSBBbnVzdXJpIHZpYQ0KbGlz
dHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4gRnJvbTogVmlqYXkgQW51c3VyaSA8dmFudXN1
cmlAbXZpc3RhLmNvbT4NCj4gDQo+IENoYW5nZUxvZzoNCj4gaHR0cHM6Ly9naXQubGlic3NoLm9y
Zy9wcm9qZWN0cy9saWJzc2guZ2l0L3RyZWUvQ0hBTkdFTE9HP2g9bGlic3NoLTAuMTAuNA0KDQpJ
IGRvbid0IHRoaW5rIHRoaXMgaXMgYWxsb3dlZCBhcyBwZXIgc3RhYmxlIGJyYW5jaCBwb2xpY3kg
dW5sZXNzIHRoaXMNCmlzIGEgYnVnIGZpeCBvbmx5IHVwZ3JhZGUuDQoNClRoYW5rcywNCg0KQW51
ag0KDQo+IA0KPiBEcm9wIENWRS0yMDIwLTE2MTM1LnBhdGNoDQo+IA0KPiBSZWY6DQo+IGh0dHBz
Oi8vZ2l0Lm9wZW5lbWJlZGRlZC5vcmcvbWV0YS1vcGVuZW1iZWRkZWQtY29udHJpYi9jb21taXQv
P2g9c3RhYmxlL25hbmJpZWxkLW51dCZpZD00YjdlNDM0MTMyN2U4NjcyMDhiZmMzZDhiYTE5NTRh
ZjY2NjQxZTYwDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBWaWpheSBBbnVzdXJpIDx2YW51c3VyaUBt
dmlzdGEuY29tPg0KPiAtLS0NCj4gwqAuLi4vbGlic3NoL2xpYnNzaC9DVkUtMjAyMC0xNjEzNS5w
YXRjaMKgwqDCoMKgwqDCoMKgIHwgNDQgLS0tLS0tLS0tLS0tLS0tLS0NCj4gLS0NCj4gwqAuLi4v
e2xpYnNzaF8wLjguOS5iYiA9PiBsaWJzc2hfMC4xMC40LmJifcKgwqDCoMKgIHwgMTYgKystLS0t
LQ0KPiDCoDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA1NyBkZWxldGlvbnMoLSkN
Cj4gwqBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvbGlic3NoL2xp
YnNzaC9DVkUtMjAyMC0NCj4gMTYxMzUucGF0Y2gNCj4gwqByZW5hbWUgbWV0YS1vZS9yZWNpcGVz
LXN1cHBvcnQvbGlic3NoL3tsaWJzc2hfMC44LjkuYmIgPT4NCj4gbGlic3NoXzAuMTAuNC5iYn0g
KDYyJSkNCj4gDQo+IGRpZmYgLS1naXQgYS9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9saWJzc2gv
bGlic3NoL0NWRS0yMDIwLQ0KPiAxNjEzNS5wYXRjaCBiL21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0
L2xpYnNzaC9saWJzc2gvQ1ZFLTIwMjAtDQo+IDE2MTM1LnBhdGNoDQo+IGRlbGV0ZWQgZmlsZSBt
b2RlIDEwMDY0NA0KPiBpbmRleCA2M2I3ODY4OGQuLjAwMDAwMDAwMA0KPiAtLS0gYS9tZXRhLW9l
L3JlY2lwZXMtc3VwcG9ydC9saWJzc2gvbGlic3NoL0NWRS0yMDIwLTE2MTM1LnBhdGNoDQo+ICsr
KyAvZGV2L251bGwNCj4gQEAgLTEsNDQgKzAsMCBAQA0KPiAtRnJvbSAwYTkyNjhhNjBmMmQzNzQ4
Y2E2OWJkZTU2NTFmMjBlNzI3NjEwNThjIE1vbiBTZXAgMTcgMDA6MDA6MDANCj4gMjAwMQ0KPiAt
RnJvbTogQW5kcmVhcyBTY2huZWlkZXIgPGFzbkBjcnlwdG9taWxrLm9yZz4NCj4gLURhdGU6IFdl
ZCwgMyBKdW4gMjAyMCAxMDowNDowOSArMDIwMA0KPiAtU3ViamVjdDogQ1ZFLTIwMjAtMTYxMzU6
IEFkZCBtaXNzaW5nIE5VTEwgY2hlY2sgZm9yIHNzaF9idWZmZXJfbmV3KCkNCj4gLQ0KPiAtQWRk
IGEgbWlzc2luZyBOVUxMIGNoZWNrIGZvciB0aGUgcG9pbnRlciByZXR1cm5lZCBieQ0KPiBzc2hf
YnVmZmVyX25ldygpIGluDQo+IC1zZnRwc2VydmVyLmMuDQo+IC0NCj4gLVRoYW5rcyB0byBSYW1p
biBGYXJhanBvdXIgQ2FtaSBmb3Igc3BvdHRpbmcgdGhpcy4NCj4gLQ0KPiAtRml4ZXMgVDIzMg0K
PiAtDQo+IC1TaWduZWQtb2ZmLWJ5OiBBbmRyZWFzIFNjaG5laWRlciA8YXNuQGNyeXB0b21pbGsu
b3JnPg0KPiAtUmV2aWV3ZWQtYnk6IEFuZGVyc29uIFRvc2hpeXVraSBTYXNha2kgPGFuc2FzYWtp
QHJlZGhhdC5jb20+DQo+IC1SZXZpZXdlZC1ieTogSmFrdWIgSmVsZW4gPGpqZWxlbkByZWRoYXQu
Y29tPg0KPiAtKGNoZXJyeSBwaWNrZWQgZnJvbSBjb21taXQgNTMzZDg4MWIwZjRiMjRjNzJiMzVl
Y2M5N2ZhMzVkMjk1ZDA2M2U1MykNCj4gLQ0KPiAtVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydA0K
PiBbaHR0cHM6Ly9naXQubGlic3NoLm9yZy9wcm9qZWN0cy9saWJzc2guZ2l0L3BhdGNoLz9pZD0w
YTkyNjhhNjBmMmQzNzQNCj4gOGNhNjliZGU1NjUxZjIwZTcyNzYxMDU4Y10NCj4gLUNWRTogQ1ZF
LTIwMjAtMTYxMzUNCj4gLVNpZ25lZC1vZmYtYnk6IEhpdGVuZHJhIFByYWphcGF0aSA8aHByYWph
cGF0aUBtdmlzdGEuY29tPg0KPiAtLS0tDQo+IC0gc3JjL3NmdHBzZXJ2ZXIuYyB8IDYgKysrKysr
DQo+IC0gMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQ0KPiAtDQo+IC1kaWZmIC0tZ2l0
IGEvc3JjL3NmdHBzZXJ2ZXIuYyBiL3NyYy9zZnRwc2VydmVyLmMNCj4gLWluZGV4IDE3MTdhYTQx
Ny4uMWFmOGEwZTc2IDEwMDY0NA0KPiAtLS0tIGEvc3JjL3NmdHBzZXJ2ZXIuYw0KPiAtKysrIGIv
c3JjL3NmdHBzZXJ2ZXIuYw0KPiAtQEAgLTY0LDYgKzY0LDEyIEBAIHNmdHBfY2xpZW50X21lc3Nh
Z2UNCj4gc2Z0cF9nZXRfY2xpZW50X21lc3NhZ2Uoc2Z0cF9zZXNzaW9uIHNmdHApIHsNCj4gLSAN
Cj4gLcKgwqAgLyogdGFrZSBhIGNvcHkgb2YgdGhlIHdob2xlIHBhY2tldCAqLw0KPiAtwqDCoCBt
c2ctPmNvbXBsZXRlX21lc3NhZ2UgPSBzc2hfYnVmZmVyX25ldygpOw0KPiAtK8KgIGlmIChtc2ct
PmNvbXBsZXRlX21lc3NhZ2UgPT0gTlVMTCkgew0KPiAtK8KgwqDCoMKgwqAgc3NoX3NldF9lcnJv
cl9vb20oc2Vzc2lvbik7DQo+IC0rwqDCoMKgwqDCoCBzZnRwX2NsaWVudF9tZXNzYWdlX2ZyZWUo
bXNnKTsNCj4gLSvCoMKgwqDCoMKgIHJldHVybiBOVUxMOw0KPiAtK8KgIH0NCj4gLSsNCj4gLcKg
wqAgc3NoX2J1ZmZlcl9hZGRfZGF0YShtc2ctPmNvbXBsZXRlX21lc3NhZ2UsDQo+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzc2hfYnVmZmVyX2dldChwYXls
b2FkKSwNCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNz
aF9idWZmZXJfZ2V0X2xlbihwYXlsb2FkKSk7DQo+IC0tLSANCj4gLTIuMjUuMQ0KPiAtDQo+IGRp
ZmYgLS1naXQgYS9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9saWJzc2gvbGlic3NoXzAuOC45LmJi
IGIvbWV0YS0NCj4gb2UvcmVjaXBlcy1zdXBwb3J0L2xpYnNzaC9saWJzc2hfMC4xMC40LmJiDQo+
IHNpbWlsYXJpdHkgaW5kZXggNjIlDQo+IHJlbmFtZSBmcm9tIG1ldGEtb2UvcmVjaXBlcy1zdXBw
b3J0L2xpYnNzaC9saWJzc2hfMC44LjkuYmINCj4gcmVuYW1lIHRvIG1ldGEtb2UvcmVjaXBlcy1z
dXBwb3J0L2xpYnNzaC9saWJzc2hfMC4xMC40LmJiDQo+IGluZGV4IDA2MWYxMzkxMi4uM2E1N2E3
MjhhIDEwMDY0NA0KPiAtLS0gYS9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9saWJzc2gvbGlic3No
XzAuOC45LmJiDQo+ICsrKyBiL21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L2xpYnNzaC9saWJzc2hf
MC4xMC40LmJiDQo+IEBAIC02LDEwICs2LDggQEAgTElDX0ZJTEVTX0NIS1NVTSA9DQo+ICJmaWxl
Oi8vQ09QWUlORzttZDU9ZGFiYjQ5NThiODMwZTVkZjExZDJiMGVkOGVhMjU1YTAiDQo+IMKgDQo+
IMKgREVQRU5EUyA9ICJ6bGliIG9wZW5zc2wiDQo+IMKgDQo+IC1TUkNfVVJJID0NCj4gImdpdDov
L2dpdC5saWJzc2gub3JnL3Byb2plY3RzL2xpYnNzaC5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNo
PXN0YWJsDQo+IGUtMC44IFwNCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgIGZpbGU6Ly9DVkUtMjAy
MC0xNjEzNS5wYXRjaMKgXA0KPiAtwqDCoMKgwqDCoMKgwqDCoMKgICINCj4gLVNSQ1JFViA9ICIw
NDY4NWE3NGRmOWNlMWRiMWJjMTE2YTgzYTBkYTc4YjRmNGZhMWY4Ig0KPiArU1JDX1VSSSA9DQo+
ICJnaXQ6Ly9naXQubGlic3NoLm9yZy9wcm9qZWN0cy9saWJzc2guZ2l0O3Byb3RvY29sPWh0dHBz
O2JyYW5jaD1zdGFibA0KPiBlLTAuMTAiDQo+ICtTUkNSRVYgPSAiZTgzMjI4MTdhOWU1YWFlZjA2
OThkNzc5ZGRkNDY3YTIwOWE4NWQ4NSINCj4gwqANCj4gwqBTID0gIiR7V09SS0RJUn0vZ2l0Ig0K
PiDCoA0KPiBAQCAtMjUsMTUgKzIzLDcgQEAgRVhUUkFfT0VDTUFLRSA9ICIgXA0KPiDCoMKgwqDC
oCAtRFdJVEhfUENBUD0xIFwNCj4gwqDCoMKgwqAgLURXSVRIX1NGVFA9MSBcDQo+IMKgwqDCoMKg
IC1EV0lUSF9aTElCPTEgXA0KPiAtwqDCoMKgIC1ETElCX1NVRkZJWD0ke0BkLmdldFZhcignYmFz
ZWxpYicpLnJlcGxhY2UoJ2xpYicsICcnKX0gXA0KPiArwqDCoMKgIC1EV0lUSF9FWEFNUExFUz0w
IFwNCj4gwqDCoMKgwqAgIg0KPiDCoA0KPiAtZG9fY29uZmlndXJlOnByZXBlbmQgKCkgew0KPiAt
wqDCoMKgICMgRGlzYWJsZSBidWlsZGluZyBvZiBleGFtcGxlcw0KPiAtwqDCoMKgIHNlZCAtaSAt
ZSAnL2FkZF9zdWJkaXJlY3RvcnkoZXhhbXBsZXMpL3MvXi8jRE9OT1RXQU5ULycNCj4gJHtTfS9D
TWFrZUxpc3RzLnR4dCBcDQo+IC3CoMKgwqDCoMKgwqDCoCB8fCBiYmZhdGFsICJGYWlsZWQgdG8g
ZGlzYWJsZSBleGFtcGxlcyINCj4gLX0NCj4gLQ0KPiAtVE9PTENIQUlOID0gImdjYyINCj4gLQ0K
PiDCoEJCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIG5hdGl2ZXNkayINCj4gDQo+IC09LT0tPS09LT0t
PS09LT0tPS09LT0tDQo+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0
aGlzIGdyb3VwLg0KPiBWaWV3L1JlcGx5IE9ubGluZSAoIzEwNzY1MCk6DQo+IGh0dHBzOi8vbGlz
dHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1kZXZlbC9tZXNzYWdlLzEwNzY1MA0K
PiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC8xMDMy
NzgxMjcvMzYxNjcwMg0KPiBHcm91cCBPd25lcjogb3BlbmVtYmVkZGVkLWRldmVsK293bmVyQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gVW5zdWJzY3JpYmU6DQo+IGh0dHBzOi8vbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1kZXZlbC91bnN1YsKgWw0KPiBhbnVqLm1pdHRh
bEBpbnRlbC5jb21dDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IA0KDQo=


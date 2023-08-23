Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9637EE49A0
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 08:13:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web11.6942.1692778410139037328
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Aug 2023 01:13:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=DLECpxBN;
 spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692778410; x=1724314410;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=y7cPE9b5UmipeK8rwFGpltXmBQEqojGdGQLxdFLlSNs=;
  b=DLECpxBN4t9HXU6+6euhBfL6sBS7otYYlDYA1QIc8chHYsKZewiLgSCi
   iXQM+x2WxZRQCtyIvzI0pd1NycJRsI64Hx1lOrFG+nS3LGrZ/Kbs+3w28
   kxl+kEDceas40/eqlRWgrqjFvGmkmiWeSGTkdS635TqVwsK8400dTXhVj
   kz5+EGOeGuPU688sqkK1/eX00W9WovVTU1VrviTfwK6jjXqJ0rZpVqmWP
   ByBvK1Apa6MiEfgB+mtQU2fGWC3WogRmBIGqhE6miGJNowc7aTnozFCBF
   CgY7g5qXh3iuVao31QAIHtPnUI45h1euN7d4NpTU82YC9FTjhrLhy+iIT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="460467579"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="460467579"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 01:13:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="850951380"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="850951380"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga002.fm.intel.com with ESMTP; 23 Aug 2023 01:13:28 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 23 Aug 2023 01:13:27 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 23 Aug 2023 01:13:27 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 23 Aug 2023 01:13:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CkhtrhFg2BKNAKKm1yhCPiTSd0n3vmsi0G5NMaGKnqTSXD0Y3ci3plygNesMn5ToT1JyvKC3niXB/Qhnwq/LqvlcRtaeBh7YsaVar9pNoZDzvc4T9xqWkkA8yDSzu4uZ2sklHc5vC/VWuxjXsgZbnhGqUiELL6HcpangNeQ80qLpoaAWGvDb47I0JIJmOFv4oil324eInUP+Kv1iFSwBS1PRuppqspirNxX4U8JwXNDXwoFfsKgaTv7/7HSRQuU1fukHQgNU4payJsmjl267zDKA5U6M8XgMeUHpJU0OmJzBuLK8ulH5YSSGwyg9+12l1KOT27nzklAZAZfK5b55rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y7cPE9b5UmipeK8rwFGpltXmBQEqojGdGQLxdFLlSNs=;
 b=Qe16f0lfkAeGH4713ewbNuHahTqyR1XIMg1d944PfgBQxI024SzdAoZVjoBvT/iqO9rTjx/HOx6xIMVAO7P1XaKzR3Mtwehfgpj2UuS4caJN3+Jl/Q/5cqa/79jU3W051JrcZYPNSpyDj/ZYJAATS3Qp5biobZQ0a2D64ow0tZzoM1sRFWAcAvnMVaYkqiXKOZTtra2uZ3vvaluhPDEgt2podZS0Wn72N8CFQl7u0nQpzr8iJg/ZPUb8eepll7GdIVZ+acOP0eU2YH63DbON1vjHnKNG+mE2b2Oh7mYoVjaC3i+55hj7c0t6DANxB/Io4Ffx4STE1LosSnS+Ix5c/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by PH7PR11MB6698.namprd11.prod.outlook.com (2603:10b6:510:1ac::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Wed, 23 Aug
 2023 08:13:25 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::1b87:b80a:6e3b:c2af]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::1b87:b80a:6e3b:c2af%4]) with mapi id 15.20.6699.026; Wed, 23 Aug 2023
 08:13:24 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "narpat.mali@windriver.com" <narpat.mali@windriver.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "akuster808@gmail.com"
	<akuster808@gmail.com>
Subject: Re: [oe] [meta-python][kirkstone][PATCH 1/2]
 python3-requests-toolbelt: upgrade 0.9.1 -> 0.10.1
Thread-Topic: [oe] [meta-python][kirkstone][PATCH 1/2]
 python3-requests-toolbelt: upgrade 0.9.1 -> 0.10.1
Thread-Index: AQHZ1ZcFDPnTVcKiW0KWME83roef7K/3iC8A
Date: Wed, 23 Aug 2023 08:13:24 +0000
Message-ID: <389e85d54acb72a6cd763f37924fe91d077a078c.camel@intel.com>
References: <20230823072624.1686194-1-narpat.mali@windriver.com>
In-Reply-To: <20230823072624.1686194-1-narpat.mali@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.4 (3.48.4-1.fc38) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|PH7PR11MB6698:EE_
x-ms-office365-filtering-correlation-id: 5707b6aa-724c-4bd7-f17b-08dba3b0d288
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: G2XYhZXhL4lpVm9fuFl7He8cxERzNwpnmtDaCqHAcXQ24lp7JqCLmCIu1kYimFjMNEDDH2Zt4obdxDFTOH9oUoSYFuLImSyyY0YcNf+13EZ4R3mrN21RTi7CivzrIalIXzu6+Ob/3De7QsyeiLl2v/LgGDuDvARk0tCbTmXThsZxc6e6v1B3SiLDgFsMmYwFdGsFLKOfQcsg/VpVBzqbsgAqJiNnUBqQTQj+uCXIXE4ky7KSBnopa56WmfVW6aJfvmgqu6H/h0wBrkfrBQ4rcOmGh04gRBTcakhch1Ol0sPjtY6NnNl8R5U6mhbxJYPa5nmMiUO+zam8HpoIP10Kyr2IqQ1cXfFiTwVL56piQo2bXN6BISDsLRj0DIs9G/E2Zvlmw3w2uggxhtOVTIvTu3Mr9ZG25Lb4M8rwNNu9FDgxDSZA9WydEnmj2NezXawh3UysgK2WPMZVtFgXNcxA/GLpW0Qohl2HKR398pk9+JWUSl7SHisiJRrZnfIOKJdfo/m9Tt52yoQRCcvliYZvUHM83GDHFeLEg5Ju3nuNwI9GxgwzFbtTgy9Mbo47fxX2J851AsIc1d5Oy1InVJ2U9iB8DgEoXaa9vghJeKU8hyw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(376002)(136003)(396003)(39860400002)(451199024)(1800799009)(186009)(2906002)(38070700005)(38100700002)(6506007)(6486002)(83380400001)(5660300002)(26005)(86362001)(8676002)(2616005)(8936002)(966005)(316002)(64756008)(66946007)(6512007)(76116006)(66446008)(66556008)(66476007)(110136005)(91956017)(66899024)(82960400001)(478600001)(122000001)(71200400001)(36756003)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S0IxUXhiYktFdWpUTURJK2l0OUwxdFFYcTN3bDlldmpjOWJvNFhySy8rM2t5?=
 =?utf-8?B?VTJOYUVDcGZYcERudU1tb2NuSUdpQjlQb0N3RHh2UlMwbjZBdnpLTUsvdmd3?=
 =?utf-8?B?SkpFWkNhRUZsSzA5Yk1nZ09Mc2tMRTVTQ2wwQmM5R1RaZDFUMDB3MlFtQUxT?=
 =?utf-8?B?M0ZMcGNERmZLYklqeHU0YmF4VUJBNGRZOG81bEROaHNIVkU2SGtkOHB0aC94?=
 =?utf-8?B?QjNYbUJZcGlmd3MvdjlDbEV6QzVlVVhIaGs1cU8wYTBXVFlWd0MzM0RBT0pQ?=
 =?utf-8?B?OVBNelU3NGZYWTlSckNWTmh0cDd2SWVYQ1FDWkl3OENYOXRkMjNZUFNlbWRC?=
 =?utf-8?B?Y0pLV0NmOFM3cXhjbkNpUXhqb1pjY2Rqa3JoWDV6c1pQRlk3YzRqbUt2SFJD?=
 =?utf-8?B?WEtkeGNDcnJCN2s1d1U2eEx4YzY2KzE0eEd2Z0Z6bXd3eDBuZFRyV3B2QTAr?=
 =?utf-8?B?NE8yZTJvbEZBd0VxZXpJbDBuZktnRzJSc2I1cUJDM0FjVitacXpkQkthR0Nh?=
 =?utf-8?B?dSt6MmdZSXBHRTN3UkwvVW44QXVZTkpqWWJTOXpyYXpFSlBEN3c0TmxINW1j?=
 =?utf-8?B?cVVCZjBjL0FudGsrRW5paG1KWG40S0RjZ1BSRlE4V2tRRTJoUGpLVllFejZP?=
 =?utf-8?B?TWROM0pxY1ZkdEJmWGZqbWMyTkdzNm56ZlNrTFkrTWx2MFlPWE9BWjNKcGd6?=
 =?utf-8?B?TkY5bjhNNXZZUUpONEFOMzdYZ1BLdUtYWW9kK0dpaGFaY1lXOWFwRzdmdHhy?=
 =?utf-8?B?ZHp3TzFQb1MxTXJOT0UrSWxDRVBpM3ZJZmFidTNLOVJoVWxUSDQ5VFJMVko2?=
 =?utf-8?B?WnA0OG4vbGNRbDUra2NXUGg1VmpVRm9Fd2xEUjZXT1N5RmV5WStxaEp6RVZs?=
 =?utf-8?B?TWxuRExEb29MYmQ2emRaMzJMSE5MaTVRNEVzQTZrMHpTZzZPbjJ6WGc5ek9s?=
 =?utf-8?B?ZVljVEZ6dmJ3RElrWEtCMVpVV3N0QUQyZGV0WGl2TUFDMmZSUlVnUHUvWjk0?=
 =?utf-8?B?Vm9zK09TQWtQQzZjMG9uMXZBbXBvckI2dWJVUnUwMCt4bDRETldBbHNCWjJq?=
 =?utf-8?B?cURJeGx6alhYSTR5SzJnSWV4OTNnTkJjUFVXclI3UCtCUkI1ay9oelRMVjdU?=
 =?utf-8?B?VU9Ob1JNeFcxaHh4QzJrQ1c4Q2N5eFdMVUZKZzVITFpia0NtWncxbmhlUm9w?=
 =?utf-8?B?aHYvaUxZczhhR2hKdDBrdDJGUlIzeWxKS0VOOG0zTU1qNTVhQmNKWmdpSUh5?=
 =?utf-8?B?dSt2OFNiNWcrNzNGMHN6d2Frbis4cnFldlhxdTBqREludCtaOGtSRzlSY2VK?=
 =?utf-8?B?ekk5RUJnUkU0cjBIc0ZyYlFVUElhRXE1NmlKT3JEQkFjdW5iSmFmcWY0RjY3?=
 =?utf-8?B?WEtjVHZ1NHUrMXJoNVAxYytXTnFSaWdaaGxESkxOTCtYRjB5MGlkZW9JWmpn?=
 =?utf-8?B?OHA2RXdlQUxTckNNZTZ1TDVWNFh5Y1hxVGVvWWwrRWlUY1ZUZE5sZjltTTVD?=
 =?utf-8?B?cTlqRmhES0dQK1BTNVdGYUtEQlZLY0lNdDZNT0dKMmMwRnFpeFVwMHpCeVJR?=
 =?utf-8?B?WFpUUXZKSGNNYlcveHRBSmZJcjU1UzcvamlzaE9xdC9TTWM1cFplUWNWcE1q?=
 =?utf-8?B?MFM1bmNrZzFNYXpsaXA4VmRuZkk2ZEo0VldZdEw5dEJ5ZGsvdE5saGZURUVS?=
 =?utf-8?B?VDJhdGc3MVBtR2x2YmdSQ2t1Q3hLR3JodEhHaHRNUlVFbXhHaDRPd2Rabkpy?=
 =?utf-8?B?OGNUL2NHWSsvVzA2ZUZDQlRET3k2NjZEUm9wempoWW1xZjFyeU81V2xDUlo0?=
 =?utf-8?B?YkJKaTd3SGs1cjZuS3pFREVtc1FSalJaUVdZb3laS3pNUkdLQndZS3pwUFZ3?=
 =?utf-8?B?RFl0Ky9nUGF5MjJzSFVuYm51Nld1dmJPSUJXZGRuMUx2TE85Y0NKOGliU3VB?=
 =?utf-8?B?bE5EcTI3KzB4WWUzUVVyY3NMSFhaTnA5dkhnc1ZKd3NEZWV5MzJkdlVJeW5t?=
 =?utf-8?B?ZzhSM0wwUkJWTk03WUhEK2FNcGNwQndRZmRmeGhtVTQrVHFZNVpkbnc2NWk5?=
 =?utf-8?B?Z2hhTy92ZkUybmtNOXBEZXVrT3RRYWs3RFBkak9WRG1zV3FmN0VweVp6c25s?=
 =?utf-8?B?dXdMcmxORkZUYjRCaEgvVzJraVM0ZDQ5RHlGNko3R2k1L1lwZVRsK01MSWdV?=
 =?utf-8?B?ZUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <50F42B164104764D808551CAECFFD341@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5707b6aa-724c-4bd7-f17b-08dba3b0d288
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2023 08:13:24.4265
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lNoX5yA4j1W5ilG3hhEZimaMO79YV3vbTcssPxdtx7rfRHNb3EpNpUhWXYJZVdNAUYR5xrCrZ1PCH/vZmO6ELQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6698
X-OriginatorOrg: intel.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Aug 2023 08:13:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104530

T24gV2VkLCAyMDIzLTA4LTIzIGF0IDA3OjI2ICswMDAwLCBOYXJwYXQgTWFsaSB2aWENCmxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcgd3JvdGU6DQo+IEZyb206IE5hcnBhdCBNYWxpIDxuYXJwYXQubWFs
aUB3aW5kcml2ZXIuY29tPg0KPiANCj4gQ2hhbmdlbG9nOg0KPiBodHRwczovL3B5dXAuaW8vcGFj
a2FnZXMvcHlwaS9yZXF1ZXN0cy10b29sYmVsdC9jaGFuZ2Vsb2cNCj4gaHR0cHM6Ly9naXRodWIu
Y29tL3JlcXVlc3RzL3Rvb2xiZWx0L2Jsb2IvbWFzdGVyL0hJU1RPUlkucnN0DQo+IA0KPiAtIExp
Y2Vuc2UtVXBkYXRlOiB1cmwgb2YgTGljZW5zZSBjaGFuZ2VkIGZyb20gaHR0cCB0byBodHRwcy4N
Cj4gLSBGaXhpbmcgbWlzc2luZyBuZXdsaW5lIGluIGR1bXAgdXRpbGl0eS4NCj4gLSBBZGQgc3Vw
cG9ydCBmb3IgcHJlcGFyaW5nIHJlcXVlc3RzIGluIEJhc2VVcmxTZXNzaW9uLg0KPiAtIEZpeCB1
cmxsaWIzIHdhcm5pbmcgdG8gb25seSBlbWl0IG9uIFg1MDlBZGFwdGVyIHVzYWdlDQo+IA0KPiBV
cHN0cmVhbSBtYXN0ZXIgcGF0Y2hlczoNCj4gMC45LjEgLT4gMC4xMC4wwqAgOg0KPiBodHRwczov
L2dpdC5vcGVuZW1iZWRkZWQub3JnL21ldGEtb3BlbmVtYmVkZGVkL2NvbW1pdC8/aWQ9YTRmMjY0
NmVmMjdhM2YyN2JjNjA3ZDU3YjgxNjYwNzFmMzA3NDI2Zg0KPiAwLjEwLjAgLT4gMC4xMC4xIDoN
Cj4gaHR0cHM6Ly9naXQub3BlbmVtYmVkZGVkLm9yZy9tZXRhLW9wZW5lbWJlZGRlZC9jb21taXQv
P2lkPWI1Y2Q2ZjYxNjRlYjNhYjA0MDNmNjEwMjM2YWMwY2JiZTU0NTk2NzENCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IE5hcnBhdCBNYWxpIDxuYXJwYXQubWFsaUB3aW5kcml2ZXIuY29tPg0KPiAtLS0N
Cj4gwqAuLi5sYmVsdF8wLjkuMS5iYiA9PiBweXRob24zLXJlcXVlc3RzLXRvb2xiZWx0XzAuMTAu
MS5iYn0gfCA4ICsrKy0tLQ0KPiAtLQ0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KyksIDUgZGVsZXRpb25zKC0pDQo+IMKgcmVuYW1lIG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3tweXRob24zLXJlcXVlc3RzLQ0KPiB0b29sYmVsdF8wLjkuMS5iYiA9PiBweXRo
b24zLXJlcXVlc3RzLXRvb2xiZWx0XzAuMTAuMS5iYn0gKDcwJSkNCj4gDQo+IGRpZmYgLS1naXQg
YS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJlcXVlc3RzLQ0K
PiB0b29sYmVsdF8wLjkuMS5iYiBiL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtDQo+IHJlcXVlc3RzLXRvb2xiZWx0XzAuMTAuMS5iYg0KPiBzaW1pbGFyaXR5IGlu
ZGV4IDcwJQ0KPiByZW5hbWUgZnJvbSBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXJlcXVlc3RzLQ0KPiB0b29sYmVsdF8wLjkuMS5iYg0KPiByZW5hbWUgdG8gbWV0
YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1yZXF1ZXN0cy0NCj4gdG9v
bGJlbHRfMC4xMC4xLmJiDQo+IGluZGV4IDcyYWQ3YTYxODAuLmMzOTk1MGFiNWQgMTAwNjQ0DQo+
IC0tLSBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcmVxdWVz
dHMtDQo+IHRvb2xiZWx0XzAuOS4xLmJiDQo+ICsrKyBiL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtcmVxdWVzdHMtDQo+IHRvb2xiZWx0XzAuMTAuMS5iYg0KPiBA
QCAtMywxNCArMywxMiBAQCBIT01FUEFHRSA9ICJodHRwczovL3Rvb2xiZWx0LnJlYWR0aGVkb2Nz
Lm9yZyINCj4gwqBBVVRIT1IgPSAiSWFuIENvcmRhc2NvLCBDb3J5IEJlbmZpZWxkIg0KPiDCoA0K
PiDCoExJQ0VOU0UgPSAiQXBhY2hlLTIuMCINCj4gLUxJQ19GSUxFU19DSEtTVU0gPQ0KPiAiZmls
ZTovL0xJQ0VOU0U7bWQ1PTcxNzYwZTBmMWRkYThjZmY5MWIwYmM5MjQ2Y2FmNTcxIg0KPiArTElD
X0ZJTEVTX0NIS1NVTSA9DQo+ICJmaWxlOi8vTElDRU5TRTttZDU9NmYxNDMwMmE0YjQwOTkwMDlh
YjM4YjRkZGU1ZjEwNzUiDQo+IMKgDQo+IMKgU1JDX1VSSSA9ICJmaWxlOi8vcnVuLXB0ZXN0wqBc
DQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoA0KPiBmaWxlOi8vMDAwMS1GaXgtY29sbGVjdGlvbnMu
YWJjLWRlcHJlY2F0aW9uLXdhcm5pbmctaW4tZG93bmxvYWR1LnBhdGNoDQo+IMKgXA0KPiAtwqDC
oMKgwqDCoMKgwqDCoMKgwqAgIg0KDQpUaGUgcGF0Y2ggaXRzZWxmIHNob3VsZCBhbHNvIGJlIHJl
bW92ZWQ/DQoNClRoYW5rcywNCg0KQW51ag0KDQo+ICvCoMKgwqDCoMKgwqDCoMKgwqAgIg0KPiDC
oA0KPiAtU1JDX1VSSVttZDVzdW1dID0gImIxNTA5NzM1YzRiNGNmOTVkZjI2MTlmYWNiYzM2NzJl
Ig0KPiAtU1JDX1VSSVtzaGEyNTZzdW1dID0NCj4gIjk2ODA4OWQ0NTg0YWQ0YWQ3YzE3MTQ1NGYw
YTVjNmRhYzIzOTcxZTk0NzI1MjFlYTNiNmQ0OWQ2MTBhYTZmYzAiDQo+ICtTUkNfVVJJW3NoYTI1
NnN1bV0gPQ0KPiAiNjJlMDlmN2ZmNWNjYmRhOTI3NzJhMjlmMzk0YTQ5YzNhZDZjYjE4MWQ1Njhi
MTMzNzYyNmIyYWJiNjI4YTYzZCINCj4gwqANCj4gwqBpbmhlcml0IHB5cGkgc2V0dXB0b29sczMg
cHRlc3QNCj4gwqANCj4gDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IExpbmtzOiBZb3Ug
cmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLg0KPiBWaWV3L1JlcGx5IE9u
bGluZSAoIzEwNDUyOSk6DQo+IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5l
bWJlZGRlZC1kZXZlbC9tZXNzYWdlLzEwNDUyOQ0KPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8v
bGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC8xMDA5MTA2MDcvMzYxNjcwMg0KPiBHcm91cCBPd25l
cjogb3BlbmVtYmVkZGVkLWRldmVsK293bmVyQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gVW5z
dWJzY3JpYmU6DQo+IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRl
ZC1kZXZlbC91bnN1YsKgWw0KPiBhbnVqLm1pdHRhbEBpbnRlbC5jb21dDQo+IC09LT0tPS09LT0t
PS09LT0tPS09LT0tDQo+IA0KDQo=


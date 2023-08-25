Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 254CBC3DA66
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 08:08:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web11.8965.1692950905609597179
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Aug 2023 01:08:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=gaiVGzw3;
 spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692950905; x=1724486905;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=XzzL/daAWHV4uW9pe6yrsu4KY4cEdR8FeeWxAkUg7uM=;
  b=gaiVGzw3Xg9UFOdtmkJzaEJug28XBP1isTsF73HeXKLPx7ctKZRzS8ls
   2nYyh8H6Jl8UVgdyinrQ1zOFmB7m//H3N3TIxczcQi3uLNAiWETWTvH9Q
   +bII1bEBRh4lr9ovDu5PjtsoFOlXsjbA7LxDGrbkIKYgpsjf1FQaZYTqv
   RjKGxQoN71b3ny9H3S0BUGFQeBIFJvVpxojfDKDfDxYUyU4Pqxj7yNtMp
   NK37gpMZdggQRsVNZKDcGij0xP69LYg0/rna6hB+lyAkWI/2XjCNUdKv8
   nvZO5nVXriG6NLj/FB2jgxjYh4CS/08vAcCVRBRwimrk39TWN0urZ9gUl
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="374637170"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="374637170"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 01:08:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="807462615"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="807462615"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga004.fm.intel.com with ESMTP; 25 Aug 2023 01:08:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 25 Aug 2023 01:08:16 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 25 Aug 2023 01:08:16 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 25 Aug 2023 01:08:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZoTynzV6uT8n2FMrnlOPfVjNRhSsFxfL+RAZqKS4KUUr8reakLKiifaXftaZXD32izu7dkRcKsH+xndbJXA0OjuTfCBCeXSDiblhSRcY80NttLax4CdaY5QoLmx0kvu0+j2YBpbrOTtunwu0OFEXiTG1U44RW9+w5q9kbuJB1p7nzH0IoZTn4gzWpDLpWqNtm9xxnJDFbD8Q4mswsDQJ/j0CGVfqn28fsyN2XQ7H3gJXBio/QT9EHbmW7dRN1Wl6V5Jida5li2HHZn5EEIZftO+xtpc7EMhH132/nPiSKTu9o5ztp8h6gCtGTacjHNXpcH2pcijeczF6okge2twsCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XzzL/daAWHV4uW9pe6yrsu4KY4cEdR8FeeWxAkUg7uM=;
 b=QaUDDWKcpnvn9qTnWG3giatQJC8EWmgtXqzqQSAYWWc8N8CQf7gkA3VQ2Ddn7Ct/6+15qU6ceLCxBsIbtqO/wxTSaz2NZoOlqlwo5oVGelEdao3SWxgHufm7p+GpE5bJzx4WtsfhiYgkzDOL2IZzPbSseaF77/cKmsbITK/M+R5G1wPpJPrAwc4q7gNkIE8u+WcX/RzuuKslxJVLR0+4/ioQpBlfJjRrCz66xtol59AwEwbtx5YVA6C1z5U20HAGrqXxMgUxVJ+K/2Om8AjuBO7VWDW6s59F0CJwJcLwaNLJFtj/ka7wGx0rffQgLe/j10eMwiNnF6zjCDRyj5cG3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by IA0PR11MB8379.namprd11.prod.outlook.com (2603:10b6:208:488::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Fri, 25 Aug
 2023 08:08:15 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::1b87:b80a:6e3b:c2af]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::1b87:b80a:6e3b:c2af%4]) with mapi id 15.20.6699.027; Fri, 25 Aug 2023
 08:08:14 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "soumya.sambu@windriver.com"
	<soumya.sambu@windriver.com>
Subject: Re: [oe][meta-oe][master][mickledore][PATCH 1/1] krb5: Fix
 CVE-2023-36054
Thread-Topic: [oe][meta-oe][master][mickledore][PATCH 1/1] krb5: Fix
 CVE-2023-36054
Thread-Index: AQHZ1ydU/2/SfwE68kaxaCyEyhgUf6/6qEYA
Date: Fri, 25 Aug 2023 08:08:14 +0000
Message-ID: <246ba86d016be47bf1f1a34c4d28302c8186836e.camel@intel.com>
References: <20230825073923.1528500-1-soumya.sambu@windriver.com>
In-Reply-To: <20230825073923.1528500-1-soumya.sambu@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.4 (3.48.4-1.fc38) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|IA0PR11MB8379:EE_
x-ms-office365-filtering-correlation-id: 2d16f253-a132-4ecd-c605-08dba5426e67
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8/lStlcYq3mvTFp1UJHKx8SsK1dSkJHx6alRO7PRHiLrUG402h6H7EtTMoEg+xMiBFdshhiLKVykMDsVkSXXSsK2TCNptcqkJ7R06EGxSWdlx4WK+xkLGrPcJKrcqhyR+P/G1puxwJ1gF5Xgc3CIjEOENKewAqaPAuXNNkUizrZu7i8+6L5CjcixgAHO9MYPd33YmyoRHbiN3D5uoOscHhdrny2OMwYxIAUw5IETZwHyIO8NQ6GHr2ie2eSpgc4jPtP0Oy5fu8v/StaYZywtw/t59ic5kXYUC7fie44FS4R/B+901mmb2dojidJDGnfuS29BZwgyW3IrU42gpzJquhqML9zpb1zWHVYaXzrLbOwZlyToJbMRDOfi7nbK1ZveYFNSMUDU6X5B9q3GvN5EF7yQMXZPkn/iVTAo/Z+0fUPH1x+hhhc8V7/x2l1Qteww4I30gTIwm55QmuFoTs/1GeES965KzRCmEwaaWiOP/E/cy5Z6UwJVAfGuob7Z8+SIypEFhnZUPScq95aglZrHkB2MsjQJwq9n/bwDtQAbwbmQx84yMCsWU7syDrg3awjZBCtEC+Mti79wgKavN2T7znyT30mLBPDYDYoVWrSykjkBTKqP5hFZapbRF2BDTX7fLYqcQssqep9ZQZ7wGBsuVw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(136003)(396003)(376002)(366004)(451199024)(1800799009)(186009)(86362001)(122000001)(38070700005)(38100700002)(82960400001)(36756003)(66899024)(6506007)(71200400001)(6486002)(478600001)(966005)(5660300002)(316002)(76116006)(2906002)(110136005)(91956017)(8676002)(8936002)(64756008)(6512007)(83380400001)(26005)(66946007)(66446008)(66476007)(66556008)(41300700001)(2616005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Ky9VVVkwQm91K3NObER6R2FGaVZYWDA3b2FKcXV1TUZYUlp2a25vWXY1eWN6?=
 =?utf-8?B?eHZ1KzRuZmZMWUZVWmtxcWtubVFVVjgzQTY1NldPMUV0eDFsdUdNRlhsMGhU?=
 =?utf-8?B?cWUvUEZKKzdqOWxmOWltTk9rSXAvK25pZzRVVk8wcTJ4YmhUcUdaUmFWVFU5?=
 =?utf-8?B?UVViTUxXVE1kWVdsTXk2Sk5uUzcyNERRbDdDU2Y4NENvVE9NZTg1TFhQZzU3?=
 =?utf-8?B?REhYSnNYeWFiS1JZRk83RGdTUGluVHdyeUVsc0tTb3ltdTd4T1JGb1RwUXlW?=
 =?utf-8?B?KytiK2N6WDh6V3NkRnE2WEpYRStSU2FZdWFsekZDSmRSZ2pBcllBaWxFbmls?=
 =?utf-8?B?KzhRZkdQdWpiOFhBZlNLRDZjYzlmeGQvL3NwbzdPaWkzenQ3VjZCNXlPUnBT?=
 =?utf-8?B?b2h6SEhzVVZzK0VtMG1aLzVZVmFJelIxRGxlQzY5RUVuZXhrTm1MUHVGOEFj?=
 =?utf-8?B?TEkvbHMvdlQzQy9EQVZXOXVaZlJTUjdVUWtOWkgwQXlidGM1TkhnTW80Qzlm?=
 =?utf-8?B?Nk9tY0RNSzY4ZFQxRHYvMk1iVGZHZmtsWm9vTmZTRlRvbzZ4UC9vTlBNc3VU?=
 =?utf-8?B?SEpaUVZsZjlXcGhweE5ncEMvS3JXMUM1MHh3VzJ0aktnQW1iUTAwMFJWZVJo?=
 =?utf-8?B?MFQrT3U4VDNxYlhRZ0JVcFNaTDFMMkdSaDU2U2RlSUlwQmxhUVNndWwvTWVu?=
 =?utf-8?B?OEw0N0hsNWVLcFpMOGZZOE5iY0pjTzk1ME5VS0k2UXcxVS9hRlRpNTJFbFM5?=
 =?utf-8?B?dFdlNzF2eUoyOGpsRkx0OXBqc3pKSTgyLzhvYWR3TlVLQ25HV3pqVjd2V2Ez?=
 =?utf-8?B?NEtyUWhWQzBNejRBZlVvZmVlVTJpWVd0TW9VLytDNEJsYUZ1VTBxZS9DSDk3?=
 =?utf-8?B?KzI0ZW52ZFJSVTZnTXNtZU5xSEVqWEVxYlc1NnVyaWFaem40L0hoa1JTalQ4?=
 =?utf-8?B?dkRySXFYeDVsY3B1VjUrakFYamxaWER2QjJockkva0txYmMxSlk0U0p3UFhn?=
 =?utf-8?B?WS9FRXdhY2w1bkpaUTVyQklpeHdHMHZwMXQ2QnE5Y1oveG80U09sdm9KM215?=
 =?utf-8?B?VHZKcnZKYW8wYXlnRjBWbXkrTkVCTy9wZzhxRmdrOWVSM1FOMi9NOStUeXBB?=
 =?utf-8?B?ZVNBajlMbHVFUXhheGRkeEZBR1hMN2FjYUJudDV1WGh3eDJFMEV4YVJMaDlT?=
 =?utf-8?B?U25xdWw1ZTIxSTh0dkl1UUpaOE9SVkFWTEM2Z3JRbnlDTkVNTWRWdGdnZW5v?=
 =?utf-8?B?QkZZVEFOWEFHSnpZODFKSkx0bnZ0bHNmQ3NuaTB4TFVFUVZDcVVIZEQxUm9S?=
 =?utf-8?B?bjZEYXFSU2lGcUUwdFF0OVVLaGRSMjM0OCtXeUhLUHJMd1FKU1AzOWJkMTFv?=
 =?utf-8?B?YWZreUIyU3E5S3laOXhtdW56ZG9hYktDSytiS3BROWFNNThPRzBGekFmUDZU?=
 =?utf-8?B?blRXdW1QdXBTaW1abEdXREZJdnhwQ29aRVV2bS9EL3duWTVMeDJrbG1QQ09N?=
 =?utf-8?B?WXhXOEJhMkhNVkVwMGZmU1MwVkpSUk9zeWZ6OXI5MCt1dkI2c2l5aXZENXMr?=
 =?utf-8?B?YlpaZzQwV1FFc3RjYyt4cjEzMlNOczJjU3pLaStVOGpNUWl5U0h0NTNscDMv?=
 =?utf-8?B?UzFGaEQzcGhjNS9iUXpWRlBJcEp0L0xWVnZKcHpWT0FuYnYzWCswaTBMYVZq?=
 =?utf-8?B?NlR4Z3NqWExLV1F0djJ3clJnQ2wvS25ZSFIvTW4zcXBPU3JEaUxaV3FyNlFt?=
 =?utf-8?B?RmFDY0pEOSs2VnVkTUtmd29QdGJSb05wRjhmbFNIRVJueU00d0RoTFVxYndH?=
 =?utf-8?B?MWlmeWtSSk43cks1REZuUnk2UFhZRmZCVlN1YlY2U21oc0tpRzQzUS9neG41?=
 =?utf-8?B?WTNlOEpOSGcxOWNMd1U1WkVBa3l5K0orc3paUGNMRGU0VitibEFuL3lTNVRl?=
 =?utf-8?B?dnMwWWtHSnZ4Y05WdVJDQU5mSHdTUU1DVW5mUjJ6amUzZWNCZ2NmbEVCa2FC?=
 =?utf-8?B?S2pvODROYlRrVkR6VjlIcHJYSUZvWCtZVkpmQWo4VStZaE1aNUJQWUlHb09L?=
 =?utf-8?B?aVJXbDVvZUJVOEJaMkFoTXFLaUpwRzBETjlKTkhjYUJJQllqSmNqV3VCRk5o?=
 =?utf-8?B?ODJCRjhjUWlGUGVCQjdkcWxQZitLbzNiUG9FbVZKYTRIWXZmR0VoNFZITHow?=
 =?utf-8?B?YWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2CB49EC9D9A9F541936ED2E198302738@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d16f253-a132-4ecd-c605-08dba5426e67
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2023 08:08:14.1233
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GBPqlBeDvVdLeuOvUxyTBU0KCb8QTn2/vWE2nTlbSuP0Gmhqp+FbBDGCmTey/jYcGkD4HoO0CMc68YGFIO/YuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8379
X-OriginatorOrg: intel.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Aug 2023 08:08:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104601

T24gRnJpLCAyMDIzLTA4LTI1IGF0IDA3OjM5ICswMDAwLCBTb3VteWEgdmlhIGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcNCndyb3RlOg0KPiBGcm9tOiBTb3VteWEgU2FtYnUgPHNvdW15YS5zYW1idUB3
aW5kcml2ZXIuY29tPg0KPiANCj4gbGliL2thZG01L2thZG1fcnBjX3hkci5jIGluIE1JVCBLZXJi
ZXJvcyA1IChha2Ega3JiNSkgYmVmb3JlIDEuMjAuMg0KPiBhbmQgMS4yMS54IGJlZm9yZSAxLjIx
LjEgZnJlZXMgYW4gdW5pbml0aWFsaXplZCBwb2ludGVyLiBBIHJlbW90ZQ0KPiBhdXRoZW50aWNh
dGVkIHVzZXIgY2FuIHRyaWdnZXIgYSBrYWRtaW5kIGNyYXNoLiBUaGlzIG9jY3VycyBiZWNhdXNl
DQo+IF94ZHJfa2FkbTVfcHJpbmNpcGFsX2VudF9yZWMgZG9lcyBub3QgdmFsaWRhdGUgdGhlIHJl
bGF0aW9uc2hpcA0KPiBiZXR3ZWVuIG5fa2V5X2RhdGEgYW5kIHRoZSBrZXlfZGF0YSBhcnJheSBj
b3VudC4NCj4gDQo+IFJlZmVyZW5jZXM6DQo+IGh0dHBzOi8vbnZkLm5pc3QuZ292L3Z1bG4vZGV0
YWlsL0NWRS0yMDIzLTM2MDU0DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBTb3VteWEgU2FtYnUgPHNv
dW15YS5zYW1idUB3aW5kcml2ZXIuY29tPg0KPiAtLS0NCj4gwqAuLi4va3JiNS9rcmI1L0NWRS0y
MDIzLTM2MDU0LnBhdGNowqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDY4DQo+ICsrKysrKysrKysr
KysrKysrKysNCj4gwqAuLi4vcmVjaXBlcy1jb25uZWN0aXZpdHkva3JiNS9rcmI1XzEuMjAuMS5i
YsKgIHzCoCAxICsNCg0KSSB0aGluayB0aGlzIHJlY2lwZSBjYW4gYmUgdXBncmFkZWQgdG8gMS4y
MC4yIGluc3RlYWQuDQoNClRoYW5rcywNCg0KQW51ag0KDQo+IMKgMiBmaWxlcyBjaGFuZ2VkLCA2
OSBpbnNlcnRpb25zKCspDQo+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEtb2UvcmVjaXBlcy1j
b25uZWN0aXZpdHkva3JiNS9rcmI1L0NWRS0yMDIzLQ0KPiAzNjA1NC5wYXRjaA0KPiANCj4gZGlm
ZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1jb25uZWN0aXZpdHkva3JiNS9rcmI1L0NWRS0yMDIz
LQ0KPiAzNjA1NC5wYXRjaCBiL21ldGEtb2UvcmVjaXBlcy1jb25uZWN0aXZpdHkva3JiNS9rcmI1
L0NWRS0yMDIzLQ0KPiAzNjA1NC5wYXRjaA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRl
eCAwMDAwMDAwMDAuLjE2MGMwOTBiYw0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL21ldGEtb2Uv
cmVjaXBlcy1jb25uZWN0aXZpdHkva3JiNS9rcmI1L0NWRS0yMDIzLTM2MDU0LnBhdGNoDQo+IEBA
IC0wLDAgKzEsNjggQEANCj4gK0Zyb20gZWYwOGIwOWM5NDU5NTUxYWFiYmU3OTI0ZmIxNzZmMTU4
MzA1M2NkZCBNb24gU2VwIDE3IDAwOjAwOjAwDQo+IDIwMDENCj4gK0Zyb206IEdyZWcgSHVkc29u
IDxnaHVkc29uQG1pdC5lZHU+DQo+ICtEYXRlOiBNb24sIDIxIEF1ZyAyMDIzIDAzOjA4OjE1ICsw
MDAwDQo+ICtTdWJqZWN0OiBbUEFUQ0hdIEVuc3VyZSBhcnJheSBjb3VudCBjb25zaXN0ZW5jeSBp
biBrYWRtNSBSUEMNCj4gKw0KPiArSW4gX3hkcl9rYWRtNV9wcmluY2lwYWxfZW50X3JlYygpLCBl
bnN1cmUgdGhhdCBuX2tleV9kYXRhIG1hdGNoZXMNCj4gdGhlDQo+ICtrZXlfZGF0YSBhcnJheSBj
b3VudCB3aGVuIGRlY29kaW5nLsKgIE90aGVyd2lzZSB3aGVuIHRoZSBzdHJ1Y3R1cmUgaXMNCj4g
K2xhdGVyIGZyZWVkLCB4ZHJfYXJyYXkoKSBjb3VsZCBpdGVyYXRlIG92ZXIgdGhlIHdyb25nIG51
bWJlciBvZg0KPiArZWxlbWVudHMsIGVpdGhlciBsZWFraW5nIHNvbWUgbWVtb3J5IG9yIGZyZWVp
bmcgdW5pbml0aWFsaXplZA0KPiArcG9pbnRlcnMuwqAgUmVwb3J0ZWQgYnkgUm9iZXJ0IE1vcnJp
cy4NCj4gKw0KPiArQ1ZFOiBDVkUtMjAyMy0zNjA1NA0KPiArDQo+ICtBbiBhdXRoZW50aWNhdGVk
IGF0dGFja2VyIGNhbiBjYXVzZSBhIGthZG1pbmQgcHJvY2VzcyB0byBjcmFzaCBieQ0KPiArZnJl
ZWluZyB1bmluaXRpYWxpemVkIHBvaW50ZXJzLsKgIFJlbW90ZSBjb2RlIGV4ZWN1dGlvbiBpcyB1
bmxpa2VseS4NCj4gK0FuIGF0dGFja2VyIHdpdGggY29udHJvbCBvZiBhIGthZG1pbiBzZXJ2ZXIg
Y2FuIGNhdXNlIGEga2FkbWluDQo+IGNsaWVudA0KPiArdG8gY3Jhc2ggYnkgZnJlZWluZyB1bmlu
aXRpYWxpemVkIHBvaW50ZXJzLg0KPiArDQo+ICt0aWNrZXQ6IDkwOTkgKG5ldykNCj4gK3RhZ3M6
IHB1bGx1cA0KPiArdGFyZ2V0X3ZlcnNpb246IDEuMjEtbmV4dA0KPiArdGFyZ2V0X3ZlcnNpb246
IDEuMjAtbmV4dA0KPiArDQo+ICtVcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0DQo+IFtodHRwczov
L2dpdGh1Yi5jb20va3JiNS9rcmI1L2NvbW1pdC9lZjA4YjA5Yzk0NTk1NTFhYWJiZTc5MjRmYjE3
NmYxNQ0KPiA4MzA1M2NkZF0NCj4gKw0KPiArU2lnbmVkLW9mZi1ieTogU291bXlhIFNhbWJ1IDxz
b3VteWEuc2FtYnVAd2luZHJpdmVyLmNvbT4NCj4gKy0tLQ0KPiArIHNyYy9saWIva2FkbTUva2Fk
bV9ycGNfeGRyLmMgfCAxMSArKysrKysrKy0tLQ0KPiArIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+ICsNCj4gK2RpZmYgLS1naXQgYS9zcmMvbGliL2th
ZG01L2thZG1fcnBjX3hkci5jDQo+IGIvc3JjL2xpYi9rYWRtNS9rYWRtX3JwY194ZHIuYw0KPiAr
aW5kZXggMjg5MmQ0MS4uOTRiMWNlOCAxMDA2NDQNCj4gKy0tLSBhL3NyYy9saWIva2FkbTUva2Fk
bV9ycGNfeGRyLmMNCj4gKysrKyBiL3NyYy9saWIva2FkbTUva2FkbV9ycGNfeGRyLmMNCj4gK0BA
IC0zOTAsNiArMzkwLDcgQEAgX3hkcl9rYWRtNV9wcmluY2lwYWxfZW50X3JlYyhYRFIgKnhkcnMs
DQo+IGthZG01X3ByaW5jaXBhbF9lbnRfcmVjICpvYmpwLA0KPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGludCB2KQ0KPiArIHsNCj4gK8Kg
wqDCoMKgwqDCoMKgdW5zaWduZWQgaW50IG47DQo+ICsrwqDCoMKgwqDCoMKgYm9vbF90IHI7DQo+
ICsNCj4gK8KgwqDCoMKgwqDCoMKgaWYgKCF4ZHJfa3JiNV9wcmluY2lwYWwoeGRycywgJm9ianAt
PnByaW5jaXBhbCkpIHsNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiAo
RkFMU0UpOw0KPiArQEAgLTQ0Myw2ICs0NDQsOSBAQCBfeGRyX2thZG01X3ByaW5jaXBhbF9lbnRf
cmVjKFhEUiAqeGRycywNCj4ga2FkbTVfcHJpbmNpcGFsX2VudF9yZWMgKm9ianAsDQo+ICvCoMKg
wqDCoMKgwqDCoGlmICgheGRyX2tyYjVfaW50MTYoeGRycywgJm9ianAtPm5fa2V5X2RhdGEpKSB7
DQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gKEZBTFNFKTsNCj4gK8Kg
wqDCoMKgwqDCoMKgfQ0KPiArK8KgwqDCoMKgwqDCoGlmICh4ZHJzLT54X29wID09IFhEUl9ERUNP
REUgJiYgb2JqcC0+bl9rZXlfZGF0YSA8IDApIHsNCj4gKyvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgcmV0dXJuIChGQUxTRSk7DQo+ICsrwqDCoMKgwqDCoMKgfQ0KPiArwqDCoMKgwqDCoMKg
wqBpZiAoIXhkcl9rcmI1X2ludDE2KHhkcnMsICZvYmpwLT5uX3RsX2RhdGEpKSB7DQo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gKEZBTFNFKTsNCj4gK8KgwqDCoMKgwqDC
oMKgfQ0KPiArQEAgLTQ1MSw5ICs0NTUsMTAgQEAgX3hkcl9rYWRtNV9wcmluY2lwYWxfZW50X3Jl
YyhYRFIgKnhkcnMsDQo+IGthZG01X3ByaW5jaXBhbF9lbnRfcmVjICpvYmpwLA0KPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIEZBTFNFOw0KPiArwqDCoMKgwqDCoMKgwqB9
DQo+ICvCoMKgwqDCoMKgwqDCoG4gPSBvYmpwLT5uX2tleV9kYXRhOw0KPiArLcKgwqDCoMKgwqDC
oGlmICgheGRyX2FycmF5KHhkcnMsIChjYWRkcl90ICopICZvYmpwLT5rZXlfZGF0YSwNCj4gKy3C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZuLCB+MCwgc2l6ZW9mKGty
YjVfa2V5X2RhdGEpLA0KPiArLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgeGRyX2tyYjVfa2V5X2RhdGFfbm9jb250ZW50cykpIHsNCj4gKyvCoMKgwqDCoMKgwqByID0g
eGRyX2FycmF5KHhkcnMsIChjYWRkcl90ICopICZvYmpwLT5rZXlfZGF0YSwgJm4sIG9ianAtDQo+
ID5uX2tleV9kYXRhLA0KPiArK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHNpemVvZihrcmI1X2tleV9kYXRhKSwNCj4geGRyX2tyYjVfa2V5X2RhdGFfbm9jb250ZW50cyk7
DQo+ICsrwqDCoMKgwqDCoMKgb2JqcC0+bl9rZXlfZGF0YSA9IG47DQo+ICsrwqDCoMKgwqDCoMKg
aWYgKCFyKSB7DQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gKEZBTFNF
KTsNCj4gK8KgwqDCoMKgwqDCoMKgfQ0KPiArDQo+ICstLQ0KPiArMi40MC4wDQo+IGRpZmYgLS1n
aXQgYS9tZXRhLW9lL3JlY2lwZXMtY29ubmVjdGl2aXR5L2tyYjUva3JiNV8xLjIwLjEuYmIgYi9t
ZXRhLQ0KPiBvZS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9rcmI1L2tyYjVfMS4yMC4xLmJiDQo+IGlu
ZGV4IDEwZmZmMTFjMi4uZTM1M2I1OGFhIDEwMDY0NA0KPiAtLS0gYS9tZXRhLW9lL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L2tyYjUva3JiNV8xLjIwLjEuYmINCj4gKysrIGIvbWV0YS1vZS9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9rcmI1L2tyYjVfMS4yMC4xLmJiDQo+IEBAIC0yOSw2ICsyOSw3IEBAIFNS
Q19VUkkgPQ0KPiAiaHR0cDovL3dlYi5taXQuZWR1L2tlcmJlcm9zL2Rpc3QvJHtCUE59LyR7U0hS
VF9WRVJ9LyR7QlB9LnRhci5nesKgXA0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZpbGU6Ly9l
dGMvZGVmYXVsdC9rcmI1LWFkbWluLXNlcnZlcsKgXA0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGZpbGU6Ly9rcmI1LWtkYy5zZXJ2aWNlwqBcDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZmls
ZTovL2tyYjUtYWRtaW4tc2VydmVyLnNlcnZpY2XCoFwNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
IGZpbGU6Ly9DVkUtMjAyMy0zNjA1NC5wYXRjaDtzdHJpcGxldmVsPTLCoFwNCj4gwqAiDQo+IMKg
U1JDX1VSSVttZDVzdW1dID0gIjczZjU3ODBlN2I1ODdjY2Q4YjhjZmMxMGM5NjVhNjg2Ig0KPiDC
oFNSQ19VUklbc2hhMjU2c3VtXSA9DQo+ICI3MDRhZWQ0OWIxOWViNWE3MTc4YjM0YjI4NzM2MjBl
YzI5OWRiMDg3NTJkNmE4NTc0Zjk1ZDQxODc5YWI4ODUxIg0KPiANCj4gLT0tPS09LT0tPS09LT0t
PS09LT0tPS0NCj4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMg
Z3JvdXAuDQo+IFZpZXcvUmVwbHkgT25saW5lICgjMTA0NjAwKToNCj4gaHR0cHM6Ly9saXN0cy5v
cGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWRldmVsL21lc3NhZ2UvMTA0NjAwDQo+IE11
dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210LzEwMDk1MTY1
Ni8zNjE2NzAyDQo+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtZGV2ZWwrb3duZXJAbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZw0KPiBVbnN1YnNjcmliZToNCj4gaHR0cHM6Ly9saXN0cy5vcGVuZW1i
ZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWRldmVsL3Vuc3ViwqBbDQo+IGFudWoubWl0dGFsQGlu
dGVsLmNvbV0NCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gDQoNCg==


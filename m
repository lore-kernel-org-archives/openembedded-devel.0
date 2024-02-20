Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE2F6C48BC4
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 08:25:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by mx.groups.io with SMTP id smtpd.web11.9070.1708417510728612461
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Feb 2024 00:25:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=JfAEsqhS;
 spf=pass (domain: intel.com, ip: 198.175.65.11, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708417510; x=1739953510;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=BE5dzlH6d28IpHvZs2pEFT8afv2C2fvunoQhi32Jj84=;
  b=JfAEsqhSFzS1LoeBmhYLGg1xWDwuDW4DsbZwnlE/LSzwh4XnikTDA+NU
   9h58bwKApKaHhu/+9D5Oii6in/1bWVwvhP+WrXU0fo44n8HXcx/pdUIx8
   02Z7KBwvZ7IoBbtt0kDQQgFYKk3h9Myzp42AjRyHiQt9QuVGeNJI2dfh1
   zSDwC4+9tcKUWBq9ZnONwzjqItq2b8eX+a6DGA8o+yA6j3aKWfqGwwdNQ
   j6ZfDoThbtTwPmmMaVT5VCceUbH7bdffr/C3FPOuZmdLz+xv0cBO5/EYO
   Si9AAY2COnJrIIb9fi1APv1ajlpJyMfdLoL07BhnRoyrxf+eeCzYGaDJ3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="13063804"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="13063804"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 00:25:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="27872372"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 20 Feb 2024 00:25:09 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 20 Feb 2024 00:25:08 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 20 Feb 2024 00:25:07 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 20 Feb 2024 00:25:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MwEarEJMg994maGagIuj6lpHZev9ecX7sWrestJSchuwmkxRYhre3G+yQNijpgFzwEGyJuo0g6BiAV0y6Szzsgo3R9NuTTfeGDXmeI/WGbj4XlVbHriG3veBC+1/yUllO8CmSxHGtPMOMXs5jDRbl8j76vKfJNcBJIzMyfo0VnOshHcYvUqtatf9FJxKNGSDvGeFAUY3PI74jhQGjtO+PcROQB7aWsbkfXeMUo5QJJbFMr0fw4r/QvdmarxdIcKXVAx4FkagNi5nSRIos0AflDgY96+3ZMoOiGePaSDKkVr9SvfoLtbmvVFy5NvO78AJ6ESHZal6BMjToVbFRnX3xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BE5dzlH6d28IpHvZs2pEFT8afv2C2fvunoQhi32Jj84=;
 b=j3hXwmeRKBbAPj/HSgVKUUJVuGizTTZmQyGw4lVEOn7cDVEeEH3W2V8J7CjFq5EsLkJTAuKsGwm82CFQMybFupwlWnuqBh9rYkFbHxBdPKHY7czasNUJLFqp4IPsmAX33zY50oIxhK69cGJBV2k7iL47iucd73kdnIY9q452qzNbV0TtSM4+03bWIoT3ndNe8AmbIBMa3LBrs5ozCxN9xvHKtU135Zcxlmp1goOkRcnWwM9h69XZcyIs+xIRs/+IBJEXFLd1TPw1dha7JDZM/1KvOHZUY8oVO6zVax+pidPWnsPISCODUHf+xuOS40zIvvnDQrap5ljuXiNNEaaZlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6430.namprd11.prod.outlook.com (2603:10b6:8:b6::15) by
 PH7PR11MB6545.namprd11.prod.outlook.com (2603:10b6:510:213::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.34; Tue, 20 Feb
 2024 08:25:00 +0000
Received: from DM4PR11MB6430.namprd11.prod.outlook.com
 ([fe80::833:8a41:d2a2:ed8]) by DM4PR11MB6430.namprd11.prod.outlook.com
 ([fe80::833:8a41:d2a2:ed8%4]) with mapi id 15.20.7292.033; Tue, 20 Feb 2024
 08:25:00 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-python][PATCH] python3-pocketsphinx: Upgrade to 5.0.3
Thread-Topic: [oe] [meta-python][PATCH] python3-pocketsphinx: Upgrade to 5.0.3
Thread-Index: AQHaY86aTOoV0xIskE6w6ApklnW6prES5PcA
Date: Tue, 20 Feb 2024 08:25:00 +0000
Message-ID: <3a7ea6dacab9b5922698fc2fa356ea564ab1bdb7.camel@intel.com>
References: <20240220072937.2337129-1-raj.khem@gmail.com>
In-Reply-To: <20240220072937.2337129-1-raj.khem@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.50.3 (3.50.3-1.fc39) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6430:EE_|PH7PR11MB6545:EE_
x-ms-office365-filtering-correlation-id: 7d18578f-99f2-4fe0-1898-08dc31ed6e29
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fnLWMZteOs//xopHxjZRkWt0YAxWbYwtJwUJUvf6RtfgZlskG5pXZQiJJQojOnlciPk7VBXpKvecorl2xQEHgUllDbSCIKrKsUMT6FIuMFN2nRVSo1gk7ptifQyjSLBWpT5231KCkxn+5Yhml9PBgI5fbeFDmcPosS2BkfJfH1nCG75JjFSE1uFYVBYSq+cpQm/9N+1IDpPL0I1Hf+WylbsfvWT7rh/EhQC/w3tk+SRWggwaObFH7zZucXSU+3mZa0k2b9bMuNeKpm3x22dAcJH/B3hd0v9+6Rx2pKSBhjVZj/tTiDvH8qBdAYvZNNl/ayKLnqh/p0BXsHNwY/wvXhLfYbEMbJJSUFGHcPPcSjhaP2ygJSnz0KY5ZHArn/WGfxy+J4lhMc+e4J94Iih6f3nY980oCVlYAqUgNM5/dwpkeRh3XFdsAf1J2tYrjWhAvj8sPWyFzr6P8NqiFf23Vi5vN2H+t/tXtl7Gf8YA0CWo77Pqk4J4nVOZbnN4SWFKwg9v4nGEnbEAh0M6MPEhnPtuzmW9mBKs03rA/K2gp3rXWL3b01rRTcsdAkVXsk8VqhTkNvlShXVVPJxf0FtifDS2sjEr/a7GM/X1I1hdZfU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6430.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZVlkOWZjK0NHU05Ua0VpRFQwNDhJWEl6ZmRNaXlHUHQrM0M1cWMwWU12YlEz?=
 =?utf-8?B?TlhET1dVMW9TZDRHNHBHdVA4RmMzZjNONm9uU1BBWWhRVVY5RUdhRDJJdGk0?=
 =?utf-8?B?eTIwUkFRVTJjWm1xOGIweG90TGZ3aDFKUU9sU1JXSG5wWXJhN3pUMm9OSEVq?=
 =?utf-8?B?M29sbFVmbkVJSVFoZC9mMm50Z2RlMlE5dnBmb2tMeXJqTnhmTWY3QmUrYXdn?=
 =?utf-8?B?ODlJNUFIUitybFUxNTB6dkVzbXdEMzZCQnFTYXIrcjRjalJPNmVCUGcrSjhk?=
 =?utf-8?B?c1lzV0dtd0tnQnlNWlYxaDRtcmhFRGNyNW1ORnZlSW4zVE5TanhsaFNTWC9O?=
 =?utf-8?B?OFoweVo1THFTa2Nlc1lUV1dYSzNxR3N0cjIwWXg1RDNVOWNKUVg0RWgzTVJ2?=
 =?utf-8?B?R3dIYlFNSnNyck5rTFUveFJ6TVVFN0xsWVhmNWtXODJpY1JvZ2hZN0o2R3Z5?=
 =?utf-8?B?M3FIR0JOVmR6QU5ONkM2d3FnWkZkdkJ2T2F4UHVXUDNBTXpmSTdOcnlqZFpu?=
 =?utf-8?B?SGpLVy9SNnc2YzQ0VlR3Q0xXRVl5eS9wbW9QV1NKbUtzRHZXN2FOWHFPc2FL?=
 =?utf-8?B?eStNZ1lvMXo1YjNrcEVWbGU2cXFLcUc5dXdMSkxEL3psTHh6YnBEeVVHaEw4?=
 =?utf-8?B?VncvLyttU1NTMjQ1dE4raXZkanp1NEp5VDFkRDdNZGZMeGdtTHYwWnV2b1pu?=
 =?utf-8?B?Vy9Pbk5lQU9EcXhlN0h3QkNTNTVLUUVLb2UxR3Y5czh5c1NpVGNFcGlhajdx?=
 =?utf-8?B?ZHFKUGVNd0ZtVkJNbUd2enMvT2lzSTlGb0I4NWF0Wk0wOEYzNEhabjB0a3Ev?=
 =?utf-8?B?ajhyS25ESGo2UEFXNnpXVHRoK3FJYW40RE9TcEtxMkJoSERyeEQ1MW93Zi91?=
 =?utf-8?B?VHNBUmM1ZEFDbVZxdkJMdXlQWnNqNjJpRVBwd3grdjdRNzlndm5sbWsxYnRo?=
 =?utf-8?B?SERnL2NVYjMzSUtxSmJ1MkFFRG1BNVMydVU0NXJhV1VTK2FGU3JCRGtOWWU5?=
 =?utf-8?B?RXVPdDYydnBJWHFoUWcvVityNDRSL0VHek1CVU5aSzRhSHpqMElCUW9MZzVJ?=
 =?utf-8?B?SGNYaHgyVnl4VUl1cThxTDBvOWh1R1F4V2VKa29xdnNYT08xc29MbFEwRitR?=
 =?utf-8?B?VDkyNGUvUnBVMmtrU1F5eTZHRFhpTnQ0QnE5TUIwZTlkdEI3Q2JRaXVDL2Vx?=
 =?utf-8?B?NUw5WDJWeTlUWU55dzhmNkp2eDBTSDR1VEJFc0tHc29TcnpTc0NlWjAzem11?=
 =?utf-8?B?ODVRdlRCckZhQ3RUc0xJdkVVdmRSSFhBRVJWQ0l2TDZQZ0oxb1lHYkZjejFp?=
 =?utf-8?B?anhBMmhqQ3BOcDY3cXJwbzZ1cFprY0FXZDkyeVdVQ29ZdHB1S1J5MTVuVjhl?=
 =?utf-8?B?VnRDaStvaXVaUHR6SzlGVTlLVDRNYzZKSEtLODNiNXJUMW03TDRKN1cxMlZN?=
 =?utf-8?B?S1RGOG1aVmJsZzkxQW42YisrbFF6ZjlZMUxnYi9xTWFLYSs3QTl3dDJTK2Z2?=
 =?utf-8?B?VjhHN2poSVNMd3FtRDRrMjVDa01nM0JsMFBSYVJqV0Ira3NycFprZ3ZoS3Uw?=
 =?utf-8?B?YVZrMGI2WWdvYlBIVTMxYW0zUDJFYWxHN25xemowZjB4UDJwRERoTEdBN1BK?=
 =?utf-8?B?ZGhWSnhnOTdRVjVHcnRRSWF4YUpzejFpZUZLUHBGR2VNK2YwWm5WQXpmZ3hL?=
 =?utf-8?B?UTYyK0tsT2RHS0NDTDBCVTlmTVhvYUlkVGxlUlNzalloUDBRZFZVUy9OZjE5?=
 =?utf-8?B?VzQ4a3d5cTh3ZSs0V3JpRFdUT21FL21MNGNYY2svelprYmtXc1J6dXRpaDI4?=
 =?utf-8?B?RWQvVE81dlFrSzZ3TlVHS3JZeFUwT3B6SHEvaUFneEc0OXYwZDJ6MmtTR1Yx?=
 =?utf-8?B?ZHVqVlVSc1NHa2ZBcFV5aWVQZEhYQ1pPdEVNMHdXdHl5amRwTDlwTUFzMnVB?=
 =?utf-8?B?djZoSUczc0VBRHdOTTN0Tk9nRnVBZ05IeWEwalVtTjlmRktMRFZoYU8xdkt2?=
 =?utf-8?B?S2RsbmIzcGwrdTlQeFIzdlUyMit1VUJlejZIUEx3N3VpdENBVHg3TEpEVGti?=
 =?utf-8?B?Tm5qdnAwc1ZCQnd6dHh2ci9BNWJxUHVrTlZ6TTdVVTdPRFZrK2orUUQ1dmNj?=
 =?utf-8?B?VUNoSjJEK0owRzAvZHRod2JzU29HbEpHVm5ON0ZuWGRNcDVHSk9vd0VOZHkw?=
 =?utf-8?B?OTJnZHdGUmVpT21BTVdONnpzSVB2Y3pNTzZOamxOTGJUbjk0dm12ZkVXNXg5?=
 =?utf-8?B?K2dDL0RCYnBWdmRxUWVLZWhzRlJnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5AF1020EF744DF428AC6D586EB5A18DB@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d18578f-99f2-4fe0-1898-08dc31ed6e29
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2024 08:25:00.4845
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vgO5TXlOK/kEmYio0jnwQHNAw0TjdTfTWMf5sdQkrWqUWk2Q5CQ6Rr9UfucW81Un9Iu4owrra1XhuaHG/VABMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6545
X-OriginatorOrg: intel.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 08:25:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108920

SGkgS2hlbQ0KDQpPbiBNb24sIDIwMjQtMDItMTkgYXQgMjM6MjkgLTA4MDAsIEtoZW0gUmFqIHdy
b3RlOg0KPiBMaWNlbnNlLVVwZGF0ZTogTmV3IGxpY2Vuc2VzIGFkZGVkIGZvciBXZWJSVEMganNv
biBwYXJzZXIsIGFuZCBqc29uDQo+IGVzY2FwaW5nDQo+IA0KPiBbMV0NCj4gaHR0cHM6Ly9naXRo
dWIuY29tL2NtdXNwaGlueC9wb2NrZXRzcGhpbngvY29tbWl0LzRjYjU4NDU4OThjN2Q5ZTUzNjg4
YWJhMzcwZWEzYzAwYzBlZjdkYjINCj4gWzJdDQo+IGh0dHBzOi8vZ2l0aHViLmNvbS9jbXVzcGhp
bngvcG9ja2V0c3BoaW54L2NvbW1pdC82YjlhOTIzODMyYTFmZDc3YzUzMDRlYmExOGU2M2Q4YjBl
MmVmMGI4DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29t
Pg0KPiAtLS0NCj4gwqAuLi4xLWN5dGhvbi1Vc2UtY3l0aHlvbjMtaW4tY21ha2UtY2hlY2sucGF0
Y2ggfCAyOQ0KPiArKysrKysrKysrKysrKysrKysrDQo+IMKgLi4uL3B5dGhvbi9weXRob24zLXBv
Y2tldHNwaGlueF8wLjEuMTUuYmLCoMKgwqDCoCB8IDE0IC0tLS0tLS0tLQ0KPiDCoC4uLi9weXRo
b24vcHl0aG9uMy1wb2NrZXRzcGhpbnhfNS4wLjMuYmLCoMKgwqDCoMKgIHwgMjAgKysrKysrKysr
KysrKw0KPiDCoDMgZmlsZXMgY2hhbmdlZCwgNDkgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25z
KC0pDQo+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtDQo+IHBvY2tldHNwaGlueC8wMDAxLWN5dGhvbi1Vc2UtY3l0aHlvbjMt
aW4tY21ha2UtY2hlY2sucGF0Y2gNCj4gwqBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS1weXRob24v
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy0NCj4gcG9ja2V0c3BoaW54XzAuMS4xNS5i
Yg0KPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLQ0KPiBwb2NrZXRzcGhpbnhfNS4wLjMuYmINCj4gDQo+IGRpZmYgLS1naXQg
YS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLQ0KPiBwb2NrZXRz
cGhpbngvMDAwMS1jeXRob24tVXNlLWN5dGh5b24zLWluLWNtYWtlLWNoZWNrLnBhdGNoIGIvbWV0
YS0NCj4gcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcG9ja2V0c3BoaW54
LzAwMDEtY3l0aG9uLVVzZS0NCj4gY3l0aHlvbjMtaW4tY21ha2UtY2hlY2sucGF0Y2gNCj4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMC4uNDBiMjU0NGQ1NQ0KPiAtLS0g
L2Rldi9udWxsDQo+ICsrKyBiL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtcG9ja2V0c3BoaW54LzAwMDEtDQo+IGN5dGhvbi1Vc2UtY3l0aHlvbjMtaW4tY21ha2Ut
Y2hlY2sucGF0Y2gNCj4gQEAgLTAsMCArMSwyOSBAQA0KPiArRnJvbSA1ZTZlYjY0MGY1NGEwZDcx
NmQ2MmFiNGRiOGQ5NmQzYjZmM2FhN2JjIE1vbiBTZXAgMTcgMDA6MDA6MDANCj4gMjAwMQ0KPiAr
RnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4NCj4gK0RhdGU6IE1vbiwgMTkgRmVi
IDIwMjQgMjI6MTE6NDEgLTA4MDANCj4gK1N1YmplY3Q6IFtQQVRDSF0gY3l0aG9uOiBVc2UgY3l0
aHlvbjMgaW4gY21ha2UgY2hlY2sNCj4gKw0KPiArT0UgZG9lcyBub3QgaW5zdGFsbCBjeXRob24g
YW55bW9yZSwgaXQgb25seSBoYXMgY3l0aG9uMw0KPiArdGhlcmVmb3JlIHBvaW50IHRoZSBidWls
ZCBzeXN0ZW0gdG8gZmluZCBjeXRob24zDQo+ICsNCj4gK1Vwc3RyZWFtLVN0YXR1czogSW5hcHBy
b3ByaWF0ZSBbIE9FLVNwZWNpZmljIF0NCj4gKw0KPiArU2lnbmVkLW9mZi1ieTogS2hlbSBSYWog
PHJhai5raGVtQGdtYWlsLmNvbT4NCj4gKy0tLQ0KPiArIGN5dGhvbi9DTWFrZUxpc3RzLnR4dCB8
IDIgKy0NCj4gKyAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkN
Cj4gKw0KPiArZGlmZiAtLWdpdCBhL2N5dGhvbi9DTWFrZUxpc3RzLnR4dCBiL2N5dGhvbi9DTWFr
ZUxpc3RzLnR4dA0KPiAraW5kZXggZGFhNGY3Ni4uOTNkZDAzMCAxMDA2NDQNCj4gKy0tLSBhL2N5
dGhvbi9DTWFrZUxpc3RzLnR4dA0KPiArKysrIGIvY3l0aG9uL0NNYWtlTGlzdHMudHh0DQo+ICtA
QCAtMSw1ICsxLDUgQEANCj4gKyBmaW5kX3BhY2thZ2UoUHl0aG9uIENPTVBPTkVOVFMgSW50ZXJw
cmV0ZXIgRGV2ZWxvcG1lbnQuTW9kdWxlDQo+IFJFUVVJUkVEKQ0KPiArLWZpbmRfcHJvZ3JhbShD
WVRIT04gImN5dGhvbiIpDQo+ICsrZmluZF9wcm9ncmFtKENZVEhPTiAiY3l0aG9uMyIpDQo+ICsg
DQo+ICsgaWYoTk9UIFVTRV9JTlNUQUxMRURfUE9DS0VUU1BISU5YKQ0KPiArwqDCoCBzZXRfcHJv
cGVydHkoVEFSR0VUIHBvY2tldHNwaGlueCBQUk9QRVJUWQ0KPiBQT1NJVElPTl9JTkRFUEVOREVO
VF9DT0RFIG9uKQ0KPiArLS0gDQo+ICsyLjQzLjINCj4gKw0KPiBkaWZmIC0tZ2l0IGEvbWV0YS1w
eXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy0NCj4gcG9ja2V0c3BoaW54XzAu
MS4xNS5iYiBiL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtDQo+
IHBvY2tldHNwaGlueF8wLjEuMTUuYmINCj4gZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0DQo+IGlu
ZGV4IGY3ZmZkOWQyNjguLjAwMDAwMDAwMDANCj4gLS0tIGEvbWV0YS1weXRob24vcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy0NCj4gcG9ja2V0c3BoaW54XzAuMS4xNS5iYg0KPiArKysg
L2Rldi9udWxsDQo+IEBAIC0xLDE0ICswLDAgQEANCj4gLVNVTU1BUlkgPSAiVGhpcyBwYWNrYWdl
IHByb3ZpZGVzIGEgcHl0aG9uIGludGVyZmFjZSB0byBDTVUNCj4gU3BoaW54YmFzZSBhbmQgUG9j
a2V0c3BoaW54IGxpYnJhcmllcyBjcmVhdGVkIHdpdGggU1dJRyBhbmQNCj4gU2V0dXB0b29scy4i
DQo+IC1ERVNDUklQVElPTiA9ICJQeXRob24gaW50ZXJmYWNlIHRvIENNVSBTcGhpbnhiYXNlIGFu
ZCBQb2NrZXRzcGhpbngNCj4gbGlicmFyaWVzIg0KPiAtSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRo
dWIuY29tL2JhbWJvY2hlci9wb2NrZXRzcGhpbngtcHl0aG9uIg0KPiAtU0VDVElPTiA9ICJkZXZl
bC9weXRob24iDQo+IC1MSUNFTlNFID0gIkJTRC0yLUNsYXVzZSINCj4gLUxJQ19GSUxFU19DSEtT
VU0gPQ0KPiAiZmlsZTovL0xJQ0VOU0U7bWQ1PTgyNmViZGE3ODdlYjQ4ZTc4YWVjMjYyNGY5ZmFi
YTcyIg0KPiAtDQo+IC1TUkNfVVJJW21kNXN1bV0gPSAiOTRkMDA4ZWViZWExNmFjYjYwYTlmZmU2
MTQ1NzVkZWUiDQo+IC1TUkNfVVJJW3NoYTI1NnN1bV0gPQ0KPiAiMzRkMjkwNzQ1YzdkYmU2ZmEy
Y2FjOTgxNWI1YzE5ZDEwZjM5M2U1MjhlY2Q3MGU3NzljMjFlYmM0NDhmOWI2MyINCj4gLQ0KPiAt
aW5oZXJpdCBweXBpIHNldHVwdG9vbHMzIGZlYXR1cmVzX2NoZWNrDQo+IC0NCj4gLURFUEVORFMg
Kz0gInN3aWctbmF0aXZlIHB1bHNlYXVkaW8iDQo+IC1SRVFVSVJFRF9ESVNUUk9fRkVBVFVSRVMg
Kz0gInB1bHNlYXVkaW8iDQo+IGRpZmYgLS1naXQgYS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLQ0KPiBwb2NrZXRzcGhpbnhfNS4wLjMuYmIgYi9tZXRhLXB5dGhv
bi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLQ0KPiBwb2NrZXRzcGhpbnhfNS4wLjMu
YmINCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMC4uZmFkOGY1YmE0
Mg0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtDQo+IHBvY2tldHNwaGlueF81LjAuMy5iYg0KPiBAQCAtMCwwICsxLDIw
IEBADQo+ICtTVU1NQVJZID0gIlRoaXMgcGFja2FnZSBwcm92aWRlcyBhIHB5dGhvbiBpbnRlcmZh
Y2UgdG8gQ01VDQo+IFNwaGlueGJhc2UgYW5kIFBvY2tldHNwaGlueCBsaWJyYXJpZXMgY3JlYXRl
ZCB3aXRoIFNXSUcgYW5kDQo+IFNldHVwdG9vbHMuIg0KPiArREVTQ1JJUFRJT04gPSAiUHl0aG9u
IGludGVyZmFjZSB0byBDTVUgU3BoaW54YmFzZSBhbmQgUG9ja2V0c3BoaW54DQo+IGxpYnJhcmll
cyINCj4gK0hPTUVQQUdFID0gImh0dHBzOi8vZ2l0aHViLmNvbS9iYW1ib2NoZXIvcG9ja2V0c3Bo
aW54LXB5dGhvbiINCg0KVGhhbmsgeW91IGZvciBoZWxwaW5nIHdpdGggdGhpcy4gSSB3YXMgd29y
a2luZyBvbiB0aGlzIHVwZ3JhZGUgYXMgd2VsbA0KYnV0IHlvdXJzIHNlZW1zIGJldHRlciBleGNl
cHQgSSB0aGluayB0aGlzIEhPTUVQQUdFIGFuZCBERVNDUklQVElPTg0Kc2hvdWxkIGFsc28gY2hh
bmdlLiBQZXJoYXBzOg0KDQpTVU1NQVJZID0gIlB5dGhvbiBpbnRlcmZhY2UgdG8gUG9ja2V0c3Bo
aW54IGxpYnJhcmllcy4iDQpERVNDUklQVElPTiA9ICJQeXRob25zcGhpbnggaXMgYW4gT3BlbiBz
b3VyY2UgbGFyZ2Ugdm9jYWJ1bGFyeSwNCnNwZWFrZXItaW5kZXBlbmRlbnQgY29udGludW91cyBz
cGVlY2ggcmVjb2duaXRpb24gZW5naW5lcy4iDQpIT01FUEFHRSA9ICJodHRwczovL2dpdGh1Yi5j
b20vY211c3BoaW54L3BvY2tldHNwaGlueCINCg0KDQo+ICtTRUNUSU9OID0gImRldmVsL3B5dGhv
biINCj4gK0xJQ0VOU0UgPSAiQlNELTItQ2xhdXNlIg0KDQpTaG91bGQgdGhpcyBiZSBCU0QtMi1D
bGF1c2UgfCBNSVQgc2luY2Ugb25lIG9mIHRoZSBsaW5rcyBpbiBjb21taXQNCm1lc3NhZ2UgcG9p
bnRzIHRvIGEgTUlUIGxpY2Vuc2U/DQoNCj4gK0xJQ19GSUxFU19DSEtTVU0gPQ0KPiAiZmlsZTov
L0xJQ0VOU0U7bWQ1PWM0ZDcyMGNkYzljNjk1MzA5MWY2NWU4YjAxNTI0YmI0Ig0KPiArDQo+ICtT
UkNfVVJJICs9ICJmaWxlOi8vMDAwMS1jeXRob24tVXNlLWN5dGh5b24zLWluLWNtYWtlLWNoZWNr
LnBhdGNoIg0KPiArU1JDX1VSSVtzaGEyNTZzdW1dID0NCj4gIjI3ZjRkZTBjYTJkMmJjZTM5MWNl
ODdlYWFiODRmZTZmMGJjMDU5YjMwNmZkMTcwMmQ1ZmU2NTQ5YjY2ZTE1ODYiDQo+ICsNCj4gK2lu
aGVyaXQgY21ha2UgcGtnY29uZmlnIHB5cGkgcHl0aG9uM25hdGl2ZQ0KPiArDQo+ICtERVBFTkRT
ICs9ICJzd2lnLW5hdGl2ZSBweXRob24zLWN5dGhvbi1uYXRpdmUgcHl0aG9uMy1zY2lraXQtYnVp
bGQtDQo+IG5hdGl2ZSBnc3RyZWFtZXIxLjAgZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZSINCj4g
Kw0KPiArRVhUUkFfT0VDTUFLRSArPSAiLURCVUlMRF9HU1RSRUFNRVI9T04iDQo+ICsNCj4gK1BB
Q0tBR0VTICs9ICIke1BOfS1tb2RlbHMgJHtNTFBSRUZJWH1nc3RyZWFtZXIxLjAtcG9ja2V0c3Bo
aW54Ig0KPiArDQo+ICtGSUxFUzoke01MUFJFRklYfWdzdHJlYW1lcjEuMC1wb2NrZXRzcGhpbngg
PSAiJHtsaWJkaXJ9L2dzdHJlYW1lci0NCj4gMS4wLyINCj4gK0ZJTEVTOiR7UE59LW1vZGVscyA9
ICIke2RhdGFkaXJ9L3BvY2tldHNwaGlueC9tb2RlbCINCj4gDQo+IC09LT0tPS09LT0tPS09LT0t
PS09LT0tDQo+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdy
b3VwLg0KPiBWaWV3L1JlcGx5IE9ubGluZSAoIzEwODkxOCk6DQo+IGh0dHBzOi8vbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1kZXZlbC9tZXNzYWdlLzEwODkxOA0KPiBNdXRl
IFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC8xMDQ0NjM2Nzkv
MzYxNjcwMg0KPiBHcm91cCBPd25lcjogb3BlbmVtYmVkZGVkLWRldmVsK293bmVyQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcNCj4gVW5zdWJzY3JpYmU6DQo+IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1kZXZlbC91bnN1YsKgWw0KPiBhbnVqLm1pdHRhbEBpbnRl
bC5jb21dDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IA0KDQo=


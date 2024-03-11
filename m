Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F91EC54791
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 02:43:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by mx.groups.io with SMTP id smtpd.web10.52907.1710125009385791360
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Mar 2024 19:43:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=mKn2KLuY;
 spf=pass (domain: intel.com, ip: 198.175.65.15, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710125009; x=1741661009;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=NalytI0csPFgPvUlOH2bsp83+8tHMQ70z2r/Gk4jfdU=;
  b=mKn2KLuYqmq3tk4o/58Ziz9Og7eLUb6w9SVGK6vIXKmokVIzc/V20py9
   35oQiaLq5dGN+zCrVZLzSxkLs3CijGVBjgDMePbWrY/yKFXAlnPf5bke0
   uvEBL24UCEu2TZP+HmVrbf806MuQSZLmj3/KKboNxZNiogBWmVTlx2JPA
   JTBF9UlaZKr5nT3b8ELuVAyM2l3OGurXr3E5I+5EG/BLlBo20jAAGC/1+
   I16tcWSjsYy3G5MTMmS0xG00I2d8zmrEAS1Gd22JFuYcGJ6pwxEcU4Xi3
   vnjbAW63BrGVJBqQ5OIBg+S85nmgpjJJLTVDXPmGDrtCtzBor8QiCb8+C
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="8591393"
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="8591393"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2024 19:43:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="11110775"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Mar 2024 19:43:28 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 10 Mar 2024 19:43:27 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 10 Mar 2024 19:43:27 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 10 Mar 2024 19:43:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zy95iDEHtagybxRT2CM1fxT/95d3/GTpxjhDYz/uz3jzXuJmL7VbqlX4qYFIGFkVK7L05sStA3YPmTb8ke3nqhLM8mw4cFRMrhC6cY1QmT/FPcvyHKzHSJnma15l+GBF21mB5oN17jpwPiQPE1XyxGoFJ8yV876Z1Gmf7iZIw5ryfYrgll35kSbmSkcqiHrFhEv9QKLRRnnpDYfJ2x/Xwc9Qb/KSM9QaNSVEcQjy2ZGcp7JJ816I2SgvsFr5p3Bz6l5n1X0jcDfvWHoipwUfbJJrKxIgrXENkPnzk5xqbNPUKIj1wrKKGnuicmQ5hJddH6Pc+Doetu2Bmxrac1J2Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NalytI0csPFgPvUlOH2bsp83+8tHMQ70z2r/Gk4jfdU=;
 b=W6CqEy7uCAVubL7yQFg77ITaqrSXYb75cfttAvJXF7pQyHY4UlemxqlZ97yJxSyCYVLGlr56oEvQKJzPjuJeoUgpGxQgo87Mx+gP3zAT0tCAaltbM3j2OdTGWWgmYs8DiMKfoBXCvrNQFuxYqRPlEkPRcu2pI5ukgnqJwWIp7zM07OxZBEcFxiHSDQPfQY43AItoWBFUS1ViYvm1c43N4Tleg2cfb7a9kpL0VS15Ohzvt7Pwfqk/p3mlVhhhoAEsiMs5J+d1qU9Jc0Czb8rI/ViFXuEcAJAgfKsI49BiKSxHBxaQOLlJ4GsZ5+ogJBNGIPW1jycU/QH1nsUNnXgBbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6430.namprd11.prod.outlook.com (2603:10b6:8:b6::15) by
 MW4PR11MB6785.namprd11.prod.outlook.com (2603:10b6:303:20c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.16; Mon, 11 Mar
 2024 02:43:25 +0000
Received: from DM4PR11MB6430.namprd11.prod.outlook.com
 ([fe80::833:8a41:d2a2:ed8]) by DM4PR11MB6430.namprd11.prod.outlook.com
 ([fe80::833:8a41:d2a2:ed8%4]) with mapi id 15.20.7386.014; Mon, 11 Mar 2024
 02:43:25 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "asharma@mvista.com"
	<asharma@mvista.com>
Subject: Re: [oe][meta-oe][dunfell][PATCH] c-ares: Backport fix for
 CVE-2024-25629
Thread-Topic: [oe][meta-oe][dunfell][PATCH] c-ares: Backport fix for
 CVE-2024-25629
Thread-Index: AQHacxQzhOQiVXMLP0yBqDL4z+I/XrEx1Z0A
Date: Mon, 11 Mar 2024 02:43:25 +0000
Message-ID: <223ddbd4ad06b8747edad948be38dd3bcb8ac430.camel@intel.com>
References: <20240310175327.3201-1-asharma@mvista.com>
In-Reply-To: <20240310175327.3201-1-asharma@mvista.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.50.4 (3.50.4-1.fc39) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6430:EE_|MW4PR11MB6785:EE_
x-ms-office365-filtering-correlation-id: 5eeb2649-9e21-4094-0ee0-08dc41750648
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Pve4B+fwhGBIez2r5Zhr5l6HaGLu04raGQ+hIa0x2rHIAmEcL8UraQUUPwoPKPX6/NzHIFCViJKE66S7af4jyKw1HjyLiL2WTWOKf/cA8IeQ3Ld6rdx4qDzlOsDhgVVxWBnW9m18uubujrRRKsMDbPD7P0YpLAaWBhS9h9gbmPItdsDnwmk19PImAor7kP8dnBelfjeQtjpcAQA4hlKVf7G/xiE0ltRy7l/WLjDagGksRWaXddSc94Vf+eX9nOQcf2ptkfk+cjr48ovY3xvKgVox1ExkOeUHlewexmmzPB+TErCF6/AvEA1Gh8dehhtZ4NCAewZtdIHJjjZSYr8OgIPcjytJJaH0ijyyIZgbwmesFR8gPRKOq25aDA1BhxgRnMWVq+kN4YL/lfVqjsR1mdxZH9xOrb8VXK5Bsg0/tRhWnTdxF+VGOHN4m+rXxLgNuhMySjvlhB7mypscR3E8VCZBTs0T0KBF9OU4NXrr0rWqoy+N9kzqN0Q2mJMVHM3XV6FxGwza4+hBQ2owminXG2l8LuvqirTdY2s2/Er6d21Fi64D5rsCmhc/xhpErpYdhS2WrqHizrx/H+WjpxoZok/Y1IXA2k83aGIfOM3dVoPKkRYGLYO2sTS407DapWaw8eBAfz365WsFPl9obSXAV5HQjb4XZNhp0Uj9ZHfyRe2EXfEDnzPR71Kpu1+CSa4j
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6430.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R1dyemNiNjNla3p0WUZxaUhiMms3empEUzc0bXpiK3BaaGpYSG0zV29hcnZ1?=
 =?utf-8?B?eWhpbDRjM2lFS2ZsdTFKc3Yvc2NVNFArOVpFRitUSUl5MFZMS1F2cWlvRUtE?=
 =?utf-8?B?djR6dStlUTdReXJBQmRJTVhWTW1GdkN5TXZtZUFJWEltQXpRTlVZRmZlZ3JM?=
 =?utf-8?B?Rlc4ZUpMSEFDcEdtUnpNK2ZKc2NvQ1JiOCtmeUVGN2doZHJtVHlPYlA2eEVE?=
 =?utf-8?B?RzZVcy9CV2REQ2hORTlwNENpL1l6YXY5S1diRXRIQlFKWHN5MGZZRXB6Z2Vh?=
 =?utf-8?B?V3dUZnhPWFh0MUpjYkkvMmljNUxwa213Um9qN29GMThOR0trSDFGNEhnVlI3?=
 =?utf-8?B?bUEyR0VtY0swZDZoQ2ZGeHRzMWxSQzJ3M0UvbFNqS3drM0d1K24rUU1IMlVG?=
 =?utf-8?B?MktMSnJPYlZ6OU9ycytxYmpqNnkveGR0UVk2d0tnOUlQb3k1UWJwTXBnNklQ?=
 =?utf-8?B?SFFldGRVQ0p0blNVQ3E0NmdHTlBtd3VSMnVrWU01Wjg0MDZpRS8xY0VYYVBR?=
 =?utf-8?B?Z3Q1Z05SMGVEVU53M0J3VTBTRTlVZHhpSEVvRlNYVGcrVHJwVG9rdUxvVEdL?=
 =?utf-8?B?TGk4TzlDOTRTbmd3U1BWN09scXF6bWpGOWkvYjNMVlNnOCtwRHd6Qkc1U3Jo?=
 =?utf-8?B?Tkl4Ni9JcVN4TlhhU3doZnl3VXRnek9wNkJWNUFBdVk2K0VGeTRHYUs3RmlX?=
 =?utf-8?B?YXVaaTNhV0dOVDFkWXlGS09XMXU2bUpOTVp3K0FhQ2hEclY3SStDUmRuaTBx?=
 =?utf-8?B?b2tLRk1zRWFsSmhJd1NxZlNXYXNOWTd2NVRrVUpFdFJjM2JMSXUxU2VqRlJ6?=
 =?utf-8?B?MGVKTmFreVRPZjJOaVJJSGtqSzJuNUpsL2ZhUTN3Zk9SSjVTSXNJcUlqRjJX?=
 =?utf-8?B?c1k3UTF3M1R0T3ZKdkJkSnVvUnpqNlRDeE9WS0RZSUplQ2lxUEVUKzNRcjVp?=
 =?utf-8?B?Z21DZS9sa0lRZ1dnVU0rMkpVTWZPR0hUbkxKMmg4aHNzdmkyVitZS0NDaGdO?=
 =?utf-8?B?S3AvUGQ5a0VEd0lQZzdjT0VYRVlEL0dLZDU4anphQW9zR09qZEl6dnJtb28z?=
 =?utf-8?B?YU0xbGJ4enZKQ2xyWmszb0oycG8rY3k0NFgzU282R0hHcU5Wc1ZIQ3RwUjJL?=
 =?utf-8?B?bDA3c0U4Zlo4dVRKT0kySkp5REFoK1F4WktZVXdKZFVaMGhQQVlQS3Y4RDZz?=
 =?utf-8?B?VXo2TWFsNzBzZnpmS1d6NDJJOHNzWERXUVp1cytGTjNZTXRGTHcxSGd5Q05S?=
 =?utf-8?B?NW9rTHlOZENXMHJTamU2R1UvZW9IVUlRQWhXajNkQjBhbzZEczZ1d3crVzh3?=
 =?utf-8?B?bmRDdE96dGhCZWtqY0VvdkRyZFlPUVpxblpuQ3FTVnV1MmJhMjRSclkwczdo?=
 =?utf-8?B?SzVZQUthNWpqdGV2aGhVZG5xM2RyeFUwRDl1M0xGRkJqMU1GN3JyMXJsekh0?=
 =?utf-8?B?TW9Sc0JzNkhsNm5zZFhWTFlremx6Y2hTTDhtdzZtRjgwdVJJMjRINGUvNlh3?=
 =?utf-8?B?QThacTFmRzBhNXZLTWp5K3RCVTVuWUx1U0xXVUtueGNJR0NZN2s0Y3VER3Jx?=
 =?utf-8?B?TWs2MU90a0RnUDFwdUppVlJ1NFJGbXVxcG5ZdExaeEZuRXZveVE5eHp2cThK?=
 =?utf-8?B?THIzOEdYYTQ4RFF4emdXMFVrSDQxbGo0U01IMEVVUkxkVTRMMEsxYjZvMlJw?=
 =?utf-8?B?aGpGSUtvVlJFWllVdTVNUDF2bm1jRDNaUytadTJuMmR0OXRyZURHWXd6ZUVx?=
 =?utf-8?B?SkR6VnRVK1dhT1VpUlRTVmNYQ1BNWko0R2p6blk2Z1hpMlM3bit1bnVPOEZp?=
 =?utf-8?B?cHIrQ3k5VGtDOG03SUdoaHU5Rnk5bG5FQ0Q5c1NqOUpFT1pHZS9tN1pJYXRB?=
 =?utf-8?B?OGtSTjc3VHpoMEI2ZWxaRlJ2NXVHcnJaYnQrM0F6aU9oQU5TSXdLNE94MnBK?=
 =?utf-8?B?ZEp6YTJ0cUxvZnAvZ0Z4TGY0RDJHaWpucHBINmtlMEI0WFIrYytCN2kwWWpR?=
 =?utf-8?B?YmFXekFRNzlidURQQnhzdTNoMnY4bkRBd3JwMW5qK1VCeFFIeDBSQS9LWm11?=
 =?utf-8?B?N0lCQndDK0NkNWhmazJKVE1hM3Uxcng5TVpJM0d5MG9QTDZXRUxKcmhUWFVQ?=
 =?utf-8?B?V25LNWVSS0xMdUhPeUhHaWNyTUc1QkxpeFZmY0R5bUhPWGI5ZEVDOTJ2Q05V?=
 =?utf-8?B?a2xTSEZPeEo0cGREQ1NjL2lJYVQyQmRyY1lmQjMvZ2NmUTBmQ3hyK0NOQ0xZ?=
 =?utf-8?B?S0MwNi9MMFM5SG5HRnpuSGhHemJ3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <19A00646CDB7DF40B8BA6C18685430AB@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eeb2649-9e21-4094-0ee0-08dc41750648
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2024 02:43:25.2022
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UHgSh2nO1yXAgC6VderF6epdcbteGQZn5o3U8S9xDstr4LYPlhOiN/ySEosbrNMFTNP7UbV+24ASFkengaf14Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6785
X-OriginatorOrg: intel.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Mar 2024 02:43:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109263

T24gU3VuLCAyMDI0LTAzLTEwIGF0IDEwOjU1IC0wNzAwLCBBc2hpc2ggU2hhcm1hIHZpYQ0KbGlz
dHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4gVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBm
cm9tIGRlYmlhbg0KPiBbaHR0cHM6Ly9naXQubGF1bmNocGFkLm5ldC91YnVudHUvK3NvdXJjZS9j
LWFyZXMvY29tbWl0Lz9oPWFwcGxpZWQvdWINCj4gdW50dS9qYW1teS1kZXZlbCZpZD0zNzAxODE0
YWQ5Zjg1NzBlMDE0MmY0YjJiZjc5YTMyNDcyZmU4OWQ2XQ0KDQpUaGlzIHNob3VsZCBiZSBCYWNr
cG9ydCBmcm9tDQpodHRwczovL2dpdGh1Yi5jb20vYy1hcmVzL2MtYXJlcy9jb21taXQvYTgwNGMw
NGRkYzgyNDVmYzhhZGYwZTkyMzY4NzA5NjM5MTI1ZTE4Mw0KDQpJcyB0aGVyZSBhbnkgZGlmZmVy
ZW5jZSBiZXR3ZWVuIHRoZSB0d28gcGF0Y2hlcz8NCg0KU2FtZSBmb3IgdGhlIGNvbW1pdCBtZXNz
YWdlIGluIHBhdGNoLg0KDQo+IENWRTogQ1ZFLTIwMjQtMjU2MjkNCj4gU2lnbmVkLW9mZi1ieTog
QXNoaXNoIFNoYXJtYSA8YXNoYXJtYUBtdmlzdGEuY29tPg0KPiAtLS0NCj4gwqAuLi4vYy1hcmVz
L2MtYXJlcy9DVkUtMjAyNC0yNTYyOS5wYXRjaMKgwqDCoMKgwqDCoMKgIHwgMzENCj4gKysrKysr
KysrKysrKysrKysrKw0KPiDCoC4uLi9yZWNpcGVzLXN1cHBvcnQvYy1hcmVzL2MtYXJlc18xLjE4
LjEuYmLCoMKgIHzCoCAxICsNCj4gwqAyIGZpbGVzIGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKykN
Cj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvYy1hcmVzL2Mt
YXJlcy9DVkUtMjAyNC0NCj4gMjU2MjkucGF0Y2gNCj4gDQo+IGRpZmYgLS1naXQgYS9tZXRhLW9l
L3JlY2lwZXMtc3VwcG9ydC9jLWFyZXMvYy1hcmVzL0NWRS0yMDI0LQ0KPiAyNTYyOS5wYXRjaCBi
L21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L2MtYXJlcy9jLWFyZXMvQ1ZFLTIwMjQtDQo+IDI1NjI5
LnBhdGNoDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMC4uNzZmOGI3
YzNiDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvYy1h
cmVzL2MtYXJlcy9DVkUtMjAyNC0yNTYyOS5wYXRjaA0KPiBAQCAtMCwwICsxLDMxIEBADQo+ICtG
cm9tIGE4MDRjMDRkZGM4MjQ1ZmM4YWRmMGU5MjM2ODcwOTYzOTEyNWUxODMgTW9uIFNlcCAxNyAw
MDowMDowMA0KPiAyMDAxDQo+ICtGcm9tOiBCcmFkIEhvdXNlIDxicmFkQGJyYWQtaG91c2UuY29t
Pg0KPiArRGF0ZTogVGh1LCAyMiBGZWIgMjAyNCAxNjoyMzozMyAtMDUwMA0KPiArU3ViamVjdDog
W1BBVENIXSBNZXJnZSBwdWxsIHJlcXVlc3QgZnJvbSBHSFNBLW1nMjYtdjZxaC14NDhxDQo+ICsN
Cj4gK1Vwc3RyZWFtLVN0YXR1czogQmFja3BvcnQgZnJvbSBkZWJpYW4NCj4gW2h0dHBzOi8vZ2l0
LmxhdW5jaHBhZC5uZXQvdWJ1bnR1Lytzb3VyY2UvYy1hcmVzL2NvbW1pdC8/aD1hcHBsaWVkL3Vi
DQo+IHVudHUvamFtbXktZGV2ZWwmaWQ9MzcwMTgxNGFkOWY4NTcwZTAxNDJmNGIyYmY3OWEzMjQ3
MmZlODlkNl0NCj4gK0NWRTogQ1ZFLTIwMjQtMjU2MjkNCj4gK1NpZ25lZC1vZmYtYnk6IEFzaGlz
aCBTaGFybWEgPGFzaGFybWFAbXZpc3RhLmNvbT4NCj4gKw0KPiArIHNyYy9saWIvYXJlc19fcmVh
ZF9saW5lLmMgfCA4ICsrKysrKysrDQo+ICsgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygr
KQ0KPiArDQo+ICtJbmRleDogYy1hcmVzLTEuMTguMS9zcmMvbGliL2FyZXNfX3JlYWRfbGluZS5j
DQo+ICs9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09DQo+ICstLS0gYy1hcmVzLTEuMTguMS5vcmlnL3NyYy9saWIvYXJlc19f
cmVhZF9saW5lLmMNCj4gKysrKyBjLWFyZXMtMS4xOC4xL3NyYy9saWIvYXJlc19fcmVhZF9saW5l
LmMNCj4gK0BAIC00OSw2ICs0OSwxNCBAQCBpbnQgYXJlc19fcmVhZF9saW5lKEZJTEUgKmZwLCBj
aGFyICoqYnVmDQo+ICvCoMKgwqDCoMKgwqAgaWYgKCFmZ2V0cygqYnVmICsgb2Zmc2V0LCBieXRl
c3RvcmVhZCwgZnApKQ0KPiArwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gKG9mZnNldCAhPSAwKSA/
IDAgOiAoZmVycm9yKGZwKSkgPyBBUkVTX0VGSUxFIDoNCj4gQVJFU19FT0Y7DQo+ICvCoMKgwqDC
oMKgwqAgbGVuID0gb2Zmc2V0ICsgc3RybGVuKCpidWYgKyBvZmZzZXQpOw0KPiArKw0KPiArK8Kg
wqDCoMKgwqAgLyogUHJvYmFibHkgbWVhbnMgdGhlcmUgd2FzIGFuIGVtYmVkZGVkIE5VTEwgYXMg
dGhlIGZpcnN0DQo+IGNoYXJhY3RlciBpbg0KPiArK8KgwqDCoMKgwqAgKiB0aGUgbGluZSwgdGhy
b3cgYXdheSBsaW5lICovDQo+ICsrwqDCoMKgwqDCoCBpZiAobGVuID09IDApIHsNCj4gKyvCoMKg
wqDCoMKgwqDCoCBvZmZzZXQgPSAwOw0KPiArK8KgwqDCoMKgwqDCoMKgIGNvbnRpbnVlOw0KPiAr
K8KgwqDCoMKgwqAgfQ0KPiArKw0KPiArwqDCoMKgwqDCoMKgIGlmICgoKmJ1ZilbbGVuIC0gMV0g
PT0gJ1xuJykNCj4gK8KgwqDCoMKgwqDCoMKgwqAgew0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqAg
KCpidWYpW2xlbiAtIDFdID0gMDsNCj4gZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1zdXBw
b3J0L2MtYXJlcy9jLWFyZXNfMS4xOC4xLmJiIGIvbWV0YS0NCj4gb2UvcmVjaXBlcy1zdXBwb3J0
L2MtYXJlcy9jLWFyZXNfMS4xOC4xLmJiDQo+IGluZGV4IDJhYTc4OTc2MC4uYjU5MzZlMWFkIDEw
MDY0NA0KPiAtLS0gYS9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9jLWFyZXMvYy1hcmVzXzEuMTgu
MS5iYg0KPiArKysgYi9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9jLWFyZXMvYy1hcmVzXzEuMTgu
MS5iYg0KPiBAQCAtMTAsNiArMTAsNyBAQCBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vYy1h
cmVzL2MtDQo+IGFyZXMuZ2l0O2JyYW5jaD1tYWluO3Byb3RvY29sPWh0dHBzIFwNCj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBmaWxlOi8vQ1ZFLTIwMjMtMzExMzAucGF0Y2jCoFwNCj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBmaWxlOi8vQ1ZFLTIwMjMtMzExNDcucGF0Y2jCoFwNCj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBmaWxlOi8vQ1ZFLTIwMjMtMzIwNjcucGF0Y2jCoFwNCj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgIGZpbGU6Ly9DVkUtMjAyNC0yNTYyOS5wYXRjaMKgXA0KPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAiDQo+IMKgU1JDUkVWID0gIjJhYTA4NmY4MjJhYWQ1MDE3YTZmMjA2MWVm
NjU2ZjIzN2E2MmQwZWQiDQo+IMKgDQo+IA0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiBM
aW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gVmll
dy9SZXBseSBPbmxpbmUgKCMxMDkyNTkpOg0KPiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5v
cmcvZy9vcGVuZW1iZWRkZWQtZGV2ZWwvbWVzc2FnZS8xMDkyNTkNCj4gTXV0ZSBUaGlzIFRvcGlj
OiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQvMTA0ODQ4MjE2LzM2MTY3MDINCj4g
R3JvdXAgT3duZXI6IG9wZW5lbWJlZGRlZC1kZXZlbCtvd25lckBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnDQo+IFVuc3Vic2NyaWJlOg0KPiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9v
cGVuZW1iZWRkZWQtZGV2ZWwvdW5zdWLCoFsNCj4gYW51ai5taXR0YWxAaW50ZWwuY29tXQ0KPiAt
PS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiANCg0K


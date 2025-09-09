Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB4CDCA1016
	for <webhook@archiver.kernel.org>; Tue,  9 Sep 2025 02:56:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by mx.groups.io with SMTP id smtpd.web11.3413.1757386555219035432
 for <Openembedded-devel@lists.openembedded.org>;
 Mon, 08 Sep 2025 19:55:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=gsvMnfPb;
 spf=pass (domain: intel.com, ip: 198.175.65.11, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757386555; x=1788922555;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=iPou0XvewiPqakGXcFnQ6PxGpBFcOH+2l8/Unm2uGzQ=;
  b=gsvMnfPbuBNFF0mBPPeXBReJnD6jTQyXqO69QknYKhclcqqFsX7o3v3k
   rRXSnW0+svrAkMk/3xpi4DUr5o1Wr0Bd4oRfBctqaPTQdSq9bNqBvDTmO
   Y67YS8/CxiaVTn1EmdUv7SXexK9v2WMcguTTEMVSLc8QnasgirNm5/vTE
   tP2JS5iVXGAOEjSBOh99TqS09XM2CMkIihW7Uf4Z+V9x02MU6ygB8zjv7
   cbF63m2+ukqhRnEoFwU69sU9oHazffpSMKk70oRuIYVaiu0uJPleGEQQL
   0ElZA57Os7u/aXn3ZuYGZRoKtSY/qRpu1uObNq804yvJcfwEgVx2FbtlL
   Q==;
X-CSE-ConnectionGUID: dWTO1XNcR1mu3pCHRihrQg==
X-CSE-MsgGUID: iSj7F99iSpef/fDXlNkPoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="69914276"
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; 
   d="scan'208";a="69914276"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 19:55:55 -0700
X-CSE-ConnectionGUID: iZDGCrDKTHeLIzcwuYsq8Q==
X-CSE-MsgGUID: 8td8heUzRxidMg/g2Y8mQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; 
   d="scan'208";a="196608016"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 19:55:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 8 Sep 2025 19:55:53 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 8 Sep 2025 19:55:53 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.44)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 8 Sep 2025 19:55:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fuQ6QPuoTaOQbYa5FuHdypWeYDuE0oChnhbVCBhtUAOCWCqrtZeTAIRc7djSdh+1O7jZ4KNogx5lrs6vhL78CCmrSahhMOSbNK9+HVAAzp/ccEhdcR5eCZqx56n0aoDGUmcX0HUgYPE4LurCi2VlI4uvcIUYE3WSAqU2hiBLLL/K1zID1k/XpMcnFP3eYwq1JN9r5ayHiSrERaXwq2KhWHn3EfLlz4tpgFkaywam47H7R44pPki1VWvCDVleK4owheu6OS/58F2RI/Jz2ko0Ik9LbzPX98VUv2Zo5sebd/AgIsx61J/suddi1uuffc6HvhBZ9MhUFY513/epfp5FUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iPou0XvewiPqakGXcFnQ6PxGpBFcOH+2l8/Unm2uGzQ=;
 b=EoRIErysCYzfn2bvqkh/nTXOlrzgoB/1lBW800mfLfLSsXb52PCuqsTSNEtlGgyBNzvOlpgT28UdcSJ3SzXl1l4yJe/ekq/5WFEuqmRvQC4eM+vBscY1sW+6K7hg4W0cjmvou56ojuqXyZP7/sI5nxeozOCW2n8KpJJEhsG6/9AFntO8QZw6CHy+AZRCQypO3AGcHhnje0jDoZLN+nO7Bg7c2dL7ZLQaE+spok7rczZrGOchdpydpLlvO4EzyTDN/uMLmPSX01la4m9nbx7QKRfiJtAeiUb1v2wXC7eF1oPrANhI7dbLgm4hpJyZR7jlL27jUYWRGBjwP0wVBx81Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by SA0PR11MB7157.namprd11.prod.outlook.com (2603:10b6:806:24b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 02:55:51 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%7]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 02:55:51 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>,
	"Openembedded-devel@lists.openembedded.org"
	<Openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] Stable branch maintainership
Thread-Topic: [oe] Stable branch maintainership
Thread-Index: AQHcIQpOtSwn8THhFUCyaE79VkuMQbSKKGoA
Date: Tue, 9 Sep 2025 02:55:51 +0000
Message-ID: <b83737ff4babe05615dc2dc7a63321328add6fc4.camel@intel.com>
References: <CAMKF1sqhzO979KgHE9BEfbw5xe7NH0GKZji9VHOAy6pn+E9NDQ@mail.gmail.com>
In-Reply-To: <CAMKF1sqhzO979KgHE9BEfbw5xe7NH0GKZji9VHOAy6pn+E9NDQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|SA0PR11MB7157:EE_
x-ms-office365-filtering-correlation-id: c58832ce-701f-4688-8151-08ddef4c62f7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?SnJUY1U2UnB2SkdFRVc3eVkyMVlaQmp5Ym1JWWVMa0ZtUFR4NnZNM1F6UTFm?=
 =?utf-8?B?bkxVMC9hOGlPQ3V2OE1OYUxadTBoZWNyRlh4MXh6RDFOOUVQRlZCc0tSUG44?=
 =?utf-8?B?U2xRVEppeGlUSFVXZjlTMkNWZUs1akVUazFYaEdsS25xMk82Q3Z4U0NUYW9j?=
 =?utf-8?B?ODhjRkdzeGt1NDBZNjlHYnRGaUtJYVVZbHRzTzYvSWRMMlk0KzA1OUpIb0Zz?=
 =?utf-8?B?SWFHd2J5bG5LM2NwR0VOb1hLb2h2MHVtNmxnR1lSRWF6K1lGOGp2RFNESUNQ?=
 =?utf-8?B?R2c3Ri9GNUtkSWlicHBkOE1XNDMrMW1YSjk5YUdxZFEwOWJxN21yQzMxek1D?=
 =?utf-8?B?VDhTTlBuQnRwUmFIWGllZ1EreXNYOEtmaXF6S1hnRWhFZzBjUEczSTJqaHNj?=
 =?utf-8?B?L2E1amJNRmJiNTRmTm1pWVU2QUpHQ25uRGd4S08wdnZidGdvRzBKQkd1Q2lw?=
 =?utf-8?B?OXB0STlJbmdWRlJGd1hpNU1kL2RwRnhYeEhFVGFJQzU1NjhMQ0VGbnc3ZHBl?=
 =?utf-8?B?TTB2TWVVajlZaGtTd1lYeEhrWVlDOHJ2ejdTMzBCL25OUlhrR015UnlyaExa?=
 =?utf-8?B?dk5IYUJOTGp6cDhsYm5XWWFUWmtscnRRMWVpcTNHbWJEdXlWb3BiekhGMVlz?=
 =?utf-8?B?TTlwUUZpaCt0MDNKeHFPVHhvdVpIY0hDT2ZXMk9aOWZpWUgvemowMFIxcVdl?=
 =?utf-8?B?bXRXR3dUZEpvNk80V2JIMTZ2SmdrYzlSN2w2TVpWdHcxczNkSjB3OVJpSjJp?=
 =?utf-8?B?UExRYlZDQVNzN1luL0FQMm1zb09NNXYzdnppbmtQdEhEbVMra21MQUkvcnhK?=
 =?utf-8?B?VFp0ZHBNL2lBQW9lYzI3VXNPU1liajM0YVpEc0Z3c3NFUmx3cThlZFcxaDFZ?=
 =?utf-8?B?Q3pEcTBqdWNaWVAzTGUwQWRSeWVRZWhETkgwb0F0dFYyTnUyN3NsVzgwSDk5?=
 =?utf-8?B?NEJnSUx6MnhtUUNzWWhMWSswdnJrUElFMVF3L0ViUGljcE80UDUyTFBCaDh1?=
 =?utf-8?B?dmFPSjFlNkFRT3lWRGV1SFBiZ0dUZUFtTUcva1orTXpPamN5bGV4OE53RE1X?=
 =?utf-8?B?blhaSUFCMFFqT0VZRlloMmhtSVkvaGF5ZUtRRHh3NjNWK3U0bDU0aHp6N01I?=
 =?utf-8?B?RnB2d29ySWVoYWFYa2RNMW1mNG5Kbjk0QnhJcmZBVC8xQm0ySHovSEZOdDdI?=
 =?utf-8?B?S21jVm5vRldpRHVKUWc4clBjTDhSb1VCbmlvQVhmb0c0UEhQVWN0cHFIVTc3?=
 =?utf-8?B?bmhmQVMzMVFhRVFlTGt4WjVGOGtScXdKV05xaGhwQ1VRT29GZVhLcTkrZU5j?=
 =?utf-8?B?RU11Nm1qcWlRdjFxREZlRWRxWVgzV3FhbzIrMzdDbEVNZFQ2QXFjUTBNa1pI?=
 =?utf-8?B?VEs0bEthc3R5bWkyWXhmUzlhYm9JZy9DMTlXL2gyTXJBRVQzbnBUMy9kN1g1?=
 =?utf-8?B?WnRKOENOSVNpNjJnWlk1eGd4TTBMMGhPRnIxVllJYVoxZ0xLVHUvTmVIZDRp?=
 =?utf-8?B?UmtWci9ZcDFzQkludVpxTW04a1RoUHhIY3RuY0VuQWdpeEM0OVdXZUdzVjJj?=
 =?utf-8?B?QjBVZVRBQ1RydGNnaUdMU0V0QWYzbktCSVpwaEc5MG5QaDA2VldkOFBwUjVz?=
 =?utf-8?B?TWFrN2hiZ2dqK1BoRUVKeXgvZWhTVTRUdGV0UnMrYy9ZMk1mdlNwV0FjRmpk?=
 =?utf-8?B?WUcvdXcrSm5rRUs4eXFzN2FMaUtZRDRqWWVpaHl0MHVvV3pveE54M0E5cmND?=
 =?utf-8?B?SUJkb3R3K3Mzc1R3Q2dVNEhxZUgzVkxCVjNWNW8wOUgxYTFIWnR0WUVTSUQw?=
 =?utf-8?B?dFVnMjc2cHB4QmdnaW5NZ1pGOHg4N1BqS0hkVkRWOVFzc241VllZYXVUWDh1?=
 =?utf-8?B?UU9PWjVpOWgrRm91b2hHVzQzeWU5SXVZb2k0c0sreVJrU2RKQzluYzVzOHhD?=
 =?utf-8?B?c2xiSjZPQWxOaXBObVIzcEw3dlQyOGN4RnhNNk02ZXVoMUJrRDc5U1BHRk1s?=
 =?utf-8?B?YkJGWkxjQ0d3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YjVQR05TelBWTnVXekxreG5qRFIwTzBFTkRyNHJ6cDZZZmtoOC9CekFDUmdv?=
 =?utf-8?B?eEQ0SUhMRElBVXVvZzVVeUp1MFZkWVVlblhuSVZCdXZyNmtNdzRDajFpekRj?=
 =?utf-8?B?RTVzR1BTR2dKTzFCU1ZmNHJydGtvaHlLQTVCSFZ5UmFkeDlnd09YanNZekFt?=
 =?utf-8?B?K2RzNC9BeGlIVFZQTUZES0FMMmNNOHF3bmJFYkpqczZMVVp5RUt0QkgzTVI2?=
 =?utf-8?B?NXB6aURrVTVSQ3FrZ1RVYk05L2dLdWVnREFEVzdhbkQwRUhoODBYbTZMK0Iy?=
 =?utf-8?B?WHlzK0dYcHBNUTU1OEU4ZU5iVzkvRmpjS2dDVXNBem5sWXpTSm9IcTkyWFVK?=
 =?utf-8?B?Y2RBd2hDa1QrV3lGdnQzZmw0anRYRC9xTXJLRndHZElxNjNUZ0RHblNDYkhZ?=
 =?utf-8?B?QXNxRVo4MmpZVUs1WmkyYlJPc3ZsdnpGOTlKcHNiazFKd0FqZ1pJVU1UVWc4?=
 =?utf-8?B?VENtNW1ycG9tQWFjQXo2RHBPSHRVNmxJVjVNVmRpbkNJallEUzlPUGE4dkxG?=
 =?utf-8?B?b05XSmp3L0Q2MWFPZDdJN2kxbEp2bnJsMk1vQ0ZjVkVSU3NtZUcxRlc2K2hH?=
 =?utf-8?B?anpoQjZUejZ1ZHBFOHZtZEUvOHdtVzQrWWdxTkthWG8xVzJJM0hvck1nczdY?=
 =?utf-8?B?cDhXWHhxazluRnFjTForRjYxdXM0c2JleURER0hsd3ZabVZWZ25ZbCttNS9j?=
 =?utf-8?B?aStoQWZmNjdxNzE0NGxZTUEvWEFMVlBDWGhtMmJxQUl6NzNkOWVBTFh3SGdL?=
 =?utf-8?B?amhGSTFTMGU4ODNQdTNQTGViT0RYVmlBRUduNXl6OEJQT0hteVVZVlllZ2RT?=
 =?utf-8?B?Zk5TQjRBbTR2R1dqZWdCR0N4dnZ1RHpDZncvdmNra3htQkRuenRrb3NLS2lT?=
 =?utf-8?B?aVkrQVltckdMVk4xVmhJQlc2MWVnTWlOMi84clBjTDhzanpFVEsrcENqZVVU?=
 =?utf-8?B?dVRwRFlpb2ZnMTd5SWc4Mk5nNWJBc1I3M1prYktPSzRJeWJvRHQrdnA2OEtL?=
 =?utf-8?B?dWRnRWlBRFdVSEtrWGt6cndMU2NpVEJ2ZVE4R3I1c0ozMzA1bit4dERIRitC?=
 =?utf-8?B?cldtZXNBTnVBMlZzaW8yRlBRcFBaZDc4cEJUQW53RHBMUzdiQ1JkS0FjSnZw?=
 =?utf-8?B?NkJESDIvYVQ0SVYyaS8ycVZpT3RPT010S016SUVUeGhOOGhyWWdCVzVoSjh5?=
 =?utf-8?B?S3c5cWJlWmhjcTJsbWxQck5CdFN2dWlWcDZLaHhOdlpGcjMwc1ZnZ082RDUx?=
 =?utf-8?B?eVVKYmZsYjhIYlE1MUpZYXJuZ3pmS0oreVBUZVNYaExQQkhJUm43RGVsQjhs?=
 =?utf-8?B?d0NhUjJLdnd3UkVaRUdqRGR6T2VybXJsTC9WVEFhbFd6YmduZk9pVFEvcTRQ?=
 =?utf-8?B?bWtMMTNDQkN1VGRvWGlUNDlrTFhqRDlnUS9wYVorb09ncUVVbGdtTTFyaEQx?=
 =?utf-8?B?cTR5RC9CUEJZSmx2WDVrSjhJZDM2M2FqZUdCUGFQY0s0bTJMS29HeE1qeVU2?=
 =?utf-8?B?WFZhb1pKcEtXR0dBTTNqVG56eFViMGNYUDlkOGZRK1g5TEE1SklCb2toc0ky?=
 =?utf-8?B?VUcza3JTMUtKWk13UnkwTTlNaHlDTUV2d2JicHJvWmdBc0l0L0JxVkhId0Yx?=
 =?utf-8?B?Sy90MEtNVjlzc3ptK3U1RkdDNWQvOHpqbzdKUFNURVNjOSs2V1RJa3hVQWdm?=
 =?utf-8?B?Uy9wVUc5cmF1b1pxbFdmTnpQTmN6TCtyaGRVSDFkTFRKNFZHK1BCV3V1bkNI?=
 =?utf-8?B?WHQyNVVjMWhyU3luTlBzbE01bXhnMGw5NEFRN3IzdklNNWhDaFNlRzl5Yk5Q?=
 =?utf-8?B?Uk9PaVM4S0c4cnlpcFA2em9KSG05TTdJWDQ4ajZlMEFEaXZiUkVsY2pjSW1T?=
 =?utf-8?B?dktvWVNCME14dzArSE15WFk2dEZ3Q0RwR2o4T2hvV290b2d2Y2wzdCtBbnk3?=
 =?utf-8?B?SGZGd0FzQWFXU3pub2RkTHgwZXNkeTdUMU95K1FrVWNJYWFHMEtmME1nR1BJ?=
 =?utf-8?B?b1BnQjB3TS81MUd3ZHk3MzhabkRxSG9MR096UEp3U0lyVkNrdytyaWxzcStI?=
 =?utf-8?B?SXVoWk5lWC9INm9tU2diTkw2NWN5ayt2SUM2ckZ6Y0pYaExDcFZNUFZxSmsv?=
 =?utf-8?B?bmZwaXFqY3dWa2VkYlNlYjZocDh3U1VqUlozeTJiTUhMd3A3WXVuejBIUkp3?=
 =?utf-8?B?TkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <90D8564270A1EA49AE17CA64AE3EA8B3@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c58832ce-701f-4688-8151-08ddef4c62f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2025 02:55:51.3327
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OL/EjXuADx3hjn4jQ2uPvk+XaQ27hJjagLYvzLJ3oz2vWzwC3ZIj6V/P9fLeXJ/cLageZhthiiPiyRpuUJnRrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB7157
X-OriginatorOrg: intel.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Sep 2025 02:56:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119341

T24gTW9uLCAyMDI1LTA5LTA4IGF0IDE0OjQ3IC0wNzAwLCBLaGVtIFJhaiB2aWEgbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZw0Kd3JvdGU6DQo+IERlYXIgQ29tbXVuaXR5IG1lbWJlcnMsDQo+IA0KPiBB
cm1pbiBoYXMgYmVlbiBkb2luZyBhd2Vzb21lIHdvcmsgaW4gbWFpbnRhaW5pbmcgc3RhYmxlIHJl
bGVhc2UgZm9yDQo+IG1ldGEtb3BlbmVtYmVkZGVkIGxheWVycyBmb3IgbWFueSByZWxlYXNlcywg
aG93ZXZlciBoaXMgc2l0dWF0aW9uIGhhcw0KPiBjaGFuZ2VkIHN1Y2ggdGhhdCBoZSBpcyBub3Qg
YWJsZSB0byBjb250aW51ZSB0aGUgbWV0YS1vZSBzdGFibGUNCj4gbWFpbnRlbmFuY2UuDQo+IA0K
PiBXZSBoYXZlIHRocmVlIGJyYW5jaGVzIGluIG1haW50ZW5hbmNlLCBraXJzdG9uZSwgc2NhcnRo
Z2FwIGFuZA0KPiB3YWxuYXNjYXIgYXQgdGhlIG1vbWVudCBhbmQNCj4gYSBiYWNrbG9nIGhhcyBi
ZWVuIHBpbGluZyB1cC4gU2V2ZXJhbCBtZW1iZXJzIGhhdmUgcmFpc2VkIGNvbmNlcm5zIG9uDQo+
IG1haWxpbmcgbGlzdHMgb24gcGVuZGluZw0KPiB1cGRhdGVzIGZvciB0aGUgc3RhYmxlIGJyYW5j
aGVzDQo+IA0KPiBJIHdvdWxkIGxvdmUgdG8gaGF2ZSBzb21lb25lIHN0ZXAgdXAgdG8gaGVscCB3
aXRoIHRoZSBzdGFibGUNCj4gbWFpbnRhaW5lcnMgcm9sZS4gV2hpY2ggd291bGQNCj4gYmUgbG9v
a2luZyBmb3Igc3RhYmxlIGJyYW5jaCBwYXRjaGVzIG9uIG1haWxpbmcgbGlzdHMgYW5kIHJldmll
d2luZw0KPiB0aGVtIGFuZCBjcmVhdGluZyBhIHN0YWdpbmcNCj4gYnJhbmNoICggbGlrZSBjb250
cmliL3N0YWJsZS9raXJrc3RvbmUtbnV0IGV0YyApLCB0ZXN0aW5nIGFuZA0KPiBwcmVwYXJpbmcg
ZmluYWwgcHVsbC4NCg0KSSB3b3VsZCBiZSBoYXBweSB0byB0YWtlIG9uIHRoaXMgd29yay4NCg0K
VGhhbmtzLA0KDQpBbnVqDQo=


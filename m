Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF1D7CCF9EE
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 01:15:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by mx.groups.io with SMTP id smtpd.web11.18004.1761786916075414321
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Oct 2025 18:15:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=MIKOhJw2;
 spf=pass (domain: intel.com, ip: 192.198.163.8, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761786916; x=1793322916;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=Yf8yh47DRo24DynfmGNZwsByvOsH+kpWrQUxUTk7BIU=;
  b=MIKOhJw2Kr/xHzaWOSzl5Tw2UEF5H9yCUNuJ4GA9+DBvR5NLp5is3ixy
   dTuiSgXDZub4NNbvHGKuLmghGZ2EESNQM1qfNCrzPo+T/FCkHgo814Uk4
   DDNDGk7vrvJgpW9uaCpnXFC/zsBPPqcF/w8BIJdEAH2tWLdrOydK2VsdD
   I+KhtVsXxK0ZHHBVhQvzho5VaTrFKolBmmkB53ZEafvIV9tPfM/tbhHrm
   7j0Ca1hLdUWUOJrojnlaEnmrVwIu4ug/uunspY/wUTOCibbILfi8kB4YR
   jSiKyi2vFaasPhe0nmsqGX3CwtF+zMEYRquAlfJG+kBaPLdTuju7BfPVF
   A==;
X-CSE-ConnectionGUID: EKHL09ZST/aAeYmZNudv7g==
X-CSE-MsgGUID: Vbwj60RhQKGzHWyVWcsHVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="81551468"
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="81551468"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 18:15:16 -0700
X-CSE-ConnectionGUID: JjnSjuakRd+pHWNG9GdViA==
X-CSE-MsgGUID: O2gQHImRQlCvdbStsYgdTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="186262856"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 18:15:14 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 18:15:13 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 29 Oct 2025 18:15:13 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.45) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 18:15:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HXLgUFx4l0nJcigAuhqbSrIXkQAG16JP7hNGBfSkdFc9spu+tLUMSXrLsv4zP9LcsufU1Y79xPfGHjQEEX4+NnUdLpZ/P7wahB3d5KISI6FmEog3JWYQoV1lh2pHdrLvdHCPYCCtcoxNJg5QDbiWCqYwCV5Qgqkm/x95RAIjJDZZvaO8thBHEEO1P1TRqQ//jFUPSGH9Bb5V0gLMmhVImvW4bvwf8H3VU8ANmHny5SgW/obs+UbOnklLzlXJjvfermGczoqZloqYYYrMY1wkZceeEuSTzXwtn+fYy+QKUozYit/pfFI8QszX2waJ2IaElszWejBew+OZnaE9YBQ9rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yf8yh47DRo24DynfmGNZwsByvOsH+kpWrQUxUTk7BIU=;
 b=jjVAykFnJ2qebmlhAt+DfDnvPsvfqTXWqXBDq0K7OxNKcp4JYyZHcAJ//Nm0c94VJDH35myF58SZ7Vd7E/uqOV1upAiNEpsZFEXhrwBMqemlxnqTHvrP4xJfFPyR0uRK1omwB9PDfSUmTAgQRjC4xlvZOvp4YzS9VI0Hx6xkagwAwVFHB+nB3S4pj+gr7WqrUO8xQy9IhV+3be132O5aPN4coqUF+EuzeQDAqoo2iKmB0Y3jYzoXmsquoBDE5/7RaPrX1mqFUQRVwA1axBWUNuo03VBEeJp4fABcu+G6E8veFMklc31KmKMZJIOYQocTUfh/bN224EQ/lLKrlc5boA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by SJ5PPF1FF629472.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::818) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Thu, 30 Oct
 2025 01:15:11 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%2]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 01:15:10 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "Jiaying.Song.CN@windriver.com" <Jiaying.Song.CN@windriver.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][scarthgap][PATCH 1/2] webkitgtk3: update 2.44.1 ->
 2.44.3
Thread-Topic: [oe] [meta-oe][scarthgap][PATCH 1/2] webkitgtk3: update 2.44.1
 -> 2.44.3
Thread-Index: AQHcHj62CcW8wG8FC0WmwJIgrUpNzrTZJfvwgAESygA=
Date: Thu, 30 Oct 2025 01:15:10 +0000
Message-ID: <56d9e7c77a9924f1ec4f526a0a083d2652243b44.camel@intel.com>
References: <186254E5AFCF9A1C.28137@lists.openembedded.org>
	 <IA4PR11MB942025F4F4ACFCD39771A76AB8FAA@IA4PR11MB9420.namprd11.prod.outlook.com>
In-Reply-To: <IA4PR11MB942025F4F4ACFCD39771A76AB8FAA@IA4PR11MB9420.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|SJ5PPF1FF629472:EE_
x-ms-office365-filtering-correlation-id: 0d2d57bc-6060-45b2-0456-08de1751c5a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|4022899009|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?L3dEV1RKbEpjMU9mU1hkYnJib3dFRVNpeVUwajNvbWZDTGtJV0tSbkh4NElY?=
 =?utf-8?B?SkJjZGx2Y1ZObjBTNGszYVhxeVNrNmw4a3QzdGwwZ3psaUZpenk5cEw2NkU3?=
 =?utf-8?B?QmN0aTE2MjRISlpMUmdiaWd4eDV6Ryt1K1pxUm1zczBDWXVyNUdwSEgrQmsz?=
 =?utf-8?B?MU5SNHBOYjFSU1JMcEw4dWJiTTY5eHlPRGpKZGl0aE9zSzcwTExwOGpoRGVy?=
 =?utf-8?B?b09UY01NVDdKTnJkSjY3SHQ0UnNRby90S3JOTDNIdGNVcGE2WkJCVnVreE5J?=
 =?utf-8?B?YkRra0pIRnl0NThJeVUyamw3KzdiNHBVamlBVklPRHovcUVMZzAzbEw2ZUQr?=
 =?utf-8?B?TXRaeHc3djFFQk9NU25FRDVYa01nTFpvK2lPdWl2czFQWVg4T0tUV1VhYTc0?=
 =?utf-8?B?MUo2WXEvNEEzeSs0RVlkT2dOUlhPZ29iaXJtTHRqaDMzazR5Y1VIbzFjODFu?=
 =?utf-8?B?d3ZyeHB2NkdlRW5GYW9CVDdtWEEwWXgzN2FxeGNEa0c4R29CK2ovT3pYeURW?=
 =?utf-8?B?YXlpWnJJczVlMzF3NGtzRlhaaEtIUitaRkZocHkwOXdQSG9GNlJVOFJ0Rngr?=
 =?utf-8?B?K0hEZ1crL0FlcklGTUpkYjdzaWE5OGV6QzBnS1ZmaXhCM3JpaUpDTUZDYTZv?=
 =?utf-8?B?VXhmMVZ5SXNiTFVORE5lL00zRHRQYzY3K01acGkxWXZybjBid3NlWDJ2dDJV?=
 =?utf-8?B?akVtTWg1RUFnQjd0SUZKYkswbnplb21vSXNCV01vS1J3SytBbkpieEJXWGx0?=
 =?utf-8?B?K0t0djlkN2w3bFcvOS9ROUI2enJTQnJCcG9va0xYMGZDS08yU0hLWGVjOU5E?=
 =?utf-8?B?eGxwWWgvUzN0SW9ybDBNaWd5OGdPU2NTaEhWeXRmL2NCUHFibklFT3pDWUl1?=
 =?utf-8?B?MThBSWNqZmtkYnA0YmNQdG4yZ2czc0dvMDI1NkFraXE1WitWSnRpNllwakp0?=
 =?utf-8?B?M21zOWpaM1c2V2gyV1BJMDRidXJmT3kweW1LNTU0S01MN2U3cFZFRDhVYW52?=
 =?utf-8?B?YnorVVJxdDZiaVZDdjByNEtYNHVPbndqNkROR0hqZU5LMjhIelVBWWRWRERJ?=
 =?utf-8?B?Ky96Smh0OFNGN013OC9XOHdEajlrYS90cGRWV2F3c2h0RXd0bXJvblBhdyt5?=
 =?utf-8?B?VnQwZEkrY0wySjYwMkZsMjh4aFVmVDEwVXZHd0toWUswVGxIVFpDcE9rR3Z4?=
 =?utf-8?B?eEZkeUR4ZVRsWVhkcWhpeDdxUkpUcmoyNHd3UStlUmtySHhndk5ONEpsUkhC?=
 =?utf-8?B?dW90MjV0Z3NVS0RMNWlXVkIxbkNwSHpRSURvOFdqYWpJZHNuSDZYSjA4b3Fp?=
 =?utf-8?B?Zy9ycjZqS0crUFBmU1VWdk9qT01XalhzVXVWSGFhb2FTZ1lvRU9hdXVIYlVB?=
 =?utf-8?B?RFZKRUFpenRmaWM4WWtBbzV2Nm92a09JK2lGaVJXV2dUSnMvdUJadG1aQ1ZW?=
 =?utf-8?B?d3gyYVh6SjFpZlVXRSthYXJvQnJCajFMQ2hvZWU4U01SSU0xd0hycDZ5dDJB?=
 =?utf-8?B?NWtxSER1WGlQR0Q4Kzk5ZzZ4d0F3c0lFZWs2OENPK3JlSytTLzdQS1NuNFkz?=
 =?utf-8?B?dktGZk5sbFk1ek5Wd3NLWmhCUXZoNG9neWllbEtJdmd6dmZ0SFZha2xDMWxu?=
 =?utf-8?B?S2czNHBNNUZnbDJXSnpYTmJrajkrVVpoTlp4cjlpOHdvNGtEMXdNYTdFc3pI?=
 =?utf-8?B?WFNCNTBmazh0VStXSWsxUDZ6Wm8yNnMxZWFwLzJDV2ViZysxZkZYaW4wOUxI?=
 =?utf-8?B?dEU4a2FNYWJsbEFNL2E0YWFqamNuM05mVEFSMEFvdXJKeWRtMlk0cTYrdWRH?=
 =?utf-8?B?UUlLN3FabERkZHIvbDcvVVpZMEsxc240bk9KYzlGTy95V1dBbXVVckM1dlRD?=
 =?utf-8?B?a1Z6anV3aDZxTm9FcEVQNWErRE1OYjJaVDRUMGFuczl2ZjZHVklYdE9JYTQ1?=
 =?utf-8?B?cjJFUTNPc1lyc3BXRisyQ1ZwTy83MVhLQVJ5cU1teXF6LzNzS25zQit1MUNj?=
 =?utf-8?B?YTZGRVl2SWZ3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(4022899009)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q2s0SlpLZ1NER3pHbmFEQWpKd2JvdXZuY3h1YWZJZUEvVkM2ZTJBZDgxdHlm?=
 =?utf-8?B?eE82NFlwV1JKR3U2dmt5L1VyL3hOY2lGT3pWa1B1aHY2RkhkSEUwOFdBbnh6?=
 =?utf-8?B?a3N1S3lkQ3BydkZnUzFXbkpTWkU3dlBkUkdrTjZORk05d05mSFdvUHNwcWdi?=
 =?utf-8?B?dS96UHE0Q2M2ZFN5ektnNWZCR1VybkFPVndSWUtrNnZRdWZLOTFjZ1hiWjBv?=
 =?utf-8?B?cUg2VnRmY1c0U0kwQ1FjcnBuTHlhRVZ2UjFtUWJLcFpsZXhibitPcnRpYUxC?=
 =?utf-8?B?Yjd1SGZtSCtWaGNxUnRiOXRZNzZMZ0FKZitNdU90TzZjRm5SZkFWNExiTEtX?=
 =?utf-8?B?OEFUR1MvbjlWL1pYTFlJaFZaMDc4SjNjQmJORDJBMDhwVU9MUXJ6SXNsendK?=
 =?utf-8?B?UGFIanVtSTZwSklZVzJ6Q2FZSi9WNTkreU1Vb2lhcUJBR2pIUHBXeS9HMEpM?=
 =?utf-8?B?QTVUWURRWHN4K2wzREIyRzFqSHJNVjlHNGlWcVpwZ0p3TXBxZ0lDZXhUSmZp?=
 =?utf-8?B?NGRXMTZoOWtHWUF5WEh3SmUzNDNCSTBHdlQzWU9BaEdGNU5NbGFQdXdGUGRh?=
 =?utf-8?B?bnRDeUhlcTA2ZmZaYkIrS3BpMlFGOWpGVi9UQVpYb1NYWE5HVFFLaVlnS3lD?=
 =?utf-8?B?dTkyUmZwU1NjbnluSTFnVld3WnRwbHdxaXB2Y3l1SktmdXZVWFVEcnQ2VE55?=
 =?utf-8?B?N2ZIaWFBYzgvWjlJYzVDSkFSTEVXS2hDYW1BS1ExZUF5K0ZBbkZDKzN0aHhL?=
 =?utf-8?B?MEpnU24rVFc1VytLdC9ndUwwOVMwVnhkYzVaUWphcWQ1aDUvdFJuUmltakps?=
 =?utf-8?B?ZnRyU1didVR1Nmw5aTNvQnJwNExGL3YyMGlaS1ptMG9VdUtDTEZMQnE5WGZa?=
 =?utf-8?B?cWtERlU4TDNzUGd3T2ptZ1kwRkFtRXlDTW10L0FHWkpJODU1cnJWSWVRNXZX?=
 =?utf-8?B?cjhXemxHeFRGcDN5dk8yQjcxRUtCZ21XUDRsYllCQVZWbUg2YlRFZ1o5ZURZ?=
 =?utf-8?B?aUlWREZNYTc3UE5SZWFaSlh3UmM4YmxrMWtUZGxTUWRVa2JOTm5uQW9IOEN0?=
 =?utf-8?B?b3NxZDJmT04zWFJSWTA2cS94UmkxalNGbzNrbkVpUXM0UWZjV01qNHQycXRF?=
 =?utf-8?B?Vi9EL2dkaXJiWWNRbnJpZHdZaCtVZjdVQUxrNktudDZNTzduazFsdzlQZ283?=
 =?utf-8?B?ZTdXcnVDUFlzRWx4OGpkd3k3UXA1dlZmaVpZU3BFNzd1NWljSVhQc1pYRjdi?=
 =?utf-8?B?dGFocDRWRWdHQk5rdFRoS2I2U0tXYk5hYVNZNlRLaVI0R2M5QnZQdDI2YXBF?=
 =?utf-8?B?VHk4TTlydE5EbVNGaEViL3FpN2dpQ21mMDRsNVVJYU1iblR2dGlMUE1tVEpv?=
 =?utf-8?B?eW9iV3lNU0R0cnUzdlN0dlFhV1NNVGhXL2d2YjNyM0RFdkNYc0tYbS9zMm5i?=
 =?utf-8?B?NXhrR3JnL3lMM1NDTGlQWmxFb2FIejg2TUVwelBlcks2bVBkQlppZjhmVXVv?=
 =?utf-8?B?OFpUMnZnODlaWXo1eFVhY1AwZHkzaWJST1RkajFVTUYyeDBneWEzTmQ4RS9U?=
 =?utf-8?B?RjFVZHVGTTJmdndSMXU3S3JQTFcvSlp0dytwQ2FVWjh5amdyRHVKUVZxL2dO?=
 =?utf-8?B?V0JVbjd3ZDVYNkZ6UXhJQjR5UFdMQXJHc29lOUhUalo5K3JZWVJ1ZlRreTJi?=
 =?utf-8?B?QW16bTZuRHpCMldhdmsxcGd0R2pwWUlWQmpUTmc2WmJ2cnRHMUkxclNvKytD?=
 =?utf-8?B?NVB2aktsZk9aK2FJSkNHR29WYURwTTFxRmgxMVFlVGo2R1djdllxdHhmbVdG?=
 =?utf-8?B?SEUwd3M0RjdMYkZOMjdIVmIydi9KRVl4LzBtN3VQblVLK3MyNS9QNDg5S2ZX?=
 =?utf-8?B?S0VtUHZWRkZ2WWxvVEJPL3kxR05DaFlIT1FQaU14aGU1SVhvWTN1NVB1UlUr?=
 =?utf-8?B?U2JvZzA3T1lvQjZGbHpNaWs4TXl3dlFYM3pOc0s2em1oN0dITGRRTDZXb2Vl?=
 =?utf-8?B?djc4Q3REdTIyNUFlOUdXNktzTC96OGx1czd4UFR4U0VVR2tDSjRSSmdhN1B3?=
 =?utf-8?B?eFlORkNMV3N2UmNhNlEvbmlHS1FvQjRFWEZKQ05BZHRyUUNrcEpTSVNZMHM3?=
 =?utf-8?B?cTJyaEdScDZsVnBYdlFSRlVsQW1uSkpHTmNqaTBhUFZTczhiQWxPSllKNktO?=
 =?utf-8?B?UGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1C402521D5D28D4E91F63D55C0701BF9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d2d57bc-6060-45b2-0456-08de1751c5a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2025 01:15:10.8248
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cZ1ODqfKl+l+EyzEWa+Ip20n8zjtAcIxfk+B9kf9WxLM+BE7lkBBcI4FmTeVoXNJBH8u6oRKMT+/+moCU8rmbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF1FF629472
X-OriginatorOrg: intel.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Oct 2025 01:15:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121175

T24gV2VkLCAyMDI1LTEwLTI5IGF0IDA4OjUyICswMDAwLCBTb25nLCBKaWF5aW5nIChDTikgdmlh
DQpsaXN0cy5vcGVuZW1iZWRkZWQub3JnIHdyb3RlOg0KPiBraW5kbHkgcGluZyBmb3Igc2NhcnRo
Z2FwIGJyYW5jaA0KPiANCg0KVGhlc2Ugd2VyZSBtaXNzZWQgYW5kIEkgd2lsbCBpbmNsdWRlIHRo
ZW0gbm93Lg0KDQpUaGFua3MsDQoNCkFudWoNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KPiBGcm9tOg0KPiBvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZ8Kg
PG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4gT24gQmVoYWxm
IE9mIFNvbmcsIEppYXlpbmcgKENOKSB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTZW50
OiBGcmlkYXksIFNlcHRlbWJlciA1LCAyMDI1IDQ6MTYgUE0NCj4gVG86IG9wZW5lbWJlZGRlZC1k
ZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFtvZV0gW21ldGEtb2VdW3Nj
YXJ0aGdhcF1bUEFUQ0ggMS8yXSB3ZWJraXRndGszOiB1cGRhdGUNCj4gMi40NC4xIC0+IDIuNDQu
Mw0KPiANCj4gRnJvbTogSmlheWluZyBTb25nIDxqaWF5aW5nLnNvbmcuY25Ad2luZHJpdmVyLmNv
bT4NCj4gDQo+IENoYW5nZWxvZzoNCj4gaHR0cHM6Ly93ZWJraXRndGsub3JnLzIwMjQvMDUvMTYv
d2Via2l0Z3RrMi40NC4yLXJlbGVhc2VkLmh0bWwNCj4gaHR0cHM6Ly93ZWJraXRndGsub3JnLzIw
MjQvMDgvMTMvd2Via2l0Z3RrMi40NC4zLXJlbGVhc2VkLmh0bWwNCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IEppYXlpbmcgU29uZyA8amlheWluZy5zb25nLmNuQHdpbmRyaXZlci5jb20+DQo+IC0tLQ0K
PiDCoC4uLi93ZWJraXRndGsve3dlYmtpdGd0azNfMi40NC4xLmJiID0+IHdlYmtpdGd0azNfMi40
NC4zLmJifcKgwqDCoCB8IDINCj4gKy0NCj4gwqAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSnCoCByZW5hbWUgbWV0YS0NCj4gb2UvcmVjaXBlcy1zdXBwb3J0L3dl
YmtpdGd0ay97d2Via2l0Z3RrM18yLjQ0LjEuYmIgPT4NCj4gd2Via2l0Z3RrM18yLjQ0LjMuYmJ9
ICg5OSUpDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvd2Via2l0
Z3RrL3dlYmtpdGd0azNfMi40NC4xLmJiDQo+IGIvbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvd2Vi
a2l0Z3RrL3dlYmtpdGd0azNfMi40NC4zLmJiDQo+IHNpbWlsYXJpdHkgaW5kZXggOTklDQo+IHJl
bmFtZSBmcm9tIG1ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L3dlYmtpdGd0ay93ZWJraXRndGszXzIu
NDQuMS5iYg0KPiByZW5hbWUgdG8gbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvd2Via2l0Z3RrL3dl
YmtpdGd0azNfMi40NC4zLmJiDQo+IGluZGV4IGZjOTZkNWRjM2IuLjdkNzBjYmRhNzggMTAwNjQ0
DQo+IC0tLSBhL21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L3dlYmtpdGd0ay93ZWJraXRndGszXzIu
NDQuMS5iYg0KPiArKysgYi9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC93ZWJraXRndGsvd2Via2l0
Z3RrM18yLjQ0LjMuYmINCj4gQEAgLTE2LDcgKzE2LDcgQEAgU1JDX1VSSSA9DQo+ICJodHRwczov
L3d3dy53ZWJraXRndGsub3JnL3JlbGVhc2VzL3dlYmtpdGd0ay0ke1BWfS50YXIueHrCoFwNCj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoA0KPiBmaWxlOi8vMDAwMS1Mb3dMZXZlbEludGVycHJldGVy
LmNwcC0zMzktMjEtZXJyb3ItdDYtd2FzLW5vdC1kZWNsLnBhdGNoDQo+IMKgXA0KPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGZpbGU6Ly8zMGUxZDVlMjIyMTNmZGFjYTJhMjllYzM0MDBjOTI3ZDcx
MGEzN2E4LnBhdGNowqBcDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIg0KPiAtU1JDX1VSSVtz
aGEyNTZzdW1dID0NCj4gIjQyNWIxNDU5YjBmMDRkMDYwMGM3OGQxYWJiNWU3ZWRmYTNjMDYwYTQy
MGY4YjIzMWU5YTZhMmQ1ZDI5YzU1NjEiDQo+ICtTUkNfVVJJW3NoYTI1NnN1bV0gPQ0KPiAiZGM4
MmQwNDJlY2FjYTk4MWE0ODUyMzU3YzA2ZTUyMzU3NDMzMTljZjEwYTk0Y2QzNmFkNDFiOTc4ODNh
MGI1NCINCj4gwqANCj4gwqBpbmhlcml0IGNtYWtlIHBrZ2NvbmZpZyBnb2JqZWN0LWludHJvc3Bl
Y3Rpb24gcGVybG5hdGl2ZQ0KPiBmZWF0dXJlc19jaGVjayB1cHN0cmVhbS12ZXJzaW9uLWlzLWV2
ZW4gZ2ktZG9jZ2VuDQo+IMKgDQo+IC0tDQo+IDIuMzQuMQ0KPiANCj4gDQo+IC09LT0tPS09LT0t
PS09LT0tPS09LT0tDQo+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0
aGlzIGdyb3VwLg0KPiBWaWV3L1JlcGx5IE9ubGluZSAoIzEyMTE0Mik6DQo+IGh0dHBzOi8vbGlz
dHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1kZXZlbC9tZXNzYWdlLzEyMTE0Mg0K
PiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC8xMTYw
MDkxNDMvMzYxNjcwMg0KPiBHcm91cCBPd25lcjogb3BlbmVtYmVkZGVkLWRldmVsK293bmVyQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gVW5zdWJzY3JpYmU6DQo+IGh0dHBzOi8vbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1kZXZlbC91bnN1YsKgWw0KPiBhbnVqLm1pdHRh
bEBpbnRlbC5jb21dDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo=


Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E85E6CA1016
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 09:07:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by mx.groups.io with SMTP id smtpd.web11.41744.1757581642856085464
 for <Openembedded-devel@lists.openembedded.org>;
 Thu, 11 Sep 2025 02:07:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=b6EF0Duo;
 spf=pass (domain: intel.com, ip: 198.175.65.20, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757581643; x=1789117643;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=JZNtDw2phb28LEeNL35kL10HNG+d7kB1fqw39EsYo9Q=;
  b=b6EF0Duojx7HM7tzKIVWvB8lv2cKh2BLDbzERcZJsBKwTUhp0D5XaQP/
   CvRhxsTIbmZv5dedUQEdujEaydmjKJepDld00wh9PYfZb4tfEERqH6Q4E
   Xl3BQIsTx1+sv763P8+Ym2khSc2NHJAhNQSouSD22Ujav1megd1K8aMlS
   1+jy+Vch3KoyuC003lbjfFBeFTptfGQA6Nkp99bxB4en/sryagGuLB/qN
   MluYpBP/+GUnClIOvB5g4IMtOCIUe9Q0cV3LMXNwY0FS7HPwRssntS5oQ
   LSUedevbP9kasm1q69QcL5R3MTWRJ1kvhYo32q6E9jO+K4/HxxWar+SAb
   w==;
X-CSE-ConnectionGUID: MKt4tCt0QK+MAL6ht6glpw==
X-CSE-MsgGUID: XCy5R9HwRQSuBE8BAqBrdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="59601827"
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; 
   d="scan'208";a="59601827"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2025 02:07:21 -0700
X-CSE-ConnectionGUID: fHCtmOwOQoyghojj5YL+ww==
X-CSE-MsgGUID: O7x6j8DvSCWAdfFi5jrvyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; 
   d="scan'208";a="177949341"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2025 02:07:21 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Sep 2025 02:07:20 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 11 Sep 2025 02:07:20 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.40)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Sep 2025 02:07:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y/EmV6HG3dVJPfqtcxkTVx1R4WK5Wv2AUmC6REldA0BCzF1MvlBst8afqXfKb53b59gpr0I+b8UMi79r6InB+yS5UTxdJUDc5gZtAOzPkdwoFpmsuhcaqSpTbQW79BgKIIUTrLMDmOVhO2W4xTIGw7Kk/n69l6ZzLe40OgYf5zzyooBTNIfnF/e8RsezS7AYxQEKc3z/T1KPqiNa4FzFXa2iruDNOvYotl1PZhvGWPJlfGjVtQDqLh6KhrXk+NhinkOHgPC62O2cKpiL1Iu+qtKyDVw2e3bdzk3BNDFgB5JocnFqOvKLYYG8ZPWeUwTYCs/K9FtwDwmXJItrMfUtfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JZNtDw2phb28LEeNL35kL10HNG+d7kB1fqw39EsYo9Q=;
 b=jgMcI/sUomMXiyMgMmnowydxnpfa/DCT1y4T6Bt4uX3eiL9tvRjoVWiisXM5FpmzUDZx+5u8vk8+BkFKJroes5iCNBzHga26IYu6zUL5LQE3V3dbJg0Z/U7jse2WOGyrMn+m/2HpY2bnpIm0ngSGvbQChAiLk1p8ZnYW6kRoNNI4OVfo6ca3C6O+jsphLr1VapT2tkGPudRaDyUovdkhWGPpTUAagZcvHcBw5NOUfkUKsH+3+P4uQS5PnJtfA5EZKMairbVNDP68KYcUEHb9a/EeQSvWEgwb9AbBa3vhNnG9p8mkDkIELWG55F8MYTCKFB4BZ/pUq85o9sQbDE1QRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by PH7PR11MB7121.namprd11.prod.outlook.com (2603:10b6:510:20c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 09:07:18 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%7]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 09:07:18 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "rs@ti.com" <rs@ti.com>, "raj.khem@gmail.com" <raj.khem@gmail.com>,
	"akuster808@gmail.com" <akuster808@gmail.com>, "skandigraun@gmail.com"
	<skandigraun@gmail.com>
CC: "reatmon@ti.com" <reatmon@ti.com>,
	"Openembedded-devel@lists.openembedded.org"
	<Openembedded-devel@lists.openembedded.org>, "a-christidis@ti.com"
	<a-christidis@ti.com>
Subject: Re: [oe] [meta-oe][scarthgap] vulkan-cts: allow vulkan versions > 1.3
Thread-Topic: [oe] [meta-oe][scarthgap] vulkan-cts: allow vulkan versions >
 1.3
Thread-Index: AQHcBu+viUaDbSmSakaOUx6bhd/SfrSN6RAA
Date: Thu, 11 Sep 2025 09:07:18 +0000
Message-ID: <9c0f481abfe1404b08dda058fa50b00ba68ebd29.camel@intel.com>
References: <20250806162939.71883-2-rs@ti.com>
In-Reply-To: <20250806162939.71883-2-rs@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|PH7PR11MB7121:EE_
x-ms-office365-filtering-correlation-id: e70451c0-cef3-48c9-0838-08ddf1129bc3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|4022899009|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?MlI5WDdsMzJHdVBkMVZneWNWbmtEVEhlSWhtYjJLcW1tS0hsNTRQWEE3TlJL?=
 =?utf-8?B?SDZETlMzVzA0UHpEcU5PTlozTUp2aWt4RU1BV2dQNlJEVENqL1FyNkowM0Ev?=
 =?utf-8?B?M1NOcGt1UU15S0J1NVV1dFlSdzEwZFVreW5Ebnk1VGI3eHlNak9hTFRxUk1w?=
 =?utf-8?B?ckxpK0xCL3ZId2twTXNzYmpCSE91SEluZXlaVkRUeW5vcWZnOGNKUEdnSEUw?=
 =?utf-8?B?QVp3a1V3Z014UXpTQWFDNWtmbVVPemtqaVdFYVp5TlFJY1pYWUlwdk9LL0ly?=
 =?utf-8?B?VVc2Vm1ManRwOEdJTXNuSzAzRm5LT0poaXZDSFB1akdwbUNZaktuYW1ERjND?=
 =?utf-8?B?WFJZMmhQekF0VG9KTUFZMHVTRTd6NGg1T3NWWENXWFE1YlRyUmtIWWlzRjlQ?=
 =?utf-8?B?UHBZcUVSWU1RMndra0lZL3hhYVk2MkxQdkpwSXVDZXdVTkhWd0UvaEw4Y2tV?=
 =?utf-8?B?RWFaYVVqbnM0c3dmMnNCNzZ2RlArMmNxbC9wZ20vaFp1bTh4SEthZzRnanRX?=
 =?utf-8?B?aFRhbmRUUnFIQmFUT2NhWGlHT0RQaEQzM1FMN3grbXZ2cTdJZlNtRG9VZEVC?=
 =?utf-8?B?T2E4a1phS0orQnFqM0tQWXBrZGJoUnBUZW84S0RXTEV5QTVpeTVMbGxOZFFn?=
 =?utf-8?B?Mm4wZzZ0RUF2dnZtV1M3TVdjMTk0OGJ0ZmJqTjlJZFFaYmNaY3FvWCtMbWNn?=
 =?utf-8?B?V20yMXV2OE54NCs0SzBqeWE3MndYdzY4Snh5bjZxQ1FQQm5YUk1tS2xUM0x3?=
 =?utf-8?B?ZnFLMTJ4M0RYQXR5UW1aZWVIcElsOGdUajhmWjF5em03WGVKdzFGUGQ2T0pN?=
 =?utf-8?B?VytIZzFWc2VOYzRqTzlDQVdGclhhc3hxbUpEM3V0aXV4K0RwaTMvYVhFbmE4?=
 =?utf-8?B?WDh6cEt2WHhPSWFvZ001dmRwZHJ5Q2gwL091OS9BZnBZdGZMZWc3NzQyaURU?=
 =?utf-8?B?dVd4Y0xYSlpGQXZ2NGtNSm81eTk2ckJjU1NVdk1MQXQvZ0lybHVpbU5HN0Vu?=
 =?utf-8?B?ekwwVFpOVUhYcDhsY3FZYURsRlBxUlo3dUdBV3g1ZHYxWTNZWVNUcWI4aEg4?=
 =?utf-8?B?dTQ5M2xKQmxYMzZPalhlaW1IK1ZrUHdwM0ZpZm41WVphTDFqWC9WaTJzSjZj?=
 =?utf-8?B?ZVBFTzFFTmFuYjU2LzRhS016MTZiaW9zNnJmSHFpY3JSUS9pYlVVdjQ2WFAr?=
 =?utf-8?B?SEFRSHN6TWdZbWd1cDV3bG15OXhnZUNvR0R4MUlyRkJzTGxmQWFRREk3WTgz?=
 =?utf-8?B?K0pmQytBckNXVkhocTRzM1doTUFhMGVZdXNocjRlSmFhWjI0bmFreWZQdVFF?=
 =?utf-8?B?Nm1WUU51bE93bFhRL0ExWFFndlA3dzNLK0xzL3lZaHpZWUNpVWJ5ZWtScXo0?=
 =?utf-8?B?UWgxVVNCbVJXaFNtdUNvZ2pha3o5dE9HM1d2VnAyYXpYMzN6ajVpM3FweTcw?=
 =?utf-8?B?VkhwMFRoQk56ODNSaEUrWStDRUxtUlVDWEREMmowR3FreUFPTWhLekNmbFIv?=
 =?utf-8?B?SDJ0TjVVakZJSFc3dEpNenJKZmk0b0prR2pWUmJTUmhNbmh6ZXYweUxXSjl0?=
 =?utf-8?B?NUlxaURaRXpqN3BxUjMvaVFXYllJYmlnVEVNUTdLWDVYMklBMW9BaEU5Ulll?=
 =?utf-8?B?a1JTbVdNWTFwSVhIOXlSb0dFYldmYlFJZHZJbzVBQkZNQlJ1a1dEZEVPN1ZH?=
 =?utf-8?B?RHJueEo0ekdXZ1ZYNXZhOU1yZC9HelhLbjNqOFdZc3lQWExOOVFROE0yclpE?=
 =?utf-8?B?WUtLdWRHblFTME1SQUxpZjlKUFpibkIrUTRhTXBhYjNkdmlIZzdkNENqMXRF?=
 =?utf-8?B?a1RhVTF5TnpaTjlWQmowcEFuRkJ6TnlDaUd4NWt5bWkrWGNDNkZabVB4VXFp?=
 =?utf-8?B?RzFaOFRFclhEZnQ5NWRvQVNsSW9UdCtjOXY1Z3RDdFJ1cnRBT1phYkpZbUl5?=
 =?utf-8?Q?3EwcimPGGmc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(4022899009)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dWpuNUlKbDlSQ0lidk5NTjFROWMxYmJhNnJLVm1reGdOZHJVdk9ySGg4dFNX?=
 =?utf-8?B?VTZSRE5ZeVYxQ1FLNVpKU21QakZpM2JjWTUxaU9EQVljUzI2ejRYTkErYmtl?=
 =?utf-8?B?Q2VDb3BuWVBMSkpJVWkrb3BXQlp1cUhlTjBGU2s2R1A4ekVtd3lBRWRDVTNS?=
 =?utf-8?B?NlkyYWVSTnlZT3Y1YXFBK1BtcTRwRGxnMmhLV3p0L3UxS1J6OHNBOTRCbTg5?=
 =?utf-8?B?NHhDZU9qN3FKdWRnZVZ4QUdOTG5YWVdqeVViMWFOQjNMZ2I0V1pxZzBidGsz?=
 =?utf-8?B?aW90V0VKUElPRlU2cGJDQ29JQjVHQWR5dHlOSzltVzNiazJtbXVta1JKVFND?=
 =?utf-8?B?ZFNkT0s4ZXJUdXppZmcrZ1ZVZm9MR3Y3LzNmZ3VHQjl4dWVzOWVJYk94NUdz?=
 =?utf-8?B?VDB2bDdjMWpBdjJ3dHZDUU1WcWZmZnNtRDVhQW95OUZGQzN1ZVRpMVlqRC9n?=
 =?utf-8?B?TkpQUGhzeE5ySDJBSi93OGU5ZVlBWVNXS21WQ05UdExwL2lOR0NvTWR3Qm45?=
 =?utf-8?B?TksycmU2MjVlMkxnNTgvMVVIMis5YUVmOFMxU05Iakw0d3VRRm5qSEFVeUxV?=
 =?utf-8?B?Wk9aYkk4TWV2SFRkeElBY0xMd2ZyTjZEbm8wbmt1M2FHZFAzczhGM24zTTRy?=
 =?utf-8?B?eXBBSGFyS0svb0RWcVZUb0h3bTcyY1lOVnU1cjFZVEp4WVcwWExUTXl3alBD?=
 =?utf-8?B?a2prUHVCYjVraTBsNnc1YXJ6K1hSOWRoMkNNR09ZWVhoYWh3K3NWTFZENGNo?=
 =?utf-8?B?ZmFKanEyVityaStEb2tabGxranZCemJZYW41MUVvMnRNaGZDR0lvVGE2UUlY?=
 =?utf-8?B?QmlGNkhTMmRxS2UyV1lDVEROTU1jWTdjY2dpS3NScFNOcXlxT2ViRGk1TWVF?=
 =?utf-8?B?ZWxXWlVUc0FHeW5scTlidXIrT3crTVRVOENObEhETjRNcEgzckhmSW50U2dr?=
 =?utf-8?B?Z2wrZjJJZjY0dUlmSWNQQnlZNm4yaGNpbHJ1WVE2TWJuZE1NQ2c0MnUvNGFK?=
 =?utf-8?B?V2lRMnBJMDA4b1JBQSs4Z01wSUdsQXdwVkdYTHMvWjMzNkpNVy9YQ3hPOU1y?=
 =?utf-8?B?dVlkMUFCOXlENDFzcElGd1RwR3B3OTMwTDQ1YjIrS0t1bkRKMCtFeHl4SmtJ?=
 =?utf-8?B?NXJOOVd1dlJFM3ZoMS9wam1IRDV0N1daMjRIeW1Ka1drTjE1dlZrd05UcHdn?=
 =?utf-8?B?OEJXbE43YlZ0RC9UTVlmWGlCQnB0V2c0dmRGWHZCSTBlZGRkbW01TmpJNzUv?=
 =?utf-8?B?ckdsU0lyNC9qUk52b2lEVEJVdTI1bzB2WUprRlFERDNIWC93d09HVlNnYkE0?=
 =?utf-8?B?UnFSeW0wd3FhUEFHN1k5NGZmNWdwMDFHR0Y4OTJDTE1qdTNRRVV1QzZ6VUw2?=
 =?utf-8?B?UUptZGJzL09wU0plYTFCN3RBUlY1MEZIRVh6WGJhaHZxWGUxUzBKRzgvcEVq?=
 =?utf-8?B?alBaWGsxMzN0bGVtTzJ5OXdmSG9zQUl1akJ1SEVaRytzWTZkeHA2YytKNE04?=
 =?utf-8?B?WkhlK2JYajBKb0tuYWVMVG5Oa3JCWjVnSEdKTUM2S3ZwMWg2RXo3QnlkSjJJ?=
 =?utf-8?B?YzBhSUY4Qzl2QXRySlU0U2RnRTljN25Xd0psdDdxTDdBVFB5c3JXNFlwdk13?=
 =?utf-8?B?d3B5QWsyVTN4TEJ5QlZhbXBtV1JMNFhneDQ1OXkxNEVJNGY1R0JBaGRyUXc1?=
 =?utf-8?B?YWpEcko1NDBoTnh4eXJONjJNTmJMQ3hNUG8vRVQwaTVoaUErWU9xTDlLTWov?=
 =?utf-8?B?S2lVd0ZHUGlGaWRIR0JVTXZ3L240SWJJcFNDWCtjNE9vVjlFZ0tSdmhlS0V1?=
 =?utf-8?B?U1dCWUdrbGJnc1dyWkNXa0FqWXZPL2lIRzNuWVl1aENqbUtwOGJtMnJqZVNh?=
 =?utf-8?B?M2hMZTNwc2FDajNFWWE0bGRqNlJSWVVPY0NPejdRL3daWGU4L2hDdUg3V0VP?=
 =?utf-8?B?TFlTRTl1TWpVdUh6WDk3QUJCR04wU1B3Njh3NDdmSWZuMjlIMEJ0T280TU1O?=
 =?utf-8?B?cUN4dFJJdFYwRjQvM1hhR204ZCtvNzRkQmtQT2NsUm5Ed1lOTWtCVkpWNmhG?=
 =?utf-8?B?bDVvbGw0L0VFVXBPRzRNV0dUcjRaeERXaGtKVUdKaDMrTmRGam1WRTUxZENT?=
 =?utf-8?B?ZEJ1ZEMyVFNLaVFCc213L3JZN3NuMURpME1DdnRrbnRCelVZdmpIbEtSWE9J?=
 =?utf-8?B?dlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <81EAD732EA05344FB46907875FCBE444@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e70451c0-cef3-48c9-0838-08ddf1129bc3
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2025 09:07:18.0883
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sZkuQMTA0Ru7hjXTdzUBHuxR2TJKhsJ/Q/N0MjW/8cXs/CM563h66r/AIIYU8oukzPNVmpZH0+nlot6PXBwUoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7121
X-OriginatorOrg: intel.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Sep 2025 09:07:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119358

T24gV2VkLCAyMDI1LTA4LTA2IGF0IDExOjI5IC0wNTAwLCBSYW5kb2xwaCBTYXBwIHZpYQ0KbGlz
dHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4gRnJvbTogUmFuZG9scGggU2FwcCA8cnNAdGku
Y29tPg0KPiANCj4gQmFja3BvcnQgYSBwYXRjaCBmcm9tIHVwc3RyZWFtIHRoYXQgYWxsb3dzIHZ1
bGthbi1jdHMgdG8gd29yayB3aXRoDQo+IFZ1bGthbiB2ZXJzaW9uIGdyZWF0ZXIgdGhhbiAxLjMu
IFByZXZpb3VzbHkgYW55IHVua25vd24gVnVsa2FuDQo+IHZlcnNpb25zDQo+IHdpbGwgcmV0dXJu
IDAgd2hlbiB3ZSBhdHRlbXB0IHRvIGxvY2F0ZSB0aGUgbWluaW11bSB2ZXJzaW9uIHdpdGgNCj4g
bWluVnVsa2FuQVBJVmVyc2lvbi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFJhbmRvbHBoIFNhcHAg
PHJzQHRpLmNvbT4NCj4gLS0tDQo+IMKgLi4uZS1DVFMtd2l0aC11bmtub3duLXZlcnNpb25zLW9m
LVZ1bGthLnBhdGNoIHwgNDENCj4gKysrKysrKysrKysrKysrKysrKw0KPiDCoC4uLi92ay1nbC1j
dHMvdnVsa2FuLWN0c18xLjMuNy4zLmJiwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDEgKw0KPiDC
oDIgZmlsZXMgY2hhbmdlZCwgNDIgaW5zZXJ0aW9ucygrKQ0KPiDCoGNyZWF0ZSBtb2RlIDEwMDY0
NCBtZXRhLW9lL3JlY2lwZXMtZ3JhcGhpY3MvdmstZ2wtY3RzL3Z1bGthbi0NCj4gY3RzLzAwMDEt
QWxsb3ctcnVubmluZy10aGUtQ1RTLXdpdGgtdW5rbm93bi12ZXJzaW9ucy1vZi1WdWxrYS5wYXRj
aA0KPiANCj4gZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1ncmFwaGljcy92ay1nbC1jdHMv
dnVsa2FuLWN0cy8wMDAxLQ0KPiBBbGxvdy1ydW5uaW5nLXRoZS1DVFMtd2l0aC11bmtub3duLXZl
cnNpb25zLW9mLVZ1bGthLnBhdGNoIGIvbWV0YS0NCj4gb2UvcmVjaXBlcy1ncmFwaGljcy92ay1n
bC1jdHMvdnVsa2FuLWN0cy8wMDAxLUFsbG93LXJ1bm5pbmctdGhlLUNUUy0NCj4gd2l0aC11bmtu
b3duLXZlcnNpb25zLW9mLVZ1bGthLnBhdGNoDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGlu
ZGV4IDAwMDAwMDAwMDAuLjI3OTdhY2Y0MTYNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9tZXRh
LW9lL3JlY2lwZXMtZ3JhcGhpY3MvdmstZ2wtY3RzL3Z1bGthbi1jdHMvMDAwMS1BbGxvdy0NCj4g
cnVubmluZy10aGUtQ1RTLXdpdGgtdW5rbm93bi12ZXJzaW9ucy1vZi1WdWxrYS5wYXRjaA0KPiBA
QCAtMCwwICsxLDQxIEBADQo+ICtGcm9tIDk1NGI1MjNhOTk4OTMzYjFlZGJlOWFmM2ZlN2IxYzc0
NTk1Y2YxNDggTW9uIFNlcCAxNyAwMDowMDowMA0KPiAyMDAxDQo+ICtGcm9tOiBMb3JlbnpvIERh
bCBDb2wgPGxvcmVuem9Aa2hyb25vc2dyb3VwLm9yZz4NCj4gK0RhdGU6IFR1ZSwgMTcgU2VwIDIw
MjQgMTc6MTg6MjAgKzAyMDANCj4gK1N1YmplY3Q6IFtQQVRDSF0gQWxsb3cgcnVubmluZyB0aGUg
Q1RTIHdpdGggdW5rbm93biB2ZXJzaW9ucyBvZg0KPiBWdWxrYW4gaW4gdGhlDQo+ICsgZHJpdmVy
DQo+ICsNCj4gK1RoaXMgd2lsbCBkZWZhdWx0IHRvIFZLX0FQSV9NQVhfRlJBTUVXT1JLX1ZFUlNJ
T04sIHdoaWNoIGF0IHRoaXMNCj4gdGltZSBpcyAxLjMueC4NCj4gK1ZLLUdMLUNUUyBpc3N1ZTog
NTE2NQ0KPiArQ29tcG9uZW50czogRnJhbWV3b3JrLCBWdWxrYW4NCj4gK0FmZmVjdHM6IE5vbmUN
Cj4gKw0KPiArQ2hhbmdlLUlkOiBJOTU0ZDAxNDRkYjlmZjVmMzg0OGM4MWRmNjFkZDI2MzUwNWIx
N2FjMg0KPiArVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydA0KPiBbaHR0cHM6Ly9naXRodWIuY29t
L0tocm9ub3NHcm91cC9WSy1HTC1DVFMvY29tbWl0LzYwOWMwOWIzMTYzZDg2ZDdlNDgNCj4gMTlm
YmZjMDBhNjE2ZTM2NGYxNGYwXQ0KDQpJdCBsb29rcyBsaWtlIHRoaXMgd2lsbCBiZSBuZWVkZWQg
Zm9yIHdhbG5hc2NhciBhcyB3ZWxsLg0KDQpUaGFua3MsDQoNCkFudWoNCg0KPiArU2lnbmVkLW9m
Zi1ieTogUmFuZG9scGggU2FwcCA8cnNAdGkuY29tPg0KPiArLS0tDQo+ICsgZXh0ZXJuYWwvdnVs
a2FuY3RzL2ZyYW1ld29yay92dWxrYW4vdmtBcGlWZXJzaW9uLmNwcCB8IDkgKysrKysrKystDQo+
ICsgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiArDQo+
ICtkaWZmIC0tZ2l0IGEvZXh0ZXJuYWwvdnVsa2FuY3RzL2ZyYW1ld29yay92dWxrYW4vdmtBcGlW
ZXJzaW9uLmNwcA0KPiBiL2V4dGVybmFsL3Z1bGthbmN0cy9mcmFtZXdvcmsvdnVsa2FuL3ZrQXBp
VmVyc2lvbi5jcHANCj4gK2luZGV4IGQ5OTZjYjBlNi4uODcyMGRmNTJhIDEwMDY0NA0KPiArLS0t
IGEvZXh0ZXJuYWwvdnVsa2FuY3RzL2ZyYW1ld29yay92dWxrYW4vdmtBcGlWZXJzaW9uLmNwcA0K
PiArKysrIGIvZXh0ZXJuYWwvdnVsa2FuY3RzL2ZyYW1ld29yay92dWxrYW4vdmtBcGlWZXJzaW9u
LmNwcA0KPiArQEAgLTEzNCw3ICsxMzQsMTQgQEAgZGVVaW50MzIgbWluVnVsa2FuQVBJVmVyc2lv
bihkZVVpbnQzMiBsaHMsDQo+IGRlVWludDMyIHJocykNCj4gK8KgCWZvciAoYXV0byBpdCA9IGJl
Z2luKGNvbW1vblByZWRlY2Vzc29ycyk7IGl0ICE9DQo+IGVuZChjb21tb25QcmVkZWNlc3NvcnMp
OyArK2l0KQ0KPiArwqAJCWlmIChpc0FwaVZlcnNpb25QcmVkZWNlc3NvcihyaHMsICppdCkgJiYN
Cj4gaXNBcGlWZXJzaW9uUHJlZGVjZXNzb3IobGhzLCAqaXQpKQ0KPiArwqAJCQlyZXR1cm4gKml0
Ow0KPiArLQlyZXR1cm4gMDsNCj4gKysNCj4gKysjaWZuZGVmIENUU19VU0VTX1ZVTEtBTlNDDQo+
ICsrwqDCoMKgIC8vIElmIHdlIGdvdCB0byB0aGlzIHBvaW50LCBpdCBtZWFucyB3ZSBhcmUgZGVh
bGluZyB3aXRoIGFuDQo+IHVua25vd24gdmVyc2lvbi4NCj4gKyvCoMKgwqAgLy8gV2UgYXNzdW1l
IGl0IHRvIGJlIHZhbGlkLCBhbmQgd2UgZGVmYXVsdCB0bw0KPiBWS19BUElfTUFYX0ZSQU1FV09S
S19WRVJTSU9OIHdoaWNoIGlzIGdlbmVyYXRlZCBmcm9tIHRoZSBzcGVjLg0KPiArK8KgwqDCoCBy
ZXR1cm4gVktfQVBJX01BWF9GUkFNRVdPUktfVkVSU0lPTjsNCj4gKysjZWxzZQ0KPiArK8KgwqDC
oCByZXR1cm4gVktTQ19BUElfTUFYX0ZSQU1FV09SS19WRVJTSU9OOw0KPiArKyNlbmRpZg0KPiAr
IH0NCj4gKyANCj4gKyB9IC8vIHZrDQo+ICstLSANCj4gKzIuNTAuMQ0KPiArDQo+IGRpZmYgLS1n
aXQgYS9tZXRhLW9lL3JlY2lwZXMtZ3JhcGhpY3MvdmstZ2wtY3RzL3Z1bGthbi1jdHNfMS4zLjcu
My5iYg0KPiBiL21ldGEtb2UvcmVjaXBlcy1ncmFwaGljcy92ay1nbC1jdHMvdnVsa2FuLWN0c18x
LjMuNy4zLmJiDQo+IGluZGV4IDc0OTJmZTlhYTQuLmNjODA1NDllZWIgMTAwNjQ0DQo+IC0tLSBh
L21ldGEtb2UvcmVjaXBlcy1ncmFwaGljcy92ay1nbC1jdHMvdnVsa2FuLWN0c18xLjMuNy4zLmJi
DQo+ICsrKyBiL21ldGEtb2UvcmVjaXBlcy1ncmFwaGljcy92ay1nbC1jdHMvdnVsa2FuLWN0c18x
LjMuNy4zLmJiDQo+IEBAIC0xOSw2ICsxOSw3IEBAIFNSQ1JFVl92aWRlby1wYXJzZXIgPQ0KPiAi
MTM4YmJlMDQ4MjIxZDMxNTk2MmRkZjg0MTNhYTZhMDhjYzYyYTM4MSINCj4gwqANCj4gwqBTUkNf
VVJJICs9DQo+ICJmaWxlOi8vMDAwMS1jbWFrZS1EZWZpbmUtV0FZTEFORF9TQ0FOTkVSLWFuZC1X
QVlMQU5EX1BST1RPQ09MU19ELnBhdA0KPiBjaMKgXA0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgZmlsZTovLzAwMDEtdnVsa2FuLWN0cy1pbmNsdWRlLW1pc3NpbmctY3N0ZGludC5wYXRjaMKg
XA0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoA0KPiBmaWxlOi8vMDAwMS1BbGxvdy1ydW5uaW5n
LXRoZS1DVFMtd2l0aC11bmtub3duLXZlcnNpb25zLW9mLVZ1bGthLnBhdGNoDQo+IMKgXA0KPiDC
oCINCj4gwqANCj4gwqBUT09MQ0hBSU4gPSAiZ2NjIg0KPiANCj4gLT0tPS09LT0tPS09LT0tPS09
LT0tPS0NCj4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3Jv
dXAuDQo+IFZpZXcvUmVwbHkgT25saW5lICgjMTE4ODkzKToNCj4gaHR0cHM6Ly9saXN0cy5vcGVu
ZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWRldmVsL21lc3NhZ2UvMTE4ODkzDQo+IE11dGUg
VGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210LzExNDU2ODk0Ni8z
NjE2NzAyDQo+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtZGV2ZWwrb3duZXJAbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZw0KPiBVbnN1YnNjcmliZToNCj4gaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRk
ZWQub3JnL2cvb3BlbmVtYmVkZGVkLWRldmVsL3Vuc3ViwqBbDQo+IGFudWoubWl0dGFsQGludGVs
LmNvbV0NCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCg==


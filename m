Return-Path: <karn.jye.lau@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B70FCA0EE4
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 09:21:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by mx.groups.io with SMTP id smtpd.web11.7856.1755249666936186960
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Aug 2025 02:21:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=N7osv2Ds;
 spf=pass (domain: intel.com, ip: 198.175.65.9, mailfrom: karn.jye.lau@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755249667; x=1786785667;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Z0ZHxoiIqdvxKqCb9Kklw/X5eNRGzq3+5scyvCSLn10=;
  b=N7osv2DsLbPrO8RtjvkCnDTZBPLY9d9xz7WIG2Jzh7Kt5+LJlkLx2m4Y
   cM6Mypv/+ItzgSuHnld/MbiQY2cHXGaRTi3nhG8C1aOz5hTaNRBCkBmoC
   3YmJ8fi7qUH+nsKJo3lPTQYs08Yfgh36thVWko8sSZX/ABgDev893Ui8C
   NmbZF48Env/QtlPQTZ3D1TGI+ekRwNjZpNgByBkZcVJRdEWTS/4ufq/A4
   p5bRyHFl9VMzwYZOv2n/qXbM+c9HZ5ekC8CC7PANV/4lnxoovCblaojMd
   BuqVXKl4xI7B8uVj2rrBbpEnR2SK4yAqYTgXZ5EnpAvOqLuW2yr6XHmVy
   Q==;
X-CSE-ConnectionGUID: HchxFS4JRBSBm3yHBbyOwg==
X-CSE-MsgGUID: vgqvHES9R5Khjyo38B4owA==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="80153097"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="80153097"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 02:21:06 -0700
X-CSE-ConnectionGUID: bCbeXJDfQeW1c0caxeDWGg==
X-CSE-MsgGUID: cmnzvYOdTX6bzOrswXrClg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="197828324"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 02:21:06 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 15 Aug 2025 02:21:05 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 15 Aug 2025 02:21:05 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.58)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 15 Aug 2025 02:21:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IvSUx0t8+Movbuewu/+HeXLqeVC8ItJNdWY06S89W/dMgJb7W0gq1xrcQTE6GFYsJxgyejCNb7lcS1nFhTMVCJDKScVcaMgf5v45JoBWQyloWpJ2+ng10clwtlvpYzGtwhXKgcsouXcs3u9ggC4wJqP1Ot2qEEqe55TiYwpyIM55SaVnepTG+4OJPgyl8FIK//7wmb032LSPltMmx7E7bksSVhtc5bbnBYpTKQX7DZURbsbwf6PLO7DcQ3WdhbmUJwXIcwQL3PeDfEwqUm7MsR9k5f1pa4ehuwJWY1UMweG3OepBPzO7rNb0KpAf9d29w421SGb3IcZZAraJd5qHZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z0ZHxoiIqdvxKqCb9Kklw/X5eNRGzq3+5scyvCSLn10=;
 b=oxTtY2/stUlyFumseH7xl6ZBjVtrEjHJ/IV6bHq611KnS/RvoUKbV6ff7ktgVlHfpqu2atH6zOl+CfO7yqBAW/PtzQwOcx0k9oOSm8gryqFvnA2Xgt1ZdT5gsZgnXW7dPczU909Eup2HnwaHwgJA1U7mX+5cclJRdRKqc+bLT8lljXAo6MwcUoOFYubo4S8sTboutZGF236T3bCHRbhQ8JRcHdXioZQlObQs8XL89rdg2HfBqtwfmBp8NdjkJXbYXhodURymemxpIuZxIi15sj5QnWaK++qljXCkEmWEgP0c1NzkOo4NWWphyDcyLoRQsVVSAoMEaUcVC/D/6lX8Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV8PR11MB8699.namprd11.prod.outlook.com (2603:10b6:408:1ff::9)
 by MN0PR11MB6184.namprd11.prod.outlook.com (2603:10b6:208:3c4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Fri, 15 Aug
 2025 09:21:03 +0000
Received: from LV8PR11MB8699.namprd11.prod.outlook.com
 ([fe80::a55b:8e18:7f64:b977]) by LV8PR11MB8699.namprd11.prod.outlook.com
 ([fe80::a55b:8e18:7f64:b977%6]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 09:21:03 +0000
From: "Lau, Karn Jye" <karn.jye.lau@intel.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>, "peter.marko@siemens.com"
	<peter.marko@siemens.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-networking][scarthgap][PATCH] mbedtls: fix git fetcher
 conflict by using SRC_URI.
Thread-Topic: [oe] [meta-networking][scarthgap][PATCH] mbedtls: fix git
 fetcher conflict by using SRC_URI.
Thread-Index: AQHcDZsLPP8TZUoOrk+X1krjohD77LRjNfGAgAAEpGCAAACpEIAAIPQggAAQygCAAADToA==
Date: Fri, 15 Aug 2025 09:21:02 +0000
Message-ID: <LV8PR11MB8699B8D2F8167A3F836B80F5D734A@LV8PR11MB8699.namprd11.prod.outlook.com>
References: <20250815041114.481650-1-karn.jye.lau@intel.com>
 <AS1PR10MB569789D04BA92FFBEBDCB664FD34A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <CH3PR11MB870248A4F751C67B94D9E7D0D734A@CH3PR11MB8702.namprd11.prod.outlook.com>
 <AS1PR10MB5697355DC7874A906AB2E20EFD34A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <AS1PR10MB5697DACCAF2B06BE08BF72ACFD34A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <CANNYZj9bSkBW1DRgHe8JDvYxgsfjowYCAg8RCyxSi6pVtwhJXA@mail.gmail.com>
In-Reply-To: <CANNYZj9bSkBW1DRgHe8JDvYxgsfjowYCAg8RCyxSi6pVtwhJXA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV8PR11MB8699:EE_|MN0PR11MB6184:EE_
x-ms-office365-filtering-correlation-id: 28432b0c-2998-4181-97e5-08dddbdd0e5d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|4022899009|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RlA3VEY4R1prUTY3R1JCYzhWc0FqLzdGN1h2dDdVRDNMbzlOWEE4SldpWkcx?=
 =?utf-8?B?Nkk0bzNEMCtDY2hiZzdLU3BRcmpQM2p6b2tVeU9WL1NSU3RoY3hkWGlnWURY?=
 =?utf-8?B?YmdqSWwwbG1IYmhvUzloMU5Xc3E4dkdZVHk2c1c5TXdIMVltUHVaNjRodURT?=
 =?utf-8?B?Nm1TNTN1Z3MvalpPbVpwakFpOVBwWUJ6eVgwbGtXVmNoRDhBSDc3cmJ0VHBs?=
 =?utf-8?B?d2xrNnR1S2h3RTZWYkhveTB0VmloaDU1ZGM5d0hpRjBWT0ViT0VOM1QwWXk2?=
 =?utf-8?B?Sndya0tBSTY1UzFwOFU0VWswWGsvMXRWR2c5VFFobUpLd3FvNTNEQnFrSEtU?=
 =?utf-8?B?bG1URFc5b3hqSnVuNlNDQmlvWFBCOXQxWjBPQ0NQSEViUnFyMFg0RlUrd1lG?=
 =?utf-8?B?SkhpNEVUblhCbnk2ampzYWhLcGdwMnk3T1pNaW1wVEtOUUtLTU13c0xRUmhu?=
 =?utf-8?B?aHA1cnJJaVdiT2pRRm9CYXdoQ1MyZHNaL0x2T0E1MzhnbkNMNmw0V25xa1Ny?=
 =?utf-8?B?MzFKeUp6NW9OVmU5QzJKQ2l1bmNkNUIrSjd3ZXcwQ0MzMzgzR09kdFE5a2ts?=
 =?utf-8?B?RkxjemYxaFJnU00wVXZXRllXNmNWUmMvQWJ5RjkzWDJHQzYxOVhLU2hTTW96?=
 =?utf-8?B?M0lPZWxaWSt3RllWMWNxZ3VTN2dzaUd2cWdYcCtTbUZ6VVJENWpXWGRJRHk3?=
 =?utf-8?B?OTR4YmQxUnVnclFnUkN3WFZuU0pybDY4RnZyZHhTYnlibFVEZkJvMDhDaEpZ?=
 =?utf-8?B?cnFpZnNGRXZBc2tWUW5LaU5IaWdLSnJoOFBGZFVUbHlTVzJHTnhKSm5kVGNl?=
 =?utf-8?B?SDJCbzRGRGQvSElBQS9iQjBnRFNKQnNFS1FpY0dldWRGUGd4cnVDQjlkL0g3?=
 =?utf-8?B?K2I4TEhVcXNqanZKdXl5ajJYcUdQUXAwTEs0QytMWkU1bWhYVEpYRmhKL0dN?=
 =?utf-8?B?QThmS0Q0R3BtSmRJc1RhaDNhbG8rd3JqZzViRzhTVjd4VlhoaWFxVit4YlVl?=
 =?utf-8?B?OTlTSWNUYlhRcEN4VUhPcEhsUStIcVJEMTUzc2pmdmpweklSYmpBSFVQM3ll?=
 =?utf-8?B?QTRTZWZwM1h1NzcvNGFHZWx0b1lTdmcwbXFlYmFWYlYzR3ZwTjhISHRtUWhE?=
 =?utf-8?B?VTZqK1cvWnNMQ21zdWV4UzNhSi9FRDZWRXFQRVFuclVHMHhrcUU5VHhwMm5a?=
 =?utf-8?B?d09FOEdKZUwzTVRQeVVLUmhDWXFvemJtT1lnVkUvUkxRdmxNVmhxbzgyeDAy?=
 =?utf-8?B?dDZRQnhwN3R1bEFPZCtpM1pzcjVFbFdIbG9MakR1T1ZXSkUrTlgyNUMzZ2F6?=
 =?utf-8?B?a2xZb1lzTEpnZm52V25YejVhNGRVL0hZSHFnSTd0eEpNY3hPdHFPdW1hOWJO?=
 =?utf-8?B?Tnh5MThuOUcvQkNYU3pVSnljcXVQNkZrS1g3Z2lXbjU5ODhzMDc3YUIxU09k?=
 =?utf-8?B?c1E5MFUrQ1l6bFJBL3hzRXhaU3BIeEFodUtNUFAwQ0dpY3dvQnppdEpTT1p6?=
 =?utf-8?B?dFQ3SHMwQ0V2RU13SDYvQlFxZVB2K2hOZ3c3cHBseXRCTFBPb2FZQlFaUDhK?=
 =?utf-8?B?eVMyL3pqMTByeTFjaGFMQUJ2YTZwd0dSdFZiZGE5MlhLR3huWDFnOFFpTHRN?=
 =?utf-8?B?ZGtzRnRYemlyRWN2QVNHU2hsOGxXVG9QVkFyVHI1aWJEWmhVZ2lFK2todzRo?=
 =?utf-8?B?WXQ4UFZ4bFppRnppWlRoRXhJcDJJWndYRldmU0lIYUpmdnlpWGhSZjJTRkph?=
 =?utf-8?B?enJmMlAzWVNaZ2Exa2dLMDhZVnJTS0Zyb2NHclZrR0dTeGNPTTNlQUFSd0tW?=
 =?utf-8?B?d2J6bDh1R0RDYWg0eTUvN1Z5V2x6aHZGMTBmL2kxcWp3aUpRMnZOYjFFRWpu?=
 =?utf-8?B?RFpJNUs5Tmx2M1BaUW5FSXZWUnZhL1A3NEZRQUJGWm92TzdMNnp0OENjVTNP?=
 =?utf-8?Q?ijqI1JQKz7AyUsTwZ2TncegiJEavWrdm?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR11MB8699.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(4022899009)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dGw1T2ZKcEN2cndZKy9zUVVMWVVzNFU1ZndCY3RKeWgvNEFJTFYwK2pVQ3JF?=
 =?utf-8?B?WVN4Z1RPdkIwSDJJRDZsamoxbkx3RnVpS2VFT0o3MmRPZlBYcEtUT3pLNWtp?=
 =?utf-8?B?cDBOWUY3QnNqaDIvUk0vMyt1YW1PbDd5V3l0N3ZFUFpLR0FOdTV5U04yS2NY?=
 =?utf-8?B?UEdLc0ZCak1vSkZERjR6U21jRllhb202QW1HQU41c2grUzdZRXhDeXd6QlFQ?=
 =?utf-8?B?UDZnNnl5blJEV2Nzb1lmZUhDM2plMWxWbnUrQ3ZDeWtkZWI1cERiaFJ1SnJO?=
 =?utf-8?B?Uk83TUQ3TU1URVNsemZDckhPY2EweEdBTGdwTUJPRzNwN2x4cTg2UE1LeFRN?=
 =?utf-8?B?enJWdnZDNGM5MHZXakZkTEJZM0p0Rkc1SlZGRU5wV0lDYnNNZ2hNcTcwOVVi?=
 =?utf-8?B?UG1BbmVabkU4Zi9yT0Q0eTJWTWF5OUhzSWxjUzlaMzdEa3VGUnludTFXQUNG?=
 =?utf-8?B?V25TNmVhbzhTaGJZazdHWmM4cStIODVYVnF4U2JiL1duNTFETHRWd0dGRGkv?=
 =?utf-8?B?S09Sa1I0RUUzQWhVYkpIS010b1hBUVEzMlNLcjRzcUtDM0pZKzZoWVF1Q1Vq?=
 =?utf-8?B?WTZ0eDBTdE5YM05lZ0NpRTVwUmw0dDBBSDVMbTNwaEF5eG01emgvZXhKSGFE?=
 =?utf-8?B?Ym9tdE1oaXYwRUJiVU03THQxenpaM1UvS0hTM1BxakNrSkVDM245R2JlZmFQ?=
 =?utf-8?B?TXcxcE01RjNrdklOSUZkV2lrTEVHQjl2L1NBMGNPRUV5WkpHMHd5SHAwYmJG?=
 =?utf-8?B?ckdFZnYyNWEyOE41R214YTdTNVZkNTJVeFlwYXluc3IycmVNL2NnTmUraW1M?=
 =?utf-8?B?VE5sK2FZcmw0dFRVYlJYdjAzVndvNkV6Nm5iWDhwMWJZWUlsQXEyOXFndjZY?=
 =?utf-8?B?TU9zRGJySVVoR3dIQ1hjS21uc1ZRb3dUb2tLWlU3ZDVOZUhvS2Qrc0lTR2or?=
 =?utf-8?B?R3BYNGlkYW41L3psc2NSeXUwbUhDZGJkZTZlT0ZUUkQva3BYTkRzbmVJUTNz?=
 =?utf-8?B?WXFCektKZGhxMlRkTHBtWWo3TERRTVhXRXJ3VDl3eWJKYnJYRVE2WEZhSXVR?=
 =?utf-8?B?d253QnQyQnhGMXlZeTVGZmt6NFhFRnA5S0JtOHlhbUdwd1pTSmZBRmFDWTZJ?=
 =?utf-8?B?bG9DMXlmaFRYaldQYzRYcWlYVUNBSGlrNGFOWjlCWFVGWEdDaXpKMzlxWk40?=
 =?utf-8?B?S1hGQUUxNXhsSUVGUlIyb3dpVDFQY1NMdXY2Umx5N2ttZk1SQTNHYTF0WEJN?=
 =?utf-8?B?UGxvYXgzMVVVa0lpSks4RHloVDRsSnhhRVFDUEo3YTVKYThsNzRVNnF1VnFx?=
 =?utf-8?B?ZGdmOWFmdG9jWEpDZEcxbG5MS3V4a0dxTmwzYkZmUWpTNnZvQ3N3TzRRQi9i?=
 =?utf-8?B?c3JpVDVDSXI1cDdqN0ljbVlCZVFzYm9JWFkzdjBJbEJRZmR2aFhVZGRTODBG?=
 =?utf-8?B?L3RGK1ZlZjI3VUYyakNGTkNJOEtXOGQwd3VFYXhxdXM5eU9SdFBuUlZhams5?=
 =?utf-8?B?UHQ2bE1aL2ZJVnpoQmIzOS9OSTMxaFpxdHRYb2hmRTUwSForRTZ1VWErWm9I?=
 =?utf-8?B?YTlwc1hwVVA1Q24zZ1c0bjRFVHFKYUdxOGhRQ3pIR3oyd243aldOUWRzU1p2?=
 =?utf-8?B?YWdBVVp4U1lKd3g5MExyb0NhSUo4SE04Ukt1UXN2Vnh5cmowblJPUUh5NmhX?=
 =?utf-8?B?TitnVXpKbm5KQnlHRjk1QzBoZFFWVkR3VjBOQlJYakRTZnVIaWlsa3JKbW5h?=
 =?utf-8?B?bWhwOTFmeEs4MGd0UkUzNDhRZG9CbjlpTVR2WTM3WFN6ekkyTk9Hby9rUzFk?=
 =?utf-8?B?di9MLytJUGNTUzQzaS9FVmtyVmpYWXd6T1RXamNGY3NRZjlhSzljSEZ5eU5Y?=
 =?utf-8?B?NWw2SHdVNUNXZldnYlVTZlhTK2FJT1psQzlnTUVSc2lEbDc3NHJyQmg4VEda?=
 =?utf-8?B?YjJLMEI5c01GMGZwMnE2L0R0eXI2WDlYVzdmMUZ2Q1pHTVlPNXlnOEY3dkhV?=
 =?utf-8?B?RzNzc2FLUjZHWjMrOGlkL2ZGL0NUYjlnSUNGWmpvenltQjc1VDViRnRybmVM?=
 =?utf-8?B?OTY3MDNjSHFlNndQQzhoeC93SjFnTElQdFFvclBKdnloOC9lL1I1ZXJ4SHF3?=
 =?utf-8?Q?+lbK688sa0Y05VE4WXjaY3Tk1?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8699.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28432b0c-2998-4181-97e5-08dddbdd0e5d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2025 09:21:03.1261
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MxTHHHuYjDyBmazCdhIzHZ+QSxmSJSuJ6D5k6kUxg1meT6t1j5V+O5X+VmlwQnsR58SsV/3XGwChwLbht5VtGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6184
X-OriginatorOrg: intel.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Aug 2025 09:21:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118964

SGkgQWxleCwgaGVyZSB0aGUgY2hhbmdlcyANCg0KaHR0cHM6Ly9naXRodWIuY29tL29wZW5lbWJl
ZGRlZC9tZXRhLW9wZW5lbWJlZGRlZC9jb21taXQvNmRlZGVhNDI2MjAzMzI5ODdkOTIwNDRhN2U4
YzhlODVmYTA3YzEwNw0Kd2hlbiB0aGlzIGNoYW5nZXMgd2FzIG1ha2UsIHNjYXJ0aGdhcCAgYWxy
ZWFkeSB1bmJ1aWxkYWJsZSANCnVuZm9ydHVuYXRlbHkgaXQgZ2V0IGJ1bXAgZnVydGhlciB0byB2
ZXJzaW9uIDMuNi40IHJlZ2FyZGxlc3MuDQpodHRwczovL2dpdGh1Yi5jb20vb3BlbmVtYmVkZGVk
L21ldGEtb3BlbmVtYmVkZGVkL2NvbW1pdC8yYzkxMjZiZDBkZDBmNjIwMjFmNWRiMzRkNjk4NDg5
YmI4MTRlYmRhDQoNCktKDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBBbGV4
YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4gDQpTZW50OiBGcmlkYXksIEF1
Z3VzdCAxNSwgMjAyNSA1OjA4IFBNDQpUbzogcGV0ZXIubWFya29Ac2llbWVucy5jb20NCkNjOiBM
YXUsIEthcm4gSnllIDxrYXJuLmp5ZS5sYXVAaW50ZWwuY29tPjsgb3BlbmVtYmVkZGVkLWRldmVs
QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNClN1YmplY3Q6IFJlOiBbb2VdIFttZXRhLW5ldHdvcmtp
bmddW3NjYXJ0aGdhcF1bUEFUQ0hdIG1iZWR0bHM6IGZpeCBnaXQgZmV0Y2hlciBjb25mbGljdCBi
eSB1c2luZyBTUkNfVVJJLg0KDQpJIHdvbmRlciB3aGF0IGNoYW5nZWQgaW4gc2NhcnRoZ2FwIHRo
YXQgdGhpcyBpc3N1ZSBzdWRkZW5seSBhcHBlYXJlZD8NClRoaXMgZG9lcyBuZWVkIHRvIGJlIGV4
cGxhaW5lZCBiZWZvcmUgYW55IHBhdGNoZXMgbGFuZC4NCg0KQWxleA0KDQpPbiBGcmksIDE1IEF1
ZyAyMDI1IGF0IDEwOjA5LCBQZXRlciBNYXJrbyB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8
cGV0ZXIubWFya289c2llbWVucy5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+
DQo+DQo+DQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBNYXJrbywg
UGV0ZXIgKEZUIEQgRVUgU0sgQkZTMSkNCj4gPiBTZW50OiBGcmlkYXksIEF1Z3VzdCAxNSwgMjAy
NSA4OjEyDQo+ID4gVG86IExhdSwgS2FybiBKeWUgPGthcm4uanllLmxhdUBpbnRlbC5jb20+OyBv
cGVuZW1iZWRkZWQtIA0KPiA+IGRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiBTdWJq
ZWN0OiBSRTogW29lXSBbbWV0YS1uZXR3b3JraW5nXVtzY2FydGhnYXBdW1BBVENIXSBtYmVkdGxz
OiBmaXggDQo+ID4gZ2l0IGZldGNoZXIgY29uZmxpY3QgYnkgdXNpbmcgU1JDX1VSSS4NCj4gPg0K
PiA+IE9vcHMsIHNvcnJ5IGZvciBtaXNzaW5nIHRoZSBzY2FydGhnYXAgdGFnLg0KPiA+IFRoaXMg
aXMgZ29vZCBwYXRjaCwgSSB3b25kZXIgaG93IHRoaXMgZ290IHRocm91Z2ggdGhlIHRlc3Rpbmcu
DQo+ID4NCj4gPiBVbmZvcnR1bmF0ZWx5LCBtZXRhLW9wZW5lbWJlZGRlZCBMVFMgYnJhbmNoZXMg
Z2V0IHVwZGF0ZXMgb25seSBvbmNlIA0KPiA+IGEgbW9udGggc28gdGhpcyB3aWxsIGJlIGJyb2tl
biB0cm91Z2ggdGhlbiBuZXh0IHJlbGVhc2UuDQo+ID4NCj4gPiBQZXRlcg0KPiA+DQo+ID4gPiAt
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogTGF1LCBLYXJuIEp5ZSA8a2Fy
bi5qeWUubGF1QGludGVsLmNvbT4NCj4gPiA+IFNlbnQ6IEZyaWRheSwgQXVndXN0IDE1LCAyMDI1
IDg6MDkNCj4gPiA+IFRvOiBNYXJrbywgUGV0ZXIgKEZUIEQgRVUgU0sgQkZTMSkgPFBldGVyLk1h
cmtvQHNpZW1lbnMuY29tPjsgDQo+ID4gPiBvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZw0KPiA+ID4gU3ViamVjdDogUkU6IFtvZV0gW21ldGEtbmV0d29ya2luZ11bc2Nh
cnRoZ2FwXVtQQVRDSF0gbWJlZHRsczogZml4IA0KPiA+ID4gZ2l0IGZldGNoZXIgY29uZmxpY3Qg
YnkgdXNpbmcgU1JDX1VSSS4NCj4gPiA+DQo+ID4gPiBIaSBQZXRlciwgaXQgbWF5IHdvcmtpbmcg
ZmluZSBpbiBtYXN0ZXIgYnJhbmNoIGJ1dCBpdCBub3Qgd29ya2luZyANCj4gPiA+IGF0IGFsbCBh
dCBMVFMgYnJhbmNoIGZvciBleGFtcGxlIHlvY3RvIDUuMCBzY2FyZ2FwdGgsIEkNCj4gPiBvYnNl
cnZpbmcNCj4gPiA+IG91ciBkYWlseSBidWlsZCBoaXQgaW50byB0aGlzIGlzc3VlLg0KPiA+ID4g
VGh1cyBzdWJtaXR0aW5nIHRoaXMgcGF0Y2gNCj4gPiA+DQo+ID4gPiBLSg0KPiA+ID4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IE1hcmtvLCBQZXRlciA8UGV0ZXIuTWFy
a29Ac2llbWVucy5jb20+DQo+ID4gPiBTZW50OiBGcmlkYXksIEF1Z3VzdCAxNSwgMjAyNSAxOjUz
IFBNDQo+ID4gPiBUbzogTGF1LCBLYXJuIEp5ZSA8a2Fybi5qeWUubGF1QGludGVsLmNvbT47IG9w
ZW5lbWJlZGRlZC0gDQo+ID4gPiBkZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4gPiBT
dWJqZWN0OiBSRTogW29lXSBbbWV0YS1uZXR3b3JraW5nXVtzY2FydGhnYXBdW1BBVENIXSBtYmVk
dGxzOiBmaXggDQo+ID4gPiBnaXQgZmV0Y2hlciBjb25mbGljdCBieSB1c2luZyBTUkNfVVJJLg0K
PiA+ID4NCj4gPiA+IEJvdGggdGFnIGFuZCBTUlZSRVYgd29ya3Mgd2l0aCBsYXRlc3Qgb2UtY29y
ZS9wb2t5IG1hc3Rlci4NCj4gPiA+IEFuZCBpcyBhY3R1YWxseSBlbmNvdXJhZ2VkIHRvIGJlIHVz
ZWQgc28gdGhhdCBoYXNoIGlzIHZlcmlmaWVkIGFnYWluc3QgdGhlIHRhZy4NCj4gPiA+DQo+ID4g
PiBJIHdvbmRlciB3aGF0IGNvdWxkIGJlIHdyb25nIHNpbmNlIHRoaXMgaXMgYSBzZWNvbmQgcGF0
Y2ggZm9yIHRoaXMgDQo+ID4gPiByZWNpcGUgY29tcGxhaW5pbmcgYWJvdXQgZXJyb3JzLg0KPiA+
ID4NCj4gPiA+IFBldGVyDQo+ID4gPg0KPiA+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KPiA+ID4gPiBGcm9tOiBvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9y
ZyA8b3BlbmVtYmVkZGVkLSANCj4gPiA+ID4gZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4g
T24gQmVoYWxmIE9mIExhdSwgS2FybiBKeWUgdmlhIA0KPiA+ID4gPiBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnDQo+ID4gPiA+IFNlbnQ6IEZyaWRheSwgQXVndXN0IDE1LCAyMDI1IDY6MTENCj4gPiA+
ID4gVG86IG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4gPiA+
IFN1YmplY3Q6IFtvZV0gW21ldGEtbmV0d29ya2luZ11bc2NhcnRoZ2FwXVtQQVRDSF0gbWJlZHRs
czogZml4IA0KPiA+ID4gPiBnaXQgZmV0Y2hlciBjb25mbGljdCBieSB1c2luZyBTUkNfVVJJLg0K
PiA+ID4gPg0KPiA+ID4gPiBGcm9tOiBramxhdTAxMTIgPGthcm4uanllLmxhdUBpbnRlbC5jb20+
DQo+ID4gPiA+DQo+ID4gPiA+IGlmIGJvdGggU1JDX1VSSSAmIFNSQ1JFViBzcGVjaWZ5IHBhcnRp
Y3VsYXIgc291cmNlIHJldmlzaW9uIHdpbGwgDQo+ID4gPiA+IGxlYWQgdG8gIkZpeCBGZXRjaGVy
IGZhaWx1cmU6IENvbmZsaWN0aW5nIHJldmlzaW9ucyBlcnJvciINCj4gPiA+ID4NCj4gPiA+ID4g
Rml4IGJ5IHJlbW92aW5nIFNSQ1JFViBhbmQgc3BlY2lmeSBleHBlY3RlZCBzb3VyY2UgcmV2aXNp
b24gaW4gDQo+ID4gPiA+IFNSQ19VUkkgYnkgYWRkaW5nIHJldmlzaW9uIHBhcm1hdGVyLg0KPiA+
ID4gPg0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBramxhdTAxMTIgPGthcm4uanllLmxhdUBpbnRl
bC5jb20+DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiAgbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtY29u
bmVjdGl2aXR5L21iZWR0bHMvbWJlZHRsc18zLjYuNC5iYiB8IA0KPiA+ID4gPiA0DQo+ID4gPiA+
ICstLS0NCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlv
bnMoLSkNCj4gPiA+ID4NCj4gPiA+ID4gZGlmZiAtLWdpdA0KPiA+ID4gPiBhL21ldGEtbmV0d29y
a2luZy9yZWNpcGVzLWNvbm5lY3Rpdml0eS9tYmVkdGxzL21iZWR0bHNfMy42LjQuYmINCj4gPiA+
ID4gYi9tZXRhLSBuZXR3b3JraW5nL3JlY2lwZXMtY29ubmVjdGl2aXR5L21iZWR0bHMvbWJlZHRs
c18zLjYuNC5iYg0KPiA+ID4gPiBpbmRleCA4OGI1MGE0MDYuLjI1OTFlMmNkZSAxMDA2NDQNCj4g
PiA+ID4gLS0tIA0KPiA+ID4gPiBhL21ldGEtbmV0d29ya2luZy9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9tYmVkdGxzL21iZWR0bHNfMy42LjQuYmINCj4gPiA+ID4gKysrIGIvbWV0YS1uZXR3b3JraW5n
L3JlY2lwZXMtY29ubmVjdGl2aXR5L21iZWR0bHMvbWJlZHRsc18zLjYuNA0KPiA+ID4gPiArKysg
LmJiDQo+ID4gPiA+IEBAIC0yMywxMiArMjMsMTAgQEAgTElDX0ZJTEVTX0NIS1NVTSA9IA0KPiA+
ID4gPiAiZmlsZTovL0xJQ0VOU0U7bWQ1PTM3OWQ1ODE5OTM3YTZjMmYxZWYxNjMwZDM0MWUwMjZk
Ig0KPiA+ID4gPiAgU0VDVElPTiA9ICJsaWJzIg0KPiA+ID4gPg0KPiA+ID4gPiAgUyA9ICIke1dP
UktESVJ9L2dpdCINCj4gPiA+ID4gLVNSQ19VUkkgPSAiZ2l0c206Ly9naXRodWIuY29tL01iZWQt
IA0KPiA+ID4gPiBUTFMvbWJlZHRscy5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1iZWR0bHMt
My42O3RhZz12JHtQVn0gXA0KPiA+ID4gPiArU1JDX1VSSSA9ICJnaXRzbTovL2dpdGh1Yi5jb20v
TWJlZC0NCj4gPiA+ID4gVExTL21iZWR0bHMuZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYmVk
dGxzLQ0KPiA+ID4gPiAzLjY7cmV2PWM3NjVjODMxZTVjMmEwOTcxNDEwNjkyZjkyZjdhODFkNmVj
NjVlYzJcDQo+ID4gPiA+ICAgICAgICAgICAgIGZpbGU6Ly9ydW4tcHRlc3QgXA0KPiA+ID4gPiAg
ICAgICAgICAgICAiDQo+ID4gPiA+DQo+ID4gPiA+IC1TUkNSRVYgPSAiYzc2NWM4MzFlNWMyYTA5
NzE0MTA2OTJmOTJmN2E4MWQ2ZWM2NWVjMiINCj4NCj4gQ291bGQgeW91IHBsZWFzZSBrZWVwIHRo
ZSBTUkNSRVYgYW5kIGp1c3QgcmVtb3ZlIHRoZSAiO3RhZz12JHtQVn0iPw0KPiBBZGRpbmcgcmV2
IHRvIFNSQ19VUkkgaXMgbm90IGFjY29yZGluZyB0byBjdXJyZW50IHN0YW5kYXJkcy4NCj4NCj4g
UGV0ZXINCj4NCj4gPiA+ID4gLQ0KPiA+ID4gPiAgVVBTVFJFQU1fQ0hFQ0tfR0lUVEFHUkVHRVgg
PSAidig/UDxwdmVyPlxkKyhcLlxkKykrKSINCj4gPiA+ID4NCj4gPiA+ID4gIGluaGVyaXQgY21h
a2UgdXBkYXRlLWFsdGVybmF0aXZlcyBwdGVzdA0KPiA+ID4gPiAtLQ0KPiA+ID4gPiAyLjM0LjEN
Cj4NCj4NCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gTGlua3M6IFlvdSByZWNlaXZlIGFs
bCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+IFZpZXcvUmVwbHkgT25saW5lICgjMTE4
OTYxKTogDQo+IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1k
ZXZlbC9tZXNzYWdlLzExODk2MQ0KPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZy9tdC8xMTQ3MTMzMDAvMTY4NjQ4OQ0KPiBHcm91cCBPd25lcjogb3BlbmVt
YmVkZGVkLWRldmVsK293bmVyQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gVW5zdWJzY3JpYmU6
IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1kZXZlbC91bnN1
YiANCj4gW2FsZXgua2FuYXZpbkBnbWFpbC5jb21dDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0t
DQo+DQo=


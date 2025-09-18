Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EEBCCAC59A
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 01:58:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by mx.groups.io with SMTP id smtpd.web10.4062.1758160689626460263
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Sep 2025 18:58:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=ciI9YqoA;
 spf=pass (domain: intel.com, ip: 192.198.163.11, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758160690; x=1789696690;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=qhmjXBCQRFfxsLnaQVT1ri9fIwhDffCQp/xMcqgrJ8I=;
  b=ciI9YqoACYVu8dEFJPvABbeLEIdm9gdoucJZsGqA5Izj5I0VmgGIR068
   FQVGz7F/XBuT5wZE1BHYUh3fbzcEIb07oW5GtwpjWNexYcypHhpj5ZR27
   xqilgt5Em7qQFVYpjWBFCc7ORbFAmJdrLxQ/toU2N4U8S/7ytn+GUimGe
   0IblD9BdqSnFHS9+ayypIIZXtXNOokyVElJ+pKBrkSZnEqdSujjt3ZfeS
   D696yu2saF+6kmpYWSDXJWZW8M2NVpax0V+0mYT8lvgbEWVReUEqNStzR
   3ajjX1cWyquPUrvqwXeFh/EA3E2Zyv3bC3QJBoqH0A1/+934fbrBq0JsN
   Q==;
X-CSE-ConnectionGUID: BeNOfcYoSICHkgMXWAClng==
X-CSE-MsgGUID: 9/KB4SfITPeZ4UyHvKCIxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="71111294"
X-IronPort-AV: E=Sophos;i="6.18,273,1751266800"; 
   d="scan'208";a="71111294"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 18:58:09 -0700
X-CSE-ConnectionGUID: AgHrdAUjQh2v/omx7aTSlg==
X-CSE-MsgGUID: R+Q55slmTl61f8vFONuk0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,273,1751266800"; 
   d="scan'208";a="175202035"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 18:58:09 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 17 Sep 2025 18:58:08 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 17 Sep 2025 18:58:08 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.3) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 17 Sep 2025 18:58:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SvT0UM5ZwKJS1UExHAE7cVIp3Lpdpi8/BYA3qimVcUbSPmAskZENCk4vqxMOITnSZB2ucmbyGs1ns2Yb4O6zt8YuqP6eoMORMbXvCS3S8ZnfYXmj5AVAlV5rjjAPAfBIvYXsbikLYcPzriWlV8eYFluIMYTsevSUYBv4ARIQXCXGAb5JWQhYkMfY7TUl9yCotdPgdZRlpr/MmC2R+pIfzy2NGpkxiWlDeg+temv+HwxRhYAXJYfFI6Fq2G5qNNq/mxAq58qikABTySHcx3L+j6xUG7SyEMiKzDFnwW0oJVzLI5PgJ6GHbID5JvPnnBetaNhb4O0sEtx27C3IRyrebA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qhmjXBCQRFfxsLnaQVT1ri9fIwhDffCQp/xMcqgrJ8I=;
 b=x9CBwMuJs0g50OeCl/H37n84jVgWRRTRJHHvRICHcjKKMCDmlV6N6LcLzOW+BkgzEq5IjjGKDHcgpvsoWeTmsaG/004FoLF8gEQCTi+cTLAqXmAWtO0OJuMsUBU8hrmEK9vvaRBhg+KRFunAKHNKoIld6iIfROrIAUo/wJLa5FyX9nhQK5/0NErGvpD5HG6hm5R+H73Tfk8SUlC3hsYife4V2K2jrZTo8PfrolKRi+A/6VJgmEp1FIPA8fPsqbq7Uqrdh5tPbIzpWg7usvzR7tuM3JhqqIrkqu6eVRaCsIBL816F5jbbif6Iw/nuzDXRh7slj9TS7wOv1qtXqlSksA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6430.namprd11.prod.outlook.com (2603:10b6:8:b6::15) by
 PH3PPF6B7063D92.namprd11.prod.outlook.com (2603:10b6:518:1::d2a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Thu, 18 Sep
 2025 01:58:06 +0000
Received: from DM4PR11MB6430.namprd11.prod.outlook.com
 ([fe80::b81:6df0:d8b2:e596]) by DM4PR11MB6430.namprd11.prod.outlook.com
 ([fe80::b81:6df0:d8b2:e596%5]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 01:58:05 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "Haixiao.Yan.CN@windriver.com" <Haixiao.Yan.CN@windriver.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-openembedded][scarthgap][PATCH] python3-posix-ipc: fix
 runtime error
Thread-Topic: [oe] [meta-openembedded][scarthgap][PATCH] python3-posix-ipc:
 fix runtime error
Thread-Index: AQHcJkTSYDABfBGVFUSFnrqUp56uPbSYMs0A
Date: Thu, 18 Sep 2025 01:58:05 +0000
Message-ID: <b94de38809cb28b6cee39ae0f5f9ad980244a2b8.camel@intel.com>
References: <20250915132952.1092546-1-haixiao.yan.cn@windriver.com>
In-Reply-To: <20250915132952.1092546-1-haixiao.yan.cn@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6430:EE_|PH3PPF6B7063D92:EE_
x-ms-office365-filtering-correlation-id: 7fb57ee2-07a1-40f0-aaf8-08ddf656cf01
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|4022899009|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?RzVEM2tOR1lFOUgrZFk0YVdubUh1SXlNQ2JOTnRlZHRZYjBON2JBNEVDVGs3?=
 =?utf-8?B?M2VZNkFrQlBOZDlzR3B0YWR2Q0xKVE0za3ZDYWV6WVBFV0tqeElobTdwc01j?=
 =?utf-8?B?alZQK3RaL3NiUjZLRmhKbVlOSmlPdkI1SjlTdXhxOUVmM2hNM1hsc29ib1p3?=
 =?utf-8?B?cWIwc0tsUXViUUpSemVYNHg1S2xuVDNNSUQ5THgycitHS1FpQjNoUnRlN0hI?=
 =?utf-8?B?UlBmQW1iQ1I3Tk5rT09mUWFEalNoblB5MTRqYjlLL25uT045S3ZOQkFKWmh5?=
 =?utf-8?B?YWNjbHNoVzdmZ2I2b0RMUnpIYWZsdy8xWEpxYVJ3ZTRZendPTGVPeER5Qm9G?=
 =?utf-8?B?NmN5cmRaMklpU3NXRnZhdmlYeDY1VXNBMW83TzBSc1pVM1p6NmxEZXVIdmdp?=
 =?utf-8?B?Mm4zVFo1YUJlb25nRUEzWUtpQStFSldiUkdQVkVEUFJmQVpPK1dKT0pkWjhI?=
 =?utf-8?B?YkVwalRnbG9SSDdRQnU0eGhUUVFHaytMNlhMakRvWjZHVVdQMGZVTVBsdEoz?=
 =?utf-8?B?YWtUVU9QQzFIbExlL1YwRXJmRmpyZ0tKd29wa3VGS1VDaFY2UUJ0dnNHUVRT?=
 =?utf-8?B?b1BiaHo5MU9wWnQvZmQ5Wmk4SW1qVzNDamRzYkRTbTBBSU0rcmdJVE1VcE4z?=
 =?utf-8?B?RUY5aG8xNEpLUG1pSU5PdUlhbTViZmJRb0tocDFaR2FjU2JHaTJHa1B2Mlky?=
 =?utf-8?B?Y2lmUkFkd1dTbDN5TktlL2NvSWkrWUZrOWxuUU1vQllMNC9PcDF4YktUYml3?=
 =?utf-8?B?MDhJbDR6cDlQT2U4emhuOXBaRW1PZSsxWjBsUVhQNTFJWHZEbnEyaWh5NnNZ?=
 =?utf-8?B?L3ZFYXQvZk8zcXlvTi9UZ1Q4R2g3a2xDWVhGNndDeVE4RFluU1lMbG9iZnhi?=
 =?utf-8?B?N1FUdFh6SExjdzZVakRQYmtJZkpxaktlYzVxUUJXQS9tV05lS0JIQlIvaEJa?=
 =?utf-8?B?aFpFVXlNc25iRVYzcEg2dHB0ZGYydlVmQi9iYjViclYremxrT1VKSm4yUTYr?=
 =?utf-8?B?M3ZteTJtVDNXempYMFQwanAzUzUrc1ZiSzV3Slo4NytXSTN2Nlc2OTN5MlF4?=
 =?utf-8?B?ZzM4a0JvSzRXcUl6cnZzSmZkbUxmVXAxY0dJYWdYUXVaL2VCQVFPbTROa1BG?=
 =?utf-8?B?QTZxMXJiSFlOZDR5RDJ3LzE2cENvNGQxQlNsK1RWTDhWajVScFM0NEZTMENp?=
 =?utf-8?B?aVliajY4SkoxZjR0Yk03YndyZlpodFRqNVlHUC9kQUdZNTJzQmp3amNCK0kz?=
 =?utf-8?B?bC9LR2h3bXJSOE10d2FtM3FDTUhmcUd2dmhmdnpRbmRNRCtndE5mWGMzM2Ew?=
 =?utf-8?B?cjVZNzBqNjRhbnJzVUN3czNOczJFRmRydUIwVVBnK1ZtaWVwMVYxRUgxQTl3?=
 =?utf-8?B?cUdTMDZKSWlTajdWSzR4Lzh2aitVQ21HRnNSdUNSK2xpQ21jdVhoMnNDS1pR?=
 =?utf-8?B?ZktaYkhMMlREdEdMMzliK011bDlKSVZDWit2bTJ6ekw1SmxOSnpCbU9sL2FL?=
 =?utf-8?B?LzM1UnBVc1plazN5a1hWZ1N0bzhsKzY1TG5DVkYyWFJkaXF6dXB6NXdUTkNP?=
 =?utf-8?B?RUNRVkpMRnc5eTdIODM2OHFWejhURnJZeFVIMElINWg0MDRwZk1vVGdNd04v?=
 =?utf-8?B?V3l2MWpxam50V3o4UkVwOXArZ3Z2YVNqeE4zZDAzNUdEVEg0VXpVVklyVG1U?=
 =?utf-8?B?aWRVZDlSZDhuajJrL3hCUFRBZ1NldHJmcmN0TXRJOHgxR0VGenYydHBwYytT?=
 =?utf-8?B?aVZMWFNjS3JLMjExTEpETURMQk4vUWQrL056ajFUOHk2K0cwZm9qemVNVkVE?=
 =?utf-8?B?YjJKS2lKK0IzS0s3NFcrZ2dad3grbkFaZ2FtVXdWbEd6OW56Y2hCYVQ3WGNF?=
 =?utf-8?B?bFQvODdNK21DaFRCK2laL1YvcGxWVGNyY1F2QTFpVHFoelpyMmdtQ2V1bUxv?=
 =?utf-8?Q?1sJvYQrG4AQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6430.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dGpHZjg1M0E2ZktkaS8rdXR3UEQwd2xYUkVDUEJDSkhXZ3dwVjFwUHBidWNJ?=
 =?utf-8?B?T0E0d2NNenV0L1lpSUt2cTBCNmJCalBFc01ZSWZWMW5YRERBc0Q2VUs5b3k0?=
 =?utf-8?B?clp1MENwMTNwUUlQU1pXRkFmQXd1aHcvR2pFcVhZQU1DRE9KaXdRTHVuWFFx?=
 =?utf-8?B?cGE3b3IyTTY2bEhGdFJBZ1kyNGhXRTBSZExaa1FPWWFheGJxT0pZWWJtakNE?=
 =?utf-8?B?cE11MU5Ib24rM00wb09nL3lvWW5PSjFFdFB5alF2ZmkwamV6R0tvZVI1WGtL?=
 =?utf-8?B?cVVNdGNpZEtEeWk4aUZjZ1djcTJ3UkkyTDRmSnJjUTFmR3IySUdaZVdFaUJK?=
 =?utf-8?B?b2syR1JNbUtyVHB2SVU4ZHhaM1BsczE3cGxldC9ISTB0OFJkTXhMbUpDbGMw?=
 =?utf-8?B?bmYwK2ppSUV4NTNDSHcxdmN5QzVzNmdOYlVPTXhjUVVkaXVrY2dmdGRNWFV1?=
 =?utf-8?B?VktkcTh0UmR1L2ZhMlFUTmdiQjA0OFFvd2N4YU1RSjdrSmVmOWRsclErclhJ?=
 =?utf-8?B?N0d5RWxvalhVUzQvNmNwaXpXS3REVUdhWVlpMkNHNmd0VXJQdldzY2xOdmYz?=
 =?utf-8?B?VXY4Wms5UHJkQmI0YWtHcGsxQXF5TTBGbktMSjBjdGRwWTNiT3REcXR5OUJY?=
 =?utf-8?B?SEFObkZHcGRaVW5vTC92dTZ2UnpVWmswZVZBZ2JqUUs1TkFPL2hpYjF0dFNE?=
 =?utf-8?B?ZUhaQXhuelFNSWlOeGMwZ2FPSG9CTFdTVEhvYXRWSVMrUUtiWDJHVnhkWSt6?=
 =?utf-8?B?VEIzajdGVGZkTGJVUTB2bjBPdmZjY1NUNndUOWFRRlNjeTY5dE93TVgxemxz?=
 =?utf-8?B?SllWam9zYS9zWnQ2SWpOdm9vUUtDa2RMUUxqUEFRejlabVJWeFE1aXpnbHJC?=
 =?utf-8?B?Zmk5YlYydzJ3ZFU1bExvTEo5a0FyN3JzMkRnYjVxUlFjK3g5Q2Q0cG1zQzRG?=
 =?utf-8?B?c0srR3ZNd3Fjb1k0OEEyNnhraGpmWnFLZ3BXeFhGWXhLNUh2R0ZaNzV1NWlM?=
 =?utf-8?B?NWp5Q0JsRnYzTWU4dzdQMDRPUnRURHpQbVBCcEJvSDkwNmxaeStxOTc4QTZ6?=
 =?utf-8?B?emFNUzEra0lvYkpQYmN0NXIvanJaU3dpUGo5L2phb0xOaVZvWnBqdCtmb3FN?=
 =?utf-8?B?YkxYRkh0MTJLZWNDSWpQdlBiQmJSM0MzY2N2R00wdTV2S3JoYjM2SWRrRWVT?=
 =?utf-8?B?S2Y2VDMyWUZ2VDdRZmZLNm12SHVlYWtDRUNucnNINzJnbzdsU1dGeXQyRXIw?=
 =?utf-8?B?UlR1YU0wS3ZacGFVcW9zNzU3bEl2ek1ENkxLSWNwSDlHSllEcUNkemZZd1lq?=
 =?utf-8?B?QVZ5bjY4ZDB5TWQ1elp6RFJYTWhVWUNhWHRuc1NVMmIzbkNoSXFtYlN2bmtD?=
 =?utf-8?B?a2tXOGFDWGdhWHFrb0ZPd0Zzc3ZIaXgwU3krNFhHMjM4R3IzSDE5eWZ4NTRp?=
 =?utf-8?B?T1BGZlRadXdkOFBTVFBDSi9uaURFOWtzZzF5Ung3MXF3T1hDYXBjRzV2anlF?=
 =?utf-8?B?Z2ZGUEo0YWl4UmVGdkI3WDgyWFZWRkRoNTZFWEhCeW15NGc2R2k4d1g5Rm9l?=
 =?utf-8?B?alNHVWEraXp2TnZBcE5nQ1JkUmZLRnV1OXhRMjF0OG9TUlJpQ2pWeHJWaFBO?=
 =?utf-8?B?OWNZN2lZL0x2UjNjSGxKTHlYM2JzckViUks2bmdWNHpLeGcyRUJUc1Y0LzV0?=
 =?utf-8?B?d0ZHZ2FUWVA0OVNYaUJ1VnFUc3MxaWNiL3VZc1hsTDVFK2FkZ1hWbDFVbE1u?=
 =?utf-8?B?LzZzWXI2cXFrUzAzMFhkd3g4WE9jQWw2RElxUTRqQWtqUHBDSzltMlZ6TmpK?=
 =?utf-8?B?OHltc3U0dkNhUW95TGJsUm5BK09memJPTnJtTmE3WURsM1N1aHNwTVVONFMx?=
 =?utf-8?B?WUtUcHErU1UxbDl6bGdKWU5zRTU1T2hlY2hMenI2TkNWbHhvczBDa0Z4NUdE?=
 =?utf-8?B?ZkxYR2c0eHZweFVUc1UzeVNkSlhIbXFhWlZNSWswZjdzdnVSZjZvTGpVWWky?=
 =?utf-8?B?YTJRTHpSSmJDNWJpcHkwMjBsV3doUW5DTWFPZ1dQMElQVkpoT3NWd0VqdjZE?=
 =?utf-8?B?UGpqN3F6dnVZRTU1NExac1hMN1doZjJCT3BTZ2dpUXltMDdlY3V6amx5Z0U3?=
 =?utf-8?B?cFI3R0hCenFId0Z0c25ua1VwQzcrNjZmZnlHVFU5OUFWY3lyOUV4MHQvSzM4?=
 =?utf-8?B?Nmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2C2CBECFB01AAD4FA5D5E9DB8DEE7CAD@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fb57ee2-07a1-40f0-aaf8-08ddf656cf01
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2025 01:58:05.6979
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UjfZLudOu/z6h8vEwEf0KsfhUrCZqdEvquZaE/dGpNO8siXJns88rt5M85fgCEwMjKO2MtHtBzKbG1EZKaL6jA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF6B7063D92
X-OriginatorOrg: intel.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 01:58:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119498

T24gTW9uLCAyMDI1LTA5LTE1IGF0IDA2OjI5IC0wNzAwLCBZYW4sIEhhaXhpYW8gKENOKSB2aWEN
Cmxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgd3JvdGU6DQo+IEZyb206IEhhaXhpYW8gWWFuIDxoYWl4
aWFvLnlhbi5jbkB3aW5kcml2ZXIuY29tPg0KPiANCj4gRml4IGZvbGxvdyBydW50aW1lIGVycm9y
OiAuL2J1aWxkX3N1cHBvcnQvc3JjL3NuaWZmX21xX3ByaW9fbWF4Og0KPiAvbGliL3g4Nl82NC1s
aW51eC1nbnUvbGliYy5zby42OiB2ZXJzaW9uIGBHTElCQ18yLjM0JyBub3QgZm91bmQNCj4gKHJl
cXVpcmVkIGJ5DQo+IC4vYnVpbGRfc3VwcG9ydC9zcmMvc25pZmZfbXFfcHJpb19tYXgpDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBIYWl4aWFvIFlhbiA8aGFpeGlhby55YW4uY25Ad2luZHJpdmVyLmNv
bT4NCj4gLS0tDQo+IMKgLi4ubmRsZS1ydW50aW1lLWVycm9ycy1hbmQtcmV0dXJuLU5vbmUtLnBh
dGNoIHwgNDcNCj4gKysrKysrKysrKysrKysrKysrKw0KPiDCoC4uLi9weXRob24vcHl0aG9uMy1w
b3NpeC1pcGNfMS4yLjAuYmLCoMKgwqDCoMKgwqDCoMKgIHzCoCAxICsNCj4gwqAyIGZpbGVzIGNo
YW5nZWQsIDQ4IGluc2VydGlvbnMoKykNCj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS1weXRo
b24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy0NCj4gcG9zaXgtaXBjLzAwMDQtYnVp
bGRfc3VwcG9ydC1oYW5kbGUtcnVudGltZS1lcnJvcnMtYW5kLXJldHVybi1Ob25lLQ0KPiAucGF0
Y2gNCj4gDQo+IGRpZmYgLS1naXQgYS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXBvc2l4LQ0KPiBpcGMvMDAwNC1idWlsZF9zdXBwb3J0LWhhbmRsZS1ydW50aW1l
LWVycm9ycy1hbmQtcmV0dXJuLU5vbmUtLnBhdGNoDQo+IGIvbWV0YS1weXRob24vcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1wb3NpeC1pcGMvMDAwNC0NCj4gYnVpbGRfc3VwcG9ydC1o
YW5kbGUtcnVudGltZS1lcnJvcnMtYW5kLXJldHVybi1Ob25lLS5wYXRjaA0KPiBuZXcgZmlsZSBt
b2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwMDAuLmU4NDM0NWEzOTczNw0KPiAtLS0gL2Rl
di9udWxsDQo+ICsrKyBiL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtcG9zaXgtaXBjLzAwMDQtDQo+IGJ1aWxkX3N1cHBvcnQtaGFuZGxlLXJ1bnRpbWUtZXJyb3Jz
LWFuZC1yZXR1cm4tTm9uZS0ucGF0Y2gNCj4gQEAgLTAsMCArMSw0NyBAQA0KPiArRnJvbSBiMDc5
MDc0MDQ4YmMzM2IyMDZiMjFmNzNmZWNiODE3M2NmOGFkYWYwIE1vbiBTZXAgMTcgMDA6MDA6MDAN
Cj4gMjAwMQ0KPiArRnJvbTogSGFpeGlhbyBZYW4gPGhhaXhpYW8ueWFuLmNuQHdpbmRyaXZlci5j
b20+DQo+ICtEYXRlOiBNb24sIDE1IFNlcCAyMDI1IDIxOjE1OjQ1ICswODAwDQo+ICtTdWJqZWN0
OiBbUEFUQ0hdIGJ1aWxkX3N1cHBvcnQ6IGhhbmRsZSBydW50aW1lIGVycm9ycyBhbmQgcmV0dXJu
DQo+IE5vbmUgZm9yDQo+ICsgaW52YWxpZCBtYXhfcHJpb3JpdHkNCj4gKw0KPiArV2hlbiBjcm9z
cy1jb21waWxpbmcsIHRlc3QgYmluYXJpZXMgbWF5IGZhaWwgdG8gZXhlY3V0ZSBvbiB0aGUgaG9z
dA0KPiBzeXN0ZW0gaWYNCj4gK3RoZSB0YXJnZXQgdG9vbGNoYWluIHdhcyBidWlsdCBhZ2FpbnN0
IGEgbmV3ZXIgZ2xpYmMgdmVyc2lvbiB0aGFuDQo+IHdoYXQgaXMNCj4gK2F2YWlsYWJsZSBvbiB0
aGUgaG9zdC4NCj4gKw0KPiArRm9yIGV4YW1wbGUsIG9uIFVidW50dSAyMC4wNCB0aGUgZm9sbG93
aW5nIGVycm9yIG9jY3VyczoNCj4gKw0KPiArLi9idWlsZF9zdXBwb3J0L3NyYy9zbmlmZl9tcV9w
cmlvX21heDogL2xpYi94ODZfNjQtbGludXgtDQo+IGdudS9saWJjLnNvLjY6IHZlcnNpb24NCj4g
K2BHTElCQ18yLjM0JyBub3QgZm91bmQgKHJlcXVpcmVkIGJ5DQo+IC4vYnVpbGRfc3VwcG9ydC9z
cmMvc25pZmZfbXFfcHJpb19tYXgpDQo+ICsNCj4gK1RoaXMgY2hhbmdlIGVuc3VyZXMgdGhhdCBz
dWNoIHJ1bnRpbWUgZXJyb3JzIGFyZSBncmFjZWZ1bGx5IGhhbmRsZWQsDQo+IGFuZA0KPiArbWF4
X3ByaW9yaXR5IGlzIHNldCB0byBOb25lIHdoZW4gdGhlIHRlc3QgYmluYXJ5IGNhbm5vdCBiZSBl
eGVjdXRlZC4NCj4gKw0KPiArVXBzdHJlYW0tU3RhdHVzOiBQZW5kaW5nDQoNCkNhbiB5b3UgcGxl
YXNlIHN1Ym1pdCB0aGlzIHVwc3RyZWFtIGFuZCBwcm9wb3NlIHRoaXMgcGF0Y2ggZm9yDQp3YWxu
YXNjYXIgYXMgd2VsbD8gSWYgdGhpcyBpcyBub3QgYXBwbGljYWJsZSB0byBvdGhlciBicmFuY2hl
cywgcGxlYXNlDQppbmNsdWRlIGluIGNvbW1pdCBtZXNzYWdlIHdoeS4NCg0KVGhhbmtzLA0KDQpB
bnVqDQoNCj4gKw0KPiArU2lnbmVkLW9mZi1ieTogSGFpeGlhbyBZYW4gPGhhaXhpYW8ueWFuLmNu
QHdpbmRyaXZlci5jb20+DQo+ICstLS0NCj4gKyBidWlsZF9zdXBwb3J0L2Rpc2NvdmVyX3N5c3Rl
bV9pbmZvLnB5IHwgOCArKysrKystLQ0KPiArIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pDQo+ICsNCj4gK2RpZmYgLS1naXQgYS9idWlsZF9zdXBwb3J0L2Rp
c2NvdmVyX3N5c3RlbV9pbmZvLnB5DQo+IGIvYnVpbGRfc3VwcG9ydC9kaXNjb3Zlcl9zeXN0ZW1f
aW5mby5weQ0KPiAraW5kZXggZjZlNmM4Y2JlNmJhLi40ZmVjNDhiNTUyOWQgMTAwNjQ0DQo+ICst
LS0gYS9idWlsZF9zdXBwb3J0L2Rpc2NvdmVyX3N5c3RlbV9pbmZvLnB5DQo+ICsrKysgYi9idWls
ZF9zdXBwb3J0L2Rpc2NvdmVyX3N5c3RlbV9pbmZvLnB5DQo+ICtAQCAtNzUsOCArNzUsMTIgQEAg
ZGVmIGNvbXBpbGVfYW5kX3J1bihmaWxlbmFtZSwgbGlua2VyX29wdGlvbnM9IiIpOg0KPiArwqDC
oMKgwqAgaWYgZG9lc19idWlsZF9zdWNjZWVkKGZpbGVuYW1lLCBsaW5rZXJfb3B0aW9ucz0iIik6
DQo+ICvCoMKgwqDCoMKgwqDCoMKgIHRyeToNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBz
ID0gc3VicHJvY2Vzcy5Qb3BlbihbIi4vYnVpbGRfc3VwcG9ydC9zcmMvJXMiICUNCj4gZmlsZW5h
bWVbOi0yXV0sDQo+ICstwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoA0KPiBzdGRvdXQ9c3VicHJvY2Vzcy5QSVBFKS5jb21tdW5p
Y2F0ZSgpWzBdDQo+ICstwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcy5zdHJpcCgpLmRl
Y29kZSgpDQo+ICsrwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBzdGRvdXQ9c3VicHJvY2Vzcy5QSVBFLA0KPiBzdGRlcnI9c3Vi
cHJvY2Vzcy5QSVBFKQ0KPiArK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3Rkb3V0LCBzdGRlcnIg
PSBzLmNvbW11bmljYXRlKCkNCj4gKyvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIHMucmV0dXJu
Y29kZSAhPSAwOg0KPiArK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAjIHJ1bnRpbWUg
ZXJyb3INCj4gKyvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIE5vbmUNCj4g
KyvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBzdGRvdXQuc3RyaXAoKS5kZWNvZGUoKQ0K
PiArwqDCoMKgwqDCoMKgwqDCoCBleGNlcHQgRXhjZXB0aW9uOg0KPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgICMgZXhlY3V0aW9uIHJlc3VsdGVkIGluIGFuIGVycm9yDQo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgcmV0dXJuIE5vbmUNCj4gKy0tIA0KPiArMi4yNS4xDQo+ICsNCj4gZGlm
ZiAtLWdpdCBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcG9z
aXgtDQo+IGlwY18xLjIuMC5iYiBiL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtcG9zaXgtDQo+IGlwY18xLjIuMC5iYg0KPiBpbmRleCA4MTQ3ZTQxMDhiNzIuLmNh
ZDE0MDM4MTM0NCAxMDA2NDQNCj4gLS0tIGEvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1wb3NpeC1pcGNfMS4yLjAuYmINCj4gKysrIGIvbWV0YS1weXRob24vcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wb3NpeC1pcGNfMS4yLjAuYmINCj4gQEAgLTEy
LDUgKzEyLDYgQEAgU1JDX1VSSSArPSAiIFwNCj4gwqDCoMKgwqANCj4gZmlsZTovLzAwMDEtYnVp
bGRfc3VwcG9ydC11c2Utc291cmNlLWZpbGVuYW1lLWluc3RlYWQtb2YtZm9vLWZvci5wYXRjaA0K
PiDCoFwNCj4gwqDCoMKgwqANCj4gZmlsZTovLzAwMDItYnVpbGRfc3VwcG9ydC1oYW5kbGUtZW1w
dHktbWF4X3ByaW9yaXR5LXZhbHVlLWFzLU5vbi5wYXRjaA0KPiDCoFwNCj4gwqDCoMKgwqANCj4g
ZmlsZTovLzAwMDMtYnVpbGRfc3VwcG9ydC11c2UtZG9lc19idWlsZF9zdWNjZWVkLWluLWNvbXBp
bGVfYW5kXy5wYXRjaA0KPiDCoFwNCj4gK8KgwqDCoA0KPiBmaWxlOi8vMDAwNC1idWlsZF9zdXBw
b3J0LWhhbmRsZS1ydW50aW1lLWVycm9ycy1hbmQtcmV0dXJuLU5vbmUtLnBhdGNoDQo+IMKgXA0K
PiDCoCINCj4gwqBpbmhlcml0IHB5cGkgcHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YQ0KPiAN
Cj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNz
YWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+IFZpZXcvUmVwbHkgT25saW5lICgjMTE5NDA5KToN
Cj4gaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWRldmVsL21l
c3NhZ2UvMTE5NDA5DQo+IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRk
ZWQub3JnL210LzExNTI1MzYwNy8zNjE2NzAyDQo+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQt
ZGV2ZWwrb3duZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBVbnN1YnNjcmliZToNCj4gaHR0
cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWRldmVsL3Vuc3ViwqBb
DQo+IGFudWoubWl0dGFsQGludGVsLmNvbV0NCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCg==


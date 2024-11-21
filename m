Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B78DD75BC8
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 07:06:21 +0000 (UTC)
Received: from esa3.fujitsucc.c3s2.iphmx.com (esa3.fujitsucc.c3s2.iphmx.com [68.232.151.212])
 by mx.groups.io with SMTP id smtpd.web11.5528.1732172771829364119
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Nov 2024 23:06:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=PclGxvbj;
 spf=neutral (domain: fujitsu.com, ip: 68.232.151.212, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1732172771; x=1763708771;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=GgeIu9/FI5azZnXWp5lX7WIljdxvJv2eRJ23tvnYNxE=;
  b=PclGxvbjklfUSZS+NMVfHadkkvJcklZPbnOwD0ffmTZw2ib+LAH3hA4n
   /UYDphsZsbq+mMYkM5NdJ98T0fEvTHkV95Vvja0oWInYYc+aFJ25RTikp
   h6wuKjJK7wAmKq+vja/Ri0N8yHhYyZPMP/kiJfKTq6MxES2Gqre1VpKWM
   mhn7VxIKglOK2qLeuVzHdkYbhETwa3B7EOERkgbbHd2nf2aYcF9bPaEY4
   99i53wdPu0hk43ithb5W05NmDmLKxPH1bbGQR3QEqc+Gg+1TbIoZIstR/
   72eo5v8MmlWBfKnUiqeZTBy2S2Gt2U64E7fkCWorqQKxDsrQl4+ori4HT
   Q==;
X-CSE-ConnectionGUID: XKPu/rNuTrKFQgU+sRMm7g==
X-CSE-MsgGUID: IfKpn94GQbO8XySOlIf6Og==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="48914989"
X-IronPort-AV: E=Sophos;i="6.12,172,1728918000"; 
   d="scan'208";a="48914989"
Received: from mail-japaneastazlp17011028.outbound.protection.outlook.com (HELO TYVP286CU001.outbound.protection.outlook.com) ([40.93.73.28])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 16:06:08 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RRpP/c8Y+OcpQgKI2NBgsc6VyDeq78i2/Xjtom9/RfYFrvhmuWGGIPnVX2qr92iEcu8bAQYF+Zvf82WaSENQ+wsmRpffmfYEusqVmzGlo0co+NUBx5PBKsGhPWtuDzqouFrETKeqp02vhDAxz/oxhCtRGER4B0dptS6aSExXWaRdpQF4nCm0jFD8syJDra6jbJESOvzZhIlhs+/VjassFpCdFpt7Lysa+8+MPUzolNNx1ji8z4OGrWmurotZv/efZTsxRCMrZ7RRJlfLpcK9aPx2qBWfgY02DFbzdfDaij/wJVGs0/2E5mz0KBeLWvsGp3rHdbWtjyVV8e/cCEchrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GgeIu9/FI5azZnXWp5lX7WIljdxvJv2eRJ23tvnYNxE=;
 b=wQcUYFTXPq4/SCP/3GoVS8JLxd54kHlnH/SWf/EDz2jnWhO0lby/XIZ69yrd0mGgCft52KvGxlqVF/vyQS6zh2G1sTw6OgE/aGTsK36Gz89AJjEgZViU2rpoZITuey6cmcojpD1iylP++aw18GtOUnGcjDq0q8xEQrjXncbaInc1chGHWn7HyVxrO5aCJlFaHWy6bqey2Y2m73fgP5XqLEibTtSAGfcses6BcoJDfJdE215eiQjJAhxRvfIS1K68skPvBr92Lchr2SXLrcpZ6fbwxIr4f5rxOH8K4tG7PvuVbxUS/e0vcljuBFW2cl8bzaI8fSKOT5MJ6anE1wcrIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 (2603:1096:400:3fb::13) by OSRPR01MB11699.jpnprd01.prod.outlook.com
 (2603:1096:604:22c::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Thu, 21 Nov
 2024 07:06:05 +0000
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e0dd:28e5:6a6e:2342]) by TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e0dd:28e5:6a6e:2342%7]) with mapi id 15.20.8158.021; Thu, 21 Nov 2024
 07:06:05 +0000
From: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe] cmpi-bindings: allow creation of an empty package
Thread-Topic: [oe] [meta-oe] cmpi-bindings: allow creation of an empty package
Thread-Index: AQHbO84Zw2kjvtF6pk6T17rcMA7VKrLBMhKAgAAcUdA=
Date: Thu, 21 Nov 2024 07:06:05 +0000
Message-ID: 
 <TYWPR01MB11861FF4308B17A143A53F741DC222@TYWPR01MB11861.jpnprd01.prod.outlook.com>
References: <1732163421-28704-1-git-send-email-wangmy@fujitsu.com>
 <CAMKF1sonsyAa3MkhDte4ARkwhhsm2ub7=NQ9Lj+EnF7zThcUWg@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sonsyAa3MkhDte4ARkwhhsm2ub7=NQ9Lj+EnF7zThcUWg@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5Njgw?=
 =?utf-8?B?MmZfQWN0aW9uSWQ9OWVmMjQ1NjctYjNhYy00ZmRjLWE5ZTgtMjQ4ZDM1ZmEw?=
 =?utf-8?B?NWE1O01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMz?=
 =?utf-8?B?OTY4MDJmX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQx?=
 =?utf-8?B?LTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX01ldGhv?=
 =?utf-8?B?ZD1Qcml2aWxlZ2VkO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFk?=
 =?utf-8?B?NTUtNDZkZTMzOTY4MDJmX05hbWU9RlVKSVRTVS1QVUJMSUPigIs7TVNJUF9M?=
 =?utf-8?B?YWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfU2V0?=
 =?utf-8?B?RGF0ZT0yMDI0LTExLTIxVDA3OjA2OjAxWjtNU0lQX0xhYmVsXzFlOTJlZjcz?=
 =?utf-8?B?LTBhZDEtNDBjNS1hZDU1LTQ2ZGUzMzk2ODAyZl9TaXRlSWQ9YTE5ZjEyMWQt?=
 =?utf-8?Q?81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB11861:EE_|OSRPR01MB11699:EE_
x-ms-office365-filtering-correlation-id: 858ea3d6-2f72-40fa-6a04-08dd09faf78f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|4022899009|366016|1800799024|376014|1580799027|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?b0s4RVNsc1pJOGRlN0VqdVkzWUJHeHY5WW5qMGRHcThBbm55NWtNYndLUlNH?=
 =?utf-8?B?ZkVKcGhkdzVLeWVIRGx4Mkd2dzhSNWpSdXBiT2FLenBFTFZqRWpsbnN5Tkli?=
 =?utf-8?B?TjNqcTh5eVI0LzF0cVVDMTVQSjlJcHVOZ2d5bzBmQlV1a3JYQ0ZMWXlsZExH?=
 =?utf-8?B?bXYyVmZlTmNBdEQ5UmpqaksxUnh6SC9vYW5pNkQyNktuLzhpOFRYN3RqMjZD?=
 =?utf-8?B?TzlVTDM3WW8yRGQrR0NiSlYrQy91OXY4blU5MmRRMjBNYnkrYWxXSVhadWxS?=
 =?utf-8?B?ZXl2T2Z6WXJ0V05ISGtOMHNIcVhwQStJMThxUzkzekVvMGxQRHkyb3NmOG13?=
 =?utf-8?B?d3YycDI1VnBSOFZLNk1MOEJHUktzZndaYkIxYVVHTGZ4Z3k0ZWF1TEZhN3BV?=
 =?utf-8?B?ZVNGUGYrQUk0YjRTbXJFQ2pMSGcya2xVZk5zWkFIYi93WmtYVDZ0eDBHMUV6?=
 =?utf-8?B?VURqZzM3YVZlVzlpWWowTHZUQzM3eDlEb2xnNmVhNWtkWmR6QjNCY21ndkhy?=
 =?utf-8?B?Y3Z1SDllc2x5dnp6Tm9raGVaOVprYUdwdHpUaGlaOG5qMXVTai9QeDg1NnBr?=
 =?utf-8?B?c0ZKL1NleDhwLzZ6VWJIanNKbWY4RExjQkovWFFHOGx0YkFKQS9YMG5UZkpI?=
 =?utf-8?B?TDRoN2JrNU14UG4zZFQwQ09vTGduT1lXUHpCcGR5VHJjL3Z6RmNMblByTi9u?=
 =?utf-8?B?U0dJTUFNS0syZm5CVVU5YmhDL0hYOVJyMXlrSWgzdnB6cTNBWHF3ckVLc1Nn?=
 =?utf-8?B?bTFYRTJYS3krcVZ6MDFDSVVlaHZBVFh5cy9hVVYrY0pwNjh3QzJUcDV0c2pX?=
 =?utf-8?B?ekF2M3ByQ3d3QVZKS1BZcWJycTQ2dzEyTzM0eHhIRU5JTnBtWVdzRytsS3Bx?=
 =?utf-8?B?cXh6Yjl5NVo3SkczenEzNVFqN3NTTzM4WGFrajQwWCt1Q0FCcld0eW5Ma2Fa?=
 =?utf-8?B?R1c1QmNWaUR3VmdTaHg0UUlWa2FrUHR0UXVnRnB4WStsM0h3dDFESXE4Sy9Z?=
 =?utf-8?B?cVhQRnpBYnZqNU82aDFKUXFNeHo3a2VhQ3lHSE5sYVBkbWN6UEhQQ0ZsY1Mz?=
 =?utf-8?B?NEU1WlZ5TmszWmhQODNWVWFuYmkweXg2SnFSMExqZzM4cUlqTHZEdTJLai9k?=
 =?utf-8?B?MWxqcWVZREt2WUtuREMvZ2hZL01uUW5UY1c4aG44S0FZU25IL1MveURrT2ZP?=
 =?utf-8?B?d016UDFWaG9aY0VxVUxrMHVabEFFTkRRdEZ1RmxPSkNMemttMklFN1ZMVU5h?=
 =?utf-8?B?RmpJTUVUOTVFWDBGeDYzUlBHQk5pQzVlRmJGRFdQd1BXbU1GallsaStDSitj?=
 =?utf-8?B?NmpaYWd5K2JLeTh0L1RVRmtjR0RPWW1jcE9EUG9vZEJmdUUvOGVOUllDcmo3?=
 =?utf-8?B?S1RNNzhJSkpnWjZJZHMzb2JOdUxVWFVEZkMyM0ZUZWZLdHVEaUhYYjhnMWFm?=
 =?utf-8?B?QkYrN1Nrd2k0L25CMjlxaHhnMlMva1cyYzBNOEdnSmRLK0tkaXhtMEJTUFh6?=
 =?utf-8?B?Q3BLaFZTR09ZR21pb3NhWVVRY21Jb1JSWmRFaGdGN01ZK2xGc1J0UU9tOElW?=
 =?utf-8?B?VjN1TUk2T1lQc3BkcHRoVHFZbzBuYmJTSGtNN2YyVnB1VDVLOFRGbjVIOUcy?=
 =?utf-8?B?QW94ZjROSjZmRXJrTHlJMWZLSldNL0JnbkozdnRvRDMxdlFEUEpEZ2pIQWFF?=
 =?utf-8?B?NXEzdHUzSEZpUXJ2MElXQkFEZ0t2UlRxU2w5d3RHT1hiUnBMK2t6OEgzc3Qr?=
 =?utf-8?B?ekN2WGJtdFlBSlB4ZHQvRkZ0T1Z4ZTdYektTYlF3TU9XUGQrNDJWcFFYMkdi?=
 =?utf-8?B?ZlNMK3hsd3kreVZ2S1lVQT09?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB11861.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(1800799024)(376014)(1580799027)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eHlWK1kyWG51WUlQU3RxQXBDZVhkU0JCNHlhdDFlOEtHeHlNT2RFNXZpRDJp?=
 =?utf-8?B?QTBLV3dJTHM2eFNDZCtvZHA1ZXZvZFBUeVNCZzFFV2xwRjM2UEJqaURnbnNH?=
 =?utf-8?B?Nkk1VGR2Rk9wdURWRmhqK29ESHdlc3hRVFZjS2YvTTlDalZJVFFnazJ0T2hw?=
 =?utf-8?B?TUFuUDhFSXFrRWFGb2RtV3JGbGpBZlpjZWhnSDc4SWIxc01LMCtXajVxd2ll?=
 =?utf-8?B?Y2lnUER4a3RaYW1mVkRUNGN1SGpSSFRDaGFpeXNwaWlSaCsvOHZjUTFHd292?=
 =?utf-8?B?Q054bWYyVTVTSXZvenVZcjBQOFdNT1FUSU91a1daai9vellxRGk4YTlKeGZK?=
 =?utf-8?B?WGZrOGMrMmNYSVd6UjRhTWcyelRqUTFpN1hiVkNHT1RVdlJtYkx0R2p3NGJ1?=
 =?utf-8?B?SzBNRWlPUXhuK1VUSzRhY0ZsWk05REk1RUZxYXZsNElIaWxZUUJXVDdRUG9i?=
 =?utf-8?B?TGh6dUZ4aW5SMDlQc3NjYkVnREtuSXZVdFRUZWlRWjFJNVk2cUhDbFk2TkFz?=
 =?utf-8?B?RWowQ2crdlBJbDJOajl2dk1wSThIZFoxSnhwcUN3blk2Um5aUUhucm9BSDdQ?=
 =?utf-8?B?WDJTQmFEQnp2ZG5saG4wVVpTeDBVcGNlODhNSExwTHZnc2trRXlVeXkxdmo1?=
 =?utf-8?B?bVJhMlBnL1BVaHJWVGZuU1lSZ1cxUENEL0RrMVVKMW45M0VwRVBudGtJRHpt?=
 =?utf-8?B?c1BYcVpjdko2RlViaDk2Mk5MQkx2di9MNW80MndWWitub2FBcFNuejBkQUtp?=
 =?utf-8?B?STRaYjl1bVh3THQ3ZzJmdVo0MDhZZlI3YTg5M2pvWTVKc0g2MGZ2VU1HT0xh?=
 =?utf-8?B?dFVSdWpTdjFqQVZSa1NLZi9nUmZFVkw0QUVPYjJTaTlUQ3pGOWNjU0RNQlBF?=
 =?utf-8?B?Vnp0NWZjMWxYRU93YUx3YkNCNUxZZjRXME5jcTdlNWFJb0xRNmt6MXc4R0RV?=
 =?utf-8?B?M0tkVHh4VEtPNGM2Z05yMkFRSmo3aEsyc3JoK0xadzhHTXQxbFlvcmpqTnQ3?=
 =?utf-8?B?SjBaRldDdWE1YmRMVnBsUHU5QWI2RUUvNkZhRU9yTVlQWFR2Z2x3aHdHeTR0?=
 =?utf-8?B?SUQzYVA5cytSWkFHNlBINjhOaHBRc2w2c0tjSFJkSXVYcXBkZzF6MnM2WG9q?=
 =?utf-8?B?TUdXdmdrSzM3QlJoanhMc3BPTFhlSk5BWS85RFVsdjB2OFBWaU83N3hIcW9O?=
 =?utf-8?B?Qzh4ODFBMjJzdTFNcGpHQzBvalY4K2RoRU9rOFVrM3dSZjVJTE81c2FXRnBY?=
 =?utf-8?B?eFdpcEdMT2UxaXIvMVplZFY4RHVFVHhnc25WUDNlVnJjL1ZpQkFUZk0yY041?=
 =?utf-8?B?M1FxdDRlSWFzdnNaeWs0NmROVW5SaisxVitsWGVuVDhBd2oxZVVkNGFYS3V4?=
 =?utf-8?B?Mnd3TFo2NUJHTE1OSjRrTDJKRnNtTlUySmhJUHNHbk1oSnZjSTR1eEsweU41?=
 =?utf-8?B?YS85UUpEdkI5eFhZRncvQlFMNGFWVDU2Nlh2WVdLSjFUTDUrMCtiY21lTVJH?=
 =?utf-8?B?bTBtRXRUS0pmOStoQk8vNmFHY0Z4ZjJCVUFudzRDT3l4WHZlSjIzMTlFWG5T?=
 =?utf-8?B?bFM3T0tMZUZxdVRkM25RQzY1N05BeUZJZ1NnS2FtTXpobHlXN3duaWRTL3lB?=
 =?utf-8?B?NWhldGdiOGF1VTdsczhHMEhtb3JxMzl5R0VRV1hKdjVNNTlMdWZLZDRtMGo4?=
 =?utf-8?B?ZXJQMjYzVGdwNU5EdFIzcWVvb2JJZkloVktzS0JKRGgwU1diY2pvZWZVSlN3?=
 =?utf-8?B?S1JQSmYyRnB3Z0taU0Q3dzVVbXBlNHcrU1hZRVRIblk3OEtmbFBteGEyTHRF?=
 =?utf-8?B?OFVtbGVnOTdMOUxJNUxPZHozTlNFZktBUHpmdUVRVnhETTRWb1FTWHFVZ0xw?=
 =?utf-8?B?MGpNcVJvV2hZaWlwMDR5Zll5Q2FGNEtWcUttbXJiSy8rMTVHNlVLU2E3cTZr?=
 =?utf-8?B?Q2NjT0NZYUZiRDV0S0p0TW5oRjFINGtrSkljbWo1eURZRXUyZkptaVRaZGZQ?=
 =?utf-8?B?S2RKdE4xZmZyOU5sRFlIa3JhNkpzUHAydVBxMHVwM3RxSURoWm8xcFZGei9p?=
 =?utf-8?B?MzJPVGhXTE41SXNJNHNsbFdIL2dnYmY4ejNzL050RDRSVHIwM0VpRnFJRTQw?=
 =?utf-8?Q?uDbc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	R8PcQgaAnlSre2JMHnVI5cdScUStQrbza7I1cdxoswtE+z8EZyG/eWPWQHYIZzy9Q6nF5qkU3KQk4UEsLdv4+4rgw9Z2ZGAJGN2XfR8YuZ49VhyNuIenrzalqPLAD6r7e7DKe1iv5dqqBwgkw57Q9fzi411yBBqoQuo7t48wIP0V/e+ZI/oQiQkBHE9jyk916DPowunw5FNPNwML6FLVUCkpnGHrYJmJp/NWQoH+NJNngKKbXJbJ1oYi/je2rnUrotZj2NXRybJsGuQ/xcYIh0Jbo9u8Kwv9GsyWaTeBULoZhfHmVhjPUGDkcGtnFbQIYZc9s9nAzUjcT540WFa4nSeWOyS0LNeHEtaTiFzYH2h4E0DC09Y7mWPex7hrYZwa/wmaDLJ04d6hh33BFAvyGfTCJ81hAV5ZAKI9jrbeKgCLAjEd3KNP33ZB6lZ54kE+Km2dSHDUKuKnCPrq+Ug2C6o0zncelRPCYSOb3IAw9+HyG/d4xdX2JrUSCP/3hihaJMHyM+8wj5nDSm/0PTEoYf3AkdnQO3tCUfRkRNdNiJuKlOqGwyoWWOBPgisIfBGR4yB1r/G6v2ybyibekc/Qk9PxO5H1l2YChy0MKF1dzjx4LAGX+tHu0Jbv8xxsZ0rR
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11861.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 858ea3d6-2f72-40fa-6a04-08dd09faf78f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2024 07:06:05.5734
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t6fw0jEm898ocxNvKHBiV+p234skQTTMunfBV/veB+mHVA1djQCeDF0EUrMCw+Ts1hCocbVPQ1NsjdxwxlGskw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11699
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Nov 2024 07:06:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113956

RHVlIHRvIDMuMTMgaW5jb21wYXRpYmlsaXR5LCBweXRob24zIGlzIGRpc2FibGVkLg0KQmVjYXVz
ZSBtYXliZSB1cHN0cmVhbSB3b3VsZCB1cGRhdGUgZm9yIFB5dGhvbjMgaW4gdGhlIGZ1dHVyZSwg
SSBtYWRlIHRoaXMgbW9kaWZpY2F0aW9uIHRlbXBvcmFyaWx5LiANCg0KICAtLQ0KQmVzdCBSZWdh
cmRzDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0N
CldhbmcgTWluZ3l1DQpGVUpJVFNVIE5BTkpJTkcgU09GVFdBUkUgVEVDSE5PTE9HWSBDTy4sIExU
RC4gKEZOU1QpDQpOby42IFdlbnpodSBSb2FkLCBOYW5qaW5nLCAyMTAwMTIsIENoaW5hDQpURUzv
vJorODYrMjUtODY2MzA1NjYtLTg1NjgNCkNPSU5TOiA3OTk4ODU0OA0KRkFYOiArODYrMjUtODMz
MTc2ODUNCk1BSUw6IHdhbmdteUBmdWppdHN1LmNvbQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQo+IEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+DQo+IFNlbnQ6IFRo
dXJzZGF5LCBOb3ZlbWJlciAyMSwgMjAyNCAxOjE5IFBNDQo+IFRvOiBXYW5nLCBNaW5neXUv546L
IOm4o+eRnCA8d2FuZ215QGZ1aml0c3UuY29tPg0KPiBDYzogb3BlbmVtYmVkZGVkLWRldmVsQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtvZV0gW21ldGEtb2VdIGNtcGkt
YmluZGluZ3M6IGFsbG93IGNyZWF0aW9uIG9mIGFuIGVtcHR5IHBhY2thZ2UNCj4gDQo+IE9uIFdl
ZCwgTm92IDIwLCAyMDI0IGF0IDg6MzDigK9QTSB3YW5nbXkgdmlhIGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcNCj4gPHdhbmdteT1mdWppdHN1LmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90
ZToNCj4gPg0KPiA+IEZyb206IFdhbmcgTWluZ3l1IDx3YW5nbXlAZnVqaXRzdS5jb20+DQo+ID4N
Cj4gPiBJbiB0aGUgY2FzZSB3aGVyZSBjbXBpLWJpbmRpbmdzIGluY2x1ZGVkIGludG8gYW4gaW1h
Z2UsIGFuZCBpZiBubw0KPiA+IGxheWVycyBpcyBwcm92aWRpbmcgdGhlIG1hY2hpbmUgY29uZmln
dXJhdGlvbiwgdGhlIGJ1aWxkIGZhaWxzIHdpdGgNCj4gPiB0aGUgZm9sbG93aW5nIGVycm9yOg0K
PiA+ICAgUHJvYmxlbTogY29uZmxpY3RpbmcgcmVxdWVzdHMNCj4gPiAgIC0gbm90aGluZyBwcm92
aWRlcyBsaWIzMi1jbXBpLWJpbmRpbmdzDQo+ID4NCj4gPiBUaGlzIGVycm9yIGlzIGJlY2F1c2Ug
bm8gcGFja2FnZSB3YXMgY3JlYXRlZCBmb3IgY21waS1iaW5kaW5ncyBzaW5jZQ0KPiA+IHRoZSBy
ZWNpcGUgZG9lcyBub3QgaW5zdGFsbCBhbnkgZmlsZXMuDQo+ID4NCj4gPiBUaGlzIGNvbW1pdCBh
bGxvd3MgdGhlIGNyZWF0aW9uIG9mIGFuIGVtcHR5IHBhY2thZ2UgaW4gb3JkZXIgdG8gYXZvaWQN
Cj4gPiB0aGUgZG9fcm9vdGZzIGZhaWx1cmUgd2hlbiB0aGlzIHBhY2thZ2UgaXMgaW5jbHVkZWQg
aW50byBhbiBpbWFnZS4NCj4gPg0KPiANCj4gd2hhdCBub24tZW1wdHkgcGFja2FnZXMgYXJlIGJ1
aWx0IGJ5IHRoaXMgcmVjaXBlLg0KPiBJIHdvdWxkIHJhdGhlciBleHBlY3QgdGhlbSB0byBiZSBp
bmNsdWRlZCBpbiBpbWFnZSBpbnN0YWxsDQo+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFdhbmcgTWlu
Z3l1IDx3YW5nbXlAZnVqaXRzdS5jb20+DQo+ID4gLS0tDQo+ID4gIG1ldGEtb2UvcmVjaXBlcy1l
eHRlbmRlZC9jbXBpLWJpbmRpbmdzL2NtcGktYmluZGluZ3NfMS4wLjQuYmIgfCAyICsrDQo+ID4g
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQNCj4g
PiBhL21ldGEtb2UvcmVjaXBlcy1leHRlbmRlZC9jbXBpLWJpbmRpbmdzL2NtcGktYmluZGluZ3Nf
MS4wLjQuYmINCj4gPiBiL21ldGEtb2UvcmVjaXBlcy1leHRlbmRlZC9jbXBpLWJpbmRpbmdzL2Nt
cGktYmluZGluZ3NfMS4wLjQuYmINCj4gPiBpbmRleCA1YmZhMzExMTIuLjIxZTZhNmFiNSAxMDA2
NDQNCj4gPiAtLS0gYS9tZXRhLW9lL3JlY2lwZXMtZXh0ZW5kZWQvY21waS1iaW5kaW5ncy9jbXBp
LWJpbmRpbmdzXzEuMC40LmJiDQo+ID4gKysrIGIvbWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL2Nt
cGktYmluZGluZ3MvY21waS1iaW5kaW5nc18xLjAuNC5iYg0KPiA+IEBAIC0xOCw2ICsxOCw4IEBA
IFMgPSAiJHtXT1JLRElSfS9naXQiDQo+ID4NCj4gPiAgaW5oZXJpdCBjbWFrZSBweXRob24zdGFy
Z2V0Y29uZmlnDQo+ID4NCj4gPiArQUxMT1dfRU1QVFk6JHtQTn0gPSAiMSINCj4gPiArDQo+ID4g
IEVYVFJBX09FQ01BS0UgPSAiLURMSUI9JyR7YmFzZWxpYn0nIFwNCj4gPg0KPiAtRFBZVEhPTl9J
TkNMVURFX1BBVEg9JHtTVEFHSU5HX0lOQ0RJUn0vcHl0aG9uJHtQWVRIT05fQkFTRVZFUlNJDQo+
IE9OfSBcDQo+ID4gICAgICAgICAgICAgICAgICAgLURQWVRIT05fQUJJPSR7UFlUSE9OX0FCSX0g
XA0KPiA+IC0tDQo+ID4gMi4zNC4xDQo+ID4NCj4gPg0KPiA+IC09LT0tPS09LT0tPS09LT0tPS09
LT0tDQo+ID4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3Jv
dXAuDQo+ID4gVmlldy9SZXBseSBPbmxpbmUgKCMxMTM5NTApOg0KPiA+IGh0dHBzOi8vbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1kZXZlbC9tZXNzYWdlLzExMzk1MA0KPiA+
IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210LzEwOTY5
ODc5Ny8xOTk3OTE0DQo+ID4gR3JvdXAgT3duZXI6IG9wZW5lbWJlZGRlZC1kZXZlbCtvd25lckBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4gVW5zdWJzY3JpYmU6IGh0dHBzOi8vbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1kZXZlbC91bnN1Yg0KPiA+IFtyYWoua2hlbUBn
bWFpbC5jb21dDQo+ID4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gPg0K


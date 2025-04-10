Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBE3AC3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 07:40:38 +0000 (UTC)
Received: from esa18.fujitsucc.c3s2.iphmx.com (esa18.fujitsucc.c3s2.iphmx.com [216.71.158.38])
 by mx.groups.io with SMTP id smtpd.web10.28790.1744270830910994648
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Apr 2025 00:40:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=HE1bjovm;
 spf=neutral (domain: fujitsu.com, ip: 216.71.158.38, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1744270831; x=1775806831;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=evwCbsMh5DOYLIH6t6Mos+1Qw+RLcUSyFCmS5npoF1M=;
  b=HE1bjovmvQqpvy582RA8k/YqLwjeufRU3TdqdfkogajjAP+Ewr/VAj0X
   7RN4GTT5og1YdSUUNzykh9FUvqooW8KN+iH1BGoZ27k4S+Fbbz7TzV9ES
   xxTSGLlL73QdjCnA9b2ypLx5WWhbeiFNhrJ6zbQKAD8IReRcN48zHci1u
   FNEKrQzxIHVvJT5EouGH7MNxCe6FKWRM2I8YkuUPRHq6I5q1hvix9Pg7m
   bIRu1qDcgithQS8i4jK0goF1qNr4pepzpnTPOG2KcNC5hKP9NsACsSlyj
   oGA5GeVOUJnv7QrGQd7zuS7EvqssEzDPSK1wMf8c1ZLdONHKv5PTkobGz
   A==;
X-CSE-ConnectionGUID: EMxK56a6TgiEDCwrox8Lfg==
X-CSE-MsgGUID: IcBIDBBFT9m155xjnwdXtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="158882863"
X-IronPort-AV: E=Sophos;i="6.15,202,1739804400"; 
   d="scan'208";a="158882863"
Received: from mail-japaneastazlp17011029.outbound.protection.outlook.com (HELO TYVP286CU001.outbound.protection.outlook.com) ([40.93.73.29])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 16:40:28 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gpAPmtblUC66gSLdL5acMrWJ+a+uvIQmo5VjsOZyt/M6JznfiJKFq3zn7uhibLQN1ibrqEs/0uvhGTBXwnED+wuEShbnRZihzUQsFhnluCzyrZPNfGbqgbzyX4yXwrCHVnwVZrtXplqmCoI4pX6FLDox+sxpBnEc/4yAaGhY8j4CfHwG/hTQOKk48V0oRBrBDnT/ZcR/Q5bNNCqjfcUg2b0uv9opNa4AzSuz2lWQy6e0ojraXloWk6oBQ6yciTnMDkHEqVJNg5vRq21ndBif2b0Z9ff+phEaReePa1eFf8T478VPLWdEvo36AEpBMHXce5y7zNMuo1aD1jPNFNM/NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=evwCbsMh5DOYLIH6t6Mos+1Qw+RLcUSyFCmS5npoF1M=;
 b=DqqaaafVD0SI2djSVTrdchdAo6cr26yAxT6Q2Q6l9JGsPt0QFgLobqcxfzA9Udxu4fAE0bUmE9phGL2s7WlE8Aow59tHQsO4v2Hm/7DvZ/d8O3K+v5s1lcZyXzzfFQWwSpgP2hxTXcC0+yUGkrE3w/GqYhgcqIuVRAmFJBQDhuWugfpJDqqAbF/N3C3UgWn4il+7HGt4x/DBz0+dMJyq/eoHC8oOdSpkmeeCAaoILjll+H2vA+tmBRHYnsAkXAptPaQtN+gXMckzN05aqWKRKETW73c3ws/mRv7v8Uqo7Bo/OxgpPtX3JxAj7rdmlpgHv0pvUy6HzaAlIAjR1rdO8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 (2603:1096:400:3fb::13) by TY4PR01MB12957.jpnprd01.prod.outlook.com
 (2603:1096:405:1e8::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.23; Thu, 10 Apr
 2025 07:40:21 +0000
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e0dd:28e5:6a6e:2342]) by TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e0dd:28e5:6a6e:2342%5]) with mapi id 15.20.8606.029; Thu, 10 Apr 2025
 07:40:21 +0000
From: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-python] [PATCH 17/30] python3-multidict: upgrade 6.2.0
 -> 6.3.2
Thread-Topic: [oe] [meta-python] [PATCH 17/30] python3-multidict: upgrade
 6.2.0 -> 6.3.2
Thread-Index: AQHbp53ikOotbl35KUW+5JO60dFgRLOZ84UAgAKUc0A=
Date: Thu, 10 Apr 2025 07:40:20 +0000
Message-ID: 
 <TYWPR01MB11861206AA0FEE6F16341991DDCB72@TYWPR01MB11861.jpnprd01.prod.outlook.com>
References: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com>
 <1744017431-22217-17-git-send-email-wangmy@fujitsu.com>
 <CAMKF1sqLef9z8tRJPoV=zYZRGyY3RqzP2d3OuqeDu7qnqYaMNg@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqLef9z8tRJPoV=zYZRGyY3RqzP2d3OuqeDu7qnqYaMNg@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5Njgw?=
 =?utf-8?B?MmZfQWN0aW9uSWQ9ZGJlOWQxZmUtNmZhNi00MzFiLWEyMGYtOTk3MmVjZDQx?=
 =?utf-8?B?YWVkO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMz?=
 =?utf-8?B?OTY4MDJmX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQx?=
 =?utf-8?B?LTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX01ldGhv?=
 =?utf-8?B?ZD1Qcml2aWxlZ2VkO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFk?=
 =?utf-8?B?NTUtNDZkZTMzOTY4MDJmX05hbWU9RlVKSVRTVS1QVUJMSUPigIs7TVNJUF9M?=
 =?utf-8?B?YWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfU2V0?=
 =?utf-8?B?RGF0ZT0yMDI1LTA0LTEwVDA3OjM4OjU0WjtNU0lQX0xhYmVsXzFlOTJlZjcz?=
 =?utf-8?B?LTBhZDEtNDBjNS1hZDU1LTQ2ZGUzMzk2ODAyZl9TaXRlSWQ9YTE5ZjEyMWQt?=
 =?utf-8?B?ODFlMS00ODU4LWE5ZDgtNzM2ZTI2N2ZkNGM3O01TSVBfTGFiZWxfMWU5MmVm?=
 =?utf-8?B?NzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX1RhZz0xMCwgMCwgMSwg?=
 =?utf-8?Q?1;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB11861:EE_|TY4PR01MB12957:EE_
x-ms-office365-filtering-correlation-id: eb3a221d-3637-4670-61c0-08dd7802f27c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|4022899009|376014|1800799024|1580799027|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?VmFGYTByY0VtL2dvK0RBSDRhT2gwWFFuVzE1dmJiVjdJWFJxWFpmOVA1Z3FS?=
 =?utf-8?B?RTA1di9HTjNZckNkVFYvSHEzUmNtZHY4UEM2V050ZnlQNlQvUkxuNTNpdW54?=
 =?utf-8?B?T3lvb3lUcnJpR2lVclA4UktaamtEYXEwQ2JqV2hnSVNETXNlUEZLMHZodHdY?=
 =?utf-8?B?aWxPb3BMbVprS2pVdENkR1FUS0MyUTB4UkQ3WUROd2p4NXhQZkRoTnNtYmFN?=
 =?utf-8?B?OTJtQ2hrL3lnMjFCUHJIT21qYkhveDVHeGFzZUVJL0RENHd6TURNaTExUUlM?=
 =?utf-8?B?MEQwTVBoYjIwbnNvL01tS21wcFo0SkhNVnZBOVBBV01EOVpOcVdvWXU5TmNs?=
 =?utf-8?B?dCtpazJNekU5dzdxWVo3M0dOUmc3RVlPeEUwMERnWGs3MzlFaW54cG11clRm?=
 =?utf-8?B?Zm54VmM4SjM4T1pPRnBWYXVSbFI0VnpUNGsydFl2SnZNalhPa3M3dWNRNkh2?=
 =?utf-8?B?M1puSitBRURpSVRWODFuMUlDNXUvZGdMMUkwSS9TVTA4Y1RiTFZYR3g3bVhM?=
 =?utf-8?B?SHIzTFE1SGFaM2Q4K1UzV0NFNGRjMGxmdWxOWjN4dVh6Ny9xNDFGR3VDS1BN?=
 =?utf-8?B?L1Z5ZUMvUmZtUVd2bDc0Vy8xTkZMTUtubXYzc2o5cE9XbnhlRmc5bXlyLzV4?=
 =?utf-8?B?TGRYd1ZwRGVCeVpFSUpudmJlR1dMSUhEMkZTcmpsUGlGb29KQW9TOXFBb3l0?=
 =?utf-8?B?c1cxK3VBYVJhV3hObFU5REhiUlNhdnV5MTYxU1hraTZ1RHM5S0hLZlNQMEFj?=
 =?utf-8?B?SEN1bkNCTzVVKzdjV3RaYmlDOUpLU2RCUy9vRGdJREU3MWgyMDRZcG5KMGVz?=
 =?utf-8?B?eHprMlNJa0lBMTJHb2dMU2Yyc3MzOUtxcHh1R2hKUEpXRytha05QTGJIOWQ0?=
 =?utf-8?B?RXZqbTFISGhzTHQwb0t6UStlL0Z1S2Rhc3RQZVBjUDNVVnRNeXB1MUNoNGNN?=
 =?utf-8?B?cXYvK1YvbjFSQVdZcDhhaXdBa3NrdmE4YjIrUThLR1ZGRG9mb21rL0lnSkVR?=
 =?utf-8?B?ZTBNUXB4cUFldzZicWVySmpmN2lqWGpTQk5oa3YzMGxsRHZSb0g1OUl1T2dt?=
 =?utf-8?B?U3NBRDZzeDhBa3BLVVprQkFLeVdhaW5uSkduVkZRK2prb2ZnUHhJZGtlWnhy?=
 =?utf-8?B?V1NzL2Z5dXZwZjNiQTErcTZkWVJMUGprOGJTeWNRNDdIVkh2UzVJWmh5MGdD?=
 =?utf-8?B?bGFSSE4weUo5RVRDTG44Mzg4NWwyQUhrRG5GeGkxN1pneXJoM1dYYkRTbER5?=
 =?utf-8?B?Y3VXeWdzMUducFJsUlFScUpLZExTWE8yNnVHOE41eDQ0VXJ0VE80ZEovRDZx?=
 =?utf-8?B?ek1tVDVicTJxM2NUamJSMi8vR0FJb1I5a0RXWnN2Wno5SDRZSWdnVy85dVY5?=
 =?utf-8?B?cTJiQWRVMko4L0JEYzdLTmdGeHZqWkU2TnY5VmZkMDUwbDRBeFQ5bDI0T3N1?=
 =?utf-8?B?Z1V4cExaM1JVRzhWQzZTQmhmNGhKTURhWDcwN3lEejlnb1RvMmpwSHJCRS9J?=
 =?utf-8?B?RitNMDhVa0x1VFhmMzE5clhZaE94YXBEbXhlQmhWVktVdktBblFWWFJzV0Fo?=
 =?utf-8?B?RjY0bnpDNlNnb0MxbDgwTlN0aHk5Y3RJcnBBLzQ4cklPZWxMMXN1dzNOU3VY?=
 =?utf-8?B?a25vdGFKZnZkK3MxYVVXaWw1dXI2Z0xVNXpPSXN6aWl0cmFCNGp5ZzF5dmtK?=
 =?utf-8?B?TWoxQlh2SkZRbk0zK24zamR5bFVNNEZKejlSVHlFOHcrcVhxMkJKTzRJUFVM?=
 =?utf-8?B?MVM2RjNmQ2FhWTFaem1COG5xdmg3YlRNb2Uzb1J0QVRSa3IyQWdtWTlZTldq?=
 =?utf-8?B?WnVjV2pGZ2lhRVE2bXZFcDB6ZU9JOUVlMkkwWVVaaGZ2aU44WVRTbFhVbjVX?=
 =?utf-8?B?MFo2YXp3NEIwM3RMVTNHTVBWSitjTm5kcCt2OUttUkpaaWJYY3l4aFNMUWkw?=
 =?utf-8?Q?NuAKH1u4smE=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB11861.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(4022899009)(376014)(1800799024)(1580799027)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?azE0aHh1VDVUNjg1TkxSS0g3REpDY3pKMGVhZFBYR2kzNHZZY1VUMkhXZ2Mr?=
 =?utf-8?B?M3o3UTk2WW5sUUFuTVkrWDdEOC9qS1hLR1JDTjFsampPY3UxOFh5eG90bGV6?=
 =?utf-8?B?cEpVaC9LRXNyeThpa0Z6TFNoU2hjZ1ZRb3I1T1h3QVBZY24xL2pJcU1aMUNa?=
 =?utf-8?B?eEE5MDdoZnVvWWxzSjZnTStKZU5WZEZlOXdFcUZES1lCaHFjRm9XVTdqak1p?=
 =?utf-8?B?M0M3NCtHcVBqZWk4YTNLUkRybTRHKytRbFdGYWJHRDhzdEpmNFF3TGVBR2VE?=
 =?utf-8?B?aTgreXVVZW0rZTNMZ2JCTERIZ3FDRU5IWndyV1JBQnN4SldCa0JFS1M5cXFh?=
 =?utf-8?B?MHN0U0NFS0U4aDNYK2xVMHNzNEtGLzZqVTlxYTVrcjVyTXRmVzAyRUlIbGhz?=
 =?utf-8?B?MmhLWWFPUWdYMEx5Z3RNQkZmdEU2eXBrczZMN0l3NXoxdWNMdXdBc0NFY2p5?=
 =?utf-8?B?NmtjMWpremxqcU1lby9Ba01sUE90eTlob2FyQ1A0QmpJT2QwUFBNUGc0MGNN?=
 =?utf-8?B?d1R6cFdZZG52ZlVUeS9GcWNXdW4rLzFyUWRycTN0bFNJWDdibzBkYkl4cWdm?=
 =?utf-8?B?cW04NEJHSDlHbTlGblloNDdwNkZycTdrbUQxUkM4V1dIckRoTFlvVm1LSWRF?=
 =?utf-8?B?S0ZmUk1KbWdpc0ZSQzM4VXlIcWhHdSs0K1AyVk1ULzR1b0puMUxOT0NtbzJ6?=
 =?utf-8?B?VmdGRFFITFpZNHVvK08yeWd2VStUY1dHNHVCRE5RcDhHM09uMTgrbWNteFVw?=
 =?utf-8?B?NW5TT21hMk9ha2xFWlhNUmVNYlJUZDRhSWxFME9ETnhZMTVjZnpDN0UrMThk?=
 =?utf-8?B?T3hFOEJMa1cvOWJHZTh1bHJkbVpDcVUvTTM5d2k0ak9GcWVrYkRlMGNEYlNE?=
 =?utf-8?B?OXlWU01BWGpVd25OZS82Q1FTMzlheHl1Z0MzYTJGSjcwSzZRMGMxVyt6ZXNa?=
 =?utf-8?B?UEtuRlZvN2lOVy94eXVJeWdPckhzRHlKdUZGUUpRelRvdTVDQVVGZ3g1VURD?=
 =?utf-8?B?OTQ4djI3dURXay9waFlHOTM0VVdkcDJxWEZxWm1vbEJldStoMzNkcnpVZUI4?=
 =?utf-8?B?aEQ4ZnM2QkdHQmRGcElTRGF1MDhvU0xsUHIwUk9RTUFCK25KeHVnNnNtRlJ1?=
 =?utf-8?B?TW55NmdrZ2lrdXpYbmVTbmN1MU8wNUxlRXNGUGpBdWdxSlg3SU1FZTB4RE43?=
 =?utf-8?B?VVJPWlRjWXpUMHRReGFwOFFWUTdIY25INGRTYzZIL3RlL0tBQm54Y3c5bk5T?=
 =?utf-8?B?T2F2dHFtbWtKeFJYVEJnak5kU1NhVitpRmtUQVJxWXVRTU1FcjNIQ0tMMDB6?=
 =?utf-8?B?N3RoSGZhYVZpcTZFWFljTXNOeG13YUNHaWRaSS9qMFJmZkV0TW44dS9tUTA5?=
 =?utf-8?B?Y013dllKdVNpampQOVc0U2RzdkYwcTRRRTVWcDRrVEJuK3oySFNUQ0lnOTla?=
 =?utf-8?B?OVVKOCs3T2JSSC8yblkxdk9hL2RXeXprNUp5RysrSkZydEFDd0MzSnprRWph?=
 =?utf-8?B?VGc1Z0M4cC9oTFpyc1J5RmNCSm9GU2VHTzgzcC8wem1UTHhubDRtNUFabms0?=
 =?utf-8?B?WHo3K2JHNkRwdGErRkJSazdkS0N4L2JKQVhwRGxncUo3OUJGQStiZUZrRk1n?=
 =?utf-8?B?ak9pbmpUa25SQkRHZmZVWjZlcFBLNHJhNDltZ0x6ay9KNFhER1I2MG5MN1FG?=
 =?utf-8?B?NlkzRU0zalpyTnBiU282bjk5ejRlakR0cUoreHpJWllCQmhlUExKWW5BKzJ6?=
 =?utf-8?B?MURZN0VaZ2xvUU9FcWxKdWhSSkRQRlhXSHJlWmhzSTFQRlRhQXMvdjlYdzVB?=
 =?utf-8?B?bHo5ZXJZSXJFbHVPQUhhZjZhOEErZU1Ld0EyR2JPU0NTRkEzSTAzbGduMmtx?=
 =?utf-8?B?WFRQVUZITkVJc3VkVCtCVisyRUFDV21yYjM0UDBDdjM1QTBJUUFJdTRJV2JW?=
 =?utf-8?B?S1FBOXlJUmJ2SzRtWWlGQ1luOXpXODlHeGJ1OGJJN3ZQMkdENDhDd2tBSjB3?=
 =?utf-8?B?b1JYRkpPSEMrY0xEcUp1bHVCNWFubkRUK3JtY1J6Q3FMSXQzcXlqMDJURUNO?=
 =?utf-8?B?dEZsZ29NVmVULzV6TmNXd1BwMndBdUlzS2pKNnpZZFBKdXR4dU1qeHpETHBM?=
 =?utf-8?Q?W4tciyt/HUxofkC42fxqBEE4w?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	jCVsNcss3GVBgJHYxadJn1h5hacpEZQRZLkXaF3QhFKceXriarnv1JzMY29IGWchnriiKoZlcud+hTL5K6O5U6gjP67yJfn9YN199Ku+axn8Ae1qpEWrIMCgA+EEfVDakGOAaZ93fFua7y/kPc4LlOWbfGQcVghCRgZ9/fv5nn8m1r85HWzIhAXbKvuGoSgxw5fNbo7qQrtr5XMIFgGCZtia27NPY9mWm+bEM6bp8EBrJF5CBJgMQZsvzFcds+YVv/jiScxUxK0vLqBUY9+2eTsfl6FzHKvaAYv3330tuOd1k2cW2Ma6FRmksQIpT1ih+WfttYE+lUdPMogzxFpp+tU7Wx/1L/0tE3I6uRHsI1+iJu6xkZ1pbKeVBhbubzyLbn+latrOaW49ayPR1IiW7XRBQ7upc/uZPdt6GzALbN1bTf2VNpTRCE0XbA/jnJa2wXcgx7/neyYBI9aT06dLMYjwTiRg3m+4oRON3RL3hxy33s8VA8KBqggvxFCbYSE7TjXo+LvvY2WsPZoKOH9I707Ib4cJ1b/1NWHIqhvdipgj/V4NiqRznR9Dviot4qBLjk2bGx9MelaXepHUbY6AqgyHL8eW9opcGE1qI18UBY/Wr8akxAYpQfXcFSKmjn0+
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11861.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb3a221d-3637-4670-61c0-08dd7802f27c
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2025 07:40:20.9599
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K63IsS8CCDrpVGZbNmpHkFdCP4l2qyWbiU493PAOo6Eo21n5LDMDFSbUx/zuV8F3UnzWw0lpxMdUzqxidEJDOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB12957
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 07:40:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116763

SSB1c2VkIHFlbXV4ODYtNjQgdGFyZ2V0IG1hY2hpbmUgYW5kIHJ1biB0aGUgcHRlc3Qgb2YgcHl0
aG9uMy1tdWx0aWRpY3QsIHRoZXJlJ3Mgbm8gZXJyb3Igb2NjdXJyZWQuDQoNClRlc3RzdWl0ZSBz
dW1tYXJ5DQojIFRPVEFMOiAxNTk2DQojIFBBU1M6IDE1OTYNCiMgU0tJUDogMA0KIyBYRkFJTDog
MA0KIyBGQUlMOiAwDQojIFhQQVNTOiAwDQojIEVSUk9SOiAwDQpEVVJBVElPTjogOTANCkVORDog
L3Vzci9saWIvcHl0aG9uMy1tdWx0aWRpY3QvcHRlc3QNCjIwMjUtMDQtMTBUMDU6MjMNClNUT1A6
IHB0ZXN0LXJ1bm5lcg0KVE9UQUw6IDEgRkFJTDogMA0KDQogIC0tDQpCZXN0IFJlZ2FyZHMNCi0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KV2FuZyBN
aW5neXUNCkZVSklUU1UgTkFOSklORyBTT0ZUV0FSRSBURUNITk9MT0dZIENPLiwgTFRELiAoRk5T
VCkNCk5vLjYgV2Vuemh1IFJvYWQsIE5hbmppbmcsIDIxMDAxMiwgQ2hpbmENClRFTO+8mis4Nisy
NS04NjYzMDU2Ni0tODU2OA0KQ09JTlM6IDc5OTg4NTQ4DQpGQVg6ICs4NisyNS04MzMxNzY4NQ0K
TUFJTDogd2FuZ215QGZ1aml0c3UuY29tDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
Cj4gRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4NCj4gU2VudDogV2VkbmVzZGF5
LCBBcHJpbCA5LCAyMDI1IDEyOjE1IEFNDQo+IFRvOiBXYW5nLCBNaW5neXUv546LIOm4o+eRnCA8
d2FuZ215QGZ1aml0c3UuY29tPg0KPiBDYzogb3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtvZV0gW21ldGEtcHl0aG9uXSBbUEFUQ0ggMTcv
MzBdIHB5dGhvbjMtbXVsdGlkaWN0OiB1cGdyYWRlIDYuMi4wDQo+IC0+IDYuMy4yDQo+IA0KPiBU
aGlzIGZhaWxlZCBwdGVzdHMNCj4gDQo+ICAgIEZhaWxlZCBwdGVzdHM6DQo+IOKUgiAgIHsncHl0
aG9uMy1tdWx0aWRpY3QnOg0KPiBbJ3Rlc3RzL3Rlc3RfbGVha3MucHk6dGVzdF9sZWFrW211bHRp
ZGljdF9leHRlbmRfZGljdC5weV0nLA0KPiDilIINCj4gJ3Rlc3RzL3Rlc3RfbGVha3MucHk6dGVz
dF9sZWFrW211bHRpZGljdF9leHRlbmRfbXVsdGlkaWN0LnB5XScsDQo+IOKUgg0KPiAndGVzdHMv
dGVzdF9sZWFrcy5weTp0ZXN0X2xlYWtbbXVsdGlkaWN0X2V4dGVuZF90dXBsZS5weV0nLA0KPiDi
lIINCj4gJ3Rlc3RzL3Rlc3RfbGVha3MucHk6dGVzdF9sZWFrW211bHRpZGljdF91cGRhdGVfbXVs
dGlkaWN0LnB5XSddfQ0KPiDilIINCj4gDQo+IEkgd291bGQgZW5jb3VyYWdlIHRvIHJ1biBwdGVz
dHMgZm9yIHJlY2lwZXMgd2hlbiBkb2luZyB1cGdyYWRlcyBldGMuIGUuZy4NCj4gZm9yIHB5dGhv
bjMtbXVsdGlkaWN0IG9uZSB3b3VsZCBkbw0KPiBiaXRiYWtlIG1ldGEtcHl0aG9uLWltYWdlLXB0
ZXN0LXB5dGhvbjMtbXVsdGlkaWN0DQo+IA0KPiB1c2luZyBxZW11eDg2LTY0IHRhcmdldCBtYWNo
aW5lLg0KPiANCj4gT24gTW9uLCBBcHIgNywgMjAyNSBhdCAyOjE34oCvQU0gd2FuZ215IHZpYSBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IDx3YW5nbXk9ZnVqaXRzdS5jb21AbGlzdHMub3BlbmVt
YmVkZGVkLm9yZz4gd3JvdGU6DQo+ID4NCj4gPiBGcm9tOiBXYW5nIE1pbmd5dSA8d2FuZ215QGZ1
aml0c3UuY29tPg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogV2FuZyBNaW5neXUgPHdhbmdteUBm
dWppdHN1LmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL3tweXRob24zLW11bHRpZGljdF82LjIuMC5i
YiA9PiBweXRob24zLW11bHRpZGljdF82LjMuMi5iYn0gIHwgMg0KPiA+ICstDQo+ID4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKSAgcmVuYW1lDQo+ID4gbWV0
YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtbXVsdGlkaWN0XzYuMi4w
LmJiID0+DQo+ID4gcHl0aG9uMy1tdWx0aWRpY3RfNi4zLjIuYmJ9ICg5MSUpDQo+ID4NCj4gPiBk
aWZmIC0tZ2l0DQo+ID4gYS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLW11bHRpZGljdF82LjIuMC5iYg0KPiA+IGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1tdWx0aWRpY3RfNi4zLjIuYmINCj4gPiBzaW1pbGFyaXR5IGluZGV4
IDkxJQ0KPiA+IHJlbmFtZSBmcm9tDQo+ID4gbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1tdWx0aWRpY3RfNi4yLjAuYmINCj4gPiByZW5hbWUgdG8NCj4gPiBtZXRh
LXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW11bHRpZGljdF82LjMuMi5i
Yg0KPiA+IGluZGV4IDhiMzA1NzQwMjAuLjRlNGQ2OWJiZDQgMTAwNjQ0DQo+ID4gLS0tIGEvbWV0
YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tdWx0aWRpY3RfNi4yLjAu
YmINCj4gPiArKysgYi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LW11bHRpZGljdF82LjMuMi5iYg0KPiA+IEBAIC04LDcgKzgsNyBAQCBpbmhlcml0IHB5cGkgcHl0
aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YQ0KPiA+IHB0ZXN0LXB5dGhvbi1weXRlc3QNCj4gPg0K
PiA+ICBQViAuPSAiK2dpdCINCj4gPg0KPiA+IC1TUkNSRVYgPSAiYWYwN2Q1YjJiMThiYjMwZTA0
MTk4M2RiMmJlYTFmY2IzZTFjNGI3OSINCj4gPiArU1JDUkVWID0gIjBkNjY3NTg5Y2QwMmM4Y2U4
MjUxMjI2ZjhmNjRmZDg2YWZkN2ZmYTMiDQo+ID4gIFBZUElfU1JDX1VSSSA9DQo+ICJnaXQ6Ly9n
aXRodWIuY29tL2Fpby1saWJzL211bHRpZGljdDticmFuY2g9bWFzdGVyO3Byb3RvY29sPWh0dHBz
Ig0KPiA+ICBTID0gIiR7V09SS0RJUn0vZ2l0Ig0KPiA+DQo+ID4gLS0NCj4gPiAyLjQzLjANCj4g
Pg0KPiA+DQo+ID4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gPiBMaW5rczogWW91IHJlY2Vp
dmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gPiBWaWV3L1JlcGx5IE9ubGlu
ZSAoIzExNjY0Mik6DQo+ID4gaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVt
YmVkZGVkLWRldmVsL21lc3NhZ2UvMTE2NjQyDQo+ID4gTXV0ZSBUaGlzIFRvcGljOiBodHRwczov
L2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQvMTEyMTI5Mjc0LzE5OTc5MTQNCj4gPiBHcm91cCBP
d25lcjogb3BlbmVtYmVkZGVkLWRldmVsK293bmVyQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4g
PiBVbnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVk
ZGVkLWRldmVsL3Vuc3ViDQo+ID4gW3Jhai5raGVtQGdtYWlsLmNvbV0NCj4gPiAtPS09LT0tPS09
LT0tPS09LT0tPS09LQ0KPiA+DQo=


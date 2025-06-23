Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 797EBC77B7C
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 02:17:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.10543.1750645050025743643
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Jun 2025 19:17:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8269b848a3=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N1OkMZ012603
	for <openembedded-devel@lists.openembedded.org>; Sun, 22 Jun 2025 19:17:29 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47dr14s3pg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 22 Jun 2025 19:17:29 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55N2HS7m026081;
	Sun, 22 Jun 2025 19:17:28 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2043.outbound.protection.outlook.com [40.107.243.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47dr14s3pd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 22 Jun 2025 19:17:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eIS1VuVQSDThaQwSkxNJAJhxg9MFhx4wzvvRFPvI6ZZq69GzKLtWS/rNJKeMplYb/jTAV5lsSEpjvVkF93PlFid98g91y3+IczoYARTaW4gqD16DCwTCup4CG81zcdYzoVOx0LSDox3f8VC5izlffCh2icFh9+QfGfbk/UritMPsVd8kz5RGyMOgicGOh9zCJHRP6Bi+CRy3a8qFrj8/f0IwZO55J3prfja7ThwvmWlT4+UN9bPBnfitwLnzLVmLTH7i2VUS/fqgpfXTrDUWHiWfK0v18L8hTy1FRfvCUmwcVeLb/XBKeNh7OagWueAQWtsdInyTRmG+HwqgpkMRhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=828gm9etrGeW4ssDH34GAHBHRSGC73o8/L39ss93IkI=;
 b=WRCcpIi0XbD+0V81GdMrJsiM+ZDdnIqgl32EXWBWdS7M1vy/JAgCjOIVHpHuiRq6TCw7bCTP6BTXYiYdEesTvmFWmjTpXuEzjguBYSTOiGUAtLY6NIT7mWO0GAt0Ysv7LF0iB7gHOndYxcTvzgqXLo3XCoaq1nXv+OiNKlJn0Q0ZL7TUM0Xyk4fhspvpns5ydgBgByNZ1pornwMwCRcBhl3So27dkTXO1kdDNSAJ9heYJFNprHz+sSo+WRqA7aeLUafqaju2j/zJyL8CTmvY3wTbzV55W2+LVMVJI2BkmH3NAgUC1ZExYtJ+pINYxvbhcFYHlf/RVCGInb5v4/3zAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA4PR11MB9420.namprd11.prod.outlook.com (2603:10b6:208:563::13)
 by IA0PR11MB7815.namprd11.prod.outlook.com (2603:10b6:208:404::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Mon, 23 Jun
 2025 02:17:24 +0000
Received: from IA4PR11MB9420.namprd11.prod.outlook.com
 ([fe80::2714:5169:aa4d:163e]) by IA4PR11MB9420.namprd11.prod.outlook.com
 ([fe80::2714:5169:aa4d:163e%6]) with mapi id 15.20.8835.027; Mon, 23 Jun 2025
 02:17:24 +0000
From: "Song, Jiaying (CN)" <Jiaying.Song.CN@windriver.com>
To: Gyorgy Sarvari <skandigraun@gmail.com>,
        "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: "Yang, Liezhi" <Liezhi.Yang@windriver.com>,
        "Li, Changqing"
	<Changqing.Li@windriver.com>
Subject: RE: [oe] [meta-oe][PATCH] xmlsec1: avoid hardcoded ${RECIPE_SYSROOT}
 in xmlsec1-gnutls.pc
Thread-Topic: [oe] [meta-oe][PATCH] xmlsec1: avoid hardcoded ${RECIPE_SYSROOT}
 in xmlsec1-gnutls.pc
Thread-Index: AQHb4dqzwUWXw/JD7U6o64crY+yw57QQBD2g
Date: Mon, 23 Jun 2025 02:17:24 +0000
Message-ID: 
 <IA4PR11MB9420B5C05331D3EE22BFE977B879A@IA4PR11MB9420.namprd11.prod.outlook.com>
References: <20250620041131.2424118-1-jiaying.song.cn@windriver.com>
 <1a7945c4-9a7d-4587-8a85-915bae147202@gmail.com>
In-Reply-To: <1a7945c4-9a7d-4587-8a85-915bae147202@gmail.com>
Accept-Language: en-AS, zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA4PR11MB9420:EE_|IA0PR11MB7815:EE_
x-ms-office365-filtering-correlation-id: 287a673e-0246-4e6d-a470-08ddb1fc17d5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?Zmh0NFVmTExELzVLakRid2pMemZqVXBveEl1RDRUL3BuYnhzRW1MVmlSQU9O?=
 =?utf-8?B?TnovWk5PTmVVQzdad1p5bHNyTXdpbjBGQjRkcUYwVHdGWlRrSmZJTjhNYTc1?=
 =?utf-8?B?NDRCYWVwWVR4WU9JeEw4YWhuTThqMnM2M204OUYvaXlqaFl2aGlQdjNHOHJ5?=
 =?utf-8?B?N1JBTjZTYitCakhUakdNakJBL0JrSlVWQzVnZ2lSSExUM0VEVWdab1JiUDlv?=
 =?utf-8?B?RWlTRDl2aDBmZ2hsQm5HcU0vaXdMQVdYR083MFFMdExtMkVsbExMSHJVaFpZ?=
 =?utf-8?B?aityYnZSZTQrekIyRVlVUExjNUhkL3dKSGkvbyt5RzZRRG4vQVhTRjVWZkQv?=
 =?utf-8?B?VHpQMFpUSGZJci82N1RWWDM1WEZOT2czVEF4V2RkcDFKVkJmaDVZTU9JQzNj?=
 =?utf-8?B?KzhLUlZkc2U0Qml5akZoYytuenpUdlNTNU1rbmptYXB6QUF4dTRPWitBd0I4?=
 =?utf-8?B?MGVZWUFZYkwwZDNydGRWUUtrUGkwc3AzbUVyOVFiSkpNVmJzeWpFODFJeDBm?=
 =?utf-8?B?ejBnRFpVditVaG5Lb0RaMUl2UndkU0ZqWkNJY1ZxVVkvRmFJOVJNRXNZTmI0?=
 =?utf-8?B?TFhHczc0aDlBODRDK1ozNkhEZjczZG9qdzB6a01xZHRxcFNHMXRYQ0pZdzZn?=
 =?utf-8?B?NVltc0NpdGVwOHo5UC9pUWgzM01Zb1AzRmFkN3RTc2VxSmErd3gwbUh5SWkv?=
 =?utf-8?B?VnByR1dtRmxSMzdGRXBnV0hFYnFpUnVhcWRTQ2M2elpnYSs1LzdNZHZOeU94?=
 =?utf-8?B?eElvY3QxdDRmU1pobXBJWHRXQ3l5SmpRTGlSSU1YNitXcUxScGNRNnI2VEdo?=
 =?utf-8?B?aUVmaGlGY1NicVNLcFlCZTRkN2plZktFdUlTQ0RqbjIzVEFNU21wU3J6cTVJ?=
 =?utf-8?B?TkZkMFBXd1J1UE91QkowNVRTRmRrdXFOSDNHeU56blhnb0ZyNmZvaFBqSnEy?=
 =?utf-8?B?UnNXS3FBRnp6U2FnUDNBVUkvcVNSQmZKQVhHVXoxaFpQbHErdEcwU2RMU2pB?=
 =?utf-8?B?S0lZOEdTVlU2ZFRNOGoyLzF1MFlqTVpuS2VxZHZlZ2lZcis4dHhDOG5MZnJL?=
 =?utf-8?B?Q09JOWltcDd1eWdqbWxWWFZMVjZzN09HNmFYYTFVUXU2Rk5VY21mNEJQeTNR?=
 =?utf-8?B?Z1g1WUZ5MFdTc2tGZXpjUVBNbSt3TXNLTzgrNFNNM0RCZ0tOSWhsWm1ZNk1P?=
 =?utf-8?B?VEFubDRxd0NNajBZZTZwQjhaOFIrZ2xPaTJOTFpnUFZYSnJ6b3Excng1d1Ft?=
 =?utf-8?B?VnNLUmVTTDVQbkdFSVZ4QkdwSEhnTEttTXM0eFpQNlhBYkZsNTdBWHFYWkpn?=
 =?utf-8?B?ai9FOVFFU2VjaE1QcnNvcGlYWkI3MStZMEgwQW1jMGNuY3JpUG4wRW9UVjNK?=
 =?utf-8?B?TjZ3aWxSZ2dpS0I0bTVYbFFGejdMNFErQXJnSVdDc0pRQkNrVGdrQmhibEp1?=
 =?utf-8?B?V1BRaFhBL0xYVlJ6RWRaTHpMNzEwZ0h1S1VRZFVDK0FUd1lqMGNlakRFd0Yx?=
 =?utf-8?B?c3RtSERXL2tBRVZ3REVEdlFuYXZ1dDNvKzlhd0x0aG1xUFNGVTVyNmZRUWFU?=
 =?utf-8?B?MDB4L1hFekxLZ0MyWG9hTldidW5oWVd5VVkvVTl2NEcrS2lrQVhNZjJHUzMw?=
 =?utf-8?B?V3ZwUzYrSkMvZ0k4WHh3Y1pZYTM2TzVhbk1mcVZ6TDcyOGwvSnhCbitSbk5y?=
 =?utf-8?B?dlQ3L21veFBxR2FiQXBBNzg3Q1Y0dmJ6cFFteEJSL0V3dm5ydElUOEw1c1RJ?=
 =?utf-8?B?RmZ1VS9rUGJnQXNuQ2hzM3pyQkc3NkFjZ3YzSFg2dzd3MG52K0piWWZUTjVW?=
 =?utf-8?B?ajFma2xSeEUvMHBPQzZsV3M5ckh6bTFlOGJ1ZFVuZjRhTmN1aHdSQ1NuUmNI?=
 =?utf-8?B?aFRFU1RJaDVwQnZoN0hBN1RKOC9jZmx2MjNIQWxNUHNQSC9JZnNpbXliZXVT?=
 =?utf-8?B?ZkhHQzd2RERNMFFOK0lZS1M3VUdDbmVzQ3lod2lnazl0R0ZjaE9sNElrSm9P?=
 =?utf-8?Q?sXaGD5yotOlAvtGdVeY4oCluKY3Bu4=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA4PR11MB9420.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?b2pweDlaNmwvSm5NL1lpa2tkYUprVjNqYUIyUHQwWEhLY3BDdVl1RVdKYng5?=
 =?utf-8?B?SEpEWUR3aEl1aktHQ0llbFZ6aDQveER3N213Z0dwYVhOVlFURlNqSkNDUVlM?=
 =?utf-8?B?S3BhN2diTkljS3Z0Vmw5U25Ea0ZKRUtPcC85S1k1RE1EQnBIZXU5SlozakxF?=
 =?utf-8?B?ZVRXWFNCQjJjWmovWmxoWFMzVURGbnNGMndnQjBxYlE1VzhyVGt5NUd2K1pX?=
 =?utf-8?B?c25GeU1QWGJGRDNUZDZ2ZjJrNDhxR2o5QUVrVDVyL3RONlFzYUlVWXNRZ3JF?=
 =?utf-8?B?RjN1N0NiRCtGQXRObWxkbDJtbitidTZNRXpsUWZNMm5hMjFZOWJmRFhuQlZI?=
 =?utf-8?B?eER2a2VGbC8raTFId1Vqb3N1SVE2K3h6S3FrekhITUU4YUN0Tm0xQ1dEczFw?=
 =?utf-8?B?Y3JMTno2VUx5N3lvbjJJMStXalhvZDRMRVNFTE1aYVJsQUh5cWRLejdDdWFO?=
 =?utf-8?B?dlRhVmhiRkFGaS9ZOUtZTzlpcUZid2E4b2pWL2h6UFkxTlNUckcyejFVaGpL?=
 =?utf-8?B?dGsxMmNyMWJwdEZvTjFCV2phbzk3WThEUVI0djVDd211MXlWMWxQY0FDWjdS?=
 =?utf-8?B?eW5IWlI4WU1SeG0xTEcwV1pFbTNsNCsvNEprdE5iL0ZhVkE2YWNJT1h3bWdp?=
 =?utf-8?B?ZnhSbG1CZStSdUE4L0hLYWMzZGUrUHJYS0d1UWVhdisxVDRBNHZOZXZHWWVl?=
 =?utf-8?B?K1dyUWdCMzZqOFl6YXVLdmk4VmNKbzZUbTJjVkdPTjNCdzVxRUVNMTRTNVpT?=
 =?utf-8?B?QkY0TlFGbTBZdzY5QlRmRU1SRUt3YmtsUXg3c2NUQXlkNWRMcDgxNk0xdHg1?=
 =?utf-8?B?WmR5OE1MY3d5UVlJaTgySkh1a0xEOW45cVFJNk1Dd0ZUOXQxUUxYVFFsQVRt?=
 =?utf-8?B?ODR5SHkwSkdQWldEcXlHUlFicFpBTU1MYWZQS1RLU1IwWG5sdndIc3J3QW5E?=
 =?utf-8?B?TzU0SW9yU2MxVmRiTzFOcFJwMVRUZ0VMYk15L05iQkw3Ry9FaUYrY3Q2cFJt?=
 =?utf-8?B?S3g3bEpPdVh0SnFBeFJsdlhFNTN2eHMwNjJNQjhEVUZWVFFaMnUySjMxODRD?=
 =?utf-8?B?bzNYcUs0RVVVL0VKMEg4WjN1L0pMRExTSmVWTTlVY0swRjdDS1JpVjlYU3VF?=
 =?utf-8?B?K2ZoTEFDMjAwVXZzM25PQ2Y3VFd4bUJSSEozcW9rU0xxUGdNelhrbVM1VjBX?=
 =?utf-8?B?Zy9LMDlwY0M0eTRwV3RWUDNiVlpkcUQvQWl2TmVlRHFNUWoyc0kzRUt3MTYw?=
 =?utf-8?B?cUJRcE5GY08wL0wwcG45M09PWFkrRTZIcDZoTjhPb3Y5Qk9CUml1T2hxTGx3?=
 =?utf-8?B?L25IV2d0MG5Db0FLZWFzMjl1ZEFJV2RqY1d5eHl4Y2N3TmlHbXpGcHQxV0FB?=
 =?utf-8?B?VkY0Q29US3V5aytWR1ZtckZGcVg0L0ErSk1uS2pjMktQVlF2ODRDVDdVV2RM?=
 =?utf-8?B?Z0c5UTZmdDN6NGZNODk5dzZjdjd6WjUwK0d6MjFJZkVLVkIxVVNSdDd4N0Zm?=
 =?utf-8?B?MEoxS0RDYUEyZzNEV0liemtkYUppcFlQaFJKVy9QZkJybDlIUCtYTE4rZjVw?=
 =?utf-8?B?MHppY0N6Tjl4eHp6ZFV0OGRyeVBLRzc0d2trVzR4Vm81THB6K3hsSVhySkhL?=
 =?utf-8?B?UjlrN1lqbCttZkxGb0xCS2l1QXRaRWk4YmF4V2lYdmRMcXB5MlkrM3NjYzdM?=
 =?utf-8?B?My9rR1dsRXgydEpJbWN4UEZXMFp5b2hHbWwwTDRtU1Nwc0RiNlEwaWVmM1Bz?=
 =?utf-8?B?emgrRGhwWUlia2lJbHVqcm0zb2xrcE41YTVNMGwrMEI2a2FVZHBLUDFETmFu?=
 =?utf-8?B?bGg5QXIrb2diYWp4S3M3emNQemoyYlZhL3BPdDhuazhFMXFWaDdscmNUWjMr?=
 =?utf-8?B?ZTRSd0tuMjBnTC9XN3RRTDVycFRqTURpbm9IQ2tHM3ZnMTQ0Y3h0YUhERkQr?=
 =?utf-8?B?eUlQb3dGU0tCMUNPdTAyNGYwaERWR3ljUjJ3N0lkdVJoOTE2WmVCYk5LbUgr?=
 =?utf-8?B?TUU2RGhCTzhpOHZZSVNWc2cwcnAvN0VCL0QrcnppeUZPb3BOMGFKck0xdHRm?=
 =?utf-8?B?UWZweitzNnYwTW1LMzI2aXRaVDJGZUo0WHNMaXRuTTdmNm50b2N0RTNLQ3Ry?=
 =?utf-8?B?eWhLZFQ5VFdabzZvL0Jmdnc1bjg1ckhLUk92S2dUTzJSM0t5V2Z6MnpNVEEx?=
 =?utf-8?B?QUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA4PR11MB9420.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 287a673e-0246-4e6d-a470-08ddb1fc17d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2025 02:17:24.5689
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 22HgJp0my355PyrgluOadz4M7kxsvacoh9j5Ace0HB9AigO8ZyoWOjXjuxelUKmZZBw+LAYd8iBYnhgPooaWvZMO0vDDur5Ozpe8t8oZxlo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7815
X-Proofpoint-ORIG-GUID: TWBVRgL6FLD20mFpIXiWuU7zYJoRPA7k
X-Proofpoint-GUID: Vh6ldnRGYfuvfOfNCqf0PQgCD-zECyYv
X-Authority-Analysis: v=2.4 cv=XYKJzJ55 c=1 sm=1 tr=0 ts=6858b939 cx=c_pps a=w5zo4y5KsDtx1ruRTwrSSQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=Q4-j1AaZAAAA:8 a=E8TeFcN2BOwnccvimZAA:9 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDAxMiBTYWx0ZWRfX04y5wxb6XKiv ImfwITA79/9gEmddHZ4CyiLC8Tr2+9a7/KQYp732Wb1UegSYx6iFEWLflyGx53bn4tARiqek74c zh4qL4n5yTN3H/irSYk8754xeAt6HhLzJ//HCOWFlUmA7I4BFdrzaM0ohXd7dmevHFq11C/X1vy
 4DhXnNrGxJty7bvrKmWXWl4M5ozzw4ggEdmm5XE0WdjM/+eFuzvinuiKXeXDVG0c3smhvzEPJHR eNawxfNoI3B6spoijwts0CfuFx2WaflXbsNKajVBe3CDqZE905Mw8WYYIF7Ye2TZLQaSgHLYpAo /ZSYybSpk7uOfXl6tLR/R4GyOYtdG5LNoTz2U4j2owgbIM21YE5FPeS1lgAmhU3U1aCjmOm1wL7
 p3loo0zaHi4R7CX8OQixAxZIiPH6k8DynWsXtvQsqCvP2zScY4uYHXGHcPj072kcTwp2x7C8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_01,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 impostorscore=0 phishscore=0 mlxlogscore=999
 malwarescore=0 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506230012
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 02:17:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118026

SGksDQoNClRoYW5rcyBmb3IgeW91ciBxdWVzdGlvbnMuDQoNClRoZSBpc3N1ZSBjYW4gYmUgcmVw
cm9kdWNlZCBieSBleHBsaWNpdGx5IGVuYWJsaW5nIHAxMS1raXQgaW4gdGhlIGdudXRscyBQQUNL
QUdFQ09ORklHLiAgRm9yIGV4YW1wbGUsIGJ5IGFkZGluZyB0aGUgZm9sbG93aW5nIGxpbmUgdG8g
eW91ciBsb2NhbC5jb25mOg0KDQpQQUNLQUdFQ09ORklHOmFwcGVuZDpwbi1nbnV0bHMgPSAiIHAx
MS1raXQiDQoNClRoaXMgY29uZmlndXJhdGlvbiBpcyBuZWVkZWQgb24gcGxhdGZvcm1zIHRoYXQg
cmVxdWlyZSBjZXJ0aWZpY2F0ZSBtYW5hZ2VtZW50IG9yIHVzZSBzbWFydGNhcmQvdG9rZW4tYmFz
ZWQgY3J5cHRvZ3JhcGhpYyBtb2R1bGVzIHN1cHBvcnRlZCBieSBwMTEta2l0Lg0KDQpUaGUgcmVh
c29uIHRoaXMgcHJvYmxlbSBkb2VzIG5vdCBhcHBlYXIgaW4gZGVmYXVsdCBQb2t5IGJ1aWxkcyBp
cyB0aGF0IHAxMS1raXQgaXMgbm90IGVuYWJsZWQgaW4gZ251dGxzIGJ5IGRlZmF1bHQuICBUaGVy
ZWZvcmUsIHRoZSBidWlsZCBzeXNyb290IHBhdGggZG9lcyBub3QgZ2V0IHB1bGxlZCBpbnRvIHRo
ZSBnZW5lcmF0ZWQgLnBjIGZpbGVzLCBhdm9pZGluZyB0aGUgUUEgZXJyb3IuDQoNClRoYW5rcywN
CkppYXlpbmcuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR3lvcmd5
IFNhcnZhcmkgPHNrYW5kaWdyYXVuQGdtYWlsLmNvbT4NCj4gU2VudDogRnJpZGF5LCBKdW5lIDIw
LCAyMDI1IDc6NTkgUE0NCj4gVG86IFNvbmcsIEppYXlpbmcgKENOKSA8SmlheWluZy5Tb25nLkNO
QHdpbmRyaXZlci5jb20+OyBvcGVuZW1iZWRkZWQtDQo+IGRldmVsQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcNCj4gQ2M6IFlhbmcsIExpZXpoaSA8TGllemhpLllhbmdAd2luZHJpdmVyLmNvbT47IExp
LCBDaGFuZ3FpbmcNCj4gPENoYW5ncWluZy5MaUB3aW5kcml2ZXIuY29tPg0KPiBTdWJqZWN0OiBS
ZTogW29lXSBbbWV0YS1vZV1bUEFUQ0hdIHhtbHNlYzE6IGF2b2lkIGhhcmRjb2RlZA0KPiAke1JF
Q0lQRV9TWVNST09UfSBpbiB4bWxzZWMxLWdudXRscy5wYw0KPiANCj4gQ0FVVElPTjogVGhpcyBl
bWFpbCBjb21lcyBmcm9tIGEgbm9uIFdpbmQgUml2ZXIgZW1haWwgYWNjb3VudCENCj4gRG8gbm90
IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSByZWNvZ25pemUgdGhl
IHNlbmRlciBhbmQNCj4ga25vdyB0aGUgY29udGVudCBpcyBzYWZlLg0KPiANCj4gT24gNi8yMC8y
NSAwNjoxMSwgU29uZywgSmlheWluZyAoQ04pIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIHdy
b3RlOg0KPiA+IEZyb206IEppYXlpbmcgU29uZyA8amlheWluZy5zb25nLmNuQHdpbmRyaXZlci5j
b20+DQo+ID4NCj4gPiBGaXggZG9fcGFja2FnZV9xYSBlcnJvciBieSByZW1vdmluZyAke1JFQ0lQ
RV9TWVNST09UfSBmcm9tIHRoZSBpbnN0YWxsZWQNCj4geG1sc2VjMS1nbnV0bHMucGMgZmlsZS4N
Cj4gPiBUaGlzIGVuc3VyZXMgdGhlIGdlbmVyYXRlZCAucGMgZmlsZSBkb2VzIG5vdCBsZWFrIGJ1
aWxkLXRpbWUgcGF0aHMsIGNvbXBseWluZw0KPiB3aXRoIFFBIGNoZWNrcy4NCj4gPg0KPiA+IEZp
eGVzIFFBIGVycm9yOg0KPiA+IEVSUk9SOiB4bWxzZWMxLTEuMy43LXIwLndyMjUwMCBkb19wYWNr
YWdlX3FhOiBRQSBJc3N1ZTogRmlsZQ0KPiA+IC91c3IvbGliL3BrZ2NvbmZpZy94bWxzZWMxLWdu
dXRscy5wYyBpbiBwYWNrYWdlIHhtbHNlYzEtZGV2IGNvbnRhaW5zDQo+ID4gcmVmZXJlbmNlIHRv
IFRNUERJUiBbYnVpbGRwYXRoc10NCj4gDQo+IEhvdyBjb3VsZCB0aGlzIGJlIHJlcHJvZHVjZWQ/
IERvZXMgaXQgbmVlZCBzb21lIHNwZWNpYWwgY29uZmlnIG9yDQo+IGVudmlyb25tZW50Pw0KPiAN
Cj4gSSB0cmllZCB0byBidWlsZCBpdCBpbiBib3RoIG1hc3RlciBhbmQgd2FsbmFzY2FyIGZvciBx
ZW11eDg2LTY0LCBhbmQgaXQgd2FzDQo+IHN1Y2Nlc3NmdWwsIFFBIGNoZWNrcyBwYXNzZWQuIEkg
dXNlZCB0aGUgZGVmYXVsdCByZWNpcGUsIHdoZXJlIGdudXRscyBpcyBwYXJ0IG9mDQo+IFBBQ0tB
R0VDT05GSUcsIGFuZCBhbHNvIHdoZW4gUEFDS0FHRUNPTkZJRyBvbmx5IGNvbnRhaW5lZCAiZ251
dGxzIi4NCj4geG1sc2VjMS1nbnV0bHMucGMgd2FzIGFsc28gZ2VuZXJhdGVkIGFuZCBpbnN0YWxs
ZWQuDQo+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEppYXlpbmcgU29uZyA8amlheWluZy5zb25nLmNu
QHdpbmRyaXZlci5jb20+DQo+ID4gLS0tDQo+ID4gIG1ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L3ht
bHNlYzEveG1sc2VjMV8xLjMuNy5iYiB8IDcgKysrKystLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwg
NSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL21l
dGEtb2UvcmVjaXBlcy1zdXBwb3J0L3htbHNlYzEveG1sc2VjMV8xLjMuNy5iYg0KPiA+IGIvbWV0
YS1vZS9yZWNpcGVzLXN1cHBvcnQveG1sc2VjMS94bWxzZWMxXzEuMy43LmJiDQo+ID4gaW5kZXgg
MmZkZmQ1NWYyNC4uMGY0YWUyMDViMSAxMDA2NDQNCj4gPiAtLS0gYS9tZXRhLW9lL3JlY2lwZXMt
c3VwcG9ydC94bWxzZWMxL3htbHNlYzFfMS4zLjcuYmINCj4gPiArKysgYi9tZXRhLW9lL3JlY2lw
ZXMtc3VwcG9ydC94bWxzZWMxL3htbHNlYzFfMS4zLjcuYmINCj4gPiBAQCAtNTQsOCArNTQsMTEg
QEAgZG9fY29tcGlsZV9wdGVzdCAoKSB7ICB9DQo+ID4NCj4gPiAgZG9faW5zdGFsbDphcHBlbmQo
KSB7DQo+ID4gLSAgICBmb3IgaSBpbiAke2JpbmRpcn0veG1sc2VjMS1jb25maWcgJHtsaWJkaXJ9
L3htbHNlYzFDb25mLnNoIFwNCj4gPiAtICAgICAgICAke2xpYmRpcn0vcGtnY29uZmlnL3htbHNl
YzEtb3BlbnNzbC5wYzsgZG8NCj4gPiArICAgIGZvciBpIGluIFwNCj4gPiArICAgICAgICAke2Jp
bmRpcn0veG1sc2VjMS1jb25maWcgXA0KPiA+ICsgICAgICAgICR7bGliZGlyfS94bWxzZWMxQ29u
Zi5zaCBcDQo+ID4gKyAgICAgICAgJHtsaWJkaXJ9L3BrZ2NvbmZpZy94bWxzZWMxLW9wZW5zc2wu
cGMgXA0KPiA+ICsgICAgICAgICR7bGliZGlyfS9wa2djb25maWcveG1sc2VjMS1nbnV0bHMucGM7
IGRvDQo+ID4gICAgICAgICAgc2VkIC1pIC1lICJzQCR7UkVDSVBFX1NZU1JPT1R9QEBnIiAke0R9
JGkNCj4gPiAgICAgIGRvbmUNCj4gPiAgfQ0KPiA+DQo=


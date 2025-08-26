Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6142ECA0EFA
	for <webhook@archiver.kernel.org>; Tue, 26 Aug 2025 04:22:53 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.57297.1756182166307974352
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Aug 2025 21:22:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=TA++5WGQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0333471bfd=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57Q2He9I619819
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Aug 2025 04:22:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=PNmtCs13HtZG3cQ1u00lG3w/EdwlzWZlJG55rOboD2c=; b=
	TA++5WGQUVw5f5Zt0CRn+VK6XKru2bBzCm1gno/I3mDK7bSukrxC56QcRU91uiTb
	yy5jEEHbZrYyg382BII2MLXd4+0RMNrxWp6grI53mSSsVnXveblYtI4wOt4tzfhh
	G/PblzjrPQG12Jy5T5tSRDhSjlrAm3VjuqYvTYoG0MwpmEa2r7GE9Jk1fTxBK1HF
	aIJnbHO9DqiGSTwiejNiA6N9n6SsKrf5ERExD1jtCyYy4CEraktscROUUyyR66sy
	lU5Dvv7V9JrUZnzxViCfL/eJBO6QOpHGyckf8RAFhrr2NWs25Y796tE674XBwSUg
	9tqmagsfakklsR+4kwCDFQ==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2063.outbound.protection.outlook.com [40.107.220.63])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48q4m3tmyb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 26 Aug 2025 04:22:44 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MfMJJYMF1NaM0OJzkmngeook+gmI41YZfTfWb4mXNcqX01yr+4OV+UTf2SPvtIeWK1ICmbIXImIwjqPO6CuJjPc28BmTXraF578HrcP1lrOANnBBtsKBdLQsCkCFKmbnM6udyRj0eIQneRWfwV62bymw4wqoqdtJ1014UDmeKzR0RNeFoYHL3hbrWefCrY4U+EWB6NQsYVtQWYjg+7TzcaKoDFa3Tsj/db6zVynx6ueUKGsKursV0eETwvlUFuVkPNRkLNTrDJ4mxBzg7t3w6u+9mm44ga1CaNzOsSdJH/vD/DLfFDfqw9oXmPDvhFoCCK3r2Flwx3aiLx5dL0hgUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PNmtCs13HtZG3cQ1u00lG3w/EdwlzWZlJG55rOboD2c=;
 b=NOTtd6KYBMhtInuvcpMyyPMZB7ndeSuqy7jatQmOItRAyCX668aYPC8hmdG8QKabG7t9L1ZlUtxFVH6b/+2CObER6vrMtiZ+Rmo1oVLliLOvYUGw+Dc9ciVjYN6yhNUJ3lixcWG4NWnY+28LxfokZ3DsEG5gfNlA4iC2QSGnFdCaRQ3k2ziN8f9WfvFtoUin3HuprOany2IYnPEojPkiCe/gHwK0N2aofWK7rVOs4L63jp86gvTg/PVQHQ2rt27ZnmN4evSWaXRqJFo7okgU5KCVYX97Jod/93MU/ZYBwEyqY4YNjUBEjboFFPj6DH1kFRtDaTPEjlZvDU5+h3i4PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA4PR11MB9420.namprd11.prod.outlook.com (2603:10b6:208:563::13)
 by MW4PR11MB6810.namprd11.prod.outlook.com (2603:10b6:303:207::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 04:22:40 +0000
Received: from IA4PR11MB9420.namprd11.prod.outlook.com
 ([fe80::2714:5169:aa4d:163e]) by IA4PR11MB9420.namprd11.prod.outlook.com
 ([fe80::2714:5169:aa4d:163e%4]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 04:22:40 +0000
From: "Song, Jiaying (CN)" <Jiaying.Song.CN@windriver.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][PATCH] libconfig: switch source to GitHub
 repository
Thread-Topic: [oe] [meta-oe][PATCH] libconfig: switch source to GitHub
 repository
Thread-Index: AQHcFjTH5Hj4UY6KVUqmMXh0cSaFqrR0VY7A
Date: Tue, 26 Aug 2025 04:22:40 +0000
Message-ID: 
 <IA4PR11MB9420F0BD03DE29BF3FA222E8B839A@IA4PR11MB9420.namprd11.prod.outlook.com>
References: <20250825074558.2945810-1-jiaying.song.cn@windriver.com>
 <CAMKF1so6Op20oegGgQYxneRFj3Q3Bnvte7h_F2Z0j6Zh8w_CVA@mail.gmail.com>
In-Reply-To: 
 <CAMKF1so6Op20oegGgQYxneRFj3Q3Bnvte7h_F2Z0j6Zh8w_CVA@mail.gmail.com>
Accept-Language: en-AS, zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ActionId=6b069286-7a93-4456-b990-d1f0a10c081a;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=0;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=true;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2025-08-26T04:22:07Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Tag=10,
 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA4PR11MB9420:EE_|MW4PR11MB6810:EE_
x-ms-office365-filtering-correlation-id: 883020e6-0d70-40fa-e7ca-08dde4583221
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|4022899009|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?cGJWbUx4a1lkN3lrZHE4SEY4TmJkV1hjYW1XdTlRR3hNOVVSS0ExMmp0NXNG?=
 =?utf-8?B?M0k5bHU5ZnYxc2JIUkE1L3pjNDRJSVUvbjlWWVkwQTYzczNDeFR1bXdmdnhI?=
 =?utf-8?B?ZHI0Z0U3VlFOKzc2UmJoaHNaYmVVZHdSMW9hTE43eW5IbVNiNGdoRWl0QmRJ?=
 =?utf-8?B?NXlWUkpWaDVsSXE0c1JRYklnR3UvdFNZSllxdHg4WlpvRkt5MUQ5SVFQMFhj?=
 =?utf-8?B?TXBrZlNCMFhFQnRld0x3UWdrOHprTitIaU1WZEcwVVhTVmRpLzYzb2o3UEpU?=
 =?utf-8?B?Y0p1S1RTWHAwdGZmMUVWUFM2N1ZXbFdpWDJGeitzVjI1Ym4vck5zWUtxK3lr?=
 =?utf-8?B?djRSN2JiY2tsTjNaU3BFbTRNekFob1dwRzVtUzI1YlZGZVdSenV3Vzg2Yi9E?=
 =?utf-8?B?ejN2eG9tcWM5UzB1Z0haaXl0RjlRSXJWbXVoTVQ2Y1BQN1lKaHYrK1d6T09O?=
 =?utf-8?B?K2dJVnZEOVU2ekFSdE9qVXkvcnd0NzFXclhjaVhvQWxUSTdBZEp1WUlpbXVX?=
 =?utf-8?B?WjZ0WDlQRDA4WDlxNitGYWVRU0xRVFZVMVp3R0dBVTZOWHdhdmI5TWN6Ymd3?=
 =?utf-8?B?L2pjQ2lWUnlteFQwcmtsVmZKNnI1NjIwRWpmZUlybDFHR1kreWJ6M3N2cm44?=
 =?utf-8?B?aXM3VFBHVi9aeDB2M2UzRy9JNDhueWE3SnhUMW55N3ZPWWhlOENjRHpKVFB4?=
 =?utf-8?B?Z1NDSU1WU2hHKzVHZ3pNZ0NIcjFCSW9DekhKTldGOVlyeXVabE9MeW11RWpS?=
 =?utf-8?B?QjlrSjdaRUFtaWRDTFNPaHB2N3lFYUprU0pCL21UWk5sam93MWNRTEMvUk51?=
 =?utf-8?B?YlcvWWZqQlFpTk5TTU9GeHRMcFpaTVFJNGlEdmdCcG05b1ExM1FISHZjZCsr?=
 =?utf-8?B?SEdoMngwRnlXaklNUFRGYVpvTno3eWFDUUZkMmhML1RTUmYwSERBNmlTcmRi?=
 =?utf-8?B?c2t3OU9PWFdnOTczWXZUejN1YlFFeXAzMFZKMzJNcjcybngzV3RFV0tEM1Zr?=
 =?utf-8?B?czhHdThacGJKL3I4WUdaQStLUWkyZjZpY3k3dTUvUnJ6OFlOV0lPa2QxZHRU?=
 =?utf-8?B?TENZUHZWTGFZTGxTVVd6Qys1NTBrRUFMaVNDM2tBSVdSeDRocGtCQm9mSlMw?=
 =?utf-8?B?WXBPTEkvOTJ5QWg1MXJBNFprMHV2NjVablZyTXYyOXo5SWpFRVl3VXNYWkFw?=
 =?utf-8?B?WmR5emc4eXhtY2hMRVN5RU1qYkRxWTFLY0ZQcFBvei93alNlK1hlWFp3a0Y2?=
 =?utf-8?B?ZHRSZkRSUmZ6dFRsNmRveTF5OGZEOTh4Tk9ESU5OT2lKVjgzaktBbXMwQzdu?=
 =?utf-8?B?dWVpS3BOSERDb0cxUWpOMVRvWTFhRWg2b3NIMkhRRnczVlBhUStVSGlpWWlI?=
 =?utf-8?B?RWd4TWNIMGdnc1lIZ2JpOVlheHV3elhHQjErN2J4clJpZ3IvdHRzTlIxaXkw?=
 =?utf-8?B?eUlyQmN5ZG44MVFEYURMNE1zazFyTklPbXVSOW1xSDQ4T21lemxjcGlrMmo5?=
 =?utf-8?B?WXVIYlNZeDNRNFN0dUtDdjZOelZPSk03bUhTSUFWQkpWN2xjOU10YjJNNWNN?=
 =?utf-8?B?NXhCeE9WSmQzbktIUzYzVVB0N3JnQ2lUamV6bHkvVXFXZ21XYXFyTVRKQmRa?=
 =?utf-8?B?dDhLT0lOcVRLVXVISUJtZmJsOE9LOFlldW1yc3IweGkwekRyQSs3eXI3c2RX?=
 =?utf-8?B?QUFVTGs3ZjhqZU1vc3Exc29COWpKNjNXcGZVejlvaTh0VXZUS0psN0xEUmpk?=
 =?utf-8?B?QVFJRlduLzNQaCsvSjdpL0I0MzBHOHVra2d0WGhUVmhIcis1N0V5Q3Uvcmtn?=
 =?utf-8?B?bTlOWXJ3U0hIWmRFK09Eak5sZkZFQ09aTUsxMzFUdTA0ekpKakFtdXhoNGsw?=
 =?utf-8?B?c1g0bGFYSm5sbmVZR1JqQnpyMWVvSkZUMmdoTkZsS3RUc3NlSExSNkFyQ05p?=
 =?utf-8?Q?j0kq5wzRh3U=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA4PR11MB9420.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(4022899009)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?b2phVjVaa2c5RlN4dGZhdFo4Z0RjaWNlUkVYRlhMd1B6REdRNDF2U1lNMWJs?=
 =?utf-8?B?cTZURnlGVW5XRUY1bzZWVk12dUtQL0twU0doQ1BrMHZOajRXcnQxUC9IOC9m?=
 =?utf-8?B?VlYxTXZCYzdYcFU2cU1qOCtQSVU2ZVE5a1NHN1J3ZjZJUU5ieUlLYkJ2KzdU?=
 =?utf-8?B?blE1b1ZPWTJ4dkFmeUVxSzU0Wk1SZ3FrVTB0ZWNsMjEvMWdWeUQ0azhKRWRE?=
 =?utf-8?B?WGdTT2YvWUo2cC82RUFCWkdRN3JSVlo4RW92K1NvTWlwd1QzZkhUZnFKQ2FY?=
 =?utf-8?B?YUozM2FGQ25EZk1TT0UxV3RSYW0raGptWHBJR2o2bmtGeXByVWY4SXZEdlp6?=
 =?utf-8?B?cnpKZHBvMTdxaXhuRWlHSkd0QzkxWkw3dk51QmcvWlViNmlqTmZFWWtkdXRi?=
 =?utf-8?B?V0ZXbjk3dkdqWkwrUWdPaGtRR1FYaHNOckoxZTNqTUszd05CZjJOeG0yZVdT?=
 =?utf-8?B?M3ZBaEpLcFpwTlcvQUlMeDdJNXNmcm9xTUV2YmxqRG00aVBOZ3pEamJvOXRR?=
 =?utf-8?B?MnVOUThmbnd6bHdRVlJ3STJDNnBKVkVHdndmK2tQaWpJeXEwUXNlL0ZpSDk2?=
 =?utf-8?B?ZTR2aTdHK2JNbytlaG9sTWs0cjR1N0JLUWkwWmNoK2RIc3Qwenp1OTRVWFJu?=
 =?utf-8?B?ZklMT3NnZDdKeUZQS0k2THZBdWpGK080ZEFVR3BBSHpXditVRmcxTkU0czZr?=
 =?utf-8?B?bGsxNjJMbGxuYy9hV2Y3T0UzZEtnb0g2Sk1aS3pNL1B4bDlWM21lSFZxdERq?=
 =?utf-8?B?Z1U5TVY4TGZaYjAxcDVWdkNTbDVMWFJCeWk3WVh1VFNORCtNMDc0aDA4REJE?=
 =?utf-8?B?MGxiQUM0YWF6MkRQM1BFVFZFU3I0V1VVeHRaN1ZqdjJiN1VQNEtPR2VDSXRC?=
 =?utf-8?B?a0V1eVJ6MTdZZEc5dmRaYnR6TGozQXp3dkxKRitHWjJlUnhsUldYbXM2V0ls?=
 =?utf-8?B?ai9MYTVuS2hnMm9uNFZMdHNYc29KMGNDcEJoUkxYeURzWkpOd3pjTjFBdDcy?=
 =?utf-8?B?Wm9SUVFQQTdQeStrNXNNTlV3TkIwZStHVERGY2NNMWlCTTVSTTB5NFlhRkRI?=
 =?utf-8?B?SnBEUm1TNnBwSmpYV1RuRzdad0ZSM1A5NEdhNUlqUmtMVkFWQlZlbUJIeW9K?=
 =?utf-8?B?ckplQ2kvTk5JY0JOM2RtVzZDNEUxYytKbnZYRDdldVlINE1kVzI5U1AwejdV?=
 =?utf-8?B?TWQrNnh6YkI2dHRrSUR0MThYa3NDK0R0ZzlXNEplWW1xanFWc1ZQTmU3eTNP?=
 =?utf-8?B?MG1sUXlRVkZuQnIxdjIreldwL01ueFRFV09pd2lnajUvdlFpS1lKNjZBcVBH?=
 =?utf-8?B?TmNpRlcyMlh1UmxLeGxSdU9JR1Z5aFJGL0ViT3ltYUhxZFdadUdybURreXhI?=
 =?utf-8?B?ei9NdXF0Nm5uVzZNZFBUTitiMkk4dW51UWRzd2VwYi94NEhhaTlVMFdDMjZD?=
 =?utf-8?B?QWlVd0tlNG9SUVMwWDNrVnVZdXBEQWxpUzUrK0FxSFNZNWtieTNkdUM1QlNt?=
 =?utf-8?B?cUJJZnk2bEVZV3IyVVB5M25tRnpvYkFxL0E0cE1OVUlxVHd6QVcvNUZ3SnM2?=
 =?utf-8?B?cWlFM0g4ZEcwVGV1NHBiS1V3MkR3c25uZlVxS3NqeC9OYTZaVjFtdnZJTnVY?=
 =?utf-8?B?dVZRMC9mSCt3RXcwUmJmbStZS3k3RmhqVVlqM29vbHBDUTdueUhtUWlBWHRk?=
 =?utf-8?B?bW8yQjFoYzlRSGRCV2RIclhZZmlZVFU5VTluT2krNnJzc1JKSDBmZHBGZHNY?=
 =?utf-8?B?d1U0Vkl4SEdDRmh4YSt6SGpmTnhBdlk3azBWYmFTWk1zdTB6d3dBWTJNNDR0?=
 =?utf-8?B?Q295SG1FVzZBVmlpMzZsRjlZQ2NvaGhtaG5odDZjN0RyZHl6cCtNR1B0VGla?=
 =?utf-8?B?bkZ6TUpTbDg1YXA1dnd3RVkzV3JkQStwbzRZYTYyY09VWFcyWC9zam1iR3Zk?=
 =?utf-8?B?Z0tKWlp3bnFQVklzSlpzVFZhRisybERkVWpZRk1zSjRPVVdyUG1jNWtmUHFW?=
 =?utf-8?B?a3pwcXpwWDcwTFgrOEVrTlFMbWtuK2lnR0Y2bDUrRWlMYlFJQlN2NzdKTWZZ?=
 =?utf-8?B?V2p0R2RyOTAzQWJscXJUNFlCa2poU3NnM0lCczdlRDl6ZDBHa3RpSGQyaWY2?=
 =?utf-8?B?QngvZjJwcDVuVldMUkwxV3AyMHVQajBNWCtzQjd0aVZzOGpreEE3KytQWERH?=
 =?utf-8?B?QkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA4PR11MB9420.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 883020e6-0d70-40fa-e7ca-08dde4583221
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2025 04:22:40.5628
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jl7xKdrqWnUNjeAg8FyabqpTnCsmImWx22oKNfIP+Sj5oaaH0ZKb3I2NYSnF5r80+S5T3o3ofSgVsS0e1/XUFpKxBPAfdVj/mGSL+d3Ql9E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6810
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDAzNCBTYWx0ZWRfX686XzaJKCgI5
 T3nCn1uwkCl/BfpnQgVeCMmb91Pm+KsKDS5RHAm4aPGgHfeKM63+Nuebo1XohtZaozejK9nx+ed
 RalPHIsgdHbzqnmI3qATS6nuf8tIR716ZbPMA5+iikRqZ9W74BmHDWycbGgOTEwSDX/3oCw7NUk
 kIOimb7bnlwiUAvvWdo91msq2f4Sp8rx68yimr9wirwf5vQk9QeTDHRvVxiaNvf6sqRN57apOQU
 FuhdJCUUc8XwOxdi0kYYM7YKb1hb4ZFm9nKqB4qNjjnpDLucYcgX0JudeGJn9QTO1tHfmvSxDo7
 TCqIOmOTRRZxBZ+AX5bokG7dBBad4yK9AmbLuQN+tuAPCYDZhOmcWEn635Hn9w=
X-Proofpoint-ORIG-GUID: LPbGZbyi8gV0BbmV5MyEPCnKom3jt60l
X-Proofpoint-GUID: 7crBKTJ7GxEuK7bX-z3FIiGv-cXSI3CS
X-Authority-Analysis: v=2.4 cv=CcwI5Krl c=1 sm=1 tr=0 ts=68ad3695 cx=c_pps
 a=v1Stge5IH4fBwzlX9Lmszw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=jn5mJRsBAAAA:8 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8
 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=yj-aMKAYKbz0kkd27lYA:9 a=QEXdDO2ut3YA:10
 a=0flEoihKdI8QF1_aUImP:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_01,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Aug 2025 04:22:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119109

VGhhbmtzIGZvciB0aGUgcmV2aWV3IGFuZCByZW1pbmRlci4gSSBoYXZlIHVwZGF0ZWQgdGhlIHJl
Y2lwZSBhbmQgc2VudCBWMi4NCg0KQmVzdCByZWdhcmRzLA0KSmlheWluZw0KDQotLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4gDQpT
ZW50OiBUdWVzZGF5LCBBdWd1c3QgMjYsIDIwMjUgMTA6NTQgQU0NClRvOiBTb25nLCBKaWF5aW5n
IChDTikgPEppYXlpbmcuU29uZy5DTkB3aW5kcml2ZXIuY29tPg0KQ2M6IG9wZW5lbWJlZGRlZC1k
ZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQpTdWJqZWN0OiBSZTogW29lXSBbbWV0YS1vZV1b
UEFUQ0hdIGxpYmNvbmZpZzogc3dpdGNoIHNvdXJjZSB0byBHaXRIdWIgcmVwb3NpdG9yeQ0KDQpD
QVVUSU9OOiBUaGlzIGVtYWlsIGNvbWVzIGZyb20gYSBub24gV2luZCBSaXZlciBlbWFpbCBhY2Nv
dW50IQ0KRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBy
ZWNvZ25pemUgdGhlIHNlbmRlciBhbmQga25vdyB0aGUgY29udGVudCBpcyBzYWZlLg0KDQpPbiBN
b24sIEF1ZyAyNSwgMjAyNSBhdCAxMjo0NuKAr0FNIFNvbmcsIEppYXlpbmcgKENOKSB2aWEgbGlz
dHMub3BlbmVtYmVkZGVkLm9yZyA8SmlheWluZy5Tb25nLkNOPXdpbmRyaXZlci5jb21AbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+DQo+IEZyb206IEppYXlpbmcgU29uZyA8amlheWlu
Zy5zb25nLmNuQHdpbmRyaXZlci5jb20+DQo+DQo+IFRoZSBvcmlnaW5hbCB0YXJiYWxsIFVSTCBu
byBsb25nZXIgcHJvdmlkZXMgdmVyc2lvbiAxLjcuMyBvciBhbnkgb3RoZXIgDQo+IGhpc3Rvcmlj
YWwgcmVsZWFzZXMuVG8gZW5zdXJlIHJlcHJvZHVjaWJsZSBidWlsZHMsIHRoZSBzb3VyY2UgaGFz
IGJlZW4gDQo+IHN3aXRjaGVkIHRvIHRoZSBvZmZpY2lhbCBHaXRIdWIgcmVwb3NpdG9yeS4NCj4N
Cj4gU2lnbmVkLW9mZi1ieTogSmlheWluZyBTb25nIDxqaWF5aW5nLnNvbmcuY25Ad2luZHJpdmVy
LmNvbT4NCj4gLS0tDQo+ICBtZXRhLW9lL3JlY2lwZXMtZXh0ZW5kZWQvbGliY29uZmlnL2xpYmNv
bmZpZ18xLjcuMy5iYiB8IDYgKysrLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspLCAzIGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLWV4
dGVuZGVkL2xpYmNvbmZpZy9saWJjb25maWdfMS43LjMuYmIgDQo+IGIvbWV0YS1vZS9yZWNpcGVz
LWV4dGVuZGVkL2xpYmNvbmZpZy9saWJjb25maWdfMS43LjMuYmINCj4gaW5kZXggYTRkZjcwN2Rk
Ny4uYWNlMjY5OGZhNCAxMDA2NDQNCj4gLS0tIGEvbWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL2xp
YmNvbmZpZy9saWJjb25maWdfMS43LjMuYmINCj4gKysrIGIvbWV0YS1vZS9yZWNpcGVzLWV4dGVu
ZGVkL2xpYmNvbmZpZy9saWJjb25maWdfMS43LjMuYmINCj4gQEAgLTcsOSArNywxMSBAQCBTRUNU
SU9OID0gImxpYnMiDQo+ICBMSUNFTlNFID0gIkxHUEwtMi4xLW9ubHkiDQo+ICBMSUNfRklMRVNf
Q0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HLkxJQjttZDU9ZmFkOWIzMzMyYmU4OTRiYWI5YmM1MDE1
NzI4NjRiMjkiDQo+DQo+IC1TUkNfVVJJID0gDQo+ICJodHRwczovL2h5cGVycmVhbG0uZ2l0aHVi
LmlvL2xpYmNvbmZpZy9kaXN0L2xpYmNvbmZpZy0ke1BWfS50YXIuZ3ogXA0KPiArU1JDX1VSSSA9
IA0KPiArImdpdDovL2dpdGh1Yi5jb20vaHlwZXJyZWFsbS9saWJjb25maWcuZ2l0O3Byb3RvY29s
PWh0dHBzO2JyYW5jaD1tYXN0DQo+ICtlciBcDQoNCmFkZCB0YWc9diR7UFZ9IGFzIHdlbGwuDQoN
Cj4gICAgICBmaWxlOi8vMDAwMS1GaXgtZGVjbGFyYXRpb25zLXRvLWFsbG93LWJ1aWxkLXdpdGgt
Z2NjLTE1LnBhdGNoIFwgIA0KPiAiDQo+ICtTUkNSRVYgPSAiNTI1OTIyYTZiNDljYTE5MjM1Y2Rm
MzA3Mzc2ZTdjOWM1MzlkMWI5MyINCj4gK1MgPSAiJHtXT1JLRElSfS9naXQiDQoNCnNldHRpbmcg
UyBub3QgbmVlZGVkLg0KDQo+DQo+ICAjIG5lZWRlZCB3aGVuIHdlIG1vZGlmeSBncmFtbWFyLnkg
d2l0aCBhYm92ZSBwYXRjaCAgREVQRU5EUyArPSANCj4gImJpc29uLW5hdGl2ZSINCj4gQEAgLTE5
LDcgKzIxLDUgQEAgVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAiVmVyc2lvbiAoP1A8cHZlcj5cZCso
XC5cZCspKykiDQo+DQo+ICBpbmhlcml0IGF1dG90b29scy1icm9rZW5zZXAgcGtnY29uZmlnDQo+
DQo+IC1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNTQ1MTY2ZDZjYWMwMzc3NDQzODFkMWU5Y2M1YTU0
MDUwOTRlN2JmYWQxNmE0MTE2OTliY2ZmNDBiYmIzMWVlNyINCj4gLQ0KPiAgUEFDS0FHRV9CRUZP
UkVfUE4gPSAiJHtQTn0rKyINCj4gIEZJTEVTOiR7UE59KysgPSAiJHtsaWJkaXJ9LyR7QlBOfSsr
KiR7U09MSUJTfSINCj4gLS0NCj4gMi4zNC4xDQo+DQo+DQo+IC09LT0tPS09LT0tPS09LT0tPS09
LT0tDQo+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3Vw
Lg0KPiBWaWV3L1JlcGx5IE9ubGluZSAoIzExOTA5Mik6IA0KPiBodHRwczovL2xpc3RzLm9wZW5l
bWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtZGV2ZWwvbWVzc2FnZS8xMTkwOTINCj4gTXV0ZSBU
aGlzIFRvcGljOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQvMTE0ODc4MDI1LzE5
OTc5MTQNCj4gR3JvdXAgT3duZXI6IG9wZW5lbWJlZGRlZC1kZXZlbCtvd25lckBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnDQo+IFVuc3Vic2NyaWJlOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5v
cmcvZy9vcGVuZW1iZWRkZWQtZGV2ZWwvdW5zdWIgDQo+IFtyYWoua2hlbUBnbWFpbC5jb21dDQo+
IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+DQo=


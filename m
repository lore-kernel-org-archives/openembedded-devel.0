Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CB3ECAC597
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 05:59:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.7280.1758175193147165012
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Sep 2025 22:59:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=BgWyP1C2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=13560e645f=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58I45NYB3377856
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Sep 2025 22:59:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=VeGw5HuUWpSgvOEDWfu4/OJ3KNTXLKFQQTcFm6AJ/Dk=; b=BgWyP1C2nB1o
	mgc4wKdsvEnnXx0QoFKcPacUvHxeBdIADFQqH1ulRy5ZdRHMPjt/znDq5X7xJZ5g
	HDgZwu79JwJhFcuCgE2a5w5aFGtOzaebdXfhkDA1vAmtmZa6VXFLgDSNeYdejFy3
	aheqB5E83NT0Q4zfQhDeKBmLIGOyIpsNpH6r3cNow7JxchPXwfEHPGpK5ZHFlz1F
	BBb4L92CPFDsoUu5ivr8rsh5GxJa4dLG7S+esLVovu+34g0lPXqUR4L881Sz3SvD
	0rC0/Gsj/sqHzZl/zTWmMo9saAcA3yd56nIfjpVjDdBaKQ3QNtzpMeb6vRbK1iAd
	lTpY6PIQrw==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012063.outbound.protection.outlook.com [40.93.195.63])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 497fwr1nm3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 17 Sep 2025 22:59:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QfS7xYyMumFIF5ad7cNDVT9C3g/GWFtqhgDGP2Xa1/5RyRbPiMIWbEL2RXPTozHX5bAw5WquG6BZP99moBUNBMAzND4+AW6gG3BOJhUEJhu4p/FF8YKsPojj26JLB94zyQDpl7zk+2DdSw1rYfAzG7ETc3yj36/SczgV1ntM273tqx2xsiCIdkLSmRbLWA1FrUtmmdignN64YDXTrHTcLBT6IP8IERZb2eSK9fztcAJJDMb9LygIkHIeKJeQx9gCX2n/RLf+oJLDmBIy/hGnYbHK6omz4aBbUdJF9M7jnsjSkudgVVRWKQYsxZ6NhKsc5fn2IJeS8JgVBLC3wm5v7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VeGw5HuUWpSgvOEDWfu4/OJ3KNTXLKFQQTcFm6AJ/Dk=;
 b=QZxp1NX0dgEMsPoo5NLQa9Y6OwtRw5Z6z8yLjrs588Zd/PMefUGVjO6X0SQM6QQLxWm2zWA68LmQvlHcJoQ+8zNCHjZFQH5BzeVhc7GMhSdcI3CgQuVDGufNfnDIRhNaVpwxQpKy+DcmxtEO0sGHz9RtOE22R/A1LQfoW7Lnbsr1VR4TAOCYeyB9ALqTTP5NZRpNWnL+HWWjM35Sp7tLN2JdTDMu4AWzoj6f8w/CSf96Bta1rQC7CJs4bPf1GtRIJ+WNSEMyhTTrN6+AQ4JbhUxzACYkbCLcwrZw2yhmf/37QUkn+iP7fGfDcwgkcl+fDJlsQQoXHWwWfWRNSGPs0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA4PR11MB9420.namprd11.prod.outlook.com (2603:10b6:208:563::13)
 by SJ2PR11MB8402.namprd11.prod.outlook.com (2603:10b6:a03:545::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 05:59:49 +0000
Received: from IA4PR11MB9420.namprd11.prod.outlook.com
 ([fe80::2714:5169:aa4d:163e]) by IA4PR11MB9420.namprd11.prod.outlook.com
 ([fe80::2714:5169:aa4d:163e%4]) with mapi id 15.20.9115.020; Thu, 18 Sep 2025
 05:59:49 +0000
From: "Song, Jiaying (CN)" <Jiaying.Song.CN@windriver.com>
To: Gyorgy Sarvari <skandigraun@gmail.com>,
        "ankur.tyagi85@gmail.com"
	<ankur.tyagi85@gmail.com>,
        "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][walnascar][PATCH 1/2] webkitgtk3: fix build
 failure with DEBUG_BUILD enabled
Thread-Topic: [oe] [meta-oe][walnascar][PATCH 1/2] webkitgtk3: fix build
 failure with DEBUG_BUILD enabled
Thread-Index: AQHcKFTiJU8tDdbUN06cVPqhZ0D7RbSYch4A
Date: Thu, 18 Sep 2025 05:59:49 +0000
Message-ID: 
 <IA4PR11MB9420D1F4C1459F8C20223514B816A@IA4PR11MB9420.namprd11.prod.outlook.com>
References: <20250918034613.2714914-1-jiaying.song.cn@windriver.com>
 <9bc0177a-325b-4e15-bf4b-02eff47f3238@gmail.com>
In-Reply-To: <9bc0177a-325b-4e15-bf4b-02eff47f3238@gmail.com>
Accept-Language: en-AS, zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ActionId=69d3cf79-6d2c-4878-a0fe-130dd5b956b4;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=0;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=true;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2025-09-18T05:59:27Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Tag=10,
 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA4PR11MB9420:EE_|SJ2PR11MB8402:EE_
x-ms-office365-filtering-correlation-id: 8f06585a-74c6-49e4-00be-08ddf67893ed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|4022899009|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?Nm5GbWh2L2I1NTNJTkk2dEZqcmlYdk9pR2wrY2ZvYURuZ2ZxQXFtdTRBcmwy?=
 =?utf-8?B?K0JIeG9oRSs4M2hBMTNHc1pSVGNhUzExcVdPK1ppVWtBR0U1ZExteXEvOTNR?=
 =?utf-8?B?LzlvUk5RSk9sMmJHcE13NnlhRkppeTE0RkVJbTkyd3lYQnNWQ0NMOG9OSG5O?=
 =?utf-8?B?aVpzbVRXZWQycWVhSlVvWktHMGlMdU13SE1xcTJ3NFBZQnBBWW91SWYzV3ow?=
 =?utf-8?B?dFFMZ0xFTHlWdm43M2crNTRVeE4wNmRHM25uRVhWVFpzeFhmR29QaFZMMjFn?=
 =?utf-8?B?NXo1Y213MURlM0tkVkpNU0dzeWlzbGN4cm9wR3pjK2ZnZCtiRHZkbHFmMGJF?=
 =?utf-8?B?SVBjSm95byt0RnpML0FScHFPbXp6L1Q5S0IwOGlQYjB0NHZNRktDZnBkY0lW?=
 =?utf-8?B?Vjc3Y2JvZXFuWXRnN3JsbnFXTXhnOTFnTnVHZVZZUG9FY2xLNlMrN245UlBh?=
 =?utf-8?B?TGZaeklzMHJQeFI0eWNjaFA4QkRQcDJzL2lramNhbHZxeDBZUXgwTk52TkdI?=
 =?utf-8?B?clhReXhjN085WS9sWTQ4UFRyMHNJazN2N1Q4Z3hzeHdQcm9qR3g3dnFTUXA2?=
 =?utf-8?B?aFlIOVgwME16SDEwNEtPa2R4ZUUrWUxRVTZqcW5rdTZCbmpwOUVsUmpBUWpO?=
 =?utf-8?B?R1BjU0NPUklRbWNVL3lOUUE5dE9Cc1FFSjZaQWZaSVdYeUUrcnBBMC9mMXVu?=
 =?utf-8?B?aCtucFFjUFFvZG1aYWFNWEQzc3d0YjFuS2tUdnFtVmVvR3lubXZEb3NKK1ZQ?=
 =?utf-8?B?SVNPUk54MzVJK0pJejRhY3RocDlEVmxHTjJEK1hhb3hqNEpqYWg1UWNGek03?=
 =?utf-8?B?Rytta0cwVnEwREt5Zld1MEp2Um1nNnhrWjF4RlVCVEd2aENXNkRSZ3cxdllK?=
 =?utf-8?B?ZDhlbi9qUStEZ1FJNG1UK3ArSmJQSklOdU5kK1VkLzR2S1ZUWjEvRkVqOFA0?=
 =?utf-8?B?ZC9sT3JoVWdyZmZ1KzFZQ3N5UHo0TE5QWlhFSSs1VWkycTV6bnlLMFIvM1hr?=
 =?utf-8?B?OHh4ZDlFV2tMTGkxRVJqOS9zVnYva0gxeVdXZ3dUa25jRFZ3VkJ1WTNTU2Fs?=
 =?utf-8?B?SFpseUs4S3Q3TXArVXVCZ1Mvcmxqd0xMRjBMMHUzb2QzYlpJNmRFaDF6MTRw?=
 =?utf-8?B?cVZ5WktqYkV6RDdqVnBXbVJQNXkzZUR4bmtMc1FEMU9ZMGo2OHRKMnNaaWVD?=
 =?utf-8?B?bHcrcXRzRmd6ZjNhZStMR3MrWDZVZE9MM09UOHlFdEpDbkpodEdrc3FQMkRE?=
 =?utf-8?B?TmthUjMxN1Nxek9ET3g3Tmx2TXhBLzdNa3E3MHpLR3pFYTYvZUFlU2FMUmZj?=
 =?utf-8?B?ZXlUMjlLL2luYTVxcnk1engvbUdrRGV3b3gxa0o5eGdXdjMxQVhWTEVIK0di?=
 =?utf-8?B?bmtjK29UQ0V0U0orV3U0YXV3WFpaUnFtbVBFbktkdTJ6UmJFYWJDT1pjcnRY?=
 =?utf-8?B?cXhpZFNzSGhWN0xsZFk4UElzNWUwWVg5Zit5Z2RYRklVRzRMU21XMWErNzRx?=
 =?utf-8?B?dGltekZCR0RjRzVubFV5VTVIc2loZnoxTzNNbU9iWmRTZllXd3B5UWVHZmFj?=
 =?utf-8?B?RTg0bUJiNVI0YUJzdUlLTmpMRzB5TldwWUZjK08zcGhjbG5rcC9maGF0OTZ3?=
 =?utf-8?B?ZTJHZFJPS0IrWG5LSWN1N2lzT2xPZEtHTW00QlVjcDRRZXQ4NDFCSlVuZTN5?=
 =?utf-8?B?Y0hzcUxRdWFiWFdZaHhlOGxBRUNlS3NVUDE4Q3dDb2FJaTA2RDlRSnEwSzRM?=
 =?utf-8?B?ZGlaRXM5c0NaTlpxSlNDZTlRNEtuWVFOQzhnbkR4NlRKU2dTVEZWZlRadXo1?=
 =?utf-8?B?SzN2M1krM2huUEdOMWNpUzNER2tYRVhmQWJ2bFpBa1c3K2Q1aVM2ZjE0NkpX?=
 =?utf-8?B?b3pvakdIUVpyai9QK1lseHkrRHppWUc3Rm1oaDkrWlB6bkttajd2RDRkdTA2?=
 =?utf-8?Q?w4EN8XzHrBo=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA4PR11MB9420.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(4022899009)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?R2F5SVg3T1M3T2FZZE10TW5GZkRlKzY3RHpDV3NyWk5XdkJrd1Q0aDhrOWJW?=
 =?utf-8?B?Y1Uya0YvbjRFeFJWblBmRFhVNnRCT1htMCtmZm5UelkvTXJsYUhLcklHa0xV?=
 =?utf-8?B?Mi90ejQ4U2s5RnV4bXhiM1l4T3ZvUnpySmh2RkYzUS9CSHUyNi8wQmpDTGNp?=
 =?utf-8?B?ZnI2Z1JHMk5iUVQrNHhTMUdpalNITlFQT1ZjQkRXMFFqYjVPaDRJcUVKaG94?=
 =?utf-8?B?eXcyYkNZaXVLYmk2T013MVZoTjlmbDlhZ3lab2UxWEtmUER0NzI3VmNDbTc1?=
 =?utf-8?B?RWl6OThSNU5aUk5WVmVqVlJBMGVKMUpDTGllQUIxMHplSFlXNjZLYXZTbG1S?=
 =?utf-8?B?M2ZXU3IrU1A3Z0JMK1dBaEdJbXRVQUdoaEN6ak1lalJudnRkMXlJWW8yY2Jk?=
 =?utf-8?B?aEpPbmxlQUl2ZkRtcmh6UWh5bURyS2hxditwVXBpai9qYWQ1Zk9VM0lDK3Vu?=
 =?utf-8?B?M2lZVEF0ZktzOXl3RUxxSENPeGVTVUdzNVZ2OVI1VGt4UkJGc09zSUg4L1Fp?=
 =?utf-8?B?MXpPdVI1YjlSRXRPRS9nWmJtbFFPMmVqOEhmZUVGd3F2NGQrcjJnNkFsT1JU?=
 =?utf-8?B?NDJWRjdlVytTTHRDLzhUQVpUb1Q1c2FubWNKMjJCMjFEWUFnRk1uUmljNGl1?=
 =?utf-8?B?ZUhtK1J6THpxWmprZlJmS1hSWlJSSGF0K3F1MDgwdlQvZS9VMFhYTXdFYVN5?=
 =?utf-8?B?ejlUNlBCQzlNRzhxY3FjcS9sdjZyY3V0ZGk2UW1YSEk4NXF5VlFtU2ZlbUl6?=
 =?utf-8?B?b3JJSzZ1TjVrd1dsaVYyM0tPVDhZcEJOcXc3b2RWSGVXalB6dmlYZy8wWlN5?=
 =?utf-8?B?U0RLZ1R0L2dZSW9Ddmg0aFZPV2lGMjJ5cmdvWmhtMlg5c3ZCYmRCdFRlU3Bk?=
 =?utf-8?B?ZWFpUUw5VWoyTDZBY2x0ZjlzUVlRckxURUlkN1N5bitReW5CVHlycmdJUXRJ?=
 =?utf-8?B?VXh2UTMyem96L0NtUFRhSldYNG92elF6TEcwR2JlUEQzMGdMNlBlK0dvNmVC?=
 =?utf-8?B?SURMaDRZUll1bDVxZm94NHB3V3Q1NUVWOUlPM0JEMHV1bEUxRXZlcllXUEor?=
 =?utf-8?B?a3IrZHk5Snh1T3pVa1lpUHlUZU91WUtvd21yY3g5TDJQdDhEWHIyQzdoM2Q2?=
 =?utf-8?B?YmJ3cVR1MXdtSEt1Uk5lWGV6YmlwZHlrQ29xUkRUNTVud1VSbEVuMkhSdFdl?=
 =?utf-8?B?a3JMZFNzRWlIbnFnTG1UTmRrajQwWEp2WFBwcjhEWDM1NVBZT3h2V1lhMFFq?=
 =?utf-8?B?SDduZFVINGhiWWl3aXFINm8yUmlaU2lIV0VNOFdzcXN3VjhydTdCRDduM2Jl?=
 =?utf-8?B?RU1vbThpbmRsNk9XZUwwbVV3c1QyeVMrUkMvMFAvRW11OWR2eEJ1Z0w2TGtP?=
 =?utf-8?B?Z1Bqc2hudzRtVlBHVDJNdEFXU0M4UnBRcUZFdkhjSzFHbEY1QUN1clJkVnVX?=
 =?utf-8?B?emVDdEVwajl3Y0lnNjFTTVlOZStuRVhHYkdpL3Y2ZjBXWUpKOUZ6R0xqdVdB?=
 =?utf-8?B?YW9nVnVIQSs3WG1aUFJIcHZnNVdNNzROTjNmYjZuSk5VN3JmTGMvY28rV1lB?=
 =?utf-8?B?YVEvUFFWS3RDbEpiQ0RQMnVFTnNHUnRWU09QOUxXRzd1U2xoT2FvdCsxRGdQ?=
 =?utf-8?B?UkdoaVpFZUVwV0k1TEJsNm1XanI4QjFXVEFCcGhFN2JKb3pVMGhtTzZuZ0Y4?=
 =?utf-8?B?TFZUU3pvK3JnRnZLNmVaTDFSR0ZuZm91R2FsRXRlQVJmdExLbGMzeTRLTWVN?=
 =?utf-8?B?YzVsTzVKTEZIa3pFTDB3RElGV21tU3d4eUVDVDBRTGVMajdVcm1Hai96d0Q1?=
 =?utf-8?B?cXRZcXhxMGVBcG1acXh3ZWNEV0gxUjdCZkF1d2RQQWFYMjg4Q1NwNVhCZmNU?=
 =?utf-8?B?eUcyQUhVZ0xzOW5tYUNSY29FWnltSlV6S1lqREh4UDkycVlIS3ZPN3JWUS9m?=
 =?utf-8?B?ajlLelg1Q0tNdHBUaTNBSzdvNml1UldPckVLV0ZmZ29xbzZQY2ZYUW54YU12?=
 =?utf-8?B?OVhpdis5WjdyTkpBZnBkL0c0aDZqSGVKRkd0WnVtdWY3Rk1qR0xXRkthVXpL?=
 =?utf-8?B?bE5kcFVtaUpZMFNKUWFuL21mdXkyOEw2UlkwcXFsVnhJYmZ3ejg1VWxINzRa?=
 =?utf-8?B?Z1psZ0o0czhqdzM3MTBlNkdiVnp1RVdWZFVhL2Z5bmFIeDhkVHR0THgweHlw?=
 =?utf-8?B?MFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA4PR11MB9420.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f06585a-74c6-49e4-00be-08ddf67893ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2025 05:59:49.4714
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LYqSGF4erOCY8giurJXbqdud5Ia5x+6vn/FP27Mo1E22BJc4sGs/2FE+RbVQVewSoyMEeplN3t9qghfqdEMVFGSdpvO6tEhoXZySMmzPHC4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8402
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: goitIrKAh0PyJeNOirs9vd7NBBcaM9_8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE4MDA1MiBTYWx0ZWRfX+N53QWeEPTn6
 BQa1yWACLDWxStnCALo0k0JpxM5vC6AU+72+S7OPHRrATcrHKwzvUCmvJ3Yi8+2Dskx9pgKR2sg
 3pc3lhNy0q9ehl39b5TbdD3Ia0Km1v1SW6QsXlEd1X8YAQi/a0KQ5e4eFSu5ozM8GijmHwJ18uG
 OTN+2IcC4Did0GR4wdX/Z8o6ZsjGKlYwhtPiMXb7gfIBWPcZdIea4xwJmtLUFSJwMHLRHDx3Hnt
 KfLnwIZbbHdmYjiFGj/pIIU2fEq/+W324CrtXyR+jiHXbX/tL7rro26hrv6fxC+kTQ9boR0IIo9
 PS7812glcjnV2FLNXd+eTbxEwAUVwXL0m7l/LiebduJzDUisY7NB91ZrV1axfs=
X-Authority-Analysis: v=2.4 cv=WvsrMcfv c=1 sm=1 tr=0 ts=68cb9fd8 cx=c_pps
 a=LrO9QPEl2oM1zDNvT4V0vg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=LXCGm8LIAAAA:8 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8
 a=t7CeM3EgAAAA:8 a=yj-aMKAYKbz0kkd27lYA:9 a=QEXdDO2ut3YA:10
 a=NxI9r9ql2kHpUT0AVVEO:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: NDLNOLh4rFN8frZvYcwKyUHzJTCBErCk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 05:59:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119524

VGhhbmtzIGZvciB5b3VyIGZlZWRiYWNrLiBJ4oCZdmUgYWxyZWFkeSBzZW50IGEgbmV3IHBhdGNo
IHRvIHdhbG5hc2NhciBhbmQgZml4ZWQgdGhlIHR5cG8gaW4gdGhlIG1hc3RlciBicmFuY2ggYXMg
d2VsbC4NCg0KVGhhbmtzLA0KSmlheWluZy4NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
CkZyb206IEd5b3JneSBTYXJ2YXJpIDxza2FuZGlncmF1bkBnbWFpbC5jb20+IA0KU2VudDogVGh1
cnNkYXksIFNlcHRlbWJlciAxOCwgMjAyNSAxMjozMCBQTQ0KVG86IFNvbmcsIEppYXlpbmcgKENO
KSA8SmlheWluZy5Tb25nLkNOQHdpbmRyaXZlci5jb20+OyBhbmt1ci50eWFnaTg1QGdtYWlsLmNv
bTsgb3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNClN1YmplY3Q6IFJl
OiBbb2VdIFttZXRhLW9lXVt3YWxuYXNjYXJdW1BBVENIIDEvMl0gd2Via2l0Z3RrMzogZml4IGJ1
aWxkIGZhaWx1cmUgd2l0aCBERUJVR19CVUlMRCBlbmFibGVkDQoNCkNBVVRJT046IFRoaXMgZW1h
aWwgY29tZXMgZnJvbSBhIG5vbiBXaW5kIFJpdmVyIGVtYWlsIGFjY291bnQhDQpEbyBub3QgY2xp
Y2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IHJlY29nbml6ZSB0aGUgc2Vu
ZGVyIGFuZCBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUuDQoNCk9uIDkvMTgvMjUgMDU6NDYsIFNv
bmcsIEppYXlpbmcgKENOKSB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4gZGlm
ZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L3dlYmtpdGd0ay93ZWJraXRndGszXzIu
NDguMS5iYiANCj4gYi9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC93ZWJraXRndGsvd2Via2l0Z3Rr
M18yLjQ4LjEuYmINCj4gaW5kZXggYjAzZWQzY2JiOS4uYzNkMjE2OTEwMiAxMDA2NDQNCj4gLS0t
IGEvbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvd2Via2l0Z3RrL3dlYmtpdGd0azNfMi40OC4xLmJi
DQo+ICsrKyBiL21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L3dlYmtpdGd0ay93ZWJraXRndGszXzIu
NDguMS5iYg0KPiBAQCAtMjEsNiArMjEsNyBAQCBTUkNfVVJJID0gImh0dHBzOi8vd3d3LndlYmtp
dGd0ay5vcmcvcmVsZWFzZXMvd2Via2l0Z3RrLSR7UFZ9LnRhci54eiBcDQo+ICAgICAgICAgICAg
IGZpbGU6Ly8wMDAxLUZpeC1idWlsZC1lcnJvcnMtb24tUklTQ1YtaHR0cHMtYnVncy53ZWJraXQu
b3JnLXNob3cucGF0Y2ggXA0KPiAgICAgICAgICAgICBmaWxlOi8vZml4LXR5cG8tZGVub3JtYWxk
aXNhYmxlci5wYXRjaCBcDQo+ICAgICAgICAgICAgIGZpbGU6Ly9maXgtZnRiZnMtcmlzY3Y2NC5w
YXRjaCBcDQo+ICsgICAgICAgICAgIA0KPiArIGZpbGU6Ly8wMDAxLUNNYWtlLUFkZC1hLXZhcmlh
YmxlLXRvLWNvbnRyb2wtbWFjcm8tX19QQVNfQUxXQVlTX0kucGF0DQo+ICsgY2ggXA0KPiAgICAg
ICAgICAgICAiDQo+ICBTUkNfVVJJW3NoYTI1NnN1bV0gPSAiOThlZmRmMjFjNGNkY2EwZmUwYjcz
YWI1YThjYjUyMDkzYjVhYTUyZDliMWIwMTZhOTNmNzFkYmZhMWViMjU4ZiINCj4NCj4gQEAgLTk5
LDcgKzEwMCw4IEBAIEVYVFJBX09FQ01BS0UgPSAiIFwNCj4gICAgICAgLURVU0VfR1RLND1PRkYg
XA0KPiAgICAgICAke0BiYi51dGlscy5jb250YWlucygnR0lfREFUQV9FTkFCTEVEJywgJ1RydWUn
LCAnLURFTkFCTEVfSU5UUk9TUEVDVElPTj1PTicsICctREVOQUJMRV9JTlRST1NQRUNUSU9OPU9G
RicsIGQpfSBcDQo+ICAgICAgICR7QGJiLnV0aWxzLmNvbnRhaW5zKCdHSURPQ0dFTl9FTkFCTEVE
JywgJ1RydWUnLCAnLURFTkFCTEVfRE9DVU1FTlRBVElPTj1PTicsICctREVOQUJMRV9ET0NVTUVO
VEFUSU9OPU9GRicsIGQpfSBcDQo+IC0gICAgIC1ERU5BQkxFX01JTklCUk9XU0VSPU9OIFwNCj4g
KyAgICAgJHtAb2UudXRpbHMudmFydHJ1ZSgnREVCVUdfQlVJTEQnLCANCj4gKyAnLURXRUJLSVRf
Tk9fSU5MSU5FX0hJTlRTPU9OJywgJy1EV0VCS0lUX05PX0lOTElORV9ISU5UUz1PRkZGJywgZCl9
IA0KPiArIFwNCg0KVGhpcyBzZWVtcyB0byBoYXZlIGFuIGV4dHJhIEYgKE9GRkYpLiBJdCBzZWVt
cyB0byBiZSBwcmVzZW50IGluIHRoZSBwYXRjaCBmb3IgbWFzdGVyIGJyYW5jaCBhc3dlbGwuDQoN
Cj4gKyAgICAgICAgLURFTkFCTEVfTUlOSUJST1dTRVI9T04gXA0KPiAgICAgICAtRENNQUtFX0VY
UE9SVF9DT01QSUxFX0NPTU1BTkRTPU9GRiBcDQo+ICAgICAgICAgICAgICAgIg0KPiAgIyBwYXNz
IC1nMSB0byBtYXNzaXZlbHkgcmVkdWNlIHRoZSBzaXplIG9mIHRoZSBkZWJ1ZyBzeW1ib2xzICg0
LjNHQiANCj4gdG8gNzAwTSBhdCB0aW1lIG9mIHdyaXRpbmcpDQo+DQo+IC09LT0tPS09LT0tPS09
LT0tPS09LT0tDQo+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlz
IGdyb3VwLg0KPiBWaWV3L1JlcGx5IE9ubGluZSAoIzExOTUxNCk6IA0KPiBodHRwczovL2xpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtZGV2ZWwvbWVzc2FnZS8xMTk1MTQNCj4g
TXV0ZSBUaGlzIFRvcGljOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQvMTE1MzA0
NjMzLzYwODQ0NDUNCj4gR3JvdXAgT3duZXI6IG9wZW5lbWJlZGRlZC1kZXZlbCtvd25lckBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnDQo+IFVuc3Vic2NyaWJlOiBodHRwczovL2xpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtZGV2ZWwvdW5zdWIgDQo+IFtza2FuZGlncmF1bkBnbWFp
bC5jb21dDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+DQoNCg==


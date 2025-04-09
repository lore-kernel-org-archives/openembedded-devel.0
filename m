Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD6BBC36002
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 07:28:01 +0000 (UTC)
Received: from esa10.fujitsucc.c3s2.iphmx.com (esa10.fujitsucc.c3s2.iphmx.com [68.232.159.247])
 by mx.groups.io with SMTP id smtpd.web11.2925.1744183676881293359
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Apr 2025 00:27:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=eJlcfgSl;
 spf=pass (domain: fujitsu.com, ip: 68.232.159.247, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1744183676; x=1775719676;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=VOKhXeC3uwSVeJe3A9JC7ucfbqUyv6GkdnalgVOz9qk=;
  b=eJlcfgSlJI4WODSs1a0mq1TqEv5+AJ8apt3ukcRtOWzqiotyOWldNzUr
   E1RLQ0b5KyuBquKVjFmmFoRI5MMkz9K9FDGSAzf/10FUvFlWtZpfMR5hl
   xxQQyVxGJTNMqd0HO0hThxBlAVgyVP1wsRp+ERBxZS2dmpW5EOPW6wika
   LVkm6nemxIxAtvL1LVL8Z9yPnmgDDthdplH0eIz7859FsWyz66hzw/2Wg
   /miL6FVgLccwik78nuq3GWTplodtXrHgpQuoDcjXHxErp6YC+J1ZyL+RD
   N70LK45FaKqDKmXrO4+4B8vy50MDOqeMTZOS3m+QkRRyFKlmNI1Wkg+0D
   A==;
X-CSE-ConnectionGUID: 0Ym48NuKSESPA/pAbv3/uQ==
X-CSE-MsgGUID: QUkHCv6TQOGxrWKGO/dSIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="152329878"
X-IronPort-AV: E=Sophos;i="6.15,200,1739804400"; 
   d="scan'208";a="152329878"
Received: from mail-japaneastazlp17010000.outbound.protection.outlook.com (HELO TY3P286CU002.outbound.protection.outlook.com) ([40.93.73.0])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 16:27:53 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RM1TAzZQ4Ub8aMyYR1wZgwMf5pi0T+mXhGNAf73Vxuw2qyE0JokZrElsVoBOQX9sjhI6yzXE0f57L4yhRna/saOwXinQd0Hs0zNhla/Aakh3Vlgbmi7MOU2KmNHFBA4TKP4m+45ZUumH6CvvV4GCs5xbMVLb1YHlybP8fKGJPce5vjuOGaW9DO0wWsiNaEwQ4/EMaHIYWbAnC3LTQ2kaHYcT6Cc7nISc6L6qAUa6xB19O8Qsmpmj5DN+swxB6oMrxNyQzSA9SjGM+Zi7QinxFy0IIXf2OE+Wx985lfW+BVrdH3qjAv+SgJnIpH0b0AnVvK7njY0RDJJcHWo7edLESA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VOKhXeC3uwSVeJe3A9JC7ucfbqUyv6GkdnalgVOz9qk=;
 b=LL1pMLFG/eqJ0RvPCEH5Gm/zJ1h/PFlbWGbv3IX20J1gVS9SfD7oZuJhzAM3TuPgjeOAFz1k8mvlC453PYuZIvOtxNeBSZfi7ojqKvYtO9KOytDlWezFTyQYFSurxGqUG6wiDASfRcTbODtBAdz0SCA+Y5k4i2f5khYYZXnQ770+MwMd29rXMQhMhMxr/vOD/w3a5FtuFBiZtnnSpct3pcn1Q1RqhgQRgAlIoPFr+M1eVowS84jheehx2CnkkeOn13TpuciBqbQYcGGqKhL3VxndJy2CDOh+pPuHmNudQ4lAQgtKEJoOAJk1wSs8Z8YpxQq85qXh6/xcIKMx/kSGOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 (2603:1096:400:3fb::13) by TYYPR01MB13339.jpnprd01.prod.outlook.com
 (2603:1096:405:1bd::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Wed, 9 Apr
 2025 07:27:44 +0000
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e0dd:28e5:6a6e:2342]) by TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e0dd:28e5:6a6e:2342%5]) with mapi id 15.20.8606.029; Wed, 9 Apr 2025
 07:27:44 +0000
From: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>
CC: Gyorgy Sarvari <skandigraun@gmail.com>,
	"linux-yocto@lists.yoctoproject.org" <linux-yocto@lists.yoctoproject.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [linux-yocto] error of tiptop
Thread-Topic: [oe] [linux-yocto] error of tiptop
Thread-Index: AdujrHwaXif0pN2pR32+YCy4a4R1JwAvnEOAAPrqZuAAERpyAAAhZYmg
Date: Wed, 9 Apr 2025 07:27:43 +0000
Message-ID: 
 <TYWPR01MB11861CCF4F133083155F3B7C3DCB42@TYWPR01MB11861.jpnprd01.prod.outlook.com>
References: 
 <TYWPR01MB118613486A025B1F8AE633026DCAF2@TYWPR01MB11861.jpnprd01.prod.outlook.com>
 <400fa42d-4c27-4ef0-86f4-62046b0cd021@gmail.com>
 <TYWPR01MB1186183EAB588828FDA06A60BDCB52@TYWPR01MB11861.jpnprd01.prod.outlook.com>
 <CAMKF1sof5d3wTtfaqmxF70MKGRXzAF1G4vS5L1mjCEsfQMFvDQ@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sof5d3wTtfaqmxF70MKGRXzAF1G4vS5L1mjCEsfQMFvDQ@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5Njgw?=
 =?utf-8?B?MmZfQWN0aW9uSWQ9NjE5MzNkYWQtYWYyNS00ZmIzLTg1NzUtNDMzMmNkNmQ1?=
 =?utf-8?B?MDdjO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMz?=
 =?utf-8?B?OTY4MDJmX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQx?=
 =?utf-8?B?LTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX01ldGhv?=
 =?utf-8?B?ZD1Qcml2aWxlZ2VkO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFk?=
 =?utf-8?B?NTUtNDZkZTMzOTY4MDJmX05hbWU9RlVKSVRTVS1QVUJMSUPigIs7TVNJUF9M?=
 =?utf-8?B?YWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfU2V0?=
 =?utf-8?B?RGF0ZT0yMDI1LTA0LTA5VDA3OjI1OjQyWjtNU0lQX0xhYmVsXzFlOTJlZjcz?=
 =?utf-8?B?LTBhZDEtNDBjNS1hZDU1LTQ2ZGUzMzk2ODAyZl9TaXRlSWQ9YTE5ZjEyMWQt?=
 =?utf-8?B?ODFlMS00ODU4LWE5ZDgtNzM2ZTI2N2ZkNGM3O01TSVBfTGFiZWxfMWU5MmVm?=
 =?utf-8?B?NzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX1RhZz0xMCwgMCwgMSwg?=
 =?utf-8?Q?1;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB11861:EE_|TYYPR01MB13339:EE_
x-ms-office365-filtering-correlation-id: 8a8e4436-d1f1-4972-a9c9-08dd773804ba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|4022899009|376014|366016|1800799024|38070700018|1580799027;
x-microsoft-antispam-message-info: 
 =?utf-8?B?bXJubXM5aVNsVWdrK1BMSUZyWmMybG1EY2lobnlLU1hvMGorY3J4NzZaeDdi?=
 =?utf-8?B?L21ZYzl5RnB2UEl4T2lib2k5SHZWa0MxREhUM284OVUyMFZlZFJMVEtXYWl2?=
 =?utf-8?B?akFrbER5UHlHTTFSSHRlK0hvQUhMWFc5NUlaQXFGNFBDSlhCYmVzdTYrUS9Q?=
 =?utf-8?B?MndtUE5kQmFrSExlY09QWGFUQjJnc3hocms1Y2FXZG1YaG5YYlkremhtNHhJ?=
 =?utf-8?B?QW5vUE13bnE1TGIwRVdFenA2Z0Rjd1QwTnR2dzZHWVYvVGk4S1Z5RFd1Y2pG?=
 =?utf-8?B?RG5ibTBOUjVZVGJyZ2NIVWVEek94VXdyYXhLSTk5SjBlbitKR1lielVubkxG?=
 =?utf-8?B?WDZXSG13NTQ3SS83TVorNGRsNm5UUXFZbFNJTVprRGc5bkxVc3pDVFFrQjRE?=
 =?utf-8?B?cFFxTy9JSFN1a1JiajhGcGpxcDNsWktLTURzbVIvTzVMdHF3aEE3RjlmYjBW?=
 =?utf-8?B?ZVZKMk5hemxWbDRXQ29WYlVIbVZjcTdEWE5KZ1hSckxkbExsT05PaWVCaExq?=
 =?utf-8?B?VkpmcVQyb3JDREhxS2VmNEh6Zms4MkFvc2h4R2VWaXNNZTNCUzRZcklKTW1t?=
 =?utf-8?B?YTRZeWlUWW0xc21sVGNhbEU3ZFZsS0JsbTk2WmtTNGVXL0hXREo2VzF3RTJN?=
 =?utf-8?B?QTdrYW05OFU1U3ZMSHdnQ3RDMkR3b2Q4b0JyYlJXd1VYWTB5OVVYMUVPSkZP?=
 =?utf-8?B?VUhDd2Y0Q0tnZVNtVUN5SFFnUjRBeFpONXdxZzZ4clAzNno1aUlYRGRSM0xS?=
 =?utf-8?B?V2UzT1Q5OUZ2RXpUaVBVRkNUSVpZL1VCdHZoQnBLbmI3VWVRVFZtVHk2MnV4?=
 =?utf-8?B?RGJUMmdkTlh3cnpjL0J6ZFpMU1l6dk0xQ1llZFRHWXpRZnhzRUFwa0VHOTRV?=
 =?utf-8?B?L2ppZVdBalBNMlVZQ0RZSTZ0YVh2d0VNT3pCWjJIWnRtZGs0bHdjZEdRR3Yv?=
 =?utf-8?B?RUVHdGpJb1FYcjdaN1dvd28rMm53WWlxTjJacU5DT0ZCVzMrdCtMcEdrdjZw?=
 =?utf-8?B?by8zTFVUNi80VEN3RUdEVU9IRmFnZ2xpN0dFWXRXSktTRnNiaHZ6bldiOHRR?=
 =?utf-8?B?TzZ0YStYdTd1cHZVRG5UUjcvZ2FZZHBhRStQSy9GekovbHhXMzJFZkxkTENO?=
 =?utf-8?B?ZGw1OS92V1oyZWgwNjJUN2p1eTBpcW9XeEV2VFJva1hRVVB6YWtqK2NQVklq?=
 =?utf-8?B?RXlWMkljckRTMUQwSmJYRGFDcjkzUjU1dFd0NGxzbDY5dVkvZUg3ZS9VNlJP?=
 =?utf-8?B?bjRPeXFTMjlYRFJUVEVqaEluMWlnSzRoNTZDUEZSQkVjWkFRTmVpSW5xdm9W?=
 =?utf-8?B?SkhEWkpQY1ZSRmcyZ0NySUp6WmxtTThnbnNBVFBUbDFBbjBSckR2ZUZvNGZI?=
 =?utf-8?B?eWlpS20vMElEcTM2ZTBFWjluRE81UjltbytZSGRkdU5QcVZTek5zZ0FMM2tQ?=
 =?utf-8?B?Z2N3TmV3Q01FSnZZOVFXNzJmQTZ4aityNWN6cnJkMlNLZ01aOWp6Rk1YYzR1?=
 =?utf-8?B?U1JDQkE5TU43QTdqT21SOUViWDk0M0FRVWkvTmEwODFLeHRHd1MyeVJWMUE5?=
 =?utf-8?B?VzdzSVk0NnpGTnNZbDNOTFVkSjdjSklPOFhNM29zYVVtYVFlL0E4ZXh3QmVw?=
 =?utf-8?B?WHE1aVZpbGNPVnVBakp5b1dLZm01WU5hYWFFMVo3ZWxRb2NROHIzMDFiVlhV?=
 =?utf-8?B?bFcra2gyVG81VnBrS2VXMG84b2tES1YzOHU4R0VBWG1HalRrUWpocFY2Wno0?=
 =?utf-8?B?bWJWVGhKWW92QzRNb1dhMysvTTI0R2RKWHBtc1NWTHJoNTg1eFNEeFY5Ymlq?=
 =?utf-8?B?UmF6UklOUTdRNytuUU5pK21hang0SGhNK1lpdkk4ckIyY2tjREpPcXh2NWRp?=
 =?utf-8?B?bU9PUW91Y25iT1k5RXRLZDZTQjc0cmVLMkhDMFJMUlpEeXB2Nm5lMjJVa2d1?=
 =?utf-8?Q?ajMZblnXMS8=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB11861.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(366016)(1800799024)(38070700018)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SzZZd2twbjdWREJHc01jc3BtYWhxd09TcnU0cmhYdFZOOGtxNFl5S2NkSlNa?=
 =?utf-8?B?S0p6MjQ0TnZTaVhVelhBMENVV2VCNFpyNUlyaUVLVG4zREp0QUJqc1ZFeGF4?=
 =?utf-8?B?YWovR294ajQxalR4bjI1OHlpN05KVG9CUjRxUkJraVBZeEh5UCtUREZxRDZ3?=
 =?utf-8?B?YXlHMWRSVitCY3dKaXlZSVJubyt6V0hZTmJwZjRWK1JET1FLWkpoQW5rVE5S?=
 =?utf-8?B?bG91ZitMZHJQTE9Fd0R0NHFkMTZoaXhidjk1bGlVUjNMWHY4eHh0OSt1S0Qv?=
 =?utf-8?B?SFVNNlRRZHBtbHdsQUh2VDFoVERXM1BwR2loYU9uUVBmM3FxVGNHcXh1emRQ?=
 =?utf-8?B?YmpUSlhhdElvaFQ4eVZpcDBSeHV0ZFlSYm9VYVJSRG1RWWkrMVVzRXBZcUln?=
 =?utf-8?B?T0NaZlQ2V0ROc1VJWUwwTnlvRUw5all0TElpcWFUVThrKzNMbFhiSGQzYzVj?=
 =?utf-8?B?TVJQS2gwNlNCTE9Ndk9VNFA1dkRLa3ExTXBiUldjQk9nK3N0L0ZqZ3hXcTFV?=
 =?utf-8?B?bEdneW9GYTJjQXBKNDIyNUFwS1VrWDI0WnZXeEpTV2pKaGZNZjBWM0lMUFNI?=
 =?utf-8?B?bUlBa1lZb0FlMy96dWlkWXlQTUJGVjdHOE9aNFdNcUtucmM5dzBOanNSSFVZ?=
 =?utf-8?B?T24yejQzOVRIMCtVa21EZGFaaW9NYkUwV0xvOXh3K2liTHBJc1BPWWZkU09M?=
 =?utf-8?B?dXhjdnZBUlN3SUNyZUlWeU9zVmZ5WnBKQU9IU0lnWHlDN08zbUtmOUppM0p1?=
 =?utf-8?B?Y0FNT1RoLzNDeE94ZDBUejFHMmFqenBPZ2pKd3luNlorbFRwcEJucFdsd0J0?=
 =?utf-8?B?VVpDa2d5MjFaZFlkQWxTR1BseXhZbk9weFJkWk1YNDk3RVBmZjlZQld5dUFR?=
 =?utf-8?B?bU41TWY0ZTFVTVNGcUc3NFpPME1yWHlIMkU4VXdYa2ZSc2swSlgwYWNhcmJW?=
 =?utf-8?B?QldWZWhPNEJ3d3JLNXRtRzcrbDNHemVIOS82ZU1DdWVZY3lKNm5qTS83ZU54?=
 =?utf-8?B?UjJ0WFV0d0JlcFBWYjRJY1dmZlcwUFh1WlNLKzBZeFJxZ0hFakxFSThWck5V?=
 =?utf-8?B?WVFoYVk1THIxZHhkZm5vdFVhMGIxWWtHM0xHN1hzSUZVaUZaWHpUY29OM3pl?=
 =?utf-8?B?RTdYdUpka3duUFR4TWdGRVA4ZVczbTNrT2hMdTA1UkN0Tzk1Njh2UVNnNkIr?=
 =?utf-8?B?ZjdWcGREcU0wamxsZzV6NzR4d3ZyUjAxMDNwY3V1dHZSNksvRzVOWklHSjVL?=
 =?utf-8?B?SlBDK1FuODJGQXBod2FOYWwvMFhNcXh1bXd5cFRaT3VYRVZmYkY1bFlSL01w?=
 =?utf-8?B?NHF2VHFkVE1ISEV6U2FYcGFpaHlySHgxMEFuNE9xcklDaE1NY1QvcnBLZUVW?=
 =?utf-8?B?M1RVdkFiT081UWFwWlJZV1VJVGRueDR1c1g4WXpTR1ZNeG85WlFPSG92TFBk?=
 =?utf-8?B?WWY0dUdmejVGQzlZQWlSRThGclpoNXlwUEdLb0k4cWRYOU4vOThYdWxXbzRR?=
 =?utf-8?B?NlVaN0FBdjFobmVwTXJLSE00b2pacnVCbEVpWFBaOFZBRnI3N1Ntejd0eEtv?=
 =?utf-8?B?dUd4aWxjYVZyT3hySld0NTVaMDcyZ3VwUWRJbnlPVkYvcGRnQUZTR1FxbFlk?=
 =?utf-8?B?RFBObUxvVVd1V2Z1Zk9rSDltR3IrWWUzSUlic2w1cWZudjB2K042WE54aWo4?=
 =?utf-8?B?bFlDYWxPV3JLNzNqbGRvT3IwaDJYNmdJclV3bmIxaHg5Z3NhM2lJT0xhZEpv?=
 =?utf-8?B?a1pqMzJaTlY2NExNNmNkTStKTjlQQmZCTDM5T3ZBV0dYSVJGRkVDTVAwcFAr?=
 =?utf-8?B?NjVUNnZUWHYzMXBWVVN2Z1NsNlJyMFkyeTAxMm9YYisrNUtHeXJGR0xzRXFt?=
 =?utf-8?B?emRucjkxeFZBckhjZkU4Uys0Q2tjbW9VZll1ZTVDVnh5bVNrYjlUTmhzRTlP?=
 =?utf-8?B?ejRYRmNmdjFySXh5c0tWNWkvRmlCTzBqcGdkOWRic3FCNFdTVE53Z0VlU2R4?=
 =?utf-8?B?SnlEWHE0ckdGYTRYWEVGTE9SaUhxNzRNNXhpQThnUjRvcHBBVXJUYVRmMlU4?=
 =?utf-8?B?eHhpekUvWFUvZHhkZlhwM2ZZc0FKcXFKVzN2RkZuVkV4ek54YUU0TUpwUXZo?=
 =?utf-8?Q?yD0QNa1IxXPqWuYR1+jXU4tv0?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	nqGoPfGFnYdFsXwjN8ZBTd3+R6JY8/Yl5NRcrJ0sV0GepyOyN7TqDgYWbvzD4UllhUWQasi57LItp+EiorvlcVGhxWaBHv/OA1Rcn2tRE1jzP2zk3HeAYAF9Hry77HDIWoqrB9/a7oI8ssh/JB8HyMIJqNM5hdNRs8HugRTOxfJWECRVYJfLfOB/b0iIozZU1KEc+kI5Gl05Br7yDFaaa6oNOB3yng29lzgmnIU0+x9JB/7WzEbwoffkdq4XjwC+RQ2kTAKg/bttvqRtJu0kfBiPWu5TQjxBJx5+6D0QN4NEF3fx+mhE/KUJzXpMoVXexafFJJXpZbmRyIXdmMTbdiQbQ8qpVJm8Y6/3AXs71t5e4iXmo4eiVZGvCUnwNuuXGjRH3uITEzOy1S3+Z6OQm1EK9tdenDIHJibor75piM5u24bqBPkmQES9EbUCMJNwWpwn8OVfJjS3lhIzuNAyLpdjTSTCH1SlGBX64+EH/qk09sc3Nr98dLwXst3yW4wRH8qn8ZFvgjVp4LSL3ykdYpBOTP73UGVQhKhhb2bws6osH3LAzjQlFjeA+sgJMzCxjEmoD03gqQ1j2HQjpIRKUjoNfwzXHjvKyhkA2g2CSltVqpeG6mlwGjNVfV8bLjKU
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11861.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a8e4436-d1f1-4972-a9c9-08dd773804ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2025 07:27:43.7676
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: blMfYKpFGXEJ7jgR+hD2ouHfj1Or4XEv2RqaW8NKAwT/WXcdxGoFNNeKSkrCH4y7/JOIOEufJCuDD4pvkFivsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13339
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Apr 2025 07:28:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116727

SSB0cmllZCAiIHJ1bnFlbXUga3ZtIG5vZ3JhcGhpYyBxZW11eDg2LTY0IiwgYnV0IHRoZXJlIHN0
aWxsIHJlcG9ydCBhbiBlcnJvcjogDQoNCnJvb3RAcWVtdXg4Ni02NDp+IyB1bmFtZSAtYQ0KTGlu
dXggcWVtdXg4Ni02NCA2LjEyLjE5LXlvY3RvLXN0YW5kYXJkICMxIFNNUCBQUkVFTVBUX0RZTkFN
SUMgV2VkIE1hciAxOSAyMzowNDowOCBVVEMgMjAyNSB4ODZfNjQgR05VL0xpbnV4DQpyb290QHFl
bXV4ODYtNjQ6fiMgdGlwdG9wIC1oDQpzeXNjYWxsOiBPcGVyYXRpb24gbm90IHBlcm1pdHRlZA0K
Q291bGQgbm90IHBlcmZvcm0gc3lzY2FsbC4NCkRvbid0IGtub3cgd2h5Li4uDQpyb290QHFlbXV4
ODYtNjQ6fiMNCg0KICAtLQ0KQmVzdCBSZWdhcmRzDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCldhbmcgTWluZ3l1DQpGVUpJVFNVIE5BTkpJTkcg
U09GVFdBUkUgVEVDSE5PTE9HWSBDTy4sIExURC4gKEZOU1QpDQpOby42IFdlbnpodSBSb2FkLCBO
YW5qaW5nLCAyMTAwMTIsIENoaW5hDQpURUzvvJorODYrMjUtODY2MzA1NjYtLTg1NjgNCkNPSU5T
OiA3OTk4ODU0OA0KRkFYOiArODYrMjUtODMzMTc2ODUNCk1BSUw6IHdhbmdteUBmdWppdHN1LmNv
bQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEtoZW0gUmFqIDxyYWou
a2hlbUBnbWFpbC5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIEFwcmlsIDgsIDIwMjUgMTE6MjkgUE0N
Cj4gVG86IFdhbmcsIE1pbmd5dS/njosg6bij55GcIDx3YW5nbXlAZnVqaXRzdS5jb20+DQo+IENj
OiBHeW9yZ3kgU2FydmFyaSA8c2thbmRpZ3JhdW5AZ21haWwuY29tPjsNCj4gbGludXgteW9jdG9A
bGlzdHMueW9jdG9wcm9qZWN0Lm9yZzsNCj4gb3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtvZV0gW2xpbnV4LXlvY3RvXSBlcnJvciBvZiB0
aXB0b3ANCj4gDQo+IE9uIFR1ZSwgQXByIDgsIDIwMjUgYXQgMTI6MjjigK9BTSB3YW5nbXkgdmlh
IGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPHdhbmdteT1mdWppdHN1LmNvbUBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gPg0KPiA+IEkgdHJpZWQgIiBydW5xZW11IHFlbXV4ODYt
NjQgcWVtdXBhcmFtcz0iIC0tZW5hYmxlLWt2bSAiIG5vZ3JhcGhpYyIsIGJ1dA0KPiB0aGVyZSBz
dGlsbCByZXBvcnQgYW4gZXJyb3I6DQo+ID4NCj4gDQo+IHJ1bnFlbXUga3ZtIG5vZ3JhcGhpYyBx
ZW11eDg2LTY0DQo+IA0KPiA+IHJvb3RAcWVtdXg4Ni02NDp+IyB0aXB0b3ANCj4gPiBzeXNjYWxs
OiBPcGVyYXRpb24gbm90IHBlcm1pdHRlZA0KPiA+IENvdWxkIG5vdCBwZXJmb3JtIHN5c2NhbGwu
DQo+ID4gRG9uJ3Qga25vdyB3aHkuLi4NCj4gPg0KPiA+IE15IHJlcG8gb2YgbWV0YS1vcGVuZW1i
ZWRkZWRdIGhhcyBiZWVuIHVwZGF0ZWQgdG8NCj4gODIwNTZiOTkyNDU5NjA3ZWE2OWIwMTMwMzA4
Njg1YzQ4NzJjYjE5YjcNCj4gPiBSZXBvIG9mIHBva3kgaGFzIGJlZW4gdXBkYXRlZCB0bw0KPiA5
ZTQxOGM0MjY1NDUzODYwYzQ3MzZhYmI3NTIwZjFjM2MyYzNmYWVlDQo+ID4gICAtLQ0KPiA+IEJl
c3QgUmVnYXJkcw0KPiA+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQ0KPiA+IFdhbmcgTWluZ3l1DQo+ID4gRlVKSVRTVSBOQU5KSU5HIFNPRlRXQVJF
IFRFQ0hOT0xPR1kgQ08uLCBMVEQuIChGTlNUKQ0KPiA+IE5vLjYgV2Vuemh1IFJvYWQsIE5hbmpp
bmcsIDIxMDAxMiwgQ2hpbmENCj4gPiBURUzvvJorODYrMjUtODY2MzA1NjYtLTg1NjgNCj4gPiBD
T0lOUzogNzk5ODg1NDgNCj4gPiBGQVg6ICs4NisyNS04MzMxNzY4NQ0KPiA+IE1BSUw6IHdhbmdt
eUBmdWppdHN1LmNvbQ0KPiA+DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+
ID4gRnJvbTogR3lvcmd5IFNhcnZhcmkgPHNrYW5kaWdyYXVuQGdtYWlsLmNvbT4NCj4gPiA+IFNl
bnQ6IFRodXJzZGF5LCBBcHJpbCAzLCAyMDI1IDM6MzUgUE0NCj4gPiA+IFRvOiBXYW5nLCBNaW5n
eXUv546LIOm4o+eRnCA8d2FuZ215QGZ1aml0c3UuY29tPjsNCj4gPiA+IGxpbnV4LXlvY3RvQGxp
c3RzLnlvY3RvcHJvamVjdC5vcmcNCj4gPiA+IENjOiBvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZw0KPiA+ID4gU3ViamVjdDogUmU6IFtvZV0gW2xpbnV4LXlvY3RvXSBl
cnJvciBvZiB0aXB0b3ANCj4gPiA+DQo+ID4gPiBPbiB3aGF0IG1hY2hpbmUgYXJlIHlvdSB0cnlp
bmcgdG8gcnVuIGl0PyBBdCBsZWFzdCBpbiBxZW11IEkgZ2V0IHRoZSBzYW1lLA0KPiA+ID4gdW5s
ZXNzIEkgZW5hYmxlIGt2bSBkaXJlY3RseToNCj4gPiA+DQo+ID4gPiBydW5xZW11IHFlbXV4ODYt
NjQgcWVtdXBhcmFtcz0iIC0tZW5hYmxlLWt2bSAiDQo+ID4gPg0KPiA+ID4gVGhpcyB3YXkgSSBk
b24ndCBnZXQgdGhhdCBlcnJvci4NCj4gPiA+DQo+ID4gPiBPbiA0LzIvMjUgMTA6NTIsIHdhbmdt
eSB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4gPiA+ID4gSGksDQo+ID4gPiA+
DQo+ID4gPiA+IFdoZW4gcnVubmluZyB0aXB0b3Agb24gdGhlIGltYWdlIG9mIHg4Ni02NCBmb3Ig
dGhlIGxhdGVzdCByZXBvc2l0b3J5IG9mDQo+IHBva3kNCj4gPiA+IGFuZCBtZXRhLW9lLCBhbiBl
cnJvciBvY2N1cnJlZC4NCj4gPiA+ID4NCj4gPiA+ID4gcm9vdCAjIHRpcHRvcCAtaA0KPiA+ID4g
PiBzeXNjYWxsOiBPcGVyYXRpb24gbm90IHBlcm1pdHRlZA0KPiA+ID4gPiBDb3VsZCBub3QgcGVy
Zm9ybSBzeXNjYWxsLg0KPiA+ID4gPiBEb24ndCBrbm93IHdoeS4uLg0KPiA+ID4gPg0KPiA+ID4g
PiBBY2NvcmRpbmcgdG8gcHJlbGltaW5hcnkgaW52ZXN0aWdhdGlvbiwgdGhlIGNhdXNlIG9mIHRo
aXMgaXNzdWUgaXMgcmVsYXRlZCB0bw0KPiA+ID4ga2VuZXJsIHVwZGF0aW5nIG9mIHBlcmYgcmVs
YXRlZCBjb2RlLg0KPiA+ID4gPiBUaGlzIHByb2JsZW0gaGFzIGJlZW4gb2NjdXJyaW5nIHNpbmNl
IHRoZSBjb21taXQNCj4gPiA+ID4gZjM5MGMyZWVhNTcxOTQ1ZjM1N2EyZDNiOWZjYjFjMDE1NzY3
MTMyZSBvZiBicmFuY2gNCj4gdjYuNi9zdGFuZGFyZC9iYXNlDQo+ID4gPiA+DQo+ID4gPiA+IE1h
eSBJIGFzayBpZiB5b3UgaGF2ZSBhbnkgb3BpbmlvbnMgb3Igc3VnZ2VzdGlvbnMgcmVnYXJkaW5n
IHRoaXMgaXNzdWU/DQo+ID4gPiA+DQo+ID4gPiA+ICAgLS0NCj4gPiA+ID4gQmVzdCBSZWdhcmRz
DQo+ID4gPiA+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQ0KPiA+ID4gPiBXYW5nIE1pbmd5dQ0KPiA+ID4gPiBGVUpJVFNVIE5BTkpJTkcgU09GVFdB
UkUgVEVDSE5PTE9HWSBDTy4sIExURC4gKEZOU1QpDQo+ID4gPiA+IE5vLjYgV2Vuemh1IFJvYWQs
IE5hbmppbmcsIDIxMDAxMiwgQ2hpbmENCj4gPiA+ID4gVEVM77yaKzg2KzI1LTg2NjMwNTY2LS04
NTY4DQo+ID4gPiA+IENPSU5TOiA3OTk4ODU0OA0KPiA+ID4gPiBGQVg6ICs4NisyNS04MzMxNzY4
NQ0KPiA+ID4gPiBNQUlMOiB3YW5nbXlAZnVqaXRzdS5jb20NCj4gPiA+ID4NCj4gPiA+ID4NCj4g
PiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4NCj4gPg0KPiA+DQo+ID4gLT0tPS09LT0tPS09LT0tPS09
LT0tPS0NCj4gPiBMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBn
cm91cC4NCj4gPiBWaWV3L1JlcGx5IE9ubGluZSAoIzExNjY5Myk6DQo+IGh0dHBzOi8vbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1kZXZlbC9tZXNzYWdlLzExNjY5Mw0KPiA+
IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210LzExMjA0
MzMyMy8xOTk3OTE0DQo+ID4gR3JvdXAgT3duZXI6IG9wZW5lbWJlZGRlZC1kZXZlbCtvd25lckBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4gVW5zdWJzY3JpYmU6IGh0dHBzOi8vbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1kZXZlbC91bnN1Yg0KPiBbcmFqLmtoZW1AZ21h
aWwuY29tXQ0KPiA+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+ID4NCg==


Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5C09C369C2
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 10:25:14 +0000 (UTC)
Received: from esa13.fujitsucc.c3s2.iphmx.com (esa13.fujitsucc.c3s2.iphmx.com [68.232.156.96])
 by mx.groups.io with SMTP id smtpd.web10.36588.1745317504224243570
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Apr 2025 03:25:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=QQ+lz8+P;
 spf=pass (domain: fujitsu.com, ip: 68.232.156.96, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1745317504; x=1776853504;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=LInQuqsCvdF9GtKCwkXHg5y6CtybDrPO8N3A2ULTu5M=;
  b=QQ+lz8+P1WI/+g8FIvQRaYJIEtTfRUMHFQpattzhQBoEKnmgjNGapsuU
   hBGyr9wSx17KGfyvrZD3W6sk4rBPtni4JhMKh7bhK9mBee7+UVvrNjqpu
   EmgIWP/fJRgce6HAakeymSILg5s9ovPVcMR11oSa+4/b46UcVd2pvZKRh
   OKNtrImzQEZ+GQg7j2ef9D3W+O87njrIgfbgEKrytlTtX/chXgbE0JFwU
   rtNz7iJ9+n0J5Gw0BFFhA1Ob6aMQOctoyEl84kSz3L9ZB7XJUR/70frLd
   OF5IaZdNQ2Ucnxd3hz6qqB3r8aLsNqmvRcgXiCtwLR2J3kBTFt1UtHpoZ
   Q==;
X-CSE-ConnectionGUID: JCKtObu/SYCzNfCI3ggKSA==
X-CSE-MsgGUID: NLpz6h2JRE6CiakVq94f6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="153030819"
X-IronPort-AV: E=Sophos;i="6.15,230,1739804400"; 
   d="scan'208";a="153030819"
Received: from mail-japanwestazlp17011028.outbound.protection.outlook.com (HELO OS0P286CU010.outbound.protection.outlook.com) ([40.93.130.28])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 19:25:01 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GHc3JUwAFTEiqe70QD2UZDjJ3t7CK8sDMSbfLDtDvI50OL2UE9/gYJNCLg7NYsiZ3f1AFJeMInVitOUlYxxMVUwb4WC9qIlGK8MEtPKWRCBys+Ggz5UAiOO+Ao9vUu283cgDZahE3PbhPaf9XNCgj1AIx5eUWaclmE8TYezbMBMrdvhk4aH0889DXZ6KbupV+DxgasvamBm/LizLvxBB5mQJToP6KFaqezxNXehmrXHuJpuKgA7+KMlgcjY7GIStSn+Wx4H5WxGU8M92GnQa/yvg/O1PrkcXre2MKeqdVoWSDILIG46Y/4Bxc6k+ADv9Xhn2KIrL4KvDFNnvgPgQ5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LInQuqsCvdF9GtKCwkXHg5y6CtybDrPO8N3A2ULTu5M=;
 b=UJBlYHHyOIw34atHx9dp2xgCYDlSs41cCmm85HUurh+vG190TsmM0LDDZsP2rN0NstZJv4nLfvNzSlnoeIwpk5LsFnq1qbOiNvgF/rO77DKmHICsIZieoAw4I+zLinYepYgl5hQ/6dSNoLs2qKqu3OHTuAFbxmQmciukPTAAo+3r2/hFy9/0OkzwcJsxcOIVDvEPFlbIgtw0mdIy7wPYiNa5ss617RQLRc5qgF8IsYHwneL0dOttVNJ86OHvlx2NctQtePVhAeJyx8qy+bY8u61+9SOp0mM2Qqt7F+ciUJ2+Eliy9YoH+9/t7POY5ENQ04HlDCoWLGPeLsOchoWa8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OSRPR01MB11597.jpnprd01.prod.outlook.com
 (2603:1096:604:22f::12) by TYYPR01MB12920.jpnprd01.prod.outlook.com
 (2603:1096:405:15f::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Tue, 22 Apr
 2025 10:24:54 +0000
Received: from OSRPR01MB11597.jpnprd01.prod.outlook.com
 ([fe80::cb27:d71e:9f8a:8014]) by OSRPR01MB11597.jpnprd01.prod.outlook.com
 ([fe80::cb27:d71e:9f8a:8014%5]) with mapi id 15.20.8632.035; Tue, 22 Apr 2025
 10:24:54 +0000
From: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
To: Gyorgy Sarvari <skandigraun@gmail.com>, Khem Raj <raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: 
 =?utf-8?B?5Zue5aSNOiBbb2VdIFttZXRhLW9lXSBbUEFUQ0hdIG1vempzLTEyODogSU5T?=
 =?utf-8?Q?ANE=5FSKIP_32bit-time_QA_issue?=
Thread-Topic: [oe] [meta-oe] [PATCH] mozjs-128: INSANE_SKIP 32bit-time QA
 issue
Thread-Index: AQHbszabH34rjVEcE024ZPdjdBkAZrOvYbIAgAAXoCA=
Date: Tue, 22 Apr 2025 10:24:54 +0000
Message-ID: 
 <OSRPR01MB11597D3EA4600F225D7FF5D9C9BBB2@OSRPR01MB11597.jpnprd01.prod.outlook.com>
References: <20250422032816.785-1-liuyd.fnst@fujitsu.com>
 <87523724-b4d6-45d2-a8f3-a510f5d775d8@gmail.com>
In-Reply-To: <87523724-b4d6-45d2-a8f3-a510f5d775d8@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5Njgw?=
 =?utf-8?B?MmZfQWN0aW9uSWQ9Yzg2ODRiNTEtOGM2ZS00MTU5LTg4MzctZWE1YzdiYzg1?=
 =?utf-8?B?OWM1O01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMz?=
 =?utf-8?B?OTY4MDJmX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQx?=
 =?utf-8?B?LTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX01ldGhv?=
 =?utf-8?B?ZD1Qcml2aWxlZ2VkO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFk?=
 =?utf-8?B?NTUtNDZkZTMzOTY4MDJmX05hbWU9RlVKSVRTVS1QVUJMSUPigIs7TVNJUF9M?=
 =?utf-8?B?YWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfU2V0?=
 =?utf-8?B?RGF0ZT0yMDI1LTA0LTIyVDEwOjE4OjI1WjtNU0lQX0xhYmVsXzFlOTJlZjcz?=
 =?utf-8?B?LTBhZDEtNDBjNS1hZDU1LTQ2ZGUzMzk2ODAyZl9TaXRlSWQ9YTE5ZjEyMWQt?=
 =?utf-8?B?ODFlMS00ODU4LWE5ZDgtNzM2ZTI2N2ZkNGM3O01TSVBfTGFiZWxfMWU5MmVm?=
 =?utf-8?B?NzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX1RhZz0xMCwgMCwgMSwg?=
 =?utf-8?Q?1;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSRPR01MB11597:EE_|TYYPR01MB12920:EE_
x-ms-office365-filtering-correlation-id: 96a0ad08-727a-416c-4dd8-08dd8187ec40
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|4022899009|1580799027|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?REp2WHp3TDZsSCs2UStlNXVSQkhCcjJFY3ZwQWwxSWNteVpHclpvaXNxRnlj?=
 =?utf-8?B?Skd6TDdUanI5VHVzYWRKenVCSjBMVjJBaUJtVVlVRFpRS05PYVBDVisrMGdk?=
 =?utf-8?B?Unp1ZlUxMHBxVzJsdUFZeXlSTDJJU1Urd25EZmZwWTRFVWx3M1VES2ViN1VJ?=
 =?utf-8?B?Z2RtWktZOUtJaG5IZUR0eEpjbzJrd2IrRTBzYkpabytHUnBFMG1rSGJKYWdY?=
 =?utf-8?B?VTBJSUFkSlJYaXlObkJnUWFZaWtBbTFLOWlXbTR0QVRzWExHMFltMzRHL1M4?=
 =?utf-8?B?VHpKUzIwVkk1bFRoU3FicFZiZ1hQWmdCMDMrYjFWMGVJY21veXRMeG9KeVQ2?=
 =?utf-8?B?UnhjREI2Zm1JRE9SZXAwbm9UUktadkl0Rks4eElBUWVwSWE4cUFLWnJNQ3hI?=
 =?utf-8?B?dGZKV2xxcDY5eHlGZDk2eVlCY1djeWhyL1Q3QWdLRjJWRVRobS9KTG1SSExt?=
 =?utf-8?B?N2hTbzQrcHVJOUo4N3cvKzNjMUc0MUI2Skl2MEdOWWxOU3gxeDRZYkFVTFh4?=
 =?utf-8?B?dkhZa2IrWG9GYjdzNStVQlEzbFk1YzkzMGozUzk0cmVLYnM4dDJNVEI3U2cr?=
 =?utf-8?B?VnlPcCt0N1g4UkN2T0lVcVQ1NGpXaEZuUEhNdjkvY3F1Y0FNLzNaU2RXaVph?=
 =?utf-8?B?V0lPMGthM01ueW5ueCtyT2RuTVhITUVNajAvOTBZY1gyRkE2eXIvV0svNHVB?=
 =?utf-8?B?cWRpam9hUFE4U1JCYk9hMkd5TCsrZ25weCs5Tjh3a1ZxcUYxOWpJL2VPemZE?=
 =?utf-8?B?b3Zuc3V0ZkYyalE3dXh1UlREWjBHcjlFaXAwWlJSaDZVc2RkbE5zSnkreWNr?=
 =?utf-8?B?MkVoRTdGM2JwODRXUDI3KzRJVGhQTWUrZDhVaUJ5ZjQ0UVROeFUvU1IwZTRQ?=
 =?utf-8?B?SlBmZzFralhEaXFPcmR0Smx1VXRnS25GSkltRzVUZ2ZMWXhGcnh4bVpkRW81?=
 =?utf-8?B?OXljSXVNME5lZTBFMVFZYzNpeDlhZ3dBRDh3N2tJYWVqVUxzS04vTkFzKzI5?=
 =?utf-8?B?bkVyME0wOTg5RHUzWDJKVnJmY0I2MXNKSkw2bHVjdUd6K2RsRlhneWhwSEZJ?=
 =?utf-8?B?TzJ1NXRBVE1VSkFMVG82UkNoTUl0UXgxSVJ4MW9wcTlVNEF5bmRzRkNJYkhI?=
 =?utf-8?B?ZEl2ZHFlaW16QlFJcVFNbXdxcnluRytjUnBCRThmRU43RjkwdFcyS2FXekZH?=
 =?utf-8?B?Rm5QcVp6eUd4VS9uT3lENzJaaUdLL3lacVc2a0Y3bTZ1bjlpYXBOczZYZTRt?=
 =?utf-8?B?bUhnYWFJUjZXMkt2eU1RUnBOYTM5SmlBc1JUc3AxU0NJUEdBbEhkK2JKSW95?=
 =?utf-8?B?V2trdmdJVEtac0V4V2o1TUZkNjBXT2NKcm5EM2dQS2dNOE9HK241eXhSL3Ri?=
 =?utf-8?B?MEZsZFVZTi9vbDMxOWlBaWxzZncxNVlaaW5mL0lIWkVrNEFUeWRlbXNVR3Va?=
 =?utf-8?B?T2lBa2JFQmVpYUtsbGdqemVYN1lJVmJwZGpYN20ycFc5MkVwUFlrQmRQOEJ2?=
 =?utf-8?B?a3VKeTBrZG94bHp0b1NKZmFWYnlMSUc2SmZtOHNFU3RaQks4SmF2R1hvZFdu?=
 =?utf-8?B?ZGVmcmtoOWduL2FVK2pLT0Q5MUZOVUtES0JSeHRjbTVNQ3prQ20vUDNyNlZK?=
 =?utf-8?B?WXM5ZEd2M2JvSkN5NjlTTUxkL0VlMmk1UGNxNEJ0Z0JkeXl6aUZMcHRyWnRh?=
 =?utf-8?B?RjE3bTlMOFhhSWovNDRWeW1uV3lzeHNtRUNMMzF1QzBYaGdwaUxCK0tVL0Ju?=
 =?utf-8?B?Z3djSGpUUFJxQ3dWN2pRQ08rdmIwejdxS2NiWit4NERpZi9iTTJyczRsOEVh?=
 =?utf-8?B?Mzh4MzEzRm45V0lROVN6YzFWc1dEMnAwRmlCUWdTeWlvWDNERC8rMzJyeFQ5?=
 =?utf-8?B?cUczL1JpWlpZUHNJdGg2UXpUeXdkNlhUcHorQkIwR1BaZ0J2N3VrbGhIbWs0?=
 =?utf-8?Q?Nv6Ald5y9qCwK4AQgiclaZuXESa04GPl?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11597.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4022899009)(1580799027)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?c1dzKzlBV1pDMWNKR09vWlJSZERjbFp1QTNFLzZpSXhGTzZPRnNjaStiTWgz?=
 =?utf-8?B?Z3NrNUF6UjluSmRmZ1l1eFo4eVJSS1ZGeDhaQ2NlaXhDejVKY1h2eEc2WTcx?=
 =?utf-8?B?ZVc1R0VtdlpPeXdlTkZZNWZZaHh0Qko5YW9OTFZiZVRQVjlVc1dWaXM0cjNm?=
 =?utf-8?B?bmVWT2FkaEp3SFc2alEwRm1kVUhTcnFwSVVBR1A1bWx6QzRKMng2QUlxT3cy?=
 =?utf-8?B?RE9leXJFQXR4ekNGZGIrMkY1NkdGMVRmL01FZ2d3VTV0bEFvMWhBMVVZMTJ0?=
 =?utf-8?B?WUt3ZEhSZ1pkeEw0WWovUkd6eEpaVXNhSjVIUm5UVC8vSVk5a3VuVTVsV21I?=
 =?utf-8?B?bjZPSzMxeGR0T3g5RFUvRi9uU3pLSGZ3YVlRMlp3aTF2Kzc3bHNaSXJnWjRS?=
 =?utf-8?B?RVUzVE1oWngrUWxQU2pweWl3bHkzbFh3bGpIZXo4em9vd0NuRDcxM2Q0M2hZ?=
 =?utf-8?B?NWFuNXMvMkRBQ1hwU2cyM2hReGg0MDVNWHlSOWdBL3VHNVRnTE5qaHJONGFn?=
 =?utf-8?B?TGdLNEhwdGpRTWV4eHQvWUhxQS85WUllY1NVQ1dNaHM1c2F0SHlJNDRHTCtk?=
 =?utf-8?B?dU9uNzAvNUVTQWpBcTAyMWEyUHUwaFNIVnc2ZmJkTXQwa3NIMW1XQjBDUTZM?=
 =?utf-8?B?Z21meDBtLzVFaHRJZUR1T3dXMXorRHdFTmJWTWw5MHZiS1BMNEJUMVlSTHdO?=
 =?utf-8?B?R3VOMUQzTHMvQVFkQnFaNjRoTXhhZUJKUjQzQTVZZTFuUWRhVVBZZGF0MGY1?=
 =?utf-8?B?MUVIVzhIbHZFbkxyTzlvL09zZzFNdnFrbUlhVUczeDBLWGhKbFpWYkxIdG5D?=
 =?utf-8?B?VlBFa3dKQ3RZTERpcWI4NXlpNnEvaXJxcHNYUnpWU1VNRlpyYXBvVWFoQkY3?=
 =?utf-8?B?RWNMVUJJU1kya0xBcmZKSGFWOEF5aENWRGE1WXlNZG1XK2N5K1ZrdHZIOFNv?=
 =?utf-8?B?TktZUldFT094UkpkOXJBY1dUK0E0ODlralNhcFVLejBhbHA4RS9EV0lxK3gr?=
 =?utf-8?B?dFl6MWtGUk40L1F6MlJnV0xCeUR3MWdpcmlXaGFtZktCR1FVSzJvNHhTNmJk?=
 =?utf-8?B?YkkrZ2NnSVQyR0ZMbGFMVVA3L3JKZXQzdFJBYWJ3UzhzR3Jvem1UMlFlTHd5?=
 =?utf-8?B?Mm1ISnk1R0s3Nkh3NVd4VWNLQnJmQnFaTnlqcm91dUJjQnpLelRSN0tTZFM1?=
 =?utf-8?B?bzg1dnNjUDJzN1hkZ0g3SjBndzMzdU9BUDNLYmU5YWJwZkwwdlJUZUVkdldH?=
 =?utf-8?B?eWVvQ01KU0NDTk9qU1Z5TnZQdEQybE9jRDhnZnNwK3JvamFJemtXVGhKZEtq?=
 =?utf-8?B?SmFucDgxUVZaTVVORWtTcWpsc0pKVG5xTXVGTjEwVHB1TlVYVmV4RDJyWStu?=
 =?utf-8?B?THVLMUJ2ZWhBY1Byb1IwU2hhLy9VajBDY3pGeCtpMU1wajJIaitiQjJMNW9l?=
 =?utf-8?B?bXV3NkE1Sm5ralUrVkhQV1lxeTV0SFEvQkpqTEJGY2tuSTM1MjgvRmM2SE83?=
 =?utf-8?B?eEZrUkVOWUhKQ0N1bGJvRk1JWUVWbSt0YUluRFIzQU5Nc0VMZ3JtZFBXZ053?=
 =?utf-8?B?RVF3amc4dHVtTmFFTC81RnNqamd0bGlIWFdaY2JXSEE4VURPWngwQ1c5ZVFK?=
 =?utf-8?B?Q0FyOCtQUXVQNUQwQ1FpN291cHpRWFhSb3J5QXJKc0dTRjREZnovYzdZbjBQ?=
 =?utf-8?B?ZXZ0dVIwYUFDU3AzWkhvRG82Z1h5dTlyMW9sdFFOazZBSG4vM2MrUVBJSU8z?=
 =?utf-8?B?NUJMUzlOeW1OSlhCNktuNFNpdzYwVm9FVTZvbktQOWVBN3dYc081WnZENVFP?=
 =?utf-8?B?cGlzVjJvcEhURndqZXpHTENOQmxGVEpYMU4xS3EvN3dJcm5vRDFxdm9rUnhI?=
 =?utf-8?B?REVEOHJnOEZUbmRRdE5QbFZXRHhtTWduNTAwazVMeGU0MHBMSnYvN1JyMjdh?=
 =?utf-8?B?SHZXbElGeEMwR1hxWHNzTDdwSE5vcUwxbW5ub29LenZvMmNaWGd4Q3loNHRF?=
 =?utf-8?B?QmdvVmpjUU1Bdjd0b2tQTG1wWU1TNFpjTmhFQUdjUjF1MzdZOG14V29SY3Zs?=
 =?utf-8?B?YlJzY1MwYkV3a2k3ZDk3S1F3eFhPd1p5R1JpWjBkWjdBN1ZPU1V5czl5MmNk?=
 =?utf-8?Q?tcDxTmu8GpdF4dmuIOX4Wbo68?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	m5qIb8iwTx2J3Nai6JIzfT81O5n33H0T4WBt5bESmEOAjXTsc7NVf48eVG99y84cd7DGmuj11VL5CotOZAYPY5mF/iJyzBVkFuAwSbX22x5/iC3YR4n9rJvXeghQPYeAEjUa+uokIZNZwMurRtCcNMCMc2DOndngbMy9HIoKRqKljK9uOsMcgCoHFdj1gPzmm2nym3ovaJX0h74l/QSTX5hvRqYAvS3sK4lozy30IOinercSzI5UGkfLapUFg1ih7Qvvf7q5VKvUTDIGiRZmUkwmYL24fjRdXhkWTe/awjvc04aeJtPga2LQS/oSyUulFG8FGBJ05opb5R8HWUQujLQMwh4KHaO69Cu7tvoRK5IaBUVcCXe/8BpYmrZodIFdyIjc7dP7fsejyIcfTlP8T9AAKFuJPT6z1otILJAYVvrY355KuI75LcrQ2Ynuf/hbBYyVo1CZ7FpNfJyTqe7b88k9h2VMreSOnN2hZlkdTQVs0WHUE6gbdXs+MDwdwHZbMmzzzbmM/yPcCKkjDyqEiWTu+JjfXhSHo6yqV6vPn/NbEhl+ThKuDt9gXPIfB+dmOj/pyo2eYCt47Q8D5r4ZNP/ihVkXGWH6Dj2qGGzi9sdEC0n3iqOzqh5SZHWnFpoI
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11597.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96a0ad08-727a-416c-4dd8-08dd8187ec40
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2025 10:24:54.0311
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w0HCusyAK82ERrFVcZngfAhv9p5H/LfqxnnxJK2PXa0nbCEZk4cmn/t/J5Za7MZEIN5TnY1tISOzrWjuTQxMtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12920
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 10:25:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117055

DQoNCi0tLS0t6YKu5Lu25Y6f5Lu2LS0tLS0NCuWPkeS7tuS6ujogR3lvcmd5IFNhcnZhcmkgPHNr
YW5kaWdyYXVuQGdtYWlsLmNvbT4gDQrlj5HpgIHml7bpl7Q6IDIwMjXlubQ05pyIMjLml6UgMTY6
NTQNCuaUtuS7tuS6ujogTGl1LCBZaWRpbmcv5YiYIOS5meS4gSA8bGl1eWQuZm5zdEBmdWppdHN1
LmNvbT47IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+DQrmioTpgIE6IG9wZW5lbWJlZGRl
ZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQrkuLvpopg6IFJlOiBbb2VdIFttZXRhLW9l
XSBbUEFUQ0hdIG1vempzLTEyODogSU5TQU5FX1NLSVAgMzJiaXQtdGltZSBRQSBpc3N1ZQ0KDQpP
biA0LzIyLzI1IDA1OjI4LCBZaWRpbmcgTGl1IChGdWppdHN1KSB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyB3cm90ZToNCj4gfFdBUk5JTkc6IGxpYjMyLW1vempzLTEyOC0xMjguNS4yLXIwIGRv
X3BhY2thZ2VfcWE6IFFBIElzc3VlOiANCj4gfC91c3IvbGliL2xpYm1vempzLTEyOC5zbyB1c2Vz
IDMyLWJpdCBhcGkgJ3N0YXQ2NCcgWzMyYml0LXRpbWVdDQo+IHxXQVJOSU5HOiBsaWIzMi1tb3pq
cy0xMjgtMTI4LjUuMi1yMCBkb19wYWNrYWdlX3FhOiBRQSBJc3N1ZTogDQo+IHwvdXNyL2xpYi9s
aWJtb3pqcy0xMjguc28gdXNlcyAzMi1iaXQgYXBpICdmc3RhdDY0JyBbMzJiaXQtdGltZV0NCj4g
fFdBUk5JTkc6IGxpYjMyLW1vempzLTEyOC0xMjguNS4yLXIwIGRvX3BhY2thZ2VfcWE6IFFBIElz
c3VlOiBTdXBwcmVzcyANCj4gfHdpdGggSU5TQU5FX1NLSVAgPSAiMzJiaXQtdGltZSIgWzMyYml0
LXRpbWVdDQo+IHxXQVJOSU5HOiBsaWIzMi1tb3pqcy0xMjgtMTI4LjUuMi1yMCBkb19wYWNrYWdl
X3FhOiBRQSBJc3N1ZTogDQo+IHwvdXNyL2Jpbi9qczEyOCB1c2VzIDMyLWJpdCBhcGkgJ3N0YXQ2
NCcgWzMyYml0LXRpbWVdDQo+IHxXQVJOSU5HOiBsaWIzMi1tb3pqcy0xMjgtMTI4LjUuMi1yMCBk
b19wYWNrYWdlX3FhOiBRQSBJc3N1ZTogDQo+IHwvdXNyL2Jpbi9qczEyOCB1c2VzIDMyLWJpdCBh
cGkgJ2ZzdGF0NjQnIFszMmJpdC10aW1lXQ0KPiB8V0FSTklORzogbGliMzItbW96anMtMTI4LTEy
OC41LjItcjAgZG9fcGFja2FnZV9xYTogUUEgSXNzdWU6IFN1cHByZXNzIA0KPiB8d2l0aCBJTlNB
TkVfU0tJUCA9ICIzMmJpdC10aW1lIiBbMzJiaXQtdGltZV0NCj4NCj4gSXQncyBhIGZhbHNlIHBv
c2l0aXZlIHdhcm5pbmcgdGhhdCBJIGhhdmUgY2hlY2tlZCB0aGUgY29tcGlsaW5nIGxvZywNCj4g
Ii1EX1RJTUVfQklUUz02NCAtRF9GSUxFX09GRlNFVF9CSVRTPTY0IiBhcmUgcmVhbGx5IGJlaW5n
IHBhc3NlZCB0byANCj4gY29tcGlsZXINCj4NCj4gU2lnbmVkLW9mZi1ieTogTGl1IFlpZGluZyA8
bGl1eWQuZm5zdEBmdWppdHN1LmNvbT4NCj4gLS0tDQo+ICBtZXRhLW9lL3JlY2lwZXMtZXh0ZW5k
ZWQvbW96anMvbW96anMtMTI4XzEyOC41LjIuYmIgfCAxICsNCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVk
L21vempzL21vempzLTEyOF8xMjguNS4yLmJiIA0KPiBiL21ldGEtb2UvcmVjaXBlcy1leHRlbmRl
ZC9tb3pqcy9tb3pqcy0xMjhfMTI4LjUuMi5iYg0KPiBpbmRleCA0YjU2YTE3Zjg0Li40ODhiYjBl
Y2NjIDEwMDY0NA0KPiAtLS0gYS9tZXRhLW9lL3JlY2lwZXMtZXh0ZW5kZWQvbW96anMvbW96anMt
MTI4XzEyOC41LjIuYmINCj4gKysrIGIvbWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL21vempzL21v
empzLTEyOF8xMjguNS4yLmJiDQo+IEBAIC05OSw2ICs5OSw3IEBAIGRvX2luc3RhbGw6YXBwZW5k
KCkgew0KPiAgICAgIHJtIC1mICR7RH0ke2xpYmRpcn0vbGlianNfc3RhdGljLmFqcyAgfQ0KPiAg
DQo+ICtJTlNBTkVfU0tJUCA9ICIzMmJpdC10aW1lIg0KDQo+Q291bGQgeW91IHBsZWFzZSB1c2Ug
Iis9IiBpbnN0ZWFkIG9mICI9IiwgdG8gYXZvaWQgb3ZlcndyaXRpbmcgcG9zc2libGUgcHJldmlv
dXMgdmFsdWVzPw0KVGhhbmsgeW91LCByZWxlYXNlIHJlZmVyIHRvIHYyIHBhdGNoDQoNCj5BbHNv
LCB0aGUgcmVmIGRvY3Mgc2F5IHRoYXQgaXQgc2hvdWxkIGJlIHBvc3RmaXhlZCB3aXRoIHBhY2th
Z2VuYW1lIGZvciB3aGljaCB0aGUgcmVhc29uIEknbSBub3Qgc3VyZSBhYm91dC4uLiBidXQgaGF2
aW5nIGl0IHNob3VsZCBkbyBubyBoYXJtLg0KVGhhbmsgeW91LCBidXQgSSBoYXZlIHRlc3RlZCB0
aGF0IElOU0FORV9TS0lQOiR7UE59ICs9ICIzMmJpdC10aW1lIiBkb2Vzbid0IHdvcmsNCg0KU2lu
Y2UgMzJiaXQtdGltZSBJTlNBTkVfU0tJUCBvbmx5IGNhbiByZWNvZ25pemUgIklOU0FORV9TS0lQ
IiBub3QgIklOU0FORV9TS0lQOiIgYmVjYXVzZSBpbiBwb2t5L21ldGEvY2xhc3Nlcy1nbG9iYWwv
aW5zYW5lLmJiY2xhc3MNCjYwNzogICAgICAgICAgICBhbGxvd2VkID0gIjMyYml0LXRpbWUiIGlu
IChkLmdldFZhcignSU5TQU5FX1NLSVAnKSBvciAnJykuc3BsaXQoKQ0KDQpIb3dldmVyIG90aGVy
IElOU0FORV9TS0lQIGNhbiByZWNvZ25pemUgYm90aCBJTlNBTkVfU0tJUCBhbmQgSU5TQU5FX1NL
SVA6IGluIHBva3kvbWV0YS9jbGFzc2VzLWdsb2JhbC9pbnNhbmUuYmJjbGFzcw0KDQoxMTYxOiAg
ICAgICAgc2tpcCA9IHNldCgoZC5nZXRWYXIoJ0lOU0FORV9TS0lQJykgb3IgIiIpLnNwbGl0KCkg
Kw0KMTE2MjogICAgICAgICAgICAgICAgICAgKGQuZ2V0VmFyKCdJTlNBTkVfU0tJUDonICsgcGFj
a2FnZSkgb3IgIiIpLnNwbGl0KCkpDQoNCg0KDQo+U2VlIGFsc28NCj5odHRwczovL2RvY3MueW9j
dG9wcm9qZWN0Lm9yZy9yZWYtbWFudWFsL3ZhcmlhYmxlcy5odG1sI3Rlcm0tSU5TQU5FX1NLSVAN
Cg0KPiAgUEFDS0FHRV9ERUJVR19TUExJVF9TVFlMRSA9ICJkZWJ1Zy13aXRob3V0LXNyYyINCj4g
IFBBQ0tBR0VTID0rICJsaWIke0JQTn0iDQo+ICBGSUxFUzpsaWIke0JQTn0gKz0gIiR7bGliZGly
fS9saWIqIg0KPg0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiBMaW5rczogWW91IHJlY2Vp
dmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gVmlldy9SZXBseSBPbmxpbmUg
KCMxMTcwMTUpOiANCj4gaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVk
ZGVkLWRldmVsL21lc3NhZ2UvMTE3MDE1DQo+IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0
cy5vcGVuZW1iZWRkZWQub3JnL210LzExMjM4OTExNC82MDg0NDQ1DQo+IEdyb3VwIE93bmVyOiBv
cGVuZW1iZWRkZWQtZGV2ZWwrb3duZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBVbnN1YnNj
cmliZTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWRldmVs
L3Vuc3ViIA0KPiBbc2thbmRpZ3JhdW5AZ21haWwuY29tXQ0KPiAtPS09LT0tPS09LT0tPS09LT0t
PS09LQ0KPg0KDQo=


Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 786C9C02185
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 08:39:17 +0000 (UTC)
Received: from esa16.fujitsucc.c3s2.iphmx.com (esa16.fujitsucc.c3s2.iphmx.com [216.71.158.33])
 by mx.groups.io with SMTP id smtpd.web10.16587.1736930349439219459
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jan 2025 00:39:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=ubAPXvqn;
 spf=pass (domain: fujitsu.com, ip: 216.71.158.33, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1736930349; x=1768466349;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=ocaLtSuAON2kNILH0J5t+V4Huvk4PwjzjtVtNjGm854=;
  b=ubAPXvqnapafVNN8NyqN0mNF/JqZWzxsA6vZrHj5oZrB5sgXe5gpXJAE
   cbDrWMRjMd0rro3nwaFuH3rLNjerLjCxV/jroGuQZGXYJYe4W3dUD5Mba
   W9XQdphLmx1D/doVULq5v1LCVPDpe2kYrDG0cALroQrLKVPn9QXTRUxEp
   gJ0Hr0+z2yXazq5dZArvwjJNUJdAMJuhXkgjeZZF+JbWO+mCh0tVKGKeW
   H253K2azgg40TLmoXTxBgcxzZxM0dHnX5Go3LQIIc6FIgMbl/V4Q4OjIQ
   tOD9ErskVTO5jvuvw/chr70lgGV0zt0n5pGm20xVi/NlCV8cwiPmrQUro
   w==;
X-CSE-ConnectionGUID: XuPoBiS+QP+spXUzNwmyUg==
X-CSE-MsgGUID: /GBV0B3xTlSWnKSyK3+icw==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="142919580"
X-IronPort-AV: E=Sophos;i="6.12,316,1728918000"; 
   d="scan'208";a="142919580"
Received: from mail-japanwestazlp17011031.outbound.protection.outlook.com (HELO OS0P286CU010.outbound.protection.outlook.com) ([40.93.130.31])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 17:39:06 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L3u0Q9ILnauqGlnGcq8f3uYFxLdc9T9dxSmUnr/9AmhXEYynDeKk54KDbgqC6IsTTEJnQ3NrTSCWEFq0yqHHf+TKG7vo/67vQtZtnFcyvE1+I2W+SFxGAjl5qF9j8DU3p7GVOR2WFOBTHbVBwwds2a8Wzn0iezvjlkpvNz0sEn9lpLjTpRMSHLuFVFBzo5opRhG5cw/VirUQUXbh7d8vOqMxS/a8GfwtjPWLsglNKwqD8IALc6l0NWfywE6CsI0k4v4fBAapqXRwifReSg5EVXjUtJuThtfZCGbU4++o6WgtxVkt2eRR4HxsKbu6+crhLghVuC69T4mhhkwlnib34A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ocaLtSuAON2kNILH0J5t+V4Huvk4PwjzjtVtNjGm854=;
 b=s8VdwzPssTnS5kkW4GVs/GI2uIFoTK1TpxYBaxpRbXZnxNV7FphBirl64v8OP5imSctCSyfC6hzhZbbfVN9DUJ4FF3GoeB+5km0Qs/KmqUzP7VoSK1tfOWN/2jtHsQcl+VJ3jIFeax+AkrCCf4mipTry2ZizPGKK2PW1NF+OTw8ObNFgh8lpBJVPhdAqnclOs3YNZRpsG+Y21ZZPEhv3xstwhm0zDqdAGRqfZOtyktFyo54LRdSBkiONRmzgbBky8FQAS2M17Ls2wMMTCbbUU7pBGMo4yS7jKKFHycSO8iBiOyJrZpjESyVev0F0WgY5EdzyUv+gm8Pxt23smtHbiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 (2603:1096:400:3fb::13) by OSCPR01MB13631.jpnprd01.prod.outlook.com
 (2603:1096:604:380::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Wed, 15 Jan
 2025 08:39:03 +0000
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e0dd:28e5:6a6e:2342]) by TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e0dd:28e5:6a6e:2342%6]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 08:39:03 +0000
From: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
To: "Qi.Chen@windriver.com" <Qi.Chen@windriver.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe] [PATCH] mariadb: Enable network during do_compile
Thread-Topic: [oe] [meta-oe] [PATCH] mariadb: Enable network during do_compile
Thread-Index: AQHbZYTRuZA0RPztTUWnE4i0KTk24rMXQcuAgAA2PjCAAAJGAIAADB5g
Date: Wed, 15 Jan 2025 08:39:03 +0000
Message-ID: 
 <TYWPR01MB118611C24755CA1AA11BC1EF2DC192@TYWPR01MB11861.jpnprd01.prod.outlook.com>
References: <1736749897-27279-1-git-send-email-wangmy@fujitsu.com>
 <5540bea7-e33a-4e2a-9429-71323d819deb@windriver.com>
 <TYWPR01MB11861397A8D3E76C13151E6E6DC192@TYWPR01MB11861.jpnprd01.prod.outlook.com>
 <c1075931-f51c-432b-be74-87689bace753@windriver.com>
In-Reply-To: <c1075931-f51c-432b-be74-87689bace753@windriver.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5Njgw?=
 =?utf-8?B?MmZfQWN0aW9uSWQ9YzE2MmE1NzctODNlMy00YmI5LTlkMjEtZGQwYTEyMjc0?=
 =?utf-8?B?YzZiO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMz?=
 =?utf-8?B?OTY4MDJmX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQx?=
 =?utf-8?B?LTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX01ldGhv?=
 =?utf-8?B?ZD1Qcml2aWxlZ2VkO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFk?=
 =?utf-8?B?NTUtNDZkZTMzOTY4MDJmX05hbWU9RlVKSVRTVS1QVUJMSUPigIs7TVNJUF9M?=
 =?utf-8?B?YWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfU2V0?=
 =?utf-8?B?RGF0ZT0yMDI1LTAxLTE1VDA4OjM3OjQyWjtNU0lQX0xhYmVsXzFlOTJlZjcz?=
 =?utf-8?B?LTBhZDEtNDBjNS1hZDU1LTQ2ZGUzMzk2ODAyZl9TaXRlSWQ9YTE5ZjEyMWQt?=
 =?utf-8?Q?81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB11861:EE_|OSCPR01MB13631:EE_
x-ms-office365-filtering-correlation-id: f1893e96-9021-4407-4f71-08dd354010cd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018|1580799027;
x-microsoft-antispam-message-info: 
 =?utf-8?B?MndqcG5PUk1KMDMvTk04aURQTjRSS1Y5amM0OXBMVlpDUEYyRTRWMWtuWUFv?=
 =?utf-8?B?VHdKVjYrWnpFSG9UejYwZVIzVTdLc2w0aXMwbnJlamttYkY1dDJFSDBvYXFm?=
 =?utf-8?B?ek9OZDRCYU1wZUNoWmlqc2E5YWJFUm56aWVMY2huOUFKOGlxaVpLUFpTVldU?=
 =?utf-8?B?ZmJxMjNRRWJCeU9QeHIxZ0pJSzhNSWFkZlZvMmJMcWpmeVZLbG9QRzk5a09V?=
 =?utf-8?B?SmxMU1JmV0ZKaFFhSTFYR0tSK09NdlJQeVZOSFY2a25KdXhwZ0k4WGZ5ZVA2?=
 =?utf-8?B?Q2dMa1JvdlQxYmdQM3JaSDRmN2JlRkxPMWFJK2Uxa1doMFYrckhvZThaZzBY?=
 =?utf-8?B?YVZwMzNZVExSbkMwY292WlVqWHhNL3g5a1NSSGUxK3NkOTlZblRMc2l0dDNO?=
 =?utf-8?B?alBMak1GNnc2OGV1ZXFzQlJYZ3YwMmtDZTZUQUFENzBia1lpQzk3OXpJaFRD?=
 =?utf-8?B?Z3c1ZXgyOTRrbmFTcFMxNHdsMEs5TjI0VWJ3b0xzVFJOb2phanJSaXVBLzVD?=
 =?utf-8?B?NWJiclljZlMvZzZmTjZzQlM5N1YvQmpXelZidm15U251Nm0wYTZlbmNVTE1U?=
 =?utf-8?B?ejZTL2YzVkRPb0JGeVg0ejNQYjcveC9RbDJVOFV3NDFvejV4NW9QM0dvL2Z2?=
 =?utf-8?B?ZGI0OTg2MjlPNjRjL2huczRjSVlXZkIwdGk0SEp4czFPU1FLVUZ2dlJSVmZh?=
 =?utf-8?B?WFUycE5UME13bXpwcHNLakpYSTlNOWFtcFMxa1ZrUjVUVnJreTZtTkpYeFZU?=
 =?utf-8?B?M0FHdUc4cFBQME01ajhMVFZ0ZE0ySzczdHZHYVRHT2ZDYXNVUWFraW1YeTEw?=
 =?utf-8?B?STBnTlNlZis2T2psNnpoRzlJZ2NlTXhSR014OW5ScmdkOHA1Q3dCUmRXSUFV?=
 =?utf-8?B?ZWU4a3kwODVJaGp6b3BvVlRDUGd4ZlN5NHJ2bXVHSHRIVXRnSThrVXpIajV6?=
 =?utf-8?B?WEpsSzBwbk04aHJrL1RidmZRSW11UTJNRlpwREszOE1KUEFKUlhDQkpXNHJs?=
 =?utf-8?B?MU5FT0sxK1VWZ0c5VXlqLzNpc3NjRVByb1c1NEh2NlFxOTJYdXcrVW1rVnhF?=
 =?utf-8?B?L1dXTFNMQlBoUnZBZ1dEek5EVXc0S1JIQklSOWZ5WkZGdHQxcHlVcWNLS1lF?=
 =?utf-8?B?L3V6ejluQ3FvU0FnYlVCaTMvd3Z2RlBqalNhNzZXN0FJc1I0eENEVHlBVVR5?=
 =?utf-8?B?MVMvU2VxTDNYdlJ1VlBOZlhuZm5PU01vbGF5eWxWK1RicmNGWDdBUVg0bjYz?=
 =?utf-8?B?aXdrcTdhaE84ZU9IU0g5U2NVOWJGSEVtQ0ovM2lZT3V3RnJaeHY5TnVHcXBk?=
 =?utf-8?B?SlJJd3g1Vks1d2JRWFUyOFc3V2lSbVBwMmNyZkQwNVl4U3Rhb3hTaHlNQWx2?=
 =?utf-8?B?OGlVd2lvcEg3RDVIWDY2UUZBb1BGM0FJdHp6Qm1zWElqclBJanVWMUhJVlVp?=
 =?utf-8?B?aDVYZENJeGQrSkJoWWNUSzNMdCtTMWVRM3kyVG43elpPcjloejZGcUN1aFcv?=
 =?utf-8?B?TmxtQms2alRyQ2VxZmJib1FFVXhPWnhEdHRUM2RnQWdyMUVCNzVoSFUxOWNR?=
 =?utf-8?B?NUdPQU1qM2VYdy83Z2V5TllKcy9HRzBFSWNVUW53N1phOGtIWVBuNzdiWFk2?=
 =?utf-8?B?YXlydnQ1Rmc0UmdLOHhzR2d1YzRBdDA2VG0xaGptL1gyMmJmNGN1NjJSM1hV?=
 =?utf-8?B?YWgyUWhZMWFFVHZTVkFQM1A0djNKNUNmb3NIdlcxRGE0cmlpcEJ4c0dFQ0oy?=
 =?utf-8?B?dGxIS0YrRDk0bDhqcm1tSHJEaWlyYUc2SStMeTFJSVZkeUFJR3duaUxTMWxu?=
 =?utf-8?B?a0VlbWFRZXNPNVJGYWtlQWxmSTVYTGYrYm1wbUV4TWtXZWJaZk9wbjJLNnli?=
 =?utf-8?B?TFNGcFI1Y09PNmp5bDZJcjlrSzdNMi9iazc2enJMaGRmMUt4MmZ1eW42cklv?=
 =?utf-8?Q?WdzxBcOcPVA=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB11861.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?aXh0Z3ZVbGducXkrb2k4eC9LQXRvTnpTYVgvYU45UFd6ZTdXR1lTc2NUY29h?=
 =?utf-8?B?UElEa3haZEtWSXdHZnEzWERmT25vYXA0OGFCd1lQVmpWT1lNbWk5M002OXVL?=
 =?utf-8?B?TktlM3JFOGZBaGxxZG9nNHNLcW96MktYMDREZ3ZGa0U4bnFJTDA1MDZCbmdx?=
 =?utf-8?B?MGxRZ2N6ejRCaU54cVFaa2JMa2RDVGdDYUxqZHU2dVR6Nk11VGpNLy9VbnhD?=
 =?utf-8?B?UldRK3FpVWkvMHcrUVhJTXFiYS90V0V0Rm0yTmhXZHJIZ283MTFHdWo3cVp4?=
 =?utf-8?B?SUU2VWZCbDNNZ0pKYlJKT1dFakk4QUI3amtGS2VweENiVmlsNzVwaGdKQVZD?=
 =?utf-8?B?T3BWRGdoNEE2N0hiTXhxcHN3VjhrRVBJY243dUtSd0VpTXpDM1BqNDM1elVD?=
 =?utf-8?B?QnJONzFxNllaY2JHOENFZG13MUhwY1NqTnRkZjY4OHhjMlZxSzNMQkt6UHZm?=
 =?utf-8?B?bGFnb3RHSGVWT1l0OTJocytGMlh1WUlwWGpWSm50RTVPUnVJQmkvWTVXaGpz?=
 =?utf-8?B?U1c3Uk9xelBsRzlYWEV5MGdhdGN6akVYWWFIb1VzN0lzNHcwdXJJaWxJWm0w?=
 =?utf-8?B?OFU0VDUvdHBxOFdFcHVTc0l0QjE4cWkrcmx0cm0xT1FuZWFNQVlGRXdNVzZo?=
 =?utf-8?B?aUZNWVlTLzVDZHNRQnRMRDhWSnB1Tmg5ODcyYTNvbnVXcnBQYkhXcUpiaHFl?=
 =?utf-8?B?aGlXT0E0K0FhQ0VocEtGbDNSMUpTWnpiL3EzVkI3cEl5a2FGZDRIbThLT3FZ?=
 =?utf-8?B?QUtTVVg2NjJyZFZWeTMvQTVJTU1uSlZBczM2KzVkUHY5ODR3bGp3WDNkcC8z?=
 =?utf-8?B?Z3JGUno3WTJuTXZ4aW1nd0dVVk1CaGVDZDY4UXNETGxIQkV5N21uazd3NjZB?=
 =?utf-8?B?U0xyZE9UaEJ4MEJkaXdBaE9lOEVJWFc3cGFlOGxqTnhOU2RRN3hSTTdSeGNi?=
 =?utf-8?B?aXN6cUZqVThJL0R2a2lJUFZkUU5GRFNzWFNZS0QyVThoZzVPcGd5b1VidFBX?=
 =?utf-8?B?SnpPZ05JMlplK21aak8zVzM2Q1N2WVkveGRWT1grbHR1TWFsN0N6dUt6UHJi?=
 =?utf-8?B?Uk9VNHRaNHJ1dG44M3RNRGl0dTJrSWdpZmxOTTExbWpZb0toQmFNUWY5bUtT?=
 =?utf-8?B?SzNEZ3VQNnBaM1U0VWp1SjZhYmJpeXQ3ZE12UW95NHNuRWZrbkF1VzNkMTB4?=
 =?utf-8?B?TzBJUnhzMEpiVXN2ZlF2Q1RZVWhlUUF4c0RTdm11S3FENEl3ZExtM3RTQnov?=
 =?utf-8?B?VUJlbXArKzNPYXpTR3dhSWYxUnlxZDdXOW5jOGJkZUZMODh4V2tTNXQ3R3h6?=
 =?utf-8?B?c0tQVzdoZ2Q1RFU4Q0psSzN3MURicWE1SW1lSjVCWTlkTnI1YmhTSGx2Q3hP?=
 =?utf-8?B?MmpOMFRROCtSb1VMSkExNTZUU2ovRFVzQTF3RUx6UnFMODFqWFg0U2ZUa0U5?=
 =?utf-8?B?cWxtSFgxdFo1enF6ZkpWVm5BcnZRODhUK3lJMFlsSnVvZzFjVHFSNzNzNFdJ?=
 =?utf-8?B?bjk4ZEhhS09FZWpuQVRyOWRQVENvWEI3OUl2N21PUFU1aDlENGVHeTQ0dXBh?=
 =?utf-8?B?cWRERVdJVGthTUl0NkVNVHdSa0JoeWlJYUlVbU1UUmJqUVdOQ2haWnNtSWRJ?=
 =?utf-8?B?Yk1HbWJ0aGpDTHV5eUVCNzk2S3FHNUhSajBJcFRqMC8rVEFkaHlzMEJhY2w3?=
 =?utf-8?B?bkptU25DMS9xYXQ1UUdKZUZIOGs5UXRpL2UrZUpSemxsWFBGZkp6Uko2bzNM?=
 =?utf-8?B?YkpGY2xrT1phZmRNcUQvWVJETGRvNjhkUlZKWkxML2RKQ3pUWmk0UUYwRmVq?=
 =?utf-8?B?V2ZUM2lIMG9laEV4UUdjYVY5d21kMmJQblM5b0UyT2JraU9QSy9QK3JLRSt2?=
 =?utf-8?B?bEcyS29hUm1CMDFXZGFPWXdzL1VsOEN5ZXdOUmpBUWxSUjQzNUZ0RjhDL3Iy?=
 =?utf-8?B?L2pqcDNrTVRkaXZ0TktBZkxxYlhsTStwc2Z2aU1hVXRvQ2JJdmNkZE5NbFI5?=
 =?utf-8?B?NmEvWjAvdjdRbm52MWV2RDdDRjQ4Qmo1emUvQThHRStYUU1RYTJ4SEJDb2NH?=
 =?utf-8?B?ME1uK011YlJ1d0dqS3NDMFloelJQOFQ3dTRJL0hOMUdBL1BpUmIvczZvMEJv?=
 =?utf-8?Q?gbRRVQKLqjpkrf/D1YAV+ja2m?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	bxwi2IQP6XGP85VuWNDD23SJMWPqURTLPTLNcSO/lCo51lGPY13FEDwcTBrepzl5P8nItCFoxk1SOgjNlIlPqJbU6RtRvqRqzBwPZ7P0wDHz7Pby9hbRNliYE20150VfrzwOoA4G8ehywKpXVXpYfx3JEAj8EIxaKNT3w3aImqXdqObzoIgd0NB1IA58BaHDqXSS7udfBhhRx5mhHs/cN4lzqsixNSxYTbYjwaxIWwpsh3Nd3/nu5PgBBG+gbLbZeSvNfqVFcAx0oujhfGaXXXFgCQpOL/FbUpAz4npTdgQGq9arERUtUPoJX45R8sgRwp7y9o2JsVc8tbLA3TeCQnSB7vKSoDPfst2luJ1QlCZllz8ISWWB0XKzqjKIXAhpR6sWbjxkF/Bx/lu0+dOTcXh81He7kwQ/0wyRK3YOsiqbQqbW7l2UVGLdEEP15QYUf929WbH5yGL8h5nPHwyID5RUyRJPoFTbcOPG9HH6YdzIIBbEpgdxcqsv3YXgRyU/S8nb5bA0zpxRfNjOOCMAuKdNeDCpaefTLMtgrZZhIRODn7xJ8N7b4qaHEci0E10+/COqSR3r/8Wv4PAw29L+1PWVp7YrBXLkUsFzHCGJMcuFdmlDJkdXqVeNXfdsN6KL
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11861.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1893e96-9021-4407-4f71-08dd354010cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2025 08:39:03.2348
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HQDL9wL4OUz1Hp/G59N2++znvC+Z+Rs5ELleoJz0GQ+MhCU2mD2HQQDyxXZUVhXOdbDQ0V3P764jezyv43ap9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13631
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jan 2025 08:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114895

SSBnb3QgaXQsIHRoYW5rIHlvdSBmb3Igc2hhcmluZyB0aGlzIGluZm9ybWF0aW9uLg0KSWYgdXBn
cmFkZSBmb3IgbWFyaWFkYiBpcyBtZXJnZWQsIEknbGwgdHJ5IGl0IGFnYWluLg0KDQogIC0tDQpC
ZXN0IFJlZ2FyZHMNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQ0KV2FuZyBNaW5neXUNCkZVSklUU1UgTkFOSklORyBTT0ZUV0FSRSBURUNITk9MT0dZ
IENPLiwgTFRELiAoRk5TVCkNCk5vLjYgV2Vuemh1IFJvYWQsIE5hbmppbmcsIDIxMDAxMiwgQ2hp
bmENClRFTO+8mis4NisyNS04NjYzMDU2Ni0tODU2OA0KQ09JTlM6IDc5OTg4NTQ4DQpGQVg6ICs4
NisyNS04MzMxNzY4NQ0KTUFJTDogd2FuZ215QGZ1aml0c3UuY29tDQoNCj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcNCj4gPG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiBP
biBCZWhhbGYgT2YgQ2hlbiBRaSB2aWENCj4gbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTZW50
OiBXZWRuZXNkYXksIEphbnVhcnkgMTUsIDIwMjUgMzo1NCBQTQ0KPiBUbzogV2FuZywgTWluZ3l1
L+eOiyDpuKPnkZwgPHdhbmdteUBmdWppdHN1LmNvbT47DQo+IG9wZW5lbWJlZGRlZC1kZXZlbEBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbb2VdIFttZXRhLW9lXSBbUEFU
Q0hdIG1hcmlhZGI6IEVuYWJsZSBuZXR3b3JrIGR1cmluZyBkb19jb21waWxlDQo+IA0KPiBPbiAx
LzE1LzI1IDE1OjQ2LCBNaW5neXUgV2FuZyAoRnVqaXRzdSkgd3JvdGU6DQo+ID4gSSBzZWFyY2hl
ZCBhbmQgZm91bmQgdGhhdCB0aGlzIHNldHRpbmcgaXMgYWxzbyB1c2VkIGluIG90aGVyIGJiIGZp
bGVzLg0KPiA+IE1heSBJIGFzayBpZiB0aGlzIHNldHRpbmcgaXMgbm90IHJlY29tbWVuZGVkIGFu
ZCBpZiB0aGVyZSBhcmUgYW55IGRyYXdiYWNrcz8NCj4gDQo+IFRoZSBuZXR3b3JrIGZsYWcgc2hv
dWxkIG9ubHkgc2V0IGZvciB0YXNrcyB0aGF0IHJlYWxseSBuZWVkIG5ldHdvcmssIGUuZy4sDQo+
IGRvX2ZldGNoLiBPdGhlcndpc2UswqAgdGhlIHRhc2ssIGRvX2NvbXBpbGUgZm9yIGV4YW1wbGUs
IGNvdWxkIHBvc3NpYmx5DQo+IGRvd25sb2FkIHRoaW5ncyBmcm9tIG5ldHdvcmsgd2l0aG91dCBh
bnkgdmVyaWZpY2F0aW9uLiBUaGlzIHdpbGwgY2F1c2UgcHJvYmxlbXMNCj4gcmVsYXRlZCB0byBk
ZXRlcm1pbmlzbSwgc2VjdXJpdHksIGxpY2Vuc2UsIGV0Yy4NCj4gDQo+IEFueXdheSwgSSBqdXN0
IG5vdGljZWQgdGhhdCBLaGVtIGhhZCBhbHJlYWR5IHNlbnQgb3V0IGFuIHVwZ3JhZGUgZm9yIG1h
cmlhZGIuDQo+IEFuZCB0aGF0IHZlcnNpb24gY2hhbmdlcyB0aGUgd2F5IG1hcmlhZGIgY2hlY2tz
IGZvciBsaWJmbXQgY29tcGF0aWJpbGl0eSwgc28NCj4gY2hhbmNlcyBhcmUgdGhhdCB5b3VyIHBh
dGNoIGlzIG5vdCBuZWVkZWQuDQo+IA0KPiBSZWdhcmRzLA0KPiBRaQ0KPiANCj4gPg0KPiA+ICAg
IC0tDQo+ID4gQmVzdCBSZWdhcmRzDQo+ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gV2FuZyBNaW5neXUNCj4gPiBGVUpJVFNVIE5BTkpJ
TkcgU09GVFdBUkUgVEVDSE5PTE9HWSBDTy4sIExURC4gKEZOU1QpDQo+ID4gTm8uNiBXZW56aHUg
Um9hZCwgTmFuamluZywgMjEwMDEyLCBDaGluYQ0KPiA+IFRFTO+8mis4NisyNS04NjYzMDU2Ni0t
ODU2OA0KPiA+IENPSU5TOiA3OTk4ODU0OA0KPiA+IEZBWDogKzg2KzI1LTgzMzE3Njg1DQo+ID4g
TUFJTDogd2FuZ215QGZ1aml0c3UuY29tDQo+ID4NCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4gPj4gRnJvbTogQ2hlblFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+DQo+ID4+IFNl
bnQ6IFdlZG5lc2RheSwgSmFudWFyeSAxNSwgMjAyNSAxMjozMiBQTQ0KPiA+PiBUbzogV2FuZywg
TWluZ3l1L+eOiyDpuKPnkZwgPHdhbmdteUBmdWppdHN1LmNvbT47DQo+ID4+IG9wZW5lbWJlZGRl
ZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4+IFN1YmplY3Q6IFJlOiBbb2VdIFtt
ZXRhLW9lXSBbUEFUQ0hdIG1hcmlhZGI6IEVuYWJsZSBuZXR3b3JrIGR1cmluZw0KPiA+PiBkb19j
b21waWxlDQo+ID4+DQo+ID4+IENhbiB3ZSBhdm9pZCBkb2luZyB0aGlzIGFuZCB1c2Ugc29tZSBv
dGhlciBzb2x1dGlvbj8NCj4gPj4gZS5nLiwNCj4gPj4gQWRkIGJhY2sgYSBmbXQgMTEuMCByZWNp
cGUgd2l0aCBhIGRpZmZlcmVudCByZWNpcGUgbmFtZSBvciBhZGQgdGhpcw0KPiA+PiBmbXQgdGFy
YmFsbCBpbiBTUkNfVVJJIGFuZCBjaGFuZ2Ugc29tZSBjbWFrZSBjb25maWdzIGlmIG5lZWRlZC4N
Cj4gPj4NCj4gPj4gUmVnYXJkcywNCj4gPj4gUWkNCj4gPj4NCj4gPj4gT24gMS8xMy8yNSAxNDoz
MSwgd2FuZ215IHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIHdyb3RlOg0KPiA+Pj4gRnJvbTog
V2FuZyBNaW5neXUgPHdhbmdteUBmdWppdHN1LmNvbT4NCj4gPj4+DQo+ID4+PiBmaXggdGhlIGVy
cm9yIHdoZW4gZG9fY29tcGlsZToNCj4gPj4+IENNYWtlIEVycm9yIGF0IGxpYmZtdC1zdGFtcC9k
b3dubG9hZC1saWJmbXQuY21ha2U6MTYzIChtZXNzYWdlKToNCj4gPj4+ICAgICBFYWNoIGRvd25s
b2FkIGZhaWxlZCENCj4gPj4+DQo+ID4+PiAgICAgICBlcnJvcjogZG93bmxvYWRpbmcNCj4gPj4g
J2h0dHBzOi8vZ2l0aHViLmNvbS9mbXRsaWIvZm10L3JlbGVhc2VzL2Rvd25sb2FkLzExLjAuMS9m
bXQtMTEuMC4xLnppDQo+ID4+IHAnIGZhaWxlZA0KPiA+Pj4gICAgICAgICAgICAgc3RhdHVzX2Nv
ZGU6IDYNCj4gPj4+ICAgICAgICAgICAgIHN0YXR1c19zdHJpbmc6ICJDb3VsZCBub3QgcmVzb2x2
ZSBob3N0bmFtZSINCj4gPj4+ICAgICAgICAgICAgIGxvZzoNCj4gPj4+ICAgICAgICAgICAgIC0t
LSBMT0cgQkVHSU4gLS0tDQo+ID4+PiAgICAgICAgICAgICB0aW1lb3V0IG9uIG5hbWUgbG9va3Vw
IGlzIG5vdCBzdXBwb3J0ZWQNCj4gPj4+DQo+ID4+PiAgICAgZ2V0YWRkcmluZm8oMykgZmFpbGVk
IGZvciBnaXRodWIuY29tOjQ0Mw0KPiA+Pj4NCj4gPj4+ICAgICBDb3VsZCBub3QgcmVzb2x2ZSBo
b3N0OiBnaXRodWIuY29tDQo+ID4+Pg0KPiA+Pj4gICAgIGNsb3NpbmcgY29ubmVjdGlvbiAjMA0K
PiA+Pj4NCj4gPj4+IFNpZ25lZC1vZmYtYnk6IFdhbmcgTWluZ3l1IDx3YW5nbXlAZnVqaXRzdS5j
b20+DQo+ID4+PiAtLS0NCj4gPj4+ICAgIG1ldGEtb2UvcmVjaXBlcy1kYnMvbXlzcWwvbWFyaWFk
Yi5pbmMgfCAzICsrKw0KPiA+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQ0K
PiA+Pj4NCj4gPj4+IGRpZmYgLS1naXQgYS9tZXRhLW9lL3JlY2lwZXMtZGJzL215c3FsL21hcmlh
ZGIuaW5jDQo+ID4+PiBiL21ldGEtb2UvcmVjaXBlcy1kYnMvbXlzcWwvbWFyaWFkYi5pbmMNCj4g
Pj4+IGluZGV4IGQzMTkyY2M1OWMuLjk4MmM4MmNkNTkgMTAwNjQ0DQo+ID4+PiAtLS0gYS9tZXRh
LW9lL3JlY2lwZXMtZGJzL215c3FsL21hcmlhZGIuaW5jDQo+ID4+PiArKysgYi9tZXRhLW9lL3Jl
Y2lwZXMtZGJzL215c3FsL21hcmlhZGIuaW5jDQo+ID4+PiBAQCAtMzEsNiArMzEsOSBAQCBTUkNf
VVJJW3NoYTI1NnN1bV0gPQ0KPiA+Pj4gIjBhMDAxODA4NjRjZDAxNjE4N2M5ODZmYWFiODAxMGRl
MjNhMTE3YjlhNzVmOTFkNjQ1NjQyMWY4OTQNCj4gPj4+DQo+ID4+PiAgICBVUFNUUkVBTV9DSEVD
S19VUkkgPSAiaHR0cHM6Ly9naXRodWIuY29tL01hcmlhREIvc2VydmVyL3RhZ3MiDQo+ID4+Pg0K
PiA+Pj4gKyMgbmV0d29yayBpcyByZXF1aXJlZCBieSBnbyB0byBnZXQgZGVwZW5kZW50IHBhY2th
Z2VzDQo+ID4+PiArZG9fY29tcGlsZVtuZXR3b3JrXSA9ICIxIg0KPiA+Pj4gKw0KPiA+Pj4gICAg
QklOQ09ORklHX0dMT0IgPSAibXlzcWxfY29uZmlnIg0KPiA+Pj4NCj4gPj4+ICAgIGluaGVyaXQg
Y21ha2UgZ2V0dGV4dCBiaW5jb25maWcgdXBkYXRlLXJjLmQgc3lzdGVtZA0KPiA+Pj4gbXVsdGls
aWJfc2NyaXB0IG11bHRpbGliX2hlYWRlciBwa2djb25maWcNCj4gPj4+DQo+ID4+Pg0KPiA+Pj4N
Cg0K


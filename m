Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 117E2C02182
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 01:32:57 +0000 (UTC)
Received: from esa2.fujitsucc.c3s2.iphmx.com (esa2.fujitsucc.c3s2.iphmx.com [68.232.152.246])
 by mx.groups.io with SMTP id smtpd.web11.32725.1737509574545100905
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Jan 2025 17:32:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=CdPnjczB;
 spf=pass (domain: fujitsu.com, ip: 68.232.152.246, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1737509575; x=1769045575;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=2BE4pk4fNvcA+78r0LAoMrXEPAKlyoPJfcIfIKpW0jQ=;
  b=CdPnjczBszASdNVuj70DPUIpXmPlVr4PYey0arPGXhO4aeEDrB4EDfMK
   YBJrID6mQ2wtIx9o4kXuTk3q8jJE8D0C7bST+U/8shn4yjC04vbTX+8VV
   C/Ktm9nD3VL65ZClEpxXNAB9BxUZHn+NhYdv0BodTo2iqdIPdqHGTmb3z
   sRnGFEEIz72W3TTBmuRYtWKZhDlfPOHx+lVUmq3gti1pwex9KeLlSuUyN
   mbBRTFf0d9YDTHWdYKo/L4pEeC5XL5Boyqq5joq7cAfPORyPTDSf3IFII
   V/+30toFmI9B2OVLz2wF9fbG5qvbZj1aUbKXpVAKsiLwxBszM20T5cYPz
   Q==;
X-CSE-ConnectionGUID: FNot5mreSM2a8Wo+CxMaow==
X-CSE-MsgGUID: v7inZsboQZ29zmWm1X910A==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="54674016"
X-IronPort-AV: E=Sophos;i="6.13,223,1732546800"; 
   d="scan'208";a="54674016"
Received: from mail-japaneastazlp17011024.outbound.protection.outlook.com (HELO TYVP286CU001.outbound.protection.outlook.com) ([40.93.73.24])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 10:32:51 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EPtJjAG0an4niFMqxh85QDjdl/Y1C9quj1IyODk1f80mrx8eDJABy5FJs6/b9Gr0yOyMc4uZUZh/hWow79nDR2iiu1N2FoZxPlEaenOLPeKChs+NiaTzPpEjOWz5L67lPMw26C6hx/I7UKeYi526UthggzlM25w/5j36YbW2ZqrL1j9xUIq4e4l/PMDrOATxmhoXxe2o7oDJdddSZ+1AmfD2jcZNGZtJsyXqh3AiBJMYHW2tX9s4GO+zknw068wWa9SoYiF7qUMyC/zJt+R4+6Sqq1zCszC1+4Ztov6TAECbzAgzJGLHDNW7zC/8tEekC53tmn+d+OvE0CC+PqKuGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2BE4pk4fNvcA+78r0LAoMrXEPAKlyoPJfcIfIKpW0jQ=;
 b=nX38S4YvzPTKIMqIyngB3N/SlJogSgn/5+AMzUyw0udteFyECeY9SYrLtCui+EO+3iLQPA3n71DGt/GQ/Jcy3o5KoldKjq4tqvwM9G5LUbGQiFcMrpd1ROth1W197Gauc7p4qIv4LHr/UXChANVcFlhZfm51ijIR4Sz6DzfPUxQMMRyqyWJp8hd+7yfxpKkdXwBf9SthjWlBtOkuwjuQFmRGCo+cqll4a3qhIQC+B1bs8VQKIP3YlrzdtD9aX+DLMLEwXsbMWDM3pjC1cfMquvjEthHUsw+bOqjiKHF1hpUWi85z5PYQRtbuQCTULDB3UTWyu1xSXeAvAf3XiC5d6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 (2603:1096:400:3fb::13) by TYCPR01MB5773.jpnprd01.prod.outlook.com
 (2603:1096:400:45::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Wed, 22 Jan
 2025 01:32:48 +0000
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e0dd:28e5:6a6e:2342]) by TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e0dd:28e5:6a6e:2342%6]) with mapi id 15.20.8356.017; Wed, 22 Jan 2025
 01:32:48 +0000
From: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
To: =?utf-8?B?SsO2cmcgU29tbWVy?= <joerg.sommer@navimatix.de>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe] [PATCH] smarty: update 4.5.5 -> 5.4.2
Thread-Topic: [oe] [meta-oe] [PATCH] smarty: update 4.5.5 -> 5.4.2
Thread-Index: 
 AQHbZv4hy7RzW3j4yk+mlh298M6m7bMXWYMAgAAsgFCAABHngIAA9ufAgACbXoCACOCYAA==
Date: Wed, 22 Jan 2025 01:32:48 +0000
Message-ID: 
 <TYWPR01MB11861343EC1A56A9F9ED23550DCE12@TYWPR01MB11861.jpnprd01.prod.outlook.com>
References: <1736911952-10934-1-git-send-email-wangmy@fujitsu.com>
 <r3pwhezfvqmgh43ejzkjroffsmdoupemdh3q4v6hplgk3zregq@tni3w2fjzwaf>
 <TYWPR01MB11861B18EC4AD9079FF4602B0DC192@TYWPR01MB11861.jpnprd01.prod.outlook.com>
 <p675m3ebzd6qsu6x4kcbbowcg5ejb6bi3mlwjvlehxffklqvbo@muqhgasjljh6>
 <TYWPR01MB118617DA97D501BE821574B74DC1A2@TYWPR01MB11861.jpnprd01.prod.outlook.com>
 <qrmcdaufwt4l4rhfn72tymtzkj7ffszxwfegedgiuwfebq7735@v4gq5t4gz2vy>
In-Reply-To: <qrmcdaufwt4l4rhfn72tymtzkj7ffszxwfegedgiuwfebq7735@v4gq5t4gz2vy>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5Njgw?=
 =?utf-8?B?MmZfQWN0aW9uSWQ9MWI5MjA2ZGYtYTE5OC00NDE0LWI2YTctOGU4MmE2NmFk?=
 =?utf-8?B?YjU2O01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMz?=
 =?utf-8?B?OTY4MDJmX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQx?=
 =?utf-8?B?LTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX01ldGhv?=
 =?utf-8?B?ZD1Qcml2aWxlZ2VkO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFk?=
 =?utf-8?B?NTUtNDZkZTMzOTY4MDJmX05hbWU9RlVKSVRTVS1QVUJMSUPigIs7TVNJUF9M?=
 =?utf-8?B?YWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfU2V0?=
 =?utf-8?B?RGF0ZT0yMDI1LTAxLTIyVDAxOjI0OjM2WjtNU0lQX0xhYmVsXzFlOTJlZjcz?=
 =?utf-8?B?LTBhZDEtNDBjNS1hZDU1LTQ2ZGUzMzk2ODAyZl9TaXRlSWQ9YTE5ZjEyMWQt?=
 =?utf-8?Q?81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB11861:EE_|TYCPR01MB5773:EE_
x-ms-office365-filtering-correlation-id: 4727dfa5-8fb3-49b4-7fb2-08dd3a84ae2f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018|1580799027;
x-microsoft-antispam-message-info: 
 =?utf-8?B?OHFkZnRMRm5PcEJha0RCaWg0NEVxZXgzb25pTVFnWDNsWFl6RHFlbWhId0or?=
 =?utf-8?B?Uk8yM3pKRUwvRFVKbGdWeWUwWUxuTXJFNGc3aWlWNUoxSjNNM3ZsNTAzUFp4?=
 =?utf-8?B?dnhnNFRUeFc5QVI2NE9LQXZjZDVqV3NRT0xxaWdxQWdSNEpJSjlRRUFEUTdW?=
 =?utf-8?B?QWFPbUVoYUd5clBTTGRoUU01R0tnaSt3cWsxOXZOQ1puOEhnaExaT09DQll0?=
 =?utf-8?B?Z2Uvb2RvZitvREV0VWM3VitnYUFVdS90WGQ3Yk1ZcWJwaDdWc3JJZlpJaGxk?=
 =?utf-8?B?ZDg5U1VEREFDRmg1UFc1ekRNRmdKQTNMcm55dlFJYytwVDdId3puSDVsUkwx?=
 =?utf-8?B?WDA4dVkrdGk5dTRDaVBEdjBLWDgzV2lTc0IwZ3d4ZU1DVTgwR3JZTFlFdHha?=
 =?utf-8?B?ejVrcVFuUVdCdTVRM1Fmb3h2cjlsYllnUHZDMjh4bldjdFhZcGhObHZBWTBL?=
 =?utf-8?B?OGh1VHBIYWY4Q1RTYlpUeGw2bHhCYkowelZHRFE0ZDVuQkYzVjI0V1ZGTEg5?=
 =?utf-8?B?RjRONW93R3NzdUNhRVhvOTFXZ0pWRnlmU2RZWFpmeHNTb2FpczBUcTFoYWhp?=
 =?utf-8?B?VW5aMXp6VXdyQmdkc3h4K3NYZ0h0RnpKNUdKZy83RzIxQzFpMWdzbUE1dDNG?=
 =?utf-8?B?YWk5Snl2cmlEN2xGK0h2WXdLbXZWcmFicEptM3RPcS91WHhGRkowM2NzcmlM?=
 =?utf-8?B?UUZpcG9KSzU1STZsaGk1TTFVazgwUkpmTzhmWjJHaEhkTjZCTjlZd1B5MUlu?=
 =?utf-8?B?UlZtOGhONjk0MDVHWmZwbGtZaWFVL1NCbFMwanlxbkt3eDdKdmNFaDF4b1Yw?=
 =?utf-8?B?RVdnd1lKZ3ZGcGUzV3Q4VGdmdFBCNGNTQ2pHbmc0QVp3V3JPdjVSYzh4cC9q?=
 =?utf-8?B?UHlPQU05a28zZXFSQ3hQVWd2OXJ2dlRFcnF2bUo3aGZhQ1htWHVOWmR2TlhT?=
 =?utf-8?B?emJTMEpFTGxDSEtXY216aW1uVXd2VFhlekJNQW9lVEJRWWpDR1pPRlpVNzVR?=
 =?utf-8?B?ME44dmorSFV0ZVFlaGJHNGg3RmlFK2ladVR0NFFMYzhuNk94citmZlBQdzJq?=
 =?utf-8?B?Q2NyeUNVYjI4SWgxdUYvOFhyYzBURysxZm0vSW0yNVM2WitkYmRPc1R4ekRW?=
 =?utf-8?B?VWZGOUZ3SkRwL21WN2h2VU1jKzhoeTZwR0lPUzVHSUV5bVAyZS9aTmNUOTRS?=
 =?utf-8?B?bWFUaC9CRG40N1lQeEw2T01aTVdEd1pSUFNaSDIzY2hZaXFSV1B2Snlqckhk?=
 =?utf-8?B?ZlFGMzhndEtvTmpudWh1UDZJT2hVR2UwN2Y3b1FpaGZicDBnUFF2cmZnOEoz?=
 =?utf-8?B?d1lwbG53TS9oOTNKQ0lNdS9yMGdha2hwZUZOSW1FRmdlWG8yd3RsbFg1NjNL?=
 =?utf-8?B?RUxkWkZ4ZkFQT1VReUU1UVFuaVpwUC9rK3l2TlB4b3lyVEtvVXUzUk04dlZa?=
 =?utf-8?B?UWdUeENTc3l6VVY0dmdVQy9kOEhYdTEzUVBYeWpua2p6dEVCK1pTd2lvUWFw?=
 =?utf-8?B?SkZTRUFNUkhjbGFWbHFFNElscjVuL2ZVRENPQm40dW9ycy9BU0I0a1A4NVpD?=
 =?utf-8?B?S05ITTY3MVZwcTcxcUtiM3lDcDZaZzVNVEV6Z1pjRXYrMm1KSTZ0TTFnS1NT?=
 =?utf-8?B?Q2owQTBEaDJMWFNXK0dEZWJEQVNBSDJnakhHaTBzUkRYZUhFZkFlMW1uNFk0?=
 =?utf-8?B?QkptK0VWaVhkRE0zTk9uNldZQnRTWnd1Z05VLzYydWxjd3d4N1lRV05lVUpy?=
 =?utf-8?B?dlVuV0pMM0d6RWw4TnBYTzNPQWZxVWc2aVdJUERaWkdRMzJXT1BlMUFaMGxU?=
 =?utf-8?B?NzRwbFJxVGlzVFQ1OERxbFNmbFdML24zbEg4YXZhVitMYkJrUkF3ZkZ1UW81?=
 =?utf-8?B?L2tQcVp2YVB1WGFCV2tZSTB5Zkt2RExRbmI4S2ozemJ1eTNxRmw5dTdvYmFk?=
 =?utf-8?Q?N4T8S8n3TL4=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB11861.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eW9GRmw0ZG9ydERUSnJjUWxjQngreXZQNzRuN0FEWTFIZkcyZTE3WHNyekg0?=
 =?utf-8?B?YTdEVUdMR2JUZHVRcTdjc1ZrbmpRZWJ4T3gzWWFsS1dOMlZrUUVMSFFNRi8y?=
 =?utf-8?B?ZGN2bXRiWm8zKzNrWlZSRzF6TUM4cldBYWt2UjF6VjZHWmZCaFZVcU1mSHJO?=
 =?utf-8?B?ekZQSU9tanpreTdOb1dXRi9JS0xIeWpKYitqby9MNUhHTmZlSjRocEVqUnht?=
 =?utf-8?B?WXZwa0JNT1ltTWcvbEJqRm4vYVBjYUt2eDlNSzU0bzdIalN1Q1BTdUN0SEx6?=
 =?utf-8?B?MllQWjhIYVlMdEhPUmk3bFRGdDFVRHdBQnRpMnRZMTJ6ckh6UVM0cGlHSldw?=
 =?utf-8?B?R1pyOCtTREhNc2VqYS8rVThZaWdNWHFmRDRZQXBPak1xYWJVTjZ2SkJNRElN?=
 =?utf-8?B?YnhXUmZLeGJhaGJTWEUydlFzcHdkUHlkaFJTTnZvbks2aEpMelVoekZSRTFw?=
 =?utf-8?B?SWREQVZ6ZWNBbGdsV01lVzZpVU5WOWhJaFpBWUNKV2xaSEV2WFpaMlVWT1dS?=
 =?utf-8?B?S0xUYm94cXdXOWFNUXFRVDFhQUI0VlByOWlNM2NLQzlXVUc4bVJyUTV6dnZS?=
 =?utf-8?B?amlrQjMvbURoVmpEWUJZbmt6anUyNkNVMTNMaWkwMVIyR21ZQk5EcC9wWVZQ?=
 =?utf-8?B?YmJLaityQTc2K1YvQm5QMldYV3l3WnkrS1RUSnV0azRKWkdJRmhMdUFDUVJJ?=
 =?utf-8?B?N2wrTC9GU0JySEVTTG1EVkx1Sjl0cmQrUjY1MFhxZDFuUGtHMFBkbS9VZ3Fn?=
 =?utf-8?B?amNPZ0l4bDN5SXdoTVZockh5THlwc0x4UmRrSm9vR1dSZldVZHhWR01xanN0?=
 =?utf-8?B?Y0JCS3ZSVnBTYThlWmR5emZXTXNZSmRMaHBCYzI3U0luaTBZSHFrZHhxRTZj?=
 =?utf-8?B?NFVJR2d2RHFCdGdJRU5kSXdib3M1cnp5YWdHM3d0VzlWM0V6WndvZGo4Yi9P?=
 =?utf-8?B?eldQQlh1Si8xNDdhUDZHelhUZXNPaG12OU9uSUdFWUdkcHBudFRMSlUrM28x?=
 =?utf-8?B?Z1M4Q3ZoZjM0NnI0SS9hRll4UlJIeTRjQXJUUmZpV3dIck55YmZ2MXZ0ajNv?=
 =?utf-8?B?WENzcHFhdEtSUHFEb0owTk9NOWVVQStrbU80R3dwKzY0Vy9Yek4zYVlOYjBo?=
 =?utf-8?B?SzZFZVZDZWtXRkNPUXBOY0kyQTFsTXFuamJXU3l4bkZUaUJKTlNZRTJLUEZJ?=
 =?utf-8?B?NGQzb01hM2Fka3dJV2FiaE1mckE2dVlTS3JWalFVUXgrV3YyZWxrU1VGbkt4?=
 =?utf-8?B?WllPUXhYTitLVlBuMzcrT3ZjSGExMk92ZlluakZ3cVJyTzFHSklBUTJkbnY2?=
 =?utf-8?B?SmRnYVBIdXZMS0pjaXptbGc5Y3hmMS9qc09rSnpGakYyaFFWRWtESUFGZUc3?=
 =?utf-8?B?Nm41MkM1VGt4MDNtOWNuSUNzT0J5SVhwZ0JPWlFpSTErTndHdjdZdFQ5WnNO?=
 =?utf-8?B?QTZpWGhQRjEvNXY5Q3JJbWR4Mk5aRGFGeE5ZbzJhZ0U5bGI4Z0VOb2xQNkpo?=
 =?utf-8?B?T2JWUG5XYi9TWTdTZVR6YjN1bFFDRS9pbkNwc3J6V2NsNi9XYit6ZE05bjAx?=
 =?utf-8?B?RGFNbXFCN1NnS1gvUmdhRTJFeTJuQTRWVVkxcjg2NDBCL25PUXl2S0gyMGhs?=
 =?utf-8?B?Wlg0THlIcEk5dkVjVzVORE5tN1ZwRUtBU3lWRE9RSEtKOUxaQ0VCSDFPY0pJ?=
 =?utf-8?B?V3RTQ29mRjBWZUlUbjB3M1lnSWpWUDQwM0xQT1NpM1VDZ05JeDcrQzlrQ1N1?=
 =?utf-8?B?ZjZNMXM1RlRMcFpVMnRrWE9rZTZZSnVwQkluQ0VnYVdHY1ZHVENHOUoxTTNm?=
 =?utf-8?B?bUlKUlY1WTdCQ2tVTmZMOFRKMlB5Q2ZSNm5qOFNvY1hiU2xTcTk0ZFNtdGFp?=
 =?utf-8?B?Ymk5dUJCWklodURnUWM2UUFLRTFzVnkwOVRISW90dVBIUjN0ZHdyalUycWhn?=
 =?utf-8?B?UG14VWpLU3YzUWFTbEpNditpcStsYzNwNElsZEN0SkFUaXFpVHExalJJaVhE?=
 =?utf-8?B?R2puN0Z3azRvVjB1VHlkYWx3SWI1UFduaEpoS3p2dDAwSzF5eVdtblB6SGpR?=
 =?utf-8?B?SUhPb0hmbitsMisvcDFwS0dqUWdxTEhLeWQ5OG1xOGt3T0tIVVZYMjZoNndV?=
 =?utf-8?Q?CryPiwSfspUU1JuWNyopLyW+z?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	pHloISbqQrWfUZu7kuYVtiMdW98whScyjRu0Iuo3mRN6dV2uc3OsfiLa9uLo04TnYxQ/EPbPlSmh31rhuNLuBYmSRY6zMh9pxVPMlkFRRRPOn0ntXd7QphdVfAI3JyY9XI+h9v/zHzwQa1U3LUrWPTaGhnyhTH+no7bUKVxuI72EcOIZSsmBqzB05PRu6VFQbKlRX0fP3KkVOrg4F+xWojLZuF+pZTNEQJDN8wua/pZ+WA1vpMlazeW7yMBm4B7r4jEMg/hE+tzCJJIgGV0S5MtADTvjZ6GbjwGddyyrMS3yHCgbEwvF773UGNwjUg2C5CJVPpVLdOZG/cF4d63BF6Q1y1LT/Da797Npk7eX4xmei+Jno+m4j9kr+k6F2fknGlHL0ENdnfc4gxsbTF/IoDlZMK2iZMnEG0CNJ7LDtb+7rhVWtw95LzGimxJvf1hhJxDm8k2zbwRT1fvfTNxGI8ntBBoK0J1bHzq5TZoKI0SQD9dht5yGyg8KVUU22oB1ZdjerlpuN6Scnvlrkfgpcjwx7TUs4mETNrahB9u5F2kJyMctCagfGjORiJgFnr8b4ZFy1omH+eUJwGDWMjG599rdypgQyNDHRY0SHsM3GNtbMu02ZSJM1O/E+jwj+o2X
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11861.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4727dfa5-8fb3-49b4-7fb2-08dd3a84ae2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2025 01:32:48.8792
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sTaHqewJKW6sBhXvWt7zsEoU5oraawWY997kRLIZgfAdzp7TaUaR4tkJNXx04poqZUfFRQjT50KoBXL4wUPsJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5773
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jan 2025 01:32:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115011

PiBIZXJlIGlzIGEgcGF0Y2ggdG8gbWFrZSBhbGwgd29ya2luZzoNClRoZSBvcmlnaW5hbCBwYXRj
aCB3YXMgbm90IGZvdW5kLg0KQ2FuIHdlIGRpcmVjdGx5IG1vZGlmeSB0aGUgdXBncmFkZSBwYXRj
aCB3ZSBzZW50IGVhcmxpZXIgYWNjb3JkaW5nIHRvIHlvdXIgbWV0aG9kIGFuZCByZXN1Ym1pdCBp
dD8NCk9yLCB3YWl0IGZvciB5b3UgdG8gbW9kaWZ5IHRoaXMgaXNzdWU/DQoNCiAgLS0NCkJlc3Qg
UmVnYXJkcw0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tDQpXYW5nIE1pbmd5dQ0KRlVKSVRTVSBOQU5KSU5HIFNPRlRXQVJFIFRFQ0hOT0xPR1kgQ08u
LCBMVEQuIChGTlNUKQ0KTm8uNiBXZW56aHUgUm9hZCwgTmFuamluZywgMjEwMDEyLCBDaGluYQ0K
VEVM77yaKzg2KzI1LTg2NjMwNTY2LS04NTY4DQpDT0lOUzogNzk5ODg1NDgNCkZBWDogKzg2KzI1
LTgzMzE3Njg1DQpNQUlMOiB3YW5nbXlAZnVqaXRzdS5jb20NCg0KPiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiBGcm9tOiBKw7ZyZyBTb21tZXIgPGpvZXJnLnNvbW1lckBuYXZpbWF0aXgu
ZGU+DQo+IFNlbnQ6IFRodXJzZGF5LCBKYW51YXJ5IDE2LCAyMDI1IDU6NTEgUE0NCj4gVG86IFdh
bmcsIE1pbmd5dS/njosg6bij55GcIDx3YW5nbXlAZnVqaXRzdS5jb20+DQo+IENjOiBvcGVuZW1i
ZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW29lXSBb
bWV0YS1vZV0gW1BBVENIXSBzbWFydHk6IHVwZGF0ZSA0LjUuNSAtPiA1LjQuMg0KPiANCj4gTWlu
Z3l1IFdhbmcgKEZ1aml0c3UpIHNjaHJpZWIgYW0gRG8gMTYuIEphbiwgMDA6MzkgKCswMDAwKToN
Cj4gPiBBZGRpbmcgcGhwLW5hdGl2ZSB0byBERVBFTkRTIGFsc28gZG9lc24ndCB3b3JrLCBpdCB3
aWxsIHJlcG9ydCB0aGUgc2FtZSBlcnJvci4NCj4gDQo+IFllcy4gVGhlIHByb2JsZW0gaXMgYSAo
c29tZXdoYXQpIGJyb2tlbiBtYWtlIGNsZWFuIHRoYXQgcmVtb3ZlcyBmaWxlcyB0aGV5DQo+IGNh
bid0IGJlIHJlYnVpbGQgd2l0aG91dCBjb21wb3Nlci4gQnV0IGNvbXBvc2VyIGluIG1ldGEtcGFy
YWxsZWwtcGhwIGFuZCBub3QNCj4gaW4gbWV0YS1vZS4gU28sIEkgdGhpbmsgdGhlIGJlc3QgaXMg
dG8gbWFyayBjbGVhbiBhcyBicm9rZW4gdG8gcHJldmVudCB0aGF0DQo+IGRvX2NvbmZpZ3VyZSBy
dW5zIGl0Lg0KPiANCj4gSGVyZSBpcyBhIHBhdGNoIHRvIG1ha2UgYWxsIHdvcmtpbmc6DQo+IA0K
PiBkaWZmIC0tZ2l0IG1ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L3NtYXJ0eS9zbWFydHlfNS40LjIu
YmINCj4gbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvc21hcnR5L3NtYXJ0eV81LjQuMi5iYg0KPiBp
bmRleCA5MDZiOWU0ZWUyLi4yNWVkYTUyNjkwIDEwMDY0NA0KPiAtLS0gbWV0YS1vZS9yZWNpcGVz
LXN1cHBvcnQvc21hcnR5L3NtYXJ0eV81LjQuMi5iYg0KPiArKysgbWV0YS1vZS9yZWNpcGVzLXN1
cHBvcnQvc21hcnR5L3NtYXJ0eV81LjQuMi5iYg0KPiBAQCAtMSwyMSArMSwyOSBAQA0KPiAtREVT
Q1JJUFRJT04gPSAidGhlIGNvbXBpbGluZyBQSFAgdGVtcGxhdGUgZW5naW5lIg0KPiAtU0VDVElP
TiA9ICJjb25zb2xlL25ldHdvcmsiDQo+ICtTVU1NQVJZID0gIlRlbXBsYXRlIGVuZ2luZSBmb3Ig
UEhQIg0KPiArREVTQ1JJUFRJT04gPSAiXA0KPiArICAgIFNtYXJ0eSBmYWNpbGl0YXRlcyB0aGUg
c2VwYXJhdGlvbiBvZiBwcmVzZW50YXRpb24gKEhUTUwvQ1NTKSBmcm9tIFwNCj4gKyAgICBhcHBs
aWNhdGlvbiBsb2dpYy4gVGhpcyBpbXBsaWVzIHRoYXQgUEhQIGNvZGUgaXMgYXBwbGljYXRpb24g
bG9naWMsIGFuZCBpcyBcDQo+ICsgICAgc2VwYXJhdGVkIGZyb20gdGhlIHByZXNlbnRhdGlvbi4g
XA0KPiArIg0KPiAgSE9NRVBBR0UgPSAiaHR0cHM6Ly93d3cuc21hcnR5Lm5ldC8iDQo+ICtCVUdU
UkFDS0VSID0gImh0dHBzOi8vZ2l0aHViLmNvbS9zbWFydHktcGhwL3NtYXJ0eS9pc3N1ZXMiDQo+
IA0KPiAgTElDRU5TRSA9ICJHUEwtMy4wLW9ubHkiDQo+ICBMSUNfRklMRVNfQ0hLU1VNID0NCj4g
ImZpbGU6Ly9MSUNFTlNFO21kNT0yYzBmMjE2YjIxMjBmZmMzNjdlMjBmMmI1NmRmNTFiMyINCj4g
DQo+IC1ERVBFTkRTICs9ICJwaHAiDQo+IC0NCj4gIFNSQ19VUkkgPQ0KPiAiZ2l0Oi8vZ2l0aHVi
LmNvbS9zbWFydHktcGhwL3NtYXJ0eS5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1hc3RlciIN
Cj4gLQ0KPiAtUyA9ICIke1dPUktESVJ9L2dpdCINCj4gLQ0KPiAgU1JDUkVWID0gIjY0MmE5N2Fk
Y2MyYmY2YzFiMjQ1OGQ2YWZlZWIzNmFlMDAxYzFjMmYiDQo+IA0KPiAtZG9fY29tcGlsZSgpIHsN
Cj4gLQk6DQo+IC19DQo+ICtTID0gIiR7VU5QQUNLRElSfS9naXQiDQo+ICsNCj4gK0lOSElCSVRf
REVGQVVMVF9ERVBTID0gIjEiDQo+ICsNCj4gK2luaGVyaXQgYWxsYXJjaA0KPiArDQo+ICsjIGBt
YWtlIGNsZWFuYCByZW1vdmVzIGZpbGVzLCB0aGV5IGNhbid0IGJlIHJlYnVpbGQgd2l0aCBgbWFr
ZSBhbGxgDQo+ICtDTEVBTkJST0tFTiA9ICIxIg0KPiArDQo+ICtkb19jb25maWd1cmVbbm9leGVj
XSA9ICIxIg0KPiArZG9fY29tcGlsZVtub2V4ZWNdID0gIjEiDQo+IA0KPiAgZG9faW5zdGFsbCgp
IHsNCj4gICAgICAgICAgaW5zdGFsbCAtZCAke0R9JHtkYXRhZGlyfS9waHAvc21hcnR5My9saWJz
LyBAQCAtMjQsNiArMzIsOCBAQA0KPiBkb19pbnN0YWxsKCkgew0KPiAgICAgICAgICBpbnN0YWxs
IC1kICR7RH0ke2RhdGFkaXJ9L3BocC9zbWFydHkzL3NyYy8NCj4gICAgICAgICAgY3AgLXJmICR7
U30vc3JjLyogJHtEfSR7ZGF0YWRpcn0vcGhwL3NtYXJ0eTMvc3JjLyAgfSAtRklMRVM6JHtQTn0g
PQ0KPiAiJHtkYXRhZGlyfS9waHAvc21hcnR5My8iDQo+ICtGSUxFUzoke1BOfSArPSAiJHtkYXRh
ZGlyfS9waHAvc21hcnR5My8iDQo+ICsNCj4gK1JERVBFTkRTOiR7UE59ID0gInBocCINCj4gDQo+
ICBDVkVfU1RBVFVTW0NWRS0yMDIwLTEwMzc1XSA9ICJjcGUtaW5jb3JyZWN0OiBUaGUgcmVjaXBl
IHVzZWQgaW4gdGhlDQo+IG1ldGEtb3BlbmVtYmVkZGVkIGlzIGEgZGlmZmVyZW50IHNtYXJ0eSBw
YWNrYWdlIGNvbXBhcmVkIHRvIHRoZSBvbmUgd2hpY2gNCj4gaGFzIHRoZSBDVkUgaXNzdWUuIg0K
PiANCj4gSSdtIHVuc3VyZSBhYm91dCB0aGUgYXJjaGFsbCwgYnV0IGl0J3MgUEhQLg0KPiANCj4g
UmVnYXJkcywgSsO2cmcNCj4gDQo+IC0tDQo+IEFscyBkZXV0c2NoZXIgVG91cmlzdCBpbSBBdXNs
YW5kIHN0ZWh0IG1hbiB2b3IgZGVyIEZyYWdlLCBvYiBtYW4gc2ljaCBhbnN0w6RuZGlnDQo+IGJl
bmVobWVuIG11c3Mgb2RlciBvYiBzY2hvbiBkZXV0c2NoZSBUb3VyaXN0ZW4gZGFnZXdlc2VuIHNp
bmQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIChL
dXJ0IFR1Y2hvbHNreSkNCj4gDQo+IE5hdmltYXRpeCBHbWJIICAgICAgICAgICBUOiAwMzY0MSAt
IDMyNyA5OSAwDQo+IFRhdHplbmRwcm9tZW5hZGUgMiAgICAgICBGOiAwMzY0MSAtIDUyNiAzMDYN
Cj4gMDc3NDUgSmVuYSAgICAgICAgICAgICAgIHd3dy5uYXZpbWF0aXguZGUNCj4gDQo+IEdlc2No
w6RmdHNmw7xocmVyOiBTdGVmZmVuIFNww6R0aGUsIEphbiBSb21tZWxleQ0KPiBSZWdpc3Rlcmdl
cmljaHQ6IEFtdHNnZXJpY2h0IEplbmEsIEhSQiA1MDE0ODANCg==


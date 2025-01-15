Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7539BC02180
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 08:47:17 +0000 (UTC)
Received: from esa12.fujitsucc.c3s2.iphmx.com (esa12.fujitsucc.c3s2.iphmx.com [216.71.156.125])
 by mx.groups.io with SMTP id smtpd.web10.16684.1736930829377378748
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jan 2025 00:47:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=j7bnVT0P;
 spf=pass (domain: fujitsu.com, ip: 216.71.156.125, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1736930830; x=1768466830;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=uk/5MINUcEch9OdKSMg4+p24vgd3snU4pQ6OU++Uq50=;
  b=j7bnVT0PuiP3D7Hd9OllSnwOXegYv/pcOU1VIfWRsu5jUkv5pQkDBAPa
   hkUb7PGQuI1TyKNe41YKscBwe287W9oPVu366o7pewNwMZeGJsakf292r
   ttRsTT7mbDN3DEw27RXr+CnvqehNpG0g2jSl80U82e+zVZgfIsT4S4dn+
   qMp65IZpT+8bKI4usQTc7DaOpo45+8M0/hmOM0ke3Y6DmEXqyFkGUixGY
   0NYzW5DRaPxjX1W19EPKAejkdeiK8xj7rTrh4SWyk7yYMy5egRL1uL53U
   sosZnp67UFAdrrUYMBVLoWWRwhmil6rhrxds9kLhsPoRH1JLZrZilP6gD
   Q==;
X-CSE-ConnectionGUID: RfXZ5220QD6Mq3iI1JN6KA==
X-CSE-MsgGUID: 2+fCuKiPSxCYgpbPSbsAsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="143093166"
X-IronPort-AV: E=Sophos;i="6.12,316,1728918000"; 
   d="scan'208";a="143093166"
Received: from mail-japaneastazlp17011027.outbound.protection.outlook.com (HELO TYVP286CU001.outbound.protection.outlook.com) ([40.93.73.27])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 17:47:07 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e9xx0o35Bvh4GF/TnqY+aQBRSjwc0AG4eoyJ+mTfrw4P6PCmH+jYycchtWXGjKTtVVmEQl7RL/8aQEm9fTAMa833x3gO4pPZjlSGUoK2n0FeyyyHpn/QvRMTd5xsFQmFAUmVhKLn8I0M6rEXnyOshaZQWucaFMSBiEj8JZDC49yBnew7/qQgw/b34boh5LhAgQBgVyh0G7B1xS8IWEmQWxnv5MjPpMODSM5lUpNhX3yYczojMIumSU/4iq5yQIotf0YhF8zLPnxPziecvK/HCY5/cxZ8BbYqfI/yDIT0LEPBFS9MCRtjB93aB9HyeJCQk3NaM9Ydt08wxloXnNK+eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uk/5MINUcEch9OdKSMg4+p24vgd3snU4pQ6OU++Uq50=;
 b=Y5h7p+8FzmvnbDouUUfkonL3yvO45gVZkPL8At6ybaTo+qZJIhkIZbwmrTqCJMMarNlzoBjGmrowkPM8wjWIiwLps3qe4IKum6edAQy9ZkXCN0kAULzlTwiedQ3JFnNWxYWxMHDB3n1A0XeJkhLERT1cH+JiFI7clZ9eMaFQocCyGkBmPocDwETtb2XlhSt0ep5N0K8rkCYHWuqV6MBTPTRT3l+WDuhAG4phD3nSMaA/Ml/99hr/gBfrtHTd/WiqIRtjeOaasv5hXrxGDokI7nUBYETqAGGSSasFP8cyJvaX1Ci0jWXhyKjB+qFCHS3XNpUYldbmEkbuJ7sJCWoXVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 (2603:1096:400:3fb::13) by TYYPR01MB12582.jpnprd01.prod.outlook.com
 (2603:1096:405:15c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Wed, 15 Jan
 2025 08:47:03 +0000
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e0dd:28e5:6a6e:2342]) by TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e0dd:28e5:6a6e:2342%6]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 08:47:03 +0000
From: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
To: =?utf-8?B?SsO2cmcgU29tbWVy?= <joerg.sommer@navimatix.de>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe] [PATCH] smarty: update 4.5.5 -> 5.4.2
Thread-Topic: [oe] [meta-oe] [PATCH] smarty: update 4.5.5 -> 5.4.2
Thread-Index: AQHbZv4hy7RzW3j4yk+mlh298M6m7bMXWYMAgAAsgFA=
Date: Wed, 15 Jan 2025 08:47:03 +0000
Message-ID: 
 <TYWPR01MB11861B18EC4AD9079FF4602B0DC192@TYWPR01MB11861.jpnprd01.prod.outlook.com>
References: <1736911952-10934-1-git-send-email-wangmy@fujitsu.com>
 <r3pwhezfvqmgh43ejzkjroffsmdoupemdh3q4v6hplgk3zregq@tni3w2fjzwaf>
In-Reply-To: <r3pwhezfvqmgh43ejzkjroffsmdoupemdh3q4v6hplgk3zregq@tni3w2fjzwaf>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5Njgw?=
 =?utf-8?B?MmZfQWN0aW9uSWQ9NWI3YjUyZTQtMjU1MS00ZjJiLThmM2YtMjNkNDVlZTkw?=
 =?utf-8?B?NGFkO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMz?=
 =?utf-8?B?OTY4MDJmX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQx?=
 =?utf-8?B?LTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX01ldGhv?=
 =?utf-8?B?ZD1Qcml2aWxlZ2VkO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFk?=
 =?utf-8?B?NTUtNDZkZTMzOTY4MDJmX05hbWU9RlVKSVRTVS1QVUJMSUPigIs7TVNJUF9M?=
 =?utf-8?B?YWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfU2V0?=
 =?utf-8?B?RGF0ZT0yMDI1LTAxLTE1VDA4OjQ2OjQ4WjtNU0lQX0xhYmVsXzFlOTJlZjcz?=
 =?utf-8?B?LTBhZDEtNDBjNS1hZDU1LTQ2ZGUzMzk2ODAyZl9TaXRlSWQ9YTE5ZjEyMWQt?=
 =?utf-8?Q?81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB11861:EE_|TYYPR01MB12582:EE_
x-ms-office365-filtering-correlation-id: 0782887b-70da-49e3-9833-08dd35412eeb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|1580799027|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?QkZKYkxvZFZnY0ZWKzZNYlRSNXl6RWhHQTNjRG92R21WQmVyS2hmblQwVEpJ?=
 =?utf-8?B?aldpMXc0TVVkZkVERXpDaGhRS08yN2hUZE5CRlBhcTlZZ09USERzUE80SGho?=
 =?utf-8?B?Q2pkU0x3Uzc2cEV6WEc0Wjl1dy9aQ0VscEJrbDhydEpleDRuWVJqVGpZMVl0?=
 =?utf-8?B?MDVNUzF4c0pMRS9xMzBBUk1VNStRK0VJcjRRYkV0OFJDWTRqY256b0FpVTU0?=
 =?utf-8?B?bU4vZmpoaVdCWlA0aFpuaVVQMlFPTnB3eVgvZDVmUmd3SVY0dXBOaWg3eFNM?=
 =?utf-8?B?aDg0d1drcWdqbnoyRXptcDUreEFUMW1PZVo3ZU03RmpyZFdVTE5TNVAvZlRp?=
 =?utf-8?B?N1E1VlhVY3dyaEhVTjZwRzZ2aUp3ZXBSMVc4UGhvbmpqS3hjM3JHbGNNbkFC?=
 =?utf-8?B?emJ1UG5uR0JUbEJjVFpkVENnRW9jd2hmcXFEeXFFOEg3VCtJY1BvNUF3MG4x?=
 =?utf-8?B?eC9McmllM25yOFYzVmo1UWdlVDRLeVdtUlZiY01hWk5CeE5CQ2FhSkxQT2RU?=
 =?utf-8?B?RlRUVjlZaTZMRjFLWWI3V0J4WkpKV2I1TGthN28ydDBIWFozN0Q0dXVmclRo?=
 =?utf-8?B?UnBKOU03L0tseWpQUWxVSVZXdHMxb1pCNC8vMXhkV2NOZjhMa3k5anN5ajNZ?=
 =?utf-8?B?QTBWZFY1dzJBaFh1NER4L21FemFyZkdISkM5aUJCa0RNZVNhaU9RVWk2a2Va?=
 =?utf-8?B?elU5SEE5UnM4NllKd1d5ekFxOUtXY0JsVUVlMy8yQU9NV3J6MnJpcGcrdnpS?=
 =?utf-8?B?bGJFODhqTitsczR4NGZFWG5zZVFJVm1rSElKbTZxcFMvS2pjN2M1THkwUTRI?=
 =?utf-8?B?Mk1rRFpJdWx3RXJXdXRDOXVMblkvTWlMdHpVSXJ0ZVd3YlNBM09hQWtVNEJW?=
 =?utf-8?B?ZzVDVkh4MU1RRFE5VFJZOXZlK3VYSmtmRFQySWdEblFWYmN5YnA5dVVHaXNu?=
 =?utf-8?B?eUJUeEE1cy9JeWRDOENrcnZ4NVhiZnRkUDQ4QjBMMXNxZURKUnVIOVgrcGta?=
 =?utf-8?B?ZEEyUmdLSWFJSWVCeVpWdVkyakNkUHpqU3NkQldqZU1mT1dVV1Jwc2ttTitC?=
 =?utf-8?B?MVRDN3pVVzZhS1NUOU5KVjhKS0tiS3duWUZwOFA5Y0p2eTU3bmM5bFljQkRa?=
 =?utf-8?B?ejIzWjNkU3VTVlBCc0p2YWVVUWJoRnVGREM5WTNVUVR1cjJjOC8veDFCQlNk?=
 =?utf-8?B?OGJOSFNTelFEL1ZnR2ZOb09rbS9qQVBONExteFR0emUxalJTZkhoTUdjelBo?=
 =?utf-8?B?YVcxclZGdS93UE9kUUJGNGw3N1prSWE4WnJCaDJJS0E2b3VRMG1MczhZQXpl?=
 =?utf-8?B?Si9MTXFQd2JMdVFrUFNkWDg2Z1N2YmhYSlVBcURiUEhDODhOTkVKRVdUeFd3?=
 =?utf-8?B?cjdJN0p1M2NnbU9ReXpQdXVjSmVpNHFEb21yVHdnYmFWdC9RYi93SkhHU3lG?=
 =?utf-8?B?UTZnNDMyVUFLemdJYWJDOTUzcThIOGQrTjh1VWVtMnA4ejRoaXRRU0ozdlhq?=
 =?utf-8?B?MDlHekd2dmNuQVBVejVVY3hCSHNwUE1OVGlBYmF6ZmtVOXA2RXdGazFublRJ?=
 =?utf-8?B?UnhSQU1hWndBSWhVK25xY044TWc4NzJOYkROeW9tNndFZllWcklGR0F1Q3F0?=
 =?utf-8?B?djBQT1RFbDVsVkl4c0FZK2pRU0VYd0k2RWNhQUFPQ2NsWXRVLzE0MU1lUUlm?=
 =?utf-8?B?VXpNdUcrMlR1Mjl4L2xtU28wTC80UVlxbjhBNzZHRGJzdTB3STNCQmtiRUwv?=
 =?utf-8?B?QmVtZUYxUVl2bW9wNkd2MTJXUTByWCtpQkhncHIyVFpmRCs1YzNqcnFZT2xo?=
 =?utf-8?B?dU5HeFExVFowRXZjK3R3d1BiWUtCcWdYTHFCYVhJVGF4UlV6V3dLVVI4NVFs?=
 =?utf-8?B?dXVHc25jN1p1Z2E2VVZDc2N1aUlwMHowcVFGdTRSS0ppYmc9PQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB11861.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(1580799027)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?OWpQRk9xWVl5SXd0RE8rUm5lUTIwNHRiMndlQ0xNNFpUYUpoTENlZmltZVpv?=
 =?utf-8?B?V1haRE1FbURWMURsN3Z2MHRGQS9NNUtmWm9CQmVZK3d1MFI1ci9jRnYvM2lY?=
 =?utf-8?B?UnJhZHB3eUpCazg1THMxelFVY1dqc2FMaWQyb1pib2c1d0VOSW56UldDWml1?=
 =?utf-8?B?UTJQOWNHQ2daYWkvcDhWQitBYTk4UHIzWDVpQzA1T2lSSVNtOTExajh4M2Zp?=
 =?utf-8?B?RzIrSWI5Y0dnc0Vqc05TTENJYmh1dU9RdVdBbzBoQ0hIQ2kraWRQUStVZVpS?=
 =?utf-8?B?aGdIZFZIck9CR1drcFdSdXN4bkR5eVN1RTNHeXI1ZklvMFdLTGJ5MGJybjJk?=
 =?utf-8?B?VUM1NUpUcGN4c01Hc0tqbWtEb0Z5eTlxbWU1VFNYNExnS2tFenlKSWRYSlBD?=
 =?utf-8?B?VmxjejgwZVU2TGVEWGluMzhXSFNDWDJ1UVhObDl1NmhMSjlSWStDZFVyZmVN?=
 =?utf-8?B?cmpmT3IrZ0ZSNVlZU3ZmUFVIdTQ2YTBvMnNLZEgrcjlSL3pvUmJDQ1BuTWZV?=
 =?utf-8?B?TDlkYitZUUo0VjZKK214Y29INDZKQzQ5QkdJRDFzWDJzWUYxVU43NHluVmc2?=
 =?utf-8?B?Z0NXUE5JNm10UW04Y1JQbHdZajhheC82NGVXVy9jYWlQa3NTaEt3cERXVTBa?=
 =?utf-8?B?VHVkTDRJRXh1ZnN1cTl6WS8weitiK1FsZ0kxK2tYYzE5Ui96aTNobFI0M1cv?=
 =?utf-8?B?bEtPcy9yTUowUUU4bGJDUlBEWEQ3TXFYUUgvbEExckFtVitxMHdrZkpTMnFM?=
 =?utf-8?B?R05sK3U2aVl6WlBzM1NyUnRxODJWL0VucFZuSHNTTEI3MCtqVXIzUHVkeFRF?=
 =?utf-8?B?ZWdwbEZLb0FsSHNSdGRjRnFDUTF3UHBVZ2w0NitRTFZOYlI2YW51OTFmSGVv?=
 =?utf-8?B?WUExVGZNK1RNWWpzWFUzVzVFLytXY0ZwMFBsbmpsUytDdkoyVE16eXVLMWYw?=
 =?utf-8?B?SmVNSjZ1N0QxRUkxWHY1d3NOMkJpa1NWNkVmc3JOMCtGOEZIcktpSzRiWEV5?=
 =?utf-8?B?VkE4VE5VeGNiWUJ2cTBxSWxJWFBnSmhZQnh6bDBvWXdVQlpzakpDaHgrNXRm?=
 =?utf-8?B?WEcrVEt0VE43cUF2b09Kekg3Zk9MUG9BNEtRZDhFVVloVlN4ZzJFaDR2dFZj?=
 =?utf-8?B?TW14UmMzOFpaTXlMQmo3bGZ0L2dLRUFhVWo2ZUgzUmtGaG91c1JGTGRpVzNs?=
 =?utf-8?B?NENibGZwT3l1bzQrRWRMMXFNaDBGT1M4dktJVzU0cXFibXNNSVlybGpCY0Jn?=
 =?utf-8?B?T0c3N3A4Y2pLWlBCckRaMGdwZmVmZitNSWJjbm9RZjRhN1pmS3hiTVhCOEpM?=
 =?utf-8?B?aFd2b1lER1dQMi9KZDZVMVk0dFNMVG5Ca3JlZk9za3ZjOUoxTVlWZzJRQUtv?=
 =?utf-8?B?bkxqL0dYU3dWUDh5L0wrbnlqcjRvdHFya0RQTCtqeEE5Ry9rQVF6ZzBidkxY?=
 =?utf-8?B?TGdDRFhjZ2dhWDVLOXRkaXdYc1NSZHlOejFFTXR5YWd0cldZcUFuZmljZXI2?=
 =?utf-8?B?VGxTZlJqRzBqMVBMRFg5TldESDhEbHB4WlNrMWxXWjJFMmVKWTZpNmpOVXN2?=
 =?utf-8?B?QXFpMEN3MkZKQWRSbVExNE52WFkwaE4vRGhTcGxjditOWFhsWjJ2dTNMelE1?=
 =?utf-8?B?QW1tS2JNeFh3TFlXcVFFb1g1TGROTVhmMnM2N1hDT0lZZXNMVUF6ckxMajlj?=
 =?utf-8?B?Zm5haXZPc3lYM0ZjVExuS3dNajNkdmh0dXNRRWYvNDNNVGVNRTFSR3lWT2NC?=
 =?utf-8?B?RlM4cDhsNEV5QmVkUitDUWhJVTNQVWdQcjdHQlZia25vV2NjbDNEblExZzZT?=
 =?utf-8?B?VVhwN2Z3dE12VmFEMDNZY2ZnZlV1dWVXUXlaeFVwZFlnNkk3K0l4N2NZV0Vl?=
 =?utf-8?B?eXd2SkpLUXpGWkdlZGM2TzlGYThkYmhjQkFxbEU0OGlTcGw5TTNZWndHUWVJ?=
 =?utf-8?B?NTBQMmkyT040N1ovNGE5eVlOb1JYZENxYWljL0NaT2ZsUFJZb0tvRkhpV1N0?=
 =?utf-8?B?K0xJWVJOTnJzQTRsZVdpTmtXaDJVNzREVHlpV2k3ZzI0QktaUGlJbEcvOEto?=
 =?utf-8?B?eXFQWGtwbVdEcitFSTlxMXdKVmpVdFI5MlJWQ1RXeXVjTHY1NFQ3cEgydksv?=
 =?utf-8?Q?vFSw42a1FLwcQwpsZvG0XV2Nw?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	pS2XxuZsp28hdZT3pnRT8Pj34Kk4XTy+DoyClL1VupnpOK3QTuKhTLLpUHP1iA1P5B1D9Fo+q/AK8MVHK/VuqMxIyQqR70Lok8jcYefpVmPdEtSuvit7YG9Ddekc8xp1dopVwl8Qb6OMZDPB4OWRAB8MxNkz20DX7WrcHEE/uHKAxpRTX2Cq3KIhvp3l79gfX+3ExSne7VQ4VqD1c2+QPes/tp7/JMbpjCDKTXvdye/+ECMsEKgEKQO2fqRD/mc8NvQyI1o7rjixucduSgIy6ytUIvOk0yrc4ZXUwwjMIN8ejZlWv+/WPjrvo4G8K8AxJzHXywlUzUQvRdq5s5ogFuDLT/78zYIM+rK9pRj/ABsluRE8sRUu03tpkDY48JylTioeptxAwiYEeEcVrOgaK7Rim0ubjZXCHpBeQ+2u3CpBRYx3V3SMByK/eJmJagoGiqGlXhpOw8+kPZ2uy1gw/iTTOEmrI0GKStMiibpPMlDlbn4XuNReNlBymKQsIr1lpquV7ijAsso7ZcPtClN9rPstEDhuFfT5xbwNVR3zd29PudP7G8ALedfZhN3PNXa+GnbPZgoikALfy2hpK/en9BhpsI+G+CE/O+SXTA5oN1dRbcuFbGevxSSKx89lLiUH
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11861.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0782887b-70da-49e3-9833-08dd35412eeb
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2025 08:47:03.2302
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0amAeCPzfs6PbsCoy/NEvCW78A6IST4s9jMl2d7tMhJn4geddq0yUaeefD94+/4xq2hrl30VaxzXvIYbfRGmEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12582
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jan 2025 08:47:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114896

U29tZXRpbWVzIHRoZSBmb2xsb3dpbmcgZXJyb3JzIG9jY3VyIHdoZW4gZXhlY3V0aW5nIGJpdGJh
a2U6DQoNCkRFQlVHOiBFeGVjdXRpbmcgc2hlbGwgZnVuY3Rpb24gZG9fY29tcGlsZQ0KTk9URTog
bWFrZSAtaiA0DQpwaHAgLi91dGlsaXRpZXMvbWFrZS1wYXJzZXIucGhwIHNyYy9QYXJzZXIvVGVt
cGxhdGVQYXJzZXIueSBzcmMvUGFyc2VyL1RlbXBsYXRlUGFyc2VyLnBocA0KbWFrZTogcGhwOiBO
byBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5DQptYWtlOiAqKiogW01ha2VmaWxlOjE2OiBzcmMvUGFy
c2VyL1RlbXBsYXRlUGFyc2VyLnBocF0gRXJyb3IgMTI3DQpFUlJPUjogb2VfcnVubWFrZSBmYWls
ZWQNCldBUk5JTkc6IGV4aXQgY29kZSAxIGZyb20gYSBzaGVsbCBjb21tYW5kLg0KDQpJdCBzZWVt
cyB0aGF0IHRoaXMgZG9fY29tcGlsZSBzaG91bGQgbm90IGJlIGV4ZWN1dGVkLiBUbyBhdm9pZCB0
aGlzIGlzc3VlLCBJIGFkZGVkIGFuIGVtcHR5IGRvX2NvbXBpbGUgaW4gdGhlIGJiIGZpbGUNCg0K
ICAtLQ0KQmVzdCBSZWdhcmRzDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0NCldhbmcgTWluZ3l1DQpGVUpJVFNVIE5BTkpJTkcgU09GVFdBUkUgVEVD
SE5PTE9HWSBDTy4sIExURC4gKEZOU1QpDQpOby42IFdlbnpodSBSb2FkLCBOYW5qaW5nLCAyMTAw
MTIsIENoaW5hDQpURUzvvJorODYrMjUtODY2MzA1NjYtLTg1NjgNCkNPSU5TOiA3OTk4ODU0OA0K
RkFYOiArODYrMjUtODMzMTc2ODUNCk1BSUw6IHdhbmdteUBmdWppdHN1LmNvbQ0KDQo+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IErDtnJnIFNvbW1lciA8am9lcmcuc29tbWVy
QG5hdmltYXRpeC5kZT4NCj4gU2VudDogV2VkbmVzZGF5LCBKYW51YXJ5IDE1LCAyMDI1IDI6MDcg
UE0NCj4gVG86IFdhbmcsIE1pbmd5dS/njosg6bij55GcIDx3YW5nbXlAZnVqaXRzdS5jb20+DQo+
IENjOiBvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0
OiBSZTogW29lXSBbbWV0YS1vZV0gW1BBVENIXSBzbWFydHk6IHVwZGF0ZSA0LjUuNSAtPiA1LjQu
Mg0KPiANCj4gd2FuZ215IHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIHNjaHJpZWIgYW0gTWkg
MTUuIEphbiwgMTE6MzIgKCswODAwKToNCj4gPiAgUyA9ICIke1dPUktESVJ9L2dpdCINCj4gDQo+
IFNob3VsZG4ndCB0aGlzIGJlIFVOUEFDS0RJUiBpbnN0ZWFkIG9mIFdPUktESVI/DQo+IA0KPiBT
ID0gIiR7VU5QQUNLRElSfS9naXQiDQo+IA0KPiA+ICtkb19jb21waWxlKCkgew0KPiA+ICsJOg0K
PiA+ICt9DQo+ID4gKw0KPiANCj4gSG93IGFib3V0Og0KPiANCj4gZG9fY29tcGlsZVtub2V4ZWNd
ID0gIjEiDQo+IA0KPiANCj4gUmVnYXJkcywgSsO2cmcNCj4gDQo+IC0tDQo+IEljaCBoYWx0ZSBp
aG4gendhciBmw7xyIGVpbmVuIFNjaHVya2VuIHVuZCBkYXMgd2FzIGVyIHNhZ3QgZsO8ciBmYWxz
Y2gg4oCTIGFiZXIgaWNoDQo+IGJpbiBiZXJlaXQgbWVpbiBMZWJlbiBkYWbDvHIgZWluenVzZXR6
ZW4sIGRhw58NCj4gZXIgc2VpbmUgTWVpbnVuZyBzYWdlbiBrYW5uLiAgICAgICAgICAgIChWb2x0
YWlyZSkNCj4gDQo+IE5hdmltYXRpeCBHbWJIICAgICAgICAgICBUOiAwMzY0MSAtIDMyNyA5OSAw
DQo+IFRhdHplbmRwcm9tZW5hZGUgMiAgICAgICBGOiAwMzY0MSAtIDUyNiAzMDYNCj4gMDc3NDUg
SmVuYSAgICAgICAgICAgICAgIHd3dy5uYXZpbWF0aXguZGUNCj4gDQo+IEdlc2Now6RmdHNmw7xo
cmVyOiBTdGVmZmVuIFNww6R0aGUsIEphbiBSb21tZWxleQ0KPiBSZWdpc3RlcmdlcmljaHQ6IEFt
dHNnZXJpY2h0IEplbmEsIEhSQiA1MDE0ODANCg==


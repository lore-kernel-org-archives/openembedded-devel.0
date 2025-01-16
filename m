Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BC73C02183
	for <webhook@archiver.kernel.org>; Thu, 16 Jan 2025 00:39:17 +0000 (UTC)
Received: from esa9.fujitsucc.c3s2.iphmx.com (esa9.fujitsucc.c3s2.iphmx.com [68.232.159.90])
 by mx.groups.io with SMTP id smtpd.web10.37826.1736987954929476218
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jan 2025 16:39:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=KMltQAQ7;
 spf=pass (domain: fujitsu.com, ip: 68.232.159.90, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1736987955; x=1768523955;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=QzHPGCA8x9weBxNJhWx4ldGKWsvUY15qMQ+g+BXq0AM=;
  b=KMltQAQ7JGwlz4GCa8Mkc8nXkQNkvQWZccPDPCVMhveni4JmdlNMbUa1
   AZRMkJAVoMcy7iJJICrq+Gs63aTM9JvQgvaELUyyFS6Evih48XO0vSCSS
   hxYgFVoT2bAYlepr9e4ndu6FBsDErrmJeO4bT0fdTEmyEUyCHUAIT5uFP
   sItlmc5N6I/iAH4YTXx6g4qFK5/08N87xIN5P10Ksj/CBZNUvQJRpNmM+
   af9oBL3wkUZ/xvlLm4RQMeWc97EoUrWPpE+chRhKhLh8HGaBsY7mzYJJJ
   hiZAyGMjH41+jcQTSNAuoSlF7K0BIKaal3G6iQ4OSkWbEUIJQeaZsajmo
   g==;
X-CSE-ConnectionGUID: N9qSopZnSRyrE0Gzm7iT7A==
X-CSE-MsgGUID: +5oJNVMqQFW4YNlw0GEt1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="143099231"
X-IronPort-AV: E=Sophos;i="6.13,207,1732546800"; 
   d="scan'208";a="143099231"
Received: from mail-japanwestazlp17010003.outbound.protection.outlook.com (HELO OS0P286CU011.outbound.protection.outlook.com) ([40.93.130.3])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 09:39:12 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BMxuhLZPplhp+c06X0cymRMcYBt41HuJEWsq2d1sjOH2caN+xfWM91RrAeVqvA/Cgt8NJxO/UcgmbRmuoZzKiYJPHxWMBRMjsdiBKhiNdQY8lLDu63bZ84MYMbn3qsad9CNYUjCQkUrUVB+nBwBFXwSC3bfWxq79VyWfutjwdiXofVaXNYkrbJwZwPcZj0xU2shZbiA3bKt4hrjca+KNMSdui1OiLjg1h8aCfKmiIjZTp158IZreIZtCYAm/J28SzRWkM5gmHs2E0TWT0o5GSHnRh3f/NpUq5dlMz29QFR67cgH4SzzG12bb3QY89TDAL0e4UvW1KcPAmSO9TY59zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QzHPGCA8x9weBxNJhWx4ldGKWsvUY15qMQ+g+BXq0AM=;
 b=PqQBUdNNWXkk4bhoGR/Q7F05dQx+1gHKE7Z9GGRGwxLjOKzmlM97MvT87NiwA6rtp+9wpLStgwqwIhSEjmju0G+V08FLsu9MBaQI6DWXITFq0d79/WFPPXBa2eE0AmFvtt3gdvX1dJCPHO4X+qjtx1GAIS/GPDP6gy2BPtHsp9MY5JetndcIdQYDYaBmblGdCmBVR8G8nClWs/gMXtKneOoxH9CRD9zytbRwFZj6HgXQR/mG+nsmWRwQJduj0U8yQ6p3NkI+jPN0XkQLvGQ9GedvlUFgEGE/u1ui7U+S7DAqYWmP64r1h2nCHbNOMABAvtICZDh2nYlNtGBL2Cv7Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 (2603:1096:400:3fb::13) by TYVPR01MB11244.jpnprd01.prod.outlook.com
 (2603:1096:400:36c::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.14; Thu, 16 Jan
 2025 00:39:05 +0000
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e0dd:28e5:6a6e:2342]) by TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e0dd:28e5:6a6e:2342%6]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 00:39:05 +0000
From: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
To: =?utf-8?B?SsO2cmcgU29tbWVy?= <joerg.sommer@navimatix.de>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe] [PATCH] smarty: update 4.5.5 -> 5.4.2
Thread-Topic: [oe] [meta-oe] [PATCH] smarty: update 4.5.5 -> 5.4.2
Thread-Index: AQHbZv4hy7RzW3j4yk+mlh298M6m7bMXWYMAgAAsgFCAABHngIAA9ufA
Date: Thu, 16 Jan 2025 00:39:05 +0000
Message-ID: 
 <TYWPR01MB118617DA97D501BE821574B74DC1A2@TYWPR01MB11861.jpnprd01.prod.outlook.com>
References: <1736911952-10934-1-git-send-email-wangmy@fujitsu.com>
 <r3pwhezfvqmgh43ejzkjroffsmdoupemdh3q4v6hplgk3zregq@tni3w2fjzwaf>
 <TYWPR01MB11861B18EC4AD9079FF4602B0DC192@TYWPR01MB11861.jpnprd01.prod.outlook.com>
 <p675m3ebzd6qsu6x4kcbbowcg5ejb6bi3mlwjvlehxffklqvbo@muqhgasjljh6>
In-Reply-To: <p675m3ebzd6qsu6x4kcbbowcg5ejb6bi3mlwjvlehxffklqvbo@muqhgasjljh6>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5Njgw?=
 =?utf-8?B?MmZfQWN0aW9uSWQ9YjhjMDBmNjktN2E4Mi00OWQ5LTg4ZTYtM2NiODA3ZjNj?=
 =?utf-8?B?YjQyO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMz?=
 =?utf-8?B?OTY4MDJmX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQx?=
 =?utf-8?B?LTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX01ldGhv?=
 =?utf-8?B?ZD1Qcml2aWxlZ2VkO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFk?=
 =?utf-8?B?NTUtNDZkZTMzOTY4MDJmX05hbWU9RlVKSVRTVS1QVUJMSUPigIs7TVNJUF9M?=
 =?utf-8?B?YWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfU2V0?=
 =?utf-8?B?RGF0ZT0yMDI1LTAxLTE2VDAwOjM0OjMzWjtNU0lQX0xhYmVsXzFlOTJlZjcz?=
 =?utf-8?B?LTBhZDEtNDBjNS1hZDU1LTQ2ZGUzMzk2ODAyZl9TaXRlSWQ9YTE5ZjEyMWQt?=
 =?utf-8?Q?81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB11861:EE_|TYVPR01MB11244:EE_
x-ms-office365-filtering-correlation-id: d3399d00-48c8-4062-d114-08dd35c62e53
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018|1580799027;
x-microsoft-antispam-message-info: 
 =?utf-8?B?ZjE0TDVIYXFEZ3hUOVYxNFdEK28wQU9tU3daTEQ0djNKZm16S0tiL2EySUsy?=
 =?utf-8?B?UEZNOEp1VjhJT0JUMk1QQXVQemV4MXM5NVpjeUZYYlViOTlzVEhTbFQrT1Yw?=
 =?utf-8?B?NHVPUHpwMit6bmRydFZQeW9NaFJsUVROdlJvZUVubUtrcTlYay96NlIxK0xt?=
 =?utf-8?B?UG9SQjAwZWU4NWh6RHZNMjZvOVhIeW1HZ21ib2I1WjlOUFlkWG5abXp2MUNh?=
 =?utf-8?B?b0M5OEZlTlpPbXhNTWp6NVZsTDR0YzUvTlhKZlZsSXo2cXJBVUdpcW1FNnQw?=
 =?utf-8?B?UVhCTlg3QTdqYlZwVkwrVG5uQkl5RWNENDBEcjh2VE1OOWVuTXhzWGZWTFM0?=
 =?utf-8?B?Q0wxK3BjRHJuYzh4OHkzNkFDTWZMa3lzMFdjQjI3U0lRemJFY1FKYWxSazd5?=
 =?utf-8?B?M20vc2NqUzYyOGlaM3AxTWZkVi81ZzY3bE9wVTBDNGhXcEd1T0lLYTd3T3hH?=
 =?utf-8?B?MjZRVEowaFdheG5iY2kzYkRUcDd2U1dGRGhaYlhkNTFidnFLSDhNWEFtR1NU?=
 =?utf-8?B?TVphbkxxWG8vODl4dEcvYnhNOFhydkNtRzhINGZ5Skk1T3g1UXlnbmZWa0Vo?=
 =?utf-8?B?YmFDZFVaTW1Ob2tkOGpnejJYNGdXb0ZJK3lSUmgrN1QrbmU0UGNhc293Yll3?=
 =?utf-8?B?NmF3OXlVWWlDSzVLQ2gvK1h6QlVJTTF6RFVodEgrL2JTRThQRGlONTZadTM2?=
 =?utf-8?B?b0J2blpWdHBURXVrcExFRlZ0aUFkRWRxM0hubUVBVDNQVFJselBETGlzdXI3?=
 =?utf-8?B?c0FneHM2WlhYeGo0WnlYSUhrM2RyeXkvTU1LY0xTdTJYZFBGRE1LUFBKM01y?=
 =?utf-8?B?UzNCcWpqRzZVdjM5dmN4cC8wY0xIbVFQR3pjT3pvQWIzZmtmNk1adnQ4YTRy?=
 =?utf-8?B?T1FTeU1tcGtRdnRhRmVzUzhIL2Z6UWkvQWloYklLcENUeU1FalA1Zm82T0JU?=
 =?utf-8?B?eDk1NnYvVlJNZUpzaldUalN2aHlEZFdaYTh3YTZwaUdEbndDSStTZ2Nvc2ZB?=
 =?utf-8?B?bmZVSFFWcGp4WGRiekQyWTV3UnVaR3ZSM2cvdnVDQlJCM2x0dGNaNG9BZ3M3?=
 =?utf-8?B?L2lIQUR1c29ybmVxTFNQUzFxRjJMaHE1QytBTXRIcEFkejFzckpsSHl5Nzhw?=
 =?utf-8?B?TlN5Q2lLNi9qckRRL25nOEN5aGE0RHQyeE5mRFNtZjRmSWJ5aldqUjdXMnNF?=
 =?utf-8?B?N1hBRjZOSi9LQTg3MTFMVncwM0NhWDFmU0wzWitGR1BXU1MyQjBxcU1xQ0w4?=
 =?utf-8?B?dlI0NVJUNmt4a2JQU0dTakcveUNYbXExOFRHaGk0K2RZU1VPVys0cE1rTFRk?=
 =?utf-8?B?c0VUdVJyK3NrUEIwRzM0Y3BEOHdENTN0Nnp5am9nQ1hPVW5MTGRJSUxtSm9V?=
 =?utf-8?B?dVl5b0djNjBnYlJUNTYwV3FvOUR3dVBQaFdydEhxdCtyS2ZGQmJGajdKR3Er?=
 =?utf-8?B?VnlsYnVQUUlpNjY2dmdza1Nvc3U1eDE0OFVzQVNNUXVIc2JKUGFyMjB2SFdE?=
 =?utf-8?B?MEd1TDgvU25za1VUTkRqaEUrUTBjb3NlbVJ6YitzQk1pcXlFblI2VUpFdDdO?=
 =?utf-8?B?VlJvYitjeFdpYy9QUWxSV2FDQkpPcXIwdW5RNy85VVdwZ1FZN2J5Wlc4VlNr?=
 =?utf-8?B?ek5BdDFLWUZrbkJhYXlhV0t5bDNZZ3JPWW1WYjl2UXFZcFJ3NlJZaWJEVC9w?=
 =?utf-8?B?NEJCYkZ5Umh2L2l4ZXIyakx2V1hRU05HbVdDcFM5OXJlMFMyVXhQRmtMNEhF?=
 =?utf-8?B?Vy80WlpUcDNXUVVZampjNXZNRGl1Si9vN3lteDYrdHJkQkN3NnlJbmliM0Zq?=
 =?utf-8?B?M0N5MmJtNWt0Mm5lV0tPbkJDL1J6L04zVkV4bncwZTJadWZKKzl4Mm1Oc3JW?=
 =?utf-8?B?RkJsWTVCVU5VZzVPQ2ltZzBOaCt4SGtVYkVMUm5KNFVmYVE9PQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB11861.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NkF3KzJFU0JTSlBGUC92dHg3NmQ0WGhsV1RRMmVSUUlaR21iTUYrNjRJVnJj?=
 =?utf-8?B?bmpnSlpnREtRdExNbGJrSW5zOWw4TVJ4RmdPMW5RUEJyOWVWMEh6dVNlU3NP?=
 =?utf-8?B?UW9TVHZ3NE9yeVdZZGxMTU9hSHd5dkM2YXdVWkMvUElJSXpzUEd1WXExSEhQ?=
 =?utf-8?B?R3NBVEFaYURkbFdlQXdSSURJTm5zM1hiRzFZS0RPUWxSNjJ4UjNXb3JIRnFa?=
 =?utf-8?B?SHhQbDlidmw1aUU2b2JWTFkzNUlxSEJoaWZCMHYyWFF6MmtnR3RxdkRKZTM0?=
 =?utf-8?B?K1hNTGJQUGxiNHJldFc2THcrS0x6UjNDcTJKbEVZdXpRa0d3ZDVVRnJoMnlK?=
 =?utf-8?B?UitMdllqVU1nZmpWemEyZzNGUlVvV0xTTE5teW9XaGlxUURuenVtdFdTU0dy?=
 =?utf-8?B?SGdZbE5VaVhNN3RuMTg2RHA1REU3VnFoc1kycWFwdktUQTNYbE5QNWg3Z042?=
 =?utf-8?B?YjRRS0Q0MGlmZHpDTzNLTUpzVGNHSFBZZWFGNDdaWDBiRXZHeTh0R29JNFdp?=
 =?utf-8?B?Zy9QNUtoVEE1ZWFKdEtCZnJWU3doTnJzZksxaUIvS21VZ1kxS2VPNDRkbEQ4?=
 =?utf-8?B?SDJwUC9VM0JTRHA5MTYrZHNzdGhBRXlNL1luYm1QeXdOUTBOU1B6dzVUeS9x?=
 =?utf-8?B?cWR0OVhiOHl1dFEzQmRZT2hZYWNNeTZqajdRQjYzdVlRUzNGWklqTkxmNUhB?=
 =?utf-8?B?cWx5NU04VHRmMnh6Q2tJZFVadjFXeFp1MUgzaUJJWUlMaHMvY3BEY2xqZm1s?=
 =?utf-8?B?VEFFeVVhcm9rSEQvYkVaZXZUbGxuSVQvVjc2dnIyT2NFajg5VElCTmdWa1dX?=
 =?utf-8?B?bGF2TDlZT3YyeFJsRzZLUGNWalY4VWtIWUQyK1lmOWhTT1paWlVra2RsVGJi?=
 =?utf-8?B?c21vZUtvSDdpYnVmRWFONVBsaEFoVnZ6dmJzZG5JaXo4cG1uS1draEpRdkNP?=
 =?utf-8?B?ZmdpWERvRHVQL3pQaTE5T3QwV3BFV1YydFlnbkdPU3pDekUyVytXWkUxUmd5?=
 =?utf-8?B?aEtZSWlMaWJseWI0ODNCVXZXRmNGZGg3Z3Z2V281VHFZNjcrNll4Y2ZjaDR5?=
 =?utf-8?B?UjFaQSsvNnZ3cmR4cE5ZTkVZcTdDaWJUTnpKaCtHc21WOS9NYmpFRklmK2Zo?=
 =?utf-8?B?OTArb0I1a3h4emd0bHdEUHNnNG5FV1RTTkZBS3hlSlJnb3YvNTdqbmRjUTRZ?=
 =?utf-8?B?WGVubGtuN01UTzlCcEFIRzdpN2IvWW9PNkNMd2x6djU1TXhrcmNJVWZab2N6?=
 =?utf-8?B?NllhM281NlF6d21jY0pyLzdhZXVYMnNFd3pGV0lnNVhpZHY3dVhhYXA2Ukc0?=
 =?utf-8?B?R1FFT3BMWkpPMXh3Tldyb0NlM0FJNjVDUUYwaDQ3eE9ZamlKT3BsWXF1Rktu?=
 =?utf-8?B?MnVoYVBnQk1tSUVJSTYvQlBiRFV6WllIS3BDWTlaeXFWejU4MjNkcDV5WHRS?=
 =?utf-8?B?MkpQVjZRV0h4V0xGSzNvZnV6ODZkaWo5MGpYSU9RRVE0V3NQUEFDcG9DQnJ4?=
 =?utf-8?B?c3NycHZxc2dISGNOY3ZpYmhyamQ5Zk10ZlVrcjZzaGdxTzZySzFKNUJEbGtk?=
 =?utf-8?B?QTJZWjJzODNoRlE0Z2xYcHJCaExXNE5Zd0ljY25WRnFsYXYwUlFIa3JiLzhS?=
 =?utf-8?B?emthZGVrcDJrWGNtaDZQYmpsRTdtZ2o0Q1BCMkpVaHdWck8wY3NHL0RWT1BF?=
 =?utf-8?B?QWMzZWlwNHpESEFGUS8vMzlBV2F4azZPMDFvT1cvTnBjZ3lyNkIyOEpEa2ZX?=
 =?utf-8?B?b0pWQVp6Mm5VazdCU2RySmVwa0NHUG1yZnorY2RDeExRZVdxRkN5MCt2bWdq?=
 =?utf-8?B?UlVDRmVKdkZScW5oWEZmVHg0M2t0T2ZnYmNaSUdqRXYrWVdRMDRyK2xwaTB1?=
 =?utf-8?B?dC9RZVNJM0Y4STRNVjQvTldGYTFmZ01vRC9hSHZ4SXdFUTIrUTRxMGQwSGlv?=
 =?utf-8?B?R0ZwK3YwVUxOT1RWN3MwMXdPblZKQlp6d1JyV3lXbU9wNmdhMzd5a2IzSnox?=
 =?utf-8?B?NzNkaFBHdUVpd3h4RDcxWG5DNzNKVVpZWmhEQTN6Q2MrZk9hQkFtZmVJem5W?=
 =?utf-8?B?U0t6NW5rVDk2cUJidjFBdWpYOHRtdVQ3ZGJIWTJTU29FelQxOWEzbnpKZ0lU?=
 =?utf-8?Q?UHwN125WkEI7R+6R63WGKyYcp?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	v+YdBDtSIzdsijLdbtaUsRkTbvyaA14OrHq7gTkRk9FpOmW+jF4S9mFBLkh7E4p0Scpm8e9H8Vy+1D1Y+xqimReMEy1kW82PDP2CjP4YMJrmR6ZunCWl2ZRH5JBK+ryO4alrFHz3JDcb9haujJJtBWlo0AwU16wKYXuwiFBY0g1lzQCkzqgcPXiH7k6bCSui++Y0YybJPjQlJGVWg81TDoyywaW+x7EJsUemAo6Krlj2cXBr24oWXVVbpBYor7lWVPQ4omOKCpVMDLiFGwS94cls2gzpzMlYBlAzCqcOYMxgskypMttPB1Lldr/SE3e2YSjZXh2/W9w5hGIDIMapEkU8ylYDlz+/MM8RZqnSxy3YjmYekEL10tEN1IuwSTYxzawS5Rew8+CGjSZM5PiJS7fnI9cOMnLpb2TCJWvX2iTTvwpO1QQwp03SnsRSZYI2AXnxmRIa1WZVB1NGO3EWPAgQmG9n8P3IBJJcjQ+MxHu6alkxoBQWtEEMP3ONdx4lESGAXypKHyDS93Arpt/wyYCq9GT0G4aPYEi0Ui4YlQ/hO+fcIIpJcIXTfczcYzQpTTJeeepB2zLJrKugicrG/JGzth7jFw6RtaCaeIOwOFGW6wWl6q9bZb9nYGleafCs
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11861.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3399d00-48c8-4062-d114-08dd35c62e53
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2025 00:39:05.3324
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: McOul/Sv/KFhdmxizvAClM++3uR2u93yyjO9n3CqSR9J0sktmVWHgURRoq9IHiYJBnEOLelCqQtxom3hEoIo6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB11244
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Jan 2025 00:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114904

QWRkaW5nIHBocC1uYXRpdmUgdG8gREVQRU5EUyBhbHNvIGRvZXNuJ3Qgd29yaywgaXQgd2lsbCBy
ZXBvcnQgdGhlIHNhbWUgZXJyb3IuDQoNCkJlY2F1c2Ugc21hcnQ1LjQuMiBzdXBwb3J0cyBpbnN0
YWxsYXRpb24gdXNpbmcgY29tcG9zZXIuIE1ha2VmaWxlIGlzIGFsc28gdXNlZCBmb3IgY29tcG9z
ZXIsIGJ1dCBZb2N0byBkb2VzIG5vdCBzdXBwb3J0IGl0Lg0KWW9jdG8gY2FuIGluc3RhbGwgc21h
cnR5IHRocm91Z2ggZG9faW5zdGFsbC4gVGhlcmVmb3JlLCBpdCBpcyBuZWNlc3NhcnkgdG8gbGVh
dmUgZG9fY29tcGlsZSBlbXB0eSB0byBhdm9pZCBleGVjdXRpbmcgbWFrZS4NCg0KICAtLQ0KQmVz
dCBSZWdhcmRzDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0NCldhbmcgTWluZ3l1DQpGVUpJVFNVIE5BTkpJTkcgU09GVFdBUkUgVEVDSE5PTE9HWSBD
Ty4sIExURC4gKEZOU1QpDQpOby42IFdlbnpodSBSb2FkLCBOYW5qaW5nLCAyMTAwMTIsIENoaW5h
DQpURUzvvJorODYrMjUtODY2MzA1NjYtLTg1NjgNCkNPSU5TOiA3OTk4ODU0OA0KRkFYOiArODYr
MjUtODMzMTc2ODUNCk1BSUw6IHdhbmdteUBmdWppdHN1LmNvbQ0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IErDtnJnIFNvbW1lciA8am9lcmcuc29tbWVyQG5hdmltYXRp
eC5kZT4NCj4gU2VudDogV2VkbmVzZGF5LCBKYW51YXJ5IDE1LCAyMDI1IDU6NTEgUE0NCj4gVG86
IFdhbmcsIE1pbmd5dS/njosg6bij55GcIDx3YW5nbXlAZnVqaXRzdS5jb20+DQo+IENjOiBvcGVu
ZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW29l
XSBbbWV0YS1vZV0gW1BBVENIXSBzbWFydHk6IHVwZGF0ZSA0LjUuNSAtPiA1LjQuMg0KPiANCj4g
TWluZ3l1IFdhbmcgKEZ1aml0c3UpIHNjaHJpZWIgYW0gTWkgMTUuIEphbiwgMDg6NDcgKCswMDAw
KToNCj4gPiBTb21ldGltZXMgdGhlIGZvbGxvd2luZyBlcnJvcnMgb2NjdXIgd2hlbiBleGVjdXRp
bmcgYml0YmFrZToNCj4gPg0KPiA+IERFQlVHOiBFeGVjdXRpbmcgc2hlbGwgZnVuY3Rpb24gZG9f
Y29tcGlsZQ0KPiA+IE5PVEU6IG1ha2UgLWogNA0KPiA+IHBocCAuL3V0aWxpdGllcy9tYWtlLXBh
cnNlci5waHAgc3JjL1BhcnNlci9UZW1wbGF0ZVBhcnNlci55DQo+ID4gc3JjL1BhcnNlci9UZW1w
bGF0ZVBhcnNlci5waHANCj4gPiBtYWtlOiBwaHA6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkN
Cj4gDQo+IERvZXMgaXQgaGVscCB0byBhZGQgcGhwLW5hdGl2ZSB0byBERVBFTkRTPw0KPiANCj4g
DQo+ID4gbWFrZTogKioqIFtNYWtlZmlsZToxNjogc3JjL1BhcnNlci9UZW1wbGF0ZVBhcnNlci5w
aHBdIEVycm9yIDEyNw0KPiA+IEVSUk9SOiBvZV9ydW5tYWtlIGZhaWxlZA0KPiA+IFdBUk5JTkc6
IGV4aXQgY29kZSAxIGZyb20gYSBzaGVsbCBjb21tYW5kLg0KPiA+DQo+ID4gSXQgc2VlbXMgdGhh
dCB0aGlzIGRvX2NvbXBpbGUgc2hvdWxkIG5vdCBiZSBleGVjdXRlZC4gVG8gYXZvaWQgdGhpcw0K
PiA+IGlzc3VlLCBJIGFkZGVkIGFuIGVtcHR5IGRvX2NvbXBpbGUgaW4gdGhlIGJiIGZpbGUNCj4g
Pg0KPiA+ICAgLS0NCj4gPiBCZXN0IFJlZ2FyZHMNCj4gPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiBXYW5nIE1pbmd5dQ0KPiA+IEZVSklU
U1UgTkFOSklORyBTT0ZUV0FSRSBURUNITk9MT0dZIENPLiwgTFRELiAoRk5TVCkNCj4gPiBOby42
IFdlbnpodSBSb2FkLCBOYW5qaW5nLCAyMTAwMTIsIENoaW5hDQo+ID4gVEVM77yaKzg2KzI1LTg2
NjMwNTY2LS04NTY4DQo+ID4gQ09JTlM6IDc5OTg4NTQ4DQo+ID4gRkFYOiArODYrMjUtODMzMTc2
ODUNCj4gPiBNQUlMOiB3YW5nbXlAZnVqaXRzdS5jb20NCj4gPg0KPiA+ID4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IErDtnJnIFNvbW1lciA8am9lcmcuc29tbWVyQG5h
dmltYXRpeC5kZT4NCj4gPiA+IFNlbnQ6IFdlZG5lc2RheSwgSmFudWFyeSAxNSwgMjAyNSAyOjA3
IFBNDQo+ID4gPiBUbzogV2FuZywgTWluZ3l1L+eOiyDpuKPnkZwgPHdhbmdteUBmdWppdHN1LmNv
bT4NCj4gPiA+IENjOiBvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0K
PiA+ID4gU3ViamVjdDogUmU6IFtvZV0gW21ldGEtb2VdIFtQQVRDSF0gc21hcnR5OiB1cGRhdGUg
NC41LjUgLT4gNS40LjINCj4gPiA+DQo+ID4gPiB3YW5nbXkgdmlhIGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcgc2NocmllYiBhbSBNaSAxNS4gSmFuLCAxMTozMiAoKzA4MDApOg0KPiA+ID4gPiAgUyA9
ICIke1dPUktESVJ9L2dpdCINCj4gPiA+DQo+ID4gPiBTaG91bGRuJ3QgdGhpcyBiZSBVTlBBQ0tE
SVIgaW5zdGVhZCBvZiBXT1JLRElSPw0KPiA+ID4NCj4gPiA+IFMgPSAiJHtVTlBBQ0tESVJ9L2dp
dCINCj4gPiA+DQo+ID4gPiA+ICtkb19jb21waWxlKCkgew0KPiA+ID4gPiArCToNCj4gPiA+ID4g
K30NCj4gPiA+ID4gKw0KPiA+ID4NCj4gPiA+IEhvdyBhYm91dDoNCj4gPiA+DQo+ID4gPiBkb19j
b21waWxlW25vZXhlY10gPSAiMSINCj4gPiA+DQo+ID4gPg0KPiA+ID4gUmVnYXJkcywgSsO2cmcN
Cj4gPiA+DQo+ID4gPiAtLQ0KPiA+ID4gSWNoIGhhbHRlIGlobiB6d2FyIGbDvHIgZWluZW4gU2No
dXJrZW4gdW5kIGRhcyB3YXMgZXIgc2FndCBmw7xyIGZhbHNjaA0KPiA+ID4g4oCTIGFiZXIgaWNo
IGJpbiBiZXJlaXQgbWVpbiBMZWJlbiBkYWbDvHIgZWluenVzZXR6ZW4sIGRhw58NCj4gPiA+IGVy
IHNlaW5lIE1laW51bmcgc2FnZW4ga2Fubi4gICAgICAgICAgICAoVm9sdGFpcmUpDQo+ID4gPg0K
PiA+ID4gTmF2aW1hdGl4IEdtYkggICAgICAgICAgIFQ6IDAzNjQxIC0gMzI3IDk5IDANCj4gPiA+
IFRhdHplbmRwcm9tZW5hZGUgMiAgICAgICBGOiAwMzY0MSAtIDUyNiAzMDYNCj4gPiA+IDA3NzQ1
IEplbmEgICAgICAgICAgICAgICB3d3cubmF2aW1hdGl4LmRlDQo+ID4gPg0KPiA+ID4gR2VzY2jD
pGZ0c2bDvGhyZXI6IFN0ZWZmZW4gU3DDpHRoZSwgSmFuIFJvbW1lbGV5DQo+ID4gPiBSZWdpc3Rl
cmdlcmljaHQ6IEFtdHNnZXJpY2h0IEplbmEsIEhSQiA1MDE0ODANCj4gDQo+IC0tDQo+IOKAnEl0
J3MgYmVlbiBzYWlkIHlvdSBhcmVuJ3QgYSByZWFsIFVOSVggc3lzdGVtIGFkbWluaXN0cmF0b3Ig
dW50aWwgeW91J3ZlIGVkaXRlZCBhDQo+IHNlbmRtYWlsLmNmIGZpbGUuIEl0J3MgYWxzbyBiZWVu
IHNhaWQgdGhhdCB5b3UgYXJlIGNyYXp5IGlmIHlvdSBhdHRlbXB0ZWQgdG8gZG8gc28NCj4gdHdp
Y2Uu4oCdDQo+IA0KPiBOYXZpbWF0aXggR21iSCAgICAgICAgICAgVDogMDM2NDEgLSAzMjcgOTkg
MA0KPiBUYXR6ZW5kcHJvbWVuYWRlIDIgICAgICAgRjogMDM2NDEgLSA1MjYgMzA2DQo+IDA3NzQ1
IEplbmEgICAgICAgICAgICAgICB3d3cubmF2aW1hdGl4LmRlDQo+IA0KPiBHZXNjaMOkZnRzZsO8
aHJlcjogU3RlZmZlbiBTcMOkdGhlLCBKYW4gUm9tbWVsZXkNCj4gUmVnaXN0ZXJnZXJpY2h0OiBB
bXRzZ2VyaWNodCBKZW5hLCBIUkIgNTAxNDgwDQo=


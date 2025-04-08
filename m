Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D8DBC369A1
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 07:28:58 +0000 (UTC)
Received: from esa11.fujitsucc.c3s2.iphmx.com (esa11.fujitsucc.c3s2.iphmx.com [216.71.156.121])
 by mx.groups.io with SMTP id smtpd.web11.69175.1744097331823574500
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Apr 2025 00:28:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=EWv8Clzy;
 spf=pass (domain: fujitsu.com, ip: 216.71.156.121, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1744097331; x=1775633331;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Cezo/oWc0u7F1VMAD241fEtX5rN5rcNbCJQPOwcDVvQ=;
  b=EWv8Clzy1JcSMAj+hVW/icMl7xj9bSQvP1sn0zfZW/fAtANdXjW9npNy
   rvtUY42dlEBN7gKBu3roDC3LStHR5Enmht0mOs8cR7JSPBlxn5bOqXYsf
   JsSLW0r079ayW+oQMKcSKSWRevhIRkcWCdjJbGcUMLSIN1DyxNASXe/fA
   9YjIMgDPBfoL4xR3g49oDOxJ5wNvSJEDic3mlMqSLZ0zCEP7iF5i5poD3
   JyXC5I5d2Uo8auvy2N9Hg0/86olbtVbTlXhXSDs4L9pBuwYWa6+51Bmkf
   PZZZModxd2RW0749y6jiyonTFDVTH82LpSXSigRbexd9ulctKcwGRaiiC
   g==;
X-CSE-ConnectionGUID: OJOHJ7ulRjKqbrd4gOtYvQ==
X-CSE-MsgGUID: SH2aLeRZRQO07n8Exo65SA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="153007455"
X-IronPort-AV: E=Sophos;i="6.15,197,1739804400"; 
   d="scan'208";a="153007455"
Received: from mail-japanwestazlp17011029.outbound.protection.outlook.com (HELO OS0P286CU010.outbound.protection.outlook.com) ([40.93.130.29])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 16:28:48 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lv+KFFFxTOBbmz0240dw6Sw0GhZkG5UGCM0Bx0l/qVbrrZEMPrOGJVcB/omakVowe4TUQaB3JRntxFM2o9Egihhh9ZRpB2zmk4yvrPowx6Q3xCtg6tBPJ25E7ejSj5qwXxA/OQ2vi4eYhQtH3e0MglX3MF4TRhlHPd+u7I4eK8RPmU/B5nj7+6pIZ1Z6F4XohzFeBQMffBk0tg/EusJHmSvQlvHAsCX7SImOUq/VpzIMNlgU1TE9h5ecDg1TJYbK7Awgj9A05vDshe6myo0CHOkXZyHzCIROKmgdpsbH15SUeSqXG+3+ZrpZXXLSR66i0+nj8uUfW9gkeTQgrqouzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cezo/oWc0u7F1VMAD241fEtX5rN5rcNbCJQPOwcDVvQ=;
 b=g8/62jnn95Tqocy8IcAVDdfPMKtSu20wplx4rQhKGXu1QkjiLRephNDNrSB7NsleVkROPCcJSIR3/eOYY787GNRbZ2uuUSzwpibMLG03sWMM5Ad+E0439AmeFcyCRpZbwMpezDS8C0TBWS3QdohqeNeS8J0VYTGxJuVe50/g7KUR2yl7+VwXSujUCywVhzHdB9sJPzfRTC45T84tsLGjdGOy2YZAiDF3Hvq9k0K83PhIvyQDjj9wtwwvgnb4XCVf286qXHbYxZ/7VcGocl93Susl9C3o7F78FCAZXBGsRVe/FAkxs9jUWDRRksjfLz7CkLm6OyAPwjEHoexEmwBljQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 (2603:1096:400:3fb::13) by OSCPR01MB13377.jpnprd01.prod.outlook.com
 (2603:1096:604:332::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Tue, 8 Apr
 2025 07:28:42 +0000
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e0dd:28e5:6a6e:2342]) by TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e0dd:28e5:6a6e:2342%5]) with mapi id 15.20.8583.041; Tue, 8 Apr 2025
 07:28:42 +0000
From: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
To: Gyorgy Sarvari <skandigraun@gmail.com>,
	"linux-yocto@lists.yoctoproject.org" <linux-yocto@lists.yoctoproject.org>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [linux-yocto] error of tiptop
Thread-Topic: [oe] [linux-yocto] error of tiptop
Thread-Index: AdujrHwaXif0pN2pR32+YCy4a4R1JwAvnEOAAPrqZuA=
Date: Tue, 8 Apr 2025 07:28:41 +0000
Message-ID: 
 <TYWPR01MB1186183EAB588828FDA06A60BDCB52@TYWPR01MB11861.jpnprd01.prod.outlook.com>
References: 
 <TYWPR01MB118613486A025B1F8AE633026DCAF2@TYWPR01MB11861.jpnprd01.prod.outlook.com>
 <400fa42d-4c27-4ef0-86f4-62046b0cd021@gmail.com>
In-Reply-To: <400fa42d-4c27-4ef0-86f4-62046b0cd021@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5Njgw?=
 =?utf-8?B?MmZfQWN0aW9uSWQ9MDAyNTZlYTAtZGQwMy00MzBjLTk2YTktNjZhYWFkZGRi?=
 =?utf-8?B?ZGZlO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMz?=
 =?utf-8?B?OTY4MDJmX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQx?=
 =?utf-8?B?LTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX01ldGhv?=
 =?utf-8?B?ZD1Qcml2aWxlZ2VkO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFk?=
 =?utf-8?B?NTUtNDZkZTMzOTY4MDJmX05hbWU9RlVKSVRTVS1QVUJMSUPigIs7TVNJUF9M?=
 =?utf-8?B?YWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfU2V0?=
 =?utf-8?B?RGF0ZT0yMDI1LTA0LTA4VDA3OjE5OjQzWjtNU0lQX0xhYmVsXzFlOTJlZjcz?=
 =?utf-8?B?LTBhZDEtNDBjNS1hZDU1LTQ2ZGUzMzk2ODAyZl9TaXRlSWQ9YTE5ZjEyMWQt?=
 =?utf-8?B?ODFlMS00ODU4LWE5ZDgtNzM2ZTI2N2ZkNGM3O01TSVBfTGFiZWxfMWU5MmVm?=
 =?utf-8?B?NzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX1RhZz0xMCwgMCwgMSwg?=
 =?utf-8?Q?1;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB11861:EE_|OSCPR01MB13377:EE_
x-ms-office365-filtering-correlation-id: 677ba261-ed18-482a-cee9-08dd766efcf7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|4022899009|1800799024|38070700018|1580799027;
x-microsoft-antispam-message-info: 
 =?utf-8?B?ZTU2Q3BCb0VZSjhSVE1KU1doU2NsWGNaR2RLMUJMdGZJZ1BhenFxT2xvM1Q5?=
 =?utf-8?B?dWgvUWVFcHhoeUl4Nlp0ckZnZGFuWGUrdXljYzVuQ1U2Q2FWTTBiaU14TWxm?=
 =?utf-8?B?ZzlEK2o2NG1qL0R1Tjg0ZzdVYXdVT0ZYeDBOZjVNUDZQemNkS0k5NWVqY29E?=
 =?utf-8?B?RWJ1d1UrKzd6bVNXNE1NT0RpVnhPWDZlbHluUHVndFhuQ2wvUVFraGVjcU8r?=
 =?utf-8?B?NUdnbmpYSEtZYUxoM1dKOU9iRGRuby9vUkdPdUs3RXBCd25xWFErRTlZR3Fm?=
 =?utf-8?B?d0w3cmVRek9Ndjc2NTNkQW4vY01LNXQzT0dkbDVZSkV5N0Y3b1YwS1FzbWg0?=
 =?utf-8?B?aDBhWVNwZFVmOXhzZW5FRG8yY1d2ODhLQWowMUpmaVo1SktYendaNVdLbGsx?=
 =?utf-8?B?U3VNcnd6ZDgyVVZyTTUyendRY0lyWmtTajdsSk5rcG13NG9FNGVFQkVGWmR2?=
 =?utf-8?B?U1FBZS94Rjh6NmlkejVrNmNIbDdpc3VFV0xzc2xsa1dPK2xHRFgybDBhQjFL?=
 =?utf-8?B?dUpZY0syekMxR2tNU3pGeEEwSUhTNEQzZ1NkWEJ4czlGVU5CaitqaGliWC9t?=
 =?utf-8?B?T2JhNVl6OUFEYXZYTjVuelFGUEs4ZlpwV1FFWnJTd2plY2Z2OHR2aWwya3c4?=
 =?utf-8?B?eG5pMTRpbTQ4bGZTbTNZS0pBa1RQTnBtNlQvOXkvajh3d1Fjc3llR1N1KzlR?=
 =?utf-8?B?anVKN2hGVGs5S0FwbGsvcVpLbmxET3ptL3BIRHJ2QUhMeitPZHZZODRDb0dE?=
 =?utf-8?B?cUdqMEdsYklkcW9Ta2NObmE4K0JjREFzZDFNYVRQdEFYN2NPR0lXeUx6cE50?=
 =?utf-8?B?K2ZUTGpVRE05djEwY3RpMG91cVFEc2kxTVJRMVNxWTZLRVo2aXF6aGgrMitN?=
 =?utf-8?B?Rk1OSlMxSVB0MEdmNHJHMWVGRm5wMDNuZWlxYWhVRURyVXIzb0tZWW96MTZW?=
 =?utf-8?B?VG8rdFNYb3lDUm5tcHJpVHh5V2VJb0pXNTMxeDBJV2dEZVp0RnluYmxHWTNt?=
 =?utf-8?B?RFZxUkZJWWFkYnI4OHA5VVFERXR1TFI2WUZVQVgrcitmd2xURXdkSzhoM1lY?=
 =?utf-8?B?dm5hdC80bjRrNlhYODRrZjF5TnBNRTBwRUttbkQra1Y3Y3hvSjNUN0NONjQz?=
 =?utf-8?B?b0IrU2U3TzBHR2d4S2R5SCsxWk9POTIxb0lDY0tUN3RWWExCTDJ6ZWpzay92?=
 =?utf-8?B?V1N6Q1h2ZmQyc1BjWHpUeVZrUlBhQTRoQmZ2QS9ub3ZKaDVyaXRlQTZGc0tN?=
 =?utf-8?B?T3RqMjFsR0h4Yy9OUytIMlNPUUozdld2MVJ3eGpWR2Zkd0k1SllGNFpqZ3M0?=
 =?utf-8?B?M2Z2TlY3WEhvYWhOMTdyd0pXVnhCTTZMWC9rSlg3SVJNRGx4aHlFV0wwMUFo?=
 =?utf-8?B?OHViaHI5dTFENzZxMW9wTU1RM1kxTTJjd05nUFRHQ2E4SThiUFdIUm1BdzRh?=
 =?utf-8?B?L0xha3UzMDhpZW93b2haMitZQW1uNFczbWZRVHNRUkVtZzhGOEFvcG1zYTZl?=
 =?utf-8?B?S2JldkRwRzlLbFd4OXZUYndFc2tzc01RVDhPVitUSE05N1hVdTlWaDR5TjZx?=
 =?utf-8?B?L3ZmZTdpRmE0ZzVVY1hTc3lJRENYd0NNZ3M1V1BNdVdVQzJiL2ZSb1RhajNv?=
 =?utf-8?B?VThBNm4ra3hOVi9MSkJZeEdDNnZqcWZIVWQ4aFFMbGNGaUZ4eFcwQldENHBv?=
 =?utf-8?B?YXdyWUxrV0g0c1ZVdzc4cmhMRXl5QmRFOTJzcG44T1Zqc0NCK0JoNnJERU9O?=
 =?utf-8?B?b1dtclhnNEpiWjhNS0N0WXB2YitGYjU5QkV2Qi9tM3Q1SmhwZlBsSnJtWjhv?=
 =?utf-8?B?ZFBMY2tQTTRJekpKYjBEQ0MxUldJTS9pODVMRU5WRzk4QlVub05VWGRiQ1do?=
 =?utf-8?B?eVZDc0l1d2Q0NTRQNEJMQ2Y1ZnVzQXYvTXppclF5M2FoS0ptOE40bUQrSkdx?=
 =?utf-8?Q?5exlKm+2jAPHMox32osCUdr+VYJ5dKB1?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB11861.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(4022899009)(1800799024)(38070700018)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?U3NWLzJjYWpjbVJKZGlkajd2M3cyK2VpL2ZHemZ3bUZSWmRjaldRYjBrN2JG?=
 =?utf-8?B?WERzZ3hETllNTFFWVlYyU0NMK2U4aDBWWmF1eG1UMmQvblV0NU44M2hwT3lB?=
 =?utf-8?B?bVZqSE5IZW1lKzJOakFIQkFXbmo1dHN5aGphQnJjNXR2MTU2a2VpVE9Rc3pV?=
 =?utf-8?B?SDcyaWdvMmN3cWQ1NmVWV2pLM1ZPWkJkazFTaStEMk9od25uNk0zbi9BTXp2?=
 =?utf-8?B?bmxyZDVvK2ZjdXhSanprcnBiMGJqa29jRkNxNGJwSkNndEU2YjlVY1hIcXBo?=
 =?utf-8?B?aXlZdGxWcE1DeDhUOE1rN3liSHFOOTByaFo4V2dDcFBOeXFiMzZFOVFUR2JU?=
 =?utf-8?B?OENxcGJ4WkMxUFV6QWJORkZ6Z0N4ZFNXVEYrUEhJaXhmc0NRWmMvQlY1Wjlt?=
 =?utf-8?B?V3VCTVY4N3Vlbko0OTM1bDN4RWpoYkM1RXpDUjNlcjNqSmd1TUdZKys3aUs2?=
 =?utf-8?B?RlR4cVovam9Oa1pyTG5vSjh3bnJvbXBNenA0Nnd5aTZhTjVNNFNSS2ZkdlZF?=
 =?utf-8?B?dlp2TXFsZHNaK3JiMitTYUFqVG5lVXBHVjZZdXExTUJvTmZKbTQzZVo5bTVz?=
 =?utf-8?B?R0pwclRtRk1xMGtpYktBQmh4b0lEbC8vY3BkMEVVU1JSajBOTlpoWjIveXJu?=
 =?utf-8?B?YTBsMVE3RVhtVmFHdmc4UW9YMUFPSU15Q3BvWjJ2ajJIYnVISEhxRHR1Y3RO?=
 =?utf-8?B?bGs1blZ2Y0oraFlyeWdVdTZvNFFFWURhZU4xZjVnK1RBUElVWHJndmhQcjhS?=
 =?utf-8?B?ZUdkWitPWjdpTFpkVTRSM3pmMzVFK3lvVURndDZjbTIyT1hUTnZ1TW55a05F?=
 =?utf-8?B?RFdSaGhMcytMbm5kak14a0hwdisvMlpabmE2S0wyTUVtRzI3YlVFZ2haektV?=
 =?utf-8?B?eE1FcjAydEIyTjJGOTZpOC91cDRzQmRrZFNVeXF4YlRteTVxd3NkT0NiRmlZ?=
 =?utf-8?B?NCtGUWVITTdYckVITFNwc2NYS0srQUVrTUVsVDlPbnN3N1lMeEtsdVVRRkN3?=
 =?utf-8?B?bFhJcXRWUm55d0l5a0VVVTBIMGw3MUhsY0pwRXVjMG9maE1pZ3ZiaWtpMzFo?=
 =?utf-8?B?bHM5LzRHRmhxbUdPd2lhdUFKeERZZFpuQkRMbWlTVzZwOWVIdVp3QmtXZmIx?=
 =?utf-8?B?MGg4RmVLeFhIOW1lTXNyMlRLSmtPVWpwR0J4L3drZEx2aVBFOU1oQXF6VGRP?=
 =?utf-8?B?dGNabmR6eXIwNE95bklaSFZIT05Gc3NJU3lNTVBXZG1GajY2NnpzRUZSMTdy?=
 =?utf-8?B?ay9pa0lNVjFhR3lzVVJ2blc0c0J2NmorL2pjaVZBcm9hcitzcTNUTWhJSnBp?=
 =?utf-8?B?Z2VsV1lEOFNwOUIvOS8zV3NGb3BMTE8wUWkwQzNjNGhWTmtiZXZtazk1NExj?=
 =?utf-8?B?bElaQ2p1NDVZcThXS1hxa0ZZcGtYbklmckZ6SXoxbDJ1VEVDZlpmSi95SW1N?=
 =?utf-8?B?aEU4WjB5OFVONlpyUWtZMEdFeGlkS0FaK2sxUjBHbEo0dEdYNk85bVlETm9P?=
 =?utf-8?B?bnFtYW45cUN6bEJ1dUp3L29aWGlndVNnaDVFNHBQZmRKRi9SaEthajcyU3Jr?=
 =?utf-8?B?bHFCbk02bjBBL2h1OVR6NXlmMHBZRk5aMzN6S1R3WTZONHJuTHBTK3ZFRXFS?=
 =?utf-8?B?dTRxV0k5V29BYmoxY244K3lWM0Jsanc1NzFFM0c2a3psZnFJV2s3V0drQ21V?=
 =?utf-8?B?Z2ZMOC9zdjQwUXNiWENDd1FEQmtHd3NxTmJaYXp6TVc4WmtwUExGMjhsNm9B?=
 =?utf-8?B?cHlsYkFyOVF5Z0lYU2hRbTBVREYvOS9GdlFSVi9GY20rSnhjNGhWU1pvUkM5?=
 =?utf-8?B?TmpqUDVoRDRGWDdXQ2d0L3dSdFJrUVk2bWc5bDE5L1hsMExCNDQ2NkdHYXcv?=
 =?utf-8?B?d3YvV0prSFpQNmswejlyeFBHa09qM1g3Z2dvR2puOXJnQzMwV0N3VEJnY0ZP?=
 =?utf-8?B?azJqV1ozejBvMTdnYndDMDRMY1NBamZzQVJOUlhSZENOdDFjTUJVbElDR2hX?=
 =?utf-8?B?b1hPM3ZuUzB0TXRUR0lZZjVqYktyaFJuZDZHVDFZdzNhcFhVZ2VYMlFGbzFE?=
 =?utf-8?B?N0VDSFNnNDY2NmV6aytGNWxyU25IWmdyOFhDd0lJRk1UUnBUREh2MTFzN3hC?=
 =?utf-8?Q?bcF07JIgP/k1sPEhCJc7dAf9w?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	yxGQL9cveZl1agtTonFIlF/+fBDAp95QhkRPVV7p7EmJwasqa7yk4/fxvuH/triMxbudISBH0/bf/Rknnw9T/XqVa1irPWv8PIqbtxLLGeZ+EEf2/pVCz76mLYFnZg7X77cf40rgQi3ejpS7Gez7F/IootPpjUnAF1aMpyOHnf0muykM+HduJ7GlpuxclQMTgLmYyZUkLeb21IMYz5TjDa8H25MQgqB81sAZqeR8iRYK5NBlODAZT2BO74IujcSgbeuqJnRsd90f3AnfYqmR62ti/S06K0ZPORzoIKxikFjXi05SgpbfDRap8ZBqUenJu065zMnQDTdL6Fe/zQKBGuW7NWPvJu4qW/Nt5vd9cKbADQfIt0mT+7lt4AJGutrPCSlrTm7RiPSkWPG5iGOYi5NtHaZRNh2b9kGAAKGokXA26iZzCVGOQTzX3zJUG5Fq4mt+JPGW6Pp0hMVOaX399LtAdj5R3GEMS20VHRlseJoQxej+0unieqDxtkIcf7NTX1hs+fsm9/Z2HeWX/oyqnJP6+pfa44/I7oQhaIUY9Z3UAW6u1K4S8eX3TYxRj0gLupdJxFvcCoSbLdhTY+gt/ztFga/XMopA+OsM3aeyzViU/cc1WAC0MryFct7bJLNv
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11861.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 677ba261-ed18-482a-cee9-08dd766efcf7
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2025 07:28:41.8485
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fdp6iHJeAsRmP6m7eeK5UuX49+U8MHbphV/IZNirflxVZd+5bzMyTZStec99JTTwUhBxfd1oyG8UUTmkHO7nOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13377
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Apr 2025 07:28:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116693

SSB0cmllZCAiIHJ1bnFlbXUgcWVtdXg4Ni02NCBxZW11cGFyYW1zPSIgLS1lbmFibGUta3ZtICIg
bm9ncmFwaGljIiwgYnV0IHRoZXJlIHN0aWxsIHJlcG9ydCBhbiBlcnJvcjoNCg0Kcm9vdEBxZW11
eDg2LTY0On4jIHRpcHRvcA0Kc3lzY2FsbDogT3BlcmF0aW9uIG5vdCBwZXJtaXR0ZWQNCkNvdWxk
IG5vdCBwZXJmb3JtIHN5c2NhbGwuDQpEb24ndCBrbm93IHdoeS4uLg0KDQpNeSByZXBvIG9mIG1l
dGEtb3BlbmVtYmVkZGVkXSBoYXMgYmVlbiB1cGRhdGVkIHRvIDgyMDU2Yjk5MjQ1OTYwN2VhNjli
MDEzMDMwODY4NWM0ODcyY2IxOWI3DQpSZXBvIG9mIHBva3kgaGFzIGJlZW4gdXBkYXRlZCB0byA5
ZTQxOGM0MjY1NDUzODYwYzQ3MzZhYmI3NTIwZjFjM2MyYzNmYWVlDQogIC0tDQpCZXN0IFJlZ2Fy
ZHMNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0K
V2FuZyBNaW5neXUNCkZVSklUU1UgTkFOSklORyBTT0ZUV0FSRSBURUNITk9MT0dZIENPLiwgTFRE
LiAoRk5TVCkNCk5vLjYgV2Vuemh1IFJvYWQsIE5hbmppbmcsIDIxMDAxMiwgQ2hpbmENClRFTO+8
mis4NisyNS04NjYzMDU2Ni0tODU2OA0KQ09JTlM6IDc5OTg4NTQ4DQpGQVg6ICs4NisyNS04MzMx
NzY4NQ0KTUFJTDogd2FuZ215QGZ1aml0c3UuY29tDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4gRnJvbTogR3lvcmd5IFNhcnZhcmkgPHNrYW5kaWdyYXVuQGdtYWlsLmNvbT4NCj4g
U2VudDogVGh1cnNkYXksIEFwcmlsIDMsIDIwMjUgMzozNSBQTQ0KPiBUbzogV2FuZywgTWluZ3l1
L+eOiyDpuKPnkZwgPHdhbmdteUBmdWppdHN1LmNvbT47DQo+IGxpbnV4LXlvY3RvQGxpc3RzLnlv
Y3RvcHJvamVjdC5vcmcNCj4gQ2M6IG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbb2VdIFtsaW51eC15b2N0b10gZXJyb3Igb2YgdGlwdG9w
DQo+IA0KPiBPbiB3aGF0IG1hY2hpbmUgYXJlIHlvdSB0cnlpbmcgdG8gcnVuIGl0PyBBdCBsZWFz
dCBpbiBxZW11IEkgZ2V0IHRoZSBzYW1lLA0KPiB1bmxlc3MgSSBlbmFibGUga3ZtIGRpcmVjdGx5
Og0KPiANCj4gcnVucWVtdSBxZW11eDg2LTY0IHFlbXVwYXJhbXM9IiAtLWVuYWJsZS1rdm0gIg0K
PiANCj4gVGhpcyB3YXkgSSBkb24ndCBnZXQgdGhhdCBlcnJvci4NCj4gDQo+IE9uIDQvMi8yNSAx
MDo1Miwgd2FuZ215IHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIHdyb3RlOg0KPiA+IEhpLA0K
PiA+DQo+ID4gV2hlbiBydW5uaW5nIHRpcHRvcCBvbiB0aGUgaW1hZ2Ugb2YgeDg2LTY0IGZvciB0
aGUgbGF0ZXN0IHJlcG9zaXRvcnkgb2YgcG9reQ0KPiBhbmQgbWV0YS1vZSwgYW4gZXJyb3Igb2Nj
dXJyZWQuDQo+ID4NCj4gPiByb290ICMgdGlwdG9wIC1oDQo+ID4gc3lzY2FsbDogT3BlcmF0aW9u
IG5vdCBwZXJtaXR0ZWQNCj4gPiBDb3VsZCBub3QgcGVyZm9ybSBzeXNjYWxsLg0KPiA+IERvbid0
IGtub3cgd2h5Li4uDQo+ID4NCj4gPiBBY2NvcmRpbmcgdG8gcHJlbGltaW5hcnkgaW52ZXN0aWdh
dGlvbiwgdGhlIGNhdXNlIG9mIHRoaXMgaXNzdWUgaXMgcmVsYXRlZCB0bw0KPiBrZW5lcmwgdXBk
YXRpbmcgb2YgcGVyZiByZWxhdGVkIGNvZGUuDQo+ID4gVGhpcyBwcm9ibGVtIGhhcyBiZWVuIG9j
Y3VycmluZyBzaW5jZSB0aGUgY29tbWl0DQo+ID4gZjM5MGMyZWVhNTcxOTQ1ZjM1N2EyZDNiOWZj
YjFjMDE1NzY3MTMyZSBvZiBicmFuY2ggdjYuNi9zdGFuZGFyZC9iYXNlDQo+ID4NCj4gPiBNYXkg
SSBhc2sgaWYgeW91IGhhdmUgYW55IG9waW5pb25zIG9yIHN1Z2dlc3Rpb25zIHJlZ2FyZGluZyB0
aGlzIGlzc3VlPw0KPiA+DQo+ID4gICAtLQ0KPiA+IEJlc3QgUmVnYXJkcw0KPiA+IC0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+IFdhbmcgTWlu
Z3l1DQo+ID4gRlVKSVRTVSBOQU5KSU5HIFNPRlRXQVJFIFRFQ0hOT0xPR1kgQ08uLCBMVEQuIChG
TlNUKQ0KPiA+IE5vLjYgV2Vuemh1IFJvYWQsIE5hbmppbmcsIDIxMDAxMiwgQ2hpbmENCj4gPiBU
RUzvvJorODYrMjUtODY2MzA1NjYtLTg1NjgNCj4gPiBDT0lOUzogNzk5ODg1NDgNCj4gPiBGQVg6
ICs4NisyNS04MzMxNzY4NQ0KPiA+IE1BSUw6IHdhbmdteUBmdWppdHN1LmNvbQ0KPiA+DQo+ID4N
Cj4gPg0KPiA+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+ID4gTGlua3M6IFlvdSByZWNlaXZl
IGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+ID4gVmlldy9SZXBseSBPbmxpbmUg
KCMxMTY1MTQpOg0KPiA+IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJl
ZGRlZC1kZXZlbC9tZXNzYWdlLzExNjUxNA0KPiA+IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9s
aXN0cy5vcGVuZW1iZWRkZWQub3JnL210LzExMjA0MzMyMy82MDg0NDQ1DQo+ID4gR3JvdXAgT3du
ZXI6IG9wZW5lbWJlZGRlZC1kZXZlbCtvd25lckBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4g
VW5zdWJzY3JpYmU6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRl
ZC1kZXZlbC91bnN1Yg0KPiA+IFtza2FuZGlncmF1bkBnbWFpbC5jb21dDQo+ID4gLT0tPS09LT0t
PS09LT0tPS09LT0tPS0NCj4gPg0KDQo=


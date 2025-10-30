Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3BD7CCF9EA
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 04:09:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by mx.groups.io with SMTP id smtpd.web10.20030.1761797339798159566
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Oct 2025 21:08:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=TMJWnXGN;
 spf=pass (domain: intel.com, ip: 198.175.65.19, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761797340; x=1793333340;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=N5c+S+XNg4kV4VAFE1ehinsLs0qv9AbGF66DHRzS3z4=;
  b=TMJWnXGNYXHQ/AdOzEVmbqIjsZ0KsmrUFrbSlXLg4l8bFxzBIO4XtDNY
   ksyzzJBvQP1d115NRGWSMbStJGwVPUgXlkgnTqGQef1ho7WMP6TRvsFcY
   /8iUES4roc8uY6/zfiwjlWhg+1C0ddN/DX+cNetjuno+ObUsWkdNyT8sv
   lKMuI1dQD0ENvOHgZj1kX969ijlSbz/Tk0LDuh2QJjapZp1oo3QpIm1rT
   3PuZJRB9MyjXFOQCPsj31jXV6exKMPP/QyWGOTaP9BNAJ/wj+ICHmArW/
   DRWDNEw1QwG2mCrDoZqnjoW+OVhzRtZYlXseUoN453S1pUVI2SFOdxpT8
   g==;
X-CSE-ConnectionGUID: vRsTIJCrSoyuTtXM5rlwvQ==
X-CSE-MsgGUID: hq0tehtvS/ujCdLdr41XfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="63814596"
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="63814596"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 20:55:14 -0700
X-CSE-ConnectionGUID: u7XE+nFWQ1K3ZBwHrsnh7w==
X-CSE-MsgGUID: Liaiw7ONTBO0YMcLZIE/Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="185723840"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 20:55:13 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 20:55:13 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 29 Oct 2025 20:55:13 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.43)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 20:55:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EjnFTW9355VSK2mHbYTm31RhXEsrKJrtV9+djE8E5em0JUxd1UEX0vxudTSdhr/tGsyxZ08adhGw5XZSF99rOcNTQoqIxVSHo8uhAwpMv0SXUKSmlrVgFHjWyhO8Z5TB8ZD1u04DAbGwaH2ju+4bBYWeuSUgpsezfQZv3z9cRmwVDJFvEEWkWU1F/7GmCy+mJ0m3CCyhc1uBZpuP5amcn74PVkuay3EdxYhOxUQm808qYVP8Kiq+oEJLTZ1W1muij/GI6Nby/iDSgmJ/nXXHW8g3bvNNYW99uzEsfwb68gkp65++LcVtP2gkhD0hj0bgpWjhUbg+k53wWZSZZ1E6Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N5c+S+XNg4kV4VAFE1ehinsLs0qv9AbGF66DHRzS3z4=;
 b=XGdOYzi3bqxSf0uTg6jNozlC7wtOHfevftN+02gYIo4RozvZ1DyH+14UB2g9rw30wM5lebw+WYkPVxKqrOfEnnDoob3V1ZeTQvt4dHIZ3NUDZ73ZjgjA3fycLCZ4rMYFY3cFXTHTmAaPvnDXWs7gV09AkUlAi8ImNmAtXP48VvKKXvyQ2ckEA+C9uel3UmQT0jBLepylfdZUyFU6orp6XVwDQ/hPhvFeDbz48XQNTiTTts2pv2n63VhZSCYjYVBAtXai9X258pibn/DbJhKJ9rvTKYKv6qcMPpWd1UNpvYbuyfTBjDos1ddOVWJx2nmyj4ROwEogIccRYQVoGs14tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by BL3PR11MB6339.namprd11.prod.outlook.com (2603:10b6:208:3b3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Thu, 30 Oct
 2025 03:55:08 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%2]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 03:55:08 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "vanusuri@mvista.com" <vanusuri@mvista.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe][meta-oe][scarthgap][PATCH] libssh: Fix CVE-2025-8277
Thread-Topic: [oe][meta-oe][scarthgap][PATCH] libssh: Fix CVE-2025-8277
Thread-Index: AQHcOSBOQenMjZ/Id0yVba5dChJBNLTaL7WA
Date: Thu, 30 Oct 2025 03:55:08 +0000
Message-ID: <d62b15e94667438900736a89a8220db30705a040.camel@intel.com>
References: <20251009132543.1680755-1-vanusuri@mvista.com>
In-Reply-To: <20251009132543.1680755-1-vanusuri@mvista.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|BL3PR11MB6339:EE_
x-ms-office365-filtering-correlation-id: e2403d62-5f3c-4133-3e1e-08de17681e72
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?Z0FDTFY1cmdhY1BzdnVzRXJ2dTUydFVYQ0RqSHNKMDdVQmJSS3NpdCtpOWRu?=
 =?utf-8?B?U0FveCtyV1BzMmdBTFFmVDF0MGpTSlJDcFAzbWpaMEFIMFN5bW0vSE5xMzF3?=
 =?utf-8?B?dklkcUNtZTJ2WTIxUzlzb2Z3UUJpcEZGL2NES0FjNTQyU01aYzQxMlo4aHU0?=
 =?utf-8?B?VWUwY3NtYjhnd2JJdjVrRDFHYTBtSXg3VFpUTW8xbE1iWXVtbUpHVDg4S1M3?=
 =?utf-8?B?clRCeUNKM2ExQUQzK205UnJ2L2t5WTVUTHprc3JTclpWNVhINzJ0bTRjNWFs?=
 =?utf-8?B?RWJwaCtVWHM1K3dLWEk3MXVuTTdpVi9EUlZOSGVlS1JmTnlVcG8xL25JdjRs?=
 =?utf-8?B?YkRaSE9Ld1pxN0haNXp1NDcybFZUNUJlVXdkZlFCL1NqNzBteDJWSzM4eEpp?=
 =?utf-8?B?MmZaNUJPdCs2OGZqUGNUdlhSU1VVRWh3blozQm9BQzZDR251UDNlclgvdzhS?=
 =?utf-8?B?UjVyQVpycHBsUUZZaGk3ZGhVbjJlUTlUeDJUZTh1Wi9sLytGUDRYVGp0Zk55?=
 =?utf-8?B?bld1K2UxdEtrOGJBNG85Z3pVTEFaTGowVmVsRGFDNmtIKzZxS3ZDUmpWNUwy?=
 =?utf-8?B?aFFycDFWdE9xVE00UXd1OGI0QkdkWS9FY3EyWG9pcW9zVmJtQTVjK2ZIS0RW?=
 =?utf-8?B?MHEwUGoySWg5aWh1c1k4QTNNb3JIZGNFN1pYMU0wVUxUM09VYTZhNUI0dG52?=
 =?utf-8?B?TnlxU1NlVTBBc3dtWlpKL0YvOGZrZElFNnJOekRET2puQU5XSGlHNXhHQjFl?=
 =?utf-8?B?dEJqTHZjbHRFb2RuZVkxTjZEbE5rR3dkODN1T3cvc1RocmlzK2w1dVF6WXVM?=
 =?utf-8?B?WFdzMXFDUFcwbkYwMExRN1pKYzVtS0JmOE93d3lUQ011RS9TeUc3VVhtaVBC?=
 =?utf-8?B?SGxJdEJkdXVEZFU1b2JGZjl0bHpsQ2hoVktPb1k5emtxQUtLNGlTdE5wWWdC?=
 =?utf-8?B?RGI2c0wxN0VOSnVkOUQwR1NETTNwbmF5bXdiVXFzUHg2UzJsc2toM1FGWmJR?=
 =?utf-8?B?OFNVRGVkK0pJL2Q3NnVKYndZWWpnRWVleHhuRDJiN29WYis3THVFYjR5TkU2?=
 =?utf-8?B?RGQzNEpIOTVoZSsxZUZQSURMVXBCczkvQnVJcmhTMFM1WXJSM2Y3U3BqRml6?=
 =?utf-8?B?b0xoMUZUSTFJdDY5eExKOVM0cDBlZDZVL0Zrd2NOWVNaNFlwUWFLbmNGRjd3?=
 =?utf-8?B?LzNSYytMVURXTWxzSDVRSW52cDJHK1E4L0EwWEozVHBXbkp0ZDNGek83R2lI?=
 =?utf-8?B?eWZSeTJQQUVIU3ZHcnRtd1Z0Unpqb2hsNkVQb2F6eTIvNkVSU0RGM2JEVEhZ?=
 =?utf-8?B?NXV2Y0xkYVYyTkJUMlR6VTdnWmR1YVNWcERab09ZOEJIVVRZSE51UEpQcmpN?=
 =?utf-8?B?TGJPdmFCNXlJS1JiR1BoeW9KZWdCd1VWNHB1UkE2eW5EVlVOTUNmcm9HNUpN?=
 =?utf-8?B?eTRLUTNaZk4yWmZ3cm54cElPeVcySTZIa1lIdGNFeVZ4RWx1YU1sMDJlNjJ6?=
 =?utf-8?B?eVh1ejhlTzBkcWs4WnY4WE42TlJzUzgwUUxoeGtzM2hZWVh3MnpxRmd1TGNy?=
 =?utf-8?B?c1Y2STZyeFg4RUxOa1l1cCtWbGZXTC9QQjgvdHZLVGFxQnBHUXdTYmM2QXZr?=
 =?utf-8?B?YzVVZmhPSzRYY25yTUJYOE9uTGhuZXNDZFBaK2ZUTkZnWVdsazYvd0pyRVV0?=
 =?utf-8?B?Uk5pbkNONUxWdHIyZmlENnlJK1RqNHpYZ2E1NWpUZm5GWGRZM0k4RHovUWIy?=
 =?utf-8?B?cHhpVU5CcVp2TG16OVlTdVlkUW9oZ1pvRDhwa0xmYVZ6RndxRWFEbFU5OGZR?=
 =?utf-8?B?aVRuNHlTU0VRVjg0RElzVHc3T0pBck9WT0pRQUlzWjBtSWxYaVVGdTFHRVN1?=
 =?utf-8?B?T1c2VFI2QUlTTm1kUEsvdWoxWTE5Snc4RWdJZGdJMVFTZjhXQnhrd2pINmRI?=
 =?utf-8?B?SzlSNTdIUUZyK0pGb2I5blB0TXZMR0JPbUdBMTdYbE1ML1k0cytSMEVvVGts?=
 =?utf-8?B?cVUySjRmVFd3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QnZFVEtjdUszV2NPVVNQaklLMGtySUFGNmhUODBwelNZbk1DdlFJWTZNSGE3?=
 =?utf-8?B?TGNtQzAxMlNraWRSeGZrUkh3dzZ4U1JRcXNCejRFNUt3Um9JK2tyVk9naktD?=
 =?utf-8?B?ejlhY1pTcE5NU0pPS0U0T0FQdzV4R3FGT0phc1JmRlQ2UEtFL1RNTVdKWVdx?=
 =?utf-8?B?a1dTQm8xbjN5ajlreWxnMC9KVFRUTU9WM3Y0aE9wWWlqLzM0dWhqb3VqWTV3?=
 =?utf-8?B?OWR0M1RzdDJpM3RBTis5SUZiYjhiWkVsS1hjdFNEbE1VUFM2QlBEcFJIbkR1?=
 =?utf-8?B?MW9mamJiV0VoV3FlNlpCdmZuWVgxallQUEhxd2ptYmZpQkt3TEliZmRYNUlk?=
 =?utf-8?B?VTZMV2VzY1llK0VXRzMzZHJNcW1JNElXS0N1bGFkNW5mUEE3RkpIM1RBS0g5?=
 =?utf-8?B?T3NzK2c1djFSdzFtRElmanFmOU9uYjhvL3ZFOHExemZ6RCt6dFoyaVdTZHJ6?=
 =?utf-8?B?MG1aREIzalhNTG5kSVdPbE5zcnRQNVJYQ0xjRHVEWlVNTG1mUWJ2cWpTT1hJ?=
 =?utf-8?B?NWM4OHpVc005RDVOR1QwZTZwYStrN3lXNHVjQUZTaUd6M3FjeWs0SGhPUld5?=
 =?utf-8?B?V2RoYjgrMllzVkY4TGR3ZzdiR1NZVGUyY2xHQ2h2Rng4UTk5S1dtdTJxMzVF?=
 =?utf-8?B?ZE1GdGN4TXBRc2x3bWVVUG9wSjlxM2hMZzl0cHB0T08vcWx5RU9lckd1YVJN?=
 =?utf-8?B?YzBIWkJZd2dKZSsrTnNTaStEWnNvT1N2R21tNDIvQjRTc1ljQTlPMGZ3QUI0?=
 =?utf-8?B?RGxQTGw2SU9aU0I4QmZRMit6SXZYR2ozN1VjWTJYVk80L1dJenRja0tQQ3NX?=
 =?utf-8?B?bE4rMzBjWXl6MnVLYS96ckgxblcrZkFsMVpjaXRxZVR5R1QvbzB3SUl1ZXUz?=
 =?utf-8?B?RDRNanRUOFJTbC85SjlkbFFCZnI0dis4ZmRBRjFrZm5MeU8wbURTaXN4UVF5?=
 =?utf-8?B?YWtTNFhtYWtmZ29WQzIzcTkydWhuTVhCbjZ3OUFNYnp2RnlWUlpzcUZtNXZU?=
 =?utf-8?B?a0dndlU0RERMWCtvVm9PczFtOWtwTGFkMFZGckNIQ1ExMXdMREh5bnl4dkZN?=
 =?utf-8?B?QWVYcllDc0JBYkdCUFh5SFViOC8zci9nUDdHVE5NaFppZVk3aTMyZTFSU3g0?=
 =?utf-8?B?WTNQYXNxWXNndGFtcEQ3MmZWbUlBWjQzbjRFSkU3d2RmRU10dGRzMWNtOW0w?=
 =?utf-8?B?bEVEV1ZBOGFpblc2b09vMDdsYUtaeUxjN3dLcG4xaDZPbU1zUlpIdWVwSkpD?=
 =?utf-8?B?UVBSRkNvNGFBd2hxRlNaZ2tIenhiZmR1MUVJdzl6Y2IxQmo4ZlMybXh6ZXgw?=
 =?utf-8?B?a1NHOXE0SGRRRCtJSGlXOXliU0Z0d2xXWXNFU0pzVHpnUm14ZlNkRkNNL2xs?=
 =?utf-8?B?K1JHZ2ltNXpGbXhDVmRoT2FuVkF1eVQ5YWQwbHdOS09MMjdOTzl5M3lWaHg4?=
 =?utf-8?B?THNqMjhJRmtSRkR0NkVoTXdERDBwcnkxWEt1YzdsM2JCc0dtOGJkejI0bVpo?=
 =?utf-8?B?RDVtOTRnbmoyWCtsQUQrdG5vdU11bHM4WURDdzNPQjN3Z0N4QUVoR0lmc2lt?=
 =?utf-8?B?SlJaTlJUbzlPSkN4NUtnV2NaMEh4a1hWeTZlYmVFbHFld0VZVGlwbTJiQnBN?=
 =?utf-8?B?bm5pdW81dTVuckhBVE9pa0dUVFRKVEx3ODZrM2xGUnFjZTRha0Y1M1I3SnRQ?=
 =?utf-8?B?RkxnYmVtU1BIVFpndEdqVDBKTkxIaXV0N0lJVGxzZDE4RFBSMU1JK25SQ09L?=
 =?utf-8?B?WDhrS1dZcWR0QnpJWGdFWEdYUjhtVk9LVlNVdkY3Rnl6alFOU3Y5SUxMVTNq?=
 =?utf-8?B?T25EWTNpa3c2NmFXTDNJZWF3TkpoT1haaUhFd2hSSjFkRGlHbGE4RGNiMmN1?=
 =?utf-8?B?NnVBVmx3TmV3WHJUSmlMNDRKeUJHS2M0QW9SMWpaQ3ovaDBIVm05Z1JEVlpt?=
 =?utf-8?B?RFA5V1ZBdW94M2NoM25aT3Nlc2l6cnh3NFQzOVJxUGYxQnNOWVBadHJtT0Nt?=
 =?utf-8?B?RTh1VUxwYy9ZdGl2MUU1OVZXK25lbjlXWVNvNzVJUVBzU2ozRGhqc3k3Rkhr?=
 =?utf-8?B?YWkrNzdiMDhOaUFsUzVURlQ4K2x6cHZja2dJcnJSVzFpT1NFckVQdDE3QXNK?=
 =?utf-8?B?a3BQQVg2RldnMGVaTUpSdkhlRkkxRng4ZGNYNXBxai9HcWo0Q0lJRW5OSG1K?=
 =?utf-8?B?ckE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AB2117905728A14FB6A71F55AC854735@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2403d62-5f3c-4133-3e1e-08de17681e72
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2025 03:55:08.7837
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GyBUrpYvtZAt95tmpMzPdEf3EOzqLgzRkTA6sgpAzAc2SD6HCzDGb9UZUP+vL0we0Jxln5/Pjxexq74TlX66eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6339
X-OriginatorOrg: intel.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Oct 2025 04:09:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121181

T24gVGh1LCAyMDI1LTEwLTA5IGF0IDE4OjU1ICswNTMwLCBWaWpheSBBbnVzdXJpIHZpYQ0KbGlz
dHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4gKysrIGIvbWV0YS1vZS9yZWNpcGVzLXN1cHBv
cnQvbGlic3NoL2xpYnNzaC9DVkUtMjAyNS04Mjc3LTIucGF0Y2gNCj4gQEAgLTAsMCArMSw4OSBA
QA0KPiArRnJvbSAyNjYxNzRhNmQzNjY4N2I2NWNmOTAxNzRmMDZhZjkwYjhiMjdjNjVmIE1vbiBT
ZXAgMTcgMDA6MDA6MDANCj4gMjAwMQ0KPiArRnJvbTogRnJhbmNlc2NvIFJvbGxvIDxlZmVyb2xs
b0BnbWFpbC5jb20+DQo+ICtEYXRlOiBUaHUsIDI0IEp1bCAyMDI1IDE2OjMwOjA3ICswMzAwDQo+
ICtTdWJqZWN0OiBbUEFUQ0hdIENWRS0yMDI1LTgyNzc6IEZpeCBtZW1vcnkgbGVhayBvZiB1bnVz
ZWQgZXBoZW1lcmFsDQo+IGtleSBwYWlyDQo+ICsgYWZ0ZXIgY2xpZW50J3Mgd3JvbmcgS0VYIGd1
ZXNzDQo+ICsNCj4gK1NpZ25lZC1vZmYtYnk6IEZyYW5jZXNjbyBSb2xsbyA8ZWZlcm9sbG9AZ21h
aWwuY29tPg0KPiArUmV2aWV3ZWQtYnk6IEFuZHJlYXMgU2NobmVpZGVyIDxhc25AY3J5cHRvbWls
ay5vcmc+DQo+ICsoY2hlcnJ5IHBpY2tlZCBmcm9tIGNvbW1pdCBjY2ZmMjJkMzc4N2MxMzU1YjNm
MGRjZDA5ZmU1NGQ5MGFjYzU1YmYxKQ0KPiArDQo+ICtVcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0
DQo+IFtodHRwczovL2dpdC5saWJzc2gub3JnL3Byb2plY3RzL2xpYnNzaC5naXQvY29tbWl0Lz9o
PXN0YWJsZS0wLjExJmlkPQ0KPiAyNjYxNzRhNmQzNjY4N2I2NWNmOTAxNzRmMDZhZjkwYjhiMjdj
NjVmXQ0KPiArQ1ZFOiBDVkUtMjAyNS04Mjc3DQo+ICtTaWduZWQtb2ZmLWJ5OiBWaWpheSBBbnVz
dXJpIDx2YW51c3VyaUBtdmlzdGEuY29tPg0KPiArLS0tDQo+ICsgc3JjL2RoX2NyeXB0by5jwqDC
oMKgwqDCoMKgIHwgNSArKysrKw0KPiArIHNyYy9kaF9rZXkuY8KgwqDCoMKgwqDCoMKgwqDCoCB8
IDUgKysrKysNCj4gKyBzcmMvZWNkaF9nY3J5cHQuY8KgwqDCoMKgIHwgNiArKysrKysNCj4gKyBz
cmMvZWNkaF9tYmVkY3J5cHRvLmMgfCA2ICsrKysrKw0KDQpUaGlzIGRvZXMgbm90IGxvb2sgbGlr
ZSBhIHNpbXBsZSBiYWNrcG9ydCBvZg0KaHR0cHM6Ly9naXQubGlic3NoLm9yZy9wcm9qZWN0cy9s
aWJzc2guZ2l0L2NvbW1pdC8/aD1zdGFibGUtMC4xMSZpZD0yNjYxNzRhNmQzNjY4N2I2NWNmOTAx
NzRmMDZhZjkwYjhiMjdjNjVmDQoNCldhcyB0aGUgY2hhbmdlIGluIGVjZGhfY3J5cHRvLmMgbm90
IHJlcXVpcmVkPw0K


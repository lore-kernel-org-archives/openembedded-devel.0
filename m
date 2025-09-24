Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CF9FCAC5A5
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 12:37:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by mx.groups.io with SMTP id smtpd.web10.11520.1758717469759124863
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 05:37:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=fwhVwVB4;
 spf=pass (domain: intel.com, ip: 198.175.65.10, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758717469; x=1790253469;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=S+DmkeQ6ZFdSYemuJpZ0Vl2PzrH+h/li4czxRotTopk=;
  b=fwhVwVB437CduppwMQxS3zTukw0DNi3YxBDRaeW1ytYTYXi62ynW4/SC
   sMxJEGZGUd6oTSILMSOIR0H3UPAaJ4t9hPxPzcwkk5TN6WkOrrYa8KgQ7
   IU2qh6lOc3ddxbLGJJ57X5FUQsg28jFQ/S8+sLAioVLvGGQymbVjPFPON
   hCbt7a0vNvJdudyk2tlvqBRyKFzJ2XKoJs5aBxFzggwifEU0B7D7jvkI/
   gtM9wxVhIrgLLgUhC6qyhLRFujMJiBjGpLQdD6lqxl7V3rTRjjW+jw8IE
   EuGRPTtxxZ+U53yRhbyHMA/mEuOjzHvYmhk+/+BCPrGumG+AQEUdij2FG
   Q==;
X-CSE-ConnectionGUID: JjfWITPKSOyRdbLARscXmw==
X-CSE-MsgGUID: 51OBGz/LTAGab6Sj22+ZcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="78449239"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; 
   d="scan'208";a="78449239"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 05:37:48 -0700
X-CSE-ConnectionGUID: UR7Gg3NBTjSFnsDUCIWi7Q==
X-CSE-MsgGUID: ELQEHpexTe64mNgsq12qVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; 
   d="scan'208";a="214150374"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 05:37:48 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 24 Sep 2025 05:37:47 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 24 Sep 2025 05:37:47 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.64) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 24 Sep 2025 05:37:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lljKrKSzU2FBcgi1B+xHhYZt2vnINJuGERacCQSHhFBAFTl70IZkwc8v92EnV1V1HnsxngrljdGj3ll0IF307WkD4BFhxN7bJiB1XQZ5C8VkFSCrL8D1CatfFQ2BuoQo6UVc2tMjQiZoMw8Dl9CyCu/djnJ/NVnoTTR074wX8U7Nxmolh2ueDTh1mjdHWGDwZrqW4IBgTYHa2gGbdA1eniwC4K1K9hUPC/ZVmYp/CzR0lnPMEVysXOH9/KahyKZBk3G0gHLbLhZhTyGmlUd/C616Alzn27CaHL9O2o0Z7H6D/wRgfXqM93ZfRw9k7I9Gpxg0XyJ9b3CPuud4ywdNwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S+DmkeQ6ZFdSYemuJpZ0Vl2PzrH+h/li4czxRotTopk=;
 b=PZqF5FyzDtmpRI4KtUvwzW5xPn62RaXD1tIvVnA3pfF/tku3IjwXD2mxM9u1TdJEJy1JH8Uj2vrjBJ/ZAU7jopykCcjZMyLb9yVOi1UW5fVWfqkZCyv7mq9EwW3yDqPHApd8UUdW9/jGnwp8ke+spHzwdv/KKtTA5Rlae6tsG0CEu9Dkor6B0Nckf6fI/KC82dKWkg7/UUsvc79FVt+7P9S+SC7hS6XwARCMvV7INANWWKmrvR7MkCakBaDDpkLCNJkYvHz8UQsJ2RldcXH22NXBZafQH4R6PMdTbgTRxwB0uqMOh6j1+XZ54azIptgDE/7Q+o1BsOb5M66qLMJWgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by DS7PR11MB6061.namprd11.prod.outlook.com (2603:10b6:8:74::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.20; Wed, 24 Sep 2025 12:37:29 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%2]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 12:37:29 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "ankur.tyagi85@gmail.com" <ankur.tyagi85@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe][meta-oe][walnascar][PATCH 0/6] cherry-picks from master
 branch
Thread-Topic: [oe][meta-oe][walnascar][PATCH 0/6] cherry-picks from master
 branch
Thread-Index: AQHcLSjbqeJt1NUx/USjpO7lppylP7Sh+LUAgAAYlACAADRdgA==
Date: Wed, 24 Sep 2025 12:37:29 +0000
Message-ID: <1555c67c61416e1d242c8e79e48018be008cc0bf.camel@intel.com>
References: <20250924075643.2047506-1-ankur.tyagi85@gmail.com>
	 <d09b1bc7-3c18-47f8-a7eb-3cc6e88b5bb1@windriver.com>
	 <CADySD0EG7dt841cwvcbd5BLyBh39Yq81kn2XBRb_2qjkyJvaFA@mail.gmail.com>
In-Reply-To: <CADySD0EG7dt841cwvcbd5BLyBh39Yq81kn2XBRb_2qjkyJvaFA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|DS7PR11MB6061:EE_
x-ms-office365-filtering-correlation-id: cce24007-9a6b-4777-2096-08ddfb67200e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|4022899009|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?Rk1tT1RsL3ptUnA2NHRBY0I5SkQzZzZrMUpjTVRjdmdpeEJwcVJxQnBOLzRt?=
 =?utf-8?B?eHVvZ1YzMkZ2YUt3YWJ2emVGVVlQK2dZaXlURUpQVDRadnFxRFVFV3k4c0Ex?=
 =?utf-8?B?YmZ5QjBHc0hUcVVkNy9vSnY5dDZjT3FwaXByelAvZ3JvcCtzWHowZGF1bTVH?=
 =?utf-8?B?NmdsTXJMK3A2NjBFOC9ocmRqN3p3b0Z5US84R28rV0U2S3VXNmxBYTUwRi83?=
 =?utf-8?B?TktZbGVETERjNHdBUmRYaU1xQlBjNC8zYkFxQk5aWGx6U2YvWkh1eklQNFFE?=
 =?utf-8?B?VEFYb0d5QzkrQXN6MGhSU0tFTWI4ZS9iUWxjSTdPS1lUQVJFSk5IeXo0THZh?=
 =?utf-8?B?RlVMdHdWVThIYzJieGxpSGdmYTJTR2NHV1ZjUFBUbTZKYytNTDZncDNKSEw4?=
 =?utf-8?B?RlQrZTRYa2pwUXVUZms1TjZBUGl4aEpjbG9yQ284N1lkZlRvTjlDZFpOckZ2?=
 =?utf-8?B?VWVQcWtZZW5uSUpZblNaR2pzZFNwdXRiZjZQWk02VVhDbS9QYnlJQVNOSXZD?=
 =?utf-8?B?YUdGZm9vOEhLakF1bjN0NTZIOHNJa1RqbDNoalI0M2xFaDAxU3o4VVRIZzF6?=
 =?utf-8?B?c2hycllteEt4cDZEYS92UkF6N0FDeFE2SHlzQlhSYkg1TnJqQVdPV3FjblFJ?=
 =?utf-8?B?L2syVFNEQlpXaXhpTmJxT0xsa2hmQ2RZWCtDdnpLa1lxaDM5QTJGWTJYRmVC?=
 =?utf-8?B?alRZaDA2V2YvNkhqV0pwZkJLOUh2aGtsUkpvM0wwS0x4SUQ0cDVSeitxcWds?=
 =?utf-8?B?V01DMGVPQUgybXordFRuYWRKODcrb0tlVHJqemRxVDcxWU1ZM3JzeHQ1Mnpx?=
 =?utf-8?B?V1VXY1NhWGdISTAyUEUwWDJkZW5tQ05majVuYzZiWjNTQnVlUXBSK3ltcFlJ?=
 =?utf-8?B?NStQRWUwcFNZS2owN3pRL1FIOUM5VlRJWWVCU1lRSHJaMVRJWUdLMjVtUDZt?=
 =?utf-8?B?dUxBTHVOcFcvUWNibmxVTTdrQTZZN3U3cjI1MkJVNWFvbEVheXdyVnBaYTJu?=
 =?utf-8?B?ejhzL09iTzNnbngwdC82NnlJbGhLS0JxeXF5WVRkRCtNRDZOUkh4SmhOc3A1?=
 =?utf-8?B?SHpabGFkMUw3WFlPbDZNRjZ2YkdRWTNJRHFlOTRUTktGdzZBTDJuRUdaNmwv?=
 =?utf-8?B?UlBRUzNSSEVMalpXWHJpRFRJekFaRVpaQmlkY0tCSEZ3YjZ3a01pUXRYdEFk?=
 =?utf-8?B?MWtJdUlaL1g5M2lMbGhFSjVQaTE5ZWlVZEpYNktBQ0UyVHptNS9uczVhN0ZK?=
 =?utf-8?B?dUY3Mm1FODhNRWNyUmltczNWRVRUR2xIKzBING1FQ0hBY1BXSUcwc2dYUWox?=
 =?utf-8?B?L1Y4RVlZRXBhcVhlNXpJcXBSZUJKTEFjUnV6Ri9WeUoyeVRJempPU0k4aFRK?=
 =?utf-8?B?VGJ2ZzVXSUhDaXBINDRyaGd2WmFPWGNqWXd1REc1SUVQU3JGQU1CTVhacWV0?=
 =?utf-8?B?ZS9EODdYbHNicFowZGRodVdnS0pKKzJxUVI1UmExdnNtUU9KTG5MYXFTN0RD?=
 =?utf-8?B?MmlxRUlUVS9hOGh3Znd0b053cXlBUWJwNVE5TEdwNUV0MUM5eDFvOWQ4WGhS?=
 =?utf-8?B?dWNVdXBmSTJFNk9DNE5WMWc2bkg3cXlqdE1sNFIwOXVjU3pvS0Nhdm80YXRh?=
 =?utf-8?B?R092eHp1elFtTUVkZU5QcFgvN1hvajc4OHQwOExxeForWThEWnZsZjhIdk1D?=
 =?utf-8?B?U0czN2M0UUZZT0NwSmIwOVgvT1B2QnZnMDZnL3dlbWZ0MHFmS0xNRXZqWmhM?=
 =?utf-8?B?Wlg0UEVmTUM2cDZlQURIMm9IL1hvOHB3V0JBUkVpN25yUFljNzF4T3ZpdFJ1?=
 =?utf-8?B?VTJvQjJ3czM4L1UwRFhIdmRxbndJNTRZdXZKaGVFenVNcUdTU3h6eXhydi9W?=
 =?utf-8?B?elBPTTZDZ3NBRGtER3B0OHVJKzZLdUdJTm12OWdKUWI3YWYvbllaSUpPWTcv?=
 =?utf-8?Q?nfRD8Ua/NJE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(4022899009)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OWFQSUNXbldMLzY0SEUxcVRnMExkS0plOVlDQ2dNMGFMUEQxMHI0RTZEaFZp?=
 =?utf-8?B?cWZWbGI1MDIyeWJhcVp2UGc2YzNoai9FOVdxa3hsYnBRenBXenFTZmVyVkg4?=
 =?utf-8?B?bnZvN0l1dWJGUE5YMTA5VjVyRGNYbjdMbG5McFRIVzZ6c2ROOE1WTC9vUzI0?=
 =?utf-8?B?TS9tNGR2Wk1DbzZUUTRjYTdaaGJneUdINExQZWJBVms3ZGFiTENlNlpndnc0?=
 =?utf-8?B?RmF1bDZRbENLYlY2enJobExUK1RnbHZZdGtuYlBrRm1xL0NEdTVtU3JDOWUw?=
 =?utf-8?B?RFFOYmp3QXd4VWs4Rng1Zi96R3NnR3gyTllaM1dWR3VWTDI4NU5YbXdwcDdv?=
 =?utf-8?B?eHNqZjJJdk9DYzZCMWF0bUFEOGdGS2ROZ3o4clpPTVprWklDeS9TYU5FQm9m?=
 =?utf-8?B?UVpqM1JFbW9zaDE0cHArWjNIcjVmSDZrWmsvams5Q3RiREZlQTBrVHBhcTdr?=
 =?utf-8?B?VzM5R1VxTFdqaG1zaVhrZ1JtV1NwMDlrYWk3a25hUXdSNEV0WXd6SXhnS3px?=
 =?utf-8?B?QTN0ZlNIS1drZmNrZWRGUmdxWC9hWlYzeEY3aFNGc1BmVjRBN1h1eDFpQUFH?=
 =?utf-8?B?L05EMjI0bm9aYis5eUV6QlQ1a2dOeDFlNmdPUHhHV20zU3NzL2JnR3BOcVl2?=
 =?utf-8?B?cWxWUlluTWp2UVdBVG1ZR1pkUGFYNGFzS3AweWV0RGhzS25OOC9HYTdOenJH?=
 =?utf-8?B?NUlod0R2Njdlbzg2ejk2SXFLK0NQRzZZSW5yVXJnNTZJeWw2SjYvOTYzZlpT?=
 =?utf-8?B?dDJJMzZZSjRzMFEzeFh3SGtiVlJROU82aGhqRHBHaVdOa0Y4N1hHaGpGSUox?=
 =?utf-8?B?bFU1NTIwQ2ltbksxTURKR09ubFhVRHVsNk1ST2lFU0VJWHFPNGtKUHBWSGI1?=
 =?utf-8?B?VnBOMjRKUGp1SWNja2pWQTlQcU94ME9mUDI2S0ZMNzArUmQwTTVLZ1NBaWtF?=
 =?utf-8?B?azkwOFBTUUFsWmw5cHF2RkZ3TnczaVMwQmpVMDIyUW9MWkVGMWFYU2cvbHJY?=
 =?utf-8?B?UkRxeUlxSDE5MW0xRWhwZTFMVzJ0Zk51SkZjc01ZeHlvMkVzTFM1VXd5Z3Rp?=
 =?utf-8?B?S3NBTmRmVE5ickoyZ3BOaUZPNnhFQnN5S0ROQWZGSmdub2ZDUjZGcHZEQ1B4?=
 =?utf-8?B?SERKNlhySlI5Q0hFeC92dlhSOWxuT3RKSTZKc01nenlRbHVOOTdNb0xZcStz?=
 =?utf-8?B?b256VTJQNk1ldHRUbnFoUzJLRlREU2szdFlvL2l1aFhHcjl1dDN6bW5PbkRv?=
 =?utf-8?B?aUVpd0RSbU1ZZllIN0xkTDBkdzhDSFdOS2NyY0h6SDlvNHVZSml5MmtjdVBV?=
 =?utf-8?B?OEZmWU5qU0tVU2FxeGxIeWJhaTI3QjMxam1ZMmJySWZuY2d1eXk3Z3RNVEcy?=
 =?utf-8?B?MW54WHh0K3AwRHhxMmdHYlJjOGxoNEZNUVlBTFE2OTl6ZFNqakl4azEvYlFG?=
 =?utf-8?B?L1BHc0lqQXdCd0s4Vlc1QmkyampWTEF6QjN0aStjbDIweXJKYTZJeWJHeDcr?=
 =?utf-8?B?S0ZDOHoveGNzWWJjYUJvOVJub0w3dlYyN3p6WjVJQUU4dGV6T1RBRUQwWEJY?=
 =?utf-8?B?L0lmd0lra3dTR3ZZSndJM1dhekIxaWNsQlpKT0V0VjFlR0RJU0gxaVZaMU9E?=
 =?utf-8?B?OS9pcVV3Q0FBaHpBV1lJMjExQ2phckY1bkdHMjg2THpjTVlaRGQvVE5Kemd0?=
 =?utf-8?B?ZUE1WkQ1T2dIL0pOeG0vcGJRUmszSzF5U0p3b0xLS3VEYlUvK2krOWRJYjYr?=
 =?utf-8?B?QzJxVDB1aU1TYk9lbmM0NHVkNElRQjhES1ZrS0tzL1hrQ3RFRDJtWXN5bmhR?=
 =?utf-8?B?ajJkelp4MDlWdzVWTkZCM3BOZVB3MEl5aElmVkZzZ0o3T08zb1Q5b2QxM2po?=
 =?utf-8?B?RGVGQzJXU2cxS3daTTJHcTJycGYwVGZTVjlnTnFuSUkwTVRiV0NRcldxY0hx?=
 =?utf-8?B?R3dBTmQ2d1hVQ0pPeFNGSjVsNk45T3ZhclRmTldFbFN4RW5CajhTQ1JhWVZG?=
 =?utf-8?B?bDl2OGhiVTZxOGRpTER5cjQwNzU3dE8zeDFwL0VhNGlsU2kzUDZQbXFtQkQx?=
 =?utf-8?B?V29rM2NtV043Ni80YWdmVXhhZ3BWTTFwWWlqd1d1TExWMHIwQjZpWUwzdTVm?=
 =?utf-8?B?dGU4bHVETEQzTE9zSi9zdVBJYi9QSUtDeGdTSjNjQnlsVDNBYVpEUDRiNDVi?=
 =?utf-8?B?UVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B13A97D59ABCD4428FDCDADBE44B2115@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cce24007-9a6b-4777-2096-08ddfb67200e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2025 12:37:29.4196
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IgBLmBr7pSou9aog+fjFwxi5lvsvwPldUsyE4ixoSE4Ltla8ReNebJDzCyU7eqMp5D3JPM78sbbkk1lalNm/0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6061
X-OriginatorOrg: intel.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 12:37:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119824

T24gV2VkLCAyMDI1LTA5LTI0IGF0IDIxOjMwICsxMjAwLCBBbmt1ciBUeWFnaSB2aWENCmxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcgd3JvdGU6DQo+IE9uIFdlZCwgU2VwIDI0LCAyMDI1IGF0IDg6MDLi
gK9QTSBDaGVuUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4gd3JvdGU6DQo+ID4gDQo+ID4gVGhl
cmUgYXJlIGEgZmV3IG1ham9yIHZlcnNpb24gdXBncmFkZXMgaW4gdGhpcyBzZXJpZXMuDQo+ID4g
DQo+IA0KPiBDb3JyZWN0IGJ1dCBJIGZvdW5kIG5vIGNvbmNlcm4gZnJvbSB0aGUgcmVzcGVjdGl2
ZSBjaGFuZ2Vsb2cuDQo+IEJ1dCBpZiB5b3UgKGFuZCBvdGhlcnMpIHRoaW5rIGl0IGNhbiBjYXVz
ZSBhbnkgaXNzdWUgdGhlbiBwbGVhc2UgbGV0DQo+IG1lIGtub3cNCj4gYW5kIEknbGwgZG8gc29t
ZSBtb3JlIHZhbGlkYXRpb24gb3RoZXJ3aXNlIGRyb3AgdGhhdCBwYXRjaC4NCg0KR2VuZXJhbCBn
dWlkZWxpbmVzIGFuZCB0aGluZ3MgdG8gbG9vayBvdXQgZm9yOg0KDQpodHRwczovL3dpa2kueW9j
dG9wcm9qZWN0Lm9yZy93aWtpL1N0YWJsZV9SZWxlYXNlX2FuZF9MVFMjU3RhYmxlL0xUU19QYXRj
aF9BY2NlcHRhbmNlX1BvbGljaWVzDQoNCg0KPiANCj4gPiBSZWdhcmRzLA0KPiA+IFFpDQo+IA0K
PiBjaGVlcnMNCj4gQW5rdXINCj4gDQo+ID4gDQo+ID4gT24gOS8yNC8yNSAxNTo1NiwgQW5rdXIg
VHlhZ2kgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgd3JvdGU6DQo+ID4gPiBUcnlpbmcgdG8g
a2VlcCByZWNpcGVzIGluIHRoZSB3YWxuYXNjYXIgYnJhbmNoIHVwZGF0ZWQgd2l0aA0KPiA+ID4g
dXNlZnVsIGZpeGVzDQo+ID4gPiBmcm9tIHRoZSBtYXN0ZXIgYnJhbmNoLg0KPiA+ID4gDQo+ID4g
PiBJIGludGVuZCB0byBzdWJtaXQgcGF0Y2ggc2VyaWVzIGZvciBlYWNoIHN1Yi1mb2xkZXIsIHRo
aXMgc2VyaWVzDQo+ID4gPiBpcyBmb3INCj4gPiA+IHRoZSByZWNpcGVzIGluc2lkZSAibWV0YS1v
ZS9yZWNpcGVzLWJzcCIuDQo+ID4gPiANCj4gPiA+IEkgaGF2ZSB0cmllZCB0byBjYXJlZnVsbHkg
cmV2aWV3IHRoZSBjaGFuZ2UgbG9ncyBhbmQgY29tbWl0IGxvZ3MNCj4gPiA+IHdoaWxlIHVwZGF0
aW5nDQo+ID4gPiByZWNpcGUgdmVyc2lvbnMuDQo+ID4gPiANCj4gPiA+IERpZCBiYXNpYyB2YWxp
ZGF0aW9uIGJ5IGJ1aWxkaW5nIGFnYWluc3QgcWVtdXg4Ni02NCBhbmQgcWVtdWFybTY0DQo+ID4g
PiBtYWNoaW5lIHRhcmdldHMuDQo+ID4gPiANCj4gPiA+IENoYW5ncWluZyBMaSAoMSk6DQo+ID4g
PiDCoMKgIGxzc2NzaTogdXBncmFkZSB0byB2ZXJzaW9uIDAuMzINCj4gPiA+IA0KPiA+ID4gR3lv
cmd5IFNhcnZhcmkgKDEpOg0KPiA+ID4gwqDCoCBsZWRtb246IHVwZ3JhZGUgMC45NyAtPiAxLjEu
MA0KPiA+ID4gDQo+ID4gPiBNaWtrbyBSYXBlbGkgKDIpOg0KPiA+ID4gwqDCoCBmd3VwZDogdXBk
YXRlIHRvIDIuMC4xMg0KPiA+ID4gwqDCoCBmd3VwZC1lZmk6IHVwZGF0ZSBmcm9tIDEuNiB0byAx
LjcNCj4gPiA+IA0KPiA+ID4gV2FuZyBNaW5neXUgKDIpOg0KPiA+ID4gwqDCoCBib2x0OiB1cGdy
YWRlIDAuOS42IC0+IDAuOS4xMA0KPiA+ID4gwqDCoCBmbGFzaHJvbTogdXBncmFkZSAxLjUuMSAt
PiAxLjYuMA0KPiA+ID4gDQo+ID4gPiDCoCAuLi4vYm9sdC97Ym9sdF8wLjkuNi5iYiA9PiBib2x0
XzAuOS4xMC5iYn3CoMKgwqAgfMKgwqAgMiArLQ0KPiA+ID4gwqAgLi4uLW1lc29uLUFkZC1vcHRp
b25zLXBjaXV0aWxzLWZ0ZGktdXNiLnBhdGNoIHzCoCAxNyArKy0NCj4gPiA+IMKgIC4uLi97Zmxh
c2hyb21fMS41LjEuYmIgPT4gZmxhc2hyb21fMS42LjAuYmJ9wqAgfMKgwqAgMiArLQ0KPiA+ID4g
wqAgLi4uX2JpbmFyeS5weS1Vc2UtZW52LXRvLWRldGVjdC1weXRob24zLnBhdGNoIHzCoCAyMyAt
LS0NCj4gPiA+IMKgIC4uLi97Znd1cGQtZWZpXzEuNi5iYiA9PiBmd3VwZC1lZmlfMS43LmJifcKg
wqDCoCB8wqDCoCA1ICstDQo+ID4gPiDCoCAuLi5jZXJ0cy5weS11c2UtdXNyLWJpbi1lbnYtZm9y
LXB5dGhvbjMucGF0Y2ggfMKgIDI4ICsrKysNCj4gPiA+IMKgIC4uLi1yZWR1Y2UtbHptYS1jb21w
cmVzc2lvbi1sZXZlbC1mcm9tLS5wYXRjaCB8wqAgNDcgKysrKysrDQo+ID4gPiDCoCBtZXRhLW9l
L3JlY2lwZXMtYnNwL2Z3dXBkL2Z3dXBkXzEuOS4yNS5iYsKgwqDCoMKgIHwgMTM0IC0tLS0tLS0t
LS0tDQo+ID4gPiAtLS0tLS0tDQo+ID4gPiDCoCBtZXRhLW9lL3JlY2lwZXMtYnNwL2Z3dXBkL2Z3
dXBkXzIuMC4xMi5iYsKgwqDCoMKgIHzCoCA5Mw0KPiA+ID4gKysrKysrKysrKysrDQo+ID4gPiDC
oCAuLi4vbGVkbW9uLzAwMDEtZml4LWJ1aWxkLXdpdGgtY2xhbmcucGF0Y2jCoMKgwqAgfMKgIDkw
IC0tLS0tLS0tLS0tDQo+ID4gPiAtDQo+ID4gPiDCoCAuLi5uY2x1ZGUtc3lzLXNlbGVjdC5oLWFu
ZC1zeXMtdHlwZXMuaC5wYXRjaH0gfMKgIDI3ICsrLS0NCj4gPiA+IMKgIC4uLi97bGVkbW9uXzAu
OTcuYmIgPT4gbGVkbW9uXzEuMS4wLmJifcKgwqDCoMKgwqDCoCB8wqAgMTAgKy0NCj4gPiA+IMKg
IC4uLi9sc3Njc2kve2xzc2NzaV8wMzAuYmIgPT4gbHNzY3NpXzAuMzIuYmJ9wqAgfMKgwqAgNiAr
LQ0KPiA+ID4gwqAgMTMgZmlsZXMgY2hhbmdlZCwgMTk3IGluc2VydGlvbnMoKyksIDI4NyBkZWxl
dGlvbnMoLSkNCj4gPiA+IMKgIHJlbmFtZSBtZXRhLW9lL3JlY2lwZXMtYnNwL2JvbHQve2JvbHRf
MC45LjYuYmIgPT4NCj4gPiA+IGJvbHRfMC45LjEwLmJifSAoOTIlKQ0KPiA+ID4gwqAgcmVuYW1l
IG1ldGEtb2UvcmVjaXBlcy1ic3AvZmxhc2hyb20ve2ZsYXNocm9tXzEuNS4xLmJiID0+DQo+ID4g
PiBmbGFzaHJvbV8xLjYuMC5iYn0gKDg5JSkNCj4gPiA+IMKgIGRlbGV0ZSBtb2RlIDEwMDY0NCBt
ZXRhLW9lL3JlY2lwZXMtYnNwL2Z3dXBkL2Z3dXBkLWVmaS8wMDAxLQ0KPiA+ID4gZWZpLWdlbmVy
YXRlX2JpbmFyeS5weS1Vc2UtZW52LXRvLWRldGVjdC1weXRob24zLnBhdGNoDQo+ID4gPiDCoCBy
ZW5hbWUgbWV0YS1vZS9yZWNpcGVzLWJzcC9md3VwZC97Znd1cGQtZWZpXzEuNi5iYiA9PiBmd3Vw
ZC0NCj4gPiA+IGVmaV8xLjcuYmJ9ICg5MCUpDQo+ID4gPiDCoCBjcmVhdGUgbW9kZSAxMDA2NDQg
bWV0YS1vZS9yZWNpcGVzLWJzcC9md3VwZC9md3VwZC8wMDAxLWJ1aWxkLQ0KPiA+ID4gY2VydHMu
cHktdXNlLXVzci1iaW4tZW52LWZvci1weXRob24zLnBhdGNoDQo+ID4gPiDCoCBjcmVhdGUgbW9k
ZSAxMDA2NDQgbWV0YS1vZS9yZWNpcGVzLWJzcC9md3VwZC9md3VwZC8wMDAxLWZ1LQ0KPiA+ID4g
bHptYS1jb21tb24uYy1yZWR1Y2UtbHptYS1jb21wcmVzc2lvbi1sZXZlbC1mcm9tLS5wYXRjaA0K
PiA+ID4gwqAgZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEtb2UvcmVjaXBlcy1ic3AvZnd1cGQvZnd1
cGRfMS45LjI1LmJiDQo+ID4gPiDCoCBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS1vZS9yZWNpcGVz
LWJzcC9md3VwZC9md3VwZF8yLjAuMTIuYmINCj4gPiA+IMKgIGRlbGV0ZSBtb2RlIDEwMDY0NCBt
ZXRhLW9lL3JlY2lwZXMtYnNwL2xlZG1vbi9sZWRtb24vMDAwMS1maXgtDQo+ID4gPiBidWlsZC13
aXRoLWNsYW5nLnBhdGNoDQo+ID4gPiDCoCByZW5hbWUgbWV0YS1vZS9yZWNpcGVzLWJzcC9sZWRt
b24vbGVkbW9uL3swMDAyLWluY2x1ZGUtc3lzLQ0KPiA+ID4gc2VsZWN0LmgtYW5kLXN5cy10eXBl
cy5oLnBhdGNoID0+IDAwMDEtaW5jbHVkZS1zeXMtc2VsZWN0LmgtYW5kLQ0KPiA+ID4gc3lzLXR5
cGVzLmgucGF0Y2h9ICg1NiUpDQo+ID4gPiDCoCByZW5hbWUgbWV0YS1vZS9yZWNpcGVzLWJzcC9s
ZWRtb24ve2xlZG1vbl8wLjk3LmJiID0+DQo+ID4gPiBsZWRtb25fMS4xLjAuYmJ9ICg3OSUpDQo+
ID4gPiDCoCByZW5hbWUgbWV0YS1vZS9yZWNpcGVzLWJzcC9sc3Njc2kve2xzc2NzaV8wMzAuYmIg
PT4NCj4gPiA+IGxzc2NzaV8wLjMyLmJifSAoNjMlKQ0KPiA+ID4gDQo+ID4gPiANCj4gPiA+IA0K
PiA+ID4gDQo+ID4gDQo+IA0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiBMaW5rczogWW91
IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gVmlldy9SZXBseSBP
bmxpbmUgKCMxMTk3OTUpOg0KPiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVu
ZW1iZWRkZWQtZGV2ZWwvbWVzc2FnZS8xMTk3OTUNCj4gTXV0ZSBUaGlzIFRvcGljOiBodHRwczov
L2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQvMTE1NDA4MzcxLzM2MTY3MDINCj4gR3JvdXAgT3du
ZXI6IG9wZW5lbWJlZGRlZC1kZXZlbCtvd25lckBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFVu
c3Vic2NyaWJlOg0KPiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRk
ZWQtZGV2ZWwvdW5zdWLCoFsNCj4gYW51ai5taXR0YWxAaW50ZWwuY29tXQ0KPiAtPS09LT0tPS09
LT0tPS09LT0tPS09LQ0K


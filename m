Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD558CCF9F8
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 06:38:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by mx.groups.io with SMTP id smtpd.web01.18134.1761806309192104408
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Oct 2025 23:38:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=lDZeUzIi;
 spf=pass (domain: intel.com, ip: 198.175.65.11, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761806309; x=1793342309;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=k37Lc0X4bd75ssnNF/klERg3UJYaHQ8KnB9zfY7ORZE=;
  b=lDZeUzIiJ2eGFVS30pPUQgpdRPDupRuWVS8tuiZ604bgdNOXBv0aBTlu
   E1nXgQnsZ5G5vivciKgJuJVuhGaxSonR3jJSSnEpjIl/ZWNFuy+OpDfRn
   xGQi5oOJ6bxVpk+4cIcKG8PjbFB08DafHwprZWm+uCMTrV4anRxnuc0D1
   XMy4T8JBiKBueTPWyGTNQOg2eosQqRkyLCgq+7NO3T0hIURT5PH1FG8lx
   l7DLxIM7YMetwvL+rlSjy1y72C2+UjH4klKBWuICoIsmFVdn2KCe1d7Pt
   2FqkuMbt88fx1Lw5aKy+dxxzCGveqeudA0V0to0AYq0Lac0wdkPWDYrlt
   w==;
X-CSE-ConnectionGUID: LZjPjUj5TxSGo5B+9WESjw==
X-CSE-MsgGUID: R7yixWNpR5+tpte6sTca9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="74230450"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; 
   d="scan'208";a="74230450"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 23:38:28 -0700
X-CSE-ConnectionGUID: UvsIWRYqTV+/96pXLRL/5Q==
X-CSE-MsgGUID: IW+12aJ3SnevhaWKA2qFdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; 
   d="scan'208";a="190235010"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 23:38:28 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 23:38:27 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 29 Oct 2025 23:38:27 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.71) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 23:38:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MR9qfH+Jwz09wb4I92FbK08WvzhHGJwagIuI0yAlDmtFLLp+/3hPaJGiyVBppaO0cRsNDS/g/qyzMC0DK5xSAu11RJHlH1nvcGNhhf9cW973cm6eplbAVpD+FFgPlA8wS3VfA95u3gFMRHCt12na/0t8xNr/LF/kasnghNEqrKBEZNwip7LCttcCIlpN23jfx6ljoUcGjKnwH1zgdle7bcsVyshaCi3nX/DevhS0mFzwkO3rpffQxInLHbGs+7Fil/8NrEhTXzFmVmG39IhmO+IlmBip5SPchKNsYEMV0+u4gBlmaTiYhm2VejLkT9ddaBKrydTnYu39ezLHft/QMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k37Lc0X4bd75ssnNF/klERg3UJYaHQ8KnB9zfY7ORZE=;
 b=ml6ngSapG1902ErCS3VNzoJNyPOURnY5UOBpShpXNBy0Pij9USx8da1b7oi5Z+oq8rgSIokzFkIjI/R3m2Q6YfMg/XEst2TwXuVpygrGdqcsMRyGpcaOPkF5cfPve5rptyp0Y31B1E4hWoFTeuBnhc717Q9+tmdxczVTcshUajqAr6pciogQSeL0LaNSf8qjx12iXH/ONF6+opS34NULdmEXddZA1sTWq6SgPRokcZHvGt/+t0FTziw3nVGbKXHJks95b+lK0BlOI8rJIiAZ0mTOLkJiuXSDw3CLGDYnikhrebdW52FS7IBcIIlExXialv+jnBsUDOrwHRgrsLj1mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by DS7PR11MB8854.namprd11.prod.outlook.com (2603:10b6:8:256::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 06:38:25 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%2]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 06:38:25 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "ankur.tyagi85@gmail.com" <ankur.tyagi85@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: "ninette@thehoodiefirm.com" <ninette@thehoodiefirm.com>,
	"raj.khem@gmail.com" <raj.khem@gmail.com>
Subject: Re: [oe][meta-oe][scarthgap][PATCH 1/4] mercurial: Update CVE status
 for CVE-2022-43410
Thread-Topic: [oe][meta-oe][scarthgap][PATCH 1/4] mercurial: Update CVE status
 for CVE-2022-43410
Thread-Index: AQHcPZ32RRNhLIyH7kGmvNT6hIagz7TaVFgA
Date: Thu, 30 Oct 2025 06:38:25 +0000
Message-ID: <fcb5f25762c06c8566d2fcfbcd4d0c2ad4e8c28a.camel@intel.com>
References: <20251015063531.1573191-1-ankur.tyagi85@gmail.com>
In-Reply-To: <20251015063531.1573191-1-ankur.tyagi85@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|DS7PR11MB8854:EE_
x-ms-office365-filtering-correlation-id: 22331d2d-9a9b-42b1-e12e-08de177eedb2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|4022899009|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?bllnbStXT3lRWW56bk1pWTc5TWIzUzRKeXdGSnd4OU5kSmhxYzRLdnhsSXA3?=
 =?utf-8?B?L1lYNmhuaURIOWhPVVZsS0Rod0dZQzlvdXA4UEd5K3NKS2Z4VURRK3RJbkNM?=
 =?utf-8?B?Zlo2QnBwTnBSVmMzampNeXBEb1lHTmJmTUlaeTJiSG5jVWdDb3FKd1dDMFFn?=
 =?utf-8?B?ak91Wm4zQWZkbWsrQk85ZmxIZlQ2VmZUQkZhaGRLSitkdVBUcnRHZFBIbjBi?=
 =?utf-8?B?VVRKeVVmbmU0cnNYZDNlS3Jkdy9RdjB6QVF2aVlRR1JQN3VRdENtdmN2SitC?=
 =?utf-8?B?aVRiL1RPRFpxOTFUMmp4TUovNW9uWTk3NXptZFEvRTM0WTRGTzNDaDFmYTRu?=
 =?utf-8?B?cEJzMVJjY2N0Z2dlejZKMjdVbU5ic1UweWw2TlVjWFNyNUEyd29wdXhOQXVl?=
 =?utf-8?B?Ti9vNW9FT3NqajN1aldzTjZFSXlrTDRmUXM1NEowZzg1ZzRWNUdIQmFBWEJh?=
 =?utf-8?B?ZjNYMkpuR0VKOUN4cGZ4bnpvOTFtQWEyNDdtRXBySWVZUEdyV3BkUU9KV3Zt?=
 =?utf-8?B?YXlIN2NyVHc0KzNJaHFnS2pzQnFHYlBJRkJ4UlgwK3g3UHRpTzFhVE9yeE8y?=
 =?utf-8?B?aFJzT25sU2E5c29teklibENUbDFuUEgyWEc1ZndVem1pVzVub3poM2NCWXMy?=
 =?utf-8?B?RUZvL2c4SmtiUjBOOFNLbmZ4ZkVTMkJhWU4zcnJOSGFYSXJSVTJ2ay91RUNi?=
 =?utf-8?B?aWg3WlhBZVl3SXpDVWppZzBQMnlHOVU4bTBFR09MbkEza0N6dzdNcktXdlJJ?=
 =?utf-8?B?ZW16MFlDcnc2dVRIRVNiTVNwWDZSdmRjaEJueXhUWkZTOU1uTUYrQ25SZUJ5?=
 =?utf-8?B?ekZ2OTdjVUhKTGRIbmhuMUpMQ1hER1JRRGhqWHphUW9aVmwyTjBnZG1kUC9p?=
 =?utf-8?B?UFpWN24wWjBPUFc4NGoyMDU2NmkvSldCeEJZMzROTFhvbkZrQ3lCdTRSUTlT?=
 =?utf-8?B?VU5VTWhXWldOVzY4SGtsWGVXUHY3TVJmdGlDTk4zclpHTkNFNlM3d1FBMzJY?=
 =?utf-8?B?MC9FQjN1N2tlWkFDOFN6YVVPb2hNaEN1dW1qRXlVSGltMHlScGViU1J3QWlE?=
 =?utf-8?B?ZWhWQWF1cFc0ZWpwT3RyaG1XWDcxMS9sTUV2dkFsMWFPM1djUDc5TG1BQkNP?=
 =?utf-8?B?aVVPOEFvdU1lZ0M2a3R2akc3bFVxNHVOQzEwRFNXSzNDMTFlSW5manBtZ3JV?=
 =?utf-8?B?WXZCMVQzRis0L1I4WjNteEV1Y0tEdDhWblNmdnhxTjRkdElEc0lJbWN6NEd5?=
 =?utf-8?B?d0pCWUtrbnlTMHJBRnk3YXhlc1NVT0luUVZ6c1VMNFg4NmtVcW50RGFDZXlR?=
 =?utf-8?B?NzBkTWJUdmJYa0JFSHJieVRQQXlMT3VCS1Z3b1E1d2tPYy9aZ0pxc0lkNjBS?=
 =?utf-8?B?R1B3MWN4K3BPT081eGxSL1Z6TTk1YjNDQkxYcmJOR1pMYlBhbTZIZ01zR2h4?=
 =?utf-8?B?T2IxTVNPWEtTZ1VwY2VMZTRnVmE1RUJZMlpsRllMRWtzYjdLRTl2Q3ErdDJ1?=
 =?utf-8?B?OEd0RnROK0tBN0FScEM4Y1c4SUVjeU1VcDRDcTRBR1A3TkNYM0U4Z0MrT1d5?=
 =?utf-8?B?SVlBL1lWRU1LS1BBdGdaL1hrNU9WWW9odnYvWWE0bEIyeTlIZzNXWlRlOHNH?=
 =?utf-8?B?dXI4RE96eEloN1JRN3g3OVNLUzlqVitBTkpqeVNYblVKUG5KN29wQ0ZYTEJ3?=
 =?utf-8?B?SHVESzVQQnMzclFMV05PUStGTDdSMXYzSmsvRXNqUGZWaHNWOUJGREtEQWVq?=
 =?utf-8?B?dFJucE8yYnZPS3NsNG84VFFyRUFNZUhEcU1BU2VBaHFxeGo5UGp5UEM0OGh3?=
 =?utf-8?B?MWpaYmRYZjgrOStScHNwOFhSeHNIQmROS0NLY0JnaDcvUWl6VHBZU0RLc2ZS?=
 =?utf-8?B?RnRXMktycHhVYXNTR0hUczZSamZ4UjRPWmdYUWh2ZG1tUEFWY3RiUU9KbW1v?=
 =?utf-8?Q?bs2kwzibzRi9ksSlLxfh1XJgp0ZP+G9Q?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(4022899009)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ak0yVXlHNHFIQTRROXF4Z3hOMDlDeGl6eWtRK1lnVkVzY3dhd1Fqc2puTjRM?=
 =?utf-8?B?Q2JIeGg1L2FRNlU3bnd4NXgxNURZREY1TXRZWUpianJSUnNRTU8zcDRWWHJE?=
 =?utf-8?B?aFV1YXg2V2NJNTVjaWVKZkZmRjNVdVovVEpOZ01FVE91S3RPMDh3WlJ3bWVp?=
 =?utf-8?B?WVVKN094ZDBxNkVLcll4eFdUZTJEanpiTkQwVlZLR3d2VlZSMWV3TWNFYkpL?=
 =?utf-8?B?dUhlOEtXTjBRd05LVTRzY3B4SVZ0dUM1cmhZOWxaSkVlc3ViSVhCNytpU24r?=
 =?utf-8?B?Q1gwWW1YOHlxUmJHa3AvdkYvNHlWNjBLQkJINTF3VjhIRUZaczF4VmFLSWJN?=
 =?utf-8?B?b002M1VseTkrUWU3ZzhKWHl2NUxYZHhqNHloRzFFa3BsMEtEeHlNQlAzTERm?=
 =?utf-8?B?S1NYWFJWVko0cWM3OUZHTTdTVHlxS28wWDRRUXhnMi9jQlJXQnBPRHVzRlBC?=
 =?utf-8?B?ejVCQ010aGtWM0x0NGljeStUYmtYV1E5NGpKakRkZzQrTXlkN2lEVGM1cEd5?=
 =?utf-8?B?YTA2eDNZMFRQa0tibjNjQmtDMjdTM0VONHFBRHlHUHpETHZYQ1VRZjNEcjk4?=
 =?utf-8?B?SElhQ05tSXFjS0xRcThBejhBME83a3locHp5ODUvWmFweXl6VThheGMwNFgr?=
 =?utf-8?B?SmhacXZzUGs3Y2FKMUgvb0MyM3lhRHhnZ3NjVnJSSENXOW1pOWxibVpvNFcy?=
 =?utf-8?B?UlppWlRVY0h1V29oNDFVb1BjUWZYWHB2Q1dST21vQWppQXgyd2xTRjlJamFQ?=
 =?utf-8?B?OENhelRVNVpaTFg5cHgzSHNjVk9YbzZ6Z1lCZzJyUVVqNCtDR0lYdldPYUE5?=
 =?utf-8?B?S2FBenVFNVgyQ2wveGtTRWVBcTV2c0JsTVppZXRJUHpqbTVqeDI4SWVQQlZD?=
 =?utf-8?B?UzI1NlEydXMxYTZka1Y2VWdrWUZaTFRxdlZESGliYU5LNlIyN2pkQnVValkr?=
 =?utf-8?B?cm1LUlhEMTVOMHljaGJOYTFxZURpdEMrQUhnaHg0M0ZRL0JSdTNxYzJmdjBM?=
 =?utf-8?B?eHN1RVNRUHEvcTlpSGErQWVJcnh3NFl4OXF4aisyMzRDWXdXWDhuNkJBUHB6?=
 =?utf-8?B?ZTMrcXZQaXE2YjFzdVdPME1CZUZlVENQbTdtMXR2ZUx1UDA5dHhITVA4Q2V3?=
 =?utf-8?B?amZVQVBoUUJPMHJFMm5YQ3UxbWo0RklUb2o1Mmw3cjVBb21CeHRWTS82L0Jp?=
 =?utf-8?B?dXM4c0NjYUlYczgyaVlaMlUzQWRmSWJabXltQWFOOHJQZ1NjZ1lSMDJ4T0NM?=
 =?utf-8?B?dkRiM093YTdPTG1WMjlsWjNkT2NZSGxnaHVucGpaZ0xNVTAybzNhUExMQWRs?=
 =?utf-8?B?elgwSUZLenJCMSs4cjU1bVRLVWx6THp5RGNmTUpLUy9HWU1SNGV2cm5WZkVt?=
 =?utf-8?B?NGR5RnM4WWRpanlSN3F5R3M5dmZ2RjJKM2tTSFh3NnMvRWFIUTlBVkQ0TWov?=
 =?utf-8?B?MHdUWjNPMk41NEdYdlI3OExYSThvVlUvRi81ZHZnZEZIZ3JJZFVMSjVRSzJl?=
 =?utf-8?B?eDEvOUF6a0hVS053a3ZBZWhBdkZvQWlrWHRKNElKQ1hrVlAySzdyV2M2K1JM?=
 =?utf-8?B?Wk0ySW9ueWhtVjZBSm56Uy9yTlh3V3ovd05ZUlNOam5hcHlmR0l0R2lpMC9F?=
 =?utf-8?B?dkJWOUNRUHRmN2RFU2NQdWFKRTNlQTNkMDI1NFA4OVIvVVd2ZlU0M1dEZFpR?=
 =?utf-8?B?dE10RVpEUTN0YXVrbnJtVHdmU09mNEVrZlhFOCtZbGFmMGs1Y003cmFINm9I?=
 =?utf-8?B?Uit3ME9DQ1ZlUElRMEJGaU5FdFRzb1U5VU5kbnVkU0dmSnZ6eEJ3YnYxMUNp?=
 =?utf-8?B?QlBSVXRpU0psMnd2MFNjbU5hT2hXZmVjUXNpTnZnaDdCam9VNFFiektnNjd3?=
 =?utf-8?B?MWNBR1ZjSUYxZjMvUGI1c2J2MVN5dHRDSEFZU21JUjhNb3dQdUdUbytGS1Bm?=
 =?utf-8?B?dSt4Ym96aERkZXd6NjFrbDg3TmQyQm55US92cEdsNkQ2cVdkMERHRFR4NWFZ?=
 =?utf-8?B?SGlCSjZCek02NzgwTzVKSlRJNTdZN1lzMTZoazlTa2F4aTd4Y0xKMGJXUWFZ?=
 =?utf-8?B?OWVPcUROL1RaalFXV3hmajBHbU0xR2Z1STJkUklEd0Qzb01XQkZMYWJDeUc3?=
 =?utf-8?B?K1FHSUJCaFJRR2ZzNjg0ZldmK2wwYWpLcDBpU2JMN2VGcmloSWFNL1o2ZnJC?=
 =?utf-8?B?Q1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3342A72CCC56BE46AD1DA513FDB3B102@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22331d2d-9a9b-42b1-e12e-08de177eedb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2025 06:38:25.3839
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +r4OXSkxGudhl+4xoEg1yZwPzEaO2WZS3E4i/r6hBDPI2yWq2Muoh0Dci6MMxfTVk6njU+mGN3Fd+WYNeFCc9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8854
X-OriginatorOrg: intel.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Oct 2025 06:38:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121196

T24gV2VkLCAyMDI1LTEwLTE1IGF0IDE5OjM1ICsxMzAwLCBBbmt1ciBUeWFnaSB2aWENCmxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcgd3JvdGU6DQo+IEZyb206IE5pbmV0dGUgQWRoaWthcmkgPG5pbmV0
dGVAdGhlaG9vZGllZmlybS5jb20+DQo+IA0KPiBUaGUgcmVjaXBlIHVzZWQgaW4gdGhlIGBtZXRh
LW9wZW5lbWJlZGRlZGAgaXMgYSBkaWZmZXJlbnQgbWVyY3VyaWFsDQo+IHBhY2thZ2UgY29tcGFy
ZWQgdG8gdGhlIG9uZSB3aGljaCBoYXMgdGhlIENWRSBpc3N1ZS4NCj4gUGFja2FnZSB1c2VkIGlu
IGBtZXRhLWVtYmVkZGVkYDogaHR0cHM6Ly93d3cubWVyY3VyaWFsLXNjbS5vcmcvDQo+IFBhY2th
Z2Ugd2l0aCBDVkUgaXNzdWUgaXMgYSBKZW5raW5zIHBsdWdpbjoNCj4gaHR0cHM6Ly9wbHVnaW5z
LmplbmtpbnMuaW8vbWVyY3VyaWFsLw0KPiAoVGhpcyBpcyByZWZsZWN0ZWQgaW4gdGhlIENQRSkN
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IE5pbmV0dGUgQWRoaWthcmkgPG5pbmV0dGVAdGhlaG9vZGll
ZmlybS5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+
DQo+IChjaGVycnkgcGlja2VkIGZyb20gY29tbWl0IGJmODRhYzFjNGMxYTAwYzJhYTkyYTA5ZmJk
ZmFlMTI4ZDA1NWZlMDUpDQo+IFNpZ25lZC1vZmYtYnk6IEFua3VyIFR5YWdpIDxhbmt1ci50eWFn
aTg1QGdtYWlsLmNvbT4NCj4gLS0tDQo+IMKgbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xzL21lcmN1
cmlhbC9tZXJjdXJpYWxfNi41LmJiIHwgMSArDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xzL21lcmN1
cmlhbC9tZXJjdXJpYWxfNi41LmJiDQo+IGIvbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xzL21lcmN1
cmlhbC9tZXJjdXJpYWxfNi41LmJiDQo+IGluZGV4IDI0NTFhMzZiZTIuLjUzZmUwYTI4YWUgMTAw
NjQ0DQo+IC0tLSBhL21ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9tZXJjdXJpYWwvbWVyY3VyaWFs
XzYuNS5iYg0KPiArKysgYi9tZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMvbWVyY3VyaWFsL21lcmN1
cmlhbF82LjUuYmINCj4gQEAgLTM0LDMgKzM0LDQgQEAgUEFDS0FHRVMgPSsgIiR7UE59LXB5dGhv
biINCj4gwqBGSUxFUzoke1BOfSArPSAiJHtQWVRIT05fU0lURVBBQ0tBR0VTX0RJUn0gJHtkYXRh
ZGlyfSINCj4gwqBGSUxFUzoke1BOfS1weXRob24gPSAiJHtub25hcmNoX2xpYmRpcn0vJHtQWVRI
T05fRElSfSINCj4gwqANCj4gK0NWRV9TVEFUVVNbQ1ZFLTIwMjItNDM0MTBdID0gImNwZS1pbmNv
cnJlY3Q6IFRoZSByZWNpcGUgdXNlZCBpbiB0aGUNCj4gYG1ldGEtb3BlbmVtYmVkZGVkYCBpcyBh
IGRpZmZlcmVudCBtZXJjdXJpYWwgcGFja2FnZSBjb21wYXJlZCB0byB0aGUNCj4gb25lIHdoaWNo
IGhhcyB0aGUgQ1ZFIGlzc3VlLiINCg0KVGhpcyBzaG91bGRuJ3QgYmUgYSBjcGUtaW5jb3JyZWN0
IGluIHRoYXQgY2FzZSBhbmQgc2hvdWxkIHVzZQ0KbWVyY3VyaWFsLXNjbSBhcyB0aGUgdmVuZG9y
IGluIENWRV9QUk9EVUNULg0KDQo+IA0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiBMaW5r
czogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gVmlldy9S
ZXBseSBPbmxpbmUgKCMxMjA2OTApOg0KPiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcv
Zy9vcGVuZW1iZWRkZWQtZGV2ZWwvbWVzc2FnZS8xMjA2OTANCj4gTXV0ZSBUaGlzIFRvcGljOiBo
dHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQvMTE1NzY2ODEwLzM2MTY3MDINCj4gR3Jv
dXAgT3duZXI6IG9wZW5lbWJlZGRlZC1kZXZlbCtvd25lckBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
DQo+IFVuc3Vic2NyaWJlOg0KPiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVu
ZW1iZWRkZWQtZGV2ZWwvdW5zdWLCoFsNCj4gYW51ai5taXR0YWxAaW50ZWwuY29tXQ0KPiAtPS09
LT0tPS09LT0tPS09LT0tPS09LQ0K


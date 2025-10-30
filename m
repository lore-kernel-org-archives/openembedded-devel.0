Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94B0DCCF9EA
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 06:24:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by mx.groups.io with SMTP id smtpd.web01.18066.1761805444219776348
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Oct 2025 23:24:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=KnH07V2g;
 spf=pass (domain: intel.com, ip: 198.175.65.16, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761805444; x=1793341444;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=pYoPUamOn5E/CUFrn3q5KcGkUNgeSIonZ/LwrhaFu8c=;
  b=KnH07V2gpk1yCWUANMUHePM3KAYpfaa0bi8z7S+meTECF6qrei4uCq+i
   6zMd1hchv9lA4a0L71e55kNaUV4xRlwJSPN97PBVkkV7e5xkVN6ojtsob
   /emh8iASC3fqWEEq+TEck4N49uSBcaKZ21QstER12UP9ZQJvkJO3Tah3q
   OuAzcTbmc18RWGlCZQcc18ubUw0UzW5m1K/j9pNgeCnII616wvzy10YMh
   WEHijZg8CJY7JKUTrWLFoSBx74GCBQArDHcyPfXMrpWpsOMjeipfqLzve
   1yyr6AgNV3B2BY/hDPRzzQhRuXKXzpKtVYgyGc78Uwrmd/ativBBtuzgi
   g==;
X-CSE-ConnectionGUID: bePwxSq/RxOtGD8arV5SRQ==
X-CSE-MsgGUID: 7fHFoosAReKvrlMtDxhGqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="64087411"
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="64087411"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 23:24:03 -0700
X-CSE-ConnectionGUID: nNICvkGCSL2mzTkfAOtwig==
X-CSE-MsgGUID: BMbF0GwiRXaMqG720pRsaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="190202211"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 23:24:03 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 23:24:03 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 29 Oct 2025 23:24:03 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.23) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 23:24:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L8DTGmOOH2O4qlkU+2+C8IFzq4vzcFANVISjlBrp2hGz76xDvvfShxUR5jzC+l3f0KtcJP4zPjnCAhW1Yjg1jPWONEwCYyuaa/rMyLmlv62EhjvzJXosmSO3H15vf9N4Z97wHgWQbGEEdlHVZC+1eHGvL+hx+/Ka9ODKTmVCumjYQcVi7GckssjlUJNN+HTsKVKPc1Z+7A0GD48wlmeuqMR0tfsAovoFndqCONXLZ16tVm2a8HyKz/lLoNMrt4PQZIROU7TQpgjynf8O5xfKYzwVzKj9edvcL4A+kZH35AEoTWcJJVHJJT98d56cqhYZ2+Efh8MVaCdhxqxtnGy9qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pYoPUamOn5E/CUFrn3q5KcGkUNgeSIonZ/LwrhaFu8c=;
 b=x8kp+n7oCUuVdSFet82X2ghoYf/tfvaO7n7LoakBDK3ZTZ2dKcZ49fyEoRSzH5uw/jOo2U4OXrACTnR7c+s83mrTW7TSG+JmrJnuDgIxLDq+ZLo6yBARFG8fMpKBtwbUBebQ1e61F8R2ozxFei/DViid6aaBxSemAGC4H8YZ9ya2By8ov7euyniZetQgLFKkWSuNDeEa0WPmlr6XG7xoGEtRJrxr6lrWRPJtSHj40HGnmJXPnQ6MCoSt5bIxEGEscEEouYXsQ3esN7Ua3sbeF1CxLQt/eLKEn4OZW4EW5ggTcpJiXJaFcjZx4D/xa4krSo0gVdK7dW/G0f+iAqyJpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by DM6PR11MB4577.namprd11.prod.outlook.com (2603:10b6:5:2a1::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 06:23:55 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%2]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 06:23:55 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "saravanan.kadambathursubramaniyam@windriver.com"
	<saravanan.kadambathursubramaniyam@windriver.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe][meta-oe][scarthgap][PATCH 1/1] fio: fix CVE-2025-10823
Thread-Topic: [oe][meta-oe][scarthgap][PATCH 1/1] fio: fix CVE-2025-10823
Thread-Index: AQHcPZr+N3emZA+ZUEiuwYTtQ89at7TaUFCA
Date: Thu, 30 Oct 2025 06:23:55 +0000
Message-ID: <11f1fc8800a330c83888f012796ec7e95d971a01.camel@intel.com>
References: <20251015061424.3560575-1-saravanan.kadambathursubramaniyam@windriver.com>
In-Reply-To: <20251015061424.3560575-1-saravanan.kadambathursubramaniyam@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|DM6PR11MB4577:EE_
x-ms-office365-filtering-correlation-id: f43af537-e63b-4a18-f6d8-08de177ce74c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|4022899009|13003099007|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?VWthcDQ0Zlk4NzdFTFB6RWZBT3gydktwSUMvQVo4SzJTeGF2amR6NEdzSVBT?=
 =?utf-8?B?YUt2OTNiZFh3dlM4TVJiYURHMVJkVTJlL3k3bjdFVEFPaWgwdktsWFZnMDd0?=
 =?utf-8?B?cHVCN0toMVZkbjM3NWl3MFhEUEVicVpxYW1GdTAzaEN1bTEwSlR5NVdDbGFi?=
 =?utf-8?B?ZmUya3NCeFYzRVNXUExEWC9oZ3pieVlVcmhpQStlandxV1BVOTVNWXlkSFJn?=
 =?utf-8?B?ZW9tcER5MDNMQklOdUtQblV5WWZZekJ5a2N1czVReDVseGI5bzVDK1gvQUM3?=
 =?utf-8?B?MFNzVmY0R004MjY4MjNPWHRBSzNQRTZ4VlR0RmltNHNiNFBCWTRra1NHRGNw?=
 =?utf-8?B?Q3E0TnpwY0lYLzBMaDJHRGJQNHlSWWNNMFNmYnhSTnJxVzF6UmoxOGhEM05q?=
 =?utf-8?B?RU40dVduSlJMRXFtYTYvODQ4ZzllU25Md2FYTExiNThiUU1sa3lvWnpPdjRv?=
 =?utf-8?B?Mjh1R25hL0Y4MjdxTTBMNmpvb0k4ZG1WS3Q1TFZ2bytwQWU5cTk4TzdxdzJl?=
 =?utf-8?B?bjVrU3I5V0NwM01veUNQeEc4WUNuYjlKZFlidEJpSkYraE9ObHNzT0krMGFz?=
 =?utf-8?B?dUhQTDZxbFplZ2gxbStNanFRb2EwTzNCaENBdm55ajdYNFFDTFphZzA1Smhm?=
 =?utf-8?B?bTF2WVhzRCtoTzRCZHFWWlFFZHZEQ1pkYUxlVHJ1T2dXU3NIdkI5dEVsOER0?=
 =?utf-8?B?VUF5Q3dOT0dPdjh6MFJFOUVyZkxZL3JDMThlL3I1WnMxSWRyeFppWWQrL29L?=
 =?utf-8?B?c3dWUjNvZERrbmhab3dWZ0VVNzlZcUVGK1ZnUWVQUzdBd05EUCtFeEtXR1VD?=
 =?utf-8?B?M1ViZHNUZnB1VFJGQmlubzRETzZQZnNNL3dOWEFOZm9XUzJHMi9IQnZ2eE1i?=
 =?utf-8?B?UUdQdFRnRVl2S1VONEI4SjVRdzc0NWh3NGRacnh6K2VLUGxYeWtZdElSSm94?=
 =?utf-8?B?ckVQTnh3c1dBb1lQMUlINGE0Wk1UZGIxdFNiM2djcXpXVmxhZCtIVFgrakNz?=
 =?utf-8?B?Wjc4VWNBaFJLL0RSc0FxZnZtU3dFdWliRFA2VUpEaTA4Z0RiUFVoNG40OUhH?=
 =?utf-8?B?ZFo4b1hNQnluOFRrQXlOeUhNL3BzVmU3Tmt6ZlBkTm9ZMGFGdVF2cDNCcFhv?=
 =?utf-8?B?ZUNtY01wcnFTNm51MlFscHdUdjgxdG1HSTJCdkFMNXkwaTN2ZEJaR24vRU1L?=
 =?utf-8?B?Z2FBeE1qcWJsemF1Um1pQnhDWWRPaHpsZGVTZnlwM2tpYnVqU3RPbExmeHp3?=
 =?utf-8?B?Zit1VHNCQWd1OGRLaVhONFFmYml0MTZtYnk2MXZUZXhQY015TWV0eHhZL3Ns?=
 =?utf-8?B?U05iSi9VRXphQlRXWXZ0Rkh5THdJa3VodjBWcVMzMHVEN1ZhYXg2b1YzSmNj?=
 =?utf-8?B?c0FsUzFmbWwrM0lGYkVRT29LM1J5VXdRQmxNbUVpV2xVdUFWMGhMQ3FZRUdx?=
 =?utf-8?B?U205UGpodWswVXFjaVA1SlN3OE5oMi93RUZSWTVvN1U1UUNJdUJuSzY4Y0JJ?=
 =?utf-8?B?WEVQcGg0QW9Ram1YeENSbHFTSkRaVVRJZE0xU2F5cVFLZjVkT0ZxL0x3anF3?=
 =?utf-8?B?Z3p3OEVrOVYvek9JTmVlK0s5WnVIZWU5bmxUU2Y4NUVtNldwREZ3VTMxQ2l0?=
 =?utf-8?B?RFRIWjJ0aFIxcjdhcjIwMnc5OHM4SnJCUUhhUXFOZW83RGpYeDQrTlQ4Rms0?=
 =?utf-8?B?OCsxOEl1TDdqWVQ4eEdiN2xySVRQK3UyS0V1VWpka25DTmVmWk9xd2VVQlNQ?=
 =?utf-8?B?MDhEdjcrdFNuY3F2SFArMmJDbndSU0EzWXlWZ3diTUN0NEJtbG5GNnhwTzFE?=
 =?utf-8?B?Q2hKdnc3MUJRRHRQZmowRDBmQVdNdXZoaCtwOVZWSXF1UVFMbEczOXdGeita?=
 =?utf-8?B?ai9VcnRSWWFFaHYrbjZleGFmTVhlVHlKdEg4cVRkbWlZcEl6VHN2QTV2V2hC?=
 =?utf-8?B?aSt2dC9hVUFiaHp5NVpOMXI3SXI5d2FzRHlZSWVqVmRhSUkzOURjTUlKR1BH?=
 =?utf-8?B?YmhDMHE3VE9RPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4022899009)(13003099007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z1RDMDE2ZmxGVHFKUzM2M2hsblVxMFFJZ1MxWkhJeDZiSHEwc3lhUmJKbWNp?=
 =?utf-8?B?TEc0WkZJekdLZ3NOb3hWbm4weExtQTJXTys5SUVCM2l2Yk8zT1ZBVUE0UnI1?=
 =?utf-8?B?bS9NdENnVlk0WUJyQUk0Yi8wYUJOTGg2ZGJxODZaZ1VIVmlxeFdIR1QyYlI3?=
 =?utf-8?B?WVA3Ulpkb3FvbnVQN005cDVTNityeFd4aHZXaElLT01tRkFBZzhMcU8wdUtZ?=
 =?utf-8?B?MWg3KzZUSnNxNXlnVUh3QWdQSVFBa0o4eDJPcVBsM2J2K2x1TzFGeDhqWm9m?=
 =?utf-8?B?R2RzM2l1KzY1dm1ZZFZ5ampGSm9IRnFCSnNGd2tLRmttQU1aTDR3dDdFclkw?=
 =?utf-8?B?OFJvbXJWNmVlM3duNFh0aVRsYmZnVWo1SDA3bzZBY2VjRjVacHdwU0FLM1Z0?=
 =?utf-8?B?WldYZkFzREd1Nmw1empJVEdhdE0wR2RmUEdqZVl4SWRERElrS09nR2htWExl?=
 =?utf-8?B?U3cxL0s0SzlRck9oSStrVkVwdzJWa3JKd3kzNjY5QnJ1L3QwM3ZVMmhkVU84?=
 =?utf-8?B?eUNOTUd0Wks4QnBFSEErOWRrSmt3RXNsOUpxdjlPa0NhellrK0hiYUtZRFBy?=
 =?utf-8?B?WlBaaFJyM0RHeklPcVppMHBkWTdWS3N0WkoxQ0JIL2pWWTJSWWNLNVJ3QkhJ?=
 =?utf-8?B?dzdkdzV4TFBxOU44UWZPeGwzYTlPb2U2V3oxYXlzM05GSGl5N3QwNXA0a3pw?=
 =?utf-8?B?YUQ1N2czUU1WN0Z1MTdHS2dwbHFTQVloRHRHK2tIa0ZndStmYWNIQ0ZVN0Ew?=
 =?utf-8?B?S05VeFNHTzVpZXBMY3h1eTVyM0tPSk4rU0RyUUdidEg3cS9MSHV6Z09JYmkz?=
 =?utf-8?B?ZGNraWY3NEc3b1pOcVZOeEtsQXlmNnQ4WSs4aW8zY2NIQTBYNG1zZG1ZTjFH?=
 =?utf-8?B?WGNHaEYxM3dTTWd2bzc4ajQ3UnlBNFFtK1Y1QVZ4RFRKM1dmbm04Qkd6Nk40?=
 =?utf-8?B?U0lxOUtKU0VpTGNpblpKYVFqd2dmVjRiZmlZQ0xialh4SG5HTlI5Y2lGZmpU?=
 =?utf-8?B?UWM5WC94VC80bzlBYXA5NWMwU2g4MU5qM09kd0lRV3lFL0JLZDE5UmVwT3Z1?=
 =?utf-8?B?VVYxSzVjQi90Q2FyTWIxbTJkQk5xWU5nYnVhN2V2S1hqMVg1V3FyZk55OGtZ?=
 =?utf-8?B?ZE9UblZSZlBJOHRqRWtFazZmZU5DTWFYYkZBd0ZhR0JEbnIwQkMvNmpuVzM1?=
 =?utf-8?B?QVA4a2tSMHU4UUlaVldjSVk2Mm1Yc1V1THFzRkZuV21RRUVvcFlQVVhtMG5a?=
 =?utf-8?B?TElJNzBuTnY0NVVWZ0xFRVhLcE0zam1hUCtpMy9SZnZ2SThrMUtiWHFyS1BY?=
 =?utf-8?B?Mzg1QVZDN3FYZ0Fad0RjWjF2OGRXYndHY0FpSURTWnhORXRMUHlBSHR4RFFr?=
 =?utf-8?B?R2wzUTl5RHZkVWJETGtsaHZ0Y3l3dytIVll1NW1iSFhvZjAvNXhkam9PNzI2?=
 =?utf-8?B?MGhoYnZXbUNzdlJreks0TEdJY0UzdG4rMzBlZndIMTY3MnFZMnV1TndJUnVt?=
 =?utf-8?B?ZHY3aWtQZzMrT0RQL1I3NG84Vzk1M0RBUTBxcldpb0RudWZseklCTUpJZHRL?=
 =?utf-8?B?eUV4UnU0UEhrZEJuRWFxU09yVTNSRXpBMkk2c3c3cFhZVmQveW55cWdkbEhW?=
 =?utf-8?B?SEtLV3d6TEI0Mll5Y2hmRmdDeXRUa0pkcU9KSDJBYlpaOWFCbHhPSFNWa2ZI?=
 =?utf-8?B?M2xqTHEyY296SmlPdC9JN3VCOFltSDJiTCtsajd1eUhwV3VqSUxrZVhtOXZ1?=
 =?utf-8?B?U0NyY0dlOWw0bU1oeDJqZVVKa05LZHBoSVBsWXZMODByWEh1Uk1XMi9mYUpx?=
 =?utf-8?B?S0FERDE3MEZlRHU2ZTMya3RCdElCZlVZMlpkUUhLeXR6SmVzUWI4Ukw4QmRy?=
 =?utf-8?B?TTNlbUdpWWViU1ZiMy8xRHZNc3gxbHhmaDdmU0FPcG5lcWdIbDBNeXd3bEMx?=
 =?utf-8?B?d1R2MTVXVmowU3A2bEFuMXR4RWYzVzNYNU13MWx2cWZ2Rllnc3F3UnE0NjlJ?=
 =?utf-8?B?ck5VUkVLakxUYndQbjVLVnpjOHdqTlVKcWNYbUZ3K3hxTmRtVUN4RHo2SGVZ?=
 =?utf-8?B?ZnFCRFhOR240aWV1QSsyZStrYnlWUDRPb1FRSCsxMHNidHZ6QnZHNHdDV1Mw?=
 =?utf-8?B?ZkZibUJFZ2ZUQjFVV29IcU85NXB3Zi9OUkQwb0h4YjdpanFmbkV1TndNMVZz?=
 =?utf-8?B?bGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7D95C8556BAB3D4583D91EDD1C7DF771@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f43af537-e63b-4a18-f6d8-08de177ce74c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2025 06:23:55.6618
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NDTTTgI2JlrfyGAKPkNX+DMOOMXxi+tZmBw4n8ni0X5sNX+Q02bM0dAHhqqKTv2tbAQ77TeWztUunNdLnbIT6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4577
X-OriginatorOrg: intel.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Oct 2025 06:24:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121191

SGksDQoNCk9uIFdlZCwgMjAyNS0xMC0xNSBhdCAxMTo0NCArMDUzMCwgS2FkYW1iYXRodXIgU3Vi
cmFtYW5peWFtLCBTYXJhdmFuYW4NCnZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIHdyb3RlOg0K
PiBSZWZlcmVuY2U6DQo+IAlodHRwczovL252ZC5uaXN0Lmdvdi92dWxuL2RldGFpbC9DVkUtMjAy
NS0xMDgyMw0KPiAJaHR0cHM6Ly9naXRodWIuY29tL2F4Ym9lL2Zpby9pc3N1ZXMvMTk4Mg0KPiAN
Cj4gVXBzdHJlYW0tcGF0Y2g6DQo+IAkNCj4gaHR0cHM6Ly9naXRodWIuY29tL2F4Ym9lL2Zpby9j
b21taXQvNmEzOWRmYWZmZGI4YTZjMjA4MGVlYzBkYzdmYjFlZTUzDQo+IDJkNTQwMjUNCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IFNhcmF2YW5hbg0KPiA8c2FyYXZhbmFuLmthZGFtYmF0aHVyc3VicmFt
YW5peWFtQHdpbmRyaXZlci5jb20+DQoNClBsZWFzZSBjb25zaWRlciBjaGFuZ2luZyB5b3VyIGdp
dCBjb25maWcgdG8gZm9sbG93Og0KDQpodHRwczovL2RvY3MueW9jdG9wcm9qZWN0Lm9yZy9kZXYv
Y29udHJpYnV0b3ItZ3VpZGUvc3VibWl0LWNoYW5nZXMuaHRtbCNmaXhpbmcteW91ci1mcm9tLWlk
ZW50aXR5DQoNCj4gLS0tDQo+IMKgLi4uL2Zpby9maW8vQ1ZFLTIwMjUtMTA4MjMucGF0Y2jCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDM3DQo+ICsrKysrKysrKysrKysrKysrKysNCj4gwqBt
ZXRhLW9lL3JlY2lwZXMtYmVuY2htYXJrL2Zpby9maW9fMy4zNi5iYsKgwqDCoMKgIHzCoCAyICsN
Cj4gwqAyIGZpbGVzIGNoYW5nZWQsIDM5IGluc2VydGlvbnMoKykNCj4gwqBjcmVhdGUgbW9kZSAx
MDA2NDQgbWV0YS1vZS9yZWNpcGVzLWJlbmNobWFyay9maW8vZmlvL0NWRS0yMDI1LQ0KPiAxMDgy
My5wYXRjaA0KPiANCj4gZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1iZW5jaG1hcmsvZmlv
L2Zpby9DVkUtMjAyNS0xMDgyMy5wYXRjaA0KPiBiL21ldGEtb2UvcmVjaXBlcy1iZW5jaG1hcmsv
ZmlvL2Zpby9DVkUtMjAyNS0xMDgyMy5wYXRjaA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBp
bmRleCAwMDAwMDAwMDAwLi5mNTUyM2Y4M2U0DQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvbWV0
YS1vZS9yZWNpcGVzLWJlbmNobWFyay9maW8vZmlvL0NWRS0yMDI1LTEwODIzLnBhdGNoDQo+IEBA
IC0wLDAgKzEsMzcgQEANCj4gK0Zyb20gNmEzOWRmYWZmZGI4YTZjMjA4MGVlYzBkYzdmYjFlZTUz
MmQ1NDAyNSBNb24gU2VwIDE3IDAwOjAwOjAwDQo+IDIwMDENCj4gK0Zyb206IEplbnMgQXhib2Ug
PGF4Ym9lQGtlcm5lbC5kaz4NCj4gK0RhdGU6IFR1ZSwgMjMgU2VwIDIwMjUgMTE6NTA6NDYgLTA2
MDANCj4gK1N1YmplY3Q6IFtQQVRDSF0gb3B0aW9uczogY2hlY2sgZm9yIE5VTEwgaW5wdXQgc3Ry
aW5nIGFuZCBmYWlsDQo+ICsNCj4gK1dhc3RlIG9mIHRpbWUgYnVzeSB3b3JrLg0KPiArDQo+ICtM
aW5rOiBodHRwczovL2dpdGh1Yi5jb20vYXhib2UvZmlvL2lzc3Vlcy8xOTgyDQo+ICsNCj4gK0NW
RTogQ1ZFLTIwMjUtMTA4MjMNCj4gKw0KPiArVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydA0KPiAr
DQo+IGh0dHBzOi8vZ2l0aHViLmNvbS9heGJvZS9maW8vY29tbWl0LzZhMzlkZmFmZmRiOGE2YzIw
ODBlZWMwZGM3ZmIxZWU1MzINCj4gZDU0MDI1DQo+ICsNCj4gK1NpZ25lZC1vZmYtYnk6IEplbnMg
QXhib2UgPGF4Ym9lQGtlcm5lbC5kaz4NCj4gK1NpZ25lZC1vZmYtYnk6IFNhcmF2YW5hbg0KPiA8
c2FyYXZhbmFuLmthZGFtYmF0aHVyc3VicmFtYW5peWFtQHdpbmRyaXZlci5jb20+DQo+ICstLS0N
Cj4gKyBvcHRpb25zLmMgfCAzICsrKw0KPiArIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KykNCj4gKw0KPiArZGlmZiAtLWdpdCBhL29wdGlvbnMuYyBiL29wdGlvbnMuYw0KPiAraW5kZXgg
ZGU5MzVlZi4uYjM4NDQxZSAxMDA2NDQNCj4gKy0tLSBhL29wdGlvbnMuYw0KPiArKysrIGIvb3B0
aW9ucy5jDQo+ICtAQCAtMTUzNSw2ICsxNTM1LDkgQEAgc3RhdGljIGludCBzdHJfYnVmZmVyX3Bh
dHRlcm5fY2Iodm9pZCAqZGF0YSwNCj4gY29uc3QgY2hhciAqaW5wdXQpDQo+ICvCoAlzdHJ1Y3Qg
dGhyZWFkX2RhdGEgKnRkID0gY2JfZGF0YV90b190ZChkYXRhKTsNCj4gK8KgCWludCByZXQ7DQo+
ICsgDQo+ICsrCWlmICghaW5wdXQpDQo+ICsrCQlyZXR1cm4gMTsNCj4gKysNCj4gK8KgCS8qIEZJ
WE1FOiBmb3Igbm93IGJ1ZmZlciBwYXR0ZXJuIGRvZXMgbm90IHN1cHBvcnQgZm9ybWF0cyAqLw0K
PiArwqAJcmV0ID0gcGFyc2VfYW5kX2ZpbGxfcGF0dGVybl9hbGxvYyhpbnB1dCwgc3RybGVuKGlu
cHV0KSwNCj4gK8KgCQkJCSZ0ZC0+by5idWZmZXJfcGF0dGVybiwgTlVMTCwgTlVMTCwNCj4gTlVM
TCk7DQo+ICstLSANCj4gKzIuNDQuMw0KPiArDQo+IGRpZmYgLS1naXQgYS9tZXRhLW9lL3JlY2lw
ZXMtYmVuY2htYXJrL2Zpby9maW9fMy4zNi5iYiBiL21ldGEtDQo+IG9lL3JlY2lwZXMtYmVuY2ht
YXJrL2Zpby9maW9fMy4zNi5iYg0KPiBpbmRleCBhODcxZWQ4ZmU1Li45MTdhNmUxNDU2IDEwMDY0
NA0KPiAtLS0gYS9tZXRhLW9lL3JlY2lwZXMtYmVuY2htYXJrL2Zpby9maW9fMy4zNi5iYg0KPiAr
KysgYi9tZXRhLW9lL3JlY2lwZXMtYmVuY2htYXJrL2Zpby9maW9fMy4zNi5iYg0KPiBAQCAtMjgs
NiArMjgsOCBAQCBTUkNfVVJJID0NCj4gImdpdDovL2dpdC5rZXJuZWwuZGsvZmlvLmdpdDticmFu
Y2g9bWFzdGVyIg0KPiDCoA0KPiDCoFMgPSAiJHtXT1JLRElSfS9naXQiDQo+IMKgDQo+ICtTUkNf
VVJJICs9ICJmaWxlOi8vQ1ZFLTIwMjUtMTA4MjMucGF0Y2giDQo+ICsNCj4gwqAjIGF2b2lkcyBi
dWlsZCBicmVha3Mgd2hlbiB1c2luZyBuby1zdGF0aWMtbGlicy5pbmMNCj4gwqBESVNBQkxFX1NU
QVRJQyA9ICIiDQo+IMKgDQo+IA0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiBMaW5rczog
WW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gVmlldy9SZXBs
eSBPbmxpbmUgKCMxMjA2ODgpOg0KPiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9v
cGVuZW1iZWRkZWQtZGV2ZWwvbWVzc2FnZS8xMjA2ODgNCj4gTXV0ZSBUaGlzIFRvcGljOiBodHRw
czovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQvMTE1NzY2NjkwLzM2MTY3MDINCj4gR3JvdXAg
T3duZXI6IG9wZW5lbWJlZGRlZC1kZXZlbCtvd25lckBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+
IFVuc3Vic2NyaWJlOg0KPiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1i
ZWRkZWQtZGV2ZWwvdW5zdWLCoFsNCj4gYW51ai5taXR0YWxAaW50ZWwuY29tXQ0KPiAtPS09LT0t
PS09LT0tPS09LT0tPS09LQ0K


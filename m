Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B609C25B74
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 07:37:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by mx.groups.io with SMTP id smtpd.web10.7609.1715845075244301014
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 May 2024 00:37:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=LqMDsYik;
 spf=pass (domain: intel.com, ip: 192.198.163.17, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715845075; x=1747381075;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=CXL3bupgfxD4n97EmlzjLr7UOpLY7gS7DPlEv3kU7ik=;
  b=LqMDsYikAIVPyZ9qsIBZ5QdNL9aaXaTMRkTnFI3f3G+iPs0VBJj728ld
   SyUedEIvOmxfE2mtjoHn6Z8phKYaB7ImbqdWOoa8/jduAzkQ3rDm3UaZd
   uk0yGlHTDAs3mnNZzZzKGw0+tCHR1FcGjhBnXo4GAlj4Fn3XkCkoWBevM
   DnTJZo/ep6BTC2iYnltckLDsGgTIFAkAkzoXK/82eKanRpSu1UMcmoxio
   RLU7vURaIN6uRObebp5KJvb3LX37T9bMfmydzY67XQJegsJHfOZjdZLdJ
   Dww+jVy/YkQhhhRRyeMhyBODIBWYuvkn7u8UatpKc4S5VSuhAikUlbpOe
   w==;
X-CSE-ConnectionGUID: cBCqTb40SO2INCJ1N5G/Cw==
X-CSE-MsgGUID: Wh0fEhnVTeCQkMEJUw0xEw==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="11806129"
X-IronPort-AV: E=Sophos;i="6.08,163,1712646000"; 
   d="scan'208";a="11806129"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 00:37:54 -0700
X-CSE-ConnectionGUID: 0D2oD7LLSt2bxQyibrPOqA==
X-CSE-MsgGUID: bNMxpCScR+6P084Xtjb9nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,163,1712646000"; 
   d="scan'208";a="54544314"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 16 May 2024 00:37:52 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 16 May 2024 00:37:52 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 16 May 2024 00:37:52 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 16 May 2024 00:37:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KuFs3/EAIrL3sO0R3ls7pSPw+0N7/1kSyuznNd3OufACbW7uQ2oRwt5GiarK+7vBL+gtdkK2371c7tA9ujtnfj8hi06q78OzZnMQ0jTDFsnHK2c2OrQL59Ra7G81uU7QFgwozehqOjW6gYNfVQ0pJkvWKGzzQh12wxhOlJcalb6LNu3I2mPF4gfTgob54nlmJqHWb0j9LgexYtyfOHxuigdPH0ZBboaPjTlmBSPrz3pGLOuUKTJOaPe5BZfbM8yukdHAlY/HA5Zsd/HMf632DXy75NdrJ+J6HiR6D6oWF6k2AdhMhtwj69IwCc0EtQtqPpm0h8T99xr2gon+5nrPCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CXL3bupgfxD4n97EmlzjLr7UOpLY7gS7DPlEv3kU7ik=;
 b=Ag0RB54CQ9XQGe+GIh2aZ5uCDAWPwp7mzyEZ8NpaD8Bh1oTsdDFZud0jtzcn/T8ibWN8Y2HsTRsaARSE084tvlkI9g6V7ZhZxqBZqBfP7dh1iMJtUlifJILGc4jBSr6k5naN3anOH9t6hTNmesPBpXATF3FBmZEfRKUymDyh+R6zWDzO+w4HCqHapdyH6V6/sBm18TQAWQUJAdZx02CwQ+AJ37+cZHEfeUmJNPDCG13Ht7bDzCpMyqR34PwG0sDBX0h6pvaPVwnxjy84XyXwFXyaiATjEbbwRKC5stmc+RL++YEl7aX2UQVFY4Y9LJidi+Aj/bUctC3dLM7g7TRl2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6430.namprd11.prod.outlook.com (2603:10b6:8:b6::15) by
 PH0PR11MB5190.namprd11.prod.outlook.com (2603:10b6:510:3c::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7587.30; Thu, 16 May 2024 07:37:15 +0000
Received: from DM4PR11MB6430.namprd11.prod.outlook.com
 ([fe80::9378:e70c:77ca:d46f]) by DM4PR11MB6430.namprd11.prod.outlook.com
 ([fe80::9378:e70c:77ca:d46f%7]) with mapi id 15.20.7587.028; Thu, 16 May 2024
 07:37:14 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "abhilash.kollam@gmail.com" <abhilash.kollam@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [[meta-oe][PATCH v2]] opentelemetry-cpp: add opentelemtry
 recipe
Thread-Topic: [oe] [[meta-oe][PATCH v2]] opentelemetry-cpp: add opentelemtry
 recipe
Thread-Index: AQHap1oQUbt1cYC6kUiN1DgdZD510rGZeQeA
Date: Thu, 16 May 2024 07:37:14 +0000
Message-ID: <b424d4f0ae2d091b24c9db02cfd68b69ed5eb36f.camel@intel.com>
References: <20240516062631.3994402-1-abhilash.kollam@gmail.com>
In-Reply-To: <20240516062631.3994402-1-abhilash.kollam@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.50.4 (3.50.4-1.fc39) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6430:EE_|PH0PR11MB5190:EE_
x-ms-office365-filtering-correlation-id: 00264649-d97f-434d-6177-08dc757b018b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?SStXcU1LaytFMDhTVjhRZWV5TzNWcHU1L0FhUmV4Q09pQnpLTVkvWTZBNFpD?=
 =?utf-8?B?VU40d3lBYjAvNnNld0Y0QUV6cDFOQTB1ZTBZNWcyVXAxVzFzU2JlSTl4M0k2?=
 =?utf-8?B?SVBweHV3SmRSWUF0SGdSR1ZYaXNEdG1WN3NGbFJyTzN2ZGVKNjlCZEFhUGgz?=
 =?utf-8?B?S1hwM3ZQTjduQ0xIeTdDZGM3RnZOamtsL05tZzZUYXFnaXMzRjNxbWtRTVoy?=
 =?utf-8?B?WVNrdnFTS1JuSVFaeEo3MTlZYTAxdmdGci9DTHJnMUc0Z0xHQmVRRkFsOUJ6?=
 =?utf-8?B?bDFnNDVNQ09va0NYOTFOV1VoZkJMOEtMcEh4V3pQRWxseFVMTXFSWnlsQmhE?=
 =?utf-8?B?RTVEOThkOTFNZHJkN01MdWtoaTBxVVVROWpIeDAwUDRCcWVhRUpLV1hHZ1Zz?=
 =?utf-8?B?WkFBT21qc1J0QmJXejV2RVY3RmVnang2Wm1vbFlNS3V4REg5VlBpb3hmRG4z?=
 =?utf-8?B?cWwxbFgvTnA1M09GeGptQkpBZGhlbzdaVjVMZUxsWXM2TWtHMTRnNUxsejVE?=
 =?utf-8?B?dzhMZjFxNXJ2UlJvNVZLUEY5Yys3ZU1kd21oY0gzdXB1ZzV3WURoTUJCSHV1?=
 =?utf-8?B?QW51WHRnc3ZzWXBIemxvTkZuUkhSTEYwMXYzU0ViUFJQQ2h0NFp1SGF4OUMr?=
 =?utf-8?B?TVEzcHZkREo5QXh5ajB0cU5zcGxTVnZLb25YbHR4cEU2SGYrT3pYSG02N2h1?=
 =?utf-8?B?WnVxK1VHRHZWMlMzcThRejkzclUvbGZPeS9wOVNBcWd5NzVCM3B5dUxHYlhn?=
 =?utf-8?B?N3YyK3Q3VGVmQW0vWm5MQi9PTG5sRkJMNWVvai9WckZJUDd3bHg1QXZxbG9j?=
 =?utf-8?B?dzlGRXhnVmFpNHFHYVZ1dmZINEZGRk8xU1VBYWJuWmpyelJrZXp4cEwxS0ZN?=
 =?utf-8?B?MGpXbnBHc3E2REdpRFhsUTNTZE5KbWJuU0Zpd3FNTDltb3JjblZpbUVobkZR?=
 =?utf-8?B?RGE4SE84a21zRGNneTBWWnpJRkI5ZE56czkvRzE0OG5vVW1uMXp0Sy9aRTFw?=
 =?utf-8?B?MjZ0Y21HR3F3dGJUN1lMZE5KcmF6a09WeEtWbjgzVi9RSXBnV2NuZm9YczEv?=
 =?utf-8?B?M2NMbFhYcEt1bTdWMzBBN01VZWJHTTdxdEpzMTZlRWpNVE9LcW0rcjJLOG85?=
 =?utf-8?B?MlR0ampQQUNGWjRidUllNFRTZ1JDdjFrallFcWFFdzVRZ1dhVXBucHFDOW9i?=
 =?utf-8?B?azFCN3B4Y0lCVFBYWHdiWEpKMHZRNGtKSTI5QVVQUWtCUVppV2I1TlpFamFX?=
 =?utf-8?B?M3BpV3FVV250aTNiMHVNT2U1QmphZjlNeDYrYndiNEVoeFlhYmNrMld6ZWFv?=
 =?utf-8?B?QnhidDNVZm90V2xzUU5TbUF5MHZzRmNBWi9oaVBITS8ybXkyRzV3a01JWjF6?=
 =?utf-8?B?SXB6RlBqTi9qekE3aEtSbmlmaUU1TU9XcVlBc3ViVTJtYVUrUkRwZkgvbi8r?=
 =?utf-8?B?a1lLTmdIY3ZqKzdxQm1odTJLSDFva2thTlJNdjl4VitzVTN4QkdCT0dlUU1M?=
 =?utf-8?B?SFNmd0ZuTk9YU29EL1NIZFpEUXAyWnZOV2xzWEZyYnQrYlhzSzJUNGNValhF?=
 =?utf-8?B?TDJqZzdWaTVlM2ZXbU1XMjNGdEIrSWJ4WUUxTzJnL3ExQklPK3VyWGtFNlds?=
 =?utf-8?B?YVJDSmpEdW0zSHRPdzl4NWdTYm5WQTdWbFhKcVdIUGV0c1hqK2VPUElJZGdW?=
 =?utf-8?B?SUhseFl0TCt1TXZjbFluWWhCUTd6TUpGY1FORThKMzlMWTBpOU45NXlBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6430.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MzFueVo5azZjdENlczVEWVRBbkswR3Y5U3FOdWErT01JSVZMOWMrc2JYR0lJ?=
 =?utf-8?B?WVNrZDdWOVlJVkJyWm9yZE80N2NjUXIxN1lUV2pJWG1DQkhEU3k5bFdJb1F6?=
 =?utf-8?B?ZmlMSmlIY1RUWENFVnFXSzdWQ0k0dDc5cU9WT3pBeU5QZk42Z2FXSkN3K0Ro?=
 =?utf-8?B?dU1KNlVrNWIwT1FPSkpFd0N3bWNSY3V5TlkxME12bC9PcHhsOEFQYWUreHNB?=
 =?utf-8?B?QjJ6WGpQejQ0eGRSb3FMUjZDcldzY2g1UjFjWEJlZW9UYkR4YmpKeDVNU2tE?=
 =?utf-8?B?UkRINnJnVEpFRnBmTkN3ZHZidG4yVVpGbThZOWJsaUxFOFRFUEVuWm9kdTB4?=
 =?utf-8?B?UVgvODF1RTRwVGVWemtveWJlK0lYUlVTWmlvWVpsUGtTR2FvZ1NlREJZeDBo?=
 =?utf-8?B?RVVXOTloWUEzeEp6QmI1U3JYaGQ2SEEzN1BRQWhudGxWbGVTYVRPbDZQcVJo?=
 =?utf-8?B?b2ZUQ3AwRUJNSkN5UVZ3K2RXQ2FqV3pzNkswdlpITGc4RkR0emJzVFRCUjRu?=
 =?utf-8?B?SmF3aDlvdytKS1QzSGhlT1BkQ3hPdTEwdzhtY1NSckJZMEhQenJEckNhVVdU?=
 =?utf-8?B?eXk0Y2NqMHdSek8yTHVuakVMV2tiUTMzY2RjVDA3alpmM2FmTmtwOFBoYVo3?=
 =?utf-8?B?MStvREs3TWliZ2g0SDQ2UlppeHowSVdwa0gzRWNzMkR3Wm4vL25CVXZsY0Zj?=
 =?utf-8?B?MkJBUW9FMmY3VEp5Z3ZXMjBIa3o5aFloZ01naTdqZ05KV2NkT3BJZWVXSHF3?=
 =?utf-8?B?djlCRDRiZEQvME1nRHhKZEVnVk9RMG51UjNjcUsxelV0MHJRcTVSNDBJblMr?=
 =?utf-8?B?WXFoOWkvYjdNd1UxYjBid3BGUjE2SThDRGYvNkRsV3kxYUpVd2o1Sk04ZTl6?=
 =?utf-8?B?cnU0K0NpSnBtMStoNmpudzJ2SUtpclpnU0crMHJBNCtvVUNzU0JxUDlNZ1ZV?=
 =?utf-8?B?aTNXL0pRZ1d5VHNyL2xlVlA5QWg3S2RlZTUyM2h0SXZ0U0ZnbHozOTl5MFhN?=
 =?utf-8?B?amlrUkQ3VGIva2hFZ1o0SHVMMXN6RVdXMXNvN2JnVjVzUVV4MzQrNjNZY09m?=
 =?utf-8?B?aVQzY05pUGZJYzN3dlRYYmtJU05QNDI2NVNhbHQ3L29TbUV2dm8vNnZxcTZU?=
 =?utf-8?B?akphZ1h5dC9UYXpuME1tbUlpQkZxK3dGTXJ6MzNBSmY3VHB4dDZOZk1DUUFD?=
 =?utf-8?B?bTMxNTdiMU9KNTV4QU9ZL1dyY3IzMERqcnlSWXNRQ1FHUzNlYWNHMVpJYWw3?=
 =?utf-8?B?MnIxelRSdE83b0RFQkVaQkZzZENnYytaZFZkemFRWWwzbDdHdlUyekhzZ013?=
 =?utf-8?B?ZzFUV1dBL3p2R1JjQ2hSK1hMR296RlZyb211RlJTQ3duUDNmNmc1NHB2ZFlX?=
 =?utf-8?B?WjcyQmt1TU9oYWZOMHlnak96eVkvQWpURVJRcFJ3b2k5RTVQWS80MmRUTllh?=
 =?utf-8?B?dHUwNUNXbEI0Sjd3cnI1ck1wZ3NRL01rcUtaTEhpM08rSG93dG1rN2RKaENX?=
 =?utf-8?B?bW1BSzFWUGlUSmNCUGZBQ2g2djRaQkYybCtFNXJwZWJTMzVWVUhxK0dJdDhS?=
 =?utf-8?B?YlNhYTkwdXRsVnk5ejM2MkthS2lwSDF5YUliTkVwc2lsczRwL0wwazg3M3dU?=
 =?utf-8?B?cHI5QmlNV0hiSy90VDVKdEdKNk9HWDROYkttbjF4MWxoOTJSM2d2OHVWMjNO?=
 =?utf-8?B?YnRzVm1rbGNYZ0hlTDRwTXVSb1RYSytpMWRGZUd5Uk1yQ3NHK2FEQmRDMjlG?=
 =?utf-8?B?U3lXaVNrek1nS3VlL1pYZFQ4SURvRThlb295clBaVFNHSm40V2I2NEJvMWI2?=
 =?utf-8?B?UElDZ2oxOE1kMjhKTDhwZ3V0MXNLMjJGSnYzeFZ1REoyMFlXU0FXQ1hVbG9J?=
 =?utf-8?B?VWFPNGd5UkUxU1p0U3JCRnluUE1OdVpzZERRZGFNY21nOVdDY2FycnBxS01I?=
 =?utf-8?B?Q0c2WXdyZUtxTFRpSWtSTkJqejdvb2ZUdUdTTHVJYzJzQVpNaWxtMVJrVHYw?=
 =?utf-8?B?b2c0Qk8zQUNLYldOM2Z5WmJBeDQxS0pZeFRnS1ROODFxT3NaRWh5QkFlam14?=
 =?utf-8?B?TXFRdmV1YWNEWTVocTlZN1pnbDAzeXVqNlBBVUhXQlJVbDNQNTcvWExPMDc1?=
 =?utf-8?B?SWVnSzlBK1E2T1VlcDVmR0lITGQ3TnkrM2RieVBoWU5qUzRCbHk0ZzBSUEI3?=
 =?utf-8?B?dkFOZnk3dDU2TnUrMkZWaUg3WUZYN2ZBS1Z3eUhwUVU5OXFCeStBN1dhUElw?=
 =?utf-8?B?c2o2Yy9IcUMyVERweU0vUEs1WnRnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2835062F3EDC0243BD7A0A99BF2C3962@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00264649-d97f-434d-6177-08dc757b018b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2024 07:37:14.6940
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s7pqfmQyOQ5WpH5OyJ+caD0JziF6qzVzbqNvlkniajtgM6K8qfLF4xPg6+UdrCuk9B2L8Mn/2YJRvSdMymac7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5190
X-OriginatorOrg: intel.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 May 2024 07:37:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110412

T24gVGh1LCAyMDI0LTA1LTE2IGF0IDAxOjI2IC0wNTAwLCBBYmhpbGFzaCBSYWp1IHdyb3RlOg0K
PiBBbiBPYnNlcnZhYmlsaXR5IGZyYW1ld29yayB0byBjcmVhdGUgYW5kIG1hbmFnZSB0ZWxlbWV0
cnkgZGF0YSBzdWNoDQo+IGFzDQo+IHRyYWNlcywgbWV0cmljcywgYW5kIGxvZ3MNCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IEFiaGlsYXNoIFJhanUgPGFiaGlsYXNoLmtvbGxhbUBnbWFpbC5jb20+DQo+
IC0tLQ0KPiDCoC4uLi9vcGVudGVsZW1ldHJ5L29wZW50ZWxlbWV0cnktY3BwXzEuMTUuMC5iYiB8
IDI2DQo+ICsrKysrKysrKysrKysrKysrKysNCj4gwqAxIGZpbGUgY2hhbmdlZCwgMjYgaW5zZXJ0
aW9ucygrKQ0KPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhLW9lL3JlY2lwZXMtDQo+IHN1cHBv
cnQvb3BlbnRlbGVtZXRyeS9vcGVudGVsZW1ldHJ5LWNwcF8xLjE1LjAuYmINCj4gDQo+IGRpZmYg
LS1naXQgYS9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9vcGVudGVsZW1ldHJ5L29wZW50ZWxlbWV0
cnktDQo+IGNwcF8xLjE1LjAuYmIgYi9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9vcGVudGVsZW1l
dHJ5L29wZW50ZWxlbWV0cnktDQo+IGNwcF8xLjE1LjAuYmINCj4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQNCj4gaW5kZXggMDAwMDAwMDAwLi5iYjJiMDllNWENCj4gLS0tIC9kZXYvbnVsbA0KPiArKysg
Yi9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9vcGVudGVsZW1ldHJ5L29wZW50ZWxlbWV0cnktDQo+
IGNwcF8xLjE1LjAuYmINCj4gQEAgLTAsMCArMSwyNiBAQA0KPiArU1VNTUFSWSA9ICJPcGVuIFRl
bGVtZXRyeSBMaWJyYXJ5Ig0KPiArREVTQ1JJUFRJT04gPSAiQW4gT2JzZXJ2YWJpbGl0eSBmcmFt
ZXdvcmsgdG8gY3JlYXRlIGFuZCBtYW5hZ2UNCj4gdGVsZW1ldHJ5IGRhdGEgXA0KPiArc3VjaCBh
cyB0cmFjZXMsIG1ldHJpY3MsIGFuZCBsb2dzLiINCj4gK0hPTUVQQUdFID0gImh0dHBzOi8vZ2l0
aHViLmNvbS9vcGVuLXRlbGVtZXRyeS9vcGVudGVsZW1ldHJ5LWNwcCINCj4gK1NFQ1RJT04gPSAi
bGlicyINCj4gK0xJQ0VOU0UgPSAiQXBhY2hlLTIuMCINCj4gK0xJQ19GSUxFU19DSEtTVU0gPQ0K
PiAiZmlsZTovL0xJQ0VOU0U7bWQ1PTg2ZDNmM2E5NWMzMjRjOTQ3OWJkODk4Njk2OGY0MzI3Ig0K
PiArDQo+ICtERVBFTkRTID0gIm5sb2htYW5uLWpzb24iDQo+ICsNCj4gK1NSQ19VUkkgPSAiZ2l0
Oi8vZ2l0aHViLmNvbS9vcGVuLXRlbGVtZXRyeS9vcGVudGVsZW1ldHJ5LQ0KPiBjcHAuZ2l0O3By
b3RvY29sPWh0dHBzO2JyYW5jaD1tYWluOyINCj4gK1NSQ1JFViA9ICIwNTRiMGRjMjA3YzFmNThl
MjkwZDc4Y2RhYWM1ZjMxNGJjMzI4YjMxIg0KPiArU1JDX1VSSVtzaGEyNTZzdW1dID0NCj4gIjY5
YjBmZWYzODA2NThlMTViZTlkODE3YmZjYjMyZTNmNWRlOTZkYTY1MmJjZGNlNzdiNGU3NTBlZDhi
ZWRkZWUiDQoNClRoaXMgaXNuJ3QgbmVlZGVkIHdoZW4gZmV0Y2hpbmcgdXNpbmcgZ2l0Lg0KDQoN
ClRoYW5rcywNCg0KQW51ag0K


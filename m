Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9007FCCF9EA
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 06:27:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by mx.groups.io with SMTP id smtpd.web01.18079.1761805646436459731
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Oct 2025 23:27:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=UOM564Lo;
 spf=pass (domain: intel.com, ip: 192.198.163.19, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761805646; x=1793341646;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=3RPKKOlIqKAqMOaWq59+SQMgk1QN6kgBv4XlfFl1ee8=;
  b=UOM564LoLit/8Y+lNfkfCxctTvCStuj+Wfh3W1T/Biz1SgyHBxntPFzW
   /I1wvGscy6yYhaj1DPkHiZTKBtz67JDh/If9pZ+6hkCnJtCqEAnoQi9QW
   kUXI7FJcs3OaSrQLxA26pNMwRBMsqJhiMbNzQpKC+kZqluojghgujb4ln
   hEI7dDbYd3AcoSj5Mcc8tc0ahw5iiLdUScM7qwTsdBuDF+esc834Rr+BL
   RmOwAr/UTvkvtLSBJgFaDi+MNE4nmPJKKh9hrkZlRkxbEmpiMc0ZevYiO
   nDVBNZQ3WmsDZpc4/V/YS4Yn2LOAagoTSJV3cYSLWJieHJ1Xjm1z7Gleb
   Q==;
X-CSE-ConnectionGUID: 9RYBrFVAQJWXf+fuo+ZAyQ==
X-CSE-MsgGUID: 60S9G15eTJqWOIXsTcUd9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="62961112"
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="62961112"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 23:27:26 -0700
X-CSE-ConnectionGUID: 2Kl5OYcvQ6Kufo12OrgaMg==
X-CSE-MsgGUID: JIgyh+euQ3qrZevXlj8xGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="191037343"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 23:27:26 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 23:27:25 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 29 Oct 2025 23:27:25 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.15) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 23:27:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZiLZ6H9PGItEOEvznD9ZF6h34Brnt7TSyC0vxKO+GvCTMEQ672hN/PEPYN5dQFVtjCJVsNQ2dam3NlPDzfOerhiBYOdwwPjliTp8RMpaVgCqd0ZYdEpBQ7wixgGPH7qoOPDipl5WbewUkPvzD7nxSCimoA1Lix5baMPxRDTUU9bczCyCAwoHw9jVidrXqpyCdhWwE0erZgEZonHqHYX5cyvn1JsG4l7kbF5peORvjdLI12MglBgxmsF1HZSQust15D/v7WCoOGxj7lgMYhUbfXtKLerZBWGlewQXA9R/oMbvwEfl8gHLZzq/DipndO6m880E9vBEzkArCkfNrfvWxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3RPKKOlIqKAqMOaWq59+SQMgk1QN6kgBv4XlfFl1ee8=;
 b=s0Gb/pfZhS11ln7opj+07jbBOJHizxWn5kEF5n/G7H9wY0b8rTcjc9yzc351dw4rD/fN2S4cFJNpbNMJShprqVzNUa3lsLfC8mkdpY5zWU20lKA74fx0xCK4mCW+Q3d4N4/ILyPmnfuvzLYU7lwn7cJ2aEBnQqndWYjxfupbCzOOe76i4fH5k5pO47Fwz4cCkKD9tgtn2IkgBC0viZkftfM5t/C6eOQrPJum68AsvnGfnjF5Gylq7lH8Jr3BB1v1wfdZeClZknqFH/hvwaNgTPtnzqWoakCzkfuhIPe3SFBQHccBH5brYV8+ABZkePYRMjSveSFZYBscW8UIP4c0oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by BN9PR11MB5289.namprd11.prod.outlook.com (2603:10b6:408:136::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Thu, 30 Oct
 2025 06:27:23 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%2]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 06:27:23 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "ankur.tyagi85@gmail.com" <ankur.tyagi85@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe][meta-oe][scarthgap][PATCH 4/4] opencv: ignore CVE-2025-53644
Thread-Topic: [oe][meta-oe][scarthgap][PATCH 4/4] opencv: ignore
 CVE-2025-53644
Thread-Index: AQHcPZ372W1XMfXJG0ukOZv2cy635bTaUUKA
Date: Thu, 30 Oct 2025 06:27:23 +0000
Message-ID: <e51756c87e168db3530749128054f01259c65974.camel@intel.com>
References: <20251015063531.1573191-1-ankur.tyagi85@gmail.com>
	 <20251015063531.1573191-4-ankur.tyagi85@gmail.com>
In-Reply-To: <20251015063531.1573191-4-ankur.tyagi85@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|BN9PR11MB5289:EE_
x-ms-office365-filtering-correlation-id: b1b9158a-3102-4cb2-9bb1-08de177d62f4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|4022899009|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?SVZzMUtaYVdUMUVmdldYcW5iSUdKcHc1M0tqZWY4VWNwT1VieWd2ZHo5b1R4?=
 =?utf-8?B?VmNLbzZuYWxjeFhvMldxVHNWaDdkc0Mzc29WU3o2eSt4dVM3OE1VdnFZb2Fa?=
 =?utf-8?B?TDRCTXlhTUFVUU9tYWoyaGtGZTZNOEdKMlVLclUyUXZtOGhlQmgxd2swdEJx?=
 =?utf-8?B?MHVPSkV5OWxxVU1LVDhmUFdoM0l4QW9oQUhYUHk4UmJUa3F3cnRySnlBZjI4?=
 =?utf-8?B?OVFjOW9HNGtNRWM2SWxPRjlSVDdVWjl2MHFIckw0ditaK1VacWtHQi9WcWNE?=
 =?utf-8?B?VTk1NzJaNDhQZWpYQ1dONDFSSldmdDZTd2FFcExsTkZVc2NjQ3Q3VTFScUps?=
 =?utf-8?B?bitrR1VsK04wQzc0UE51ajNISm1HOHhqK2txYUNGTFdMTlFxckRHeTVIc2xB?=
 =?utf-8?B?YmlsUmJlMjdtTWlmRXNPSjBCdXg3cVBvbEdyWFRQSHRQc2dyZ0RyT2xXNnZr?=
 =?utf-8?B?cWFPOWN1R2txOWRxczNTN0trTDFHOE4vVUQ5aWFGQi9STmJMc3d0VUJObWVT?=
 =?utf-8?B?K2hzZ05PZ2xJU1BROGFtYmNVemhtN1BsNCtYV2ZCb0VZNzdwMkFRVzl0eitC?=
 =?utf-8?B?THE4eEVQSEZWZ3pvN0N0VWlhM1JESm4vUFpMUG42SXZMQXJuanQ4clBZblFq?=
 =?utf-8?B?ZDcwMTBaUGM4dzBIeDZiNXpkRVk3M1NrY1ZWQUZEZm9XaVd4aUF0UXVJZVI1?=
 =?utf-8?B?cmIweERvZDg1ZnlSMW9aRmZJSE5UNGxPRmxtQTBsTjJGT2FJZ0NzK1VETHdy?=
 =?utf-8?B?Skh3RU51ZDR1clQweHdWY1pMczZsc1VxeTRwazlsT0VEeU5QSnBvd1RLdC9R?=
 =?utf-8?B?WjltYXNMN2lPQ0ZtTEg5SnltRUtneXZMUlgvVFZMbjErUk9SQlFGVks2ZUVK?=
 =?utf-8?B?R1Q0eHdYanF1UEN0K1hOcEVuVG1hbXE1TitFcTY4WHBJWUFlajJMR3JUdVBi?=
 =?utf-8?B?UVlkZEFXOGIybnZwKzVTeUVWaG1tYWxkdloyT1o5d1d0emxRUXB3RHVKZ2tC?=
 =?utf-8?B?UXQ0ejVsS3ZxQ1lEbElpSDNDUTZveFpxQUpsUng4OTdKMm5CZ2taSEE4MzlE?=
 =?utf-8?B?Y3hWNVh5TXphbmVqNjg0U3NDdDFpNGE2NkpXR3VKNkh3MGFKd2g2eUhIQU1O?=
 =?utf-8?B?dnlWQ0YvQW55Ky9qSWtYN3FVaFBPMFVFTVNCb3BGYVNSZ0cxN3JDZllrUStr?=
 =?utf-8?B?dzd3eFpzWnlmeUJUMEJFOUxaRFZ1SWl6aUh2YldOT1N6dG9CM2JaQjJESzNR?=
 =?utf-8?B?SHp0N0szWmFvc2tySHJINStDUXowSjc0SWhuMk9sdWc2T0JHNGNwNDFWV1Jv?=
 =?utf-8?B?dnJlUFpSa0ZObGlYblc0bTF3QUZEMTA1aXpYc2czZXB3L2kvVExGUDhiWEI4?=
 =?utf-8?B?NmlqVUpDcUZzenpueHJaMmlWNXM4ZW1MT0R2QnFtZ1dSa3RtZFNBTWRPZndw?=
 =?utf-8?B?dlgzYWFIUXlSUTVKN3hIS3lDaUltYWVoYS9zVVBKMEFNUno0RGdUbnVFUktp?=
 =?utf-8?B?ZTZwOFA5a0J3OGEyMlBsSHRMckZiMVFianJKUnJQa2RhUW1JVUFnOGZONlN0?=
 =?utf-8?B?L04welo1dU96RkF6MzE5eWhzMExwVmVWc0x6WEZDd2ZWWS9mVmZLWVFDVmNz?=
 =?utf-8?B?dUhmREtCdExlbjI1TlZIN1M1blhvU0FvdE9DM3lwaWRrenZBb3ZwdEg1VkVN?=
 =?utf-8?B?aUN3ckxrdjhvTU11VTNlamMwb3N6UWpzaUlYUUZnUU9Kclg2VFpCeHdBdzlt?=
 =?utf-8?B?QlBDa2hmMFAxQnNUTGJKcFM1aWdtd01meC9KRWRGUll5bUZLb1NmYjJBUjNz?=
 =?utf-8?B?NEtzcWh2MXJvNUxaZU5SQ3MySzcwSzVRVkxxWVpJR0dlREcwOWQ2Nmo0M3VD?=
 =?utf-8?B?THJTZXFqSTByV0hFTnJkNTdLYU40OEhKSGJnQWpaRldhYnpKYWxQU0NwcUto?=
 =?utf-8?B?K3FocWxEWDBxRHZMd1BDVWovejVsMnRJREo1UWlPK3BsQlg5Ujh0NUJ0c0tr?=
 =?utf-8?B?RDEvSSs3Yk5RPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(4022899009)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UkJrY1UrUU1wQU1OS0FsYlQ2S2srcmcranJZeG1VdzIzMG9RVUkzT0JuUlBW?=
 =?utf-8?B?TGkvemNxTCtqdWlhUVNjUEJIRFRudjRJTTN3UTRDbUFEblFDQWVJQUI1emxE?=
 =?utf-8?B?T1NNYXd3ZU44QzZubW1hUTBqZVU2TC8raTJ6djQ2Q3lPdlVlRnhRNzhYL011?=
 =?utf-8?B?WFVXcGhhKy93V0lmWC9ncWNpbGs3Sk16M0hORmlRVVRJc05BNmViZzZRc1dW?=
 =?utf-8?B?OVpRdzBUNElqOTdSbk1aOHkzZFVvMTJYUWJ4cGd0L1Ezb25mU3VVcWRmdHI4?=
 =?utf-8?B?bVBsa0lHcnVkZERNaS9SclEvM3YzQWgxQ3BVVDZJcENDZm0reE5DZjBsdHhU?=
 =?utf-8?B?UUxCODJkdXFDRmhzMUZacjFDSklwTUZtK3lpV29wS2NSL1JXUlZacnFGLzRw?=
 =?utf-8?B?UDc1M3lFeEVaOCtHZUtsVEI1YUtFL04ycGFUcGFzVDFWNVdteWhUdDE4TkVu?=
 =?utf-8?B?TmdrMWlzZEhkd0dDRC8wMmdSdSs4ZnB3anErdmh6UE5OK1NlTmhSMjJCTENV?=
 =?utf-8?B?WlhmVVVFN3Y0UlgybUk1TEVHRmx6VGdxVzYrU2JIQk51NEpCamhPTDdXb2lJ?=
 =?utf-8?B?L1lCaHYwTFVtWjRyZXBNbFFhVk5vU2pxZmNuUGV2ejlNdHJjdXlPSDJPS3Vk?=
 =?utf-8?B?V0ZlY2FXTGdZa0NlTEUvcmk0Nk5IaFJzaEJjalZGY1o2Y2MrUWlkcXFZeUJ1?=
 =?utf-8?B?aTdKSlMxUXZQZnMrS2lhMEhYLzE1dzc3YnFoS2wzRW5SK010T1VsdUlWV2oy?=
 =?utf-8?B?UmxUa0NHVVdFMFY0M0ZqYXREeXpVTVlnYVMxTXZONm9rbnRCVTNUZCtTbmhS?=
 =?utf-8?B?NXBtYlBvL2JodHFUVEF0VWk0UVR1SFZQZHNoRXVnQk9pVC9aZHdPYnhOVUk2?=
 =?utf-8?B?aURPZzFJd1JUR1JIN3RLcTBWMnRwWUZjeHV3UTNEbHBEMDdHQmRLdnZyZEMr?=
 =?utf-8?B?MnhDM0VJVGZNejY4a29KblpRYVh2VW5hbnlCTUhMUGJqeW1wQTNvNVdDY3RH?=
 =?utf-8?B?WktNaGovbGh4RUNSWEljaUQ5WHJMR1g0M1F1VzkxZjhmUDdXOXZ0TVhqZGN0?=
 =?utf-8?B?Y0pkbUd2c1VEU1JSRzN5RUgxK3dNdHByOTg5bllUeUZzZmdjYkE2RFpxajJ6?=
 =?utf-8?B?MGtNTFVGWEdiNmVxMVVNUG5CYXhrMndzSnBMSzF2U0lUcDhuZzlieVJSSUhK?=
 =?utf-8?B?aTkzeS90bUFpNTFMbC9OU0oybFBXaDBpUWpyQVFzTjlpU0xYOTkxSWtmTkRK?=
 =?utf-8?B?S0ZCWG93WnkvRDYvMHhXQVR3Q09NdXRVTElLYWh3VWt1ZkcwenJmSzU1bDB2?=
 =?utf-8?B?WkF6My8rN0w1NHV1d00xdHgybitFOU5vaHZIbzRJdzh6OXQwaHdGYlRIRWNQ?=
 =?utf-8?B?V2F0TGp2cm5JN29Sa0puaVRBc05rY3QzRmliWUNMVHZBU2FsZXJxWW9YWDZO?=
 =?utf-8?B?akxlWk9TdUsrNmQ0WndrLzV2b0xuMm1UdUN6SS9BcC9aNzhiaHdUR3RCUk8r?=
 =?utf-8?B?Rnd5QnZyVy9XdSs0WDIzWkhRaWVNVzd4RVFNSzlicXRlMlJkZDRMbVFPbThB?=
 =?utf-8?B?TGp6WFhhd3Rmb25FUUM4WC8vemtLbzdmUllrajFKcmUyaklRNjdtVlJROGJX?=
 =?utf-8?B?aWUrQkVydXYyNWdEQ1BEaWV2VFFxNjM2cGVRd2ZNcjFLNS82eW4xZUpFemYw?=
 =?utf-8?B?MWp6SXFuNG9wd2s3dXl5UjJwQ3pMaTlKWFFETlhUb0FReXVIZm9CaEZNWC9Q?=
 =?utf-8?B?NDN2c2Z5V1BHSVhIZFFPQjZaa3VzU0NXZC9seTdabXpKUXJ1MEVyT3lQbXJR?=
 =?utf-8?B?WTQrRzdqdk5kUFh3bmc0WGVvbm9rZGs4Y1AwNFJBTm9SbmVJQjJlclU5QlBt?=
 =?utf-8?B?UlZkVWUvUW1maWZWUTNBdVJqazN6Vk9mQ2FRbU42eWs2RUFJTnQrWlVaT0FQ?=
 =?utf-8?B?Smw3cm5sTzdKYmdLYXFCVkhSMCs4c0xZYWx3Zi90NWExWkFXZW5DRXZ2djhN?=
 =?utf-8?B?T0JlQ3ZGSGttRm9wQVNqT1R1MjI2ZkZWMjByUy9sRW1HR1R2VVZNTmZqZUVr?=
 =?utf-8?B?MC9LM2pEZDV1YUx5aG5jVWpRTEUwZVA4L0NLTURPZUF1N0pSQlZ1ck1SZVB6?=
 =?utf-8?B?OGdlU3F1NHZPNUlWR0R3NkFGVG5wZ2NySWJwWUdZZ3pWc1gyTjEwUTdmMXY2?=
 =?utf-8?B?WUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C815D64A08EB2F45AFE60D15543408AC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1b9158a-3102-4cb2-9bb1-08de177d62f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2025 06:27:23.1521
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MFz9W2iLnsU+XYKx/N/uWyFo7FrRgQnWdi9crkHC3OoJF8O64bXSQ7i1E+r73icSOR+WKbEGRWvoL8gwlH0b5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5289
X-OriginatorOrg: intel.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Oct 2025 06:27:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121193

T24gV2VkLCAyMDI1LTEwLTE1IGF0IDE5OjM1ICsxMzAwLCBBbmt1ciBUeWFnaSB2aWENCmxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcgd3JvdGU6DQo+IERldGFpbHMgaHR0cHM6Ly9udmQubmlzdC5nb3Yv
dnVsbi9kZXRhaWwvQ1ZFLTIwMjUtNTM2NDQNCj4gDQo+IENWRSB3YXMgZml4ZWQgYnkgWzFdIGJ1
dCB0aGUgY2hhbmdlIFsyXSB3aGljaCBpbnRyb2R1Y2VkIENWRSB3YXMgbm90DQo+IHByZXNlbnQg
dGhpcyB2ZXJzaW9uICg0LjkuMCkuDQo+IA0KPiAkIGdpdCB0YWcgLS1uby1jb250YWlucyA0MGZh
Y2VkNiB8IGdyZXAgNC45LjANCj4gNC45LjANCj4gDQo+IFsxXQ0KPiBodHRwczovL2dpdGh1Yi5j
b20vb3BlbmN2L29wZW5jdi9jb21taXQvYTM5ZGI0MTM5MGRlNTQ2ZDE4OTYyZWUxMjc4YmQ2ZGJi
NzE1ZjQ2Ng0KPiBbMl0NCj4gaHR0cHM6Ly9naXRodWIuY29tL29wZW5jdi9vcGVuY3YvY29tbWl0
LzQwZmFjZWQ2YzE4YmFhNmZiYzdjMWZiZDQwOWQ1OWQ2ZGRlY2M3NGYjZGlmZi1hZTlmYmUyNTJj
ZTc4NzllODNlN2FlMjJlNTk0ZDUwYjVhOGQyZWE4ZGZiNGNjOGUwMmU4OTY5MDJhMWE4ZjEwUjI4
NzINCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFua3VyIFR5YWdpIDxhbmt1ci50eWFnaTg1QGdtYWls
LmNvbT4NCj4gLS0tDQo+IMKgbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvb3BlbmN2L29wZW5jdl80
LjkuMC5iYiB8IDIgKysNCj4gwqAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvb3BlbmN2L29wZW5jdl80Ljku
MC5iYiBiL21ldGEtDQo+IG9lL3JlY2lwZXMtc3VwcG9ydC9vcGVuY3Yvb3BlbmN2XzQuOS4wLmJi
DQo+IGluZGV4IGNmODM2ZDNlY2YuLmU0OTEwNTUzYmYgMTAwNjQ0DQo+IC0tLSBhL21ldGEtb2Uv
cmVjaXBlcy1zdXBwb3J0L29wZW5jdi9vcGVuY3ZfNC45LjAuYmINCj4gKysrIGIvbWV0YS1vZS9y
ZWNpcGVzLXN1cHBvcnQvb3BlbmN2L29wZW5jdl80LjkuMC5iYg0KPiBAQCAtMjA4LDMgKzIwOCw1
IEBAIGRvX2luc3RhbGw6YXBwZW5kKCkgew0KPiDCoMKgwqDCoMKgwqDCoMKgIHJtIC1yZiAke0R9
JHtiaW5kaXJ9L3NldHVwX3ZhcnNfb3BlbmN2NC5zaA0KPiDCoMKgwqDCoCBmaQ0KPiDCoH0NCj4g
Kw0KPiArQ1ZFX1NUQVRVU1tDVkUtMjAyNS01MzY0NF0gPSAiY3BlLWluY29ycmVjdDogVGhpcyB2
ZXJzaW9uICg0LjkuMCkNCj4gZG9lc24ndCBjb250YWluIHRoZSBjaGFuZ2Ugd2hpY2ggaW50cm9k
dWNlZCBDVkUuIg0KDQpBY3R1YWxseSBpdCBsb29rcyBsaWtlIENQRSBkYXRhIHdhcyByZXZpc2Vk
IHJlY2VudGx5IHRvIGluY2x1ZGUgbWluaW11bQ0KdmVyc2lvbiBhcyA0LjEwLjAgc28gdGhpcyBz
aG91bGQgbm90IGJlIHJlcXVpcmVkIG5vdy4gQ2FuIHlvdSBwbGVhc2UNCmNoZWNrIGFnYWluPw0K
DQo+IA0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiBMaW5rczogWW91IHJlY2VpdmUgYWxs
IG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gVmlldy9SZXBseSBPbmxpbmUgKCMxMjA2
OTMpOg0KPiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtZGV2
ZWwvbWVzc2FnZS8xMjA2OTMNCj4gTXV0ZSBUaGlzIFRvcGljOiBodHRwczovL2xpc3RzLm9wZW5l
bWJlZGRlZC5vcmcvbXQvMTE1NzY2ODE0LzM2MTY3MDINCj4gR3JvdXAgT3duZXI6IG9wZW5lbWJl
ZGRlZC1kZXZlbCtvd25lckBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFVuc3Vic2NyaWJlOg0K
PiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtZGV2ZWwvdW5z
dWLCoFsNCj4gYW51ai5taXR0YWxAaW50ZWwuY29tXQ0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09
LQ0K


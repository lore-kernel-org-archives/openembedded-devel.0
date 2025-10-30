Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95223CCF9F6
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 06:30:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by mx.groups.io with SMTP id smtpd.web11.21364.1761805823919039080
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Oct 2025 23:30:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=G5/8K+Ej;
 spf=pass (domain: intel.com, ip: 192.198.163.18, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761805824; x=1793341824;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=7Ds4tKKsGqCCineFfVwLMTX2muC0jfx/Gyf/Hjr8b/E=;
  b=G5/8K+Ej8Qskab7hsbOdW0VOQIp7ZimbEVQrD5KdT0V3Y6L3IcVCo+rl
   bZpNIo/gzaVa/2LWk9f3V1AJsZuTalJXpdDIYvrE6dcFHK650oU0XfbkZ
   j4clyVdXs2O470yhsqvNmkEPN1J9U3Kcp9jkGyXbOI9thB4R4W7qvCRJu
   E0xFkGldXgWDF7w4IeArDIyFzgIk6+jcnLsyzK+pi766cWhOM88HkTklx
   Zm/0WQsF6lAklK8iPSoB0uRojmuIWFpQQ/lbVBHLqdyMxpfT24eweSP28
   0rpshQOYRBjoyqOtpDib1nG4d7SqwE8xa55zjzSyKGYMTVCqGN1ix7L6e
   A==;
X-CSE-ConnectionGUID: cox/YFT9T0S2zjr/ZnAYZw==
X-CSE-MsgGUID: amatFDdfR4mVZ8DRf1x5pQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="63143849"
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="63143849"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 23:30:24 -0700
X-CSE-ConnectionGUID: ySzC5+9aR3WYyvh6L3vNZw==
X-CSE-MsgGUID: 4G2MwRxYTX20GTj++JRerQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="190233666"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 23:30:23 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 23:30:23 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 29 Oct 2025 23:30:23 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.69) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 23:30:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BTQfyu/phNvOXMJMtsfHCR139A72+hA1iYgLK20hE8l3zWYbz0XZWZOzC+El6sj8/A/BICJFYBOOYDNLihNcz5vx1TzdJg+nuET9a2+h7augWg03mnZblHY+lfXsMgVytZljcmHy1PU44v8mtxQA62cd2d5LrYjAnGKmcAiV3iGzBpz+haqBlQNFsJMUC71czXxol7V0qqRv6LcOEpY5UJOd7jTO1fa5tM7hUogNCaJcCNJiOZ0R1zMoLxRv6OcJolMX3XorJUsMAf2AvaxFDIjz+gsfAW22Ps/D5x10X5bHLP/fIP1YThsR4d70YLZA9e2DRJ8wU++ha9ukmygeMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Ds4tKKsGqCCineFfVwLMTX2muC0jfx/Gyf/Hjr8b/E=;
 b=ypFjfQGl8WSyOFKoVpvVB0lSPdqWlrKu0iXFdRaL7V0zJBNoYNe4PA4omFC6TgNU54gu4nH+wsfNQe8Nh0uqWFTarUHV7Lc6BT2U0Kn8lxuoSjQnNjlS0LizeKzKWpBoovR01ogwStLJNBT6zR7/C7kS3lc3vNYW151tY6/Pkj1Mmqil6e5DloKNFncJPwbqcv6nfMjnyzX9DeoFjTguw+RdAGX0eSaVGSD2HL7d4A+uOZlCaOssGT5E/GxXYgGSdSqwKfQc+fAqaNEZX1rydBqyrwTdt5pa6wGRuzsf8IfyLt3i9HBnsr2mF1plF22u4etNB0bTiS5rRyCdOVyrAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by BN9PR11MB5289.namprd11.prod.outlook.com (2603:10b6:408:136::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Thu, 30 Oct
 2025 06:30:21 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%2]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 06:30:21 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "ankur.tyagi85@gmail.com" <ankur.tyagi85@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe][meta-oe][scarthgap][PATCH 3/4] neatvnc: upgrade to 0.8.1
 release
Thread-Topic: [oe][meta-oe][scarthgap][PATCH 3/4] neatvnc: upgrade to 0.8.1
 release
Thread-Index: AQHcPZ37YvznuhOgVE69bOv/Vb0tNLTaUhcA
Date: Thu, 30 Oct 2025 06:30:21 +0000
Message-ID: <7f5241e9b478670a94d9b021f3b359f2d7d185d1.camel@intel.com>
References: <20251015063531.1573191-1-ankur.tyagi85@gmail.com>
	 <20251015063531.1573191-3-ankur.tyagi85@gmail.com>
In-Reply-To: <20251015063531.1573191-3-ankur.tyagi85@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|BN9PR11MB5289:EE_
x-ms-office365-filtering-correlation-id: fc4ab00d-f9fe-4369-0510-08de177dcd34
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|4022899009|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?M2NGd0VSM01LME1nOW80U0h4MEx6UkVDTGZRNmlSRzdSREZXWjM2Z2UrYWZ1?=
 =?utf-8?B?MDhQUXZtYlNWcHNIV2pJVG5xVU1oNDVJQmtwaEhkNGVRSmNjYnlPMWc5ZWJ6?=
 =?utf-8?B?bmplNVdLRnRhdUl5MGRCR0hDbHdaTG40WWdOei94dC9OYkZ2dkN2UzY2VTlF?=
 =?utf-8?B?K3N0dEg2T2xML0c0MjltcEovcDh2Yk01OXRrakxlQlk5TWpYbWFubHhqS1Bq?=
 =?utf-8?B?MHV5OHlMSjdLWFRYQ2YvSjBoa2dRT3pQTXJ6MlhDNWt6WEpvVFNzaWp3WUx2?=
 =?utf-8?B?cDdGdzFDQjhYeHdkdS9Md3JYUjFqQlRaaGpVY0tMWEZIeURjenNHWDdsdE1E?=
 =?utf-8?B?YjhXNkxlQ2RNd1Y4b2JpQUFXR3BQZi9uRkp2YWs3bGZaVW1YVUlZR21tVVBM?=
 =?utf-8?B?OUpUVTB0RUdEUTNrcXo0bTVXczdOVytoVmZ6TUlaU3JwNUREY2NDUldHb1Jo?=
 =?utf-8?B?S1N6L1FKOUc5Y2ZFc3JyM3pYTEtvaHNFamROaXBFSEMxK1lQa0FmM1ZZdGk3?=
 =?utf-8?B?UU9wd3JmRkhnbjV3ZnE3cW40OUtMN29yb0U4TEdicjd3Z3g1VGQrZTVpSFUr?=
 =?utf-8?B?L0pzVFBYZ2xMNnZ6ajNzY0dQdGZLZTg4b1lpaDhZWGdOVTZBUHNVOXlNR3Na?=
 =?utf-8?B?MngrVkdmVGV4cTQ4RElrd1haYWZwemRkMzEyT1BzTW1pdjBiQitNSGdGUWNM?=
 =?utf-8?B?U1EyL3N0NVFhTjgwQytvdmM0RHhEazJudmd4VlE2Uk9DY01BWWk0VTlOUnpT?=
 =?utf-8?B?M2JJMUtJT0UxUzE4RC8raFFsUnlsbkN5UXJlUDdoR1U4MkNZMWZnM2dNVkM4?=
 =?utf-8?B?akljN3BMVEVLbkordVBqNzNtL3lKMlduV2szZzQzSko0SDFoZFNKb1Naa1lk?=
 =?utf-8?B?U2E1UU1EdzNCaTUvMExrdExiS2tMdjFjK1NVdEtRU0I4THZ2VlN6eHdITVZ3?=
 =?utf-8?B?SEpjSFlZcTNNT3RqTFJKU0FkMUVHNFVZd3oxMU5hb3BHenAwbEltSHh1Nmkx?=
 =?utf-8?B?VlJoM3FQVzZnZENTZHcvbHZhZThMYnlld3JUb1l5NzNOY1YxOW1TUi9LSjdR?=
 =?utf-8?B?bmM2T05UcFFGNVhtWjdyTFcwdDVYWnFLYzAwR2hNbnZ2eU0wU1hnTXFmb24w?=
 =?utf-8?B?cm9SLzc5QlUwQjEvRHFkNkF6TlZwNlB6a1A4RkF5YXFKQStZVjlPZlVTMGhm?=
 =?utf-8?B?V2kvN05UUmNTeUM2WE9KQ2FvcUM4QjcvaVlGWlA0bFNsUzdpR251dmplYVlS?=
 =?utf-8?B?RGpSV3pNc2RRazFQdkF6WkVYY2VDTmFiT2E0V0l3TVVoRjFEb0xobHZKaUdK?=
 =?utf-8?B?SU9ISFh5OHJGMGo5S2ovcWk1T3F2YnhoRTRhVXhmRWxvSmhiWGxKVHhZcHJV?=
 =?utf-8?B?T2pQVVdHYjg1UDhoTTZpcjZFa0htQWN1SWx2Mzg4V2ZjQWcrTzdmM1JyRE1a?=
 =?utf-8?B?SURxenNCb2syK0l2VjR2MzBnS1FseVJKZmtMK0NVR25RMWZoNWxINTAxOSth?=
 =?utf-8?B?aFV1Q0xlMDJ1RHk3R2ZSTGpBSjZ0emcxd2JlRHdiZTlvZHNnV3AxaDNURGps?=
 =?utf-8?B?LzN4TGNDQ2wvZDFHczlnNlhFY3F1R05FeVQ5cVhmNWZVQnJMTU1KL0QxSVY1?=
 =?utf-8?B?TGxyc0hVSFVqZitTWmIvbjdpazV5OFRlSm4vS0M2RzFXT05oZGtvR1RmRGhl?=
 =?utf-8?B?RUdxZDVvWCt4b3RXNXBLb2ZCOGxGV3JhNE9JaUVhaTkveU9CRytBWVZrVDNi?=
 =?utf-8?B?emcrelAxeFl4YnZVM25NTXVGdU1Wa3Y1NHNQRDhPNmZzVmF6cmMxcGZsVVFC?=
 =?utf-8?B?SUpibktUcjUrd0hEV0ZMSFRJUjJDUVBNeFhwSU5aQXN6MFhqYlNRWEUzYzlw?=
 =?utf-8?B?S3gzNE9ZeHp0NS9XaUxKaSt2RzVsbThEd1NZdGdxVG4yRlZCRHFQZExqZ0gw?=
 =?utf-8?B?SGNaZ0hKdFNqaEVIVWY3aFU3VG1wL2JnR2ZxL3h2SVhtMTFYNFpxT3B4Qmwy?=
 =?utf-8?B?Ui8wVk5ZTE53PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(4022899009)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NVkveVN1aHFzbEhOOTJ1WTd5dWZDTVozbGFtaGx1bGg3VnlXQXdQMUg0UCtu?=
 =?utf-8?B?Z3kySGQwQUdMUEVFbi82TDJKSForQXVRSEg3NEtrS0l3NjZTMDE5TUxnRkZX?=
 =?utf-8?B?bzlWMndBdVBCQ1BWc1R0VUNmWXRMY0JsbHAwTi9wMFhSR2dINHNiUFExV0Q3?=
 =?utf-8?B?WmNaKy9RYVoveTJ5QWNoS3BhaURyK295NUp0aG41ZDRkeFFJVktoK2RYc0l2?=
 =?utf-8?B?QkdrYmpUWWxDaFFZcmFYcXA2MDNwS0J1aVA4YWZOMVJlWmpMR1VrcEVJbEVO?=
 =?utf-8?B?SDlXbTRzNmV1ZDRiQmh1Tyt1N0xreHMzRFQ3MXcwRFk5SS9xd0dlcW1Id2l0?=
 =?utf-8?B?bFBjQVJWUytsN3VyWEp5dUdId0VuMlpsSnd6TkxGaDVhUDQ2NGJoMnQzVkxx?=
 =?utf-8?B?WFp2Q3dGQnJiaFpxNlIzUUlGSmtsT3hGRlBMVWFPMGhUMmRzeXA5TCtCUDFQ?=
 =?utf-8?B?UHFZLy9SaUlOcHZzSVlyRVFrQzlHR1F3QWtEbjRhd3VTWHp0dlMwTWVabVM4?=
 =?utf-8?B?SUI3VWpxTE9xU1J0WGlYb08rSVlNSkdETUhPRExNbDVKY055dDhMbGplU3RM?=
 =?utf-8?B?dUpRbldaZjhBUDUzUVZPU21JTXJPNXd1OXNiQVltOWZNbnNJL2NhL1dyOGNZ?=
 =?utf-8?B?K0x1QmVPTk85bVhPUUY4MlMxVmNkY0ZMUDVLaVZSMm1hV0ZzVWJQdXFrM1pv?=
 =?utf-8?B?YW8rSFRWU2hqTUt4SGtZQ2wybnZWakZ2VFNEV0FYeW5McjVnMUE2OGpvL3JD?=
 =?utf-8?B?T0c2ekk5MnBtQ2c5S3NBL0lRSHhHNFB6RkFmV2Q2T0Nrd2tFSzF6NVVxYUdD?=
 =?utf-8?B?R2VteWpYSU03V212RW8wVzZSeEc1OTd0dzNxclJBRFFXM3ZUNXZDRWMvVk9L?=
 =?utf-8?B?OXJkK0xKWTFhUXJiRVE2ZGcxbG5FdXVWQzJSemhFNzJEZUlVTUxFTWJuWjBE?=
 =?utf-8?B?UHV4TVEwVjd1cDdZSGdxWTFZaTNIWjBYeEVzbGo3dE0rczNPRUN6MTNuM1dp?=
 =?utf-8?B?UXZWSlUyN1JNT05ZeFJjV2wyWHFiQ05TWUJ4d0trWjJSN2N6c2lZZWlRSU50?=
 =?utf-8?B?M3FIRzFBL3pYQVpLYm11SFR3NFBsT1REaG8vVjhjc0dTY1hWZy84Vmhad05Z?=
 =?utf-8?B?c3g0ajFtSlpLaU5Uc3dzSGFyUTYwVkdPK3R6VmFrZlZHWUE2TjhFOWl4SDBk?=
 =?utf-8?B?YXRiODMxM0ZRSTFGdmdUMnA0NlRQSzFuM25QaXJjY1dVN1NvZ3BlazM0ZGl1?=
 =?utf-8?B?bjFrNnNjUTdhQUFMMWkwbTRLbnl3VDEydUxOMjFGYW1DbkUwd050bEk5elpU?=
 =?utf-8?B?aGlhVjh6cmNMdThiSjJtZ2dCT0hEdGdGdTBjeERtcmZrK2ZwQVF4RDNZU0ZU?=
 =?utf-8?B?MFZmcTBpOG4vYW55QllwWDZ1eXZqeVNUcmNVTDZXNmUwZlBTOXBRQnBicGVN?=
 =?utf-8?B?c2RybDlOVXBaOG1pOXZnVDdTcnBLVmJEdlBzbEpTNDA3WTEzTlRYUTVLOERO?=
 =?utf-8?B?Uk1oeGV3Y2VBZ092SlNmNUliWU1DMlZyODlzK0dDOFJYcmJSM0U2QjFmcmln?=
 =?utf-8?B?RjdINXVha3hEMUxyWElJZEYxVWlJNEJVZ2FzTXZBRjdhWnFSeVVRT2dxbG0r?=
 =?utf-8?B?UlR2bDV0cnBRQzBvVkpUTGQyNE90SU5TNTJiQzRTRXFFMThHRERJY3VKT2Zp?=
 =?utf-8?B?YndBVmx0empXVHFoT3BDalpvWFB4RFdQSEo4VW4zSXhCdHdHUksvNGF2aHRz?=
 =?utf-8?B?aFI5SFQvTmZFaW5pQ2x6aXJpY1FtbldlemtiSjhCaExqc1REdUlkREdRMmVx?=
 =?utf-8?B?NmRrdG03MkVBdFpmVTVDeWNlYTBXWVZhUzRNNDdnRkYza2pwMzM1Q21xc3Y1?=
 =?utf-8?B?MEJXbkNYcWJjTjBGdkZhUTVianJDWktsaUF2VVlxUFlKRmVkSU5kN1dNMWJL?=
 =?utf-8?B?U1RVeUUxM1Z2aXhyVS94d0JjSXVScFVrVTZacEpRNEZhYWdUTnl1d0p1cVA4?=
 =?utf-8?B?RWl3d2VOYmlwT0VxMlZhaU1sSXdmdjVwT2lXdlNMNTFpbzc3aGZ5M2ZPRTJV?=
 =?utf-8?B?aE5BNzNwa3RmcWswNEZkZVJleHF3Zk9mWjErUXI3RkRrRW1lM2grQTVndGdi?=
 =?utf-8?B?RmY0WVNsa2w0SUtxNUVoZU04NzB2Rkt0SmdHUzBPa0tFY0RoT2lkc2NwS1RF?=
 =?utf-8?B?dlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9512AF182E40BA4AB76C1941050B1315@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc4ab00d-f9fe-4369-0510-08de177dcd34
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2025 06:30:21.3762
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fq6vm0R+vjzMB8RrthVLEiZWQoWcfdhtLvVP/VqQ1ZTUAy/v1gKVNKw+viaDUHek/+KYAfe9rUFvW3PSJQ75GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5289
X-OriginatorOrg: intel.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Oct 2025 06:30:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121194

T24gV2VkLCAyMDI1LTEwLTE1IGF0IDE5OjM1ICsxMzAwLCBBbmt1ciBUeWFnaSB2aWENCmxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcgd3JvdGU6DQo+IFRoaXMgcmVsZWFzZSBmaXhlcyBDVkUtMjAyNC00
MjQ1OA0KPiBodHRwczovL2dpdGh1Yi5jb20vYW55MS9uZWF0dm5jL2NvbXBhcmUvdjAuOC4wLi4u
djAuOC4xDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbmt1ciBUeWFnaSA8YW5rdXIudHlhZ2k4NUBn
bWFpbC5jb20+DQo+IC0tLQ0KPiDCoC4uLi9uZWF0dm5jL3tuZWF0dm5jXzAuOC4wLmJiID0+IG5l
YXR2bmNfMC44LjEuYmJ9wqDCoMKgwqDCoMKgwqDCoMKgIHwgNg0KPiArKysrLS0NCj4gwqAxIGZp
bGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiDCoHJlbmFtZSBt
ZXRhLW9lL3JlY2lwZXMtZ3JhcGhpY3MvbmVhdHZuYy97bmVhdHZuY18wLjguMC5iYiA9Pg0KPiBu
ZWF0dm5jXzAuOC4xLmJifSAoODElKQ0KPiANCj4gZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBl
cy1ncmFwaGljcy9uZWF0dm5jL25lYXR2bmNfMC44LjAuYmINCj4gYi9tZXRhLW9lL3JlY2lwZXMt
Z3JhcGhpY3MvbmVhdHZuYy9uZWF0dm5jXzAuOC4xLmJiDQo+IHNpbWlsYXJpdHkgaW5kZXggODEl
DQo+IHJlbmFtZSBmcm9tIG1ldGEtb2UvcmVjaXBlcy1ncmFwaGljcy9uZWF0dm5jL25lYXR2bmNf
MC44LjAuYmINCj4gcmVuYW1lIHRvIG1ldGEtb2UvcmVjaXBlcy1ncmFwaGljcy9uZWF0dm5jL25l
YXR2bmNfMC44LjEuYmINCj4gaW5kZXggYzljNGE2YzI3YS4uNTcyMTM0YjQ3YyAxMDA2NDQNCj4g
LS0tIGEvbWV0YS1vZS9yZWNpcGVzLWdyYXBoaWNzL25lYXR2bmMvbmVhdHZuY18wLjguMC5iYg0K
PiArKysgYi9tZXRhLW9lL3JlY2lwZXMtZ3JhcGhpY3MvbmVhdHZuYy9uZWF0dm5jXzAuOC4xLmJi
DQo+IEBAIC00LDkgKzQsOSBAQCBIT01FUEFHRSA9ICJodHRwczovL2dpdGh1Yi5jb20vYW55MS9u
ZWF0dm5jIg0KPiDCoExJQ0VOU0UgPSAiSVNDIg0KPiDCoExJQ19GSUxFU19DSEtTVU0gPQ0KPiAi
ZmlsZTovL0NPUFlJTkc7bWQ1PTk0ZmMzNzRlNzE3NGY0MWUzYWZlMGYwMjdlZTU5ZmY3Ig0KPiDC
oA0KPiAtU1JDX1VSSSA9DQo+ICJnaXQ6Ly9naXRodWIuY29tL2FueTEvbmVhdHZuYzticmFuY2g9
bWFzdGVyO3Byb3RvY29sPWh0dHBzIg0KPiArU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL2Fu
eTEvbmVhdHZuYzticmFuY2g9djAuODtwcm90b2NvbD1odHRwcyINCj4gwqANCj4gLVNSQ1JFViA9
ICI0NjQzMmNlOGNhZGUwYjU0YTM4ZDRiYjQyZWIwN2Y5NmM4ZmY0OWZkIg0KPiArU1JDUkVWID0g
IjA3MDgxNTY3YWIyMWEyYjA5OWNlYjQxYWU4Y2FiODcyYTMxY2JiOWEiDQo+IMKgDQo+IMKgUyA9
ICIke1dPUktESVJ9L2dpdCINCj4gwqANCj4gQEAgLTM2LDMgKzM2LDUgQEAgZG9faW5zdGFsbDph
cHBlbmQgKCkgew0KPiDCoH0NCj4gwqANCj4gwqBCQkNMQVNTRVhURU5EID0gIm5hdGl2ZSINCj4g
Kw0KPiArQ1ZFX1NUQVRVU1tDVkUtMjAyNC00MjQ1OF0gPSAiZml4ZWQtdmVyc2lvbjogTm8gYWN0
aW9uIHJlcXVpcmVkLiBUaGUNCj4gY3VycmVudCB2ZXJzaW9uICgwLjguMSkgaXMgbm90IGFmZmVj
dGVkIGJ5IHRoZSBDVkUuIg0KDQpXaHkgaXMgdGhpcyByZXF1aXJlZD8gVGhlIGRhdGEgc2hvd3Mg
dmVyc2lvbnMgdGlsbCAwLjguMSAoZXhjbHVkaW5nKSB0bw0KYmUgdnVsbmVyYWJsZSBzbyB0aGlz
IHNob3VsZG4ndCBiZSByZXF1aXJlZD8gQW0gSSBtaXNpbnRlcnByZXRpbmcNCnNvbWV0aGluZz8N
Cg0KPiANCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gTGlua3M6IFlvdSByZWNlaXZlIGFs
bCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+IFZpZXcvUmVwbHkgT25saW5lICgjMTIw
NjkyKToNCj4gaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWRl
dmVsL21lc3NhZ2UvMTIwNjkyDQo+IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5vcGVu
ZW1iZWRkZWQub3JnL210LzExNTc2NjgxMy8zNjE2NzAyDQo+IEdyb3VwIE93bmVyOiBvcGVuZW1i
ZWRkZWQtZGV2ZWwrb3duZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBVbnN1YnNjcmliZToN
Cj4gaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWRldmVsL3Vu
c3ViwqBbDQo+IGFudWoubWl0dGFsQGludGVsLmNvbV0NCj4gLT0tPS09LT0tPS09LT0tPS09LT0t
PS0NCg==


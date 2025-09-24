Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A6B5CAC5A5
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 04:01:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by mx.groups.io with SMTP id smtpd.web10.4911.1758686479283554464
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 21:01:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=EbWDsXz2;
 spf=pass (domain: intel.com, ip: 192.198.163.18, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758686479; x=1790222479;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=58vCSi5YSrVJSJdhzshOOUYbDRWUXSzw5AjWi4hxMK8=;
  b=EbWDsXz2dWA/J2DDbi7zDh0MJLrvCBbSUs1lGdlBD8s2tjQh8ohEbdMK
   ddPFxrFzoOx7Nb7cwoxnal2PVHPWYGNscDyQesw4GZQdV0IrCYp5miROX
   cfiEqqRYRfpAK2k9TS8OGJiNUuK+1kZ0/VK4juiV4/791C3AOVhgHOvzd
   ZIG7fVpQEEHywAYe3YvSkaqXCOiEKnWz9+i+867qyhn+7pWf0OVYXXkXn
   1ocFSI/Z8pMCGvfmS2Q6luxx83bshFJlNXuJWUld0wHllT4CItbPrr8rc
   SOwdtoXk01f/RrsQhRf8mkKYMAk9lJndX7o8AuIZIrCdK3srA0y3Fm72P
   A==;
X-CSE-ConnectionGUID: 1kCSOAq1Qx2lMRsp9dJSlA==
X-CSE-MsgGUID: mrJXW4IxRXu5RY5GTlz4dA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60191852"
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; 
   d="scan'208";a="60191852"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 21:01:19 -0700
X-CSE-ConnectionGUID: VQRDKiWtSQayGSTINTySeg==
X-CSE-MsgGUID: AT8sBRluR/qYN1GEaBkLtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; 
   d="scan'208";a="177372758"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 21:01:11 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 23 Sep 2025 21:01:09 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 23 Sep 2025 21:01:09 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.41) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 23 Sep 2025 21:01:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H1s0boCWr8OEd/DT91rWY5cB5bNZZcgmcLt+KHD6qaUxc3hb6yIybFYgVynyNFmr8ZwLWpj3iy1vX7ET6ukkZoVdbZj0QZti8PyvHT9JHOeuxprBO4PpMp8oKOBkhH78sTb8UnulnBvWe37vXaOcJNGRzp4Ptd0POsdJCsGGijwEt5uC8BF6oPqf/28esON8wYX3DLVdoGxxuMXJH+gKgXisxCYkiYSV+aqHgR4wdYXWPlOjMkF8LmKXr2qdnsMbxMfFf4Zu90R5EU2/FqrfsCZYajWEFU5EprYLwfRT0C7PlvbJ6GpRFLWkygMAn9qBHbKpXMdICgCUw/x/oYf+NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=58vCSi5YSrVJSJdhzshOOUYbDRWUXSzw5AjWi4hxMK8=;
 b=JMWDwxX0G+2pksmXDztSbxdFJkfPCL4ueyz85jnXoWYZ2BlmqokSw8gUGQgvBkAdivVNDoa15LqRBhxyw4V/jedj5GhW27ezlGjGphk+qjD//jxduGBnBCuOUxacMZXr+AgCSZZdQTi77vXjIgDIvq7F7HbwX2v22SsBrTjxORkQ9KKRY2FahXVcD5pHmsUN62hOS0GIjuphAEOgwgxWMKLpecCGGwO7HA1hZWhlcaDy2Bu0kTEDeturOP6Mo5zGmVnQSMABzFqPNQCHl8k2jiq8Ptgjv/dqCewv2dO1V1A84y9c8MTJVcKQHCH2JKMFPSK0xi52m3NfJq7W+6eg/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by BY1PR11MB8127.namprd11.prod.outlook.com (2603:10b6:a03:531::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Wed, 24 Sep
 2025 04:01:04 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%2]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 04:01:04 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "skandigraun@gmail.com"
	<skandigraun@gmail.com>
Subject: Re: [oe] [scarthgap][PATCH 00/24] Scarthgap pull request
Thread-Topic: [oe] [scarthgap][PATCH 00/24] Scarthgap pull request
Thread-Index: AQHcLHw6Yt+nDfapbkq9DRtlVxwbObSg2LiAgADd/gA=
Date: Wed, 24 Sep 2025 04:01:03 +0000
Message-ID: <7b710a5a675f5bf2fbc5a1f5da6a770a5f4c7ab5.camel@intel.com>
References: <cover.1758626365.git.anuj.mittal@intel.com>
	 <6def8d74-347f-400c-94da-1360b625013e@gmail.com>
In-Reply-To: <6def8d74-347f-400c-94da-1360b625013e@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|BY1PR11MB8127:EE_
x-ms-office365-filtering-correlation-id: 3582f7ae-55fb-40e1-55ec-08ddfb1efb47
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?Tkd5eWVwSXZUWm1uTzAxOHYyNWVwTG85RnpPeWwzRDJseXZ4VFR3dDJ2ck4r?=
 =?utf-8?B?bzdvYVVJMC8wTDc1d3VXSVdQdjAwdlhMaFk1bGlGUVp6Z1MyUWtqaXNPSWZv?=
 =?utf-8?B?eGs4Qi9iTmJXL1VqSzhLeXV3aFlobERjUThiY3I2M3grQUZ4NjR3cDlVMGVC?=
 =?utf-8?B?L09BQVRnQmdLcmJqM3BTdHR2cTNLOGZYdmpTQk1TVFgxaGpEbzdYdlNtNElr?=
 =?utf-8?B?SnR3V3E0V2JCeXB3SS9hWGhldnJQNjVNRjdPL1VES08xbzVKWVhWb3NyMXhE?=
 =?utf-8?B?UWVUQ2ZpRWttT2ZqeFFTUHV3ZTNkUUMzV1FVM0lOUzhvRUNkYzlqMlcwTlZu?=
 =?utf-8?B?d2NrZzNIaEJQbjhXZFVoZituWlg4bkZ4UG04ZVpwakVTUWZrcnpzSUZQNTU2?=
 =?utf-8?B?SyswY3lZa241bXpOOXZxVTJwVnRTQmsrVHJ0NG92Sm1UTXlnMmFzWTJvNHRw?=
 =?utf-8?B?V29LMWpFTTF1VVMzbC9Hdk9DNzBmMVhIcjgxNTlVd2F6V3RNeVBxSjEzcGFO?=
 =?utf-8?B?U1N0SCtJUkxrenU1WjZyK2swRFo2bVZMOVBGK2JRNVdQZEZOeGJQZG1uWTNU?=
 =?utf-8?B?d1ZyR2Y2bDFua0JLUEtFVVdHMTNxeTNXaTF6WWhBeW1ad2Nzckpkb1R1OGVl?=
 =?utf-8?B?RVBnRXN1VTE0clZEM2prMXV4MUFsUGVxQW13U0pMaVowSXg0VXd1UXJnM2lx?=
 =?utf-8?B?bjhTa1VhemdjcTE1aWppQ0VnS1lwVCsxdlowdWFUMUJwcVFhSm5xeUR4Rndn?=
 =?utf-8?B?b2c1bEUybm90K3Q5WjJPVXk0NmxHOFRZWHN4LzhaVzRHTE9uSzRQOTVlU3Zi?=
 =?utf-8?B?NlZIMytnQmJvSldWakptMFFsSDl5V3lOMjNwSGNHZ3RrRG1ubEoyRGRkV3By?=
 =?utf-8?B?ck85dUw1ZzdEbktRckVpU1JDc3JUMUV2WnBqY0IwVDBucFpMaVZjeG5JL3lm?=
 =?utf-8?B?VUZFY1FmUzFFcTNRVzBvUG5VSktkTTRTT1NMN0IrbkpYb2xRazFMT085K2d4?=
 =?utf-8?B?N3ZRVUFFY3NyNi9uWDZEZktGZTJCS3lRY014NGUwcEl2M3dXb0syM0F4MHJQ?=
 =?utf-8?B?WFZhNWlQMzBmM1JLeEJPdE0yVzlyMWZQNSs5eVRKcnlJcHpaQnoydlFwYkZl?=
 =?utf-8?B?b0UrQm5vd21jOEpvYmZyV2dQV05ZdmpUMk4xYytHaTl6bWRsTTAxSllxcTdH?=
 =?utf-8?B?ZDFhMTNicno2QnI4Ykc1VUloT1ZwSlpVY0RQNXBKUVpUcDI4YzNvOXF3bUFH?=
 =?utf-8?B?NVptM3lpbzFIbGkrQ2hTek0yUmNOenluQlJxc251K2tSVjBIU2czZ3FKTGdk?=
 =?utf-8?B?TkgwTXA2RElVMjd0RGw5cW9pdnJKQWxUVXFXdDlnTS9ub04wYmV1bnhIUnh4?=
 =?utf-8?B?UDRVc29LbzRTYVdPNHV5V3l3Z0c3eWtwN0xGaTlQYkdJSFpsYjVTYmlBTjRP?=
 =?utf-8?B?WTlKUTg3SlZibDYrdTlOZVA2SDZpeEVNNzFHNEZvK3BRWC9xZ0FCalZFc01G?=
 =?utf-8?B?blhSTUF6OVN5WHA3WmZHZWhMMkNiV1V3ZjFMSUpUUlI2MXhlamx0TWlPdmZw?=
 =?utf-8?B?UlZHTnNWa3l6MkhNalBBb0J4R0ZLemRSSmhHc2I1c2NOY1pKRkFXdjg2TVI1?=
 =?utf-8?B?aTRjYlJYU2h1cHUvWVlLbEs4UzhmT1V1S0s3MEZ2a1J1T0dSQ3J1S3BCZS9O?=
 =?utf-8?B?YjhxQmNUUytqbSttNU5uWGtHQW5LaGYweXQydFA3eWo0QlBxM1NMK0hzNFM4?=
 =?utf-8?B?MDVwem9MVUhMZjA3WGgxM24vUkVENEF6U1RKUDBSMVJiZ1BTZEt0OHZ6aGx1?=
 =?utf-8?B?OHFrVEVZcVM4Nk1wUkQ0NjB5bXZMWlJqZU11Z0x5enFpVDlSZndOR3l2d1JK?=
 =?utf-8?B?WGVNSVY4TXFSN09sZ21CU2FxTWRta2NmM2x0REhJblFuKzRlTlFwLzVJWG5B?=
 =?utf-8?Q?J+kTekpt9KQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bGxLeUk5emF2SXVNUnJrdjZLYnphRG55TVkwR3l4ODZHOVJISEdjeEZiaU4r?=
 =?utf-8?B?ZENKYlVNa2pVZDhSM3hkelNDcHZYU2FnODhKak5QcDZGZU83Q1lFempxRjIw?=
 =?utf-8?B?ZEhWTW1saHQ3bU1QSGFxbm1rcFVlQVlISlRDRTN2SHdMMEJodlMzQmVzcWs1?=
 =?utf-8?B?K2dqckdxVDNRRTBIaVNuVWt3QU9idGgrUFduUVRtUDJLRW4zSFpvd3hsdUkz?=
 =?utf-8?B?UjdMN013LzBWRXBHRFRRL0VYRDdQUWN6UjRqY3NWSVNmN0NJeEdLZmdsN0dm?=
 =?utf-8?B?bFNPV1cyTnJEdmNFb1FOdks3dnpwbzY5R3FDWE9wanBCK1paWnllZU16Qkhr?=
 =?utf-8?B?cXVEbVA5UWpBTXgrOUdkUTZjZE9sNFh2NFV1b045MU5uREVzc1hoWjR6YWRr?=
 =?utf-8?B?U2tDU2ROOW80NG0zbFJ2MlB5NjlWLzRtS01NU0JkMVc0MzZ5Y1NzWHJ6RHlY?=
 =?utf-8?B?cCtqWEh2TkFHT0hCbUltNStzV2tSVWc1V0dUaE1YdVVraU9QVkdWaXdpTWd0?=
 =?utf-8?B?RjJyZEMrVTczbG1rc2JFMnFqSG5TbDRqaUUySVoyTWczRkZSU0F1WmxWWmlX?=
 =?utf-8?B?SDc5MW5QSWsrM1NWRjNjb0wxTzh2ZjMwOXhueXk3ZHhFeW1QaVgwb0ExZytz?=
 =?utf-8?B?ZXRWZWlFVjhSeUlnN2p5M0UzdjNnZ3RDYmM5czhDSGp1R3lHdmliSmRjVUVo?=
 =?utf-8?B?bFgvR2R0REVRa2l3SG5ublR3YjFUZlZFTnBsU1pvYVJxRTdpcnBzczRaVC9J?=
 =?utf-8?B?ZEJuY01kNUF3Y213b3REWHNkS0ZsUUc5Q0hkSWRxVkVXNzA1dTh5UDRtcHl3?=
 =?utf-8?B?YVZqQkZsbnBVcyt5aHV0d1pSaVNyUTZmOUhnRmxpQWZBaGVwSVlaZFFoMGRH?=
 =?utf-8?B?YWtqeUJJbFR1bjVHS1VreWs1WXBrcy9VZlUwenZoZ0hldHRXVmdQVFM0UWRz?=
 =?utf-8?B?ZGhSanZXQTFHbVhKZTFvM1YyWG0zN1VXMUJKRU5valZmSzE0TWdwRjZyK0pW?=
 =?utf-8?B?cGdLQ0J6bGNuaGlYZldTRGpxUEwvWE45TzV0cTZ3OFh5c3hCMXZhRDdhelJU?=
 =?utf-8?B?aWlWOVJaUWlYRWMzYTlXUzlXZis3VEtWYi95aDRDRzBBcEFEU0l6MVNLNVhZ?=
 =?utf-8?B?WkpLbjFYbEJFVGtOa2dZY2x0Y0paL0VBbThUc0liRDhCMVc2WCsyb3Fhb2xp?=
 =?utf-8?B?QmVham5WcTRhNHAxOHJYYmJHOHAyVUxBMlU1bjZ3MGtVUnpXaEVPVWZmSTVh?=
 =?utf-8?B?Ny9JdEwrVWluTmtra1ZsTC9UNUdZakRkbHFDRFFjZ1lIMkFuLzRGYjB1WnB2?=
 =?utf-8?B?R0ZxYlJ0RlhjUXFmNVFabnQ4cE52TUtsMElzM2lDOXZZRUEvZWRYRFJtYWFl?=
 =?utf-8?B?N1VJdWhEMWV4aDQ3Wml6MXlMRG9UVVd5QlNBRllnRlVNRmhPY3ZHMlIwcjN0?=
 =?utf-8?B?eTBkVEJ6R1dyRmxKVytWZmpOM2FNamx6eDM3N0gyL3d4TS9GT1JNWHo3UU5z?=
 =?utf-8?B?dmIvelJlMlJvOEU4WWZ3MmdGOEo2eFpmTkNUbDh3T3czZUZOT3pxN3dSc1pJ?=
 =?utf-8?B?dGNHaU9QcXp1SE9TVTRyanBKR1JwZ3BaMTJJcTRVNDhrN3NhRVp4ajB6OTY0?=
 =?utf-8?B?T2NHWkV3OEd1YXJnb1lwWG1hT2JxazFhdWdHVlEvejZQbHhtSDhNcHJibDJP?=
 =?utf-8?B?SHdJRnY4bUJDNWtwUWp2bzk5MHhlUjE4Mk1VaVJVRzNqdEVJekgvOXFWQ2x3?=
 =?utf-8?B?L3BVbXZIWjVBREZlK3pRckxPTGhFTWZZZlQ1VzRiUEVINVVScm5sS1Z1WSth?=
 =?utf-8?B?MWVNRW9ZTGFrRGc1Ukpab2N6ZDFoN0xHYkdEZkZzcytxNjhWQ2QrQ3J2aktT?=
 =?utf-8?B?cThranJxODV1Mm42NnlwbGRjNFJmVWxXaUo1MEVpbCt6S3hnVWtNYllmYU5J?=
 =?utf-8?B?L1pYTTFybHRJdllpNStiaGY5K0twU2lZUWRBazAxTEU1WGZHcGxEN2dBUnNF?=
 =?utf-8?B?MEdwUUJGZTdTR1lyam8xbS81a09aWHNRa2wrcXpzZjJvOWtkMWE0SUtSUDFk?=
 =?utf-8?B?aEhwaXRYUnEzTEJVVVRPNWROMmhraHlRcmpEd0NMTVMxWDFvdTNldVZMSEZN?=
 =?utf-8?B?UmhUUnZPUVVHMGczK1hvVlpnb3J2S3gxejdZQnpldFpOOGp0M2NmWTVGRlRD?=
 =?utf-8?B?SUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <746E07D19BE73147A1FC70D19DC33439@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3582f7ae-55fb-40e1-55ec-08ddfb1efb47
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2025 04:01:03.9563
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 31k2ppuOiUpGsS5pjGVe2sIyiQ3944IQyku/s9qubT21xmOxdXor0aXTgYt9aQZnxMkkqo2Gi8ieRiokL1+cBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8127
X-OriginatorOrg: intel.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 04:01:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119749

T24gVHVlLCAyMDI1LTA5LTIzIGF0IDE2OjQ2ICswMjAwLCBHeW9yZ3kgU2FydmFyaSB3cm90ZToN
Cj4gT24gOS8yMy8yNSAxMzo1NywgQW51aiBNaXR0YWwgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcgd3JvdGU6DQo+ID4gUGxlYXNlIGNvbnNpZGVyIG1lcmdpbmcgdGhlc2UgY2hhbmdlcyBmb3Ig
c2NhcnRoZ2FwLiBUZXN0ZWQgd2l0aA0KPiA+IGF1dG9idWlsZGVyIGFuZCBsb2NhbGx5IHdpdGgg
cWVtdXg4Ni02NCBhbmQgcWVtdWFybTY0Og0KPiA+IA0KPiA+IGh0dHBzOi8vYXV0b2J1aWxkZXIu
eW9jdG9wcm9qZWN0Lm9yZy92YWxreXJpZS8jL2J1aWxkZXJzLzgxL2J1aWxkcy85NDQNCj4gPiAN
Cj4gDQo+IElzIHRoaXMgdGhlIGNvcnJlY3QgbGluaz8gVGhpcyBidWlsZCBoYXMgZmFpbGVkLg0K
DQpZZXMsIGNvcnJlY3QgbGluayBidXQgSSBzaG91bGQgaGF2ZSBhZGRlZCBtb3JlIGRldGFpbHMu
wqANCg0KSXQgdXNlcyBhIGN1c3RvbSBjb25maWd1cmF0aW9uIHRoYXQgYWxzbyBhdHRlbXB0cyB0
byBidWlsZCB3b3JsZCBmb3INCnFlbXVhcm02NC4gSSBoYWQgc2VlbiB0aGVzZSBmYWlsdXJlcyAt
IHRoZXkgYXJlIG5vdCByZWxhdGVkIHRvIHRoaXMgc2V0DQpvZiBwYXRjaGVzLCBzbyBJIGRpZG4n
dCB3YW50IHRvIGhvbGQgdGhlIHF1ZXVlIGFuZCB3YXMgcGxhbm5pbmcgdG8NCmFkZHJlc3MgdGhl
c2UgbGF0ZXIuDQoNCkJ1dCwgSSd2ZSBpbmNsdWRlZCB0aGUgZml4ZXMgZm9yIHRoZXNlIGZhaWx1
cmVzIGluIGN1cnJlbnQgYmF0Y2ggbm93Lg0KTGF0ZXN0IGJ1aWxkIHBhc3NlcyB3aXRoIHRoZSBw
YXRjaGVzIEkganVzdCBzZW50Lg0KDQpodHRwczovL2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5v
cmcvdmFsa3lyaWUvIy9idWlsZGVycy84MS9idWlsZHMvOTUxDQoNClRoYW5rcywNCg0KQW51ag0K


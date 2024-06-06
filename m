Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A975C25B76
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 00:24:17 +0000 (UTC)
Received: from esa10.fujitsucc.c3s2.iphmx.com (esa10.fujitsucc.c3s2.iphmx.com [68.232.159.247])
 by mx.groups.io with SMTP id smtpd.web11.2087.1717633455842558387
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Jun 2024 17:24:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=KaC7oyO0;
 spf=pass (domain: fujitsu.com, ip: 68.232.159.247, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1717633455; x=1749169455;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=F5W3+aQljyXDL55qCOIkJKs7jCPL+mGFALZqEROlHMk=;
  b=KaC7oyO0aOfPLyT6FlhaLrWNsq9vaRRm4wClsf+2LxBMPWePKu7bnPPG
   PU4ebew92Q4c8xDLh3OtJVotyJgrLQ0PnKNkhmdjea4A7ImdM9suatx30
   kg9kEIYHMPIqxvUr5b/SgiTuARoyQYkxuQ+GxFmIMBpeYJ2fUM8DQowim
   Rphj4HtH5Dx4Vk/6DWZppTvN4UJ80EKE99Pij4KJ5br94tMJVvSQR98YH
   SxLGAn/RB3dh+E7tIfAr2xWyQ4D3En8V7sujfMaqXbGslb5MHkyyUf4La
   MQSkaWr9eyA/gyqoxB+oxsm/AkpXPnRSBcwuEcxZXIkoIG5RgE9JIVMzc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="121610511"
X-IronPort-AV: E=Sophos;i="6.08,218,1712588400"; 
   d="scan'208";a="121610511"
Received: from mail-os0jpn01lp2107.outbound.protection.outlook.com (HELO JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.107])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 09:24:11 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KT4dFCSP13f4Q4+38KRyAb0jjqkPY5G0yh6CHpeWFZqv6OioWCGwRXt9ZJRwnkC9/gQJkffpA9tg18vaOGerm8PzbKcEDNCFuvgOky3BYmJLqy+hJ0e2buSmqs4IMCDTzRbOPIQw2cebhK3rdHNZl8ZUlGCB9LaRX+9WSZFopx7ETRDIE89xUT8rzG0fbYpzrLtKEv2+xApDvVGgXAOBpYQ/5wAXx/g0dCeO2v24u9dhI6XGCgv2fXxpCCCQRXQSeYgFFwtFvfErR5VMTc0MLAgtOyJCrkf2JCBh7sgTI8+wY4S1UAnlARWKEKnV5PA4m4mScaqya4mUQuAnyEi8GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F5W3+aQljyXDL55qCOIkJKs7jCPL+mGFALZqEROlHMk=;
 b=bygIHq6tWJ/3B0fVXp6JFUKqhPCTj5HXjuX8EBdqTpN4QlxkEDBKlcm8g46A81Jm9qYI3TERjmgfIK4dN7ZWhM0ZW4Br6SRtimQHrX1MoXHs1U6rdMehtRsvIzo6ZaAvyE0V8cHCx73x71WlTJ/SIMqv9Uu3VsWjzn3rN9bDtHW9cMPt94X2y9iVv8WycLnM0WThix9V9hAVPz8NCBFrW0tCX0i5lTtr0kimHvNnrfmwyyVMMQ4co3UA09SmPAhyJIFKmQf1puMZGRGrD0hjFXtAM4o6kpcLa/XGdfRcs1qWhOnmFwD5lDyPcDhaWcH5O6LE32fN8f3OgWO8pc1MOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TY3PR01MB11056.jpnprd01.prod.outlook.com
 (2603:1096:400:3b4::12) by TYCPR01MB7011.jpnprd01.prod.outlook.com
 (2603:1096:400:be::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.33; Thu, 6 Jun
 2024 00:24:09 +0000
Received: from TY3PR01MB11056.jpnprd01.prod.outlook.com
 ([fe80::c451:240d:2c34:96bc]) by TY3PR01MB11056.jpnprd01.prod.outlook.com
 ([fe80::c451:240d:2c34:96bc%6]) with mapi id 15.20.7633.021; Thu, 6 Jun 2024
 00:24:09 +0000
From: "Maohui Lei (Fujitsu)" <leimaohui@fujitsu.com>
To: Martin Jansa <martin.jansa@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [PATCH 1/2] cmpi-bindings: ignore incompatible-pointer-types
 errors for now.
Thread-Topic: [oe] [PATCH 1/2] cmpi-bindings: ignore
 incompatible-pointer-types errors for now.
Thread-Index: AQHatxM7Ycx4eKVc6Eadyx2KovdxsbG41MTggAANooCAAP6WgA==
Date: Thu, 6 Jun 2024 00:24:09 +0000
Message-ID: 
 <TY3PR01MB110568F2B86411D9B782926C7A0FA2@TY3PR01MB11056.jpnprd01.prod.outlook.com>
References: <17D60871905D8062.18873@lists.openembedded.org>
 <TY3PR01MB11056F365C91CEB2A21ECDC85A0F92@TY3PR01MB11056.jpnprd01.prod.outlook.com>
 <CA+chaQcF_iBmXThEFAV82tRHLW-qgVEUqMTV+4rbNGxMgV4ZCw@mail.gmail.com>
In-Reply-To: 
 <CA+chaQcF_iBmXThEFAV82tRHLW-qgVEUqMTV+4rbNGxMgV4ZCw@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9NDg5ZThjNGEtYThhNi00YjBhLWIwOTgtYmJlOWFkZWU0?=
 =?utf-8?B?YTYzO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFROKAiztNU0lQ?=
 =?utf-8?B?X0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9T?=
 =?utf-8?B?ZXREYXRlPTIwMjQtMDYtMDZUMDA6MjI6MDhaO01TSVBfTGFiZWxfYTcyOTVj?=
 =?utf-8?B?YzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX1NpdGVJZD1hMTlmMTIx?=
 =?utf-8?Q?d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11056:EE_|TYCPR01MB7011:EE_
x-ms-office365-filtering-correlation-id: ef2b1060-1130-4d76-e307-08dc85befbc1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230031|1800799015|376005|366007|38070700009|1580799018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?M3R1amFCM29GNEFMMUJCQUJIM2x4dmNKeWUzdC8wOXNKWStnYzNxTEtmZHNR?=
 =?utf-8?B?VFg2Tzl2eWYvVWk4aUhGZlJPeDdwNUFSV01JQ2FqTkJaK0UzSk41VS9yeWla?=
 =?utf-8?B?ZG9yV1d4b2FJUXhwWU9vQWhPUy9lbXkyUk80eHJBVThNZGMxNyszMHZmaXZW?=
 =?utf-8?B?c21XMlU2dU9FTERUa2hkN29HQ3N4Zi9mVTFnVUp0R1diRG5mYUdPdmZSNUVM?=
 =?utf-8?B?aWd5OHVNTXBXQ2RwMTJvbGJRQnkvS3I5M1BjdVRUYWxIeVE4WERWRDMyU2c2?=
 =?utf-8?B?M0N6WXBnTUpyclhzcHcwdFBRdzVZU3I5RGY4ejlXMGVQQytNb2FVd1MraXBL?=
 =?utf-8?B?Z1FVZWg4WldHaElFMEpYcStsSFIrNnB1b3lUMHNtZnFQTUxDZjVCWTYwdlBs?=
 =?utf-8?B?WmJJcnpOTUN4bmtNdUtLZ3hIVG5BUjRKcVJ1NVEwOTU5ZFFDZ09NRzVTbHp1?=
 =?utf-8?B?Q0hNbkhRcjlZUkh6L2g1cS9nVFhOVFlpaS91WTZGOEdMUGVFOUUvcWFvQkRw?=
 =?utf-8?B?MkFrSml6ZEtGa2VRcnV1Ujh6b1VCSWFJVUswWXM0Vm1FTHRmUzFXTi9EZXR6?=
 =?utf-8?B?bFZHWmR1QnZ2SEJjTGlUajI3UWljSnk3akc4V0dWWS9OVmdkanNDNlZoNys5?=
 =?utf-8?B?emc5eDFiNW54Z2FQaGRyam9XekFqU3FkdXhGOFhsOHAzWG5yeWo1bjFrVWE0?=
 =?utf-8?B?NUdmTDdYNjBzZ1VacGVVNWNPU0VGV1NjazA3V0xkeUMrWS9xU2o3MHJDY1FI?=
 =?utf-8?B?U2NXUS9sVEpzTU5hQURGNWVEWEtEUThsZlo3RFVRU0RVcnZuT1JLeUpvbXpt?=
 =?utf-8?B?SjlKRDNvUmJmQjRUYjRkN1JsMithYmNMc1hQQjg4NW9Ua0NUTWlvZUR4V3ZM?=
 =?utf-8?B?aEpBRjZGT1lWYlkzY3BYRnNzYXQycSsvU0VMd3doMnJoZlZlRHV6cW1hbCtJ?=
 =?utf-8?B?WEZSUnFkZVVpVWFtcE9VYzBaSkZ4YmVvWW1pV212ZFZWS3pJZ3ZtZ21UbkZk?=
 =?utf-8?B?VCt2NVA2ZlUyR0Y2QndHZ0FFV3c3bUJRSUdXSzlQMW93T3BMcHVBbUhzVTBY?=
 =?utf-8?B?MXI3NS9kNWx2dGxJTFl3K2JFemtZQ2FRVldFUE8wK0dxTHZBOTdhbWQwUmJu?=
 =?utf-8?B?TjV4VkhNeDg3ZDlTZjRPKysyZ2U1aThMQnkyMzFNbU1QNXhvcm5SY29VYU1k?=
 =?utf-8?B?c3gyTjhJTEFZREJmdUxCT1RrV3BkRSs3TzB1bENlZXR0R0xpRCtQZG9waGFj?=
 =?utf-8?B?YUQ3NlBPRDF5WFBtaGpyMDlZQlAwSjlkaGw3VmJnbDZCMnVOcXVPNmNLVmJz?=
 =?utf-8?B?R0liMkJ6dG1lUTBEOWsxQWg2OWlCZWFIR09hbU9iUmh6VkRPa25idkNmaXND?=
 =?utf-8?B?RmphWUVQS3JsOS8vc3d5blVjNytmREhDTlFFQjRycm9ya2YzYkZXSVlVUHJl?=
 =?utf-8?B?anBnNU9qTFZJM1pXNHB2N2JkdmJRZ09BczcwLzdLSHFsWk82Q3YrUnhkUkhJ?=
 =?utf-8?B?cjdVeFBjMkhicVptSXVlK3EwSGtIeXpLWDF0V0hjYnVMVUkyZytSZGpNU3RL?=
 =?utf-8?B?NkFiOXRjMS9wZjRqbldFc1k3WWk2bVVvVGJvVFdXYjhYeFIzbzNjNitEOGJM?=
 =?utf-8?B?R0xGaDBkbEFtcUQzTnp4SVZxMTUzV0dWQlY4QXQxY2lxRFlsN3ZlREdGRlhy?=
 =?utf-8?B?ZTgrT25LVmdjWTJ1UUwyRXBYbGxLNHVzOGNJS3VXS0gvQWU1SUxqVDh3Z0Fj?=
 =?utf-8?Q?rLvl/ynn7GCiGhrg7a1LZSdJgzbcP878aI0LeNk?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11056.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009)(1580799018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UmVtVFcxVU1pVTc0RW1iaXh4aFd5L00rSUtjWExtczc3bzBFMzJlRExpc3JD?=
 =?utf-8?B?TzRUb0tOdWZMZmcxVGszdXkwcTJpNUE2eDZ5RzMrYTRjMU5hTytZK1lKK3FJ?=
 =?utf-8?B?TzRDQ09IM0c3bWJISEZ5OWxONTVzcmhFVmNRNmd5Rm1YeVorSkxWN0x3Zk5U?=
 =?utf-8?B?ZDgxOHJkN3Z2ay8raVpaUTlOWG1LZG1kNG4rbzc5Q25zWXYwY0VCU0RMZ1Fr?=
 =?utf-8?B?QkR4alZ5eVVEUmE0VTJOVmRqeFJPdjlVUWVFZVg0Qm5QblJhbUhTNnNqSm5X?=
 =?utf-8?B?aUViRlhLaGYzUnE2QUZzZ09PRjNUUFE4S1NPRzNLUkpybWU0Q1ByOW9zcG9N?=
 =?utf-8?B?N1JGc00yaTJrcGV1aTJEcHh6c3RBVnpnajlXQmRpRXhQcGJ2WFMwWVAxM1dO?=
 =?utf-8?B?bEs1dlRmbm9IMWxrL3VtZzJWSHE5VnJtVHN0UnJTRDB4b3Z0YnI0b2hrSUtz?=
 =?utf-8?B?ejI5dEVET2x1K0d5c1VQL3ZNcjczOHRBN0t2RSsxN3laSHpDVG1ybkQwSU9P?=
 =?utf-8?B?dFQ5L2UrU0I5andsQW14UkhZa2hpRXlhOUF2ZjlpQkJDUWVtb24rWE11dzR0?=
 =?utf-8?B?bmFMSDZ6MHpGcHVsdHFZaFlFR1hBM1MvczNma3lPcHlGeC9YZWUrL1hxSmFF?=
 =?utf-8?B?aElZek5sdXhuUnZyWEtWL2ticDAxUXVqVWRBUWVYNWhDNllUdXMwdGRJS2dF?=
 =?utf-8?B?Q0NiQ3duakIrK1FxZU5VbXRQeXpjYnhZOGw3eFJJdWlwZmwrOHFRNWExN1Rw?=
 =?utf-8?B?bWg5WHN6TDMwL2Z3NmRnWFBNdlFTQjN2SERYZUdHU0Y0Y2FaTlZKVk1xNWJL?=
 =?utf-8?B?Vjk2U2JDcTJKemlEMU85N0lIRzEzNko0aG5SQnNiSXh2OHlRWDByb1ZuS2dR?=
 =?utf-8?B?eTBQR1gwWXhGMGlDcDgzOXhNNS9lc1hRYm5CMXlCS0p2RWlMNFM3dWtGYVFn?=
 =?utf-8?B?K2hJS25lYVBxeHFxYjBWU244RlE5d20rVDZLL0RScllSNlNKTGUvUUJkSEJK?=
 =?utf-8?B?YmRnOFFLV1dhR1dIMkpvc3pGL05CYVJQTWhjTHBrcDVFVlNQdkZjYmt5cXdL?=
 =?utf-8?B?VHFsQ3M4REwxbkZzanRKSi9vb0VyUHJBS1U1VlpzeUxRbEp4VkQraHQ5a00r?=
 =?utf-8?B?QnN4SmRCTzVXMUtlL0krR3NJeTc1ZnRVanVGK1NrR0d6eGtHTVR5bk5WUHFk?=
 =?utf-8?B?RXBQK0llMUNhMGNBZHljNE5rK0p3a2I1VStsaVdEb2tXdmtQQlM5S0xxaVhj?=
 =?utf-8?B?VjhnWTZ3OXJWblVJZjNuK0pGNUxrVmU3N2tiWDVna3Z6M2VVYTNmaHBlUUpu?=
 =?utf-8?B?TG9rRS9FY21MRHhmYWYxUVV1ckdyb2hESFkxKzR3S1ZHOTdiV1dDRlU0ckdS?=
 =?utf-8?B?VXUrQTcxbW01M3RUc2dKL2lWM2dsUDhubm1hSFM3MFBrRVh2dmt1dU1yZjRK?=
 =?utf-8?B?SXhOUkY3TU9veHpxRGp4OGtWY0xzS0cwQTdzR00zcGc3YUZVNDRaZU9YNFds?=
 =?utf-8?B?dGx2MVA0SHRaTjdXYWtkb1BSbVljZHJBY3U0YUNGMUZhdFJqVjEyOWYybEJv?=
 =?utf-8?B?b09UaW51ZndXRUZ2Z2VPSXBUaDFxLzRoVFlGYSs1M0VPUTRiWUdvbGNLd0U2?=
 =?utf-8?B?OGRZb2UyZEpoU09MdGxtZUloSnd1TXVGN1Z6R09MU3RNZTdObkJRQTdwYW1t?=
 =?utf-8?B?c1B3K0tDSmlnenNpSzdBRW54WVVQSmpKcFVzVWJKclBxTjNIVVFBMXZIR0hP?=
 =?utf-8?B?K0t2MTdFM2o0QWFLTER4U2o5cUs5Zmg4Nnpwem5XK2dnQzdZSm9MQzJDMk1v?=
 =?utf-8?B?bkhTdTVwVzE4a043eU8xRWxuV1c5WVVGNHArYUM3dkorc0N5VUFLZ0xNWnI1?=
 =?utf-8?B?SUdBQ1RwRGNxakJOT2xrYnJhNnlaYjMvWkNwbzdCVW1kUEhXS2hUeitjaUdt?=
 =?utf-8?B?S2NQM09LTWxmNDZmS0JOR21VVkI2ZUxGZ0dDZGR2UXBiQ2FDMk5qZnlIdHNO?=
 =?utf-8?B?UEwybVN2SE5sUVpqckNDb3R1TmIvdndlL0NqQStFV3Fib245b3NwdFRieWFF?=
 =?utf-8?B?Q0wvRmRrcm5tMUlOUFYyTzNhcTk1Vm8rWVJVK3dKcm0xaWJycmRIZHd3c25W?=
 =?utf-8?Q?BX0gIXxOR6yv1aiiRGdTuTnyU?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	2eZMXY7m0JtlV/eeJ880wXTQQwdLuID9uYeFvJ3N40hz819vPZfHUyOZ46y3tLtReS7QZYlT3XmFrIoyV1zj4Ik3d/yESaXP4ORT3qHL14NCDWliuLfkRhfFQTXbUvrCMO4liWuNofpx9n43DtsrMvPpM2rNQZ9kMo8JcP4kEficr8ecnZUfDr1t66akn5veHlkZfX/vJTQk7666oV7GrEfc8k72TdIN/S7DWnPLzTFj1Q4JU328hbceEXv1xMgKTsrHmU9CPc+hi/MTBwZ4Mf5E7ZC5+uB7DzeSrk6XZaTj8QJE7yrntoo19eh7LclCAl/BAMlsQf5YyCWof68h+CREeRT2H2QzW7Q+/yN1DxlK9ODjxqwE/MS+ThmMUsqeFchW//pVoFeaWjITkWsg30gWxyVyyVQCGqFB6ghgnxY3K+0jKr0AzyF+lrtDXYTuyyN1BVX+6Ik24WcYe2BbYMay3RDfxHSW1g9Y65d5zw1pe+0lfq0KW8FjPY2B1xp+PzcvJYtfEDNbFU8j6A+tLcZOcOYf7dBtJlQnYQlpOP/xtB8LlsMS8615GtcHrVg+VKKAHYapU4tNYVQPJkR7CNI3EobpZwIaV1vDQIK8gsP4ElTziTjR90vB4mPAJpGL
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11056.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef2b1060-1130-4d76-e307-08dc85befbc1
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2024 00:24:09.3245
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xdsHdzuH9siTvu0r2ksJ5qNzJpVHBtIT36Z5I/wz3g+elNZclf9KGE8fLHWdhzfxVJhsKdZhmTBc6z+cUT09DQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7011
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Jun 2024 00:24:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110706

VGhhbmsgeW91IHZlcnkgbXVjaCwgSSBnb3QgaXQuIEknbGwgZ2V0IG1ldGhvZHMgZnJvbSB1cHN0
cmVhbSBpbnN0ZWFkIG9mIGlnbm9yZSB0aGUgZXJyb3IuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4gRnJvbTogTWFydGluIEphbnNhIDxtYXJ0aW4uamFuc2FAZ21haWwuY29tPg0K
PiBTZW50OiBXZWRuZXNkYXksIEp1bmUgNSwgMjAyNCA1OjExIFBNDQo+IFRvOiBMZWksIE1hb2h1
aSA8bGVpbWFvaHVpQGZ1aml0c3UuY29tPg0KPiBDYzogb3BlbmVtYmVkZGVkLWRldmVsQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtvZV0gW1BBVENIIDEvMl0gY21waS1i
aW5kaW5nczogaWdub3JlDQo+IGluY29tcGF0aWJsZS1wb2ludGVyLXR5cGVzIGVycm9ycyBmb3Ig
bm93Lg0KPiANCj4gVGhlcmUgaXMgYWxyZWFkeSBwYXRjaCBjb3ZlcmluZyBhbGwgc3VjaCBjYXNl
cyBkZXRlY3RlZCBpbiBteSB3b3JsZCBidWlsZHMsDQo+IHNlZSAicGlkZ2luIHBpZGdpbi1zaXBl
IHBpZGdpbiB1dy1pbWFwIHJyZHRvb2wgY21waS1iaW5kaW5ncw0KPiBsaWJkYmQtbXlzcWwtcGVy
bCBkYXEiIGFuZA0KPiAiY2F0Y2gyIG9wZW5sZGFwIG1pY3Jvc29mdC1nc2wgc2NzaXJhc3Rvb2xz
IHBhbS1zc2gtYWdlbnQtYXV0aCBzYmxpbS1zZmNiDQo+IGNrZXIuLiINCj4gY29tbWl0cyBpbjoN
Cj4gaHR0cHM6Ly9naXQub3BlbmVtYmVkZGVkLm9yZy9tZXRhLW9wZW5lbWJlZGRlZC9sb2cvP2g9
bWFzdGVyLW5leHQNCj4gDQo+IFRoZXkgd2VyZW4ndCBtZXJnZWQgYmVjYXVzZSBJIHRoaW5rIGto
ZW0gd2FudHMgdG8gbW90aXZhdGUgcGVvcGxlIHRvIGZpeA0KPiB0aGVzZSBpc3N1ZXMgaW5zdGVh
ZCBvZiBqdXN0IGlnbm9yaW5nIHRoZW0gYW5kIHRoZXNlIDIgYXJlIGp1c3QgdG8ga2VlcCB3b3Js
ZA0KPiBidWlsZHMgY2xlYW5lciB3aGlsZSBpbmNyZW1lbnRhbGx5IHdvcmtpbmcgb24gZGV0ZWN0
ZWQgaXNzdWVzLg0KPiANCj4gUGxlYXNlIGNoZWNrIGlmIHVwc3RyZWFtIGFscmVhZHkgaGFzIGEg
Zml4IGluIG5ld2VyIHZlcnNpb24gYW5kIGJhY2twb3J0IHRoYXQNCj4gb3Igc3VibWl0IGZpeCB0
byB1cHN0cmVhbSBhbmQgYWRkIGl0IHRvIG1ldGEtb2UuDQo+IA0KPiBNYWpvciBkaXN0cmlidXRp
b25zIGFyZSBub3cgc3dpdGNoaW5nIHRvIGdjYy0xNCBhcyB3ZWxsIHNvIGl0IGlzIGdldHRpbmcg
ZWFzaWVyDQo+IHRvIGZpbmQgYWxyZWFkeSBjcmVhdGVkIHBhdGNoZXMgaW4gdXBzdHJlYW0gb3Ig
ZGlzdHJvcywgZS5nLiBnZW50b28gdHJhY2tlcjoNCj4gaHR0cHM6Ly9idWdzLmdlbnRvby5vcmcv
c2hvd2RlcGVuZGVuY3l0cmVlLmNnaT9pZD04NzA0MTINCj4gDQo+IE9uIFdlZCwgSnVuIDUsIDIw
MjQgYXQgMTA6MjfigK9BTSBsZWltYW9odWkgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4g
PGxlaW1hb2h1aT1mdWppdHN1LmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4g
Pg0KPiA+IEhpDQo+ID4NCj4gPiBJdCBzZWVtcyB0aGVyZSBhcmUgbWFueSByZWNpcGVzIGhhdmUg
dGhlIHNhbWUgaXNzdWUuIEkgZm91bmQgdGhlcmUgYXJlIHR3bw0KPiBtZXRob2RzIHRoYXQgZml4
IHRoaXMgaXNzdWUgZnJvbSBnaXQgbG9nIG9mIHBva3kuDQo+ID4gT25lIGlzIGlnbm9yZSBpbmNv
bXBhdGlibGUtcG9pbnRlci10eXBlcywgdGhlIG90aGVyIGlzIHN1Ym1pdHRpbmcgYSBwYXRjaCBv
Zg0KPiBzb3VyY2UgY29kZS4NCj4gPiBJJ20gbm90IHN1cmUgd2hpY2ggbWV0aG9kIGlzIG1vcmUg
cG9wdWxhci4uLg0KPiA+DQo+ID4NCj4gPiBCZXN0IHJlZ2FyZHMNCj4gPiBMZWkNCj4gPg0KPiA+
DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogb3BlbmVtYmVk
ZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiA+IDxvcGVuZW1iZWRkZWQtZGV2
ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIGxlaW1hb2h1aQ0KPiA+ID4g
dmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiA+IFNlbnQ6IFdlZG5lc2RheSwgSnVuZSA1
LCAyMDI0IDI6NDAgUE0NCj4gPiA+IFRvOiBvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZw0KPiA+ID4gQ2M6IExlaSwgTWFvaHVpIDxsZWltYW9odWlAZnVqaXRzdS5jb20+
DQo+ID4gPiBTdWJqZWN0OiBbb2VdIFtQQVRDSCAxLzJdIGNtcGktYmluZGluZ3M6IGlnbm9yZQ0K
PiA+ID4gaW5jb21wYXRpYmxlLXBvaW50ZXItdHlwZXMgZXJyb3JzIGZvciBub3cuDQo+ID4gPg0K
PiA+ID4gRnJvbTogTGVpIE1hb2h1aSA8bGVpbWFvaHVpQGZ1aml0c3UuY29tPg0KPiA+ID4NCj4g
PiA+IEdDQyAxNCBpbXBsaWNpdGx5IHR1cm5zIGEgd2FybmluZyBpbnRvIGEgY29tcGlsZXIgZXJy
b3I6DQo+ID4gPg0KPiA+ID4gfA0KPiA+ID4gL2J1aWxkLXViaW51eC1kYWlseS90bXAvd29yay9h
YXJjaDY0LXViaW51eC1saW51eC9jbXBpLWJpbmRpbmdzLzEuMC4NCj4gPiA+IDQvZ2l0Lw0KPiA+
ID4gc3dpZy9weXRob24vLi4vLi4vc3JjL3RhcmdldF9weXRob24uYzoxNjg6MjE6IGVycm9yOiBw
YXNzaW5nDQo+ID4gPiBhcmd1bWVudCAxIG9mICdQeV9TZXRQcm9ncmFtTmFtZScgZnJvbSBpbmNv
bXBhdGlibGUgcG9pbnRlciB0eXBlDQo+ID4gPiBbLVdpbmNvbXBhdGlibGUtcG9pbnRlci10eXBl
c10NCj4gPiA+IHwgICAxNjggfCAgIFB5X1NldFByb2dyYW1OYW1lKCJjbXBpX3N3aWciKTsNCj4g
PiA+IHwgICAgICAgfCAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+DQo+ID4gPiB8ICAg
ICAgIHwgICAgICAgICAgICAgICAgICAgICB8DQo+ID4gPiB8ICAgICAgIHwgICAgICAgICAgICAg
ICAgICAgICBjaGFyICoNCj4gPiA+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBMZWkgTWFvaHVpIDxs
ZWltYW9odWlAZnVqaXRzdS5jb20+DQo+ID4gPiAtLS0NCj4gPiA+ICBtZXRhLW9lL3JlY2lwZXMt
ZXh0ZW5kZWQvY21waS1iaW5kaW5ncy9jbXBpLWJpbmRpbmdzXzEuMC40LmJiIHwgMg0KPiA+ID4g
Ky0NCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkN
Cj4gPiA+DQo+ID4gPiBkaWZmIC0tZ2l0DQo+ID4gPiBhL21ldGEtb2UvcmVjaXBlcy1leHRlbmRl
ZC9jbXBpLWJpbmRpbmdzL2NtcGktYmluZGluZ3NfMS4wLjQuYmINCj4gPiA+IGIvbWV0YS1vZS9y
ZWNpcGVzLWV4dGVuZGVkL2NtcGktYmluZGluZ3MvY21waS1iaW5kaW5nc18xLjAuNC5iYg0KPiA+
ID4gaW5kZXggNzgxZGM4M2RhOS4uZDA2MmU0NmJiOSAxMDA2NDQNCj4gPiA+IC0tLSBhL21ldGEt
b2UvcmVjaXBlcy1leHRlbmRlZC9jbXBpLWJpbmRpbmdzL2NtcGktYmluZGluZ3NfMS4wLjQuYmIN
Cj4gPiA+ICsrKyBiL21ldGEtb2UvcmVjaXBlcy1leHRlbmRlZC9jbXBpLWJpbmRpbmdzL2NtcGkt
YmluZGluZ3NfMS4wLjQuYmINCj4gPiA+IEBAIC0yNyw3ICsyNyw3IEBAIEVYVFJBX09FQ01BS0Ug
PSAiLURMSUI9JyR7YmFzZWxpYn0nIFwgICMgV2l0aA0KPiA+ID4gTmluamEgaXQgZmFpbHMgd2l0
aDoNCj4gPiA+ICAjIG5pbmphOiBlcnJvcjogYnVpbGQubmluamE6MjgyOiBiYWQgJC1lc2NhcGUg
KGxpdGVyYWwgJCBtdXN0IGJlDQo+ID4gPiB3cml0dGVuIGFzICQkKSBPRUNNQUtFX0dFTkVSQVRP
UiA9ICJVbml4IE1ha2VmaWxlcyINCj4gPiA+IC0NCj4gPiA+ICtDRkxBR1MgKz0gIi1Xbm8tZXJy
b3I9aW5jb21wYXRpYmxlLXBvaW50ZXItdHlwZXMiDQo+ID4gPiAgRklMRVM6JHtQTn0gPSsiJHts
aWJkaXJ9L2NtcGkvbGlicHkzQ21waVByb3ZpZGVyLnNvDQo+ID4gPiAke1BZVEhPTl9TSVRFUEFD
S0FHRVNfRElSfS8qIg0KPiA+ID4gIEZJTEVTOiR7UE59LWRiZyA9KyAiJHtsaWJkaXJ9L2NtcGkv
LmRlYnVnL2xpYnB5Q21waVByb3ZpZGVyLnNvIg0KPiA+ID4NCj4gPiA+IC0tDQo+ID4gPiAyLjM0
LjENCj4gPg0KPiA+DQo+ID4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gPiBMaW5rczogWW91
IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gPiBWaWV3L1JlcGx5
IE9ubGluZSAoIzExMDcwMSk6DQo+ID4gaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cv
b3BlbmVtYmVkZGVkLWRldmVsL21lc3NhZ2UvMTEwNzAxDQo+ID4gTXV0ZSBUaGlzIFRvcGljOiBo
dHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQvMTA2NDk4NTkxLzM2MTcxNTYNCj4gPiBH
cm91cCBPd25lcjogb3BlbmVtYmVkZGVkLWRldmVsK293bmVyQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcNCj4gPiBVbnN1YnNjcmliZToNCj4gaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cv
b3BlbmVtYmVkZGVkLWRldmVsL3Vuc3ViDQo+ID4gW21hcnRpbi5qYW5zYUBnbWFpbC5jb21dDQo+
ID4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gPg0K


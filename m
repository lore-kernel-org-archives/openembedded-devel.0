Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2006C83F25
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 03:23:20 +0000 (UTC)
Received: from esa8.fujitsucc.c3s2.iphmx.com (esa8.fujitsucc.c3s2.iphmx.com [68.232.159.88])
 by mx.groups.io with SMTP id smtpd.web10.4368.1753154591187059827
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Jul 2025 20:23:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=geIJ6HEL;
 spf=neutral (domain: fujitsu.com, ip: 68.232.159.88, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1753154591; x=1784690591;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=lFO0hq6j+7Na4pK3jpXv9sg3O+MUwAx+1rUqQdZgfj8=;
  b=geIJ6HEL0m5s+7CHzW0k7zlH45XjxdXNW+RZxXzU90B4kfM8xHnqhix3
   /FWzvzxMYCmzSR9F3/4AdToS0V50i7o91X/0+TGtc52HIfCnHBKkU9bSi
   BeLBxHFchkV7OKooVwISryZhXAjdytpopAC/P5ANMQJYouk7JfHt/lVTK
   POXB8V584qcn0S5g53XZH27vUWEF2WVzDhJPahfsnZRLymeR5NkiHnu83
   NTO9WQSDEmtCzyL/Ew1wrdNv9NN4uuoDHvdLy4QJBsrZi14PzG7oZd12I
   ecRt9L+3vLhLQPw/7Tg4+iyMVx3DegtqxNRm1e1Hw4ZaWuOMivmTvUyDq
   w==;
X-CSE-ConnectionGUID: PioQzcrUQj6b4zQYUUmANQ==
X-CSE-MsgGUID: j9hNgRM0RHK9QHL8FEhh1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="162184170"
X-IronPort-AV: E=Sophos;i="6.16,330,1744038000"; 
   d="scan'208";a="162184170"
Received: from mail-japanwestazon11010035.outbound.protection.outlook.com (HELO OS0P286CU011.outbound.protection.outlook.com) ([52.101.228.35])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 12:23:08 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DMG7Y5tPBzH0lLClu3kTLbJbI8kz2zpIQihT2aQB3XiSy7uIYDPEizJ4MfOkVSZ8kKn8ELlouVu9UVy75b/D62D/nYM0+b72w6lGlxXRvkr6FRP1sN8p2suwdb0IZROfDSa0ZsufCCINuc000LhBp9O4M48Uyw6AcMpPu7rFBM90Mf37IqqcZfoibQpiCNxL41t0A1vwIYXCxgri1eHCPbF/IIAiCxum7EhFqPUiz0YmRu/qJbdQc07YhVYDrnUCg23fYG1MOtsDyURIbtZ0nscLzczwJ6ozp2Tox+bvzeUTevJv6AZ9j3JrZdf66a59TDm71nSU4tiF6KaT94zqug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lFO0hq6j+7Na4pK3jpXv9sg3O+MUwAx+1rUqQdZgfj8=;
 b=kfX/msXUXYbMtLoNrHqS1MbzydDhmGBpUjlO4EC16hmrYxBvftlC9Mlc34qL4U44KRCLEe1Pj2Sh7cccm77h2R5ueZweG+bII4jk5J2GqFu9NXpUPxxZJwDeYpA+aH7Ku8YCvNsjJtSttA0Fln1QipAW2jbGidvnxCQHet5rNKny/B9fyLmJAHDqAQ14CD4YLG1dDIEjnGwCOOWNIl3Zg9EpCMVU3WxHY/LAK5O9VEHDLliH6SB5dnyzpkpHGqIhezaDesEvYZapI+d/ibXL10NkEgCAnnUkXoOwp97pdA9PkLz+szMnm+es0gzhCHdnYJnqgVHgUQ/9mgyyYYDLrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OSRPR01MB11597.jpnprd01.prod.outlook.com
 (2603:1096:604:22f::12) by TYYPR01MB12639.jpnprd01.prod.outlook.com
 (2603:1096:405:157::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 03:23:05 +0000
Received: from OSRPR01MB11597.jpnprd01.prod.outlook.com
 ([fe80::cb27:d71e:9f8a:8014]) by OSRPR01MB11597.jpnprd01.prod.outlook.com
 ([fe80::cb27:d71e:9f8a:8014%6]) with mapi id 15.20.8943.029; Tue, 22 Jul 2025
 03:23:05 +0000
From: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: 
 =?gb2312?B?u9i4tDogW21ldGEtcHl0aG9uXSBbUEFUQ0ggMDcvMjFdIHB5dGhvbjMtZ2V2?=
 =?gb2312?Q?ent:_upgrade_25.4.2_->_25.5.1?=
Thread-Topic: [meta-python] [PATCH 07/21] python3-gevent: upgrade 25.4.2 ->
 25.5.1
Thread-Index: AQHb+raNJlRJQR2PCkCKoxObqF4KtLQ9edLg
Date: Tue, 22 Jul 2025 03:23:05 +0000
Message-ID: 
 <OSRPR01MB1159762281986E17AA0766E679B5CA@OSRPR01MB11597.jpnprd01.prod.outlook.com>
References: <20250722031245.884-1-liuyd.fnst@fujitsu.com>
 <20250722031245.884-7-liuyd.fnst@fujitsu.com>
In-Reply-To: <20250722031245.884-7-liuyd.fnst@fujitsu.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ActionId=b501bfaf-162e-44af-a284-4e05a3d5c0e3;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=0;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=true;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED?;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2025-07-22T03:20:50Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSRPR01MB11597:EE_|TYYPR01MB12639:EE_
x-ms-office365-filtering-correlation-id: 1129cbc1-330d-40e3-6813-08ddc8cf12db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|1580799027|38070700018;
x-microsoft-antispam-message-info: 
 =?gb2312?B?aXVTaXJndkV5L1BWazlUOWpldDlKUGl6MUZRSTZnTm9lM0lPTmVDaWRSSUlW?=
 =?gb2312?B?M0Vwc2dETlF5ZUlFeUZ1WmlwQWZFVStpalAzWlF1UW5DRU9hYk5UUXB5YTAv?=
 =?gb2312?B?M3pzeStWLzEwSVdvNTExMEUxdkJLVGw5T0tDaC9TQUhTMGNtQ2tGYkVSaGpD?=
 =?gb2312?B?Z3JacGszdzNHOUNVbFZrZ0Yrb3pKN1hUZG5CejBwbW01S1I0VkpSY0xMVHJ5?=
 =?gb2312?B?bFk2YXhPY2hnblNnNWQ4Y0I1YWJpYktHbkJ3eHJJdTBWSW16cmhVeEVpM1Ey?=
 =?gb2312?B?c2NFM1hwM0lIZGdhaEJLNmJabHhnME80RTl5QTZaUm0yODFiUXlrcmZKVG9V?=
 =?gb2312?B?d1owa0dIVjFwVnBPbVRKdUhGY1VKMG83RVB0aWo4QkwxbjdLTDBQRGVsV0I3?=
 =?gb2312?B?cWpJOUdOc3RBZUQ3TlpaWlZoTXlXa1RXak1JMTJTVitUUU1POFFlRDZnZFR0?=
 =?gb2312?B?ZlNXM2NraUxyK01OVFJrSkJDYVJ3OFgvUnRUWTVDMU9IRElkOW1WL3U4YW9h?=
 =?gb2312?B?OWFRaXVwVWNvdHZFeW9XYnFudFoxWjU3a3pkb3J4UFhrRFFRbnpXZWZSWCtB?=
 =?gb2312?B?Nlk0c3NxcFpjbmN6MDNwdWF6bWhLKy9MQ29UUXplZ1gySnBUdjhoMjdFZDVM?=
 =?gb2312?B?MlNpaDRjSjlMQ0dSeC9IWWdEdEN2YkJNVnpjSlduUjdJK244Y2tCMGpCWTQ4?=
 =?gb2312?B?QkRFT2RwT1RkSVFEaSt2Y1hjRXhocjF1N3A3ckdiUm1IK1JTb0IwNGNMd0J1?=
 =?gb2312?B?cyt0MnNsOWJiclhIRlc0SytBOW5oUjFoUjN1cTZDRldRUitralZKbWxTeDZ4?=
 =?gb2312?B?MGViTmxXUDhCTEhsMGhvS3VzRWpsaXZwZVo3UlJZOHFGbll1ZTZjVExKOGEv?=
 =?gb2312?B?bjZPZ1RLNzVIL0w2YXR6cUNIbk1mMVFWc3dQQWtiei9OOUVOUFdzTmhJNDFR?=
 =?gb2312?B?dURQUzl6RzhzNGV6UVZmRGZqbE5ISzJUZ3JKTTU4R2JTb0Q5VlFCZVd5SHl0?=
 =?gb2312?B?SCtNZy81ZTJzejVlRGdIdUt0d0t0M3BZUFpqMGw5MTM3Y3V5clJpTER2eThG?=
 =?gb2312?B?QUk5YVBOWXZQVG1oYUl1OEMvdHoya2NuVzVPSGpPcGhOR1hodVRmYjZRSzlZ?=
 =?gb2312?B?YklLZGlmQWlGdVA5c1hDZDA4a1BSSGxvMEUyOTMrSlU1WXIvRUxWb3ZwQ1hV?=
 =?gb2312?B?bGRianI3cGkwMThnVS9CYmY1cW01Um03UVZZOFhwWFM5QjhzZy9SZXg2ZXVQ?=
 =?gb2312?B?eUc1ZWdLUDVoK2dNV1YwMDY5am9ubVB4UUlXdXQ5SXdwb3lOYWVEaHpuLzBO?=
 =?gb2312?B?eDE2UHA4Z1NTc08rVkhIQUh1MVhMNnEwcnVvUzI5MHBiYU03K3Q5QkJFUkdn?=
 =?gb2312?B?Z2RoaFZIQmRSZjYvNGs4UG9NbWhSckFHWi9kbmhJaFN6MVFha0dyMGM0RmhS?=
 =?gb2312?B?bXJEMTl0YjRRS1BRZ1FzL0w5b2tiZlZySGlDV3UwNzBGUkFkTzNUZEtrOG13?=
 =?gb2312?B?WHRDRkkwQ09RV2F2eGg2MnpZQ3Rja08yaWxKbjZUSjhkdlhvUXg0U2xsdnZJ?=
 =?gb2312?B?OVR1WUQ1WnczTHpYUDFRazZWMGJwbXExWmlnVDVpSk4zSUlsVFI2Mlhyakcw?=
 =?gb2312?B?NlNLb2tNUmhpMDJ2cy90QTZYb21wTFRjOEFNdUxZSDkvenB1S3BidzQ1OS9n?=
 =?gb2312?B?MHZGOWpLYVJlVytYVnBqMnpzWmZhVmRjRWlGMks5RkNzNnJlcGFoWmlpTG5s?=
 =?gb2312?B?ekNndWY2enNoQVUvTGRLdVROZkxhY2YxYUNvL2NXRWNCUm1yNXFPUitVSHEv?=
 =?gb2312?B?U0dsU2RKQlVJZXlhaERzSmd4YnRoNCt6akJiTlI5OFo2YWFHU0VEaFpGak1H?=
 =?gb2312?B?UXRsQkZnbSsrQzE1SjhXTXZ6MU5FL1FqOXdvVm8wbmRYTXVTQWFaYjFGamZk?=
 =?gb2312?B?SStWNk1ySDVHODIyVVk5ZnFUTWF6SmI2d054amZEKzEzZXdHeUdZNnZmdmRC?=
 =?gb2312?B?dW5hNlZ1R2tNWGRLZ1ZtR3IzODMyajBvK0pDTjRFQXFpM0pYRFB0aVpSaFFx?=
 =?gb2312?Q?g7oQy8?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11597.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(1580799027)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?bXFPb1cvYXNreGh0TW4xSFoxY05ENnBJR0J1Z3RHYUtOU3ZwaWZYSXpmK1Ar?=
 =?gb2312?B?d0s4RnRFMHg2c1pkckhuUVZ6L2lCejN0SEJUTndGbVdhYWoxMmpvRGxzUUR5?=
 =?gb2312?B?OTVRejVxeWFUbG9BYkw3ZHg0WGFPbTVENFFxckd2TWxscHR0dEtLZHcrWmJG?=
 =?gb2312?B?djA2Sk9hNGNPaXRodDNqWlZsTmhyc09FSkIvRDZUZHJwK2VsOWs3UXZBaUNH?=
 =?gb2312?B?SFRUM1pMamtvbXJUZnNvQVM4alViKzUwM3ZTZ1piVGIyUzRJUExvYVA4cHFq?=
 =?gb2312?B?Y1J2Qm96OE1OaVhTemR6SUhoZVJ0TnAxQ2hWVWdTWUdDYWYzK1dwOVQvRStK?=
 =?gb2312?B?V1VOWk5aSkhzc2hCQ0dBUHhSZUhxbWZBR3NCTVhZNVg1bjJxaGVWVTdSMVBl?=
 =?gb2312?B?d2NzL1MrazRldlNydjJ2NXYyYVZaUXlFS1gzL3BPNmdZT08vcXp4QVEwaG5s?=
 =?gb2312?B?bkRSbDY2T0pZeHdndGQ5ZXhPaWJDV3IwYnJUY28rdVA2aktyOE1hSGFlOSt4?=
 =?gb2312?B?K1VRSHUxeXcvTVp0Wk1oQnhqVFRlVFR0ZVYxOWpQcnVWTldvWkswb2dENmts?=
 =?gb2312?B?dm9CRjh0MW5rUkRxckFYdkhsQTBpaVVLRy9vSVZZVmY4V0k5cjdVTXRxMDd5?=
 =?gb2312?B?Q0k2akZ6ajUrNDNUS3VXdWFrOUZ4alQ2VWVQczBFVWY3d3Fmdm9TMllUMytq?=
 =?gb2312?B?WXM2aEN5Wk9IUXR4Y2hpQmkvcHVNdFFJVUhkUWxvRmRRaDhzckQ4a2hGUDNH?=
 =?gb2312?B?UUc5NXp4RE5XSWVRZkFsQ05kNnRISkIxV0ZIL3VKaVd6VU5FcVRFbUJ3VC8x?=
 =?gb2312?B?ZFNyaW4yc1NtenZiSmt4c2JMWCt2Y2grSllYZ2c0ZVJYQ2pGVS9xZjVyeHFL?=
 =?gb2312?B?YThpbDRVRloxZndZY3dOQzNicUFxNmxZOVZxL052MXJrWnpodVBVZytYSXZ2?=
 =?gb2312?B?WDZxdEpPY0RnREVoZXRkZllGcklkTmxXZkFmaExhR0NwQlllVm04WE5aSDl2?=
 =?gb2312?B?MERuNGtWc2NtMjBxb01USEZFVi9NUml2K2xGRFM2WGU2WGtNYU5XTFQ0K05z?=
 =?gb2312?B?RFBXQ29sNjJ3NlBNMTBKU0VMWUxwWWc1dWtHK2ZCeTdNWjQwbTFWajBNNjM2?=
 =?gb2312?B?T2hERVA5WE1XNGJLV1c1RWJqRFlHRHlyODM5Q3kxRE9EUlVTSVg4M01tdEdB?=
 =?gb2312?B?WHdzVzVQRkFEM2dKNDlmcVk4Tk16K2xZaWxib3hmVEN2RFoyMmF0RFNFN2hT?=
 =?gb2312?B?NFZyTDBvTTU0dUtUWEg0cmZZK0NqbzNla213UWozL0xOZ2hHTi9Mb1N0bnhB?=
 =?gb2312?B?eithbXdFRjZWUkp3a0p2alhINGNRWUZJTExwa0VMVWZGOFdvcmlRWUE2RkNt?=
 =?gb2312?B?a29zeGIxMU42bEFnK2tLT3I2MEdjNlQrM2F0V3Q4TGhaVkNnaDJCTGNFRFh0?=
 =?gb2312?B?bjFTMGxJTlNEQkpSWC9qVk5Qcys5bTlkcTk1S3VBVDFKVStZZTNMOEs5QmxD?=
 =?gb2312?B?d2xFMllOZ1NWSjZCQW8vY05wKy92SEdvSkRBeHVSRGpqRHBpa2xqK3JmUVdo?=
 =?gb2312?B?ckN2MTcvK2ZxUnBOOXBwa21JdENwNDVuQUVxbW1jZEFETTNQaVNib0YvaVFJ?=
 =?gb2312?B?Y1VUNTFOcnBncXFvR00xL2ROZnBSNWFXVEs0S2lwMDJ4T0FWRFd3K3pRMCt0?=
 =?gb2312?B?QlYyZ2FIdTVmN21qeVIxNDlpZi9VMlR6TGFVcDg4K2ZIdUg1aWxQOHRWQkY4?=
 =?gb2312?B?S3I3TDJ5eVVvRW81NmdJcjhlSWtrdkNYL1dNT1QyeDBlUW9DNHZnbkJnOGxE?=
 =?gb2312?B?WHFVQ1J5b0ZHNkM0ZzhBNU9vMkszQlkxcVpIcTgrM3FxMGp3T3lzRlQrOTVz?=
 =?gb2312?B?cDNKc1N0SXZ5b3lRakhTZ1BrSUR5NkJhUE14Zzg5L0pWaFBwR29aWlhvaWhI?=
 =?gb2312?B?ZVlaKzNhT3E4U3ltZFg3QUM5RkJQb2RxZXkrZjlsaVhodGQvVjdnMHlpTzNE?=
 =?gb2312?B?UWkrSzlMQUlzTmM2R2Fac2RjdDJZZzhyUjlqd041WnM2T3BXaXhBUGZyRUx2?=
 =?gb2312?B?UjZjRFQ2ZDdyNVZOeXNmV1AwczNKa0NSTFAyZXlkMUQrTkJJbnlhUWdPb0cy?=
 =?gb2312?Q?KH/0RQ/IFHJH3vmAyHEIT4H3n?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	8JmmaaZcZchlkdECBFGVXHf7YCC51EHdZya6KGdbIINgkNv/kgDGQgvBQm6+tD/b+C2xRUkqSlJVBSOC1q+/EKMvbCRih3/b54qXRMA+u+RR2KnGaNAx15OLgHrW4ZTw+tjsi4BPWluYwHLWyBD/2/DGfWqq3MVH/B4lUaE2ByDdvUknsZ/hSF/sra3qYD3ehihvE6s9PBHw3Ilm6YCvxUwI9GQKHRJ7cLHoGJ4kt/SvQW9b36HiCZtgAmtuVE9ZI4QmvEUQbSeXPok8b3/6OQKHMgpkDjSI+CLWHrMMhpTu3N4lagSPwCjux37EfOHHxWSsysUxyVPEKu9CDS4wj0+R7+D0y/R34IhLqveHP+BnUs9AjilXjwgGRpFPtObsNkf0QJehVONN0iGaUdPeMW5Bg4yp6G7ijRMfLq/SSDmyjwFfDlK6KFyjKt/vaaN0h+nTEhFaLY6s/cg1Ks6sVSYEkDgy8LJz/jP8xpVlCpRp/dp3t62REJWVkTHM1TiGxiZDWs0w0gJWOvew8EfVcc6mQlzgFfl7qS1nnBvjeY9hcXKWnYtB0rKmRkZUsCw/ewwqop09Opm7+bCAlkzrzwj8jUnkmr8qfvs9oC43dl2dRggfJPYl3SmOIvflkI7u
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11597.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1129cbc1-330d-40e3-6813-08ddc8cf12db
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2025 03:23:05.6178
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C2jDtEkomIt317OPy6IwKWvN/HR1gwGuvzzlG2VY31fT6meI/gnJVcZR2f6zZ/ap0cUAzyKrV2iNBOxIjpR5iA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12639
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 03:23:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118687

U29ycnkgYWJvdXQgdGhpcyBvbmUsIEkgZm9yZ290IHRvIHJlc2V0IGF1dGhvci4NClBsZWFzZSBy
ZWZlciB0byBhbm90aGVyIGVtYWlsIEkgcmUtc2VuZA0KDQpbbWV0YS1weXRob25dIFtQQVRDSCAw
Ny8yMV0gcHl0aG9uMy1nZXZlbnQ6IHVwZ3JhZGUgMjUuNC4yIC0+IDI1LjUuMQ0KPiAtLS0tLdPK
vP7Urbz+LS0tLS0NCj4gt6K8/sjLOiBMaXUgWWlkaW5nIDxsaXV5ZC5mbnN0QGZ1aml0c3UuY29t
Pg0KPiC3osvNyrG85DogMjAyNcTqN9TCMjLI1SAxMToxMg0KPiDK1bz+yMs6IEtoZW0gUmFqIDxy
YWoua2hlbUBnbWFpbC5jb20+Ow0KPiBvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZw0KPiCzrcvNOiBVcGdyYWRlIEhlbHBlciA8TGl1WWlkaW5nbGl1eWQuZm5zdEBmdWpp
dHN1LmNvbT47IExpdSwgWWlkaW5nL8H1INLStqENCj4gPGxpdXlkLmZuc3RAZnVqaXRzdS5jb20+
DQo+INb3zOI6IFttZXRhLXB5dGhvbl0gW1BBVENIIDA3LzIxXSBweXRob24zLWdldmVudDogdXBn
cmFkZSAyNS40LjIgLT4gMjUuNS4xDQo+IA0KPiBGcm9tOiBVcGdyYWRlIEhlbHBlciA8TGl1IFlp
ZGluZyBsaXV5ZC5mbnN0QGZ1aml0c3UuY29tPg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTGl1IFlp
ZGluZyA8bGl1eWQuZm5zdEBmdWppdHN1LmNvbT4NCj4gLS0tDQo+ICAuLi4vMDAwMS1fc2V0dXB1
dGlscy5weS1Eby1ub3QtYWRkLXN5c19pbmNfZGlyLnBhdGNoICAgICAgICAgICB8IDMgKy0tDQo+
ICAuLi4ve3B5dGhvbjMtZ2V2ZW50XzI1LjQuMi5iYiA9PiBweXRob24zLWdldmVudF8yNS41LjEu
YmJ9ICAgICB8IDIgKy0NCj4gIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKSAgcmVuYW1lDQo+IG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3tweXRob24zLWdldmVudF8yNS40LjIuYmIgPT4NCj4gcHl0aG9uMy1nZXZlbnRfMjUuNS4xLmJi
fSAoOTQlKQ0KPiANCj4gZGlmZiAtLWdpdA0KPiBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtZ2V2ZW50LzAwMDEtX3NldHVwdXRpbHMucHktRA0KPiBvLW5vdC1h
ZGQtc3lzX2luY19kaXIucGF0Y2gNCj4gYi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWdldmVudC8wMDAxLV9zZXR1cHV0aWxzLnB5LUQNCj4gby1ub3QtYWRkLXN5
c19pbmNfZGlyLnBhdGNoDQo+IGluZGV4IDQ5OTAzZDZjZTguLjY4ZWY1ZDZkOWEgMTAwNjQ0DQo+
IC0tLQ0KPiBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZ2V2
ZW50LzAwMDEtX3NldHVwdXRpbHMucHktRA0KPiBvLW5vdC1hZGQtc3lzX2luY19kaXIucGF0Y2gN
Cj4gKysrIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1nZXZl
bnQvMDAwMS1fc2V0dXB1dGlsDQo+ICsrKyBzLnB5LURvLW5vdC1hZGQtc3lzX2luY19kaXIucGF0
Y2gNCj4gQEAgLTEsNCArMSw0IEBADQo+IC1Gcm9tIDllYjQ1MzI4M2E3YWM4YTliMWRkM2VhYzg2
ZDkzNmM3YTQzMDQ3NmIgTW9uIFNlcCAxNyAwMDowMDowMA0KPiAyMDAxDQo+ICtGcm9tIDIxYjhm
NzRjM2QwMDA2YzgwNTQ5NDUyNzQzZDUwZTZmMDEyYWE3ZWYgTW9uIFNlcCAxNyAwMDowMDowMA0K
PiAyMDAxDQo+ICBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPg0KPiAgRGF0ZTog
VHVlLCAxMSBPY3QgMjAyMiAxNzozNzowMSAtMDcwMA0KPiAgU3ViamVjdDogW1BBVENIXSBfc2V0
dXB1dGlscy5weTogRG8gbm90IGFkZCBzeXNfaW5jX2RpciBAQCAtMTAsNyArMTAsNiBAQA0KPiB3
ZSByZWFsbHkgZG8gbm90IG5lZWQgc2V0dXB0b29scyB0byBkZWR1Y2UgaXQgZm9yIHVzLg0KPiAN
Cj4gIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBbIENyb3NzLWNvbXBpbGUgc3BlY2lm
aWMgXQ0KPiAgU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4NCj4g
LQ0KPiAgLS0tDQo+ICAgX3NldHVwdXRpbHMucHkgfCAzICstLQ0KPiAgIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkgZGlmZiAtLWdpdA0KPiBhL21ldGEtcHl0
aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZ2V2ZW50XzI1LjQuMi5iYg0KPiBi
L21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZ2V2ZW50XzI1LjUu
MS5iYg0KPiBzaW1pbGFyaXR5IGluZGV4IDk0JQ0KPiByZW5hbWUgZnJvbSBtZXRhLXB5dGhvbi9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWdldmVudF8yNS40LjIuYmINCj4gcmVuYW1l
IHRvIG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZ2V2ZW50XzI1
LjUuMS5iYg0KPiBpbmRleCBiNjZmZDVjOGNmLi4wNWM0ZWEyMjA1IDEwMDY0NA0KPiAtLS0gYS9t
ZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWdldmVudF8yNS40LjIu
YmINCj4gKysrIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1n
ZXZlbnRfMjUuNS4xLmJiDQo+IEBAIC0xNSw3ICsxNSw3IEBAIFJERVBFTkRTOiR7UE59ID0gInB5
dGhvbjMtZ3JlZW5sZXQgXA0KPiANCj4gIFNSQ19VUkkgKz0gImZpbGU6Ly8wMDAxLV9zZXR1cHV0
aWxzLnB5LURvLW5vdC1hZGQtc3lzX2luY19kaXIucGF0Y2giDQo+IA0KPiAtU1JDX1VSSVtzaGEy
NTZzdW1dID0NCj4gIjdmZmJhNDYxNDU4ZWQyOGE4NWEwMTI4NWVhMGUwZGMxNGY4ODMyMDRkMTdj
ZTVlZDgyZmE4MzlhOWQ2MjAwMjgiDQo+ICtTUkNfVVJJW3NoYTI1NnN1bV0gPQ0KPiAiNTgyYzk0
OGZhOWEyMzE4OGI4OTBkMGJjMTMwNzM0YTUwNmQwMzlhMmU1YWQ4N2RhZTI3NmE0NTZjYzY4M2U2
MQ0KPiAiDQo+IA0KPiAgaW5oZXJpdCBweXBpIHB5dGhvbl9zZXR1cHRvb2xzX2J1aWxkX21ldGEg
Y3l0aG9uDQo+IA0KPiAtLQ0KPiAyLjQzLjANCg0K


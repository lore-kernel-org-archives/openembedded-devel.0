Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCE07CFC26E
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 06:14:18 +0000 (UTC)
Received: from esa12.fujitsucc.c3s2.iphmx.com (esa12.fujitsucc.c3s2.iphmx.com [216.71.156.125])
 by mx.groups.io with SMTP id smtpd.web10.6981.1728972850040487220
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 23:14:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=xCkdF5j+;
 spf=neutral (domain: fujitsu.com, ip: 216.71.156.125, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1728972850; x=1760508850;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=8BeWlaPwb2wBHF0d12cOM/9Cj1PNnY4oR16dHYV+sq0=;
  b=xCkdF5j+vRk0CHTsKvfDhPNIs/qJyEzk5BjSNsEoNLib5YXKVnf1I+SK
   KBejDvG6Dqb4g7QSyqbhRioOBHxr4jX8Hl11ib58KO4R6K3H2J3l7UUu8
   msVJAo/xi5KmIuZggLlIljrKbMVtDR5+VGs1ir2VLUu56X0uzZhAU5fip
   sLTfWEJUe1pbbzozAI7nrWuqBw+cYR2pUfGVx99ap6lGCUrp+YyKdqc19
   4nr4r4zlQq3r5a8WbQ2zWsFR0ENCUghx5Q/ep2u72+hMTsHVaEkXX4DXd
   gzE32brEcxO8UiuNalKweJ+NPX66mRh+IA68iDCWEhVVhSdEKcHivLsl0
   Q==;
X-CSE-ConnectionGUID: g/1ZlX6eR7ek/xf7Y3vRjQ==
X-CSE-MsgGUID: 8JQubJzIQhKsCZ6yZEpWkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="133827998"
X-IronPort-AV: E=Sophos;i="6.11,204,1725289200"; 
   d="scan'208";a="133827998"
Received: from mail-japanwestazlp17011029.outbound.protection.outlook.com (HELO OS0P286CU010.outbound.protection.outlook.com) ([40.93.130.29])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 15:14:07 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GSV9HX9/+uO1ImU/scSCtj9MzoARLe6nB3ougVDymysg+O2kvaRoxEdt7Tn2GXzTTazW1VHf1BI0b6kkMWO1kGb9JxUw3OFRG+VlanHa7Zq33pfb+L2Tp7nNPpS38p25ncqkaBF8tkKM9zJ+z3r+9+fwGwfJyMwNVy9FjuJhrsMH1JKYJlg9CCKn1pXNHEJgbKVAiZprBNJQ2M1s6q7PXFOJ2KI85V4H3wJbe6b5pp/CtjKifAKHDjdbPxEFbkMjZeQ8cPwwKytn5PWYtbH+33vNtRNvvVUdhRHEZMBO71kMsjJzyIUfF8CztlmSzCVcrAff+sCwuwozgCQ+tqFg9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8BeWlaPwb2wBHF0d12cOM/9Cj1PNnY4oR16dHYV+sq0=;
 b=ROt4kz9Z91sSdrSGfDjPusWKn4DNchUQzm3BEGhjuY0sGqYh1TbyDDyCqls8ovzILCyBp3+ur2DHONGdP0rjojEWRsD3+0LlXyoRqsM31l2T+WrOoZ+iKMwIOJQ26J/cpbwFdK10kmV5HZD9+rlEKmudKRPWfkr2bvHfAgfNN+CkV8spB5bByiQ4SX4K8IKhp0LzLBAtlGiRXJC7ikc85fEiGzB8KT6+KgCFK2GKiu3wDh/aCANQASPaqn8uptZJC7rYBK6a8TEd6ceCit6k0YE50glcnwzrX7rQ1uu4oINnHdIZQH/l2sTk55Ale9/7W8Yw3zwjD22JmaOQmxBLGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 (2603:1096:400:3fb::13) by OSZPR01MB8153.jpnprd01.prod.outlook.com
 (2603:1096:604:164::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.21; Tue, 15 Oct
 2024 06:14:04 +0000
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e0dd:28e5:6a6e:2342]) by TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e0dd:28e5:6a6e:2342%6]) with mapi id 15.20.8048.020; Tue, 15 Oct 2024
 06:14:04 +0000
From: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-python] [PATCH 48/54] python3-yarl: upgrade 1.14.0 ->
 1.15.1
Thread-Topic: [oe] [meta-python] [PATCH 48/54] python3-yarl: upgrade 1.14.0 ->
 1.15.1
Thread-Index: AQHbHhbtUoO0uWmDjUKJ871GJTqeTbKHJCoAgAAyT6A=
Date: Tue, 15 Oct 2024 06:14:03 +0000
Message-ID: 
 <TYWPR01MB118619799E545C3121339BE68DC452@TYWPR01MB11861.jpnprd01.prod.outlook.com>
References: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
 <1728896115-2944-48-git-send-email-wangmy@fujitsu.com>
 <CAMKF1sqVTh-B2HFRiXTMThNc4dfvjqCHnGvnPyauC-QQNPa+ow@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqVTh-B2HFRiXTMThNc4dfvjqCHnGvnPyauC-QQNPa+ow@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5Njgw?=
 =?utf-8?B?MmZfQWN0aW9uSWQ9NWEzNzRhYzYtMTRiZC00Y2U0LWI1NmYtODg0NTZlNDdi?=
 =?utf-8?B?YjVlO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMz?=
 =?utf-8?B?OTY4MDJmX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQx?=
 =?utf-8?B?LTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX01ldGhv?=
 =?utf-8?B?ZD1Qcml2aWxlZ2VkO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFk?=
 =?utf-8?B?NTUtNDZkZTMzOTY4MDJmX05hbWU9RlVKSVRTVS1QVUJMSUPigIs7TVNJUF9M?=
 =?utf-8?B?YWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfU2V0?=
 =?utf-8?B?RGF0ZT0yMDI0LTEwLTE1VDA2OjEzOjIzWjtNU0lQX0xhYmVsXzFlOTJlZjcz?=
 =?utf-8?B?LTBhZDEtNDBjNS1hZDU1LTQ2ZGUzMzk2ODAyZl9TaXRlSWQ9YTE5ZjEyMWQt?=
 =?utf-8?Q?81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB11861:EE_|OSZPR01MB8153:EE_
x-ms-office365-filtering-correlation-id: 5f37b1bf-406e-4179-f313-08dcece091a6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|4022899009|366016|376014|1800799024|1580799027|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?K2ZweG9GazZWc1NJSkhDTE1PcFZJRkNpMXdUVDd5MVd5Y1drSkVic0phNUkr?=
 =?utf-8?B?SDFnbHFBZVBJVDEreDlwTTJBSFVEQU0xbHhDV1kxbXozOEgycmpYdW83TC93?=
 =?utf-8?B?RWtNZjI3OUMrZW9zWmc2WDFBR0FLcDBHaDhvbTltUVk0eU1lemFGbFhBK2xU?=
 =?utf-8?B?YUZnQUV1WkVSSmNkR0oxRmppNTU3VXJKUVUzSDVGTGVvcWJRSndyYlYwbSs3?=
 =?utf-8?B?TVZGZWYyLzUwcUliSkhZZTNta3BoNW9LYTVMZmY2ZEJhdGNxVENKcS9GMFJD?=
 =?utf-8?B?OFY2WFo2OG0yY0N4ZXpDS2VOQXorWWo3V0RmSnIzamRUaURuazkvaDR0eGhw?=
 =?utf-8?B?dmJ6TU95Zm15cDB5Vndja0tDNk1DQm9lQmhmMXBJeThqeTE5WTBpNEsrcTlD?=
 =?utf-8?B?bjJhQzhHUEJHT1FRQTlGYitUZEJvWEhBdFBZWndBeFBqNDVMaWhJdUdva081?=
 =?utf-8?B?Y2pYdVRxL0N3Rm5QbnFZMm94WWF6bFJRaHlVcnRsUGs0dkQxWXZkVTdlczJE?=
 =?utf-8?B?Snl2UFFJQVJOK290Z0NDdG1RWHJIL0tmNmFOK05Qc3ZUMlZnMlFLOXRrdHBv?=
 =?utf-8?B?TTdQb1hZNnBSU3dSMXNIOExaLy9pVjBvNDJkdjVHVkxQZVpXaVdwQnBKVTJ2?=
 =?utf-8?B?akl6cEpRcEpza0MrMVdHdVFvbVkyZEpUOVl3eDBHUUNvMUlIUGVSMGlidmVo?=
 =?utf-8?B?c0FPMjd5U0hob3Z2VVVCK0kzVHA1akl0OWlkWjlRcnRxalVJOEN3alpQTW1z?=
 =?utf-8?B?NW1FdG9nUTlTbXJlMC9hZVJvOEZDQ2dBMGVUajF4bDVSUGc3T3dRd0czWFpl?=
 =?utf-8?B?VUs3Q25GWW5McHNTWVZpd295d0JKZWVFVnZjVnlXMUtUQmpYcXhWZGNGeEpC?=
 =?utf-8?B?VkRTQ1o1YjNiZVNyYXJXSDRWazhhMGxWQ3RXcm1rdlhLVEZGS3RXNUxQWURs?=
 =?utf-8?B?aW5CY1RsVi8yN2dPR1A0U05NTjJSdmd6cURUdWF5Ukt1cS9HbjBWelVhMFVS?=
 =?utf-8?B?ckJtYnRpTjRaM2xHck9jTWRtbDBJTW1tMlc0cnJ2VnVyWE51SGtENG15aDlt?=
 =?utf-8?B?THgrRFFycnRwaGRucUZGYlR1T0FEbUlpS2xDUnY1RjUxSEdOTGlEbHVJaDZO?=
 =?utf-8?B?UGZLS283VFZuUVBCMWpnTDJncEpvNDZkelEwRlJlL1F3SUFOcW9CamUzV0pI?=
 =?utf-8?B?a2Q5WFh5RUhpTWFCclJYR2hPcHZSdEpEdFZHMXJGWG1GWklCL3YwSTZWZExD?=
 =?utf-8?B?aktRMHU5V25ybXk2RDVWNU1YbS9DclZ1ZVVuK1Z2VkU2YUZ6bCt3bUhudTlG?=
 =?utf-8?B?V2sydHZSM3U3cFNraGcyRENST2JkTWN2ck5SVlBJRHBVNnhmbzh5NjZFb2hB?=
 =?utf-8?B?aVMxWjRqeW05TnZiT2FEL1NVaExjRDBnZ3N1bnNmbnZsVVZadWpESkZQdmcx?=
 =?utf-8?B?MThGZjZHWWVsU3A2WU9KWUdpMHJKSXN1cmZIQnZ6eGJjQ0lJRnVjNmFBcGZP?=
 =?utf-8?B?QmlkQnIzM1E5M2dKc1JJOWdiZHp3SCtadzExY0N1QURDS1B3dnAvUU9aeFUw?=
 =?utf-8?B?aDNCdXJPMlBRK1cxbzNHM2lkNCtjblpQbFROOFVRcVo1Y3BzanErTFBYUHZk?=
 =?utf-8?B?NU53TVZ0ejhKRDYxL1h5eTMwUjNWV2VQaTNLS2xIaWhLUWNIOFFzeHVHRjFr?=
 =?utf-8?B?VW9aT1hEV0tjTFd5REllcjVMVEtIVjdoeHVXZmR1RmFZK0V2S09kb3NhY3p4?=
 =?utf-8?B?NHRUNVJsRXZySzl0MTRKT3dHZ25FTVZ1WmI3L21wcFJvUzNCN0d4cWc5NDJL?=
 =?utf-8?Q?tS26gkeSHnxgLkEPTKxqBo6iKc9YElVt4geR8=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB11861.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(376014)(1800799024)(1580799027)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cExjR1pGUHdzY3crSWJOdy8zRWVVUGNUb3dZUG9EVytKYjZBSFEyUHpVUmJh?=
 =?utf-8?B?ZVBwcTlPZzFtQkNNSnlmREVhMmt1Sk5CNFQvRHBQSmZ0VW1VS0lubXdYaTd0?=
 =?utf-8?B?VFZ5UFVyMjluK3RCTVZaNWZjeHNhWmhLWllodEQwRDV1OHR1VkJWMmhoY3FG?=
 =?utf-8?B?K1ArRjdlN3BhQUlMSFRxUlVTRjVaa1dwcDJ3U2g0T2JjRGEzcXcrR0VUMHNS?=
 =?utf-8?B?OGllQVRUMEgwdHhqSTYvSmU3SHBHaDAzTWs3MXJaWmtiWkxOMG4xNytpb1Yz?=
 =?utf-8?B?a3dBTHp3R2cvcUpwVFRhN2duOTJpYmxYbzd1bzhOL3J3R1RxN3pObTdKY2Ro?=
 =?utf-8?B?ejNCaG93eWk5ODFLd1MyVnZTTUIrb0QyZXp4SHdrMzRMeVJrVldVNkYvbHZu?=
 =?utf-8?B?M0Nvb1VMcUlNcHNPNzEvNldSZC9FLzUyTmw5R3RIc2tFTE9vcElNS1kwdDdB?=
 =?utf-8?B?Z2s5QlBSOFV0MnRlYWttc1R4QXUxczlyaDRZK0JzZXZBVGdpZU1yZHRKMklC?=
 =?utf-8?B?ZE1ySm4vZlpOL0xCMTYwZ3RUWGZQbDFiazlXTExKbUZQL3lubURLVDE0NlJk?=
 =?utf-8?B?UUJDeXE3MGJ5eWt4Y2NiOVhLSHZkTit6d0pmT29ycW15b0RYNitSY2xVY0ZF?=
 =?utf-8?B?UUIwUlJEWm9jaXVWWXBEU3ZaSnE3NWhpVVFXY0dGdUtWWHdET1Z4SnNreGlY?=
 =?utf-8?B?K0dyNSt6U3hieUVXOTdORjJ0U1RlWllkaXlObEMzMlV6dHZiSSs0bGgrR0dY?=
 =?utf-8?B?cUtqaUtnbmdRb0V3YUhXcHphUHF6RlNPazZuakFmYm1YbURSb1J0Sm5odUxj?=
 =?utf-8?B?eUR2ZHdSVHM5SVdGOXEwcWp4NE9HNmhwQWxPK1VZOXhBRkl0WG53OW5jRi9U?=
 =?utf-8?B?RFpnQmp0SS93WkpDRkwrSjJCcEVpMzNjd2NlZDJPWGQwYTZBUitEVHluSWRy?=
 =?utf-8?B?THlLNlo4VlVYV01wa0JhcE1YSVA5QVZsZHM1NkcrTkhWb2VRMyt1cUgwM1Rh?=
 =?utf-8?B?ekMzaVVaR3lOWmcwS1QvUXdrZG9YWUdHMnFkQWVEeU9sKzNLTVBJcWhPRzNL?=
 =?utf-8?B?bjFMV0dFTkZkb0FDSHVVRDBzanVhdVR0ckNGNjh1YWVGZmZHVmpkdHJZTGdR?=
 =?utf-8?B?bGtoZmw3bnhRdGtpbGVwUGlmWnlFYjYyZWtDVEU2M2R2RTFwUUF4aXhieVJV?=
 =?utf-8?B?RUo5L3Vta2xmekZNejh6RUc2R1plaUQ3cXVkOEhUbVROT1VJZVk5aHVMQnJB?=
 =?utf-8?B?UXB5NUtDZFlQRWtlcFdxcythbzQyZ3FIS2MrV0tuN1ZGOU9zL3FYTnNiVkRo?=
 =?utf-8?B?VXdwYWNXTnMwR3hUOXJhWklHcVJYYzlkdWxsUjB4WnR1eUp5S2tSdVZmK2tP?=
 =?utf-8?B?UWIydTV5UTh0UzM2VE1ocTFRT2dCeWJHU3Q4c3FtWkJVaUdqQTVxOG5tNFJC?=
 =?utf-8?B?cDNDTloxRFhFV3kvditjMHhOQU9jWjNwTUR4WHZBekROZ3ozdGMwY1RodzNx?=
 =?utf-8?B?Wk0zZExzMTBaZGx4N2lCajg4ZVRWRldQSXdEelc5YzJzSkNTaUJUQzJnTExj?=
 =?utf-8?B?dkFUaWI3NGtPeDUrOXNkcWpmNnRLUUtqTC85SnA5ZHlWVXFNWXc0UlhhVE5p?=
 =?utf-8?B?VURWZEpLUml1NGtXVXpCREFqOGhtcUxjcUo4SjRoeFhJK3NqYkFHZFFEdVdl?=
 =?utf-8?B?YjlKb0kzSjVoT1RRMjhSdUxqSVBpdFc0R0JJNS9mY2Fva0VrcFpFSkdFV3dS?=
 =?utf-8?B?OXlHRVcxS1dNUkVKNUY4NVppaDFLYVNGcE9vUURDenZZNDZMSHc5SC9CalRI?=
 =?utf-8?B?dU84YzRSUzZ1MGw1SnVzc2pRYnhWbVhSYzg0NnJUYWF1ZU1mTnJrTmdMWmFQ?=
 =?utf-8?B?Zmd3SmMyc3RjVFVOZzFpSFVuN1hZemYvS0tYZytXZGNxc25PZ3Z5WnkwL3pz?=
 =?utf-8?B?QkxxU0tFTWlMdHVUV0hRZXVjSFFNWmhnRVlIOE1CU1hzMk85WXdhSlVFNk9v?=
 =?utf-8?B?d29MckIyY3hSVXJ5aGh0RC9DODQ5amVyV211R1hCbXhJeEJSUTVqNkcyY3p5?=
 =?utf-8?B?OTFNaVBsbVdZWVh4cDdraU1tSFQyT0VZaHF3YklDUVlCMm14ZDJIRGJ2bzJl?=
 =?utf-8?Q?9WAY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	nLYMQPGMgHQzQNU2AbMdPvFZV+V5YhcLDEewLhwJcUR6McyfCYXPeJZiRJsx+aQ7IGLPUKCmvK5Oh55w2iQEZcQI2Yc4d1pJ4JXEfevyzDMdnurh4USIFhNVGZVMEwnTNZzp61BpJEeost+Sx0seInCpUiqHYLEtK4jCBhYL30XG00JA9HHSVDMxaqe+szsZWgpox/qPiW99KX/RvJeA2GDI975dkBvvGRqK1yHjhN2tTGTM61xkfF7zBo1Q492/jBD9zk/2yXnEy2tro9BfnUW6G9/h3dH3HLnAiTk8ocb5UKFrkRjtQI7eH9mTmjMV7gbya1EyKjutv38ZuOxCiMDUr/3l8rdFGHp5uGmJTANNFtjNKLp0sU+gvKXMuFfQ4KLXBGlcVgWqi0jS4ufm2vc5GLP05av0hkiWmP5L06caTQhKXQXcMAXh/YqkES0teBgwf/lDH1JV8upHPEzVQf6Ksu/aHp5PIb2phB/qb749SiM2l4O15FtFaZn1FZTL+k1jA2QerpaSLwzW0B6KK3RDq6oX2dT69MDNgqUbBfD0e3uos6vbEkKaUZg4NbZrPauT+pXJdb28ujwH1/t4ckRysEihaIGbH/IUv9yjJrHcc3Bl7ZtsiYIUzwSVropC
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11861.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f37b1bf-406e-4179-f313-08dcece091a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2024 06:14:03.9811
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kDXla76zqKJqvgfY4p7HplowjV+y3CBPg8mBrpF6h4f/eNMSYf2cHRwu2C97LSBcu+J4XoAagP/2AhPfKu0JYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8153
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Oct 2024 06:14:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112921

T2theSwgbXkgdGVzdGluZyBlbnZpcm9ubWVudCBoYXMgbm90IGJlZW4gY29uZmlndXJlZCB3aXRo
IHB0ZXN0LiANCkJlZm9yZSBzdWJtaXR0aW5nIHRoZSBwYXRjaCwgSSB3aWxsIHJ1biBwdGVzdCBv
biBhbGwgb2JqZWN0cy4gDQpUaGFuayB5b3UgZm9yIHJlbWluZGluZyBtZS4NCg0KICAtLQ0KQmVz
dCBSZWdhcmRzDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0NCldhbmcgTWluZ3l1DQpGVUpJVFNVIE5BTkpJTkcgU09GVFdBUkUgVEVDSE5PTE9HWSBD
Ty4sIExURC4gKEZOU1QpDQpOby42IFdlbnpodSBSb2FkLCBOYW5qaW5nLCAyMTAwMTIsIENoaW5h
DQpURUzvvJorODYrMjUtODY2MzA1NjYtLTg1NjgNCkNPSU5TOiA3OTk4ODU0OA0KRkFYOiArODYr
MjUtODMzMTc2ODUNCk1BSUw6IHdhbmdteUBmdWppdHN1LmNvbQ0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+DQo+IFNl
bnQ6IFR1ZXNkYXksIE9jdG9iZXIgMTUsIDIwMjQgMTE6MTMgQU0NCj4gVG86IFdhbmcsIE1pbmd5
dS/njosg6bij55GcIDx3YW5nbXlAZnVqaXRzdS5jb20+DQo+IENjOiBvcGVuZW1iZWRkZWQtZGV2
ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW29lXSBbbWV0YS1weXRo
b25dIFtQQVRDSCA0OC81NF0gcHl0aG9uMy15YXJsOiB1cGdyYWRlIDEuMTQuMCAtPg0KPiAxLjE1
LjENCj4gDQo+IFRoYW5rcyBmb3Igc2VuZGluZyB0aGVzZSB1cGdyYWRlczsgdGhleSBhcmUgZXNz
ZW50aWFsIGZvciB0aGUgcHJvamVjdC4NCj4gSG93ZXZlciwgSSB3b3VsZCBsaWtlIHRvIHN1Z2dl
c3QgdGhhdCBwdGVzdHMgYXJlIGFsc28gcnVuIGJlZm9yZSBzZW5kaW5nIHRoZQ0KPiB1cGdyYWRl
cy4gZS5nLiB0aGlzIHVwZ3JhZGUgbmVlZHMgcHl0ZXN0LWNvZHNwZWVkIG1vZHVsZSB0byBydW4g
dGhlIHB0ZXN0cw0KPiBzdWNjZXNzZnVsbHksIEkgaGF2ZSBmaXhlZCB0aGlzIGFuZCBzZW50IHBh
dGNoZXMgdG8gbWwgYnV0IGl0IHdpbGwgYmUgZ29vZCB0byBydW4gdGhlDQo+IHB0ZXN0cyBmb3Ig
bWV0YS1weXRob24gcmVjaXBlcyBmb3IgbXVsdGlwbGUgcGF0Y2hlcyBsaWtlIHRoaXMgc2VyaWVz
LCBpdCBtaWdodA0KPiBtYWtlIHNlbnNlIHRvIHJ1biBtZXRhLXB5dGhvbi1pbWFnZS1wdGVzdC1h
bGwgdG8gZW5zdXJlIGFsbCB0aGUgcHRlc3RzIGVuYWJsZWQNCj4gcGFja2FnZXMgYXJlIGdvb2Qu
DQo+IA0KPiBPbiBNb24sIE9jdCAxNCwgMjAyNCBhdCAxOjU34oCvQU0gd2FuZ215IHZpYSBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnDQo+IDx3YW5nbXk9ZnVqaXRzdS5jb21AbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZz4gd3JvdGU6DQo+ID4NCj4gPiBGcm9tOiBXYW5nIE1pbmd5dSA8d2FuZ215QGZ1aml0
c3UuY29tPg0KPiA+DQo+ID4gQ2hhbmdlbG9nOg0KPiA+ID09PT09PT09PT0NCj4gPiAtIEltcHJv
dmVkIHBlcmZvcm1hbmNlIG9mIGNhbGxpbmcgOnB5Om1ldGg6fnlhcmwuVVJMLmJ1aWxkDQo+ID4g
LSBJbXByb3ZlZCBwZXJmb3JtYW5jZSBvZiBhbGwgOmNsYXNzOn55YXJsLlVSTCBtZXRob2RzIHRo
YXQgY3JlYXRlDQo+ID4gICBuZXcgOmNsYXNzOn55YXJsLlVSTCBvYmplY3RzDQo+ID4gLSBJbXBy
b3ZlZCBwZXJmb3JtYW5jZSBvZiA6Y2xhc3M6fnlhcmwuVVJMIG1ldGhvZHMgdGhhdCBtb2RpZnkg
dGhlIG5ldHdvcmsNCj4gPiAgIGxvY2F0aW9uDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBXYW5n
IE1pbmd5dSA8d2FuZ215QGZ1aml0c3UuY29tPg0KPiA+IC0tLQ0KPiA+ICAuLi4vcHl0aG9uL3tw
eXRob24zLXlhcmxfMS4xNC4wLmJiID0+IHB5dGhvbjMteWFybF8xLjE1LjEuYmJ9ICAgfCAyICst
DQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKSAgcmVu
YW1lDQo+ID4gbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMteWFy
bF8xLjE0LjAuYmIgPT4NCj4gPiBweXRob24zLXlhcmxfMS4xNS4xLmJifSAoODklKQ0KPiA+DQo+
ID4gZGlmZiAtLWdpdA0KPiA+IGEvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy15YXJsXzEuMTQuMC5iYg0KPiA+IGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy15YXJsXzEuMTUuMS5iYg0KPiA+IHNpbWlsYXJpdHkgaW5kZXggODkl
DQo+ID4gcmVuYW1lIGZyb20gbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy15YXJsXzEuMTQuMC5iYg0KPiA+IHJlbmFtZSB0byBtZXRhLXB5dGhvbi9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXlhcmxfMS4xNS4xLmJiDQo+ID4gaW5kZXggN2M0MWVkYzZm
Li4wYTE1YjJlMzQgMTAwNjQ0DQo+ID4gLS0tIGEvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy15YXJsXzEuMTQuMC5iYg0KPiA+ICsrKyBiL21ldGEtcHl0aG9uL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMteWFybF8xLjE1LjEuYmINCj4gPiBAQCAtMyw3
ICszLDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL2Fpby1saWJzL3lhcmwvIg0K
PiA+ICBMSUNFTlNFID0gIkFwYWNoZS0yLjAiDQo+ID4gIExJQ19GSUxFU19DSEtTVU0gPQ0KPiAi
ZmlsZTovL0xJQ0VOU0U7bWQ1PTNiODNlZjk2Mzg3ZjE0NjU1ZmM4NTRkZGMzYzZiZDU3Ig0KPiA+
DQo+ID4gLVNSQ19VUklbc2hhMjU2c3VtXSA9DQo+ICI4OGM3ZDlkNThhYWIwNzI0Yjk3OWFiNTYx
NzMzMGFjYjFjNzAzMGI3OTM3OWM4MTM4YzFjOGM5NGUxMjFkMWIzDQo+ICINCj4gPiArU1JDX1VS
SVtzaGEyNTZzdW1dID0NCj4gIjAyZTFjOWUzNjUyOGRlMjcwYzIyYzA2YWFjNmE1YTFkZThjYzg3
MGZhZmVmYjVlOTBlNWIzNWNiODk4NWQwYjIiDQo+ID4NCj4gPiAgU1JDX1VSSSArPSAiZmlsZTov
L3J1bi1wdGVzdCINCj4gPg0KPiA+IC0tDQo+ID4gMi4zNC4xDQo+ID4NCj4gPg0KPiA+IC09LT0t
PS09LT0tPS09LT0tPS09LT0tDQo+ID4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBz
ZW50IHRvIHRoaXMgZ3JvdXAuDQo+ID4gVmlldy9SZXBseSBPbmxpbmUgKCMxMTI5MDApOg0KPiA+
IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1kZXZlbC9tZXNz
YWdlLzExMjkwMA0KPiA+IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRk
ZWQub3JnL210LzEwODk5ODE0MC8xOTk3OTE0DQo+ID4gR3JvdXAgT3duZXI6IG9wZW5lbWJlZGRl
ZC1kZXZlbCtvd25lckBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4gVW5zdWJzY3JpYmU6IGh0
dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1kZXZlbC91bnN1Yg0K
PiA+IFtyYWoua2hlbUBnbWFpbC5jb21dDQo+ID4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4g
Pg0K


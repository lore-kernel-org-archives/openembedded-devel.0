Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96A91EFB7F5
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 04:00:07 +0000 (UTC)
Received: from TY3P286CU002.outbound.protection.outlook.com (TY3P286CU002.outbound.protection.outlook.com [52.101.229.55])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13045.1771905598518250795
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Feb 2026 19:59:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=nc3N8Ybm;
 spf=pass (domain: fujitsu.com, ip: 52.101.229.55, mailfrom: liuyd.fnst@fujitsu.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I0VF7Lq21QuEHw+1Md/zjOQV9s56TRoIPYDSq3fWvF+lMqyu3UGlR0eIcKiVblDwFCTiZ9dh9ZY/U6WQj0vK1sYnXQW293CpjpZ+El8/ZIOor1Tgwx4haIojnictnM++kE2jazqFFSJ3ZOcTdF/lpErAe8/XLtUbjv97hdgvYP/w/FKPDjCGnNrDmRGMcqWqRD9txqhgl+VLpG5Zg0TuyWlZiSC5bYJNukcNj7sIxuBpR8U3AErWuWwYkJ7frC614gqebzk4Z7vdwhMBC7TlPvsmch96cC3ytiCP9upEaFUgXp590crahTNzIfZ2qBcaEFr0RKt5xLFCPdBg/SOmsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mN953fnZCDYwjqwVNxnD1P2v7t7os7rGOWr3dbwOVdY=;
 b=AP9YpAJtdGUSD9dhPR+uHXsrruU+5YrgqzaHU9vVo3YCfgqq/OgsPtPfpfTmqRRe5CqHVKDOQyJ3yAGQsfsPmtVy/wfnKw6aO926+xp5MsDazjYNEyjLl1UiHEiY+hcX8wrbxliu5IhbVwd3tGXeMZTD1GUFJqygGYjYtdQxSb0Oa3RWqLc1dClOtKzh0SdjsmS7agoibJ06O6ETUJPsokxHG5zDI041+f0HoFr+iRwiJg+5myvWbGc7+3MNOzMULQE7nYPpziHf3VpiwSAlxu/YZaBAYwRNBT8FkeaxLJ9xuuJ5bybz5qtzMbMaAeuFJnKUGjqVeQERJr/Dqm5W+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mN953fnZCDYwjqwVNxnD1P2v7t7os7rGOWr3dbwOVdY=;
 b=nc3N8Ybmxo+GSrc6WutzSez6+mjwNRbfuGCUtcD6toLpGNqxtUCiUXbDQuRXaMBXYGfBkCTzhyJq49Fd8UDFggd2eaiycCSuCokbox8LUjTCAfizlcKV7UNn4QtFBykZOIGh4Q90mgTvaRIgUJrIwxeRPWdRcyLcTQOjNtVbrAuouR78GiNdsGgsdR2Ou0jfUXZDvsqwBbhKpbSiPeQgyHhGzmB2bh4EOkU9ceF8KDAdqOmNS09AGkrOuN7NaZsYDBC5G0VI3pb4vX2Ds4eN4OroK1zA2h3W9nZotIm8N8TjXrVgkGWJ2YjV+HGJS5+5WuMAh0zX6dNE8IFSH0Tj+Q==
Received: from TY3PR01MB10110.jpnprd01.prod.outlook.com (2603:1096:400:1d9::5)
 by OS9PR01MB12511.jpnprd01.prod.outlook.com (2603:1096:604:2f7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 03:59:55 +0000
Received: from TY3PR01MB10110.jpnprd01.prod.outlook.com
 ([fe80::65d2:5fd:bb96:1df2]) by TY3PR01MB10110.jpnprd01.prod.outlook.com
 ([fe80::65d2:5fd:bb96:1df2%5]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 03:59:54 +0000
From: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "Yiding Liu (Fujitsu)"
	<liuyd.fnst@fujitsu.com>
Subject: 
 =?gb2312?B?u9i4tDogW29lXVttZXRhLXB5dGhvbl1bUEFUQ0hdIHB5dGhvbjMtYXBwZGly?=
 =?gb2312?Q?s:Add_HOMEPAGE?=
Thread-Topic: [oe][meta-python][PATCH] python3-appdirs:Add HOMEPAGE
Thread-Index: AQHck+SnQoADrIN750ieiEpkPBNvVbWRXEKm
Date: Tue, 24 Feb 2026 03:59:54 +0000
Message-ID: 
 <TY3PR01MB1011047D7A09F29839168E5D19B74A@TY3PR01MB10110.jpnprd01.prod.outlook.com>
References: <18904A4396EDD3D4.4987@lists.openembedded.org>
In-Reply-To: <18904A4396EDD3D4.4987@lists.openembedded.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2026-02-24T03:59:53.756Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB10110:EE_|OS9PR01MB12511:EE_
x-ms-office365-filtering-correlation-id: 9b27898a-77ba-4ec1-2dbd-08de73592b0c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|1580799027|38070700021|8096899003|13003099007|7053199007;
x-microsoft-antispam-message-info: 
 =?gb2312?B?MmlOQ1luWkVNWmpPNU5FOE4wdVJ5OW52dzA3TEc3Szl3SjAxNTdOWlBEZ0Nx?=
 =?gb2312?B?QmY2YjBFMjEzYnZsYkVEV0VydnZBazZWeGE4eWdSUFI1bWxpdlpjUFN1UUFY?=
 =?gb2312?B?M25Zb29EUE5oZXViK0R6bnVQM3BzK3IwTlJFZEZ3d2lnTTI2SGk4NGk5ZmVv?=
 =?gb2312?B?YW9TVEYrTC9TckdRc2dsTWRyVExGbTR3ZHg5cGVVZ1BYMTkrOUdCZlpFNXB5?=
 =?gb2312?B?TUpLT1BMU2JodlpHTkZNbUFueWs3VFhDVlNDUUJva3R6MmhFMmx3WnU4WWtF?=
 =?gb2312?B?emQrbkV5Ny9hdlRWREtPaGNseUNwNmZyUHIwcHNIcGthOWxScTRLclNyUlVu?=
 =?gb2312?B?b3YrSTI4SnhTT1ViVDBhVC9FRjVtR2VPZFRtY2MyS3l4NE9JaXFuTU54czgz?=
 =?gb2312?B?S0xYNitOVHRaT3BCWFl5ajdrclBUbldveFhOUGdlSzJiWVFuZTRwNUVrMzI5?=
 =?gb2312?B?ZGpiaTl1R0xBeFJZR1VaMUZaR0NoSGVja0tpVFpVRXhEY20zSm1UeTBJNVhm?=
 =?gb2312?B?blJPTkJGNkZkdERmTHphOWZwTTIydHJXRjlaODRYOGNvbEt2aEZGaDRqYkQ4?=
 =?gb2312?B?MlJUL2hPSGhHU1VyUTUyWHR2OWh4SnNpd1hKRklwVlExUVoybjlXRy8raGQr?=
 =?gb2312?B?R2d3eC9nOGdIRHMzZDVNTmUxWFRpYnlKbkdhSWpMcm1uNmpTK3M2NkZOdUs1?=
 =?gb2312?B?Ni9HN1UwRktTdTJaeTl6aFNBT09rYTZxSHAyNTVVcVhJc0NmZmNWTVFjdHVX?=
 =?gb2312?B?cjY2bUx0WDJKbnliSG5ReTlIMGZmMHRmUlhKVnpiWTR2cEFtTWcrQlpRNzBr?=
 =?gb2312?B?S3E4c3pjODAvdmVrNWV4a0IrZm1JWGJNZFEwNEVnWFdaMXNQSXliaVVpQkVG?=
 =?gb2312?B?cm4zQjBZSDhwNzdUZVI3SVRVOVFpWU1raWF3R0R1c0gwSVMydm5xaEc4OGxv?=
 =?gb2312?B?SGN5SFMzZ0MyMnlVTVNRRTBVcThnbkF0SngyVXAzNDc1UGJkazc1Uk9QMUNS?=
 =?gb2312?B?cHFzU0JQSTVBUGtKZ2YydVRXcXNTRWdNS3d0WGFKeGZOdkJVZENXSGJSdXVK?=
 =?gb2312?B?SXhpZUkvNnNDVktsM0UwcUdyTnNvbUpiWUZ6dXBMUHJrWXg2UGEwanV3REJm?=
 =?gb2312?B?Uk16SjRTMCtnamw4TFBINTJzMTYyb1p3c29DVUtKUHV2Mzd6dlpVMVgySFlL?=
 =?gb2312?B?V1dwWUlhbWEwV2RmUC9MQmNKc3BLSCtUV3JHM244YXRvVDNxVVFZK1d2Zk1r?=
 =?gb2312?B?bUdPalhjZmVSdGJ0R0R5UWt4UTlQZFFTRDNnQUJmMW1YdTAzSTZseG1Kb3Vr?=
 =?gb2312?B?NS9mdW1vUEdJekVhaERpcjhabWltcXRRdWJEOEkveXJoejU3OGhUZE1XdHVR?=
 =?gb2312?B?RkEyWlpqdGNodVNHM25XSXJnbGFITVpWY1dueHJGdk8ycmVad2wwL0JOdWp6?=
 =?gb2312?B?bElwcTJHbHN6Y3lGanFhKzRCZWw2bzl3QTkyR1lOQnRobCt1MVdyODE2ZGUy?=
 =?gb2312?B?NFh5QW1ZSEdxYjlzblQxT1NuRzF2SWlSbCtNckRBQXE2RWx4c2p2TnBTcnli?=
 =?gb2312?B?QVB4K2hJZjRYYStCWXpVUC9oQVZpMFNWNDZYanlzdG02ZlR2WkdnUWwwQ3M5?=
 =?gb2312?B?bVlOcmpkNUtycmZWNUlIT0t6VTdGcnNrOTNmSmhVQjI0WjJJcVJyUW9keHVQ?=
 =?gb2312?B?QXRwdlRtZ3cvc2F1U2xET09ZTzU4S05BUTVEeWR3ZmZpdDRjOVBOemZJcGoy?=
 =?gb2312?B?MVRNeXBNV3l0djJUZUpjaW1CZTMyaG5CdzlJOTdOSGxJOHYvMVNncmV3U05v?=
 =?gb2312?B?dm84WGk2dzNMY0lxT1lnMER6WGpENnRpSnJuMUpQWDBXN1FITEY1QUw5Rm01?=
 =?gb2312?B?SUhmakVLQzVEYWNadUYvVTBMc2FkWGJiV0pkRnp3SVAzWlc1SUxrVERJZFRG?=
 =?gb2312?B?VXRNTzVtYlJKYzJpUzZUMGcyeHlkQmVveDdTRXJyblJKRzQrSDNMMmc5K21a?=
 =?gb2312?B?Z0NLdnhNOGw2TkhsdzFuc2N6dytPdHZxaHRMZlpxN1VvRXNxWUNFNXA1NndK?=
 =?gb2312?B?Y3luK2VXdnJnTHlycUw1SHI1TFd3TXhFTVBvU3RHRmlzeFg1eDBtUGxXSldV?=
 =?gb2312?B?QnZVTncxMTRJM2ZUOVFmQ1o1aWVxMmNmaXEyWHV5UlpzczQ1eVZQQSt6bUs0?=
 =?gb2312?B?QnRkdVpab0tOTE9Dc3FScEprckVKSEd2ZVhqMlNtUHhZSFlKRDkzNjczaC8x?=
 =?gb2312?B?TDc2YWxVVnJwOWhaY1NRQTlXblNnPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB10110.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(1580799027)(38070700021)(8096899003)(13003099007)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?TStjRU9QU2FxajBmYkVMaDdKMGJDM09NeXF0TCs3aG9LOW02Ry96cGlKekJL?=
 =?gb2312?B?THpnNUxRalpNUXN2WGFpTkpPajBvcStiWTdkZFBZdFFUR3FqOHU2SWRoWFdG?=
 =?gb2312?B?Qm4rRGp6QkFSano1L0hTTDNDOTVHSHBza3BpRWo5MGwzdDZ0VEhERG13Sy9K?=
 =?gb2312?B?bEFVMmVOanMyUFhqMWc1SnZlcE5BZ2tONlBBOXZGRDVNQnFZdnhqbFNMcnFt?=
 =?gb2312?B?MlFjMm15OHpnUUlDelZvVTA3Sms0UUZqLzE1R293QmhYUGplYUczUHYrN0VR?=
 =?gb2312?B?eXF5UEk1dG4vaGRYV1JQcGpDUnpxOGptTUN6L2s2NmpMK3pCQWxLNWpJUXhP?=
 =?gb2312?B?b0NKSU0xcTArRGJ6eXlEaVJsWlJIZGFRTlRHcGZKMDJCa01JVFRiWUpZVDVp?=
 =?gb2312?B?U0RoWXpxL2FGS3RmZmRVdW9jakZ1YTRVWTU3VUNneHJBd2VDNHBRWkQzVFUv?=
 =?gb2312?B?WEI2VzRpZmhaRXJ5TU9QWlR3UEtBR1cyV0tXMEQ2R2lmc0hhV0RyKy93Nm9Q?=
 =?gb2312?B?QjcvRkVncldEbzIyVDdrbnFBWEFDU2dVY3FVekJ0LzBLKzhvY1NMd0ZvTmFB?=
 =?gb2312?B?dmZQbXN4ZER6VTRNOVIreWlMNFFFUmdBeDZETDhKb3BtZ00yWmNxVVFFdVYr?=
 =?gb2312?B?R1NSRXVGUTdJMVp6U3FNdnMrL1RxeUZsd2tYRWt1SStZN3pVZkNsZzZ5bHZw?=
 =?gb2312?B?QlNTNDJYNWpLZWNPTDBmR3FGVWxTUW41UWp4TlhpckxGbXlsa1puVFJYL1lY?=
 =?gb2312?B?aGxYejZEUG9TR0tGMS80S3pqWWRWL21aUHZGOGtkZFFRZ3g2OW80RUx1UXVC?=
 =?gb2312?B?NzZXOFZoeE1jTGcrMW1OTUdwZFptbmUwSDk4OEhVa3hoWVV2ZVFTRWtxajhU?=
 =?gb2312?B?WFRoREN6NEhGbVdzeU01YU93WDlMRTZjK012WHlMaXdiSVhETDUxRUdwTC9i?=
 =?gb2312?B?M2w1VU9LZENoWUNJbzdXdHMweElMN0h1cUFLSlFUd0R1OVU1Yi9WNFdsaDM1?=
 =?gb2312?B?YzJDcTFTVW9kbEtHRGJsdXlkTHI2VjgzQTJSMlRabjR4UHpJcTdVS2pKVS9Y?=
 =?gb2312?B?bis1NElvdUgxbUo1NFFHNWFJaGVoVnNadTNnc28ra2FTRDBFQlBjSURENHNC?=
 =?gb2312?B?N1Z0VG5ZMHlVYnZZemRPUjhyaGdxS2lsWVNJUXJkREhJbU5mcEJORVlCZjAr?=
 =?gb2312?B?aHkvaHpibS8rS2crYUpnNXdjb1Y4RmN2MmM2THFaaHdXYTdkSmtJOWxKVU1X?=
 =?gb2312?B?MVpZMDlqdmtJYzJ3OUNZSEpQZUdGMjlYeFJFQnVhWUtBRnBQWW5yRDY5U2Zy?=
 =?gb2312?B?alJSaUFwZmNPdjJ2TExIdUlIL3ZpSWoza3UzdzhOa2FiWmJNTmpYemVMcFEy?=
 =?gb2312?B?M3I5dFFWZjh2cGtJbWZmV2JUWE14SlgyTEpVby9tQTJZdVRzUVFFbGdHZWpB?=
 =?gb2312?B?a2kxREtWQU1lSVdLS1k3SklkY3UrakhveHVyeUdUOTBuOThQV003Tk5CS0dI?=
 =?gb2312?B?bmFkYXZOaHhLbGR3eGhUMVh2ODUwZ0dBbGdIaDFMbFZrV096Y21iM0p4MHNR?=
 =?gb2312?B?Smx2N0E3TnpudDVjeEduTVp4bS9FRHVVbWVpL2laaWZsQ25LeEpLZk1mZmky?=
 =?gb2312?B?d0tiOVFFVkN0SUpvRFlSdmdyVGFKakFscmtKMDgxZEpGM0UrN1lqN0Q1bVpu?=
 =?gb2312?B?VjM0R1dUTytJWDFoZWdOV2JUcUdvQ2F2WVBKSThBZnVrSXVIcGlNSmdTdDBr?=
 =?gb2312?B?cWt6ZjFCcWlsei9KR2t5NUdNeXJsSEx6RGxCd1E0UUFZZ3hUejNiWTJjZHVH?=
 =?gb2312?B?NnhyVnF6OEFKWGh4UFF5azN6MGtYbUgrTy9wSmc3a2lXdmFIVU9pRGVFeEFH?=
 =?gb2312?B?NHA0ZGp0Nm9oSFk5MUt6cjRPQkJreVRYNmNFa0IrNTMxY3RmK0ltckh3U2Rw?=
 =?gb2312?B?Q2xYVUk2RzdqR3owTnlUZGpBeWVoTUJDU0t5ZjZ5Q3RUd1h6YkpVbzRTWTRH?=
 =?gb2312?B?bFp4aXBzK2Y4RUhDVGZqOGhpdE5XaFRDTDJvVXJyZGl6cmdLRFpIV2RiZkJP?=
 =?gb2312?B?SWN5ZnVPQUpDMGxRWVArQnRPQXRRMVdwY3NGYlZpQU9BQVhXT1Y2WDE4eUwy?=
 =?gb2312?B?enlkMWEzWGhFU0pQczhiUW16QnVTeTIxWVl6bUo1RG8vT0RBbHQrNFBsbmlz?=
 =?gb2312?B?M05yQTQxYkNubHNFazN4MnUzZnkwd1RnTmkrRUc3Y1FxR0pMZUtVbGVzZmVG?=
 =?gb2312?B?RXR0ZmF2NEsxNXdkajZXcytLVFVtMVlTaG9OYWhnQThiNzZWdkRKQittQ0Zs?=
 =?gb2312?B?T01TYy91TCtoUEpZMUZlNGsxaVlQVTlYWis3bzNhL2h2WWZYWm1pZz09?=
Content-Type: multipart/alternative;
	boundary="_000_TY3PR01MB1011047D7A09F29839168E5D19B74ATY3PR01MB10110jp_"
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB10110.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b27898a-77ba-4ec1-2dbd-08de73592b0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2026 03:59:54.4580
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R6+4HB+0hQrXnMB0Ieng9NarXgCoRae2i9F4CJmgLqUHQbwfla/klrP2Cbe/9EX+dScW95vdJlyElYn4I2OS2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12511
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Feb 2026 04:00:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124570

--_000_TY3PR01MB1011047D7A09F29839168E5D19B74ATY3PR01MB10110jp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

cGluZw0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCreivP7Iyzogb3BlbmVtYmVk
ZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnPiC0+rHtIFlpZGluZyBMaXUgKEZ1aml0c3UpIHZpYSBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnIDxsaXV5ZC5mbnN0PWZ1aml0c3UuY29tQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmc+DQq3osvNyrG85DogMjAyNsTqMtTCMsjVIDA5OjM4DQrK1bz+yMs6IG9wZW5lbWJlZGRl
ZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZz4NCtb3zOI6IFtvZV1bbWV0YS1weXRob25dW1BBVENIXSBweXRob24z
LWFwcGRpcnM6QWRkIEhPTUVQQUdFDQoNCkFkZCBIT01FUEFHRSBpbiBweXRob24zLWFwcGRpcnMu
DQoNClNpZ25lZC1vZmYtYnk6IExpdSBZaWRpbmcgPGxpdXlkLmZuc3RAZnVqaXRzdS5jb20+DQot
LS0NCiBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWFwcGRpcnNf
MS40LjQuYmIgfCAxICsNCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCg0KZGlmZiAt
LWdpdCBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYXBwZGly
c18xLjQuNC5iYiBiL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
YXBwZGlyc18xLjQuNC5iYg0KaW5kZXggYmVlMGI3ZDgxNS4uYzAyN2U4MGIyOCAxMDA2NDQNCi0t
LSBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYXBwZGlyc18x
LjQuNC5iYg0KKysrIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1hcHBkaXJzXzEuNC40LmJiDQpAQCAtMSw0ICsxLDUgQEANCiBTVU1NQVJZID0gIkEgc21hbGwg
UHl0aG9uIG1vZHVsZSBmb3IgZGV0ZXJtaW5pbmcgYXBwcm9wcmlhdGUgKyBwbGF0Zm9ybS1zcGVj
aWZpYyBkaXJzLCBlLmcuIGEgdXNlciBkYXRhIGRpci4iDQorSE9NRVBBR0UgPSAiaHR0cHM6Ly9n
aXRodWIuY29tL0FjdGl2ZVN0YXRlL2FwcGRpcnMiDQogTElDRU5TRSA9ICJNSVQiDQogTElDX0ZJ
TEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS50eHQ7bWQ1PTMxNjI1MzYzYzQ1ZWIwYzY3YzYz
MGEyZjczZTQzOGU0Ig0KDQotLQ0KMi40My4wDQoNCg==

--_000_TY3PR01MB1011047D7A09F29839168E5D19B74ATY3PR01MB10110jp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
ping</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>=B7=A2=BC=FE=C8=CB:</b> openemb=
edded-devel@lists.openembedded.org &lt;openembedded-devel@lists.openembedde=
d.org&gt; =B4=FA=B1=ED Yiding Liu (Fujitsu) via lists.openembedded.org &lt;=
liuyd.fnst=3Dfujitsu.com@lists.openembedded.org&gt;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> 2026=C4=EA2=D4=C22=C8=D5 09:38<br>
<b>=CA=D5=BC=FE=C8=CB:</b> openembedded-devel@lists.openembedded.org &lt;op=
enembedded-devel@lists.openembedded.org&gt;<br>
<b>=D6=F7=CC=E2:</b> [oe][meta-python][PATCH] python3-appdirs:Add HOMEPAGE<=
/font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Add HOMEPAGE in python3-appdirs.<br>
<br>
Signed-off-by: Liu Yiding &lt;liuyd.fnst@fujitsu.com&gt;<br>
---<br>
&nbsp;meta-python/recipes-devtools/python/python3-appdirs_1.4.4.bb | 1 +<br=
>
&nbsp;1 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/python3-appdirs_1.4.4.bb b=
/meta-python/recipes-devtools/python/python3-appdirs_1.4.4.bb<br>
index bee0b7d815..c027e80b28 100644<br>
--- a/meta-python/recipes-devtools/python/python3-appdirs_1.4.4.bb<br>
+++ b/meta-python/recipes-devtools/python/python3-appdirs_1.4.4.bb<br>
@@ -1,4 +1,5 @@<br>
&nbsp;SUMMARY =3D &quot;A small Python module for determining appropriate +=
 platform-specific dirs, e.g. a user data dir.&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/ActiveState/appdirs">http=
s://github.com/ActiveState/appdirs</a>&quot;<br>
&nbsp;LICENSE =3D &quot;MIT&quot;<br>
&nbsp;LIC_FILES_CHKSUM =3D &quot;<a href=3D"file://LICENSE.txt;md5=3D316253=
63c45eb0c67c630a2f73e438e4">file://LICENSE.txt;md5=3D31625363c45eb0c67c630a=
2f73e438e4</a>&quot;<br>
&nbsp;<br>
-- <br>
2.43.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_TY3PR01MB1011047D7A09F29839168E5D19B74ATY3PR01MB10110jp_--


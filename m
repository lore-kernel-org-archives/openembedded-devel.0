Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45525D3B7DE
	for <webhook@archiver.kernel.org>; Mon,  8 Dec 2025 10:13:51 +0000 (UTC)
Received: from TY3P286CU002.outbound.protection.outlook.com (TY3P286CU002.outbound.protection.outlook.com [52.101.229.8])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5264.1765188823260429746
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Dec 2025 02:13:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=K4S2fqSw;
 spf=pass (domain: fujitsu.com, ip: 52.101.229.8, mailfrom: liuyd.fnst@fujitsu.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t8jCzcVNqJnbjQYguz1ATzXtdg9RPN6t2vgHhi26Brzoz9oXwmgQYyqM1ckhJ/WzdgEN4gSZw02CP/T8WacWsrwZwfb16yOhtFKAfzdZrvYiydL7Ms/VrcCAHjU+QO2c4VOntm5xqR4h7v3yadlshZ9TtPTurjtYWGz66olLcuQY5NtTVoYjkamGMF3LIcxCraZ8jVqMKglGGH4us+RPlYgW3Fif7PvepV4+t8bgDOZ5H2RuHLaYtRbUn1Ip3OFI7zvORqOJbmzV7PE1ZHq0YYsvQ7Dj65whfLp//bsqbdf7rXkR1jlQMIFB/ZQJJFFXa8YckutcD1elG1siLB9BGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RwOGEFT9GtxToEF/PAAwpjxpgVqruYlpQkRMS++YMEQ=;
 b=g3UAXvr65aV81jGeTY1cg9rM/WNKSSLP8Q+M1RPFPM75OpyNZPnqw/YbN3ZhKrMLYQ8t4FYg5gM41TOjYh1VxjQJuLn2zLt6awxXB745dYUXVe6djBgGyTZ1Fwm8YZUti1ck7UVZv+AmrWlBSwawhbJFVR+97wVHmVcD/9HR6+2xjBzzOJvonts3msAlbGrAL5tO5VU6QOZDWvzkMXRHIosG/q7dntoVP71L5t5UjT5quUm08tBBPt7FusKtf8U2dMkPO2PefZdNiIUAORNhM06rhhuzq5c9PMH4U7kvC/IlALdLD5C3Z7ifovHWudJ+zHzyVdMQWc8Thm6JZD3Bxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RwOGEFT9GtxToEF/PAAwpjxpgVqruYlpQkRMS++YMEQ=;
 b=K4S2fqSwbAjCEBXDCZ6oMpsLjXeQQpMAX9YFbc66hXfdZz4jG9u+P3ldzI1ibsa68MRGzKhzUikgifG2Zr74kJr+a2Gbg2stdiE0dezupnxIwphk/2q5NN1/x9LrqBpXsk/RazDwUjR5mSO18V/Q/rR2vkqFZ3FW0v5jczIihv2PdE5HeVSV94fXzltLlSsP0ubhCB5EyY1hFeFaGeIKWjFTntgAaLtPY9OuTgANhXU4l4dBWuRnbSb1QvAZvtsrCRUTmCrIv0ZwcUsmaAimoompVdRvS4MEIIangpyK3STfUo1D3OiwBC3RY8hhIqujink4OJK5CLYB8M16QhWrAw==
Received: from TY3PR01MB11483.jpnprd01.prod.outlook.com
 (2603:1096:400:3dd::13) by TY4PR01MB13884.jpnprd01.prod.outlook.com
 (2603:1096:405:1fb::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Mon, 8 Dec
 2025 10:13:38 +0000
Received: from TY3PR01MB11483.jpnprd01.prod.outlook.com
 ([fe80::46cb:b462:44ea:9163]) by TY3PR01MB11483.jpnprd01.prod.outlook.com
 ([fe80::46cb:b462:44ea:9163%6]) with mapi id 15.20.9412.005; Mon, 8 Dec 2025
 10:13:38 +0000
From: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
To: Gyorgy Sarvari <skandigraun@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: 
 =?gb2312?B?u9i4tDogW29lXVttZXRhLWdub21lXVtQQVRDSCAyLzJdIGdub21lLWNvbnRy?=
 =?gb2312?Q?ol-center:_upgrade_48.3_->_49.2.2?=
Thread-Topic: [oe][meta-gnome][PATCH 2/2] gnome-control-center: upgrade 48.3
 -> 49.2.2
Thread-Index: AQHcaCicGDRQ7qLmbEavVwiJXxVyhbUXhfkT
Date: Mon, 8 Dec 2025 10:13:38 +0000
Message-ID: 
 <TY3PR01MB114830BFED9BC1A66BD20D9D19BA2A@TY3PR01MB11483.jpnprd01.prod.outlook.com>
References: <20251208091300.21039-1-liuyd.fnst@fujitsu.com>
 <83e4a981-fdaf-47ec-9f4d-a8e05b3513e9@gmail.com>
In-Reply-To: <83e4a981-fdaf-47ec-9f4d-a8e05b3513e9@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2025-12-08T10:13:37.693Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11483:EE_|TY4PR01MB13884:EE_
x-ms-office365-filtering-correlation-id: a0f9fb07-5424-4f2e-d66e-08de36427484
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|4022899009|38070700021|13003099007|7053199007|1580799027|8096899003;
x-microsoft-antispam-message-info: 
 =?gb2312?B?TDZhbWx6QnhIc1ZtYlpTTFhodlh0cjZzNlFYRyswWDNlWXB4SFFHdnhxbmNy?=
 =?gb2312?B?UWxQZnJ5RUNvdXRwUGVuM2RHU0Vja1JkSVpYWHRrOGF6NEJqbXlWQjJ6WHlv?=
 =?gb2312?B?ZWltVDZVSHBUako3a3g4UFVNbUk3cTZmTS9WeVZIZFFXQUdQUFV5ZzFRb2lK?=
 =?gb2312?B?dGtWSFgzMGpFbWJROC9PU2MyK1J0RU1jZFpYdDZoRUg0Vy84ZEpNdVhuN0p1?=
 =?gb2312?B?a3JNdVZBZm0xTXNJOWZyVDcyUVYySkRnaW9XY1FTcVNvTFdrUG1tMlZoU2Nx?=
 =?gb2312?B?RE45TW1qVEdHelIrdlc5VmpGVzRYOTVLR3lmSnNLSmFSdEtHMjVOMWliSkRy?=
 =?gb2312?B?QnMyMU84enVaVG04dm9JMmpHQUZMTC9lckNCMUNscmpBUlVvMkdVaGh4V0FI?=
 =?gb2312?B?cVhLdUFDMitSdnFsOVAyelBTOWgxVUo4bFNobEhnWHRmN2JLb0RiSGlYbDlO?=
 =?gb2312?B?UlFGZWY5dklYNU1rR1gyUjRnTGp5SFplb0IvbERsMk5rY0ViWGtFQlIwV2NT?=
 =?gb2312?B?U3B5ditOM3Q2K3V4dTZTOEdNamxSQ1MwSjZtbm55Ukh6RFpRMkppK2hzQyta?=
 =?gb2312?B?RXdtMnlIcVBrYUViSmJFQ1RaRGhvSVRtQXRCWGRsMDU0Zkw1MzRTdjd2NGgr?=
 =?gb2312?B?MWNXOVRnZ2RlUkJQNkNjb2VnOUtIVHo1SU5yb0k3M0RBRnhnWUl2bnAxakJh?=
 =?gb2312?B?MUNOc2M0cXdCS0VBcGtQZUZDUU1CUFlqalJrT0hqcUFxaGcrU21CbVdXMFpF?=
 =?gb2312?B?Ukk5aWhRTmY2VVJhakZMRTN3R1V1LzV1MnlGNHV4NzU1Wk9DdXF3WHRERmtk?=
 =?gb2312?B?ZnFWNVNBOUV4TVJKaTd1YmlHdHBVUVFJNU5OWnMvOG5PNE9kYmMreWJsUkho?=
 =?gb2312?B?dzhVMjJrM3VZNjBPRVIrS0hsWTVxNlRrcEFqNStacllJRHRoMTIvalIrTjFC?=
 =?gb2312?B?S0FyLzY5R1VaZlVuQnlUS2dhS3FKR2F4V0hzM3pwUWxRbURIWjVxV1N1Mkwv?=
 =?gb2312?B?Z3gyRExEYTNTYmd1VGRSa1VPMzN0cDAwRHJyRWIwd3RDaW81OFhHeTJDSit5?=
 =?gb2312?B?aUhLMEI1REpQWmZZaXFpNW5OUHp1WTloZE83UFh5WTRQVzh0YWNSTjYrWkpU?=
 =?gb2312?B?aEF5OEk2YXdMdWdFMTNRMjZXTStkbGpXTUpRWnVFSHdBNlBlZHN1bFFSZG1F?=
 =?gb2312?B?R2RPWTlIUkJJS3JOWVZjRThUbTQyclNYTTRqSWxiRDU2djZRMjhQTkFzT1JN?=
 =?gb2312?B?cWthNysxdlFWbmcyYi90VG5tUEVRN0NiN2xabVI0Mlh1VmhkUjliOUtpRjFl?=
 =?gb2312?B?Yjk2TkhxTkZlN01yYUhRUTRzamhVakNXSW0vcllXK0Z4bDQvUUlWZUdMKzdu?=
 =?gb2312?B?MlZUeTNRa1dHckRDb2VKZWdka3hKdnpwUjBINVFpNktVa3V1U3VoRGVuVlFG?=
 =?gb2312?B?REkyU2NYMWJoeDNsT0FqSVE2QmdUK042Q3RnNFdnM1drRjNVYWFMRVhaZk9x?=
 =?gb2312?B?dDNCZDN6Q0ZiVW9KeGFHbzRDZkZ5MjNrUGphVFRNZjJLYWwyUHJRdGdGSU5F?=
 =?gb2312?B?Zy9mdS9WZ2lxRXZjZnY1TGk1TSttQVBDMjIrb1JKR1VuYVgvZUdxY2NuY1ZO?=
 =?gb2312?B?T1d4My9EUVZDYk9FYXZQc3ZhalpOT2NjQmdWWE50U3VQdnJEVk5FK29sN0pv?=
 =?gb2312?B?YkhkREkrS1M0cTY4RUZJNmRqQ25CZ0Z6ZmxuUFdFUVJOTytCM21lTkMybUNY?=
 =?gb2312?B?cjhYZ1VHK2U4MmpkQ29QUGcrTzQ4Z3pORGJkamVXYzlkZm9xVVZBRlJHLzAx?=
 =?gb2312?B?dC9mcEpRbHN0ZFV6cnRHQytlSm5LZXQ0ZU9qbjdKT0RPQ25BNERialBpWjRP?=
 =?gb2312?B?Y0RVQm5kbGJjclBxUVhnUzRmam1TeTNnNzdIelh5UWZYRy9uQmJ4ME8wak9Y?=
 =?gb2312?B?dksvc1QvZFBkUUwvajR5TmFHN1NqV2Rmb1N1Rm5ML1FlQ0tFNHowNmdJcHI3?=
 =?gb2312?Q?5klKP5gteac3btMuaKI705GIRVETa8=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11483.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4022899009)(38070700021)(13003099007)(7053199007)(1580799027)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?RXVLd1dUMnF0bTRRUHpIYXIxak5uOTJLWEVHNXM5d1lpSi9wamYzcE5wdVNH?=
 =?gb2312?B?VzZBMTlMQ1U5WG56YzdrOThjNkFYakJNbEoxL3dHcXdwemdQT2lTenFFTjkx?=
 =?gb2312?B?cUpsM1J1aGV1Z3lKR0kyamcxUFFiWjR5UzY3MTQ1aG1kaWs1b0o5SUtyKzBT?=
 =?gb2312?B?d0oxbjRQQ1FOVk0wS0R3N0lQWnNKTnJXVUpHalZlQ3dieEk5SWJZYWZWVGJ6?=
 =?gb2312?B?VGpQL1FCV2lPVzNHaWZDR2Z6ekNWaDJJQ0pZdnNuQzlDbGFaZStramppTXpx?=
 =?gb2312?B?MHZFRG9Gb2Z5c1FkbEFaZlNMTGVGSCtRdEw4Z3FrOHVaUEpkMG5zakFrYit2?=
 =?gb2312?B?QjhGbGtFOUdMT3QzMHNGNUhacWhOYWVyZnE0bXpnU1FBUUdKdUNoQ3hTcEJU?=
 =?gb2312?B?UU43ai90blVNeE1Ua0JiakJpVkNTMThmYVMxcWYwQUNiMVVBYWZnMlJRd0o2?=
 =?gb2312?B?b05JTDQ3NUdyLzBpak5VbDF1ZmhlSTZKaDhOSXJxZm94dFFYa0RFZHRqdlk2?=
 =?gb2312?B?TGZ3MlM3YzdtYlRTMnB0OW9QbjhxWWlya0NPREgvZHdFcWJzTCtyQytiY0l0?=
 =?gb2312?B?eTlXbk1nMlBOLzZIdE51ZzFqVUZjMmtGNUtVR2FzTlZSaW1jaHZUWjJKOWkz?=
 =?gb2312?B?T0xQdjk2ZlcvSVhTRmkyMDRvTDgvb21VR0pOZDdsdG02bWYxWTZGMzN1TGFE?=
 =?gb2312?B?WHY0amViZzZYWkRWaVZ1eHl5NUtOTVd3NVhJQlU5ZzEwRHYwV2RyTFkvTjlu?=
 =?gb2312?B?SkhwWVpBTDRnbWh2K0tsL3g4T0EzTWdIVHh3VzVnY1hMekhmZXAva3dwRlJK?=
 =?gb2312?B?OFFYZnNQWkxoU0crd3JuRWxDMlo5eStDVEFIeGdtb0c3TFN6ekFWZ0tobmgy?=
 =?gb2312?B?WTBlK2FLd2RsOU8razRrenFHS0VKL1Z1Uk45M0lid3NqSkhHcjRvUFBYQmZp?=
 =?gb2312?B?VFZKalVUaS9EM2s5aHBwYjhUUlgxUHZGeUR5RlJZWjdONUVkNFl4VS9wVi9p?=
 =?gb2312?B?blBrQnU3RkZvNUpsR3l4c3FDMkNuT0hnbzhqV2JISXlDbWRKVWtvakU2Y2ZZ?=
 =?gb2312?B?VllpWjhubTJRL0xDVkFIZ0lpaE16TjlrMXJtdk13V3pGY0ZZS1FPOTRJVmhV?=
 =?gb2312?B?UFhnOHkrM0ZHNGUyWisrbGhzOXdBeHo5ODY2S3cwQ1lmeW9VR1EzaWRtTkg3?=
 =?gb2312?B?MDhFVzFmTWo1VVEybUowZUJxK3QxQS9WSjRWYUUzYXBSNUc3cXV0N0dzQ3FW?=
 =?gb2312?B?Wk9KeTFRelhodWNQSisvSExUWDg2L0RnaTV2MkRnUmtiYWluTWc3elZObjF5?=
 =?gb2312?B?VHNUQUxIVjR5WkdvWnhZSWJ3MXJUUlptTkxhUHlUd3QxZ2dhbmJzMk9HOTZF?=
 =?gb2312?B?SGJ0ODVXbys1N0sxWWZhbGJoUmQvaVpNU08xNFg5ZDNGSFZodXJreFlIeG1E?=
 =?gb2312?B?S2ZEeDJDVjhIazhmWnE1cHFzS0E5NDVQV1p1Wk1PV2k3NFhjWlZNdEVSQlZL?=
 =?gb2312?B?TFMwZVhzUTJBbFNIZXhsZmtRQWprTHB5RjYxb21JcGJqVVRqbmJDTjNlSEdl?=
 =?gb2312?B?VHliNkMyM0dXRDRtOHJDa2hqbHVyeW0xZnNVYVhnLzBHL1FWUGMwL2N3L2du?=
 =?gb2312?B?cm9QTkdpWXFSRXdEdFNQcmR4czByNXdwNGxOZ2pZKzhSUWtobXNuSDcwak5x?=
 =?gb2312?B?SVVDVGN6TGcvYXB6bHdZYnpzdmNLY0pNZ2MrSkp6TmNQaC9uR0gvK3h0TTBy?=
 =?gb2312?B?cmFtU3ZqSTQ0QThZZkRHOFpNZEhNM0N2U1ovMlpUTkZ2aWpsWmZHVU4rNXNF?=
 =?gb2312?B?RHFTN083eWtycWNoT1dSUUgzWmVuaVNKR1kyem9RY296VWdOQjE1VFVVemdN?=
 =?gb2312?B?ZVV4M3lsTW8vcHkzRzB5MFdFWllTNWJpRnFPRkFlWXpOdEE1N0w1Z2NXdUt5?=
 =?gb2312?B?d0hpUTdwNUw3VU1nbERJSzVIdkdZTy9sVEU0dmJnTnBCeStvTkZEclBnUjlS?=
 =?gb2312?B?bFdOOWU3ekZzQ2d3SUJ2MlRwTTROL21oTUM4R2p6QVNzWDNiNCttb3gyWG9W?=
 =?gb2312?B?Mzkzcjl5ZW02R1NvdGY5M3NzSzlBOVV3M2ZlUVlUeERXSVlYN3dWS0R2ZERi?=
 =?gb2312?Q?VkQXLsUv0+4WQHpBae54xwC1P?=
Content-Type: multipart/alternative;
	boundary="_000_TY3PR01MB114830BFED9BC1A66BD20D9D19BA2ATY3PR01MB11483jp_"
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11483.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0f9fb07-5424-4f2e-d66e-08de36427484
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2025 10:13:38.3299
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aGtVaFTwI6GzTND+LlxfUMGBXT7K653Q2se8mcr7eaV/ZdZ0l992hFdfzkgQ2XN+MXpcmxuGh3IscM1gfHP4TA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13884
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Dec 2025 10:13:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122374

--_000_TY3PR01MB114830BFED9BC1A66BD20D9D19BA2ATY3PR01MB11483jp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgU2FydmFyaQ0KICAgIFNvIG1heWJlIEkgc2hvdWxkIHVwZ3JhZGUgZ25vbWUtY29udHJvbC1j
ZW50ZXIgdG8gNDkuMj8NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQq3orz+yMs6
IEd5b3JneSBTYXJ2YXJpIDxza2FuZGlncmF1bkBnbWFpbC5jb20+DQq3osvNyrG85DogMjAyNcTq
MTLUwjjI1SAxNzo1NA0KytW8/sjLOiBMaXUsIFlpZGluZy/B9SDS0rahIDxsaXV5ZC5mbnN0QGZ1
aml0c3UuY29tPjsgb3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPG9w
ZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPg0K1vfM4jogUmU6IFtvZV1b
bWV0YS1nbm9tZV1bUEFUQ0ggMi8yXSBnbm9tZS1jb250cm9sLWNlbnRlcjogdXBncmFkZSA0OC4z
IC0+IDQ5LjIuMg0KDQpEb2Vzbid0IGdub21lLWNvbnRyb2wtY2VudGVyIGZvbGxvdyBhbiAib2Rk
LXZlcnNpb25zLWFyZS11bnN0YWJsZSINCnZlcnNpb25pbmcgcGF0dGVybiwgbWFraW5nIHRoaXMg
dmVyc2lvbiB0byBiZSBraW5kYS1iZXRhPw0KDQpPbiAxMi84LzI1IDEwOjEzLCBZaWRpbmcgTGl1
IChGdWppdHN1KSB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4gQ2hhbmdlbG9n
Og0KPiAtIFJldmVydCBsaWJneGRwIHVwZGF0ZXMNCj4NCj4gICBUaGUgbGliZ3hkcCB1cGRhdGVz
IGRlcGVuZCBvbiBjaGFuZ2VzIGluIGdzZXR0aW5ncy1kZXNrdG9wLXNjaGVtYXMNCj4gICB0aGF0
IGFyZSBwYXJ0IG9mIHRoZSBHTk9NRSA1MCBjeWNsZS4gUmV2ZXJ0IHRoZSBwaW5uZWQgcmVmDQo+
ICAgdG8gdGhlIG9uZSB3ZSBoYWQgYmVmb3JlLCB1bnRpbCB3ZSBicmFuY2ggbGliZ3hkcCBmb3Ig
R05PTUUgNDkuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IExpdSBZaWRpbmcgPGxpdXlkLmZuc3RAZnVq
aXRzdS5jb20+DQo+IC0tLQ0KPiAgLi4ubC1jZW50ZXJfNDguMy5iYiA9PiBnbm9tZS1jb250cm9s
LWNlbnRlcl80OS4yLjIuYmJ9IHwgMTAgKysrKysrKy0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDcg
aW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gIHJlbmFtZSBtZXRhLWdub21lL3JlY2lw
ZXMtZ25vbWUvZ25vbWUtY29udHJvbC1jZW50ZXIve2dub21lLWNvbnRyb2wtY2VudGVyXzQ4LjMu
YmIgPT4gZ25vbWUtY29udHJvbC1jZW50ZXJfNDkuMi4yLmJifSAoNzklKQ0KPg0KPiBkaWZmIC0t
Z2l0IGEvbWV0YS1nbm9tZS9yZWNpcGVzLWdub21lL2dub21lLWNvbnRyb2wtY2VudGVyL2dub21l
LWNvbnRyb2wtY2VudGVyXzQ4LjMuYmIgYi9tZXRhLWdub21lL3JlY2lwZXMtZ25vbWUvZ25vbWUt
Y29udHJvbC1jZW50ZXIvZ25vbWUtY29udHJvbC1jZW50ZXJfNDkuMi4yLmJiDQo+IHNpbWlsYXJp
dHkgaW5kZXggNzklDQo+IHJlbmFtZSBmcm9tIG1ldGEtZ25vbWUvcmVjaXBlcy1nbm9tZS9nbm9t
ZS1jb250cm9sLWNlbnRlci9nbm9tZS1jb250cm9sLWNlbnRlcl80OC4zLmJiDQo+IHJlbmFtZSB0
byBtZXRhLWdub21lL3JlY2lwZXMtZ25vbWUvZ25vbWUtY29udHJvbC1jZW50ZXIvZ25vbWUtY29u
dHJvbC1jZW50ZXJfNDkuMi4yLmJiDQo+IGluZGV4IGQ4ZDU4NDk1MzQuLjliYjAyMjhkNTAgMTAw
NjQ0DQo+IC0tLSBhL21ldGEtZ25vbWUvcmVjaXBlcy1nbm9tZS9nbm9tZS1jb250cm9sLWNlbnRl
ci9nbm9tZS1jb250cm9sLWNlbnRlcl80OC4zLmJiDQo+ICsrKyBiL21ldGEtZ25vbWUvcmVjaXBl
cy1nbm9tZS9nbm9tZS1jb250cm9sLWNlbnRlci9nbm9tZS1jb250cm9sLWNlbnRlcl80OS4yLjIu
YmINCj4gQEAgLTMyLDE5ICszMiwyMiBAQCBERVBFTkRTID0gIiBcDQo+ICAgICAgdWRpc2tzMiBc
DQo+ICAgICAgdXBvd2VyIFwNCj4gICAgICAke0AnIGxpYnhzbHQtbmF0aXZlIGRvY2Jvb2steHNs
LXN0eWxlc2hlZXRzLW5hdGl2ZScgaWYgZC5nZXRWYXIoJ0dJRE9DR0VOX0VOQUJMRUQnKSA9PSAn
VHJ1ZScgZWxzZSAnJ30gXA0KPiArICAgIGJsdWVwcmludC1jb21waWxlci1uYXRpdmUgXA0KPiAg
Ig0KPg0KPiAgaW5oZXJpdCBndGstaWNvbi1jYWNoZSBwa2djb25maWcgZ25vbWViYXNlIGdzZXR0
aW5ncyBnZXR0ZXh0IGdpLWRvY2dlbiB1cHN0cmVhbS12ZXJzaW9uLWlzLWV2ZW4gYmFzaC1jb21w
bGV0aW9uIGZlYXR1cmVzX2NoZWNrDQo+DQo+ICBSRVFVSVJFRF9ESVNUUk9fRkVBVFVSRVMgKz0g
Im9wZW5nbCBwb2xraXQgcHVsc2VhdWRpbyBzeXN0ZW1kIHgxMSINCj4NCj4gK1NSQ19VUkkgPSAi
aHR0cHM6Ly9kb3dubG9hZC5nbm9tZS5vcmcvc291cmNlcy9nbm9tZS1jb250cm9sLWNlbnRlci8k
e0BvZS51dGlscy50cmltX3ZlcnNpb24oJyR7UFZ9JywgMSl9L2dub21lLWNvbnRyb2wtY2VudGVy
LSR7UFZ9LnRhci54eiINCj4gK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJjMjNhZTIyMGQ2YzEyMzdk
Mjg1OTI1ZGU3ODAxZTBlMzYzMzhiOWNjMWE4YmI1MWMyZTM3ZTcxNWU2YjUwM2FkIg0KPiArDQo+
ICBTUkNfVVJJICs9ICJmaWxlOi8vMDAwMS1BZGQtbWVzb24tb3B0aW9uLXRvLXBhc3Mtc3lzcm9v
dC5wYXRjaCINCj4gLVNSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gImMwNjk4MjQ1YTY0MjBi
YWRkMDc3YzE2ZmZiMjE4ODYwZTQ1N2NkNzMwMDYxMjcxOGVhYmY5YWJhNDcyMjJiYWUiDQo+DQo+
IC1QQUNLQUdFQ09ORklHID8/PSAiaWJ1cyAke0BiYi51dGlscy5maWx0ZXIoJ0RJU1RST19GRUFU
VVJFUycsICd3YXlsYW5kJywgZCl9Ig0KPiArUEFDS0FHRUNPTkZJRyA/Pz0gImlidXMgJHtAYmIu
dXRpbHMuZmlsdGVyKCdESVNUUk9fRkVBVFVSRVMnLCAneDExJywgZCl9Ig0KPiAgUEFDS0FHRUNP
TkZJR1tjdXBzXSA9ICIsLGN1cHMsY3VwcyBzeXN0ZW0tY29uZmlnLXByaW50ZXIgY3Vwcy1way1o
ZWxwZXIiDQo+ICBQQUNLQUdFQ09ORklHW2lidXNdID0gIi1EaWJ1cz10cnVlLCAtRGlidXM9ZmFs
c2UsIGlidXMiDQo+IC1QQUNLQUdFQ09ORklHW3dheWxhbmRdID0gIi1Ed2F5bGFuZD10cnVlLCAt
RHdheWxhbmQ9ZmFsc2UsIHdheWxhbmQiDQo+ICtQQUNLQUdFQ09ORklHW3gxMV0gPSAiLUR4MTE9
dHJ1ZSwgLUR4MTE9ZmFsc2UsIHZpcnR1YWwvbGlieDExIg0KPiAgUEFDS0FHRUNPTkZJR1tmaWxl
LXNoYXJlXSA9ICIsLCxnbm9tZS11c2VyLXNoYXJlIg0KPiAgUEFDS0FHRUNPTkZJR1ttZWRpYS1z
aGFyZV0gPSAiLCwscnlnZWwtbWV0YSB0dW1ibGVyIg0KPiAgUEFDS0FHRUNPTkZJR1ttYWxjb250
ZW50XSA9ICItRG1hbGNvbnRlbnQ9dHJ1ZSwtRG1hbGNvbnRlbnQ9ZmFsc2UsbWFsY29udGVudCxt
YWxjb250ZW50LXVpIg0KPiBAQCAtNTQsNiArNTcsNyBAQCBFWFRSQV9PRU1FU09OICs9ICItRG9l
X3N5c3Jvb3Q9JHtTVEFHSU5HX0RJUl9IT1NUfSINCj4gIEdJRE9DR0VOX01FU09OX09QVElPTiA9
ICdkb2N1bWVudGF0aW9uJw0KPg0KPiAgZXhwb3J0IFhER19EQVRBX0RJUlMgPSAiJHtTVEFHSU5H
X0RBVEFESVJ9Ig0KPiArZXhwb3J0IEdJX1RZUEVMSUJfUEFUSCA9ICIke1JFQ0lQRV9TWVNST09U
fSR7bGliZGlyfS9naXJlcG9zaXRvcnktMS4wIg0KPg0KPiAgRklMRVM6JHtQTn0gKz0gIiBcDQo+
ICAgICAgJHtkYXRhZGlyfS9kYnVzLTEgXA0KPg0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0K
PiBMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4g
Vmlldy9SZXBseSBPbmxpbmUgKCMxMjIzNzEpOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5v
cmcvZy9vcGVuZW1iZWRkZWQtZGV2ZWwvbWVzc2FnZS8xMjIzNzENCj4gTXV0ZSBUaGlzIFRvcGlj
OiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQvMTE2NjczMDcyLzYwODQ0NDUNCj4g
R3JvdXAgT3duZXI6IG9wZW5lbWJlZGRlZC1kZXZlbCtvd25lckBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnDQo+IFVuc3Vic2NyaWJlOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVu
ZW1iZWRkZWQtZGV2ZWwvdW5zdWIgW3NrYW5kaWdyYXVuQGdtYWlsLmNvbV0NCj4gLT0tPS09LT0t
PS09LT0tPS09LT0tPS0NCj4NCg0K

--_000_TY3PR01MB114830BFED9BC1A66BD20D9D19BA2ATY3PR01MB11483jp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"text-align: left; text-indent: 0px; line-height: 37px; white-=
space: nowrap; margin: 0px 0px 4px; font-family: Aptos, Aptos_EmbeddedFont,=
 Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; colo=
r: rgb(0, 0, 0);" class=3D"elementToProof">
Hi Sarvari</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif;" class=3D"elementToProof">
<span style=3D"font-size: 12pt; color: rgb(0, 0, 0);">&nbsp; &nbsp; So mayb=
e I should upgrade
</span><span style=3D"font-size: 11pt; color: rgb(0, 0, 0);">gnome-control-=
center to 49.2?</span></div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>=B7=A2=BC=FE=C8=CB:</b> Gyorgy =
Sarvari &lt;skandigraun@gmail.com&gt;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> 2025=C4=EA12=D4=C28=C8=D5 17:54<br>
<b>=CA=D5=BC=FE=C8=CB:</b> Liu, Yiding/=C1=F5 =D2=D2=B6=A1 &lt;liuyd.fnst@f=
ujitsu.com&gt;; openembedded-devel@lists.openembedded.org &lt;openembedded-=
devel@lists.openembedded.org&gt;<br>
<b>=D6=F7=CC=E2:</b> Re: [oe][meta-gnome][PATCH 2/2] gnome-control-center: =
upgrade 48.3 -&gt; 49.2.2</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Doesn't gnome-control-center follow an &quot;odd-v=
ersions-are-unstable&quot;<br>
versioning pattern, making this version to be kinda-beta?<br>
<br>
On 12/8/25 10:13, Yiding Liu (Fujitsu) via lists.openembedded.org wrote:<br=
>
&gt; Changelog:<br>
&gt; - Revert libgxdp updates<br>
&gt;<br>
&gt;&nbsp;&nbsp; The libgxdp updates depend on changes in gsettings-desktop=
-schemas<br>
&gt;&nbsp;&nbsp; that are part of the GNOME 50 cycle. Revert the pinned ref=
<br>
&gt;&nbsp;&nbsp; to the one we had before, until we branch libgxdp for GNOM=
E 49.<br>
&gt;<br>
&gt; Signed-off-by: Liu Yiding &lt;liuyd.fnst@fujitsu.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; ...l-center_48.3.bb =3D&gt; gnome-control-center_49.2.2.bb} | 10=
 +++++++---<br>
&gt;&nbsp; 1 file changed, 7 insertions(+), 3 deletions(-)<br>
&gt;&nbsp; rename meta-gnome/recipes-gnome/gnome-control-center/{gnome-cont=
rol-center_48.3.bb =3D&gt; gnome-control-center_49.2.2.bb} (79%)<br>
&gt;<br>
&gt; diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-contr=
ol-center_48.3.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-con=
trol-center_49.2.2.bb<br>
&gt; similarity index 79%<br>
&gt; rename from meta-gnome/recipes-gnome/gnome-control-center/gnome-contro=
l-center_48.3.bb<br>
&gt; rename to meta-gnome/recipes-gnome/gnome-control-center/gnome-control-=
center_49.2.2.bb<br>
&gt; index d8d5849534..9bb0228d50 100644<br>
&gt; --- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-cent=
er_48.3.bb<br>
&gt; +++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-cent=
er_49.2.2.bb<br>
&gt; @@ -32,19 +32,22 @@ DEPENDS =3D &quot; \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; udisks2 \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; upower \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${@' libxslt-native docbook-xsl-styleshe=
ets-native' if d.getVar('GIDOCGEN_ENABLED') =3D=3D 'True' else ''} \<br>
&gt; +&nbsp;&nbsp;&nbsp; blueprint-compiler-native \<br>
&gt;&nbsp; &quot;<br>
&gt;&nbsp; <br>
&gt;&nbsp; inherit gtk-icon-cache pkgconfig gnomebase gsettings gettext gi-=
docgen upstream-version-is-even bash-completion features_check<br>
&gt;&nbsp; <br>
&gt;&nbsp; REQUIRED_DISTRO_FEATURES +=3D &quot;opengl polkit pulseaudio sys=
temd x11&quot;<br>
&gt;&nbsp; <br>
&gt; +SRC_URI =3D &quot;<a href=3D"https://download.gnome.org/sources/gnome=
-control-center/${@oe.utils.trim_version('${PV}">https://download.gnome.org=
/sources/gnome-control-center/${@oe.utils.trim_version('${PV}</a>', 1)}/gno=
me-control-center-${PV}.tar.xz&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;c23ae220d6c1237d285925de7801e0e36338b9cc=
1a8bb51c2e37e715e6b503ad&quot;<br>
&gt; +<br>
&gt;&nbsp; SRC_URI +=3D &quot;<a href=3D"file://0001-Add-meson-option-to-pa=
ss-sysroot.patch">file://0001-Add-meson-option-to-pass-sysroot.patch</a>&qu=
ot;<br>
&gt; -SRC_URI[archive.sha256sum] =3D &quot;c0698245a6420badd077c16ffb218860=
e457cd7300612718eabf9aba47222bae&quot;<br>
&gt;&nbsp; <br>
&gt; -PACKAGECONFIG ??=3D &quot;ibus ${@bb.utils.filter('DISTRO_FEATURES', =
'wayland', d)}&quot;<br>
&gt; +PACKAGECONFIG ??=3D &quot;ibus ${@bb.utils.filter('DISTRO_FEATURES', =
'x11', d)}&quot;<br>
&gt;&nbsp; PACKAGECONFIG[cups] =3D &quot;,,cups,cups system-config-printer =
cups-pk-helper&quot;<br>
&gt;&nbsp; PACKAGECONFIG[ibus] =3D &quot;-Dibus=3Dtrue, -Dibus=3Dfalse, ibu=
s&quot;<br>
&gt; -PACKAGECONFIG[wayland] =3D &quot;-Dwayland=3Dtrue, -Dwayland=3Dfalse,=
 wayland&quot;<br>
&gt; +PACKAGECONFIG[x11] =3D &quot;-Dx11=3Dtrue, -Dx11=3Dfalse, virtual/lib=
x11&quot;<br>
&gt;&nbsp; PACKAGECONFIG[file-share] =3D &quot;,,,gnome-user-share&quot;<br=
>
&gt;&nbsp; PACKAGECONFIG[media-share] =3D &quot;,,,rygel-meta tumbler&quot;=
<br>
&gt;&nbsp; PACKAGECONFIG[malcontent] =3D &quot;-Dmalcontent=3Dtrue,-Dmalcon=
tent=3Dfalse,malcontent,malcontent-ui&quot;<br>
&gt; @@ -54,6 +57,7 @@ EXTRA_OEMESON +=3D &quot;-Doe_sysroot=3D${STAGING_DI=
R_HOST}&quot;<br>
&gt;&nbsp; GIDOCGEN_MESON_OPTION =3D 'documentation'<br>
&gt;&nbsp; <br>
&gt;&nbsp; export XDG_DATA_DIRS =3D &quot;${STAGING_DATADIR}&quot;<br>
&gt; +export GI_TYPELIB_PATH =3D &quot;${RECIPE_SYSROOT}${libdir}/gireposit=
ory-1.0&quot;<br>
&gt;&nbsp; <br>
&gt;&nbsp; FILES:${PN} +=3D &quot; \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${datadir}/dbus-1 \<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#122371): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/122371">
https://lists.openembedded.org/g/openembedded-devel/message/122371</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11667307=
2/6084445">
https://lists.openembedded.org/mt/116673072/6084445</a><br>
&gt; Group Owner: openembedded-devel+owner@lists.openembedded.org<br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub">
https://lists.openembedded.org/g/openembedded-devel/unsub</a> [skandigraun@=
gmail.com]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_TY3PR01MB114830BFED9BC1A66BD20D9D19BA2ATY3PR01MB11483jp_--


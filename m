Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D60CE6F070
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 08:29:52 +0000 (UTC)
Received: from OS0P286CU010.outbound.protection.outlook.com (OS0P286CU010.outbound.protection.outlook.com [40.107.74.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.97164.1766478585390438830
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Dec 2025 00:29:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=pQzOMVDi;
 spf=pass (domain: fujitsu.com, ip: 40.107.74.29, mailfrom: liuyd.fnst@fujitsu.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qBxntqFhKTnZQlSzSWAW23e7jLfHDFt2W5vJrTPjc0ri3eQ1JfZrCxLQKWTVqFu8Fr0VIqjkGU2dUywVBHLIJh7ySRqK3l46m2eJu/cAf/DrxdHxm16nUS2t9rY70qyufOe8Og42+vmFr2phjc9jnlGvv9k/fbRPtYftFJl3pJSdbbyiTEG/Mef9ngwfgW5ma04UJQR06J7KB+AiN6HOAjYAqr+Mt/M5FFDIv0sZt9Y7ooQeY6AiOebiyAcQlHKV2BuDzDjl17HQBficF93hEasuLaNzZkA7O277PhQ70n1Gl7TbHepigTAPHRB9nB9UrMYdBCbGQlrGBDCaRRFejQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8AJ+LH+frMjiW0riIooTl/2Qlbs1McYo+2oyjHyVINg=;
 b=vSF68DlgPJuucRQ6kKR6XImdMfPQvjjmud/ENXpj5tX0Zpi++HR0kR6AvZhabV7eUvjKCjMZ0T5aEOipzNy5dPikpfsTYh7y+G/utRdpcbM642QXEWe6GmQ7ZHQxEEseNEALtXQkHqpWIbWpI1x5Rsi3u3opTWD8u2M2Ubi5/qJuZ2pKKvKzFwSQqhzeJHgLFx4fGeJFOpDb9tBmtFhveYbNVv9+hWgezn7hYAa2GsOvoJHfEuBPkt8ltyFkPdthP9dsSy9pw6TUyfKSj6idFsTSVCp5ne2OCpwW7jKUWf4r3ql5Zch9to7JoioBSF9zTX/hXHtIuaO7o0D/a2dVZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8AJ+LH+frMjiW0riIooTl/2Qlbs1McYo+2oyjHyVINg=;
 b=pQzOMVDizJZYIhk8900IQoAB1LD5UkWHCcMgWFGZD9XBqu/hRdQQ2xQ9UASl/NfOALFUHHeI4wRMh9OO83let//G8Njwxcn6WHRBrLthDe6SkOX7DhJ63bCijBxQcYlHTXgMiWFRupvweR/6mcsy62XZe6o1gjDLZJ1cS522a135hmaZPitxLtULMddUz5nvdrGT4VShId84ojwGrDhGac4XPlh4pNVz1wRW0LC3Atf1IkvDFwH1CIUoy1QPLubgduteZJTQEsf/+bpJ96Ybi0xnO1R3G7RhvVq5vNXt/ZityaNFxpM9dEgYB3RCFCEA3Le5qV6fD/StWP2tSKsxcA==
Received: from OS7PR01MB11486.jpnprd01.prod.outlook.com (2603:1096:604:249::5)
 by OS7PR01MB14461.jpnprd01.prod.outlook.com (2603:1096:604:389::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.10; Tue, 23 Dec
 2025 08:29:37 +0000
Received: from OS7PR01MB11486.jpnprd01.prod.outlook.com
 ([fe80::9b80:35df:fb95:1593]) by OS7PR01MB11486.jpnprd01.prod.outlook.com
 ([fe80::9b80:35df:fb95:1593%4]) with mapi id 15.20.9456.008; Tue, 23 Dec 2025
 08:29:36 +0000
From: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
To: Gyorgy Sarvari <skandigraun@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: 
 =?gb2312?B?u9i4tDogW29lXVttZXRhLW9lXVtQQVRDSCAxLzddIGZsYXRwYWs6IHVwZ3Jh?=
 =?gb2312?Q?de_1.17.0_->_1.17.2?=
Thread-Topic: [oe][meta-oe][PATCH 1/7] flatpak: upgrade 1.17.0 -> 1.17.2
Thread-Index: AQHcc90klQrRxJwSz0+XS9mq3Ru9/LUu47cs
Date: Tue, 23 Dec 2025 08:29:36 +0000
Message-ID: 
 <OS7PR01MB1148635B51419C643A7704FB89BB5A@OS7PR01MB11486.jpnprd01.prod.outlook.com>
References: <20251223061043.659-1-liuyd.fnst@fujitsu.com>
 <eee72995-6e86-4d6c-aa98-8cd960865afe@gmail.com>
In-Reply-To: <eee72995-6e86-4d6c-aa98-8cd960865afe@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2025-12-23T08:29:36.215Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS7PR01MB11486:EE_|OS7PR01MB14461:EE_
x-ms-office365-filtering-correlation-id: 48149031-e813-4986-5493-08de41fd687c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|4022899009|366016|376014|1800799024|7053199007|38070700021|1580799027|13003099007|8096899003;
x-microsoft-antispam-message-info: 
 =?gb2312?B?MlZucHZCOTFpR0tIWEY3Wm42WEhUNzBSeHRESXpLeGZFVndPTDJUaFREa0hC?=
 =?gb2312?B?dUQ3SkxkMWZFWjJPWksxWHd6Q0hyRXN6bUV0Qm1KR3doQnJhMk9jWlhJY1dD?=
 =?gb2312?B?bkVUdU1rYllyc0wrTEJSWHJmaGhXT2FRd0k0SXhBR0E5NkovOEpBZzZFblF6?=
 =?gb2312?B?L0tWZHY2QmVxa0xkNU1DcHNtYk1HVkNtOUNndUxRRS9RUklrVUQwcCt3YkpK?=
 =?gb2312?B?N1NaekRVRTFyRmtXZjNxanNmSTVmSzhBcE1YZjZLMVdpL1ROSkROVDNoWlE1?=
 =?gb2312?B?WWQwMkgxNm1hOHJ5aFpZeFVqb3JkTFo0RUFsTkh4OTJWTXFwa256ck9MYk5r?=
 =?gb2312?B?QUpPUWtJdFBocHNzS0EyWExFdXdEeisvWE9vOEdscXl5bDd4TXp1Y3NBSTV1?=
 =?gb2312?B?V3pkY3YveDM2RGJRQmx2ZVhqSjVYZ1lZRGwyQ2huYUViMzI5SXFwN1hGQVhU?=
 =?gb2312?B?YS9YelFCUDZiT0hYOXdoQzZFUFpJeWJyK0FnZEh5Q0tqM3VuTFkwdWcwQmsr?=
 =?gb2312?B?V2l4NkJkZEtMeGF2ME4xeFB3WkUxTjVRSXhEdTNUbzZWdVQ1MU0rS0RRSVlo?=
 =?gb2312?B?aDNzV2xkUmdXUkVmaVRhaHd4bWZSbmhGbWZZZ2piUW5TOTlkcWNMQkYrbUYy?=
 =?gb2312?B?Ujl2QTg0MXl5L2IyTWM2Z1VXZVdKZjR0OFZuM2Z2SmVLOUZWWHpxSGRTYnpC?=
 =?gb2312?B?QmRNR2x3WCszTVFCN2lIeTJoZUVkdml2cmVIUEJ5cTR3Mnk2M1laTm5NRnF0?=
 =?gb2312?B?T0NDS2ZjRHUwWWFyc2p5UWRsVzBlQkdVWUZVS29XcDVmYXBEdFZuWFpiVFJP?=
 =?gb2312?B?TmRJOTdtUm5pd0VEUEl4ZW5sbWZMdTRxblprSUc2L2oyOTcxcUZSUXhReDRy?=
 =?gb2312?B?N05mbHBsa3Rqa2RjNUs5S3JqUjdXU3BxaVhaN2FSSlRUdXVxTHVVdXZ3WXlY?=
 =?gb2312?B?NGN3dGtiVTljMHg2ekJqeEo5TmdYZUtDTGgxVGYzTkE4YndMamdrZEZlOE0r?=
 =?gb2312?B?K1VKbmJ5WlhvMXN6QnlKRjdTcTFWdFdIVDljVFQzRGx6a2JpeGI0Sm5ENDg4?=
 =?gb2312?B?ZkluRzkwUDV3NzAvTlpVNGRxTEpXSEV5VWl4Yk11czBhN2twdlJURk9ZSGpT?=
 =?gb2312?B?dmFjMmVvOWQxYjkrQjIwZTNVYXFGaFBJanplNDRTZFVadlR1Q2VWeWk0WUYv?=
 =?gb2312?B?R2JHTkxyOHJCUThaOWp5Wkl3OHk3UWFoZTdWOS9IVDNOMlpsVXMvVkIwNy9r?=
 =?gb2312?B?Mmg3RHN2eTc3Z1lQZDZlTzVQVmgwNGhnVFVUaDZESSsyekFoNEhnU292N05T?=
 =?gb2312?B?Mno3QkdlY09kTnc0dTRlV0Vzc2FtdmdlVkZDYjlicktwSlNmd2FjQllBRFha?=
 =?gb2312?B?eEl1LzBEYXZ5eTBLU21CUElLdEhUMlpTM3YwR09PZExQOUNDNTc1RWJEVEtM?=
 =?gb2312?B?dnFWN0ZwRUI5am1MMmIrK040Sm1YdTdJS0t1VUY4dGlPanE3OGVhaXVmWjA0?=
 =?gb2312?B?Vy9nazhGZlI4emdlVTF1SVlCSndCOHNaeUpEVnBIcWswbWdaNE5uRTRjVTEz?=
 =?gb2312?B?bGxRdFNXSFpOMGs1bDlTcFB0QXRGQnh1TEdIbzZ1NnlLSXBGMGxOKzZsL1RY?=
 =?gb2312?B?WVFlWVhUZHd2RXFCQWVhbXRNMGs5Z1cvdkF2T3Fqc2doSENPSExrelhBOW9X?=
 =?gb2312?B?QkNTV29QajQ5RnFkWXlPWUJsYmJJTml1Tnh5UVN6OFRleG1XR0ZHR1VMZE9W?=
 =?gb2312?B?TmZaSXVBL0RHNDVibjM5OCsrbGM4QzJvdHBmOTJJalNDRE5xbC8zNVE4RFBq?=
 =?gb2312?B?Tk84eTY1VGtEYzdFL2I5YjdsK0tTOHlEYzk5d3pvMWZ6cGhBYzlETm5EUlM4?=
 =?gb2312?B?RTVpRk5CNitGMForcHZnODBaRFROTWVvVWZUTnpqSUVNV0FHNjYxVlgrMDh3?=
 =?gb2312?B?T21udGVHK2N0dHpvdEk0empOdHB0NGxtMU54UEtNL3VpNURQSnk2c0F6Tk04?=
 =?gb2312?Q?Vi+JkIRQ7I8tXruvm5j0IER6ZPlRvA=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS7PR01MB11486.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(376014)(1800799024)(7053199007)(38070700021)(1580799027)(13003099007)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?bWRwQkp2L3hnYVlBQ05EK1BGODcwWjZNbmdWcWQrWmtROWxEOUFjOUdZMzd1?=
 =?gb2312?B?TVViaEIvZFVORnhldnloOXVSVkNaNHFSbkxyakxDcHFkMVE5Q2M3UkNjNjd6?=
 =?gb2312?B?OWhCS1Z0VXhRQkd2QVZyTG9QZElGUXlXTjZJdGZjbzFGU0NUdi9UTVNyS1o2?=
 =?gb2312?B?MnlZZUVkSWJSYVRodFBtWEY4Ri9Pc3pJOUlIbnZEU0MyOEc3UENaMDRGK2lp?=
 =?gb2312?B?Sk5WNFhCOUVqNStxWmU5NnJmT000aHNHL0J2SmR6RFQ1TGZQWmljTjRXdjBP?=
 =?gb2312?B?RTVrR1U2R0FSZ1Fiak9rTE1vVW9Vc2lCT1UwSGRPNFZQcjV4VlM3ejIzOTdm?=
 =?gb2312?B?SVVwdlFZaXRjMlhxNGI0S1VVQzRtR1I1VDNPTWl2VzdFVnMyckdHOEJscm8w?=
 =?gb2312?B?a29PMUJ2VmRCb3JTSUxMbW5PNFFJUG9YK1UwMEpDR1ZWeWltZHljbnlKVHlW?=
 =?gb2312?B?cnhwaVRUWnlTeGh6MlF1cC8yM3paM0M5SE9DNE9vd01KbWVIS2grYWVHZGpW?=
 =?gb2312?B?SUsvZ2lheXpLS3VDeGhJUE4xQzJKNjltRFRibkkxM2dUQXJCRVNncDRaeTVN?=
 =?gb2312?B?OFFvS0tFNlpmQ0NZaXBOUnRRaVBHdS9UTXgzYjh4YjJ1Tm5LY0ZkQ251Sysz?=
 =?gb2312?B?VlVGQmJwWlgrbmc5L21SQ0lla0ttK1NuTlFPY2FJb3VJeDFlU2xBRUlER285?=
 =?gb2312?B?SWVHY1phTHpqeXpaaytLZ1R5V21zZUNuZG9la2FORnRqcTlSY0ErbEMyRnUw?=
 =?gb2312?B?MVg0dElWbmRXMEd0cndVbU1JUEpxek4vVCt3S3pIWE1nUndKb0FNcXdGdWJR?=
 =?gb2312?B?UmN1eHBsbG1vTmh6c3MyUnF3WHZ4SS9GaTNZbmJ0VzRFelJYMWtvclZEQXZV?=
 =?gb2312?B?eWNwcFhUb3Y0NGpCQjNXWmJXRDRBZmMvdDVLTmJPTVM4ZWJkZUVWbWk0WFAz?=
 =?gb2312?B?bTg5Vm1IOUdsTy9uTEJ1LzdtUTRuRVNaOVNYd0s2R2JpVDF4L05lMzZHZzAr?=
 =?gb2312?B?N3pONHlOWVFBZWw3TjQ0c1dVUGJLNi8zc2dtV251NVFvWnB5dmp3YzJ2cnE1?=
 =?gb2312?B?QnA0SFJOZXFuUlBuSWNLT0d2MXdXYzg1ZUhIMkpUK2lWU3hQNmVMRllWTUtz?=
 =?gb2312?B?RmVkdUZNdEpmK1lkQ1V2d0NPcFZzdFdKTzVQUDNZa0pQelFsOFZmLzE3RWFy?=
 =?gb2312?B?bEhWNEl3ZWp4MDZSMjBWMEhoMG5UdGJpSlpIRVVaaXpQTUovbkJGYVVKVXlm?=
 =?gb2312?B?OC9KMEdLa3N5a09uMy9DOHBZSEVndGJvbkF6dnRWM1A1VEhndkF2VllJTWdI?=
 =?gb2312?B?aXRRME5pekJZYUcxRldES3hWdFU1NFgwcVg0WkQ5UUZqZHFscFo2QmplcHlh?=
 =?gb2312?B?WFFYMWcvOW40VUVLU1FFd3BNbUM4OVFROS9rSUg2ZzdEODg2UER2bEthSVNW?=
 =?gb2312?B?Zi9mbTNxeSs4Sjk4ZDU1dHVvR0VCSFc3TnY5eG1rR1Y0Y1ZKZjMxU2FkTG1y?=
 =?gb2312?B?RTVYZkYwMnc4eFpnbC9rUkhZUVVHUGM0citPWkdiOER3RGF4dzlBejZYdGNM?=
 =?gb2312?B?UUxNMmpTYUVRc3hjcWtBUkZDNFh1R3hheGlqRHNwaXRjeUVIcENsVmg5a0tG?=
 =?gb2312?B?cEhja2g3ZkMrWkk2R0FtS0kzUW4xb0RYcjkrRWR6SytkWWU0eHJoZ2FGNzdv?=
 =?gb2312?B?dC9FOTVTYUdxbTFnVVVQdGZJL3NFbG01VW1tS2Y2OGViNW1pTkYxT3RnZ0pM?=
 =?gb2312?B?TnRnRGFMdmhVU1prcWN2OVRSRUZ3ZUh1aWNMV3dXb3lVVEhpcUhTZ2p1dktV?=
 =?gb2312?B?dkZLdFNTYmFhMjYzTTRTTndKZTFoRUpCdGpabVAxZGdhbzZEeEVGbnJVZDFE?=
 =?gb2312?B?T042bk1QMG9JemhCczRja3FTUFRUOWYwUklIM3hoNndIeDlUSVBVMlNHN1d4?=
 =?gb2312?B?MTRneUx5dmcvNzRWV0hTZXQ0UUFTQitaaTZoNzY5VkdlUXF0L3ZMZWZNckRN?=
 =?gb2312?B?UmZRRlBzd3NNK05FemxnWjgwdFhtaWVPSUxWUDBOUTEvQjVESS96cWZOR2t3?=
 =?gb2312?B?YWRJTjJldHVIWjFwaE85UkpXQTFieW1rMkl6eEZITEQvMjRWa1hpaHBsTHU5?=
 =?gb2312?B?bVY2bVpIUitaOUlFNExsamhQQmVBWVFUWFl4Z3Brb1B4eThYQXhQSE1nRHBL?=
 =?gb2312?B?b1VhRU1WV2pveEF3UkkrRklha0c0VHBjQStwN0c1UjBvYkw0dTBRd1g2d1VO?=
 =?gb2312?B?aHRpT1dyUlBKMmdvbURYK013UkFtTTd0M0U3QWxQL0R6ZzhnK0kyMFFaOGx2?=
 =?gb2312?B?WXNEUE80cFd4Zno2cTR6VlRhODAwdXVJSkVRVGVZM21oYzFlcmxiZz09?=
Content-Type: multipart/alternative;
	boundary="_000_OS7PR01MB1148635B51419C643A7704FB89BB5AOS7PR01MB11486jp_"
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS7PR01MB11486.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48149031-e813-4986-5493-08de41fd687c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2025 08:29:36.8435
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XmYfPatreevTSZAAvHf9bU2Nmf5wat0qdXnDlhZuOVDINZELpiykE2LSsj5M0pArOWA4xWAG0PrZO4I4419GKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14461
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 08:29:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122826

--_000_OS7PR01MB1148635B51419C643A7704FB89BB5AOS7PR01MB11486jp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgU2FydmFyaQ0KDQogICBJbiAxLjE3LjIgbWVzb24uYnVpbGQgc2hvd3MgdGhhdCBjdXJsIGFs
d2F5cyBiZSBhIGRlcGVuZGVuY3kNCg0KICAgbGliY3VybF9kZXAgPSBkZXBlbmRlbmN5KCdsaWJj
dXJsJywgdmVyc2lvbiA6ICc+PTcuMjkuMCcpLg0KDQogICBTbyBtYXliZSBJIHNob3VsZCBhZGQg
Y3VybCB0byBERVBFTkRTIGluIGJiIGZpbGU/DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fDQq3orz+yMs6IEd5b3JneSBTYXJ2YXJpIDxza2FuZGlncmF1bkBnbWFpbC5jb20+DQq3
osvNyrG85DogMjAyNcTqMTLUwjIzyNUgMTU6MjQNCsrVvP7IyzogTGl1LCBZaWRpbmcvwfUg0tK2
oSA8bGl1eWQuZm5zdEBmdWppdHN1LmNvbT47IG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4N
Ctb3zOI6IFJlOiBbb2VdW21ldGEtb2VdW1BBVENIIDEvN10gZmxhdHBhazogdXBncmFkZSAxLjE3
LjAgLT4gMS4xNy4yDQoNCk9uIDEyLzIzLzI1IDA3OjEwLCBZaWRpbmcgTGl1IChGdWppdHN1KSB2
aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4gMS4gQ2hhbmdlbG9nOg0KPiAgICAg
aHR0cHM6Ly9naXRodWIuY29tL2ZsYXRwYWsvZmxhdHBhay9yZWxlYXNlcy90YWcvMS4xNy4yDQo+
DQo+IDIuIFVwZGF0ZSAwMDAxLWZsYXRwYWstcGMtYWRkLXBjX3N5c3Jvb3RkaXIucGF0Y2ggZm9y
IDEuMTcuMg0KPg0KPiAzLiBSZW1vdmUgaHR0cF9iYWNrZW5kIHJlbGF0ZWQgb3B0aW9ucyBhcyB0
aGV5IHdlcmUgcmVtb3ZlZCBpbiAxLjE3LjINCj4NCj4gU2lnbmVkLW9mZi1ieTogTGl1IFlpZGlu
ZyA8bGl1eWQuZm5zdEBmdWppdHN1LmNvbT4NCj4gLS0tDQo+ICAuLi4vZmxhdHBhay8wMDAxLWZs
YXRwYWstcGMtYWRkLXBjX3N5c3Jvb3RkaXIucGF0Y2ggICB8IDExICsrKysrKystLS0tDQo+ICAu
Li4vZmxhdHBhay97ZmxhdHBha18xLjE3LjAuYmIgPT4gZmxhdHBha18xLjE3LjIuYmJ9ICB8ICA3
ICsrLS0tLS0NCj4gIDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9u
cygtKQ0KPiAgcmVuYW1lIG1ldGEtb2UvcmVjaXBlcy1leHRlbmRlZC9mbGF0cGFrL3tmbGF0cGFr
XzEuMTcuMC5iYiA9PiBmbGF0cGFrXzEuMTcuMi5iYn0gKDkwJSkNCj4NCj4gZGlmZiAtLWdpdCBh
L21ldGEtb2UvcmVjaXBlcy1leHRlbmRlZC9mbGF0cGFrL2ZsYXRwYWsvMDAwMS1mbGF0cGFrLXBj
LWFkZC1wY19zeXNyb290ZGlyLnBhdGNoIGIvbWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL2ZsYXRw
YWsvZmxhdHBhay8wMDAxLWZsYXRwYWstcGMtYWRkLXBjX3N5c3Jvb3RkaXIucGF0Y2gNCj4gaW5k
ZXggMDhkNTYyNWZhNy4uNjIwN2FlNjE3YiAxMDA2NDQNCj4gLS0tIGEvbWV0YS1vZS9yZWNpcGVz
LWV4dGVuZGVkL2ZsYXRwYWsvZmxhdHBhay8wMDAxLWZsYXRwYWstcGMtYWRkLXBjX3N5c3Jvb3Rk
aXIucGF0Y2gNCj4gKysrIGIvbWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL2ZsYXRwYWsvZmxhdHBh
ay8wMDAxLWZsYXRwYWstcGMtYWRkLXBjX3N5c3Jvb3RkaXIucGF0Y2gNCj4gQEAgLTcsMjIgKzcs
MjUgQEAgU2lnbmVkLW9mZi1ieTogTWFya3VzIFZvbGsgPGZfbF9rQHQtb25saW5lLmRlPg0KPiAg
LS0tDQo+ICBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW29lLXNwZWNpZmljXQ0KPg0K
PiArVXBkYXRlIGZvciAxLjE3LjIuDQo+ICtTaWduZWQtb2ZmLWJ5OiBMaXUgWWlkaW5nIDxsaXV5
ZC5mbnN0QGZ1aml0c3UuY29tPg0KPiArLS0tDQo+ICAgbWVzb24uYnVpbGQgfCAyICstDQo+ICAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+DQo+ICBkaWZm
IC0tZ2l0IGEvbWVzb24uYnVpbGQgYi9tZXNvbi5idWlsZA0KPiAtaW5kZXggNGEwYjg2NWUuLjVm
NjliMWQ5IDEwMDY0NA0KPiAraW5kZXggZTk3YjhjZWYuLjVjOGRlNTVmIDEwMDY0NA0KPiAgLS0t
IGEvbWVzb24uYnVpbGQNCj4gICsrKyBiL21lc29uLmJ1aWxkDQo+IC1AQCAtNTA5LDcgKzUwOSw3
IEBAIHBrZ2NvbmZpZ192YXJpYWJsZXMgKz0gJ2V4ZWNfcHJlZml4PSR7cHJlZml4fScNCj4gK0BA
IC01MTUsNyArNTE1LDcgQEAgcGtnY29uZmlnX3ZhcmlhYmxlcyArPSAnZXhlY19wcmVmaXg9JHtw
cmVmaXh9Jw0KPiAgIHBrZ2NvbmZpZ192YXJpYWJsZXMgKz0gJ2RhdGFkaXI9JyArICgnJHtwcmVm
aXh9JyAvIGdldF9vcHRpb24oJ2RhdGFkaXInKSkNCj4NCj4gICBwa2djb25maWdfdmFyaWFibGVz
ICs9ICdkYXRhcm9vdGRpcj0nICsgKCcke3ByZWZpeH0nIC8gZ2V0X29wdGlvbignZGF0YWRpcicp
KQ0KPiAgLXBrZ2NvbmZpZ192YXJpYWJsZXMgKz0gJ2ludGVyZmFjZXNfZGlyPSR7ZGF0YWRpcn0v
ZGJ1cy0xL2ludGVyZmFjZXMvJw0KPiAgK3BrZ2NvbmZpZ192YXJpYWJsZXMgKz0gJ2ludGVyZmFj
ZXNfZGlyPSR7cGNfc3lzcm9vdGRpcn0ke2RhdGFkaXJ9L2RidXMtMS9pbnRlcmZhY2VzLycNCj4g
LSBwa2djb25maWdfdmFyaWFibGVzICs9ICdodHRwYmFja2VuZD0nICsgZ2V0X29wdGlvbignaHR0
cF9iYWNrZW5kJykNCj4NCj4gICBwa2djb25maWcuZ2VuZXJhdGUoDQo+ICsgICBsaWJmbGF0cGFr
LA0KPiAgLS0NCj4gLTIuMzQuMQ0KPiArMi40My4wDQo+DQo+IGRpZmYgLS1naXQgYS9tZXRhLW9l
L3JlY2lwZXMtZXh0ZW5kZWQvZmxhdHBhay9mbGF0cGFrXzEuMTcuMC5iYiBiL21ldGEtb2UvcmVj
aXBlcy1leHRlbmRlZC9mbGF0cGFrL2ZsYXRwYWtfMS4xNy4yLmJiDQo+IHNpbWlsYXJpdHkgaW5k
ZXggOTAlDQo+IHJlbmFtZSBmcm9tIG1ldGEtb2UvcmVjaXBlcy1leHRlbmRlZC9mbGF0cGFrL2Zs
YXRwYWtfMS4xNy4wLmJiDQo+IHJlbmFtZSB0byBtZXRhLW9lL3JlY2lwZXMtZXh0ZW5kZWQvZmxh
dHBhay9mbGF0cGFrXzEuMTcuMi5iYg0KPiBpbmRleCBhNTE5MzdlYTcyLi5iNTgwM2UwMGE0IDEw
MDY0NA0KPiAtLS0gYS9tZXRhLW9lL3JlY2lwZXMtZXh0ZW5kZWQvZmxhdHBhay9mbGF0cGFrXzEu
MTcuMC5iYg0KPiArKysgYi9tZXRhLW9lL3JlY2lwZXMtZXh0ZW5kZWQvZmxhdHBhay9mbGF0cGFr
XzEuMTcuMi5iYg0KPiBAQCAtNCwxMSArNCwxMSBAQCBMSUNFTlNFID0gIkxHUEwtMi4xLW9ubHki
DQo+ICBMSUNfRklMRVNfQ0hLU1VNID0gIltmaWxlOi8vQ09QWUlORzttZDU9NGZiZDY1MzgwY2Rk
MjU1OTUxMDc5MDA4YjM2NDUxNmNdZmlsZTovL0NPUFlJTkc7bWQ1PTRmYmQ2NTM4MGNkZDI1NTk1
MTA3OTAwOGIzNjQ1MTZjIg0KPg0KPiAgU1JDX1VSSSA9ICIgXA0KPiAtICAgIGdpdDovL2dpdGh1
Yi5jb20vZmxhdHBhay9mbGF0cGFrO3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYWluIFwNCj4gKyAg
ICBnaXQ6Ly9naXRodWIuY29tL2ZsYXRwYWsvZmxhdHBhaztwcm90b2NvbD1odHRwczticmFuY2g9
bWFpbjt0YWc9JHtQVn0gXA0KPiAgICAgIGZpbGU6Ly8wMDAxLWZsYXRwYWstcGMtYWRkLXBjX3N5
c3Jvb3RkaXIucGF0Y2ggXA0KPiAgIg0KPg0KPiAtU1JDUkVWID0gIjA4MzVjMDI3MmYzYTAzODlm
OTdiMDJjYWQ0YjIwOGY4MGZlYzk5ZWQiDQo+ICtTUkNSRVYgPSAiMjA1OTk2MThkNjIzNjMwZjdh
YTM4ZDYxYTJiYjgxZDg2ZmIyNWYwOSINCj4NCj4NCj4gIGluaGVyaXQgbWVzb24gcGtnY29uZmln
IGdldHRleHQgc3lzdGVtZCBndGstZG9jIGdvYmplY3QtaW50cm9zcGVjdGlvbiBweXRob24zbmF0
aXZlIG1pbWUgZmVhdHVyZXNfY2hlY2sgdXNlcmFkZA0KPiBAQCAtNDksMTEgKzQ5LDkgQEAgR1RL
RE9DX01FU09OX09QVElPTiA9ICdndGtkb2MnDQo+ICBHVEtET0NfTUVTT05fRU5BQkxFX0ZMQUcg
PSAnZW5hYmxlZCcNCj4gIEdUS0RPQ19NRVNPTl9ESVNBQkxFX0ZMQUcgPSAnZGlzYWJsZWQnDQo+
DQo+IC1QQUNLQUdFQ09ORklHW2N1cmxdID0gIi1EaHR0cF9iYWNrZW5kPWN1cmwsLGN1cmwiDQoN
CkRpZG4ndCBjdXJsIHR1cm4gaW50byBhbiB1bmNvbmRpdGlvbmFsIGRlcGVuZGVuY3ksIHdoaWNo
IHNob3VsZCBiZQ0KYWx3YXlzIHByZXNlbnQgbm93PyAoT3IgbWF5YmUgaXQgaXMgcHVsbGVkIGlu
IGluZGlyZWN0bHkgYnkgYW5vdGhlcg0KZGVwZW5kZW5jeT8pDQoNCj4gIFBBQ0tBR0VDT05GSUdb
ZGNvbmZdID0gIi1EZGNvbmY9ZW5hYmxlZCwtRGRjb25mPWRpc2FibGVkLGRjb25mIg0KPiAgUEFD
S0FHRUNPTkZJR1tkb2Nib29rX2RvY3NdID0gIi1EZG9jYm9va19kb2NzPWVuYWJsZWQsLURkb2Ni
b29rX2RvY3M9ZGlzYWJsZWQseG1sdG8tbmF0aXZlIg0KPiAgUEFDS0FHRUNPTkZJR1ttYW5dID0g
Ii1EbWFuPWVuYWJsZWQsLURtYW49ZGlzYWJsZWQsbGlieHNsdC1uYXRpdmUiDQo+IC1QQUNLQUdF
Q09ORklHW3NvdXBdID0gIi1EaHR0cF9iYWNrZW5kPXNvdXAsLGxpYnNvdXAtMi40Ig0KPiAgUEFD
S0FHRUNPTkZJR1t0ZXN0c10gPSAiLUR0ZXN0cz10cnVlLC1EdGVzdHM9ZmFsc2UseGF1dGggc29j
YXQtbmF0aXZlIg0KPiAgUEFDS0FHRUNPTkZJR1t4YXV0aF0gPSAiLUR4YXV0aD1lbmFibGVkLC1E
eGF1dGg9ZGlzYWJsZWQseGF1dGgiDQo+ICBQQUNLQUdFQ09ORklHW3NlY2NvbXBdID0gIi1Ec2Vj
Y29tcD1lbmFibGVkLC1Ec2VjY29tcD1kaXNhYmxlZCxsaWJzZWNjb21wIg0KPiBAQCAtNjIsNyAr
NjAsNiBAQCBQQUNLQUdFQ09ORklHW3NlbGludXhdID0gIi1Ec2VsaW51eF9tb2R1bGU9ZW5hYmxl
ZCwtRHNlbGludXhfbW9kdWxlPWRpc2FibGVkLGxpYg0KPiAgUEFDS0FHRUNPTkZJR1t3YXlsYW5k
LXNlY3VyaXR5LWNvbnRleHRdID0gIi1Ed2F5bGFuZF9zZWN1cml0eV9jb250ZXh0PWVuYWJsZWQs
LUR3YXlsYW5kX3NlY3VyaXR5X2NvbnRleHQ9ZGlzYWJsZWQsd2F5bGFuZCB3YXlsYW5kLW5hdGl2
ZSB3YXlsYW5kLXByb3RvY29scyINCj4NCj4gIFBBQ0tBR0VDT05GSUcgPz0gIiBcDQo+IC0gICAg
Y3VybCBcDQo+ICAgICAgJHtAYmIudXRpbHMuY29udGFpbnMoJ0RJU1RST19GRUFUVVJFUycsICd4
MTEnLCAneGF1dGgnLCAnJywgZCl9IFwNCj4gICAgICAke0BiYi51dGlscy5jb250YWlucygnRElT
VFJPX0ZFQVRVUkVTJywgJ3NlY2NvbXAnLCAnc2VjY29tcCcsICcnLCBkKX0gXA0KPiAgICAgICR7
QGJiLnV0aWxzLmNvbnRhaW5zKCdESVNUUk9fRkVBVFVSRVMnLCAnd2F5bGFuZCcsICd3YXlsYW5k
LXNlY3VyaXR5LWNvbnRleHQnLCAnJywgZCl9IFwNCj4NCj4gLT0tPS09LT0tPS09LT0tPS09LT0t
PS0NCj4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAu
DQo+IFZpZXcvUmVwbHkgT25saW5lICgjMTIyODE3KTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRk
ZWQub3JnL2cvb3BlbmVtYmVkZGVkLWRldmVsL21lc3NhZ2UvMTIyODE3DQo+IE11dGUgVGhpcyBU
b3BpYzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210LzExNjkxMjcyMy82MDg0NDQ1
DQo+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtZGV2ZWwrb3duZXJAbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZw0KPiBVbnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cv
b3BlbmVtYmVkZGVkLWRldmVsL3Vuc3ViIFtza2FuZGlncmF1bkBnbWFpbC5jb21dDQo+IC09LT0t
PS09LT0tPS09LT0tPS09LT0tDQo+DQoNCg==

--_000_OS7PR01MB1148635B51419C643A7704FB89BB5AOS7PR01MB11486jp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; color: rgb(0, 0, 0);" class=3D"elementToPro=
of">
<span style=3D"font-size: 12pt;">Hi Sarvari<br>
<br>
&nbsp; &nbsp;In 1.17.2 meson.build shows that </span><span style=3D"font-si=
ze: 11pt;">curl always be a dependency</span><span style=3D"font-size: 12pt=
;"><br>
<br>
&nbsp; &nbsp;libcurl_dep =3D dependency('libcurl', version : '&gt;=3D7.29.0=
').<br>
<br>
&nbsp; &nbsp;So maybe I should add curl to DEPENDS in bb file?</span></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg">
<div style=3D"direction: ltr; font-family: Calibri, sans-serif; font-size: =
11pt; color: rgb(0, 0, 0);">
<b>=B7=A2=BC=FE=C8=CB:</b>&nbsp;Gyorgy Sarvari &lt;skandigraun@gmail.com&gt=
;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b>&nbsp;2025=C4=EA12=D4=C223=C8=D5 15:24<br>
<b>=CA=D5=BC=FE=C8=CB:</b>&nbsp;Liu, Yiding/=C1=F5 =D2=D2=B6=A1 &lt;liuyd.f=
nst@fujitsu.com&gt;; openembedded-devel@lists.openembedded.org &lt;openembe=
dded-devel@lists.openembedded.org&gt;<br>
<b>=D6=F7=CC=E2:</b>&nbsp;Re: [oe][meta-oe][PATCH 1/7] flatpak: upgrade 1.1=
7.0 -&gt; 1.17.2</div>
<div style=3D"direction: ltr;">&nbsp;</div>
</div>
<div style=3D"font-size: 11pt;">On 12/23/25 07:10, Yiding Liu (Fujitsu) via=
 lists.openembedded.org wrote:<br>
&gt; 1. Changelog:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; <a data-auth=3D"NotApplicable" class=3D"OWAAut=
oLink" id=3D"OWA1082ed59-6bee-1778-5262-25568d6508e5" href=3D"https://githu=
b.com/flatpak/flatpak/releases/tag/1.17.2">
https://github.com/flatpak/flatpak/releases/tag/1.17.2</a><br>
&gt;<br>
&gt; 2. Update 0001-flatpak-pc-add-pc_sysrootdir.patch for 1.17.2<br>
&gt;<br>
&gt; 3. Remove http_backend related options as they were removed in 1.17.2<=
br>
&gt;<br>
&gt; Signed-off-by: Liu Yiding &lt;liuyd.fnst@fujitsu.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../flatpak/0001-flatpak-pc-add-pc_sysrootdir.patch&nbsp;&nbsp; =
| 11 +++++++----<br>
&gt;&nbsp; .../flatpak/{flatpak_1.17.0.bb =3D&gt; flatpak_1.17.2.bb}&nbsp; =
|&nbsp; 7 ++-----<br>
&gt;&nbsp; 2 files changed, 9 insertions(+), 9 deletions(-)<br>
&gt;&nbsp; rename meta-oe/recipes-extended/flatpak/{flatpak_1.17.0.bb =3D&g=
t; flatpak_1.17.2.bb} (90%)<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-extended/flatpak/flatpak/0001-flatpak-pc-=
add-pc_sysrootdir.patch b/meta-oe/recipes-extended/flatpak/flatpak/0001-fla=
tpak-pc-add-pc_sysrootdir.patch<br>
&gt; index 08d5625fa7..6207ae617b 100644<br>
&gt; --- a/meta-oe/recipes-extended/flatpak/flatpak/0001-flatpak-pc-add-pc_=
sysrootdir.patch<br>
&gt; +++ b/meta-oe/recipes-extended/flatpak/flatpak/0001-flatpak-pc-add-pc_=
sysrootdir.patch<br>
&gt; @@ -7,22 +7,25 @@ Signed-off-by: Markus Volk &lt;f_l_k@t-online.de&gt;=
<br>
&gt;&nbsp; ---<br>
&gt;&nbsp; Upstream-Status: Inappropriate [oe-specific]<br>
&gt;&nbsp;<br>
&gt; +Update for 1.17.2.<br>
&gt; +Signed-off-by: Liu Yiding &lt;liuyd.fnst@fujitsu.com&gt;<br>
&gt; +---<br>
&gt;&nbsp;&nbsp; meson.build | 2 +-<br>
&gt;&nbsp;&nbsp; 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;&nbsp;<br>
&gt;&nbsp; diff --git a/meson.build b/meson.build<br>
&gt; -index 4a0b865e..5f69b1d9 100644<br>
&gt; +index e97b8cef..5c8de55f 100644<br>
&gt;&nbsp; --- a/meson.build<br>
&gt;&nbsp; +++ b/meson.build<br>
&gt; -@@ -509,7 +509,7 @@ pkgconfig_variables +=3D 'exec_prefix=3D${prefix}=
'<br>
&gt; +@@ -515,7 +515,7 @@ pkgconfig_variables +=3D 'exec_prefix=3D${prefix}=
'<br>
&gt;&nbsp;&nbsp; pkgconfig_variables +=3D 'datadir=3D' + ('${prefix}' / get=
_option('datadir'))<br>
&gt;&nbsp;&nbsp;<br>
&gt;&nbsp;&nbsp; pkgconfig_variables +=3D 'datarootdir=3D' + ('${prefix}' /=
 get_option('datadir'))<br>
&gt;&nbsp; -pkgconfig_variables +=3D 'interfaces_dir=3D${datadir}/dbus-1/in=
terfaces/'<br>
&gt;&nbsp; +pkgconfig_variables +=3D 'interfaces_dir=3D${pc_sysrootdir}${da=
tadir}/dbus-1/interfaces/'<br>
&gt; - pkgconfig_variables +=3D 'httpbackend=3D' + get_option('http_backend=
')<br>
&gt;&nbsp;&nbsp;<br>
&gt;&nbsp;&nbsp; pkgconfig.generate(<br>
&gt; +&nbsp;&nbsp; libflatpak,<br>
&gt;&nbsp; --<br>
&gt; -2.34.1<br>
&gt; +2.43.0<br>
&gt;&nbsp;<br>
&gt; diff --git a/meta-oe/recipes-extended/flatpak/flatpak_1.17.0.bb b/meta=
-oe/recipes-extended/flatpak/flatpak_1.17.2.bb<br>
&gt; similarity index 90%<br>
&gt; rename from meta-oe/recipes-extended/flatpak/flatpak_1.17.0.bb<br>
&gt; rename to meta-oe/recipes-extended/flatpak/flatpak_1.17.2.bb<br>
&gt; index a51937ea72..b5803e00a4 100644<br>
&gt; --- a/meta-oe/recipes-extended/flatpak/flatpak_1.17.0.bb<br>
&gt; +++ b/meta-oe/recipes-extended/flatpak/flatpak_1.17.2.bb<br>
&gt; @@ -4,11 +4,11 @@ LICENSE =3D &quot;LGPL-2.1-only&quot;<br>
&gt;&nbsp; LIC_FILES_CHKSUM =3D &quot;[file://COPYING;md5=3D4fbd65380cdd255=
951079008b364516c]file://COPYING;md5=3D4fbd65380cdd255951079008b364516c&quo=
t;<br>
&gt;&nbsp;<br>
&gt;&nbsp; SRC_URI =3D &quot; \<br>
&gt; -&nbsp;&nbsp;&nbsp; git://github.com/flatpak/flatpak;protocol=3Dhttps;=
branch=3Dmain \<br>
&gt; +&nbsp;&nbsp;&nbsp; git://github.com/flatpak/flatpak;protocol=3Dhttps;=
branch=3Dmain;tag=3D${PV} \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a data-auth=3D"NotApplicable" class=3D"=
OWAAutoLink" id=3D"OWA7e5a5cc1-37b7-b2f5-99ff-7ccf4a607d63" href=3D"file://=
0001-flatpak-pc-add-pc_sysrootdir.patch">
file://0001-flatpak-pc-add-pc_sysrootdir.patch</a>&nbsp;\<br>
&gt;&nbsp; &quot;<br>
&gt;&nbsp;<br>
&gt; -SRCREV =3D &quot;0835c0272f3a0389f97b02cad4b208f80fec99ed&quot;<br>
&gt; +SRCREV =3D &quot;20599618d623630f7aa38d61a2bb81d86fb25f09&quot;<br>
&gt;&nbsp;<br>
&gt;&nbsp;<br>
&gt;&nbsp; inherit meson pkgconfig gettext systemd gtk-doc gobject-introspe=
ction python3native mime features_check useradd<br>
&gt; @@ -49,11 +49,9 @@ GTKDOC_MESON_OPTION =3D 'gtkdoc'<br>
&gt;&nbsp; GTKDOC_MESON_ENABLE_FLAG =3D 'enabled'<br>
&gt;&nbsp; GTKDOC_MESON_DISABLE_FLAG =3D 'disabled'<br>
&gt;&nbsp;<br>
&gt; -PACKAGECONFIG[curl] =3D &quot;-Dhttp_backend=3Dcurl,,curl&quot;<br>
<br>
Didn't curl turn into an unconditional dependency, which should be<br>
always present now? (Or maybe it is pulled in indirectly by another<br>
dependency?)<br>
<br>
&gt;&nbsp; PACKAGECONFIG[dconf] =3D &quot;-Ddconf=3Denabled,-Ddconf=3Ddisab=
led,dconf&quot;<br>
&gt;&nbsp; PACKAGECONFIG[docbook_docs] =3D &quot;-Ddocbook_docs=3Denabled,-=
Ddocbook_docs=3Ddisabled,xmlto-native&quot;<br>
&gt;&nbsp; PACKAGECONFIG[man] =3D &quot;-Dman=3Denabled,-Dman=3Ddisabled,li=
bxslt-native&quot;<br>
&gt; -PACKAGECONFIG[soup] =3D &quot;-Dhttp_backend=3Dsoup,,libsoup-2.4&quot=
;<br>
&gt;&nbsp; PACKAGECONFIG[tests] =3D &quot;-Dtests=3Dtrue,-Dtests=3Dfalse,xa=
uth socat-native&quot;<br>
&gt;&nbsp; PACKAGECONFIG[xauth] =3D &quot;-Dxauth=3Denabled,-Dxauth=3Ddisab=
led,xauth&quot;<br>
&gt;&nbsp; PACKAGECONFIG[seccomp] =3D &quot;-Dseccomp=3Denabled,-Dseccomp=
=3Ddisabled,libseccomp&quot;<br>
&gt; @@ -62,7 +60,6 @@ PACKAGECONFIG[selinux] =3D &quot;-Dselinux_module=3D=
enabled,-Dselinux_module=3Ddisabled,lib<br>
&gt;&nbsp; PACKAGECONFIG[wayland-security-context] =3D &quot;-Dwayland_secu=
rity_context=3Denabled,-Dwayland_security_context=3Ddisabled,wayland waylan=
d-native wayland-protocols&quot;<br>
&gt;&nbsp;<br>
&gt;&nbsp; PACKAGECONFIG ?=3D &quot; \<br>
&gt; -&nbsp;&nbsp;&nbsp; curl \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${@bb.utils.contains('DISTRO_FEATURES', =
'x11', 'xauth', '', d)} \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${@bb.utils.contains('DISTRO_FEATURES', =
'seccomp', 'seccomp', '', d)} \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${@bb.utils.contains('DISTRO_FEATURES', =
'wayland', 'wayland-security-context', '', d)} \<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#122817): <a data-auth=3D"NotApplicable" class=3D"O=
WAAutoLink" id=3D"OWA95f771c7-4ed4-6032-4acb-2e851dafe27e" href=3D"https://=
lists.openembedded.org/g/openembedded-devel/message/122817">
https://lists.openembedded.org/g/openembedded-devel/message/122817</a><br>
&gt; Mute This Topic: <a data-auth=3D"NotApplicable" class=3D"OWAAutoLink" =
id=3D"OWAe8dc9007-20f5-38c2-26ff-881615acc67a" href=3D"https://lists.openem=
bedded.org/mt/116912723/6084445">
https://lists.openembedded.org/mt/116912723/6084445</a><br>
&gt; Group Owner: openembedded-devel+owner@lists.openembedded.org<br>
&gt; Unsubscribe: <a data-auth=3D"NotApplicable" class=3D"OWAAutoLink" id=
=3D"OWAaff6daf7-b667-b531-7207-1ba5e66da44b" href=3D"https://lists.openembe=
dded.org/g/openembedded-devel/unsub">
https://lists.openembedded.org/g/openembedded-devel/unsub</a>&nbsp;[skandig=
raun@gmail.com]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
</div>
</body>
</html>

--_000_OS7PR01MB1148635B51419C643A7704FB89BB5AOS7PR01MB11486jp_--


Return-Path: <Joakim.Tjernlund@infinera.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5294CCFB43F
	for <webhook@archiver.kernel.org>; Mon,  7 Oct 2024 13:50:54 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.66])
 by mx.groups.io with SMTP id smtpd.web11.53514.1728309051875153383
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Oct 2024 06:50:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@infinera.com header.s=selector2 header.b=Gj6zSiJm;
 spf=pass (domain: infinera.com, ip: 40.107.220.66, mailfrom: joakim.tjernlund@infinera.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YjlTUr3K9AkiNvncV034ZzSjccFMqbPG7FT/m428GKEHcMQQF94hfIKrjcX1+24EEV2/PuvNJOJJW9qhk/TZ0ry9E6gGDbyRbk/nR/hkPQH0SGMyebZlfCYRIBUz8F9NF3jV0PYZW42N26XwTiLBax1uhTFLwNfZ8dJCspXtD1kEBtzB5PzJDT05481Y0luxLo9xh7ERcoaN49dVegrks2i3kVZUv4b7AywehYFIpvs8VAaM0vXHszhq8IeBOGtxhQnpY3bUskGQYA+ZfVKt53/LTY7uZJpYPosxWF1L4GPTO3WG3eRbEf5c1GBnxlqQcHXJnS42oOHeXoKtKxNVjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=75MdzwUMRjb8NEI6ecXOLNAf4D5o861Abto4RHHUfF8=;
 b=c9PnjbtEgaapmetDG9HscO6gIeOQ/vr4GtOmEPmew2SpWl/zcZiFiqEngPXE/A+/R+lCGx2qH//fYYLI6w3oCTJ+3KJ8GCKCYViTkFkuI/m5OCXb008oxWNr/9gN79BOJwA3uIFBkejfJ/zpwbihplo7N6ak/T/CYIaEvayMvqDVwe7TkgiFSo3ESTXJ51+119nQTQWJ6pow5nC6yI2AJys9lMxcV/Yaq0SAnNQ68kXJC0L8SzAUCz6dB5tEVG10zKTfOx6IH4+6MNB15cDQVx10zR6+YFC4Fd1EpLP3oRndrbSAXybTZZccKevMt3FAJYMCeWecXG+Tt8KU88J9Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=75MdzwUMRjb8NEI6ecXOLNAf4D5o861Abto4RHHUfF8=;
 b=Gj6zSiJm7yjHCE4tHH63IdqJNb52mDcyICby+0lDVb/nLHL+UNBNratwZZVwIWlcD3fIJaInm2iFDqzSGSgV9s4/J9vcEuJ5EFpo5nTMJPMbh0u+jBMw3n87Nyixo8ntSWl50NSi64uBJFqQOOzOcTmhmrv0IIvC3s16sZSCHZGnq6UM1+ELvoSijEUUzZ7tjc12oMYLZGreONgsnnUpp+QI1SACIO6fYx5k8Opimec0t56XF1b7uUjw11A8g1AhYAf5Wwl2kPsudd//1A9zHgVKutLVEr9UnDlf2cjA1SVqx5sQPCXJ12c4RJM9F/TG3UZyYAPvmX4Y1soHhK0WyA==
Received: from DS7PR10MB5197.namprd10.prod.outlook.com (2603:10b6:5:3ab::19)
 by IA3PR10MB8113.namprd10.prod.outlook.com (2603:10b6:208:50a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Mon, 7 Oct
 2024 13:50:49 +0000
Received: from DS7PR10MB5197.namprd10.prod.outlook.com
 ([fe80::9b1b:e457:4852:c406]) by DS7PR10MB5197.namprd10.prod.outlook.com
 ([fe80::9b1b:e457:4852:c406%6]) with mapi id 15.20.8026.020; Mon, 7 Oct 2024
 13:50:49 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] scarthgap: How to revert zstd from ipk ?
Thread-Topic: [oe] scarthgap: How to revert zstd from ipk ?
Thread-Index: AQHbGLynh7wCkgiOPUGUNhn1PYPf2bJ7SqgAgAADsYA=
Date: Mon, 7 Oct 2024 13:50:48 +0000
Message-ID: <8da539dd2dbf56c0a402fb93b0794bec2295b8c3.camel@infinera.com>
References: <ae23174dc7aa9aa7cd5e8fbfbc912bf8d6a3e4db.camel@infinera.com>
	 <CANNYZj9FdP6GUi_SzY1_041EHbtbtncM=oCMfN9w8DhAGQ93mA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9FdP6GUi_SzY1_041EHbtbtncM=oCMfN9w8DhAGQ93mA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.0 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infinera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR10MB5197:EE_|IA3PR10MB8113:EE_
x-ms-office365-filtering-correlation-id: a363f4c2-0c02-4447-5ab5-08dce6d70d02
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|4022899009|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?bytxUFBjWUdpcVc0WWEvWnZmcEFGZi9QRDJpa3M4RTAyUFY5R1Fyc0piV25u?=
 =?utf-8?B?WHdHZVRlSE9NYU14YmNJS3pXSUlEQlVYYTdlekVrSjkxRnVtR1Q2K1dLUUM3?=
 =?utf-8?B?bWx6RW5sdmhvTG55OTdGRTh5SEM4SFlNRGNHZVoySmV3ZjNMc2tYVFRaMkxo?=
 =?utf-8?B?YXB0blNqTGNDcmJReUpjS0N5UTZIZUM4ZjBiSU05SHZoQUdKbFhvSkdHWmVX?=
 =?utf-8?B?SXNsWkk4MVVHTDFZWm9rdEc2dU1TRk1rcS9xMmxuRGZFa3dkbldaY05wQkt3?=
 =?utf-8?B?elZpdzF4TTZSNkZhRGk4SnZBNXJYRElXKzFpcVF6NjRpM2dTR1AwRWhuQ1NR?=
 =?utf-8?B?YVhZaWFMZGtIVFY1NDlmYUlHekI5K3RBN0VxOURlVTdLQUJnTVJOc2lXSHFX?=
 =?utf-8?B?L05CL1Z2ZUdFRy9hUUdDTGErc1F5ZjZLWjdadUNxcGFvT0lRNmI3UVRVdEwx?=
 =?utf-8?B?L2dBeGNxZ3NBZjh0TEVtNnZBTXlYZHUzRGdPL1dRc3AxMHE2MTlXRHNiNFVT?=
 =?utf-8?B?VFFrZDVFakpOYzNqenR2alFWR2RReUVtZk1LeldPNGtYZ0FYZG5tVUIvZkF6?=
 =?utf-8?B?V2lmSTVYdVdHVjdMR0k1NERneE1oSmZGeDFTQXI0VEl6a0dScnJFSDBpbU1I?=
 =?utf-8?B?THBmcS9NUzBhc3ZtTTBaWlNZSE9SUTFSZkNPVzcyZ0ZuT3pBZjRaaWlyRlBX?=
 =?utf-8?B?MkREWHZLODMvTVBWYjlma2grek5GbHBDZ0xXL1ExYlNkL0xaMGRoWHp4U0Z5?=
 =?utf-8?B?ZGRFTlczdWJoL2ZKQUR6NzczbzhyVkNzRFNOMW9ML3JvdE1wMlljYmdQTGR2?=
 =?utf-8?B?eldzdDg0Njg1VkR3T0h1end2eGpkYWtIZUNFYi94R25vM1V5MjludFREVm1a?=
 =?utf-8?B?Tjg5YVllRkpWTnU1OEQwcExncDdicHhWby8rRTZVN0tlcm5ZbHdyZ3VsSzZ3?=
 =?utf-8?B?ZHprYm9WM3ljUXpldTRaWmZCSCthOUFpWjlkb2srbXd1NWJyOEpHMWNpcnUv?=
 =?utf-8?B?MzlNcXI5aXpjN3dRN3lSOC9iZ3dtcHRsZzV4NytmdlVVUGdZaEVMSHpVMits?=
 =?utf-8?B?Y2tVNkFwTSt3dTRLS290dlYzVGIrenZjK1UzdC9jSk94b0toWFVSUnVPZFR3?=
 =?utf-8?B?NlB0bXBTTHNYaHlJYk9ZOCt5aWZReDVRRWdUWjZDc0c4dlBDWTB2THUvVmlH?=
 =?utf-8?B?eklSbzNHODFwa1VwaWx1aHY4SGlKa2UzOUliSjRzNGplRkFleEFxK3B5bEF0?=
 =?utf-8?B?NWxkWEQvc2J2UVpLek5Sbll0NndhdHBKYnBuMGZiU3BZTFhFVzFYenY3Skkz?=
 =?utf-8?B?WHNReDYrZE1DOWg5OS84SlBlQWtrL3hiUXhrUVFyVUFqVjFORVN1Zis3L1RN?=
 =?utf-8?B?RU5Eak9vbm1wSHJrQVk1cUM0ZkNYRE5WTDl4eG1ON1A0VG5ZcHNUZEYrMjFR?=
 =?utf-8?B?WlRhbkFBdkI2NXlwU2hvMTVJZE03cHFGbHBwZW1NMXdLbTRLNytuK250dnJu?=
 =?utf-8?B?NXplRHRhS3d4UU5nTkk2VXZqUHhKdC9QMTlvczZ3K21tdlg2LzdXQ3RabS9D?=
 =?utf-8?B?S0IzTmY2WWQ5Y2RkRXBlZmZCcTVMbnNBd0JOR1ludUkzcjhuU1NQbHprcmRi?=
 =?utf-8?B?TlN3SkRaeFhOVDM1dDA2OWpaT0tsbzdjd3JWdnltMmY1NSs0LzRTZDZOWGY4?=
 =?utf-8?B?QUtIekpOL3ZZWEJmbWxLd2hYR1pzUW03VCtPMm9jUXJlc1o4NEZBOVdRPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5197.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4022899009)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VW1qeXkvWDNFNlVLNFFrSTB3NTgxUThRMG1DTkl6aHZjNFBORU1namJPZlVD?=
 =?utf-8?B?TW9aMTU1NG1ueEcxL1FjczdUS216aTdQaS8rcEtIUVVwWERBRmx3MG9FUGJT?=
 =?utf-8?B?SmZETDBpS1JXYjNqaTBIL0REeHBtRnJpNHQrVUJ6VXpNaU5MbklSWWN2SVA1?=
 =?utf-8?B?cVVhQUFQUWEvNi9tZnBMUGVuUXM2bkdxMDk1amFla25aQzJLeEhXeXNFQkdS?=
 =?utf-8?B?TjZDaStUR3BBU1VrTEovcmYvQU96RHpOTDVqRnhEb1M1dDBVbXoyQ3lhc0Ni?=
 =?utf-8?B?aUNnZVQrMEY2VmVnNTczUzV4TjFyN3d5cVplY1pBdVNLNnB0eTAweC9ibEkr?=
 =?utf-8?B?U0RKNWx1QVEza3RVcVk4S1FqSXBMdlptVnB0ODI4MUlQbTgwcXVnRzY2Y1pn?=
 =?utf-8?B?NndRN3FwZ0ptaW9TaFpuOGp5b25FRWM3YnVRWGF0WE4vaFFyVFZkWG12a0g1?=
 =?utf-8?B?ZGFVL05WbTkyN1o1bk9mZU9NQlA2VGhtSjVKVXBQZEFKMGZpRzBtUmdsc04x?=
 =?utf-8?B?VGVZSFhkT0lSeWFHVU9BV055TmlsZ0xZMzBxWGsxbys1S3hKRDdCcHBzYmdR?=
 =?utf-8?B?V3huWjR2RWVxdjEwNU9VVEtCdVp1TmpLbFhLSkM1Z0NOK1orYjY1U01zQ0VX?=
 =?utf-8?B?NHo2YnhyK0c3YUEyVjBWNmx3NmF5OTY3ZTFSM09STkRwekRFUGowUGJzQk5Y?=
 =?utf-8?B?T3ZqSVdTQzFFbkk2dGVKSGUrMldnMWtwZXFuMlV0NmNJai8zR2VYbzNRVHVM?=
 =?utf-8?B?Q29PemM2VncyejdQbExodGJaVmF4YUR2REhDTGkxOThwaHEyQXZ1WkUxajNl?=
 =?utf-8?B?OG1RclhzNmEyRHNZdU5DelJoeGMxbmdnN0hCN0FTOExWb082bUdZTGpON2Ex?=
 =?utf-8?B?SUwvOU45VlR4aGJkUkJyZ3ZWbkhzRmVtMUtHM2x3RVU0WEt1UnptVThnb2Nt?=
 =?utf-8?B?WTlCT2NEZTJGbmZzNXhTdU9qcjBxYUN5ZklDY01JSE90SldNbGsydFZHZXlB?=
 =?utf-8?B?RStQYk16NFRINzU0STBlUGJMazcrdFc5RmltcTNIcklyQU93YjFCNUcvQVY4?=
 =?utf-8?B?ZzB2TWROeXJkRERSYWNtRi91VnhjRDlua1dpaGNoNDZVN0U5Rldzc044Y2o5?=
 =?utf-8?B?K2d3MmZrakFmdWw2MEYzVDZEQXFuaVdCZlJoRk9NRndwL2htWWkwcGQ3RDFV?=
 =?utf-8?B?dmVZWEFJc2ZaTGpoSjdCaEplQWl2QUtERkdkQUwyL0lxS003UHN6WFU5U3NX?=
 =?utf-8?B?T0JjcTdoQkU5SmVHQzRBbFQxTzI1NXRWNndhcGtzdXBTbkhRUHhGN2NPaXdD?=
 =?utf-8?B?S3VFcitKSGE5cmZxb3pGL3FYako0SU5COGtkb2lFSVAyekgzME1GaW05UU96?=
 =?utf-8?B?cU1vRGpaT081MjJJck40UzRDdytpdHlmUG9KalpTUlZ5NHA5aFJ1YU5ibHdK?=
 =?utf-8?B?TDZoakRTNStLT1hhL3YyYVpXRWFoLzFCRSt1ZlI4Y3Q4V2NEbmlMVHA2aElz?=
 =?utf-8?B?WVJSeXFTY3B1Q0NHRmZQMFZ4Ui9nZHJEN0xOOUZPdUw3d0hnZk9ucUdMdzhw?=
 =?utf-8?B?Q0sweCtsbFU5aHAzc0EyOER4Sk9HNTZQVnMyeW44Y0QrMk9JcU5oVTlmcW9K?=
 =?utf-8?B?Umd4SjZ6R2FMZGtzS3BQTzNabEJSY21ZeW5CbGdhY1FhbC9OTzcvd1orWlZt?=
 =?utf-8?B?blk2SU81R2trYTJNakZGUlhRUkpQZ0FkMUx5Qi9qR0lCZWVYMVFOOUhOYURz?=
 =?utf-8?B?R290UkNmVldFT1BrT0U1VDBDTFZEb0VPT3F3alhOSTRXS3Y5WTVMNUlEQkxY?=
 =?utf-8?B?bkwwNzc1RytGeEE5OW5PSkZqNWJ1bzI4SkRhQyt4bis2TGJ6VzdwOWtKUGRj?=
 =?utf-8?B?eDJCR0JXM2NwMjJzR0xHSFl0SGlPc0F2UFVvY0IyZnN0QW1jLzdmcC9NcUxB?=
 =?utf-8?B?WkdDelhzSUxCYVdYc2RzU3RZZmthQkhoSC8rRmI2NkU3VVF2ZmZFZkRvZ0Ni?=
 =?utf-8?B?WG01TDF1T1ZWbjhwTEVOY3RqK0NxaTFMNGVIaURCSXo4TFNMbjBzeWI4SE1w?=
 =?utf-8?B?eUwrcHFhd05FM3RxSTd4cVF2NW1Calg0a2NQYXFMcjVLbldxMml3azZxOENl?=
 =?utf-8?Q?/QkhNdILqR7va0ifziR5nZu32?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6330BA5CD850264EB631241310905CE9@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5197.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a363f4c2-0c02-4447-5ab5-08dce6d70d02
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2024 13:50:48.9917
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UciJjSdyzfTRusbb3lqjmDvbeJ94L1qGXXW7w6S0Hj26GWB5ECPmSkIYpK7F1vlxK++xUTgw/y/mPTBPX8ul8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8113
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Oct 2024 13:50:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112697

T24gTW9uLCAyMDI0LTEwLTA3IGF0IDE1OjM3ICswMjAwLCBBbGV4YW5kZXIgS2FuYXZpbiB3cm90
ZToNCj4gSSBkb24ndCB1bmRlcnN0YW5kLiBEbyB5b3UgaGF2ZSB6c3RkIG9uIHRoZSB0YXJnZXQg
aW1hZ2Ugb3Igbm90PyBXaGVyZQ0KPiBkbyB5b3Ugd2FudCB0byBhdm9pZCBpdD8NCg0KU29ycnkg
Zm9yIGJlaW5nIHVuY2xlYXIsIEkgZG8gTk9UIGhhdmUgenN0ZCBvbiB0YXJnZXQgYnV0IGlzIGlu
c3RhbGxlZCBpbiBuYXRpdmUvc2RrLg0KDQo+DQo+IFdoaWNoIGlwa3MgYXJlIHlvdSBzZWVpbmcg
c3BlY2lmaWNhbGx5PyBEbyB0aGV5IGdldCBpbnN0YWxsZWQgb24gdGhlDQo+IHRhcmdldCBpbWFn
ZT8NCg0KQWxsIGlwa3MgSSBoYXZlIGNoZWNrZWQgaGFzIGNvbXByZXNzaW9uIHpzdGQgZm9yIGRh
dGEsIGFzc3VtaW5nIGFsbCBvZiB0aGVuIGFyZSBBVE0uDQoNCm9wa2cgaXRzZWxmIGlzIGJ1aWx0
IHdpdGhvdXQgenN0ZCBhbmQgYnVpbGQgZmFpbCBpbiB0aGUgZW5kIHdoZW4gdHJ5aW5nDQpnZW5l
cmF0ZSBhbmQgaW1hZ2UsIGhlcmUgaXMgb25lIHN1Y2ggZXJyb3IgbXNnOg0KIEVSUk9SOiBsaWIz
Mi14ci1pbWFnZS0xLjAtcjAgZG9fcG9wdWxhdGVfc2RrOiBVbmFibGUgdG8gaW5zdGFsbCBwYWNr
YWdlcy4gQ29tbWFuZCAnL2hvbWUvam9ja2UveW9jdG8teHIvYnVpbGQvaW5mbi14ci93YWE0MDAv
dG1wL3dvcmsvd2FhNDAwLXhybWxsaWIzMi1saW51eC1tdXNsZWFiaS9saWIzMi14ci0NCmltYWdl
LzEuMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNyL2Jpbi9vcGtnIC0tdm9sYXRpbGUtY2FjaGUg
LWYgL2hvbWUvam9ja2UveW9jdG8teHIvYnVpbGQvaW5mbi14ci93YWE0MDAvdG1wL3dvcmsvd2Fh
NDAwLXhybWxsaWIzMi1saW51eC1tdXNsZWFiaS9saWIzMi14ci1pbWFnZS8xLjAvb3BrZy1zZGst
DQp0YXJnZXQuY29uZiAtdCAvaG9tZS9qb2NrZS95b2N0by14ci9idWlsZC9pbmZuLXhyL3dhYTQw
MC90bXAvd29yay93YWE0MDAteHJtbGxpYjMyLWxpbnV4LW11c2xlYWJpL2xpYjMyLXhyLWltYWdl
LzEuMC90ZW1wL2lwa3RlbXAvIC1vIC9ob21lL2pvY2tlL3lvY3RvLXhyL2J1aWxkL2luZm4tDQp4
ci93YWE0MDAvdG1wL3dvcmsvd2FhNDAwLXhybWxsaWIzMi1saW51eC1tdXNsZWFiaS9saWIzMi14
ci1pbWFnZS8xLjAvc2RrL2ltYWdlL29wdC9pbmZuLXhyLzEuMC9zeXNyb290cy9jb3J0ZXhhNTMt
eHItbGludXgtbXVzbCAgLS1mb3JjZV9wb3N0aW5zdGFsbCAtLXByZWZlci1hcmNoLXRvLXZlcnNp
b24gICAtDQotZm9yY2UtbWFpbnRhaW5lciAtLWZvcmNlLW92ZXJ3cml0ZSBpbnN0YWxsIGJvb3N0
IGJvb3N0LWRldiBsaWJzdGRjKystc3RhdGljZGV2IHBhY2thZ2Vncm91cC1jb3JlLXN0YW5kYWxv
bmUtc2RrLXRhcmdldCB0YXJnZXQtc2RrLXByb3ZpZGVzLWR1bW15IHhyLW5ld2xpYi1zdGF0aWNk
ZXYnIHJldHVybmVkDQoyNTU6DQogKiBwa2dfZXh0cmFjdF9kYXRhX2ZpbGVfbmFtZXNfdG9fc3Ry
ZWFtOiBGYWlsZWQgdG8gZXh0cmFjdCBkYXRhLnRhci4qIGZyb20gcGFja2FnZSAnL2hvbWUvam9j
a2UveW9jdG8teHIvYnVpbGQvaW5mbi14ci93YWE0MDAvdG1wL3dvcmsvd2FhNDAwLXhybWxsaWIz
Mi1saW51eC1tdXNsZWFiaS9saWIzMi14ci0NCmltYWdlLzEuMC9zZGsvaW1hZ2Uvb3B0L2luZm4t
eHIvMS4wL3N5c3Jvb3RzL2NvcnRleGE1My14ci1saW51eC1tdXNsLy92YXIvY2FjaGUvb3BrZy92
b2xhdGlsZS4zMTU3Mzc3L2RhMzkwYjI5NTY0ZDgzNzc1ZmViZjBiNzBlZmVmMjRiX2xpYnN0ZGMr
Ky1zdGF0aWNkZXZfMTMuMy4wLQ0KcjBfY29ydGV4YTUzLmlwaycuDQogKiBwa2dfZ2V0X2luc3Rh
bGxlZF9maWxlczogRXJyb3IgZXh0cmFjdGluZyBmaWxlIGxpc3QgZnJvbSAvaG9tZS9qb2NrZS95
b2N0by14ci9idWlsZC9pbmZuLXhyL3dhYTQwMC90bXAvd29yay93YWE0MDAteHJtbGxpYjMyLWxp
bnV4LW11c2xlYWJpL2xpYjMyLXhyLQ0KaW1hZ2UvMS4wL3Nkay9pbWFnZS9vcHQvaW5mbi14ci8x
LjAvc3lzcm9vdHMvY29ydGV4YTUzLXhyLWxpbnV4LW11c2wvL3Zhci9jYWNoZS9vcGtnL3ZvbGF0
aWxlLjMxNTczNzcvZGEzOTBiMjk1NjRkODM3NzVmZWJmMGI3MGVmZWYyNGJfbGlic3RkYysrLXN0
YXRpY2Rldl8xMy4zLjAtDQpyMF9jb3J0ZXhhNTMuaXBrLg0KSW5zdGFsbGluZyBsaWJzdGRjKyst
c3RhdGljZGV2ICgxMy4zLjApIG9uIHJvb3QNCkRvd25sb2FkaW5nIGZpbGU6L2hvbWUvam9ja2Uv
eW9jdG8teHIvYnVpbGQvaW5mbi14ci93YWE0MDAvdG1wL3dvcmsvd2FhNDAwLXhybWxsaWIzMi1s
aW51eC1tdXNsZWFiaS9saWIzMi14ci1pbWFnZS8xLjAvb2Utc2RrLXJlcG8vY29ydGV4YTUzL2xp
YnN0ZGMrKy1zdGF0aWNkZXZfMTMuMy4wLQ0KcjBfY29ydGV4YTUzLmlway4NCg0KDQo+DQo+IEJh
c2ljYWxseSBpdCdzIGhhcmQgdG8gdW5kZXJzdGFuZCB3aGF0IGlzIGdvaW5nIG9uIGlmIHRoZSBw
cm9ibGVtDQo+IGRlc2NyaXB0aW9uIGlzbid0IGNsZWFyIGFuZCB0aGVyZSdzIG5vIHdheSB0byBy
ZXByb2R1Y2Ugb3Igb2JzZXJ2ZSBpdC4NCj4NCj4gQWxleA0KPg0KPiBBbGV4DQo+DQo+IE9uIE1v
biwgNyBPY3QgMjAyNCBhdCAxNToyNywgSm9ha2ltIFRqZXJubHVuZCB2aWENCj4gbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZw0KPiA8Sm9ha2ltLlRqZXJubHVuZD1pbmZpbmVyYS5jb21AbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+ID4NCj4gPiBXZSBkb24ndCBoYXZlIHpzdGQgb24gb3V0
IHRhcmdldCBhbmQgc2luY2UgaXQgaXMgcmF0aGVyIGxhcmdlIHdlIHdhbnQgdG8gYXZvaWQgaXQu
DQo+ID4gVHJpZWQgdG8gYmFjayB6c3RkIG91dCBieSBkb2luZzoNCj4gPg0KPiA+IEFkZGVkIG9w
a2dfJWJiYXBwZW5kOg0KPiA+ICBERVBFTkRTOnJlbW92ZSA9ICJ6c3RkIg0KPiA+ICBFWFRSQV9P
RUNPTkY6cmVtb3ZlID0gIi0tZW5hYmxlLXpzdGQiDQo+ID4gYW5kIHNldDoNCj4gPiAgUEFDS0FH
RUNPTkZJRzpwbi1saWJhcmNoaXZlID0gInpsaWIgYnoyIHh6Ig0KPiA+IGluIG91ciBvd24gZGlz
dG8uY29uZg0KPiA+DQo+ID4gQnV0IGJpdGJha2Ugc3RpbGwgYnVpbGRzICppcGsncyB3aXRoIHpz
dGQgY29tcHJlc3Npb24sIHdoYXQgYW0gSSBtaXNzaW5nPw0KPiA+DQo+ID4gICAgSm9ha2ltDQo+
ID4NCj4gPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiA+IExpbmtzOiBZb3UgcmVjZWl2ZSBh
bGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLg0KPiA+IFZpZXcvUmVwbHkgT25saW5lICgj
MTEyNjk1KTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWRl
dmVsL21lc3NhZ2UvMTEyNjk1DQo+ID4gTXV0ZSBUaGlzIFRvcGljOiBodHRwczovL2xpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcvbXQvMTA4ODY3NDk1LzE2ODY0ODkNCj4gPiBHcm91cCBPd25lcjogb3Bl
bmVtYmVkZGVkLWRldmVsK293bmVyQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiBVbnN1YnNj
cmliZTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWRldmVs
L3Vuc3ViIFthbGV4LmthbmF2aW5AZ21haWwuY29tXQ0KPiA+IC09LT0tPS09LT0tPS09LT0tPS09
LT0tDQo+ID4NCg0K


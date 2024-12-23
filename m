Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FBB7E7718B
	for <webhook@archiver.kernel.org>; Mon, 23 Dec 2024 16:03:55 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.46])
 by mx.groups.io with SMTP id smtpd.web11.15836.1734969834374533820
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Dec 2024 08:03:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=Xq4lWMkc;
 spf=pass (domain: siemens.com, ip: 40.107.20.46, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KLwfq5dnS30PU4l44Fyz4l89LaW/yiZkj95P6bDC794lCJoNAZyfqSv5jb9eiAAF91gTxLzg7gfGresHugT/FgIbz4dFWdfWBndAsIUAbSao29KgXIyCPyIA0sStkFQ57YXxlbCijykg6w+mXHQZUJSvXARSeNxWxvyJgvSUPPPcKkeFnTx9ndIuQn2car6Fp0gBPfgjh60dxvryRQkXz5iRbPXWls9sadZ0dMTrEy+fUK4Sy/H+0QJMN3b9m3tzKO/G5iP0bDVnnPSIyT/MQ42m5Q6DQ7xKP7QFxA8UPB9GpmUk/9iF4Q404CG9tyzJS2Rws5TFenxXl60YB4BJtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F1bRlUs2LPBAE/ZyDiCJWN8z4eFVxzCIMojbEvbEzVI=;
 b=ey7sbDEN12cnMq0uInLIdcmh1CFu3LqH1i2fbG7E1Ex1r6oQNTSXiJZ2xu6XOE4OB7ulavrn1IWhEKirgFqdXhVOIOXz4Wgmh9VS3w9itiJZYZeuwXBzlOgz0SvcFUa7jCLhhNwdnXRvmlM7HwPHC2oxsV/p/9Ss3A6+Yx7qjnW4/fxVF988rm1F1ofkuGnJ+gKzX+gGFKFSqtYtbgQj4elDvj8bhrf3ccRnE2TU4uM2+4zzAwi7nf6hikcz/DkUwjHvYtlkHizZy+WUQDkLZEIwAGAKWWv8PX7jerqIT2ho7OIi4mS9KS2LcO+h4amv6mXr2lXeUiSholRf65q38Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F1bRlUs2LPBAE/ZyDiCJWN8z4eFVxzCIMojbEvbEzVI=;
 b=Xq4lWMkcJebQCTVFiib3UonkJgiMyH5/p+ERLzTfDierMGLDjL/AqZYtF9PJiZ/X0/2ZsuDrkfxBWV3AgCUSuEnuaPRqeNwGjqZjlaAawQZisiflZt3znid41rDPb+EzNe/SEROcuC0A4pMVymzJEw5XtEAbUa45kULN0X8MuMSRj0J4tUlWCp2Qx6mbqrBArJu83HQLQPxbvzLUWRkJ2jEMru+vCJ+WseAA5oNZQhgLIYMZzIeHu22e6TkTulTbyZ+1P0HFUkPGJCMUYMCHPtVdom4kb0tcM/YAwCONo0Y9olpmS39P7Yo07TkovsAUDbn9maSBcybvEj+ht6SaxQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PAXPR10MB5616.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:246::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.11; Mon, 23 Dec
 2024 16:03:47 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%3]) with mapi id 15.20.8293.000; Mon, 23 Dec 2024
 16:03:47 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "hongxu.jia@eng.windriver.com" <hongxu.jia@eng.windriver.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][scarthgap][PATCH 1/4] Use 7zip 24.09 to replace
 p7zip 16.02
Thread-Topic: [oe] [meta-oe][scarthgap][PATCH 1/4] Use 7zip 24.09 to replace
 p7zip 16.02
Thread-Index: AQHbVEnOtY4+nJyLx0+sf3NPsAMLFrLx7syAgAIQXaA=
Date: Mon, 23 Dec 2024 16:03:47 +0000
Message-ID: 
 <AS1PR10MB5697ED581F502680854FBAD3FD022@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20241222081612.239474-1-hongxu.jia@windriver.com>
 <14778.1734856199190674571@lists.openembedded.org>
In-Reply-To: <14778.1734856199190674571@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=778f4523-459e-419f-bb2a-1e0e738b7e0a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-12-23T16:01:04Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PAXPR10MB5616:EE_
x-ms-office365-filtering-correlation-id: be77296f-34a9-439d-8d80-08dd236b6275
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|8096899003|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?K0lWdEVBYk1NSGFhUndqbXdkKzkwUFZYWFZsQ2lvT0Fyem15NS9ISDJta3VH?=
 =?utf-8?B?WjB4SWw0K215cnM0RkFtNWNmVEdTcEFWd3hRYlhiMndXQkYwa0VxS1liSjFN?=
 =?utf-8?B?MlNHWkpmeFh6SCtlcENUUk45NkdjOFlxYUlob0g1dXEvSlRjQWxWeStQL3M5?=
 =?utf-8?B?Q254cElSVVVtV3NoMi9zWk12ZWs1TS80NVpJbmJ5UHRyUG9NMUZJMzEvVWpH?=
 =?utf-8?B?L2VWWkZXaU42c3FWUHc3QnovUWxYT0VZQWNnVU13OUE4SzFaL0dNTFBpMjBa?=
 =?utf-8?B?cWJPV2lzV0lKUnlVZlpSTUZ6L0wxeDM4RlVQUzRvY0tpZ0tZYVEvUjhYdUJK?=
 =?utf-8?B?YnQyM3Y2Q3hYU2NSR2JLQkxVdTF5R1hkVkhuSi9tMzUvQmM0MXYycnAxbnpZ?=
 =?utf-8?B?UXpTT1NKT3BRdEF1UUZRWnFRZ0dxdGJIWFlvQWduNmVDcnBiZm55VmxFMUEx?=
 =?utf-8?B?aDFBR0wzL1hSaGFtdDRvWERMazM0STQ2a0pid3c1eSt1bkpEd1lrRUpFWkZR?=
 =?utf-8?B?a216eXBaNkg1akxtemtINDFycUpKbmdQZVRLdG5NbjhGS2pVelJXODd4WEZt?=
 =?utf-8?B?Um9jNHVwVEtESzU3UEtFckxrNEx3UE5UTy85ZXBPalR2WWhvVmVBa01xSUs5?=
 =?utf-8?B?ZTBtMFU1NVJLbTVyTlc0RXZFTkNYcFJqWHUyVEoxdVZxT0ZKaFVaRjVCVHZq?=
 =?utf-8?B?RVpKOHpuRHIyNWhNQjJjMWZvOEhIaG5hejVTWXNXcnlPQWwvck55YWNOcjNR?=
 =?utf-8?B?blBZVjR3bkdFOW9hS1NwYklwalVUdkNYYWdjRU1aTEVkbUN1M0MwNEpZQ3do?=
 =?utf-8?B?YWFJKzFtUWdjWm5Rd0twK09XTnIyRGJ2azNWSmNaZ1hxWEN4UEhzRlRkS01Q?=
 =?utf-8?B?cTJlWHd5WXM4QWpscVZZb1dLWHZNR3BEcUlEelBZTDZ3b2JScEVzVWI4UE55?=
 =?utf-8?B?WmpVcDZVUU4xMXNOK3ZKVTJHTks5TnptNVlMQjM0QlZQaWpZTUF2cytOcmtn?=
 =?utf-8?B?M3R2RGxmTmJ3VFZFS1BQTXpWdUQ2TnBTTnFKTThZVFFrMVhMbEpvd1FEZVJM?=
 =?utf-8?B?aXh2YUs3ZFBxRWNST1ZqS3RIUExVcnJuSEo4VDZqRzhiWUR1bzU3di9ETVNx?=
 =?utf-8?B?UXZMMG9QMmdwc1BuWGlMdm9xSFp3N0tBYWdlTkxhUURJMG9BZUpTYytaa1Bw?=
 =?utf-8?B?WVhLQ0RlM04wS3BNeFRXYTduSm9Mcm8zTlBxNVlpL3lEZ3I0SkhJaXppaUtC?=
 =?utf-8?B?OTNOV1lCQ3MyL1prQnI5bEFrNjlRSk1pY2VCbzRZRkQyZEcrOUkyQzViRnhB?=
 =?utf-8?B?V3NnUTZ0MXF6dDAyM044cWFDODZHR3ZQR2E2dUh0L1gydld5bG50ZldwVlhR?=
 =?utf-8?B?UjgzWGxZa0ttZkNRakRqenVmWVNlclQrcGRnd2UyS3I3Uk9rNDBZd1hic2sy?=
 =?utf-8?B?aFlFM1MxNUw4TzRIZEhGcE1mRFQ2bE1JV0hGSlVZYWw1R3U3ZEFmbklwemVt?=
 =?utf-8?B?ZFJlMER5bk5jTzBaZStubG0wbjFVOSttQXZQRUxRQndTQzNYTDFwZS82VG1D?=
 =?utf-8?B?TXRpa1hSR3I0bks0TEpSQTJjdTFtU0ZUcDFodFdiR0ZwVXZ1Y2xaZkowOUI2?=
 =?utf-8?B?L1NmWTBmOEg4TnRpOUVxaWpnWjZLMFpDVklrSVBRVlVLTFl2WU5PUVNhSU1F?=
 =?utf-8?B?ejlhRHdHVjM0aE1XTE5aSG9sSnNCMlp6UkJETExVcnpEbXV5L2hCblFvMTE3?=
 =?utf-8?B?WTIzNjlva0NzTkRlK05Uam84WisrNVpyczVRVmsyQzJGdHEwd3Jzb0JTeGQz?=
 =?utf-8?B?RnY5ZVZ0bCt5d2Zjb2VxMGRnSEVnWGZVaG1KWTZSblM4SUF3bGVqdEtJWVp1?=
 =?utf-8?B?dHhQUjZDTU1lTC80UmJtdkxUcHQyaHo5b2JMWnVFb3h4S0dvTHBNcnphZVVM?=
 =?utf-8?Q?grqwvQk7wGwb9n2W21i1jL34lnMfZSq4?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(8096899003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bStsOEhIeVFMY2ltTzlTaS81V2swbmZvQnRJNm1qYjNZcGFwVUN6bnRsUjgr?=
 =?utf-8?B?ZnFCTDdQdG44Um4zMVVMUlJqZ0twc2ptbjdDQ3RTL1VwSU5rZEtTZ3FmWVBM?=
 =?utf-8?B?bFVIS2VYTHM2WUJZVXpyY01NcGpjeFdLZng4NEwwZjhnb1I2TU9SbkJ2RmVr?=
 =?utf-8?B?YjJ1MXFESTA2QWtwaWREcTVYbktCZlhMNmxhWEFkYkJXbXk3VmlGR1Z1UlBE?=
 =?utf-8?B?TXdlV2pHcnU3Uk40MlJmcVRvaUhCOW90WFhlSjhrT1FROUl2eExUM0ZPMDdw?=
 =?utf-8?B?bVN0RG92UkxKU0t0RTJnUlVucVhHNStNRkJsczdSZWc0VzYxbWNSRDc2b3Mv?=
 =?utf-8?B?Y21RVkY4N1E2MXhVRCtmSTB0MUVwbS9VdXJHeS9Zc0JWMzlpTE9HYmRGV0hF?=
 =?utf-8?B?QkVFVHNlWnpaTWlneUJSZnA3aVZRSmsyVVdCTWNuYS84cTBhK2NXeVVGT1pY?=
 =?utf-8?B?QWlZZ2dRVE5tSFU2WFZ4c1hjVXdFSmU5cDY5MFdpNE15MmcrNWN0MzN4MFJl?=
 =?utf-8?B?Y0JFQmRHNUkzd0lkYzZiajlFd3dNYmg1dGswMGx4WG56L290cVZnaWdGRkFw?=
 =?utf-8?B?V3M1Ly9lZjdqQ2xzenp2aDVUZUpHOVVsbXJadFhnVWgzSUdQTjZteTVWcjdv?=
 =?utf-8?B?ZTNHSzNFNnRRKzZQVUJkeE5MNkszVFlqTHI1ekFwQmxZUC9HQXVvQ25jQkJh?=
 =?utf-8?B?SjYzNzNKaHlETHpKakYzOFlpeEtnbTYydEhtZHA3YlhiQWlwVFhYbmxNb3I3?=
 =?utf-8?B?RG12Z0JqaWl3WkQyTU4yN0VZN05reEsvN0dYalVZem9PQ1U2eUFDMG9KaVVT?=
 =?utf-8?B?Z1dzMk9hbWd6YlNKUkpkS1J6T3RDMGZwcFFKWUQyTHhUd2RLNS9KYkFXZVlH?=
 =?utf-8?B?a25OdWpUZ3pYU0JjN083SnoyYzlXdTEzYVA4M09zRFhFSzNFSE1ESTVkUXZt?=
 =?utf-8?B?VitsQmhFcEtFZ3psY2phWUdsUjBrN2tsYVU0NEx1UjJkUzlTSmNIenM5RXRr?=
 =?utf-8?B?VTdYRVFwRVd3a3RKQ0hkRmpDcUZwb2ptWU1YRDVQNWcyRXZ2Mk1RZ004Wm1s?=
 =?utf-8?B?N0xwRW1jVFZIYy9YMTQrR0FMdi96TG81cGtLUXZzRXhKNTcyUklrOERMd0hS?=
 =?utf-8?B?WEdBZ3VRTDhzL04zL0hSMmRNdHdYVm91T3lDU01aTFFOWnM1RVJoSjU0eGg3?=
 =?utf-8?B?Qi9pMUZnbHVPMVFVZGdodE5IbTVSWDdNeXpsZm43Q1lucGpHTnpTU0xXbGtL?=
 =?utf-8?B?UHlGMjdqTFNWRzVUVEs3cSsrTGhqVENDWFB6VTgzTnptMmNhazBaVGVRVmQv?=
 =?utf-8?B?cTdZV0NUZFNoU21iaTIxVDhrdHAvMVI5dDdlZXR6ZnkxSXZNaEZ4YzBWMFpS?=
 =?utf-8?B?Ukc4Mm43c3VmRys4UFlDUFdxQkRsbWd4Rm5xbUZlTng0REZKK0x0U1dHa243?=
 =?utf-8?B?c0ZGUW5lWDlDOHVnaHRSTHFHcWxLZGdHOEtnQzRUT2ExaXNUYnRoaTB3Wlds?=
 =?utf-8?B?OXlsS0pLRkpMSUVyNFVNWnljTjFyMFN2WTQ0TjM5NlRZdUw5ejA3U05zSXJL?=
 =?utf-8?B?YnpDYmVZTFd4c2gwNFp6WmhxdGZCN3VhY3dhWGl4Q1RYV05qWnlGalhuT2Iv?=
 =?utf-8?B?US91UCsyQWdZM2ZPVzloTlp6OXBUb2thMCtEWXRhWkFjUGFLV2wwelNjNGNZ?=
 =?utf-8?B?bW1XaUY4R0Rab09HMWhHVWpvNTI0UlJGSmkwcTVBVHBEcmdKU1FXWm9FS25r?=
 =?utf-8?B?Z2FzRjIzb0VNeDZ4M0VTQUJ5MXhSdU9PakdGRjdlQ3NrcldBQ0pHSWZvNmU1?=
 =?utf-8?B?aVFJam1lUkFqS1plTENtekIydTJ6Y2RDMEUvQ3hmRkorampnaXZRWjRKVVR5?=
 =?utf-8?B?N3J6eC94dzVqeCs1ZklBdkRHSDlvVkdmbVM4S3p2TkhENVpXRzVaZ3VkcGM0?=
 =?utf-8?B?b1Ewa2VhTjN3VHpxQjc1c2huZzF4NHNxTFJoTXFhZ2R5NzdXS3o0RmRNRUZ6?=
 =?utf-8?B?bWI5Y3Y4U1pjb2pyWGZoUmtTMFlIQUw4akJCRms3UU5tbndBNlhNNEI1SzJ2?=
 =?utf-8?B?YmExOGdPaGZZcVlVV0MyQjBxNXBVVzdlVmR3Z3pmWjAzeE5ZaHNvczdQQjc1?=
 =?utf-8?Q?0gw54a6oi7DZD71AZQTPzmmdZ?=
Content-Type: multipart/alternative;
	boundary="_000_AS1PR10MB5697ED581F502680854FBAD3FD022AS1PR10MB5697EURP_"
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: be77296f-34a9-439d-8d80-08dd236b6275
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2024 16:03:47.6201
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V1sqTwD+E1q7GqQBI6FSM9j1HL0t/XEcWtKrnRVVKTTX2UcR8vuCp4H91e2nHn8div3GOl+tJs6J6UzP0XZWMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR10MB5616
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Dec 2024 16:03:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114472

--_000_AS1PR10MB5697ED581F502680854FBAD3FD022AS1PR10MB5697EURP_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UGxlYXNlIG5vdGUgdGhhdCA3emlwIHByb3ZpZGVzIGFsc28gYSBsaWJyYXJ5LCBzbyBpdOKAmXMg
cHJvYmFibHkgbm90IHNhZmUgdG8gZG8gdGhpcyB1cGdyYWRlIGluIExUUy4NCkl0IG1heSBiZSBo
b3dldmVyIHBvc3NpYmxlIHRvIGRvIGl0IGFzIGFsdGVybmF0aXZlIG9wdC1pbiByZWNpcGUuDQoN
ClBldGVyDQoNCkZyb206IG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
IDxvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gT24gQmVoYWxmIE9m
IGhvbmd4dSB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KU2VudDogU3VuZGF5LCBEZWNlbWJl
ciAyMiwgMjAyNCA5OjMwDQpUbzogb3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcNClN1YmplY3Q6IFJlOiBbb2VdIFttZXRhLW9lXVtzY2FydGhnYXBdW1BBVENIIDEvNF0g
VXNlIDd6aXAgMjQuMDkgdG8gcmVwbGFjZSBwN3ppcCAxNi4wMg0KDQpIaSBBcm1pbiwNCg0KVGhl
IHA3emlwIGlzIHRvbyBvbGQgYW5kIGRlYWQgc2luY2UgMjAxNiBhbmQgaGFzIG1hbnkgdnVsbmVy
YWJsZSBDVkVzLCBzdWNoIGFzOg0KQ1ZFLTIwMjQtMTE2MTINCkNWRS0yMDI0LTExNDc3DQpDVkUt
MjAyMy01MjE2OQ0KQ1ZFLTIwMjMtNTIxNjgNCkNWRS0yMDIzLTQwNDgxDQpDVkUtMjAyMy0zMTEw
Mg0KQ1ZFLTIwMjMtMTU3Ng0KQ1ZFLTIwMjItNDcwNjkNCg0KVGhlIDd6IGlzIGEgc3RhbmRhbG9u
ZSBjb21tYW5kLCBhbmQgdGhlIHZlcnNpb24gb2YgYWxsIGFmZmVjdGVkIHJlY2lwZXMgKGFuZHJv
aWQtdG9vbHMsIHB5dGhvbjMtcmFyZmlsZSwgeGFyY2hpdmVyKSBoYXMgbm8gY2hhbmdlIGJldHdl
ZW4gbWFzdGVyIGFuZCBzY2FydGhnYXANCnNvIEkgYmFjayBwb3J0ZWQgdGhlIG5ldyA3emlwIHJl
Y2lwZSB0byBzY2FydGhnYXAgdG8gaW5zdGVhZCBvZiBwN3ppcCwgSSB0aGluayB0aGUgcmVncmVz
c2lvbiBpcyBsaXR0bGUNCg0KLy9Ib25neHUNCg==

--_000_AS1PR10MB5697ED581F502680854FBAD3FD022AS1PR10MB5697EURP_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6dj0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTp2bWwiIHhtbG5zOm89InVy
bjpzY2hlbWFzLW1pY3Jvc29mdC1jb206b2ZmaWNlOm9mZmljZSIgeG1sbnM6dz0idXJuOnNjaGVt
YXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6d29yZCIgeG1sbnM6bT0iaHR0cDovL3NjaGVtYXMubWlj
cm9zb2Z0LmNvbS9vZmZpY2UvMjAwNC8xMi9vbW1sIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcv
VFIvUkVDLWh0bWw0MCI+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIg
Y29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxtZXRhIG5hbWU9IkdlbmVyYXRv
ciIgY29udGVudD0iTWljcm9zb2Z0IFdvcmQgMTUgKGZpbHRlcmVkIG1lZGl1bSkiPg0KPHN0eWxl
PjwhLS0NCi8qIEZvbnQgRGVmaW5pdGlvbnMgKi8NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6
IkNhbWJyaWEgTWF0aCI7DQoJcGFub3NlLTE6MiA0IDUgMyA1IDQgNiAzIDIgNDt9DQpAZm9udC1m
YWNlDQoJe2ZvbnQtZmFtaWx5OkNhbGlicmk7DQoJcGFub3NlLTE6MiAxNSA1IDIgMiAyIDQgMyAy
IDQ7fQ0KQGZvbnQtZmFjZQ0KCXtmb250LWZhbWlseTpBcHRvczt9DQovKiBTdHlsZSBEZWZpbml0
aW9ucyAqLw0KcC5Nc29Ob3JtYWwsIGxpLk1zb05vcm1hbCwgZGl2Lk1zb05vcm1hbA0KCXttYXJn
aW46MGluOw0KCWZvbnQtc2l6ZToxMi4wcHQ7DQoJZm9udC1mYW1pbHk6IkFwdG9zIixzYW5zLXNl
cmlmO30NCnNwYW4ucmVkDQoJe21zby1zdHlsZS1uYW1lOnJlZDt9DQpzcGFuLkVtYWlsU3R5bGUx
OQ0KCXttc28tc3R5bGUtdHlwZTpwZXJzb25hbC1yZXBseTsNCglmb250LWZhbWlseToiQXB0b3Mi
LHNhbnMtc2VyaWY7DQoJY29sb3I6d2luZG93dGV4dDt9DQouTXNvQ2hwRGVmYXVsdA0KCXttc28t
c3R5bGUtdHlwZTpleHBvcnQtb25seTsNCglmb250LXNpemU6MTEuMHB0O30NCkBwYWdlIFdvcmRT
ZWN0aW9uMQ0KCXtzaXplOjguNWluIDExLjBpbjsNCgltYXJnaW46MS4waW4gMS4waW4gMS4waW4g
MS4waW47fQ0KZGl2LldvcmRTZWN0aW9uMQ0KCXtwYWdlOldvcmRTZWN0aW9uMTt9DQotLT48L3N0
eWxlPjwhLS1baWYgZ3RlIG1zbyA5XT48eG1sPg0KPG86c2hhcGVkZWZhdWx0cyB2OmV4dD0iZWRp
dCIgc3BpZG1heD0iMTAyNiIgLz4NCjwveG1sPjwhW2VuZGlmXS0tPjwhLS1baWYgZ3RlIG1zbyA5
XT48eG1sPg0KPG86c2hhcGVsYXlvdXQgdjpleHQ9ImVkaXQiPg0KPG86aWRtYXAgdjpleHQ9ImVk
aXQiIGRhdGE9IjEiIC8+DQo8L286c2hhcGVsYXlvdXQ+PC94bWw+PCFbZW5kaWZdLS0+DQo8L2hl
YWQ+DQo8Ym9keSBsYW5nPSJFTi1VUyIgbGluaz0iIzQ2Nzg4NiIgdmxpbms9IiM5NjYwN0QiIHN0
eWxlPSJ3b3JkLXdyYXA6YnJlYWstd29yZCI+DQo8ZGl2IGNsYXNzPSJXb3JkU2VjdGlvbjEiPg0K
PHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPlBsZWFz
ZSBub3RlIHRoYXQgN3ppcCBwcm92aWRlcyBhbHNvIGEgbGlicmFyeSwgc28gaXTigJlzIHByb2Jh
Ymx5IG5vdCBzYWZlIHRvIGRvIHRoaXMgdXBncmFkZSBpbiBMVFMuPG86cD48L286cD48L3NwYW4+
PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQi
Pkl0IG1heSBiZSBob3dldmVyIHBvc3NpYmxlIHRvIGRvIGl0IGFzIGFsdGVybmF0aXZlIG9wdC1p
biByZWNpcGUuPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNw
YW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4N
CjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5QZXRl
cjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxl
PSJmb250LXNpemU6MTEuMHB0Ij48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8ZGl2IHN0
eWxlPSJib3JkZXI6bm9uZTtib3JkZXItbGVmdDpzb2xpZCBibHVlIDEuNXB0O3BhZGRpbmc6MGlu
IDBpbiAwaW4gNC4wcHQiPg0KPGRpdj4NCjxkaXYgc3R5bGU9ImJvcmRlcjpub25lO2JvcmRlci10
b3A6c29saWQgI0UxRTFFMSAxLjBwdDtwYWRkaW5nOjMuMHB0IDBpbiAwaW4gMGluIj4NCjxwIGNs
YXNzPSJNc29Ob3JtYWwiPjxiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0O2ZvbnQtZmFt
aWx5OiZxdW90O0NhbGlicmkmcXVvdDssc2Fucy1zZXJpZiI+RnJvbTo8L3NwYW4+PC9iPjxzcGFu
IHN0eWxlPSJmb250LXNpemU6MTEuMHB0O2ZvbnQtZmFtaWx5OiZxdW90O0NhbGlicmkmcXVvdDss
c2Fucy1zZXJpZiI+IG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnICZs
dDtvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyZndDsNCjxiPk9uIEJl
aGFsZiBPZiA8L2I+aG9uZ3h1IHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPGJyPg0KPGI+U2Vu
dDo8L2I+IFN1bmRheSwgRGVjZW1iZXIgMjIsIDIwMjQgOTozMDxicj4NCjxiPlRvOjwvYj4gb3Bl
bmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc8YnI+DQo8Yj5TdWJqZWN0Ojwv
Yj4gUmU6IFtvZV0gW21ldGEtb2VdW3NjYXJ0aGdhcF1bUEFUQ0ggMS80XSBVc2UgN3ppcCAyNC4w
OSB0byByZXBsYWNlIHA3emlwIDE2LjAyPG86cD48L286cD48L3NwYW4+PC9wPg0KPC9kaXY+DQo8
L2Rpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPGRpdj4N
CjxwIGNsYXNzPSJNc29Ob3JtYWwiPkhpIEFybWluLDxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8
ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+Jm5ic3A7PG86cD48L286cD48L3A+DQo8L2Rpdj4N
CjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5UaGUgcDd6aXAgaXMgdG9vIG9sZCBhbmQgZGVh
ZCBzaW5jZSAyMDE2IGFuZCBoYXMgbWFueSA8c3BhbiBjbGFzcz0icmVkIj4NCnZ1bG5lcmFibGU8
L3NwYW4+IENWRXMsIHN1Y2ggYXM6PG86cD48L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBj
bGFzcz0iTXNvTm9ybWFsIj5DVkUtMjAyNC0xMTYxMjxicj4NCkNWRS0yMDI0LTExNDc3ICZuYnNw
OyAmbmJzcDs8YnI+DQpDVkUtMjAyMy01MjE2OTxicj4NCkNWRS0yMDIzLTUyMTY4PGJyPg0KQ1ZF
LTIwMjMtNDA0ODE8YnI+DQpDVkUtMjAyMy0zMTEwMjxicj4NCkNWRS0yMDIzLTE1NzY8YnI+DQpD
VkUtMjAyMi00NzA2OTxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1z
b05vcm1hbCI+Jm5ic3A7PG86cD48L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0i
TXNvTm9ybWFsIj5UaGUgN3ogaXMgYSBzdGFuZGFsb25lIGNvbW1hbmQsIGFuZCB0aGUgdmVyc2lv
biBvZiBhbGwgYWZmZWN0ZWQgcmVjaXBlcyAoYW5kcm9pZC10b29scywgcHl0aG9uMy1yYXJmaWxl
LCB4YXJjaGl2ZXIpIGhhcyBubyBjaGFuZ2UgYmV0d2VlbiBtYXN0ZXIgYW5kIHNjYXJ0aGdhcDxv
OnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+c28gSSBi
YWNrIHBvcnRlZCB0aGUgbmV3IDd6aXAgcmVjaXBlIHRvIHNjYXJ0aGdhcCB0byBpbnN0ZWFkIG9m
IHA3emlwLCBJIHRoaW5rIHRoZSByZWdyZXNzaW9uIGlzIGxpdHRsZTxvOnA+PC9vOnA+PC9wPg0K
PC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+Jm5ic3A7PG86cD48L286cD48L3A+
DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4vL0hvbmd4dTxvOnA+PC9vOnA+
PC9wPg0KPC9kaXY+DQo8L2Rpdj4NCjwvZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_AS1PR10MB5697ED581F502680854FBAD3FD022AS1PR10MB5697EURP_--


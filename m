Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FB37CE7D12
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 12:42:09 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.59])
 by mx.groups.io with SMTP id smtpd.web10.80207.1727786528274173232
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Oct 2024 05:42:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=frj60XGa;
 spf=pass (domain: siemens.com, ip: 40.107.22.59, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hFkqjph0jXvP5J1KABIpFBLKUizNILgqWjDcn0pe3RgAXizNJCQByeHj9OkZkRTrOCNhhIhmjU1rkLsY4SyWqyDc29pAOhummR4n/xLYJqU8grRh2crwEKvzjNRbkGO8XFN6jGUgttRUxtoaA5pYncVKRp2+H3TpyquXUxBj8jbm5Nc3aaj8f8wVoq2/v0pvNmP9E1M2DWI17E57IYedSsCORwBUwGtwmfWjj+g1NqC4/XrwUny27PvWR4OHsoYhZ/mlbiz2xSqJWZvSOZDXwtuDILREHZrJcwYfzGZUM/uRQYVdWxaGl+NBeZ1HIxbOpniCQhbIgFdQe8kgg3Jj/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7t/FD+X7cuWYdhcbT518Pwb1uEdBZbwIk0fhVDx9jHQ=;
 b=OLPcs2OScecczkNQzPVJWoukz3fR001MSyuJ7R571CiVtioXiaRhh15B4VB8p8cyg12yey6uvry3qFaiODd5aGHwbZgolNtBLLig9ExfNcfYzhdhEiLbIyL/tm9L9xrigNXXENJAenH1l8pKT+liFqI5XUYTqA65+B1AOSy3xYeN+QGff2AFir/DlCfrRv0ld6+tkNG7tGYn3bXNJMaPKGkSZsLpZLAlMHHZ/mz18O47Exh4Pv76mQpATtBf8p+oGap3FFibgwLIq9ikaMqM9LQzBKFsHB+xeGtDr1fRdXSfQlIQ7ajndGTxxjgdH6BTM82GAhMJHdcNobRCf6PXXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7t/FD+X7cuWYdhcbT518Pwb1uEdBZbwIk0fhVDx9jHQ=;
 b=frj60XGa08amgxP51qvKADz0TFPJcW+yw/fs20xtM8zcaC4xxDTIqcsNH8eyqFgXqqkrMznrzme3EqhOlesFzjmYV7+98hiUHyo1c7KCUmSEv6DsVMBuymbFpi675QPkNQ0V94wuZgC+UejLADUAZ5SzOj5l6iBR8MrNyLn9NWBS8HnxeJRfcmaLMj4nRYsoS/D90AUOnopsLjsgOSUH58532Z1Zit5I0fRX0Tp3KXlU7BTfsG2U+MdWB2Q/Z9jt+clrQGASlbUfCTV5U2/rnNrgAiFoT2LQ+AsWljQw805Uixgl5PLQu8KuVEloJgViyXKvzYxu8HKEOtugU7/beA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AM8PR10MB4052.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1ee::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.25; Tue, 1 Oct
 2024 12:42:04 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%7]) with mapi id 15.20.8005.026; Tue, 1 Oct 2024
 12:42:04 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "peter.kjellerstedt@axis.com" <peter.kjellerstedt@axis.com>, Yi Zhao
	<yi.zhao@windriver.com>, Yi Zhao <yi.zhao@eng.windriver.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][PATCH 1/2] protobuf: add abseil-cpp to RDEPENDS
Thread-Topic: [oe] [meta-oe][PATCH 1/2] protobuf: add abseil-cpp to RDEPENDS
Thread-Index: AQHbDMIt3bntBRVM80a3hbvtyvq5VrJlvNcAgAILqACAChDZAIAACeFQ
Date: Tue, 1 Oct 2024 12:42:04 +0000
Message-ID: 
 <AS1PR10MB56979DF6B1DA72BE50B9D217FD772@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20240922073618.1359707-1-yi.zhao@windriver.com>
 <DB5PR02MB102135305A71D2997E959868FEF6F2@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <202aa218-94f5-46bb-a514-6118ad457078@windriver.com>
 <DB5PR02MB1021337FE7EFF0AE0B9BC1CB7EF772@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: 
 <DB5PR02MB1021337FE7EFF0AE0B9BC1CB7EF772@DB5PR02MB10213.eurprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=8e9c87c2-3b4d-4f24-9a9f-1c7dce8ed804;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-10-01T12:35:17Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AM8PR10MB4052:EE_
x-ms-office365-filtering-correlation-id: 38b215b3-9256-46ae-f7ff-08dce2167439
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?T1pCMW1rOElvZmdzUnN3NkpSL3lzSWNmaWl2bmFxY3QwUjlKS2tPZ1gwWU95?=
 =?utf-8?B?Y1ZzNTdJQlFFbjltc2dXUmdOc3A3OXE2N0RER1Y2SXJKVW5SSll1OXdxeXFl?=
 =?utf-8?B?MU1jYy9EKzMzVmFKN3FaTS92VzIwbHdSVzRkRGtxbFlBU1AvamNEa21XcDZl?=
 =?utf-8?B?L0JyeWdYSEsrbXVFejI3L3ZKZFpHTXNITld5SElBaEVLd1BOUE9Gc29GSyt3?=
 =?utf-8?B?b1haUEF1a1VEbWVUS1ZOZFk0Q0xUays2ZkcycFdvclJzUmpnSjVYNDByMVp1?=
 =?utf-8?B?MVNTczJVVklIK2Z2b2FKMnA2RFllMU56ZTZQVHVuVWNUb2hzd2lQL0Iva2lx?=
 =?utf-8?B?UHFMSjJodU1lZ09Bb2w3SldWWmU5R3NTbE5aSHlncFAvM2czc29PeVljcmVs?=
 =?utf-8?B?R25NNVBSRmhhS2RWWDhXVU4vUHhpYjAwYlM4NXFWdlZVbkRta0JtTEU2K0JH?=
 =?utf-8?B?VzhNMjhVeHQ0WEN1SzdDSzZHRkMwTFpFK0QwaUZ0YnV5Uk1HY21uNzJDZEpP?=
 =?utf-8?B?R3RWL0wwcTl2SDZOMmVkSkpyNlF0anljQXRjLzlQWTF5aXlqRnk0SzBwWGww?=
 =?utf-8?B?ZXpTSW1tUm5QL0x5SGRUWnFoNzlhOGNEeGJVOWZ3dnMwVmVvN1J1bW9ReG12?=
 =?utf-8?B?OGVBSjM5cWhLZlhRSGhtNEJodngzRFlnUWcvQmVXQk94d2JnakdieDRoV25C?=
 =?utf-8?B?c29XL05Cc3I4SG51RC9oMzBld2ZVdVROMnJNSXBuZ2FXYjcrRWxtU0N1ZFAv?=
 =?utf-8?B?ZE9oVVo0ZGF5SFljaWFyVU5aTkZhSnViTkNRdk8zUElvYXlvaEJDdG1LY0hC?=
 =?utf-8?B?RjlYZHVGNGQramY2T0ptLzZwVUp2VU9YU3NJdmFDbFNqUFdLQWpWY0hTemo3?=
 =?utf-8?B?YlFwcEZuaExOaXR3cUs4Z3JoT1dWTzRqaWN1T0M5QVhLaUVFY1VPMHZHZDVp?=
 =?utf-8?B?SFpDOVlKcWNGczRuVGJ4QTl5WVF1VitmdE1IYzYwaVVWand1Tld1UzloZExw?=
 =?utf-8?B?OHY0U0Z0Q2lmTUJxMlNGYU1HL2lTTnVjaUtxL1VWSE1VcFV2bUF2ZnpET003?=
 =?utf-8?B?cDJWMjBHZG0rVUdJR1RENXRoNWVPcTNpdWk1QXc1dk5UL2JCVkpwL1N5MXpX?=
 =?utf-8?B?WWNzNHNuT0Zmdng3SUJuVzNlMlFXQzdhU0prZG1JelpxSVRldXgwM1J0Z1hz?=
 =?utf-8?B?d3dmRFl1ME9ZY2crZlBHVzlTQ1NUbllHdTdzNVRlczJuZ2JkNXpxRXUzNDNr?=
 =?utf-8?B?bjVEZk16SVJzem5iSVdsZ1luUWxzbnN1Tlp1RityWlNkRXRzVkVtV05ZSDlC?=
 =?utf-8?B?TXBJVGFpQVpiQnQzVjI1YThMOStZd0pzK3RGb0duL2Q3V1dsa0l3UzB4Wlpm?=
 =?utf-8?B?d29sek1XRmNuT2hiR2pGR0dxY2VCR2ZReTUvZ25iUHM5bnZ0QVdtTW0zbUFT?=
 =?utf-8?B?OWJBYS9pQWxnUytnMmhqSkIvRERKOUdDWm9vN0JmRXhqamowckU3SVNxZXRW?=
 =?utf-8?B?YWlkSUdMMWlXVUFkRzlIREVtR1B5VjZtclRObTlSZ2lLU0NBU2t5U3RyTkVp?=
 =?utf-8?B?Mzc2d0IwbUZZWVNoU1lMS1dLcU5FbDFiQUFnbWdhSmsxR1A0SjR5MVdWSmtK?=
 =?utf-8?B?ZW53SU5Rb1lNZWJCMCtyWUpMeHNzbkwvekdQYXZWYjA4bytDdjh5cERRNEFi?=
 =?utf-8?B?bjEwT2pCd3N5ODdXOCswdFB5aEV4QUxYL0gzSzh4QTlSMWh5dkZyN21ja2xr?=
 =?utf-8?B?cWJTcWJZYVp5OTh6bWZDR3hXYXdtVmdsSncxa0dCeG9Dakx3L2Z2N3UvTWFN?=
 =?utf-8?B?NmI0bGhYS3ZPK3ZDVDNiUT09?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cHQ5dVZSL1dpN3pLeFg3MHptaW11dWlUVnJkekdvL0hZVHZlVWJhYlEyT1Vh?=
 =?utf-8?B?emhFYXB2aitVOERFSXNxL3ZxaWJDay9XcTRFazlqY04wb0hQN1ZwZkJ0SHR4?=
 =?utf-8?B?YzBpZFhRSFdud0NmYVJCdVl5R25EdnBiM2lWTFhOa05wVWZNbmJmSWtHREYx?=
 =?utf-8?B?Vld3ZVJSNFhrNkpLYXRzemdxVm9qNEZ2ZHZaSkM1STRqaFZWN3Qzay9xeHUr?=
 =?utf-8?B?ZFRUbXZQRUVFa3N6ejRLRElmeDd5YXF3OEhvb2t6SmthMlJCNWEvSGdNb0lL?=
 =?utf-8?B?c01VQ1hubWZSakxQZUs0TEhMUUc0anZSeVFodDJXcVlSN2lQcFlzVjZCT1J6?=
 =?utf-8?B?OVFhdmtjcFdiU240Tmp4bE9WL3lPc1lFbnE3SFVtWXJUckRnSGNHQU9Yc0Zw?=
 =?utf-8?B?Nm5ubTVoZUk5TURTOWVZbDVGZVdJZ3F6MjY5b2NOZnR4aTlIMk5QUTN0dUtn?=
 =?utf-8?B?M1dETkxsTTk5TzkzbjE5Qk5zbVVvdnB5MjZoSTMxdUVRQUhkdjBvc2VXYUNC?=
 =?utf-8?B?d2hReWhBT3cwNElSa0FGbHlwbW5uTDFLOGlId0g0L2lERXd3dlBzQXBEZDlm?=
 =?utf-8?B?dnU0WmVOQ3h5ZGx4SW1RUVVBWVB2L1UwbytnYzlQZUZGMkg0eUIya25RWjlV?=
 =?utf-8?B?YmJLV0F0R0dtanZ6WDhYcStHcG1ucDg2VkdsdkJaWXM2dGNVSmM2SG9zL1VB?=
 =?utf-8?B?V0piUi9JWGlDUXpKZVNKMkt6YUtrQW5SRTRxdEtIbWlwMTJxeWVlT2plQUtX?=
 =?utf-8?B?ZVVPS2JxakFZa0NuUHY3MmQ2cnJhU2I0dTFjVEdhc3M3VXNzYzhRM0JnY0Zk?=
 =?utf-8?B?T3p4UG9KMUpId0djMGJ3amNyU3FVbkFMd1dMdmhKdHAvcHlLdDFRYWZBRSs1?=
 =?utf-8?B?bWJNcndJeDNLSmwwaWZjOUhKQ0g3OEp3MW9nZFdHdHlucU1rdjNSWFl5YzAv?=
 =?utf-8?B?bDVWS0NKeTB1QWxWU3VjeXdLNmdYa29vRXFhZHBrOWxFK2hsUkhiTWdGVTAr?=
 =?utf-8?B?dVBLOE84U2MxejY3Q2p0a1dkY1NkdVFtVWE4QVBSWC8vbGVTeUxvTGcvZlNO?=
 =?utf-8?B?RUQzME56S285c2JjVVJxMGRhaWd2T0FnVVYzaXI0V2dUNWp5QXdScGxHcWhR?=
 =?utf-8?B?eEpyRG9XekVMSDRXNkI3dllheWlmRkdIczhPMGdlRC82MlltVCt4d1NHQzB5?=
 =?utf-8?B?cUE0L1oveWlUTlQ5NFV0cUxqQWRCMlR3cWc4MlJGUWN0WFhuN3U0aGp6ZzU2?=
 =?utf-8?B?TlhGdjYyQUVwcFR3N1Q3YjJqQU9uamQ2SzBEMTYvNjg5YTNHcjM3aGZSOC96?=
 =?utf-8?B?K0trUVVNWXFPenhUVnJwU0RKZGN5NCtwNjRMaFNqeEtlcFdBY255VUh5czBs?=
 =?utf-8?B?OUNmanNJc3JyWGt0UXA0SkJpWERjVENnMUd4T3Z4MmU3K1RJMUE0OVIxWHla?=
 =?utf-8?B?SlRSdTdGL2dydmpSWE9DZDRYRHVkclVUTjZidW5EZnJ3ZHVlYlNxUHZjQStR?=
 =?utf-8?B?UmdSQVIxSUpZT1dEOFc0M2FJU3RNeTNwQWpER3NBV3RKVVRkL1grOExJVUEr?=
 =?utf-8?B?eXp4V2p5UVFQTjZBaU5Xd2t5T0NIdU5hRFFMdThUdmVKblZBMnU0cVExK3Rr?=
 =?utf-8?B?MVFTSjI3WmFOREZhOHRvK00rVmNNZENyRkRKUEJXNmpsQ1dkMzNKYlQxK0g0?=
 =?utf-8?B?UFg2Nm1jOFFGQnA4dm1iWjc1RHlrZi96TzhINWxpRy9OaTVnb2pJbTNrejFU?=
 =?utf-8?B?SlNDMEF2ZXlxQjFqc3QwQVR1QVRUY29mL2lOOGZ2OElEeEVOVHUvV3l0NDhB?=
 =?utf-8?B?Uys3L1ByeUUzMHFSdjVJVkFVa3NRbFNsTE9iTXIrT1NZcFJSckh6MjJSVmdj?=
 =?utf-8?B?YXU3bDRxbWpxOU82UGVyT0NuRXZZdS9GNTNXV1h2Q2pQQ0RRN0MrTWVWekQy?=
 =?utf-8?B?NmE4TjdtemNpTlFoc0RKeERiQTBCbkJIckdZVHUwdkNNTDBmb2F6U05CNG14?=
 =?utf-8?B?NUdCMTJjN1NCVGZWRTBTVTNhT0UvK2V4VXdIQ1J0VTJCVUFzbXZaK0k0bEh2?=
 =?utf-8?B?OVg5QVN3YnlKUUZ5V3FIQTYxaFJwc2JyTW96dXYzbVJFb0FtakY2Unk0SWtz?=
 =?utf-8?Q?T00V6T8Nhk5cOMsSNIg0p7isy?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 38b215b3-9256-46ae-f7ff-08dce2167439
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2024 12:42:04.6492
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MwCmbUHslZnK0n+g+9sAjWCMYzFfynK9KdLQZsPD7fDr99B/dzzEVOdtLpwBFzhUoU1D67qyjNPDvH4HTiLTeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR10MB4052
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Oct 2024 12:42:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112631

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtZGV2ZWxA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLQ0KPiBkZXZlbEBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnPiBPbiBCZWhhbGYgT2YgUGV0ZXIgS2plbGxlcnN0ZWR0IHZpYQ0KPiBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnDQo+IFNlbnQ6IFR1ZXNkYXksIE9jdG9iZXIgMSwgMjAyNCAxNDow
MA0KPiBUbzogWWkgWmhhbyA8eWkuemhhb0B3aW5kcml2ZXIuY29tPjsgWWkgWmhhbyA8eWkuemhh
b0Blbmcud2luZHJpdmVyLmNvbT4NCj4gQ2M6IG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbb2VdIFttZXRhLW9lXVtQQVRDSCAxLzJdIHBy
b3RvYnVmOiBhZGQgYWJzZWlsLWNwcCB0bw0KPiBSREVQRU5EUw0KPiANCj4gPiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206IFlpIFpoYW8gPHlpLnpoYW9Ad2luZHJpdmVyLmNv
bT4NCj4gPiBTZW50OiBkZW4gMjUgc2VwdGVtYmVyIDIwMjQgMDQ6MTcNCj4gPiBUbzogUGV0ZXIg
S2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+OyBZaSBaaGFvDQo+IDx5
aS56aGFvQGVuZy53aW5kcml2ZXIuY29tPg0KPiA+IENjOiBvcGVuZW1iZWRkZWQtZGV2ZWxAbGlz
dHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+IFN1YmplY3Q6IFJlOiBbb2VdIFttZXRhLW9lXVtQQVRD
SCAxLzJdIHByb3RvYnVmOiBhZGQgYWJzZWlsLWNwcCB0bw0KPiBSREVQRU5EUw0KPiA+DQo+ID4N
Cj4gPiBPbiA5LzI0LzI0IDAzOjAyLCBQZXRlciBLamVsbGVyc3RlZHQgd3JvdGU6DQo+ID4gPj4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+PiBGcm9tOiBvcGVuZW1iZWRkZWQtZGV2
ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLQ0KPiBkZXZlbEBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnPiBPbiBCZWhhbGYgT2YgWWkgWmhhbw0KPiA+ID4+IFNlbnQ6IGRlbiAy
MiBzZXB0ZW1iZXIgMjAyNCAwOTozNg0KPiA+ID4+IFRvOiBvcGVuZW1iZWRkZWQtZGV2ZWxAbGlz
dHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+ID4+IFN1YmplY3Q6IFtvZV0gW21ldGEtb2VdW1BBVENI
IDEvMl0gcHJvdG9idWY6IGFkZCBhYnNlaWwtY3BwIHRvDQo+IFJERVBFTkRTDQo+ID4gPj4NCj4g
PiA+PiBTaW5jZSBjb21taXRbMV0sIHRoZSBsaWJyYXJpZXMgb2YgYWJzZWlsLWNwcCBoYXZlIGJl
ZW4gc3BsaXR0ZWQgaW50bw0KPiA+ID4+IHNlcGFyYXRlIHBhY2thZ2VzLiBXaGVuIHByb3RvYnVm
IGlzIGluc3RhbGxlZCBpbnRvIHRoZSBpbWFnZSwgb25seSA0OA0KPiA+ID4+IGFic2VpbCBsaWJy
YXJpZXMgYXJlIGluc3RhbGxlZCBhcyBydW50aW1lIGRlcGVuZGVuY2llcy4gQnV0IHRoZSBvdXRw
dXQNCj4gPiA+PiBvZiAncGtnLWNvbmZpZyAtLWxpYnMgcHJvdG9idWYnIGxpc3RzIDY2IGFic2Vp
bC1jcHAgbGlicmFyaWVzIGFyZQ0KPiA+ID4+IHJlcXVpcmVkLiBBZGQgYWJzZWlsLWNwcCB0byBS
REVQRU5EUyB0byBlbnN1cmUgdGhhdCBhbGwgcmVxdWlyZWQNCj4gPiA+PiBhYnNlaWwtY3BwIGxp
YnJhcmllcyBhcmUgaW5zdGFsbGVkLg0KPiA+ID4+DQo+ID4gPj4gWzFdIGh0dHBzOi8vZ2l0Lm9w
ZW5lbWJlZGRlZC5vcmcvbWV0YS0NCj4gb3BlbmVtYmVkZGVkL2NvbW1pdC8/aWQ9ZGQ2NDIxZTY1
ZWI3NWMzNWE5MDRmNGI0ODdiYTAyMjA3NTAzNQ0KPiBlY2MNCj4gPiA+Pg0KPiA+ID4+IFNpZ25l
ZC1vZmYtYnk6IFlpIFpoYW8gPHlpLnpoYW9Ad2luZHJpdmVyLmNvbT4NCj4gPiA+PiAtLS0NCj4g
PiA+PiAgIG1ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9wcm90b2J1Zi9wcm90b2J1Zl80LjI1LjQu
YmIgfCAyICsrDQo+ID4gPj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+ID4g
Pj4NCj4gPiA+PiBkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xzL3Byb3RvYnVm
L3Byb3RvYnVmXzQuMjUuNC5iYg0KPiBiL21ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9wcm90b2J1
Zi9wcm90b2J1Zl80LjI1LjQuYmINCj4gPiA+PiBpbmRleCBjYzUyMDRkZTQuLjM1NGIzMjEzYSAx
MDA2NDQNCj4gPiA+PiAtLS0gYS9tZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMvcHJvdG9idWYvcHJv
dG9idWZfNC4yNS40LmJiDQo+ID4gPj4gKysrIGIvbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xzL3By
b3RvYnVmL3Byb3RvYnVmXzQuMjUuNC5iYg0KPiA+ID4+IEBAIC0xMDYsNiArMTA2LDggQEAgRklM
RVM6JHtQTn0tbGl0ZSA9ICIke2xpYmRpcn0vbGlicHJvdG9idWYtDQo+IGxpdGUke1NPTElCU30i
DQo+ID4gPj4gICAjIENNYWtlIHJlcXVpcmVzIHByb3RvYyBiaW5hcnkgdG8gZXhpc3QgaW4gc3lz
cm9vdCwgZXZlbiBpZiBpdCBoYXMgd3JvbmcNCj4gYXJjaGl0ZWN0dXJlLg0KPiA+ID4+ICAgU1lT
Uk9PVF9ESVJTICs9ICIke2JpbmRpcn0iDQo+ID4gPj4NCj4gPiA+PiArUkRFUEVORFM6JHtQTn0g
PSAiYWJzZWlsLWNwcCINCj4gPiA+PiArUkRFUEVORFM6JHtQTn0tbGl0ZSA9ICJhYnNlaWwtY3Bw
Ig0KPiA+ID4NCj4gPiA+IFRoaXMgZGVmZWF0cyB0aGUgd2hvbGUgcHVycG9zZSBvZiBzcGxpdHRp
bmcgdXAgdGhlIGFic2VpbA0KPiA+ID4gbGlicmFyaWVzLiBXaGF0IHRyaWdnZXJlZCB0aGlzIGNo
YW5nZT8gV2FzIGl0IGFuIGFjdHVhbA0KPiA+ID4gcnVudGltZSBlcnJvciwgb3Igd2VyZSB5b3Ug
b25seSBsb29raW5nIGF0IHRoZSBvdXRwdXQNCj4gPiA+IGZyb20gcGtnLWNvbmZpZyAtLWxpYnMg
cHJvdG9idWY/DQo+ID4gPg0KPiA+ID4gU2luY2UgdGhlIC5wYyBmaWxlcyBhcmUgaW4gdGhlIHBy
b3RvYnVmLWRldiBwYWNrYWdlLCB3aGljaA0KPiA+ID4gZGVwZW5kcyBvbiB0aGUgYWJzZWlsLWNw
cC1kZXYgcGFja2FnZSwgYWxsIGFic2VpbCBsaWJyYXJpZXMNCj4gPiA+IHNob3VsZCBiZSBhdmFp
bGFibGUgaWYgeW91IGFyZSBhY3R1YWxseSBidWlsZGluZyBvbiB0YXJnZXQNCj4gPiA+IG9yIHdp
dGggYW4gU0RLLg0KPiA+DQo+ID4gT3VyIGN1c3RvbWVyIHJlcG9ydGVkIHRoaXMgaXNzdWUuIEhl
cmUgaXMgaGlzIGRlc2NyaXB0aW9uOg0KPiA+IFRoZSBhYnNlaWwgbGlicmFyaWVzIHdpbGwgYmUg
aW5jbHVkZWQgaW4gdGhlIFNESywgYnV0IG5vdCBvbiB0aGUgdGFyZ2V0Lg0KPiA+IFRoZSBhcHBs
aWNhdGlvbiBpcyBidWlsZGluZyB3aXRoIFNESy4gVGhlIHlvY3RvIGJ1aWxkIGlzIGFkZGluZyBw
cm90b2J1Zg0KPiA+IHRvIHRoZSBpbWFnZSAobm8gZXhwbGljaXQgYWJzZWlsIGxpYnJhcmllcyBh
cmUgYWRkZWQpLiBJZiBhbiBhcHBsaWNhdGlvbg0KPiA+IHRoZW4gYXJlIGJ1aWx0IHVzaW5nIHRo
ZSBTREsgaXQgY2FuIG5vdCBiZSBleGVjdXRlZCBvbiB0YXJnZXQgYXMNCj4gPiBsaWJyYXJpZXMg
YXJlIG1pc3NpbmcuDQo+IA0KPiBDYW4gd2UgYXQgbGVhc3QgY2hhbmdlIHRoZSBkZXBlbmRlbmN5
IHRvIGEgcmVjb21tZW5kYXRpb24gc28NCj4gdGhhdCBpdCBjYW4gYmUgYXZvaWRlZCB2aWEgQkFE
X1JFQ09NTUVOREFUSU9OUz8gQmVjYXVzZSBhcyBpdA0KPiBpcywgaXQgcGVuYWxpemVzIGV2ZXJ5
b25lIHRoYXQgdXNlIHByb3RvYnVmIGZvciB0aGUgY2FzZSB3aGVyZQ0KPiBvbmUgcHJvdmlkZXMg
YW4gU0RLIHdpdGggcHJvdG9idWYuDQo+IA0KPiBNeSBzdWdnZXN0aW9uIHdvdWxkIGJlIHRvIGNo
YW5nZSBpdCB0bzoNCj4gDQo+ICMgUmVjb21tZW5kIGFic2VpbC1jcHAgc28gdGhhdCBhbGwgaXRz
IGxpYnJhcmllcyBhcmUgaW5zdGFsbGVkIGluIGNhc2UNCj4gIyBwcm90b2J1ZiBpcyBwcm92aWRl
ZCBhcyBwYXJ0IG9mIGFuIFNESy4gRXZlcnlvbmUgZWxzZSBzaG91bGQgYWRkDQo+ICMgQkFEX1JF
Q09NTUVOREFUSU9OUyArPSAiYWJzZWlsLWNwcCIgdG8gdGhlaXIgY29uZmlndXJhdGlvbi4NCj4g
UlJFQ09NTUVORFM6JHtQTn0gPSAiYWJzZWlsLWNwcCINCj4gUlJFQ09NTUVORFM6JHtQTn0tbGl0
ZSA9ICJhYnNlaWwtY3BwIg0KPiANCg0KSSB0aGluayB0aGF0J3MgYWxzbyBub3QgdGhlIHJpZ2h0
IHdheSB0byBkbyB0aGlzLg0KQWRkaW5nIHVubmVjZXNzYXJ5IHN0dWZmIHRvIHJlbGVhc2UgaW1h
Z2VzIHRvIHNhdGlzZnkgU0RLIG5lZWRzIGlzIHdyb25nLg0KDQpJIGFsc28gd29uZGVyIGlmIHRo
ZSBwcm9ibGVtIGlzIG5vdCBhdCB0aGUgU0RLIGxldmVsLg0KSWYgeW91IGJ1aWxkIGFuIHNkaywg
dGhlcmUgaXMgZXhwbGljaXRseSBpbnN0YWxsZWQgcGFja2FnZSBiYXNlIGFuZCBhZGRpdGlvbmFs
IHJlcXVpcmVkIGRlcGVuZGVuY2llcyBvZiB0aG9zZSBwYWNrYWdlcy4NClRoZSBkZXBlbmRlbmNp
ZXMgbWF5IG5vdCBiZSBjb21wbGV0ZSBhbmQgZnVsbHkgdXNhYmxlLCBvbmx5IHRoZWlyIHBhcnRz
IHN1ZmZpY2llbnQgZm9yIHRoZSBleHBsaWNpdGx5IGluc3RhbGxlZCBzdHVmZiBpcyBwcmVzZW50
Lg0KQXJlIHRoZSBzZGsgdXNlcnMgYXNzdW1pbmcgdGhhdCBmdWxsIGFic2VpbC1jcHAgaXMgaW5z
dGFsbGVkIGFuZCB0aHVzIHVzaW5nIGFsc28gcGFydHMgbm90IG5lZWRlZCBmb3IgcHJvdG9idWY/
DQpUaGUgcHJvcGVyIHNvbHV0aW9uIHdvdWxkIGJlIHByb2JhYmx5IHRvIGluY2x1ZGUgYWJzZWls
LWNwcCBleHBsaWNpdGx5IGluIFNESyB1c2VkIGluIHRoYXQgd2F5Lg0KDQpQZXRlcg0KDQo+ID4g
Ly9ZaQ0KPiA+DQo+ID4gPj4gICBSREVQRU5EUzoke1BOfS1jb21waWxlciA9ICIke1BOfSINCj4g
PiA+PiAgIFJERVBFTkRTOiR7UE59LWRldiArPSAiJHtQTn0tY29tcGlsZXIiDQo+ID4gPj4gICBS
REVQRU5EUzoke1BOfS1wdGVzdCA9ICJiYXNoDQo+ICR7QGJiLnV0aWxzLmNvbnRhaW5zKCdQQUNL
QUdFQ09ORklHJywgJ3B5dGhvbicsICdweXRob24zLXByb3RvYnVmJywgJycsIGQpfSINCj4gPiA+
PiAtLQ0KPiA+ID4+IDIuMjUuMQ0KPiA+ID4gLy9QZXRlcg0KPiANCj4gLy9QZXRlcg0KDQo=


Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 858B3C25B74
	for <webhook@archiver.kernel.org>; Sat, 18 May 2024 21:21:03 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.81])
 by mx.groups.io with SMTP id smtpd.web11.27458.1716067262462601418
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 May 2024 14:21:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=KU8kH4Dk;
 spf=pass (domain: siemens.com, ip: 40.107.247.81, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gx4fouxQYYwMsWbAq7DpyLH35NJybof/rs7hXYEkEG5NgJbwSO66FQ9jUMy2U24tAnFQTe/XlNEPpD3vJRtmAFKQwjIIaVSvwkCzWkn2DXkt44cLB/PYJSk99Aj4ajUYBuDJThNZ3CBxSfLOX3Z8xbIk1tvQj/IWtqsynWGtYibw8qlHVit9TZQuP66ft1J7pwLu4GPj1sPRrthatXYHx8KgqvgdfHNEREYG8+2hi5d5BE1ZyE44kw9aa+mfVXPdIbDj5rZMFegUM6A4IuzVLs0li5iq7a3oR5RfFmisIzrC+azmC5xoo4HXFi3HSAfYbrZGEHPtu+8tmoqighLD1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=noB9AnhHsOolrGv+QBpt9G2zCja4II/YwGwI1goaoKE=;
 b=fdGkIk8zWzPQtsZ5WDOtqrQkTcKi+mWvb6CyRsyjfcJ8VlAj2qVMxFaGdkgBLekSzE1DllktosRgXOtttN96ODqBrenweImoIXR+Y1wcQCrzJrJkdi6fNqCQ3iaPdEKOMmxdkG412wR3JMEHohgFPwQhoY3NJPe3w9IKVEe2GD26iHTRKaSh4+p02r6rKRm6yKGEATW+Oe7H8FJTIychk4VL5x99x+fzy1wDudx0HIx5acuyWQkQYDEN1lwAag46DEOksbXEKQSY6pbmSkHMHkQN+u5kMh+bpy6IafG9pHI2OdGsf16Hi7UQ5rlJEZW7jwxeUmlX2dN50NmP+29N3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=noB9AnhHsOolrGv+QBpt9G2zCja4II/YwGwI1goaoKE=;
 b=KU8kH4Dk7YdJDzDk5cYpNJB3LEGKFFMOAppTANj+1We9rZGf8ZtOSAdOxWaF7CY32NHVRpABltKgeRXr1DhJ1OMLorIKcSN/oL6BnA+H5kVIkIxaFqYKJYT0SJzAdSdOdbX9oAHa/mDL/X3xs0j15ciTefE0K3eAw2vdQ2bR6DJxsQ1wcHQpI336KUl1WYYSq7/2v6/wQhXwztroXjm/rUam2fhPkhf1mhrOYJMlCJuCW1gc7o1NR4Fcg57/h4HcM1ih1En/S4z72ufHM2YXmVmah3OX5zWpLUPRnAtlUutb3Z/gJ//ryzN9Z63UTCY62YO/gOZTytnqnrgg9sddoA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DB8PR10MB3927.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:165::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.34; Sat, 18 May
 2024 21:20:58 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.7587.030; Sat, 18 May 2024
 21:20:58 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][PATCH] nginx: Upgrade stable 1.24.0 -> 1.26.0
Thread-Topic: [oe] [meta-oe][PATCH] nginx: Upgrade stable 1.24.0 -> 1.26.0
Thread-Index: AQHam0hfqlfJxwUnL0STfXAvEHFzB7GBWnpggAAlRoCAHBvgAA==
Date: Sat, 18 May 2024 21:20:58 +0000
Message-ID: 
 <AS1PR10MB5697B3A4855CD50788B407ECFDEF2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20240430214921.2190109-1-peter.marko@siemens.com>
 <AS1PR10MB5697545E5F326721B30C40BEFD1A2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <CAMKF1sq5pXmiRFVFJsAnWdamfeWNW0oHrmFTUZf6j_91Yi6JJQ@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sq5pXmiRFVFJsAnWdamfeWNW0oHrmFTUZf6j_91Yi6JJQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=ed8f6b8d-87f1-454e-b674-e6630ba67ef8;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-05-18T21:19:40Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DB8PR10MB3927:EE_
x-ms-office365-filtering-correlation-id: 3c3f7474-b7f2-4b56-9208-08dc7780692e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: 
 =?utf-8?B?VGZFNVZ6c1JSRWZGekgzT2tuNXNyaWI3cFlXLzgvVGhUbDd2bDlXZnEvS0I1?=
 =?utf-8?B?M2FjMnRkZEc4S3FzaVB2bXBvZVdNQy90R0Q0ZmVXT1NXVWdUYmp4eUZoSUF1?=
 =?utf-8?B?RnIwb1dzZnBQTFhkNG16ZXBNdFdURDREWmZHeXFjNDdjUzVMdW80YkZsZEhz?=
 =?utf-8?B?cS9jNEhXSDYwNENWbmZwZkdkVGhSa1NqT2Rac2hLUG1oU2haeTU2R0tqZWNp?=
 =?utf-8?B?SkVLK2ppR1hONFNQYk9DQ0RCekk2cGYyR3dLNGNzNkJRRkZiQ21DQ0xmbkZU?=
 =?utf-8?B?aGFtUEg4Tjl4M2g3Q2tXTXVQWlJ5dERxWnpHK3RuTUZTQ05oR2pmbWtzUFpi?=
 =?utf-8?B?d1M1SGFMQ2tLYWdLZytsZFN3Q3lBQlNuUG9uOFNFdGRBOFozT1M5dDdyTHRm?=
 =?utf-8?B?UW1QU3JQVlZtQmtod2h1Z2NIcGp6V1VKS0RuaExkOTA4d0VsZ3JENm5DS0RN?=
 =?utf-8?B?bXZsQm9xMk1ibDliM3lNUnl0ajJVSHE0RXdGckw0UTZMOWRFODFlMUgzN3hk?=
 =?utf-8?B?cVZuMjJyMldHdWoxTGdDWElRZ1FBQkU5RzZ0TkVlcTh2UlBHOWlpSmNVSXpz?=
 =?utf-8?B?cTVIbVpueHBJbW5lOVF0RklQd2crQ0QwbDNuRnhNY05BUTRieVdJd3J5d1Nz?=
 =?utf-8?B?NnV4SkRGRGkrWGxyQThqcGpnSHNNNFVtaDdHaDBFSTRTWDM2cnh1aWdXZkIr?=
 =?utf-8?B?dDNvRUNHemMwcE1sVFlPQ3hSTXBIeldnYXhraERJQWpQckRpcWJDaURBbmxQ?=
 =?utf-8?B?bjkySlpDejF5SkZuVDgxZ2lqRkdpL2dQWnV3K1FzRGJkZTBKT0FXS0J4TDlG?=
 =?utf-8?B?cDEvdGlQZW1ldTdwM3R4S0FHVFM1cE1ycURXNW5JTHZPcHdhS28rZFc2Zk5I?=
 =?utf-8?B?bStLNEVSS2pFTWk0MGhaL3ZOTzl6ZEF6alJDRTQrcjBmVFZ6RTlsMHhqUFVn?=
 =?utf-8?B?Y20wNXdUdlE5QkxoWlRNSFZkZG9UVU1MRmZxaUJwSVNsT3I0NFdkTmhqQzI0?=
 =?utf-8?B?MHRrc0U1ekU0a3RqSkxTa2FpaDIyc0xvRHNpbUpmdHFQVklndGgyVDh4WlBj?=
 =?utf-8?B?OVlEcEhlaFprcWY5aCtXMUlMUkczSldYRnd4SzVUeEhQdjMzVTRZUklyNGhQ?=
 =?utf-8?B?UGFDMVRWRmFVZExuRDJ1Y0VKeU0zeDBTOFEzTmkrcVFRclR2ZmI1d0M2Z1FR?=
 =?utf-8?B?am5jRWlKRUNEaUUvc2dLV001VDhZT21XZjMzYkI5Q0d1UWd5cEk3R0tUR04z?=
 =?utf-8?B?R20rNkN4M2pHaDV6MXhSdlNHdHc5NnJjU2hvMStIQUMyZ0k2Y0F0Q3lRZ0RC?=
 =?utf-8?B?S0lWVDl5ejNZYjA0U3g5YUsrNjBNcWtPVDFDUHU2eTJaQzB6VDZPMkJNdFIr?=
 =?utf-8?B?aHpHc1llZGl5TlpPZzV6Yno2QU5hdzN5WHBJWkp4KzF0K25FcXlDdGYrYVpS?=
 =?utf-8?B?S1R0WXkwaEpXQ2l6U0VlRVJIVi9CL2xUTHNqbHN2VjllU2hqenFNdmc2V0dw?=
 =?utf-8?B?UHgwUnNHNjYwa3V4cGtjTWdVb3lmUWd5MDU0NXNZQTJ2Y1k3eTJYNWRwa1hD?=
 =?utf-8?B?TlhhMXV4aWVnaCtnczNSRmRncThWRGlPNVlSOUVaUmNmRDRPU0VNSks4Q1B2?=
 =?utf-8?B?RFN5RU1qck12Y3AyRmRmUXpFWEVmTGFwaVEvY2VJSjdFSVc0YUJZSXVRaUxl?=
 =?utf-8?B?S3ZWaVQwVzdQOTRETWxmcndqUWpaU2pLU1BLeHBEUm1aQU9lMW5tZjl3PT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?S0JNSkMyM0piUW4wOVFaWkxFdGJDVWtldk1TUXhoOE1RMTFmdEUvQjVOamVo?=
 =?utf-8?B?R2c3SWFiTTRRTHVJL3RjUXZKQm1xSGplelVoUXdqVEl4cXZROVNzYmtVOGp4?=
 =?utf-8?B?M3JQQy9abGJycU9zV1dvTmpaZWhwdXBrOXU5MUFLZ0FRTlFpWW5adDRTbmhs?=
 =?utf-8?B?ZU5URkwrbVVOdFBTNVFab0RnK1RLQWVCWVA5d01wRXl3a1VYd0l5NTFtK05k?=
 =?utf-8?B?Q1VPQ0hTUURNU3lWbTVocEtBUXdJcm9aQ2lwaUx2b2Z2V0xVOGRKb2R6b1Rt?=
 =?utf-8?B?aU9SaXdkdWpDNmJSOTdMUFhrTktXWXhUSnFjK29ncnNIK1ZCZld3VE5HOEF6?=
 =?utf-8?B?WjF4clpvay9hZmRpcENiOUl2OHlybmMrdldSV2pyM3dkaVdSTGZvbzQvMG03?=
 =?utf-8?B?bmZWWG1MTDVRVmhaNzlxK1BtOWdUbk5QbnpFUFJrblVPNEpRUDFudVBTVFRa?=
 =?utf-8?B?Y2pybDljV05UVEZMbE1TWHkxUEhvU3JDN0doc3lvVS9Vc091TG5sd3dkWmY1?=
 =?utf-8?B?cVZyd0dES0RFYmR6Y0JRSkh5U0lhWnFVNDhSMWxqc0MwYmZ1ZW9pK05mNXh2?=
 =?utf-8?B?MUlZS00yQ09Zc3JNdzZTKzRaOHppMHZhaUpYcUZidloxQ0NXZzl0RVNDTlFH?=
 =?utf-8?B?OTNabTM5dDdnRkxRdHJDakFyeDl0RUhqOEVWK3djeVI5cnNiQ0x3Y1NqNEtJ?=
 =?utf-8?B?U3lvUCsrWTZSYVJxTFVQZG80TEZqT0xMRDI5RzNZYTJEWUlyejNmNmQ0dEF5?=
 =?utf-8?B?QVpJdWJxdjZZWVNjbEZtSHR3Ry95bmhDckpodkN1TVNMOHRXWWdoRUVrd3Zh?=
 =?utf-8?B?UTlqQ2cySXF2YjY0R2cxMlBhUFZkL1dLM2NxQUtRa3lUYXhxNnR0bXI2Z1NY?=
 =?utf-8?B?dnNlcThFdzNmbmcvWHZZWFhhblRQY3NhR1VPMXVjWkFUbmoxbVJ3MXJ3YTVn?=
 =?utf-8?B?ajhHQ2ZQMnhmUC94eFFZZE85RmE0WTUrZmNwTm5XZHh4ckNHSzdCdXFLblNF?=
 =?utf-8?B?VjNTNTRuSzcxU3IzZVNBK203V3dvTHkzY01USGh4YnhnR29kenVIQXdQMGQ5?=
 =?utf-8?B?bWhkL2NWQmxLNGRUMEliVUJkL3ltWVJwSDZnMXE3U0J1cndGcU5kR3ZTZFVO?=
 =?utf-8?B?NTJ2MVRkaTIvSnhqTUVFdkhMUzVuZDFURENWT2ViQWdrYjdKZ0swczFnWWd5?=
 =?utf-8?B?ZkFSZmljZnl4cDhEWVZFTmthc2cyQjVTNW1LeXJsTnNIK1d4Yi9GbjBrbnJ2?=
 =?utf-8?B?VzhRNUVBVGpoQm9IQjlXNS9VaEFWdXpBWHhXOU1qbEpXaXliNWp2cHdGTmdp?=
 =?utf-8?B?dHFTaHhDWW91RjAzNFl2WHVQc0pxeEdNZWozOE4wRGhUeDRtaU00WVIzRGhv?=
 =?utf-8?B?b3BxZXBqZEMxVXlLVHRFcllDM3NzZWdLRUZMcVpHNlpPV0RvakhIcWE4WkMy?=
 =?utf-8?B?WDNxL2lQZndIRHhwbmgrZHZKS1l5WThWNTdMR1l6ckt0L1lodWdVd0RTY05F?=
 =?utf-8?B?Z2dRaGVxQzNXZWlydGw1SHhLWjlRQlJCNDlvYnRYSW82MWlJRmoyazhSd1pU?=
 =?utf-8?B?Z28ySGNyeGR3M1hLZEkvdlZJQmpjVFNQYTg0eU9pQXBRRiswdGYvbDdzWWJr?=
 =?utf-8?B?UCsvNXFiekVQUmR0YWF5REw1bDJJRlkyWjZZMHRiWm5oajR2MHdkbEV4RTdK?=
 =?utf-8?B?Nytxd0RDbzlWMnp2REl6QldLdHdYZzhGWjZHZUpDRHp5dSszZ0JPU1lJb1Rj?=
 =?utf-8?B?Rkg0bEQrVFZBbkNEYWdoRWUxY1NzVlB0SmZFd0g0WVpaV2k3WVFWcUd6eDVL?=
 =?utf-8?B?UkZPdDdkd2RIWjlpRWhJNWxUSTF6MkZ0QXVybDlsY2dmaUxDcVBxb3NqZWl6?=
 =?utf-8?B?ellMSzloU0poSFFKN2ViaUlISVhqa0czWUtsOFcrRTdoTWI3SVlQZTBmYkkw?=
 =?utf-8?B?SFZnbkdsYmF5Q1dtZ2xUYVZiSUlweWM3R01IZ0tGNTZmdys5NThvR2FpaDZN?=
 =?utf-8?B?WlAvdEdDRVE0OUtDd3NsTlh4TE1YYktxR1gwVmVYek9TQ0lTMWRoVDBOZUQy?=
 =?utf-8?B?VDZJSk1GeUVOaGw2TER1a1p5QTNaSlJKSDdwd1N6NXAxZ1RBVVM1bU5ieit5?=
 =?utf-8?Q?owardBT1g+SLu2opj2nxDuLaX?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c3f7474-b7f2-4b56-9208-08dc7780692e
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2024 21:20:58.3777
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FFPuZ9ZCaw+VHcEv2EXp54krX38NlVljkVqCGbb9j3k7hhahW1zkdkmCkZzQt5BWC3kQdGnnhWLryJA2EK96mA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3927
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 May 2024 21:21:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110435

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFp
bC5jb20+IA0KU2VudDogV2VkbmVzZGF5LCBNYXkgMSwgMjAyNCAyOjA1DQpUbzogTWFya28sIFBl
dGVyIChBRFYgRCBFVSBTSyBCRlMxKSA8UGV0ZXIuTWFya29Ac2llbWVucy5jb20+DQpDYzogb3Bl
bmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNClN1YmplY3Q6IFJlOiBbb2Vd
IFttZXRhLW9lXVtQQVRDSF0gbmdpbng6IFVwZ3JhZGUgc3RhYmxlIDEuMjQuMCAtPiAxLjI2LjAN
Cg0KPiBPbiBUdWUsIEFwciAzMCwgMjAyNCBhdCAyOjUy4oCvUE0gUGV0ZXIgTWFya28gdmlhIGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcgPHBldGVyLm1hcmtvPXNpZW1lbnMuY29tQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmc+IHdyb3RlOg0KPiA+DQo+ID4gQ291bGQgdGhpcyBiZSB0YWtlbiB0byBzY2Fy
dGhnYXAsIHRvbz8NCj4gPiBJIGtub3cgaXQncyBhIG1ham9yIHVwZ3JhZGUsIGJ1dCBzdGFydGlu
ZyB3aXRoIEVPTCB2ZXJzaW9uIGlzIG5vdCB0aGUgYmVzdCBzdGFydCBmb3IgNC15ZWFyIExUUyBy
ZWxlYXNlLg0KPg0KPiBJIHdpbGwgdHJ5IHRvIGdldCBpdCBpbiBpZiBBcm1pbiBpcyBvayB3aXRo
IGl0IGFuZCBpdCB3b3JrcyBpdHMgd2F5IHRocm91Z2ggQ0kNCg0KSGVsbG8sIGlzIHRoZXJlIGFu
eSB1cGRhdGUgb24gdGhpcyB0b3BpYz8NCg0KVGhhbmtzLA0KICBQZXRlcg0KDQo+DQo+ID4NCj4g
PiBQZXRlcg0KPiA+DQo+ID4NCj4gPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiA+IExpbmtz
OiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLg0KPiA+IFZpZXcv
UmVwbHkgT25saW5lICgjMTEwMTk5KTogDQo+ID4gaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQu
b3JnL2cvb3BlbmVtYmVkZGVkLWRldmVsL21lc3NhZ2UvMTEwMTk5DQo+ID4gTXV0ZSBUaGlzIFRv
cGljOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQvMTA1ODMwNDUzLzE5OTc5MTQN
Cj4gPiBHcm91cCBPd25lcjogb3BlbmVtYmVkZGVkLWRldmVsK293bmVyQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcNCj4gPiBVbnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3Jn
L2cvb3BlbmVtYmVkZGVkLWRldmVsL3Vuc3ViIA0KPiA+IFtyYWoua2hlbUBnbWFpbC5jb21dDQo+
ID4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gPg0K


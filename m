Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67071D3B986
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 11:25:42 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.56])
 by mx.groups.io with SMTP id smtpd.web11.44007.1732620324963827782
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Nov 2024 03:25:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=NHD+V0y9;
 spf=pass (domain: siemens.com, ip: 40.107.22.56, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XcTdNIo4bXZ+0d0Rvz51+VRGyMsjjZE3N08voBrX1huZEZTEF5jGxuWNCsfBxTiYcVOu4JMlyIjKMTslfXxIeQg44wxCIWyJX+2e3ufjZVB4QDO4Jj/0qW7svqSnp9BEfzu680thT+UMqfoemGWYjHfayKOz4U0I8qgtvMuRHPxv79Fk3l/keqV8O9PYeYorUzmOWiSUvAGLoe3KPeGTXdx2US8pnHyCQNVXLN9JYjqhuNrOkBT1Pjc7l1VIIcf/wYnJxONaZsER9Do47qtjp7V+1Ml4vOnABpySx5/b1FeZ7oxE38BOg9flItCEDWdWk636dxOMT2JsthCBJfwkLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GbNXh/HitmCV2v0k68pbAEhDCwMEH8qI5KnCY17kyUY=;
 b=dJgAfJvO/cQoVZht38XlQn1GKOne1btdg78dtCBkIaUbOfpHAn+XywUN93nde0BSPq99D7hClZ55XXCMHgvIDxEiqwXAftFfomZkrRhfMdshvANa43cUnF/60bfBTWTuC7pCWFZw1oUunhgU68BH8zZ3CZWjjpqSGo/tM3luR5aIQZMzhfb3Hp4E1vYx2Wy17fj4k5URaEEr+TP7Oty3hyZRJQVDKDCNwuWUitpbSjf/pltBGjkFzhp32pNBy1HbXLs38FDs4r9OOF3Bds+i6ZteqhtDokLm3fCmSYv8OVD6UFHHZbVolZOc/zEe4B9WWekLZ0dWps0lbntdg6QQcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GbNXh/HitmCV2v0k68pbAEhDCwMEH8qI5KnCY17kyUY=;
 b=NHD+V0y9p70PC2fp5KWrO96pPIgHY+LsxqBeSaFMq7hyQ2lSl+OFZOAfdSV5ladpkGYQ9iPso1ZtExIsdSD+yQsSu9Pcwl2lhq4btNCuWYKhYMd1aIgzr4MxzSoqTcwjViHRSz2ytMxcW7StWeMeYkuFR+dXyxz1PK9NUws+uU2ydJwHkjjWTxmHqEBiq5ydCELaogNGR5E6UCGk2n4elmbwJ5nZYIuueg6aUccfGigKX6Ehy12spYP8cAnwLbJebIbSAmHIjIQqrRr93JxeW+0iKkQq14XL2byCVJUH2C6+xvnf3BrkY8UxB2SRmISiNDgPkDrioyA0/xViYEpKTw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GV1PR10MB7978.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:8a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Tue, 26 Nov
 2024 11:25:21 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%3]) with mapi id 15.20.8182.018; Tue, 26 Nov 2024
 11:25:21 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Benjamin Bouvier <benjamin.bouvier@ekinops.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-networking][PATCH 2/3] bridge-utils: add CVE_PRODUCT
Thread-Topic: [oe] [meta-networking][PATCH 2/3] bridge-utils: add CVE_PRODUCT
Thread-Index: AQHbO++PIF5mcvcGREKxWAmpQX2TzLLBaRXQgAfNFYCAADys4A==
Date: Tue, 26 Nov 2024 11:25:21 +0000
Message-ID: 
 <AS1PR10MB5697F831946ED6F127DBD614FD2F2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20241121082901.2747720-1-benjamin.bouvier@ekinops.com>
 <20241121082901.2747720-3-benjamin.bouvier@ekinops.com>
 <AS1PR10MB5697EA4EDECB7A2FE01A9C2AFD222@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <7d40f30c-5644-41db-bb5b-ef01fe6297f1@ekinops.com>
In-Reply-To: <7d40f30c-5644-41db-bb5b-ef01fe6297f1@ekinops.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=70d2b061-4815-4fa3-85f6-93a6ff09750f;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-11-26T11:21:35Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GV1PR10MB7978:EE_
x-ms-office365-filtering-correlation-id: 92d820d0-fc43-49ea-2805-08dd0e0d036a
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?SWI0ZjVMeGdyUVhheThucThDK09pV0FTZnJYeUxKTTltR3hRalRHYmFkOW1X?=
 =?utf-8?B?OThidjJEekp2RnhnQ0JuYlJURjZuWW5kbVdraFR0MnRCQWJpNFdlQnFVRW42?=
 =?utf-8?B?SlBDa1FvR2lvVEZaNzJjSGV0OHJDcXp4ZU1UdkNBakVvYWR6eXk0OVJkbVU3?=
 =?utf-8?B?bGNWVW05UDE0Qm5iUkMzemp5VmFTblltRFk5UktuL2kvUnpGWXd0TGY1NEd5?=
 =?utf-8?B?M2lGUEFDSFhSZVpDN1QxelVuRllrNVB3ek9VeEdLcGhqZTNSY1I3eWp3WWph?=
 =?utf-8?B?aWZDTUoxRW80ZVZWcGtvQ1haUTB2bzl1clNKcWExeUdFWUgrYjc1MUNRYnQ5?=
 =?utf-8?B?SkRhRFRYWjFUY1RYVUhhTTZFQ05vV09PN1VDQi8ralk1MWlseGlhMG1sY3NP?=
 =?utf-8?B?T3R2WnhyZXF4dzRSa1hBUXpTNFNsL3NjcjhpV2gxRHRKWE8wZ3JJeGc0Y1Ey?=
 =?utf-8?B?eVpCVFN6LzlxUEZwV3YzcXJNRUxveS8yQzNaUnlKdTBMSHlmam5WdXllMHVk?=
 =?utf-8?B?a1RlWW1WNEdqbk5vOUp2OTg0aXI2UklrNWVmcnZ6TUdyNGQ3ZUdobnBWeWhM?=
 =?utf-8?B?YmljRy9hbXEvT3pLdHNMSWt2ZlVFdlNwd3hDVm1zUmllVEFJL0FudkRZN2JB?=
 =?utf-8?B?MnVRQW9raDdWMWhlcWYzZXlVbEtZbVdVaGJ4Szl3bzd4dENqbXlLeUp0cnhM?=
 =?utf-8?B?M0k2TFBDT0wwc3BwbDlsT0FYZlBSaXd6MEFGZ0tUWkVYb3JrRHhNaWNFK0p2?=
 =?utf-8?B?LzZlMTdIemlOckxWdTdvODVSOU04MXlWMzJEYW1rVWR5OUZQZHl5MVpRMUti?=
 =?utf-8?B?MVhPaUd0WXAyZllaUHBrUjBGMkwwN1NpSFFVeVJzZi9uYmZnV1QxYzFaVzRh?=
 =?utf-8?B?M3hIbVdtbURnOWJQVXNlYUNuNFJhVW9PL05sYkhJcDJCZXcyUjJtamt4VWM0?=
 =?utf-8?B?eGZPTE1iTklIS0NDRmQxYXhGbFhGVUl4Q3pMaVBmcVVxUjAzdDZETDRaVnB3?=
 =?utf-8?B?QnlJTzdWdjR3WEpRYnVNQjJNOEl6OTJ2TGZzRWovZTR5OEprT0Y2OUVaOXha?=
 =?utf-8?B?VHp6ZDZNTFFDcHJuamtTY2FJTTlHelpPNlVvbHE4NDExQTIzc2I1dTBIQ0Nq?=
 =?utf-8?B?d3NzaHZLRGZnUXVNbU1DTGRmUEdFcVJITm4wRk9nVjFidnhubEpKNXpZelM1?=
 =?utf-8?B?akJCWTNDcTdBMWtJZW5USE9VN2RZM1B6UXRucUNVaFNlUHZuNGcvaEZJZmg2?=
 =?utf-8?B?cERFUjVqaXhhQy9VRVVNUFYySUMyb3Vid0JmSythc0x0NVEwcDhYYjIzZlVZ?=
 =?utf-8?B?dWFSM3JITUczZkpZRG94TWZkd0xvTTlXR2NNYy9CWE1uTlJSVVU3UDFZMUdj?=
 =?utf-8?B?SmhwMmNJbEVrVDJtWGNmTEhCMTkyZVpNMTJDZWF5eVRrY0ExWTJybW9qd2RY?=
 =?utf-8?B?UlVkSExMQ3N5SS9JUnBvMm1wRFNOWStHcUFXZmdsR09icFRJbWdUV1pWTXAx?=
 =?utf-8?B?WEFIamcwOWlHeWpQYytoYVEyVEpIKzVDdGNQMCtSZ0NSUVFWUGJESDB3UHlV?=
 =?utf-8?B?N1F5MkZBU1hXczVSYVpWOXI1VnpYV0ZoL2hjZFVpd2U4UmhwY1RiWGN1Z0g0?=
 =?utf-8?B?WnlUWUFtb0paL0ZKTndzeDMrY0ZmckE2eXNFVVRWdE04US95TXhSQkYraEsr?=
 =?utf-8?B?aFN0S3lDd21USVg0aXQvMHZFeG02d2g2cTVlQ1V2MlJZaUdDTlROejlyek96?=
 =?utf-8?B?QXNtNThBTU5xMmdqTlBsbWdaakJ1c2V1ZW5JNmZQVEd6QlRaTXl2cGJEUGtm?=
 =?utf-8?B?ZDJQeHVBM0U4enRhbGdQSERzUThvck5TQllDMnkrQTlOUnZYMHI0SWF6clMz?=
 =?utf-8?B?bzZ6bG5Ka3I2OStZSFZnMUxZekZOaFFLK3orYTY3cDNxd2c9PQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cEg0UnVsa3E5c1NqZlhsSU4vMWRpVjNhMjZMMU1rcXhhTDlWamF1UmlPOFFO?=
 =?utf-8?B?Y1RsemRKZUZZM3JFWVhWM3d4THZsdGRZN0taSGpoem12dThxNDR4ZUROVGFU?=
 =?utf-8?B?eU1rTVZrSkI0NnUzQzdQTUllWVZ0YjRYU3BrcWZzaXp5TmdCWGk3R2FQa3RD?=
 =?utf-8?B?QjM3MVFyV3RiTEplcFlZdWxiS2RxUGJmSWhMLzZHL2ZLYUJQb3NMSm1BODBq?=
 =?utf-8?B?K0RubWUrdnM0YS9lU1h5RGtabTR2dk12a241b2wrejdtRklScjlocDVJaC9Q?=
 =?utf-8?B?UFVIVWZxSnJGTldMdkFjNVlEMkFtZ3Q0VnZhMVlPVC84VmhNOUI0OGlFTG9h?=
 =?utf-8?B?WFNBaFdxb1dEc3FmdlJNaGh0QlpkWnMwT3pzRys3UjdhaG5lKzVFMU1jOHA4?=
 =?utf-8?B?SGpBbllKWlBHSUhUYi9GbkNud3hSWms1QTBhSlhheXhEUWJ4Sks3Y09KeEk5?=
 =?utf-8?B?bFEvSUdtT1VPZmlPSnVNUDJ1bmYyeWhHTTd1UFNKZXhmVnE1MkZhYm1JTS9n?=
 =?utf-8?B?VGIvK29xOHZtRCtWS1lDT0JnWlJSWlJ3STNqclU4MEh2MGZDOEpOcUd1SnEw?=
 =?utf-8?B?YjhCL1JIa2MxVUZsVHM2dFZjMC9RL3VJMVVMekRYbzYyd1NwWXlDZk51cG9y?=
 =?utf-8?B?L09RdmtJSFZPdTM1aHRySExPVkk0SHQ1ekg0MHE2RzNIeTVKWTNIRlFXVmVm?=
 =?utf-8?B?M1hpNE8vZXpJdVhKTjQ0WEYxaUtNUGlsdTdnRlVQQUgzVzJ1T01SaHg0ZEZI?=
 =?utf-8?B?ZWczVGtJWkFNK2Q4TUFCR1B1L2dyS2hDaEFRdEhnL0g3ZWFmcElpVlhKUEcw?=
 =?utf-8?B?R29DT3lkWHo0MGVuQVNhdVdzY1FvTkQzWWlickhsak5sYi9Hdy9YNkVvV3V2?=
 =?utf-8?B?d2orT0lJSnh5OG9STlM3WGpmdWRtUEdFNWJraEVRblF4cDBPdlIrZzRVUmx6?=
 =?utf-8?B?Sk9PaG9XVEhybXZVRklod3RuRSszdGZPWE8raVRpUU1jNlhIN09GMlZqL2s0?=
 =?utf-8?B?RmhkY2g2b1hmN1BRWlUvc1pTWkVWWUJXcDJTYmFQUkc3dlpMNG5vQjlqSTNo?=
 =?utf-8?B?MDM1Y09qSWY0NGJYQi9xZVpYMlgzMXRFV3JPa2dRdTY1QmhFTkNSUEZtc3NZ?=
 =?utf-8?B?eUNJMFZ3U0Z5SkZZdVpVaHloTVViUUV0V1YyU0pjSmpzclJzVG9WNFdxTkNh?=
 =?utf-8?B?QXA0UTZSOWk1Z3lTcjgwMzFYb01pazg0TnFCd3NLMkxaNFhTRC84TWVyWUpw?=
 =?utf-8?B?ZFovYXRnUlpYREVNa0dSNE5LZE5KblZXRlVwcXpPQ0x2V0t0MlUvUEhXY2xn?=
 =?utf-8?B?eDRTbUFLcnU2aElNeVNjcHBmVWJHa1BMYUpRdUthQy8zRmV0NDJsUHE3K043?=
 =?utf-8?B?YjAzOXFZbkhNTnZkRExMbzMycGF1UG5SVWpsWU1CRTFlNGtERy9BK1E3ekk5?=
 =?utf-8?B?Z01OdUpGeG11QkdiencxeWJrUkQ4ZWZXcmJ3b2MzY003b2RNbE9UeVdsZy8y?=
 =?utf-8?B?T1U1b2doZE5mUFBCY0lpMmxQc1lTczVVazJTTkdtZy9oWXVhNEJuZ1VGYmhu?=
 =?utf-8?B?cmNjNTVsWHlLOTN3YXpaUzhVUXZsL1dIUjh4eHVRT2hVbWkzRHZrMUU3RTRv?=
 =?utf-8?B?QVZpTUdJUnVSZTRGdXg1TVgzMUJvQmJaMG5aVEtxb0FNdFdDbktTaXAzUTZr?=
 =?utf-8?B?TVpKQzh5UTNsYWREa2Rnc2hVekoxdkU2Q2hZai8xeTRqbXZpczFSaHBmZ3RX?=
 =?utf-8?B?RGptMWRneXBheGNDQytIb3RzTkdpL0ZNTVFQYVVKR3pSV2hUWEF3Rzdkd21D?=
 =?utf-8?B?SFBXWCtKY0JucWptdGVsZHR6YjhYZ1lsTnpLQmF4cVNQcHRoZmpKcGRObkJX?=
 =?utf-8?B?REhLQkFZdEpuUFpuYm83enZwdnM1enF2Z2gvdWVmZnhNUHp0M04wZDhXTUh4?=
 =?utf-8?B?TUk4Z3R1UlVubS9QUVVBQm1IS3F0MzBRTXpMWno3TEpRcmpNL2NvRS9VMlBa?=
 =?utf-8?B?bjYwWGU4YytuWHB0UHdtL1Z4RmVXSFBFSWdrcy9qbjVuRStNclphOHlEK0xQ?=
 =?utf-8?B?c3Z2a1JlZ083Nmp4dG1ReEpSalBaRE9nSUN4OUJPSld6ck45bVg4b0M0UnR3?=
 =?utf-8?Q?khbTLdqFhjaxgO+GfeO4Pdo/g?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 92d820d0-fc43-49ea-2805-08dd0e0d036a
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2024 11:25:21.0878
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1l0gDelIhDGsoF1c1SI2ZTT+LQ051gcqfK33LzARcF5UHWK4A6mpNoyDLUmM/YoDzZvJrlUTNsljBO1f1eVqcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB7978
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Nov 2024 11:25:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114071

DQo+IEkndmUgbG9va2VkIGF0IG52ZCBkYXRhYmFzZSB0byBnZXQgdmVuZG9yIG5hbWUgYXNzb2Np
YXRlZCBmb3IgZWFjaCBjb21wb25lbnQ6aHR0cHM6Ly9udmQubmlzdC5nb3YvcHJvZHVjdHMvY3Bl
L3NlYXJjaCAgDQo+IEZvciBicmlkZ2UtdXRpbHMsIGl0IHJldHVybnMga2VybmVsIGFzIHRoZSB2
ZW5kb3IgbmFtZS4NCg0KVGhhbmtzIQ0KDQo+IEEgY29tcG9uZW50IG9ubHkgcmVsaWVzIG9uIGEg
c3BlY2lmaWMgc291cmNlLCB3aGljaCBpcyBhbHdheXMgYXNzb2NpYXRlZCB0byBhIHZlbmRvcjpj
b21wb25lbnQgcGFpci4gU2V0dGluZyB0aGUgY29tcGxldGUgbmFtZSBzaG91bGQgaGVscCB0byBh
bnRpY2lwYXRlIGZhbHNlLXBvc2l0aXZlIENWRSByZXBvcnRpbmcgYmVmb3JlIGZhY2luZyB0aGF0
IGlzc3VlLg0KPiBJdCBpcyBhbHNvIGludGVyZXN0aW5nIGluIG9yZGVyIHRvIHN1cHBseSBtb3Jl
IHByZWNpc2UgaW5mb3JtYXRpb24gZm9yIG1ldGEtbGF5ZXJzIGxpa2UgbWV0YS1kZXBlbmRlbmN5
dHJhY2sgb2YgbWV0YS1jeWNsb25lZHggd2hpY2ggcmVseSBvbiBDVkVfUFJPRFVDVCB2YXJpYWJs
ZSB0byBwcm9kdWNlIFNCT00uDQoNCkkgaGF2ZSBhIGJhZCBleHBlcmllbmNlIHdpdGggcmVseWlu
ZyBvbiBjcGUgYmVpbmcgZXhhY3QsIGVzcGVjaWFsbHkgZm9yIGZpcnN0IENWRXMgd2hlcmUgcmFu
ZG9tIG5hbWVzIGFyZSBhc3NpZ25lZCBhcyB0aGVyZSBpcyBubyBmb3JtZXIgZXhhbXBsZS4NCkkg
aG9wZSB0aGlzIGltcHJvdmVzIHdpdGggdGhlIG5ldyBDVkUgYW5ub3RhdGlvbnMsIGxldCdzIHNl
ZS4NCkknZCByYXRoZXIgY2hhbmdlIHRoZSBDVkVfUFJPRFVDVCBvbiBmaXJzdCBmYWxzZSBwb3Np
dGl2ZSBpbiBmZWFyIHRoYXQgc29tZW9uZSBpbnZlbnRzIG5ldyBjcGUgYW5kIHdlIGhhdmUgYSBm
YWxzZSBuZWdhdGl2ZS4NCg0KUGV0ZXINCg==


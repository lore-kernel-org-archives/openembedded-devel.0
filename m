Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 398D9C28B30
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 20:36:35 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.84])
 by mx.groups.io with SMTP id smtpd.web10.5196.1742502990288528315
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Mar 2025 13:36:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=fTZUaeI9;
 spf=pass (domain: siemens.com, ip: 40.107.105.84, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j6zHIjBtaHB4cMbYVCS8EDjE4L5IgK+hcxbQm/MlLelXJwVc2tIyK68DTj3wZQUrjbMAuyyIjXwJuHQWCSn8DQ1JSlq3o8UxJ96o2F6QZAbLi+TBdwnO7QgpknO0U4G9XE+VnFzwR8VdI5RfbPESaxOspJnX1ENZ/JgA1Ldxp+N2Tf968wJdwg04cJKjfYAfKQhEHdeYOf88uaWrasYQSC3YVjKWRRVx3wUlTcKnAtqblxCJ/PMhQmC/VlC8RMd4ombmUnbrrn/VV9wdtRlQfhmiy/VSsA154U/gUVhSe5u+khXxrxKpQyeVb/PZFqgRKOulj4RFx95UkaDoR0llfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V8ZueKg/NF32UkLxVExCaioKMKqkdVCsQd8O3WVK4cI=;
 b=VGLXUFTzN1ekDpURH8Sb5azYeeVyhX1z5/P3Lo9jXxoSFLeX5bLsy0H3bbjdO0CFXiVhX1hkf59oirFcMIB7iyoF7OHvZ5y8ejdP7ghQKFvrvHKPpilQywXFtH1SAF6jiW4RzTKTQas9dOsaDwDUabgvCXHqm3yeFips0KC/zxvI7MdMEAotyzfRBqERQHP6LMYMjA0aV+sNGZwXzAXcvy89defftQNYIO2ZkT0t8atBNjBkslVloDJblosBrnRLEv3mggEavbDjyVTYWHm5JwQ2qdUgiOARbIuGQE6rR/tKXTE5Kpx6Tpoj53pVq1JIHnxL4A6Ut3pYRFiFEW3zVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V8ZueKg/NF32UkLxVExCaioKMKqkdVCsQd8O3WVK4cI=;
 b=fTZUaeI9ooz7lzNHP2cwsm38GAycjbKwnr7v1JBZvytj/4iKGAqiVA5iBRifqsB4gJ5n2s6DDUBcG2375aPb0MIo4qTXeHxvlhH+4AVmF2GeLixEVaJNhD3MgCgg6Al+sbLD7Zf3DJIAkREiPyCsdXCER9A7LUHGQjdyANdo19xwHBx9ye0bbtDmNMd6WByhIkBNu902xMEYtsqds5eXRY0MHxUxMslRUyYkcbvnajdMGkc9LZkroEVhsPNa50xh8bvFy67lWk8EZtZ/GSZ83hfEApGjlP/D8kcoy6uCs8NdGy9YX1H9AbbGdDF9VR046o1F07Iz2UmRIBYHdxxw/g==
Received: from PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:266::11)
 by PAVPR10MB7115.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:316::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Thu, 20 Mar
 2025 20:36:27 +0000
Received: from PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::4144:34cc:64ca:dd9d]) by PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::4144:34cc:64ca:dd9d%4]) with mapi id 15.20.8534.031; Thu, 20 Mar 2025
 20:36:25 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-something][PATCH 1/3] freerdp: patch CVE-2024-32661
Thread-Topic: [oe] [meta-something][PATCH 1/3] freerdp: patch CVE-2024-32661
Thread-Index: AQHbmdZtRrdD4EVH1kiB49ejdNu6zrN8eq+AgAAAixA=
Date: Thu, 20 Mar 2025 20:36:25 +0000
Message-ID: 
 <PA4PR10MB5707E922FDF1F4ADD6B675F3FDD82@PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM>
References: <20250320202606.1679616-1-peter.marko@siemens.com>
 <CAMKF1soQLwxn6cOiNcHYEBP_o=bUFoU_9wft4Ve3oY5s_JTtDw@mail.gmail.com>
In-Reply-To: 
 <CAMKF1soQLwxn6cOiNcHYEBP_o=bUFoU_9wft4Ve3oY5s_JTtDw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=2b6cfc43-a34c-460f-9653-b6169bac394c;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-03-20T20:34:17Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR10MB5707:EE_|PAVPR10MB7115:EE_
x-ms-office365-filtering-correlation-id: 57a80fb6-d874-489b-2a75-08dd67eee258
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|4022899009|13003099007|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?Yk45RGVpVHU2Z3d3N0NVWjlvMVVzOTY5Y3hsWVA2NHl5Q2JrM0grTG5reE55?=
 =?utf-8?B?eFV0aGdNQkZKT3dVRWlvd3NLV1RRL0FSM2FFZGtNNGxhcDhrMW93K0JUbytz?=
 =?utf-8?B?TFE0eXRRUXVrWGRuR09ob241RW9BT253RDB4azFtSjNCSEwwY3k4Q1Racm9y?=
 =?utf-8?B?SlpYZ1ZOUitMZFpIZzZIQ2N4MDdVSTV4dkVNYU1qdWNudGFEcTc2KzhHV25B?=
 =?utf-8?B?eHZCT0p3U1ZEZFVTUlpTV24wRlJVQkQ2dzVRaTNrQnBPYnIvWWVyaS9TK2sw?=
 =?utf-8?B?WWxMSjQrOXovcGQ0NkVjc2gzQ01YSklLRXkzcStCa3Y0T1IyUlFKalJPKzRF?=
 =?utf-8?B?SEsvL1pzaGppOTJJQ1JHdjJJdkdRVGhya3BCdTlRWFVaWG50a3NFL3p3Vm95?=
 =?utf-8?B?RFdVVFZJZW9NeC92WnhNejZhclNkcTB3a1d2YzRRaG5CUE85S1U5UjhXdTF4?=
 =?utf-8?B?V09oRDE2ak1OdlVaM0xnN0lSVWI0ZG9waitmdlZxejZNRTVZeG9GRlJEa28y?=
 =?utf-8?B?MmMvNEhPRHNiVVJwNzI3TjcxVjRkQkZyeU9hUHdBcWlucXVSRkxrQ1lVNUtL?=
 =?utf-8?B?ZEp5OTI2QUJ0NXpXSmtHa0IyaTlIcFhNK1FQRVhMc2NqVXhmT0E1dU9SVVpZ?=
 =?utf-8?B?Wk9NMzQ1ZTE2eFBxcko4UWZpcmRGaEVHZ0lvcFFUMHdvVy8yTmx4T2c5T2Jx?=
 =?utf-8?B?cDMrVjVjQWNPb1BQcS94ckY3QlZFbzZYQ0lwdS81SDUwcmRBaXE3V2J6aFZU?=
 =?utf-8?B?d2lOMTNwUFNUQURBdm4raG5MbU1zN0tHTXc5ZDFud3I2bnRNaHBBSmQ2V1F5?=
 =?utf-8?B?bHNtSGdBZkNmZ1JWSXlMOFlmU2pUOEtwN0dwVnhOL2VrQ1NYQnRLRDJzTlFY?=
 =?utf-8?B?blJueTNya0V1V0RXMnR5WU9iMnh0dEtUM1lEdG1qd0d5azFlREZVN3F5Yllq?=
 =?utf-8?B?NDRXWEJQdXkvdGpvN3lvTVUvYVU2RzJDTXAxM1FYQVQzaE42dFVtL1NxbmNj?=
 =?utf-8?B?QkpBRENiZGlUN2x3bTJCbVIwUzNKUzZmOHZKN2pub2Q3U0hCR3NwZDYxZHdP?=
 =?utf-8?B?UDY1Uk5CcjFXMHYzVjhLZm15c3dlV1dlRHgwQ1J0M1R2eXN2UzBxRUJJak1U?=
 =?utf-8?B?b3VLWFhnSkprTlpyZW1qUkV0blBQdjdQbUxiemEzM1JhMzg2WTBuZ2V5TU4w?=
 =?utf-8?B?NExlcmwrdURZcWVrNVJ1NkhBRG5PR1UvVzNMSHZ3UHRSY2NzZUpDRVV0eWZM?=
 =?utf-8?B?L0l0MUNlM1l1QkhjVFQyUEJNSFBmQVowcU1EWk5CQ0pKWE4zbWVLUmZjb21z?=
 =?utf-8?B?TGZhNExBKy95NnFCaEpDbmpzbzdacmU1NGpJZC9YakdiMkhFWlVTRUxrZFI1?=
 =?utf-8?B?enUzR1dDc1JsQ2pGd3JMTXNWWnZpZ21jK09tcDJBR090TlRQWTlmTURPbFFi?=
 =?utf-8?B?VDBiZ1hlUU5iR1FhanBFY3p0K0RKcVYxMWlxa2JDZ3liZzJ4OGpyY0xiSGV4?=
 =?utf-8?B?c0JXSEJDdHVUbm9YT2lGN2l2NW5zWW1DYUdrOFpsdzJLTUxCSkdKa0h0RERn?=
 =?utf-8?B?YmdMZVlsZUpPcVArTGxLbnpqdU05dExGT1ZKVGpPNFlSaEhrTVp1ZmhEbHli?=
 =?utf-8?B?TnFrNytNOUZkT0JHVVY0VlRJS3phYjEyTjVCUEtadFZ4S1lhVUUyWG5mMXhF?=
 =?utf-8?B?Y1NCQ2JvQWNQUGhOK2VNYSs3M0FGRkNqWUhWWkt4YjZudDl3a3ZrdVZQZDhx?=
 =?utf-8?B?amhPd1R3eTBocHhWWWxNTzlVWnBrVlJsMXBpZ0t5OGh2eXVncmx4Sm9lRGlJ?=
 =?utf-8?B?UUR2Ly9TZnUvRjk4TlFKQ3BMTG9Ga0pxVUMyVk9DWHVXWVpaT0taYlZGTHJm?=
 =?utf-8?B?VUZwNGpmTWo1cS82eGltbVhqdE82VWJQTXFjbk1RYlBLUHc9PQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4022899009)(13003099007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NmhTZWJ2WGx2OVkwWmtKODh4QUk1Q3kyaHpqaTFQOWd6VVNvQ1A4bE1MNkNI?=
 =?utf-8?B?VXJwOWtDbUE1SXFRMVV2RlN6V1NraWhIMVVxckVLQmtSS3F4elYwbk0wV25q?=
 =?utf-8?B?VEEvM2dxOXJZUWNNTkpEa1lqWC9LMGg3UWR4WjU1YkNQdGF2TS9Ya2JBNHox?=
 =?utf-8?B?L0lXTkFXODNmL3RTbGxCc0d4MEV6THZxYndBdk9jLytpWTdpRkQwbXlEcmw0?=
 =?utf-8?B?VVZ0b2k2VnBLZU9GZGNPQ2hwUnNkR0NMRVo2djJXeEFiRXBWamIyNEF3cDhq?=
 =?utf-8?B?ODVqekFnWkViUElZM3p3eVNKRjBaa1p3UHF0NHI5M3p1WWtkRVZXY093d2R1?=
 =?utf-8?B?VERtYUZqYVR0TkZXSzBJQU13MzM1WEdXK0hjRzN1MWFYVTByb2J2UTZUK29h?=
 =?utf-8?B?QVF1Z1NxeENFK01UeVJ6T1hkWjNTMGNxRXF0RGxnc3lreGpNNmF3aGF5Ullq?=
 =?utf-8?B?dFZCNDduLzNOYnZTUmlEbmp0S3dFcSt3VVNWTStIa0dlaHZPTmIrVGJjZ09G?=
 =?utf-8?B?b1UveThWME5Ecndzd1l1Wjg4em5TeTVlV1piT2pldHg1MEhLWG1zeG11YU9t?=
 =?utf-8?B?bWlpaDBVT3gwMXB3NzNrSjVMaDFMcUtrbnBRVHJKSWIybHBRTGlUMXQwZERO?=
 =?utf-8?B?aUlvMUZYWmh5eEFrenNXVG9sMk50d1hzUnh5WjZISnlLT2dFbExTUTJIaHRp?=
 =?utf-8?B?ckZ6c2twWStlNXVkVHR3RHZnL2ZNRk1QeTVkcVdrYkFMN0JDUTNtdFFIWW1p?=
 =?utf-8?B?S1RWMzdUNWY5anEyMzg4SHgxQjFwT3Njbjk5amNaSXdnQWo0TGhlTTVIM0lP?=
 =?utf-8?B?YzJ2Q1M5S2lFVUxJanFQNlNOeUNjOTF6NkxncG0xU1FQNlhSQXN0TGhNOVY3?=
 =?utf-8?B?aExWYzBMUnhxamxhYnhzbGo2TndUeXBvQjR2QTZ6NS9TUzJvemZaSVZYeVNm?=
 =?utf-8?B?U2M0MWxDaC8xUnB1aCsyYVU1NlJMeURtVGcrTC9iNDE1QW1rY1FmaGdYRy8r?=
 =?utf-8?B?TnA1Q2JMN0JXRlNpdzRpSzRmKzFQc3NXa3RmYXFMcXR2Tldzd2xNOXBmY0Va?=
 =?utf-8?B?MVpINHV0REd2Q1hzS3JmdkNyU3ZqZkp6TFhTY3p4QnowWk5BQzFtamU1M0tZ?=
 =?utf-8?B?bTAraElsYUZSWG1VVzQwQnFybkNTZzJ3RzU2eWNoNlN2R3Z2Z2k3ZXBZWDQx?=
 =?utf-8?B?VThpQUF6aHNRd0laSHp6b3V2WnVQcVNxUlhMK2ROcVBTM0hFZ3QySWV3eTV3?=
 =?utf-8?B?SXZHN25hR2FIaEd4SUVYbnJ2ODUrVEk2S3R4V0dHTCtaKzQzYVRRU2Mwd1J1?=
 =?utf-8?B?dFJwY3NDSEJWSzVUUXRpUC9sMnNDSTlpK2lJOE8rRFR4RFRaTDhJRXorT3pG?=
 =?utf-8?B?bjRFZmNnRWM3c3VrQThUdWZYVUltZ0hvTGFUeVgwWGxQeVlkVFpHNFVPNDJp?=
 =?utf-8?B?d2VJb1pZMTJ2SjhRUHhCTC9xV25uT1JBRHplSlRER25JbGt0YkgvVGQyTGow?=
 =?utf-8?B?cWhmT0ZyeitybmhFbVM0MEZGMVhTbCt5S1MzZW9ITkhUSVNDMitHdGs3dEZr?=
 =?utf-8?B?bkFJTGRrWkZjWTBqeVJjb2NqVnFSSVJ4Z0xpM2Y3cmJUNWNZY0hpOVNQMVVF?=
 =?utf-8?B?VGJRbzZvREdoNmdkZVd6d1NNN0I4dHA5eTJDY2s2aDZhREQ3U0FTcHRvRmtO?=
 =?utf-8?B?VmdDOW5naUw4R3dpc3lpekxKaWhKK1R5Z1dwNm1XTVMvKytnVVF6SGR0TUpx?=
 =?utf-8?B?eCsxcTE3ellWMG82cG1pTUFVM3ZSUjRtODdsOFFwcmpwa3VVbnZhWHBRQ3A2?=
 =?utf-8?B?SUFVTndCY00xOXJIcHNCeEFLalEwOHRLYmtlTWxUVkd1KzBhU05hTWY1YzE4?=
 =?utf-8?B?YUt6MUtIVlc4K2ZxbXdQQUNOcy9WaXpreXdEakFSeFV3ZnRDalJNd29YVDVk?=
 =?utf-8?B?eU5uaHhQQjRHM21rQk9vWVRaUEpZaVRxTGJWbmJrNTZNUnpzY1kxeWt3Y28x?=
 =?utf-8?B?M3A2RzZZZUtGemcvaVl2dDhQRlFBR2ljcG9LeitQdkhxNHNLQ2V0NjVlNWNH?=
 =?utf-8?B?ZXVzaExVU1cxdlgrTCtSOStjeE0vaTF5UUdWTElZODRQdkdrTTBsNG0reTZ0?=
 =?utf-8?Q?0GJ/DspgMgxq81lcvKbOLkIMP?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 57a80fb6-d874-489b-2a75-08dd67eee258
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2025 20:36:25.3631
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gS0fMrIOcDTX4DJKD1gfpKmK7A2eGTJm/KtuM6WTu3WKU8xl/inU1kOXolB/8AjEKyXBcUtJYZWTwVEnU4Y3OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7115
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 20:36:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116146

SXQncyBhIGNvcHkgcGFzdGUgZnJvbSBteSB0ZW1wbGF0ZS4NClByZXZpb3VzbHkgSSB3YXMgYWx3
YXlzIGhhdmluZyBtZXRhLW9lIGZvciBldmVyeXRpbmcgKGUuZy4gbWV0YS1weXRob24pLg0KSSBn
dWVzcyBJJ2xsIHJldHVybiBteSB0ZW1wbGF0ZSBiYWNrIHRvIG1ldGEtb2UsIGFzIHRoYXQgbG9v
a3MgYmV0dGVyIGlmIEkgZm9yZ2V0IHRvIGNoYW5nZSBpdC4NCg0KUGV0ZXINCg0KPiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29t
Pg0KPiBTZW50OiBUaHVyc2RheSwgTWFyY2ggMjAsIDIwMjUgMjE6MzINCj4gVG86IE1hcmtvLCBQ
ZXRlciAoRlQgRCBFVSBTSyBCRlMxKSA8UGV0ZXIuTWFya29Ac2llbWVucy5jb20+DQo+IENjOiBv
cGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTog
W29lXSBbbWV0YS1zb21ldGhpbmddW1BBVENIIDEvM10gZnJlZXJkcDogcGF0Y2ggQ1ZFLTIwMjQt
MzI2NjENCj4gDQo+IFRoYW5rcyBmb3IgdGhlIHBhdGNoZXMsIEkgbm90aWNlZCB0aGUgc3ViamVj
dCBsaW5lIHNheXMgbWV0YS1zb21ldGhpbmcNCj4gZm9yIHRoZSBsYXllciBuYW1lIHdoaWNoIEkg
ZGlkIG5vdCB1bmRlcnN0YW5kLCBpcyB0aGF0IGEgdHlwbz8NCj4gDQo+IE9uIFRodSwgTWFyIDIw
LCAyMDI1IGF0IDE6MjbigK9QTSBQZXRlciBNYXJrbyB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zw0KPiA8cGV0ZXIubWFya289c2llbWVucy5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3Jv
dGU6DQo+ID4NCj4gPiBGcm9tOiBQZXRlciBNYXJrbyA8cGV0ZXIubWFya29Ac2llbWVucy5jb20+
DQo+ID4NCj4gPiBQaWNrIGNvbW1pdCBbMV0gYXMgbWVudGlvbmVkIGluIFsyXSBvciBbM10uDQo+
ID4NCj4gPiBbMV0NCj4gaHR0cHM6Ly9naXRodWIuY29tL0ZyZWVSRFAvRnJlZVJEUC9jb21taXQv
NzFlNDYzZTMxYjRkNjlmNDAyMmQzNmJmYzgxNDU5DQo+IDJmNTY2MDA3OTMNCj4gPiBbMl0gaHR0
cHM6Ly9udmQubmlzdC5nb3YvdnVsbi9kZXRhaWwvQ1ZFLTIwMjQtMzI2NjENCj4gPiBbM10gaHR0
cHM6Ly9zZWN1cml0eS10cmFja2VyLmRlYmlhbi5vcmcvdHJhY2tlci9DVkUtMjAyNC0zMjY2MQ0K
PiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgTWFya28gPHBldGVyLm1hcmtvQHNpZW1lbnMu
Y29tPg0KPiA+IC0tLQ0KPiA+ICAuLi4vZnJlZXJkcC9mcmVlcmRwL0NWRS0yMDI0LTMyNjYxLnBh
dGNoICAgICAgfCAyNyArKysrKysrKysrKysrKysrKysrDQo+ID4gIC4uLi9yZWNpcGVzLXN1cHBv
cnQvZnJlZXJkcC9mcmVlcmRwXzIuMTEuNy5iYiB8ICAxICsNCj4gPiAgMiBmaWxlcyBjaGFuZ2Vk
LCAyOCBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhLW9lL3JlY2lw
ZXMtc3VwcG9ydC9mcmVlcmRwL2ZyZWVyZHAvQ1ZFLTIwMjQtDQo+IDMyNjYxLnBhdGNoDQo+ID4N
Cj4gPiBkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvZnJlZXJkcC9mcmVlcmRw
L0NWRS0yMDI0LTMyNjYxLnBhdGNoDQo+IGIvbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvZnJlZXJk
cC9mcmVlcmRwL0NWRS0yMDI0LTMyNjYxLnBhdGNoDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQN
Cj4gPiBpbmRleCAwMDAwMDAwMDAwLi4wMDIxMzViNWU0DQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+
ICsrKyBiL21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L2ZyZWVyZHAvZnJlZXJkcC9DVkUtMjAyNC0z
MjY2MS5wYXRjaA0KPiA+IEBAIC0wLDAgKzEsMjcgQEANCj4gPiArRnJvbSA3MWU0NjNlMzFiNGQ2
OWY0MDIyZDM2YmZjODE0NTkyZjU2NjAwNzkzIE1vbiBTZXAgMTcgMDA6MDA6MDANCj4gMjAwMQ0K
PiA+ICtGcm9tOiBha2FsbGFiZXRoIDxha2FsbGFiZXRoQHBvc3Rlby5uZXQ+DQo+ID4gK0RhdGU6
IFN1biwgMjEgQXByIDIwMjQgMTM6NTY6MTMgKzAyMDANCj4gPiArU3ViamVjdDogW1BBVENIXSBb
Y29yZSxpbmZvXSBmaXggbWlzc2luZyBjaGVjayBpbiByZHBfd3JpdGVfbG9nb25faW5mb192MQ0K
PiA+ICsNCj4gPiArQ1ZFOiBDVkUtMjAyNC0zMjY2MQ0KPiA+ICtVcHN0cmVhbS1TdGF0dXM6IEJh
Y2twb3J0DQo+IFtodHRwczovL2dpdGh1Yi5jb20vRnJlZVJEUC9GcmVlUkRQL2NvbW1pdC83MWU0
NjNlMzFiNGQ2OWY0MDIyZDM2YmZjODE0NTkNCj4gMmY1NjYwMDc5M10NCj4gPiArU2lnbmVkLW9m
Zi1ieTogUGV0ZXIgTWFya28gPHBldGVyLm1hcmtvQHNpZW1lbnMuY29tPg0KPiA+ICstLS0NCj4g
PiArIGxpYmZyZWVyZHAvY29yZS9pbmZvLmMgfCA0ICsrKysNCj4gPiArIDEgZmlsZSBjaGFuZ2Vk
LCA0IGluc2VydGlvbnMoKykNCj4gPiArDQo+ID4gK2RpZmYgLS1naXQgYS9saWJmcmVlcmRwL2Nv
cmUvaW5mby5jIGIvbGliZnJlZXJkcC9jb3JlL2luZm8uYw0KPiA+ICtpbmRleCA3ZDZlZWMxMzcu
LjMzOTVlNGQyZSAxMDA2NDQNCj4gPiArLS0tIGEvbGliZnJlZXJkcC9jb3JlL2luZm8uYw0KPiA+
ICsrKysgYi9saWJmcmVlcmRwL2NvcmUvaW5mby5jDQo+ID4gK0BAIC0xMzIyLDYgKzEzMjIsMTAg
QEAgc3RhdGljIEJPT0wgcmRwX3dyaXRlX2xvZ29uX2luZm9fdjEod1N0cmVhbSogcywNCj4gbG9n
b25faW5mbyogaW5mbykNCj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIEZBTFNFOw0KPiA+ICsN
Cj4gPiArICAgICAgIC8qIGRvbWFpbiAqLw0KPiA+ICsrICAgICAgV0lOUFJfQVNTRVJUKGluZm8p
Ow0KPiA+ICsrICAgICAgaWYgKCFpbmZvLT5kb21haW4gfHwgIWluZm8tPnVzZXJuYW1lKQ0KPiA+
ICsrICAgICAgICAgICAgICByZXR1cm4gRkFMU0U7DQo+ID4gKysNCj4gPiArICAgICAgIGlsZW4g
PSBDb252ZXJ0VG9Vbmljb2RlKENQX1VURjgsIDAsIGluZm8tPmRvbWFpbiwgLTEsICZ3U3RyaW5n
LCAwKTsNCj4gPiArDQo+ID4gKyAgICAgICBpZiAoaWxlbiA8IDApDQo+ID4gZGlmZiAtLWdpdCBh
L21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L2ZyZWVyZHAvZnJlZXJkcF8yLjExLjcuYmIgYi9tZXRh
LW9lL3JlY2lwZXMtDQo+IHN1cHBvcnQvZnJlZXJkcC9mcmVlcmRwXzIuMTEuNy5iYg0KPiA+IGlu
ZGV4IGVlNGQ0NTMwZDYuLjg3MGMzZmZlMmYgMTAwNjQ0DQo+ID4gLS0tIGEvbWV0YS1vZS9yZWNp
cGVzLXN1cHBvcnQvZnJlZXJkcC9mcmVlcmRwXzIuMTEuNy5iYg0KPiA+ICsrKyBiL21ldGEtb2Uv
cmVjaXBlcy1zdXBwb3J0L2ZyZWVyZHAvZnJlZXJkcF8yLjExLjcuYmINCj4gPiBAQCAtMjAsNiAr
MjAsNyBAQCBTUkNfVVJJID0NCj4gImdpdDovL2dpdGh1Yi5jb20vRnJlZVJEUC9GcmVlUkRQLmdp
dDticmFuY2g9c3RhYmxlLTIuMDtwcm90b2NvbD1odHRwcw0KPiA+ICAgICAgICAgICAgIGZpbGU6
Ly8wMDAxLUZpeC1jb25zdC1xdWFsaWZpZXItZXJyb3IucGF0Y2ggXA0KPiA+ICAgICAgICAgICAg
IGZpbGU6Ly8wMDAyLURvLW5vdC1pbnN0YWxsLXRvb2xzLWEtQ01ha2UtdGFyZ2V0cy5wYXRjaCBc
DQo+ID4gICAgICAgICAgICAgZmlsZTovLzAwMDEtRml4ZWQtY29tcGlsYXRpb24td2FybmluZ3Mt
aW4tYWlucHV0LWNoYW5uZWwucGF0Y2ggXA0KPiA+ICsgICAgICAgICAgIGZpbGU6Ly9DVkUtMjAy
NC0zMjY2MS5wYXRjaCBcDQo+ID4gICAgICAgICAgICAgIg0KPiA+DQo+ID4gIFMgPSAiJHtXT1JL
RElSfS9naXQiDQo+ID4NCj4gPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiA+IExpbmtzOiBZ
b3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLg0KPiA+IFZpZXcvUmVw
bHkgT25saW5lICgjMTE2MTQyKTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3Bl
bmVtYmVkZGVkLQ0KPiBkZXZlbC9tZXNzYWdlLzExNjE0Mg0KPiA+IE11dGUgVGhpcyBUb3BpYzog
aHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210LzExMTgxNjUzMS8xOTk3OTE0DQo+ID4g
R3JvdXAgT3duZXI6IG9wZW5lbWJlZGRlZC1kZXZlbCtvd25lckBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnDQo+ID4gVW5zdWJzY3JpYmU6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29w
ZW5lbWJlZGRlZC1kZXZlbC91bnN1Yg0KPiBbcmFqLmtoZW1AZ21haWwuY29tXQ0KPiA+IC09LT0t
PS09LT0tPS09LT0tPS09LT0tDQo+ID4NCg==


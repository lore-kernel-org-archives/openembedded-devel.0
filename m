Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9A8CCCFA05
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 11:04:29 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.71])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8851.1762513466889712294
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Nov 2025 03:04:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=wwMq2rvy;
 spf=pass (domain: siemens.com, ip: 52.101.66.71, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CqVn4OGvKalnLiUS1XvGsT9fxEDqTi4dKOZLM29u39IZzLcx1eF4mUwlUEp3k2up8CJRivg3594Xj+qpXpfwG+cWPC9sso0QS2BSWB0T7XliT3Pg9YZBPcODG7ACT1N460HN/G2jnH5fjvfNKBRD3dZRt4JiSpn3UeWw69SjPWiZ3rdbhGFQqo1Ng49qrMOUanuvYOLFjE8n0D7Ha5zA5PSkQAi7WP2Ag9JdW6thWG+rE4eMKlw0pUXAnvBWwL9LLExFdkTf9FHaEruO3hfgjtCd6QRrsXqWvqNHzO1In47H2t+UMBQHv3xa4/9xG8z8NlxeRA+A6KGGr5872Zlytg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R/X8tdOlYgSIXyKNEHOUMfInSm1rLcstmAITTzfRKsA=;
 b=MOXnjfEF00AMZE1iC3l/adHJmtqX3/XqwjgT0RQw7h00wFrR57KbyRfQm7s5aRA9Z494/dkcQK42SPdkd+lOUkPI0+nmpMiY3bTVqIxoIHBMUsbm/R4KkPv3Ta956ssthw6ikSKPd5OWlemXGmvHQ2C/+yBjHVyK4HOVRGCDl/DC4ig5yk+rVkYMoyjnNhMWbUJzPipROCKKFkk1F3mCnFfGC8rqkB72Fl3VtWvRzzakmMi1ERuvbscTQyXlPe91V24rQv7UqVjk/tDAdIoPD01CdM8c35WEHHaKITTF4Kh3GPhwcE+sJfh/gvMxAxIGfF3kS0EynzuY5tBOvHGOig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R/X8tdOlYgSIXyKNEHOUMfInSm1rLcstmAITTzfRKsA=;
 b=wwMq2rvywDjgjNxIRUWfdHNardZv4k8gnBZ6tab8WeB6k4mFeQQawLYfPaFY4gkgdNV8a2HHcm9qA2AdiSwK1lVhU0dznG/vRk7FO0lkqHJzHAStNJ3hAzaia9TDepioY5RAagpcliWVfAT0U7Z0n2j9NhG013Pw4u3F/2DFEaJ/09tasMelwVsjZWcZMiqau+Uq+HfArTQR4lUZfDP68DRHSDL0nO7eCpSp64Y5cEAUQt8Lccokpg1BV9w/CzoAc311Z+MyzWkL2ujpKSXA71jMEb/muLTpS76P6d3E2dqN6RNVkHSEtyhtrNAXbDEXXSWvY6NJLEFAX3x/SkEADQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GV2PR10MB9586.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:2f8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 11:04:23 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.9275.013; Fri, 7 Nov 2025
 11:04:23 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "skandigraun@gmail.com" <skandigraun@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] Call for patches for next Kirkstone release
Thread-Topic: [oe] Call for patches for next Kirkstone release
Thread-Index: AQHcT9NWgH7AO0V7V0GbUa13oXUvOrTnCThw
Date: Fri, 7 Nov 2025 11:04:23 +0000
Message-ID: 
 <AS1PR10MB56971CBAB41937C12EDB33F8FDC3A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <ca2ee105-a3a2-48dc-9ad5-77676a71d8d6@gmail.com>
In-Reply-To: <ca2ee105-a3a2-48dc-9ad5-77676a71d8d6@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=bdda554a-d088-41a6-852f-54f4100a94b4;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-11-07T10:51:13Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GV2PR10MB9586:EE_
x-ms-office365-filtering-correlation-id: ac765f21-46fa-4aad-32c0-08de1ded6886
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?aGo0cnFMdzJCM2xKUEJWc1UvTktkblJLVTdiQUtXRXdhRk5nVEV2VGZSRWZu?=
 =?utf-8?B?a0crMDJSeEdWM0tlTzRoWk1sT0hmZnRJNHpiUWRqVCtJbVduY0NIZGZGZkRV?=
 =?utf-8?B?N1RwdFpXV05uR2JUVVBjajQ1RFR1NlhUdnRwK050dXJtcmpJcmsyeERCV0RW?=
 =?utf-8?B?c1N6MUFpM1JWVFRlMDNCMzRDbTVoM1VzaW4wRkg5bW5xa1h0SnlmVDZZVklo?=
 =?utf-8?B?alBoc2NJWG9SVXRUT3JNa09uWU5MYWt5VTF3ZlRNeWFrbVRhbVE3WEdHKzhP?=
 =?utf-8?B?MzdyR1NvUHRlV2I1WHk3ZVdXaHA5OUM4NWJVS0RXWmFqcnI1UzB6ZVJiZ2ln?=
 =?utf-8?B?c2NTZTgzRUFLaENRZlI0TURQKzBWcUhCbUdabG9TeUZENUh6bzljeXpFSXo2?=
 =?utf-8?B?S3lYNkorc0t2bWpaaW80RHZpYTNJUXFHdHZ0bzlIajRlZUg0ajlkRE8zRCtH?=
 =?utf-8?B?UGhMRjVzaHNEMEE4UWxnRFNDTkhOV05KWFVOcnJBYnN0TktJNU1oeExKQzJY?=
 =?utf-8?B?TE1Xdk9JdnZUVlBJYTFnZ1lySVNPVEhWUG0rcXFwWGNNZ09JdzZvaWpBdnR6?=
 =?utf-8?B?V2d2RE5LTUdMOHpSWlBVRmJRNlJZaWtodkorZG5MTno3R2JmY1U2V3V4YTk0?=
 =?utf-8?B?VHg3WGxjeUllL1JoSERENlBCdk5ENXRzbkUwdXlzSXg5Q2Y2QnlZZTZZN2ZX?=
 =?utf-8?B?VUlteXJYRWhwd05tQTFMVnVyMTlzanUwdzBCdEMzMitUY3piY25aTnZEME53?=
 =?utf-8?B?a3hITXdvNVZ0aUhUSXVCWXpaakt5QW5XVTFZVjdtSy94WXZLcFhlckpSek9a?=
 =?utf-8?B?Y1RpUGQwMzFYNUdmRnRVWlRNam9LYnUwUFZiRk03dnN3YWw2RVEwaHJMaGk0?=
 =?utf-8?B?TDRNMlF4d0JxQnQyZ05Zd0hucTVJTko3TU1vQy91ZS95Z3dtdXdTUWpNbW0v?=
 =?utf-8?B?WXJ2Z3IzK3QrRkk2QXJIOE54Y1FmSDJEVDd5V2hrNHJWM0VWRTg0ZFdCclFr?=
 =?utf-8?B?TFp0aGRpTEU5blZzOHlKZmF4dUtTMHpEdmIzYUdBU0hBZXg2UkhSSVZGd204?=
 =?utf-8?B?cjYzbUIyL1pJY1FVbmVJcmdiS3oxajc4QnEvWk4wVVMzSmt5Ukl1cWxaVVBZ?=
 =?utf-8?B?dkV5WHFQcnQxbnk0Wk5IN25rTGRIMi9VS3hiK29VT0xZMXk2Z3Q0WE1hZWZX?=
 =?utf-8?B?dzA2NTk2NmlCS0NiWTlaT1RQOVlGbm15cm5DR3orb0FaT3hQTlJGTnBNS3ps?=
 =?utf-8?B?U3NsU0RHMUZUbEdEdG1GOFp1Vlc2eGkwdE9TSkZhWGtKV0NhQnRrK2s3d2k0?=
 =?utf-8?B?T3Nna2IydWh2ZmlpR24vTXpXM3ZXSEhnWThGeUJETTQvWnBlTDQ4bDdVSHJN?=
 =?utf-8?B?YXc5aTZ2cTN5aXQwemd1YjduVklsU1M1SWZDNWhQQXpETG00ZElEelR2U0hX?=
 =?utf-8?B?UWdFQzZIQmNENmUvakFGWFhQbDVhek5pdWFMZCswSC8rYi95eFQxWVpyUEpm?=
 =?utf-8?B?bGFRK050VVRGbVNaVXhxeUxxdFlWcEVvMjN3QkQ4c1luZ25LcGwrYzcwQVRw?=
 =?utf-8?B?MzB2OFpQeC9PR2c2b1JFUTNLYTA4aVpBSGExKzY4OTcyOVFrS3ZjR1NSOHBU?=
 =?utf-8?B?RVduWDZUSFBsdEgyQjljalNUamo2ZHc0K0pIOUZEc2JwS2IzbmNENklpeGcw?=
 =?utf-8?B?SVpVUnFwaVhnalVUNzlDWmxQN3VvK1F5SW15MXNlZkxDcUtHV2xuMGNpQXBY?=
 =?utf-8?B?bGwxQ0lEZnA3eVVZMTlDSFl6WDVpdlkwOTVaZGxzN0sxekt1Q1BqZkhiWVNt?=
 =?utf-8?B?SkhFTWFreG9Fc216NFl1R0M4YWU3VEhIZUV5b1JLajJJUVBCWDFxckg4VEI1?=
 =?utf-8?B?akpYa1J6ZDFVd002a01SbFY5clNOQk13UkhtMlFLWWNRYVhMczdqYkNzWnJa?=
 =?utf-8?B?VEhXZUdodS9kczA3YzRFblBWbmdsM1pPNmN0YXQ4UkdURlIwVXNuM0ZGVDhB?=
 =?utf-8?B?aGNDOXdEeWhPU0Y5aFRFYU0yREROMWR2NlFBZHpLVWZlWjdVVEhqNHBJYjRq?=
 =?utf-8?Q?sO08Qp?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MFhDYmE4djc5dEFUR0ZvamRXM2dtKzZxNkRoUzY3L0s2c1RYTHhRcVRTVVVq?=
 =?utf-8?B?bXZKdDQyOHhyRGNlWnQrR2w1QVFla2RpWERPb3ZjRFgrM3VoV3RiNnhtNHRo?=
 =?utf-8?B?WUxzZlBLQ3hnRjJZNTk1VklHTGJ4eC9JSUFhOUtQcWFZL3dmdXRYeXFubXoz?=
 =?utf-8?B?UDFVZFEzNjFPc0pVaTZtWlR3eU9pOGpVSThNWFYyaGw3VmI2cjJlRzRFeVMz?=
 =?utf-8?B?M0Y0VXp1V013aEtXUDJCWS94NzJNUkw2blZ6TnJSbnJvYmlKVmVGdmlnZ1pt?=
 =?utf-8?B?NlNFTkdJeWMxQk41WTVORGpKai9XY3pjamh2Z09CbUdXWFkzWDQxYW9oWmhs?=
 =?utf-8?B?TVErZkM0MzFaMENEbG5YYmpsOUxqbVpJdVNtKzhtcmVZOXVrNGtCazRWckZX?=
 =?utf-8?B?TVAyaW95bjBjSGhTSFpkRnl0MUdjTjFLV2hLM1RLb3R5Y2xJL0EwcUdNWUtU?=
 =?utf-8?B?U0U0UU9lV29OVnpkZnFpZUFTZjJ3UDhyWitVd1R6TDVPVThRSnFLSllsY3Qz?=
 =?utf-8?B?d1YraHhZR2ZJaGErRmtlSUtoWXhZSGJqY2lhSUNRTzA0YjdCM2FzV3ljNkRs?=
 =?utf-8?B?NFlWNHB5SmZSYVRxbGtjRXRjTElwM1Y2OXRWSHcyY3RCTTZYRmJQSGprbDkx?=
 =?utf-8?B?ak9CSHJPT1hIdVdTSnN2S3FrbzFMYWZhYjlTakZQblZsRDNRbHBMZ0QxNUZP?=
 =?utf-8?B?QzRXM0VBdUFLVytnd2dCS0IxL1puWW5jV0d2VmtkSVZBcGt1elE1MUdKc1Nk?=
 =?utf-8?B?NTdJNTc4TG1yMHp6czlDTmNqa0pzVFhCNU0xVkhheEFoK21ZTHJ6ak9lYmxV?=
 =?utf-8?B?Yndpb3BicGdXUzBaS0lrdkRnVHVmY1RwZHBCbVRadk4rZjk2TXlvV1hiNlR3?=
 =?utf-8?B?Rnd4eFMyR0xjak1SSERnTkJXdWQ5WmNwUlNDOUhwK1d3blRuSStUYmJpem4r?=
 =?utf-8?B?RjJhc0JkZ0ZndTJTOTFhVDhKS2VzV2RjZlBxVkJyL093OFdVdDAyR1BWZEZK?=
 =?utf-8?B?amt4cElDV0tDaUNlM29OSCtTY09TeUNNYWZMald4Rmlrallxckl2Wk5XZExi?=
 =?utf-8?B?M2QvbXdlenh5RmhTUXA3UTJKbVprWENJVFVVNUIvalJZUDdiM0RhQVVuMzF2?=
 =?utf-8?B?dEZ4cjhmVW9HNmlobDdINVJuMEp0RUQ3eG0xR2x2OElyT2pGMEcxVHR5TTc4?=
 =?utf-8?B?ZXpPSDNZVzBJcy8wQ3M4YVl6Ym10Y1dzY2N6dEZFL2FHVVZYUThVMG9CTkpy?=
 =?utf-8?B?ZU83S2hFbjV0MjVvYi83ZmF0d0RMSENjT0ZsUlpBdnRReStTNWdwSW1DMTBD?=
 =?utf-8?B?c2txV2xFdDNVaHBockFaK1FMTEJzRXEvVDltMXRjSVFRRDRxdGFvQWE0S2VB?=
 =?utf-8?B?RnF2OGRSclo4VDFETG03SkNXYjhNMWN4M1B5bk5pYW1nWitmSDRPajQ5NnFT?=
 =?utf-8?B?Y1QraTBmdGhHdlAvK1pWeldlTm1veXp6eGZzRlhuREJwajhscUNHQTBybWNO?=
 =?utf-8?B?c3h5VktGOHQ1SCtRVjlKK3Y0bzRwbC96empxajh2NWpKNVFIYS95cExhYlND?=
 =?utf-8?B?dDduVEFHSW1HdTU0eTNUUUtpSXY5Ym9DWDhSaUxuWGlRTnVrdmZJdHNZSEJ2?=
 =?utf-8?B?bGYzZTl5YUsydFd5TFNuZXRka0tyMHdxSkZDR21KNWNCNUVaR3J3VTk4RUZ3?=
 =?utf-8?B?ditieVJ5NXIrWXl5VFlXcGdVaml6cWI1QmVobjN2RHpwQ3R6UnB3WUJETUNO?=
 =?utf-8?B?RzR3TDZiZXZjV1dTVDMyeTlnaXJrb0NNV21uSm1LV1V3NzZXSVJZM2FnYnFT?=
 =?utf-8?B?alBIQ2hsOUxqNjlCYnVmSmRpNkRhTUsrYzQxdDF2WGJqVGRXVmtzM1o4K0Nr?=
 =?utf-8?B?eVZjaWJNdjBBV1ExVm1wTWM1ZkIvcGNTSno0dW54MHVLUnNsMFplaEJEODBN?=
 =?utf-8?B?cDhPaG9tWk9PZGtsK1ZKZklLV3cvcFpNdVZUNWxPVFBuR3dmakowZFkwemFx?=
 =?utf-8?B?OWxncW1WNnJCdFN5cUdUeWg2QXA5Q3lnSkNmcjZqS1Y1RmkyWCtIcWRNQThl?=
 =?utf-8?B?RGZ6MU9iUVhCRkdSMUdXZ2FjdmNUYTVCSzIva0NSMmhIdlgzRU1kSHhQblVw?=
 =?utf-8?Q?gGrkaZi5aSngRoYNhglOML2oH?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ac765f21-46fa-4aad-32c0-08de1ded6886
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2025 11:04:23.0752
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TrL3baeBp5tMIYERRxn5S+FZVrIf8W542idfGw0thkhjbIaHPyBtzukh4YPNSSkQQEHyUyVaO9S8LRXEdQbZ3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB9586
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Nov 2025 11:04:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121369

SGVsbG8gR3lvcmd5LA0KSSByZWFsbHkgbGlrZSB0aGlzIGFubm91bmNlbWVudDsgaXQgbWFrZXMg
cGxhbm5pbmcgc28gbXVjaCBlYXNpZXIuDQoNCkhvd2V2ZXIsIEkgd29uZGVyIGlmIHRoZSBmdXR1
cmUgUFJzIGNhbiBiZSBzeW5jZWQgd2l0aCBvZS1jb3JlIGRvdCByZWxlYXNlIGRhdGVzLg0KRm9y
IGluc3RhbmNlLCB0aGUgcGxhbiBmb3IgNC4wLjMxIHdhcyB0byBjcmVhdGUgcmMxIG9uIE1vbmRh
eSB0aGlzIHdlZWssIHJlYWxpdHkgd2FzIHRoZSBsYXN0IEZyaWRheSwgYW5kIGl0IGluY2x1ZGVk
IDUtd2Vlay1vbGQgbWV0YS1vcGVuZW1iZWRkZWQsIGRvaC4NClNpbmNlIFN0ZXZlIHZlcnkgb2Z0
ZW4gY3JlYXRlcyByYzEgb2UtY29yZSBvbiBGcmlkYXkgYmVmb3JlIHRoZSBhbm5vdW5jZWQgZGF0
ZSwgY291bGQgbWV0YS1vcGVuZW1iZWRkZWQgZG8gaXQgZS5nLiAxIHdlZWsgYWhlYWQgc2F5IE1v
bmRheSBvciBXZWRuZXNkYXk/IChub3Qgc3VyZSBob3cgbG9uZyB0aGUgdGVzdGluZyB0YWtlcykN
Ckkga25vdyB0aGF0IHRoZSByZWxlYXNlcyBhcmUgbm90IGV4YWN0bHkgdGllZCB0b2dldGhlciwg
YnV0IEkgbGlrZSB0aGUgZXh0cmEgb2UtY29yZSBkb3QgcmVsZWFzZSB0ZXN0aW5nIGFuZCBhbHdh
eXMgdGFrZSBtZXRhLW9wZW1lYmVkZGVkIGhhc2ggdXNlZCB0aGVyZSBpbnN0ZWFkIG9mIHRoZSBs
YXRlc3Qgb25lIHdoZW4gSSdtIGJ1bXBpbmcgWW9jdG8gdmVyc2lvbi4NCg0KUGV0ZXINCg0KPiAt
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtZGV2ZWxAbGlz
dHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLQ0KPiBkZXZlbEBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnPiBPbiBCZWhhbGYgT2YgR3lvcmd5IFNhcnZhcmkgdmlhDQo+IGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcNCj4gU2VudDogRnJpZGF5LCBOb3ZlbWJlciA3LCAyMDI1IDExOjQzDQo+IFRv
OiBvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBb
b2VdIENhbGwgZm9yIHBhdGNoZXMgZm9yIG5leHQgS2lya3N0b25lIHJlbGVhc2UNCj4gDQo+IEhl
bGxvLA0KPiANCj4gVGhlIG5leHQgS2lya3N0b25lIFBSIGZvciBtZXRhLW9wZW5lbWJlZGRlZCBp
cyBwbGFubmVkIGFyb3VuZCB0aGUgZW5kIG9mDQo+IG5leHQgd2Vlay1pc2guIEFueXRoaW5nIHRo
YXQgYXJyaXZlcyB1bnRpbCB0aGUgZW5kIG9mIG5leHQgVHVlc2RheQ0KPiAoMTEvTm92LCBhbnkg
dGltZXpvbmUpIHdpbGwgYmUgY29uc2lkZXJlZCBmb3IgdGhpcyBQUi4gQW55dGhpbmcgdGhhdA0K
PiBhcnJpdmVzIGFmdGVyd2FyZHMgd2lsbCBiZSBwYXJ0IG9mIHRoZSBuZXh0IG1lcmdlIGN5Y2xl
Lg0KPiANCj4gVG8gYW55b25lJ3MgaW50ZXJlc3RlZCB3aGF0J3MgcXVldWVkIHVwIHNvIGZhciwg
dGhpcyBpcyB0aGUgc3RhZ2luZyByZXBvDQo+IEkgdXNlOg0KPiBodHRwczovL2dpdC5vcGVuZW1i
ZWRkZWQub3JnL21ldGEtb3BlbmVtYmVkZGVkLQ0KPiBjb250cmliL2xvZy8/aD1zdGFibGUva2ly
a3N0b25lLW51dA0KPiANCj4gVGhhbmsgeW91LA0KPiBHeW9yZ3kNCg==


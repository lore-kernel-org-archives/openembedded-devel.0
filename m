Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C654EC110C
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 16:51:07 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.1])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39762.1771865459500662220
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Feb 2026 08:50:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=g0fw/k94;
 spf=pass (domain: siemens.com, ip: 52.101.84.1, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XiRwqx87KJZL3QGhcOmm7HKaWSuQ8YJ9Q/smhXVS01cllQwerNoEGZ9XxY3M5/5+y0+rw0GVo+WG3OmWrzP5+Cmwfr0oEuMCV3G5WW/mUCYkI1dNSrtbQWcMvTGlY8sVr7QTj/IU9qffKV7HasqdbjvgBC2omUe46egFDrR7dBJ8XgNsCBaHfXdKyfriQt68+WwQNyRFAateo397q41y32Olw6LCyY7EXOVg2cMmiyHrb4hdqFOOOKfL77I30/qzHml+suOD2xZe81wVgz6HQiTdpd5dNBW6UnqVY+/Eq8bBm92SNJoDMOmvXWnae0fM+TLgL2yM8oG8oZMaqPorIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cta3M/suftthF0saw1UkNqG+kQD+CJdX/8FcV7r9STE=;
 b=k5bZwxKUxy6sqVWHbFSXK3dRjQEXQ2vHlNg4fCjnZJMGDpyG4t4wJSs5l2QreDu8KaV/yWARcq6HshMbmUFCDcOMlKZD9G2hmbtmo7K8cnD1lSD1e43UoQr3Faljft7BCUoQ2fIUDNPxacHDQ+IMaWF4tysDFvIpQ7kJvLShkRXWUWJTBXTfA3VqAFgqSoSGgrIqmvx7khHtQ9VtTLGmWKJR3yOqkyi/J0ZLujSlU7DdPw9WqSPEKSfs5UwfYbDTqS3/ftzUsEPTbWYv7rHMKfNOQ5K3TR5YkLP3TtE3czQoU+DMpnRZ2Mm3exIziRbkN6cOMTn/+dizSP3GfF1mLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cta3M/suftthF0saw1UkNqG+kQD+CJdX/8FcV7r9STE=;
 b=g0fw/k94bEQK0IXelyVTCUBfdwzEXB6TL7EFSLWItxA5PxVRXaiXDnyrD33vCcBV9aJuCZqhiMirAVO/GZVSyS2UxZNljvF6y5Lolp63VOOFrD2fXOof4EeitfziRL5xKEqkb2pM1fblkRrydCsRyhHx4WwiwmiLhtj0Lshqo73iAIdMc6l4yUh+3wPF0qPLXprlM2VOVkqNnZmoyeZY7NqSUAOppeyarzyyifBopJPF2KKRHxMsXvtkZdsa+a+2gVH0YcVkXD9XBDA1yPkGrwcRSl5ZFYMCfg2PWSnNg1iwpGs1nYbykY4J6Sd5m/n6Ys2bppmdpC+ffpDNSVv9hA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DB9PR10MB6315.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:39f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Mon, 23 Feb
 2026 16:50:56 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 16:50:55 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Gyorgy Sarvari <skandigraun@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-webserver][kirkstone][PATCH v2] nginx: patch
 CVE-2026-1642
Thread-Topic: [oe] [meta-webserver][kirkstone][PATCH v2] nginx: patch
 CVE-2026-1642
Thread-Index: AQHcpE3253yD6JXCNkqoOpp+8qEDtbWP7nmAgACR15A=
Date: Mon, 23 Feb 2026 16:50:55 +0000
Message-ID: 
 <AS1PR10MB5697D606D4AE7CD3B8A158B0FD77A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260222225239.3882166-1-peter.marko@siemens.com>
 <ae72e906-e37b-4c5c-a967-e8bf59768773@gmail.com>
In-Reply-To: <ae72e906-e37b-4c5c-a967-e8bf59768773@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=1815caa1-a3ce-47f4-ab02-86162c40cef1;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-02-23T16:50:05Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DB9PR10MB6315:EE_
x-ms-office365-filtering-correlation-id: dcad205b-6de6-49b8-3cfb-08de72fbb673
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|4022899009|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?S2JUakxXQWZuNHRqenBvbVBLZURJYmRzM0VNY0xZUk1CSnZ1WGYwOGdaN1Q3?=
 =?utf-8?B?dmw4RDFvRWtJZWt1Q3lIeW5sU000dFBvckpjQWtpV0wyaEhvTXZPdEgrTXpM?=
 =?utf-8?B?MVFiRGs5TGNQYnFRZUw1aDNxY2MwUkZscllQbVh4cWFIeVBDeXd3bVE3S2tP?=
 =?utf-8?B?NUdUNmlIQ0E3cmpjUmI4ZDJaWEtxT1FZSWZNdWxMZStpVzYvSi9NZURzSm5L?=
 =?utf-8?B?V0lRaldLNjI3Y3hOcnY5amZFUWZRTHdxZ3ZxYWxQSXZZV252UEZnMG01Q3R1?=
 =?utf-8?B?RWlnQVE2Y3krYWdRdGZSRHMwYXVlckdENEJ3N01ob1ZGcGNTampQV1lRNVRY?=
 =?utf-8?B?TFVlVWphaVVmU0xRdEtzWmoyckQwVmE3ZTJoSFJkZmRqdVg0SmYrODFNNSto?=
 =?utf-8?B?SkcrYVd1ZGZQTk53TEtFZThORVBTMXB4Q3d6QUIrckZrSGNpUXBzZ0t2RWVS?=
 =?utf-8?B?d1FRUnpUVG5RbmZ5STB1Z2VUQWV5bGFyZGQ3SGM4b1RrM3o4N3RFOHV4cUNC?=
 =?utf-8?B?cjBHaElnbzUvalJTeFk2UDNySWRqdXcydWo0dW1pWTY2aDJXdE5ZRXlOVlNa?=
 =?utf-8?B?RHZ6elNSOGIzY1J5eTlnM3BtTDlINVZTb2VqRzNqS3did1J1ZTZxbnEvYTF5?=
 =?utf-8?B?UGIzTU0zaEl5ZGZqYUNTY3RNay92RnlFY0trSEtlUVNqNzNFSGVmM0hCam8w?=
 =?utf-8?B?QTkvRkxnbE1TNjhjWXdveXJxUUlNdW92ekE2T0J6Z3QvYWNRN1lQZHk2L3Bw?=
 =?utf-8?B?bEt6WUtkN2lGdWpFOStnRm5MWmtEQklJTXFJWlpQQUhvZDJ5dGVqbWRmTllx?=
 =?utf-8?B?Y0lHdVo0aXQ3UW45c24xUG1NbURrRTdPN3Z0aVVjb1dwdEtEcTF5Q2cvSzMx?=
 =?utf-8?B?bjZVS3lySUpxdnhVS2d0ZTRIWlk0RjlEZEErK0x6c3BXby9qNXdmc2I3c1Bs?=
 =?utf-8?B?MFR1YzVOdWk3SE5YYllEUjBVRUFRNkVPeWhvZjhkblAraC9lVGdrdElBYXcx?=
 =?utf-8?B?QXNNRWZoUCt4MVYzUDdyVENYOTdaQUNudlBPb2hEZXIycUdZb0RsaVZzUGh4?=
 =?utf-8?B?d1NYNEVGcG9pVTgxMXlzS0FtRGVsR0RYWEJCVXhOK3UyRDBMRlpxa0Y4YmJQ?=
 =?utf-8?B?SzZ6MmovMHRZSFo3K1NIY29jL1ljNExHSDFyTXd6MVU4MllUOUs5aUdOTlo5?=
 =?utf-8?B?dzRSQTRUYWJMR2NWMVkrK3BwK2Z5M2JQZSsveS9TVlZjV2lhd1JTS2k1QU1a?=
 =?utf-8?B?bHJ3TE5pU0VoT1pNMWNkNFZNbHdXUVR1ZnhhWVZuN0N0azlZZDZGK1VGZFN4?=
 =?utf-8?B?WWc1TGVrSDAvSTVDMzVqbEJIM0xxcTR5WXBnSWxXQWVwdmZSdUhOUmhMUmNx?=
 =?utf-8?B?UlR6N0UyNEx6SUh1bnR4c1dHS2duaGgzMjBjUDZLSUY1VEdraCtUb1FaWW9O?=
 =?utf-8?B?Q0ErdldCb25JbDUxdWpBWmxBU3VJNThETFVaOERuTVJnV29tM2lQMnc1d2lC?=
 =?utf-8?B?Y0hqR1FKL2JtRGd5N2xrOE13eThaQ2t1aURDbS96dExaUDVVVExWOWhzejVp?=
 =?utf-8?B?WWNsYlJsT3lFazhEbUVoZ1kyUFJvSi9zaFdlejVFTXU0THFlT0ZBTHVTalBp?=
 =?utf-8?B?UG9SVkJQbTBJeFVQQkxYV3ZETjcxMFhVMVhxUDRYWDV1NFhwVHZnV0VTalUz?=
 =?utf-8?B?MTJEY056V1E5WmNKcHF2OTRXR2VPSkc2NlVsQzN0N1JBK2MvUVpGdS9YVGFZ?=
 =?utf-8?B?TzFHRE1NeG8zS1ZrNENaZGNabWttbjU0Yk1KQnpYSXFMTVppNnRmZHNBanRL?=
 =?utf-8?B?ZTFlNGlkQWo1dUlqRGxQSGJFNU9lSmgyY2lWbHFLUGFhMDBBemNUYnFIclRS?=
 =?utf-8?B?QlVCVGxqUkRCN3RWY0hXUThoL3kxOGVTbmt0ZW9LYUs2c3ozZEpKYjlvOHJl?=
 =?utf-8?B?QjB2RDhEQmhmanNiWHJ2Z3Y3a0JvU1RwMGxqS2xsekY2eVlhbGlHVXRtM1Ri?=
 =?utf-8?B?L1hSVWZHeEJkV2FWTGd6eXNQMmtST2RrQ05ML3Q0cGp1SDhGbmp6RUZyUzZm?=
 =?utf-8?B?RExNeVhDNjl0ZGJmT2tsRjRIY3gwa3hVS1ZuZHNZYTFjcHJRZWRSV0N0Ly9G?=
 =?utf-8?Q?uLO292Vcsx/fgT86k3/4jD+GX?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(4022899009)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RVh6RDYwSTk4RWFqaWx3c0JudFQwQnBRM2NxSjRQNHBNQUZrS3RYb0tybndK?=
 =?utf-8?B?ZkRsSmJPeHRJTnR2UUxSNEREN2dmSVRydlVvUjVwbHV6TEdFNzcyOTZua0Y5?=
 =?utf-8?B?Vy95cStzTEhWYzhxcVIwS2lPM0dSUHFzWWx4UW4rS1ppSjM4ZmhuTUE2OUpR?=
 =?utf-8?B?aDhZR29hbGJwN29DV3BWUllvVFRvYUJmdjJ5dUhId0ROVllFYk9NUjgzdEIy?=
 =?utf-8?B?N2VaNHpBcmxra3FxbWsvcnpGL1Z2UW5vWTNOSWplaXRtamRjYTJudGtzK29O?=
 =?utf-8?B?a3kxQUZ1Q1hTRDNIV3lOSC9HeGVZM0pDUDlaQnljQVFvNUtPK0VUejhYN0lR?=
 =?utf-8?B?MDZ1Ty9vWG54b2pTNmNzSXdIT0JNQ2FxRHN3TjQ0V0ppajNhZStkeERZRmJu?=
 =?utf-8?B?YnFDeG1KbWgzNDR3cG80YzBGSWxUYkM5TmhodEdONHBTQk9wenIweGJ4Q01R?=
 =?utf-8?B?cDZGV3J2SXNYeVNnb2ppOG9wVUllUmRmcFlqTVFsMllWZEhmR0NYMWZ0bGZI?=
 =?utf-8?B?cEJFa1ZqZytsWGxNQjlzQ1FmYzgyMjNqUmh3NWZERXUzcEhTVXlIM2Z4aW1W?=
 =?utf-8?B?SlpVUklWa3dvNTRpTVI1ODFrdENJa3p2cGdGUEtxT0VPQTVEcHJkV2FvMlVI?=
 =?utf-8?B?NWllaDR6cXZZVkl4SUphR0t6eTRSckZnT3NoR0FkU0N2bXZiSm9MMkFXYUZ1?=
 =?utf-8?B?WTBEWDdsNjZwc2E4dFU2UkpoUlBCcHFaVHZTVU84Y1lzRFRmVG11T2ZGYmpP?=
 =?utf-8?B?dFpMc09YSTJHT2kvSk5lV1ZQS0lHeGVvaHFGVlQ1OFUwV3pUWCt2WGtwSEpN?=
 =?utf-8?B?RGxKVUs2N2NiWGRoOFNVczZOUHF0NU1rYjdSbUc5dGRGd2hzR2pRWi80TnpI?=
 =?utf-8?B?K1YwOWVHMXE0Y1oxUm5ZOWZBNnpiS0ErMDFpSVFGVFFRUjJyK0Jxc2FrSmdz?=
 =?utf-8?B?NUR4WXZFbEgwYlBKMC9sVE12ZnpBMFNvSktpZ0lLOHFiaDFFMzJzMC9qNVJQ?=
 =?utf-8?B?VWk5MlUvb3FlYnROR3Y5WStkSVNzRHVnWDFGSnRYdXZLdVlreEtqbVl2OHRz?=
 =?utf-8?B?Q05SY3daQjZRdXE0ZEowU0JSZk93dm5CYkYxbG9qeWxraFkvSFM4UUFSTEVm?=
 =?utf-8?B?a0pDU2IxMXhKWTVpcUZ4S0ZHVzBOeWZCS2JRZGdLc2dBcnRyRHMxSmRRMGRa?=
 =?utf-8?B?alc5ZFNYc2hxSHlaVTdUM3V5Y3YrLzkzZG1relhWMHp4U1ZXNk11RVkvbnRR?=
 =?utf-8?B?OFBja2k4TXllVThwRUkxVUZLdkdWZ3JWL0VJem1UUENSQVhhRTV1Y3htdTVk?=
 =?utf-8?B?d1V0dGluN3A5Y3gxSk1uODVud1JXYi96eFdqeXlEL0RTaTBLQ0Q5NTJmZTAz?=
 =?utf-8?B?LzBCMk9BM1JhcElaV3NDSDdZdEtINU0rTm1kM0QvaEZ5VUlWbEwrcnl4UVRi?=
 =?utf-8?B?c2RENTY1WCtBWFZQVHdjZjg0VlZuYTUyYTlhVTNDZWZrcUxMWmpxcFh2WnJ1?=
 =?utf-8?B?MTZvR2FQUnN6YzNTQkg3Ylp3a0VwMDhLaHBUcmV1SER4K3dOMWRJU29vaXAz?=
 =?utf-8?B?ck5ZVEptRHpoeFhjem51Tm1KZEhRcnpMWjhoa2J0V1hpQ1hscHZ3TFlBMHBm?=
 =?utf-8?B?cHcxbzRJdWlRbDJoRFFjL01EblplbHVYMDJDS3I5dG5OTU55bHJyNWppRFVZ?=
 =?utf-8?B?WkxsOTI1M1hEUlJseVJzeXpXOE5QOFBjMFIxUTgybmtBaGhqa1M3NE9MekRO?=
 =?utf-8?B?Vi9Wdkg0NXo5YVFSYmdGUWJBZTlDbFdPMzhHRktVNzNhRDFIcXhCTHdmZGZ1?=
 =?utf-8?B?V2k5UGVscWl4cWtkais3STN2RXArSytiQS9MaW5ic0VaRWw1ZWZQR2VaNU5G?=
 =?utf-8?B?dklUbVZhNTY4eUNOMjJudXZxeDVQenJ6NDRrYSsvOG40aTY5Myt6bUxuOTJp?=
 =?utf-8?B?aXBLMHEzdDlVT1QxbmJvYTlZMENUSzRGYitoQ05nMEFBdnY5cmhmSEtod2R0?=
 =?utf-8?B?WURUOVdlbEtDZG12ay9DRC9QUW56ME9vZE1YNXVPOVo2U2E0TzN2WXAweDlO?=
 =?utf-8?B?cDhkY1BlcTAwTXlkbkNjeFVqRDYwMituZFVQTitvZzJ0RkxkMVRGQW4yNzd5?=
 =?utf-8?B?WVdFcUNuS3VBVUtyVU1RM1BEVlpINHcyZDRaQjJwT082ZlVXNWNyNXNsWlVN?=
 =?utf-8?B?VUV2MmNMZVFDTFhyNCtqejRBazRRSGRiVytpWlNXbno4K2tmbEQ5UFpOTVB0?=
 =?utf-8?B?SU9PY0dqSzZuenRCa294YnB6VGNjZUM0MFhTWjBoME9LQ3pWUjVOMGFCaXRC?=
 =?utf-8?B?cStOWGgwR2p0MHl1Ni92UTJpcmFtY2pHNFBRTDZQdDlvZVBtTWh6UT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: dcad205b-6de6-49b8-3cfb-08de72fbb673
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2026 16:50:55.5889
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N75jq84sPUOvaUOV12xxQyRSSY+2uuhqMu8AmMjPkeR6+naD1AED4Mc7wT7T/K0fM7B8LWfCj/d8ipEoUZbuKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB6315
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Feb 2026 16:51:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124553

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR3lvcmd5IFNhcnZhcmkg
PHNrYW5kaWdyYXVuQGdtYWlsLmNvbT4NCj4gU2VudDogTW9uZGF5LCBGZWJydWFyeSAyMywgMjAy
NiA5OjA4DQo+IFRvOiBNYXJrbywgUGV0ZXIgKEZUIEQgRVUgU0sgQkZTMSkgPFBldGVyLk1hcmtv
QHNpZW1lbnMuY29tPjsNCj4gb3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcNCj4gU3ViamVjdDogUmU6IFtvZV0gW21ldGEtd2Vic2VydmVyXVtraXJrc3RvbmVdW1BBVENI
IHYyXSBuZ2lueDogcGF0Y2ggQ1ZFLTIwMjYtDQo+IDE2NDINCj4gDQo+IEkgd29uZGVyLCBkb2Vz
IHRoaXMgcGF0Y2ggYXBwbHkgb25seSB0byAxLjI0LCBvciBkb2VzIGl0IGFwcGx5IHRvIHRoZQ0K
PiBvdGhlciB0d28gcmVjaXBlcyBhbHNvIChhbmQgaXQgY291bGQgYmUganVzdCBzaG92ZWQgaW50
byB0aGUgLmluYyBmaWxlKT8NCg0KSSBoYXZlIHNlbnQgYWRkaXRpb25hbCBwYXRjaCB0byBtb3Zl
IGJvdGggQ1ZFIHBhdGNoZXMgdG8gdGhlIGluYyBmaWxlLg0KUGV0ZXINCg0KPiANCj4gT24gMi8y
Mi8yNiAyMzo1MiwgUGV0ZXIgTWFya28gdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgd3JvdGU6
DQo+ID4gRnJvbTogUGV0ZXIgTWFya28gPHBldGVyLm1hcmtvQHNpZW1lbnMuY29tPg0KPiA+DQo+
ID4gUGljayBwYXRjaCBhY2NvcnRpbmcgdG8gWzFdLg0KPiA+DQo+ID4gWzFdIGh0dHBzOi8vc2Vj
dXJpdHktdHJhY2tlci5kZWJpYW4ub3JnL3RyYWNrZXIvQ1ZFLTIwMjYtMTY0Mg0KPiA+DQo+ID4g
U2lnbmVkLW9mZi1ieTogUGV0ZXIgTWFya28gPHBldGVyLm1hcmtvQHNpZW1lbnMuY29tPg0KPiA+
IC0tLQ0KPiA+IHYyOiBhZGRlZCBwYXRjaCBhbm5vdGF0aW9ucw0KPiA+DQo+ID4gIC4uLi9uZ2lu
eC9maWxlcy9DVkUtMjAyNi0xNjQyLnBhdGNoICAgICAgICAgICB8IDQ2ICsrKysrKysrKysrKysr
KysrKysNCj4gPiAgLi4uL3JlY2lwZXMtaHR0cGQvbmdpbngvbmdpbnhfMS4yNC4wLmJiICAgICAg
IHwgIDEgKw0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDQ3IGluc2VydGlvbnMoKykNCj4gPiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IG1ldGEtd2Vic2VydmVyL3JlY2lwZXMtaHR0cGQvbmdpbngvZmlsZXMv
Q1ZFLTIwMjYtDQo+IDE2NDIucGF0Y2gNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9tZXRhLXdlYnNl
cnZlci9yZWNpcGVzLWh0dHBkL25naW54L2ZpbGVzL0NWRS0yMDI2LTE2NDIucGF0Y2gNCj4gYi9t
ZXRhLXdlYnNlcnZlci9yZWNpcGVzLWh0dHBkL25naW54L2ZpbGVzL0NWRS0yMDI2LTE2NDIucGF0
Y2gNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAuLmQ2YzYz
NmU1NGQNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvbWV0YS13ZWJzZXJ2ZXIvcmVjaXBl
cy1odHRwZC9uZ2lueC9maWxlcy9DVkUtMjAyNi0xNjQyLnBhdGNoDQo+ID4gQEAgLTAsMCArMSw0
NiBAQA0KPiA+ICtGcm9tIDc4NGZhMDUwMjVjYjhjZDBjNzcwZjk5YmM3OWQyNzk0YjlmODViNmUg
TW9uIFNlcCAxNyAwMDowMDowMA0KPiAyMDAxDQo+ID4gK0Zyb206IFJvbWFuIEFydXR5dW55YW4g
PGFydXRAbmdpbnguY29tPg0KPiA+ICtEYXRlOiBUaHUsIDI5IEphbiAyMDI2IDEzOjI3OjMyICsw
NDAwDQo+ID4gK1N1YmplY3Q6IFtQQVRDSF0gVXBzdHJlYW06IGRldGVjdCBwcmVtYXR1cmUgcGxh
aW4gdGV4dCByZXNwb25zZSBmcm9tIFNTTA0KPiA+ICsgYmFja2VuZC4NCj4gPiArDQo+ID4gK1do
ZW4gY29ubmVjdGluZyB0byBhIGJhY2tlbmQsIHRoZSBjb25uZWN0aW9uIHdyaXRlIGV2ZW50IGlz
IHRyaWdnZXJlZA0KPiA+ICtmaXJzdCBpbiBtb3N0IGNhc2VzLiAgSG93ZXZlciBpZiBhIHJlc3Bv
bnNlIGFycml2ZXMgcXVpY2tseSBlbm91Z2gsIGJvdGgNCj4gPiArcmVhZCBhbmQgd3JpdGUgZXZl
bnRzIGNhbiBiZSB0cmlnZ2VyZWQgdG9nZXRoZXIgd2l0aGluIHRoZSBzYW1lIGV2ZW50IGxvb3AN
Cj4gPiAraXRlcmF0aW9uLiAgSW4gdGhpcyBjYXNlIHRoZSByZWFkIGV2ZW50IGhhbmRsZXIgaXMg
Y2FsbGVkIGZpcnN0IGFuZCB0aGUNCj4gPiArd3JpdGUgZXZlbnQgaGFuZGxlciBpcyBjYWxsZWQg
YWZ0ZXIgaXQuDQo+ID4gKw0KPiA+ICtTU0wgaW5pdGlhbGl6YXRpb24gZm9yIGJhY2tlbmQgY29u
bmVjdGlvbnMgaGFwcGVucyBvbmx5IGluIHRoZSB3cml0ZSBldmVudA0KPiA+ICtoYW5kbGVyIHNp
bmNlIFNTTCBoYW5kc2hha2Ugc3RhcnRzIHdpdGggc2VuZGluZyBDbGllbnQgSGVsbG8uICBQcmV2
aW91c2x5LA0KPiA+ICtpZiBhIGJhY2tlbmQgc2VudCBhIHF1aWNrIHBsYWluIHRleHQgcmVzcG9u
c2UsIGl0IGNvdWxkIGJlIHBhcnNlZCBieSB0aGUNCj4gPiArcmVhZCBldmVudCBoYW5kbGVyIHBy
aW9yIHRvIHN0YXJ0aW5nIFNTTCBoYW5kc2hha2Ugb24gdGhlIGNvbm5lY3Rpb24uDQo+ID4gK1Ro
ZSBjaGFuZ2UgYWRkcyBwcm90ZWN0aW9uIGFnYWluc3QgcGFyc2luZyBzdWNoIHJlc3BvbnNlcyBv
biBTU0wtZW5hYmxlZA0KPiA+ICtjb25uZWN0aW9ucy4NCj4gPiArDQo+ID4gK0NWRTogQ1ZFLTIw
MjYtMTY0Mg0KPiA+ICtVcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0DQo+IFtodHRwczovL2dpdGh1
Yi5jb20vbmdpbngvbmdpbngvY29tbWl0Lzc4NGZhMDUwMjVjYjhjZDBjNzcwZjk5YmM3OWQyNzk0
YjlmOA0KPiA1YjZlXQ0KPiA+ICtTaWduZWQtb2ZmLWJ5OiBQZXRlciBNYXJrbyA8cGV0ZXIubWFy
a29Ac2llbWVucy5jb20+DQo+ID4gKy0tLQ0KPiA+ICsgc3JjL2h0dHAvbmd4X2h0dHBfdXBzdHJl
YW0uYyB8IDkgKysrKysrKysrDQo+ID4gKyAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCsp
DQo+ID4gKw0KPiA+ICtkaWZmIC0tZ2l0IGEvc3JjL2h0dHAvbmd4X2h0dHBfdXBzdHJlYW0uYyBi
L3NyYy9odHRwL25neF9odHRwX3Vwc3RyZWFtLmMNCj4gPiAraW5kZXggZGY1NzdhZDY3Li5jYWRj
NzQ0NzkgMTAwNjQ0DQo+ID4gKy0tLSBhL3NyYy9odHRwL25neF9odHRwX3Vwc3RyZWFtLmMNCj4g
PiArKysrIGIvc3JjL2h0dHAvbmd4X2h0dHBfdXBzdHJlYW0uYw0KPiA+ICtAQCAtMjQ0MSw2ICsy
NDQxLDE1IEBADQo+IG5neF9odHRwX3Vwc3RyZWFtX3Byb2Nlc3NfaGVhZGVyKG5neF9odHRwX3Jl
cXVlc3RfdCAqciwgbmd4X2h0dHBfdXBzdHJlYW1fdA0KPiAqdSkNCj4gPiArICAgICAgICAgICAg
IHJldHVybjsNCj4gPiArICAgICAgICAgfQ0KPiA+ICsNCj4gPiArKyNpZiAoTkdYX0hUVFBfU1NM
KQ0KPiA+ICsrICAgICAgICBpZiAodS0+c3NsICYmIGMtPnNzbCA9PSBOVUxMKSB7DQo+ID4gKysg
ICAgICAgICAgICBuZ3hfbG9nX2Vycm9yKE5HWF9MT0dfRVJSLCBjLT5sb2csIDAsDQo+ID4gKysg
ICAgICAgICAgICAgICAgICAgICAgICAgICJ1cHN0cmVhbSBwcmVtYXR1cmVseSBzZW50IHJlc3Bv
bnNlIik7DQo+ID4gKysgICAgICAgICAgICBuZ3hfaHR0cF91cHN0cmVhbV9uZXh0KHIsIHUsDQo+
IE5HWF9IVFRQX1VQU1RSRUFNX0ZUX0VSUk9SKTsNCj4gPiArKyAgICAgICAgICAgIHJldHVybjsN
Cj4gPiArKyAgICAgICAgfQ0KPiA+ICsrI2VuZGlmDQo+ID4gKysNCj4gPiArICAgICAgICAgdS0+
c3RhdGUtPmJ5dGVzX3JlY2VpdmVkICs9IG47DQo+ID4gKw0KPiA+ICsgICAgICAgICB1LT5idWZm
ZXIubGFzdCArPSBuOw0KPiA+IGRpZmYgLS1naXQgYS9tZXRhLXdlYnNlcnZlci9yZWNpcGVzLWh0
dHBkL25naW54L25naW54XzEuMjQuMC5iYiBiL21ldGEtDQo+IHdlYnNlcnZlci9yZWNpcGVzLWh0
dHBkL25naW54L25naW54XzEuMjQuMC5iYg0KPiA+IGluZGV4IGUyODhiMTlkYTMuLjkzYTI3ZWJk
NTYgMTAwNjQ0DQo+ID4gLS0tIGEvbWV0YS13ZWJzZXJ2ZXIvcmVjaXBlcy1odHRwZC9uZ2lueC9u
Z2lueF8xLjI0LjAuYmINCj4gPiArKysgYi9tZXRhLXdlYnNlcnZlci9yZWNpcGVzLWh0dHBkL25n
aW54L25naW54XzEuMjQuMC5iYg0KPiA+IEBAIC0zLDYgKzMsNyBAQCByZXF1aXJlIG5naW54Lmlu
Yw0KPiA+ICBMSUNfRklMRVNfQ0hLU1VNID0NCj4gImZpbGU6Ly9MSUNFTlNFO21kNT0xNzVhYmI2
MzFjNzk5ZjU0NTczZGM0ODE0NTRjODYzMiINCj4gPg0KPiA+ICBTUkNfVVJJOmFwcGVuZCA9ICIg
ZmlsZTovL0NWRS0yMDI1LTIzNDE5LnBhdGNoIg0KPiA+ICtTUkNfVVJJOmFwcGVuZCA9ICIgZmls
ZTovL0NWRS0yMDI2LTE2NDIucGF0Y2giDQo+ID4NCj4gPiAgU1JDX1VSSVtzaGEyNTZzdW1dID0N
Cj4gIjc3YTI1NDE2MzdiOTJhNjIxZTNlZTc2Nzc2YzhiN2I0MGNmNmQ3MDdlNjliYTUzYTk0MDI4
M2UzMGZmMmY1NWQiDQo+ID4NCj4gPg0KPiA+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+ID4g
TGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+ID4g
Vmlldy9SZXBseSBPbmxpbmUgKCMxMjQ1MzcpOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5v
cmcvZy9vcGVuZW1iZWRkZWQtDQo+IGRldmVsL21lc3NhZ2UvMTI0NTM3DQo+ID4gTXV0ZSBUaGlz
IFRvcGljOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQvMTE3OTQ4NDgxLzYwODQ0
NDUNCj4gPiBHcm91cCBPd25lcjogb3BlbmVtYmVkZGVkLWRldmVsK293bmVyQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcNCj4gPiBVbnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQu
b3JnL2cvb3BlbmVtYmVkZGVkLWRldmVsL3Vuc3ViDQo+IFtza2FuZGlncmF1bkBnbWFpbC5jb21d
DQo+ID4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gPg0KDQo=


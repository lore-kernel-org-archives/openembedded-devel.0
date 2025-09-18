Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8693CAC597
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 06:30:59 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.0])
 by mx.groups.io with SMTP id smtpd.web11.7610.1758177058642474599
 for <Openembedded-devel@lists.openembedded.org>;
 Wed, 17 Sep 2025 23:30:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=J7b2eVxu;
 spf=pass (domain: siemens.com, ip: 40.107.130.0, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wRFe4yYWAOMb3UVAS/tADZn2hQ/EISv2rv+LgufoDEWkYpU8cg2a60VgoizB63O3XJxK1/aZ8563B3uQyYJ+hB8YJO/OexaQp2aEeogSRrio24lBkluaoVxzAtHklttc4KpGxXXyx2A8L0b1NH+xmsdFwFyP+oU50KcMc7tgeLxS/6UaiRrpuJDah4jjmghFmxC+iTF4b6ttjLqC+WXbHbBx0khcUWarZH9+w4NoPhGvEet619ng/hJIAGpNfH4cQW+VyC+btRXnWGFr9wLp2JCFHYcthKmWwLHzvNQhKZv2jyXy6ZKHYuU3d9IBSZszFR3Zy+TWQKI9xFbIvBqA7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9lsTzAL37ji0DXuxjUr/5flLgubaQj9yH78p16kZhJ8=;
 b=MVpa3bKstxoXLgLPjR/eOL7XwVCBTji1vAXaXMyEpC84DaXVLDNYjsxAHAAJ15DjWDvYeOm8BfJlQ8PuLCjs90gko+00Ev0851orQlg0FdrITBJfmrNNpO206P0MuMKZA6ECtLskS6qBrlX350UoP4K9rGl0xXHHTdWV0bnqSpGtBnNKRDkeNDL1Eq0tPaoAR9jQiHudbtko9u3SoftyHi+ok8JXHAnC0PVNMnI8QpR7sOYpz1XK7haEcTQOj5OzCuUPtjW9aAUW3I1chIzEieijTUqwh8ICbWzRekZJKsAqCVVXPSLPH9ZALFgFVuKDA6YfxYnKNmz0eq6YieR2CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9lsTzAL37ji0DXuxjUr/5flLgubaQj9yH78p16kZhJ8=;
 b=J7b2eVxuhFOKhbgF0k9aWmjke3W1Z3CrTPal6i53xusUQoEGlsd2SMumZWFFMdY1aNENYx6ByPE/AdLkYHLwxcHq30JGiNQPybweHz1LvOO9XwNH4rQNJ0NyZTgXGfTA0CokSb+vc2UHovS/J2yCUkwYlTFG2ixaKQy6vLFbZDuO3sg6M0tSAOzOPfHwjvTSX6vmCouCUCiiyIylQ4ZERREmyICKms0Uj0Mnz+K/z5yz0Y+WG9+Oa+LPlfzEgxBPi7EUeO4DwmOwcdNXVrK4jhiuQocn0i5G5TJ3+3iqndORU8/MKjfeD8g1xm0A4X6I7oNf1QKEb01fccg8wafodw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DU4PR10MB8541.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:56a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Thu, 18 Sep
 2025 06:30:55 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.9115.018; Thu, 18 Sep 2025
 06:30:55 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>, openembeded-devel
	<Openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] Stable branch maintainership
Thread-Topic: [oe] Stable branch maintainership
Thread-Index: AQHcIQpKKuu3mLofZkyu9RG/kWvjNrSOWNmAgAnytwCAAD19wA==
Date: Thu, 18 Sep 2025 06:30:54 +0000
Message-ID: 
 <AS1PR10MB5697EEA9AFC7F6760A4A54AAFD16A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: 
 <CAMKF1sqhzO979KgHE9BEfbw5xe7NH0GKZji9VHOAy6pn+E9NDQ@mail.gmail.com>
 <CAMKF1srN7LZORRCgvMP6e9Z-h6twprwBHw1h7oxRfYEBPXresw@mail.gmail.com>
 <CAMKF1spy0PQ3Zpjm9YS-1beTO+Rp2ss7wjQL3+JqGGopvd2z=g@mail.gmail.com>
In-Reply-To: 
 <CAMKF1spy0PQ3Zpjm9YS-1beTO+Rp2ss7wjQL3+JqGGopvd2z=g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=c77a181b-bf5a-4d5b-96f5-124c4b7fca6e;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-09-18T06:29:20Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DU4PR10MB8541:EE_
x-ms-office365-filtering-correlation-id: 36d66960-3c96-48ba-56e2-08ddf67cebe6
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?NFVJajNLQ2ttZURZaWtuR29uQjBuUWgzb04yN0d2SzNGRThCUEpBS2x4VGRL?=
 =?utf-8?B?d3J0OXQ5VHRYNnpkZ241eVE5YmxkM0xHUzlROFVpeitPdk1pOFQ1NU9HT1RJ?=
 =?utf-8?B?QlVhN3Q3cG1Fc21VTkdCSzFWd3IzUGc1OS9WM2wxMm1DUWIrVFV5NkluckND?=
 =?utf-8?B?eG8wc3paL0pBblBsRXowa2lsV2RZTXJTVXZZZmZRNUVjcldrZzdYclNEbGFE?=
 =?utf-8?B?bnVYZVhQQ2RxY3BXY0ZXNjBxOUFVYW4rM01iS0pISlZvR2J5Umh3MTRWOWJZ?=
 =?utf-8?B?SjBmdjFOQzcwNU1qak5oRzJsaFh4VjAvcUVabC9xNmlQWXZvWDM5SGlUUFN5?=
 =?utf-8?B?cmNFTCtucEdjZTdGOXpHMEN2OXZVNnQzeUI3aUFLQ1lwbEMzV2JtNVQyVGhp?=
 =?utf-8?B?L2VyNkZZcFViUERzekpMVm41TDVSU2FDMTdoK1dvdnZFamo2aVdXZ0tGMXdD?=
 =?utf-8?B?TE5yeC9mSk1PTyt4NVE3YkZHSCsveUpwTHpYQTZVcm9FMTZmenlZWTFtSjNZ?=
 =?utf-8?B?U3Z1THVkTlZ5U09TNDE0V2VPSjI3cUpGWU1Ubk9xOHJ3UmxFOVlpZFRMK0ZC?=
 =?utf-8?B?YytSZkVoWXppeTYxaTB3eE5sZmVTSFYzKzVQaU1TaVgyWjYwY2RYbHNpcCth?=
 =?utf-8?B?T2hwUUxMZjlRampMdlhkd0czSmgySnJxeFN5cEJQN0cwZWt4K2VLNzI5UHBn?=
 =?utf-8?B?U1JOMnh6bHhXdDA3b1BWdUowYm5xZXFaSkNRR1k3VUN4ZVNqM1F3MWRUVWYz?=
 =?utf-8?B?R1ovM2YwNHBLeit4Qm4rRWYvcjhjOFZWZFJZR2hDRWVtUXduZ1FSaWo5TGF3?=
 =?utf-8?B?dlNoUHN3S0piR0tzWDlGUTNlRFhaeUNESkF2MVNaOWZkNzBPL0NlNWJVWXpz?=
 =?utf-8?B?ZWZ0MkxUbXNqSTI4d0RnUUc5U0dXL1MyTCtxQ3BoZ0VqcWhHV21aWkRiMTdK?=
 =?utf-8?B?OEN4NlBQcExkanlPN3EwdkIwZVcrd2NLZmdTMFNkVEtYS3NuY01BaFB6TXhG?=
 =?utf-8?B?MVRFNVQ1R0VRUzk3ak5tUnhyRW9JTlBkb2FhTmNJSUpHd2RNcURMZHNSaGRi?=
 =?utf-8?B?L0dDdlIzeUZIaGp5VmQzTkh1aUJZWGxsL3hzNWFobFE2aktqaGMwakJtblQy?=
 =?utf-8?B?RDZXbXlTMW5JaTZncU1BWUZ1QnJEWnh6cGN4L0tDVTJxb3pLSERTRFJsNUNr?=
 =?utf-8?B?Q1hmTTlGYU1zS0tld01pVnNlY1RtQ2YwK0dKNTFZc3g0dmkvRkNqaTY0bHA3?=
 =?utf-8?B?ZlBLQzN1aWFZR3J5QnUwNmdyb1B6NThReldxY0tXSkdrdEVaY3ZZWlFLSThh?=
 =?utf-8?B?YmRQdFRLT2RlMk8yeGpsRXNSWFJ2cHoySUwwZ3ZwYllYNUpxTGZBTlV2M3oy?=
 =?utf-8?B?UGhYMnlha3NvRitwL2dVZ3F0Y3VNVGsvQ1BMRU43dnROUUNSVUN6UUlnM0Fn?=
 =?utf-8?B?anZhb09ieTRtNldmREYrbWpzV1VoL0sxWFJhWGhCdDFQWDRENCtLY3dIencw?=
 =?utf-8?B?S1RpWWJ0RHBJOHBuOXpYMWtSNS9Bd3prMitWUDJSZUhpMnlKcnByQjNIRElk?=
 =?utf-8?B?RU84bmV4ZTVlSUdLN085TWVOZEV5aE9Qbk1RaTRwOGFCM1ByT2VoZUpHeG5C?=
 =?utf-8?B?NnBxcllmbldWRUV4VFVXRG1iNzc1TCtqT051VCtMQkRwZFVhaEtjN2F1cVZG?=
 =?utf-8?B?TTA3TzVBaGV3V3hXVUY4M0tlWVRRSE1mOC9qKzVUWHdDUkxEdTVJMC9CWlEw?=
 =?utf-8?B?NXJ1cTk1VHRCR29VTnpKN1J3ZWhiMThETXJUOExSNTJLVVdDYW9HVWtqOXNR?=
 =?utf-8?B?U216Q0F4ZlBNUmlxZHhISE9xSUZXTVNYQmVmVzFDbVErMTZVOGxWOU1tRU1B?=
 =?utf-8?B?WHB2UWs5c1hTcmNydGFKZW44QWk3WXk5Mzczay9ULzhDWEVQMDNsbEUwd2c1?=
 =?utf-8?Q?mI1f9fbeKrM=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?amdmY3R6UFNaNDM1ZjdCblc2NXh3bUJvYlhIMjRRMWdPT0pkdVNKUHFFRXhD?=
 =?utf-8?B?U1BML3hMOEVmWkpvTVdhdkptcWdwMEwrTnVyaFk0bkhVb2dlWlBGNm9QL05n?=
 =?utf-8?B?dmJNQ1BPc0FYeGQ1NTArdnFLMTFUTHpEWmtVR08zUXpjdkp5TG1qMUd1ZEg4?=
 =?utf-8?B?c2cwVE1nVmU1WGI2K3ljUkVlVHhRUExTKzh1aW5ua1BuTWxHUzNLVmJmM3dv?=
 =?utf-8?B?S0p6K2x1cW90ZEdiQXNiTUpKdC9ienF6N2ZSTzRQWGpoWG1tb2NUcldVNFpI?=
 =?utf-8?B?YmJEem9meGYvNlg5eFhhV1dhVUJKOHlNcVJUYWhEaC9lSlBaeTN4bXNNODNU?=
 =?utf-8?B?RDI4cE96V3FjWTJROWJwVDBDV0hqNnRRMHpFU1ZqRWJySCtFSEl0MHA3eldK?=
 =?utf-8?B?UGd5b0cxcXIwVDZ4SURoVUNpKzZhRFdpbTNUV3pzNDc4RmI4ZWJSdDdwN3J3?=
 =?utf-8?B?ZVJBQ2dKV2ZHMldtNlhLNDFZNW5TMTZuelJGT0lteXliYnNza0MxT2FtSWow?=
 =?utf-8?B?Wk9JeWgwblc2dE5aRW1WMTVsZGFSTnpKQ3RzRTBkTituQXk0TzdVUXZVdzc5?=
 =?utf-8?B?RWljWTVxUFpxaUg4YzcxTUhReTQzek52WUdnYnd2VzAzUXkzRkowNS9RRHV2?=
 =?utf-8?B?VUR3THl1cE9OZ052MWRha2YyWmVoVS8rbXFOaCtjOXFRaVZiWmV2dXRjL0xP?=
 =?utf-8?B?WEE4VjZPRnA1VEpMNks0ZHNVaWQxOHNnaThFcXk5dklYMUtQR1JBaFA4Wjhx?=
 =?utf-8?B?RldzSzU1Z3lDUUFkSG9sL2E2eHE5RXU3ZjJ3Q25GbDREak9ta1ZCR2c3Y0pB?=
 =?utf-8?B?N3hmS3c2QzE3aXNncG04aG8rOUpWOFZ0TEN3dktNbGFzRmZtQU5QZUFhQUQ5?=
 =?utf-8?B?Ym1TcURmd0M3T0phbGtpakJkTHIzanEzWW40NXI3NUR3VFBwc3hqS0pmTXBr?=
 =?utf-8?B?dTVYU0M4QVp4WkY4Undtbi9nSG9RZGJSZStmdWtxcUYyZU1vK0xlUkNwcE1J?=
 =?utf-8?B?cXVKeStOQ2dBdFdWVk92SFhDQU1qS0dZUjRUb0J0Wm50SUxKSEc0UlNJbWNh?=
 =?utf-8?B?eVhIL1BjZnZrUWwzQ2RmUEJmYVRzRUpVT0JYbko1STdhcTRxVEJMc1hnR040?=
 =?utf-8?B?V3dJalFKQmRVZ3B0YVRzK01zR3I0QWVQeDArU2pnN1BRN1hoOEtnL2V4OWNX?=
 =?utf-8?B?WTRqdjdtMXA3RGxPNE8yejJpZGtwb08vSTVVS0JXRnFqeWxHUzIrYWZKclN2?=
 =?utf-8?B?TGRTeGNnbHpJSmpwODF1UFRmUVFmdmxlZGRPT1RIeEdaTXhLQ1lyWUhaK0Nk?=
 =?utf-8?B?UDd3SFVBRi8xSnd2WWQxM29vU2JMUlhrbzVtMjFEcVFyRk9ZQ3IveGxtcVpF?=
 =?utf-8?B?WGJZbXBuMkJJT1o1Tlc0WnRjblM1eHVvRVkra1MvMUFVZTZ6OFEyMW9sNTNJ?=
 =?utf-8?B?KzErVnNHc3JvUmY0SkpOK1R6Mmp2d3dZYi9ZOTJEU29JTENhbE9jQk9VamNR?=
 =?utf-8?B?WDFaaVBRejFEREQyTW9FYzZObkpsZnZXTVZjSDFPS0ZWdVdnUThhclBDK29L?=
 =?utf-8?B?TEUyelJKdEVoOURqNllFSGJLd1VqVW1vWGpmNVN4QW5IcjR0Vy9kaFc3TGN5?=
 =?utf-8?B?SWdZTTRRQS8vTGVidlB2d3d6MStXY1JjUll6Qzc0VFZFdTR2elp3YTByc05H?=
 =?utf-8?B?K0hzUDBHQ1J5c2J6SVMyR1luQWJLUVlLWTFuOHBsbkZoclR4WDF4bjlIME9N?=
 =?utf-8?B?YXFpMERkMGJsYlhXa2dFS3VZODI1WVNpZWlGa2lKNms3QVY1azY4MjRnMUNl?=
 =?utf-8?B?YjBhRUN4TzVJK0FSK01UWEhmWlRZbDZ2K1VzRFB1ZzNiRnd4dzA4YkVTVlpn?=
 =?utf-8?B?Q3JWN1FnaHV2SEYvRlFFcGwyL0w4QmYremtsZ2plMzdnMXB5Nzk3WS9uZmJj?=
 =?utf-8?B?SlM1ZmZ4U3dFc2JGVStFdTFuNkdsVjJNSHJ4Z2Y1aE9FZVlveEtxNjBnWlNn?=
 =?utf-8?B?aHBRT25sYmwrS3F0UzJsMnNvV3A2NVd1ajRFVWhERjhSV0diZ1F4djh6VUh6?=
 =?utf-8?B?Y2U1M29JTHpqMUZpWWdHWkNDbFo2cjJVRjRxUkd6aExleTR5anU4ZnhBS25S?=
 =?utf-8?Q?PrJVtT6EEzGbcdNh9Ut7JFE2Y?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 36d66960-3c96-48ba-56e2-08ddf67cebe6
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2025 06:30:55.0084
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MH7FRAepPqiCCMor3tNGA/pKCuP3TXzK3nMo8KEpgGyZ+/2KLBSvHo5GY+aovSyJrHrRz+65Y9lbCDhuBjTodA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB8541
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 06:30:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119527

RnJvbSBteSBwYXRjaGVzLCBvbmx5IHRoaXMgb25lIHdhcyBtaXNzZWQ6DQpodHRwczovL3BhdGNo
d29yay55b2N0b3Byb2plY3Qub3JnL3Byb2plY3Qvb2UvcGF0Y2gvMjAyNTA4MTQyMDQ0MDQuMjkw
NjIyOS0xLXBldGVyLm1hcmtvQHNpZW1lbnMuY29tLw0KKGtpcmtzdG9uZSBhbmQgd2FsbmFzY2Fy
IHZhaWFudHMgd2VyZSB0YWtlbiwgc2NhcnRoZ2FwIG5vdCkNCg0KUGV0ZXINCg0KPiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLQ0KPiBkZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnPiBPbiBCZWhhbGYgT2YgS2hlbSBSYWogdmlhDQo+IGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcN
Cj4gU2VudDogVGh1cnNkYXksIFNlcHRlbWJlciAxOCwgMjAyNSA0OjQ5DQo+IFRvOiBvcGVuZW1i
ZWRlZC1kZXZlbCA8T3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQo+
IFN1YmplY3Q6IFJlOiBbb2VdIFN0YWJsZSBicmFuY2ggbWFpbnRhaW5lcnNoaXANCj4gDQo+IEhp
IGFsbCwNCj4gDQo+IFdlIGhhdmUgcHVzaGVkIHRoZSBmaXJzdCBiYXRjaCBvZiB1cGRhdGVzIGZv
cg0KPiBzY2FydGhnYXAva2lya3N0b25lL3dhbG5hc2NhciBvdmVyc2VlbiBieSBvdXIgbmV3IHJl
bGVhc2UgbWFpbnRhaW5lcnMuDQo+IEkgZG8gcmVhbGl6ZSB0aGF0IHdlIG1pZ2h0IGhhdmUgbWlz
c2VkIHNvbWUgcGF0Y2hlcw0KPiBkdXJpbmcgdGhpcyB0cmFuc2l0aW9uLiBQbGVhc2UgYnJpbmcg
YW55IHBlbmRpbmcgcGF0Y2hlcyB0byB0aGUNCj4gbWFpbnRhaW5lcnMgYXR0ZW50aW9uLiBXZSB3
aWxsIGJlIHdvcmtpbmcgb24gcmVmaW5pbmcgdGhlIHBhdGNoDQo+IHRlc3RpbmcsIENJLCBhbmQg
YXV0b21hdGlvbiBmb3IgcmVsZWFzZSBicmFuY2hlcw0KPiBnb2luZyBmb3J3YXJkLg0KPiANCj4g
VGhhbmsgeW91DQo+IC1LaGVtDQo+IA0KPiBPbiBUaHUsIFNlcCAxMSwgMjAyNSBhdCAxMTo1NOKA
r0FNIEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+IHdyb3RlOg0KPiA+DQo+ID4gSGVsbG8g
QWxsLA0KPiA+DQo+ID4gVGhhbmtzIGZvciBjb25zaWRlcmluZyB0aGlzIGFuZCByZXNwb25kaW5n
IHRvIHRoZSBjYWxsLg0KPiA+DQo+ID4gQW51aiBhbmQgR3lyb2d5IGhhdmUgb2ZmZXJlZCB0byBo
ZWxwIGluIG1haW50YWluaW5nIHRoZSBzdGFibGUNCj4gPiBicmFuY2hlcyBhbmQgQW5rdXIgVHlh
Z2kgaGFzIGFsc28gb2ZmZXJlZCB0byBoZWxwIHdpdGggdGhlIHN0YWJsZQ0KPiA+IGJyYW5jaCB3
b3JrZmxvdy4gSSB3aWxsIHdvcmsgd2l0aCBhbGwgb2YgdGhlbSBpbiBkaXZpZGluZw0KPiA+IFRo
YW5rcyBmb3Igc2lnbmluZyB1cCBmb3IgdGhpcyB3b3JrLiBGb3Igbm93LCBBbnVqIHdpbGwgYmUg
bWFpbnRhaW5pbmcNCj4gPiBzY2FydGhnYXAgTFRTIHJlbGVhc2UsIEd5b3JneSB3aWxsIG1haW50
YWluIEtpcmtzdG9uZSBMVFMgYW5kDQo+ID4gV2FsbmFzY2FyIHJlbGVhc2VzLiBXZSB3aWxsIHdv
cmsgdG93YXJkcyBpbmZyYSBhbmQgcHJvY2VzcyBuZXh0Lg0KPiA+DQo+ID4gVGhhbmtzDQo+ID4g
LUtoZW0NCj4gPg0KPiA+IE9uIE1vbiwgU2VwIDgsIDIwMjUgYXQgMjo0N+KAr1BNIEtoZW0gUmFq
IDxyYWoua2hlbUBnbWFpbC5jb20+IHdyb3RlOg0KPiA+ID4NCj4gPiA+IERlYXIgQ29tbXVuaXR5
IG1lbWJlcnMsDQo+ID4gPg0KPiA+ID4gQXJtaW4gaGFzIGJlZW4gZG9pbmcgYXdlc29tZSB3b3Jr
IGluIG1haW50YWluaW5nIHN0YWJsZSByZWxlYXNlIGZvcg0KPiA+ID4gbWV0YS1vcGVuZW1iZWRk
ZWQgbGF5ZXJzIGZvciBtYW55IHJlbGVhc2VzLCBob3dldmVyIGhpcyBzaXR1YXRpb24gaGFzDQo+
ID4gPiBjaGFuZ2VkIHN1Y2ggdGhhdCBoZSBpcyBub3QgYWJsZSB0byBjb250aW51ZSB0aGUgbWV0
YS1vZSBzdGFibGUNCj4gPiA+IG1haW50ZW5hbmNlLg0KPiA+ID4NCj4gPiA+IFdlIGhhdmUgdGhy
ZWUgYnJhbmNoZXMgaW4gbWFpbnRlbmFuY2UsIGtpcnN0b25lLCBzY2FydGhnYXAgYW5kDQo+ID4g
PiB3YWxuYXNjYXIgYXQgdGhlIG1vbWVudCBhbmQNCj4gPiA+IGEgYmFja2xvZyBoYXMgYmVlbiBw
aWxpbmcgdXAuIFNldmVyYWwgbWVtYmVycyBoYXZlIHJhaXNlZCBjb25jZXJucyBvbg0KPiA+ID4g
bWFpbGluZyBsaXN0cyBvbiBwZW5kaW5nDQo+ID4gPiB1cGRhdGVzIGZvciB0aGUgc3RhYmxlIGJy
YW5jaGVzDQo+ID4gPg0KPiA+ID4gSSB3b3VsZCBsb3ZlIHRvIGhhdmUgc29tZW9uZSBzdGVwIHVw
IHRvIGhlbHAgd2l0aCB0aGUgc3RhYmxlDQo+ID4gPiBtYWludGFpbmVycyByb2xlLiBXaGljaCB3
b3VsZA0KPiA+ID4gYmUgbG9va2luZyBmb3Igc3RhYmxlIGJyYW5jaCBwYXRjaGVzIG9uIG1haWxp
bmcgbGlzdHMgYW5kIHJldmlld2luZw0KPiA+ID4gdGhlbSBhbmQgY3JlYXRpbmcgYSBzdGFnaW5n
DQo+ID4gPiBicmFuY2ggKCBsaWtlIGNvbnRyaWIvc3RhYmxlL2tpcmtzdG9uZS1udXQgZXRjICks
IHRlc3RpbmcgYW5kDQo+ID4gPiBwcmVwYXJpbmcgZmluYWwgcHVsbC4NCj4gPiA+DQo+ID4gPiBB
cm1pbiB1c2VkIGhpcyBvd24gbWFjaGluZXMgdG8gcnVuIHRoZSBDSSwgd2Ugbm93IGRvIGhhdmUg
YSBtYWNoaW5lDQo+ID4gPiBhdmFpbGFibGUgZm9yIE9FIENJDQo+ID4gPiB3aGljaCB3ZSBzaG91
bGQgYmUgYWJsZSB0byB1c2UgZm9yIHRoZSBDSSBsb29wcyBmb3IgdGhlc2UgYnJhbmNoZXMgaWYg
bmVlZGVkLg0KPiA+ID4NCj4gPiA+IExvb2tpbmcgZm9yd2FyZCB0byBoZWFyaW5nIGZyb20geW91
DQo+ID4gPg0KPiA+ID4gVGhhbmsgeW91DQo+ID4gPiAtS2hlbQ0K


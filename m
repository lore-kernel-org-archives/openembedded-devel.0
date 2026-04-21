Return-Path: <zeming.liu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B54CAF327BE
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 07:54:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15701.1776758047153375458
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Apr 2026 00:54:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=cIQ20NRq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=85710dc008=zeming.liu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L5GF6r2632597
	for <openembedded-devel@lists.openembedded.org>; Tue, 21 Apr 2026 07:54:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=Pw+0K/zQoSx136NlFGxFHC+OjjgcqpZ4OmnntwfEJnE=; b=cIQ20NRqcZqm
	0C5T1CmtSwa5ywEFHrelSxT5Ips5/6ML6IkF/aXJr0J63WU6HPedPJz0/5WxxvBQ
	BI2/JsxmhjGC6S2ShPRtTJ6JFDfCgC37AV8yJsp4AdsN3MEqNRzxEe9gJHGkW/sp
	RrNPfFFL7xwLH7vSdpaCc2KyQvHydNGHp3jaIUhR92bPPLb+7Fj5cuI8SBVu4o6y
	5P/vjM235BOLM0Dg1o4zCrPWxQOzak5KkDq3K7uYyuZ0XgrdvPmQPqWpNUlMbfp9
	fee7fGKhWcbvGfhoBlOtq8BkWSV+HAUaMKpaXVfAT2HHd4XFex5LVUave+9dWMxc
	10eg9itYmg==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010041.outbound.protection.outlook.com [40.93.198.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dm0x6u1hm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 21 Apr 2026 07:54:05 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=liHMmuBa6F1Nh54h+IYND/lbplfbHu0+UmkVKjdbfmYmJLW/gXlTfhpbNbO3LsuD2+cepxlmB+TtQB9FmR7guVSThsH8WKtUcbVYpVQ5sVmdHn1OZQAZ0oY9CEkxpT+HB1zz6oC4njHY253nJ5doIXoC7f0cyaC9saVuFRYDnXk9l+ncw7ophELKOMmM4RlQxzULPZcu40urF0wu5ppRk1ro2NxYc55f8/bvysAKjgcdhpwysGcVH6WSG3Dug/h+RDGvUiO0rHHFNNacj0ejf7S7QWY5bi2zpgT0XMAeuUAPtikJQLIAb5Gew3XacaDU1yMfg2jIUU9exuZu8mhVlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pw+0K/zQoSx136NlFGxFHC+OjjgcqpZ4OmnntwfEJnE=;
 b=lyFXy9CN85fvCD3iejYqMMzBo9gFLsGOXSigwNe6kfGLKD8S780fSM71wFRJ5Sc0U2O1zFSvoVo655KQaIGpH400AlYo80dWwyj1IW1OFuVxzmK7uY1X6AePsukKFoTyTgn8e+4+OfuUAxpanqphg3zecErfa/e6kSH1md4zv2ZS8njwMLJFJCzjeZxZlUZ1EPSeiw9TnkLMNRjGfNJcSrug4sJs15GBRsywV5PycxYg8GM7xTlAdNoiCFbSHSXkrGG7zFK15QuD9OvC1P2mLcQoik8sKPzUo0nwtP8y/S/IBgLJns9lk5T6X3EoixAEY2NOiWnSevzp04g8mnESYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7431.namprd11.prod.outlook.com (2603:10b6:510:273::16)
 by PH8PR11MB7989.namprd11.prod.outlook.com (2603:10b6:510:258::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Tue, 21 Apr
 2026 07:54:00 +0000
Received: from PH7PR11MB7431.namprd11.prod.outlook.com
 ([fe80::1c1d:5692:16e0:1a21]) by PH7PR11MB7431.namprd11.prod.outlook.com
 ([fe80::1c1d:5692:16e0:1a21%3]) with mapi id 15.20.9846.016; Tue, 21 Apr 2026
 07:54:00 +0000
From: "Liu, Zeming" <Zeming.Liu@windriver.com>
To: Gyorgy Sarvari <skandigraun@gmail.com>,
        "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][master][PATCH] tbb: Add ptest support
Thread-Topic: [oe] [meta-oe][master][PATCH] tbb: Add ptest support
Thread-Index: AQHc0V/AzHAwK3xXCU+sjdQsRk4tF7XpJLhg
Date: Tue, 21 Apr 2026 07:53:59 +0000
Message-ID: 
 <PH7PR11MB743155E2296D080635A6EC5D972C2@PH7PR11MB7431.namprd11.prod.outlook.com>
References: <20260421071052.2385333-1-zeming.liu@windriver.com>
 <466f9753-b9f1-4ac4-a502-92a23d039e85@gmail.com>
In-Reply-To: <466f9753-b9f1-4ac4-a502-92a23d039e85@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ActionId=f6c8087e-e18a-44bb-9a79-b638baee47b1;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=0;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=true;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2026-04-21T07:52:00Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Tag=10,
 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB7431:EE_|PH8PR11MB7989:EE_
x-ms-office365-filtering-correlation-id: e4cb31bb-5246-4153-3fbb-08de9f7b25f9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|4022899009|18002099003|22082099003|38070700021|56012099003;
x-microsoft-antispam-message-info: 
 iURWih2N1OUuOUD/oNUsbVzMogLp0UJhgrgNVD96QRqlEqop0n0mfP8ByaizEm5WPfrXc51UVDB02WnSA3Ox/Hjc+heXOnzEIy76DYAvpp5Qn04ukoT53xptHENIslKTIiHlV/bbVx1IwHThoM/tcsJugwbhibqwkAz5TelZiPev2bhuQkvXPlwZnCJr96hBra3umrhx7l1reeMaLgjkLm78GeoWaTwyrKOf9ERrb5dQUaqTb/afjP8aQVKZDnfMnl2kdNesfhw91qShX/6x+2mqRYZpk+GOLB31gwU+ZdIWfqJ7wRHMAU5YX7nk7wyPvnJzrcEzrU+NY0/kt6KSuTcYSGcGw9AxsYkFJWYsIrUJvAmHDNJ9W93iSktzp4k/1k9NXdJuk53jXxbr7kHK++q5f4bBujJNc9NBOJ3lWJJprQwQhlofpZWZdvU1aYrF0QetgcLcQtX7fRhrZPGg4nO4MaQiMYI2TgsXCAQEdOQBGQahY0qhLIBorP71CLzQw3PNxRour70tRW39cEl2tS/s2c9owFULmElLd7QLFBanKKTgbu7E8OvJNXlD/oZ/DeSPUo2l7FDga4RmrLbBIKX7j4UTX45ubQyT/KD9hCbykhq5kIXxQyujYIyAYPpXG7XyDuxEclGSYQA0kD5l9/evMbxY19kZoSlyGZyxW1Vy86ZK6cykCq2hYL9ylApWQfGDyMIDjvmOjyb7ELxDnJeTdfz77qhXUfWK9yktnAqKr3n+74KTeWHzuRyI860l
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7431.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(4022899009)(18002099003)(22082099003)(38070700021)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NmFvUEVHU0RaUVhHckFDand0MWl5OEhlR256UnFDRlFNVDN5VytSWVkyMDBM?=
 =?utf-8?B?ZmkydDdlZGlOdlY2MSsvTVdBWSs5elV1aDU1UHZKUFJjaG1kVXRySVFMRGVQ?=
 =?utf-8?B?YzJjclorMEp4TUNiTzdvVmY3U3dkRXMwUDNEOWNMTnZETnR5SkM4QzJTVjVx?=
 =?utf-8?B?TFhxa1NpZG5ORktTWVJ4OWFudndsTGV6dmZmMGtpbURJK1hGelU1ck9BQ2tE?=
 =?utf-8?B?azNvYkxxUkNtdFZ2K3B2eUhyMlBESFVKVDVDQlcydy8ySjU4QzQyTUtNZlJn?=
 =?utf-8?B?blRHY0JKS3ZCT3F1cDc0S0liSlpNYkxRalZ4Qlh6cnVENEkrbGU2MTY2L1BT?=
 =?utf-8?B?WjcvdVVKNGZHUy9XUGp5NGZ5bnVmYUNPdzdXSE53ODJzY05DRm9NdEZMN3J6?=
 =?utf-8?B?R2hlRndZV1JDanhvaFR6b09udmtiVDYwZSsxdkUwQXFOQlJCZklmSUcrb3Nu?=
 =?utf-8?B?NGhNRDZLTURtVmIvWTFBWFB4amQ0OGQrMU1qTDVHNGR0RkRrQVhmWUFIWWJK?=
 =?utf-8?B?VzRuaWtNNE5kK2hBdVpuRGhaR0RaRHMrOHRHdDN1OWwzTWE0d1BCUVFRTG56?=
 =?utf-8?B?N0lQUlQwODhkQ3k4QnJtckZ6WWZVNXVoaFBGMFFjRzQyT0RTbzdUUVY5bEZU?=
 =?utf-8?B?WXJQVHluYjJ3NVBVR2J2T0NMaFg5RXp0elM3UElhTG9aTUtjV1hFS3FMT2dJ?=
 =?utf-8?B?TUZLRnRZQkNtK1JsT3hoOW1JNHBYTWV1bjZZTmlsR0g3N2hadGNkaGtRYUIv?=
 =?utf-8?B?bjRQU3dlS2JaVGNLbkN3MnNQc2lHVUFMUkRVQzhxU0YxVDdCV3NoZlo0bmM1?=
 =?utf-8?B?amV6ZXRJaHozREJlUC9EKzRibDhzamZNcU1NTGgyZDAxZW9BK1FMTFRnazJ0?=
 =?utf-8?B?SEJLWm1USU1xRXdTNXh5MzRrUDlZeVdSU0RsSXM0ckpqWFhTbzBqVUFGeUQ4?=
 =?utf-8?B?cmxRSU9HYlh6clhFc1NkTUxwZC9WNU5FUE9JVmxJNys5cEpkL0JiakVBUTQ2?=
 =?utf-8?B?aWdnUGxaeW9UN1pxLzUxRVBBSmEvcGgvTGxmOGhRT0ZLaDIxSldOVkdCempp?=
 =?utf-8?B?OHNydmgrTVJQQlZFY0pzTHYvUG9KUzB3cHZtSUpqMWptTlJwUVNCalRWaElT?=
 =?utf-8?B?VWdQblAxZ2hWTjFpajZQVEpiL2dGNWh3M2JVb01QdFYveXUxaW8vZFBoLzls?=
 =?utf-8?B?cnlQQ1dMN3Buck10bVFkRHV4S3Rra0ZPdThzMXpvcWlaYWtpeHhDREY3V3BT?=
 =?utf-8?B?VGtFdlpjT3hjUzlmdEZCOXJxQkhuSXZiN3REbE1Jb081NzEzTE5yTUcrYlUv?=
 =?utf-8?B?Z1VsZ2Z3aXhBUk1hRGVkWlZxN0FML0FaWHM5blJPT2N6dnpyaVZXZkdpWDdG?=
 =?utf-8?B?ZFhTUFAwaUdkVmpUeDlFNUdtTzQ2VldhbUZ1TS8zU29zQXJsR3hJUDZlWGJ0?=
 =?utf-8?B?b25uL0NqZ2FCazlTSGJGbkkyZ1BJMjkrMWVvUC80dVA1VStZQ0xLU2QybkpJ?=
 =?utf-8?B?dUd0WThiajFMdHRpRkhrNjJLSnZVSTNIakZIYktrRVFQRE5lUXhZbzhIN0c3?=
 =?utf-8?B?czhUUGVaWEhSei84VmRZd3FvMnhpbDFEckpWSlc1OEYzelUxcFNJL0hUT205?=
 =?utf-8?B?YUlCU3crWnlvZTgvNGU3cGt5b056WXBvZGNpZThyY3hnc1NtcTdHTk9EUjVQ?=
 =?utf-8?B?ZGZ3UEZxeFVuUnQ5ZnBlN3djVTN0Ni9rVmorVGkrQ1YyUjdqeTRZK3VHZ2VH?=
 =?utf-8?B?RGhmU1ZNdVpsbWZBc3c2YmQwOVhUWDVXS0k2VzJzNU1pSzN0cFVUUElkc3dp?=
 =?utf-8?B?LzNxUDhCc1p2Y3JCM3ptQVUwVVZVQkRTTjNQOVdycjl1YjJkV1dWVUhzR2Vx?=
 =?utf-8?B?QWdoUURvWFJpUFNIRVI0VUFaUmVXVVdsdHkrTy82TldTRUg5OVZSZjhoekRS?=
 =?utf-8?B?WHE4eDVBdERqbCtvRXJtZWNiMUFPM0ZhNEpSMGFEZGR6V256cFdYVnNXWmhR?=
 =?utf-8?B?RFg5NEJsekdWYlJsK2FQU0xaNDVpcDE0Rm5JY1prUUIwVmx5ek5XQnNzOXVG?=
 =?utf-8?B?Y0MwQTJsRzdjcDV2MFBYRVNVZlZiVkU2MWR6UUZ3NmhQd0xHQXFVbFhydHM0?=
 =?utf-8?B?dFRlVlo1U0xoMVJ2VFpkb0pEaUl0UVVMai9zSmRGNTRFanA4b3hDZ2ZLVVIz?=
 =?utf-8?B?emZVc2xZUzZPQXdmUkRLbmZydU9Dck9FcEIwTEpWL3R5c2Y5TThZWHA0Lytx?=
 =?utf-8?B?YmIrL013MlJYOFJpa1kzRnM2cHpieDVGSHVnbld0c2pkTEsrYkY2R2hZOHFu?=
 =?utf-8?B?VFRrU3RYM2UxNVhpeloxVEZXZEhXbFh1ZXJiOTRtczIyeVJncys2UT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	Vj79goHRc17DA9SCdG4DC28mxuLzWssGn8hbzERyIY2CSJG8H/oCCONE9KTqX639Gd7lqTzu/lDWREKmxmPKtl+iVDyK2a52sUS1IIacJnk9WEi1jmSXkt9Gv5Jf2sEl8D0r7gxgRmZGA12OAo0RSye1HeXJnlhVsDKTzBhK3tOoCutFLnTUq2aui6Y5owTpIdO6Xr5vLzYHo5bsIlhp03bKk1tF36I4yB4D8hPmXAftHlG42zBp7THmyZW1j4snYazdETSq6Z4xakWITXwB+Nk8dfpCLJnmIUtPeybbB3BBXKrg56wvdMFNvJ6da4+DDeABILXj3KKvnjoWWMX3Kg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7431.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4cb31bb-5246-4153-3fbb-08de9f7b25f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2026 07:53:59.9436
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1rVJkz6OC+QLjKE454HO8JnRicW6yKHaGfxKDrVqek0jwoo76qjxK3EQJHFa3jgfdHGP4hG+WmxloYzacO0R7IwU9vx/uweTrBl/hp2mRsQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7989
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=bOMm5v+Z c=1 sm=1 tr=0 ts=69e72d1e cx=c_pps
 a=GhmKEtzeB3JP3t09wzqP+g==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=Q4-j1AaZAAAA:8 a=f1hami8VAAAA:8 a=pGLkceISAAAA:8
 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=zUXqDipC3jMIA6n2jEgA:9 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FMFxGtP9trmfb28vA-lX:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: v5YBWsoISsJZ8DElp2Q0JL6ADZb7NJ12
X-Proofpoint-ORIG-GUID: ICL-VXtZz4Ee6i-dEFKB7l-txf546PYh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDA3NSBTYWx0ZWRfX2bolXIDVzUEl
 NQcH94fEV24drxuKRry9K7Unew4kYPfPTnmTU2lQJIU9hC43bw//y2sXg4f/PI5uUSqoqMwJwpy
 IKBHLrOcCrLGAG37/LzUsW5mh5oPbwYmzya11eFh2Z5kVb9KLLydytzcc0W+jpjWedMijRPsEMu
 82feN4nfxUUk0vKGDVC3Z1jt0b9DzR6nQkNVWsFw4L+9nH/4k+eZHRZCLmaZyO7iOzTHLLDTMyJ
 sM4NlgAVK2HKwj8QzND1ytrulxrFpY2lNRt7IztZAzeQ0wG81WeUt/NO+YHiInb563CINJSQKOF
 VVs0oU75S5Blngo3Cjwu/tMSeIWXQ7gsv7fpBuHSysQuStTbll1/MvDeViZKCjrZ3LEjGLUBIPL
 WiDR60QbGM2SGsu3yPPEqWSQnh9hquyOAA93e3i89a/uCtESSxU/jio0NO/QyY8oqOsDyCX3MBX
 PDlafd+SZnpwmNyCcew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_01,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210075
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Apr 2026 07:54:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126526

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHeW9yZ3kgU2FydmFyaSA8c2th
bmRpZ3JhdW5AZ21haWwuY29tPg0KPiBTZW50OiAyMDI25bm0NOaciDIx5pelIDE1OjIzDQo+IFRv
OiBMaXUsIFplbWluZyA8WmVtaW5nLkxpdUB3aW5kcml2ZXIuY29tPjsNCj4gb3BlbmVtYmVkZGVk
LWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtvZV0gW21ldGEt
b2VdW21hc3Rlcl1bUEFUQ0hdIHRiYjogQWRkIHB0ZXN0IHN1cHBvcnQNCj4gDQo+IENBVVRJT046
IFRoaXMgZW1haWwgY29tZXMgZnJvbSBhIG5vbiBXaW5kIFJpdmVyIGVtYWlsIGFjY291bnQhDQo+
IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgcmVjb2du
aXplIHRoZSBzZW5kZXIgYW5kDQo+IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4gDQo+IE9u
IDQvMjEvMjYgMDk6MTAsIFplbWluZyBMSVUgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgd3Jv
dGU6DQo+IFsuLi5dDQo+ID4gTm90ZToNCj4gPiBUaGUgdGVzdCBpcyBleGVjdXRlZCBvbiBxZW11
IHdpdGgga3ZtIGFuZCBxZW11cGFyYW1zPSItbSAyMDQ4IiwgYXMgdGJiDQo+ID4gcHRlc3QgaXMg
dGhyZWFkL21lbSBjb25zdW1pbmcsICB0aGUgdGJiIHB0ZXN0cyB3aWxsIGZhaWwgb3IgdGltZW91
dA0KPiA+IHdpdGggbGltaXRlZCByZXNvdXJjZS4NCj4gDQo+IA0KPiBZb3UgY2FuIGN1c3RvbWl6
ZSB0aGUgYXZhaWxhYmxlIG1lbW9yeSBmb3IgZWFjaCBQTiBpbiB0aGUgcHRlc3QgaW1hZ2UNCj4g
cmVjaXBlOg0KPiBodHRwczovL2dpdC5vcGVuZW1iZWRkZWQub3JnL21ldGEtb3BlbmVtYmVkZGVk
L3RyZWUvbWV0YS1vZS9yZWNpcGVzLWNvcg0KPiBlL2ltYWdlcy9tZXRhLW9lLWltYWdlLXB0ZXN0
LmJiI24yOQ0KPiANCj4gQW5vdGhlciBzbWFsbCBub3RlLCBzaW5jZSBJIGFscmVhZHkgd3JvdGUg
dGhlIGFib3ZlOg0KPiAiLS1mb3JjZS1uZXctY3Rlc3QtcHJvY2VzcyIgZmxhZyBpbiB0aGUgcnVu
LXB0ZXN0IHNjcmlwdCBpcyBhIG5vLW9wOg0KPiBjdGVzdCBoYXMgYmVlbiBpZ25vcmluZyBpdCBz
aW5jZSBhIHdoaWxlOg0KPiBodHRwczovL2NtYWtlLm9yZy9jbWFrZS9oZWxwL2xhdGVzdC9tYW51
YWwvY3Rlc3QuMS5odG1sI2NtZG9wdGlvbi1jdGVzdC1mb3INCj4gY2UtbmV3LWN0ZXN0LXByb2Nl
c3MNCg0KVGhhbmtzIGZvciB0aGUgY29tbWVudHMsIEknbGwgY2hlY2sgYW5kIHNlbmQgdjIuDQoN
ClJlZ2FyZHMsDQpaZW1pbmcgTGl1DQo+IA0KPiANCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFpl
bWluZyBMSVUgPHplbWluZy5saXVAd2luZHJpdmVyLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL2lu
Y2x1ZGUvcHRlc3QtcGFja2FnZWxpc3RzLW1ldGEtb2UuaW5jICAgICB8ICAxICsNCj4gPiAgbWV0
YS1vZS9yZWNpcGVzLXN1cHBvcnQvdGJiL2ZpbGVzL3J1bi1wdGVzdCAgICB8ICAzICsrKw0KPiA+
ICBtZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC90YmIvdGJiXzIwMjIuMy4wLmJiICAgIHwgMTgNCj4g
KysrKysrKysrKysrKysrKy0tDQo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkgIGNyZWF0ZSBtb2RlIDEwMDc1NQ0KPiA+IG1ldGEtb2UvcmVjaXBl
cy1zdXBwb3J0L3RiYi9maWxlcy9ydW4tcHRlc3QNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9tZXRh
LW9lL2NvbmYvaW5jbHVkZS9wdGVzdC1wYWNrYWdlbGlzdHMtbWV0YS1vZS5pbmMNCj4gPiBiL21l
dGEtb2UvY29uZi9pbmNsdWRlL3B0ZXN0LXBhY2thZ2VsaXN0cy1tZXRhLW9lLmluYw0KPiA+IGlu
ZGV4IGI3NjRkNWRkNTguLjUyOGNlMTYxOTEgMTAwNjQ0DQo+ID4gLS0tIGEvbWV0YS1vZS9jb25m
L2luY2x1ZGUvcHRlc3QtcGFja2FnZWxpc3RzLW1ldGEtb2UuaW5jDQo+ID4gKysrIGIvbWV0YS1v
ZS9jb25mL2luY2x1ZGUvcHRlc3QtcGFja2FnZWxpc3RzLW1ldGEtb2UuaW5jDQo+ID4gQEAgLTgw
LDYgKzgwLDcgQEAgUFRFU1RTX1NMT1dfTUVUQV9PRSA9ICJcDQo+ID4gICAgICBwb3N0Z3Jlc3Fs
IFwNCj4gPiAgICAgIHJlMiBcDQo+ID4gICAgICByb2Nrc2RiIFwNCj4gPiArICAgIHRiYiBcDQo+
ID4gICINCj4gPiAgUFRFU1RTX1NMT1dfTUVUQV9PRTphcHBlbmQ6eDg2ID0gIiBrZXJuZWwtc2Vs
ZnRlc3QiDQo+ID4gIFBURVNUU19TTE9XX01FVEFfT0U6YXBwZW5kOng4Ni02NCA9ICIga2VybmVs
LXNlbGZ0ZXN0Ig0KPiA+IGRpZmYgLS1naXQgYS9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC90YmIv
ZmlsZXMvcnVuLXB0ZXN0DQo+ID4gYi9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC90YmIvZmlsZXMv
cnVuLXB0ZXN0DQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA3NTUNCj4gPiBpbmRleCAwMDAwMDAwMDAw
Li44YmQ1ZmQxZWZiDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL21ldGEtb2UvcmVjaXBl
cy1zdXBwb3J0L3RiYi9maWxlcy9ydW4tcHRlc3QNCj4gPiBAQCAtMCwwICsxLDMgQEANCj4gPiAr
IyEvYmluL3NoDQo+ID4gKw0KPiA+ICtjdGVzdCAtLWZvcmNlLW5ldy1jdGVzdC1wcm9jZXNzIHwg
c2VkIC11ICdzL1wqXCpcKi8gICAvZycgfCBhd2sgJy9UZXN0DQo+ICsjL3tnc3ViKC9QYXNzZWQv
LCJQQVNTIik7IGdzdWIoL0ZhaWxlZC8sIkZBSUwiKTsgZ3N1YigvU2tpcHBlZC8sIlNLSVAiKTsg
cHJpbnQNCj4gJDYiOiAiJDQ7IGZmbHVzaCgpO30nDQo+ID4gZGlmZiAtLWdpdCBhL21ldGEtb2Uv
cmVjaXBlcy1zdXBwb3J0L3RiYi90YmJfMjAyMi4zLjAuYmINCj4gPiBiL21ldGEtb2UvcmVjaXBl
cy1zdXBwb3J0L3RiYi90YmJfMjAyMi4zLjAuYmINCj4gPiBpbmRleCA0NDBiNmUwZjQ2Li4xODdj
MjA2MWU1IDEwMDY0NA0KPiA+IC0tLSBhL21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L3RiYi90YmJf
MjAyMi4zLjAuYmINCj4gPiArKysgYi9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC90YmIvdGJiXzIw
MjIuMy4wLmJiDQo+ID4gQEAgLTE1LDIwICsxNSwyMyBAQCBQRSA9ICIxIg0KPiA+ICBCUkFOQ0gg
PSAib25ldGJiXzIwMjIiDQo+ID4gIFNSQ1JFViA9ICJmMTg2MmYzOGY4MzU2OGQ5NmU4MTRlNDY5
YWI2MWY4ODMzNmNjNTk1Ig0KPiA+ICBTUkNfVVJJID0NCj4gPiAiZ2l0Oi8vZ2l0aHViLmNvbS9v
bmVhcGktc3JjL29uZVRCQi5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPSR7QlJBTkNIDQo+ID4g
fSBcDQo+ID4gKyAgICAgICAgICAgZmlsZTovL3J1bi1wdGVzdCBcDQo+ID4gICAgICAgICAgICAi
DQo+ID4NCj4gPiAgTERGTEFHUyArPSAiJHtAYmIudXRpbHMuY29udGFpbnMoJ0RJU1RST19GRUFU
VVJFUycsICdsZC1pcy1sbGQnLCAnDQo+IC1XbCwtLXVuZGVmaW5lZC12ZXJzaW9uJywgJycsIGQp
fSINCj4gPg0KPiA+IC1pbmhlcml0IGNtYWtlIHBrZ2NvbmZpZw0KPiA+ICtpbmhlcml0IGNtYWtl
IHBrZ2NvbmZpZyBwdGVzdA0KPiA+DQo+ID4gICMgdGVzdCBidWlsZCBmYWlscywgZXJyb3I6ICdt
YWxsaW5mbyBtYWxsaW5mbygpJyBpcyBkZXByZWNhdGVkDQo+ID4gRVhUUkFfT0VDTUFLRSArPSAi
IFwNCj4gPiAtICAgICAgICAgICAgICAgICAgICAtRFRCQl9URVNUPU9GRiBcDQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgLURUQkJfVEVTVD0ke0BiYi51dGlscy5jb250YWlucygnUFRFU1RfRU5B
QkxFRCcsDQo+ID4gKyAnMScsICdPTicsICdPRkYnLCBkKX0gXA0KPiA+ICAgICAgICAgICAgICAg
ICAgICAgIC1EQ01BS0VfQlVJTERfVFlQRT1SZWxlYXNlIFwNCj4gPiAgICAgICAgICAgICAgICAg
ICAgICAtRFRCQl9TVFJJQ1Q9T0ZGIFwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAtRFRCQl9E
SVNBQkxFX0hXTE9DX0FVVE9NQVRJQ19TRUFSQ0g9T0ZGDQo+IFwNCj4gPiAgICAgICAgICAgICAg
ICAgICINCj4gPg0KPiA+ICtSREVQRU5EUzoke1BOfS1wdGVzdCArPSAiY21ha2UiDQo+ID4gKw0K
PiA+ICAjIEhhcmQtZmxvYXQgJ2QnIEFCSSBjYW4ndCBiZSB1c2VkIGZvciBhIHRhcmdldCB0aGF0
IGRvZXNuJ3Qgc3VwcG9ydA0KPiA+IHRoZSBEIGluc3RydWN0aW9uIHNldCBleHRlbnNpb24gKGln
bm9yaW5nIHRhcmdldC1hYmkpICAjDQo+ID4gdG1wLWdsaWJjL3dvcmsvcmlzY3Y2NC1vZS1saW51
eC90YmIvMV8yMDIxLjcuMC1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdg0KPiA+IGUvdXNyL2Jpbi9y
aXNjdjY0LW9lLWxpbnV4L3Jpc2N2NjQtb2UtbGludXgtbGQ6IC90bXAvbHRvLWxsdm0tMjY0YmMy
Lm86IGNhbid0DQo+IGxpbmsgc29mdC1mbG9hdCBtb2R1bGVzIHdpdGggZG91YmxlLWZsb2F0IG1v
ZHVsZXMgICMNCj4gdG1wLWdsaWJjL3dvcmsvcmlzY3Y2NC1vZS1saW51eC90YmIvMV8yMDIxLjcu
MC1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNyLw0KPiBiaW4vcmlzY3Y2NC1vZS1saW51eC9y
aXNjdjY0LW9lLWxpbnV4LWxkOiBmYWlsZWQgdG8gbWVyZ2UgdGFyZ2V0IHNwZWNpZmljIGRhdGEg
b2YNCj4gZmlsZSAvdG1wL2x0by1sbHZtLTI2NGJjMi5vIEBAIC02MCw1ICs2MywxNiBAQA0KPiBk
b19pbnN0YWxsOmFwcGVuZDpjbGFzcy10YXJnZXQoKSB7DQo+ID4gICAgICBzZWQgLWkgInMjJHtS
RUNJUEVfU1lTUk9PVH0jI2ciDQo+ID4gJHtEfSR7bGliZGlyfS9jbWFrZS9UQkIvVEJCVGFyZ2V0
cy5jbWFrZQ0KPiA+ICB9DQo+ID4NCj4gPiArZG9faW5zdGFsbF9wdGVzdCgpIHsNCj4gPiArICAg
IGluc3RhbGwgLWQgJHtEfSR7UFRFU1RfUEFUSH0NCj4gPiArICAgIGluc3RhbGwgJHtCfS90ZXN0
L0NUZXN0VGVzdGZpbGUuY21ha2UgJHtEfSR7UFRFU1RfUEFUSH0vDQo+ID4gKyAgICBjcCAtcmYg
JHtCfS9nbnUqICR7RH0ke1BURVNUX1BBVEh9DQo+ID4gKyAgICBybSAtcmYgJHtEfSR7UFRFU1Rf
UEFUSH0vZ251Ki9saWJ0YmIqDQo+ID4gKyAgICBybSAtcmYgJHtEfSR7UFRFU1RfUEFUSH0vZ251
Ki8qLnNoDQo+ID4gKyAgICBzZWQgLWkgLWUgcyMke1N9IyR7UFRFU1RfUEFUSH0jZyBcDQo+ID4g
KyAgICAgICAgICAgLWUgcyMke0J9IyR7UFRFU1RfUEFUSH0jZyBcDQo+ID4gKyAgICAgICAgICAg
ICR7RH0ke1BURVNUX1BBVEh9L0NUZXN0VGVzdGZpbGUuY21ha2UNCj4gPiArfQ0KPiA+ICsNCj4g
Pg0KPiA+ICBCQkNMQVNTRVhURU5EID0gIm5hdGl2ZSBuYXRpdmVzZGsiDQo+ID4NCj4gPg0KPiA+
DQo+ID4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gPiBMaW5rczogWW91IHJlY2VpdmUgYWxs
IG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gPiBWaWV3L1JlcGx5IE9ubGluZSAoIzEy
NjUyNCk6DQo+ID4gaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVk
LWRldmVsL21lc3NhZ2UvMTI2NTI0DQo+ID4gTXV0ZSBUaGlzIFRvcGljOiBodHRwczovL2xpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcvbXQvMTE4OTM0MjM3LzYwODQ0NDUNCj4gPiBHcm91cCBPd25lcjog
b3BlbmVtYmVkZGVkLWRldmVsK293bmVyQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiBVbnN1
YnNjcmliZTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWRl
dmVsL3Vuc3ViDQo+ID4gW3NrYW5kaWdyYXVuQGdtYWlsLmNvbV0NCj4gPiAtPS09LT0tPS09LT0t
PS09LT0tPS09LQ0KPiA+DQoNCg==

